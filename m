Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CEA457D936D
	for <lists+linux-media@lfdr.de>; Fri, 27 Oct 2023 11:21:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345352AbjJ0JVR (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 27 Oct 2023 05:21:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45580 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229503AbjJ0JVP (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 27 Oct 2023 05:21:15 -0400
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9C13FC0
        for <linux-media@vger.kernel.org>; Fri, 27 Oct 2023 02:21:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1698398473; x=1729934473;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=5udXrmEZGq83GdIwZMqwkdMm58RFzCxmWE3e1RZI5vY=;
  b=JurCoA60eyX7E4lzG2h+zbBS5kKXrfeXisA0Jltb4MNa9RpKr8SX9GE8
   E0FTIQyyfvxfKLJnkW5Xa+AjKnSNKFNcadmUM+B5CQqxRy3vrblFOcj+B
   1QwVLoX/kwmSh21DA67K2mL1C/MlGefFJguNBUZnn3qgYNIe55KrFrq5b
   o/3VUDppH0IM5Gk4mbI2L9/4DZ1qxYJJovdrQ5fWR9bRVZDbiVCA1e4Qa
   Cmhmz3ngXI+pBCGYxXTcCPYc1RNKXZB0PJax5mA6jz7VW9wFGLSWeCb3e
   Q4lj6mCVCuVjlCubZ8GNeNP0+p/c7DYMDPkpqg3Ai/QBvdBQ6l2oYgks3
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10875"; a="384948653"
X-IronPort-AV: E=Sophos;i="6.03,255,1694761200"; 
   d="scan'208";a="384948653"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Oct 2023 02:21:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10875"; a="933016739"
X-IronPort-AV: E=Sophos;i="6.03,255,1694761200"; 
   d="scan'208";a="933016739"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Oct 2023 02:21:10 -0700
Received: from kekkonen.localdomain (localhost [127.0.0.1])
        by kekkonen.fi.intel.com (Postfix) with SMTP id D3E2111F82E;
        Fri, 27 Oct 2023 12:21:07 +0300 (EEST)
Date:   Fri, 27 Oct 2023 09:21:07 +0000
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     linux-media@vger.kernel.org, hverkuil@xs4all.nl,
        tomi.valkeinen@ideasonboard.com, jacopo.mondi@ideasonboard.com,
        bingbu.cao@intel.com, hongju.wang@intel.com,
        Alain Volmat <alain.volmat@foss.st.com>
Subject: Re: [PATCH v4 5/9] media: v4l: subdev: Make stream argument optional
 in state access functions
Message-ID: <ZTuBA6OGiycK9J4y@kekkonen.localdomain>
References: <20231026070329.948847-1-sakari.ailus@linux.intel.com>
 <20231026070329.948847-6-sakari.ailus@linux.intel.com>
 <20231026134904.GC26306@pendragon.ideasonboard.com>
 <ZTt9ifIH8uYf2fYF@kekkonen.localdomain>
 <20231027091013.GA9881@pendragon.ideasonboard.com>
 <ZTt-7tMQQVGGVGTi@kekkonen.localdomain>
 <20231027091427.GA10143@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231027091427.GA10143@pendragon.ideasonboard.com>
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Fri, Oct 27, 2023 at 12:14:27PM +0300, Laurent Pinchart wrote:
> On Fri, Oct 27, 2023 at 09:12:14AM +0000, Sakari Ailus wrote:
> > On Fri, Oct 27, 2023 at 12:10:13PM +0300, Laurent Pinchart wrote:
> > > > > > +/*
> > > > > > + * Wrap v4l2_subdev_state_get_format(), allowing the function to be called with
> > > > > > + * two or three arguments. The purpose of the __v4l2_subdev_state_get_format()
> > > > > > + * macro below is to come up with the name of the function or macro to call,
> > > > > > + * using the last two arguments (_stream and _pad). The selected function or
> > > > > > + * macro is then called using the arguments specified by the caller. A similar
> > > > > > + * arrangement is used for v4l2_subdev_state_crop() and
> > > > > > + * v4l2_subdev_state_compose() below.
> > > > > > + */
> > > > > > +#define v4l2_subdev_state_get_format(...)				\
> > > > > > +	__v4l2_subdev_state_get_format(__VA_ARGS__,			\
> > > > > > +				       _stream, _pad)(__VA_ARGS__)
> > > > > > +#define __v4l2_subdev_state_get_format(_1, _2, _3, ARG, ...)	\
> > > > > 
> > > > > How about renaming this macro to __v4l2_subdev_state_get_format_name ...
> > > > > 
> > > > > > +	__v4l2_subdev_state_get_format ## ARG
> > > > > > +#define __v4l2_subdev_state_get_format_pad(state, pad)		\
> > > > > > +	__v4l2_subdev_state_get_format_stream(state, pad, 0)
> > > > > >  struct v4l2_mbus_framefmt *
> > > > > > -v4l2_subdev_state_get_format(struct v4l2_subdev_state *state, unsigned int pad,
> > > > > > -			     u32 stream);
> > > > > > +__v4l2_subdev_state_get_format_stream(struct v4l2_subdev_state *state,
> > > > > > +				      unsigned int pad, u32 stream);
> > > > > 
> > > > > ... and this function to __v4l2_subdev_state_get_format() ? That way the
> > > > > macro used by drivers and the backend function will have the same name,
> > > > > with a __ prefix for the function. I think it would be a bit cleaner.
> > > > > Same below.
> > > > > 
> > > > > But now that I've written that, I realize you would need an additional
> > > > > __v4l2_subdev_state_get_format_stream() macro. I'll let you decide if
> > > > > you think that's cleaner or not.
> > > > > 
> > > > > 
> > > > > You could also take it one step forward, and avoid three copies of the
> > > > > same name selection macro:
> > > > > 
> > > > > #define __v4l2_subdev_state_get_macro(name, _1, _2, _3, ARG, ...)	\
> > > > > 	__v4l2_subdev_state_get_ ## name ## ARG
> > > > > 
> > > > > #define v4l2_subdev_state_get_format(...)				\
> > > > > 	__v4l2_subdev_state_get_macro(format, __VA_ARGS__,		\
> > > > > 				      _stream, _pad)(__VA_ARGS__)
> > > > 
> > > > This seems like a good idea. How about calling it
> > > > __v4l2_subdev_state_gen_call()? It better describes what it does I think.
> > > 
> > > Works for me. It's internal anyway.
> > > 
> > > > > #define __v4l2_subdev_state_get_format_pad(state, pad)			\
> > > > > 	__v4l2_subdev_state_get_format(state, pad, 0)
> > > > > #define __v4l2_subdev_state_get_format_stream(state, pad, stream)	\
> > > > > 	__v4l2_subdev_state_get_format(state, pad, stream)
> > > > 
> > > > This one isn't needed.
> > > 
> > > You could indeed drop it if you remove the _stream argument to the
> > > __v4l2_subdev_state_get_macro() macro above. I thought it would be nice
> > > to keep it though, to make it more explicit, but I don't mind much.
> > 
> > This is certainly up to interpretation but I generally prefer fewer
> > wrappers. :-)
> 
> Up to you.
> 
> > We can also make the function __v4l2_subdev_state_get_format() by just
> > removing "_stream" from the macro call --- empty arguments are allowed.
> 
> Yes, that's what I meant.

Great, I meant the same thing! ;-)

The result becomes thus:

/*
 * A macro to generate the macro or function name for sub-devices state access
 * wrapper macros below.
 */
#define __v4l2_subdev_state_gen_call(NAME, _1, _2, _3, ARG, ...)	\
	__v4l2_subdev_state_get_ ## NAME ## ARG

...

#define v4l2_subdev_state_get_format(...)				\
	__v4l2_subdev_state_gen_call(format, __VA_ARGS__, , _pad)(__VA_ARGS__)
#define __v4l2_subdev_state_get_format_pad(state, pad)		\
	__v4l2_subdev_state_get_format(state, pad, 0)
struct v4l2_mbus_framefmt *
__v4l2_subdev_state_get_format(struct v4l2_subdev_state *state,
			       unsigned int pad, u32 stream);

Etc. I quite like it actually, compared how it was in the beginning.

-- 
Sakari Ailus
