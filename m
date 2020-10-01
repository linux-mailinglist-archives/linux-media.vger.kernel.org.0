Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0AE36280B77
	for <lists+linux-media@lfdr.de>; Fri,  2 Oct 2020 01:54:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1733120AbgJAXyR (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 1 Oct 2020 19:54:17 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:55904 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727017AbgJAXyR (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 1 Oct 2020 19:54:17 -0400
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 25EFD60;
        Fri,  2 Oct 2020 01:54:14 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1601596454;
        bh=VLmwZy4647imvJUV3k08ckcOoCKcxqcQrPN5fHTM198=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=u6qXuQtejQMUqWJtfTnaLpXDe+pognigiR0XcJl+6WrOeRRszJ0z6rQ5WciGZYqVJ
         eysrJPvK4reOQ12bXd1E9+qlp15iVvktQ01gTYYrbopbtWgQ1umtOTCm4j97+jUG/K
         kNPU/fpmOzwKW8YhxEQEXTX6kRfJUEqoxEIvos9s=
Date:   Fri, 2 Oct 2020 02:53:36 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Stefan =?utf-8?Q?Riedm=C3=BCller?= <s.riedmueller@phytec.de>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        Christian Hemp <c.hemp@phytec.de>,
        Jan Luebbe <jlu@pengutronix.de>
Subject: Re: [PATCH v2 1/5] media: mt9p031: Add support for 8 bit and 10 bit
 formats
Message-ID: <20201001235336.GI3722@pendragon.ideasonboard.com>
References: <20200930105133.139981-1-s.riedmueller@phytec.de>
 <20200930114231.GH5689@pendragon.ideasonboard.com>
 <eacb7df5-bc68-3047-b893-4c1ba4975278@phytec.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <eacb7df5-bc68-3047-b893-4c1ba4975278@phytec.de>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Stefan,

On Thu, Oct 01, 2020 at 11:07:00AM +0200, Stefan Riedmüller wrote:
> On 30.09.20 13:42, Laurent Pinchart wrote:
> > On Wed, Sep 30, 2020 at 12:51:29PM +0200, Stefan Riedmueller wrote:
> >> From: Christian Hemp <c.hemp@phytec.de>
> >>
> >> Aside from 12 bit monochrome or color format the sensor implicitly
> >> supports 10 and 8 bit formats as well by simply dropping the
> >> corresponding LSBs.
> > 
> > That's not how it should work though. If you set the format on
> > MEDIA_BUS_FMT_SGRBG8_1X8 through the pipeline for instance, you will end
> > up capturing the 8 LSB, not the 8 MSB.
> > 
> > What's your use case for this ?
> 
> I use this sensor in combination with an i.MX 6 and i.MX 6UL. When the 
> sensor is connected with 12 bit (or 10 bit on the i.MX 6UL) and I set 
> MEDIA_BUS_FMT_SGRBG8_1X8 through the pipeline the CSI interface drops the 
> unused 4 LSB (or 2 LSB on the i.MX 6UL) so I get the 8 MSB from my 12 bit 
> sensor.

Is that the PIXEL_BIT bit in CSI_CSICR1 for the i.MX6UL ? If so I think
this should be handled in the imx7-media-csi driver. You could set the
format to MEDIA_BUS_FMT_SGRBG10_1X10 on the sink pad of the CSI and to
MEDIA_BUS_FMT_SGRBG8_1X8 on the source pad to configure this. I don't
think the sensor driver should be involved, otherwise we'd have to patch
all sensor drivers. From a sensor point of view, it outputs 12-bit
Bayer, not 8-bit.

Now there's a caveat. When used with the i.MX6UL, I assume you connected
D[11:2] of the sensor to D[9:0] of the i.MX6UL, right ? The i.MX6UL
doesn't support 12-bit inputs, so it should accept
MEDIA_BUS_FMT_SGRBG12_1X12 on its sink pad. In this case, as D[1:0] of
the sensor are left unconnected, I think you should set data-shift to 2
and bus-width to 10 in DT on the sensor side. The MT9P031 driver should
parse that, and output MEDIA_BUS_FMT_SGRBG10_1X10 instead of
MEDIA_BUS_FMT_SGRBG12_1X12 in that case.

> Does this clarify things? Maybe the description in the commit message is not 
> accurate enough or did I get something wrong?
> 
> >> Signed-off-by: Christian Hemp <c.hemp@phytec.de>
> >> [jlu@pengutronix.de: simplified by dropping v4l2_colorspace handling]
> >> Signed-off-by: Jan Luebbe <jlu@pengutronix.de>
> >> Signed-off-by: Stefan Riedmueller <s.riedmueller@phytec.de>
> >> ---
> >> Changes in v2:
> >>   - Use unsigned int for num_fmts and loop variable in find_datafmt
> >>   - Remove superfluous const qualifier from find_datafmt
> >> ---
> >>   drivers/media/i2c/mt9p031.c | 50 +++++++++++++++++++++++++++++--------
> >>   1 file changed, 40 insertions(+), 10 deletions(-)
> >>
> >> diff --git a/drivers/media/i2c/mt9p031.c b/drivers/media/i2c/mt9p031.c
> >> index dc23b9ed510a..2e6671ef877c 100644
> >> --- a/drivers/media/i2c/mt9p031.c
> >> +++ b/drivers/media/i2c/mt9p031.c
> >> @@ -116,6 +116,18 @@ enum mt9p031_model {
> >>   	MT9P031_MODEL_MONOCHROME,
> >>   };
> >>   
> >> +static const u32 mt9p031_color_fmts[] = {
> >> +	MEDIA_BUS_FMT_SGRBG8_1X8,
> >> +	MEDIA_BUS_FMT_SGRBG10_1X10,
> >> +	MEDIA_BUS_FMT_SGRBG12_1X12,
> >> +};
> >> +
> >> +static const u32 mt9p031_monochrome_fmts[] = {
> >> +	MEDIA_BUS_FMT_Y8_1X8,
> >> +	MEDIA_BUS_FMT_Y10_1X10,
> >> +	MEDIA_BUS_FMT_Y12_1X12,
> >> +};
> >> +
> >>   struct mt9p031 {
> >>   	struct v4l2_subdev subdev;
> >>   	struct media_pad pad;
> >> @@ -138,6 +150,9 @@ struct mt9p031 {
> >>   	struct v4l2_ctrl *blc_auto;
> >>   	struct v4l2_ctrl *blc_offset;
> >>   
> >> +	const u32 *fmts;
> >> +	unsigned int num_fmts;
> >> +
> >>   	/* Registers cache */
> >>   	u16 output_control;
> >>   	u16 mode2;
> >> @@ -148,6 +163,17 @@ static struct mt9p031 *to_mt9p031(struct v4l2_subdev *sd)
> >>   	return container_of(sd, struct mt9p031, subdev);
> >>   }
> >>   
> >> +static u32 mt9p031_find_datafmt(struct mt9p031 *mt9p031, u32 code)
> >> +{
> >> +	unsigned int i;
> >> +
> >> +	for (i = 0; i < mt9p031->num_fmts; i++)
> >> +		if (mt9p031->fmts[i] == code)
> >> +			return mt9p031->fmts[i];
> >> +
> >> +	return mt9p031->fmts[mt9p031->num_fmts-1];
> >> +}
> >> +
> >>   static int mt9p031_read(struct i2c_client *client, u8 reg)
> >>   {
> >>   	return i2c_smbus_read_word_swapped(client, reg);
> >> @@ -476,10 +502,11 @@ static int mt9p031_enum_mbus_code(struct v4l2_subdev *subdev,
> >>   {
> >>   	struct mt9p031 *mt9p031 = to_mt9p031(subdev);
> >>   
> >> -	if (code->pad || code->index)
> >> +	if (code->pad || code->index >= mt9p031->num_fmts)
> >>   		return -EINVAL;
> >>   
> >> -	code->code = mt9p031->format.code;
> >> +	code->code = mt9p031->fmts[code->index];
> >> +
> >>   	return 0;
> >>   }
> >>   
> >> @@ -573,6 +600,8 @@ static int mt9p031_set_format(struct v4l2_subdev *subdev,
> >>   	__format->width = __crop->width / hratio;
> >>   	__format->height = __crop->height / vratio;
> >>   
> >> +	__format->code = mt9p031_find_datafmt(mt9p031, format->format.code);
> >> +
> >>   	format->format = *__format;
> >>   
> >>   	return 0;
> >> @@ -951,10 +980,7 @@ static int mt9p031_open(struct v4l2_subdev *subdev, struct v4l2_subdev_fh *fh)
> >>   
> >>   	format = v4l2_subdev_get_try_format(subdev, fh->pad, 0);
> >>   
> >> -	if (mt9p031->model == MT9P031_MODEL_MONOCHROME)
> >> -		format->code = MEDIA_BUS_FMT_Y12_1X12;
> >> -	else
> >> -		format->code = MEDIA_BUS_FMT_SGRBG12_1X12;
> >> +	format->code = mt9p031_find_datafmt(mt9p031, 0);
> >>   
> >>   	format->width = MT9P031_WINDOW_WIDTH_DEF;
> >>   	format->height = MT9P031_WINDOW_HEIGHT_DEF;
> >> @@ -1121,10 +1147,14 @@ static int mt9p031_probe(struct i2c_client *client,
> >>   	mt9p031->crop.left = MT9P031_COLUMN_START_DEF;
> >>   	mt9p031->crop.top = MT9P031_ROW_START_DEF;
> >>   
> >> -	if (mt9p031->model == MT9P031_MODEL_MONOCHROME)
> >> -		mt9p031->format.code = MEDIA_BUS_FMT_Y12_1X12;
> >> -	else
> >> -		mt9p031->format.code = MEDIA_BUS_FMT_SGRBG12_1X12;
> >> +	if (mt9p031->model == MT9P031_MODEL_MONOCHROME) {
> >> +		mt9p031->fmts = mt9p031_monochrome_fmts;
> >> +		mt9p031->num_fmts = ARRAY_SIZE(mt9p031_monochrome_fmts);
> >> +	} else {
> >> +		mt9p031->fmts = mt9p031_color_fmts;
> >> +		mt9p031->num_fmts = ARRAY_SIZE(mt9p031_color_fmts);
> >> +	}
> >> +	mt9p031->format.code = mt9p031_find_datafmt(mt9p031, 0);
> >>   
> >>   	mt9p031->format.width = MT9P031_WINDOW_WIDTH_DEF;
> >>   	mt9p031->format.height = MT9P031_WINDOW_HEIGHT_DEF;

-- 
Regards,

Laurent Pinchart
