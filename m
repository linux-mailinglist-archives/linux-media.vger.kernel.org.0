Return-Path: <linux-media+bounces-42867-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B49DB8EF1F
	for <lists+linux-media@lfdr.de>; Mon, 22 Sep 2025 06:37:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2519C173A26
	for <lists+linux-media@lfdr.de>; Mon, 22 Sep 2025 04:37:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 82BD721D3F5;
	Mon, 22 Sep 2025 04:36:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chipsnmedia.com header.i=@chipsnmedia.com header.b="HFGSFvDh"
X-Original-To: linux-media@vger.kernel.org
Received: from SLXP216CU001.outbound.protection.outlook.com (mail-koreacentralazon11021114.outbound.protection.outlook.com [40.107.42.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 231FBE552;
	Mon, 22 Sep 2025 04:36:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.42.114
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758515807; cv=fail; b=B6uB7l+qiI1Hsj401rzgp4c5ScSimoXxNC8ZEHPc/Z/674KIdALh7fbI8sTXCDL8XtGNpjx0eqT8ukbL41WsAkiMLT3p+sPmR3Rvyxd9ARuKQT9O8YWPOV7vmls5QkBTY3l4Ogb2NZB3D+lJktQhIFyc2tpnruNxhSohZJ4fh9c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758515807; c=relaxed/simple;
	bh=DDqzzJQcdmvt7hdqJLKNMugxACEazlj5vHole3Fet2Y=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=fTVsNOyptiCOoDghqcvHhVsqQPJmmrrkCPy72ASUdp8zuzpKGEMmqIEBwq4ADsQgCzPQmERyBzKvx9AShCJNzwmET3MxukMFEvdX5gYUMpTzNhnv64kSItjEJzfOXECImXDD5iMBPUSHwu1xAPsqYuc9AiyFHUSNsZpRYyMnyEo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=chipsnmedia.com; spf=fail smtp.mailfrom=chipsnmedia.com; dkim=pass (1024-bit key) header.d=chipsnmedia.com header.i=@chipsnmedia.com header.b=HFGSFvDh; arc=fail smtp.client-ip=40.107.42.114
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=chipsnmedia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=chipsnmedia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=h6eCrLaevHu8ptL2bE9VqVO+nvQZrFJQB3oLVq4wVOiY+Q01piYnFMPRvavjU3nCudlWqBPmAeiDERVEA4Oq8FaretKphyeOpsu/yVSjuEnX25S9Ck4qJaRGor3aDMRqNBr5Kt62XRw6JZvj+YvEAsP8mk4wM/l/F6iRR/b6nhy92VA+PDdPH1BySFRGpuQuItuWUFHLLO6Tc7p4xXKgGUPsT7V7e6HTNzt9KCk2pFRmWyIq/+NNNsYUE2tWByqsd3oFamYVFOIVdqQ/THlDSb4iJkjrcpHjMEIDtRUgcXNBIEnyjx6kTZTVMqQY5/PvOUxrVxcRvQ/M7jv0sPkedA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XSyIjIl+HSx1NZ2qPb2tDDoSCQYZRtNEqHr8o29sVu4=;
 b=GWoc9jwac//O/Q8FZAmo5EvML5lRGl8dIOvWgX/avwLG2FrLZfVY2TCt9Jqb9ZfLqVDL0g3qpuUEC5dwCgHKDYPKcKzTU4HLR+5ceXyKjU5kFU/1bSz8SEjCxjN8cFVKOY8bBLOqkYlb47Zgg6uWLBWp3uiy8+u6vQMJiM9jAsKgx6SJyie59VrdIKxGwwXu0DmmzDfIMSN4s8Uf87IubMVwOVg352RbPSOCOvpEp/OnzAH/aYkfq9xF3S0CICexh6iXCf4kv/MM8cL0jQ0Azvx3pqSxExYvnZA6GMyfC3IycP8H4KEasP0w/D2FGX+MufOcEFQ65XXJKz9asV9Ozg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=chipsnmedia.com; dmarc=pass action=none
 header.from=chipsnmedia.com; dkim=pass header.d=chipsnmedia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chipsnmedia.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XSyIjIl+HSx1NZ2qPb2tDDoSCQYZRtNEqHr8o29sVu4=;
 b=HFGSFvDhj8Cr5dxlBACQWuWWnjlGYeQAxiQ0OD0dKkwJmCexRJHP4XXAXP0KNsekQ9UCi5LWvj2mEl9/7D1iEXxudXHu5wdMtOPLt/4a2q+RINq9ll2kAchGiGJV6ODWednSg4TO/fnHJ9zePRiu3EqPCEA3QR9DflFd/r66aRs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=chipsnmedia.com;
Received: from PU4P216MB1149.KORP216.PROD.OUTLOOK.COM (2603:1096:301:72::14)
 by SE1P216MB1479.KORP216.PROD.OUTLOOK.COM (2603:1096:101:2a::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.9; Mon, 22 Sep
 2025 04:36:42 +0000
Received: from PU4P216MB1149.KORP216.PROD.OUTLOOK.COM
 ([fe80::689e:6dca:162:dc0d]) by PU4P216MB1149.KORP216.PROD.OUTLOOK.COM
 ([fe80::689e:6dca:162:dc0d%4]) with mapi id 15.20.9137.017; Mon, 22 Sep 2025
 04:36:42 +0000
From: "Jackson.lee" <jackson.lee@chipsnmedia.com>
To: mchehab@kernel.org,
	hverkuil-cisco@xs4all.nl,
	nicolas.dufresne@collabora.com,
	bob.beckett@collabora.com
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	jackson.lee@chipsnmedia.com,
	lafley.kim@chipsnmedia.com,
	b-brnich@ti.com,
	hverkuil@xs4all.nl,
	nas.chung@chipsnmedia.com
Subject: [PATCH v4 2/4] media: chips-media: wave5: Fix Null reference while testing fluster
Date: Mon, 22 Sep 2025 13:36:28 +0900
Message-Id: <20250922043630.74-3-jackson.lee@chipsnmedia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250922043630.74-1-jackson.lee@chipsnmedia.com>
References: <20250922043630.74-1-jackson.lee@chipsnmedia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SEWP216CA0023.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:2b6::18) To PU4P216MB1149.KORP216.PROD.OUTLOOK.COM
 (2603:1096:301:72::14)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PU4P216MB1149:EE_|SE1P216MB1479:EE_
X-MS-Office365-Filtering-Correlation-Id: 840d26b9-1f79-4726-46e8-08ddf991a0a1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?IyBRqusEDwUcqQJSDpK5BuQex0Hd8jm8wCtUNYj+5WQpVoZf3T5Ufl2YNCM6?=
 =?us-ascii?Q?Bopy+R4nbeexk/WxBMxgQpVHEuEiq/ZnluMng0/LK1Y6ktAQeHB7hUHNPUeF?=
 =?us-ascii?Q?ZhiY/f0cJRWaPCCvNjWfc05EY9201pfeJP7OsrdiFc23OV1nXz7CtlVLH5qM?=
 =?us-ascii?Q?0/sPTAj15QT5HdydvsraFOBzOqnWgBuJtGrZ8dHlvLE4jbJ9ezebGjf27odR?=
 =?us-ascii?Q?t16VmxCEMB32+GzAJ1EdGAoobOM7L558XFhjUxw6aghWZEomnGkWhOg1/dFr?=
 =?us-ascii?Q?r6iEUekyoC67hHGLUNOdANgfPNyMZ3iXHsAZadiAj47oezvb5+Z6DXtEZf9Y?=
 =?us-ascii?Q?CT/QepAlyudEBWPVskQ0SrxfeMQdUw7Q+rr3F1tsf74xByGB8uqpm3qcisvK?=
 =?us-ascii?Q?03z7AUB9vsj/Zr5UAdIgX2ZGRn8JYxUDNZ33qalSbjjMViiC+u4JCBNAXLLU?=
 =?us-ascii?Q?V7ussFDYimIkrLwbNwZL7yZJajEuzi/hWzxExUr6giEFyRcI+anNtulc7T/+?=
 =?us-ascii?Q?ErT+mskK/FL67Ex5NW4mltFhWVqOjYELTJ01jH48NRMqMcbVWu4HzuIKn+5V?=
 =?us-ascii?Q?iaEjUYKeFIZLcAGPyHek7obL6BDXrUlLxitAhXr8+gstj7CA/wmjUJO57KiP?=
 =?us-ascii?Q?TTJ2T4gd4n9IgK3EIsZ/IVXD9RkMx4m4UWuab6BM7lvQuQM3AraAU8jnecCJ?=
 =?us-ascii?Q?3ULIuoiEE9kJrCqT1pUSBXVZpxx/lNQX56GONusyLe+Z/mVY6thk2vmyZA++?=
 =?us-ascii?Q?KntkNyYUb9p+60LwBeregownSvjXIJje7ZJba4PoiklC/YlHw340Dyvf6fcx?=
 =?us-ascii?Q?VuOSSVUEY2VG8/3ER0tCR1q3Xy9dCT3MeO4jUJoXPE7prBWldSBl3XMRP+Hh?=
 =?us-ascii?Q?3kup/eofJh1I+3GXHToZZzz7Z2L0I7V8oLFh5/H+6sbBf3+X9xKpG1GMyTJe?=
 =?us-ascii?Q?lCgvjRu66DbZU7uhkN+YGumRczlUB8KEFAj2x4oRAHfMwVsvFFMrl93Xw1uh?=
 =?us-ascii?Q?HQSO4pvjPx+TA5576aXaBdc46nfoKW9cCFloxkcWNg5BeAalwDemzcggNBpX?=
 =?us-ascii?Q?Z4k+Tn9mB27enDKTQKJx1d7y9btb0jVUPFNtPl5736ozC+lvQQ7oP6DoPnwI?=
 =?us-ascii?Q?f76d+WqYCPUn96piEQto8/X0HruuZ5NnrQf4QKTudRyg8AINniwRDF1ItBqv?=
 =?us-ascii?Q?y6+mLs+Mhecqc43CtmT9+XSkboAji5mcTuUHL+yCbvmjotG9PTpiYWKaUN0Y?=
 =?us-ascii?Q?INKwdKevYxHRM1wvDrcw4d10XrkqMDek+9vc0rfFTXe5JBpYDpz89jHBlgoV?=
 =?us-ascii?Q?mexaWoneZmLSdtyF/Umd3wya05LsWb6VL0Snkk6QFD16uWYDYIrE69RVIq44?=
 =?us-ascii?Q?7HBcOn9rm2ll0l0X8Fe2v+jzM5n8p+8GCUV1Gp3knO5cSiJmi4XF+nviR9+x?=
 =?us-ascii?Q?5K7oJACx9Dfs/lI3buP4tCNLcwAfqDHIEa6MrAnb9yP3olul7ozjVw=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PU4P216MB1149.KORP216.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(52116014)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?1jhDlQacUgAVjgUdG7dpaWwyWiTUGjaDOWyRdbqQsgqjb38kC92yYtc6Bp2G?=
 =?us-ascii?Q?/q6y9uXkIf/H4OZnBE59PE/fX+ltQ5eAnBGA7WiDImwyakBEZ+EqTPbBtRPO?=
 =?us-ascii?Q?DH0mXMA6Mw2vP0TXSVtXax2udoqvhrtG5kP6ZceIf6mjNEz10v0fV8FmRfyr?=
 =?us-ascii?Q?0ZVKEg3JkQDJvjNKatjDGns+b+Mo3m62dVV7SPznt6U/vo2R0kHSlKgA7QlL?=
 =?us-ascii?Q?7hpPZsHdFiEAQnpLgqOI2C2dkso7S7BB8QuoqWnw5pRhi7gzN/cTWtRhmoU0?=
 =?us-ascii?Q?93eAAXH2qUzHWHZvK/sURIOqDZIYp2Q1K9EITrNvqpDQzJJ63apGJ5FsiyPf?=
 =?us-ascii?Q?UMofY311TqwVOsq/Bbst4cvKmS9DIx4jaY+rhRRaicQREd56MDzpLP6QBc8a?=
 =?us-ascii?Q?zRSu7EaNerAp6wVbJt/veaqpd8Sn8wEzbHZflQLGeT7JiZex5t36OZjlq6ux?=
 =?us-ascii?Q?kMXPxMm3OvrYhCI2AxrovpDN+y/vwPDWwisnLFl/Bw6aEyo3fTsBp/LrXQc7?=
 =?us-ascii?Q?UtWTkYOzSNQ5KTmQILsJxmu2KDvPL1awSHDAEPRQucFGIfpy66yyNOwGnuYj?=
 =?us-ascii?Q?DFptBoz7tD84muSf2P8i2BA+8FlSM+oP/zCptjkhtf1tgwV+YNrWgKxg7cF7?=
 =?us-ascii?Q?ykwNycJPUFufVBIqbWDqaEg9Ku+3mkmygtfH9V9FQqixQlff4rw2nZZ3pQL3?=
 =?us-ascii?Q?l3jioFuNG5cEIMOxDG00TkqZx2Kxaz0H7q8xxh7pSqR5w7/SFjEAmNiuyBBx?=
 =?us-ascii?Q?kjhjMB5A4Z/1W4i5dhCgKb5vOmN70xF5PIH+WBjUfocnQ4yCtNdbjtIz8KEC?=
 =?us-ascii?Q?ljTqfCab0NPnlFcVL3QJYzBDvKKTZzNkVM9IqFuxWwdBfFE3+G3FLeezcJDG?=
 =?us-ascii?Q?n2nB58ClKtqMWnPnQ8IKcAbGwllt9IprAHjx0zQNSzsqgjP0iq1h9kK392vI?=
 =?us-ascii?Q?cgXZME8fDpP8Ml6AZNsOhL+Umsa07pYsb9i3upL2YDfv8AYuWw4WZbuG2SUZ?=
 =?us-ascii?Q?Pykku0NuA7HLKC28yasxk1uBHF1SrJLkhMB1QxwnQVfC3vNw/W/qylsS8kX+?=
 =?us-ascii?Q?IWjn2Ej2ppQM/tcNS6DG1u+io4B2p4Il/GKXGk8ft9ixk5eVwpe8HwDrHRQy?=
 =?us-ascii?Q?XnxwA88vhsEtRTkdHeWdhp9zsQoSV07x2ucxBoWsueQhpYdkPQISnHZ/3Gi8?=
 =?us-ascii?Q?/xi0D35KO31N1F9bBCLN02JnNR5C74iT2Od5/PZKfPrxA1kh/RtFpdPZS1ZZ?=
 =?us-ascii?Q?YxGEi4OvjlggHIVZZ+1HM+LYFA6OjWzVsP3SNzKrPfBAvzi5neQzL5NaTzY9?=
 =?us-ascii?Q?OsVeL71R+NhYyx4juQBetSJ7tjvh6s0/GjyeIIBHXk/Iys1vXeD0mz+u8VNL?=
 =?us-ascii?Q?k073zbJ1pT5sc5I2jQzium7GBlWB54Bdc63h+8hOu5zoWeZOsI4uHsodRQVT?=
 =?us-ascii?Q?/IXj4hTux9326F3Qh1jzMw/Q1NYYU7EXaZ+FUKcxlbOaWXqsYrrOcjB9Ks4s?=
 =?us-ascii?Q?/rs/8L0oO34Aoe+L+SvrcXo7IeTk7fvB0RLalyuTNsB0ib098uxe2rKJwub8?=
 =?us-ascii?Q?0W3NZWTZ1TdLANhpEzEiqoC+lkmDgC355unI/42qbwGKkOApsTcXakKOhb+J?=
 =?us-ascii?Q?Ig=3D=3D?=
X-OriginatorOrg: chipsnmedia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 840d26b9-1f79-4726-46e8-08ddf991a0a1
X-MS-Exchange-CrossTenant-AuthSource: PU4P216MB1149.KORP216.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Sep 2025 04:36:41.8329
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4d70c8e9-142b-4389-b7f2-fa8a3c68c467
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: arCgBew8rS52J/Ai4CB7RVHdV3yrohs445tLKVe5BeR1P9R4iSlzESZrvdJKr1BqVYTbE0FiGH0xca79RwN6KwvklYPLam3IAH5iPBYH2E4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SE1P216MB1479

From: Jackson Lee <jackson.lee@chipsnmedia.com>

When multi instances are created/destroyed, many interrupts happens
and structures for decoder are removed.
"struct vpu_instance" this structure is shared for all flow in the decoder,
so if the structure is not protected by lock, Null dereference
could happens sometimes.
IRQ Handler was spilt to two phases and Lock was added as well.

Fixes: 9707a6254a8a ("media: chips-media: wave5: Add the v4l2 layer")
Signed-off-by: Jackson Lee <jackson.lee@chipsnmedia.com>
Signed-off-by: Nas Chung <nas.chung@chipsnmedia.com>
---
 .../platform/chips-media/wave5/wave5-helper.c | 28 +++++-
 .../platform/chips-media/wave5/wave5-helper.h |  1 +
 .../chips-media/wave5/wave5-vpu-dec.c         |  5 +
 .../chips-media/wave5/wave5-vpu-enc.c         |  5 +
 .../platform/chips-media/wave5/wave5-vpu.c    | 96 +++++++++++++++++--
 .../platform/chips-media/wave5/wave5-vpuapi.h |  6 ++
 6 files changed, 130 insertions(+), 11 deletions(-)

diff --git a/drivers/media/platform/chips-media/wave5/wave5-helper.c b/drivers/media/platform/chips-media/wave5/wave5-helper.c
index f03ad9c0de22..53a0ac068c2e 100644
--- a/drivers/media/platform/chips-media/wave5/wave5-helper.c
+++ b/drivers/media/platform/chips-media/wave5/wave5-helper.c
@@ -27,6 +27,11 @@ const char *state_to_str(enum vpu_instance_state state)
 	}
 }
 
