Return-Path: <linux-media+bounces-37100-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 85DBDAFC9C5
	for <lists+linux-media@lfdr.de>; Tue,  8 Jul 2025 13:40:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E00C73B94F9
	for <lists+linux-media@lfdr.de>; Tue,  8 Jul 2025 11:40:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8725B2D9EE6;
	Tue,  8 Jul 2025 11:40:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="C/WhP6MI"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D0212D8768;
	Tue,  8 Jul 2025 11:40:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751974838; cv=none; b=fzp5dKcoiaQVBRldJuUiDu0O1LFYdl7pSYqJeB8Mo6smbUTkK9TcHPBGnYf/cn7vD+UmHE9cSvO+cfc4ULMwzV9QM4rrpS6LYQOH7U6JXe5Z2Av4yDsRaRRpLLi4YDDnuZzm4Lm4gnt40o5+d+FbkdwXIyPLPcYuBvNXqoBnFXM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751974838; c=relaxed/simple;
	bh=tukBZ65KVOyXmlK6AlSS7evfF8kjR+zfqw4Q3dS1AtM=;
	h=Content-Type:MIME-Version:In-Reply-To:References:Subject:From:Cc:
	 To:Date:Message-ID; b=apKVaqVwmCim2fo/aqNxmWWAvL8aes2RlWSSpHx5pKvhM4Nvp57lWPrFCYUDSACRg6dpJHeAquH8D6wtFgG2wvOSpCqxSraLa1OvIgREQFi9rHBfQj8DMe8vDQaXn873hXTM7Ui0KrN1g9zwFeesl++qTBvyeZdWzB+ml5XoK/0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=C/WhP6MI; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (cpc89244-aztw30-2-0-cust6594.18-1.cable.virginm.net [86.31.185.195])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 2E29B7E4;
	Tue,  8 Jul 2025 13:40:07 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1751974807;
	bh=tukBZ65KVOyXmlK6AlSS7evfF8kjR+zfqw4Q3dS1AtM=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=C/WhP6MIs4P4DpKS3Ol7//vsRW7i8WSSb/dv+PBAELXVx6IHyqmNaFIMcu7rqNPy4
	 XCZQTL7JZdM3NFUTLWkMpV1D6Ky3i33xy5h7Hxz428OpIWOx1nm3WLSMpUFvqhMsT7
	 QVo0cLVF8PsMmQC0HbeuU9V1hDvHhTKWQzCEahQE=
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20250708102604.29261-3-hardevsinh.palaniya@siliconsignals.io>
References: <20250708102604.29261-1-hardevsinh.palaniya@siliconsignals.io> <20250708102604.29261-3-hardevsinh.palaniya@siliconsignals.io>
Subject: Re: [PATCH v2 2/2] media: i2c: add ov2735 image sensor driver
From: Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc: Hardevsinh Palaniya <hardevsinh.palaniya@siliconsignals.io>, Himanshu Bhavani <himanshu.bhavani@siliconsignals.io>, Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Hans Verkuil <hverkuil@xs4all.nl>, =?utf-8?q?Andr=C3=A9?= Apitzsch <git@apitzsch.eu>, Hans de Goede <hansg@kernel.org>, Ricardo Ribalda <ribalda@chromium.org>, Heimir Thor Sverrisson <heimir.sverrisson@gmail.com>, Matthias Fend <matthias.fend@emfend.at>, Benjamin Mugnier <benjamin.mugnier@foss.st.com>, Jingjing Xiong <jingjing.xiong@intel.com>, Sylvain Petinot <sylvain.petinot@foss.st.com>, Dongcheng Yan <dongcheng.yan@intel.com>, Arnd Bergmann <arnd@arndb.de>, Bryan O'Donoghue <bryan.odonoghue@linaro.org>, linux-media@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
To: Hardevsinh Palaniya <hardevsinh.palaniya@siliconsignals.io>, andriy.shevchenko@linux.intel.com, krzk+dt@kernel.org, sakari.ailus@linux.intel.com, Pratap Nirujogi <pratap.nirujogi@amd.com>
Date: Tue, 08 Jul 2025 12:40:31 +0100
Message-ID: <175197483143.2538045.6355729937419390964@ping.linuxembedded.co.uk>
User-Agent: alot/0.9.1

