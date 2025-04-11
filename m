Return-Path: <linux-media+bounces-30058-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A4B5A8646D
	for <lists+linux-media@lfdr.de>; Fri, 11 Apr 2025 19:16:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 24BED1BC837B
	for <lists+linux-media@lfdr.de>; Fri, 11 Apr 2025 17:12:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2A90D23536A;
	Fri, 11 Apr 2025 17:09:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="Ms59N13p"
X-Original-To: linux-media@vger.kernel.org
Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010018.outbound.protection.outlook.com [52.101.229.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9067E225419;
	Fri, 11 Apr 2025 17:08:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.18
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744391341; cv=fail; b=qDqcT23ov7xR8XVHVDENCEjI7nkKWgWGpnxpP4MhWD71TKAYyn1XTlX4LvgvWIAIDQuE4Gk5Yb/wZWhSJduDx5bPIE97Kw8hYdb1+XMAmnF6VyUeWs6SvO2Plkskg4FuHfhXsfOi2aSagOfwXiDZd47Pkhnsb+G6GmjjtPRpfF0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744391341; c=relaxed/simple;
	bh=gODViIct3kEdyG/2HKztrWCVgCJaC8hpjTCr1q3M9Jk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=GhS08ShWl3wtPX3PNpVlNekRDc8Yw61Ma8VRA/4cxQ4msMHkYdtC8u3/+3ovUqCmrAUaLJ5uhGBlCNEaeKLcRUg90gpur8LCt7z/o5CsfIW3y5yOqAuwxlqMvyW4xftcYNlgEcDeeuH+9c+Jhn4tDzHHlWzO/OaLjjVbDPK32/Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=Ms59N13p; arc=fail smtp.client-ip=52.101.229.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eTGZ1EzsoZXe3Ydj6GCLk7x87Tn7/jtvOgWKs0Jr98V7BYbonp1JPS3r2L6CsIsrx9klfwj414uvo2CkRfgpqHhq2YinWmWXMjTdJqZUqnj5I+Ge8tyQEAH3xinjlgud6dsFumPBphGG+UbVOnKi2cQvsnfpIOscF2A6DX7/qu3/DGt4CtN1S7jCLdGCN4DtOpK4Rn+dLj/sdbkRiWGoxj+OWbEAj4lAOiBpYLnxfRGuN2sktePZd22Wj/8JYm36+jiTNA4DcJrxspUtsEdxifMfRLzJ4Fqy6+uXw10H7ocOyiHVrctAla3LkdRHGSbLktzWsU6fLkz3bTvJ0XrAJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VKLsI93Hw0i/HLyFwFubb4EwJgO/LAVt24geoGbm2xo=;
 b=jUxjcWbaGNH5b+qnqsy0LaGnPmUAFJcMA6yUKYbP6W9H3P9wOkJPXR5eq3r/ZOyC2Vlcfx7KSR0ozJYL1PwvKKJ605k0HkOONGgx5bGYlrmvxH7ZeJvVWj5slX3n6Ucax/bRvQHEQU9wmgCtNjzcnsxz+c6+9TBX17h6lHkbm/QKbuKOf10fnQfLs0QELVOGq2eyo0LwDfu8NmXDQVD9Z6c4OIYlb10PMEbS9WTiu/lw7FGDoMhf0faEjGKnhQUprOreIoUN5NYoteY+E+Sgd8Plm57aOJPNWMobYd1T6uuKFzDPH7i5lT6YzK6/oIbNqCdTOxm2cw/sChq0Y8xrKw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VKLsI93Hw0i/HLyFwFubb4EwJgO/LAVt24geoGbm2xo=;
 b=Ms59N13p0bS3ZnbWCojjBZfKE33kHimWCnvhuZRD1LTT8tuc5xsrBdNN1HO2GGnFW7AjXhBVqsojpYIR9Tx8WUB4SmsSI2ikXnkHK9f2CkZRoQ7NywMDpfwzv4CwuNvFgrmq4UFMxsGpTvI5cS0WPugoJqii6lRru6knJeotSWQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from OS9PR01MB13950.jpnprd01.prod.outlook.com (2603:1096:604:35e::5)
 by OSCPR01MB12643.jpnprd01.prod.outlook.com (2603:1096:604:338::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.34; Fri, 11 Apr
 2025 17:08:53 +0000
Received: from OS9PR01MB13950.jpnprd01.prod.outlook.com
 ([fe80::244d:8815:7064:a9f3]) by OS9PR01MB13950.jpnprd01.prod.outlook.com
 ([fe80::244d:8815:7064:a9f3%4]) with mapi id 15.20.8606.029; Fri, 11 Apr 2025
 17:08:53 +0000
From: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
To: tomm.merciai@gmail.com
Cc: linux-renesas-soc@vger.kernel.org,
	linux-media@vger.kernel.org,
	biju.das.jz@bp.renesas.com,
	prabhakar.mahadev-lad.rj@bp.renesas.com,
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
	Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Hans Verkuil <hverkuil@xs4all.nl>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v7 16/17] media: rzg2l-cru: Add function pointer to configure CSI
Date: Fri, 11 Apr 2025 19:05:44 +0200
Message-ID: <20250411170624.472257-17-tommaso.merciai.xr@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250411170624.472257-1-tommaso.merciai.xr@bp.renesas.com>
References: <20250411170624.472257-1-tommaso.merciai.xr@bp.renesas.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: FR0P281CA0196.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:ad::18) To OS9PR01MB13950.jpnprd01.prod.outlook.com
 (2603:1096:604:35e::5)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS9PR01MB13950:EE_|OSCPR01MB12643:EE_
