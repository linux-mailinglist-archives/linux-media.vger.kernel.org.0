Return-Path: <linux-media+bounces-14730-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9537D92B24C
	for <lists+linux-media@lfdr.de>; Tue,  9 Jul 2024 10:40:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id F2240B22A0B
	for <lists+linux-media@lfdr.de>; Tue,  9 Jul 2024 08:40:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D9157154C05;
	Tue,  9 Jul 2024 08:40:01 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from CHN02-SH0-obe.outbound.protection.partner.outlook.cn (mail-sh0chn02on2111.outbound.protection.partner.outlook.cn [139.219.146.111])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4136D154426;
	Tue,  9 Jul 2024 08:39:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=139.219.146.111
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720514401; cv=fail; b=pobBi2p5t5pF+vRtR2wCE3vsODAINoCwoULc1JsOqnk0GZyTWrtSSDtqzz7QLf1wZuBX/cn5Bzet4gYaeOoklAnsw4K8u7RZw/2KeLbWmrnalk1IIBgCXcMcObPnbCLfkVKmxkEAGZCsw4KZu8+Os/8A9vjshl40uhiRYHZWLvY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720514401; c=relaxed/simple;
	bh=0FDg1Dj4Neu94iKgf6Vq/84ghq2Tgp84xqp4AdbB87o=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=TnUBfj3HV2QJGAZiRXD35wQZCjJagZwpCjyJmwJcGBWyuFGVj223+deduxiaib7Zgq02qoruPVjCIs8nMwMHT5HYRbCFtnHvYNIzaUQVkXslDpYIBp7F+TcNtkJlJr0Nn+k01rmQkFat2R8AS1vAyV2K9Zs1sBs5jhK2xwh1dNA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=starfivetech.com; spf=pass smtp.mailfrom=starfivetech.com; arc=fail smtp.client-ip=139.219.146.111
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=starfivetech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=starfivetech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QrHot2MMCuKAEFCHUn9WpF7+MxpxfrztbppNDJ2qjxJLrJXOUODzFLPcfssMinY5kz6EDJeT7XtAXrz1km2HNV/ZL/kzY2DlR7C7jHpKN5YKnkSdsPHMRVXBf7oS646xh4bI05xIarrYv9MOdyYbdAJ9d2q6KN30XZLxVsxk+0Z1wBkKlzsKsEtrn1JMrPfqxPSvGAxg1nMcGU1Nn3GW+IO9hK5tAvfRbQSKzS19Gi7UrhT8iLtyThf6n9mMAMRv57cUEqgk7Od7t69VJKiFMQaZfShIGxoltG0mseUq9Kgqwpn1AiilJFObynkmsr3kazWou2EdC0SvLmRrsF3dUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=thBwTr7qfYGt42akuCR7XIcF6Ei8+yjyc2yt/SHlfyE=;
 b=Lyzsk52CyY0SmKnb/sYckLhqNCS/bT4cukVB1N2p1WJD+EUE0TOFaDPtYKE47y3ddAcqQ4Wpf8KtRO4Fr/FrDqS0BOSRGdFNOcpXqLvbhWlb9rfKtUrHwj+gDKybnyhCAyeS/4sEqIfHmnF4Hv3nFBJynLuyap4B3NPiJsUoVJRbD/OsNWP2XmIuEd8hA8pv1T3f4MEI/p7IzmzoYQog/dJvVWcXZfkpoBMZ08XL0bb7vsITeHb+KEgQosGeDEU/BPh647ov4nIDPuvo4TLGpW9I1U/Cx4dlC41qoC0zz+q3G75CNCqp0P0MfU3guRIA+X9z0/hKrm5/Lj2ovr61Yg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
Received: from ZQ0PR01MB1302.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:1b::9) by ZQ0PR01MB1271.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:18::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7741.37; Tue, 9 Jul
 2024 08:38:38 +0000