Hi all,

It looks like we have a second potential user for some CCI Page helpers:

Hardevsinh,

Could you take a look at the work being done by Pratap please?

 - https://lore.kernel.org/all/4402c585-5cc2-428c-be3f-5f08eb53e97a@amd.com/

Quoting Hardevsinh Palaniya (2025-07-08 11:25:56)
> Add a v4l2 subdevice driver for the Omnivision OV2735 sensor.
>=20
> The Omnivision OV2735 is a 1/2.7-Inch CMOS image sensor with an
> active array size of 1920 x 1080.
>=20
> The following features are supported:
> - Manual exposure an gain control support
> - vblank/hblank control support
> - Test pattern support control
> - Supported resolution: 1920 x 1080 @ 30fps (SGRBG10)
>=20
> Co-developed-by: Himanshu Bhavani <himanshu.bhavani@siliconsignals.io>
> Signed-off-by: Himanshu Bhavani <himanshu.bhavani@siliconsignals.io>
> Signed-off-by: Hardevsinh Palaniya <hardevsinh.palaniya@siliconsignals.io>
> ---

<snip>
> +
> +#define OV2735_XCLK_FREQ                       (24 * HZ_PER_MHZ)
> +
> +#define OV2735_REG_PAGE_SELECT                 CCI_REG8(0xfd)
> +
> +/* Page 0 */
> +#define OV2735_REG_CHIPID                      CCI_REG16(0x02)
> +#define OV2735_CHIPID                          0x2735
> +
> +#define OV2735_REG_SOFT_REST                   CCI_REG8(0x20)
> +
> +/* Clock Settings */
> +#define OV2735_REG_PLL_CTRL                    CCI_REG8(0x2f)
> +#define OV2735_REG_PLL_OUTDIV                  CCI_REG8(0x34)
> +#define OV2735_REG_CLK_MODE                    CCI_REG8(0x30)
> +#define OV2735_REG_CLOCK_REG1                  CCI_REG8(0x33)
> +#define OV2735_REG_CLOCK_REG2                  CCI_REG8(0x35)
> +
> +/* Page 1 */
> +#define OV2735_REG_STREAM_CTRL                 CCI_REG8(0xa0)
> +#define OV2735_STREAM_ON                       0x01
> +#define OV2735_STREAM_OFF                      0x00
> +
> +#define OV2735_REG_UPDOWN_MIRROR               CCI_REG8(0x3f)
> +#define OV2735_REG_BINNING_DAC_CODE_MODE       CCI_REG8(0x30)
> +#define OV2735_REG_FRAME_LENGTH                        CCI_REG16(0x0e)
> +#define OV2735_VTS_MAX                         0x0fff
> +#define OV2735_REG_FRAME_EXP_SEPERATE_EN       CCI_REG8(0x0d)
> +#define OV2735_FRAME_EXP_SEPERATE_EN           0x10
> +#define OV2735_REG_FRAME_SYNC                  CCI_REG8(0x01)
> +
> +#define OV2735_REG_HBLANK                      CCI_REG16(0x09)
> +
> +#define OV2735_REG_HS_MIPI                     CCI_REG8(0xb1)
> +#define OV2735_REG_MIPI_CTRL1                  CCI_REG8(0x92)
> +#define OV2735_REG_MIPI_CTRL2                  CCI_REG8(0x94)
> +#define OV2735_REG_MIPI_CTRL3                  CCI_REG8(0xa1)
> +#define OV2735_REG_MIPI_CTRL4                  CCI_REG8(0xb2)
> +#define OV2735_REG_MIPI_CTRL5                  CCI_REG8(0xb3)
> +#define OV2735_REG_MIPI_CTRL6                  CCI_REG8(0xb4)
> +#define OV2735_REG_MIPI_CTRL7                  CCI_REG8(0xb5)
> +#define OV2735_REG_PREPARE                     CCI_REG8(0x95)
> +#define OV2735_REG_R_HS_ZERO                   CCI_REG8(0x96)
> +#define OV2735_REG_TRAIL                       CCI_REG8(0x98)
> +#define OV2735_REG_R_CLK_ZERO                  CCI_REG8(0x9c)
> +#define OV2735_REG_MIPI_V_SIZE                 CCI_REG16(0x8e)
> +#define OV2735_REG_MIPI_H_SIZE                 CCI_REG16(0x90)
> +
> +#define OV2735_REG_ANALOG_CTRL3                        CCI_REG8(0x25)
> +#define OV2735_REG_VNCP                                CCI_REG8(0x20)
> +
> +/* BLC registers */
> +#define OV2735_REG_BLC_GAIN_BLUE               CCI_REG8(0x86)
> +#define OV2735_REG_BLC_GAIN_RED                        CCI_REG8(0x87)
> +#define OV2735_REG_BLC_GAIN_GR                 CCI_REG8(0x88)
> +#define OV2735_REG_BLC_GAIN_GB                 CCI_REG8(0x89)
> +#define OV2735_REG_GB_SUBOFFSET                        CCI_REG8(0xf0)
> +#define OV2735_REG_BLUE_SUBOFFSET              CCI_REG8(0xf1)
> +#define OV2735_REG_RED_SUBOFFSET               CCI_REG8(0xf2)
> +#define OV2735_REG_GR_SUBOFFSET                        CCI_REG8(0xf3)
> +#define OV2735_REG_BLC_BPC_TH_P                        CCI_REG8(0xfc)
> +#define OV2735_REG_BLC_BPC_TH_N                        CCI_REG8(0xfe)
> +
> +#define OV2735_REG_TEST_PATTERN                        CCI_REG8(0xb2)
> +#define OV2735_TEST_PATTERN_ENABLE             0x01
> +#define OV2735_TEST_PATTERN_DISABLE            0xfe
> +
> +#define OV2735_REG_LONG_EXPOSURE               CCI_REG16(0x03)
> +#define        OV2735_EXPOSURE_MIN                     4
> +#define        OV2735_EXPOSURE_STEP                    1
> +
> +#define OV2735_REG_ANALOG_GAIN                  CCI_REG8(0x24)
> +#define        OV2735_ANALOG_GAIN_MIN                  0x10
> +#define        OV2735_ANALOG_GAIN_MAX                  0xff
> +#define        OV2735_ANALOG_GAIN_STEP                 1
> +#define        OV2735_ANALOG_GAIN_DEFAULT              0x10
> +
> +/* Page 2 */
> +#define OV2735_REG_V_START                     CCI_REG16(0xa0)
> +#define OV2735_REG_V_SIZE                      CCI_REG16(0xa2)
> +#define OV2735_REG_H_START                     CCI_REG16(0xa4)
> +#define OV2735_REG_H_SIZE                      CCI_REG16(0xa6)
> +
> +#define OV2735_LINK_FREQ_420MHZ                        (420 * HZ_PER_MHZ)
> +#define OV2735_PIXEL_RATE                      (168 * HZ_PER_MHZ)
> +

