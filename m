Return-Path: <linux-media+bounces-31856-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F39DAAC594
	for <lists+linux-media@lfdr.de>; Tue,  6 May 2025 15:17:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C60763AE236
	for <lists+linux-media@lfdr.de>; Tue,  6 May 2025 13:15:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9E862280A4F;
	Tue,  6 May 2025 13:15:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="Ji0yynH5"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-yb1-f179.google.com (mail-yb1-f179.google.com [209.85.219.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41F1128003C
	for <linux-media@vger.kernel.org>; Tue,  6 May 2025 13:15:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746537315; cv=none; b=oEnKL2hOCdG/gIkTnDY87pZTZ1L/SD3j82ZgCie5FJASj9C3sMb8m7t2qZ0CMjyykIcpWxYMYHqB9QwffK4pOsPTVVEpuo2AoctFQu9IgZP5d6XqHtoqjpooBRjz/mx56slBqYoeGt2nEAoZmX0YiOXYqFxwdbjj/ATGYcE2oEo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746537315; c=relaxed/simple;
	bh=XXdqXNnAK0rpR2J6VvAfUAzwUgvTd5TI4RL1viv1mq0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OMwUPITfm2wbaPQKHYy93lrdnqp3X1oNUyYQB4vvPxdso0Xhbtrvy1Oe8Cbc+pDGDIHySqd3Z2t4LT8uYES4UdraJ+h4+60RS7vwXhBVjTbNpqJzN7ZGR8ids8LA61L4eMttYEyL3CVHHmblypIARovMZXSp6e2tdlulLX7Irfk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com; spf=pass smtp.mailfrom=raspberrypi.com; dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b=Ji0yynH5; arc=none smtp.client-ip=209.85.219.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=raspberrypi.com
Received: by mail-yb1-f179.google.com with SMTP id 3f1490d57ef6-e7387d4a336so4626803276.2
        for <linux-media@vger.kernel.org>; Tue, 06 May 2025 06:15:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1746537311; x=1747142111; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=9Jp3CS3APwfSM4DMbLpxybziMAAw4IVQW9IV7i7wly4=;
        b=Ji0yynH59SsCs8FVKsPmgDVxOFdws5F86+UOqSJRl1dv6dyA0AiG/dzxnQYxkqCezX
         NivPUumYlTAREol7GCrvtINgUEzpO8JhJ96CPz3L2z2i8tG+KCFrnU5Y5fz+W1YyMY0p
         jVdRq9kJ5WvJC7B26PPWp/5RgplhVY9zo/g3BQ2oEojzDK7TlZRsJZMBCSufMHNWjxHU
         4gHw2i8tP245wWLUyQoE40CNZ7MRmyQggg1M6Kn3cCCJGtaQmizM7zE8lLii0wBY02XU
         JAR9CEIC+3x7XBkvP/WVLegphIbz94ztbWPm0yqpNd40yyH+bL1226O8C319GJrDW985
         y33Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746537311; x=1747142111;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9Jp3CS3APwfSM4DMbLpxybziMAAw4IVQW9IV7i7wly4=;
        b=wuIWJDOWMhfuyEIgThzjw5Oy+LE6fiEJfvTXYrVfQAiRHw3QaY7hTORtAmSC43Hat8
         bI2k2F5NxtYBd+zcCT3cYudbgzIi3U95tuF/ZgyqsTQh1pXlY8jQw1AmI+8ZwxUosFZK
         SNi3f+9L4DkqSuvxuasNXX+mplnRIxoEoOKTsF7wScWZ4LKNRkg/bUkCd5UxobN6q407
         aohJz4INmgvkyHgT65NmWYWM3f6vJBIGcIBmE/Knhy9ODBnZI5tNCCxhKSxxDse1x2Rr
         b5QHwfH/WdfXtnXCxReOJyN02hDgSGgcP6IW15ESVRSenA1fBDpZkPuwRv6WsJ8a2kyu
         G9Mw==
X-Forwarded-Encrypted: i=1; AJvYcCXh7j2f2s5QGYDGT8Uk+a22dit25SZqeaHWcrD8iibLz5AFOPE6SWz7Y6D3qvflj5oInpRKUhYu8cJz8g==@vger.kernel.org
X-Gm-Message-State: AOJu0YyADyzhBLmWwOmL9G5NaQKyTQLQ1vO6qwlCq9dkP7vKmgd4cJ/p
	Xgmz+ZrAirrQm+xLxW3tc5N0+dXqjwct1o+1wafFStmARJomTiCT+2ame9YjIWKh1/QAsg/0Fnw
	JOJk5S6tCIh5zEzhPp/Hiv8fv5MsrUZEQ5gqdpA==
X-Gm-Gg: ASbGnculxptMlKT6IVKCQnewTPFz4u+gAE65rGsxg/aw/sABaExsX8lQk2pmXWhwABC
	TSZFImX9IJjK6CFDby89tW3XtwZwKF6RKGSdbz3fyHzDvyZCyDOZwQIpNqLZaznxTn7edGd3S4k
	/mWiDJHzdAAtF96hUmK6xPwDjKsNWQho5Pd/+DSLtn97W7XiH+2XycZQ==
X-Google-Smtp-Source: AGHT+IGcsWvVX/9r7MlxwNUMWki1M2BrSBPr+JjoUfsN4VD/psnc+CBrk+E7G5lgn0GjZx7HmvEFa9jP4Mn4PCteqyw=
X-Received: by 2002:a05:6902:4901:b0:e6d:f287:bf9 with SMTP id
 3f1490d57ef6-e757d2f3eeemr15080046276.22.1746537310806; Tue, 06 May 2025
 06:15:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250424-exuberant-carp-from-pluto-cce66c@houat>
 <CAPY8ntCzNckv8j0-yw-KmhS-CzXuMus6Q37XR-JS_xJD8=Qxeg@mail.gmail.com>
 <20250425-zealous-malachite-boar-f5384e@houat> <CAPY8ntAFCT4_JquvQ4C8Ov6Te8Hoxm36MJ6-ftRAM7Kxa5wZxA@mail.gmail.com>
 <20250506-cryptic-dove-from-atlantis-3addf4@houat>
In-Reply-To: <20250506-cryptic-dove-from-atlantis-3addf4@houat>
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Tue, 6 May 2025 14:14:51 +0100
X-Gm-Features: ATxdqUElvzM17-BaAAu9Z3RU8P_uO4ObjCI5VbWeM7LKEBWTRmPSeQVR-a7aMgE
Message-ID: <CAPY8ntD6i1eGxoFxmAMcczAgxgd0wWQLZ+pM4W1atXbci-i-OA@mail.gmail.com>
Subject: Re: upstream unicam not returning any buffer
To: Maxime Ripard <mripard@redhat.com>
Cc: Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>, linux-media@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Maxime

On Tue, 6 May 2025 at 13:07, Maxime Ripard <mripard@redhat.com> wrote:
>
> On Wed, Apr 30, 2025 at 12:09:51PM +0100, Dave Stevenson wrote:
> > Hi Maxime
> >
> > On Fri, 25 Apr 2025 at 08:05, Maxime Ripard <mripard@redhat.com> wrote:
> > >
> > > Hi Dave,
> > >
> > > On Thu, Apr 24, 2025 at 06:12:14PM +0100, Dave Stevenson wrote:
> > > > Hi Maxime
> > > >
> > > > On Thu, 24 Apr 2025 at 15:58, 'Maxime Ripard' via kernel-list
> > > > <kernel-list@raspberrypi.com> wrote:
> > > > >
> > > > > Hi,
> > > > >
> > > > > I've been trying to port a v4l2 application from the downstream unicam
> > > > > driver (with the 6.6 kernel) to upstream (6.13.11) kernel.
> > > > >
> > > > > While the application seemed to work ok with the downstream driver, the
> > > > > same code will never get any buffer from the upstream unicode driver.
> > > > > Either dqbuf will block forever (if it's blocking), or never return a
> > > > > buffer (if it's non-blocking).
> > > > >
> > > > > The media-controller topology after the application configured it is:
> > > > >
> > > > > Media controller API version 6.13.11
> > > > >
> > > > > Media device information
> > > > > ------------------------
> > > > > driver          unicam
> > > > > model           unicam
> > > > > serial
> > > > > bus info        platform:fe801000.csi
> > > > > hw revision     0x0
> > > > > driver version  6.13.11
> > > > >
> > > > > Device topology
> > > > > - entity 1: unicam (3 pads, 3 links, 0 routes)
> > > > >             type V4L2 subdev subtype Unknown flags 0
> > > > >             device node name /dev/v4l-subdev0
> > > > >         pad0: SINK
> > > > >                 [stream:0 fmt:RGB888_1X24/1280x720 field:none colorspace:srgb xfer:srgb ycbcr:601 quantization:lim-range]
> > > > >                 <- "tc358743 5-000f":0 [ENABLED,IMMUTABLE]
> > > > >         pad1: SOURCE
> > > > >                 [stream:0 fmt:RGB888_1X24/1280x720 field:none colorspace:srgb xfer:srgb ycbcr:601 quantization:lim-range]
> > > > >                 -> "unicam-image":0 [ENABLED,IMMUTABLE]
> > > > >         pad2: SOURCE
> > > > >                 -> "unicam-embedded":0 [ENABLED,IMMUTABLE]
> > > > >
> > > > > - entity 5: tc358743 5-000f (1 pad, 1 link, 0 routes)
> > > > >             type V4L2 subdev subtype Unknown flags 0
> > > > >             device node name /dev/v4l-subdev1
> > > > >         pad0: SOURCE
> > > > >                 [stream:0 fmt:RGB888_1X24/1280x720 field:none colorspace:srgb]
> > > > >                 [dv.caps:BT.656/1120 min:640x350@13000000 max:1920x1200@165000000 stds:CEA-861,DMT,CVT,GTF caps:progressive,reduced-blanking,custom]
> > > > >                 [dv.detect:BT.656/1120 1280x720p60 (1650x750) stds: flags:]
> > > > >                 [dv.current:BT.656/1120 1280x720p60 (1650x750) stds: flags:]
> > > > >                 -> "unicam":0 [ENABLED,IMMUTABLE]
> > > > >
> > > > > - entity 9: unicam-image (1 pad, 1 link)
> > > > >             type Node subtype V4L flags 1
> > > > >             device node name /dev/video0
> > > > >         pad0: SINK
> > > > >                 <- "unicam":1 [ENABLED,IMMUTABLE]
> > > > >
> > > > > - entity 15: unicam-embedded (1 pad, 1 link)
> > > > >              type Node subtype V4L flags 0
> > > > >              device node name /dev/video1
> > > > >         pad0: SINK
> > > > >                 <- "unicam":2 [ENABLED,IMMUTABLE]
> > > > >
> > > > > The interrupt count in /proc/interrupts increases with a somewhat
> > > > > reasonable rate, so it looks like I'm getting interrupts.
> > > > >
> > > > > Enabling the debug output of the unicam driver gives the following logs:
> > > > >
> > > > > [ 2522.686656] unicam fe801000.csi: Starting stream on image device
> > > > > [ 2522.687230] unicam fe801000.csi: Running with 2 data lanes, nodes 1
> > > > > [ 2522.847079] unicam fe801000.csi: ISR: ISTA: 0x1, STA: 0x50BE, sequence 0, lines done 0
> > > > > [ 2522.847105] unicam fe801000.csi: Scheduling dummy buffer for node 0
> > > > > [ 2522.914545] unicam fe801000.csi: ISR: ISTA: 0x1, STA: 0x50BC, sequence 0, lines done 819
> > > > > [ 2522.914569] unicam fe801000.csi: Scheduling dummy buffer for node 0
> > > > > [ 2522.947477] unicam fe801000.csi: ISR: ISTA: 0x1, STA: 0x50BE, sequence 0, lines done 1638
> > > > > [ 2522.947499] unicam fe801000.csi: Scheduling dummy buffer for node 0
> > > > > [ 2522.964145] unicam fe801000.csi: ISR: ISTA: 0x1, STA: 0x50BC, sequence 0, lines done 2457
> > > > > [ 2522.964167] unicam fe801000.csi: Scheduling dummy buffer for node 0
> > > > > [ 2522.997077] unicam fe801000.csi: ISR: ISTA: 0x1, STA: 0x50BE, sequence 0, lines done 3276
> > > > > [ 2522.997100] unicam fe801000.csi: Scheduling dummy buffer for node 0
> > > > > [ 2523.013744] unicam fe801000.csi: ISR: ISTA: 0x1, STA: 0x50BC, sequence 0, lines done 1059226
> > > > > [ 2523.013764] unicam fe801000.csi: Scheduling dummy buffer for node 0
> > > > > [ 2523.064544] unicam fe801000.csi: ISR: ISTA: 0x1, STA: 0x50BE, sequence 0, lines done 1059226
> > > > > [ 2523.064566] unicam fe801000.csi: Scheduling dummy buffer for node 0
> > > > > [ 2523.081210] unicam fe801000.csi: ISR: ISTA: 0x1, STA: 0x50BC, sequence 0, lines done 1059226
> > > > > [ 2523.081230] unicam fe801000.csi: Scheduling dummy buffer for node 0
> > > > > [ 2523.130810] unicam fe801000.csi: ISR: ISTA: 0x1, STA: 0x50BE, sequence 0, lines done 1059226
> > > > > [ 2523.130833] unicam fe801000.csi: Scheduling dummy buffer for node 0
> > > > > [ 2523.247880] unicam fe801000.csi: ISR: ISTA: 0x1, STA: 0x50BC, sequence 0, lines done 1059226
> > > > > [ 2523.247902] unicam fe801000.csi: Scheduling dummy buffer for node 0
> > > > >
> > > > > Do you know what could be going on? I tried to compare the upstream and
> > > > > downstream unicam drivers, and the interrupt handler seems to be
> > > > > slightly different, but I'm afraid I'm a bit out of my depth there.
> > > >
> > > > I must admit to not having run the upstream driver in anger.
> > > >
> > > > Your interrupt traces are odd for at least two reasons.
> > > >
> > > > ISTA always being 0x1 means only frame start events. No frame end
> > > > (0x2) or line count interrupts (0x4).
> > > > You should be getting 4 line count interrupts every frame or every 128
> > > > lines if greater, and frame end at the end of each frame. Your
> > > > interrupts are every 16.6ms (ish), which would follow with being FS
> > > > only.
> > > >
> > > > "lines done" is incrementing by more than the 720 lines expected for
> > > > the configured resolution. I suspect that it has updated the write
> > > > address to the new buffer, and they just happen to be contiguous (at
> > > > least to start with).
> > > > Downstream has code that (incorrectly) returns the buffer to the
> > > > internal queue if we get repeated FS events, but it probably wants to
> > > > return them to userspace with VB2_BUF_STATE_ERROR.
> > > >
> > > > I'll try to find a few minutes to battle the upstream driver with
> > > > tc358743 and see what I get.
> > >
> > > I guess if it was RGB, it could be a vsync polarity issue then and
> > > probably a DT issue, but I can't recall something similar for CSI.
> > >
> > > The DT overlay I've been using is:
> > >
> > > #include <dt-bindings/media/video-interfaces.h>
> > >
> > > /dts-v1/;
> > > /plugin/;
> > >
> > > &csi1 {
> > >         status = "okay";
> > >
> > >         port {
> > >                 csi1_ep: endpoint {
> > >                         remote-endpoint = <&tc358743_ep>;
> > >                         bus-type = <MEDIA_BUS_TYPE_CSI2_DPHY>;
> > >                         clock-noncontinuous;
> > >                         data-lanes = <1 2>;
> > >                 };
> > >         };
> > > };
> > >
> > > &i2c0 {
> > >         status = "okay";
> > > };
> > >
> > > &i2c0mux {
> > >         status = "okay";
> > > };
> > >
> > > &i2c0_1 {
> > >         #address-cells = <1>;
> > >         #size-cells = <0>;
> > >         status = "okay";
> > >
> > >         tc358743@f {
> > >                 compatible = "toshiba,tc358743";
> > >                 reg = <0x0f>;
> > >                 clock-names = "refclk";
> > >                 clocks = <&clk_27MHz>;
> > >
> > >                 port {
> > >                         tc358743_ep: endpoint {
> > >                                 remote-endpoint = <&csi1_ep>;
> > >                                 clock-noncontinuous;
> > >                                 clock-lanes = <0>;
> > >                                 data-lanes = <1 2>;
> > >                                 link-frequencies = /bits/ 64 <486000000>;
> >
> > As just relayed to you via IM, this looks to be the problem.
> > The mainline driver for tc358743 only supports a link freq of 297MHz,
> > and will log "untested bps per lane: X bps" if you ask for something
> > different. The PLL will be set for 486MHz, but the PHY settings remain
> > those for 297MHz.
> >
> > The Raspberry Pi kernel has a couple of patches that add support for
> > 486MHz / 972Mbit/s as that is then sufficient bandwidth to get 1080P30
> > RGB or 1080P50 UYVY over 2 data lanes. I did try upstreaming them ages
> > back, but memory says it sank in needing to verify FIFO fill level
> > register settings, which is nigh impossible to prove with the data
> > that Toshiba provide.
> >
> > Quick calcs say 2 lanes @ 297MHz / 594Mbit/s is enough for 720p60
> > UYVY, but won't allow 720p60 RGB.
> > 4 lanes @297MHz can do 1080p60 UYVY, but not RGB.
>
> You're right, thanks for the pointer to the patches in the RPi repo to
> enable the higher data rates, that was the culprit.
>
> Should we send them upstream?

I did back in 2017, and my memory was right that it the FIFO level
change that was the main stumbling block -
https://lore.kernel.org/all/cover.1505826082.git.dave.stevenson@raspberrypi.org/
Use of g_mbus_config has already been resolved.

I haven't checked if it's possible to support the faster link
frequency without the FIFO level change. Gut feel is that it will fail
as the FIFO will underflow due to starting to empty too soon.
It may be more acceptable to set the FIFO level based on the link
frequency. I don't believe I have sufficient information to make it
fully dynamic as Mauro had suggested.

FWIW I'm also aware that there are additional issues with that driver
regarding setting the numbers of lanes to use. The chip needs to match
line times between the HDMI and CSI2 interfaces, but
tc358743_num_csi_lanes_needed() isn't considering the vertical
blanking period and can therefore choose to use too few lanes. We have
an open downstream issue for that one at
https://github.com/raspberrypi/linux/issues/6322

  Dave

