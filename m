Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0859B7D6A2C
	for <lists+linux-media@lfdr.de>; Wed, 25 Oct 2023 13:30:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234811AbjJYLaV (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 25 Oct 2023 07:30:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50554 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234598AbjJYLaU (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 25 Oct 2023 07:30:20 -0400
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 827C2137
        for <linux-media@vger.kernel.org>; Wed, 25 Oct 2023 04:30:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1698233417; x=1729769417;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=8AVpQX2zYcTFn/VYwRzSHiO/2R9pyE4ODgtvjDIWiRs=;
  b=M7mo+P5UQNVShMDObsBk6Ik/TqfIbPyyVpInkIgy9FplO8SAtpIhc65/
   Z+FXcWhpMl1Z5/9A0UKfvfveKdjfEubSbDhQZDlU6HBTjzCqtzHrKAB4R
   wy9Ulap+KM90l/G5mkVdi/7DTZSYNdeziMxKYl0kbBVGro7dKXa/0M1OD
   7kKPxgEPJ+qH9ZTNQ1oW8vmQ4qh0nPKR2NMyhwdGeUw2H4E/UHlwrELUB
   xS/bw5VzsJLnV0CIIgpuE2986n4qLTCqjUL3ojS7TCO3gfF8dikkBvRft
   iFTppthdbicf5fxJ9lykOosZQhK1JahUFlWLuPnVE+soDxIeCDrhCTQiZ
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10873"; a="386171376"
X-IronPort-AV: E=Sophos;i="6.03,250,1694761200"; 
   d="scan'208";a="386171376"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Oct 2023 04:30:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10873"; a="1005985510"
X-IronPort-AV: E=Sophos;i="6.03,250,1694761200"; 
   d="scan'208";a="1005985510"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Oct 2023 04:30:15 -0700
Received: from kekkonen.localdomain (localhost [127.0.0.1])
        by kekkonen.fi.intel.com (Postfix) with SMTP id 3602E11F82E;
        Wed, 25 Oct 2023 14:30:12 +0300 (EEST)
Date:   Wed, 25 Oct 2023 11:30:12 +0000
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Hans Verkuil <hverkuil@xs4all.nl>
Cc:     linux-media@vger.kernel.org, laurent.pinchart@ideasonboard.com,
        tomi.valkeinen@ideasonboard.com, jacopo.mondi@ideasonboard.com,
        bingbu.cao@intel.com, hongju.wang@intel.com
Subject: Re: [PATCH v3 5/8] media: v4l: subdev: Make stream argument optional
 in state access functions
Message-ID: <ZTj8RMO3MhqYx4l8@kekkonen.localdomain>
References: <20231023174408.803874-1-sakari.ailus@linux.intel.com>
 <20231023174408.803874-6-sakari.ailus@linux.intel.com>
 <95c4ed4d-36e5-44f7-8609-dfdb7847b0e8@xs4all.nl>
 <ZTjro-bLwouKcJ4c@kekkonen.localdomain>
 <d2b6e069-e917-4c6d-a377-3722973763de@xs4all.nl>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d2b6e069-e917-4c6d-a377-3722973763de@xs4all.nl>
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Hans,

On Wed, Oct 25, 2023 at 01:20:29PM +0200, Hans Verkuil wrote:
> On 25/10/2023 12:19, Sakari Ailus wrote:
> > Hi Hans,
> > 
> > Thank you for the review.
> > 
> > On Wed, Oct 25, 2023 at 11:53:35AM +0200, Hans Verkuil wrote:
> >> On 23/10/2023 19:44, Sakari Ailus wrote:
> >>> The sub-device state access functions take three arguments: sub-device
> >>> state, pad and stream. The stream is not relevant for the majority of
> >>> drivers and having to specify 0 for the stream is considered a nuisance.
> >>>
> >>> Provide a two-argument macros for these state access functions to cover
> >>> the needs of stream-unaware users.
> >>>
> >>> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> >>> ---
> >>>  drivers/media/v4l2-core/v4l2-subdev.c | 18 ++++++-------
> >>>  include/media/v4l2-subdev.h           | 39 ++++++++++++++++++++-------
> >>>  2 files changed, 39 insertions(+), 18 deletions(-)
> >>>
> >>> diff --git a/drivers/media/v4l2-core/v4l2-subdev.c b/drivers/media/v4l2-core/v4l2-subdev.c
> >>> index f0f0af48730f..e35226587244 100644
> >>> --- a/drivers/media/v4l2-core/v4l2-subdev.c
> >>> +++ b/drivers/media/v4l2-core/v4l2-subdev.c
> >>> @@ -1671,8 +1671,8 @@ int v4l2_subdev_set_routing_with_fmt(struct v4l2_subdev *sd,
> >>>  EXPORT_SYMBOL_GPL(v4l2_subdev_set_routing_with_fmt);
> >>>  
> >>>  struct v4l2_mbus_framefmt *
> >>> -v4l2_subdev_state_get_format(struct v4l2_subdev_state *state, unsigned int pad,
> >>> -			     u32 stream)
> >>> +__v4l2_subdev_state_get_format(struct v4l2_subdev_state *state,
> >>> +			       unsigned int pad, u32 stream)
> >>>  {
> >>>  	struct v4l2_subdev_stream_configs *stream_configs;
> >>>  	unsigned int i;
> >>> @@ -1702,11 +1702,11 @@ v4l2_subdev_state_get_format(struct v4l2_subdev_state *state, unsigned int pad,
> >>>  
> >>>  	return NULL;
> >>>  }
> >>> -EXPORT_SYMBOL_GPL(v4l2_subdev_state_get_format);
> >>> +EXPORT_SYMBOL_GPL(__v4l2_subdev_state_get_format);
> >>>  
> >>>  struct v4l2_rect *
> >>> -v4l2_subdev_state_get_crop(struct v4l2_subdev_state *state, unsigned int pad,
> >>> -			   u32 stream)
> >>> +__v4l2_subdev_state_get_crop(struct v4l2_subdev_state *state, unsigned int pad,
> >>> +			     u32 stream)
> >>>  {
> >>>  	struct v4l2_subdev_stream_configs *stream_configs;
> >>>  	unsigned int i;
> >>> @@ -1736,11 +1736,11 @@ v4l2_subdev_state_get_crop(struct v4l2_subdev_state *state, unsigned int pad,
> >>>  
> >>>  	return NULL;
> >>>  }
> >>> -EXPORT_SYMBOL_GPL(v4l2_subdev_state_get_crop);
> >>> +EXPORT_SYMBOL_GPL(__v4l2_subdev_state_get_crop);
> >>>  
> >>>  struct v4l2_rect *
> >>> -v4l2_subdev_state_get_compose(struct v4l2_subdev_state *state, unsigned int pad,
> >>> -			      u32 stream)
> >>> +__v4l2_subdev_state_get_compose(struct v4l2_subdev_state *state,
> >>> +				unsigned int pad, u32 stream)
> >>>  {
> >>>  	struct v4l2_subdev_stream_configs *stream_configs;
> >>>  	unsigned int i;
> >>> @@ -1770,7 +1770,7 @@ v4l2_subdev_state_get_compose(struct v4l2_subdev_state *state, unsigned int pad,
> >>>  
> >>>  	return NULL;
> >>>  }
> >>> -EXPORT_SYMBOL_GPL(v4l2_subdev_state_get_compose);
> >>> +EXPORT_SYMBOL_GPL(__v4l2_subdev_state_get_compose);
> >>>  
> >>>  int v4l2_subdev_routing_find_opposite_end(const struct v4l2_subdev_krouting *routing,
> >>>  					  u32 pad, u32 stream, u32 *other_pad,
> >>> diff --git a/include/media/v4l2-subdev.h b/include/media/v4l2-subdev.h
> >>> index 71cb35133b4a..12eb0fe746d7 100644
> >>> --- a/include/media/v4l2-subdev.h
> >>> +++ b/include/media/v4l2-subdev.h
> >>> @@ -1545,7 +1545,7 @@ int v4l2_subdev_set_routing_with_fmt(struct v4l2_subdev *sd,
> >>>   * v4l2_subdev_state_get_format() - Get pointer to a stream format
> >>>   * @state: subdevice state
> >>>   * @pad: pad id
> >>> - * @stream: stream id
> >>> + * @...: stream id (optional argument)
> >>>   *
> >>>   * This returns a pointer to &struct v4l2_mbus_framefmt for the given pad +
> >>>   * stream in the subdev state.
> >>> @@ -1553,15 +1553,22 @@ int v4l2_subdev_set_routing_with_fmt(struct v4l2_subdev *sd,
> >>>   * For stream-unaware drivers the format for the corresponding pad is returned.
> >>>   * If the pad does not exist, NULL is returned.
> >>>   */
> >>> +#define v4l2_subdev_state_get_format(state, pad, ...)         \
> >>> +        __v4l2_subdev_state_get_format_ ## __VA_OPT__(stream) \
> >>> +        (state, pad __VA_OPT__(,) __VA_ARGS__)
> >>> +#define __v4l2_subdev_state_get_format_(state, pad)     \
> >>> +        __v4l2_subdev_state_get_format(state, pad, 0)
> >>> +#define __v4l2_subdev_state_get_format_stream(state, pad, stream)	\
> >>> +        __v4l2_subdev_state_get_format(state, pad, stream)
> >>
> >> Hmm, 'git grep __VA_OPT__' finds no use of this in the kernel. Are you sure this
> >> is safe to use? Does clang support it? Do all gcc versions that the kernel support
> >> implement it?
> >>
> >> A 10+ for creativity, but I'm a bit concerned about it.
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
> > #define __v4l2_subdev_state_get_format_var(_1, _2, _3, NUM, ...)	\
> > 	__v4l2_subdev_state_get_format ## NUM
> > #define __v4l2_subdev_state_get_format_2(state, pad) \
> > 	__v4l2_subdev_state_get_format(state, pad, 0)
> > struct v4l2_mbus_framefmt *
> > __v4l2_subdev_state_get_format(struct v4l2_subdev_state *state,
> > 			       unsigned int pad, u32 stream);
> 
> Wow! OK, I guess that will work.
> 
> A strongly suggest adding a comment before this explaining what you are
> trying to achieve. It's not exactly obvious :-)

I'll add:

/*
 * Wrap v4l2_subdev_state_get_format(), allowing the function to be called with
 * two or three arguments. The purpose of the __v4l2_subdev_state_get_format()
 * macro below is to come up with the name of the function or macro to call,
 * using the last two arguments (_stream and _pad). The selected function or
 * macro is then called using the arguments specified by the caller. A similar
 * arrangement is used for v4l2_subdev_state_crop() and
 * v4l2_subdev_state_compose() below.
 */

-- 
Sakari Ailus