<snip>

> +static struct cci_reg_sequence ov2735_1920_1080_30fps[] =3D {
> +       { OV2735_REG_PAGE_SELECT,               0x00 },
> +       { OV2735_REG_PLL_CTRL,                  0x10 },
> +       { OV2735_REG_PLL_OUTDIV,                0x00 },
> +       { OV2735_REG_CLK_MODE,                  0x15 },
> +       { OV2735_REG_CLOCK_REG1,                0x01 },
> +       { OV2735_REG_CLOCK_REG2,                0x20 },
> +       { OV2735_REG_PAGE_SELECT,               0x01 },
> +       { OV2735_REG_BINNING_DAC_CODE_MODE,     0x00 },
> +       { CCI_REG8(0xfb),                       0x73 },
> +       { OV2735_REG_FRAME_SYNC,                0x01 },
> +       { OV2735_REG_PAGE_SELECT,               0x01 },
> +
> +       /* Timing ctrl */
> +       { CCI_REG8(0x1a), 0x6b },
> +       { CCI_REG8(0x1c), 0xea },
> +       { CCI_REG8(0x16), 0x0c },
> +       { CCI_REG8(0x21), 0x00 },
> +       { CCI_REG8(0x11), 0x63 },
> +       { CCI_REG8(0x19), 0xc3 },
> +
> +       /* Analog ctrl */
> +       { CCI_REG8(0x26), 0x5a },
> +       { CCI_REG8(0x29), 0x01 },
> +       { CCI_REG8(0x33), 0x6f },
> +       { CCI_REG8(0x2a), 0xd2 },
> +       { CCI_REG8(0x2c), 0x40 },
> +       { CCI_REG8(0xd0), 0x02 },
> +       { CCI_REG8(0xd1), 0x01 },
> +       { CCI_REG8(0xd2), 0x20 },
> +       { CCI_REG8(0xd3), 0x04 },
> +       { CCI_REG8(0xd4), 0x2a },
> +       { CCI_REG8(0x50), 0x00 },
> +       { CCI_REG8(0x51), 0x2c },
> +       { CCI_REG8(0x52), 0x29 },
> +       { CCI_REG8(0x53), 0x00 },
> +       { CCI_REG8(0x55), 0x44 },
> +       { CCI_REG8(0x58), 0x29 },
> +       { CCI_REG8(0x5a), 0x00 },
> +       { CCI_REG8(0x5b), 0x00 },
> +       { CCI_REG8(0x5d), 0x00 },
> +       { CCI_REG8(0x64), 0x2f },
> +       { CCI_REG8(0x66), 0x62 },
> +       { CCI_REG8(0x68), 0x5b },
> +       { CCI_REG8(0x75), 0x46 },
> +       { CCI_REG8(0x76), 0x36 },
> +       { CCI_REG8(0x77), 0x4f },
> +       { CCI_REG8(0x78), 0xef },
> +       { CCI_REG8(0x72), 0xcf },
> +       { CCI_REG8(0x73), 0x36 },
> +       { CCI_REG8(0x7d), 0x0d },
> +       { CCI_REG8(0x7e), 0x0d },
> +       { CCI_REG8(0x8a), 0x77 },
> +       { CCI_REG8(0x8b), 0x77 },
> +
> +       { OV2735_REG_PAGE_SELECT,       0x01 },
> +       { OV2735_REG_HS_MIPI,           0x83 },
> +       { OV2735_REG_MIPI_CTRL5,        0x0b },
> +       { OV2735_REG_MIPI_CTRL6,        0x14 },
> +       { CCI_REG8(0x9d),               0x40 },
> +       { OV2735_REG_MIPI_CTRL3,        0x05 },
> +       { OV2735_REG_MIPI_CTRL2,        0x44 },
> +       { OV2735_REG_PREPARE,           0x33 },
> +       { OV2735_REG_R_HS_ZERO, 0x1f },
> +       { OV2735_REG_TRAIL,             0x45 },
> +       { OV2735_REG_R_CLK_ZERO,        0x10 },
> +       { OV2735_REG_MIPI_CTRL7,        0x70 },
> +       { OV2735_REG_ANALOG_CTRL3,      0xe0 },
> +       { OV2735_REG_VNCP,              0x7b },
> +
> +       /* BLC */
> +       { OV2735_REG_PAGE_SELECT,       0x01 },
> +       { OV2735_REG_BLC_GAIN_BLUE,     0x77 },
> +       { OV2735_REG_BLC_GAIN_GB,       0x77 },
> +       { OV2735_REG_BLC_GAIN_RED,      0x74 },
> +       { OV2735_REG_BLC_GAIN_GR,       0x74 },
> +       { OV2735_REG_BLC_BPC_TH_P,      0xe0 },
> +       { OV2735_REG_BLC_BPC_TH_N,      0xe0 },
> +       { OV2735_REG_GB_SUBOFFSET,      0x40 },
> +       { OV2735_REG_BLUE_SUBOFFSET,    0x40 },
> +       { OV2735_REG_RED_SUBOFFSET,     0x40 },
> +       { OV2735_REG_GR_SUBOFFSET,      0x40 },
> +
> +       /* 1920x1080 */
> +       { OV2735_REG_PAGE_SELECT,       0x02 },
> +       { OV2735_REG_V_START,           0x0008 },
> +       { OV2735_REG_V_SIZE,            0x0438 },
> +       { OV2735_REG_H_START,           0x0008 },
> +       { OV2735_REG_H_SIZE,            0x03c0 },
> +       { OV2735_REG_PAGE_SELECT,       0x01 },
> +       { OV2735_REG_MIPI_V_SIZE,       0x0780 },
> +       { OV2735_REG_MIPI_H_SIZE,       0x0438 },
> +};
> +

