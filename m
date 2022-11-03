Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DD545617D7F
	for <lists+linux-media@lfdr.de>; Thu,  3 Nov 2022 14:07:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229745AbiKCNHK (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 3 Nov 2022 09:07:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42748 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231778AbiKCNGk (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 3 Nov 2022 09:06:40 -0400
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com [IPv6:2a00:1450:4864:20::633])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EED9E178BF
        for <linux-media@vger.kernel.org>; Thu,  3 Nov 2022 06:06:07 -0700 (PDT)
Received: by mail-ej1-x633.google.com with SMTP id t25so5000003ejb.8
        for <linux-media@vger.kernel.org>; Thu, 03 Nov 2022 06:06:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=IXwwzaOgizGgBmiG6321n1pSXvR68pzm3OOSdENENoo=;
        b=ruAI7rIwBzM/ujR032X32rCIjcjeKfViVvItD1wF56YUcT/FisIav/ELqtBrzAwHCk
         9fksoXC7o3UrLHOzJf8jvYcp5z1u5W35y/m/WIMYpnoO0bNYemlTguzrByO+FwW7H1BG
         +ZG43wuA4/shqvKARnJTk2ZxCihU4ock06SxJBDo97pDl8RSJ+M/+x6KMJTv77Fdy6Jm
         D8zb/qSCVe9Uhk9soX+QjzTCgVMfFHonBluLUDI6uREBx8rlimGmeI9W8zLEC9EWe9e8
         a2zOdtVSlJhpNY++Ig0ekEZiwHY4PDzGUYvVrCLK+9Z2haP1M5aQ+Sd+H4Z7/4gTOYGi
         bn5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IXwwzaOgizGgBmiG6321n1pSXvR68pzm3OOSdENENoo=;
        b=m9LNskS8ywTK1kGmSG/BeIceEw1Jx5G7QPH/28Z15TyebTnPQs0+6Bbk+O0BpcMqDh
         btC5yPpVDxGRgXeShU6kP6+bOBq+gosbhpeeCFK8nEpREhFgLQkqK+SFThpVO9MpN4ZE
         YNO7NEu+tuitnNHJYBZ16gbBAJCUWwxv9z6YhfFmRTQcG72BXZoTsFmxoBSTpybFs4xu
         3qP3uo197E8nCW3WGWHJHybAkTGIrIzGP0pZfm/hu872/b77zJcaFHB3DCFYjcskOK2z
         DnI7dfC14fQ067IWwqXoZKPN4ZMDG+HBp9FluX90hxa/2vO6oGpJmDaUIAD9H3bv92pi
         74tw==
X-Gm-Message-State: ACrzQf2dkR/cjp6s7hVEWVNe91Ij/somaVtia1avvEQxonqVKTYTYRf7
        sDJnkNWJeboHOpKzLI6Gzz0R798sznRV9WLKWcwTVw==
X-Google-Smtp-Source: AMsMyM6FdCw8+Ug29F/QfBl3TO69v5M7anu3SmDzPUdsThXXB+sHeJctWaPKBxSGII6arMq1pmRmzx9jPB0WHFQHFPw=
X-Received: by 2002:a17:907:d1d:b0:7ad:4a55:9f01 with SMTP id
 gn29-20020a1709070d1d00b007ad4a559f01mr28859153ejc.723.1667480766386; Thu, 03
 Nov 2022 06:06:06 -0700 (PDT)
MIME-Version: 1.0
References: <20221028160902.2696973-1-dave.stevenson@raspberrypi.com>
 <1742759.VLH7GnMWUR@steina-w> <CAPY8ntC8iCy2S-AEV808k2yCmnQxiZzR7vQJZ1E+PcdjQJL9aw@mail.gmail.com>
 <3704299.R56niFO833@steina-w>
In-Reply-To: <3704299.R56niFO833@steina-w>
From:   Dave Stevenson <dave.stevenson@raspberrypi.com>
Date:   Thu, 3 Nov 2022 13:05:47 +0000
Message-ID: <CAPY8ntCph4Ukpc89B7m6WLybAsvWzte9kVrvW9yTp6sGpOg4Zg@mail.gmail.com>
Subject: Re: [PATCH v2 15/16] media: i2c: ov9282: Add support for 8bit readout
To:     Alexander Stein <alexander.stein@ew.tq-group.com>
Cc:     sakari.ailus@iki.fi, paul.j.murphy@intel.com,
        daniele.alessandrelli@intel.com, linux-media@vger.kernel.org,
        jacopo@jmondi.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Alex

On Thu, 3 Nov 2022 at 09:09, Alexander Stein
<alexander.stein@ew.tq-group.com> wrote:
>
> Hi Dave,
>
> Am Dienstag, 1. November 2022, 19:20:47 CET schrieb Dave Stevenson:
> > Hi Alexander
> >
> > On Tue, 1 Nov 2022 at 15:04, Alexander Stein
> >
> > <alexander.stein@ew.tq-group.com> wrote:
> > > Hi Dave,
> > >
> > > thanks for the fast reply.
> > >
> > > Am Dienstag, 1. November 2022, 14:47:16 CET schrieb Dave Stevenson:
> > > > Hi Alexander
> > > >
> > > > On Tue, 1 Nov 2022 at 11:59, Alexander Stein
> > > >
> > > > <alexander.stein@ew.tq-group.com> wrote:
> > As per the docs link, raw sensors will be using the HBLANK and VBLANK
> > controls, not VIDIOC_S_PARM.
> > I don't know whether the GStreamer folks wish to add support to
> > v4l2src to set those - libcamerasrc is going to be the more normal
> > user of these sensors, but that generally means needing an ISP of some
> > form. With just v4l2src you've got no AE / AGC control loops, so it is
> > only of use in controlled lighting conditions.
>
> I am aware that v4l2src is rather some raw accessor to cameras. What video
> format is libcamerasrc supposed to provide? Raw formats (Y8, bayer patterns)
> or already converted to RBGA etc.?

It depends on the pipeline handler.
Raw streams will be the unprocessed images from the sensor, so
typically Bayer or mono.
Processed streams depend on the ISP capabilities, but generally YUV or RGB/RGBx.

> > I don't know the full details of the imx8 range, but believe the
> > libcamera folk were working with one of the imx8 platforms.
>
> If an ISP is required then it will probably be imx8mp.
>
> > > > I'm assuming you're not using Media Controller either, as v4l2src
> > > > won't set up Media Controller links correctly either.
> > >
> > > Well, actually I am using Media Controller. But I need to configure it
> > > before gstreamer usage. There is no specific reason for gstreamer, but we
> > > use this to verify features on downstream kernel.
> > >
<snip>
> > > Mh, using v4l2-ctl --set-ctrl=vertical_blanking=344 -d /dev/v4l-subdev2 I
> > > get 109.61fps for 1280x800.
> >
> > The sensor has an external clock signal (XVCLK) which can be between 6
> > and 27MHz. The driver only supports 24MHz. Is your module using a
> > 24MHz clock?
>
> Well, I assume it is. We are using an OV9281 camera from vision components.

Thank you - I happen to have one of those, so I can test. (I also have
OV9281 modules from InnoVision, Arducam, and possibly others).
Vision Components modules do have the joys of not being able to do a 16bit read.

> > > > I don't recall where I'd got the 200MPix/s value from - it's not
> > > > documented in the datasheet, but presumably from 160 * 10 / 8
> > > > (switching from 10 to 8 bits at the same output rate). You're the
> > > > first to notice the rates are off, although at least it's less than
> > > > the factor of two that this driver used to be out by.
> > >
> > > I admit I'm not fully sure which results are correct and what they are
> > >
> > > expected to be. But here are some results using the v4l-ctrl approach:
> > >      | 1280x800 | 1280x720 | 640x400 |
> > >
> > > -----+----------+----------+---------+
> > > GREY |  68.84   |   72.0   |  73.50  |
> > > Y10  |  57.37   |   60.0   |  73.50  |
> > >
> > > All using their default vertical and horizontal blanking. Especially
> > > switching to 640x400 and then back to 1280x720 leaves the
> > > horizontal_blanking to the old (640) value, resulting in lower frame
> > > rates.
> >
> > IMHO This isn't clear in the docs.
> > My understanding is that controls shouldn't change value when changing
> > modes unless the new mode requires updating the range for the control
> > such that the current value is invalid. This does mean that the
> > framerate will change if you change modes without reprogramming, but
> > what heuristics should be used if you did update it?
>
> For 1280 the default horizontal_blanking is 250, but when changing to 640 the
> minimum also increased to 890. When switching back horizontal_blanking stays
> at 890, as it is still a valid value.
>
> > Options:
> > 1) retain the current frame rate by recomputing VBLANK, but there will
> > be conditions where you can't achieve the same frame rate in all
> > modes.
> > 2) reset to a default frame rate, but how do you define that? Do you
> > have to detect change of mode vs just calling S_FMT with the same
> > mode?
> > 3) adjust the limits but otherwise leave the control alone.
> > 4) as 3, but update the default value to reflect some standard
> > framerate (but how do you define that standard?)
> >
> > Different sensors are currently doing different things, so the only
> > approach you can really take is for userspace to set the controls
> > explicitly after setting a mode.
>
> I'm not sure what is the best way to go, all options have different use cases
> in mind. At least one should be aware that some controls might change when
> switching modes.

