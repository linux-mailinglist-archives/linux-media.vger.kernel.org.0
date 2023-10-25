Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6E1C17D69C7
	for <lists+linux-media@lfdr.de>; Wed, 25 Oct 2023 13:08:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232695AbjJYLIm (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 25 Oct 2023 07:08:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53702 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230217AbjJYLIl (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 25 Oct 2023 07:08:41 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 30160AC
        for <linux-media@vger.kernel.org>; Wed, 25 Oct 2023 04:08:39 -0700 (PDT)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id F2B1FBD1;
        Wed, 25 Oct 2023 13:08:25 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1698232106;
        bh=WQp1aeFjK5O9HCeh3fWtgUlDzWFTM17g11R/59/FWwg=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=vt21/eXJg0eQE5RGZy4YiQBkYdU3xTVjl4n2cF7W/iXbZJS/0SZquINEYXGG11mmx
         8mUNV2S31Q51dCrE0ABJEBxzQWTQT+VSQM/QbJ6O2OsYPUCT2d3THQIxYvr3QG1ks2
         opsN1KQ25RZARNQ7crlotC3ZMgiM79A8vpw+50c0=
Date:   Wed, 25 Oct 2023 14:08:44 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Eugen Hristev <eugen.hristev@collabora.com>
Cc:     linux-media@vger.kernel.org
Subject: Re: [PATCH] media: microchip-isc: Remove dead code in pipeline
 validation
Message-ID: <20231025110844.GF481@pendragon.ideasonboard.com>
References: <20231024233430.1488-1-laurent.pinchart@ideasonboard.com>
 <eae2aff1-e950-4e49-869f-a17d05a32631@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <eae2aff1-e950-4e49-869f-a17d05a32631@collabora.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_PASS,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Eugen,

On Wed, Oct 25, 2023 at 11:31:20AM +0300, Eugen Hristev wrote:
> On 10/25/23 02:34, Laurent Pinchart wrote:
> > The isc_try_fse() function, called from isc_validate(), takes two
> > parameters, an isc_device pointer, and a v4l2_subdev_state pointer. The
> > isc_device is accessed but not modified by the function. The state is
> > modified, including the struct v4l2_subdev_pad_config array it points
> > to, but they are then never used by the caller. Furthermore, the V4L2
> > subdev operation called by isc_try_fse() doesn't modify the subdev it is
> > called on. The isc_try_fse() function has thus no effect, and can just
> > be dropped.
> > 
> > Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > ---
> > This patch has been compile-tested only. Eugen, would you be able to
> > test it on hardware ?
> 
> Hello Laurent,
> 
> Thank you for the patch.
> When I initially wrote this code, I definitely had something in mind. I 
> think it was the fact that the ISC should adjust it's crop area 
> according to what the subdev is emitting, to avoid other problems (e.g. 
> reporting bad frame size and v4l2-compliance crying )
> Somehow , maybe, that intention is lost somewhere. I agree with you that 
> this code appears useless.

It seems to have been copied from the previous driver, which used the
try_crop field after fetching it, but that last part was dropping as
part of the conversion to MC.

> I will test it out and let you know . (I cannot promise exactly when I 
> have some time to do it, so bear with me please...)

Thank you.

> > ---
> >   .../platform/microchip/microchip-isc-base.c   | 39 -------------------
> >   1 file changed, 39 deletions(-)
> > 
> > diff --git a/drivers/media/platform/microchip/microchip-isc-base.c b/drivers/media/platform/microchip/microchip-isc-base.c
> > index 1f8528844497..540cb1378289 100644
> > --- a/drivers/media/platform/microchip/microchip-isc-base.c
> > +++ b/drivers/media/platform/microchip/microchip-isc-base.c
> > @@ -851,38 +851,6 @@ static int isc_try_configure_pipeline(struct isc_device *isc)
> >   	return 0;
> >   }
> >   
> > -static void isc_try_fse(struct isc_device *isc,
> > -			struct v4l2_subdev_state *sd_state)
> > -{
> > -	struct v4l2_subdev_frame_size_enum fse = {
> > -		.which = V4L2_SUBDEV_FORMAT_TRY,
> > -	};
> > -	int ret;
> > -
> > -	/*
> > -	 * If we do not know yet which format the subdev is using, we cannot
> > -	 * do anything.
> > -	 */
> > -	if (!isc->config.sd_format)
> > -		return;
> > -
> > -	fse.code = isc->try_config.sd_format->mbus_code;
> > -
> > -	ret = v4l2_subdev_call(isc->current_subdev->sd, pad, enum_frame_size,
> > -			       sd_state, &fse);
> > -	/*
> > -	 * Attempt to obtain format size from subdev. If not available,
> > -	 * just use the maximum ISC can receive.
> > -	 */
> > -	if (ret) {
> > -		sd_state->pads->try_crop.width = isc->max_width;
> > -		sd_state->pads->try_crop.height = isc->max_height;
> > -	} else {
> > -		sd_state->pads->try_crop.width = fse.max_width;
> > -		sd_state->pads->try_crop.height = fse.max_height;
> > -	}
> > -}
> > -
> >   static int isc_try_fmt(struct isc_device *isc, struct v4l2_format *f)
> >   {
> >   	struct v4l2_pix_format *pixfmt = &f->fmt.pix;
> > @@ -944,10 +912,6 @@ static int isc_validate(struct isc_device *isc)
> >   		.which = V4L2_SUBDEV_FORMAT_ACTIVE,
> >   		.pad = isc->remote_pad,
> >   	};
> > -	struct v4l2_subdev_pad_config pad_cfg = {};
> > -	struct v4l2_subdev_state pad_state = {
> > -		.pads = &pad_cfg,
> > -	};
> >   
> >   	/* Get current format from subdev */
> >   	ret = v4l2_subdev_call(isc->current_subdev->sd, pad, get_fmt, NULL,
> > @@ -1008,9 +972,6 @@ static int isc_validate(struct isc_device *isc)
> >   	if (ret)
> >   		return ret;
> >   
> > -	/* Obtain frame sizes if possible to have crop requirements ready */
> > -	isc_try_fse(isc, &pad_state);
> > -
> >   	/* Configure ISC pipeline for the config */
> >   	ret = isc_try_configure_pipeline(isc);
> >   	if (ret)
> 

-- 
Regards,

Laurent Pinchart
