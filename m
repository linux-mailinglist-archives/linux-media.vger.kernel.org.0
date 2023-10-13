Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8A3F47C8453
	for <lists+linux-media@lfdr.de>; Fri, 13 Oct 2023 13:23:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230039AbjJMLXu (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 13 Oct 2023 07:23:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52060 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230175AbjJMLXt (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 13 Oct 2023 07:23:49 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 10F95C0
        for <linux-media@vger.kernel.org>; Fri, 13 Oct 2023 04:23:48 -0700 (PDT)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id ACFA7221;
        Fri, 13 Oct 2023 13:23:42 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1697196222;
        bh=v3pSgRas0omdXZ6Ri06eIY93AgFZ/NaPajzyIK75tqE=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=nLCwHReilYv8pjkgHylhPHD0QSZqEth+jCwvI16ZyqZoTkxcZKrSwELmfWW3wB//v
         NQtij1N/xipF/2PeliWa0Owppx5Jd0UZnd3E87Kf2MWpyQDdMpvzldDy0Dp8Pc2W5Y
         560AJ4dlACEmgva7C/0/VC+7vdi8pxfmJUyt59n4=
Date:   Fri, 13 Oct 2023 14:23:53 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     linux-media@vger.kernel.org, hverkuil@xs4all.nl,
        tomi.valkeinen@ideasonboard.com, jacopo.mondi@ideasonboard.com,
        bingbu.cao@intel.com, hongju.wang@intel.com
Subject: Re: [PATCH 3/6] media: v4l: subdev: Rename sub-device state
 information access functions
Message-ID: <20231013112353.GA9923@pendragon.ideasonboard.com>
References: <20231013104424.404768-1-sakari.ailus@linux.intel.com>
 <20231013104424.404768-4-sakari.ailus@linux.intel.com>
 <20231013110439.GB11101@pendragon.ideasonboard.com>
 <ZSklcH8FrlCoIMqa@kekkonen.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <ZSklcH8FrlCoIMqa@kekkonen.localdomain>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Fri, Oct 13, 2023 at 11:09:36AM +0000, Sakari Ailus wrote:
> On Fri, Oct 13, 2023 at 02:04:39PM +0300, Laurent Pinchart wrote:
> > On Fri, Oct 13, 2023 at 01:44:21PM +0300, Sakari Ailus wrote:
> > > Rename the sub-devices state information access functions, removing
> > > "_state" and "_stream" from them. This makes them shorter and so more
> > > convenient to use. No other functions will be needed to access this
> > > information.
> > 
> > The new names are too generic, and thus confusing. For instance,
> > v4l2_subdev_get_format() is way too close to v4l2_subdev_get_fmt(). I'm
> > fine dropping "_stream", but I would like to keep "_state".
> > 
> 
> My intention was actually to rename v4l2_subdev_get_fmt() later on: it's
> used in an ops struct, almost uniquely, so its name can be longer without
> it being a nuisance. I can include this in the same set.

No objection, as long as the new name is clear.

> The reason for using a shorter names such as v4l2_subdev_get_format() is
> that they're nicer to use in the code. The function names we've added
> recently are often exceedingly long. There's hardly room for confusion in
> this case either: these functions will remain as the only interface to
> access information in sub-device state.

I agree that long names are not nice, but too short names end up not
being descriptive enough. As these functions operate on a state, I'd
like to keep that information in the name to differenciate them from
functions operating on the subdev, and use the same state-aware prefix
for all similar functions (I expect we'll get more of them). If you can
find a good short form for the v4l2_subdev_state_ prefix that we can use
through the code base, that would be fine too. And before you ask
v4l2_sd_st_ is not good :-)

-- 
Regards,

Laurent Pinchart
