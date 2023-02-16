Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CC9276997CD
	for <lists+linux-media@lfdr.de>; Thu, 16 Feb 2023 15:48:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230204AbjBPOsW (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 16 Feb 2023 09:48:22 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55774 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229980AbjBPOsV (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 16 Feb 2023 09:48:21 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2A03AC7
        for <linux-media@vger.kernel.org>; Thu, 16 Feb 2023 06:48:20 -0800 (PST)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 6E5EA10B;
        Thu, 16 Feb 2023 15:48:18 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1676558898;
        bh=sH1y0qRlTkiw4pP+PL/0doxzM1Co0msrnxgMCXyr5ko=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=o4IOKI6SSdiZc3sZItmTKs51N1hvwNiaofedrSCInUYfsUHxO+YVitxjuPwnGoCz1
         C6HsO5cX4i10Y3rubJNHRdCv4WDhWq+spfyVQP1j2AqOufGKUJ3Nb8FjYUOcp2Gix0
         bx+o/PR4IHPhYjgS7rYO69ZP1Rh+YwGF/SmndQ3Q=
Date:   Thu, 16 Feb 2023 16:48:18 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     "sakari.ailus@linux.intel.com" <sakari.ailus@linux.intel.com>,
        Andy Shevchenko <andy@kernel.org>,
        Dan Scally <djrscally@gmail.com>,
        Linux Media Mailing List <linux-media@vger.kernel.org>
Subject: Re: RFC: removing various special/obscure features from atomisp code
 ?
Message-ID: <Y+5CMkwHy9tuk6G2@pendragon.ideasonboard.com>
References: <5309d845-063b-6dd9-529d-0f82654290f2@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <5309d845-063b-6dd9-529d-0f82654290f2@redhat.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Hans,

On Thu, Feb 16, 2023 at 03:20:08PM +0100, Hans de Goede wrote:
> Hi All,
> 
> I have been looking into moving the sensor registration for atomisp2
> over to v4l2-aysnc similar to how
> drivers/media/pci/intel/ipu3/cio2-bridge.c does things.
> 
> Together with some other smaller changes this should allow the atomisp
> code use standard sensor drivers instead of having their own fork of
> these drivers.
> 
> While looking into this I realized that the current architecture of
> the atomisp2 code where it registers 8 /dev/video# nodes + many
> v4l2-subdevs is getting in the way of doing this.  At a minimum the
> current convoluted media-ctl graph makes it harder then necessary to
> make this change.
> 
> So this makes me realize that it probably is time to make some changes
> to the atomisp-code to remove a bunch of somewhat obscure (and
> untested / unused) features. I have been thinking about removing these
> for a long time already since they also get in the way of a bunch of
> other things like allowing the /dev/video# nodes to be opened multiple
> times.
> 
> So my plan is to reduce the feature set to make atomisp work as more
> or less a standard webcam (with front/back sensors) which is how most
> hw is using it and also is how all our (my) current testing uses it.
> 
> This means reducing the graph to a single /dev/video0 output node + 2
> subdevs for the sensors I might put one more node in the graph for
> selecting between the 3 CSI ports, or those could be 3 possible
> sources for /dev/video0.

Could you briefly summarize the hardware architecture, and in particular
what building blocks are present, and how they're connected ? That will
help with the discussion.

> So back to $subject, this means removing a bunch of stuff which
> atomisp at point supported (but we don't know if it currently even
> works). Before I start deleting all this code I wanted to give people
> a chance to protest here :)
> 
> So here we go the removal list:
> 
> 1. Remove support for depth mode. This is a special mode where 2
> streams (from 2 different sensors) can be setup and then
> starting/stopping 1 will automatically also start/stop the other.
> Like many of these special features I'm pretty sure that if the queue
> setup is not done exactly right things will crash and burn, there is
> no error checking for this.
> 
> This seems to be for stereoscopic vision and the only hw I know of
> which actually supports this is the Intel Aero board/SDK, all other
> 1000+ byt/cht models don't need this.
> 
> This definitely falls outside of the webcam use scenario and this
> involves a bunch of hacks / special exceptions all over the code, so
> lets remove this.

Is this implemented purely in software in the driver, or does the
hardware/firmware also play a role there ? If it's a pure software
implementation, sure, ditch it. If the hardware plays a role, I'd like
to better understand what role it plays.

> 2. Remove support for 2 streams at the same time, in theory the
> atomisp supports streaming from 2 sensors at the same time outputting
> something to 2 different /dev/video nodes. Downsides:

Here too I'd like to better understand how this is implemented.

> a. The atomisp is not really powerful enough for this. The DVFS code
> has a special "go all out" mode for this to try and keep up.
> 
> b. The BYT/CHT CPU also is not really powerful enough to do something
> useful with 2 streams

That depends on the resolution, and what those two streams are used for.
One could be displayed with zero-copy, making it essentially free from a
CPU point of view.

> c. The code is full of ugly special casing for this where certain
> cleanup on stream-stop needs to be skipped if the other stream is
> still active since some bits are shared.
> 
> d. This is not something which I see a lot of users actually using.
> 
> So lets remove this.
> 
> 
> 3. Remove having 4 separate video node (per stream, so 8 in total
> until 2. is done/removed).
> 
> The atomisp has 4 different modes / firmware-pipes it can setup:
> 
> i.   Still camera preview aka viewfinder
> ii.  Still camera capture aka capture
> iii. Video preview aka preview
> iv.  Video capture mode aka capture
> 
> Downsides:
> 
> a) This feels more like it should be some mode set on a single
> /dev/video# node rather then having separate nodes for this

If they're mutually exclusive, I agree.

> b) Only one mode and thus node can be active at the same time. The one
> exception being a special mode where viewfinder + capture buffers can
> be queued at the same time and then a trigger can be send to capture a
> string of frames in capture mode while the viewfinder also keeps
> streaming.
> 
> In all other cases calling stream-on on multiple nodes is not
> supported, but this is currently not enforced and trying to stream on
> multiple nodes likely just goes boom
> 
> c) it seems many of the modes have special pre-requisites, like
> capture mode seems to only work if already streaming in viewfinder
> mode.
> 
> d) we only ever have gotten video-preview mode to actually work,
> everything else is pretty much dead weight at this point
> 
> e) there is all kind of ugly reference counting .  exceptions to e.g.
> not turn off the sensor on stream-off if another /dev/video# node
> which is part of the same "stream" (in the sense of the 2 supported
> streams at once) is still active.
> 
> f) the special ref-counting/exceptions are getting in the way of
> allowing multiple opens of the /dev/video# node and generally get in
> the way of using standard v4l2-core helpers for file open/close
> handling.
> 
> g) having 8 / 4 /dev/video nodes confuses userspace
> 
> Thus from my pov ideally this should all go away too.
> 
> 
> So any objections or shall I start working on removing all this so
> that we end up with a much simpler driver?

I'll tell you once I get a better understanding of the hardware ;-)

-- 
Regards,

Laurent Pinchart