Received: from ZQ0PR01MB1302.CHNPR01.prod.partner.outlook.cn
 ([fe80::64c5:50d8:4f2c:59aa]) by
 ZQ0PR01MB1302.CHNPR01.prod.partner.outlook.cn ([fe80::64c5:50d8:4f2c:59aa%6])
 with mapi id 15.20.7741.033; Tue, 9 Jul 2024 08:38:37 +0000
From: Changhuang Liang <changhuang.liang@starfivetech.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Jean-Michel Hautbois <jeanmichel.hautbois@ideasonboard.com>,
	Benjamin Gaignard <benjamin.gaignard@collabora.com>,
	Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
	Mingjia Zhang <mingjia.zhang@mediatek.com>
Cc: Jack Zhu <jack.zhu@starfivetech.com>,
	Keith Zhao <keith.zhao@starfivetech.com>,
	Changhuang Liang <changhuang.liang@starfivetech.com>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: [PATCH v5 05/14] staging: media: starfive: Separate buffer from ISP hardware operation
Date: Tue,  9 Jul 2024 01:38:15 -0700
Message-Id: <20240709083824.430473-6-changhuang.liang@starfivetech.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240709083824.430473-1-changhuang.liang@starfivetech.com>
References: <20240709083824.430473-1-changhuang.liang@starfivetech.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: ZQ0PR01CA0031.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:2::16) To ZQ0PR01MB1302.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:1b::9)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: ZQ0PR01MB1302:EE_|ZQ0PR01MB1271:EE_
X-MS-Office365-Filtering-Correlation-Id: 7337e719-7f54-4e8b-c18a-08dc9ff28727
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|41320700013|366016|52116014|7416014|38350700014;
X-Microsoft-Antispam-Message-Info:
	yeHI6/WXXV2HG1dOqFy7lwDILtUzd/WKICIqk5xSQ2Y4naWo01xW/Mu7YfQ15vKbPsJgwRLMVie/rDNuHbmNuD/L1se0xxYUc7sdWY1iOQXrUTfnjq56gZClQNLLZxYctWGTB4mvbXyjF4ZzBWc5jYFLpU090U6c1WZnHve/e3bxDCrBS9QtywoG6MZZ2AbI/1/KOacYDlSKx9vS7EJwQw014tKdso9+Io25yevTaxjH+e27FXDk1Xxn0crZnzj9ol/paJRlVyIfqqlPa2aoHa/+UHAhQ+GnGq5f0OBOyioVp2lxovNNcsXqM5RC8GgDccuI0TePpmw2dRAyw4GPmcp1JoUgmUNME2LSBqTPEVSQvWxZzekZqYaLs/QSFcV55+/aID86rc1a4ycSP/C+M7ToP6wbzRzk3PgaCEz4MHreeuK1ttLB7e7raK8ts5RS71nNvUxb9kAiK3NKXaefoVYvglyG+L+pQR379BadbIO5Ce13I3Q0RkohffZXerCCeMFFSmGkWyHW6tn3gPScmkhoHhCw4kmq8D2noyKmFx1qSc9XOepapQYZ3XEBn3MLXOgmz5kHo4hKpfPTe8+gOdyKOsKnv1HK5J9zXixJ9ISfCzUmsJNeSfy4PqJjBoN8
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZQ0PR01MB1302.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(41320700013)(366016)(52116014)(7416014)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?XeAeDfOWDP3ODFJcdEjZ3qTsKD8l/YTm+XkgAO+/Fs9A4bFqPh7F3UPzqBYg?=
 =?us-ascii?Q?2wAAwNnUz62igHjfx5SpdR2RKACioa0u4z9qqUxsa8mjIg99YfuUleMBBBEX?=
 =?us-ascii?Q?owoithvml61lbt1c5NSe+LxEBRsg4jaTx3lVAFWfoAMm15OUyEweB5eqNJ0d?=
 =?us-ascii?Q?chtzPJ/DBJI8V6qlLTm2ZZRgIuE3ITh9InFXo6LL/vE3ac0gu8zYOCpGkk33?=
 =?us-ascii?Q?xnDbXD/kWIKgZJl2mPXdu5N++hd4lgGSRi8KFYXvTvsEC8LGQesNw4igUnRA?=
 =?us-ascii?Q?dvsso2UDEUFVUB0uGxigSxvQg4iL0ksyeP/mHd6s1qGi8y44ZH5lzBUpb2RS?=
 =?us-ascii?Q?PqsNd4wQru3qzcht9dI1F44rLaVvNqLYmeH4lIhPn/cNfluuaqxfLWyyQEMs?=
 =?us-ascii?Q?gBxWZNt8sY0uvsfx3sAxXO1S51tcAEKKK08+N+sJCZCeyRuGRrV/FwJ/qJrM?=
 =?us-ascii?Q?UyQuyEQ6v4sXE+CjadbwO1u/iyodyLR/JGcaw7XrCjZ1KXOFTm4gWvohBIjg?=
 =?us-ascii?Q?jqqw6PHE0Kvh0owyedIQKwZInTJbouf9wvZO9xOpuTf9Ws7URHp53sxc8oXN?=
 =?us-ascii?Q?q00TbrYILCEqXhPGAWc7KSzZf+NkJIOH/8YAG5634ISwwrIoRa+XMhwqWFgP?=
 =?us-ascii?Q?bfGYjv86qogyLfp8YzL6FsD2QKvB9YQ4DbibJcIkDIq8A5xmz6QDwkE90/NQ?=
 =?us-ascii?Q?jgUWE9kgR85o2KPENsgdMIZvEKP8kUN2e/Pl9p+xlS6U8EyYVaNslNjgFWoB?=
 =?us-ascii?Q?PPdOFGaSoaJSBOpVn9jW52cWOwS5rE6dpmxCtgg71ZBbT0vzzxcIhFucLCoo?=
 =?us-ascii?Q?sVksh0a5+lnFVVAoClrbhM5tWahaOwIVtIYjwfnaG3WAGOhjTPMaklknNgql?=
 =?us-ascii?Q?+1SDE7jrh1GYFfxJ1xsm/IsALOY0Z49QDkoBAEQBvIra4KRADsKjWrerkh86?=
 =?us-ascii?Q?0N6jqsAmtSFSAyrYbcjdTUAl/Ffg01HwRRwZOs6uZIsCWObDDI9euW9UTZnM?=
 =?us-ascii?Q?QUQ2t00eBrAklNSEdRzl9UEzYAgLGxVgokW3jxNbA4JhkNKQI7Q4YVJuwmL6?=
 =?us-ascii?Q?OQ56Mi69LW7ppQXbcgnF6Bu1mwA9HabRqChJS3Vy+j4dGEBtEHwtMhQG346J?=
 =?us-ascii?Q?3Cg6ut3+B71/vot/P9n/ajj0nGSTxi+jQZcBJ9NuJU6EE0ja682RBSZ1io6H?=
 =?us-ascii?Q?9vXc+sAESOzd3Edxy7sSuxrpoQjF4uzIh2ZsqDDBDorMGzIKji4+dR43lcUX?=
 =?us-ascii?Q?wSkFNO7IOwfOcxtWMVJ1oFuLfYo48Pi0LWBccHDUrIFXGoSa9R8r4A8Oce81?=
 =?us-ascii?Q?dZMe+q/8xZVNB6iRAy0OLUQtQLFQr+uYUQ74VDtDym29xlBDvu8znsqghN+Q?=
 =?us-ascii?Q?VtRUDFlFzTwCvYEQ1z+cElpgJnEguC4T0HFEYZsLd6vLUXek1NUFwrKK7KKi?=
 =?us-ascii?Q?j7TNcdM5aa9uO8t+nm+2r+1YJsCLnFm7LxNdSeJDLTF6Q9aOMHh5bWOyXdyR?=
 =?us-ascii?Q?EQzCr/xJ/mzLq6srSDF67BydRigT7HU0iCfQ/sBgX/MBXTU1qyaEkXpP30pT?=
 =?us-ascii?Q?wK4PPLhY2qTBad6hU5AeUVpOLY2lRmwk+6CwfpkFAsu4WvvYnCYz0CDg+ArZ?=
 =?us-ascii?Q?AExcdJDJC37by5gY0+Yuou4=3D?=
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7337e719-7f54-4e8b-c18a-08dc9ff28727
X-MS-Exchange-CrossTenant-AuthSource: ZQ0PR01MB1302.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jul 2024 08:38:37.9544
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bVJn9V9c8i4vMP/mGzPaHNje1YtvDeeP3GL1u3Zwefol+f+00auLdVEhRstpeNQZrhMxwsJVDTeegBAUtvmqLIXTpD/4al32wPx/vDUA+ihx09zxWDtJTGx2kFqZ5PSt
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZQ0PR01MB1271

