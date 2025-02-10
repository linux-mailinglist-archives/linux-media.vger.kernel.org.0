Return-Path: <linux-media+bounces-25912-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E5FAA2EC03
	for <lists+linux-media@lfdr.de>; Mon, 10 Feb 2025 12:57:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E14047A3633
	for <lists+linux-media@lfdr.de>; Mon, 10 Feb 2025 11:56:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CB4F01AF4EA;
	Mon, 10 Feb 2025 11:57:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="HGybY6yr"
X-Original-To: linux-media@vger.kernel.org
Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011013.outbound.protection.outlook.com [52.101.125.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E22271F3D53;
	Mon, 10 Feb 2025 11:56:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.13
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739188621; cv=fail; b=d7mzF8xvunGRpUX0BmDGsxqNM9wNbz4ZDcwyb1bADj/HUa/zig0R43bTep4kvIuO1pju9WnXiOGgXnEh4xGRSa+3S7oCc73ci44onAa/TwMcIbBRppr0Mih7cHl/tvr7N9rrWzSNtbc4OryG2/EplH7hELeaO8eMWBFGUSteMVQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739188621; c=relaxed/simple;
	bh=017uU2smTPQp7ig/iP3t34IQtsymLRFZoXgHN/kXi0Q=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=Y7uv+CHIPHA8UtNyXH/RyqkRW2KknlT7v2RXmE93mblbchoYmPA32m0QI/3q5Uo4wS+y0/4l5B5dFwOi/szfFmv75aTzhOVLL4/DFfRn4CxEf86xkh0r4WEkY3MTlzblAjnecywKfHYIULK2YVGPGCanQCCASUbfE52lFM6tUTk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=HGybY6yr; arc=fail smtp.client-ip=52.101.125.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dc/szy7axw25Hk95ZCWxWY0CCIwLwvCwP/B+U6kt+QXBkKcWor3ZOVYQ9c4UgkaQePU7/tQYW5llK1oW8AI+ABXXlQSsj832mqiGwTN5OagO+bBgCACseP9isQBEwkhAPTXevLeNU2uxvA2B3D9MTAKWmNzEjaAJQl0swvWZgvmxEVDqiBnbSig7coQN4rmpuhNQc1KdPakZ2FxVwsx5QSDPXunLYHbLGYlaUjcgERKcC70XCVhLZrjF5lW+Zvtxo16dVamuvWKFlJvtk8LpdTcberZSKe10e7T2PT4Bi0OHbN+NDFzzn0a00Z2w6rDOkbrVnhX+1EI8YH5c9IUq1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dIq5IMlfoDD9rbxY5Cuf5SG6wRNZctI+7PXOORrmHt0=;
 b=C4cFhQnPA3pnoH8fmn8rYsXQ8HF2rn0UHn19xaF2mJRKNRx7qMfKUcg3ag4jrbJyhZL0k3KNGik9sGttnxQeTdmjWLCJdA4indj3oaEcZDZd3SHutWggxGgk5IH05gAflaDysxI5/EFaFaaGQY9l5caUen1eQvrpcD5+wyRAX1NPjgcvu645fURrCSiBk8GA/9S70IuEi0SZ+ByPGq/qQaQDxIjkBIKTOVVsd6AEW7xqPOGxIpNtJMblAl/1wEtd9oh3vHNPCuNadsEyD3vkqa67gdQJhc/y/97+u+FvYuOXJ9XGIeIN42bC4I4IkUVTPsiQTN9y+289N3ZeEzq5iQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dIq5IMlfoDD9rbxY5Cuf5SG6wRNZctI+7PXOORrmHt0=;
 b=HGybY6yrsA5c13mg9B3/KYt0dUNvcu6Ur98i8YF4SOLLYlhjffcUxMKkR/hA9QDaKgZToErDNUxn6NCyCLy+NmrN/0SdIZXmi84p9pG/I8r2zPzGeQRck+GBRiPdMi7z3Q0frHmxm655ULJO/7cr3Wulbmo/I3kk2XC6H16+4vc=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by TY4PR01MB14590.jpnprd01.prod.outlook.com (2603:1096:405:23d::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.18; Mon, 10 Feb
 2025 11:56:56 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1%4]) with mapi id 15.20.8422.015; Mon, 10 Feb 2025
 11:56:56 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Tommaso Merciai <tomm.merciai@gmail.com>, Tommaso Merciai
	<tomm.merciai@gmail.com>
