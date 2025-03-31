Return-Path: <linux-media+bounces-29050-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E19CA765C6
	for <lists+linux-media@lfdr.de>; Mon, 31 Mar 2025 14:26:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7F7D63AAD25
	for <lists+linux-media@lfdr.de>; Mon, 31 Mar 2025 12:26:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D42D21E5716;
	Mon, 31 Mar 2025 12:26:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="hXdXSqLr"
X-Original-To: linux-media@vger.kernel.org
Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010018.outbound.protection.outlook.com [52.101.229.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 020317E107;
	Mon, 31 Mar 2025 12:26:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.18
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743423988; cv=fail; b=pxL22Wlrf+sHpXRZvt2s/X3QyIot3rdGcyzOd/P+8YEcDT6lFe7vHjGFWzfC9mk3fkthdrDTCsBdZ137k/I3S5B/8v2xVcDuwqFJ1+DhxbdC5vIeNtkgGQRJoaMo9tJQ02PY+Un72ZH8ohbE5mQr71skkaUSgTx2O0VPTajDJW8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743423988; c=relaxed/simple;
	bh=MAkEZxUma9fLhEuwv2YoC7yZkjCTPBjH2CQMh67Q8iI=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=U2sBS80cCxGxvsRRP6SFRBkbhmSzMPZKQdLVIUZ+ppQ0EM2ScNi8S/B/CKmCUi6j0LzIU2gDlH94X6vrL8zADSpCunbDTfQCTv/VWA792fIAA0ywiaY2XzZAyt0cCzJXhLbwebhDaSZCCuJG46k8I0CnBe6ov5fbKD3avKJRntE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=hXdXSqLr; arc=fail smtp.client-ip=52.101.229.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iNNOXPZhYvS1jtJDuYuoQt66nHEvckU2B1EEfQSKru9Nmh61HiN8ZRkdvaamu9HY6nahjCibHTgB/O4q8hy75Na6Z6Wc58kLDbROtGMJsYMoKu90lbxcCNWxqt9olhBUBjY3Qbc1FQJGIbYWP5jVZCQ/p5qhKGDyLrEh6qMaMv3BzhihTP5PKeWS+ORnpVqZBr1Ou3k+XKpF0M26DGzVBItx3QXzCQ+hnmEwGEQiWWo/kXfiWNOIuiETBXSa0uzWmBelHK+EFjZ5dn2FQ+SLkUZewryD0/6QQLgx7G/NJHQEBl2fDdkH74M/s7/5racWGxnkCuhecukyaphw/PZ+Og==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fqM7uqmeIVhVcFXXTAivcD405LTg/27cYTiCHPlrgRM=;
 b=ZphjAW0dYeIdqkCVuEghjttszmju6VF7JOp1RhPmYMDGU4fDcrn2Lw/0nyIMnD/+vj4uQzzmTURROA7ytU/BEhoGarme/5iP7Om9qblKTfqMPICvP99evyztWP289HZl885YsAwro1eeEGSB2WxQz57yUbIA45OOwAMlCW6FNnmY6A9ojCjMl+QPXvk8a0FFZm51cpnTihsk6EXw9TFri7ElT6zDZNAAZJ2mQ7J6BSN3gbKp1uddwWhnwJsZMu5KgdraVw1Sb5uYWTTTxo6dP1O20X5kNW5QDbLkVpJRN6RNNB0SYr1LzfL2t0mNG/PSWCz42jOIHtpAZolUEycsVw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fqM7uqmeIVhVcFXXTAivcD405LTg/27cYTiCHPlrgRM=;
 b=hXdXSqLr+DZge5bc4ZEE0AgeZz1kpPGG3FlqESK1+9IrkM25pk00cp0orddyk2qUGiCieFkxDQRJqk7DUsQfYDQSbpg1ju2PhpKJcqysL56qHyZBrdRxlzxVY7QovyUKNDe0W1zBF+RdrsndpC63t4dkC4EcH9DwAZAEFBNEfVA=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by TY1PR01MB10707.jpnprd01.prod.outlook.com (2603:1096:400:31c::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8583.37; Mon, 31 Mar
 2025 12:26:22 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1%4]) with mapi id 15.20.8583.036; Mon, 31 Mar 2025
 12:26:16 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Prabhakar <prabhakar.csengg@gmail.com>, Geert Uytterhoeven
	<geert+renesas@glider.be>, Andrzej Hajda <andrzej.hajda@intel.com>, Neil
 Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
	laurent.pinchart <laurent.pinchart@ideasonboard.com>, Jonas Karlman
	<jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, David Airlie
	<airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Maarten Lankhorst
	<maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>, Kieran Bingham
	<kieran.bingham+renesas@ideasonboard.com>, Stephen Boyd <sboyd@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>
