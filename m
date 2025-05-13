Return-Path: <linux-media+bounces-32353-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id BC499AB4CE7
	for <lists+linux-media@lfdr.de>; Tue, 13 May 2025 09:39:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A83F03AA6F2
	for <lists+linux-media@lfdr.de>; Tue, 13 May 2025 07:38:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B97981F09B6;
	Tue, 13 May 2025 07:39:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chipsnmedia.com header.i=@chipsnmedia.com header.b="dRPhnE0H"
X-Original-To: linux-media@vger.kernel.org
Received: from SEVP216CU002.outbound.protection.outlook.com (mail-koreacentralazon11022086.outbound.protection.outlook.com [40.107.43.86])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BCF926AFB;
	Tue, 13 May 2025 07:39:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.43.86
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747121951; cv=fail; b=OAtahXfreHRWHhUTor8M0Q6JVixcJtkuFDVS7wEa/cXPVJlkGGAIZG9IOg2dQBm+KqG76FR9Hk8Q+0rncqgeUlL6rqijQoAfT8uaHgFNG8jy2bMu453v7FYBWG/9ZOEQSaRJ0xjOC+glzSi8pb97Xbd8wHnDpaRDk9+kq+FrRJU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747121951; c=relaxed/simple;
	bh=JPDe9o7Haxyxy86ei8371Fyswgexu8aM8c63KUqQ3TI=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=AlUd0ugby48puqbjAj5AVpLJMNiLxkzT6sHSQ2Rrv0ENAnVv6XZIVHrRmcre/yPuQWUKBTGW820iaJR7+qgnBr6enRXOCGlfgym84ppWEYe1FCijNyM170U/xQlImgZUmKI0Dlbaw6T8OMs9G0v2PX9gfcBz5ubL2LJYADW6oMs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=chipsnmedia.com; spf=fail smtp.mailfrom=chipsnmedia.com; dkim=pass (1024-bit key) header.d=chipsnmedia.com header.i=@chipsnmedia.com header.b=dRPhnE0H; arc=fail smtp.client-ip=40.107.43.86
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=chipsnmedia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=chipsnmedia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=y+IzQlNEI87ba2B4sekGebwPA+synsJozSIVB38/eWa3r/hjSHozorl7bLMmU7kJOea0FRAhZMgGsUMQy8ZX6pG28w8BNRH8fG6PEssj7l1CiAeyw7bZQvJvnmfakI0D75kI7hb6y0CnihJtba9BlK6fcqQO7GVwcywpe6Muw3v4y+aWVuWS/B2m/hSrsYjbSWQZkWtkC9DEE/csT15BmGNqeP1u0ng5j67G+E66yWegIkHF+5xmTyNMaFL9CNz1T8nQpAoAAodJkQhK0Jb1z46QR3u+qlVqp25QfuX4sl525CagsvJWKCTGij8zI805JXtixn8clwvdh8Pwu1xOcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=D0sqUwYV6Ax45LkJSrSZwsJblntq7BObz/uvuKNdBp0=;
 b=PEzFKmXI87FB/ilwBMhx2zm/ZqE3h6suSgRLaEiTiovOBdVmZWDpB3Wb3w++cVY+Oq4R5GHW1nZcjCIXPUKyCqyO0n0YZk3AeY6pyVI4BMwuXRBcNts6h10lsRhhl5Djn8fT+jBPXsEnG1nmGMr7dy0UzoXJM87AtB3AlU+a+lCGlKtKwZsTVG6vcdysI27njg1n2rLJhDTWu8BBtHKor657OQ/dvVov2BGwm3l0MIp0DCefOprTJW7Nx0G5O6bMffwwxvlFws8gxiyXieucHnKHn5SGQBFaecYXe0S5gwpgdgFgIdl1n9Pl2x/+Gd3R5eNwWy5DZXxnwgh6+j6n7A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=chipsnmedia.com; dmarc=pass action=none
 header.from=chipsnmedia.com; dkim=pass header.d=chipsnmedia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chipsnmedia.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=D0sqUwYV6Ax45LkJSrSZwsJblntq7BObz/uvuKNdBp0=;
 b=dRPhnE0H0gpRlVSHhcguv7x70xwEd/tNzih6bk6uAdL+d+mRu9Q+ZNVuvpnKvTZJSR2DdOhr847hJNZl+ecmLj2lH5yX2BVDQhcLxglXHAWR1T0J/X8Dw7w28FTa3nVU1XPFECUwUGpF5rr92Fe2SKPRv3UFq1CiiiaQjQAPbVI=
