Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B538636E640
	for <lists+linux-media@lfdr.de>; Thu, 29 Apr 2021 09:49:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229814AbhD2HuD (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 29 Apr 2021 03:50:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36500 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232455AbhD2HuC (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 29 Apr 2021 03:50:02 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DD02DC06138B
        for <linux-media@vger.kernel.org>; Thu, 29 Apr 2021 00:49:14 -0700 (PDT)
Received: from pty.hi.pengutronix.de ([2001:67c:670:100:1d::c5])
        by metis.ext.pengutronix.de with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <mfe@pengutronix.de>)
        id 1lc1Q0-0002AW-Gt; Thu, 29 Apr 2021 09:49:04 +0200
Received: from mfe by pty.hi.pengutronix.de with local (Exim 4.89)
        (envelope-from <mfe@pengutronix.de>)
        id 1lc1Pz-000726-Km; Thu, 29 Apr 2021 09:49:03 +0200
Date:   Thu, 29 Apr 2021 09:49:03 +0200
From:   Marco Felsch <m.felsch@pengutronix.de>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     p.zabel@pengutronix.de, mchehab@kernel.org, slongerbeam@gmail.com,
        hverkuil-cisco@xs4all.nl, sakari.ailus@linux.intel.com,
        linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org,
        kernel@pengutronix.de
Subject: Re: [PATCH 1/6] media: uapi: Add MEDIA_BUS_FMT_SGRGB_IGIG_GBGR_IGIG
 media bus formats
Message-ID: <20210429074903.cc5gohn52cgv4i5z@pengutronix.de>
References: <20210427120701.21809-1-m.felsch@pengutronix.de>
 <20210427120701.21809-2-m.felsch@pengutronix.de>
 <YIoRLQfoNm0GJGsY@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YIoRLQfoNm0GJGsY@pendragon.ideasonboard.com>
X-Sent-From: Pengutronix Hildesheim
X-URL:  http://www.pengutronix.de/
X-IRC:  #ptxdist @freenode
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
X-Uptime: 09:25:01 up 147 days, 21:31, 44 users,  load average: 0.64, 0.26,
 0.15
User-Agent: NeoMutt/20170113 (1.7.2)
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c5
X-SA-Exim-Mail-From: mfe@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-media@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Laurent,

On 21-04-29 04:51, Laurent Pinchart wrote:
> Hi Marco,
> 
> Thank you for the patch.
> 
> On Tue, Apr 27, 2021 at 02:06:56PM +0200, Marco Felsch wrote:
> > Add special 8/12bit bayer media bus format for the OnSemi AR0237IR
> > camera sensor [1]. OnSemi calls this format RGB-IR, the pixel array
> > with the interleaved IR pixels looks like:
> > 
> >         |  G |  R |  G |  B | ...
> >         +----+----+----+----+---
> >         | IR |  G | IR |  G | ...
> >         +----+----+----+----+---
> >         |  G |  B |  G |  R | ...
> >         +----+----+----+----+---
> >         | IR |  G | IR |  G | ...
> >         +----+----+----+----+---
> >         | .. | .. | .. | .. | ..
> > 
> > [1] https://www.framos.com/media/pdf/96/ac/8f/AR0237CS-D-PDF-framos.pdf
> 
> I think we're reaching a limit of the media bus codes model here, due to
> a historical mistake. The four possible Bayer patterns, times the
> different number of bits per pixel, creates a lot of media bus codes,
> and drivers for CSI-2 receivers and IP cores further down the pipeline
> have to support them all.

That's correct but it is not bayer related. Currently it is what it is,
if a new code is added it must be propagated through all the involved
subdevs. On the other hand I wouldn't say that it is better to support
new codes per default for all drivers. Since this would add a lot of
untested code paths.

> This is already painful, and if we had a
> non-Bayer pattern such as this one,

That's not exactly true since it is a bayer pattern but instead of using
4x4 it uses 8x8 and it as some special pixels.

> we'll open the door to an explosion
> of the number of media bus codes (imagine all the different possible
> arrangements of this pattern, for instance if you enable horizontal
> and/or vertical flipping on the sensor). All drivers would need to be
> updated to support these new bus codes, and this really kills the
> current model.

Yep, I know what you mean but as I said above I think that adding it
explicite is the better abbroach since it involves somone who add _and_
test the new code on the particular platform.

> The historical mistake was to tie the Bayer pattern with the media bus
> code. We should really have specified raw 8/10/12/14/16 media bus codes,
> and conveyed the pattern separately. Most IP cores in the pipeline don't
> need to care about the pattern at all, and those who do (that's mostly
> ISPs) could be programmed explicitly by userspace as long as we have an
> API to retrieve the pattern from the sensor. I believe it's time to bite
> the bullet and go in that direction. I'm sorry for this case of yak
> shaving, but it really wouldn't be manageable anymore :-(

I got all your points and would agree but this is not a bayer only
related problem. You will have this problem with all new other formats
as well. I'm with you, most IP cores don't care but I wouldn't
guarantee that.

Regards,
  Marco
