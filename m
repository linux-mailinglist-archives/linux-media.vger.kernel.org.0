Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 35D9E4CAF83
	for <lists+linux-media@lfdr.de>; Wed,  2 Mar 2022 21:17:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243027AbiCBUS2 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 2 Mar 2022 15:18:28 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59848 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243004AbiCBUS0 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 2 Mar 2022 15:18:26 -0500
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com [IPv6:2a00:1450:4864:20::12e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 448C636E28
        for <linux-media@vger.kernel.org>; Wed,  2 Mar 2022 12:17:41 -0800 (PST)
Received: by mail-lf1-x12e.google.com with SMTP id d23so4708153lfv.13
        for <linux-media@vger.kernel.org>; Wed, 02 Mar 2022 12:17:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ragnatech-se.20210112.gappssmtp.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=1pxEOtklzqS53zpS9txXVsAp0O7Dl97xVaLaW4NoOck=;
        b=43txZ59qoCgUVXXEk1LkGQVf0t7rkvwukjrCDu1lglQkufQ+ylX20olgEHOkR4laCq
         /hX03lqXz9x2JZHfkagF/Al7gaemfFLJY1ZCU22ACpBC/6Km9bZqVZlkvdA/3b9g3wU3
         wvNnZ2rZeKQcSBDWtVaWYGgoMlKtfxwcHDCa2uPUuJEGectble8426SwfDDSm4va4mI6
         1DnyDDLc32o3nb0EOgP4Al7P93LXUCFbPSTkHFKJ0LdhlqS9yDZkfPFeO6qzy5QsLEkn
         buSJiwRYzkEMBx3iZDv9cohc9q5wwHiLjgRarLXopAR8KRoocKjmg6OP2XoVbCALOQSa
         HDWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=1pxEOtklzqS53zpS9txXVsAp0O7Dl97xVaLaW4NoOck=;
        b=N3K3mAz3OPDbExyJ6mIDW6FAgxRCfqYJM7DBpy5g6Yl4UuKIGjU9CoQ/0qIoVTKb2C
         2LQaqy2Ek9VO4m85m5wf62TBmS05WkBMQsSNpyDqaShb1s4nr0spDUJYgRo6xwW9CMAA
         VVAxOQrFNzlq89NVvGT7T1Pa/eN9LmQ67b1KLmDduSbnrE7mfVoiO00apzjy4jMpN6ay
         +aYv7wbjsTIJRHn1lox2kO2kGeugDge/ZLqxVZdxSdsqt6AaRm5K/rr+8+ka3p+ZczDY
         dx22w/tDso5sGvIbGe6DaKfmPDlWh0M449Dhqhowqj0aE5ma6yCPmZ7uKUFfL2Kry7Z1
         ehiA==
X-Gm-Message-State: AOAM531uh2xR/rq6bDoi9GCcZVs3t0nUIibhCxzRtyeg5KLrivRTaZfi
        DIGeBHsPWHrdWh0pwKazwMf7cg==
X-Google-Smtp-Source: ABdhPJzDMc15xfRp/bhvhH5tNY6NReNjaBaytknMofFcYiJuqOf3FnFUDEhJHaTzMr0UmJ09+AXxtg==
X-Received: by 2002:a19:550b:0:b0:443:e008:3e12 with SMTP id n11-20020a19550b000000b00443e0083e12mr19438099lfe.11.1646252259276;
        Wed, 02 Mar 2022 12:17:39 -0800 (PST)
Received: from localhost (h-85-24-188-65.A463.priv.bahnhof.se. [85.24.188.65])
        by smtp.gmail.com with ESMTPSA id f9-20020a05651232c900b0044377158635sm11607lfg.37.2022.03.02.12.17.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Mar 2022 12:17:38 -0800 (PST)
Date:   Wed, 2 Mar 2022 21:17:37 +0100
From:   Niklas =?iso-8859-1?Q?S=F6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
To:     Michael Rodin <mrodin@de.adit-jv.com>
Cc:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Jacopo Mondi <jacopo+renesas@jmondi.org>
Subject: Re: [PATCH 3/4] rcar-vin: Stop stream when subdevice signal transfer
 error
Message-ID: <Yh/Q4XOc4HqY0W/h@oden.dyn.berto.se>
References: <20211108160220.767586-1-niklas.soderlund+renesas@ragnatech.se>
 <20211108160220.767586-4-niklas.soderlund+renesas@ragnatech.se>
 <1fddc966-5a23-63b4-185e-c17aa6d65b54@xs4all.nl>
 <YYlvqY21JvTtKysK@oden.dyn.berto.se>
 <9e405ed3-fb65-c16d-f84f-2530adbdc9b7@xs4all.nl>
 <20220302164834.GA23637@vmlxhi-121.adit-jv.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220302164834.GA23637@vmlxhi-121.adit-jv.com>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Michael,

Thanks for your feedback.

On 2022-03-02 17:48:34 +0100, Michael Rodin wrote:
> Hi Niklas, Hans,
> 
> On Mon, Nov 15, 2021 at 03:26:53PM +0100, Hans Verkuil wrote:
> > On 08/11/2021 19:42, Niklas Söderlund wrote:
> > > Hi Hans,
> > > 
> > > On 2021-11-08 18:36:25 +0100, Hans Verkuil wrote:
> > >> On 08/11/2021 17:02, Niklas Söderlund wrote:
> > >>> When a subdevice signals a transfer error stop the VIN in addition to
> > >>> informing user-space of the event.
> > >>>
> > >>> Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
> > >>> Reviewed-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
> > >>> ---
> > >>> * Changes since v3
> > >>> - Switch to new V4L2_EVENT_XFER_ERROR from V4L2_EVENT_EOS.
> > >>> - Call vb2_queue_error() when encountering the event.
> > >>>
> > >>> * Changes since v2
> > >>> - Log using vin_dbg() instead of v4l2_info().
> > >>> ---
> > >>>  drivers/media/platform/rcar-vin/rcar-v4l2.c | 17 ++++++++++++++++-
> > >>>  1 file changed, 16 insertions(+), 1 deletion(-)
> > >>>
> > >>> diff --git a/drivers/media/platform/rcar-vin/rcar-v4l2.c b/drivers/media/platform/rcar-vin/rcar-v4l2.c
> > >>> index a5bfa76fdac6e55a..bf17fdefe90aabf5 100644
> > >>> --- a/drivers/media/platform/rcar-vin/rcar-v4l2.c
> > >>> +++ b/drivers/media/platform/rcar-vin/rcar-v4l2.c
> > >>> @@ -992,9 +992,24 @@ void rvin_v4l2_unregister(struct rvin_dev *vin)
> > >>>  static void rvin_notify_video_device(struct rvin_dev *vin,
> > >>>  				     unsigned int notification, void *arg)
> > >>>  {
> > >>> +	const struct v4l2_event *event;
> > >>> +
> > >>>  	switch (notification) {
> > >>>  	case V4L2_DEVICE_NOTIFY_EVENT:
> > >>> -		v4l2_event_queue(&vin->vdev, arg);
> > >>> +		event = arg;
> > >>> +
> > >>> +		switch (event->type) {
> > >>> +		case V4L2_EVENT_XFER_ERROR:
> > >>> +			vin_dbg(vin,
> > >>> +				"Subdevice signaled transfer error, stopping.\n");
> > >>> +			rvin_stop_streaming(vin);
> > >>> +			vb2_queue_error(&vin->queue);
> > >>
> > >> Hmm, wouldn't it be the case that every driver that calls vb2_queue_error()
> > >> would also have to send this new event? Would it be possible to modify
> > >> vb2_queue_error() to raise this event? I haven't analyzed all the drivers
> > >> that call this function to see if that makes sense.
> > >>
> > >> Perhaps a separate new function vb2_queue_error_with_event() would also be
> > >> an option.
> > > 
> > > I think that maybe a good idea, but I think that would be needed on-top 
> > > of this work as I can't really test it. Here the rcar-csi2.ko is a 
> > > subdevice which detects the error condition and generates the event. And 
> > > this code is in rcar-vin.ko, the video device driver which reacts to the 
> > > event and then forwards it to user-space.
> > > 
> > > Or am I misunderstanding you? And you think I should remove the 
> > > v4l2_event_queue() below in favor of a new vb2_queue_error_with_event() 
> > > call?
> > 
> > Yes. And use vb2_queue_error_with_event in other drivers as well where
> > applicable. Hmm, it can't be called vb2_ since it is v4l2_ specific, so
> > perhaps v4l2_queue_error which takes a video_device and a vb2_queue as
> > arguments. I don't want this just in rcar since it makes perfect sense
> > as a generic event for such situations.
> 
> Handling errors in this way could be problematic, because a (CSI2) transfer
> error does not mean a total hardware failure on Rcar3. From my experience
> there are 3 kinds of CSI2 errors:
>   1. errors which occur sometimes, but do not affect video streaming
>   2. errors which occur on every start of streaming but usually do not
>      affect actual video streaming to VIN module after the start
>   3. fatal errors which require a "Software Reset" mentioned by Renesas in
>      the chapter 25.3.13 of the hardware manual in order to continue
>      video streaming
> This patch set makes the video pipeline unusable if we get errors described
> in the first scenario if I am not mistaken. In the second scenario the
> video pipeline was already not usable before because we end up in a
> continuous restart loop in rcar-csi2.c. And the third scenario is not
> really addressed by this patch set (or maybe the job is offloaded on to
> userspace)?
> 
> Maybe it's better to implement a recovery in a different way, which would
> consider the three mentioned error scenarios above:
>   1. Monitor rvin_irq after streaming has started, e.g. by using a timer
>      (I tried someting similar in [1])
>   2. restart the complete video pipeline via rvin_stop_streaming and
>      rvin_start_streaming if no frame is captured in a reasonable amount
>      of time (optionally after checking if a subdevice has sent a
>      V4L2_EVENT_XFER_ERROR).
> This would make the complete recovery process almost invisible for the
> application and avoid any application changes.
> 
> What do you think?

I think you bring up a few interesting points and for discussions sake I 
think we need to split it in two. One on how we could implement 
V4L2_EVENT_XFER_ERROR in a generic sens and one on how to best deal with 
errors in the R-Car Gen3 capture pipeline.

For the proposed V4L2_EVENT_XFER_ERROR the idea from my side is that a 
driver in the pipeline shall only raise this error (and propagate it to 
the effected video node) when there is no way to recover without 
involving user-space. So when this event happens an application at the 
very least needs to do a full s_stream cycle to restart the capture 
session.

On the particulars of the VIN capture pipeline the only way I found so 
far to freak out the CSI-2 receiver enough to trigger the event with this 
patch series is to disconnect the HDMI source from the ADV7481 while 
streaming and I don't think any in kernel recover method can fix that 
;-)

Over all I do agree with your idea that if we can recover from errors 
that are recovererable that is good. For this series I would like to 
focus on the former to get V4L2_EVENT_XFER_ERROR in and then if we have 
ways to provoke and test recovery in the Gen3 pipeline we can add such 
things to the drivers. Do this make sens or do you think the change in 
the R-Car CSI-2 driver to raise V4L2_EVENT_XFER_ERROR is to harsh? My 
motivation for is is the new datasheet and discussions with Renesas, but 
then again my only way to trigger CSI-2 errors is to pull cables while 
streaming so maybe I'm biased as such issues can't really be recover 
from...

Let me know what you think, I was about to spin a new version of this 
series.

> 
> [1] https://lore.kernel.org/linux-renesas-soc/1592588777-100596-1-git-send-email-mrodin@de.adit-jv.com/
> 
> > Regards,
> > 
> > 	Hans
> > 
> > > 
> > >>
> > >> Regards,
> > >>
> > >> 	Hans
> > >>
> > >>> +			break;
> > >>> +		default:
> > >>> +			break;
> > >>> +		}
> > >>> +
> > >>> +		v4l2_event_queue(&vin->vdev, event);
> > >>>  		break;
> > >>>  	default:
> > >>>  		break;
> > >>>
> > >>
> > > 
> > 
> 
> -- 
> Best Regards,
> Michael

-- 
Kind Regards,
Niklas Söderlund
