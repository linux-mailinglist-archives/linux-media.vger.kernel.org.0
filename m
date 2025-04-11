Return-Path: <linux-media+bounces-30051-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id DD794A86438
	for <lists+linux-media@lfdr.de>; Fri, 11 Apr 2025 19:13:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 26EA64E2B76
	for <lists+linux-media@lfdr.de>; Fri, 11 Apr 2025 17:09:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AB7E0232386;
	Fri, 11 Apr 2025 17:07:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="TDa2z5qN"
X-Original-To: linux-media@vger.kernel.org
Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011019.outbound.protection.outlook.com [40.107.74.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4ACB2227EAC;
	Fri, 11 Apr 2025 17:07:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.19
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744391276; cv=fail; b=d0yyuUPeL68w87uK73KxPGZsG/43lL051LckbDXXmkjpbXgmNpOEZ+8W6jZhcUdXaht180O4EoHMR3Zbed1r9zydJt4em9+MpMEXaG5x5OSTF0dMeneJMRXd2Jcis5WCn1uCqUftbsZySJa95xCo5/5lc84ekmo+66QnrTJ2v0c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744391276; c=relaxed/simple;
	bh=WsTe5yqKNpbZhONBV9fetn5jZK327veD/arzfRgY/bU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Dj+L3CgNn/OHaVGhNRbEKu5RotrHtiytZ7ZWqO7fKGJDNL2rOt0e6knF5ZOZ2x6BImkUhT0NBTHw7ThZeDByRO6bGdOGrdUGxbyYU4qSbUegNEP7EhQ5Cj59Kh7fg81kqaCAtp+Qt+QGvZPFOA0J6mmB5JqAVBe89miestMijTY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=TDa2z5qN; arc=fail smtp.client-ip=40.107.74.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pbEofWUI1Ubb4O5g5qJ9yl2IndaoWew/n1khy/ebi9VfWYRot/9Rpbk/dlBKYzXmXCvyVuInZSfwbhvBRSNRe3Bkr3iT3oCFoNc9Rqy8LU5NsiMSIPphRccGSoWTQ+W5J88RdP/LwNdSiET49qZag6CZKZEWBSbnU8t8s0UKD6Y/80q1+PCsLAnzKxRVP3/nJsC9I3ZcE/wKnRJe+v2KFcyMViHemyZvSG+MHQsia1qVJVw4fL0/H28SJDlPJL76Hy/i4ODAqq7yyvwaHjbz8jcOTIQOxHkLXwqmWj21sQLBTDSI88JRiJWVHO+D4+skGzuuJJRFq1wIQLHwdI/O0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JU2z6a883QLXEjVLggf/IXa/tCrpPjFJYi5Tqfv177o=;
 b=HxjX/1qheNHxtKGp5X+HHp0an7zVAbbxiBOiYbQsxqRb5/4IFmTfwEa9HTco8nFwa/LUJjd5YDqUCiILjezZKZFuXu4w64MTiFYZSH5ToQ15W3IOmKq9HIr3z56vVCgi21Z3hUI5zv1acqzibFh3eM860DgQxRl7TnJTXeaTWd1ly3n/dgQ824SlcZ9AX14g1K1RG7WyYSlPpR5kFjWacMXvEf/W4RHbwplEZVcLhHvpuBr0u4dn6ur5HrB9+hdZ9gDTm2ASkLJc3ZoXVcusWBb64MDhL+80YtXR4TBMjvX9kCHIa6dwPwCqYsL2zBFpBqdav/bvwGEkZu/XboDehA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JU2z6a883QLXEjVLggf/IXa/tCrpPjFJYi5Tqfv177o=;
 b=TDa2z5qNh4lO1stz4gS1cYjvrUi1FijQ+WsLiZ6N5gm0mzjd990JkI11BK/zn6X3dijxKpg8U4a1at+ZpN0/ArXlG3yeTuELUcJf6lpTfnyx3oOpQGUXogodqjicIfCkKjTeT98Yls79Byy/kKlMtxdFS1N73bXqfhXKeUJgwtk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from OS9PR01MB13950.jpnprd01.prod.outlook.com (2603:1096:604:35e::5)
 by OSZPR01MB7963.jpnprd01.prod.outlook.com (2603:1096:604:1bb::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.35; Fri, 11 Apr
 2025 17:07:48 +0000
Received: from OS9PR01MB13950.jpnprd01.prod.outlook.com
 ([fe80::244d:8815:7064:a9f3]) by OS9PR01MB13950.jpnprd01.prod.outlook.com
 ([fe80::244d:8815:7064:a9f3%4]) with mapi id 15.20.8606.029; Fri, 11 Apr 2025
 17:07:48 +0000
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
Subject: [PATCH v7 09/17] media: rzg2l-cru: csi2: Skip system clock for RZ/V2H(P) SoC
Date: Fri, 11 Apr 2025 19:05:37 +0200
Message-ID: <20250411170624.472257-10-tommaso.merciai.xr@bp.renesas.com>
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
X-MS-TrafficTypeDiagnostic: OS9PR01MB13950:EE_|OSZPR01MB7963:EE_
X-MS-Office365-Filtering-Correlation-Id: a0827dae-3df7-4076-ae05-08dd791b627a
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|366016|52116014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?qMx/u2yiYQ4qII3Dt2qsY1w6orI9gI5llG5v49sGuad5bi6cSQR3WiJf1+4h?=
 =?us-ascii?Q?drbCCbdQyEQoE4qfPcmIOkD+y1AfKJct6P13Hz7P67xvCcPh1DrI6RkIHJnn?=
 =?us-ascii?Q?kJdzLtwkZVSiRkZv3ssCj8r3hNlzPCo4Niqw3B1R652bPYeu+Gms1H+e/DfF?=
 =?us-ascii?Q?b/AWQMUSBjUypNM4IgNGXDWB2pD+Mrys6+zqeTxCpq1qFas8aGTZICtiS7Zz?=
 =?us-ascii?Q?9x8Ufjtslx8e07oPueN4Jth5QuKNxl9rs539FtDYryj2yoByjhCapzaWsX0Q?=
 =?us-ascii?Q?fIZNpkJIQ98D0sgtfCCrM8rn2S7VQT2Zyl+0awAVMwCMopjy4ldxY2yQ0B8T?=
 =?us-ascii?Q?erUkC6oMnzRTblz2bpXlG7ZIoJbQzDBy+1XiRgLOLUXw4tj+4qLW/sq6mpeM?=
 =?us-ascii?Q?8GA/fs3uk3Ymj+IOB9U33XmIhw/lf81ZJQByLvSC3SRA7SY+6bJyver24GP/?=
 =?us-ascii?Q?5Wzxj1OO9/eCPwI7Mp/n357JvC7n/7YAbFkopISxzWH2cQR2gsdGGlpjjOXL?=
 =?us-ascii?Q?uHS0kf70ZTtGeVO/eCMiWE0l5i635c/2fIS32S+L6HiUqwy/SBbdoTKHPT7w?=
 =?us-ascii?Q?vIc4pIHl5cWagbBooAYtO4nTgVMULLXGe/t9cwIJT1kKSzl4yjfNyjwRUIS3?=
 =?us-ascii?Q?Pt4fHJp890WL3p9p40kKSyVSqU543vW1TsUc0A7W9pV+MZP4J2CSTS39gr9z?=
 =?us-ascii?Q?Cp6Y5naNrO8cLfdEIgREBTnrBQBxArRFn9X0xK6yvDS1A5hwdnHrKawyjldD?=
 =?us-ascii?Q?eQ1o4G4TJQP6Bz/hi0op9tmmhjtleFEqWA9zc+mLjot1k6ajE54n8qEs2RTL?=
 =?us-ascii?Q?LZ6IdRMqmt6OVsAQONzgbpy5vbn3eVbzX4naBX3PWxtLmWEOiPmBCTgab8b/?=
 =?us-ascii?Q?6KPcfd+IEDeRI5SvFInpMX1srLeIcK9wyZVOmIEgVv4txHGXn5L//o1gUHFe?=
 =?us-ascii?Q?pC0AHW8YOFwH3bW3PgwmVUP0rXLuTgtQe0ilr170HMBtDVzocsO5EKB/x1Z3?=
 =?us-ascii?Q?GYrnFDPcbGIijuq/HfzYCn0ZrAPkldSxIWavs6GZpUnrAHifHJ3OLIUNthvh?=
 =?us-ascii?Q?3WImC5GC5Tjx959yXjdGotQk138/B4oSn2k7WkT6TBZAaseKpZOsFdak4qD4?=
 =?us-ascii?Q?X3hAiJ51B6W05tqVjSamLCRdP20xT5zrsL6B8MZpxExwHND5JkbVywf/VzvO?=
 =?us-ascii?Q?dTdGW2aAIxJ5Zztku5hM1+YnHYwZB/aO6Pi3fCyTgSF3olUKxUOgLuAA7AQo?=
 =?us-ascii?Q?v43m1SdDefi93HwtwQtVGuuckEqXByMHyLuZIhta6XBtuNXyZLKAzkqFT2rE?=
 =?us-ascii?Q?JBFF1j1QiTxFkh1fkP4ejTcdeKWWUadqY708KVwrxrm0gtmEvMmFCmEE88rZ?=
 =?us-ascii?Q?sWL+yOc65Wt/Jgw6L1k6qDzvzGDOu36BHitMfxqSWTClJHALDvGXwZKO/pUO?=
 =?us-ascii?Q?jL62R/YFSrrfB24jfb6X+cGKzB+97Un1IqC4Ta+LIQWrNAIzVAbGOg=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS9PR01MB13950.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(52116014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Vx1TIWYNZsGhN8WOrSfH0gKApoc6lmhvi2eHnfSFIW73C84wysFZY1pFFcca?=
 =?us-ascii?Q?c3g+Fwa+EeGqG+xIiyxRjfY5QNRxBLnEs0tuZKrPzB5wixQc8YRbkAJ7Ros1?=
 =?us-ascii?Q?9Si8wwTUHkaGg5XV0hSkdCJpE2ZwRSlC7veFTilKzOhINF/HUgmcsguY/ySB?=
 =?us-ascii?Q?TRriVIzf56TB5A9DwuTqgK22yASnbe7hCmATybZthzNQqjfdk1Qz4hqN1tDs?=
 =?us-ascii?Q?cPPByrGy/rsLN4Q1NvJV7GV5sJln/C8bbOnWWhRJgb5X7GpHjUK3THC+G1nl?=
 =?us-ascii?Q?Puf1z2jgLNo2tXMHt20O/UYUbx9Dsoe3HiGtR8qk2qpfHfpElkC+LACQbltm?=
 =?us-ascii?Q?ljX7h5jzMGPveaY4bBwM9T8W5kcsAJXhJLnN9hzX6lpdCF2ntP8eI1cKOxew?=
 =?us-ascii?Q?LsOoBSdRhHjVKDM5e+Bxkwh+CeluZGHtarN3FyyVmaCj5L1kJRtt6p06DIOv?=
 =?us-ascii?Q?4gV7uazQWtAcA8/q+/JRsvvnRrV11ans/5HL28Dt3bMurSDH6MjP9uSIqNA/?=
 =?us-ascii?Q?pSnthG4YJxs/tlcCbwX5eOXmD2GJsqJUGcqj2JWqqW5s5mMadHtFtLpL/LEU?=
 =?us-ascii?Q?OxsZe4rj9H+VuicjKDNYpGYIk+/HpZR3SiV5nK8HXxz7ypdfAKjwtY9+xyaI?=
 =?us-ascii?Q?Ga79aH+wMt3gK7TVIQCV05/GrGqxquVEwROys0e0RrzV5MPGAZ6IP6YA8ArS?=
 =?us-ascii?Q?LRfb5MV0cOplftlBlGnVZM6D3bYqHrA+iW7my4D8aJsQptMXRymj+WCVe1TA?=
 =?us-ascii?Q?Hyn9SN3IA3fcNh+ykIYWg80nvEQV+40nWUsym0+robQGJWW+PGoH8hIMKepy?=
 =?us-ascii?Q?urtdzkggyrIpGsvRyaJA9UqO2QSeNE3YuZpTRMFpz1FVAcjf96P/oT8rhUG1?=
 =?us-ascii?Q?KaKkJ9zelOfpSzGDGBDix1QONx3uGCf3/c8sEDqyUUGwpNR9VZFRpSS3JOcx?=
 =?us-ascii?Q?CcJ5nf9StbsRqrUEesjkAXXrxEnRiPPTijKe1vXm6uFZnvUcfGrCAsTKJcrb?=
 =?us-ascii?Q?pvEq9ORPPPbMVROaK7/NwYvVUubREEb1iKJcK7NOeO0b9uW5i1X2K9NbpzQd?=
 =?us-ascii?Q?qxp3n42q36val3gVpvw6RIFys3CmBA0vjLHfqvZBP3rUz4WR2tyMGb0KwQPY?=
 =?us-ascii?Q?QAQTyhmflNYYmv5riz4tMnpacrnvA8TQxF0YYcs0ZPcizHLmmWy2HeQj3Q4K?=
 =?us-ascii?Q?S7KYafTIQcEazGg0KDng7H6/osG/X7YBI3J5tPdmgDXgoG25Azgkvyyu8LLc?=
 =?us-ascii?Q?ZNthDFG2NsO5cQyZrBlw9mFjK100EeIcHUTs4jV+DoK04JDhNRyCOT1v8/yl?=
 =?us-ascii?Q?/giO2nY1TWgxTLHXLEpOVnYwICw3+ZLTHcEg2ov5pwPZhNoMKclyk5EG9Noo?=
 =?us-ascii?Q?L01gbribsYkM34g3teuKRAghcEPqER37lzciw1QHt/GGoQjB7top6Iyy8lVF?=
 =?us-ascii?Q?tQnXXwn3rarKZ9uIkjICLdqaybZ5qXPvTT94WFYjKMdyVoWO4pHP27k2Y39N?=
 =?us-ascii?Q?o/cO3/ry+lqFEu2UY+pSkzsnMaILQ0sD1qPgBAQBak2QzTnjdFKpw6jTerzx?=
 =?us-ascii?Q?wwPE89endB1VaebmhEzW60TP3HIYPd36mFq/juar5o9oBeozGuAgA25TULMG?=
 =?us-ascii?Q?ckMrfGvQksXddktOrrJJ+9Y=3D?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a0827dae-3df7-4076-ae05-08dd791b627a
X-MS-Exchange-CrossTenant-AuthSource: OS9PR01MB13950.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Apr 2025 17:07:48.3082
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sZFYVRmyOpYUNRzr79OQ03KoVUyfB4RXt28nfvnv6XluWOqXYA1ETfYDBox3yK52iy6SIhJcrDRuh5ohlfn1R39zoLz7HWM0N72DmiC357dfs7tmR03bg80O1UlVzM7L
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSZPR01MB7963

The RZ/V2H(P) SoC does not require a `system` clock for the CSI-2
interface. To accommodate this, introduce a `has_system_clk` bool flag
in the `rzg2l_csi2_info` structure and update the rzg2l_csi2_probe() to
conditionally request the clock only when needed.

This patch is in preparation for adding support for RZ/V2H(P) SoC.

Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
---
Changes since v2:
 - Added has_system_clk bool flag to the rzg2l_csi2_info structure to handle
   case where system clock is not required as suggested by LPinchart.
 - Fixed commit body and msg

Changes since v5:
 - Collected tag

 .../media/platform/renesas/rzg2l-cru/rzg2l-csi2.c    | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-csi2.c b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-csi2.c
index 4aa5d58dde5bd..e4781105eadc0 100644
--- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-csi2.c
+++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-csi2.c
@@ -127,6 +127,7 @@ struct rzg2l_csi2 {
 struct rzg2l_csi2_info {
 	int (*dphy_enable)(struct rzg2l_csi2 *csi2);
 	int (*dphy_disable)(struct rzg2l_csi2 *csi2);
+	bool has_system_clk;
 };
 
 struct rzg2l_csi2_timings {
@@ -364,6 +365,7 @@ static int rzg2l_csi2_dphy_enable(struct rzg2l_csi2 *csi2)
 static const struct rzg2l_csi2_info rzg2l_csi2_info = {
 	.dphy_enable = rzg2l_csi2_dphy_enable,
 	.dphy_disable = rzg2l_csi2_dphy_disable,
+	.has_system_clk = true,
 };
 
 static int rzg2l_csi2_dphy_setting(struct v4l2_subdev *sd, bool on)
@@ -801,10 +803,12 @@ static int rzg2l_csi2_probe(struct platform_device *pdev)
 		return dev_err_probe(dev, PTR_ERR(csi2->presetn),
 				     "Failed to get cpg presetn\n");
 
-	csi2->sysclk = devm_clk_get(dev, "system");
-	if (IS_ERR(csi2->sysclk))
-		return dev_err_probe(dev, PTR_ERR(csi2->sysclk),
-				     "Failed to get system clk\n");
+	if (csi2->info->has_system_clk) {
+		csi2->sysclk = devm_clk_get(dev, "system");
+		if (IS_ERR(csi2->sysclk))
+			return dev_err_probe(dev, PTR_ERR(csi2->sysclk),
+					     "Failed to get system clk\n");
+	}
 
 	csi2->vclk = devm_clk_get(dev, "video");
 	if (IS_ERR(csi2->vclk))
-- 
2.43.0


