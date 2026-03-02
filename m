Return-Path: <linux-media+bounces-54113-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uJs7B+XPpWm1GwAAu9opvQ
	(envelope-from <linux-media+bounces-54113-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 02 Mar 2026 18:59:01 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EECD1DE269
	for <lists+linux-media@lfdr.de>; Mon, 02 Mar 2026 18:59:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8B7E23055CB8
	for <lists+linux-media@lfdr.de>; Mon,  2 Mar 2026 17:58:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B2DEC425CC1;
	Mon,  2 Mar 2026 17:58:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="Lg6izQ5k"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FD2E3EBF28
	for <linux-media@vger.kernel.org>; Mon,  2 Mar 2026 17:58:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772474285; cv=none; b=mXLH6o4eXn5tYJhV2o1Yl52ex1f5UXMrm95HhFgbNKPfASlUqs0xRrGM2V6APlzsx3ePEkuAe+9qJMBaAhGET7xWUmX0NhqMmA2MmR/sfR932tUVu8pmI2Pq9ecQ4DcLRYPFVsUH2KvdWiGhuRErTYVF/oEJ8B7MHWiFcP9sWTI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772474285; c=relaxed/simple;
	bh=eNhs+B7X9ciX9il9N4nT58f1HxaKoAZ6pFPykkHnZ2U=;
	h=Content-Type:MIME-Version:In-Reply-To:References:Subject:From:Cc:
	 To:Date:Message-ID; b=BHyF6IDs6DOR4tVVAaav486SVpE7J/wgwZ/yW8P9ftEGokusOoJerWqkGRGFUJSJhHMmoRBI7fINd7Ahfv47r4PhlzKWUe2/sorEYEsUgJeFLQiy9ynKz20kqXxavTamYhu6SxIOiiRBUBu9LFLCG8cpfYUvH7dkalF+My+jat8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=Lg6izQ5k; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from thinkpad.ideasonboard.com (cpc89244-aztw30-2-0-cust6594.18-1.cable.virginm.net [86.31.185.195])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id AB51A986;
	Mon,  2 Mar 2026 18:56:58 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1772474218;
	bh=eNhs+B7X9ciX9il9N4nT58f1HxaKoAZ6pFPykkHnZ2U=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=Lg6izQ5kyYsqVYXGuig8AZG2GxhzFRQT7j2LUGLorBbJ72GBAMX9TwdVVyA/70v2D
	 B1Ip+PRblnma96zjQoidr1ZtFe9tYjmsQ0SYUMKshrt2Vx4msn0lJ7T/TG9TuzVBNJ
	 FLZ9yQeSTYnWKG+dOCmrna+xGk5CJ86nwYUCynVk=
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20260302165932.2408181-1-eagle.alexander923@gmail.com>
References: <20260302165932.2408181-1-eagle.alexander923@gmail.com>
Subject: Re: [PATCH RFC] media: i2c: Add AR0234 camera sensor driver
From: Isaac Scott <isaac.scott@ideasonboard.com>
Cc: Dave Stevenson <dave.stevenson@raspberrypi.com>, Dongcheng Yan <dongcheng.yan@intel.com>, Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, Alexander Shiyan <eagle.alexander923@gmail.com>
To: Alexander Shiyan <eagle.alexander923@gmail.com>, linux-media@vger.kernel.org
Date: Mon, 02 Mar 2026 17:57:57 +0000
Message-ID: <177247427736.4158949.14911192456280885035@t16>
User-Agent: alot/0.10
X-Rspamd-Queue-Id: 5EECD1DE269
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-54113-lists,linux-media=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[gmail.com,vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[ideasonboard.com:+];
	RCPT_COUNT_FIVE(0.00)[6];
	NEURAL_HAM(-0.00)[-0.996];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[isaac.scott@ideasonboard.com,linux-media@vger.kernel.org];
	FREEMAIL_CC(0.00)[raspberrypi.com,intel.com,linaro.org,gmail.com];
	TAGGED_RCPT(0.00)[linux-media];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,linaro.org:email,raspberrypi.com:email,ideasonboard.com:dkim]
X-Rspamd-Action: no action

Hi Alexander,

Thank you for the patch!

Sounds like a cool sensor! Some replies inline :-)

Quoting Alexander Shiyan (2026-03-02 16:59:32)
> I would like to propose a driver for the ON Semiconductor AR0234 CMOS ima=
ge sensor. This driver supports 10-bit raw Bayer output at 1920x1080 resolu=
tion up to 120 fps (tested with 4-lane MIPI CSI-2). It has been developed a=
nd tested on a platform with 27 MHz external clock.
> The driver is based on the initial work by Dave Stevenson and Danius Kalv=
aitis from the Raspberry Pi team, and later extended by UAB Kurokesu. It al=
so incorporates ideas from an Intel-authored version (Yan Dongcheng, Hao Ya=
o) that attempted to use the latest sensor framework features. Unfortunatel=
y, neither of those external versions worked on my hardware, so I decided t=
o create this consolidated version that does work for my setup.
>=20
> Key features:
> - Supports 10-bit raw Bayer (SGRBG10) at 1920x1200 (120 fps).
> - PLL configuration using the common CCS PLL framework.
> - V4L2 controls for exposure, analogue gain, digital gain, HBLANK, VBLANK=
, test patterns, and flips.
> - Runtime PM support.
> - Device tree probing.
>=20
> However, there are a few areas where I would appreciate feedback and help:
> - V4L2_CID_PIXEL_RATE handling: I am not entirely satisfied with the curr=
ent implementation. The pixel rate depends on the number of lanes and the l=
ink frequency. Ideally it should be updated automatically when the link fre=
quency changes (and when the bpp changes, though the sensor only supports 1=
0-bit for now). I would like to make it a read-only control that always ref=
lects the actual pixel rate, but I'm not sure about the best way to integra=
te it with the PLL calculations and the link_freq menu. Any guidance would =
be welcome.
> - V4L2_CID_LINK_FREQ support: The driver currently includes a link freque=
ncy control, but it is not fully dynamic. The PLL is calculated only at pro=
be and when the link frequency is changed via the control (which is current=
ly disabled). I'd like to make it fully functional: when the user selects a=
 different link frequency from the menu, the PLL should be recalculated and=
 the sensor re-initialized accordingly. However, I'm unsure how to handle t=
his cleanly. Any advice on the proper way to manage this would be greatly a=
ppreciated.
> The driver is functional for my use case (1920x1200 @ 120 fps with 4 lane=
s, 27 MHz XCLK), but I believe it could be improved with community input. I=
 am sending this as an RFC to gather feedback and hopefully move towards a =
