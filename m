Return-Path: <linux-media+bounces-29254-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E1A1BA7950C
	for <lists+linux-media@lfdr.de>; Wed,  2 Apr 2025 20:27:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 999BB16DE8D
	for <lists+linux-media@lfdr.de>; Wed,  2 Apr 2025 18:27:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8A8B41D61A3;
	Wed,  2 Apr 2025 18:27:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="sJN+tthC"
X-Original-To: linux-media@vger.kernel.org
Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011003.outbound.protection.outlook.com [40.107.74.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8ECFF469D;
	Wed,  2 Apr 2025 18:27:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.3
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743618454; cv=fail; b=Jaajq4Qf/AVL9lpyLAwVIPrq1yv6GahlLRFOmyMmeLPG5nyFYgzpz511X7HVqEiegppjeMTKbDN32baXpjlLncUHSBTI0qSF8cihIHwHOUNQcDob6azKxEDkiq05nAu6J3UCE8Y5h8wqxoTn+4j2iYmFlDI8RVln2oFLksjvEg0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743618454; c=relaxed/simple;
	bh=fXPK0+pybAJ1jWmGmBvUVEtsqwsZVpseEwygj4+CGNg=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=d8Qt6DzfEoNy1amBI+gMyW7lsy69xEes0xxBpTnkJ5Zw28+lSgoRki84UTSgf3TTUf/xFnvZV3JWaP+M/RIfUBxprFRoTD+BJGPs3uGNlAzsxwg6uWpvdE95BnJQKyAYixrsc33uM95IdS5JBMqc58qG8VT3pItTGyuRbQC3fNo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=sJN+tthC; arc=fail smtp.client-ip=40.107.74.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aUp5ReDyM2S69v1O71VoCfaOj0AMML2DJIfO5/Vr7v+/p5HqKmEUBpoKCouILEhzPX6uSgXgjCeOOL1+Nxj2HSgENjvz3CIaBYNRtsOrtQpQAAiKlk5q4o9povkEo7l70+OYklJbeLKi5ekdNaomJxiXNwQjvhCQh/Gjl4cryQO/uQNJ+MYdUVcEMdc9xH9nnfGc+UwjwhWIO2D+N9+iT2JZ5z0GHfw+FE7dvroBA2KQmJ2wAM1mQkbF+sQYsFhHLeEwvkJsL/6V4AlUO3mT92a7h/7A9fVvXtKs3gKx2EhDsBzEh2zxGGW8aYFU2w17wR1BnI1eiPb7WAcufxiudA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zd58JAzJG9pK/AWJQ+QOI10pu4xpYmq1zeyHbb2QGkI=;
 b=TH0vHm+2lRiSTKOpZVdOS6baq3EQDx0Gf1o3QuLL3AOWQsPOX6M89JhBWgy4Cw2KPTHk+UXEB2OnV1vMsuLEkrzP1H1i3XIUzOsE1J1DRqoHPhtDl3L0/vPXz/Fqde1/bDXiBO96I4ssh1jkkajKdD8dByugGa/iCSuv/YaiQdv7c9aQKRkoHPILTd3A2tLUn+oSuQf0V4tFNop7gtDa/Cnod5BalQwGunXn415XxteTqRQKUMrsxdXaMGsSA1jycyUkcc919N0AFegUZyCqUQAYy7nXDU1zMTa6fIeBI29NjnB+U81wI38WkWQfBdPCpfhaailOTr/mFCECIVdl/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zd58JAzJG9pK/AWJQ+QOI10pu4xpYmq1zeyHbb2QGkI=;
 b=sJN+tthCF8NoTsijYfLeaEX0/0ZMzCtccqIUCb1Cg4UotdKmS8NpLz5BWdg6JKx9W+8frKKKXRcqFgMRyoPOpKhaQPWDJOwsVlv0yRqxsijVMSHRFdVD1XB2aAOE+jg0Ty3h6cHyAmTm3dW1UAi6V7E5V1rYEIJN8UEONpiCuIs=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by OSZPR01MB7003.jpnprd01.prod.outlook.com (2603:1096:604:13b::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8583.39; Wed, 2 Apr
 2025 18:27:23 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1%4]) with mapi id 15.20.8583.038; Wed, 2 Apr 2025
 18:27:23 +0000
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
Subject: RE: [PATCH 17/17] drm: renesas: rz-du: mipi_dsi: Add support for
 RZ/V2H(P) SoC
Thread-Topic: [PATCH 17/17] drm: renesas: rz-du: mipi_dsi: Add support for
 RZ/V2H(P) SoC
Thread-Index: AQHbobfmh4CklWWzM0avCCEqaiGGFbOQtU8A
Date: Wed, 2 Apr 2025 18:27:23 +0000
Message-ID:
 <TY3PR01MB1134665BB606FE66E50FA372986AF2@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20250330210717.46080-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20250330210717.46080-18-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20250330210717.46080-18-prabhakar.mahadev-lad.rj@bp.renesas.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|OSZPR01MB7003:EE_
