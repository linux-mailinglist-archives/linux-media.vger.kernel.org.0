Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2D67161951C
	for <lists+linux-media@lfdr.de>; Fri,  4 Nov 2022 12:04:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230132AbiKDLEk (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 4 Nov 2022 07:04:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41946 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229812AbiKDLEj (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 4 Nov 2022 07:04:39 -0400
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com [IPv6:2a00:1450:4864:20::52d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9476BDF
        for <linux-media@vger.kernel.org>; Fri,  4 Nov 2022 04:04:37 -0700 (PDT)
Received: by mail-ed1-x52d.google.com with SMTP id z18so7046910edb.9
        for <linux-media@vger.kernel.org>; Fri, 04 Nov 2022 04:04:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=c51XjxNRlgdPHX7C+P+RFAOZZQhqXFPOFqZaqCyRHdc=;
        b=p0SqHT7dkzll7sLZyyJBGMMXKKPb/n6GKx532dyIME30TNzO9RqC8PWh2iJbTLAmPB
         gLRap7Wmja0xiOoG27nVB0kUgKs+/l7ZLu0fsf0g2yxs+k/4fqy4Kf3TO6XqqFsfdL8I
         4eJA61VXlfZMBiVBKxYNkNfFWxPQXTbt4UqstkH9stA2JSK/oVIGQDP1ladC+R66ALvg
         1b6Ym2RcMqDjoI21nuFZJaq5SHcZ/4YKB43LX9ve8Ex+F7n3vmNCxKdSg9biFZMn8+id
         BacfGwzl+KRRc2C+ZHDX3X85NH603NukXysw/KwVTdxnAEb3xgvnD6cqFI/bJiyO9fjL
         +RkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=c51XjxNRlgdPHX7C+P+RFAOZZQhqXFPOFqZaqCyRHdc=;
        b=SYmyIZzP3ESUFO39JABT5U2YmJ9FlIt/KwCsiBmkCaOeQnCNimd3S8b8UbpsEhQ7yb
         b4IdGFvEgxu8yCYvOJHM/STzST18FiV5komTRvMuMUEwdLAetkgS+6IRB60HXy1adiua
         FaTm+41NLOHHuBPxt4JVOoVesr9kesjhc6u+BjP+NQh7i4fy1+HkJxCjd1V6Gko810Ac
         l/3lQv7vpJsSLmxgMqlQCIJhg9v9GuJAi44up9I449KD/FRQWWbUkwmy9jYI1w4Q2//Q
         li0ua/H9xvynuT0ovRWZxN7unySNG9dUb5zqTSUM51KCrO9bmtL5sRH6oQF2ErRk7188
         Tjjw==
X-Gm-Message-State: ACrzQf2vIdKQ5MwJjKM0UTBDr0JD7Eg+sesNy5XIHvST8czzrg0OVs21
        dAj6ec3yv/Lmcuxz4n1ttBZXqpE0wVfcJ7EfXvXPBw==
X-Google-Smtp-Source: AMsMyM46J2sFXla1eLuFVA8IcAfRMp7I0B7WoVtNVF2HgAp3EXHp0JAl1tOOYp9GNMMnApkfUCAY87UhTkwBuRlsnRI=
X-Received: by 2002:a05:6402:c4d:b0:457:99ec:1837 with SMTP id
 cs13-20020a0564020c4d00b0045799ec1837mr4773292edb.86.1667559875400; Fri, 04
 Nov 2022 04:04:35 -0700 (PDT)
MIME-Version: 1.0
References: <20221028160902.2696973-1-dave.stevenson@raspberrypi.com>
 <3704299.R56niFO833@steina-w> <CAPY8ntCph4Ukpc89B7m6WLybAsvWzte9kVrvW9yTp6sGpOg4Zg@mail.gmail.com>
 <5033961.0VBMTVartN@steina-w>
In-Reply-To: <5033961.0VBMTVartN@steina-w>
From:   Dave Stevenson <dave.stevenson@raspberrypi.com>
Date:   Fri, 4 Nov 2022 11:04:18 +0000
Message-ID: <CAPY8ntCrP3pY4CSq6wJeQUGcGA-Pnq6+zK5fs2rx+wm3bpoVFg@mail.gmail.com>
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

Hi Alexander

On Fri, 4 Nov 2022 at 07:55, Alexander Stein
<alexander.stein@ew.tq-group.com> wrote:
>
> Hi Dave,
>
> Am Donnerstag, 3. November 2022, 14:05:47 CET schrieb Dave Stevenson:
> > Hi Alex
> >
> > On Thu, 3 Nov 2022 at 09:09, Alexander Stein
> >
> > <alexander.stein@ew.tq-group.com> wrote:
> > > Hi Dave,
> > >
> > > Am Dienstag, 1. November 2022, 19:20:47 CET schrieb Dave Stevenson:
> > > > Hi Alexander
> > > >
> > > > On Tue, 1 Nov 2022 at 15:04, Alexander Stein
> > > >
> > > > <alexander.stein@ew.tq-group.com> wrote:
> > > > > Hi Dave,
> > > > >
> > > > > thanks for the fast reply.
> > > > >
> > > > > Am Dienstag, 1. November 2022, 14:47:16 CET schrieb Dave Stevenson:
> > > > > > Hi Alexander
> > > > > >
> > > > > > On Tue, 1 Nov 2022 at 11:59, Alexander Stein
> > > >
> > > > > > <alexander.stein@ew.tq-group.com> wrote:
> > > > As per the docs link, raw sensors will be using the HBLANK and VBLANK
> > > > controls, not VIDIOC_S_PARM.
> > > > I don't know whether the GStreamer folks wish to add support to
> > > > v4l2src to set those - libcamerasrc is going to be the more normal
> > > > user of these sensors, but that generally means needing an ISP of some
> > > > form. With just v4l2src you've got no AE / AGC control loops, so it is
> > > > only of use in controlled lighting conditions.
> > >
> > > I am aware that v4l2src is rather some raw accessor to cameras. What video
> > > format is libcamerasrc supposed to provide? Raw formats (Y8, bayer
> > > patterns) or already converted to RBGA etc.?
> >
> > It depends on the pipeline handler.
> > Raw streams will be the unprocessed images from the sensor, so
> > typically Bayer or mono.
> > Processed streams depend on the ISP capabilities, but generally YUV or
> > RGB/RGBx.
>
> Okay, thanks for the information. I'll try at some time, but this sounds very
> promising.
>
> > > > I don't know the full details of the imx8 range, but believe the
> > > > libcamera folk were working with one of the imx8 platforms.
> > >
> > > If an ISP is required then it will probably be imx8mp.
> > >
> > > > > > I'm assuming you're not using Media Controller either, as v4l2src
> > > > > > won't set up Media Controller links correctly either.
> > > > >
> > > > > Well, actually I am using Media Controller. But I need to configure it
> > > > > before gstreamer usage. There is no specific reason for gstreamer, but
> > > > > we
> > > > > use this to verify features on downstream kernel.
> >
> > <snip>
> >
> > > > > Mh, using v4l2-ctl --set-ctrl=vertical_blanking=344 -d
> > > > > /dev/v4l-subdev2 I
> > > > > get 109.61fps for 1280x800.
> > > >
> > > > The sensor has an external clock signal (XVCLK) which can be between 6
> > > > and 27MHz. The driver only supports 24MHz. Is your module using a
> > > > 24MHz clock?
> > >
> > > Well, I assume it is. We are using an OV9281 camera from vision
> > > components.
> >
> > Thank you - I happen to have one of those, so I can test. (I also have
> > OV9281 modules from InnoVision, Arducam, and possibly others).
> > Vision Components modules do have the joys of not being able to do a 16bit
> > read.
>
> Dealing with broken auto-increment read can be handled by this change. There
> was also some discussion with Laurent about a generic i2c DT property for
> adding this flag.
> --8<--
> diff --git a/drivers/media/i2c/ov9282.c b/drivers/media/i2c/ov9282.c
> index c689a4e97fcd..1be32ad1e285 100644
> --- a/drivers/media/i2c/ov9282.c
> +++ b/drivers/media/i2c/ov9282.c
> @@ -194,6 +194,7 @@ struct ov9282 {
>  static const struct regmap_config ov9282_regmap_config = {
>         .reg_bits = 16,
>         .val_bits = 8,
> +       .use_single_read = true,
>  };
>
>  static const s64 link_freq[] = {
> --8<--

I forgot that one from your patchset. I just removed the one read from
the driver :-)

> > > > > > I don't recall where I'd got the 200MPix/s value from - it's not
> > > > > > documented in the datasheet, but presumably from 160 * 10 / 8
> > > > > > (switching from 10 to 8 bits at the same output rate). You're the
> > > > > > first to notice the rates are off, although at least it's less than
> > > > > > the factor of two that this driver used to be out by.
> > > > >
> > > > > I admit I'm not fully sure which results are correct and what they are
> > > > >
> > > > > expected to be. But here are some results using the v4l-ctrl approach:
> > > > >      | 1280x800 | 1280x720 | 640x400 |
> > > > >
> > > > > -----+----------+----------+---------+
> > > > > GREY |  68.84   |   72.0   |  73.50  |
> > > > > Y10  |  57.37   |   60.0   |  73.50  |
> > > > >
> > > > > All using their default vertical and horizontal blanking. Especially
> > > > > switching to 640x400 and then back to 1280x720 leaves the
> > > > > horizontal_blanking to the old (640) value, resulting in lower frame
> > > > > rates.
> > > >
> > > > IMHO This isn't clear in the docs.
> > > > My understanding is that controls shouldn't change value when changing
> > > > modes unless the new mode requires updating the range for the control
> > > > such that the current value is invalid. This does mean that the
> > > > framerate will change if you change modes without reprogramming, but
> > > > what heuristics should be used if you did update it?
> > >
> > > For 1280 the default horizontal_blanking is 250, but when changing to 640
> > > the minimum also increased to 890. When switching back
> > > horizontal_blanking stays at 890, as it is still a valid value.
> > >
> > > > Options:
> > > > 1) retain the current frame rate by recomputing VBLANK, but there will
> > > > be conditions where you can't achieve the same frame rate in all
> > > > modes.
> > > > 2) reset to a default frame rate, but how do you define that? Do you
> > > > have to detect change of mode vs just calling S_FMT with the same
> > > > mode?
> > > > 3) adjust the limits but otherwise leave the control alone.
> > > > 4) as 3, but update the default value to reflect some standard
> > > > framerate (but how do you define that standard?)
> > > >
> > > > Different sensors are currently doing different things, so the only
> > > > approach you can really take is for userspace to set the controls
> > > > explicitly after setting a mode.
> > >
> > > I'm not sure what is the best way to go, all options have different use
> > > cases in mind. At least one should be aware that some controls might
> > > change when switching modes.
> >
> > Switching is the interesting part.
> > I had an annoyance trying to test variable HBLANK support on imx290
> > before libcamera supported it. libcamera (at least on the Pi) always
> > explicitly sets the mode when run, therefore the HBLANK I was setting
> > was always being reset due to s_fmt being called on the driver, hence
> > my comment above about detecting a change of mode or not.
> >
> > Without any definition of the correct behaviour you find different
> > drivers do different things, and userspace has to handle all
> > parameters or suffer unexpected results :-(
>
> That's unfortunate, but if you know about this you can deal with it somehow.
> While fiddling with the controls on this driver I noticed too there is no
> definite answer how you should set the blanks when switching modes, each
> approach has their pros and cons.
> I used raw configuration until now, being unaware of libcamera doing all the
> necessary things.

I fully acknowledge that writing documentation isn't the fun part of
development, and writing good documentation is hard.
However we do have a need. I'm trying to sort a basic checklist for
sensor drivers, but I have other priorities at present.

> > > > Sakari will normally point to the CCS driver as a model for raw
> > > > sensors, and that appears to adopt option 3. There was a thread with
> > > > Jacopo recently over this same subject, but no resolution. I think it
> > > > was on the ar0521 patchset.
> > > >
> > > > Clean boot and testing in this order:
> > > > - 1280x720 Y10P 63.05fps
> > > > - 1280x800 Y10P 60.28fps
> > > > - 640x400 Y10P 77.22fps
> > > > Reboot so that the HBLANK change is reset
> > > > - 1280x720 GREY 75.65fps
> > > > - 1280x800 GREY 72.33fps
> > > > - 640x400 GREY 92.67fps.
> >
> > Tested with my Vision Components OV9281, and I get identical numbers
> > to those above.
>
> Okay, that's nice. At least we know the sensor driver is doing things right.
>
> > > > I don't believe your GREY 640x400 number as it's the same as your
> > > > 640x400 Y10 value, but all your other values except 1280x800 Y10
> > > > differ from mine by a factor of 1.0507. (1280x800 Y10 is x1.099).
> > > > I'd suggest measuring your XVCLK clock signal with an oscilloscope or
> > > > frequency counter as I suspect it isn't 24MHz. 22.8MHz would give
> > > > these results, but is a slightly strange frequency if from a dedicated
> > > > oscillator rather than a PLL.
> > >
> > > I lack technical documentation for the camera hardware module, so I do not
> > > see a way to actually measuring XVCLK. AFAIK there is also an FPGA
> > > mounted which might affect the clock frequency as well.
> > >
> > > > Adding support for additional XVCLK frequencies isn't a huge task, but
> > > > involves computing the internal PLL settings. My datasheet only gives
> > > > settings for 24MHz, so it'd be back to the basic principles of PLL
> > > > config to do it.
> > >
> > > Until things are more clear I would skip that for now as this module
> > > should be running on a 24 MHz, I assume.
> >
> > I've measured the output of the oscillator on my Vision Components
> > OV9281, and it is 24MHz.
> > The oscillator is the square silver package on the back of my module
> > by one of the screw holes. It is stamped U24 which would also indicate
> > 24MHz. Holding the sensor with that silver component at the bottom
> > edge, the clock output is the top right pin of the package.
>
> Thanks, using this description I was able to verify mine is 24MHz (23.9-24.1)
> as well.
>
> > Unless yours is different for some reason, I'm out of ideas why you're
> > seeing different frame rates.
>
> Can this be caused by something withing my platform (imx8mm) CSI-2 path which
> is different to yours?

The only way I can think of for getting lower framerates out than
expected is dropping frames, so I'd suggest looking at timestamps.
Adding --verbose to the v4l2-ctl --stream-mmap.... line will print the
timestamp for each buffers, as well as the fps. Are the timestamp
deltas as expected, and are there any that are doubled due to a
dropped frame. If the timestamps are even at some other value then I'm
totally stumped!

Is your receiver correctly configured for whether it is expecting
continuous or non-continuous clock? That can sometimes cause the
receiver to get confused and corrupt data - I seem to recall having
issues with that on ov5647.

  Dave

> Best regards,
> Alexander
>
>
>
