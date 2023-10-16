Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8DA077CA182
	for <lists+linux-media@lfdr.de>; Mon, 16 Oct 2023 10:24:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229636AbjJPIYs (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 16 Oct 2023 04:24:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48526 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229574AbjJPIYr (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 16 Oct 2023 04:24:47 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7E8C1A1
        for <linux-media@vger.kernel.org>; Mon, 16 Oct 2023 01:24:46 -0700 (PDT)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 4ABE557E;
        Mon, 16 Oct 2023 10:24:39 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1697444679;
        bh=BLuMe69dWNGnKX+Htx7rDti2eXKdCkZaodSiAV3rv4U=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=hhswkV05nb+vcc8lUiZClD+gUYCGMmJRJ/GJLoWLTJWxGbGAsYS/FSeurlkdygZ6I
         DYDVlWDIUT6C5U4jxdUMcNVJYkE4CY/mU27UZYkoz4gNWy21AwY9lpLkcKwnJmvOqL
         fu2pCc5Ua9/7oYjbD1LRMrFajijdXMnN7tMpgh0M=
Date:   Mon, 16 Oct 2023 11:24:52 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     linux-media@vger.kernel.org, hverkuil@xs4all.nl,
        tomi.valkeinen@ideasonboard.com, jacopo.mondi@ideasonboard.com,
        bingbu.cao@intel.com, hongju.wang@intel.com
Subject: Re: [PATCH 2/6] media: v4l: subdev: Also return pads array
 information on stream functions
Message-ID: <20231016082452.GH23177@pendragon.ideasonboard.com>
References: <20231013104424.404768-1-sakari.ailus@linux.intel.com>
 <20231013104424.404768-3-sakari.ailus@linux.intel.com>
 <20231013110741.GD11101@pendragon.ideasonboard.com>
 <ZSkmPJdxlxeSzYeZ@kekkonen.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <ZSkmPJdxlxeSzYeZ@kekkonen.localdomain>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_PASS,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Sakari,

On Fri, Oct 13, 2023 at 11:13:00AM +0000, Sakari Ailus wrote:
> On Fri, Oct 13, 2023 at 02:07:41PM +0300, Laurent Pinchart wrote:
> > On Fri, Oct 13, 2023 at 01:44:20PM +0300, Sakari Ailus wrote:
> > > There are two sets of functions that return information from sub-device
> > > state, one for stream-unaware users and another for stream-aware users.
> > > Add support for stream-aware functions to return format, crop and compose
> > > information from pad-based array that are functionally equivalent to the
> > > old, stream-unaware ones.
> > > 
> > > Also check state is non-NULL, in order to guard against old drivers
> > > potentially calling this with NULL state for active formats or selection
> > > rectangles.
> > 
> > I'm not too keen on this I'm afraid :-( I think it gets confusing for
> > drivers that are not stream-aware to have to call a function that takes
> > a stream number. I don't see a problem with keeping two different sets
> > of functions, one for stream-aware drivers, and one for other drivers.
> 
> This becomes a nuisance in drivers such as CCS that work with sub-devices
> some of which have streams and others which don't. I don't see why we
> should have two sets of functions to access the same information, even
> though it's stored differently.
> 
> I can add a wrapper using C11 _Generic to make the stream number go away.

That could possibly be interesting.

-- 
Regards,

Laurent Pinchart
