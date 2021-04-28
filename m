Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 72DBC36DED1
	for <lists+linux-media@lfdr.de>; Wed, 28 Apr 2021 20:10:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243533AbhD1SLZ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 28 Apr 2021 14:11:25 -0400
Received: from msg-1.mailo.com ([213.182.54.11]:35964 "EHLO msg-1.mailo.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230248AbhD1SLZ (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 28 Apr 2021 14:11:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=mailo.com; s=mailo;
        t=1619633433; bh=KqZDY8ia8XjqWkml/EZvqSqDTQ0bSQIY4Y4Z7BltTyo=;
        h=X-EA-Auth:Date:From:To:Cc:Subject:Message-ID:References:
         MIME-Version:Content-Type:In-Reply-To;
        b=SQgKznWbjqbslktcd87LmVmZxgJBQWB8oweY+3tu3YdI5NkHGRb1ta1ZXhV5D1sN5
         MnsLYao3bO46S0ZcHBX8SM7C4a98ahlnCw5mS1JO1gqr3aCIW7fJhqLWCC/Nx7kE8W
         L3R5daYL1GJXJg8Ou91fZdirYcKEwRZuTNTx6SRg=
Received: by 192.168.90.11 [192.168.90.11] with ESMTP
        via ip-206.mailobj.net [213.182.55.206]
        Wed, 28 Apr 2021 20:10:31 +0200 (CEST)
X-EA-Auth: QKDf1PCt+HoVDZjQj6jJf+h1xB0bfgCSSyoB0dtNmZJZOVZ+qUzfK5+WvkUtayo4YJH+MGi3xH6fVtvIgoJDMZ77zlKykEQ8
Date:   Wed, 28 Apr 2021 23:40:26 +0530
From:   Deepak R Varma <drv@mailo.com>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
        linux-kernel@vger.kernel.org, drv@mailo.com
Subject: [PATCH v4 8/9] staging: media: atomisp: remove unnecessary pr_info
 calls
Message-ID: <17bd2c71457d25e584f7fdcc6246a3a8d3e4c959.1619630709.git.drv@mailo.com>
References: <cover.1619630709.git.drv@mailo.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1619630709.git.drv@mailo.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

pr_info() messages to log function entry / exit tracing spams the log.
Such basic tracing is not necessary and be removed.

Signed-off-by: Deepak R Varma <drv@mailo.com>
---

Changes since v3:
   - Patch introduced based on other patch review feedback
Changes since v2:
   - Patch not part of set
Changes since v1:
   - Patch not part of set



 .../staging/media/atomisp/i2c/atomisp-gc0310.c  | 17 -----------------
 1 file changed, 17 deletions(-)

diff --git a/drivers/staging/media/atomisp/i2c/atomisp-gc0310.c b/drivers/staging/media/atomisp/i2c/atomisp-gc0310.c
index bb75d077ad63..5f1929a49b07 100644
--- a/drivers/staging/media/atomisp/i2c/atomisp-gc0310.c
+++ b/drivers/staging/media/atomisp/i2c/atomisp-gc0310.c
@@ -718,7 +718,6 @@ static int gc0310_init(struct v4l2_subdev *sd)
 	struct i2c_client *client = v4l2_get_subdevdata(sd);
 	struct gc0310_device *dev = to_gc0310_sensor(sd);
 
-	pr_info("%s S\n", __func__);
 	mutex_lock(&dev->input_lock);
 
 	/* set initial registers */
@@ -730,7 +729,6 @@ static int gc0310_init(struct v4l2_subdev *sd)
 
 	mutex_unlock(&dev->input_lock);
 
-	pr_info("%s E\n", __func__);
 	return ret;
 }
 
@@ -796,7 +794,6 @@ static int power_up(struct v4l2_subdev *sd)
 	struct i2c_client *client = v4l2_get_subdevdata(sd);
 	int ret;
 
-	pr_info("%s S\n", __func__);
 	if (!dev->platform_data) {
 		dev_err(&client->dev,
 			"no camera_sensor_platform_data");
@@ -823,7 +820,6 @@ static int power_up(struct v4l2_subdev *sd)
 
 	msleep(100);
 
-	pr_info("%s E\n", __func__);
 	return 0;
 
 fail_gpio:
@@ -959,15 +955,12 @@ static int startup(struct v4l2_subdev *sd)
 	struct i2c_client *client = v4l2_get_subdevdata(sd);
 	int ret = 0;
 
-	pr_info("%s S\n", __func__);
-
 	ret = gc0310_write_reg_array(client, gc0310_res[dev->fmt_idx].regs);
 	if (ret) {
 		dev_err(&client->dev, "gc0310 write register err.\n");
 		return ret;
 	}
 
-	pr_info("%s E\n", __func__);
 	return ret;
 }
 
@@ -982,8 +975,6 @@ static int gc0310_set_fmt(struct v4l2_subdev *sd,
 	int ret = 0;
 	int idx = 0;
 
-	pr_info("%s S\n", __func__);
-
 	if (format->pad)
 		return -EINVAL;
 
@@ -1035,7 +1026,6 @@ static int gc0310_set_fmt(struct v4l2_subdev *sd,
 		goto err;
 	}
 
-	pr_info("%s E\n", __func__);
 err:
 	mutex_unlock(&dev->input_lock);
 	return ret;
@@ -1068,7 +1058,6 @@ static int gc0310_detect(struct i2c_client *client)
 	int ret;
 	u16 id;
 
-	pr_info("%s S\n", __func__);
 	if (!i2c_check_functionality(adapter, I2C_FUNC_I2C))
 		return -ENODEV;
 
@@ -1095,8 +1084,6 @@ static int gc0310_detect(struct i2c_client *client)
 
 	dev_dbg(&client->dev, "detect gc0310 success\n");
 
-	pr_info("%s E\n", __func__);
-
 	return 0;
 }
 
@@ -1142,7 +1129,6 @@ static int gc0310_s_stream(struct v4l2_subdev *sd, int enable)
 	}
 
 	mutex_unlock(&dev->input_lock);
-	pr_info("%s E\n", __func__);
 	return ret;
 }
 
@@ -1153,7 +1139,6 @@ static int gc0310_s_config(struct v4l2_subdev *sd,
 	struct i2c_client *client = v4l2_get_subdevdata(sd);
 	int ret = 0;
 
-	pr_info("%s S\n", __func__);
 	if (!platform_data)
 		return -ENODEV;
 
@@ -1196,7 +1181,6 @@ static int gc0310_s_config(struct v4l2_subdev *sd,
 	}
 	mutex_unlock(&dev->input_lock);
 
-	pr_info("%s E\n", __func__);
 	return 0;
 
 fail_csi_cfg:
@@ -1365,7 +1349,6 @@ static int gc0310_probe(struct i2c_client *client)
 	if (ret)
 		gc0310_remove(client);
 
-	pr_info("%s E\n", __func__);
 	return ret;
 out_free:
 	v4l2_device_unregister_subdev(&dev->sd);
-- 
2.31.1



