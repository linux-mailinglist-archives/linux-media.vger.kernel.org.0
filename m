Return-Path: <linux-media+bounces-25103-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 56D33A18B2C
	for <lists+linux-media@lfdr.de>; Wed, 22 Jan 2025 06:00:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8C54016A6CD
	for <lists+linux-media@lfdr.de>; Wed, 22 Jan 2025 05:00:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 31BDD145FE0;
	Wed, 22 Jan 2025 05:00:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="SeEus9T9"
X-Original-To: linux-media@vger.kernel.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12on2075.outbound.protection.outlook.com [40.107.243.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A068188906;
	Wed, 22 Jan 2025 05:00:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.243.75
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737522010; cv=fail; b=dswXadWfJsKj/b/bkUJ+QwYkMTBNkHkGDrNkVKL4L7rcPAyZTTqbfWAbfs27fSBcMpyz5iO1AyTRcENHUxsDss9i6MOWml31KNvS1Jr/cHfpR7B/Vz2WBaQCOGkivgGHFBJ8QJyHp1EC8ONRkGVnCyzSYsxYZ1UNdYsqs3CFHkU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737522010; c=relaxed/simple;
	bh=k0FTtVYMHEr46icUk+G2bkEUs6wExnU6hXbIFfRK5Mk=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=oatYN0ASzWM2V+LPsGyzgah3EvZ83E9yuyUSqz6bpROYiXLjG+JlGOqgxBGKZcPYukHC9WBvCjmotlfKQAEdXVVF0inyv517QBUAATHJ4CHduQMW31c/3DzQo2Mt1B0tpjOJF4NEjlXRjyck6d0iK8mKF+wkKrnofpqsk3D6ImQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com; spf=pass smtp.mailfrom=microchip.com; dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b=SeEus9T9; arc=fail smtp.client-ip=40.107.243.75
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=microchip.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mWiFVWCAmc58rL5c6Tu8+Aocjf914Ys3eO/7vkkCDd9UagtFNuuY2bDXes5G2zaelB2t7hAxS6sCGSxLCNniDtWNsi3ivF0yTwvQ84sAWfP2zjgl6Nq3AOwPPVgKZyEUOCP77nUuztdNsXu9/ojhP1X8VyO4M5Y1NgKdhtsgaavMGng8l/UHJxzPi+WhtrwVE/5vw38mUDIhz1rjfdqbn9zF+rD3ofLTWNw+R0NiApI7k2ixI+s7AmpFIA6yS1nAFtwS/UsZ3na+rP21rurnvbx0mK8t3jzmOjX9NgqcSzXGm7cYyvFqapArYEwnW9BVECP+Kb18BgKMGp2TFGsmRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cBXAn6Xa9k5o9Qn7pfekuHsjNYT/MW25arl+YGp9JW0=;
 b=ecB5QfGOf6TN58sEBHiU8ZIimppf/weQYu82duF1k+3SrjO5tpWMGO+zPlRq3nx4Z4Zt0k+vt5oPyefEZjYdwoNBqeQGobiLSs3C9U7Y0rvooflBKFs8SetALbzDB2wLLLNQ9crHmcjh3micOmNfNOZDg2PsgkgA9epmar/0fLM1EbR9i1F/+q6cLDLWoRI0uL8XyqFKbATT2qM7XCkcFcCxRfoOHvhUrZEHoAvXTanyKXxuEX3w+fqLfdcWPQQiURiCmybjtn+r1scsJwPJ/Al8j99ybvR3Gfz1kmgIBiOFm2qHiG1DBlt618YnKneNsZG/lgzfdqPvFejecU9Ujg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=microchip.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cBXAn6Xa9k5o9Qn7pfekuHsjNYT/MW25arl+YGp9JW0=;
 b=SeEus9T9QKtvqb54RaP4liF0t+OpQFJdlWHVcwU8Qlg+0GHgfF65yhqR3VC/iXFMaEa11j+n0x8ygR1eKm6dW/cvVRiYfsA6M8T5b5aHwikGUV4wkiJkYElOT6hY4YnARneA5hAuyBwIhHNvviojztlBAxhB5MsGx07UBPZKtoUKSR8S0UeCInmxZLxizQWheM6ZVRDDOj0InJBjRA4fLULBphMEv5zuznPGb/nuYWmpNiG7kSoMGHNithy0UD/yUeO0lgdX7gRIQ2gRoM3+6AD77HRImPVy/TB5o4h5IhZ+HOVTHUlC9Ceuv4jOadyX2CKfUpgauKsewkTCYvIKuw==
Received: from PH0PR11MB5611.namprd11.prod.outlook.com (2603:10b6:510:ed::9)
 by SN7PR11MB6876.namprd11.prod.outlook.com (2603:10b6:806:2a7::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8356.21; Wed, 22 Jan
 2025 05:00:04 +0000
Received: from PH0PR11MB5611.namprd11.prod.outlook.com
 ([fe80::9ea3:51c1:edff:4d3a]) by PH0PR11MB5611.namprd11.prod.outlook.com
 ([fe80::9ea3:51c1:edff:4d3a%5]) with mapi id 15.20.8356.020; Wed, 22 Jan 2025
 05:00:04 +0000
From: <Shravan.Chippa@microchip.com>
To: <git@apitzsch.eu>, <kieran.bingham@ideasonboard.com>,
	<mchehab@kernel.org>, <sakari.ailus@linux.intel.com>
CC: <linux-media@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<Conor.Dooley@microchip.com>, <Valentina.FernandezAlanis@microchip.com>,
	<Praveen.Kumar@microchip.com>
Subject: RE: [PATCH] media: i2c: imx334: Add support for 1280x720 & 640x480
 resolutions
Thread-Topic: [PATCH] media: i2c: imx334: Add support for 1280x720 & 640x480
 resolutions
Thread-Index: AQHbQkTIPxYyxEjwLka8mA0pYVbNjbLOJ2eAgARFGcCAOBAcAIAYEJEQ
Date: Wed, 22 Jan 2025 05:00:03 +0000
Message-ID:
 <PH0PR11MB5611FD22CF6E12F7226FA9C081E12@PH0PR11MB5611.namprd11.prod.outlook.com>
References: <20241129100036.193456-1-shravan.chippa@microchip.com>
	 <173288149590.1143262.2853735316281702828@ping.linuxembedded.co.uk>
	 <PH0PR11MB56115FC9509C549928E5E3E581352@PH0PR11MB5611.namprd11.prod.outlook.com>
 <6bf23034f42cf6bfa183fecdda63d22561dc0368.camel@apitzsch.eu>
In-Reply-To: <6bf23034f42cf6bfa183fecdda63d22561dc0368.camel@apitzsch.eu>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR11MB5611:EE_|SN7PR11MB6876:EE_
x-ms-office365-filtering-correlation-id: c2eaa988-7748-454e-afb8-08dd3aa1a203
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB5611.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|376014|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?mARlhSOBTMfwaUYCOjKkRlzCEKpDUoZ+4T7jjzRyqRjKYt7DPuUhKXzpuf?=
 =?iso-8859-1?Q?joPe+8mnoq3pso3h1TStLXBJ9ZimJOVKe09gKYsqut/j/P54j2eg9VlPGe?=
 =?iso-8859-1?Q?yTqx6teh7AXBXLH/aKCNhN1DPE/QOk3FFJCgeCGLRBZFV7jy/wPWTQmJ/X?=
 =?iso-8859-1?Q?tVak6mDHcNU+RWHu9TQnu+l5EUPNivMHGekEjxbVfj/S1aZgFtHXthdUSt?=
 =?iso-8859-1?Q?6F4V2SyD+xhUwualK8aMUMPBtw9Z3yaiDymk7/Rm3+y7EiwnVKnHyT3aCL?=
 =?iso-8859-1?Q?8JzO8Ilv8X5P0pdZ9O9drY3KEkJA91DalF8IdUdw4YArrWvYe7sHyaSahb?=
 =?iso-8859-1?Q?nuZkIPhuKIyCJxA57TG0cMYp2rVkXHGnXO5tjcEDg3PX2Xm12riOUzPHfm?=
 =?iso-8859-1?Q?kX92YsFHyiafnII/aaP7wuE4USA/npDcXLvSaBtrh9TZSDGugETCKWREDy?=
 =?iso-8859-1?Q?RwiHzfUQU0LuyrKIhz4khai0cBnbBfWNGIdl+PWGjvsIyq3D97nu+7czbR?=
 =?iso-8859-1?Q?vuUV+L6QljxRn5iyUhx1i9tkxXY4OZC0kmemK3msgM2tOea0sxJ4DMbO8Q?=
 =?iso-8859-1?Q?WENu+1RA5vxsMpNRSl6XG88UCx6xhEW4DEHRJFdBgtx84Bb/I1NMpForxg?=
 =?iso-8859-1?Q?3CJYVWCsiB3h3NPMWbuhf5T1aQNi0a1kTqmrCDhDkw3SLS0XhPQEk529UB?=
 =?iso-8859-1?Q?9KTBEXyhWaLzlBiYJHswwE2npHpCHIn9csSnUuD8H+7+//+2E/0v9c41pd?=
 =?iso-8859-1?Q?CNMMkVmkKYAJShefcH3pb0fGhBSQdOqHa+YMUG/h/C0Th+goBwU6U8TM6J?=
 =?iso-8859-1?Q?tfjn+VusdBzshpvOapBgrhkIEJPL6L/skI1HoHCwzIpefCXciNoXAB8YGc?=
 =?iso-8859-1?Q?/ahtIsrwjo1pZKL52dUMbrZmJjNQ+mu5vqawvu3GXPVXd5t/L9LagIm65F?=
 =?iso-8859-1?Q?W1Zlc7Sw8lAJoOX05rRpUVuSUSe6ZrCwVT/QU0Ua2MaGbTYJfe5u10pf4I?=
 =?iso-8859-1?Q?W9+ANiI5nCwSwDC//4447O4CKgaohjuaMGM89NsoausZylLrQoMguVil79?=
 =?iso-8859-1?Q?O6WYs71lUS7nCwYHFhmdrYXnsiN4LiIA4NYhYLdsbZCZ6X84xwTmhZUlQ4?=
 =?iso-8859-1?Q?I0AWnM/L2uhdxOkJJW34fjjv1VYz7r+m7FDxrtjzqag0auzsId2SuLk/8U?=
 =?iso-8859-1?Q?uudAFXov/tdSPNGhLReruWkLwjMaVIyXaa9rdq6+aezV8iIWPcRsThG5A5?=
 =?iso-8859-1?Q?ifQxRLuc1dxGXw6XQ6fVCR074PXsAWfocU6ZSd0CBCnMFEGuoPLi3khDhO?=
 =?iso-8859-1?Q?pdTZanlbOe/R8Wyby4avEcA0QDxCqRmdUB2HxBEMNOmAhOFWhn7md60nxu?=
 =?iso-8859-1?Q?Rsj6hfZr7Qe26+gHfRzRPOwCfK/95BtJFZ2w3IQ9jqKpwesrdR1gZENBZF?=
 =?iso-8859-1?Q?c/ag6ZPci5qztiXBb4oaOla9YyMyLMaCjOF9ew=3D=3D?=
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?tD0xbYrNV81eKE4L2FfuCpCbxp/Z9JTD/1RrdcZRft4O9gvFaYMYGVg165?=
 =?iso-8859-1?Q?PEPLjQg+GisKKEYAyQplNqZ54m0NecEbfg6bD8YNauyHPp6x/QyUvYOstf?=
 =?iso-8859-1?Q?TNlTg2/HH4h1PCKdnE7SQaljeU9tpVII4ZJVV272wi1NZ5Z5EHZ4ZPxtU3?=
 =?iso-8859-1?Q?3ceyskbfd2oXhV+nI9K/Z+RyWNaFvAkfEpb5hdnTy7GVoiJZrUOS7qg/6Y?=
 =?iso-8859-1?Q?5NJN1LWKvXo87iSqqJmrMux4fAaZ7+3A6Waaayku29n2p0M2I3w1V0M+p1?=
 =?iso-8859-1?Q?W2KZRxjN3uWcgFr2uCG5/hjHQ99aCkVX8QPqAp+M1Yu01qfhQVWAO4Sby/?=
 =?iso-8859-1?Q?nHQnY7gIDo0QdriVzBy17ySTcUXOD3tZE3Dy+bepa5BjsDZSQegNZg7ct0?=
 =?iso-8859-1?Q?tfi19bjzcuI050PSWlDbnIwKMTGDRQ+Ed2QAzjNdbdzqQ3Um8YZ56AAnsW?=
 =?iso-8859-1?Q?5PQRO1pZYyGAA9NcsECS66J/N6erZJKeMPRqka5jfppuQEA+3VWVuZ2Pbk?=
 =?iso-8859-1?Q?PLOJNGGRwdlzHhydglFJfuwXAxuBn07pyyqeShPgio6Sxd1ecuo3HraI8g?=
 =?iso-8859-1?Q?KTGOGtA7+Vj7TSezipTLsbtz9uqd7L8EiG4B6v4kuA7fC10m7rSImoklSJ?=
 =?iso-8859-1?Q?KSUuiPb/nauVrAHwexEtAbDgTLg2DykwGNoV1bVPAwvBVweQU3rHYknGAU?=
 =?iso-8859-1?Q?aBa9bOZkZNxVn1o3fs02B8mXVU8N9AoZU1NpMt/lKYC6wQJ1rKhRcVoag6?=
 =?iso-8859-1?Q?BMYZMBPXLhNamMkNFwXfMCCIrhRhBe77TUByd0glY+csMGA3KpRk6+xC/r?=
 =?iso-8859-1?Q?aj1iIXgn+5IZSy5syboISDVrmNbi7GmzMgaJMGJ6gwp8MNMT0v8MhEF4ZQ?=
 =?iso-8859-1?Q?Ouad1hJ0A2Q20ohlksdkzvUiJMyPf3OXNeljcWSVR5V4U2KTdewh0/Ja9M?=
 =?iso-8859-1?Q?tJsrLgOENVs21NdQQ1pmWUoXZLPy2qg4BkhnCK/9lbF8H6Pk49h1s928xy?=
 =?iso-8859-1?Q?5nHw06QC/+ZFuyfQkxlkIZHPcy4jSkfkL8ZG56NPeDsYqYoHM1ybcPSlgO?=
 =?iso-8859-1?Q?RxTHKzhx42JAYLXCe48palfpnmG0jp2PTR6a7mV5YCB9uN0mm88Ni0QC5f?=
 =?iso-8859-1?Q?Pp2G47EjZpKVpjrat+SP0gndIUmlBqXERzGB0RAeSY5Sfm6jCZqWRT1EF/?=
 =?iso-8859-1?Q?TqHCJjgA0W+lNnlKJGX2fnR2zjLn+w+jTgIp2Ks8Sjd64/y7uXdto2+rUc?=
 =?iso-8859-1?Q?nOxbCy2VrcS2NKkpbzr5q/95TAlhLi/op3h35+BZkfif8h0ssIANrGGGQA?=
 =?iso-8859-1?Q?Tr+FH5yzGkct2qQwv8nZt+IrLxPba6t2jZIw/fmZi+nLGLP3YsoBn/lEZ6?=
 =?iso-8859-1?Q?UOWtDdxS9yEJ0o5zwEHB0cVzculkzOmic8R7dujy1dcrt60cE92WPqz2Q0?=
 =?iso-8859-1?Q?dlwV7MDpvHvSNetconarrglNt6CTq/O8SaIEGaXqwglWpeicCD+jiI0Hdu?=
 =?iso-8859-1?Q?tMtRFSObWYVA58ODLOC6wCJ4UMnhihPktTmFbaWt+0LafosYjgsbUnrjTI?=
 =?iso-8859-1?Q?anO0IsDGK+f0bYe1+nzyho+bZ9PK5TWE6B08nKTUNZZJ5m8Rbu1zZVp9qc?=
 =?iso-8859-1?Q?sSwJCo275oXfGmasulczXvl7GJoqiHQBhSdAvnVVCzvua2cIcUIdf4Iw?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: microchip.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5611.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c2eaa988-7748-454e-afb8-08dd3aa1a203
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Jan 2025 05:00:03.8762
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: lZZwlnkJBgywZ/DfvQ45o7XGvFJQS4Cu3FSKjC2B5O4JtxmSVpZv8PwF2h/0/ex03/QcniIYN4/Lpv1vH0PFxVdcbxbu7P5Zf0O9xowOhqE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB6876

Hi Andre,

> -----Original Message-----
> From: Andr=E9 Apitzsch <git@apitzsch.eu>
> Sent: Tuesday, January 7, 2025 2:49 AM
> To: shravan Chippa - I35088 <Shravan.Chippa@microchip.com>;
> kieran.bingham@ideasonboard.com; mchehab@kernel.org;
> sakari.ailus@linux.intel.com
> Cc: linux-media@vger.kernel.org; linux-kernel@vger.kernel.org; Conor Dool=
ey -
> M52691 <Conor.Dooley@microchip.com>; Valentina Fernandez Alanis -
> M63239 <Valentina.FernandezAlanis@microchip.com>; Praveen Kumar -
> I30718 <Praveen.Kumar@microchip.com>
> Subject: Re: [PATCH] media: i2c: imx334: Add support for 1280x720 &
> 640x480 resolutions
>=20
> EXTERNAL EMAIL: Do not click links or open attachments unless you know th=
e
> content is safe
>=20
> Am Montag, dem 02.12.2024 um 05:20 +0000 schrieb
> Shravan.Chippa@microchip.com:
> > Hi Kieran,
> >
> > > -----Original Message-----
> > > From: Kieran Bingham <kieran.bingham@ideasonboard.com>
> > > Sent: Friday, November 29, 2024 5:28 PM
> > > To: mchehab@kernel.org; sakari.ailus@linux.intel.com; shravan Chippa
> > > -
> > > I35088 <Shravan.Chippa@microchip.com>
> > > Cc: linux-media@vger.kernel.org; linux-kernel@vger.kernel.org; Conor
> > > Dooley -
> > > M52691 <Conor.Dooley@microchip.com>; Valentina Fernandez Alanis -
> > > M63239 <Valentina.FernandezAlanis@microchip.com>; Praveen Kumar -
> > > I30718 <Praveen.Kumar@microchip.com>; shravan Chippa - I35088
> > > <Shravan.Chippa@microchip.com>
> > > Subject: Re: [PATCH] media: i2c: imx334: Add support for 1280x720 &
> > > 640x480 resolutions
> > >
> > > EXTERNAL EMAIL: Do not click links or open attachments unless you
> > > know the content is safe
> > >
> > > Hi Shravan,
> > >
> > > Quoting shravan kumar (2024-11-29 10:00:36)
> > > > From: Shravan Chippa <shravan.chippa@microchip.com>
> > > >
> > > > Add support for 1280x720@30 and 640x480@30 resolutions
> > > >
> > >
> > > Thanks for improving the driver, but I am weary there is a lot of
> > > work required to clean up the imx334 driver.
> > >
> > > Do you have the datasheet for this device?
> >
> > I have limited access to datasheet.
>=20
> Hi Shravan,
>=20
> you can find the datasheet for IMX334 here:
>=20
> https://en.sunnywale.com/uploadfile/2022/1205/IMX334LQR-
> C%20full%20datasheet_Awin.pdf
>=20
> from https://en.sunnywale.com/show-75-24264-1.html.
>=20
> For an inspiration for driver clean-ups see
>=20
> * https://lore.kernel.org/linux-media/20241220-imx214-v6-0-
> d90a185d82e5@apitzsch.eu/ (imx214)
> * https://lore.kernel.org/linux-media/20230913135638.26277-1-
> laurent.pinchart@ideasonboard.com/ (imx219)
>=20

Thanks, Andre, for the cleanup patch reference

I have sent V3 for this series for these patches.

I will try to understand clean up patches reference imx219 and imx214.
It needs time and efforts to prepare and test patches.
May be in future I will try to send new series with clean-up patches.
I have submitted the patches witch I have tested on PolarFire development b=
oard.

Thanks,
Shravan=20

> Best regards,
> Andr=E9
>=20
> >
> > >
> > > > Signed-off-by: Shravan Chippa <shravan.chippa@microchip.com>
> > > > ---
> > > >  drivers/media/i2c/imx334.c | 352
> > > > +++++++++++++++++++++++++++++++++++++
> > > >  1 file changed, 352 insertions(+)
> > > >
> > > > diff --git a/drivers/media/i2c/imx334.c
> > > > b/drivers/media/i2c/imx334.c index a544fc3df39c..b7cdebc2382e
> > > > 100644
> > > > --- a/drivers/media/i2c/imx334.c
> > > > +++ b/drivers/media/i2c/imx334.c
> > > > @@ -167,6 +167,332 @@ static const s64 link_freq[] =3D {
> > > >         IMX334_LINK_FREQ_445M,
> > > >  };
> > > >
> > > > +/* Sensor mode registers for 640x480@30fps */ static const
> > > > struct
> > > > +imx334_reg mode_640x480_regs[] =3D {
> > > > +       {0x3000, 0x01},
> > > > +       {0x3018, 0x04},
> > > > +       {0x3030, 0xca},
> > > > +       {0x3031, 0x08},
> > > > +       {0x3032, 0x00},
> > > > +       {0x3034, 0x4c},
> > > > +       {0x3035, 0x04},
> > > > +       {0x302c, 0x70},
> > > > +       {0x302d, 0x06},
> > > > +       {0x302e, 0x80},
> > > > +       {0x302f, 0x02},
> > > > +       {0x3074, 0x48},
> > > > +       {0x3075, 0x07},
> > > > +       {0x308e, 0x49},
> > > > +       {0x308f, 0x07},
> > > > +       {0x3076, 0xe0},
> > > > +       {0x3077, 0x01},
> > > > +       {0x3090, 0xe0},
> > > > +       {0x3091, 0x01},
> > > > +       {0x3308, 0xe0},
> > > > +       {0x3309, 0x01},
> > > > +       {0x30d8, 0x30},
> > > > +       {0x30d9, 0x0b},
> > > > +       {0x30C6, 0x00},
> > > > +       {0x30c7, 0x00},
> > > > +       {0x30ce, 0x00},
> > > > +       {0x30cf, 0x00},
> > > > +       {0x304c, 0x00},
> > > > +       {0x304e, 0x00},
> > > > +       {0x304f, 0x00},
> > > > +       {0x3050, 0x00},
> > > > +       {0x30b6, 0x00},
> > > > +       {0x30b7, 0x00},
> > > > +       {0x3116, 0x08},
> > > > +       {0x3117, 0x00},
> > > > +       {0x31a0, 0x20},
> > > > +       {0x31a1, 0x0f},
> > > > +       {0x300c, 0x3b},
> > > > +       {0x300d, 0x29},
> > > > +       {0x314c, 0x29},
> > > > +       {0x314d, 0x01},
> > > > +       {0x315a, 0x0a},
> > > > +       {0x3168, 0xa0},
> > > > +       {0x316a, 0x7e},
> > > > +       {0x319e, 0x02},
> > > > +       {0x3199, 0x00},
> > > > +       {0x319d, 0x00},
> > > > +       {0x31dd, 0x03},
> > > > +       {0x3300, 0x00},
> > > > +       {0x341c, 0xff},
> > > > +       {0x341d, 0x01},
> > > > +       {0x3a01, 0x03},
> > > > +       {0x3a18, 0x7f},
> > > > +       {0x3a19, 0x00},
> > > > +       {0x3a1a, 0x37},
> > > > +       {0x3a1b, 0x00},
> > > > +       {0x3a1c, 0x37},
> > > > +       {0x3a1d, 0x00},
> > > > +       {0x3a1e, 0xf7},
> > > > +       {0x3a1f, 0x00},
> > > > +       {0x3a20, 0x3f},
> > > > +       {0x3a21, 0x00},
> > > > +       {0x3a20, 0x6f},
> > > > +       {0x3a21, 0x00},
> > > > +       {0x3a20, 0x3f},
> > > > +       {0x3a21, 0x00},
> > > > +       {0x3a20, 0x5f},
> > > > +       {0x3a21, 0x00},
> > > > +       {0x3a20, 0x2f},
> > > > +       {0x3a21, 0x00},
> > > > +       {0x3078, 0x02},
> > > > +       {0x3079, 0x00},
> > > > +       {0x307a, 0x00},
> > > > +       {0x307b, 0x00},
> > > > +       {0x3080, 0x02},
> > > > +       {0x3081, 0x00},
> > > > +       {0x3082, 0x00},
> > > > +       {0x3083, 0x00},
> > > > +       {0x3088, 0x02},
> > > > +       {0x3094, 0x00},
> > > > +       {0x3095, 0x00},
> > > > +       {0x3096, 0x00},
> > > > +       {0x309b, 0x02},
> > > > +       {0x309c, 0x00},
> > > > +       {0x309d, 0x00},
> > > > +       {0x309e, 0x00},
> > > > +       {0x30a4, 0x00},
> > > > +       {0x30a5, 0x00},
> > > > +       {0x3288, 0x21},
> > > > +       {0x328a, 0x02},
> > > > +       {0x3414, 0x05},
> > > > +       {0x3416, 0x18},
> > > > +       {0x35Ac, 0x0e},
> > > > +       {0x3648, 0x01},
> > > > +       {0x364a, 0x04},
> > > > +       {0x364c, 0x04},
> > > > +       {0x3678, 0x01},
> > > > +       {0x367c, 0x31},
> > > > +       {0x367e, 0x31},
> > > > +       {0x3708, 0x02},
> > > > +       {0x3714, 0x01},
> > > > +       {0x3715, 0x02},
> > > > +       {0x3716, 0x02},
> > > > +       {0x3717, 0x02},
> > > > +       {0x371c, 0x3d},
> > > > +       {0x371d, 0x3f},
> > > > +       {0x372c, 0x00},
> > > > +       {0x372d, 0x00},
> > > > +       {0x372e, 0x46},
> > > > +       {0x372f, 0x00},
> > > > +       {0x3730, 0x89},
> > > > +       {0x3731, 0x00},
> > > > +       {0x3732, 0x08},
> > > > +       {0x3733, 0x01},
> > > > +       {0x3734, 0xfe},
> > > > +       {0x3735, 0x05},
> > > > +       {0x375d, 0x00},
> > > > +       {0x375e, 0x00},
> > > > +       {0x375f, 0x61},
> > > > +       {0x3760, 0x06},
> > > > +       {0x3768, 0x1b},
> > > > +       {0x3769, 0x1b},
> > > > +       {0x376a, 0x1a},
> > > > +       {0x376b, 0x19},
> > > > +       {0x376c, 0x18},
> > > > +       {0x376d, 0x14},
> > > > +       {0x376e, 0x0f},
> > > > +       {0x3776, 0x00},
> > > > +       {0x3777, 0x00},
> > > > +       {0x3778, 0x46},
> > > > +       {0x3779, 0x00},
> > > > +       {0x377a, 0x08},
> > > > +       {0x377b, 0x01},
> > > > +       {0x377c, 0x45},
> > > > +       {0x377d, 0x01},
> > > > +       {0x377e, 0x23},
> > > > +       {0x377f, 0x02},
> > > > +       {0x3780, 0xd9},
> > > > +       {0x3781, 0x03},
> > > > +       {0x3782, 0xf5},
> > > > +       {0x3783, 0x06},
> > > > +       {0x3784, 0xa5},
> > > > +       {0x3788, 0x0f},
> > > > +       {0x378a, 0xd9},
> > > > +       {0x378b, 0x03},
> > > > +       {0x378c, 0xeb},
> > > > +       {0x378d, 0x05},
> > > > +       {0x378e, 0x87},
> > > > +       {0x378f, 0x06},
> > > > +       {0x3790, 0xf5},
> > > > +       {0x3792, 0x43},
> > > > +       {0x3794, 0x7a},
> > > > +       {0x3796, 0xa1},
> > > > +       {0x37b0, 0x37},
> > > > +       {0x3e04, 0x0e},
> > > > +       {0x30e8, 0x50},
> > > > +       {0x30e9, 0x00},
> > > > +       {0x3e04, 0x0e},
> > > > +       {0x3002, 0x00},
> > > > +};
> > > > +
> > > > +/* Sensor mode registers for 1280x720@30fps */ static const
> > > > struct
> > > > +imx334_reg mode_1280x720_regs[] =3D {
> > > > +       {0x3000, 0x01},
> > > > +       {0x3018, 0x04},
> > > > +       {0x3030, 0xca},
> > > > +       {0x3031, 0x08},
> > > > +       {0x3032, 0x00},
> > > > +       {0x3034, 0x4c},
> > > > +       {0x3035, 0x04},
> > > > +       {0x302c, 0x30},
> > > > +       {0x302d, 0x05},
> > > > +       {0x302e, 0x00},
> > > > +       {0x302f, 0x05},
> > > > +       {0x3074, 0x84},
> > > > +       {0x3075, 0x03},
> > > > +       {0x308e, 0x85},
> > > > +       {0x308f, 0x03},
> > > > +       {0x3076, 0xd0},
> > > > +       {0x3077, 0x02},
> > > > +       {0x3090, 0xd0},
> > > > +       {0x3091, 0x02},
> > > > +       {0x3308, 0xd0},
> > > > +       {0x3309, 0x02},
> > > > +       {0x30d8, 0x30},
> > > > +       {0x30d9, 0x0b},
> > > > +       {0x30C6, 0x00},
> > > > +       {0x30c7, 0x00},
> > > > +       {0x30ce, 0x00},
> > > > +       {0x30cf, 0x00},
> > > > +       {0x304c, 0x00},
> > > > +       {0x304e, 0x00},
> > > > +       {0x304f, 0x00},
> > > > +       {0x3050, 0x00},
> > > > +       {0x30b6, 0x00},
> > > > +       {0x30b7, 0x00},
> > > > +       {0x3116, 0x08},
> > > > +       {0x3117, 0x00},
> > > > +       {0x31a0, 0x20},
> > > > +       {0x31a1, 0x0f},
> > > > +       {0x300c, 0x3b},
> > > > +       {0x300d, 0x29},
> > > > +       {0x314c, 0x29},
> > > > +       {0x314d, 0x01},
> > > > +       {0x315a, 0x0a},
> > > > +       {0x3168, 0xa0},
> > > > +       {0x316a, 0x7e},
> > > > +       {0x319e, 0x02},
> > > > +       {0x3199, 0x00},
> > > > +       {0x319d, 0x00},
> > > > +       {0x31dd, 0x03},
> > > > +       {0x3300, 0x00},
> > > > +       {0x341c, 0xff},
> > > > +       {0x341d, 0x01},
> > > > +       {0x3a01, 0x03},
> > > > +       {0x3a18, 0x7f},
> > > > +       {0x3a19, 0x00},
> > > > +       {0x3a1a, 0x37},
> > > > +       {0x3a1b, 0x00},
> > > > +       {0x3a1c, 0x37},
> > > > +       {0x3a1d, 0x00},
> > > > +       {0x3a1e, 0xf7},
> > > > +       {0x3a1f, 0x00},
> > > > +       {0x3a20, 0x3f},
> > > > +       {0x3a21, 0x00},
> > > > +       {0x3a20, 0x6f},
> > > > +       {0x3a21, 0x00},
> > > > +       {0x3a20, 0x3f},
> > > > +       {0x3a21, 0x00},
> > > > +       {0x3a20, 0x5f},
> > > > +       {0x3a21, 0x00},
> > > > +       {0x3a20, 0x2f},
> > > > +       {0x3a21, 0x00},
> > > > +       {0x3078, 0x02},
> > > > +       {0x3079, 0x00},
> > > > +       {0x307a, 0x00},
> > > > +       {0x307b, 0x00},
> > > > +       {0x3080, 0x02},
> > > > +       {0x3081, 0x00},
> > > > +       {0x3082, 0x00},
> > > > +       {0x3083, 0x00},
> > > > +       {0x3088, 0x02},
> > > > +       {0x3094, 0x00},
> > > > +       {0x3095, 0x00},
> > > > +       {0x3096, 0x00},
> > > > +       {0x309b, 0x02},
> > > > +       {0x309c, 0x00},
> > > > +       {0x309d, 0x00},
> > > > +       {0x309e, 0x00},
> > > > +       {0x30a4, 0x00},
> > > > +       {0x30a5, 0x00},
> > > > +       {0x3288, 0x21},
> > > > +       {0x328a, 0x02},
> > > > +       {0x3414, 0x05},
> > > > +       {0x3416, 0x18},
> > > > +       {0x35Ac, 0x0e},
> > > > +       {0x3648, 0x01},
> > > > +       {0x364a, 0x04},
> > > > +       {0x364c, 0x04},
> > > > +       {0x3678, 0x01},
> > > > +       {0x367c, 0x31},
> > > > +       {0x367e, 0x31},
> > > > +       {0x3708, 0x02},
> > > > +       {0x3714, 0x01},
> > > > +       {0x3715, 0x02},
> > > > +       {0x3716, 0x02},
> > > > +       {0x3717, 0x02},
> > > > +       {0x371c, 0x3d},
> > > > +       {0x371d, 0x3f},
> > > > +       {0x372c, 0x00},
> > > > +       {0x372d, 0x00},
> > > > +       {0x372e, 0x46},
> > > > +       {0x372f, 0x00},
> > > > +       {0x3730, 0x89},
> > > > +       {0x3731, 0x00},
> > > > +       {0x3732, 0x08},
> > > > +       {0x3733, 0x01},
> > > > +       {0x3734, 0xfe},
> > > > +       {0x3735, 0x05},
> > > > +       {0x375d, 0x00},
> > > > +       {0x375e, 0x00},
> > > > +       {0x375f, 0x61},
> > > > +       {0x3760, 0x06},
> > > > +       {0x3768, 0x1b},
> > > > +       {0x3769, 0x1b},
> > > > +       {0x376a, 0x1a},
> > > > +       {0x376b, 0x19},
> > > > +       {0x376c, 0x18},
> > > > +       {0x376d, 0x14},
> > > > +       {0x376e, 0x0f},
> > > > +       {0x3776, 0x00},
> > > > +       {0x3777, 0x00},
> > > > +       {0x3778, 0x46},
> > > > +       {0x3779, 0x00},
> > > > +       {0x377a, 0x08},
> > > > +       {0x377b, 0x01},
> > > > +       {0x377c, 0x45},
> > > > +       {0x377d, 0x01},
> > > > +       {0x377e, 0x23},
> > > > +       {0x377f, 0x02},
> > > > +       {0x3780, 0xd9},
> > > > +       {0x3781, 0x03},
> > > > +       {0x3782, 0xf5},
> > > > +       {0x3783, 0x06},
> > > > +       {0x3784, 0xa5},
> > > > +       {0x3788, 0x0f},
> > > > +       {0x378a, 0xd9},
> > > > +       {0x378b, 0x03},
> > > > +       {0x378c, 0xeb},
> > > > +       {0x378d, 0x05},
> > > > +       {0x378e, 0x87},
> > > > +       {0x378f, 0x06},
> > > > +       {0x3790, 0xf5},
> > > > +       {0x3792, 0x43},
> > > > +       {0x3794, 0x7a},
> > > > +       {0x3796, 0xa1},
> > > > +       {0x37b0, 0x37},
> > > > +       {0x3e04, 0x0e},
> > > > +       {0x30e8, 0x50},
> > > > +       {0x30e9, 0x00},
> > > > +       {0x3e04, 0x0e},
> > > > +       {0x3002, 0x00},
> > > > +};
> > >
> > > This is an enormous amount of duplicated data that could be factored
> > > out.
> > >
> > > These are also /very/ common against the existing mode register
> > > tables too.
> > >
> > > I think several things need to happen in this driver:
> > >
> > >  1. It should be converted to use the CCI helpers.
> > >  2. Whereever identifiable, the register names should be used
> > > instead of
> > >     just the addresses.
> > >  3. The common factors of these tables should be de-duplicated.
> > >
> > > In your additions you only have differences in the following
> > > registers from those entire tables:
> >
> > I will try to optimize camera resolution array register value usage by
> > writing common register array values.
> >
> > Thanks,
> > Shravan
> >
> > >
> > > +       {0x302c, 0x70},
> > > +       {0x302d, 0x06},
> > > +       {0x302e, 0x80},
> > > +       {0x302f, 0x02},
> > > +       {0x3074, 0x48},
> > > +       {0x3075, 0x07},
> > > +       {0x308e, 0x49},
> > > +       {0x308f, 0x07},
> > > +       {0x3076, 0xe0},
> > > +       {0x3077, 0x01},
> > > +       {0x3090, 0xe0},
> > > +       {0x3091, 0x01},
> > > +       {0x3308, 0xe0},
> > > +       {0x3309, 0x01},
> > > +       {0x30d8, 0x30},
> > > +       {0x30d9, 0x0b},
> > >
> > >  4. And ideally - the differences which determine the modes should
> > > be
> > >     factored out to calculations so that we are not writing out
> > > large
> > >     tables just to write a parameterised frame size.
> > >
> > >
> > > I would beleive that at least steps 1 and 3 would be achievable, 2
> > > and 4 would depend upon access to the datasheet.
> > >
> > > Is that anything you could work on ?
> > >
> > > Regards
> > > --
> > > Kieran
> > >
> > >
> > >
> > >
> > >
> > > > +
> > > >  /* Sensor mode registers for 1920x1080@30fps */  static const
> > > > struct imx334_reg mode_1920x1080_regs[] =3D {
> > > >         {0x3000, 0x01},
> > > > @@ -505,6 +831,32 @@ static const struct imx334_mode
> > > supported_modes[] =3D {
> > > >                         .num_of_regs =3D
> > > > ARRAY_SIZE(mode_1920x1080_regs),
> > > >                         .regs =3D mode_1920x1080_regs,
> > > >                 },
> > > > +       }, {
> > > > +               .width =3D 1280,
> > > > +               .height =3D 720,
> > > > +               .hblank =3D 2480,
> > > > +               .vblank =3D 1170,
> > > > +               .vblank_min =3D 45,
> > > > +               .vblank_max =3D 132840,
> > > > +               .pclk =3D 297000000,
> > > > +               .link_freq_idx =3D 1,
> > > > +               .reg_list =3D {
> > > > +                       .num_of_regs =3D
> > > > ARRAY_SIZE(mode_1280x720_regs),
> > > > +                       .regs =3D mode_1280x720_regs,
> > > > +               },
> > > > +       }, {
> > > > +               .width =3D 640,
> > > > +               .height =3D 480,
> > > > +               .hblank =3D 2480,
> > > > +               .vblank =3D 1170,
> > > > +               .vblank_min =3D 45,
> > > > +               .vblank_max =3D 132840,
> > > > +               .pclk =3D 297000000,
> > > > +               .link_freq_idx =3D 1,
> > > > +               .reg_list =3D {
> > > > +                       .num_of_regs =3D
> > > > ARRAY_SIZE(mode_640x480_regs),
> > > > +                       .regs =3D mode_640x480_regs,
> > > > +               },
> > > >         },
> > > >  };
> > > >
> > > > --
> > > > 2.34.1
> > > >


