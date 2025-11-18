Return-Path: <linux-media+bounces-47309-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 00C04C6A5A4
	for <lists+linux-media@lfdr.de>; Tue, 18 Nov 2025 16:39:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sea.lore.kernel.org (Postfix) with ESMTPS id EA81E2BEE0
	for <lists+linux-media@lfdr.de>; Tue, 18 Nov 2025 15:39:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EB3ED366570;
	Tue, 18 Nov 2025 15:38:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kCZ1izVT"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97E84366560
	for <linux-media@vger.kernel.org>; Tue, 18 Nov 2025 15:38:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763480332; cv=none; b=YFM6r0ILhduo5T8pR4F0Lm8yJCRwqjJ5xFsH6xEv7RSu6qy/M2fXpBn5M/CVTm8z0iuuGmcBqT0lqWIAHTZ6CrNPQncf717tBPGFS+F5W62htiGshnNMmkHfHNO4u6IoC4d1Bvf5iJLtkV0ahoOtzJ6C5KWgzA73JPaIcFDSjH0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763480332; c=relaxed/simple;
	bh=TNIBIfxYI6AAIyI04IulAbFflmrUw1MYAViDsS71Wao=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=qEbCWomZHrp/z6CXmkR0inklGDMbhPizf6yQYoV8GeNHLtvuQLn0gHSFg17b2/QyN691SDjNczR8H7zfNhYXHH/3NcTpLoFdMEKaqzOu76i0MM/bQbUcavNNAa7gv+N0iCICLixeeQBEhXE30X/1J+4hO1+fwzY5u+gRasJSgg0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kCZ1izVT; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-594270ec7f9so5200106e87.3
        for <linux-media@vger.kernel.org>; Tue, 18 Nov 2025 07:38:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763480327; x=1764085127; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=xspvNVsXMbGaTR7l3KEyjriaY/dbXJ06LPSODexFO00=;
        b=kCZ1izVTCwSZjQfZ+aF6NjT7LiM9xDbYgo5IwZNP+d/YgPxqI7OnrnHLd06GXqgL9q
         XsC6VtXqxsByWs404nSDb3cDN4+Pds9T07lBDI/kac40rOwCKHwU/dJ5cIXWBbBatGC+
         Xs/yljhTh/AXcJxFsDOFZILSDv+1qtjAxSN7if/Rzlhl8Xq2eWU1Z3AIHgu2Tb3jBMYV
         IsgE7QQVbGnazVr/n22wXrFKxNSHOwo5CqmfmVlgNzFjihu6PP/s2w+NuTgfLfjtJw98
         v2N6WBrObx+Ofl8EbU4AqzQYHlfx59p55CLQYRjInS4g2pZtv3Jha2rLyt0ubS7gbk1J
         Zb+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763480327; x=1764085127;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xspvNVsXMbGaTR7l3KEyjriaY/dbXJ06LPSODexFO00=;
        b=IYAhHEBPY6iOt6m/G90R6agEHg4Lr46Ehi2Hf2f/bTXhGJIriYXpq7WPj841CZ/bRf
         hE0cDrnsnk6/zKXmhE8r/jjaytQiRv+xnBjqIWueYGonhWqlRM98FUFqui3oODMyX+Hn
         yThOOj+uVOTpe7vgb44hU6fBb6zqGBfWwV8pV3mGAS5esv0+wqOVySE7GE6OvYLQpaq+
         V78k4BOyH5Lyf9LOiVUynXFiQ9Nitc9qBddSdPirg3G4oT6SX0tkiZ/nS1MzB9aoy5A1
         P5KIwBs76nG6hMKn5YzxzEuxoflSGZo5BRXlUw5LiZ+lTHZJwXLETjwlsi8sz/87u/S+
         kucQ==
X-Gm-Message-State: AOJu0Yzbu+kh5oi5aQZzcyl0lRoXraaTBz3brjjRiS8xtmvx4w5/fCJK
	ddZU2ncjVSUnBM7hwzXG7drIxtDNnPtpoCNYnWQdODbUrKhbB2b4+3uhQK7QdWRQngwanlFzLwh
	1ycuS5gmhj/9G2XdgIRZ/5m7592e4JDEU1PY=
X-Gm-Gg: ASbGncs2PY9qgKYV7DJ1uIOZCN27HPTzGdBQmVCdX5CLnf4nlJn2skDFlVR7DZfX2rH
	EV//4duGqDJZd4V5a6UcRlkY9AT4WTIxXbuDPhcIZQGqCwpgqr0uxoqt3BlFOWazatwIcXyNHrn
	t/FxGhCoySNNfY5bLUVVIJ5Of5PSl/K4K+iQbgQX+6Tpv2fRxn4M5I8XLt970YcKT3WoPqc9EpJ
	Uo4EMhhviZFjftIIGLV+z/GnO0b9eV9EuD1I8wsE3bi3sJLi5+l9Xh66nvVYhKVtMpxgu366GU/
	1v59cTQackgBlA==
