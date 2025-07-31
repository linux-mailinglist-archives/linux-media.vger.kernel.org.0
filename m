Return-Path: <linux-media+bounces-38685-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A1AE2B16C19
	for <lists+linux-media@lfdr.de>; Thu, 31 Jul 2025 08:36:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C909D5433CA
	for <lists+linux-media@lfdr.de>; Thu, 31 Jul 2025 06:36:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 85E1025A620;
	Thu, 31 Jul 2025 06:36:36 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from MA0PR01CU009.outbound.protection.outlook.com (mail-southindiaazon11020140.outbound.protection.outlook.com [52.101.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F789A923;
	Thu, 31 Jul 2025 06:36:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.227.140
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753943796; cv=fail; b=aLIvPVTrrWeaXVZ7bCQ3CEieUQd9bGowc+b1iYARMBV6PBeTUpyiC2g+p0/A7yolS57QAdvSndrwcLG/EWZtQ2OHDo/INCk92+5x+8WoocThB6vS0CioaaSRy+KLAVHEiiAf4PfPPeXuEC7aqoSWolDtdSept89XzHFgBUkVT+0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753943796; c=relaxed/simple;
	bh=JHMzQgHkcM8dUa0RLXhRgmabq6wPtQHBCKba81tFmhY=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=JQJubzVXd698P3G85so8LywJHejfZc8FIPbFltsXmc9Andrq4QtwKA1LN3QvNb7/G2BnXsmnr8qgAH0t3QbdwQj7EF9g9rLAfyjvpQ18yTGhRT1XQR3bsPSd1zaBt6we+eQUeFQMmnPYGGH5UA4Cb5zQdHrwQDL9usqrZc7aeyw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=siliconsignals.io; spf=fail smtp.mailfrom=siliconsignals.io; arc=fail smtp.client-ip=52.101.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=siliconsignals.io
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=siliconsignals.io
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ScU7l13+ttEZkURVe1z6l5ep6Wspp+89r2zrAXsCqoFL5/IoyqE8pRUDHVC6eBSKgBEMxAyrKkQRS6IRb9aFeOfYAN4f6dN1yNjQIDfrkUamO4In2PeVrWJLB88VioY1ARgW9dpf70XnPeNBSid78UKppjxER1fMF1faagKrRXZyEEvcqGPl75QvxEtMNEquqLyfrXrYGl9PC/1fmJpqMtmefG7pbwAnYtyHiAyBXfkCoVgX5bQiqOxfiClU37wgcNEPDh21IgYzMs84ze2MGCYYmHv69Bmme7U95lbVY0IBJkqlM2mE04GhbR79BULJE0KXug6ArV27RPILfbpRIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JHMzQgHkcM8dUa0RLXhRgmabq6wPtQHBCKba81tFmhY=;
 b=YkxlUnik7i5/YYisyNyy4XBybMHIc/sAezEo5w7EqsjzEirSEfnOz9ND/IBe7RDO/4Al6E1dnqIPCR0AH9N9jCNI0G0a39SCk/Yi7/6zYtGZswYfn0gnZd2HWhr6L4H7Kvj6WeEIAJSkDhOWrAZ+loT2xKnexAIpHAOiwcOqMh/h28EEA/5bXrF0dq+xWpkDFxqIldYQNdHdEkwv9vKDLpAyBcNLVz8iaxr1XOmAjKMATIfXscVlUkCK1Q1DpLCPCAaqPnol5NJt1YS086OBoGCo6/M2EOKJ+n3zIxQGf/J52BQM6lrrXeY/UJsqHKOB0+7M8DjHCkPAfDV3iFvtPQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siliconsignals.io; dmarc=pass action=none
 header.from=siliconsignals.io; dkim=pass header.d=siliconsignals.io; arc=none
Received: from PN3P287MB3519.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:229::21)
 by PNZP287MB4154.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:282::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8989.14; Thu, 31 Jul
 2025 06:36:25 +0000
Received: from PN3P287MB3519.INDP287.PROD.OUTLOOK.COM
 ([fe80::5c9a:906e:318b:c418]) by PN3P287MB3519.INDP287.PROD.OUTLOOK.COM
 ([fe80::5c9a:906e:318b:c418%6]) with mapi id 15.20.8989.013; Thu, 31 Jul 2025
 06:36:25 +0000
From: Hardevsinh Palaniya <hardevsinh.palaniya@siliconsignals.io>
To: Krzysztof Kozlowski <krzk@kernel.org>
CC: "andriy.shevchenko@linux.intel.com" <andriy.shevchenko@linux.intel.com>,
	"sakari.ailus@linux.intel.com" <sakari.ailus@linux.intel.com>,
	"laurent.pinchart@ideasonboard.com" <laurent.pinchart@ideasonboard.com>,
	"kieran.bingham@ideasonboard.com" <kieran.bingham@ideasonboard.com>, Himanshu
 Bhavani <himanshu.bhavani@siliconsignals.io>, Krzysztof Kozlowski
	<krzysztof.kozlowski@linaro.org>, Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Hans Verkuil <hverkuil@xs4all.nl>,
	Ricardo Ribalda <ribalda@chromium.org>, Bryan O'Donoghue
	<bryan.odonoghue@linaro.org>, Hans de Goede <hansg@kernel.org>,
	=?Windows-1252?Q?Andr=E9_Apitzsch?= <git@apitzsch.eu>, Matthias Fend
	<matthias.fend@emfend.at>, Tarang Raval <tarang.raval@siliconsignals.io>,
	Heimir Thor Sverrisson <heimir.sverrisson@gmail.com>, Jingjing Xiong
	<jingjing.xiong@intel.com>, Dongcheng Yan <dongcheng.yan@intel.com>, Benjamin
 Mugnier <benjamin.mugnier@foss.st.com>, Sylvain Petinot
	<sylvain.petinot@foss.st.com>, Arnd Bergmann <arnd@arndb.de>,
	"linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v6 1/2] dt-bindings: media: i2c: Add ov2735 sensor
Thread-Topic: [PATCH v6 1/2] dt-bindings: media: i2c: Add ov2735 sensor
Thread-Index: AQHcAeHa9HY47390u0OJlhyWta8pG7RLwMcAgAAF2LM=
Date: Thu, 31 Jul 2025 06:36:25 +0000
Message-ID:
 <PN3P287MB3519C0DB4796E4D73411A549FF27A@PN3P287MB3519.INDP287.PROD.OUTLOOK.COM>
References: <20250731061004.5447-1-hardevsinh.palaniya@siliconsignals.io>
 <20250731061004.5447-2-hardevsinh.palaniya@siliconsignals.io>
 <28ba8a6d-a180-485d-9bfd-d5ac8783831d@kernel.org>
In-Reply-To: <28ba8a6d-a180-485d-9bfd-d5ac8783831d@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siliconsignals.io;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PN3P287MB3519:EE_|PNZP287MB4154:EE_
x-ms-office365-filtering-correlation-id: 02081e7e-fa7c-428c-e6f5-08ddcffc926b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|1800799024|7416014|376014|38070700018;
x-microsoft-antispam-message-info:
 =?Windows-1252?Q?QEcpMkTPLg0Xp5aFUiZPhLIXR5jefPv477RWvYOcRvBc9kULj0WP/c/S?=
 =?Windows-1252?Q?0ifvccfLETVxJenotQHLQnMZBnEcKCVfpe9nWaLliW/REmGf0SA+q/xt?=
 =?Windows-1252?Q?0EVnAZDLjXfZg54ok+Y2KLhX9yNDHzWdRW6GgRKaKPWy80c4/FKB1GuJ?=
 =?Windows-1252?Q?/uPwpvDqnwI/Io4P2yg/Pl1JYiQluXCHLBdi5Fmqb0aic2YIXZ7ZvbUE?=
 =?Windows-1252?Q?arPOD6PvqUBLXvSNjNQnH5krmUSXwCPxGI6/aXHQ8V3eL2BMxqfiF8f0?=
 =?Windows-1252?Q?qvoMtYXQvS4RwmhqY+pzrFqG7vlSVSxvxGRu2jwIPIKI/EALjlP1mvlj?=
 =?Windows-1252?Q?Zhur6jAaXEnaGirBWqroZUN2ih1gF+4HTLvO78eUcdxjQmvOfj7B/+v/?=
 =?Windows-1252?Q?wdBh0Ba26zU/V6IBx4DvFqZ96vUjpQqVt2fiRntJrdHUYcD/IF+XrN5T?=
 =?Windows-1252?Q?JoPtZRzoUoQxjhzNDJ0j9iz0UIQ3dkEaUMNLipQSrqqw+mE15qbvAbDV?=
 =?Windows-1252?Q?23YjrnSiV9aqWMufl6Es2cGP9HEFbV+YYfyPDp0g1uID0ErJbr2z/csx?=
 =?Windows-1252?Q?MLdZq0s73kKUL3C5HFGS0+JaO0yn9lab92Aw64WgKjAl9jjN2TIgmBK5?=
 =?Windows-1252?Q?kgFFYdxyzeah/N9uBKZf250w2k01iiUVMc8Z3SNmH3PAxwwRZyywrJeT?=
 =?Windows-1252?Q?I0ADdyZAuNHeNe4LSatAKvHgBNFIjm2L1NMf/C35rAghzHe5QrFj5mNe?=
 =?Windows-1252?Q?3MEB/K0DVi6klunfZEeWyj8u2g+X3adeapLumxt39vQz+HLvoEtLIoOg?=
 =?Windows-1252?Q?/7UiZi4b8NFhw89g5Z4nMHhTGNHJzeUP4Qmt6fSk6rRcDpqi5DvFgQOq?=
 =?Windows-1252?Q?VXyGPREVJIyul7rqq69VRpCRxEbMnjgwv3y0TfBq90sSH4vn38VH+tl4?=
 =?Windows-1252?Q?moy+LkXs5RrDC0ta6QmdC2uNHzYFXfuz6MkZZ6L4XT9BdCfQLKde3zZ0?=
 =?Windows-1252?Q?2N8dpAI1UBBXt5gXlsDCf0muxPFNBwYkBrN2o/C/6JAjUDhR2lSIkUlu?=
 =?Windows-1252?Q?yNxbCqiVYRC82Nn184tnEJSxTBs51uoti5tMDpdvD+sb1UAp60lbheNk?=
 =?Windows-1252?Q?zlRZIFDxk+HN1xfsX/i9eVZ/bWMryrgdSEWseTPCuNDpGGhNtGZKwR2g?=
 =?Windows-1252?Q?KJruqONn9FpWq0hrdgOKwPHhGH0JbUv8xJ7iTd7XdqLGKrPBad0cMSc7?=
 =?Windows-1252?Q?R36mHag66jJJIGKOVlDBmPdiiRTmrBjyrdZaJaN1OauDf2OEk41fHhrA?=
 =?Windows-1252?Q?Y0/wuLmG25DudXnwQB2/7C/I+9FPE0np+UFE4LaaCwqGQ3SMm609bHLz?=
 =?Windows-1252?Q?pL7Ge5zVIeAr23WpmCw/RHa6WhHZI84LlCpt9CG/PUUMWc/rEf5HLXOw?=
 =?Windows-1252?Q?gbVVV41Q3RX9bExQnUDT6Dz8HRpTWG1aU87nNXAcBQNGvWoF+kQOkEZw?=
 =?Windows-1252?Q?5PJ0TZIvEnpDYs7n5HclKAMn8/GgCw/CLBpdUnu0LyJZUC3McwUoEVGp?=
 =?Windows-1252?Q?WUwMbl3zQZlSwOQuRfBt6dGUvqUdNJWuPx29qMI7+eOHbD8S21MWEghE?=
 =?Windows-1252?Q?my0=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PN3P287MB3519.INDP287.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014)(38070700018);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?Windows-1252?Q?piREkwqiILa7OaWrEoaPAU23QaugrxcMJBzOsQa76ZSGF6XrBSBvJ3GZ?=
 =?Windows-1252?Q?lJ3eEZGKp9eZb8rmTsn2h9EP7K69xtGxH0td/ftXieTx9UM5VL50/K1T?=
 =?Windows-1252?Q?NfDKsUQHfCdWlumEQOlu3zmtpZ0HqbgnpE4tWkjgLAMV/Vq3we3bk2yp?=
 =?Windows-1252?Q?rF6Yp64RoRFpLhlTdxlZ8e1UC2TaCt7Vi5+UXnpxJrmQDX/iCpVUbEjp?=
 =?Windows-1252?Q?woag+XkAJHb0dQaGnse5jaEgP66PRx3C3CwYaFti+oHaULXEYym3taNV?=
 =?Windows-1252?Q?tDSXXguODg6VEIBmm+9R1pnhLUluzsc+ohBqH4yKBb690giFRibJCKbs?=
 =?Windows-1252?Q?w3dY3OEN74cJmaKHRyGYJitrYDGI0Fkh3/u6TrRNgEzdtimtfkM3ucuV?=
 =?Windows-1252?Q?TGrZMXZnnUCyP87JlLrjVBERULBd0vNxTc9d4WqfBoGpciY+BIWheDoR?=
 =?Windows-1252?Q?5NnmsxsMqtMK/S9ifXULPqQbckt7Zr/76Km+R8WvvxFvuTxJGcFfUFLJ?=
 =?Windows-1252?Q?gKMzJ6tOYU0nokr0Uq1cP3hF4z1kkp3TJYDy9ajwAuw0t0lPZq4uqKXM?=
 =?Windows-1252?Q?Y9dmMd3G1plIGdcAaihRLPb08ksUTkD2hDVRiXPOGdspP6etqNfVfyaF?=
 =?Windows-1252?Q?H9ZzZML8+8M3eCoADQq6yWO3NIkaRpvwm7TDz15ZeW9Br7dWYFyUEZuk?=
 =?Windows-1252?Q?e8t61W2Cki46ANgcoP0JC8eyQVY3KJJmXt0jk2ssm+jdPNN+Cmv+tqfN?=
 =?Windows-1252?Q?CmVXZOZTgJJQrj/mtx8O1ZBZBLKa7e9MHluqu2uNKwLtfD6vFWxAIJTf?=
 =?Windows-1252?Q?ZJ98hlv8wPf/2D8pM8BYE896sCPUnSc7xg6+hPKbOlw5p1DWdf9Eb/T/?=
 =?Windows-1252?Q?guNcJ9JoTg3pFSlG15jMRR8n/udTmkFQLhSqiLZ6r9CRdTruOW5QCUBE?=
 =?Windows-1252?Q?vDO68WgXEbPTM6X8hsydTDTeInCenbHbS9+b6fpfYLUpRK+rDROfO5ba?=
 =?Windows-1252?Q?sfrAAY3brUM7H4hojUwLE4ch4Lucb33epCx/vZBGREU3sYiURfCk72V/?=
 =?Windows-1252?Q?wQ1bWr9v4Ht6/CnQq2rQD+K8F1BAFKGg4vLrjd9DjWDtjMdahvkxmR4A?=
 =?Windows-1252?Q?ay04desJPhXjUw2AnDHAIvwFF1ZkBNmoPT8o0IDJ9yhnB7TIPnDg4yqL?=
 =?Windows-1252?Q?hllbER8I+IMeIuQup4pTrISccbUXGSoI59pxFrX9+gWEhuWLHLE5tVnK?=
 =?Windows-1252?Q?hAFpDeRWSEcRR9YiyYMVcr7aZrkK2QS5fxPfZJ+Z8f/Z6/c9+GcagviQ?=
 =?Windows-1252?Q?1FATS9JwbxV3snzuxiE/5s7j/t0e3O+xVAjAXN4ETdM677B7xi9/bObL?=
 =?Windows-1252?Q?O8NERI2XqBF/qIcJTj5rur8n0FMiSHZYyoNI1f0QSKdWsxpnSvRLUyTA?=
 =?Windows-1252?Q?1x0RkIq/HeQSlP6c4XxZ4mcLVm3c0BNSLUfaYVOPkKBQ8aR78IBUx+qm?=
 =?Windows-1252?Q?ynzQaPp8fx6kPJSmtnAEVuOdHvoiPAc+sRTkA1zYWDdcVB5Vjml4xCAP?=
 =?Windows-1252?Q?8PVQ5q4Eesw23/ZuV3XG0UoZPbcEHFahHX3myMxvrNQTyFQeYZV8IOom?=
 =?Windows-1252?Q?uGOuvPtJe3WBitDF5jxV6DMZpbj0DwVRJoCAnom3xDhCuzscZ3V7B1p8?=
 =?Windows-1252?Q?xLrXCvk7/dm3qfpFnSH/fJSkW3EQpJXRZuXPjsIUjPZX4JVT1q6trg?=
 =?Windows-1252?Q?=3D=3D?=
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: siliconsignals.io
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PN3P287MB3519.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 02081e7e-fa7c-428c-e6f5-08ddcffc926b
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Jul 2025 06:36:25.1447
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 7ec5089e-a433-4bd1-a638-82ee62e21d37
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: E6otoJnVWbTiFU3RXTcLuujtB91cDVRJCeE+X8qC+nf7tUN4BNW3gCxuK4f2/xNGIExHsoUCh1NygvcITEIjCBDYHyBqAwKiqotOEFOTHCW2sxELJ4d58vE9m5OUjZb4
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PNZP287MB4154

> On 31/07/2025 08:09, Hardevsinh Palaniya wrote:=0A=
> > +=A0=A0=A0=A0=A0=A0=A0 properties:=0A=
> > +=A0=A0=A0=A0=A0=A0=A0=A0=A0 data-lanes:=0A=
> > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 items:=0A=
> > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 - const: 1=0A=
> > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 - const: 2=0A=
> > +=A0=A0=A0=A0=A0=A0=A0=A0=A0 link-frequencies: true=0A=
> Nothing improved. My comments from versions before still apply.=0A=
=0A=
I asked you in v4, but you didn=92t respond.=0A=
=0A=
Could you please check?=0A=
=0A=
Link:https://lore.kernel.org/linux-media/PN3P287MB351999B4DB533CCA9C6E6567F=
F51A@PN3P287MB3519.INDP287.PROD.OUTLOOK.COM/=0A=
=0A=
The driver will always rely on the device tree for the link frequency.=0A=
Without it, the driver will fail to probe.=0A=
=0A=
So, the bindings need this property, just like other camera sensors do.=0A=
=0A=
Best Regards,=0A=
Hardev =

