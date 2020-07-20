Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 80302226EA7
	for <lists+linux-media@lfdr.de>; Mon, 20 Jul 2020 21:04:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729431AbgGTTEp (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 20 Jul 2020 15:04:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42310 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726012AbgGTTEm (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 20 Jul 2020 15:04:42 -0400
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com [IPv6:2a00:1450:4864:20::242])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 33870C061794;
        Mon, 20 Jul 2020 12:04:42 -0700 (PDT)
Received: by mail-lj1-x242.google.com with SMTP id q7so21468425ljm.1;
        Mon, 20 Jul 2020 12:04:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=+oaeCd68XIeVIpG/Gt6ItVtQBGW7Ss63KVNrYFHUeOE=;
        b=pSkZAajATEfQwYfbFog41fZwCg3M6GiwphMxanTKyWhif+BxOeCawIEql7aihRR4Tu
         Y9O4WWoc8bE9Y8Ukqzd0OGBlT7mD31xUiPmY2nF49TV+ITKPv+YFJ/zd/mOjCaDX42Gy
         nLDcSWconbWgfUFZk/BrpMnzf3fAFP+LS/sSYUTX1FYmEx8NZrN2M9eT0Ebt0QMZJN56
         dceJZD6JAOVuvWHXvQDNOEHJUpbuyhJbcO/VzxI7jeETv2/qz/NgrikXE+tgr37ZyokW
         ylcuSo57r6hO6qGbaGAsDQRh0HayZDFZZ3EOvpSywLLlSj2V+DJXehbQkea0IHxaozqT
         Df/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=+oaeCd68XIeVIpG/Gt6ItVtQBGW7Ss63KVNrYFHUeOE=;
        b=Ev3b3DJiiRExvp54N6bxWJF2d9aZH8zoeQvVGUhKy38MqHr9oDgR8AdYger+ECYMU/
         WsTobJBynx3yZSImtWf9zsv/HWzBa0rtjclKeJf5UlTyBqaMbC3gSSZ78RO1eMe7HibJ
         3fo3pF4es1dUDpLQx4q3GfNAwyOVGmmUeR5GBhEKfLUdSituoSlHY9nyfbJKDQGFlh/l
         32acGFjg/2E+r6M3/lndNUF7Kh8sf49QKHK0xjMD8l6yD8n9nDbV1NrNMj5Yr5GaAsap
         UlQ2q97fWtc3+OwkKHMkNoD+9maYPXyyWbSsFlCV5ppoKXd5+85YSExyktjC4AdO7RMu
         Iz/w==
X-Gm-Message-State: AOAM530uEnRYtFzDXcCvvj4wDCAmbmzmYsA0Sw8qrtGfYCNobM85LvAk
        0cakgN1AT8T3R3VwB6RWQKQ=
X-Google-Smtp-Source: ABdhPJzzcK14vXaCvxRMBhWxA8Le3VL+QfkqyHejMoatzzbjZU1u0E4EvDhi7DpNgG2vOr6gFTC5lQ==
X-Received: by 2002:a2e:960a:: with SMTP id v10mr11497653ljh.223.1595271880480;
        Mon, 20 Jul 2020 12:04:40 -0700 (PDT)
Received: from z50.localnet (93-181-165-181.internetia.net.pl. [93.181.165.181])
        by smtp.gmail.com with ESMTPSA id v5sm3364216lji.75.2020.07.20.12.04.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2020 12:04:39 -0700 (PDT)
From:   Janusz Krzysztofik <jmkrzyszt@gmail.com>
To:     Jacopo Mondi <jacopo@jmondi.org>
Cc:     mchehab@kernel.org, hverkuil-cisco@xs4all.nl,
        sakari.ailus@linux.intel.com, laurent.pinchart@ideasonboard.com,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        niklas.soderlund+renesas@ragnatech.se,
        kieran.bingham@ideasonboard.com, dave.stevenson@raspberrypi.com,
        hyun.kwon@xilinx.com, robert.jarzmik@free.fr,
        linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Janusz Krzysztofik <jmkrzyszt@gmail.com>
Subject: Re: [PATCH v7 01/10] media: v4l2-subdev: Introduce [get|set]_mbus_config pad ops
Date:   Mon, 20 Jul 2020 21:04:38 +0200
Message-ID: <1974407.bB369e8A3T@z50>
In-Reply-To: <20200720155650.uvnyjzx4nbten3vt@uno.localdomain>
References: <20200716142713.110655-1-jacopo+renesas@jmondi.org> <22470298.ouqheUzb2q@z50> <20200720155650.uvnyjzx4nbten3vt@uno.localdomain>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Monday, July 20, 2020 5:56:50 P.M. CEST Jacopo Mondi wrote:
> Hi Janusz,
> 
> On Sat, Jul 18, 2020 at 01:23:24AM +0200, Janusz Krzysztofik wrote:
> > Hi Jacopo,
> >
> > On Friday, July 17, 2020 9:20:18 A.M. CEST Jacopo Mondi wrote:
> > > Hi Janusz,
> > >   thanks for review
> > >
> > > On Fri, Jul 17, 2020 at 12:15:27AM +0200, Janusz Krzysztofik wrote:
> > > > Hi Jacopo,
> > > >
> > > > On Thursday, July 16, 2020 4:27:04 P.M. CEST Jacopo Mondi wrote:
> > > > > Introduce two new pad operations to allow retrieving and configuring 
the
> > > > > media bus parameters on a subdevice pad.
> > > > >
> > > > > The newly introduced operations aims to replace the s/g_mbus_config 
video
> > > > > operations, which have been on their way for deprecation since a 
long
> > > > > time.
> > > > >
> > > > > Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
> > > > > ---
> > > > >  include/media/v4l2-subdev.h | 27 +++++++++++++++++++++++++++
> > > > >  1 file changed, 27 insertions(+)
> > > > >
> > > > > diff --git a/include/media/v4l2-subdev.h b/include/media/v4l2-
subdev.h
> > > > > index f7fe78a6f65a..d8b9d5735307 100644
> > > > > --- a/include/media/v4l2-subdev.h
> > > > > +++ b/include/media/v4l2-subdev.h
> > > > > @@ -670,6 +670,29 @@ struct v4l2_subdev_pad_config {
> > > > >   *
> > > > >   * @set_frame_desc: set the low level media bus frame parameters, 
@fd array
> > > > >   *                  may be adjusted by the subdev driver to device 
capabilities.
> > > > > + *
> > > > > + * @get_mbus_config: get the media bus configuration of a remote sub-
device.
> > > > > + *		     The media bus configuration is usually retrieved 
from the
> > > > > + *		     firmware interface at sub-device probe time, 
immediately
> > > > > + *		     applied to the hardware and eventually adjusted 
by the
> > > > > + *		     driver. Remote sub-devices (usually video 
receivers) shall
> > > > > + *		     use this operation to query the transmitting 
end bus
> > > > > + *		     configuration in order to adjust their own one 
accordingly.
> > > > > + *		     Callers should make sure they get the most up-
to-date as
> > > > > + *		     possible configuration from the remote end, 
likely calling
> > > > > + *		     this operation as close as possible to stream 
on time. The
> > > > > + *		     operation shall fail if the pad index it has 
been called on
> > > > > + *		     is not valid.
> > > > > + *
> > > > > + * @set_mbus_config: set the media bus configuration of a remote sub-
device.
> > > > > + *		     This operations is intended to allow, in 
combination with
> > > > > + *		     the get_mbus_config operation, the negotiation 
of media bus
> > > > > + *		     configuration parameters between media sub-
devices. The
> > > > > + *		     operation shall not fail if the requested 
configuration is
> > > > > + *		     not supported, but the driver shall update the 
content of
> > > > > + *		     the %config argument to reflect what has been 
actually
> > > > > + *		     applied to the hardware. The operation shall 
fail if the
> > > > > + *		     pad index it has been called on is not valid.
> > >
> > > First of all, Hans sent a pull request for this series yesterday. Are
> > > you ok with that and with sending patches on top, or do you think the
> > > inclusion of the series should be post-poned ? (you can imagine what
> > > my preference is :)
> > >
> > > >
> > > > Could this description also clarify what results are expected in case 
of
> > > > hardware errors?  The ov6650 implementation you propose may suggest 
such
> > > > errors may be expected to be ignored silently as long as current 
configuration
> > > > can be successfully obtained from hardware and passed back to the 
caller.
> > >
> > > I guess "it depends"(tm)
> > > I know this doesn't sound like a good answer :)
> > >
> > > A failure in applying or reading register likely means the driver is
> > > trying to access the hardware while it is in low power state. In this
> > > case I would consider this a driver bug, as it should try to be smart
> > > and cache settings and apply them at the proper time and return the
> > > current configuration, which should be cached as well.
> > >
> > > Of course things could go wrong for several reasons, and in the case
> > > if any unexpected error occurs I think an error is expected to be
> > > reported. Please note that this v7 of ov6650 does that by returning
> > > the return value of ov6650_get_mbus_config() at the end of
> > > ov6650_set_mbus_config.
> >
> > Current configuration is not cached in your implementation proposed for 
ov6650.
> > If it was, would ov6650_set_mbus_config() always succeed, just passing it 
back
> > updated with successful writes and ignoring write errors?  In other words,
> > is this the expected behavior of .set_mbus_config() to always treat
> > unsuccessful writes as recoverable errors and never report them to the 
caller
> > as long as there is a current configuration available that can passed back?
> 
> I don't see that driver implementing any sort of power ref-counting at
> the moment... In example s_ftm goes to the register without actually
> making sure the chip is powered or not.
> 
> I guess this is /fine/, currently there's a big confusion in the i2c
> sensor drivers land on where this has to be implemented... However
> this is a 'legacy' driver, with no media controller support and no
> devnode exposed to userspace, so I guess the bridge driver is in
> charge of making sure it interacts with the sensor after s_power(1)
> has been called.
> 
> Modern sensor drivers, which use runtime_pm and implement the
> VIDIOC_SUBDEV_ API to userspace, are expected to handle power properly
> as they can receive  calls from applications at any time. The most
> trivial solution would be to power up the sensor at fops.open() time
> and keep it powered, but that's clearly a waste, hence if the driver
> implements a smarter power management scheme it should take care of
> caching, as it would do for formats and controls.
> 
> Does that make sense to you ?

I still think hardware errors should be returned, not ignored, regardless of 
power management support level.  Ignoring them can be confusing.  Specific 
configuration requests shouldn't be able to give different results while still 
returning success when hardware errors occur, I believe.  And that would be 
the case with your ov6650 implementation if for example writes were failing 
sporadically and reads always succeeding.

Unless such behavior is really expected from pad operations, and that's what 
my question was about.

Thanks,
Janusz

> 
> Thanks
>   j
> 
> >
> > Thanks,
> > Janusz
> >
> > >
> > > I guess this is pretty regular behaviour, although I missed it in the
> > > previous version, so it might be worth adding an additional line to
> > > the documentation.
> > >
> > > >
> > > > Moreover, since validity of the pad argument is expected to be 
verified, I
> > > > think this should be handled by the media infrastructure layer with 
the
> > > > drivers/media/v4l2-core/v4l2-subdev.c:check_pad() helper called from a
> > > > .set_mbus_config() wrapper added to v4l2_subdev_call_pad_wrappers, 
freeing
> > > > drivers from reimplementing it.
> > > >
> > >
> > > Good point, and indeed my bad as I thought v4l2_subdev_call() would
> > > already do that by default, but looking at the actual implementation a
> > > wrapper might be a good idea indeed.
> > >
> > > Patches on top ?
> > >
> > > Thanks
> > >   j
> > >
> > > > Thanks,
> > > > Janusz
> > > >
> > > > >   */
> > > > >  struct v4l2_subdev_pad_ops {
> > > > >  	int (*init_cfg)(struct v4l2_subdev *sd,
> > > > > @@ -710,6 +733,10 @@ struct v4l2_subdev_pad_ops {
> > > > >  			      struct v4l2_mbus_frame_desc *fd);
> > > > >  	int (*set_frame_desc)(struct v4l2_subdev *sd, unsigned int pad,
> > > > >  			      struct v4l2_mbus_frame_desc *fd);
> > > > > +	int (*get_mbus_config)(struct v4l2_subdev *sd, unsigned int pad,
> > > > > +			       struct v4l2_mbus_config *config);
> > > > > +	int (*set_mbus_config)(struct v4l2_subdev *sd, unsigned int pad,
> > > > > +			       struct v4l2_mbus_config *config);
> > > > >  };
> > > > >
> > > > >  /**
> > > > >
> > > >
> > > >
> > > >
> > > >
> > >
> >
> >
> >
> >
> 




