Return-Path: <linux-media+bounces-20552-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 819A29B5A0F
	for <lists+linux-media@lfdr.de>; Wed, 30 Oct 2024 03:44:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 052F01F24ABF
	for <lists+linux-media@lfdr.de>; Wed, 30 Oct 2024 02:44:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E5EEB1991D7;
	Wed, 30 Oct 2024 02:44:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="WtwnaD1B"
X-Original-To: linux-media@vger.Kernel.org
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (mail-vi1eur05on2084.outbound.protection.outlook.com [40.107.21.84])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A96F1946D0
	for <linux-media@vger.Kernel.org>; Wed, 30 Oct 2024 02:44:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.21.84
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730256265; cv=fail; b=eOwwR+pHN7+2I2x0Uexsjjj9slNdduG1BwSyMuPTohW6bOXGmF7nSffVs89M6yLvU01Q1AeVoOUIV3aGxVhrHU+dOVxmgY26K0pOVHJnwPv0jaUBLFnciVLA2Fd6L/5jRIQfjHtWCzy3XCBavB3RkUV0sUv86BHVZlVl9hPprCc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730256265; c=relaxed/simple;
	bh=ivRJYMbM84wlwp6uoS2CN9T6O0uhk/AnaPNw28E4t3I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=AP2E0TeRtyVkx3HTz8KFhgXkbUpleScpM5jHqEYG+vErl+kVzNkfXdsz9cYsHK9eI0gWLAhafjV6vGp7VTyd1sWaMzHZXWD8V0DlbZP4jFmmNFiQLtURaBciPdhD8RTztyRCX4Hmv0729gkceMHvRI3/CKCPSThtl4gOllFThM4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=WtwnaD1B; arc=fail smtp.client-ip=40.107.21.84
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iHXatLrYWcjztKjZsf0ug5B17T3y3kKxQExX4JOayUMRgR2a64enaeYAp3dv0y007w3UpP2as7nRKx49FiS3t+EEQpIzUCJl4HiQhBxOtOfiAedms67chlLt2sGgB/22O22BaO0+suzUjJy2Fcka9z/4wbcrA0TG8f9hy5AQkzGCQXJnoD+PFiTmv1BeOZsGirKQ8wZAqvsNUzqvCWSM2qOJcAIOPlStVI+SJ3ns8ToFamWgNaFZEhQ/dkLl8EqKw7s5H6W7WGRh1gMPSmonaS90USbMdaVn+2tzX1BsUhDpNwaiObxEhEIXpsJhqFnaZK57Gd/6PMi07lGHc6FRHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iffvyjG6tA622hD79Q1t/g9sqjsxD4ekfSLnY/n5LZs=;
 b=yPJU0d+tAVUjMYqr3ORkFBev4nEODYnI8YGX23/xTrAlmQOBwiu5EMbXkNlaOT217NzbThTunORO5gnHSCVvpNZ2354qcXw6tFI70nNdbnS4LOYYFzrhWGHZAlOcuwi7xwlJ64USPVb8DnBD38//XUwITmCcboWCxRoFz6c5TKQ8d22FanJvtI0sVnVRg8S5M1iurioObgejYSAnOhHz4HWnT4XRtiV9+Drg5OwkqHhQdS2lfMOjN9ot9bdI2zAFzv4D1kJNkYmGCEE7pRYdS2fw2a90Ea8Kb5Q8aBAKj06DK+xwDrn9Y1EWEkfM5QWdHMVOQ04vxjCHkBM+xmPyhg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iffvyjG6tA622hD79Q1t/g9sqjsxD4ekfSLnY/n5LZs=;
 b=WtwnaD1B686a/9+cRz0t6t0HBjWRq1RgW7QtAW6cO0kepZsKq6eONvXZDN09q/lE6mWl6nbzDLgi2C/pFvetVElh1s7TG69ovWNwDtOz0rLlBu7WKBLN/Y5ye9zgUdVaSwww1gab1yB0rshc+i6JIMJ+Sck44hsplL+K3eSyTYJQlQa/mXjloWkz32ac488VuwO9AeadWOc7Cx4RHk7puawnV1lA6urN80ch/3X94yRQ5+czwl7dfJO6Qt0KGm2XTeRNDlpSvTrZ9O0/ofIYccu0WBpG+G9hZd6GiyJJXNHHsuYX5pGjgLtxLInn2MbA1HRMXenLqEmRez1LRUTPHA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8254.eurprd04.prod.outlook.com (2603:10a6:102:1cd::24)
 by GVXPR04MB10729.eurprd04.prod.outlook.com (2603:10a6:150:226::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.32; Wed, 30 Oct
 2024 02:44:18 +0000
Received: from PAXPR04MB8254.eurprd04.prod.outlook.com
 ([fe80::2755:55ac:5d6f:4f87]) by PAXPR04MB8254.eurprd04.prod.outlook.com
 ([fe80::2755:55ac:5d6f:4f87%3]) with mapi id 15.20.8093.027; Wed, 30 Oct 2024
 02:44:18 +0000
From: ming.qian@oss.nxp.com
To: linux-media@vger.Kernel.org,
	hverkuil-cisco@xs4all.nl
Cc: laurent.pinchart@ideasonboard.com,
	tfiga@chromium.org,
	ribalda@chromium.org,
	yunkec@google.com,
	xiahong.bao@nxp.com,
	ming.zhou@nxp.com,
	eagle.zhou@nxp.com,
	tao.jiang_2@nxp.com,
	ming.qian@nxp.com
Subject: [PATCH v2 1/3] v4l-utils: Define V4L2_CTRL_TYPE_RECT
Date: Wed, 30 Oct 2024 11:43:05 +0900
Message-ID: <20241030024307.1114787-2-ming.qian@oss.nxp.com>
X-Mailer: git-send-email 2.43.0-rc1
In-Reply-To: <20241030024307.1114787-1-ming.qian@oss.nxp.com>
References: <20241030024307.1114787-1-ming.qian@oss.nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR04CA0172.apcprd04.prod.outlook.com (2603:1096:4::34)
 To PAXPR04MB8254.eurprd04.prod.outlook.com (2603:10a6:102:1cd::24)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8254:EE_|GVXPR04MB10729:EE_
X-MS-Office365-Filtering-Correlation-Id: 514b9e16-0512-4e6f-126b-08dcf88cc052
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|52116014|376014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
 =?us-ascii?Q?HJ/Nigi8uvlpKdhU/TQwvvXi7eGXy3oecW7133NriVjk5KoNp5QBmuuanG2O?=
 =?us-ascii?Q?rDArGXD7mmfx84jYTlZVa1kPpsVV2N+SLRGmPBDm+5mASqJjzK1TjKV7mkY6?=
 =?us-ascii?Q?DuTH2gIutbITTTtRnYPD+L2g9cIUdC4E4sTpu8H6Mw4HfdcdzG58d6pKL+wE?=
 =?us-ascii?Q?0PL9Lawf0gb7EaYM7CflS5TVw7WSK5ieJG+/q6ZL3sYwvA3/MIN63V7uy+EN?=
 =?us-ascii?Q?5suSachTP3+WMPrr8WYfnF4ywslQ7mKOjO8t6XRllavStt2FiVAcOWCvnjoz?=
 =?us-ascii?Q?X4Qsa0VkzGS6R0EXLivIb/VbBNpn0/QLmjByqGhAxm3Peo02/254PvIqmYRW?=
 =?us-ascii?Q?BOtK/nTOCMAz+moVgSk7xuJqZ+PeFkv7/oS9JdRllKrPDXCIYfxdDt4k6dOw?=
 =?us-ascii?Q?rJtScnZYsiLOUeR167/Y/wK5LewlxbSAocxBind95NVUDsTjrlEh2XNnxC2A?=
 =?us-ascii?Q?gD5siq3NzqPbx7si6DAoP5K92SIGBjBCYz+51aNY3k/Q8QBP0N+UystpKaR0?=
 =?us-ascii?Q?TaNE2afU+H4V79V2XeS84FEG7o/MefLG+9ilRD3wjBVXExDBhEQXlGrSUvOV?=
 =?us-ascii?Q?Iaz5Ar+FYZGKhkuw8t4w8e/rWfTiPqshrZdDtIHeWMuBEwy1blWV29SO2tQN?=
 =?us-ascii?Q?cvocPwGAlnSdTMRM9RzL5LEtEVHIakh4OvR0AzBwEwoQQxsabWEssTho863+?=
 =?us-ascii?Q?KlWC2IZU5aaNWbcSjNS8QfWcFJHhb1mb112dGKQbImdGoHF+YQ4u6+FoquJ8?=
 =?us-ascii?Q?Ww2htjtNLenQ1DP6DOPHPeBfFMVTsq1bieMSD1zeBKw2FYD2jNyIHISCze9k?=
 =?us-ascii?Q?nBr2f+H9IW2GNJ16SnlPrqcsLL7HPsoNo5upBQ8sHoWwufMx9yQ31eSkxu9E?=
 =?us-ascii?Q?G73Z4a5EWccSPDZO3ZaoDvR7XD1kZ3LWHx3IsGX54hTjsmzBhMjQUZCHCAU1?=
 =?us-ascii?Q?8a8tRXpS9Ct3auj2dHTThNcQpHEEn1DjrMtyKKwnHhAo7ycLQZMtlV/z6X77?=
 =?us-ascii?Q?NoBFeX06xypzX95lZ6VsTcoMUcDExuE9JgTGwtQCo9D1BsYETRWb3Dl8AuQC?=
 =?us-ascii?Q?t0UzCAp0LvcjZ0Q5IdBCn76aq+Gr2iVJe45TwGkF/eaclFCdA6KppambZtNi?=
 =?us-ascii?Q?iVTY58uavCkW+Vh8jY3rqX2bEZvtq3lsat3jpgmp+ReY3RKYXwF1Agy0BCID?=
 =?us-ascii?Q?uVV8CLmvccTcJuGklRLRzmG3FPMLu8IjPrkkh1sLdezhznZlFFBUbFA5oOKj?=
 =?us-ascii?Q?vE6OJHRZT+Eg37OcJbx69FZK7MqsIyprS/sPL6qILRPgIZi7ffTktaHnwhOq?=
 =?us-ascii?Q?EHITLrwj+I46ign8Z1uREVl9Y4mSWp7sEyekrSllLatV8W1TW7tOsScUX7jm?=
 =?us-ascii?Q?up/t4aU=3D?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8254.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?zZm8YRqEtC0u/qHde4PpGv62wy0UA0uWAm8zkgbfu/BCPOXDuPR/Vhnm0TES?=
 =?us-ascii?Q?KqFZtzoRouMURLepQvVoNUZTIVE0mubs7TiotY8iWuuMsg2BNB/tSzGpXji9?=
 =?us-ascii?Q?ABAS4IDaKUD/vlYTXbnr+Smgf5s0+VAE4mXXGEg4ylcxoMHfbSZMTyRZh5C5?=
 =?us-ascii?Q?mokSBUNjFUUQMkIp45iaGBG+iTEBT81/nGreK8CKywuCaLHZ6BrP4YoNO89d?=
 =?us-ascii?Q?d0ind+Ev7aPeT8ion81ibSZr/S5qBiElTtij/s2CMLBb/FTurREYCmnkXYWp?=
 =?us-ascii?Q?tqVtUz/AlNE/BLPmZH2yxqvyaNaKZ6JzfZZyGN/TX0qJJe4b9AzrDMYYKi0+?=
 =?us-ascii?Q?JnG0YLhK7gxkbCN8rajef5iyaCrfpl64lQDR/r3Mn7XyloK/bL19Vz08/MzH?=
 =?us-ascii?Q?mj5Qs+Ugucz+xSrsoosejM6wR4Rt3cGf6SemeZCzwBKcJc9YZMlgxBOL73pg?=
 =?us-ascii?Q?vTwhmM5+Enj3FL+oXnJmTnHVd391pc9M9/aZr3Bh02sDDNP/I9ZslFlwl+Nb?=
 =?us-ascii?Q?BP+eoMtXVsDuMOuMnikAzd7C3425jnEMNcR4FiT+Xc+YmerWvo4YnUTBpeb9?=
 =?us-ascii?Q?G43uq57hO2nXEprvK4JKd+TwxVo7VUdTkpVskUQsbPLytTrj7DEvXS7eCBVc?=
 =?us-ascii?Q?ta4FxxOnK0/Pb2LJT81XdjwRhlBC0HITbbdERklFkSfqZqtl9vTap/8wBC4l?=
 =?us-ascii?Q?CWuOtsBF6WqEQUPP9lR0nutgmkKYkfDgUJGDIgQFGOjSD09IvAsJ6zu7nJTd?=
 =?us-ascii?Q?1OyIcejnGabt/UTUSuOhamjb2zQH8dD1fD9ipG6CO0dpsZr98Y6kW4eY7F7C?=
 =?us-ascii?Q?/WoqPpl4gjwB44i6oWLufKR7I1sLnckNVFVVUngN0UyNiovYb/5aW+0hTfLT?=
 =?us-ascii?Q?JiBeS8/tCWHXLolJJBPw3yKrtIABG12Y1STZEbeYXhqZaba7UwRLej3VYq9l?=
 =?us-ascii?Q?TXYV34wGb5UHLcsb7PDBwWNmNqdfqmcZUGOJ4xR9f8W3sqwbaqbfxH3LH7Ym?=
 =?us-ascii?Q?9+i+PKFdnm9ENOcNl/fyNWV7i9ZZbLB/9rGbo4SXdmOb7Fqb7Wlg4J9ZxU7W?=
 =?us-ascii?Q?E21OHYRexR4sU9uwrgxwZjP/jdGXBReequ6Fe+bFiTXG5qpja4ig+lsFqE8y?=
 =?us-ascii?Q?yPuoeo1DEhYm7ljV5sdkh9AetgQhtVY5r5gBLzZRovHvAwQFOTjurWTDnqGI?=
 =?us-ascii?Q?dNylt9SUU2VMyK58YwFNq4WYdJUudAYmWNyZP0Gn6SxPsLVdkRtWZ8vnpPjq?=
 =?us-ascii?Q?qzLmm2q2K/JU+H+PqaxLCreBtzei2ocYfMQwe+WwZ80BcR7aFMO2a8HuXwm1?=
 =?us-ascii?Q?mdOjvEOzxnnpZRHpGgsP2oFctAaNYlFEwGeFBpSmy6rgsSRtJMOnWVB5hOMC?=
 =?us-ascii?Q?3LXKwjLSqecnR28e6rIfXocoYKUeUsimMcaGJwkWiNsYp5zhkdUt3/V6JWmR?=
 =?us-ascii?Q?n2mYD7SpOCc8AKbhwiSUfqTwsfwf5qL1np6lD1qdWn/jSwWJzjd8U5c3+kXL?=
 =?us-ascii?Q?bNiAWwBU+sKeJDxg4jz1R5TXFo1jSityHR30I0znxhOzs3sESl52blcjVA9y?=
 =?us-ascii?Q?25yJMScb8c/mXs7eiABqn+z7w6YpEBCqeoy25aCN?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 514b9e16-0512-4e6f-126b-08dcf88cc052
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8254.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Oct 2024 02:44:18.8228
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 35d88eAwjuK3byGCAjAi7WpIR4f17EAvG8UPJHuBcQScOYuCh4MczkFOQ/SWPqL/hFLmQVnMvmGuWl+G+tYuxw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB10729

From: Ming Qian <ming.qian@oss.nxp.com>

Define V4L2_CTRL_TYPE_RECT and V4L2_CTRL_WHICH_MIN/MAX_VAL
in videodev2.h
This is a temporary patch

Signed-off-by: Ming Qian <ming.qian@oss.nxp.com>
---
 include/linux/videodev2.h | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/include/linux/videodev2.h b/include/linux/videodev2.h
index 23db72afdf60..6aae7e10e90c 100644
--- a/include/linux/videodev2.h
+++ b/include/linux/videodev2.h
@@ -1816,6 +1816,7 @@ struct v4l2_ext_control {
 		struct v4l2_ctrl_av1_film_grain *p_av1_film_grain;
 		struct v4l2_ctrl_hdr10_cll_info *p_hdr10_cll_info;
 		struct v4l2_ctrl_hdr10_mastering_display *p_hdr10_mastering_display;
+		struct v4l2_rect *p_rect;
 		void *ptr;
 	} __attribute__ ((packed));
 } __attribute__ ((packed));
