Return-Path: <linux-media+bounces-24024-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DE8E9FB9C0
	for <lists+linux-media@lfdr.de>; Tue, 24 Dec 2024 07:16:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5A18A166790
	for <lists+linux-media@lfdr.de>; Tue, 24 Dec 2024 06:15:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 383EC17A5BE;
	Tue, 24 Dec 2024 06:15:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="uv8pI8ee"
X-Original-To: linux-media@vger.kernel.org
Received: from EUR02-VI1-obe.outbound.protection.outlook.com (mail-vi1eur02on2053.outbound.protection.outlook.com [40.107.241.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFD211714A1;
	Tue, 24 Dec 2024 06:15:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.241.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735020915; cv=fail; b=tU3EgF0Pi6/liEih39XgoJX+8jpdTQyZaRsCE1P0rldXWqcM4aD29Ue7lw+0shXvn1Cb0LTBrcpLyY09Kv5V1xtqq7DtehTzQlkV6F0bH5cOUQfUaw/e83eDGuxWLZqPcj9hLBKJhKQkYP6uEZJWkpmS/uwpJLysvjDji9DQ4CU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735020915; c=relaxed/simple;
	bh=4hXBXNMJSU52Ebfo+hVn0vYve2L3VDCL7Jk3eNLDjLs=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=LEowiZBjovXlAUUNwPkSvCmsub600Gx8/yEEsdkKFJuk4Xn5ZSyc/c4IHOxKJGu6Z92M3jJp1tiXQ6zP1x1JuXGZMRYOBJZhhdG3VlcY3V4yhhUfhYdqfcTF8y2HUqQTtExK8ekovG7Z53fcESegzOFbeobN63Y5AVjhC+N5XYE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=uv8pI8ee; arc=fail smtp.client-ip=40.107.241.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BR9LUU7rtA7JE5dTORxSajs4Ew6SwOkA78lx6Icx51qQk0rFj752Z3/7Cv9YUyD+3zjbq9xcpdpSRvATPLI2VWN3KQ667+WVTepN4DWJz2mpoq+hlK+FXZNo9aSF5U2jbggQ/O+APDFIbgSFHptxK46vpNrvrpgLFWSRsBsr9MDVX+9ZB3AEAYiaF08Lp6CfH0OklJJEvgY1c+77lnzmR0d5PzgPUr4pKjr5D5aA0dQXsAAtIX/3BkURFNWEZdx9vGEqGLbo36geK7q4azJ1ivJFZxske3vIB/nM/DNrBoQWLbZ39MzCmyHOoiPWadhqBPfnS7a9vDO9d7QV+y6LBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nJd62m3K1jKY9xIVqa6TanU7LgWfWxNvzR/w4PYsSe0=;
 b=CYCyX3S9WD/2yH3xz/zXDUt7Vqzqe3hniOXZfaB237EPljXXT+7VjA+z0Y0bUsQHx9uQhh/GG1ac/B1++mgQaPemCUR1iJw2gqDpvBznCyl4MxpcP61WhZlIw5MF9pOXIpPAAH6qX8veyWv22tbYX+PdESrkli+G7AGA01SCssI8Vt/8DqkyZW7xjldTcgFW8dXpAJWykwasbcvxXs5hbzub/TkDRl9Lhd+rnOR7xzlk7DYsUAzB11nLhvZ/8a84x6UuTXn+C41/u4+zCf4gZq/9s6PDSNSBeXNP1msJQeg4BnNtQ5KComQohdG8vVbdIdlG2YWi3PLHexxEMgFxBg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nJd62m3K1jKY9xIVqa6TanU7LgWfWxNvzR/w4PYsSe0=;
 b=uv8pI8eecMW5JHy+1fOkLb/vPeiXkfcQRhX6FAWInSLB764nZKXmIHYPYHip/ABf6MCGDC6XX6BKHb4w7FsR6Y+B1fmogM+fVsEJFiY6gsVjv1v2iV5RITNdDfY0biTPrn2k3BnM+p2KX/wmbKoxluSmpQ2pzP3iPuYyNZFLEd+b26/ERMPAa7HAEZJvqYYlQb1Ax538ljo2R+TSPcyLTQYJ18xpZO2aXA4NylP+L0lZs5QHt/K2mQ/POsdhQKZAcE/3/+3kC+jqdySJntXS02vXP0wCXuFddR74kBIZKnQOC73jicIDUXyuoa/A49FMnEgbkaFxxFur4wYXQy4BuQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8254.eurprd04.prod.outlook.com (2603:10a6:102:1cd::24)
 by VI1PR04MB6912.eurprd04.prod.outlook.com (2603:10a6:803:134::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8272.21; Tue, 24 Dec
 2024 06:15:01 +0000
Received: from PAXPR04MB8254.eurprd04.prod.outlook.com
 ([fe80::2755:55ac:5d6f:4f87]) by PAXPR04MB8254.eurprd04.prod.outlook.com
 ([fe80::2755:55ac:5d6f:4f87%6]) with mapi id 15.20.8272.013; Tue, 24 Dec 2024
 06:15:01 +0000
From: Ming Qian <ming.qian@oss.nxp.com>
To: mchehab@kernel.org,
	hverkuil-cisco@xs4all.nl
Cc: nicolas@ndufresne.ca,
	shawnguo@kernel.org,
	robh+dt@kernel.org,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	linux-imx@nxp.com,
	xiahong.bao@nxp.com,
	eagle.zhou@nxp.com,
	tao.jiang_2@nxp.com,
	ming.qian@oss.nxp.com,
	imx@lists.linux.dev,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v3] media: amphion: Support dmabuf and v4l2 buffer without binding
Date: Tue, 24 Dec 2024 15:14:35 +0900
Message-ID: <20241224061435.2084609-1-ming.qian@oss.nxp.com>
X-Mailer: git-send-email 2.43.0-rc1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR01CA0036.apcprd01.prod.exchangelabs.com
 (2603:1096:4:192::22) To PAXPR04MB8254.eurprd04.prod.outlook.com
 (2603:10a6:102:1cd::24)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8254:EE_|VI1PR04MB6912:EE_
X-MS-Office365-Filtering-Correlation-Id: 30cdce35-6c1d-4fe0-e69b-08dd23e24c6d
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|7416014|1800799024|376014|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?amhhqdKPFfp3FjUxYQAdUa+my+FW/QzZq04mNjn+yLNVbJ4ysuqoWTnO4Yov?=
 =?us-ascii?Q?MNr1aZb2TofSdLFIt2heKxacpYpor6GX5FCawtPo7j69hiYQgNcl6FOQrLEZ?=
 =?us-ascii?Q?c4Z00VDlVzkFtML5IF4JcotDTBipOhHV9hlxSa6dlZLRVJGFBbIJsdSRdNv1?=
 =?us-ascii?Q?gQbO2p5v2Y6rR9fWVBvTFMcdR7GnGTYomBM5DMtU58XqCCBHwoz4sZ0tzc1n?=
 =?us-ascii?Q?kWq/5s3zgrtH9Zxzqcj1McH47cRS8k+4j9ZzCwRIFsBPTnfoHjtcth6M76Fm?=
 =?us-ascii?Q?EvdtQCYCUL+6g0yiKEsyGk7zyfigEf7f+/LB2LJJx109Z9s9NwyotgIg+sXi?=
 =?us-ascii?Q?nMLcGOwNV0x9xJFlsdmuN/MYGhta6bhCs7ztxf3XZKrn1UMLu3DYOpBsVVFb?=
 =?us-ascii?Q?MGr5GhwYGwWUKHOUR8h6pn3imK606AJA/xFVGdCSSWHa4mxsJwzgiAt6AWQC?=
 =?us-ascii?Q?ATIliISYtTLtVGdMIarLTczQUXNLZLrhPLMFu4w58DeceAJciWhn6MVcu7IA?=
 =?us-ascii?Q?AFEDp2fjH8yXfFPWr58ZRByQZ5mofB8v0MJcFvAzIuKN5wneRgoCWTzruSUA?=
 =?us-ascii?Q?+9H5qN03rp78LDDs8j9Ag2OKMyurAHhOKGlqYou5a+ilX/tli1VuPcPXXK/T?=
 =?us-ascii?Q?EXfSayNhF7bDozDTrdjguNW5apMCu3o2586z+nRLznoPvyBhU5Thw3bsY4Ia?=
 =?us-ascii?Q?JphTmkH7pOe8Ko0an0a9X/uQXnZPG5EMGgQu2x3NSbWUNyqP6PNiiVjuTitj?=
 =?us-ascii?Q?gOhBrqZvHTFy0SrlgZ9dv94Kfi+KK54Zn1E3AXeGcnRubMOWMnckcCP33IGJ?=
 =?us-ascii?Q?juueTrs+/gYM6mR/RpSR0gU1P27P5qGPjMO6P+JSvJT7PKJwdnxQw+n17GxF?=
 =?us-ascii?Q?swqzcAf7lQVgutIZP8EHuEBlckFBg9bPU8slLNSX3xPjB53o9Z8S90PILNy0?=
 =?us-ascii?Q?fvIkXy92QkuJzKi4oTLkreHlyboQ/cJZweJO/3ezX+c2h6NfQ0R/xPggfW5Z?=
 =?us-ascii?Q?FZsckL7ewXKXVbLUBHpucYCHWobFusTaIbYXWWGKuywEC+iqxKDCcTwhu9OI?=
 =?us-ascii?Q?7k651BNQ50SVlIgSK0X7HKDi/WBp2nox898rer0wW0ZIfKCUwuvugBhaRy6y?=
 =?us-ascii?Q?l+5ErVI+ndpeFi276yQK56G4iG4mUl8UIIxnoC4WO2lF8u0jlwEWERQklZK9?=
 =?us-ascii?Q?oHGHl0waviTmHiO4024sTz0ExuiF38Ct8JtzhHA/j0JmDzrizlCwP858rN5g?=
 =?us-ascii?Q?Yduw3JsxFpFGKU9eUz//AY62VihsT9bh5CqhkXvfxlOcUWVoEd24TgY1rWSn?=
 =?us-ascii?Q?EB0flYUTWeDo34WYfmbDGRTHodbGeAj/LqdKNyJnleg3JSRXfRFZw77AaXiM?=
 =?us-ascii?Q?Yxwls2/Bdu91oa4kisiMzwaR2Z0fABW/02V5qH5Bxgn1t81u0HTHiggYJIa/?=
 =?us-ascii?Q?qMvyWvdZt/29p4dI1x8x6ccOaxyNAByP?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8254.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(7416014)(1800799024)(376014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?YihU3EngsNPXlH1svrOqg9iGNcfjpnFXjAfifLpAaWbB9udIwrVE/32cIfvv?=
 =?us-ascii?Q?BRHivmQP8NbsAqKEa06hOgO+moRMKzB4P2iMtJHPdzPKcS1OydPV4hIwfk7n?=
 =?us-ascii?Q?Av4I2/vGFR04q43gQahoNpWn+mp/qixiVHPEabl3ExpaXaOc8bTcwMyFFuaq?=
 =?us-ascii?Q?zaMLkgMuau1uOdgYl9Fd3K2+Jdo328Q0Ic4ZLPR0wcLw7ANqzqUZy5DlnZBj?=
 =?us-ascii?Q?ycEP6GSt6G5TuzVI3721LzA/wOVjWAyBQAXyqBHlQVOIP/lTssjm2DodSaDg?=
 =?us-ascii?Q?22OlEO0VgEBK5thCG9H7rZdVGx4zePrfxqtg1d3xgdTqs5z0hw7U01pjaO6l?=
 =?us-ascii?Q?tTFoagclQeE38v8lo3onM91dodHll7lofV+2L0Vi/IPOHjNAi5+8IDmf+luI?=
 =?us-ascii?Q?Y1mOC+Rupf/fFnVdfBMVHY5p55qgkmbSThUn7iu/VFZsgbL5rH59D0XYs3LD?=
 =?us-ascii?Q?4tg4gkscB43RBaX0ha61V0VvkxHOxMqnk+5WRrq50hJSZVv1ruUW3Xj46c4W?=
 =?us-ascii?Q?lLyot0MS3ut2DJ71jBCGwlchsysup8MseNX26Yikbj21GUSK9Ljff8Fixxfx?=
 =?us-ascii?Q?oAIYf0w4TYqrnj3XBU7cOEj+NMaLEH3a1FRbondWx0F7OqW6vl+CmFNrUGNC?=
 =?us-ascii?Q?ITZ0gWc7PvnszsEn2IjZ9oXRW6A5Js3IQU7AlaMmlV33MiV9n6AQSKX5L1FL?=
 =?us-ascii?Q?y4w9ABmg4zvG1RTMzi4kjR6wfOZ7l7A8UsmoVDiQmZqj8IxGw7LbVd5n1jfD?=
 =?us-ascii?Q?ys+m9/ywNvGXeWIVyQC/v7Km/1cilggndGBLbyCl6igF8yfgod3tfbQwUYMT?=
 =?us-ascii?Q?y2KPrdVScfqcm/TQOjzZmBXWptBItZwuJp1V6/6ZC0yhu0TbVAyGuKLaqybQ?=
 =?us-ascii?Q?6F1Z4+QAto9ymd/9cY8qbHJJdfMN/Qyu8TsF9qQ4cajC+3bexkWeegGY8VRM?=
 =?us-ascii?Q?oClR5JkdPujNLag3jVjn4n1EvFrq0ruQJvoS1muoiy7oLpS5OIf97ZsdveIU?=
 =?us-ascii?Q?m8PDI+0xC2+3TO/Kt6Gm8IrNkH/KFWWKf/kwbh8kgknCkUV5oCs6W5DEjXfa?=
 =?us-ascii?Q?Nm05lnyqv8bgffBpgSJ5WpQFVZpqGr5ysi93mjma4tSQs3hDRKie9Wr7mqEa?=
 =?us-ascii?Q?g8n4KKpppHj4zeDH37MacErf+FxnMcEfh+yOKeiGizdr47BQG24dYirQn/id?=
 =?us-ascii?Q?vq3yRaJf8t17SJWP+FgHZmpIzNQAEoCylfi9HAX0MWh9stYJo3GznWwOoOSH?=
 =?us-ascii?Q?MkYq/oYQPci1qg0Jr5MmRXB0F3oUrK0NFMaqHP3+GtlijPiuiFcsbyMgIuE6?=
 =?us-ascii?Q?5f+qLhBR4WVvvQfB1ubvig2WuqaY09REZOGt8it0SyJUovyt9IgDyWoWV8Gp?=
 =?us-ascii?Q?DbkeyczZxNJFUBy1qnWFP1Gm2j4Aj2p1REDzuUFRcUW96KRwV2FSX3ny/0Hb?=
 =?us-ascii?Q?+tEKvIWajsbey1tcPqR0mT3/oLWBSdRjD5P13zBGg5iLjKA7KZboj7Ld0TYm?=
 =?us-ascii?Q?r0fhbVU8Y8MEno9hAORfrA08w1uvgF2nZO2SGEkqsYuvTUni4Emcijy3mGhC?=
 =?us-ascii?Q?gueWqjFNIyrO9nAoNsvyHBbUV5tIw8A002NILC2W?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 30cdce35-6c1d-4fe0-e69b-08dd23e24c6d
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8254.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Dec 2024 06:15:01.0249
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6K8dWlzgWwOWf2N/00TdjwXJhHNBxMXdG0qTTA266DYUaScmdjn2WB1fPaFOzrMomr8a/Z04RESbUGfNmFM2Mg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB6912

When using VB2_DMABUF, the relationship between dma-buf and v4l2 buffer
may not one-to-one, a single dma-buf may be queued via different
v4l2 buffers, and different dma-bufs may be queued via the same
v4l2 buffer, so it's not appropriate to use the v4l2 buffer index
as the frame store id.

We can generate a frame store id according to the dma address.
Then for a given dma-buf, the id is fixed.

Driver now manages the frame store and vb2-buffer states independently.

When a dmabuf is queued via another v4l2 buffer before the buffer is
released by firmware, need to pend it until firmware release it.

Signed-off-by: Ming Qian <ming.qian@oss.nxp.com>
---
v3
-- fix a typo in NULL pointer check
v2
-- fix an uninitialized issue reported by media-ci

 drivers/media/platform/amphion/vdec.c     | 234 +++++++++++++++++-----
 drivers/media/platform/amphion/vpu.h      |   7 +-
 drivers/media/platform/amphion/vpu_dbg.c  |  15 +-
 drivers/media/platform/amphion/vpu_v4l2.c |  11 +
 4 files changed, 219 insertions(+), 48 deletions(-)

diff --git a/drivers/media/platform/amphion/vdec.c b/drivers/media/platform/amphion/vdec.c
index 61d5598ee6a1..2c159603a697 100644
--- a/drivers/media/platform/amphion/vdec.c
+++ b/drivers/media/platform/amphion/vdec.c
@@ -26,6 +26,7 @@
 #include "vpu_cmds.h"
 #include "vpu_rpc.h"
 
+#define VDEC_SLOT_CNT_DFT		32
 #define VDEC_MIN_BUFFER_CAP		8
 #define VDEC_MIN_BUFFER_OUT		8
 
@@ -41,6 +42,14 @@ struct vdec_fs_info {
 	u32 tag;
 };
 
+struct vdec_frame_store_t {
+	struct vpu_vb2_buffer *curr;
+	struct vpu_vb2_buffer *pend;
+	dma_addr_t addr;
+	unsigned int state;
+	u32 tag;
+};
+
 struct vdec_t {
 	u32 seq_hdr_found;
 	struct vpu_buffer udata;
@@ -48,7 +57,8 @@ struct vdec_t {
 	struct vpu_dec_codec_info codec_info;
 	enum vpu_codec_state state;
 
-	struct vpu_vb2_buffer *slots[VB2_MAX_FRAME];
+	struct vdec_frame_store_t *slots;
+	u32 slot_count;
 	u32 req_frame_count;
 	struct vdec_fs_info mbi;
 	struct vdec_fs_info dcp;
@@ -289,6 +299,64 @@ static int vdec_ctrl_init(struct vpu_inst *inst)
 	return 0;
 }
 
+static void vdec_attach_frame_store(struct vpu_inst *inst, struct vb2_buffer *vb)
+{
+	struct vb2_v4l2_buffer *vbuf = to_vb2_v4l2_buffer(vb);
+	struct vpu_vb2_buffer *vpu_buf = to_vpu_vb2_buffer(vbuf);
+	struct vdec_t *vdec = inst->priv;
+	struct vdec_frame_store_t *new_slots = NULL;
+	dma_addr_t addr;
+	int i;
+
+	addr = vpu_get_vb_phy_addr(vb, 0);
+	for (i = 0; i < vdec->slot_count; i++) {
+		if (addr == vdec->slots[i].addr) {
+			if (vdec->slots[i].curr && vdec->slots[i].curr != vpu_buf) {
+				vpu_set_buffer_state(vbuf, VPU_BUF_STATE_CHANGED);
+				vdec->slots[i].pend = vpu_buf;
+			} else {
+				vpu_set_buffer_state(vbuf, vdec->slots[i].state);
+			}
+			vpu_buf->fs_id = i;
+			return;
+		}
+	}
+
+	for (i = 0; i < vdec->slot_count; i++) {
+		if (!vdec->slots[i].addr) {
+			vdec->slots[i].addr = addr;
+			vpu_buf->fs_id = i;
+			return;
+		}
+	}
+
+	new_slots = vzalloc(sizeof(*vdec->slots) * vdec->slot_count * 2);
+	if (!new_slots) {
+		dev_err(inst->dev, "fail to alloc frame store\n");
+		vpu_set_buffer_state(vbuf, VPU_BUF_STATE_ERROR);
+		return;
+	}
+
+	memcpy(new_slots, vdec->slots, sizeof(*vdec->slots) * vdec->slot_count);
+	vfree(vdec->slots);
+	vdec->slots = new_slots;
+	vdec->slot_count *= 2;
+
+	vdec->slots[i].addr = addr;
+	vpu_buf->fs_id = i;
+}
+
+static void vdec_reset_frame_store(struct vpu_inst *inst)
+{
+	struct vdec_t *vdec = inst->priv;
+
+	if (!vdec->slots || !vdec->slot_count)
+		return;
+
+	vpu_trace(inst->dev, "inst[%d] reset slots\n", inst->id);
+	memset(vdec->slots, 0, sizeof(*vdec->slots) * vdec->slot_count);
+}
+
 static void vdec_handle_resolution_change(struct vpu_inst *inst)
 {
 	struct vdec_t *vdec = inst->priv;
@@ -745,11 +813,11 @@ static int vdec_frame_decoded(struct vpu_inst *inst, void *arg)
 	struct vb2_v4l2_buffer *src_buf;
 	int ret = 0;
 
-	if (!info || info->id >= ARRAY_SIZE(vdec->slots))
+	if (!info || info->id >= vdec->slot_count)
 		return -EINVAL;
 
 	vpu_inst_lock(inst);
-	vpu_buf = vdec->slots[info->id];
+	vpu_buf = vdec->slots[info->id].curr;
 	if (!vpu_buf) {
 		dev_err(inst->dev, "[%d] decoded invalid frame[%d]\n", inst->id, info->id);
 		ret = -EINVAL;
@@ -770,11 +838,13 @@ static int vdec_frame_decoded(struct vpu_inst *inst, void *arg)
 	if (vpu_get_buffer_state(vbuf) == VPU_BUF_STATE_DECODED)
 		dev_info(inst->dev, "[%d] buf[%d] has been decoded\n", inst->id, info->id);
 	vpu_set_buffer_state(vbuf, VPU_BUF_STATE_DECODED);
+	vdec->slots[info->id].state = VPU_BUF_STATE_DECODED;
 	vdec->decoded_frame_count++;
 	if (vdec->params.display_delay_enable) {
 		struct vpu_format *cur_fmt;
 
 		cur_fmt = vpu_get_format(inst, inst->cap_format.type);
+		vdec->slots[info->id].state = VPU_BUF_STATE_READY;
 		vpu_set_buffer_state(vbuf, VPU_BUF_STATE_READY);
 		for (int i = 0; i < vbuf->vb2_buf.num_planes; i++)
 			vb2_set_plane_payload(&vbuf->vb2_buf,
@@ -797,11 +867,11 @@ static struct vpu_vb2_buffer *vdec_find_buffer(struct vpu_inst *inst, u32 luma)
 	struct vdec_t *vdec = inst->priv;
 	int i;
 
-	for (i = 0; i < ARRAY_SIZE(vdec->slots); i++) {
-		if (!vdec->slots[i])
+	for (i = 0; i < vdec->slot_count; i++) {
+		if (!vdec->slots[i].curr)
 			continue;
-		if (luma == vdec->slots[i]->luma)
-			return vdec->slots[i];
+		if (luma == vdec->slots[i].addr)
+			return vdec->slots[i].curr;
 	}
 
 	return NULL;
@@ -835,11 +905,11 @@ static void vdec_buf_done(struct vpu_inst *inst, struct vpu_frame_info *frame)
 
 	cur_fmt = vpu_get_format(inst, inst->cap_format.type);
 	vbuf = &vpu_buf->m2m_buf.vb;
-	if (vbuf->vb2_buf.index != frame->id)
-		dev_err(inst->dev, "[%d] buffer id(%d, %d) dismatch\n",
-			inst->id, vbuf->vb2_buf.index, frame->id);
+	if (vpu_buf->fs_id != frame->id)
+		dev_err(inst->dev, "[%d] buffer id(%d(%d), %d) dismatch\n",
+			inst->id, vpu_buf->fs_id, vbuf->vb2_buf.index, frame->id);
 
-	if (vpu_get_buffer_state(vbuf) == VPU_BUF_STATE_READY && vdec->params.display_delay_enable)
+	if (vdec->params.display_delay_enable)
 		return;
 
 	if (vpu_get_buffer_state(vbuf) != VPU_BUF_STATE_DECODED)
@@ -852,10 +922,11 @@ static void vdec_buf_done(struct vpu_inst *inst, struct vpu_frame_info *frame)
 	vbuf->sequence = vdec->sequence;
 	dev_dbg(inst->dev, "[%d][OUTPUT TS]%32lld\n", inst->id, vbuf->vb2_buf.timestamp);
 
-	v4l2_m2m_buf_done(vbuf, VB2_BUF_STATE_DONE);
 	vpu_inst_lock(inst);
+	vdec->slots[vpu_buf->fs_id].state = VPU_BUF_STATE_READY;
 	vdec->display_frame_count++;
 	vpu_inst_unlock(inst);
+	v4l2_m2m_buf_done(vbuf, VB2_BUF_STATE_DONE);
 	dev_dbg(inst->dev, "[%d] decoded : %d, display : %d, sequence : %d\n",
 		inst->id, vdec->decoded_frame_count, vdec->display_frame_count, vdec->sequence);
 }
@@ -1083,18 +1154,30 @@ static int vdec_response_frame(struct vpu_inst *inst, struct vb2_v4l2_buffer *vb
 	if (!vbuf)
 		return -EINVAL;
 
-	if (vdec->slots[vbuf->vb2_buf.index]) {
-		dev_err(inst->dev, "[%d] repeat alloc fs %d\n",
-			inst->id, vbuf->vb2_buf.index);
+	vpu_buf = to_vpu_vb2_buffer(vbuf);
+	if (vpu_buf->fs_id < 0 || vpu_buf->fs_id >= vdec->slot_count) {
+		dev_err(inst->dev, "invalid fs %d for v4l2 buffer %d\n",
+			vpu_buf->fs_id, vbuf->vb2_buf.index);
 		return -EINVAL;
 	}
 
+	if (vdec->slots[vpu_buf->fs_id].curr) {
+		if (vdec->slots[vpu_buf->fs_id].curr != vpu_buf) {
+			vpu_set_buffer_state(vbuf, VPU_BUF_STATE_CHANGED);
+			vdec->slots[vpu_buf->fs_id].pend = vpu_buf;
+		} else {
+			vpu_set_buffer_state(vbuf, vdec->slots[vpu_buf->fs_id].state);
+		}
+		dev_err(inst->dev, "[%d] repeat alloc fs %d (v4l2 index %d)\n",
+			inst->id, vpu_buf->fs_id, vbuf->vb2_buf.index);
+		return -EAGAIN;
+	}
+
 	dev_dbg(inst->dev, "[%d] state = %s, alloc fs %d, tag = 0x%x\n",
 		inst->id, vpu_codec_state_name(inst->state), vbuf->vb2_buf.index, vdec->seq_tag);
-	vpu_buf = to_vpu_vb2_buffer(vbuf);
 
 	memset(&info, 0, sizeof(info));
-	info.id = vbuf->vb2_buf.index;
+	info.id = vpu_buf->fs_id;
 	info.type = MEM_RES_FRAME;
 	info.tag = vdec->seq_tag;
 	info.luma_addr = vpu_get_vb_phy_addr(&vbuf->vb2_buf, 0);
@@ -1109,12 +1192,13 @@ static int vdec_response_frame(struct vpu_inst *inst, struct vb2_v4l2_buffer *vb
 	if (ret)
 		return ret;
 
-	vpu_buf->tag = info.tag;
 	vpu_buf->luma = info.luma_addr;
 	vpu_buf->chroma_u = info.chroma_addr;
 	vpu_buf->chroma_v = 0;
 	vpu_set_buffer_state(vbuf, VPU_BUF_STATE_INUSE);
-	vdec->slots[info.id] = vpu_buf;
+	vdec->slots[info.id].tag = info.tag;
+	vdec->slots[info.id].curr = vpu_buf;
+	vdec->slots[info.id].state = VPU_BUF_STATE_INUSE;
 	vdec->req_frame_count--;
 
 	return 0;
@@ -1175,25 +1259,47 @@ static void vdec_recycle_buffer(struct vpu_inst *inst, struct vb2_v4l2_buffer *v
 	v4l2_m2m_buf_queue(inst->fh.m2m_ctx, vbuf);
 }
 
-static void vdec_clear_slots(struct vpu_inst *inst)
+static void vdec_release_curr_frame_store(struct vpu_inst *inst, u32 id)
 {
 	struct vdec_t *vdec = inst->priv;
 	struct vpu_vb2_buffer *vpu_buf;
 	struct vb2_v4l2_buffer *vbuf;
+
+	if (id >= vdec->slot_count)
+		return;
+	if (!vdec->slots[id].curr)
+		return;
+
+	vpu_buf = vdec->slots[id].curr;
+	vbuf = &vpu_buf->m2m_buf.vb;
+
+	vdec_response_fs_release(inst, id, vdec->slots[id].tag);
+	if (vpu_buf->fs_id == id) {
+		if (vpu_buf->state != VPU_BUF_STATE_READY)
+			vdec_recycle_buffer(inst, vbuf);
+		vpu_set_buffer_state(vbuf, VPU_BUF_STATE_IDLE);
+	}
+
+	vdec->slots[id].curr = NULL;
+	vdec->slots[id].state = VPU_BUF_STATE_IDLE;
+
+	if (vdec->slots[id].pend) {
+		vpu_set_buffer_state(&vdec->slots[id].pend->m2m_buf.vb, VPU_BUF_STATE_IDLE);
+		vdec->slots[id].pend = NULL;
+	}
+}
+
+static void vdec_clear_slots(struct vpu_inst *inst)
+{
+	struct vdec_t *vdec = inst->priv;
 	int i;
 
-	for (i = 0; i < ARRAY_SIZE(vdec->slots); i++) {
-		if (!vdec->slots[i])
+	for (i = 0; i < vdec->slot_count; i++) {
+		if (!vdec->slots[i].curr)
 			continue;
 
-		vpu_buf = vdec->slots[i];
-		vbuf = &vpu_buf->m2m_buf.vb;
-
 		vpu_trace(inst->dev, "clear slot %d\n", i);
-		vdec_response_fs_release(inst, i, vpu_buf->tag);
-		vdec_recycle_buffer(inst, vbuf);
-		vdec->slots[i]->state = VPU_BUF_STATE_IDLE;
-		vdec->slots[i] = NULL;
+		vdec_release_curr_frame_store(inst, i);
 	}
 }
 
@@ -1324,39 +1430,29 @@ static void vdec_event_req_fs(struct vpu_inst *inst, struct vpu_fs_info *fs)
 static void vdec_evnet_rel_fs(struct vpu_inst *inst, struct vpu_fs_info *fs)
 {
 	struct vdec_t *vdec = inst->priv;
-	struct vpu_vb2_buffer *vpu_buf;
-	struct vb2_v4l2_buffer *vbuf;
 
-	if (!fs || fs->id >= ARRAY_SIZE(vdec->slots))
+	if (!fs || fs->id >= vdec->slot_count)
 		return;
 	if (fs->type != MEM_RES_FRAME)
 		return;
 
-	if (fs->id >= vpu_get_num_buffers(inst, inst->cap_format.type)) {
+	if (fs->id >= vdec->slot_count) {
 		dev_err(inst->dev, "[%d] invalid fs(%d) to release\n", inst->id, fs->id);
 		return;
 	}
 
 	vpu_inst_lock(inst);
-	vpu_buf = vdec->slots[fs->id];
-	vdec->slots[fs->id] = NULL;
-
-	if (!vpu_buf) {
+	if (!vdec->slots[fs->id].curr) {
 		dev_dbg(inst->dev, "[%d] fs[%d] has bee released\n", inst->id, fs->id);
 		goto exit;
 	}
 
-	vbuf = &vpu_buf->m2m_buf.vb;
-	if (vpu_get_buffer_state(vbuf) == VPU_BUF_STATE_DECODED) {
+	if (vdec->slots[fs->id].state == VPU_BUF_STATE_DECODED) {
 		dev_dbg(inst->dev, "[%d] frame skip\n", inst->id);
 		vdec->sequence++;
 	}
 
-	vdec_response_fs_release(inst, fs->id, vpu_buf->tag);
-	if (vpu_get_buffer_state(vbuf) != VPU_BUF_STATE_READY)
-		vdec_recycle_buffer(inst, vbuf);
-
-	vpu_set_buffer_state(vbuf, VPU_BUF_STATE_IDLE);
+	vdec_release_curr_frame_store(inst, fs->id);
 	vpu_process_capture_buffer(inst);
 
 exit:
@@ -1552,6 +1648,11 @@ static void vdec_cleanup(struct vpu_inst *inst)
 		return;
 
 	vdec = inst->priv;
+	if (vdec) {
+		vfree(vdec->slots);
+		vdec->slots = NULL;
+		vdec->slot_count = 0;
+	}
 	vfree(vdec);
 	inst->priv = NULL;
 	vfree(inst);
@@ -1683,11 +1784,43 @@ static int vdec_stop_session(struct vpu_inst *inst, u32 type)
 	return 0;
 }
 
-static int vdec_get_debug_info(struct vpu_inst *inst, char *str, u32 size, u32 i)
+static int vdec_get_slot_debug_info(struct vpu_inst *inst, char *str, u32 size, u32 i)
 {
 	struct vdec_t *vdec = inst->priv;
+	struct vpu_vb2_buffer *vpu_buf;
 	int num = -1;
 
+	vpu_inst_lock(inst);
+	if (i >= vdec->slot_count || !vdec->slots[i].addr)
+		goto exit;
+
+	vpu_buf = vdec->slots[i].curr;
+
+	num = scnprintf(str, size, "slot[%2d] :", i);
+	if (vpu_buf) {
+		num += scnprintf(str + num, size - num, " %2d",
+				 vpu_buf->m2m_buf.vb.vb2_buf.index);
+		num += scnprintf(str + num, size - num, "; state = %d", vdec->slots[i].state);
+	} else {
+		num += scnprintf(str + num, size - num, " -1");
+	}
+
+	if (vdec->slots[i].pend)
+		num += scnprintf(str + num, size - num, "; %d",
+				 vdec->slots[i].pend->m2m_buf.vb.vb2_buf.index);
+
+	num += scnprintf(str + num, size - num, "\n");
+exit:
+	vpu_inst_unlock(inst);
+
+	return num;
+}
+
+static int vdec_get_debug_info(struct vpu_inst *inst, char *str, u32 size, u32 i)
+{
+	struct vdec_t *vdec = inst->priv;
+	int num;
+
 	switch (i) {
 	case 0:
 		num = scnprintf(str, size,
@@ -1741,6 +1874,7 @@ static int vdec_get_debug_info(struct vpu_inst *inst, char *str, u32 size, u32 i
 				vdec->codec_info.vui_present);
 		break;
 	default:
+		num = vdec_get_slot_debug_info(inst, str, size, i - 10);
 		break;
 	}
 
@@ -1764,6 +1898,8 @@ static struct vpu_inst_ops vdec_inst_ops = {
 	.get_debug_info = vdec_get_debug_info,
 	.wait_prepare = vpu_inst_unlock,
 	.wait_finish = vpu_inst_lock,
+	.attach_frame_store = vdec_attach_frame_store,
+	.reset_frame_store = vdec_reset_frame_store,
 };
 
 static void vdec_init(struct file *file)
@@ -1804,6 +1940,14 @@ static int vdec_open(struct file *file)
 		return -ENOMEM;
 	}
 
+	vdec->slots = vzalloc(sizeof(*vdec->slots) * VDEC_SLOT_CNT_DFT);
+	if (!vdec->slots) {
+		vfree(vdec);
+		vfree(inst);
+		return -ENOMEM;
+	}
+	vdec->slot_count = VDEC_SLOT_CNT_DFT;
+
 	inst->ops = &vdec_inst_ops;
 	inst->formats = vdec_formats;
 	inst->type = VPU_CORE_TYPE_DEC;
diff --git a/drivers/media/platform/amphion/vpu.h b/drivers/media/platform/amphion/vpu.h
index 22f0da26ccec..76bfd6b26170 100644
--- a/drivers/media/platform/amphion/vpu.h
+++ b/drivers/media/platform/amphion/vpu.h
@@ -223,6 +223,8 @@ struct vpu_inst_ops {
 	int (*get_debug_info)(struct vpu_inst *inst, char *str, u32 size, u32 i);
 	void (*wait_prepare)(struct vpu_inst *inst);
 	void (*wait_finish)(struct vpu_inst *inst);
+	void (*attach_frame_store)(struct vpu_inst *inst, struct vb2_buffer *vb);
+	void (*reset_frame_store)(struct vpu_inst *inst);
 };
 
 struct vpu_inst {
@@ -296,7 +298,8 @@ enum {
 	VPU_BUF_STATE_DECODED,
 	VPU_BUF_STATE_READY,
 	VPU_BUF_STATE_SKIP,
-	VPU_BUF_STATE_ERROR
+	VPU_BUF_STATE_ERROR,
+	VPU_BUF_STATE_CHANGED
 };
 
 struct vpu_vb2_buffer {
@@ -305,8 +308,8 @@ struct vpu_vb2_buffer {
 	dma_addr_t chroma_u;
 	dma_addr_t chroma_v;
 	unsigned int state;
-	u32 tag;
 	u32 average_qp;
+	s32 fs_id;
 };
 
 void vpu_writel(struct vpu_dev *vpu, u32 reg, u32 val);
diff --git a/drivers/media/platform/amphion/vpu_dbg.c b/drivers/media/platform/amphion/vpu_dbg.c
index 940e5bda5fa3..497ae4e8a229 100644
--- a/drivers/media/platform/amphion/vpu_dbg.c
+++ b/drivers/media/platform/amphion/vpu_dbg.c
@@ -48,6 +48,7 @@ static char *vpu_stat_name[] = {
 	[VPU_BUF_STATE_READY] = "ready",
 	[VPU_BUF_STATE_SKIP] = "skip",
 	[VPU_BUF_STATE_ERROR] = "error",
+	[VPU_BUF_STATE_CHANGED] = "changed",
 };
 
 static inline const char *to_vpu_stat_name(int state)
@@ -164,6 +165,7 @@ static int vpu_dbg_instance(struct seq_file *s, void *data)
 	for (i = 0; i < vb2_get_num_buffers(vq); i++) {
 		struct vb2_buffer *vb;
 		struct vb2_v4l2_buffer *vbuf;
+		struct vpu_vb2_buffer *vpu_buf;
 
 		vb = vb2_get_buffer(vq, i);
 		if (!vb)
@@ -173,13 +175,24 @@ static int vpu_dbg_instance(struct seq_file *s, void *data)
 			continue;
 
 		vbuf = to_vb2_v4l2_buffer(vb);
+		vpu_buf = to_vpu_vb2_buffer(vbuf);
 
 		num = scnprintf(str, sizeof(str),
-				"capture[%2d] state = %10s, %8s\n",
+				"capture[%2d] state = %10s, %8s",
 				i, vb2_stat_name[vb->state],
 				to_vpu_stat_name(vpu_get_buffer_state(vbuf)));
 		if (seq_write(s, str, num))
 			return 0;
+
+		if (vpu_buf->fs_id >= 0) {
+			num = scnprintf(str, sizeof(str), "; fs %d", vpu_buf->fs_id);
+			if (seq_write(s, str, num))
+				return 0;
+		}
+
+		num = scnprintf(str, sizeof(str), "\n");
+		if (seq_write(s, str, num))
+			return 0;
 	}
 
 	num = scnprintf(str, sizeof(str), "sequence = %d\n", inst->sequence);
diff --git a/drivers/media/platform/amphion/vpu_v4l2.c b/drivers/media/platform/amphion/vpu_v4l2.c
index 45707931bc4f..74668fa362e2 100644
--- a/drivers/media/platform/amphion/vpu_v4l2.c
+++ b/drivers/media/platform/amphion/vpu_v4l2.c
@@ -501,14 +501,25 @@ static int vpu_vb2_queue_setup(struct vb2_queue *vq,
 		call_void_vop(inst, release);
 	}
 
+	if (V4L2_TYPE_IS_CAPTURE(vq->type))
+		call_void_vop(inst, reset_frame_store);
+
 	return 0;
 }
 
 static int vpu_vb2_buf_init(struct vb2_buffer *vb)
 {
 	struct vb2_v4l2_buffer *vbuf = to_vb2_v4l2_buffer(vb);
+	struct vpu_vb2_buffer *vpu_buf = to_vpu_vb2_buffer(vbuf);
+	struct vpu_inst *inst = vb2_get_drv_priv(vb->vb2_queue);
 
+	vpu_buf->fs_id = -1;
 	vpu_set_buffer_state(vbuf, VPU_BUF_STATE_IDLE);
+
+	if (!inst->ops->attach_frame_store || V4L2_TYPE_IS_OUTPUT(vb->type))
+		return 0;
+
+	call_void_vop(inst, attach_frame_store, vb);
 	return 0;
 }
 
-- 
2.43.0-rc1


