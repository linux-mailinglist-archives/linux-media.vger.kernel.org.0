Return-Path: <linux-media+bounces-25483-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D6A0A240C4
	for <lists+linux-media@lfdr.de>; Fri, 31 Jan 2025 17:39:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 27F971624D6
	for <lists+linux-media@lfdr.de>; Fri, 31 Jan 2025 16:37:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D83DD1F4E58;
	Fri, 31 Jan 2025 16:34:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="vsaYsWGK"
X-Original-To: linux-media@vger.kernel.org
Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013016.outbound.protection.outlook.com [40.107.159.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7B041F428A;
	Fri, 31 Jan 2025 16:34:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.16
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738341289; cv=fail; b=ega1jEnV9q1dcOfvS7G5HkpYrgFOOImdgh8TgV5Ur8x5z/DIFDNQGqNt4282/zMfnOVVfBKH7HzNOnaAB4jmPxpFuuAbG55NaHmucwtYMePxmPrRIHlOBfaIuXibuxZX+5t7HXJCWUt9ip8Y2TJCN97r/acPFUe81Q0E+GPCCT4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738341289; c=relaxed/simple;
	bh=kjXGl1nboS1KtVQgnxjQt6+VIXXS57CWAoVkg70RZvY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=uEl6nHzB/TRulZXIdovE8E6BrxmxEdYX4k1ZdBMJ1Ems8gi3xi/vCUwAMsPJUS7xhjTeIPoQuNCLcGjLPBYICWc7c0a9eSfCy4pw1IzojLNDoY6Bb7ikd4jm6zT4vqD1VVBabmZ1EYH3vxJyc0Kqw+pSTpX1kTJrReHWkEfaQtQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=vsaYsWGK; arc=fail smtp.client-ip=40.107.159.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bWhQRi6bJ483hg4qqrtXiLGlLkwCx5KMhyvh3pqbdj5u/q5AchxPmJQxdPgBUNi3cavcJPfNCGZcT86LGJANExCbyAzwALm6yNec/ZNv3NCUMf0qgTuCGwxe++0BwjK9JhzXcODuk+Q+muRnWDnyA9qZMcbZiwoObo4EMaASmENJtR+3+MkUvLdPY5kjRtdBU4fNup9Jdj7bGzLca07yzMIztVvaSeFS59BVPTXeC3gCnaV5Flwep+G9k4DShE0ZsucWIJ7aRsucz682DsCTl+w1FIaLJA7AgOamp5R49rcIAwU5s4T87tiWuaQ7b/1KBq2yyQSkmLhuwkwZB80PUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dRMEfm/Uz738s147ZR674pJ4A6gFH768PVVCAC1MqNs=;
 b=LuQesP79JTSUrrEawVqnz0yqKEIjJhe+ORcjdJBYnSQ+EkiMvzugQgd/sbOuWfX28V2B1Ampzb34ytuiizDIC1eqGgpUJxcW/lkSbReuYHRQLpkpxay68l+ko3M099FmZ5zIojwSneCLNMK24wTXWKsqFE9rybcWnKv9dRi2AeskToxXa+sFTyiDRt0Xj6ir/hkBCrdQnc8mnXmpihn6DvwJ1Oz+CCrZw8s7x4BV02X8NL0zRgSHn5tjz2eN1xA+U+0Rrj4s77aMAnFofnOkEZntk7/LLWt1TlW/eI+iPZ8dKFw5l/g4XP07w9jh2KptwppYHr3ryPT8S4enwOLJ+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dRMEfm/Uz738s147ZR674pJ4A6gFH768PVVCAC1MqNs=;
 b=vsaYsWGKSad1wpZGfvgehGJiGc2+gS0tE1RxIXwUoJoBYzJf2B++7oR3TawY9lvCKtwGwoL4gzVWELiC7jmRvwvFtcld7QxTTcDR+Q/QVnpC6U60WUO/x2anbsu1axzPRLWQpZzDRX6nKOdOVgVCPmG9orMtZgPPQMGVrz/aPYsW1DGVyD8BaibdISikEe61vZXrswj8YaspEPKeuUD4WGhERFfYDcsxWtdJzg7CB7MjQZywI0c+MoaikTXsaDOBgTMC/X0pkwuAchjSHgMg+uis58B4LKpaLMIcMfD6PS2o6BWCSwKils3nTJa/2mCkBeT94mNrl1woxzQMNRmAVw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AS4PR04MB9576.eurprd04.prod.outlook.com (2603:10a6:20b:4fe::12)
 by AS8PR04MB8529.eurprd04.prod.outlook.com (2603:10a6:20b:420::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.20; Fri, 31 Jan
 2025 16:34:40 +0000
Received: from AS4PR04MB9576.eurprd04.prod.outlook.com
 ([fe80::9cf2:8eae:c3d1:2f30]) by AS4PR04MB9576.eurprd04.prod.outlook.com
 ([fe80::9cf2:8eae:c3d1:2f30%6]) with mapi id 15.20.8398.017; Fri, 31 Jan 2025
 16:34:40 +0000
From: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
To: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: [RFC 06/12] staging: media: max96712: add I2C mux support
Date: Fri, 31 Jan 2025 18:34:00 +0200
Message-Id: <20250131163408.2019144-7-laurentiu.palcu@oss.nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250131163408.2019144-1-laurentiu.palcu@oss.nxp.com>
References: <20250131163408.2019144-1-laurentiu.palcu@oss.nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: AM0PR08CA0024.eurprd08.prod.outlook.com
 (2603:10a6:208:d2::37) To AS4PR04MB9576.eurprd04.prod.outlook.com
 (2603:10a6:20b:4fe::12)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS4PR04MB9576:EE_|AS8PR04MB8529:EE_
X-MS-Office365-Filtering-Correlation-Id: 623466d2-61e4-42f5-a8be-08dd421528bb
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?pt1OBMsBJuv4+3C0oxfciD8KuTKGy9609CJy7mpwJ44lrV/R051262BcjtyD?=
 =?us-ascii?Q?BIcEGmqBWILUBacb1T2K4CxDrK9MF93lhQaKi6QB5nWcDlttaeJvOEIkLuvs?=
 =?us-ascii?Q?p9GK3OnDeW5+tQn7IJgmx9XniVHdxLnqLbK9qz8ljqXxzFX0Xp3fDoll3G9L?=
 =?us-ascii?Q?Uh/gyeHds/4mfRphETyxzk+g4oh8uFFojHGw4wlJaHleXgZFj7IrIlqV9He7?=
 =?us-ascii?Q?bjzeX91+QejzY/9M/JIaLPxDnm99rtYHou7h4Lx5zBjJXa6l7CyU7XzEAXos?=
 =?us-ascii?Q?VcborsActxoYCfy21uV+ixMXXrMV5lIYQC4vhWpgWPPS9GSGrM7+fxi6tdkA?=
 =?us-ascii?Q?UIPUpWsvmHe5/NlFZYfD2c4GIb2sOe9YfgcEqpArn8rMp4AdVs4bR4JBRO3F?=
 =?us-ascii?Q?CU3CkQy+Bw4RieCY6bn5XUQer0QjQFVk0c6Inm2zOFdd+qpcu9MVuLQY6+cp?=
 =?us-ascii?Q?L3FL+RRX3M0x6dlixNhlHCia6GbBw3Ds7dnp35J6j90E8hMrwQjkfgsl+inw?=
 =?us-ascii?Q?wYrFEuV09uQvDq19p1+EJ9sDavGVYTNGKkScuhPiYcIMYpgG+8S7XhVB3CS1?=
 =?us-ascii?Q?S3Wv6fSLAdD73M8B3AJCLyypY4IsrLFVDvmAVzIPWpqRcvFUluVM1NB6UOgr?=
 =?us-ascii?Q?ydUbGg3TSKDQIJsHDtC1HXC1WntAt+eKCf3MgfWxAN+hvwZ+zNQ8s65gjBxv?=
 =?us-ascii?Q?eKeV1IXjFaXmzxeY9nV6kYHYqQmA68U2/ZSJf1gsdPUgxNs6coGNdzvuwECS?=
 =?us-ascii?Q?APY18uRzMOjM4QeZakKg9LqRYZPtDLK6UUQV8H+VtBMzKhVqPwvS+iXzhaHM?=
 =?us-ascii?Q?rApj2lVtX/7XOd8Hy/H19g2ltFEf8YLl41G00lmwCMCyuB8lDC8EJsmIyWCI?=
 =?us-ascii?Q?qkp06g0PjkUu8YJV4yGVVQY3V5oNhVPNHA3kYtbWVHpZqwdf8nZgmwGwmGIg?=
 =?us-ascii?Q?5aXSMkzyitOU2t3aQUU5K7QF9dtK+H20Gtjd5W9bRVIEn2Bj8XibYGqd1xUV?=
 =?us-ascii?Q?DcjevpNOpQGdezbfOFzyMQGkWXaNNucpod/f+M5BH26r6oHu/Z+XeSFkmLUX?=
 =?us-ascii?Q?EGkMhQQc7qfDu2Nx6QVeJXmGfHORUieGYGVlI0TY/mCXrIL3K8tb+UG3WJMD?=
 =?us-ascii?Q?a7+qRi9eJA6tCMRIyMWDHgwSywuQvKz7iGLg0jJf7koE2exIuE46xL9sOGht?=
 =?us-ascii?Q?mroj241vLli5GAvCuLDqteKouu04HQTrniJn3mC1Gt1DUbyiCPUEpKvoXHa0?=
 =?us-ascii?Q?4dGhYNY/RA5Omy6L+gjyKzbTbPWpxrJIm++xVUMINpxfYhyTz16egPeZ4N3D?=
 =?us-ascii?Q?210pvW01rvhGhnVVsqUYkKlEmZSdB8mHQvyGnRnfK4hWaCyJEn+dcbKa09CL?=
 =?us-ascii?Q?9G+L4Wzn258ztobHQBwmDLD4t0sM?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4PR04MB9576.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?8gsEwgaobpZCCLmj1xFD2+ZIKuOGcj3heOl9N3jUwEC2/LRRiexIttknPkaX?=
 =?us-ascii?Q?kOm7ZBkdDX+iX6mGBvJcj7dcr9/hCv3aHhdCteXEDMiS7sk/Utdi6/8A8X23?=
 =?us-ascii?Q?/2s/Ucwwm6B5jwTcTol3icRojF7f0sJpDITYZBOCP9QozRfwsBV34gYtNOYj?=
 =?us-ascii?Q?q6MVzI0PUhmADXn4jaLi2KjpPIPehWNbSfGTBfT+1YhivQzX9aO0hElPleBa?=
 =?us-ascii?Q?uMDXJRMHQDC4RANZvgg2xlN3oDvqF+04B1W0moBoPwSW9Nx24OWJXIaJ15YT?=
 =?us-ascii?Q?prqZVFR4/oo2ZNWq2h3LnHq8uL+Xqp4BLes5aXsm2QjhCMN4rAfQYNoWrTCW?=
 =?us-ascii?Q?2rdiROjrXqFI9W+Zta0UpU6BSRT0gBDEopw/3AdKuY2xv97YAubJSLOL5hiZ?=
 =?us-ascii?Q?nVXSKJhQ+i0hsw/TxxfBWeRq9ageu4vgi6j53wWSit5MLdIL5vs1RLLs7+zH?=
 =?us-ascii?Q?ZgjEtgnuSSYNj52MZ4gBtR/dzkPCJ6VO1td0xUOG45mQbUwew5lcbW4kre4t?=
 =?us-ascii?Q?Uq8zlGOiDUtyoDQ5DuudJoEn6BHwSewmZgOHsPKoN/G2H5yFdJShIzxZTenz?=
 =?us-ascii?Q?gCGSch02ITqa3oJROYsu3VR6IJIUlISd5x/UrslBMPgrSS72H6KWV/MYDZnr?=
 =?us-ascii?Q?jjOK9lqB1Y2h5NnZjwn9ifvPxz4hoHCw6o9kVn/558tS6IvUsRA1ayXf2K6E?=
 =?us-ascii?Q?hUR8h90D7UljU30bNQhvTXNGBuDoyJ/I5gYwkPpMTuSygPD2PBK7H+dYubDr?=
 =?us-ascii?Q?UGId7s2tGpBXuYbaIOibWURGiLgGYNS8G25dEhbet3N1cGtWWzH5dRwJqAbm?=
 =?us-ascii?Q?1KP/qNWR5K6XEHyen0J0LzrDanh95W/Zwm/OiX2jUrQiIf4tEmgXntWpv0lO?=
 =?us-ascii?Q?1Pl8Oyk1TF2I+qqlCFX57BjW9Hs1J9nOQeS8+N3YtCGIHcTiuLjdCrw/Q/7z?=
 =?us-ascii?Q?ApkWxVSXFkdX5fvu9G2gk2WXvb5okyFIR8Jj/0bjsApnm0pj/9SZWuzie0hR?=
 =?us-ascii?Q?oS5aykcrEnZ4TcqWNMwcsrl8KzbR6AsEU322duzjFsblKA0vFSPO5MwH+wLq?=
 =?us-ascii?Q?DvMylS+QiC3bzs6ZjmGessjHAyARCzZ+Ns6Kkxi74dbOJ0Ytk+7+mEaBWPHQ?=
 =?us-ascii?Q?9Z/ab+cgzwQdh9X0NNTU3qOlIwP5x8W2eXcEiaEp+tcLUtCmzMyWdxjdj1ae?=
 =?us-ascii?Q?MkZG/mBpzMbZL2YaxnrG0I8sdGqd6tQWJ6UTS/UommxUUsJr9HN/0ON3hEdY?=
 =?us-ascii?Q?UcNHyfxZqlNQghUl2IO0PWjKaqtu/65SZAm3BQGQ2lidMBDMF2Nz6+kaJOO7?=
 =?us-ascii?Q?cDrjE5a2fl8F1lMJwhxZzCMiC8V7WT8mKeqNpswQh1yr1K+VXTQu98FB1Zau?=
 =?us-ascii?Q?HahYmbmbaFqwfA2j95RKIQ5OizEw6zDqck4DQOV437d3HZ2HK6kyfHY8g6Ax?=
 =?us-ascii?Q?OWyf8KLXXcxP78tsR2BcGRvjEFCHGjy4yHxjGs3/IXZUF3Cq/F/HLpBowua/?=
 =?us-ascii?Q?K9mcPaSyXx8nOCjLTlb3rkFyCwjqtyVuGRKhbN0ZycLybBoF1yyH3OBUeruf?=
 =?us-ascii?Q?3VNsc+0+Lwu9KY7QmyoTiAZspQUZ5QEc/mpR3PEJUjerlgwDqA7F2HmegUSu?=
 =?us-ascii?Q?lw=3D=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 623466d2-61e4-42f5-a8be-08dd421528bb
X-MS-Exchange-CrossTenant-AuthSource: AS4PR04MB9576.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jan 2025 16:34:40.3276
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +mMa+WIQztTbTbaUU50Odbvjt1jaIREQe2ISS5iDo3tiVhcH+CicEG/r4uX9J3UFQyxgnEfpKKbOOm5zdJyc0Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8529

The deserializer chip allows communicating with remote serializers over
an I2C control channel within the GMSL link. However, to avoid address
collisions, we need to enable only the I2C CC corresponding to a
certain GMSL link and disable the other ones. Hence, add support for
I2C multiplexer which will allow us to do just that.

Signed-off-by: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
---
 drivers/staging/media/max96712/max96712.c | 76 ++++++++++++++++++++++-
 1 file changed, 75 insertions(+), 1 deletion(-)

diff --git a/drivers/staging/media/max96712/max96712.c b/drivers/staging/media/max96712/max96712.c
index 546660e4b3d1e..f68a1d241b846 100644
--- a/drivers/staging/media/max96712/max96712.c
+++ b/drivers/staging/media/max96712/max96712.c
@@ -8,6 +8,7 @@
 
 #include <linux/delay.h>
 #include <linux/i2c.h>
+#include <linux/i2c-mux.h>
 #include <linux/module.h>
 #include <linux/of_graph.h>
 #include <linux/regmap.h>
@@ -17,6 +18,17 @@
 #include <media/v4l2-fwnode.h>
 #include <media/v4l2-subdev.h>
 
+/* DEV */
+#define MAX96712_DEV_REG3				CCI_REG8(0x0003)
+#define   DIS_REM_CC_A_MASK				GENMASK(1, 0)
+#define   DIS_REM_CC_A_SHIFT				0
+#define   DIS_REM_CC_B_MASK				GENMASK(3, 2)
+#define   DIS_REM_CC_B_SHIFT				2
+#define   DIS_REM_CC_C_MASK				GENMASK(5, 4)
+#define   DIS_REM_CC_C_SHIFT				4
+#define   DIS_REM_CC_D_MASK				GENMASK(7, 6)
+#define   DIS_REM_CC_D_SHIFT				6
+
 /* TOP_CTRL */
 #define MAX96712_DEBUG_EXTRA_REG			CCI_REG8(0x0009)
 #define   DEBUG_EXTRA_PCLK_25MHZ			0x00
@@ -162,6 +174,9 @@ struct max96712_priv {
 	struct regmap *regmap;
 	struct gpio_desc *gpiod_pwdn;
 
+	struct i2c_mux_core *mux;
+	int mux_chan;
+
 	const struct max96712_info *info;
 
 	bool cphy;
@@ -489,6 +504,61 @@ static int max96712_v4l2_register(struct max96712_priv *priv)
 	return ret;
 }
 
+static int max96712_i2c_mux_select(struct i2c_mux_core *muxc, u32 chan)
+{
+	struct max96712_priv *priv = i2c_mux_priv(muxc);
+	u8 val = 0xff;
+
+	if (priv->mux_chan == chan)
+		return 0;
+
+	val &= ~(0x3 << (chan * 2));
+	val |= 0x2 << (chan * 2);
+	max96712_write(priv, MAX96712_DEV_REG3, val);
+
+	priv->mux_chan = chan;
+
+	return 0;
+}
+
+static int max96712_i2c_init(struct max96712_priv *priv)
+{
+	int link;
+	int ret;
+
+	if (!i2c_check_functionality(priv->client->adapter, I2C_FUNC_SMBUS_WRITE_BYTE_DATA))
+		return -ENODEV;
+
+	priv->mux_chan = -1;
+
+	priv->mux = i2c_mux_alloc(priv->client->adapter, &priv->client->dev,
+				  priv->n_rx_ports, 0, I2C_MUX_LOCKED,
+				  max96712_i2c_mux_select, NULL);
+	if (!priv->mux) {
+		dev_err(&priv->client->dev, "Could not alloc I2C multiplexer.\n");
+		return -ENOMEM;
+	}
+
+	priv->mux->priv = priv;
+
+	for (link = 0; link < MAX96712_MAX_RX_PORTS; link++) {
+		if (!(priv->rx_port_mask & BIT(link)))
+			continue;
+
+		ret = i2c_mux_add_adapter(priv->mux, 0, link);
+		if (ret < 0) {
+			dev_err(&priv->client->dev, "Could not add I2C mux adapter.\n");
+			goto error;
+		}
+	}
+
+	return 0;
+
+error:
+	i2c_mux_del_adapters(priv->mux);
+	return ret;
+}
+
 static int max96712_parse_rx_ports(struct max96712_priv *priv, struct device_node *node,
 				   struct of_endpoint *ep)
 {
@@ -665,7 +735,11 @@ static int max96712_probe(struct i2c_client *client)
 
 	max96712_mipi_configure(priv);
 
-	return max96712_v4l2_register(priv);
+	ret = max96712_v4l2_register(priv);
+	if (ret)
+		return ret;
+
+	return max96712_i2c_init(priv);
 }
 
 static void max96712_remove(struct i2c_client *client)
-- 
2.44.1


