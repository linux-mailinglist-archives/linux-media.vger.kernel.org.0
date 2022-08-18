Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A08F3597F72
	for <lists+linux-media@lfdr.de>; Thu, 18 Aug 2022 09:47:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243851AbiHRHqC (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 18 Aug 2022 03:46:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32810 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243066AbiHRHqA (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 18 Aug 2022 03:46:00 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A59354DB35
        for <linux-media@vger.kernel.org>; Thu, 18 Aug 2022 00:45:59 -0700 (PDT)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 87F668B;
        Thu, 18 Aug 2022 09:45:57 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1660808757;
        bh=z0UzPVjgH5xJJqp5yqPNqSWdPJDx6w4WfYZTFEUdaVA=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=pCYXEQUGgxlqmoVqzo7PH4PExDtS/fd5vtVeeS7dXPFxwh4gxGdoBPC/B7aEXR4UV
         aDoII9S0kCNkegZ2bNJw1gLG3IeJFrvt2zaTZROlTqWsiwL+g5vhVCVfeGC8kQLtpm
         8d4tOLYK1P7t+VzIWGD6/ppMdnOdasmEog330n5w=
Date:   Thu, 18 Aug 2022 10:45:54 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Dafna Hirschfeld <dafna@fastmail.com>
Cc:     linux-media@vger.kernel.org,
        Florian Sylvestre <fsylvestre@baylibre.com>,
        Paul Elder <paul.elder@ideasonboard.com>
Subject: Re: [PATCH 2/7] media: rkisp1: Allow setting color space on ISP sink
 pad
Message-ID: <Yv3uMmxx/n/mCsnr@pendragon.ideasonboard.com>
References: <20220815065235.23797-1-laurent.pinchart@ideasonboard.com>
 <20220815065235.23797-3-laurent.pinchart@ideasonboard.com>
 <20220818040027.mqqrimh4pyxpb4qq@guri>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220818040027.mqqrimh4pyxpb4qq@guri>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Dafna,

On Thu, Aug 18, 2022 at 07:00:27AM +0300, Dafna Hirschfeld wrote:
> On 15.08.2022 09:52, Laurent Pinchart wrote:
> > The ISP accepts different color spaces on its input: for YUV input, it
> > doesn't set any restrictions, and for Bayer inputs, any color primaries
> > or transfer function can be accepted (YCbCr encoding isn't applicable
> > there, and quantization range can only be full).
> > 
> > Allow setting a color space on the ISP sink pad, with the aforementioned
> > restrictions. The settings don't influence hardware yet (only the YUV
> > quantization range will, anything else has no direct effect on the ISP
> > configuration), but can already be set to allow color space information
> > to be coherent across the ISP sink link.
> > 
> > Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > ---
> >  .../platform/rockchip/rkisp1/rkisp1-isp.c     | 31 +++++++++++++++++++
> >  1 file changed, 31 insertions(+)
> > 
> > diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c b/drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c
> > index a52b22824739..32114d1e8ad1 100644
> > --- a/drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c
> > +++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c
> > @@ -705,6 +705,7 @@ static void rkisp1_isp_set_sink_fmt(struct rkisp1_isp *isp,
> >  	const struct rkisp1_mbus_info *mbus_info;
> >  	struct v4l2_mbus_framefmt *sink_fmt;
> >  	struct v4l2_rect *sink_crop;
> > +	bool is_yuv;
> > 
> >  	sink_fmt = rkisp1_isp_get_pad_fmt(isp, sd_state,
> >  					  RKISP1_ISP_PAD_SINK_VIDEO,
> > @@ -725,6 +726,36 @@ static void rkisp1_isp_set_sink_fmt(struct rkisp1_isp *isp,
> >  				   RKISP1_ISP_MIN_HEIGHT,
> >  				   RKISP1_ISP_MAX_HEIGHT);
> > 
> > +	/*
> > +	 * Adjust the color space fields. Accept any color primaries and
> > +	 * transfer function for both YUV and Bayer. For YUV any YCbCr encoding
> > +	 * and quantization range is also accepted. For Bayer formats, the YCbCr
> > +	 * encoding isn't applicable, and the quantization range can only be
> > +	 * full.
> > +	 */
> > +	is_yuv = mbus_info->pixel_enc == V4L2_PIXEL_ENC_YUV;
> > +
> > +	sink_fmt->colorspace = format->colorspace ? format->colorspace :
> > +			       (is_yuv ? V4L2_COLORSPACE_RAW :
> 
> I don't understand enough of the different colorspaces, why is 'raw'
> chosen for yuv input?

You clearly understand the topic as you've spotted a bug :-) It should
be the other way around, for Bayer input the driver should default to
RAW, and for YUV input, to SRGB (which in V4L2 is used to describe
limited-range, Rec. 601 encoded sRGB RGB data).

> > +				V4L2_COLORSPACE_SRGB);
> > +	sink_fmt->xfer_func = format->xfer_func ? format->xfer_func :
> > +			      V4L2_MAP_XFER_FUNC_DEFAULT(sink_fmt->colorspace);
> > +	if (is_yuv) {
> > +		sink_fmt->ycbcr_enc = format->ycbcr_enc ? :
> > +			V4L2_MAP_YCBCR_ENC_DEFAULT(sink_fmt->colorspace);
> > +		sink_fmt->quantization = format->quantization ? :
> > +			V4L2_MAP_QUANTIZATION_DEFAULT(false, sink_fmt->colorspace,
> > +						      sink_fmt->ycbcr_enc);
> > +	} else {
> > +		/*
> > +		 * The YCbCr encoding isn't applicable for non-YUV formats, but
> > +		 * V4L2 has no "no encoding" value. Hardcode it to Rec. 601, it
> > +		 * should be ignored by userspace.
> > +		 */
> > +		sink_fmt->ycbcr_enc = V4L2_YCBCR_ENC_601;
> > +		sink_fmt->quantization = V4L2_QUANTIZATION_FULL_RANGE;
> > +	}
> > +
> >  	*format = *sink_fmt;
> > 
> >  	/* Propagate to in crop */

-- 
Regards,

Laurent Pinchart
