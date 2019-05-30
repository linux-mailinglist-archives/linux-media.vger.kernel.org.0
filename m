Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E40B12FBB3
	for <lists+linux-media@lfdr.de>; Thu, 30 May 2019 14:44:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726131AbfE3MoA (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 30 May 2019 08:44:00 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:60026 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725919AbfE3MoA (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 30 May 2019 08:44:00 -0400
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: ezequiel)
        with ESMTPSA id D155926128E
Message-ID: <0ca6e3b4fa5332d87f019898f3617035d5cf1074.camel@collabora.com>
Subject: Re: [PATCH 2/2] media: v4l2-ctrl: Move compound control
 initialization
From:   Ezequiel Garcia <ezequiel@collabora.com>
To:     Boris Brezillon <boris.brezillon@collabora.com>
Cc:     linux-media@vger.kernel.org, Hans Verkuil <hans.verkuil@cisco.com>,
        kernel@collabora.com,
        Nicolas Dufresne <nicolas.dufresne@collabora.com>
Date:   Thu, 30 May 2019 09:43:51 -0300
In-Reply-To: <20190530100343.52c9570b@collabora.com>
References: <20190529192811.13986-1-ezequiel@collabora.com>
         <20190529192811.13986-2-ezequiel@collabora.com>
         <20190530100343.52c9570b@collabora.com>
Organization: Collabora
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.30.5-1 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, 2019-05-30 at 10:03 +0200, Boris Brezillon wrote:
> Hi Ezequiel,
> 
> On Wed, 29 May 2019 16:28:11 -0300
> Ezequiel Garcia <ezequiel@collabora.com> wrote:
> 
> > Rework std_init adding an explicit initialization for
> > compound controls.
> > 
> > While here, make sure the control is initialized to zero,
> > before providing default values for all its fields.
> > 
> > Signed-off-by: Ezequiel Garcia <ezequiel@collabora.com>
> > ---
> >  drivers/media/v4l2-core/v4l2-ctrls.c | 55 +++++++++++++++++-----------
> >  1 file changed, 34 insertions(+), 21 deletions(-)
> > 
> > diff --git a/drivers/media/v4l2-core/v4l2-ctrls.c b/drivers/media/v4l2-core/v4l2-ctrls.c
> > index c7d5fdb8efb4..44afda1d77b3 100644
> > --- a/drivers/media/v4l2-core/v4l2-ctrls.c
> > +++ b/drivers/media/v4l2-core/v4l2-ctrls.c
> > @@ -1506,25 +1506,49 @@ static bool std_equal(const struct v4l2_ctrl *ctrl, u32 idx,
> >  	}
> >  }
> >  
> > -static void std_init(const struct v4l2_ctrl *ctrl, u32 idx,
> > +static void std_init_compound(const struct v4l2_ctrl *ctrl, u32 idx,
> >  		     union v4l2_ctrl_ptr ptr)
> >  {
> >  	struct v4l2_ctrl_mpeg2_slice_params *p_mpeg2_slice_params;
> >  
> > +	memset(ptr.p, 0, ctrl->elem_size);
> > +
> 
> Hm, shouldn't we have
> 
> 	idx *= ctrl->elem_size;
> 	memset(ptr.p + idx, 0, ctrl->elem_size);
> 
> instead?
> 
> Looks like your solution always resets the first element of an array
> even if idx > 0.
> 

Yeah, this patch is poorly thought. This and the other comments make sense.

Thanks for the review,
Ezequiel

> >  	/*
> >  	 * The cast is needed to get rid of a gcc warning complaining that
> >  	 * V4L2_CTRL_TYPE_MPEG2_SLICE_PARAMS is not part of the
> >  	 * v4l2_ctrl_type enum.
> >  	 */
> >  	switch ((u32)ctrl->type) {
> > +	case V4L2_CTRL_TYPE_MPEG2_SLICE_PARAMS:
> > +		p_mpeg2_slice_params = ptr.p;
> > +		/* 4:2:0 */
> > +		p_mpeg2_slice_params->sequence.chroma_format = 1;
> > +		/* 8 bits */
> > +		p_mpeg2_slice_params->picture.intra_dc_precision = 0;
> > +		/* interlaced top field */
> > +		p_mpeg2_slice_params->picture.picture_structure = 1;
> > +		p_mpeg2_slice_params->picture.picture_coding_type =
> > +					V4L2_MPEG2_PICTURE_CODING_TYPE_I;
> > +		return;
> > +	default:
> > +		idx *= ctrl->elem_size;
> > +		memset(ptr.p + idx, 0, ctrl->elem_size);
> > +		return;
> 
> If you fix the first memset() you can get rid of this one. Also don't
> see why you use return instead of break in this switch-case block
> (there's no reason to bail out early in this function).
> 
> > +	}
> > +}
> > +
> > +static void std_init(const struct v4l2_ctrl *ctrl, u32 idx,
> > +		     union v4l2_ctrl_ptr ptr)
> > +{
> > +	switch (ctrl->type) {
> >  	case V4L2_CTRL_TYPE_STRING:
> >  		idx *= ctrl->elem_size;
> >  		memset(ptr.p_char + idx, ' ', ctrl->minimum);
> >  		ptr.p_char[idx + ctrl->minimum] = '\0';
> > -		break;
> > +		return;
> >  	case V4L2_CTRL_TYPE_INTEGER64:
> >  		ptr.p_s64[idx] = ctrl->default_value;
> > -		break;
> > +		return;
> >  	case V4L2_CTRL_TYPE_INTEGER:
> >  	case V4L2_CTRL_TYPE_INTEGER_MENU:
> >  	case V4L2_CTRL_TYPE_MENU:
> > @@ -1533,32 +1557,21 @@ static void std_init(const struct v4l2_ctrl *ctrl, u32 idx,
> >  	case V4L2_CTRL_TYPE_BUTTON:
> >  	case V4L2_CTRL_TYPE_CTRL_CLASS:
> >  		ptr.p_s32[idx] = ctrl->default_value;
> > -		break;
> > +		return;
> >  	case V4L2_CTRL_TYPE_U8:
> >  		ptr.p_u8[idx] = ctrl->default_value;
> > -		break;
> > +		return;
> >  	case V4L2_CTRL_TYPE_U16:
> >  		ptr.p_u16[idx] = ctrl->default_value;
> > -		break;
> > +		return;
> >  	case V4L2_CTRL_TYPE_U32:
> >  		ptr.p_u32[idx] = ctrl->default_value;
> > -		break;
> > -	case V4L2_CTRL_TYPE_MPEG2_SLICE_PARAMS:
> > -		p_mpeg2_slice_params = ptr.p;
> > -		/* 4:2:0 */
> > -		p_mpeg2_slice_params->sequence.chroma_format = 1;
> > -		/* 8 bits */
> > -		p_mpeg2_slice_params->picture.intra_dc_precision = 0;
> > -		/* interlaced top field */
> > -		p_mpeg2_slice_params->picture.picture_structure = 1;
> > -		p_mpeg2_slice_params->picture.picture_coding_type =
> > -					V4L2_MPEG2_PICTURE_CODING_TYPE_I;
> > -		break;
> > +		return;
> >  	default:
> > -		idx *= ctrl->elem_size;
> > -		memset(ptr.p + idx, 0, ctrl->elem_size);
> > -		break;
> > +		std_init_compound(ctrl, idx, ptr);
> > +		return;
> 
> Same comment here: I see no reasons to have return instead of break.
> 
> >  	}
> > +
> 
> You can get rid of this blank line.
> 
> >  }
> >  
> >  static void std_log(const struct v4l2_ctrl *ctrl)
> 
> Regards,
> 
> Boris