Received: from SL2P216MB1246.KORP216.PROD.OUTLOOK.COM (2603:1096:101:a::9) by
 SE1P216MB1975.KORP216.PROD.OUTLOOK.COM (2603:1096:101:63::14) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8722.30; Tue, 13 May 2025 07:39:04 +0000
Received: from SL2P216MB1246.KORP216.PROD.OUTLOOK.COM
 ([fe80::9e3d:ee20:8cc7:3c07]) by SL2P216MB1246.KORP216.PROD.OUTLOOK.COM
 ([fe80::9e3d:ee20:8cc7:3c07%3]) with mapi id 15.20.8722.027; Tue, 13 May 2025
 07:39:04 +0000
From: Nas Chung <nas.chung@chipsnmedia.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
CC: "mchehab@kernel.org" <mchehab@kernel.org>, "hverkuil@xs4all.nl"
	<hverkuil@xs4all.nl>, "sebastian.fricke@collabora.com"
	<sebastian.fricke@collabora.com>, "robh@kernel.org" <robh@kernel.org>,
	"krzk+dt@kernel.org" <krzk+dt@kernel.org>, "conor+dt@kernel.org"
	<conor+dt@kernel.org>, "linux-media@vger.kernel.org"
	<linux-media@vger.kernel.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linux-imx@nxp.com" <linux-imx@nxp.com>,
	"marex@denx.de" <marex@denx.de>, jackson.lee <jackson.lee@chipsnmedia.com>,
	lafley.kim <lafley.kim@chipsnmedia.com>
Subject: RE: [PATCH v2 2/8] dt-bindings: media: nxp: Add Wave6 video codec
 device
Thread-Topic: [PATCH v2 2/8] dt-bindings: media: nxp: Add Wave6 video codec
 device
Thread-Index: AQHbs2lXzy1gLrNeZ0ijKXj6PUT3srO0NFSAgBWF9JCAAHRxAIAFp7/w
Date: Tue, 13 May 2025 07:39:04 +0000
Message-ID:
 <SL2P216MB1246002B8EFD5CBE69E447ACFB96A@SL2P216MB1246.KORP216.PROD.OUTLOOK.COM>
References: <20250422093119.595-1-nas.chung@chipsnmedia.com>
 <20250422093119.595-3-nas.chung@chipsnmedia.com>
 <20250425-romantic-truthful-dove-3ef949@kuoka>
 <SL2P216MB124656A87931B153F815820BFB8AA@SL2P216MB1246.KORP216.PROD.OUTLOOK.COM>
 <f1073f21-0885-486f-80c8-00f91dfd7448@kernel.org>
