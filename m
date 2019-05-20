Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 05901242D9
	for <lists+linux-media@lfdr.de>; Mon, 20 May 2019 23:28:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726903AbfETV2J (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 20 May 2019 17:28:09 -0400
Received: from mail-lj1-f195.google.com ([209.85.208.195]:45562 "EHLO
        mail-lj1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726111AbfETV2J (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 20 May 2019 17:28:09 -0400
Received: by mail-lj1-f195.google.com with SMTP id r76so13828118lja.12;
        Mon, 20 May 2019 14:28:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=3R7ixVKM6zOMiz2TvWVdO2HoRuQB+VdzbR0JHrSAmz4=;
        b=dRoowEb/G+aEcAHanmg3U08omMWjQY4dEK1N4hInhBc63c68nrZ+D+sP6nQOKGrR0Z
         0bxgfaxzBNnC75Ba5ZMcopNI+IrG6iCFjeZ0Oh5uRS2lKFik7dINAc2LueEUdevyj/LB
         +uWOBTtjHs7zRDREX3BlHIPqaOS+6gFvC7p7N54spMswqlDebdrTb7keSQW7iqPTP0wV
         bXzPOym8dGFneYkT/ITa8pWH6mPVzPUsY2FgB/R31SJGr4lY5RZ+VIvhTQWj54miEJ0Q
         Z38t6+w72o56BfJ36VBFDckDb1Tyao/bkC3t4z/awKxZMBVBJTxs4/45bKH2D85sK0/Z
         OM+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=3R7ixVKM6zOMiz2TvWVdO2HoRuQB+VdzbR0JHrSAmz4=;
        b=LDQVAcyyNwedM0lHwAXyoYZJACtGlw/rxgr0fQ4+nD79HY98PSc62aACsVBw574g8p
         hYSyYHgoSOB/iyPh1BtibT0HEOH9+INrhKNeMZCkGQf7ntIIu54JPjgHWfB/RQegjJdB
         hS9j1pbgU6a20m8O/CxZtURrpOO2cOh8lKt/yDmv/IU5ceXGgIbB5G86AjwDTljTr3yV
         y+U2pNfthCjN2hT+A/mB16RWlSB0lIfozZVNlxyznR5q2FqjHgmb43RP0J1o8bhZc3QU
         inCUwIbEp2CtYT0h7zYSMh1/ss1mfz8XdFmOyPVOEBIOKrtE4IHD3qVWRm8ocwwtLtPP
         0rTQ==
X-Gm-Message-State: APjAAAXysJ64xWS63MLs99l4y+XwDoCX4wTsTjIGX6EH/Xz7hXfGdtVp
        wr52A4NYt6smSTGAqTjTC1U=
X-Google-Smtp-Source: APXvYqzuRl7owbqH/gPtN0uzdxPX+4DGf/ZjbDRXzKHwiNtY0InKlLjTVzACqleeRA/22MIFNH5LEQ==
X-Received: by 2002:a2e:98d5:: with SMTP id s21mr19901599ljj.142.1558387686591;
        Mon, 20 May 2019 14:28:06 -0700 (PDT)
Received: from z50.gdansk-morena.vectranet.pl (109241207190.gdansk.vectranet.pl. [109.241.207.190])
        by smtp.gmail.com with ESMTPSA id q9sm4226813lfn.88.2019.05.20.14.28.05
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 20 May 2019 14:28:06 -0700 (PDT)
From:   Janusz Krzysztofik <jmkrzyszt@gmail.com>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        Janusz Krzysztofik <jmkrzyszt@gmail.com>
Subject: [PATCH v7 2/3] media: v4l2-subdev: Verify v4l2_subdev_call() pointer arguments
Date:   Mon, 20 May 2019 23:27:46 +0200
Message-Id: <20190520212747.368-3-jmkrzyszt@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190520212747.368-1-jmkrzyszt@gmail.com>
References: <20190520212747.368-1-jmkrzyszt@gmail.com>
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
index 59fdc0f08870..957c8e5cdfe1 100644
--- a/drivers/media/v4l2-core/v4l2-subdev.c
+++ b/drivers/media/v4l2-core/v4l2-subdev.c
@@ -147,6 +147,9 @@ static inline int check_pad(struct v4l2_subdev *sd, __u32 pad)
 static inline int check_format(struct v4l2_subdev *sd,
 			       struct v4l2_subdev_format *format)
 {
+	if (!format)
+		return -EINVAL;
+
 	return check_which(format->which) ? : check_pad(sd, format->pad);
 }
 
@@ -170,6 +173,9 @@ static int call_enum_mbus_code(struct v4l2_subdev *sd,
 			       struct v4l2_subdev_pad_config *cfg,
 			       struct v4l2_subdev_mbus_code_enum *code)
 {
+	if (!code)
+		return -EINVAL;
+
 	return check_which(code->which) ? : check_pad(sd, code->pad) ? :
 	       sd->ops->pad->enum_mbus_code(sd, cfg, code);
 }
@@ -178,6 +184,9 @@ static int call_enum_frame_size(struct v4l2_subdev *sd,
 				struct v4l2_subdev_pad_config *cfg,
 				struct v4l2_subdev_frame_size_enum *fse)
 {
+	if (!fse)
+		return -EINVAL;
+
 	return check_which(fse->which) ? : check_pad(sd, fse->pad) ? :
 	       sd->ops->pad->enum_frame_size(sd, cfg, fse);
 }
@@ -185,6 +194,9 @@ static int call_enum_frame_size(struct v4l2_subdev *sd,
 static inline int check_frame_interval(struct v4l2_subdev *sd,
 				       struct v4l2_subdev_frame_interval *fi)
 {
+	if (!fi)
+		return -EINVAL;
+
 	return check_pad(sd, fi->pad);
 }
 
@@ -206,6 +218,9 @@ static int call_enum_frame_interval(struct v4l2_subdev *sd,
 				    struct v4l2_subdev_pad_config *cfg,
 				    struct v4l2_subdev_frame_interval_enum *fie)
 {
+	if (!fie)
+		return -EINVAL;
+
 	return check_which(fie->which) ? : check_pad(sd, fie->pad) ? :
 	       sd->ops->pad->enum_frame_interval(sd, cfg, fie);
 }
@@ -213,6 +228,9 @@ static int call_enum_frame_interval(struct v4l2_subdev *sd,
 static inline int check_selection(struct v4l2_subdev *sd,
 				  struct v4l2_subdev_selection *sel)
 {
+	if (!sel)
+		return -EINVAL;
+
 	return check_which(sel->which) ? : check_pad(sd, sel->pad);
 }
 
@@ -235,6 +253,9 @@ static int call_set_selection(struct v4l2_subdev *sd,
 static inline int check_edid(struct v4l2_subdev *sd,
 			     struct v4l2_subdev_edid *edid)
 {
+	if (!edid)
+		return -EINVAL;
+
 	if (edid->blocks && edid->edid == NULL)
 		return -EINVAL;
 
@@ -254,6 +275,9 @@ static int call_set_edid(struct v4l2_subdev *sd, struct v4l2_subdev_edid *edid)
 static int call_dv_timings_cap(struct v4l2_subdev *sd,
 			       struct v4l2_dv_timings_cap *cap)
 {
+	if (!cap)
+		return -EINVAL;
+
 	return check_pad(sd, cap->pad) ? :
 	       sd->ops->pad->dv_timings_cap(sd, cap);
 }
@@ -261,6 +285,9 @@ static int call_dv_timings_cap(struct v4l2_subdev *sd,
 static int call_enum_dv_timings(struct v4l2_subdev *sd,
 				struct v4l2_enum_dv_timings *dvt)
 {
+	if (!dvt)
+		return -EINVAL;
+
 	return check_pad(sd, dvt->pad) ? :
 	       sd->ops->pad->enum_dv_timings(sd, dvt);
 }
-- 
2.21.0

