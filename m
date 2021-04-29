Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8AAC636F27F
	for <lists+linux-media@lfdr.de>; Fri, 30 Apr 2021 00:14:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229586AbhD2WPZ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 29 Apr 2021 18:15:25 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:57504 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229570AbhD2WPZ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 29 Apr 2021 18:15:25 -0400
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 9396AB1A;
        Fri, 30 Apr 2021 00:14:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1619734476;
        bh=wbRtpUav4mX8qgHqEbysxOkNe3jmLSOK1SNghLoywSM=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=h1aDPJEBt4vs+7ho8IVL2FGkeEYV2rFFv8SNNX6RkqgJ8ixpsvlPLXFw6ul8ZtH/y
         hs1uvhm4v3cxTangxuo4Ih29pQLeDNcWRRbNKH54I7JoW1fg741AlMMGhvK6ytSB0a
         G/oIjVWO++elYCZ4C+EBL0id7XLEYTKAQEU3aNaM=
Date:   Fri, 30 Apr 2021 01:14:35 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Marco Felsch <m.felsch@pengutronix.de>
Cc:     p.zabel@pengutronix.de, mchehab@kernel.org, slongerbeam@gmail.com,
        hverkuil-cisco@xs4all.nl, sakari.ailus@linux.intel.com,
        linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org,
        kernel@pengutronix.de
Subject: Re: [PATCH 1/6] media: uapi: Add MEDIA_BUS_FMT_SGRGB_IGIG_GBGR_IGIG
 media bus formats
Message-ID: <YIsvyz49KvZK6Wg5@pendragon.ideasonboard.com>
References: <20210427120701.21809-1-m.felsch@pengutronix.de>
 <20210427120701.21809-2-m.felsch@pengutronix.de>
 <YIoRLQfoNm0GJGsY@pendragon.ideasonboard.com>
 <20210429074903.cc5gohn52cgv4i5z@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20210429074903.cc5gohn52cgv4i5z@pengutronix.de>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Marco,

On Thu, Apr 29, 2021 at 09:49:03AM +0200, Marco Felsch wrote:
> On 21-04-29 04:51, Laurent Pinchart wrote:
> > On Tue, Apr 27, 2021 at 02:06:56PM +0200, Marco Felsch wrote:
> > > Add special 8/12bit bayer media bus format for the OnSemi AR0237IR
> > > camera sensor [1]. OnSemi calls this format RGB-IR, the pixel array
> > > with the interleaved IR pixels looks like:
> > > 
> > >         |  G |  R |  G |  B | ...
> > >         +----+----+----+----+---
> > >         | IR |  G | IR |  G | ...
> > >         +----+----+----+----+---
> > >         |  G |  B |  G |  R | ...
> > >         +----+----+----+----+---
> > >         | IR |  G | IR |  G | ...
> > >         +----+----+----+----+---
> > >         | .. | .. | .. | .. | ..
> > > 
> > > [1] https://www.framos.com/media/pdf/96/ac/8f/AR0237CS-D-PDF-framos.pdf
> > 
> > I think we're reaching a limit of the media bus codes model here, due to
> > a historical mistake. The four possible Bayer patterns, times the
> > different number of bits per pixel, creates a lot of media bus codes,
> > and drivers for CSI-2 receivers and IP cores further down the pipeline
> > have to support them all.
> 
> That's correct but it is not bayer related. Currently it is what it is,
> if a new code is added it must be propagated through all the involved
> subdevs. On the other hand I wouldn't say that it is better to support
> new codes per default for all drivers. Since this would add a lot of
> untested code paths.

It's not an issue limited to Bayer patterns, but they make the issue
worse given the number of possible combinations (think about adding DPCM
and ALAW compression on top of that...).

> > This is already painful, and if we had a
> > non-Bayer pattern such as this one,
> 
> That's not exactly true since it is a bayer pattern but instead of using
> 4x4 it uses 8x8 and it as some special pixels.
> 
> > we'll open the door to an explosion
> > of the number of media bus codes (imagine all the different possible
> > arrangements of this pattern, for instance if you enable horizontal
> > and/or vertical flipping on the sensor). All drivers would need to be
> > updated to support these new bus codes, and this really kills the
> > current model.
> 
> Yep, I know what you mean but as I said above I think that adding it
> explicite is the better abbroach since it involves somone who add _and_
> test the new code on the particular platform.
> 
> > The historical mistake was to tie the Bayer pattern with the media bus
> > code. We should really have specified raw 8/10/12/14/16 media bus codes,
> > and conveyed the pattern separately. Most IP cores in the pipeline don't
> > need to care about the pattern at all, and those who do (that's mostly
> > ISPs) could be programmed explicitly by userspace as long as we have an
> > API to retrieve the pattern from the sensor. I believe it's time to bite
> > the bullet and go in that direction. I'm sorry for this case of yak
> > shaving, but it really wouldn't be manageable anymore :-(
> 
> I got all your points and would agree but this is not a bayer only
> related problem. You will have this problem with all new other formats
> as well. I'm with you, most IP cores don't care but I wouldn't
> guarantee that.

Sorry, but adding new media bus formats like this one will just not
scale. We have two options, either fixing the issue, or considering that
V4L2 is a barely alive API with no future, and merging this without
caring anymore.

-- 
Regards,

Laurent Pinchart
