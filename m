Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E1A1A1891BD
	for <lists+linux-media@lfdr.de>; Wed, 18 Mar 2020 00:02:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726765AbgCQXCo (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 17 Mar 2020 19:02:44 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:59482 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726735AbgCQXCo (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 17 Mar 2020 19:02:44 -0400
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 8384BF9;
        Wed, 18 Mar 2020 00:02:42 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1584486162;
        bh=prg73PH2p+bD0jIqhKqHG+Vsv4XYgaOh45UrICb51TE=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Af5IXSwhJT40wq2w6FsLrUrrur/qavTFnEZH5xd3kL+BOXeBqJ3RrbehelggQqpdE
         NUhgsSI92nc1bseUW1H4pU6Ocrcjd6I5rlEtXitWvFLro1C6Been9NYlaGfXGAWwaG
         Ab/5WP18Nt0QwSFAeLAO7EBme1n9ZRm19+DMq+8o=
Date:   Wed, 18 Mar 2020 01:02:37 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     Jacopo Mondi <jacopo@jmondi.org>, linux-media@vger.kernel.org,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>
Subject: Re: [PATCH/RFC] media: v4l2: Extend VIDIOC_ENUM_FMT to support
 MC-centric devices
Message-ID: <20200317230237.GN2527@pendragon.ideasonboard.com>
References: <20200313152406.13347-1-laurent.pinchart@ideasonboard.com>
 <20200317115854.h4oh2m2kipzjhmg3@uno.localdomain>
 <20200317130601.GI4864@pendragon.ideasonboard.com>
 <20200317220233.GE13878@kekkonen.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20200317220233.GE13878@kekkonen.localdomain>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Sakari,

On Wed, Mar 18, 2020 at 12:02:33AM +0200, Sakari Ailus wrote:
> On Tue, Mar 17, 2020 at 03:06:01PM +0200, Laurent Pinchart wrote:
> ...
> > > I have not followed CAP_IO_MC closely, but I
> > > wonder if that could help catching that situation in the core and
> > > return an error earlier. Maybe there could be a way for drivers to
> > > advertise support for that feature to the core and fail earlier if
> > > mbus_code is set and they don't claim to support it ?
> > 
> > I was thinking of linking the two, making this extension mandatory for
> > drivers that advertise CAP_IO_MC, in which case we could indeed drop the
> > flag.
> > 
> > Hans, what's your preference ?
> 
> My mild preference would be towards binding this to CAP_IO_MC flag.

If that's Hans' preference too, I'll rework it that way. It however
means that both will need to be merged in the same kernel release.

-- 
Regards,

Laurent Pinchart
