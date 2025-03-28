Return-Path: <linux-media+bounces-28942-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 44C8DA74F59
	for <lists+linux-media@lfdr.de>; Fri, 28 Mar 2025 18:33:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 26C90189131D
	for <lists+linux-media@lfdr.de>; Fri, 28 Mar 2025 17:33:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 24A9C1E1E15;
	Fri, 28 Mar 2025 17:31:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="IUOItRVa"
X-Original-To: linux-media@vger.kernel.org
Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011054.outbound.protection.outlook.com [52.101.125.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A88B21DE88D;
	Fri, 28 Mar 2025 17:31:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743183115; cv=fail; b=fMN5zXFoww7qE1HJKMHmGzNN3Bz5O/6Te427L9ZxG5HXutZLZ9RWl8CsmWKV/UUkJZvKEAgpp7xE5Co9RYArZoi7HTKJtd6B9yZiSdkB+FT+1O5oBa925lZ6IAvbcGfoQdR1Ynq5/NfdOMo+Xtd6brExaIzBJ04GApfXc1bQrtk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743183115; c=relaxed/simple;
	bh=gk2f5O3tX4SENV+cB0k7xa34lZ1ZnngCnzzMe/PyGo8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=T3Dul3tIx17CVtROWrbVMTsHpzzWICLLv58O7MovDyhl05QlKyCuHpGRwo6ErjwYiR/2D3Iy+2Ar8SFItmZ2ngPN+0CUFIJff9g5n49Q5qf2J3Kd2mY4v+53VM6Ai7l/RY/UXxJMMl05/ur5BRK5wtAymsaXbDdMGQ7yp4CXPYA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=IUOItRVa; arc=fail smtp.client-ip=52.101.125.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wisct7MLp9rE8B0sAQFGjrpLxpI2EOG4bagkDTvbF1CJ/IhfOWCQZGy/nojVWywkRk7kC3ZK+ZCt49oEryYprjovOyMZln7ehwbsxD9x/85gUwxSIcPKoyaQqrZwQ3DkWnvdn9HNHx218N/88ftKZf+StrnQD6tGez1W4aKH7au+BkpDdfVJpmc6RNBN89GF5/GvBX8p/42JTIJmjB8BaFEvMAVOe2MDj0UEEf2dov6muLmrIMKLLOCATJuxKNaJT3ytvXnUrJYjH9gsQCsiWUT+Sc76O98nxHQISuPVFSkVpYIcSTsOTDEOgZUGpXnvNjRTqi5RorD6o3LkSKHh1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=O80LhtIrIy/abMehTBvd3FaXj5QPLwAUb4l2HqwPAFM=;
 b=ULmo7BLs7QbZfVwyr+EtRur3pSac9mGec2Kp6NQ7yXmwcvJVvDb594vlxlUtEbc/Bh/pUOxpMqhTZOsizDXdfRB4hH3U3uEB5wo7Hf6HgrXaievX9+RRtkDV/1tK5y+fbeSdVxBy8KbGeuZr/PEW5CJj7uPViefGvzMhb2QwkHuVmG+AO2QV9IVr4I1VCa8BdAo7CNFndLJBqfDUXATUq67WHuQYrSHgGqA0ds9z/JuUCHKySu3gVZPfLpvXs57W5c3GQUnuI3Rtm3bc38u9dy6B8Pn/rQ/FJcK2sStdd5Y5AEQOKZmnaPT8P/RLMQw/Cn4m71BonIPzDcWGrUZtVg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=O80LhtIrIy/abMehTBvd3FaXj5QPLwAUb4l2HqwPAFM=;
 b=IUOItRVapMqnHwdVTmcbTWBjNBaP/lJCqCXi3g/JkROEOCijKDLKPkZzhoSqRZeJoY8PCnA8j11PtNtatApqcgolTTGPJNzpG8/nVueMzg4wlzCA/VqaVfDWSzoTQqekfFg7HE5uP4kHtech01feQ0NpxNJ71lgcSvwiu74P3P4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from OS9PR01MB13950.jpnprd01.prod.outlook.com (2603:1096:604:35e::5)
 by OS3PR01MB9720.jpnprd01.prod.outlook.com (2603:1096:604:1f1::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.42; Fri, 28 Mar
 2025 17:31:51 +0000
Received: from OS9PR01MB13950.jpnprd01.prod.outlook.com
 ([fe80::244d:8815:7064:a9f3]) by OS9PR01MB13950.jpnprd01.prod.outlook.com
 ([fe80::244d:8815:7064:a9f3%5]) with mapi id 15.20.8534.043; Fri, 28 Mar 2025
 17:31:51 +0000
From: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
To: tomm.merciai@gmail.com
Cc: linux-renesas-soc@vger.kernel.org,
	linux-media@vger.kernel.org,
	biju.das.jz@bp.renesas.com,
	prabhakar.mahadev-lad.rj@bp.renesas.com,
	Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>,
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
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
Subject: [PATCH v5 07/17] media: rzg2l-cru: rzg2l-core: Use devm_pm_runtime_enable()
Date: Fri, 28 Mar 2025 18:29:43 +0100
Message-ID: <20250328173032.423322-8-tommaso.merciai.xr@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250328173032.423322-1-tommaso.merciai.xr@bp.renesas.com>
References: <20250328173032.423322-1-tommaso.merciai.xr@bp.renesas.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: FR0P281CA0057.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:49::14) To OS9PR01MB13950.jpnprd01.prod.outlook.com
 (2603:1096:604:35e::5)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS9PR01MB13950:EE_|OS3PR01MB9720:EE_
X-MS-Office365-Filtering-Correlation-Id: 8f585a0f-93d2-4a91-a9e3-08dd6e1e6cf3
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|52116014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?nrFJQHOEHWYYKgFw3kmxA9jrK4cCd22n35imsxnUfteV82QIjcVD54CUIJCC?=
 =?us-ascii?Q?rEztVvTPu+jAP8awS9Lz8jwI1YJYtnWRAMP8bZjXrlFgIZXuiQxtDsv1+bKx?=
 =?us-ascii?Q?LWqCg6wWJtxOIv4kAbRr5k99ha1+bzfibPwoBcAPUMHrqZwJFGUYv+RG49+7?=
 =?us-ascii?Q?UBpTe3XtT/6Ss0YhBm3v6Ay0IU26qX6ZTEaV7s9ZSWq0Yl+QWfrZZfxsCs65?=
 =?us-ascii?Q?7raVe56bKbtmQVRPYVszdqThUJbzRfIKx/5ERVQ7SM/feGu5lhSochK8AkP4?=
 =?us-ascii?Q?3AbW9HLPuZUANqNUwYacj2zaDleUycOvtms52SSMcosFdjT/acACTyHO7Oxo?=
 =?us-ascii?Q?hJidjo5oqHnZ+IEZMN+61ICzPTiQKKc6OIdk6WfUuq/yydiU7T0DG/psbnyp?=
 =?us-ascii?Q?INIeX600OaW2SeloGnfeJA6JmmMC47PDo16M0qfiXkdHLIuisjQCMqO8k/Hr?=
 =?us-ascii?Q?RRdZWv8WRhxEElYUpNvzIQM1itp7UTfpXPekQG9kkVIGSVkQw4RD2wLWH/Ar?=
 =?us-ascii?Q?g3zCwEpjYFwI5HHVn/GzZGDi6LOZv6EYDMBupRbt/Vg+572nA6swXeQColqY?=
 =?us-ascii?Q?f+59/RfxFXelaJPQHaiAvrS6HvaaSYvDlh1ts46rywSCHv8JRYObxAk1HtoY?=
 =?us-ascii?Q?/4m8Kp/bq5QFD5ZOh+jQrpjiZw3QI8l7o1ujd8jq+4zfGz9g2DvmaUonmQ13?=
 =?us-ascii?Q?uUT9HaGU0lV+MZOFSNwC8BM3jGbtNAo5P2wsIR/tKrtjCbj2dfqtyfUht3Df?=
 =?us-ascii?Q?9zltivbuM9vqr4/lrNWAi6SL3yFA9Gj3yx3k2kFVXdTJA+Pls6vyu/ur54ui?=
 =?us-ascii?Q?1Ah62nwEQRX5eSAUu87gjXVyPj390Q0+987Rdf3gMy/I37bf3g5bqBH/N2eQ?=
 =?us-ascii?Q?YW9utFwmOZsD//ruJ9sxIK27F++uCBNC10EOtODQxjTpWtl38zVFmq3ey5QJ?=
 =?us-ascii?Q?ThSKEzzKVPcLpAoV45f2Lzass0jKVeA9qrDT74xyark2ojVv2dnzcefRGXPR?=
 =?us-ascii?Q?GIMqziWwq5ljt1+MMrhKpW8xiDek809etvQldSFr4HN/H3EJ5Mg4pu7fGZgB?=
 =?us-ascii?Q?OsqPqJdTpVo9EH8kqkazFLFmg8XNAmIqO2Wko3oP5r29kS8sFAhqt019zw7f?=
 =?us-ascii?Q?xq46Oubdzo6qh6XJjBCn81SXmBl425npH2xtpt37OALGfCBJGQ356j6UCsn4?=
 =?us-ascii?Q?qCDPsXEGwE/OEQUrGdIiR6XCs2YW/tcIlbdgh5q23dxMvo5y1pkSPspC65WS?=
 =?us-ascii?Q?HP4bkv3Tvbw3yiiTN6iZlm5L67daZbCo8hK24dKHSsj+wK52+6ZrqxKGBNni?=
 =?us-ascii?Q?dmAoQEX1t46C+YhPLZLTwaFrAb2QHJBrxWHbuz/BNVDxrV+Aa75RNsVfi5X5?=
 =?us-ascii?Q?aVSD6oClVPstpQSv+K8ZXvWMLUW4oayBOrFDM5Pm7AIKRCLzY22d84WXNTMb?=
 =?us-ascii?Q?i3GDiORquWyYn2AiMdRho+zN9OnB1Ug04LGyfjiiipQk554RkWMBMw=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS9PR01MB13950.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(52116014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?sa0ld2daknug2DhQOjehBruQs4yROjVdj4Cw7afuTHUKIoJc1kdB4vXo/fSl?=
 =?us-ascii?Q?gOC+c/LSGpSn6BPlnBJUkFbAtBRS4scZhwRg0jnRkje9TSczubbNTGY+rnag?=
 =?us-ascii?Q?jnJSmzf9BLkyIotW+9V7wTGg2jcfYBdjn3g+1df2bps6vq3glO0O9yoN1Ybh?=
 =?us-ascii?Q?WYS0OAhdQTtk3D/OV6abcmRNrNfcMg8quPsVN0vpOuzJp6XXcJ34L3ldrLC1?=
 =?us-ascii?Q?3k2QSjQJegejL9rDeSeusRGQ4WmsEb1evOcw9t44sOlHno4hg1dVzGnJF9nx?=
 =?us-ascii?Q?4gyb9p9VWt4NEaSFzP3QGpE6bc28YUU1kH4aTdzytQeuPAyrCZyY/E2p7P1P?=
 =?us-ascii?Q?BNtlJNJILlwSH/udapNjDYwcslKsceHXW4uj6H0DdFnPJ1CB+uu1+Yj017V7?=
 =?us-ascii?Q?NKFjIaba/7aOY5NYIdGkoO6RQbNkdWMEzr3XKq7aGZtV2APyuHkN+o876XEX?=
 =?us-ascii?Q?qSiMEyghah43jizPoyZ1iKMC3jyIixVlO0o7xEu47N6qduOGa0RkeAGwnkt2?=
 =?us-ascii?Q?BQ9yDwYjA0sKutvGcgPHFyBBU5kcEzsxHBpM5YRwMCIpE1ezaSkZVreR0tY3?=
 =?us-ascii?Q?mEhbiuveUFoQ6vhtE4CP8UCJThQOmfvj+7Fx8zQy7BN/rQln7F7B4/Ovxucp?=
 =?us-ascii?Q?u0onZ614Xun+tXyOms6gEZuoV/b6uoiONwcLnPgq1GM7juMtETQCXCW18NL5?=
 =?us-ascii?Q?dizNB9Fm572TGGJVhtwMc968J+wfQLN8Eb+4bO9z8yknFSZNJ24qqcU9h1hI?=
 =?us-ascii?Q?dQ11HzmozAnQDOEsBlSA/aHdgZsQfIJwxg7HT00mdippwiIkYxn450/QbDRr?=
 =?us-ascii?Q?/IgCuhEyz01NpxE70Sw8kNAEx+nQqddZ6V1dIA8Lo0N0k6XyfGlr8vqQSB/q?=
 =?us-ascii?Q?NdcqQWdPnTW3HhJBdYfkJ5BdzqbHeFAztfxXApqem67+Dau8sRx+D91H+4Lw?=
 =?us-ascii?Q?c6keS7mDOeBuGmlx6uo5pFS7ByplHCXmeQwGa/LQu/qqnPOM9QagARNQY9as?=
 =?us-ascii?Q?H26y9tEGqyTTfLSc8DLE/uDpJMSVEw8qr7pKzfsgVBRDb76aenVS+OUtaqnY?=
 =?us-ascii?Q?XKl/obaI5Qov0pfSUZ7uGDDgLKsDn37eECRadn9xswnpeiO8sqFaUVIwSkoa?=
 =?us-ascii?Q?g6+LuWap7EsyRjhAToarvPVZWfe+em0ymHsx1VzAqqZ3VQ7j+ytdBWsM2S/L?=
 =?us-ascii?Q?hJkQdX1zeC1dT+tv1EfrFIOJZ8wjIGQWCi8rjG9wRMjMJqGUhI596fdX0AQx?=
 =?us-ascii?Q?TlI9cuHqnWyCXB/otz7lXE3yEoDoeoI9t2oozgNFVdYkpOYg8SNnN5LTCdMv?=
 =?us-ascii?Q?q/thtlspl9i7HaoGxbXSobpxUloBQb+bxJSES6Bh4H2Z5JCdM11IY0z3luNM?=
 =?us-ascii?Q?Zfp30URvh5wYIMPd4MNq+V7pN/H4/XA9UmM6z37NH/pG7Vm/Mw9H6vDthCYI?=
 =?us-ascii?Q?KsclZfxbV+OnPLH1jDY8F9li7RtNW7/tiJVJZtdtwR/fc+1JZPkkz1I40rOT?=
 =?us-ascii?Q?TUDD6lLinZiDhhXJxOfbkHb6FaAXv8Chmk/rCBcFlABUuhr7Oeg+CRBEynv5?=
 =?us-ascii?Q?xYVBmCmiyY0wbjRErub7L822ppDszJT97MgsFPS6jSXiwGqRHSzh2sarLQak?=
 =?us-ascii?Q?oo41L5KlZBIFhDoe087fC98=3D?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8f585a0f-93d2-4a91-a9e3-08dd6e1e6cf3
X-MS-Exchange-CrossTenant-AuthSource: OS9PR01MB13950.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Mar 2025 17:31:51.5501
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EC8fZ6u4g1zpRuDJqCt4yG6EaNPY83V2sQwTF6lUjVAzo04yUz2mZBAo+qzg97d4bkaG97Sudh43o+/5NTeohzcz9bJwTv6HhLhyZ1ueCrlEn/fevnM/Kv1qCB0Ly1MV
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB9720

Use newly added devm_pm_runtime_enable() into rzg2l_cru_probe() and
drop unnecessary pm_runtime_disable() from rzg2l_cru_probe() and
rzg2l_csi2_remove().

Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>
Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
---
Changes since v1:
 - Fixed DMA leak as suggested by LPinchart
 - Collected tags

Changes since v2:
 - Collected tags

 drivers/media/platform/renesas/rzg2l-cru/rzg2l-core.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-core.c b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-core.c
index 70fed0ce45ea0..eed9d2bd08414 100644
--- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-core.c
+++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-core.c
@@ -287,7 +287,9 @@ static int rzg2l_cru_probe(struct platform_device *pdev)
 
 	cru->num_buf = RZG2L_CRU_HW_BUFFER_DEFAULT;
 	pm_suspend_ignore_children(dev, true);
-	pm_runtime_enable(dev);
+	ret = devm_pm_runtime_enable(dev);
+	if (ret)
+		goto error_dma_unregister;
 
 	ret = rzg2l_cru_media_init(cru);
 	if (ret)
@@ -297,7 +299,6 @@ static int rzg2l_cru_probe(struct platform_device *pdev)
 
 error_dma_unregister:
 	rzg2l_cru_dma_unregister(cru);
-	pm_runtime_disable(dev);
 
 	return ret;
 }
@@ -306,8 +307,6 @@ static void rzg2l_cru_remove(struct platform_device *pdev)
 {
 	struct rzg2l_cru_dev *cru = platform_get_drvdata(pdev);
 
-	pm_runtime_disable(&pdev->dev);
-
 	v4l2_async_nf_unregister(&cru->notifier);
 	v4l2_async_nf_cleanup(&cru->notifier);
 
-- 
2.43.0


