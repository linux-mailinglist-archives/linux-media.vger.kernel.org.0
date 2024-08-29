Return-Path: <linux-media+bounces-17108-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D30C8963E60
	for <lists+linux-media@lfdr.de>; Thu, 29 Aug 2024 10:27:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 1E294B2140A
	for <lists+linux-media@lfdr.de>; Thu, 29 Aug 2024 08:27:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 648AB18C03F;
	Thu, 29 Aug 2024 08:27:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="PAHVfl5S"
X-Original-To: linux-media@vger.kernel.org
Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010049.outbound.protection.outlook.com [52.101.229.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4ECED18C02A;
	Thu, 29 Aug 2024 08:27:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724920031; cv=fail; b=GhAUhd7fkivyJsg5fm5Nr0g4EUl6g2tfKinE3rerxiqymFQ9afWuxXfO6jQLQ8NpyngTWrrlFuiOP+2eldusj+WYjAEWUXlVbTnJjumiFT0UyCiwqW3GIICkn8YicYU2JvOqC3sT/jnY0C/7T1mTX2OAEc6NqPIBVtGF60wIXns=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724920031; c=relaxed/simple;
	bh=fHUO7r9ejpZjXUCFtLk988hOaZ+pVCSyLHNu9FYIKCI=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=H9FkhkyMLWQpVlp/RCIc6LOa9GkMD3vRKdrQ/JVIO52B+QEazla1TWXJZHFAXmQVSRs9oAj0vvBbKjWbnEouS0rKElIkGlSpRUBJAzKfLbcj70KVd6EthkJdZmouFYTTUN5tPcUh11I/JIgB/prsYJzBlk1PCFh6vDVpXsYXpm4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=PAHVfl5S; arc=fail smtp.client-ip=52.101.229.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jTH2mlhDHC6pc2lx15e7Si4Tq2WmFIXAQ9vR/bBHWC1a9i7L3JvpjAKIIWOlSEuHewtHze5Oah3qZlkOx13uiv3vAS2fq78fAEILIozEY0OdRhMbLuMVi/HqfhRhkqcjc3IKwMucyYWy/1X0oz70Jg4XY6W+QT2lAsRjWdShLZrXMIP85J6wcB3BC1pNwCipjLfb81Za2LoaTYpWipJmp12dGVvdN/5bVq723IwKpHZ47m2Z1YiPoMcXNFADR76379DTVOBFg+Z0FJ9A0wSoOptUpexuhDqPfaqpQL3ULDXoVaH4zlObpKrkHL/bF/FTkyYPXrAfPH+mYNVu7kjfUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ww8EXBhZuz3wz26irsZkr6QLEjD1mIf76z56MqaX9N8=;
 b=k71CghGTIux+FbHPeOC3qvWV6sWoTk8uQZMDNQ6seHKes43e0mrtPpD5f8m0zWWdyfMHkuF0v3vA5G/ng+j9aM/yt7B8q/8BH3uqzFkLH+w12atJWUfmcHOWHnRF4FajlbL2czzRgR0OsVARoQIK6owRVFgauctTcHDpZE9N7h2WyDJwbUT+B5UGwj6FYdhXkDO1zoYBRJZDIP03u9R9h1xRO4fC6LI/zXQI6loOlLWPjXzeMLYCR2n1OHBU2YKoXxwwnjgb3yZvbXM/dATcHLq7gR8oqNAyKglhxYmiWAubLiGHrZLnXyvXZvqLunFKcBBB1n+U+bSxoEdjT+HTEA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ww8EXBhZuz3wz26irsZkr6QLEjD1mIf76z56MqaX9N8=;
 b=PAHVfl5SqaGaetJBmaCNmo7YAMqb0af/go0OooTX/gq3/wtZ3Yz6KDL9Sf6M7GnPd+KJyZf9jU2FwhDzlyZAHFV7cE7wR3DxGZpHEcp8S42gLnfQtnZZeC1Ir4C16tJw7nbzmtsMP8uVJE5mLwAKN0dtcU1CED+1ip3iAkjoYpo=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by TYCPR01MB10380.jpnprd01.prod.outlook.com (2603:1096:400:240::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.28; Thu, 29 Aug
 2024 08:27:06 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1%6]) with mapi id 15.20.7897.027; Thu, 29 Aug 2024
 08:27:06 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Liao Chen <liaochen4@huawei.com>, "linux-tegra@vger.kernel.org"
	<linux-tegra@vger.kernel.org>, "linux-media@vger.kernel.org"
	<linux-media@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
