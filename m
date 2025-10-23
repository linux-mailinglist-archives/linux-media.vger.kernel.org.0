Return-Path: <linux-media+bounces-45335-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id DA536BFF3C4
	for <lists+linux-media@lfdr.de>; Thu, 23 Oct 2025 07:13:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 5F49A350B55
	for <lists+linux-media@lfdr.de>; Thu, 23 Oct 2025 05:13:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 62A14265630;
	Thu, 23 Oct 2025 05:13:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chipsnmedia.com header.i=@chipsnmedia.com header.b="Ej1vBUrY"
X-Original-To: linux-media@vger.kernel.org
Received: from SE2P216CU007.outbound.protection.outlook.com (mail-koreacentralazon11021082.outbound.protection.outlook.com [40.107.42.82])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24282266565;
	Thu, 23 Oct 2025 05:13:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.42.82
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761196427; cv=fail; b=VGGKbX3BpDU0OGYEdL7BFalS4dlt1feB3maSlOwa3OY4m2CY0Vmkc67q4ZFZOoIAYnGkvhy/wohKZiD5vE99eZniAjNlcP5AOp6d0618KN53Ai9J8gBPywPCueFkE9eyK+1qzVScSfjtkP45oWYPc72YGCxdYM7KcCO6+TJoFBc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761196427; c=relaxed/simple;
	bh=0rqYnYu8GN8UVCbAlktERl+M+jh/asnnMGLeA0zhbHE=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=uYiu6qH10w9a/A4agNPGfY0liwaekhDLAxyUxTp+ZAyqieYMmLpF5Q0RX9ECOg9dBWyMVg036+n8+XQGCxDCHBBeCD2HIlqGwVI2hKiYH0utmAnzowxFgGMcwgY/G0Hum0bVLvkxSnnBp5/3aPcv/al7UA+sesylAcj6owQ0lVM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=chipsnmedia.com; spf=fail smtp.mailfrom=chipsnmedia.com; dkim=pass (1024-bit key) header.d=chipsnmedia.com header.i=@chipsnmedia.com header.b=Ej1vBUrY; arc=fail smtp.client-ip=40.107.42.82
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=chipsnmedia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=chipsnmedia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KaFw/+Ds/sanGrXbm6ie6Yszhf0CD0ZPgXSd97L/F2o4oZ4c2mrp+CNpQdci0VLDThqjiHCSeGd9Q8DTm8m+yz5qY8Im+2kAzLF+ZDFs/Q7bYZbhgaAy/viwjcb10rGacrQWu/HEtj7iH0wZHBqRhD01lriXXwzYrXz3MKdJ/LMjDRIppMcKEgkOlkD/uerpcVQF4qNa3JQfLjBr8sBq65oHH8VGlpUpI6dzMkiwf0OZB+yWCQ9bEB4UQMl/6ShH4PZr5u7XbRSpfxxHkcmP6hFUqA6EIEEFBmeJf3wcShsu1SqDhC3XRzJwTyXVgAxSTlz5oWBaiiOtO1ewZqijmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Jy8mzdQqPDGPHuCkvzUURZgZfW7U9psjD13HU1foaGs=;
 b=orTDmIMWAEXocs5nisMMbiNFKrBWga7WCUBG09zr0xuWsQi4B6GwBO8c9FTMR1x9rpewbZ12Xu5dw6bH94uJI2EFZNtuU7LoJcWCfomb/CaYC5J8T71zIjkpxvcYgXA9kuezA2IlzRZ7YUwbQmbxCBI/uAgVFA3x8SG00sE4qmUMfr5EwWNAMvzR51iqyBQqwfmKiOSH48640Qj0Lj5G1laVogdXKG/LOJb3/G1oX/iMfg8dd2PuKFmPYY7gvbKUP7AGH9cdxLCz3tr+rMZdW38jnuE+YpM9ki4EX7Oawq+HWhxhW5fH/flX36yLvGfx7KSaJXMYxVsn/OjUTFKZ4g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=chipsnmedia.com; dmarc=pass action=none
 header.from=chipsnmedia.com; dkim=pass header.d=chipsnmedia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chipsnmedia.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Jy8mzdQqPDGPHuCkvzUURZgZfW7U9psjD13HU1foaGs=;
 b=Ej1vBUrYtbYep5Wj6g4U/ekmjVl8vrsEwF8WAZ5N2FiNvlbDqB2QNdqBTrzZ1h6T1FSMxTdxd/5civ/HDtzkj1uwXokNmUYMSJ87TrUznvIqkTPgy7tZZjTH/SRiZ291N579EQF1+ZPV/mDUzomoEPvbkHO4t6KP+rfx5TLfEow=