CC: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
	"linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
	"linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>, Fabrizio Castro
	<fabrizio.castro.jz@renesas.com>, Prabhakar Mahadev Lad
	<prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: RE: [PATCH 08/17] drm: renesas: rz-du: mipi_dsi: Add min check for
 VCLK range
Thread-Topic: [PATCH 08/17] drm: renesas: rz-du: mipi_dsi: Add min check for
 VCLK range
Thread-Index: AQHbobfbHglmlyRQFEaaKUYQ1j02TLONLILg
Date: Mon, 31 Mar 2025 12:26:16 +0000
Message-ID:
 <TY3PR01MB11346D7FB3B5702E903029B0986AD2@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20250330210717.46080-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20250330210717.46080-9-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20250330210717.46080-9-prabhakar.mahadev-lad.rj@bp.renesas.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|TY1PR01MB10707:EE_
x-ms-office365-filtering-correlation-id: 00852c70-e5c5-417b-c5b5-08dd704f3c06
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|376014|7416014|1800799024|38070700018|921020;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?EEVNIV8g7FiTrT/+ywVoRoYO9xq+PNJCB7tdslTwjwl6UjKMe0jPTRimQswv?=
 =?us-ascii?Q?1fIeggrBUavECbOf8YjaR2CNHcMvAOV/W4EX7AANIOdvKkMb5gjr1wfQrBbL?=
 =?us-ascii?Q?fhKMohLBsp8XpsEwWx7RSNUIh63mwtvaa4sCQlgMa/hQ6zbGNPDCSpGVq5C2?=
 =?us-ascii?Q?dkxhLMejhg36iEqxZr8RW5lNjjG7L3xJ2ySrgD3sN5m7EajwsvF/WnjuVlne?=
 =?us-ascii?Q?Zmzz9VhyAinHZUlQ4FCqahWKzdkurlT8ROtv6DV9t01ElQBbPzsbinE34rjU?=
 =?us-ascii?Q?usj29mTMg8MVBS4WQdrr1RuTU0KwL7TwOf/fQXxnGldd8VFoNFulIlJzZvwT?=
 =?us-ascii?Q?KnLyUnexE2zp2K3W3hVr2N/xYMblms2vgbs8f70ut/RATf10Dd+bH8QTu2g9?=
 =?us-ascii?Q?dRQ5c6uO7oHkSKFEzvPaKDfdYQlXQXF6Mnb5xRw2S/Z16kfHSe/yBBu8lhwq?=
 =?us-ascii?Q?H2XUmwu621vuD1iT5Q0Ex934ihI+miIItvE6jK52KKQzLjQ1ZrB0GjoCoSvR?=
 =?us-ascii?Q?qOgAH58nJBneDpOZ+AnCA9c/L/SobIqeaIagAhqQW6xWmrZ2T81t5+8fxmcr?=
 =?us-ascii?Q?3YVFEPxrdEsEfc5WXOtxEV1faRd5K2NVEXjA8vkqnTwyZx9n2zHXuau4sFuu?=
 =?us-ascii?Q?o0gy5uP4wZpwW/usgzKp9JkhVMdphYlANpnR3HlawH5+jv2kHpGAxOqnmiOR?=
 =?us-ascii?Q?g4q/ANBX6nSGAZ1wdJT2ksPHZaZITxw9HzlpJQFMchcmBahDmcZAOLW7xxTJ?=
 =?us-ascii?Q?DCJo7Tt3pjpjJ8ARxxlVzIEbNSdg/aG6NURqBRIDOiLzfDHj3/xnIyy3tQj4?=
 =?us-ascii?Q?eePau0WDwj8k/uLRUTdVMdquZ6n3SjXsqm3mCUn4AJojXnq8d+kZOfDb3W8/?=
 =?us-ascii?Q?ImiYGhMwhvac4r/zS80y+UTueB7x2F34zzkczKBtq3/Hc9HJUU4etZ3B7aAL?=
 =?us-ascii?Q?T7wxSLo954nnTOfFhk/oWCEwNo1MZ9/0aK5xGOFjqlbAxfkv6gDXF2/r1jSB?=
 =?us-ascii?Q?m2PyZFxrcYkVvCN3zoz8UGCCEU/a5JTNCWLC0wn/wkEvi1seIxrmx9tezrUs?=
 =?us-ascii?Q?IfM1gW09HWujmeSDIpnwZqVssI0mC+JyUDj3pEvYR6WutQWwJmKStFtGHYeu?=
 =?us-ascii?Q?0hTHH6/uFeM7KR2WuGwb4imJP7hfY82tfTGfbH0mGKbTt9La/6rZWo/zU41I?=
 =?us-ascii?Q?U/k6WUs9INzO4DMISqno0rozTHUgdOABkVsckFCmMJcxC+M8xDXgwhDcL+7K?=
 =?us-ascii?Q?Uv7CRs82EbmAKEk7T6sxnnqnBJgXDexlScqKOnw3kAbxo4wg/LbGTkniaWCd?=
 =?us-ascii?Q?Y4KbHYzFAW6szYRfOT9otrIbmoVu1EE7YmCmR9ntsUTl2keLxDyS8gh8s/et?=
 =?us-ascii?Q?gz+EV5KnHoF7cmRTUB54SuuRHSC6WhjRvD5e7WnrXLzrG9NCKlIYSjWglVI0?=
 =?us-ascii?Q?Hu2qXMy/1+34UxRzcCK70FiECBwKzdk6?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(1800799024)(38070700018)(921020);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?Ota/t9FO0SRPuxUV1QhPvNmh8QhagM51kwhDk5+h4F2xGcdkEj7LEWE4hesQ?=
 =?us-ascii?Q?VNw7v/zRrff+lwO2Reefbscoshv16QY1Oj6TCleFtg1KUC9lgqlJvtLXOCkL?=
 =?us-ascii?Q?Qv1vhY0PCTNRCDD0i7yz5umbiI/91Z1CnRLr44rIFKuQuWrPjvrlx4nRDb+y?=
 =?us-ascii?Q?QwwzDTtOq+tulBpZgWCzOV8NJXXdSo440+vYZTUNnm4ZSE1gvv7LhE+5D28I?=
 =?us-ascii?Q?ZHoonk0k8OLopEOOxK6xx/KlPokAnM1bTEM9cJbDbleW/mmXZUdjmCFJ3VdC?=
 =?us-ascii?Q?tlTDyA2AZOjk+jb1+BpJGDKRuFtmH3WY8AkuBuEm1fBBS+johuxqyjmmi9Ht?=
 =?us-ascii?Q?FbMeqOh1e8mGaHNiZeIAtl0k854kpAGQNLcpohlMhqdfO6PG/0sdMZN4B2yu?=
 =?us-ascii?Q?MAP48BaCxHX7q40VzeTx6NsO8p1oig+cRqPjqXTCt4Q11Krd+A5t1lE8zccy?=
 =?us-ascii?Q?vXB+DdS3ORDE2KrmseqwHltcw4J/s0XRXyd9VxAyfCgsgsQWCWhmDohtJCap?=
 =?us-ascii?Q?XD+92mJDnFswnq0WC/cLwjo+4g+ucnhDCM6hJSUtn7wy3TE/YD4nV5l/a+Jl?=
 =?us-ascii?Q?Y3kXlqfdPUM56rObsq2yoRgL9IYOA2CaMry/qwPcJkN/gASRI4eXZcj1cWh+?=
 =?us-ascii?Q?MknjEBR02x5GVwL0rg86oZu2WOU4PvTHTcSYbVlhXEDOkIseOjymG1qMXyHi?=
 =?us-ascii?Q?8+TZqGmTZo5TN3iHjc54PXtWIm+kbRJkTLm02VOR3TcwinSnOM2qPR3UawH0?=
 =?us-ascii?Q?lJ7voAdnICw0YrlAYU8yQez9gLQF3vR9iIOqDKKPUnDCmzXLSvr35/IvF0Uk?=
 =?us-ascii?Q?se5j0ZLjHBpyHjGYzD5e11RQ/e92QUCBo360xit3iaMvMIvQw7R7o+Sdjl/w?=
 =?us-ascii?Q?4OiCrsFvrVfXKoXiYH1g52e57m6OYOqKniK1vALNqpkwM5l/PYirSp5Balq1?=
 =?us-ascii?Q?K3WW/KG39t2PW8eyuGp6SgY+a1vWa+gPop7BmQZSMPx0dO9Yvqbc/R2FH1q9?=
 =?us-ascii?Q?9vqu1xfHfSXKBRTw1O6Ej3/6iqwC/IfE6aiQ49qeWGwuMyWzWtR5hAJIErG9?=
 =?us-ascii?Q?X4WHhJwhjdSLgewZieQMiBEHCp305fBrm/F4Vu3N9PP4IfaqFZCYk4s7llQC?=
 =?us-ascii?Q?+DOLMd7WlLHeFBiISZoIGKtprGfa4GFeaWZdELrT1W2q0cXmj1ttuqO0sPcF?=
 =?us-ascii?Q?AiWJMGwRfsgQiU4dGZaruq0HT334E9gw/9AmueTrIS4nkAF65RwrjqBSoNqh?=
 =?us-ascii?Q?mUkCjxkXf89UdkgFuPNEJ8oSN2ADJU4K6CZZ+1/KWFWj8uLP4TJ9h52KYNqi?=
 =?us-ascii?Q?vass9c7WbrJS1r1OUc9HO2f0R3RIHTyrxfv1mXZm2e3ZQG2FRb7NqxGDPaZX?=
 =?us-ascii?Q?XuOcPR5FYOhwDdvVluV40V2jLkEbt6UqUZJIJgIF0ZyG2AJdLHi6JYkWaX25?=
 =?us-ascii?Q?nc9leXANX5ZRw0F77/SFWvklq6dKZPwtNGlE4lS4FHY8zVxkZnHItosA2FPU?=
 =?us-ascii?Q?7OZWWZLNJPUhAIH5GiGWWNjx9BobUCGL3S5iQiDDY2AjezDoaYIqv/SRC97t?=
 =?us-ascii?Q?HOywHExHCiRDmsIMyjfZNzVN+FN2KushJGdqhBQmX5C59jgSmM3YCxW9RssE?=
 =?us-ascii?Q?DQ=3D=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 00852c70-e5c5-417b-c5b5-08dd704f3c06
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Mar 2025 12:26:16.7751
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: xgccKCkCqwnfYdzG+vKH/NnCqC1m5SBC8t34CU1gLbPRwHnrwXh1lbf8kz/MydkbB4ONPbFTkXLBbW6rUQ93KDQnLyJkhx9bTxeM4gsQwGY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY1PR01MB10707

