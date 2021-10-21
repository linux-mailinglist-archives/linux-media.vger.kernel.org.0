Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A3246436CF0
	for <lists+linux-media@lfdr.de>; Thu, 21 Oct 2021 23:44:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232253AbhJUVq1 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 21 Oct 2021 17:46:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55170 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232213AbhJUVqZ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 21 Oct 2021 17:46:25 -0400
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com [IPv6:2a00:1450:4864:20::434])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9E814C061348
        for <linux-media@vger.kernel.org>; Thu, 21 Oct 2021 14:44:07 -0700 (PDT)
Received: by mail-wr1-x434.google.com with SMTP id m22so973334wrb.0
        for <linux-media@vger.kernel.org>; Thu, 21 Oct 2021 14:44:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=2JZ9/8cBu22M+2eTYtbMSzCqMZGrUlTquwKJPNKV33g=;
        b=NJ5CLb9EEYAL5Btq1dU0c2dM+H1s1MeC2BIrfKxrdlh//UUC4+sIvvv7XIfpWdJsX3
         fHj0qWixQXGTtRt3hHbZvKuAtanHIV7H57Qxj9OH/yaaxDARI0EIrExPZ23DtphvJYT5
         TfddFxLaQrthyKQe2MZ4U1nZ1q8ZI6+feBw1L6rzDe6mJGB4x95DMJjHWKNF04zItDCN
         HUvoOEINqW1AlGAlUt5o30COuyDD6HomGB0CkmOuIGh05r0mRTrAMDiJdlKFLFD1KY+7
         6hs/tkPz9FBOoQapgPYYhgke2h9+Yp6ZE921fSaoU3FeoBqDVaSz6u55tYefBXwtc24Y
         fseg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=2JZ9/8cBu22M+2eTYtbMSzCqMZGrUlTquwKJPNKV33g=;
        b=YPIoPuKP6+p/RPuBzUujUO4sgVrMx4ECTZrAHqhcjJX1DHd8o989Tv8Xg1oWJBVwKq
         FS1uaIGw1R73rMfMFhgDtheOsvAiiWabsxcEF4U7Ri98Yv465kDAT6H7MXM1yzu0gTgn
         3xoI503k7PdUlwQj5o6UKkwSLd2PclkOgEXCuvz3dyLoLSRzQDwJW5HzhT4Kgoy3unYm
         QR6kGSqynsmS62jbK8RqRzvVtmyvxZkcnU5t5Ysze9i1ibd3YiiP7Ench+NG0/aANuYD
         wMrNE0lDjspmU7M+8IEnGys0HAEsDQ/vHUUlGaXPs+ceCM6noEISn/JW9CzpodLTrhWQ
         +VPA==
X-Gm-Message-State: AOAM530UaYlG+mE8XXv2ENf6P/SL5ERzto/UVENyaqtgKgs6QCePyKfA
        uRNhhV1AF8vv+jFDbCpTbZ6HR7cn29g=
X-Google-Smtp-Source: ABdhPJzQ5D7+iOw4AUzwdONSnaiVC737O/4/10UsEO3y2tPefzirITevhZkjW7gLLqsEBYh+17Ui+w==
X-Received: by 2002:adf:8b1a:: with SMTP id n26mr10490260wra.182.1634852646318;
        Thu, 21 Oct 2021 14:44:06 -0700 (PDT)
Received: from localhost.localdomain (cpc141996-chfd3-2-0-cust928.12-3.cable.virginm.net. [86.13.91.161])
        by smtp.gmail.com with ESMTPSA id r205sm6378507wma.3.2021.10.21.14.44.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Oct 2021 14:44:06 -0700 (PDT)
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
Subject: [PATCH v3 12/16] media: i2c: Switch exposure control unit to lines
Date:   Thu, 21 Oct 2021 22:43:27 +0100
Message-Id: <20211021214331.1188787-13-djrscally@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211021214331.1188787-1-djrscally@gmail.com>
References: <20211021214331.1188787-1-djrscally@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The ov8865 driver currently has the unit of the V4L2_CID_EXPOSURE control
as 1/16th of a line. This is what the sensor expects, but isn't very
intuitive. Switch the control to be in units of a line and simply do the
16x multiplication before passing the value to the sensor.

The datasheet for this sensor gives minimum exposure as 2 lines, so take
the opportunity to correct the lower bounds of the control.

Signed-off-by: Daniel Scally <djrscally@gmail.com>
---
Changes in v3:

	- None

 drivers/media/i2c/ov8865.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/media/i2c/ov8865.c b/drivers/media/i2c/ov8865.c
index 5fec1e35eea5..0bf3f72892f7 100644
--- a/drivers/media/i2c/ov8865.c
+++ b/drivers/media/i2c/ov8865.c
@@ -2125,6 +2125,9 @@ static int ov8865_exposure_configure(struct ov8865_sensor *sensor, u32 exposure)
 {
 	int ret;
 
+	/* The sensor stores exposure in units of 1/16th of a line */
+	exposure *= 16;
+
 	ret = ov8865_write(sensor, OV8865_EXPOSURE_CTRL_HH_REG,
 			   OV8865_EXPOSURE_CTRL_HH(exposure));
 	if (ret)
@@ -2525,8 +2528,8 @@ static int ov8865_ctrls_init(struct ov8865_sensor *sensor)
 
 	/* Exposure */
 
-	ctrls->exposure = v4l2_ctrl_new_std(handler, ops, V4L2_CID_EXPOSURE, 16,
-					    1048575, 16, 512);
+	ctrls->exposure = v4l2_ctrl_new_std(handler, ops, V4L2_CID_EXPOSURE, 2,
+					    65535, 1, 32);
 
 	/* Gain */
 
-- 
2.25.1

