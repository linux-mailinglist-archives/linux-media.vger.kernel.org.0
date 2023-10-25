Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A751A7D69B9
	for <lists+linux-media@lfdr.de>; Wed, 25 Oct 2023 13:03:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232846AbjJYLDs (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 25 Oct 2023 07:03:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47234 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232695AbjJYLDr (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 25 Oct 2023 07:03:47 -0400
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6D011AC
        for <linux-media@vger.kernel.org>; Wed, 25 Oct 2023 04:03:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1698231825; x=1729767825;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Z+Tqa05I/dfoZsvdqI9YBnXLxOn84FvXYP9u6xZPNFE=;
  b=KdkP9GWHu+53/LxKZetnyJAq4D7Eybp1QiVPbLRDe6B67oOugbplaptX
   nc4Cv6b6/j7YXMar00/J+D8FeX3+oIEjFqnXCc9SSlcfNnphXOUw+rN/e
   JpNHtYI3VtWRU01vwo79pfeTNVmnA6LDecMaEv57i5P7ucO1PDtrwNua0
   UhPpGJ265CIzmkmSydIAkMkIVuTVbmdhjek/N7bD6h5Sp1xHTs7wIi2Od
   LwwtoVFe9zW1WYCdPaxl+t/Q9fCvtwS1QxXGHln0nmpQu9OPZNFDBYFJZ
   VhpYP9euwbZzqCJXeilVl4PcD1MOLYbgZOmdX9cSNo4jpzxx7kOv+lgT6
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10873"; a="451509375"
X-IronPort-AV: E=Sophos;i="6.03,250,1694761200"; 
   d="scan'208";a="451509375"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Oct 2023 04:03:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10873"; a="882416604"
X-IronPort-AV: E=Sophos;i="6.03,250,1694761200"; 
   d="scan'208";a="882416604"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Oct 2023 04:03:42 -0700
Received: from kekkonen.localdomain (localhost [127.0.0.1])
        by kekkonen.fi.intel.com (Postfix) with SMTP id 35C8211F82E;
        Wed, 25 Oct 2023 14:03:39 +0300 (EEST)
Date:   Wed, 25 Oct 2023 11:03:39 +0000
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Hans Verkuil <hverkuil@xs4all.nl>, linux-media@vger.kernel.org,
        tomi.valkeinen@ideasonboard.com, jacopo.mondi@ideasonboard.com,
        bingbu.cao@intel.com, hongju.wang@intel.com
Subject: Re: [PATCH v3 5/8] media: v4l: subdev: Make stream argument optional
 in state access functions
Message-ID: <ZTj2CwZGbqlc_hfW@kekkonen.localdomain>
References: <20231023174408.803874-1-sakari.ailus@linux.intel.com>
 <20231023174408.803874-6-sakari.ailus@linux.intel.com>
 <95c4ed4d-36e5-44f7-8609-dfdb7847b0e8@xs4all.nl>
 <ZTjro-bLwouKcJ4c@kekkonen.localdomain>
 <20231025105055.GC481@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231025105055.GC481@pendragon.ideasonboard.com>
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Laurent,

On Wed, Oct 25, 2023 at 01:50:55PM +0300, Laurent Pinchart wrote:
> Hi Sakari,
> 
> On Wed, Oct 25, 2023 at 10:19:15AM +0000, Sakari Ailus wrote:
> > On Wed, Oct 25, 2023 at 11:53:35AM +0200, Hans Verkuil wrote:
> > > On 23/10/2023 19:44, Sakari Ailus wrote:
> > > > The sub-device state access functions take three arguments: sub-device
> > > > state, pad and stream. The stream is not relevant for the majority of
> > > > drivers and having to specify 0 for the stream is considered a nuisance.
> > > > 
> > > > Provide a two-argument macros for these state access functions to cover
> > > > the needs of stream-unaware users.
> > > > 
> > > > Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> > > > ---
> > > >  drivers/media/v4l2-core/v4l2-subdev.c | 18 ++++++-------
> > > >  include/media/v4l2-subdev.h           | 39 ++++++++++++++++++++-------
> > > >  2 files changed, 39 insertions(+), 18 deletions(-)
> > > > 
> > > > diff --git a/drivers/media/v4l2-core/v4l2-subdev.c b/drivers/media/v4l2-core/v4l2-subdev.c
> > > > index f0f0af48730f..e35226587244 100644
> > > > --- a/drivers/media/v4l2-core/v4l2-subdev.c
> > > > +++ b/drivers/media/v4l2-core/v4l2-subdev.c
> > > > @@ -1671,8 +1671,8 @@ int v4l2_subdev_set_routing_with_fmt(struct v4l2_subdev *sd,
> > > >  EXPORT_SYMBOL_GPL(v4l2_subdev_set_routing_with_fmt);
> > > >  
> > > >  struct v4l2_mbus_framefmt *
> > > > -v4l2_subdev_state_get_format(struct v4l2_subdev_state *state, unsigned int pad,
> > > > -			     u32 stream)
> > > > +__v4l2_subdev_state_get_format(struct v4l2_subdev_state *state,
> > > > +			       unsigned int pad, u32 stream)
> > > >  {
> > > >  	struct v4l2_subdev_stream_configs *stream_configs;
> > > >  	unsigned int i;
> > > > @@ -1702,11 +1702,11 @@ v4l2_subdev_state_get_format(struct v4l2_subdev_state *state, unsigned int pad,
> > > >  
> > > >  	return NULL;
> > > >  }
> > > > -EXPORT_SYMBOL_GPL(v4l2_subdev_state_get_format);
> > > > +EXPORT_SYMBOL_GPL(__v4l2_subdev_state_get_format);
> > > >  
> > > >  struct v4l2_rect *
> > > > -v4l2_subdev_state_get_crop(struct v4l2_subdev_state *state, unsigned int pad,
> > > > -			   u32 stream)
> > > > +__v4l2_subdev_state_get_crop(struct v4l2_subdev_state *state, unsigned int pad,
> > > > +			     u32 stream)
> > > >  {
> > > >  	struct v4l2_subdev_stream_configs *stream_configs;
> > > >  	unsigned int i;
> > > > @@ -1736,11 +1736,11 @@ v4l2_subdev_state_get_crop(struct v4l2_subdev_state *state, unsigned int pad,
> > > >  
> > > >  	return NULL;
> > > >  }
> > > > -EXPORT_SYMBOL_GPL(v4l2_subdev_state_get_crop);
> > > > +EXPORT_SYMBOL_GPL(__v4l2_subdev_state_get_crop);
> > > >  
> > > >  struct v4l2_rect *
> > > > -v4l2_subdev_state_get_compose(struct v4l2_subdev_state *state, unsigned int pad,
> > > > -			      u32 stream)
> > > > +__v4l2_subdev_state_get_compose(struct v4l2_subdev_state *state,
> > > > +				unsigned int pad, u32 stream)
> > > >  {
> > > >  	struct v4l2_subdev_stream_configs *stream_configs;
> > > >  	unsigned int i;
> > > > @@ -1770,7 +1770,7 @@ v4l2_subdev_state_get_compose(struct v4l2_subdev_state *state, unsigned int pad,
> > > >  
> > > >  	return NULL;
> > > >  }
> > > > -EXPORT_SYMBOL_GPL(v4l2_subdev_state_get_compose);
> > > > +EXPORT_SYMBOL_GPL(__v4l2_subdev_state_get_compose);
> > > >  
> > > >  int v4l2_subdev_routing_find_opposite_end(const struct v4l2_subdev_krouting *routing,
> > > >  					  u32 pad, u32 stream, u32 *other_pad,
> > > > diff --git a/include/media/v4l2-subdev.h b/include/media/v4l2-subdev.h
> > > > index 71cb35133b4a..12eb0fe746d7 100644
> > > > --- a/include/media/v4l2-subdev.h
> > > > +++ b/include/media/v4l2-subdev.h
> > > > @@ -1545,7 +1545,7 @@ int v4l2_subdev_set_routing_with_fmt(struct v4l2_subdev *sd,
> > > >   * v4l2_subdev_state_get_format() - Get pointer to a stream format
> > > >   * @state: subdevice state
> > > >   * @pad: pad id
> > > > - * @stream: stream id
> > > > + * @...: stream id (optional argument)
> > > >   *
> > > >   * This returns a pointer to &struct v4l2_mbus_framefmt for the given pad +
> > > >   * stream in the subdev state.
> > > > @@ -1553,15 +1553,22 @@ int v4l2_subdev_set_routing_with_fmt(struct v4l2_subdev *sd,
> > > >   * For stream-unaware drivers the format for the corresponding pad is returned.
> > > >   * If the pad does not exist, NULL is returned.
> > > >   */
> > > > +#define v4l2_subdev_state_get_format(state, pad, ...)         \
> > > > +        __v4l2_subdev_state_get_format_ ## __VA_OPT__(stream) \
> > > > +        (state, pad __VA_OPT__(,) __VA_ARGS__)
> > > > +#define __v4l2_subdev_state_get_format_(state, pad)     \
> > > > +        __v4l2_subdev_state_get_format(state, pad, 0)
> > > > +#define __v4l2_subdev_state_get_format_stream(state, pad, stream)	\
> > > > +        __v4l2_subdev_state_get_format(state, pad, stream)
> > > 
> > > Hmm, 'git grep __VA_OPT__' finds no use of this in the kernel. Are you sure this
> > > is safe to use? Does clang support it? Do all gcc versions that the kernel support
> > > implement it?
> > > 
> > > A 10+ for creativity, but I'm a bit concerned about it.
> > 
> > :-)
> > 
> > I noticed the problem, too, as the lkp bot failed compiling this on GCC
> > 7.5. Indeed only GCC 8 supports __VA_OPT__ but the oldest GCC version
> > supported for kernel compilation is 7.1. So __VA_OPT__ isn't... an option.
> > 
> > I thought this could be done using variable arguments, making most error
> > handling take place at runtime (for GCC versions not supporting
> > __VA_OPT__), but then Laurent figured this can be done with just
> > __VA_ARGS__ which is part of C99.
> > 
> > The code would look like this, which is only slightly less understandable
> > than with __VA_OPT__:
> > 
> > #define v4l2_subdev_state_get_format(...)				\
> > 	__v4l2_subdev_state_get_format_var(__VA_ARGS__, , _2)(__VA_ARGS__)
> 
> How about
> 
>  	__v4l2_subdev_state_get_format_var(__VA_ARGS__, _stream, _pad)(__VA_ARGS__)
> 
> ? The internal macro and function names would then be more explicit.

Works for me.

I'll also rename __v4l2_subdev_state_get_format_var, removing _var.

> 
> > #define __v4l2_subdev_state_get_format_var(_1, _2, _3, NUM, ...)	\
> > 	__v4l2_subdev_state_get_format ## NUM
> > #define __v4l2_subdev_state_get_format_2(state, pad) \
> > 	__v4l2_subdev_state_get_format(state, pad, 0)
> > struct v4l2_mbus_framefmt *
> > __v4l2_subdev_state_get_format(struct v4l2_subdev_state *state,
> > 			       unsigned int pad, u32 stream);
> > 
> > > And if there are only a few drivers that need to give a specific stream,
> > > wouldn't it be easier to just have a v4l2_subdev_state_get_format_stream
> > > function and a static inline v4l2_subdev_state_get_format() that just calls
> > > the _stream version with 0?
> > 
> > I'm trying to shorten function names here: they're overly long. Also I'd
> > like to see a single set of API functions to access sub-device state
> > information irrespective of how it is stored. I originally proposed just
> > specifying stream zero but both Laurent and Tomi opined against it.
> 

-- 
Regards,

Sakari Ailus
