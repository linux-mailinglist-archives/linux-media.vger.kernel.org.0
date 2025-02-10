Return-Path: <linux-media+bounces-25911-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E46A2A2EBFA
	for <lists+linux-media@lfdr.de>; Mon, 10 Feb 2025 12:56:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 0A0847A188A
	for <lists+linux-media@lfdr.de>; Mon, 10 Feb 2025 11:55:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 387361F6696;
	Mon, 10 Feb 2025 11:56:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="L+EAAOie"
X-Original-To: linux-media@vger.kernel.org
Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011058.outbound.protection.outlook.com [52.101.125.58])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A0161F560B;
	Mon, 10 Feb 2025 11:56:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.58
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739188583; cv=fail; b=eklCJYvqOFy4XqMplYPZ1oFaWYYhIdOUka7rx47WEMPGoRZ9b0njgdSqs88H/MXC0UqWqCGuatJJAVew88MYDQ178NkdzLBD9vSIjZQ7TcufI4Ynxm9IaBcrlPVH9ns3K/9+zgYZJGf9OMO73gc95WVuyteDci97cZ6iu2cP9aE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739188583; c=relaxed/simple;
	bh=LKYa94a4yZLua5wXZ+D+FdUTyj3LWxnN4UeufDE6pkk=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=cV4mTmUHlVgqqWZWqmFEYxvtgzbrj04DUerXgYYe/PEVo44SaOnuYkiTa5ScYFNWmFCuumSPcI/YGALl6yEau/+obRqFqgVDhkY9jkS7KYCLsb9hZ5qHqQjtLkuCwteuLRnaCVaqwFRw/rLNsAUj4imzdQwYumC1iJXHfnb9XhA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=L+EAAOie; arc=fail smtp.client-ip=52.101.125.58
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=y5u3avrQZmVRMgMTREQyLKNAI5fCB3FEm5y52DKsa5NcD+cucIaue2wfaf9WMLQysXQCWFcP4Yfk0FG8EgFGulubKKCvetn2xRl9CdJKHiUTSCVWjATu7MO5VjcmKWJ5jYAa7FvbuZH2pzGMOjRTuNn08fqc71lYl81DhUtxVeL5z2FU44qPBmSfUhHXEeWJnMTWDf+EIUypPHS5tzWdtiC6CJP0PXYwSiSJcehX4ENNY4IThHWAawkhiaqr6CKS+ybr0W7phuaHAc4D26V1BAqxGLTDCKwK4q+Qxx6V32VhlGFazJa/UcYNbqwgY0WUEr1A56MEn7mhHmvisWOOIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6WhTtjWpHWZLR5JFRLENkWa3/QV3F8gEN2ysb7BJeso=;
 b=fVOT2EOqRw7nb6BlSkSAu3w40KVuQg0RDtHSNeNF7BvYFnGFSyhc/8Po8qasb0sf/iP06CxOM7y27TAEW6W6E+NIZGRdWunugCWwdYSJ++nnW4X3xO0jgiYVBDqn5jtW596jKlP0Psx8YZ0QYrr2sP2ZPuwBLO/rsdDHAlbxnUfZmGmnejiUCni1WtutHGc8gcO03EJNAIEsaK0Jvb5FOiYDQRhpXn8INIKgxSK9wXLsCl3h2Sq+YcTudEzPtUo9Hj2+epLCiMwR1iyg4xCdTgdmhOz7coyJA7F/GIvC8el0kuPPTZWuuLg2bi15PcMqBuypetO/zbGBIkjGYzzCBA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6WhTtjWpHWZLR5JFRLENkWa3/QV3F8gEN2ysb7BJeso=;
 b=L+EAAOieTW0oYqCrWYTR8RicxQ9TIzRQPFqQqabJ6V/PDwYxxe9sWwMv4lm9xETyxKjWj7VLv8tNl+aUp2gmDLLlZYNQT2SH1MYypKZMuc4C5hND34eXsZSNIdZykc6tsFKOEvMGK8/D2seMwjjDex/5xHbzIZzlW2EiF6Y1fKo=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by TY4PR01MB14590.jpnprd01.prod.outlook.com (2603:1096:405:23d::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.18; Mon, 10 Feb
 2025 11:56:19 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1%4]) with mapi id 15.20.8422.015; Mon, 10 Feb 2025
 11:56:19 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Tommaso Merciai <tomm.merciai@gmail.com>, Tommaso Merciai
	<tomm.merciai@gmail.com>