Separate buffer from ISP hardware operation. Convenient to extract the
buffer be a common file.
Replace "while" with "if" in stf_buf_done helper function because one
interrupt signal only handle one video buffer.

Signed-off-by: Changhuang Liang <changhuang.liang@starfivetech.com>
---
 .../media/starfive/camss/stf-capture.c        | 63 +++++++++++--------
 1 file changed, 36 insertions(+), 27 deletions(-)

diff --git a/drivers/staging/media/starfive/camss/stf-capture.c b/drivers/staging/media/starfive/camss/stf-capture.c
index ec5169e7b391..494e56e731f0 100644
--- a/drivers/staging/media/starfive/camss/stf-capture.c
+++ b/drivers/staging/media/starfive/camss/stf-capture.c
@@ -368,7 +368,7 @@ static void stf_buf_flush(struct stf_v_buf *output, enum vb2_buffer_state state)
 	}
 }
 
-static void stf_buf_done(struct stf_v_buf *output)
+static struct stfcamss_buffer *stf_buf_done(struct stf_v_buf *output)
 {
 	struct stfcamss_buffer *ready_buf;
 	u64 ts = ktime_get_ns();
@@ -376,27 +376,27 @@ static void stf_buf_done(struct stf_v_buf *output)
 
 	if (output->state == STF_OUTPUT_OFF ||
 	    output->state == STF_OUTPUT_RESERVED)
-		return;
+		return NULL;
 
 	spin_lock_irqsave(&output->lock, flags);
 
-	while ((ready_buf = stf_buf_get_ready(output))) {
+	ready_buf = stf_buf_get_ready(output);
+	if (ready_buf) {
 		ready_buf->vb.vb2_buf.timestamp = ts;
 		ready_buf->vb.sequence = output->sequence++;
-
-		vb2_buffer_done(&ready_buf->vb.vb2_buf, VB2_BUF_STATE_DONE);
 	}
 
 	spin_unlock_irqrestore(&output->lock, flags);
+
+	return ready_buf;
 }
 
-static void stf_change_buffer(struct stf_v_buf *output)
+static struct stfcamss_buffer *stf_change_buffer(struct stf_v_buf *output)
 {
 	struct stf_capture *cap = container_of(output, struct stf_capture,
 					       buffers);
 	struct stfcamss *stfcamss = cap->video.stfcamss;
 	struct stfcamss_buffer *ready_buf;
-	dma_addr_t *new_addr;
 	unsigned long flags;
 	u32 active_index;
 
@@ -404,7 +404,7 @@ static void stf_change_buffer(struct stf_v_buf *output)
 	    output->state == STF_OUTPUT_STOPPING ||
 	    output->state == STF_OUTPUT_RESERVED ||
 	    output->state == STF_OUTPUT_IDLE)
-		return;
+		return NULL;
 
 	spin_lock_irqsave(&output->lock, flags);
 
@@ -426,37 +426,37 @@ static void stf_change_buffer(struct stf_v_buf *output)
 
 	/* Get next buffer */
 	output->buf[active_index] = stf_buf_get_pending(output);
-	if (!output->buf[active_index]) {
-		new_addr = ready_buf->addr;
+	if (!output->buf[active_index])
 		stf_buf_update_on_last(output);
-	} else {
-		new_addr = output->buf[active_index]->addr;
+	else
 		stf_buf_update_on_next(output);
-	}
 
-	if (output->state == STF_OUTPUT_STOPPING) {
+	if (output->state == STF_OUTPUT_STOPPING)
 		output->last_buffer = ready_buf;
-	} else {
-		if (cap->type == STF_CAPTURE_RAW)
-			stf_set_raw_addr(stfcamss, new_addr[0]);
-		else if (cap->type == STF_CAPTURE_YUV)
-			stf_set_yuv_addr(stfcamss, new_addr[0], new_addr[1]);
-
+	else
 		stf_buf_add_ready(output, ready_buf);
-	}
 
 out_unlock:
 	spin_unlock_irqrestore(&output->lock, flags);
+
+	return output->buf[active_index];
 }
 
 irqreturn_t stf_wr_irq_handler(int irq, void *priv)
 {
 	struct stfcamss *stfcamss = priv;
 	struct stf_capture *cap = &stfcamss->captures[STF_CAPTURE_RAW];
+	struct stfcamss_buffer *change_buf;
+	struct stfcamss_buffer *ready_buf;
 
 	if (atomic_dec_if_positive(&cap->buffers.frame_skip) < 0) {
-		stf_change_buffer(&cap->buffers);
-		stf_buf_done(&cap->buffers);
+		change_buf = stf_change_buffer(&cap->buffers);
+		if (change_buf)
+			stf_set_raw_addr(stfcamss, change_buf->addr[0]);
+
+		ready_buf = stf_buf_done(&cap->buffers);
+		if (ready_buf)
+			vb2_buffer_done(&ready_buf->vb.vb2_buf, VB2_BUF_STATE_DONE);
 	}
 
 	stf_syscon_reg_set_bit(stfcamss, VIN_INRT_PIX_CFG, U0_VIN_INTR_CLEAN);
@@ -469,12 +469,16 @@ irqreturn_t stf_isp_irq_handler(int irq, void *priv)
 {
 	struct stfcamss *stfcamss = priv;
 	struct stf_capture *cap = &stfcamss->captures[STF_CAPTURE_YUV];
+	struct stfcamss_buffer *ready_buf;
 	u32 status;
 
 	status = stf_isp_reg_read(stfcamss, ISP_REG_ISP_CTRL_0);
 	if (status & ISPC_ISP) {
-		if (status & ISPC_ENUO)
-			stf_buf_done(&cap->buffers);
+		if (status & ISPC_ENUO) {
+			ready_buf = stf_buf_done(&cap->buffers);
+			if (ready_buf)
+				vb2_buffer_done(&ready_buf->vb.vb2_buf, VB2_BUF_STATE_DONE);
+		}
 
 		stf_isp_reg_write(stfcamss, ISP_REG_ISP_CTRL_0,
 				  (status & ~ISPC_INT_ALL_MASK) |
@@ -488,13 +492,18 @@ irqreturn_t stf_line_irq_handler(int irq, void *priv)
 {
 	struct stfcamss *stfcamss = priv;
 	struct stf_capture *cap = &stfcamss->captures[STF_CAPTURE_YUV];
+	struct stfcamss_buffer *change_buf;
 	u32 status;
 
 	status = stf_isp_reg_read(stfcamss, ISP_REG_ISP_CTRL_0);
 	if (status & ISPC_LINE) {
 		if (atomic_dec_if_positive(&cap->buffers.frame_skip) < 0) {
-			if ((status & ISPC_ENUO))
-				stf_change_buffer(&cap->buffers);
+			if ((status & ISPC_ENUO)) {
+				change_buf = stf_change_buffer(&cap->buffers);
+				if (change_buf)
+					stf_set_yuv_addr(stfcamss, change_buf->addr[0],
+							 change_buf->addr[1]);
+			}
 		}
 
 		stf_isp_reg_set_bit(stfcamss, ISP_REG_CSIINTS,
-- 
2.25.1


