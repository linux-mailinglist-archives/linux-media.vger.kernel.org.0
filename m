Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A25DD5AC11D
	for <lists+linux-media@lfdr.de>; Sat,  3 Sep 2022 21:17:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231496AbiICTRz (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 3 Sep 2022 15:17:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57414 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229698AbiICTRy (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sat, 3 Sep 2022 15:17:54 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 27B1F26108
        for <linux-media@vger.kernel.org>; Sat,  3 Sep 2022 12:17:53 -0700 (PDT)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 750DB25B;
        Sat,  3 Sep 2022 21:17:50 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1662232670;
        bh=rtch0uL3BWkPqc5CYEXxNQpwNTykKR2Wr9R8639Pv80=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=P23o/Kg4ssl1D+cYQJj9wEG59tFEL/eDQD/sCwQ0Jcj0iE1ln0zpphMvCdTq3iifS
         wOuEk5h4JsSsMfTgm6qEJ3GhdCKlKXL1PnJl+W19Fuo8U/T3WtIGOachWNT6UZWJnP
         79amknjeDw+x9GlDnJEfikn3Bdqy27Wqy725jNcM=
Date:   Sat, 3 Sep 2022 22:17:37 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Dafna Hirschfeld <dafna@fastmail.com>
Cc:     linux-media@vger.kernel.org, Heiko Stuebner <heiko@sntech.de>,
        Florian Sylvestre <fsylvestre@baylibre.com>,
        Paul Elder <paul.elder@ideasonboard.com>
Subject: Re: [PATCH v2 4/9] media: rkisp1: Allow setting all color space
 fields on ISP source pad
Message-ID: <YxOoUQ9HpEpW7aH9@pendragon.ideasonboard.com>
References: <20220823171840.8958-1-laurent.pinchart@ideasonboard.com>
 <20220823171840.8958-5-laurent.pinchart@ideasonboard.com>
 <20220903033513.6aikuprgp5ay6mmy@guri>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220903033513.6aikuprgp5ay6mmy@guri>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Sat, Sep 03, 2022 at 06:35:13AM +0300, Dafna Hirschfeld wrote:
> On 23.08.2022 20:18, Laurent Pinchart wrote:
> > The ISP output color space is configured through the ISP source pad. At
> > the moment, only the quantization can be set. Extend it to the three
> > other color space fields:
> > 
> > - The ycbcr_enc field will be used to configure the RGB to YUV matrix
> >   (currently hardcoded to Rec. 601).
> > 
> > - The colorspace (which controls the color primaries) and xfer_func
> >   fields will not be used to configure the ISP, as the corresponding
> >   hardware blocks (the cross-talk RGB to RGB matrix and the tone mapping
> >   curve) are programmed directly by applications through ISP parameters.
> >   Nonetheless, those two fields should be set by applications to match
> >   the ISP configuration, in order to propagate the correct color space
> >   down the pipeline up to the capture video nodes.
> > 
> > Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > ---
> > Changes since v1:
> > 
> > - Fix quantization setting that was set on sink pad by mistake
> > ---
> >  .../platform/rockchip/rkisp1/rkisp1-isp.c     | 55 ++++++++++++++++---
> >  1 file changed, 48 insertions(+), 7 deletions(-)
> > 
> > diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c b/drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c
> > index d34f32271d74..7869f0cced62 100644
> > --- a/drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c
> > +++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c
> > @@ -609,6 +609,7 @@ static void rkisp1_isp_set_src_fmt(struct rkisp1_isp *isp,
> >  	struct v4l2_mbus_framefmt *sink_fmt;
> >  	struct v4l2_mbus_framefmt *src_fmt;
> >  	const struct v4l2_rect *src_crop;
> > +	bool set_csc;
> > 
> >  	sink_fmt = rkisp1_isp_get_pad_fmt(isp, sd_state,
> >  					  RKISP1_ISP_PAD_SINK_VIDEO, which);
> > @@ -645,20 +646,60 @@ static void rkisp1_isp_set_src_fmt(struct rkisp1_isp *isp,
> >  	src_fmt->height = src_crop->height;
> > 
> >  	/*
> > -	 * The CSC API is used to allow userspace to force full
> > -	 * quantization on YUV formats.
> > +	 * Copy the color space for the sink pad. When converting from Bayer to
> > +	 * YUV, default to a limited quantization range.
> >  	 */
> > -	if (format->flags & V4L2_MBUS_FRAMEFMT_SET_CSC &&
> > -	    format->quantization == V4L2_QUANTIZATION_FULL_RANGE &&
> > +	src_fmt->colorspace = sink_fmt->colorspace;
> > +	src_fmt->xfer_func = sink_fmt->xfer_func;
> > +	src_fmt->ycbcr_enc = sink_fmt->ycbcr_enc;
> > +
> > +	if (sink_info->pixel_enc == V4L2_PIXEL_ENC_BAYER &&
> >  	    src_info->pixel_enc == V4L2_PIXEL_ENC_YUV)
> > -		src_fmt->quantization = V4L2_QUANTIZATION_FULL_RANGE;
> > -	else if (src_info->pixel_enc == V4L2_PIXEL_ENC_YUV)
> >  		src_fmt->quantization = V4L2_QUANTIZATION_LIM_RANGE;
> >  	else
> > -		src_fmt->quantization = V4L2_QUANTIZATION_FULL_RANGE;
> > +		src_fmt->quantization = sink_fmt->quantization;
> > +
> > +	/*
> > +	 * Allow setting the source color space fields when the SET_CSC flag is
> > +	 * set and the source format is YUV. If the sink format is YUV, don't
> > +	 * set the color primaries, transfer function or YCbCr encoding as the
> > +	 * ISP is bypassed in that case and passes YUV data through without
> > +	 * modifications.
> > +	 *
> > +	 * The color primaries and transfer function are configured through the
> > +	 * cross-talk matrix and tone curve respectively. Settings for those
> > +	 * hardware blocks are conveyed through the ISP parameters buffer, as
> > +	 * they need to combine color space information with other image tuning
> > +	 * characteristics and can't thus be computed by the kernel based on the
> > +	 * color space. The source pad colorspace and xfer_func fields are thus
> > +	 * ignored by the driver, but can be set by userspace to propagate
> > +	 * accurate color space information down the pipeline.
> > +	 */
> > +	set_csc = !!(format->flags & V4L2_MBUS_FRAMEFMT_SET_CSC);
> 
> the (!!) operator is used to convert boolean to interger rigth?

Here it's used to convert an integert to a boolean. The bool type is
stored on one byte, so if the V4L2_MBUS_FRAMEFMT_SET_CSC flag used bit 8
or higher, there would be a risk the result would overflow.

However, given that the bool type is an alias for _Bool, the compiler
will correctly convert any non-zero value to 1. The following code
explains it better:

#include <stdbool.h>
#include <stdint.h>
#include <stdio.h>

int main(int argc __attribute__((__unused__)),
         char *argv[] __attribute__((__unused__)))
{
	bool b;
	uint8_t u8;
	uint8_t u8_notnot;

	b = 0x1ff & 0x100;
	u8 = 0x1ff & 0x100;
	u8_notnot = !!(0x1ff & 0x100);

	printf("b = %u, u8 = %u, u8_notnot = %u\n", b, u8, u8_notnot);

	return 0;
}

$ gcc -W -Wall -o bool bool.c
bool.c: In function ‘main’:
bool.c:13:14: warning: unsigned conversion from ‘int’ to ‘uint8_t’ {aka ‘unsigned char’} changes value from ‘256’ to ‘0’ [-Woverflow]
   13 |         u8 = 0x1ff & 0x100;
      |              ^~~~~
$ ./bool 
b = 1, u8 = 0, u8_notnot = 1


I'll drop the !!.

> I think it it not needed here, since 'set_csc' is only used in 'if' conditions
> 
> anyway
> 
> Reviewed-by: Dafna Hirschfeld <dafna@fastmail.com>
> 
> > +
> > +	if (set_csc && src_info->pixel_enc == V4L2_PIXEL_ENC_YUV) {
> > +		if (sink_info->pixel_enc == V4L2_PIXEL_ENC_BAYER) {
> > +			if (format->colorspace != V4L2_COLORSPACE_DEFAULT)
> > +				src_fmt->colorspace = format->colorspace;
> > +			if (format->xfer_func != V4L2_XFER_FUNC_DEFAULT)
> > +				src_fmt->xfer_func = format->xfer_func;
> > +			if (format->ycbcr_enc != V4L2_YCBCR_ENC_DEFAULT)
> > +				src_fmt->ycbcr_enc = format->ycbcr_enc;
> > +		}
> > +
> > +		if (format->quantization != V4L2_QUANTIZATION_DEFAULT)
> > +			src_fmt->quantization = format->quantization;
> > +	}
> > 
> >  	*format = *src_fmt;
> > 
> > +	/*
> > +	 * Restore the SET_CSC flag if it was set to indicate support for the
> > +	 * CSC setting API.
> > +	 */
> > +	if (set_csc)
> > +		format->flags |= V4L2_MBUS_FRAMEFMT_SET_CSC;
> > +
> >  	/* Store the source format info when setting the active format. */
> >  	if (which == V4L2_SUBDEV_FORMAT_ACTIVE)
> >  		isp->src_fmt = src_info;

-- 
Regards,

Laurent Pinchart
