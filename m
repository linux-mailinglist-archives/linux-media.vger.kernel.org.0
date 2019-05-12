Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DC63E1AE15
	for <lists+linux-media@lfdr.de>; Sun, 12 May 2019 22:16:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727162AbfELUQ1 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 12 May 2019 16:16:27 -0400
Received: from mail-lj1-f193.google.com ([209.85.208.193]:40283 "EHLO
        mail-lj1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727095AbfELUQM (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 12 May 2019 16:16:12 -0400
Received: by mail-lj1-f193.google.com with SMTP id d15so9121061ljc.7;
        Sun, 12 May 2019 13:16:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=54Cg2KVLeyPm5R5v7PD/4q6SqBNJQ7DqejFPZlBrBC4=;
        b=HWOb2t35yhJBVcUxfI3fKcnBNckQur2cBj55IKa3BrM2roHViMTf8zB+eqJ86Qi7ph
         Uh0L1eueQEM/dda78pNMBteXiO5jy2NPXhj4Oil26qq6Reh9pAU2HHlC2FWUg/ojMmiJ
         KUimp5kcFQIjVDxJcLEC4vm43vDBZ0p5++p4mJfv9hLtgHUSpnZ4gio7GXYqwwK71eam
         ICQl/0XQCgDb+lD2BxSU2RTSuKpYM6IfUpBqKS5PZlK1kQivVLxx852CBx2k3MubcdhC
         0VK23wroRFWk/L0GucCHUvLYWcxdn8kmeSUaTXNKdZVT07fe32GA/2EeQ/civMQLj4MD
         w88g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=54Cg2KVLeyPm5R5v7PD/4q6SqBNJQ7DqejFPZlBrBC4=;
        b=t5LCDP3Nqzaj1h99FjAqoIdZJvG+b5ZBQ82loJumReZMdFxSa8T0Mb3/Iyh9TkypfX
         KtxaO9admFLRWh50OtMQgiDOg1VKbZQYtUcrapfc40hA2sQYno19Cr6bGIeojfIitfPO
         gWcOV5dTG00LrXjY1iH174u9yyBSphidSbwb/iAaK8Gi0CdfG/Qyrh4p+a5VqZwn2cTv
         yKiaRhHH8D6ceZlzPePpvKwWwLrAvwjrCzU1k/N13Zb5dG2KzKuC+nbF6JKs9ZGR/Nxx
         jQN4JNMIgic13ism5l7EAzzm4R+4GaWac0Aqd4J4yH0luNVoCezBp7ZUs7VbLIGOHfYZ
         EkkA==
X-Gm-Message-State: APjAAAW2cQeZcHG7bfkopBll0Dne9iShRKTEXNx8aIan1VSM6G0gEoe9
        LzqNjowL/8gzF/7GrS3dxl4=
X-Google-Smtp-Source: APXvYqxIgdt4t13bhYmF48J/CcJj6S2R2Pjb/30njayHKuirfp7Ug+x3xXxiciIH4h42cM36xbfuLg==
X-Received: by 2002:a2e:9d12:: with SMTP id t18mr11852434lji.163.1557692170428;
        Sun, 12 May 2019 13:16:10 -0700 (PDT)
Received: from z50.gdansk-morena.vectranet.pl (109241207190.gdansk.vectranet.pl. [109.241.207.190])
        by smtp.gmail.com with ESMTPSA id w20sm2360533ljd.39.2019.05.12.13.16.09
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 12 May 2019 13:16:09 -0700 (PDT)
From:   Janusz Krzysztofik <jmkrzyszt@gmail.com>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        Janusz Krzysztofik <jmkrzyszt@gmail.com>
Subject: [PATCH v5 3/4] media: v4l2-subdev: Verify v4l2_subdev_call() pointer arguments
Date:   Sun, 12 May 2019 22:15:50 +0200
Message-Id: <20190512201551.18724-4-jmkrzyszt@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190512201551.18724-1-jmkrzyszt@gmail.com>
References: <20190512201551.18724-1-jmkrzyszt@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Parameters passed to check helpers are now obtained by dereferencing
unverified pointer arguments.  Check validity of those pointers first.

Signed-off-by: Janusz Krzysztofik <jmkrzyszt@gmail.com>
---
 drivers/media/v4l2-core/v4l2-subdev.c | 27 +++++++++++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/drivers/media/v4l2-core/v4l2-subdev.c b/drivers/media/v4l2-core/v4l2-subdev.c
index 5f2264575cd7..3fc07af26c5b 100644
--- a/drivers/media/v4l2-core/v4l2-subdev.c
+++ b/drivers/media/v4l2-core/v4l2-subdev.c
@@ -141,6 +141,9 @@ static int check_pad(struct v4l2_subdev *sd, __u32 pad)
 static int check_format(struct v4l2_subdev *sd,
 			struct v4l2_subdev_format *format)
 {
+	if (WARN_ON(!format))
+		return -EINVAL;
+
 	return check_which(format->which) ? : check_pad(sd, format->pad);
 }
 
@@ -164,6 +167,9 @@ static int check_enum_mbus_code(struct v4l2_subdev *sd,
 				struct v4l2_subdev_pad_config *cfg,
 				struct v4l2_subdev_mbus_code_enum *code)
 {
+	if (WARN_ON(!code))
+		return -EINVAL;
+
 	return check_which(code->which) ? : check_pad(sd, code->pad) ? :
 	       sd->ops->pad->enum_mbus_code(sd, cfg, code);
 }
@@ -172,6 +178,9 @@ static int check_enum_frame_size(struct v4l2_subdev *sd,
 				 struct v4l2_subdev_pad_config *cfg,
 				 struct v4l2_subdev_frame_size_enum *fse)
 {
+	if (WARN_ON(!fse))
+		return -EINVAL;
+
 	return check_which(fse->which) ? : check_pad(sd, fse->pad) ? :
 	       sd->ops->pad->enum_frame_size(sd, cfg, fse);
 }
@@ -179,6 +188,9 @@ static int check_enum_frame_size(struct v4l2_subdev *sd,
 static int check_frame_interval(struct v4l2_subdev *sd,
 				struct v4l2_subdev_frame_interval *fi)
 {
+	if (WARN_ON(!fi))
+		return -EINVAL;
+
 	return check_pad(sd, fi->pad);
 }
 
@@ -200,6 +212,9 @@ static int check_enum_frame_interval(struct v4l2_subdev *sd,
 				struct v4l2_subdev_pad_config *cfg,
 				struct v4l2_subdev_frame_interval_enum *fie)
 {
+	if (WARN_ON(!fie))
+		return -EINVAL;
+
 	return check_which(fie->which) ? : check_pad(sd, fie->pad) ? :
 	       sd->ops->pad->enum_frame_interval(sd, cfg, fie);
 }
@@ -207,6 +222,9 @@ static int check_enum_frame_interval(struct v4l2_subdev *sd,
 static int check_selection(struct v4l2_subdev *sd,
 			   struct v4l2_subdev_selection *sel)
 {
+	if (WARN_ON(!sel))
+		return -EINVAL;
+
 	return check_which(sel->which) ? : check_pad(sd, sel->pad);
 }
 
@@ -228,6 +246,9 @@ static int check_set_selection(struct v4l2_subdev *sd,
 
 static int check_edid(struct v4l2_subdev *sd, struct v4l2_subdev_edid *edid)
 {
+	if (WARN_ON(!edid))
+		return -EINVAL;
+
 	if (WARN_ON(edid->blocks && edid->edid == NULL))
 		return -EINVAL;
 
@@ -247,6 +268,9 @@ static int check_set_edid(struct v4l2_subdev *sd, struct v4l2_subdev_edid *edid)
 static int check_dv_timings_cap(struct v4l2_subdev *sd,
 				struct v4l2_dv_timings_cap *cap)
 {
+	if (WARN_ON(!cap))
+		return -EINVAL;
+
 	return check_pad(sd, cap->pad) ? :
 	       sd->ops->pad->dv_timings_cap(sd, cap);
 }
@@ -254,6 +278,9 @@ static int check_dv_timings_cap(struct v4l2_subdev *sd,
 static int check_enum_dv_timings(struct v4l2_subdev *sd,
 				 struct v4l2_enum_dv_timings *dvt)
 {
+	if (WARN_ON(!dvt))
+		return -EINVAL;
+
 	return check_pad(sd, dvt->pad) ? :
 	       sd->ops->pad->enum_dv_timings(sd, dvt);
 }
-- 
2.21.0

