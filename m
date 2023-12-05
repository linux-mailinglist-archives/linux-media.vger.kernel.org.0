Return-Path: <linux-media+bounces-1668-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 27A2B80543D
	for <lists+linux-media@lfdr.de>; Tue,  5 Dec 2023 13:35:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 72793B20D1E
	for <lists+linux-media@lfdr.de>; Tue,  5 Dec 2023 12:35:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5715E5C093;
	Tue,  5 Dec 2023 12:35:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="pR9XE9IJ"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 69785124
	for <linux-media@vger.kernel.org>; Tue,  5 Dec 2023 04:35:08 -0800 (PST)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 20D07844;
	Tue,  5 Dec 2023 13:34:27 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1701779667;
	bh=1AYje0Egh7SHGk9v6kuF0THbszQeacNkRNM9sdbQziU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=pR9XE9IJ7Ix+qad6uxLmxqlRvNifNnNUJO1lXyFXc4c9TRM068HsJk7FLs5O+bc5+
	 SIuOQYtjyjUhc4I5/C+C/nLqjn5pnlOzshiIGGUvxxtS2ANIDsRN3igjAPX5pCiVXk
	 Pn3I8eVroGdC7BBCPBBUiCh1Ypjs0MurymkiVOqE=
Date: Tue, 5 Dec 2023 14:35:14 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org
Subject: Re: [PATCH 1/1] media: v4l: Move sub-device state information access
 function prototypes
Message-ID: <20231205123514.GA27007@pendragon.ideasonboard.com>
References: <20231205122243.875127-1-sakari.ailus@linux.intel.com>
 <20231205122637.GA26759@pendragon.ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20231205122637.GA26759@pendragon.ideasonboard.com>