X-MS-Office365-Filtering-Correlation-Id: 1a0fde10-af79-4669-e6c7-08dd791b8961
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|52116014|366016|376014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?4VW8FaOxuu5mw6yKlI9NtTdlBLLpuwG7nZrQ7V7J2KxjQq5ctD2n2BHaLcXw?=
 =?us-ascii?Q?q1wiqu52BCsgUWl2yUW47Ktwa9aDsEMb+AKcvq6r+Y4HkjvLsgMGydjrLs6S?=
 =?us-ascii?Q?LJwywDMNUfkWmsh72HX4udYATysjzwCetOhFSz0gZ6+4KJ6/nH68cNAFzU43?=
 =?us-ascii?Q?lnC8rKqMVJe8LFUY0EY/Nh2Fxf5nNjNTEjAozbp1GLpZehjq23L3d5RBxgRh?=
 =?us-ascii?Q?UWYrOuhpfdPBeNfgTXlih6pgr6m24BFMJTfk/UVGtih2CMBRuElTos+8KJ5v?=
 =?us-ascii?Q?A4iqSUt31pFrKcV+UGY4ZHd7jx3HPYqJAfLyAXKdxJd8/m52O73Ir9nYL6v7?=
 =?us-ascii?Q?tAgIzYEX8SEU1M+CiXvqNtxSCfR1/sly2qA9lxMKygwIYoBfJYGzq+o5vPxR?=
 =?us-ascii?Q?+OVVXRnqUipYrTH6iTiPdUwOBk4QtcT6+Pebp2tTBtZccUSoaKFFLjGNgnlL?=
 =?us-ascii?Q?iSRTX6+qbtmah6WMl3EX1mXVZeqBzqdfQLT1gdIzGmtr7ynIgrVyldMOt8/k?=
 =?us-ascii?Q?AktM8AC2MCOWqb2naCxsTVBKZ9b8glUjOGzqPxehpO1ZbyMWQKNvOhe/hDla?=
 =?us-ascii?Q?Xv46k2EhOYtBEZDAuSJjZtI5wx/BTlO6vKW2LyZqemnbnFry2vikn4r/6CPg?=
 =?us-ascii?Q?C4aFI+wU86pm1dM10svUEFEshzFuk0uuuBKmIqyOnVLaWePc1IS7f9+ViSXH?=
 =?us-ascii?Q?wVlwMwZHZuSfN92aNG/pfXu1toIPMRH3Kr1xgqq/sI8c8qWqBUbjlYA83pcF?=
 =?us-ascii?Q?DS9LN2w1OMzdPGFVry16pBFHIuzVKWYX+1gJM7zYfgBY1022sKeSmCbAvMFt?=
 =?us-ascii?Q?4LDa3JSHpmM66sIQUlSJuIaX5SC2PnmYiJrP7jNDKFjrZz1VCsI+3E3wJWTN?=
 =?us-ascii?Q?CDvwJ3U0w8FT4N8QdZl/soRQHe/ryic0aF/m4DLFZUX+Ree2Qi0uv6kupvpq?=
 =?us-ascii?Q?TfzzbdduIqkjcXIFDfJr+3+FCw0R9af2hYqnU3rRotLhjpepS2QgIg715k5a?=
 =?us-ascii?Q?LHc47RI+8BFd7B5yJWDB9UIEV9xNCphuzNV6McBtxNp4HIM5Ui+/V4cx3IIl?=
 =?us-ascii?Q?KVA6WWsrp5jljqa9TbBlhXTlrWryWUp0lJKrOYwgoeb3vsSmIERDS2ZEkQGF?=
 =?us-ascii?Q?+z3F86Uh6oIIHsV+zQ2ACrsaYn1eswCrcpNB6QSgOVefGsU6IRSKbVUk+NUz?=
 =?us-ascii?Q?VXzWImJqakNjnRk11IT8cnxn6d5Woyk7+dKK9ikGdeZXtiZryHKlRNMYZ7NA?=
 =?us-ascii?Q?da9z27VjC51Ugq8BPMasRyHmEon9G0E3ky1wAyh6cVdJUmQVvByAsnvi0bRD?=
 =?us-ascii?Q?kNK0SJnqXy0dxs35tp22j9g5EbSh5sqzHi31F+hZPN2jCqrhKstk+Wak0Tcg?=
 =?us-ascii?Q?rUR31UwUg7Vipy4nMZQNrPp6NBjRWZVEF09wtk0RyTH2khI9NBx6RzRWGhCI?=
 =?us-ascii?Q?uOPuyHvpy76pgRcwAjniAzIfdwWMRgg6OIdkKpqBCo/qdbKOn6jDyQ=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS9PR01MB13950.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(52116014)(366016)(376014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?DIjpV9NrB3LPsLXz+S9hlw/ck5SYWy/Y+MGHbbb3oT+8/UoI24ZMhKohAW+m?=
 =?us-ascii?Q?1gu2e7PZtnuBfJNgHUMVn/TitahmVCvj3eI9Xcwn4nBOY+vitYwMocy/l4io?=
 =?us-ascii?Q?Yr2L8KIPFItG8GvnOulUpd3citErbD45ckmAQzwAebbnzxhHz+HBzTw1KU3A?=
 =?us-ascii?Q?Qoq9IjU7JYAJCPF9BzrpRiARiDwh/7I5/WJB1MAjnK7gK7UkL8ns0cims91P?=
 =?us-ascii?Q?E7Yrz5vqbBFsZqkm/vvErr84uXLW1a0i6HOx7zvlZFe5Foj1FGun8kYbcEJO?=
 =?us-ascii?Q?R87G1Q8ZzM4BhrLXRvz8ZSPQqW7mvxfKS5md2W7+QNbArZpBBqltAuN3ChSG?=
 =?us-ascii?Q?4mX0P/DBR8Y6ZCm0ne3pR5AifqJyagwepxWCZUEPBPosioD3ioekumL1UJb0?=
 =?us-ascii?Q?pbiXTJfhcpSI4kl6DiNh9B/7J9m/Ca2z7lSdqcTtu76Ku6RtVljy+Q0Rnitk?=
 =?us-ascii?Q?11PKJS4E5MujTeC4blCKfJ6ZHv49WIsdLwD5ajkVW6XwBvowyH7xLLXBUhSI?=
 =?us-ascii?Q?tVT0U4zlQDF/3CTixYwbvZAnm7HqBXsc/Ao9nrd6x3FPGKsttCMQ7t8JUQY9?=
 =?us-ascii?Q?+3+wivvJZ1hAsMIsiotPftodr5ADfrPuA6VEB0WkGEkwNyeYzEcO0ZgTayIX?=
 =?us-ascii?Q?DnX1YAQ/hWkJNYfDDgZOIcN2foXKPWZVlDbMTh0lLd1zDnI0DbBOkUOmWk4p?=
 =?us-ascii?Q?WKWGA/NNTcSET7Mx0Liivln4quROm8eyaoO8rnBrFTKjUHFbjVgVLVLP7teH?=
 =?us-ascii?Q?nuJhP2VsRoWo9ugxvhiE3/25dJ2lQolOyGx5kzUbkd1hdJ6366Jn5HoOsJYr?=
 =?us-ascii?Q?0ABVJwDqRIgATtpV0RP2iFolyzMH7QH6syMkqPu1ntWH+iOb9In6jCNJWl3V?=
 =?us-ascii?Q?LNb4XSW0fWa3Jz3wmNjvmWuykSWrqDK8pMTAqmrigsD17oypApbJzpo3S2F8?=
 =?us-ascii?Q?i/j1DV8uOjs5DI9k46TdFFtbbH4Ayst2iQKGLXXTLlaBWObWj5eS9E5hwp5X?=
 =?us-ascii?Q?Rs/FmlgNBOipNiCB86o6/ICHt2bkx6xDnxgA2iwWmRehvgRgvSOXZcWlOD4a?=
 =?us-ascii?Q?vfQz6oZzhYR1+kQE9qg4bU/T9Pk0YTusIbirOZ1Q2j2STNccoxqROGNcs3r4?=
 =?us-ascii?Q?bUJDTBGl8r5+oYO31dgfwnMiqth/3eVUEmH861EjrZ6eEstHOei9dVn6Wkb4?=
 =?us-ascii?Q?Ag4R0tejqS6tvPAWc+yDHXEOOovmA7ykI6FfBs1KnduRTZgkjVqs3tWAgyGV?=
 =?us-ascii?Q?WSb/jSidAGd+rTUX6xsZABZLoTOSJU/4n32QI1B+r+tbc1wXA1XmnNlHyezs?=
 =?us-ascii?Q?HwRIj+cCAFMGufIHlUjDKu0KnPMcUFGlmid3i+EEwj5HXLiQWeAul+9Rs0W8?=
 =?us-ascii?Q?RYZENztfIt5SmG4vggFf2Gs/LUfck/xrnCQyDaf1cLgJoTuiq2VDGwDpNRc5?=
 =?us-ascii?Q?2CFQd+bFuu8oSCLB3R6vguhOEyiLAIZAVc0GWbWR7gkhQSsKBDKwDVI2NHBG?=
 =?us-ascii?Q?IIBUnLVslMGujg2Ox5gSNmfqWrzLooQz/q9ImEH8EAnRVtOSN2eCB/1rpKBO?=
 =?us-ascii?Q?qi92jKBTsICz9N5mnNhBsXPxWhimMzkGYXz9GQ7e1AhNRYaLC8CA8Fzkn3Qt?=
 =?us-ascii?Q?ss6BP0d1zhjuSFyDL308vtc=3D?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1a0fde10-af79-4669-e6c7-08dd791b8961
X-MS-Exchange-CrossTenant-AuthSource: OS9PR01MB13950.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Apr 2025 17:08:53.5773
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rLqH2joqVHHzlXUOK/kQscBxs0AUu55B5a6tixsRPQZJ0xaSRB3qEMN3GC/Oz8YoVfBryeQZMfi1PhLeIbXzyU+KYtc11RjI10x5mLgLG+eJYiR6W5qNI9QX1GmUt/55
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSCPR01MB12643

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Add a `csi_setup` function pointer to the `rzg2l_cru_info` structure and
pass it as part of the OF data. On RZ/G3E and RZ/V2H(P) SoCs, additional
register configurations are required compared to the RZ/G2L SoC.

Modify `rzg2l_cru_csi2_setup()` to be referenced through this function
pointer and update the code to use it accordingly.

This change is in preparation for adding support for RZ/G3E and RZ/V2H(P)
SoCs.

Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
---
Changes since v2:
 - Collected tag

 drivers/media/platform/renesas/rzg2l-cru/rzg2l-core.c  | 1 +
 drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru.h   | 6 ++++++
 drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c | 8 ++++----
 3 files changed, 11 insertions(+), 4 deletions(-)

diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-core.c b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-core.c
index 3b5de84533192..e0f04f7e19dfb 100644
--- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-core.c
+++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-core.c
@@ -360,6 +360,7 @@ static const struct rzg2l_cru_info rzgl2_cru_info = {
 	.enable_interrupts = rzg2l_cru_enable_interrupts,
 	.disable_interrupts = rzg2l_cru_disable_interrupts,
 	.fifo_empty = rzg2l_fifo_empty,
+	.csi_setup = rzg2l_cru_csi2_setup,
 };
 
 static const struct of_device_id rzg2l_cru_of_id_table[] = {
diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru.h b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru.h
index 2e17bfef43ce6..ccaba5220f1c8 100644
--- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru.h
+++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru.h
@@ -89,6 +89,9 @@ struct rzg2l_cru_info {
 	void (*enable_interrupts)(struct rzg2l_cru_dev *cru);
 	void (*disable_interrupts)(struct rzg2l_cru_dev *cru);
 	bool (*fifo_empty)(struct rzg2l_cru_dev *cru);
+	void (*csi_setup)(struct rzg2l_cru_dev *cru,
+			  const struct rzg2l_cru_ip_format *ip_fmt,
+			  u8 csi_vc);
 };
 
 /**
@@ -187,5 +190,8 @@ void rzg2l_cru_enable_interrupts(struct rzg2l_cru_dev *cru);
 void rzg2l_cru_disable_interrupts(struct rzg2l_cru_dev *cru);
 
 bool rzg2l_fifo_empty(struct rzg2l_cru_dev *cru);
+void rzg2l_cru_csi2_setup(struct rzg2l_cru_dev *cru,
+			  const struct rzg2l_cru_ip_format *ip_fmt,
+			  u8 csi_vc);
 
 #endif
diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
index d35e9b2074937..809c43d686e26 100644
--- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
+++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
@@ -242,9 +242,9 @@ static void rzg2l_cru_initialize_axi(struct rzg2l_cru_dev *cru)
 	rzg2l_cru_write(cru, AMnAXIATTR, amnaxiattr);
 }
 
-static void rzg2l_cru_csi2_setup(struct rzg2l_cru_dev *cru,
-				 const struct rzg2l_cru_ip_format *ip_fmt,
-				 u8 csi_vc)
+void rzg2l_cru_csi2_setup(struct rzg2l_cru_dev *cru,
+			  const struct rzg2l_cru_ip_format *ip_fmt,
+			  u8 csi_vc)
 {
 	const struct rzg2l_cru_info *info = cru->info;
 	u32 icnmc = ICnMC_INF(ip_fmt->datatype);
@@ -266,7 +266,7 @@ static int rzg2l_cru_initialize_image_conv(struct rzg2l_cru_dev *cru,
 	const struct rzg2l_cru_ip_format *cru_ip_fmt;
 
 	cru_ip_fmt = rzg2l_cru_ip_code_to_fmt(ip_sd_fmt->code);
-	rzg2l_cru_csi2_setup(cru, cru_ip_fmt, csi_vc);
+	info->csi_setup(cru, cru_ip_fmt, csi_vc);
 
 	/* Output format */
 	cru_video_fmt = rzg2l_cru_ip_format_to_fmt(cru->format.pixelformat);
-- 
2.43.0