CC: "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
	"linux-media@vger.kernel.org" <linux-media@vger.kernel.org>, Prabhakar
 Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>, Tommaso Merciai
	<tommaso.merciai.xr@bp.renesas.com>, Mauro Carvalho Chehab
	<mchehab@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
	<krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Geert Uytterhoeven
	<geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, Laurent
 Pinchart <laurent.pinchart+renesas@ideasonboard.com>, Hans Verkuil
	<hverkuil@xs4all.nl>, =?iso-8859-1?Q?Uwe_Kleine-K=F6nig?=
	<u.kleine-koenig@baylibre.com>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: RE: [PATCH 6/8] media: rzg2l-cru: csi2: Use devm_pm_runtime_enable()
Thread-Topic: [PATCH 6/8] media: rzg2l-cru: csi2: Use devm_pm_runtime_enable()
Thread-Index: AQHbe7FyKu6U9NnhREyZM64GYXie6LNAbhXA
Date: Mon, 10 Feb 2025 11:56:19 +0000
Message-ID:
 <TY3PR01MB113469340A282B8C707260DDA86F22@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20250210114540.524790-1-tommaso.merciai.xr@bp.renesas.com>
 <20250210114540.524790-7-tommaso.merciai.xr@bp.renesas.com>
In-Reply-To: <20250210114540.524790-7-tommaso.merciai.xr@bp.renesas.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|TY4PR01MB14590:EE_
x-ms-office365-filtering-correlation-id: 014e4e34-0e5f-4324-61c5-08dd49c9ee43
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|7416014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?fagwY+Lb8kJ0t72JqCqQUJjIIlYK2yZneRk0DYNxvLakLjJX3kUsstiwBM?=
 =?iso-8859-1?Q?kut6mHbI26j0EbEJ08f/AsqHRziRO19wnxKCseF04lH3BFf89LMPNKWBwT?=
 =?iso-8859-1?Q?D2x15G5+1NePe1WU+cadEd2Im7wMKFl1efJHPPQ9+6ITqfpTYy+8KgBWeG?=
 =?iso-8859-1?Q?S+XTUMSkaq/Ib2HAJ/PNAKNO9fAhEj7QPWas4uLlXr5QbgcVKj8QyykGQm?=
 =?iso-8859-1?Q?O31Absc9etugqJgGXwfGuE4kophfNjLhz982scImaVvrXx3N+BUOWEpmSl?=
 =?iso-8859-1?Q?0wkAbh6fuDdTCdPq6F0ebCPUJv1aidH2ya/85GC0sG38kqesz5uUAsF7/c?=
 =?iso-8859-1?Q?8pGl+yAAH9NaHSwrRjb0TTW71dWkj+hJae7sbtCCUvqc8RuAYXxmPppM+m?=
 =?iso-8859-1?Q?vOwFBG7LgeMcOqazP8Bzgo3RKvGaeIffcmMghDKEq2E2EUgUXTGLPT5HZb?=
 =?iso-8859-1?Q?/LwteVmreKi6KR1Ka/g6Gn/2CfBwCSMSdYr14hCZYDdHuN0h3tWDE5XP1s?=
 =?iso-8859-1?Q?i8nyMx7Y6hk7KLjkkY1IqQ35bi84UFRrgiDhJ0Wdi7nWDi7aHpH0lGDguV?=
 =?iso-8859-1?Q?1r/O6wJwRQtmz5McglaUQ/j1JXm7Rs1DUXA7YjwZtc6eFYj7S/hUteafyK?=
 =?iso-8859-1?Q?d5/0ohfHElRO3acBOPrf9d5KKraPql0/0hue+AHnY044+XZA+qLNWOvaBv?=
 =?iso-8859-1?Q?Dezx4CatZ/99KNFaJgbEzKFy7AzhvU0d8zO0mMNjyCWFTiJQtmcXPqwrwR?=
 =?iso-8859-1?Q?b7Y3YPR15MWgGR056ot6yu1D9GZwfgyAYX6kJtADysHyqYp9qpUwxg+/GQ?=
 =?iso-8859-1?Q?5H0eHNJVEQvml01of8Z+FEFnSZZvudv5QZkd+5lotGhRmxH0/GFO3AHFxY?=
 =?iso-8859-1?Q?Z9DeHeboQ317AqyitrI+B+xe97Q51KJzCKufPMC2R1CQN9un0OGtssO8mW?=
 =?iso-8859-1?Q?CWg+8jOwAVBssp2e0pmavR3DsY/2K7sqJsUUBrUfnzPjcyuzlgf4MrtCtP?=
 =?iso-8859-1?Q?llZGcgnkDl2XX3Z1QamiAlC1egf3UXzL6WSeMUFOhNKkMdid4FOnklV8WT?=
 =?iso-8859-1?Q?J2cMb1djbDkLtgh6/QdFPmP333FCEZoxPCUdw6UYp13Hv4tlUnVb4ULojT?=
 =?iso-8859-1?Q?jrahm6OOvzTTiV0krd6FXZPXhcPsLuwQt5R494fKc67hlBz+76dcofKNsO?=
 =?iso-8859-1?Q?hPUFMUwilYDwNjPXA00FNakHcc2nlD/H8Xr69ccigRaPyA2ebwutop9ruy?=
 =?iso-8859-1?Q?TD82Jv/tg0g9d8iKT0wqCKOKpbL96IMN/mSihCeGn9eg65BLFw7UsXkCy+?=
 =?iso-8859-1?Q?nIUBGE+7JXQzj63m/nLpuN9DDP3ey74ktEnapkAABMc98giAx1qi3SWivM?=
 =?iso-8859-1?Q?4l0FpXy8m9hBTXBBKZ9FkMhDgzXpuMd/TNprDSgeEB97dAzbEiBpzuSutv?=
 =?iso-8859-1?Q?8HvlvLxGaWHLJa8e8ijadqU0lG/SUncs1bB95ho+NnnAnvO+f6yRXHuQaL?=
 =?iso-8859-1?Q?U=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?Ox5SNnrl+GgnnVPbbNnHEcXLlj5rvU3uREQTJF9hW9IvrA/NYvvJcDus3C?=
 =?iso-8859-1?Q?vVR3tUYf/54yChJ0AT5s9yjz45eNTgtZK+gurwdoU/Jy+NXOJ64WSkt1r2?=
 =?iso-8859-1?Q?nJbpqF20MO+xRAlUDfVRlBSc7nV9ceubWhi1ts6p015lIGrurIG5KiAKPl?=
 =?iso-8859-1?Q?YbkCG+GEWtRcbWqKgJEjj9wQMknV6R2wOg7s+hNhTZYVCS6NTad39KebZv?=
 =?iso-8859-1?Q?mhTCPY8B4/X+ZCaBnoHRvqJY7UnrJTmhGQzlD9tjDOcp28S9CkNKkx1/rf?=
 =?iso-8859-1?Q?+LXPQUWyxpdcoxXVc6OKk7EeBL/By0Bvq6BQZrz4wBpCHQ2SK/xPsrUNO+?=
 =?iso-8859-1?Q?5zcVQMXWX4zc+pjdhOs9fYLKRfkdJkUnBeqodTym4ohtLiyR2vbqmRCILe?=
 =?iso-8859-1?Q?S498G7+g90sFNXOvnru/bdo4lvxP+yYxZVB2QxQevMxS8UlWwbwo+y3sfZ?=
 =?iso-8859-1?Q?L3reMlvuHeri2Ej+UrtvhSxXg2dUEX0k2ScnSB7M/3GO4Tj3FoGCChCi6U?=
 =?iso-8859-1?Q?GIwmrA/uubUq8EnOOivWOP1pRwpN3pSrmfOwdRobEQeqn9to5ij6RQox7z?=
 =?iso-8859-1?Q?agV1234uzDWLegAPSDQJXddGk1qjY92NYXunp2MLdgkOFeGdiwSOoGo+uY?=
 =?iso-8859-1?Q?LkrFl12H9yV8iTKfdENLL+bkyzadG9ABfxm1Bqofdby2FhinxRgywxUn7D?=
 =?iso-8859-1?Q?3bjEuJrC+WQZqmf1+Wb6k3uBo2OtApQv1zpG8/oy0QvgKkZT3twUuVCiDG?=
 =?iso-8859-1?Q?DE74RDcOTvkN6kSgnTUQzCH6NthNE5watG4TYR518H1HkKzkxoDgdlIXS7?=
 =?iso-8859-1?Q?wO74mGzq1aG91VCIPOxd5C9rK0cokBzk17kZsp7ObGnrVLW4Qg0Heqamw+?=
 =?iso-8859-1?Q?v/bU2ZKztk+g9A5tIErK08TPnpaJWqa6yMQVYQS6UZxVMf3RJ79TBaJbnG?=
 =?iso-8859-1?Q?LUqJYySpY3sNIHnUcWxweYjqCc/KP5iGYSJ5tdYCeSKqEgfiFb9MHKbrDA?=
 =?iso-8859-1?Q?atHJNo7kK3U6IAH6ylo1csHtvHy+7u5iCNsesDN0z2D7EB4A/8hkkvzGdj?=
 =?iso-8859-1?Q?P1WGKMI3C/v5M8PNjdq1HyoSjLVVd9ObNtQmQUl5i2wWUA3KDvy4ZdZznQ?=
 =?iso-8859-1?Q?ox9kShFGnQpfnFfFnkhoVcEmiByPa0JzDKwBXLKEDwrT2OloUmDyGrdE57?=
 =?iso-8859-1?Q?AD2/Uw9frKjspRh1BpviI+JqSRKBGwobyqyk6Xzhkmk0YMHC5wilw6Q0LV?=
 =?iso-8859-1?Q?ZduYzkWE3LkrxUQV7/xf1z43vkdPZ98v5D1CSm7Y+B00uAJtJRQ6nRdDXp?=
 =?iso-8859-1?Q?h+QHcl5DvWvXtWcKB2tr5jfI2H0d7BrbsXdDDWixaiBEGhKqLKOE6zRybp?=
 =?iso-8859-1?Q?QifBxiKzpFpE3e103T4qmBNOO+SwKMJ9GjBjsi+cc8sGjEU1ng/Y/TrghA?=
 =?iso-8859-1?Q?9AaAilABgt5oQIKXVWAGkmwo0lW7Cyy/baThP16Sj/SDwZ+4q/qdc0twJd?=
 =?iso-8859-1?Q?Whv/YiZ6D4BCm/hLb1pB1QpExeEjTsoTGPTk9V4cAnT+/YiRqdwWB16RTj?=
 =?iso-8859-1?Q?ajoYISmb3Qinhld7a0JynVjBF9zUIjutouOs7/MLkjbxizD1rzb/oKuySQ?=
 =?iso-8859-1?Q?NGz+1XqyYmydc0CLFAkHOIyVrJPMpmRax+VwxW6TojPou5aVqDo2wSug?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 014e4e34-0e5f-4324-61c5-08dd49c9ee43
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Feb 2025 11:56:19.0511
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 3DWKygrq6nWxHtH+Y1JeSGVRpoAcRiEvDKjGYSQmhWX6oh5f5JhAfWX3yfJezEUq4ShBinuvMWolB/EZpwVHBP4rOS7DoESBPMba/8FpUJ8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY4PR01MB14590

