Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 444077D9309
	for <lists+linux-media@lfdr.de>; Fri, 27 Oct 2023 11:06:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231233AbjJ0JGa (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 27 Oct 2023 05:06:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59118 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229636AbjJ0JG3 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 27 Oct 2023 05:06:29 -0400
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 37E2893
        for <linux-media@vger.kernel.org>; Fri, 27 Oct 2023 02:06:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1698397586; x=1729933586;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=nYP+CRBZQHYBzUZNSovYNpyNXBUR0zib2svD5LCtIuA=;
  b=XDa2APG3m+iDLl03Zdv7bpTzhXY/lPz7Zpv6jeFls4vInadsMDu9OqV/
   TfBbCvsgGYp8wTF4NOosOXpACL33By2xC9dTnmygZjYrDktftPSLBBIbl
   7Ec1DpYPyFs4KC0qUdYgAdnxjsV2/QibdWJSanZtDAKrJjRei/Pqkr5YF
   OsG0WYIvzXRrNGD3F9XhTQphi3Pw8Ce/Ykm//0Adsov/qGC9Jb9dP3f3o
   abgcYG2iumsECeRk+Hk/XjfTfb8t4SOon763VYH2IX75qX9DB4LW1IvDM
   y4eOBB15wr8tRzbE2awshGQD+DoCujYYSpmHwp4Wu4uGB5Ws7I00mKxJe
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10875"; a="384946473"
X-IronPort-AV: E=Sophos;i="6.03,255,1694761200"; 
   d="scan'208";a="384946473"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Oct 2023 02:06:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10875"; a="933014244"
X-IronPort-AV: E=Sophos;i="6.03,255,1694761200"; 
   d="scan'208";a="933014244"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Oct 2023 02:06:20 -0700
Received: from kekkonen.localdomain (localhost [127.0.0.1])
        by kekkonen.fi.intel.com (Postfix) with SMTP id C79E611F82E;
        Fri, 27 Oct 2023 12:06:17 +0300 (EEST)
Date:   Fri, 27 Oct 2023 09:06:17 +0000
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     linux-media@vger.kernel.org, hverkuil@xs4all.nl,
        tomi.valkeinen@ideasonboard.com, jacopo.mondi@ideasonboard.com,
        bingbu.cao@intel.com, hongju.wang@intel.com,
        Alain Volmat <alain.volmat@foss.st.com>
Subject: Re: [PATCH v4 5/9] media: v4l: subdev: Make stream argument optional
 in state access functions
Message-ID: <ZTt9ifIH8uYf2fYF@kekkonen.localdomain>
References: <20231026070329.948847-1-sakari.ailus@linux.intel.com>
 <20231026070329.948847-6-sakari.ailus@linux.intel.com>
 <20231026134904.GC26306@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231026134904.GC26306@pendragon.ideasonboard.com>
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Laurent,

On Thu, Oct 26, 2023 at 04:49:04PM +0300, Laurent Pinchart wrote:
> On Thu, Oct 26, 2023 at 10:03:25AM +0300, Sakari Ailus wrote:
> > The sub-device state access functions take three arguments: sub-device
> > state, pad and stream. The stream is not relevant for the majority of
> > drivers and having to specify 0 for the stream is considered a nuisance.
> > 
> > Provide a two-argument macros for these state access functions to cover
> > the needs of stream-unaware users.
> > 
> > Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> > Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > ---
> >  drivers/media/v4l2-core/v4l2-subdev.c | 18 +++++-----
> >  include/media/v4l2-subdev.h           | 48 ++++++++++++++++++++++-----
> >  2 files changed, 48 insertions(+), 18 deletions(-)
> > 
> > diff --git a/drivers/media/v4l2-core/v4l2-subdev.c b/drivers/media/v4l2-core/v4l2-subdev.c
> > index 2a615836c1d4..9d4ff9b4fcec 100644
> > --- a/drivers/media/v4l2-core/v4l2-subdev.c
> > +++ b/drivers/media/v4l2-core/v4l2-subdev.c
> > @@ -1671,8 +1671,8 @@ int v4l2_subdev_set_routing_with_fmt(struct v4l2_subdev *sd,
> >  EXPORT_SYMBOL_GPL(v4l2_subdev_set_routing_with_fmt);
> >  
> >  struct v4l2_mbus_framefmt *
> > -v4l2_subdev_state_get_format(struct v4l2_subdev_state *state, unsigned int pad,
> > -			     u32 stream)
> > +__v4l2_subdev_state_get_format_stream(struct v4l2_subdev_state *state,
> > +				      unsigned int pad, u32 stream)
> >  {
> >  	struct v4l2_subdev_stream_configs *stream_configs;
> >  	unsigned int i;
> > @@ -1706,11 +1706,11 @@ v4l2_subdev_state_get_format(struct v4l2_subdev_state *state, unsigned int pad,
> >  
> >  	return NULL;
> >  }
> > -EXPORT_SYMBOL_GPL(v4l2_subdev_state_get_format);
> > +EXPORT_SYMBOL_GPL(__v4l2_subdev_state_get_format_stream);
> >  
> >  struct v4l2_rect *
> > -v4l2_subdev_state_get_crop(struct v4l2_subdev_state *state, unsigned int pad,
> > -			   u32 stream)
> > +__v4l2_subdev_state_get_crop_stream(struct v4l2_subdev_state *state,
> > +				    unsigned int pad, u32 stream)
> >  {
> >  	struct v4l2_subdev_stream_configs *stream_configs;
> >  	unsigned int i;
> > @@ -1744,11 +1744,11 @@ v4l2_subdev_state_get_crop(struct v4l2_subdev_state *state, unsigned int pad,
> >  
> >  	return NULL;
> >  }
> > -EXPORT_SYMBOL_GPL(v4l2_subdev_state_get_crop);
> > +EXPORT_SYMBOL_GPL(__v4l2_subdev_state_get_crop_stream);
> >  
> >  struct v4l2_rect *
> > -v4l2_subdev_state_get_compose(struct v4l2_subdev_state *state, unsigned int pad,
> > -			      u32 stream)
> > +__v4l2_subdev_state_get_compose_stream(struct v4l2_subdev_state *state,
> > +				       unsigned int pad, u32 stream)
> >  {
> >  	struct v4l2_subdev_stream_configs *stream_configs;
> >  	unsigned int i;
> > @@ -1782,7 +1782,7 @@ v4l2_subdev_state_get_compose(struct v4l2_subdev_state *state, unsigned int pad,
> >  
> >  	return NULL;
> >  }
> > -EXPORT_SYMBOL_GPL(v4l2_subdev_state_get_compose);
> > +EXPORT_SYMBOL_GPL(__v4l2_subdev_state_get_compose_stream);
> >  
> >  int v4l2_subdev_routing_find_opposite_end(const struct v4l2_subdev_krouting *routing,
> >  					  u32 pad, u32 stream, u32 *other_pad,
> > diff --git a/include/media/v4l2-subdev.h b/include/media/v4l2-subdev.h
> > index 71cb35133b4a..ebb3373b431a 100644
> > --- a/include/media/v4l2-subdev.h
> > +++ b/include/media/v4l2-subdev.h
> > @@ -1545,7 +1545,7 @@ int v4l2_subdev_set_routing_with_fmt(struct v4l2_subdev *sd,
> >   * v4l2_subdev_state_get_format() - Get pointer to a stream format
> >   * @state: subdevice state
> >   * @pad: pad id
> > - * @stream: stream id
> > + * @...: stream id (optional argument)
> >   *
> >   * This returns a pointer to &struct v4l2_mbus_framefmt for the given pad +
> >   * stream in the subdev state.
> > @@ -1553,15 +1553,31 @@ int v4l2_subdev_set_routing_with_fmt(struct v4l2_subdev *sd,
> >   * For stream-unaware drivers the format for the corresponding pad is returned.
> >   * If the pad does not exist, NULL is returned.
> >   */
> > +/*
> > + * Wrap v4l2_subdev_state_get_format(), allowing the function to be called with
> > + * two or three arguments. The purpose of the __v4l2_subdev_state_get_format()
> > + * macro below is to come up with the name of the function or macro to call,
> > + * using the last two arguments (_stream and _pad). The selected function or
> > + * macro is then called using the arguments specified by the caller. A similar
> > + * arrangement is used for v4l2_subdev_state_crop() and
> > + * v4l2_subdev_state_compose() below.
> > + */
> > +#define v4l2_subdev_state_get_format(...)				\
> > +	__v4l2_subdev_state_get_format(__VA_ARGS__,			\
> > +				       _stream, _pad)(__VA_ARGS__)
> > +#define __v4l2_subdev_state_get_format(_1, _2, _3, ARG, ...)	\
> 
> How about renaming this macro to __v4l2_subdev_state_get_format_name ...
> 
> > +	__v4l2_subdev_state_get_format ## ARG
> > +#define __v4l2_subdev_state_get_format_pad(state, pad)		\
> > +	__v4l2_subdev_state_get_format_stream(state, pad, 0)
> >  struct v4l2_mbus_framefmt *
> > -v4l2_subdev_state_get_format(struct v4l2_subdev_state *state, unsigned int pad,
> > -			     u32 stream);
> > +__v4l2_subdev_state_get_format_stream(struct v4l2_subdev_state *state,
> > +				      unsigned int pad, u32 stream);
> 
> ... and this function to __v4l2_subdev_state_get_format() ? That way the
> macro used by drivers and the backend function will have the same name,
> with a __ prefix for the function. I think it would be a bit cleaner.
> Same below.
> 
> But now that I've written that, I realize you would need an additional
> __v4l2_subdev_state_get_format_stream() macro. I'll let you decide if
> you think that's cleaner or not.
> 
> 
> You could also take it one step forward, and avoid three copies of the
> same name selection macro:
> 
> #define __v4l2_subdev_state_get_macro(name, _1, _2, _3, ARG, ...)	\
> 	__v4l2_subdev_state_get_ ## name ## ARG
> 
> #define v4l2_subdev_state_get_format(...)				\
> 	__v4l2_subdev_state_get_macro(format, __VA_ARGS__,		\
> 				      _stream, _pad)(__VA_ARGS__)

This seems like a good idea. How about calling it
__v4l2_subdev_state_gen_call()? It better describes what it does I think.

> #define __v4l2_subdev_state_get_format_pad(state, pad)			\
> 	__v4l2_subdev_state_get_format(state, pad, 0)
> #define __v4l2_subdev_state_get_format_stream(state, pad, stream)	\
> 	__v4l2_subdev_state_get_format(state, pad, stream)

This one isn't needed.

> 
> struct v4l2_mbus_framefmt *
> __v4l2_subdev_state_get_format(struct v4l2_subdev_state *state,
> 			       unsigned int pad, u32 stream);
> 
> This can be done regardless of whether or not we want to drop the
> _stream suffix from the backend functions.
> 
> >  
> >  /**
> >   * v4l2_subdev_state_get_crop() - Get pointer to a stream crop rectangle
> >   * @state: subdevice state
> >   * @pad: pad id
> > - * @stream: stream id
> > + * @...: stream id (optional argument)
> >   *
> >   * This returns a pointer to crop rectangle for the given pad + stream in the
> >   * subdev state.
> > @@ -1569,15 +1585,22 @@ v4l2_subdev_state_get_format(struct v4l2_subdev_state *state, unsigned int pad,
> >   * For stream-unaware drivers the crop rectangle for the corresponding pad is
> >   * returned. If the pad does not exist, NULL is returned.
> >   */
> > +#define v4l2_subdev_state_get_crop(...)					\
> > +	__v4l2_subdev_state_get_crop(__VA_ARGS__,			\
> > +				     _stream, _pad)(__VA_ARGS__)
> > +#define __v4l2_subdev_state_get_crop(_1, _2, _3, ARG, ...)	\
> > +	__v4l2_subdev_state_get_crop ## ARG
> > +#define __v4l2_subdev_state_get_crop_pad(state, pad)		\
> > +	__v4l2_subdev_state_get_crop_stream(state, pad, 0)
> >  struct v4l2_rect *
> > -v4l2_subdev_state_get_crop(struct v4l2_subdev_state *state, unsigned int pad,
> > -			   u32 stream);
> > +__v4l2_subdev_state_get_crop_stream(struct v4l2_subdev_state *state,
> > +				    unsigned int pad, u32 stream);
> >  
> >  /**
> >   * v4l2_subdev_state_get_compose() - Get pointer to a stream compose rectangle
> >   * @state: subdevice state
> >   * @pad: pad id
> > - * @stream: stream id
> > + * @...: stream id (optional argument)
> >   *
> >   * This returns a pointer to compose rectangle for the given pad + stream in the
> >   * subdev state.
> > @@ -1585,9 +1608,16 @@ v4l2_subdev_state_get_crop(struct v4l2_subdev_state *state, unsigned int pad,
> >   * For stream-unaware drivers the compose rectangle for the corresponding pad is
> >   * returned. If the pad does not exist, NULL is returned.
> >   */
> > +#define v4l2_subdev_state_get_compose(...)				\
> > +	__v4l2_subdev_state_get_compose(__VA_ARGS__,		\
> > +					_stream, _pad)(__VA_ARGS__)
> > +#define __v4l2_subdev_state_get_compose(_1, _2, _3, ARG, ...)	\
> > +	__v4l2_subdev_state_get_compose ## ARG
> > +#define __v4l2_subdev_state_get_compose_pad(state, pad)		\
> > +	__v4l2_subdev_state_get_compose_stream(state, pad, 0)
> >  struct v4l2_rect *
> > -v4l2_subdev_state_get_compose(struct v4l2_subdev_state *state, unsigned int pad,
> > -			      u32 stream);
> > +__v4l2_subdev_state_get_compose_stream(struct v4l2_subdev_state *state,
> > +				       unsigned int pad, u32 stream);
> >  
> >  /**
> >   * v4l2_subdev_routing_find_opposite_end() - Find the opposite stream

-- 
Regards,

Sakari Ailus
