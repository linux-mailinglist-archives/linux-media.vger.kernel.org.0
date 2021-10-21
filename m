Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CB17E436CED
	for <lists+linux-media@lfdr.de>; Thu, 21 Oct 2021 23:44:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232216AbhJUVqV (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 21 Oct 2021 17:46:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55144 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232213AbhJUVqU (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 21 Oct 2021 17:46:20 -0400
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com [IPv6:2a00:1450:4864:20::431])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E8658C061764
        for <linux-media@vger.kernel.org>; Thu, 21 Oct 2021 14:44:03 -0700 (PDT)
Received: by mail-wr1-x431.google.com with SMTP id e12so818850wra.4
        for <linux-media@vger.kernel.org>; Thu, 21 Oct 2021 14:44:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=RFoNc5WK3YuWxoh0RHxbwK62szBKgK0McCCQ1W0H+24=;
        b=dGyBmuYBf22AanxILdF9k3e7ZavrKl8bqsrndWSfrZi7XuW2fXGz51OQHHZrZpYQa5
         DzLn7cWatXgGI1KfUb+OLYyiHmlrUjHXDJpk3w1a1a961vpoPXEx62RytlrInsgUuHwp
         mNi4c1/kdiyQFgw34npz9ibmA+vKUgg3em0QCHBOip3ScCzLGLNiwHPmJy20XVC0WS7H
         AFoSc6k3QMW8mLAifBZF5YdB3zFNLL5IsLk9q6MutM+IdXbGSV3Zobnc1kO7F71T60zc
         f/XNe1ZupCqGAot/e3nFDVVJuFM5xluJK0DzivqfvsFYvrEAiXi/fPbIvtB9R/1u0D1I
         d7AA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=RFoNc5WK3YuWxoh0RHxbwK62szBKgK0McCCQ1W0H+24=;
        b=3FxhW85rYHzpo6T8zTCizsO2MtV5kGUFCsGTGvkbrzykUz+MDZ6Vwi2Ziv7+IfFkaE
         w07CfJMY7R3ld3CYzyByKsx14zz/gddhRQHOB+uVtBg3VS0R/fuVwZsHpo06O8AJD6FN
         qTMdDVEKpj4xQOAfewmtDwWJmjnTNmfG1m0EFNe3zq8KQcWZtB8h0On2t0l2Q81MSGeR
         26TDTxbb0oe1Ce6fkqOOAUk3TDHcmCeDMNm/zYsntN8Lj41M7VbiVvjB8/B4suT77aaM
         eyXFCOKp4ULDlFW7mhnknmrj+N/8pb0bvz5Jlg6RRCgODmsUilK0q5VhuBf+eoRqFqTH
         r2KA==
X-Gm-Message-State: AOAM5313ZkX3lQhSJD7BghhL2cQ0BoLgoU7UqF8IoWBfzY9m8pqj+P3O
        OV51VGTrKthJAa/ghmwe1MEuz9ITzJE=
X-Google-Smtp-Source: ABdhPJz6oXyBhfWbb/n8YWV4nJAS8WLW47Gyg9Mc8mRcEjzwaoQrAVASBYbPmdfzfbfkZnbJlCyGMg==
X-Received: by 2002:adf:eccb:: with SMTP id s11mr3397639wro.22.1634852642590;
        Thu, 21 Oct 2021 14:44:02 -0700 (PDT)
Received: from localhost.localdomain (cpc141996-chfd3-2-0-cust928.12-3.cable.virginm.net. [86.13.91.161])
        by smtp.gmail.com with ESMTPSA id r205sm6378507wma.3.2021.10.21.14.44.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Oct 2021 14:44:02 -0700 (PDT)
From:   Daniel Scally <djrscally@gmail.com>
To:     linux-media@vger.kernel.org, paul.kocialkowski@bootlin.com
Cc:     Yong Zhi <yong.zhi@intel.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Bingbu Cao <bingbu.cao@intel.com>,
        Dan Scally <djrscally@gmail.com>,
        Tianshu Qiu <tian.shu.qiu@intel.com>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        hdegoede@redhat.com, laurent.pinchart@ideasonboard.com,
        kieran.bingham@ideasonboard.com
Subject: [PATCH v3 08/16] media: i2c: Add hblank control to ov8865
Date:   Thu, 21 Oct 2021 22:43:23 +0100
Message-Id: <20211021214331.1188787-9-djrscally@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211021214331.1188787-1-djrscally@gmail.com>
References: <20211021214331.1188787-1-djrscally@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add a V4L2_CID_HBLANK control to the ov8865 driver. This is read only
with timing control intended to be done via vblanking alone.

Signed-off-by: Daniel Scally <djrscally@gmail.com>
---
Changes in v3:

	- Stopped trying to accomodate the modes where HTS > output_size_x

 drivers/media/i2c/ov8865.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/drivers/media/i2c/ov8865.c b/drivers/media/i2c/ov8865.c
index e1e23b3e4311..3945883a2ed7 100644
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

