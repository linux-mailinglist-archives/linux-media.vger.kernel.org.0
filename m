Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9B0AB1A757
	for <lists+linux-media@lfdr.de>; Sat, 11 May 2019 11:56:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728540AbfEKJ4A (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 11 May 2019 05:56:00 -0400
Received: from mail-lj1-f194.google.com ([209.85.208.194]:45829 "EHLO
        mail-lj1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728517AbfEKJz6 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 11 May 2019 05:55:58 -0400
Received: by mail-lj1-f194.google.com with SMTP id r76so7047581lja.12;
        Sat, 11 May 2019 02:55:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=v3LnsifN6PFgBb2VzO2tJ4U8RU9lXCXFS19CDyNA6VE=;
        b=Lm77ulmdGPlf8avpG26vyeRSLoSfeC6VABXe3LBih+GrY3eJ51dxgs9mNNhvKYHLwX
         QtkWaCPACuG5baarRlCbkOHQKxfNa2lCvRidZ2NiOsKy4eLxZnk37VrRJ1oINHOFlsRN
         9NQ5OCBRnJ0ryeDuKLm67bXOnb4r1KvpVosKpgzD5ZDl6G9fECFVeT0HMihwC4dUoCwL
         L4l1AXlohBv0MtPD8HH22fsxqax4lbiRkivBdoQZF5bnrrBZDTnKZryL+GH6Y0UZ1JbW
         A5cn/xoOVLO9rVesv1x+M/Tbtq+Jt2qJMa7UEgkgpVGuJ+ixSU8FnIrwhSP+XAq9hX6d
         xCTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=v3LnsifN6PFgBb2VzO2tJ4U8RU9lXCXFS19CDyNA6VE=;
        b=RLrj3ra5aUuYjXqoidGI36ZQ/hqUO9dNplCBfyqjiUnngVqIPwJF21B5R+lRNP5r8n
         Yy0xwP0tOFhRRyrJNPFviB2GLip7sVTqORT7okkc3bNkpureYGgOusPJKAraYK7jBkcJ
         APd/mHqjyHWbwMIJS3A3aYeGjTdMyCWQPWUQHzGqwi/1qAGw6VPFpwY3NrFfQ1C7w0oB
         f7BO05+GUK1vEVJn2/pCWmkNuMD9/vYMDtOyvDvdlrDfKqul1OEAVPcnfTMTUa3tay2c
         giCBk2zmknnpUn3aNUhz2WuWhzjFAPK0nvae8zQ2IeiB6QPwrDtpjwy2G1053ia1KbbS
         4YCQ==
X-Gm-Message-State: APjAAAWlIbV0DP8JjCz1beopzrZAakGYfkBKLW+3FBfXHgfGRHrY3KpD
        bDpPuWs925u7/fH0nw3K3AtpOBXoFHI=
X-Google-Smtp-Source: APXvYqwJPizDJv7PgxQyOW00/AANujTC7PnxDrA8bgfp2lIdkEX83R3XcPz3tc93n0mXhTPDpGf4CQ==
X-Received: by 2002:a2e:91c6:: with SMTP id u6mr7537771ljg.143.1557568555021;
        Sat, 11 May 2019 02:55:55 -0700 (PDT)
Received: from z50.gdansk-morena.vectranet.pl (109241207190.gdansk.vectranet.pl. [109.241.207.190])
        by smtp.gmail.com with ESMTPSA id x6sm2126224lfn.74.2019.05.11.02.55.53
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sat, 11 May 2019 02:55:54 -0700 (PDT)
From:   Janusz Krzysztofik <jmkrzyszt@gmail.com>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        Janusz Krzysztofik <jmkrzyszt@gmail.com>
Subject: [PATCH v3 2/2] media: v4l2-subdev: Verify pad config argument
Date:   Sat, 11 May 2019 11:53:59 +0200
Message-Id: <20190511095359.21502-3-jmkrzyszt@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190511095359.21502-1-jmkrzyszt@gmail.com>
References: <20190511095359.21502-1-jmkrzyszt@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Extend parameter checks performed by v4l2_subdev_call() with a check for
a non-NULL pad config pointer if V4L2_SUBDEV_FORMAT_TRY format type is
requested so drivers don't need to care.

Signed-off-by: Janusz Krzysztofik <jmkrzyszt@gmail.com>
---
 drivers/media/v4l2-core/v4l2-subdev.c | 30 +++++++++++++++++++--------
 1 file changed, 21 insertions(+), 9 deletions(-)

diff --git a/drivers/media/v4l2-core/v4l2-subdev.c b/drivers/media/v4l2-core/v4l2-subdev.c
index cd50fcb86c47..52eb23112804 100644
--- a/drivers/media/v4l2-core/v4l2-subdev.c
+++ b/drivers/media/v4l2-core/v4l2-subdev.c
@@ -126,6 +126,11 @@ static inline int check_which(__u32 which)
 	       which != V4L2_SUBDEV_FORMAT_ACTIVE ? -EINVAL : 0;
 }
 
+static inline int check_cfg(__u32 which, v4l2_subdev_pad_config *cfg)
+{
+	return which == V4L2_SUBDEV_FORMAT_TRY && !cfg ? -EINVAL : 0;
+}
+
 #if defined(CONFIG_VIDEO_V4L2_SUBDEV_API)
 static inline int check_pad(struct v4l2_subdev *sd, __u32 pad)
 {
@@ -136,16 +141,18 @@ static inline int check_pad(struct v4l2_subdev *sd, __u32 pad)
 #endif
 
 static int check_format(struct v4l2_subdev *sd,
+			struct v4l2_subdev_pad_config *cfg,
 			struct v4l2_subdev_format *format)
 {
-	return check_which(format->which) ? : check_pad(sd, format->pad);
+	return check_which(format->which) ? :
+	       check_cfg(format->which, cfg) ? : check_pad(sd, format->pad);
 }
 
 static int check_get_fmt(struct v4l2_subdev *sd,
 			 struct v4l2_subdev_pad_config *cfg,
 			 struct v4l2_subdev_format *format)
 {
-	return check_format(sd, format) ? :
+	return check_format(sd, cfg, format) ? :
 	       sd->ops->pad->get_fmt(sd, cfg, format);
 }
 
@@ -153,7 +160,7 @@ static int check_set_fmt(struct v4l2_subdev *sd,
 			 struct v4l2_subdev_pad_config *cfg,
 			 struct v4l2_subdev_format *format)
 {
-	return check_format(sd, format) ? :
+	return check_format(sd, cfg, format) ? :
 	       sd->ops->pad->set_fmt(sd, cfg, format);
 }
 
@@ -161,7 +168,8 @@ static int check_enum_mbus_code(struct v4l2_subdev *sd,
 				struct v4l2_subdev_pad_config *cfg,
 				struct v4l2_subdev_mbus_code_enum *code)
 {
-	return check_which(code->which) ? : check_pad(sd, code->pad) ? :
+	return check_which(code->which) ? : check_cfg(code->which, cfg) ? :
+	       check_pad(sd, code->pad) ? :
 	       sd->ops->pad->enum_mbus_code(sd, cfg, code);
 }
 
@@ -169,7 +177,8 @@ static int check_enum_frame_size(struct v4l2_subdev *sd,
 				 struct v4l2_subdev_pad_config *cfg,
 				 struct v4l2_subdev_frame_size_enum *fse)
 {
-	return check_which(fse->which) ? : check_pad(sd, fse->pad) ? :
+	return check_which(fse->which) ? : check_cfg(fse->which, cfg) ? :
+	       check_pad(sd, fse->pad) ? :
 	       sd->ops->pad->enum_frame_size(sd, cfg, fse);
 }
 
@@ -197,21 +206,24 @@ static int check_enum_frame_interval(struct v4l2_subdev *sd,
 				struct v4l2_subdev_pad_config *cfg,
 				struct v4l2_subdev_frame_interval_enum *fie)
 {
-	return check_which(fie->which) ? : check_pad(sd, fie->pad) ? :
+	return check_which(fie->which) ? : check_cfg(fie->which, cfg) ? :
+	       check_pad(sd, fie->pad) ? :
 	       sd->ops->pad->enum_frame_interval(sd, cfg, fie);
 }
 
 static int check_selection(struct v4l2_subdev *sd,
+			   struct v4l2_subdev_pad_config *cfg,
 			   struct v4l2_subdev_selection *sel)
 {
-	return check_which(sel->which) ? : check_pad(sd, sel->pad);
+	return check_which(sel->which) ? :check_cfg(sel->which, cfg) ? :
+	       check_pad(sd, sel->pad);
 }
 
 static int check_get_selection(struct v4l2_subdev *sd,
 			       struct v4l2_subdev_pad_config *cfg,
 			       struct v4l2_subdev_selection *sel)
 {
-	return check_selection(sd, sel) ? :
+	return check_selection(sd, cfg, sel) ? :
 	       sd->ops->pad->get_selection(sd, cfg, sel);
 }
 
@@ -219,7 +231,7 @@ static int check_set_selection(struct v4l2_subdev *sd,
 			       struct v4l2_subdev_pad_config *cfg,
 			       struct v4l2_subdev_selection *sel)
 {
-	return check_selection(sd, sel) ? :
+	return check_selection(sd, cfg, sel) ? :
 	       sd->ops->pad->set_selection(sd, cfg, sel);
 }
 
-- 
2.21.0