X-Google-Smtp-Source: AGHT+IHz4lJtlRiLH3fFd48NOuSMyM/6Q1srkn+SvPvQBQpfvPZu0rei5ALBSYC201ZXh5RPUY3YoX+5sFuxx0Ig0V0=
X-Received: by 2002:a05:6512:2395:b0:595:8200:9f72 with SMTP id
 2adb3069b0e04-595841e60fcmr6732577e87.31.1763480327056; Tue, 18 Nov 2025
 07:38:47 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: =?UTF-8?Q?Matthias_Wei=C3=9Fer?= <m.weisser.m@gmail.com>
Date: Tue, 18 Nov 2025 16:39:57 +0100
X-Gm-Features: AWmQ_bmc30N41MrM1PPqVSITo8qUQJo1O6cnOrN93xaylUeXlgJFDHsVJIPKfFo
Message-ID: <CAO8h3eEz=-LfrHcsGMcQ3kQHZKZgkQw9gwygBmeC1ASdMHg3YQ@mail.gmail.com>
Subject: imx7-media-csi: Adding BT656 format
To: linux-media@vger.kernel.org
Cc: Rui Miguel Silva <rmfrfs@gmail.com>, Purism Kernel Team <kernel@puri.sm>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Martin Kepplinger <martin.kepplinger@puri.sm>
Content-Type: text/plain; charset="UTF-8"

Hi

I am hoping for some basic help here regarding a feature I want to add to
to imx7-media-csi.c.

(taking the maintainers in CC, hoping this is okay)

If this is not the right place to ask my stupid questions please advice.

I have a custom board with a TW9990 analog video decoder connected
to an iMX6SX. For the TW9990 I use a slightly modified version of
tw9910.c. I use the following DT:

&i2c3 {
    tvin1@44 {
        compatible = "renesas,tw9990";
        reg = <0x44>;

        port {
            tw9990_1_to_parallel: endpoint {
                remote-endpoint = <&parallel_from_tw9990_1>;
                bus-width = <8>;
                data-shift = <2>; /* your board wiring */
                hsync-active = <0>;
                vsync-active = <0>;
                pclk-sample = <1>;
                bus-type = <MEDIA_BUS_TYPE_BT656>;
            };
        };
    };
};

&csi1 {
    pinctrl-names = "default";
    pinctrl-0 = <&pinctrl_csi1>;
    status = "okay";

    port {
        parallel_from_tw9990_1: endpoint {
            remote-endpoint = <&tw9990_1_to_parallel>;
            bus-width = <8>;
            bus-type = <MEDIA_BUS_TYPE_BT656>;
        };
    };
};

Issuing this command

# v4l2-ctl -d /dev/video0 --stream-mmap --stream-count=50 --stream-to=frame.raw

enables the TW9990 and it starts streaming the analog video signal in
BT656 format to the iMX. I verified that using an osscilloscope.
But I see no interrupt generated by the CSI module. I am sure I have to
add BT656 format handling to the driver but have no idea where to start.

I have also verified that the hardware is working correctly by implementing
a simple capture driver, not in the context of v4l2, but with my own very
hakish uio implementation.

Some maybe helpful outputs:

# media-ctl -v -p
Opening media device /dev/media0
Enumerating entities
looking up device: 81:1
looking up device: 81:0
looking up device: 81:2
Found 3 entities
Enumerating pads and links
Media controller API version 6.6.52

Media device information
------------------------
driver          imx7-csi
model           imx-media
serial
bus info        platform:2214000.csi
hw revision     0x0
driver version  6.6.52

Device topology
Streams API not supported
- entity 1: csi (2 pads, 2 links, 0 routes)
            type V4L2 subdev subtype Unknown flags 0
            device node name /dev/v4l-subdev0
        pad0: SINK
                [stream:0 fmt:UYVY8_2X8/640x480 field:none
colorspace:smpte170m xfer:709 ycbcr:601 quantization:lim-range]
                <- "tw9910 2-0044":0 [ENABLED,IMMUTABLE]
        pad1: SOURCE
                [stream:0 fmt:UYVY8_2X8/640x480 field:none
colorspace:smpte170m xfer:709 ycbcr:601 quantization:lim-range]
                -> "csi capture":0 [ENABLED,IMMUTABLE]

- entity 4: csi capture (1 pad, 1 link)
            type Node subtype V4L flags 0
            device node name /dev/video0
        pad0: SINK
                <- "csi":1 [ENABLED,IMMUTABLE]

Streams API not supported
- entity 10: tw9910 2-0044 (1 pad, 1 link, 0 routes)
             type V4L2 subdev subtype Decoder flags 0
             device node name /dev/v4l-subdev1
        pad0: SOURCE
                [stream:0 fmt:UYVY8_2X8/640x480 field:interlaced-bt
colorspace:smpte170m
                 crop.bounds:(0,0)/640x480
                 crop:(0,0)/640x480]
                -> "csi":0 [ENABLED,IMMUTABLE]