CC: "hverkuil-cisco@xs4all.nl" <hverkuil-cisco@xs4all.nl>,
	"mchehab@kernel.org" <mchehab@kernel.org>, "thierry.reding@gmail.com"
	<thierry.reding@gmail.com>, "jonathanh@nvidia.com" <jonathanh@nvidia.com>,
	"jacopo@jmondi.org" <jacopo@jmondi.org>, "sakari.ailus@linux.intel.com"
	<sakari.ailus@linux.intel.com>, "laurent.pinchart@ideasonboard.com"
	<laurent.pinchart@ideasonboard.com>, "tomi.valkeinen@ideasonboard.com"
	<tomi.valkeinen@ideasonboard.com>
Subject: RE: [PATCH -next 1/3] media: v4l2-subdev: enable module autoloading
Thread-Topic: [PATCH -next 1/3] media: v4l2-subdev: enable module autoloading
Thread-Index: AQHa+enQR/vG0Du3hU2Pd5GM7nLk57I95i9Q
Date: Thu, 29 Aug 2024 08:27:06 +0000
Message-ID:
 <TY3PR01MB11346459841445E77A5FBA37B86962@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20240829075417.526459-1-liaochen4@huawei.com>
 <20240829075417.526459-2-liaochen4@huawei.com>
In-Reply-To: <20240829075417.526459-2-liaochen4@huawei.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|TYCPR01MB10380:EE_
x-ms-office365-filtering-correlation-id: 818d8509-c5ae-4701-4fc4-08dcc8045e46
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|366016|7416014|376014|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?drwa5TZ9jcJC4v9q2F/YFmIEBFjFdB0unf+uFuu4yeDv8aHMaK+oU1lLs7/U?=
 =?us-ascii?Q?AynmPogYIfIrRyoP5kl9T2Lp60VQRzEJ65LCAGqJkyr1clIQ/+76R7l7e99+?=
 =?us-ascii?Q?KONIm2DxpZcoQwkDSlXXhcMf7gSwteIonGmqVYAt6bFk7Cqkg3/RV54cTdVR?=
 =?us-ascii?Q?qg+y6WU95NfMMGI8RQNrjWpu+FueKPp2KxTYsgwcGNz5mEC1Nt6SB424qwHI?=
 =?us-ascii?Q?7RlkgnH8LmPyyoYQJ8fUTZQrbCrew/mtl3wyDV2J4hgN2ZyIwH1PZXmsoQ4F?=
 =?us-ascii?Q?juRaN+bWixs+A6FOxMi6TPejiUsxMfQn0oRryrZTC92ZvhgpgpzI80rhJCp+?=
 =?us-ascii?Q?hx+lMqUcuWbsSgsUNRYrf0yKRkqitnyiSH6PzYI5XoYXSURh10bqc4v7cFIf?=
 =?us-ascii?Q?bsT/RWcj/67vTLhVflSEavAokqlt3zCjNqmTYeJIz7NF+GIclrsil6v9JYMd?=
 =?us-ascii?Q?iy7o6ZeaM0r5DHGw7v7cVlJPAF6826ZxKOgiTtuYdDdtiX9NH5UKdg0kovv1?=
 =?us-ascii?Q?0TPA4AQoVMJA4AlNH11dpvQo2mT797Zx1v/TkCRRdxeXgmz3qzpf0PQ8TuAF?=
 =?us-ascii?Q?6ytz7wZmP2GYnweisP4eBHAYe/gQylUNiUP2l7Z8gf76SfyjL+yM3OhUDK4f?=
 =?us-ascii?Q?Wd2pFhk9kNIlAnHky+92L3gzrBe06ehIa0S2wkX3NFjJa85+2wU6+dLe9LoN?=
 =?us-ascii?Q?ZleFRgp2Fh0bC2N7qG/eiq+b32h+eAR+EJIeHuZnBVDdaFwvlWoE0ufAPVxY?=
 =?us-ascii?Q?Lz07dFS96PgTXeZafgWNYWyXETeUf0bgRY8O+JUmRJ11P6QUPbh4A94YCIZT?=
 =?us-ascii?Q?Db5mOshhOB6zuVATyhG9bOQnOXMjkSuQR8oRej2soXrLW01oAFRHAL7pqQ8T?=
 =?us-ascii?Q?y9MQs+hhD/TR/4efl06pu79s9r5akNPtsFsRosOzpCGgCOkmMPCQe0fEbKio?=
 =?us-ascii?Q?fDVObF1/G16pj4HcYhTFBfkCmDjb7/jI7V+LeviJgm9KlJHfRwqol+pzh3JO?=
 =?us-ascii?Q?0cMX6kI59WyG0K/h6l9kTx1fvATLlYb5o27W6Kvmqop8G/lUEaHvJ88gOh94?=
 =?us-ascii?Q?LOt91rSTQoZRbidFNfP1HO1re/BOCr7LRiImTM7mkzijYSRK0B7Zx4Km1maE?=
 =?us-ascii?Q?wwTzckHC7alflxd9/ZAveB4WNh2zwGW+UOqYv2UpvKQtVn0NqNJAt3DDgZgw?=
 =?us-ascii?Q?NL4/YZq/aDoVAU79GRjIFdgbbLmSeMyG0oa1wSlEzwOJyXbmfI0OJYPi48xT?=
 =?us-ascii?Q?DMwCmMxHGL5iUAO2ENZLiAfym5BnuQXoGxhLaHqTMgOh0mNLFJ/GQUkvPoUf?=
 =?us-ascii?Q?nCjftO+2rILzgMeh9a4iuEc+/r4jAhBCH+mDsSOL4HhG3T0Gj/t+z5oqMFaV?=
 =?us-ascii?Q?ZE3P+NgFAeZ+behkKm9Ei/eSBhvrTsmU7q2vtLSkZX+IPk0EjA=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?qSzMzQWyefG/eAcgTbsrjwjLHVtqgrGOGeaxVJ7VqFO6IQ7gu3PPQLvNuhcM?=
 =?us-ascii?Q?EwwalyZgg0QDH/WKn2BvbToztxY2fhpcYVOyCfnUErElZqSB41W2h58q2HIb?=
 =?us-ascii?Q?7DE77qgDKrwHVnnazLsMWNw1nPNMe69fSLGlHS0ucvo2xQqq77oV+BiiQrgF?=
 =?us-ascii?Q?QgyS4djUgjSsjVlcHX8L7djSQrBOUsqy9H+JjysdVBR9b+q+c7dUzaJZAE4F?=
 =?us-ascii?Q?gsaLbSzFhQPDNR8bZ283jQ1MLh/E4YC9ciq4x+PoEudisecE0uzf3mwvg54O?=
 =?us-ascii?Q?v3objrtyXTWUQyQr/JP5Yp3HDinCPLfi0kHbOBhjujD/jDHTmDWLXe5ZtWLG?=
 =?us-ascii?Q?5YXYJNKj+hs10jbocQVKwkETc3kYtsPKuVXXwXtXrFCEKbZIXkICO+Da2G0F?=
 =?us-ascii?Q?ZkZHiRxB9tCeqsmTP1f9iXFcm0B654aBDDZ3IVYUSpi9CMTyy4Wq9tCJme4O?=
 =?us-ascii?Q?+VLlOp8smozW20L+gLeVi3SlqKe6wuK/o7VtryeY4rYhF6fQepb+DRAmMCm4?=
 =?us-ascii?Q?ZDscOknO58NG1Nbc9cPsUhdIsklL5KGV55NZhqLjZR4WD6rqYwdmBduZeOq3?=
 =?us-ascii?Q?GT1mPyFzO4/5J/hQVbZWp6uoa20efvF6+PvrWE+3XlI/TVMzMgvxcj9oEafO?=
 =?us-ascii?Q?O8ZCcCf64ill/lBmW/+eCofhwL2cDB51PGyldBkODMXVkGuNdOu1P7TDeFl5?=
 =?us-ascii?Q?jzTWSLMtceT8Tt9DS194xXW8ZxF1ed+cH/A1CWGHYHdeDtWGG/EMx9hLYEJ0?=
 =?us-ascii?Q?0v0JAhfheEkxlAF1V4H8STUzltWjbOxOtuLk9ZO8wGsV1AWN7CyxCiqs9MnI?=
 =?us-ascii?Q?VGrvLQp1vAIA+vCUJpry+Gp0dVKqYIvZtfGZpYcIHRaRjAu02tVMQCR+caee?=
 =?us-ascii?Q?x8oAWjFvOetMUDKKXaBtfnkP6qSLbG8bY2YxmI/1tgIvobHgt94obLHQV1jF?=
 =?us-ascii?Q?k4Y1Rodq4pRZzxYCXelq0saZHZab2bPytuKR+s/6yAgOLt871c5Ezwlt5vTI?=
 =?us-ascii?Q?mVm+9wbY7su+Ln3JzM0kSzNsOSinI49y20mQ+RX+BKIEDtYnF2OkR2rGLiLH?=
 =?us-ascii?Q?VsE1LHpgbCZv/bxDfeorrKEr01A5QDYwv3gOLUTsJK9MCLv2BZzWMLadaWSN?=
 =?us-ascii?Q?f2K6FzS+sjFCqh7c7553m7nmPa/KpH2FzypmOBqXR2jQ27ax3S2cVktj2uiB?=
 =?us-ascii?Q?M2cUXzoH6rXsnilVNW/Md+dSjSqOpOibWIIkpzeqVE1tOVL0OW8FsGYxOD92?=
 =?us-ascii?Q?nN3gAObETbPrJpMsOAMsjjCihqLejpfEA7Mp+Z/fT5pEtC83A94cwnHXYh48?=
 =?us-ascii?Q?u21u2KgxpP6GpGed6V8D4on8psG0w4Yvxle/sgD1kpxnwdg11fhoRLiS5tMe?=
 =?us-ascii?Q?569sk6HvaG4vWnwv+2Esg11ishOH/vS715ot7bm2hK/B/XvN5bVT3ZflXp6K?=
 =?us-ascii?Q?uD+fTfYhSy1AS12wNQKw6pX3Zca9VeOTQc1FY9rrNFYGkpqnDQXduHf0X+Sc?=
 =?us-ascii?Q?MYgpcIOzSZ8nSpDG2aeiNz9zhaG3xr92XcqQvsX7CqA19hrqv1E04X+W9Lb+?=
 =?us-ascii?Q?vjQnc5i1i00EPPxqxGzLXN8ymiNF6k415i6BdeRLPTVEH26h5qx77lFUw6R2?=
 =?us-ascii?Q?1A=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11346.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 818d8509-c5ae-4701-4fc4-08dcc8045e46
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Aug 2024 08:27:06.6506
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: nlFfETiW70Mv/z8pbFM8i5lLrSaQKvjClX6JVUbnvzUY60mwNMWt3ahd92X6x/levj/OZCSOG4b89FuzhF3HLi65i/2BTHBp+hk8yQ7ElFE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB10380

