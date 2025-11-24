Return-Path: <linux-media+bounces-47656-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D7767C8028C
	for <lists+linux-media@lfdr.de>; Mon, 24 Nov 2025 12:17:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 51F523A7B63
	for <lists+linux-media@lfdr.de>; Mon, 24 Nov 2025 11:14:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 41EFF2FD682;
	Mon, 24 Nov 2025 11:14:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QWP/38TX"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ot1-f49.google.com (mail-ot1-f49.google.com [209.85.210.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB6942FC865
	for <linux-media@vger.kernel.org>; Mon, 24 Nov 2025 11:14:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763982875; cv=none; b=jvpG4VcF7FsxJlXHQIA0uKBJ/aspYMp+7Mba7rPS9aBUTyBsC7+8ItiHu/iXZxfdyhjQ9sNwVf1xcIDyPaOIG3u6VNxpaWeAfa8L0XIh3LBQpUv86Md9rJPt9DizhFiSGLCR7xlW37zVJVfFxi6wFyLEIeQkZNgiQehP7eKcCdw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763982875; c=relaxed/simple;
	bh=PCsp5fmE8iYMJz/XMgdoC8zotb3DTcBgR5kA1BS1MCY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MO0kS/CjOqY+lUSsl1pOtbN3I3UXYOb14zj9wYzSH9plpMgMA/mVfi9YklM4SV5rWOikNn7EwpD4BrBP18q5AlNrs/nC9pZV8NR8e2jfyr8zEruQ3eEKHzpySWTlDZGnjA31Y7ElNx1MxdCivuB1Y3Y9wWSbaRZdWcKJr8lrzqg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QWP/38TX; arc=none smtp.client-ip=209.85.210.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ot1-f49.google.com with SMTP id 46e09a7af769-7c75fd8067fso2503914a34.2
        for <linux-media@vger.kernel.org>; Mon, 24 Nov 2025 03:14:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763982872; x=1764587672; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Y1W+zZvOoc1F3DwiEbCfceViLdIQ4PbJXvBOG4FnKXQ=;
        b=QWP/38TXdelmP6lN/DAuoGjdOJ7LlN6y5SVpC3twilXSXZe3eQ60FJTFQkNYQXfClp
         uon0sYVWiEcuXAIM6clV4O3NtFsPrxCX06U2mC7cBxgwiluAwgYArb1gqMMrFFT1ilWG
         F0jFn3afMPkKs1cTZaSGtI1CsmtRtivQ9QKhC36k1EWZ5ysOIDiFlRaNHnfRLoXLpf27
         ja8CHNGdDfBC2tsg+Ed7k+NXNMtAf7ukKoYTfl8INIZ7OJ7TNZ9xCrD+9WwcRdyZUbIK
         drhoBR0DQJ8pjfz+CePbbzJitRMeNRlJYuyhHFcQUr14RMt/JBOOwMSRAOIpU+aMf75N
         LkBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763982872; x=1764587672;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Y1W+zZvOoc1F3DwiEbCfceViLdIQ4PbJXvBOG4FnKXQ=;
        b=uolxrcHiPdP7Rm4y3/UQHNF1BXeY9Wr2oBzDMkIZ3QZqiFAll+m9kn8a59e2DqutVx
         yA86Lo8F39e8gcLiJaPwxXacwPRrMh6uhaHBiOWh1rXFCuJWefXeBaX9dBccFE+DxLdB
         p2bfFCSXuR9fuCeR9upJG7k/qEEwan3BGS5NeXbrvgbz2ZNu8W/mPYhUBxt6F//8jjDm
         epZ0uWrjq8o7796cjwYtXj+o9H1sBkLYGrkZnhQgRpxLvN2TZ1MJcH7tNSPcI5yqp8eU
         VBZUdx4b3/RNwho0b/KxonmwN499LykBcpZTNJG6cgLBP4t9ZM/7xsuwuIWqjyV9wDej
         bhmw==
X-Gm-Message-State: AOJu0Yws4dImgBLVa+G5c39l0Dwop0+t3kQVpBxHvrfyiwHYrHlCPem6
	LO12gy14ML/pEEvXKqSAgHQ+rt3XWJXr8H1ZmWDs19zcjBfKDLWKL4YGMV94N8xSCDrDmMyBFV6
	44jKeBlTj/Sp2IfEJWBSjeaOaO0hTt3Ndlz+uGmA=