mainline-ready driver.
>=20
> Thank you for any suggestions.
>=20
> Signed-off-by: Alexander Shiyan <eagle.alexander923@gmail.com>
> ---
>  drivers/media/i2c/Kconfig  |   11 +
>  drivers/media/i2c/Makefile |    1 +
>  drivers/media/i2c/ar0234.c | 1083 ++++++++++++++++++++++++++++++++++++
>  3 files changed, 1095 insertions(+)
>  create mode 100644 drivers/media/i2c/ar0234.c
>=20
> diff --git a/drivers/media/i2c/Kconfig b/drivers/media/i2c/Kconfig
> index 0db8a0add289..1edc2db83f73 100644
> --- a/drivers/media/i2c/Kconfig
> +++ b/drivers/media/i2c/Kconfig
> @@ -62,6 +62,17 @@ config VIDEO_AP1302
>           This is a Video4Linux2 sensor-level driver for the external
>           ISP AP1302.
> =20
> +config VIDEO_AR0234
> +       tristate "ON Semiconductor AR0234 sensor support"
> +       select V4L2_CCI_I2C
> +       select VIDEO_CCS_PLL
> +       help
> +         This is a Video4Linux2 sensor driver for the ON Semiconductor
> +         AR0234 camera.
> +
> +         To compile this driver as a module, choose M here: the
> +         module will be called ar0234.
> +
>  config VIDEO_AR0521
>         tristate "ON Semiconductor AR0521 sensor support"
>         help
> diff --git a/drivers/media/i2c/Makefile b/drivers/media/i2c/Makefile
> index 905ed0f675b8..35e6ccbe16d9 100644
> --- a/drivers/media/i2c/Makefile
> +++ b/drivers/media/i2c/Makefile
> @@ -20,6 +20,7 @@ obj-$(CONFIG_VIDEO_AK881X) +=3D ak881x.o
>  obj-$(CONFIG_VIDEO_ALVIUM_CSI2) +=3D alvium-csi2.o
>  obj-$(CONFIG_VIDEO_AP1302) +=3D ap1302.o
>  obj-$(CONFIG_VIDEO_APTINA_PLL) +=3D aptina-pll.o
> +obj-$(CONFIG_VIDEO_AR0234) +=3D ar0234.o
>  obj-$(CONFIG_VIDEO_AR0521) +=3D ar0521.o
>  obj-$(CONFIG_VIDEO_BT819) +=3D bt819.o
>  obj-$(CONFIG_VIDEO_BT856) +=3D bt856.o
> diff --git a/drivers/media/i2c/ar0234.c b/drivers/media/i2c/ar0234.c
> new file mode 100644
> index 000000000000..99f3fbef33e5
> --- /dev/null
> +++ b/drivers/media/i2c/ar0234.c
> @@ -0,0 +1,1083 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Driver for the AR0234 camera sensor from ON Semiconductor
> + *
> + * Written by Alexander Shiyan <eagle.alexander923@gmail.com>
> + *
> + * Some parts of code taken from ar0234.c by:
> + * Dave Stevenson <dave.stevenson@raspberrypi.com>
> + * Danius Kalvaitis <danius@kurokesu.com>
> + *
> + * Some parts of code taken from imx290.c by:
> + * Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> + */
> +
> +#include <linux/clk.h>
> +#include <linux/delay.h>
> +#include <linux/module.h>
> +#include <linux/pm_runtime.h>
> +#include <linux/gpio/consumer.h>
> +#include <linux/regulator/consumer.h>
> +#include <media/v4l2-cci.h>
> +#include <media/v4l2-ctrls.h>
> +#include <media/v4l2-event.h>
> +#include <media/v4l2-fwnode.h>
> +#include <media/v4l2-subdev.h>
> +
> +#include "ccs-pll.h"
> +
> +#define AR0234_REG_CHIP_VERSION                                CCI_REG16=
(0x3000)
> +#      define AR0234_CHIP_ID                           (0x0a56)
> +#      define AR0234_CHIP_ID_MONO                      (0x1a56)
> +#define AR0234_REG_Y_ADDR_START                                CCI_REG16=
(0x3002)
> +#define AR0234_REG_X_ADDR_START                                CCI_REG16=
(0x3004)
> +#define AR0234_REG_Y_ADDR_END                          CCI_REG16(0x3006)
> +#define AR0234_REG_X_ADDR_END                          CCI_REG16(0x3008)
> +#define AR0234_REG_FRAME_LENGTH_LINES                  CCI_REG16(0x300a)
> +#      define AR0234_VBLANK_MIN                        (16)
> +#      define AR0234_VBLANK_MAX                        (0xfff0)
> +#define AR0234_REG_LINE_LENGTH_PCK                     CCI_REG16(0x300c)
> +#      define AR0234_HBLANK_MIN                        (4)
> +#      define AR0234_HBLANK_DEF                        (612)
> +#      define AR0234_HBLANK_MAX                        (0xfff0)
> +#define AR0234_REG_REVISION_NUMBER                     CCI_REG16(0x300e)
> +#define AR0234_REG_LOCK_CONTROL                                CCI_REG16=
(0x3010)
> +#      define LOCK_CONTROL_MAGIC                       (0xbeef)
> +#define AR0234_REG_COARSE_INTEGRATION_TIME             CCI_REG16(0x3012)
> +#      define AR0234_EXPOSURE_MIN                      (2)
> +#      define AR0234_EXPOSURE_STEP                     (1)
> +#define AR0234_REG_FINE_INTEGRATION_TIME               CCI_REG16(0x3014)
> +#define AR0234_REG_RESET                               CCI_REG16(0x301a)
> +#define AR0234_REG_MODE_SELECT                         CCI_REG8(0x301c)
> +#define AR0234_REG_IMAGE_ORIENTATION                   CCI_REG8(0x301d)
> +#define AR0234_REG_GROUPED_PARAMETER_HOLD              CCI_REG8(0x3022)
> +#define AR0234_REG_VT_PIX_CLK_DIV                      CCI_REG16(0x302a)
> +#define AR0234_REG_VT_SYS_CLK_DIV                      CCI_REG16(0x302c)
> +#define AR0234_REG_PRE_PLL_CLK_DIV                     CCI_REG16(0x302e)
> +#define AR0234_REG_PLL_MULTIPLIER                      CCI_REG16(0x3030)
> +#define AR0234_REG_OP_PIX_CLK_DIV                      CCI_REG16(0x3036)
> +#define AR0234_REG_OP_SYS_CLK_DIV                      CCI_REG16(0x3038)
> +#define AR0234_REG_GLOBAL_GAIN                         CCI_REG16(0x305e)
> +#      define AR0234_DGTL_GAIN_MIN                     (0x0080)
> +#      define AR0234_DGTL_GAIN_MAX                     (0x07ff)
> +#      define AR0234_DGTL_GAIN_DEFAULT                 (0x0080)
> +#      define AR0234_DGTL_GAIN_STEP                    (1)
> +#define AR0234_REG_ANALOG_GAIN                         CCI_REG16(0x3060)
> +#      define AR0234_ANA_GAIN_BASE                     (64)
> +#      define AR0234_ANA_GAIN_MIN                      (AR0234_ANA_GAIN_=
BASE)
> +#      define AR0234_ANA_GAIN_MAX                      (16 * AR0234_ANA_=
GAIN_BASE)
> +#      define AR0234_ANA_GAIN_STEP                     (1)
> +#      define AR0234_ANA_GAIN_DEFAULT                  (AR0234_ANA_GAIN_=
BASE)
> +#define AR0234_REG_TEST_PATTERN_MODE                   CCI_REG16(0x3070)
> +#      define AR0234_TEST_PATTERN_DISABLED             (0)
> +#      define AR0234_TEST_PATTERN_SOLID_COLOR          (1)
> +#      define AR0234_TEST_PATTERN_VERTICAL_COLOR_BARS  (2)
> +#      define AR0234_TEST_PATTERN_FADE_TO_GREY         (3)
> +#      define AR0234_TEST_PATTERN_WALKING_1S           (256)
> +#define AR0234_REG_TEST_DATA_RED                       CCI_REG16(0x3072)
> +#define AR0234_REG_TEST_DATA_GREENR                    CCI_REG16(0x3074)
> +#define AR0234_REG_TEST_DATA_BLUE                      CCI_REG16(0x3076)
> +#define AR0234_REG_TEST_DATA_GREENB                    CCI_REG16(0x3078)
> +#      define AR0234_TESTP_COLOUR_MIN                  (0)
> +#      define AR0234_TESTP_COLOUR_MAX                  (0x3ff)
> +#      define AR0234_TESTP_COLOUR_STEP                 (1)
> +#define AR0234_REG_MFR_30BA                            CCI_REG16(0x30ba)
> +#      define AR0234_MFR_30BA_GAIN_BITS(x)             (0x7620 | (x))
> +#define AR0234_REG_DATA_FORMAT_BITS                    CCI_REG16(0x31ac)
> +#      define DATA_FORMAT_BITS(x)                      (((x) << 8) | (x))
> +#define AR0234_REG_SERIAL_FORMAT                       CCI_REG16(0x31ae)
> +#      define DATA_FORMAT_LINES(x)                     (0x200 | (x))
> +
> +#define AR0234_NATIVE_WIDTH                            (1940U)
> +#define AR0234_NATIVE_HEIGHT                           (1220U)
> +#define AR0234_PIXEL_ARRAY_WIDTH                       (1920U)
> +#define AR0234_PIXEL_ARRAY_HEIGHT                      (1200U)
> +
> +struct reg_list {
> +       u32 num_of_regs;
> +       const struct cci_reg_sequence *regs;
> +};
> +
> +struct ar0234_format {
> +       unsigned int width;
> +       unsigned int height;
> +       struct reg_list reg_list;
> +};
> +
> +static const struct cci_reg_sequence ar0234_common_init[] =3D {
> +       { AR0234_REG_FINE_INTEGRATION_TIME, 0 },
> +};
> +
> +static const struct cci_reg_sequence ar0234_1920x1200[] =3D {
> +       { AR0234_REG_X_ADDR_START, 8 },
> +       { AR0234_REG_Y_ADDR_START, 8 },
> +       { AR0234_REG_X_ADDR_END, AR0234_PIXEL_ARRAY_WIDTH + 8 - 1 },
> +       { AR0234_REG_Y_ADDR_END, AR0234_PIXEL_ARRAY_HEIGHT + 8 - 1 },
> +};
> +
> +static const char *const ar0234_test_pattern_menu[] =3D {
> +       "Disabled",
> +       "Solid Color",
> +       "Vertical Color Bars",
> +       "Fade to Grey Vertical Color Bars",
> +       "Walking 1s",
> +};
> +
> +static const unsigned int ar0234_test_pattern_val[] =3D {
> +       AR0234_TEST_PATTERN_DISABLED,
> +       AR0234_TEST_PATTERN_SOLID_COLOR,
> +       AR0234_TEST_PATTERN_VERTICAL_COLOR_BARS,
> +       AR0234_TEST_PATTERN_FADE_TO_GREY,
> +       AR0234_TEST_PATTERN_WALKING_1S,
> +};
> +
> +static const char *const ar0234_supply_names[] =3D {
> +       "vana",
> +       "vdig",
> +       "vddl",
> +};
> +
> +static const struct ar0234_format ar0234_formats[] =3D {
> +       {
> +               .width =3D 1920,
> +               .height =3D 1200,
> +               .reg_list =3D {
> +                       .regs =3D ar0234_1920x1200,
> +                       .num_of_regs =3D ARRAY_SIZE(ar0234_1920x1200),
> +               },
> +       },
> +};
> +
> +enum ar0234_colour_variant {
> +       AR0234_VARIANT_COLOUR,
> +       AR0234_VARIANT_MONO,
> +       AR0234_VARIANT_MAX
> +};
> +
> +struct ar0234_mode {
> +       u8 bpp;
> +       u32 code[AR0234_VARIANT_MAX];
> +};
> +
> +static const struct ar0234_mode ar0234_modes[] =3D {
> +       {
> +               .bpp =3D 10,
> +               .code =3D {
> +                       [AR0234_VARIANT_COLOUR] =3D MEDIA_BUS_FMT_SGRBG10=
_1X10,
> +                       [AR0234_VARIANT_MONO] =3D MEDIA_BUS_FMT_Y10_1X10,
> +               },
> +       },
> +};
> +
> +static const s64 link_freqs[] =3D {
> +       450000000LL,
> +};
> +
> +struct ar0234 {
> +       struct device *dev;
> +       struct clk *clk;
> +       struct regmap *regmap;
> +
> +       struct v4l2_subdev sd;
> +       struct media_pad pad;
> +
> +       struct regulator_bulk_data supplies[ARRAY_SIZE(ar0234_supply_name=
s)];
> +       struct gpio_desc *reset;
> +
> +       unsigned int num_data_lanes;
> +
> +       unsigned long link_freq_bitmap;
> +
> +       enum ar0234_colour_variant variant;
> +
> +       struct ccs_pll pll;
> +
> +       struct ar0234_mode const *mode;
> +       struct ar0234_format const *format;
> +
> +       struct v4l2_ctrl_handler ctrls;
> +
> +       struct v4l2_ctrl *hblank;
> +       struct v4l2_ctrl *vblank;
> +       struct v4l2_ctrl *exposure;
> +       struct v4l2_ctrl *link_freq;
> +       struct v4l2_ctrl *pixel_rate;
> +       struct v4l2_ctrl *a_gain;
> +       struct {
> +               struct v4l2_ctrl *hflip;
> +               struct v4l2_ctrl *vflip;
> +       };
> +};
> +
> +static inline struct ar0234 *to_ar0234(struct v4l2_subdev *_sd)
> +{
> +       return container_of(_sd, struct ar0234, sd);
> +}
> +
> +static const struct ccs_pll_limits ar0234_pll_limits =3D {
> +       .min_ext_clk_freq_hz =3D 6000000,
> +       .max_ext_clk_freq_hz =3D 54000000,
> +       .vt_fr =3D {
> +               .min_pre_pll_clk_div =3D 1,
> +               .max_pre_pll_clk_div =3D 63,
> +               .min_pll_ip_clk_freq_hz =3D 1500000,
> +               .max_pll_ip_clk_freq_hz =3D 12000000,
> +               .min_pll_multiplier =3D 2,
> +               .max_pll_multiplier =3D 254,
> +               .min_pll_op_clk_freq_hz =3D 384000000,
> +               .max_pll_op_clk_freq_hz =3D 768000000,
> +       },
> +       .vt_bk =3D {
> +               .min_sys_clk_div =3D 1,
> +               .max_sys_clk_div =3D 63,
> +               .min_sys_clk_freq_hz =3D 45000000,
> +               .max_sys_clk_freq_hz =3D 768000000,
> +               .min_pix_clk_div =3D 1,
> +               .max_pix_clk_div =3D 63,
> +               .min_pix_clk_freq_hz =3D 45000000,
> +               .max_pix_clk_freq_hz =3D 90000000,
> +       },
> +       .op_bk =3D {
> +               .min_sys_clk_div =3D 1,
> +               .max_sys_clk_div =3D 63,
> +               .min_sys_clk_freq_hz =3D 45000000,
> +               .max_sys_clk_freq_hz =3D 768000000,
> +               .min_pix_clk_div =3D 1,
> +               .max_pix_clk_div =3D 63,
> +               .min_pix_clk_freq_hz =3D 45000000,
> +               .max_pix_clk_freq_hz =3D 90000000,
> +       },
> +};
> +
> +static int ar0234_calculate_pll(struct ar0234 *ar0234)
> +{
> +       memset(&ar0234->pll, 0, sizeof(ar0234->pll));
> +
> +       ar0234->pll.bus_type =3D CCS_PLL_BUS_TYPE_CSI2_DPHY;
> +       ar0234->pll.op_lanes =3D ar0234->num_data_lanes;
> +       ar0234->pll.vt_lanes =3D 1;
> +       ar0234->pll.csi2.lanes =3D ar0234->num_data_lanes;
> +       ar0234->pll.binning_horizontal =3D 1;
> +       ar0234->pll.binning_vertical =3D 1;
> +       ar0234->pll.scale_m =3D 1;
> +       ar0234->pll.scale_n =3D 1;
> +       ar0234->pll.bits_per_pixel =3D ar0234->mode->bpp;
> +       ar0234->pll.flags =3D CCS_PLL_FLAG_LANE_SPEED_MODEL |
> +                           CCS_PLL_FLAG_EVEN_PLL_MULTIPLIER |
> +                           CCS_PLL_FLAG_FIFO_DERATING |
> +                           CCS_PLL_FLAG_FIFO_OVERRATING |
> +                           CCS_PLL_FLAG_EXT_IP_PLL_DIVIDER;
> +       ar0234->pll.link_freq =3D link_freqs[__ffs(ar0234->link_freq_bitm=
ap)];
> +       ar0234->pll.link_freq /=3D 2;
> +       ar0234->pll.ext_clk_freq_hz =3D clk_get_rate(ar0234->clk);
> +
> +       return ccs_pll_calculate(ar0234->dev, &ar0234_pll_limits, &ar0234=
->pll);
> +}
> +
> +static u32 ar0234_calc_analog_gain(u32 req_gain_q6, u32 *reg_val)
> +{
> +       u32 s, t;
> +       u32 best_gain =3D 0;
> +       u32 best_reg =3D 0;
> +       u32 min_diff =3D U32_MAX;
> +       u32 coarse_mult, fine_gain_q6, total_gain_q6, diff;
> +
> +       for (s =3D 0; s <=3D 4; s++) {
> +               coarse_mult =3D (1 << s) * AR0234_ANA_GAIN_BASE;
> +
> +               for (t =3D 0; t <=3D 15; t++) {
> +                       if (s =3D=3D 0 || s =3D=3D 2) {
> +                               fine_gain_q6 =3D (AR0234_ANA_GAIN_BASE * =
32) / (32 - t);
> +                       } else if (s =3D=3D 1 || s =3D=3D 3) {
> +                               fine_gain_q6 =3D (AR0234_ANA_GAIN_BASE * =
16) / (16 - (t / 2));
> +                       } else {
> +                               fine_gain_q6 =3D (AR0234_ANA_GAIN_BASE * =
8) / (8 - (t / 4));
> +                       }
> +
> +                       total_gain_q6 =3D (coarse_mult * fine_gain_q6) / =
AR0234_ANA_GAIN_BASE;
> +
> +                       if (req_gain_q6 > total_gain_q6)
> +                               diff =3D req_gain_q6 - total_gain_q6;
> +                       else
> +                               diff =3D total_gain_q6 - req_gain_q6;
> +
> +                       if (diff < min_diff) {
> +                               min_diff =3D diff;
> +                               best_gain =3D total_gain_q6;
> +                               best_reg =3D (s << 4) | t;
> +                       }
> +               }
> +       }
> +
> +       *reg_val =3D best_reg;
> +
> +       return best_gain;
> +}
> +
> +static int ar0234_set_mfr_30ba(struct ar0234 *ar0234, u32 analog_reg_val)
> +{
> +       u16 mfr_30ba_val;
> +       u32 coarse_idx =3D (analog_reg_val >> 4) & 0x7;
> +
> +       if (ar0234->pll.pixel_rate_pixel_array <=3D 45000000) {
> +               if (coarse_idx < 3)
> +                       mfr_30ba_val =3D AR0234_MFR_30BA_GAIN_BITS(6);
> +               else
> +                       mfr_30ba_val =3D AR0234_MFR_30BA_GAIN_BITS(0);
> +       } else {
> +               if (coarse_idx =3D=3D 0)
> +                       mfr_30ba_val =3D AR0234_MFR_30BA_GAIN_BITS(2);
> +               else if (coarse_idx =3D=3D 1)
> +                       mfr_30ba_val =3D AR0234_MFR_30BA_GAIN_BITS(1);
> +               else
> +                       mfr_30ba_val =3D AR0234_MFR_30BA_GAIN_BITS(0);
> +       }
> +
> +       return cci_write(ar0234->regmap, AR0234_REG_MFR_30BA, mfr_30ba_va=
l, NULL);
> +}
> +
> +static int ar0234_set_analog_gain(struct ar0234 *ar0234, u64 val)
> +{
> +       u32 reg_val, actual_gain;
> +       int ret;
> +
> +       actual_gain =3D ar0234_calc_analog_gain(val, &reg_val);
> +
> +       if (actual_gain !=3D val) {
> +               __v4l2_ctrl_modify_range(ar0234->a_gain, AR0234_ANA_GAIN_=
MIN,
> +                                        AR0234_ANA_GAIN_MAX,
> +                                        AR0234_ANA_GAIN_STEP, actual_gai=
n);
> +               __v4l2_ctrl_s_ctrl(ar0234->a_gain, actual_gain);
> +       }
> +
> +       ret =3D cci_write(ar0234->regmap, AR0234_REG_GROUPED_PARAMETER_HO=
LD,
> +                       1, NULL);
> +       if (ret)
> +               return ret;
> +
> +       ret =3D ar0234_set_mfr_30ba(ar0234, reg_val);
> +       if (!ret)
> +               ret =3D cci_write(ar0234->regmap, AR0234_REG_ANALOG_GAIN,
> +                               reg_val, NULL);

With cci_write(), it's possible most of the time to pass ret into the
last parameter instead of NULL:

	if (!ret)
		cci_write(ar0234->regmap, AR0234_REG_ANALOG_GAIN,
			  reg_val, &ret);

You can then pass the same ret into other calls to cci_write, and if one
of the writes fails, it will not attempt the next one.

> +
> +       cci_write(ar0234->regmap, AR0234_REG_GROUPED_PARAMETER_HOLD, 0, N=
ULL);
> +
> +       return ret;
> +}
> +

