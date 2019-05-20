Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8FCA8242DC
	for <lists+linux-media@lfdr.de>; Mon, 20 May 2019 23:28:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726874AbfETV2P (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 20 May 2019 17:28:15 -0400
Received: from mail-lf1-f66.google.com ([209.85.167.66]:37927 "EHLO
        mail-lf1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726823AbfETV2J (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 20 May 2019 17:28:09 -0400
Received: by mail-lf1-f66.google.com with SMTP id y19so11419589lfy.5;
        Mon, 20 May 2019 14:28:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=tuUx5rxTswzkbuQluz78Oh+T0BlExwsVu21YfZxLK+k=;
        b=BCIB8l5tlKxwBlH+stHp6M8xHhRVTClHeii8cg34r+HdYuXD2crzKqq9teCgsgPYXd
         eSEvY507JeLb/9Mm5VQWjQQ5TAKOlo3Fn9nRmWQkZOV2mo6Gj73vlt5FKi3L78Oj3inQ
         in1T8map64aItOACcjkJGlH8l9XnRdvEBtO/vTPLOKMR0LhbyrBnsY8W3v/qPd7YBBkw
         KLyo6q3YlVlQJuSEdaFf88LL+ci0bdj+9uy4byuXrlfuIIoaJDtS1WTFBfDa2ZCwypp6
         Faz739TisrkEgDJiBU3h7vIJGAxlyqNuiNsueR6kABgZOpDKNIpBM70GkGchBVVV+yXF
         52Lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=tuUx5rxTswzkbuQluz78Oh+T0BlExwsVu21YfZxLK+k=;
        b=MB9dMZufy7Ua8aiM/3mSZUZ0LURjnc1atfzNlB2P6HwVzYhHTbIHvFeb1jfiO9+Str
         YiqfR1n8JGeDVcN8XNRDM6wfwBUt26DTpkJASEH34A7+vygBGIREUYbMssKHGNxzu4//
         RDcUvWG/97TohXbkJnBn97uznp8X7YYRFGne1xAX+FqA9r1BJUcqrUBIHasjjLxpK7do
         gmpd/zHywbCv4hhJNW7oLV48/S6l7jP70b6SXYHOf/i2jJOZVBGpoTrqWWbuYBbumQIF
         S4VE2S0XG3OJBWDkQAmGaAaO3vaX6+lcdC03GC5uAGmutCakLiyOw90DQ3aeoqag0Fl2
         tv6A==
X-Gm-Message-State: APjAAAVQR2tFJXMUYivIRtcSkmsCkSo0mzvT7IyCamkr8rfI4iJf9Oa+
        NtIBgmMl423tfKlqEiTR3zs=
X-Google-Smtp-Source: APXvYqxjjtC/xGNvoQJpZX3Z5AVmDxGzEG/kvhVf0BdqapbVEk8/EHH63ho0kzPow1rTrikfgOK7Vw==
X-Received: by 2002:ac2:418c:: with SMTP id z12mr6671963lfh.0.1558387687984;
        Mon, 20 May 2019 14:28:07 -0700 (PDT)
Received: from z50.gdansk-morena.vectranet.pl (109241207190.gdansk.vectranet.pl. [109.241.207.190])
        by smtp.gmail.com with ESMTPSA id q9sm4226813lfn.88.2019.05.20.14.28.06
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 20 May 2019 14:28:07 -0700 (PDT)
From:   Janusz Krzysztofik <jmkrzyszt@gmail.com>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        Janusz Krzysztofik <jmkrzyszt@gmail.com>
Subject: [PATCH v7 3/3] media: v4l2-subdev: Verify v4l2_subdev_call() pad config argument
Date:   Mon, 20 May 2019 23:27:47 +0200
Message-Id: <20190520212747.368-4-jmkrzyszt@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190520212747.368-1-jmkrzyszt@gmail.com>
References: <20190520212747.368-1-jmkrzyszt@gmail.com>
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
index 957c8e5cdfe1..34219e489be2 100644
--- a/drivers/media/v4l2-core/v4l2-subdev.c
+++ b/drivers/media/v4l2-core/v4l2-subdev.c
@@ -144,20 +144,30 @@ static inline int check_pad(struct v4l2_subdev *sd, __u32 pad)
 	return 0;
 }
 
+static int check_cfg(__u32 which, struct v4l2_subdev_pad_config *cfg)
+{
+	if (which == V4L2_SUBDEV_FORMAT_TRY && !cfg)
+		return -EINVAL;
+
+	return 0;
+}
+
 static inline int check_format(struct v4l2_subdev *sd,
+			       struct v4l2_subdev_pad_config *cfg,
 			       struct v4l2_subdev_format *format)
 {
 	if (!format)
 		return -EINVAL;
 
-	return check_which(format->which) ? : check_pad(sd, format->pad);
+	return check_which(format->which) ? : check_pad(sd, format->pad) ? :
+	       check_cfg(format->which, cfg);
 }
 
 static int call_get_fmt(struct v4l2_subdev *sd,
 			struct v4l2_subdev_pad_config *cfg,
 			struct v4l2_subdev_format *format)
 {
-	return check_format(sd, format) ? :
+	return check_format(sd, cfg, format) ? :
 	       sd->ops->pad->get_fmt(sd, cfg, format);
 }
 
@@ -165,7 +175,7 @@ static int call_set_fmt(struct v4l2_subdev *sd,
 			struct v4l2_subdev_pad_config *cfg,
 			struct v4l2_subdev_format *format)
 {
-	return check_format(sd, format) ? :
+	return check_format(sd, cfg, format) ? :
 	       sd->ops->pad->set_fmt(sd, cfg, format);
 }
 
@@ -177,6 +187,7 @@ static int call_enum_mbus_code(struct v4l2_subdev *sd,
 		return -EINVAL;
 
 	return check_which(code->which) ? : check_pad(sd, code->pad) ? :
+	       check_cfg(code->which, cfg) ? :
 	       sd->ops->pad->enum_mbus_code(sd, cfg, code);
 }
 
@@ -188,6 +199,7 @@ static int call_enum_frame_size(struct v4l2_subdev *sd,
 		return -EINVAL;
 
 	return check_which(fse->which) ? : check_pad(sd, fse->pad) ? :
+	       check_cfg(fse->which, cfg) ? :
 	       sd->ops->pad->enum_frame_size(sd, cfg, fse);
 }
 
@@ -222,23 +234,26 @@ static int call_enum_frame_interval(struct v4l2_subdev *sd,
 		return -EINVAL;
 
 	return check_which(fie->which) ? : check_pad(sd, fie->pad) ? :
+	       check_cfg(fie->which, cfg) ? :
 	       sd->ops->pad->enum_frame_interval(sd, cfg, fie);
 }
 
 static inline int check_selection(struct v4l2_subdev *sd,
+				  struct v4l2_subdev_pad_config *cfg,
 				  struct v4l2_subdev_selection *sel)
 {
 	if (!sel)
 		return -EINVAL;
 
-	return check_which(sel->which) ? : check_pad(sd, sel->pad);
+	return check_which(sel->which) ? : check_pad(sd, sel->pad) ? :
+	       check_cfg(sel->which, cfg);
 }
 
 static int call_get_selection(struct v4l2_subdev *sd,
 			      struct v4l2_subdev_pad_config *cfg,
 			      struct v4l2_subdev_selection *sel)
 {
-	return check_selection(sd, sel) ? :
+	return check_selection(sd, cfg, sel) ? :
 	       sd->ops->pad->get_selection(sd, cfg, sel);
 }
 
@@ -246,7 +261,7 @@ static int call_set_selection(struct v4l2_subdev *sd,
 			      struct v4l2_subdev_pad_config *cfg,
 			      struct v4l2_subdev_selection *sel)
 {
-	return check_selection(sd, sel) ? :
+	return check_selection(sd, cfg, sel) ? :
 	       sd->ops->pad->set_selection(sd, cfg, sel);
 }
 
-- 
2.21.0