Switching is the interesting part.
I had an annoyance trying to test variable HBLANK support on imx290
before libcamera supported it. libcamera (at least on the Pi) always
explicitly sets the mode when run, therefore the HBLANK I was setting
was always being reset due to s_fmt being called on the driver, hence
my comment above about detecting a change of mode or not.

Without any definition of the correct behaviour you find different
drivers do different things, and userspace has to handle all
parameters or suffer unexpected results :-(

> > Sakari will normally point to the CCS driver as a model for raw
> > sensors, and that appears to adopt option 3. There was a thread with
> > Jacopo recently over this same subject, but no resolution. I think it
> > was on the ar0521 patchset.
> >
> > Clean boot and testing in this order:
> > - 1280x720 Y10P 63.05fps
> > - 1280x800 Y10P 60.28fps
> > - 640x400 Y10P 77.22fps
> > Reboot so that the HBLANK change is reset
> > - 1280x720 GREY 75.65fps
> > - 1280x800 GREY 72.33fps
> > - 640x400 GREY 92.67fps.

Tested with my Vision Components OV9281, and I get identical numbers
to those above.

> > I don't believe your GREY 640x400 number as it's the same as your
> > 640x400 Y10 value, but all your other values except 1280x800 Y10
> > differ from mine by a factor of 1.0507. (1280x800 Y10 is x1.099).
> > I'd suggest measuring your XVCLK clock signal with an oscilloscope or
> > frequency counter as I suspect it isn't 24MHz. 22.8MHz would give
> > these results, but is a slightly strange frequency if from a dedicated
> > oscillator rather than a PLL.
>
> I lack technical documentation for the camera hardware module, so I do not see
> a way to actually measuring XVCLK. AFAIK there is also an FPGA mounted which
> might affect the clock frequency as well.
>
> > Adding support for additional XVCLK frequencies isn't a huge task, but
> > involves computing the internal PLL settings. My datasheet only gives
> > settings for 24MHz, so it'd be back to the basic principles of PLL
> > config to do it.
>
> Until things are more clear I would skip that for now as this module should be
> running on a 24 MHz, I assume.

I've measured the output of the oscillator on my Vision Components
OV9281, and it is 24MHz.
The oscillator is the square silver package on the back of my module
by one of the screw holes. It is stamped U24 which would also indicate
24MHz. Holding the sensor with that silver component at the bottom
edge, the clock output is the top right pin of the package.

Unless yours is different for some reason, I'm out of ideas why you're
seeing different frame rates.

  Dave
