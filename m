Return-Path: <linux-media+bounces-33508-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8814DAC651A
	for <lists+linux-media@lfdr.de>; Wed, 28 May 2025 11:02:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 466054A0F55
	for <lists+linux-media@lfdr.de>; Wed, 28 May 2025 09:01:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 66EE8274674;
	Wed, 28 May 2025 09:01:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="k9wREiIg"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com [209.85.222.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 259A326773C
	for <linux-media@vger.kernel.org>; Wed, 28 May 2025 09:01:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748422895; cv=none; b=gjyE18Tduc8+OJGktghWjZtW2HobhDykcqgB3Z2Q54j4QGOEt1kPiD18IDa7E0opTvC2lypNKDYVh5T87wWsKDQ77IRoStOfGgkBRM31rDjNvZiqJAuPCa1z53LZgH/TW/yHjkvhmm2iOS3r7Ia9MoQzKpOs7SVwIIg4+RCEt5U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748422895; c=relaxed/simple;
	bh=nsbs8J4i2mBXGtg2YoKcoKar84A9hcImfLp+FZsksrU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Content-Type; b=Su/AyQ5fpqGvvc04ddNEnk9wuZh1z1N/U7oyzlO47SdZCTZ/JoXrBsdyrI2zYEgV/84Nm58jy5V8TTyHz0VP7bPrQP2g05VAL3LNjNy1+YX/tBstFUEx8VcfWsLFMwVGKl05hoMSizkcsPEcRm5hM37aFu6WADfzlCqGXEcHfDc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=k9wREiIg; arc=none smtp.client-ip=209.85.222.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qk1-f170.google.com with SMTP id af79cd13be357-7caea4bc9e9so671256985a.1
        for <linux-media@vger.kernel.org>; Wed, 28 May 2025 02:01:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748422893; x=1749027693; darn=vger.kernel.org;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Kta7NMNgiWawN2yqQu1cMys/JcxeBWGOneGw9ln5pKQ=;
        b=k9wREiIgS+cypWpqPrnNNaHDMokNnyFIOg0bNP1SqRvARs3YdvO/EQB74tZ79ii7Lq
         rVd78IjesSQqbW96xiLEHv4ggu1m1Nhq4WNb97xe8r1eejK9WWirZJ591Tt/56Rm8f5v
         806si7WcYXfgLkksSVWfDWO/v8N5EwqNydn6O8D3HeMXPEzsSLEtnj5Z51usxoRT0OPr
         UDEl4s+l7zh566mX9J2HPR6gv5qgrenoJWZGcTn9zzfIc+DEbTVCP9x0FQlKTgtqR6DK
         LkDEd+Lf4mz9lwbeUpJ5Og31Vf8M5iHqEQYSB55aiHT3EUESz5Vw7olovCUUPk425z8e
         ohQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748422893; x=1749027693;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Kta7NMNgiWawN2yqQu1cMys/JcxeBWGOneGw9ln5pKQ=;
        b=IfLHIg7TPP/3863saVzrNQ/064NX4KYYUhYCmqcHx4vixuiePyRPc8qpR2bc1j9XEv
         HNZlDLrYN6QSpXq4w24BjNmVFntTmxyZY6qknYR0GnEVbvf5ETqvuo9r+Z4nfEqDaadG
         aPCi1xP/fcJCMDlZmvi2m0Z4juKJlaB1T++3npfASbCQ50kUiUxqygLlRcwjwuS8IZ8L
         1Mm6BGrr51HGvnXVhJRCzqd1931Qc6vwT4VwZHuwVMte5RvaOOSHfkvAQCitAuE1nPGy
         f8TsDlfjnJ0GmHwKZeusHY2oBanMJxh7BDsOFpWJRICfYlndHZVWxEx1wL/ckGkwQ5lq
         xVhg==
X-Gm-Message-State: AOJu0Yy9JWQ5hBzh85ROP4rXQB6JyWLrErEG0y7UOVFR4uOhNft6izWy
	qFqLUIGD7rjmo6bOiEaQgYkmToCHvPbdNJSnnrm4j19lRBbJlwLGKjwwa9BD5E9zEMuiGMTAXkP
	0f+ItmrkzJc4J82eAZHkqINBXaWeDO2dyoCtx
X-Gm-Gg: ASbGncshNCtAkStyVjqeF+Tq0an1t6dEWHMkex/AGUocyb2wQ1+VpHD8SdTv1LRmkHm
	KW9J7+GxijsqCQBG+fqpR+8HPb3ayTQKsqMq2eCWknatXakkbewg83anDFkVA0qkDSGqShOemcm
	Pyld0XhXz2ZWY0LcBZUevIvGpHM9zLPAs=
X-Google-Smtp-Source: AGHT+IF7SVCZfdW1XbSWmRLNGcP+Yoa2Y3dnC4D6fXfCwXExsBTY1RMn7jibuIzKvc5giodSsLk+Jg1YmmVFSqPMaiI=
X-Received: by 2002:a05:622a:1cca:b0:480:9ba4:3022 with SMTP id
 d75a77b69052e-49f46658074mr256614741cf.17.1748422881298; Wed, 28 May 2025
 02:01:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CADf4wU9-y5oyBbRTUa46dsHXRz4n8NFVxSfCEvTQPxuU21+wpg@mail.gmail.com>
In-Reply-To: <CADf4wU9-y5oyBbRTUa46dsHXRz4n8NFVxSfCEvTQPxuU21+wpg@mail.gmail.com>
From: hiren vadukul <vadukulhiren09@gmail.com>
Date: Wed, 28 May 2025 14:31:10 +0530
X-Gm-Features: AX0GCFvQm3blUzJzWgmVrj6ZcoYEBhjmEOdvVwIarIteVel3Auz1rgXNyUFMzbE
Message-ID: <CADf4wU8Fm68QcTVBsxgwtdXMBXOL73DdbrteJjnYSgep1R_XCA@mail.gmail.com>
Subject: =?UTF-8?Q?Re=3A_OV5695_Camera_Bring=2DUp_Issue_on_i=2EMX8ULP_=E2=80=93_Hal?=
	=?UTF-8?Q?f_Image_Black?=
To: linux-media@vger.kernel.org, imx@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello everyone,

Could you please help me identify the possible cause of the half black
image issue?
I am currently unable to determine whether the issue is with the
sensor driver or whether there is a configuration error on the BSP
side.

Thank you in advance for your suggestions.


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