<snip>

> +static int ov2735_enable_test_pattern(struct ov2735 *ov2735, u32 pattern)
> +{
> +       int ret =3D 0;
> +       u64 val;
> +
> +       cci_read(ov2735->cci, OV2735_REG_TEST_PATTERN, &val, &ret);
> +       if (ret)
> +               return ret;
> +
> +       switch (pattern) {
> +       case 0:
> +               val &=3D ~OV2735_TEST_PATTERN_ENABLE;
> +               break;
> +       case 1:
> +               val |=3D OV2735_TEST_PATTERN_ENABLE;
> +               break;
> +       }
> +
> +       return cci_write(ov2735->cci, OV2735_REG_TEST_PATTERN, val, NULL);
> +}
> +
> +static int ov2735_set_ctrl(struct v4l2_ctrl *ctrl)
> +{
> +       struct ov2735 *ov2735 =3D container_of(ctrl->handler, struct ov27=
35,
> +                                            handler);
> +       const struct ov2735_mode *mode;
> +       struct v4l2_mbus_framefmt *fmt;
> +       struct v4l2_subdev_state *state;
> +       u64 vts;
> +       int ret =3D 0;
> +
> +       state =3D v4l2_subdev_get_locked_active_state(&ov2735->sd);
> +       fmt =3D v4l2_subdev_state_get_format(state, 0);
> +
> +       mode =3D v4l2_find_nearest_size(supported_modes,
> +                                     ARRAY_SIZE(supported_modes),
> +                                     width, height,
> +                                     fmt->width, fmt->height);
> +
> +       if (ctrl->id =3D=3D V4L2_CID_VBLANK) {
> +               /* Honour the VBLANK limits when setting exposure. */
> +               s64 max =3D mode->height + ctrl->val - 4;
> +
> +               ret =3D __v4l2_ctrl_modify_range(ov2735->exposure,
> +                                              ov2735->exposure->minimum,=
 max,
> +                                        ov2735->exposure->step,
> +                                        ov2735->exposure->default_value);
> +               if (ret)
> +                       return ret;
> +       }
> +
> +       /*
> +        * Applying V4L2 control value only happens
> +        * when power is up for streaming.
> +        */
> +       if (pm_runtime_get_if_in_use(ov2735->dev) =3D=3D 0)
> +               return 0;
> +
> +       cci_write(ov2735->cci, OV2735_REG_PAGE_SELECT, 0x01, &ret);
> +

And this is a clear location (and the others though) that should use
helpers so that the writes below are contained correctly to the correct
page, and the page is only updated when it's changed.


> +       switch (ctrl->id) {
> +       case V4L2_CID_EXPOSURE:
> +               cci_write(ov2735->cci, OV2735_REG_LONG_EXPOSURE, ctrl->va=
l, &ret);
> +               break;
> +       case V4L2_CID_ANALOGUE_GAIN:
> +               cci_write(ov2735->cci, OV2735_REG_ANALOG_GAIN, ctrl->val,=
 &ret);
> +               break;
> +       case V4L2_CID_HBLANK:
> +               cci_write(ov2735->cci, OV2735_REG_HBLANK, ctrl->val, &ret=
);
> +               break;
> +       case V4L2_CID_VBLANK:
> +               vts =3D ctrl->val + mode->height;
> +               cci_write(ov2735->cci, OV2735_REG_FRAME_EXP_SEPERATE_EN,
> +                                      OV2735_FRAME_EXP_SEPERATE_EN, &ret=
);
> +               cci_write(ov2735->cci, OV2735_REG_FRAME_LENGTH, vts, &ret=
);
> +               break;
> +       case V4L2_CID_TEST_PATTERN:
> +               ret =3D ov2735_enable_test_pattern(ov2735, ctrl->val);
> +               break;
> +       default:
> +               dev_err(ov2735->dev, "ctrl(id:0x%x, val:0x%x) is not hand=
led\n",
> +                       ctrl->id, ctrl->val);
> +               break;
> +       }
> +       cci_write(ov2735->cci, OV2735_REG_FRAME_SYNC, 0x01, &ret);
> +
> +       pm_runtime_put(ov2735->dev);
> +
> +       return ret;
> +}

