Return-Path: <linux-media+bounces-28255-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 196A4A61505
	for <lists+linux-media@lfdr.de>; Fri, 14 Mar 2025 16:34:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8E2723B5915
	for <lists+linux-media@lfdr.de>; Fri, 14 Mar 2025 15:33:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 543D32036E2;
	Fri, 14 Mar 2025 15:30:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eAMrZt0h"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD3A42063DF;
	Fri, 14 Mar 2025 15:30:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741966223; cv=none; b=geMIau31dZ0G3P16dIWknBrsMDw9THkNocf3JJOg0lgI+otjeg66bIuEYnBmL53hs10OyAgPHSqhbQAkGCyZJ/R0+Ao/tz6JllIVFk5qunjgewZupwa4LyFwbzjysVTK435Ch0IGoGBw+cqFkwEt0wfxpOEj9F8Bw6dXLLmxa0k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741966223; c=relaxed/simple;
	bh=r0sr/7YZuJt4Y9rovYJ5z7u6PGv6KqCVjK/ti+lW4mM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=ZsAZVc/nvLSQDJfzAMqTeDq9Gff9t/XTmi3QkYtlhqWd4hiVdFxo8WTmjphPt8qsrXJ0z1RbLspW/jg59tMQpTi1Ih63OFLjEbTRtz6zhDPfBC/Yew9nKbSFSSWS9rGIR/XgxP9v0llsdivhRK9kOhaEg4YkiJrG6eEKWd2jQuQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eAMrZt0h; arc=none smtp.client-ip=209.85.208.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-30bf251025aso19082281fa.1;
        Fri, 14 Mar 2025 08:30:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741966215; x=1742571015; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AR2TRuW5OEu1ldh093lsNiXcq3kCpToedKiVWBRuWm4=;
        b=eAMrZt0hA2uTX/ljkpsu0iL6284fpBBd1+T9kj24jFRuonCZ3rJBDAJKFeI/xOEsLp
         wE/UOTCApXiOUtMzqt2GkKMnXuedmG9M74INk3TT2y0M/1Rrya7uUra0bvWO34Y3SpHW
         XKMgwjRftDyRw+7Q44q66pjgkCfNKJdukL52aO7zqgl4qN6Icrv8sp+2Ew1FNdpm/s4M
         n5cVYhz79goTiLsdj5onbDITPu8QY1cdjE7sijixVvdCr1HOoTkdweq98cfvWjP94DCk
         P8VUx5If1e2TDwGbAD4hVYCpmcwVsUc7agsnXfqDzN8sNp0QXEgjFzKdWnyCN260nuIi
         /Bgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741966215; x=1742571015;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AR2TRuW5OEu1ldh093lsNiXcq3kCpToedKiVWBRuWm4=;
        b=qEIOSY73GAIZMVFJ89TvKjCDVeQABdPKkjV4JKhzPC1gipfsh7XS5VxRQ5nEyk5KAk
         joQ58H7/njhAwycWvd1Fky7drJZAbZglVGjugUBgAsxfswpswQXX2CYlWLX8EglxzcJY
         rVaekWbecp0eb/ST3vGm6l/uSExPV8GtJxWcfxLHbvxmXjoOtcoZIOInGyiFxECL9vAy
         Pcoxai2UoVBEYdo0Op7xUloyTc/whMYTPLAm5P1T5bOiBhKhtsNZDHxjT4MwwhgInlIf
         93BHmBpXJhM/2bvXh8UN9tkobHqjnOaGQWiOGD61jK30uchCIubMJyttRofIH1PjgEsU
         SZBg==
X-Forwarded-Encrypted: i=1; AJvYcCUh0cHeacRx/jNG4SK2iWLvuKXPRkruDgWrWTAqwpAQyz8+DevFwqWkwgDdgJop1DNuEg5Vi9mWII5oc4s=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw8EX5FHBeYXRugTCO9/bb7iflZNMga0+FuXcAlv8/+qR9HouzZ
	WSFAtcc/ydGLPAO+ANjPnGnwvkFP5uqkSrtYsDcug81Ppsrqs9/tsk95KZC1EEs=
X-Gm-Gg: ASbGncsNNRwtNNfFMavHd7KjiiknaPUJxlImd8JrLLYmZIJLCT75hgg6/rlx3UlmxtH
	CEcdJxeAn49xZnmHniIxm2qrmKOoR9Fi7mAoxvWQAdRdNLRxB60vgf4pgjNN9NTH0XL0CGWvmZa
	k+UBIWSkH79Ag0dj+7cac6hQPRVlETw9LH3ZJQNRXb04NQ+r1Dd2vOOdQmt5j654Cxx/KhGBnfK
	BS+v6+4t4kYgSJG9FJfxWo0Y0d8w7qW2GFLCX1KFs5zlbYShXKPYLE6omB/o8kIwNobLh/k3ip6
	nQz9OC7QOa3EH4xGC2CK3kYpLNu/zj23T5OaaTbDWipd/SAs4SCbSkg1gvQcQtb+EZuX
X-Google-Smtp-Source: AGHT+IHZabrxIKCeZnDK/3egOUwzqxtkUnxWRgwfQwAOSiw/zPLOyuEfKq6IPsOxcNf+xFP4TM35Lg==
X-Received: by 2002:a05:651c:b22:b0:30c:aae:6d61 with SMTP id 38308e7fff4ca-30c4a8d8bcamr8783861fa.30.1741966214060;
        Fri, 14 Mar 2025 08:30:14 -0700 (PDT)
Received: from skhimich.dev.yadro.com (avpn02.yadro.com. [89.207.88.245])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-30c3f0e99f6sm6253581fa.37.2025.03.14.08.30.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Mar 2025 08:30:13 -0700 (PDT)
From: Sergey Khimich <serghox@gmail.com>
To: linux-media@vger.kernel.org
Cc: Philipp Zabel <p.zabel@pengutronix.de>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-kernel@vger.kernel.org,
	Vladimir Yakovlev <vovchkir@gmail.com>,
	Maksim Turok <turok.m7@gmail.com>
Subject: [PATCH 18/18] media: coda: add support coda988 enc and dec
Date: Fri, 14 Mar 2025 18:29:39 +0300
Message-Id: <20250314152939.2759573-19-serghox@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20250314152939.2759573-1-serghox@gmail.com>
References: <20250314152939.2759573-1-serghox@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Sergey Khimich <serghox@gmail.com>

Implemet support for Chips&Media coda988 encoder & decoder.

support codecs h264enc/dec, h263enc/dec mpeg4enc/dec vp8dec
support formats yuv420p(I420), yvu420p(YV12), NV12, NV21
special config for mem_ctrl
special config for encoder header (sps and pps)
special set profile_idc
special set RC config
special set QP
special set slice mode
special set Motion Extimation (ME)

new v4l2_ctrls:
update coda988's v4l2_ctrl for h264 profile
update coda988's v4l2_ctrl for h264 level
add coda988's v4l2_ctrl for h.264 RC mode
add coda988's v4l2_ctrl for h.264 skipFrame
add coda988's v4l2_ctrl for h.264 i-frame min/max qp
add coda988's v4l2_ctrl for h.264 p-frame min/max qp
add coda988's v4l2_ctrl for h.264 entropy mode
add coda988's v4l2_ctrl for h.264 8x8transform
add coda988's v4l2_ctrl for h.264 i-frame period
add coda988's v4l2_ctrl for h.264 Access Unit Delimiter(AUD)
add coda988's v4l2_ctrl for h.264 me x/y search range
add coda988's v4l2_ctrl for h.264 intra refresh period
add coda988's v4l2_ctrl for h.263 intra/inter qp
add coda988's v4l2_ctrl for h.263 min/max qp
add coda988's v4l2_ctrl for mpeg4 min/max qp

Co-developed-by: Vladimir Yakovlev <vovchkir@gmail.com>
Signed-off-by: Vladimir Yakovlev <vovchkir@gmail.com>
Co-developed-by: Maksim Turok <turok.m7@gmail.com>
Signed-off-by: Maksim Turok <turok.m7@gmail.com>
Signed-off-by: Sergey Khimich <serghox@gmail.com>
---
 .../platform/chips-media/coda/coda-bit.c      | 1046 ++++++++++++++---
 .../platform/chips-media/coda/coda-common.c   |  382 +++++-
 .../platform/chips-media/coda/coda-gdi.c      |  149 +++
 .../platform/chips-media/coda/coda-h264.c     |   10 +
 .../media/platform/chips-media/coda/coda.h    |   37 +-
 .../platform/chips-media/coda/coda_regs.h     |  157 +++
 6 files changed, 1615 insertions(+), 166 deletions(-)

diff --git a/drivers/media/platform/chips-media/coda/coda-bit.c b/drivers/media/platform/chips-media/coda/coda-bit.c
index 782b299e9b12..b580a41576aa 100644
--- a/drivers/media/platform/chips-media/coda/coda-bit.c
+++ b/drivers/media/platform/chips-media/coda/coda-bit.c
@@ -15,6 +15,7 @@
 #include <linux/platform_device.h>
 #include <linux/ratelimit.h>
 #include <linux/reset.h>
+#include <linux/sched.h>
 #include <linux/slab.h>
 #include <linux/videodev2.h>
 
@@ -35,6 +36,49 @@
 #define CODA7_PS_BUF_SIZE	0x28000
 #define CODA9_PS_SAVE_SIZE	(512 * 1024)
 
+/*
+ * For CODA988:
+ * In the parameter buffer, following sorts of buffer addresses
+ * are internally stored from their byte offset:
+ *   0-383: adressses of frame buffers
+ *   384-511: addresses of mv colocated buffers
+ *   512-895: bottom addresses of frambuffers (when tiled map is used)
+ *   896-1279: top address of WTL frame buffer (when WTL function is enabled)
+ *   1280: bottom address of WTL frame buffer (when WTL function is enabled)
+ */
+#define CODA988_MVC_BYTE_OFFSET		384
+#define CODA988_FB_BOT_BYTE_OFFSET	(CODA988_MVC_BYTE_OFFSET + 128)
+#define CODA988_WTL_FB_TOP_BYTE_OFFSET	(CODA988_FB_BOT_BYTE_OFFSET + 384)
+#define CODA988_WTL_FB_BOT_BYTE_OFFSET	(CODA988_WTL_FB_TOP_BYTE_OFFSET + 384)
+
+/* Advanced INTRA Coding mode. */
+#define CODA988_H263_ANNEX_I_ENABLE 0
+/* Deblocking Filter mode */
+#define CODA988_H263_ANNEX_J_ENABLE 0
+/* Slice Structured mode */
+#define CODA988_H263_ANNEX_K_ENABLE 0
+/* Modified Quantization mode */
+#define CODA988_H263_ANNEX_T_ENABLE 0
+
+/* MPEG-4 Data Partition */
+#define CODA988_MP4_INTRA_DC_VLC_THR	0
+/* MPEG-4 VLC table used 0-normal / 1-reversible */
+#define CODA988_MP4_REVERSIBLE_VLC_EN	0
+/* MPEG-4 Intra DC VLC Threshold [0~7] */
+#define CODA988_MP4_DATA_PARTITION_EN	0
+/* MPEG-4 Enable Header Extension Code (HEC) */
+#define CODA988_MP4_HEC_EN	1
+/* MPEG-4 Video Object layer version 1 or 2(default) */
+#define CODA988_MP4_VER_ID	2
+
+/* sps[64], pps[256], backupPsBuf[8] for rollback, error concealment (each 4Kbyte) */
+#define CODA988_PS_SAVE_SIZE	((320 + 8) * 1024 * 4)
+
+#define CODA_988_CROP_SHIFT	16
+#define	CODA_988_CROP_MASK	0xFFFF
+#define	CODA_COMMON_CROP_SHIFT	10
+#define	CODA_COMMON_CROP_MASK	0x3FFF
+
 static void coda_free_bitstream_buffer(struct coda_ctx *ctx);
 
 static inline int coda_is_initialized(struct coda_dev *dev)
@@ -42,18 +86,21 @@ static inline int coda_is_initialized(struct coda_dev *dev)
 	return coda_read(dev, CODA_REG_BIT_CUR_PC) != 0;
 }
 
-static inline unsigned long coda_isbusy(struct coda_dev *dev)
+static inline unsigned long coda_isbusy(struct coda_dev *dev, u32 reg_busy)
 {
-	return coda_read(dev, CODA_REG_BIT_BUSY);
+	return coda_read(dev, reg_busy);
 }
 
-static int coda_wait_timeout(struct coda_dev *dev)
+int coda_wait_timeout(struct coda_dev *dev, u32 reg_busy)
 {
 	unsigned long timeout = jiffies + msecs_to_jiffies(1000);
 
-	while (coda_isbusy(dev)) {
-		if (time_after(jiffies, timeout))
+	while (coda_isbusy(dev, reg_busy)) {
+		if (time_after(jiffies, timeout)) {
+			dev_err(dev->dev, "Error! Timeout waiting for reg 0x%x\n",
+				reg_busy);
 			return -ETIMEDOUT;
+		}
 	}
 	return 0;
 }
@@ -64,7 +111,8 @@ static void coda_command_async(struct coda_ctx *ctx, int cmd)
 
 	if (dev->devtype->product == CODA_HX4 ||
 	    dev->devtype->product == CODA_7541 ||
-	    dev->devtype->product == CODA_960) {
+	    dev->devtype->product == CODA_960 ||
+	    dev->devtype->product == CODA_988) {
 		/* Restore context related registers to CODA */
 		coda_write(dev, ctx->bit_stream_param,
 				CODA_REG_BIT_BIT_STREAM_PARAM);
@@ -75,7 +123,8 @@ static void coda_command_async(struct coda_ctx *ctx, int cmd)
 		coda_write(dev, ctx->workbuf.paddr, CODA_REG_BIT_WORK_BUF_ADDR);
 	}
 
-	if (dev->devtype->product == CODA_960) {
+	if (dev->devtype->product == CODA_960 ||
+	    dev->devtype->product == CODA_988) {
 		coda_write(dev, 1, CODA9_GDI_WPROT_ERR_CLR);
 		coda_write(dev, 0, CODA9_GDI_WPROT_RGN_EN);
 	}
@@ -99,12 +148,132 @@ static int coda_command_sync(struct coda_ctx *ctx, int cmd)
 	lockdep_assert_held(&dev->coda_mutex);
 
 	coda_command_async(ctx, cmd);
-	ret = coda_wait_timeout(dev);
+	ret = coda_wait_timeout(dev, CODA_REG_BIT_BUSY);
 	trace_coda_bit_done(ctx);
 
 	return ret;
 }
 
+int coda988_hw_init_reset(struct coda_dev *dev)
+{
+	unsigned long timeout;
+	u32 reg, ret = 0;
+
+	/* Waiting for completion of BWB transaction first */
+	if (coda_wait_timeout(dev, CODA9_GDI_BWB_STATUS)) {
+		dev_err(dev->dev, "Error! Timeout waiting for completion of BWB transaction\n");
+		return -ETIME;
+	}
+
+	/* No more requests */
+	coda_write(dev, 0x11, CODA9_GDI_BUS_CTRL);
+	/* Waiting for completion of bus transaction */
+	timeout = jiffies + msecs_to_jiffies(100);
+	while (coda_read(dev, CODA9_GDI_BUS_STATUS) != 0x77) {
+		if (time_after(jiffies, timeout)) {
+			coda_write(dev, 0x0, CODA9_GDI_BUS_CTRL);
+			dev_err(dev->dev, "Error! Timeout waiting for completion of BUS transaction\n");
+			return -ETIME;
+		}
+		cpu_relax();
+	}
+
+	/* Software Reset Trigger */
+	reg = CODA9_SW_RESET_VCE_CORE | CODA9_SW_RESET_VCE_BUS |
+	      CODA9_SW_RESET_GDI_CORE | CODA9_SW_RESET_GDI_BUS;
+
+	dev_dbg(dev->dev, "ATTENTION! Resetting GDI: tiled map should be reconfigured\n");
+
+	coda_write(dev, reg, CODA9_REG_BIT_SW_RESET);
+
+	/* Wait until reset is done */
+	if (coda_wait_timeout(dev, CODA9_REG_BIT_SW_RESET_STATUS)) {
+		dev_err(dev->dev, "Error! Timeout waiting for completion of SW reset\n");
+		ret = -ETIME;
+	}
+
+	coda_write(dev, 0x0, CODA9_REG_BIT_SW_RESET);
+	coda_write(dev, 0x0, CODA9_GDI_BUS_CTRL);
+
+	return ret;
+}
+
+static int coda988_hw_runtime_reset(struct coda_ctx *ctx)
+{
+	struct coda_dev *dev = ctx->dev;
+	unsigned long timeout;
+	u32 reg, ret = 0;
+
+	reg = coda_read(dev, CODA_REG_BIT_RUN_COMMAND);
+	if (reg == CODA_COMMAND_SEQ_INIT || reg == CODA_COMMAND_PIC_RUN) {
+		reg = coda_read(dev, CODA_REG_BIT_INT_REASON);
+		if (coda_isbusy(dev, CODA_REG_BIT_BUSY) || reg) {
+			/*
+			 * Stop all of pipeline:
+			 * subblk_man_mode[20] & cr_subblk_man_en[19:0]
+			 */
+			reg = (CODA9_MBC_SET_SUBBLK_EN_MANUAL | 0x0) &
+				CODA9_MBC_SET_SUBBLK_EN_MASK;
+			coda_write(dev, reg, CODA9_MBC_SET_SUBBLK_EN);
+
+			/* Force to set the end of Bitstream to be decoded */
+			coda_bit_stream_end_flag(ctx);
+
+			/*
+			 * Make the write pointer (where the buffer is being filled up)
+			 * equal to read pointer (where VPU is reading stream data
+			 * from the buffer)
+			 */
+			reg = coda_read(dev, CODA_REG_BIT_RD_PTR(ctx->reg_idx));
+			coda_write(dev, reg, CODA_REG_BIT_WR_PTR(ctx->reg_idx));
+
+			ret = coda_wait_timeout(dev, CODA_REG_BIT_BUSY);
+			if (!ret) {
+				dev_err(dev->dev, "Error! Timeout waiting for interrupt while hw reset\n");
+				return -ETIME;
+			}
+		}
+	}
+
+	/* / Waiting for completion of BWB transaction first */
+	if (coda_wait_timeout(dev, CODA9_GDI_BWB_STATUS)) {
+		dev_err(dev->dev, "Error! Timeout waiting for completion of BWB transaction\n");
+		return -ETIME;
+	}
+
+	/* No more requests */
+	coda_write(dev, 0x11, CODA9_GDI_BUS_CTRL);
+	/* Waiting for completion of bus transaction */
+	timeout = jiffies + msecs_to_jiffies(100);
+	while (coda_read(dev, CODA9_GDI_BUS_STATUS) != 0x77) {
+		if (time_after(jiffies, timeout)) {
+			coda_write(dev, 0x0, CODA9_GDI_BUS_CTRL);
+			dev_err(dev->dev, "Error! Timeout waiting for completion of BUS transaction\n");
+			return -ETIME;
+		}
+		cpu_relax();
+	}
+
+	/* Software Reset Trigger */
+	reg = CODA9_SW_RESET_BPU_CORE | CODA9_SW_RESET_BPU_BUS |
+		CODA9_SW_RESET_VCE_CORE | CODA9_SW_RESET_VCE_BUS;
+
+	dev_dbg(dev->dev, "ATTENTION! Resetting GDI: tiled map should be reconfigured\n");
+
+	coda_write(dev, reg, CODA9_REG_BIT_SW_RESET);
+
+	/* Wait until reset is done */
+	if (coda_wait_timeout(dev, CODA9_REG_BIT_SW_RESET_STATUS)) {
+		dev_err(dev->dev, "Error! Timeout waiting for completion of SW reset\n");
+		ret = -ETIME;
+	}
+
+	coda_write(dev, 0x0, CODA9_REG_BIT_SW_RESET);
+	coda_write(dev, 0x0, CODA9_GDI_BUS_CTRL);
+
+	return ret;
+}
+
 int coda_hw_reset(struct coda_ctx *ctx)
 {
 	struct coda_dev *dev = ctx->dev;
@@ -129,15 +298,21 @@ int coda_hw_reset(struct coda_ctx *ctx)
 		}
 	}
 
+	if (dev->devtype->product == CODA_988) {
+		ret = coda988_hw_runtime_reset(ctx);
+		if (ret)
+			return ret;
+	}
+
 	ret = reset_control_reset(dev->rstc);
 	if (ret < 0)
 		return ret;
 
-	if (dev->devtype->product == CODA_960)
+	if (dev->devtype->product == CODA_960 || dev->devtype->product == CODA_988)
 		coda_write(dev, 0x00, CODA9_GDI_BUS_CTRL);
 	coda_write(dev, CODA_REG_BIT_BUSY_FLAG, CODA_REG_BIT_BUSY);
 	coda_write(dev, CODA_REG_RUN_ENABLE, CODA_REG_BIT_CODE_RUN);
-	ret = coda_wait_timeout(dev);
+	ret = coda_wait_timeout(dev, CODA_REG_BIT_BUSY);
 	coda_write(dev, idx, CODA_REG_BIT_RUN_INDEX);
 
 	return ret;
@@ -235,6 +410,7 @@ static u32 coda_buffer_parse_headers(struct coda_ctx *ctx,
 	case V4L2_PIX_FMT_MPEG2:
 		size = coda_mpeg2_parse_headers(ctx, vaddr, payload);
 		break;
+	case V4L2_PIX_FMT_H263:
 	case V4L2_PIX_FMT_MPEG4:
 		size = coda_mpeg4_parse_headers(ctx, vaddr, payload);
 		break;
@@ -284,7 +460,8 @@ static bool coda_bitstream_try_queue(struct coda_ctx *ctx,
 						 "bitstream buffer overflow\n");
 					return false;
 				}
-				if (ctx->dev->devtype->product == CODA_960)
+				if (ctx->dev->devtype->product == CODA_960 ||
+				    ctx->dev->devtype->product == CODA_988)
 					break;
 			}
 		} else {
@@ -338,21 +515,23 @@ void coda_fill_bitstream(struct coda_ctx *ctx, struct list_head *buffer_list)
 		    ctx->num_metas > 1)
 			break;
 
