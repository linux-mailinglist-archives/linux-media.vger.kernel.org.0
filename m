Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EDE4A1C301E
	for <lists+linux-media@lfdr.de>; Mon,  4 May 2020 00:36:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729242AbgECWg5 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 3 May 2020 18:36:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45696 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1729171AbgECWg5 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 3 May 2020 18:36:57 -0400
Received: from mail-lf1-x143.google.com (mail-lf1-x143.google.com [IPv6:2a00:1450:4864:20::143])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A4FDBC061A0E
        for <linux-media@vger.kernel.org>; Sun,  3 May 2020 15:36:56 -0700 (PDT)
Received: by mail-lf1-x143.google.com with SMTP id 188so8098325lfa.10
        for <linux-media@vger.kernel.org>; Sun, 03 May 2020 15:36:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=fsLmoITfufj0/sE0gvyhA4roEEC6ojkQl7XUbGvj3jo=;
        b=AB257Eb9JHzP/PGFGScK4CVGrLLETamnduKV5CO55SZl6GYgAdGAxOvw+rNXxJWROa
         dA74TT7t5sinX5ij80FnrSXd9KygUIrN/fa3xGKwp9H7tmQos/whmeW0aTqX7sBuVmc0
         QKanG0dxxH/JKxDbodsSnp9xDJbu3BlgQxcKqxrJySvMwSYnoDPKBLRncC7NUUERCICu
         5MI0G4l2sMBRpZl+D4SrgK/9DxepzCZQv/qsql5msaAg3CO0o0VmYl0+bNZE1D4kufiV
         ELfQjGSBXXReZI6KjycaHK/cSvhEKktYCrlKgkJTJXBdoeOhft+RBj/IKluBnamjaHoi
         IYzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=fsLmoITfufj0/sE0gvyhA4roEEC6ojkQl7XUbGvj3jo=;
        b=PtjnVJGR+aZ7/NGh203VmW3JCORwNRq3wxOa1kebhOF5A2bSgDpz8Uo1CSKjgFp4Xf
         hw697wKM7ugI5BQfgYmbCK/iJwDPpfp27XGVKeR6PFypFrPXrC4V1CetQJMt/5AFCGPd
         homkms9mp8JX+E5HbetTrsBRAG+uHJJSNRPxS+WPl8F3WXm/Kb04PZHEs0fE6KIwkdcA
         pBsvBo7eHI9+kJnp/+wGP5VoOMmzKb4i+IE0SFMbJkgIftOKZyW7Abbz7UWB+YJm+pw2
         9ABf4TXTAo+qpRXb2Wx37vCmeh+l1dzusbr7TAw7lWP9PODhqJFe4QW5v57gWliKrbyZ
         N3oQ==
X-Gm-Message-State: AGi0PuanRP4wlxoTb9BHegCMDcA67EA3buURGVHDBlYXT6ri+KGFgHjj
        iFLLxljYXJ9tTQaejupGks0=
X-Google-Smtp-Source: APiQypKyggBTGKBEdId+2NXuFsD5j72XpnSaeCjMTdypd3JsM+ETfzXexu8uBk9QebOPBd/HnkyPiw==
X-Received: by 2002:ac2:50d8:: with SMTP id h24mr2432885lfm.63.1588545415135;
        Sun, 03 May 2020 15:36:55 -0700 (PDT)
Received: from z50.gdansk-morena.vectranet.pl (109241122244.gdansk.vectranet.pl. [109.241.122.244])
        by smtp.gmail.com with ESMTPSA id m5sm6729297ljb.7.2020.05.03.15.36.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 03 May 2020 15:36:54 -0700 (PDT)
From:   Janusz Krzysztofik <jmkrzyszt@gmail.com>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc:     linux-media@vger.kernel.org,
        Janusz Krzysztofik <jmkrzyszt@gmail.com>
Subject: [PATCH] media: ov6650: Fix missing frame interval enumeration support
Date:   Mon,  4 May 2020 00:36:41 +0200
Message-Id: <20200503223641.29753-1-jmkrzyszt@gmail.com>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

According to v4l2-compliance utility, a video device which supports
V4L2_CAP_TIMEPERFRAME via .vidioc_s_parm() operation should also
support .vidioc_enum_frameintervals().  If the former is implemented
via a call to v4l2_s_parm_cap() which in turn calls a subdevice
.s_frame_interval() pad operation, the video device may want to
implement the latter by passing frame interval enumeration requests to
the subdevice .s_frame_interval() video operation.  If that operation
is not supported by the subdevice, the compliance test issues a
warning.

Implement the missing pad operation.  Enumerate frame intervals
possible to be set via pixel clock adjustment, as implemented by
.s_frame_interval(), but not exceding a reasonable maximum of 1 second.

Signed-off-by: Janusz Krzysztofik <jmkrzyszt@gmail.com>
---
 drivers/media/i2c/ov6650.c | 38 +++++++++++++++++++++++++++++++++-----
 1 file changed, 33 insertions(+), 5 deletions(-)

diff --git a/drivers/media/i2c/ov6650.c b/drivers/media/i2c/ov6650.c
index 91906b94f978..b8c3aff0c73d 100644
--- a/drivers/media/i2c/ov6650.c
+++ b/drivers/media/i2c/ov6650.c
@@ -738,6 +738,33 @@ static int ov6650_enum_mbus_code(struct v4l2_subdev *sd,
 	return 0;
 }
 
+static int ov6650_enum_frame_interval(struct v4l2_subdev *sd,
+				    struct v4l2_subdev_pad_config *cfg,
+				    struct v4l2_subdev_frame_interval_enum *fie)
+{
+	int i;
+
+	/* enumerate supported frame intervals not exceeding 1 second */
+	if (fie->index > CLKRC_DIV_MASK ||
+	    GET_CLKRC_DIV(fie->index) > FRAME_RATE_MAX)
+		return -EINVAL;
+
+	for (i = 0; i < ARRAY_SIZE(ov6650_codes); i++)
+		if (fie->code == ov6650_codes[i])
+			break;
+	if (i == ARRAY_SIZE(ov6650_codes))
+		return -EINVAL;
+
+	if (!fie->width || fie->width > W_CIF ||
+	    !fie->height || fie->height > H_CIF)
+		return -EINVAL;
+
+	fie->interval.numerator = GET_CLKRC_DIV(fie->index);
+	fie->interval.denominator = FRAME_RATE_MAX;
+
+	return 0;
+}
+
 static int ov6650_g_frame_interval(struct v4l2_subdev *sd,
 				   struct v4l2_subdev_frame_interval *ival)
 {
@@ -973,11 +1000,12 @@ static const struct v4l2_subdev_video_ops ov6650_video_ops = {
 };
 
 static const struct v4l2_subdev_pad_ops ov6650_pad_ops = {
-	.enum_mbus_code = ov6650_enum_mbus_code,
-	.get_selection	= ov6650_get_selection,
-	.set_selection	= ov6650_set_selection,
-	.get_fmt	= ov6650_get_fmt,
-	.set_fmt	= ov6650_set_fmt,
+	.enum_mbus_code		= ov6650_enum_mbus_code,
+	.enum_frame_interval	= ov6650_enum_frame_interval,
+	.get_selection		= ov6650_get_selection,
+	.set_selection		= ov6650_set_selection,
+	.get_fmt		= ov6650_get_fmt,
+	.set_fmt		= ov6650_set_fmt,
 };
 
 static const struct v4l2_subdev_ops ov6650_subdev_ops = {
-- 
2.24.1