CC: "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
	"linux-media@vger.kernel.org" <linux-media@vger.kernel.org>, Prabhakar
 Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>, Tommaso Merciai
	<tommaso.merciai.xr@bp.renesas.com>, Mauro Carvalho Chehab
	<mchehab@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
	<krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Philipp Zabel
	<p.zabel@pengutronix.de>, Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>, Laurent Pinchart
	<laurent.pinchart+renesas@ideasonboard.com>, Hans Verkuil
	<hverkuil@xs4all.nl>, =?iso-8859-1?Q?Uwe_Kleine-K=F6nig?=
	<u.kleine-koenig@baylibre.com>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: RE: [PATCH 7/8] media: rzg2l-cru: rzg2l-core: Use temporary variable
 for struct device in rzg2l_cru_probe()
Thread-Topic: [PATCH 7/8] media: rzg2l-cru: rzg2l-core: Use temporary variable
 for struct device in rzg2l_cru_probe()
Thread-Index: AQHbe7F1/2qM1vdzr0WWzJltn+nTKbNAbkCQ
Date: Mon, 10 Feb 2025 11:56:56 +0000
Message-ID:
 <TY3PR01MB11346D4E32390CFC8283B400B86F22@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20250210114540.524790-1-tommaso.merciai.xr@bp.renesas.com>
 <20250210114540.524790-8-tommaso.merciai.xr@bp.renesas.com>