<snip>

> +
> +static int ov2735_enable_streams(struct v4l2_subdev *sd,
> +                                struct v4l2_subdev_state *state, u32 pad,
> +                                u64 streams_mask)
> +{
> +       struct ov2735 *ov2735 =3D to_ov2735(sd);
> +       const struct ov2735_mode *mode;
> +       const struct ov2735_reglist *reg_list;
> +       const struct v4l2_mbus_framefmt *fmt;
> +       int ret;
> +
> +       fmt =3D v4l2_subdev_state_get_format(state, 0);
> +       mode =3D v4l2_find_nearest_size(supported_modes,
> +                                     ARRAY_SIZE(supported_modes),
> +                                     width, height,
> +                                     fmt->width, fmt->height);
> +
> +       ret =3D pm_runtime_resume_and_get(ov2735->dev);
> +       if (ret < 0)
> +               return ret;
> +
> +       reg_list =3D &mode->reg_list;
> +       cci_multi_reg_write(ov2735->cci, reg_list->regvals, reg_list->num=
_regs, &ret);
> +       if (ret) {
> +               dev_err(ov2735->dev, "%s failed to send mfg header\n", __=
func__);
> +               goto err_rpm_put;
> +       }
> +
> +       /* Apply customized values from user */
> +       ret =3D  __v4l2_ctrl_handler_setup(ov2735->sd.ctrl_handler);
> +       if (ret)
> +               goto err_rpm_put;
> +
> +       /* set stream on register */
> +       cci_write(ov2735->cci, OV2735_REG_PAGE_SELECT, 0x01, &ret);
> +       cci_write(ov2735->cci, OV2735_REG_STREAM_CTRL, OV2735_STREAM_ON, =
&ret);

More page handling could be combined.

> +       if (ret)
> +               goto err_rpm_put;
> +
> +       return 0;
> +
> +err_rpm_put:
> +       pm_runtime_put(ov2735->dev);
> +       return ret;
> +}
> +

<snip>

> +static int ov2735_identify_module(struct ov2735 *ov2735)
> +{
> +       u64 chip_id;
> +       int ret =3D 0;
> +
> +       cci_write(ov2735->cci, OV2735_REG_PAGE_SELECT, 0x00, &ret);
> +       cci_read(ov2735->cci, OV2735_REG_CHIPID, &chip_id, &ret);
> +       if (ret)
> +               return dev_err_probe(ov2735->dev, ret, "failed to read ch=
ip id %x\n",
> +                                    OV2735_CHIPID);
> +
> +       if (chip_id !=3D OV2735_CHIPID)
> +               return dev_err_probe(ov2735->dev, -EIO, "chip id mismatch=
: %x!=3D%llx\n",
> +                                    OV2735_CHIPID, chip_id);
> +
> +       return 0;
> +}

<snipped>

--
Kieran

