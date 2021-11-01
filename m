Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7DFE744119D
	for <lists+linux-media@lfdr.de>; Mon,  1 Nov 2021 01:11:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230462AbhKAAOJ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 31 Oct 2021 20:14:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35304 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230407AbhKAAOI (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 31 Oct 2021 20:14:08 -0400
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com [IPv6:2a00:1450:4864:20::42f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D9ABDC061714
        for <linux-media@vger.kernel.org>; Sun, 31 Oct 2021 17:11:35 -0700 (PDT)
Received: by mail-wr1-x42f.google.com with SMTP id m22so25880337wrb.0
        for <linux-media@vger.kernel.org>; Sun, 31 Oct 2021 17:11:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=pMeL2ZMTwgQaas5FyK+wnxkmsgi4q2MxWhpMVqxDmVg=;
        b=jS2h0hxX7/uIe3bpUT3+Inly81S8F2XOu/UIWp2h0dwGuIF4yoLDDhzvJJU0QCtqxL
         QRefwvpEV7t3rkqIaSl43uaVis2fuozuMrqbnNeB/tW2GI07aX7Wo8CNZ4tqdOde8/x3
         oR6Rf5apCTSE3ndvfQu+ygnIPwHelMuPR6mDvnMp0XNJBQLMZt7gb2X+JBeg8+l6Afdd
         5vKVjy7zTxeKT7SDM5I/LZ6pP+g6yw5QglD7p9nGQl9rfFgDVE2BByDBJbgy1PUDsy4C
         48oTqxIDtcLpKbrDc574G3jjIbtiQMgJg0ykJn2YNbRkOUQC9a0sciSA+uqTEM101bwt
         Nz2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=pMeL2ZMTwgQaas5FyK+wnxkmsgi4q2MxWhpMVqxDmVg=;
        b=Rts1P/NP7TMg1sx2EsVjCdkIt4XenIJt33QaRfpULC0Zat7w919LsKkxvfUQt8F27T
         4VawudNeLDjO2n4dAUS3EzKjDvk43tPLM1zYMmmVR4XFwABjPRwpkY+LDtZqyHBVvpzh
         CF2u/eLK4ZiaNZdEQfCBttcC+XruKkl6XdwzBOMF1L0UUY/XwLNCwUITfHOHjF943kTO
         csyEZuKGoWeNpNJ5kigk0wqgB5kxoYUBUkMxO/GRx0FMmp2YHcTPI4nGthx6vNYz7FkY
         Xjeqv03s123aoUXnLAgn3wAxiu41/XCE5S+sGlf32n7b3CSB/qjkxDVzMThuiiZm2aBQ
         exZg==
X-Gm-Message-State: AOAM531dk7Dcg8BscZ6yq7o04wrFV3AVR4td/JyEFtDTBKXXFWuVl/bh
        HQ45NF30HW42iTkvD+5TlxI=
X-Google-Smtp-Source: ABdhPJw2Iw2AGbyvOE2Wbrhr2N5JizhD9tsffbUmHM8iJm1GzVC4++pMPO3ktzglFgxr78uogsSAkA==
X-Received: by 2002:adf:a489:: with SMTP id g9mr20234533wrb.235.1635725494506;
        Sun, 31 Oct 2021 17:11:34 -0700 (PDT)
Received: from localhost.localdomain (cpc141996-chfd3-2-0-cust928.12-3.cable.virginm.net. [86.13.91.161])
        by smtp.gmail.com with ESMTPSA id k6sm12557678wri.83.2021.10.31.17.11.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 31 Oct 2021 17:11:34 -0700 (PDT)
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
Subject: [PATCH v4 10/16] media: i2c: cap exposure at height + vblank in ov8865
Date:   Mon,  1 Nov 2021 00:11:13 +0000
Message-Id: <20211101001119.46056-11-djrscally@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211101001119.46056-1-djrscally@gmail.com>
References: <20211101001119.46056-1-djrscally@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Exposure limits depend on the total height; when vblank is altered (and
thus the total height is altered), change the exposure limits to reflect
the new cap.

Signed-off-by: Daniel Scally <djrscally@gmail.com>
---
 drivers/media/i2c/ov8865.c | 26 ++++++++++++++++++++++++--
 1 file changed, 24 insertions(+), 2 deletions(-)

diff --git a/drivers/media/i2c/ov8865.c b/drivers/media/i2c/ov8865.c
index 1b8674152750..99548ad15dcd 100644
--- a/drivers/media/i2c/ov8865.c
+++ b/drivers/media/i2c/ov8865.c
@@ -677,6 +677,7 @@ struct ov8865_ctrls {
 	struct v4l2_ctrl *pixel_rate;
 	struct v4l2_ctrl *hblank;
 	struct v4l2_ctrl *vblank;
+	struct v4l2_ctrl *exposure;
 
 	struct v4l2_ctrl_handler handler;
 };
@@ -2454,6 +2455,19 @@ static int ov8865_s_ctrl(struct v4l2_ctrl *ctrl)
 	unsigned int index;
 	int ret;
 
+	/* If VBLANK is altered we need to update exposure to compensate */
+	if (ctrl->id == V4L2_CID_VBLANK) {
+		int exposure_max;
+
+		exposure_max = sensor->state.mode->output_size_y + ctrl->val;
+		__v4l2_ctrl_modify_range(sensor->ctrls.exposure,
+					 sensor->ctrls.exposure->minimum,
+					 exposure_max,
+					 sensor->ctrls.exposure->step,
+					 min(sensor->ctrls.exposure->val,
+					     exposure_max));
+	}
+
 	/* Wait for the sensor to be on before setting controls. */
 	if (pm_runtime_suspended(sensor->dev))
 		return 0;
@@ -2510,8 +2524,8 @@ static int ov8865_ctrls_init(struct ov8865_sensor *sensor)
 
 	/* Exposure */
 
-	v4l2_ctrl_new_std(handler, ops, V4L2_CID_EXPOSURE, 16, 1048575, 16,
-			  512);
+	ctrls->exposure = v4l2_ctrl_new_std(handler, ops, V4L2_CID_EXPOSURE, 16,
+					    1048575, 16, 512);
 
 	/* Gain */
 
@@ -2700,6 +2714,7 @@ static int ov8865_set_fmt(struct v4l2_subdev *subdev,
 	u32 mbus_code = 0;
 	unsigned int hblank;
 	unsigned int index;
+	int exposure_max;
 	int ret = 0;
 
 	mutex_lock(&sensor->mutex);
@@ -2747,6 +2762,13 @@ static int ov8865_set_fmt(struct v4l2_subdev *subdev,
 	__v4l2_ctrl_modify_range(sensor->ctrls.hblank, hblank, hblank, 1,
 				 hblank);
 
+	exposure_max = mode->vts;
+	__v4l2_ctrl_modify_range(sensor->ctrls.exposure,
+				 sensor->ctrls.exposure->minimum, exposure_max,
+				 sensor->ctrls.exposure->step,
+				 min(sensor->ctrls.exposure->val,
+				     exposure_max));
+
 complete:
 	mutex_unlock(&sensor->mutex);
 
-- 
2.25.1

