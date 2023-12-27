Return-Path: <linux-media+bounces-3034-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B83B581F103
	for <lists+linux-media@lfdr.de>; Wed, 27 Dec 2023 18:40:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 61A111F22315
	for <lists+linux-media@lfdr.de>; Wed, 27 Dec 2023 17:40:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D21834644F;
	Wed, 27 Dec 2023 17:40:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mkEuuYR2"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 034B44654D
	for <linux-media@vger.kernel.org>; Wed, 27 Dec 2023 17:40:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-28c7e30c83fso742189a91.1
        for <linux-media@vger.kernel.org>; Wed, 27 Dec 2023 09:40:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1703698824; x=1704303624; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gwaYM1PH1SgDuz8j6xYAmjET/NuMiIbLCMJmRCvooPc=;
        b=mkEuuYR2Oe8QDlepIEJqbobfTL0KVDAbB497Sc7BXqfRG8aQV0rOI269zJdvO6lc5S
         K5q1w58SG+GPuPb2uRO1KBL49xwoK6Xds6iJbWoAATX0DlLNWGvbP4WstvsX0lQOPeUQ
         krVUj3aNx7vVKSJBdks6nb16jMdyt1QX9m7lMPrtkG+bJnrLkUDYAQRBxJMLqoFmu3AT
         WkJ5CaM3Iv5Q84Ab/UsoFUV6nC42pxi2Timr4pUDFIP0Q//qWLmGtVOBMqHgbRM5aZwZ
         UT3udZpqBj7ru3epPfa3YYA6jk4kFk1LleXZVwEbprN54fFx0PrVhToMR+p9iXFDPqG7
         FB7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703698824; x=1704303624;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gwaYM1PH1SgDuz8j6xYAmjET/NuMiIbLCMJmRCvooPc=;
        b=Wp530bdYBPR7j2yTeQVEVyKigU1RvybeZNFbp6hAlbU9z1udQVRbl2bB3/jcImWceg
         YCVH5FqFjbRiBVu/VRszXicpn+7S1lwcvhbG7Mq3IJ3/5YgoZhbY+/n8A85n4RBucW6c
         kXYnmKJ8biU2nbkal2FwOI2aSFwMEwa4zOyPbulbmRs7ruUBZE1jv/AObWHOAzCG5oh1
         sdInIkL7hBKbEZAJrcIkNk3iIicGyZZdp4hZ1WQh5RlztkHASi9YTe7qfn+bIPicQxv4
         coc/Yd5Brno9uYWw2zM5nqNhl/kZ5nk2QOwoMh9JqhAGwg3CPP7z23UvKMO6pQQSmCRr
         wiHw==
X-Gm-Message-State: AOJu0YwfBZWlHwzzsGaL3gE6pwF/QolKPOPc5AtkmiEgHDLsrMZYCX57
	3qdy/5lmU6tulQRsTQxig6hu7yhfMXrFiSlydKN0CA==
X-Google-Smtp-Source: AGHT+IEkoXdtxaXTBOKfUNSDG1JYl5u4z0jBjeXdXyn/IMVZsgY34HskJAzpRrLSwTtL0qu7M/msSw==
X-Received: by 2002:a17:90b:2287:b0:28b:f2e2:6158 with SMTP id kx7-20020a17090b228700b0028bf2e26158mr2485270pjb.56.1703698823837;
        Wed, 27 Dec 2023 09:40:23 -0800 (PST)
Received: from localhost.localdomain ([2408:8207:2540:8c00:3708:559:ea20:9883])
        by smtp.gmail.com with ESMTPSA id qb4-20020a17090b280400b0028aecd6b29fsm17240262pjb.3.2023.12.27.09.40.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Dec 2023 09:40:23 -0800 (PST)
From: Jianfeng Liu <liujianfeng1994@gmail.com>
To: linux-media@vger.kernel.org,
	linux-rockchip@lists.infradead.org
Cc: liujianfeng1994@gmail.com
Subject: [PATCH 1/3] media: verisilicon: Add support for Hantro G1 on RK3588
Date: Thu, 28 Dec 2023 01:39:09 +0800
Message-Id: <20231227173911.3295410-2-liujianfeng1994@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231227173911.3295410-1-liujianfeng1994@gmail.com>
References: <20231227173911.3295410-1-liujianfeng1994@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch adds support for RK3588 in existing Hantro
video decoder kernel driver.

