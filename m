Return-Path: <linux-media+bounces-29101-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C346A77544
	for <lists+linux-media@lfdr.de>; Tue,  1 Apr 2025 09:36:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 424623A7652
	for <lists+linux-media@lfdr.de>; Tue,  1 Apr 2025 07:35:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6CD751E8353;
	Tue,  1 Apr 2025 07:36:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="kQqG3MzM"
X-Original-To: linux-media@vger.kernel.org
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (mail-am6eur05on2058.outbound.protection.outlook.com [40.107.22.58])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0129126BFA;
	Tue,  1 Apr 2025 07:36:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.22.58
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743492965; cv=fail; b=jqLl50EGWxN+qvGbhCBuggzuEKnNbRNu5/zoKtqh2sKdbSEswgmyIgxkGZPQqqy/rGiXoqDauqR+0ebdldhmNL9WdH+b1YzCvP2xww9JJx0x6ZdXzVkB5BVsss4FsRxbWghv7HEwGu/3/ponOlKyWqJJEN2cR0gLv+MVWpqRuJg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743492965; c=relaxed/simple;
	bh=hjKKtIhqYb3Y8y5pFTXnopWSwy6bL8meaqNryuG/axs=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=BBni/aD4jLuMl9KAtjL1Exn9/39f5PmFQ8DUBn7YpJ6uMtoNvZXgV+1bqyMhWS+dGTSgxgByX1v0pLcFnO7pdKwlP3yeNqAIqil1nNVcg1BVFdBOPZqsJKBwithOz62+xKM/RTqY4w/p5FUno8Um/jX+7kHiq1fd2oLG9C7rglo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=kQqG3MzM; arc=fail smtp.client-ip=40.107.22.58
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Y1qxr76rf0Z+Vep5QCRCZMoheZCAr9mP+ZZfsCZZZJydGhh4M1W5FIZ9xwbs3Iz03t+1Iw+PU9brHV3XTELfGk12cZ8jmo+Gc+Ysh243oi35nu2+J7A8XfcUO2Krki/NCIS9N+qyqmLHK41xJXyFiZPYQw4m1bqmb72GhUwUyIn9vwKhQ50gm4auoksG00AVioJ/bz8Pm7ZHRv4OsfQNc+EMM7IUyu6s8b7E+Tn4haNaVK7KUMVqZSbiDOPyWgcSlgBzIEeft3LWiH7xH/qeuZtufq2xtw6zD1THC0ijXwVrbFYeyBgSnguOlHB9vBkuWDlNCxt2WnpevxGWTkjW1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=B2BbTQIwrMUtrZ4MqH1dH97kHKOn4PoBBw6vrlLL7nY=;
 b=KLhphCB/Uo/msplNREdVGOs/61yUJGyL0GAF/Gr6azpQZOmtXKlGLDWvmgGR+GrStWB0hffspycms2Ho/mbf2FhD56F3gBCCAay45yG16F3puB7hHU/AHVzo8XNVlShu42gl+dnOZ/7wwXehhy09Ox5ghcP00CVUqn/+68QTH1AuuexBQMn/wmp4322xH02jxGmySCaK1U+aNHKmgrvd6vBB4DkzlYikzbsS8Q7jcRH3A3nrwuMXHDttq9yWNCI4ZGiHyERUhkXVATY5Noa2dqZTa4fkFuFgen11QUdrkNUi4o2iqfLd3AjlBAfzbN0P9119tUXNSASDcTvLZVjv5Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=B2BbTQIwrMUtrZ4MqH1dH97kHKOn4PoBBw6vrlLL7nY=;
 b=kQqG3MzMN6jcTOzc56bfFS2HwpIyKgmLPDGA2gs7U2B8pPiUPlE2Cze6TP1T9EkKEUZdrXrhPZ4H38Poo+EuUi/YA5DzCuNrlg7ej9qcMaMML86mwuXLTLtw+ZF45wn3SYpLFJEAQKwPmAYsHYBdADo5+Id4i1t7yaKbkao5UY7lZlXQgjzgsQM4t3IiSOh0i6jfmep/NtgC1bzW84WnTls5+TmYAZwwa7v5M4UhtsClcCT+jPn4ZLO9FIfl60l5fwzGEsYJmtjWax+xlUMHr37bnNmAuYqyl12nr3drwvHSRZeBItbXgiYZ2iPVEhO+7KV+zt3bb7WsB4LEgshXSw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8254.eurprd04.prod.outlook.com (2603:10a6:102:1cd::24)
 by PAXPR04MB8893.eurprd04.prod.outlook.com (2603:10a6:102:20c::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.52; Tue, 1 Apr
 2025 07:35:58 +0000
Received: from PAXPR04MB8254.eurprd04.prod.outlook.com
 ([fe80::2755:55ac:5d6f:4f87]) by PAXPR04MB8254.eurprd04.prod.outlook.com
 ([fe80::2755:55ac:5d6f:4f87%4]) with mapi id 15.20.8534.052; Tue, 1 Apr 2025
 07:35:58 +0000
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
Subject: [PATCH v5 1/2] media: amphion: Reduce decoding latency for HEVC decoder
Date: Tue,  1 Apr 2025 15:35:24 +0800
Message-ID: <20250401073527.1626-1-ming.qian@oss.nxp.com>
X-Mailer: git-send-email 2.48.1.windows.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR01CA0143.apcprd01.prod.exchangelabs.com
 (2603:1096:4:8f::23) To PAXPR04MB8254.eurprd04.prod.outlook.com
 (2603:10a6:102:1cd::24)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8254:EE_|PAXPR04MB8893:EE_
X-MS-Office365-Filtering-Correlation-Id: cba32e3c-aca8-4842-d37b-08dd70efd81b
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|7416014|52116014|376014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?X25uh0WlUxTw5/TsBl3wWv4K8cCBC8g+KNiIS0lBZ8QTVQs9B77KTfKptd94?=
 =?us-ascii?Q?LkErM2KCbmmrPsLCFHuY1wLLt0DqK4zo2xE9XNzWWnDLSgKoDSw9lmfuK2gI?=
 =?us-ascii?Q?RTWhmuTV/whdcm7PPHxENjtKgjCCsnDiXcfQc8nkrUwHMUNqr6bbUE+XiQyl?=
 =?us-ascii?Q?lbqUVYkfIDGkr4wSc1X2yyeAVARlxAcfirLwSC3PCHwW3xECTekNkeUqzp3D?=
 =?us-ascii?Q?6OiY+agQzISLDUUhTIrtgOjrmYAbcCaD8+wKt0MNVbBLYTbFrSAFXepSyKvC?=
 =?us-ascii?Q?QFUHjb5FxHVqyXkTkP+qptOzfqFNyadI2IszpMW130xt6lWIMRiQmAHXBZil?=
 =?us-ascii?Q?3HRGEiVTNTDZ09YM6XejCruqTXowuJ68fZKCJehnSmv8MeX9U77oHODRqNMQ?=
 =?us-ascii?Q?5Np4X8J9g1tmRoy19PFUZ7BJUOs0yvdaz2m1nJhMetBe2iQLNsxGXn93QtrH?=
 =?us-ascii?Q?nOQoltbdgoOM0P4O9ExhlFvWVctLstm3VBAeF4/U2c70EC9HsR/idps1ISXH?=
 =?us-ascii?Q?KThm9HO0OXU5AmN12X9ht6g5GQ8as/Wg/HE8FNjgxltY6ZYwkfPLYbUpRARE?=
 =?us-ascii?Q?xCK1yvsEv3+jgh3bLM26qvIDgRU6u8fDngGFBIFl3jiCyYqV5WVkLW1bm2QY?=
 =?us-ascii?Q?mJc+1Q3MQTEydhjUx4oEG61d4pdIYVbcPlCQoqvo5g1ci/xfpFXmC5dOlm8V?=
 =?us-ascii?Q?zpqWiWr6PGIZzSTZ7Y/g6I7+YD9+n+4IJfnPlIqAsVUUYGCGZ2OXMej5FpVU?=
 =?us-ascii?Q?1vDwJrDEQ0Nb9XdIu3P641vyhhxm5y37VDxJsebGWzcUAzx3VZo7d5Kzdkt/?=
 =?us-ascii?Q?yYXcim81sEKEL1ConcCdLKsQzFfWxSJJVdQRrgAs+f7wtsQao+OAJMF79BlH?=
 =?us-ascii?Q?KYvSB8SnL1EZlfErth0mBzNVJ3YXuwNJN59wrzYAlOgs1MsArv9K5yzPQGHt?=
 =?us-ascii?Q?qK9nLdNxpiX/c/jccIhvJcJaBWbFy8+RmigYibE5FUm3JtWV90qO9wCuiKWz?=
 =?us-ascii?Q?Ym6dgw9Tkvjw39veFk3DQV8s9oflpuD/i29yzoa4Z09lj0iqrQXBAbWpftXY?=
 =?us-ascii?Q?F/ziVGSdXdG/2Sk3QbgNQyV0KNfSdFwzKdb6zo1F4+NLoLWe9B/LKLpOO69T?=
 =?us-ascii?Q?bdWiKL7nV089dCHdQ9M1dW6bjKwm4+av09di2g2iAIbyW+Jqgls9xyD2LKW1?=
 =?us-ascii?Q?I+zYQDoh1n85Sa+xGI1BX47CfPpMjvGP7Ht4XuIHXAIjE/Hkzxu/dy+dk3v9?=
 =?us-ascii?Q?BkQM9+FX9yFpG5GYTinLD29BAik3mlemuLJ23AZchr0RiBKg2u9nHjlR34tV?=
 =?us-ascii?Q?LwKpAWUgt5ZdI8rPrMMwIcruQeNQ5YMISh9G0ZD/e+jilB7SFhF7afHpc0wZ?=
 =?us-ascii?Q?hDDWKDDIXvU6lVCMuhx2DFN683OHPNVad7hpDChmvVAg+uT38WGLy37805hY?=
 =?us-ascii?Q?NBujZWYd8MEHLTFaufmvL02zN6/85thk?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8254.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(52116014)(376014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?e5xGpdc4aDVdZV93uQPMBCxgLHYRoPZV3KE1iQwWWPEgs6183wsNU/NwJ1Fw?=
 =?us-ascii?Q?UvsdhAgprPeGGKJw7uTBcJBwoETaN87iPUGaF1dYNWdgQ+q1eowbSaOCgBqS?=
 =?us-ascii?Q?7OihPuZb0rBNP3Fs6U3MnWv8cZY0TdCEAA7ZDWDJBON1b2PgUPXM/KwK+bd/?=
 =?us-ascii?Q?JwJdw6d+ZZ3D9lMGhPTisg+wghDaRUdRUR0d+Ij5vtTm2ny3Xtm7UZphkkMj?=
 =?us-ascii?Q?PUccx/0zqEGWj8eTX+7/TsSERrfr/MJNbsJifsv6/juLYxj3+6DwZ99ogTfM?=
 =?us-ascii?Q?8tN26kaISwtHMUUP5wQ+AQtGegA/HRA6i1b/EuV8yy84trAfwDs6iEH+3gVv?=
 =?us-ascii?Q?j+ei3DqYbgtHD4rEe/jvbLtOxh9cbxdQmBGcfs3oCA//wTGjaOz1Amm/vsel?=
 =?us-ascii?Q?rHROAtBgRz9Nlz454KwrpFyvEKlh12bSu9xOpCFzSnyHTwelb/bogED+z485?=
 =?us-ascii?Q?Q7gAcGZz5XtRwmqKVrW9zbj4rZQi6F6XUpadN0aKHqqzrH32LlHd1EWIOGdL?=
 =?us-ascii?Q?V0En9Vw9Z8MwkDeQIyfBMikgbYx0CNXkRotof60iRUDCM+bIfMhi09gOWITK?=
 =?us-ascii?Q?wX0hpEYf0Ulqc2s9mV15uoQT+DQMhhIElCsRPFmOTSuF8F1urUqtomKXj/vG?=
 =?us-ascii?Q?ohdCfKXv7EDpOtk7kX0MFzDbEJsjgnK+tZWo8HTKlvxhXQmVDG0stuLUiAub?=
 =?us-ascii?Q?QTt3xUanDDoGzlhSn2R6aPv/yqgqs98B2Xyq+Kp1z5193qaRdRszCuD/NRGl?=
 =?us-ascii?Q?/Gs4/aqhcnxwzVLOLi/5ELNjtTvoYY2LQLNqF7iVol7jUO/x89EVFz7y/php?=
 =?us-ascii?Q?bk09W9HbqOo9fG62lttGpd/s31ryJ7ZsS3anZyy9Vs+efDND8UcmGJYMJ6KQ?=
 =?us-ascii?Q?Sy2t1nW0Atkqq2rQMEzQgWfS0xFs+Moq1dwVt1hkeQfQ503JULk3w1vgItGc?=
 =?us-ascii?Q?DmPfnFuqgOFhu4ofX3m56O9Xq8LS3LoN/w6gxBgtHSdOmjYS4t1iYeDGc6So?=
 =?us-ascii?Q?KuIZS9sHMo0yDX4X/oOihRLQM4G+0Bswg5Uu/7rlrM/yVFoYZvZd6dBPPigK?=
 =?us-ascii?Q?q/0vVN8nKxwGg4d4nbxK6HHkI/RFzGmGkvrU2ggDrqXOqRKHaXfW7H8618Zo?=
 =?us-ascii?Q?33CL1mkkIr9opeL+EfDrjGMC6DL+NuoRTmloE8YXndHG5ffVN2dWkiQw77Jm?=
 =?us-ascii?Q?jp8ywKt8/LdLOrWrNKEcn+4r/J/MGeAUCxqkpjCrgDEFySCpIRJWcHPzZEHa?=
 =?us-ascii?Q?I6AsGK5BEWE/TfkGF2t3Buc2ZAqFvnx9FlSJnhAy7hZgciMg6rtS3Aytzj0U?=
 =?us-ascii?Q?nKbcuQQGcYF74KM7S2rA8fX8lVIW6PeB9dwBAcx/GZH7MxR5vUexuPDgvklc?=
 =?us-ascii?Q?KsABr+eD75VhAaxUy6ty+vLiI/6lyqgheUav0hxtqUxpQgPBw7oXwg1I/rh1?=
 =?us-ascii?Q?CzVhA2A/t3XXKtKSdw+EnbPB1kwrJybroLEZcemnXzgq8QU8ti0TRZCkfJP4?=
 =?us-ascii?Q?25hxH9GVHDgzJX/6Kyh7cdg30k4pV6heb+f4uBSGt5TrcCHar94ZmhZMMHh+?=
 =?us-ascii?Q?2b1P/yr1N5SoJ3QtYGBKpF7Yxqb64UCAJUxqjP/q?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cba32e3c-aca8-4842-d37b-08dd70efd81b
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8254.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Apr 2025 07:35:58.4149
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ox0uIplFf0P8pmXSSZj51CsbV3YD9JuptlUgHJ7/xzfvwdlu9opcKvjiFeDdI+0dsPAjqIVWl3C36OyUF1Qxlw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8893

From: Ming Qian <ming.qian@oss.nxp.com>

The amphion decoder firmware supports a low latency flush mode for the
HEVC format since v1.9.0. This feature, which is enabled when the
display delay is set to 0, can help to reduce the decoding latency by
appending some padding data to every frame.

Signed-off-by: Ming Qian <ming.qian@oss.nxp.com>
Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
---
v5
- Apply FIELD_PREP() and FIELD_GET() in CHECK_VERSION
v4
- Add CHECK_VERSION macro
v3
- Improve commit message as recommended
v2
- Improve commit message
- Add firmware version check

 drivers/media/platform/amphion/vpu_malone.c | 24 ++++++++++++++++++---
 1 file changed, 21 insertions(+), 3 deletions(-)

diff --git a/drivers/media/platform/amphion/vpu_malone.c b/drivers/media/platform/amphion/vpu_malone.c
index 5c6b2a841b6f..b6e4996c2d91 100644
--- a/drivers/media/platform/amphion/vpu_malone.c
+++ b/drivers/media/platform/amphion/vpu_malone.c
@@ -68,6 +68,12 @@
 
 #define MALONE_DEC_FMT_RV_MASK			BIT(21)
 
+#define MALONE_VERSION_MASK			0xFFFFF
+#define MALONE_VERSION(maj, min, inc)		\
+		(FIELD_PREP(0xF0000, maj) | FIELD_PREP(0xFF00, min) | FIELD_PREP(0xFF, inc))
+#define CHECK_VERSION(iface, maj, min)		\
+		(FIELD_GET(MALONE_VERSION_MASK, (iface)->fw_version) >= MALONE_VERSION(maj, min, 0))
+
 enum vpu_malone_stream_input_mode {
 	INVALID_MODE = 0,
 	FRAME_LVL,
@@ -332,6 +338,8 @@ struct vpu_dec_ctrl {
 	u32 buf_addr[VID_API_NUM_STREAMS];
 };
 
+static const struct malone_padding_scode *get_padding_scode(u32 type, u32 fmt);
+
 u32 vpu_malone_get_data_size(void)
 {
 	return sizeof(struct vpu_dec_ctrl);
@@ -654,9 +662,15 @@ static int vpu_malone_set_params(struct vpu_shared_addr *shared,
 		hc->jpg[instance].jpg_mjpeg_interlaced = 0;
 	}
 
-	hc->codec_param[instance].disp_imm = params->display_delay_enable ? 1 : 0;
-	if (malone_format != MALONE_FMT_AVC)
+	if (params->display_delay_enable &&
+	    get_padding_scode(SCODE_PADDING_BUFFLUSH, params->codec_format))
+		hc->codec_param[instance].disp_imm = 1;
+	else
 		hc->codec_param[instance].disp_imm = 0;
+
+	if (params->codec_format == V4L2_PIX_FMT_HEVC && !CHECK_VERSION(iface, 1, 9))
+		hc->codec_param[instance].disp_imm = 0;
+
 	hc->codec_param[instance].dbglog_enable = 0;
 	iface->dbglog_desc.level = 0;
 
@@ -1024,6 +1038,7 @@ static const struct malone_padding_scode padding_scodes[] = {
 	{SCODE_PADDING_EOS,      V4L2_PIX_FMT_JPEG,        {0x0, 0x0}},
 	{SCODE_PADDING_BUFFLUSH, V4L2_PIX_FMT_H264,        {0x15010000, 0x0}},
 	{SCODE_PADDING_BUFFLUSH, V4L2_PIX_FMT_H264_MVC,    {0x15010000, 0x0}},
+	{SCODE_PADDING_BUFFLUSH, V4L2_PIX_FMT_HEVC,        {0x3e010000, 0x20}},
 };
 
 static const struct malone_padding_scode padding_scode_dft = {0x0, 0x0};
@@ -1058,8 +1073,11 @@ static int vpu_malone_add_padding_scode(struct vpu_buffer *stream_buffer,
 	int ret;
 
 	ps = get_padding_scode(scode_type, pixelformat);
-	if (!ps)
+	if (!ps) {
+		if (scode_type == SCODE_PADDING_BUFFLUSH)
+			return 0;
 		return -EINVAL;
+	}
 
 	wptr = readl(&str_buf->wptr);
 	if (wptr < stream_buffer->phys || wptr > stream_buffer->phys + stream_buffer->length)
-- 
2.43.0-rc1


