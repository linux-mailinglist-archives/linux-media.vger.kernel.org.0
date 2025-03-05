Return-Path: <linux-media+bounces-27546-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 13A0FA4F702
	for <lists+linux-media@lfdr.de>; Wed,  5 Mar 2025 07:18:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 56CDE3A8C56
	for <lists+linux-media@lfdr.de>; Wed,  5 Mar 2025 06:18:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6EB391DE8A5;
	Wed,  5 Mar 2025 06:18:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="WZIeYG/r"
X-Original-To: linux-media@vger.kernel.org
Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013007.outbound.protection.outlook.com [40.107.159.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08C1F1DDA18;
	Wed,  5 Mar 2025 06:18:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.7
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741155490; cv=fail; b=RvwoPv56/UkI1CHO+JvtvqQw6k0DXli4tkYsEAB20HVs1JJ35NzVEvLkDR2SJissbNNOTV42eaokogG/aSz9FSOXAda2ShOclfNkSr5EmPXaP3Ygye1qm4rzC4TU6GZt9C/bNbiTUy7LfLbutR+mD3CYWm9t41/APcWprxXWPXU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741155490; c=relaxed/simple;
	bh=aai5RhG84M4b8/fM0MHJt6ycWux3//dAs1jZxkxbnKs=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=OG3F0EZ950HN/MxBNiMa4fuEZrw+i4n4L8mNwYqd+R2G4ZvUH78QxMIzbAnPZbN9PlY3WLNzQSzAkq6j9V2pEZdX2dbxIW32TOhisHUU6Onu4qpgppBtlwYE/irhIMWfPWSvgqEH46fJHzuZM5aW1GPQqKG2YcYaGnp3uKFh7FA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=WZIeYG/r; arc=fail smtp.client-ip=40.107.159.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=i73x+jtrUgXDOuTS4/263ugIWTcRu2UJL2L09oSIV3a0CvEhfMbMg4DxoNcMfU32O8jqPJf8/K1TYPFqjLxP5OIufCncTaCY3o8m6a6M1v0VN1YUWR4wpJX+Is1NFv94i5rPm2KvFd7f7WYTi7vmxL9uDKtpscdMnOQsJL2fXgX0ATwru86ItIDAg6TYICXxYeQR84v4ROHrNFt5fwC3i37DRdXTfwdgKdAzeYiwR8aebqNrIGwAAVNRpapVHuu7N5zM3vnK6jKcF2NVLJFZkS4zHImLzONjp3h/nQpGAsQQclTGkq52xND01IiggpGAhMN9nQE8QwB5rAOjYCD1rg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ozJ8R4Xwr04jpqaB6Hwnep1TcUUF6f7IBkP+gO09pfs=;
 b=IqtHQP7+zPl9zoUGkbWQeL8RyKVIpuNPAOrV+3CiodwasWQscCgvytp1HuJ80fiEGBQCBE1Sa3essNDVrFt36FbpDX0N+EcqBHXdDkvWbIoLA3NJJvz9M54Iy9S3ODhIxndeprxk03+dsikytKn/1iloeNQPLLs3/dn6+6CMQW7iPgv5B1osiVVmd1eSagaDK+QoWdIx2R2ypWLIZ0q0dfwYaEt43IXlG4oHl5x4Ab1x8bHnl6UGECcsHe6t/FP81XcNgFH5kvTWBNKRM5sg6BUVdJBrOhO5vSbt5i/uP4Z0DFNYQSRivP724KgeG6KokGlBVAIAM/ADVfB+AUlJfQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ozJ8R4Xwr04jpqaB6Hwnep1TcUUF6f7IBkP+gO09pfs=;
 b=WZIeYG/rzwzv4FXAIwMaJbNmrgI530TZ8MQXz7UtnnwK6IDtCtht/eMzgDO6i1XCg82D44z4wPelSIAACbE5qJEwvpl9Dlvka+OIk3T/oOK6h4RZpSUlh1rVWwwUNSp6gG8jPEa1/HCRNhzJobY0CbwlJPlhTvBOJy1boePTDxEO1SsoFv6KIuYxUd6rd6uBtQYK24fIKzv4qqvLNSbvLH3sVgwqVN0wRmMnYiEfuQJ7u3vnua1TRtj1zzqB4gdfwvfN7gddfY43ebpgeMMALJ88RDClHo2xWA+bB8hCUUK9arKsOX+CkqLJDlgSckCteyl75EkiH5gXEhVzyD0wPA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8254.eurprd04.prod.outlook.com (2603:10a6:102:1cd::24)
 by PA1PR04MB10721.eurprd04.prod.outlook.com (2603:10a6:102:489::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.17; Wed, 5 Mar
 2025 06:18:05 +0000
Received: from PAXPR04MB8254.eurprd04.prod.outlook.com
 ([fe80::2755:55ac:5d6f:4f87]) by PAXPR04MB8254.eurprd04.prod.outlook.com
 ([fe80::2755:55ac:5d6f:4f87%6]) with mapi id 15.20.8511.015; Wed, 5 Mar 2025
 06:18:05 +0000
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
Subject: [PATCH v3 2/2] media: amphion: Add a frame flush mode for decoder
Date: Wed,  5 Mar 2025 14:26:30 +0800
Message-Id: <20250305062630.2329032-2-ming.qian@oss.nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250305062630.2329032-1-ming.qian@oss.nxp.com>
References: <20250305062630.2329032-1-ming.qian@oss.nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: AS4P189CA0040.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:5dd::9) To PAXPR04MB8254.eurprd04.prod.outlook.com
 (2603:10a6:102:1cd::24)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8254:EE_|PA1PR04MB10721:EE_
X-MS-Office365-Filtering-Correlation-Id: 8bad1b7b-47b1-4d73-f72b-08dd5bad7dc2
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|7416014|376014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?x5clcK+pRnFfQSeyQf6Ux7HUD/GqxIuhCClE2X8vEi8IFyCU9dzhLwiVfL9W?=
 =?us-ascii?Q?TKu9r2uUlqu68tSYmxsFYqaciOK4+WnNAy4QDMiNgOseG4sNq0gHvAwi7ePK?=
 =?us-ascii?Q?c91OXscOFcz7NYxoP8uOmQwDNHj1GN7JxLWnKmRCSbIhfWac17C0VtZQ7B3N?=
 =?us-ascii?Q?LgrzIXI3oGqIkPUz8LcthzYNbNTE8ekB5kumuild5kp1RF26KNlqxNAZPs6v?=
 =?us-ascii?Q?zYRaYtXMhAliNOo7XE6uBTRm2iehtKpl+d3rQip/kEsZUtBrPvE0rl3w8fwS?=
 =?us-ascii?Q?17xjbNv9aIoJvV3IZQpuWs3tYo4YfqCTxu4Wb4eRbEShonHg6b2oNQiZxzwm?=
 =?us-ascii?Q?i0UEa7J1o99qJAz24XTW83xwkGiLXAtGWg3HcM36YS7EcyGzd6n8iFQ8hZ1+?=
 =?us-ascii?Q?peBSMGzGsv/eUig9fOmHQ44fmuDjz4pCY/2rDLC+EehouI3g0NWwwmlQalvJ?=
 =?us-ascii?Q?21pOJ25dTGAOrQDOAk1tnk1aipfW4wIB90zDBu6+mwBngmM3b7LkykZUvW/Q?=
 =?us-ascii?Q?DMIaur+8foKRSX0eHXjULiv63+lhpBmp8hCrLnfnpQV2vQImIvSK8/fj8NKe?=
 =?us-ascii?Q?oNnNoshbHcZ9/kMr4v/CV3SRMDkN9fNgMhB6hulesYTQ7UsdIbYQPSCN6mgW?=
 =?us-ascii?Q?e8E3zM4c95JjYuKYr8v5f9HwFwe2Rg0hX/fkkYroxyhtTSgb68tir7M/1vbk?=
 =?us-ascii?Q?c6AOI7v++C3kKfnRX7aTAS/7c1KOBmF+1lKvQG0WpjhwPAr/ifv88FNlEoae?=
 =?us-ascii?Q?FUtIxsXxtq7Qi4UkCd0feasMU/jTWbLTfbHMeC2nHnUIxCIm6or9azGLNBUZ?=
 =?us-ascii?Q?SdiF+aZptpnSz3WFhtL8KsoHAFpkRiLmd7hQP1ZkrhvD2QVCOdyER3O6SQ91?=
 =?us-ascii?Q?ixLPSf1Ak5JsuJbLG676F6OSriFa50EBniCaEj+90N6Bn81vtgJHoZLoNbtU?=
 =?us-ascii?Q?JQ5DwmuosQbgAPro7zfsAS7qzbuzEMKXzRXqtueiOFjBumXhCGe+V2vXuscR?=
 =?us-ascii?Q?xQ/Pun54LBcQfWAFJzZZKINEMYSha+LtHs5IvhlnM4ZzO9z52R/ugIi1SNWQ?=
 =?us-ascii?Q?l56DR1m/hcQ3Best4y/vjwCGPgbgI/xyOrztFFhG3hdGiUtxCsWUNNfEeYDE?=
 =?us-ascii?Q?nMOQAuSO9RunNe19aBVLzJTB01Q3RR+A3/PogWf4zBK2tRLLnq7bbpNOK3Cx?=
 =?us-ascii?Q?dW3nL0KXt+xsgelZ4gFSf86wwT9cJTlh2Q2sRfFsXiaq9V+jn7owYX2X9bSh?=
 =?us-ascii?Q?lzm4u0TNCKiFgNKneAhWcz4rs+lDjqs2sT5C/4tbfcd4T9KGzDHddPk3s+l/?=
 =?us-ascii?Q?zCkWfOTQlCdTvSwFvOUo433df0XoOkGYb7Cl7zk2h/35CRtarQzUrox9eUuw?=
 =?us-ascii?Q?SUY3jzA5aMH8hAdthIAGLs5WLI0cjAiCEkVk9fAvyHVMEDGy8tyX9ELUafDR?=
 =?us-ascii?Q?noB4ikeH1QVwD+afACFP2NvV6lLqCxdt?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8254.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(7416014)(376014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?+aRD98L+H5ZVZuhHNUHz09AoOdCHH/Sh/BhVP+qgYZi3Fo0u5JVeEyidS8S8?=
 =?us-ascii?Q?T/tQFRv+yUmfguK+6HwqwetDq9BOxcJGEimak4Nv0e7odF8Iqg/MxH5hftKE?=
 =?us-ascii?Q?io/lirB0O1LVik9FbCbA94n8PG+JZARlGkbRTP4ytu7IAlWrjAXA/d58OSVE?=
 =?us-ascii?Q?OTXQBWaXLnfLurjiP9piHRhx8nTiQ51CldUgDt4bfzBePz02WYzYNRTzlv75?=
 =?us-ascii?Q?0i2vMtCieYt0r2zS7fLNklmt0nkKOeFshwUzHwWJIrTOHYPuUON4HVikmbPQ?=
 =?us-ascii?Q?napQ3NkXUjLNpO/kRUUgiOCOmVZIQAk/CA+C5QhHF0akbyz2k2WWu6wRh+87?=
 =?us-ascii?Q?oji2HtbAkAWbK0CYAMwsiWRUMfEl+j1QcdHLyZ+5O3H17MdPZ4jnlqz5buiq?=
 =?us-ascii?Q?8aUgAQxk5Uw7rXsNwafTyKIW9y0rFvaiUsMk1B8yoGqYBL0pxlcj3lW4g/ST?=
 =?us-ascii?Q?SXfCmIZ//tEIwyVSR3+7F8pORfM7H8kdan56JDOs3CyyceZnF8MVVmCjTux4?=
 =?us-ascii?Q?aUXG6SNrN3IuK6B9IW8JcrkkkgQgxifwj2cKQeg1JM/Tcgc9SAIOMSNQYEJd?=
 =?us-ascii?Q?Zp+UtengWKiCRG4KyPmfwh3HtmXvjvNFr7h+MhRfcr21XYCihk04zvIXglHr?=
 =?us-ascii?Q?Gq2o/8tu30XQAptbfykxMof2Z1ed9MYEOHq7nAbYyz4qSYQAFgSSM5+IJTlA?=
 =?us-ascii?Q?PZ3yLBp+D8OS7RpA2AqS95ddi1/BX1RYfQmvEWWwy97dRo0i9tCKer13WRlh?=
 =?us-ascii?Q?dW0VulRkL1OT8ew/QdAnlLu3jarAahsmfAJQ/kQrYhOpb+SlK7q4NW/3RXPz?=
 =?us-ascii?Q?4DVTl40HOjHDZseaWNLE2/IqBSZBW0mev2eU5a1YLRk2MrZ9k9ZnctCnE+se?=
 =?us-ascii?Q?m3Lcc8a69xE+/2OlSjln7BIe5hli8wee72zRo3AAUq/aoU4mNRiX0ar7MrVp?=
 =?us-ascii?Q?e3a22pIEqAQoXxPNz9oOq3soWLRjs7OulUgM3rXsojk1fufDNt2P0TccukSo?=
 =?us-ascii?Q?vOB0gOuvnBqpoMhaJsRwvuYO+bPuPYNTraOnLHri86l3I3Bwj0zqpXZhS0eD?=
 =?us-ascii?Q?7VHIQYPwSFW3UDdL+1Jjl7fII6/+WnS5hSpRcWeLxIpXtOoYbgspDL76juCx?=
 =?us-ascii?Q?hFZnURlOrYj0pn4uetGLekz8G3QJK2GMy50hDwVed+ML8B0a9ZVzfxmuHOj2?=
 =?us-ascii?Q?Ke3jEh3hznjIs+eeJIrZS3e4p1JMc0KjPiBR6jYG6K8Phc5HzCYGcb9+1Gzi?=
 =?us-ascii?Q?7haJpFGiPMqp/GqHgBonVAU39gcE68gDOh+6E0PBChA2tP2tIVl6bsHYzNdn?=
 =?us-ascii?Q?1MOuVbLU0mnyN+o5VgvVJHvBkwuWIBm6+PV6Bzvvgq+qEIXK444wTw3s9ZAt?=
 =?us-ascii?Q?vYuX547IqHTlM6d67XTNB5J62QNmdkB/neXD2L6uy6t6BbdZbtmm4e+AV0Y3?=
 =?us-ascii?Q?zh1f/GLficE0ZeLiqf0z4kSm5qX7ng8krChwthpuecs2xbuaaVm1ZxQiDtya?=
 =?us-ascii?Q?6FeYp8UgDiJTjYlWO0zMCMlqz2lsgUeMQ91WF0uoHuiqhnZAhVW3OSQetqWz?=
 =?us-ascii?Q?vplyyvZNar9VPUKRb2nSAWh7555/mHVQuuzQjAt5?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8bad1b7b-47b1-4d73-f72b-08dd5bad7dc2
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8254.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Mar 2025 06:18:05.7715
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lcXGLW6dtlsHyKUD2iMckZnyEfoSCJop/OdVX/2Z3F4xV+MciBG2ymI+/KC9j7EobmJGcWZol3NUhfzOswnm1g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PR04MB10721

From: Ming Qian <ming.qian@oss.nxp.com>

By default the amphion decoder will pre-parse 3 frames before starting
to decode the first frame. Alternatively, a block of flush padding data
can be appended to the frame, which will ensure that the decoder can
start decoding immediately after parsing the flush padding data, thus
potentially reducing decoding latency.

This mode was previously only enabled, when the display delay was set to
0. Allow the user to manually toggle the use of that mode via a module
parameter called frame_flush_mode, which enables the mode without
changing the display order.

Signed-off-by: Ming Qian <ming.qian@oss.nxp.com>
---
v3
- Improve commit message as recommended
- Add some comments to avoid code looks cryptic

 drivers/media/platform/amphion/vpu_malone.c | 14 +++++++++++++-
 1 file changed, 13 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/amphion/vpu_malone.c b/drivers/media/platform/amphion/vpu_malone.c
index 1d9e10d9bec1..4ef9810d8142 100644
--- a/drivers/media/platform/amphion/vpu_malone.c
+++ b/drivers/media/platform/amphion/vpu_malone.c
@@ -25,6 +25,10 @@
 #include "vpu_imx8q.h"
 #include "vpu_malone.h"
 
+static bool frame_flush_mode;
+module_param(frame_flush_mode, bool, 0644);
+MODULE_PARM_DESC(frame_flush_mode, "Set low latency flush mode: 0 (disable) or 1 (enable)");
+
 #define CMD_SIZE			25600
 #define MSG_SIZE			25600
 #define CODEC_SIZE			0x1000
@@ -1579,7 +1583,15 @@ static int vpu_malone_input_frame_data(struct vpu_malone_str_buffer __iomem *str
 
 	vpu_malone_update_wptr(str_buf, wptr);
 
-	if (disp_imm && !vpu_vb_is_codecconfig(vbuf)) {
+	/*
+	 * Enable the low latency flush mode if display delay is set to 0
+	 * or parameter frame_flush_mode is set to 1.
+	 * The low latency flush mode requires some padding data to be appended after each frame,
+	 * but don't put it in between the sequence header and frame.
+	 * Only H264 and HEVC decoder support this module yet,
+	 * for other formats, vpu_malone_add_scode() will return 0.
+	 */
+	if ((disp_imm || frame_flush_mode) && !vpu_vb_is_codecconfig(vbuf)) {
 		ret = vpu_malone_add_scode(inst->core->iface,
 					   inst->id,
 					   &inst->stream_buffer,
-- 
2.43.0-rc1


