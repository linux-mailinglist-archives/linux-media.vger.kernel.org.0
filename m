Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 62C5F44119B
	for <lists+linux-media@lfdr.de>; Mon,  1 Nov 2021 01:11:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230409AbhKAAOH (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 31 Oct 2021 20:14:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35294 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230396AbhKAAOG (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 31 Oct 2021 20:14:06 -0400
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com [IPv6:2a00:1450:4864:20::433])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 02902C061714
        for <linux-media@vger.kernel.org>; Sun, 31 Oct 2021 17:11:34 -0700 (PDT)
Received: by mail-wr1-x433.google.com with SMTP id d13so25768230wrf.11
        for <linux-media@vger.kernel.org>; Sun, 31 Oct 2021 17:11:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ZcCZdZv2McYGN4HECCxbzglyXFjRyQVs2bX/Y1cX2WI=;
        b=bLHhdugPb1jOCJ5mC3CtB8S3LFZeDahgeyhT49sV+D0mmhp9YqTqPhCnzkLiPMciFH
         CRNTRwIna6Nc6lzJnVqWDSyZVu06gjhVdmF+4Nt3YJG+9HpJUHNxkNdF+SOAB6l/9JQE
         8Xa+6U3tLuGcmWPpzi6jcK7slmR7MYmQB/z+54O1G8TDDKE/os+9Lz1yw88eV3TYZFvN
         QtJhaKJgANmsH+6gmZkuPTmGexMxjoU3NAFw9CRIskEFcH2BtgEo65UleoIB1H7iwS35
         wco10x+H3/eEC0lBMnp4iEkA0YMCD4+RtXZq+AMNKKTfPOnWo2OocXQqR4QF9q3IvPvf
         TSGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ZcCZdZv2McYGN4HECCxbzglyXFjRyQVs2bX/Y1cX2WI=;
        b=B24vu80IhYPQa/WpD2M8jeZYji3lMzz6zB5wD/3qR21v/OKvj2LYv7s2SF2CfCf9UZ
         qc3RtP2OFaDfOALm1aKLLZB482vNA2ebXXSV5WY58husCqxWVO05SYWzSrtuzwl/+rgl
         1EV7q6ooyD2uWYbWZEmx7xGFVNq0aDjYIPDK6qa14zd0slfUcpWQbti/1MRC+g8gcFPw
         SgoY4rQIrbc9fH+ihu+KGMHhM92lENS4z2LFvhxCf6JPG8g0r9wT6UuBapIyDTZh4bw7
         qMpXUCA4divC8YOXFTRzTF9l40PvjMUdMwg4u2jmhhhF3Pfzd87VYcpx/9ADJcaRNjTU
         E7LQ==
X-Gm-Message-State: AOAM531e5IUlUGRgztAD31wbxrSWHK9mQZI290H+hVkhfYCL0PNgpDyo
        OCZkUrXUCRi8ueiqRh7k5E8=
X-Google-Smtp-Source: ABdhPJwPFtvrDSuYCdn8RxzwjXpUVzbQRt3scfDctqoo1U8ob8MnaPTZhu0SHFLdlR3AXcXC8yogSQ==
X-Received: by 2002:a5d:6e8c:: with SMTP id k12mr32523080wrz.401.1635725492694;
        Sun, 31 Oct 2021 17:11:32 -0700 (PDT)
Received: from localhost.localdomain (cpc141996-chfd3-2-0-cust928.12-3.cable.virginm.net. [86.13.91.161])
        by smtp.gmail.com with ESMTPSA id k6sm12557678wri.83.2021.10.31.17.11.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 31 Oct 2021 17:11:32 -0700 (PDT)
From:   Daniel Scally <djrscally@gmail.com>
To:     Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        Daniel Scally <djrscally@gmail.com>,
        linux-media@vger.kernel.org
Cc:     Yong Zhi <yong.zhi@intel.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Bingbu Cao <bingbu.cao@intel.com>,
        Tianshu Qiu <tian.shu.qiu@intel.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Hans de Goede <hdegoede@redhat.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>
Subject: [PATCH v4 08/16] media: i2c: Add hblank control to ov8865
Date:   Mon,  1 Nov 2021 00:11:11 +0000
Message-Id: <20211101001119.46056-9-djrscally@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211101001119.46056-1-djrscally@gmail.com>
References: <20211101001119.46056-1-djrscally@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add a V4L2_CID_HBLANK control to the ov8865 driver. This is read only
with timing control intended to be done via vblanking alone.

Signed-off-by: Daniel Scally <djrscally@gmail.com>
---
 drivers/media/i2c/ov8865.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/drivers/media/i2c/ov8865.c b/drivers/media/i2c/ov8865.c
index f741c0713ca4..4b18cc80f985 100644
--- a/drivers/media/i2c/ov8865.c
+++ b/drivers/media/i2c/ov8865.c
@@ -677,6 +677,7 @@ struct ov8865_state {
 struct ov8865_ctrls {
 	struct v4l2_ctrl *link_freq;
 	struct v4l2_ctrl *pixel_rate;
+	struct v4l2_ctrl *hblank;
 	struct v4l2_ctrl *vblank;
 
 	struct v4l2_ctrl_handler handler;
@@ -2513,6 +2514,7 @@ static int ov8865_ctrls_init(struct ov8865_sensor *sensor)
 	const struct v4l2_ctrl_ops *ops = &ov8865_ctrl_ops;
 	const struct ov8865_mode *mode = sensor->state.mode;
 	unsigned int vblank_max, vblank_def;
+	unsigned int hblank;
 	int ret;
 
 	v4l2_ctrl_handler_init(handler, 32);
@@ -2550,6 +2552,13 @@ static int ov8865_ctrls_init(struct ov8865_sensor *sensor)
 				     0, 0, ov8865_test_pattern_menu);
 
 	/* Blanking */
+	hblank = mode->hts - mode->output_size_x;
+	ctrls->hblank = v4l2_ctrl_new_std(handler, ops, V4L2_CID_HBLANK, hblank,
+					  hblank, 1, hblank);
+
+	if (ctrls->hblank)
+		ctrls->hblank->flags |= V4L2_CTRL_FLAG_READ_ONLY;
+
 	vblank_max = OV8865_TIMING_MAX_VTS - mode->output_size_y;
 	vblank_def = mode->vts - mode->output_size_y;
 	ctrls->vblank = v4l2_ctrl_new_std(handler, ops, V4L2_CID_VBLANK,
@@ -2696,6 +2705,7 @@ static int ov8865_set_fmt(struct v4l2_subdev *subdev,
 	struct v4l2_mbus_framefmt *mbus_format = &format->format;
 	const struct ov8865_mode *mode;
 	u32 mbus_code = 0;
+	unsigned int hblank;
 	unsigned int index;
 	int ret = 0;
 
@@ -2740,6 +2750,10 @@ static int ov8865_set_fmt(struct v4l2_subdev *subdev,
 				 OV8865_TIMING_MAX_VTS - mode->output_size_y,
 				 1, mode->vts - mode->output_size_y);
 
+	hblank = mode->hts - mode->output_size_x;
+	__v4l2_ctrl_modify_range(sensor->ctrls.hblank, hblank, hblank, 1,
+				 hblank);
+
 complete:
 	mutex_unlock(&sensor->mutex);
 
-- 
2.25.1

