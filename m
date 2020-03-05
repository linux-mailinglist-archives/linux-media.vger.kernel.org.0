Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7B7BB17A599
	for <lists+linux-media@lfdr.de>; Thu,  5 Mar 2020 13:47:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726275AbgCEMrf (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 5 Mar 2020 07:47:35 -0500
Received: from mail-ot1-f68.google.com ([209.85.210.68]:34828 "EHLO
        mail-ot1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726048AbgCEMrf (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 5 Mar 2020 07:47:35 -0500
Received: by mail-ot1-f68.google.com with SMTP id v10so5541093otp.2;
        Thu, 05 Mar 2020 04:47:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=g6F8ZjglNrx2HxU5y4IHC4fBBI3tpVgxXx6wMM62xkU=;
        b=bhTDtshAFVKpXBNMxXEAlcMsgvJtGvVI2C00hEJnP2ASEy0VUIuLI+rgg1f/sx5auQ
         /4NnWtPab6BIUwZX3KYXYXHFtiMJ4jiRt+qnN5HXzwBqBjjiucZf0yDqurTAu72BwTOS
         SGa/g9z1HaW2UF0K2fjcLrEiYvI28+Jf+UYDgnFOW7n+bco2H3juEJPEIcqf9gTkgdUT
         VL4xF9ebGsiZL1M+i0dMdklEi+N8BoWIeWQdMg+5WfZ/GRWx9IEVjrKXlk7XvYOQo61e
         gFHNAeUNTsvfNQnBeSW5b8TnhXI7VAK809DxihlS5yBnE2mJVuxU98h/qhNTsObNc5H1
         vUyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=g6F8ZjglNrx2HxU5y4IHC4fBBI3tpVgxXx6wMM62xkU=;
        b=trkDtAT62IabBLNOSxRMUnkl3dDNIDJm9IFkRpdyffPmTktqvievKHYT8xFxCxbsNG
         JW17CxBKu61vLKQP09R1VGsgE2eEguL9hJWqRkz+KQBUZ9sMfs86+n6FzlUSGy9vt0SP
         H+tTt9CzVFD+/oSu/xnk1R0FXpw/Fw1ox5RPq3e6wDvubfJWKzEpYKk/5C5PC1WXgvCz
         GQ6E6OuNa6ijIVMrcdjC7I7WzOExlKKqRx3wP2QEjsXcvQ3tewGj8ndkdPAiTyKi9WUT
         Np21gppXjAGufKzHuT0epvktaBXn4ryaviquGZQwK9zYxqNLOsS5Ds2B+WuqQheZdt8y
         dQWg==
X-Gm-Message-State: ANhLgQ2825XoGwjoYAkSX3ZXc9ZhOVJK1LVZNHpEig5C4q0ySK8e2DeE
        gtlLsdRbsZ26pJerSvo7iLgRH1THjZfu04fA6Is=
X-Google-Smtp-Source: ADFU+vvCWWbKw8Yxc8h2wxo+QBpEiK1EVp6zIBwMjFJ+8ZFyE4h38rORy0nCx1pVUvhcB/aFJLSyikSkTZa4z69nigI=
X-Received: by 2002:a05:6830:1481:: with SMTP id s1mr6598878otq.44.1583412453797;
 Thu, 05 Mar 2020 04:47:33 -0800 (PST)
MIME-Version: 1.0
References: <20200228165503.18054-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20200228165503.18054-4-prabhakar.mahadev-lad.rj@bp.renesas.com> <CAPY8ntD-_GBtTOS--J_yEAbM+U6zjAdebmHnpE4+Ev4LVFjq7g@mail.gmail.com>
In-Reply-To: <CAPY8ntD-_GBtTOS--J_yEAbM+U6zjAdebmHnpE4+Ev4LVFjq7g@mail.gmail.com>
From:   "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date:   Thu, 5 Mar 2020 12:47:07 +0000
Message-ID: <CA+V-a8u3Ue5oNpjGqBm=rU=4eFHttiAxNRVhVd48GNxFvFp1xw@mail.gmail.com>
Subject: Re: [PATCH 3/3] media: i2c: imx219: Add support 640x480
To:     Dave Stevenson <dave.stevenson@raspberrypi.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Dave,

Thank you for the review.

On Mon, Mar 2, 2020 at 12:50 PM Dave Stevenson
<dave.stevenson@raspberrypi.com> wrote:
>
> Hi Lad.
>
> Thanks for the patch.
>
> On Fri, 28 Feb 2020 at 16:55, Lad Prabhakar <prabhakar.csengg@gmail.com> wrote:
> >
> > This patch adds support to 640x480 cropped resolution for the sensor
>
> I was a little hesitant to add cropped modes without good reason.
> Processing them through an ISP with something like lens shading
> compensation requires the ISP to know the crop, so ideally it should
> be reflected through the selection API (probably read-only - I'm not
> sure you can modify the register set totally dynamically for
> cropping).
> I know we have the 1080p mode in there already which is cropped, but
> that was mainly as it is the only way to get 30fps 1080p over two
> CSI-2 lanes. I wonder if there is a better way of reflecting this.
>
The CSI controller which I am using doesn't support capture of higher
resolutions
as a result I have added support for a lower resolution.

> > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > ---
> >  drivers/media/i2c/imx219.c | 70 ++++++++++++++++++++++++++++++++++++++
> >  1 file changed, 70 insertions(+)
> >
> > diff --git a/drivers/media/i2c/imx219.c b/drivers/media/i2c/imx219.c
> > index 1388c9bc00bb..232ebf41063a 100644
> > --- a/drivers/media/i2c/imx219.c
> > +++ b/drivers/media/i2c/imx219.c
> > @@ -54,6 +54,7 @@
> >  #define IMX219_VTS_15FPS               0x0dc6
> >  #define IMX219_VTS_30FPS_1080P         0x06e3
> >  #define IMX219_VTS_30FPS_BINNED                0x06e3
> > +#define IMX219_VTS_30FPS_640x480       0x0239
> >  #define IMX219_VTS_MAX                 0xffff
> >
> >  #define IMX219_VBLANK_MIN              4
> > @@ -329,6 +330,65 @@ static const struct imx219_reg mode_1640_1232_regs[] = {
> >         {0x0163, 0x78},
> >  };
> >
> > +static const struct imx219_reg mode_640_480_regs[] = {
>
> Can I ask where these register settings came from? They differ from
> references I have in a few odd ways.
>
This driver was developed in house for imx219 sensor.

> There's also a comment at the top of mode arrays declaring the
> supported modes and where they came from. Could you update that
> please?
>
Sure ill  update it to the following:
/*
 * Register sets lifted off the i2C interface from the Raspberry Pi firmware
 * driver for resolutions 3280x2464, 1920x1080 1640x1232.
 * 3280x2464 = mode 2, 1920x1080 = mode 1, 1640x1232 = mode 4, 640x480 = mode 1.
 */

> > +       {0x0100, 0x00},
> > +       {0x30eb, 0x0c},
> > +       {0x30eb, 0x05},
> > +       {0x300a, 0xff},
> > +       {0x300b, 0xff},
> > +       {0x30eb, 0x05},
> > +       {0x30eb, 0x09},
>
> Datasheet section 3-4 says these are to access manufacturer specific
> registers, but the access sequence should be
> 0x30eb 0x05
> 0x30eb 0x0c
> 0x300a 0xff
> 0x300b 0xff
> 0x30eb 0x05
> 0x30eb 0x09
> Is there a reason your first two writes are reversed compared to this
> published order?
>
Agreed I have tested both the sequence works, I have now replaced as
mentioned in datasheet.

> > +       {0x0114, 0x01},
> > +       {0x0128, 0x01},
>
> DPHY_CTRL RW MIPI Global timing setting
> 0:auto mode, 1:manual mode
>
> All the other modes have this as auto mode. Why does this mode need
> manual settings, and is something else configuring those manual
> values?
>
I have reverted it to auto mode.

> > +       {0x012a, 0x18},
> > +       {0x012b, 0x00},
> > +       {0x0162, 0x0d},
> > +       {0x0163, 0xe7},
>
> All the other modes have set line length to 0x0d78 (3448 decimal)
> rather than your 0xd37 (3559).
> Is there any specific reason for this? If we need a different value,
> then we also need to vary IMX219_PPL_DEFAULT and V4L2_CID_HBLANK
> depending on mode. Or probably better would be to make it variable,
> but that has a load of other implications.
>
line length of 0x0d78 works as expected, so I have changed it now.

> > +       {0x0164, 0x03},
> > +       {0x0165, 0xe8},
> > +       {0x0166, 0x08},
> > +       {0x0167, 0xe7},
> > +       {0x0168, 0x02},
> > +       {0x0169, 0xf0},
> > +       {0x016a, 0x06},
> > +       {0x016b, 0xaf},
> > +       {0x016c, 0x02},
> > +       {0x016d, 0x80},
> > +       {0x016e, 0x01},
> > +       {0x016f, 0xe0},
> > +       {0x0170, 0x01},
> > +       {0x0171, 0x01},
> > +       {0x0172, 0x00},
>
> 0x0172 is IMAGE_ORIENTATION_A, which is handled via V4L2_CID_HFLIP /
> V4L2_CID_VFLIP, not in the mode table.
>
dropped this setting.

> > +       {0x0174, 0x03},
> > +       {0x0175, 0x03},
> > +       {0x0301, 0x05},
> > +       {0x0303, 0x01},
> > +       {0x0304, 0x03},
> > +       {0x0305, 0x03},
> > +       {0x0306, 0x00},
> > +       {0x0307, 0x39},
> > +       {0x0309, 0x08},
>
> "OPPXCK_DIV. Ouptut pixel clock divider value, default 0x0A."
> This looks like it is a change that should be part of the support for
> 8bit formats.
> Have you tested this mode with 10bit readout? Are the data rates correct?
>
as you discovered the vlaue should be 0x0A for 640x480. No I havent
tested it for
10bit.

> > +       {0x030b, 0x01},
> > +       {0x030c, 0x00},
> > +       {0x030d, 0x72},
> > +       {0x0624, 0x06},
> > +       {0x0625, 0x68},
> > +       {0x0626, 0x04},
> > +       {0x0627, 0xd0},
> > +       {0x455e, 0x00},
> > +       {0x471e, 0x4b},
> > +       {0x4767, 0x0f},
> > +       {0x4750, 0x14},
> > +       {0x4540, 0x00},
> > +       {0x47b4, 0x14},
> > +       {0x4713, 0x30},
> > +       {0x478b, 0x10},
> > +       {0x478f, 0x10},
> > +       {0x4793, 0x10},
> > +       {0x4797, 0x0e},
> > +       {0x479b, 0x0e},
> > +};
> > +
> >  static const char * const imx219_test_pattern_menu[] = {
> >         "Disabled",
> >         "Color Bars",
> > @@ -414,6 +474,16 @@ static const struct imx219_mode supported_modes[] = {
> >                         .regs = mode_1640_1232_regs,
> >                 },
> >         },
> > +       {
> > +               /* 640x480 30fps mode */
> >
> > +               .width = 640,
> > +               .height = 480,
> > +               .vts_def = IMX219_VTS_30FPS_640x480,
>
> I've just run this mode on a Pi and I get a default of about 84fps via
> v4l2-ctl to /dev/null. Is the default frame rate expected to be 30fps?
> In which case I think the value of IMX219_VTS_30FPS_640x480 is wrong
> (I'd expect 0x6e3 again, same as the other modes), or the comments and
> define names are wrong. One or other ought to be fixed.
>
> My calculations say that with:
> - VBLANK set to 89
> - a pixel rate of 182400000 (based on IMX219_PIXEL_RATE)
> - HBLANK fixed at 2808
> - frame being 640x480
> The overall frame size is therefore (640+2808) * (480+89) = 1961912
> pixel clocks. That would at first glance appear to give a frame rate
> of 92fps. Testing with an alternate tool is giving me timings for
> 90fps but with a few dropped frames (the dropped frames would explain
> v4l2-ctl reading slightly low).
>
I have set the value 0x06e3 and yavta reports 30fps:
Device /dev/video0 opened.ideo0 -c0 -n10 -s640x480 -fSRGGB8  --field
none -R80 -F
Device `R_Car_VIN' on `platform:e6ef4000.video' is a video output
(without mplanes) device.
Video format set: SRGGB8 (42474752) 640x480 (stride 640) field none
buffer size 307200
Video format: SRGGB8 (42474752) 640x480 (stride 640) field none buffer
size 307200
10 buffers requested.
length: 307200 offset: 0 timestamp type/source: mono/EoF
Buffer 0/0 mapped at address 0xffffa8126000.
length: 307200 offset: 307200 timestamp type/source: mono/EoF
Buffer 1/0 mapped at address 0xffffa80db000.
length: 307200 offset: 614400 timestamp type/source: mono/EoF
Buffer 2/0 mapped at address 0xffffa8090000.
length: 307200 offset: 921600 timestamp type/source: mono/EoF
Buffer 3/0 mapped at address 0xffffa8045000.
length: 307200 offset: 1228800 timestamp type/source: mono/EoF
Buffer 4/0 mapped at address 0xffffa7ffa000.
length: 307200 offset: 1536000 timestamp type/source: mono/EoF
Buffer 5/0 mapped at address 0xffffa7faf000.
length: 307200 offset: 1843200 timestamp type/source: mono/EoF
Buffer 6/0 mapped at address 0xffffa7f64000.
length: 307200 offset: 2150400 timestamp type/source: mono/EoF
Buffer 7/0 mapped at address 0xffffa7f19000.
length: 307200 offset: 2457600 timestamp type/source: mono/EoF
Buffer 8/0 mapped at address 0xffffa7ece000.
length: 307200 offset: 2764800 timestamp type/source: mono/EoF
Buffer 9/0 mapped at address 0xffffa7e83000.
0 (0) [-] none 0 307200 B 2227.060205 2227.060268 10.119 fps ts mono/EoF
1 (1) [-] none 1 307200 B 2227.093536 2227.105537 30.002 fps ts mono/EoF
2 (2) [-] none 2 307200 B 2227.126860 2227.301819 30.008 fps ts mono/EoF
3 (3) [-] none 3 307200 B 2227.160185 2227.340688 30.008 fps ts mono/EoF
4 (4) [-] none 4 307200 B 2227.193511 2227.384831 30.007 fps ts mono/EoF
5 (5) [-] none 5 307200 B 2227.226834 2227.431937 30.009 fps ts mono/EoF
6 (6) [-] none 6 307200 B 2227.260160 2227.476214 30.007 fps ts mono/EoF
7 (7) [-] none 7 307200 B 2227.293486 2227.522586 30.007 fps ts mono/EoF
8 (8) [-] none 8 307200 B 2227.326817 2227.564954 30.002 fps ts mono/EoF
9 (9) [-] none 9 307200 B 2227.360143 2227.610001 30.007 fps ts mono/EoF
Captured 10 frames in 0.648624 seconds (15.417250 fps, 4736179.062103 B/s).
10 buffers released.
root@ek874:~#

Cheers,
--Prabhakar

> If I amend OPPXCK_DIV to be 0xA (the same as the other modes), then it
> doesn't appear to change.
> However hold off on investigating the specifics for now - I appear to
> be unable to select the 10bit/pixel formats, so I suspect something is
> up with patch 2 that added the 8bit support (I was about to review
> that anyway).
>
>   Dave
>
> > +               .reg_list = {
> > +                       .num_of_regs = ARRAY_SIZE(mode_640_480_regs),
> > +                       .regs = mode_640_480_regs,
> > +               },
> > +       },
> >  };
> >
> >  struct imx219 {
> > --
> > 2.20.1
> >
