Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3FBA97D34CA
	for <lists+linux-media@lfdr.de>; Mon, 23 Oct 2023 13:42:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234357AbjJWLmz (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 23 Oct 2023 07:42:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34658 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234359AbjJWLmh (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 23 Oct 2023 07:42:37 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C6112172E
        for <linux-media@vger.kernel.org>; Mon, 23 Oct 2023 04:42:28 -0700 (PDT)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id D599C2B6;
        Mon, 23 Oct 2023 13:42:15 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1698061336;
        bh=pbEb72Jmkh6usZJtEH0cCplYRXiwNv1NsVs2f8Z/W8A=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=hqT3Eet/c3ic067RGQdqdh0ykG0m8K0lve4AAkD79h9+GowSi4JTHpNaS955vJCmq
         sIQ8bQlpzIQRb1nUWSbwIPyHPcF50nkfIX3EzmmxH+Tdt3C4Rzoi9V/bkgo1GHdQxY
         IHb3DWmispRThpYwUjN1ESA6hGic97KuYJbDuf84=
Date:   Mon, 23 Oct 2023 14:42:34 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     linux-media@vger.kernel.org, hverkuil@xs4all.nl,
        tomi.valkeinen@ideasonboard.com, jacopo.mondi@ideasonboard.com,
        bingbu.cao@intel.com, hongju.wang@intel.com
Subject: Re: [PATCH 2/6] media: v4l: subdev: Also return pads array
 information on stream functions
Message-ID: <20231023114234.GK3336@pendragon.ideasonboard.com>
References: <20231013104424.404768-1-sakari.ailus@linux.intel.com>
 <20231013104424.404768-3-sakari.ailus@linux.intel.com>
 <20231013110741.GD11101@pendragon.ideasonboard.com>
 <ZSkmPJdxlxeSzYeZ@kekkonen.localdomain>
 <20231016082452.GH23177@pendragon.ideasonboard.com>
 <ZSz7Y0lYrywH8/Jz@kekkonen.localdomain>
 <ZS0OuWiG7qHO21Xn@kekkonen.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <ZS0OuWiG7qHO21Xn@kekkonen.localdomain>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_PASS,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, Oct 16, 2023 at 10:21:45AM +0000, Sakari Ailus wrote:
> On Mon, Oct 16, 2023 at 08:59:15AM +0000, Sakari Ailus wrote:
> > On Mon, Oct 16, 2023 at 11:24:52AM +0300, Laurent Pinchart wrote:
> > > On Fri, Oct 13, 2023 at 11:13:00AM +0000, Sakari Ailus wrote:
> > > > On Fri, Oct 13, 2023 at 02:07:41PM +0300, Laurent Pinchart wrote:
> > > > > On Fri, Oct 13, 2023 at 01:44:20PM +0300, Sakari Ailus wrote:
> > > > > > There are two sets of functions that return information from sub-device
> > > > > > state, one for stream-unaware users and another for stream-aware users.
> > > > > > Add support for stream-aware functions to return format, crop and compose
> > > > > > information from pad-based array that are functionally equivalent to the
> > > > > > old, stream-unaware ones.
> > > > > > 
> > > > > > Also check state is non-NULL, in order to guard against old drivers
> > > > > > potentially calling this with NULL state for active formats or selection
> > > > > > rectangles.
> > > > > 
> > > > > I'm not too keen on this I'm afraid :-( I think it gets confusing for
> > > > > drivers that are not stream-aware to have to call a function that takes
> > > > > a stream number. I don't see a problem with keeping two different sets
> > > > > of functions, one for stream-aware drivers, and one for other drivers.
> > > > 
> > > > This becomes a nuisance in drivers such as CCS that work with sub-devices
> > > > some of which have streams and others which don't. I don't see why we
> > > > should have two sets of functions to access the same information, even
> > > > though it's stored differently.
> > > > 
> > > > I can add a wrapper using C11 _Generic to make the stream number go away.
> > > 
> > > That could possibly be interesting.
> > 
> > I'll add this for v2.
> 
> C11 _Generic() isn't up to the task as it only deals with argument types. On
> the other hand, variadic arguments supports this. It'll look like:
> 
> #define v4l2_subdev_get_crop(state, pad, ...)	      \
> 	__v4l2_subdev_get_crop_ ## __VA_OPT__(stream) \
> 	(state, pad __VA_OPT__(,) __VA_ARGS__)
> #define __v4l2_subdev_get_crop_(state, pad)	\
> 	__v4l2_subdev_get_crop(state, pad, 0)
> #define __v4l2_subdev_get_crop_stream(state, pad, stream)	\
> 	__v4l2_subdev_get_crop(state, pad, stream)
> struct v4l2_rect *
> __v4l2_subdev_get_crop(struct v4l2_subdev_state *state, unsigned int pad,
> 		       u32 stream);
> 
> Which I'd say is tolerable, given the result is a single function to access
> format, crop and compose information in the sub-device state.
> 
> Any thoughts on this?

With s/v4l2_subdev_get_crop/v4l2_subdev_state_get_crop/ I'm OK with
this.

-- 
Regards,

Laurent Pinchart
