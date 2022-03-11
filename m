Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5526B4D6115
	for <lists+linux-media@lfdr.de>; Fri, 11 Mar 2022 12:58:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1348423AbiCKL7Q (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 11 Mar 2022 06:59:16 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59528 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240923AbiCKL7M (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 11 Mar 2022 06:59:12 -0500
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com [IPv6:2a00:1450:4864:20::636])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4FC9F6C952
        for <linux-media@vger.kernel.org>; Fri, 11 Mar 2022 03:58:06 -0800 (PST)
Received: by mail-ej1-x636.google.com with SMTP id gb39so18532382ejc.1
        for <linux-media@vger.kernel.org>; Fri, 11 Mar 2022 03:58:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=EwcLbMtoB1aSsIjdhqITkDOQxcoh7z/7rseFhzJf5EM=;
        b=mN7L+zUEB8QrCzMZIwJKOKDo7BByPyxj0dLh5KQiYUmkG4oGKRbs5Xh6QnpnBpg+dM
         MGaYDoKxRJAgdKpjbHZWFItVKOEhQnNDDEvM/OaOG2PP3/B+Qx0w/Vs0S41ehD7w9Lax
         XqKwHEDY7P9vdOMIUkhMpHUdou5N+UeYv1wIt4CgJTiXgiIYpBwR39ffhX41AIBBKfuL
         JL0JObqyH6yP6i4jeaNt7dOzcm8cJ8hFXg3NpfZSHuMerQp4n7ZHQAAjeyItzI6idDjq
         Nj6tqtysUyj7yAIQVzrLysUtx9EdMxjHoeYkhm6RHIMauJ28unFUfOCR6yhgbdwGe7fK
         WVwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=EwcLbMtoB1aSsIjdhqITkDOQxcoh7z/7rseFhzJf5EM=;
        b=EuSjET8E9TTkQkm9No/m8U2e3PPfycVpAtqlRp6UmrmWflmRE2jkTA0s1B9avfoM4y
         EMS5qx9JMB9AvL5YqIKAhCoAlayfbroXUQlZ5oNOWrn598yQQ5z5W1EUCIE/hEk+mtTf
         yPKO14R6lWXW8dbsAOCvjPM8q9jutzy0eDfW+MFQ1rZ/hMrfbnFMmblUJRElarm69dL3
         KTf4LgrX+LZ/jiFBNo4Z0abT6tYrF+mwrNIhQwnpenTJuQPAbbA46noakgBVijfTqE28
         XQllFVfbQFxseN6cdtoBchyOsyFhAr2jp0GALxXg+dFZHDIkhJ++90dFNEgHQNVu0JSO
         gLtA==
X-Gm-Message-State: AOAM532KsnZPAbtuOVtwpTpDi0XJe2fahRm7SZB/F8jEfwjyVhRKgdR+
        3O6HMCcqIhEgetLiDEKGhmLrHTQehnjuyXs9zdsdsA==
X-Google-Smtp-Source: ABdhPJyoWwhhSKzSEZf6Iq0wuhATZaZ+yrcFsn8wDb2IEWs3d0gs4NKBfREogI3YdAKqqLhSuXrDtModMo9ST/+iNMA=
X-Received: by 2002:a17:907:7f13:b0:6db:71fa:9e31 with SMTP id
 qf19-20020a1709077f1300b006db71fa9e31mr8115187ejc.742.1646999884144; Fri, 11
 Mar 2022 03:58:04 -0800 (PST)
MIME-Version: 1.0
References: <20220310133255.1946530-1-benjamin.mugnier@foss.st.com>
 <20220310133255.1946530-3-benjamin.mugnier@foss.st.com> <164692035967.11309.10108246176914754429@Monstersaurus>
 <CAPY8ntCPuF-LTmT9LZtMZ1e4V=wnRdP-PBcRbiJ5ZYvr3bNG7Q@mail.gmail.com> <657ff2b4-41b1-0d22-9e53-163c0ce5ff03@foss.st.com>
In-Reply-To: <657ff2b4-41b1-0d22-9e53-163c0ce5ff03@foss.st.com>
From:   Dave Stevenson <dave.stevenson@raspberrypi.com>
Date:   Fri, 11 Mar 2022 11:57:47 +0000
Message-ID: <CAPY8ntC67GoWT9FNr20DurnLbmbEH2+YBtXsmkEdq1AHBNDtZA@mail.gmail.com>
Subject: Re: [PATCH 2/2] media: i2c: Add driver for ST VGXY61 camera sensor
To:     Benjamin Mugnier <benjamin.mugnier@foss.st.com>
Cc:     Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        alain.volmat@foss.st.com, hugues.fruchet@foss.st.com,
        sylvain.petinot@foss.st.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Benjamin

On Fri, 11 Mar 2022 at 10:56, Benjamin Mugnier
<benjamin.mugnier@foss.st.com> wrote:
>
> Hi Dave,
>
> Thanks for your review. Here are my comments and some questions.
>
> On 10/03/2022 16:21, Dave Stevenson wrote:
> > Hi Benjamin and Kieran
> >
> > On Thu, 10 Mar 2022 at 13:52, Kieran Bingham
> > <kieran.bingham@ideasonboard.com> wrote:
> >>
> >> Hi Benjamin,
> >>
> >> Thank you for the patch -
> >>
> >> Quoting Benjamin Mugnier (2022-03-10 13:32:55)
> >>> The VGXY61 has a quad lanes CSI-2 output port running at 800mbps per
> >>> lane, and supports RAW8, RAW10, RAW12, RAW14 and RAW16 formats.
> >>> The driver handles both sensor types:
> >>> - VG5661 and VG6661: 1.6 Mpx (1464 x 1104) 75fps.
> >>> - VG5761 and VG6761: 2.3 Mpx (1944 x 1204) 60 fps.
> >>> The driver supports:
> >>> - HDR linearize mode, HDR substraction mode, and no HDR
> >>> - GPIOs LEDs strobing
> >>> - Digital binning and analog subsampling
> >>> - Horizontal and vertical flip
> >>> - Manual exposure
> >>> - Analog and digital gains
> >>> - Test patterns
> >>
> >> I haven't reviewed the driver directly yet, but I have a script which
> >> looks for key requirements for libcamera.
> >> (https://git.linuxtv.org/libcamera.git/tree/Documentation/sensor_drive=
r_requirements.rst)
> >>
> >>
> >> Media Controller Support:
> >>  - V4L2_SUBDEV_FL_HAS_DEVNODE      : found
> >>  - MEDIA_ENT_F_CAM_SENSOR          : found
> >>
> >> Mandatory Controls:
> >>  - V4L2_CID_EXPOSURE               : found
> >>  - V4L2_CID_HBLANK                 : --------
> >>  - V4L2_CID_VBLANK                 : --------
> >>  - V4L2_CID_PIXEL_RATE             : found
> >>
> >> Selection Controls (will become mandatory):
> >>  - V4L2_SEL_TGT_CROP_DEFAULT       : --------
> >>  - V4L2_SEL_TGT_CROP               : --------
> >>  - V4L2_SEL_TGT_CROP_BOUNDS        : --------
> >>  - .get_selection                  : --------
> >>
> >> Optional Controls:
> >>  - V4L2_CID_TEST_PATTERN           : found
> >>  - V4L2_CID_GAIN                   : --------
> >>  - V4L2_CID_ANALOGUE_GAIN          : found
> >>  - V4L2_CID_CAMERA_SENSOR_ROTATION : --------
> >>  - V4L2_CID_CAMERA_ORIENTATION     : --------
> >>
> >>
> >> The key missing pieces are HBLANK/VBLANK and the .get_selection API. I=
s
> >> it easy/feasible to add these?
> >
> > It's documented that HBLANK/VBLANK are the correct parameters to use
> > for raw image sensors [1].
> >
> > It looks like register DEVICE_FRAME_LENGTH is mode->height +
> > V4L2_CID_VBLANK, and DEVICE_LINE_LENGTH is mode->width +
> > V4L2_CID_HBLANK (appears to be treated as read only)
> > Most other sensors will adjust the max value of V4L2_CID_EXPOSURE
> > based on the frame length.
> >
> > [1] https://www.kernel.org/doc/html/latest/driver-api/media/camera-sens=
or.html#frame-interval-configuration
> >
> > I've only done a quick review on the rest.
> >
> >> --
> >> Regards
> >>
> >> Kieran
> >>
> >>
> >>>
> >>> Signed-off-by: Benjamin Mugnier <benjamin.mugnier@foss.st.com>
> >>> ---
> >>>  drivers/media/i2c/Kconfig     |   11 +
> >>>  drivers/media/i2c/Makefile    |    1 +
> >>>  drivers/media/i2c/st-vgxy61.c | 1919 +++++++++++++++++++++++++++++++=
++
> >>>  3 files changed, 1931 insertions(+)
> >>>  create mode 100644 drivers/media/i2c/st-vgxy61.c
> >>>
> >>> diff --git a/drivers/media/i2c/Kconfig b/drivers/media/i2c/Kconfig
> >>> index fe66093b8849..e6e9c1f19c09 100644
> >>> --- a/drivers/media/i2c/Kconfig
> >>> +++ b/drivers/media/i2c/Kconfig
> >>> @@ -1454,6 +1454,17 @@ config VIDEO_S5C73M3
> >>>           This is a V4L2 sensor driver for Samsung S5C73M3
> >>>           8 Mpixel camera.
> >>>
> >>> +config VIDEO_ST_VGXY61
> >>> +       tristate "ST VGXY61 sensor support"
> >>> +       depends on OF
> >>> +       depends on GPIOLIB && VIDEO_V4L2 && I2C
> >>> +       select MEDIA_CONTROLLER
> >>> +       select VIDEO_V4L2_SUBDEV_API
> >>> +       select V4L2_FWNODE
> >>> +       help
> >>> +         This is a Video4Linux2 sensor driver for the ST VGXY61
> >>> +         camera sensor.
> >>> +
> >>>  endmenu
> >>>
> >>>  menu "Lens drivers"
> >>> diff --git a/drivers/media/i2c/Makefile b/drivers/media/i2c/Makefile
> >>> index f6b80ef6f41d..0190b5edfa24 100644
> >>> --- a/drivers/media/i2c/Makefile
> >>> +++ b/drivers/media/i2c/Makefile
> >>> @@ -138,4 +138,5 @@ obj-$(CONFIG_VIDEO_MAX9271_LIB)     +=3D max9271.=
o
> >>>  obj-$(CONFIG_VIDEO_RDACM20)    +=3D rdacm20.o
> >>>  obj-$(CONFIG_VIDEO_RDACM21)    +=3D rdacm21.o
> >>>  obj-$(CONFIG_VIDEO_ST_MIPID02) +=3D st-mipid02.o
> >>> +obj-$(CONFIG_VIDEO_ST_VGXY61)  +=3D st-vgxy61.o
> >>>  obj-$(CONFIG_SDR_MAX2175) +=3D max2175.o
> >>> diff --git a/drivers/media/i2c/st-vgxy61.c b/drivers/media/i2c/st-vgx=
y61.c
> >>> new file mode 100644
> >>> index 000000000000..d3d816189f86
> >>> --- /dev/null
> >>> +++ b/drivers/media/i2c/st-vgxy61.c
> >>> @@ -0,0 +1,1919 @@
> >>> +// SPDX-License-Identifier: GPL-2.0
> >>> +/*
> >>> + * Driver for VGXY61 global shutter sensor family driver
> >>> + *
> >>> + * Copyright (C) 2022 STMicroelectronics SA
> >>> + */
> >>> +
> >>> +#include <linux/clk.h>
> >>> +#include <linux/delay.h>
> >>> +#include <linux/gpio/consumer.h>
> >>> +#include <linux/i2c.h>
> >>> +#include <linux/module.h>
> >>> +#include <linux/regulator/consumer.h>
> >>> +#include <linux/units.h>
> >>> +#include <linux/iopoll.h>
> >>> +#include <media/mipi-csi2.h>
> >>> +#include <media/v4l2-async.h>
> >>> +#include <media/v4l2-ctrls.h>
> >>> +#include <media/v4l2-device.h>
> >>> +#include <media/v4l2-fwnode.h>
> >>> +#include <media/v4l2-subdev.h>
> >>> +
> >>> +#define US_PER_MS                                      1000
> >>> +
> >>> +#define DEVICE_MODEL_ID_REG                            0x0000
> >>> +#define VG5661_MODEL_ID                                        0x566=
1
> >>> +#define VG5761_MODEL_ID                                        0x576=
1
> >>> +#define VGX661_WIDTH                                   1464
> >>> +#define VGX661_HEIGHT                                  1104
> >>> +#define VGX761_WIDTH                                   1944
> >>> +#define VGX761_HEIGHT                                  1204
> >>> +#define VGX661_DEFAULT_MODE                            1
> >>> +#define VGX761_DEFAULT_MODE                            1
> >>> +#define VGX661_SHORT_ROT_TERM                          93
> >>> +#define VGX761_SHORT_ROT_TERM                          90
> >>> +#define VGXY61_EXPOS_ROT_TERM                          66
> >>> +#define DEVICE_REVISION                                        0x000=
2
> >>> +#define DEVICE_FWPATCH_REVISION                                0x001=
4
> >>> +#define DEVICE_FWPATCH_START_ADDR                      0x2000
> >>> +#define DEVICE_SYSTEM_FSM                              0x0020
> >>> +#define SW_STBY                                                0x03
> >>> +#define STREAMING                                      0x04
> >>> +#define DEVICE_NVM                                     0x0023
> >>> +#define NVM_OK                                         0x04
> >>> +#define DEVICE_THSENS1_TEMPERATURE                     0x0044
> >>> +#define DEVICE_STBY                                    0x0201
> >>> +#define STBY_NO_REQ                                    0
> >>> +#define STBY_REQ_TMP_READ                              BIT(2)
> >>> +#define DEVICE_STREAMING                               0x0202
> >>> +#define REQ_NO_REQUEST                                 0
> >>> +#define REQ_STOP_STREAMING                             BIT(0)
> >>> +#define REQ_START_STREAMING                            BIT(1)
> >>> +#define DEVICE_EXT_CLOCK                               0x0220
> >>> +#define DEVICE_CLK_PLL_PREDIV                          0x0224
> >>> +#define DEVICE_CLK_SYS_PLL_MULT                                0x022=
5
> >>> +#define DEVICE_GPIO_0_CTRL                             0x0236
> >>> +#define DEVICE_GPIO_1_CTRL                             0x0237
> >>> +#define DEVICE_GPIO_2_CTRL                             0x0238
> >>> +#define DEVICE_GPIO_3_CTRL                             0x0239
> >>> +#define DEVICE_SIGNALS_POLARITY_CTRL                   0x023b
> >>> +#define DEVICE_LINE_LENGTH                             0x0300
> >>> +#define DEVICE_ORIENTATION                             0x0302
> >>> +#define DEVICE_VT_CTRL                                 0x0304
> >>> +#define DEVICE_FORMAT_CTRL                             0x0305
> >>> +#define DEVICE_OIF_CTRL                                        0x030=
6
> >>> +#define DEVICE_OIF_ROI0_CTRL                           0x030a
> >>> +#define DEVICE_ROI0_START_H                            0x0400
> >>> +#define DEVICE_ROI0_START_V                            0x0402
> >>> +#define DEVICE_ROI0_END_H                              0x0404
> >>> +#define DEVICE_ROI0_END_V                              0x0406
> >>> +#define DEVICE_PATGEN_CTRL                             0x0440
> >>> +#define DEVICE_FRAME_CONTENT_CTRL                      0x0478
> >>> +#define DEVICE_COARSE_EXPOSURE_LONG                    0x0500
> >>> +#define DEVICE_COARSE_EXPOSURE_SHORT                   0x0504
> >>> +#define DEVICE_ANALOG_GAIN                             0x0508
> >>> +#define DEVICE_DIGITAL_GAIN_LONG                       0x050a
> >>> +#define DEVICE_DIGITAL_GAIN_SHORT                      0x0512
> >>> +#define DEVICE_FRAME_LENGTH                            0x051a
> >>> +#define DEVICE_SIGNALS_CTRL                            0x0522
> >>> +#define DEVICE_STROBE_LONG_START_DELAY                 0x0528
> >>> +#define DEVICE_STROBE_LONG_END_DELAY                   0x052a
> >>> +#define DEVICE_STROBE_SHORT_START_DELAY                        0x052=
c
> >>> +#define DEVICE_STROBE_SHORT_END_DELAY                  0x052e
> >>> +#define DEVICE_READOUT_CTRL                            0x0530
> >>> +#define DEVICE_HDR_CTRL                                        0x053=
2
> >>> +#define DEVICE_PATGEN_LONG_DATA_GR                     0x092c
> >>> +#define DEVICE_PATGEN_LONG_DATA_R                      0x092e
> >>> +#define DEVICE_PATGEN_LONG_DATA_B                      0x0930
> >>> +#define DEVICE_PATGEN_LONG_DATA_GB                     0x0932
> >>> +#define DEVICE_PATGEN_SHORT_DATA_GR                    0x0950
> >>> +#define DEVICE_PATGEN_SHORT_DATA_R                     0x0952
> >>> +#define DEVICE_PATGEN_SHORT_DATA_B                     0x0954
> >>> +#define DEVICE_PATGEN_SHORT_DATA_GB                    0x0956
> >>> +#define DEVICE_BYPASS_CTRL                             0x0a60
> >>> +
> >>> +#define V4L2_CID_HDR                           (V4L2_CID_USER_BASE |=
 0x1004)
