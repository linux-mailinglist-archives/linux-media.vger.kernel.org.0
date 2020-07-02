Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 295A5212EFC
	for <lists+linux-media@lfdr.de>; Thu,  2 Jul 2020 23:42:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726033AbgGBVmM (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 2 Jul 2020 17:42:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57880 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725994AbgGBVmL (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 2 Jul 2020 17:42:11 -0400
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com [IPv6:2a00:1450:4864:20::243])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 633FCC08C5C1
        for <linux-media@vger.kernel.org>; Thu,  2 Jul 2020 14:42:11 -0700 (PDT)
Received: by mail-lj1-x243.google.com with SMTP id s1so34161273ljo.0
        for <linux-media@vger.kernel.org>; Thu, 02 Jul 2020 14:42:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ragnatech-se.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=FRl/DyIHs4sFPDBuyU3c3MC0e8z8bQnJMkePNYp6cfM=;
        b=MbHSCVqYIkL/KbF7JCyYY2wx1OUSp8rPThiXhu/kDsjSGeHrNiSgz5KpNat84Q3y+f
         w4u5c9guBWOz6nhUUlXno9DpoSO4Y7kK+eCLOHTFTTkgOZKlxt3nVsN7S7m8+UMbqxI1
         ppxlkSvY+aHMr0Z81WGcP+sE8Vrn7vxKobgvY0X91tFHnJp8QhH4hsEUGQQJ5Ll1ZNAV
         0Jbu7QGVnnOGiWpWT3XXJrSxsA35Eoe1IpwcZWiTRgEqsdEWzH3FL4mND1LONOo62fnq
         ybSwAAkGiirT8Ci2ueIhqEtXj5oSBFxZBnmABrEncA3CNxsyKIWVIWZgSn6ysN0Jmqtv
         LCdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=FRl/DyIHs4sFPDBuyU3c3MC0e8z8bQnJMkePNYp6cfM=;
        b=OFM1/dzZTtaqe2hedoG6kFTUqv64MmMNkIBlcKEDiu1REvcxthR8u0f1Z4ht593DCA
         83STnEKcLkp/R5B6Uxq7/1W4wL6R386ZslJaA4Q7k8a9u6QT/8CT9latK/99iRT8Ytjj
         pnYQokAMlhjZb3bo6EQo6O5Mf+jcRWmEi/heyaHAMp9Ki/Hf/mSdVzhrTFQruVZFPqSm
         d7Sk7HqYsXz9OTo+AoqDITf1veBsQlRA//NxysX0orgv4S+aHQxVzolyctLZdzqDRvO2
         ZpkE8ZsRrt3vN3UpIShy8Ha/s+FgfN/qSGZWyQMRyTpL1pYCcrjh1nJCc4F0lAjM+6YW
         xu6A==
X-Gm-Message-State: AOAM532kFvXGbhu9gcMdv8kmC5RTZyJ4Uesn93//lK0SsUuEhtVX4s9T
        GkHaVgDBDEaUKKJGV+oeGCitsg==
X-Google-Smtp-Source: ABdhPJw1le4XZxNhQjfxvjTspEmFHWfqahaHP1TuXmto9kPEKMVDsLrbFa+lppBc/cy2vGqqCiU53Q==
X-Received: by 2002:a2e:574b:: with SMTP id r11mr5739143ljd.417.1593726129560;
        Thu, 02 Jul 2020 14:42:09 -0700 (PDT)
Received: from localhost (h-209-203.A463.priv.bahnhof.se. [155.4.209.203])
        by smtp.gmail.com with ESMTPSA id q2sm3746183ljp.135.2020.07.02.14.42.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jul 2020 14:42:08 -0700 (PDT)
Date:   Thu, 2 Jul 2020 23:42:08 +0200
From:   Niklas =?iso-8859-1?Q?S=F6derlund?= 
        <niklas.soderlund@ragnatech.se>
To:     Michael Rodin <mrodin@de.adit-jv.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org, michael@rodin.online,
        efriedrich@de.adit-jv.com, erosca@de.adit-jv.com
Subject: Re: [PATCH 1/2] [RFC] media: rcar-vin: send a V4L2 event to vdev if
 no frame captured after a timeout
Message-ID: <20200702214208.GA3158543@oden.dyn.berto.se>
References: <1592588777-100596-1-git-send-email-mrodin@de.adit-jv.com>
 <20200630221710.GM2365286@oden.dyn.berto.se>
 <20200702123341.GA65262@vmlxhi-121.adit-jv.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200702123341.GA65262@vmlxhi-121.adit-jv.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Michael,

On 2020-07-02 14:33:41 +0200, Michael Rodin wrote:
> Hi Niklas,
> 
> On Wed, Jul 01, 2020 at 12:17:10AM +0200, Niklas Söderlund wrote:
> > Hi Michael,
> > 
> > Thanks for your RFC.
> 
> Thanks your your feedback!
> 
> > On 2020-06-19 19:46:10 +0200, Michael Rodin wrote:
> > > Data flow from an upstream subdevice can stop permanently due to:
> > >  - CSI2 transmission errors
> > >  - silent failure of the source subdevice
> > >  - disconnection of the source subdevice
> > > In those cases userspace waits for new buffers for an infinitely long time.
> > > In order to address this issue, use a timer to monitor, that rvin_irq() is
> > > capturing at least one frame within a IRQ_TIMEOUT_MS period. Otherwise send
> > > a new private v4l2 event to userspace. This event is exported to userspace
> > > via a new uapi header.
> > 
> > I think there is value for user-space to detecting the error cases 
> > above. But I think the problem could be addressed at a different lever.  
> > Defining a VIN specific events and controls for something that applies 
> > any video device might not be the neatest solution.
> > 
> > Another thing hits me when reading this series, could this not be done 
> > in user-space? In 2/2 you add a control which sets the timeout based on 
> > the framerate, so user-space must know about that to be able to set the 
> > control. User-space also knows when it receives/dequeus a buffer from 
> > the video device so the timeout logic could be implemented in the 
> > application. Given that the application anyhow needs special care to 
> > handle the VIN specific event and control I wonder if it's not neater to 
> > make it handle all of it. Do you see any specific benefit of having 
> > parts of it in the driver?
> 
> Originally I have started this patch series to implement a replacement for
> the CSI-2 error handling you have added in
> commit 4ab44ff ("media: rcar-csi2: restart CSI-2 link if error is detected"),
> which is not correct for multiple reasons:
> 1. The commit message states that the user is informed that something is
>    not right. But you have just added new messages which only appear in
>    dmesg. This might be sufficient for a desktop PC but not for an embedded
>    system, where the user normally can not see dmesg log. So I think that
>    V4L2 events are the correct solution for this kind of notification,
>    because they are passed directly to the application and the developer
>    can implement handling for this issue or display an error in the
>    custom human-machine interface.
> 2. It is not correct to restart the CSI-2 link if you don't restart VIN
>    module as well. Renesas HW manual R19UH0105EJ0200 Rev.2.00
>    (Jul 31, 2019) requires a reset or stop of capture in the VIN module
>    before a reset of CSI-2 module (chapter 25.3.13 "Software Reset"). This
>    also applies to CSI-2 error handling.
> 3. The CSI-2 driver restarts CSI-2 module for any CSI-2 error. However not
>    all CSI2 errors are critical. In some setups they are really harmless so
>    streaming can continue without any unnecessary restart. In some setups
>    they _always_ occur at each start of streaming and are harmless as
>    well, so automatic restart in CSI-2 module ends in an endless restart
>    loop, which never comes to an end and breaks streaming instead of any
>    help. It is better to leave such errors unhandled and therefore it is
>    important to detect whether DMA transfers really stop in rvin_irq().
> 4. Video streaming applications in the automotive/embedded industry often
>    want to control when the video streaming pipeline is stopped or started
>    to be able to do some tasks in between, so an automatic restart of the
>    pipeline is not acceptable for them. It should be at least optional and
>    we should do this in rcar-dma.c, e.g. in the proposed irq timeout
>    function. However I am not sure yet how to implement a restart of
>    streaming inside of the rcar-vin driver correctly.
> 
> I think, my patch series provides technically a good solution for the
> described issues. Also it is generic enough to allow also handling of
> failures in upstream subdevices connected to an R-Car3 CSI2 receiver or
> even parallel video input devices in cases when such failures can not be
> fixed or detected in the subdevice drivers and result in a stop of data
> flow on the chip level.
> 
> Theoretically, applications also could use timeout parameter of the poll()
> syscall to implement the timeout (which can be e.g. a multiple of the frame
> interval), but the problem is that userspace does not know whether the
> timeout happened because there are no DMA transfers in the driver (i.e. one
> of the upstream subdevices or VIN failed) or because the driver is just
> using the "scratch buffer". The event which I have introduced explicitly
> monitors whether rcar-vin regularly receives new frames from upstream
> and allows applications to try a recovery (I have now renamed the event to
> "FRAME_TIMEOUT" to be more precise about its purpose).
> 
> Another reason, why I think that the new v4l2 event is the right solution,
> are proprietary applications, where it is not possible to change the code
> to add any additional handling of driver failures but it is possible to
> start/stop streaming via inter process communication. Since V4L2 events can
> be subscribed and received by a separate process, it is possible to
> implement a middleware in user space, which monitors V4L2 events. Typically
> this middleware could also take over all of the complicated media-ctl
> configuration and monitoring of source changes and other events from
> subdevices, but this is a bit off-topic. I think that (private) V4L2 events
> are really useful in embedded systems where applications/middlewares are
> aware of the underlying hardware and want to be better informed about
> hardware related events than desktop applications.
> 
> So if my arguments sound reasonable and you don't reject the overall
> concept of the series, I would send an improved version, where I have fixed
> some details of the timer implementation. I have also a patch for rcar-csi2
> driver with a private CSI-2 error event, which is useful to let the
> application know that the reason for the frame timeout event might be a
> CSI-2 error and not e.g. paused playback.

I'm not arguing that something is needed for user-space to detect these 
situations. I'm arguing that adding these events directly into rcar-vin 
and/or rcar-csi2 is the wrong level. In my view either support should be 
added in the V4L2 subsystem core or in the user-space applications.  
Adding custom events and logic to a single driver does not create 
reusable and generic solution which can be used by many.

If you wish to work the problem in the kernel I think you should do so 
on a V4L2 level and not in the individual driver. As the needs you 
describe above could be useful for others users.

> 
> > > 
> > > Signed-off-by: Michael Rodin <mrodin@de.adit-jv.com>
> > > ---
> > >  drivers/media/platform/rcar-vin/rcar-dma.c  | 21 +++++++++++++++++++++
> > >  drivers/media/platform/rcar-vin/rcar-v4l2.c |  1 +
> > >  drivers/media/platform/rcar-vin/rcar-vin.h  |  6 ++++++
> > >  include/uapi/linux/rcar-vin.h               | 10 ++++++++++
> > >  4 files changed, 38 insertions(+)
> > >  create mode 100644 include/uapi/linux/rcar-vin.h
> > > 
> > > diff --git a/drivers/media/platform/rcar-vin/rcar-dma.c b/drivers/media/platform/rcar-vin/rcar-dma.c
> > > index 1a30cd0..bf8d733 100644
> > > --- a/drivers/media/platform/rcar-vin/rcar-dma.c
> > > +++ b/drivers/media/platform/rcar-vin/rcar-dma.c
> > > @@ -937,6 +937,20 @@ static void rvin_capture_stop(struct rvin_dev *vin)
> > >  #define RVIN_TIMEOUT_MS 100
> > >  #define RVIN_RETRIES 10
> > >  
> > > +static const struct v4l2_event rvin_irq_timeout = {
> > > +	.type = V4L2_EVENT_RCAR_VIN_IRQ_TIMEOUT,
> > > +};
> > > +
> > > +static void rvin_irq_timer_function(struct timer_list *timer)
> > > +{
> > > +	struct rvin_dev *vin = container_of(timer, struct rvin_dev,
> > > +					    irq_timer);
> > > +
> > > +	vin_err(vin, "%s: frame completion timeout after %i ms!\n",
> > > +		__func__, IRQ_TIMEOUT_MS);
> > > +	v4l2_event_queue(&vin->vdev, &rvin_irq_timeout);
> > > +}
> > > +
> > >  static irqreturn_t rvin_irq(int irq, void *data)
> > >  {
> > >  	struct rvin_dev *vin = data;
> > > @@ -1008,6 +1022,8 @@ static irqreturn_t rvin_irq(int irq, void *data)
> > >  		vin_dbg(vin, "Dropping frame %u\n", vin->sequence);
> > >  	}
> > >  
> > > +	mod_timer(&vin->irq_timer, jiffies + msecs_to_jiffies(IRQ_TIMEOUT_MS));
> > > +
> > >  	vin->sequence++;
> > >  
> > >  	/* Prepare for next frame */
> > > @@ -1252,6 +1268,8 @@ static int rvin_start_streaming(struct vb2_queue *vq, unsigned int count)
> > >  	if (ret)
> > >  		dma_free_coherent(vin->dev, vin->format.sizeimage, vin->scratch,
> > >  				  vin->scratch_phys);
> > > +	else
> > > +		mod_timer(&vin->irq_timer, jiffies + msecs_to_jiffies(IRQ_TIMEOUT_MS));
> > >  
> > >  	return ret;
> > >  }
> > > @@ -1305,6 +1323,8 @@ static void rvin_stop_streaming(struct vb2_queue *vq)
> > >  	/* Free scratch buffer. */
> > >  	dma_free_coherent(vin->dev, vin->format.sizeimage, vin->scratch,
> > >  			  vin->scratch_phys);
> > > +
> > > +	del_timer_sync(&vin->irq_timer);
> > >  }
> > >  
> > >  static const struct vb2_ops rvin_qops = {
> > > @@ -1370,6 +1390,7 @@ int rvin_dma_register(struct rvin_dev *vin, int irq)
> > >  		goto error;
> > >  	}
> > >  
> > > +	timer_setup(&vin->irq_timer, rvin_irq_timer_function, 0);
> > >  	return 0;
> > >  error:
> > >  	rvin_dma_unregister(vin);
> > > diff --git a/drivers/media/platform/rcar-vin/rcar-v4l2.c b/drivers/media/platform/rcar-vin/rcar-v4l2.c
> > > index f421e25..c644134 100644
> > > --- a/drivers/media/platform/rcar-vin/rcar-v4l2.c
> > > +++ b/drivers/media/platform/rcar-vin/rcar-v4l2.c
> > > @@ -581,6 +581,7 @@ static int rvin_subscribe_event(struct v4l2_fh *fh,
> > >  {
> > >  	switch (sub->type) {
> > >  	case V4L2_EVENT_SOURCE_CHANGE:
> > > +	case V4L2_EVENT_RCAR_VIN_IRQ_TIMEOUT:
> > >  		return v4l2_event_subscribe(fh, sub, 4, NULL);
> > >  	}
> > >  	return v4l2_ctrl_subscribe_event(fh, sub);
> > > diff --git a/drivers/media/platform/rcar-vin/rcar-vin.h b/drivers/media/platform/rcar-vin/rcar-vin.h
> > > index c19d077..7408f67 100644
> > > --- a/drivers/media/platform/rcar-vin/rcar-vin.h
> > > +++ b/drivers/media/platform/rcar-vin/rcar-vin.h
> > > @@ -14,12 +14,14 @@
> > >  #define __RCAR_VIN__
> > >  
> > >  #include <linux/kref.h>
> > > +#include <linux/rcar-vin.h>
> > >  
> > >  #include <media/v4l2-async.h>
> > >  #include <media/v4l2-ctrls.h>
> > >  #include <media/v4l2-dev.h>
> > >  #include <media/v4l2-device.h>
> > >  #include <media/videobuf2-v4l2.h>
> > > +#include <media/v4l2-event.h>
> > >  
> > >  /* Number of HW buffers */
> > >  #define HW_BUFFER_NUM 3
> > > @@ -30,6 +32,8 @@
> > >  /* Max number on VIN instances that can be in a system */
> > >  #define RCAR_VIN_NUM 8
> > >  
> > > +#define IRQ_TIMEOUT_MS 1000
> > > +
> > >  struct rvin_group;
> > >  
> > >  enum model_id {
> > > @@ -196,6 +200,7 @@ struct rvin_info {
> > >   * @compose:		active composing
> > >   * @src_rect:		active size of the video source
> > >   * @std:		active video standard of the video source
> > > + * @irq_timer:		monitors regular capturing of frames in rvin_irq()
> > >   *
> > >   * @alpha:		Alpha component to fill in for supported pixel formats
> > >   */
> > > @@ -240,6 +245,7 @@ struct rvin_dev {
> > >  	struct v4l2_rect src_rect;
> > >  	v4l2_std_id std;
> > >  
> > > +	struct timer_list irq_timer;
> > >  	unsigned int alpha;
> > >  };
> > >  
> > > diff --git a/include/uapi/linux/rcar-vin.h b/include/uapi/linux/rcar-vin.h
> > > new file mode 100644
> > > index 00000000..4eb7f5e
> > > --- /dev/null
> > > +++ b/include/uapi/linux/rcar-vin.h
> > > @@ -0,0 +1,10 @@
> > > +/* SPDX-License-Identifier: GPL-2.0 WITH Linux-syscall-note */
> > > +
> > > +#ifndef RCAR_VIN_USER_H
> > > +#define RCAR_VIN_USER_H
> > > +
> > > +/* class for events sent by the rcar-vin driver */
> > > +#define V4L2_EVENT_RCAR_VIN_CLASS	V4L2_EVENT_PRIVATE_START
> > > +#define V4L2_EVENT_RCAR_VIN_IRQ_TIMEOUT	(V4L2_EVENT_RCAR_VIN_CLASS | 0x1)
> > > +
> > > +#endif /* RCAR_VIN_USER_H */
> > > -- 
> > > 2.7.4
> > > 
> > 
> > -- 
> > Regards,
> > Niklas Söderlund
> 
> -- 
> Best Regards,
> Michael

-- 
Regards,
Niklas Söderlund