x-ms-office365-filtering-correlation-id: 31815b0b-752d-4950-5313-08dd72140302
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|7416014|376014|1800799024|38070700018|921020;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?yJiz/LeauguXRZ3EbIdFlR+V9WRgIn4vPl7DulRH9T9Y3qql8q7Zbp2QQ2Av?=
 =?us-ascii?Q?IBOAl5vbZQpSv1INOe2WP/to4l5pWHNgnv6GAxRkuCojo1DxKJ+J8kjmWr2Y?=
 =?us-ascii?Q?clOdfs3cz+IgPdUIf+8s2NsL0iKhiIVvAC4c18e0VqWK0MrH3Mvt4bLuDUxP?=
 =?us-ascii?Q?YjtTZM+29FKra9HDtdaC9kArrQuEITTx6+JE3zkdU6N/68wBlDD9bfXv675C?=
 =?us-ascii?Q?DAgnogEYQ3e5b56DLad9gogkFC3HY9x1itWr18YFFqV3u8mHOV/LZLdiTVhn?=
 =?us-ascii?Q?sV5/gMIwyg3P3riiRSK0nc9OlMbLQvjWIcZCqiLnPtg4f6v/FXItX0mtn5d8?=
 =?us-ascii?Q?7TNSizKV1R5nxPZXP4jFvtph6ulzTa/UhJFXdr562REkN9gLD6YdzogFkpO2?=
 =?us-ascii?Q?Y2NiNdk3Ru92iGX02/GtOJk0DbBLvlmJePBlTi0tLSeWOU1GXm/i80kMTKdO?=
 =?us-ascii?Q?I5suEtwhaoKAi/iSIrkZjvU+bwR46I5nzGpDGN40cn/Jkh+n2SAhFgEql935?=
 =?us-ascii?Q?97GEoG3/Psm46FhpzS5Y8WIEyvyKrcBETV1B4wLWvsoSjlmQsNi4Qb9e4XAq?=
 =?us-ascii?Q?g9KXcjT2yHhYq1tQm9boXOe2MCG8fY+5rdDJHazWiXJNrI2waY4pGsBe9Xvc?=
 =?us-ascii?Q?0wv8l0B4HDJEnhLfCxQBCTxHGkq14loOTmX9IJ7ea+2bcDhYZLdBnyNJ55He?=
 =?us-ascii?Q?ltFxr0vhvtECUjbqIfNZ1oRb0n1ey01kS4S7xSFdapj5tv8V+BerMFyp3q1e?=
 =?us-ascii?Q?gdoMDrntVJnFeFpIDZwBBdEhDvDKW//kpWF2V/jBx1sG/0Lmv3rdBo4g7Vyc?=
 =?us-ascii?Q?Pi2se6/RlDH8q1DzzbvP8xqWk8wP53hP5l6FCjPoUkwrdVbkDaCypWRbOxu1?=
 =?us-ascii?Q?LMDzVNVWOCSF/9VxXfT6HBSH0Cvid8YBfOAOOoemqcNJc1p3RDWHiZDZ7VSH?=
 =?us-ascii?Q?wbW6yAMV+evG7SZVS5DG3aicKYnqAO2a02sl2J1dziiyaTNFu+SNct7YVQfB?=
 =?us-ascii?Q?S7mcR8kHNgEyVbf6Ul59EZi7+f1Bk5DIV/hjKjskFNDUiN2tQT9Qq2G0xjzr?=
 =?us-ascii?Q?v0NtBMk5OQZafMgctp0Xy5nIMOP67OyiYeVEuW67D4taFPVV2z978xSzi5oL?=
 =?us-ascii?Q?VHXcM484cJ5yySIgC9KH8Ffo7/lkc5gqxr06WQYeZrg22/Fy4KErollrBneQ?=
 =?us-ascii?Q?zaHDHUcCYqr/v1Y3RMeBuD+mI6HE5JcRSsLnv2R8QleQ/QWP7wGnMX+S83qi?=
 =?us-ascii?Q?dV+0dFVEx/MJoPjJghQDBnfsx/Tddu9/BXQcfqqPQRIRSNWYtoGWyIV43YSn?=
 =?us-ascii?Q?H0MF4nCCd1c76XYNR8SQno13KaAKiV+94shmqoHwsfg3kEMPITBRLnzMbxeY?=
 =?us-ascii?Q?j57PM93egd29hOGU+fWQg5NFBjKtWwKiqi2rG38EYfazBwOvK44dTvcSwrx/?=
 =?us-ascii?Q?lKl7Wid5JDWqZHRJkmbBwe2LJx6/DPmT8A7wjmgxWE/j0AmQGnIroQ=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(1800799024)(38070700018)(921020);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?yAh+GwmVoxCvSGFUH2egpgSqpxs/3j8GekbauyAIs1pVked8WrRqRAYLWa8g?=
 =?us-ascii?Q?azuBfRGcwdKkeLa6oDarizb1LndjchYY4xBkLVSUnSIW2FsJvt5J1TIdRMs9?=
 =?us-ascii?Q?tHO6EWX7tDKUnB1Bs+stzZwaYr15nAWn1EWx3Tytl2b4tIZhkMZLmSyYb3OE?=
 =?us-ascii?Q?uJJwLCXmAweOZ90TM98Krtkfg5HIEaongw/LcosLigP+NlbSalxXhCTnZp1C?=
 =?us-ascii?Q?uQfFSOxlHBGwujlUOKNm2jQaAbnyMQauahU9OPGA/Ppd687HXW907O35SfFc?=
 =?us-ascii?Q?wbS6Tw63zLZgBaVTVJVBzrhQBtV6/PRPaijtYrdbzybL0y1LQEvKtn/ryHMb?=
 =?us-ascii?Q?3ti+FDz/IR+ZffUaw1TVldDe2htjMtJ2AwK0uwPzaIXkCSyXqhQDDqDEHNCO?=
 =?us-ascii?Q?EXiRut4ovBGcNo0cIcyqhuAsfjZHt1/yAv4Mc/au6NmNvo7tp3rwEFaiQiK4?=
 =?us-ascii?Q?M7JydyDRtNSY4g9TOjaSqkOSbi2Eg3CGpq8qK87ROwGiWBacWxp73sDejVbu?=
 =?us-ascii?Q?Kn3U/M93U51kCN8zXq/0QF5nsF8L3gzjz3wJc841CZggHN/o5f+gGOnlPtbL?=
 =?us-ascii?Q?XDO7s8797AZv6/nY9QohU+5QMsz1qoCncloqd0AO090ad0JNXMsWuGJZ4ORg?=
 =?us-ascii?Q?Rf3EkBCLcWelrS4vvSCjcmdtfPWRdOIviGcVRGp2Qte3bwyyhpXMfPGhmSaY?=
 =?us-ascii?Q?gyKp4FRoKFAjyZRt/5w4GFDBYuAGBXcOmGvipZzFM+voJ+NsmpEBLuehFWZX?=
 =?us-ascii?Q?6xI5bp8P78pkngM5oo4Dw7AOtSLykdkycL2bdX4Dl+15PuZQYA1FjwI7vY3H?=
 =?us-ascii?Q?TvRzvNxqN8HlGm3YTe42jIsgBlsRWTOjOVIgYg6a1Qbgnb2Q9oKD7FnhjS/M?=
 =?us-ascii?Q?r8WIwz2is1RsQ51xSbkEImJEtrjIBrM8XeXPRtC+VSs+yi/wUGZMtBMMqCPI?=
 =?us-ascii?Q?ha1LbBkX142xNFchv8O3X441BJoOCZD1zZW0l7bIuqB/oy8KxTnzIa9i3lc3?=
 =?us-ascii?Q?/uJ2afUHcLFGMCHRnHNhJZnPbbvBibje3bP4jItQelbOCli1oulKTNB29OeS?=
 =?us-ascii?Q?8Ejqh0c+4QICG4sazA688lVTBbeDC4aGSKEEp+Qz3qRIpIHmmrGLgkbkXuov?=
 =?us-ascii?Q?XQgPO/B2UDoW7z2ljwcCZBKIIOQs3y9nG0hbWOKCcJQ05lh6Ge2rXIs+QLC7?=
 =?us-ascii?Q?XGOEEHKmQOxyDvxsDRF5Rh069+/hAsdqaWv2nwI2TsobFQ3YCMgqFZC5ziLE?=
 =?us-ascii?Q?qRyvyJo6z9RLg+WPMwP0my+hoXPZLKcNs/ymfTgN8sllzXFP+DO7V8kDoPgD?=
 =?us-ascii?Q?WFDiCVDtfrOuHV+1dvOabP935oZaJajWwX2AHdcTqfQALLObgSZQUnGXu2n+?=
 =?us-ascii?Q?qi3AhvjXFuIKJe+JAbCBDMzCgDMNCbmnYDDrH1Bih/WuKNvoQcx0ulImUBsY?=
 =?us-ascii?Q?L3sTPRTaLzBwx8bWFmUWyVEvcjXdl0XWFXA4oWzmEgU80PAIEuIhDo3EYWyW?=
 =?us-ascii?Q?tmbt+XVnZvAUzopRtdKgGIy6/6ilAoxgUr1T32MWKNEvdH+egAkn/CPXhsZf?=
 =?us-ascii?Q?tzcv5MOHT99m7azdMyO+l7JY6oq9nJVZwhJydfO6mN/RGD0kkG6Qyg8YZEji?=
 =?us-ascii?Q?Jw=3D=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 31815b0b-752d-4950-5313-08dd72140302
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Apr 2025 18:27:23.1576
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: e3s/IQpsTLe501G8LePHQV//Nuf+eaB3v0wEHwlElor1TSqf0IFxtKLOQbwdNLJypLT7RDXiEURUjxQdY5MK6l0+8KL1yrEB6jaU1FArTAA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSZPR01MB7003