X-Gm-Gg: ASbGnctaT+fm6+UlAlnb5dyhfIhXYNB/DbcEhuqbP92sILeWSyXTZBDak8KccC78fsU
	7viNoFHFMZ0XySEbZsk0vNj+9y0gQIZbK6egr7HPrqwNK6CnKw+ui99l3c1l28KCo9dViop1lr5
	Igp2TxADIawBTKME65ePrg257FEQi7OdqR7JTaFk4t84SMDSSrrUjz7JLVwvK6MXQzq4juuepQV
	bCTCFGN5WWidzkBu3Uy6eW6F8Ehse3Y2rON9RICQBJnHOfrVW08aFFsvDyYXBUXD0tAEOjU
X-Google-Smtp-Source: AGHT+IGGGn0DcX/esrjigrgzMXPKcIidXlmHViyWkydLQBabJBLNO5QpF0Q4/URXik3E7aNBd7i5kKNq1yCHRZT1yTI=
X-Received: by 2002:a05:6830:6308:b0:7c7:6043:dd93 with SMTP id
 46e09a7af769-7c798b8b4demr6356973a34.13.1763982871627; Mon, 24 Nov 2025
 03:14:31 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAN7C2SA34JN71qvqyefmr9h11SsmCaeGGVyc=GW408+MrC-aRg@mail.gmail.com>
 <3qt2yxwubrxhbhst5o2ig5ng4wqokzfg6uqzrtc2lfzq2cjbds@uwdb3zg2a7vi>
 <CAN7C2SC+nDhoHonOB=AkKgsunyijuV0aAYvBJ1C5iaU76Q0U5Q@mail.gmail.com>
 <57px3akwyj6usy6llbichpu4ioaj7kj2sbv3jzqt3fo4bjknvd@hnw6docub3nr>
 <CAN7C2SB1ZG+6or=WMFEYu3DW2e4DBT7QEWE0SzUGt2dn9x=9gQ@mail.gmail.com> <eprej6n372zpf6atrhyzzee4cqoq742lmnhwjqgi4le735oj3s@5rjycx3q7ovf>
In-Reply-To: <eprej6n372zpf6atrhyzzee4cqoq742lmnhwjqgi4le735oj3s@5rjycx3q7ovf>
From: Sune Brian <briansune@gmail.com>
Date: Mon, 24 Nov 2025 19:14:20 +0800
X-Gm-Features: AWmQ_bkgNrOgpkE3YdXkumxOwfAkQDOcvRAU2FQ_9J0FU6-7R0GVNQtmxjhUN0U
Message-ID: <CAN7C2SB4XzQfixBcXmHbVPk1=PBD+MQLH7AbvT=cTnRgQOS=OA@mail.gmail.com>
Subject: Re: [HELP] V4L2 kept reporting CROPCAP fail
To: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Cc: linux-media@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

> media-ctl -p might help

> Are you setting up links and format by hand ??

Yes, because no matter what you still got to control the
crop and links setup right?

> (inb4: should you use libcamera instead ?)

I am trying to move the entire control concept from 4.19
to 6.18 which RK itself uses gst on camera in the old days.

* For what the media reports

media-ctl -d /dev/media0 -p
Media controller API version 6.18.0

Media device information
------------------------
driver          rkisp1
model           rkisp1
serial
bus info        platform:rkisp1
hw revision     0xa
driver version  6.18.0

