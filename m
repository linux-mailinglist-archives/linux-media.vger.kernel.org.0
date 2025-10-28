Return-Path: <linux-media+bounces-45871-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 0671FC168CD
	for <lists+linux-media@lfdr.de>; Tue, 28 Oct 2025 19:58:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 2E70C34794C
	for <lists+linux-media@lfdr.de>; Tue, 28 Oct 2025 18:58:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D3B0C34F474;
	Tue, 28 Oct 2025 18:57:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KanlLRqB"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0B9B34DB67
	for <linux-media@vger.kernel.org>; Tue, 28 Oct 2025 18:57:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761677877; cv=none; b=XXcOEd3Md5lYwr9pah6OIy3AsEdBluiz7fQWo1BfQyoyk9gL4nKMNIOH8BebslIgr5VphJEAy/rSxqRzuVz9/G1mzGD7xVCbDkLFmkBppwiC7XQFxD9jWNEiYfSznGvgSi+t0ojd3f4eS23+Xyg3N7jomROiauHQmYSH4/WuOvs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761677877; c=relaxed/simple;
	bh=PW9emIAnxDUo4sV5B3fHS0H0Y+noD1c3YY3j5iy0KEU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TXpvoFBZBVkOTB/RD8uLjCkpRnm28zcD6HhDsHpFNnkZWxqFE0o4k3X/aI7c3DM3ZBNIAgoZTc2xGX3hnw2oKnjY/oFW8moXBuDoPzBku5OM3Jvtewv1HPtWGn5GdmDh8Lae3tR77YN5ErAX9rC8hLrPZKgIT76Hww9Es2rLHUI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KanlLRqB; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-4285169c005so3016727f8f.0
        for <linux-media@vger.kernel.org>; Tue, 28 Oct 2025 11:57:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761677870; x=1762282670; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cR43qlM/9M3TgtkRQ7q9yox/QY/6JyqH0wmerTu2zas=;
        b=KanlLRqBRIQQvAb4v0I9vKytx1PjX7yCMmFOiiCnUb6Vki6bcG7yUS1YGUNEvOuXvU
         yBiFaRIP0Qy9WBlWpRJQMxOOx31LuIWpCD+0vfMrjX/PMYKFt+kgUoahnR1CTiEgoGE/
         IyD9GHkT8nuS5heeXA1USLCVl8h91UraKpQ6amv+tLVQtL+XI2zxI6kR/bqXKyS6skJz
         Z9nHr4TmhPuYjXC/zCWZzQcU3cqqUVgDnHsvwFjx99ChSA7NfB+j8YonrAztDD7kx1S0
         R/HT2VJeWEhHW4MGEcrHA0+Yqrn867PJuWy35JGN+n2vINL5r1kaiQtKzjBHAyhlDt5E
         RpQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761677870; x=1762282670;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cR43qlM/9M3TgtkRQ7q9yox/QY/6JyqH0wmerTu2zas=;
        b=r0P+Ecr0PeNcbMTFVinAPyVpxz2fB+9EfKOvRS1PRHlSZdfUjQFO5cpXTclHgLBDv6
         z8SbXLgHPysKevrh+Io+Aj0VbbeaG+YyZdlITbveBcTyG5b93tuSJoT9F7K/JWc5jZ14
         UKn9dSY+L0Ep+kgunLqlU5ejZqLpwhgQRhCwFX7we2S8VMXaABp6KwJ7dyeCaC8HdeLy
         CO6XsF8XHaECEPvefHKxc9N3QndfM5A7ROptHSm/IMV2pIYtJRIvQ7zJP0cwbvN1uyUz
         yqh8MtMsTixdbyVvha/hcOTKJwUW48tCUcUzzfX9TpuePP1RbAr5SQgD9xfkfvwLFe+G
         oJ7A==
X-Forwarded-Encrypted: i=1; AJvYcCVmwW/uUKab/OJvTjWSvHP6XQA1un2H1jCNrcyg24p9I8HxmdbM2NV3GXniYd++3hpLEoWKfAWZzxZ3PQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzDLJGTnc7S9ste+fXDE0DKFuu1GvH4nS6JCn3paLcbDutVz0DT
	XWQ+y2/b69EJXSD4iiQo4SjUNnmYd3m8gZFTemfzsWioh6YslhqeIJMi69/yQi0Y8MfCAREncRC
	W43z307xngnCtZR/YWeK53rqPnxk7Cew=
X-Gm-Gg: ASbGncuPZWp8K2/zG8Twp2pPo+4pyBPcyJ4kMf/62+2S4s9bKnG8cdMuBOuJ38Q2ZQR
	ZzZQf5wnKcsThBwuTt5w19Hj06P1VIr3UWwOC1n4Y3mOd5xRetDdCw4FIFygy8pS8mvHdW0Hmpk
	ngXkzhHSBf4j56HFz76CWuCXo2YPmLLcaz7QyR7F2SncLhYdxg1qzj3AwH21JENqAQ7XoY0K764
	+Zcyr21y5oA3g4zSV9CNwz4EjSsOtNAXvD5jpaXEcHG2jXYb2so4na1ITuwog==
X-Google-Smtp-Source: AGHT+IEmFDIjuUINl/Cq2tk+ImEHXETsHhYyWKVsZVV1CceP0z3iv8OMJ23s77Z2qMm9luPHm4g52cpb0Xpfdt1a2a8=
X-Received: by 2002:a05:6000:1846:b0:429:8d8b:fef7 with SMTP id
 ffacd0b85a97d-429aefca3a0mr90022f8f.49.1761677869537; Tue, 28 Oct 2025
 11:57:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251028092200.7003-1-clamor95@gmail.com> <20251028092200.7003-3-clamor95@gmail.com>
 <aQEEUpgW8nmZ3ZCl@kekkonen.localdomain>
In-Reply-To: <aQEEUpgW8nmZ3ZCl@kekkonen.localdomain>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Tue, 28 Oct 2025 20:57:37 +0200
X-Gm-Features: AWmQ_bmmW3RfI7C-7Dk0snlkharnRJNJSTmGWZlgU53pu9FjCM9pWENS3cxUtts
Message-ID: <CAPVz0n2SuOcoDn4KZ_zb4NCuaes6nppHRgffWC4yTHmOsbe1vw@mail.gmail.com>
Subject: Re: [PATCH v2 2/2 RESEND] media: i2c: add Sony IMX111 CMOS camera
 sensor driver
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Hans Verkuil <hverkuil@xs4all.nl>, Hans de Goede <hansg@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
	Dongcheng Yan <dongcheng.yan@intel.com>, =?UTF-8?Q?Andr=C3=A9_Apitzsch?= <git@apitzsch.eu>, 
	Sylvain Petinot <sylvain.petinot@foss.st.com>, 
	Benjamin Mugnier <benjamin.mugnier@foss.st.com>, 
	Heimir Thor Sverrisson <heimir.sverrisson@gmail.com>, linux-media@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=D0=B2=D1=82, 28 =D0=B6=D0=BE=D0=B2=D1=82. 2025=E2=80=AF=D1=80. =D0=BE 19:5=
8 Sakari Ailus <sakari.ailus@linux.intel.com> =D0=BF=D0=B8=D1=88=D0=B5:
>
> Hi Svyatoslav,
>
> Btw. there's no need to resend media patches; just ping for reviews
> instead.

With other subsystems resends are preferred so I resend in general.

