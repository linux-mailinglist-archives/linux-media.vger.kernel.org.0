Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 63D53244F55
	for <lists+linux-media@lfdr.de>; Fri, 14 Aug 2020 22:54:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727041AbgHNUyr (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 14 Aug 2020 16:54:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41042 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726229AbgHNUyr (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 14 Aug 2020 16:54:47 -0400
Received: from mail-lf1-x144.google.com (mail-lf1-x144.google.com [IPv6:2a00:1450:4864:20::144])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EEF5DC061385
        for <linux-media@vger.kernel.org>; Fri, 14 Aug 2020 13:54:46 -0700 (PDT)
Received: by mail-lf1-x144.google.com with SMTP id i80so5455445lfi.13
        for <linux-media@vger.kernel.org>; Fri, 14 Aug 2020 13:54:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=gh4jDH3BMdXd5cGD6HfDwKGJPSCytu5DEXM3Fm8l8r8=;
        b=LVkyRz4RQCq4E0AAaFh5AMPVNjK8SXRMgREL1S+mWhLy2y0HEANpxwfGQrpXEnLeZT
         kgVyT1iDIEFv42yugzMO7Z5kbo360HP2Uqp/+75KQ0ykOm+v5+vtjZetsfLaOEY8OsNL
         tBA+IGOXYv4zUcljx9rvfDDkesLyl0V9pylEyCsslVe0kOfpsB3950McUSNCaWAjgE3Q
         V0Uhfv0q627W/zqGjERrt/gOtoMZ/6ILfUHN1XrdndoXf3Mf3IcwBgQQaM07y/cvn33k
         IVVKLhPepc0WTxBiEtSCJJjuIAoWjVTOXt5RDgLpnhlkXVJ222ij1T10l+VLAKEmeEB0
         aoKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=gh4jDH3BMdXd5cGD6HfDwKGJPSCytu5DEXM3Fm8l8r8=;
        b=nUsRDLoBwl46KEoc75Mu94qq6ihEQsu9DjYMLPyxpJYjoKbHiL9+fZ1H+MM608Cush
         yESn9xPZSUNJ6ytMLA7H/3rlFXR3SqrkbsXclzbzO1BMAI6Co1WG4Y1uN2ucM5YmPyVP
         TWllsv4dD4EsnuQJlXlGxAqyE5OgCC7DeRXj9K3ppPMk4rlDlNYARwcGec1CEoaKIEy4
         do4RvypMjU/pIou4WTMLOBXMFxDMbQP/z5LekPgJseb8KOL6exoRK/uGf/cPEOLB1dwP
         LJQVG8L/98iPNvF+AFDpB4J5urGAOUIdHE+jntUgF5tyW3xJuQv/HvaY0kbkTYQNbmJV
         bshw==
X-Gm-Message-State: AOAM533Wu/afY7R1c5LiGJ4WiU5p1AfKp1cbaNQz9nBVqIEtM7hxO8Kr
        oXXxYLcE3YBw4Mg9ejglWSeEu7StP7jRhg==
X-Google-Smtp-Source: ABdhPJy/bsTW4rk6yhCLLdCmASmG8Ag5bgLjn2l/h51v4zcnAv5/69cvz+iuSD7jwfEMQ9fTOLdXkA==
X-Received: by 2002:a05:6512:3138:: with SMTP id p24mr2061128lfd.143.1597438485456;
        Fri, 14 Aug 2020 13:54:45 -0700 (PDT)
Received: from localhost.localdomain (37-144-159-139.broadband.corbina.ru. [37.144.159.139])
        by smtp.googlemail.com with ESMTPSA id j26sm1963601lja.111.2020.08.14.13.54.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Aug 2020 13:54:44 -0700 (PDT)
From:   Andrey Konovalov <andrey.konovalov@linaro.org>
To:     mchehab@kernel.org, robert.foss@linaro.org
Cc:     linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        peter.griffin@linaro.org,
        Andrey Konovalov <andrey.konovalov@linaro.org>
Subject: [PATCH 2/3] media: camss: add support for vidioc_enum_framesizes ioctl
Date:   Fri, 14 Aug 2020 23:54:02 +0300
Message-Id: <20200814205403.27639-3-andrey.konovalov@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200814205403.27639-1-andrey.konovalov@linaro.org>
References: <20200814205403.27639-1-andrey.konovalov@linaro.org>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

VIDIOC_ENUM_FRAMESIZES support in the video capture driver is required by
libcamera. Without this change libcamera errors out with:
"ERROR V4L2 v4l2_videodevice.cpp:1059 /dev/video0[cap]: Unable to enumerate
frame sizes: Inappropriate ioctl for device"

Signed-off-by: Andrey Konovalov <andrey.konovalov@linaro.org>
---
 .../media/platform/qcom/camss/camss-video.c   | 37 +++++++++++++++++++
 1 file changed, 37 insertions(+)

diff --git a/drivers/media/platform/qcom/camss/camss-video.c b/drivers/media/platform/qcom/camss/camss-video.c
index 90c7dd29b573..e6255f0e6174 100644
--- a/drivers/media/platform/qcom/camss/camss-video.c
+++ b/drivers/media/platform/qcom/camss/camss-video.c
@@ -18,6 +18,12 @@
 #include "camss-video.h"
 #include "camss.h"
 
+#define CAMSS_FRAME_MIN_WIDTH		1
+#define CAMSS_FRAME_MAX_WIDTH		8191
+#define CAMSS_FRAME_MIN_HEIGHT		1
+#define CAMSS_FRAME_MAX_HEIGHT_RDI	8191
+#define CAMSS_FRAME_MAX_HEIGHT_PIX	4096
+
 struct fract {
 	u8 numerator;
 	u8 denominator;
@@ -605,6 +611,36 @@ static int video_enum_fmt(struct file *file, void *fh, struct v4l2_fmtdesc *f)
 	return 0;
 }
 
+static int video_enum_framesizes(struct file *file, void *fh,
+				 struct v4l2_frmsizeenum *fsize)
+{
+	struct camss_video *video = video_drvdata(file);
+	int i;
+
+	if (fsize->index)
+		return -EINVAL;
+
+	/* Only accept pixel format present in the formats[] table */
+	for (i = 0; i < video->nformats; i++) {
+		if (video->formats[i].pixelformat == fsize->pixel_format)
+			break;
+	}
+
+	if (i == video->nformats)
+		return -EINVAL;
+
+	fsize->type = V4L2_FRMSIZE_TYPE_CONTINUOUS;
+	fsize->stepwise.min_width = CAMSS_FRAME_MIN_WIDTH;
+	fsize->stepwise.max_width = CAMSS_FRAME_MAX_WIDTH;
+	fsize->stepwise.min_height = CAMSS_FRAME_MIN_HEIGHT;
+	fsize->stepwise.max_height = (video->line_based) ?
+		CAMSS_FRAME_MAX_HEIGHT_PIX : CAMSS_FRAME_MAX_HEIGHT_RDI;
+	fsize->stepwise.step_width = 1;
+	fsize->stepwise.step_height = 1;
+
+	return 0;
+}
+
 static int video_g_fmt(struct file *file, void *fh, struct v4l2_format *f)
 {
 	struct camss_video *video = video_drvdata(file);
@@ -745,6 +781,7 @@ static int video_s_input(struct file *file, void *fh, unsigned int input)
 static const struct v4l2_ioctl_ops msm_vid_ioctl_ops = {
 	.vidioc_querycap		= video_querycap,
 	.vidioc_enum_fmt_vid_cap	= video_enum_fmt,
+	.vidioc_enum_framesizes		= video_enum_framesizes,
 	.vidioc_g_fmt_vid_cap_mplane	= video_g_fmt,
 	.vidioc_s_fmt_vid_cap_mplane	= video_s_fmt,
 	.vidioc_try_fmt_vid_cap_mplane	= video_try_fmt,
-- 
2.17.1

