Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 747551AE12
	for <lists+linux-media@lfdr.de>; Sun, 12 May 2019 22:16:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727149AbfELUQR (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 12 May 2019 16:16:17 -0400
Received: from mail-lf1-f68.google.com ([209.85.167.68]:33922 "EHLO
        mail-lf1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727097AbfELUQN (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 12 May 2019 16:16:13 -0400
Received: by mail-lf1-f68.google.com with SMTP id v18so7502170lfi.1;
        Sun, 12 May 2019 13:16:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=TtItGs0FkM3NnCnDWxQXotXpTul745ITl9R2PbQtgGs=;
        b=hY+EwV0uZ3bHDdlvNexq9jALPBLzyYYhPWtScl0RqT+Kxrn4WN7X4Uk5g+6KexKaXK
         X/HlmLwMNmTzsBu+KuABVQ0NqPPOXdjsxdayV1UCRHuQjB+84iThseDnyupHC43ydIsh
         qpJFlzyvl4glJc4Vope2x4ZJg6v/o8PFCMEP6/wBUytAxSo+fjgRfDf27Tw5XocjVEvl
         JDyLiSrzklrcdI9ExPUgnbr3MSDKcRUImD0Huyv8EXz9aix+U5KnQ/oc4p++9+GFuApU
         8ILn1ySbYw5SV8XRMO7t1j9uT1Tl36eg9jGlhCSMwhXAp7lGHKWCXbFaq0UyB2AEX7VJ
         n4pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=TtItGs0FkM3NnCnDWxQXotXpTul745ITl9R2PbQtgGs=;
        b=m9l7Z+gQwePj6Tjsk1P0oaJgX7deiM+Iai6v35JCtaY0YGjlO2JAjHI3Z8nNyDutNz
         Sqh6AF936/FtMc5/QbdSX+CRpRxWr3Ftg4SwvpI1+/y+Ug8dmraPLmrm9dv8n3sgGDBX
         puB2U5GOwIJx9q6N2R3mkFZeXuzHnhMtznhAy1oS9D7sz9PR7nyjPY67xsssa03pMGmu
         EE6wm3LA7zxxHvCvHP1CsO5dkBdxZ8Hcoe99m7sGvcoxVzbI8NzbelK+OWNOcUqaLSeX
         DCYEPDJozrlaayr0Ccm0yIhrgvrMoQVq7H0hRuHeFdGDEbnWUW2wFFqjxIZLkAaMY5Wy
         rZjA==
X-Gm-Message-State: APjAAAVlwHX7UvKNo0iEr12yWkT+ezbbVELi9HSVa2lOx1iikafnKRyQ
        omy6TbNJilt/L109VidrYjQ=
X-Google-Smtp-Source: APXvYqwR2ALS3zet1OsLsKMHvSUdN0Qlhth88/6Q+VTp82e83lzlk+FPwX3cb042SxwknKX28TrERg==
X-Received: by 2002:a19:c394:: with SMTP id t142mr7034168lff.102.1557692171588;
        Sun, 12 May 2019 13:16:11 -0700 (PDT)
Received: from z50.gdansk-morena.vectranet.pl (109241207190.gdansk.vectranet.pl. [109.241.207.190])
        by smtp.gmail.com with ESMTPSA id w20sm2360533ljd.39.2019.05.12.13.16.10
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 12 May 2019 13:16:11 -0700 (PDT)
From:   Janusz Krzysztofik <jmkrzyszt@gmail.com>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        Janusz Krzysztofik <jmkrzyszt@gmail.com>
Subject: [PATCH v5 4/4] media: v4l2-subdev: Verify v4l2_subdev_call() pad config argument
Date:   Sun, 12 May 2019 22:15:51 +0200
Message-Id: <20190512201551.18724-5-jmkrzyszt@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190512201551.18724-1-jmkrzyszt@gmail.com>
References: <20190512201551.18724-1-jmkrzyszt@gmail.com>
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
 drivers/media/v4l2-core/v4l2-subdev.c | 27 +++++++++++++++++++++------
 1 file changed, 21 insertions(+), 6 deletions(-)

diff --git a/drivers/media/v4l2-core/v4l2-subdev.c b/drivers/media/v4l2-core/v4l2-subdev.c
index 3fc07af26c5b..fc8c308fb060 100644
--- a/drivers/media/v4l2-core/v4l2-subdev.c
+++ b/drivers/media/v4l2-core/v4l2-subdev.c
@@ -138,20 +138,30 @@ static int check_pad(struct v4l2_subdev *sd, __u32 pad)
 	return 0;
 }
 
+static int check_cfg(__u32 which, struct v4l2_subdev_pad_config *cfg)
+{
+	if (WARN_ON(which == V4L2_SUBDEV_FORMAT_TRY && !cfg))
+		return -EINVAL;
+
+	return 0;
+}
+
 static int check_format(struct v4l2_subdev *sd,
+			struct v4l2_subdev_pad_config *cfg,
 			struct v4l2_subdev_format *format)
 {
 	if (WARN_ON(!format))
 		return -EINVAL;
 
-	return check_which(format->which) ? : check_pad(sd, format->pad);
+	return check_which(format->which) ? : check_pad(sd, format->pad) ? :
+	       check_cfg(format->which, cfg);
 }
 
 static int check_get_fmt(struct v4l2_subdev *sd,
 			 struct v4l2_subdev_pad_config *cfg,
 			 struct v4l2_subdev_format *format)
 {
-	return check_format(sd, format) ? :
+	return check_format(sd, cfg, format) ? :
 	       sd->ops->pad->get_fmt(sd, cfg, format);
 }
 
@@ -159,7 +169,7 @@ static int check_set_fmt(struct v4l2_subdev *sd,
 			 struct v4l2_subdev_pad_config *cfg,
 			 struct v4l2_subdev_format *format)
 {
-	return check_format(sd, format) ? :
+	return check_format(sd, cfg, format) ? :
 	       sd->ops->pad->set_fmt(sd, cfg, format);
 }
 
@@ -171,6 +181,7 @@ static int check_enum_mbus_code(struct v4l2_subdev *sd,
 		return -EINVAL;
 
 	return check_which(code->which) ? : check_pad(sd, code->pad) ? :
+	       check_cfg(code->which, cfg) ? :
 	       sd->ops->pad->enum_mbus_code(sd, cfg, code);
 }
 
@@ -182,6 +193,7 @@ static int check_enum_frame_size(struct v4l2_subdev *sd,
 		return -EINVAL;
 
 	return check_which(fse->which) ? : check_pad(sd, fse->pad) ? :
+	       check_cfg(fse->which, cfg) ? :
 	       sd->ops->pad->enum_frame_size(sd, cfg, fse);
 }
 
@@ -216,23 +228,26 @@ static int check_enum_frame_interval(struct v4l2_subdev *sd,
 		return -EINVAL;
 
 	return check_which(fie->which) ? : check_pad(sd, fie->pad) ? :
+	       check_cfg(fie->which, cfg) ? :
 	       sd->ops->pad->enum_frame_interval(sd, cfg, fie);
 }
 
 static int check_selection(struct v4l2_subdev *sd,
+			   struct v4l2_subdev_pad_config *cfg,
 			   struct v4l2_subdev_selection *sel)
 {
 	if (WARN_ON(!sel))
 		return -EINVAL;
 
-	return check_which(sel->which) ? : check_pad(sd, sel->pad);
+	return check_which(sel->which) ? : check_pad(sd, sel->pad) ? :
+	       check_cfg(sel->which, cfg);
 }
 
 static int check_get_selection(struct v4l2_subdev *sd,
 			       struct v4l2_subdev_pad_config *cfg,
 			       struct v4l2_subdev_selection *sel)
 {
-	return check_selection(sd, sel) ? :
+	return check_selection(sd, cfg, sel) ? :
 	       sd->ops->pad->get_selection(sd, cfg, sel);
 }
 
@@ -240,7 +255,7 @@ static int check_set_selection(struct v4l2_subdev *sd,
 			       struct v4l2_subdev_pad_config *cfg,
 			       struct v4l2_subdev_selection *sel)
 {
-	return check_selection(sd, sel) ? :
+	return check_selection(sd, cfg, sel) ? :
 	       sd->ops->pad->set_selection(sd, cfg, sel);
 }
 
-- 
2.21.0

