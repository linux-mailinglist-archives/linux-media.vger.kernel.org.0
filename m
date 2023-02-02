Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 35197687235
	for <lists+linux-media@lfdr.de>; Thu,  2 Feb 2023 01:15:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229710AbjBBAPI (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 1 Feb 2023 19:15:08 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38318 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229451AbjBBAPH (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 1 Feb 2023 19:15:07 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7057CB47A;
        Wed,  1 Feb 2023 16:15:05 -0800 (PST)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id BA2E8505;
        Thu,  2 Feb 2023 01:15:03 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1675296904;
        bh=EYHKfqywgmC1bohRrjhDLEs3Tpg577OfOPEG07BIrJ0=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=hc45gnLMZZy5AdSYumT9yIU0pDRc9N/J/0BeziO/gQoEZ2i9vjkNEzww13IU27HgT
         Ly2f+W3optOd7o8jS9+hqkVNlzMXYpCfpmOLmLhbN5mT3+emy5aOuKPrbhqpgW/akH
         NL8NXwiQZ5EFxClQ2ryrQC6RBenFPyI+zvJiMhcg=
Date:   Thu, 2 Feb 2023 02:15:01 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Alexander Stein <alexander.stein@ew.tq-group.com>
Cc:     Dave Stevenson <dave.stevenson@raspberrypi.com>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH 2/2] media: i2c: imx290: Add support for the mono sensor
 variant.
Message-ID: <Y9sAhVSanMmHGHmX@pendragon.ideasonboard.com>
References: <20230131190700.3476796-1-dave.stevenson@raspberrypi.com>
 <20230131190700.3476796-3-dave.stevenson@raspberrypi.com>
 <5647238.DvuYhMxLoT@steina-w>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <5647238.DvuYhMxLoT@steina-w>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, Feb 01, 2023 at 08:03:36AM +0100, Alexander Stein wrote:
> Am Dienstag, 31. Januar 2023, 20:07:00 CET schrieb Dave Stevenson:
> > The IMX290 module is available as either mono or colour (Bayer).
> > 
> > Update the driver so that it can advertise the correct mono
> > formats instead of the colour ones.
> > 
> > Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
> > ---
> >  drivers/media/i2c/imx290.c | 47 ++++++++++++++++++++++++--------------
> >  1 file changed, 30 insertions(+), 17 deletions(-)
> > 
> > diff --git a/drivers/media/i2c/imx290.c b/drivers/media/i2c/imx290.c
> > index 49d6c8bdec41..a370f1102334 100644
> > --- a/drivers/media/i2c/imx290.c
> > +++ b/drivers/media/i2c/imx290.c
> > @@ -13,6 +13,7 @@
> >  #include <linux/gpio/consumer.h>
> >  #include <linux/i2c.h>
> >  #include <linux/module.h>
> > +#include <linux/of_device.h>
> >  #include <linux/pm_runtime.h>
> >  #include <linux/regmap.h>
> >  #include <linux/regulator/consumer.h>
> > @@ -177,6 +178,7 @@ struct imx290 {
> >  	struct clk *xclk;
> >  	struct regmap *regmap;
> >  	u8 nlanes;
> > +	u8 mono;
> > 
> >  	struct v4l2_subdev sd;
> >  	struct media_pad pad;
> > @@ -414,7 +416,8 @@ static inline int imx290_modes_num(const struct imx290 *imx290) }
> > 
> >  struct imx290_format_info {
> > -	u32 code;
> > +	/* Array of codes. [0] is for colour, [1] is for mono. */
> > +	u32 code[2];
> 
> Please use a define for that.
> 
> >  	u8 bpp;
> >  	const struct imx290_regval *regs;
> >  	unsigned int num_regs;
> > @@ -422,26 +425,27 @@ struct imx290_format_info {
> > 
> >  static const struct imx290_format_info imx290_formats[] = {
> >  	{
> > -		.code = MEDIA_BUS_FMT_SRGGB10_1X10,
> > +		.code = { MEDIA_BUS_FMT_SRGGB10_1X10, MEDIA_BUS_FMT_Y10_1X10 },
> >  		.bpp = 10,
> >  		.regs = imx290_10bit_settings,
> >  		.num_regs = ARRAY_SIZE(imx290_10bit_settings),
> >  	}, {
> > -		.code = MEDIA_BUS_FMT_SRGGB12_1X12,
> > +		.code = { MEDIA_BUS_FMT_SRGGB12_1X12, MEDIA_BUS_FMT_Y12_1X12 },
> >  		.bpp = 12,
> >  		.regs = imx290_12bit_settings,
> >  		.num_regs = ARRAY_SIZE(imx290_12bit_settings),
> >  	}
> >  };
> > 
> > -static const struct imx290_format_info *imx290_format_info(u32 code)
> > +static const struct imx290_format_info *
> > +imx290_format_info(const struct imx290 *imx290, u32 code)
> >  {
> >  	unsigned int i;
> > 
> >  	for (i = 0; i < ARRAY_SIZE(imx290_formats); ++i) {
> >  		const struct imx290_format_info *info = &imx290_formats[i];
> > 
> > -		if (info->code == code)
> > +		if (info->code[imx290->mono] == code)
> >  			return info;
> >  	}
> > 
> > @@ -536,7 +540,7 @@ static int imx290_set_black_level(struct imx290 *imx290,
> > const struct v4l2_mbus_framefmt *format,
> >  				  unsigned int black_level, int *err)
> >  {
> > -	unsigned int bpp = imx290_format_info(format->code)->bpp;
> > +	unsigned int bpp = imx290_format_info(imx290, format->code)->bpp;
> > 
> >  	return imx290_write(imx290, IMX290_BLKLEVEL,
> >  			    black_level >> (16 - bpp), err);
> > @@ -548,7 +552,7 @@ static int imx290_setup_format(struct imx290 *imx290,
> >  	const struct imx290_format_info *info;
> >  	int ret;
> > 
> > -	info = imx290_format_info(format->code);
> > +	info = imx290_format_info(imx290, format->code);
> > 
> >  	ret = imx290_set_register_array(imx290, info->regs, info->num_regs);
> >  	if (ret < 0) {
> > @@ -844,10 +848,12 @@ static int imx290_enum_mbus_code(struct v4l2_subdev
> > *sd, struct v4l2_subdev_state *sd_state,
> >  				 struct v4l2_subdev_mbus_code_enum *code)
> >  {
> > +	const struct imx290 *imx290 = to_imx290(sd);
> > +
> >  	if (code->index >= ARRAY_SIZE(imx290_formats))
> >  		return -EINVAL;
> > 
> > -	code->code = imx290_formats[code->index].code;
> > +	code->code = imx290_formats[code->index].code[imx290->mono];
> > 
> >  	return 0;
> >  }
> > @@ -859,7 +865,7 @@ static int imx290_enum_frame_size(struct v4l2_subdev
> > *sd, const struct imx290 *imx290 = to_imx290(sd);
> >  	const struct imx290_mode *imx290_modes = imx290_modes_ptr(imx290);
> > 
> > -	if (!imx290_format_info(fse->code))
> > +	if (!imx290_format_info(imx290, fse->code))
> >  		return -EINVAL;
> > 
> >  	if (fse->index >= imx290_modes_num(imx290))
> > @@ -888,8 +894,8 @@ static int imx290_set_fmt(struct v4l2_subdev *sd,
> >  	fmt->format.width = mode->width;
> >  	fmt->format.height = mode->height;
> > 
> > -	if (!imx290_format_info(fmt->format.code))
> > -		fmt->format.code = imx290_formats[0].code;
> > +	if (!imx290_format_info(imx290, fmt->format.code))
> > +		fmt->format.code = imx290_formats[0].code[imx290->mono];
> > 
> >  	fmt->format.field = V4L2_FIELD_NONE;
> > 
> > @@ -1177,16 +1183,29 @@ static s64 imx290_check_link_freqs(const struct
> > imx290 *imx290, return 0;
> >  }
> > 
> > +static const struct of_device_id imx290_of_match[] = {
> > +	{ .compatible = "sony,imx290" },
> > +	{ .compatible = "sony,imx290-mono", .data = (void *)1 },
> 
> Would you mind using a model specific struct? I have a patch on my stack 
> adding support for imx327. There are some imx327 specific writes to registers 
> during initialization. I do not mind adding this struct later though.

If not a structure already, at least an enum

enum imx290_model {
	IMX290_MODEL_COLOUR,
	IMX290_MODEL_MONO,
};

> > +	{ /* sentinel */ }
> > +};
> > +MODULE_DEVICE_TABLE(of, imx290_of_match);
> > +
> >  static int imx290_parse_dt(struct imx290 *imx290)
> >  {
> > +	struct i2c_client *client = to_i2c_client(imx290->dev);
> >  	/* Only CSI2 is supported for now: */
> >  	struct v4l2_fwnode_endpoint ep = {
> >  		.bus_type = V4L2_MBUS_CSI2_DPHY
> >  	};
> > +	const struct of_device_id *match;
> >  	struct fwnode_handle *endpoint;
> >  	int ret;
> >  	s64 fq;
> > 
> > +	match = i2c_of_match_device(imx290_of_match, client);
> > +	if (match)
> > +		imx290->mono = match->data ? 1 : 0;
> > +

You can simplify this to

	imx290->mono = (enum imx290_model)of_device_get_match_data(imx290->dev);

which may then be best placed in the probe function.

I'd be tempted to rename the imx290 mono field to model as the above
looks weird, but if Alexander needs a structure anyway, we may also just
do it right away:

enum imx290_model {
	IMX290_MODEL_COLOUR,
	IMX290_MODEL_MONO,
};

struct imx290_model_info {
	bool mono;
};

static const struct imx290_model_info imx290_models[] = {
	[IMX290_MODEL_COLOUR] = {
		.mono = false,
	},
	[IMX290_MODEL_MONO] = {
		.mono = true,
	},
};

static const struct of_device_id imx290_of_match[] = {
	{
		.compatible = "sony,imx290",
		.data = &imx290_models[IMX290_MODEL_COLOUR],
	},
	{
		.compatible = "sony,imx290-mono",
		.data = &imx290_models[IMX290_MODEL_MONO],
	},
	{ /* sentinel */ },
};

...

	imx290->model = of_device_get_match_data(imx290->dev);

and use imx290->model->mono instead of imx290->mono through the code.

I'm OK if you don't want this additional complexity yet, but the code is
here already and will be needed soon :-)

> >  	endpoint = fwnode_graph_get_next_endpoint(dev_fwnode(imx290->dev), NULL);
> >  	if (!endpoint) {
> >  		dev_err(imx290->dev, "Endpoint node not found\n");
> > @@ -1351,12 +1370,6 @@ static void imx290_remove(struct i2c_client *client)
> >  	pm_runtime_set_suspended(imx290->dev);
> >  }
> > 
> > -static const struct of_device_id imx290_of_match[] = {
> > -	{ .compatible = "sony,imx290" },
> > -	{ /* sentinel */ }
> > -};
> > -MODULE_DEVICE_TABLE(of, imx290_of_match);
> > -
> >  static struct i2c_driver imx290_i2c_driver = {
> >  	.probe_new  = imx290_probe,
> >  	.remove = imx290_remove,

-- 
Regards,

Laurent Pinchart
