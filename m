Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2009E7CA185
	for <lists+linux-media@lfdr.de>; Mon, 16 Oct 2023 10:26:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229848AbjJPI0Q (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 16 Oct 2023 04:26:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60228 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229574AbjJPI0P (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 16 Oct 2023 04:26:15 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C9699DC
        for <linux-media@vger.kernel.org>; Mon, 16 Oct 2023 01:26:13 -0700 (PDT)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id E8C0957E;
        Mon, 16 Oct 2023 10:26:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1697444767;
        bh=B6f2+/VOyEF9sazkyThQ5SCIZmZNmiQyZdd7HijNaIk=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=ZG4Xrn1HFmnhaJCUM3Ob3mvfD9m6G5uAkZlKdjV2pJMABcoqrfamF3RU8ifVEby14
         Ulfxj8HpYnoZ1MPj7BrLH5/Jbm4EARx0sCJEibhp+VGHa0Lw0b2PsMA7qjC1uV/HdP
         KBEZErwJToFNcrfmxvb7DgTFYOQH9lLfs46wRmWY=
Date:   Mon, 16 Oct 2023 11:26:19 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     linux-media@vger.kernel.org, hverkuil@xs4all.nl,
        tomi.valkeinen@ideasonboard.com, jacopo.mondi@ideasonboard.com,
        bingbu.cao@intel.com, hongju.wang@intel.com
Subject: Re: [PATCH 3/6] media: v4l: subdev: Rename sub-device state
 information access functions
Message-ID: <20231016082619.GI23177@pendragon.ideasonboard.com>
References: <20231013104424.404768-1-sakari.ailus@linux.intel.com>
 <20231013104424.404768-4-sakari.ailus@linux.intel.com>
 <20231013110439.GB11101@pendragon.ideasonboard.com>
 <ZSklcH8FrlCoIMqa@kekkonen.localdomain>
 <20231013112353.GA9923@pendragon.ideasonboard.com>
 <ZSkrFhGxCcWy4jRo@kekkonen.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <ZSkrFhGxCcWy4jRo@kekkonen.localdomain>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_PASS,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Fri, Oct 13, 2023 at 11:33:42AM +0000, Sakari Ailus wrote:
> On Fri, Oct 13, 2023 at 02:23:53PM +0300, Laurent Pinchart wrote:
> > On Fri, Oct 13, 2023 at 11:09:36AM +0000, Sakari Ailus wrote:
> > > On Fri, Oct 13, 2023 at 02:04:39PM +0300, Laurent Pinchart wrote:
> > > > On Fri, Oct 13, 2023 at 01:44:21PM +0300, Sakari Ailus wrote:
> > > > > Rename the sub-devices state information access functions, removing
> > > > > "_state" and "_stream" from them. This makes them shorter and so more
> > > > > convenient to use. No other functions will be needed to access this
> > > > > information.
> > > > 
> > > > The new names are too generic, and thus confusing. For instance,
> > > > v4l2_subdev_get_format() is way too close to v4l2_subdev_get_fmt(). I'm
> > > > fine dropping "_stream", but I would like to keep "_state".
> > > > 
> > > 
> > > My intention was actually to rename v4l2_subdev_get_fmt() later on: it's
> > > used in an ops struct, almost uniquely, so its name can be longer without
> > > it being a nuisance. I can include this in the same set.
> > 
> > No objection, as long as the new name is clear.
> > 
> > > The reason for using a shorter names such as v4l2_subdev_get_format() is
> > > that they're nicer to use in the code. The function names we've added
> > > recently are often exceedingly long. There's hardly room for confusion in
> > > this case either: these functions will remain as the only interface to
> > > access information in sub-device state.
> > 
> > I agree that long names are not nice, but too short names end up not
> > being descriptive enough. As these functions operate on a state, I'd
> > like to keep that information in the name to differenciate them from
> > functions operating on the subdev, and use the same state-aware prefix
> > for all similar functions (I expect we'll get more of them). If you can
> > find a good short form for the v4l2_subdev_state_ prefix that we can use
> > through the code base, that would be fine too. And before you ask
> > v4l2_sd_st_ is not good :-)
> 
> What would you say about v4l2_subdev_state_format() etc.? It's a function
> to obtain a pointer to the format on a given pad(/stream) and "get"
> typically isn't a part of the function name in other similar cases.

I like it better than v4l2_subdev_get_format() for sure, but I think the
_get here still looks a bit better. v4l2_subdev_state_get_format() would
already be shorter than the existing function name, do we need to
shorten it even further ?

-- 
Regards,

Laurent Pinchart
