Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C8DFD36DED4
	for <lists+linux-media@lfdr.de>; Wed, 28 Apr 2021 20:11:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243560AbhD1SL5 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 28 Apr 2021 14:11:57 -0400
Received: from msg-2.mailo.com ([213.182.54.12]:56010 "EHLO msg-2.mailo.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S240125AbhD1SL5 (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 28 Apr 2021 14:11:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=mailo.com; s=mailo;
        t=1619633465; bh=s1GxXlg5OtSzry24OzkhKPVo1rIN83aaJASnYb/0BZA=;
        h=X-EA-Auth:Date:From:To:Cc:Subject:Message-ID:References:
         MIME-Version:Content-Type:In-Reply-To;
        b=DIFvze+Lfo0FbF6SZ2mkYdbUiugER6nfp9Kz1mzdkXAACZGywM5Ff1tJRUW2SoeEQ
         vq+M3gARiDClIsS/i+npfTHChAAaJM4PhWJvR3XswcYldMR8CL4/6YUK4A8Gh3qJTf
         ugUm4uC4u/LWTUdS71kRqKqZh0oWXFnFXn5ekSsw=
Received: by 192.168.90.13 [192.168.90.13] with ESMTP
        via ip-206.mailobj.net [213.182.55.206]
        Wed, 28 Apr 2021 20:11:05 +0200 (CEST)
X-EA-Auth: QReUZTMeWS1qLIe0QB1lz6/O0b4chayYyWm58mxmJI7EXSeRMp3t9RanLGLqM/aEjQH4OjzLaG15Ag94UsbJlB0fu0wurAVX
Date:   Wed, 28 Apr 2021 23:40:59 +0530
From:   Deepak R Varma <drv@mailo.com>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
        linux-kernel@vger.kernel.org, drv@mailo.com
Subject: [PATCH v4 9/9] staging: media: atomisp: remove unwanted dev_*() calls
Message-ID: <0f966ef25e88f2137cb65bc405689224da7d27a7.1619630709.git.drv@mailo.com>
References: <cover.1619630709.git.drv@mailo.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1619630709.git.drv@mailo.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Delete diagnostic messages that only print the function name. We can use
ftrace for such debugging. The clean up also enables removing (now) unused
device pointers.

Suggested-by: Dan Carpenter <dan.carpenter@oracle.com>
Signed-off-by: Deepak R Varma <drv@mailo.com>
---

Changes since v3:
   - Patch introduced based on other patch review feedback
Changes since v2:
   - Patch not part of set
Changes since v1:
   - Patch not part of set


 drivers/staging/media/atomisp/i2c/atomisp-gc0310.c | 2 --
 drivers/staging/media/atomisp/i2c/atomisp-gc2235.c | 2 --
 drivers/staging/media/atomisp/i2c/atomisp-ov2680.c | 7 -------
 drivers/staging/media/atomisp/i2c/atomisp-ov2722.c | 2 --
 4 files changed, 13 deletions(-)

diff --git a/drivers/staging/media/atomisp/i2c/atomisp-gc0310.c b/drivers/staging/media/atomisp/i2c/atomisp-gc0310.c
index 5f1929a49b07..d5acd261c977 100644
--- a/drivers/staging/media/atomisp/i2c/atomisp-gc0310.c
+++ b/drivers/staging/media/atomisp/i2c/atomisp-gc0310.c
@@ -1276,8 +1276,6 @@ static int gc0310_remove(struct i2c_client *client)
 	struct v4l2_subdev *sd = i2c_get_clientdata(client);
 	struct gc0310_device *dev = to_gc0310_sensor(sd);
 
-	dev_dbg(&client->dev, "%s...\n", __func__);
-
 	dev->platform_data->csi_cfg(sd, 0);
 
 	v4l2_device_unregister_subdev(sd);
diff --git a/drivers/staging/media/atomisp/i2c/atomisp-gc2235.c b/drivers/staging/media/atomisp/i2c/atomisp-gc2235.c
index 6ee6e8414f0e..0b95b738af0e 100644
--- a/drivers/staging/media/atomisp/i2c/atomisp-gc2235.c
+++ b/drivers/staging/media/atomisp/i2c/atomisp-gc2235.c
@@ -1037,8 +1037,6 @@ static int gc2235_remove(struct i2c_client *client)
 	struct v4l2_subdev *sd = i2c_get_clientdata(client);
 	struct gc2235_device *dev = to_gc2235_sensor(sd);
 
-	dev_dbg(&client->dev, "%s...\n", __func__);
-
 	dev->platform_data->csi_cfg(sd, 0);
 
 	v4l2_device_unregister_subdev(sd);
diff --git a/drivers/staging/media/atomisp/i2c/atomisp-ov2680.c b/drivers/staging/media/atomisp/i2c/atomisp-ov2680.c
index d5fa3ea624ef..708288d6addc 100644
--- a/drivers/staging/media/atomisp/i2c/atomisp-ov2680.c
+++ b/drivers/staging/media/atomisp/i2c/atomisp-ov2680.c
@@ -144,9 +144,7 @@ static int ov2680_g_fnumber_range(struct v4l2_subdev *sd, s32 *val)
 static int ov2680_g_bin_factor_x(struct v4l2_subdev *sd, s32 *val)
 {
 	struct ov2680_device *dev = to_ov2680_sensor(sd);
-	struct i2c_client *client = v4l2_get_subdevdata(sd);
 
-	dev_dbg(&client->dev,  "++++%s\n", __func__);
 	*val = ov2680_res[dev->fmt_idx].bin_factor_x;
 
 	return 0;
@@ -155,10 +153,8 @@ static int ov2680_g_bin_factor_x(struct v4l2_subdev *sd, s32 *val)
 static int ov2680_g_bin_factor_y(struct v4l2_subdev *sd, s32 *val)
 {
 	struct ov2680_device *dev = to_ov2680_sensor(sd);
-	struct i2c_client *client = v4l2_get_subdevdata(sd);
 
 	*val = ov2680_res[dev->fmt_idx].bin_factor_y;
-	dev_dbg(&client->dev,  "++++%s\n", __func__);
 	return 0;
 }
 
@@ -173,7 +169,6 @@ static int ov2680_get_intg_factor(struct i2c_client *client,
 	u16 reg_val;
 	int ret;
 
-	dev_dbg(&client->dev,  "++++%s\n", __func__);
 	if (!info)
 		return -EINVAL;
 
@@ -1232,8 +1227,6 @@ static int ov2680_remove(struct i2c_client *client)
 	struct v4l2_subdev *sd = i2c_get_clientdata(client);
 	struct ov2680_device *dev = to_ov2680_sensor(sd);
 
-	dev_dbg(&client->dev, "%s...\n", __func__);
-
 	dev->platform_data->csi_cfg(sd, 0);
 
 	v4l2_device_unregister_subdev(sd);
diff --git a/drivers/staging/media/atomisp/i2c/atomisp-ov2722.c b/drivers/staging/media/atomisp/i2c/atomisp-ov2722.c
index 69409f8447b5..4ed268e5e1b7 100644
--- a/drivers/staging/media/atomisp/i2c/atomisp-ov2722.c
+++ b/drivers/staging/media/atomisp/i2c/atomisp-ov2722.c
@@ -1175,8 +1175,6 @@ static int ov2722_remove(struct i2c_client *client)
 	struct v4l2_subdev *sd = i2c_get_clientdata(client);
 	struct ov2722_device *dev = to_ov2722_sensor(sd);
 
-	dev_dbg(&client->dev, "%s...\n", __func__);
-
 	dev->platform_data->csi_cfg(sd, 0);
 	v4l2_ctrl_handler_free(&dev->ctrl_handler);
 	v4l2_device_unregister_subdev(sd);
-- 
2.31.1



