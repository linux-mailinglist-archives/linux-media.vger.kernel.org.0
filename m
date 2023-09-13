Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0251579EBFA
	for <lists+linux-media@lfdr.de>; Wed, 13 Sep 2023 17:04:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241013AbjIMPED (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 13 Sep 2023 11:04:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35062 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239071AbjIMPED (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 13 Sep 2023 11:04:03 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 38D5CB3
        for <linux-media@vger.kernel.org>; Wed, 13 Sep 2023 08:03:59 -0700 (PDT)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 6D57E755;
        Wed, 13 Sep 2023 17:02:25 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1694617345;
        bh=mHq/ygIoGWCCfopo0ZWoTbXIQPi6MujEw+qyR0ZyM54=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=RQudWMKsE2R2uvLPF9l34SkMp0fGWcNBEQqetecF7eVUlFFDzUYhh4YCZz1NVv8jc
         nJ/1WxaxSbeVO0Z4d06UKmlgNTOLb60OXWTt6Dz5FSAwgOLPbcQNjqmXPbPO7ToroI
         5cHvBqy/REqlOCBHJ+ht556+C5BioYvFTFawNqiQ=
Date:   Wed, 13 Sep 2023 18:04:10 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Cc:     linux-media@vger.kernel.org, Sakari Ailus <sakari.ailus@iki.fi>,
        Dave Stevenson <dave.stevenson@raspberrypi.com>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Hans de Goede <hdegoede@redhat.com>
Subject: Re: [PATCH v3 17/20] media: i2c: imx219: Separate horizontal and
 vertical binning
Message-ID: <20230913150410.GB17108@pendragon.ideasonboard.com>
References: <20230913135638.26277-1-laurent.pinchart@ideasonboard.com>
 <20230913135638.26277-18-laurent.pinchart@ideasonboard.com>
 <dptztdhugb45attj7jfpfg4yn3zh7lh3qpwywrfnoneozyhrde@ussyblvnfnge>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <dptztdhugb45attj7jfpfg4yn3zh7lh3qpwywrfnoneozyhrde@ussyblvnfnge>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Jacopo,

On Wed, Sep 13, 2023 at 04:54:56PM +0200, Jacopo Mondi wrote:
> On Wed, Sep 13, 2023 at 04:56:35PM +0300, Laurent Pinchart wrote:
> > The IMX219 has distinct binning registers for the horizontal and
> > vertical directions. Calculate their value and write them separately.
> 
> Do you expect different binning factors in horizontal and vertical
> directions ?

It should work, should someone decide they need to do so. I thus see no
reason to disallow it.

> > Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > ---
> >  drivers/media/i2c/imx219.c | 39 ++++++++++++++++++++++++++------------
> >  1 file changed, 27 insertions(+), 12 deletions(-)
> >
> > diff --git a/drivers/media/i2c/imx219.c b/drivers/media/i2c/imx219.c
> > index 6bfdceaf5044..bf1c2a1dad95 100644
> > --- a/drivers/media/i2c/imx219.c
> > +++ b/drivers/media/i2c/imx219.c
> > @@ -90,10 +90,11 @@
> >  #define IMX219_REG_ORIENTATION		CCI_REG8(0x0172)
> >
> >  /* Binning  Mode */
> > -#define IMX219_REG_BINNING_MODE		CCI_REG16(0x0174)
> > -#define IMX219_BINNING_NONE		0x0000
> > -#define IMX219_BINNING_2X2		0x0101
> > -#define IMX219_BINNING_2X2_ANALOG	0x0303
> > +#define IMX219_REG_BINNING_MODE_H	CCI_REG8(0x0174)
> > +#define IMX219_REG_BINNING_MODE_V	CCI_REG8(0x0175)
> > +#define IMX219_BINNING_NONE		0x00
> > +#define IMX219_BINNING_X2		0x01
> > +#define IMX219_BINNING_X2_ANALOG	0x03
> >
> >  #define IMX219_REG_CSI_DATA_FORMAT_A	CCI_REG16(0x018c)
> >
> > @@ -615,7 +616,7 @@ static int imx219_set_framefmt(struct imx219 *imx219,
> >  	const struct v4l2_mbus_framefmt *format;
> >  	const struct v4l2_rect *crop;
> >  	unsigned int bpp;
> > -	u64 bin_mode;
> > +	u64 bin_h, bin_v;
> >  	int ret = 0;
> >
> >  	format = v4l2_subdev_get_pad_format(&imx219->sd, state, 0);
> > @@ -647,14 +648,28 @@ static int imx219_set_framefmt(struct imx219 *imx219,
> >  	cci_write(imx219->regmap, IMX219_REG_Y_ADD_END_A,
> >  		  crop->top - IMX219_PIXEL_ARRAY_TOP + crop->height - 1, &ret);
> >
> > -	if (format->width == crop->width && format->height == crop->height)
> > -		bin_mode = IMX219_BINNING_NONE;
> > -	else if (bpp == 8)
> > -		bin_mode = IMX219_BINNING_2X2_ANALOG;
> > -	else
> > -		bin_mode = IMX219_BINNING_2X2;
> > +	switch (crop->width / format->width) {
> > +	case 1:
> > +	default:
> 
> With the currently supported modes nothing but 1 or 2 can be obtained.
> I would have kept default: out, or used it to WARN developers adding
> new modes they have to support other binning factors (4x is the only
> not supported one). A minor though.

The crop rectangle gets removed from the mode data in a latter patch, so
potential for errors will disappear :-)

> > +		bin_h = IMX219_BINNING_NONE;
> > +		break;
> > +	case 2:
> > +		bin_h = bpp == 8 ? IMX219_BINNING_X2_ANALOG : IMX219_BINNING_X2;
> > +		break;
> > +	}
> >
> > -	cci_write(imx219->regmap, IMX219_REG_BINNING_MODE, bin_mode, &ret);
> > +	switch (crop->height / format->height) {
> > +	case 1:
> > +	default:
> > +		bin_v = IMX219_BINNING_NONE;
> > +		break;
> > +	case 2:
> > +		bin_v = bpp == 8 ? IMX219_BINNING_X2_ANALOG : IMX219_BINNING_X2;
> > +		break;
> > +	}
> > +
> > +	cci_write(imx219->regmap, IMX219_REG_BINNING_MODE_H, bin_h, &ret);
> > +	cci_write(imx219->regmap, IMX219_REG_BINNING_MODE_V, bin_v, &ret);
> 
> With the currently supported mode, this could have been a single
> switch(). Doesn't hurt though
> 
> Reviewed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
> 
> >
> >  	cci_write(imx219->regmap, IMX219_REG_X_OUTPUT_SIZE,
> >  		  format->width, &ret);

-- 
Regards,

Laurent Pinchart
