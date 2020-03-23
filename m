Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C247818F657
	for <lists+linux-media@lfdr.de>; Mon, 23 Mar 2020 14:53:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728532AbgCWNxA (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 23 Mar 2020 09:53:00 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:48318 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728446AbgCWNw7 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 23 Mar 2020 09:52:59 -0400
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id A5946308;
        Mon, 23 Mar 2020 14:52:57 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1584971577;
        bh=6cRxZPd/Yh7VjyUQHCC2iq4v0wcVNcJPsB0aU1lMTH4=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=ic4n+wP+VrEUjZlAde7yHOaRCH1bSVcp3aBZ5TsEZo69a+38j5zWt33N4wqhU+q/n
         o+JnMGd3pmSadTUCS3K15MoLMtpCv0aQTCUtWbF8HrB1hS6LAU3txziwSAjA6gtmaK
         SRTuGHHD8HKLLk33bo4oC8FBRZaRp6zyzDvlfILc=
Date:   Mon, 23 Mar 2020 15:52:48 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Pavel Machek <pavel@ucw.cz>
Cc:     sean@mess.org, hverkuil-cisco@xs4all.nl,
        mchehab+samsung@kernel.org, mchehab@kernel.org,
        sakari.ailus@linux.intel.com, linux-media@vger.kernel.org
Subject: Re: [PATCH] Minimal libv4l2 support for complex cameras
Message-ID: <20200323135248.GI4768@pendragon.ideasonboard.com>
References: <20200323114727.GA31063@amd>
 <20200323115753.GC12103@pendragon.ideasonboard.com>
 <20200323122216.GA18697@duo.ucw.cz>
 <20200323122442.GD12103@pendragon.ideasonboard.com>
 <20200323131922.GA719@duo.ucw.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20200323131922.GA719@duo.ucw.cz>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi,

On Mon, Mar 23, 2020 at 02:19:23PM +0100, Pavel Machek wrote:
> > On Mon, Mar 23, 2020 at 01:22:17PM +0100, Pavel Machek wrote:
> > > > On Mon, Mar 23, 2020 at 12:47:27PM +0100, Pavel Machek wrote:
> > > >> Hi!
> > > >> 
> > > >> We now have easy-to-install support for complex camera in form of
> > > >> Maemo Leste on N900.... Unfortunately we don't have anything in
> > > >> userspace that can be used to work with the camera.
> > > >> 
> > > >> This attempts to be minimal solution to get libv4l2 to work.
> > > > 
> > > > libv4l2 is mostly deprecated. How about contributing an OMAP3 ISP
> > > > pipeline handler to libcamera instead ? :-)
> > > 
> > > Why should it be instead?
> > > 
> > > I need something for kernel testing, and there is ton of apps using
> > > it. Let me do this. libcamera might be future, but...
> > 
> > Sure, if it's useful for you, I won't prevent you from developing any
> > code you want :-) But there's very little chance of getting it merged,
> > and it would be useful to more people to have a support for that
> > platform in libcamera. It's really your decision, and I'm not blaming
> > you.
> 
> When you have libcamera ready, you'll still need some hardware and
> kernel to work with it. Do you have something more suitable than
> N9/N900? Droid 4 has separate CPU to run the camera, Librem 5 camera
> does not have autofocus (and I believe nor has PinePhone).

OMAP3 is great as a test bed for camera opinion. It's widely available,
has amazing documentation, and even though the hardware is aging a
little bit, it's still very decent and has a nice ISP. Even better,
there's good kernel support for it, so it's a really good platform in my
opinion. The only reason we don't support it yet in libcamera is lack of
spare time, I would really love to see that happening, and it would be
first-class citizen in the code base.

> My patch is not complex, and libv4l2 is full of similar hardware
> support code. What would be reason not to merge it?

It has to be reviewed and maintained. From a V4L2 community point of
view, I don't think it makes sense to invest time on a dying component
(I'm talking about libv4l2, not OMAP3). But from a personal point of
view, if you find libv4l2 useful to develop code for the OMAP3 and
experiment, I see no issue with that. If other reviewers and maintainers
of libv4l2 disagree and want to invest their time in this, I won't stop
them, but I wanted to warn that this is a dying project.

-- 
Regards,

Laurent Pinchart