@@ -1840,6 +1841,8 @@ struct v4l2_ext_controls {
 #define V4L2_CTRL_WHICH_CUR_VAL   0
 #define V4L2_CTRL_WHICH_DEF_VAL   0x0f000000
 #define V4L2_CTRL_WHICH_REQUEST_VAL 0x0f010000
+#define V4L2_CTRL_WHICH_MIN_VAL   0x0f020000
+#define V4L2_CTRL_WHICH_MAX_VAL   0x0f030000
 
 enum v4l2_ctrl_type {
 	V4L2_CTRL_TYPE_INTEGER	     = 1,
@@ -1858,6 +1861,7 @@ enum v4l2_ctrl_type {
 	V4L2_CTRL_TYPE_U16	     = 0x0101,
 	V4L2_CTRL_TYPE_U32	     = 0x0102,
 	V4L2_CTRL_TYPE_AREA          = 0x0106,
+	V4L2_CTRL_TYPE_RECT	     = 0x0107,
 
 	V4L2_CTRL_TYPE_HDR10_CLL_INFO		= 0x0110,
 	V4L2_CTRL_TYPE_HDR10_MASTERING_DISPLAY	= 0x0111,
@@ -1946,6 +1950,7 @@ struct v4l2_querymenu {
 #define V4L2_CTRL_FLAG_EXECUTE_ON_WRITE	0x0200
 #define V4L2_CTRL_FLAG_MODIFY_LAYOUT	0x0400
 #define V4L2_CTRL_FLAG_DYNAMIC_ARRAY	0x0800
+#define V4L2_CTRL_FLAG_HAS_WHICH_MIN_MAX 0x1000
 
 /*  Query flags, to be ORed with the control ID */
 #define V4L2_CTRL_FLAG_NEXT_CTRL	0x80000000
-- 
2.43.0-rc1


