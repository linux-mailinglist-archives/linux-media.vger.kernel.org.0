Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AAF631A77B
	for <lists+linux-media@lfdr.de>; Sat, 11 May 2019 12:11:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728599AbfEKKKo (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 11 May 2019 06:10:44 -0400
Received: from mail-lf1-f65.google.com ([209.85.167.65]:42797 "EHLO
        mail-lf1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726231AbfEKKKl (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 11 May 2019 06:10:41 -0400
Received: by mail-lf1-f65.google.com with SMTP id w23so5814922lfc.9;
        Sat, 11 May 2019 03:10:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=VNziprtODNmMoGsygckPqFLlWbtsE4xrmyr6LqQcJPU=;
        b=T31OFSZEB0PMhRV9D9kA0NgN8P5U3Y8KnGVmYQBnM2NPWv/aIQqN3uBtgeFkem7G78
         Q+eFPkAz5qhg9qvpO3LzK09sfpQLJKDVdKB9JES5EZMkUwxsNFLORsjFL+f+nkkSazhV
         kM8tNpeVxlAWxcafT4Vxwlh3NdLg+NUsnLxy6FghBn7W3QLig4d9sGLKUDx+LCkI67iP
         hJ881HMgoLPKDXxDgixGuOQM1IF8+07dWZKuDH7q9B6vq+qz5RzmVEkQ8G/fsQj4sjLH
         sAz0vaxL3a1kVmUba8pKcUQKXU55Fuhi1zGr9byIA2uv+0k4grL5+L8GZ+nKB9nr6lMM
         FiUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=VNziprtODNmMoGsygckPqFLlWbtsE4xrmyr6LqQcJPU=;
        b=KlYPcbLXkgrceCjpniVEk1IUexhuo89gh4D6GghUr8HqKoEigHbZ4fW2FREdaoNYdB
         kMt2WjE1iApWoThHVYP6Uj5fOH5Onqw6IIyJvFtT6dfYHgH4xJzgGOQC/kLJUeUJZZid
         vMk5bIevEQQzZ4mW46S1ju2maCxzTYYSsXyxBXn/2C6LCGtiP5PvqymxO4WafHJDiGPn
         zSRhaWij9AKuPX9n+sCl7lof+Lb/pe3aZhKqjB3rLiBP/KRUmraQdV7IRefm4xQ+/PiL
         CJFu1A+MBQTAkLGCk3VJSYC3UVf3mlwIKKJqCJwhZjs4m3HQtVJuIAP45D949oy/W1vg
         fKiw==
X-Gm-Message-State: APjAAAVhwm1RvCd43h45Y8GWB8yTcB7UJTUhhvAmh9UtwAs6q1PqrmKz
        qLrrg0fu/dVIrXhA2JKbD8M=
X-Google-Smtp-Source: APXvYqxsOdB2GNH5WR35dkuJsMwkCFIGpdrKb2gViuEijiUhHC7Nl7B05EOnMOYH46+uULp0wRzs7w==
X-Received: by 2002:a19:9c8f:: with SMTP id f137mr8452860lfe.94.1557569438251;
        Sat, 11 May 2019 03:10:38 -0700 (PDT)
Received: from z50.gdansk-morena.vectranet.pl (109241207190.gdansk.vectranet.pl. [109.241.207.190])
        by smtp.gmail.com with ESMTPSA id o124sm1443874lfe.92.2019.05.11.03.10.37
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sat, 11 May 2019 03:10:37 -0700 (PDT)
From:   Janusz Krzysztofik <jmkrzyszt@gmail.com>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        Janusz Krzysztofik <jmkrzyszt@gmail.com>
Subject: [PATCH v4 2/2] media: v4l2-subdev: Verify pad config argument
Date:   Sat, 11 May 2019 12:10:31 +0200
Message-Id: <20190511101031.4777-3-jmkrzyszt@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190511101031.4777-1-jmkrzyszt@gmail.com>
References: <20190511101031.4777-1-jmkrzyszt@gmail.com>
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
index cd50fcb86c47..4540d8abff5f 100644
--- a/drivers/media/v4l2-core/v4l2-subdev.c
+++ b/drivers/media/v4l2-core/v4l2-subdev.c
@@ -126,6 +126,11 @@ static inline int check_which(__u32 which)
 	       which != V4L2_SUBDEV_FORMAT_ACTIVE ? -EINVAL : 0;
 }
 
+static inline int check_cfg(__u32 which, struct v4l2_subdev_pad_config *cfg)
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
+	return check_which(sel->which) ? : check_cfg(sel->which, cfg) ? :
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

