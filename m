Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 17D271E554
	for <lists+linux-media@lfdr.de>; Wed, 15 May 2019 00:51:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726604AbfENWur (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 14 May 2019 18:50:47 -0400
Received: from mail-lf1-f66.google.com ([209.85.167.66]:44536 "EHLO
        mail-lf1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726148AbfENWuq (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 14 May 2019 18:50:46 -0400
Received: by mail-lf1-f66.google.com with SMTP id n134so422342lfn.11;
        Tue, 14 May 2019 15:50:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=1rx9zi0+dBwzWhCAnehpW1jo63CCpuuF5dbnm5AJnK4=;
        b=jptrgNJIwGoHcF23WHxnIABzXHDdVqFQ4D68CgDCPeUuGZwt/ZaHhksybmkP4I393B
         SJ2mA5B4JYbTeq2DXY8LzHk94AD3LhrIIPQf1GbXM9iuMrQ5RXtGmiuuDuIUWlHpSAsf
         55EqElcgixkgxpFXx0Qlb9YE0ynC1yIhiaAiTvsyA0bYTmZVsFo0LqU8nfQpMUHtnKa6
         j+cGrB5pNpgoQRQ+nFm/wr4QU4fxZWINsR0ngd2m5WY74wEOuo2YksBi9XMLw2ptlFv9
         t4AAb4QfNrN7RlQacXt/NTT7RfcGU5omzGlIkeKsjTcXeYkcvbkJQTSihr52t+9eHaj0
         TcoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=1rx9zi0+dBwzWhCAnehpW1jo63CCpuuF5dbnm5AJnK4=;
        b=GFDtEt9YDEVRNB+TxFXY24jpcMqLY43Y1j5kzp0Gzl18aejj++GkEyKVESr7BRjPxQ
         Gmzqs8E0ILXc8KEapXXLBw+2JqTnAzUgMHjj1Zv2Pye/+oFXnKo36Aa+bcS4sNpbXFCn
         hv3oSLCJE+o5jllHynwjsAjEDa2ECqPfYNt0PO1oRmLlVEvUoj+NpC1OfSHtguKNUz4d
         rO++UnO9+RZ9Buf72k+uITVE7UVt6BXe6a/j1IpjlR6GACkoa+VDtDAfEeTCalh80Smq
         cjfAAoo9kmod1pqc00d75h5Xl2JYWe4YBjEbDDFE8WRJj+6V9BuOidnhuKiZ9ynSnzva
         jkFg==
X-Gm-Message-State: APjAAAVNir9HyXjurwz8PBmnValcEXTD+qfHqi1ikExt0U5cBqQ89sbi
        ijoF+G+/qKK07naWZsvlWQA=
X-Google-Smtp-Source: APXvYqzahX8ydONRpr1+m+dpcXLa17qHUUKxDc/3JbfyMgL0C4a2N8r5Xg37Z2OFax7BjhSAH5vusQ==
X-Received: by 2002:ac2:4919:: with SMTP id n25mr5345902lfi.114.1557874243859;
        Tue, 14 May 2019 15:50:43 -0700 (PDT)
Received: from z50.gdansk-morena.vectranet.pl (109241207190.gdansk.vectranet.pl. [109.241.207.190])
        by smtp.gmail.com with ESMTPSA id s6sm50190lje.89.2019.05.14.15.50.42
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 14 May 2019 15:50:43 -0700 (PDT)
From:   Janusz Krzysztofik <jmkrzyszt@gmail.com>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        Janusz Krzysztofik <jmkrzyszt@gmail.com>
Subject: [PATCH v6 2/3] media: v4l2-subdev: Verify v4l2_subdev_call() pointer arguments
Date:   Wed, 15 May 2019 00:48:22 +0200
Message-Id: <20190514224823.11564-3-jmkrzyszt@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190514224823.11564-1-jmkrzyszt@gmail.com>
References: <20190514224823.11564-1-jmkrzyszt@gmail.com>
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
index c61c95007d89..6933f30e5041 100644
--- a/drivers/media/v4l2-core/v4l2-subdev.c
+++ b/drivers/media/v4l2-core/v4l2-subdev.c
@@ -141,6 +141,9 @@ static inline int check_pad(struct v4l2_subdev *sd, __u32 pad)
 static inline int check_format(struct v4l2_subdev *sd,
 			       struct v4l2_subdev_format *format)
 {
+	if (!format)
+		return -EINVAL;
+
 	return check_which(format->which) ? : check_pad(sd, format->pad);
 }
 
@@ -164,6 +167,9 @@ static int call_enum_mbus_code(struct v4l2_subdev *sd,
 			       struct v4l2_subdev_pad_config *cfg,
 			       struct v4l2_subdev_mbus_code_enum *code)
 {
+	if (!code)
+		return -EINVAL;
+
 	return check_which(code->which) ? : check_pad(sd, code->pad) ? :
 	       sd->ops->pad->enum_mbus_code(sd, cfg, code);
 }
@@ -172,6 +178,9 @@ static int call_enum_frame_size(struct v4l2_subdev *sd,
 				struct v4l2_subdev_pad_config *cfg,
 				struct v4l2_subdev_frame_size_enum *fse)
 {
+	if (!fse)
+		return -EINVAL;
+
 	return check_which(fse->which) ? : check_pad(sd, fse->pad) ? :
 	       sd->ops->pad->enum_frame_size(sd, cfg, fse);
 }
@@ -179,6 +188,9 @@ static int call_enum_frame_size(struct v4l2_subdev *sd,
 static inline int check_frame_interval(struct v4l2_subdev *sd,
 				       struct v4l2_subdev_frame_interval *fi)
 {
+	if (!fi)
+		return -EINVAL;
+
 	return check_pad(sd, fi->pad);
 }
 
@@ -200,6 +212,9 @@ static int call_enum_frame_interval(struct v4l2_subdev *sd,
 				    struct v4l2_subdev_pad_config *cfg,
 				    struct v4l2_subdev_frame_interval_enum *fie)
 {
+	if (!fie)
+		return -EINVAL;
+
 	return check_which(fie->which) ? : check_pad(sd, fie->pad) ? :
 	       sd->ops->pad->enum_frame_interval(sd, cfg, fie);
 }
@@ -207,6 +222,9 @@ static int call_enum_frame_interval(struct v4l2_subdev *sd,
 static inline int check_selection(struct v4l2_subdev *sd,
 				  struct v4l2_subdev_selection *sel)
 {
+	if (!sel)
+		return -EINVAL;
+
 	return check_which(sel->which) ? : check_pad(sd, sel->pad);
 }
 
@@ -229,6 +247,9 @@ static int call_set_selection(struct v4l2_subdev *sd,
 static inline int check_edid(struct v4l2_subdev *sd,
 			     struct v4l2_subdev_edid *edid)
 {
+	if (!edid)
+		return -EINVAL;
+
 	if (edid->blocks && edid->edid == NULL)
 		return -EINVAL;
 
@@ -248,6 +269,9 @@ static int call_set_edid(struct v4l2_subdev *sd, struct v4l2_subdev_edid *edid)
 static int call_dv_timings_cap(struct v4l2_subdev *sd,
 			       struct v4l2_dv_timings_cap *cap)
 {
+	if (!cap)
+		return -EINVAL;
+
 	return check_pad(sd, cap->pad) ? :
 	       sd->ops->pad->dv_timings_cap(sd, cap);
 }
@@ -255,6 +279,9 @@ static int call_dv_timings_cap(struct v4l2_subdev *sd,
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

