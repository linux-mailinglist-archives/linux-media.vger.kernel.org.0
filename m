Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4EC4E98F5E
	for <lists+linux-media@lfdr.de>; Thu, 22 Aug 2019 11:31:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731246AbfHVJb3 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 22 Aug 2019 05:31:29 -0400
Received: from metis.ext.pengutronix.de ([85.220.165.71]:42119 "EHLO
        metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725886AbfHVJb3 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 22 Aug 2019 05:31:29 -0400
Received: from lupine.hi.pengutronix.de ([2001:67c:670:100:3ad5:47ff:feaf:1a17] helo=lupine)
        by metis.ext.pengutronix.de with esmtp (Exim 4.92)
        (envelope-from <p.zabel@pengutronix.de>)
        id 1i0jRC-00004x-Lo; Thu, 22 Aug 2019 11:31:22 +0200
Message-ID: <1566466282.3653.5.camel@pengutronix.de>
Subject: Re: [PATCH v2 3/3] media: imx214: Add new control with
 V4L2_CID_UNIT_CELL_SIZE
From:   Philipp Zabel <p.zabel@pengutronix.de>
To:     Ricardo Ribalda Delgado <ribalda@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Date:   Thu, 22 Aug 2019 11:31:22 +0200
In-Reply-To: <20190820094027.4144-3-ribalda@kernel.org>
References: <20190820094027.4144-1-ribalda@kernel.org>
         <20190820094027.4144-3-ribalda@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.22.6-1+deb9u2 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 2001:67c:670:100:3ad5:47ff:feaf:1a17
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-media@vger.kernel.org
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, 2019-08-20 at 11:40 +0200, Ricardo Ribalda Delgado wrote:
> According to the product brief, the unit cell size is 1120 nanometers^2.
> 
> https://www.sony-semicon.co.jp/products_en/IS/sensor1/img/products/ProductBrief_IMX214_20150428.pdf
> 
> Signed-off-by: Ricardo Ribalda Delgado <ribalda@kernel.org>
> ---
>  drivers/media/i2c/imx214.c | 23 +++++++++++++++++++++++
>  1 file changed, 23 insertions(+)
> 
> diff --git a/drivers/media/i2c/imx214.c b/drivers/media/i2c/imx214.c
> index 159a3a604f0e..cc0a013ba7da 100644
> --- a/drivers/media/i2c/imx214.c
> +++ b/drivers/media/i2c/imx214.c
> @@ -47,6 +47,7 @@ struct imx214 {
>  	struct v4l2_ctrl *pixel_rate;
>  	struct v4l2_ctrl *link_freq;
>  	struct v4l2_ctrl *exposure;
> +	struct v4l2_ctrl *unit_size;

This is never used.

Neither are pixel_rate and exposure, it appears. And link_freq is only
used locally in imx214_probe to set the read-only flag.

>  
>  	struct regulator_bulk_data	supplies[IMX214_NUM_SUPPLIES];
>  
> @@ -941,6 +942,26 @@ static int __maybe_unused imx214_resume(struct device *dev)
>  	return ret;
>  }
>  
> +static void unit_size_init(const struct v4l2_ctrl *ctrl, u32 idx,
> +		     union v4l2_ctrl_ptr ptr)
> +{
> +	ptr.p_area->width = 1120;
> +	ptr.p_area->height = 1120;
> +}
> +
> +static const struct v4l2_ctrl_type_ops unit_size_ops = {
> +	.init = unit_size_init,
> +};
> +
> +static struct v4l2_ctrl *new_unit_size_ctrl(struct v4l2_ctrl_handler *handler)
> +{
> +	static struct v4l2_ctrl_config ctrl = {
> +		.id = V4L2_CID_UNIT_CELL_SIZE,
> +		.type_ops = &unit_size_ops,
> +	};
> +
> +	return v4l2_ctrl_new_custom(handler, &ctrl, NULL);
> +}
>  static int imx214_probe(struct i2c_client *client)
>  {
>  	struct device *dev = &client->dev;
> @@ -1029,6 +1050,8 @@ static int imx214_probe(struct i2c_client *client)
>  					     V4L2_CID_EXPOSURE,
>  					     0, 3184, 1, 0x0c70);
>  
> +	imx214->unit_size = new_unit_size_ctrl(&imx214->ctrls);
> +
>  	ret = imx214->ctrls.error;
>  	if (ret) {
>  		dev_err(&client->dev, "%s control init failed (%d)\n",

This seems like a lot of parts to assemble in every sensor driver just
to provide a constant area control. Should this be turned into a
v4l2_ctrl_new_area helper that takes a const struct v4l2_area as an
argument?

	static const struct v4l2_area unit_cell_size = {
		.width = 1120,
		.height = 1120
	};

	v4l2_ctrl_new_area(&imx214->ctrls, V4L2_CID_UNIT_CELL_SIZE,
			   &unit_cell_size);

regards
Philipp
