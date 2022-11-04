Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BD0B8619240
	for <lists+linux-media@lfdr.de>; Fri,  4 Nov 2022 08:55:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229548AbiKDHzU (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 4 Nov 2022 03:55:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36684 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229485AbiKDHzT (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 4 Nov 2022 03:55:19 -0400
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9D2C2DFAD
        for <linux-media@vger.kernel.org>; Fri,  4 Nov 2022 00:55:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1667548517; x=1699084517;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=0Ht8WIVtzA7VWzucTAtA0Q2uJ28IL/qn9GKCxfA9UoA=;
  b=qPyVZ4jNi65DCQrp9ZllVOqh0gSGd9hSqO/cghaJHtDgRuDJPfQGAw7l
   gW3eIgMmpems1OdJwEaAVTI4o4hWxFQCsxwvdoW03jFAkBr1svwKqT+DX
   McrXCqgx3yrYwPAAmgyLA6yz0yG2O41J46XKmc+GgwxKrrDES+YJlm6NR
   Gh4nqHtWquGHwT7DFhzhoSJrveU6VEEkGjvuHHQzPt4/SaWlcI/3CXmd+
   bw4aBLRnl4DJaaiuz0VW9+OqAejyamwkZDNoqf7YfDeXy3SZn7u2AIrdr
   Z0/BdwzkRTMrPiuNfA/H9qWiViPZnwlLX19XasGbbPQ5vUt35Wo55gkYF
   Q==;
X-IronPort-AV: E=Sophos;i="5.96,136,1665439200"; 
   d="scan'208";a="27154325"
Received: from unknown (HELO tq-pgp-pr1.tq-net.de) ([192.168.6.15])
  by mx1-pgp.tq-group.com with ESMTP; 04 Nov 2022 08:55:15 +0100
Received: from mx1.tq-group.com ([192.168.6.7])
  by tq-pgp-pr1.tq-net.de (PGP Universal service);
  Fri, 04 Nov 2022 08:55:15 +0100
X-PGP-Universal: processed;
        by tq-pgp-pr1.tq-net.de on Fri, 04 Nov 2022 08:55:15 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1667548515; x=1699084515;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=0Ht8WIVtzA7VWzucTAtA0Q2uJ28IL/qn9GKCxfA9UoA=;
  b=pnpYGHz/RmNyWrlBUc8SXPVCwaPnVeVZtLiGw8gsjRc0kPuW92ZJOdVU
   ga3LiZElw70uKjmcUqTmtt0T6rld+W8S188XrKEHux50DThJ4BQcnrWIS
   R8L5ktFn2B4V8r6mJy5jLTG1gBR9r+NPG/znvlEeAV4SoeVrXtQrpyhwU
   f4Wl2OgSfGpLzL2qOEMcmqk1pXnKt5WhfWfSpRyodZ4hqC2Qm8QlDlKiN
   ZnbZlrj48cXsPeRslwYDMgSM5sMeeCsYmonXckjBDlRi0aGmFmas1VYBk
   mfHK406o0o3MiUV3UYsmNdszFH/zWLCDd4lNSFvm+BEI1H/DyPrvVLH96
   A==;
X-IronPort-AV: E=Sophos;i="5.96,136,1665439200"; 
   d="scan'208";a="27154324"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
  by mx1.tq-group.com with ESMTP; 04 Nov 2022 08:55:15 +0100
Received: from steina-w.localnet (unknown [10.123.53.21])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id 0F146280056;
        Fri,  4 Nov 2022 08:55:15 +0100 (CET)
From:   Alexander Stein <alexander.stein@ew.tq-group.com>
To:     Dave Stevenson <dave.stevenson@raspberrypi.com>
Cc:     sakari.ailus@iki.fi, paul.j.murphy@intel.com,
        daniele.alessandrelli@intel.com, linux-media@vger.kernel.org,
        jacopo@jmondi.org
Subject: Re: [PATCH v2 15/16] media: i2c: ov9282: Add support for 8bit readout
Date:   Fri, 04 Nov 2022 08:55:12 +0100
Message-ID: <5033961.0VBMTVartN@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <CAPY8ntCph4Ukpc89B7m6WLybAsvWzte9kVrvW9yTp6sGpOg4Zg@mail.gmail.com>
References: <20221028160902.2696973-1-dave.stevenson@raspberrypi.com> <3704299.R56niFO833@steina-w> <CAPY8ntCph4Ukpc89B7m6WLybAsvWzte9kVrvW9yTp6sGpOg4Zg@mail.gmail.com>
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

Am Donnerstag, 3. November 2022, 14:05:47 CET schrieb Dave Stevenson:
> Hi Alex
> 
> On Thu, 3 Nov 2022 at 09:09, Alexander Stein
> 
> <alexander.stein@ew.tq-group.com> wrote:
> > Hi Dave,
> > 
> > Am Dienstag, 1. November 2022, 19:20:47 CET schrieb Dave Stevenson:
> > > Hi Alexander
> > > 
> > > On Tue, 1 Nov 2022 at 15:04, Alexander Stein
> > > 
> > > <alexander.stein@ew.tq-group.com> wrote:
> > > > Hi Dave,
> > > > 
> > > > thanks for the fast reply.
> > > > 
> > > > Am Dienstag, 1. November 2022, 14:47:16 CET schrieb Dave Stevenson:
> > > > > Hi Alexander
> > > > > 
> > > > > On Tue, 1 Nov 2022 at 11:59, Alexander Stein
> > > 
> > > > > <alexander.stein@ew.tq-group.com> wrote:
> > > As per the docs link, raw sensors will be using the HBLANK and VBLANK
> > > controls, not VIDIOC_S_PARM.
> > > I don't know whether the GStreamer folks wish to add support to
> > > v4l2src to set those - libcamerasrc is going to be the more normal
> > > user of these sensors, but that generally means needing an ISP of some
> > > form. With just v4l2src you've got no AE / AGC control loops, so it is
> > > only of use in controlled lighting conditions.
> > 
> > I am aware that v4l2src is rather some raw accessor to cameras. What video
> > format is libcamerasrc supposed to provide? Raw formats (Y8, bayer
> > patterns) or already converted to RBGA etc.?
> 
> It depends on the pipeline handler.
> Raw streams will be the unprocessed images from the sensor, so
> typically Bayer or mono.
> Processed streams depend on the ISP capabilities, but generally YUV or
> RGB/RGBx.

Okay, thanks for the information. I'll try at some time, but this sounds very 
promising.

> > > I don't know the full details of the imx8 range, but believe the
> > > libcamera folk were working with one of the imx8 platforms.
> > 
> > If an ISP is required then it will probably be imx8mp.
> > 
> > > > > I'm assuming you're not using Media Controller either, as v4l2src
> > > > > won't set up Media Controller links correctly either.
> > > > 
> > > > Well, actually I am using Media Controller. But I need to configure it
> > > > before gstreamer usage. There is no specific reason for gstreamer, but
> > > > we
> > > > use this to verify features on downstream kernel.
> 
> <snip>
> 
> > > > Mh, using v4l2-ctl --set-ctrl=vertical_blanking=344 -d
> > > > /dev/v4l-subdev2 I
> > > > get 109.61fps for 1280x800.
> > > 
> > > The sensor has an external clock signal (XVCLK) which can be between 6
> > > and 27MHz. The driver only supports 24MHz. Is your module using a
> > > 24MHz clock?
> > 
> > Well, I assume it is. We are using an OV9281 camera from vision
> > components.
> 
> Thank you - I happen to have one of those, so I can test. (I also have
> OV9281 modules from InnoVision, Arducam, and possibly others).
> Vision Components modules do have the joys of not being able to do a 16bit
> read.

Dealing with broken auto-increment read can be handled by this change. There 
was also some discussion with Laurent about a generic i2c DT property for 
adding this flag.
--8<--
diff --git a/drivers/media/i2c/ov9282.c b/drivers/media/i2c/ov9282.c
index c689a4e97fcd..1be32ad1e285 100644
--- a/drivers/media/i2c/ov9282.c
+++ b/drivers/media/i2c/ov9282.c
@@ -194,6 +194,7 @@ struct ov9282 {
 static const struct regmap_config ov9282_regmap_config = {
        .reg_bits = 16,
        .val_bits = 8,
+       .use_single_read = true,
 };
 
 static const s64 link_freq[] = {
--8<--

> > > > > I don't recall where I'd got the 200MPix/s value from - it's not
> > > > > documented in the datasheet, but presumably from 160 * 10 / 8
> > > > > (switching from 10 to 8 bits at the same output rate). You're the
> > > > > first to notice the rates are off, although at least it's less than
> > > > > the factor of two that this driver used to be out by.
> > > > 
> > > > I admit I'm not fully sure which results are correct and what they are
> > > > 
> > > > expected to be. But here are some results using the v4l-ctrl approach:
> > > >      | 1280x800 | 1280x720 | 640x400 |
> > > > 
> > > > -----+----------+----------+---------+
> > > > GREY |  68.84   |   72.0   |  73.50  |
> > > > Y10  |  57.37   |   60.0   |  73.50  |
> > > > 
> > > > All using their default vertical and horizontal blanking. Especially
> > > > switching to 640x400 and then back to 1280x720 leaves the
> > > > horizontal_blanking to the old (640) value, resulting in lower frame
> > > > rates.
> > > 
> > > IMHO This isn't clear in the docs.
> > > My understanding is that controls shouldn't change value when changing
> > > modes unless the new mode requires updating the range for the control
> > > such that the current value is invalid. This does mean that the
> > > framerate will change if you change modes without reprogramming, but
> > > what heuristics should be used if you did update it?
> > 
> > For 1280 the default horizontal_blanking is 250, but when changing to 640
> > the minimum also increased to 890. When switching back
> > horizontal_blanking stays at 890, as it is still a valid value.
> > 
> > > Options:
> > > 1) retain the current frame rate by recomputing VBLANK, but there will
> > > be conditions where you can't achieve the same frame rate in all
> > > modes.
> > > 2) reset to a default frame rate, but how do you define that? Do you
> > > have to detect change of mode vs just calling S_FMT with the same
> > > mode?
> > > 3) adjust the limits but otherwise leave the control alone.
> > > 4) as 3, but update the default value to reflect some standard
> > > framerate (but how do you define that standard?)
> > > 
> > > Different sensors are currently doing different things, so the only
> > > approach you can really take is for userspace to set the controls
> > > explicitly after setting a mode.
> > 
> > I'm not sure what is the best way to go, all options have different use
> > cases in mind. At least one should be aware that some controls might
> > change when switching modes.
> 
> Switching is the interesting part.
> I had an annoyance trying to test variable HBLANK support on imx290
> before libcamera supported it. libcamera (at least on the Pi) always
> explicitly sets the mode when run, therefore the HBLANK I was setting
> was always being reset due to s_fmt being called on the driver, hence
> my comment above about detecting a change of mode or not.
> 
> Without any definition of the correct behaviour you find different
> drivers do different things, and userspace has to handle all
> parameters or suffer unexpected results :-(

That's unfortunate, but if you know about this you can deal with it somehow.
While fiddling with the controls on this driver I noticed too there is no 
definite answer how you should set the blanks when switching modes, each 
approach has their pros and cons.
I used raw configuration until now, being unaware of libcamera doing all the 
necessary things.

> > > Sakari will normally point to the CCS driver as a model for raw
> > > sensors, and that appears to adopt option 3. There was a thread with
> > > Jacopo recently over this same subject, but no resolution. I think it
> > > was on the ar0521 patchset.
> > > 
> > > Clean boot and testing in this order:
> > > - 1280x720 Y10P 63.05fps
> > > - 1280x800 Y10P 60.28fps
> > > - 640x400 Y10P 77.22fps
> > > Reboot so that the HBLANK change is reset
> > > - 1280x720 GREY 75.65fps
> > > - 1280x800 GREY 72.33fps
> > > - 640x400 GREY 92.67fps.
> 
> Tested with my Vision Components OV9281, and I get identical numbers
> to those above.

Okay, that's nice. At least we know the sensor driver is doing things right.

> > > I don't believe your GREY 640x400 number as it's the same as your
> > > 640x400 Y10 value, but all your other values except 1280x800 Y10
> > > differ from mine by a factor of 1.0507. (1280x800 Y10 is x1.099).
> > > I'd suggest measuring your XVCLK clock signal with an oscilloscope or
> > > frequency counter as I suspect it isn't 24MHz. 22.8MHz would give
> > > these results, but is a slightly strange frequency if from a dedicated
> > > oscillator rather than a PLL.
> > 
> > I lack technical documentation for the camera hardware module, so I do not
> > see a way to actually measuring XVCLK. AFAIK there is also an FPGA
> > mounted which might affect the clock frequency as well.
> > 
> > > Adding support for additional XVCLK frequencies isn't a huge task, but
> > > involves computing the internal PLL settings. My datasheet only gives
> > > settings for 24MHz, so it'd be back to the basic principles of PLL
> > > config to do it.
> > 
> > Until things are more clear I would skip that for now as this module
> > should be running on a 24 MHz, I assume.
> 
> I've measured the output of the oscillator on my Vision Components
> OV9281, and it is 24MHz.
> The oscillator is the square silver package on the back of my module
> by one of the screw holes. It is stamped U24 which would also indicate
> 24MHz. Holding the sensor with that silver component at the bottom
> edge, the clock output is the top right pin of the package.

Thanks, using this description I was able to verify mine is 24MHz (23.9-24.1) 
as well.

> Unless yours is different for some reason, I'm out of ideas why you're
> seeing different frame rates.

Can this be caused by something withing my platform (imx8mm) CSI-2 path which 
is different to yours?

Best regards,
Alexander



