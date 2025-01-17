Return-Path: <linux-media+bounces-24867-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 24FCCA149A6
	for <lists+linux-media@lfdr.de>; Fri, 17 Jan 2025 07:21:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 42AFD162ACD
	for <lists+linux-media@lfdr.de>; Fri, 17 Jan 2025 06:21:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 40E861F867E;
	Fri, 17 Jan 2025 06:20:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="OYt87qb4"
X-Original-To: linux-media@vger.kernel.org
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (mail-db8eur05on2042.outbound.protection.outlook.com [40.107.20.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81F9B1F8677;
	Fri, 17 Jan 2025 06:20:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.20.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737094842; cv=fail; b=rOvA6gt3O8bi7NFIdEsn5raF8Gd/NaLcx1DmY/35iNU9p3mSqeedE9mFKKnEOwSiuAX1uruyYUfT9vOcV+KyqSBEcuK8mAB/3c1navBt+NdrrFoIkpWbbPuW+DG4EucGodJY2/LMpFkmauP6zns5H+pZYLUBOq2P9zhZ4Ruj46E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737094842; c=relaxed/simple;
	bh=5Qz7Uq5aQPFp53Tv/hB3WSfrqLpmg8IPHiNM+tjBjyo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=jukRn3953ZlV4dSzrUsMfEM10JcKMubrzce4OWrPzetTKg+31V2gchY4kkQWytCnRJnQm4xhhvLfKbUiIQM1PN50ZBNbVNd0lQPPUJcRrdrH6tRtv7Tr9QbT9l8FrvPcNy7c8PoxW4xeClwFp2JBKiht374xfLuBkPjvckQ0/jQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=OYt87qb4; arc=fail smtp.client-ip=40.107.20.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VmFWDo0f/HaBjZSBZTuuVc/74Y5p0gZ5aExXqgGSRQ997tISS/c4fDgDTWK2wOTr0QsKr+7LhhglKloGEX5bcSXwk8v/NAxsBEW7+ZKWXcCeVd4yqsVhUWZoBi6pMB5JfgaVszZm+j8MlKtdNL7GScCNbDIik9QxPRN3KLuYqlmwjAqoHDrzqUW+vQ9csR+Cd7p3HP/WzcmUzzJ2FMUmKcEtcHvakmptqhxukqz1Fie411RQiu2yfYH/Y7iQWY6oIptzLhaFDLphcTrMPS6c0QP2Rv3A1SCnIS4LCMO4XX5ZwTWBEvEUiCXtm/gJK0h+JUMArKX+aGI2+cUYC+xJ6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5jfLRs+kKbGCHafo18mdcRDLnkBBdOhBFl/jQRcVlhM=;
 b=HS4QJfaTLDOEoMlcDZVDZj5xdusPd5x/OK745bWN2ZMb2luOTu4Kf70gX/9IBeiiBaZMINMs81TK/Uyse8RBmjAVLVdcBXEIs59l+C7gAj0ZcpIM1SLqYHBwhsuvYLe+be4dfsW7TUyp2EbSD9u+JVdhkfgU6P09zh2T7N6gVaal6/12F0wuX7D56WMPVm/HFqbzNaR+TloayZ8Hf2SbfwNpCsQ/AjP6xxSRBBnDixWC45/rTMuIbvayyE7917bKxjFR7TByLFx9tWwb5TrD2yFmtf6zxSg1Fb9cgarfUtxGqxp/5gw4o3QfJUR3pwhrhodgxWRDC3u8VZBxGmhAmA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5jfLRs+kKbGCHafo18mdcRDLnkBBdOhBFl/jQRcVlhM=;
 b=OYt87qb4lId+4d5NbxVgJBxM9mC0lEhqZsfnicfuy2orhbw46YRHPX1lb6ORPYwSFky085NxVe4I/6c8eHtD6ZmzaNMncpW4r5Nn7ZoSf8jOyVQts1Hn9fdwvZZtVlHfSuVPqWWUd9dYNuqM/zH5F3HD7bV4VtamjpRn4LgW6XdUFDH9Bc69GkuZzJ0CT1PjaRy/yzJx0KB/lrpftw+bHjcjofMWZ2yrp6+5iWCTmt+mhsl0Wg8NSmd3v8OzzkHvSlY8xRGfRmYSiBS/EqJM/kGUZ7rTPhHe1KkTaZVOEx2o9nnIr+5Qcm++Bv9bu4YauKEck/wWYFlcxb+PyIeCxw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8254.eurprd04.prod.outlook.com (2603:10a6:102:1cd::24)
 by AS8PR04MB8053.eurprd04.prod.outlook.com (2603:10a6:20b:2ad::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8356.16; Fri, 17 Jan
 2025 06:20:37 +0000
Received: from PAXPR04MB8254.eurprd04.prod.outlook.com
 ([fe80::2755:55ac:5d6f:4f87]) by PAXPR04MB8254.eurprd04.prod.outlook.com
 ([fe80::2755:55ac:5d6f:4f87%6]) with mapi id 15.20.8356.014; Fri, 17 Jan 2025
 06:20:37 +0000
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
Subject: [PATCH v2 4/4] media: amphion: Trigger source change if colorspace chagned
Date: Fri, 17 Jan 2025 15:19:38 +0900
Message-ID: <20250117061938.3923516-4-ming.qian@oss.nxp.com>
X-Mailer: git-send-email 2.43.0-rc1
In-Reply-To: <20250117061938.3923516-1-ming.qian@oss.nxp.com>
References: <20250117061938.3923516-1-ming.qian@oss.nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR01CA0034.apcprd01.prod.exchangelabs.com
 (2603:1096:4:192::9) To PAXPR04MB8254.eurprd04.prod.outlook.com
 (2603:10a6:102:1cd::24)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8254:EE_|AS8PR04MB8053:EE_
X-MS-Office365-Filtering-Correlation-Id: 769ca391-603e-4492-25c2-08dd36bf0e91
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|52116014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?AdxVMmI09O8XvmPwhvJMXXSlHquINo2DI4IVClvB6HRyj4tQUwunYd5ostpp?=
 =?us-ascii?Q?JLuBo4OIEU9PqAIBxiyDmBlRBPWLIKvTjY8VgXBXXiyTwP1MowWDZXb5LCrQ?=
 =?us-ascii?Q?+RyKglJqJyN1AKUHNy9aRQtRLTXUmrnMsQsB4GAJMk2Y+JM3k22mI5LPDs3c?=
 =?us-ascii?Q?ahdUfJD3mkhj1Y1GecvHdGjEz7JRt/lNqOG6NnALqNKljkcbPbTjIixnwW/w?=
 =?us-ascii?Q?lNA/RNBeaUQ1Zr7ee97BuxM2aGt2FWGzhFWqRoTr+62w4YLNtssRTnMWeOfI?=
 =?us-ascii?Q?3LRGT+L1z34F/Rt5JM2dFBqtWpM8wcjVO02xbnN+5RxvhNxdjqfN9VjyRprx?=
 =?us-ascii?Q?LBhJhkHz4gkHgCuSHT7bST2/hwx+YJdumvI6hGDD57xB35EY+XK7minZ3NAU?=
 =?us-ascii?Q?XQTQyCMEvpn5GhqeN1c+CYaVuOld9rhb2yALcDVpBCXj06Chx8g7tfuNNasa?=
 =?us-ascii?Q?QwliCVW9oPx0FceKoebBjHwyNk1tgIHu9SvcXdXwWczBNHGNoDma/2rBGdjG?=
 =?us-ascii?Q?UUW6lwMCzRAz/bTL8r/T/vnKHdEJcHLiEUW1IJelMiz+wdFMe9jhsIXI6KTn?=
 =?us-ascii?Q?tSdHwG8Oa2NUTAhn0RSJzKV+SSAL5P1NYvC36+uiXzZvXjuEkC8fuegnKjXL?=
 =?us-ascii?Q?5OT+8etndUCXikjJJ+yk+K0Bg5NeSJSZqSQbFdi8Rq+vVEVobxlKed8vcEi7?=
 =?us-ascii?Q?lmwrEov0LxcHa8oyxi0yIeDCkDEm7ljPNjkHwdACQ8zXV4eYQM2jrMFVU2U7?=
 =?us-ascii?Q?c5YkjHLnsQlmghk3ZNyGaXWyDl7LdD4nZlvnKqvyz6NZHjH4i4csKwFkhiGt?=
 =?us-ascii?Q?Bj4Pq+XHFEkS5udNqzEVrZ0Utz9C98IqcXS0DVhfPrsP2w2Plc7k11fObl2R?=
 =?us-ascii?Q?bRb96EjTHlY0cjFJH6E4i4b8lkChuPgYY4lp5LwoIhko6RYlS3F1SnhdC51B?=
 =?us-ascii?Q?kLDQM3pztn9lLBvQhQWi8MTpOj2ysTSBSObfFmym4vzVSd3zCNrK0d6/ZOm6?=
 =?us-ascii?Q?7otcmLeg26bFQha6wDTf1eLV1cHQWwZ3eowxqXUnJnFuxRiYu0PtoU1SESC4?=
 =?us-ascii?Q?USUZXuCNJzIyt2S/WR4Nqey8KgfrXJqPO7+1fUcpBZ7pQZs/B98oIXrnOmy2?=
 =?us-ascii?Q?tmXw0XCgUynAuY5iT8SIJGyxoVYZmkKXH49EUOPQYLZOOv8+K7VeDSed1V4i?=
 =?us-ascii?Q?6ohkri7iKFWfyQbLSVnOGGX27aZWXr6DG/CQeUaW1nEAeVPktTiTC/03oy4O?=
 =?us-ascii?Q?qBY7E5n3oPXvqbUF7vODa1IWXEsjm8+x/o2DjGR08Jze1IcFGF0jgv+Dlx1j?=
 =?us-ascii?Q?bPCgQ27mhi3s34QYjSoLKZyJRcFFeegX53zJStzur5GMMFsw4pUwgpraBrf2?=
 =?us-ascii?Q?kC+a4mdqeoREGfFNkkmv2DZLuoYI3eAUGSHjmkXYceGo5YeVrRRvV7t7AVfM?=
 =?us-ascii?Q?xco7N1awvGOAMmpHyrh00IRsvR72S+7Y?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8254.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(52116014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?cK8xZngpfAS+QSMZaV5Qkh/+b0As8P9F2zYKGatxZyiRqn4jZFHnBqGIPk/6?=
 =?us-ascii?Q?hx46TEXbyuIGAjHac+2FsP5I4CtnmAYLFByBBdsvI4ZsZYel0Yqif5PfL4Fc?=
 =?us-ascii?Q?e3BNeMnhDwm/wS6EeH0RgLOTawb5R1qQqG8Gd2WrTYjByPEaQi98MZe20DwJ?=
 =?us-ascii?Q?KeIoFJcy9G+MMEzPNnv/RkCZclutorqX+gQB8Yo/K8XGxCIBKwNOxYezeUyq?=
 =?us-ascii?Q?K8SXxCzI74OT2Wzz5dzKkhhC6rY6l83rn06I/P2sOwp/ew4BKKbwJ+6aAj+N?=
 =?us-ascii?Q?j3IQ/pQ/Z0eMeLO1QEZpqNKHFPuL4gykIIMGhQ5XdkTpVV6rT+lah9P09Jzl?=
 =?us-ascii?Q?d32lXgjwj3AfvCQm0ciaDtnUvFIwr57LHaI/VLuL16pf2IBeo/a630DViuWE?=
 =?us-ascii?Q?CoDmkD6clw2s9pr6r7aNIBdqT9hvhtdy3KWFuDyxZmi4wJDGkwvtl30HsHcF?=
 =?us-ascii?Q?18gaRHF1Qmx/gHulAq0Bgyq4tCKaFMfxxIL2gvQj2hPQ+T5H6C3IXztc10MT?=
 =?us-ascii?Q?reHNggEmbAifAYmWHEjC7G+UeEAVoPVI05l2XCMfJLNkzzwl1PcwM3A5JNP2?=
 =?us-ascii?Q?ci5kgfxPWRcdBUG7XiHpZBHZplFvwO0W20mUwSKypHAYPibhjAlNk/OTM2yv?=
 =?us-ascii?Q?bm1yzWwXWipsu8/7mWaC2duRsLbbZpKzIJ+c30JgxUBbSsOFvar0u7bym7Z3?=
 =?us-ascii?Q?JIASsKVFRYCt92FssALYsKXJ+b1cyGlNLyynR+GMNDnmpTKMO4s46MAIOyh5?=
 =?us-ascii?Q?xCziy+lv6E0/x6VCfRSN79FelXFnuf2tyBNzJqRbVM/t4hTht2PImGEn0hvD?=
 =?us-ascii?Q?w0mVOKeqY7JWu/9EXd4COgt8U39BdWpTcjYGC4DgxkIEUFdWIRs4qwVEduE9?=
 =?us-ascii?Q?y/Xlxvby7NX/ZtXev+hpckaQlNwLjP6ktaiHtvoU0YtHzrsC2hFFCSLaYTkB?=
 =?us-ascii?Q?3a72CjZVzyEx3AGvYx/NIDD8pcuTdbl4038O9CCit8HxjhhVAO1KUv633aCG?=
 =?us-ascii?Q?tOSQL16mVfOpPx1MtKrzFNc2coY69G0kOthXePwvs1r0og+lm0EhN0XIy5Ew?=
 =?us-ascii?Q?pwRAQ64/KQxkjNhIo1ai0TTi4jVOzju2PyrstX8iYliJ5OxASCeCKIczWQiM?=
 =?us-ascii?Q?de+5WTFoOkZYnf1LMUbB2L/CWvaTdgRRvmdo+BODEK6b5VXycuXyvISqS9NS?=
 =?us-ascii?Q?UL5SL1iAHkykQiWPctBmKJRvlClslFmjyJAfeqpoPJaMQPjiQ2cb5i7cq1uu?=
 =?us-ascii?Q?0PZDVSGL4WITO4fSqBuiGjRYruM/fBlW8GVoNN117/vf5SZdohquzbBYBacx?=
 =?us-ascii?Q?1ekMXiZaWcVIwuZZAD9/YZAhf2NlVLqt00NwiD5uOncZ+zpKG7tanLVPaBGE?=
 =?us-ascii?Q?Z1/9UXuHSbr7/cMYLsq91x9PX9HQ/o/oZgM56LMjMNvxfZmt5UOKeWB+Il+V?=
 =?us-ascii?Q?BkCpoTbPR8GMhoMD8TSekNQ7xJ7P+juNZ/jP8vP11vkiQjqqDx7wqh4nelIM?=
 =?us-ascii?Q?07kqgGlqMbGxO6HEfCWAlxonr8wLc2qsjQccUKqbJWry3v+ZvYFKKqDj9KRz?=
 =?us-ascii?Q?1BosRIvHPNx6fJ60GOTOrPmVnGArouaL/FkXQZAN?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 769ca391-603e-4492-25c2-08dd36bf0e91
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8254.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jan 2025 06:20:37.0151
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2pjn5/LBraNnClm5ieD3tSH7hEMs/6TzjM1cYm2m925/7hJUoXLzRETC2BgPyZ85rDeS2aCiHDo55jISId9qfw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8053

From: Ming Qian <ming.qian@nxp.com>

After encountering a colorspace change in the stream, the decoder
sends a V4L2_EVENT_SOURCE_CHANGE event with changes set to
V4L2_EVENT_SRC_CH_COLORSPACE.

Then the client can handle the colorspace change without any buffer
reallocation

Signed-off-by: Ming Qian <ming.qian@nxp.com>
---
 drivers/media/platform/amphion/vdec.c     | 89 +++++++++++++++--------
 drivers/media/platform/amphion/vpu.h      |  1 +
 drivers/media/platform/amphion/vpu_v4l2.c |  7 +-
 3 files changed, 63 insertions(+), 34 deletions(-)

diff --git a/drivers/media/platform/amphion/vdec.c b/drivers/media/platform/amphion/vdec.c
index 3b848ac2cd0c..868a96d29fac 100644
--- a/drivers/media/platform/amphion/vdec.c
+++ b/drivers/media/platform/amphion/vdec.c
@@ -369,12 +369,16 @@ static void vdec_handle_resolution_change(struct vpu_inst *inst)
 	if (!vdec->source_change)
 		return;
 
+	if (inst->changes) {
+		vpu_notify_source_change(inst);
+		inst->changes = 0;
+	}
+
 	q = v4l2_m2m_get_dst_vq(inst->fh.m2m_ctx);
 	if (!list_empty(&q->done_list))
 		return;
 
 	vdec->source_change--;
-	vpu_notify_source_change(inst);
 	vpu_set_last_buffer_dequeued(inst, false);
 }
 
@@ -954,10 +958,11 @@ static void vdec_stop_done(struct vpu_inst *inst)
 	vpu_inst_unlock(inst);
 }
 
-static bool vdec_check_source_change(struct vpu_inst *inst)
+static bool vdec_check_source_change(struct vpu_inst *inst, struct vpu_dec_codec_info *hdr)
 {
 	struct vdec_t *vdec = inst->priv;
 	const struct vpu_format *sibling;
+	u32 changes = 0;
 
 	if (!inst->fh.m2m_ctx)
 		return false;
@@ -966,27 +971,41 @@ static bool vdec_check_source_change(struct vpu_inst *inst)
 		return false;
 
 	sibling = vpu_helper_find_sibling(inst, inst->cap_format.type, inst->cap_format.pixfmt);
-	if (sibling && vdec->codec_info.pixfmt == sibling->pixfmt)
-		vdec->codec_info.pixfmt = inst->cap_format.pixfmt;
+	if (sibling && hdr->pixfmt == sibling->pixfmt)
+		hdr->pixfmt = inst->cap_format.pixfmt;
 
 	if (!vb2_is_streaming(v4l2_m2m_get_dst_vq(inst->fh.m2m_ctx)))
-		return true;
-	if (inst->cap_format.pixfmt != vdec->codec_info.pixfmt)
-		return true;
-	if (inst->cap_format.width != vdec->codec_info.decoded_width)
-		return true;
-	if (inst->cap_format.height != vdec->codec_info.decoded_height)
-		return true;
+		changes |= V4L2_EVENT_SRC_CH_RESOLUTION;
+	if (inst->cap_format.pixfmt != hdr->pixfmt)
+		changes |= V4L2_EVENT_SRC_CH_RESOLUTION;
+	if (inst->cap_format.width != hdr->decoded_width)
+		changes |= V4L2_EVENT_SRC_CH_RESOLUTION;
+	if (inst->cap_format.height != hdr->decoded_height)
+		changes |= V4L2_EVENT_SRC_CH_RESOLUTION;
 	if (vpu_get_num_buffers(inst, inst->cap_format.type) < inst->min_buffer_cap)
+		changes |= V4L2_EVENT_SRC_CH_RESOLUTION;
+	if (inst->crop.left != hdr->offset_x)
+		changes |= V4L2_EVENT_SRC_CH_RESOLUTION;
+	if (inst->crop.top != hdr->offset_y)
+		changes |= V4L2_EVENT_SRC_CH_RESOLUTION;
+	if (inst->crop.width != hdr->width)
+		changes |= V4L2_EVENT_SRC_CH_RESOLUTION;
+	if (inst->crop.height != hdr->height)
+		changes |= V4L2_EVENT_SRC_CH_RESOLUTION;
+	if (!hdr->progressive)
+		changes |= V4L2_EVENT_SRC_CH_RESOLUTION;
+
+	if (vdec->seq_hdr_found &&
+	    (hdr->color_primaries != vdec->codec_info.color_primaries ||
+	     hdr->transfer_chars != vdec->codec_info.transfer_chars ||
+	     hdr->matrix_coeffs != vdec->codec_info.matrix_coeffs ||
+	     hdr->full_range != vdec->codec_info.full_range))
+		changes |= V4L2_EVENT_SRC_CH_COLORSPACE;
+
+	if (changes) {
+		inst->changes |= changes;
 		return true;
-	if (inst->crop.left != vdec->codec_info.offset_x)
-		return true;
-	if (inst->crop.top != vdec->codec_info.offset_y)
-		return true;
-	if (inst->crop.width != vdec->codec_info.width)
-		return true;
-	if (inst->crop.height != vdec->codec_info.height)
-		return true;
+	}
 
 	return false;
 }
@@ -1337,20 +1356,25 @@ static void vdec_event_seq_hdr(struct vpu_inst *inst, struct vpu_dec_codec_info
 	struct vdec_t *vdec = inst->priv;
 
 	vpu_inst_lock(inst);
-	memcpy(&vdec->codec_info, hdr, sizeof(vdec->codec_info));
 
-	vpu_trace(inst->dev, "[%d] %d x %d, crop : (%d, %d) %d x %d, %d, %d\n",
+	vpu_trace(inst->dev,
+		  "[%d] %d x %d, crop : (%d, %d) %d x %d, %d, %d, colorspace: %d, %d, %d, %d\n",
 		  inst->id,
-		  vdec->codec_info.decoded_width,
-		  vdec->codec_info.decoded_height,
-		  vdec->codec_info.offset_x,
-		  vdec->codec_info.offset_y,
-		  vdec->codec_info.width,
-		  vdec->codec_info.height,
+		  hdr->decoded_width,
+		  hdr->decoded_height,
+		  hdr->offset_x,
+		  hdr->offset_y,
+		  hdr->width,
+		  hdr->height,
 		  hdr->num_ref_frms,
-		  hdr->num_dpb_frms);
+		  hdr->num_dpb_frms,
+		  hdr->color_primaries,
+		  hdr->transfer_chars,
+		  hdr->matrix_coeffs,
+		  hdr->full_range);
 	inst->min_buffer_cap = hdr->num_ref_frms + hdr->num_dpb_frms;
-	vdec->is_source_changed = vdec_check_source_change(inst);
+	vdec->is_source_changed = vdec_check_source_change(inst, hdr);
+	memcpy(&vdec->codec_info, hdr, sizeof(vdec->codec_info));
 	vdec_init_fmt(inst);
 	vdec_init_crop(inst);
 	vdec_init_mbi(inst);
@@ -1379,7 +1403,12 @@ static void vdec_event_resolution_change(struct vpu_inst *inst)
 {
 	struct vdec_t *vdec = inst->priv;
 
-	vpu_trace(inst->dev, "[%d]\n", inst->id);
+	vpu_trace(inst->dev, "[%d] input : %d, decoded : %d, display : %d, sequence : %d\n",
+		  inst->id,
+		  vdec->params.frame_count,
+		  vdec->decoded_frame_count,
+		  vdec->display_frame_count,
+		  vdec->sequence);
 	vpu_inst_lock(inst);
 	vdec->seq_tag = vdec->codec_info.tag;
 	vdec_clear_fs(&vdec->mbi);
diff --git a/drivers/media/platform/amphion/vpu.h b/drivers/media/platform/amphion/vpu.h
index 76bfd6b26170..d8100da160d1 100644
--- a/drivers/media/platform/amphion/vpu.h
+++ b/drivers/media/platform/amphion/vpu.h
@@ -272,6 +272,7 @@ struct vpu_inst {
 	u8 xfer_func;
 	u32 sequence;
 	u32 extra_size;
+	u32 changes;
 
 	u32 flows[16];
 	u32 flow_idx;
diff --git a/drivers/media/platform/amphion/vpu_v4l2.c b/drivers/media/platform/amphion/vpu_v4l2.c
index 74668fa362e2..37ef706c29dd 100644
--- a/drivers/media/platform/amphion/vpu_v4l2.c
+++ b/drivers/media/platform/amphion/vpu_v4l2.c
@@ -96,13 +96,12 @@ int vpu_notify_eos(struct vpu_inst *inst)
 
 int vpu_notify_source_change(struct vpu_inst *inst)
 {
-	static const struct v4l2_event ev = {
-		.id = 0,
+	const struct v4l2_event ev = {
 		.type = V4L2_EVENT_SOURCE_CHANGE,
-		.u.src_change.changes = V4L2_EVENT_SRC_CH_RESOLUTION
+		.u.src_change.changes = inst->changes
 	};
 
-	vpu_trace(inst->dev, "[%d]\n", inst->id);
+	vpu_trace(inst->dev, "[%d] source change 0x%x\n", inst->id, inst->changes);
 	v4l2_event_queue_fh(&inst->fh, &ev);
 	return 0;
 }
-- 
2.43.0-rc1


