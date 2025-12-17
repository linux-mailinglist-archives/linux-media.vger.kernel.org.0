Return-Path: <linux-media+bounces-48948-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DD7ECC5DC2
	for <lists+linux-media@lfdr.de>; Wed, 17 Dec 2025 04:04:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id F0E8B304EDA9
	for <lists+linux-media@lfdr.de>; Wed, 17 Dec 2025 03:03:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2DFBC27FB1F;
	Wed, 17 Dec 2025 03:03:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="mlPz/jXD"
X-Original-To: linux-media@vger.kernel.org
Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011047.outbound.protection.outlook.com [40.107.130.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C25B28506A;
	Wed, 17 Dec 2025 03:03:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765940607; cv=fail; b=M+p8JQ1zEjO3Odnglk8JNtGSm2M81lXVsENX/FGNmd6hRYtYLJqz0jD7WceKdtrOOdc9VT7JkXldI7kvtm+Zs32IRWBTmEcR4bcMko44kmTIGslfAuGVNakoQ/gwKSDC9W3BoOUQAV12S5pjwXrzHEr6s4+kALV45DskuWPkKxU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765940607; c=relaxed/simple;
	bh=pqjivxbALAQ8Erv9x9IwxGPBDqkQAmzUEpRYyyolCHM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=dx3rD7wumI6NlbF4QLnG6lJzZGozGgfe4SLUE3/33tOztf7KUpoK02WlMOswe0fOzRIwRYN4NYxDwkjYZaDaB9qM5D1utM1yTXO7DAqCeH/rCKpR34uoCKszEb2fmz/aT3YBzBfIMyScHUjZ1zC/HR7CGCuFy/CQm1BJHTsMCJE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=mlPz/jXD; arc=fail smtp.client-ip=40.107.130.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sQ6gY3QYwNsonP+pyCwFpcIl0xgwAnv6Iv5ewFS5rDfyW+YhgQKvWf1hoHjeu0lpG+VZ1NNbfW26jd0YhlVcpI+Ebx+QA/eBXCkQJFRUDwKKuNKPkUpYHYhCTcqaywtz1lXvA6laPgwf7TDrPPLn0xEuUWsKOstrBhQBay01NIPNj5IL0UntB2IlSNw8zTBTvYHbNj5G7oAcOukU1cJdGAmh/+DaZvfxwg+gXJOSMPhYNga2kzaHUfI4mDKTfnPfuqUs90mXtAusaNZQYfJVtZ3moXK0oXNiOSauH7giF9Ah3k6PoE76+A2NHBV/Ms12UZHudWDwE3vr49cyFF0bqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=n3Y2beiXgD/qjT39Jm7KaveEIbKT7rWihKdOIMH5a+8=;
 b=v7vM/BimMVz0L32Li9YbhC9u/SjfZCu1qJFmZbBXUtnvV0bLH11WmJFThnm9qdG6KSmD/b9BKNih3MdIqCk1EwH7A5YsRU/WeNajksa6b1Fvc5B/Ugnvwsj1wCSAO8VTrbUQmQuN/V5F39P1/inrKU74EHZc9ltz9GI3J6zJpRL2MjnSuOI08Hqx9ylWO6ddczA60zz6sNpK8weOWLK2l8bpr5fwvMHq4zLTBxjW5A6tpVy1i7qZISR4MK+c2hR0czISexdyuxwpK9GOCftHbowwDDV360f4AiRxMUTafa/cGtVVyQ+qvzk8wvjz6ewUMqPZGRnT2rM7L+ScixuDYw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=n3Y2beiXgD/qjT39Jm7KaveEIbKT7rWihKdOIMH5a+8=;
 b=mlPz/jXDs+9ZMWPOccWMVaTn2SKGL50hX01bwjAcL6lvSgoQhwY88frGVkGAvUSJ3V6hSWX2GClmZ7V6Q4xEPoHUokBTI8WZE/SMzGfuvFS0iWwXR5VK6W0T6TwhxRMFP+/xRWzGHW7VRyL6Vud05p4bzBM2doHucHj7TAm8KNvDFORic4NmoFD45gClx9wpM+qqotVIm7GSpaEcynhUorXaasfno6UYi0+JDfXOejJMQ9jXb+tojQX6iqVSWtIm/vJLxC0q4p3p+sI83JRWZ8hVCCrGLsAXP9Sqo4fKcxsSji6Xx+LXWtmnyMowbxwZ/JfFQHX4bN1OeLU/9gadbg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8254.eurprd04.prod.outlook.com (2603:10a6:102:1cd::24)
 by AS8PR04MB7864.eurprd04.prod.outlook.com (2603:10a6:20b:2a4::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.6; Wed, 17 Dec
 2025 03:03:21 +0000
Received: from PAXPR04MB8254.eurprd04.prod.outlook.com
 ([fe80::2755:55ac:5d6f:4f87]) by PAXPR04MB8254.eurprd04.prod.outlook.com
 ([fe80::2755:55ac:5d6f:4f87%4]) with mapi id 15.20.9412.011; Wed, 17 Dec 2025
 03:03:21 +0000
From: ming.qian@oss.nxp.com
To: linux-media@vger.kernel.org
Cc: mchehab@kernel.org,
	hverkuil-cisco@xs4all.nl,
	nicolas@ndufresne.ca,
	sebastian.fricke@collabora.com,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	linux-imx@nxp.com,
	Frank.li@nxp.com,
	xiahong.bao@nxp.com,
	eagle.zhou@nxp.com,
	imx@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v4 2/3] media: amphion: Clear last_buffer_dequeued flag for DEC_CMD_START
Date: Wed, 17 Dec 2025 11:02:22 +0800
Message-ID: <20251217030227.1546-3-ming.qian@oss.nxp.com>
X-Mailer: git-send-email 2.48.1.windows.1
In-Reply-To: <20251217030227.1546-1-ming.qian@oss.nxp.com>
References: <20251217030227.1546-1-ming.qian@oss.nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2P153CA0004.APCP153.PROD.OUTLOOK.COM
 (2603:1096:4:140::23) To PAXPR04MB8254.eurprd04.prod.outlook.com
 (2603:10a6:102:1cd::24)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8254:EE_|AS8PR04MB7864:EE_
X-MS-Office365-Filtering-Correlation-Id: 56051f4a-d9ab-4e19-459f-08de3d18d588
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|7416014|52116014|19092799006|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?tnQfSBaVXS4YdIbZ6nVTLSNXJaL+Nz9Vd3cnd039GKNTLElPCeW2sFE3y/1d?=
 =?us-ascii?Q?DrxeA5ins7nyg1SyVMxtRcdNyH3dIg/F0/u3oDqyphYFTBOwAcwbEfcy7bDZ?=
 =?us-ascii?Q?mmOUH+fcIVc5KIIX58CM/uRPW/E/MU5YZuTTUiUkSny85uhA62jMqQzSMxvD?=
 =?us-ascii?Q?Ns+/sh3Hge8qgEBVEexv32FZ8Ewh5sO4M0ThsadKFPGLzt9SX7SsH/Ml4DB9?=
 =?us-ascii?Q?k574KhtOOiEaxG13/ARkl7etdgO7O48enI4EGPDOyeBFGN6tn6yqMOXPUBTN?=
 =?us-ascii?Q?mWqC37d1SuZ8ZN+bT4yZ9xeSm1htd+iyCFlk7bdp8Sh2J493RqCc7mjczmlH?=
 =?us-ascii?Q?xfCfcORgV3ZZ2SGAGfW3O/iSJGm7WPz29vJ+fhjX77R9Zu2cnUyNN+6iCxrf?=
 =?us-ascii?Q?8EX3QS560Mas4lkIRWN+wCzRyMLV2BSS5edO/H3IgkJki9wKnMZ5eFgaQBb4?=
 =?us-ascii?Q?gCbT0yJZT71DuIPxmTHAWxh8jn3RE6nAj4QcLR5EFKWVCqiDkVVuRFmVrI6Q?=
 =?us-ascii?Q?DNOPqZcUaxMNGdsBaQtNdzGNupA4+ntmjN2n/q0EK/DH6Y7X4SI4ElDrniD6?=
 =?us-ascii?Q?qZ9QTMMN+KdAx1iJV3k/ajMWOdPQznXL5ygGEerL6igcAyIOqVUe7vfMQYs8?=
 =?us-ascii?Q?vN2czy75UIBe71cnNkN3Cf9AtkkZ2mEbFUbPrWjcDvqnVS9Ikx4x4Ag/bZl/?=
 =?us-ascii?Q?iHao0tHnS3tGRDunQzU0nPcv+yI11PjZ6NrR+A0pOtNttN+L7zTNHnej/rPL?=
 =?us-ascii?Q?/maTZQ7WNNKsmLPOZPxIPYxG+Wyky/nuuo2BpEAUAXj4SjaNjOyDalKqjr8g?=
 =?us-ascii?Q?X4/6USAdgxT+WpDscg6fuovBlj1ZBAXePHcphPKjZjtZ7huiUXQGM0FnfkfT?=
 =?us-ascii?Q?saXFDGwk5y7OIiiVEaayzMZVDvKcWw6YyfOrnt8zGiZTT7UIsQwenxyuxgF3?=
 =?us-ascii?Q?/12pea7H6WWHcjpQIrScCuFt6p4C6V8srQ0GkSwUEgpotemqwcHxjBlNmqNH?=
 =?us-ascii?Q?n7OlqCTqmMZgqAIG9wIrrOvqU3RbQJg9A6+xYQ8o8x6Vc6E9zTAdjvt0Zppt?=
 =?us-ascii?Q?978rYYoNHEq7DtpRtFPuinjEMZl6BHmjUEKwPtaNtcI5SG6UvCqSE50Fm95w?=
 =?us-ascii?Q?vhqFAb1tTuF7P5WykwWeyY3OfcqE/Xc493HezRur++qtTEdyHawh+BPl+cel?=
 =?us-ascii?Q?/gqIIOAgA1v5pWHuIuBu/Pp6NOmXTs+BQYlMIb4FGVzfPk1xowmqYiH5EVHU?=
 =?us-ascii?Q?zAcTtlHi+nj1M6/eFudWlZCtAXOtVFSSzDW1+5ZgGTC71pEc4VydZQB7KyZR?=
 =?us-ascii?Q?nMZhfAKVoduKogh5zH5DZZeAKEYmjfkvgO7pnNQnP0K6yrs5o3DTEwSoYzKi?=
 =?us-ascii?Q?LysL0YC1M5/GoASAZlxZwUUefrCNrg089O6PaaDVGdR0IMJOQJBn/lR8WAIN?=
 =?us-ascii?Q?gSNujyPPPBPvo2HRnvHPtwH0wcHt16+hAgusYVlXP0wSleezZOd4BYCD1GOP?=
 =?us-ascii?Q?Muv1sFRzXsbnZRuh2qTmmuU/RRwjAJBjNUew?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8254.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(52116014)(19092799006)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?hJ676j941gcljKjxzMJi/YeS8EDrcc1DwlyOZp3RAS3RNRJz6gxtZszuREPl?=
 =?us-ascii?Q?u5XaDc/3Q0xli0rBQKviejiX/6uIxpUUG0mCfl5LP5b9BcjrsS9bC+tp5o16?=
 =?us-ascii?Q?QnMIjcUWYp5zHU123VRxmPS1N2C3BI9Gk9S91O7PqLv0OLNS4oFZbisCwMX7?=
 =?us-ascii?Q?kHvYj1x+yC8JJ+BOP2RTinjwc2HTB/zxjkm4gJJ4RafAHeVRXhKysozyptL0?=
 =?us-ascii?Q?B1hq6X7SLoWreqB/iEeHH3wM5kz+6fTUD7a8QjiU8F2Ct2oCa0BPEzOi8ps4?=
 =?us-ascii?Q?RxDmSPbrDlJ6wTJ2+yFmW8RAQJR3y7A0+V1q01jFm/bLhfHVG3vXKi3r4Oo1?=
 =?us-ascii?Q?cqwjzHAXqurvRiL0U6trlVqLQiLsdhy+jj0y1lmqZ6dTwuLr+LFp1PxKGqjG?=
 =?us-ascii?Q?AgDAi0X52Yrq22wPQgeDLQ9pwc7msd9y6BeTJ88N2rloAqKF0yEhFf2SQ3VR?=
 =?us-ascii?Q?ZXhuzdKg+tfPXgfarO7Z9irE4PCyIgNuU70JNE2BuD8DD8ugluc6lmKIYeFW?=
 =?us-ascii?Q?BFjL47I8mPo1dBrDqulxOqLmjxvwxyyG7Urw6Bv9+Fp+yndARydMqzH0ZlBf?=
 =?us-ascii?Q?sVM7TrzwQVha0EH0pKIFa4rDNVr7Z9lcoKAIIhZQoJnrRJhd9QseOXGpdQ/v?=
 =?us-ascii?Q?OiEGnKnZwXKlv/ryclSLZ/eHYbpgLmm7EtMhMVFv6qD0grHPi1SkC6Y0+cuJ?=
 =?us-ascii?Q?7r1COuCfDSOZUPk+rmnEXmawahVaCprbTwiXMsGp4jBF/81mOz75wNRcNI6C?=
 =?us-ascii?Q?U7CJEg47RSNfoTax/2n2nq1OhhnC44T/Ljo8XdD+Sx2S0NMO//QueZQRAPEK?=
 =?us-ascii?Q?wY6W8KZDKRS/B2AyaD6OubCRR+Z+2HXa5O/w9mv95qwMVmdqAbt3e6EU7H54?=
 =?us-ascii?Q?zZcgpjBMaaUoopopOfl3ewSYrBN0yStet3y7PmhdvUb0GL8etNzL4+IqjkgG?=
 =?us-ascii?Q?j8/dt+RpWDVQUs2PEWOnnsCeKyhof+cOCmivK45SBsMm+r0FORXKWElmR/1k?=
 =?us-ascii?Q?pOROQFOnk3EO0Y+5aDySuEgK/6LTGm7Qr+OH7ZfuRN0FfZz7E6Js0WxzBkTQ?=
 =?us-ascii?Q?b9E4+khEDFJhoWl7B9AUlDa0CBR+EMyJFvX4uGWblBhVIlXGjojAD0mE/zhx?=
 =?us-ascii?Q?wfHwKk2/TK5++coFFoq70ZZhyEdAjUU8UcjzgTk3fOgncfiiKhh09HNzkc2x?=
 =?us-ascii?Q?iJrZEAgCD6AeBKEEqMugt6ms2PIb2zgqkEbVld5KHNNIlQz3bZ9EHyJtsaXb?=
 =?us-ascii?Q?sfaXSPol3zlGrMgY4scYvq39WPPAGhzFbSUp1ZuUBHx/1ik6CUFtsuNaTUZM?=
 =?us-ascii?Q?9UurH4RDjYIPAlFRigQJlup0l6j1EAfMFYebQzUmj6PHD8b+2DEhA6CNCChI?=
 =?us-ascii?Q?Zwd4dHscUmmPQhC1vha7zicmzC5mnKz1dWdcMEcSIr6W/+wno7UHY+I7/aoc?=
 =?us-ascii?Q?TBhdIfH54D24h0jWX8jBWDxbXPArpYfTDsgwTp/lq8O7ThufA5FQjmYdzeEN?=
 =?us-ascii?Q?OjEuRFBB8G9Z9JkcjQq3LvSMQx313z6pwPfe14yy2I9e/Xh6JPsnfYRiMMlS?=
 =?us-ascii?Q?89HDlZ/dn4aYCpdpMfzY7F+oKTpp2QQqZppoPEJY?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 56051f4a-d9ab-4e19-459f-08de3d18d588
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8254.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Dec 2025 03:03:21.0535
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Dy1Y8F01ofyOnRhRNZWelCbUOUS9004HeU96wsm9o3Kr1sqKTCWZKW6JYYhKWQGdwsjGQ2CagRpM91oj6oiyzA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB7864

From: Ming Qian <ming.qian@oss.nxp.com>

The V4L2_DEC_CMD_START command may be used to handle the dynamic source
change, which will triggers an implicit decoder drain.
The last_buffer_dequeued flag is set in the implicit decoder drain,
so driver need to clear it to continue the following decoding flow.

Signed-off-by: Ming Qian <ming.qian@oss.nxp.com>
---
 drivers/media/platform/amphion/vdec.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/media/platform/amphion/vdec.c b/drivers/media/platform/amphion/vdec.c
index c0d2aabb9e0e..f25dbcebdccf 100644
--- a/drivers/media/platform/amphion/vdec.c
+++ b/drivers/media/platform/amphion/vdec.c
@@ -724,6 +724,7 @@ static int vdec_decoder_cmd(struct file *file, void *fh, struct v4l2_decoder_cmd
 	switch (cmd->cmd) {
 	case V4L2_DEC_CMD_START:
 		vdec_cmd_start(inst);
+		vb2_clear_last_buffer_dequeued(v4l2_m2m_get_dst_vq(inst->fh.m2m_ctx));
 		break;
 	case V4L2_DEC_CMD_STOP:
 		vdec_cmd_stop(inst);
-- 
2.52.0


