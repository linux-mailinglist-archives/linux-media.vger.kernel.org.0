Return-Path: <linux-media+bounces-62589-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wAbIKrgvEGoaUwYAu9opvQ
	(envelope-from <linux-media+bounces-62589-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 22 May 2026 12:28:08 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 25C885B212F
	for <lists+linux-media@lfdr.de>; Fri, 22 May 2026 12:28:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 8D2EA30C9123
	for <lists+linux-media@lfdr.de>; Fri, 22 May 2026 10:20:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B1D263D567B;
	Fri, 22 May 2026 10:18:43 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from leonov.paulk.fr (leonov.paulk.fr [185.233.101.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8F083D5666;
	Fri, 22 May 2026 10:18:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.233.101.22
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779445123; cv=none; b=mLX4MFQfeSBkASM4nB98w6onZlgWtVVLPbxTBPxyJyVo9R02ZVLCUKosizRhtSPanqpF3psuPIuUVMefQGSTU9vc/0yut9vLOcCt/suMFiP0mzLenImBjo1TYbcSXs1euonw+Xvx+n5AfBzThmf1NNmQr6rkjvYYKyR9GBCVKCQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779445123; c=relaxed/simple;
	bh=rXg8LTkAKTJ8UbCnuC7jLvsrhh3AX1TUruXRYOQqzbQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ENijkUnbpxCBhZbPFxgni+dG+xei3hOkJVPl+EPo9BzR+zNwT209wm7FmwPKCf+2sa+tW/Dkat//fGcOgTmhqlgM80bMQT1PNwZpxXGfUOescfUZhiat2SmO9+zP0HUU4S4VBpPEvqW/0397l4agSqnQZ3evBLg/MITojCBOa9c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sys-base.io; spf=pass smtp.mailfrom=sys-base.io; arc=none smtp.client-ip=185.233.101.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sys-base.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sys-base.io
Received: from laika.paulk.fr (12.234.24.109.rev.sfr.net [109.24.234.12])
	by leonov.paulk.fr (Postfix) with ESMTPS id 1AB163700291;
	Fri, 22 May 2026 10:18:21 +0000 (UTC)
Received: by laika.paulk.fr (Postfix, from userid 65534)
	id 860B7B408D2; Fri, 22 May 2026 10:18:20 +0000 (UTC)
X-Spam-Level: **
Received: from shepard (unknown [192.168.1.65])
	by laika.paulk.fr (Postfix) with ESMTP id BBEE9B408D6;
	Fri, 22 May 2026 10:17:18 +0000 (UTC)
From: Paul Kocialkowski <paulk@sys-base.io>
To: devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Nicolas Dufresne <nicolas.dufresne@collabora.com>,
	Benjamin Gaignard <benjamin.gaignard@collabora.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil@kernel.org>,
	Marco Felsch <m.felsch@pengutronix.de>,
	Michael Tretter <m.tretter@pengutronix.de>,
	Paul Kocialkowski <paulk@sys-base.io>
Subject: [PATCH 13/14] media: verilisicon: imx8m: Add support for the VC8000E on i.MX8MP
Date: Fri, 22 May 2026 12:16:52 +0200
Message-ID: <20260522101653.2565125-14-paulk@sys-base.io>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260522101653.2565125-1-paulk@sys-base.io>
References: <20260522101653.2565125-1-paulk@sys-base.io>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [1.54 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[sys-base.io];
	RCVD_COUNT_FIVE(0.00)[6];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-62589-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[19];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	R_DKIM_NA(0.00)[];
	NEURAL_HAM(-0.00)[-0.507];
	FROM_NEQ_ENVFROM(0.00)[paulk@sys-base.io,linux-media@vger.kernel.org];
	TAGGED_RCPT(0.00)[linux-media,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[pengutronix.de:email,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,sys-base.io:mid,sys-base.io:email]
X-Rspamd-Queue-Id: 25C885B212F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add the required platform-specific bits for driving the VC8000E found
on the NXP i.MX8MP SoC.

Signed-off-by: Paul Kocialkowski <paulk@sys-base.io>
Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>
Co-authored-by: Marco Felsch <m.felsch@pengutronix.de>
---
 .../media/platform/verisilicon/hantro_drv.c   |   1 +
 .../media/platform/verisilicon/hantro_hw.h    |   1 +
 .../media/platform/verisilicon/imx8m_vpu_hw.c | 113 ++++++++++++++++++
 3 files changed, 115 insertions(+)

diff --git a/drivers/media/platform/verisilicon/hantro_drv.c b/drivers/media/platform/verisilicon/hantro_drv.c
index 2de27f0a2be0..540e3b647fe4 100644
--- a/drivers/media/platform/verisilicon/hantro_drv.c
+++ b/drivers/media/platform/verisilicon/hantro_drv.c
@@ -874,6 +874,7 @@ static const struct of_device_id of_hantro_match[] = {
 #endif
 #ifdef CONFIG_VIDEO_HANTRO_IMX8M
 	{ .compatible = "nxp,imx8mm-vpu-g1", .data = &imx8mm_vpu_g1_variant, },
+	{ .compatible = "nxp,imx8mp-vpu-vc8000e", .data = &imx8mp_vpu_vc8000e_variant, },
 	{ .compatible = "nxp,imx8mq-vpu", .data = &imx8mq_vpu_variant, },
 	{ .compatible = "nxp,imx8mq-vpu-g1", .data = &imx8mq_vpu_g1_variant },
 	{ .compatible = "nxp,imx8mq-vpu-g2", .data = &imx8mq_vpu_g2_variant },
diff --git a/drivers/media/platform/verisilicon/hantro_hw.h b/drivers/media/platform/verisilicon/hantro_hw.h
index a0c752ef44dd..5f79fb401da5 100644
--- a/drivers/media/platform/verisilicon/hantro_hw.h
+++ b/drivers/media/platform/verisilicon/hantro_hw.h
@@ -420,6 +420,7 @@ enum hantro_enc_fmt {
 	ROCKCHIP_VPU_ENC_FMT_UYVY422 = 3,
 };
 
+extern const struct hantro_variant imx8mp_vpu_vc8000e_variant;
 extern const struct hantro_variant imx8mm_vpu_g1_variant;
 extern const struct hantro_variant imx8mq_vpu_g1_variant;
 extern const struct hantro_variant imx8mq_vpu_g2_variant;
diff --git a/drivers/media/platform/verisilicon/imx8m_vpu_hw.c b/drivers/media/platform/verisilicon/imx8m_vpu_hw.c
index f9f276385c11..50ce4a5f979d 100644
--- a/drivers/media/platform/verisilicon/imx8m_vpu_hw.c
+++ b/drivers/media/platform/verisilicon/imx8m_vpu_hw.c
@@ -234,6 +234,96 @@ static const struct hantro_fmt imx8m_vpu_g2_dec_fmts[] = {
 	},
 };
 
+static const struct hantro_fmt imx8mp_vc8000e_fmts[] = {
+	{
+		.fourcc = V4L2_PIX_FMT_YUV420M,
+		.codec_mode = HANTRO_MODE_NONE,
+		.enc_fmt = ROCKCHIP_VPU_ENC_FMT_YUV420P,
+		.frmsize = {
+			.min_width = FMT_MIN_WIDTH,
+			.max_width = FMT_FHD_WIDTH,
+			.step_width = MB_DIM,
+			.min_height = FMT_MIN_HEIGHT,
+			.max_height = FMT_FHD_HEIGHT,
+			/* TODO: implement dummy reads to relax size restrictions */
+			.step_height = 64,
+		},
+	}, {
+		.fourcc = V4L2_PIX_FMT_YUV420,
+		.codec_mode = HANTRO_MODE_NONE,
+		.enc_fmt = ROCKCHIP_VPU_ENC_FMT_YUV420P,
+		.frmsize = {
+			.min_width = FMT_MIN_WIDTH,
+			.max_width = FMT_FHD_WIDTH,
+			.step_width = MB_DIM,
+			.min_height = FMT_MIN_HEIGHT,
+			.max_height = FMT_FHD_HEIGHT,
+			/* TODO: implement dummy reads to relax size restrictions */
+			.step_height = 64,
+		},
+	}, {
+		.fourcc = V4L2_PIX_FMT_NV12M,
+		.codec_mode = HANTRO_MODE_NONE,
+		.enc_fmt = ROCKCHIP_VPU_ENC_FMT_YUV420SP,
+		.frmsize = {
+			.min_width = FMT_MIN_WIDTH,
+			.max_width = FMT_FHD_WIDTH,
+			.step_width = MB_DIM,
+			.min_height = FMT_MIN_HEIGHT,
+			.max_height = FMT_FHD_HEIGHT,
+			.step_height = MB_DIM,
+		},
+	}, {
+		.fourcc = V4L2_PIX_FMT_NV12,
+		.codec_mode = HANTRO_MODE_NONE,
+		.enc_fmt = ROCKCHIP_VPU_ENC_FMT_YUV420SP,
+		.frmsize = {
+			.min_width = FMT_MIN_WIDTH,
+			.max_width = FMT_FHD_WIDTH,
+			.step_width = MB_DIM,
+			.min_height = FMT_MIN_HEIGHT,
+			.max_height = FMT_FHD_HEIGHT,
+			.step_height = MB_DIM,
+		},
+	}, {
+		.fourcc = V4L2_PIX_FMT_YUYV,
+		.codec_mode = HANTRO_MODE_NONE,
+		.enc_fmt = ROCKCHIP_VPU_ENC_FMT_YUYV422,
+		.frmsize = {
+			.min_width = FMT_MIN_WIDTH,
+			.max_width = FMT_FHD_WIDTH,
+			.step_width = MB_DIM,
+			.min_height = FMT_MIN_HEIGHT,
+			.max_height = FMT_FHD_HEIGHT,
+			.step_height = MB_DIM,
+		},
+	}, {
+		.fourcc = V4L2_PIX_FMT_UYVY,
+		.codec_mode = HANTRO_MODE_NONE,
+		.enc_fmt = ROCKCHIP_VPU_ENC_FMT_UYVY422,
+		.frmsize = {
+			.min_width = FMT_MIN_WIDTH,
+			.max_width = FMT_FHD_WIDTH,
+			.step_width = MB_DIM,
+			.min_height = FMT_MIN_HEIGHT,
+			.max_height = FMT_FHD_HEIGHT,
+			.step_height = MB_DIM,
+		},
+	}, {
+		.fourcc = V4L2_PIX_FMT_H264_SLICE,
+		.codec_mode = HANTRO_MODE_H264_ENC,
+		.max_depth = 2,
+		.frmsize = {
+			.min_width = FMT_MIN_WIDTH,
+			.max_width = FMT_FHD_WIDTH,
+			.step_width = MB_DIM,
+			.min_height = FMT_MIN_HEIGHT,
+			.max_height = FMT_FHD_HEIGHT,
+			.step_height = MB_DIM,
+		},
+	},
+};
+
 static int imx8mq_vpu_hw_init(struct hantro_dev *vpu)
 {
 	vpu->ctrl_base = vpu->reg_bases[vpu->variant->num_regs - 1];
@@ -305,6 +395,15 @@ static const struct hantro_codec_ops imx8mq_vpu_g2_codec_ops[] = {
 	},
 };
 
+static const struct hantro_codec_ops imx8mp_vpu_vc8000e_codec_ops[] = {
+	[HANTRO_MODE_H264_ENC] = {
+		.run = hantro_vc8000e_h264_enc_run,
+		.done = hantro_vc8000e_h264_enc_done,
+		.init = hantro_vc8000e_h264_enc_init,
+		.exit = hantro_vc8000e_h264_enc_exit,
+	},
+};
+
 /*
  * VPU variants.
  */
@@ -317,6 +416,10 @@ static const struct hantro_irq imx8mq_g2_irqs[] = {
 	{ "g2", hantro_g2_irq },
 };
 
+static const struct hantro_irq imx8mp_vc8000e_irqs[] = {
+	{ "vc8000e", hantro_vc8000e_irq },
+};
+
 static const char * const imx8mq_clk_names[] = { "g1", "g2", "bus" };
 static const char * const imx8mq_reg_names[] = { "g1", "g2", "ctrl" };
 static const char * const imx8mq_g1_clk_names[] = { "g1" };
@@ -382,3 +485,13 @@ const struct hantro_variant imx8mm_vpu_g1_variant = {
 	.clk_names = imx8mq_g1_clk_names,
 	.num_clocks = ARRAY_SIZE(imx8mq_g1_clk_names),
 };
+
+const struct hantro_variant imx8mp_vpu_vc8000e_variant = {
+	.enc_fmts = imx8mp_vc8000e_fmts,
+	.num_enc_fmts = ARRAY_SIZE(imx8mp_vc8000e_fmts),
+	.codec = HANTRO_H264_ENCODER,
+	.codec_ops = imx8mp_vpu_vc8000e_codec_ops,
+	.irqs = imx8mp_vc8000e_irqs,
+	.num_irqs = ARRAY_SIZE(imx8mp_vc8000e_irqs),
+	.num_clocks = 1,
+};
-- 
2.53.0


