Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C75464B3C62
	for <lists+linux-media@lfdr.de>; Sun, 13 Feb 2022 18:13:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237233AbiBMRN3 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 13 Feb 2022 12:13:29 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:37248 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232033AbiBMRN3 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 13 Feb 2022 12:13:29 -0500
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com [IPv6:2a00:1450:4864:20::12c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4108558E5B
        for <linux-media@vger.kernel.org>; Sun, 13 Feb 2022 09:13:21 -0800 (PST)
Received: by mail-lf1-x12c.google.com with SMTP id bu29so20973902lfb.0
        for <linux-media@vger.kernel.org>; Sun, 13 Feb 2022 09:13:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=+IvjBSigw9nyuJJODv2b6IGzdRQsGcbOBUmM9/VOzQU=;
        b=YirlOw5MCb+osyrDR6LElXOhN0n57tTvvUGMKBjX7b6aQmvp6blBsvrU6rmgd51oGU
         c4TYXHL8rrBsC7osDzR7L/wE07DXHxWDlE5Zk4v2pATwB0Pfx9u7enZAG1q8a5ApLFRQ
         kPTs6mSPVx9xQTswBSxmJUGg+9ZjlLIlH1rE4iMSn92gvM2ST439mwIKnec3WfRfen2H
         u6B+iB4ZqkXgKicdocoJSkc8v6bEUrJQif+yUzvSw2/GzViKM9bWckWcKurJdQf+vKOT
         ygXMob1yF7F6QYBI7QmW3VlWDsM9b2zXg1PmY5rTIyMkwUv9qJvpHIwpbPHkN0J1QeyX
         eLfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=+IvjBSigw9nyuJJODv2b6IGzdRQsGcbOBUmM9/VOzQU=;
        b=hjiC13YryQwETYCCzeF9PBM8dStxKLVbV+RIB8Fw0J/CGOWrUWV6Rl98EdHLLhrMIW
         lzqGyC8Y2lLji8+y7hIU94FFwpwuWjM1teYxsVJRzL6/cwIA/flfJYM1QSJtCl0j455r
         04bl8cct6u+3gP9QZiwN4T29igey708WDzJ1GGfcXIBlnPDEAN1yb81JcVN7UhW9JRM1
         cwMPFj8Qrmg5KMU3msignGfQsT2qoD1d7AAG9nwbxKBYkRFwoHKQG5e8WHx3u4WkyGj1
         WsQW5KErL2SDKScmpnSCX8NuPG0+fHkZzhSKRGKauFLmmlVC5sP9lc+0DffJ4dbutGCR
         /C6w==
X-Gm-Message-State: AOAM531Usw7Xw7oFIHWcsdWkx63Fc7WnjcsF1AIzccAWVRVDQu32xjId
        8uxzO2pUw95VS06y6HAxU1zieMYJuWmzpw==
X-Google-Smtp-Source: ABdhPJywpSybPEhfHJgSvcJif9wjv7cpqipiy9L1flKPm8Su6WQaf0yFm3XHN8C3835mWmIZrsD+dw==
X-Received: by 2002:a05:6512:68f:: with SMTP id t15mr7721336lfe.124.1644772399382;
        Sun, 13 Feb 2022 09:13:19 -0800 (PST)
Received: from localhost (31-178-191-245.dynamic.chello.pl. [31.178.191.245])
        by smtp.gmail.com with ESMTPSA id g6sm3378631lfu.130.2022.02.13.09.13.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 13 Feb 2022 09:13:18 -0800 (PST)
From:   Piotr Oniszczuk <piotr.oniszczuk@gmail.com>
To:     linux-media@vger.kernel.org
Cc:     Piotr Oniszczuk <piotr.oniszczuk@gmail.com>
Subject: [PATCH v1 01/03]: media: hantro: Add support for Hantro G1 on RK356x
Date:   Sun, 13 Feb 2022 18:13:48 +0100
Message-Id: <20220213171349.3924782-1-piotr.oniszczuk@gmail.com>
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

RK356x has Hantro G1 video decoder capable to decode MPEG2/H.264/VP9
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

