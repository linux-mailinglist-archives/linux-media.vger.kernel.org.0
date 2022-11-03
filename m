Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1D661617967
	for <lists+linux-media@lfdr.de>; Thu,  3 Nov 2022 10:10:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229850AbiKCJKC (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 3 Nov 2022 05:10:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33486 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229598AbiKCJKA (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 3 Nov 2022 05:10:00 -0400
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D4F6E65A4
        for <linux-media@vger.kernel.org>; Thu,  3 Nov 2022 02:09:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1667466599; x=1699002599;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=PmyqGD6pxahxNa4zD9qpzrkdY8AmWU/LzQ+GUOdmITY=;
  b=NJ8JMF+nuMghFBSumm4MubheeKbNN6d4PQEy7yunjrGZk6w5khDE+ahj
   eQ4yPeEMQ21aoYEVJYww9DF0w+4QVwkDBsUHgFaayHHh4G8D+dK4sPgQS
   +f2WT6oatnoeDLV5bj1Hp85/zNoRUkC+UEiObaOtYquFBdXpxPiCccrHT
   cscZiK4QDkgKUW4J/LognGfnHiQPYvSpm4mWCNECEblxS/0lfSVlIOo32
   yAxRIWBFDY84vV4VVH6bg4ThVRlJMJ+nG+dRy3fryGQQz3yU4JuXHK8wR
   Pe2hQdWWF0KFjBpSw5TkcSoJfeubTb0tIWorQIQ2ns5u+kYEoydfaPxPz
   w==;
X-IronPort-AV: E=Sophos;i="5.95,235,1661810400"; 
   d="scan'208";a="27129829"
Received: from unknown (HELO tq-pgp-pr1.tq-net.de) ([192.168.6.15])
  by mx1-pgp.tq-group.com with ESMTP; 03 Nov 2022 10:09:57 +0100
Received: from mx1.tq-group.com ([192.168.6.7])
  by tq-pgp-pr1.tq-net.de (PGP Universal service);
  Thu, 03 Nov 2022 10:09:57 +0100
X-PGP-Universal: processed;
        by tq-pgp-pr1.tq-net.de on Thu, 03 Nov 2022 10:09:57 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1667466597; x=1699002597;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=PmyqGD6pxahxNa4zD9qpzrkdY8AmWU/LzQ+GUOdmITY=;
  b=KiMDnnZCTDwvOeG3AExs/UKLBQOzjsC6IRGl+hs/aeu8QpMTKK8oF2gM
   +Pg13KPZ88eknh3lI7W7ash2fwqozvABW8mHOKS0ET3nWIqJZ9MaoO79H
   Dal/QNxdjf5fb5cjaJhAGwEn2MrYIMAyxZtNY45Yq2pdx0pNkgOE/RVp3
   VL0Q0dURxa2oKa8wBVASO1AUqFUauOZ2lgp3980C/zdBZX8IAxOfHRyv8
   MOqMwPWY9BvxcTpSSw6OZh7ldgbQj9Ny2eW485xkH8jsrc73t1RPIstK3
   B3BcKe7Jd8wz6yXzIVtduYk+G2ejp1M15tVGFLCOLKly4YLakrPqgHyy8
   w==;
X-IronPort-AV: E=Sophos;i="5.95,235,1661810400"; 
   d="scan'208";a="27129828"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
  by mx1.tq-group.com with ESMTP; 03 Nov 2022 10:09:56 +0100
Received: from steina-w.localnet (unknown [10.123.53.21])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id 85638280056;
        Thu,  3 Nov 2022 10:09:56 +0100 (CET)
From:   Alexander Stein <alexander.stein@ew.tq-group.com>
To:     Dave Stevenson <dave.stevenson@raspberrypi.com>
Cc:     sakari.ailus@iki.fi, paul.j.murphy@intel.com,
        daniele.alessandrelli@intel.com, linux-media@vger.kernel.org,
        jacopo@jmondi.org
Subject: Re: [PATCH v2 15/16] media: i2c: ov9282: Add support for 8bit readout
Date:   Thu, 03 Nov 2022 10:09:56 +0100
Message-ID: <3704299.R56niFO833@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <CAPY8ntC8iCy2S-AEV808k2yCmnQxiZzR7vQJZ1E+PcdjQJL9aw@mail.gmail.com>
References: <20221028160902.2696973-1-dave.stevenson@raspberrypi.com> <1742759.VLH7GnMWUR@steina-w> <CAPY8ntC8iCy2S-AEV808k2yCmnQxiZzR7vQJZ1E+PcdjQJL9aw@mail.gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Dave,

Am Dienstag, 1. November 2022, 19:20:47 CET schrieb Dave Stevenson:
> Hi Alexander
> 
> On Tue, 1 Nov 2022 at 15:04, Alexander Stein
> 
> <alexander.stein@ew.tq-group.com> wrote:
> > Hi Dave,
> > 
> > thanks for the fast reply.
> > 
> > Am Dienstag, 1. November 2022, 14:47:16 CET schrieb Dave Stevenson:
> > > Hi Alexander
> > > 
> > > On Tue, 1 Nov 2022 at 11:59, Alexander Stein
> > > 
> > > <alexander.stein@ew.tq-group.com> wrote:
[snip]
> > > > Using this series I was able to do some camera playback on LVDS
> > > > display on
> > > > imx8mm based platform (TQMa8MxML). My command was 'gst-launch-1.0
> > > > v4l2src
> > > > device=/dev/video0 ! video/x-
> > > > raw,format=GRAY8,bpp=8,width=1280,height=720,framerate=30/1 !
> > > > videoconvert
> > > > ! waylandsink'
> > > > But due to SW colorspace conversion this is awfully slow.
> > > > Using a testsink I get about 72FPS on 1280x720 for GREY. Is this to be
> > > > expected?
> > > > I used 'gst-launch-1.0 v4l2src device=/dev/video0 ! video/x-
> > > > raw,format=GRAY8,bpp=8,width=1280,height=720,framerate=30/1 !
> > > > fpsdisplaysink video-sink="testsink" text-overlay=false silent=false
> > > > sync=false -v' for that.
> > > 
> > > AFAIK v4l2src doesn't map from a caps framerate=30/1 to the relevant
> > > V4L2_CID_VBLANK and V4L2_CID_HBLANK controls used by raw sensors for
> > > frame rate control (see docs at [1]). The sensor will therefore stream
> > > at whatever rate the controls get left at.
> > 
> > Yes I noticed the framerate caps has no effect. But I lack some kind of
> > reference system to decide what should work and what not.
> 
> As per the docs link, raw sensors will be using the HBLANK and VBLANK
> controls, not VIDIOC_S_PARM.
> I don't know whether the GStreamer folks wish to add support to
> v4l2src to set those - libcamerasrc is going to be the more normal
> user of these sensors, but that generally means needing an ISP of some
> form. With just v4l2src you've got no AE / AGC control loops, so it is
> only of use in controlled lighting conditions.

I am aware that v4l2src is rather some raw accessor to cameras. What video 
format is libcamerasrc supposed to provide? Raw formats (Y8, bayer patterns) 
or already converted to RBGA etc.?

> I don't know the full details of the imx8 range, but believe the
> libcamera folk were working with one of the imx8 platforms.

If an ISP is required then it will probably be imx8mp.

> > > I'm assuming you're not using Media Controller either, as v4l2src
> > > won't set up Media Controller links correctly either.
> > 
> > Well, actually I am using Media Controller. But I need to configure it
> > before gstreamer usage. There is no specific reason for gstreamer, but we
> > use this to verify features on downstream kernel.
> > 
> > For completeness here is one of my media-ctl setup:
> > media-ctl -l "'ov9282 2-0060':0->'csis-32e30000.mipi-csi':0 [1]"
> > media-ctl -V "'ov9282 2-0060':0 [fmt:Y8_1X8/1280x720 field:none
> > colorspace:raw]"
> > media-ctl -V "'csi':0 [fmt:Y8_1X8/1280x720 field:none colorspace:raw]"
> > v4l2-ctl -d0 --set-fmt-video
> > width=1280,height=720,pixelformat='GREY',field=none
> > media-ctl -p
> > 
> > Media controller API version 6.1.0
> > 
> > Media device information
> > ------------------------
> > driver          imx7-csi
> > model           imx-media
> > serial
> > bus info        platform:32e20000.csi
> > hw revision     0x0
> > driver version  6.1.0
> > 
> > Device topology
> > - entity 1: csi (2 pads, 2 links)
> > 
> >             type V4L2 subdev subtype Unknown flags 0
> >             device node name /dev/v4l-subdev0
> >         
> >         pad0: Sink
> >         
> >                 [fmt:Y8_1X8/1280x720 field:none colorspace:raw xfer:none
> > 
> > ycbcr:601 quantization:full-range]
> > 
> >                 <- "csis-32e30000.mipi-csi":1 [ENABLED,IMMUTABLE]
> >         
> >         pad1: Source
> >         
> >                 [fmt:Y8_1X8/1280x720 field:none colorspace:raw xfer:none
> > 
> > ycbcr:601 quantization:full-range]
> > 
> >                 -> "csi capture":0 [ENABLED,IMMUTABLE]
> > 
> > - entity 4: csi capture (1 pad, 1 link)
> > 
> >             type Node subtype V4L flags 0
> >             device node name /dev/video0
> >         
> >         pad0: Sink
> >         
> >                 <- "csi":1 [ENABLED,IMMUTABLE]
> > 
> > - entity 10: csis-32e30000.mipi-csi (2 pads, 2 links)
> > 
> >              type V4L2 subdev subtype Unknown flags 0
> >              device node name /dev/v4l-subdev1
> >         
> >         pad0: Sink
> >         
> >                 [fmt:Y8_1X8/1280x720 field:none colorspace:raw xfer:none]
> >                 <- "ov9281 2-0060":0 [ENABLED]
> >         
> >         pad1: Source
> >         
> >                 [fmt:Y8_1X8/1280x720 field:none colorspace:raw xfer:none]
> >                 -> "csi":0 [ENABLED,IMMUTABLE]
> > 
> > - entity 15: ov9282 2-0060 (1 pad, 1 link)
> > 
> >              type V4L2 subdev subtype Sensor flags 0
> >              device node name /dev/v4l-subdev2
> >         
> >         pad0: Source
> >         
> >                 [fmt:Y8_1X8/1280x720 field:none colorspace:raw xfer:none
> >                 
> >                  crop.bounds:(8,8)/1280x800
> >                  crop:(8,8)/1280x720]
> >                 
> >                 -> "csis-32e30000.mipi-csi":0 [ENABLED]
> > > 
> > > Running a Raspberry Pi in the same non-Media Controller mode:
> > > v4l2-ctl -v width=1280,height=800,pixelformat=Y10P
> > > v4l2-ctl --stream-mmap=3 --stream-count=1000 --stream-to=/dev/null
> > > gives me 60.28fps.
> > > 
> > > HBLANK defaults to 176, and VBLANK to 1022:
> > > 160MPix/s / ((1280+176) * (800+1022)) = 60.3fps.
> > > 
> > > v4l2-ctl -v width=1280,height=800,pixelformat=GREY
> > > v4l2-ctl --stream-mmap=3 --stream-count=1000 --stream-to=/dev/null
> > > Gives me 72.33fps as neither HBLANK nor VBLANK have been altered, but
> > > V4L2_CID_PIXEL_RATE has been increased.
> > > 
> > > Run the numbers the other way for eg 120fps
> > > 200MPix/s / ( 120fps * (width 1280 + HBLANK 176)) - height (800) =
> > > VBLANK =
> > > 344 v4l2-ctl --set-ctrl=vertical_blanking=344
> > > Streaming with that gives me 115.17fps, so you're now making me
> > > question the Y8 pixel rate.
> > > 192MPix/s appears to be the right value to make the numbers work.
> > 
> > Mh, using v4l2-ctl --set-ctrl=vertical_blanking=344 -d /dev/v4l-subdev2 I
> > get 109.61fps for 1280x800.
> 
> The sensor has an external clock signal (XVCLK) which can be between 6
> and 27MHz. The driver only supports 24MHz. Is your module using a
> 24MHz clock?

Well, I assume it is. We are using an OV9281 camera from vision components.

> > > I don't recall where I'd got the 200MPix/s value from - it's not
> > > documented in the datasheet, but presumably from 160 * 10 / 8
> > > (switching from 10 to 8 bits at the same output rate). You're the
> > > first to notice the rates are off, although at least it's less than
> > > the factor of two that this driver used to be out by.
> > 
> > I admit I'm not fully sure which results are correct and what they are
> > 
> > expected to be. But here are some results using the v4l-ctrl approach:
> >      | 1280x800 | 1280x720 | 640x400 |
> > 
> > -----+----------+----------+---------+
> > GREY |  68.84   |   72.0   |  73.50  |
> > Y10  |  57.37   |   60.0   |  73.50  |
> > 
> > All using their default vertical and horizontal blanking. Especially
> > switching to 640x400 and then back to 1280x720 leaves the
> > horizontal_blanking to the old (640) value, resulting in lower frame
> > rates.
> 
> IMHO This isn't clear in the docs.
> My understanding is that controls shouldn't change value when changing
> modes unless the new mode requires updating the range for the control
> such that the current value is invalid. This does mean that the
> framerate will change if you change modes without reprogramming, but
> what heuristics should be used if you did update it?

For 1280 the default horizontal_blanking is 250, but when changing to 640 the 
minimum also increased to 890. When switching back horizontal_blanking stays 
at 890, as it is still a valid value.

> Options:
> 1) retain the current frame rate by recomputing VBLANK, but there will
> be conditions where you can't achieve the same frame rate in all
> modes.
> 2) reset to a default frame rate, but how do you define that? Do you
> have to detect change of mode vs just calling S_FMT with the same
> mode?
> 3) adjust the limits but otherwise leave the control alone.
> 4) as 3, but update the default value to reflect some standard
> framerate (but how do you define that standard?)
> 
> Different sensors are currently doing different things, so the only
> approach you can really take is for userspace to set the controls
> explicitly after setting a mode.

