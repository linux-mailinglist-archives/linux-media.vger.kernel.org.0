Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 72A3F7D9337
	for <lists+linux-media@lfdr.de>; Fri, 27 Oct 2023 11:12:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231305AbjJ0JMh (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 27 Oct 2023 05:12:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53438 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229636AbjJ0JMg (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 27 Oct 2023 05:12:36 -0400
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7591193
        for <linux-media@vger.kernel.org>; Fri, 27 Oct 2023 02:12:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1698397954; x=1729933954;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=dRMu13u8iKo/2V5phKHuqOUxNcOO3yaybMDT3oFXkJg=;
  b=FQz9BDk60OMPGO7li79QMVuTFEUonEHoGNz22IgsfAq0UR3NiDf9yCsr
   709OKrPDc9qEZ74LFW8Q1jJIq066BJgjFDJ4H4JUQIHOLlzeubHe/jx08
   sQR0TjlwU3bFsuP/Pr+/p6FLAJVB0y2C1i8TOGtzDRiyIh8oyL/St57FU
   +mism+tNOulFwfSgh0J2DwiSaKvqD6EE8Opm4wYVAyMNMcEhVDTHpStLW
   NZgYVu65MVa6UnKx6jVpfd9v8vwWY8GHqq6cOdDmMN1H4gfLSmjxA8dnl
   Z/Au7C7PzZZiwQ0xSaNC1rFgKe3p+8ZSsZiG/NU3yCLTEcMP1ArcPiAqJ
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10875"; a="367949452"
X-IronPort-AV: E=Sophos;i="6.03,255,1694761200"; 
   d="scan'208";a="367949452"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Oct 2023 02:12:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10875"; a="903212249"
X-IronPort-AV: E=Sophos;i="6.03,255,1694761200"; 
   d="scan'208";a="903212249"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Oct 2023 02:09:49 -0700
Received: from kekkonen.localdomain (localhost [127.0.0.1])
        by kekkonen.fi.intel.com (Postfix) with SMTP id 51F7811F82E;
        Fri, 27 Oct 2023 12:12:14 +0300 (EEST)
Date:   Fri, 27 Oct 2023 09:12:14 +0000
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     linux-media@vger.kernel.org, hverkuil@xs4all.nl,
        tomi.valkeinen@ideasonboard.com, jacopo.mondi@ideasonboard.com,
        bingbu.cao@intel.com, hongju.wang@intel.com,
        Alain Volmat <alain.volmat@foss.st.com>
Subject: Re: [PATCH v4 5/9] media: v4l: subdev: Make stream argument optional
 in state access functions
Message-ID: <ZTt-7tMQQVGGVGTi@kekkonen.localdomain>
References: <20231026070329.948847-1-sakari.ailus@linux.intel.com>
 <20231026070329.948847-6-sakari.ailus@linux.intel.com>
 <20231026134904.GC26306@pendragon.ideasonboard.com>
 <ZTt9ifIH8uYf2fYF@kekkonen.localdomain>
 <20231027091013.GA9881@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231027091013.GA9881@pendragon.ideasonboard.com>
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Fri, Oct 27, 2023 at 12:10:13PM +0300, Laurent Pinchart wrote:
> > > > +/*
> > > > + * Wrap v4l2_subdev_state_get_format(), allowing the function to be called with
> > > > + * two or three arguments. The purpose of the __v4l2_subdev_state_get_format()
> > > > + * macro below is to come up with the name of the function or macro to call,
> > > > + * using the last two arguments (_stream and _pad). The selected function or
> > > > + * macro is then called using the arguments specified by the caller. A similar
> > > > + * arrangement is used for v4l2_subdev_state_crop() and
> > > > + * v4l2_subdev_state_compose() below.
> > > > + */
> > > > +#define v4l2_subdev_state_get_format(...)				\
> > > > +	__v4l2_subdev_state_get_format(__VA_ARGS__,			\
> > > > +				       _stream, _pad)(__VA_ARGS__)
> > > > +#define __v4l2_subdev_state_get_format(_1, _2, _3, ARG, ...)	\
> > > 
> > > How about renaming this macro to __v4l2_subdev_state_get_format_name ...
> > > 
> > > > +	__v4l2_subdev_state_get_format ## ARG
> > > > +#define __v4l2_subdev_state_get_format_pad(state, pad)		\
> > > > +	__v4l2_subdev_state_get_format_stream(state, pad, 0)
> > > >  struct v4l2_mbus_framefmt *
> > > > -v4l2_subdev_state_get_format(struct v4l2_subdev_state *state, unsigned int pad,
> > > > -			     u32 stream);
> > > > +__v4l2_subdev_state_get_format_stream(struct v4l2_subdev_state *state,
> > > > +				      unsigned int pad, u32 stream);
> > > 
> > > ... and this function to __v4l2_subdev_state_get_format() ? That way the
> > > macro used by drivers and the backend function will have the same name,
> > > with a __ prefix for the function. I think it would be a bit cleaner.
> > > Same below.
> > > 
> > > But now that I've written that, I realize you would need an additional
> > > __v4l2_subdev_state_get_format_stream() macro. I'll let you decide if
> > > you think that's cleaner or not.
> > > 
> > > 
> > > You could also take it one step forward, and avoid three copies of the
> > > same name selection macro:
> > > 
> > > #define __v4l2_subdev_state_get_macro(name, _1, _2, _3, ARG, ...)	\
> > > 	__v4l2_subdev_state_get_ ## name ## ARG
> > > 
> > > #define v4l2_subdev_state_get_format(...)				\
> > > 	__v4l2_subdev_state_get_macro(format, __VA_ARGS__,		\
> > > 				      _stream, _pad)(__VA_ARGS__)
> > 
> > This seems like a good idea. How about calling it
> > __v4l2_subdev_state_gen_call()? It better describes what it does I think.
> 
> Works for me. It's internal anyway.
> 
> > > #define __v4l2_subdev_state_get_format_pad(state, pad)			\
> > > 	__v4l2_subdev_state_get_format(state, pad, 0)
> > > #define __v4l2_subdev_state_get_format_stream(state, pad, stream)	\
> > > 	__v4l2_subdev_state_get_format(state, pad, stream)
> > 
> > This one isn't needed.
> 
> You could indeed drop it if you remove the _stream argument to the
> __v4l2_subdev_state_get_macro() macro above. I thought it would be nice
> to keep it though, to make it more explicit, but I don't mind much.

This is certainly up to interpretation but I generally prefer fewer
wrappers. :-)

We can also make the function __v4l2_subdev_state_get_format() by just
removing "_stream" from the macro call --- empty arguments are allowed.

-- 
Sakari Ailus
