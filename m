Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 45A3328E13A
	for <lists+linux-media@lfdr.de>; Wed, 14 Oct 2020 15:25:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727900AbgJNNZW (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 14 Oct 2020 09:25:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49802 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727758AbgJNNZV (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 14 Oct 2020 09:25:21 -0400
Received: from mail-yb1-xb43.google.com (mail-yb1-xb43.google.com [IPv6:2607:f8b0:4864:20::b43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 89A3EC061755
        for <linux-media@vger.kernel.org>; Wed, 14 Oct 2020 06:25:21 -0700 (PDT)
Received: by mail-yb1-xb43.google.com with SMTP id n142so2634748ybf.7
        for <linux-media@vger.kernel.org>; Wed, 14 Oct 2020 06:25:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=4psJr9RiY/OXqt5oCnww7+UWVnXC+mm7XZpZzIX6810=;
        b=SSrZaioJxJn6wj+FGETqS69VDjPIC6uYjhldjargyxLyF0z6FfnLiNlWyBorRZ0ZjG
         zpfetMwswBSKZ8eLMMWjG8HdDc8RjKwxVhnmZFMLdk/080hcg5reuVU9AWV1bcfAylzE
         x4qIluk/usWSJxcKXoBBlCl/uyI+nrg3rdRoJQIfn4exFTsFs3ckCOUaa4YU8Ph41jE1
         m71WrTfYcrgnZFkk78aey4LnJhAvLPpUgf2fdlDly0LGoj9Q/a0k0ZUJRXadxkovnkZ6
         k3h/WXmCIkUSbsGDIdfohc43v3obWrphq13hOUnPbvcQC57urGuPhfx82A+s8ZRt71sf
         /hIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=4psJr9RiY/OXqt5oCnww7+UWVnXC+mm7XZpZzIX6810=;
        b=eReJeFV/RUUNXNDGTVYd51GrkrtTb/2OMEeui5eAH1xVHl6cOQfS0JIZAJUT1iONMh
         H/d+lFj5P3YSygOQ8LpIl2LC6TgVK/e+TDeTFKDIK064bnurofUohcVeLUMnZh0sDZdf
         WSFfb/qOJ7xe1YpMNVbsaEr8IawyIrhBD1g0xaqjwKu6VHW+aJRNyAl8IZxSQVmi2Wvf
         dM3P8o0KO6jm8ZsFnc+egMLDYiAN6o81vuIYWISTBd7QYYHlpg8J1iYx6EziLhiKUpx3
         cj4I5q8BN0mvfy5HgW7Ei8Zc/euETtki4CfhrQ7OCSMbhAtavaVQx1G7bCaM2WF++YlW
         +tvA==
X-Gm-Message-State: AOAM530aC9EU4HUm/io3xCfDHl4po6lOu1EIy662zZgwbCIsEyjednIP
        kcFtrIfW4Jd9l/dhk3cEnnZOgUh69ibtsezRseA=
X-Google-Smtp-Source: ABdhPJwF9g4EKoh1DsOli5tXk1y9ihl24Znsu4qzkCk01q1+EChVmICQihHnQPIdoEP4IDGZsufvs29VzKTQfOhWSFg=
X-Received: by 2002:a25:b316:: with SMTP id l22mr7260410ybj.395.1602681920607;
 Wed, 14 Oct 2020 06:25:20 -0700 (PDT)
MIME-Version: 1.0
References: <1602514303-22316-1-git-send-email-hugues.fruchet@st.com>
 <CA+V-a8sxrSgHO-Mm6Xc-DMKFmFr7P=XxU9R+0A3J8PbWeJ+0jA@mail.gmail.com> <bca05e8d-461f-87d5-67e6-c02877b16edb@st.com>
In-Reply-To: <bca05e8d-461f-87d5-67e6-c02877b16edb@st.com>
From:   "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date:   Wed, 14 Oct 2020 14:24:54 +0100
Message-ID: <CA+V-a8vB2ArSsd4qVzjiFMqvQC-v6FnA5r8Krjust8JSX7FXvw@mail.gmail.com>
Subject: Re: [PATCH v2] media: ov5640: fix support of BT656 bus mode
To:     Hugues FRUCHET <hugues.fruchet@st.com>
Cc:     Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Jacopo Mondi <jacopo@jmondi.org>,
        Steve Longerbeam <slongerbeam@gmail.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media <linux-media@vger.kernel.org>,
        "linux-stm32@st-md-mailman.stormreply.com" 
        <linux-stm32@st-md-mailman.stormreply.com>,
        Alain VOLMAT <alain.volmat@st.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Hugues,

On Wed, Oct 14, 2020 at 11:43 AM Hugues FRUCHET <hugues.fruchet@st.com> wrote:
>
> Hi Prabhakar,
>
> On 10/14/20 12:26 AM, Lad, Prabhakar wrote:
> > Hi Hugues,
> >
> > Thank you for catching the polarity bug.
> Y're welcome.
>
> >
> > On Mon, Oct 12, 2020 at 3:55 PM Hugues Fruchet <hugues.fruchet@st.com> wrote:
> >>
> >> Fix PCLK polarity not being taken into account.
> >> Add comments about BT656 register control.
> >> Remove useless ov5640_set_stream_bt656() function.
> >> Refine comments about MIPI IO register control.
> >>
> >> Fixes: 4039b03720f7 ("media: i2c: ov5640: Add support for BT656 mode")
> >> Signed-off-by: Hugues Fruchet <hugues.fruchet@st.com>
> >> ---
> >>   drivers/media/i2c/ov5640.c | 77 +++++++++++++++++++++++++++-------------------
> >>   1 file changed, 45 insertions(+), 32 deletions(-)
> >>
> >> diff --git a/drivers/media/i2c/ov5640.c b/drivers/media/i2c/ov5640.c
> >> index 8d0254d..c0ebf4c 100644
> >> --- a/drivers/media/i2c/ov5640.c
> >> +++ b/drivers/media/i2c/ov5640.c
> >> @@ -1216,20 +1216,6 @@ static int ov5640_set_autogain(struct ov5640_dev *sensor, bool on)
> >>                                BIT(1), on ? 0 : BIT(1));
> >>   }
> >>
> >> -static int ov5640_set_stream_bt656(struct ov5640_dev *sensor, bool on)
> >> -{
> >> -       int ret;
> >> -
> >> -       ret = ov5640_write_reg(sensor, OV5640_REG_CCIR656_CTRL00,
> >> -                              on ? 0x1 : 0x00);
> >> -       if (ret)
> >> -               return ret;
> >> -
> >> -       return ov5640_write_reg(sensor, OV5640_REG_SYS_CTRL0, on ?
> >> -                               OV5640_REG_SYS_CTRL0_SW_PWUP :
> >> -                               OV5640_REG_SYS_CTRL0_SW_PWDN);
> >> -}
> >> -
> >>   static int ov5640_set_stream_dvp(struct ov5640_dev *sensor, bool on)
> >>   {
> >>          return ov5640_write_reg(sensor, OV5640_REG_SYS_CTRL0, on ?
> >> @@ -1994,6 +1980,7 @@ static int ov5640_set_power_mipi(struct ov5640_dev *sensor, bool on)
> >>   static int ov5640_set_power_dvp(struct ov5640_dev *sensor, bool on)
> >>   {
> >>          unsigned int flags = sensor->ep.bus.parallel.flags;
> >> +       bool bt656 = sensor->ep.bus_type == V4L2_MBUS_BT656;
> >>          u8 pclk_pol = 0;
> >>          u8 hsync_pol = 0;
> >>          u8 vsync_pol = 0;
> >> @@ -2001,6 +1988,7 @@ static int ov5640_set_power_dvp(struct ov5640_dev *sensor, bool on)
> >>
> >>          if (!on) {
> >>                  /* Reset settings to their default values. */
> >> +               ov5640_write_reg(sensor, OV5640_REG_CCIR656_CTRL00, 0x00);
> >>                  ov5640_write_reg(sensor, OV5640_REG_IO_MIPI_CTRL00, 0x58);
> >>                  ov5640_write_reg(sensor, OV5640_REG_POLARITY_CTRL00, 0x20);
> >>                  ov5640_write_reg(sensor, OV5640_REG_PAD_OUTPUT_ENABLE01, 0x00);
> >> @@ -2024,23 +2012,51 @@ static int ov5640_set_power_dvp(struct ov5640_dev *sensor, bool on)
> >>           * - VSYNC:     active high
> >>           * - HREF:      active low
> >>           * - PCLK:      active low
> >> +        *
> >> +        * VSYNC & HREF are not configured if BT656 bus mode is selected
> >>           */
> >> +
> >>          /*
> >> -        * configure parallel port control lines polarity
> >> +        * BT656 embedded synchronization configuration
> >>           *
> >> -        * POLARITY CTRL0
> >> -        * - [5]:       PCLK polarity (0: active low, 1: active high)
> >> -        * - [1]:       HREF polarity (0: active low, 1: active high)
> >> -        * - [0]:       VSYNC polarity (mismatch here between
> >> -        *              datasheet and hardware, 0 is active high
> >> -        *              and 1 is active low...)
> >> +        * CCIR656 CTRL00
> >> +        * - [7]:       SYNC code selection (0: auto generate sync code,
> >> +        *              1: sync code from regs 0x4732-0x4735)
> >> +        * - [6]:       f value in CCIR656 SYNC code when fixed f value
> >> +        * - [5]:       Fixed f value
> >> +        * - [4:3]:     Blank toggle data options (00: data=1'h040/1'h200,
> >> +        *              01: data from regs 0x4736-0x4738, 10: always keep 0)
> >> +        * - [1]:       Clip data disable
> >> +        * - [0]:       CCIR656 mode enable
> >> +        *
> >> +        * Default CCIR656 SAV/EAV mode with default codes
> >> +        * SAV=0xff000080 & EAV=0xff00009d is enabled here with settings:
> >> +        * - CCIR656 mode enable
> >> +        * - auto generation of sync codes
> >> +        * - blank toggle data 1'h040/1'h200
> >> +        * - clip reserved data (0x00 & 0xff changed to 0x01 & 0xfe)
> >>           */
> >> -       if (sensor->ep.bus_type == V4L2_MBUS_PARALLEL) {
> >> +       ret = ov5640_write_reg(sensor, OV5640_REG_CCIR656_CTRL00,
> >> +                              bt656 ? 0x01 : 0x00);
> > Did you test bt656 on your platform ? with these changes BT.656 mode
> > doesn't work anymore on my platform. With the below diff on top of
> > your patch it works OK. Could you please test the same works on your
> > platform.
>
> Yes of course, tested on STM32MP1 evaluation board with OV5640/parallel
> setup (stm32-dcmi capture driver). Several captures made, no issues.
>
> So in short you have to move the CCIR656 mode enable from set_power() to
> set_stream(), this is similar to changes you've made in code recently
> around OV5640_REG_SYS_CTRL0 & SW_PWUP/DOWN, but the reason to do that is
> still not understood, at least on my side.
> My understanding reading your patch was that OV5640_REG_SYS_CTRL0 ->
> SW_PWUP trigs the real "stream on" of the sensor and only at that time
> the data are produced by sensor, but if this is true, why do we need to
> enable CCIR656 right before SW_PWUP instead of enabling it with other
> DVP settings (DVP enable and so on...) ? This is not logical.
>
Sorry my bad it was one of thing, Ive done some thorough  re-testing
with just your patch and it looks OK.

Cheers,
Prabhakar

> I think that we have to understand what happens on your side before
> going to more changes on this already so complex driver.
>
> >
> > diff --git a/drivers/media/i2c/ov5640.c b/drivers/media/i2c/ov5640.c
> > index 49e73ace8685..c5e45bc17bdf 100644
> > --- a/drivers/media/i2c/ov5640.c
> > +++ b/drivers/media/i2c/ov5640.c
> > @@ -1977,6 +1977,40 @@ static int ov5640_set_power_mipi(struct
> > ov5640_dev *sensor, bool on)
> >          return 0;
> >   }
> >
> > +static int ov5640_set_stream_bt656(struct ov5640_dev *sensor, bool on)
> > +{
> > +       int ret;
> > +
> > +       /*
> > +        * BT656 embedded synchronization configuration
> > +        *
> > +        * CCIR656 CTRL00
> > +        * - [7]:       SYNC code selection (0: auto generate sync code,
> > +        *              1: sync code from regs 0x4732-0x4735)
> > +        * - [6]:       f value in CCIR656 SYNC code when fixed f value
> > +        * - [5]:       Fixed f value
> > +        * - [4:3]:     Blank toggle data options (00: data=1'h040/1'h200,
> > +        *              01: data from regs 0x4736-0x4738, 10: always keep 0)
> > +        * - [1]:       Clip data disable
> > +        * - [0]:       CCIR656 mode enable
> > +        *
> > +        * Default CCIR656 SAV/EAV mode with default codes
> > +        * SAV=0xff000080 & EAV=0xff00009d is enabled here with settings:
> > +        * - CCIR656 mode enable
> > +        * - auto generation of sync codes
> > +        * - blank toggle data 1'h040/1'h200
> > +        * - clip reserved data (0x00 & 0xff changed to 0x01 & 0xfe)
> > +        */
> > +       ret = ov5640_write_reg(sensor, OV5640_REG_CCIR656_CTRL00,
> > +                              on ? 0x1 : 0x00);
> > +       if (ret)
> > +               return ret;
> > +
> > +       return ov5640_write_reg(sensor, OV5640_REG_SYS_CTRL0, on ?
> > +                               OV5640_REG_SYS_CTRL0_SW_PWUP :
> > +                               OV5640_REG_SYS_CTRL0_SW_PWDN);
> > +}
> > +
> >   static int ov5640_set_power_dvp(struct ov5640_dev *sensor, bool on)
> >   {
> >          unsigned int flags = sensor->ep.bus.parallel.flags;
> > @@ -2014,31 +2048,6 @@ static int ov5640_set_power_dvp(struct
> > ov5640_dev *sensor, bool on)
> >           * VSYNC & HREF are not configured if BT656 bus mode is selected
> >           */
> >
> > -       /*
> > -        * BT656 embedded synchronization configuration
> > -        *
> > -        * CCIR656 CTRL00
> > -        * - [7]:       SYNC code selection (0: auto generate sync code,
> > -        *              1: sync code from regs 0x4732-0x4735)
> > -        * - [6]:       f value in CCIR656 SYNC code when fixed f value
> > -        * - [5]:       Fixed f value
> > -        * - [4:3]:     Blank toggle data options (00: data=1'h040/1'h200,
> > -        *              01: data from regs 0x4736-0x4738, 10: always keep 0)
> > -        * - [1]:       Clip data disable
> > -        * - [0]:       CCIR656 mode enable
> > -        *
> > -        * Default CCIR656 SAV/EAV mode with default codes
> > -        * SAV=0xff000080 & EAV=0xff00009d is enabled here with settings:
> > -        * - CCIR656 mode enable
> > -        * - auto generation of sync codes
> > -        * - blank toggle data 1'h040/1'h200
> > -        * - clip reserved data (0x00 & 0xff changed to 0x01 & 0xfe)
> > -        */
> > -       ret = ov5640_write_reg(sensor, OV5640_REG_CCIR656_CTRL00,
> > -                              bt656 ? 0x01 : 0x00);
> > -       if (ret)
> > -               return ret;
> > -
> >          /*
> >           * configure parallel port control lines polarity
> >           *
> > @@ -2935,6 +2944,8 @@ static int ov5640_s_stream(struct v4l2_subdev
> > *sd, int enable)
> >
> >                  if (sensor->ep.bus_type == V4L2_MBUS_CSI2_DPHY)
> >                          ret = ov5640_set_stream_mipi(sensor, enable);
> > +               else if (sensor->ep.bus_type == V4L2_MBUS_BT656)
> > +                       ret = ov5640_set_stream_bt656(sensor, enable);
> >                  else
> >                          ret = ov5640_set_stream_dvp(sensor, enable);
> >
> > Cheers,
> > Prabhakar
> >
> >> +       if (ret)
> >> +               return ret;
> >> +
> >> +       if (on) {
> >> +               /*
> >> +                * configure parallel port control lines polarity
> >> +                *
> >> +                * POLARITY CTRL0
> >> +                * - [5]:       PCLK polarity (0: active low, 1: active high)
> >> +                * - [1]:       HREF polarity (0: active low, 1: active high)
> >> +                * - [0]:       VSYNC polarity (mismatch here between
> >> +                *              datasheet and hardware, 0 is active high
> >> +                *              and 1 is active low...)
> >> +                */
> >>                  if (flags & V4L2_MBUS_PCLK_SAMPLE_RISING)
> >>                          pclk_pol = 1;
> >> -               if (flags & V4L2_MBUS_HSYNC_ACTIVE_HIGH)
> >> +               if (!bt656 && flags & V4L2_MBUS_HSYNC_ACTIVE_HIGH)
> >>                          hsync_pol = 1;
> >> -               if (flags & V4L2_MBUS_VSYNC_ACTIVE_LOW)
> >> +               if (!bt656 && flags & V4L2_MBUS_VSYNC_ACTIVE_LOW)
> >>                          vsync_pol = 1;
> >>
> >>                  ret = ov5640_write_reg(sensor, OV5640_REG_POLARITY_CTRL00,
> >> @@ -2052,12 +2068,12 @@ static int ov5640_set_power_dvp(struct ov5640_dev *sensor, bool on)
> >>          }
> >>
> >>          /*
> >> -        * powerdown MIPI TX/RX PHY & disable MIPI
> >> +        * powerdown MIPI TX/RX PHY & enable DVP
> >>           *
> >>           * MIPI CONTROL 00
> >> -        * 4:    PWDN PHY TX
> >> -        * 3:    PWDN PHY RX
> >> -        * 2:    MIPI enable
> >> +        * [4] = 1      : Power down MIPI HS Tx
> >> +        * [3] = 1      : Power down MIPI LS Rx
> >> +        * [2] = 0      : DVP enable (MIPI disable)
> >>           */
> >>          ret = ov5640_write_reg(sensor, OV5640_REG_IO_MIPI_CTRL00, 0x18);
> >>          if (ret)
> >> @@ -2074,8 +2090,7 @@ static int ov5640_set_power_dvp(struct ov5640_dev *sensor, bool on)
> >>           * - [3:0]:     D[9:6] output enable
> >>           */
> >>          ret = ov5640_write_reg(sensor, OV5640_REG_PAD_OUTPUT_ENABLE01,
> >> -                              sensor->ep.bus_type == V4L2_MBUS_PARALLEL ?
> >> -                              0x7f : 0x1f);
> >> +                              bt656 ? 0x1f : 0x7f);
> >>          if (ret)
> >>                  return ret;
> >>
> >> @@ -2925,8 +2940,6 @@ static int ov5640_s_stream(struct v4l2_subdev *sd, int enable)
> >>
> >>                  if (sensor->ep.bus_type == V4L2_MBUS_CSI2_DPHY)
> >>                          ret = ov5640_set_stream_mipi(sensor, enable);
> >> -               else if (sensor->ep.bus_type == V4L2_MBUS_BT656)
> >> -                       ret = ov5640_set_stream_bt656(sensor, enable);
> >>                  else
> >>                          ret = ov5640_set_stream_dvp(sensor, enable);
> >>
> >> --
> >> 2.7.4
> >>
>
> BR,
> Hugues.