Device topology
- entity 1: rkisp1_isp (4 pads, 5 links, 0 routes)
            type V4L2 subdev subtype Unknown flags 0
            device node name /dev/v4l-subdev0
        pad0: SINK,MUST_CONNECT
                [stream:0 fmt:SBGGR10_1X10/2688x1520 field:none
colorspace:raw xfer:none ycbcr:601 quantization:full-range
                 crop.bounds:(0,0)/2688x1520
                 crop:(0,0)/2688x1520]
                <- "rkisp1_csi":1 [ENABLED]
        pad1: SINK
                [stream:0 fmt:unknown/0x0 field:none]
                <- "rkisp1_params":0 [ENABLED,IMMUTABLE]
        pad2: SOURCE
                [stream:0 fmt:YUYV8_2X8/2688x1520 field:none
colorspace:raw xfer:none ycbcr:601 quantization:lim-range
                 crop.bounds:(0,0)/2688x1520
                 crop:(0,0)/2688x1520]
                -> "rkisp1_resizer_mainpath":0 [ENABLED]
                -> "rkisp1_resizer_selfpath":0 []
        pad3: SOURCE
                [stream:0 fmt:unknown/0x0 field:none]
                -> "rkisp1_stats":0 [ENABLED,IMMUTABLE]

- entity 6: rkisp1_resizer_mainpath (2 pads, 2 links, 0 routes)
            type V4L2 subdev subtype Unknown flags 0
            device node name /dev/v4l-subdev1
        pad0: SINK,MUST_CONNECT
                [stream:0 fmt:YUYV8_2X8/2688x1520 field:none
colorspace:srgb xfer:srgb ycbcr:601 quantization:lim-range
                 crop.bounds:(0,0)/2688x1520
                 crop:(0,0)/2688x1520]
                <- "rkisp1_isp":2 [ENABLED]
        pad1: SOURCE,MUST_CONNECT
                [stream:0 fmt:YUYV8_2X8/2688x1520 field:none
colorspace:srgb xfer:srgb ycbcr:601 quantization:lim-range]
                -> "rkisp1_mainpath":0 [ENABLED,IMMUTABLE]

- entity 9: rkisp1_resizer_selfpath (2 pads, 2 links, 0 routes)
            type V4L2 subdev subtype Unknown flags 0
            device node name /dev/v4l-subdev2
        pad0: SINK,MUST_CONNECT
                [stream:0 fmt:YUYV8_2X8/800x600 field:none
colorspace:srgb xfer:srgb ycbcr:601 quantization:lim-range
                 crop.bounds:(0,0)/800x600
                 crop:(0,0)/800x600]
                <- "rkisp1_isp":2 []
        pad1: SOURCE,MUST_CONNECT
                [stream:0 fmt:YUYV8_2X8/800x600 field:none
colorspace:srgb xfer:srgb ycbcr:601 quantization:lim-range]
                -> "rkisp1_selfpath":0 [ENABLED,IMMUTABLE]

- entity 12: rkisp1_mainpath (1 pad, 1 link)
             type Node subtype V4L flags 0
             device node name /dev/video0
        pad0: SINK
                <- "rkisp1_resizer_mainpath":1 [ENABLED,IMMUTABLE]

- entity 16: rkisp1_selfpath (1 pad, 1 link)
             type Node subtype V4L flags 0
             device node name /dev/video1
        pad0: SINK
                <- "rkisp1_resizer_selfpath":1 [ENABLED,IMMUTABLE]

- entity 20: rkisp1_stats (1 pad, 1 link)
             type Node subtype V4L flags 0
             device node name /dev/video2
        pad0: SINK
                <- "rkisp1_isp":3 [ENABLED,IMMUTABLE]

- entity 24: rkisp1_params (1 pad, 1 link)
             type Node subtype V4L flags 0
             device node name /dev/video3
        pad0: SOURCE
                -> "rkisp1_isp":1 [ENABLED,IMMUTABLE]

- entity 28: rkisp1_csi (2 pads, 2 links, 0 routes)
             type V4L2 subdev subtype Unknown flags 0
             device node name /dev/v4l-subdev3
        pad0: SINK,MUST_CONNECT
                [stream:0 fmt:SBGGR10_1X10/2688x1520 field:none]
                <- "ov4689 1-0036":0 [ENABLED]
        pad1: SOURCE,MUST_CONNECT
                [stream:0 fmt:SBGGR10_1X10/2688x1520 field:none]
                -> "rkisp1_isp":0 [ENABLED]

- entity 45: ov4689 1-0036 (1 pad, 1 link, 0 routes)
             type V4L2 subdev subtype Sensor flags 0
             device node name /dev/v4l-subdev4
        pad0: SOURCE
                [stream:0 fmt:SBGGR10_1X10/2688x1520 field:none
                 crop.bounds:(0,0)/2720x1536
                 crop:(16,8)/2688x1520]
                -> "rkisp1_csi":0 [ENABLED]