On Tue, Dec 05, 2023 at 02:26:37PM +0200, Laurent Pinchart wrote:
> Hi Sakari,
> 
> Thank you for the patch.
> 
> On Tue, Dec 05, 2023 at 02:22:43PM +0200, Sakari Ailus wrote:
> > The sub-device state information access function prototypes such as
> > v4l2_subdev_state_get_format() were conditional to CONFIG_MC even though
> 
> It's CONFIG_MEDIA_CONTROLLER, not CONFIG_MC.
> 
> > the actual implementation was not. Drivers may use the functions without
> > MC. Fix this.
> > 
> > Reported-by: kernel test robot <lkp@intel.com>
> > Closes: https://lore.kernel.org/oe-kbuild-all/202312051913.e5iif8Qz-lkp@intel.com/
> > Fixes: bc0e8d91feec ("media: v4l: subdev: Switch to stream-aware state functions")
> > Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> > ---
> > Not compile tested yet but it should work...
> 
> It won't I'm afraid. The implementations of the corresponding functions
> in v4l2-subdev.c depend on CONFIG_MEDIA_CONTROLLER, both explicitly
> (they're guarded by an #ifdef), and implicitly (they access the subdev
> entity field, which is guarded by an #ifdef in v4l2-subdev.h).

If you decide to instead select MEDIA_CONTROLLER for the
VIDEO_SAA6752HS, you should also address VIDEO_ADV7183 and VIDEO_TW9910.

There's also the interesting case of the RJ54N1CB0C, the rj54n1cb0c.c
file is not listed in drivers/media/i2c/Makefile.

> >  include/media/v4l2-subdev.h | 158 ++++++++++++++++++------------------
> >  1 file changed, 79 insertions(+), 79 deletions(-)
> > 
> > diff --git a/include/media/v4l2-subdev.h b/include/media/v4l2-subdev.h
> > index 8b08f6640dee..0099e177980e 100644
> > --- a/include/media/v4l2-subdev.h
> > +++ b/include/media/v4l2-subdev.h
> > @@ -1186,6 +1186,85 @@ static inline void *v4l2_get_subdev_hostdata(const struct v4l2_subdev *sd)
> >  	return sd->host_priv;
> >  }
> >  
> > +/*
> > + * A macro to generate the macro or function name for sub-devices state access
> > + * wrapper macros below.
> > + */
> > +#define __v4l2_subdev_state_gen_call(NAME, _1, ARG, ...)	\
> > +	__v4l2_subdev_state_get_ ## NAME ## ARG
> > +
> > +/**
> > + * v4l2_subdev_state_get_format() - Get pointer to a stream format
> > + * @state: subdevice state
> > + * @pad: pad id
> > + * @...: stream id (optional argument)
> > + *
> > + * This returns a pointer to &struct v4l2_mbus_framefmt for the given pad +
> > + * stream in the subdev state.
> > + *
> > + * For stream-unaware drivers the format for the corresponding pad is returned.
> > + * If the pad does not exist, NULL is returned.
> > + */
> > +/*
> > + * Wrap v4l2_subdev_state_get_format(), allowing the function to be called with
> > + * two or three arguments. The purpose of the __v4l2_subdev_state_get_format()
> > + * macro below is to come up with the name of the function or macro to call,
> > + * using the last two arguments (_stream and _pad). The selected function or
> > + * macro is then called using the arguments specified by the caller. A similar
> > + * arrangement is used for v4l2_subdev_state_crop() and
> > + * v4l2_subdev_state_compose() below.
> > + */
> > +#define v4l2_subdev_state_get_format(state, pad, ...)			\
> > +	__v4l2_subdev_state_gen_call(format, ##__VA_ARGS__, , _pad)	\
> > +		(state, pad, ##__VA_ARGS__)
> > +#define __v4l2_subdev_state_get_format_pad(state, pad)	\
> > +	__v4l2_subdev_state_get_format(state, pad, 0)
> > +struct v4l2_mbus_framefmt *
> > +__v4l2_subdev_state_get_format(struct v4l2_subdev_state *state,
> > +			       unsigned int pad, u32 stream);
> > +
> > +/**
> > + * v4l2_subdev_state_get_crop() - Get pointer to a stream crop rectangle
> > + * @state: subdevice state
> > + * @pad: pad id
> > + * @...: stream id (optional argument)
> > + *
> > + * This returns a pointer to crop rectangle for the given pad + stream in the
> > + * subdev state.
> > + *
> > + * For stream-unaware drivers the crop rectangle for the corresponding pad is
> > + * returned. If the pad does not exist, NULL is returned.
> > + */
> > +#define v4l2_subdev_state_get_crop(state, pad, ...)			\
> > +	__v4l2_subdev_state_gen_call(crop, ##__VA_ARGS__, , _pad)	\
> > +		(state, pad, ##__VA_ARGS__)
> > +#define __v4l2_subdev_state_get_crop_pad(state, pad)	\
> > +	__v4l2_subdev_state_get_crop(state, pad, 0)
> > +struct v4l2_rect *
> > +__v4l2_subdev_state_get_crop(struct v4l2_subdev_state *state, unsigned int pad,
> > +			     u32 stream);
> > +
> > +/**
> > + * v4l2_subdev_state_get_compose() - Get pointer to a stream compose rectangle
> > + * @state: subdevice state
> > + * @pad: pad id
> > + * @...: stream id (optional argument)
> > + *
> > + * This returns a pointer to compose rectangle for the given pad + stream in the
> > + * subdev state.
> > + *
> > + * For stream-unaware drivers the compose rectangle for the corresponding pad is
> > + * returned. If the pad does not exist, NULL is returned.
> > + */
> > +#define v4l2_subdev_state_get_compose(state, pad, ...)			\
> > +	__v4l2_subdev_state_gen_call(compose, ##__VA_ARGS__, , _pad)	\
> > +		(state, pad, ##__VA_ARGS__)
> > +#define __v4l2_subdev_state_get_compose_pad(state, pad)	\
> > +	__v4l2_subdev_state_get_compose(state, pad, 0)
> > +struct v4l2_rect *
> > +__v4l2_subdev_state_get_compose(struct v4l2_subdev_state *state,
> > +				unsigned int pad, u32 stream);
> > +
> >  #ifdef CONFIG_MEDIA_CONTROLLER
> >  
> >  /**
> > @@ -1394,85 +1473,6 @@ v4l2_subdev_lock_and_get_active_state(struct v4l2_subdev *sd)
> >  	return sd->active_state;
> >  }
> >  
> > -/*
> > - * A macro to generate the macro or function name for sub-devices state access
> > - * wrapper macros below.
> > - */
> > -#define __v4l2_subdev_state_gen_call(NAME, _1, ARG, ...)	\
> > -	__v4l2_subdev_state_get_ ## NAME ## ARG
> > -
> > -/**
> > - * v4l2_subdev_state_get_format() - Get pointer to a stream format
> > - * @state: subdevice state
> > - * @pad: pad id
> > - * @...: stream id (optional argument)
> > - *
> > - * This returns a pointer to &struct v4l2_mbus_framefmt for the given pad +
> > - * stream in the subdev state.
> > - *
> > - * For stream-unaware drivers the format for the corresponding pad is returned.
> > - * If the pad does not exist, NULL is returned.
> > - */
> > -/*
> > - * Wrap v4l2_subdev_state_get_format(), allowing the function to be called with
> > - * two or three arguments. The purpose of the __v4l2_subdev_state_get_format()
> > - * macro below is to come up with the name of the function or macro to call,
> > - * using the last two arguments (_stream and _pad). The selected function or
> > - * macro is then called using the arguments specified by the caller. A similar
> > - * arrangement is used for v4l2_subdev_state_crop() and
> > - * v4l2_subdev_state_compose() below.
> > - */
> > -#define v4l2_subdev_state_get_format(state, pad, ...)			\
> > -	__v4l2_subdev_state_gen_call(format, ##__VA_ARGS__, , _pad)	\
> > -		(state, pad, ##__VA_ARGS__)
> > -#define __v4l2_subdev_state_get_format_pad(state, pad)	\
> > -	__v4l2_subdev_state_get_format(state, pad, 0)
> > -struct v4l2_mbus_framefmt *
> > -__v4l2_subdev_state_get_format(struct v4l2_subdev_state *state,
> > -			       unsigned int pad, u32 stream);
> > -
> > -/**
> > - * v4l2_subdev_state_get_crop() - Get pointer to a stream crop rectangle
> > - * @state: subdevice state
> > - * @pad: pad id
> > - * @...: stream id (optional argument)
> > - *
> > - * This returns a pointer to crop rectangle for the given pad + stream in the
> > - * subdev state.
> > - *
> > - * For stream-unaware drivers the crop rectangle for the corresponding pad is
> > - * returned. If the pad does not exist, NULL is returned.
> > - */
> > -#define v4l2_subdev_state_get_crop(state, pad, ...)			\
> > -	__v4l2_subdev_state_gen_call(crop, ##__VA_ARGS__, , _pad)	\
> > -		(state, pad, ##__VA_ARGS__)
> > -#define __v4l2_subdev_state_get_crop_pad(state, pad)	\
> > -	__v4l2_subdev_state_get_crop(state, pad, 0)
> > -struct v4l2_rect *
> > -__v4l2_subdev_state_get_crop(struct v4l2_subdev_state *state, unsigned int pad,
> > -			     u32 stream);
> > -
> > -/**
> > - * v4l2_subdev_state_get_compose() - Get pointer to a stream compose rectangle
> > - * @state: subdevice state
> > - * @pad: pad id
> > - * @...: stream id (optional argument)
> > - *
> > - * This returns a pointer to compose rectangle for the given pad + stream in the
> > - * subdev state.
> > - *
> > - * For stream-unaware drivers the compose rectangle for the corresponding pad is
> > - * returned. If the pad does not exist, NULL is returned.
> > - */
> > -#define v4l2_subdev_state_get_compose(state, pad, ...)			\
> > -	__v4l2_subdev_state_gen_call(compose, ##__VA_ARGS__, , _pad)	\
> > -		(state, pad, ##__VA_ARGS__)
> > -#define __v4l2_subdev_state_get_compose_pad(state, pad)	\
> > -	__v4l2_subdev_state_get_compose(state, pad, 0)
> > -struct v4l2_rect *
> > -__v4l2_subdev_state_get_compose(struct v4l2_subdev_state *state,
> > -				unsigned int pad, u32 stream);
> > -
> >  #if defined(CONFIG_VIDEO_V4L2_SUBDEV_API)
> >  
> >  /**

-- 
Regards,

Laurent Pinchart