>
> On Tue, Oct 28, 2025 at 11:22:00AM +0200, Svyatoslav Ryhel wrote:
> > Add a v4l2 sub-device driver for the Sony IMX111 image sensor. This is =
a
> > camera sensor using the i2c bus for control and the csi-2 bus for data.
> >
> > The following features are supported:
> > - manual exposure, digital and analog gain control support
> > - pixel rate/link freq control support
> > - supported resolution up to 3280x2464 for single shot capture
> > - supported resolution up to 1920x1080 @ 30fps for video
> > - supported bayer order output SGBRG10 and SGBRG8
> >
> > Camera module seems to be partially compatible with Nokia SMIA but it
> > lacks a few registers required for clock calculations and has different
> > vendor-specific per-mode configurations which makes it incompatible wit=
h
> > existing CCS driver.
> >
> > Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> > ---
> >  drivers/media/i2c/Kconfig  |   10 +
> >  drivers/media/i2c/Makefile |    1 +
> >  drivers/media/i2c/imx111.c | 1614 ++++++++++++++++++++++++++++++++++++
> >  3 files changed, 1625 insertions(+)
> >  create mode 100644 drivers/media/i2c/imx111.c
> >
> > diff --git a/drivers/media/i2c/Kconfig b/drivers/media/i2c/Kconfig
> > index e68202954a8f..8ec1f369f043 100644
> > --- a/drivers/media/i2c/Kconfig
> > +++ b/drivers/media/i2c/Kconfig
> > @@ -127,6 +127,16 @@ config VIDEO_HI847
> >            To compile this driver as a module, choose M here: the
> >            module will be called hi847.
> >
> > +config VIDEO_IMX111
> > +     tristate "Sony IMX111 sensor support"
> > +     select V4L2_CCI_I2C
> > +     help
> > +       This is a V4L2 sensor driver for the Sony IMX111 camera
> > +       sensors.
> > +
> > +       To compile this driver as a module, choose M here: the
> > +       module will be called imx111.
> > +
> >  config VIDEO_IMX208
> >       tristate "Sony IMX208 sensor support"
> >       help
> > diff --git a/drivers/media/i2c/Makefile b/drivers/media/i2c/Makefile
> > index 5873d29433ee..67b810c91870 100644
> > --- a/drivers/media/i2c/Makefile
> > +++ b/drivers/media/i2c/Makefile
> > @@ -45,6 +45,7 @@ obj-$(CONFIG_VIDEO_HI556) +=3D hi556.o
> >  obj-$(CONFIG_VIDEO_HI846) +=3D hi846.o
> >  obj-$(CONFIG_VIDEO_HI847) +=3D hi847.o
> >  obj-$(CONFIG_VIDEO_I2C) +=3D video-i2c.o
> > +obj-$(CONFIG_VIDEO_IMX111) +=3D imx111.o
> >  obj-$(CONFIG_VIDEO_IMX208) +=3D imx208.o
> >  obj-$(CONFIG_VIDEO_IMX214) +=3D imx214.o
> >  obj-$(CONFIG_VIDEO_IMX219) +=3D imx219.o
> > diff --git a/drivers/media/i2c/imx111.c b/drivers/media/i2c/imx111.c
> > new file mode 100644
> > index 000000000000..814c557d9e96
> > --- /dev/null
> > +++ b/drivers/media/i2c/imx111.c
> > @@ -0,0 +1,1614 @@
> > +// SPDX-License-Identifier: GPL-2.0-only
> > +
> > +#include <linux/clk.h>
> > +#include <linux/delay.h>
> > +#include <linux/gpio/consumer.h>
> > +#include <linux/i2c.h>
> > +#include <linux/kernel.h>
> > +#include <linux/media.h>
> > +#include <linux/module.h>
> > +#include <linux/pm_runtime.h>
> > +#include <linux/ratelimit.h>
> > +#include <linux/regmap.h>
> > +#include <linux/regulator/consumer.h>
> > +#include <linux/slab.h>
> > +#include <linux/string.h>
> > +#include <linux/types.h>
> > +#include <linux/videodev2.h>
> > +#include <linux/units.h>
> > +
> > +#include <media/media-entity.h>
> > +#include <media/v4l2-async.h>
> > +#include <media/v4l2-cci.h>
> > +#include <media/v4l2-ctrls.h>
> > +#include <media/v4l2-device.h>
> > +#include <media/v4l2-fwnode.h>
> > +#include <media/v4l2-event.h>
> > +#include <media/v4l2-image-sizes.h>
> > +#include <media/v4l2-subdev.h>
> > +#include <media/v4l2-mediabus.h>
> > +
> > +/* product information registers */
> > +#define IMX111_PRODUCT_ID                    CCI_REG16(0x0000)
> > +#define   IMX111_CHIP_ID                     0x111
> > +#define IMX111_REVISION                              CCI_REG8(0x0002)
> > +#define IMX111_MANUFACTURER_ID                       CCI_REG8(0x0003)
> > +#define IMX111_SMIA_VER                              CCI_REG8(0x0004)
> > +#define IMX111_FRAME_COUNTER                 CCI_REG8(0x0005)
> > +#define IMX111_PIXEL_ORDER                   CCI_REG8(0x0006)
> > +
> > +/* general configuration registers */
> > +#define IMX111_STREAMING_MODE                        CCI_REG8(0x0100)
> > +#define   IMX111_MODE_STANDBY                        0
> > +#define   IMX111_MODE_STREAMING                      1
> > +#define IMX111_IMAGE_ORIENTATION             CCI_REG8(0x0101)
> > +#define   IMX111_IMAGE_HFLIP                 BIT(0)
> > +#define   IMX111_IMAGE_VFLIP                 BIT(1)
> > +#define IMX111_SOFTWARE_RESET                        CCI_REG8(0x0103)
> > +#define   IMX111_RESET_ON                    1
> > +#define IMX111_GROUP_WRITE                   CCI_REG8(0x0104)
> > +#define   IMX111_GROUP_WRITE_ON                      1
> > +#define IMX111_FRAME_DROP                    CCI_REG8(0x0105)
> > +#define   IMX111_FRAME_DROP_ON                       1
> > +#define IMX111_CHANNEL_ID                    CCI_REG8(0x0110)
> > +#define IMX111_SIGNALLING_MODE                       CCI_REG8(0x0111)
> > +#define IMX111_DATA_DEPTH                    CCI_REG16(0x0112)
> > +#define   IMX111_DATA_DEPTH_RAW8             0x08
> > +#define   IMX111_DATA_DEPTH_RAW10            0x0a
> > +
> > +/* integration time registers */
> > +#define IMX111_INTEGRATION_TIME                      CCI_REG16(0x0202)
> > +#define IMX111_INTEGRATION_TIME_MIN          0x1
> > +#define IMX111_INTEGRATION_TIME_MAX          0xffff
> > +#define IMX111_INTEGRATION_TIME_STEP         1
> > +
> > +/* analog gain control */
> > +#define IMX111_REG_ANALOG_GAIN                       CCI_REG8(0x0205)
> > +#define IMX111_ANA_GAIN_MIN                  0
> > +#define IMX111_ANA_GAIN_MAX                  240
> > +#define IMX111_ANA_GAIN_STEP                 1
> > +#define IMX111_ANA_GAIN_DEFAULT                      0
> > +
> > +/* digital gain control */
> > +#define IMX111_REG_DIG_GAIN_GREENR           CCI_REG16(0x020e)
> > +#define IMX111_REG_DIG_GAIN_RED                      CCI_REG16(0x0210)
> > +#define IMX111_REG_DIG_GAIN_BLUE             CCI_REG16(0x0212)
> > +#define IMX111_REG_DIG_GAIN_GREENB           CCI_REG16(0x0214)
> > +#define IMX111_DGTL_GAIN_MIN                 0x0100
> > +#define IMX111_DGTL_GAIN_MAX                 0x0fff
> > +#define IMX111_DGTL_GAIN_DEFAULT             0x0100
> > +#define IMX111_DGTL_GAIN_STEP                        1
> > +
> > +/* clock configuration registers */
> > +#define IMX111_PIXEL_CLK_DIVIDER_PLL1                CCI_REG8(0x0301) =
/* fixed to 10 */
> > +#define IMX111_SYSTEM_CLK_DIVIDER_PLL1               CCI_REG8(0x0303) =
/* fixed to 1 */
> > +#define IMX111_PRE_PLL_CLK_DIVIDER_PLL1              CCI_REG8(0x0305)
> > +#define IMX111_PLL_MULTIPLIER_PLL1           CCI_REG8(0x0307)
> > +#define IMX111_PLL_SETTLING_TIME             CCI_REG8(0x303c)
> > +#define   IMX111_PLL_SETTLING_TIME_DEFAULT   200
> > +#define IMX111_POST_DIVIDER                  CCI_REG8(0x30a4)
> > +#define   IMX111_POST_DIVIDER_DIV1           2
> > +#define   IMX111_POST_DIVIDER_DIV2           0
> > +#define   IMX111_POST_DIVIDER_DIV4           1
> > +
> > +/* frame timing registers */
> > +#define IMX111_VERTICAL_TOTAL_LENGTH         CCI_REG16(0x0340)
> > +#define IMX111_HORIZONTAL_TOTAL_LENGTH               CCI_REG16(0x0342)
> > +
> > +/* image size registers */
> > +#define IMX111_HORIZONTAL_START                      CCI_REG16(0x0344)
> > +#define IMX111_VERTICAL_START                        CCI_REG16(0x0346)
> > +#define IMX111_HORIZONTAL_END                        CCI_REG16(0x0348)
> > +#define IMX111_VERTICAL_END                  CCI_REG16(0x034a)
> > +#define IMX111_IMAGE_WIDTH                   CCI_REG16(0x034c)
> > +#define IMX111_IMAGE_HEIGHT                  CCI_REG16(0x034e)
> > +
> > +/* test pattern registers */
> > +#define IMX111_TEST_PATTERN                  CCI_REG8(0x0601)
> > +#define   IMX111_TEST_PATTERN_NONE           0
> > +#define   IMX111_TEST_PATTERN_SOLID          1
> > +#define   IMX111_TEST_PATTERN_BARS           2
> > +#define   IMX111_TEST_PATTERN_FADE           3
> > +#define   IMX111_TEST_PATTERN_PN9            4
> > +#define IMX111_SOLID_COLOR_RED                       CCI_REG16(0x0602)
> > +#define IMX111_SOLID_COLOR_GR                        CCI_REG16(0x0604)
> > +#define IMX111_SOLID_COLOR_BLUE                      CCI_REG16(0x0606)
> > +#define IMX111_SOLID_COLOR_GB                        CCI_REG16(0x0608)
> > +#define IMX111_TESTP_COLOUR_MIN                      0
> > +#define IMX111_TESTP_COLOUR_MAX                      0x03ff
> > +#define IMX111_TESTP_COLOUR_STEP             1
> > +
> > +#define IMX111_FRAME_RATE_STEP                       5
> > +
> > +#define IMX111_PIXEL_ARRAY_WIDTH             3280U
> > +#define IMX111_PIXEL_ARRAY_HEIGHT            2464U
> > +
> > +enum {
> > +     IMX111_MODE_3280x2464,
> > +     IMX111_MODE_3280x1848,
> > +     IMX111_MODE_3280x1098,
> > +     IMX111_MODE_2100x1200,
> > +     IMX111_MODE_1952x1098,
> > +     IMX111_MODE_1920x1080,
> > +     IMX111_MODE_1640x1232,
> > +     IMX111_MODE_1440x1080,
> > +     IMX111_MODE_1640x924,
> > +     IMX111_MODE_1308x736,
> > +     IMX111_MODE_1280x720,
> > +     IMX111_MODE_820x614,
> > +     IMX111_MODE_640x480,
> > +};
> > +
> > +struct imx111_mode {
> > +     u32 width;
> > +     u32 height;
> > +     struct {
> > +             const struct cci_reg_sequence *regs;
> > +             u32 num_of_regs;
> > +     } reg_list;
> > +};
> > +
> > +struct imx111_pll {
> > +     u64 extclk_rate;
> > +     u8 pre_div;
> > +     u8 mult;
> > +};
> > +
> > +struct imx111 {
> > +     struct regmap *regmap;
> > +
> > +     struct clk *extclk;
> > +     struct gpio_desc *reset;
> > +     struct regulator_bulk_data supplies[3];
> > +
> > +     struct v4l2_fwnode_endpoint bus_cfg;
> > +     struct v4l2_subdev sd;
> > +     struct media_pad pad;
> > +
> > +     /* V4L2 Controls */
> > +     struct v4l2_ctrl_handler hdl;
> > +     struct v4l2_ctrl *pixel_rate;
> > +     struct v4l2_ctrl *link_freq;
> > +     struct v4l2_ctrl *exposure;
> > +     struct v4l2_ctrl *hflip;
> > +     struct v4l2_ctrl *vflip;
> > +
> > +     /* Current mode */
> > +     const struct imx111_mode *cur_mode;
> > +     const struct imx111_pll *pll;
> > +     u32 data_depth;
> > +
> > +     u64 pixel_clk_raw;
> > +     s64 default_link_freq;
> > +};
> > +
> > +static const struct imx111_pll imx111_pll[] =3D {
> > +     {
> > +             .extclk_rate =3D  6000000, .pre_div =3D 1, .mult =3D 113,
>
> Could you write this as:
>
>         { .extclk_rate =3D 6000000, .pre_div =3D 1, .mult =3D 113, },
>
> etc.
>
> > +     }, {
> > +             .extclk_rate =3D 12000000, .pre_div =3D 2, .mult =3D 113,
> > +     }, {
> > +             .extclk_rate =3D 13500000, .pre_div =3D 1, .mult =3D 50,
> > +     }, {
> > +             .extclk_rate =3D 18000000, .pre_div =3D 2, .mult =3D 75,
> > +     }, {
> > +             .extclk_rate =3D 24000000, .pre_div =3D 4, .mult =3D 113,
> > +     }, {
> > +             .extclk_rate =3D 27000000, .pre_div =3D 2, .mult =3D 50,
> > +     }, {
> > +             .extclk_rate =3D 36000000, .pre_div =3D 4, .mult =3D 75,
> > +     }, {
> > +             .extclk_rate =3D 54000000, .pre_div =3D 4, .mult =3D 50,
> > +     },
> > +};
> > +
> > +/*
> > + * This table MUST contain 4 entries per format, to cover the various =
flip
> > + * combinations in the order
> > + * - no flip
> > + * - h flip
> > + * - v flip
> > + * - h&v flips
> > + */
> > +static const u32 imx111_mbus_formats[] =3D {
> > +     MEDIA_BUS_FMT_SGBRG10_1X10,
> > +     MEDIA_BUS_FMT_SBGGR10_1X10,
> > +     MEDIA_BUS_FMT_SRGGB10_1X10,
> > +     MEDIA_BUS_FMT_SGRBG10_1X10,
> > +
> > +     MEDIA_BUS_FMT_SGBRG8_1X8,
> > +     MEDIA_BUS_FMT_SBGGR8_1X8,
> > +     MEDIA_BUS_FMT_SRGGB8_1X8,
> > +     MEDIA_BUS_FMT_SGRBG8_1X8,
> > +};
> > +
> > +static const struct cci_reg_sequence imx111_global_init[] =3D {
> > +     { CCI_REG8(0x3080), 0x50 },
> > +     { CCI_REG8(0x3087), 0x53 },
> > +     { CCI_REG8(0x309d), 0x94 },
> > +     { CCI_REG8(0x30b1), 0x03 },
> > +     { CCI_REG8(0x30c6), 0x00 },
> > +     { CCI_REG8(0x30c7), 0x00 },
> > +     { CCI_REG8(0x3115), 0x0b },
> > +     { CCI_REG8(0x3118), 0x30 },
> > +     { CCI_REG8(0x311d), 0x25 },
> > +     { CCI_REG8(0x3121), 0x0a },
> > +     { CCI_REG8(0x3212), 0xf2 },
> > +     { CCI_REG8(0x3213), 0x0f },
> > +     { CCI_REG8(0x3215), 0x0f },
> > +     { CCI_REG8(0x3217), 0x0b },
> > +     { CCI_REG8(0x3219), 0x0b },
> > +     { CCI_REG8(0x321b), 0x0d },
> > +     { CCI_REG8(0x321d), 0x0d },
> > +     { CCI_REG8(0x32aa), 0x11 },
> > +     { CCI_REG8(0x3032), 0x40 },
> > +};
> > +
> > +static const struct cci_reg_sequence mode_820x614[] =3D {
> > +     { CCI_REG8(0x0340), 0x04 },     { CCI_REG8(0x0341), 0xec },
> > +     { CCI_REG8(0x0342), 0x0d },     { CCI_REG8(0x0343), 0xd0 },
> > +     { CCI_REG8(0x0344), 0x00 },     { CCI_REG8(0x0345), 0x08 },
> > +     { CCI_REG8(0x0346), 0x00 },     { CCI_REG8(0x0347), 0x34 },
> > +     { CCI_REG8(0x0348), 0x0c },     { CCI_REG8(0x0349), 0xd7 },
> > +     { CCI_REG8(0x034a), 0x09 },     { CCI_REG8(0x034b), 0xcb },
> > +     { CCI_REG8(0x034c), 0x03 },     { CCI_REG8(0x034d), 0x34 },
> > +     { CCI_REG8(0x034e), 0x02 },     { CCI_REG8(0x034f), 0x66 },
> > +     { CCI_REG8(0x0381), 0x05 },     { CCI_REG8(0x0383), 0x03 },
> > +     { CCI_REG8(0x0385), 0x05 },     { CCI_REG8(0x0387), 0x03 },
> > +     { CCI_REG8(0x3033), 0x00 },     { CCI_REG8(0x303d), 0x10 },
> > +     { CCI_REG8(0x303e), 0x40 },     { CCI_REG8(0x3040), 0x08 },
> > +     { CCI_REG8(0x3041), 0x97 },     { CCI_REG8(0x3048), 0x01 },
> > +     { CCI_REG8(0x304c), 0x6f },     { CCI_REG8(0x304d), 0x03 },
> > +     { CCI_REG8(0x3064), 0x12 },     { CCI_REG8(0x3073), 0x00 },
> > +     { CCI_REG8(0x3074), 0x11 },     { CCI_REG8(0x3075), 0x11 },
> > +     { CCI_REG8(0x3076), 0x11 },     { CCI_REG8(0x3077), 0x11 },
> > +     { CCI_REG8(0x3079), 0x00 },     { CCI_REG8(0x307a), 0x00 },
> > +     { CCI_REG8(0x309b), 0x28 },     { CCI_REG8(0x309c), 0x13 },
> > +     { CCI_REG8(0x309e), 0x00 },     { CCI_REG8(0x30a0), 0x14 },
> > +     { CCI_REG8(0x30a1), 0x09 },     { CCI_REG8(0x30aa), 0x03 },
> > +     { CCI_REG8(0x30b2), 0x03 },     { CCI_REG8(0x30d5), 0x09 },
> > +     { CCI_REG8(0x30d6), 0x00 },     { CCI_REG8(0x30d7), 0x00 },
> > +     { CCI_REG8(0x30d8), 0x00 },     { CCI_REG8(0x30d9), 0x00 },
> > +     { CCI_REG8(0x30de), 0x04 },     { CCI_REG8(0x30df), 0x20 },
> > +     { CCI_REG8(0x3102), 0x08 },     { CCI_REG8(0x3103), 0x22 },
> > +     { CCI_REG8(0x3104), 0x20 },     { CCI_REG8(0x3105), 0x00 },
> > +     { CCI_REG8(0x3106), 0x87 },     { CCI_REG8(0x3107), 0x00 },
> > +     { CCI_REG8(0x3108), 0x03 },     { CCI_REG8(0x3109), 0x02 },
> > +     { CCI_REG8(0x310a), 0x03 },     { CCI_REG8(0x315c), 0x9c },
> > +     { CCI_REG8(0x315d), 0x9b },     { CCI_REG8(0x316e), 0x9d },
> > +     { CCI_REG8(0x316f), 0x9c },     { CCI_REG8(0x3318), 0x7a },
> > +     { CCI_REG8(0x3348), 0xe0 },
> > +};
> > +
> > +static const struct cci_reg_sequence mode_1308x736[] =3D {
> > +     { CCI_REG8(0x0340), 0x09 },     { CCI_REG8(0x0341), 0x41 },
> > +     { CCI_REG8(0x0342), 0x07 },     { CCI_REG8(0x0343), 0x68 },
> > +     { CCI_REG8(0x0344), 0x01 },     { CCI_REG8(0x0345), 0x54 },
> > +     { CCI_REG8(0x0346), 0x02 },     { CCI_REG8(0x0347), 0x20 },
> > +     { CCI_REG8(0x0348), 0x0b },     { CCI_REG8(0x0349), 0x8b },
> > +     { CCI_REG8(0x034a), 0x07 },     { CCI_REG8(0x034b), 0xdf },
> > +     { CCI_REG8(0x034c), 0x05 },     { CCI_REG8(0x034d), 0x1c },
> > +     { CCI_REG8(0x034e), 0x02 },     { CCI_REG8(0x034f), 0xe0 },
> > +     { CCI_REG8(0x0381), 0x01 },     { CCI_REG8(0x0383), 0x01 },
> > +     { CCI_REG8(0x0385), 0x01 },     { CCI_REG8(0x0387), 0x03 },
> > +     { CCI_REG8(0x3033), 0x84 },     { CCI_REG8(0x303d), 0x10 },
> > +     { CCI_REG8(0x303e), 0x40 },     { CCI_REG8(0x3040), 0x08 },
> > +     { CCI_REG8(0x3041), 0x97 },     { CCI_REG8(0x3048), 0x01 },
> > +     { CCI_REG8(0x304c), 0xd7 },     { CCI_REG8(0x304d), 0x01 },
> > +     { CCI_REG8(0x3064), 0x12 },     { CCI_REG8(0x3073), 0x00 },
> > +     { CCI_REG8(0x3074), 0x11 },     { CCI_REG8(0x3075), 0x11 },
> > +     { CCI_REG8(0x3076), 0x11 },     { CCI_REG8(0x3077), 0x11 },
> > +     { CCI_REG8(0x3079), 0x00 },     { CCI_REG8(0x307a), 0x00 },
> > +     { CCI_REG8(0x309b), 0x48 },     { CCI_REG8(0x309c), 0x12 },
> > +     { CCI_REG8(0x309e), 0x04 },     { CCI_REG8(0x30a0), 0x14 },
> > +     { CCI_REG8(0x30a1), 0x0a },     { CCI_REG8(0x30aa), 0x01 },
> > +     { CCI_REG8(0x30b2), 0x05 },     { CCI_REG8(0x30d5), 0x04 },
> > +     { CCI_REG8(0x30d6), 0x85 },     { CCI_REG8(0x30d7), 0x2a },
> > +     { CCI_REG8(0x30d8), 0x64 },     { CCI_REG8(0x30d9), 0x89 },
> > +     { CCI_REG8(0x30de), 0x00 },     { CCI_REG8(0x30df), 0x20 },
> > +     { CCI_REG8(0x3102), 0x08 },     { CCI_REG8(0x3103), 0x22 },
> > +     { CCI_REG8(0x3104), 0x20 },     { CCI_REG8(0x3105), 0x00 },
> > +     { CCI_REG8(0x3106), 0x87 },     { CCI_REG8(0x3107), 0x00 },
> > +     { CCI_REG8(0x3108), 0x03 },     { CCI_REG8(0x3109), 0x02 },
> > +     { CCI_REG8(0x310a), 0x03 },     { CCI_REG8(0x315c), 0x42 },
> > +     { CCI_REG8(0x315d), 0x41 },     { CCI_REG8(0x316e), 0x43 },
> > +     { CCI_REG8(0x316f), 0x42 },     { CCI_REG8(0x3318), 0x62 },
> > +     { CCI_REG8(0x3348), 0xe0 },
> > +};
> > +
> > +static const struct cci_reg_sequence mode_1640x924[] =3D {
> > +     { CCI_REG8(0x0340), 0x03 },     { CCI_REG8(0x0341), 0xb2 },
> > +     { CCI_REG8(0x0342), 0x0d },     { CCI_REG8(0x0343), 0xd0 },
> > +     { CCI_REG8(0x0344), 0x00 },     { CCI_REG8(0x0345), 0x08 },
> > +     { CCI_REG8(0x0346), 0x01 },     { CCI_REG8(0x0347), 0x64 },
> > +     { CCI_REG8(0x0348), 0x0c },     { CCI_REG8(0x0349), 0xd7 },
> > +     { CCI_REG8(0x034a), 0x08 },     { CCI_REG8(0x034b), 0x9b },
> > +     { CCI_REG8(0x034c), 0x06 },     { CCI_REG8(0x034d), 0x68 },
> > +     { CCI_REG8(0x034e), 0x03 },     { CCI_REG8(0x034f), 0x9c },
> > +     { CCI_REG8(0x0381), 0x01 },     { CCI_REG8(0x0383), 0x03 },
> > +     { CCI_REG8(0x0385), 0x01 },     { CCI_REG8(0x0387), 0x03 },
> > +     { CCI_REG8(0x3033), 0x00 },     { CCI_REG8(0x303d), 0x10 },
> > +     { CCI_REG8(0x303e), 0x40 },     { CCI_REG8(0x3040), 0x08 },
> > +     { CCI_REG8(0x3041), 0x97 },     { CCI_REG8(0x3048), 0x01 },
> > +     { CCI_REG8(0x304c), 0x6f },     { CCI_REG8(0x304d), 0x03 },
> > +     { CCI_REG8(0x3064), 0x12 },     { CCI_REG8(0x3073), 0x00 },
> > +     { CCI_REG8(0x3074), 0x11 },     { CCI_REG8(0x3075), 0x11 },
> > +     { CCI_REG8(0x3076), 0x11 },     { CCI_REG8(0x3077), 0x11 },
> > +     { CCI_REG8(0x3079), 0x00 },     { CCI_REG8(0x307a), 0x00 },
> > +     { CCI_REG8(0x309b), 0x28 },     { CCI_REG8(0x309c), 0x13 },
> > +     { CCI_REG8(0x309e), 0x00 },     { CCI_REG8(0x30a0), 0x14 },
> > +     { CCI_REG8(0x30a1), 0x09 },     { CCI_REG8(0x30aa), 0x03 },
> > +     { CCI_REG8(0x30b2), 0x05 },     { CCI_REG8(0x30d5), 0x09 },
> > +     { CCI_REG8(0x30d6), 0x01 },     { CCI_REG8(0x30d7), 0x01 },
> > +     { CCI_REG8(0x30d8), 0x64 },     { CCI_REG8(0x30d9), 0x89 },
> > +     { CCI_REG8(0x30de), 0x02 },     { CCI_REG8(0x30df), 0x20 },
> > +     { CCI_REG8(0x3102), 0x08 },     { CCI_REG8(0x3103), 0x22 },
> > +     { CCI_REG8(0x3104), 0x20 },     { CCI_REG8(0x3105), 0x00 },
> > +     { CCI_REG8(0x3106), 0x87 },     { CCI_REG8(0x3107), 0x00 },
> > +     { CCI_REG8(0x3108), 0x03 },     { CCI_REG8(0x3109), 0x02 },
> > +     { CCI_REG8(0x310a), 0x03 },     { CCI_REG8(0x315c), 0x9c },
> > +     { CCI_REG8(0x315d), 0x9b },     { CCI_REG8(0x316e), 0x9d },
> > +     { CCI_REG8(0x316f), 0x9c },     { CCI_REG8(0x3318), 0x72 },
> > +     { CCI_REG8(0x3348), 0xe0 },
> > +};
> > +
> > +static const struct cci_reg_sequence mode_1640x1232[] =3D {
> > +     { CCI_REG8(0x0340), 0x04 },     { CCI_REG8(0x0341), 0xe6 },
> > +     { CCI_REG8(0x0342), 0x0d },     { CCI_REG8(0x0343), 0xd0 },
> > +     { CCI_REG8(0x0344), 0x00 },     { CCI_REG8(0x0345), 0x08 },
> > +     { CCI_REG8(0x0346), 0x00 },     { CCI_REG8(0x0347), 0x30 },
> > +     { CCI_REG8(0x0348), 0x0c },     { CCI_REG8(0x0349), 0xd7 },
> > +     { CCI_REG8(0x034a), 0x09 },     { CCI_REG8(0x034b), 0xcf },
> > +     { CCI_REG8(0x034c), 0x06 },     { CCI_REG8(0x034d), 0x68 },
> > +     { CCI_REG8(0x034e), 0x04 },     { CCI_REG8(0x034f), 0xd0 },
> > +     { CCI_REG8(0x0381), 0x01 },     { CCI_REG8(0x0383), 0x03 },
> > +     { CCI_REG8(0x0385), 0x01 },     { CCI_REG8(0x0387), 0x03 },
> > +     { CCI_REG8(0x3033), 0x00 },     { CCI_REG8(0x303d), 0x10 },
> > +     { CCI_REG8(0x303e), 0x40 },     { CCI_REG8(0x3040), 0x08 },
> > +     { CCI_REG8(0x3041), 0x97 },     { CCI_REG8(0x3048), 0x01 },
> > +     { CCI_REG8(0x304c), 0x6f },     { CCI_REG8(0x304d), 0x03 },
> > +     { CCI_REG8(0x3064), 0x12 },     { CCI_REG8(0x3073), 0x00 },
> > +     { CCI_REG8(0x3074), 0x11 },     { CCI_REG8(0x3075), 0x11 },
> > +     { CCI_REG8(0x3076), 0x11 },     { CCI_REG8(0x3077), 0x11 },
> > +     { CCI_REG8(0x3079), 0x00 },     { CCI_REG8(0x307a), 0x00 },
> > +     { CCI_REG8(0x309b), 0x28 },     { CCI_REG8(0x309c), 0x13 },
> > +     { CCI_REG8(0x309e), 0x00 },     { CCI_REG8(0x30a0), 0x14 },
> > +     { CCI_REG8(0x30a1), 0x09 },     { CCI_REG8(0x30aa), 0x03 },
> > +     { CCI_REG8(0x30b2), 0x05 },     { CCI_REG8(0x30d5), 0x09 },
> > +     { CCI_REG8(0x30d6), 0x01 },     { CCI_REG8(0x30d7), 0x01 },
> > +     { CCI_REG8(0x30d8), 0x64 },     { CCI_REG8(0x30d9), 0x89 },
> > +     { CCI_REG8(0x30de), 0x02 },     { CCI_REG8(0x30df), 0x20 },
> > +     { CCI_REG8(0x3102), 0x08 },     { CCI_REG8(0x3103), 0x22 },
> > +     { CCI_REG8(0x3104), 0x20 },     { CCI_REG8(0x3105), 0x00 },
> > +     { CCI_REG8(0x3106), 0x87 },     { CCI_REG8(0x3107), 0x00 },
> > +     { CCI_REG8(0x3108), 0x03 },     { CCI_REG8(0x3109), 0x02 },
> > +     { CCI_REG8(0x310a), 0x03 },     { CCI_REG8(0x315c), 0x9c },
> > +     { CCI_REG8(0x315d), 0x9b },     { CCI_REG8(0x316e), 0x9d },
> > +     { CCI_REG8(0x316f), 0x9c },     { CCI_REG8(0x3318), 0x72 },
> > +     { CCI_REG8(0x3348), 0xe0 },
> > +};
> > +
> > +static const struct cci_reg_sequence mode_1952x1098[] =3D {
> > +     { CCI_REG8(0x0340), 0x07 },     { CCI_REG8(0x0341), 0x5c },
> > +     { CCI_REG8(0x0342), 0x0d },     { CCI_REG8(0x0343), 0xac },
> > +     { CCI_REG8(0x0344), 0x00 },     { CCI_REG8(0x0345), 0x16 },
> > +     { CCI_REG8(0x0346), 0x01 },     { CCI_REG8(0x0347), 0x6e },
> > +     { CCI_REG8(0x0348), 0x0c },     { CCI_REG8(0x0349), 0xcb },
> > +     { CCI_REG8(0x034a), 0x08 },     { CCI_REG8(0x034b), 0x93 },
> > +     { CCI_REG8(0x034c), 0x07 },     { CCI_REG8(0x034d), 0xa0 },
> > +     { CCI_REG8(0x034e), 0x04 },     { CCI_REG8(0x034f), 0x4a },
> > +     { CCI_REG8(0x0381), 0x01 },     { CCI_REG8(0x0383), 0x01 },
> > +     { CCI_REG8(0x0385), 0x01 },     { CCI_REG8(0x0387), 0x01 },
> > +     { CCI_REG8(0x3033), 0x00 },     { CCI_REG8(0x303d), 0x10 },
> > +     { CCI_REG8(0x303e), 0x00 },     { CCI_REG8(0x3040), 0x08 },
> > +     { CCI_REG8(0x3041), 0x91 },     { CCI_REG8(0x3048), 0x00 },
> > +     { CCI_REG8(0x304c), 0x67 },     { CCI_REG8(0x304d), 0x03 },
> > +     { CCI_REG8(0x3064), 0x10 },     { CCI_REG8(0x3073), 0xa0 },
> > +     { CCI_REG8(0x3074), 0x12 },     { CCI_REG8(0x3075), 0x12 },
> > +     { CCI_REG8(0x3076), 0x12 },     { CCI_REG8(0x3077), 0x11 },
> > +     { CCI_REG8(0x3079), 0x0a },     { CCI_REG8(0x307a), 0x0a },
> > +     { CCI_REG8(0x309b), 0x60 },     { CCI_REG8(0x309e), 0x04 },
> > +     { CCI_REG8(0x30a0), 0x15 },     { CCI_REG8(0x30a1), 0x08 },
> > +     { CCI_REG8(0x30aa), 0x03 },     { CCI_REG8(0x30b2), 0x05 },
> > +     { CCI_REG8(0x30d5), 0x20 },     { CCI_REG8(0x30d6), 0x85 },
> > +     { CCI_REG8(0x30d7), 0x2a },     { CCI_REG8(0x30d8), 0x64 },
> > +     { CCI_REG8(0x30d9), 0x89 },     { CCI_REG8(0x30de), 0x00 },
> > +     { CCI_REG8(0x30df), 0x21 },     { CCI_REG8(0x3102), 0x08 },
> > +     { CCI_REG8(0x3103), 0x1d },     { CCI_REG8(0x3104), 0x1e },
> > +     { CCI_REG8(0x3105), 0x00 },     { CCI_REG8(0x3106), 0x74 },
> > +     { CCI_REG8(0x3107), 0x00 },     { CCI_REG8(0x3108), 0x03 },
> > +     { CCI_REG8(0x3109), 0x02 },     { CCI_REG8(0x310a), 0x03 },
> > +     { CCI_REG8(0x315c), 0x37 },     { CCI_REG8(0x315d), 0x36 },
> > +     { CCI_REG8(0x316e), 0x38 },     { CCI_REG8(0x316f), 0x37 },
> > +     { CCI_REG8(0x3318), 0x63 },     { CCI_REG8(0x3348), 0xA0 },
> > +};
> > +
> > +static const struct cci_reg_sequence mode_2100x1200[] =3D {
> > +     { CCI_REG8(0x0340), 0x04 },     { CCI_REG8(0x0341), 0xec },
> > +     { CCI_REG8(0x0342), 0x0d },     { CCI_REG8(0x0343), 0xd0 },
> > +     { CCI_REG8(0x0344), 0x02 },     { CCI_REG8(0x0345), 0x56 },
> > +     { CCI_REG8(0x0346), 0x02 },     { CCI_REG8(0x0347), 0xa8 },
> > +     { CCI_REG8(0x0348), 0x0a },     { CCI_REG8(0x0349), 0x89 },
> > +     { CCI_REG8(0x034a), 0x07 },     { CCI_REG8(0x034b), 0x57 },
> > +     { CCI_REG8(0x034c), 0x08 },     { CCI_REG8(0x034d), 0x34 },
> > +     { CCI_REG8(0x034e), 0x04 },     { CCI_REG8(0x034f), 0xb0 },
> > +     { CCI_REG8(0x0381), 0x01 },     { CCI_REG8(0x0383), 0x01 },
> > +     { CCI_REG8(0x0385), 0x01 },     { CCI_REG8(0x0387), 0x01 },
> > +     { CCI_REG8(0x3033), 0x00 },     { CCI_REG8(0x303d), 0x10 },
> > +     { CCI_REG8(0x303e), 0x40 },     { CCI_REG8(0x3040), 0x08 },
> > +     { CCI_REG8(0x3041), 0x97 },     { CCI_REG8(0x3048), 0x00 },
> > +     { CCI_REG8(0x304c), 0x6f },     { CCI_REG8(0x304d), 0x03 },
> > +     { CCI_REG8(0x3064), 0x12 },     { CCI_REG8(0x3073), 0x00 },
> > +     { CCI_REG8(0x3074), 0x11 },     { CCI_REG8(0x3075), 0x11 },
> > +     { CCI_REG8(0x3076), 0x11 },     { CCI_REG8(0x3077), 0x11 },
> > +     { CCI_REG8(0x3079), 0x00 },     { CCI_REG8(0x307a), 0x00 },
> > +     { CCI_REG8(0x309b), 0x20 },     { CCI_REG8(0x309c), 0x13 },
> > +     { CCI_REG8(0x309e), 0x00 },     { CCI_REG8(0x30a0), 0x14 },
> > +     { CCI_REG8(0x30a1), 0x08 },     { CCI_REG8(0x30aa), 0x03 },
> > +     { CCI_REG8(0x30b2), 0x07 },     { CCI_REG8(0x30d5), 0x00 },
> > +     { CCI_REG8(0x30d6), 0x85 },     { CCI_REG8(0x30d7), 0x2a },
> > +     { CCI_REG8(0x30d8), 0x64 },     { CCI_REG8(0x30d9), 0x89 },
> > +     { CCI_REG8(0x30de), 0x00 },     { CCI_REG8(0x30df), 0x20 },
> > +     { CCI_REG8(0x3102), 0x08 },     { CCI_REG8(0x3103), 0x22 },
> > +     { CCI_REG8(0x3104), 0x20 },     { CCI_REG8(0x3105), 0x00 },
> > +     { CCI_REG8(0x3106), 0x87 },     { CCI_REG8(0x3107), 0x00 },
> > +     { CCI_REG8(0x3108), 0x03 },     { CCI_REG8(0x3109), 0x02 },
> > +     { CCI_REG8(0x310a), 0x03 },     { CCI_REG8(0x315c), 0x9c },
> > +     { CCI_REG8(0x315d), 0x9b },     { CCI_REG8(0x316e), 0x9d },
> > +     { CCI_REG8(0x316f), 0x9c },     { CCI_REG8(0x3318), 0x62 },
> > +     { CCI_REG8(0x3348), 0xe0 },
> > +};
> > +
> > +static const struct cci_reg_sequence mode_3280x1098[] =3D {
> > +     { CCI_REG8(0x0340), 0x04 },     { CCI_REG8(0x0341), 0x6a },
> > +     { CCI_REG8(0x0342), 0x0d },     { CCI_REG8(0x0343), 0xac },
> > +     { CCI_REG8(0x0344), 0x00 },     { CCI_REG8(0x0345), 0x08 },
> > +     { CCI_REG8(0x0346), 0x01 },     { CCI_REG8(0x0347), 0xf6 },
> > +     { CCI_REG8(0x0348), 0x0c },     { CCI_REG8(0x0349), 0xd7 },
> > +     { CCI_REG8(0x034a), 0x08 },     { CCI_REG8(0x034b), 0x0b },
> > +     { CCI_REG8(0x034c), 0x0c },     { CCI_REG8(0x034d), 0xd0 },
> > +     { CCI_REG8(0x034e), 0x04 },     { CCI_REG8(0x034f), 0x4a },
> > +     { CCI_REG8(0x0381), 0x01 },     { CCI_REG8(0x0383), 0x01 },
> > +     { CCI_REG8(0x0385), 0x01 },     { CCI_REG8(0x0387), 0x01 },
> > +     { CCI_REG8(0x3033), 0x00 },     { CCI_REG8(0x303d), 0x10 },
> > +     { CCI_REG8(0x303e), 0x40 },     { CCI_REG8(0x3040), 0x08 },
> > +     { CCI_REG8(0x3041), 0x93 },     { CCI_REG8(0x3048), 0x00 },
> > +     { CCI_REG8(0x304c), 0x67 },     { CCI_REG8(0x304d), 0x03 },
> > +     { CCI_REG8(0x3064), 0x12 },     { CCI_REG8(0x3073), 0xe0 },
> > +     { CCI_REG8(0x3074), 0x12 },     { CCI_REG8(0x3075), 0x12 },
> > +     { CCI_REG8(0x3076), 0x12 },     { CCI_REG8(0x3077), 0x12 },
> > +     { CCI_REG8(0x3079), 0x2a },     { CCI_REG8(0x307a), 0x0a },
> > +     { CCI_REG8(0x309b), 0x60 },     { CCI_REG8(0x309e), 0x04 },
> > +     { CCI_REG8(0x30a0), 0x15 },     { CCI_REG8(0x30a1), 0x08 },
> > +     { CCI_REG8(0x30aa), 0x03 },     { CCI_REG8(0x30b2), 0x05 },
> > +     { CCI_REG8(0x30d5), 0x00 },     { CCI_REG8(0x30d6), 0x85 },
> > +     { CCI_REG8(0x30d7), 0x2a },     { CCI_REG8(0x30d8), 0x64 },
> > +     { CCI_REG8(0x30d9), 0x89 },     { CCI_REG8(0x30de), 0x00 },
> > +     { CCI_REG8(0x30df), 0x20 },     { CCI_REG8(0x3102), 0x08 },
> > +     { CCI_REG8(0x3103), 0x1d },     { CCI_REG8(0x3104), 0x1e },
> > +     { CCI_REG8(0x3105), 0x00 },     { CCI_REG8(0x3106), 0x74 },
> > +     { CCI_REG8(0x3107), 0x00 },     { CCI_REG8(0x3108), 0x03 },
> > +     { CCI_REG8(0x3109), 0x02 },     { CCI_REG8(0x310a), 0x03 },
> > +     { CCI_REG8(0x315c), 0x37 },     { CCI_REG8(0x315d), 0x36 },
> > +     { CCI_REG8(0x316e), 0x38 },     { CCI_REG8(0x316f), 0x37 },
> > +     { CCI_REG8(0x3318), 0x63 },     { CCI_REG8(0x3348), 0xe0 },
> > +};
> > +
> > +static const struct cci_reg_sequence mode_3280x1848[] =3D {
> > +     { CCI_REG8(0x0340), 0x07 },     { CCI_REG8(0x0341), 0x52 },
> > +     { CCI_REG8(0x0342), 0x0d },     { CCI_REG8(0x0343), 0xd0 },
> > +     { CCI_REG8(0x0344), 0x00 },     { CCI_REG8(0x0345), 0x08 },
> > +     { CCI_REG8(0x0346), 0x01 },     { CCI_REG8(0x0347), 0x64 },
> > +     { CCI_REG8(0x0348), 0x0c },     { CCI_REG8(0x0349), 0xd7 },
> > +     { CCI_REG8(0x034a), 0x08 },     { CCI_REG8(0x034b), 0x9b },
> > +     { CCI_REG8(0x034c), 0x0c },     { CCI_REG8(0x034d), 0xd0 },
> > +     { CCI_REG8(0x034e), 0x07 },     { CCI_REG8(0x034f), 0x38 },
> > +     { CCI_REG8(0x0381), 0x01 },     { CCI_REG8(0x0383), 0x01 },
> > +     { CCI_REG8(0x0385), 0x01 },     { CCI_REG8(0x0387), 0x01 },
> > +     { CCI_REG8(0x3033), 0x00 },     { CCI_REG8(0x303d), 0x00 },
> > +     { CCI_REG8(0x303e), 0x41 },     { CCI_REG8(0x3040), 0x08 },
> > +     { CCI_REG8(0x3041), 0x97 },     { CCI_REG8(0x3048), 0x00 },
> > +     { CCI_REG8(0x304c), 0x6f },     { CCI_REG8(0x304d), 0x03 },
> > +     { CCI_REG8(0x3064), 0x12 },     { CCI_REG8(0x3073), 0x00 },
> > +     { CCI_REG8(0x3074), 0x11 },     { CCI_REG8(0x3075), 0x11 },
> > +     { CCI_REG8(0x3076), 0x11 },     { CCI_REG8(0x3077), 0x11 },
> > +     { CCI_REG8(0x3079), 0x00 },     { CCI_REG8(0x307a), 0x00 },
> > +     { CCI_REG8(0x309b), 0x20 },     { CCI_REG8(0x309c), 0x13 },
> > +     { CCI_REG8(0x309e), 0x00 },     { CCI_REG8(0x30a0), 0x14 },
> > +     { CCI_REG8(0x30a1), 0x08 },     { CCI_REG8(0x30aa), 0x03 },
> > +     { CCI_REG8(0x30b2), 0x07 },     { CCI_REG8(0x30d5), 0x00 },
> > +     { CCI_REG8(0x30d6), 0x85 },     { CCI_REG8(0x30d7), 0x2a },
> > +     { CCI_REG8(0x30d8), 0x64 },     { CCI_REG8(0x30d9), 0x89 },
> > +     { CCI_REG8(0x30de), 0x00 },     { CCI_REG8(0x30df), 0x20 },
> > +     { CCI_REG8(0x3102), 0x10 },     { CCI_REG8(0x3103), 0x44 },
> > +     { CCI_REG8(0x3104), 0x40 },     { CCI_REG8(0x3105), 0x00 },
> > +     { CCI_REG8(0x3106), 0x0d },     { CCI_REG8(0x3107), 0x01 },
> > +     { CCI_REG8(0x3108), 0x09 },     { CCI_REG8(0x3109), 0x08 },
> > +     { CCI_REG8(0x310a), 0x0f },     { CCI_REG8(0x315c), 0x5d },
> > +     { CCI_REG8(0x315d), 0x5c },     { CCI_REG8(0x316e), 0x5e },
> > +     { CCI_REG8(0x316f), 0x5d },     { CCI_REG8(0x3318), 0x60 },
> > +     { CCI_REG8(0x3348), 0xe0 },
> > +};
> > +
> > +static const struct cci_reg_sequence mode_3280x2464[] =3D {
> > +     { CCI_REG8(0x0340), 0x09 },     { CCI_REG8(0x0341), 0xba },
> > +     { CCI_REG8(0x0342), 0x0d },     { CCI_REG8(0x0343), 0xd0 },
> > +     { CCI_REG8(0x0344), 0x00 },     { CCI_REG8(0x0345), 0x08 },
> > +     { CCI_REG8(0x0346), 0x00 },     { CCI_REG8(0x0347), 0x30 },
> > +     { CCI_REG8(0x0348), 0x0c },     { CCI_REG8(0x0349), 0xd7 },
> > +     { CCI_REG8(0x034a), 0x09 },     { CCI_REG8(0x034b), 0xcf },
> > +     { CCI_REG8(0x034c), 0x0c },     { CCI_REG8(0x034d), 0xd0 },
> > +     { CCI_REG8(0x034e), 0x09 },     { CCI_REG8(0x034f), 0xa0 },
> > +     { CCI_REG8(0x0381), 0x01 },     { CCI_REG8(0x0383), 0x01 },
> > +     { CCI_REG8(0x0385), 0x01 },     { CCI_REG8(0x0387), 0x01 },
> > +     { CCI_REG8(0x3033), 0x00 },     { CCI_REG8(0x303d), 0x00 },
> > +     { CCI_REG8(0x303e), 0x41 },     { CCI_REG8(0x3040), 0x08 },
> > +     { CCI_REG8(0x3041), 0x97 },     { CCI_REG8(0x3048), 0x00 },
> > +     { CCI_REG8(0x304c), 0x6f },     { CCI_REG8(0x304d), 0x03 },
> > +     { CCI_REG8(0x3064), 0x12 },     { CCI_REG8(0x3073), 0x00 },
> > +     { CCI_REG8(0x3074), 0x11 },     { CCI_REG8(0x3075), 0x11 },
> > +     { CCI_REG8(0x3076), 0x11 },     { CCI_REG8(0x3077), 0x11 },
> > +     { CCI_REG8(0x3079), 0x00 },     { CCI_REG8(0x307a), 0x00 },
> > +     { CCI_REG8(0x309b), 0x20 },     { CCI_REG8(0x309c), 0x13 },
> > +     { CCI_REG8(0x309e), 0x00 },     { CCI_REG8(0x30a0), 0x14 },
> > +     { CCI_REG8(0x30a1), 0x08 },     { CCI_REG8(0x30aa), 0x03 },
> > +     { CCI_REG8(0x30b2), 0x07 },     { CCI_REG8(0x30d5), 0x00 },
> > +     { CCI_REG8(0x30d6), 0x85 },     { CCI_REG8(0x30d7), 0x2a },
> > +     { CCI_REG8(0x30d8), 0x64 },     { CCI_REG8(0x30d9), 0x89 },
> > +     { CCI_REG8(0x30de), 0x00 },     { CCI_REG8(0x30df), 0x20 },
> > +     { CCI_REG8(0x3102), 0x10 },     { CCI_REG8(0x3103), 0x44 },
> > +     { CCI_REG8(0x3104), 0x40 },     { CCI_REG8(0x3105), 0x00 },
> > +     { CCI_REG8(0x3106), 0x0d },     { CCI_REG8(0x3107), 0x01 },
> > +     { CCI_REG8(0x3108), 0x09 },     { CCI_REG8(0x3109), 0x08 },
> > +     { CCI_REG8(0x310a), 0x0f },     { CCI_REG8(0x315c), 0x5d },
> > +     { CCI_REG8(0x315d), 0x5c },     { CCI_REG8(0x316e), 0x5e },
> > +     { CCI_REG8(0x316f), 0x5d },     { CCI_REG8(0x3318), 0x60 },
> > +     { CCI_REG8(0x3348), 0xe0 },
> > +};
> > +
> > +static const struct imx111_mode imx111_modes[] =3D {
> > +     [IMX111_MODE_3280x2464] =3D {
> > +             .width =3D 3280,
> > +             .height =3D 2464,
> > +             .reg_list =3D {
> > +                     .regs =3D mode_3280x2464,
> > +                     .num_of_regs =3D ARRAY_SIZE(mode_3280x2464),
> > +             },
> > +     },
> > +     [IMX111_MODE_3280x1848] =3D {
> > +             .width =3D 3280,
> > +             .height =3D 1848,
> > +             .reg_list =3D {
> > +                     .regs =3D mode_3280x1848,
> > +                     .num_of_regs =3D ARRAY_SIZE(mode_3280x1848),
> > +             },
> > +     },
> > +     [IMX111_MODE_3280x1098] =3D {
> > +             .width =3D 3280,
> > +             .height =3D 1098,
> > +             .reg_list =3D {
> > +                     .regs =3D mode_3280x1098,
> > +                     .num_of_regs =3D ARRAY_SIZE(mode_3280x1098),
> > +             },
> > +     },
> > +     [IMX111_MODE_2100x1200] =3D {
> > +             .width =3D 2100,
> > +             .height =3D 1200,
> > +             .reg_list =3D {
> > +                     .regs =3D mode_2100x1200,
> > +                     .num_of_regs =3D ARRAY_SIZE(mode_2100x1200),
> > +             },
> > +     },
> > +     [IMX111_MODE_1952x1098] =3D {
> > +             .width =3D 1952,
> > +             .height =3D 1098,
> > +             .reg_list =3D {
> > +                     .regs =3D mode_1952x1098,
> > +                     .num_of_regs =3D ARRAY_SIZE(mode_1952x1098),
> > +             },
> > +     },
> > +     [IMX111_MODE_1920x1080] =3D {
> > +             .width =3D 1920,
> > +             .height =3D 1080,
> > +             .reg_list =3D {
> > +                     .regs =3D mode_1952x1098,
> > +                     .num_of_regs =3D ARRAY_SIZE(mode_1952x1098),
> > +             },
> > +     },
> > +     [IMX111_MODE_1640x1232] =3D {
> > +             .width =3D 1640,
> > +             .height =3D 1232,
> > +             .reg_list =3D {
> > +                     .regs =3D mode_1640x1232,
> > +                     .num_of_regs =3D ARRAY_SIZE(mode_1640x1232),
> > +             },
> > +     },
> > +     [IMX111_MODE_1440x1080] =3D {
> > +             .width =3D 1440,
> > +             .height =3D 1080,
> > +             .reg_list =3D {
> > +                     .regs =3D mode_1640x1232,
> > +                     .num_of_regs =3D ARRAY_SIZE(mode_1640x1232),
> > +             },
> > +     },
> > +     [IMX111_MODE_1640x924] =3D {
> > +             .width =3D 1640,
> > +             .height =3D 924,
> > +             .reg_list =3D {
> > +                     .regs =3D mode_1640x924,
> > +                     .num_of_regs =3D ARRAY_SIZE(mode_1640x924),
> > +             },
> > +     },
> > +     [IMX111_MODE_1308x736] =3D {
> > +             .width =3D 1308,
> > +             .height =3D 736,
> > +             .reg_list =3D {
> > +                     .regs =3D mode_1308x736,
> > +                     .num_of_regs =3D ARRAY_SIZE(mode_1308x736),
> > +             },
> > +     },
> > +     [IMX111_MODE_1280x720] =3D {
> > +             .width =3D 1280,
> > +             .height =3D 720,
> > +             .reg_list =3D {
> > +                     .regs =3D mode_1308x736,
> > +                     .num_of_regs =3D ARRAY_SIZE(mode_1308x736),
> > +             },
> > +     },
> > +     [IMX111_MODE_820x614] =3D {
> > +             .width =3D 820,
> > +             .height =3D 614,
> > +             .reg_list =3D {
> > +                     .regs =3D mode_820x614,
> > +                     .num_of_regs =3D ARRAY_SIZE(mode_820x614),
> > +             },
> > +     },
> > +     [IMX111_MODE_640x480] =3D {
> > +             .width =3D 640,
> > +             .height =3D 480,
> > +             .reg_list =3D {
> > +                     .regs =3D mode_820x614,
> > +                     .num_of_regs =3D ARRAY_SIZE(mode_820x614),
> > +             },
> > +     },
> > +};
> > +
> > +static inline struct imx111 *sd_to_imx111(struct v4l2_subdev *sd)
> > +{
> > +     return container_of(sd, struct imx111, sd);
>
> container_of_const(), please.
>
> > +}
> > +
> > +static inline struct imx111 *ctrl_to_imx111(struct v4l2_ctrl *ctrl)
> > +{
> > +     return container_of(ctrl->handler, struct imx111, hdl);
> > +}
> > +
> > +static u8 to_settle_delay(u64 extclk_rate)
> > +{
> > +     u64 extclk_mhz =3D div_u64(extclk_rate, MEGA);
> > +
> > +     return DIV_ROUND_UP(IMX111_PLL_SETTLING_TIME_DEFAULT * extclk_mhz=
 - 63, 64);
> > +}
> > +
> > +static u32 imx111_get_format_code(struct imx111 *sensor, u32 code, boo=
l test)
> > +{
> > +     u32 i;
> > +
> > +     for (i =3D 0; i < ARRAY_SIZE(imx111_mbus_formats); i++)
> > +             if (imx111_mbus_formats[i] =3D=3D code)
> > +                     break;
> > +
> > +     if (i >=3D ARRAY_SIZE(imx111_mbus_formats))
> > +             i =3D 0;
> > +
> > +     if (test)
> > +             return imx111_mbus_formats[i];
> > +
> > +     i =3D (i & ~3) | (sensor->vflip->val ? 2 : 0) |
> > +         (sensor->hflip->val ? 1 : 0);
> > +
> > +     return imx111_mbus_formats[i];
> > +}
> > +
> > +static u32 imx111_get_format_bpp(const struct v4l2_mbus_framefmt *form=
at)
> > +{
> > +     switch (format->code) {
> > +     case MEDIA_BUS_FMT_SRGGB8_1X8:
> > +     case MEDIA_BUS_FMT_SGRBG8_1X8:
> > +     case MEDIA_BUS_FMT_SGBRG8_1X8:
> > +     case MEDIA_BUS_FMT_SBGGR8_1X8:
> > +             return 8;
> > +
> > +     case MEDIA_BUS_FMT_SRGGB10_1X10:
> > +     case MEDIA_BUS_FMT_SGRBG10_1X10:
> > +     case MEDIA_BUS_FMT_SGBRG10_1X10:
> > +     case MEDIA_BUS_FMT_SBGGR10_1X10:
> > +     default:
> > +             return 10;
> > +     }
> > +}
> > +
> > +static int imx111_update_digital_gain(struct imx111 *sensor, u32 val)
> > +{
> > +     int ret =3D 0;
> > +
> > +     cci_update_bits(sensor->regmap, IMX111_GROUP_WRITE, IMX111_GROUP_=
WRITE_ON,
> > +                     IMX111_GROUP_WRITE_ON, NULL);
>
> Missing error handling.
>
> > +
> > +     cci_write(sensor->regmap, IMX111_REG_DIG_GAIN_GREENR, val, &ret);
> > +     cci_write(sensor->regmap, IMX111_REG_DIG_GAIN_RED, val, &ret);
> > +     cci_write(sensor->regmap, IMX111_REG_DIG_GAIN_BLUE, val, &ret);
> > +     cci_write(sensor->regmap, IMX111_REG_DIG_GAIN_GREENB, val, &ret);
> > +
> > +     cci_update_bits(sensor->regmap, IMX111_GROUP_WRITE, IMX111_GROUP_=
WRITE_ON,
> > +                     0, NULL);
>
> Ditto.
>
> > +
> > +     return ret;
> > +}
> > +
> > +static int imx111_set_ctrl(struct v4l2_ctrl *ctrl)
> > +{
> > +     struct imx111 *sensor =3D ctrl_to_imx111(ctrl);
> > +     struct device *dev =3D regmap_get_device(sensor->regmap);
> > +     int ret =3D 0;
> > +
> > +     /*
> > +      * Applying V4L2 control value only happens
> > +      * when power is up for streaming
> > +      */
> > +     if (!pm_runtime_get_if_in_use(dev))
> > +             return 0;
> > +
> > +     switch (ctrl->id) {
> > +     case V4L2_CID_ANALOGUE_GAIN:
> > +             cci_write(sensor->regmap, IMX111_REG_ANALOG_GAIN, ctrl->v=
al, &ret);
> > +             break;
> > +     case V4L2_CID_DIGITAL_GAIN:
> > +             ret =3D imx111_update_digital_gain(sensor, ctrl->val);
> > +             break;
> > +     case V4L2_CID_EXPOSURE:
> > +             cci_update_bits(sensor->regmap, IMX111_GROUP_WRITE, IMX11=
1_GROUP_WRITE_ON,
> > +                             IMX111_GROUP_WRITE_ON, NULL);
> > +             cci_write(sensor->regmap, IMX111_INTEGRATION_TIME, ctrl->=
val, NULL);
> > +             cci_update_bits(sensor->regmap, IMX111_GROUP_WRITE, IMX11=
1_GROUP_WRITE_ON,
> > +                             0, NULL);
> > +             break;
> > +     case V4L2_CID_HFLIP:
> > +     case V4L2_CID_VFLIP:
> > +             cci_write(sensor->regmap, IMX111_IMAGE_ORIENTATION,
> > +                       sensor->hflip->val | sensor->vflip->val << 1, &=
ret);
> > +             break;
> > +     case V4L2_CID_TEST_PATTERN:
> > +             cci_write(sensor->regmap, IMX111_TEST_PATTERN, ctrl->val,=
 &ret);
> > +             break;
> > +     case V4L2_CID_TEST_PATTERN_RED:
> > +             cci_update_bits(sensor->regmap, IMX111_GROUP_WRITE, IMX11=
1_GROUP_WRITE_ON,
> > +                             IMX111_GROUP_WRITE_ON, NULL);
> > +             cci_write(sensor->regmap, IMX111_SOLID_COLOR_RED, ctrl->v=
al, &ret);
> > +             cci_update_bits(sensor->regmap, IMX111_GROUP_WRITE, IMX11=
1_GROUP_WRITE_ON,
> > +                             0, NULL);
> > +             break;
> > +     case V4L2_CID_TEST_PATTERN_GREENR:
> > +             cci_update_bits(sensor->regmap, IMX111_GROUP_WRITE, IMX11=
1_GROUP_WRITE_ON,
> > +                             IMX111_GROUP_WRITE_ON, NULL);
> > +             cci_write(sensor->regmap, IMX111_SOLID_COLOR_GR, ctrl->va=
l, &ret);
> > +             cci_update_bits(sensor->regmap, IMX111_GROUP_WRITE, IMX11=
1_GROUP_WRITE_ON,
> > +                             0, NULL);
> > +             break;
> > +     case V4L2_CID_TEST_PATTERN_BLUE:
> > +             cci_update_bits(sensor->regmap, IMX111_GROUP_WRITE, IMX11=
1_GROUP_WRITE_ON,
> > +                             IMX111_GROUP_WRITE_ON, NULL);
> > +             cci_write(sensor->regmap, IMX111_SOLID_COLOR_BLUE, ctrl->=
val, &ret);
> > +             cci_update_bits(sensor->regmap, IMX111_GROUP_WRITE, IMX11=
1_GROUP_WRITE_ON,
> > +                             0, NULL);
> > +             break;
> > +     case V4L2_CID_TEST_PATTERN_GREENB:
> > +             cci_update_bits(sensor->regmap, IMX111_GROUP_WRITE, IMX11=
1_GROUP_WRITE_ON,
> > +                             IMX111_GROUP_WRITE_ON, NULL);
> > +             cci_write(sensor->regmap, IMX111_SOLID_COLOR_GB, ctrl->va=
l, &ret);
> > +             cci_update_bits(sensor->regmap, IMX111_GROUP_WRITE, IMX11=
1_GROUP_WRITE_ON,
> > +                             0, NULL);
> > +             break;
> > +     default:
> > +             ret =3D -EINVAL;
> > +     }
> > +
> > +     pm_runtime_mark_last_busy(dev);
>
> You can drop this now (and elsewhere in driver code, too).
>
> > +     pm_runtime_put_autosuspend(dev);
> > +
> > +     return ret;
> > +}
> > +
> > +static const struct v4l2_ctrl_ops imx111_ctrl_ops =3D {
> > +     .s_ctrl =3D imx111_set_ctrl,
> > +};
> > +
> > +static const char * const test_pattern_menu[] =3D {
> > +     "Disabled",
> > +     "Solid Color Fill",
> > +     "Standard Color Bars",
> > +     "Fade To Grey Color Bars",
> > +     "Pseudorandom data",
> > +};
> > +
> > +static int imx111_init_controls(struct imx111 *sensor)
> > +{
> > +     const struct v4l2_ctrl_ops *ops =3D &imx111_ctrl_ops;
> > +     struct device *dev =3D regmap_get_device(sensor->regmap);
> > +     struct v4l2_fwnode_device_properties props;
> > +     struct v4l2_subdev *sd =3D &sensor->sd;
> > +     struct v4l2_ctrl_handler *hdl =3D &sensor->hdl;
> > +     s64 pixel_rate_min, pixel_rate_max;
> > +     int i, ret;
> > +
> > +     ret =3D v4l2_fwnode_device_parse(dev, &props);
> > +     if (ret < 0)
> > +             return ret;
> > +
> > +     ret =3D v4l2_ctrl_handler_init(hdl, 13);
> > +     if (ret)
> > +             return ret;
> > +
> > +     pixel_rate_min =3D div_u64(sensor->pixel_clk_raw, 2 * IMX111_DATA=
_DEPTH_RAW10);
> > +     pixel_rate_max =3D div_u64(sensor->pixel_clk_raw, 2 * IMX111_DATA=
_DEPTH_RAW8);
> > +     sensor->pixel_rate =3D v4l2_ctrl_new_std(hdl, NULL, V4L2_CID_PIXE=
L_RATE,
> > +                                            pixel_rate_min, pixel_rate=
_max,
> > +                                            1, div_u64(sensor->pixel_c=
lk_raw,
> > +                                            2 * sensor->data_depth));
> > +
> > +     sensor->link_freq =3D v4l2_ctrl_new_int_menu(hdl, NULL, V4L2_CID_=
LINK_FREQ,
> > +                                                0, 0, &sensor->default=
_link_freq);
> > +     if (sensor->link_freq)
> > +             sensor->link_freq->flags |=3D V4L2_CTRL_FLAG_READ_ONLY;
> > +
> > +     v4l2_ctrl_new_std(hdl, ops, V4L2_CID_ANALOGUE_GAIN,
> > +                       IMX111_ANA_GAIN_MIN, IMX111_ANA_GAIN_MAX,
> > +                       IMX111_ANA_GAIN_STEP, IMX111_ANA_GAIN_DEFAULT);
> > +
> > +     v4l2_ctrl_new_std(hdl, ops, V4L2_CID_DIGITAL_GAIN,
> > +                       IMX111_DGTL_GAIN_MIN, IMX111_DGTL_GAIN_MAX,
> > +                       IMX111_DGTL_GAIN_STEP, IMX111_DGTL_GAIN_DEFAULT=
);
> > +
> > +     sensor->hflip =3D v4l2_ctrl_new_std(hdl, ops, V4L2_CID_HFLIP, 0, =
1, 1, 0);
> > +     if (sensor->hflip)
> > +             sensor->hflip->flags |=3D V4L2_CTRL_FLAG_MODIFY_LAYOUT;
> > +
> > +     sensor->vflip =3D v4l2_ctrl_new_std(hdl, ops, V4L2_CID_VFLIP, 0, =
1, 1, 0);
> > +     if (sensor->vflip)
> > +             sensor->vflip->flags |=3D V4L2_CTRL_FLAG_MODIFY_LAYOUT;
>
> Could you also add VBLANK and HBLANK controls, please?
>

I may try to, but since no datasheet is available, my suggestion may
be quite arbitrary. In this iteration v/hblank are considered to be 0.

> > +
> > +     /*
> > +      * The maximum coarse integration time is the frame length in lin=
es
> > +      * minus five.
> > +      */
> > +     sensor->exposure =3D v4l2_ctrl_new_std(hdl, ops, V4L2_CID_EXPOSUR=
E,
> > +                                          IMX111_INTEGRATION_TIME_MIN,
> > +                                          IMX111_PIXEL_ARRAY_HEIGHT - =
5,
> > +                                          IMX111_INTEGRATION_TIME_STEP=
,
> > +                                          IMX111_PIXEL_ARRAY_HEIGHT - =
5);
> > +
> > +     v4l2_ctrl_new_fwnode_properties(hdl, ops, &props);
> > +
> > +     v4l2_ctrl_new_std_menu_items(hdl, ops, V4L2_CID_TEST_PATTERN,
> > +                                  ARRAY_SIZE(test_pattern_menu) - 1, 0=
, 0,
> > +                                  test_pattern_menu);
> > +     for (i =3D 0; i < 4; i++) {
> > +             /*
> > +              * The assumption is that
> > +              * V4L2_CID_TEST_PATTERN_GREENR =3D=3D V4L2_CID_TEST_PATT=
ERN_RED + 1
> > +              * V4L2_CID_TEST_PATTERN_BLUE   =3D=3D V4L2_CID_TEST_PATT=
ERN_RED + 2
> > +              * V4L2_CID_TEST_PATTERN_GREENB =3D=3D V4L2_CID_TEST_PATT=
ERN_RED + 3
> > +              */
> > +             v4l2_ctrl_new_std(hdl, ops, V4L2_CID_TEST_PATTERN_RED + i=
,
> > +                               IMX111_TESTP_COLOUR_MIN, IMX111_TESTP_C=
OLOUR_MAX,
> > +                               IMX111_TESTP_COLOUR_STEP, IMX111_TESTP_=
COLOUR_MAX);
> > +             /* The "Solid color" pattern is white by default */
> > +     }
> > +
> > +     if (hdl->error)
> > +             return hdl->error;
> > +
> > +     sd->ctrl_handler =3D hdl;
> > +
> > +     return 0;
> > +};
> > +
> > +static int imx111_start_streaming(struct imx111 *sensor)
> > +{
> > +     struct device *dev =3D regmap_get_device(sensor->regmap);
> > +     const struct imx111_mode *mode =3D sensor->cur_mode;
> > +     int ret;
> > +
> > +     /* Apply default values of current mode */
> > +     ret =3D cci_multi_reg_write(sensor->regmap, mode->reg_list.regs,
> > +                               mode->reg_list.num_of_regs, NULL);
> > +     if (ret < 0) {
> > +             dev_err(dev, "Failed to initialize the sensor\n");
> > +             return ret;
> > +     }
> > +
> > +     cci_update_bits(sensor->regmap, IMX111_GROUP_WRITE, IMX111_GROUP_=
WRITE_ON,
> > +                     IMX111_GROUP_WRITE_ON, NULL);
>
> Please add error handling for group write register access, too. Errors
> aren't supposed to happen here anyway unless something is definitely wron=
g.
>
> > +     cci_write(sensor->regmap, IMX111_DATA_DEPTH,
> > +               sensor->data_depth | sensor->data_depth << 8, NULL);
> > +     cci_update_bits(sensor->regmap, IMX111_GROUP_WRITE, IMX111_GROUP_=
WRITE_ON,
> > +                     0, NULL);
> > +
> > +     ret =3D __v4l2_ctrl_handler_setup(&sensor->hdl);
> > +     if (ret)
> > +             return ret;
> > +
> > +     ret =3D cci_write(sensor->regmap, IMX111_STREAMING_MODE, IMX111_M=
ODE_STREAMING, NULL);
> > +     if (ret)
> > +             dev_err(dev, "failed to start stream");
> > +
> > +     /* vflip and hflip cannot change during streaming */
> > +     __v4l2_ctrl_grab(sensor->vflip, true);
> > +     __v4l2_ctrl_grab(sensor->hflip, true);
> > +
> > +     msleep(30);
>
> Why the msleep()?
>

Should I use mdelay? This delay originates from downstream camera
sequence without clear explanation. I assume it is needed for the
sensor to stabilize before streaming starts but that is only an
assumption.

> > +
> > +     return ret;
> > +}
> > +
> > +static void imx111_stop_streaming(struct imx111 *sensor)
> > +{
> > +     struct device *dev =3D regmap_get_device(sensor->regmap);
> > +
> > +     if (cci_write(sensor->regmap, IMX111_STREAMING_MODE, IMX111_MODE_=
STANDBY, NULL))
> > +             dev_err(dev, "failed to stop stream");
> > +
> > +     __v4l2_ctrl_grab(sensor->vflip, false);
> > +     __v4l2_ctrl_grab(sensor->hflip, false);
> > +}
> > +
> > +static int imx111_initialize(struct imx111 *sensor)
> > +{
> > +     struct device *dev =3D regmap_get_device(sensor->regmap);
> > +     int ret;
> > +
> > +     imx111_stop_streaming(sensor);
> > +     msleep(30);
> > +
> > +     /* Configure the PLL. */
> > +     cci_write(sensor->regmap, IMX111_PRE_PLL_CLK_DIVIDER_PLL1,
> > +               sensor->pll->pre_div, &ret);
> > +     cci_write(sensor->regmap, IMX111_PLL_MULTIPLIER_PLL1, sensor->pll=
->mult, &ret);
> > +     cci_write(sensor->regmap, IMX111_POST_DIVIDER, IMX111_POST_DIVIDE=
R_DIV1, &ret);
> > +     cci_write(sensor->regmap, IMX111_PLL_SETTLING_TIME,
> > +               to_settle_delay(sensor->pll->extclk_rate), &ret);
> > +
> > +     ret =3D cci_multi_reg_write(sensor->regmap, imx111_global_init,
> > +                               ARRAY_SIZE(imx111_global_init), NULL);
> > +     if (ret < 0) {
> > +             dev_err(dev, "Failed to initialize the sensor\n");
> > +             return ret;
> > +     }
> > +
> > +     return ret;
>
>         return 0;
>
> > +}
> > +
> > +static int imx111_set_stream(struct v4l2_subdev *sd, int enable)
>
> Could you use {en,dis}able_streams() pad ops instead?
>
> > +{
> > +     struct imx111 *sensor =3D sd_to_imx111(sd);
> > +     struct device *dev =3D regmap_get_device(sensor->regmap);
> > +     struct v4l2_subdev_state *state;
> > +     int ret =3D 0;
> > +
> > +     state =3D v4l2_subdev_lock_and_get_active_state(sd);
> > +
> > +     if (enable) {
> > +             ret =3D pm_runtime_resume_and_get(dev);
> > +             if (ret)
> > +                     goto finish_unlock;
> > +
> > +             ret =3D imx111_start_streaming(sensor);
> > +             if (!ret)
> > +                     goto finish_unlock;
> > +
> > +             dev_err(dev, "Failed to start stream: %d\n", ret);
> > +             enable =3D 0;
> > +     }
> > +
> > +     imx111_stop_streaming(sensor);
> > +     pm_runtime_mark_last_busy(dev);
> > +     pm_runtime_put_autosuspend(dev);
> > +
> > +finish_unlock:
> > +     v4l2_subdev_unlock_state(state);
> > +
> > +     return ret;
> > +}
> > +
> > +/* -------------------------------------------------------------------=
----------
> > + * IMX111 Pad Subdev Init and Operations
> > + */
> > +static int imx111_enum_mbus_code(struct v4l2_subdev *sd,
> > +                              struct v4l2_subdev_state *sd_state,
> > +                              struct v4l2_subdev_mbus_code_enum *code)
> > +{
> > +     struct imx111 *sensor =3D sd_to_imx111(sd);
> > +
> > +     if (code->index >=3D (ARRAY_SIZE(imx111_mbus_formats) / 4))
>
> Redundant parentheses.
>
> > +             return -EINVAL;
> > +
> > +     code->code =3D imx111_get_format_code(sensor, imx111_mbus_formats=
[code->index * 4], false);
> > +
> > +     return 0;
> > +}
> > +
> > +static int imx111_enum_frame_size(struct v4l2_subdev *sd,
> > +                               struct v4l2_subdev_state *sd_state,
> > +                               struct v4l2_subdev_frame_size_enum *fse=
)
> > +{
> > +     struct imx111 *sensor =3D sd_to_imx111(sd);
> > +     u32 code;
> > +
> > +     if (fse->index >=3D ARRAY_SIZE(imx111_modes))
> > +             return -EINVAL;
> > +
> > +     code =3D imx111_get_format_code(sensor, fse->code, true);
> > +     if (fse->code !=3D code)
> > +             return -EINVAL;
> > +
> > +     fse->min_width =3D imx111_modes[fse->index].width;
> > +     fse->max_width =3D fse->min_width;
> > +     fse->min_height =3D imx111_modes[fse->index].height;
> > +     fse->max_height =3D fse->min_height;
> > +
> > +     return 0;
> > +}
> > +
> > +static int imx111_enum_frame_interval(struct v4l2_subdev *sd,
> > +                                   struct v4l2_subdev_state *state,
> > +                                   struct v4l2_subdev_frame_interval_e=
num *fie)
> > +{
> > +     struct imx111 *sensor =3D sd_to_imx111(sd);
> > +     const struct imx111_mode *mode;
> > +     u32 framerate, code;
> > +
> > +     if (fie->index > 0)
> > +             return -EINVAL;
> > +
> > +     code =3D imx111_get_format_code(sensor, fie->code, true);
> > +     if (fie->code !=3D code)
> > +             return -EINVAL;
> > +
> > +     mode =3D v4l2_find_nearest_size(imx111_modes, ARRAY_SIZE(imx111_m=
odes),
> > +                                   width, height,
> > +                                   fie->width, fie->height);
> > +     if (fie->width > mode->width || fie->height > mode->height)
> > +             return -EINVAL;
> > +
> > +     framerate =3D div_u64(sensor->pixel_clk_raw, mode->width * mode->=
height *
> > +                         2 * sensor->data_depth);
> > +
> > +     fie->interval.numerator =3D 1;
> > +     fie->interval.denominator =3D rounddown(framerate, IMX111_FRAME_R=
ATE_STEP);
> > +
> > +     return 0;
> > +}
> > +
> > +static int imx111_set_format(struct v4l2_subdev *sd,
> > +                          struct v4l2_subdev_state *state,
> > +                          struct v4l2_subdev_format *format)
> > +{
> > +     struct imx111 *sensor =3D sd_to_imx111(sd);
> > +     struct v4l2_mbus_framefmt *mbus_fmt =3D &format->format;
> > +     struct v4l2_mbus_framefmt *fmt;
> > +     struct v4l2_fract *interval;
> > +     const struct imx111_mode *mode;
> > +     u32 framerate;
> > +
> > +     mode =3D v4l2_find_nearest_size(imx111_modes, ARRAY_SIZE(imx111_m=
odes),
> > +                                   width, height,
> > +                                   mbus_fmt->width, mbus_fmt->height);
> > +     framerate =3D div_u64(sensor->pixel_clk_raw, mode->width * mode->=
height *
> > +                         2 * sensor->data_depth);
> > +
> > +     fmt =3D v4l2_subdev_state_get_format(state, format->pad);
> > +
> > +     fmt->code =3D imx111_get_format_code(sensor, mbus_fmt->code, fals=
e);
> > +     fmt->width =3D mode->width;
> > +     fmt->height =3D mode->height;
> > +     fmt->colorspace =3D V4L2_COLORSPACE_RAW;
> > +
> > +     *mbus_fmt =3D *fmt;
> > +
> > +     interval =3D v4l2_subdev_state_get_interval(state, format->pad);
> > +     interval->numerator =3D 1;
> > +     interval->denominator =3D rounddown(framerate, IMX111_FRAME_RATE_=
STEP);
>
> Frame rate configuration should be done using VBLANK/HBLANK controls, not
> the SUBDEV_S_FRAME_INTERVAL IOCTL. Please see
> <URL:https://www.linuxtv.org/downloads/v4l-dvb-apis-new/userspace-api/dri=
vers/camera-sensor.html#raw-camera-sensors>.
>
> > +
> > +     if (format->which =3D=3D V4L2_SUBDEV_FORMAT_ACTIVE) {
> > +             sensor->cur_mode =3D mode;
> > +             sensor->data_depth =3D imx111_get_format_bpp(fmt);
> > +             __v4l2_ctrl_s_ctrl_int64(sensor->pixel_rate,
> > +                                      div_u64(sensor->pixel_clk_raw, 2=
 * sensor->data_depth));
> > +     }
> > +
> > +     return 0;
> > +}
> > +
> > +static int imx111_set_frame_interval(struct v4l2_subdev *sd,
> > +                                  struct v4l2_subdev_state *state,
> > +                                  struct v4l2_subdev_frame_interval *f=
i)
> > +{
> > +     struct imx111 *sensor =3D sd_to_imx111(sd);
> > +     const struct imx111_mode *mode;
> > +     const struct v4l2_mbus_framefmt *mbus_fmt;
> > +     struct v4l2_fract *interval;
> > +     u32 framerate;
> > +
> > +     mbus_fmt =3D v4l2_subdev_state_get_format(state, fi->pad);
> > +
> > +     mode =3D v4l2_find_nearest_size(imx111_modes, ARRAY_SIZE(imx111_m=
odes),
> > +                                   width, height,
> > +                                   mbus_fmt->width, mbus_fmt->height);
> > +     framerate =3D div_u64(sensor->pixel_clk_raw, mode->width * mode->=
height *
> > +                         2 * sensor->data_depth);
> > +
> > +     interval =3D v4l2_subdev_state_get_interval(state, fi->pad);
> > +
> > +     interval->numerator =3D 1;
> > +     interval->denominator =3D rounddown(framerate, IMX111_FRAME_RATE_=
STEP);
> > +
> > +     fi->interval =3D *interval;
> > +
> > +     return 0;
> > +}
> > +
> > +static int imx111_init_state(struct v4l2_subdev *sd,
> > +                          struct v4l2_subdev_state *sd_state)
> > +{
> > +     struct imx111 *sensor =3D sd_to_imx111(sd);
> > +     const struct imx111_mode *mode =3D sensor->cur_mode;
> > +     struct v4l2_mbus_framefmt *fmt;
> > +     struct v4l2_fract *interval;
> > +     u32 framerate;
> > +
> > +     fmt =3D v4l2_subdev_state_get_format(sd_state, 0);
> > +     interval =3D v4l2_subdev_state_get_interval(sd_state, 0);
> > +
> > +     fmt->code =3D MEDIA_BUS_FMT_SGBRG10_1X10;
> > +     fmt->width =3D mode->width;
> > +     fmt->height =3D mode->height;
> > +     fmt->field =3D V4L2_FIELD_NONE;
> > +     fmt->colorspace =3D V4L2_COLORSPACE_RAW;
> > +     fmt->ycbcr_enc =3D V4L2_YCBCR_ENC_601;
> > +     fmt->quantization =3D V4L2_QUANTIZATION_FULL_RANGE;
> > +     fmt->xfer_func =3D V4L2_XFER_FUNC_NONE;
> > +
> > +     framerate =3D div_u64(sensor->pixel_clk_raw, mode->width * mode->=
height *
> > +                         2 * sensor->data_depth);
> > +
> > +     interval->numerator =3D 1;
> > +     interval->denominator =3D rounddown(framerate, IMX111_FRAME_RATE_=
STEP);
> > +
> > +     return 0;
> > +}
> > +
> > +static const struct v4l2_subdev_video_ops imx111_video_ops =3D {
> > +     .s_stream =3D imx111_set_stream,
> > +};
> > +
> > +static const struct v4l2_subdev_pad_ops imx111_pad_ops =3D {
> > +     .enum_mbus_code =3D imx111_enum_mbus_code,
> > +     .enum_frame_size =3D imx111_enum_frame_size,
> > +     .enum_frame_interval =3D imx111_enum_frame_interval,
> > +     .get_fmt =3D v4l2_subdev_get_fmt,
> > +     .set_fmt =3D imx111_set_format,
> > +     .get_frame_interval =3D v4l2_subdev_get_frame_interval,
> > +     .set_frame_interval =3D imx111_set_frame_interval,
> > +};
> > +
> > +static const struct v4l2_subdev_ops imx111_subdev_ops =3D {
> > +     .video =3D &imx111_video_ops,
> > +     .pad =3D &imx111_pad_ops,
> > +};
> > +
> > +static const struct media_entity_operations imx111_subdev_entity_ops =
=3D {
> > +     .link_validate =3D v4l2_subdev_link_validate,
> > +};
> > +
> > +static const struct v4l2_subdev_internal_ops imx111_internal_ops =3D {
> > +     .init_state =3D imx111_init_state,
> > +};
> > +
> > +static int imx111_init_subdev(struct imx111 *sensor, struct i2c_client=
 *client)
