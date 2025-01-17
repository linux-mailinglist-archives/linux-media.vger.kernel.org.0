Return-Path: <linux-media+bounces-24866-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 51B51A149A3
	for <lists+linux-media@lfdr.de>; Fri, 17 Jan 2025 07:21:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 65759188DCBD
	for <lists+linux-media@lfdr.de>; Fri, 17 Jan 2025 06:21:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A161E1F866B;
	Fri, 17 Jan 2025 06:20:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="MNcbsd9T"
X-Original-To: linux-media@vger.kernel.org
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (mail-vi1eur05on2055.outbound.protection.outlook.com [40.107.21.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBA331F7917;
	Fri, 17 Jan 2025 06:20:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.21.55
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737094836; cv=fail; b=CHs14SZOx/OGwJRyL6uZKiSe7QB6+a17Vd2Ot/QukGKJ1NOBmTKWH7AB278fywQiVvPCcQo9dtoU28SY0EkniaoumLpan+ijjmoKU03g0HWKrCvSxSWDGu8klr1OscjVoLdXapzn5n4t4e+RChxMSDXishT3jwfSGgfLyBGzlPE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737094836; c=relaxed/simple;
	bh=4nC5XC7apss+mVEZFrkc3s5062uZWZZUVeFUr9CVFyE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=o+ZEtOzVow/n7yti01WD8h77jPmowvvm+nPTVTDDgCnWRU/r1Zt0RpFc39PMaTI7UCAFloI9S62YgYIqfnW/kwLE39ABSBS0CGgKEXxNDiQkrJfD1GoFuVshL9nxzopssMnmKgFBoKa6Kbv4J3lDNcnfT2VeWl/MV8bmem8Y2rI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=MNcbsd9T; arc=fail smtp.client-ip=40.107.21.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YJBcBiMIynikvVru+3xS33eSyuDPwlyK2A/iWAOeCs/hu2H31FvUCccHEnn7XlBQl+AlQlz2fJPUasSwdwgmRMeC4Rd0WGj6RgVvsr7Zi1JLCAHgFZCH524qu0Od4BJnmhfUkzL+Ihjv6QzGE/enRoR6oMarOAALdW9xIyspDerWHDEUme6zeY0Y4jcaS3BtzELxOS2ZCZRc/ZXFr0Rkf3X9r65V0KrvFSNB7lc5wOSsLpggeppmJPs6e/ev2TDVlnNPXI3vgpkiLrkvEELNhlDxNAH3BZa0FuuuMfHgOtXxAZCPtjdFLQIii1QA5g7aBtN2UYJ4hsA63Kuac5yWFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pqT49cWEOwL37ri1ItN64lrYXwMnh/FwPmQ5/BC2/GY=;
 b=Qh/Zzd29aJGsbfiqcS/2A5tCyiqwJPR9CXyv5ZOLkyqnRyAa83p1/+brfPw7mBSZ8qFavK8wRGnvGvcQaDIIevddVjNcVDwSB4H0twit1KH0YKQB9RL+mIQFHsEfAH6ZGH2w1MC9Vkc+dDHjk4cOgxcSWCrCNOIqdCbr8SGHeNoUO3vovq3OTEn5jiPfamhuJ1w5Mi8kNS7wd6pAWXWptspnyUIhTFStPS8UndjF5Y45Lh6+lEK+Yc20t/ANkjZx8na+R12qMvlTV4ivOPabLbmENhiMMdBQt8by0NKwrUrHr5zvBAmPkgjmf5umY4J2IHdbgnJ5gwr8vS6OvjHzSg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pqT49cWEOwL37ri1ItN64lrYXwMnh/FwPmQ5/BC2/GY=;
 b=MNcbsd9TAAzOLzVOY5MADFeohW6+7IkYO3SrqOQxSeRjPn9JoyZy3fJM05O2qP+86EcIQ7JlaV3Io8ERdhJkMmPP500jdZND8mkj9ug3w+i0fF97lkhBv55SCbM9Xp8S6AxEaMaL5UkEQu60F4Gz1JY42KF+QuyWkM1dUohTC1/1LMzAPsMPLZ7JHpFc+2RMiUhW/rNlOIakiXTN/vZ8yJGr2KoTpGnQKe/wBVVezQcjKFya0XdHbSAcH9kWV4vXheQ+k7HaWGovnftOFeBbMc9oYN175evJNKC4b5csBCRz1expZHghnSQdccMvpkuB3oJT0yCElFYdWH+OW0ndFQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8254.eurprd04.prod.outlook.com (2603:10a6:102:1cd::24)
 by AS8PR04MB8053.eurprd04.prod.outlook.com (2603:10a6:20b:2ad::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8356.16; Fri, 17 Jan
 2025 06:20:32 +0000
Received: from PAXPR04MB8254.eurprd04.prod.outlook.com
 ([fe80::2755:55ac:5d6f:4f87]) by PAXPR04MB8254.eurprd04.prod.outlook.com
 ([fe80::2755:55ac:5d6f:4f87%6]) with mapi id 15.20.8356.014; Fri, 17 Jan 2025
 06:20:32 +0000
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
Subject: [PATCH v2 3/4] media: amphion: Clear last_buffer_dequeued flag for DEC_CMD_START
Date: Fri, 17 Jan 2025 15:19:37 +0900
Message-ID: <20250117061938.3923516-3-ming.qian@oss.nxp.com>
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
X-MS-Office365-Filtering-Correlation-Id: 3a9a196f-1d33-4b7a-8a47-08dd36bf0bb2
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|52116014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?yOhTqmcsVQPoRrObXCLgn7PH/HyceGZJS73cRoGBSOSo7NvHA4M2FrGi391P?=
 =?us-ascii?Q?5HQiZepOukmeJVOJ59RVznYvY9qyACYGTeH49gwEWGm06YWE95boKTg9sqAR?=
 =?us-ascii?Q?uB490xvovAwm7zWbrc8sASi1xCOOLCeGiM82GmJE1yf7q2dwtfhrD1gH0CXN?=
 =?us-ascii?Q?MaAE+Oic+mZap43M7rfqEPmz3/jO+y3HoKu2lV10tPrSHJfLBnSvPiX3u6iC?=
 =?us-ascii?Q?PJYkjOld2IF2XVUYQqLmSo1Bna/vKGsOI5hx//y4N8OBQ+hU1kAEm6o3NNoH?=
 =?us-ascii?Q?15nHOIm4q9yNcalPBESDM1TbLnIEFgTpIUJw6S8ug8WyP6Fh1u+QqS/Jaqv2?=
 =?us-ascii?Q?SWYkYor00V4rNonAs8mX58XvVeP43QMF6StfHzY1g0Con3ZsrgHoLqlqsSCz?=
 =?us-ascii?Q?jwQiLxlj8Jqy91oS7hlcXNmvB6CsJKLK+2RoobWzNuFDdDWYcAa6xH/sSOz0?=
 =?us-ascii?Q?+9cq1kkLoKS3qc57SZbRlfGbsRiJDgOxL7zFNi+Yf8zJUdcvPZoyxk47pePa?=
 =?us-ascii?Q?UQLRX1eRzmMN3+Fcw+UW7s2sDFHHTwRe+45HRaRukWdTpxBn4vD8IxK8alpA?=
 =?us-ascii?Q?LsIuB9yRy6EDf4xiMsbKEOSk20WKlJPqKuzJfwHoH/ugflj6rw2ca55CRo2w?=
 =?us-ascii?Q?EtxFluH6MOBZSkkZsYBbobW700cxSV+mWpF9K/8UOs9qsXp8ucCL3Vwlbia5?=
 =?us-ascii?Q?WuKcNFLt4I0fi9mXVJOcK1hk65pSD7ymLrZjtPnswGNdDT2+6/WJrgsnCl5K?=
 =?us-ascii?Q?1IOu4ekpH4HWWeFw6cfmRB5sVIjR7ld8riHAFKQ+9XNkyQbQM0bRveTuDJRz?=
 =?us-ascii?Q?7hA6CqNSdDnKu4yjOBL7FdhAc88B0dk6mTEOOD1rhRDmyAnNL6XzQZgY3zQQ?=
 =?us-ascii?Q?sY1hBs74a8M69seQnA+1qmOOv/PrGf6dLG0mPlCOToYCeV8MmY6LGNnpzh0T?=
 =?us-ascii?Q?NqGHza+8ip+fUPfl2tIzgmQwr+nlusXJ4Mw/njaF0SOv8L4w6gqKvoOP7Kk/?=
 =?us-ascii?Q?XJxsanaJM6yhOI9r5+E5agmzflwsVYE3jKN+JL7HofjcSOgLdvmijUxG+zXv?=
 =?us-ascii?Q?ZlVSj7mBoPARoEGoHNKVckahr7kSC1Z1cmI1DWBSy0iTgIaDkRgFIvCBVavk?=
 =?us-ascii?Q?xA1xHWxyegUtKR/8Te/o0/xxWmTyI5dwgWkEeprLlp2b97VV2tPqEynoAnMt?=
 =?us-ascii?Q?m8HwJS/SpQICVZU3QLpXkenF3O6qKfX0HczMn5vwMGY3+JdrwAAh3hlupn3o?=
 =?us-ascii?Q?5cWbwcUuFcq2RdzD+VQtOUDCmhng+C0PF5PT+BosoSG8Y7+BPpEJriV6htrH?=
 =?us-ascii?Q?ROKObUUVQQHPq1EODLlkK4UurbiRZEyRAE1CFHd9Wa7kUJO6DqOIOCE2MExp?=
 =?us-ascii?Q?2ocdeNJzupPZeoAM6JMYmtLwavPfXDyL+CQcxu7CKELqApTUGNZO0MjukHjA?=
 =?us-ascii?Q?AeXSkN7RmPUbOJa01Q1rTRyN4PPLRdOe?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8254.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(52116014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?BNBTg7yf9Zo3pAX4xWTxqf7E1usftj9Yn+/ots0elOTXooxaphrXobjhBXmQ?=
 =?us-ascii?Q?9iBSw5ZGabe2jUwOWst+ehASbl4iIZo8Ijf7p2sENDM3yngQmUi0b/A7/WuH?=
 =?us-ascii?Q?nwk5jqwcIFIM9WPy7hnUMw4S5bLxFs1SDAnHhsovnhOMHQ1jiDv2lbGhj014?=
 =?us-ascii?Q?/yLqCyEM3BiW9kcHeAXQNz2DLX7Hz2YnTbhcpdMKDBguNl0IIk934i6ahmZN?=
 =?us-ascii?Q?nTMTK8RNcWsXqeox6VIy/BNSqvKhJBSLUsdfYt8Sqa+npDYNLNVf3MDZyZ59?=
 =?us-ascii?Q?SdNkIbToYv341koR0TSORyFnQNjhEY8wGGPBaBrMscLbF5jaRJsCMaC/VCFH?=
 =?us-ascii?Q?SBBRLd5poWl9dO5o6ma4PqFksZV5e7K+yKSkTVad1VKbGTyQNwoHQwy5SOM2?=
 =?us-ascii?Q?AAbwEakhIAi95tQfpQZcLkqTdvGImQnsXqebP4jw+QPcJsEsOjysKwMflAjR?=
 =?us-ascii?Q?7zdPuLqAMo/5y6vKm7hz90SSWiDS+s9CrKMUkj1/J2lC9kynhOjt4SE02m2s?=
 =?us-ascii?Q?l/ImlJKbhBcbEiXzY4PEBdI0qEYieSxcKIDnWWoYxE2Wlcil/1tK2NLCvh6g?=
 =?us-ascii?Q?s/gzVRYs8nLSw+3M0rNIEoJUucDuAsdxmhLIYIj4XfcqpMZ7G2yjKzNe5YeE?=
 =?us-ascii?Q?m+l7xXdp7ooxHli6q8H5zFhTsAw65PrSznnRmsOCVk9jjKLr4KkodUyE3h4H?=
 =?us-ascii?Q?gW7NsI+EnbWhEsmHngxfD3K1BbcUu7sY0MS1WBVM4PA5SAuvsR3OXBTGwq2B?=
 =?us-ascii?Q?MHe/+/q0qFwkJN4cJsheX9Dr9H2UXgXnPFDN6rwzT5w8ykMpH7Uvb+ZinSID?=
 =?us-ascii?Q?0qnCdt9VfJkXufiPDEBSZl9vaRV24rE0KS/TLLtjJa+4eh+1NUaLdRz+WNYT?=
 =?us-ascii?Q?Kig0hwBYiLgt66QWBYC8ZhFViP3ZJal1lUE0dc5ra2ikFA/M2jFHuE1zZ51P?=
 =?us-ascii?Q?+4G80VdCkdgj2BYgaqOYr2v3mvQHo8Thkd+XWlrTKSBla8R6H3Xq5on0v/Vj?=
 =?us-ascii?Q?ysDTzcFWZ+YmqxTQyjF2a+/3U+90RFMLpbq337EbBOyveTkdd2NB2/JEcrzy?=
 =?us-ascii?Q?YxeZ6l+PYPdiR6bbrSMcY9Zimnazs8L9ENdkwxPS0/OaBmTozpke71omfoJd?=
 =?us-ascii?Q?CzipnsLhMymS+aH/Bqo00EZBj/OJXKrAu1ICbGWyhEG+g/Gj+eS8yraPz8eT?=
 =?us-ascii?Q?4RqeEQ7wjRVoDnaUtD7tu2k6plulLSgiN0T02RYhFJ25ZKnNl8jThem/T1P8?=
 =?us-ascii?Q?1HkJnUN4miV7ZVuuGMieft8sngbO6/LBs3Oe/d4lfvMe7sjna06tb73SJxRL?=
 =?us-ascii?Q?e961y6XNIsebCXxcQalwWdguyZ4DFuuQN8Y+nWLF7ln77YPZVj/zuyRSdaYm?=
 =?us-ascii?Q?ziHCT7UhcoZMqgDPKIAeTbT3aXe3sBPCzT4BWvrECW8u62yb66vJU+iClocz?=
 =?us-ascii?Q?OdAJpOQbLQgotAi2OGYRFP6NWNaVZmr8Bp5TTXEelzmH5SahugKgJFAKnonv?=
 =?us-ascii?Q?eFYFgjZ65akwF+uz1dMUVyLX+gSro4Uw7X+xHb4OhCUOnquXlC1W68WqKNMy?=
 =?us-ascii?Q?z5zEEavRBcMbfu4SbwirmgqAuk3fGxG40RxFrWuG?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3a9a196f-1d33-4b7a-8a47-08dd36bf0bb2
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8254.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jan 2025 06:20:32.2315
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2E+HVraMRQuycwGOP2cGs0zDJsnilgBoYeKm45YOYOp4bXM9a6V9P7/f42Xk0SSkEiTjhAhge3N8QkBWVU4ITA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8053

From: Ming Qian <ming.qian@nxp.com>

The V4L2_DEC_CMD_START command may be used to handle the dynamic source
change, which will triggers an implicit decoder drain.
The last_buffer_dequeued flag is set in the implicit decoder drain,
so driver need to clear it to continue the following decoding flow.

Signed-off-by: Ming Qian <ming.qian@nxp.com>
---
 drivers/media/platform/amphion/vdec.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/media/platform/amphion/vdec.c b/drivers/media/platform/amphion/vdec.c
index b752afc6276f..3b848ac2cd0c 100644
--- a/drivers/media/platform/amphion/vdec.c
+++ b/drivers/media/platform/amphion/vdec.c
@@ -728,6 +728,7 @@ static int vdec_decoder_cmd(struct file *file, void *fh, struct v4l2_decoder_cmd
 	switch (cmd->cmd) {
 	case V4L2_DEC_CMD_START:
 		vdec_cmd_start(inst);
+		vb2_clear_last_buffer_dequeued(v4l2_m2m_get_dst_vq(inst->fh.m2m_ctx));
 		break;
 	case V4L2_DEC_CMD_STOP:
 		vdec_cmd_stop(inst);
-- 
2.43.0-rc1


