Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A11F8B531A
	for <lists+linux-media@lfdr.de>; Tue, 17 Sep 2019 18:36:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730549AbfIQQfl (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 17 Sep 2019 12:35:41 -0400
Received: from mail-io1-f68.google.com ([209.85.166.68]:40475 "EHLO
        mail-io1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730484AbfIQQfV (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 17 Sep 2019 12:35:21 -0400
Received: by mail-io1-f68.google.com with SMTP id h144so9105432iof.7
        for <linux-media@vger.kernel.org>; Tue, 17 Sep 2019 09:35:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=uRbhVfvRjBgPiFZTzfKxL4tHG34+Dl9OtCfa42+v2MQ=;
        b=e8B5/nHmz3KnXtQhBp9saALcYvmJsEcmtKtFnWEtfNrFq9Wf+6wI1rmvMO3LNxLLeg
         XEqvDNLsv+fUDlD8rpYaCy3UCRNdS+ZcIa7Kpm86qmZtjMwyZaQmWEnQE6WcPYnKpzwD
         uYbCDLibRtl83AvkgJmcjuL5Sk2ePDUXTKdww=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=uRbhVfvRjBgPiFZTzfKxL4tHG34+Dl9OtCfa42+v2MQ=;
        b=aBlMp4+UO7EGZtYp0LE0y9AxHjVt45ExeEwOngqYA4BbryfcmxxUA+101Fma5rtNll
         AkNVa0Ddwo0DU/0gzQhYfIVId/EIEeA1+H+b5w5dte6X2cxmFo+Xij6KD7B7ENbQG+R4
         j6vlM2yQ46WRMjBBPi4W2jb3wT/WfYXl6tudIqt621gVOuqmC+bmbAb7hSmUasw1CDEl
         KqSF/F/v5uZ8FmEGifzh9PKO66nSEhQfzxA2qXOzXnd2paYktj7YBw3pyX2FNLdwFaeO
         Nue5QKCzAS6F6Dm5sb6lxzxO9SDa1sk0rsLKtcNahB5Ie/QKhnPQCD/HNMy9uHvQpjEj
         bUgQ==
X-Gm-Message-State: APjAAAUbqkS0dX5gASYc1AUM4KxSWY0RBVd13uQLD01cd16goKbub6cU
        FjWjjX6YeBa3rYgKfU2VZku1kg==
X-Google-Smtp-Source: APXvYqznJo6RDb3Wnpbt0iL/OLIWgoFfXqTiSdC31cUaKrUW3hlXn7a6d8viQTm+eDFyKzKYv7kw7w==
X-Received: by 2002:a5d:89da:: with SMTP id a26mr1704786iot.61.1568738120464;
        Tue, 17 Sep 2019 09:35:20 -0700 (PDT)
Received: from shuah-t480s.internal (c-24-9-64-241.hsd1.co.comcast.net. [24.9.64.241])
        by smtp.gmail.com with ESMTPSA id v3sm2593781ioh.51.2019.09.17.09.35.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Sep 2019 09:35:20 -0700 (PDT)
From:   Shuah Khan <skhan@linuxfoundation.org>
To:     mchehab@kernel.org, helen.koike@collabora.com,
        skhan@linuxfoundation.org, andrealmeid@collabora.com,
        dafna.hirschfeld@collabora.com, hverkuil-cisco@xs4all.nl
Cc:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v5 3/5] vimc: move duplicated IS_SRC and IS_SINK to common header
Date:   Tue, 17 Sep 2019 10:35:10 -0600
Message-Id: <776b23b8fa963df3eea3c4920c78b052ef4567a1.1568689325.git.skhan@linuxfoundation.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1568689325.git.skhan@linuxfoundation.org>
References: <cover.1568689325.git.skhan@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Move duplicated IS_SRC and IS_SINK dfines to common header. Rename
them to VIMC_IS_SRC and VIM_IS_SINK.

Signed-off-by: Shuah Khan <skhan@linuxfoundation.org>
---
 drivers/media/platform/vimc/vimc-common.h  |  4 ++++
 drivers/media/platform/vimc/vimc-debayer.c | 11 ++++-------
 drivers/media/platform/vimc/vimc-scaler.c  |  8 +++-----
 3 files changed, 11 insertions(+), 12 deletions(-)

diff --git a/drivers/media/platform/vimc/vimc-common.h b/drivers/media/platform/vimc/vimc-common.h
index d7aaf31175bc..698db7c07645 100644
--- a/drivers/media/platform/vimc/vimc-common.h
+++ b/drivers/media/platform/vimc/vimc-common.h
@@ -27,6 +27,10 @@
 
 #define VIMC_FRAME_INDEX(lin, col, width, bpp) ((lin * width + col) * bpp)
 
+/* Source and sink pad checks */
+#define VIMC_IS_SRC(pad)	(pad)
+#define VIMC_IS_SINK(pad)	(!(pad))
+
 /**
  * struct vimc_colorimetry_clamp - Adjust colorimetry parameters
  *
diff --git a/drivers/media/platform/vimc/vimc-debayer.c b/drivers/media/platform/vimc/vimc-debayer.c
index 4125159e8f31..feac47d79449 100644
--- a/drivers/media/platform/vimc/vimc-debayer.c
+++ b/drivers/media/platform/vimc/vimc-debayer.c
@@ -20,9 +20,6 @@ MODULE_PARM_DESC(deb_mean_win_size, " the window size to calculate the mean.\n"
 	"stays in the center of the window, otherwise the next odd number "
 	"is considered");
 
-#define IS_SINK(pad) (!pad)
-#define IS_SRC(pad)  (pad)
-
 enum vimc_deb_rgb_colors {
 	VIMC_DEB_RED = 0,
 	VIMC_DEB_GREEN = 1,
@@ -155,7 +152,7 @@ static int vimc_deb_enum_mbus_code(struct v4l2_subdev *sd,
 				   struct v4l2_subdev_mbus_code_enum *code)
 {
 	/* We only support one format for source pads */
-	if (IS_SRC(code->pad)) {
+	if (VIMC_IS_SRC(code->pad)) {
 		struct vimc_deb_device *vdeb = v4l2_get_subdevdata(sd);
 
 		if (code->index)
@@ -181,7 +178,7 @@ static int vimc_deb_enum_frame_size(struct v4l2_subdev *sd,
 	if (fse->index)
 		return -EINVAL;
 
-	if (IS_SINK(fse->pad)) {
+	if (VIMC_IS_SINK(fse->pad)) {
 		const struct vimc_deb_pix_map *vpix =
 			vimc_deb_pix_map_by_code(fse->code);
 
@@ -211,7 +208,7 @@ static int vimc_deb_get_fmt(struct v4l2_subdev *sd,
 		      vdeb->sink_fmt;
 
 	/* Set the right code for the source pad */
-	if (IS_SRC(fmt->pad))
+	if (VIMC_IS_SRC(fmt->pad))
 		fmt->format.code = vdeb->src_code;
 
 	return 0;
@@ -258,7 +255,7 @@ static int vimc_deb_set_fmt(struct v4l2_subdev *sd,
 	 * Do not change the format of the source pad,
 	 * it is propagated from the sink
 	 */
-	if (IS_SRC(fmt->pad)) {
+	if (VIMC_IS_SRC(fmt->pad)) {
 		fmt->format = *sink_fmt;
 		/* TODO: Add support for other formats */
 		fmt->format.code = vdeb->src_code;
diff --git a/drivers/media/platform/vimc/vimc-scaler.c b/drivers/media/platform/vimc/vimc-scaler.c
index 1a593d81ea7c..a6a3cc5be872 100644
--- a/drivers/media/platform/vimc/vimc-scaler.c
+++ b/drivers/media/platform/vimc/vimc-scaler.c
@@ -16,8 +16,6 @@ static unsigned int sca_mult = 3;
 module_param(sca_mult, uint, 0000);
 MODULE_PARM_DESC(sca_mult, " the image size multiplier");
 
-#define IS_SINK(pad)	(!pad)
-#define IS_SRC(pad)	(pad)
 #define MAX_ZOOM	8
 
 struct vimc_sca_device {
@@ -93,7 +91,7 @@ static int vimc_sca_enum_frame_size(struct v4l2_subdev *sd,
 	fse->min_width = VIMC_FRAME_MIN_WIDTH;
 	fse->min_height = VIMC_FRAME_MIN_HEIGHT;
 
-	if (IS_SINK(fse->pad)) {
+	if (VIMC_IS_SINK(fse->pad)) {
 		fse->max_width = VIMC_FRAME_MAX_WIDTH;
 		fse->max_height = VIMC_FRAME_MAX_HEIGHT;
 	} else {
@@ -116,7 +114,7 @@ static int vimc_sca_get_fmt(struct v4l2_subdev *sd,
 			 vsca->sink_fmt;
 
 	/* Scale the frame size for the source pad */
-	if (IS_SRC(format->pad)) {
+	if (VIMC_IS_SRC(format->pad)) {
 		format->format.width = vsca->sink_fmt.width * sca_mult;
 		format->format.height = vsca->sink_fmt.height * sca_mult;
 	}
@@ -165,7 +163,7 @@ static int vimc_sca_set_fmt(struct v4l2_subdev *sd,
 	 * Do not change the format of the source pad,
 	 * it is propagated from the sink
 	 */
-	if (IS_SRC(fmt->pad)) {
+	if (VIMC_IS_SRC(fmt->pad)) {
 		fmt->format = *sink_fmt;
 		fmt->format.width = sink_fmt->width * sca_mult;
 		fmt->format.height = sink_fmt->height * sca_mult;
-- 
2.20.1

