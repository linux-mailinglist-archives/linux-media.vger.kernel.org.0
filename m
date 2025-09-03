Return-Path: <linux-media+bounces-41727-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id D957EB427B8
	for <lists+linux-media@lfdr.de>; Wed,  3 Sep 2025 19:15:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9020E540918
	for <lists+linux-media@lfdr.de>; Wed,  3 Sep 2025 17:15:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4E87130F527;
	Wed,  3 Sep 2025 17:14:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="QDKtdtdH"
X-Original-To: linux-media@vger.kernel.org
Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010055.outbound.protection.outlook.com [52.101.228.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FE712D8DA6;
	Wed,  3 Sep 2025 17:14:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.55
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756919692; cv=fail; b=WPRw6yqe9A/zpJtv4nhSEYvhs9/fn86eM6gGmSNbSgYhHMjhVojknYRez5mjKPGDd2jL2HspOL1cvNIezRFNMrqjVD/8Y30c3S7BWfhO5npGHAQ/CR/Zxt514Qf4I1N7Cmx6ScBMZYitdB3ZzQ36ouqfTH3Za7PLI12Zm+yda+s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756919692; c=relaxed/simple;
	bh=CPg1WF+7rwz7qbjhkcUevi8aZA/2yJbwjCEZG1h7U8g=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=KlZSe1gJNrA7NTYuHzByNzlBTcuIY6Pv6tYb2LJU+hn0KiqC1RL8+NDNDxqaOTUeDeUJ/haLuC1ddT6jQtV7Sl8JmVL2cYFU56O2I7yRxFepNVjCDf0qEhAoBDPcYohQCeDp4gWgiulnKS+8r+5GotFu1j9/jUiwewPkqIidRJM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=QDKtdtdH; arc=fail smtp.client-ip=52.101.228.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=K/dVvMtJJhezOoYDz5ksI/X4D/KIJmr9RJJiCkEAv+bU+MF3vC8xhEwzV2FLv272entsbfxuKM0nPqNrzM61ylo296fqOR1+wGl1pCGGBGdasRxaP/bgFZTH/Fc+sXcz0dimaWZqSBjXRhepVzzqMhCegtLCpHNEGdtYTBJq2Y4MxE/WeuKV0LWBd92IlM6Mx+DDPpmcuSN0DlR2xlLbl+oeNAhWuPOvIykVhvPIN2MrhiF3SxwMtoscV1ej/MnuD37cOPqmDV3y2eZGbJb+yXn2oPI0uyN7aRb1GdswQlXT/pLffH14FNCQuPBi40DvF/bL4Mi+dGtbZeXKcbDttA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ujWfThPJ8521J72g4LL2AOX9nsTSlPTQl7cm8gN4YG8=;
 b=kZHBtw706pAhQZFOy7mKcX2eswhTdT2bl4g8NwP9pSoJsM3nNL6w+thIGMuKjzyoCqHHd/0LjiVdOrwLfysrUdP4nR6oKzjVHSIKhFviqHsqGBLlBygOI50+hQXehlpDRy8cHcmYAkxdjQiuXEQ5Y+AW7NooxgY6MEc+rRZl9g/tLhVvBpyg6VWmknOicZOBRjwRjzObcLLRq7Di3SSeY/a7ji4uZt/nAvJ0pUyIrYob2V06KgRL+JOPvcDsDK8l74qG5NDtJZxiIgqGDRvbSsE0+8WPfjV4AaFyqYXZWdicw+523cXqoWovbgqNGeRjwvSpPm0Z1E90XMJh103zCw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ujWfThPJ8521J72g4LL2AOX9nsTSlPTQl7cm8gN4YG8=;
 b=QDKtdtdHSxENom9qz1XNxFbR1Hag6mZVO9Vk5/9KwLVXmYa5HIqpVL6MvgIvO7EpfUQcFYcLLJWiKNogjmvcCTuYgs6nrI8AJlQxKv/4PQ0mqyl7l3TD4begeYp/dbRhLyfVQFhXQyAzREfaiMyFytDxW/zj/nRhrCrIo1ofAOU=
Received: from TYCPR01MB12093.jpnprd01.prod.outlook.com (2603:1096:400:448::7)
 by TY7PR01MB17020.jpnprd01.prod.outlook.com (2603:1096:405:32c::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.17; Wed, 3 Sep
 2025 17:14:46 +0000
Received: from TYCPR01MB12093.jpnprd01.prod.outlook.com
 ([fe80::439:42dd:2bf:a430]) by TYCPR01MB12093.jpnprd01.prod.outlook.com
 ([fe80::439:42dd:2bf:a430%5]) with mapi id 15.20.9073.026; Wed, 3 Sep 2025
 17:14:46 +0000
From: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
To: Miaoqian Lin <linmq006@gmail.com>, Mauro Carvalho Chehab
	<mchehab@kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>,
	magnus.damm <magnus.damm@gmail.com>, Ramesh Shanmugasundaram
	<ramesh.shanmugasundaram@bp.renesas.com>, Hans Verkuil <hverkuil@kernel.org>,
	"linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
CC: "stable@vger.kernel.org" <stable@vger.kernel.org>
Subject: RE: [PATCH] media: renesas: rcar_drif: fix device node reference leak
 in rcar_drif_bond_enabled
Thread-Topic: [PATCH] media: renesas: rcar_drif: fix device node reference
 leak in rcar_drif_bond_enabled
Thread-Index: AQHcHNftPXfx3d0sBUqnlFJns+U/3LSBsNxg
Date: Wed, 3 Sep 2025 17:14:46 +0000
Message-ID:
 <TYCPR01MB12093F701335B99CF358ABD61C201A@TYCPR01MB12093.jpnprd01.prod.outlook.com>
References: <20250903133729.2523130-1-linmq006@gmail.com>
In-Reply-To: <20250903133729.2523130-1-linmq006@gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYCPR01MB12093:EE_|TY7PR01MB17020:EE_
x-ms-office365-filtering-correlation-id: 12528dfa-39b2-4389-5858-08ddeb0d61c2
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|366016|376014|38070700018|7053199007;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?nLUOu/nZPNPM3jv4JEvu7+8L2KJYVKilGaX/HrLjVLHDcZpiJizvINatPRqK?=
 =?us-ascii?Q?o2R2+VxsTcamoax1MsYArB6YJQfUvrbTHaQMgmoq7+GhjvxxYS+pBgbYdDJl?=
 =?us-ascii?Q?rhXO9J/Kklt/eQN/3ioEBfDPh8c+t93dYOYXFI/lo1mTqQg4B5GTV0O1v1mZ?=
 =?us-ascii?Q?MGTjmWIy97a0DpNpE/Pg2nBpOXemDtZvrhWRBlCYAKQHHjUXWdsNeCrVlAUv?=
 =?us-ascii?Q?gJzDxCADXmzK5Zy4T/yRfAKWak5LdmLPdz4PGULR+87PFSNKhkBzvgh5bQCB?=
 =?us-ascii?Q?6Qsbb06CtfJXJlDd06BE8UclYxUKIj9ENLCSdguPUk5cm6BxYP2NlFZ3Jd7K?=
 =?us-ascii?Q?7GKHNrNVoqnK8Mf9Lrxe/Pz2tgF+qktut3XbMs6vQWinnjJUNCe8pM+m5kwa?=
 =?us-ascii?Q?DJRiJq/BVHA0Xw7M05vVZtJGJoNouxk/dx6WH4w6vVohXPrxMqqFmDv5FYk9?=
 =?us-ascii?Q?BehyZvs02QQloNtLAIdTaF6U73r9QNpYaH75c71iHPBTrEEx4sgxLnlN2G/2?=
 =?us-ascii?Q?5Fd4unSkDOMFioLlTC1TnB5l69HYXf0iR2Cx63Msl75AqTGHh2Zb45nNoB3z?=
 =?us-ascii?Q?1RksAnroDXsCN+4r8uU4dTy7SyjxsytZzXkdw65EeIczccY1wov65jJSiHWz?=
 =?us-ascii?Q?dL7bX/iASKRksRKtHYzqhj8rbluE7WQBFBBWmbHyvTCCIar7DiF6vGnqQNiP?=
 =?us-ascii?Q?0k1pNG3ItpERHZydMLvtlQVJoAdyL9ZHcfML35tZnwMWji9f+kEulT5IYi5d?=
 =?us-ascii?Q?+AAv5DoKEtjE2H9IWMu70Je2pyZ3WTAkemZ/lGx6+pH2YcsiFOyonx6qcUwz?=
 =?us-ascii?Q?4PmGBxNCpsmmpVoqc1nGvXgkT+8p3T+ko1lUP0MuDvkZ/f09yhU9Qt/nmnfY?=
 =?us-ascii?Q?6/vXk8vQBShY66u1UeEhHwSYDlV0VFAdxLXNUFtdA0JWJJkN5PRwlRz4T/yH?=
 =?us-ascii?Q?GaeB5Eo+8z5Twc5axhaaZRMF+f7+/mEKzAWb38iP+K9opqPNabfCkxA67uky?=
 =?us-ascii?Q?UnQcA/NR+PzvVdJM6NV6WpAordDXTEJh4Rp3LKaqQ/+V9lwTV7CnraOsL+09?=
 =?us-ascii?Q?zvzgxma1EAXD07RRERo1YI1iYtuqPJZI80nfxef+dHPuyHP40Ps0mDoeZFmA?=
 =?us-ascii?Q?bswFKkESHMaHC+kRsXkag2a1dmlN6uTFOF4j78c/SofYE4Po8WImhxLgZWFu?=
 =?us-ascii?Q?aPxpo1AF4lsPvu0dfJhxmmZf8oLrxZrACfZmkMBbt5OdAVMZz/3qVGGvETsd?=
 =?us-ascii?Q?mmlDgSuubARjOscI6P/n3/BFCu97XrVcJ5wKPiSpgCXc2UPI7QocN/asyGLk?=
 =?us-ascii?Q?3+DUKqD98Zh7J+1/v/TczaH3XvBp52jCdA4BdJfY65EALQtnh3ys/34IYJaQ?=
 =?us-ascii?Q?6XD+LeH/iCuVbp16ymXBdQiiXAlbldkZK7T9k8NkQ0VWQ8b6PBjkm3k+njIS?=
 =?us-ascii?Q?N4MUx4hchd4MimSvMMRs1Cqsu2wnIcIaB2s09WXA26zOZKoxkMJIfA=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB12093.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700018)(7053199007);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?e0m33ifFxLF0eiIX3nasi9zxKhLukmcUa4ViCjklQeONTYfYR8Cf4TXhGiGK?=
 =?us-ascii?Q?9xWdxgMr1dRfIAqjAUXu6oGee9hCSHMUtlAAqdu4fqFrQfbOsX/zTW4vnlC6?=
 =?us-ascii?Q?kUPrqec8yoVgcg7lXjvda8h7C75Bb/QLkwd6yxNvaM6kBhuLgtA6FG30LXse?=
 =?us-ascii?Q?AO3MCW4lnuZAgOGGN1Dv90Ww4OjEVSEc4FLWnVUAmKmpWUPeQe4mzo51LrDZ?=
 =?us-ascii?Q?w0UvMoMtUPtRtaxMOwdv6Dlm4ULDFmpzxGtEiAUJRY6wlPe3WI0AEsQBIehU?=
 =?us-ascii?Q?QJiNutG7dbEncyZmBSpIuHOuXcomND3huMPPz2zzvmJ/PhTs70/Ib1EXW9E0?=
 =?us-ascii?Q?Bo4n9dOCztOm+Ue0BG6h7FG5r4z6HbQp9znpnZkH8107j+ub1RSkxpenpTN0?=
 =?us-ascii?Q?V7aQ0No94eR1FS0/azQ7oF4PqYsUcbx5EXBLeUmCORuFnAaMhN5Ewibh9p2+?=
 =?us-ascii?Q?xLft5ZCETr0StgLJ2mKISniUqApRO61jKOrLpQvD9Fb/HfZrHIa/RN1xsRcv?=
 =?us-ascii?Q?dztGikWH5EqRMMfxFB0e4knFQtMY8iNazN3JYPYNIwWC/rzP/ignRmyegkGw?=
 =?us-ascii?Q?tyF40kJcPpnMPcOtu5hVsA3sWNu251Tp/7/IM650xPI6ky+KFV63phV8XAu9?=
 =?us-ascii?Q?wyE2HlQX7oOk9PmCECa29iWI0RYsNnGo4rcflcxsHRQqBqKGFcZnYazHK/Wh?=
 =?us-ascii?Q?2+NlIso9bBN2gOank8cVlKV98K7s66K4C1RPLI4xcyKKiRbyfVkLVKP1ZLLE?=
 =?us-ascii?Q?V5m53hJ99eOz6khgivakD5boYd+suXFyYUpdhag+7Bpiwju43kMINXWxUlG3?=
 =?us-ascii?Q?PYdLGs+x/ofecsEAW8aLADaofWbInloesYt2Lt4P70k+K5n87ybDKV2ZByH+?=
 =?us-ascii?Q?JuHgCDwLXFXsLDOlP5+5eWiQhXeCXZaNJ6q4hMbbdl3Ii/EY0CsKafE/e7y2?=
 =?us-ascii?Q?2xsLGM4STJHAMPpVo+jVX2I1ZPYY34Afng0533fTIB/Tl+j/4S2LyJt0l/AE?=
 =?us-ascii?Q?yIA384Yir+c2JHJEv0y/6okD7yh1bF/SMQuLuofmQjB9wrTVvCsCn0gbd9in?=
 =?us-ascii?Q?508UuGTQ3tNkNvNPTPTWFIpuIfZesCX0GMmUn2sxuItSfjuxBBINcIlDorvF?=
 =?us-ascii?Q?K8vuz1Djaei4ZxolsWgQFija77bCr3ONIkCeTljHLZERlUNjPgUliVYqXcRN?=
 =?us-ascii?Q?uqPT2DEONIEMzka7LjVzVeD4gHIoRL2McQk+O8/wpconG7yGoVUlcQgymaLP?=
 =?us-ascii?Q?rDoHBpGD5uw2Qh2tgDZqT70VyLDpGW9yS+LmP0Lcqa7m4UHEi/yho+DvQeCk?=
 =?us-ascii?Q?jx4DlXuIHoK3AMTNUjkhcB31XovI317GWUjfw/mA66Cu3cdZhnFK/wcivOmn?=
 =?us-ascii?Q?N/p+1Hah11zc9B+MPKmwKYtTt2Io/ipJaox/79PP/jh0R873VCHxUaNGf9Ip?=
 =?us-ascii?Q?p73gsfZtpQMtGhtxwfocCCtvZxtECuYmrD2wYA8ea28beD29sdpenakEIYGY?=
 =?us-ascii?Q?bH/K0cm8CYC1gz2AadBQI403KNwph0mz/z6TqMrTC9B11tMeOJG+NlcSarcm?=
 =?us-ascii?Q?c5E6SST8XHLsabDjddbyCp0ib5Ale9Hqn0UI1CgYu33rQOQh0HKzt0LKKTJB?=
 =?us-ascii?Q?uw=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB12093.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 12528dfa-39b2-4389-5858-08ddeb0d61c2
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Sep 2025 17:14:46.3633
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: tyXftmF0CdTS3bEMEAimqQQ4fhH5/J+3ujN6hB6NEn7TOAmz8U1+5ft03ABiS4y8I0pMIV30xgZ3yyGICj/D5SnO+ba/57/ZKX9CRf3iT00=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY7PR01MB17020

> From: Miaoqian Lin <linmq006@gmail.com>
> Sent: 03 September 2025 14:37
> To: Fabrizio Castro <fabrizio.castro.jz@renesas.com>; Mauro Carvalho Cheh=
ab <mchehab@kernel.org>; Geert
> Uytterhoeven <geert+renesas@glider.be>; magnus.damm <magnus.damm@gmail.co=
m>; Ramesh Shanmugasundaram
> <ramesh.shanmugasundaram@bp.renesas.com>; Hans Verkuil <hverkuil@kernel.o=
rg>; linux-
> media@vger.kernel.org; linux-renesas-soc@vger.kernel.org; linux-kernel@vg=
er.kernel.org
> Cc: linmq006@gmail.com; stable@vger.kernel.org
> Subject: [PATCH] media: renesas: rcar_drif: fix device node reference lea=
k in rcar_drif_bond_enabled
>=20
> The function calls of_parse_phandle() which returns
> a device node with an incremented reference count. When the bonded device
> is not available, the function
> returns NULL without releasing the reference, causing a reference leak.
>=20
> Add of_node_put(np) to release the device node reference.
> The of_node_put function handles NULL pointers.
>=20
> Found through static analysis by reviewing the doc of of_parse_phandle()
> and cross-checking its usage patterns across the codebase.
>=20
> Fixes: 7625ee981af1 ("[media] media: platform: rcar_drif: Add DRIF suppor=
t")
> Cc: stable@vger.kernel.org
> Signed-off-by: Miaoqian Lin <linmq006@gmail.com>

Reviewed-by: Fabrizio Castro <fabrizio.castro.jz@renesas.com>

> ---
>  drivers/media/platform/renesas/rcar_drif.c | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/drivers/media/platform/renesas/rcar_drif.c b/drivers/media/p=
latform/renesas/rcar_drif.c
> index fc8b6bbef793..c5d676eb1091 100644
> --- a/drivers/media/platform/renesas/rcar_drif.c
> +++ b/drivers/media/platform/renesas/rcar_drif.c
> @@ -1246,6 +1246,7 @@ static struct device_node *rcar_drif_bond_enabled(s=
truct platform_device *p)
>  	if (np && of_device_is_available(np))
>  		return np;
>=20
> +	of_node_put(np);
>  	return NULL;
>  }
>=20
> --
> 2.35.1


