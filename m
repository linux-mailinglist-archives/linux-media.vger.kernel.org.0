Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3DF8E36DECD
	for <lists+linux-media@lfdr.de>; Wed, 28 Apr 2021 20:10:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243489AbhD1SKy (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 28 Apr 2021 14:10:54 -0400
Received: from msg-1.mailo.com ([213.182.54.11]:35888 "EHLO msg-1.mailo.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231966AbhD1SKx (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 28 Apr 2021 14:10:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=mailo.com; s=mailo;
        t=1619633401; bh=t3JE96zVYYKG27bjjHq2ejoHUh5U+NWsxi8kpPlId1w=;
        h=X-EA-Auth:Date:From:To:Cc:Subject:Message-ID:References:
         MIME-Version:Content-Type:In-Reply-To;
        b=VK+7sQrUTghVQEyYSnEuXVP5QWtDlQfNGR9DfxGNRB6djthYJK2gvltSOdWHzZ98y
         Vnbr+nPkFqN3K7yRt/Aauctx8ZPgvj0kO/dklyrwbLwm5Dus6AZIhcafassT+Xgbn+
         VIbJN89BdTGjXihoQf7Ro+T+GQRKhcfGccRa6KUE=
Received: by 192.168.90.11 [192.168.90.11] with ESMTP
        via ip-206.mailobj.net [213.182.55.206]
        Wed, 28 Apr 2021 20:10:00 +0200 (CEST)
X-EA-Auth: npB6Mmrsu2TCp/nxcfyUQXVGkVeruWd30A9MosbrS3TkIblQb+XVhkNPLe3tfkTxtlfjWhTT+24x4ubJIWRVMwkcWVP3WegZ
Date:   Wed, 28 Apr 2021 23:39:55 +0530
From:   Deepak R Varma <drv@mailo.com>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
        linux-kernel@vger.kernel.org, drv@mailo.com
Subject: [PATCH v4 7/9] staging: media: atomisp: replace raw pr_*() by
 dev_dbg()
Message-ID: <c38ab5bf30afd559d0d1649dc47e9d3255480fa2.1619630709.git.drv@mailo.com>
References: <cover.1619630709.git.drv@mailo.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1619630709.git.drv@mailo.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

It is recommended to use driver model diagnostic macros dev_*() instead
of raw printk() or pr_*() since the former ensures that the log messages
are always associated with the corresponding device and driver. This also
addresses the checkpatch complain for not using KERN_<LEVEL> facility in
printk() call.

Suggested-by: Fabio Aiuto <fabioaiuto83@gmail.com>
Signed-off-by: Deepak R Varma <drv@mailo.com>
---

Changes since v3:
   - use dev_dbg instead of dev_info since it spams less
Changes since v2:
   - Tag Fabio Auito for the patch suggestion
Changes in v1:
   - implement following changes suggested by Fabio Aiuto
       a. use dev_info instead of pr_info
       b. update patch log message accordingly


 .../media/atomisp/i2c/atomisp-gc0310.c        | 30 +++++++++----------
 1 file changed, 15 insertions(+), 15 deletions(-)

diff --git a/drivers/staging/media/atomisp/i2c/atomisp-gc0310.c b/drivers/staging/media/atomisp/i2c/atomisp-gc0310.c
index b572551f1a0d..bb75d077ad63 100644
--- a/drivers/staging/media/atomisp/i2c/atomisp-gc0310.c
+++ b/drivers/staging/media/atomisp/i2c/atomisp-gc0310.c
@@ -300,7 +300,7 @@ static int gc0310_get_intg_factor(struct i2c_client *client,
 	/* pixel clock calculattion */
 	dev->vt_pix_clk_freq_mhz = 14400000; // 16.8MHz
 	buf->vt_pix_clk_freq_mhz = dev->vt_pix_clk_freq_mhz;
-	pr_info("vt_pix_clk_freq_mhz=%d\n", buf->vt_pix_clk_freq_mhz);
+	dev_dbg(&client->dev, "vt_pix_clk_freq_mhz=%d\n", buf->vt_pix_clk_freq_mhz);
 
 	/* get integration time */
 	buf->coarse_integration_time_min = GC0310_COARSE_INTG_TIME_MIN;
@@ -326,7 +326,7 @@ static int gc0310_get_intg_factor(struct i2c_client *client,
 	if (ret)
 		return ret;
 	buf->crop_horizontal_start = val | (reg_val & 0xFF);
-	pr_info("crop_horizontal_start=%d\n", buf->crop_horizontal_start);
+	dev_dbg(&client->dev, "crop_horizontal_start=%d\n", buf->crop_horizontal_start);
 
 	/* Getting crop_vertical_start */
 	ret =  gc0310_read_reg(client, GC0310_8BIT,
@@ -339,7 +339,7 @@ static int gc0310_get_intg_factor(struct i2c_client *client,
 	if (ret)
 		return ret;
 	buf->crop_vertical_start = val | (reg_val & 0xFF);
-	pr_info("crop_vertical_start=%d\n", buf->crop_vertical_start);
+	dev_dbg(&client->dev, "crop_vertical_start=%d\n", buf->crop_vertical_start);
 
 	/* Getting output_width */
 	ret = gc0310_read_reg(client, GC0310_8BIT,
@@ -352,7 +352,7 @@ static int gc0310_get_intg_factor(struct i2c_client *client,
 	if (ret)
 		return ret;
 	buf->output_width = val | (reg_val & 0xFF);
-	pr_info("output_width=%d\n", buf->output_width);
+	dev_dbg(&client->dev, "output_width=%d\n", buf->output_width);
 
 	/* Getting output_height */
 	ret = gc0310_read_reg(client, GC0310_8BIT,
@@ -365,12 +365,12 @@ static int gc0310_get_intg_factor(struct i2c_client *client,
 	if (ret)
 		return ret;
 	buf->output_height = val | (reg_val & 0xFF);
-	pr_info("output_height=%d\n", buf->output_height);
+	dev_dbg(&client->dev, "output_height=%d\n", buf->output_height);
 
 	buf->crop_horizontal_end = buf->crop_horizontal_start + buf->output_width - 1;
 	buf->crop_vertical_end = buf->crop_vertical_start + buf->output_height - 1;
-	pr_info("crop_horizontal_end=%d\n", buf->crop_horizontal_end);
-	pr_info("crop_vertical_end=%d\n", buf->crop_vertical_end);
+	dev_dbg(&client->dev, "crop_horizontal_end=%d\n", buf->crop_horizontal_end);
+	dev_dbg(&client->dev, "crop_vertical_end=%d\n", buf->crop_vertical_end);
 
 	/* Getting line_length_pck */
 	ret = gc0310_read_reg(client, GC0310_8BIT,
@@ -389,7 +389,7 @@ static int gc0310_get_intg_factor(struct i2c_client *client,
 		return ret;
 	sh_delay = reg_val;
 	buf->line_length_pck = buf->output_width + hori_blanking + sh_delay + 4;
-	pr_info("hori_blanking=%d sh_delay=%d line_length_pck=%d\n", hori_blanking,
+	dev_dbg(&client->dev, "hori_blanking=%d sh_delay=%d line_length_pck=%d\n", hori_blanking,
 		sh_delay, buf->line_length_pck);
 
 	/* Getting frame_length_lines */
@@ -404,7 +404,7 @@ static int gc0310_get_intg_factor(struct i2c_client *client,
 		return ret;
 	vert_blanking = val | (reg_val & 0xFF);
 	buf->frame_length_lines = buf->output_height + vert_blanking;
-	pr_info("vert_blanking=%d frame_length_lines=%d\n", vert_blanking,
+	dev_dbg(&client->dev, "vert_blanking=%d frame_length_lines=%d\n", vert_blanking,
 		buf->frame_length_lines);
 
 	buf->binning_factor_x = res->bin_factor_x ?
@@ -434,7 +434,7 @@ static int gc0310_set_gain(struct v4l2_subdev *sd, int gain)
 		dgain = gain / 2;
 	}
 
-	pr_info("gain=0x%x again=0x%x dgain=0x%x\n", gain, again, dgain);
+	dev_dbg(&client->dev, "gain=0x%x again=0x%x dgain=0x%x\n", gain, again, dgain);
 
 	/* set analog gain */
 	ret = gc0310_write_reg(client, GC0310_8BIT,
@@ -458,7 +458,7 @@ static int __gc0310_set_exposure(struct v4l2_subdev *sd, int coarse_itg,
 	struct i2c_client *client = v4l2_get_subdevdata(sd);
 	int ret;
 
-	pr_info("coarse_itg=%d gain=%d digitgain=%d\n", coarse_itg, gain, digitgain);
+	dev_dbg(&client->dev, "coarse_itg=%d gain=%d digitgain=%d\n", coarse_itg, gain, digitgain);
 
 	/* set exposure */
 	ret = gc0310_write_reg(client, GC0310_8BIT,
@@ -1020,8 +1020,8 @@ static int gc0310_set_fmt(struct v4l2_subdev *sd,
 		return -EINVAL;
 	}
 
-	printk("%s: before gc0310_write_reg_array %s\n", __func__,
-	       gc0310_res[dev->fmt_idx].desc);
+	dev_dbg(&client->dev, "%s: before gc0310_write_reg_array %s\n",
+		__func__, gc0310_res[dev->fmt_idx].desc);
 	ret = startup(sd);
 	if (ret) {
 		dev_err(&client->dev, "gc0310 startup err\n");
@@ -1085,7 +1085,7 @@ static int gc0310_detect(struct i2c_client *client)
 		return -ENODEV;
 	}
 	id = ((((u16)high) << 8) | (u16)low);
-	pr_info("sensor ID = 0x%x\n", id);
+	dev_dbg(&client->dev, "sensor ID = 0x%x\n", id);
 
 	if (id != GC0310_ID) {
 		dev_err(&client->dev, "sensor ID error, read id = 0x%x, target id = 0x%x\n", id,
@@ -1106,7 +1106,7 @@ static int gc0310_s_stream(struct v4l2_subdev *sd, int enable)
 	struct i2c_client *client = v4l2_get_subdevdata(sd);
 	int ret;
 
-	pr_info("%s S enable=%d\n", __func__, enable);
+	dev_dbg(&client->dev, "%s S enable=%d\n", __func__, enable);
 	mutex_lock(&dev->input_lock);
 
 	if (enable) {
-- 
2.31.1



