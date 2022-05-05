Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 81D1951CC6C
	for <lists+linux-media@lfdr.de>; Fri,  6 May 2022 01:05:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1386568AbiEEXIN (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 5 May 2022 19:08:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44836 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1386549AbiEEXIG (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 5 May 2022 19:08:06 -0400
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com [IPv6:2a00:1450:4864:20::436])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 48F3B5EDD1
        for <linux-media@vger.kernel.org>; Thu,  5 May 2022 16:04:24 -0700 (PDT)
Received: by mail-wr1-x436.google.com with SMTP id q23so7884895wra.1
        for <linux-media@vger.kernel.org>; Thu, 05 May 2022 16:04:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=qwPAqsE4aOcMNMzGB8tPf83tyrfTv7ngTTp2HTofk4M=;
        b=qSlgtcnqM3sFqHC7qp6fblCllrBLz/shRA4Sc2JFcvERm0FPDbJSGpPVbsvwJI3lYU
         Mi5+8JFOBepgajDZ6qUXuDlPGsFbUJDu8K3dw7qJ3+9Tl+3ajxDWv4pcHT7uBvcg1SmG
         aJtuhrQJMbNt72LCJDHAeJ74hEkCztkBuo48c6DRbXR12XZWLiwFLokQgQ6Ev5v2qJeb
         HRo+Rgzx71l3OQyFtp19k/0k4/yz3+EbVp0TZca1cEGHwqOvd3ymcItW0q0oQfq2wB+p
         +oFd+u+S73754ScsiOrtzCS2VB6VDHu7frl6Z9HOuokyqaclqvMZxT/3FtqcYb4m/Fxj
         CfGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=qwPAqsE4aOcMNMzGB8tPf83tyrfTv7ngTTp2HTofk4M=;
        b=T3Ay5BLj5uFfrgUKNoLqLxIWtjlgpRszv3/JDAqn3MQ8Y42yQ3wmGor8EuesOEy1S8
         0AHTZIjjnO9kr9wlZmpiNuhng3rtI75Tyr1p5uWDY9QyZWMcefZ4P2NVs3PBYDe1Mu+M
         Mo9067B6vjrjaigKEsuhTbsJ9SvGOVIPGAOdFUEoxO8N/PT6uzgtu3agi8/uSnbpAMJg
         ABZHa8J35uirhf33K8LQXgSis/HCQ7VIttQLxnQS05nHP0YCklKr1FYkIS180IxGgj2g
         1SGrepQZesVD+PHqdVqXKME8GzL66XBvLilaiKFFMWpbiJh4pSFDaFcLBa0FkkHnovfS
         1yKQ==
X-Gm-Message-State: AOAM53178D7SYS/0rqvIm2C2NM2Ein/pAtxCvkYHefxC5lDjiqBBipHO
        vaxlGpluGs/agFH64J4AD6gs7IuJtsc=
X-Google-Smtp-Source: ABdhPJxNTuFoO5z8EivN9F++u+t6zc0G48aFcipSITSc2n01p3KRCWEwUW6t4QYE21LFfq3PxaPAiA==
X-Received: by 2002:a5d:588e:0:b0:20c:7ec0:b804 with SMTP id n14-20020a5d588e000000b0020c7ec0b804mr294449wrf.128.1651791862858;
        Thu, 05 May 2022 16:04:22 -0700 (PDT)
Received: from localhost.localdomain (cpc141996-chfd3-2-0-cust928.12-3.cable.virginm.net. [86.13.91.161])
        by smtp.gmail.com with ESMTPSA id o20-20020a05600c339400b003942a244f33sm6782130wmp.12.2022.05.05.16.04.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 May 2022 16:04:22 -0700 (PDT)
From:   Daniel Scally <djrscally@gmail.com>
To:     linux-media@vger.kernel.org
Cc:     yong.zhi@intel.com, sakari.ailus@linux.intel.com,
        bingbu.cao@intel.com, tian.shu.qiu@intel.com,
        andriy.shevchenko@linux.intel.com, hverkuil-cisco@xs4all.nl
Subject: [PATCH v4 12/15] media: i2c: Extend .get_selection() for ov7251
Date:   Fri,  6 May 2022 00:03:59 +0100
Message-Id: <20220505230402.449643-13-djrscally@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220505230402.449643-1-djrscally@gmail.com>
References: <20220505230402.449643-1-djrscally@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,PDS_OTHER_BAD_TLD,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Extend the .get_selection() callback to support other values for
sel->target, primarily to satisfy libcamera's requirements.

Signed-off-by: Daniel Scally <djrscally@gmail.com>
---
Changes in v4:

	- None

Changes in v3:

	- New patch
 drivers/media/i2c/ov7251.c | 35 +++++++++++++++++++++++++++++------
 1 file changed, 29 insertions(+), 6 deletions(-)

diff --git a/drivers/media/i2c/ov7251.c b/drivers/media/i2c/ov7251.c
index a1326d03bcdd..54c883753207 100644
--- a/drivers/media/i2c/ov7251.c
+++ b/drivers/media/i2c/ov7251.c
@@ -54,6 +54,13 @@
 #define OV7251_PLL2_SYS_DIV_REG		0x309a
 #define OV7251_PLL2_ADC_DIV_REG		0x309b
 
+#define OV7251_NATIVE_WIDTH		656
+#define OV7251_NATIVE_HEIGHT		496
+#define OV7251_ACTIVE_START_LEFT	4
+#define OV7251_ACTIVE_START_TOP		4
+#define OV7251_ACTIVE_WIDTH		648
+#define OV7251_ACTIVE_HEIGHT		488
+
 struct reg_value {
 	u16 reg;
 	u8 val;
@@ -1248,13 +1255,29 @@ static int ov7251_get_selection(struct v4l2_subdev *sd,
 {
 	struct ov7251 *ov7251 = to_ov7251(sd);
 
-	if (sel->target != V4L2_SEL_TGT_CROP)
-		return -EINVAL;
-
+	switch (sel->target) {
+	case V4L2_SEL_TGT_CROP_DEFAULT:
+	case V4L2_SEL_TGT_CROP:
 	mutex_lock(&ov7251->lock);
-	sel->r = *__ov7251_get_pad_crop(ov7251, sd_state, sel->pad,
-					sel->which);
-	mutex_unlock(&ov7251->lock);
+		sel->r = *__ov7251_get_pad_crop(ov7251, sd_state, sel->pad,
+						sel->which);
+		mutex_unlock(&ov7251->lock);
+		break;
+	case V4L2_SEL_TGT_NATIVE_SIZE:
+		sel->r.top = 0;
+		sel->r.left = 0;
+		sel->r.width = OV7251_NATIVE_WIDTH;
+		sel->r.height = OV7251_NATIVE_HEIGHT;
+		break;
+	case V4L2_SEL_TGT_CROP_BOUNDS:
+		sel->r.top = OV7251_ACTIVE_START_TOP;
+		sel->r.left = OV7251_ACTIVE_START_LEFT;
+		sel->r.width = OV7251_ACTIVE_WIDTH;
+		sel->r.height = OV7251_ACTIVE_HEIGHT;
+		break;
+	default:
+		return -EINVAL;
+	}
 
 	return 0;
 }
-- 
2.25.1

