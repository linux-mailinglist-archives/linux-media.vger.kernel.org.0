Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8336E364A4B
	for <lists+linux-media@lfdr.de>; Mon, 19 Apr 2021 21:14:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241313AbhDSTOz (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 19 Apr 2021 15:14:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53022 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237147AbhDSTOw (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 19 Apr 2021 15:14:52 -0400
Received: from mail-pl1-x633.google.com (mail-pl1-x633.google.com [IPv6:2607:f8b0:4864:20::633])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 74956C06174A;
        Mon, 19 Apr 2021 12:14:21 -0700 (PDT)
Received: by mail-pl1-x633.google.com with SMTP id e9so1313181plj.2;
        Mon, 19 Apr 2021 12:14:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:date:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=IarUL5JugB00D22SRY0kLvA7Hym5eBPB7S86b6T8S/M=;
        b=Djus1ktLXvd9cFzSzQ2edwxxih9e8SnV1BuzmhxoOA6hemy8REnkCFdlY6nJMP6NNq
         YO3STJ1y1D9vni+8HS6sgfPJEaWqw/2nl8SKdnOBHKhJ0wyPMqomy9q8mqH9eAHRNQcL
         w/7Z2O+hfJJu45S9YlTmA4KbAMZsHP/lM6D6vl9//1eJeOnr9nGYogYgfq4xlbSgKUh5
         gjNwRzQy5KyhQbRb402WEPgVqUkAOAQRxxCz4+WyzuSTI9ZTQBxspEKkpoPjzKSE1hkP
         3W1b6ICpTeBuZRBLzQHYnIi4djG9AM69lR1W4fr9evlC2SgMKNIhfq+Ae+1E37t1YMGJ
         YL4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:date:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=IarUL5JugB00D22SRY0kLvA7Hym5eBPB7S86b6T8S/M=;
        b=fRTsVnGo+yZPSFlA3aGZBZXh2eRa2P29t/WXg34DkDQWd5/sXD2Cs82uhVphCFpjSB
         ncvtfy/VDYTf82GN51E3IInyOg2IQnl7Rp4FE8hzFfIGMAN8uAVO7XTDpuc5bNxhN8hq
         dnw7GLCEqw/d3WKySwY2yGnu7tAd+wplf3JwVpArDd7GTnO0uoTsycihZmlSe++Sk3+j
         uHGNey0r3L+UzvW4su3VnuVdJOMpH6oyvypjUW+jx/1gnmZpSiBVuOQwlA1LKD3TjXZD
         9X6f5udtc2iqvXdiWbZ72R+JAaUXc+EhHFay1ZmDMblbtjp+nquvVMDwNkPTHSr60kJO
         sXlw==
X-Gm-Message-State: AOAM5326z2+qOZxu9YRMAz2RhoRTVEdQxtd2Fr50f7uUAoDmj5YQ157p
        gbwWDejhKRm44Qzl19JYDLw=
X-Google-Smtp-Source: ABdhPJydDF0wg6sbLt8S6ToO5jRAmbX3qFMWKgr8PZKVOsmgynUBRpIvOBwBDGN3PcyxIb+7f4LAtg==
X-Received: by 2002:a17:902:a38d:b029:ec:8faf:2007 with SMTP id x13-20020a170902a38db02900ec8faf2007mr13029964pla.75.1618859661098;
        Mon, 19 Apr 2021 12:14:21 -0700 (PDT)
Received: from localhost ([103.241.225.98])
        by smtp.gmail.com with ESMTPSA id f10sm216059pju.27.2021.04.19.12.14.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Apr 2021 12:14:20 -0700 (PDT)
From:   Deepak R Varma <mh12gx2825@gmail.com>
X-Google-Original-From: Deepak R Varma <drv@mailo.com>
Date:   Tue, 20 Apr 2021 00:44:15 +0530
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
        linux-kernel@vger.kernel.org
Cc:     mh12gx2825@gmail.com
Subject: [PATCH 3/6] staging: media: atomisp: use __func__ over function names
Message-ID: <2cb42846abb7cab5e64bc29d5e496766f5df169b.1618859059.git.drv@mailo.com>
References: <cover.1618859059.git.drv@mailo.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1618859059.git.drv@mailo.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Replace hard coded function names from the debug print strings by
standard __func__ predefined identifier. This resolves following
checkpatch script WARNING:
Prefer using '"%s...", __func__' to using function's name, in a string.

Signed-off-by: Deepak R Varma <drv@mailo.com>
---
 .../staging/media/atomisp/i2c/atomisp-gc0310.c   |  2 +-
 .../staging/media/atomisp/i2c/atomisp-gc2235.c   |  2 +-
 .../staging/media/atomisp/i2c/atomisp-lm3554.c   |  2 +-
 .../staging/media/atomisp/i2c/atomisp-ov2680.c   | 16 ++++++++--------
 .../staging/media/atomisp/i2c/atomisp-ov2722.c   |  2 +-
 5 files changed, 12 insertions(+), 12 deletions(-)

diff --git a/drivers/staging/media/atomisp/i2c/atomisp-gc0310.c b/drivers/staging/media/atomisp/i2c/atomisp-gc0310.c
index d68a2bcc9ae1..b572551f1a0d 100644
--- a/drivers/staging/media/atomisp/i2c/atomisp-gc0310.c
+++ b/drivers/staging/media/atomisp/i2c/atomisp-gc0310.c
@@ -1292,7 +1292,7 @@ static int gc0310_remove(struct i2c_client *client)
 	struct v4l2_subdev *sd = i2c_get_clientdata(client);
 	struct gc0310_device *dev = to_gc0310_sensor(sd);
 
-	dev_dbg(&client->dev, "gc0310_remove...\n");
+	dev_dbg(&client->dev, "%s...\n", __func__);
 
 	dev->platform_data->csi_cfg(sd, 0);
 
diff --git a/drivers/staging/media/atomisp/i2c/atomisp-gc2235.c b/drivers/staging/media/atomisp/i2c/atomisp-gc2235.c
index e722c639b60d..548c572d3b57 100644
--- a/drivers/staging/media/atomisp/i2c/atomisp-gc2235.c
+++ b/drivers/staging/media/atomisp/i2c/atomisp-gc2235.c
@@ -1034,7 +1034,7 @@ static int gc2235_remove(struct i2c_client *client)
 	struct v4l2_subdev *sd = i2c_get_clientdata(client);
 	struct gc2235_device *dev = to_gc2235_sensor(sd);
 
-	dev_dbg(&client->dev, "gc2235_remove...\n");
+	dev_dbg(&client->dev, "%s...\n", __func__);
 
 	dev->platform_data->csi_cfg(sd, 0);
 
diff --git a/drivers/staging/media/atomisp/i2c/atomisp-lm3554.c b/drivers/staging/media/atomisp/i2c/atomisp-lm3554.c
index 7ca7378b1859..ab10fd98dbc0 100644
--- a/drivers/staging/media/atomisp/i2c/atomisp-lm3554.c
+++ b/drivers/staging/media/atomisp/i2c/atomisp-lm3554.c
@@ -680,7 +680,7 @@ static int lm3554_detect(struct v4l2_subdev *sd)
 	int ret;
 
 	if (!i2c_check_functionality(adapter, I2C_FUNC_SMBUS_BYTE_DATA)) {
-		dev_err(&client->dev, "lm3554_detect i2c error\n");
+		dev_err(&client->dev, "%s i2c error\n", __func__);
 		return -ENODEV;
 	}
 
diff --git a/drivers/staging/media/atomisp/i2c/atomisp-ov2680.c b/drivers/staging/media/atomisp/i2c/atomisp-ov2680.c
index 92c52431bd8f..c17615149f46 100644
--- a/drivers/staging/media/atomisp/i2c/atomisp-ov2680.c
+++ b/drivers/staging/media/atomisp/i2c/atomisp-ov2680.c
@@ -146,7 +146,7 @@ static int ov2680_g_bin_factor_x(struct v4l2_subdev *sd, s32 *val)
 	struct ov2680_device *dev = to_ov2680_sensor(sd);
 	struct i2c_client *client = v4l2_get_subdevdata(sd);
 
-	dev_dbg(&client->dev,  "++++ov2680_g_bin_factor_x\n");
+	dev_dbg(&client->dev,  "++++%s\n", __func__);
 	*val = ov2680_res[dev->fmt_idx].bin_factor_x;
 
 	return 0;
@@ -158,7 +158,7 @@ static int ov2680_g_bin_factor_y(struct v4l2_subdev *sd, s32 *val)
 	struct i2c_client *client = v4l2_get_subdevdata(sd);
 
 	*val = ov2680_res[dev->fmt_idx].bin_factor_y;
-	dev_dbg(&client->dev,  "++++ov2680_g_bin_factor_y\n");
+	dev_dbg(&client->dev,  "++++%s\n", __func__);
 	return 0;
 }
 
@@ -173,7 +173,7 @@ static int ov2680_get_intg_factor(struct i2c_client *client,
 	u16 reg_val;
 	int ret;
 
-	dev_dbg(&client->dev,  "++++ov2680_get_intg_factor\n");
+	dev_dbg(&client->dev,  "++++%s\n", __func__);
 	if (!info)
 		return -EINVAL;
 
@@ -251,8 +251,8 @@ static long __ov2680_set_exposure(struct v4l2_subdev *sd, int coarse_itg,
 	int ret, exp_val;
 
 	dev_dbg(&client->dev,
-		"+++++++__ov2680_set_exposure coarse_itg %d, gain %d, digitgain %d++\n",
-		coarse_itg, gain, digitgain);
+		"+++++++%s coarse_itg %d, gain %d, digitgain %d++\n",
+		__func__, coarse_itg, gain, digitgain);
 
 	vts = ov2680_res[dev->fmt_idx].lines_per_frame;
 
@@ -1061,9 +1061,9 @@ static int ov2680_s_stream(struct v4l2_subdev *sd, int enable)
 
 	mutex_lock(&dev->input_lock);
 	if (enable)
-		dev_dbg(&client->dev, "ov2680_s_stream one\n");
+		dev_dbg(&client->dev, "%s one\n", __func__);
 	else
-		dev_dbg(&client->dev, "ov2680_s_stream off\n");
+		dev_dbg(&client->dev, "%s off\n", __func__);
 
 	ret = ov2680_write_reg(client, 1, OV2680_SW_STREAM,
 			       enable ? OV2680_START_STREAMING :
@@ -1227,7 +1227,7 @@ static int ov2680_remove(struct i2c_client *client)
 	struct v4l2_subdev *sd = i2c_get_clientdata(client);
 	struct ov2680_device *dev = to_ov2680_sensor(sd);
 
-	dev_dbg(&client->dev, "ov2680_remove...\n");
+	dev_dbg(&client->dev, "%s...\n", __func__);
 
 	dev->platform_data->csi_cfg(sd, 0);
 
diff --git a/drivers/staging/media/atomisp/i2c/atomisp-ov2722.c b/drivers/staging/media/atomisp/i2c/atomisp-ov2722.c
index d046a9804f63..69409f8447b5 100644
--- a/drivers/staging/media/atomisp/i2c/atomisp-ov2722.c
+++ b/drivers/staging/media/atomisp/i2c/atomisp-ov2722.c
@@ -1175,7 +1175,7 @@ static int ov2722_remove(struct i2c_client *client)
 	struct v4l2_subdev *sd = i2c_get_clientdata(client);
 	struct ov2722_device *dev = to_ov2722_sensor(sd);
 
-	dev_dbg(&client->dev, "ov2722_remove...\n");
+	dev_dbg(&client->dev, "%s...\n", __func__);
 
 	dev->platform_data->csi_cfg(sd, 0);
 	v4l2_ctrl_handler_free(&dev->ctrl_handler);
-- 
2.25.1