Tested with FFmpeg v4l2_request code taken from [1]
with MPEG2, H.264 and VP8 samples.

[1] https://github.com/LibreELEC/LibreELEC.tv/blob/master/packages/multimedia/ffmpeg/patches/v4l2-request/ffmpeg-001-v4l2-request.patch

Signed-off-by: Jianfeng Liu <liujianfeng1994@gmail.com>
---
 drivers/media/platform/verisilicon/hantro_drv.c    |  1 +
 drivers/media/platform/verisilicon/hantro_hw.h     |  1 +
 .../media/platform/verisilicon/rockchip_vpu_hw.c   | 14 ++++++++++++++
 3 files changed, 16 insertions(+)

diff --git a/drivers/media/platform/verisilicon/hantro_drv.c b/drivers/media/platform/verisilicon/hantro_drv.c
index db3df6cc4..4c988f272 100644
--- a/drivers/media/platform/verisilicon/hantro_drv.c
+++ b/drivers/media/platform/verisilicon/hantro_drv.c
@@ -722,6 +722,7 @@ static const struct of_device_id of_hantro_match[] = {
 	{ .compatible = "rockchip,rk3399-vpu", .data = &rk3399_vpu_variant, },
 	{ .compatible = "rockchip,rk3568-vepu", .data = &rk3568_vepu_variant, },
 	{ .compatible = "rockchip,rk3568-vpu", .data = &rk3568_vpu_variant, },
+	{ .compatible = "rockchip,rk3588-vpu", .data = &rk3588_vpu_variant, },
 	{ .compatible = "rockchip,rk3588-av1-vpu", .data = &rk3588_vpu981_variant, },
 #endif
 #ifdef CONFIG_VIDEO_HANTRO_IMX8M
diff --git a/drivers/media/platform/verisilicon/hantro_hw.h b/drivers/media/platform/verisilicon/hantro_hw.h
index 9aec8a79a..276f09a7a 100644
--- a/drivers/media/platform/verisilicon/hantro_hw.h
+++ b/drivers/media/platform/verisilicon/hantro_hw.h
@@ -405,6 +405,7 @@ extern const struct hantro_variant rk3328_vpu_variant;
 extern const struct hantro_variant rk3399_vpu_variant;
 extern const struct hantro_variant rk3568_vepu_variant;
 extern const struct hantro_variant rk3568_vpu_variant;
+extern const struct hantro_variant rk3588_vpu_variant;
 extern const struct hantro_variant rk3588_vpu981_variant;
 extern const struct hantro_variant sama5d4_vdec_variant;
 extern const struct hantro_variant sunxi_vpu_variant;
diff --git a/drivers/media/platform/verisilicon/rockchip_vpu_hw.c b/drivers/media/platform/verisilicon/rockchip_vpu_hw.c
index f97527670..4ee8d64eb 100644
--- a/drivers/media/platform/verisilicon/rockchip_vpu_hw.c
+++ b/drivers/media/platform/verisilicon/rockchip_vpu_hw.c
@@ -797,6 +797,20 @@ const struct hantro_variant px30_vpu_variant = {
 	.num_clocks = ARRAY_SIZE(rockchip_vpu_clk_names)
 };

+const struct hantro_variant rk3588_vpu_variant = {
+	.dec_offset = 0x400,
+	.dec_fmts = rockchip_vdpu2_dec_fmts,
+	.num_dec_fmts = ARRAY_SIZE(rockchip_vdpu2_dec_fmts),
+	.codec = HANTRO_MPEG2_DECODER |
+		 HANTRO_VP8_DECODER | HANTRO_H264_DECODER,
+	.codec_ops = rk3399_vpu_codec_ops,
+	.irqs = rockchip_vdpu2_irqs,
+	.num_irqs = ARRAY_SIZE(rockchip_vdpu2_irqs),
+	.init = rockchip_vpu_hw_init,
+	.clk_names = rockchip_vpu_clk_names,
+	.num_clocks = ARRAY_SIZE(rockchip_vpu_clk_names)
+};
+
 const struct hantro_variant rk3588_vpu981_variant = {
 	.dec_offset = 0x0,
 	.dec_fmts = rockchip_vpu981_dec_fmts,
--
2.34.1


