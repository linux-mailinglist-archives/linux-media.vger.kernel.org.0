Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 221994B5CD2
	for <lists+linux-media@lfdr.de>; Mon, 14 Feb 2022 22:30:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231342AbiBNV3c (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 14 Feb 2022 16:29:32 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:44956 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231450AbiBNV3Z (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 14 Feb 2022 16:29:25 -0500
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com [IPv6:2a00:1450:4864:20::22b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A3BA71480F8
        for <linux-media@vger.kernel.org>; Mon, 14 Feb 2022 13:29:10 -0800 (PST)
Received: by mail-lj1-x22b.google.com with SMTP id n24so21377986ljj.10
        for <linux-media@vger.kernel.org>; Mon, 14 Feb 2022 13:29:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=CkXrAzUFSY/e5T9rKqwMBznq2Sq4ji4dfshU2pB68VY=;
        b=ikMA6Pao2D4vOKU4mdw3H/jO6uD6kWySYHOyurn/qC3yp4V+W5XRU7Moe7zmqFY2op
         LoNKUPbagZHGE+SgbdlcDKgLBH6cnqHaiu8ux0gy7Va/Gbi+bmdjV0fbpycEzFeVbib2
         OxSMqPgXQ2aSKM/Th7Noj2fBNz92q6m/sq7jzExQEkV9WOWkfv7ahByt9YBLm4emRirx
         8VVHg3cO9dzkwrZ224qNKamxZqFV0ve+P5bNi2FT7dQrSjKi1ta945nVUKr/cWSiHFD2
         dffnGFmsUUWWB6HLL2hBTcTDCgwyJAne9QXmhrZmCwdlWgEbjDe3+/Du4KAx74KdpnMG
         CB2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=CkXrAzUFSY/e5T9rKqwMBznq2Sq4ji4dfshU2pB68VY=;
        b=DRSm8Y3GL44df/4FzDbKdv9kEfp2oy4LjETfWnDLbsS7lgd6uUxeVmPYqHkt5w3zRv
         d+Qh1M3Piz3hjnceckIi1IkKn8WMBJ+Lbah5FKXT4v+mNVviWtbkwgkEVkKJzfIfzQ/d
         KthV1fIk339ZGASjpHSKR8DSHrspfsw7fufCsU0TXv2z7oOnbRwVFT42Uy8b3F9YZwxw
         hcpFUGDd/Nw3ivCEeiOS+mSPjhF40e44C2WDT+3vDGEM47hqg3dsl9dfFKH2Ga61uwmR
         vL2fZlx0mZ02zT0AyY6pLYB4VSCLHV0kgVDu9g++aP+iMEsft7vPDfUw8y0PxlDX27Sf
         cnWA==
X-Gm-Message-State: AOAM5338XH8Y4Tv63lsan2DlTlCHrJbm1nwzjiPnVz7vjvOXqQnKy7EI
        sMpb1yUIzsbJHUxRXoEtEj2Cd+wlAWmPEA==
X-Google-Smtp-Source: ABdhPJx8zS75cmKpRFetRZGNVYIjjCd1PRU3OHm8pQBavNjPfZDe4n/6b7rNfBm0iqqtn4IRturZ6Q==
X-Received: by 2002:a05:651c:168c:: with SMTP id bd12mr47042ljb.63.1644874148685;
        Mon, 14 Feb 2022 13:29:08 -0800 (PST)
Received: from localhost (31-178-191-245.dynamic.chello.pl. [31.178.191.245])
        by smtp.gmail.com with ESMTPSA id m28sm650982ljc.1.2022.02.14.13.29.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Feb 2022 13:29:08 -0800 (PST)
From:   Piotr Oniszczuk <piotr.oniszczuk@gmail.com>
To:     linux-media@vger.kernel.org, Linux-rockchip@lists.infradead.org
Cc:     Piotr Oniszczuk <piotr.oniszczuk@gmail.com>
Subject: [PATCH v2 1/3] media: hantro: Add support for Hantro G1 on RK356x
Date:   Mon, 14 Feb 2022 22:29:53 +0100
Message-Id: <20220214212955.1178947-1-piotr.oniszczuk@gmail.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Piotr Oniszczuk <piotr.oniszczuk@gmail.com>

RK356x has Hantro G1 video decoder capable to decode MPEG2/H.264/VP8
video formats.

This patch adds support for RK356x family in existing Hantro
video decoder kernel driver.

Tested on [1] with FFmpeg v4l2_request code taken from [2]
with MPEG2, H.642 and VP8 samples with results [3].

[1] https://github.com/warpme/minimyth2
[2] https://github.com/LibreELEC/LibreELEC.tv/blob/master/packages/multimedia/ffmpeg/patches/v4l2-request/ffmpeg-001-v4l2-request.patch
[3] https://github.com/warpme/minimyth2/blob/master/video-test-summary.txt

Signed-off-by: Piotr Oniszczuk <piotr.oniszczuk@gmail.com>
---
 drivers/staging/media/hantro/hantro_drv.c      |  1 +
 drivers/staging/media/hantro/hantro_hw.h       |  1 +
 drivers/staging/media/hantro/rockchip_vpu_hw.c | 14 ++++++++++++++
 3 files changed, 16 insertions(+)

diff --git a/drivers/staging/media/hantro/hantro_drv.c b/drivers/staging/media/hantro/hantro_drv.c
index 6a51f39dde56..ac7d58069eb8 100644
--- a/drivers/staging/media/hantro/hantro_drv.c
+++ b/drivers/staging/media/hantro/hantro_drv.c
@@ -613,6 +613,7 @@ static const struct of_device_id of_hantro_match[] = {
 	{ .compatible = "rockchip,rk3288-vpu", .data = &rk3288_vpu_variant, },
 	{ .compatible = "rockchip,rk3328-vpu", .data = &rk3328_vpu_variant, },
 	{ .compatible = "rockchip,rk3399-vpu", .data = &rk3399_vpu_variant, },
+	{ .compatible = "rockchip,rk3568-vpu", .data = &rk3568_vpu_variant, },
 #endif
 #ifdef CONFIG_VIDEO_HANTRO_IMX8M
 	{ .compatible = "nxp,imx8mq-vpu", .data = &imx8mq_vpu_variant, },
diff --git a/drivers/staging/media/hantro/hantro_hw.h b/drivers/staging/media/hantro/hantro_hw.h
index 4a19ae8940b9..89ec6d500938 100644
--- a/drivers/staging/media/hantro/hantro_hw.h
+++ b/drivers/staging/media/hantro/hantro_hw.h
@@ -307,6 +307,7 @@ extern const struct hantro_variant rk3066_vpu_variant;
 extern const struct hantro_variant rk3288_vpu_variant;
 extern const struct hantro_variant rk3328_vpu_variant;
 extern const struct hantro_variant rk3399_vpu_variant;
+extern const struct hantro_variant rk3568_vpu_variant;
 extern const struct hantro_variant sama5d4_vdec_variant;
 extern const struct hantro_variant sunxi_vpu_variant;
 
diff --git a/drivers/staging/media/hantro/rockchip_vpu_hw.c b/drivers/staging/media/hantro/rockchip_vpu_hw.c
index c203b606e6e7..5e64cf068ff9 100644
--- a/drivers/staging/media/hantro/rockchip_vpu_hw.c
+++ b/drivers/staging/media/hantro/rockchip_vpu_hw.c
@@ -551,6 +551,20 @@ const struct hantro_variant rk3399_vpu_variant = {
 	.num_clocks = ARRAY_SIZE(rockchip_vpu_clk_names)
 };
 
+const struct hantro_variant rk3568_vpu_variant = {
+	.dec_offset = 0x400,
+	.dec_fmts = rk3399_vpu_dec_fmts,
+	.num_dec_fmts = ARRAY_SIZE(rk3399_vpu_dec_fmts),
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
 const struct hantro_variant px30_vpu_variant = {
 	.enc_offset = 0x0,
 	.enc_fmts = rockchip_vpu_enc_fmts,
-- 
2.29.2