-		if (ctx->num_internal_frames &&
-		    ctx->num_metas >= ctx->num_internal_frames) {
-			meta = list_first_entry(&ctx->buffer_meta_list,
-						struct coda_buffer_meta, list);
-
-			/*
-			 * If we managed to fill in at least a full reorder
-			 * window of buffers (num_internal_frames is a
-			 * conservative estimate for this) and the bitstream
-			 * prefetcher has at least 2 256 bytes periods beyond
-			 * the first buffer to fetch, we can safely stop queuing
-			 * in order to limit the decoder drain latency.
-			 */
-			if (coda_bitstream_can_fetch_past(ctx, meta->end))
-				break;
+		if (ctx->dev->devtype->product != CODA_988) {
+			if (ctx->num_internal_frames &&
+			    ctx->num_metas >= ctx->num_internal_frames) {
+				meta = list_first_entry(&ctx->buffer_meta_list,
+							struct coda_buffer_meta, list);
+
+				/*
+				 * If we managed to fill in at least a full reorder
+				 * window of buffers (num_internal_frames is a
+				 * conservative estimate for this) and the bitstream
+				 * prefetcher has at least 2 256 bytes periods beyond
+				 * the first buffer to fetch, we can safely stop queuing
+				 * in order to limit the decoder drain latency.
+				 */
+				if (coda_bitstream_can_fetch_past(ctx, meta->end))
+					break;
+			}
 		}
 
 		src_buf = v4l2_m2m_next_src_buf(ctx->fh.m2m_ctx);
@@ -377,6 +556,31 @@ void coda_fill_bitstream(struct coda_ctx *ctx, struct list_head *buffer_list)
 			continue;
 		}
 
