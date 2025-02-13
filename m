Return-Path: <linux-media+bounces-26101-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 49B67A33668
	for <lists+linux-media@lfdr.de>; Thu, 13 Feb 2025 04:51:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EC9D4167E14
	for <lists+linux-media@lfdr.de>; Thu, 13 Feb 2025 03:51:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D9224205502;
	Thu, 13 Feb 2025 03:51:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="2GXndGzE"
X-Original-To: linux-media@vger.kernel.org
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (mail-dm6nam04on2049.outbound.protection.outlook.com [40.107.102.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E046978F39;
	Thu, 13 Feb 2025 03:51:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.102.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739418683; cv=fail; b=RyoUtKKp1a0wylBrU/W+lc7XTKdywpwc6F4R63wrFlG+w2o5Vxd0sZ7P9R8T8jRzzkblrSIPVAp38ez91zkJ6jv0f9DPi3aoBaStP/ll/IqjdcXu3iO+ZXyk8KATrYLZQ6b0VHRlbxbi2h1GMYNHedpM3EJtA5niOAVa46kft8g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739418683; c=relaxed/simple;
	bh=8ZVeB2q6ZdhXTMEfiSUP2rCH0Zm9diID/+v2k9mJaWU=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=PfF5nGHA2+xtfm0SXaMJ//wOJqGnvN3fKLz+g6r64J7Wol6KZOSV7q0k1+WK1xGJx25jWZeR40BpZlVPhXm3jmLKLAGCowTWF8FfoD1CbGw7C+Bdn/M6HAtGBuJ6z/2Ksx8h+qwXZEh4OZs8tOx3KmbS8AVvRsPNc3kroNgJtaQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com; spf=pass smtp.mailfrom=microchip.com; dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b=2GXndGzE; arc=fail smtp.client-ip=40.107.102.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=microchip.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TyLdHo6c1R15zOD8hgfYECD5b/T0dNifPgIJqJgzc9awz5z6P0QWb2OcLRwYTi02EMZ3X0VNei/qpU3lM8/7hN5Y0FAN7pPwRo18Y0iJAPLOdG19Ls2Yhu2q+hM7gM6DeyWtMVFVHb3K3err+hEiEnF6LP0NWWYzl2CyeOFwbzMyIhwa/ll9oBgQXORtZV4h8mHfMEu+yLXFNXUZPt49gla1BW6D+R9D+nHyD7/cnSconBE4haNfUDbTS8rSEe9cNZFcPHQO5JxVqLew20ATm7DFJ1EVO7xiR0Mr6VofGNLT0elKhdwS7ofy8wgMcEfhZigncj2EPkhRdd7z5ZvxrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vWx5KjgoetOaUKlB0uDIXZy9GA2TLdIaD+WSPAgXcv4=;
 b=E3W+ekUb3v4Y+uYTQMvQHURYFHZtmkk1hcN3wL9/fAcLZ/qTGaJd2CcmiKd6lSG5MUc8eOKtS8cZ2Bi1RwrOCmamECozQEFrL4Dl9kVQu8yyLj1PlYS8zkYSnn1LCsrCy5dIUKyTrTXi8fqTYdG/cM0tfRQLfIK+q0Ecf0GGUeQOCrrUh5ssbDqGsI40qeZsUdNjEKy1fYRklZGB9E7oDe6muI32KE2Wmo84NMWqhlmQ9u5OxusWL8LTWZpCbljAoXTboNgFTeZUyceatfZDeQiP+ow8HH5zVRnBCTfcrlT4eUB5DbV1o4tRPiFJwhs9eHdJ7Sfn0+95lFgEfP2btA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=microchip.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vWx5KjgoetOaUKlB0uDIXZy9GA2TLdIaD+WSPAgXcv4=;
 b=2GXndGzEafW/imeDytYtIE2P4zw0IVUvWWKSiHaPWYm7jmbZhs2cBGrIQAfY6KRaMOgWs9BDtTzCk+3TK0+EbwazgH1BhJQo7KRFpJp3ZOefM2FUMSGZa8mMdrXKUbxkxBC9qaCXOkTlHU15wlx97pAlnWkGv1WIdZDkNjmFUpF4RwMVxo2wqdIrbyhXBRHm/eiyECcIwPs3VBuhxd6LpnGSN0OMwnkBfyakILM+40PPXl7694LZd+KMLbOe+DZAaiJqe4UkSSCYXDc8020yqVeGVwPgpXKubSKKRwfnP0ihMl1i7i6h3QZlNcx1SBIYdjMWPEDXiwyd7xRl0aqkpg==
Received: from PH0PR11MB5611.namprd11.prod.outlook.com (2603:10b6:510:ed::9)
 by LV8PR11MB8582.namprd11.prod.outlook.com (2603:10b6:408:1f7::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.19; Thu, 13 Feb
 2025 03:51:17 +0000
Received: from PH0PR11MB5611.namprd11.prod.outlook.com
 ([fe80::9ea3:51c1:edff:4d3a]) by PH0PR11MB5611.namprd11.prod.outlook.com
 ([fe80::9ea3:51c1:edff:4d3a%6]) with mapi id 15.20.8445.008; Thu, 13 Feb 2025
 03:51:16 +0000
From: <Shravan.Chippa@microchip.com>
To: <sakari.ailus@linux.intel.com>
CC: <mchehab@kernel.org>, <kieran.bingham@ideasonboard.com>,
	<linux-media@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<Conor.Dooley@microchip.com>, <Valentina.FernandezAlanis@microchip.com>,
	<Praveen.Kumar@microchip.com>
Subject: RE: [PATCH V3] media: i2c: imx334: Add support for 1280x720 & 640x480
 resolutions
Thread-Topic: [PATCH V3] media: i2c: imx334: Add support for 1280x720 &
 640x480 resolutions
Thread-Index: AQHbT3PAm4yzg0uTZEShPza+IPnrfLND+QyAgAD7c2A=
Date: Thu, 13 Feb 2025 03:51:16 +0000
Message-ID:
 <PH0PR11MB5611BA2FF8E8BDAB55436A6881FF2@PH0PR11MB5611.namprd11.prod.outlook.com>
References: <20241216043926.445001-1-shravan.chippa@microchip.com>
 <Z6yX4QQRLBZeEqlp@kekkonen.localdomain>
In-Reply-To: <Z6yX4QQRLBZeEqlp@kekkonen.localdomain>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR11MB5611:EE_|LV8PR11MB8582:EE_
x-ms-office365-filtering-correlation-id: 9d0fc324-a321-4b0b-758d-08dd4be1ab3f
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB5611.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|376014|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?uw6A+uVk3p76fJu9NjZOAe62gqZL+VNrRdE9zm+YWTGK92dljt30OAB23z3M?=
 =?us-ascii?Q?l5JMnvZ3bmEGeZIRsAx+wwb5tdpsyjMt3glR1UAocnO5AXWYjcT4cCxBciys?=
 =?us-ascii?Q?cpQtk5tEczKhSu1z284U4qQcF9+DfcqLuXW6GgB94eBEvIlkiSQOnTuLEPs5?=
 =?us-ascii?Q?C1xVZM8mqOnLlv8zFlyIfEHoPWp7N2hets6bZ8tDYqOrldeVMJSoV+gOenxy?=
 =?us-ascii?Q?QTXr9QwqBWf/jNiz0kiA8vbGkenNRWiMtRpx6PZ1hZq3VjpM+g8yOxm4k+Qt?=
 =?us-ascii?Q?uIy2vsz8k48xviA+QVm77cgbyh4eNn/okFhpibSMLDCYjsWz3mktD9u8V+TR?=
 =?us-ascii?Q?37JbusbvxP2SuQZhn64eA5xhBfb7VGBCFaexiVAHBtpz37XQ+fKlKsI1UgLj?=
 =?us-ascii?Q?KvlK7MtoRPl/J7aGwPMjHWs+2FiZ/6z/QJdwYLWfCGiomYgJxBpm9Z43TJ+t?=
 =?us-ascii?Q?Mzo5dz4Y2jwKLx29+pAkAtYdnmfIbEHX6PTxVCNNtMeW1TFBl4yDITZXUHli?=
 =?us-ascii?Q?Kp7M1qHNo5bf5F8+ZgCL6IXLkGj2M56mL8s5y0gWhRUfebg4xAGzofAb6A8j?=
 =?us-ascii?Q?aOtoyAFn2bY0gg71ByBiPMoIxfs2sWG0KS2NI91PJ8mGQucamO+kSv0UFmvW?=
 =?us-ascii?Q?GUe2ROcgQrdXRFhfBzs3JDOkTJoZleeWY3NO0F8UnXtflqNoSfS9JzB21lJD?=
 =?us-ascii?Q?jdsDalAmuXF0MpTloW21NLpPnmkeN5gWzWr1JuegJ6711o7+cSt3vRY6/Pej?=
 =?us-ascii?Q?z+CGDiXxxoBQROFVYw2FqmB0qYNna8trpYYn3Ueb+h4ufQtxu7+9coaA5Ef7?=
 =?us-ascii?Q?rU/8mY+v4DCUcpJ1npjcyiCGlHCpQXyKd1CNntwsq1xk17R92sMEJeW91DV+?=
 =?us-ascii?Q?fWhki0q223y1/wrhDSYb0jyCj926jBdxU/PId5wanHJdPmmix8i0Tq9ALbj9?=
 =?us-ascii?Q?Saug12+6yxFEAgdYF/Vs0H70nrIrblm6KyzDIvgsSC/gD/Lan5vMGknAXu9x?=
 =?us-ascii?Q?w72X/Cq2eEOs4aVLy2G69r7QXbL9IUDq/hUNRsXHyrz6i0iVVjCJM26usuEZ?=
 =?us-ascii?Q?jfLgEbbv9PxkdzIyQKdTSGUcPtc+Gy+RM94zLTEmMlfjIUWHkrcAGwXKQqru?=
 =?us-ascii?Q?1/qtMCaLNYyZlei5O0zr4bbhzDEd6cH/mtf6wR4mrIPrGGVD5UgWfLwR2ZT4?=
 =?us-ascii?Q?6m+hCDvUdPh22EQvXg3YkbOmeteZuC4v3lPHNvxR2q5K8WZbpYDMBbQS1Oej?=
 =?us-ascii?Q?MbKEtcbI75GXKv6wuTiLHbyBOOaF9lUybCIgg+mv+owtkLNXINzG7o2Xtqps?=
 =?us-ascii?Q?Mmd+YysmTIMGTSLNsA/TjIJiIzH3EvDKPOrcckViLKrZEOurQG33cPZP1+vg?=
 =?us-ascii?Q?bAVTVQtgMhzx+Q6/c997ib6A03Rsf68JQZDokVc8HWxk9TrQPNfuVW8vejif?=
 =?us-ascii?Q?hAMYeTy0nZz68dNZZNTGm/seo502mqPL?=
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?fgrvaIj4odVSyWE4wwJBtYvLXxPRYk7eHK1g8djKK1ob7r3EQUhRZkn9P2VS?=
 =?us-ascii?Q?pfO90D392nKPh9mei+pNIxu0HkB7wfBcX4MJN63PrCcwjiKFu1oq09Il3ASB?=
 =?us-ascii?Q?sL1BLs803MB9X+oDcCe+I0uoji0VTabtgULwXp542oGgXC4DRbd3yKK89c6Z?=
 =?us-ascii?Q?J/etwYHbB/3w04oDXn1NyVEhZjqlUOOeMGYHyifqyCBbuGKQ5ygpIkhbwIlt?=
 =?us-ascii?Q?7/OFzzbVyEym1r4YyY2Nf9kMjkRlDTGwIDla0nHI7Sef+eT8WeHQ/HPnKLwc?=
 =?us-ascii?Q?9ThXbGlEtRw7SFO4TWchnYO/GXEPCTFFIfxO0oYWVEkbQK6zyafe/LLB2HRQ?=
 =?us-ascii?Q?aNEtX8rs1IgJi6ZBA9PDsuitwR5DRjtn8DyQiR3Jdz1BDGH68T7UkAifzQ6j?=
 =?us-ascii?Q?DS8HKtDPz2RBlxlMp59LJ0rFMmxeSHBeV0y1DQAayWqLrvDK2ZFyB+Z0kZyS?=
 =?us-ascii?Q?4KNwzqEOIUgOc4wJbXn72USMDqkDCiUvDFsR+9qxPuepavCR/TDWcmRArNFK?=
 =?us-ascii?Q?cmL7itW0Xero3Gs0cjyrEIk3pxzhN14y2omSnXB1eDJ9XpiO6lPa3JWk8CDy?=
 =?us-ascii?Q?yj5ok5qbXg/xJ1GRMjbo1edcEtzV4cYGeYzsFI289dEr+CrA8Tkc9XPP08Or?=
 =?us-ascii?Q?DoG9T6uSWivpwZ4dyD/EWA2XN104oLnfuWPSlSyhmqfy9yr5WdUVnYGXUBxs?=
 =?us-ascii?Q?EIlhD0IjAtxilJeAEHfK8+zK+2dyrVqIhavjZemAzZrn6upfUGjxVmPbbZ0f?=
 =?us-ascii?Q?PQgKjKFpjfl9v56Oj8vREeADCHQ2IL/h6h3QQcxGdaVFL7j+vQBykxWEd27B?=
 =?us-ascii?Q?eyEzwi5mHjp4GgPjsRw6TnyCr2ljknp0Ym4JJaeDyiv5hnxCbNdiewJCPgrn?=
 =?us-ascii?Q?zwZNsOMkdnY4j9HO1cCQd00RB+BD8m7faOvP58i502KkSPvaHtJ1xE/Er4Hc?=
 =?us-ascii?Q?wdd0JOXIqpMfxDNg4WYMgvWLtLt0L7i10Jp/PGHtCCGWaH+/mO99qx+f1FNB?=
 =?us-ascii?Q?K2bs8ckdLKkpRwg9J4IBdWOBp/a+c57IDwquXqB64Q7vTXoDwlT4OJf8IQVK?=
 =?us-ascii?Q?KKrb8wQ84FwtG9EfplKN4Ms7KPwCw4QbWijV9SyOHv0hdp3AKNpDK6d686Kz?=
 =?us-ascii?Q?wrv+jUPply5iWfM/Krq8KQC0+581AZ8YVhVKVl5MFHMySsGE2b8r28KzOSS2?=
 =?us-ascii?Q?Y3SvThAO3YL8mUMSrWg7JY9LfLs4jICU8lDA3qDfQBFcy9b+IA06kE4g2kbh?=
 =?us-ascii?Q?7sFIVCQtI96jWix+UQXClXM4q55sdFsfSPFISmxPBX82ZYw3fIrDM/5Rcp14?=
 =?us-ascii?Q?uY0JjJdtMDUArg3VPXEGI/XCHOQFSh1j17I2ecwmz3Ug30fEtJJwGL36uwkK?=
 =?us-ascii?Q?wvRHM7X6KWv2ICJuBXpcnT1RJtJyT+gSSdCxlD1rm6csSjcAOxL37ZSGtl7/?=
 =?us-ascii?Q?tDPI7xo2Ipv+UKsiOQFPY7pVwKdiqI6XYeqfsYi9f+p71gutxZbBlF8yT/CS?=
 =?us-ascii?Q?lcNi+UIWL9Sxp6Qeu1uziZ/Qi03L+JNXLn6wKEg5pBhqJue5zZFmWMhPu+Gk?=
 =?us-ascii?Q?JNzFd3lVfXfg4cGo9JhJyRfzK/8pZN7R2K62doNhSkT+CuDn5npAP/rb6xVW?=
 =?us-ascii?Q?JA=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 9d0fc324-a321-4b0b-758d-08dd4be1ab3f
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Feb 2025 03:51:16.9132
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 6KiMg2mpWG5aCYbhOnoqKLcsy4/Y832Y0yRQcGaePXZq7vYjafbZSiG6OtJKtX1TxFFS2JHXnTPL9vM8Ke6QXoQN2Px8E8T47OAPqLsB4dk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR11MB8582

Hi Sakari,


> -----Original Message-----
> From: Sakari Ailus <sakari.ailus@linux.intel.com>
> Sent: Wednesday, February 12, 2025 6:15 PM
> To: shravan Chippa - I35088 <Shravan.Chippa@microchip.com>
> Cc: mchehab@kernel.org; kieran.bingham@ideasonboard.com; linux-
> media@vger.kernel.org; linux-kernel@vger.kernel.org; Conor Dooley -
> M52691 <Conor.Dooley@microchip.com>; Valentina Fernandez Alanis -
> M63239 <Valentina.FernandezAlanis@microchip.com>; Praveen Kumar -
> I30718 <Praveen.Kumar@microchip.com>
> Subject: Re: [PATCH V3] media: i2c: imx334: Add support for 1280x720 &
> 640x480 resolutions
>=20
> EXTERNAL EMAIL: Do not click links or open attachments unless you know th=
e
> content is safe
>=20
> Hi Shravan,
>=20
> Apologies for the late review.
>=20
> On Mon, Dec 16, 2024 at 10:09:26AM +0530, shravan kumar wrote:
> > From: Shravan Chippa <shravan.chippa@microchip.com>
> >
> > Add support for 1280x720@30 and 640x480@30 resolutions optimized the
> > resolution arrays by added common register array
> >
> > Updated 1920x1080@30 resolution register array with common register
> > array
> >
> > Signed-off-by: Shravan Chippa <shravan.chippa@microchip.com>
> > ---
> >
> > changelog:
> >
> > v2 -> v3
> > Removied blank lines reported by media CI robot
> >
> > v1 -> v2
> > Optimized the resolution arrays by added common register array
> >
> > ---
> >  drivers/media/i2c/imx334.c | 119
> > ++++++++++++++++++++++++++++++-------
> >  1 file changed, 99 insertions(+), 20 deletions(-)
> >
> > diff --git a/drivers/media/i2c/imx334.c b/drivers/media/i2c/imx334.c
> > index a544fc3df39c..58ad67dbb331 100644
> > --- a/drivers/media/i2c/imx334.c
> > +++ b/drivers/media/i2c/imx334.c
> > @@ -167,8 +167,8 @@ static const s64 link_freq[] =3D {
> >       IMX334_LINK_FREQ_445M,
> >  };
> >
> > -/* Sensor mode registers for 1920x1080@30fps */ -static const struct
> > imx334_reg mode_1920x1080_regs[] =3D {
> > +/* Sensor common mode registers for 445M link frequency */ static
> > +const struct imx334_reg common_mode_regs_445m[] =3D {
> >       {0x3000, 0x01},
> >       {0x3018, 0x04},
> >       {0x3030, 0xca},
> > @@ -176,26 +176,10 @@ static const struct imx334_reg
> mode_1920x1080_regs[] =3D {
> >       {0x3032, 0x00},
> >       {0x3034, 0x4c},
> >       {0x3035, 0x04},
> > -     {0x302c, 0xf0},
> > -     {0x302d, 0x03},
> > -     {0x302e, 0x80},
> > -     {0x302f, 0x07},
> > -     {0x3074, 0xcc},
> > -     {0x3075, 0x02},
> > -     {0x308e, 0xcd},
> > -     {0x308f, 0x02},
> > -     {0x3076, 0x38},
> > -     {0x3077, 0x04},
> > -     {0x3090, 0x38},
> > -     {0x3091, 0x04},
> > -     {0x3308, 0x38},
> > -     {0x3309, 0x04},
> > -     {0x30C6, 0x00},
> > +     {0x30c6, 0x00},
> >       {0x30c7, 0x00},
> >       {0x30ce, 0x00},
> >       {0x30cf, 0x00},
> > -     {0x30d8, 0x18},
> > -     {0x30d9, 0x0a},
> >       {0x304c, 0x00},
> >       {0x304e, 0x00},
> >       {0x304f, 0x00},
> > @@ -210,7 +194,7 @@ static const struct imx334_reg
> mode_1920x1080_regs[] =3D {
> >       {0x300d, 0x29},
> >       {0x314c, 0x29},
> >       {0x314d, 0x01},
> > -     {0x315a, 0x06},
> > +     {0x315a, 0x0a},
> >       {0x3168, 0xa0},
> >       {0x316a, 0x7e},
> >       {0x319e, 0x02},
> > @@ -330,6 +314,66 @@ static const struct imx334_reg
> mode_1920x1080_regs[] =3D {
> >       {0x3002, 0x00},
> >  };
> >
> > +/* Sensor mode registers for 640x480@30fps */ static const struct
> > +imx334_reg mode_640x480_regs[] =3D {
> > +     {0x302c, 0x70},
> > +     {0x302d, 0x06},
> > +     {0x302e, 0x80},
> > +     {0x302f, 0x02},
> > +     {0x3074, 0x48},
> > +     {0x3075, 0x07},
> > +     {0x308e, 0x49},
> > +     {0x308f, 0x07},
> > +     {0x3076, 0xe0},
> > +     {0x3077, 0x01},
> > +     {0x3090, 0xe0},
> > +     {0x3091, 0x01},
> > +     {0x3308, 0xe0},
> > +     {0x3309, 0x01},
> > +     {0x30d8, 0x30},
> > +     {0x30d9, 0x0b},
> > +};
> > +
> > +/* Sensor mode registers for 1280x720@30fps */ static const struct
> > +imx334_reg mode_1280x720_regs[] =3D {
> > +     {0x302c, 0x30},
> > +     {0x302d, 0x05},
> > +     {0x302e, 0x00},
> > +     {0x302f, 0x05},
> > +     {0x3074, 0x84},
> > +     {0x3075, 0x03},
> > +     {0x308e, 0x85},
> > +     {0x308f, 0x03},
> > +     {0x3076, 0xd0},
> > +     {0x3077, 0x02},
> > +     {0x3090, 0xd0},
> > +     {0x3091, 0x02},
> > +     {0x3308, 0xd0},
> > +     {0x3309, 0x02},
> > +     {0x30d8, 0x30},
> > +     {0x30d9, 0x0b},
> > +};
> > +
> > +/* Sensor mode registers for 1920x1080@30fps */ static const struct
> > +imx334_reg mode_1920x1080_regs[] =3D {
> > +     {0x302c, 0xf0},
> > +     {0x302d, 0x03},
> > +     {0x302e, 0x80},
> > +     {0x302f, 0x07},
> > +     {0x3074, 0xcc},
> > +     {0x3075, 0x02},
> > +     {0x308e, 0xcd},
> > +     {0x308f, 0x02},
> > +     {0x3076, 0x38},
> > +     {0x3077, 0x04},
> > +     {0x3090, 0x38},
> > +     {0x3091, 0x04},
> > +     {0x3308, 0x38},
> > +     {0x3309, 0x04},
> > +     {0x30d8, 0x18},
> > +     {0x30d9, 0x0a},
> > +};
> > +
> >  /* Sensor mode registers for 3840x2160@30fps */  static const struct
> > imx334_reg mode_3840x2160_regs[] =3D {
> >       {0x3000, 0x01},
> > @@ -505,6 +549,32 @@ static const struct imx334_mode
> supported_modes[] =3D {
> >                       .num_of_regs =3D ARRAY_SIZE(mode_1920x1080_regs),
> >                       .regs =3D mode_1920x1080_regs,
> >               },
> > +     }, {
> > +             .width =3D 1280,
> > +             .height =3D 720,
> > +             .hblank =3D 2480,
> > +             .vblank =3D 1170,
> > +             .vblank_min =3D 45,
> > +             .vblank_max =3D 132840,
> > +             .pclk =3D 297000000,
> > +             .link_freq_idx =3D 1,
> > +             .reg_list =3D {
> > +                     .num_of_regs =3D ARRAY_SIZE(mode_1280x720_regs),
> > +                     .regs =3D mode_1280x720_regs,
> > +             },
> > +     }, {
> > +             .width =3D 640,
> > +             .height =3D 480,
> > +             .hblank =3D 2480,
> > +             .vblank =3D 1170,
> > +             .vblank_min =3D 45,
> > +             .vblank_max =3D 132840,
> > +             .pclk =3D 297000000,
> > +             .link_freq_idx =3D 1,
> > +             .reg_list =3D {
> > +                     .num_of_regs =3D ARRAY_SIZE(mode_640x480_regs),
> > +                     .regs =3D mode_640x480_regs,
> > +             },
> >       },
> >  };
> >
> > @@ -989,6 +1059,15 @@ static int imx334_start_streaming(struct imx334
> *imx334)
> >       const struct imx334_reg_list *reg_list;
> >       int ret;
> >
> > +     if (link_freq[imx334->cur_mode->link_freq_idx] =3D=3D
> > + IMX334_LINK_FREQ_445M) {
>=20
> Could you add a struct field for the common registers and the length of t=
he
> list, instead of referring to the link frequency index?
>=20
> It'd be nice to have the same split done to the other frequency as well.

All value validated with respect to one link frequency (LINK_FREQ_445M)
In this case i will try to get common register values for both link frequen=
cies (819M and 445M).=20

Thanks,
Shravan

>=20
> > +             ret =3D imx334_write_regs(imx334, common_mode_regs_445m,
> > +                                     ARRAY_SIZE(common_mode_regs_445m)=
);
> > +             if (ret) {
> > +                     dev_err(imx334->dev, "fail to write common regist=
ers");
> > +                     return ret;
> > +             }
> > +     }
> > +
> >       /* Write sensor mode registers */
> >       reg_list =3D &imx334->cur_mode->reg_list;
> >       ret =3D imx334_write_regs(imx334, reg_list->regs,
>=20
> --
> Kind regards,
>=20
> Sakari Ailus