Received: from PU4P216MB1239.KORP216.PROD.OUTLOOK.COM (2603:1096:301:a9::5) by
 PU4P216MB1371.KORP216.PROD.OUTLOOK.COM (2603:1096:301:a9::6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9228.10; Thu, 23 Oct 2025 05:13:40 +0000
Received: from PU4P216MB1239.KORP216.PROD.OUTLOOK.COM
 ([fe80::20f:42a6:c334:f4a7]) by PU4P216MB1239.KORP216.PROD.OUTLOOK.COM
 ([fe80::20f:42a6:c334:f4a7%5]) with mapi id 15.20.9253.011; Thu, 23 Oct 2025
 05:13:40 +0000
From: Nas Chung <nas.chung@chipsnmedia.com>
To: Krzysztof Kozlowski <krzk@kernel.org>, "mchehab@kernel.org"
	<mchehab@kernel.org>, "hverkuil@xs4all.nl" <hverkuil@xs4all.nl>,
	"robh@kernel.org" <robh@kernel.org>, "krzk+dt@kernel.org"
	<krzk+dt@kernel.org>, "conor+dt@kernel.org" <conor+dt@kernel.org>,
	"shawnguo@kernel.org" <shawnguo@kernel.org>, "s.hauer@pengutronix.de"
	<s.hauer@pengutronix.de>
CC: "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-imx@nxp.com" <linux-imx@nxp.com>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, jackson.lee
	<jackson.lee@chipsnmedia.com>, lafley.kim <lafley.kim@chipsnmedia.com>,
	"marek.vasut@mailbox.org" <marek.vasut@mailbox.org>
Subject: RE: [PATCH v4 2/9] dt-bindings: media: nxp: Add Wave6 video codec
 device
Thread-Topic: [PATCH v4 2/9] dt-bindings: media: nxp: Add Wave6 video codec
 device
Thread-Index: AQHcQygbK4C0CYvBZUif896/Yzrl7rTN1iCAgAEe/sA=
Date: Thu, 23 Oct 2025 05:13:40 +0000
Message-ID:
 <PU4P216MB12399BBA5513DAE7D1D60BA0FBF0A@PU4P216MB1239.KORP216.PROD.OUTLOOK.COM>
References: <20251022074710.575-1-nas.chung@chipsnmedia.com>
 <20251022074710.575-3-nas.chung@chipsnmedia.com>
 <8b420cd2-9549-4033-b82f-a2bc145b7280@kernel.org>
In-Reply-To: <8b420cd2-9549-4033-b82f-a2bc145b7280@kernel.org>
Accept-Language: en-US, ko-KR
Content-Language: ko-KR
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=chipsnmedia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PU4P216MB1239:EE_|PU4P216MB1371:EE_
x-ms-office365-filtering-correlation-id: 024885c0-2611-4607-50ac-08de11f2ede6
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|7416014|366016|1800799024|38070700021;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?HYS1rQYvDKMkGtp6DLU4CUGuxbr7cyqx+wiAXSE+m0oKIrnZfV6zz10KBBOm?=
 =?us-ascii?Q?gie1e4fomHj2Aw7+oR4Ap6N1B9HfGR6//PkpdGt60zqJOCvlQZSQdMfURnGa?=
 =?us-ascii?Q?Lb80dmW1xjOu2rEJPxNf2ltD+/XzYNPxdUJLwOaxMBnPsZFpy2Q6u15PWPK3?=
 =?us-ascii?Q?8OWRxR2cwEIjAhYMcLSlPP6ZUcu1SFQUZ7mCqsN0zhZ8eGP5vA///EkAM7xQ?=
 =?us-ascii?Q?VGlFo4v3nh1yLELEEe2lncl+/VuoS4gZ3h0K3c3Z7zIlBIpvHEpCnuV5v6Y9?=
 =?us-ascii?Q?BbgKdfwUqFxdF243vQO59u9oWAtu6lpjNcBS+hvgeOvflLMuG+sak6Q920py?=
 =?us-ascii?Q?NEvri1rWOgarwBZ2G8xDwt2+frX1xLmn1Gu3kJNBkbsa/9aofe8pSV0I9jIj?=
 =?us-ascii?Q?oWQs8ik+7mWt9xvzS78C+IcCV7IezHqRoNk/FWH8VavcU1Kyg4Dcqrv16IpT?=
 =?us-ascii?Q?bNieuo1x886usyJOQrFXpBp5gtdjvfIXFf9/iHFqUKONRaWbTXY0xW5J5Udw?=
 =?us-ascii?Q?ny9XrcqhxVYuEiJ56+VFmFpcOHc6cAnuuSxA10YJ6TwHJpvAf9YoepGKsRZh?=
 =?us-ascii?Q?Tt8dh7KbVIeZNBnC8ouhSsgHpgFef8+GbYcGbhSxowyIzgPtTQwS6CSTdtSs?=
 =?us-ascii?Q?shj0HZKUwpV1fyliMeZIgcDye5qaGFNtFp7v3KDlMM0bK9IOqSXGj/GZM/0t?=
 =?us-ascii?Q?BVVt8mP38y2i9yIb5tbsXoiLek2srcasceM0HSN6ndbpLgbA6ExqimARXCRY?=
 =?us-ascii?Q?vxlQf7fXk1971kIhfyiDE/tp2P2UrhV2G+TC/qpiYe+2P84VPQW6c3q3rsUX?=
 =?us-ascii?Q?yEUSBYN2u506pbvpUTqY2aQ4DPFirZB1WmU5GevMVwe6tePWVsAvuFxe9m19?=
 =?us-ascii?Q?jH4I+MH7RteE9luXXT5H9yJPkChddb08x3bU5A4dF+lPQsyua6caDO7QJvl1?=
 =?us-ascii?Q?1+kFaTxwbj5P1DLK/6y8JTOQhKQGXbZXlCH18bvepjOTFk+JFy16v9xBUMI2?=
 =?us-ascii?Q?RoY1otLLYe7NwG4TNQrnrosz91l/RrJ+VvvhJCi/uASd6RYNf9KJYjv36c9m?=
 =?us-ascii?Q?CuZq+X/bn1N4x2bYAWE+33inarFrKa9r/lc8wCV1epSw98ctCwSBx4FNOHdv?=
 =?us-ascii?Q?S/c2kj3Ne3PiHDBxUZ8KFloR5KtMV/uxrEcydzOBK9NDAwxXR4d+l9nd3B2+?=
 =?us-ascii?Q?aY/G6zQhpJsywYVij00RXvEeVO+RcnN8DRTjY16mMIPyHGe4sTXtRAgyQn04?=
 =?us-ascii?Q?hgCcALULh59MhqyPr5I4ZjO6vJXiN1z2MWVYjMXYRDtCwSPcO62GuYbTJheX?=
 =?us-ascii?Q?EOgo9Ln9yU0i+09M01O9egRf4I33YxbldTrEgUgqoqwQDbCYOrwHaGn4rsyK?=
 =?us-ascii?Q?nfOKezSxS7nF/26ic+e9srD5TXMDaQQJw2Ss2uFgeAIi/jjlGxAP7UiICSOB?=
 =?us-ascii?Q?TzmpdEfajhFuQyAOXjuvh5RVz4XU7OoIaqfe+p4xIJIOO+IsMAbKFw=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PU4P216MB1239.KORP216.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(1800799024)(38070700021);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?E/KAeRP9pVpohhXRJKzm185HhbRlOBS4XzHEEbGPEWGzPHkG0Cs3gi5zW2Pw?=
 =?us-ascii?Q?5b8jhjg+SH5StAhBqMwu5elktGddj3zzx8LlUFeC/8HeY1mWMmOBNGAe6/83?=
 =?us-ascii?Q?WZ3q3dxPy28ZzoGYksKXt2ctZ47Wv9GmQzPw+wN8zk6f+5O/VoLXKCS59/Xf?=
 =?us-ascii?Q?5dlH8RQb38vh3S4T3oaKia+qGb2nsHhoySA+NWIa578+8bppVRpitD1zE8W3?=
 =?us-ascii?Q?TbmOdtxZV0UIKqmpo9XUJi55xHTqfSvHjnnyAY4LxsUALSoT4ej90YYs5Ykl?=
 =?us-ascii?Q?X97xvBxsmXRsLfKcxHrgFU9YZZFNemJMu5Pz8JvS++zZ/uX00oFuSLwTXqf0?=
 =?us-ascii?Q?aPznFJs9wPJ7O9s7+HjYNJhECz04uJmODVGBoouCmoDw2EQ8SEgvYKXdcM+v?=
 =?us-ascii?Q?ZaEfCq4xi9K4OZcV9WQu6KtApRk40ImUIPX8O6Zd5YtJoAU8JoufqXta8Yun?=
 =?us-ascii?Q?12LJbf/4sDgeDw8bi5ouWd/Gv0Kk5KRZXZ+LM8qp1fRKDtB4UkkGosW7+OSq?=
 =?us-ascii?Q?M4wPR9A3/YUUA55YQuWPm9y/bah2Ax/Pr+iXvk8bX3TCQTc0ALWLO7cnV3Y2?=
 =?us-ascii?Q?U5HMHB7bMIvIA8IV/q/us6u6KaHoOXxJL7u4YJYug3VYhV0Cy3phSsj6wjj0?=
 =?us-ascii?Q?bgkxxvhqBYqxBBYseBhZH6SL4vyIKG3yqxve4fcoOkUJBLFwYP1jxfKHU1mh?=
 =?us-ascii?Q?WV92gmr/iZvjOEKP/kE9ILu/wRiXJqjM3RFza4w6nijRd8jNm2AeGjOwvVQ2?=
 =?us-ascii?Q?bACoBerExC5CUAYmXj/mmdWFnoRjNul3zTzDxuEGwrW53HCQgzSlU5gpPnv/?=
 =?us-ascii?Q?1C4oX8sMcpDBcJI7CMl48Ld0uS5hu6x2Sqyd9lhfcKXXACy350EQd4Hz8SM4?=
 =?us-ascii?Q?kuNF4PLLfO+aB590zUMwy6NnZ6FcjccrTGsxnrLqVqPngylBlQAWkmCsAgig?=
 =?us-ascii?Q?q6f+bo7NIwJSNqxBGhZf4dElOf6YvxU7n6zBESgNoxQEFnB6VbXodF4Z4724?=
 =?us-ascii?Q?T0obVD1ivO2HzOGrdBJUn++0uokNVq2MFhuFzRf/Dfx6MCxg3bRsFPro5Wo6?=
 =?us-ascii?Q?OQ40xfVfYiW4azQ2PHP0c6n5fgpD9z7+2slYLUkdCj+oiu90Coxwhlsy0RRv?=
 =?us-ascii?Q?VE4jIuR3K1BYrhE3nFgV9Ea8+UMdLbWe52g2g0DLca5RJu3YNSkakFI1ka1j?=
 =?us-ascii?Q?slNxkraz5tT4CRTg+KzNQZBQg+0fE1r5D1T2+Xll88KK05iBb2ouKlai8o2I?=
 =?us-ascii?Q?eXZS4lJ22mjKCn5Oced1oyEveivVzUXjoiwgFjLzyJMXg0wFPaud0hD+uevQ?=
 =?us-ascii?Q?lnHu5qs5L/53SgWv2kYPypYZ49z8//fAeTfujWa2I+tMKS1IjLvliZnkiwmo?=
 =?us-ascii?Q?omciBn26RpiU8lAzhS70pIx7MZqFhiw/3952fycqLfLBKUy8pI87qyoHJTrU?=
 =?us-ascii?Q?VrPH5rZBbPRuoKJymbbYnqwXozDxvCNT2SZe5H9VHTthbDhJO5bYOZv7ufIT?=
 =?us-ascii?Q?WZgAIm3KJ8Iotqa3jf3YZnq5Dm6ByRmh0vHyVhLi9CqgQAQpSS3XVBUsDG61?=
 =?us-ascii?Q?Qy0y5O+KpmIRT3ngjUrjUgUbxVn+4vVkt6CQTyX9?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: chipsnmedia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PU4P216MB1239.KORP216.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 024885c0-2611-4607-50ac-08de11f2ede6
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Oct 2025 05:13:40.3870
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4d70c8e9-142b-4389-b7f2-fa8a3c68c467
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: nK0VfwU0h8nLqHkiVkod/fE4rfhgof2IxWgdKwjiR0L4OZGGtguJDRUAGrocytFwMQHdCnhF2HWU+3Sfv+lLVai/s9x5ZHtBLPxI/npjq64=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PU4P216MB1371

Hi, Krzysztof.

>-----Original Message-----
>From: Krzysztof Kozlowski <krzk@kernel.org>
>Sent: Wednesday, October 22, 2025 5:31 PM
>To: Nas Chung <nas.chung@chipsnmedia.com>; mchehab@kernel.org;
>hverkuil@xs4all.nl; robh@kernel.org; krzk+dt@kernel.org;
>conor+dt@kernel.org; shawnguo@kernel.org; s.hauer@pengutronix.de
>Cc: linux-media@vger.kernel.org; devicetree@vger.kernel.org; linux-
>kernel@vger.kernel.org; linux-imx@nxp.com; linux-arm-
>kernel@lists.infradead.org; jackson.lee <jackson.lee@chipsnmedia.com>;
>lafley.kim <lafley.kim@chipsnmedia.com>; marek.vasut@mailbox.org
>Subject: Re: [PATCH v4 2/9] dt-bindings: media: nxp: Add Wave6 video codec
>device
>
>On 22/10/2025 09:47, Nas Chung wrote:
>> Add documentation for the Chips&Media Wave6 video codec on
>> NXP i.MX SoCs.
>>
>> The Wave6 video codec functionality is split between a VPU
>> control region and VPU core regions.
>> The VPU control region is represented as the parent node and
>> manages shared resources such as firmware memory. Each VPU
>> core region is represented as a child node and provides the
>> actual encoding and decoding capabilities.
>>
>> Both the control and core regions may be assigned IOMMU
>> stream IDs for DMA isolation.
>
>
>Please wrap commit message according to Linux coding style / submission
>process (neither too early nor over the limit):
>https://elixir.bootlin.com/linux/v6.4-
>rc1/source/Documentation/process/submitting-patches.rst#L597

Thanks, I will address this in v5.

>
>>
>
>
>> +
>> +  ranges: true
>> +
>> +patternProperties:
>> +  "^video-core@[0-9a-f]+$":
>> +    type: object
>> +    description:
>> +      A VPU core region within the Chips&Media Wave6 codec IP.
>> +      Each core provides encoding and decoding capabilities and operate=
s
>> +      under the control of the VPU control region.
>
>
>You explained more in previous email than in this description. Are these
>independent? Can they be independently used?

No, they must be used together with the control region.
I will clarify this in v5.

>
>But you also said there is one processing engine, so I do not understand
>why these are separate. If you have one engine, there is no such thing
>as separate cores.

Although the Wave6 VPU contains a single processing engine, it exposes up
to four hardware interfaces, each with its own MMIO region, interrupt
line, and IOMMU stream ID. These interfaces allow concurrent submission
of decoding/encoding operations via firmware scheduling, while execution
occurs on the single processing engine.

The control region also has its own MMIO region (global registers) and its
own IOMMU stream ID. Because the control and each interface have distinct
resources and stream IDs, I believe representing all regions as a single no=
de
would be inappropriate.

Thanks.
Nas.

>
>Best regards,
>Krzysztof