+		if (ctx->codec->src_fourcc == V4L2_PIX_FMT_VP8 &&
+		    ctx->dev->devtype->product == CODA_988){
+			unsigned long payload_len;
+			int ret = 0;
+
+			payload_len = vb2_get_plane_payload(&src_buf->vb2_buf, 0);
+
+			if (ctx->params.vp8_fill_ivf_header) {
+				u8 dummy_ivf_header[32] = "DKIF\x00\x00\x20\x00";
+
+				ret |= coda_bitstream_queue(ctx, dummy_ivf_header,
+							    sizeof(dummy_ivf_header));
+				ctx->params.vp8_fill_ivf_header = 0;
+			}
+			u8 frame_header[12];
+			*(unsigned long *)frame_header = payload_len;
+			v4l2_dbg(3, coda_debug, &ctx->dev->v4l2_dev,
+				 "%s: feeding frame header into bitstream, frame len 0x%08lX\n",
+				 __func__, payload_len);
+			ret |= coda_bitstream_queue(ctx, frame_header, sizeof(frame_header));
+			if (ret)
+				v4l2_err(&ctx->dev->v4l2_dev,
+					 "failed to add VP8 header into bitstream\n");
+		}
+
 		/* Dump empty buffers */
 		if (!vb2_get_plane_payload(&src_buf->vb2_buf, 0)) {
 			src_buf = v4l2_m2m_src_buf_remove(ctx->fh.m2m_ctx);
@@ -436,9 +640,9 @@ void coda_bit_stream_end_flag(struct coda_ctx *ctx)
 	ctx->bit_stream_param |= CODA_BIT_STREAM_END_FLAG;
 
 	/* If this context is currently running, update the hardware flag */
-	if ((dev->devtype->product == CODA_960) &&
-	    coda_isbusy(dev) &&
-	    (ctx->idx == coda_read(dev, CODA_REG_BIT_RUN_INDEX))) {
+	if ((dev->devtype->product == CODA_960 || dev->devtype->product == CODA_988) &&
+	    coda_isbusy(dev, CODA_REG_BIT_BUSY) &&
+	    ctx->idx == coda_read(dev, CODA_REG_BIT_RUN_INDEX)) {
 		coda_write(dev, ctx->bit_stream_param,
 			   CODA_REG_BIT_BIT_STREAM_PARAM);
 	}
@@ -475,23 +679,35 @@ static int coda_alloc_framebuffers(struct coda_ctx *ctx,
 				   struct coda_q_data *q_data, u32 fourcc)
 {
 	struct coda_dev *dev = ctx->dev;
-	unsigned int ysize, ycbcr_size;
+	unsigned int width, height, ysize, ycbcr_size, size_mvcolbuf;
+	unsigned char round;
 	int ret;
 	int i;
 
 	if (ctx->codec->src_fourcc == V4L2_PIX_FMT_H264 ||
 	    ctx->codec->dst_fourcc == V4L2_PIX_FMT_H264 ||
+	    ctx->codec->dst_fourcc == V4L2_PIX_FMT_H263 ||
+	    ctx->codec->src_fourcc == V4L2_PIX_FMT_H263 ||
 	    ctx->codec->src_fourcc == V4L2_PIX_FMT_MPEG4 ||
-	    ctx->codec->dst_fourcc == V4L2_PIX_FMT_MPEG4)
-		ysize = round_up(q_data->rect.width, 16) *
-			round_up(q_data->rect.height, 16);
-	else
-		ysize = round_up(q_data->rect.width, 8) * q_data->rect.height;
+	    ctx->codec->dst_fourcc == V4L2_PIX_FMT_MPEG4 ||
+		ctx->codec->src_fourcc == V4L2_PIX_FMT_VP8) {
+		round =  (dev->devtype->product == CODA_988) ? 32 : 16;
+		height = round_up(q_data->rect.height, round);
+		width  = round_up(q_data->rect.width, round);
+	} else {
+		height = q_data->rect.height;
+		width = (dev->devtype->product == CODA_988) ?
+			round_up(q_data->rect.width, 32) :
+			round_up(q_data->rect.width, 8);
+	}
 
-	if (ctx->tiled_map_type == GDI_TILED_FRAME_MB_RASTER_MAP)
-		ycbcr_size = round_up(ysize, 4096) + ysize / 2;
-	else
+	ysize = height * width;
+	if (ctx->tiled_map_type == GDI_TILED_FRAME_MB_RASTER_MAP) {
+		round =  (dev->devtype->product == CODA_988) ? 16384 : 4096;
+		ycbcr_size = round_up(ysize, round) + round_up(ysize / 2, round);
+	} else {
 		ycbcr_size = ysize + ysize / 2;
+	}
 
 	/* Allocate frame buffers */
 	for (i = 0; i < ctx->num_internal_frames; i++) {
@@ -501,8 +717,20 @@ static int coda_alloc_framebuffers(struct coda_ctx *ctx,
 		/* Add space for mvcol buffers */
 		if (dev->devtype->product != CODA_DX6 &&
 		    (ctx->codec->src_fourcc == V4L2_PIX_FMT_H264 ||
-		     (ctx->codec->src_fourcc == V4L2_PIX_FMT_MPEG4 && i == 0)))
-			size += ysize / 4;
+		    (ctx->codec->src_fourcc == V4L2_PIX_FMT_H263 && i == 0) ||
+		     (ctx->codec->src_fourcc == V4L2_PIX_FMT_MPEG4 && i == 0))) {
+			/* TODO add check for AVS format */
+			if (dev->devtype->product == CODA_988) {
+				size_mvcolbuf = round_up(q_data->rect.height, 32) *
+						round_up(q_data->rect.width, 32);
+				size_mvcolbuf = (size_mvcolbuf * 3) / 2;
+				size_mvcolbuf = (size_mvcolbuf + 4) / 5;
+				size_mvcolbuf = ((size_mvcolbuf + 7) / 8) * 8;
+			} else {
+				size_mvcolbuf = ysize / 4;
+			}
+			size += size_mvcolbuf;
+		}
 		name = kasprintf(GFP_KERNEL, "fb%d", i);
 		if (!name) {
 			coda_free_framebuffers(ctx);
@@ -527,13 +755,19 @@ static int coda_alloc_framebuffers(struct coda_ctx *ctx,
 		cr = y + ysize + ysize/4;
 		mvcol = y + ysize + ysize/4 + ysize/4;
 		if (ctx->tiled_map_type == GDI_TILED_FRAME_MB_RASTER_MAP) {
-			cb = round_up(cb, 4096);
-			mvcol = cb + ysize/2;
-			cr = 0;
-			/* Packed 20-bit MSB of base addresses */
-			/* YYYYYCCC, CCyyyyyc, cccc.... */
-			y = (y & 0xfffff000) | cb >> 20;
-			cb = (cb & 0x000ff000) << 12;
+			if (dev->devtype->product == CODA_988) {
+				/* We assume that Linear Frame Map is used */
+				cb = y + round_up(ysize, 16384);
+				cr = cb + round_up(ysize / 2, 16384);
+			} else {
+				cb = round_up(cb, 4096);
+				mvcol = cb + ysize / 2;
+				cr = 0;
+				/* Packed 20-bit MSB of base addresses */
+				/* YYYYYCCC, CCyyyyyc, cccc.... */
+				y = (y & 0xfffff000) | cb >> 20;
+				cb = (cb & 0x000ff000) << 12;
+			}
 		}
 		coda_parabuf_write(ctx, i * 3 + 0, y);
 		coda_parabuf_write(ctx, i * 3 + 1, cb);
@@ -547,6 +781,17 @@ static int coda_alloc_framebuffers(struct coda_ctx *ctx,
 			coda_parabuf_write(ctx, 96 + i, mvcol);
 		if (ctx->codec->src_fourcc == V4L2_PIX_FMT_MPEG4 && i == 0)
 			coda_parabuf_write(ctx, 97, mvcol);
+
+		if (ctx->codec->src_fourcc == V4L2_PIX_FMT_H263 && i == 0)
+			coda_parabuf_write(ctx, 97, mvcol);
+
+		/* Bottom addresses of framebuffer */
+		if (dev->devtype->product == CODA_988 &&
+		    ctx->tiled_map_type == GDI_TILED_FRAME_MB_RASTER_MAP) {
+			coda_parabuf_write(ctx, i * 3 + 0 + CODA988_FB_BOT_BYTE_OFFSET / 4, 0);
+			coda_parabuf_write(ctx, i * 3 + 1 + CODA988_FB_BOT_BYTE_OFFSET / 4, 0);
+			coda_parabuf_write(ctx, i * 3 + 2 + CODA988_FB_BOT_BYTE_OFFSET / 4, 0);
+		}
 	}
 
 	return 0;
@@ -556,6 +801,7 @@ static void coda_free_context_buffers(struct coda_ctx *ctx)
 {
 	struct coda_dev *dev = ctx->dev;
 
+	coda_free_aux_buf(dev, &ctx->vp8mbbuf);
 	coda_free_aux_buf(dev, &ctx->slicebuf);
 	coda_free_aux_buf(dev, &ctx->psbuf);
 	if (dev->devtype->product != CODA_DX6)
@@ -581,9 +827,13 @@ static int coda_alloc_context_buffers(struct coda_ctx *ctx,
 		return 0;
 
 	if (!ctx->slicebuf.vaddr && q_data->fourcc == V4L2_PIX_FMT_H264) {
-		/* worst case slice size */
-		size = (unsigned long)(DIV_ROUND_UP(q_data->rect.width, 16) *
-			DIV_ROUND_UP(q_data->rect.height, 16)) * 3200 / 8 + 512;
+		if (dev->devtype->product == CODA_988) {
+			size = ctx->codec->max_h * ctx->codec->max_w * 3 / 4;
+		} else {
+			/* worst case slice size */
+			size = (unsigned long)(DIV_ROUND_UP(q_data->rect.width, 16) *
+				DIV_ROUND_UP(q_data->rect.height, 16)) * 3200 / 8 + 512;
+		}
 		ret = coda_alloc_context_buf(ctx, &ctx->slicebuf, size,
 					     "slicebuf");
 		if (ret < 0)
@@ -603,12 +853,29 @@ static int coda_alloc_context_buffers(struct coda_ctx *ctx,
 		if (dev->devtype->product == CODA_960 &&
 		    q_data->fourcc == V4L2_PIX_FMT_H264)
 			size += CODA9_PS_SAVE_SIZE;
+		if (dev->devtype->product == CODA_988 &&
+		    q_data->fourcc == V4L2_PIX_FMT_H264)
+			size += CODA988_PS_SAVE_SIZE;
 		ret = coda_alloc_context_buf(ctx, &ctx->workbuf, size,
 					     "workbuf");
 		if (ret < 0)
 			goto err;
 	}
 
+	if (!ctx->vp8mbbuf.vaddr && q_data->fourcc == V4L2_PIX_FMT_VP8) {
+		/*
+		 * First partition information, 68 bytes per MB
+		 * macroblock is 16x16 for Y component
+		 */
+		unsigned int stride = round_up(q_data->width, 16);
+
+		size = 68 * (stride * q_data->width / 256);
+		ret = coda_alloc_context_buf(ctx, &ctx->vp8mbbuf, size,
+					     "vp8mbbuf");
+		if (ret < 0)
+			goto err;
+	}
+
 	return 0;
 
 err:
@@ -627,13 +894,13 @@ static int coda_encode_header(struct coda_ctx *ctx, struct vb2_v4l2_buffer *buf,
 	int ret;
 	int i;
 
-	if (dev->devtype->product == CODA_960)
+	if (dev->devtype->product == CODA_960 || ctx->dev->devtype->product == CODA_988)
 		memset(vb2_plane_vaddr(vb, 0), 0, 64);
 
 	coda_write(dev, vb2_dma_contig_plane_dma_addr(vb, 0),
 		   CODA_CMD_ENC_HEADER_BB_START);
 	bufsize = vb2_plane_size(vb, 0);
-	if (dev->devtype->product == CODA_960)
+	if (dev->devtype->product == CODA_960 || ctx->dev->devtype->product == CODA_988)
 		bufsize /= 1024;
 	coda_write(dev, bufsize, CODA_CMD_ENC_HEADER_BB_SIZE);
 	if (dev->devtype->product == CODA_960 &&
@@ -652,6 +919,62 @@ static int coda_encode_header(struct coda_ctx *ctx, struct vb2_v4l2_buffer *buf,
 				   CODA9_CMD_ENC_HEADER_FRAME_CROP_V);
 			header_code |= CODA9_HEADER_FRAME_CROP;
 		}
+	} else if (ctx->dev->devtype->product == CODA_988 &&
+		   ctx->codec->dst_fourcc == V4L2_PIX_FMT_H264) {
+		int sps_id = 0;
+
+		if (header_code == CODA_HEADER_H264_SPS_MVC)
+			sps_id = 1;
+
+		q_data_src = get_q_data(ctx, V4L2_BUF_TYPE_VIDEO_OUTPUT);
+		r = &q_data_src->rect;
+
+		if (header_code == CODA_HEADER_H264_SPS ||
+		    header_code == CODA_HEADER_H264_SPS_MVC) {
+			coda_write(dev,
+				   coda_h264enc_profile_id(ctx->params.h264_profile_idc),
+				   CODA988_CMD_ENC_HEADER_PROFILE);
+
+			/* TODO 1 for monochrome yuv400 */
+			coda_write(dev, 0,
+				   CODA988_CMD_ENC_HEADER_CHROMA_FORMAT);
+
+			coda_write(dev, 0,
+				   CODA988_CMD_ENC_HEADER_FIELD_FLAG);
+
+			if (r->width % 32 || r->height % 32) {
+				u32 crop_right = round_up(r->width, 32) -  r->width;
+				u32 crop_bottom = round_up(r->height, 32) - r->height;
+
+				coda_write(dev, crop_right,
+					   CODA9_CMD_ENC_HEADER_FRAME_CROP_H);
+				coda_write(dev, crop_bottom,
+					   CODA9_CMD_ENC_HEADER_FRAME_CROP_V);
+				header_code |= CODA988_HEADER_FRAME_CROP;
+			}
+		} else if (header_code == CODA_HEADER_H264_PPS ||
+			   header_code == CODA_HEADER_H264_PPS_MVC) {
+			int cabac_init_idc = 0;
+			int pps_id = 0;
+
+			coda_write(dev, ctx->params.h264_entropy_mode,
+				   CODA988_CMD_ENC_HEADER_CABAC_MODE);
+			coda_write(dev, cabac_init_idc,
+				   CODA988_CMD_ENC_HEADER_CABAC_INIT_IDC);
+			if (ctx->params.h264_profile_idc >= V4L2_MPEG_VIDEO_H264_PROFILE_HIGH)
+				coda_write(dev, ctx->params.h264_en_8x8_transform,
+					   CODA988_CMD_ENC_HEADER_TRANSFORM_8X8);
+
+			if (header_code == CODA_HEADER_H264_PPS_MVC)
+				header_code |= (1 << 24) | ((pps_id + 1) << 16);
+			else
+				header_code |= (pps_id << 16);
+		}
+
+		if (ctx->params.h264_level_idc)
+			header_code |= CODA988_HEADER_USER_LEVEL(ctx->params.h264_level_idc) |
+				       CODA988_HEADER_USER_LEVEL_ENABLE;
+		header_code |= (sps_id << 24);
 	}
 	coda_write(dev, header_code, CODA_CMD_ENC_HEADER_CODE);
 	ret = coda_command_sync(ctx, CODA_COMMAND_ENCODE_HEADER);
@@ -660,7 +983,7 @@ static int coda_encode_header(struct coda_ctx *ctx, struct vb2_v4l2_buffer *buf,
 		return ret;
 	}
 
-	if (dev->devtype->product == CODA_960) {
+	if (dev->devtype->product == CODA_960 || ctx->dev->devtype->product == CODA_988) {
 		for (i = 63; i > 0; i--)
 			if (((char *)vb2_plane_vaddr(vb, 0))[i] != 0)
 				break;
@@ -697,6 +1020,28 @@ static u32 coda_slice_mode(struct coda_ctx *ctx)
 	       ((1 & CODA_SLICING_MODE_MASK) << CODA_SLICING_MODE_OFFSET);
 }
 
+static u32 coda988_slice_mode(struct coda_ctx *ctx)
+{
+	int size, unit;
+
+	switch (ctx->params.slice_mode) {
+	case V4L2_MPEG_VIDEO_MULTI_SLICE_MODE_SINGLE:
+	default:
+		return 0;
+	case V4L2_MPEG_VIDEO_MULTI_SLICE_MODE_MAX_MB:
+		size = ctx->params.slice_max_mb;
+		unit = 2;
+		break;
+	case V4L2_MPEG_VIDEO_MULTI_SLICE_MODE_MAX_BYTES:
+		size = ctx->params.slice_max_bits;
+		unit = 1;
+		break;
+	}
+
+	return ((size & CODA_SLICING_SIZE_MASK) << CODA_SLICING_SIZE_OFFSET) |
+	       ((unit & CODA988_SLICING_UNIT_MASK) << CODA988_SLICING_UNIT_OFFSET);
+}
+
 static int coda_enc_param_change(struct coda_ctx *ctx)
 {
 	struct coda_dev *dev = ctx->dev;
@@ -748,11 +1093,23 @@ static int coda_enc_param_change(struct coda_ctx *ctx)
 		ctx->params.intra_refresh_changed = false;
 	}
 	if (ctx->params.slice_mode_changed) {
+		int value = 0;
+
+		if (dev->devtype->product == CODA_988)
+			value = coda988_slice_mode(ctx);
+		else
+			value = coda_slice_mode(ctx);
 		change_enable |= CODA_PARAM_CHANGE_SLICE_MODE;
-		coda_write(dev, coda_slice_mode(ctx),
+		coda_write(dev, value,
 			   CODA_CMD_ENC_PARAM_SLICE_MODE);
 		ctx->params.slice_mode_changed = false;
 	}
+	if (ctx->params.entropy_mode_changed) {
+		change_enable |= CODA988_ENC_CHANGE_PARAM_CABAC_MODE;
+		coda_write(dev, ctx->params.h264_entropy_mode,
+			   CODA988_CMD_ENC_PARAM_CHANGE_CABAC_MODE);
+		ctx->params.entropy_mode_changed = false;
+	}
 
 	if (!change_enable)
 		return 0;
@@ -789,7 +1146,7 @@ static void coda_setup_iram(struct coda_ctx *ctx)
 {
 	struct coda_iram_info *iram_info = &ctx->iram_info;
 	struct coda_dev *dev = ctx->dev;
-	int w64, w128;
+	int w64, w128, w_bit;
 	int mb_width;
 	int dbk_bits;
 	int bit_bits;
@@ -817,6 +1174,7 @@ static void coda_setup_iram(struct coda_ctx *ctx)
 		me_bits = CODA7_USE_HOST_ME_ENABLE | CODA7_USE_ME_ENABLE;
 		break;
 	case CODA_960:
+	case CODA_988:
 		dbk_bits = CODA9_USE_HOST_DBK_ENABLE | CODA9_USE_DBK_ENABLE;
 		bit_bits = CODA9_USE_HOST_BIT_ENABLE | CODA7_USE_BIT_ENABLE;
 		ip_bits = CODA9_USE_HOST_IP_ENABLE | CODA7_USE_IP_ENABLE;
@@ -848,9 +1206,16 @@ static void coda_setup_iram(struct coda_ctx *ctx)
 			iram_info->axi_sram_use |= me_bits;
 		}
 
-		/* Only H.264BP and H.263P3 are considered */
-		iram_info->buf_dbk_y_use = coda_iram_alloc(iram_info, w64);
-		iram_info->buf_dbk_c_use = coda_iram_alloc(iram_info, w64);
+		if (dev->devtype->product == CODA_988 &&
+		    ctx->codec->src_fourcc == V4L2_PIX_FMT_H264) {
+			/* H.264HP */
+			iram_info->buf_dbk_y_use = coda_iram_alloc(iram_info, w128);
+			iram_info->buf_dbk_c_use = coda_iram_alloc(iram_info, w128);
+		} else {
+			/* Only H.264BP and H.263P3 are considered */
+			iram_info->buf_dbk_y_use = coda_iram_alloc(iram_info, w64);
+			iram_info->buf_dbk_c_use = coda_iram_alloc(iram_info, w64);
+		}
 		if (!iram_info->buf_dbk_y_use || !iram_info->buf_dbk_c_use)
 			goto out;
 		iram_info->axi_sram_use |= dbk_bits;
@@ -872,6 +1237,11 @@ static void coda_setup_iram(struct coda_ctx *ctx)
 		q_data_dst = get_q_data(ctx, V4L2_BUF_TYPE_VIDEO_CAPTURE);
 		mb_width = DIV_ROUND_UP(q_data_dst->width, 16);
 		w128 = mb_width * 128;
+		if (ctx->codec->src_fourcc == V4L2_PIX_FMT_H264 &&
+		    dev->devtype->product == CODA_988)
+			w_bit = mb_width * 144;
+		else
+			w_bit = mb_width * 128;
 
 		iram_info->buf_dbk_y_use = coda_iram_alloc(iram_info, w128);
 		iram_info->buf_dbk_c_use = coda_iram_alloc(iram_info, w128);
@@ -879,7 +1249,7 @@ static void coda_setup_iram(struct coda_ctx *ctx)
 			goto out;
 		iram_info->axi_sram_use |= dbk_bits;
 
-		iram_info->buf_bit_use = coda_iram_alloc(iram_info, w128);
+		iram_info->buf_bit_use = coda_iram_alloc(iram_info, w_bit);
 		if (!iram_info->buf_bit_use)
 			goto out;
 		iram_info->axi_sram_use |= bit_bits;
@@ -921,6 +1291,7 @@ static u32 coda_supported_firmwares[] = {
 	CODA_FIRMWARE_VERNUM(CODA_960, 2, 1, 9),
 	CODA_FIRMWARE_VERNUM(CODA_960, 2, 3, 10),
 	CODA_FIRMWARE_VERNUM(CODA_960, 3, 1, 1),
+	CODA_FIRMWARE_VERNUM(CODA_988, 3, 0, 1),
 };
 
 static bool coda_firmware_supported(u32 vernum)
@@ -951,14 +1322,17 @@ int coda_check_firmware(struct coda_dev *dev)
 	coda_write(dev, CODA_REG_BIT_BUSY_FLAG, CODA_REG_BIT_BUSY);
 	coda_write(dev, 0, CODA_REG_BIT_RUN_INDEX);
 	coda_write(dev, 0, CODA_REG_BIT_RUN_COD_STD);
+	if (dev->devtype->product == CODA_988)
+		coda_write(dev, 0, CODA7_REG_BIT_RUN_AUX_STD);
+
 	coda_write(dev, CODA_COMMAND_FIRMWARE_GET, CODA_REG_BIT_RUN_COMMAND);
-	if (coda_wait_timeout(dev)) {
+	if (coda_wait_timeout(dev, CODA_REG_BIT_BUSY)) {
 		v4l2_err(&dev->v4l2_dev, "firmware get command error\n");
 		ret = -EIO;
 		goto err_run_cmd;
 	}
 
-	if (dev->devtype->product == CODA_960) {
+	if (dev->devtype->product == CODA_960 || dev->devtype->product == CODA_988) {
 		data = coda_read(dev, CODA9_CMD_FIRMWARE_CODE_REV);
 		v4l2_info(&dev->v4l2_dev, "Firmware code revision: %d\n",
 			  data);
@@ -1018,7 +1392,8 @@ static void coda9_set_frame_cache(struct coda_ctx *ctx, u32 fourcc)
 		cache_config = 1 << CODA9_CACHE_PAGEMERGE_OFFSET;
 	}
 	coda_write(ctx->dev, cache_size, CODA9_CMD_SET_FRAME_CACHE_SIZE);
-	if (fourcc == V4L2_PIX_FMT_NV12 || fourcc == V4L2_PIX_FMT_YUYV) {
+	if (fourcc == V4L2_PIX_FMT_NV12 || fourcc == V4L2_PIX_FMT_NV21 ||
+	    fourcc == V4L2_PIX_FMT_YUYV) {
 		cache_config |= 32 << CODA9_CACHE_LUMA_BUFFER_SIZE_OFFSET |
 				16 << CODA9_CACHE_CR_BUFFER_SIZE_OFFSET |
 				0 << CODA9_CACHE_CB_BUFFER_SIZE_OFFSET;
@@ -1030,6 +1405,21 @@ static void coda9_set_frame_cache(struct coda_ctx *ctx, u32 fourcc)
 	coda_write(ctx->dev, cache_config, CODA9_CMD_SET_FRAME_CACHE_CONFIG);
 }
 
+static void coda988_set_frame_cache(struct coda_ctx *ctx, u32 fourcc)
+{
+	u32 cache_config = 0;
+
+	cache_config = CODA988_CACHE_BURST_MODE_4 |
+			   CODA988_CACHE_CHROMA_INTERLEAVED_SZ_128_16 |
+			   CODA988_CACHE_LUMA_SZ_128_32 |
+			   CODA988_CACHE_LINE_VERT_PROC_MERGE;
+
+	if (ctx->tiled_map_type != GDI_LINEAR_FRAME_MAP)
+		cache_config |= CODA988_CACHE_MAP_TYPE_TILED;
+
+	coda_write(ctx->dev, cache_config, CODA9_CMD_SET_FRAME_CACHE_CONFIG);
+}
+
 /*
  * Encoder context operations
  */
@@ -1105,6 +1495,7 @@ static int coda_start_encoding(struct coda_ctx *ctx)
 			CODADX6_STREAM_BUF_PIC_RESET, CODA_REG_BIT_STREAM_CTRL);
 		break;
 	case CODA_960:
+	case CODA_988:
 		coda_write(dev, 0, CODA9_GDI_WPROT_RGN_EN);
 		fallthrough;
 	case CODA_HX4:
@@ -1114,12 +1505,36 @@ static int coda_start_encoding(struct coda_ctx *ctx)
 		break;
 	}
 
-	ctx->frame_mem_ctrl &= ~(CODA_FRAME_CHROMA_INTERLEAVE | (0x3 << 9) |
-				 CODA9_FRAME_TILED2LINEAR);
-	if (q_data_src->fourcc == V4L2_PIX_FMT_NV12)
-		ctx->frame_mem_ctrl |= CODA_FRAME_CHROMA_INTERLEAVE;
-	if (ctx->tiled_map_type == GDI_TILED_FRAME_MB_RASTER_MAP)
-		ctx->frame_mem_ctrl |= (0x3 << 9) | CODA9_FRAME_TILED2LINEAR;
+	if (dev->devtype->product == CODA_988) {
+		ctx->frame_mem_ctrl &= ~(CODA_FRAME_CHROMA_INTERLEAVE |
+					 CODA988_FRAME_CHROMA_NV21_SWAP |
+					 CODA988_FRAME_TILED_MAP_MASK |
+					 CODA988_FRAME_TILED2LINEAR_MASK);
+
+		if (q_data_src->fourcc == V4L2_PIX_FMT_NV12 ||
+		    q_data_src->fourcc == V4L2_PIX_FMT_NV21 ||
+			q_data_src->fourcc == V4L2_PIX_FMT_YUYV)
+			ctx->frame_mem_ctrl |= CODA_FRAME_CHROMA_INTERLEAVE;
+
+		if (q_data_src->fourcc == V4L2_PIX_FMT_NV21)
+			ctx->frame_mem_ctrl |= CODA988_FRAME_CHROMA_NV21_SWAP;
+
+		if (ctx->tiled_map_type == GDI_TILED_FRAME_MB_RASTER_MAP) {
+			dev_warn(dev->dev, "%s() :%d WARNING! Set TILED_FRAME_MB_RASTER\n",
+				 __func__, __LINE__);
+			ctx->frame_mem_ctrl |= CODA988_FRAME_TILED2LINEAR_FRAME_MAP |
+					       CODA988_FRAME_TILED_MAP_TILED_FRAME_MB_RAST;
+		}
+
+	} else {
+		ctx->frame_mem_ctrl &= ~(CODA_FRAME_CHROMA_INTERLEAVE | (0x3 << 9) |
+					 CODA9_FRAME_TILED2LINEAR);
+		if (q_data_src->fourcc == V4L2_PIX_FMT_NV12 ||
+		    q_data_src->fourcc == V4L2_PIX_FMT_NV21)
+			ctx->frame_mem_ctrl |= CODA_FRAME_CHROMA_INTERLEAVE;
+		if (ctx->tiled_map_type == GDI_TILED_FRAME_MB_RASTER_MAP)
+			ctx->frame_mem_ctrl |= (0x3 << 9) | CODA9_FRAME_TILED2LINEAR;
+	}
 	coda_write(dev, ctx->frame_mem_ctrl, CODA_REG_BIT_FRAME_MEM_CTRL);
 
 	if (dev->devtype->product == CODA_DX6) {
@@ -1147,11 +1562,13 @@ static int coda_start_encoding(struct coda_ctx *ctx)
 			break;
 		}
 		fallthrough;
+	case CODA_988:
 	case CODA_960:
 		value = (q_data_src->rect.width & CODA7_PICWIDTH_MASK)
 			<< CODA7_PICWIDTH_OFFSET;
 		value |= (q_data_src->rect.height & CODA7_PICHEIGHT_MASK)
 			 << CODA_PICHEIGHT_OFFSET;
+		break;
 	}
 	coda_write(dev, value, CODA_CMD_ENC_SEQ_SRC_SIZE);
 	if (dst_fourcc == V4L2_PIX_FMT_JPEG)
@@ -1161,19 +1578,46 @@ static int coda_start_encoding(struct coda_ctx *ctx)
 
 	ctx->params.codec_mode = ctx->codec->mode;
 	switch (dst_fourcc) {
+	case V4L2_PIX_FMT_H263:
+		if (dev->devtype->product == CODA_960 ||
+		    dev->devtype->product == CODA_988)
+			coda_write(dev, CODA9_STD_H263, CODA_CMD_ENC_SEQ_COD_STD);
+		else
+			coda_write(dev, CODA_STD_H263, CODA_CMD_ENC_SEQ_COD_STD);
+		value = 0;
+		if (dev->devtype->product == CODA_988) {
+			value = CODA988_H263_ANNEX_I_ENABLE << 3 |
+				CODA988_H263_ANNEX_J_ENABLE << 2 |
+				CODA988_H263_ANNEX_K_ENABLE << 1 |
+				CODA988_H263_ANNEX_T_ENABLE;
+		}
+		coda_write(dev, value, CODA_CMD_ENC_SEQ_263_PARA);
+		break;
 	case V4L2_PIX_FMT_MPEG4:
-		if (dev->devtype->product == CODA_960)
-			coda_write(dev, CODA9_STD_MPEG4,
-				   CODA_CMD_ENC_SEQ_COD_STD);
+		if (dev->devtype->product == CODA_960 ||
+		    dev->devtype->product == CODA_988)
+			coda_write(dev, CODA9_STD_MPEG4, CODA_CMD_ENC_SEQ_COD_STD);
 		else
-			coda_write(dev, CODA_STD_MPEG4,
-				   CODA_CMD_ENC_SEQ_COD_STD);
-		coda_write(dev, 0, CODA_CMD_ENC_SEQ_MP4_PARA);
+			coda_write(dev, CODA_STD_MPEG4, CODA_CMD_ENC_SEQ_COD_STD);
+		value = 0;
+		if (dev->devtype->product == CODA_988) {
+			value = CODA988_MP4_INTRA_DC_VLC_THR << 2 |
+					CODA988_MP4_REVERSIBLE_VLC_EN << 1 |
+					CODA988_MP4_DATA_PARTITION_EN;
+
+			value |= ((CODA988_MP4_HEC_EN > 0) ? 1 : 0) << 5;
+			value |= ((CODA988_MP4_VER_ID == 2) ? 0 : 1) << 6;
+		}
+		coda_write(dev, value, CODA_CMD_ENC_SEQ_MP4_PARA);
 		break;
 	case V4L2_PIX_FMT_H264:
 		if (dev->devtype->product == CODA_960)
 			coda_write(dev, CODA9_STD_H264,
 				   CODA_CMD_ENC_SEQ_COD_STD);
+		else if (dev->devtype->product == CODA_988)
+			coda_write(dev, CODA9_STD_H264 |
+				   coda_h264enc_profile_id(ctx->params.h264_profile_idc) << 4,
+				   CODA_CMD_ENC_SEQ_COD_STD);
 		else
 			coda_write(dev, CODA_STD_H264,
 				   CODA_CMD_ENC_SEQ_COD_STD);
@@ -1214,42 +1658,131 @@ static int coda_start_encoding(struct coda_ctx *ctx)
 	 * in JPEG mode
 	 */
 	if (dst_fourcc != V4L2_PIX_FMT_JPEG) {
-		value = coda_slice_mode(ctx);
+		if (dev->devtype->product == CODA_988)
+			value = coda988_slice_mode(ctx);
+		else
+			value = coda_slice_mode(ctx);
 		coda_write(dev, value, CODA_CMD_ENC_SEQ_SLICE_MODE);
-		value = ctx->params.gop_size;
-		coda_write(dev, value, CODA_CMD_ENC_SEQ_GOP_SIZE);
 	}
 
 	if (ctx->params.bitrate && (ctx->params.frame_rc_enable ||
 				    ctx->params.mb_rc_enable)) {
+		int skip_frame = ctx->params.frame_skip_mode ==
+				V4L2_MPEG_VIDEO_FRAME_SKIP_MODE_DISABLED ? 1 : 0;
 		ctx->params.bitrate_changed = false;
 		ctx->params.h264_intra_qp_changed = false;
-
-		/* Rate control enabled */
-		value = (ctx->params.bitrate & CODA_RATECONTROL_BITRATE_MASK)
-			<< CODA_RATECONTROL_BITRATE_OFFSET;
-		value |=  1 & CODA_RATECONTROL_ENABLE_MASK;
-		value |= (ctx->params.vbv_delay &
-			  CODA_RATECONTROL_INITIALDELAY_MASK)
-			 << CODA_RATECONTROL_INITIALDELAY_OFFSET;
-		if (dev->devtype->product == CODA_960)
-			value |= BIT(31); /* disable autoskip */
+		coda_dbg(1, ctx, "CODA RateControl Enable\n");
+
+		if (dev->devtype->product == CODA_988) {
+			value = ctx->params.max_intra_size;
+			if (ctx->params.max_intra_size > 0)
+				value = (1 << 16);
+			coda_write(dev, value, CODA988_CMD_ENC_SEQ_RC_MAX_INTRA_SIZE);
+
+			if (dst_fourcc == V4L2_PIX_FMT_MPEG4 ||
+			    dst_fourcc == V4L2_PIX_FMT_H263) {
+				coda_write(dev, ctx->params.gop_size, CODA_CMD_ENC_SEQ_GOP_SIZE);
+
+				value = CODA_RATECONTROL_AUTOSKIP_DISABLE(skip_frame);
+				value |= CODA_RATECONTROL_INITIALDELAY(ctx->params.vbv_delay);
+				coda_write(dev, value, CODA_CMD_ENC_SEQ_RC_PARA);
+
+				value = 0;
+				coda_write(dev, value, CODA988_CMD_ENC_SEQ_QP_RANGE_SET);
+
+				/* For MPEG4 encoder, BitRateKBPS occupies [18:4] bit field */
+				value = (min(ctx->params.bitrate, 16383) << 4) | 1;
+				coda_write(dev, value, CODA988_CMD_ENC_SEQ_RC_PARA2);
+			} else if (dst_fourcc == V4L2_PIX_FMT_H264) {
+				/*
+				 * -4..4 An initial QP offset for I in GOP.
+				 * bit[3] is sign, bit[2..0] is value
+				 * ex. -2 = BIT(3) | 2;
+				 */
+				u8 gop_qp_offset = 0;
+				bool gop_qp_en = false;
+				bool rc_cbr_srtict = false;
+				/*
+				 * RC_MODE_OFF : Rate-control is off (Constant QP)
+				 * RC_MODE_CBR : Rate-control is on (CBR)
+				 * RC_MODE_ABR : Rate-control is on (ABR) recomended as default
+				 * RC_MODE_VENDOR : Rate-control is on (Picture-level RC)
+				 */
+				int rc_mode = CODA988_RC_MODE_OFF;
+
+				if (ctx->params.bitrate_mode == V4L2_MPEG_VIDEO_BITRATE_MODE_CBR)
+					rc_mode = CODA988_RC_MODE_CBR;
+				else
+					rc_mode = CODA988_RC_MODE_ABR;
+
+				if (rc_mode == CODA988_RC_MODE_CBR && ctx->params.vbv_delay < 20000)
+					ctx->params.vbv_delay = 20000;
+
+				value = ctx->params.gop_size;
+				value |= (ctx->params.h264_i_frame_period << 21);
+				value |= gop_qp_en << 20;
+				value |= (gop_qp_offset & 0xF) << 16;
+
+				coda_write(dev, value, CODA_CMD_ENC_SEQ_GOP_SIZE);
+
+				value = CODA_RATECONTROL_AUTOSKIP_DISABLE(skip_frame);
+				value |= CODA_RATECONTROL_INITIALDELAY(ctx->params.vbv_delay);
+				coda_write(dev, value, CODA_CMD_ENC_SEQ_RC_PARA);
+
+				if (rc_mode == 1)
+					value |= rc_cbr_srtict << 22;
+				value |= ((ctx->params.bitrate) << 4) | rc_mode;
+				coda_write(dev, value, CODA988_CMD_ENC_SEQ_RC_PARA2);
+			}
+		} else {
+			coda_write(dev, ctx->params.gop_size, CODA_CMD_ENC_SEQ_GOP_SIZE);
+			value = (ctx->params.bitrate & CODA_RATECONTROL_BITRATE_MASK)
+					<< CODA_RATECONTROL_BITRATE_OFFSET;
+			value |=  1 & CODA_RATECONTROL_ENABLE_MASK;
+			value |= CODA_RATECONTROL_INITIALDELAY(ctx->params.vbv_delay);
+			if (dev->devtype->product == CODA_960)
+				value |= BIT(31); /* disable autoskip */
+			coda_write(dev, value, CODA_CMD_ENC_SEQ_RC_PARA);
+		}
 	} else {
+		coda_dbg(1, ctx, "CODA RateControl Disable\n");
+		value = ctx->params.gop_size;
+		if (dev->devtype->product == CODA_988 && dst_fourcc == V4L2_PIX_FMT_H264)
+			value |= (ctx->params.h264_i_frame_period << 21);
+
+		coda_write(dev, value, CODA_CMD_ENC_SEQ_GOP_SIZE);
+
 		value = 0;
+		coda_write(dev, value, CODA_CMD_ENC_SEQ_RC_PARA);
+		if (dev->devtype->product == CODA_988) {
+			coda_write(dev, 0, CODA988_CMD_ENC_SEQ_QP_RANGE_SET);
+			coda_write(dev, 0, CODA988_CMD_ENC_SEQ_RC_PARA2);
+		}
 	}
-	coda_write(dev, value, CODA_CMD_ENC_SEQ_RC_PARA);
 
-	coda_write(dev, ctx->params.vbv_size, CODA_CMD_ENC_SEQ_RC_BUF_SIZE);
+	value = 0;
+	if (ctx->params.vbv_size && dev->devtype->product == CODA_988)
+		value = ctx->params.vbv_size | BIT(16);
+	else
+		value = ctx->params.vbv_size;
+	coda_write(dev, value, CODA_CMD_ENC_SEQ_RC_BUF_SIZE);
 	coda_write(dev, ctx->params.intra_refresh,
 		   CODA_CMD_ENC_SEQ_INTRA_REFRESH);
 
+	value = 0;
+	if (ctx->params.intra_refresh && dev->devtype->product == CODA_988)
+		value = ctx->params.intra_refresh | BIT(16);
+	else
+		value = ctx->params.intra_refresh;
+	coda_write(dev, value, CODA_CMD_ENC_SEQ_INTRA_REFRESH);
+
 	coda_write(dev, bitstream_buf, CODA_CMD_ENC_SEQ_BB_START);
 	coda_write(dev, bitstream_size / 1024, CODA_CMD_ENC_SEQ_BB_SIZE);
 
 
 	value = 0;
 	if (ctx->params.gamma > 0) {
-		if (dev->devtype->product == CODA_960)
+		if (dev->devtype->product == CODA_960 || dev->devtype->product == CODA_988)
 			value |= 1 << CODA9_OPTION_GAMMA_OFFSET;
 		else if (dev->devtype->product == CODA_DX6)
 			value |= 1 << CODADX6_OPTION_GAMMA_OFFSET;
@@ -1258,13 +1791,66 @@ static int coda_start_encoding(struct coda_ctx *ctx)
 		coda_write(dev, ctx->params.gamma, CODA_CMD_ENC_SEQ_RC_GAMMA);
 	}
 
-	if (ctx->params.h264_min_qp || ctx->params.h264_max_qp) {
+	if (dev->devtype->product == CODA_988) {
+		int qp_range_h264 = 0;
+		int qp_range_mpeg = 0;
+		int qp_delta_h264 = 0;
+
+		/* min/max qp special for every frame type (I/P) used first */
+		/* min/max qp common for all frame type (I/P) used second */
+		if (dst_fourcc == V4L2_PIX_FMT_H264) {
+			/* TODO delta QP don't use now */
+			int min_delta_qp = 0;
+			int max_delta_qp = 0;
+
+			if (min_delta_qp > 0)
+				qp_delta_h264 = (BIT(6) | min_delta_qp) << 8;
+
+			if (max_delta_qp > 0)
+				qp_delta_h264 = BIT(6) | max_delta_qp;
+
+			if (ctx->params.h264_min_i_qp)
+				qp_range_h264 |= (BIT(6) | ctx->params.h264_min_i_qp);
+			else if (ctx->params.h264_min_qp)
+				qp_range_h264 |= (BIT(6) | ctx->params.h264_min_qp);
+
+			if (ctx->params.h264_max_i_qp)
+				qp_range_h264 |= (BIT(6) | ctx->params.h264_max_i_qp) << 8;
+			else if (ctx->params.h264_max_qp)
+				qp_range_h264 |= (BIT(6) | ctx->params.h264_max_qp) << 8;
+
+			if (ctx->params.h264_min_p_qp)
+				qp_range_h264 |= (BIT(6) | ctx->params.h264_min_p_qp) << 16;
+			else if (ctx->params.h264_min_qp)
+				qp_range_h264 |= (BIT(6) | ctx->params.h264_min_qp) << 16;
+
+			if (ctx->params.h264_max_p_qp)
+				qp_range_h264 |= (BIT(6) | ctx->params.h264_max_p_qp) << 24;
+			else if (ctx->params.h264_max_qp)
+				qp_range_h264 |= (BIT(6) | ctx->params.h264_max_qp) << 24;
+		} else if (dst_fourcc == V4L2_PIX_FMT_MPEG4) {
+			qp_range_mpeg = ctx->params.mpeg4_max_qp;
+		} else  if (dst_fourcc == V4L2_PIX_FMT_H263) {
+			qp_range_mpeg = ctx->params.h263_max_qp;
+		}
+
+		coda_write(dev, qp_delta_h264, CODA988_CMD_ENC_SEQ_DELTA_QP);
+		coda_write(dev, qp_range_mpeg, CODA988_CMD_ENC_SEQ_RC_QP_MAX);
+		coda_write(dev, qp_range_h264, CODA988_CMD_ENC_SEQ_QP_RANGE_SET);
+	} else if (dst_fourcc == V4L2_PIX_FMT_H264 ||
+		   ctx->params.h264_min_qp ||
+		   ctx->params.h264_max_qp) {
 		coda_write(dev,
 			   ctx->params.h264_min_qp << CODA_QPMIN_OFFSET |
 			   ctx->params.h264_max_qp << CODA_QPMAX_OFFSET,
 			   CODA_CMD_ENC_SEQ_RC_QP_MIN_MAX);
+	} else {
+		coda_write(dev, 0, CODA_CMD_ENC_SEQ_RC_QP_MIN_MAX);
 	}
-	if (dev->devtype->product == CODA_960) {
+
+	if (dev->devtype->product == CODA_988) {
+		value |= ctx->params.encode_aud_en << 2;
+	} else if (dev->devtype->product == CODA_960) {
 		if (ctx->params.h264_max_qp)
 			value |= 1 << CODA9_OPTION_RCQPMAX_OFFSET;
 	} else {
@@ -1275,10 +1861,16 @@ static int coda_start_encoding(struct coda_ctx *ctx)
 	}
 	coda_write(dev, value, CODA_CMD_ENC_SEQ_OPTION);
 
-	if (ctx->params.frame_rc_enable && !ctx->params.mb_rc_enable)
-		value = 1;
-	else
+	if (dev->devtype->product == CODA_988) {
+		/* TODO check mode = 3 */
 		value = 0;
+	} else {
+		if (ctx->params.frame_rc_enable && !ctx->params.mb_rc_enable)
+			value = 1;
+		else
+			value = 0;
+	}
+
 	coda_write(dev, value, CODA_CMD_ENC_SEQ_RC_INTERVAL_MODE);
 
 	coda_setup_iram(ctx);
@@ -1299,6 +1891,40 @@ static int coda_start_encoding(struct coda_ctx *ctx)
 		case CODA_960:
 			coda_write(dev, 0, CODA9_CMD_ENC_SEQ_ME_OPTION);
 			coda_write(dev, 0, CODA9_CMD_ENC_SEQ_INTRA_WEIGHT);
+			break;
+		case CODA_988:
+			/* An intra cost weight factor for Intra/Inter type decision */
+			u32 intra_const_weight = 0;
+			/* A block mode enable flag for Motion Estimation */
+			u32 me_blk_mode = 0;
+			/* A Motion Estimation PMV option */
+			u32 me_use_zero_pmv = 0;
+			/* A line buffer mode for Motion Estimation*/
+			u32 me_line_buf_mode = 2;
+
+			/* For conservative operation as defined in each of the video codec
+			 * specification, it would be better to set 0 for H.264/AVC encoder
+			 * and 1 for MPEG-4 encoder.
+			 * Programmer's Guide Version 3.13.45.4 page 205
+			 */
+			if (dst_fourcc == V4L2_PIX_FMT_MPEG4 || dst_fourcc == V4L2_PIX_FMT_H263)
+				me_use_zero_pmv = 1;
+
+			/* always use constant values for h.263 */
+			if (dst_fourcc == V4L2_PIX_FMT_H263) {
+				ctx->params.me_search_range_y = 3;
+				ctx->params.me_search_range_x = 2;
+			}
+
+			value = CODA9_CMD_ENC_SEQ_ME_LINE_BUF_MODE(me_line_buf_mode) |
+				CODA9_CMD_ENC_SEQ_ME_BLK_MODE_EN(me_blk_mode) |
+				CODA9_CMD_ENC_SEQ_ME_USE_ZERO_PMV(me_use_zero_pmv) |
+				CODA9_CMD_ENC_SEQ_ME_SEARCH_RANGE_X(ctx->params.me_search_range_y) |
+				CODA9_CMD_ENC_SEQ_ME_SEARCH_RANGE_X(ctx->params.me_search_range_x);
+			coda_write(dev, value, CODA9_CMD_ENC_SEQ_ME_OPTION);
+			coda_write(dev, intra_const_weight,
+				   CODA9_CMD_ENC_SEQ_INTRA_WEIGHT);
+			break;
 		}
 	}
 
@@ -1316,7 +1942,7 @@ static int coda_start_encoding(struct coda_ctx *ctx)
 	ctx->initialized = 1;
 
 	if (dst_fourcc != V4L2_PIX_FMT_JPEG) {
-		if (dev->devtype->product == CODA_960)
+		if (dev->devtype->product == CODA_960 || dev->devtype->product == CODA_988)
 			ctx->num_internal_frames = 4;
 		else
 			ctx->num_internal_frames = 2;
@@ -1362,6 +1988,8 @@ static int coda_start_encoding(struct coda_ctx *ctx)
 				   CODA9_CMD_SET_FRAME_SUBSAMP_A);
 			coda_write(dev, ctx->internal_frames[3].buf.paddr,
 				   CODA9_CMD_SET_FRAME_SUBSAMP_B);
+		} else if (dev->devtype->product == CODA_988) {
+			coda988_set_frame_cache(ctx, q_data_src->fourcc);
 		}
 	}
 
@@ -1395,12 +2023,13 @@ static int coda_start_encoding(struct coda_ctx *ctx)
 		 * If visible width or height are not aligned to macroblock
 		 * size, the crop_right and crop_bottom SPS fields must be set
 		 * to the difference between visible and coded size.  This is
-		 * only supported by CODA960 firmware. All others do not allow
+		 * only supported by CODA960/980 firmware. All others do not allow
 		 * writing frame cropping parameters, so we have to manually
 		 * fix up the SPS RBSP (Sequence Parameter Set Raw Byte
 		 * Sequence Payload) ourselves.
 		 */
 		if (ctx->dev->devtype->product != CODA_960 &&
+			dev->devtype->product != CODA_988 &&
 		    ((q_data_src->rect.width % 16) ||
 		     (q_data_src->rect.height % 16))) {
 			ret = coda_h264_sps_fixup(ctx, q_data_src->rect.width,
@@ -1455,6 +2084,8 @@ static int coda_start_encoding(struct coda_ctx *ctx)
 		if (ret < 0)
 			goto out;
 		break;
+	case V4L2_PIX_FMT_H263:
+		/* In H.263, ENC_HEADER command is ignored.*/
 	default:
 		/* No more formats need to save headers at the moment */
 		break;
@@ -1556,6 +2187,9 @@ static int coda_prepare_encode(struct coda_ctx *ctx)
 		case V4L2_PIX_FMT_JPEG:
 			quant_param = 30;
 			break;
+		case V4L2_PIX_FMT_H263:
+			quant_param = ctx->params.h263_intra_qp;
+			break;
 		default:
 			v4l2_warn(&ctx->dev->v4l2_dev,
 				"cannot set intra qp, fmt not supported\n");
@@ -1569,6 +2203,9 @@ static int coda_prepare_encode(struct coda_ctx *ctx)
 		case V4L2_PIX_FMT_MPEG4:
 			quant_param = ctx->params.mpeg4_inter_qp;
 			break;
+		case V4L2_PIX_FMT_H263:
+			quant_param = ctx->params.h263_inter_qp;
+			break;
 		default:
 			v4l2_warn(&ctx->dev->v4l2_dev,
 				"cannot set inter qp, fmt not supported\n");
@@ -1579,14 +2216,25 @@ static int coda_prepare_encode(struct coda_ctx *ctx)
 	/* submit */
 	if (ctx->params.rot_mode)
 		rot_mode = CODA_ROT_MIR_ENABLE | ctx->params.rot_mode;
+
+	if (dev->devtype->product == CODA_988) {
+		if (q_data_src->fourcc == V4L2_PIX_FMT_NV12 ||
+		    q_data_src->fourcc == V4L2_PIX_FMT_NV21)
+			rot_mode |= CODA988_CBCR_INTERLIVE;
+		if (q_data_src->fourcc == V4L2_PIX_FMT_NV21)
+			rot_mode |= CODA988_SELECT_NV21;
+	}
 	coda_write(dev, rot_mode, CODA_CMD_ENC_PIC_ROT_MODE);
 	coda_write(dev, quant_param, CODA_CMD_ENC_PIC_QS);
 
-	if (dev->devtype->product == CODA_960) {
+	if (dev->devtype->product == CODA_960 ||
+	    dev->devtype->product == CODA_988) {
 		coda_write(dev, 4/*FIXME: 0*/, CODA9_CMD_ENC_PIC_SRC_INDEX);
 		coda_write(dev, q_data_src->bytesperline,
 			   CODA9_CMD_ENC_PIC_SRC_STRIDE);
-		coda_write(dev, 0, CODA9_CMD_ENC_PIC_SUB_FRAME_SYNC);
+
+		if (dev->devtype->product == CODA_960)
+			coda_write(dev, 0, CODA9_CMD_ENC_PIC_SUB_FRAME_SYNC);
 
 		reg = CODA9_CMD_ENC_PIC_SRC_ADDR_Y;
 	} else {
@@ -1712,7 +2360,8 @@ static void coda_seq_end_work(struct work_struct *work)
 	 * from the output stream after the h.264 decoder has run. Resetting the
 	 * hardware after the decoder has finished seems to help.
 	 */
-	if (dev->devtype->product == CODA_960)
+	if (dev->devtype->product == CODA_960 ||
+	    dev->devtype->product == CODA_988)
 		coda_hw_reset(ctx);
 
 	kfifo_init(&ctx->bitstream_fifo,
@@ -1815,7 +2464,8 @@ static bool coda_reorder_enable(struct coda_ctx *ctx)
 
 	if (dev->devtype->product != CODA_HX4 &&
 	    dev->devtype->product != CODA_7541 &&
-	    dev->devtype->product != CODA_960)
+	    dev->devtype->product != CODA_960 &&
+	    dev->devtype->product != CODA_988)
 		return false;
 
 	if (ctx->codec->src_fourcc == V4L2_PIX_FMT_JPEG)
@@ -1864,7 +2514,9 @@ static int __coda_decoder_seq_init(struct coda_ctx *ctx)
 	int width, height;
 	u32 src_fourcc, dst_fourcc;
 	u32 val;
-	int ret;
+	u8 crop_shift;
+	u16 crop_mask;
+	int ret = 0;
 
 	lockdep_assert_held(&dev->coda_mutex);
 
@@ -1882,13 +2534,27 @@ static int __coda_decoder_seq_init(struct coda_ctx *ctx)
 	/* Update coda bitstream read and write pointers from kfifo */
 	coda_kfifo_sync_to_device_full(ctx);
 
-	ctx->frame_mem_ctrl &= ~(CODA_FRAME_CHROMA_INTERLEAVE | (0x3 << 9) |
-				 CODA9_FRAME_TILED2LINEAR);
-	if (dst_fourcc == V4L2_PIX_FMT_NV12 || dst_fourcc == V4L2_PIX_FMT_YUYV)
+	if (dev->devtype->product == CODA_988) {
+		ctx->frame_mem_ctrl &= ~(CODA_FRAME_CHROMA_INTERLEAVE |
+					 CODA988_FRAME_CHROMA_NV21_SWAP |
+					 CODA988_FRAME_TILED_MAP_MASK |
+					 CODA988_FRAME_TILED2LINEAR_MASK);
+		if (ctx->tiled_map_type == GDI_TILED_FRAME_MB_RASTER_MAP) {
+			ctx->frame_mem_ctrl |= CODA988_FRAME_TILED2LINEAR_FRAME_MAP |
+					       CODA988_FRAME_TILED_MAP_TILED_FRAME_MB_RAST;
+		}
+	} else {
+		ctx->frame_mem_ctrl &= ~(CODA_FRAME_CHROMA_INTERLEAVE | (0x3 << 9) |
+					 CODA9_FRAME_TILED2LINEAR);
+		if (ctx->tiled_map_type == GDI_TILED_FRAME_MB_RASTER_MAP)
+			ctx->frame_mem_ctrl |= (0x3 << 9) |
+				((ctx->use_vdoa) ? 0 : CODA9_FRAME_TILED2LINEAR);
+	}
+	if (dst_fourcc == V4L2_PIX_FMT_NV12 || dst_fourcc == V4L2_PIX_FMT_NV21 ||
+	    dst_fourcc == V4L2_PIX_FMT_YUYV)
 		ctx->frame_mem_ctrl |= CODA_FRAME_CHROMA_INTERLEAVE;
-	if (ctx->tiled_map_type == GDI_TILED_FRAME_MB_RASTER_MAP)
-		ctx->frame_mem_ctrl |= (0x3 << 9) |
-			((ctx->use_vdoa) ? 0 : CODA9_FRAME_TILED2LINEAR);
+	if (dst_fourcc == V4L2_PIX_FMT_NV21 && dev->devtype->product == CODA_988)
+		ctx->frame_mem_ctrl |= CODA988_FRAME_CHROMA_NV21_SWAP;
 	coda_write(dev, ctx->frame_mem_ctrl, CODA_REG_BIT_FRAME_MEM_CTRL);
 
 	ctx->display_idx = -1;
@@ -1897,6 +2563,12 @@ static int __coda_decoder_seq_init(struct coda_ctx *ctx)
 
 	coda_write(dev, bitstream_buf, CODA_CMD_DEC_SEQ_BB_START);
 	coda_write(dev, bitstream_size / 1024, CODA_CMD_DEC_SEQ_BB_SIZE);
+	if (dev->devtype->product == CODA_988) {
+		coda_write(dev, 0x0, CODA988_CMD_DEC_SEQ_USER_DATA_OPTION);
+		coda_write(dev, 0x0, CODA988_CMD_DEC_SEQ_USER_DATA_BASE_ADDR);
+		coda_write(dev, 0x0, CODA988_CMD_DEC_SEQ_USER_DATA_BUF_SIZE);
+	}
+
 	val = 0;
 	if (coda_reorder_enable(ctx))
 		val |= CODA_REORDER_ENABLE;
@@ -1908,6 +2580,16 @@ static int __coda_decoder_seq_init(struct coda_ctx *ctx)
 	if (dev->devtype->product == CODA_960 &&
 	    src_fourcc == V4L2_PIX_FMT_MPEG4)
 		ctx->params.codec_mode_aux = CODA_MP4_AUX_MPEG4;
+	else if (dev->devtype->product == CODA_988) {
+		if (src_fourcc == V4L2_PIX_FMT_MPEG4 || src_fourcc == V4L2_PIX_FMT_H263)
+			ctx->params.codec_mode_aux = CODA_MP4_AUX_MPEG4;
+		if (src_fourcc == V4L2_PIX_FMT_VP8)
+			ctx->params.codec_mode_aux = CODA_VPX_AUX_VP8;
+		if (src_fourcc == V4L2_PIX_FMT_H264_MVC)
+			ctx->params.codec_mode_aux = CODA_H264_AUX_MVC;
+		if (src_fourcc == V4L2_PIX_FMT_H264)
+			ctx->params.codec_mode_aux = CODA_H264_AUX_AVC;
+	}
 	else
 		ctx->params.codec_mode_aux = 0;
 	if (src_fourcc == V4L2_PIX_FMT_MPEG4) {
@@ -1925,14 +2607,22 @@ static int __coda_decoder_seq_init(struct coda_ctx *ctx)
 		if (dev->devtype->product == CODA_960) {
 			coda_write(dev, 0, CODA_CMD_DEC_SEQ_X264_MV_EN);
 			coda_write(dev, 512, CODA_CMD_DEC_SEQ_SPP_CHUNK_SIZE);
+		} else if (dev->devtype->product == CODA_988) {
+			coda_write(dev, 1, CODA_CMD_DEC_SEQ_X264_MV_EN);
+			coda_write(dev, 1024, CODA_CMD_DEC_SEQ_SPP_CHUNK_SIZE);
 		}
 	}
 	if (src_fourcc == V4L2_PIX_FMT_JPEG)
 		coda_write(dev, 0, CODA_CMD_DEC_SEQ_JPG_THUMB_EN);
-	if (dev->devtype->product != CODA_960)
+	if (dev->devtype->product != CODA_960 && dev->devtype->product != CODA_988)
 		coda_write(dev, 0, CODA_CMD_DEC_SEQ_SRC_SIZE);
 
-	ctx->bit_stream_param = CODA_BIT_DEC_SEQ_INIT_ESCAPE;
+	/* SeqInitEscape flag is obsoleted for coda988 */
+	if (dev->devtype->product == CODA_988)
+		ctx->bit_stream_param = 0x0;
+	else
+		ctx->bit_stream_param = CODA_BIT_DEC_SEQ_INIT_ESCAPE;
+
 	ret = coda_command_sync(ctx, CODA_COMMAND_SEQ_INIT);
 	ctx->bit_stream_param = 0;
 	if (ret) {
@@ -1981,6 +2671,16 @@ static int __coda_decoder_seq_init(struct coda_ctx *ctx)
 	coda_dbg(1, ctx, "start decoding: %dx%d\n", width, height);
 
 	ctx->num_internal_frames = coda_read(dev, CODA_RET_DEC_SEQ_FRAME_NEED);
+
+	/*
+	 * For coda988 there is a bug with the number of required frame buffers.
+	 * We need at least 8 to avoid getting "-1" in CODA_RET_DEC_PIC_CUR_IDX reg
+	 * that means BIT does not decode a picture at this picture run command
+	 * because there is not enough frame buffer to continue decoding process.
+	 */
+	if (dev->devtype->product == CODA_988)
+		ctx->num_internal_frames = max(ctx->num_internal_frames, CODA988_MIN_FRAMEBUFFERS);
+
 	/*
 	 * If the VDOA is used, the decoder needs one additional frame,
 	 * because the frames are freed when the next frame is decoded.
@@ -2004,12 +2704,20 @@ static int __coda_decoder_seq_init(struct coda_ctx *ctx)
 		left_right = coda_read(dev, CODA_RET_DEC_SEQ_CROP_LEFT_RIGHT);
 		top_bottom = coda_read(dev, CODA_RET_DEC_SEQ_CROP_TOP_BOTTOM);
 
-		q_data_dst->rect.left = (left_right >> 10) & 0x3ff;
-		q_data_dst->rect.top = (top_bottom >> 10) & 0x3ff;
+		if (dev->devtype->product == CODA_988) {
+			crop_shift = CODA_988_CROP_SHIFT;
+			crop_mask = CODA_988_CROP_MASK;
+		} else {
+			crop_shift = CODA_COMMON_CROP_SHIFT;
+			crop_mask = CODA_COMMON_CROP_MASK;
+		}
+
+		q_data_dst->rect.left = (left_right >> crop_shift) & crop_mask;
+		q_data_dst->rect.top = (top_bottom >> crop_shift) & crop_mask;
 		q_data_dst->rect.width = width - q_data_dst->rect.left -
-					 (left_right & 0x3ff);
+					 (left_right & crop_mask);
 		q_data_dst->rect.height = height - q_data_dst->rect.top -
-					  (top_bottom & 0x3ff);
+					  (top_bottom & crop_mask);
 	}
 
 	if (dev->devtype->product != CODA_DX6) {
@@ -2059,13 +2767,27 @@ static int __coda_start_decoding(struct coda_ctx *ctx)
 		if (ret < 0)
 			return ret;
 	} else {
-		ctx->frame_mem_ctrl &= ~(CODA_FRAME_CHROMA_INTERLEAVE | (0x3 << 9) |
-					 CODA9_FRAME_TILED2LINEAR);
-		if (dst_fourcc == V4L2_PIX_FMT_NV12 || dst_fourcc == V4L2_PIX_FMT_YUYV)
+		if (dev->devtype->product == CODA_988) {
+			ctx->frame_mem_ctrl &= ~(CODA_FRAME_CHROMA_INTERLEAVE |
+						 CODA988_FRAME_CHROMA_NV21_SWAP |
+						 CODA988_FRAME_TILED_MAP_MASK |
+						 CODA988_FRAME_TILED2LINEAR_MASK);
+			if (ctx->tiled_map_type == GDI_TILED_FRAME_MB_RASTER_MAP) {
+				ctx->frame_mem_ctrl |= CODA988_FRAME_TILED2LINEAR_FRAME_MAP |
+						       CODA988_FRAME_TILED_MAP_TILED_FRAME_MB_RAST;
+			}
+		} else {
+			ctx->frame_mem_ctrl &= ~(CODA_FRAME_CHROMA_INTERLEAVE | (0x3 << 9) |
+						 CODA9_FRAME_TILED2LINEAR);
+			if (ctx->tiled_map_type == GDI_TILED_FRAME_MB_RASTER_MAP)
+				ctx->frame_mem_ctrl |= (0x3 << 9) |
+					((ctx->use_vdoa) ? 0 : CODA9_FRAME_TILED2LINEAR);
+		}
+		if (dst_fourcc == V4L2_PIX_FMT_NV12 || dst_fourcc == V4L2_PIX_FMT_NV21 ||
+		    dst_fourcc == V4L2_PIX_FMT_YUYV)
 			ctx->frame_mem_ctrl |= CODA_FRAME_CHROMA_INTERLEAVE;
-		if (ctx->tiled_map_type == GDI_TILED_FRAME_MB_RASTER_MAP)
-			ctx->frame_mem_ctrl |= (0x3 << 9) |
-				((ctx->use_vdoa) ? 0 : CODA9_FRAME_TILED2LINEAR);
+		if (dst_fourcc == V4L2_PIX_FMT_NV21 && dev->devtype->product == CODA_988)
+			ctx->frame_mem_ctrl |= CODA988_FRAME_CHROMA_NV21_SWAP;
 	}
 
 	coda_write(dev, ctx->parabuf.paddr, CODA_REG_BIT_PARA_BUF_ADDR);
@@ -2078,8 +2800,13 @@ static int __coda_start_decoding(struct coda_ctx *ctx)
 
 	/* Tell the decoder how many frame buffers we allocated. */
 	coda_write(dev, ctx->num_internal_frames, CODA_CMD_SET_FRAME_BUF_NUM);
-	coda_write(dev, round_up(q_data_dst->rect.width, 16),
-		   CODA_CMD_SET_FRAME_BUF_STRIDE);
+	if (dev->devtype->product == CODA_988) {
+		coda_write(dev, round_up(q_data_dst->rect.width, 32),
+			   CODA_CMD_SET_FRAME_BUF_STRIDE);
+	} else {
+		coda_write(dev, round_up(q_data_dst->rect.width, 16),
+			   CODA_CMD_SET_FRAME_BUF_STRIDE);
+	}
 
 	if (dev->devtype->product != CODA_DX6) {
 		/* Set secondary AXI IRAM */
@@ -2095,15 +2822,23 @@ static int __coda_start_decoding(struct coda_ctx *ctx)
 				CODA7_CMD_SET_FRAME_AXI_DBKC_ADDR);
 		coda_write(dev, ctx->iram_info.buf_ovl_use,
 				CODA7_CMD_SET_FRAME_AXI_OVL_ADDR);
-		if (dev->devtype->product == CODA_960) {
-			coda_write(dev, ctx->iram_info.buf_btp_use,
-					CODA9_CMD_SET_FRAME_AXI_BTP_ADDR);
-
+		if (dev->devtype->product == CODA_960 ||
+		    dev->devtype->product == CODA_988) {
 			coda_write(dev, -1, CODA9_CMD_SET_FRAME_DELAY);
-			coda9_set_frame_cache(ctx, dst_fourcc);
+			if (dev->devtype->product == CODA_960) {
+				coda_write(dev, (u32)ctx->iram_info.buf_btp_use,
+					   CODA9_CMD_SET_FRAME_AXI_BTP_ADDR);
+				coda9_set_frame_cache(ctx, dst_fourcc);
+			} else {
+				coda988_set_frame_cache(ctx, dst_fourcc);
+			}
 		}
 	}
 
+	if (src_fourcc == V4L2_PIX_FMT_VP8) {
+		coda_write(dev, ctx->vp8mbbuf.paddr, CODA9_CMD_SET_FRAME_MB_BUF_BASE);
+	}
+
 	if (src_fourcc == V4L2_PIX_FMT_H264) {
 		coda_write(dev, ctx->slicebuf.paddr,
 				CODA_CMD_SET_FRAME_SLICE_BB_START);
@@ -2134,6 +2869,16 @@ static int __coda_start_decoding(struct coda_ctx *ctx)
 		return -ETIMEDOUT;
 	}
 
+	if (dev->devtype->product == CODA_988) {
+		u32 val = coda_read(dev, CODA988_RET_SET_FRAME_SUCCESS);
+
+		if (!(val & 0x1))
+			pr_err("SET_FRAME_SUCCESS = %d\n", val);
+
+		if (val & (1 << 31))
+			v4l2_err(&dev->v4l2_dev, "set frame: memory access violation\n");
+	}
+
 	return 0;
 }
 
@@ -2187,6 +2932,9 @@ static int coda_prepare_decode(struct coda_ctx *ctx)
 
 	if (dev->devtype->product == CODA_960)
 		coda_set_gdi_regs(ctx);
+	else if (dev->devtype->product == CODA_988 &&
+		 ctx->tiled_map_type == GDI_TILED_FRAME_MB_RASTER_MAP)
+		coda988_set_gdi_regs(ctx);
 
 	if (ctx->use_vdoa &&
 	    ctx->display_idx >= 0 &&
@@ -2195,7 +2943,8 @@ static int coda_prepare_decode(struct coda_ctx *ctx)
 				vb2_dma_contig_plane_dma_addr(&dst_buf->vb2_buf, 0),
 				ctx->internal_frames[ctx->display_idx].buf.paddr);
 	} else {
-		if (dev->devtype->product == CODA_960) {
+		if (dev->devtype->product == CODA_960 ||
+		    dev->devtype->product == CODA_988) {
 			/*
 			 * It was previously assumed that the CODA960 has an
 			 * internal list of 64 buffer entries that contains
@@ -2239,12 +2988,19 @@ static int coda_prepare_decode(struct coda_ctx *ctx)
 		/* 'hardcode to use interrupt disable mode'? */
 		coda_write(dev, (1 << 10), CODA_CMD_DEC_PIC_OPTION);
 		break;
+	case CODA_988:
+		coda_write(dev, 0x0, CODA988_CMD_DEC_PIC_USER_DATA_BASE_ADDR);
+		coda_write(dev, 0x0, CODA988_CMD_DEC_PIC_USER_DATA_BUF_SIZE);
+		coda_write(dev, 0x0, CODA988_CMD_DEC_PIC_NUM_ROWS);
+		coda_write(dev, CODA988_UDATA_REPORT_INT_DISABLE, CODA_CMD_DEC_PIC_OPTION);
+		break;
 	}
 
-	coda_write(dev, 0, CODA_CMD_DEC_PIC_SKIP_NUM);
-
-	coda_write(dev, 0, CODA_CMD_DEC_PIC_BB_START);
-	coda_write(dev, 0, CODA_CMD_DEC_PIC_START_BYTE);
+	if (dev->devtype->product != CODA_988) {
+		coda_write(dev, 0, CODA_CMD_DEC_PIC_SKIP_NUM);
+		coda_write(dev, 0, CODA_CMD_DEC_PIC_BB_START);
+		coda_write(dev, 0, CODA_CMD_DEC_PIC_START_BYTE);
+	}
 
 	if (dev->devtype->product != CODA_DX6)
 		coda_write(dev, ctx->iram_info.axi_sram_use,
@@ -2339,6 +3095,19 @@ static void coda_finish_decode(struct coda_ctx *ctx)
 			v4l2_err(&dev->v4l2_dev,
 				 "insufficient slice buffer space (%d bytes)\n",
 				 ctx->slicebuf.size);
+		if (ctx->dev->devtype->product == CODA_988 && val & (1 << 16))
+			v4l2_err(&dev->v4l2_dev,
+				 "in-stream should be reused by Non-Paired field\n");
+		if (ctx->dev->devtype->product == CODA_988 && val & (1 << 17))
+			v4l2_err(&dev->v4l2_dev, "syntax error in the picture header\n");
+		if (ctx->dev->devtype->product == CODA_988 && val & (1 << 19))
+			v4l2_err(&dev->v4l2_dev, "the current frame number is wrapped around\n");
+		if (ctx->dev->devtype->product == CODA_988 && val & (1 << 20))
+			v4l2_err(&dev->v4l2_dev, "there is a change of sequence\n");
+		if (ctx->dev->devtype->product == CODA_988 && val & (1 << 21))
+			v4l2_err(&dev->v4l2_dev, "reference frame is missing\n");
+		if (ctx->dev->devtype->product == CODA_988 && val & (1 << 31))
+			v4l2_err(&dev->v4l2_dev, "pic dec: memory access violation\n");
 	}
 
 	val = coda_read(dev, CODA_RET_DEC_PIC_SIZE);
@@ -2624,6 +3393,10 @@ irqreturn_t coda_irq_handler(int irq, void *data)
 	struct coda_dev *dev = data;
 	struct coda_ctx *ctx;
 	u32 status;
+	u32 irq_reason;
+
+	if (dev->devtype->product == CODA_988)
+		irq_reason = coda_read(dev, CODA_REG_BIT_INT_REASON);
 
 	/* read status register to attend the IRQ */
 	status = coda_read(dev, CODA_REG_BIT_INT_STATUS);
@@ -2657,7 +3430,14 @@ irqreturn_t coda_irq_handler(int irq, void *data)
 		coda_dbg(1, ctx, "task has been aborted\n");
 	}
 
-	if (coda_isbusy(ctx->dev)) {
+	if (dev->devtype->product == CODA_988) {
+		if (irq_reason & CODA988_INT_BIT_BIT_BUF_FULL)
+			coda_dbg(1, ctx, "Error! External bitsteam buffer is in full status\n");
+		else if (irq_reason & CODA988_INT_BIT_BIT_BUF_EMPTY)
+			coda_dbg(1, ctx, "Error! External bitsteam buffer is in empty status\n");
+	}
+
+	if (coda_isbusy(ctx->dev, CODA_REG_BIT_BUSY)) {
 		coda_dbg(1, ctx, "coda is still busy!!!!\n");
 		return IRQ_NONE;
 	}
diff --git a/drivers/media/platform/chips-media/coda/coda-common.c b/drivers/media/platform/chips-media/coda/coda-common.c
index b73b09b3baf9..fabf7bc4d34f 100644
--- a/drivers/media/platform/chips-media/coda/coda-common.c
+++ b/drivers/media/platform/chips-media/coda/coda-common.c
@@ -43,7 +43,7 @@
 #define CODA_NAME		"coda"
 
 #define CODADX6_MAX_INSTANCES	4
-#define CODA_MAX_FORMATS	5
+#define CODA_MAX_FORMATS	6
 
 #define CODA_ISRAM_SIZE	(2048 * 2)
 
@@ -104,6 +104,14 @@ void coda_write_base(struct coda_ctx *ctx, struct coda_q_data *q_data,
 		base_cb = base_y + q_data->bytesperline * q_data->height;
 		base_cr = base_cb + q_data->bytesperline * q_data->height / 4;
 		break;
+	case V4L2_PIX_FMT_NV21:
+		if (ctx->dev->devtype->product == CODA_988) {
+			/* for coda988 uses swap control bits */
+			base_cb = base_y + q_data->bytesperline * q_data->height;
+			base_cr = base_cb + q_data->bytesperline * q_data->height / 4;
+			break;
+		}
+		fallthrough;
 	case V4L2_PIX_FMT_YVU420:
 		/* Switch Cb and Cr for YVU420 format */
 		base_cr = base_y + q_data->bytesperline * q_data->height;
@@ -117,6 +125,22 @@ void coda_write_base(struct coda_ctx *ctx, struct coda_q_data *q_data,
 	coda_write(ctx->dev, base_y, reg_y);
 	coda_write(ctx->dev, base_cb, reg_y + 4);
 	coda_write(ctx->dev, base_cr, reg_y + 8);
+
+	if (ctx->dev->devtype->product == CODA_988) {
+		if (ctx->inst_type == CODA_INST_DECODER) {
+			coda_write(ctx->dev, 0x0, CODA988_CMD_DEC_PIC_ROT_BOTTOM_Y);
+			coda_write(ctx->dev, 0x0, CODA988_CMD_DEC_PIC_ROT_BOTTOM_CB);
+			coda_write(ctx->dev, 0x0, CODA988_CMD_DEC_PIC_ROT_BOTTOM_CR);
+		} else if (ctx->inst_type == CODA_INST_ENCODER) {
+			coda_write(ctx->dev, 0x0, CODA988_CMD_ENC_PIC_SRC_BOTTOM_Y);
+			coda_write(ctx->dev, 0x0, CODA988_CMD_ENC_PIC_SRC_BOTTOM_CB);
+			coda_write(ctx->dev, 0x0, CODA988_CMD_ENC_PIC_SRC_BOTTOM_CR);
+		} else {
+			dev_warn(ctx->dev->dev,
+				 "Unimplemented functionality for coda988: %s() :%d\n",
+				 __func__, __LINE__);
+		}
+	}
 }
 
 #define CODA_CODEC(mode, src_fourcc, dst_fourcc, max_w, max_h) \
@@ -162,6 +186,16 @@ static const struct coda_codec coda9_codecs[] = {
 	CODA_CODEC(CODA9_MODE_DECODE_MJPG, V4L2_PIX_FMT_JPEG,	V4L2_PIX_FMT_YUV420, 8192, 8192),
 };
 
+static const struct coda_codec coda988_codecs[] = {
+	CODA_CODEC(CODA9_MODE_ENCODE_H264, V4L2_PIX_FMT_YUV420, V4L2_PIX_FMT_H264,   4096, 2304),
+	CODA_CODEC(CODA9_MODE_ENCODE_MP4,  V4L2_PIX_FMT_YUV420, V4L2_PIX_FMT_MPEG4,  1920, 1088),
+	CODA_CODEC(CODA9_MODE_ENCODE_MP4,  V4L2_PIX_FMT_YUV420, V4L2_PIX_FMT_H263,   1920, 1088),
+	CODA_CODEC(CODA9_MODE_DECODE_H264, V4L2_PIX_FMT_H264,   V4L2_PIX_FMT_YUV420, 4096, 2304),
+	CODA_CODEC(CODA9_MODE_DECODE_MP4,  V4L2_PIX_FMT_MPEG4,  V4L2_PIX_FMT_YUV420, 1920, 1088),
+	CODA_CODEC(CODA9_MODE_DECODE_MP4,  V4L2_PIX_FMT_H263,   V4L2_PIX_FMT_YUV420, 1920, 1088),
+	CODA_CODEC(CODA9_MODE_DECODE_VPX,  V4L2_PIX_FMT_VP8,    V4L2_PIX_FMT_YUV420, 1920, 1088),
+};
+
 struct coda_video_device {
 	const char *name;
 	enum coda_inst_type type;
@@ -186,6 +220,23 @@ static const struct coda_video_device coda_bit_encoder = {
 	},
 };
 
+static const struct coda_video_device coda988_bit_encoder = {
+	.name = "coda988-video-encoder",
+	.type = CODA_INST_ENCODER,
+	.ops = &coda_bit_encode_ops,
+	.src_formats = {
+		V4L2_PIX_FMT_NV12,
+		V4L2_PIX_FMT_NV21,
+		V4L2_PIX_FMT_YUV420,
+		V4L2_PIX_FMT_YVU420,
+	},
+	.dst_formats = {
+		V4L2_PIX_FMT_H264,
+		V4L2_PIX_FMT_MPEG4,
+		V4L2_PIX_FMT_H263,
+	},
+};
+
 static const struct coda_video_device coda_bit_jpeg_encoder = {
 	.name = "coda-jpeg-encoder",
 	.type = CODA_INST_ENCODER,
@@ -222,6 +273,24 @@ static const struct coda_video_device coda_bit_decoder = {
 	},
 };
 
+static const struct coda_video_device coda988_bit_decoder = {
+	.name = "coda988-video-decoder",
+	.type = CODA_INST_DECODER,
+	.ops = &coda_bit_decode_ops,
+	.src_formats = {
+		V4L2_PIX_FMT_H264,
+		V4L2_PIX_FMT_MPEG4,
+		V4L2_PIX_FMT_H263,
+		V4L2_PIX_FMT_VP8,
+	},
+	.dst_formats = {
+		V4L2_PIX_FMT_NV12,
+		V4L2_PIX_FMT_NV21,
+		V4L2_PIX_FMT_YUV420,
+		V4L2_PIX_FMT_YVU420,
+	},
+};
+
 static const struct coda_video_device coda_bit_jpeg_decoder = {
 	.name = "coda-jpeg-decoder",
 	.type = CODA_INST_DECODER,
@@ -293,6 +362,12 @@ static const struct coda_video_device *coda9_video_devices[] = {
 	&coda_bit_decoder,
 };
 
+__maybe_unused
+static const struct coda_video_device *coda988_video_devices[] = {
+	&coda988_bit_encoder,
+	&coda988_bit_decoder,
+};
+
 /*
  * Normalize all supported YUV 4:2:0 formats to the value used in the codec
  * tables.
@@ -301,6 +376,7 @@ static u32 coda_format_normalize_yuv(u32 fourcc)
 {
 	switch (fourcc) {
 	case V4L2_PIX_FMT_NV12:
+	case V4L2_PIX_FMT_NV21:
 	case V4L2_PIX_FMT_YUV420:
 	case V4L2_PIX_FMT_YVU420:
 	case V4L2_PIX_FMT_YUV422P:
@@ -385,6 +461,8 @@ const char *coda_product_name(int product)
 		return "CODA7541";
 	case CODA_960:
 		return "CODA960";
+	case CODA_988:
+		return "CODA988";
 	default:
 		snprintf(buf, sizeof(buf), "(0x%04x)", product);
 		return buf;
@@ -433,6 +511,7 @@ static int coda_querycap(struct file *file, void *priv,
 
 static const u32 coda_formats_420[CODA_MAX_FORMATS] = {
 		V4L2_PIX_FMT_NV12,
+		V4L2_PIX_FMT_NV21,
 		V4L2_PIX_FMT_YUV420,
 		V4L2_PIX_FMT_YVU420,
 };
@@ -608,6 +687,7 @@ static int coda_try_fmt(struct coda_ctx *ctx, const struct coda_codec *codec,
 
 	switch (f->fmt.pix.pixelformat) {
 	case V4L2_PIX_FMT_NV12:
+	case V4L2_PIX_FMT_NV21:
 	case V4L2_PIX_FMT_YUV420:
 	case V4L2_PIX_FMT_YVU420:
 		/*
@@ -637,6 +717,8 @@ static int coda_try_fmt(struct coda_ctx *ctx, const struct coda_codec *codec,
 	case V4L2_PIX_FMT_H264:
 	case V4L2_PIX_FMT_MPEG4:
 	case V4L2_PIX_FMT_MPEG2:
+	case V4L2_PIX_FMT_H263:
+	case V4L2_PIX_FMT_VP8:
 		f->fmt.pix.bytesperline = 0;
 		f->fmt.pix.sizeimage = coda_estimate_sizeimage(ctx,
 							f->fmt.pix.sizeimage,
@@ -819,6 +901,7 @@ static int coda_s_fmt(struct coda_ctx *ctx, struct v4l2_format *f,
 		ctx->tiled_map_type = GDI_TILED_FRAME_MB_RASTER_MAP;
 		break;
 	case V4L2_PIX_FMT_NV12:
+	case V4L2_PIX_FMT_NV21:
 		if (!disable_tiling && ctx->use_bit &&
 		    ctx->dev->devtype->product == CODA_960) {
 			ctx->tiled_map_type = GDI_TILED_FRAME_MB_RASTER_MAP;
@@ -1820,6 +1903,7 @@ void coda_update_profile_level_ctrls(struct coda_ctx *ctx, u8 profile_idc,
 		level = coda_mpeg2_level(level_idc);
 		break;
 	case V4L2_PIX_FMT_MPEG4:
+	case V4L2_PIX_FMT_H263:
 		codec_name = "MPEG-4";
 		profile_cid = V4L2_CID_MPEG_VIDEO_MPEG4_PROFILE;
 		level_cid = V4L2_CID_MPEG_VIDEO_MPEG4_LEVEL;
@@ -1992,6 +2076,7 @@ static int coda_start_streaming(struct vb2_queue *q, unsigned int count)
 			mutex_unlock(&ctx->bitstream_mutex);
 
 			if (ctx->dev->devtype->product != CODA_960 &&
+			    ctx->dev->devtype->product != CODA_988 &&
 			    coda_get_bitstream_payload(ctx) < 512) {
 				v4l2_err(v4l2_dev, "start payload < 512\n");
 				ret = -EINVAL;
@@ -2078,6 +2163,13 @@ static int coda_start_streaming(struct vb2_queue *q, unsigned int count)
 	if (ctx->mb_err_cnt_ctrl)
 		v4l2_ctrl_s_ctrl(ctx->mb_err_cnt_ctrl, 0);
 
+	/*
+	 * VP8 decoder requires complete IVF bitstream instead of
+	 * just compressed frames
+	 */
+	if (q_data_dst->fourcc == V4L2_PIX_FMT_VP8)
+		ctx->params.vp8_fill_ivf_header = 1;
+
 	ret = ctx->ops->start_streaming(ctx);
 	if (ctx->inst_type == CODA_INST_DECODER) {
 		if (ret == -EAGAIN)
@@ -2246,9 +2338,25 @@ static int coda_s_ctrl(struct v4l2_ctrl *ctrl)
 		ctx->params.h264_chroma_qp_index_offset = ctrl->val;
 		break;
 	case V4L2_CID_MPEG_VIDEO_H264_PROFILE:
-		/* TODO: switch between baseline and constrained baseline */
-		if (ctx->inst_type == CODA_INST_ENCODER)
+		if (ctx->dev->devtype->product == CODA_988 &&
+		    ctx->inst_type == CODA_INST_ENCODER) {
+			switch (ctrl->val) {
+			case V4L2_MPEG_VIDEO_H264_PROFILE_CONSTRAINED_BASELINE:
+				ctx->params.h264_profile_idc = 66;
+				break;
+			case V4L2_MPEG_VIDEO_H264_PROFILE_MAIN:
+				ctx->params.h264_profile_idc = 77;
+				break;
+			case V4L2_MPEG_VIDEO_H264_PROFILE_HIGH:
+				ctx->params.h264_profile_idc = 100;
+				break;
+			default:
+				return -EINVAL;
+			}
+		} else if (ctx->inst_type == CODA_INST_ENCODER) {
+			/* TODO: switch between baseline and constrained baseline */
 			ctx->params.h264_profile_idc = 66;
+		}
 		break;
 	case V4L2_CID_MPEG_VIDEO_H264_LEVEL:
 		/* nothing to do, this is set by the encoder */
@@ -2298,6 +2406,64 @@ static int coda_s_ctrl(struct v4l2_ctrl *ctrl)
 	case V4L2_CID_MPEG_VIDEO_VBV_SIZE:
 		ctx->params.vbv_size = min(ctrl->val * 8192, 0x7fffffff);
 		break;
+	case V4L2_CID_MPEG_VIDEO_FRAME_SKIP_MODE:
+		ctx->params.frame_skip_mode = ctrl->val;
+		break;
+	case V4L2_CID_MPEG_VIDEO_H264_I_FRAME_MIN_QP:
+		ctx->params.h264_min_i_qp = ctrl->val;
+		break;
+	case V4L2_CID_MPEG_VIDEO_H264_I_FRAME_MAX_QP:
+		ctx->params.h264_max_i_qp = ctrl->val;
+		break;
+	case V4L2_CID_MPEG_VIDEO_H264_P_FRAME_MIN_QP:
+		ctx->params.h264_min_p_qp = ctrl->val;
+		break;
+	case V4L2_CID_MPEG_VIDEO_H264_P_FRAME_MAX_QP:
+		ctx->params.h264_max_p_qp = ctrl->val;
+		break;
+	case V4L2_CID_MPEG_VIDEO_H264_ENTROPY_MODE:
+		ctx->params.h264_entropy_mode = ctrl->val;
+		ctx->params.entropy_mode_changed = true;
+		break;
+	case V4L2_CID_MPEG_VIDEO_BITRATE_MODE:
+		ctx->params.bitrate_mode = ctrl->val;
+		break;
+	case V4L2_CID_MPEG_VIDEO_H264_8X8_TRANSFORM:
+		ctx->params.h264_en_8x8_transform = ctrl->val;
+		break;
+	case V4L2_CID_MPEG_VIDEO_H264_I_PERIOD:
+		ctx->params.h264_i_frame_period = ctrl->val;
+		break;
+	case V4L2_CID_MPEG_VIDEO_AU_DELIMITER:
+		ctx->params.encode_aud_en = ctrl->val;
+		break;
+	case V4L2_CID_MPEG_VIDEO_MV_H_SEARCH_RANGE:
+		ctx->params.me_search_range_x = ctrl->val;
+		break;
+	case V4L2_CID_MPEG_VIDEO_MV_V_SEARCH_RANGE:
+		ctx->params.me_search_range_y = ctrl->val;
+		break;
+	case V4L2_CID_MPEG_VIDEO_H263_I_FRAME_QP:
+		ctx->params.h263_intra_qp = ctrl->val;
+		break;
+	case V4L2_CID_MPEG_VIDEO_H263_P_FRAME_QP:
+		ctx->params.h263_inter_qp = ctrl->val;
+		break;
+	case V4L2_CID_MPEG_VIDEO_H263_MIN_QP:
+		ctx->params.h263_min_qp = ctrl->val;
+		break;
+	case V4L2_CID_MPEG_VIDEO_H263_MAX_QP:
+		ctx->params.h263_max_qp = ctrl->val;
+		break;
+	case V4L2_CID_MPEG_VIDEO_MPEG4_MIN_QP:
+		ctx->params.mpeg4_min_qp = ctrl->val;
+		break;
+	case V4L2_CID_MPEG_VIDEO_MPEG4_MAX_QP:
+		ctx->params.mpeg4_max_qp = ctrl->val;
+		break;
+	case V4L2_CID_MPEG_VIDEO_INTRA_REFRESH_PERIOD:
+		ctx->params.max_intra_size = ctrl->val;
+		break;
 	default:
 		coda_dbg(1, ctx, "Invalid control, id=%d, val=%d\n",
 			 ctrl->id, ctrl->val);
@@ -2313,12 +2479,17 @@ static const struct v4l2_ctrl_ops coda_ctrl_ops = {
 
 static void coda_encode_ctrls(struct coda_ctx *ctx)
 {
-	int max_gop_size = (ctx->dev->devtype->product == CODA_DX6) ? 60 : 99;
-	u32 def_gamma = (ctx->dev->devtype->product == CODA_960) ?
-			 CODA9_DEFAULT_GAMMA : CODA_DEFAULT_GAMMA;
+	int max_gop_size = (ctx->dev->devtype->product == CODA_DX6) ?
+			 CODADX6_MAX_GOP_SIZE : CODA_MAX_GOP_SIZE;
+	u32 def_gamma = (ctx->dev->devtype->product == CODA_988 ?
+			 CODA988_DEFAULT_GAMMA :
+			 (ctx->dev->devtype->product == CODA_960) ?
+			 CODA9_DEFAULT_GAMMA : CODA_DEFAULT_GAMMA);
+	u32 max_bitrate = (ctx->dev->devtype->product == CODA_988) ?
+			 CODA988_MAX_BITRATE : CODA_MAX_BITRATE;
 
 	v4l2_ctrl_new_std(&ctx->ctrls, &coda_ctrl_ops,
-		V4L2_CID_MPEG_VIDEO_BITRATE, 0, 32767000, 1000, 0);
+		V4L2_CID_MPEG_VIDEO_BITRATE, 0, max_bitrate, 1000, 0);
 	v4l2_ctrl_new_std(&ctx->ctrls, &coda_ctrl_ops,
 			  V4L2_CID_GAMMA, 0, 0x7FFFFFFF, 1, def_gamma);
 	v4l2_ctrl_new_std(&ctx->ctrls, &coda_ctrl_ops,
@@ -2350,10 +2521,20 @@ static void coda_encode_ctrls(struct coda_ctx *ctx)
 		V4L2_CID_MPEG_VIDEO_MB_RC_ENABLE, 0, 1, 1, 1);
 	v4l2_ctrl_new_std(&ctx->ctrls, &coda_ctrl_ops,
 		V4L2_CID_MPEG_VIDEO_H264_CHROMA_QP_INDEX_OFFSET, -12, 12, 1, 0);
-	v4l2_ctrl_new_std_menu(&ctx->ctrls, &coda_ctrl_ops,
-		V4L2_CID_MPEG_VIDEO_H264_PROFILE,
-		V4L2_MPEG_VIDEO_H264_PROFILE_CONSTRAINED_BASELINE, 0x0,
-		V4L2_MPEG_VIDEO_H264_PROFILE_CONSTRAINED_BASELINE);
+	if (ctx->dev->devtype->product == CODA_988) {
+		v4l2_ctrl_new_std_menu(&ctx->ctrls, &coda_ctrl_ops,
+				       V4L2_CID_MPEG_VIDEO_H264_PROFILE,
+				       V4L2_MPEG_VIDEO_H264_PROFILE_HIGH,
+				       ~((1 << V4L2_MPEG_VIDEO_H264_PROFILE_CONSTRAINED_BASELINE) |
+				       (1 << V4L2_MPEG_VIDEO_H264_PROFILE_MAIN) |
+				       (1 << V4L2_MPEG_VIDEO_H264_PROFILE_HIGH)),
+				       V4L2_MPEG_VIDEO_H264_PROFILE_MAIN);
+	} else {
+		v4l2_ctrl_new_std_menu(&ctx->ctrls, &coda_ctrl_ops,
+				       V4L2_CID_MPEG_VIDEO_H264_PROFILE,
+				       V4L2_MPEG_VIDEO_H264_PROFILE_CONSTRAINED_BASELINE, 0x0,
+				       V4L2_MPEG_VIDEO_H264_PROFILE_CONSTRAINED_BASELINE);
+	}
 	if (ctx->dev->devtype->product == CODA_HX4 ||
 	    ctx->dev->devtype->product == CODA_7541) {
 		v4l2_ctrl_new_std_menu(&ctx->ctrls, &coda_ctrl_ops,
@@ -2377,6 +2558,21 @@ static void coda_encode_ctrls(struct coda_ctx *ctx)
 			  (1 << V4L2_MPEG_VIDEO_H264_LEVEL_4_1) |
 			  (1 << V4L2_MPEG_VIDEO_H264_LEVEL_4_2)),
 			V4L2_MPEG_VIDEO_H264_LEVEL_4_0);
+	} else if (ctx->dev->devtype->product == CODA_988) {
+		v4l2_ctrl_new_std_menu(&ctx->ctrls, &coda_ctrl_ops,
+				       V4L2_CID_MPEG_VIDEO_H264_LEVEL,
+				       V4L2_MPEG_VIDEO_H264_LEVEL_5_1,
+				       ~((1 << V4L2_MPEG_VIDEO_H264_LEVEL_1_0) |
+					 (1 << V4L2_MPEG_VIDEO_H264_LEVEL_2_0) |
+					 (1 << V4L2_MPEG_VIDEO_H264_LEVEL_3_0) |
+					 (1 << V4L2_MPEG_VIDEO_H264_LEVEL_3_1) |
+					 (1 << V4L2_MPEG_VIDEO_H264_LEVEL_3_2) |
+					 (1 << V4L2_MPEG_VIDEO_H264_LEVEL_4_0) |
+					 (1 << V4L2_MPEG_VIDEO_H264_LEVEL_4_1) |
+					 (1 << V4L2_MPEG_VIDEO_H264_LEVEL_4_2) |
+					 (1 << V4L2_MPEG_VIDEO_H264_LEVEL_5_0) |
+					 (1 << V4L2_MPEG_VIDEO_H264_LEVEL_5_1)),
+				       V4L2_MPEG_VIDEO_H264_LEVEL_5_0);
 	}
 	v4l2_ctrl_new_std(&ctx->ctrls, &coda_ctrl_ops,
 		V4L2_CID_MPEG_VIDEO_MPEG4_I_FRAME_QP, 1, 31, 1, 15);
@@ -2388,7 +2584,8 @@ static void coda_encode_ctrls(struct coda_ctx *ctx)
 		V4L2_MPEG_VIDEO_MPEG4_PROFILE_SIMPLE);
 	if (ctx->dev->devtype->product == CODA_HX4 ||
 	    ctx->dev->devtype->product == CODA_7541 ||
-	    ctx->dev->devtype->product == CODA_960) {
+	    ctx->dev->devtype->product == CODA_960 ||
+	    ctx->dev->devtype->product == CODA_988) {
 		v4l2_ctrl_new_std_menu(&ctx->ctrls, &coda_ctrl_ops,
 			V4L2_CID_MPEG_VIDEO_MPEG4_LEVEL,
 			V4L2_MPEG_VIDEO_MPEG4_LEVEL_5,
@@ -2412,14 +2609,81 @@ static void coda_encode_ctrls(struct coda_ctx *ctx)
 	v4l2_ctrl_new_std(&ctx->ctrls, &coda_ctrl_ops,
 		V4L2_CID_MPEG_VIDEO_CYCLIC_INTRA_REFRESH_MB, 0,
 		1920 * 1088 / 256, 1, 0);
-	v4l2_ctrl_new_std(&ctx->ctrls, &coda_ctrl_ops,
-		V4L2_CID_MPEG_VIDEO_VBV_DELAY, 0, 0x7fff, 1, 0);
+	if (ctx->dev->devtype->product == CODA_988) {
+		/* 20 to 200(ms) : Low latency coding
+		 * more than 200(ms): Normal delay coding
+		 */
+		v4l2_ctrl_new_std(&ctx->ctrls, &coda_ctrl_ops,
+				  V4L2_CID_MPEG_VIDEO_VBV_DELAY, 20, 0x7fff, 1, 200);
+	} else {
+		v4l2_ctrl_new_std(&ctx->ctrls, &coda_ctrl_ops,
+				  V4L2_CID_MPEG_VIDEO_VBV_DELAY, 0, 0x7fff, 1, 0);
+	}
 	/*
 	 * The maximum VBV size value is 0x7fffffff bits,
 	 * one bit less than 262144 KiB
 	 */
 	v4l2_ctrl_new_std(&ctx->ctrls, &coda_ctrl_ops,
 		V4L2_CID_MPEG_VIDEO_VBV_SIZE, 0, 262144, 1, 0);
+
+	if (ctx->dev->devtype->product == CODA_988) {
+		v4l2_ctrl_new_std_menu(&ctx->ctrls, &coda_ctrl_ops,
+				       V4L2_CID_MPEG_VIDEO_BITRATE_MODE,
+				       V4L2_MPEG_VIDEO_BITRATE_MODE_CBR,
+				       ~((1 << V4L2_MPEG_VIDEO_BITRATE_MODE_VBR) |
+					 (1 << V4L2_MPEG_VIDEO_BITRATE_MODE_CBR)),
+				       V4L2_MPEG_VIDEO_BITRATE_MODE_VBR);
+		v4l2_ctrl_new_std_menu(&ctx->ctrls, &coda_ctrl_ops,
+				       V4L2_CID_MPEG_VIDEO_FRAME_SKIP_MODE,
+				       V4L2_MPEG_VIDEO_FRAME_SKIP_MODE_BUF_LIMIT,
+				       ~((1 << V4L2_MPEG_VIDEO_FRAME_SKIP_MODE_DISABLED) |
+					 (1 << V4L2_MPEG_VIDEO_FRAME_SKIP_MODE_LEVEL_LIMIT) |
+					 (1 << V4L2_MPEG_VIDEO_FRAME_SKIP_MODE_BUF_LIMIT)),
+				       V4L2_MPEG_VIDEO_FRAME_SKIP_MODE_DISABLED);
+		v4l2_ctrl_new_std(&ctx->ctrls, &coda_ctrl_ops,
+				  V4L2_CID_MPEG_VIDEO_H264_I_FRAME_MIN_QP, 0, 51, 1, 20);
+		v4l2_ctrl_new_std(&ctx->ctrls, &coda_ctrl_ops,
+				  V4L2_CID_MPEG_VIDEO_H264_I_FRAME_MAX_QP, 0, 51, 1, 40);
+		v4l2_ctrl_new_std(&ctx->ctrls, &coda_ctrl_ops,
+				  V4L2_CID_MPEG_VIDEO_H264_P_FRAME_MIN_QP, 0, 51, 1, 20);
+		v4l2_ctrl_new_std(&ctx->ctrls, &coda_ctrl_ops,
+				  V4L2_CID_MPEG_VIDEO_H264_P_FRAME_MAX_QP, 0, 51, 1, 40);
+		v4l2_ctrl_new_std_menu(&ctx->ctrls, &coda_ctrl_ops,
+				       V4L2_CID_MPEG_VIDEO_H264_ENTROPY_MODE,
+				       V4L2_MPEG_VIDEO_H264_ENTROPY_MODE_CABAC,
+				       ~((1 << V4L2_MPEG_VIDEO_H264_ENTROPY_MODE_CAVLC) |
+					 (1 << V4L2_MPEG_VIDEO_H264_ENTROPY_MODE_CABAC)),
+				       V4L2_MPEG_VIDEO_H264_ENTROPY_MODE_CAVLC);
+		v4l2_ctrl_new_std(&ctx->ctrls, &coda_ctrl_ops,
+				  V4L2_CID_MPEG_VIDEO_H264_8X8_TRANSFORM,
+				  0, 1, 1, 0);
+		v4l2_ctrl_new_std(&ctx->ctrls, &coda_ctrl_ops,
+				  V4L2_CID_MPEG_VIDEO_H264_I_PERIOD,
+				  0, 2047, 1, 0);
+		v4l2_ctrl_new_std(&ctx->ctrls, &coda_ctrl_ops,
+				  V4L2_CID_MPEG_VIDEO_AU_DELIMITER,
+				  0, 1, 1, 0);
+		v4l2_ctrl_new_std(&ctx->ctrls, &coda_ctrl_ops,
+				  V4L2_CID_MPEG_VIDEO_MV_H_SEARCH_RANGE,
+				  0, 3, 1, 0);
+		v4l2_ctrl_new_std(&ctx->ctrls, &coda_ctrl_ops,
+				  V4L2_CID_MPEG_VIDEO_MV_V_SEARCH_RANGE,
+				  0, 2, 1, 0);
+		v4l2_ctrl_new_std(&ctx->ctrls, &coda_ctrl_ops,
+				  V4L2_CID_MPEG_VIDEO_H263_I_FRAME_QP, 1, 31, 1, 15);
+		v4l2_ctrl_new_std(&ctx->ctrls, &coda_ctrl_ops,
+				  V4L2_CID_MPEG_VIDEO_H263_P_FRAME_QP, 1, 31, 1, 15);
+		v4l2_ctrl_new_std(&ctx->ctrls, &coda_ctrl_ops,
+				  V4L2_CID_MPEG_VIDEO_H263_MIN_QP, 1, 31, 1, 15);
+		v4l2_ctrl_new_std(&ctx->ctrls, &coda_ctrl_ops,
+				  V4L2_CID_MPEG_VIDEO_H263_MAX_QP, 1, 31, 1, 25);
+		v4l2_ctrl_new_std(&ctx->ctrls, &coda_ctrl_ops,
+				  V4L2_CID_MPEG_VIDEO_MPEG4_MIN_QP, 1, 31, 1, 15);
+		v4l2_ctrl_new_std(&ctx->ctrls, &coda_ctrl_ops,
+				  V4L2_CID_MPEG_VIDEO_MPEG4_MAX_QP, 1, 31, 1, 25);
+		v4l2_ctrl_new_std(&ctx->ctrls, &coda_ctrl_ops,
+				  V4L2_CID_MPEG_VIDEO_INTRA_REFRESH_PERIOD, 0, 0xFFFF, 1, 0);
+	}
 }
 
 static void coda_jpeg_encode_ctrls(struct coda_ctx *ctx)
@@ -2434,13 +2698,27 @@ static void coda_decode_ctrls(struct coda_ctx *ctx)
 {
 	u8 max;
 
-	ctx->h264_profile_ctrl = v4l2_ctrl_new_std_menu(&ctx->ctrls,
-		&coda_ctrl_ops, V4L2_CID_MPEG_VIDEO_H264_PROFILE,
-		V4L2_MPEG_VIDEO_H264_PROFILE_HIGH,
-		~((1 << V4L2_MPEG_VIDEO_H264_PROFILE_CONSTRAINED_BASELINE) |
-		  (1 << V4L2_MPEG_VIDEO_H264_PROFILE_MAIN) |
-		  (1 << V4L2_MPEG_VIDEO_H264_PROFILE_HIGH)),
-		V4L2_MPEG_VIDEO_H264_PROFILE_HIGH);
+	if (ctx->dev->devtype->product != CODA_988) {
+		ctx->h264_profile_ctrl =
+		v4l2_ctrl_new_std_menu(&ctx->ctrls,
+				       &coda_ctrl_ops, V4L2_CID_MPEG_VIDEO_H264_PROFILE,
+				       V4L2_MPEG_VIDEO_H264_PROFILE_HIGH,
+				       ~((1 << V4L2_MPEG_VIDEO_H264_PROFILE_CONSTRAINED_BASELINE) |
+					 (1 << V4L2_MPEG_VIDEO_H264_PROFILE_MAIN) |
+					 (1 << V4L2_MPEG_VIDEO_H264_PROFILE_HIGH)),
+				       V4L2_MPEG_VIDEO_H264_PROFILE_HIGH);
+	} else {
+		ctx->h264_profile_ctrl =
+		v4l2_ctrl_new_std_menu(&ctx->ctrls,
+				       &coda_ctrl_ops, V4L2_CID_MPEG_VIDEO_H264_PROFILE,
+				       V4L2_MPEG_VIDEO_H264_PROFILE_HIGH,
+				       ~((1 << V4L2_MPEG_VIDEO_H264_PROFILE_BASELINE) |
+					 (1 << V4L2_MPEG_VIDEO_H264_PROFILE_CONSTRAINED_BASELINE) |
+					 (1 << V4L2_MPEG_VIDEO_H264_PROFILE_MAIN) |
+					 (1 << V4L2_MPEG_VIDEO_H264_PROFILE_HIGH)),
+				       V4L2_MPEG_VIDEO_H264_PROFILE_HIGH);
+	}
+
 	if (ctx->h264_profile_ctrl)
 		ctx->h264_profile_ctrl->flags |= V4L2_CTRL_FLAG_READ_ONLY;
 
@@ -2449,6 +2727,8 @@ static void coda_decode_ctrls(struct coda_ctx *ctx)
 		max = V4L2_MPEG_VIDEO_H264_LEVEL_4_0;
 	else if (ctx->dev->devtype->product == CODA_960)
 		max = V4L2_MPEG_VIDEO_H264_LEVEL_4_1;
+	else if (ctx->dev->devtype->product == CODA_988)
+		max = V4L2_MPEG_VIDEO_H264_LEVEL_5_1;
 	else /* CODA_DX6 */
 		max = V4L2_MPEG_VIDEO_H264_LEVEL_3_0;
 	ctx->h264_level_ctrl = v4l2_ctrl_new_std_menu(&ctx->ctrls,
@@ -2664,6 +2944,7 @@ static int coda_open(struct file *file)
 		if (enable_bwb || ctx->inst_type == CODA_INST_ENCODER)
 			ctx->frame_mem_ctrl = CODA9_FRAME_ENABLE_BWB;
 		fallthrough;
+	case CODA_988:
 	case CODA_HX4:
 	case CODA_7541:
 		ctx->reg_idx = 0;
@@ -2806,6 +3087,16 @@ static int coda_hw_init(struct coda_dev *dev)
 	if (ret)
 		goto err_reset;
 
+	if (dev->devtype->product == CODA_988) {
+		/* Reset at init stage */
+		ret = coda988_hw_init_reset(dev);
+		if (ret)
+			goto err_reset;
+
+		coda_write(dev, 0, CODA_REG_BIT_INT_ENABLE);
+		coda_write(dev, 0, CODA_REG_BIT_CODE_RUN);
+	}
+
 	/*
 	 * Copy the first CODA_ISRAM_SIZE in the internal SRAM.
 	 * The 16-bit chars in the code buffer are in memory access
@@ -2835,7 +3126,8 @@ static int coda_hw_init(struct coda_dev *dev)
 	/* Tell the BIT where to find everything it needs */
 	if (dev->devtype->product == CODA_960 ||
 	    dev->devtype->product == CODA_7541 ||
-	    dev->devtype->product == CODA_HX4) {
+	    dev->devtype->product == CODA_HX4 ||
+	    dev->devtype->product == CODA_988) {
 		coda_write(dev, dev->tempbuf.paddr,
 				CODA_REG_BIT_TEMP_BUF_ADDR);
 		coda_write(dev, 0, CODA_REG_BIT_BIT_STREAM_PARAM);
@@ -2845,7 +3137,8 @@ static int coda_hw_init(struct coda_dev *dev)
 	}
 	coda_write(dev, dev->codebuf.paddr,
 		      CODA_REG_BIT_CODE_BUF_ADDR);
-	coda_write(dev, 0, CODA_REG_BIT_CODE_RUN);
+	if (dev->devtype->product != CODA_988)
+		coda_write(dev, 0, CODA_REG_BIT_CODE_RUN);
 
 	/* Set default values */
 	switch (dev->devtype->product) {
@@ -2860,23 +3153,48 @@ static int coda_hw_init(struct coda_dev *dev)
 	if (dev->devtype->product == CODA_960)
 		coda_write(dev, CODA9_FRAME_ENABLE_BWB,
 				CODA_REG_BIT_FRAME_MEM_CTRL);
+	else if (dev->devtype->product == CODA_988)
+		coda_write(dev, CODA988_FRAME_ENABLE_BWB,
+			   CODA_REG_BIT_FRAME_MEM_CTRL);
 	else
 		coda_write(dev, 0, CODA_REG_BIT_FRAME_MEM_CTRL);
 
 	if (dev->devtype->product != CODA_DX6)
 		coda_write(dev, 0, CODA7_REG_BIT_AXI_SRAM_USE);
 
-	coda_write(dev, CODA_INT_INTERRUPT_ENABLE,
-		      CODA_REG_BIT_INT_ENABLE);
+	if (dev->devtype->product == CODA_988) {
+		coda_write(dev, 0, CODA9_REG_BIT_RESET_CTRL);
+		data = CODA988_INT_BIT_BIT_BUF_FULL |
+			CODA988_INT_BIT_BIT_BUF_EMPTY |
+			CODA988_INT_BIT_DEC_MB_ROWS |
+			CODA988_INT_BIT_DEC_FIELD |
+			CODA988_INT_BIT_PIC_RUN;
+		coda_write(dev, data, CODA_REG_BIT_INT_ENABLE);
+		coda_write(dev, CODA_REG_BIT_INT_CLEAR_SET, CODA_REG_BIT_INT_CLEAR);
+	} else {
+		coda_write(dev, CODA_INT_INTERRUPT_ENABLE,
+			   CODA_REG_BIT_INT_ENABLE);
+	}
 
 	/* Reset VPU and start processor */
-	data = coda_read(dev, CODA_REG_BIT_CODE_RESET);
-	data |= CODA_REG_RESET_ENABLE;
-	coda_write(dev, data, CODA_REG_BIT_CODE_RESET);
-	usleep_range(10, 20);
-	data &= ~CODA_REG_RESET_ENABLE;
-	coda_write(dev, data, CODA_REG_BIT_CODE_RESET);
-	coda_write(dev, CODA_REG_RUN_ENABLE, CODA_REG_BIT_CODE_RUN);
+	if (dev->devtype->product == CODA_988) {
+		coda_write(dev, CODA_REG_BIT_BUSY_FLAG, CODA_REG_BIT_BUSY);
+		coda_write(dev, CODA_REG_RESET_ENABLE, CODA_REG_BIT_CODE_RESET);
+		coda_write(dev, CODA_REG_RUN_ENABLE, CODA_REG_BIT_CODE_RUN);
+		ret = coda_wait_timeout(dev, CODA_REG_BIT_BUSY);
+		if (ret) {
+			dev_err(dev->dev, "Error! Timeout during reset and start BPU\n");
+			goto err_clk_ahb;
+		}
+	} else {
+		data = coda_read(dev, CODA_REG_BIT_CODE_RESET);
+		data |= CODA_REG_RESET_ENABLE;
+		coda_write(dev, data, CODA_REG_BIT_CODE_RESET);
+		usleep_range(10, 20);
+		data &= ~CODA_REG_RESET_ENABLE;
+		coda_write(dev, data, CODA_REG_BIT_CODE_RESET);
+		coda_write(dev, CODA_REG_RUN_ENABLE, CODA_REG_BIT_CODE_RUN);
+	}
 
 	clk_disable_unprepare(dev->clk_ahb);
 	clk_disable_unprepare(dev->clk_per);
diff --git a/drivers/media/platform/chips-media/coda/coda-gdi.c b/drivers/media/platform/chips-media/coda/coda-gdi.c
index 59d65daca153..9f1006f450b6 100644
--- a/drivers/media/platform/chips-media/coda/coda-gdi.c
+++ b/drivers/media/platform/chips-media/coda/coda-gdi.c
@@ -107,6 +107,116 @@ static const u16 rbc2axi_tiled_map[32] = {
 	RBC(RA,  15, ZERO, 0),
 };
 
+#define XY2AXI(inv, zero, tbx, xy, bit) \
+	((inv) << 7 | (zero) << 6 | (tbx) << 5 | (XY2_##xy) | (bit))
+
+#define XY2AXI_ZERO	1
+
+static const u32 xy2axi_zero_map[32] = {
+	XY2AXI(0, XY2AXI_ZERO, 0, X, 0),
+	XY2AXI(0, XY2AXI_ZERO, 0, X, 0),
+	XY2AXI(0, XY2AXI_ZERO, 0, X, 0),
+	XY2AXI(0, XY2AXI_ZERO, 0, X, 0),
+	XY2AXI(0, XY2AXI_ZERO, 0, X, 0),
+	XY2AXI(0, XY2AXI_ZERO, 0, X, 0),
+	XY2AXI(0, XY2AXI_ZERO, 0, X, 0),
+	XY2AXI(0, XY2AXI_ZERO, 0, X, 0),
+	XY2AXI(0, XY2AXI_ZERO, 0, X, 0),
+	XY2AXI(0, XY2AXI_ZERO, 0, X, 0),
+	XY2AXI(0, XY2AXI_ZERO, 0, X, 0),
+	XY2AXI(0, XY2AXI_ZERO, 0, X, 0),
+	XY2AXI(0, XY2AXI_ZERO, 0, X, 0),
+	XY2AXI(0, XY2AXI_ZERO, 0, X, 0),
+	XY2AXI(0, XY2AXI_ZERO, 0, X, 0),
+	XY2AXI(0, XY2AXI_ZERO, 0, X, 0),
+	XY2AXI(0, XY2AXI_ZERO, 0, X, 0),
+	XY2AXI(0, XY2AXI_ZERO, 0, X, 0),
+	XY2AXI(0, XY2AXI_ZERO, 0, X, 0),
+	XY2AXI(0, XY2AXI_ZERO, 0, X, 0),
+	XY2AXI(0, XY2AXI_ZERO, 0, X, 0),
+	XY2AXI(0, XY2AXI_ZERO, 0, X, 0),
+	XY2AXI(0, XY2AXI_ZERO, 0, X, 0),
+	XY2AXI(0, XY2AXI_ZERO, 0, X, 0),
+	XY2AXI(0, XY2AXI_ZERO, 0, X, 0),
+	XY2AXI(0, XY2AXI_ZERO, 0, X, 0),
+	XY2AXI(0, XY2AXI_ZERO, 0, X, 0),
+	XY2AXI(0, XY2AXI_ZERO, 0, X, 0),
+	XY2AXI(0, XY2AXI_ZERO, 0, X, 0),
+	XY2AXI(0, XY2AXI_ZERO, 0, X, 0),
+	XY2AXI(0, XY2AXI_ZERO, 0, X, 0),
+	XY2AXI(0, XY2AXI_ZERO, 0, X, 0),
+};
+
+static const u32 xy2axi_tiled_luma_map[32] = {
+	XY2AXI(0, XY2AXI_ZERO, 0, X, 0),
+	XY2AXI(0, XY2AXI_ZERO, 0, X, 0),
+	XY2AXI(0, XY2AXI_ZERO, 0, X, 0),
+	XY2AXI(0, 0,	       0, Y, 0),
+	XY2AXI(0, 0,	       0, Y, 1),
+	XY2AXI(0, 0,	       0, Y, 2),
+	XY2AXI(0, 0,	       0, Y, 3),
+	XY2AXI(0, 0,	       0, X, 3),
+	XY2AXI(0, XY2AXI_ZERO, 0, X, 0),
+	XY2AXI(0, XY2AXI_ZERO, 0, X, 0),
+	XY2AXI(0, XY2AXI_ZERO, 0, X, 0),
+	XY2AXI(0, XY2AXI_ZERO, 0, X, 0),
+	XY2AXI(0, XY2AXI_ZERO, 0, X, 0),
+	XY2AXI(0, XY2AXI_ZERO, 0, X, 0),
+	XY2AXI(0, XY2AXI_ZERO, 0, X, 0),
+	XY2AXI(0, XY2AXI_ZERO, 0, X, 0),
+	XY2AXI(0, XY2AXI_ZERO, 0, X, 0),
+	XY2AXI(0, XY2AXI_ZERO, 0, X, 0),
+	XY2AXI(0, XY2AXI_ZERO, 0, X, 0),
+	XY2AXI(0, XY2AXI_ZERO, 0, X, 0),
+	XY2AXI(0, XY2AXI_ZERO, 0, X, 0),
+	XY2AXI(0, XY2AXI_ZERO, 0, X, 0),
+	XY2AXI(0, XY2AXI_ZERO, 0, X, 0),
+	XY2AXI(0, XY2AXI_ZERO, 0, X, 0),
+	XY2AXI(0, XY2AXI_ZERO, 0, X, 0),
+	XY2AXI(0, XY2AXI_ZERO, 0, X, 0),
+	XY2AXI(0, XY2AXI_ZERO, 0, X, 0),
+	XY2AXI(0, XY2AXI_ZERO, 0, X, 0),
+	XY2AXI(0, XY2AXI_ZERO, 0, X, 0),
+	XY2AXI(0, XY2AXI_ZERO, 0, X, 0),
+	XY2AXI(0, XY2AXI_ZERO, 0, X, 0),
+	XY2AXI(0, XY2AXI_ZERO, 0, X, 0),
+};
+
+static const u32 xy2axi_tiled_chroma_map[32] = {
+	XY2AXI(0, XY2AXI_ZERO, 0, X, 0),
+	XY2AXI(0, XY2AXI_ZERO, 0, X, 0),
+	XY2AXI(0, XY2AXI_ZERO, 0, X, 0),
+	XY2AXI(0, 0,	       0, Y, 0),
+	XY2AXI(0, 0,	       0, Y, 1),
+	XY2AXI(0, 0,	       0, Y, 2),
+	XY2AXI(0, 0,	       0, X, 3),
+	XY2AXI(0, XY2AXI_ZERO, 0, X, 0),
+	XY2AXI(0, XY2AXI_ZERO, 0, X, 0),
+	XY2AXI(0, XY2AXI_ZERO, 0, X, 0),
+	XY2AXI(0, XY2AXI_ZERO, 0, X, 0),
+	XY2AXI(0, XY2AXI_ZERO, 0, X, 0),
+	XY2AXI(0, XY2AXI_ZERO, 0, X, 0),
+	XY2AXI(0, XY2AXI_ZERO, 0, X, 0),
+	XY2AXI(0, XY2AXI_ZERO, 0, X, 0),
+	XY2AXI(0, XY2AXI_ZERO, 0, X, 0),
+	XY2AXI(0, XY2AXI_ZERO, 0, X, 0),
+	XY2AXI(0, XY2AXI_ZERO, 0, X, 0),
+	XY2AXI(0, XY2AXI_ZERO, 0, X, 0),
+	XY2AXI(0, XY2AXI_ZERO, 0, X, 0),
+	XY2AXI(0, XY2AXI_ZERO, 0, X, 0),
+	XY2AXI(0, XY2AXI_ZERO, 0, X, 0),
+	XY2AXI(0, XY2AXI_ZERO, 0, X, 0),
+	XY2AXI(0, XY2AXI_ZERO, 0, X, 0),
+	XY2AXI(0, XY2AXI_ZERO, 0, X, 0),
+	XY2AXI(0, XY2AXI_ZERO, 0, X, 0),
+	XY2AXI(0, XY2AXI_ZERO, 0, X, 0),
+	XY2AXI(0, XY2AXI_ZERO, 0, X, 0),
+	XY2AXI(0, XY2AXI_ZERO, 0, X, 0),
+	XY2AXI(0, XY2AXI_ZERO, 0, X, 0),
+	XY2AXI(0, XY2AXI_ZERO, 0, X, 0),
+	XY2AXI(0, XY2AXI_ZERO, 0, X, 0),
+};
+
 void coda_set_gdi_regs(struct coda_ctx *ctx)
 {
 	struct coda_dev *dev = ctx->dev;
@@ -144,3 +254,42 @@ void coda_set_gdi_regs(struct coda_ctx *ctx)
 					CODA9_GDI_RBC2_AXI_0 + 4 * i);
 	}
 }
+
+void coda988_set_gdi_regs(struct coda_ctx *ctx)
+{
+	struct coda_dev *dev = ctx->dev;
+	const u32 *xy2axi_lum_map, *xy2axi_chr_map;
+	u32 xy2axiConfig;
+	int i;
+
+	switch (ctx->tiled_map_type) {
+	case GDI_LINEAR_FRAME_MAP:
+	default:
+		xy2axi_lum_map = xy2axi_zero_map;
+		xy2axi_chr_map = xy2axi_zero_map;
+		xy2axiConfig = 0;
+		break;
+	case GDI_TILED_FRAME_MB_RASTER_MAP:
+		/*
+		 * mb_addr = mby*stride + mbx
+		 * mb_addr mapping:
+		 *	luma   : axi_addr[~:8] => axi_addr = {mb_addr[23:0],map_addr[7:0]}
+		 *	chroma : axi_addr[~:7] => axi_addr = {mb_addr[23:0],map_addr[6:0]}
+		 */
+		xy2axi_lum_map = xy2axi_tiled_luma_map;
+		xy2axi_chr_map = xy2axi_tiled_chroma_map;
+		xy2axiConfig = CODA9_XY2RBC_TILED_MAP |
+			       CODA9_XY2RBC_CA_INC_HOR |
+			       (0xF << CODA988_GDI_XY2AXI_GRAN_FRAME_LUM_SHIFT) |
+			       (0x7 << CODA988_GDI_XY2AXI_GRAN_FRAME_CHR_SHIFT);
+		break;
+	}
+
+	for (i = 0; i < 32; i++)
+		coda_write(dev, xy2axi_lum_map[i], CODA988_GDI_XY2AXI_LUM_BIT00 + 4 * i);
+
+	for (i = 0; i < 32; i++)
+		coda_write(dev, xy2axi_chr_map[i], CODA988_GDI_XY2AXI_CHR_BIT00 + 4 * i);
+
+	coda_write(dev, xy2axiConfig, CODA988_GDI_XY2AXI_CONFIG);
+}
diff --git a/drivers/media/platform/chips-media/coda/coda-h264.c b/drivers/media/platform/chips-media/coda/coda-h264.c
index 8bd0aa8af114..b4cb14721da0 100644
--- a/drivers/media/platform/chips-media/coda/coda-h264.c
+++ b/drivers/media/platform/chips-media/coda/coda-h264.c
@@ -89,6 +89,16 @@ int coda_h264_profile(int profile_idc)
 	}
 }
 
+int coda_h264enc_profile_id(int profile_idc)
+{
+	switch (profile_idc) {
+	case 66: return 0;
+	case 77: return 1;
+	case 100: return 2;
+	default: return 2;
+	}
+}
+
 int coda_h264_level(int level_idc)
 {
 	switch (level_idc) {
diff --git a/drivers/media/platform/chips-media/coda/coda.h b/drivers/media/platform/chips-media/coda/coda.h
index 007f56b24c61..9684b7069825 100644
--- a/drivers/media/platform/chips-media/coda/coda.h
+++ b/drivers/media/platform/chips-media/coda/coda.h
@@ -27,10 +27,18 @@
 #include "coda_regs.h"
 
 #define CODA_MAX_FRAMEBUFFERS	19
+#define CODA988_MIN_FRAMEBUFFERS	8
 #define FMO_SLICE_SAVE_BUF_SIZE	(32)
 
 #define CODA_DEFAULT_GAMMA	4096
 #define CODA9_DEFAULT_GAMMA	24576	/* 0.75 * 32768 */
+#define CODA988_DEFAULT_GAMMA	0 /* uses value defined in FW */
+
+#define CODADX6_MAX_GOP_SIZE	60
+#define CODA_MAX_GOP_SIZE	99
+
+#define CODA_MAX_BITRATE	32767000
+#define CODA988_MAX_BITRATE	262143000
 
 /*
  * This control allows applications to read the per-stream
@@ -54,6 +62,7 @@ enum coda_product {
 	CODA_HX4 = 0xf00a,
 	CODA_7541 = 0xf012,
 	CODA_960 = 0xf020,
+	CODA_988 = 0xcc28,
 };
 
 struct coda_video_device;
@@ -133,6 +142,8 @@ struct coda_params {
 	u8			mpeg2_level_idc;
 	u8			mpeg4_intra_qp;
 	u8			mpeg4_inter_qp;
+	u8			h263_intra_qp;
+	u8			h263_inter_qp;
 	u8			gop_size;
 	int			intra_refresh;
 	enum v4l2_jpeg_chroma_subsampling jpeg_chroma_subsampling;
@@ -148,7 +159,7 @@ struct coda_params {
 	int			codec_mode_aux;
 	enum v4l2_mpeg_video_multi_slice_mode slice_mode;
 	u32			framerate;
-	u16			bitrate;
+	u32			bitrate;
 	u16			vbv_delay;
 	u32			vbv_size;
 	u32			slice_max_bits;
@@ -163,6 +174,25 @@ struct coda_params {
 	bool			slice_mode_changed;
 	bool			frame_rc_enable;
 	bool			mb_rc_enable;
+	bool			entropy_mode_changed;
+	u8			bitrate_mode;
+	u32			frame_skip_mode;
+	u8			h264_min_i_qp;
+	u8			h264_max_i_qp;
+	u8			h264_min_p_qp;
+	u8			h264_max_p_qp;
+	u8			h264_entropy_mode;
+	u8			h264_en_8x8_transform;
+	int			h264_i_frame_period;
+	bool			encode_aud_en;
+	u8			me_search_range_x;
+	u8			me_search_range_y;
+	u8			h263_min_qp;
+	u8			h263_max_qp;
+	u8			mpeg4_min_qp;
+	u8			mpeg4_max_qp;
+	u32			max_intra_size;
+	u8          vp8_fill_ivf_header;
 };
 
 struct coda_buffer_meta {
@@ -269,6 +299,7 @@ struct coda_ctx {
 	struct coda_aux_buf		parabuf;
 	struct coda_aux_buf		psbuf;
 	struct coda_aux_buf		slicebuf;
+	struct coda_aux_buf     vp8mbbuf;
 	struct coda_internal_frame	internal_frames[CODA_MAX_FRAMEBUFFERS];
 	struct list_head		buffer_meta_list;
 	spinlock_t			buffer_meta_lock;
@@ -325,6 +356,7 @@ int coda_hw_reset(struct coda_ctx *ctx);
 void coda_fill_bitstream(struct coda_ctx *ctx, struct list_head *buffer_list);
 
 void coda_set_gdi_regs(struct coda_ctx *ctx);
+void coda988_set_gdi_regs(struct coda_ctx *ctx);
 
 static inline struct coda_q_data *get_q_data(struct coda_ctx *ctx,
 					     enum v4l2_buf_type type)
@@ -369,6 +401,7 @@ void coda_m2m_buf_done(struct coda_ctx *ctx, struct vb2_v4l2_buffer *buf,
 int coda_h264_filler_nal(int size, char *p);
 int coda_h264_padding(int size, char *p);
 int coda_h264_profile(int profile_idc);
+int coda_h264enc_profile_id(int profile_idc);
 int coda_h264_level(int level_idc);
 int coda_sps_parse_profile(struct coda_ctx *ctx, struct vb2_buffer *vb);
 int coda_h264_sps_fixup(struct coda_ctx *ctx, int width, int height, char *buf,
@@ -395,6 +428,7 @@ bool coda_jpeg_check_buffer(struct coda_ctx *ctx, struct vb2_buffer *vb);
 int coda_jpeg_decode_header(struct coda_ctx *ctx, struct vb2_buffer *vb);
 int coda_jpeg_write_tables(struct coda_ctx *ctx);
 void coda_set_jpeg_compression_quality(struct coda_ctx *ctx, int quality);
+int coda988_hw_init_reset(struct coda_dev *dev);
 
 extern const struct coda_context_ops coda_bit_encode_ops;
 extern const struct coda_context_ops coda_bit_decode_ops;
@@ -404,4 +438,5 @@ extern const struct coda_context_ops coda9_jpeg_decode_ops;
 irqreturn_t coda_irq_handler(int irq, void *data);
 irqreturn_t coda9_jpeg_irq_handler(int irq, void *data);
 
+int coda_wait_timeout(struct coda_dev *dev, uint32_t reg_busy);
 #endif /* __CODA_H__ */
diff --git a/drivers/media/platform/chips-media/coda/coda_regs.h b/drivers/media/platform/chips-media/coda/coda_regs.h
index db81a904cf3f..eb74c25b6d92 100644
--- a/drivers/media/platform/chips-media/coda/coda_regs.h
+++ b/drivers/media/platform/chips-media/coda/coda_regs.h
@@ -10,6 +10,8 @@
 #ifndef _REGS_CODA_H_
 #define _REGS_CODA_H_
 
+#include <linux/bitfield.h>
+
 /* HW registers */
 #define CODA_REG_BIT_CODE_RUN			0x000
 #define		CODA_REG_RUN_ENABLE		(1 << 0)
@@ -41,6 +43,8 @@
 #define		CODADX6_STREAM_BUF_PIC_RESET	(1 << 3)
 #define		CODA7_STREAM_BUF_PIC_FLUSH	(1 << 3)
 #define		CODADX6_STREAM_BUF_PIC_FLUSH	(1 << 2)
+#define		CODA9_STREAM_BUF_LINEBUF_EN	BIT(6)
+#define		CODA9_STREAM_BUF_RUNGBUF_EN	BIT(5)
 #define		CODA7_STREAM_BUF_DYNALLOC_EN	(1 << 5)
 #define		CODADX6_STREAM_BUF_DYNALLOC_EN	(1 << 4)
 #define		CODADX6_STREAM_CHKDIS_OFFSET	(1 << 1)
@@ -48,8 +52,26 @@
 #define		CODA_STREAM_ENDIAN_SELECT	(1 << 0)
 #define CODA_REG_BIT_FRAME_MEM_CTRL		0x110
 #define		CODA9_FRAME_ENABLE_BWB		(1 << 12)
+#define		CODA988_FRAME_ENABLE_BWB	BIT(15)
 #define		CODA9_FRAME_TILED2LINEAR	(1 << 11)
+#define		CODA988_FRAME_TILED2LINEAR_MASK	GENMASK(14, 13)
+#define		CODA988_FRAME_TILED2LINEAR_FRAME_MAP	BIT(13)
+#define		CODA988_FRAME_TILED2LINEAR_FIELD_MAP	BIT(14)
+#define		CODA988_FRAME_TILED_MAP_MASK		GENMASK(12, 9)
+#define		CODA988_FRAME_TILED_MAP_LINEAR_FRAME	(0 << 9)
+#define		CODA988_FRAME_TILED_MAP_TILED_FRAME_V	BIT(9)
+#define		CODA988_FRAME_TILED_MAP_TILED_FRAME_H	(2 << 9)
+#define		CODA988_FRAME_TILED_MAP_TILED_FIELD_V	(3 << 9)
+#define		CODA988_FRAME_TILED_MAP_TILED_MIXED_V	(4 << 9)
+#define		CODA988_FRAME_TILED_MAP_TILED_FRAME_MB_RAST	(5 << 9)
+#define		CODA988_FRAME_TILED_MAP_TILED_FIELD_MB_RAST	(6 << 9)
+#define		CODA988_FRAME_TILED_MAP_TILED_FRAME_NO_BANK	(7 << 9)
+#define		CODA988_FRAME_TILED_MAP_TILED_FIELD_NO_BANK	(8 << 9)
+#define		CODA988_FRAME_TILED_MAP_LINEAR_FIELD	(9 << 9)
+#define		CODA988_FRAME_MONOCHROME_YUV400_SELECT	BIT(6)
+#define		CODA988_FRAME_CHROMA_NV21_SWAP	BIT(3)
 #define		CODA_FRAME_CHROMA_INTERLEAVE	(1 << 2)
+#define		CODA988_IMAGE_64BIT_BIGENDIAN_SELECT	BIT(1)
 #define		CODA_IMAGE_ENDIAN_SELECT	(1 << 0)
 #define CODA_REG_BIT_BIT_STREAM_PARAM		0x114
 #define		CODA_BIT_STREAM_END_FLAG	(1 << 2)
@@ -57,6 +79,7 @@
 #define CODA_REG_BIT_TEMP_BUF_ADDR		0x118
 #define CODA_REG_BIT_RD_PTR(x)			(0x120 + 8 * (x))
 #define CODA_REG_BIT_WR_PTR(x)			(0x124 + 8 * (x))
+#define CODA9_REG_BIT_RESET_CTRL		0x128
 #define CODA_REG_BIT_FRM_DIS_FLG(x)		(0x150 + 4 * (x))
 #define CODADX6_REG_BIT_SEARCH_RAM_BASE_ADDR	0x140
 #define CODA7_REG_BIT_AXI_SRAM_USE		0x140
@@ -124,6 +147,12 @@
 #define		CODA_MODE_INVALID		0xffff
 #define CODA_REG_BIT_INT_ENABLE		0x170
 #define		CODA_INT_INTERRUPT_ENABLE	(1 << 3)
+#define		CODA988_INT_BIT_SEQ_INIT	BIT(1)
+#define		CODA988_INT_BIT_PIC_RUN		BIT(3)
+#define		CODA988_INT_BIT_DEC_FIELD	BIT(10)
+#define		CODA988_INT_BIT_DEC_MB_ROWS	BIT(13)
+#define		CODA988_INT_BIT_BIT_BUF_EMPTY	BIT(14)
+#define		CODA988_INT_BIT_BIT_BUF_FULL	BIT(15)
 #define CODA_REG_BIT_INT_REASON			0x174
 #define CODA7_REG_BIT_RUN_AUX_STD		0x178
 #define		CODA_MP4_AUX_MPEG4		0
@@ -152,14 +181,17 @@
 #define CODA_CMD_DEC_SEQ_SRC_SIZE		0x18c
 #define CODA_CMD_DEC_SEQ_START_BYTE		0x190
 #define CODA_CMD_DEC_SEQ_PS_BB_START		0x194
+#define CODA988_CMD_DEC_SEQ_USER_DATA_OPTION	0x194
 #define CODA_CMD_DEC_SEQ_PS_BB_SIZE		0x198
 #define CODA_CMD_DEC_SEQ_JPG_THUMB_EN		0x19c
 #define CODA_CMD_DEC_SEQ_MP4_ASP_CLASS		0x19c
 #define		CODA_MP4_CLASS_MPEG4			0
 #define CODA_CMD_DEC_SEQ_X264_MV_EN		0x19c
 #define CODA_CMD_DEC_SEQ_SPP_CHUNK_SIZE		0x1a0
+#define CODA988_CMD_DEC_SEQ_USER_DATA_BASE_ADDR	0x1ac
 
 #define CODA7_RET_DEC_SEQ_ASPECT		0x1b0
+#define CODA988_CMD_DEC_SEQ_USER_DATA_BUF_SIZE	0x1b0
 #define CODA9_RET_DEC_SEQ_BITRATE		0x1b4
 #define CODA_RET_DEC_SEQ_SUCCESS		0x1c0
 #define CODA_RET_DEC_SEQ_SRC_FMT		0x1c4 /* SRC_SIZE on CODA7 */
@@ -189,6 +221,9 @@
 #define CODA9_CMD_DEC_PIC_ROT_ADDR_CB		0x18c
 #define CODA_CMD_DEC_PIC_ROT_STRIDE		0x190
 #define CODA9_CMD_DEC_PIC_ROT_ADDR_CR		0x190
+#define CODA988_CMD_DEC_PIC_ROT_BOTTOM_Y	0x1E8
+#define CODA988_CMD_DEC_PIC_ROT_BOTTOM_CB	0x1EC
+#define CODA988_CMD_DEC_PIC_ROT_BOTTOM_CR	0x1F0
 #define CODA9_CMD_DEC_PIC_ROT_STRIDE		0x1b8
 
 #define CODA_CMD_DEC_PIC_OPTION			0x194
@@ -197,10 +232,14 @@
 #define		CODA_PRE_SCAN_MODE_RETURN		(1 << 1)
 #define		CODA_IFRAME_SEARCH_EN			(1 << 2)
 #define		CODA_SKIP_FRAME_MODE			(0x3 << 3)
+#define		CODA988_UDATA_REPORT_INT_DISABLE	BIT(10)
 #define CODA_CMD_DEC_PIC_SKIP_NUM		0x198
 #define CODA_CMD_DEC_PIC_CHUNK_SIZE		0x19c
 #define CODA_CMD_DEC_PIC_BB_START		0x1a0
 #define CODA_CMD_DEC_PIC_START_BYTE		0x1a4
+#define CODA988_CMD_DEC_PIC_USER_DATA_BASE_ADDR	0x1ac
+#define CODA988_CMD_DEC_PIC_USER_DATA_BUF_SIZE	0x1b0
+#define CODA988_CMD_DEC_PIC_NUM_ROWS		0x1b4
 #define CODA_RET_DEC_PIC_SIZE			0x1bc
 #define CODA_RET_DEC_PIC_FRAME_NUM		0x1c0
 #define CODA_RET_DEC_PIC_FRAME_IDX		0x1c4
@@ -227,6 +266,9 @@
 #define CODA9_RET_DEC_PIC_FRATE_NR		0x1f4
 #define CODA9_RET_DEC_PIC_FRATE_DR		0x1f8
 
+/* Decoder Set Fram Buffer */
+#define CODA988_RET_SET_FRAME_SUCCESS		0x1c0
+
 /* Encoder Sequence Initialization */
 #define CODA_CMD_ENC_SEQ_BB_START				0x180
 #define CODA_CMD_ENC_SEQ_BB_SIZE				0x184
@@ -252,6 +294,7 @@
 #define		CODA_STD_H263					1
 #define		CODA_STD_H264					2
 #define		CODA9_STD_MPEG4					3
+#define		CODA9_STD_H263					11
 
 #define CODA_CMD_ENC_SEQ_SRC_SIZE				0x190
 #define		CODA7_PICWIDTH_OFFSET				16
@@ -298,6 +341,8 @@
 #define		CODA_SLICING_SIZE_MASK				0x3fffffff
 #define		CODA_SLICING_UNIT_OFFSET			1
 #define		CODA_SLICING_UNIT_MASK				0x01
+#define		CODA988_SLICING_UNIT_OFFSET			0
+#define		CODA988_SLICING_UNIT_MASK				0x03
 #define		CODA_SLICING_MODE_OFFSET			0
 #define		CODA_SLICING_MODE_MASK				0x01
 #define CODA_CMD_ENC_SEQ_GOP_SIZE				0x1a8
@@ -306,9 +351,12 @@
 #define CODA_CMD_ENC_SEQ_RC_PARA				0x1ac
 #define		CODA_RATECONTROL_AUTOSKIP_OFFSET		31
 #define		CODA_RATECONTROL_AUTOSKIP_MASK			0x01
+#define		CODA_RATECONTROL_AUTOSKIP_DISABLE(x)	(((x) & 0x1) << 31)
 #define		CODA_RATECONTROL_INITIALDELAY_OFFSET		16
 #define		CODA_RATECONTROL_INITIALDELAY_MASK		0x7fff
+#define		CODA_RATECONTROL_INITIALDELAY(x)		(((x) & 0x7fff) << 16)
 #define		CODA_RATECONTROL_BITRATE_OFFSET		1
+#define		CODA9_RATECONTROL_BITRATE_OFFSET		4
 #define		CODA_RATECONTROL_BITRATE_MASK			0x7fff
 #define		CODA_RATECONTROL_ENABLE_OFFSET			0
 #define		CODA_RATECONTROL_ENABLE_MASK			0x01
@@ -323,17 +371,35 @@
 #define CODA7_CMD_ENC_SEQ_SEARCH_BASE				0x1b8
 #define CODA7_CMD_ENC_SEQ_SEARCH_SIZE				0x1bc
 #define CODA7_CMD_ENC_SEQ_INTRA_QP				0x1c4
+#define CODA9_CMD_ENC_SEQ_INTRA_QP				0x1c4
 #define CODA_CMD_ENC_SEQ_RC_QP_MIN_MAX				0x1c8
 #define		CODA_QPMIN_OFFSET				8
 #define		CODA_QPMIN_MASK					0x3f
 #define		CODA_QPMAX_OFFSET				0
 #define		CODA_QPMAX_MASK					0x3f
+#define CODA988_CMD_ENC_SEQ_RC_QP_MAX			0x1c8
 #define CODA_CMD_ENC_SEQ_RC_GAMMA				0x1cc
 #define		CODA_GAMMA_OFFSET				0
 #define		CODA_GAMMA_MASK					0xffff
 #define CODA_CMD_ENC_SEQ_RC_INTERVAL_MODE			0x1d0
 #define CODA9_CMD_ENC_SEQ_INTRA_WEIGHT				0x1d4
 #define CODA9_CMD_ENC_SEQ_ME_OPTION				0x1d8
+#define		CODA9_CMD_ENC_SEQ_ME_SEARCH_RANGE_X(x)		(((x) & 0x3) << 0)
+#define		CODA9_CMD_ENC_SEQ_ME_SEARCH_RANGE_Y(x)		(((x) & 0x3) << 2)
+#define		CODA9_CMD_ENC_SEQ_ME_USE_ZERO_PMV(x)		(((x) & 0x1) << 4)
+#define		CODA9_CMD_ENC_SEQ_ME_BLK_MODE_EN(x)		(((x) & 0xF) << 5)
+#define		CODA9_CMD_ENC_SEQ_ME_LINE_BUF_MODE(x)		(((x) & 0x7) << 9)
+#define CODA988_CMD_ENC_SEQ_RC_PARA2					0x1DC
+#define		CODA988_CMD_RC_PARA2_RC_TYPE(x)		(((x) & 0xF) << 0)
+#define		CODA988_CMD_RC_PARA2_BITRATE(x)		(((x) & 0x3FFFF) << 4)
+#define		CODA988_RC_MODE_OFF			0
+#define		CODA988_RC_MODE_CBR			1
+#define		CODA988_RC_MODE_ABR			2
+#define		CODA988_RC_MODE_VENDOR		4
+#define CODA988_CMD_ENC_SEQ_QP_RANGE_SET				0x1E0
+#define CODA988_CMD_ENC_SEQ_RC_MAX_INTRA_SIZE			0x1F0
+#define CODA988_CMD_ENC_SEQ_DELTA_QP					0x1F4
+
 #define CODA_RET_ENC_SEQ_SUCCESS				0x1c0
 
 #define CODA_CMD_ENC_SEQ_JPG_PARA				0x198
@@ -351,6 +417,9 @@
 #define		CODA_PARAM_CHANGE_INTRA_MB_NUM			BIT(4)
 #define		CODA_PARAM_CHANGE_SLICE_MODE			BIT(5)
 #define		CODA_PARAM_CHANGE_HEC_MODE			BIT(6)
+#define		CODA988_ENC_CHANGE_PARAM_CABAC_MODE		BIT(7)
+#define		CODA988_ENC_CHANGE_PARAM_PPS_ID			BIT(11)
+#define		CODA988_ENC_CHANGE_PARAM_PIC_PARAM		BIT(14)
 #define CODA_CMD_ENC_PARAM_RC_GOP		0x184
 #define CODA_CMD_ENC_PARAM_RC_INTRA_QP		0x188
 #define CODA_CMD_ENC_PARAM_RC_BITRATE		0x18c
@@ -358,6 +427,9 @@
 #define CODA_CMD_ENC_PARAM_INTRA_MB_NUM		0x194
 #define CODA_CMD_ENC_PARAM_SLICE_MODE		0x198
 #define CODA_CMD_ENC_PARAM_HEC_MODE		0x19c
+#define CODA988_CMD_ENC_PARAM_CHANGE_CABAC_MODE     0x1a0
+#define CODA988_CMD_ENC_PARAM_CHANGE_PPS_ID         0x1b4
+#define CODA988_CMD_ENC_PARAM_CHANGE_MIN_MAX_QP     0x1bC
 #define CODA_RET_ENC_PARAM_CHANGE_SUCCESS	0x1c0
 
 /* Encoder Picture Run */
@@ -370,6 +442,14 @@
 #define CODA_CMD_ENC_PIC_SRC_ADDR_Y	0x180
 #define CODA_CMD_ENC_PIC_SRC_ADDR_CB	0x184
 #define CODA_CMD_ENC_PIC_SRC_ADDR_CR	0x188
+#define CODA988_CMD_ENC_PIC_TARGET_BIT		0x1C0
+#define CODA988_CMD_ENC_PIC_QP				0x1C8
+#define CODA988_CMD_ENC_PIC_RC_BUF_SIZE		0x1CC
+#define CODA988_CMD_ENC_PIC_RC_BUF_LEVEL	0x1C8
+#define CODA988_CMD_ENC_PIC_RC_QP			0x1D4
+#define CODA988_CMD_ENC_PIC_SRC_BOTTOM_Y	0x1E8
+#define CODA988_CMD_ENC_PIC_SRC_BOTTOM_CB	0x1EC
+#define CODA988_CMD_ENC_PIC_SRC_BOTTOM_CR	0x1F0
 #define CODA_CMD_ENC_PIC_QS		0x18c
 #define CODA_CMD_ENC_PIC_ROT_MODE	0x190
 #define		CODA_ROT_MIR_ENABLE				(1 << 4)
@@ -381,6 +461,17 @@
 #define		CODA_MIR_VER					(0x1 << 2)
 #define		CODA_MIR_HOR					(0x2 << 2)
 #define		CODA_MIR_VER_HOR				(0x3 << 2)
+#define		CODA988_LONG_BURST_MODE				BIT(4)
+#define		CODA988_DMA_MODE_1MB \
+					FIELD_PREP(GENMASK(6, 5), 0)
+#define		CODA988_DMA_MODE_2MB \
+					FIELD_PREP(GENMASK(6, 5), 1)
+#define		CODA988_DMA_MODE_8MB \
+					FIELD_PREP(GENMASK(6, 5), 2)
+#define		CODA988_SEL_BIG_ENDIAN				BIT(16)
+#define		CODA988_SEL_32BIT				BIT(17)
+#define		CODA988_CBCR_INTERLIVE				BIT(18)
+#define		CODA988_SELECT_NV21				BIT(21)
 #define CODA_CMD_ENC_PIC_OPTION		0x194
 #define		CODA_FORCE_IPICTURE				BIT(1)
 #define		CODA_REPORT_MB_INFO				BIT(3)
@@ -388,12 +479,17 @@
 #define		CODA_REPORT_SLICE_INFO				BIT(5)
 #define CODA_CMD_ENC_PIC_BB_START	0x198
 #define CODA_CMD_ENC_PIC_BB_SIZE	0x19c
+#define CODA988_RET_ENC_PIC_RC		0x188
+#define CODA988_RET_ENC_PIC_USED_BIT	0x18c
 #define CODA_RET_ENC_FRAME_NUM		0x1c0
 #define CODA_RET_ENC_PIC_TYPE		0x1c4
 #define CODA_RET_ENC_PIC_FRAME_IDX	0x1c8
 #define CODA_RET_ENC_PIC_SLICE_NUM	0x1cc
 #define CODA_RET_ENC_PIC_FLAG		0x1d0
 #define CODA_RET_ENC_PIC_SUCCESS	0x1d8
+#define CODA988_RET_ENC_PIC_SKIPPED_MB_NUM	0x1dc
+#define CODA988_RET_ENC_PIC_INTRA_MB_NUM	0x1e0
+#define CODA988_RET_ENC_PIC_SUM_QP			0x1e4
 
 /* Set Frame Buffer */
 #define CODA_CMD_SET_FRAME_BUF_NUM		0x180
@@ -418,7 +514,31 @@
 #define		CODA9_CACHE_LUMA_BUFFER_SIZE_OFFSET	16
 #define		CODA9_CACHE_CB_BUFFER_SIZE_OFFSET	8
 #define		CODA9_CACHE_CR_BUFFER_SIZE_OFFSET	0
+#define		CODA988_CACHE_BYPASS_MC_ENABLE		BIT(0)
+#define		CODA988_CACHE_MAP_TYPE_LINEAR		(0 << 2)
+#define		CODA988_CACHE_MAP_TYPE_TILED		BIT(2)
+#define		CODA988_CACHE_BURST_MODE_4		(0 << 3)
+#define		CODA988_CACHE_BURST_MODE_8		BIT(3)
+#define		CODA988_CACHE_CHROMA_INTERLEAVED_SZ_32_64 \
+					FIELD_PREP(GENMASK(6, 5), 1)
+#define		CODA988_CACHE_CHROMA_INTERLEAVED_SZ_64_32 \
+					FIELD_PREP(GENMASK(6, 5), 2)
+#define		CODA988_CACHE_CHROMA_INTERLEAVED_SZ_128_16 \
+					FIELD_PREP(GENMASK(6, 5), 3)
+#define		CODA988_CACHE_CHROMA_SEPARATED_SZ_64_32 \
+					FIELD_PREP(GENMASK(6, 5), 1)
+#define		CODA988_CACHE_CHROMA_SEPARATED_SZ_64_16	\
+					FIELD_PREP(GENMASK(6, 5), 3)
+#define		CODA988_CACHE_LUMA_SZ_64_64			BIT(7)
+#define		CODA988_CACHE_LUMA_SZ_128_32		(3 << 7)
+#define		CODA988_CACHE_LINE_HORZ_PROC_NO_MERGE \
+					FIELD_PREP(GENMASK(10, 9), 0)
+#define		CODA988_CACHE_LINE_VERT_PROC_NO_MERGE \
+					FIELD_PREP(GENMASK(10, 9), 1)
+#define		CODA988_CACHE_LINE_VERT_PROC_MERGE \
+					FIELD_PREP(GENMASK(10, 9), 3)
 #define CODA9_CMD_SET_FRAME_SUBSAMP_A_MVC	0x1b0
+#define CODA9_CMD_SET_FRAME_MB_BUF_BASE     0x1b0
 #define CODA9_CMD_SET_FRAME_SUBSAMP_B_MVC	0x1b4
 #define CODA9_CMD_SET_FRAME_DP_BUF_BASE		0x1b0
 #define CODA9_CMD_SET_FRAME_DP_BUF_SIZE		0x1b4
@@ -430,14 +550,28 @@
 #define		CODA_GAMMA_OFFSET	0
 #define		CODA_HEADER_H264_SPS	0
 #define		CODA_HEADER_H264_PPS	1
+#define		CODA_HEADER_H264_SPS_MVC	2 //Subset SPS rbsp for 2nd view
+#define		CODA_HEADER_H264_PPS_MVC	3 //PPS rbsp for 2nd view
 #define		CODA_HEADER_MP4V_VOL	0
 #define		CODA_HEADER_MP4V_VOS	1
 #define		CODA_HEADER_MP4V_VIS	2
 #define		CODA9_HEADER_FRAME_CROP	(1 << 3)
+#define		CODA988_HEADER_FRAME_CROP	BIT(2)
+#define		CODA988_HEADER_USER_LEVEL_ENABLE		BIT(4)
+#define		CODA988_HEADER_USER_LEVEL(x)	(((x) & 0xff) << 8)
 #define CODA_CMD_ENC_HEADER_BB_START	0x184
 #define CODA_CMD_ENC_HEADER_BB_SIZE	0x188
 #define CODA9_CMD_ENC_HEADER_FRAME_CROP_H	0x18c
 #define CODA9_CMD_ENC_HEADER_FRAME_CROP_V	0x190
+#define CODA988_CMD_ENC_HEADER_CABAC_MODE           0x194
+#define CODA988_CMD_ENC_HEADER_CABAC_INIT_IDC       0x198
+#define CODA988_CMD_ENC_HEADER_TRANSFORM_8X8        0x19C
+#define CODA988_CMD_ENC_HEADER_CHROMA_FORMAT        0x1A0
+#define CODA988_CMD_ENC_HEADER_FIELD_FLAG           0x1A4
+#define CODA988_CMD_ENC_HEADER_PROFILE              0x1A8
+#define CODA988_CMD_ENC_HEADER_SVC_SEI_INFO1        0x1B4
+#define CODA988_CMD_ENC_HEADER_SVC_SEI_INFO2        0x1B8
+#define CODA988_CMD_ENC_HEADER_FRAME                0x1BC
 
 /* Get Version */
 #define CODA_CMD_FIRMWARE_VERNUM		0x1c0
@@ -450,9 +584,23 @@
 			((minor) << 8) | (release))
 #define CODA9_CMD_FIRMWARE_CODE_REV		0x1c4
 
+#define CODA9_MBC_BASE				0x400
+/*
+ * This register controlled by internal DSP(bpu processor) in order to
+ * activate the pipeline of internal hw sub blocks.
+ */
+#define CODA9_MBC_SET_SUBBLK_EN			(CODA9_MBC_BASE + 0x0A0)
+/*
+ * MBC_SET_SUBBLK_EN[19:0]: enable bit for each subblock HW for encoder/decoder.
+ * MBC_SET_SUBBLK_EN[20]: control mode bit : 0 - auto, 1 - manual by host directly.
+ */
+#define		CODA9_MBC_SET_SUBBLK_EN_MASK		GENMASK(20, 0)
+#define		CODA9_MBC_SET_SUBBLK_EN_MANUAL		BIT(20)
+
 #define CODA9_GDMA_BASE				0x1000
 #define CODA9_GDI_CONTROL			(CODA9_GDMA_BASE + 0x034)
 #define CODA9_GDI_PIC_INIT_HOST			(CODA9_GDMA_BASE + 0x038)
+#define CODA9_GDI_BWB_STATUS			(CODA9_GDMA_BASE + 0x07c)
 #define CODA9_GDI_STATUS			(CODA9_GDMA_BASE + 0x080)
 #define CODA9_GDI_WPROT_ERR_CLR			(CODA9_GDMA_BASE + 0x0a0)
 #define CODA9_GDI_WPROT_RGN_EN			(CODA9_GDMA_BASE + 0x0ac)
@@ -486,6 +634,15 @@
 #define CODA9_GDI_RBC2_AXI_1F			(CODA9_GDMA_BASE + 0x91c)
 #define	CODA9_GDI_TILEDBUF_BASE			(CODA9_GDMA_BASE + 0x920)
 
+/* GDI 2.0 registers */
+#define CODA988_GDI_XY2AXI_LUM_BIT00		(CODA9_GDMA_BASE + 0x800)
+#define CODA988_GDI_XY2AXI_CHR_BIT00		(CODA9_GDMA_BASE + 0x880)
+#define CODA988_GDI_XY2AXI_CONFIG		(CODA9_GDMA_BASE + 0x900)
+#define		CODA988_GDI_XY2AXI_GRAN_FRAME_LUM_SHIFT		12
+#define		CODA988_GDI_XY2AXI_GRAN_FIELD_LUM_SHIFT		8
+#define		CODA988_GDI_XY2AXI_GRAN_FRAME_CHR_SHIFT		4
+#define		CODA988_GDI_XY2AXI_GRAN_FIELD_CHR_SHIFT		0
+
 #define CODA9_JPEG_BASE				0x3000
 #define CODA9_REG_JPEG_PIC_START		(CODA9_JPEG_BASE + 0x000)
 #define CODA9_REG_JPEG_PIC_STATUS		(CODA9_JPEG_BASE + 0x004)
-- 
2.30.2


