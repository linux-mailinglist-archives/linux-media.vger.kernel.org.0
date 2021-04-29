Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7EC2736E591
	for <lists+linux-media@lfdr.de>; Thu, 29 Apr 2021 09:07:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237255AbhD2HIN (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 29 Apr 2021 03:08:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55404 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233209AbhD2HIM (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 29 Apr 2021 03:08:12 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 926FDC06138B
        for <linux-media@vger.kernel.org>; Thu, 29 Apr 2021 00:07:26 -0700 (PDT)
Received: from pty.hi.pengutronix.de ([2001:67c:670:100:1d::c5])
        by metis.ext.pengutronix.de with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <mfe@pengutronix.de>)
        id 1lc0lX-0005Ze-S9; Thu, 29 Apr 2021 09:07:15 +0200
Received: from mfe by pty.hi.pengutronix.de with local (Exim 4.89)
        (envelope-from <mfe@pengutronix.de>)
        id 1lc0lW-0005P9-3B; Thu, 29 Apr 2021 09:07:14 +0200
Date:   Thu, 29 Apr 2021 09:07:14 +0200
From:   Marco Felsch <m.felsch@pengutronix.de>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     p.zabel@pengutronix.de, mchehab@kernel.org, slongerbeam@gmail.com,
        hverkuil-cisco@xs4all.nl, sakari.ailus@linux.intel.com,
        linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org,
        kernel@pengutronix.de
Subject: Re: [PATCH 2/6] media: v4l: Add definition for bayered IR formats
Message-ID: <20210429070714.d3gy6qkawdiyj2wq@pengutronix.de>
References: <20210427120701.21809-1-m.felsch@pengutronix.de>
 <20210427120701.21809-3-m.felsch@pengutronix.de>
 <YIoPwYQel0J4qmPs@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YIoPwYQel0J4qmPs@pendragon.ideasonboard.com>
X-Sent-From: Pengutronix Hildesheim
X-URL:  http://www.pengutronix.de/
X-IRC:  #ptxdist @freenode
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
X-Uptime: 09:06:25 up 147 days, 21:12, 44 users,  load average: 0.10, 0.21,
 0.13
User-Agent: NeoMutt/20170113 (1.7.2)
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c5
X-SA-Exim-Mail-From: mfe@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-media@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Laurent,

On 21-04-29 04:45, Laurent Pinchart wrote:
> Hi Marco,
> 
> Thank you for the patch.
> 
> On Tue, Apr 27, 2021 at 02:06:57PM +0200, Marco Felsch wrote:
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
> > 
> > Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>
> > Reviewed-by: Philipp Zabel <p.zabel@pengutronix.de>
> > ---
> >  include/uapi/linux/videodev2.h | 4 ++++
> 
> The documentation is missing.

I've send a seperate patch for this. Those two could be squashed.

Regards,
  Marco
