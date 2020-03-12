Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 51E7C18286D
	for <lists+linux-media@lfdr.de>; Thu, 12 Mar 2020 06:31:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387786AbgCLFbq convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-media@lfdr.de>); Thu, 12 Mar 2020 01:31:46 -0400
Received: from mail-ed1-f68.google.com ([209.85.208.68]:46053 "EHLO
        mail-ed1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387677AbgCLFbq (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 12 Mar 2020 01:31:46 -0400
Received: by mail-ed1-f68.google.com with SMTP id h62so5818981edd.12;
        Wed, 11 Mar 2020 22:31:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=+Zc8FmIA0ABnvFYgr2cfqyf8WsoARKD3906NOO9ORho=;
        b=f0xdI6NBX9OgPg83uf0+X/HDns0fUI+5CfRmSR3oWhHOzCOVtzOq+f894IR3MQBx6x
         fBcIzVbd1d1XUptIT4cOttU+pY6lqwpg8QOVNrC838W/x/8XwiuPSh8LV8uNID+HRGO/
         ZO4piEhPGr2Tk5umfjoBp0PeY5wJCFEO0b9ZNmWTi5Cy//HlPPjzD09oqhBIrNfzmhXa
         0prYr98PgHqctFhaZzG7IuxkbFIb9NF79e+o8SdRjuSJKdOCOJMoKOLwOPDoF7XwLYO6
         R9psOruDw2FUQDbEkNJfKDabROT2qJ+rGsaIi6C2impqP+xUtVtDnX0SnGub3lqnhE7t
         R+Uw==
X-Gm-Message-State: ANhLgQ24sFinZzi1CS1yPGikXHioy2Dlw0iA5010u7DgiMO/tE/WL2rW
        vD/XYVt8ckJvn/AqK7s+ORa6rgbtxOE=
X-Google-Smtp-Source: ADFU+vuEPAEdxTWL0gh/Jyg97pcc/Efcuk6ll2O1KJ3ZBPUhseqCtZ1GvpzE3SDcoBH4SZ1JOda2uA==
X-Received: by 2002:aa7:d702:: with SMTP id t2mr6339358edq.342.1583991101601;
        Wed, 11 Mar 2020 22:31:41 -0700 (PDT)
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com. [209.85.221.47])
        by smtp.gmail.com with ESMTPSA id h4sm1957939ejl.25.2020.03.11.22.31.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Mar 2020 22:31:41 -0700 (PDT)
Received: by mail-wr1-f47.google.com with SMTP id v11so5746773wrm.9;
        Wed, 11 Mar 2020 22:31:40 -0700 (PDT)
X-Received: by 2002:a5d:6208:: with SMTP id y8mr8943772wru.64.1583991100322;
 Wed, 11 Mar 2020 22:31:40 -0700 (PDT)
MIME-Version: 1.0
References: <20200124232014.574989-1-jernej.skrabec@siol.net> <4206703.LvFx2qVVIh@jernej-laptop>
In-Reply-To: <4206703.LvFx2qVVIh@jernej-laptop>
From:   Chen-Yu Tsai <wens@csie.org>
Date:   Thu, 12 Mar 2020 13:31:28 +0800
X-Gmail-Original-Message-ID: <CAGb2v647N4oSf=txbCfc05L6j8_U4bBtfa+XxYX6ZUMmrYbs0Q@mail.gmail.com>
Message-ID: <CAGb2v647N4oSf=txbCfc05L6j8_U4bBtfa+XxYX6ZUMmrYbs0Q@mail.gmail.com>
Subject: Re: [linux-sunxi] [PATCH 0/8] media: sunxi: Add DE2 rotate driver
To:     =?UTF-8?Q?Jernej_=C5=A0krabec?= <jernej.skrabec@gmail.com>
Cc:     Maxime Ripard <mripard@kernel.org>,
        linux-sunxi <linux-sunxi@googlegroups.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Mike Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        devicetree <devicetree@vger.kernel.org>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        Jernej Skrabec <jernej.skrabec@siol.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, Feb 12, 2020 at 3:13 AM Jernej Škrabec <jernej.skrabec@gmail.com> wrote:
>
> Dne sobota, 25. januar 2020 ob 00:20:06 CET je Jernej Skrabec napisal(a):
> > Some of Allwinner SoCs like A83T and A64 SoCs contain DE2 rotate core
> > which can flip image horizontal and vertical and rotate it in 90 deg.
> > steps. It support a lot of output formats, but a bit less capture
> > formats. All YUV input formats get converted to yuv420p, while RGB
> > formats are preserved.
> >
> > Patches 1-2 fix few issues with DE2 clocks.
> >
> > Patches 3-4 fix register range of DE2 clocks (it would overlap with
> > rotate driver)
> >
> > Patches 5-8 provide binding, implement driver and add nodes.
> >
> > v4l2-compliance SHA: ec55a961487b449bedbe07650674b4965814cf07, 32 bits,
> > 32-bit time_t
> >
> > Compliance test for sun8i-rotate device /dev/video0:
> >
> > Driver Info:
> >         Driver name      : sun8i-rotate
> >         Card type        : sun8i-rotate
> >         Bus info         : platform:sun8i-rotate
> >         Driver version   : 5.5.0
> >         Capabilities     : 0x84208000
> >                 Video Memory-to-Memory
> >                 Streaming
> >                 Extended Pix Format
> >                 Device Capabilities
> >         Device Caps      : 0x04208000
> >                 Video Memory-to-Memory
> >                 Streaming
> >                 Extended Pix Format
> >
> > Required ioctls:
> >         test VIDIOC_QUERYCAP: OK
> >
> > Allow for multiple opens:
> >         test second /dev/video0 open: OK
> >         test VIDIOC_QUERYCAP: OK
> >         test VIDIOC_G/S_PRIORITY: OK
> >         test for unlimited opens: OK
> >
> >         test invalid ioctls: OK
> > Debug ioctls:
> >         test VIDIOC_DBG_G/S_REGISTER: OK (Not Supported)
> >         test VIDIOC_LOG_STATUS: OK
> >
> > Input ioctls:
> >         test VIDIOC_G/S_TUNER/ENUM_FREQ_BANDS: OK (Not Supported)
> >         test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
> >         test VIDIOC_S_HW_FREQ_SEEK: OK (Not Supported)
> >         test VIDIOC_ENUMAUDIO: OK (Not Supported)
> >         test VIDIOC_G/S/ENUMINPUT: OK (Not Supported)
> >         test VIDIOC_G/S_AUDIO: OK (Not Supported)
> >         Inputs: 0 Audio Inputs: 0 Tuners: 0
> >
> > Output ioctls:
> >         test VIDIOC_G/S_MODULATOR: OK (Not Supported)
> >         test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
> >         test VIDIOC_ENUMAUDOUT: OK (Not Supported)
> >         test VIDIOC_G/S/ENUMOUTPUT: OK (Not Supported)
> >         test VIDIOC_G/S_AUDOUT: OK (Not Supported)
> >         Outputs: 0 Audio Outputs: 0 Modulators: 0
> >
> > Input/Output configuration ioctls:
> >         test VIDIOC_ENUM/G/S/QUERY_STD: OK (Not Supported)
> >         test VIDIOC_ENUM/G/S/QUERY_DV_TIMINGS: OK (Not Supported)
> >         test VIDIOC_DV_TIMINGS_CAP: OK (Not Supported)
> >         test VIDIOC_G/S_EDID: OK (Not Supported)
> >
> > Control ioctls:
> >         test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: OK
> >         test VIDIOC_QUERYCTRL: OK
> >         test VIDIOC_G/S_CTRL: OK
> >         test VIDIOC_G/S/TRY_EXT_CTRLS: OK
> >         test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: OK
> >         test VIDIOC_G/S_JPEGCOMP: OK (Not Supported)
> >         Standard Controls: 4 Private Controls: 0
> >
> > Format ioctls:
> >         test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK
> >         test VIDIOC_G/S_PARM: OK (Not Supported)
> >         test VIDIOC_G_FBUF: OK (Not Supported)
> >         test VIDIOC_G_FMT: OK
> >         test VIDIOC_TRY_FMT: OK
> >         test VIDIOC_S_FMT: OK
> >         test VIDIOC_G_SLICED_VBI_CAP: OK (Not Supported)
> >         test Cropping: OK (Not Supported)
> >         test Composing: OK (Not Supported)
> >         test Scaling: OK (Not Supported)
> >
> > Codec ioctls:
> >         test VIDIOC_(TRY_)ENCODER_CMD: OK (Not Supported)
> >         test VIDIOC_G_ENC_INDEX: OK (Not Supported)
> >         test VIDIOC_(TRY_)DECODER_CMD: OK (Not Supported)
> >
> > Buffer ioctls:
> >         test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: OK
> >         test VIDIOC_EXPBUF: OK
> >         test Requests: OK (Not Supported)
> >
> > Total for sun8i-rotate device /dev/video0: 45, Succeeded: 45, Failed: 0,
> > Warnings: 0
> >
> > Best regards,
> > Jernej
> >
> > Jernej Skrabec (8):
> >   clk: sunxi-ng: sun8i-de2: Swap A64 and H6 definitions
> >   clk: sunxi-ng: sun8i-de2: Fix A83T clocks and reset
>
> Please disregard above two patches. It turns out that many more changes are
> required to fix mess with rotation clocks and reset. I sent separate patch
> series: http://lists.infradead.org/pipermail/linux-arm-kernel/2020-February/
> 710242.html
>
> Comments on the rest of the series are welcome, though.
>
> Best regards,
> Jernej
>
> >   ARM: dts: sunxi: Fix DE2 clocks register range
> >   arm64: dts: allwinner: a64: Fix display clock register range
> >   media: dt-bindings: media: Add Allwinner A83T Rotate driver
> >   media: sun8i: Add Allwinner A83T Rotate driver
> >   ARM: dts: sun8i: a83t: Add device node for rotation core
> >   arm64: dts: allwinner: a64: add node for rotation core

Merged the DTS patches for 5.7.

ChenYu

> >  .../allwinner,sun8i-a83t-de2-rotate.yaml      |  70 ++
> >  MAINTAINERS                                   |   8 +
> >  arch/arm/boot/dts/sun8i-a83t.dtsi             |  13 +-
> >  arch/arm/boot/dts/sun8i-r40.dtsi              |   2 +-
> >  arch/arm/boot/dts/sun8i-v3s.dtsi              |   2 +-
> >  arch/arm/boot/dts/sunxi-h3-h5.dtsi            |   2 +-
> >  arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi |  14 +-
> >  drivers/clk/sunxi-ng/ccu-sun8i-de2.c          |  49 +-
> >  drivers/media/platform/Kconfig                |  12 +
> >  drivers/media/platform/sunxi/Makefile         |   1 +
> >  .../platform/sunxi/sun8i-rotate/Makefile      |   2 +
> >  .../sunxi/sun8i-rotate/sun8i-formats.c        | 273 ++++++
> >  .../sunxi/sun8i-rotate/sun8i-formats.h        |  25 +
> >  .../sunxi/sun8i-rotate/sun8i-rotate.c         | 924 ++++++++++++++++++
> >  .../sunxi/sun8i-rotate/sun8i-rotate.h         | 135 +++
> >  15 files changed, 1512 insertions(+), 20 deletions(-)
> >  create mode 100644
> > Documentation/devicetree/bindings/media/allwinner,sun8i-a83t-de2-rotate.yam
> > l create mode 100644 drivers/media/platform/sunxi/sun8i-rotate/Makefile
> > create mode 100644
> > drivers/media/platform/sunxi/sun8i-rotate/sun8i-formats.c create mode
> > 100644 drivers/media/platform/sunxi/sun8i-rotate/sun8i-formats.h create
> > mode 100644 drivers/media/platform/sunxi/sun8i-rotate/sun8i-rotate.c create
> > mode 100644 drivers/media/platform/sunxi/sun8i-rotate/sun8i-rotate.h
>
>
>
>
