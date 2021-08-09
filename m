Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 568E23E4FA3
	for <lists+linux-media@lfdr.de>; Tue, 10 Aug 2021 00:59:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236956AbhHIW73 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 9 Aug 2021 18:59:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49284 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236955AbhHIW72 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 9 Aug 2021 18:59:28 -0400
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com [IPv6:2a00:1450:4864:20::330])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 862CDC0613D3
        for <linux-media@vger.kernel.org>; Mon,  9 Aug 2021 15:59:07 -0700 (PDT)
Received: by mail-wm1-x330.google.com with SMTP id m28-20020a05600c3b1cb02902b5a8c22575so1159924wms.0
        for <linux-media@vger.kernel.org>; Mon, 09 Aug 2021 15:59:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=9Un+B0jhmejBmLZ3u6D+YjTbwChkMhGgiY8G0w2wqxM=;
        b=c9p0qVF4oqHhyd/H5bAGg68H0Rq3obZEgX6s+2GKOkPu8znLSiKRcWmfR3gJeg5gvO
         VLD5X4NNDjt/EdhFf4fJpeaJMl82fNdz0zMxNWokBsvq6MvYQF1A/X9n8LvzmjIgYLKL
         dAkQJvzOp+aizHsu5+1H/QftHl/AMRzkP/97Vo5jNkm8nBP8uV5oc3PyNZKXieLhpf9k
         u+Qw76/In+54o6FJD0PA8Nb0ZZCljgBHbqpMIZ4shbVmThMHc6SoZvD82sBcGYk3L3O8
         xRnycHmIAJaqM/VPHL1FGFgZu7Iw6TEUW1oh06Ox/Fgaccq3Ffy5e6imgo+Qp0ILH5Au
         TOWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=9Un+B0jhmejBmLZ3u6D+YjTbwChkMhGgiY8G0w2wqxM=;
        b=FkxLIv0Cs0YpkFJAgBi0xmeKh0PShduEU0i6gizXsVBc4mvpai3hn4GkT6yg8CPpG6
         BBg59k3uGjmE2XC41SYvp+VDj+WX+QfIC/WXg4kN68M+jazQxp7MsTXsa2wpEvSFHN5E
         nT7s2/ThSzMKgWGP60TbZtNVn5LO/7/fuH+Ie1Nw1BUrAKUI3AeHpGNEAEkqva1uziVd
         CRO0K34kd9mEfIz1bqvc2TtiTlAhWAnC0JuQb1reL65FEmCbVzd4oOhftqL5OfyGlzGu
         EDWhbWMNr6zpiAP3IoB+VqA7Yel9YCMv5U9wHYEriG2QBCY1nsyd7yxKZHmB/sUSpOfT
         nPNg==
X-Gm-Message-State: AOAM53269se5OJuy0iiZM/UDWwsUJWgp7DzzDF3PFu/Su0BLb2hOgd1j
        u3cxeiYRtu+NDYh4ihbVk7Y=
X-Google-Smtp-Source: ABdhPJxoi72E/137uXqiyBw4nnmZ/TqpoM0nozaUTPeqQTYy0uVm4JJWm2jv5ONAjmMezGCbpvcqkA==
X-Received: by 2002:a05:600c:1986:: with SMTP id t6mr14045514wmq.49.1628549946150;
        Mon, 09 Aug 2021 15:59:06 -0700 (PDT)
Received: from localhost.localdomain (cpc141996-chfd3-2-0-cust928.12-3.cable.virginm.net. [86.13.91.161])
        by smtp.gmail.com with ESMTPSA id v12sm20437957wrq.59.2021.08.09.15.59.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Aug 2021 15:59:05 -0700 (PDT)
From:   Daniel Scally <djrscally@gmail.com>
To:     djrscally@gmail.com, sakari.ailus@linux.intel.com,
        paul.kocialkowski@bootlin.com, ezequiel@collabora.com,
        hverkuil-cisco@xs4all.nl, linux-media@vger.kernel.org
Cc:     yong.zhi@intel.com, bingbu.cao@intel.com, tian.shu.qiu@intel.com,
        kevin.lhopital@bootlin.com, yang.lee@linux.alibaba.com,
        andy.shevchenko@gmail.com, laurent.pinchart@ideasonboard.com,
        kieran.bingham@ideasonboard.com
Subject: [PATCH v2 08/12] media: i2c: Add hblank control to ov8865
Date:   Mon,  9 Aug 2021 23:58:41 +0100
Message-Id: <20210809225845.916430-9-djrscally@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210809225845.916430-1-djrscally@gmail.com>
References: <20210809225845.916430-1-djrscally@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add a V4L2_CID_HBLANK control to the ov8865 driver. This is read only
with timing control intended to be done via vblanking alone.

Signed-off-by: Daniel Scally <djrscally@gmail.com>
---
Changes in v2:

	- None

 drivers/media/i2c/ov8865.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/drivers/media/i2c/ov8865.c b/drivers/media/i2c/ov8865.c
index 810047c247b4..db84294b7a03 100644
--- a/drivers/media/i2c/ov8865.c
+++ b/drivers/media/i2c/ov8865.c
@@ -673,6 +673,7 @@ struct ov8865_state {
 struct ov8865_ctrls {
 	struct v4l2_ctrl *link_freq;
 	struct v4l2_ctrl *pixel_rate;
+	struct v4l2_ctrl *hblank;
 	struct v4l2_ctrl *vblank;
 
 	struct v4l2_ctrl_handler handler;
@@ -2506,6 +2507,7 @@ static int ov8865_ctrls_init(struct ov8865_sensor *sensor)
 	const struct v4l2_ctrl_ops *ops = &ov8865_ctrl_ops;
 	const struct ov8865_mode *mode = sensor->state.mode;
 	unsigned int vblank_max, vblank_def;
+	unsigned int hblank;
 	int ret;
 
 	v4l2_ctrl_handler_init(handler, 32);
@@ -2542,6 +2544,13 @@ static int ov8865_ctrls_init(struct ov8865_sensor *sensor)
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
@@ -2688,6 +2697,7 @@ static int ov8865_set_fmt(struct v4l2_subdev *subdev,
 	struct v4l2_mbus_framefmt *mbus_format = &format->format;
 	const struct ov8865_mode *mode;
 	u32 mbus_code = 0;
+	unsigned int hblank;
 	unsigned int index;
 	int ret = 0;
 
@@ -2732,6 +2742,10 @@ static int ov8865_set_fmt(struct v4l2_subdev *subdev,
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

