Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BB4A5449BDE
	for <lists+linux-media@lfdr.de>; Mon,  8 Nov 2021 19:42:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235823AbhKHSpi (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 8 Nov 2021 13:45:38 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42646 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235810AbhKHSph (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 8 Nov 2021 13:45:37 -0500
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com [IPv6:2a00:1450:4864:20::22b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 267E8C061570
        for <linux-media@vger.kernel.org>; Mon,  8 Nov 2021 10:42:52 -0800 (PST)
Received: by mail-lj1-x22b.google.com with SMTP id e9so10830697ljl.5
        for <linux-media@vger.kernel.org>; Mon, 08 Nov 2021 10:42:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ragnatech-se.20210112.gappssmtp.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=LeqMUtG0vuzVDddrZlzIDcABaX8OVn+hu8cgOqMaGW8=;
        b=MRHcKe9OsxD8G/47Ksu8wVxeMHoozHrLywQQsKrt5jdmuqK+1WwPQ73mhMefzLoI6c
         JKDvP8H2VHTwR9p6kWJQu0x6PQA5X5drPzd6c+t7YGuhO44b+IR33Uu+hST57LBNdxNo
         aIYIpAx3wEOqhhjVbkF+lNra7w3r6t4nKIL5RuVvAHEPwRzMtMsTdrPtJKRfgMMbfsuC
         jc658wdqPnleHAGMKlYWw+SzH6M/gGTpRtELQO5W0KvVjeYzinAoSi7N3fQKyZTojLBv
         dnHM7wvBLJUnv7eqfQLXatV4s7NHF+DtIkG+PTYP5Btbh0Cq3m9xqRsrbvijwgKZp1JU
         0mHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=LeqMUtG0vuzVDddrZlzIDcABaX8OVn+hu8cgOqMaGW8=;
        b=N0AFcdDrMsEId58CBUv6Ckpas9hRodpUNnnsUBhNXhwCEzHPsvGLpoFbe5Re7KSZs7
         aph1sZnEBFzVzWSNsHHm4/iluc9KgeGFkAN1KKNFMbwya/cQmptg8HKqrvLfsWl5QbD7
         eJ8htEg2YDhX0VonNrgq9R1G4BL9I8whSNpdU/y5rHcgG2k6faDlpupI1l42e4cuCRkg
         Pd8Ofc7ZVpANyQlBUSdwqrDeLLvtEsSj1L/9nnNJ9F9lshJ3T/Ulb04F4I8+7uHFfzPx
         CtdySv3TrVMw2b7XvM7j9WiOLl44S5HiDnE9uxnjpYZD9lR1bJP+2z4L785ylN2aw+Yb
         NoHA==
X-Gm-Message-State: AOAM531f4cIYvgt8d3jU97FDsUAegjI3Sh3Qwr8+BeWmA12ATkfqZ80K
        awuDYnboGbLyew+zx+WLrVj0JylqQ82r2ikG
X-Google-Smtp-Source: ABdhPJzH8TtRm10x2tQ15+3Q4AzS2l9tjShihF+/v2ft51LI8UFEuanWgKC/Cdz+lK9aXBncyHLqpg==
X-Received: by 2002:a2e:91c6:: with SMTP id u6mr1158803ljg.322.1636396970503;
        Mon, 08 Nov 2021 10:42:50 -0800 (PST)
Received: from localhost (h-46-59-88-219.A463.priv.bahnhof.se. [46.59.88.219])
        by smtp.gmail.com with ESMTPSA id j17sm1894678lfe.64.2021.11.08.10.42.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Nov 2021 10:42:50 -0800 (PST)
Date:   Mon, 8 Nov 2021 19:42:49 +0100
From:   Niklas =?iso-8859-1?Q?S=F6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc:     linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Jacopo Mondi <jacopo+renesas@jmondi.org>
Subject: Re: [PATCH 3/4] rcar-vin: Stop stream when subdevice signal transfer
 error
Message-ID: <YYlvqY21JvTtKysK@oden.dyn.berto.se>
References: <20211108160220.767586-1-niklas.soderlund+renesas@ragnatech.se>
 <20211108160220.767586-4-niklas.soderlund+renesas@ragnatech.se>
 <1fddc966-5a23-63b4-185e-c17aa6d65b54@xs4all.nl>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1fddc966-5a23-63b4-185e-c17aa6d65b54@xs4all.nl>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Hans,

On 2021-11-08 18:36:25 +0100, Hans Verkuil wrote:
> On 08/11/2021 17:02, Niklas Söderlund wrote:
> > When a subdevice signals a transfer error stop the VIN in addition to
> > informing user-space of the event.
> > 
> > Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
> > Reviewed-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
> > ---
> > * Changes since v3
> > - Switch to new V4L2_EVENT_XFER_ERROR from V4L2_EVENT_EOS.
> > - Call vb2_queue_error() when encountering the event.
> > 
> > * Changes since v2
> > - Log using vin_dbg() instead of v4l2_info().
> > ---
> >  drivers/media/platform/rcar-vin/rcar-v4l2.c | 17 ++++++++++++++++-
> >  1 file changed, 16 insertions(+), 1 deletion(-)
> > 
> > diff --git a/drivers/media/platform/rcar-vin/rcar-v4l2.c b/drivers/media/platform/rcar-vin/rcar-v4l2.c
> > index a5bfa76fdac6e55a..bf17fdefe90aabf5 100644
> > --- a/drivers/media/platform/rcar-vin/rcar-v4l2.c
> > +++ b/drivers/media/platform/rcar-vin/rcar-v4l2.c
> > @@ -992,9 +992,24 @@ void rvin_v4l2_unregister(struct rvin_dev *vin)
> >  static void rvin_notify_video_device(struct rvin_dev *vin,
> >  				     unsigned int notification, void *arg)
> >  {
> > +	const struct v4l2_event *event;
> > +
> >  	switch (notification) {
> >  	case V4L2_DEVICE_NOTIFY_EVENT:
> > -		v4l2_event_queue(&vin->vdev, arg);
> > +		event = arg;
> > +
> > +		switch (event->type) {
> > +		case V4L2_EVENT_XFER_ERROR:
> > +			vin_dbg(vin,
> > +				"Subdevice signaled transfer error, stopping.\n");
> > +			rvin_stop_streaming(vin);
> > +			vb2_queue_error(&vin->queue);
> 
> Hmm, wouldn't it be the case that every driver that calls vb2_queue_error()
> would also have to send this new event? Would it be possible to modify
> vb2_queue_error() to raise this event? I haven't analyzed all the drivers
> that call this function to see if that makes sense.
> 
> Perhaps a separate new function vb2_queue_error_with_event() would also be
> an option.

I think that maybe a good idea, but I think that would be needed on-top 
of this work as I can't really test it. Here the rcar-csi2.ko is a 
subdevice which detects the error condition and generates the event. And 
this code is in rcar-vin.ko, the video device driver which reacts to the 
event and then forwards it to user-space.

Or am I misunderstanding you? And you think I should remove the 
v4l2_event_queue() below in favor of a new vb2_queue_error_with_event() 
call?

> 
> Regards,
> 
> 	Hans
> 
> > +			break;
> > +		default:
> > +			break;
> > +		}
> > +
> > +		v4l2_event_queue(&vin->vdev, event);
> >  		break;
> >  	default:
> >  		break;
> > 
> 

-- 
Kind Regards,
Niklas Söderlund