> >>> +#define V4L2_CID_GPIOS_STROBE_LONG_START_DELAY (V4L2_CID_USER_BASE |=
 0x1019)
> >>> +#define V4L2_CID_GPIOS_STROBE_LONG_END_DELAY   (V4L2_CID_USER_BASE |=
 0x101a)
> >>> +#define V4L2_CID_GPIOS_STROBE_SHORT_START_DELAY        (V4L2_CID_USE=
R_BASE | 0x101b)
> >>> +#define V4L2_CID_GPIOS_STROBE_SHORT_END_DELAY  (V4L2_CID_USER_BASE |=
 0x101c)
> >>> +#define V4L2_CID_TEMPERATURE                   (V4L2_CID_USER_BASE |=
 0x1020)
> >
> > The strobe and temperature controls are equally valid for other
> > sensors, so IMHO ought to be added as standard controls.
> >
>
> Agreed for the temperature, I will add it as a standard control in v2.
> As for the strobing I am not sure, these are controls to set the strobing=
 delay for long exposure and short exposure (if in HDR mode), not to enable=
 or disable the strobbing. I could not find anything like this in the codeb=
ase so I guess this is pretty unique to this sensor?

I'm not sure I follow what the controls are doing then. "GPIOs LEDs
strobing" and the name V4L2_CID_GPIOS_STROBE_* implies to me that it
is an output GPIO that is asserted during the short/long exposure
period with an optional delay.
Many sensors have a GPIO that is asserted during the exposure period,
often with an optional delay. Whilst they don't necessarily support
HDR and therefore have two outputs, there are going to be a number
with commonality.
External GPIO control is another area that seems to be under-served
within V4L2. A bit of discussion to sort a generic set of controls
would be useful.

If they are custom to your sensor, then you really want to define a
block of CID values for your sensor in
https://elixir.bootlin.com/linux/latest/source/include/uapi/linux/v4l2-cont=
rols.h#L152
to avoid something else using the same numbers.

Unless they are totally critical to the function of this sensor, you
could drop them for this initial driver, and then the discussion about
the correct way to support them can come later.

> >>> +
> >>> +#define DEVICE_FWPATCH_REVISION_MAJOR                  2
> >>> +#define DEVICE_FWPATCH_REVISION_MINOR                  0
> >>> +#define DEVICE_FWPATCH_REVISION_MICRO                  5
> >>> +
> >>> +#define WRITE_MULTIPLE_CHUNK_MAX                       16
> >>> +#define NB_GPIOS                                       4
> >>> +#define NB_POLARITIES                                  5
> >>> +
> >>> +static const u8 patch_array[] =3D {
> >>> +       0xbf, 0x00, 0x05, 0x20, 0x06, 0x01, 0xe0, 0xe0, 0x04, 0x80, 0=
xe6, 0x45,
> >>> +       0xed, 0x6f, 0xfe, 0xff, 0x14, 0x80, 0x1f, 0x84, 0x10, 0x42, 0=
x05, 0x7c,
> >>> +       0x01, 0xc4, 0x1e, 0x80, 0xb6, 0x42, 0x00, 0xe0, 0x1e, 0x82, 0=
x1e, 0xc0,
> >>> +       0x93, 0xdd, 0xc3, 0xc1, 0x0c, 0x04, 0x00, 0xfa, 0x86, 0x0d, 0=
x70, 0xe1,
> >>> +       0x04, 0x98, 0x15, 0x00, 0x28, 0xe0, 0x14, 0x02, 0x08, 0xfc, 0=
x15, 0x40,
> >>> +       0x28, 0xe0, 0x98, 0x58, 0xe0, 0xef, 0x04, 0x98, 0x0e, 0x04, 0=
x00, 0xf0,
> >>> +       0x15, 0x00, 0x28, 0xe0, 0x19, 0xc8, 0x15, 0x40, 0x28, 0xe0, 0=
xc6, 0x41,
> >>> +       0xfc, 0xe0, 0x14, 0x80, 0x1f, 0x84, 0x14, 0x02, 0xa0, 0xfc, 0=
x1e, 0x80,
> >>> +       0x14, 0x80, 0x14, 0x02, 0x80, 0xfb, 0x14, 0x02, 0xe0, 0xfc, 0=
x1e, 0x80,
> >>> +       0x14, 0xc0, 0x1f, 0x84, 0x14, 0x02, 0xa4, 0xfc, 0x1e, 0xc0, 0=
x14, 0xc0,
> >>> +       0x14, 0x02, 0x80, 0xfb, 0x14, 0x02, 0xe4, 0xfc, 0x1e, 0xc0, 0=
x0c, 0x0c,
> >>> +       0x00, 0xf2, 0x93, 0xdd, 0x86, 0x00, 0xf8, 0xe0, 0x04, 0x80, 0=
xc6, 0x03,
> >>> +       0x70, 0xe1, 0x0e, 0x84, 0x93, 0xdd, 0xc3, 0xc1, 0x0c, 0x04, 0=
x00, 0xfa,
> >>> +       0x6b, 0x80, 0x06, 0x40, 0x6c, 0xe1, 0x04, 0x80, 0x09, 0x00, 0=
xe0, 0xe0,
> >>> +       0x0b, 0xa1, 0x95, 0x84, 0x05, 0x0c, 0x1c, 0xe0, 0x86, 0x02, 0=
xf9, 0x60,
> >>> +       0xe0, 0xcf, 0x78, 0x6e, 0x80, 0xef, 0x25, 0x0c, 0x18, 0xe0, 0=
x05, 0x4c,
> >>> +       0x1c, 0xe0, 0x86, 0x02, 0xf9, 0x60, 0xe0, 0xcf, 0x0b, 0x84, 0=
xd8, 0x6d,
> >>> +       0x80, 0xef, 0x05, 0x4c, 0x18, 0xe0, 0x04, 0xd8, 0x0b, 0xa5, 0=
x95, 0x84,
> >>> +       0x05, 0x0c, 0x2c, 0xe0, 0x06, 0x02, 0x01, 0x60, 0xe0, 0xce, 0=
x18, 0x6d,
> >>> +       0x80, 0xef, 0x25, 0x0c, 0x30, 0xe0, 0x05, 0x4c, 0x2c, 0xe0, 0=
x06, 0x02,
> >>> +       0x01, 0x60, 0xe0, 0xce, 0x0b, 0x84, 0x78, 0x6c, 0x80, 0xef, 0=
x05, 0x4c,
> >>> +       0x30, 0xe0, 0x0c, 0x0c, 0x00, 0xf2, 0x93, 0xdd, 0x46, 0x01, 0=
x70, 0xe1,
> >>> +       0x08, 0x80, 0x0b, 0xa1, 0x08, 0x5c, 0x00, 0xda, 0x06, 0x01, 0=
x68, 0xe1,
> >>> +       0x04, 0x80, 0x4a, 0x40, 0x84, 0xe0, 0x08, 0x5c, 0x00, 0x9a, 0=
x06, 0x01,
> >>> +       0xe0, 0xe0, 0x04, 0x80, 0x15, 0x00, 0x60, 0xe0, 0x19, 0xc4, 0=
x15, 0x40,
> >>> +       0x60, 0xe0, 0x15, 0x00, 0x78, 0xe0, 0x19, 0xc4, 0x15, 0x40, 0=
x78, 0xe0,
> >>> +       0x93, 0xdd, 0xc3, 0xc1, 0x46, 0x01, 0x70, 0xe1, 0x08, 0x80, 0=
x0b, 0xa1,
> >>> +       0x08, 0x5c, 0x00, 0xda, 0x06, 0x01, 0x68, 0xe1, 0x04, 0x80, 0=
x4a, 0x40,
> >>> +       0x84, 0xe0, 0x08, 0x5c, 0x00, 0x9a, 0x06, 0x01, 0xe0, 0xe0, 0=
x14, 0x80,
> >>> +       0x25, 0x02, 0x54, 0xe0, 0x29, 0xc4, 0x25, 0x42, 0x54, 0xe0, 0=
x24, 0x80,
> >>> +       0x35, 0x04, 0x6c, 0xe0, 0x39, 0xc4, 0x35, 0x44, 0x6c, 0xe0, 0=
x25, 0x02,
> >>> +       0x64, 0xe0, 0x29, 0xc4, 0x25, 0x42, 0x64, 0xe0, 0x04, 0x80, 0=
x15, 0x00,
> >>> +       0x7c, 0xe0, 0x19, 0xc4, 0x15, 0x40, 0x7c, 0xe0, 0x93, 0xdd, 0=
xc3, 0xc1,
> >>> +       0x4c, 0x04, 0x7c, 0xfa, 0x86, 0x40, 0x98, 0xe0, 0x14, 0x80, 0=
x1b, 0xa1,
> >>> +       0x06, 0x00, 0x00, 0xc0, 0x08, 0x42, 0x38, 0xdc, 0x08, 0x64, 0=
xa0, 0xef,
> >>> +       0x86, 0x42, 0x3c, 0xe0, 0x68, 0x49, 0x80, 0xef, 0x6b, 0x80, 0=
x78, 0x53,
> >>> +       0xc8, 0xef, 0xc6, 0x54, 0x6c, 0xe1, 0x7b, 0x80, 0xb5, 0x14, 0=
x0c, 0xf8,
> >>> +       0x05, 0x14, 0x14, 0xf8, 0x1a, 0xac, 0x8a, 0x80, 0x0b, 0x90, 0=
x38, 0x55,
> >>> +       0x80, 0xef, 0x1a, 0xae, 0x17, 0xc2, 0x03, 0x82, 0x88, 0x65, 0=
x80, 0xef,
> >>> +       0x1b, 0x80, 0x0b, 0x8e, 0x68, 0x65, 0x80, 0xef, 0x9b, 0x80, 0=
x0b, 0x8c,
> >>> +       0x08, 0x65, 0x80, 0xef, 0x6b, 0x80, 0x0b, 0x92, 0x1b, 0x8c, 0=
x98, 0x64,
> >>> +       0x80, 0xef, 0x1a, 0xec, 0x9b, 0x80, 0x0b, 0x90, 0x95, 0x54, 0=
x10, 0xe0,
> >>> +       0xa8, 0x53, 0x80, 0xef, 0x1a, 0xee, 0x17, 0xc2, 0x03, 0x82, 0=
xf8, 0x63,
> >>> +       0x80, 0xef, 0x1b, 0x80, 0x0b, 0x8e, 0xd8, 0x63, 0x80, 0xef, 0=
x1b, 0x8c,
> >>> +       0x68, 0x63, 0x80, 0xef, 0x6b, 0x80, 0x0b, 0x92, 0x65, 0x54, 0=
x14, 0xe0,
> >>> +       0x08, 0x65, 0x84, 0xef, 0x68, 0x63, 0x80, 0xef, 0x7b, 0x80, 0=
x0b, 0x8c,
> >>> +       0xa8, 0x64, 0x84, 0xef, 0x08, 0x63, 0x80, 0xef, 0x14, 0xe8, 0=
x46, 0x44,
> >>> +       0x94, 0xe1, 0x24, 0x88, 0x4a, 0x4e, 0x04, 0xe0, 0x14, 0xea, 0=
x1a, 0x04,
> >>> +       0x08, 0xe0, 0x0a, 0x40, 0x84, 0xed, 0x0c, 0x04, 0x00, 0xe2, 0=
x4a, 0x40,
> >>> +       0x04, 0xe0, 0x19, 0x16, 0xc0, 0xe0, 0x0a, 0x40, 0x84, 0xed, 0=
x21, 0x54,
> >>> +       0x60, 0xe0, 0x0c, 0x04, 0x00, 0xe2, 0x1b, 0xa5, 0x0e, 0xea, 0=
x01, 0x89,
> >>> +       0x21, 0x54, 0x64, 0xe0, 0x7e, 0xe8, 0x65, 0x82, 0x1b, 0xa7, 0=
x26, 0x00,
> >>> +       0x00, 0x80, 0xa5, 0x82, 0x1b, 0xa9, 0x65, 0x82, 0x1b, 0xa3, 0=
x01, 0x85,
> >>> +       0x16, 0x00, 0x00, 0xc0, 0x01, 0x54, 0x04, 0xf8, 0x06, 0xaa, 0=
x01, 0x83,
> >>> +       0x06, 0xa8, 0x65, 0x81, 0x06, 0xa8, 0x01, 0x54, 0x04, 0xf8, 0=
x01, 0x83,
> >>> +       0x06, 0xaa, 0x09, 0x14, 0x18, 0xf8, 0x0b, 0xa1, 0x05, 0x84, 0=
xc6, 0x42,
> >>> +       0xd4, 0xe0, 0x14, 0x84, 0x01, 0x83, 0x01, 0x54, 0x60, 0xe0, 0=
x01, 0x54,
> >>> +       0x64, 0xe0, 0x0b, 0x02, 0x90, 0xe0, 0x10, 0x02, 0x90, 0xe5, 0=
x01, 0x54,
> >>> +       0x88, 0xe0, 0xb5, 0x81, 0xc6, 0x40, 0xd4, 0xe0, 0x14, 0x80, 0=
x0b, 0x02,
> >>> +       0xe0, 0xe4, 0x10, 0x02, 0x31, 0x66, 0x02, 0xc0, 0x01, 0x54, 0=
x88, 0xe0,
> >>> +       0x1a, 0x84, 0x29, 0x14, 0x10, 0xe0, 0x1c, 0xaa, 0x2b, 0xa1, 0=
xf5, 0x82,
> >>> +       0x25, 0x14, 0x10, 0xf8, 0x2b, 0x04, 0xa8, 0xe0, 0x20, 0x44, 0=
x0d, 0x70,
> >>> +       0x03, 0xc0, 0x2b, 0xa1, 0x04, 0x00, 0x80, 0x9a, 0x02, 0x40, 0=
x84, 0x90,
> >>> +       0x03, 0x54, 0x04, 0x80, 0x4c, 0x0c, 0x7c, 0xf2, 0x93, 0xdd, 0=
x00, 0x00,
> >>> +       0x02, 0xa9, 0x00, 0x00, 0x64, 0x4a, 0x40, 0x00, 0x08, 0x2d, 0=
x58, 0xe0,
> >>> +       0xa8, 0x98, 0x40, 0x00, 0x28, 0x07, 0x34, 0xe0, 0x05, 0xb9, 0=
x00, 0x00,
> >>> +       0x28, 0x00, 0x41, 0x05, 0x88, 0x00, 0x41, 0x3c, 0x98, 0x00, 0=
x41, 0x52,
> >>> +       0x04, 0x01, 0x41, 0x79, 0x3c, 0x01, 0x41, 0x6a, 0x3d, 0xfe, 0=
x00, 0x00,
> >>> +};
> >>> +
> >>> +static const char * const vgxy61_test_pattern_menu[] =3D {
> >>> +       "Disabled",
> >>> +       "Solid",
> >>> +       "Colorbar",
> >>> +       "Gradbar",
> >>> +       "Hgrey",
> >>> +       "Vgrey",
> >>> +       "Dgrey",
> >>> +       "PN28",
> >>> +};
> >>> +
> >>> +static const char * const vgxy61_hdr_modes[] =3D {
> >>> +       "HDR linearize",
> >>> +       "HDR substraction",
> >>> +       "no HDR",
> >>> +};
> >>> +
> >>> +/* Regulator supplies */
> >>> +static const char * const vgxy61_supply_name[] =3D {
> >>> +       "VCORE",
> >>> +       "VDDIO",
> >>> +       "VANA",
> >>> +};
> >>> +
> >>> +static const s64 link_freq[] =3D {
> >>> +       /*
> >>> +        * MIPI output freq is 804Mhz / 2, as it uses both rising edg=
e and falling edges to send
> >>> +        * data
> >>> +        */
> >>> +       402000000ULL
> >>> +};
> >>> +
> >>> +#define VGXY61_NUM_SUPPLIES            ARRAY_SIZE(vgxy61_supply_name=
)
> >>> +
> >>> +/* Macro to convert index to 8.8 fixed point gain */
> >>> +#define I2FP(i)                                ((u32)(8192.0 / (32 -=
 (i))))
