Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E886A4D02B8
	for <lists+linux-media@lfdr.de>; Mon,  7 Mar 2022 16:26:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243753AbiCGP1a (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 7 Mar 2022 10:27:30 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55594 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234575AbiCGP12 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 7 Mar 2022 10:27:28 -0500
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com [IPv6:2a00:1450:4864:20::136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8CEE592862
        for <linux-media@vger.kernel.org>; Mon,  7 Mar 2022 07:26:29 -0800 (PST)
Received: by mail-lf1-x136.google.com with SMTP id r4so1163948lfr.1
        for <linux-media@vger.kernel.org>; Mon, 07 Mar 2022 07:26:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ragnatech-se.20210112.gappssmtp.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=NOIzcEvUJjZv7NyLX6pqcFHPE5TQtoHEVNEgx8CcYmg=;
        b=isrvgnXVbmUyQbD8o/TU2fv4TK+a3tGGBopDectYhSzLJf2vPNmDWAAyAXsI5UVtdb
         kTk4mYBWHbzAhGz/ZFqnD3WlqqzNJL9k/0bJzRxcha+4J7spbLQG7+iD4eEvCOczoeFF
         m2Zj8ErEf35qsqNpOpItBMwxZIpA62cnruHCuRhWH1uDdxGwgvGh44teke5Uc/CQsRIV
         DiPHSqB/WrJ+P/4agX05dOXuJBFCHv636rlrigLt/ZKOI8Cb8m37DbI3gs7QRp5Ji5vt
         bW+6Kvpd9e3IDnqZdKUKz3zoJB73fz+IyuMY/L4CNuqp+LYGdnW7I746IbcPdpm7nJHE
         dJvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=NOIzcEvUJjZv7NyLX6pqcFHPE5TQtoHEVNEgx8CcYmg=;
        b=7FeEbQNbf23xl+Mj7vzePq/hS5/hv46dvOSokl1sKa18Pt5hHydSXhnEml9UEgqJzx
         hMtF5hlCLdcAnswv62coXE3Oq0COx0jBewu/y2uN6k0NoGwRwJ5csU+WqH6gFdjTlBt2
         5tXIzuNlbhLoA7cjlLUcHjgofsWT5/dBVi6UsiKpe5ciTySWcEFgrYleG3+bKP9lsnln
         H1u0vVjh54mv+9DDlNgkrRy8m7fWG4TNKDNnREGOgrb5gwlSn6Pyl+KZ74VPdsol/3CY
         FWDYhfL+17EPyMgqByuzyiYNBl+mnzvBCbvZkB7+AZQZhmyyhMZCS6s3Dys0o306wzdM
         u7wA==
X-Gm-Message-State: AOAM532Y5sGfwbbbJlQP2Z55psa22eVmMga3yOkZY8FwwT5kMPRsil0d
        SuH5LwueY4paD0untyhaRattAg==
X-Google-Smtp-Source: ABdhPJxSOVQd1EYYzly8py8+BJLs8GrOZVAI2Qno44PMijVxu3kN+mhzmsBVZgkDZr7W9fdavxeRVg==
X-Received: by 2002:a19:3856:0:b0:448:2019:3e94 with SMTP id d22-20020a193856000000b0044820193e94mr8288820lfj.370.1646666784910;
        Mon, 07 Mar 2022 07:26:24 -0800 (PST)
Received: from localhost (h-85-24-188-65.A463.priv.bahnhof.se. [85.24.188.65])
        by smtp.gmail.com with ESMTPSA id f21-20020ac251b5000000b004478fa4a744sm2411849lfk.56.2022.03.07.07.26.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Mar 2022 07:26:24 -0800 (PST)
Date:   Mon, 7 Mar 2022 16:26:23 +0100
From:   Niklas =?iso-8859-1?Q?S=F6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
To:     Michael Rodin <mrodin@de.adit-jv.com>
Cc:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>
Subject: Re: [PATCH 3/4] rcar-vin: Stop stream when subdevice signal transfer
 error
Message-ID: <YiYkH2EJTJItQlQf@oden.dyn.berto.se>
References: <20211108160220.767586-1-niklas.soderlund+renesas@ragnatech.se>
 <20211108160220.767586-4-niklas.soderlund+renesas@ragnatech.se>
 <1fddc966-5a23-63b4-185e-c17aa6d65b54@xs4all.nl>
 <YYlvqY21JvTtKysK@oden.dyn.berto.se>
 <9e405ed3-fb65-c16d-f84f-2530adbdc9b7@xs4all.nl>
 <20220302164834.GA23637@vmlxhi-121.adit-jv.com>
 <Yh/Q4XOc4HqY0W/h@oden.dyn.berto.se>
 <20220306200151.GA26691@vmlxhi-121.adit-jv.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220306200151.GA26691@vmlxhi-121.adit-jv.com>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Michael,

On 2022-03-06 21:01:51 +0100, Michael Rodin wrote:
> Hi Niklas,
> On Wed, Mar 02, 2022 at 09:17:37PM +0100, Niklas Söderlund wrote:
> > Hi Michael,
> > 
> > Thanks for your feedback.
> > 
> > On 2022-03-02 17:48:34 +0100, Michael Rodin wrote:
> > > Hi Niklas, Hans,
> > > 
> > > On Mon, Nov 15, 2021 at 03:26:53PM +0100, Hans Verkuil wrote:
> > > > On 08/11/2021 19:42, Niklas Söderlund wrote:
> > > > > Hi Hans,
> > > > > 
> > > > > On 2021-11-08 18:36:25 +0100, Hans Verkuil wrote:
> > > > >> On 08/11/2021 17:02, Niklas Söderlund wrote:
> > > > >>> When a subdevice signals a transfer error stop the VIN in addition to
> > > > >>> informing user-space of the event.
> > > > >>>
> > > > >>> Signed-off-by: Niklas Söderlund <https://urldefense.proofpoint.com/v2/url?u=http-3A__niklas.soderlund-2Brenesas-40ragnatech.se&d=DwIDAw&c=euGZstcaTDllvimEN8b7jXrwqOf-v5A_CdpgnVfiiMM&r=sWsgk3pKkv5GeIDM2RZlPY8TjNFU2D0oBeOj6QNBadE&m=iHMOF-_0M012_DHC6tHxMudpVvpBDqktUtXsKy4xpY0&s=isB_ZRIMVizn-pFdEQpwsKeg81nAE-QHMhjUzSozUZg&e=>
> > > > >>> Reviewed-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
> > > > >>> ---
> > > > >>> * Changes since v3
> > > > >>> - Switch to new V4L2_EVENT_XFER_ERROR from V4L2_EVENT_EOS.
> > > > >>> - Call vb2_queue_error() when encountering the event.
> > > > >>>
> > > > >>> * Changes since v2
> > > > >>> - Log using vin_dbg() instead of v4l2_info().
> > > > >>> ---
> > > > >>>  drivers/media/platform/rcar-vin/rcar-v4l2.c | 17 ++++++++++++++++-
> > > > >>>  1 file changed, 16 insertions(+), 1 deletion(-)
> > > > >>>
> > > > >>> diff --git a/drivers/media/platform/rcar-vin/rcar-v4l2.c b/drivers/media/platform/rcar-vin/rcar-v4l2.c
> > > > >>> index a5bfa76fdac6e55a..bf17fdefe90aabf5 100644
> > > > >>> --- a/drivers/media/platform/rcar-vin/rcar-v4l2.c
> > > > >>> +++ b/drivers/media/platform/rcar-vin/rcar-v4l2.c
> > > > >>> @@ -992,9 +992,24 @@ void rvin_v4l2_unregister(struct rvin_dev *vin)
> > > > >>>  static void rvin_notify_video_device(struct rvin_dev *vin,
> > > > >>>  				     unsigned int notification, void *arg)
> > > > >>>  {
> > > > >>> +	const struct v4l2_event *event;
> > > > >>> +
> > > > >>>  	switch (notification) {
> > > > >>>  	case V4L2_DEVICE_NOTIFY_EVENT:
> > > > >>> -		v4l2_event_queue(&vin->vdev, arg);
> > > > >>> +		event = arg;
> > > > >>> +
> > > > >>> +		switch (event->type) {
> > > > >>> +		case V4L2_EVENT_XFER_ERROR:
> > > > >>> +			vin_dbg(vin,
> > > > >>> +				"Subdevice signaled transfer error, stopping.\n");
> > > > >>> +			rvin_stop_streaming(vin);
> > > > >>> +			vb2_queue_error(&vin->queue);
> > > > >>
> > > > >> Hmm, wouldn't it be the case that every driver that calls vb2_queue_error()
> > > > >> would also have to send this new event? Would it be possible to modify
> > > > >> vb2_queue_error() to raise this event? I haven't analyzed all the drivers
> > > > >> that call this function to see if that makes sense.
> > > > >>
> > > > >> Perhaps a separate new function vb2_queue_error_with_event() would also be
> > > > >> an option.
> > > > > 
> > > > > I think that maybe a good idea, but I think that would be needed on-top 
> > > > > of this work as I can't really test it. Here the rcar-csi2.ko is a 
> > > > > subdevice which detects the error condition and generates the event. And 
> > > > > this code is in rcar-vin.ko, the video device driver which reacts to the 
> > > > > event and then forwards it to user-space.
> > > > > 
> > > > > Or am I misunderstanding you? And you think I should remove the 
> > > > > v4l2_event_queue() below in favor of a new vb2_queue_error_with_event() 
> > > > > call?
> > > > 
> > > > Yes. And use vb2_queue_error_with_event in other drivers as well where
> > > > applicable. Hmm, it can't be called vb2_ since it is v4l2_ specific, so
> > > > perhaps v4l2_queue_error which takes a video_device and a vb2_queue as
> > > > arguments. I don't want this just in rcar since it makes perfect sense
> > > > as a generic event for such situations.
> > > 
> > > Handling errors in this way could be problematic, because a (CSI2) transfer
> > > error does not mean a total hardware failure on Rcar3. From my experience
> > > there are 3 kinds of CSI2 errors:
> > >   1. errors which occur sometimes, but do not affect video streaming
> > >   2. errors which occur on every start of streaming but usually do not
> > >      affect actual video streaming to VIN module after the start
> > >   3. fatal errors which require a "Software Reset" mentioned by Renesas in
> > >      the chapter 25.3.13 of the hardware manual in order to continue
> > >      video streaming
> > > This patch set makes the video pipeline unusable if we get errors described
> > > in the first scenario if I am not mistaken. In the second scenario the
> > > video pipeline was already not usable before because we end up in a
> > > continuous restart loop in rcar-csi2.c. And the third scenario is not
> > > really addressed by this patch set (or maybe the job is offloaded on to
> > > userspace)?
> > > 
> > > Maybe it's better to implement a recovery in a different way, which would
> > > consider the three mentioned error scenarios above:
> > >   1. Monitor rvin_irq after streaming has started, e.g. by using a timer
> > >      (I tried someting similar in [1])
> > >   2. restart the complete video pipeline via rvin_stop_streaming and
> > >      rvin_start_streaming if no frame is captured in a reasonable amount
> > >      of time (optionally after checking if a subdevice has sent a
> > >      V4L2_EVENT_XFER_ERROR).
> > > This would make the complete recovery process almost invisible for the
> > > application and avoid any application changes.
> > > 
> > > What do you think?
> > 
> > I think you bring up a few interesting points and for discussions sake I 
> > think we need to split it in two. One on how we could implement 
> > V4L2_EVENT_XFER_ERROR in a generic sens and one on how to best deal with 
> > errors in the R-Car Gen3 capture pipeline.
> > 
> > For the proposed V4L2_EVENT_XFER_ERROR the idea from my side is that a 
> > driver in the pipeline shall only raise this error (and propagate it to 
> > the effected video node) when there is no way to recover without 
> > involving user-space. So when this event happens an application at the 
> > very least needs to do a full s_stream cycle to restart the capture 
> > session.
> 
> Isn't a "full s_stream cycle" something what _every_ capture driver or even
> vb2 framework could execute internally without offloading the task to user
> space? This new event will probably burden userspace too much. Every V4L2
> capture application which worked fine on other SoCs will fail on RCar3 in
> the use cases where transfer errors occur until application developers
> implement handling of this event. Signalling an error via vb2_queue_error
> should be probably sufficient, because it already signals via EPOLLERR/EIO
> to userspace to do a streamoff to clear this error (as per videobuf2-core.h).
> Maybe we just have to document that userspace should try to do a streamon
> after this? EPOLLERR/EIO errors will be propagated to any application, but
> not every application subscribes to V4L2 events...

I think doing a "full s_stream cycle" anywhere but from user-space to be 
wrong. It will mess-up the state of capture session, for example it 
would reset the capture sequence numbers which can freak out user-space 
3A processing. I think that if an error is hit that requires a full 
restart of the stream it should be driven from user-space.

But with this series the error is also signaled thru a vb2_queue_error 
right? What is added is for the applications that do look at V4L2 events 
to know why it happen right? I mean the vb2 queue can signal error but 
the event can tell the application if it was due to V4L2_EVENT_EOS,
V4L2_EVENT_SOURCE_CHANGE or that something went very wrong using the 
proposed V4L2_EVENT_XFER_ERROR event.

> 
> I took a look at the other drivers and found that imx-media-csi.c seems to
> follow a similar approach to what I described in my last email. There is a
> 2 second timer, which monitors the csi_idmac_eof_interrupt and signals a
> fatal error to the capture device via vb2_queue_error when this timer
> expires. Monitoring end-of-frame interrupts looks also like a more robust
> solution, because in this way we know reliably when something has failed
> in the pipeline in contrast to reacting to start-of-transfer errors, which
> can be false positives. I think it would be good to follow a similar
> approach by adding an EOF timer to rvin_irq. This should also cover errors
> on the digital pin camera interface if we get any in the future. After
> this we could add a few additional improvements:
>  1. configurability of the EOF timeout. 2 seconds can be too much,
>     especially for automotive use cases. Probably this timeout could be
>     reduced depending on the source frame rate.
>  2. internal streamoff/streamon cycle after the timer expires instead of
>     calling vb2_queue_error

I would need to deep-dive in the details but in general I think anything 
we can do to improve the robustness of capture is good. And if we within 
a subdevice can recover form errors without causing issues that is good.  
But for the work in this series I think it's two different questions.  
One is how and if we can add an event to signal something went very 
wrong and the capture pipeline can't recover and have stopped, the other 
is how we in individual drivers try to detect and recover from errors.

> 
> > On the particulars of the VIN capture pipeline the only way I found so 
> > far to freak out the CSI-2 receiver enough to trigger the event with this 
> > patch series is to disconnect the HDMI source from the ADV7481 while 
> > streaming and I don't think any in kernel recover method can fix that 
> > ;-)
> 
> In this case I would expect an V4L2_EVENT_EOS or V4L2_EVENT_SOURCE_CHANGE
> from the adv748x driver. Maybe we should call vb2_queue_error for these
> events as well. But the described EOF timeout approach could also cover
> this use case.

Hum, is not those events more stable to report "planed" events? From the 
docs.

* V4L2_EVENT_EOS
  This event is triggered when the end of a stream is reached. This is 
  typically used with MPEG decoders to report to the application when 
  the last of the MPEG stream has been decoded.

* V4L2_EVENT_SOURCE_CHANGE
  This event is triggered when a source parameter change is detected 
  during runtime by the video device. It can be a runtime resolution 
  change triggered by a video decoder or the format change happening on 
  an input connector. This event requires that the id matches the input 
  index (when used with a video device node) or the pad index (when used 
  with a subdevice node) from which you want to receive events.

  This event has a struct v4l2_event_src_change associated with it. The 
  changes bitfield denotes what has changed for the subscribed pad. If 
  multiple events occurred before application could dequeue them, then 
  the changes will have the ORed value of all the events generated.

While I think the idea for V4L2_EVENT_XFER_ERROR more shall describe the 
case something "unnatural" happens that we can't really recover from.  
Maybe "ran over cable with lawn mower". I only brought up pulling the 
cable as it's the only way I have to trigger it easily (I don't have a 
lawn :-).

> 
> > Over all I do agree with your idea that if we can recover from errors 
> > that are recovererable that is good. For this series I would like to 
> > focus on the former to get V4L2_EVENT_XFER_ERROR in and then if we have 
> > ways to provoke and test recovery in the Gen3 pipeline we can add such 
> > things to the drivers. Do this make sens or do you think the change in 
> > the R-Car CSI-2 driver to raise V4L2_EVENT_XFER_ERROR is to harsh? My 
> > motivation for is is the new datasheet and discussions with Renesas, but 
> > then again my only way to trigger CSI-2 errors is to pull cables while 
> > streaming so maybe I'm biased as such issues can't really be recover 
> > from...
> > 
> > Let me know what you think, I was about to spin a new version of this 
> > series.
> 
> I believe this event might be useful for subdevice drivers which want to
> request a streamoff/streamon cycle from the capture driver but it's
> probably not useful for the RCar3 CSI2 driver in the current state because
> reacting to start-of-transfer errors can be risky due to false positives.
> 
> What do you think about implementing an approach similar to imx-media-csi.c
> first?

I'm not sure really what I think. Maybe if I understand better how to 
generate these false positives it would help me understand. I also get a 
feeling we are trying to solve two different problems. I want to find a 
way to just terminate capture when an unrecoverable error is hit while I 
get the feeling you are more focused on how to recover from recoverable 
errors in the best way. Maybe I'm missing understanding something, sorry 
if I am.

I think both problems are important but do not overlap to a large 
degree.

> 
> > > 
> > > [1] https://urldefense.proofpoint.com/v2/url?u=https-3A__lore.kernel.org_linux-2Drenesas-2Dsoc_1592588777-2D100596-2D1-2Dgit-2Dsend-2Demail-2Dmrodin-40de.adit-2Djv.com_&d=DwIDAw&c=euGZstcaTDllvimEN8b7jXrwqOf-v5A_CdpgnVfiiMM&r=sWsgk3pKkv5GeIDM2RZlPY8TjNFU2D0oBeOj6QNBadE&m=iHMOF-_0M012_DHC6tHxMudpVvpBDqktUtXsKy4xpY0&s=B4GPIasxu8VP04sLBFvhbmr8yhotp6GcfDQqEKjqeAc&e=
> > > 
> > > > Regards,
> > > > 
> > > > 	Hans
> > > > 
> > > > > 
> > > > >>
> > > > >> Regards,
> > > > >>
> > > > >> 	Hans
> > > > >>
> > > > >>> +			break;
> > > > >>> +		default:
> > > > >>> +			break;
> > > > >>> +		}
> > > > >>> +
> > > > >>> +		v4l2_event_queue(&vin->vdev, event);
> > > > >>>  		break;
> > > > >>>  	default:
> > > > >>>  		break;
> > > > >>>
> > > > >>
> > > > > 
> > > > 
> > > 
> > > -- 
> > > Best Regards,
> > > Michael
> > 
> > -- 
> > Kind Regards,
> > Niklas Söderlund
> 
> -- 
> Best Regards,
> Michael

-- 
Kind Regards,
Niklas Söderlund
