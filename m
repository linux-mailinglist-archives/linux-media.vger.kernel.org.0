Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9209736A5D3
	for <lists+linux-media@lfdr.de>; Sun, 25 Apr 2021 10:43:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229747AbhDYIoK (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 25 Apr 2021 04:44:10 -0400
Received: from msg-2.mailo.com ([213.182.54.12]:46538 "EHLO msg-2.mailo.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229485AbhDYIoG (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Sun, 25 Apr 2021 04:44:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=mailo.com; s=mailo;
        t=1619340201; bh=IfYpw+Ry1fGetkSVGFJGQbGFEKxP9hRXY5rKMEsvTH4=;
        h=X-EA-Auth:Date:From:To:Cc:Subject:Message-ID:References:
         MIME-Version:Content-Type:In-Reply-To;
        b=N40XJ2M2AzwKSOiuJcIzWuZat3i141kWQLeYGuXQKHEEU/3i2IbrmwrlphIvXvJM6
         w54gyE6aDBOFgXIy6QART1uNgoVs0ywqyJL+a7ACCWwZGPvwL7kzD4cEZXgNtFIZ2h
         MxLuz7FlAVoJUlZpQ/AiQGHh7yD87nYVW/czAR/o=
Received: by 192.168.90.14 [192.168.90.14] with ESMTP
        via ip-206.mailobj.net [213.182.55.206]
        Sun, 25 Apr 2021 10:43:20 +0200 (CEST)
X-EA-Auth: +6RQOLJuBIDK1XGWm3V6ZattEF2K/txpnI/apZzi39Vrr57UGOf9+ccLgx0TkaDu7jNpRmhdjQ3cHoZCZCZtCmaoxOo3S7Hd
Date:   Sun, 25 Apr 2021 14:13:15 +0530
From:   Deepak R Varma <drv@mailo.com>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
        linux-kernel@vger.kernel.org, drv@mailo.com
Subject: [PATCH RESEND v3 3/6] staging: media: atomisp: use __func__ over
 function names
Message-ID: <2cb42846abb7cab5e64bc29d5e496766f5df169b.1619199344.git.drv@mailo.com>
References: <cover.1619199344.git.drv@mailo.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1619199344.git.drv@mailo.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Replace hard coded function names from the debug print strings by
standard __func__ predefined identifier. This resolves following
checkpatch script WARNING:
Prefer using '"%s...", __func__' to using function's name, in a string.

Signed-off-by: Deepak R Varma <drv@mailo.com>
---

Changes since v2:
   - None.
Changes since v1:
   - None.

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



