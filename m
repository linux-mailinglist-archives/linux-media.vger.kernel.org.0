Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 89B9E4087AE
	for <lists+linux-media@lfdr.de>; Mon, 13 Sep 2021 10:59:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238359AbhIMJAN (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 13 Sep 2021 05:00:13 -0400
Received: from relay1-d.mail.gandi.net ([217.70.183.193]:12879 "EHLO
        relay1-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236022AbhIMJAN (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 13 Sep 2021 05:00:13 -0400
Received: (Authenticated sender: jacopo@jmondi.org)
        by relay1-d.mail.gandi.net (Postfix) with ESMTPSA id 88E35240011;
        Mon, 13 Sep 2021 08:58:55 +0000 (UTC)
Date:   Mon, 13 Sep 2021 10:59:42 +0200
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     Fabio Estevam <festevam@gmail.com>
Cc:     laurent.pinchart@ideasonboard.com, hverkuil-cisco@xs4all.nl,
        linux-media@vger.kernel.org, jacopo+renesas@jmondi.org,
        morimoto.kuninori@renesas.com
Subject: Re: [RFC 1/3] media: tw9910: Allow to probe from device tree
Message-ID: <20210913085942.zmhv5pmo5nzqunuj@uno.localdomain>
References: <20210827130150.909695-1-festevam@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20210827130150.909695-1-festevam@gmail.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Fabio,

On Fri, Aug 27, 2021 at 10:01:48AM -0300, Fabio Estevam wrote:
> Currently the driver only probes via platform data passed from
> board file.
>
> Allow to probe from device tree too.
>
> Signed-off-by: Fabio Estevam <festevam@gmail.com>
> ---
> Hi,
>
> I am currently sending this series as RFC because I was
> not able to get the TW9990 to work on a imx6sx board yet.

I'm sorry but I've no access to any TW99xx device at the moment to
test with

>
> # media-ctl -p
> Media controller API version 5.14.0
>
> Media device information
> ------------------------
> driver          imx7-csi
> model           imx-media
> serial
> bus info
> hw revision     0x0
> driver version  5.14.0
>
> Device topology
> - entity 1: csi (2 pads, 2 links)
>             type V4L2 subdev subtype Unknown flags 0
>             device node name /dev/v4l-subdev0
> 	pad0: Sink
> 		[fmt:UYVY8_2X8/800x600 field:none colorspace:srgb xfer:srgb ycbcr:601 quantization:lim-range]
> 		<- "tw9910 2-0044":0 [ENABLED,IMMUTABLE]
> 	pad1: Source
> 		[fmt:UYVY8_2X8/800x600 field:none colorspace:srgb xfer:srgb ycbcr:601 quantization:lim-range]
> 		-> "csi capture":0 [ENABLED,IMMUTABLE]
>
> - entity 4: csi capture (1 pad, 1 link)
>             type Node subtype V4L flags 0
>             device node name /dev/video0
> 	pad0: Sink
> 		<- "csi":1 [ENABLED,IMMUTABLE]
>
> - entity 10: tw9910 2-0044 (1 pad, 1 link)
>              type V4L2 subdev subtype Decoder flags 0
>              device node name /dev/v4l-subdev1
> 	pad0: Source
> 		[fmt:UYVY8_2X8/640x480 field:interlaced-bt colorspace:smpte170m
> 		 crop.bounds:(0,0)/640x480
> 		 crop:(0,0)/640x480]
> 		-> "csi":0 [ENABLED,IMMUTABLE]
>
> I get the following error when setting up the pipeline:
>
> media-ctl -l "'tw9910 2-0044':0 -> 'csi':0[1]"
> media-ctl -l "'csi':1 -> 'csi capture':0[1]"
> media-ctl -v -V "'tw9910 2-0044':0 [fmt:UYVY8_2X8/800x480 field:any]"
>
> Opening media device /dev/media0
> Enumerating entities
> Found 3 entities
> Enumerating pads and links
> Setting up format UYVY8_2X8 800x480 on pad tw9910 2-0044/0
> Unable to set format: No such device or address (-6)
> Unable to setup formats: No such device or address (6)
>
> This -6 (ENXIO) error comes from:
>
> tw9910_set_frame() ---> tw9910_mask_set() ---> i2c_smbus_read_byte_data():
>
>
> static int tw9910_mask_set(struct i2c_client *client, u8 command,
> 			   u8 mask, u8 set)
> {
> 	s32 val = i2c_smbus_read_byte_data(client, command);
>
> I am able to dump TW9990 registers via i2cdetect and also via the probe
> function, so I2C access is OK.
>
> Not sure why I am getting these i2c_smbus_read_byte_data() errors.

There's an

	tw9910_s_power(&priv->subdev, 0);

at the end of the video_probe() function.

The driver handles power management with the legacy s_power() call
chain, and the receiver driver needs to v4l2_pipeline_pm_get() which
the imx driver does when the capture node is open.

Just an hint, you might have noticed already

>
>
> Any ideas?
>
> Thanks!
>
>
>  drivers/media/i2c/tw9910.c | 47 ++++++++++++++++++++++++++++++--------
>  1 file changed, 38 insertions(+), 9 deletions(-)
>
> diff --git a/drivers/media/i2c/tw9910.c b/drivers/media/i2c/tw9910.c
> index 09f5b3986928..04f3c2dbc1cc 100644
> --- a/drivers/media/i2c/tw9910.c
> +++ b/drivers/media/i2c/tw9910.c
> @@ -22,6 +22,7 @@
>  #include <linux/init.h>
>  #include <linux/kernel.h>
>  #include <linux/module.h>
> +#include <linux/of.h>

If you need this for struct of_device_id then you should include
<linux/mod_devicetable.h>

>  #include <linux/slab.h>
>  #include <linux/v4l2-mediabus.h>
>  #include <linux/videodev2.h>
> @@ -928,22 +929,27 @@ static const struct v4l2_subdev_ops tw9910_subdev_ops = {
>   * i2c_driver function
>   */
>
> +static int tw9910_parse_dt(struct i2c_client *client, struct tw9910_priv *priv)
> +{
> +	priv->info = devm_kzalloc(&client->dev, sizeof(*priv->info), GFP_KERNEL);
> +	if (!priv->info)

IS_ERR_OR_NULL() ?

> +		return -ENOMEM;

PTR_ERR() ?

> +
> +	/* Use default for now. Will retrieve from dt later */
> +	priv->info->mpout = 0;
> +	priv->info->buswidth = 8;
> +
> +	return 0;
> +}
> +
>  static int tw9910_probe(struct i2c_client *client,
>  			const struct i2c_device_id *did)
>
>  {
>  	struct tw9910_priv		*priv;
> -	struct tw9910_video_info	*info;
>  	struct i2c_adapter		*adapter = client->adapter;
>  	int ret;
>
> -	if (!client->dev.platform_data) {
> -		dev_err(&client->dev, "TW9910: missing platform data!\n");
> -		return -EINVAL;
> -	}
> -
> -	info = client->dev.platform_data;
> -
>  	if (!i2c_check_functionality(adapter, I2C_FUNC_SMBUS_BYTE_DATA)) {
>  		dev_err(&client->dev,
>  			"I2C-Adapter doesn't support I2C_FUNC_SMBUS_BYTE_DATA\n");
> @@ -954,7 +960,18 @@ static int tw9910_probe(struct i2c_client *client,
>  	if (!priv)
>  		return -ENOMEM;
>
> -	priv->info = info;
> +	if (IS_ENABLED(CONFIG_OF) && client->dev.of_node) {
> +		ret = tw9910_parse_dt(client, priv);
> +		if (ret < 0) {
> +			v4l_err(client, "DT parsing error\n");
> +			return ret;
> +		}
> +	} else if (client->dev.platform_data) {
> +		priv->info = client->dev.platform_data;
> +	} else {
> +		v4l_err(client, "No platform data!\n");
> +		return -ENODEV;
> +	}
>
>  	v4l2_i2c_subdev_init(&priv->subdev, client, &tw9910_subdev_ops);
>
> @@ -1007,13 +1024,25 @@ static int tw9910_remove(struct i2c_client *client)
>
>  static const struct i2c_device_id tw9910_id[] = {
>  	{ "tw9910", 0 },
> +	{ "tw9990", 0 },

Unrelated to this patch maybe ?

>  	{ }
>  };
>  MODULE_DEVICE_TABLE(i2c, tw9910_id);
>
> +#ifdef CONFIG_OF

I think this can be dropped ?

> +static const struct of_device_id tw9910_of_id[] = {
> +	{ .compatible = "renesas,tw9910", },
> +	{ .compatible = "renesas,tw9990", },


TW9910 was originally manufactured by Techwell, then bought by
Intersil, then bought by Renesas. Not sure what I would use as the
chip is still marketed as "Techwell" and the public documentation
released by "Intersil", according to my web searches..


> +	{ },
> +};
> +
> +MODULE_DEVICE_TABLE(of, tw9910_of_id);
> +#endif
> +
>  static struct i2c_driver tw9910_i2c_driver = {
>  	.driver = {
>  		.name = "tw9910",
> +		.of_match_table = of_match_ptr(tw9910_of_id),
>  	},
>  	.probe    = tw9910_probe,
>  	.remove   = tw9910_remove,
> --
> 2.25.1
>