> > +{
> > +     struct device *dev =3D &client->dev;
> > +     struct v4l2_subdev *sd =3D &sensor->sd;
> > +     struct media_pad *pad =3D &sensor->pad;
> > +     struct v4l2_ctrl_handler *hdl =3D &sensor->hdl;
> > +     int ret;
> > +
> > +     /* Initialize the subdev. */
> > +     v4l2_i2c_subdev_init(sd, client, &imx111_subdev_ops);
> > +
> > +     sd->flags |=3D V4L2_SUBDEV_FL_HAS_DEVNODE;
> > +     sd->internal_ops =3D &imx111_internal_ops;
> > +
> > +     /* Initialize the media entity. */
> > +     sd->entity.function =3D MEDIA_ENT_F_CAM_SENSOR;
> > +     sd->entity.ops =3D &imx111_subdev_entity_ops;
> > +     pad->flags =3D MEDIA_PAD_FL_SOURCE;
> > +
> > +     ret =3D media_entity_pads_init(&sd->entity, 1, pad);
> > +     if (ret < 0) {
> > +             dev_err(dev, "failed to init entity pads: %d", ret);
> > +             return ret;
> > +     }
> > +
> > +     /* Initialize the control handler. */
> > +     ret =3D imx111_init_controls(sensor);
> > +     if (ret)
> > +             goto error;
> > +
> > +     return 0;
> > +error:
> > +     v4l2_ctrl_handler_free(hdl);
> > +     media_entity_cleanup(&sd->entity);
> > +     return ret;
> > +};
> > +
> > +/* -------------------------------------------------------------------=
----------
> > + * Power Management
> > + */
> > +
> > +static int imx111_power_on(struct imx111 *sensor)
> > +{
> > +     int ret;
> > +
> > +     if (sensor->reset)
> > +             gpiod_set_value(sensor->reset, 1);
> > +
> > +     ret =3D regulator_bulk_enable(ARRAY_SIZE(sensor->supplies),
> > +                                 sensor->supplies);
> > +     if (ret < 0)
> > +             return ret;
> > +
> > +     usleep_range(500, 600);
> > +
> > +     if (sensor->reset)
> > +             gpiod_set_value(sensor->reset, 0);
> > +
> > +     usleep_range(200, 250);
> > +
> > +     ret =3D clk_prepare_enable(sensor->extclk);
> > +     if (ret < 0)
> > +             goto error_regulator;
> > +
> > +     usleep_range(200, 250);
> > +
> > +     return 0;
> > +
> > +error_regulator:
> > +     regulator_bulk_disable(ARRAY_SIZE(sensor->supplies), sensor->supp=
lies);
> > +     return ret;
> > +}
> > +
> > +static void imx111_power_off(struct imx111 *sensor)
> > +{
> > +     if (sensor->reset)
> > +             gpiod_set_value(sensor->reset, 1);
> > +     usleep_range(1000, 2000);
> > +
> > +     clk_disable_unprepare(sensor->extclk);
> > +     regulator_bulk_disable(ARRAY_SIZE(sensor->supplies), sensor->supp=
lies);
> > +}
> > +
> > +static int __maybe_unused imx111_pm_runtime_resume(struct device *dev)
> > +{
> > +     struct v4l2_subdev *sd =3D dev_get_drvdata(dev);
> > +     struct imx111 *sensor =3D sd_to_imx111(sd);
> > +     int ret;
> > +
> > +     ret =3D imx111_power_on(sensor);
> > +     if (ret)
> > +             return ret;
> > +
> > +     ret =3D imx111_initialize(sensor);
> > +     if (ret) {
> > +             imx111_power_off(sensor);
> > +             return ret;
> > +     }
> > +
> > +     return 0;
> > +}
> > +
> > +static int __maybe_unused imx111_pm_runtime_suspend(struct device *dev=
)
> > +{
> > +     struct v4l2_subdev *sd =3D dev_get_drvdata(dev);
> > +     struct imx111 *sensor =3D sd_to_imx111(sd);
> > +
> > +     imx111_power_off(sensor);
> > +
> > +     return 0;
> > +}
> > +
> > +static const struct dev_pm_ops imx111_pm_ops =3D {
> > +     SET_RUNTIME_PM_OPS(imx111_pm_runtime_suspend,
> > +                        imx111_pm_runtime_resume, NULL)
> > +};
> > +
> > +/* -------------------------------------------------------------------=
----------
> > + * Probe & Remove
> > + */
> > +
> > +static int imx111_identify_module(struct imx111 *sensor)
> > +{
> > +     struct device *dev =3D regmap_get_device(sensor->regmap);
> > +     u64 value, revision, manufacturer;
> > +     int ret;
> > +
> > +     ret =3D cci_read(sensor->regmap, IMX111_PRODUCT_ID, &value, NULL)=
;
> > +     if (ret)
> > +             return ret;
> > +
> > +     if (value !=3D IMX111_CHIP_ID) {
> > +             dev_err(dev, "chip id mismatch: %x!=3D%04llx", IMX111_CHI=
P_ID, value);
> > +             return -ENXIO;
> > +     }
> > +
> > +     cci_read(sensor->regmap, IMX111_REVISION, &revision, NULL);
> > +     cci_read(sensor->regmap, IMX111_MANUFACTURER_ID, &manufacturer, N=
ULL);
> > +
> > +     dev_dbg(dev, "module IMX%03llx rev. %llu manufacturer %llu\n",
> > +             value, revision, manufacturer);
> > +
> > +     return 0;
> > +}
> > +
> > +static int imx111_clk_init(struct imx111 *sensor)
> > +{
> > +     struct device *dev =3D regmap_get_device(sensor->regmap);
> > +     u32 ndata_lanes =3D sensor->bus_cfg.bus.mipi_csi2.num_data_lanes;
> > +     u64 extclk_rate, system_clk;
> > +     int i;
>
> unsigned int, please (and you could declare it for the loop only).
>
> > +
> > +     extclk_rate =3D clk_get_rate(sensor->extclk);
> > +     if (!extclk_rate)
> > +             return dev_err_probe(dev, -EINVAL, "EXTCLK rate unknown\n=
");
> > +
> > +     for (i =3D 0; i < ARRAY_SIZE(imx111_pll); i++) {
> > +             if (clk_get_rate(sensor->extclk) =3D=3D imx111_pll[i].ext=
clk_rate) {
> > +                     sensor->pll =3D &imx111_pll[i];
> > +                     break;
> > +             }
> > +     }
> > +     if (!sensor->pll)
> > +             return dev_err_probe(dev, -EINVAL, "Unsupported EXTCLK ra=
te %llu\n", extclk_rate);
> > +
> > +     system_clk =3D div_u64(extclk_rate, sensor->pll->pre_div) * senso=
r->pll->mult;
> > +
> > +     /*
> > +      * Pixel clock or Logic clock is used for internal image processi=
ng is
> > +      * generated by dividing into 1/10 or 1/8 frequency according to =
the
> > +      * word length of the CSI2 interface. This clock is designating t=
he pixel
> > +      * rate and used as the base of integration time, frame rate etc.
> > +      */
>
> Can you run
>
>         /scripts/checkpatch.pl --strict --max-line-length=3D80
>
> on the patch, please?
>

Why? 80 char length is not enforced, up to 100 char per line is allowed.

> > +     sensor->pixel_clk_raw =3D system_clk * ndata_lanes;
> > +
> > +     /*
> > +      * The CSI-2 bus is clocked for 16-bit per pixel, transmitted in =
DDR over n lanes
> > +      * for RAW10 default format.
> > +      */
> > +     sensor->default_link_freq =3D div_u64(sensor->pixel_clk_raw * 8,
> > +                                         ndata_lanes *
> > +                                         2 * IMX111_DATA_DEPTH_RAW10);
>
> This looks a bit odd; I'm not sure the bit depth should make a difference
> here. Why is pixel_clk_raw multiplied by 8?
>

8 pops as 16/2 16 bit in ddr mode and this results in modules PLL

from what I have gathered default_link_freq of this module is
calculated with dividing PLL (pixel_clk_raw * 8) by clock divisor.
This clock divisor is data depth * 2 and since default format is RAW10
it will be 10 * 2. ndata_lanes should not be in this calculation, it
is here mistakenly.

> > +
> > +     if (sensor->bus_cfg.nr_of_link_frequencies !=3D 1 ||
> > +         sensor->bus_cfg.link_frequencies[0] !=3D sensor->default_link=
_freq)
> > +             return dev_err_probe(dev, -EINVAL,
> > +                                  "Unsupported DT link-frequencies, ex=
pected %llu\n",
> > +                                  sensor->default_link_freq);
> > +
> > +     return 0;
> > +}
> > +
> > +static int imx111_parse_dt(struct imx111 *sensor)
> > +{
> > +     struct device *dev =3D regmap_get_device(sensor->regmap);
> > +     struct fwnode_handle *fwnode =3D dev_fwnode(dev);
> > +     struct fwnode_handle *ep;
> > +     int ret;
> > +
> > +     ep =3D fwnode_graph_get_next_endpoint(fwnode, NULL);
> > +     if (!ep) {
> > +             dev_err(dev, "No endpoint found\n");
> > +             return -EINVAL;
> > +     }
> > +
> > +     sensor->bus_cfg.bus_type =3D V4L2_MBUS_UNKNOWN;
>
> This should be V4L2_MBUS_CSI2_DPHY.
>
> > +     ret =3D v4l2_fwnode_endpoint_alloc_parse(ep, &sensor->bus_cfg);
> > +     fwnode_handle_put(ep);
> > +     if (ret < 0) {
> > +             dev_err(dev, "Failed to parse endpoint\n");
> > +             goto error;
> > +     }
> > +
> > +     switch (sensor->bus_cfg.bus_type) {
>
> And then you can omit this check.
>
> > +     case V4L2_MBUS_CSI2_DPHY:
> > +             break;
> > +
> > +     default:
> > +             dev_err(dev, "unsupported bus type %u\n", sensor->bus_cfg=
.bus_type);
> > +             ret =3D -EINVAL;
> > +             goto error;
> > +     }
> > +
> > +     /* Check the number of MIPI CSI2 data lanes */
> > +     if (sensor->bus_cfg.bus.mipi_csi2.num_data_lanes > 2) {
> > +             dev_err(dev, "number of lanes is more than 2\n");
> > +             ret =3D -EINVAL;
> > +             goto error;
> > +     }
> > +
> > +     return 0;
> > +
> > +error:
> > +     v4l2_fwnode_endpoint_free(&sensor->bus_cfg);
> > +     return ret;
> > +}
> > +
> > +static int imx111_probe(struct i2c_client *client)
> > +{
> > +     struct device *dev =3D &client->dev;
> > +     struct imx111 *sensor;
> > +     int ret;
> > +
> > +     sensor =3D devm_kzalloc(dev, sizeof(*sensor), GFP_KERNEL);
> > +     if (!sensor)
> > +             return -ENOMEM;
> > +
> > +     sensor->regmap =3D devm_cci_regmap_init_i2c(client, 16);
> > +     if (IS_ERR(sensor->regmap))
> > +             return dev_err_probe(dev, PTR_ERR(sensor->regmap),
> > +                                  "Failed to allocate register map\n")=
;
> > +
> > +     sensor->extclk =3D devm_clk_get(dev, NULL);
>
> Could you use devm_v4l2_sensor_clk_get() instead, please?
>
> > +     if (IS_ERR(sensor->extclk))
> > +             return dev_err_probe(dev, PTR_ERR(sensor->extclk), "Faile=
d to get clock\n");
> > +
> > +     sensor->reset =3D devm_gpiod_get_optional(dev, "reset", GPIOD_OUT=
_LOW);
> > +     if (IS_ERR(sensor->reset))
> > +             return dev_err_probe(dev, PTR_ERR(sensor->reset), "Failed=
 to get reset GPIO\n");
> > +
> > +     sensor->supplies[0].supply =3D "iovdd";
> > +     sensor->supplies[1].supply =3D "dvdd";
> > +     sensor->supplies[2].supply =3D "avdd";
> > +
> > +     ret =3D devm_regulator_bulk_get(dev, ARRAY_SIZE(sensor->supplies)=
, sensor->supplies);
> > +     if (ret < 0)
> > +             return dev_err_probe(dev, ret, "Failed to get regulators\=
n");
> > +
> > +     ret =3D imx111_parse_dt(sensor);
> > +     if (ret < 0)
> > +             return ret;
> > +
> > +     ret =3D imx111_clk_init(sensor);
> > +     if (ret < 0)
> > +             goto error_ep_free;
> > +
> > +     ret =3D imx111_power_on(sensor);
> > +     if (ret < 0) {
> > +             dev_err_probe(dev, ret, "Could not power on the device\n"=
);
> > +             goto error_ep_free;
> > +     }
> > +
> > +     ret =3D imx111_identify_module(sensor);
> > +     if (ret < 0) {
> > +             dev_err_probe(dev, ret, "Could not identify module\n");
> > +             goto error_power_off;
> > +     }
> > +
> > +     sensor->cur_mode =3D &imx111_modes[IMX111_MODE_3280x2464];
> > +     sensor->data_depth =3D IMX111_DATA_DEPTH_RAW10;
> > +
> > +     ret =3D imx111_initialize(sensor);
> > +     if (ret < 0)
> > +             goto error_power_off;
> > +
> > +     ret =3D imx111_init_subdev(sensor, client);
> > +     if (ret < 0) {
> > +             dev_err(dev, "failed to init controls: %d", ret);
> > +             goto error_v4l2_ctrl_handler_free;
> > +     }
> > +
> > +     ret =3D v4l2_subdev_init_finalize(&sensor->sd);
> > +     if (ret)
> > +             goto error_v4l2_ctrl_handler_free;
> > +
> > +     /*
> > +      * Enable runtime PM with autosuspend. As the device has been pow=
ered
> > +      * manually, mark it as active, and increase the usage count with=
out
> > +      * resuming the device.
> > +      */
> > +     pm_runtime_set_active(dev);
> > +     pm_runtime_get_noresume(dev);
> > +     pm_runtime_enable(dev);
> > +     pm_runtime_set_autosuspend_delay(dev, 1000);
> > +     pm_runtime_use_autosuspend(dev);
>
> Also disable autosuspend at driver unbind (or probe failure).
>

Is imx219 a proper example for pm configuration?

> > +
> > +     ret =3D v4l2_async_register_subdev_sensor(&sensor->sd);
> > +     if (ret < 0) {
> > +             dev_err(dev, "failed to register V4L2 subdev: %d", ret);
> > +             goto error_pm;
> > +     }
> > +
> > +     /*
> > +      * Decrease the PM usage count. The device will get suspended aft=
er the
> > +      * autosuspend delay, turning the power off.
> > +      */
> > +     pm_runtime_mark_last_busy(dev);
> > +     pm_runtime_put_autosuspend(dev);
>
>         pm_runtime_idle(dev);
>
> And you can drop pm_runtime_get_noresume() above (also error handling wil=
l
> be affected).
>
> > +
> > +     return 0;
> > +
> > +error_pm:
> > +     pm_runtime_disable(dev);
> > +     pm_runtime_put_noidle(dev);
> > +     v4l2_subdev_cleanup(&sensor->sd);
> > +
> > +error_v4l2_ctrl_handler_free:
> > +     v4l2_ctrl_handler_free(&sensor->hdl);
> > +     media_entity_cleanup(&sensor->sd.entity);
> > +
> > +error_power_off:
> > +     imx111_power_off(sensor);
> > +
> > +error_ep_free:
> > +     v4l2_fwnode_endpoint_free(&sensor->bus_cfg);
> > +
> > +     return ret;
> > +}
> > +
> > +static void imx111_remove(struct i2c_client *client)
> > +{
> > +     struct v4l2_subdev *sd =3D i2c_get_clientdata(client);
> > +     struct imx111 *sensor =3D sd_to_imx111(sd);
> > +
> > +     v4l2_async_unregister_subdev(&sensor->sd);
> > +     v4l2_subdev_cleanup(sd);
> > +     media_entity_cleanup(&sensor->sd.entity);
> > +     v4l2_ctrl_handler_free(&sensor->hdl);
> > +     v4l2_fwnode_endpoint_free(&sensor->bus_cfg);
> > +
> > +     /*
> > +      * Disable runtime PM. In case runtime PM is disabled in the kern=
el,
> > +      * make sure to turn power off manually.
> > +      */
> > +     pm_runtime_disable(&client->dev);
> > +     if (!pm_runtime_status_suspended(&client->dev)) {
> > +             imx111_power_off(sensor);
> > +             pm_runtime_set_suspended(&client->dev);
> > +     }
> > +}
> > +
> > +static const struct i2c_device_id imx111_id[] =3D {
> > +     { "imx111" },
> > +     { /* sentinel */ }
> > +};
> > +MODULE_DEVICE_TABLE(i2c, imx111_id);
>
> Do you need the I=E6=B6=8E ID table still?
>

Other maintainers usually request these, if it is not needed, I will remove=
 it.

> > +
> > +static const struct of_device_id imx111_of_match[] =3D {
> > +     { .compatible =3D "sony,imx111" },
> > +     { /* sentinel */ }
> > +};
> > +MODULE_DEVICE_TABLE(of, imx111_of_match);
> > +
> > +static struct i2c_driver imx111_i2c_driver =3D {
> > +     .driver =3D {
> > +             .name =3D "imx111",
> > +             .of_match_table =3D imx111_of_match,
> > +             .pm =3D &imx111_pm_ops,
> > +     },
> > +     .id_table =3D imx111_id,
> > +     .probe =3D imx111_probe,
> > +     .remove =3D imx111_remove,
> > +};
> > +module_i2c_driver(imx111_i2c_driver);
> > +
> > +MODULE_AUTHOR("Svyatoslav Ryhel <clamor95@gmail.com>");
> > +MODULE_DESCRIPTION("Sony IMX111 CMOS Image Sensor driver");
> > +MODULE_LICENSE("GPL");
>
> --
> Kind regards,
>
> Sakari Ailus

Every other comment left without answer is acknowledged and adjustment
will be applied. Thank you!

