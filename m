Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 74E1C39DC1D
	for <lists+linux-media@lfdr.de>; Mon,  7 Jun 2021 14:21:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230194AbhFGMXj (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 7 Jun 2021 08:23:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52864 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230173AbhFGMXj (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 7 Jun 2021 08:23:39 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BEAD1C061766
        for <linux-media@vger.kernel.org>; Mon,  7 Jun 2021 05:21:47 -0700 (PDT)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 409138DB;
        Mon,  7 Jun 2021 14:21:46 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1623068506;
        bh=szjP9Y+P+2T8W6ZDdrPzU7RF1uvL5B0XKQlPcFgCAJk=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=g01sWA/mp8V20gjSmh/N67zilejYSHk3rbP/z9CrW3U8SuJ0wa0Xrhg9BIqbsiFSp
         ipnPfwEm7Bqw7cXvtJir6Lr8tgtfbOSUK2uQGuAi+dqLdB74sILHZm5nqVPofGq0sb
         D1tWZGdnZj9KVgaRRoKiTSuT6mLxjhePPfKI/VuE=
Date:   Mon, 7 Jun 2021 15:21:32 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc:     Pratyush Yadav <p.yadav@ti.com>, Lokesh Vutla <lokeshvutla@ti.com>,
        linux-media@vger.kernel.org
Subject: Re: [PATCH v3 33/38] media: ti-vpe: cal: add camerarx locking
Message-ID: <YL4PTJGWNt46WQj1@pendragon.ideasonboard.com>
References: <20210524110909.672432-1-tomi.valkeinen@ideasonboard.com>
 <20210524110909.672432-34-tomi.valkeinen@ideasonboard.com>
 <YLo1TGU/skvimy70@pendragon.ideasonboard.com>
 <d204c557-2801-8710-23f9-cb385c9c21cf@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <d204c557-2801-8710-23f9-cb385c9c21cf@ideasonboard.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Tomi,

On Mon, Jun 07, 2021 at 02:55:04PM +0300, Tomi Valkeinen wrote:
> On 04/06/2021 17:14, Laurent Pinchart wrote:
> > On Mon, May 24, 2021 at 02:09:04PM +0300, Tomi Valkeinen wrote:
> >> We don't have any locking in camerarx for the subdev ops. We have
> >> managed fine so far without locking, but in the future multiple video
> >> capture devices can use the same camerarx, and locking is a must.
> >>
> >> Add a mutex to protect the camerarx subdev ops. Some of the functions
> >> were slightly restructured to make lock handling cleaner.
> >>
> >> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
> >> ---
> >>   drivers/media/platform/ti-vpe/cal-camerarx.c | 81 ++++++++++++++------
> >>   drivers/media/platform/ti-vpe/cal.h          |  3 +
> >>   2 files changed, 61 insertions(+), 23 deletions(-)
> >>
> >> diff --git a/drivers/media/platform/ti-vpe/cal-camerarx.c b/drivers/media/platform/ti-vpe/cal-camerarx.c
> >> index 82392499e663..b87ffc52feb6 100644
> >> --- a/drivers/media/platform/ti-vpe/cal-camerarx.c
> >> +++ b/drivers/media/platform/ti-vpe/cal-camerarx.c
> >> @@ -601,12 +601,18 @@ cal_camerarx_get_pad_format(struct cal_camerarx *phy,
> >>   static int cal_camerarx_sd_s_stream(struct v4l2_subdev *sd, int enable)
> >>   {
> >>   	struct cal_camerarx *phy = to_cal_camerarx(sd);
> >> +	int r = 0;
> > 
> > The driver uses ret :-)
> 
> ...fine... ;)
> 
> >> +
> >> +	mutex_lock(&phy->mutex);
> >>   
> >>   	if (enable)
> >> -		return cal_camerarx_start(phy);
> >> +		r = cal_camerarx_start(phy);
> >> +	else
> >> +		cal_camerarx_stop(phy);
> >>   
> >> -	cal_camerarx_stop(phy);
> >> -	return 0;
> >> +	mutex_unlock(&phy->mutex);
> >> +
> >> +	return r;
> >>   }
> >>   
> >>   static int cal_camerarx_sd_enum_mbus_code(struct v4l2_subdev *sd,
> >> @@ -614,27 +620,36 @@ static int cal_camerarx_sd_enum_mbus_code(struct v4l2_subdev *sd,
> >>   					  struct v4l2_subdev_mbus_code_enum *code)
> >>   {
> >>   	struct cal_camerarx *phy = to_cal_camerarx(sd);
> >> +	int r = 0;
> >> +
> >> +	mutex_lock(&phy->mutex);
> >>   
> >>   	/* No transcoding, source and sink codes must match. */
> >>   	if (code->pad == CAL_CAMERARX_PAD_SOURCE) {
> >>   		struct v4l2_mbus_framefmt *fmt;
> >>   
> >> -		if (code->index > 0)
> >> -			return -EINVAL;
> >> +		if (code->index > 0) {
> >> +			r = -EINVAL;
> >> +			goto out;
> >> +		}
> >>   
> >>   		fmt = cal_camerarx_get_pad_format(phy, sd_state,
> >>   						  CAL_CAMERARX_PAD_SINK,
> >>   						  code->which);
> >>   		code->code = fmt->code;
> >> -		return 0;
> >> -	}
> >> +	} else {
> >> +		if (code->index >= cal_num_formats) {
> >> +			r = -EINVAL;
> >> +			goto out;
> >> +		}
> >>   
> >> -	if (code->index >= cal_num_formats)
> >> -		return -EINVAL;
> >> +		code->code = cal_formats[code->index].code;
> >> +	}
> >>   
> >> -	code->code = cal_formats[code->index].code;
> >> +out:
> >> +	mutex_unlock(&phy->mutex);
> >>   
> >> -	return 0;
> >> +	return r;
> >>   }
> >>   
> >>   static int cal_camerarx_sd_enum_frame_size(struct v4l2_subdev *sd,
> >> @@ -643,10 +658,13 @@ static int cal_camerarx_sd_enum_frame_size(struct v4l2_subdev *sd,
> >>   {
> >>   	struct cal_camerarx *phy = to_cal_camerarx(sd);
> >>   	const struct cal_format_info *fmtinfo;
> >> +	int r = 0;
> >>   
> >>   	if (fse->index > 0)
> >>   		return -EINVAL;
> >>   
> >> +	mutex_lock(&phy->mutex);
> >> +
> >>   	/* No transcoding, source and sink formats must match. */
> >>   	if (fse->pad == CAL_CAMERARX_PAD_SOURCE) {
> >>   		struct v4l2_mbus_framefmt *fmt;
> >> @@ -654,27 +672,34 @@ static int cal_camerarx_sd_enum_frame_size(struct v4l2_subdev *sd,
> >>   		fmt = cal_camerarx_get_pad_format(phy, sd_state,
> >>   						  CAL_CAMERARX_PAD_SINK,
> >>   						  fse->which);
> >> -		if (fse->code != fmt->code)
> >> -			return -EINVAL;
> >> +		if (fse->code != fmt->code) {
> >> +			r = -EINVAL;
> >> +			goto out;
> >> +		}
> >>   
> >>   		fse->min_width = fmt->width;
> >>   		fse->max_width = fmt->width;
> >>   		fse->min_height = fmt->height;
> >>   		fse->max_height = fmt->height;
> >> +	} else {
> >> +		fmtinfo = cal_format_by_code(fse->code);
> >> +		if (!fmtinfo) {
> >> +			r = -EINVAL;
> >> +			goto out;
> >> +		}
> >>   
> >> -		return 0;
> >> +		fse->min_width =
> >> +			CAL_MIN_WIDTH_BYTES * 8 / ALIGN(fmtinfo->bpp, 8);
> >> +		fse->max_width =
> >> +			CAL_MAX_WIDTH_BYTES * 8 / ALIGN(fmtinfo->bpp, 8);
> > 
> > This is a case where I'd write
> > 
> > 		fse->min_width = CAL_MIN_WIDTH_BYTES * 8
> > 			       / ALIGN(fmtinfo->bpp, 8);
> > 		fse->max_width = CAL_MAX_WIDTH_BYTES * 8
> > 			       / ALIGN(fmtinfo->bpp, 8);
> > 
> > or go slightly over 80 columns.
> 
> Yes. clang-format insist on formatting like that, and I haven't figured 
> out how to prevent it from moving everything to next line. It does that 
> for some function calls too.
> 
> And I'm often relying on clang-format, as my editor doesn't like mixed 
> spaces and tabs (googling shows that most of Internet hates mixed spaces 
> and tabs...).
> 
> But wouldn't the operator usually be left in the earlier line, i.e.
> 
> fse->min_width = CAL_MIN_WIDTH_BYTES * 8 /
>                   ALIGN(fmtinfo->bpp, 8);
> 
> ? That's how I would split it.

It's a matter of preference I think. I find operators at the beginning
of the next lien to be more readable, but that's just me.

> >> +		fse->min_height = CAL_MIN_HEIGHT_LINES;
> >> +		fse->max_height = CAL_MAX_HEIGHT_LINES;
> >>   	}
> >>   
> >> -	fmtinfo = cal_format_by_code(fse->code);
> >> -	if (!fmtinfo)
> >> -		return -EINVAL;
> >> -
> >> -	fse->min_width = CAL_MIN_WIDTH_BYTES * 8 / ALIGN(fmtinfo->bpp, 8);
> >> -	fse->max_width = CAL_MAX_WIDTH_BYTES * 8 / ALIGN(fmtinfo->bpp, 8);
> >> -	fse->min_height = CAL_MIN_HEIGHT_LINES;
> >> -	fse->max_height = CAL_MAX_HEIGHT_LINES;
> >> +out:
> >> +	mutex_unlock(&phy->mutex);
> >>   
> >> -	return 0;
> >> +	return r;
> >>   }
> >>   
> >>   static int cal_camerarx_sd_get_fmt(struct v4l2_subdev *sd,
> >> @@ -684,10 +709,14 @@ static int cal_camerarx_sd_get_fmt(struct v4l2_subdev *sd,
> >>   	struct cal_camerarx *phy = to_cal_camerarx(sd);
> >>   	struct v4l2_mbus_framefmt *fmt;
> >>   
> >> +	mutex_lock(&phy->mutex);
> >> +
> >>   	fmt = cal_camerarx_get_pad_format(phy, sd_state, format->pad,
> >>   					  format->which);
> >>   	format->format = *fmt;
> >>   
> >> +	mutex_unlock(&phy->mutex);
> >> +
> >>   	return 0;
> >>   }
> >>   
> >> @@ -725,6 +754,8 @@ static int cal_camerarx_sd_set_fmt(struct v4l2_subdev *sd,
> >>   	format->format.field = V4L2_FIELD_NONE;
> >>   
> >>   	/* Store the format and propagate it to the source pad. */
> >> +	mutex_lock(&phy->mutex);
> >> +
> >>   	fmt = cal_camerarx_get_pad_format(phy, sd_state,
> >>   					  CAL_CAMERARX_PAD_SINK,
> >>   					  format->which);
> >> @@ -735,6 +766,8 @@ static int cal_camerarx_sd_set_fmt(struct v4l2_subdev *sd,
> >>   					  format->which);
> >>   	*fmt = format->format;
> >>   
> >> +	mutex_unlock(&phy->mutex);
> >> +
> >>   	return 0;
> >>   }
> >>   
> >> @@ -801,6 +834,8 @@ struct cal_camerarx *cal_camerarx_create(struct cal_dev *cal,
> >>   	phy->cal = cal;
> >>   	phy->instance = instance;
> >>   
> >> +	mutex_init(&phy->mutex);
> > 
> > A mutex_destroy() somewhere would be nice.
> 
> Right.
> 
> >> +
> >>   	phy->res = platform_get_resource_byname(pdev, IORESOURCE_MEM,
> >>   						(instance == 0) ?
> >>   						"cal_rx_core0" :
> >> diff --git a/drivers/media/platform/ti-vpe/cal.h b/drivers/media/platform/ti-vpe/cal.h
> >> index ad08c189ad3b..78bd2e041d9a 100644
> >> --- a/drivers/media/platform/ti-vpe/cal.h
> >> +++ b/drivers/media/platform/ti-vpe/cal.h
> >> @@ -163,6 +163,9 @@ struct cal_camerarx {
> >>   	struct v4l2_subdev	subdev;
> >>   	struct media_pad	pads[2];
> >>   	struct v4l2_mbus_framefmt	formats[2];
> >> +
> >> +	/* mutex for camerarx ops */
> >> +	struct mutex		mutex;
> > 
> > It's best when possible to list the fields protected by a lock, instead
> > of the functions. It seems to be cal_camerarx.formats (but would need to
> > be updated in subsequent patches).
> 
> I've added this.

-- 
Regards,

Laurent Pinchart
