Return-Path: <linux-media+bounces-33510-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D3FFAC6591
	for <lists+linux-media@lfdr.de>; Wed, 28 May 2025 11:19:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E38EA3A5E90
	for <lists+linux-media@lfdr.de>; Wed, 28 May 2025 09:18:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A05F1277023;
	Wed, 28 May 2025 09:19:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="js7Jjk1o"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com [209.85.160.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 764EC152E02
	for <linux-media@vger.kernel.org>; Wed, 28 May 2025 09:18:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748423940; cv=none; b=b7XhWP/6ERsk8AZYayDbrw+fdkf8x3FaYGtmX0vvyYqSEarWp8MQiNW8l8aGU08i+l/zoywVho1qVPPB+rJ2kAat/m6cmILKS8c6wXxt/v7iAE3UiMToXf8zNcwcRhUgjO5+56vu85nPVfIXrN/B+XiTuIIUZ0nQT9MmQpyG5q0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748423940; c=relaxed/simple;
	bh=lTh4iBr6QXjMUSBl2DaNtNJXY+G1+CpPmIOvfkr3fPI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Content-Type; b=jdBeMn+la7pxVvZFPuk5BxViiZa3VDeaCWne3K5k0YGdyy4twogJTs4JD+EsoAEUxDUSfAEVJ7fEPNWri/W/rbcIskgNcHV7mGgxE6MTqU3eyip50kCGfGSVywEzZEiJxteU5XitT9bZW4lr8leAzql0A1b1z5QSNcEKtlsqE5k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=js7Jjk1o; arc=none smtp.client-ip=209.85.160.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qt1-f175.google.com with SMTP id d75a77b69052e-4947635914aso44730171cf.3
        for <linux-media@vger.kernel.org>; Wed, 28 May 2025 02:18:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748423937; x=1749028737; darn=vger.kernel.org;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lgSKA2W2VDXmaE0PCmq0CnFtkG2OyiAdlD+PPWTrugA=;
        b=js7Jjk1oJ1heL4l3dccYnD+g5cQmha/1WtCRUE6KZYDc6JyXuuYnkmauSb9ktPPX/q
         FBK+RihYx5nY877QJAp55D2sJC4FFwCYwhJ6012hTLN1om/VwghH7P8SejD09QRCPdhR
         Ix/zQbbb2vCjjpsOFZ73raJ3QuUeq2G9LqOv3ejULTJpxGwjCaVPBeqsHEOxUCfe+Cph
         lW2A2u8+l7O7BlSyxRRq3i898qPXXd5df9BZ2u9kl3S+dsllqFi8NJgcWA/bZqAk06zu
         tEtVGpjv4tj7tSGchbEmOqOS8RuJTe1R9zJTdi3echeaF+S9otzgRPloqFtIFYOu8S9+
         M1bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748423937; x=1749028737;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lgSKA2W2VDXmaE0PCmq0CnFtkG2OyiAdlD+PPWTrugA=;
        b=BxIWa5th/fdBE+euzg1HTxmykZx/QT5dI1rJIWqA7WLFYNCOf/nLfQsGkbpnVYNdCu
         BNQI2/0vjzTBHTr5OAhl3Ez3TWqCHPnEs3YIOeV9JnSNpR1f+PTHVMDfJdwu/+Yg/RZj
         rGuvr/Ce97wcDmYIhXOWeH/VTcivkqEOFFi35qms5fjgfA0GwzEv8gBa7HXfzKiHUwmO
         0JxdGt/zQH7Y2pPEv21Wily2yWaR0s43PDqIGU4+n9N+D9MjRz8160OEqqo0ZqyUxxou
         FwBYDbmRzlbxG52i7LXqz+CPBzt3zX+2d2Lbd0FswnkCeV4hvHs8hU82rRSPRKX/EcUw
         Owrw==
X-Gm-Message-State: AOJu0YyHhRyG0qXYl/6Sz+kLNJej2nm09zz60hwMnBydEiuZNl3anrDK
	lz22O+0XJny9y09OuutA/LloMaXrARWlEwfgAqtxN4nlfmTIaQL0urW5Q23odquzaHQWujQBXSP
	U4zofzDQAq6vDzTXNxFBAfGJULtuG9D6ce7uS
X-Gm-Gg: ASbGncv36WbCTEw24hRFX2PWFY4mjNnF1gm79tz8OtU4j4962g3VhqFOU+bWO0raOyI
	lJ2UAs2au3dsS3mRIIM0V+PJMU8x1SCPkj/jTDSxwV0g1HZCzDqstJjTrYnTSpchc31KiJb2xYR
	tUJy08n3iFjZT1aPnzsy2H6bu9LFJF25Q=
X-Google-Smtp-Source: AGHT+IHx1cv9QQtMC5R6VV5cgDID4m/Cf9TK1yy/2Knom4WMjAtVSdA0xWQQcdAVAP+RJq7ZiWMx42v212mbWB/Ou4k=
X-Received: by 2002:a05:622a:1247:b0:4a3:647b:bac5 with SMTP id
 d75a77b69052e-4a3647bbbf8mr31632051cf.38.1748423937242; Wed, 28 May 2025
 02:18:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CADf4wU9-y5oyBbRTUa46dsHXRz4n8NFVxSfCEvTQPxuU21+wpg@mail.gmail.com>
In-Reply-To: <CADf4wU9-y5oyBbRTUa46dsHXRz4n8NFVxSfCEvTQPxuU21+wpg@mail.gmail.com>
From: hiren vadukul <vadukulhiren09@gmail.com>
Date: Wed, 28 May 2025 14:48:46 +0530
X-Gm-Features: AX0GCFudLRMU7vyW4bZTG9Gjznyr1aYFcQUtlcsbV7RP2sU_JL8w6eGL2YRtdrU
Message-ID: <CADf4wU8iuriQ7gYK4ayu8pt-ntyfXK-xVkrZYc6DSivqqk40NA@mail.gmail.com>
Subject: =?UTF-8?Q?Re=3A_OV5695_Camera_Bring=2DUp_Issue_on_i=2EMX8ULP_=E2=80=93_Hal?=
	=?UTF-8?Q?f_Image_Black?=
To: linux-media@vger.kernel.org, imx@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello everyone,

Could you please help me identify the possible cause of the half black
Image issue?
I am currently unable to determine whether the issue is with the
sensor driver or whether there is a configuration error on the BSP
side.
Thank you in advance for your suggestions.

Best Regards,
Hiren Vadukul

On Tue, May 27, 2025 at 11:22=E2=80=AFAM hiren vadukul <vadukulhiren09@gmai=
l.com> wrote:
>
> Hello,
>
> I'm Hiren, currently working on bringing up the OV5695 camera on the i.MX=
8ULP board. Currently, I=E2=80=99m able to capture 10-bit raw images at 192=
0x1080 resolution. However, when I open the image in a viewer, the right ha=
lf appears completely black.
>
> Below, I=E2=80=99ve provided the kernel version, the commands to link the=
 camera with the ISI and CSI pipelines, and the dumped image for reference.
>
> kernel version:- Linux nxp-imx 6.12.3
>
> Command:- $ media-ctl -p
>
> Media controller API version 6.12.3
>
> Media device information
> ------------------------
> driver          mxc-isi
> model           FSL Capture Media Device
> serial
> bus info        platform:2dac0000.isi
> hw revision     0x0
> driver version  6.12.3
>
> Device topology
> - entity 1: crossbar (3 pads, 3 links, 1 route)
>             type V4L2 subdev subtype Unknown flags 0
>             device node name /dev/v4l-subdev0
>         routes:
>                 0/0 -> 2/0 [ACTIVE]
>         pad0: SINK,MUST_CONNECT
>                 [stream:0 fmt:SBGGR10_1X10/1920x1080 field:none colorspac=
e:raw quantization:full-range]
>                 <- "imx8mq-mipi-csi2 2daf0000.csi":1 [ENABLED,IMMUTABLE]
>         pad1: SINK,MUST_CONNECT
>                 <- "mxc_isi.output":0 [ENABLED,IMMUTABLE]
>         pad2: SOURCE
>                 [stream:0 fmt:SBGGR10_1X10/1920x1080 field:none colorspac=
e:raw quantization:full-range]
>                 -> "mxc_isi.0":0 [ENABLED,IMMUTABLE]
>
> - entity 5: mxc_isi.0 (2 pads, 2 links, 0 routes)
>             type V4L2 subdev subtype Unknown flags 0
>             device node name /dev/v4l-subdev1
>         pad0: SINK
>                 [stream:0 fmt:SBGGR10_1X10/1920x1080 field:none colorspac=
e:raw quantization:full-range
>                  compose.bounds:(0,0)/1920x1080
>                  compose:(0,0)/1920x1080]
>                 <- "crossbar":2 [ENABLED,IMMUTABLE]
>         pad1: SOURCE
>                 [stream:0 fmt:SBGGR10_1X10/1920x1080 field:none colorspac=
e:raw quantization:full-range
>                  crop.bounds:(0,0)/1920x1080
>                  crop:(0,0)/1920x1080]
>                 -> "mxc_isi.0.capture":0 [ENABLED,IMMUTABLE]
>
> - entity 8: mxc_isi.0.capture (1 pad, 1 link)
>             type Node subtype V4L flags 0
>             device node name /dev/video0
>         pad0: SINK
>                 <- "mxc_isi.0":1 [ENABLED,IMMUTABLE]
>
> - entity 16: mxc_isi.output (1 pad, 1 link)
>              type Node subtype V4L flags 0
>         pad0: SOURCE
>                 -> "crossbar":1 [ENABLED,IMMUTABLE]
>
> - entity 23: imx8mq-mipi-csi2 2daf0000.csi (2 pads, 2 links, 1 route)
>              type V4L2 subdev subtype Unknown flags 0
>              device node name /dev/v4l-subdev2
>         routes:
>                 0/0 -> 1/0 [ACTIVE]
>         pad0: SINK,MUST_CONNECT
>                 [stream:0 fmt:SBGGR10_1X10/1920x1080 field:none colorspac=
e:raw quantization:full-range]
>                 <- "ov5695 7-0036":0 [ENABLED,IMMUTABLE]
>         pad1: SOURCE,MUST_CONNECT
>                 [stream:0 fmt:SBGGR10_1X10/1920x1080 field:none colorspac=
e:raw quantization:full-range]
>                 -> "crossbar":0 [ENABLED,IMMUTABLE]
>
> - entity 28: ov5695 7-0036 (1 pad, 1 link, 0 routes)
>              type V4L2 subdev subtype Sensor flags 0
>              device node name /dev/v4l-subdev3
>         pad0: SOURCE
>                 [stream:0 fmt:SBGGR10_1X10/1920x1080 field:none]
>                 -> "imx8mq-mipi-csi2 2daf0000.csi":0 [ENABLED,IMMUTABLE]
>
> Command:- v4l2-ctl -d /dev/video0 --all
> Driver Info:
>         Driver name      : mxc-isi
>         Card type        : mxc-isi-cap
>         Bus info         : platform:2dac0000.isi
>         Driver version   : 6.12.3
>         Capabilities     : 0xa4201000
>                 Video Capture Multiplanar
>                 I/O MC
>                 Streaming
>                 Extended Pix Format
>                 Device Capabilities
>         Device Caps      : 0x24201000
>                 Video Capture Multiplanar
>                 I/O MC
>                 Streaming
>                 Extended Pix Format
> Media Driver Info:
>         Driver name      : mxc-isi
>         Model            : FSL Capture Media Device
>         Serial           :
>         Bus info         : platform:2dac0000.isi
>         Media version    : 6.12.3
>         Hardware revision: 0x00000000 (0)
>         Driver version   : 6.12.3
> Interface Info:
>         ID               : 0x0300000a
>         Type             : V4L Video
> Entity Info:
>         ID               : 0x00000008 (8)
>         Name             : mxc_isi.0.capture
>         Function         : V4L2 I/O
>         Pad 0x01000009   : 0: Sink
>           Link 0x0200000c: from remote pad 0x1000007 of entity 'mxc_isi.0=
' (Video Pixel Formatter): Data, Enabled, Immutable
> Priority: 2
> Video input : 0 (mxc_isi.0.capture: ok)
> Format Video Capture Multiplanar:
>         Width/Height      : 1920/1080
>         Pixel Format      : 'BG10' (10-bit Bayer BGBG/GRGR)
>         Field             : None
>         Number of planes  : 1
>         Flags             : set-csc
>         Colorspace        : sRGB
>         Transfer Function : sRGB
>         YCbCr/HSV Encoding: ITU-R 601
>         Quantization      : Full Range
>         Plane 0           :
>            Bytes per Line : 3840
>            Size Image     : 4147200
>
> User Controls
>
>                 horizontal_flip 0x00980914 (bool)   : default=3D0 value=
=3D0
>                   vertical_flip 0x00980915 (bool)   : default=3D0 value=
=3D0
>                 alpha_component 0x00980929 (int)    : min=3D0 max=3D255 s=
tep=3D1 default=3D0 value=3D0
>
> Please let me know if you need any additional information. I look forward=
 to your feedback. Thank you.
>
> Best Regards,
> Hiren Vadukul

