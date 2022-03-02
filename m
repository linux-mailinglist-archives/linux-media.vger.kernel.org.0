Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8B6774CAABA
	for <lists+linux-media@lfdr.de>; Wed,  2 Mar 2022 17:48:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242669AbiCBQt2 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 2 Mar 2022 11:49:28 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53828 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241049AbiCBQt1 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 2 Mar 2022 11:49:27 -0500
Received: from smtp1.de.adit-jv.com (smtp1.de.adit-jv.com [93.241.18.167])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0C7416D849;
        Wed,  2 Mar 2022 08:48:42 -0800 (PST)
Received: from hi2exch02.adit-jv.com (hi2exch02.adit-jv.com [10.72.92.28])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by smtp1.de.adit-jv.com (Postfix) with ESMTPS id 6CAFB3C0016;
        Wed,  2 Mar 2022 17:48:41 +0100 (CET)
Received: from vmlxhi-121.adit-jv.com (10.72.92.132) by hi2exch02.adit-jv.com
 (10.72.92.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2308.21; Wed, 2 Mar
 2022 17:48:41 +0100
Date:   Wed, 2 Mar 2022 17:48:34 +0100
From:   Michael Rodin <mrodin@de.adit-jv.com>
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Niklas =?utf-8?Q?S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
CC:     <linux-media@vger.kernel.org>, <linux-renesas-soc@vger.kernel.org>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Michael Rodin <mrodin@de.adit-jv.com>
Subject: Re: [PATCH 3/4] rcar-vin: Stop stream when subdevice signal transfer
 error
Message-ID: <20220302164834.GA23637@vmlxhi-121.adit-jv.com>
References: <20211108160220.767586-1-niklas.soderlund+renesas@ragnatech.se>
 <20211108160220.767586-4-niklas.soderlund+renesas@ragnatech.se>
 <1fddc966-5a23-63b4-185e-c17aa6d65b54@xs4all.nl>
 <YYlvqY21JvTtKysK@oden.dyn.berto.se>
 <9e405ed3-fb65-c16d-f84f-2530adbdc9b7@xs4all.nl>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <9e405ed3-fb65-c16d-f84f-2530adbdc9b7@xs4all.nl>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-Originating-IP: [10.72.92.132]
X-ClientProxiedBy: hi2exch02.adit-jv.com (10.72.92.28) To
 hi2exch02.adit-jv.com (10.72.92.28)
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Niklas, Hans,

On Mon, Nov 15, 2021 at 03:26:53PM +0100, Hans Verkuil wrote:
> On 08/11/2021 19:42, Niklas Söderlund wrote:
> > Hi Hans,
> > 
> > On 2021-11-08 18:36:25 +0100, Hans Verkuil wrote:
> >> On 08/11/2021 17:02, Niklas Söderlund wrote:
> >>> When a subdevice signals a transfer error stop the VIN in addition to
> >>> informing user-space of the event.
> >>>
> >>> Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
> >>> Reviewed-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
> >>> ---
> >>> * Changes since v3
> >>> - Switch to new V4L2_EVENT_XFER_ERROR from V4L2_EVENT_EOS.
> >>> - Call vb2_queue_error() when encountering the event.
> >>>
> >>> * Changes since v2
> >>> - Log using vin_dbg() instead of v4l2_info().
> >>> ---
> >>>  drivers/media/platform/rcar-vin/rcar-v4l2.c | 17 ++++++++++++++++-
> >>>  1 file changed, 16 insertions(+), 1 deletion(-)
> >>>
> >>> diff --git a/drivers/media/platform/rcar-vin/rcar-v4l2.c b/drivers/media/platform/rcar-vin/rcar-v4l2.c
> >>> index a5bfa76fdac6e55a..bf17fdefe90aabf5 100644
> >>> --- a/drivers/media/platform/rcar-vin/rcar-v4l2.c
> >>> +++ b/drivers/media/platform/rcar-vin/rcar-v4l2.c
> >>> @@ -992,9 +992,24 @@ void rvin_v4l2_unregister(struct rvin_dev *vin)
> >>>  static void rvin_notify_video_device(struct rvin_dev *vin,
> >>>  				     unsigned int notification, void *arg)
> >>>  {
> >>> +	const struct v4l2_event *event;
> >>> +
> >>>  	switch (notification) {
> >>>  	case V4L2_DEVICE_NOTIFY_EVENT:
> >>> -		v4l2_event_queue(&vin->vdev, arg);
> >>> +		event = arg;
> >>> +
> >>> +		switch (event->type) {
> >>> +		case V4L2_EVENT_XFER_ERROR:
> >>> +			vin_dbg(vin,
> >>> +				"Subdevice signaled transfer error, stopping.\n");
> >>> +			rvin_stop_streaming(vin);
> >>> +			vb2_queue_error(&vin->queue);
> >>
> >> Hmm, wouldn't it be the case that every driver that calls vb2_queue_error()
> >> would also have to send this new event? Would it be possible to modify
> >> vb2_queue_error() to raise this event? I haven't analyzed all the drivers
> >> that call this function to see if that makes sense.
> >>
> >> Perhaps a separate new function vb2_queue_error_with_event() would also be
> >> an option.
> > 
> > I think that maybe a good idea, but I think that would be needed on-top 
> > of this work as I can't really test it. Here the rcar-csi2.ko is a 
> > subdevice which detects the error condition and generates the event. And 
> > this code is in rcar-vin.ko, the video device driver which reacts to the 
> > event and then forwards it to user-space.
> > 
> > Or am I misunderstanding you? And you think I should remove the 
> > v4l2_event_queue() below in favor of a new vb2_queue_error_with_event() 
> > call?
> 
> Yes. And use vb2_queue_error_with_event in other drivers as well where
> applicable. Hmm, it can't be called vb2_ since it is v4l2_ specific, so
> perhaps v4l2_queue_error which takes a video_device and a vb2_queue as
> arguments. I don't want this just in rcar since it makes perfect sense
> as a generic event for such situations.

Handling errors in this way could be problematic, because a (CSI2) transfer
error does not mean a total hardware failure on Rcar3. From my experience
there are 3 kinds of CSI2 errors:
  1. errors which occur sometimes, but do not affect video streaming
  2. errors which occur on every start of streaming but usually do not
     affect actual video streaming to VIN module after the start
  3. fatal errors which require a "Software Reset" mentioned by Renesas in
     the chapter 25.3.13 of the hardware manual in order to continue
     video streaming
This patch set makes the video pipeline unusable if we get errors described
in the first scenario if I am not mistaken. In the second scenario the
video pipeline was already not usable before because we end up in a
continuous restart loop in rcar-csi2.c. And the third scenario is not
really addressed by this patch set (or maybe the job is offloaded on to
userspace)?

Maybe it's better to implement a recovery in a different way, which would
consider the three mentioned error scenarios above:
  1. Monitor rvin_irq after streaming has started, e.g. by using a timer
     (I tried someting similar in [1])
  2. restart the complete video pipeline via rvin_stop_streaming and
     rvin_start_streaming if no frame is captured in a reasonable amount
     of time (optionally after checking if a subdevice has sent a
     V4L2_EVENT_XFER_ERROR).
This would make the complete recovery process almost invisible for the
application and avoid any application changes.

What do you think?

[1] https://lore.kernel.org/linux-renesas-soc/1592588777-100596-1-git-send-email-mrodin@de.adit-jv.com/

> Regards,
> 
> 	Hans
> 
> > 
> >>
> >> Regards,
> >>
> >> 	Hans
> >>
> >>> +			break;
> >>> +		default:
> >>> +			break;
> >>> +		}
> >>> +
> >>> +		v4l2_event_queue(&vin->vdev, event);
> >>>  		break;
> >>>  	default:
> >>>  		break;
> >>>
> >>
> > 
> 

-- 
Best Regards,
Michael