Hi Tommaso Merciai,

> -----Original Message-----
> From: Tommaso Merciai <tomm.merciai@gmail.com>
> Sent: 10 February 2025 11:46
> Subject: [PATCH 6/8] media: rzg2l-cru: csi2: Use devm_pm_runtime_enable()
>=20
> Use newly added devm_pm_runtime_enable() into rzg2l_csi2_probe() and drop=
 error path accordingly. Drop
> also unnecessary pm_runtime_disable() from rzg2l_csi2_remove().
>=20
> Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>

Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>

Cheers,
Biju

> ---
>  drivers/media/platform/renesas/rzg2l-cru/rzg2l-csi2.c | 11 +++++------
>  1 file changed, 5 insertions(+), 6 deletions(-)
>=20
> diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-csi2.c
> b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-csi2.c
> index 948f1917b830..4ccf7c5ea58b 100644
> --- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-csi2.c
> +++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-csi2.c
> @@ -805,11 +805,13 @@ static int rzg2l_csi2_probe(struct platform_device =
*pdev)
>  	if (ret)
>  		return ret;
>=20
> -	pm_runtime_enable(dev);
> +	ret =3D devm_pm_runtime_enable(dev);
> +	if (ret)
> +		return ret;
>=20
>  	ret =3D rzg2l_validate_csi2_lanes(csi2);
>  	if (ret)
> -		goto error_pm;
> +		return ret;
>=20
>  	csi2->subdev.dev =3D dev;
>  	v4l2_subdev_init(&csi2->subdev, &rzg2l_csi2_subdev_ops); @@ -834,7 +836=
,7 @@ static int
> rzg2l_csi2_probe(struct platform_device *pdev)
>  	ret =3D media_entity_pads_init(&csi2->subdev.entity, ARRAY_SIZE(csi2->p=
ads),
>  				     csi2->pads);
>  	if (ret)
> -		goto error_pm;
> +		return ret;
>=20
>  	ret =3D v4l2_subdev_init_finalize(&csi2->subdev);
>  	if (ret < 0)
> @@ -852,8 +854,6 @@ static int rzg2l_csi2_probe(struct platform_device *p=
dev)
>  	v4l2_async_nf_unregister(&csi2->notifier);
>  	v4l2_async_nf_cleanup(&csi2->notifier);
>  	media_entity_cleanup(&csi2->subdev.entity);
> -error_pm:
> -	pm_runtime_disable(dev);
>=20
>  	return ret;
>  }
> @@ -867,7 +867,6 @@ static void rzg2l_csi2_remove(struct platform_device =
*pdev)
>  	v4l2_async_unregister_subdev(&csi2->subdev);
>  	v4l2_subdev_cleanup(&csi2->subdev);
>  	media_entity_cleanup(&csi2->subdev.entity);
> -	pm_runtime_disable(&pdev->dev);
>  }
>=20
>  static int rzg2l_csi2_pm_runtime_suspend(struct device *dev)
> --
> 2.34.1


