Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 817E7131E0F
	for <lists+linux-media@lfdr.de>; Tue,  7 Jan 2020 04:44:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727518AbgAGDnt (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 6 Jan 2020 22:43:49 -0500
Received: from mail-pf1-f194.google.com ([209.85.210.194]:35899 "EHLO
        mail-pf1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727295AbgAGDnt (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 6 Jan 2020 22:43:49 -0500
Received: by mail-pf1-f194.google.com with SMTP id x184so27912234pfb.3;
        Mon, 06 Jan 2020 19:43:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=9HAw19jVeHxxdurgcOiXctlBffkucK0nh349iGgV3R8=;
        b=XxtAdd0bdWrUOYxuX9W//W7L7wcHPwRI7vqpeyReLB++pcKOYHbipgm8p8eTWR13XG
         tAd0LVfns+9qbiXhOrJGMpmGKcQutmOa4dHPyV38miXXPqInzTLDFJ+CHIyXtIfnLcwq
         FzQMlZCgf8+9iYSCsgI7ngoIJbF7o+U6QpiQeYqgoPCQRH90aCuVIvb4UGw1D7A3rf1U
         hTjdMkrpmDKa6xc5br7mAjmv2rg8CwnIGQpJRfXq7B5zYWCEkPhdyfunoNKB3EhptX9Z
         cFP1EsFJqVOvao7775LD44VszXG1wOmQEnpe61gLVhjsEx/2n+3siVfbXs33sJdTJQdc
         cmgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:content-transfer-encoding;
        bh=9HAw19jVeHxxdurgcOiXctlBffkucK0nh349iGgV3R8=;
        b=Ch6nQvNB5ilZsWpRHzez+y/VG6zQtV0swem969iD3CGASDhPbsK17mmB/tdQA06ek+
         lmhhdryhPDaGXBNz7+AjjYFcbLijewmWG1cgRytFUDKGGT2vTjx/P1qibzG2lqy4hZ/H
         qkNotS3Cp+Ve+mwrsY2DUswkBJBjsSQbirQrZeuxLEGFDq9SRHCrHIrBw1HzG8GS/ZXm
         B0sgSVXU2ECHe08ar2rlNPOX07oIb9YTj7JZ854ClYhDQ7CkM/jyU0OPZhKBz5a0lgne
         Avb02fAm1rYMpATnw03VR49ADXCBxgfetfaMefSp84nDjiBBKZiTzL9r0tAIopfiRtQp
         5CIw==
X-Gm-Message-State: APjAAAVigbyld52Kl9yp1FVUQwySwvUztbQSS+pXvahrSBAwnsM5auf+
        ap7sola3nHEq0OIDYWf3dO8=
X-Google-Smtp-Source: APXvYqz6EHI8pVF3FrydG0u6YG4WEAj9paVMg8hO9zp/2XkhyJQbUxJZBQWNw2PlKPMWFXz8af/1XA==
X-Received: by 2002:a63:3f4f:: with SMTP id m76mr111711984pga.353.1578368628186;
        Mon, 06 Jan 2020 19:43:48 -0800 (PST)
Received: from voyager.lan ([45.124.203.14])
        by smtp.gmail.com with ESMTPSA id g10sm73455929pgh.35.2020.01.06.19.43.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jan 2020 19:43:47 -0800 (PST)
From:   Joel Stanley <joel@jms.id.au>
To:     Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>,
        Eddie James <eajames@linux.ibm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     Andrew Jeffery <andrew@aj.id.au>, linux-media@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org
Subject: [PATCH 2/3] media: aspeed: Use runtime configuration
Date:   Tue,  7 Jan 2020 14:13:23 +1030
Message-Id: <20200107034324.38073-3-joel@jms.id.au>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200107034324.38073-1-joel@jms.id.au>
References: <20200107034324.38073-1-joel@jms.id.au>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The aspeed video IP has some differences between SoC families. Currently
the driver decides which registers to use at compile time, which means
a single kernel can not be used between platforms.

Switch to using runtime configuration of the registers that vary between
SoC families. This is in preparation for upcoming ast2600 support.

Signed-off-by: Joel Stanley <joel@jms.id.au>
---
 drivers/media/platform/aspeed-video.c | 53 ++++++++++++++++++++-------
 1 file changed, 39 insertions(+), 14 deletions(-)

diff --git a/drivers/media/platform/aspeed-video.c b/drivers/media/platform/aspeed-video.c
index 8f849d9866af..d70b893fd4cf 100644
--- a/drivers/media/platform/aspeed-video.c
+++ b/drivers/media/platform/aspeed-video.c
@@ -72,11 +72,8 @@
 #define  VE_SEQ_CTRL_CAP_BUSY		BIT(16)
 #define  VE_SEQ_CTRL_COMP_BUSY		BIT(18)
 
-#ifdef CONFIG_MACH_ASPEED_G5
-#define  VE_SEQ_CTRL_JPEG_MODE		BIT(13)	/* AST2500 */
-#else
-#define  VE_SEQ_CTRL_JPEG_MODE		BIT(8)	/* AST2400 */
-#endif /* CONFIG_MACH_ASPEED_G5 */
+#define AST2500_VE_SEQ_CTRL_JPEG_MODE	BIT(13)
+#define AST2400_VE_SEQ_CTRL_JPEG_MODE	BIT(8)
 
 #define VE_CTRL				0x008
 #define  VE_CTRL_HSYNC_POL		BIT(0)
@@ -220,6 +217,9 @@ struct aspeed_video {
 	struct video_device vdev;
 	struct mutex video_lock;	/* v4l2 and videobuf2 lock */
 
+	u32 jpeg_mode;
+	u32 comp_size_read;
+
 	wait_queue_head_t wait;
 	spinlock_t lock;		/* buffer list lock */
 	struct delayed_work res_work;
@@ -243,6 +243,21 @@ struct aspeed_video {
 
 #define to_aspeed_video(x) container_of((x), struct aspeed_video, v4l2_dev)
 
+struct aspeed_video_config {
+	u32 jpeg_mode;
+	u32 comp_size_read;
+};
+
+static const struct aspeed_video_config ast2400_config = {
+	.jpeg_mode = AST2400_VE_SEQ_CTRL_JPEG_MODE,
+	.comp_size_read = VE_OFFSET_COMP_STREAM,
+};
+
+static const struct aspeed_video_config ast2500_config = {
+	.jpeg_mode = AST2500_VE_SEQ_CTRL_JPEG_MODE,
+	.comp_size_read = VE_OFFSET_COMP_STREAM,
+};
+
 static const u32 aspeed_video_jpeg_header[ASPEED_VIDEO_JPEG_HEADER_SIZE] = {
 	0xe0ffd8ff, 0x464a1000, 0x01004649, 0x60000101, 0x00006000, 0x0f00feff,
 	0x00002d05, 0x00000000, 0x00000000, 0x00dbff00
@@ -572,7 +587,7 @@ static irqreturn_t aspeed_video_irq(int irq, void *arg)
 	if (sts & VE_INTERRUPT_COMP_COMPLETE) {
 		struct aspeed_video_buffer *buf;
 		u32 frame_size = aspeed_video_read(video,
-						   VE_OFFSET_COMP_STREAM);
+						   video->comp_size_read);
 
 		spin_lock(&video->lock);
 		clear_bit(VIDEO_FRAME_INPRG, &video->flags);
@@ -907,7 +922,7 @@ static void aspeed_video_init_regs(struct aspeed_video *video)
 		FIELD_PREP(VE_COMP_CTRL_DCT_LUM, video->jpeg_quality) |
 		FIELD_PREP(VE_COMP_CTRL_DCT_CHR, video->jpeg_quality | 0x10);
 	u32 ctrl = VE_CTRL_AUTO_OR_CURSOR;
-	u32 seq_ctrl = VE_SEQ_CTRL_JPEG_MODE;
+	u32 seq_ctrl = video->jpeg_mode;;
 
 	if (video->frame_rate)
 		ctrl |= FIELD_PREP(VE_CTRL_FRC, video->frame_rate);
@@ -1653,8 +1668,17 @@ static int aspeed_video_init(struct aspeed_video *video)
 	return rc;
 }
 
+static const struct of_device_id aspeed_video_of_match[] = {
+	{ .compatible = "aspeed,ast2400-video-engine", .data = &ast2400_config },
+	{ .compatible = "aspeed,ast2500-video-engine", .data = &ast2500_config },
+	{}
+};
+MODULE_DEVICE_TABLE(of, aspeed_video_of_match);
+
 static int aspeed_video_probe(struct platform_device *pdev)
 {
+	const struct aspeed_video_config *config;
+	const struct of_device_id *match;
 	struct aspeed_video *video;
 	int rc;
 
@@ -1666,6 +1690,14 @@ static int aspeed_video_probe(struct platform_device *pdev)
 	if (IS_ERR(video->base))
 		return PTR_ERR(video->base);
 
+	match = of_match_node(aspeed_video_of_match, pdev->dev.of_node);
+	if (!match)
+		return -EINVAL;
+
+	config = match->data;
+	video->jpeg_mode = config->jpeg_mode;
+	video->comp_size_read = config->comp_size_read;
+
 	video->frame_rate = 30;
 	video->dev = &pdev->dev;
 	spin_lock_init(&video->lock);
@@ -1712,13 +1744,6 @@ static int aspeed_video_remove(struct platform_device *pdev)
 	return 0;
 }
 
-static const struct of_device_id aspeed_video_of_match[] = {
-	{ .compatible = "aspeed,ast2400-video-engine" },
-	{ .compatible = "aspeed,ast2500-video-engine" },
-	{}
-};
-MODULE_DEVICE_TABLE(of, aspeed_video_of_match);
-
 static struct platform_driver aspeed_video_driver = {
 	.driver = {
 		.name = DEVICE_NAME,
-- 
2.24.1