> Anyway, from a brief look at it, the implementation of v4l_cropcap()
> in v4l2-ioctl.c ends up calling g_selection() on your /dev/video0
> which I presume corresponds to the ISP main/self path.
>
> The capture devices on the RkISP1 ISP do not implement g_selection(),
> as the cropping/scaling is performed on the resizers, so
> I suspect you get a -ENOTTY there
>
> You can try reproduce using the --get-selection v4l2-ctl option (with
> any target) and see that it fails on /dev/video0 but should work on
> the resizer subdev

I am not sure I am getting you right but I will try.
I did not read all the code but from what I understand.

MIPI camera itself does not support crop by its own explanation as such.
* First it requires the IIC register setup from the beginning.
* Second it changed all timing and possible hazards. Which involves
DTS from first place.
* Third it make no reason on such when cropping on other layer is
more easier these days (pure my guess). But trade off my guess is
memory and bandwidth wasted.

# My replication of the command you proposed.

v4l2-ctl -d /dev/v4l-subdev4 --get-selection target=crop
VIDIOC_G_SELECTION: failed: Inappropriate ioctl for device

This is expected as above observation had explained.

> -------------------------------------------------------------------------------
> - entity 9: rkisp1_mainpath (1 pad, 1 link)
>             type Node subtype V4L flags 0
>             device node name /dev/video4
>         pad0: SINK
>                 <- "rkisp1_resizer_mainpath":1 [ENABLED,IMMUTABLE]
>
> ~# v4l2-ctl -d /dev/video4 --get-selection target=crop
> VIDIOC_G_SELECTION: failed: Inappropriate ioctl for device
> -------------------------------------------------------------------------------

Yes, I think it is aligned with my case. This is allowed.

v4l2-ctl -d /dev/v4l-subdev1 --get-subdev-selection pad=0,target=crop
ioctl: VIDIOC_SUBDEV_G_SELECTION (pad=0,stream=0)
Selection: crop, Left 0, Top 0, Width 2688, Height 1520, Flags:

> -------------------------------------------------------------------------------
> - entity 6: rkisp1_resizer_mainpath (2 pads, 2 links, 0 routes)
>             type V4L2 subdev subtype Unknown flags 0
>             device node name /dev/v4l-subdev9
>         pad0: SINK,MUST_CONNECT
>                 [stream:0 fmt:YUYV8_2X8/1920x1080 field:none colorspace:rec709 xfer:none ycbcr:601 quantization:lim-range
>                  crop.bounds:(0,0)/1920x1080
>                  crop:(0,0)/1920x1080]
>                 <- "rkisp1_isp":2 [ENABLED]
>         pad1: SOURCE,MUST_CONNECT
>                 [stream:0 fmt:YUYV8_1_5X8/1920x1080 field:none colorspace:rec709 xfer:none ycbcr:601 quantization:lim-range]
>                 -> "rkisp1_mainpath":0 [ENABLED,IMMUTABLE]
>
> ~# v4l2-ctl -d /dev/v4l-subdev9 --get-subdev-selection pad=0,target=crop
> ioctl: VIDIOC_SUBDEV_G_SELECTION (pad=0,stream=0)
> Selection: crop, Left 0, Top 0, Width 1920, Height 1080, Flags:
> -------------------------------------------------------------------------------
>
> I guess this is "expected"... you shouldn't try to operate a complex
> camera system like the rkisp1 with the v4l2-src element as it expects
> to operate on "simple" devices like USB camera where the whole
> configuration happens on a single /dev/video0.
>
> For complex cameras you should rather use libcamera (through the
> libcamerasrc plugin if you like gstreamer) which knows
> exactly on which part of the system to apply the right commands to.
>
> RkISP1 is one of the best supported devices in libcamera, so it should
> work out-of-the-box (last famous words) assuming your image sensor is
> supported.

Got to try.
Is that warming is expected or it is s.t. messed up?
Still not getting it. as I don't expect all layers must support crop features.

Brian