In-Reply-To: <f1073f21-0885-486f-80c8-00f91dfd7448@kernel.org>
Accept-Language: en-US, ko-KR
Content-Language: ko-KR
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=chipsnmedia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SL2P216MB1246:EE_|SE1P216MB1975:EE_
x-ms-office365-filtering-correlation-id: 67743e97-f5b6-4bda-5bad-08dd91f13c59
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|366016|376014|7416014|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?zGbZxjz7lwA6RkcovnGNmGIk+pN7lmAPI8WHtJJxQrfGD8+qMdK2SjPS3lXA?=
 =?us-ascii?Q?/+zbBz9auO+zBbo2GGQ6ErQo0fISVtvVR9lCVEqsdrSdWBc/jmKhRHWcbTFb?=
 =?us-ascii?Q?EFlJjkVv4TpQ54JeT4tqQcgvgy+l248XRYk902CEsTSAl0NYQnIE1J+EpGsW?=
 =?us-ascii?Q?dFEKV62mCQHVzK6DXIyjyPPOjbhXcMu7/fDu0T6A9gYNkPbDO5nSh4gqH9Dd?=
 =?us-ascii?Q?yLwmMF5CPiiyc1RkG6WijSsAGs5t9FO6JL87W6Svu7DUaS4w65Vu3ScrMsN5?=
 =?us-ascii?Q?8C4h1cIbi9zdnt+aPiQMDtaDyWZyyH8cEAAtlyIuDU7mMifqnjHQMeqvQ0rO?=
 =?us-ascii?Q?L+5iuqTttxGP2LrZbxrhP/35MnAwj5exnyafe5kuehXoQm+duzCugy7x4f/V?=
 =?us-ascii?Q?sfw35refjJVpErnvF8OZIsKiWAT6hVldDp0Xhom/cCtURhAAxRn85hIj+uw8?=
 =?us-ascii?Q?e5XdpaTaWD1zemGWH0PbYt1J3VTC7sJfelo1kbt1/aRJmhJ/7TwLeKL0x7bZ?=
 =?us-ascii?Q?YuQRzLRDeqYcnLaD1H0q2Agk3LFAp4zxBxbrQk6hMgx2kKtDXlpSk22fGvMi?=
 =?us-ascii?Q?oYdeBT70D38GC5HGsBXi0wxCSVWgo9WbTjfTjibDg7eh/jMiTypzuojhO3Ki?=
 =?us-ascii?Q?/ynkUVoALsd17YLUBgsteTh8R71nRZQ2t+hryG4Z+p92NG5y/8GrINGkBXaK?=
 =?us-ascii?Q?S2XyGQgCYgHMvhmUI1xotUc5rGmhqNz9LXYJ9eczS5q22R414vlqCFFrt1fC?=
 =?us-ascii?Q?k8IhW6xf8L5YjbsxqnQ1d47cgg4S4gB3wlZ6UoFZigvWdluGJry8kJ2t5rDz?=
 =?us-ascii?Q?q2GXSkBmLE7jiJ0blm1OGO/Sl1IiuzSdl3XAl+HcOeFErUm6C0nUOtCjyFB1?=
 =?us-ascii?Q?dFiT1db1MNUmSVhz95VghPZCx5TDr3CF0TcI/DSH84tULj1dN74Xgt7WkLi3?=
 =?us-ascii?Q?iZLl7WhYkKD4Fl8+ooQlGmBypPEEm6Q80M09S2ZoTU43fs8EhvTgyx6Z9JsO?=
 =?us-ascii?Q?qoI8qhtpss+hrl1s19RCmOwH8SUgpz75zvt6aX7YyoFPV+51zDvWyu55hzAq?=
 =?us-ascii?Q?e1KcSsXlNCmfJOKPZyB02UW0ddenfL9TLbUQz4cBk6kWicH1srKnYJ7P27hB?=
 =?us-ascii?Q?pBHdhONd2mmmYNVCzYiNGfYm0SW/gB3oFIRLyyrvxiWIBSlHT7dQfKydS9KA?=
 =?us-ascii?Q?sqJDfTXvsZzLTlPmMhVZuzu5ZjKZrvp9UgawV5y4sBvjLrcjEj2lM0JBZNIO?=
 =?us-ascii?Q?f1MBeSGEkTEF2BZGc1pCO+KkElwGtooBFIj8mcpmsxhCkp5pu/EDtE16OQiz?=
 =?us-ascii?Q?kETdR5E71wezlImJ1vwP4A85q9j3ExJ3QnIoxBhynETW/AEvDw51mHg2ZlE6?=
 =?us-ascii?Q?NJyzZpWvOGHqRPHCt2rcpeV/OpUXAkJgTPwq427xu26SzbwykW4drgs5uv+z?=
 =?us-ascii?Q?NM1ZhreaSF7cCpMYwO3+Ep9FBDgsfA6BFW4nxD/PK/uYK8+7wdUjQA=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SL2P216MB1246.KORP216.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014)(38070700018);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?BKTDoZvbLuhbk85pnxgUxntdJPyntqQwuTuJpWYgvrKjdMPRDYnW5uT6mLj2?=
 =?us-ascii?Q?4Nb4O07QTkXwpvYNSkbSHg+cxY8cUyTgn3YNxyXJfhFeM9CVpkwQKweIYZ7r?=
 =?us-ascii?Q?OdUlCvgxn0sDZfHhVBjGwTiXTe8C8tG4SsndE7OSNcQ9wrKk/sj0+NoSt8GW?=
 =?us-ascii?Q?95i3MScCaSZxCUHEy1keHONSoOyibNFrk9WlKg+r/ZYKdmXTpdadz6BlgyzZ?=
 =?us-ascii?Q?A+0FQWoc9Mdhasq5GtA2yfuH6J/HoelGg00HLwzXJOu4cfoPJBAb4jT9h6gH?=
 =?us-ascii?Q?v3LE5B5VeHLxaGq6L7PpVInkCfr7A6AGWqaYrK0+qItnXISeg7jLw7E502qV?=
 =?us-ascii?Q?+ZeVlSIy9hIOU2YmCAeLHSk5/I0DYEuecE/HE5ialDU9mhAIwC2yRNdL4xxz?=
 =?us-ascii?Q?zq3SGvEpyZuIyWdEtV/c6wIoLs1/ZZTWb7KkN2FsWtQlirrSKQD+cqdPfZyp?=
 =?us-ascii?Q?hnBrjrt1InYDHJqKZNR24ZmTZS6CdYkVSLNjS9p/4O4hYyQD8d0nlesKHuj2?=
 =?us-ascii?Q?nWpFDzFNV+xwvRmuPLYdJGJig42ZzJGF61AYxmyOH25reucNrVeFNiWBe2Hg?=
 =?us-ascii?Q?hv3V/VUnGBy2VasGu/z45DrmWAR3+edmu096a89cxp2gdVST9Q/XWXYQBx9i?=
 =?us-ascii?Q?0Fe8ELchKmEehAW8Yg8iPk1m6Nz/VqyJJr4F6Pzzuluk/5PV9Echr7F7cN5l?=
 =?us-ascii?Q?hcrJPCjvPgVK0av/QiviLIOJL1EPz2D6LArA6tqI2kMtcgkqllULJJES63Xn?=
 =?us-ascii?Q?Az0g4y6oc/+8zec+2TmFKNqo225OCppDx2tmzy+8Mo6OsU0zRuRmdZ4mUvQq?=
 =?us-ascii?Q?ZqMfISJ2/q4+sbBGr+6AfqHOb9SdxLrWqrcAj74SUOMLo9YSaLca7oZiJL74?=
 =?us-ascii?Q?dBFEKQAayNzFrmYdQwVPbqq2I07B9tthBtrUbKfk+tPdciRpqWNeazUtq/lH?=
 =?us-ascii?Q?RTJ0OGS/vNfQupP3aRhFkFKyXNFSKIgD7y/gIAWxeMCOe7Om6lqhx73zKXgp?=
 =?us-ascii?Q?jada3Q7h9NariNx9FHX6Pc1lDnwY6RSwCpWAvBfgB+dMQh0pYTzjfzB2G/gH?=
 =?us-ascii?Q?B+m5KiGTYMwWs/80agy7NlHW049UHrtaY3G/chl0xsfyjeg8GutUpYCuD6KA?=
 =?us-ascii?Q?0aKDT6lu17PEHZL2HC3F/vRcrxFkDsb+4saAePXhDPOTpZXV6rWteR8H+A1M?=
 =?us-ascii?Q?Tcyq7w4oVOwUOvy9H1G7th36hP2o8L48VZ3ifGewNIOTc7JgJvhD+sLsyh+p?=
 =?us-ascii?Q?K9JDzx3tKvXHCQnrwsDR+z1F8jdAiJvj6ye3F7zSK67ytlFKGH9NHl4bPkfE?=
 =?us-ascii?Q?wZKkBr5HIlHLbRJRqBLIauP8hxHVKQ98zrQJXnSahknFGJ43/fvGhDAg1YdX?=
 =?us-ascii?Q?TIXm4lbqd1px5DVznfl2NKJubbrBukC9yujZgh7mRCUnL6C40Tgcrt+uH7gw?=
 =?us-ascii?Q?9jrAiNzzxbH/uQRD3KCKxtWZiZGWBfuees9yFrXrgR2US2RPAw+3i5NDYUL4?=
 =?us-ascii?Q?wNNewwxgHQNwfwlRvRVBwcbuCHqFwcPFFr9P4tlGLcatxaekqSRGHq5IVYXK?=
 =?us-ascii?Q?UfYWX9X4zIs5vulCFGjf6yAtZxDnDPzV97G5uegp?=
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
X-MS-Exchange-CrossTenant-AuthSource: SL2P216MB1246.KORP216.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 67743e97-f5b6-4bda-5bad-08dd91f13c59
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 May 2025 07:39:04.1785
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4d70c8e9-142b-4389-b7f2-fa8a3c68c467
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 1Y2IjImmzP/WRdVJD8c6jA8Bpsy4I5TRs0cXyCZhUP4cr+2MhIe/6I7OJdVTwgwjG00DIizkNpuM6gxa1QxCVLCdDhqCDkREfUYOxkGuplU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SE1P216MB1975

