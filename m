Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7D4C43D2DC5
	for <lists+linux-media@lfdr.de>; Thu, 22 Jul 2021 22:36:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231307AbhGVTyO (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 22 Jul 2021 15:54:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45984 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231145AbhGVTyA (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 22 Jul 2021 15:54:00 -0400
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com [IPv6:2a00:1450:4864:20::431])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5420AC061757;
        Thu, 22 Jul 2021 13:34:35 -0700 (PDT)
Received: by mail-wr1-x431.google.com with SMTP id z8so48888wru.7;
        Thu, 22 Jul 2021 13:34:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=xmqc6kqrkWj1mXENQhId89XMxonfs77fQNDrmKC80v0=;
        b=SzlyWqjA7QFNOyDOP3LqMz29aZy3K7EyNhgwFOthk9YOom2CGaM0JqApgV9HvfERJ3
         +qUnJeA/9tcXbWdUmjgrC+wCgN6naQXnAOOZsfUw+8dFLkaLgBnrjBL3uEXmWYNUjHYX
         YXqi/TZu/W3hIMr48es/PohNlIVe+O+FsLw5WfWzPiOvcTZnygEI3t3M4cZboPsHFn7O
         k9EYq9SzjXlhLq/n326EhprMImHoL9cJM/1wjwbYurSI1/vvEir9fp0NL2GPlBrEVrwT
         74syMJNgzAvpQQQydQB9fLoLGESrimws303Hs/wagFTiaR1zz30VeinG0ubWXmJgR/v+
         d4kQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=xmqc6kqrkWj1mXENQhId89XMxonfs77fQNDrmKC80v0=;
        b=opsTgNXqwBtJdowJVgM50vM7IZUJZkCtUG0ZY5H6LQOe8Iu85OwYEjh5MbDvrqcaDI
         B3QDVxAlP4SWTir/RQTuIUbcT1UOA7W+otjsTUEP/DWEFaGfagRHODSGiHWzKgBlI9nN
         oJQFQRim4NCHYeHJRHLaXk7HzGTal4nPNQOud+YmlX80HgSaXOVLtGRNA7gqlpz9HKTP
         U3eNrA/dvAj73Lgg6J2JdelHie0eZxzyEZrNutstgzDcRtAXEF9tBjnLXJM1FLh0bQPq
         AbS2ljtmMkBhGk6R7iRKNerARoi3WauZ5MwbPnm4QdtbPtUIFNW6kBIjUj/cgokkrHoP
         JC+Q==
X-Gm-Message-State: AOAM531MGFmRAG8nHzpfXlJGZsOqmoY3YKNJOZ2mnhNqmKK+pyIeNBhp
        lbV/x6Uf/wPIsS6dfTZgfsU=
X-Google-Smtp-Source: ABdhPJx5kHcMQ1jMudr72mFrmprprmqIwLtMyhA3Af3ZmUkn5f612e/QZtGyf7OvcplW2Jb/Gfl0hQ==
X-Received: by 2002:a5d:64cc:: with SMTP id f12mr1708893wri.201.1626986074008;
        Thu, 22 Jul 2021 13:34:34 -0700 (PDT)
Received: from valhalla.home ([2.29.20.106])
        by smtp.gmail.com with ESMTPSA id b16sm31036455wrw.46.2021.07.22.13.34.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Jul 2021 13:34:33 -0700 (PDT)
From:   Daniel Scally <djrscally@gmail.com>
To:     Daniel Scally <djrscally@gmail.com>,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Yang Li <yang.lee@linux.alibaba.com>,
        linux-media@vger.kernel.org (open list:MEDIA INPUT INFRASTRUCTURE
        (V4L/DVB)), linux-kernel@vger.kernel.org (open list)
Cc:     Yong Zhi <yong.zhi@intel.com>, Bingbu Cao <bingbu.cao@intel.com>,
        Tianshu Qiu <tian.shu.qiu@intel.com>,
        Colin Ian King <colin.king@canonical.com>,
        laurent.pinchart@ideasonboard.com, kieran.bingham@ideasonboard.com
Subject: [PATCH 08/13] media: i2c: Add hblank control to ov8865
Date:   Thu, 22 Jul 2021 21:34:02 +0100
Message-Id: <20210722203407.3588046-9-djrscally@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210722203407.3588046-1-djrscally@gmail.com>
References: <20210722203407.3588046-1-djrscally@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add a V4L2_CID_HBLANK control to the ov8865 driver. This is read only
with timing control intended to be done via vblanking alone.

Signed-off-by: Daniel Scally <djrscally@gmail.com>
---

One of the modes defined in this driver actually has HTS as a _lower_ value
than output_size_x, which means the usual hblank = (hts - output_size_y) formula
doesn't make sense. That seems really strange to me, but the Windows driver
does it too so my understanding must be lacking there...I handled that by
flooring hblank at 0, but there may be a much better way of doing this.

 drivers/media/i2c/ov8865.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/drivers/media/i2c/ov8865.c b/drivers/media/i2c/ov8865.c
index daead1fc9314..e1d3c0d50fdc 100644
--- a/drivers/media/i2c/ov8865.c
+++ b/drivers/media/i2c/ov8865.c
@@ -660,6 +660,7 @@ struct ov8865_state {
 struct ov8865_ctrls {
 	struct v4l2_ctrl *link_freq;
 	struct v4l2_ctrl *pixel_rate;
+	struct v4l2_ctrl *hblank;
 	struct v4l2_ctrl *vblank;
 
 	struct v4l2_ctrl_handler handler;
@@ -2500,6 +2501,7 @@ static int ov8865_ctrls_init(struct ov8865_sensor *sensor)
 	const struct v4l2_ctrl_ops *ops = &ov8865_ctrl_ops;
 	const struct ov8865_mode *mode = sensor->state.mode;
 	unsigned int vblank_max, vblank_def;
+	unsigned int hblank;
 	int ret;
 
 	v4l2_ctrl_handler_init(handler, 32);
@@ -2536,6 +2538,13 @@ static int ov8865_ctrls_init(struct ov8865_sensor *sensor)
 				     0, 0, ov8865_test_pattern_menu);
 
 	/* Blanking */
+	hblank = mode->hts < mode->output_size_x ? 0 : mode->hts - mode->output_size_x;
+	ctrls->hblank = v4l2_ctrl_new_std(handler, ops, V4L2_CID_HBLANK, hblank,
+					  hblank, 1, hblank);
+
+	if (ctrls->hblank)
+		ctrls->hblank->flags |= V4L2_CTRL_FLAG_READ_ONLY;
+
 	vblank_max = OV8865_TIMING_MAX_VTS - mode->output_size_y;
 	vblank_def = mode->vts - mode->output_size_y;
 	ctrls->vblank = v4l2_ctrl_new_std(handler, ops, V4L2_CID_VBLANK,
@@ -2682,6 +2691,7 @@ static int ov8865_set_fmt(struct v4l2_subdev *subdev,
 	struct v4l2_mbus_framefmt *mbus_format = &format->format;
 	const struct ov8865_mode *mode;
 	u32 mbus_code = 0;
+	unsigned int hblank;
 	unsigned int index;
 	int ret = 0;
 
@@ -2726,6 +2736,10 @@ static int ov8865_set_fmt(struct v4l2_subdev *subdev,
 				 OV8865_TIMING_MAX_VTS - mode->output_size_y,
 				 1, mode->vts - mode->output_size_y);
 
+	hblank = mode->hts < mode->output_size_x ? 0 : mode->hts - mode->output_size_x;
+	__v4l2_ctrl_modify_range(sensor->ctrls.hblank, hblank, hblank, 1,
+				 hblank);
+
 complete:
 	mutex_unlock(&sensor->mutex);
 
-- 
2.25.1