<snip>

> +{
> +       return cci_write(ar0234->regmap, AR0234_REG_MODE_SELECT, !!on,  N=
ULL);
> +}
> +
> +static int ar0234_start_streaming(struct ar0234 *ar0234)
> +{
> +       int ret;
> +
> +       ret =3D pm_runtime_resume_and_get(ar0234->dev);
> +       if (ret)
> +               return ret;
> +
> +//     pr_info("vt_fr.pre_pll_clk_div %i\n", ar0234->pll.vt_fr.pre_pll_c=
lk_div);
> +//     pr_info("vt_fr.pll_multiplier %i\n", ar0234->pll.vt_fr.pll_multip=
lier);
> +      =20
> +//     pr_info("vt_bk.sys_clk_div %i\n", ar0234->pll.vt_bk.sys_clk_div);
> +//     pr_info("vt_bk.pix_clk_div %i\n", ar0234->pll.vt_bk.pix_clk_div);
> +      =20
> +//     pr_info("op_bk.pix_clk_div %i\n", ar0234->pll.op_bk.pix_clk_div);
> +//     pr_info("op_bk.sys_clk_div %i\n", ar0234->pll.op_bk.sys_clk_div);
> +      =20
> +//     pr_info("pixel_rate_csi %u\n", ar0234->pll.pixel_rate_csi);
> +//     pr_info("pixel_rate_pixel_array %u\n", ar0234->pll.pixel_rate_pix=
el_array);
> +