Hi, Krzysztof.

>-----Original Message-----
>From: Krzysztof Kozlowski <krzk@kernel.org>
>Sent: Friday, May 9, 2025 7:12 PM
>To: Nas Chung <nas.chung@chipsnmedia.com>
>Cc: mchehab@kernel.org; hverkuil@xs4all.nl; sebastian.fricke@collabora.com=
;
>robh@kernel.org; krzk+dt@kernel.org; conor+dt@kernel.org; linux-
>media@vger.kernel.org; devicetree@vger.kernel.org; linux-
>kernel@vger.kernel.org; linux-imx@nxp.com; marex@denx.de; jackson.lee
><jackson.lee@chipsnmedia.com>; lafley.kim <lafley.kim@chipsnmedia.com>
>Subject: Re: [PATCH v2 2/8] dt-bindings: media: nxp: Add Wave6 video codec
>device
>
>On 09/05/2025 11:59, Nas Chung wrote:
>>>> +examples:
>>>> +  - |
>>>> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
>>>> +    #include <dt-bindings/clock/nxp,imx95-clock.h>
>>>> +
>>>> +    soc {
>>>> +      #address-cells =3D <2>;
>>>> +      #size-cells =3D <2>;
>>>> +
>>>> +      vpu: video-codec {
>>>
>>> Why this device does not have MMIO? Sorry, but makes little sense and i=
f
>>> you posted and tested your entire DTS you would see why.
>>
>> I initially thought that if the reg property is declared in the child,
>> it would not need to be declared in the parent node.
>> I based this approach on the mediatek,mt8195-jpegenc.yaml binding,
>> where the parent node does not include MMIO.
>
>Do you have access to mt8195 datasheet? What is the memory/register
>layout there?
>
>If you do not have access, why do you think these are similar devices?

I'm sorry, I made an incorrect reference without fully understanding
the mt8195 architecture.

>
>>
>> But, if this structure is problematic, I will address it in patch v3.
>>
>>>
>>> Can we see the entire DTS?
>>
>> Sure !
>> Below is the cnm.wave633c.example.dts file created from dt_binding_check=
.
>
>This is not the entire DTS.

I have found errors in dtbs_check.
I will make the necessary corrections and add the DTS patch to the patch se=
ries

>
>>
>> /dts-v1/;
>> /plugin/; // silence any missing phandle references
>
>This is bindings example. I want to see entire DTS or DTSI of the SoC.
>Once you see entire DTS, you will notice that your current split is just
>not correct - it should be pretty obvious.
>
>And that's why we should keep rejecting such works which do not bring
>any DTS user, because the no one - neither we nor the contributors - see
>big picture and if someone saw the big picture then immediately would
>notice - it's just bollocks.

I understand the meaning. I will test the entire DTS file
to properly use the VPU and check for errors in dtbs_check.

>
>What you claim is:
>
>soc@0 {
>  // MMIO bus
>
>  video-codec {
>    // which is a non-MMIO device and clearly a no-go.
>
>Just look how DTS is organized and learn from it.
>

Thank you for pointing this out.
I now understand that placing a non-MMIO device on the MMIO bus is
fundamentally incorrect.
To address this, I will update the video-codec device to define
the reg properties covering the entire reg region.

>>
>> /{
>>     compatible =3D "foo";
>>     model =3D "foo";
>>     #address-cells =3D <1>;
>>     #size-cells =3D <1>;
>>
>>
>>     example-0 {
>>         #address-cells =3D <1>;
>>         #size-cells =3D <1>;
>>
>>
>>         interrupt-parent =3D <&fake_intc0>;
>>         fake_intc0: fake-interrupt-controller {
>>             interrupt-controller;
>>             #interrupt-cells =3D < 3 >;
>>         };
>>
>
>All of above are wrong for the SoC...
>
>>
>>         #include <dt-bindings/interrupt-controller/arm-gic.h>
>>         #include <dt-bindings/clock/nxp,imx95-clock.h>
>>
>>         soc {
>>           #address-cells =3D <2>;
>>           #size-cells =3D <2>;
>>
>>           vpu: video-codec {
>>             compatible =3D "nxp,imx95-vpu", "cnm,wave633c";
>
>What does this device represent? It is not "ctrl", because you made ctrl
>separate device node. Your binding description suggests that is the VPU
>control region.

My intention was to represent the MMIO VPU device, which includes
both the core and control nodes.

>
>>             clocks =3D <&scmi_clk 115>,
>>                      <&vpu_blk_ctrl IMX95_CLK_VPUBLK_WAVE>;
>
>For which sub devices these clocks are valid? For all of them?

Yes, these clocks are valid for all of sub devices.

Thanks.
Nas.

>
>>             clock-names =3D "vpu", "vpublk_wave";
>>             power-domains =3D <&scmi_devpd 21>;
>>             #address-cells =3D <2>;
>>             #size-cells =3D <2>;
>>             ranges;
>>
>>             vpucore0: video-core@4c480000 {
>>               compatible =3D "nxp,imx95-vpu-core";
>>               reg =3D <0x0 0x4c480000 0x0 0x10000>;
>>               interrupts =3D <GIC_SPI 299 IRQ_TYPE_LEVEL_HIGH>;
>>             };
>>
>>             vpucore1: video-core@4c490000 {
>>               compatible =3D "nxp,imx95-vpu-core";
>>               reg =3D <0x0 0x4c490000 0x0 0x10000>;
>>               interrupts =3D <GIC_SPI 300 IRQ_TYPE_LEVEL_HIGH>;
>>             };
>>
>>             vpucore2: video-core@4c4a0000 {
>>               compatible =3D "nxp,imx95-vpu-core";
>>               reg =3D <0x0 0x4c4a0000 0x0 0x10000>;
>>               interrupts =3D <GIC_SPI 301 IRQ_TYPE_LEVEL_HIGH>;
>>             };
>>
>>             vpucore3: video-core@4c4b0000 {
>>               compatible =3D "nxp,imx95-vpu-core";
>>               reg =3D <0x0 0x4c4b0000 0x0 0x10000>;
>>               interrupts =3D <GIC_SPI 302 IRQ_TYPE_LEVEL_HIGH>;
>>             };
>>
>>             vpuctrl: video-controller@4c4c0000 {
>>               compatible =3D "nxp,imx95-vpu-ctrl";
>>               reg =3D <0x0 0x4c4c0000 0x0 0x10000>;
>>               memory-region =3D <&vpu_boot>;
>>               power-domains =3D <&scmi_perf 10>;
>>               #cooling-cells =3D <2>;
>>               sram =3D <&sram1>;
>>             };
>>           };
>>         };
>>
>>     };
>> };
>>
>>>
>>> Best regards,
>>> Krzysztof
>>
>
>
>Best regards,
>Krzysztof