I'm not sure what is the best way to go, all options have different use cases 
in mind. At least one should be aware that some controls might change when 
switching modes.

> Sakari will normally point to the CCS driver as a model for raw
> sensors, and that appears to adopt option 3. There was a thread with
> Jacopo recently over this same subject, but no resolution. I think it
> was on the ar0521 patchset.
> 
> Clean boot and testing in this order:
> - 1280x720 Y10P 63.05fps
> - 1280x800 Y10P 60.28fps
> - 640x400 Y10P 77.22fps
> Reboot so that the HBLANK change is reset
> - 1280x720 GREY 75.65fps
> - 1280x800 GREY 72.33fps
> - 640x400 GREY 92.67fps.
> 
> I don't believe your GREY 640x400 number as it's the same as your
> 640x400 Y10 value, but all your other values except 1280x800 Y10
> differ from mine by a factor of 1.0507. (1280x800 Y10 is x1.099).
> I'd suggest measuring your XVCLK clock signal with an oscilloscope or
> frequency counter as I suspect it isn't 24MHz. 22.8MHz would give
> these results, but is a slightly strange frequency if from a dedicated
> oscillator rather than a PLL.

I lack technical documentation for the camera hardware module, so I do not see 
a way to actually measuring XVCLK. AFAIK there is also an FPGA mounted which 
might affect the clock frequency as well.

> Adding support for additional XVCLK frequencies isn't a huge task, but
> involves computing the internal PLL settings. My datasheet only gives
> settings for 24MHz, so it'd be back to the basic principles of PLL
> config to do it.

Until things are more clear I would skip that for now as this module should be 
running on a 24 MHz, I assume.

Best regards,
Alexander