In-Reply-To: <20250210114540.524790-8-tommaso.merciai.xr@bp.renesas.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|TY4PR01MB14590:EE_
x-ms-office365-filtering-correlation-id: ad139a57-e7a5-4e1d-6259-08dd49ca04b5
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|7416014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?+POLuRKrH0Onuxaldris1VoQ8YRKo9+yfVclxJN4eHdcD3HcbTIT9/NSpW?=
 =?iso-8859-1?Q?qlg01ke9bEJ4Xj8u5vPuMNhReVokBDhclkQkRg1T7mZMhS5gyTOeDyir24?=
 =?iso-8859-1?Q?DyuyPSzN41BD+WAPk0cwzxaKMZSKMUw+BcRE3GTKbWq1adh4bhyopcBlMD?=
 =?iso-8859-1?Q?5pp0DAWZOU1Fr6BH5jzQ2Hwf5uct6okt3Km7Pl5rEpwuCMUFsyKvpJz7Vm?=
 =?iso-8859-1?Q?jVQfzTQtQ/IPT5Iu+23ajaPjgjmZ7Nj2a//bduO/6hKFlpoqYJUubtn0wR?=
 =?iso-8859-1?Q?xIeLJjrP5rkaIVM0WgZ4a5t6JMlN/TV05YRVylRyEJRzEgpMC7sjOskIwN?=
 =?iso-8859-1?Q?v2EYmMzGo/sp45337ppdtC+tUtUOnKeIDuLCe/z1hTinzwmOcvN3RMKWmG?=
 =?iso-8859-1?Q?rFSkU1Ej+4Sv43ACygGD5qzi3KLqdi5GihyIYbaTwWLfYLe0vbX0DgHTbZ?=
 =?iso-8859-1?Q?O4WZeWC29B3E9A8RjTquLxlBPc3nW4dALOBLSIhgXHHXAwzrSRqGTKP6r2?=
 =?iso-8859-1?Q?YKpcxUh6jLbByM6aRNOQ54Ti2Nl6XFUBPCnm08fZFy2PJ2ZOww2qwzC3JT?=
 =?iso-8859-1?Q?1uoYdHbxlxuW4C0joyBDvaAZJR7xYqYFBtlS57V+QR2ne9RP8XUb07lrE+?=
 =?iso-8859-1?Q?+e1yrR3tmf/jGH95jzGW9JhB+jS91KNIMK3cfFLbc3k5sq9SqEJoH1Apsg?=
 =?iso-8859-1?Q?SO3EQFDLSV0G0nqgFmhb/anuSgXU5+UjbHaMU6TBOq/VriymsOpFQyPm+u?=
 =?iso-8859-1?Q?q9p4AovGuSj9K0nA9h+Ul1GWsG13bSXmOKt0guQCUP5Y1PpaWE+vCMQFhg?=
 =?iso-8859-1?Q?kqLXVNXrAW2BFubNWEoOvARCcYpEX315GGZvHe4PcN10OvRIoJOw9sdKlh?=
 =?iso-8859-1?Q?z04SjXqmcXEWluWxnF7sd0hALyWihwDbx1deF2tCoaTKiJaK7D75/zU761?=
 =?iso-8859-1?Q?myDF3rbWwcEo9LxKXtkKe8zmAqnhhs1K1D0o94qSedUC58dm65ADyDlcfT?=
 =?iso-8859-1?Q?P/626h4P4uz/ezRnRUEgQ07MhsBtKZvzz1NTdmya6oZPnXQ0NUfLaCwKiM?=
 =?iso-8859-1?Q?U3hdpo3+DGOk4IFEaO0HXsNaN/ltdb1yYVqtKGUyvI5+P6RHod2di9h8GM?=
 =?iso-8859-1?Q?+2cifwqaZbZbEfP0jHZEL6ClS6v2soTj6WOoxvIqmA7T1xeocBFa7x4wUH?=
 =?iso-8859-1?Q?L5jdREeAiNI6Aw7mFY3xoXP7Ih/v7/hmAIc+aY/JsNGyfYByBHZjVgb2Ol?=
 =?iso-8859-1?Q?P3qX95WG4Bf2cjK6DuaN3p5172A6/LYmH7Wuq+hQugdFnqwrzMar9YfhAv?=
 =?iso-8859-1?Q?bh9rBjNfAW1J/8Way8woFWVjbPwY+0ejIpnFIR/Tp48QXXce6cqQHzzf5Q?=
 =?iso-8859-1?Q?ZfumkC/Gka0pLfyK5Q6NN/E6Qu5qHAZp42Y8Od7t355Keh6EaRTSHjPXS6?=
 =?iso-8859-1?Q?0UDLftB9Y+7WNFLy5oep9EGvksijYVguo7rcS7TKDMuqvjoS1nTQw5Znaf?=
 =?iso-8859-1?Q?T7tjPr6zwrlBe2gv5wcqzL?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?gJ4QbP9yVPyb/6u1KJs2Rpyjm0B5k4N90fNLZSRfjxEsXFufKCwPfr1nEM?=
 =?iso-8859-1?Q?0qZdlxiN6eUDB66OBF0zcJcbSfWXpLV1J+vBV/czN9nYrmzqiC+/cRQsd5?=
 =?iso-8859-1?Q?lxUlz7hscqdnkh2jt/rEVQPBvSrq2Vez+tTHbMn4DuIyRSKmxDhWNMwh1e?=
 =?iso-8859-1?Q?9uV3pqh+vHOMRRcgjZ1Oe9/bZzJhtSc/cebBHFUO2DsNhFInl4CAYJJYnt?=
 =?iso-8859-1?Q?6EET8EeCZXANww0k+LKPV3dM1ZBZQhJUgVZkNgK39Yv6j1KwGSuvrdzVz9?=
 =?iso-8859-1?Q?bozuT5xL/6OJ4Z//OZiLUrmrLImECwRdYKNxrmH+NK8ipgzmDhfZ7klDLE?=
 =?iso-8859-1?Q?wAOlq737ESXFnwe3K71i18qL6Qq4oJLTso2EVNBLNdhOhd7TjWQKZUeZvc?=
 =?iso-8859-1?Q?Ou3kGihunkFn7ZQax0p32MP+pKuYFKzfBuiWKKGIHlfxWew85xYrkwiqVe?=
 =?iso-8859-1?Q?uNOdpOMSU8p//NgAKr3pE7Tg91lOGKAAL+fiA/ay3V5KrIxKMf56uvLJQs?=
 =?iso-8859-1?Q?6enahGED/UnIIyXNSFXHd4Dd09B7fgUf2J3fEc9W3pyCPAm4NlG4PI9lHx?=
 =?iso-8859-1?Q?J9UK3yc7an7dSFES6lyMA2jlF19UHcajspgfamxQwGGDJI17cj04jgG/9Q?=
 =?iso-8859-1?Q?vg85P5bg7gDCvel/eN1n34cGriqDEkpeJ3XsU6qD7Q1eXxGVDvcKJ0xqWc?=
 =?iso-8859-1?Q?LuNPBZMJTRLHLDbiHx29Otus0aIMBwScL7CxtDpS6vvkLxR5MHCvMu3qcr?=
 =?iso-8859-1?Q?EO9U4iw2Tn7CW8DLQwbk75RM82DNWk8/Wg1ZusBqaPzROZFIezWeHHKqyV?=
 =?iso-8859-1?Q?AtpVnvh0cJikjjVp1Ki/07s0LuKFdT2ASDndqq9T9I0oh85jyRKOyYMJTY?=
 =?iso-8859-1?Q?WxGBzvlwPURs4SsaN95KzYpc0OvWqfeNc2p6fXKnBj1G/euMhxUpcVlXxg?=
 =?iso-8859-1?Q?tiGuyMAGRX0gMqaqXErngr9wUjjdVY8ooGQMR4pCWbZLPhAL1NrPB5kHXO?=
 =?iso-8859-1?Q?wsXVFOlFPxQl2wa0gI+PUNbSwyDTPcW8olKqOA0rZVhVvqauPatZ03wL7G?=
 =?iso-8859-1?Q?5dkspbitYtJ+++HD4EFYgEzMiZ9O1Qfr99keh08vz50lQRtkdekQi+CHOG?=
 =?iso-8859-1?Q?f6e8qy5baYOJjqTEO6/+7OkpCQ1uYNcy8a4c2namv3LJbllt8A6nC1SA0I?=
 =?iso-8859-1?Q?7xgjoXdWtDdRo+jsFBAOvc7BC+8F8pCDZKZZoCYWv/QzEVBISz8H/B3OPH?=
 =?iso-8859-1?Q?M8Wj63U048UVpOpaA8825/oBcJbK/r7SIIxM5jDWp4qCw92C/eYZVEfV3l?=
 =?iso-8859-1?Q?L9yA592OlKE0cBCwxqk7t9axRVVLDeNV8oSlb9jBIZ7ctFc7bO+8PDaPOr?=
 =?iso-8859-1?Q?yRPzgCr/GSw4UkafaOYbLMUglZ1TLnlo/6uNGa+Gee6JCBfUckD/mNnluI?=
 =?iso-8859-1?Q?ODWWQ+FdXQBjxhk7iWr98/cPOEt15oPYVmzJZBaoD7OF3nNijV+ywpBrFW?=
 =?iso-8859-1?Q?uG2hQcbFRVYmsNYstcAAQkSg2/xL+3CD1ujeNxs2iV5PhfLrGmGCRGfL98?=
 =?iso-8859-1?Q?kRdmZf/dBluiZ2G8ohqkTPFpCOgxRmJbC+3HuDHyiDvRSeYztxsbyo87zx?=
 =?iso-8859-1?Q?ZWFhUtLtYhvnsClQQUybv2Ory4SnCImFzVCnNevYsVw7oyv1GrSKYKEA?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
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
X-MS-Exchange-CrossTenant-Network-Message-Id: ad139a57-e7a5-4e1d-6259-08dd49ca04b5
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Feb 2025 11:56:56.7308
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ZPSVVPiSVPKnIYXej2QG3S8uLkdvUNOFTC+tXR2GAMEsBjYgH10q4PP2DMyInHFPJKlucojpXkZ4RXCq0K65zaEMFJNMM/A9QfUT9kWcsGo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY4PR01MB14590

