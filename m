Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B8BAB4598D3
	for <lists+linux-media@lfdr.de>; Tue, 23 Nov 2021 01:01:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232181AbhKWAD5 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 22 Nov 2021 19:03:57 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35500 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232493AbhKWADk (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 22 Nov 2021 19:03:40 -0500
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com [IPv6:2a00:1450:4864:20::42a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 87CA3C06175A
        for <linux-media@vger.kernel.org>; Mon, 22 Nov 2021 16:00:33 -0800 (PST)
Received: by mail-wr1-x42a.google.com with SMTP id b12so35694667wrh.4
        for <linux-media@vger.kernel.org>; Mon, 22 Nov 2021 16:00:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=mtJuoHgwOtsLSpTXAQDDOtUZ41bnHmFVV8n3W21EEqI=;
        b=VIwjkz0sgVmAevwcBteVU1rQCUEmH7LqSV+VIH3kDj+8NEqVqaho2u8G1ItWMKMqwO
         ioXgHo0S0RHzKbcyrbmF77gkxQRCOxQtGW+jCuBzhWObLJBgryca7yrao46LI0rWuOmt
         0BSrrMcS1tUS66eilEH8tPLYH3fYS/Z6fRps0rDn2Sukun9JnUQv79Yc04Br9eEjNXmI
         sc0AXL6l+gjvKWj6WLxIf/459Uua/vkbqBMiKjO6uyrVqjnVksTR1bK70MCT2hSD87/0
         V878UBxuasQNZHNqBDKkNZUWI5TuBTdpbrezN5R6WKFEjw4IPtvhTkPsb/6TFVM4UyNp
         MYgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=mtJuoHgwOtsLSpTXAQDDOtUZ41bnHmFVV8n3W21EEqI=;
        b=13cqQcBb7QIMq+LZnWbXVHGJ6jH3gBcmf5fTOje9LBnlSO/SRVYQQ5CBAJBw/8Xi/U
         RP2WyCKXCgObh7GksOMYmhMukv5j4Hpn5cIcdHNCSS/9lhen60U4/iMHrzn+jdnftq52
         DoRWkPpSg0rF1REzg6Jn+p/+PrLwWmn6D7wWbOuHRbkjb4xAGJo7vcwupRRpiD8x5x25
         GnSfViT4TrNGWnE+lSU1oHGGLpKU92Gjb8X3GeazcNolySpw5nGMzCIdXICHnwZdRcMg
         S/plRkQjiaxybe+ISlyN6V91Jccyx9iq9IZ4dcDPBwDVjLXpjS/Md0zKkgnmotvhYJq5
         2W7A==
X-Gm-Message-State: AOAM531Wxbttaf0/lExPF5U6AxOwh+ej6JOQKL0xE/m0dh3RWiCchdSS
        DzKRqjM0bIOgbvah92mTB+UcM5wCBjw=
X-Google-Smtp-Source: ABdhPJzWEhAAkAKUWPuC/Mez/wO3VhmY3EHdF6L6G4EepPxfu23gvpiqPX8UcrlXHKe33OKj2XEC5g==
X-Received: by 2002:a5d:4523:: with SMTP id j3mr1717360wra.185.1637625632173;
        Mon, 22 Nov 2021 16:00:32 -0800 (PST)
Received: from localhost.localdomain (cpc141996-chfd3-2-0-cust928.12-3.cable.virginm.net. [86.13.91.161])
        by smtp.gmail.com with ESMTPSA id s13sm23650782wmc.47.2021.11.22.16.00.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Nov 2021 16:00:31 -0800 (PST)
From:   Daniel Scally <djrscally@gmail.com>
To:     linux-media@vger.kernel.org, paul.kocialkowski@bootlin.com
Cc:     sakari.ailus@linux.intel.com, andriy.shevchenko@linux.intel.com,
        laurent.pinchart@ideasonboard.com, yong.zhi@intel.com,
        bingbu.cao@intel.com, jeanmichel.hautbois@ideasonboard.com,
        kieran.bingham@ideasonboard.com, hdegoede@redhat.com
Subject: [PATCH v5 08/17] media: i2c: Switch control to V4L2_CID_ANALOGUE_GAIN
Date:   Tue, 23 Nov 2021 00:00:08 +0000
Message-Id: <20211123000017.43187-9-djrscally@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211123000017.43187-1-djrscally@gmail.com>
References: <20211123000017.43187-1-djrscally@gmail.com>
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
Changes in v5: 

	- None

 drivers/media/i2c/ov8865.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/media/i2c/ov8865.c b/drivers/media/i2c/ov8865.c
index 87e34ad9c9a6..2d5b7b8c2c9e 100644
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

