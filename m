Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 70C1F7D9341
	for <lists+linux-media@lfdr.de>; Fri, 27 Oct 2023 11:14:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231305AbjJ0JOZ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 27 Oct 2023 05:14:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39990 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229636AbjJ0JOZ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 27 Oct 2023 05:14:25 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CE99293
        for <linux-media@vger.kernel.org>; Fri, 27 Oct 2023 02:14:22 -0700 (PDT)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 0B7B774A;
        Fri, 27 Oct 2023 11:14:07 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1698398048;
        bh=S7k43NG9M7uaJ3EG/freUaNkIBdiAFQR9lKjV15qFVA=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=BPDiM8GxVUpkYhqiNz+Tt/FyqzX3Zb5/WH7//f+dc9VQs378Z1GxzAgeMjRFQkXZN
         MUQcup+9aPl1+PLGvgYc8k9WOhJb40XGTHT31afvH0EoqBQxraN0wB/6FUTWVXLVwN
         uP1CSkKA7Lsa90QbwhPZ4weoG4NmSkI6L+mYWhtw=
Date:   Fri, 27 Oct 2023 12:14:27 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     linux-media@vger.kernel.org, hverkuil@xs4all.nl,
        tomi.valkeinen@ideasonboard.com, jacopo.mondi@ideasonboard.com,
        bingbu.cao@intel.com, hongju.wang@intel.com,
        Alain Volmat <alain.volmat@foss.st.com>
Subject: Re: [PATCH v4 5/9] media: v4l: subdev: Make stream argument optional
 in state access functions
Message-ID: <20231027091427.GA10143@pendragon.ideasonboard.com>
References: <20231026070329.948847-1-sakari.ailus@linux.intel.com>
 <20231026070329.948847-6-sakari.ailus@linux.intel.com>
 <20231026134904.GC26306@pendragon.ideasonboard.com>
 <ZTt9ifIH8uYf2fYF@kekkonen.localdomain>
 <20231027091013.GA9881@pendragon.ideasonboard.com>
 <ZTt-7tMQQVGGVGTi@kekkonen.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <ZTt-7tMQQVGGVGTi@kekkonen.localdomain>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Fri, Oct 27, 2023 at 09:12:14AM +0000, Sakari Ailus wrote:
> On Fri, Oct 27, 2023 at 12:10:13PM +0300, Laurent Pinchart wrote:
> > > > > +/*
> > > > > + * Wrap v4l2_subdev_state_get_format(), allowing the function to be called with
> > > > > + * two or three arguments. The purpose of the __v4l2_subdev_state_get_format()
> > > > > + * macro below is to come up with the name of the function or macro to call,
> > > > > + * using the last two arguments (_stream and _pad). The selected function or
> > > > > + * macro is then called using the arguments specified by the caller. A similar
> > > > > + * arrangement is used for v4l2_subdev_state_crop() and
> > > > > + * v4l2_subdev_state_compose() below.
> > > > > + */
> > > > > +#define v4l2_subdev_state_get_format(...)				\
> > > > > +	__v4l2_subdev_state_get_format(__VA_ARGS__,			\
> > > > > +				       _stream, _pad)(__VA_ARGS__)
> > > > > +#define __v4l2_subdev_state_get_format(_1, _2, _3, ARG, ...)	\
> > > > 
> > > > How about renaming this macro to __v4l2_subdev_state_get_format_name ...
> > > > 
> > > > > +	__v4l2_subdev_state_get_format ## ARG
> > > > > +#define __v4l2_subdev_state_get_format_pad(state, pad)		\
> > > > > +	__v4l2_subdev_state_get_format_stream(state, pad, 0)
> > > > >  struct v4l2_mbus_framefmt *
> > > > > -v4l2_subdev_state_get_format(struct v4l2_subdev_state *state, unsigned int pad,
> > > > > -			     u32 stream);
> > > > > +__v4l2_subdev_state_get_format_stream(struct v4l2_subdev_state *state,
> > > > > +				      unsigned int pad, u32 stream);
> > > > 
> > > > ... and this function to __v4l2_subdev_state_get_format() ? That way the
> > > > macro used by drivers and the backend function will have the same name,
> > > > with a __ prefix for the function. I think it would be a bit cleaner.
> > > > Same below.
> > > > 
> > > > But now that I've written that, I realize you would need an additional
> > > > __v4l2_subdev_state_get_format_stream() macro. I'll let you decide if
> > > > you think that's cleaner or not.
> > > > 
> > > > 
> > > > You could also take it one step forward, and avoid three copies of the
> > > > same name selection macro:
> > > > 
> > > > #define __v4l2_subdev_state_get_macro(name, _1, _2, _3, ARG, ...)	\
> > > > 	__v4l2_subdev_state_get_ ## name ## ARG
> > > > 
> > > > #define v4l2_subdev_state_get_format(...)				\
> > > > 	__v4l2_subdev_state_get_macro(format, __VA_ARGS__,		\
> > > > 				      _stream, _pad)(__VA_ARGS__)
> > > 
> > > This seems like a good idea. How about calling it
> > > __v4l2_subdev_state_gen_call()? It better describes what it does I think.
> > 
> > Works for me. It's internal anyway.
> > 
> > > > #define __v4l2_subdev_state_get_format_pad(state, pad)			\
> > > > 	__v4l2_subdev_state_get_format(state, pad, 0)
> > > > #define __v4l2_subdev_state_get_format_stream(state, pad, stream)	\
> > > > 	__v4l2_subdev_state_get_format(state, pad, stream)
> > > 
> > > This one isn't needed.
> > 
> > You could indeed drop it if you remove the _stream argument to the
> > __v4l2_subdev_state_get_macro() macro above. I thought it would be nice
> > to keep it though, to make it more explicit, but I don't mind much.
> 
> This is certainly up to interpretation but I generally prefer fewer
> wrappers. :-)

Up to you.

> We can also make the function __v4l2_subdev_state_get_format() by just
> removing "_stream" from the macro call --- empty arguments are allowed.

Yes, that's what I meant.

-- 
Regards,

Laurent Pinchart
