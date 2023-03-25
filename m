Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8A6236C91B2
	for <lists+linux-media@lfdr.de>; Sun, 26 Mar 2023 00:17:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229596AbjCYXRC (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 25 Mar 2023 19:17:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34960 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229488AbjCYXRB (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 25 Mar 2023 19:17:01 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F0B1CC157
        for <linux-media@vger.kernel.org>; Sat, 25 Mar 2023 16:16:58 -0700 (PDT)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 44C33558;
        Sun, 26 Mar 2023 00:16:57 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1679786217;
        bh=G2N/IK73on5wl37KdCFLrHMIoxp+a/VbVgNP8RrjLvY=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=fB3D60/ugKsqT9SLEd5AqzOc1423snE7XN3SVDHeFD1kKj9CsG/sIu/laHeAsNw8K
         af/+9w+xuPf2BW7koxWTfTdyVLC0aph1rsSwX2Euy9nzOln79n+3Fn9UMoZT70tQJR
         H0c+pGy7xD/hLu9ntt9GHT4jzNcYehAIMcJU0aDM=
Date:   Sun, 26 Mar 2023 01:17:03 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Paul Kocialkowski <paul.kocialkowski@bootlin.com>
Cc:     Adam Pigg <adam@piggz.co.uk>, linux-media@vger.kernel.org,
        yong.deng@magewell.com, mchehab@kernel.org,
        linux-sunxi@lists.linux.dev
Subject: Re: [PATCH 1/3] media: sun6i-csi: merge sun6i_csi_formats and
 sun6i_csi_formats_match
Message-ID: <20230325231703.GI22214@pendragon.ideasonboard.com>
References: <20230106194038.16018-1-adam@piggz.co.uk>
 <20230106194038.16018-2-adam@piggz.co.uk>
 <Y7ivZC2e0TZtbASV@pendragon.ideasonboard.com>
 <5905587.lOV4Wx5bFT@192-168-1-215>
 <Y7sm4ZbAoBhuhmP/@pendragon.ideasonboard.com>
 <Y+/FUICC58w10rNJ@pendragon.ideasonboard.com>
 <Y/Xw7lsKOYFqaZEw@aptenodytes>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <Y/Xw7lsKOYFqaZEw@aptenodytes>
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Paul,

On Wed, Feb 22, 2023 at 11:39:42AM +0100, Paul Kocialkowski wrote:
> On Fri 17 Feb 23, 20:20, Laurent Pinchart wrote:
> > Could you share your opinion on the question below ?
> 
> Yeah sorry for the long delay here. It's taken me a while to dive back into
> this topic.
> 
> My first impression is that I would rather be in favor of keeping a dynamic
> approach like what's already in sun6i_csi_capture_link_validate and extract
> the mbus/pixfmt matching logic from there.
> 
> I would be happy to craft a patch in that direction, but maybe you'd like
> to have a try at it (since it's your series). Just let me know, I think I can
> do it pretty quickly now that I have everything back in mind. I could also
> add some comment about the general hardware mechanism/limitations.
> 
> The hardware is a bit odd in a few ways and I found that the explicit
> combinatory approach wasn't a very good fit (but obviously that's an open topic
> for discussions).
> 
> The general idea is that the SUN6I_CSI_INPUT_FMT_YUV420/422 can only be used
> to produce outputs on 2 or 3 planes, but not packed YUV. There's also no
> explicit hardware reordering of the chroma components, so we need to lie about
> the input order (input_yuv_seq_invert) to achieve inverted chroma components
> on the output format.
> 
> In order to produce packed data, we can only rely on SUN6I_CSI_INPUT_FMT_RAW
> which provides no reordering mechanism. This is why it made good sense to me
> to only have an explicit matching table for this case and rely on more general
> logic that reflects the hardware capabilities otherwise.

The explicit logic is more CPU-intensive so I have a small preference
for adding mbus_codes to the sun6i_csi_capture_format structure. It's
true that there will be some duplication of data, but I don't think it
will consume lots of memory. As mentioned in the review of the series
you've recently sent, I'm fine with both approaches, so you can decide.

> > On Sun, Jan 08, 2023 at 10:26:09PM +0200, Laurent Pinchart wrote:
> > > On Sun, Jan 08, 2023 at 06:23:56PM +0000, Adam Pigg wrote:
> > > > On Friday, 6 January 2023 23:31:48 GMT Laurent Pinchart wrote:
> > > > > On Fri, Jan 06, 2023 at 07:40:36PM +0000, adam@piggz.co.uk wrote:
> 
> [...]
> 
> > > > > > +#define SUN6I_BUS_FMTS(fmt...) (const u32[]) {fmt, 0}
> 
> Cosmetic suggestion to stay consistent with the rest:
> #define SUN6I_CSI_CAPTURE_MBUS_CODES(mbus_codes...) \
> 	(const u32[]) { mbus_codes, 0 }
> 
> Also it would look better in sun6i_csi_capture.h.
> 
> But really I would be happier with a dynamic approach.
> 
> [...]
> 
> > > > > >  	/* YUV422 */
> > > > > >  	{
> > > > > > 
> > > > > > @@ -123,6 +139,8 @@ static const struct sun6i_csi_capture_format
> > > > > > sun6i_csi_capture_formats[] = {> 
> > > > > >  		.output_format_field	=  SUN6I_CSI_OUTPUT_FMT_FIELD_RAW_8,
> > > > > >  		.input_format_raw	= true,
> > > > > >  		.hsize_len_factor	= 2,
> > > > > > 
> > > > > > +		.mbus_codes		=  SUN6I_BUS_FMTS(MEDIA_BUS_FMT_YUYV8_2X8,
> > > > > > +							  MEDIA_BUS_FMT_YUYV8_1X16),
> > > > > > 
> > > > > >  	},
> > > > > >  	{
> > > > > >  	
> > > > > >  		.pixelformat		= V4L2_PIX_FMT_YVYU,
> > > > > > 
> > > > > > @@ -130,6 +148,8 @@ static const struct sun6i_csi_capture_format
> > > > > > sun6i_csi_capture_formats[] = {> 
> > > > > >  		.output_format_field	=  SUN6I_CSI_OUTPUT_FMT_FIELD_RAW_8,
> > > > > >  		.input_format_raw	= true,
> > > > > >  		.hsize_len_factor	= 2,
> > > > > > 
> > > > > > +		.mbus_codes		=  SUN6I_BUS_FMTS(MEDIA_BUS_FMT_YVYU8_2X8,
> > > > > > +							  MEDIA_BUS_FMT_YVYU8_1X16),
> > > > > > 
> > > > > >  	},
> > > > > >  	{
> > > > > >  	
> > > > > >  		.pixelformat		= V4L2_PIX_FMT_UYVY,
> > > > > > 
> > > > > > @@ -137,6 +157,8 @@ static const struct sun6i_csi_capture_format
> > > > > > sun6i_csi_capture_formats[] = {
> > > > > >  		.output_format_field	=  SUN6I_CSI_OUTPUT_FMT_FIELD_RAW_8,
> > > > > >  		.input_format_raw	= true,
> > > > > >  		.hsize_len_factor	= 2,
> > > > > > 
> > > > > > +		.mbus_codes		=  SUN6I_BUS_FMTS(MEDIA_BUS_FMT_UYVY8_2X8,
> > > > > > +							  MEDIA_BUS_FMT_UYVY8_1X16),
> > > > > > 
> > > > > >  	},
> > > > > >  	{
> > > > > >  	
> > > > > >  		.pixelformat		= V4L2_PIX_FMT_VYUY,
> > > > > > 
> > > > > > @@ -144,57 +166,68 @@ static const struct sun6i_csi_capture_format
> > > > > > sun6i_csi_capture_formats[] = {> 
> > > > > >  		.output_format_field	=  SUN6I_CSI_OUTPUT_FMT_FIELD_RAW_8,
> > > > > >  		.input_format_raw	= true,
> > > > > >  		.hsize_len_factor	= 2,
> > > > > > 
> > > > > > +		.mbus_codes		=  SUN6I_BUS_FMTS(MEDIA_BUS_FMT_VYUY8_2X8,
> > > > > > +							  MEDIA_BUS_FMT_VYUY8_1X16),
> > > > > > 
> > > > > >  	},
> > > > > >  	{
> > > > > >  	
> > > > > >  		.pixelformat		= V4L2_PIX_FMT_NV16,
> > > > > >  		.output_format_frame	=  SUN6I_CSI_OUTPUT_FMT_FRAME_YUV422SP,
> > > > > >  		.output_format_field	=  SUN6I_CSI_OUTPUT_FMT_FIELD_YUV422SP,
> > > > > > 
> > > > > > +		.mbus_codes		= 0,
> > > > > 
> > > > > I don't think this is correct. To produce semi-planar or multi-planar
> > > > > YUV formats, I believe the CSI needs YUV input. This should thus be
> > > > > (unless I'm mistaken)
> 
> You are correct.
> 
> > > > > 
> > > > > 		.mbus_codes		=  SUN6I_BUS_FMTS(MEDIA_BUS_FMT_UYVY8_2X8,
> > > > > 							  MEDIA_BUS_FMT_UYVY8_1X16,
> > > > > 							  MEDIA_BUS_FMT_VYUY8_2X8,
> > > > > 							  MEDIA_BUS_FMT_VYUY8_1X16,
> > > > > 							  MEDIA_BUS_FMT_YUYV8_2X8,
> > > > > 							  MEDIA_BUS_FMT_YUYV8_1X16,
> > > > > 							  MEDIA_BUS_FMT_YVYU8_2X8,
> > > > > 							  MEDIA_BUS_FMT_YVYU8_1X16),
> > > > > 
> > > > > and same below.
> 
> All of the YUV420/422 pixel formats on 2 or 3 planes can take all of the
> supports packed 16-bit YUV bus formats, which is why it doesn't seem very
> graceful to have an explicit list.
> 
> > > > > 
> > > > Hi Laurent
> > > > 
> > > > Thanks for the help and tips.  Ive made all the other changes, which can be 
> > > > viewed here until i resubmit them https://github.com/sailfish-on-dontbeevil/
> > > > kernel-megi/commits/pinephone-libcamera
> > > > 
> > > > Im just not quite sure on this one.  I think my implementation of merging the 
> > > > arrays keeps the previous mapping right?  In sun6i_csi_capture_format_matches 
> > > > there is no mapping for the *NV formats, and the remaining ones ive set to 0?
> > > 
> > > The current implementation allows writing multi-planar formats (e.g.
> > > NV12) to memory when the input of the CSI is a YUV media bus format
> > > (e.g. YUYV8_1X16). This patch doesn't change that, but it will prevent
> > > NV12 from being enumerated when using media bus-based enumeration of
> > > pixel formats, so userspace won't see NV12 as being available.
> > > 
> > > It would be fine fixing that issue in a separate patch on top of this
> > > one, but I though you could as well do both in one go.
> > 
> > Adam, you mentioned that NV12 and NV16 "don't work". Could you elaborate
> > and explain what you've tried exactly ?
> 
> We definitely need to keep the ability to produce NV12, NV16 and friends from
> YUV bus formats.
> 
> > > > > Paul, could you confirm this ?
> > > > > 
> > > > > I'm a bit surprised that the CSI can't shuffle the YUV components for
> > > > > packed YUYV formats, but so be it if that's a hardware limitation.
> 
> Yep that is correct, it's a hardware limitation.
> 
> Cheers,
> 
> Paul
> 
> > > > > I'm also thinking that a subsequent patch could drop the raw check from
> > > > > sun6i_csi_capture_link_validate():
> > > > > 
> > > > > -	/* With raw input mode, we need a 1:1 match between input and  output. */
> > > > > -	if (bridge_format->input_format == SUN6I_CSI_INPUT_FMT_RAW ||
> > > > > -	    capture_format->input_format_raw) {
> > > > > -		match = sun6i_csi_capture_format_match(pixelformat,
> > > > > -						        fmt.format.code);
> > > > > -		if (!match)
> > > > > -			goto invalid;
> > > > > -	}
> > > > > +	/* Make sure the media bus code and pixel format are compatible. */
> > > > > +	match = sun6i_csi_capture_format_match(pixelformat,  fmt.format.code);
> > > > > +	if (!match)
> > > > > +		goto invalid;
> > > > > 
> > > > > >  	},
> > > > > >  	{
> > > > > >  	
> > > > > >  		.pixelformat		= V4L2_PIX_FMT_NV61,
> > > > > >  		.output_format_frame	=  SUN6I_CSI_OUTPUT_FMT_FRAME_YUV422SP,
> > > > > >  		.output_format_field	=  SUN6I_CSI_OUTPUT_FMT_FIELD_YUV422SP,
> > > > > >  		.input_yuv_seq_invert	= true,
> > > > > > 
> > > > > > +		.mbus_codes		= 0,
> > > > > > 
> > > > > >  	},
> > > > > >  	{
> > > > > >  	
> > > > > >  		.pixelformat		= V4L2_PIX_FMT_YUV422P,
> > > > > >  		.output_format_frame	=  SUN6I_CSI_OUTPUT_FMT_FRAME_YUV422P,
> > > > > >  		.output_format_field	=  SUN6I_CSI_OUTPUT_FMT_FIELD_YUV422P,
> > > > > > 
> > > > > > +		.mbus_codes		= 0,
> > > > > > 
> > > > > >  	},
> > > > > >  	/* YUV420 */
> > > > > >  	{
> > > > > >  	
> > > > > >  		.pixelformat		= V4L2_PIX_FMT_NV12_16L16,
> > > > > >  		.output_format_frame	=  SUN6I_CSI_OUTPUT_FMT_FRAME_YUV420MB,
> > > > > >  		.output_format_field	=  SUN6I_CSI_OUTPUT_FMT_FIELD_YUV420MB,
> > > > > > 
> > > > > > +		.mbus_codes		= 0,
> > > > > > 
> > > > > >  	},
> > > > > >  	{
> > > > > >  	
> > > > > >  		.pixelformat		= V4L2_PIX_FMT_NV12,
> > > > > >  		.output_format_frame	=  SUN6I_CSI_OUTPUT_FMT_FRAME_YUV420SP,
> > > > > >  		.output_format_field	=  SUN6I_CSI_OUTPUT_FMT_FIELD_YUV420SP,
> > > > > > 
> > > > > > +		.mbus_codes		= 0,
> > > > > > 
> > > > > >  	},
> > > > > >  	{
> > > > > >  	
> > > > > >  		.pixelformat		= V4L2_PIX_FMT_NV21,
> > > > > >  		.output_format_frame	=  SUN6I_CSI_OUTPUT_FMT_FRAME_YUV420SP,
> > > > > >  		.output_format_field	=  SUN6I_CSI_OUTPUT_FMT_FIELD_YUV420SP,
> > > > > >  		.input_yuv_seq_invert	= true,
> > > > > > 
> > > > > > +		.mbus_codes		= 0,
> > > > > > 
> > > > > >  	},
> > > > > >  	
> > > > > >  	{
> > > > > >  	
> > > > > >  		.pixelformat		= V4L2_PIX_FMT_YUV420,
> > > > > >  		.output_format_frame	=  SUN6I_CSI_OUTPUT_FMT_FRAME_YUV420P,
> > > > > >  		.output_format_field	=  SUN6I_CSI_OUTPUT_FMT_FIELD_YUV420P,
> > > > > > 
> > > > > > +		.mbus_codes		= 0,
> > > > > > 
> > > > > >  	},
> > > > > >  	{
> > > > > >  	
> > > > > >  		.pixelformat		= V4L2_PIX_FMT_YVU420,
> > > > > >  		.output_format_frame	=  SUN6I_CSI_OUTPUT_FMT_FRAME_YUV420P,
> > > > > >  		.output_format_field	=  SUN6I_CSI_OUTPUT_FMT_FIELD_YUV420P,
> > > > > >  		.input_yuv_seq_invert	= true,
> > > > > > 
> > > > > > +		.mbus_codes		= 0,
> > > > > > 
> > > > > >  	},
> > > > > >  	/* Compressed */
> > > > > >  	{
> > > > > >  	
> > > > > >  		.pixelformat		= V4L2_PIX_FMT_JPEG,
> > > > > >  		.output_format_frame	=  SUN6I_CSI_OUTPUT_FMT_FRAME_RAW_8,
> > > > > >  		.output_format_field	=  SUN6I_CSI_OUTPUT_FMT_FIELD_RAW_8,
> > > > > > 
> > > > > > +		.mbus_codes		=  SUN6I_BUS_FMTS(MEDIA_BUS_FMT_JPEG_1X8),
> > > > > > 
> > > > > >  	},
> > > > > >  
> > > > > >  };
> > > > > > 
> > > > > > @@ -210,118 +243,20 @@ struct sun6i_csi_capture_format
> > > > > > *sun6i_csi_capture_format_find(u32 pixelformat)> 
> > > > > >  	return NULL;
> > > > > >  
> > > > > >  }
> > > > > > 
> > > > > > -/* RAW formats need an exact match between pixel and mbus formats. */
> > > > > > -static const
> > > > > > -struct sun6i_csi_capture_format_match sun6i_csi_capture_format_matches[]
> > > > > > = { -	/* YUV420 */
> > > > > > -	{
> > > > > > -		.pixelformat	= V4L2_PIX_FMT_YUYV,
> > > > > > -		.mbus_code	= MEDIA_BUS_FMT_YUYV8_2X8,
> > > > > > -	},
> > > > > > -	{
> > > > > > -		.pixelformat	= V4L2_PIX_FMT_YUYV,
> > > > > > -		.mbus_code	= MEDIA_BUS_FMT_YUYV8_1X16,
> > > > > > -	},
> > > > > > -	{
> > > > > > -		.pixelformat	= V4L2_PIX_FMT_YVYU,
> > > > > > -		.mbus_code	= MEDIA_BUS_FMT_YVYU8_2X8,
> > > > > > -	},
> > > > > > -	{
> > > > > > -		.pixelformat	= V4L2_PIX_FMT_YVYU,
> > > > > > -		.mbus_code	= MEDIA_BUS_FMT_YVYU8_1X16,
> > > > > > -	},
> > > > > > -	{
> > > > > > -		.pixelformat	= V4L2_PIX_FMT_UYVY,
> > > > > > -		.mbus_code	= MEDIA_BUS_FMT_UYVY8_2X8,
> > > > > > -	},
> > > > > > -	{
> > > > > > -		.pixelformat	= V4L2_PIX_FMT_UYVY,
> > > > > > -		.mbus_code	= MEDIA_BUS_FMT_UYVY8_1X16,
> > > > > > -	},
> > > > > > -	{
> > > > > > -		.pixelformat	= V4L2_PIX_FMT_VYUY,
> > > > > > -		.mbus_code	= MEDIA_BUS_FMT_VYUY8_2X8,
> > > > > > -	},
> > > > > > -	{
> > > > > > -		.pixelformat	= V4L2_PIX_FMT_VYUY,
> > > > > > -		.mbus_code	= MEDIA_BUS_FMT_VYUY8_1X16,
> > > > > > -	},
> > > > > > -	/* RGB */
> > > > > > -	{
> > > > > > -		.pixelformat	= V4L2_PIX_FMT_RGB565,
> > > > > > -		.mbus_code	= MEDIA_BUS_FMT_RGB565_2X8_LE,
> > > > > > -	},
> > > > > > -	{
> > > > > > -		.pixelformat	= V4L2_PIX_FMT_RGB565X,
> > > > > > -		.mbus_code	= MEDIA_BUS_FMT_RGB565_2X8_BE,
> > > > > > -	},
> > > > > > -	/* Bayer */
> > > > > > -	{
> > > > > > -		.pixelformat	= V4L2_PIX_FMT_SBGGR8,
> > > > > > -		.mbus_code	= MEDIA_BUS_FMT_SBGGR8_1X8,
> > > > > > -	},
> > > > > > -	{
> > > > > > -		.pixelformat	= V4L2_PIX_FMT_SGBRG8,
> > > > > > -		.mbus_code	= MEDIA_BUS_FMT_SGBRG8_1X8,
> > > > > > -	},
> > > > > > -	{
> > > > > > -		.pixelformat	= V4L2_PIX_FMT_SGRBG8,
> > > > > > -		.mbus_code	= MEDIA_BUS_FMT_SGRBG8_1X8,
> > > > > > -	},
> > > > > > -	{
> > > > > > -		.pixelformat	= V4L2_PIX_FMT_SRGGB8,
> > > > > > -		.mbus_code	= MEDIA_BUS_FMT_SRGGB8_1X8,
> > > > > > -	},
> > > > > > -	{
> > > > > > -		.pixelformat	= V4L2_PIX_FMT_SBGGR10,
> > > > > > -		.mbus_code	= MEDIA_BUS_FMT_SBGGR10_1X10,
> > > > > > -	},
> > > > > > -	{
> > > > > > -		.pixelformat	= V4L2_PIX_FMT_SGBRG10,
> > > > > > -		.mbus_code	= MEDIA_BUS_FMT_SGBRG10_1X10,
> > > > > > -	},
> > > > > > -	{
> > > > > > -		.pixelformat	= V4L2_PIX_FMT_SGRBG10,
> > > > > > -		.mbus_code	= MEDIA_BUS_FMT_SGRBG10_1X10,
> > > > > > -	},
> > > > > > -	{
> > > > > > -		.pixelformat	= V4L2_PIX_FMT_SRGGB10,
> > > > > > -		.mbus_code	= MEDIA_BUS_FMT_SRGGB10_1X10,
> > > > > > -	},
> > > > > > -	{
> > > > > > -		.pixelformat	= V4L2_PIX_FMT_SBGGR12,
> > > > > > -		.mbus_code	= MEDIA_BUS_FMT_SBGGR12_1X12,
> > > > > > -	},
> > > > > > -	{
> > > > > > -		.pixelformat	= V4L2_PIX_FMT_SGBRG12,
> > > > > > -		.mbus_code	= MEDIA_BUS_FMT_SGBRG12_1X12,
> > > > > > -	},
> > > > > > -	{
> > > > > > -		.pixelformat	= V4L2_PIX_FMT_SGRBG12,
> > > > > > -		.mbus_code	= MEDIA_BUS_FMT_SGRBG12_1X12,
> > > > > > -	},
> > > > > > -	{
> > > > > > -		.pixelformat	= V4L2_PIX_FMT_SRGGB12,
> > > > > > -		.mbus_code	= MEDIA_BUS_FMT_SRGGB12_1X12,
> > > > > > -	},
> > > > > > -	/* Compressed */
> > > > > > -	{
> > > > > > -		.pixelformat	= V4L2_PIX_FMT_JPEG,
> > > > > > -		.mbus_code	= MEDIA_BUS_FMT_JPEG_1X8,
> > > > > > -	},
> > > > > > -};
> > > > > > -
> > > > > > 
> > > > > >  static bool sun6i_csi_capture_format_match(u32 pixelformat, u32
> > > > > >  mbus_code)
> > > > > >  {
> > > > > > 
> > > > > > -	unsigned int i;
> > > > > > -
> > > > > > -	for (i = 0; i < ARRAY_SIZE(sun6i_csi_capture_format_matches); i++)  {
> > > > > > -		const struct sun6i_csi_capture_format_match *match =
> > > > > > -			&sun6i_csi_capture_format_matches[i];
> > > > > > -
> > > > > > -		if (match->pixelformat == pixelformat &&
> > > > > > -		    match->mbus_code == mbus_code)
> > > > > > -			return true;
> > > > > > +	unsigned int i, j;
> > > > > > +
> > > > > > +	for (i = 0; i < ARRAY_SIZE(sun6i_csi_capture_formats); i++) {
> > > > > > +		const struct sun6i_csi_capture_format *format =
> > > > > > +			&sun6i_csi_capture_formats[i];
> > > > > > +
> > > > > > +		if (format->pixelformat == pixelformat) {
> > > > > > +			for (j = 0; format->mbus_codes[j]; j++) {
> > > > > > +				if (mbus_code == format->mbus_codes[j])
> > > > > > +					return true;
> > > > > > +			}
> > > > > > +		}
> > > > > > 
> > > > > >  	}
> > > > > >  	
> > > > > >  	return false;
> > > > > > 
> > > > > > diff --git a/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi_capture.h
> > > > > > b/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi_capture.h index
> > > > > > 3ee5ccefbd10..0484942834e3 100644
> > > > > > --- a/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi_capture.h
> > > > > > +++ b/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi_capture.h
> > > > > > @@ -27,11 +27,7 @@ struct sun6i_csi_capture_format {
> > > > > > 
> > > > > >  	bool	input_yuv_seq_invert;
> > > > > >  	bool	input_format_raw;
> > > > > >  	u32	hsize_len_factor;
> > > > > > 
> > > > > > -};
> > > > > > -
> > > > > > -struct sun6i_csi_capture_format_match {
> > > > > > -	u32	pixelformat;
> > > > > > -	u32	mbus_code;
> > > > > > +	const u32 *mbus_codes;
> > > > > > 
> > > > > >  };
> > > > > >  
> > > > > >  #undef current

-- 
Regards,

Laurent Pinchart
