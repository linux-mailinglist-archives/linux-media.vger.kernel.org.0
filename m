Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CEBA3441199
	for <lists+linux-media@lfdr.de>; Mon,  1 Nov 2021 01:11:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230395AbhKAAOF (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 31 Oct 2021 20:14:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35282 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230346AbhKAAOE (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 31 Oct 2021 20:14:04 -0400
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com [IPv6:2a00:1450:4864:20::42c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3B490C061714
        for <linux-media@vger.kernel.org>; Sun, 31 Oct 2021 17:11:32 -0700 (PDT)
Received: by mail-wr1-x42c.google.com with SMTP id b12so21334538wrh.4
        for <linux-media@vger.kernel.org>; Sun, 31 Oct 2021 17:11:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=/akcoC6jSXq6p1wh0JzIQGx3c3Ax4JMABtbei41wxdw=;
        b=pSHsLALmo1AblZAW7GlUaKQtYDznSSSfU/hOw1JZXM49GyGrYP+DlB9h/egTzQ5BSx
         fhceyM+z+EXdphxeGU3w9mWbnqB3ZvuD57t35YAPj3iWhwKfGWXCQQS2pTtT6Jt0TvOr
         jaOkMDVCfIcRzCvKXD1idH9iEv0moYPxxRHu1O4vtoINLHz8qwrdvjDUIuGburQ1pjJQ
         ozzwi95f3HD4DSKWlcdkCTdngG1s9s/XezR8t1NeDRGZ5IiCrsBujaGWBEGwkQ2ycXpX
         bAilusyXZwvmWXSK8z2wpmEXqBjMeRs2d9H/Va9AJlILovZDkTrgT6ECzOj8eORUO7xs
         cXHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=/akcoC6jSXq6p1wh0JzIQGx3c3Ax4JMABtbei41wxdw=;
        b=WLsb1AnMmkabR8gW8dmYsmdK8HSpnQhmJertjiQSooExDotjN6patvdXp/stnxCGJ4
         LLhxqYsRw4qlWD7kUeeEoBoqul+frSz4by84sa6gI4IP6gygMgzP/mhIuXzQLvrMs749
         kNjWCasXrvnkYWwZojogev+V1BJInLVNk3AJxVDHB0y0kV5cicHG060CB689gxgMVwbw
         7B844XsJqVmbxeCnAyxT7PDW7i1LfxFA0NLLMyyPaFwutohca8AJr7xSYS96xInLTWpr
         cHXefXTv5SBpYHoLSpinQDmgiuNb7lrYju9oQdfMcZFEzfMfzgpa6YoUUndwT2PJ5wzJ
         9YSg==
X-Gm-Message-State: AOAM532NuaIJojj+Pzvnx5bynwtk+WLwzAKfKarZVRAOMWTK9Nugl4BH
        kMRt+wxHPQBj3upc+ux3WjU=
X-Google-Smtp-Source: ABdhPJybDC7439Jgm4Yn0lve+IILKY72ZQgblhMCnG9Oc5TgE+XhQFQwTt9SnypPWGfFuIceumX+QA==
X-Received: by 2002:a5d:6481:: with SMTP id o1mr33705381wri.60.1635725490842;
        Sun, 31 Oct 2021 17:11:30 -0700 (PDT)
Received: from localhost.localdomain (cpc141996-chfd3-2-0-cust928.12-3.cable.virginm.net. [86.13.91.161])
        by smtp.gmail.com with ESMTPSA id k6sm12557678wri.83.2021.10.31.17.11.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 31 Oct 2021 17:11:30 -0700 (PDT)
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
Subject: [PATCH v4 06/16] media: i2c: Switch control to V4L2_CID_ANALOGUE_GAIN
Date:   Mon,  1 Nov 2021 00:11:09 +0000
Message-Id: <20211101001119.46056-7-djrscally@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211101001119.46056-1-djrscally@gmail.com>
References: <20211101001119.46056-1-djrscally@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The V4L2_CID_GAIN control for this driver configures registers that
the datasheet specifies as analogue gain. Switch the control's ID
to V4L2_CID_ANALOGUE_GAIN.

Reviewed-by: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
Signed-off-by: Daniel Scally <djrscally@gmail.com>
---
 drivers/media/i2c/ov8865.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/media/i2c/ov8865.c b/drivers/media/i2c/ov8865.c
index 0f2776390a8e..a832938c33b6 100644
--- a/drivers/media/i2c/ov8865.c
+++ b/drivers/media/i2c/ov8865.c
@@ -2150,7 +2150,7 @@ static int ov8865_exposure_configure(struct ov8865_sensor *sensor, u32 exposure)
 
 /* Gain */
 
-static int ov8865_gain_configure(struct ov8865_sensor *sensor, u32 gain)
+static int ov8865_analog_gain_configure(struct ov8865_sensor *sensor, u32 gain)
 {
 	int ret;
 
@@ -2460,8 +2460,8 @@ static int ov8865_s_ctrl(struct v4l2_ctrl *ctrl)
 		if (ret)
 			return ret;
 		break;
-	case V4L2_CID_GAIN:
-		ret = ov8865_gain_configure(sensor, ctrl->val);
+	case V4L2_CID_ANALOGUE_GAIN:
+		ret = ov8865_analog_gain_configure(sensor, ctrl->val);
 		if (ret)
 			return ret;
 		break;
@@ -2506,7 +2506,8 @@ static int ov8865_ctrls_init(struct ov8865_sensor *sensor)
 
 	/* Gain */
 
-	v4l2_ctrl_new_std(handler, ops, V4L2_CID_GAIN, 128, 8191, 128, 128);
+	v4l2_ctrl_new_std(handler, ops, V4L2_CID_ANALOGUE_GAIN, 128, 8191, 128,
+			  128);
 
 	/* White Balance */
 
-- 
2.25.1