+int wave5_kfifo_alloc(struct vpu_instance *inst)
+{
+	return kfifo_alloc(&inst->irq_status, 16 * sizeof(int), GFP_KERNEL);
+}
+
 void wave5_cleanup_instance(struct vpu_instance *inst, struct file *filp)
 {
 	int i;
@@ -49,7 +54,7 @@ void wave5_cleanup_instance(struct vpu_instance *inst, struct file *filp)
 		v4l2_fh_del(&inst->v4l2_fh, filp);
 		v4l2_fh_exit(&inst->v4l2_fh);
 	}
-	list_del_init(&inst->list);
+	kfifo_free(&inst->irq_status);
 	ida_free(&inst->dev->inst_ida, inst->id);
 	kfree(inst->codec_info);
 	kfree(inst);
@@ -61,8 +66,29 @@ int wave5_vpu_release_device(struct file *filp,
 {
 	struct vpu_instance *inst = file_to_vpu_inst(filp);
 	int ret = 0;
+	unsigned long flags;
 
 	v4l2_m2m_ctx_release(inst->v4l2_fh.m2m_ctx);
+	/*
+	 * To prevent Null reference exception, the existing irq handler were
+	 * separated to two modules.
+	 * One is to queue interrupt reason into the irq handler,
+	 * the other is irq_thread to call the wave5_vpu_dec_finish_decode
+	 * to get decoded frame.
+	 * The list of instances should be protected between all flow of the
+	 * decoding process, but to protect the list in the irq_handler, spin lock
+	 * should be used, and mutex should be used in the irq_thread because spin lock
+	 * is not able to be used because mutex is already being used
+	 * in the wave5_vpu_dec_finish_decode.
+	 * So the spin lock and mutex were used to protect the list in the release function.
+	 */
+	ret = mutex_lock_interruptible(&inst->dev->irq_lock);
+	if (ret)
+		return ret;
+	spin_lock_irqsave(&inst->dev->irq_spinlock, flags);
+	list_del_init(&inst->list);
+	spin_unlock_irqrestore(&inst->dev->irq_spinlock, flags);
+	mutex_unlock(&inst->dev->irq_lock);
 	if (inst->state != VPU_INST_STATE_NONE) {
 		u32 fail_res;
 
diff --git a/drivers/media/platform/chips-media/wave5/wave5-helper.h b/drivers/media/platform/chips-media/wave5/wave5-helper.h
index 976a402e426f..d61fdbda359d 100644
--- a/drivers/media/platform/chips-media/wave5/wave5-helper.h
+++ b/drivers/media/platform/chips-media/wave5/wave5-helper.h
@@ -33,4 +33,5 @@ void wave5_update_pix_fmt(struct v4l2_pix_format_mplane *pix_mp,
 			  unsigned int width,
 			  unsigned int height,
 			  const struct v4l2_frmsize_stepwise *frmsize);
+int wave5_kfifo_alloc(struct vpu_instance *inst);
 #endif
diff --git a/drivers/media/platform/chips-media/wave5/wave5-vpu-dec.c b/drivers/media/platform/chips-media/wave5/wave5-vpu-dec.c
index 1df78e427c6a..a3a135946078 100644
--- a/drivers/media/platform/chips-media/wave5/wave5-vpu-dec.c
+++ b/drivers/media/platform/chips-media/wave5/wave5-vpu-dec.c
@@ -1810,6 +1810,11 @@ static int wave5_vpu_open_dec(struct file *filp)
 	inst->xfer_func = V4L2_XFER_FUNC_DEFAULT;
 
 	init_completion(&inst->irq_done);
+	ret = wave5_kfifo_alloc(inst);
+	if (ret) {
+		dev_err(inst->dev->dev, "failed to allocate fifo\n");
+		goto cleanup_inst;
+	}
 
 	inst->id = ida_alloc(&inst->dev->inst_ida, GFP_KERNEL);
 	if (inst->id < 0) {
diff --git a/drivers/media/platform/chips-media/wave5/wave5-vpu-enc.c b/drivers/media/platform/chips-media/wave5/wave5-vpu-enc.c
index d2b047706626..f84146aa4915 100644
--- a/drivers/media/platform/chips-media/wave5/wave5-vpu-enc.c
+++ b/drivers/media/platform/chips-media/wave5/wave5-vpu-enc.c
@@ -1759,6 +1759,11 @@ static int wave5_vpu_open_enc(struct file *filp)
 	inst->frame_rate = 30;
 
 	init_completion(&inst->irq_done);
+	ret = wave5_kfifo_alloc(inst);
+	if (ret) {
+		dev_err(inst->dev->dev, "failed to allocate fifo\n");
+		goto cleanup_inst;
+	}
 
 	inst->id = ida_alloc(&inst->dev->inst_ida, GFP_KERNEL);
 	if (inst->id < 0) {
diff --git a/drivers/media/platform/chips-media/wave5/wave5-vpu.c b/drivers/media/platform/chips-media/wave5/wave5-vpu.c
index 91fe4086d87a..86193b526709 100644
--- a/drivers/media/platform/chips-media/wave5/wave5-vpu.c
+++ b/drivers/media/platform/chips-media/wave5/wave5-vpu.c
@@ -51,8 +51,11 @@ static void wave5_vpu_handle_irq(void *dev_id)
 	u32 seq_done;
 	u32 cmd_done;
 	u32 irq_reason;
-	struct vpu_instance *inst;
+	u32 irq_subreason;
+	struct vpu_instance *inst, *tmp;
 	struct vpu_device *dev = dev_id;
+	int val;
+	unsigned long flags;
 
 	irq_reason = wave5_vdi_read_register(dev, W5_VPU_VINT_REASON);
 	seq_done = wave5_vdi_read_register(dev, W5_RET_SEQ_DONE_INSTANCE_INFO);
@@ -60,7 +63,8 @@ static void wave5_vpu_handle_irq(void *dev_id)
 	wave5_vdi_write_register(dev, W5_VPU_VINT_REASON_CLR, irq_reason);
 	wave5_vdi_write_register(dev, W5_VPU_VINT_CLEAR, 0x1);
 
-	list_for_each_entry(inst, &dev->instances, list) {
+	spin_lock_irqsave(&dev->irq_spinlock, flags);
+	list_for_each_entry_safe(inst, tmp, &dev->instances, list) {
 
 		if (irq_reason & BIT(INT_WAVE5_INIT_SEQ) ||
 		    irq_reason & BIT(INT_WAVE5_ENC_SET_PARAM)) {
@@ -82,22 +86,54 @@ static void wave5_vpu_handle_irq(void *dev_id)
 		    irq_reason & BIT(INT_WAVE5_ENC_PIC)) {
 			if (cmd_done & BIT(inst->id)) {
 				cmd_done &= ~BIT(inst->id);
-				wave5_vdi_write_register(dev, W5_RET_QUEUE_CMD_DONE_INST,
-							 cmd_done);
-				inst->ops->finish_process(inst);
+				if (dev->irq >= 0) {
+					irq_subreason =
+						wave5_vdi_read_register(dev, W5_VPU_VINT_REASON);
+					if (!(irq_subreason & BIT(INT_WAVE5_DEC_PIC)))
+						wave5_vdi_write_register(dev,
+									 W5_RET_QUEUE_CMD_DONE_INST,
+									 cmd_done);
+				}
+				val = BIT(INT_WAVE5_DEC_PIC);
+				kfifo_in(&inst->irq_status, &val, sizeof(int));
 			}
 		}
+	}
+	spin_unlock_irqrestore(&dev->irq_spinlock, flags);
+
+	if (dev->irq < 0)
+		up(&dev->irq_sem);
+}
+
+static irqreturn_t wave5_vpu_irq(int irq, void *dev_id)
+{
+	struct vpu_device *dev = dev_id;
 
-		wave5_vpu_clear_interrupt(inst, irq_reason);
+	if (wave5_vdi_read_register(dev, W5_VPU_VPU_INT_STS)) {
+		wave5_vpu_handle_irq(dev);
+		return IRQ_WAKE_THREAD;
 	}
+
+	return IRQ_HANDLED;
 }
 
 static irqreturn_t wave5_vpu_irq_thread(int irq, void *dev_id)
 {
 	struct vpu_device *dev = dev_id;
+	struct vpu_instance *inst, *tmp;
+	int irq_status, ret;
 
-	if (wave5_vdi_read_register(dev, W5_VPU_VPU_INT_STS))
-		wave5_vpu_handle_irq(dev);
+	mutex_lock(&dev->irq_lock);
+	list_for_each_entry_safe(inst, tmp, &dev->instances, list) {
+		while (kfifo_len(&inst->irq_status)) {
+			ret = kfifo_out(&inst->irq_status, &irq_status, sizeof(int));
+			if (!ret)
+				break;
+
+			inst->ops->finish_process(inst);
+		}
+	}
+	mutex_unlock(&dev->irq_lock);
 
 	return IRQ_HANDLED;
 }
@@ -121,6 +157,35 @@ static enum hrtimer_restart wave5_vpu_timer_callback(struct hrtimer *timer)
 	return HRTIMER_RESTART;
 }
 
+static int irq_thread(void *data)
+{
+	struct vpu_device *dev = (struct vpu_device *)data;
+	struct vpu_instance *inst, *tmp;
+	int irq_status, ret;
+
+	while (!kthread_should_stop()) {
+		if (down_interruptible(&dev->irq_sem))
+			continue;
+
+		if (kthread_should_stop())
+			break;
+
+		mutex_lock(&dev->irq_lock);
+		list_for_each_entry_safe(inst, tmp, &dev->instances, list) {
+			while (kfifo_len(&inst->irq_status)) {
+				ret = kfifo_out(&inst->irq_status, &irq_status, sizeof(int));
+				if (!ret)
+					break;
+
+				inst->ops->finish_process(inst);
+			}
+		}
+		mutex_unlock(&dev->irq_lock);
+	}
+
+	return 0;
+}
+
 static int wave5_vpu_load_firmware(struct device *dev, const char *fw_name,
 				   u32 *revision)
 {
@@ -223,6 +288,8 @@ static int wave5_vpu_probe(struct platform_device *pdev)
 
 	mutex_init(&dev->dev_lock);
 	mutex_init(&dev->hw_lock);
+	mutex_init(&dev->irq_lock);
+	spin_lock_init(&dev->irq_spinlock);
 	dev_set_drvdata(&pdev->dev, dev);
 	dev->dev = &pdev->dev;
 
@@ -266,9 +333,13 @@ static int wave5_vpu_probe(struct platform_device *pdev)
 	dev->product = wave5_vpu_get_product_id(dev);
 	dev->ext_addr = ((dev->common_mem.daddr >> 32) & 0xFFFF);
 
+	INIT_LIST_HEAD(&dev->instances);
+
 	dev->irq = platform_get_irq(pdev, 0);
 	if (dev->irq < 0) {
 		dev_err(&pdev->dev, "failed to get irq resource, falling back to polling\n");
+		sema_init(&dev->irq_sem, 1);
+		dev->irq_thread = kthread_run(irq_thread, dev, "irq thread");
 		hrtimer_setup(&dev->hrtimer, &wave5_vpu_timer_callback, CLOCK_MONOTONIC,
 			      HRTIMER_MODE_REL_PINNED);
 		dev->worker = kthread_run_worker(0, "vpu_irq_thread");
@@ -280,7 +351,7 @@ static int wave5_vpu_probe(struct platform_device *pdev)
 		dev->vpu_poll_interval = vpu_poll_interval;
 		kthread_init_work(&dev->work, wave5_vpu_irq_work_fn);
 	} else {
-		ret = devm_request_threaded_irq(&pdev->dev, dev->irq, NULL,
+		ret = devm_request_threaded_irq(&pdev->dev, dev->irq, wave5_vpu_irq,
 						wave5_vpu_irq_thread, IRQF_ONESHOT, "vpu_irq", dev);
 		if (ret) {
 			dev_err(&pdev->dev, "Register interrupt handler, fail: %d\n", ret);
@@ -288,7 +359,6 @@ static int wave5_vpu_probe(struct platform_device *pdev)
 		}
 	}
 
-	INIT_LIST_HEAD(&dev->instances);
 	ret = v4l2_device_register(&pdev->dev, &dev->v4l2_dev);
 	if (ret) {
 		dev_err(&pdev->dev, "v4l2_device_register, fail: %d\n", ret);
@@ -352,6 +422,11 @@ static void wave5_vpu_remove(struct platform_device *pdev)
 	struct vpu_device *dev = dev_get_drvdata(&pdev->dev);
 
 	if (dev->irq < 0) {
+		if (dev->irq_thread) {
+			kthread_stop(dev->irq_thread);
+			up(&dev->irq_sem);
+			dev->irq_thread = NULL;
+		}
 		kthread_destroy_worker(dev->worker);
 		hrtimer_cancel(&dev->hrtimer);
 	}
@@ -361,6 +436,7 @@ static void wave5_vpu_remove(struct platform_device *pdev)
 
 	mutex_destroy(&dev->dev_lock);
 	mutex_destroy(&dev->hw_lock);
+	mutex_destroy(&dev->irq_lock);
 	reset_control_assert(dev->resets);
 	clk_bulk_disable_unprepare(dev->num_clks, dev->clks);
 	wave5_vpu_enc_unregister_device(dev);
diff --git a/drivers/media/platform/chips-media/wave5/wave5-vpuapi.h b/drivers/media/platform/chips-media/wave5/wave5-vpuapi.h
index 68ebb0e6c4cb..4da1772ef100 100644
--- a/drivers/media/platform/chips-media/wave5/wave5-vpuapi.h
+++ b/drivers/media/platform/chips-media/wave5/wave5-vpuapi.h
@@ -8,6 +8,7 @@
 #ifndef VPUAPI_H_INCLUDED
 #define VPUAPI_H_INCLUDED
 
+#include <linux/kfifo.h>
 #include <linux/idr.h>
 #include <linux/genalloc.h>
 #include <media/v4l2-device.h>
@@ -747,6 +748,7 @@ struct vpu_device {
 	struct video_device *video_dev_enc;
 	struct mutex dev_lock; /* lock for the src, dst v4l2 queues */
 	struct mutex hw_lock; /* lock hw configurations */
+	struct mutex irq_lock;
 	int irq;
 	enum product_id product;
 	struct vpu_attr attr;
@@ -765,7 +767,10 @@ struct vpu_device {
 	struct kthread_worker *worker;
 	int vpu_poll_interval;
 	int num_clks;
+	struct task_struct *irq_thread;
+	struct semaphore irq_sem; /* signal to irq_thread when interrupt happens*/
 	struct reset_control *resets;
+	spinlock_t irq_spinlock; /* protect instances list */
 };
 
 struct vpu_instance;
@@ -789,6 +794,7 @@ struct vpu_instance {
 	enum v4l2_ycbcr_encoding ycbcr_enc;
 	enum v4l2_quantization quantization;
 
+	struct kfifo irq_status;
 	enum vpu_instance_state state;
 	enum vpu_instance_type type;
 	const struct vpu_instance_ops *ops;
-- 
2.43.0


