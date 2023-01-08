Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5C92866180B
	for <lists+linux-media@lfdr.de>; Sun,  8 Jan 2023 19:25:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236056AbjAHSZG (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 8 Jan 2023 13:25:06 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52346 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229459AbjAHSZE (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sun, 8 Jan 2023 13:25:04 -0500
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com [IPv6:2a00:1450:4864:20::32b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C669C6450
        for <linux-media@vger.kernel.org>; Sun,  8 Jan 2023 10:25:02 -0800 (PST)
Received: by mail-wm1-x32b.google.com with SMTP id ay12-20020a05600c1e0c00b003d9ea12bafcso2029055wmb.3
        for <linux-media@vger.kernel.org>; Sun, 08 Jan 2023 10:25:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=OdblhYIjHuApz/299W7JsVD+ALSZkZJxpaxiJZv+XYQ=;
        b=Nt4jpL99E6XorFoucIAuZO10pdP556WSuZ9YSvXl/uDNMU7cCRleB/pFG7GeU2dTHP
         Ef5WwSJludcpgq6n5YMGIFQOcVwgJBFNo0rc4MCi7TdAuBFJn6trI0ios31dUD8dFNDs
         0P5HOk080wYNAQxHaneIhZuC+1Y0D6jGNsR89/jmcY1BT818sLsnRul+qjE0u7rSw8ST
         FIFVgxCQ1lfEc1FlBHpIzpwJT0MbcuTwGwX9Ki3tQD+9BoviG0K3uRVID/i3TDMt/8vE
         fPfLm6SdvAMgdItswcFS2eYfVZ90uw8MMuObXNBzsiwk0fz0kE9zuEF3HTYad2l3+U+n
         ds3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OdblhYIjHuApz/299W7JsVD+ALSZkZJxpaxiJZv+XYQ=;
        b=hSMLHV7fuQzrjk12YrL2rpm2w7edddHDBEAKNIKfEdMRPFoYT0ilYxwu2mNArelgqh
         5IReFe2UvnuvOzHAeYBJpIU8OJ6FN6MFWFJxLxsug3FbgbUsEUimGkYrfKgsBpJ0XiWF
         aA6KXkUE61i6vdBvCwBLpKq12js9jeSnYxgTXz8gl5EJH+OXQjd/E2airttWRMO+kk5C
         He/VsflDTzZnAt60vCM4dSlSrih9pPvBt2RBUxxigSmuy4qiY6oSpoFvpvwEhyFVwy5k
         oek7netWBfy5tVSCEujwYL2eA/fJzIrUSe2kZ+PrCwSsc7CKmcmnWp6rO5PwsQUIWA7G
         3KRQ==
X-Gm-Message-State: AFqh2kqUjaV2nbzaaADcJsHmpF0XLG7qWH1lX/wgb6m3L9O5Ja/w1twR
        Y87X6iqUH9TBpBVEE5a8qJ4=
X-Google-Smtp-Source: AMrXdXsiTrWv6BQRUctsb+gYPpOR6GGrLT3pH66xb55sslxH4hVqRixpVVHon1LPG+ekmW/IVD9rkw==
X-Received: by 2002:a1c:5442:0:b0:3cf:7385:677f with SMTP id p2-20020a1c5442000000b003cf7385677fmr43080827wmi.35.1673202301224;
        Sun, 08 Jan 2023 10:25:01 -0800 (PST)
Received: from 192-168-1-215.localnet ([90.242.19.250])
        by smtp.gmail.com with ESMTPSA id p3-20020a05600c358300b003d1f2c3e571sm14772713wmq.33.2023.01.08.10.24.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Jan 2023 10:25:00 -0800 (PST)
Sender: Adam Pigg <piggz1@gmail.com>
From:   Adam Pigg <adam@piggz.co.uk>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     linux-media@vger.kernel.org, yong.deng@magewell.com,
        mchehab@kernel.org, linux-sunxi@lists.linux.dev,
        paul.kocialkowski@bootlin.com
Subject: Re: [PATCH 1/3] media: sun6i-csi: merge sun6i_csi_formats and
 sun6i_csi_formats_match
Date:   Sun, 08 Jan 2023 18:23:56 +0000
Message-ID: <5905587.lOV4Wx5bFT@192-168-1-215>
In-Reply-To: <Y7ivZC2e0TZtbASV@pendragon.ideasonboard.com>
References: <20230106194038.16018-1-adam@piggz.co.uk>
 <20230106194038.16018-2-adam@piggz.co.uk>
 <Y7ivZC2e0TZtbASV@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart4808305.31r3eYUQgx";
 micalg="pgp-sha256"; protocol="application/pgp-signature"
X-Spam-Status: No, score=-1.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

--nextPart4808305.31r3eYUQgx
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"; protected-headers="v1"
From: Adam Pigg <adam@piggz.co.uk>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Date: Sun, 08 Jan 2023 18:23:56 +0000
Message-ID: <5905587.lOV4Wx5bFT@192-168-1-215>
In-Reply-To: <Y7ivZC2e0TZtbASV@pendragon.ideasonboard.com>
MIME-Version: 1.0

On Friday, 6 January 2023 23:31:48 GMT Laurent Pinchart wrote:
> Hi Adam,
> 
> Thank you for the patch.
> 
> On Fri, Jan 06, 2023 at 07:40:36PM +0000, adam@piggz.co.uk wrote:
> > From: Adam Pigg <adam@piggz.co.uk>
> > 
> > Merged the two format arrays into sun6i_csi_capture_formats as a
> > pre-requisite to implementing V4L2_CAP_IO_MC
> 
> I'll point to https://cbea.ms/git-commit/ if you haven't read it yet.
> You can ignore the "Limit the subject line to 50 characters" rule and go
> up to the normal 72 characters limit for commit messages, as 50 doesn't
> include the prefixes commonly used in kernel commit messages.
> 
> For this specific patch, I would write
> 
> Information about media bus formats and pixel formats supported by the
> driver is split between the sun6i_csi_capture_formats and
> sun6i_csi_capture_format_matches arrays. This makes it difficult to map
> media bus formats to pixel formats when enumerating the supported pixel
> formats by walking the sun6i_csi_capture_formats array. To prepare for
> support of media bus format support in sun6i_csi_capture_enum_fmt(),
> merge the two arrays toegether.
> 
> 
> An extra paragraph could be added to explain *how* this is being done,
> but the implementation is straightforward enough to not require that.
> 
> > Signed-off-by: Adam Pigg <adam@piggz.co.uk>
> > ---
> > 
> >  .../sunxi/sun6i-csi/sun6i_csi_capture.c       | 155 +++++-------------
> >  .../sunxi/sun6i-csi/sun6i_csi_capture.h       |   6 +-
> >  2 files changed, 46 insertions(+), 115 deletions(-)
> > 
> > diff --git a/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi_capture.c
> > b/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi_capture.c index
> > 03d4adec054c..69578075421c 100644
> > --- a/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi_capture.c
> > +++ b/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi_capture.c
> > @@ -22,6 +22,8 @@
> > 
> >  /* Helpers */
> > 
> > +#define SUN6I_BUS_FMTS(fmt...) (const u32[]) {fmt, 0}
> > +
> > 
> >  void sun6i_csi_capture_dimensions(struct sun6i_csi_device *csi_dev,
> >  
> >  				  unsigned int *width, unsigned 
int *height)
> >  
> >  {
> > 
> > @@ -49,72 +51,86 @@ static const struct sun6i_csi_capture_format
> > sun6i_csi_capture_formats[] = {> 
> >  		.pixelformat		= V4L2_PIX_FMT_SBGGR8,
> >  		.output_format_frame	= 
SUN6I_CSI_OUTPUT_FMT_FRAME_RAW_8,
> >  		.output_format_field	= 
SUN6I_CSI_OUTPUT_FMT_FIELD_RAW_8,
> > 
> > +		.mbus_codes		= 
SUN6I_BUS_FMTS(MEDIA_BUS_FMT_SBGGR8_1X8),
> > 
> >  	},
> >  	{
> >  	
> >  		.pixelformat		= V4L2_PIX_FMT_SGBRG8,
> >  		.output_format_frame	= 
SUN6I_CSI_OUTPUT_FMT_FRAME_RAW_8,
> >  		.output_format_field	= 
SUN6I_CSI_OUTPUT_FMT_FIELD_RAW_8,
> > 
> > +		.mbus_codes		= 
SUN6I_BUS_FMTS(MEDIA_BUS_FMT_SGBRG8_1X8),
> > 
> >  	},
> >  	{
> >  	
> >  		.pixelformat		= V4L2_PIX_FMT_SGRBG8,
> >  		.output_format_frame	= 
SUN6I_CSI_OUTPUT_FMT_FRAME_RAW_8,
> >  		.output_format_field	= 
SUN6I_CSI_OUTPUT_FMT_FIELD_RAW_8,
> > 
> > +		.mbus_codes		= 
SUN6I_BUS_FMTS(MEDIA_BUS_FMT_SGRBG8_1X8),
> > 
> >  	},
> >  	{
> >  	
> >  		.pixelformat		= V4L2_PIX_FMT_SRGGB8,
> >  		.output_format_frame	= 
SUN6I_CSI_OUTPUT_FMT_FRAME_RAW_8,
> >  		.output_format_field	= 
SUN6I_CSI_OUTPUT_FMT_FIELD_RAW_8,
> > 
> > +		.mbus_codes		= 
SUN6I_BUS_FMTS(MEDIA_BUS_FMT_SRGGB8_1X8),
> > 
> >  	},
> >  	{
> >  	
> >  		.pixelformat		= V4L2_PIX_FMT_SBGGR10,
> >  		.output_format_frame	= 
SUN6I_CSI_OUTPUT_FMT_FRAME_RAW_10,
> >  		.output_format_field	= 
SUN6I_CSI_OUTPUT_FMT_FIELD_RAW_10,
> > 
> > +		.mbus_codes		= 
SUN6I_BUS_FMTS(MEDIA_BUS_FMT_SBGGR10_1X10),
> > 
> >  	},
> >  	{
> >  	
> >  		.pixelformat		= V4L2_PIX_FMT_SGBRG10,
> >  		.output_format_frame	= 
SUN6I_CSI_OUTPUT_FMT_FRAME_RAW_10,
> >  		.output_format_field	= 
SUN6I_CSI_OUTPUT_FMT_FIELD_RAW_10,
> > 
> > +		.mbus_codes		= 
SUN6I_BUS_FMTS(MEDIA_BUS_FMT_SGBRG10_1X10),
> > 
> >  	},
> >  	{
> >  	
> >  		.pixelformat		= V4L2_PIX_FMT_SGRBG10,
> >  		.output_format_frame	= 
SUN6I_CSI_OUTPUT_FMT_FRAME_RAW_10,
> >  		.output_format_field	= 
SUN6I_CSI_OUTPUT_FMT_FIELD_RAW_10,
> > 
> > +		.mbus_codes		= 
SUN6I_BUS_FMTS(MEDIA_BUS_FMT_SGRBG10_1X10),
> > 
> >  	},
> >  	{
> >  	
> >  		.pixelformat		= V4L2_PIX_FMT_SRGGB10,
> >  		.output_format_frame	= 
SUN6I_CSI_OUTPUT_FMT_FRAME_RAW_10,
> >  		.output_format_field	= 
SUN6I_CSI_OUTPUT_FMT_FIELD_RAW_10,
> > 
> > +		.mbus_codes		= 
SUN6I_BUS_FMTS(MEDIA_BUS_FMT_SRGGB10_1X10),
> > 
> >  	},
> >  	{
> >  	
> >  		.pixelformat		= V4L2_PIX_FMT_SBGGR12,
> >  		.output_format_frame	= 
SUN6I_CSI_OUTPUT_FMT_FRAME_RAW_12,
> >  		.output_format_field	= 
SUN6I_CSI_OUTPUT_FMT_FIELD_RAW_12,
> > 
> > +		.mbus_codes		= 
SUN6I_BUS_FMTS(MEDIA_BUS_FMT_SBGGR12_1X12),
> > 
> >  	},
> >  	{
> >  	
> >  		.pixelformat		= V4L2_PIX_FMT_SGBRG12,
> >  		.output_format_frame	= 
SUN6I_CSI_OUTPUT_FMT_FRAME_RAW_12,
> >  		.output_format_field	= 
SUN6I_CSI_OUTPUT_FMT_FIELD_RAW_12,
> > 
> > +		.mbus_codes		= 
SUN6I_BUS_FMTS(MEDIA_BUS_FMT_SGBRG12_1X12),
> > 
> >  	},
> >  	{
> >  	
> >  		.pixelformat		= V4L2_PIX_FMT_SGRBG12,
> >  		.output_format_frame	= 
SUN6I_CSI_OUTPUT_FMT_FRAME_RAW_12,
> >  		.output_format_field	= 
SUN6I_CSI_OUTPUT_FMT_FIELD_RAW_12,
> > 
> > +		.mbus_codes		= 
SUN6I_BUS_FMTS(MEDIA_BUS_FMT_SGRBG12_1X12),
> > 
> >  	},
> >  	{
> >  	
> >  		.pixelformat		= V4L2_PIX_FMT_SRGGB12,
> >  		.output_format_frame	= 
SUN6I_CSI_OUTPUT_FMT_FRAME_RAW_12,
> >  		.output_format_field	= 
SUN6I_CSI_OUTPUT_FMT_FIELD_RAW_12,
> > 
> > +		.mbus_codes		= 
SUN6I_BUS_FMTS(MEDIA_BUS_FMT_SRGGB12_1X12),
> > 
> >  	},
> >  	/* RGB */
> >  	{
> >  	
> >  		.pixelformat		= V4L2_PIX_FMT_RGB565,
> >  		.output_format_frame	= 
SUN6I_CSI_OUTPUT_FMT_FRAME_RGB565,
> >  		.output_format_field	= 
SUN6I_CSI_OUTPUT_FMT_FIELD_RGB565,
> > 
> > +		.mbus_codes		= 
SUN6I_BUS_FMTS(MEDIA_BUS_FMT_RGB565_2X8_LE),
> > 
> >  	},
> >  	{
> >  	
> >  		.pixelformat		= V4L2_PIX_FMT_RGB565X,
> >  		.output_format_frame	= 
SUN6I_CSI_OUTPUT_FMT_FRAME_RGB565,
> >  		.output_format_field	= 
SUN6I_CSI_OUTPUT_FMT_FIELD_RGB565,
> > 
> > +		.mbus_codes		= 
SUN6I_BUS_FMTS(MEDIA_BUS_FMT_RGB565_2X8_BE),
> > 
> >  	},
> >  	/* YUV422 */
> >  	{
> > 
> > @@ -123,6 +139,8 @@ static const struct sun6i_csi_capture_format
> > sun6i_csi_capture_formats[] = {> 
> >  		.output_format_field	= 
SUN6I_CSI_OUTPUT_FMT_FIELD_RAW_8,
> >  		.input_format_raw	= true,
> >  		.hsize_len_factor	= 2,
> > 
> > +		.mbus_codes		= 
SUN6I_BUS_FMTS(MEDIA_BUS_FMT_YUYV8_2X8,
> > +							 
MEDIA_BUS_FMT_YUYV8_1X16),
> > 
> >  	},
> >  	{
> >  	
> >  		.pixelformat		= V4L2_PIX_FMT_YVYU,
> > 
> > @@ -130,6 +148,8 @@ static const struct sun6i_csi_capture_format
> > sun6i_csi_capture_formats[] = {> 
> >  		.output_format_field	= 
SUN6I_CSI_OUTPUT_FMT_FIELD_RAW_8,
> >  		.input_format_raw	= true,
> >  		.hsize_len_factor	= 2,
> > 
> > +		.mbus_codes		= 
SUN6I_BUS_FMTS(MEDIA_BUS_FMT_YVYU8_2X8,
> > +							 
MEDIA_BUS_FMT_YVYU8_1X16),
> > 
> >  	},
> >  	{
> >  	
> >  		.pixelformat		= V4L2_PIX_FMT_UYVY,
> > 
> > @@ -137,6 +157,8 @@ static const struct sun6i_csi_capture_format
> > sun6i_csi_capture_formats[] = {> 
> >  		.output_format_field	= 
SUN6I_CSI_OUTPUT_FMT_FIELD_RAW_8,
> >  		.input_format_raw	= true,
> >  		.hsize_len_factor	= 2,
> > 
> > +		.mbus_codes		= 
SUN6I_BUS_FMTS(MEDIA_BUS_FMT_UYVY8_2X8,
> > +							 
MEDIA_BUS_FMT_UYVY8_1X16),
> > 
> >  	},
> >  	{
> >  	
> >  		.pixelformat		= V4L2_PIX_FMT_VYUY,
> > 
> > @@ -144,57 +166,68 @@ static const struct sun6i_csi_capture_format
> > sun6i_csi_capture_formats[] = {> 
> >  		.output_format_field	= 
SUN6I_CSI_OUTPUT_FMT_FIELD_RAW_8,
> >  		.input_format_raw	= true,
> >  		.hsize_len_factor	= 2,
> > 
> > +		.mbus_codes		= 
SUN6I_BUS_FMTS(MEDIA_BUS_FMT_VYUY8_2X8,
> > +							 
MEDIA_BUS_FMT_VYUY8_1X16),
> > 
> >  	},
> >  	{
> >  	
> >  		.pixelformat		= V4L2_PIX_FMT_NV16,
> >  		.output_format_frame	= 
SUN6I_CSI_OUTPUT_FMT_FRAME_YUV422SP,
> >  		.output_format_field	= 
SUN6I_CSI_OUTPUT_FMT_FIELD_YUV422SP,
> > 
> > +		.mbus_codes		= 0,
> 
> I don't think this is correct. To produce semi-planar or multi-planar
> YUV formats, I believe the CSI needs YUV input. This should thus be
> (unless I'm mistaken)
> 
> 		.mbus_codes		= 
SUN6I_BUS_FMTS(MEDIA_BUS_FMT_UYVY8_2X8,
> 							 
MEDIA_BUS_FMT_UYVY8_1X16,
> 							 
MEDIA_BUS_FMT_VYUY8_2X8,
> 							 
MEDIA_BUS_FMT_VYUY8_1X16,
> 							 
MEDIA_BUS_FMT_YUYV8_2X8,
> 							 
MEDIA_BUS_FMT_YUYV8_1X16,
> 							 
MEDIA_BUS_FMT_YVYU8_2X8,
> 							 
MEDIA_BUS_FMT_YVYU8_1X16),
> 
> and same below.
> 
Hi Laurent

Thanks for the help and tips.  Ive made all the other changes, which can be 
viewed here until i resubmit them https://github.com/sailfish-on-dontbeevil/
kernel-megi/commits/pinephone-libcamera

Im just not quite sure on this one.  I think my implementation of merging the 
arrays keeps the previous mapping right?  In sun6i_csi_capture_format_matches 
there is no mapping for the *NV formats, and the remaining ones ive set to 0?

Thanks

> Paul, could you confirm this ?
> 
> I'm a bit surprised that the CSI can't shuffle the YUV components for
> packed YUYV formats, but so be it if that's a hardware limitation.
> 
> I'm also thinking that a subsequent patch could drop the raw check from
> sun6i_csi_capture_link_validate():
> 
> -	/* With raw input mode, we need a 1:1 match between input and 
output. */
> -	if (bridge_format->input_format == SUN6I_CSI_INPUT_FMT_RAW ||
> -	    capture_format->input_format_raw) {
> -		match = sun6i_csi_capture_format_match(pixelformat,
> -						       
fmt.format.code);
> -		if (!match)
> -			goto invalid;
> -	}
> +	/* Make sure the media bus code and pixel format are compatible. */
> +	match = sun6i_csi_capture_format_match(pixelformat, 
fmt.format.code);
> +	if (!match)
> +		goto invalid;
> 
> >  	},
> >  	{
> >  	
> >  		.pixelformat		= V4L2_PIX_FMT_NV61,
> >  		.output_format_frame	= 
SUN6I_CSI_OUTPUT_FMT_FRAME_YUV422SP,
> >  		.output_format_field	= 
SUN6I_CSI_OUTPUT_FMT_FIELD_YUV422SP,
> >  		.input_yuv_seq_invert	= true,
> > 
> > +		.mbus_codes		= 0,
> > 
> >  	},
> >  	{
> >  	
> >  		.pixelformat		= V4L2_PIX_FMT_YUV422P,
> >  		.output_format_frame	= 
SUN6I_CSI_OUTPUT_FMT_FRAME_YUV422P,
> >  		.output_format_field	= 
SUN6I_CSI_OUTPUT_FMT_FIELD_YUV422P,
> > 
> > +		.mbus_codes		= 0,
> > 
> >  	},
> >  	/* YUV420 */
> >  	{
> >  	
> >  		.pixelformat		= V4L2_PIX_FMT_NV12_16L16,
> >  		.output_format_frame	= 
SUN6I_CSI_OUTPUT_FMT_FRAME_YUV420MB,
> >  		.output_format_field	= 
SUN6I_CSI_OUTPUT_FMT_FIELD_YUV420MB,
> > 
> > +		.mbus_codes		= 0,
> > 
> >  	},
> >  	{
> >  	
> >  		.pixelformat		= V4L2_PIX_FMT_NV12,
> >  		.output_format_frame	= 
SUN6I_CSI_OUTPUT_FMT_FRAME_YUV420SP,
> >  		.output_format_field	= 
SUN6I_CSI_OUTPUT_FMT_FIELD_YUV420SP,
> > 
> > +		.mbus_codes		= 0,
> > 
> >  	},
> >  	{
> >  	
> >  		.pixelformat		= V4L2_PIX_FMT_NV21,
> >  		.output_format_frame	= 
SUN6I_CSI_OUTPUT_FMT_FRAME_YUV420SP,
> >  		.output_format_field	= 
SUN6I_CSI_OUTPUT_FMT_FIELD_YUV420SP,
> >  		.input_yuv_seq_invert	= true,
> > 
> > +		.mbus_codes		= 0,
> > 
> >  	},
> >  	
> >  	{
> >  	
> >  		.pixelformat		= V4L2_PIX_FMT_YUV420,
> >  		.output_format_frame	= 
SUN6I_CSI_OUTPUT_FMT_FRAME_YUV420P,
> >  		.output_format_field	= 
SUN6I_CSI_OUTPUT_FMT_FIELD_YUV420P,
> > 
> > +		.mbus_codes		= 0,
> > 
> >  	},
> >  	{
> >  	
> >  		.pixelformat		= V4L2_PIX_FMT_YVU420,
> >  		.output_format_frame	= 
SUN6I_CSI_OUTPUT_FMT_FRAME_YUV420P,
> >  		.output_format_field	= 
SUN6I_CSI_OUTPUT_FMT_FIELD_YUV420P,
> >  		.input_yuv_seq_invert	= true,
> > 
> > +		.mbus_codes		= 0,
> > 
> >  	},
> >  	/* Compressed */
> >  	{
> >  	
> >  		.pixelformat		= V4L2_PIX_FMT_JPEG,
> >  		.output_format_frame	= 
SUN6I_CSI_OUTPUT_FMT_FRAME_RAW_8,
> >  		.output_format_field	= 
SUN6I_CSI_OUTPUT_FMT_FIELD_RAW_8,
> > 
> > +		.mbus_codes		= 
SUN6I_BUS_FMTS(MEDIA_BUS_FMT_JPEG_1X8),
> > 
> >  	},
> >  
> >  };
> > 
> > @@ -210,118 +243,20 @@ struct sun6i_csi_capture_format
> > *sun6i_csi_capture_format_find(u32 pixelformat)> 
> >  	return NULL;
> >  
> >  }
> > 
> > -/* RAW formats need an exact match between pixel and mbus formats. */
> > -static const
> > -struct sun6i_csi_capture_format_match sun6i_csi_capture_format_matches[]
> > = { -	/* YUV420 */
> > -	{
> > -		.pixelformat	= V4L2_PIX_FMT_YUYV,
> > -		.mbus_code	= MEDIA_BUS_FMT_YUYV8_2X8,
> > -	},
> > -	{
> > -		.pixelformat	= V4L2_PIX_FMT_YUYV,
> > -		.mbus_code	= MEDIA_BUS_FMT_YUYV8_1X16,
> > -	},
> > -	{
> > -		.pixelformat	= V4L2_PIX_FMT_YVYU,
> > -		.mbus_code	= MEDIA_BUS_FMT_YVYU8_2X8,
> > -	},
> > -	{
> > -		.pixelformat	= V4L2_PIX_FMT_YVYU,
> > -		.mbus_code	= MEDIA_BUS_FMT_YVYU8_1X16,
> > -	},
> > -	{
> > -		.pixelformat	= V4L2_PIX_FMT_UYVY,
> > -		.mbus_code	= MEDIA_BUS_FMT_UYVY8_2X8,
> > -	},
> > -	{
> > -		.pixelformat	= V4L2_PIX_FMT_UYVY,
> > -		.mbus_code	= MEDIA_BUS_FMT_UYVY8_1X16,
> > -	},
> > -	{
> > -		.pixelformat	= V4L2_PIX_FMT_VYUY,
> > -		.mbus_code	= MEDIA_BUS_FMT_VYUY8_2X8,
> > -	},
> > -	{
> > -		.pixelformat	= V4L2_PIX_FMT_VYUY,
> > -		.mbus_code	= MEDIA_BUS_FMT_VYUY8_1X16,
> > -	},
> > -	/* RGB */
> > -	{
> > -		.pixelformat	= V4L2_PIX_FMT_RGB565,
> > -		.mbus_code	= MEDIA_BUS_FMT_RGB565_2X8_LE,
> > -	},
> > -	{
> > -		.pixelformat	= V4L2_PIX_FMT_RGB565X,
> > -		.mbus_code	= MEDIA_BUS_FMT_RGB565_2X8_BE,
> > -	},
> > -	/* Bayer */
> > -	{
> > -		.pixelformat	= V4L2_PIX_FMT_SBGGR8,
> > -		.mbus_code	= MEDIA_BUS_FMT_SBGGR8_1X8,
> > -	},
> > -	{
> > -		.pixelformat	= V4L2_PIX_FMT_SGBRG8,
> > -		.mbus_code	= MEDIA_BUS_FMT_SGBRG8_1X8,
> > -	},
> > -	{
> > -		.pixelformat	= V4L2_PIX_FMT_SGRBG8,
> > -		.mbus_code	= MEDIA_BUS_FMT_SGRBG8_1X8,
> > -	},
> > -	{
> > -		.pixelformat	= V4L2_PIX_FMT_SRGGB8,
> > -		.mbus_code	= MEDIA_BUS_FMT_SRGGB8_1X8,
> > -	},
> > -	{
> > -		.pixelformat	= V4L2_PIX_FMT_SBGGR10,
> > -		.mbus_code	= MEDIA_BUS_FMT_SBGGR10_1X10,
> > -	},
> > -	{
> > -		.pixelformat	= V4L2_PIX_FMT_SGBRG10,
> > -		.mbus_code	= MEDIA_BUS_FMT_SGBRG10_1X10,
> > -	},
> > -	{
> > -		.pixelformat	= V4L2_PIX_FMT_SGRBG10,
> > -		.mbus_code	= MEDIA_BUS_FMT_SGRBG10_1X10,
> > -	},
> > -	{
> > -		.pixelformat	= V4L2_PIX_FMT_SRGGB10,
> > -		.mbus_code	= MEDIA_BUS_FMT_SRGGB10_1X10,
> > -	},
> > -	{
> > -		.pixelformat	= V4L2_PIX_FMT_SBGGR12,
> > -		.mbus_code	= MEDIA_BUS_FMT_SBGGR12_1X12,
> > -	},
> > -	{
> > -		.pixelformat	= V4L2_PIX_FMT_SGBRG12,
> > -		.mbus_code	= MEDIA_BUS_FMT_SGBRG12_1X12,
> > -	},
> > -	{
> > -		.pixelformat	= V4L2_PIX_FMT_SGRBG12,
> > -		.mbus_code	= MEDIA_BUS_FMT_SGRBG12_1X12,
> > -	},
> > -	{
> > -		.pixelformat	= V4L2_PIX_FMT_SRGGB12,
> > -		.mbus_code	= MEDIA_BUS_FMT_SRGGB12_1X12,
> > -	},
> > -	/* Compressed */
> > -	{
> > -		.pixelformat	= V4L2_PIX_FMT_JPEG,
> > -		.mbus_code	= MEDIA_BUS_FMT_JPEG_1X8,
> > -	},
> > -};
> > -
> > 
> >  static bool sun6i_csi_capture_format_match(u32 pixelformat, u32
> >  mbus_code)
> >  {
> > 
> > -	unsigned int i;
> > -
> > -	for (i = 0; i < ARRAY_SIZE(sun6i_csi_capture_format_matches); i++) 
{
> > -		const struct sun6i_csi_capture_format_match *match =
> > -			&sun6i_csi_capture_format_matches[i];
> > -
> > -		if (match->pixelformat == pixelformat &&
> > -		    match->mbus_code == mbus_code)
> > -			return true;
> > +	unsigned int i, j;
> > +
> > +	for (i = 0; i < ARRAY_SIZE(sun6i_csi_capture_formats); i++) {
> > +		const struct sun6i_csi_capture_format *format =
> > +			&sun6i_csi_capture_formats[i];
> > +
> > +		if (format->pixelformat == pixelformat) {
> > +			for (j = 0; format->mbus_codes[j]; j++) {
> > +				if (mbus_code == format-
>mbus_codes[j])
> > +					return true;
> > +			}
> > +		}
> > 
> >  	}
> >  	
> >  	return false;
> > 
> > diff --git a/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi_capture.h
> > b/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi_capture.h index
> > 3ee5ccefbd10..0484942834e3 100644
> > --- a/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi_capture.h
> > +++ b/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi_capture.h
> > @@ -27,11 +27,7 @@ struct sun6i_csi_capture_format {
> > 
> >  	bool	input_yuv_seq_invert;
> >  	bool	input_format_raw;
> >  	u32	hsize_len_factor;
> > 
> > -};
> > -
> > -struct sun6i_csi_capture_format_match {
> > -	u32	pixelformat;
> > -	u32	mbus_code;
> > +	const u32 *mbus_codes;
> > 
> >  };
> >  
> >  #undef current


--nextPart4808305.31r3eYUQgx
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEG9S9FlpVKT4WucElgZzecrq7HBkFAmO7CjwACgkQgZzecrq7
HBn0Mg//S7wRWIQIHQrR2esqx4iNTidVnul84Ca6sZeFu2i8QnRtkiPuc+IBbVpR
5FBcmNeuBgQP0+8LsQAhGc+QNN1tMqVb4cLxchEJTysFDUinK2LfxdLN/EPDS3rz
3rYYMClQXkCnHMJADP3+nlPYSuLIXBAzIKlXNa+aI8UZ05vAk+jzcdmJvKTto0Px
ejKtTOeJMd90h39tUkycMcIyGLtX75oDaZDgzACHxu4XNBLfXxCN/NWHnkRB4SbH
Ca/+/PutTw1d5Pfj+os7NmawugwoavPldUici51T8PUWdblKP57exB/0/9CYFsOa
RZAAQxuKblbKvSbJQPCt54Pxi5d3126AQ1H7GO3lNIxony06bpwIt2CUi5UYHvHR
+EZzsfKPrjx2npPkPusXnGgBsA2FypLYKA9WqzVF8eJFpvevupsN5JUuqK3VFNPw
09K0v50ZVbCE930IgYlYKPXpZZYE48jQjediQ2NcERMsroWzWSrRgdmUPI4FzzZb
KKXe4763Mfb/Hfd2VoPyKRcee1ShXpR0XvN+VfgUksA9pLP3Rdv0k2OjNeUf+cjz
FudPf6yRNqvWHZbRow/XfYH9S4tEk/sfhgF/yCwnspjXszDk6En6SpsIM78P9aNt
PVr/h4KKrGksOrQ4Jbyg/sXGQRsAMsQ0kulxD9/sq9VtCfbi7aY=
=alg4
-----END PGP SIGNATURE-----

--nextPart4808305.31r3eYUQgx--



