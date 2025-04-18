Return-Path: <linux-media+bounces-30534-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D9524A934F0
	for <lists+linux-media@lfdr.de>; Fri, 18 Apr 2025 10:55:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2313C8A0568
	for <lists+linux-media@lfdr.de>; Fri, 18 Apr 2025 08:55:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DCB2A270ED0;
	Fri, 18 Apr 2025 08:55:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="V8pECoWh"
X-Original-To: linux-media@vger.kernel.org
Received: from EUR03-DBA-obe.outbound.protection.outlook.com (mail-dbaeur03on2076.outbound.protection.outlook.com [40.107.104.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FA4D26B2BF;
	Fri, 18 Apr 2025 08:55:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.104.76
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744966525; cv=fail; b=YT9zk21Vq7BoN5iy9qeur/Wr6oykTuo9qubjKDSSAivq1RtF2BaVaN6Dhtd0CUnhx4GrQJv6yleDcNG/8XhTsmcMlHNl/GY7h554vWeBj4rvXxJv8zco51s6J1wy57vYcGC7DPPI4vT9Plrnjb4aBq8UUtbJSOIfHxyOGanHJL0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744966525; c=relaxed/simple;
	bh=J4AWaYH4+1wrO3dR0948dYLPYMQNOYp77EwrZFcZEuY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=e1nUjq7w2J0JisWu/i543ncZHKAYPM/VuWkHsI89pyXuWTjlH/TaqJRqWhDZEAXrCTOa1xmLb9amYA5C40b9id2rRq/nyoMh27UIWUsdxvd5pwngpDxEc3THsSGW6SFquDbjTuuWG3DEYmZotqP7u5Hz63HEwXahdSvH2vHGwnE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=V8pECoWh; arc=fail smtp.client-ip=40.107.104.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yOQJomdeImXoIc2h/+nX9u/+LHiHJx28JczTDV5CylikG1cdx5uOoaMSfl3m5jYACDTHub6lMAybiDHbm3ESlC6BiJ2UDjNe6/8o3chU6qT+Mg2TUiWb9o6pkuZZ65SwB7qkitn6Pfaaivh46cckeL4gwJPoZh9fgAYeTzwvEjmhCyx+/NzNid4VDZcj3oBg3vzOFYHn8rmg0D6OJODaiIPp7rlBACUcIJYp7h/hT4Tsoq3B2oP2uY7PLNbrBXqfJM93NIFHeve3xoLeD2VeX160uIWknhe7W3BlV7YOQ8r92rVKtUf47F8NwKj00ElVwH0bLrF2SKqSOoy9K0sy7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9dFyqdmuwsvDInRXdL06B5S8jaxZJkHZabllnIYlmYY=;
 b=tpYR17Zj2e5xAtzbEyeu/EHqN/x8WP1zz7DwbaAC7722vSgVCbpyCAumWtfygaFGOAxENekgb4pvvnV/PJacBDe1AGkMq7StHYzSwopRtEA+RbRkrI8QSY36dcVJ6YlPJ/LEhiRApNh0pQOTg+GcoA7z0aWber1kjyuu0esuPAN7n+V8zc/yH6wABN9tnSi45fzGev6bwwcXEruyqurGXHROEdJTrvYpq61F/tGtnh7rOZotzy1BR9XzhHpj/BrJv2ZMmzC5OroTvxxaYPldnjEevnKXNK1myKcZKaGp9ah2kYhVjHojzsnvKn1jmBrdfN0DEkyuMYDf5FjAx6IQuw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9dFyqdmuwsvDInRXdL06B5S8jaxZJkHZabllnIYlmYY=;
 b=V8pECoWh2hoPyAvEwNAOsxUqmxlIHGHeuuT1zOrHgpqgzo9BNUN9harU/GI7ytX+JGi9s/3ZnBVMbVGGjbxvhZjiQeewIliJIdvKmCVcoyOBjbQ+L3Io22qW9Q/KjZayKuMTzAfO4u+JPkn51RKHbtjhsopOfkk3WKR0hAYuB7H3JE9UbtsjWZGtdzOmyYwhP3rYKgDslxMzEPu2XGGbjnjVFX/2w0GodXdt4JKgMZVZSUg8UcTa4m1v6ABTw5WWlY57EAiSKQqhZu/Ltrh6fmG5jWAhc1bvn+Oa49oe8OKeMUA0QP8S1vmxVFqHrUSNZTBunI2iAFu18ixJUUZMsg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8254.eurprd04.prod.outlook.com (2603:10a6:102:1cd::24)
 by VI0PR04MB10638.eurprd04.prod.outlook.com (2603:10a6:800:268::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8655.22; Fri, 18 Apr
 2025 08:55:20 +0000
Received: from PAXPR04MB8254.eurprd04.prod.outlook.com
 ([fe80::2755:55ac:5d6f:4f87]) by PAXPR04MB8254.eurprd04.prod.outlook.com
 ([fe80::2755:55ac:5d6f:4f87%4]) with mapi id 15.20.8655.022; Fri, 18 Apr 2025
 08:55:20 +0000
From: ming.qian@oss.nxp.com
To: mchehab@kernel.org,
	hverkuil-cisco@xs4all.nl
Cc: nicolas@ndufresne.ca,
	sebastian.fricke@collabora.com,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	linux-imx@nxp.com,
	xiahong.bao@nxp.com,
	eagle.zhou@nxp.com,
	imx@lists.linux.dev,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v3 4/4] media: amphion: Trigger source change if colorspace chagned
Date: Fri, 18 Apr 2025 16:54:19 +0800
Message-ID: <20250418085422.193-4-ming.qian@oss.nxp.com>
X-Mailer: git-send-email 2.48.1.windows.1
In-Reply-To: <20250418085422.193-1-ming.qian@oss.nxp.com>
References: <20250418085422.193-1-ming.qian@oss.nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR03CA0130.apcprd03.prod.outlook.com
 (2603:1096:4:91::34) To PAXPR04MB8254.eurprd04.prod.outlook.com
 (2603:10a6:102:1cd::24)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8254:EE_|VI0PR04MB10638:EE_
X-MS-Office365-Filtering-Correlation-Id: 4a6df9eb-266f-44ff-af8e-08dd7e56beb6
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|7416014|52116014|376014|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?ZaBhHLQl+oSdsFaLahgrkBNul6J+18zaBa84kXYwQwADRfjCJ5R6z5ORABJ4?=
 =?us-ascii?Q?GnwDb3Fr2JhxxDLEDrpMYHRQqTmXjIs6Ri4CJ2P1zbFAo3L+xJTLSGiie6xr?=
 =?us-ascii?Q?oHk5fiwCrZ2ZQg4kBv/WuCNcFmQHPP898SJLJouQJJVqJ3gJhNAf6/EwZjyi?=
 =?us-ascii?Q?nMMFSAUgwVvcW9znhvW0/onJKIO32QV44mSCWv3+v/3byl9JP+RODd4dCuEY?=
 =?us-ascii?Q?5i737XxcOCCw+pS5vra1AGs+ud6U8zfj75PJ0w7yT1QI1p86yYKKSQwR1zrI?=
 =?us-ascii?Q?t1nJ1Va7oC9nblpmZ/tKKy8p466lbt4D4CMTPsM3cQU5eA2H/WYG0OyWyc6r?=
 =?us-ascii?Q?TtjT6X3xnoJjrGBfDuNT2EkT1ovFX65KRtuZ97pKv7s13mZIDqhMrwj3PSaL?=
 =?us-ascii?Q?+xHZsPwCKRCaQeR/5hMPQY1FGDyd2pG8D7c9VRHNbZzI64IFiJ2oWWlZGfOW?=
 =?us-ascii?Q?6uJYmzHJ7sSQsr2VNS008IeM+oavdyD9GkoxAaNcCIXlMq3nVAIb+5sXID14?=
 =?us-ascii?Q?BwhmZNZyyfJefzhakixnlCzndjEb6nkXdeaEM6byXICzRgXPBtuK1ZCaL4Y4?=
 =?us-ascii?Q?DT6lUj5yu5LQlkFYm56t4EZkHIcW6/AgjBwecuSsZnAp2xYqr4QYrmYfeBG9?=
 =?us-ascii?Q?KV8nSIKwKasJuIQkIRmO0mfOb7e7PQdW8O5PVJ2T+cFvLDKd6hqYTrNq6DCQ?=
 =?us-ascii?Q?mbpDc9YIrRIpC24be7wvKSR5p1u6giP936qKytnNpDfGdNgy6hbT2bvlw7nh?=
 =?us-ascii?Q?Ky/Z3Og1kcVFf579/SowKTwtHy586MXJxenkr5igceW9hnSImPUVqqrcaMQ8?=
 =?us-ascii?Q?glZLy+OkElgMPTXUX8GTKoZRdOkG/EBPV9a21pb2iQaHDZr21awq25g8bisf?=
 =?us-ascii?Q?hphLeRGyV81LIvHbuJKZzMLSLkz2zBT8IMumKvXhy+a+KuzxfUij+ROmeT7A?=
 =?us-ascii?Q?lDSlyquuQuGj34n5xKfjDPCH2iPXq+IMOp3kFT7L3QiAI3mkkHIUetAB+n6N?=
 =?us-ascii?Q?bUKZD3VhI3DX3JFtgEv2ogp62s8MuzZuAlQXYJpY72o6+LpW8ozFu6UvqrwW?=
 =?us-ascii?Q?PlwWjqkNorqlSQW0ZnMO6qFornypukYx3nDkRW+7g/csFTmTJJokivHitZeb?=
 =?us-ascii?Q?3JoDqROWzyx7HWDBnJI6uXBfgXuO9l3NcifcLku7vPXSX8eDTkT1W0PiRGtS?=
 =?us-ascii?Q?YFhs29j92QDjPFLflzcYdvtHmcMOFCHOb6DFFbXDYVU736Ze2cnbOGRDkzb5?=
 =?us-ascii?Q?+X3XG9ywf9IvAka7UIsdJPZt8abA+jIdCVS7sna4lZGg1n+djX4+nY01rtZg?=
 =?us-ascii?Q?N6JwVyc/+wYymfqU7qAL1sUY9X2DRyQs0rFqk3vA8XGkCFxpWAY56QjBTnHY?=
 =?us-ascii?Q?pRGz23SARTK8wbjpTGrna3cJZKs8vJjct1ygAkZhGfETOn1lBB5DDspGzGOv?=
 =?us-ascii?Q?NVeV7IV6S0816ZQ9BfWZWxI1N+nH0YZB3jvjgoORy5oeiGYVnap7OFrFsjI1?=
 =?us-ascii?Q?/dLxV/pt7ds5gBs=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8254.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(52116014)(376014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?E3j1ZGu0UJdN1aZl5Wg6QaK3vvTNLTwN71SNRtP7RBpmLu7QF+uYFu7eaL48?=
 =?us-ascii?Q?N/h5aX2jImlZC25njeRs3nNb4cGhQRoaGgr03uCrSG1pVM2jkQjvsPKZ9cjI?=
 =?us-ascii?Q?rbGYqiFlEJpFqN6SvCnLA0u9Tj5tlbvps5lKtKVf10eS3POZwu5IDyI7aK1z?=
 =?us-ascii?Q?/6VM2bDZFul8QjcofT2opmSsekhYxNSIPh+N6d2LMHH6r1m9AVJPQCoyc36e?=
 =?us-ascii?Q?YXKP/IdwS6ZGHt8bKCMF/DgRXVBIxzXKeH3ZIjp9OfVn84+Tl9ux2n39C9dn?=
 =?us-ascii?Q?hRkkF11tn/ocNMhkt440yNnBurxug40CA0Z6GKmvIGBSRcKz+TVMdauoUehn?=
 =?us-ascii?Q?k2jlY0hWenfYvWEiUk0RQBi/qMaqCqD0Awj0h1DVQ07DIDKzdOoNE9ZBqElT?=
 =?us-ascii?Q?V3Stu7FSmBRYMJRoNlDrVh45QD5Bh+hxYABKHHEIYZpWN8WoiZekFn2Jxs68?=
 =?us-ascii?Q?u1LstQbCBbj8pldH6V79AQEXVl4oCedhGENkQBtouFdBPewehGY87w7iAOC9?=
 =?us-ascii?Q?x8WUC31I2U3UWqZGMQd5DvgkkCmiUxpFnAoOeuHOUk3KpCKLJvA+6mYJuqxt?=
 =?us-ascii?Q?TfTqVu3O10eWw+PtuPh28/gzzwZDLm+9m3HzbQ6nEbsio0Yfzrms5AtGIde2?=
 =?us-ascii?Q?+C1cXb99VQBM/pD/L/v05X0c2I9+nLHmnMXx8YsS0zirq3C1WrG4pB2Nl7Lo?=
 =?us-ascii?Q?wg6kiX48OrmCAlO+e5SFdENnin/Il3+Fq4VdagHyGycTFsOaV8JhaUTZMHlr?=
 =?us-ascii?Q?jpJck76Z0AZIvZ0c/IwdXpneFuWu+nyiwmX+zWiderqDNRb707Wnpnkh/wub?=
 =?us-ascii?Q?EAA5MVs1jvML6I3b3C6DrkD5W1go5Yt6TKxWQJI/NG+4ov41IxQ9P27+OZ2J?=
 =?us-ascii?Q?gM5Kb37w7Cp9PnE8nA5MUVwduxd2wvbSQp/QcYAlobLqBFLjRXAq7+oUrDjZ?=
 =?us-ascii?Q?VelU/9QwRS53nmRftsbuhg18W2jlnIzmrjRf4vtqd1ZZoAqAJte6azgtRx6b?=
 =?us-ascii?Q?P4E5MzLHk+IRY6cnAd/OJ/URWisHkfCNFYMIZ+k3fpYm6EcGLMmuFLDAK6Lb?=
 =?us-ascii?Q?BfdStHM93cmeWWmqiWrdtRd3II+q8N8jvh5JNGI+tyUlySB/k6BsY4G0378Q?=
 =?us-ascii?Q?aKxGSiQhfrmpkhi2aW0YWOXZAmPbAcgYrWPNN+ehfMDlJXy2sxvYsg2QDGmr?=
 =?us-ascii?Q?NhQjw9LQ5ykY/6AQ9rCaCuf/wMEFFvc8E/EIS+My+FCqD5Xm/SNvTkNBF7/R?=
 =?us-ascii?Q?je8zB6ve691VjhQeD5I/xgTaoXrAC9Z/sgT8MgKNl9laO0U/lwBNT0tmHdmA?=
 =?us-ascii?Q?Y42AF5SQuCuKxV8d8mCHG3YlleOosjCWLzS5IrLxmQf9oj54iLNEsTAMpt59?=
 =?us-ascii?Q?f6ShLm0NxuFHU5nPZrfPwREqi48f62li6j5gvUEO59I2jxLzhxhfX97twx8n?=
 =?us-ascii?Q?9z2WkyxQuyLbQcXCK+kx51+pMVBgjcW4FWf8YVFjAQ7vjeSPVNzHouDaLOdZ?=
 =?us-ascii?Q?AlpsRd6VMrQBxAiQXVHe+unf70uZ1hBO1mFVhMeJjhosuPrW3OTvjWQzHnEG?=
 =?us-ascii?Q?W1Bb6ip1eQLPDBj4DcVpuIaJl+qHakOvtfQPNoGY?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4a6df9eb-266f-44ff-af8e-08dd7e56beb6
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8254.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Apr 2025 08:55:20.1064
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OLXWdzzNw5BBaEbXzksZepjpYu88Xb3liPFjTlOWQS3Oau7slu/AMMbFj3gp7Q1LQWKhin1C8dYYlYoVb4kyrQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR04MB10638

From: Ming Qian <ming.qian@oss.nxp.com>

After encountering a colorspace change in the stream, the decoder
sends a V4L2_EVENT_SOURCE_CHANGE event with changes set to
V4L2_EVENT_SRC_CH_COLORSPACE.

Then the client can handle the colorspace change without any buffer
reallocation

Signed-off-by: Ming Qian <ming.qian@oss.nxp.com>
---
 drivers/media/platform/amphion/vdec.c     | 89 +++++++++++++++--------
 drivers/media/platform/amphion/vpu.h      |  1 +
 drivers/media/platform/amphion/vpu_v4l2.c |  7 +-
 3 files changed, 63 insertions(+), 34 deletions(-)

diff --git a/drivers/media/platform/amphion/vdec.c b/drivers/media/platform/amphion/vdec.c
index ee0a7572ed15..f4979d537b97 100644
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