Hi Liao Chen,

Thanks for the patch.

> -----Original Message-----
> From: Liao Chen <liaochen4@huawei.com>
> Sent: Thursday, August 29, 2024 8:54 AM
> Subject: [PATCH -next 1/3] media: v4l2-subdev: enable module autoloading

Commit header is wrong.

>=20
> Add MODULE_DEVICE_TABLE(), so modules could be properly autoloaded based =
on the alias from
> of_device_id table.
>=20
> Signed-off-by: Liao Chen <liaochen4@huawei.com>
> ---
>  drivers/media/i2c/mt9v111.c | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/drivers/media/i2c/mt9v111.c b/drivers/media/i2c/mt9v111.c in=
dex
> b0b98ed3c150..b6a2623798c5 100644
> --- a/drivers/media/i2c/mt9v111.c
> +++ b/drivers/media/i2c/mt9v111.c
> @@ -1265,6 +1265,7 @@ static const struct of_device_id mt9v111_of_match[]=
 =3D {
>  	{ .compatible =3D "aptina,mt9v111", },
>  	{ /* sentinel */ },

Nit: Comma can be dropped from terminator entry as a separate patch.

Cheers,
Biju

>  };
> +MODULE_DEVICE_TABLE(of, mt9v111_of_match);
>=20
>  static struct i2c_driver mt9v111_driver =3D {
>  	.driver =3D {
> --
> 2.34.1


