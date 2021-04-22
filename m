Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8958E367EA8
	for <lists+linux-media@lfdr.de>; Thu, 22 Apr 2021 12:31:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235811AbhDVKbb (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 22 Apr 2021 06:31:31 -0400
Received: from msg-2.mailo.com ([213.182.54.12]:47252 "EHLO msg-2.mailo.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230270AbhDVKbb (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 22 Apr 2021 06:31:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=mailo.com; s=mailo;
        t=1619087446; bh=1Tw5TT8F9DngVu9o8wLUbiXpjBJmc/lFX8d3XeMY7LU=;
        h=X-EA-Auth:Date:From:To:Cc:Subject:Message-ID:MIME-Version:
         Content-Type;
        b=Jlykn2+sLEuBucFyMUN/xRyiYSNSHv3VbV0DMCpxx9PxXFJ37I1hrsSvYGRysQQTr
         oAh2DRyqFttLIxR186RgA5a8TWvFKgFT6VauzCRbjyiORQQpJTuI084i6FIw9j2+Bg
         1FD4793wLQqKRmu+RWsTRVNTGMy8JfcrMQoBb2JI=
Received: by 192.168.90.16 [192.168.90.16] with ESMTP
        via ip-206.mailobj.net [213.182.55.206]
        Thu, 22 Apr 2021 12:30:45 +0200 (CEST)
X-EA-Auth: ST+X3GRd5i66RXwE6cSZZVlovvtaJy8OF8/no//J9UjmxgjOyJZtlDQeFvU73PcXkRXPbFGIuQlaeXAlgewTK47aJzLAEAoj
Date:   Thu, 22 Apr 2021 16:00:37 +0530
From:   Deepak R Varma <drv@mailo.com>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
        linux-kernel@vger.kernel.org, mh12gx2825@gmail.com, drv@mailo.com
Subject: [PATCH] staging: media: atomisp: replace pr_info() by dev_info()
Message-ID: <20210422103037.GA239298@localhost>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

It is recommended to use driver model diagnostic macros dev_*() instead
of pr_*() since the former ensures that the log messages are always
associated with the corresponding device and driver.

Suggested-by: Fabio Aiuto <fabioaiuto83@gmail.com>
Signed-off-by: Deepak R Varma <drv@mailo.com>
---

Note: There are few more pr_into() calls that I have not replaced since
they are very basic (entry and exit) and temporary. They can be removed 
if the APIs are fully tested. See this example:
	pr_info("%s S\n", __func__);

Let me know if I should remove them and resubmit this patch.


 .../media/atomisp/i2c/atomisp-gc0310.c        | 30 +++++++++----------
 1 file changed, 15 insertions(+), 15 deletions(-)

diff --git a/drivers/staging/media/atomisp/i2c/atomisp-gc0310.c b/drivers/staging/media/atomisp/i2c/atomisp-gc0310.c
index 7e4e123fdb52..27153ec6f65e 100644
--- a/drivers/staging/media/atomisp/i2c/atomisp-gc0310.c
+++ b/drivers/staging/media/atomisp/i2c/atomisp-gc0310.c
@@ -300,7 +300,7 @@ static int gc0310_get_intg_factor(struct i2c_client *client,
 	/* pixel clock calculattion */
 	dev->vt_pix_clk_freq_mhz = 14400000; // 16.8MHz
 	buf->vt_pix_clk_freq_mhz = dev->vt_pix_clk_freq_mhz;
-	pr_info("vt_pix_clk_freq_mhz=%d\n", buf->vt_pix_clk_freq_mhz);
+	dev_info(&client->dev, "vt_pix_clk_freq_mhz=%d\n", buf->vt_pix_clk_freq_mhz);
 
 	/* get integration time */
 	buf->coarse_integration_time_min = GC0310_COARSE_INTG_TIME_MIN;
@@ -326,7 +326,7 @@ static int gc0310_get_intg_factor(struct i2c_client *client,
 	if (ret)
 		return ret;
 	buf->crop_horizontal_start = val | (reg_val & 0xFF);
-	pr_info("crop_horizontal_start=%d\n", buf->crop_horizontal_start);
+	dev_info(&client->dev, "crop_horizontal_start=%d\n", buf->crop_horizontal_start);
 
 	/* Getting crop_vertical_start */
 	ret =  gc0310_read_reg(client, GC0310_8BIT,
@@ -339,7 +339,7 @@ static int gc0310_get_intg_factor(struct i2c_client *client,
 	if (ret)
 		return ret;
 	buf->crop_vertical_start = val | (reg_val & 0xFF);
-	pr_info("crop_vertical_start=%d\n", buf->crop_vertical_start);
+	dev_info(&client->dev, "crop_vertical_start=%d\n", buf->crop_vertical_start);
 
 	/* Getting output_width */
 	ret = gc0310_read_reg(client, GC0310_8BIT,
@@ -352,7 +352,7 @@ static int gc0310_get_intg_factor(struct i2c_client *client,
 	if (ret)
 		return ret;
 	buf->output_width = val | (reg_val & 0xFF);
-	pr_info("output_width=%d\n", buf->output_width);
+	dev_info(&client->dev, "output_width=%d\n", buf->output_width);
 
 	/* Getting output_height */
 	ret = gc0310_read_reg(client, GC0310_8BIT,
@@ -365,12 +365,12 @@ static int gc0310_get_intg_factor(struct i2c_client *client,
 	if (ret)
 		return ret;
 	buf->output_height = val | (reg_val & 0xFF);
-	pr_info("output_height=%d\n", buf->output_height);
+	dev_info(&client->dev, "output_height=%d\n", buf->output_height);
 
 	buf->crop_horizontal_end = buf->crop_horizontal_start + buf->output_width - 1;
 	buf->crop_vertical_end = buf->crop_vertical_start + buf->output_height - 1;
-	pr_info("crop_horizontal_end=%d\n", buf->crop_horizontal_end);
-	pr_info("crop_vertical_end=%d\n", buf->crop_vertical_end);
+	dev_info(&client->dev, "crop_horizontal_end=%d\n", buf->crop_horizontal_end);
+	dev_info(&client->dev, "crop_vertical_end=%d\n", buf->crop_vertical_end);
 
 	/* Getting line_length_pck */
 	ret = gc0310_read_reg(client, GC0310_8BIT,
@@ -389,8 +389,8 @@ static int gc0310_get_intg_factor(struct i2c_client *client,
 		return ret;
 	sh_delay = reg_val;
 	buf->line_length_pck = buf->output_width + hori_blanking + sh_delay + 4;
-	pr_info("hori_blanking=%d sh_delay=%d line_length_pck=%d\n", hori_blanking,
-		sh_delay, buf->line_length_pck);
+	dev_info(&client->dev, "hori_blanking=%d sh_delay=%d line_length_pck=%d\n", hori_blanking,
+		 sh_delay, buf->line_length_pck);
 
 	/* Getting frame_length_lines */
 	ret = gc0310_read_reg(client, GC0310_8BIT,
@@ -404,8 +404,8 @@ static int gc0310_get_intg_factor(struct i2c_client *client,
 		return ret;
 	vert_blanking = val | (reg_val & 0xFF);
 	buf->frame_length_lines = buf->output_height + vert_blanking;
-	pr_info("vert_blanking=%d frame_length_lines=%d\n", vert_blanking,
-		buf->frame_length_lines);
+	dev_info(&client->dev, "vert_blanking=%d frame_length_lines=%d\n", vert_blanking,
+		 buf->frame_length_lines);
 
 	buf->binning_factor_x = res->bin_factor_x ?
 				res->bin_factor_x : 1;
@@ -434,7 +434,7 @@ static int gc0310_set_gain(struct v4l2_subdev *sd, int gain)
 		dgain = gain / 2;
 	}
 
-	pr_info("gain=0x%x again=0x%x dgain=0x%x\n", gain, again, dgain);
+	dev_info(&client->dev, "gain=0x%x again=0x%x dgain=0x%x\n", gain, again, dgain);
 
 	/* set analog gain */
 	ret = gc0310_write_reg(client, GC0310_8BIT,
@@ -458,7 +458,7 @@ static int __gc0310_set_exposure(struct v4l2_subdev *sd, int coarse_itg,
 	struct i2c_client *client = v4l2_get_subdevdata(sd);
 	int ret;
 
-	pr_info("coarse_itg=%d gain=%d digitgain=%d\n", coarse_itg, gain, digitgain);
+	dev_info(&client->dev, "coarse_itg=%d gain=%d digitgain=%d\n", coarse_itg, gain, digitgain);
 
 	/* set exposure */
 	ret = gc0310_write_reg(client, GC0310_8BIT,
@@ -1085,7 +1085,7 @@ static int gc0310_detect(struct i2c_client *client)
 		return -ENODEV;
 	}
 	id = ((((u16)high) << 8) | (u16)low);
-	pr_info("sensor ID = 0x%x\n", id);
+	dev_info(&client->dev, "sensor ID = 0x%x\n", id);
 
 	if (id != GC0310_ID) {
 		dev_err(&client->dev, "sensor ID error, read id = 0x%x, target id = 0x%x\n", id,
@@ -1106,7 +1106,7 @@ static int gc0310_s_stream(struct v4l2_subdev *sd, int enable)
 	struct i2c_client *client = v4l2_get_subdevdata(sd);
 	int ret;
 
-	pr_info("%s S enable=%d\n", __func__, enable);
+	dev_info(&client->dev, "%s S enable=%d\n", __func__, enable);
 	mutex_lock(&dev->input_lock);
 
 	if (enable) {
-- 
2.25.1