Hi Prabhakar,

> -----Original Message-----
> From: Prabhakar <prabhakar.csengg@gmail.com>
> Sent: 30 March 2025 22:07
> Subject: [PATCH 17/17] drm: renesas: rz-du: mipi_dsi: Add support for RZ/=
V2H(P) SoC
>=20
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>=20
> Add DSI support for Renesas RZ/V2H(P) SoC.
>=20
> Co-developed-by: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
> Signed-off-by: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> ---
>  .../gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c    | 450 ++++++++++++++++++
>  .../drm/renesas/rz-du/rzg2l_mipi_dsi_regs.h   |  40 ++
>  2 files changed, 490 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c b/drivers/gpu=
/drm/renesas/rz-
> du/rzg2l_mipi_dsi.c
> index 26ec0f5d065a..3a70f479d473 100644
> --- a/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
> +++ b/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
> @@ -5,6 +5,7 @@
>   * Copyright (C) 2022 Renesas Electronics Corporation
>   */
>  #include <linux/clk.h>
> +#include <linux/clk/renesas-rzv2h-dsi.h>
>  #include <linux/delay.h>
>  #include <linux/io.h>
>  #include <linux/iopoll.h>
> @@ -30,6 +31,9 @@
>=20
>  struct rzg2l_mipi_dsi;
>=20
> +#define RZV2H_MIPI_DPHY_FOUT_MIN_IN_MEGA	(80 * MEGA)
> +#define RZV2H_MIPI_DPHY_FOUT_MAX_IN_MEGA	(1500 * MEGA)
> +
>  #define RZ_MIPI_DSI_16BPP	BIT(0)
>  #define RZ_MIPI_DSI_HASLPCLK	BIT(1)
>=20
> @@ -41,6 +45,7 @@ struct rzg2l_mipi_dsi_hw_info {
>  			      unsigned long long *hsfreq_mhz);
>  	unsigned int (*dphy_mode_clk_check)(struct rzg2l_mipi_dsi *dsi,
>  					    unsigned long mode_freq);
> +	const struct rzv2h_plldsi_div_limits *cpg_dsi_limits;
>  	u32 phy_reg_offset;
>  	u32 link_reg_offset;
>  	unsigned long max_dclk;
> @@ -49,6 +54,11 @@ struct rzg2l_mipi_dsi_hw_info {
>  	u8 features;
>  };
>=20
> +struct rzv2h_dsi_mode_calc {
> +	unsigned long mode_freq;
> +	unsigned long long mode_freq_hz;
> +};
> +
>  struct rzg2l_mipi_dsi {
>  	struct device *dev;
>  	void __iomem *mmio;
> @@ -70,6 +80,18 @@ struct rzg2l_mipi_dsi {
>  	unsigned int num_data_lanes;
>  	unsigned int lanes;
>  	unsigned long mode_flags;
> +
> +	struct rzv2h_dsi_mode_calc mode_calc;
> +	struct rzv2h_plldsi_parameters dsi_parameters; };
> +
> +static const struct rzv2h_plldsi_div_limits rzv2h_plldsi_div_limits =3D =
{
> +	.m =3D { .min =3D 64, .max =3D 1023 },
> +	.p =3D { .min =3D 1, .max =3D 4 },
> +	.s =3D { .min =3D 0, .max =3D 5 },
> +	.k =3D { .min =3D -32768, .max =3D 32767 },
> +	.csdiv =3D { .min =3D 1, .max =3D 1 },
> +	.fvco =3D { .min =3D 1050 * MEGA, .max =3D 2100 * MEGA }
>  };
>=20
>  static inline struct rzg2l_mipi_dsi *
> @@ -186,6 +208,249 @@ static const struct rzg2l_mipi_dsi_timings rzg2l_mi=
pi_dsi_global_timings[] =3D {
>  	},
>  };
>=20
> +struct rzv2h_mipi_dsi_timings {
> +	unsigned long hsfreq;
> +	u16 value;
> +};
> +
> +static const struct rzv2h_mipi_dsi_timings TCLKPRPRCTL[] =3D {
> +	{150000000UL, 0},
> +	{260000000UL, 1},
> +	{370000000UL, 2},
> +	{470000000UL, 3},
> +	{580000000UL, 4},
> +	{690000000UL, 5},
> +	{790000000UL, 6},
> +	{900000000UL, 7},
> +	{1010000000UL, 8},
> +	{1110000000UL, 9},
> +	{1220000000UL, 10},
> +	{1330000000UL, 11},
> +	{1430000000UL, 12},
> +	{1500000000UL, 13},
> +};
> +
> +static const struct rzv2h_mipi_dsi_timings TCLKZEROCTL[] =3D {
> +	{90000000UL, 2},
> +	{110000000UL, 3},
> +	{130000000UL, 4},
> +	{150000000UL, 5},
> +	{180000000UL, 6},
> +	{210000000UL, 7},
> +	{230000000UL, 8},
> +	{240000000UL, 9},
> +	{250000000UL, 10},
> +	{270000000UL, 11},
> +	{290000000UL, 12},
> +	{310000000UL, 13},
> +	{340000000UL, 14},
> +	{360000000UL, 15},
> +	{380000000UL, 16},
> +	{410000000UL, 17},
> +	{430000000UL, 18},
> +	{450000000UL, 19},
> +	{470000000UL, 20},
> +	{500000000UL, 21},
> +	{520000000UL, 22},
> +	{540000000UL, 23},
> +	{570000000UL, 24},
> +	{590000000UL, 25},
> +	{610000000UL, 26},
> +	{630000000UL, 27},
> +	{660000000UL, 28},
> +	{680000000UL, 29},
> +	{700000000UL, 30},
> +	{730000000UL, 31},
> +	{750000000UL, 32},
> +	{770000000UL, 33},
> +	{790000000UL, 34},
> +	{820000000UL, 35},
> +	{840000000UL, 36},
> +	{860000000UL, 37},
> +	{890000000UL, 38},
> +	{910000000UL, 39},
> +	{930000000UL, 40},
> +	{950000000UL, 41},
> +	{980000000UL, 42},
> +	{1000000000UL, 43},
> +	{1020000000UL, 44},
> +	{1050000000UL, 45},
> +	{1070000000UL, 46},
> +	{1090000000UL, 47},
> +	{1110000000UL, 48},
> +	{1140000000UL, 49},
> +	{1160000000UL, 50},
> +	{1180000000UL, 51},
> +	{1210000000UL, 52},
> +	{1230000000UL, 53},
> +	{1250000000UL, 54},
> +	{1270000000UL, 55},
> +	{1300000000UL, 56},
> +	{1320000000UL, 57},
> +	{1340000000UL, 58},
> +	{1370000000UL, 59},
> +	{1390000000UL, 60},
> +	{1410000000UL, 61},
> +	{1430000000UL, 62},
> +	{1460000000UL, 63},
> +	{1480000000UL, 64},
> +	{1500000000UL, 65},
> +};
> +
> +static const struct rzv2h_mipi_dsi_timings TCLKPOSTCTL[] =3D {
> +	{80000000UL, 6},
> +	{210000000UL, 7},
> +	{340000000UL, 8},
> +	{480000000UL, 9},
> +	{610000000UL, 10},
> +	{740000000UL, 11},
> +	{880000000UL, 12},
> +	{1010000000UL, 13},
> +	{1140000000UL, 14},
> +	{1280000000UL, 15},
> +	{1410000000UL, 16},
> +	{1500000000UL, 17},
> +};
> +
> +static const struct rzv2h_mipi_dsi_timings TCLKTRAILCTL[] =3D {
> +	{140000000UL, 1},
> +	{250000000UL, 2},
> +	{370000000UL, 3},
> +	{480000000UL, 4},
> +	{590000000UL, 5},
> +	{710000000UL, 6},
> +	{820000000UL, 7},
> +	{940000000UL, 8},
> +	{1050000000UL, 9},
> +	{1170000000UL, 10},
> +	{1280000000UL, 11},
> +	{1390000000UL, 12},
> +	{1500000000UL, 13},
> +};
> +
> +static const struct rzv2h_mipi_dsi_timings THSPRPRCTL[] =3D {
> +	{110000000UL, 0},
> +	{190000000UL, 1},
> +	{290000000UL, 2},
> +	{400000000UL, 3},
> +	{500000000UL, 4},
> +	{610000000UL, 5},
> +	{720000000UL, 6},
> +	{820000000UL, 7},
> +	{930000000UL, 8},
> +	{1030000000UL, 9},
> +	{1140000000UL, 10},
> +	{1250000000UL, 11},
> +	{1350000000UL, 12},
> +	{1460000000UL, 13},
> +	{1500000000UL, 14},
> +};
> +
> +static const struct rzv2h_mipi_dsi_timings THSZEROCTL[] =3D {
> +	{180000000UL, 0},
> +	{240000000UL, 1},
> +	{290000000UL, 2},
> +	{350000000UL, 3},
> +	{400000000UL, 4},
> +	{460000000UL, 5},
> +	{510000000UL, 6},
> +	{570000000UL, 7},
> +	{620000000UL, 8},
> +	{680000000UL, 9},
> +	{730000000UL, 10},
> +	{790000000UL, 11},
> +	{840000000UL, 12},
> +	{900000000UL, 13},
> +	{950000000UL, 14},
> +	{1010000000UL, 15},
> +	{1060000000UL, 16},
> +	{1120000000UL, 17},
> +	{1170000000UL, 18},
> +	{1230000000UL, 19},
> +	{1280000000UL, 20},
> +	{1340000000UL, 21},
> +	{1390000000UL, 22},
> +	{1450000000UL, 23},
> +	{1500000000UL, 24},
> +};
> +
> +static const struct rzv2h_mipi_dsi_timings THSTRAILCTL[] =3D {
> +	{100000000UL, 3},
> +	{210000000UL, 4},
> +	{320000000UL, 5},
> +	{420000000UL, 6},
> +	{530000000UL, 7},
> +	{640000000UL, 8},
> +	{750000000UL, 9},
> +	{850000000UL, 10},
> +	{960000000UL, 11},
> +	{1070000000UL, 12},
> +	{1180000000UL, 13},
> +	{1280000000UL, 14},
> +	{1390000000UL, 15},
> +	{1500000000UL, 16},
> +};
> +
> +static const struct rzv2h_mipi_dsi_timings TLPXCTL[] =3D {
> +	{130000000UL, 0},
> +	{260000000UL, 1},
> +	{390000000UL, 2},
> +	{530000000UL, 3},
> +	{660000000UL, 4},
> +	{790000000UL, 5},
> +	{930000000UL, 6},
> +	{1060000000UL, 7},
> +	{1190000000UL, 8},
> +	{1330000000UL, 9},
> +	{1460000000UL, 10},
> +	{1500000000UL, 11},
> +};
> +
> +static const struct rzv2h_mipi_dsi_timings THSEXITCTL[] =3D {
> +	{150000000UL, 1},
> +	{230000000UL, 2},
> +	{310000000UL, 3},
> +	{390000000UL, 4},
> +	{470000000UL, 5},
> +	{550000000UL, 6},
> +	{630000000UL, 7},
> +	{710000000UL, 8},
> +	{790000000UL, 9},
> +	{870000000UL, 10},
> +	{950000000UL, 11},
> +	{1030000000UL, 12},
> +	{1110000000UL, 13},
> +	{1190000000UL, 14},
> +	{1270000000UL, 15},
> +	{1350000000UL, 16},
> +	{1430000000UL, 17},
> +	{1500000000UL, 18},
> +};
> +
> +static const struct rzv2h_mipi_dsi_timings ULPSEXIT[] =3D {
> +	{1953125UL, 49},
> +	{3906250UL, 98},
> +	{7812500UL, 195},
> +	{15625000UL, 391},
> +};
> +
> +static int rzv2h_dphy_find_timings_val(unsigned long freq,
> +				       const struct rzv2h_mipi_dsi_timings timings[],
> +				       unsigned int size)
> +{
> +	unsigned int i;
> +
> +	for (i =3D 0; i < size; i++) {
> +		if (freq <=3D timings[i].hsfreq)
> +			break;
> +	}
> +
> +	if (i =3D=3D size)
> +		i -=3D 1;
> +
> +	return timings[i].value;
> +};
> +
>  static void rzg2l_mipi_dsi_phy_write(struct rzg2l_mipi_dsi *dsi, u32 reg=
, u32 data)  {
>  	iowrite32(data, dsi->mmio + dsi->info->phy_reg_offset + reg); @@ -307,6=
 +572,168 @@ static int
> rzg2l_dphy_conf_clks(struct rzg2l_mipi_dsi *dsi, unsigned long mode_f
>  	return 0;
>  }
>=20
> +static unsigned int rzv2h_dphy_mode_clk_check(struct rzg2l_mipi_dsi *dsi=
,
> +					      unsigned long mode_freq)
> +{
> +	struct rzv2h_plldsi_parameters *dsi_parameters =3D &dsi->dsi_parameters=
;
> +	unsigned long long hsfreq_mhz, mode_freq_hz, mode_freq_mhz;
> +	struct rzv2h_plldsi_parameters cpg_dsi_parameters;
> +	unsigned int bpp, i;
> +
> +	bpp =3D mipi_dsi_pixel_format_to_bpp(dsi->format);
> +
> +	for (i =3D 0; i < 10; i +=3D 1) {
> +		unsigned long hsfreq;
> +		bool parameters_found;
> +
> +		mode_freq_hz =3D mode_freq * KILO + i;
> +		mode_freq_mhz =3D mode_freq_hz * KILO * 1ULL;
> +		parameters_found =3D rzv2h_dsi_get_pll_parameters_values(dsi->info->cp=
g_dsi_limits,
> +								       &cpg_dsi_parameters,
> +								       mode_freq_mhz);
> +		if (!parameters_found)
> +			continue;
> +
> +		hsfreq_mhz =3D DIV_ROUND_CLOSEST_ULL(cpg_dsi_parameters.freq_mhz * bpp=
, dsi->lanes);
> +		parameters_found =3D rzv2h_dsi_get_pll_parameters_values(&rzv2h_plldsi=
_div_limits,
> +								       dsi_parameters,
> +								       hsfreq_mhz);
> +		if (!parameters_found)
> +			continue;
> +
> +		if (abs(dsi_parameters->error_mhz) >=3D 500)
> +			continue;
> +
> +		hsfreq =3D DIV_ROUND_CLOSEST_ULL(hsfreq_mhz, KILO);
> +		if (hsfreq >=3D RZV2H_MIPI_DPHY_FOUT_MIN_IN_MEGA &&
> +		    hsfreq <=3D RZV2H_MIPI_DPHY_FOUT_MAX_IN_MEGA) {
> +			dsi->mode_calc.mode_freq_hz =3D mode_freq_hz;
> +			dsi->mode_calc.mode_freq =3D mode_freq;
> +			return MODE_OK;
> +		}
> +	}
> +
> +	return MODE_CLOCK_RANGE;
> +}
> +
> +static int rzv2h_dphy_conf_clks(struct rzg2l_mipi_dsi *dsi, unsigned lon=
g mode_freq,
> +				unsigned long long *hsfreq_mhz)
> +{
> +	struct rzv2h_plldsi_parameters *dsi_parameters =3D &dsi->dsi_parameters=
;
> +	unsigned long status;
> +
> +	if (dsi->mode_calc.mode_freq !=3D mode_freq) {
> +		status =3D rzv2h_dphy_mode_clk_check(dsi, mode_freq);
> +		if (status !=3D MODE_OK) {
> +			dev_err(dsi->dev, "No PLL parameters found for mode clk %lu\n",
> +				mode_freq);
> +			return -EINVAL;
> +		}
> +	}
> +
> +	clk_set_rate(dsi->vclk, dsi->mode_calc.mode_freq_hz);
> +	*hsfreq_mhz =3D dsi_parameters->freq_mhz;
> +
> +	return 0;
> +}
> +
> +static int rzv2h_mipi_dsi_dphy_init(struct rzg2l_mipi_dsi *dsi,
> +				    unsigned long long hsfreq_mhz)
> +{
> +	struct rzv2h_plldsi_parameters *dsi_parameters =3D &dsi->dsi_parameters=
;
> +	unsigned long lpclk_rate =3D clk_get_rate(dsi->lpclk);
> +	u32 phytclksetr, phythssetr, phytlpxsetr, phycr;
> +	struct rzg2l_mipi_dsi_timings dphy_timings;
> +	unsigned long long hsfreq;
> +	u32 ulpsexit;
> +
> +	hsfreq =3D DIV_ROUND_CLOSEST_ULL(hsfreq_mhz, KILO);
> +
> +	if (dsi_parameters->freq_mhz =3D=3D hsfreq_mhz)
> +		goto parameters_found;
> +
> +	if (rzv2h_dsi_get_pll_parameters_values(&rzv2h_plldsi_div_limits,
> +						dsi_parameters, hsfreq_mhz))
> +		goto parameters_found;
> +
> +	dev_err(dsi->dev, "No PLL parameters found for HSFREQ %lluHz\n", hsfreq=
);
> +	return -EINVAL;
> +
> +parameters_found:
> +	dphy_timings.tclk_trail =3D
> +		rzv2h_dphy_find_timings_val(hsfreq, TCLKTRAILCTL,
> +					    ARRAY_SIZE(TCLKTRAILCTL));
> +	dphy_timings.tclk_post =3D
> +		rzv2h_dphy_find_timings_val(hsfreq, TCLKPOSTCTL,
> +					    ARRAY_SIZE(TCLKPOSTCTL));
> +	dphy_timings.tclk_zero =3D
> +		rzv2h_dphy_find_timings_val(hsfreq, TCLKZEROCTL,
> +					    ARRAY_SIZE(TCLKZEROCTL));
> +	dphy_timings.tclk_prepare =3D
> +		rzv2h_dphy_find_timings_val(hsfreq, TCLKPRPRCTL,
> +					    ARRAY_SIZE(TCLKPRPRCTL));
> +	dphy_timings.ths_exit =3D
> +		rzv2h_dphy_find_timings_val(hsfreq, THSEXITCTL,
> +					    ARRAY_SIZE(THSEXITCTL));
> +	dphy_timings.ths_trail =3D
> +		rzv2h_dphy_find_timings_val(hsfreq, THSTRAILCTL,
> +					    ARRAY_SIZE(THSTRAILCTL));
> +	dphy_timings.ths_zero =3D
> +		rzv2h_dphy_find_timings_val(hsfreq, THSZEROCTL,
> +					    ARRAY_SIZE(THSZEROCTL));
> +	dphy_timings.ths_prepare =3D
> +		rzv2h_dphy_find_timings_val(hsfreq, THSPRPRCTL,
> +					    ARRAY_SIZE(THSPRPRCTL));
> +	dphy_timings.tlpx =3D
> +		rzv2h_dphy_find_timings_val(hsfreq, TLPXCTL,
> +					    ARRAY_SIZE(TLPXCTL));
> +	ulpsexit =3D
> +		rzv2h_dphy_find_timings_val(lpclk_rate, ULPSEXIT,
> +					    ARRAY_SIZE(ULPSEXIT));
> +
> +	phytclksetr =3D PHYTCLKSETR_TCLKTRAILCTL(dphy_timings.tclk_trail) |
> +		      PHYTCLKSETR_TCLKPOSTCTL(dphy_timings.tclk_post) |
> +		      PHYTCLKSETR_TCLKZEROCTL(dphy_timings.tclk_zero) |
> +		      PHYTCLKSETR_TCLKPRPRCTL(dphy_timings.tclk_prepare);
> +	phythssetr =3D PHYTHSSETR_THSEXITCTL(dphy_timings.ths_exit) |
> +		     PHYTHSSETR_THSTRAILCTL(dphy_timings.ths_trail) |
> +		     PHYTHSSETR_THSZEROCTL(dphy_timings.ths_zero) |
> +		     PHYTHSSETR_THSPRPRCTL(dphy_timings.ths_prepare);
> +	phytlpxsetr =3D rzg2l_mipi_dsi_phy_read(dsi, PHYTLPXSETR) & ~GENMASK(7,=
 0);
> +	phytlpxsetr |=3D PHYTLPXSETR_TLPXCTL(dphy_timings.tlpx);
> +	phycr =3D rzg2l_mipi_dsi_phy_read(dsi, PHYCR) & ~GENMASK(9, 0);
> +	phycr |=3D PHYCR_ULPSEXIT(ulpsexit);
> +
> +	/* Setting all D-PHY Timings Registers */
> +	rzg2l_mipi_dsi_phy_write(dsi, PHYTCLKSETR, phytclksetr);
> +	rzg2l_mipi_dsi_phy_write(dsi, PHYTHSSETR, phythssetr);
> +	rzg2l_mipi_dsi_phy_write(dsi, PHYTLPXSETR, phytlpxsetr);
> +	rzg2l_mipi_dsi_phy_write(dsi, PHYCR, phycr);
> +
> +	rzg2l_mipi_dsi_phy_write(dsi, PLLCLKSET0R,
> +				 PLLCLKSET0R_PLL_S(dsi_parameters->s) |
> +				 PLLCLKSET0R_PLL_P(dsi_parameters->p) |
> +				 PLLCLKSET0R_PLL_M(dsi_parameters->m));
> +	rzg2l_mipi_dsi_phy_write(dsi, PLLCLKSET1R, PLLCLKSET1R_PLL_K(dsi_parame=
ters->k));
> +	udelay(20);
> +
> +	rzg2l_mipi_dsi_phy_write(dsi, PLLENR, PLLENR_PLLEN);
> +	udelay(500);
> +
> +	return 0;
> +}
> +
> +static void rzv2h_mipi_dsi_dphy_late_init(struct rzg2l_mipi_dsi *dsi) {
> +	udelay(220);
> +	rzg2l_mipi_dsi_phy_write(dsi, PHYRSTR, PHYRSTR_PHYMRSTN); }
> +
> +static void rzv2h_mipi_dsi_dphy_exit(struct rzg2l_mipi_dsi *dsi) {
> +	rzg2l_mipi_dsi_phy_write(dsi, PLLENR, 0); }
> +
>  static int rzg2l_mipi_dsi_startup(struct rzg2l_mipi_dsi *dsi,
>  				  const struct drm_display_mode *mode)  { @@ -409,6 +836,9 @@ static=
 void
> rzg2l_mipi_dsi_set_display_timing(struct rzg2l_mipi_dsi *dsi,
>  	case 18:
>  		vich1ppsetr =3D VICH1PPSETR_DT_RGB18;
>  		break;
> +	case 16:
> +		vich1ppsetr =3D VICH1PPSETR_DT_RGB16;
> +		break;
>  	}
>=20
>  	if ((dsi->mode_flags & MIPI_DSI_MODE_VIDEO_SYNC_PULSE) && @@ -439,6 +86=
9,9 @@ static void
> rzg2l_mipi_dsi_set_display_timing(struct rzg2l_mipi_dsi *dsi,
>  	rzg2l_mipi_dsi_link_write(dsi, VICH1HSSETR, vich1hssetr);
>  	rzg2l_mipi_dsi_link_write(dsi, VICH1HPSETR, vich1hpsetr);
>=20
> +	if (dsi->info->dphy_late_init)
> +		dsi->info->dphy_late_init(dsi);
> +
>  	/*
>  	 * Configuration for Delay Value
>  	 * Delay value based on 2 ranges of video clock.
> @@ -868,6 +1301,22 @@ static void rzg2l_mipi_dsi_remove(struct platform_d=
evice *pdev)
>  	pm_runtime_disable(&pdev->dev);
>  }
>=20
> +RZV2H_CPG_PLL_DSI_LIMITS(rzv2h_cpg_pll_dsi_limits);
> +
> +static const struct rzg2l_mipi_dsi_hw_info rzv2h_mipi_dsi_info =3D {
> +	.dphy_init =3D rzv2h_mipi_dsi_dphy_init,
> +	.dphy_late_init =3D rzv2h_mipi_dsi_dphy_late_init,
> +	.dphy_exit =3D rzv2h_mipi_dsi_dphy_exit,
> +	.dphy_mode_clk_check =3D rzv2h_dphy_mode_clk_check,
> +	.dphy_conf_clks =3D rzv2h_dphy_conf_clks,
> +	.cpg_dsi_limits =3D &rzv2h_cpg_pll_dsi_limits,
> +	.phy_reg_offset =3D 0x10000,
> +	.link_reg_offset =3D 0,
> +	.max_dclk =3D 187500,
> +	.min_dclk =3D 5440,
> +	.features =3D RZ_MIPI_DSI_16BPP,
> +};
> +
>  static const struct rzg2l_mipi_dsi_hw_info rzg2l_mipi_dsi_info =3D {
>  	.dphy_init =3D rzg2l_mipi_dsi_dphy_init,
>  	.dphy_exit =3D rzg2l_mipi_dsi_dphy_exit, @@ -879,6 +1328,7 @@ static co=
nst struct
> rzg2l_mipi_dsi_hw_info rzg2l_mipi_dsi_info =3D {  };
>=20
>  static const struct of_device_id rzg2l_mipi_dsi_of_table[] =3D {
> +	{ .compatible =3D "renesas,r9a09g057-mipi-dsi", .data =3D
> +&rzv2h_mipi_dsi_info, },
>  	{ .compatible =3D "renesas,rzg2l-mipi-dsi", .data =3D &rzg2l_mipi_dsi_i=
nfo, },
>  	{ /* sentinel */ }
>  };
> diff --git a/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi_regs.h b/driver=
s/gpu/drm/renesas/rz-
> du/rzg2l_mipi_dsi_regs.h
> index 16efe4dc59f4..81ce0c37aacb 100644
> --- a/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi_regs.h
> +++ b/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi_regs.h
> @@ -40,6 +40,45 @@
>  #define DSIDPHYTIM3_THS_TRAIL(x)	((x) << 8)
>  #define DSIDPHYTIM3_THS_ZERO(x)		((x) << 0)
>=20
> +/* RZ/V2H DPHY Registers */
> +#define PLLENR				0x000
> +#define PLLENR_PLLEN			BIT(0)
> +
> +#define PHYRSTR				0x004
> +#define PHYRSTR_PHYMRSTN		BIT(0)
> +
> +#define PLLCLKSET0R			0x010
> +#define PLLCLKSET0R_PLL_S(x)		((x) << 0)
> +#define PLLCLKSET0R_PLL_P(x)		((x) << 8)
> +#define PLLCLKSET0R_PLL_M(x)		((x) << 16)
> +
> +#define PLLCLKSET1R			0x014
> +#define PLLCLKSET1R_PLL_K(x)		((x) << 0)
> +
> +#define PHYTCLKSETR			0x020
> +#define PHYTCLKSETR_TCLKTRAILCTL(x)	((x) << 0)
> +#define PHYTCLKSETR_TCLKPOSTCTL(x)	((x) << 8)
> +#define PHYTCLKSETR_TCLKZEROCTL(x)	((x) << 16)
> +#define PHYTCLKSETR_TCLKPRPRCTL(x)	((x) << 24)
> +
> +#define PHYTHSSETR			0x024
> +#define PHYTHSSETR_THSEXITCTL(x)	((x) << 0)
> +#define PHYTHSSETR_THSTRAILCTL(x)	((x) << 8)
> +#define PHYTHSSETR_THSZEROCTL(x)	((x) << 16)
> +#define PHYTHSSETR_THSPRPRCTL(x)	((x) << 24)
> +
> +#define PHYTLPXSETR			0x028
> +#define PHYTLPXSETR_TLPXCTL(x)		((x) << 0)
> +
> +#define PHYCR				0x030
> +#define PHYCR_ULPSEXIT(x)		((x) << 0)
> +
> +#define PHYC1R				0x034
> +
> +#define PHYC2R				0x038
> +
> +#define PHYC3R				0x03c

Looks the above 3 macros unused.

Maybe either use #define PHYCR(x)	(0x030 + (x) * 4) where x =3D {0,3}

Or=20

Drop the unused macros.

Cheers,
Biju



> +
>  /* --------------------------------------------------------*/
>=20
>  /* Link Status Register */
> @@ -116,6 +155,7 @@
>=20
>  /* Video-Input Channel 1 Pixel Packet Set Register */
>  #define VICH1PPSETR			0x420
> +#define VICH1PPSETR_DT_RGB16		(0x0e << 16)
>  #define VICH1PPSETR_DT_RGB18		(0x1e << 16)
>  #define VICH1PPSETR_DT_RGB18_LS		(0x2e << 16)
>  #define VICH1PPSETR_DT_RGB24		(0x3e << 16)
> --
> 2.49.0


