Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2F2DA4D3A59
	for <lists+linux-media@lfdr.de>; Wed,  9 Mar 2022 20:29:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237858AbiCIT3a (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 9 Mar 2022 14:29:30 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35792 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238136AbiCIT2P (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 9 Mar 2022 14:28:15 -0500
Received: from smtp1.de.adit-jv.com (smtp1.de.adit-jv.com [93.241.18.167])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 09DEAD5F66;
        Wed,  9 Mar 2022 11:27:13 -0800 (PST)
Received: from hi2exch02.adit-jv.com (hi2exch02.adit-jv.com [10.72.92.28])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by smtp1.de.adit-jv.com (Postfix) with ESMTPS id B64C13C00BF;
        Wed,  9 Mar 2022 20:27:11 +0100 (CET)
Received: from vmlxhi-121.adit-jv.com (10.72.92.132) by hi2exch02.adit-jv.com
 (10.72.92.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2308.21; Wed, 9 Mar
 2022 20:27:11 +0100
Date:   Wed, 9 Mar 2022 20:27:07 +0100
From:   Michael Rodin <mrodin@de.adit-jv.com>
To:     Niklas =?utf-8?Q?S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
CC:     Michael Rodin <mrodin@de.adit-jv.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>
Subject: Re: [PATCH 3/4] rcar-vin: Stop stream when subdevice signal transfer
 error
Message-ID: <20220309192707.GA62903@vmlxhi-121.adit-jv.com>
References: <20211108160220.767586-1-niklas.soderlund+renesas@ragnatech.se>
 <20211108160220.767586-4-niklas.soderlund+renesas@ragnatech.se>
 <1fddc966-5a23-63b4-185e-c17aa6d65b54@xs4all.nl>
 <YYlvqY21JvTtKysK@oden.dyn.berto.se>
 <9e405ed3-fb65-c16d-f84f-2530adbdc9b7@xs4all.nl>
 <20220302164834.GA23637@vmlxhi-121.adit-jv.com>
 <Yh/Q4XOc4HqY0W/h@oden.dyn.berto.se>
 <20220306200151.GA26691@vmlxhi-121.adit-jv.com>
 <YiYkH2EJTJItQlQf@oden.dyn.berto.se>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <YiYkH2EJTJItQlQf@oden.dyn.berto.se>
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

Hi Niklas,

On Mon, Mar 07, 2022 at 04:26:23PM +0100, Niklas Söderlund wrote:
> Hi Michael,
> 
> On 2022-03-06 21:01:51 +0100, Michael Rodin wrote:
> > Hi Niklas,
> > On Wed, Mar 02, 2022 at 09:17:37PM +0100, Niklas Söderlund wrote:
> > > Hi Michael,
> > > 
> > > Thanks for your feedback.
> > > 
> > > On 2022-03-02 17:48:34 +0100, Michael Rodin wrote:
> > > > Hi Niklas, Hans,
> > > > 
> > > > On Mon, Nov 15, 2021 at 03:26:53PM +0100, Hans Verkuil wrote:
> > > > > On 08/11/2021 19:42, Niklas Söderlund wrote:
> > > > > > Hi Hans,
> > > > > > 
> > > > > > On 2021-11-08 18:36:25 +0100, Hans Verkuil wrote:
> > > > > >> On 08/11/2021 17:02, Niklas Söderlund wrote:
> > > > > >>> When a subdevice signals a transfer error stop the VIN in addition to
> > > > > >>> informing user-space of the event.
> > > > > >>>
> > > > > >>> Signed-off-by: Niklas Söderlund <https://urldefense.proofpoint.com/v2/url?u=http-3A__niklas.soderlund-2Brenesas-40ragnatech.se&d=DwIDAw&c=euGZstcaTDllvimEN8b7jXrwqOf-v5A_CdpgnVfiiMM&r=sWsgk3pKkv5GeIDM2RZlPY8TjNFU2D0oBeOj6QNBadE&m=iHMOF-_0M012_DHC6tHxMudpVvpBDqktUtXsKy4xpY0&s=isB_ZRIMVizn-pFdEQpwsKeg81nAE-QHMhjUzSozUZg&e=>
> > > > > >>> Reviewed-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
> > > > > >>> ---
> > > > > >>> * Changes since v3
> > > > > >>> - Switch to new V4L2_EVENT_XFER_ERROR from V4L2_EVENT_EOS.
> > > > > >>> - Call vb2_queue_error() when encountering the event.
> > > > > >>>
> > > > > >>> * Changes since v2
> > > > > >>> - Log using vin_dbg() instead of v4l2_info().
> > > > > >>> ---
> > > > > >>>  drivers/media/platform/rcar-vin/rcar-v4l2.c | 17 ++++++++++++++++-
> > > > > >>>  1 file changed, 16 insertions(+), 1 deletion(-)
> > > > > >>>
> > > > > >>> diff --git a/drivers/media/platform/rcar-vin/rcar-v4l2.c b/drivers/media/platform/rcar-vin/rcar-v4l2.c
> > > > > >>> index a5bfa76fdac6e55a..bf17fdefe90aabf5 100644
> > > > > >>> --- a/drivers/media/platform/rcar-vin/rcar-v4l2.c
> > > > > >>> +++ b/drivers/media/platform/rcar-vin/rcar-v4l2.c
> > > > > >>> @@ -992,9 +992,24 @@ void rvin_v4l2_unregister(struct rvin_dev *vin)
> > > > > >>>  static void rvin_notify_video_device(struct rvin_dev *vin,
> > > > > >>>  				     unsigned int notification, void *arg)
> > > > > >>>  {
> > > > > >>> +	const struct v4l2_event *event;
> > > > > >>> +
> > > > > >>>  	switch (notification) {
> > > > > >>>  	case V4L2_DEVICE_NOTIFY_EVENT:
> > > > > >>> -		v4l2_event_queue(&vin->vdev, arg);
> > > > > >>> +		event = arg;
> > > > > >>> +
> > > > > >>> +		switch (event->type) {
> > > > > >>> +		case V4L2_EVENT_XFER_ERROR:
> > > > > >>> +			vin_dbg(vin,
> > > > > >>> +				"Subdevice signaled transfer error, stopping.\n");
> > > > > >>> +			rvin_stop_streaming(vin);
> > > > > >>> +			vb2_queue_error(&vin->queue);
> > > > > >>
> > > > > >> Hmm, wouldn't it be the case that every driver that calls vb2_queue_error()
> > > > > >> would also have to send this new event? Would it be possible to modify
> > > > > >> vb2_queue_error() to raise this event? I haven't analyzed all the drivers
> > > > > >> that call this function to see if that makes sense.
> > > > > >>
> > > > > >> Perhaps a separate new function vb2_queue_error_with_event() would also be
> > > > > >> an option.
> > > > > > 
> > > > > > I think that maybe a good idea, but I think that would be needed on-top 
> > > > > > of this work as I can't really test it. Here the rcar-csi2.ko is a 
> > > > > > subdevice which detects the error condition and generates the event. And 
> > > > > > this code is in rcar-vin.ko, the video device driver which reacts to the 
> > > > > > event and then forwards it to user-space.
> > > > > > 
> > > > > > Or am I misunderstanding you? And you think I should remove the 
> > > > > > v4l2_event_queue() below in favor of a new vb2_queue_error_with_event() 
> > > > > > call?
> > > > > 
> > > > > Yes. And use vb2_queue_error_with_event in other drivers as well where
> > > > > applicable. Hmm, it can't be called vb2_ since it is v4l2_ specific, so
> > > > > perhaps v4l2_queue_error which takes a video_device and a vb2_queue as
> > > > > arguments. I don't want this just in rcar since it makes perfect sense
> > > > > as a generic event for such situations.
> > > > 
> > > > Handling errors in this way could be problematic, because a (CSI2) transfer
> > > > error does not mean a total hardware failure on Rcar3. From my experience
> > > > there are 3 kinds of CSI2 errors:
> > > >   1. errors which occur sometimes, but do not affect video streaming
> > > >   2. errors which occur on every start of streaming but usually do not
> > > >      affect actual video streaming to VIN module after the start
> > > >   3. fatal errors which require a "Software Reset" mentioned by Renesas in
> > > >      the chapter 25.3.13 of the hardware manual in order to continue
> > > >      video streaming
> > > > This patch set makes the video pipeline unusable if we get errors described
> > > > in the first scenario if I am not mistaken. In the second scenario the
> > > > video pipeline was already not usable before because we end up in a
> > > > continuous restart loop in rcar-csi2.c. And the third scenario is not
> > > > really addressed by this patch set (or maybe the job is offloaded on to
> > > > userspace)?
> > > > 
> > > > Maybe it's better to implement a recovery in a different way, which would
> > > > consider the three mentioned error scenarios above:
> > > >   1. Monitor rvin_irq after streaming has started, e.g. by using a timer
> > > >      (I tried someting similar in [1])
> > > >   2. restart the complete video pipeline via rvin_stop_streaming and
> > > >      rvin_start_streaming if no frame is captured in a reasonable amount
> > > >      of time (optionally after checking if a subdevice has sent a
> > > >      V4L2_EVENT_XFER_ERROR).
> > > > This would make the complete recovery process almost invisible for the
> > > > application and avoid any application changes.
> > > > 
> > > > What do you think?
> > > 
> > > I think you bring up a few interesting points and for discussions sake I 
> > > think we need to split it in two. One on how we could implement 
> > > V4L2_EVENT_XFER_ERROR in a generic sens and one on how to best deal with 
> > > errors in the R-Car Gen3 capture pipeline.
> > > 
> > > For the proposed V4L2_EVENT_XFER_ERROR the idea from my side is that a 
> > > driver in the pipeline shall only raise this error (and propagate it to 
> > > the effected video node) when there is no way to recover without 
> > > involving user-space. So when this event happens an application at the 
> > > very least needs to do a full s_stream cycle to restart the capture 
> > > session.
> > 
> > Isn't a "full s_stream cycle" something what _every_ capture driver or even
> > vb2 framework could execute internally without offloading the task to user
> > space? This new event will probably burden userspace too much. Every V4L2
> > capture application which worked fine on other SoCs will fail on RCar3 in
> > the use cases where transfer errors occur until application developers
> > implement handling of this event. Signalling an error via vb2_queue_error
> > should be probably sufficient, because it already signals via EPOLLERR/EIO
> > to userspace to do a streamoff to clear this error (as per videobuf2-core.h).
> > Maybe we just have to document that userspace should try to do a streamon
> > after this? EPOLLERR/EIO errors will be propagated to any application, but
> > not every application subscribes to V4L2 events...
> 
> I think doing a "full s_stream cycle" anywhere but from user-space to be 
> wrong. It will mess-up the state of capture session, for example it 
> would reset the capture sequence numbers which can freak out user-space 
> 3A processing. I think that if an error is hit that requires a full 
> restart of the stream it should be driven from user-space.
> 
> But with this series the error is also signaled thru a vb2_queue_error 
> right? What is added is for the applications that do look at V4L2 events 
> to know why it happen right? I mean the vb2 queue can signal error but 
> the event can tell the application if it was due to V4L2_EVENT_EOS,
> V4L2_EVENT_SOURCE_CHANGE or that something went very wrong using the 
> proposed V4L2_EVENT_XFER_ERROR event.

Agree, now I see that it makes sense to have an additional V4L2 event so
when userspace receives EPOLLERR or EIO, it can check what went wrong by
dequeuing the received event. If the event was an xfer error, userspace can
restart the streaming session once and wait for the next EPOLLERR or EIO.

> > 
> > I took a look at the other drivers and found that imx-media-csi.c seems to
> > follow a similar approach to what I described in my last email. There is a
> > 2 second timer, which monitors the csi_idmac_eof_interrupt and signals a
> > fatal error to the capture device via vb2_queue_error when this timer
> > expires. Monitoring end-of-frame interrupts looks also like a more robust
> > solution, because in this way we know reliably when something has failed
> > in the pipeline in contrast to reacting to start-of-transfer errors, which
> > can be false positives. I think it would be good to follow a similar
> > approach by adding an EOF timer to rvin_irq. This should also cover errors
> > on the digital pin camera interface if we get any in the future. After
> > this we could add a few additional improvements:
> >  1. configurability of the EOF timeout. 2 seconds can be too much,
> >     especially for automotive use cases. Probably this timeout could be
> >     reduced depending on the source frame rate.
> >  2. internal streamoff/streamon cycle after the timer expires instead of
> >     calling vb2_queue_error
> 
> I would need to deep-dive in the details but in general I think anything 
> we can do to improve the robustness of capture is good. And if we within 
> a subdevice can recover form errors without causing issues that is good.  
> But for the work in this series I think it's two different questions.  
> One is how and if we can add an event to signal something went very 
> wrong and the capture pipeline can't recover and have stopped, the other 
> is how we in individual drivers try to detect and recover from errors.

Agree, this is rather an idea for the second question and a suggestion how
the patches 3 and 4 could be improved.

> > 
> > > On the particulars of the VIN capture pipeline the only way I found so 
> > > far to freak out the CSI-2 receiver enough to trigger the event with this 
> > > patch series is to disconnect the HDMI source from the ADV7481 while 
> > > streaming and I don't think any in kernel recover method can fix that 
> > > ;-)
> > 
> > In this case I would expect an V4L2_EVENT_EOS or V4L2_EVENT_SOURCE_CHANGE
> > from the adv748x driver. Maybe we should call vb2_queue_error for these
> > events as well. But the described EOF timeout approach could also cover
> > this use case.
> 
> Hum, is not those events more stable to report "planed" events? From the 
> docs.
> 
> * V4L2_EVENT_EOS
>   This event is triggered when the end of a stream is reached. This is 
>   typically used with MPEG decoders to report to the application when 
>   the last of the MPEG stream has been decoded.
> 
> * V4L2_EVENT_SOURCE_CHANGE
>   This event is triggered when a source parameter change is detected 
>   during runtime by the video device. It can be a runtime resolution 
>   change triggered by a video decoder or the format change happening on 
>   an input connector. This event requires that the id matches the input 
>   index (when used with a video device node) or the pad index (when used 
>   with a subdevice node) from which you want to receive events.
> 
>   This event has a struct v4l2_event_src_change associated with it. The 
>   changes bitfield denotes what has changed for the subscribed pad. If 
>   multiple events occurred before application could dequeue them, then 
>   the changes will have the ORed value of all the events generated.
> 
> While I think the idea for V4L2_EVENT_XFER_ERROR more shall describe the 
> case something "unnatural" happens that we can't really recover from.  
> Maybe "ran over cable with lawn mower". I only brought up pulling the 
> cable as it's the only way I have to trigger it easily (I don't have a 
> lawn :-).

I was thinking about this discussion [1]. If I understand the
recommendation from Hans correctly, userspace should get a SOURCE_CHANGE
event and then query dv timings to know whether HDMI cable has been
disconnected or connected.

[1] Subject: "Re: [PATCH 1/3] v4l2-subdev: Add subdev ioctl support for ENUM/GET/SET INPUT"

> > 
> > > Over all I do agree with your idea that if we can recover from errors 
> > > that are recovererable that is good. For this series I would like to 
> > > focus on the former to get V4L2_EVENT_XFER_ERROR in and then if we have 
> > > ways to provoke and test recovery in the Gen3 pipeline we can add such 
> > > things to the drivers. Do this make sens or do you think the change in 
> > > the R-Car CSI-2 driver to raise V4L2_EVENT_XFER_ERROR is to harsh? My 
> > > motivation for is is the new datasheet and discussions with Renesas, but 
> > > then again my only way to trigger CSI-2 errors is to pull cables while 
> > > streaming so maybe I'm biased as such issues can't really be recover 
> > > from...
> > > 
> > > Let me know what you think, I was about to spin a new version of this 
> > > series.
> > 
> > I believe this event might be useful for subdevice drivers which want to
> > request a streamoff/streamon cycle from the capture driver but it's
> > probably not useful for the RCar3 CSI2 driver in the current state because
> > reacting to start-of-transfer errors can be risky due to false positives.
> > 
> > What do you think about implementing an approach similar to imx-media-csi.c
> > first?
> 
> I'm not sure really what I think. Maybe if I understand better how to 
> generate these false positives it would help me understand. I also get a 
> feeling we are trying to solve two different problems. I want to find a 
> way to just terminate capture when an unrecoverable error is hit while I 
> get the feeling you are more focused on how to recover from recoverable 
> errors in the best way. Maybe I'm missing understanding something, sorry 
> if I am.
> 
> I think both problems are important but do not overlap to a large 
> degree.

I think, one possibility to generate false positive CSI2 errors on a
Salvator board is by manipulating CSI2-related registers in the adv7482. I
took a look at the adv7482 hardware manual and I have found one method by
reenabling automatically calculated DPHY timings:

1. start streaming from HDMI (I am using a V-SG4K-HDI signal generator which
outputs 1080P@60).
# media-ctl -d /dev/media0 -r
# media-ctl -d /dev/media0 -l "'adv748x 4-0070 hdmi':1 -> 'adv748x 4-0070 txa':0 [1]"
# media-ctl -d /dev/media0 -l "'rcar_csi2 feaa0000.csi2':1 -> 'VIN1 output':0 [1]"
# media-ctl -d /dev/media0 --set-v4l2 "'adv748x 4-0070 hdmi':1 [fmt:RGB888_1X24/1920x1080 field:none]"
# media-ctl -d /dev/media0 --set-v4l2 "'adv748x 4-0070 txa':1 [fmt:RGB888_1X24/1920x1080 field:none]"
# media-ctl -d /dev/media0 --set-v4l2 "'rcar_csi2 feaa0000.csi2':1 [fmt:RGB888_1X24/1920x1080 field:none]"
# v4l2-ctl --stream-mmap --device /dev/video1 --verbose
2. in another shell reenable calculation of the DPHY timings in adv7482:
# modprobe i2c-dev
# i2cset -f -y 4 0x64 0x00 0x04 && i2cset -f -y 4 0x64 0x00 0x24
# dmesg
[ 8806.752375] rcar-csi2 feaa0000.csi2: Transfer error, restarting CSI-2 receiver
[ 8806.759642] rcar-csi2 feaa0000.csi2: Transfer error, restarting CSI-2 receiver
[ 8806.766881] rcar-csi2 feaa0000.csi2: Transfer error, restarting CSI-2 receiver
[ 8806.774109] rcar-csi2 feaa0000.csi2: Transfer error, restarting CSI-2 receiver
# 

There will be some transfer errors, however I have disabled the restart in the
CSI2 driver so rcar-csi2 will not attempt to recover any more. In
approximately half of the trials I see that streaming can continue despite
CSI2 errors. In the other half of my trials streaming stops and I have to
restart it via v4l2-ctl. Maybe its even possible to simulate CSI2 errors
which are completely harmless by changing other adv7482 registers. Or was
my example already helpful to understand what I mean by those false positives?
I hope this makes clear, why its not good to stop streaming and trigger the
xfer error event each time we get a CSI2 error but instead setup a timeout
and wait for the frame like its done in the imx driver.

> > 
> > > > 
> > > > [1] https://urldefense.proofpoint.com/v2/url?u=https-3A__lore.kernel.org_linux-2Drenesas-2Dsoc_1592588777-2D100596-2D1-2Dgit-2Dsend-2Demail-2Dmrodin-40de.adit-2Djv.com_&d=DwIDAw&c=euGZstcaTDllvimEN8b7jXrwqOf-v5A_CdpgnVfiiMM&r=sWsgk3pKkv5GeIDM2RZlPY8TjNFU2D0oBeOj6QNBadE&m=iHMOF-_0M012_DHC6tHxMudpVvpBDqktUtXsKy4xpY0&s=B4GPIasxu8VP04sLBFvhbmr8yhotp6GcfDQqEKjqeAc&e=
> > > > 
> > > > > Regards,
> > > > > 
> > > > > 	Hans
> > > > > 
> > > > > > 
> > > > > >>
> > > > > >> Regards,
> > > > > >>
> > > > > >> 	Hans
> > > > > >>
> > > > > >>> +			break;
> > > > > >>> +		default:
> > > > > >>> +			break;
> > > > > >>> +		}
> > > > > >>> +
> > > > > >>> +		v4l2_event_queue(&vin->vdev, event);
> > > > > >>>  		break;
> > > > > >>>  	default:
> > > > > >>>  		break;
> > > > > >>>
> > > > > >>
> > > > > > 
> > > > > 
> > > > 
> > > > -- 
> > > > Best Regards,
> > > > Michael
> > > 
> > > -- 
> > > Kind Regards,
> > > Niklas Söderlund
> > 
> > -- 
> > Best Regards,
> > Michael
> 
> -- 
> Kind Regards,
> Niklas Söderlund

-- 
Best Regards,
Michael
