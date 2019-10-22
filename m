Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 975D6DFEB5
	for <lists+linux-media@lfdr.de>; Tue, 22 Oct 2019 09:52:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388060AbfJVHwC (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 22 Oct 2019 03:52:02 -0400
Received: from mail-pg1-f193.google.com ([209.85.215.193]:37653 "EHLO
        mail-pg1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387938AbfJVHwC (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 22 Oct 2019 03:52:02 -0400
Received: by mail-pg1-f193.google.com with SMTP id p1so9452575pgi.4
        for <linux-media@vger.kernel.org>; Tue, 22 Oct 2019 00:52:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=V0lNrhcXGrxTSoS9sPL4rUnFoomrSJ0k6V1kPRPC1ZA=;
        b=BtFNAlO1a+MbmaRdlfLEiwrkW+eLstGnY9fwaxqChU7BDL0BofASMtpeQnUHLEwtZQ
         6DukKLg9co5lXD6f6+cgxedySDxwknAC89JIFOEsgdacpu0eYb+yQx8cNgnfy9u+j4kR
         uRGTHTKFJI/QpDcYiXPSe+MUNYzs/DG9/QTw380SDAToIw2rnVH/Zdmmd1eREbGpMZyT
         tMT3CsmvROYOqgnYq2fAqOBO2NAdvS3BqVBjuaWLP1/qCa7GLeB4vYg5hBHMRB54cXNZ
         xtFhOXGwY2uGEEzUEik9fV61EFFvJeR8FHsMiViZ4GGHewaYpBX+k0xBQSwuScysZK+6
         LPIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=V0lNrhcXGrxTSoS9sPL4rUnFoomrSJ0k6V1kPRPC1ZA=;
        b=aol8yxpeI45vR1R8aHaBumkUE4LufdOnvoxyS4J0lrTCP6aP4m0q0llDHp6b0Elx20
         h1QZtzj+Bn8v+bS5XV9MfotKM9S6XERNAaAfasR0M5UshnaMT2SFxoCk9LyNx45QVXsh
         gxD0wOVk7F3XLiNdgbGSbsy0T4HD863RoEQMCxY1Sn8mDUH2LqkoKmH1Yj0vNbLihS9M
         6RuAIw9cUwZROVnwr8Ndeiep7zEnELYvRkVHiEyKzQOI4JD6YvhcW3reVc4qmcHpxbru
         Cnu0WhuOJdvR/sa5Jfw2Cnp7YaCjRCm4YO8tW6irycw/u3liYX/V22YMcsNBjgmdyDjz
         RGGg==
X-Gm-Message-State: APjAAAUtfPAXChVj8/NMfvSkblD4/36iqPFijWcQ59atwh7rviYYqHNp
        zq0fN/mBrFBCRw9fe5/bj5ccrGf9
X-Google-Smtp-Source: APXvYqwn0ASS0BTvDjpuw2Inp+IzF9jb8UHjJsPhKF4Uce4jj6NupFWDl+GArhR/pG09+quV0WwSHA==
X-Received: by 2002:a17:90a:d588:: with SMTP id v8mr2939926pju.51.1571730719873;
        Tue, 22 Oct 2019 00:51:59 -0700 (PDT)
Received: from bnva-HP-Pavilion-g6-Notebook-PC.domain.name ([117.248.69.110])
        by smtp.gmail.com with ESMTPSA id w6sm19611773pfw.84.2019.10.22.00.51.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Oct 2019 00:51:59 -0700 (PDT)
From:   Vandana BN <bnvandana@gmail.com>
To:     linux-media@vger.kernel.org,
        linux-kernel-mentees@lists.linuxfoundation.org
Cc:     hverkuil@xs4all.nl, Vandana BN <bnvandana@gmail.com>
Subject: [PATCH 1/2] v4l2-core: fix touch support in v4l_g_fmt
Date:   Tue, 22 Oct 2019 13:21:40 +0530
Message-Id: <20191022075141.21069-2-bnvandana@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191022075141.21069-1-bnvandana@gmail.com>
References: <20191022075141.21069-1-bnvandana@gmail.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

v4l_s_fmt, for VFL_TYPE_TOUCH, sets unneeded members of
the v4l2_pix_format structure to default values.This was
missing in v4l_g_fmt, which would lead to failures in
v4l2-compliance tests.

Signed-off-by: Vandana BN <bnvandana@gmail.com>
---
 drivers/media/v4l2-core/v4l2-ioctl.c | 33 +++++++++++++++-------------
 1 file changed, 18 insertions(+), 15 deletions(-)

diff --git a/drivers/media/v4l2-core/v4l2-ioctl.c b/drivers/media/v4l2-core/v4l2-ioctl.c
index 2753073cf340..0ade0540ee5b 100644
--- a/drivers/media/v4l2-core/v4l2-ioctl.c
+++ b/drivers/media/v4l2-core/v4l2-ioctl.c
@@ -1477,10 +1477,26 @@ static int v4l_enum_fmt(const struct v4l2_ioctl_ops *ops,
 	return ret;
 }
 
+static void v4l_pix_format_touch(struct v4l2_pix_format *p)
+{
+	/*
+	 * The v4l2_pix_format structure contains fields that make no sense for
+	 * touch. Set them to default values in this case.
+	 */
+
+	p->field = V4L2_FIELD_NONE;
+	p->colorspace = V4L2_COLORSPACE_RAW;
+	p->flags = 0;
+	p->ycbcr_enc = 0;
+	p->quantization = 0;
+	p->xfer_func = 0;
+}
+
 static int v4l_g_fmt(const struct v4l2_ioctl_ops *ops,
 				struct file *file, void *fh, void *arg)
 {
 	struct v4l2_format *p = arg;
+	struct video_device *vfd = video_devdata(file);
 	int ret = check_fmt(file, p->type);
 
 	if (ret)
@@ -1518,6 +1534,8 @@ static int v4l_g_fmt(const struct v4l2_ioctl_ops *ops,
 		ret = ops->vidioc_g_fmt_vid_cap(file, fh, arg);
 		/* just in case the driver zeroed it again */
 		p->fmt.pix.priv = V4L2_PIX_FMT_PRIV_MAGIC;
+		if (vfd->vfl_type == VFL_TYPE_TOUCH)
+			v4l_pix_format_touch(&p->fmt.pix);
 		return ret;
 	case V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE:
 		return ops->vidioc_g_fmt_vid_cap_mplane(file, fh, arg);
@@ -1555,21 +1573,6 @@ static int v4l_g_fmt(const struct v4l2_ioctl_ops *ops,
 	return -EINVAL;
 }
 
-static void v4l_pix_format_touch(struct v4l2_pix_format *p)
-{
-	/*
-	 * The v4l2_pix_format structure contains fields that make no sense for
-	 * touch. Set them to default values in this case.
-	 */
-
-	p->field = V4L2_FIELD_NONE;
-	p->colorspace = V4L2_COLORSPACE_RAW;
-	p->flags = 0;
-	p->ycbcr_enc = 0;
-	p->quantization = 0;
-	p->xfer_func = 0;
-}
-
 static int v4l_s_fmt(const struct v4l2_ioctl_ops *ops,
 				struct file *file, void *fh, void *arg)
 {
-- 
2.17.1

