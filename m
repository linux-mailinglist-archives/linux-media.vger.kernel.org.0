Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 394A7436CEB
	for <lists+linux-media@lfdr.de>; Thu, 21 Oct 2021 23:44:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232195AbhJUVqT (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 21 Oct 2021 17:46:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55134 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232190AbhJUVqS (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 21 Oct 2021 17:46:18 -0400
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com [IPv6:2a00:1450:4864:20::431])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 38A92C061348
        for <linux-media@vger.kernel.org>; Thu, 21 Oct 2021 14:44:02 -0700 (PDT)
Received: by mail-wr1-x431.google.com with SMTP id y3so1353960wrl.1
        for <linux-media@vger.kernel.org>; Thu, 21 Oct 2021 14:44:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=6vLlz/ma2Xjm3BA1QgDENMrA+E5R2qMKvxxwoPgy8nk=;
        b=OyYD/jsNhYpw2B+69cskht1Sm8rnWFr3NOR4PXBZCLVWfKkhBGmPNnE+ACaueMixEz
         IYsG8XlIrM+r6ChS0AWJUxLpX4+in4WcHRBJEXo2oyKs2OPiEXK//u1vhJlJKAR8wWQF
         Nn9KbbMW4CbeKty5lwweke+ytAJE1CaQd62GY2CiX2wIxemvam5ZytlxvmRCHHnBbTUv
         108+SgZ1seIVB+N318B4Gu94ladx00Y13RZPiGzd+8Oy7sbaVxj93a2Opi1XQ6i3We8h
         5tloYboRy0Dww2fmsXuZ6/5c4iPYDqOr2yBuMtjzA/r9MObB8v90zz4DWRK3mWs831se
         Uvyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=6vLlz/ma2Xjm3BA1QgDENMrA+E5R2qMKvxxwoPgy8nk=;
        b=3dYZk0P6TJMwMqnk7i9VsKYpkPiGMEeWHKg7zeX4eAK3hI9W3K7abpBkQV3D8rOoY3
         BYPvCFyjH9D4aSz3NsHdoGd0PHhLNqomFDVr+rvktc3Q6e2+mjqdBuwxWMO7DXEnxvIJ
         mDFdOc9Z6rYjYUSDeoIv9fYsrAXk88w6alKIR+uZsiyXm/jYuwcK2oqd9mnzikai5Db/
         aV+IB0pc2Hc4Qq6fUVIeHBsssX8ovjVKNkGTgYhMkS3UONdC9vwuVKUYxAtB+/0Wqh9w
         KvVVtygm67SumPbATovz783iIHxazfXn4XWv8CjInizuKapfHgxaY2WJJiZg8zu9B1Va
         0/mg==
X-Gm-Message-State: AOAM533P/yYoX82Qei+0nxyPm+DI7dLzYEEJ/Z6PsgRD7aK1osPFAjya
        v//6aaY9n1eQ42yPQFCj5XKanFHNU/w=
X-Google-Smtp-Source: ABdhPJwqkqZ2GgfQW/rp5/PrCLnNEtv/GfRub1HV/E3LEWmEwGIvpVwtpGX/S31yp5u9FPf2V5zj6A==
X-Received: by 2002:adf:8bd2:: with SMTP id w18mr10620495wra.432.1634852640928;
        Thu, 21 Oct 2021 14:44:00 -0700 (PDT)
Received: from localhost.localdomain (cpc141996-chfd3-2-0-cust928.12-3.cable.virginm.net. [86.13.91.161])
        by smtp.gmail.com with ESMTPSA id r205sm6378507wma.3.2021.10.21.14.44.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Oct 2021 14:44:00 -0700 (PDT)
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
Subject: [PATCH v3 06/16] media: i2c: Switch control to V4L2_CID_ANALOGUE_GAIN
Date:   Thu, 21 Oct 2021 22:43:21 +0100
Message-Id: <20211021214331.1188787-7-djrscally@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211021214331.1188787-1-djrscally@gmail.com>
References: <20211021214331.1188787-1-djrscally@gmail.com>
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
Changes in v3:

	- None

 drivers/media/i2c/ov8865.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/media/i2c/ov8865.c b/drivers/media/i2c/ov8865.c
index c16b31f13e37..ce7e7da6ae92 100644
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