Can we please drop these commented out pr_info's?

> +       ret =3D cci_write(ar0234->regmap, AR0234_REG_PRE_PLL_CLK_DIV,
> +                       ar0234->pll.vt_fr.pre_pll_clk_div, NULL);
> +       ret =3D cci_write(ar0234->regmap, AR0234_REG_PLL_MULTIPLIER,
> +                       ar0234->pll.vt_fr.pll_multiplier, &ret);
> +       ret =3D cci_write(ar0234->regmap, AR0234_REG_VT_SYS_CLK_DIV,
> +                       ar0234->pll.vt_bk.sys_clk_div, &ret);
> +       ret =3D cci_write(ar0234->regmap, AR0234_REG_VT_PIX_CLK_DIV,
> +                       ar0234->pll.vt_bk.pix_clk_div, &ret);
> +       ret =3D cci_write(ar0234->regmap, AR0234_REG_OP_SYS_CLK_DIV,
> +                       ar0234->pll.op_bk.sys_clk_div, &ret);
> +       ret =3D cci_write(ar0234->regmap, AR0234_REG_OP_PIX_CLK_DIV,
> +                       ar0234->pll.op_bk.pix_clk_div, &ret);
> +       if (ret) {
> +               dev_err(ar0234->dev, "Failed to setup PLL\n");
> +               return ret;
> +       }
> +
> +       ret =3D cci_multi_reg_write(ar0234->regmap, ar0234_common_init,
> +                                 ARRAY_SIZE(ar0234_common_init), NULL);
> +       ret =3D cci_write(ar0234->regmap, AR0234_REG_DATA_FORMAT_BITS,
> +                       DATA_FORMAT_BITS(ar0234->mode->bpp), &ret);
> +       ret =3D cci_write(ar0234->regmap, AR0234_REG_SERIAL_FORMAT,
> +                       DATA_FORMAT_LINES(ar0234->num_data_lanes), &ret);
> +       if (ret) {
> +               dev_err(ar0234->dev, "Failed to set common settings\n");
> +               return ret;
> +       }
> +
> +       ret =3D cci_multi_reg_write(ar0234->regmap, ar0234->format->reg_l=
ist.regs,
> +                                 ar0234->format->reg_list.num_of_regs, N=
ULL);
> +      =20
> +       if (ret) {
> +               dev_err(ar0234->dev, "Failed to set frame format\n");
> +               return ret;
> +       }
> +
> +       ret =3D __v4l2_ctrl_handler_setup(ar0234->sd.ctrl_handler);
> +       if (ret)
> +               return ret;
> +
> +       return ar0234_set_stream(ar0234, true);
> +}

