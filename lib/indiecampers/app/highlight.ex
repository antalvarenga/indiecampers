defmodule Indiecampers.App.Highlight do
  use Ecto.Schema
  import Ecto.Changeset

  schema "highlights" do
    field :address, :string
    field :city, :string
    field :latitude, :float
    field :longitude, :float
    field :name, :string
    field :website, :string
    field :country, :string
    field :description, :string

    timestamps()
  end

  @doc false
  def changeset(highlight, attrs) do
    highlight
    |> cast(attrs, [
      :name,
      :latitude,
      :longitude,
      :address,
      :city,
      :website,
      :country,
      :description
    ])
    |> validate_required([:name, :latitude, :longitude])
  end

  # Has a list of Highlight structs
  def print_data do
    Enum.each(data(), fn poi ->
      IO.puts("#{poi.longitude},#{poi.latitude}")
    end)
  end

  def data do
    [
      %{
        address: "",
        city: "Lisbon",
        latitude: 38.7623946,
        longitude: -9.0923168,
        name: "Telecabina Lisboa",
        website: "www.telecabinelisboa.pt",
        country: "Portugal",
        description: ""
      },
      %{
        address: "",
        city: "",
        latitude: 38.7229876,
        longitude: -7.9845437,
        name: "Monumento à Tapeteira",
        website: "",
        country: "Portugal",
        description: ""
      },
      %{
        address: "",
        city: "",
        latitude: 37.4803084,
        longitude: -8.1330526,
        name: "Mesas do Castelinho",
        website: "",
        country: "Portugal",
        description: ""
      },
      %{
        address: "",
        city: "",
        latitude: 40.560267,
        longitude: -7.865267,
        name: "Pelourinho de Vilar Seco",
        website: "",
        country: "Portugal",
        description: ""
      },
      %{
        address: "",
        city: "",
        latitude: 42.8587734,
        longitude: -7.779881,
        name: "Antiguo Hospital de Peregrinos",
        website: "",
        country: "Spain",
        description: ""
      },
      %{
        address: "",
        city: "Salamanca",
        latitude: 40.9610214,
        longitude: -5.6663369,
        name: "Astronauta",
        website: "",
        country: "Spain",
        description: ""
      },
      %{
        address: "",
        city: "",
        latitude: 36.5310141,
        longitude: -6.2973342,
        name: "Plaza de Topete",
        website: "",
        country: "Spain",
        description: ""
      },
      %{
        address: "",
        city: "",
        latitude: 37.1575656,
        longitude: -3.0651679,
        name: "Castillo de la Caba",
        website: "",
        country: "Spain",
        description: ""
      },
      %{
        address: "",
        city: "",
        latitude: 38.918135,
        longitude: -1.7268303,
        name: "Cueva de la Pocha",
        website: "",
        country: "Spain",
        description: ""
      },
      %{
        address: "",
        city: "",
        latitude: 38.66027,
        longitude: -0.0950869,
        name: "Fuentes del Algar",
        website: "",
        country: "Spain",
        description: ""
      },
      %{
        address: "",
        city: "",
        latitude: 40.9473119,
        longitude: -3.0878,
        name: "Palacio Ducal",
        website: "",
        country: "Spain",
        description: ""
      },
      %{
        address: "",
        city: "",
        latitude: 43.0262668,
        longitude: -3.7992418,
        name: "La Mujer Desnuda",
        website: "",
        country: "Spain",
        description: ""
      },
      %{
        address: "",
        city: "",
        latitude: 42.9985232,
        longitude: -0.8410792,
        name: "Kakueta",
        website: "",
        country: "France",
        description: ""
      },
      %{
        address: "",
        city: "",
        latitude: 41.6208272,
        longitude: -0.7087137,
        name: "Toro Osborne",
        website: "",
        country: "Spain",
        description: ""
      },
      %{
        address: "",
        city: "",
        latitude: 40.623468,
        longitude: 0.5859158,
        name: "Torre Guardiola",
        website: "",
        country: "Spain",
        description: ""
      },
      %{
        address: "",
        city: "",
        latitude: 41.2220909,
        longitude: 1.5227864,
        name: "Fuente de San Germán",
        website: "",
        country: "Spain",
        description: ""
      },
      %{
        address: "",
        city: "",
        latitude: 38.705452,
        longitude: -4.8945343,
        name: "Palacio de Moret",
        website: "",
        country: "Spain",
        description: ""
      },
      %{
        address: "",
        city: "",
        latitude: 43.3012155,
        longitude: 2.284633,
        name: "Plaine de Montolieu",
        website: "",
        country: "France",
        description: ""
      },
      %{
        address: "",
        city: "",
        latitude: 44.6191577,
        longitude: 3.2842254,
        name: "Vallée de l'Enfer",
        website: "",
        country: "France",
        description: ""
      },
      %{
        address: "",
        city: "",
        latitude: 43.9139183,
        longitude: 5.4967193,
        name: "Le Sahara",
        website: "",
        country: "France",
        description: ""
      },
      %{
        address: "",
        city: "",
        latitude: 45.9434351,
        longitude: -1.28856,
        name: "Les Jardins de la Boirie",
        website: "",
        country: "France",
        description: ""
      },
      %{
        address: "",
        city: "",
        latitude: 46.5892762,
        longitude: 1.9856974,
        name: "Vieille Fontaine à pompe du 19ème siècle",
        website: "",
        country: "France",
        description: ""
      },
      %{
        address: "",
        city: "",
        latitude: 46.1819139,
        longitude: 6.9002354,
        name: "Lac de Soi",
        website: "",
        country: "Switzerland",
        description: ""
      },
      %{
        address: "",
        city: "",
        latitude: 45.5821784,
        longitude: 0.749122,
        name: "Cadran solaire",
        website: "",
        country: "France",
        description: ""
      },
      %{
        address: "",
        city: "",
        latitude: 46.4510246,
        longitude: 4.1224843,
        name: "Sainte-Marguerite-Marie",
        website: "",
        country: "France",
        description: ""
      },
      %{
        address: "",
        city: "",
        latitude: 47.5570727,
        longitude: -0.7996642,
        name: "Wagonnet minier",
        website: "",
        country: "France",
        description: ""
      },
      %{
        address: "",
        city: "",
        latitude: 48.4018726,
        longitude: -4.0785756,
        name: "Pont remarquable",
        website: "",
        country: "France",
        description: ""
      },
      %{
        address: "",
        city: "",
        latitude: 49.1776839,
        longitude: -0.3164933,
        name: "Ancienne locomotive",
        website: "",
        country: "France",
        description: ""
      },
      %{
        address: "",
        city: "",
        latitude: 48.4025933,
        longitude: 2.6980639,
        name: "Aile des Ministres",
        website: "",
        country: "France",
        description: ""
      },
      %{
        address: "",
        city: "",
        latitude: 50.7248108,
        longitude: 1.6135199,
        name: "Ville Fortifiée",
        website: "",
        country: "France",
        description: ""
      },
      %{
        address: "",
        city: "",
        latitude: 48.266112,
        longitude: 7.7219462,
        name: "Europa Park",
        website: "",
        country: "Germany",
        description: ""
      },
      %{
        address: "",
        city: "",
        latitude: 48.5167326,
        longitude: 5.7496995,
        name: "Foumillière",
        website: "",
        country: "France",
        description: ""
      },
      %{
        address: "",
        city: "",
        latitude: 49.9423097,
        longitude: 4.0894077,
        name: "Cascade de Blangy",
        website: "",
        country: "France",
        description: ""
      },
      %{
        address: "",
        city: "",
        latitude: 44.8376698,
        longitude: 9.099813,
        name: "Lino allevamento cabannina",
        website: "",
        country: "Italy",
        description: ""
      },
      %{
        address: "",
        city: "",
        latitude: 45.0588945,
        longitude: 7.5069954,
        name: "Stele Romana",
        website: "",
        country: "Italy",
        description: ""
      },
      %{
        address: "",
        city: "",
        latitude: 45.8691666,
        longitude: 10.8944809,
        name: "Massi delle Traole",
        website: "",
        country: "Italy",
        description: ""
      },
      %{
        address: "",
        city: "",
        latitude: 44.5389189,
        longitude: 11.5349927,
        name: "Torre Nord-Ovest",
        website: "",
        country: "Italy",
        description: ""
      },
      %{
        address: "",
        city: "",
        latitude: 43.052696,
        longitude: 11.8215803,
        name: "Laghetto",
        website: "",
        country: "Italy",
        description: ""
      },
      %{
        address: "",
        city: "",
        latitude: 42.0352399,
        longitude: 12.1273336,
        name: "Cascata di Castel Giuliano",
        website: "",
        country: "Italy",
        description: ""
      },
      %{
        address: "",
        city: "",
        latitude: 41.5984532,
        longitude: 14.7552584,
        name: "Tempio Sannitico",
        website: "",
        country: "Italy",
        description: ""
      },
      %{
        address: "",
        city: "",
        latitude: 40.4132151,
        longitude: 15.4172435,
        name: "Castello della Mezzana",
        website: "",
        country: "Italy",
        description: ""
      },
      %{
        address: "",
        city: "",
        latitude: 39.9128008,
        longitude: 16.280117,
        name: "Occhio di S. Anna",
        website: "",
        country: "Italy",
        description: ""
      },
      %{
        address: "Piazza Vittorio Emanuele 72014 2",
        city: "",
        latitude: 40.7415843,
        longitude: 17.4264889,
        name: "Torre dell'Orologio",
        website: "",
        country: "Italy",
        description: ""
      },
      %{
        address: "",
        city: "",
        latitude: 38.7870204,
        longitude: 16.5166348,
        name: "Ponte del Diavolo",
        website: "",
        country: "Italy",
        description: ""
      },
      %{
        address: "",
        city: "",
        latitude: 37.9445514,
        longitude: 14.8692334,
        name: "Acquasanta",
        website: "",
        country: "Italy",
        description: ""
      },
      %{
        address: "",
        city: "",
        latitude: 37.3241533,
        longitude: 14.7679358,
        name: "Sito archeologico Eremo di Santa Febronia",
        website: "",
        country: "Italy",
        description: ""
      },
      %{
        address: "",
        city: "",
        latitude: 37.8043222,
        longitude: 12.4342092,
        name: "Bastione San Francesco",
        website: "",
        country: "Italy",
        description: ""
      },
      %{
        address: "",
        city: "",
        latitude: 39.3678734,
        longitude: 8.8050658,
        name: "Terme Romane di Santa Maria",
        website: "",
        country: "Italy",
        description: ""
      },
      %{
        address: "",
        city: "",
        latitude: 40.6497693,
        longitude: 9.3292572,
        name: "S'abbadolzu",
        website: "",
        country: "Italy",
        description: ""
      },
      %{
        address: "",
        city: "",
        latitude: 41.6557188,
        longitude: 8.9811095,
        name: "Spin' a Cavallu",
        website: "",
        country: "France",
        description: ""
      },
      %{
        address: "",
        city: "",
        latitude: 42.6215697,
        longitude: 8.8811566,
        name: "Plage de Davia",
        website: "",
        country: "France",
        description: ""
      },
      %{
        address: "",
        city: "",
        latitude: 47.2262109,
        longitude: 11.5067187,
        name: "Barfusssteig",
        website: "",
        country: "Austria",
        description: ""
      },
      %{
        address: "",
        city: "",
        latitude: 47.1836947,
        longitude: 9.3168786,
        name: "Klangmühle",
        website: "",
        country: "Switzerland",
        description: ""
      },
      %{
        address: "",
        city: "",
        latitude: 46.9488646,
        longitude: 7.4529263,
        name: "Lenbrunnen",
        website: "",
        country: "Switzerland",
        description: ""
      },
      %{
        address: "",
        city: "",
        latitude: 49.404213,
        longitude: 10.7892086,
        name: "Gelber Löwe",
        website: "",
        country: "Germany",
        description: ""
      },
      %{
        address: "",
        city: "",
        latitude: 49.4700676,
        longitude: 8.1484616,
        name: "Opferstein",
        website: "",
        country: "Germany",
        description: ""
      },
      %{
        address: "",
        city: "",
        latitude: 51.1912916,
        longitude: 7.1114452,
        name: "Bergisches Straßenbahnmuseum",
        website: "",
        country: "Germany",
        description: ""
      },
      %{
        address: "",
        city: "",
        latitude: 51.4505051,
        longitude: 10.6563216,
        name: "Osterfeuer",
        website: "",
        country: "Germany",
        description: ""
      },
      %{
        address: "",
        city: "",
        latitude: 51.2108111,
        longitude: 14.3906021,
        name: "Schwesternhäuser Kleinwelka",
        website: "",
        country: "Germany",
        description: ""
      },
      %{
        address: "",
        city: "",
        latitude: 53.2282866,
        longitude: 8.2134386,
        name: "Haus Reitmeyer",
        website: "",
        country: "Germany",
        description: ""
      },
      %{
        address: "",
        city: "",
        latitude: 52.9467451,
        longitude: 12.1262261,
        name: "Totem",
        website: "",
        country: "Germany",
        description: ""
      },
      %{
        address: "",
        city: "",
        latitude: 53.5169057,
        longitude: 15.7492491,
        name: "Spichlerz proj. Waltera Gropiusa",
        website: "",
        country: "Poland",
        description: ""
      },
      %{
        address: "",
        city: "",
        latitude: 54.4450126,
        longitude: 13.124994,
        name: "Haasenburg",
        website: "",
        country: "Germany",
        description: ""
      },
      %{
        address: "",
        city: "",
        latitude: 51.4411372,
        longitude: 3.5779635,
        name: "Het Arsenaal",
        website: "",
        country: "Belgium",
        description: ""
      },
      %{
        address: "",
        city: "",
        latitude: 50.7390735,
        longitude: 4.7614869,
        name: "Ferme de la Chise",
        website: "",
        country: "Belgium",
        description: ""
      },
      %{
        address: "",
        city: "",
        latitude: 52.6252835,
        longitude: 4.7331302,
        name: "Bloemenklok",
        website: "",
        country: "Netherlands",
        description: ""
      },
      %{
        address: "",
        city: "",
        latitude: 55.4901339,
        longitude: 9.4733281,
        name: "Borchs Gård",
        website: "",
        country: "Denmark",
        description: ""
      },
      %{
        address: "",
        city: "",
        latitude: 57.1403773,
        longitude: 9.2547389,
        name: "Fjerritslev planetarium (Pluto)",
        website: "",
        country: "Denmark",
        description: ""
      },
      %{
        address: "",
        city: "",
        latitude: 51.6088923,
        longitude: 16.8576687,
        name: "Rawicz Rynek Ratusz",
        website: "",
        country: "Poland",
        description: ""
      },
      %{
        address: "",
        city: "",
        latitude: 50.1952852,
        longitude: 14.6747238,
        name: "Tramvaj",
        website: "",
        country: "Czech Republic",
        description: ""
      },
      %{
        address: "",
        city: "",
        latitude: 49.9322621,
        longitude: 17.9714522,
        name: "Statek Dafesta",
        website: "",
        country: "Czech Republic",
        description: ""
      },
      %{
        address: "",
        city: "",
        latitude: 48.4464019,
        longitude: 15.789675,
        name: "Feuersbrunner Kellergasse",
        website: "",
        country: "Austria",
        description: ""
      },
      %{
        address: "",
        city: "",
        latitude: 47.4372755,
        longitude: 14.4668635,
        name: "Barefoot way",
        website: "",
        country: "Austria",
        description: ""
      },
      %{
        address: "",
        city: "",
        latitude: 48.4088966,
        longitude: 18.2159192,
        name: "Mravenisko",
        website: "",
        country: "Slovakia",
        description: ""
      },
      %{
        address: "",
        city: "",
        latitude: 48.8782975,
        longitude: 20.7408719,
        name: "Banský vláčik",
        website: "",
        country: "Slovakia",
        description: ""
      },
      %{
        address: "",
        city: "",
        latitude: 47.273383,
        longitude: 20.45725,
        name: "Kemence",
        website: "",
        country: "Hungary",
        description: ""
      },
      %{
        address: "",
        city: "",
        latitude: 46.201115,
        longitude: 18.1064353,
        name: "Land of Fairies",
        website: "",
        country: "Hungary",
        description: ""
      },
      %{
        address: "",
        city: "",
        latitude: 46.109186,
        longitude: 14.7097236,
        name: "Jurij Vega",
        website: "",
        country: "Slovenia",
        description: ""
      },
      %{
        address: "",
        city: "",
        latitude: 45.4719465,
        longitude: 17.2727037,
        name: "Grašar",
        website: "",
        country: "Croatia",
        description: ""
      },
      %{
        address: "",
        city: "",
        latitude: 43.878768,
        longitude: 15.1803471,
        name: "Lojišcé Beach",
        website: "",
        country: "Croatia",
        description: ""
      },
      %{
        address: "",
        city: "",
        latitude: 57.3816812,
        longitude: -4.3777614,
        name: "Abriachan Gardens",
        website: "http://lochnessgarden.com",
        country: "Scotland",
        description: ""
      },
      %{
        address: "Kirkwynd D8 1RT 6",
        city: "Glamis",
        latitude: 56.610447,
        longitude: -3.000991,
        name: "St Fergus' Well",
        website: "http://lochnessgarden.com",
        country: "Scotland",
        description: "8th century religious centre"
      },
      %{
        address: "",
        city: "",
        latitude: 55.7309785,
        longitude: -4.8943512,
        name: "Hunterston Rock",
        website: "",
        country: "Scotland",
        description: ""
      },
      %{
        address: "",
        city: "",
        latitude: 55.5735747,
        longitude: -2.6581833,
        name: "Scottish Borders Donkey Sanctuary",
        website: "",
        country: "Scotland",
        description: ""
      },
      %{
        address: "",
        city: "",
        latitude: 54.8034019,
        longitude: -1.7437104,
        name: "Potter's Tropical Village",
        website: "",
        country: "England",
        description: ""
      },
      %{
        address: "",
        city: "",
        latitude: 53.4010623,
        longitude: -2.9753943,
        name: "Chun Alley",
        website: "",
        country: "England",
        description: ""
      },
      %{
        address: "",
        city: "",
        latitude: 52.5059141,
        longitude: -4.0562205,
        name: "Petrified Forest",
        website: "",
        country: "Wales",
        description: ""
      },
      %{
        address: "",
        city: "",
        latitude: 52.6228218,
        longitude: 0.4044156,
        name: "Church Farm Rare Breeds Centre",
        website: "",
        country: "England",
        description: ""
      },
      %{
        address: "",
        city: "",
        latitude: 51.3291569,
        longitude: -0.4269218,
        name: "Ice House",
        website: "",
        country: "England",
        description: ""
      },
      %{
        address: "",
        city: "",
        latitude: 50.4725717,
        longitude: -4.5561941,
        name: "Carnglaze Cavern",
        website: "",
        country: "England",
        description: ""
      },
      %{
        address: "Lanyon Quay BT1 3LG 1",
        city: "Belfast",
        latitude: 54.5986086,
        longitude: -5.9204911,
        name: "Belfast Barge",
        website: "",
        country: "Northern Ireland",
        description: ""
      },
      %{
        address: "",
        city: "",
        latitude: 53.3521307,
        longitude: -6.2730499,
        name: "Hungry Tree",
        website: "",
        country: "Ireland",
        description: ""
      },
      %{
        address: "",
        city: "",
        latitude: 53.0654003,
        longitude: -9.1496649,
        name: "Gleninshing portal tomb",
        website: "",
        country: "Ireland",
        description: ""
      },
      %{
        address: "",
        city: "",
        latitude: 51.9008751,
        longitude: -8.8515972,
        name: "Carrigadrohid Castle",
        website: "",
        country: "Ireland",
        description: ""
      },
      %{
        address: "",
        city: "",
        latitude: 51.7112557,
        longitude: -2.2349072,
        name: "The Convent of Poor Clares",
        website: "",
        country: "England",
        description: ""
      },
      %{
        address: "",
        city: "",
        latitude: 53.2222758,
        longitude: -1.6057232,
        name: "Pinetum",
        website: "",
        country: "England",
        description: ""
      },
      %{
        address: "",
        city: "",
        latitude: 53.3261154,
        longitude: -7.9867065,
        name: "Clonmacnoise",
        website: "",
        country: "Ireland",
        description: ""
      },
      %{
        address: "",
        city: "",
        latitude: 54.3278414,
        longitude: -9.3482959,
        name: "Dun Briste Sea Stack",
        website: "",
        country: "Ireland",
        description: ""
      }
    ]
  end
end
