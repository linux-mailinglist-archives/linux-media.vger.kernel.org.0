Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 180D05691C8
	for <lists+linux-media@lfdr.de>; Wed,  6 Jul 2022 20:29:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234336AbiGFS3S (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 6 Jul 2022 14:29:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42924 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230443AbiGFS3Q (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 6 Jul 2022 14:29:16 -0400
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com [IPv6:2a00:1450:4864:20::431])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 92546E6;
        Wed,  6 Jul 2022 11:29:15 -0700 (PDT)
Received: by mail-wr1-x431.google.com with SMTP id z12so13613823wrq.7;
        Wed, 06 Jul 2022 11:29:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=4Izef/YFAeykVDGIGibt/PVLWMHaIRGslbYjaSahqjs=;
        b=k4mS3Sqaow+E8TCUFRnHPjBJR9MZIDkEknhRLUALIVlExSdfszMO5lehrsQXWZMDH+
         R1SYbl7BJ3wwHPZ60085AH9sjMc7Njs7RnBhZJdP8bDSL9i/f7y0jf9jV1QcnsxysMLo
         gBHMjsgdJU8TQCK8UCUj8yfzGGQmskkH79S9a6uZRHl0TIG0pXQQgZSZqgxx7AhJPlsl
         p1+7LHXw7Wyzp8mxuGJEMbr+Gkw/5ws3sW+k1Be5+8Dvk+gRn2X1dheyqreGe/SeeqxW
         0b9megdN7uHp0jifoz4awH1ZqDgppqhJjXQBOfqhe0CAoGrKL2qBLa/bJWUeSImSzF2O
         nVXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=4Izef/YFAeykVDGIGibt/PVLWMHaIRGslbYjaSahqjs=;
        b=Ocp3mFnr04PBpBadg6wbKGtIOC4es6uiIIIEyN+m8nuNUwZCFA7N41HvvIHGY+AKSP
         5k4wlHy1eQ48+IBlEEmf9SonwuiBhx2I2/foiUFw/zstmtAdJthtQaHic+EAqVIaf7x4
         PhAbOQ6/VzcwZzJcXMFa7bo4/V99R65D4TLgTBR6WE0q8vldt5h/3YYh8bN5c8mfQfW0
         GlcL4MgAykNXMB7xdM0PKdqeansQbCKjkuUiJbkB0Le2NzkuG2ctz9wMWoQZA7OGX/W+
         4Q9I3n5ts2cjNImJ7eN4f/dm9BOOWH5E3To9sNvLizFHU8NExrkLNa1Af+Dpt+Iuqdnq
         PFAA==
X-Gm-Message-State: AJIora927GhPAnFfhzIg0Yg9iXV+a2gkOjM26OC74Zk8EruyeuGMEhLV
        whyI1+slAvaSbzSGvxQvNP+Kc2rIApLxGw==
X-Google-Smtp-Source: AGRyM1vm6h/6hghpmed7QW/eRjmbMAMh/PS7rCXzlLna67B6WT5dqfs2NwgIOVJ614pVtnZpDbgwHQ==
X-Received: by 2002:adf:d1e9:0:b0:21d:2154:2bc7 with SMTP id g9-20020adfd1e9000000b0021d21542bc7mr36880429wrd.105.1657132154166;
        Wed, 06 Jul 2022 11:29:14 -0700 (PDT)
Received: from kista.localdomain (213-161-3-76.dynamic.telemach.net. [213.161.3.76])
        by smtp.gmail.com with ESMTPSA id r15-20020a0560001b8f00b0021d74906683sm5142406wru.28.2022.07.06.11.29.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Jul 2022 11:29:13 -0700 (PDT)
From:   Jernej Skrabec <jernej.skrabec@gmail.com>
To:     ezequiel@vanguardiasur.com.ar, p.zabel@pengutronix.de
Cc:     mchehab@kernel.org, hverkuil-cisco@xs4all.nl,
        benjamin.gaignard@collabora.com, nicolas.dufresne@collabora.com,
        gregkh@linuxfoundation.org, linux-media@vger.kernel.org,
        linux-staging@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-rockchip@lists.infradead.org,
        Jernej Skrabec <jernej.skrabec@gmail.com>
Subject: [PATCH v3 2/7] media: hantro: Support format filtering by depth
Date:   Wed,  6 Jul 2022 20:28:56 +0200
Message-Id: <20220706182901.78949-3-jernej.skrabec@gmail.com>
X-Mailer: git-send-email 2.37.0
In-Reply-To: <20220706182901.78949-1-jernej.skrabec@gmail.com>
References: <20220706182901.78949-1-jernej.skrabec@gmail.com>
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

In preparation for supporting 10-bit formats, add mechanism which will
filter formats based on pixel depth.

Hantro G2 supports only one decoding format natively and that is based
on bit depth of current video frame. Additionally, it makes no sense to
upconvert bitness, so filter those out too.

Reviewed-by: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Tested-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
---
 drivers/staging/media/hantro/hantro.h      |  4 ++
 drivers/staging/media/hantro/hantro_v4l2.c | 48 ++++++++++++++++++++--
 drivers/staging/media/hantro/hantro_v4l2.h |  1 +
 3 files changed, 50 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/media/hantro/hantro.h b/drivers/staging/media/hantro/hantro.h
index 26308bb29adc..2989ebc631cc 100644
--- a/drivers/staging/media/hantro/hantro.h
+++ b/drivers/staging/media/hantro/hantro.h
@@ -227,6 +227,7 @@ struct hantro_dev {
  *
  * @ctrl_handler:	Control handler used to register controls.
  * @jpeg_quality:	User-specified JPEG compression quality.
+ * @bit_depth:		Bit depth of current frame
  *
  * @codec_ops:		Set of operations related to codec mode.
  * @postproc:		Post-processing context.
@@ -252,6 +253,7 @@ struct hantro_ctx {
 
 	struct v4l2_ctrl_handler ctrl_handler;
 	int jpeg_quality;
+	int bit_depth;
 
 	const struct hantro_codec_ops *codec_ops;
 	struct hantro_postproc_ctx postproc;
@@ -277,6 +279,7 @@ struct hantro_ctx {
  * @enc_fmt:	Format identifier for encoder registers.
  * @frmsize:	Supported range of frame sizes (only for bitstream formats).
  * @postprocessed: Indicates if this format needs the post-processor.
+ * @match_depth: Indicates if format bit depth must match video bit depth
  */
 struct hantro_fmt {
 	char *name;
@@ -287,6 +290,7 @@ struct hantro_fmt {
 	enum hantro_enc_fmt enc_fmt;
 	struct v4l2_frmsize_stepwise frmsize;
 	bool postprocessed;
+	bool match_depth;
 };
 
 struct hantro_reg {
diff --git a/drivers/staging/media/hantro/hantro_v4l2.c b/drivers/staging/media/hantro/hantro_v4l2.c
index 29cc61d53b71..334f18a4120d 100644
--- a/drivers/staging/media/hantro/hantro_v4l2.c
+++ b/drivers/staging/media/hantro/hantro_v4l2.c
@@ -64,6 +64,42 @@ hantro_get_postproc_formats(const struct hantro_ctx *ctx,
 	return ctx->dev->variant->postproc_fmts;
 }
 
+int hantro_get_format_depth(u32 fourcc)
+{
+	switch (fourcc) {
+	case V4L2_PIX_FMT_P010:
+	case V4L2_PIX_FMT_P010_4L4:
+		return 10;
+	default:
+		return 8;
+	}
+}
+
+static bool
+hantro_check_depth_match(const struct hantro_ctx *ctx,
+			 const struct hantro_fmt *fmt)
+{
+	int fmt_depth, ctx_depth = 8;
+
+	if (!fmt->match_depth && !fmt->postprocessed)
+		return true;
+
+	/* 0 means default depth, which is 8 */
+	if (ctx->bit_depth)
+		ctx_depth = ctx->bit_depth;
+
+	fmt_depth = hantro_get_format_depth(fmt->fourcc);
+
+	/*
+	 * Allow only downconversion for postproc formats for now.
+	 * It may be possible to relax that on some HW.
+	 */
+	if (!fmt->match_depth)
+		return fmt_depth <= ctx_depth;
+
+	return fmt_depth == ctx_depth;
+}
+
 static const struct hantro_fmt *
 hantro_find_format(const struct hantro_ctx *ctx, u32 fourcc)
 {
@@ -91,7 +127,8 @@ hantro_get_default_fmt(const struct hantro_ctx *ctx, bool bitstream)
 	formats = hantro_get_formats(ctx, &num_fmts);
 	for (i = 0; i < num_fmts; i++) {
 		if (bitstream == (formats[i].codec_mode !=
-				  HANTRO_MODE_NONE))
+				  HANTRO_MODE_NONE) &&
+		    hantro_check_depth_match(ctx, &formats[i]))
 			return &formats[i];
 	}
 	return NULL;
@@ -162,11 +199,13 @@ static int vidioc_enum_fmt(struct file *file, void *priv,
 	formats = hantro_get_formats(ctx, &num_fmts);
 	for (i = 0; i < num_fmts; i++) {
 		bool mode_none = formats[i].codec_mode == HANTRO_MODE_NONE;
+		fmt = &formats[i];
 
 		if (skip_mode_none == mode_none)
 			continue;
+		if (!hantro_check_depth_match(ctx, fmt))
+			continue;
 		if (j == f->index) {
-			fmt = &formats[i];
 			f->pixelformat = fmt->fourcc;
 			return 0;
 		}
@@ -182,8 +221,11 @@ static int vidioc_enum_fmt(struct file *file, void *priv,
 		return -EINVAL;
 	formats = hantro_get_postproc_formats(ctx, &num_fmts);
 	for (i = 0; i < num_fmts; i++) {
+		fmt = &formats[i];
+
+		if (!hantro_check_depth_match(ctx, fmt))
+			continue;
 		if (j == f->index) {
-			fmt = &formats[i];
 			f->pixelformat = fmt->fourcc;
 			return 0;
 		}
diff --git a/drivers/staging/media/hantro/hantro_v4l2.h b/drivers/staging/media/hantro/hantro_v4l2.h
index 18bc682c8556..b17e84c82582 100644
--- a/drivers/staging/media/hantro/hantro_v4l2.h
+++ b/drivers/staging/media/hantro/hantro_v4l2.h
@@ -22,5 +22,6 @@ extern const struct v4l2_ioctl_ops hantro_ioctl_ops;
 extern const struct vb2_ops hantro_queue_ops;
 
 void hantro_reset_fmts(struct hantro_ctx *ctx);
+int hantro_get_format_depth(u32 fourcc);
 
 #endif /* HANTRO_V4L2_H_ */
-- 
2.37.0