Best wishes,

Isaac

> +
> +static void ar0234_stop_streaming(struct ar0234 *ar0234)
> +{
> +       if (ar0234_set_stream(ar0234, false))
> +               dev_err(ar0234->dev, "Failed to set stream\n");
> +
> +       pm_runtime_put_autosuspend(ar0234->dev);
> +}
> +
> +static int ar0234_s_stream(struct v4l2_subdev *sd, int enable)
> +{
> +       struct ar0234 *ar0234 =3D to_ar0234(sd);
> +       struct v4l2_subdev_state *state;
> +       int ret =3D 0;
> +
> +       state =3D v4l2_subdev_lock_and_get_active_state(sd);
> +
> +       if (enable)
> +               ret =3D ar0234_start_streaming(ar0234);
> +       else
> +               ar0234_stop_streaming(ar0234);
> +
> +       v4l2_subdev_unlock_state(state);
> +
> +       return ret;
> +}
> +
> +static int ar0234_g_mbus_config(struct v4l2_subdev *sd, unsigned int pad=
_id,
> +                               struct v4l2_mbus_config *config)
> +{
> +       struct ar0234 *ar0234 =3D to_ar0234(sd);
> +      =20
> +       config->type =3D V4L2_MBUS_CSI2_DPHY;
> +       config->bus.mipi_csi2.flags =3D V4L2_MBUS_CSI2_NONCONTINUOUS_CLOC=
K;
> +       config->bus.mipi_csi2.num_data_lanes =3D ar0234->num_data_lanes;
> +      =20
> +       return 0;
> +}
> +
> +static const struct v4l2_subdev_video_ops ar0234_video_ops =3D {
> +       .s_stream =3D ar0234_s_stream,
> +};
> +
> +static const struct v4l2_subdev_pad_ops ar0234_pad_ops =3D {
> +       .enum_mbus_code =3D ar0234_enum_mbus_code,
> +       .enum_frame_size =3D ar0234_enum_frame_size,
> +       .get_fmt =3D v4l2_subdev_get_fmt,
> +       .set_fmt =3D ar0234_set_pad_format,
> +       .get_selection =3D ar0234_get_selection,
> +       .get_mbus_config =3D ar0234_g_mbus_config,
> +};
> +
> +static const struct v4l2_subdev_ops ar0234_subdev_ops =3D {
> +       .video =3D &ar0234_video_ops,
> +       .pad =3D &ar0234_pad_ops,
> +};
> +
> +static const struct v4l2_subdev_internal_ops ar0234_internal_ops =3D {
> +       .init_state =3D ar0234_init_state,
> +};
> +
> +static int ar0234_ctrls_init(struct ar0234 *ar0234)
> +{
> +       struct v4l2_fwnode_device_properties props;
> +       int i, ret;
> +
> +       ret =3D v4l2_fwnode_device_parse(ar0234->dev, &props);
> +       if (ret)
> +               return ret;
> +
> +       ret =3D v4l2_ctrl_handler_init(&ar0234->ctrls, 14);
> +       if (ret)
> +               return ret;
> +
> +       ar0234->hblank =3D v4l2_ctrl_new_std(&ar0234->ctrls, &ar0234_ctrl=
_ops,
> +                                          V4L2_CID_HBLANK, 0,
> +                                          AR0234_HBLANK_MAX, 2, 0);
> +
> +       ar0234->vblank =3D v4l2_ctrl_new_std(&ar0234->ctrls, &ar0234_ctrl=
_ops,
> +                                          V4L2_CID_VBLANK, 0,
> +                                          AR0234_VBLANK_MAX, 1, 0);
> +
> +       ar0234->exposure =3D v4l2_ctrl_new_std(&ar0234->ctrls, &ar0234_ct=
rl_ops,
> +                                            V4L2_CID_EXPOSURE,
> +                                            AR0234_EXPOSURE_MIN, U16_MAX,
> +                                            AR0234_EXPOSURE_STEP, 200);
> +
> +       ar0234->pixel_rate =3D v4l2_ctrl_new_std(&ar0234->ctrls, &ar0234_=
ctrl_ops,
> +                                              V4L2_CID_PIXEL_RATE, 1,
> +                                              INT_MAX, 1, 1);
> +
> +       ar0234->a_gain =3D v4l2_ctrl_new_std(&ar0234->ctrls, &ar0234_ctrl=
_ops,
> +                                          V4L2_CID_ANALOGUE_GAIN,
> +                                          AR0234_ANA_GAIN_MIN,
> +                                          AR0234_ANA_GAIN_MAX,
> +                                          AR0234_ANA_GAIN_STEP,
> +                                          AR0234_ANA_GAIN_DEFAULT);
> +
> +       v4l2_ctrl_new_std(&ar0234->ctrls, &ar0234_ctrl_ops,
> +                         V4L2_CID_DIGITAL_GAIN, AR0234_DGTL_GAIN_MIN,
> +                         AR0234_DGTL_GAIN_MAX, AR0234_DGTL_GAIN_STEP,
> +                         AR0234_DGTL_GAIN_DEFAULT);
> +
> +       ar0234->hflip =3D v4l2_ctrl_new_std(&ar0234->ctrls, &ar0234_ctrl_=
ops,
> +                                         V4L2_CID_HFLIP, 0, 1, 1, 0);
> +       ar0234->vflip =3D v4l2_ctrl_new_std(&ar0234->ctrls, &ar0234_ctrl_=
ops,
> +                                         V4L2_CID_VFLIP, 0, 1, 1, 0);
> +       v4l2_ctrl_cluster(2, &ar0234->hflip);
> +
> +       v4l2_ctrl_new_std_menu_items(&ar0234->ctrls, &ar0234_ctrl_ops,
> +                                    V4L2_CID_TEST_PATTERN,
> +                                    ARRAY_SIZE(ar0234_test_pattern_menu)=
 - 1,
> +                                    0, 0, ar0234_test_pattern_menu);
> +
> +       for (i =3D 0; i < 4; i++) {
> +               v4l2_ctrl_new_std(&ar0234->ctrls, &ar0234_ctrl_ops,
> +                                 V4L2_CID_TEST_PATTERN_RED + i,
> +                                 AR0234_TESTP_COLOUR_MIN,
> +                                 AR0234_TESTP_COLOUR_MAX,
> +                                 AR0234_TESTP_COLOUR_STEP,
> +                                 AR0234_TESTP_COLOUR_MAX);
> +       }
> +
> +       ar0234->link_freq =3D v4l2_ctrl_new_int_menu(&ar0234->ctrls, &ar0=
234_ctrl_ops,
> +                                                  V4L2_CID_LINK_FREQ,
> +                                                  __fls(ar0234->link_fre=
q_bitmap),
> +                                                  __ffs(ar0234->link_fre=
q_bitmap),
> +                                                  link_freqs);
> +       if (ar0234->link_freq)
> +               ar0234->link_freq->flags |=3D V4L2_CTRL_FLAG_READ_ONLY;
> +
> +       v4l2_ctrl_new_fwnode_properties(&ar0234->ctrls, &ar0234_ctrl_ops,
> +                                       &props);
> +
> +       if (ar0234->ctrls.error)
> +               return dev_err_probe(ar0234->dev, ar0234->ctrls.error,
> +                                    "Failed to add controls\n");
> +
> +       ar0234->sd.ctrl_handler =3D &ar0234->ctrls;
> +
> +       ar0234_set_framing_limits(ar0234);
> +
> +       return 0;
> +}
> +
> +static int ar0234_parse_hw_config(struct ar0234 *ar0234)
> +{
> +       struct v4l2_fwnode_endpoint bus_cfg =3D {
> +               .bus_type =3D V4L2_MBUS_CSI2_DPHY,
> +       };
> +       struct fwnode_handle *ep;
> +       unsigned int i;
> +       int ret;
> +
> +       for (i =3D 0; i < ARRAY_SIZE(ar0234->supplies); i++)
> +               ar0234->supplies[i].supply =3D ar0234_supply_names[i];
> +
> +       ret =3D devm_regulator_bulk_get(ar0234->dev,
> +                                     ARRAY_SIZE(ar0234->supplies),
> +                                     ar0234->supplies);
> +       if (ret)
> +               return dev_err_probe(ar0234->dev, ret,
> +                                    "Failed to get supplies\n");
> +
> +       ar0234->reset =3D devm_gpiod_get_optional(ar0234->dev, "reset",
> +                                               GPIOD_OUT_HIGH);
> +       if (IS_ERR(ar0234->reset))
> +               return dev_err_probe(ar0234->dev, PTR_ERR(ar0234->reset),
> +                                    "Failed to get reset GPIO\n");
> +
> +       ar0234->clk =3D devm_clk_get(ar0234->dev, NULL);
> +       if (IS_ERR(ar0234->clk))
> +               return dev_err_probe(ar0234->dev, PTR_ERR(ar0234->clk),
> +                                    "Failed to get clock\n");
> +
> +       ep =3D fwnode_graph_get_next_endpoint(dev_fwnode(ar0234->dev), NU=
LL);
> +       if (!ep)
> +               return -ENXIO;
> +
> +       ret =3D v4l2_fwnode_endpoint_alloc_parse(ep, &bus_cfg);
> +       fwnode_handle_put(ep);
> +       if (ret)
> +               return ret;
> +
> +       switch (bus_cfg.bus.mipi_csi2.num_data_lanes) {
> +       case 1:
> +       case 2:
> +       case 4:
> +               ar0234->num_data_lanes =3D bus_cfg.bus.mipi_csi2.num_data=
_lanes;
> +               break;
> +       default:
> +               ret =3D dev_err_probe(ar0234->dev, -EINVAL,
> +                                   "Invalid number of CSI2 data lanes %d=
\n",
> +                     bus_cfg.bus.mipi_csi2.num_data_lanes);
> +               goto done_endpoint_free;
> +       }
> +
> +       ret =3D v4l2_link_freq_to_bitmap(ar0234->dev, bus_cfg.link_freque=
ncies,
> +                                      bus_cfg.nr_of_link_frequencies,
> +                                      link_freqs, ARRAY_SIZE(link_freqs),
> +                                      &ar0234->link_freq_bitmap);
> +       if (!ret && !ar0234->link_freq_bitmap)
> +               ret =3D -EINVAL;
> +
> +done_endpoint_free:
> +       v4l2_fwnode_endpoint_free(&bus_cfg);
> +
> +       return ret;
> +}
> +
> +static int ar0234_identify_module(struct ar0234 *ar0234)
> +{
> +       u64 id, rev;
> +       int ret;
> +
> +       ret =3D cci_read(ar0234->regmap, AR0234_REG_CHIP_VERSION, &id, NU=
LL);
> +       ret =3D cci_read(ar0234->regmap, AR0234_REG_REVISION_NUMBER, &rev=
, &ret);
> +       if (ret)
> +               return dev_err_probe(ar0234->dev, ret,
> +                                    "Failed to read chip id\n");
> +
> +       if (id =3D=3D AR0234_CHIP_ID_MONO)
> +               ar0234->variant =3D AR0234_VARIANT_MONO;
> +       else if (id =3D=3D AR0234_CHIP_ID)
> +               ar0234->variant =3D AR0234_VARIANT_COLOUR;
> +       else
> +               return dev_err_probe(ar0234->dev, -ENODEV,
> +                                    "Invalid chip id: 0x%04x\n", (u16)id=
);
> +
> +       dev_info(ar0234->dev, "Success reading chip id: 0x%04x, Rev.%lld\=
n",
> +                (u16)id, (rev >> 12) & 0xf);
> +
> +       return ret;
> +}
> +
> +static int ar0234_power_on(struct device *dev)
> +{
> +       struct v4l2_subdev *sd =3D dev_get_drvdata(dev);
> +       struct ar0234 *ar0234 =3D to_ar0234(sd);
> +       int ret;
> +
> +       ret =3D regulator_bulk_enable(ARRAY_SIZE(ar0234->supplies),
> +                                   ar0234->supplies);
> +       if (ret) {
> +               dev_err(ar0234->dev, "Failed to enable regulators\n");
> +               return ret;
> +       }
> +
> +       ret =3D clk_prepare_enable(ar0234->clk);
> +       if (ret) {
> +               dev_err(ar0234->dev, "Failed to enable clock\n");
> +               regulator_bulk_disable(ARRAY_SIZE(ar0234->supplies),
> +                                      ar0234->supplies);
> +               return ret;
> +       }
> +
> +       gpiod_set_value_cansleep(ar0234->reset, 1);
> +       /* ~160000 EXTCLKs */
> +       usleep_range(27000, 28000);
> +
> +       return 0;
> +}
> +
> +static int ar0234_power_off(struct device *dev)
> +{
> +       struct v4l2_subdev *sd =3D dev_get_drvdata(dev);
> +       struct ar0234 *ar0234 =3D to_ar0234(sd);
> +
> +       gpiod_set_value_cansleep(ar0234->reset, 0);
> +       regulator_bulk_disable(ARRAY_SIZE(ar0234->supplies), ar0234->supp=
lies);
> +       clk_disable_unprepare(ar0234->clk);
> +       /* 100ms PwrDown until next PwrUp */
> +       usleep_range(100000, 110000);
> +
> +       return 0;
> +}
> +
> +static void ar0234_subdev_cleanup(struct ar0234 *ar0234)
> +{
> +       media_entity_cleanup(&ar0234->sd.entity);
> +       v4l2_ctrl_handler_free(&ar0234->ctrls);
> +}
> +
> +static int ar0234_probe(struct i2c_client *client)
> +{
> +       struct device *dev =3D &client->dev;
> +       struct ar0234 *ar0234;
> +       int ret;
> +
> +       ar0234 =3D devm_kzalloc(dev, sizeof(*ar0234), GFP_KERNEL);
> +       if (!ar0234)
> +               return -ENOMEM;
> +
> +       ar0234->dev =3D dev;
> +
> +       ar0234->regmap =3D devm_cci_regmap_init_i2c(client, 16);
> +       if (IS_ERR(ar0234->regmap))
> +               return PTR_ERR(ar0234->regmap);
> +
> +       ret =3D ar0234_parse_hw_config(ar0234);
> +       if (ret)
> +               return ret;
> +
> +       v4l2_i2c_subdev_init(&ar0234->sd, client, &ar0234_subdev_ops);
> +
> +       ret =3D ar0234_power_on(dev);
> +       if (ret)
> +               goto err_subdev;
> +
> +       pm_runtime_set_active(dev);
> +       pm_runtime_get_noresume(dev);
> +       pm_runtime_enable(dev);
> +       pm_runtime_set_autosuspend_delay(dev, 1000);
> +       pm_runtime_use_autosuspend(dev);
> +
> +       ret =3D ar0234_soft_reset(ar0234);
> +       if (ret)
> +               goto error_pm;
> +
> +       ret =3D ar0234_identify_module(ar0234);
> +       if (ret)
> +               goto error_pm;
> +
> +       ar0234->mode =3D &ar0234_modes[0];
> +       ar0234->format =3D &ar0234_formats[0];
> +
> +       ret =3D ar0234_calculate_pll(ar0234);
> +       if (ret) {
> +               dev_err(ar0234->dev, "PLL calculations failed: %d\n", ret=
);
> +               goto error_pm;
> +       }
> +
> +       ret =3D ar0234_ctrls_init(ar0234);
> +       if (ret)
> +               goto error_pm;
> +
> +       ar0234->sd.internal_ops =3D &ar0234_internal_ops;
> +       ar0234->sd.flags |=3D V4L2_SUBDEV_FL_HAS_DEVNODE;
> +       ar0234->sd.entity.function =3D MEDIA_ENT_F_CAM_SENSOR;
> +
> +       ar0234->pad.flags =3D MEDIA_PAD_FL_SOURCE;
> +       ret =3D media_entity_pads_init(&ar0234->sd.entity, 1, &ar0234->pa=
d);
> +       if (ret) {
> +               dev_err(dev, "Failed to init entity pads: %d\n", ret);
> +               goto error_pm;
> +       }
> +
> +       ar0234->sd.state_lock =3D ar0234->ctrls.lock;
> +
> +       ret =3D v4l2_subdev_init_finalize(&ar0234->sd);
> +       if (ret) {
> +               dev_err(ar0234->dev, "Subdev init error\n");
> +               goto error_media;
> +       }
> +
> +       ret =3D v4l2_async_register_subdev_sensor(&ar0234->sd);
> +       if (ret) {
> +               dev_err(dev, "Failed to register sensor sub-device: %d\n"=
, ret);
> +               goto error_media;
> +       }
> +
> +       pm_runtime_put_autosuspend(dev);
> +
> +       return 0;
> +
> +error_media:
> +       media_entity_cleanup(&ar0234->sd.entity);
> +
> +error_pm:
> +       pm_runtime_disable(ar0234->dev);
> +       pm_runtime_put_noidle(ar0234->dev);
> +       ar0234_power_off(ar0234->dev);
> +
> +err_subdev:
> +       ar0234_subdev_cleanup(ar0234);
> +
> +       return ret;
> +}
> +
> +static void ar0234_remove(struct i2c_client *client)
> +{
> +       struct v4l2_subdev *sd =3D i2c_get_clientdata(client);
> +       struct ar0234 *ar0234 =3D to_ar0234(sd);
> +
> +       v4l2_async_unregister_subdev(sd);
> +       ar0234_subdev_cleanup(ar0234);
> +
> +       pm_runtime_disable(&client->dev);
> +       if (!pm_runtime_status_suspended(&client->dev))
> +               ar0234_power_off(&client->dev);
> +       pm_runtime_set_suspended(&client->dev);
> +}
> +
> +static const struct of_device_id ar0234_dt_ids[] =3D {
> +       { .compatible =3D "onnn,ar0234cs" },
> +       { }
> +};
> +MODULE_DEVICE_TABLE(of, ar0234_dt_ids);
> +
> +static DEFINE_RUNTIME_DEV_PM_OPS(ar0234_pm_ops, ar0234_power_off,
> +                                ar0234_power_on, NULL);
> +
> +static struct i2c_driver ar0234_i2c_driver =3D {
> +       .driver =3D {
> +               .name =3D "ar0234",
> +               .of_match_table =3D ar0234_dt_ids,
> +               .pm =3D pm_ptr(&ar0234_pm_ops),
> +       },
> +       .probe =3D ar0234_probe,
> +       .remove =3D ar0234_remove,
> +};
> +module_i2c_driver(ar0234_i2c_driver);
> +
> +MODULE_DESCRIPTION("Onsemi AR0234 Camera Sensor Driver");
> +MODULE_AUTHOR("Alexander Shiyan <eagle.alexander923@gmail.com>");
> +MODULE_LICENSE("GPL");
> --=20
> 2.52.0
>=20
>

