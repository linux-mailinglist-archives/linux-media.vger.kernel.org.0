Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8936236E25F
	for <lists+linux-media@lfdr.de>; Thu, 29 Apr 2021 02:12:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229794AbhD2ALv (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 28 Apr 2021 20:11:51 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:40816 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229488AbhD2ALu (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 28 Apr 2021 20:11:50 -0400
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 033B7DA8;
        Thu, 29 Apr 2021 02:11:03 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1619655064;
        bh=pOJZQGsHjpz14wwSlsyS8qJB5d6D7Xs2lVNX5qZ4iLo=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=SOvxLs7ZjKMLQvqk2KO88OilmmgkjRK0+ip5AhrcOW/LesiJAPvH/ndFhsc5ZZDc6
         4K3KMRI8O7O6bIZg9I2aIqItEv0rc6NljEVdUtNfOZGjZoZ7gN2oFdjOqdqfchTLR8
         joAOFf9Lr54EaEnt6geQar/bw13T9X6hvKpFAGyA=
Date:   Thu, 29 Apr 2021 03:10:58 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc:     Benoit Parrot <bparrot@ti.com>, Pratyush Yadav <p.yadav@ti.com>,
        Lokesh Vutla <lokeshvutla@ti.com>, linux-media@vger.kernel.org
Subject: Re: [PATCH 21/28] media: ti-vpe: cal: fix cal_ctx_v4l2_register
 error handling
Message-ID: <YIn5kq28QE5L0/uj@pendragon.ideasonboard.com>
References: <20210412113457.328012-1-tomi.valkeinen@ideasonboard.com>
 <20210412113457.328012-22-tomi.valkeinen@ideasonboard.com>
 <YHwvfL885Qm0iD0/@pendragon.ideasonboard.com>
 <8fb0ee37-236e-3eaa-9e82-0d9bb8c94c39@ideasonboard.com>
 <cfe378fb-5637-eee7-040b-c028bf2fc4cc@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <cfe378fb-5637-eee7-040b-c028bf2fc4cc@ideasonboard.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Tomi,

On Tue, Apr 20, 2021 at 02:17:36PM +0300, Tomi Valkeinen wrote:
> On 20/04/2021 13:50, Tomi Valkeinen wrote:
> > On 18/04/2021 16:09, Laurent Pinchart wrote:
> >> On Mon, Apr 12, 2021 at 02:34:50PM +0300, Tomi Valkeinen wrote:
> >>> cal_ctx_v4l2_register() returns an error code, but the returned error
> >>> code is not handled anywhere. However, we can't really even handle the
> >>> error in any proper way, so lets just drop the return value and make
> >>> sure all error paths have an error print.
> >>
> >> Ouch. Doesn't this call for registering the video node earlier, at probe
> >> time, instead of in the async notifier complete callback ?
> > 
> > Shouldn't we only register uAPI access points after the kernel has 
> > probed (succesfully) the hardware? If we register the video nodes at 
> > probe time I presume we would have to add checks to all the cal ioctl 
> > handlers to check if we have actually probed.

There's a long-lasting debate on this topic :-) The issue with
registering video nodes when all the subdevs have been acquired is that
you should then unregister them with a subdev is removed. The
re-registration gets fairly messy, especially if userspace keeps a video
device node open. It's not like V4L2 handles object life time management
correctly anyway, as it's completely broken in the core, maybe we
shouldn't care and just decide that unbinding a device from its driver
is unsupported.

> > v4l2_async_notifier_operations.complete can return an error, but it's 
> > not quite clear to me what happens in that case and how the driver 
> > should handle it.
> > 
> > I'll look at this a bit, maybe it's still better to handle the error in 
> > complete callback and return the error from there, than ignoring the error.
> 
> Well, handling the error in complete callback seems to work fine. I'm 
> not sure why I didn't do that and instead went with the approach in this 
> patch.

-- 
Regards,

Laurent Pinchart