Hi Prabhakar,

Thanks for the patch.

> -----Original Message-----
> From: Prabhakar <prabhakar.csengg@gmail.com>
> Sent: 30 March 2025 22:07
> Subject: [PATCH 08/17] drm: renesas: rz-du: mipi_dsi: Add min check for V=
CLK range
>=20
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>=20
> The VCLK range for Renesas RZ/G2L SoC is 148.5 MHz to 5.803 MHz. Add a mi=
nimum clock check in the
> mode_valid callback to ensure that the clock value does not fall below th=
e valid range.
>=20
> Co-developed-by: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
> Signed-off-by: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>

Cheers,
Biju

> ---
>  drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c | 3 +++
>  1 file changed, 3 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c b/drivers/gpu=
/drm/renesas/rz-
> du/rzg2l_mipi_dsi.c
> index fa7a1ae22aa3..c6f60b7f203b 100644
> --- a/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
> +++ b/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
> @@ -585,6 +585,9 @@ rzg2l_mipi_dsi_bridge_mode_valid(struct drm_bridge *b=
ridge,
>  	if (mode->clock > 148500)
>  		return MODE_CLOCK_HIGH;
>=20
> +	if (mode->clock < 5803)
> +		return MODE_CLOCK_LOW;
> +
>  	return MODE_OK;
>  }
>=20
> --
> 2.49.0