Hi Tommaso Merciai,

> -----Original Message-----
> From: Tommaso Merciai <tomm.merciai@gmail.com>
> Sent: 10 February 2025 11:46
> Subject: [PATCH 7/8] media: rzg2l-cru: rzg2l-core: Use temporary variable=
 for struct device in
> rzg2l_cru_probe()
>=20
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>=20
> Use a temporary variable for the struct device pointers to avoid derefere=
ncing.
>=20
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>

Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>

Cheers,
Biju

> ---
>  .../platform/renesas/rzg2l-cru/rzg2l-core.c   | 29 ++++++++++---------
>  1 file changed, 15 insertions(+), 14 deletions(-)
>=20
> diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-core.c
> b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-core.c
> index 89be584a4988..70fed0ce45ea 100644
> --- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-core.c
> +++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-core.c
> @@ -240,10 +240,11 @@ static int rzg2l_cru_media_init(struct rzg2l_cru_de=
v *cru)
>=20
>  static int rzg2l_cru_probe(struct platform_device *pdev)  {
> +	struct device *dev =3D &pdev->dev;
>  	struct rzg2l_cru_dev *cru;
>  	int irq, ret;
>=20
> -	cru =3D devm_kzalloc(&pdev->dev, sizeof(*cru), GFP_KERNEL);
> +	cru =3D devm_kzalloc(dev, sizeof(*cru), GFP_KERNEL);
>  	if (!cru)
>  		return -ENOMEM;
>=20
> @@ -251,32 +252,32 @@ static int rzg2l_cru_probe(struct platform_device *=
pdev)
>  	if (IS_ERR(cru->base))
>  		return PTR_ERR(cru->base);
>=20
> -	cru->presetn =3D devm_reset_control_get_shared(&pdev->dev, "presetn");
> +	cru->presetn =3D devm_reset_control_get_shared(dev, "presetn");
>  	if (IS_ERR(cru->presetn))
> -		return dev_err_probe(&pdev->dev, PTR_ERR(cru->presetn),
> +		return dev_err_probe(dev, PTR_ERR(cru->presetn),
>  				     "Failed to get cpg presetn\n");
>=20
> -	cru->aresetn =3D devm_reset_control_get_exclusive(&pdev->dev, "aresetn"=
);
> +	cru->aresetn =3D devm_reset_control_get_exclusive(dev, "aresetn");
>  	if (IS_ERR(cru->aresetn))
> -		return dev_err_probe(&pdev->dev, PTR_ERR(cru->aresetn),
> +		return dev_err_probe(dev, PTR_ERR(cru->aresetn),
>  				     "Failed to get cpg aresetn\n");
>=20
> -	cru->vclk =3D devm_clk_get(&pdev->dev, "video");
> +	cru->vclk =3D devm_clk_get(dev, "video");
>  	if (IS_ERR(cru->vclk))
> -		return dev_err_probe(&pdev->dev, PTR_ERR(cru->vclk),
> +		return dev_err_probe(dev, PTR_ERR(cru->vclk),
>  				     "Failed to get video clock\n");
>=20
> -	cru->dev =3D &pdev->dev;
> -	cru->info =3D of_device_get_match_data(&pdev->dev);
> +	cru->dev =3D dev;
> +	cru->info =3D of_device_get_match_data(dev);
>=20
>  	irq =3D platform_get_irq(pdev, 0);
>  	if (irq < 0)
>  		return irq;
>=20
> -	ret =3D devm_request_irq(&pdev->dev, irq, rzg2l_cru_irq, 0,
> +	ret =3D devm_request_irq(dev, irq, rzg2l_cru_irq, 0,
>  			       KBUILD_MODNAME, cru);
>  	if (ret)
> -		return dev_err_probe(&pdev->dev, ret, "failed to request irq\n");
> +		return dev_err_probe(dev, ret, "failed to request irq\n");
>=20
>  	platform_set_drvdata(pdev, cru);
>=20
> @@ -285,8 +286,8 @@ static int rzg2l_cru_probe(struct platform_device *pd=
ev)
>  		return ret;
>=20
>  	cru->num_buf =3D RZG2L_CRU_HW_BUFFER_DEFAULT;
> -	pm_suspend_ignore_children(&pdev->dev, true);
> -	pm_runtime_enable(&pdev->dev);
> +	pm_suspend_ignore_children(dev, true);
> +	pm_runtime_enable(dev);
>=20
>  	ret =3D rzg2l_cru_media_init(cru);
>  	if (ret)
> @@ -296,7 +297,7 @@ static int rzg2l_cru_probe(struct platform_device *pd=
ev)
>=20
>  error_dma_unregister:
>  	rzg2l_cru_dma_unregister(cru);
> -	pm_runtime_disable(&pdev->dev);
> +	pm_runtime_disable(dev);
>=20
>  	return ret;
>  }
> --
> 2.34.1