> >>> +/* Array of possibles analog gains in 8.8 fixed point */
> >>> +static const u16 analog_gains[] =3D {
> >>> +       I2FP(0), I2FP(1), I2FP(2), I2FP(3), I2FP(4), I2FP(5), I2FP(6)=
, I2FP(7), I2FP(8), I2FP(9),
> >>> +       I2FP(10), I2FP(11), I2FP(12), I2FP(13), I2FP(14), I2FP(15), I=
2FP(16),
> >>> +};
> >>> +
> >>> +enum bin_mode {
> >>> +       BIN_MODE_NORMAL,
> >>> +       BIN_MODE_DIGITAL_X2,
> >>> +       BIN_MODE_DIGITAL_X4,
> >>> +       BIN_MODE_ANALOG_SUB_X2,
> >>> +       BIN_MODE_ANALOG_SUB_X4,
> >>> +};
> >>> +
> >>> +enum hdr {
> >>> +       HDR_LINEAR,
> >>> +       HDR_SUB,
> >>> +       NO_HDR,
> >>> +};
> >>> +
> >>> +enum strobe_modes {
> >>> +       STROBE_DISABLED,
> >>> +       STROBE_LONG,
> >>> +       STROBE_ENABLED,
> >>> +};
> >>> +
> >>> +struct vgxy61_mode_info {
> >>> +       u32 width;
> >>> +       u32 height;
> >>> +       enum bin_mode bin_mode;
> >>> +};
> >>> +
> >>> +static const u32 vgxy61_supported_codes[] =3D {
> >>> +       MEDIA_BUS_FMT_SGBRG8_1X8,
> >>> +       MEDIA_BUS_FMT_SGBRG10_1X10,
> >>> +       MEDIA_BUS_FMT_SGBRG12_1X12,
> >>> +       MEDIA_BUS_FMT_SGBRG14_1X14,
> >>> +       MEDIA_BUS_FMT_SGBRG16_1X16
> >>> +};
> >>> +
> >>> +const int vgx761_sensor_frame_rates[] =3D {75, 60, 30, 15, 10, 5, 2}=
;
> >>> +const int vgx661_sensor_frame_rates[] =3D {60, 30, 15, 10, 5, 2};
> >>> +
> >>> +static const struct vgxy61_mode_info vgx661_mode_data[] =3D {
> >>> +       {1464, 1104, BIN_MODE_NORMAL},
> >>> +       {1280,  720, BIN_MODE_NORMAL},
> >>> +       { 640,  480, BIN_MODE_DIGITAL_X2},
> >>> +       { 320,  240, BIN_MODE_DIGITAL_X4},
> >>> +};
> >>> +
> >>> +static const struct vgxy61_mode_info vgx761_mode_data[] =3D {
> >>> +       {1944, 1204, BIN_MODE_NORMAL},
> >>> +       {1920, 1080, BIN_MODE_NORMAL},
> >>> +       {1280,  720, BIN_MODE_NORMAL},
> >>> +       { 640,  480, BIN_MODE_DIGITAL_X2},
> >>> +       { 320,  240, BIN_MODE_DIGITAL_X4},
> >>> +};
> >>> +
> >>> +struct gpios_ctrls {
> >>> +       struct v4l2_ctrl *long_start;
> >>> +       struct v4l2_ctrl *long_end;
> >>> +       struct v4l2_ctrl *short_start;
> >>> +       struct v4l2_ctrl *short_end;
> >>> +};
> >>> +
> >>> +struct vgxy61_ctrls {
> >>> +       struct v4l2_ctrl_handler handler;
> >>> +       struct v4l2_ctrl *exposure;
> >>> +       struct v4l2_ctrl *analog_gain;
> >>> +       struct v4l2_ctrl *digital_gain;
> >>> +       struct gpios_ctrls gpios;
> >>> +       struct v4l2_ctrl *vflip;
> >>> +       struct v4l2_ctrl *hflip;
> >>> +       struct v4l2_ctrl *patgen;
> >>> +       struct v4l2_ctrl *hdr;
> >>> +       struct v4l2_ctrl *pixel_rate;
> >>> +       struct v4l2_ctrl *link_freq;
> >
> > No need to store analog_gain, digital_gain, vflip, hflip, patgen, hdr,
> > or link_freq as they are never programmatically altered. The s_ctrl
> > handler is given the struct v4l2_ctrl, and where you need it again
> > you've copied the value into the main struct vgxy61_dev.
> >
>
> Definetly. I just need to keep the pixel_rate ctrl to change its value in=
 the set_fmt function.
> I will remove all the others, and put the pixel_rate control directly in =
the vgxy61 structure.
>
> >>> +       struct v4l2_ctrl *temp;
> >>> +};
> >>> +
> >>> +struct vgxy61_dev {
> >>> +       struct i2c_client *i2c_client;
> >>> +       struct v4l2_subdev sd;
> >>> +       struct media_pad pad;
> >>> +       struct regulator_bulk_data supplies[VGXY61_NUM_SUPPLIES];
> >>> +       struct gpio_desc *reset_gpio;
> >>> +       struct clk *xclk;
> >>> +       u32 clk_freq;
> >>> +       int sensor_width;
> >>> +       int sensor_height;
> >>> +       u16 oif_ctrl;
> >>> +       int nb_of_lane;
> >>> +       int data_rate_in_mbps;
> >>> +       int pclk;
> >>> +       u16 line_length;
> >>> +       int rot_term;
> >>> +       bool gpios_polarity;
> >>> +       bool slave_mode;
> >>> +       /* Lock to protect all members below */
> >>> +       struct mutex lock;
> >>> +       struct vgxy61_ctrls ctrls;
> >>> +       bool streaming;
> >>> +       struct v4l2_mbus_framefmt fmt;
> >>> +       const struct vgxy61_mode_info *sensor_modes;
> >>> +       int sensor_modes_nb;
> >>> +       const struct vgxy61_mode_info *current_mode;
> >>> +       const int *sensor_rates;
> >>> +       int sensor_rates_nb;
> >>> +       struct v4l2_fract frame_interval;
> >>> +       bool hflip;
> >>> +       bool vflip;
> >>> +       enum hdr hdr;
> >>> +       int expo_long;
> >>> +       int expo_short;
> >>> +};
> >>> +
> >>> +static u8 get_bpp_by_code(__u32 code)
> >>> +{
> >>> +       switch (code) {
> >>> +       case MEDIA_BUS_FMT_SGBRG8_1X8:
> >>> +               return 8;
> >>> +       case MEDIA_BUS_FMT_SGBRG10_1X10:
> >>> +               return 10;
> >>> +       case MEDIA_BUS_FMT_SGBRG12_1X12:
> >>> +               return 12;
> >>> +       case MEDIA_BUS_FMT_SGBRG14_1X14:
> >>> +               return 14;
> >>> +       case MEDIA_BUS_FMT_SGBRG16_1X16:
> >>> +               return 16;
> >>> +       default:
> >>> +               /* Should never happen */
> >>> +               WARN(1, "Unsupported code %d. default to 8 bpp", code=
);
> >>> +               return 8;
> >>> +       }
> >>> +}
> >>> +
> >>> +static u8 get_data_type_by_code(__u32 code)
> >>> +{
> >>> +       switch (code) {
> >>> +       case MEDIA_BUS_FMT_SGBRG8_1X8:
> >>> +               return MIPI_CSI2_DT_RAW8;
> >>> +       case MEDIA_BUS_FMT_SGBRG10_1X10:
> >>> +               return MIPI_CSI2_DT_RAW10;
> >>> +       case MEDIA_BUS_FMT_SGBRG12_1X12:
> >>> +               return MIPI_CSI2_DT_RAW12;
> >>> +       case MEDIA_BUS_FMT_SGBRG14_1X14:
> >>> +               return MIPI_CSI2_DT_RAW14;
> >>> +       case MEDIA_BUS_FMT_SGBRG16_1X16:
> >>> +               return MIPI_CSI2_DT_RAW16;
> >>> +       default:
> >>> +               /* Should never happen */
> >>> +               WARN(1, "Unsupported code %d. default to MIPI_CSI2_DT=
_RAW8 data type", code);
> >>> +               return MIPI_CSI2_DT_RAW8;
> >>> +       }
> >>> +}
> >>> +
> >>> +static void compute_pll_parameters_by_freq(u32 freq, unsigned int *p=
rediv, unsigned int *mult)
> >>> +{
> >>> +       const unsigned int predivs[] =3D {1, 2, 4};
> >>> +       int i;
> >>> +
> >>> +       /*
> >>> +        * Freq range is [6Mhz-27Mhz] already checked.
> >>> +        * Output of divider should be in [6Mhz-12Mhz[.
> >>> +        */
> >>> +       for (i =3D 0; i < ARRAY_SIZE(predivs); i++) {
> >>> +               *prediv =3D predivs[i];
> >>> +               if (freq / *prediv < 12 * HZ_PER_MHZ)
> >>> +                       break;
> >>> +       }
> >>> +       WARN_ON(i =3D=3D ARRAY_SIZE(predivs));
> >>> +
> >>> +       /*
> >>> +        * Target freq is 804Mhz. Don't change this as it will impact=
 image quality.
> >>> +        */
> >>> +       *mult =3D ((804 * HZ_PER_MHZ) * (*prediv) + freq / 2) / freq;
> >>> +}
> >>> +
> >>> +static s32 get_pixel_rate(struct vgxy61_dev *sensor)
> >>> +{
> >>> +       return div64_u64((u64)sensor->data_rate_in_mbps * sensor->nb_=
of_lane,
> >>> +                        get_bpp_by_code(sensor->fmt.code));
> >>> +}
> >>> +
> >>> +static inline struct vgxy61_dev *to_vgxy61_dev(struct v4l2_subdev *s=
d)
> >>> +{
> >>> +       return container_of(sd, struct vgxy61_dev, sd);
> >>> +}
> >>> +
> >>> +static inline struct v4l2_subdev *ctrl_to_sd(struct v4l2_ctrl *ctrl)
> >>> +{
> >>> +       return &container_of(ctrl->handler, struct vgxy61_dev, ctrls.=
handler)->sd;
> >>> +}
> >>> +
> >>> +static int get_chunk_size(struct vgxy61_dev *sensor)
> >>> +{
> >>> +       struct i2c_adapter *adapter =3D sensor->i2c_client->adapter;
> >>> +       int max_write_len =3D WRITE_MULTIPLE_CHUNK_MAX;
> >>> +
> >>> +       if (adapter->quirks && adapter->quirks->max_write_len)
> >>> +               max_write_len =3D adapter->quirks->max_write_len - 2;
> >>> +
> >>> +       max_write_len =3D min(max_write_len, WRITE_MULTIPLE_CHUNK_MAX=
);
> >>> +
> >>> +       return max(max_write_len, 1);
> >>> +}
> >>> +
> >>> +static int vgxy61_read_multiple(struct vgxy61_dev *sensor, u16 reg, =
u8 *val, int len)
> >>> +{
> >>> +       struct i2c_client *client =3D sensor->i2c_client;
> >>> +       struct i2c_msg msg[2];
> >>> +       u8 buf[2];
> >>> +       int ret;
> >>> +
> >>> +       buf[0] =3D reg >> 8;
> >>> +       buf[1] =3D reg & 0xff;
> >>> +
> >>> +       msg[0].addr =3D client->addr;
> >>> +       msg[0].flags =3D client->flags;
> >>> +       msg[0].buf =3D buf;
> >>> +       msg[0].len =3D sizeof(buf);
> >>> +
> >>> +       msg[1].addr =3D client->addr;
> >>> +       msg[1].flags =3D client->flags | I2C_M_RD;
> >>> +       msg[1].buf =3D val;
> >>> +       msg[1].len =3D len;
> >>> +
> >>> +       ret =3D i2c_transfer(client->adapter, msg, 2);
> >>> +       if (ret < 0) {
> >>> +               dev_dbg(&client->dev, "%s: %x i2c_transfer, reg: %x =
=3D> %d\n", __func__,
> >>> +                       client->addr, reg, ret);
> >>> +               return ret;
> >>> +       }
> >>> +
> >>> +       return 0;
> >>> +}
> >>> +
> >>> +static inline int vgxy61_read_reg(struct vgxy61_dev *sensor, u16 reg=
, u8 *val)
> >>> +{
> >>> +       return vgxy61_read_multiple(sensor, reg, val, sizeof(*val));
> >>> +}
> >>> +
> >>> +static inline int vgxy61_read_reg16(struct vgxy61_dev *sensor, u16 r=
eg, u16 *val)
> >>> +{
> >>> +       return vgxy61_read_multiple(sensor, reg, (u8 *)val, sizeof(*v=
al));
> >>> +}
> >>> +
> >>> +static int vgxy61_write_multiple(struct vgxy61_dev *sensor, u16 reg,=
 const u8 *data, int len)
> >>> +{
> >>> +       struct i2c_client *client =3D sensor->i2c_client;
> >>> +       struct i2c_msg msg;
> >>> +       u8 buf[WRITE_MULTIPLE_CHUNK_MAX + 2];
> >>> +       int i;
> >>> +       int ret;
> >>> +
> >>> +       if (len > WRITE_MULTIPLE_CHUNK_MAX)
> >>> +               return -EINVAL;
> >>> +       buf[0] =3D reg >> 8;
> >>> +       buf[1] =3D reg & 0xff;
> >>> +       for (i =3D 0; i < len; i++)
> >>> +               buf[i + 2] =3D data[i];
> >>> +
> >>> +       msg.addr =3D client->addr;
> >>> +       msg.flags =3D client->flags;
> >>> +       msg.buf =3D buf;
> >>> +       msg.len =3D len + 2;
> >>> +
> >>> +       ret =3D i2c_transfer(client->adapter, &msg, 1);
> >>> +       if (ret < 0) {
> >>> +               dev_dbg(&client->dev, "%s: i2c_transfer, reg: %x =3D>=
 %d\n", __func__, reg, ret);
> >>> +               return ret;
> >>> +       }
> >>> +
> >>> +       return 0;
> >>> +}
> >>> +
> >>> +static int vgxy61_write_array(struct vgxy61_dev *sensor, u16 reg, in=
t nb, const u8 *array)
> >>> +{
> >>> +       const int chunk_size =3D get_chunk_size(sensor);
> >>> +       int ret;
> >>> +       int sz;
> >>> +
> >>> +       while (nb) {
> >>> +               sz =3D min(nb, chunk_size);
> >>> +               ret =3D vgxy61_write_multiple(sensor, reg, array, sz)=
;
> >>> +               if (ret < 0)
> >>> +                       return ret;
> >>> +               nb -=3D sz;
> >>> +               reg +=3D sz;
> >>> +               array +=3D sz;
> >>> +       }
> >>> +
> >>> +       return 0;
> >>> +}
> >>> +
> >>> +static inline int vgxy61_write_reg(struct vgxy61_dev *sensor, u16 re=
g, u8 val)
> >>> +{
> >>> +       return vgxy61_write_multiple(sensor, reg, &val, sizeof(val));
> >>> +}
> >>> +
> >>> +static inline int vgxy61_write_reg16(struct vgxy61_dev *sensor, u16 =
reg, u16 val)
> >>> +{
> >>> +       return vgxy61_write_multiple(sensor, reg, (u8 *)&val, sizeof(=
val));
> >>> +}
> >>> +
> >>> +static inline int vgxy61_write_reg32(struct vgxy61_dev *sensor, u16 =
reg, u32 val)
> >>> +{
> >>> +       return vgxy61_write_multiple(sensor, reg, (u8 *)&val, sizeof(=
val));
> >>> +}
> >>> +
> >>> +static int vgxy61_poll_reg(struct vgxy61_dev *sensor, u16 reg, u8 po=
ll_val)
> >>> +{
> >>> +       const int loop_delay_ms =3D 10;
> >>> +       const int timeout_ms =3D 500;
> >>> +       u8 val;
> >>> +       int ret, timeout;
> >>> +
> >>> +       timeout =3D read_poll_timeout(vgxy61_read_reg, ret, ((ret !=
=3D 0) || (val =3D=3D poll_val)),
> >>> +                                   loop_delay_ms * US_PER_MS, timeou=
t_ms * US_PER_MS, false,
> >>> +                                   sensor, reg, &val);
> >>> +       if (timeout)
> >>> +               return timeout;
> >>> +
> >>> +       return ret;
> >>> +}
> >>> +
> >>> +static int vgxy61_wait_state(struct vgxy61_dev *sensor, int state)
> >>> +{
> >>> +       return vgxy61_poll_reg(sensor, DEVICE_SYSTEM_FSM, state);
> >>> +}
> >>> +
> >>> +static int vgxy61_check_bw(struct vgxy61_dev *sensor)
> >>> +{
> >>> +       struct i2c_client *client =3D sensor->i2c_client;
> >>> +       /* Correction factor for time required between 2 lines */
> >>> +       const int mipi_margin =3D 1056;
> >>> +       int binning_scale =3D 1 << sensor->current_mode->bin_mode;
> >>> +       int bpp =3D get_bpp_by_code(sensor->fmt.code);
> >>> +       int max_bit_per_line;
> >>> +       int bit_per_line;
> >>> +       u64 line_rate;
> >>> +
> >>> +       line_rate =3D sensor->nb_of_lane * (u64)sensor->data_rate_in_=
mbps * sensor->line_length;
> >>> +       max_bit_per_line =3D div64_u64(line_rate, sensor->pclk) - mip=
i_margin;
> >>> +       bit_per_line =3D (bpp * sensor->current_mode->width) / binnin=
g_scale;
> >>> +
> >>> +       dev_dbg(&client->dev, "max_bit_per_line =3D %d\n", max_bit_pe=
r_line);
> >>> +       dev_dbg(&client->dev, "required bit_per_line =3D %d\n", bit_p=
er_line);
> >>> +
> >>> +       return bit_per_line > max_bit_per_line ? -EINVAL : 0;
> >>> +}
> >>> +
> >>> +static int apply_exposure(struct vgxy61_dev *sensor)
> >>> +{
> >>> +       struct i2c_client *client =3D sensor->i2c_client;
> >>> +       int ret;
> >>> +
> >>> +        /* We first set expo to zero to avoid forbidden parameters c=
ouple */
> >>> +       ret =3D vgxy61_write_reg16(sensor, DEVICE_COARSE_EXPOSURE_SHO=
RT, 0);
> >>> +       if (ret)
> >>> +               return ret;
> >>> +       ret =3D vgxy61_write_reg16(sensor, DEVICE_COARSE_EXPOSURE_LON=
G, sensor->expo_long);
> >>> +       if (ret)
> >>> +               return ret;
> >>> +       ret =3D vgxy61_write_reg16(sensor, DEVICE_COARSE_EXPOSURE_SHO=
RT, sensor->expo_short);
> >>> +       if (ret)
> >>> +               return ret;
> >>> +
> >>> +       dev_dbg(&client->dev, "%s applied expo %d (short: %d)\n", __f=
unc__,
> >>> +               sensor->expo_long, sensor->expo_short);
> >>> +
> >>> +       return 0;
> >>> +}
> >>> +
> >>> +static int set_frame_rate(struct vgxy61_dev *sensor)
> >>> +{
> >>> +       u16 frame_length;
> >>> +
> >>> +       frame_length =3D sensor->pclk / (sensor->line_length * sensor=
->frame_interval.denominator);
> >>> +
> >>> +       return vgxy61_write_reg16(sensor, DEVICE_FRAME_LENGTH, frame_=
length);
> >>> +}
> >>> +
> >>> +static int vgxy61_get_regulators(struct vgxy61_dev *sensor)
> >>> +{
> >>> +       int i;
> >>> +
> >>> +       for (i =3D 0; i < VGXY61_NUM_SUPPLIES; i++)
> >>> +               sensor->supplies[i].supply =3D vgxy61_supply_name[i];
> >>> +
> >>> +       return devm_regulator_bulk_get(&sensor->i2c_client->dev, VGXY=
61_NUM_SUPPLIES,
> >>> +                                      sensor->supplies);
> >>> +}
> >>> +
> >>> +static int vgxy61_apply_reset(struct vgxy61_dev *sensor)
> >>> +{
> >>> +       struct i2c_client *client =3D sensor->i2c_client;
> >>> +
> >>> +       dev_dbg(&client->dev, "%s applied reset\n", __func__);
> >>> +       gpiod_set_value_cansleep(sensor->reset_gpio, 0);
> >>> +       usleep_range(5000, 10000);
> >>> +       gpiod_set_value_cansleep(sensor->reset_gpio, 1);
> >>> +       usleep_range(5000, 10000);
> >>> +       gpiod_set_value_cansleep(sensor->reset_gpio, 0);
> >>> +       usleep_range(40000, 100000);
> >>> +       return vgxy61_wait_state(sensor, SW_STBY);
> >>> +}
> >>> +
> >>> +static int vgxy61_try_fmt_internal(struct v4l2_subdev *sd, struct v4=
l2_mbus_framefmt *fmt,
> >>> +                                  const struct vgxy61_mode_info **ne=
w_mode)
> >>> +{
> >>> +       struct vgxy61_dev *sensor =3D to_vgxy61_dev(sd);
> >>> +       const struct vgxy61_mode_info *mode =3D sensor->sensor_modes;
> >>> +       unsigned int index;
> >>> +
> >>> +       /* Select code */
> >>> +       for (index =3D 0; index < ARRAY_SIZE(vgxy61_supported_codes);=
 index++) {
> >>> +               if (vgxy61_supported_codes[index] =3D=3D fmt->code)
> >>> +                       break;
> >>> +       }
> >>> +       if (index =3D=3D ARRAY_SIZE(vgxy61_supported_codes))
> >>> +               index =3D 0;
> >>> +
> >>> +       /* Select size */
> >>> +       do {
> >>> +               if (mode->width <=3D fmt->width && mode->height <=3D =
fmt->height)
> >>> +                       break;
> >>> +       } while ((++mode)->width);
> >>> +       if (!mode->width)
> >>> +               mode--;
> >
> > Use v4l2_find_nearest_size?
> >
>
> Sure.
>
> >>> +
> >>> +       *new_mode =3D mode;
> >>> +       fmt->code =3D vgxy61_supported_codes[index];
> >>> +       fmt->width =3D mode->width;
> >>> +       fmt->height =3D mode->height;
> >>> +       fmt->colorspace =3D V4L2_COLORSPACE_SRGB;
> >
> > Is it? Most Bayer sensors are V4L2_COLORSPACE_RAW.
> > What about ycbcr_enc, quantization, and xfer_func?
> >
>
> Yes it should be RAW, but iirc I had some issue with the RAW colorspace. =
I will test it again in order to change it.
> I will add missing fields too.
>
>
> >>> +       fmt->field =3D V4L2_FIELD_NONE;
> >>> +
> >>> +       return 0;
> >>> +}
> >>> +
> >>> +static int vgxy61_stream_enable(struct vgxy61_dev *sensor)
> >>> +{
> >>> +       int center_x =3D sensor->sensor_width / 2;
> >>> +       int center_y =3D sensor->sensor_height / 2;
> >>> +       int scale =3D 1 << sensor->current_mode->bin_mode;
> >>> +       int width =3D sensor->current_mode->width * scale;
> >>> +       int height =3D sensor->current_mode->height * scale;
> >>> +       int ret;
> >>> +
> >>> +       ret =3D vgxy61_check_bw(sensor);
> >>> +       if (ret)
> >>> +               return ret;
> >>> +
> >>> +       /* Configure sensor */
> >>> +       ret =3D vgxy61_write_reg(sensor, DEVICE_FORMAT_CTRL, get_bpp_=
by_code(sensor->fmt.code));
> >>> +       if (ret)
> >>> +               return ret;
> >>> +       ret =3D vgxy61_write_reg(sensor, DEVICE_OIF_ROI0_CTRL,
> >>> +                              get_data_type_by_code(sensor->fmt.code=
));
> >>> +       if (ret)
> >>> +               return ret;
> >>> +
> >>> +       ret =3D vgxy61_write_reg(sensor, DEVICE_READOUT_CTRL, sensor-=
>current_mode->bin_mode);
> >>> +       if (ret)
> >>> +               return ret;
> >>> +       ret =3D vgxy61_write_reg16(sensor, DEVICE_ROI0_START_H, cente=
r_x - width / 2);
> >>> +       if (ret)
> >>> +               return ret;
> >>> +       ret =3D vgxy61_write_reg16(sensor, DEVICE_ROI0_END_H, center_=
x + width / 2 - 1);
> >>> +       if (ret)
> >>> +               return ret;
> >>> +       ret =3D vgxy61_write_reg16(sensor, DEVICE_ROI0_START_V, cente=
r_y - height / 2);
> >>> +       if (ret)
> >>> +               return ret;
> >>> +       ret =3D vgxy61_write_reg16(sensor, DEVICE_ROI0_END_V, center_=
y + height / 2 - 1);
> >>> +       if (ret)
> >>> +               return ret;
> >
> > Use the selection API to allow the crop region to be configured?
> > Avoids only supporting centre cropping.
> >
>
> Yes, as we already mentionned in the other thread this is required by lib=
camera anyway. Two birds one stone.

There are a couple of bits to the selection API.

libcamera's mainly after it for read-only information on the crop
applied by each mode, and the total sensor size. This allows things
like lens shading tables to be appropriately cropped to match the
sensor mode.

There is also a s_selection call, so that could allow totally
free-form cropping of anywhere from the sensor. This isn't a
requirement. I was only observing that you were computing the start
and end values, therefore it seemed like a potential extension.
Many other sensor drivers have a small table of the registers that are
different for each mode rather than computing the registers.

> >>> +
> >>> +       ret =3D set_frame_rate(sensor);
> >>> +       if (ret)
> >>> +               return ret;
> >>> +
> >>> +       ret =3D apply_exposure(sensor);
> >>> +       if (ret)
> >>> +               return ret;
> >>> +
> >>> +       /* Start streaming */
> >>> +       ret =3D vgxy61_write_reg(sensor, DEVICE_STREAMING, REQ_START_=
STREAMING);
> >>> +       if (ret)
> >>> +               return ret;
> >>> +
> >>> +       ret =3D vgxy61_poll_reg(sensor, DEVICE_STREAMING, REQ_NO_REQU=
EST);
> >>> +       if (ret)
> >>> +               return ret;
> >>> +
> >>> +       ret =3D vgxy61_wait_state(sensor, STREAMING);
> >>> +       if (ret)
> >>> +               return ret;
> >>> +
> >>> +       return 0;
> >>> +}
> >>> +
> >>> +static int vgxy61_stream_disable(struct vgxy61_dev *sensor)
> >>> +{
> >>> +       int ret;
> >>> +
> >>> +       ret =3D vgxy61_write_reg(sensor, DEVICE_STREAMING, REQ_STOP_S=
TREAMING);
> >>> +       if (ret)
> >>> +               return ret;
> >>> +
> >>> +       ret =3D vgxy61_poll_reg(sensor, DEVICE_STREAMING, REQ_NO_REQU=
EST);
> >>> +       if (ret)
> >>> +               return ret;
> >>> +
> >>> +       ret =3D vgxy61_wait_state(sensor, SW_STBY);
> >>> +       if (ret)
> >>> +               return ret;
> >>> +
> >>> +       return 0;
> >>> +}
> >>> +
> >>> +static int vgxy61_s_stream(struct v4l2_subdev *sd, int enable)
> >>> +{
> >>> +       struct vgxy61_dev *sensor =3D to_vgxy61_dev(sd);
> >>> +       struct i2c_client *client =3D sensor->i2c_client;
> >>> +       int ret =3D 0;
> >>> +
> >>> +       mutex_lock(&sensor->lock);
> >>> +       dev_dbg(&client->dev, "%s : requested %d / current =3D %d\n",=
 __func__, enable,
> >>> +               sensor->streaming);
> >>> +       if (sensor->streaming =3D=3D enable)
> >>> +               goto out;
> >>> +
> >>> +       ret =3D enable ? vgxy61_stream_enable(sensor) : vgxy61_stream=
_disable(sensor);
> >>> +       if (!ret)
> >>> +               sensor->streaming =3D enable;
> >>> +
> >>> +out:
> >>> +       dev_dbg(&client->dev, "%s current now =3D %d / %d\n", __func_=
_, sensor->streaming, ret);
> >>> +       mutex_unlock(&sensor->lock);
> >>> +
> >>> +       return ret;
> >>> +}
> >>> +
> >>> +static int vgxy61_g_frame_interval(struct v4l2_subdev *sd, struct v4=
l2_subdev_frame_interval *fi)
> >>> +{
> >>> +       struct vgxy61_dev *sensor =3D to_vgxy61_dev(sd);
> >>> +
> >>> +       mutex_lock(&sensor->lock);
> >>> +       fi->interval =3D sensor->frame_interval;
> >>> +       mutex_unlock(&sensor->lock);
> >>> +
> >>> +       return 0;
> >>> +}
> >>> +
> >>> +static int vgxy61_s_frame_interval(struct v4l2_subdev *sd, struct v4=
l2_subdev_frame_interval *fi)
> >>> +{
> >>> +       struct vgxy61_dev *sensor =3D to_vgxy61_dev(sd);
> >>> +       struct i2c_client *client =3D sensor->i2c_client;
> >>> +       u64 req_int, err, min_err =3D ~0ULL;
> >>> +       u64 test_int;
> >>> +       int i =3D 0;
> >>> +       int ret;
> >>> +
> >>> +       if (fi->interval.denominator =3D=3D 0)
> >>> +               return -EINVAL;
> >>> +
> >>> +       mutex_lock(&sensor->lock);
> >>> +
> >>> +       if (sensor->streaming) {
> >>> +               ret =3D -EBUSY;
> >>> +               goto out;
> >>> +       }
> >>> +
> >>> +       dev_dbg(&client->dev, "%s request %d/%d\n", __func__,
> >>> +               fi->interval.numerator, fi->interval.denominator);
> >>> +       /* Find nearest period */
> >>> +       req_int =3D div64_u64((u64)(fi->interval.numerator * 10000), =
fi->interval.denominator);
> >>> +       for (i =3D 0; i < sensor->sensor_rates_nb; i++) {
> >>> +               test_int =3D div64_u64((u64)10000, sensor->sensor_rat=
es[i]);
> >>> +               err =3D abs(test_int - req_int);
> >>> +               if (err < min_err) {
> >>> +                       fi->interval.numerator =3D 1;
> >>> +                       fi->interval.denominator =3D sensor->sensor_r=
ates[i];
> >>> +                       min_err =3D err;
> >>> +               }
> >>> +       }
> >>> +       sensor->frame_interval =3D fi->interval;
> >>> +       dev_dbg(&client->dev, "%s set     %d/%d\n", __func__,
> >>> +               fi->interval.numerator, fi->interval.denominator);
> >>> +
> >>> +       ret =3D 0;
> >>> +out:
> >>> +       mutex_unlock(&sensor->lock);
> >>> +
> >>> +       return ret;
> >>> +}
> >>> +
> >>> +static int vgxy61_enum_mbus_code(struct v4l2_subdev *sd,
> >>> +                                struct v4l2_subdev_state *sd_state,
> >>> +                                struct v4l2_subdev_mbus_code_enum *c=
ode)
> >>> +{
> >>> +       struct vgxy61_dev *sensor =3D to_vgxy61_dev(sd);
> >>> +       struct i2c_client *client =3D sensor->i2c_client;
> >>> +
> >>> +       dev_dbg(&client->dev, "%s probe index %d\n", __func__, code->=
index);
> >>> +       if (code->index >=3D ARRAY_SIZE(vgxy61_supported_codes))
> >>> +               return -EINVAL;
> >>> +
> >>> +       code->code =3D vgxy61_supported_codes[code->index];
> >>> +
> >>> +       return 0;
> >>> +}
> >>> +
> >>> +static int vgxy61_get_fmt(struct v4l2_subdev *sd,
> >>> +                         struct v4l2_subdev_state *sd_state,
> >>> +                         struct v4l2_subdev_format *format)
> >>> +{
> >>> +       struct vgxy61_dev *sensor =3D to_vgxy61_dev(sd);
> >>> +       struct i2c_client *client =3D sensor->i2c_client;
> >>> +       struct v4l2_mbus_framefmt *fmt;
> >>> +
> >>> +       dev_dbg(&client->dev, "%s probe %d\n", __func__, format->pad)=
;
> >>> +       dev_dbg(&client->dev, "%s %dx%d\n", __func__, format->format.=
width, format->format.height);
> >>> +
> >>> +       mutex_lock(&sensor->lock);
> >>> +
> >>> +       if (format->which =3D=3D V4L2_SUBDEV_FORMAT_TRY)
> >>> +               fmt =3D v4l2_subdev_get_try_format(&sensor->sd, sd_st=
ate, format->pad);
> >>> +       else
> >>> +               fmt =3D &sensor->fmt;
> >>> +
> >>> +       format->format =3D *fmt;
> >>> +
> >>> +       mutex_unlock(&sensor->lock);
> >>> +
> >>> +       return 0;
> >>> +}
> >>> +
> >>> +static int vgxy61_set_fmt(struct v4l2_subdev *sd,
> >>> +                         struct v4l2_subdev_state *sd_state,
> >>> +                         struct v4l2_subdev_format *format)
> >>> +{
> >>> +       struct vgxy61_dev *sensor =3D to_vgxy61_dev(sd);
> >>> +       struct i2c_client *client =3D sensor->i2c_client;
> >>> +       const struct vgxy61_mode_info *new_mode;
> >>> +       struct v4l2_mbus_framefmt *fmt;
> >>> +       int ret;
> >>> +
> >>> +       dev_dbg(&client->dev, "%s probe %d\n", __func__, format->pad)=
;
> >>> +       dev_dbg(&client->dev, "%s %dx%d\n", __func__, format->format.=
width, format->format.height);
> >>> +
> >>> +       mutex_lock(&sensor->lock);
> >>> +
> >>> +       if (sensor->streaming) {
> >>> +               ret =3D -EBUSY;
> >>> +               goto out;
> >>> +       }
> >>> +
> >>> +       /* Find best format */
> >>> +       ret =3D vgxy61_try_fmt_internal(sd, &format->format, &new_mod=
e);
> >>> +       if (ret)
> >>> +               goto out;
> >>> +
> >>> +       if (format->which =3D=3D V4L2_SUBDEV_FORMAT_TRY)
> >>> +               fmt =3D v4l2_subdev_get_try_format(sd, sd_state, 0);
> >>> +       else
> >>> +               fmt =3D &sensor->fmt;
> >>> +       *fmt =3D format->format;
> >>> +       sensor->current_mode =3D new_mode;
> >>> +       /* Update pixel rate control to reflect new mode */
> >>> +       __v4l2_ctrl_s_ctrl_int64(sensor->ctrls.pixel_rate, get_pixel_=
rate(sensor));
> >>> +
> >>> +out:
> >>> +       mutex_unlock(&sensor->lock);
> >>> +
> >>> +       return ret;
> >>> +}
> >>> +
> >>> +static int vgxy61_enum_frame_size(struct v4l2_subdev *sd, struct v4l=
2_subdev_state *sd_state,
> >>> +                                 struct v4l2_subdev_frame_size_enum =
*fse)
> >>> +{
> >>> +       struct vgxy61_dev *sensor =3D to_vgxy61_dev(sd);
> >>> +       struct i2c_client *client =3D sensor->i2c_client;
> >>> +
> >>> +       dev_dbg(&client->dev, "%s for index %d\n", __func__, fse->ind=
ex);
> >>> +       if (fse->index >=3D sensor->sensor_modes_nb)
> >>> +               return -EINVAL;
> >>> +
> >>> +       fse->min_width =3D sensor->sensor_modes[fse->index].width;
> >>> +       fse->max_width =3D fse->min_width;
> >>> +       fse->min_height =3D sensor->sensor_modes[fse->index].height;
> >>> +       fse->max_height =3D fse->min_height;
> >>> +
> >>> +       return 0;
> >>> +}
> >>> +
> >>> +static int vgxy61_enum_frame_interval(struct v4l2_subdev *sd, struct=
 v4l2_subdev_state *sd_state,
> >>> +                                     struct v4l2_subdev_frame_interv=
al_enum *fie)
> >>> +{
> >>> +       struct vgxy61_dev *sensor =3D to_vgxy61_dev(sd);
> >>> +       const struct vgxy61_mode_info *mode =3D sensor->sensor_modes;
> >>> +
> >>> +       if (fie->index >=3D sensor->sensor_rates_nb)
> >>> +               return -EINVAL;
> >>> +       do {
> >>> +               if (mode->width =3D=3D fie->width && mode->height =3D=
=3D fie->height)
> >>> +                       break;
> >>> +       } while ((++mode)->width);
> >>> +       if (!mode->width)
> >>> +               return -EINVAL;
> >>> +
> >>> +       fie->interval.numerator =3D 1;
> >>> +       fie->interval.denominator =3D sensor->sensor_rates[fie->index=
];
> >>> +
> >>> +       return 0;
> >>> +}
> >>> +
> >>> +static int vgxy61_update_analog_gain(struct vgxy61_dev *sensor, u32 =
target)
> >>> +{
> >>> +       struct i2c_client *client =3D sensor->i2c_client;
> >>> +       unsigned int idx;
> >>> +       int ret;
> >>> +
> >>> +       /* Find smallest analog gains which is above or equal to targ=
et gain */
> >>> +       for (idx =3D 0; idx < ARRAY_SIZE(analog_gains); idx++) {
> >>> +               if (analog_gains[idx] >=3D target)
> >>> +                       break;
> >>> +       }
> >
> > Why? The units of V4L2_CID_ANALOGUE_GAIN are not specified, so more
> > typically it is a raw register write.
> >
> >
>
> The output analog gain is 32/(32-idx). This code maps a gain to its match=
ing register value.
> The goal is to allow setting the control using a "real world gain" value.=
 I could perform a raw register write ranging from 1 to 16. It would clean =
the code but would not be representative of the real gain.
> Maybe I am just overthinking it though.

Most other sensors make it a raw register value, and you get a
userspace conversion function, and they do vary between sensors.

In the Raspberry Pi libcamera IPA, you get the cam_helper functions to
provide the conversions to/from gain code
eg https://git.linuxtv.org/libcamera.git/tree/src/ipa/raspberrypi/cam_helpe=
r_imx219.cpp#n67
https://git.linuxtv.org/libcamera.git/tree/src/ipa/raspberrypi/cam_helper_o=
v5647.cpp#n45

> >>> +       /* Cap to maximum gain if no matching gain found */
> >>> +       if (idx =3D=3D ARRAY_SIZE(analog_gains))
> >>> +               idx--;
> >>> +
> >>> +       /* Apply gain */
> >>> +       ret =3D vgxy61_write_reg(sensor, DEVICE_ANALOG_GAIN, idx);
> >>> +       if (ret)
> >>> +               return ret;
> >>> +
> >>> +       dev_dbg(&client->dev, "Target analog gain: 0x%04x\n", target)=
;
> >>> +       dev_dbg(&client->dev, "   Set analog gain: 0x%04x\n", analog_=
gains[idx]);
> >>> +
> >>> +       return 0;
> >>> +}
> >>> +
> >>> +static int vgxy61_update_digital_gain(struct vgxy61_dev *sensor, u32=
 target)
> >>> +{
> >>> +       struct i2c_client *client =3D sensor->i2c_client;
> >>> +       int ret;
> >>> +
> >>> +       /*
> >>> +        * For a monochrome version, configuring DIGITAL_GAIN_LONG_CH=
0 and
> >>> +        * DIGITAL_GAIN_SHORT_CH0 is enough to configure the gain of =
all
> >>> +        * four sub pixels.
> >>> +        */
> >>> +       ret =3D vgxy61_write_reg16(sensor, DEVICE_DIGITAL_GAIN_LONG, =
target);
> >>> +       if (ret)
> >>> +               return ret;
> >>> +       ret =3D vgxy61_write_reg16(sensor, DEVICE_DIGITAL_GAIN_SHORT,=
 target);
> >>> +       if (ret)
> >>> +               return ret;
> >>> +
> >>> +       dev_dbg(&client->dev, "  Set digital gain: 0x%04x\n", target)=
;
> >>> +
> >>> +       return 0;
> >>> +}
> >>> +
> >>> +static int vgxy61_update_patgen(struct vgxy61_dev *sensor, u32 index=
)
> >>> +{
> >>> +       u32 pattern =3D index <=3D 3 ? index : index + 12;
> >>> +       u32 reg;
> >>> +
> >>> +       reg =3D (pattern << 18) | (pattern << 4);
> >>> +       if (index)
> >>> +               reg |=3D (1 << 16) | 1;
> >>> +       return vgxy61_write_reg32(sensor, DEVICE_PATGEN_CTRL, reg);
> >>> +}
> >>> +
> >>> +static int vgxy61_update_gpiox_strobe_mode(struct vgxy61_dev *sensor=
, enum strobe_modes mode,
> >>> +                                          int idx)
> >>> +{
> >>> +       const u8 index2val[] =3D {0x0, 0x1, 0x3};
> >>> +       u16 reg;
> >>> +       int ret;
> >>> +
> >>> +       ret =3D vgxy61_read_reg16(sensor, DEVICE_SIGNALS_CTRL, &reg);
> >>> +       if (ret)
> >>> +               return ret;
> >>> +       reg &=3D ~(0xf << (idx * 4));
> >>> +       reg |=3D index2val[mode] << (idx * 4);
> >>> +
> >>> +       return vgxy61_write_reg16(sensor, DEVICE_SIGNALS_CTRL, reg);
> >>> +}
> >>> +
> >>> +static int vgxy61_update_gpios_strobe_mode(struct vgxy61_dev *sensor=
, enum hdr hdr)
> >>> +{
> >>> +       enum strobe_modes strobe_mode;
> >>> +       int i, ret;
> >>> +
> >>> +       switch (hdr) {
> >>> +       case HDR_LINEAR:
> >>> +               strobe_mode =3D STROBE_ENABLED;
> >>> +               break;
> >>> +       case HDR_SUB:
> >>> +       case NO_HDR:
> >>> +               strobe_mode =3D STROBE_LONG;
> >>> +               break;
> >>> +       default:
> >>> +               /* Should never happen */
> >>> +               WARN_ON(true);
> >>> +               break;
> >>> +       }
> >>> +
> >>> +       for (i =3D 0; i < NB_GPIOS; i++) {
> >>> +               ret =3D vgxy61_update_gpiox_strobe_mode(sensor, strob=
e_mode, i);
> >>> +               if (ret)
> >>> +                       return ret;
> >>> +       }
> >>> +
> >>> +       return 0;
> >>> +}
> >>> +
> >>> +static int vgxy61_update_gpios_strobe_polarity(struct vgxy61_dev *se=
nsor, int polarity)
> >>> +{
> >>> +       struct i2c_client *client =3D sensor->i2c_client;
> >>> +       int ret;
> >>> +
> >>> +       if (sensor->streaming)
> >>> +               return -EBUSY;
> >>> +
> >>> +       dev_dbg(&client->dev, "setting gpios polarity: %d\n", polarit=
y);
> >>> +
> >>> +       ret =3D vgxy61_write_reg(sensor, DEVICE_GPIO_0_CTRL, polarity=
 << 1);
> >>> +       if (ret)
> >>> +               return ret;
> >>> +       ret =3D vgxy61_write_reg(sensor, DEVICE_GPIO_1_CTRL, polarity=
 << 1);
> >>> +       if (ret)
> >>> +               return ret;
> >>> +       ret =3D vgxy61_write_reg(sensor, DEVICE_GPIO_2_CTRL, polarity=
 << 1);
> >>> +       if (ret)
> >>> +               return ret;
> >>> +       ret =3D vgxy61_write_reg(sensor, DEVICE_GPIO_3_CTRL, polarity=
 << 1);
> >>> +       if (ret)
> >>> +               return ret;
> >>> +       return vgxy61_write_reg(sensor, DEVICE_SIGNALS_POLARITY_CTRL,=
 polarity);
> >>> +}
> >>> +
> >>> +static int find_max_long_exposure(struct vgxy61_dev *sensor, int fra=
me_length, int short_expo_ratio)
> >>> +{
> >>> +       int first_rot_max_expo;
> >>> +       int second_rot_max_expo;
> >>> +
> >>> +       /*
> >>> +        * Apply first rule of thumb:
> >>> +        * frame_length < short_line_nb + sensor->sensor_height + sen=
sor->rot_term
> >>> +        * with short_line_nb =3D long_line_nb / short_expo_ratio
> >>> +        */
> >>> +       first_rot_max_expo =3D ((frame_length - sensor->sensor_height=
 - sensor->rot_term) *
> >>> +                            short_expo_ratio) - 1;
> >>> +
> >>> +       /*
> >>> +        * Apply second rule of thumb
> >>> +        * frame_length < short_line_nb + long_line_nb + VGXY61_EXPOS=
_ROT_TERM
> >>> +        * with short_line_nb =3D long_line_nb / short_expo_ratio
> >>> +        */
> >>> +       second_rot_max_expo =3D (((frame_length - VGXY61_EXPOS_ROT_TE=
RM) * short_expo_ratio) /
> >>> +                             (short_expo_ratio + 1)) - 1;
> >>> +
> >>> +       /* Take the minimum of both rules */
> >>> +       return min(first_rot_max_expo, second_rot_max_expo);
> >>> +}
> >>> +
> >>> +static int vgxy61_update_exposure(struct vgxy61_dev *sensor, int lon=
g_expo_line_nb, enum hdr hdr,
> >>> +                                 bool clamp)
> >>> +{
> >>> +       struct i2c_client *client =3D sensor->i2c_client;
> >>> +       int max_long_expo;
> >>> +       int max_short_expo =3D 0;
> >>> +       int short_expo_line_nb =3D 0;
> >>> +       /* We use a constant ratio of 10 for linear HDR mode */
> >>> +       int hdr_linear_ratio =3D 10;
> >>> +       u16 frame_length;
> >>> +       int ret;
> >>> +
> >>> +       ret =3D vgxy61_read_reg16(sensor, DEVICE_FRAME_LENGTH, &frame=
_length);
> >>> +       if (ret)
> >>> +               return ret;
> >>> +
> >>> +       /* Long and short integration times must not be less than 10 =
lines */
> >>> +       long_expo_line_nb =3D max(10, long_expo_line_nb);
> >>> +       long_expo_line_nb =3D min_t(int, frame_length, long_expo_line=
_nb);
> >>> +
> >>> +       /* Compute short exposure according to hdr mode and long expo=
sure */
> >>> +       switch (hdr) {
> >>> +       case HDR_LINEAR:
> >>> +               max_long_expo =3D find_max_long_exposure(sensor, fram=
e_length, hdr_linear_ratio);
> >>> +               max_short_expo =3D (max_long_expo + (hdr_linear_ratio=
 / 2)) / hdr_linear_ratio;
> >>> +               short_expo_line_nb =3D (long_expo_line_nb + (hdr_line=
ar_ratio / 2)) /
> >>> +                                    hdr_linear_ratio;
> >>> +               break;
> >>> +       case HDR_SUB:
> >>> +               max_long_expo =3D find_max_long_exposure(sensor, fram=
e_length, 1);
> >>> +               max_short_expo =3D max_long_expo;
> >>> +               short_expo_line_nb =3D long_expo_line_nb;
> >>> +               break;
> >>> +       case NO_HDR:
> >>> +               /*
> >>> +                * As short expo is 0 here, only the second rule of t=
humb applies, see
> >>> +                * find_max_long_exposure for more
> >>> +                */
> >>> +               max_long_expo =3D frame_length - VGXY61_EXPOS_ROT_TER=
M;
> >>> +               break;
> >>> +       default:
> >>> +               /* Should never happen */
> >>> +               WARN_ON(true);
> >>> +               break;
> >>> +       }
> >>> +
> >>> +       if (long_expo_line_nb > max_long_expo) {
> >>> +               if (!clamp) {
> >>> +                       dev_err(&client->dev, "Exposure %d too high (=
max for this hdr mode %d)\n",
> >>> +                               long_expo_line_nb, max_long_expo);
> >>> +                       return -EINVAL;
> >>> +               }
> >>> +               dev_warn(&client->dev, "Exposure %d too high for this=
 hdr mode, clamping to %d\n",
> >>> +                        long_expo_line_nb, max_long_expo);
> >>> +               long_expo_line_nb =3D max_long_expo;
> >>> +               short_expo_line_nb =3D max_short_expo;
> >>> +       }
> >>> +
> >>> +       dev_dbg(&client->dev, "frame_length %d, long_expo_line_nb %d,=
 short_expo_line_nb %d",
> >>> +               frame_length, long_expo_line_nb, short_expo_line_nb);
> >>> +
> >>> +       /* Apply exposure */
> >>> +       sensor->expo_long =3D long_expo_line_nb;
> >>> +       sensor->expo_short =3D short_expo_line_nb;
> >>> +
> >>> +       if (sensor->streaming)
> >>> +               return apply_exposure(sensor);
> >>> +       return 0;
> >>> +}
> >>> +
> >>> +static int vgxy61_update_hdr(struct vgxy61_dev *sensor, u32 index)
> >>> +{
> >>> +       const u8 index2val[] =3D {0x1, 0x4, 0xa};
> >>> +       int ret;
> >>> +
> >>> +       /*
> >>> +        * Short exposure changes according to HDR mode, do it first =
as it can
> >>> +        * violate sensors 'rule of thumbs' and therefore will requir=
e to change
> >>> +        * the long exposure
> >>> +        */
> >>> +       ret =3D vgxy61_update_exposure(sensor, sensor->expo_long, ind=
ex, true);
> >>> +       if (ret)
> >>> +               return ret;
> >>> +
> >>> +       /* Update strobe mode according to HDR */
> >>> +       ret =3D vgxy61_update_gpios_strobe_mode(sensor, index);
> >>> +       if (ret)
> >>> +               return ret;
> >>> +
> >>> +       ret =3D vgxy61_write_reg(sensor, DEVICE_HDR_CTRL, index2val[i=
ndex]);
> >>> +       if (ret)
> >>> +               return ret;
> >>> +       sensor->hdr =3D index;
> >>> +
> >>> +       return 0;
> >>> +}
> >>> +
> >>> +static int vgxy61_get_temp_stream_enabled(struct vgxy61_dev *sensor,=
 int *temp)
> >>> +{
> >>> +       int ret;
> >>> +       u16 temperature;
> >>> +
> >>> +       ret =3D vgxy61_read_reg16(sensor, DEVICE_THSENS1_TEMPERATURE,=
 &temperature);
> >>> +       if (ret)
> >>> +               return ret;
> >>> +
> >>> +       /* Temperature is expressed in Kelvin in Q10.2 fixed point fo=
rmat*/
> >>> +       temperature =3D (temperature & 0x0fff) >> 2;
> >>> +       temperature =3D kelvin_to_celsius(temperature);
> >>> +
> >>> +       *temp =3D temperature;
> >>> +
> >>> +       return 0;
> >>> +}
> >>> +
> >>> +static int vgxy61_get_temp_stream_disabled(struct vgxy61_dev *sensor=
, int *temp)
> >>> +{
> >>> +       int ret;
> >>> +
> >>> +       /* Device needs to be in standby mode if streaming is off */
> >>> +       ret =3D vgxy61_write_reg(sensor, DEVICE_STBY, STBY_REQ_TMP_RE=
AD);
> >>> +       if (ret)
> >>> +               return ret;
> >>> +       ret =3D vgxy61_poll_reg(sensor, DEVICE_STBY, STBY_NO_REQ);
> >>> +       if (ret)
> >>> +               return ret;
> >>> +
> >>> +       return vgxy61_get_temp_stream_enabled(sensor, temp);
> >>> +}
> >>> +
> >>> +static int vgxy61_get_temp(struct vgxy61_dev *sensor, int *temp)
> >>> +{
> >>> +       *temp =3D 0;
> >>> +       if (sensor->streaming)
> >>> +               return vgxy61_get_temp_stream_enabled(sensor, temp);
> >>> +       else
> >>> +               return vgxy61_get_temp_stream_disabled(sensor, temp);
> >>> +}
> >>> +
> >>> +static int vgxy61_s_ctrl(struct v4l2_ctrl *ctrl)
> >>> +{
> >>> +       struct v4l2_subdev *sd =3D ctrl_to_sd(ctrl);
> >>> +       struct vgxy61_dev *sensor =3D to_vgxy61_dev(sd);
> >>> +       int ret;
> >>> +
> >>> +       switch (ctrl->id) {
> >>> +       case V4L2_CID_EXPOSURE:
> >>> +               ret =3D vgxy61_update_exposure(sensor, ctrl->val, sen=
sor->hdr, false);
> >>> +               ctrl->val =3D sensor->expo_long;
> >>> +               break;
> >>> +       case V4L2_CID_ANALOGUE_GAIN:
> >>> +               ret =3D vgxy61_update_analog_gain(sensor, ctrl->val);
> >>> +               break;
> >>> +       case V4L2_CID_DIGITAL_GAIN:
> >>> +               ret =3D vgxy61_update_digital_gain(sensor, ctrl->val)=
;
> >>> +               break;
> >>> +       case V4L2_CID_VFLIP:
> >>> +       case V4L2_CID_HFLIP:
> >>> +               if (sensor->streaming) {
> >>> +                       ret =3D -EBUSY;
> >>> +                       break;
> >>> +               }
> >>> +               if (ctrl->id =3D=3D V4L2_CID_VFLIP)
> >>> +                       sensor->vflip =3D ctrl->val;
> >>> +               if (ctrl->id =3D=3D V4L2_CID_HFLIP)
> >>> +                       sensor->hflip =3D ctrl->val;
> >>> +               ret =3D vgxy61_write_reg(sensor, DEVICE_ORIENTATION,
> >>> +                                      sensor->hflip | (sensor->vflip=
 << 1));
> >>> +               break;
> >>> +       case V4L2_CID_TEST_PATTERN:
> >>> +               ret =3D vgxy61_update_patgen(sensor, ctrl->val);
> >>> +               break;
> >>> +       case V4L2_CID_HDR:
> >>> +               ret =3D vgxy61_update_hdr(sensor, ctrl->val);
> >>> +               break;
> >>> +       case V4L2_CID_GPIOS_STROBE_LONG_START_DELAY:
> >>> +               ret =3D vgxy61_write_reg(sensor, DEVICE_STROBE_LONG_S=
TART_DELAY, ctrl->val);
> >>> +               break;
> >>> +       case V4L2_CID_GPIOS_STROBE_LONG_END_DELAY:
> >>> +               ret =3D vgxy61_write_reg(sensor, DEVICE_STROBE_LONG_E=
ND_DELAY, ctrl->val);
> >>> +               break;
> >>> +       case V4L2_CID_GPIOS_STROBE_SHORT_START_DELAY:
> >>> +               ret =3D vgxy61_write_reg(sensor, DEVICE_STROBE_SHORT_=
START_DELAY, ctrl->val);
> >>> +               break;
> >>> +       case V4L2_CID_GPIOS_STROBE_SHORT_END_DELAY:
> >>> +               ret =3D vgxy61_write_reg(sensor, DEVICE_STROBE_SHORT_=
END_DELAY, ctrl->val);
> >>> +               break;
> >>> +       default:
> >>> +               ret =3D -EINVAL;
> >>> +               break;
> >>> +       }
> >>> +
> >>> +       return ret;
> >>> +}
> >>> +
> >>> +static int vgxy61_g_volatile_ctrl(struct v4l2_ctrl *ctrl)
> >>> +{
> >>> +       struct v4l2_subdev *sd =3D ctrl_to_sd(ctrl);
> >>> +       struct vgxy61_dev *sensor =3D to_vgxy61_dev(sd);
> >>> +       int temperature;
> >>> +       int ret;
> >>> +
> >>> +       switch (ctrl->id) {
> >>> +       case V4L2_CID_TEMPERATURE:
> >>> +               ret =3D vgxy61_get_temp(sensor, &temperature);
> >>> +               if (ret)
> >>> +                       break;
> >>> +               ret =3D __v4l2_ctrl_s_ctrl(ctrl, temperature);
> >
> > Do you need to call __v4l2_ctrl_s_ctrl instead of just updating
> > ctrl->val? There is no s_ctrl handler for the control as you've
> > declared it as read only.
> >
>
> Sure.
>
> >>> +               break;
> >>> +       default:
> >>> +               ret =3D -EINVAL;
> >>> +               break;
> >>> +       }
> >>> +
> >>> +       return ret;
> >>> +}
> >>> +
> >>> +static const struct v4l2_ctrl_ops vgxy61_ctrl_ops =3D {
> >>> +       .g_volatile_ctrl =3D vgxy61_g_volatile_ctrl,
> >>> +       .s_ctrl =3D vgxy61_s_ctrl,
> >>> +};
> >>> +
> >>> +static const struct v4l2_ctrl_config vgxy61_hdr_ctrl =3D {
> >>> +       .ops            =3D &vgxy61_ctrl_ops,
> >>> +       .id             =3D V4L2_CID_HDR,
> >>> +       .name           =3D "HDR mode",
> >>> +       .type           =3D V4L2_CTRL_TYPE_MENU,
> >>> +       .min            =3D 0,
> >>> +       .max            =3D ARRAY_SIZE(vgxy61_hdr_modes) - 1,
> >>> +       .def            =3D NO_HDR,
> >>> +       .qmenu          =3D vgxy61_hdr_modes,
> >>> +};
> >>> +
> >>> +static const struct v4l2_ctrl_config vgxy61_strobe_long_start_delay =
=3D {
> >>> +       .ops            =3D &vgxy61_ctrl_ops,
> >>> +       .id             =3D V4L2_CID_GPIOS_STROBE_LONG_START_DELAY,
> >>> +       .name           =3D "Long strobe mode start delay in lines",
> >>> +       .type           =3D V4L2_CTRL_TYPE_INTEGER,
> >>> +       .min            =3D -128,
> >>> +       .max            =3D 127,
> >>> +       .step           =3D 1,
> >>> +       .def            =3D 0,
> >>> +       .flags          =3D 0,
> >>> +};
> >>> +
> >>> +static const struct v4l2_ctrl_config vgxy61_strobe_long_end_delay =
=3D {
> >>> +       .ops            =3D &vgxy61_ctrl_ops,
> >>> +       .id             =3D V4L2_CID_GPIOS_STROBE_LONG_END_DELAY,
> >>> +       .name           =3D "Long strobe mode end delay in lines",
> >>> +       .type           =3D V4L2_CTRL_TYPE_INTEGER,
> >>> +       .min            =3D -128,
> >>> +       .max            =3D 127,
> >>> +       .step           =3D 1,
> >>> +       .def            =3D 0,
> >>> +       .flags          =3D 0,
> >>> +};
> >>> +
> >>> +static const struct v4l2_ctrl_config vgxy61_strobe_short_start_delay=
 =3D {
> >>> +       .ops            =3D &vgxy61_ctrl_ops,
> >>> +       .id             =3D V4L2_CID_GPIOS_STROBE_SHORT_START_DELAY,
> >>> +       .name           =3D "Short strobe mode start delay in lines",
> >>> +       .type           =3D V4L2_CTRL_TYPE_INTEGER,
> >>> +       .min            =3D -128,
> >>> +       .max            =3D 127,
> >>> +       .step           =3D 1,
> >>> +       .def            =3D 0,
> >>> +       .flags          =3D 0,
> >>> +};
> >>> +
> >>> +static const struct v4l2_ctrl_config vgxy61_strobe_short_end_delay =
=3D {
> >>> +       .ops            =3D &vgxy61_ctrl_ops,
> >>> +       .id             =3D V4L2_CID_GPIOS_STROBE_SHORT_END_DELAY,
> >>> +       .name           =3D "Short strobe mode end delay in lines",
> >>> +       .type           =3D V4L2_CTRL_TYPE_INTEGER,
> >>> +       .min            =3D -128,
> >>> +       .max            =3D 127,
> >>> +       .step           =3D 1,
> >>> +       .def            =3D 0,
> >>> +       .flags          =3D 0,
> >>> +};
> >>> +
> >>> +static const struct v4l2_ctrl_config vgxy61_temp_ctrl =3D {
> >>> +       .ops            =3D &vgxy61_ctrl_ops,
> >>> +       .id             =3D V4L2_CID_TEMPERATURE,
> >>> +       .name           =3D "Temperature in =C2=B0C",
> >>> +       .type           =3D V4L2_CTRL_TYPE_INTEGER,
> >>> +       .min            =3D -128,
> >>> +       .max            =3D 128,
> >>> +       .step           =3D 1,
> >>> +};
> >>> +
> >>> +static int vgxy61_init_controls(struct vgxy61_dev *sensor)
> >>> +{
> >>> +       const struct v4l2_ctrl_ops *ops =3D &vgxy61_ctrl_ops;
> >>> +       struct vgxy61_ctrls *ctrls =3D &sensor->ctrls;
> >>> +       struct v4l2_ctrl_handler *hdl =3D &sensor->ctrls.handler;
> >>> +       int ret;
> >>> +
> >>> +       v4l2_ctrl_handler_init(hdl, 16);
> >>> +       /* We can use our own mutex for the ctrl lock */
> >>> +       hdl->lock =3D &sensor->lock;
> >>> +       ctrls->exposure =3D v4l2_ctrl_new_std(hdl, ops, V4L2_CID_EXPO=
SURE, 10, 0xffff, 1,
> >>> +                                           sensor->expo_long);
> >>> +       /* This is 8.8 fixed point value */
> >>> +       ctrls->analog_gain =3D v4l2_ctrl_new_std(hdl, ops, V4L2_CID_A=
NALOGUE_GAIN, 0, 0x3fff, 1,
> >>> +                                              0x0);
> >>> +       /* This is 8.8 fixed point value */
> >>> +       ctrls->digital_gain =3D v4l2_ctrl_new_std(hdl, ops, V4L2_CID_=
DIGITAL_GAIN, 0, 0xfff, 1,
> >>> +                                               0x100);
> >>> +       ctrls->vflip =3D v4l2_ctrl_new_std(hdl, ops, V4L2_CID_VFLIP, =
0, 1, 1, sensor->vflip);
> >>> +       ctrls->hflip =3D v4l2_ctrl_new_std(hdl, ops, V4L2_CID_HFLIP, =
0, 1, 1, sensor->hflip);
> >>> +       ctrls->patgen =3D v4l2_ctrl_new_std_menu_items(hdl, ops, V4L2=
_CID_TEST_PATTERN,
> >>> +                                                    ARRAY_SIZE(vgxy6=
1_test_pattern_menu) - 1,
> >>> +                                                    0, 0, vgxy61_tes=
t_pattern_menu);
> >>> +       ctrls->hdr =3D v4l2_ctrl_new_custom(hdl, &vgxy61_hdr_ctrl, NU=
LL);
> >>> +       ctrls->pixel_rate =3D v4l2_ctrl_new_std(hdl, ops, V4L2_CID_PI=
XEL_RATE, 1, INT_MAX, 1,
> >>> +                                             get_pixel_rate(sensor))=
;
> >>> +       ctrls->pixel_rate->flags |=3D V4L2_CTRL_FLAG_READ_ONLY;
> >>> +       ctrls->link_freq =3D v4l2_ctrl_new_int_menu(hdl, ops, V4L2_CI=
D_LINK_FREQ,
> >>> +                                                 ARRAY_SIZE(link_fre=
q) - 1, 0, link_freq);
> >>> +       ctrls->link_freq->flags |=3D V4L2_CTRL_FLAG_READ_ONLY;
> >>> +       /* Gpios ctrls */
> >>> +       ctrls->gpios.long_start =3D v4l2_ctrl_new_custom(hdl, &vgxy61=
_strobe_long_start_delay, NULL);
> >>> +       ctrls->gpios.long_end =3D v4l2_ctrl_new_custom(hdl, &vgxy61_s=
trobe_long_end_delay, NULL);
> >>> +       ctrls->gpios.short_start =3D v4l2_ctrl_new_custom(hdl, &vgxy6=
1_strobe_short_start_delay,
> >>> +                                                       NULL);
> >>> +       ctrls->gpios.short_end =3D v4l2_ctrl_new_custom(hdl, &vgxy61_=
strobe_short_end_delay, NULL);
> >>> +       /* Temperature ctrl */
> >>> +       ctrls->temp =3D v4l2_ctrl_new_custom(hdl, &vgxy61_temp_ctrl, =
NULL);
> >>> +       ctrls->temp->flags |=3D V4L2_CTRL_FLAG_VOLATILE | V4L2_CTRL_F=
LAG_READ_ONLY;
> >>> +
> >>> +       if (hdl->error) {
> >>> +               ret =3D hdl->error;
> >>> +               goto free_ctrls;
> >>> +       }
> >>> +
> >>> +       sensor->sd.ctrl_handler =3D hdl;
> >>> +       return 0;
> >>> +
> >>> +free_ctrls:
> >>> +       v4l2_ctrl_handler_free(hdl);
> >>> +       return ret;
> >>> +}
> >>> +
> >>> +static const struct v4l2_subdev_core_ops vgxy61_core_ops =3D {
> >>> +};
> >>> +
> >>> +static const struct v4l2_subdev_video_ops vgxy61_video_ops =3D {
> >>> +       .s_stream =3D vgxy61_s_stream,
> >>> +       .g_frame_interval =3D vgxy61_g_frame_interval,
> >>> +       .s_frame_interval =3D vgxy61_s_frame_interval,
> >>> +};
> >>> +
> >>> +static const struct v4l2_subdev_pad_ops vgxy61_pad_ops =3D {
> >>> +       .enum_mbus_code =3D vgxy61_enum_mbus_code,
> >>> +       .get_fmt =3D vgxy61_get_fmt,
> >>> +       .set_fmt =3D vgxy61_set_fmt,
> >>> +       .enum_frame_size =3D vgxy61_enum_frame_size,
> >>> +       .enum_frame_interval =3D vgxy61_enum_frame_interval,
> >>> +};
> >>> +
> >>> +static const struct v4l2_subdev_ops vgxy61_subdev_ops =3D {
> >>> +       .core =3D &vgxy61_core_ops,
> >>> +       .video =3D &vgxy61_video_ops,
> >>> +       .pad =3D &vgxy61_pad_ops,
> >>> +};
> >>> +
> >>> +static const struct media_entity_operations vgxy61_subdev_entity_ops=
 =3D {
> >>> +       .link_validate =3D v4l2_subdev_link_validate,
> >>> +};
> >>> +
> >>> +/* Set phy polarities */
> >>> +static int vgxy61_tx_from_ep(struct vgxy61_dev *sensor, struct fwnod=
e_handle *endpoint)
> >>> +{
> >>> +       struct v4l2_fwnode_endpoint ep =3D { .bus_type =3D V4L2_MBUS_=
CSI2_DPHY };
> >>> +       struct i2c_client *client =3D sensor->i2c_client;
> >>> +       u32 log2phy[NB_POLARITIES] =3D {~0, ~0, ~0, ~0, ~0};
> >>> +       u32 phy2log[NB_POLARITIES] =3D {~0, ~0, ~0, ~0, ~0};
> >>> +       int polarities[NB_POLARITIES] =3D {0, 0, 0, 0, 0};
> >>> +       int l_nb;
> >>> +       int p, l;
> >>> +       int ret;
> >>> +       int i;
> >>> +
> >>> +       ret =3D v4l2_fwnode_endpoint_alloc_parse(endpoint, &ep);
> >>> +       if (ret)
> >>> +               goto error_alloc;
> >>> +
> >>> +       l_nb =3D ep.bus.mipi_csi2.num_data_lanes;
> >>> +       if (l_nb !=3D 1 && l_nb !=3D 2 && l_nb !=3D 4) {
> >>> +               dev_err(&client->dev, "invalid data lane number %d\n"=
, l_nb);
> >>> +               goto error_ep;
> >>> +       }
> >>> +
> >>> +       /* Build log2phy, phy2log and polarities from ep info */
> >>> +       log2phy[0] =3D ep.bus.mipi_csi2.clock_lane;
> >>> +       phy2log[log2phy[0]] =3D 0;
> >>> +       for (l =3D 1; l < l_nb + 1; l++) {
> >>> +               log2phy[l] =3D ep.bus.mipi_csi2.data_lanes[l - 1];
> >>> +               phy2log[log2phy[l]] =3D l;
> >>> +       }
> >>> +       /*
> >>> +        * Then fill remaining slots for every physical slot to have =
something valid for hardware
> >>> +        * stuff.
> >>> +        */
> >>> +       for (p =3D 0; p < NB_POLARITIES; p++) {
> >>> +               if (phy2log[p] !=3D ~0)
> >>> +                       continue;
> >>> +               phy2log[p] =3D l;
> >>> +               log2phy[l] =3D p;
> >>> +               l++;
> >>> +       }
> >>> +       for (l =3D 0; l < l_nb + 1; l++)
> >>> +               polarities[l] =3D ep.bus.mipi_csi2.lane_polarities[l]=
;
> >>> +
> >>> +       if (log2phy[0] !=3D 0) {
> >>> +               dev_err(&client->dev, "clk lane must be map to physic=
al lane 0\n");
> >>> +               goto error_ep;
> >>> +       }
> >>> +       sensor->oif_ctrl =3D (polarities[4] << 15) + ((phy2log[4] - 1=
) << 13) +
> >>> +                          (polarities[3] << 12) + ((phy2log[3] - 1) =
<< 10) +
> >>> +                          (polarities[2] <<  9) + ((phy2log[2] - 1) =
<<  7) +
> >>> +                          (polarities[1] <<  6) + ((phy2log[1] - 1) =
<<  4) +
> >>> +                          (polarities[0] <<  3) +
> >>> +                          l_nb;
> >>> +       sensor->nb_of_lane =3D l_nb;
> >>> +
> >>> +       dev_dbg(&client->dev, "tx uses %d lanes", l_nb);
> >>> +       for (i =3D 0; i < 5; i++) {
> >>> +               dev_dbg(&client->dev, "log2phy[%d] =3D %d\n", i, log2=
phy[i]);
> >>> +               dev_dbg(&client->dev, "phy2log[%d] =3D %d\n", i, phy2=
log[i]);
> >>> +               dev_dbg(&client->dev, "polarity[%d] =3D %d\n", i, pol=
arities[i]);
> >>> +       }
> >>> +       dev_dbg(&client->dev, "oif_ctrl =3D 0x%04x\n", sensor->oif_ct=
rl);
> >>> +
> >>> +       v4l2_fwnode_endpoint_free(&ep);
> >>> +
> >>> +       return 0;
> >>> +
> >>> +error_ep:
> >>> +       v4l2_fwnode_endpoint_free(&ep);
> >>> +error_alloc:
> >>> +
> >>> +       return -EINVAL;
> >>> +}
> >>> +
> >>> +static int vgxy61_configure(struct vgxy61_dev *sensor)
> >>> +{
> >>> +       struct i2c_client *client =3D sensor->i2c_client;
> >>> +       int sensor_freq;
> >>> +       unsigned int prediv;
> >>> +       unsigned int mult;
> >>> +       int ret;
> >>> +
> >>> +       compute_pll_parameters_by_freq(sensor->clk_freq, &prediv, &mu=
lt);
> >>> +       sensor_freq =3D (mult * sensor->clk_freq) / prediv;
> >>> +       /* Frequency to data rate is 1:1 ratio for MIPI */
> >>> +       sensor->data_rate_in_mbps =3D sensor_freq;
> >>> +       /* Video timing ISP path (pixel clock)  requires 804/5 mhz =
=3D 160 mhz */
> >>> +       sensor->pclk =3D sensor_freq / 5;
> >>> +
> >>> +       /* Cache line_length value */
> >>> +       ret =3D vgxy61_read_reg16(sensor, DEVICE_LINE_LENGTH, &sensor=
->line_length);
> >>> +       if (ret)
> >>> +               return ret;
> >>> +       /* Configure clocks */
> >>> +       ret =3D vgxy61_write_reg32(sensor, DEVICE_EXT_CLOCK, sensor->=
clk_freq);
> >>> +       if (ret)
> >>> +               return ret;
> >>> +       ret =3D vgxy61_write_reg(sensor, DEVICE_CLK_PLL_PREDIV, predi=
v);
> >>> +       if (ret)
> >>> +               return ret;
> >>> +       ret =3D vgxy61_write_reg(sensor, DEVICE_CLK_SYS_PLL_MULT, mul=
t);
> >>> +       if (ret)
> >>> +               return ret;
> >>> +       /* Configure interface */
> >>> +       ret =3D vgxy61_write_reg16(sensor, DEVICE_OIF_CTRL, sensor->o=
if_ctrl);
> >>> +       if (ret)
> >>> +               return ret;
> >>> +       /* Disable pwm compression */
> >>> +       ret =3D vgxy61_write_reg(sensor, DEVICE_FRAME_CONTENT_CTRL, 0=
);
> >>> +       if (ret)
> >>> +               return ret;
> >>> +       /* Disable asil lines */
> >>> +       ret =3D vgxy61_write_reg(sensor, DEVICE_BYPASS_CTRL, 4);
> >>> +       if (ret)
> >>> +               return ret;
> >>> +       /* Set gpios polarity according to device tree value */
> >>> +       ret =3D vgxy61_update_gpios_strobe_polarity(sensor, sensor->g=
pios_polarity);
> >>> +       if (ret)
> >>> +               return ret;
> >>> +       /* HDR mode */
> >>> +       ret =3D vgxy61_update_hdr(sensor, sensor->hdr);
> >>> +       if (ret)
> >>> +               return ret;
> >>> +       /* Slave mode */
> >>> +       ret =3D vgxy61_write_reg(sensor, DEVICE_VT_CTRL, sensor->slav=
e_mode);
> >>> +       if (ret)
> >>> +               return ret;
> >>> +       /* Set pattern generator solid to middle value */
> >>> +       ret =3D vgxy61_write_reg16(sensor, DEVICE_PATGEN_LONG_DATA_GR=
, 0x800);
> >>> +       if (ret)
> >>> +               return ret;
> >>> +       ret =3D vgxy61_write_reg16(sensor, DEVICE_PATGEN_LONG_DATA_R,=
 0x800);
> >>> +       if (ret)
> >>> +               return ret;
> >>> +       ret =3D vgxy61_write_reg16(sensor, DEVICE_PATGEN_LONG_DATA_B,=
 0x800);
> >>> +       if (ret)
> >>> +               return ret;
> >>> +       ret =3D vgxy61_write_reg16(sensor, DEVICE_PATGEN_LONG_DATA_GB=
, 0x800);
> >>> +       if (ret)
> >>> +               return ret;
> >>> +       ret =3D vgxy61_write_reg16(sensor, DEVICE_PATGEN_SHORT_DATA_G=
R, 0x800);
> >>> +       if (ret)
> >>> +               return ret;
> >>> +       ret =3D vgxy61_write_reg16(sensor, DEVICE_PATGEN_SHORT_DATA_R=
, 0x800);
> >>> +       if (ret)
> >>> +               return ret;
> >>> +       ret =3D vgxy61_write_reg16(sensor, DEVICE_PATGEN_SHORT_DATA_B=
, 0x800);
> >>> +       if (ret)
> >>> +               return ret;
> >>> +       ret =3D vgxy61_write_reg16(sensor, DEVICE_PATGEN_SHORT_DATA_G=
B, 0x800);
> >>> +       if (ret)
> >>> +               return ret;
> >>> +
> >>> +       dev_dbg(&client->dev, "clock prediv =3D %d\n", prediv);
> >>> +       dev_dbg(&client->dev, "clock mult =3D %d\n", mult);
> >>> +       dev_dbg(&client->dev, "data rate =3D %d mbps\n",
> >>> +               sensor->data_rate_in_mbps);
> >>> +
> >>> +       return 0;
> >>> +}
> >>> +
> >>> +static int vgxy61_patch(struct vgxy61_dev *sensor)
> >>> +{
> >>> +       struct i2c_client *client =3D sensor->i2c_client;
> >>> +       u16 patch;
> >>> +       int ret;
> >>> +
> >>> +       ret =3D vgxy61_write_array(sensor, DEVICE_FWPATCH_START_ADDR,=
 sizeof(patch_array),
> >>> +                                patch_array);
> >>> +       if (ret)
> >>> +               return ret;
> >>> +
> >>> +       ret =3D vgxy61_write_reg(sensor, DEVICE_STBY, 0x10);
> >>> +       if (ret)
> >>> +               return ret;
> >>> +
> >>> +       ret =3D vgxy61_poll_reg(sensor, DEVICE_STBY, 0);
> >>> +       if (ret)
> >>> +               return ret;
> >>> +
> >>> +       ret =3D vgxy61_read_reg16(sensor, DEVICE_FWPATCH_REVISION, &p=
atch);
> >>> +       if (ret)
> >>> +               return ret;
> >>> +
> >>> +       if (patch !=3D (DEVICE_FWPATCH_REVISION_MAJOR << 12) +
> >>> +                    (DEVICE_FWPATCH_REVISION_MINOR << 8) +
> >>> +                    DEVICE_FWPATCH_REVISION_MICRO) {
> >>> +               dev_err(&client->dev, "bad patch version expected %d.=
%d.%d got %d.%d.%d\n",
> >>> +                       DEVICE_FWPATCH_REVISION_MAJOR,
> >>> +                       DEVICE_FWPATCH_REVISION_MINOR,
> >>> +                       DEVICE_FWPATCH_REVISION_MICRO,
> >>> +                       patch >> 12, (patch >> 8) & 0x0f, patch & 0xf=
f);
> >>> +               return -ENODEV;
> >>> +       }
> >>> +       dev_dbg(&client->dev, "patch %d.%d.%d applied\n",
> >>> +               patch >> 12, (patch >> 8) & 0x0f, patch & 0xff);
> >>> +
> >>> +       return 0;
> >>> +}
> >>> +
> >>> +static int vgxy61_detect_cut_version(struct vgxy61_dev *sensor)
> >>> +{
> >>> +       struct i2c_client *client =3D sensor->i2c_client;
> >>> +       u16 device_rev;
> >>> +       int ret;
> >>> +
> >>> +       ret =3D vgxy61_read_reg16(sensor, DEVICE_REVISION, &device_re=
v);
> >>> +       if (ret)
> >>> +               return ret;
> >>> +
> >>> +       switch (device_rev >> 8) {
> >>> +       case 0xA:
> >>> +               dev_info(&client->dev, "Cut1 detected\n");
> >>> +               dev_err(&client->dev, "Cut1 not supported by this dri=
ver\n");
> >>> +               return -ENODEV;
> >>> +       case 0xB:
> >>> +               dev_info(&client->dev, "Cut2 detected\n");
> >>> +               return 0;
> >>> +       case 0xC:
> >>> +               dev_info(&client->dev, "Cut3 detected\n");
> >>> +               return 0;
> >>> +       default:
> >>> +               dev_err(&client->dev, "Unable to detect cut version\n=
");
> >>> +               return -ENODEV;
> >>> +       }
> >>> +}
> >>> +
> >>> +static int vgxy61_detect(struct vgxy61_dev *sensor)
> >>> +{
> >>> +       struct i2c_client *client =3D sensor->i2c_client;
> >>> +       u16 id =3D 0;
> >>> +       int ret;
> >>> +       u8 st;
> >>> +
> >>> +       ret =3D vgxy61_read_reg16(sensor, DEVICE_MODEL_ID_REG, &id);
> >>> +       if (ret)
> >>> +               return ret;
> >>> +       if (id !=3D VG5661_MODEL_ID && id !=3D VG5761_MODEL_ID) {
> >>> +               dev_warn(&client->dev, "Unsupported sensor id %x\n", =
id);
> >>> +               return -ENODEV;
> >>> +       }
> >>> +       dev_dbg(&client->dev, "detected sensor id =3D 0x%04x\n", id);
> >>> +
> >>> +       if (id =3D=3D VG5761_MODEL_ID) {
> >>> +               sensor->sensor_width =3D VGX761_WIDTH;
> >>> +               sensor->sensor_height =3D VGX761_HEIGHT;
> >>> +               sensor->sensor_modes =3D vgx761_mode_data;
> >>> +               sensor->sensor_modes_nb =3D ARRAY_SIZE(vgx761_mode_da=
ta);
> >>> +               sensor->current_mode =3D &vgx761_mode_data[VGX761_DEF=
AULT_MODE];
> >>> +               sensor->rot_term =3D VGX761_SHORT_ROT_TERM;
> >>> +               sensor->sensor_rates =3D vgx761_sensor_frame_rates;
> >>> +               sensor->sensor_rates_nb =3D ARRAY_SIZE(vgx761_sensor_=
frame_rates);
> >>> +       } else if (id =3D=3D VG5661_MODEL_ID) {
> >>> +               sensor->sensor_width =3D VGX661_WIDTH;
> >>> +               sensor->sensor_height =3D VGX661_HEIGHT;
> >>> +               sensor->sensor_modes =3D vgx661_mode_data;
> >>> +               sensor->sensor_modes_nb =3D ARRAY_SIZE(vgx661_mode_da=
ta);
> >>> +               sensor->current_mode =3D &vgx661_mode_data[VGX661_DEF=
AULT_MODE];
> >>> +               sensor->rot_term =3D VGX661_SHORT_ROT_TERM;
> >>> +               sensor->sensor_rates =3D vgx661_sensor_frame_rates;
> >>> +               sensor->sensor_rates_nb =3D ARRAY_SIZE(vgx661_sensor_=
frame_rates);
> >>> +       }
> >>> +
> >>> +       ret =3D vgxy61_wait_state(sensor, SW_STBY);
> >>> +       if (ret)
> >>> +               return ret;
> >>> +
> >>> +       ret =3D vgxy61_read_reg(sensor, DEVICE_NVM, &st);
> >>> +       if (ret)
> >>> +               return ret;
> >>> +       if (st !=3D NVM_OK)
> >>> +               dev_warn(&client->dev, "Bad nvm state got %d\n", st);
> >>> +
> >>> +       /* Detect cut version */
> >>> +       ret =3D vgxy61_detect_cut_version(sensor);
> >>> +       if (ret)
> >>> +               return ret;
> >>> +
> >>> +       return 0;
> >>> +}
> >>> +
> >>> +static int vgxy61_probe(struct i2c_client *client)
> >>> +{
> >>> +       struct device *dev =3D &client->dev;
> >>> +       struct fwnode_handle *endpoint;
> >>> +       struct vgxy61_dev *sensor;
> >>> +       int ret;
> >>> +
> >>> +       sensor =3D devm_kzalloc(dev, sizeof(*sensor), GFP_KERNEL);
> >>> +       if (!sensor)
> >>> +               return -ENOMEM;
> >>> +
> >>> +       sensor->i2c_client =3D client;
> >>> +       sensor->streaming =3D false;
> >>> +       sensor->fmt.code =3D MEDIA_BUS_FMT_SGBRG8_1X8;
> >>> +       sensor->fmt.field =3D V4L2_FIELD_NONE;
> >>> +       sensor->fmt.colorspace =3D V4L2_COLORSPACE_SRGB;
> >
> > ycbcr_enc, quantization, and xfer_func too.
> >
>
> Ok.
>
> >>> +       sensor->frame_interval.numerator =3D 1;
> >>> +       sensor->frame_interval.denominator =3D 60;
> >>> +       sensor->hdr =3D NO_HDR;
> >>> +       sensor->expo_long =3D 200;
> >>> +       sensor->expo_short =3D 0;
> >>> +       sensor->hflip =3D false;
> >>> +       sensor->vflip =3D false;
> >>> +
> >>> +       endpoint =3D fwnode_graph_get_next_endpoint(of_fwnode_handle(=
dev->of_node), NULL);
> >>> +       if (!endpoint) {
> >>> +               dev_err(dev, "endpoint node not found\n");
> >>> +               return -EINVAL;
> >>> +       }
> >>> +
> >>> +       ret =3D vgxy61_tx_from_ep(sensor, endpoint);
> >>> +       fwnode_handle_put(endpoint);
> >>> +       if (ret) {
> >>> +               dev_err(dev, "Failed to parse endpoint %d\n", ret);
> >>> +               return ret;
> >>> +       }
> >>> +
> >>> +       sensor->xclk =3D devm_clk_get(dev, "xclk");
> >>> +       if (IS_ERR(sensor->xclk)) {
> >>> +               dev_err(dev, "failed to get xclk\n");
> >>> +               return PTR_ERR(sensor->xclk);
> >>> +       }
> >>> +       sensor->clk_freq =3D clk_get_rate(sensor->xclk);
> >>> +       if (sensor->clk_freq < 6000000 || sensor->clk_freq > 27000000=
) {
> >>> +               dev_err(dev, "Only 6Mhz-27Mhz clock range supported. =
provide %d Hz\n",
> >>> +                       sensor->clk_freq);
> >>> +               return -EINVAL;
> >>> +       }
> >>> +       sensor->gpios_polarity =3D of_property_read_bool(dev->of_node=
, "invert-gpios-polarity");
> >>> +       sensor->slave_mode =3D of_property_read_bool(dev->of_node, "s=
lave-mode");
> >>> +
> >>> +       v4l2_i2c_subdev_init(&sensor->sd, client, &vgxy61_subdev_ops)=
;
> >>> +       sensor->sd.flags |=3D V4L2_SUBDEV_FL_HAS_DEVNODE;
> >>> +       sensor->pad.flags =3D MEDIA_PAD_FL_SOURCE;
> >>> +       sensor->sd.entity.ops =3D &vgxy61_subdev_entity_ops;
> >>> +       sensor->sd.entity.function =3D MEDIA_ENT_F_CAM_SENSOR;
> >>> +
> >>> +       ret =3D media_entity_pads_init(&sensor->sd.entity, 1, &sensor=
->pad);
> >>> +       if (ret) {
> >>> +               dev_err(&client->dev, "pads init failed %d\n", ret);
> >>> +               return ret;
> >>> +       }
> >>> +
> >>> +       /* Request optional reset pin */
> >>> +       sensor->reset_gpio =3D devm_gpiod_get_optional(dev, "reset", =
GPIOD_OUT_HIGH);
> >>> +
> >>> +       ret =3D vgxy61_get_regulators(sensor);
> >>> +       if (ret) {
> >>> +               dev_err(&client->dev, "failed to get regulators %d\n"=
, ret);
> >>> +               goto entity_cleanup;
> >>> +       }
> >>> +
> >>> +       ret =3D regulator_bulk_enable(VGXY61_NUM_SUPPLIES, sensor->su=
pplies);
> >>> +       if (ret) {
> >>> +               dev_err(&client->dev, "failed to enable regulators %d=
\n", ret);
> >>> +               goto entity_cleanup;
> >>> +       }
> >>> +
> >>> +       ret =3D clk_prepare_enable(sensor->xclk);
> >>> +       if (ret) {
> >>> +               dev_err(&client->dev, "failed to enable clock %d\n", =
ret);
> >>> +               goto disable_bulk;
> >>> +       }
> >>> +
> >>> +       mutex_init(&sensor->lock);
> >>> +
> >>> +       /* Apply reset sequence */
> >>> +       if (sensor->reset_gpio) {
> >>> +               ret =3D vgxy61_apply_reset(sensor);
> >>> +               if (ret) {
> >>> +                       dev_err(&client->dev, "sensor reset failed %d=
\n", ret);
> >>> +                       goto disable_clock;
> >>> +               }
> >>> +       }
> >>> +
> >>> +       ret =3D vgxy61_detect(sensor);
> >>> +       if (ret) {
> >>> +               dev_err(&client->dev, "sensor detect failed %d\n", re=
t);
> >>> +               goto disable_clock;
> >>> +       }
> >>> +       sensor->fmt.width =3D sensor->current_mode->width;
> >>> +       sensor->fmt.height =3D sensor->current_mode->height;
> >>> +
> >>> +       ret =3D vgxy61_patch(sensor);
> >>> +       if (ret) {
> >>> +               dev_err(&client->dev, "sensor patch failed %d\n", ret=
);
> >>> +               goto disable_clock;
> >>> +       }
> >>> +
> >>> +       ret =3D vgxy61_configure(sensor);
> >>> +       if (ret) {
> >>> +               dev_err(&client->dev, "sensor configuration failed %d=
\n", ret);
> >>> +               goto disable_clock;
> >>> +       }
> >>> +
> >>> +       ret =3D vgxy61_init_controls(sensor);
> >>> +       if (ret) {
> >>> +               dev_err(&client->dev, "controls initialization failed=
 %d\n", ret);
> >>> +               goto disable_clock;
> >>> +       }
> >>> +
> >>> +       ret =3D v4l2_async_register_subdev(&sensor->sd);
> >>> +       if (ret) {
> >>> +               dev_err(&client->dev, "async subdev register failed %=
d\n", ret);
> >>> +               goto disable_clock;
> >>> +       }
> >>> +
> >>> +       dev_info(&client->dev, "vgxy61 probe successfully\n");
> >>> +
> >>> +       return 0;
> >>> +
> >>> +disable_clock:
> >>> +       clk_disable_unprepare(sensor->xclk);
> >>> +disable_bulk:
> >>> +       regulator_bulk_disable(VGXY61_NUM_SUPPLIES, sensor->supplies)=
;
> >>> +entity_cleanup:
> >>> +       mutex_destroy(&sensor->lock);
> >>> +       media_entity_cleanup(&sensor->sd.entity);
> >>> +       return ret;
> >>> +}
> >>> +
> >>> +static int vgxy61_remove(struct i2c_client *client)
> >>> +{
> >>> +       struct v4l2_subdev *sd =3D i2c_get_clientdata(client);
> >>> +       struct vgxy61_dev *sensor =3D to_vgxy61_dev(sd);
> >>> +
> >>> +       v4l2_async_unregister_subdev(&sensor->sd);
> >>> +       clk_disable_unprepare(sensor->xclk);
> >>> +       mutex_destroy(&sensor->lock);
> >>> +       media_entity_cleanup(&sensor->sd.entity);
> >>> +       regulator_bulk_disable(VGXY61_NUM_SUPPLIES, sensor->supplies)=
;
> >>> +
> >>> +       return 0;
> >>> +}
> >>> +
> >>> +static const struct of_device_id vgxy61_dt_ids[] =3D {
> >>> +       { .compatible =3D "st,st-vgxy61" },
> >>> +       { /* sentinel */ }
> >>> +};
> >>> +MODULE_DEVICE_TABLE(of, vgxy61_dt_ids);
> >>> +
> >>> +static struct i2c_driver vgxy61_i2c_driver =3D {
> >>> +       .driver =3D {
> >>> +               .name  =3D "st-vgxy61",
> >>> +               .of_match_table =3D vgxy61_dt_ids,
> >
> > Support for pm_runtime? Then again the sensor appears to be powered up
> > in probe and never powered down again.
> >
> >   Dave
> >
>
> The power management is handled by the internal CPU. When in SW_STBY the =
consumption is as its lowest.
> Therefore sensor does not provide any power up/down register access, only=
 the optional reset pin you saw in the probe.
> I am not familiar with pm_runtime yet, I think it is not necessary in thi=
s case.

It sounds like a more complex sensor than many. Certainly with that
binary blob to program you don't want to have to send that more often
than necessary. It just looks a little odd requesting all the
regulators and clock, and then just enabling them permanently.
I don't claim to be a pm_runtime expert, just noting that many sensors
make use of it.

Cheers.
  Dave

> >>> +       },
> >>> +       .probe_new =3D vgxy61_probe,
> >>> +       .remove =3D vgxy61_remove,
> >>> +};
> >>> +
> >>> +module_i2c_driver(vgxy61_i2c_driver);
> >>> +
> >>> +MODULE_AUTHOR("Benjamin Mugnier <benjamin.mugnier@foss.st.com>");
> >>> +MODULE_AUTHOR("Mickael Guene <mickael.guene@st.com>");
> >>> +MODULE_AUTHOR("Sylvain Petinot <sylvain.petinot@foss.st.com>");
> >>> +MODULE_DESCRIPTION("VGXY61 camera subdev driver");
> >>> +MODULE_LICENSE("GPL v2");
> >>> --
> >>> 2.25.1
> >>>
