Return-Path: <linux-media+bounces-31437-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BFBFAA4989
	for <lists+linux-media@lfdr.de>; Wed, 30 Apr 2025 13:10:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 124499A3804
	for <lists+linux-media@lfdr.de>; Wed, 30 Apr 2025 11:10:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 360DE24A05B;
	Wed, 30 Apr 2025 11:10:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="RIEZVkbF"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com [209.85.128.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 429B521ADB0
	for <linux-media@vger.kernel.org>; Wed, 30 Apr 2025 11:10:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746011415; cv=none; b=FXIyL8VkMQgq8Uy9Z7XQekhA6mzF0sppztnYKpcBuozL/Mvs6BD7pb5MzjfEZVWjXzknF+KFme55qv231dkiqGBza65MwRxzOM0HE36o66C8LbupEp1Ff9VUdnMj0qtugRgsJFVa4yyBYYe1fK5xgHQmedfpzphZhBffFtnYBaI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746011415; c=relaxed/simple;
	bh=FpWTEyfQC0fQ7sryQ1feqh77rxT93wBTwrF4DwJspvM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rBlakN1agvK/5+deCoAXhFJRZ59aNR5dOydkR6EZjxbAn2Hz/xfuqxYthld34Ox5OBFq8YvM7kf5Q87JJe5McOXyM7p4iBLgC0rqTLImrokiSDUFOgg0XH3/vqOP2YlmJaLwiIcq6NHgsphX6Sv+yWg30F6NUml290320AjshBs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com; spf=pass smtp.mailfrom=raspberrypi.com; dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b=RIEZVkbF; arc=none smtp.client-ip=209.85.128.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=raspberrypi.com
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-708a853c362so13171597b3.2
        for <linux-media@vger.kernel.org>; Wed, 30 Apr 2025 04:10:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1746011412; x=1746616212; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=qKcL9QFKUg3b+VMjytNue9LkB8pTRqnyhuDyoTkftzw=;
        b=RIEZVkbFEYu0u3dIsEkWa3lHGjfL2V1ZILaCGTe9aott0xlEn7o58U23O7Ug4UBJlV
         dJHR4BnqNuZSi/EEPE8+juRTJg6dCmt8+EVH1aQnZzm+jts2YsPjx74povPsFFK0ELQB
         UT8FVlOe5zY+upJr3gY/74HglWewkwfiJADN8xtrS0SmbgnK+M53Yuzv+ZwaK5QQ7M1O
         OkVDSbVHXrmFf0Oq7mjMX8HRl+I7IcQOEZT6Ywzlp9n2CtaLLsux8IBJdNFL3APhhREr
         LKpKEpO8rxJmpT34zU9Is75pKiv6Yyn40SFQ0KoLo2g/7KS0jzhD/Iwtb6QnUvVqJeEv
         6+wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746011412; x=1746616212;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qKcL9QFKUg3b+VMjytNue9LkB8pTRqnyhuDyoTkftzw=;
        b=kAB1fNbSjgkW/Ew1UqleiyNpw2tSyksJShmf5Op+03kw+UEakfatPZnM/YUzJMy8Sc
         Uykt3MGq0/jamM7aZapOZ/OvdyYTJ4gpY6iFdb6FJhiXQ4WH52FCqOhsRw6Rfh0La9Qf
         kx5jUT4ayxL0NR31RPwnptoRcguTv0da8rXlHM19c9TOAEYg9LW00F+PihfG1/RMQ04b
         0GZ1TDAkFCzt+40drqSQC5EDodRmRNify6JUwrLR2hpFC3o6sob35UCLyD3MoZv/QEfZ
         cl97sM0IfN1BDV8G4Qg8ZyGWIxeH5driN/pNMflm9MfzqKdqSkofNhlJAu0CjKNGVSDz
         TJKQ==
X-Forwarded-Encrypted: i=1; AJvYcCWFwO4DCBlTyuf8qCvOo54tquLkCcbCEE8mx1nhOR9AFF20iBq+o2yt/xCMolzlW8BGZIb/4DhJy4VSmA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzjSJvd9LlcmW3b/t0LSGAX3pYh8JMrgPRaHVJ1AYMHn2l0SEXe
	vvMKtvJbxbrCfnCGXBI41eZu9qXuyzSYOWHYE6cgKxpWUX/b1joh/h67nfW2hzp/4xJb0bHrjS1
	iLCwHKiPFYjIPhZk8CLcm2zcECbMlTDPcs+Yb2Yut4hN1Q+vPaps=
X-Gm-Gg: ASbGnctX1HXlCijEKesNd5WhCGvrfG+Hj4dPxaTU+S20gACSYwUb176XKwFnPEXQgHe
	39esrcQ45TsIiosLpNTwqmr9msHrXvHAxJApx9L8DezDSCbtIpVs/yYf6tJ1WMkaT+dv86K2W28
	CSB4t3BVJsGh2IdO3uTtcPT9elp9y4cuvvUiAc1pVCuPqm+TW9q1UVr/njImoYp+wn
X-Google-Smtp-Source: AGHT+IHhpvMh4Ux/LIchJ/UAvMKu0lBeryM3TM2TF+uOoFxBlng1+8FZ5bp8VqlWLCr/PReb3lCU+vnMRPnNgv+5mAE=
X-Received: by 2002:a05:690c:7443:b0:6fb:a696:b23b with SMTP id
 00721157ae682-708abe58121mr39447697b3.33.1746011411940; Wed, 30 Apr 2025
 04:10:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250424-exuberant-carp-from-pluto-cce66c@houat>
 <CAPY8ntCzNckv8j0-yw-KmhS-CzXuMus6Q37XR-JS_xJD8=Qxeg@mail.gmail.com> <20250425-zealous-malachite-boar-f5384e@houat>
In-Reply-To: <20250425-zealous-malachite-boar-f5384e@houat>
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Wed, 30 Apr 2025 12:09:51 +0100
X-Gm-Features: ATxdqUFMqOsRA7uyCVOmOp6xtgFzDN19hTdS3M5AtEy08CwpErThHytUxi8fIFI
Message-ID: <CAPY8ntAFCT4_JquvQ4C8Ov6Te8Hoxm36MJ6-ftRAM7Kxa5wZxA@mail.gmail.com>
Subject: Re: upstream unicam not returning any buffer
To: Maxime Ripard <mripard@redhat.com>
Cc: Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>, linux-media@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Maxime

On Fri, 25 Apr 2025 at 08:05, Maxime Ripard <mripard@redhat.com> wrote:
>
> Hi Dave,
>
> On Thu, Apr 24, 2025 at 06:12:14PM +0100, Dave Stevenson wrote:
> > Hi Maxime
> >
> > On Thu, 24 Apr 2025 at 15:58, 'Maxime Ripard' via kernel-list
> > <kernel-list@raspberrypi.com> wrote:
> > >
> > > Hi,
> > >
> > > I've been trying to port a v4l2 application from the downstream unicam
> > > driver (with the 6.6 kernel) to upstream (6.13.11) kernel.
> > >
> > > While the application seemed to work ok with the downstream driver, the
> > > same code will never get any buffer from the upstream unicode driver.
> > > Either dqbuf will block forever (if it's blocking), or never return a
> > > buffer (if it's non-blocking).
> > >
> > > The media-controller topology after the application configured it is:
> > >
> > > Media controller API version 6.13.11
> > >
> > > Media device information
> > > ------------------------
> > > driver          unicam
> > > model           unicam
> > > serial
> > > bus info        platform:fe801000.csi
> > > hw revision     0x0
> > > driver version  6.13.11
> > >
> > > Device topology
> > > - entity 1: unicam (3 pads, 3 links, 0 routes)
> > >             type V4L2 subdev subtype Unknown flags 0
> > >             device node name /dev/v4l-subdev0
> > >         pad0: SINK
> > >                 [stream:0 fmt:RGB888_1X24/1280x720 field:none colorspace:srgb xfer:srgb ycbcr:601 quantization:lim-range]
> > >                 <- "tc358743 5-000f":0 [ENABLED,IMMUTABLE]
> > >         pad1: SOURCE
> > >                 [stream:0 fmt:RGB888_1X24/1280x720 field:none colorspace:srgb xfer:srgb ycbcr:601 quantization:lim-range]
> > >                 -> "unicam-image":0 [ENABLED,IMMUTABLE]
> > >         pad2: SOURCE
> > >                 -> "unicam-embedded":0 [ENABLED,IMMUTABLE]
> > >
> > > - entity 5: tc358743 5-000f (1 pad, 1 link, 0 routes)
> > >             type V4L2 subdev subtype Unknown flags 0
> > >             device node name /dev/v4l-subdev1
> > >         pad0: SOURCE
> > >                 [stream:0 fmt:RGB888_1X24/1280x720 field:none colorspace:srgb]
> > >                 [dv.caps:BT.656/1120 min:640x350@13000000 max:1920x1200@165000000 stds:CEA-861,DMT,CVT,GTF caps:progressive,reduced-blanking,custom]
> > >                 [dv.detect:BT.656/1120 1280x720p60 (1650x750) stds: flags:]
> > >                 [dv.current:BT.656/1120 1280x720p60 (1650x750) stds: flags:]
> > >                 -> "unicam":0 [ENABLED,IMMUTABLE]
> > >
> > > - entity 9: unicam-image (1 pad, 1 link)
> > >             type Node subtype V4L flags 1
> > >             device node name /dev/video0
> > >         pad0: SINK
> > >                 <- "unicam":1 [ENABLED,IMMUTABLE]
> > >
> > > - entity 15: unicam-embedded (1 pad, 1 link)
> > >              type Node subtype V4L flags 0
> > >              device node name /dev/video1
> > >         pad0: SINK
> > >                 <- "unicam":2 [ENABLED,IMMUTABLE]
> > >
> > > The interrupt count in /proc/interrupts increases with a somewhat
> > > reasonable rate, so it looks like I'm getting interrupts.
> > >
> > > Enabling the debug output of the unicam driver gives the following logs:
> > >
> > > [ 2522.686656] unicam fe801000.csi: Starting stream on image device
> > > [ 2522.687230] unicam fe801000.csi: Running with 2 data lanes, nodes 1
> > > [ 2522.847079] unicam fe801000.csi: ISR: ISTA: 0x1, STA: 0x50BE, sequence 0, lines done 0
> > > [ 2522.847105] unicam fe801000.csi: Scheduling dummy buffer for node 0
> > > [ 2522.914545] unicam fe801000.csi: ISR: ISTA: 0x1, STA: 0x50BC, sequence 0, lines done 819
> > > [ 2522.914569] unicam fe801000.csi: Scheduling dummy buffer for node 0
> > > [ 2522.947477] unicam fe801000.csi: ISR: ISTA: 0x1, STA: 0x50BE, sequence 0, lines done 1638
> > > [ 2522.947499] unicam fe801000.csi: Scheduling dummy buffer for node 0
> > > [ 2522.964145] unicam fe801000.csi: ISR: ISTA: 0x1, STA: 0x50BC, sequence 0, lines done 2457
> > > [ 2522.964167] unicam fe801000.csi: Scheduling dummy buffer for node 0
> > > [ 2522.997077] unicam fe801000.csi: ISR: ISTA: 0x1, STA: 0x50BE, sequence 0, lines done 3276
> > > [ 2522.997100] unicam fe801000.csi: Scheduling dummy buffer for node 0
> > > [ 2523.013744] unicam fe801000.csi: ISR: ISTA: 0x1, STA: 0x50BC, sequence 0, lines done 1059226
> > > [ 2523.013764] unicam fe801000.csi: Scheduling dummy buffer for node 0
> > > [ 2523.064544] unicam fe801000.csi: ISR: ISTA: 0x1, STA: 0x50BE, sequence 0, lines done 1059226
> > > [ 2523.064566] unicam fe801000.csi: Scheduling dummy buffer for node 0
> > > [ 2523.081210] unicam fe801000.csi: ISR: ISTA: 0x1, STA: 0x50BC, sequence 0, lines done 1059226
> > > [ 2523.081230] unicam fe801000.csi: Scheduling dummy buffer for node 0
> > > [ 2523.130810] unicam fe801000.csi: ISR: ISTA: 0x1, STA: 0x50BE, sequence 0, lines done 1059226
> > > [ 2523.130833] unicam fe801000.csi: Scheduling dummy buffer for node 0
> > > [ 2523.247880] unicam fe801000.csi: ISR: ISTA: 0x1, STA: 0x50BC, sequence 0, lines done 1059226
> > > [ 2523.247902] unicam fe801000.csi: Scheduling dummy buffer for node 0
> > >
> > > Do you know what could be going on? I tried to compare the upstream and
> > > downstream unicam drivers, and the interrupt handler seems to be
> > > slightly different, but I'm afraid I'm a bit out of my depth there.
> >
> > I must admit to not having run the upstream driver in anger.
> >
> > Your interrupt traces are odd for at least two reasons.
> >
> > ISTA always being 0x1 means only frame start events. No frame end
> > (0x2) or line count interrupts (0x4).
> > You should be getting 4 line count interrupts every frame or every 128
> > lines if greater, and frame end at the end of each frame. Your
> > interrupts are every 16.6ms (ish), which would follow with being FS
> > only.
> >
> > "lines done" is incrementing by more than the 720 lines expected for
> > the configured resolution. I suspect that it has updated the write
> > address to the new buffer, and they just happen to be contiguous (at
> > least to start with).
> > Downstream has code that (incorrectly) returns the buffer to the
> > internal queue if we get repeated FS events, but it probably wants to
> > return them to userspace with VB2_BUF_STATE_ERROR.
> >
> > I'll try to find a few minutes to battle the upstream driver with
> > tc358743 and see what I get.
>
> I guess if it was RGB, it could be a vsync polarity issue then and
> probably a DT issue, but I can't recall something similar for CSI.
>
> The DT overlay I've been using is:
>
> #include <dt-bindings/media/video-interfaces.h>
>
> /dts-v1/;
> /plugin/;
>
> &csi1 {
>         status = "okay";
>
>         port {
>                 csi1_ep: endpoint {
>                         remote-endpoint = <&tc358743_ep>;
>                         bus-type = <MEDIA_BUS_TYPE_CSI2_DPHY>;
>                         clock-noncontinuous;
>                         data-lanes = <1 2>;
>                 };
>         };
> };
>
> &i2c0 {
>         status = "okay";
> };
>
> &i2c0mux {
>         status = "okay";
> };
>
> &i2c0_1 {
>         #address-cells = <1>;
>         #size-cells = <0>;
>         status = "okay";
>
>         tc358743@f {
>                 compatible = "toshiba,tc358743";
>                 reg = <0x0f>;
>                 clock-names = "refclk";
>                 clocks = <&clk_27MHz>;
>
>                 port {
>                         tc358743_ep: endpoint {
>                                 remote-endpoint = <&csi1_ep>;
>                                 clock-noncontinuous;
>                                 clock-lanes = <0>;
>                                 data-lanes = <1 2>;
>                                 link-frequencies = /bits/ 64 <486000000>;

As just relayed to you via IM, this looks to be the problem.
The mainline driver for tc358743 only supports a link freq of 297MHz,
and will log "untested bps per lane: X bps" if you ask for something
different. The PLL will be set for 486MHz, but the PHY settings remain
those for 297MHz.

The Raspberry Pi kernel has a couple of patches that add support for
486MHz / 972Mbit/s as that is then sufficient bandwidth to get 1080P30
RGB or 1080P50 UYVY over 2 data lanes. I did try upstreaming them ages
back, but memory says it sank in needing to verify FIFO fill level
register settings, which is nigh impossible to prove with the data
that Toshiba provide.

Quick calcs say 2 lanes @ 297MHz / 594Mbit/s is enough for 720p60
UYVY, but won't allow 720p60 RGB.
4 lanes @297MHz can do 1080p60 UYVY, but not RGB.

I hope that helps.
  Dave

