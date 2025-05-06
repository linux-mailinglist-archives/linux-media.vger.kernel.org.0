Return-Path: <linux-media+bounces-31877-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C651BAACEBD
	for <lists+linux-media@lfdr.de>; Tue,  6 May 2025 22:16:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 8FB247ABF1F
	for <lists+linux-media@lfdr.de>; Tue,  6 May 2025 20:15:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9CCFE1CD1F;
	Tue,  6 May 2025 20:16:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=apitzsch.eu header.i=@apitzsch.eu header.b="Tp/IdSja"
X-Original-To: linux-media@vger.kernel.org
Received: from www637.your-server.de (www637.your-server.de [168.119.26.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 932B4182;
	Tue,  6 May 2025 20:16:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=168.119.26.117
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746562600; cv=none; b=oBQpFyP4TCs9vHkLRNBGd09QEazxewYaweM3I2r66UpQ+Mn8oUxsLidFtWxGGUBct5c1ZmsoDFB8HOz/Zyh90hYBeWnD3/c2dAdhtNfNVvw6MgJvya3MRPY9ve0y7Ax5Yg33SNBeQbAD/vo5A8S2vFmOqCLhJkB+KZk8U4F7NP8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746562600; c=relaxed/simple;
	bh=BS+pW/VRs5uOMHVzPq4cGLORKTz1DBEnBK/gDvmkdZU=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Ll13tP6yokpfJdC4HwHsV8dx/Vkte3IKk6H0hLmv2ato8TqJ/IiE9hWay2QOC8SQUlHsPjrutTt/+9chK3mAhdi2Fw3sQczCWnXiEHrD+LVC7wPmpT9yVZHHQ1Dx7AmZ62MoP/9ZKtTnPn7dOUs8Y6r1HaAR0IkI1Vo3JmAZ5Zc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=apitzsch.eu; spf=pass smtp.mailfrom=apitzsch.eu; dkim=pass (2048-bit key) header.d=apitzsch.eu header.i=@apitzsch.eu header.b=Tp/IdSja; arc=none smtp.client-ip=168.119.26.117
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=apitzsch.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=apitzsch.eu
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=apitzsch.eu
	; s=default2410; h=MIME-Version:Content-Transfer-Encoding:Content-Type:
	References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID;
	bh=m0CqCJKwo/b66BQfSphC3w5krbi/1sufLze8VLNs6ug=; b=Tp/IdSjal3L5nZnLcnMZvb1qRQ
	TjMgrxs46bEPMskpw0PK2NehDiDDnZj0QfoFPwBUyCkHpoC0CJ/z1y5/rOTXm6TRzfsMuPy+oecVV
	AZ5P7faGvbaYxRYH7PaujNvwxtKRswyc+O2nO3Ss4/LObV8QiMjdVi5ddel/Bn2Hz7VrjKMDc9vKU
	fdp++4DBx9tzN6EzWUyRRY+sPL7S9WbCKYrItglIjJfcdGN18+GIOMi01yXUWhpm2XoYOJkKykg0E
	xra8GbB/msy39I+ZZBwwUKvSezah+4i3/0Pvn3Q3k69CzQJhFkkq2JfZ3O6FvB3Un0GQ3bEhqyQi9
	0IjvK5aQ==;
Received: from sslproxy06.your-server.de ([78.46.172.3])
	by www637.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <git@apitzsch.eu>)
	id 1uCOiG-000E0Z-2g;
	Tue, 06 May 2025 22:16:25 +0200
Received: from [92.206.190.59] (helo=[192.168.1.141])
	by sslproxy06.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <git@apitzsch.eu>)
	id 1uCOiG-000P9u-0L;
	Tue, 06 May 2025 22:16:24 +0200
Message-ID: <9a06eecc32e4bc1fe1c181a52c8504e00a4882fa.camel@apitzsch.eu>
Subject: Re: [PATCH v2 3/4] media: i2c: imx214: Make use of CCS PLL
 calculator
From: =?ISO-8859-1?Q?Andr=E9?= Apitzsch <git@apitzsch.eu>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Ricardo Ribalda <ribalda@kernel.org>, Mauro Carvalho Chehab
	 <mchehab@kernel.org>, ~postmarketos/upstreaming@lists.sr.ht, 
	phone-devel@vger.kernel.org, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Ricardo Ribalda <ribalda@chromium.org>
Date: Tue, 06 May 2025 22:16:23 +0200
In-Reply-To: <aBnCrlMm0EbbmB2w@kekkonen.localdomain>
References: <20250505-imx214_ccs_pll-v2-0-f50452061ff1@apitzsch.eu>
	 <20250505-imx214_ccs_pll-v2-3-f50452061ff1@apitzsch.eu>
	 <aBnCrlMm0EbbmB2w@kekkonen.localdomain>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.1 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Authenticated-Sender: andre@apitzsch.eu
X-Virus-Scanned: Clear (ClamAV 1.0.7/27630/Tue May  6 11:43:15 2025)

Hi Sakari,

thanks for the feedback. One question below.

Am Dienstag, dem 06.05.2025 um 08:05 +0000 schrieb Sakari Ailus:
> Hi Andr=C3=A9,
>=20
> A few more comments below.
>=20
> On Mon, May 05, 2025 at 11:05:55PM +0200, Andr=C3=A9 Apitzsch via B4 Rela=
y
> wrote:
> > From: Andr=C3=A9 Apitzsch <git@apitzsch.eu>
> >=20
> > Calculate PLL parameters based on clock frequency and link
> > frequency.
> >=20
> > Acked-by: Ricardo Ribalda <ribalda@chromium.org>
> > Signed-off-by: Andr=C3=A9 Apitzsch <git@apitzsch.eu>
> > ---
> > =C2=A0drivers/media/i2c/Kconfig=C2=A0 |=C2=A0=C2=A0 1 +
> > =C2=A0drivers/media/i2c/imx214.c | 216
> > +++++++++++++++++++++++++++++++++++++--------
> > =C2=A02 files changed, 178 insertions(+), 39 deletions(-)
> >=20
> > diff --git a/drivers/media/i2c/Kconfig b/drivers/media/i2c/Kconfig
> > index
> > e576b213084d232e90b7e556a7a855a3bb95544c..c8e24c42e0c4ea169f1b6cdc4
> > f2631234a51c7d9 100644
> > --- a/drivers/media/i2c/Kconfig
> > +++ b/drivers/media/i2c/Kconfig
> > @@ -141,6 +141,7 @@ config VIDEO_IMX214
> > =C2=A0	depends on GPIOLIB
> > =C2=A0	select REGMAP_I2C
> > =C2=A0	select V4L2_CCI_I2C
> > +	select VIDEO_CCS_PLL
> > =C2=A0	help
> > =C2=A0	=C2=A0 This is a Video4Linux2 sensor driver for the Sony
> > =C2=A0	=C2=A0 IMX214 camera.
> > diff --git a/drivers/media/i2c/imx214.c
> > b/drivers/media/i2c/imx214.c
> > index
> > 3aca6ebb02d649c1b7f0b6a6049c1e3aa3d08951..9e9be47394ec768a5b34d44b0
> > 6b5bbb0988da5a1 100644
> > --- a/drivers/media/i2c/imx214.c
> > +++ b/drivers/media/i2c/imx214.c
> > @@ -20,6 +20,8 @@
> > =C2=A0#include <media/v4l2-fwnode.h>
> > =C2=A0#include <media/v4l2-subdev.h>
> > =C2=A0
> > +#include "ccs-pll.h"
> > +
> > =C2=A0/* Chip ID */
> > =C2=A0#define IMX214_REG_CHIP_ID		CCI_REG16(0x0016)
> > =C2=A0#define IMX214_CHIP_ID			0x0214
> > @@ -34,7 +36,6 @@
> > =C2=A0#define IMX214_DEFAULT_LINK_FREQ	600000000
> > =C2=A0/* Keep wrong link frequency for backward compatibility */
> > =C2=A0#define IMX214_DEFAULT_LINK_FREQ_LEGACY	480000000
> > -#define IMX214_DEFAULT_PIXEL_RATE ((IMX214_DEFAULT_LINK_FREQ *
> > 8LL) / 10)
> > =C2=A0#define IMX214_FPS 30
> > =C2=A0
> > =C2=A0/* V-TIMING internal */
> > @@ -84,6 +85,7 @@
> > =C2=A0#define IMX214_CSI_DATA_FORMAT_RAW10	0x0A0A
> > =C2=A0#define IMX214_CSI_DATA_FORMAT_COMP6	0x0A06
> > =C2=A0#define IMX214_CSI_DATA_FORMAT_COMP8	0x0A08
> > +#define IMX214_BITS_PER_PIXEL_MASK	0xFF
> > =C2=A0
> > =C2=A0#define IMX214_REG_CSI_LANE_MODE	CCI_REG8(0x0114)
> > =C2=A0#define IMX214_CSI_2_LANE_MODE		1
> > @@ -249,6 +251,10 @@ struct imx214 {
> > =C2=A0	struct clk *xclk;
> > =C2=A0	struct regmap *regmap;
> > =C2=A0
> > +	struct ccs_pll pll;
> > +
> > +	struct v4l2_fwnode_endpoint bus_cfg;
> > +
> > =C2=A0	struct v4l2_subdev sd;
> > =C2=A0	struct media_pad pad;
> > =C2=A0
> > @@ -758,16 +764,22 @@ static int imx214_configure_pll(struct imx214
> > *imx214)
> > =C2=A0{
> > =C2=A0	int ret =3D 0;
> > =C2=A0
> > -	cci_write(imx214->regmap, IMX214_REG_VTPXCK_DIV, 5, &ret);
> > -	cci_write(imx214->regmap, IMX214_REG_VTSYCK_DIV, 2, &ret);
> > -	cci_write(imx214->regmap, IMX214_REG_PREPLLCK_VT_DIV, 3,
> > &ret);
> > -	cci_write(imx214->regmap, IMX214_REG_PLL_VT_MPY, 150,
> > &ret);
> > -	cci_write(imx214->regmap, IMX214_REG_OPPXCK_DIV, 10,
> > &ret);
> > -	cci_write(imx214->regmap, IMX214_REG_OPSYCK_DIV, 1, &ret);
> > +	cci_write(imx214->regmap, IMX214_REG_VTPXCK_DIV,
> > +		=C2=A0 imx214->pll.vt_bk.pix_clk_div, &ret);
> > +	cci_write(imx214->regmap, IMX214_REG_VTSYCK_DIV,
> > +		=C2=A0 imx214->pll.vt_bk.sys_clk_div, &ret);
> > +	cci_write(imx214->regmap, IMX214_REG_PREPLLCK_VT_DIV,
> > +		=C2=A0 imx214->pll.vt_fr.pre_pll_clk_div, &ret);
> > +	cci_write(imx214->regmap, IMX214_REG_PLL_VT_MPY,
> > +		=C2=A0 imx214->pll.vt_fr.pll_multiplier, &ret);
> > +	cci_write(imx214->regmap, IMX214_REG_OPPXCK_DIV,
> > +		=C2=A0 imx214->pll.op_bk.pix_clk_div, &ret);
> > +	cci_write(imx214->regmap, IMX214_REG_OPSYCK_DIV,
> > +		=C2=A0 imx214->pll.op_bk.sys_clk_div, &ret);
> > =C2=A0	cci_write(imx214->regmap, IMX214_REG_PLL_MULT_DRIV,
> > =C2=A0		=C2=A0 IMX214_PLL_SINGLE, &ret);
> > =C2=A0	cci_write(imx214->regmap, IMX214_REG_EXCK_FREQ,
> > -		=C2=A0 IMX214_EXCK_FREQ(IMX214_DEFAULT_CLK_FREQ /
> > 1000000), &ret);
> > +		=C2=A0 IMX214_EXCK_FREQ(imx214->pll.ext_clk_freq_hz /
> > 1000000), &ret);
> > =C2=A0
> > =C2=A0	return ret;
> > =C2=A0}
> > @@ -872,9 +884,6 @@ static const struct v4l2_ctrl_ops
> > imx214_ctrl_ops =3D {
> > =C2=A0
> > =C2=A0static int imx214_ctrls_init(struct imx214 *imx214)
> > =C2=A0{
> > -	static const s64 link_freq[] =3D {
> > -		IMX214_DEFAULT_LINK_FREQ
> > -	};
> > =C2=A0	static const struct v4l2_area unit_size =3D {
> > =C2=A0		.width =3D 1120,
> > =C2=A0		.height =3D 1120,
> > @@ -895,15 +904,14 @@ static int imx214_ctrls_init(struct imx214
> > *imx214)
> > =C2=A0	if (ret)
> > =C2=A0		return ret;
> > =C2=A0
> > -	imx214->pixel_rate =3D v4l2_ctrl_new_std(ctrl_hdlr, NULL,
> > -					=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0
> > V4L2_CID_PIXEL_RATE, 0,
> > -					=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0
> > IMX214_DEFAULT_PIXEL_RATE, 1,
> > -					=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0
> > IMX214_DEFAULT_PIXEL_RATE);
> > +	imx214->pixel_rate =3D
> > +		v4l2_ctrl_new_std(ctrl_hdlr, NULL,
> > V4L2_CID_PIXEL_RATE, 1,
> > +				=C2=A0 INT_MAX, 1, 1);
> > =C2=A0
> > =C2=A0	imx214->link_freq =3D v4l2_ctrl_new_int_menu(ctrl_hdlr,
> > NULL,
> > =C2=A0						=C2=A0=C2=A0
> > V4L2_CID_LINK_FREQ,
> > -						=C2=A0=C2=A0
> > ARRAY_SIZE(link_freq) - 1,
> > -						=C2=A0=C2=A0 0, link_freq);
> > +						=C2=A0=C2=A0 imx214-
> > >bus_cfg.nr_of_link_frequencies - 1,
> > +						=C2=A0=C2=A0 0, imx214-
> > >bus_cfg.link_frequencies);
> > =C2=A0	if (imx214->link_freq)
> > =C2=A0		imx214->link_freq->flags |=3D
> > V4L2_CTRL_FLAG_READ_ONLY;
> > =C2=A0
> > @@ -1006,6 +1014,7 @@ static int imx214_start_streaming(struct
> > imx214 *imx214)
> > =C2=A0	const struct v4l2_mbus_framefmt *fmt;
> > =C2=A0	struct v4l2_subdev_state *state;
> > =C2=A0	const struct imx214_mode *mode;
> > +	int bit_rate_mbps;
> > =C2=A0	int ret;
> > =C2=A0
> > =C2=A0	ret =3D cci_multi_reg_write(imx214->regmap,
> > mode_table_common,
> > @@ -1021,8 +1030,10 @@ static int imx214_start_streaming(struct
> > imx214 *imx214)
> > =C2=A0		return ret;
> > =C2=A0	}
> > =C2=A0
> > +	bit_rate_mbps =3D (imx214->pll.pixel_rate_pixel_array /
> > 1000000)
> > +			* imx214->pll.bits_per_pixel;
> > =C2=A0	ret =3D cci_write(imx214->regmap,
> > IMX214_REG_REQ_LINK_BIT_RATE,
> > -			IMX214_LINK_BIT_RATE_MBPS(4800), NULL);
> > +			IMX214_LINK_BIT_RATE_MBPS(bit_rate_mbps),
> > NULL);
> > =C2=A0	if (ret) {
> > =C2=A0		dev_err(imx214->dev, "failed to configure link bit
> > rate\n");
> > =C2=A0		return ret;
> > @@ -1105,6 +1116,112 @@ static int imx214_s_stream(struct
> > v4l2_subdev *subdev, int enable)
> > =C2=A0	return ret;
> > =C2=A0}
> > =C2=A0
> > +static int imx214_pll_calculate(struct imx214 *imx214, struct
> > ccs_pll *pll,
> > +				unsigned int link_freq)
> > +{
> > +	struct ccs_pll_limits limits =3D {
> > +		.min_ext_clk_freq_hz =3D 6000000,
> > +		.max_ext_clk_freq_hz =3D 27000000,
> > +
> > +		.vt_fr =3D {
> > +			.min_pre_pll_clk_div =3D 1,
> > +			.max_pre_pll_clk_div =3D 15,
> > +			/* min_pll_op_clk_freq_hz /
> > max_pll_multiplier */
> > +			.min_pll_ip_clk_freq_hz =3D 281667,
> > +			/* max_pll_op_clk_freq_hz /
> > min_pll_multiplier */
> > +			.max_pll_ip_clk_freq_hz =3D 100000000,
>=20
> Regarding these limits -- the pll_ip_clk_freq_hz limits are likely
> between around 6 MHz (lower limit) and between 12 MHz and 27 MHz. I'd
> use 6 for lower and 12 for higher if they yield correct configuration
> currently and loosen them up only if needed.

The range 6-12 MHz seems to work.
With the updated min/max values, the comments are no longer valid,
should I just remove them or what alternative comments could be used?

Best regards,
Andr=C3=A9

>=20
> > +			.min_pll_multiplier =3D 12,
> > +			.max_pll_multiplier =3D 1200,
> > +			.min_pll_op_clk_freq_hz =3D 338000000,
> > +			.max_pll_op_clk_freq_hz =3D 1200000000,
> > +		},
> > +		.vt_bk =3D {
> > +			.min_sys_clk_div =3D 2,
> > +			.max_sys_clk_div =3D 4,
> > +			.min_pix_clk_div =3D 5,
> > +			.max_pix_clk_div =3D 10,
> > +			.min_pix_clk_freq_hz =3D 30000000,
> > +			.max_pix_clk_freq_hz =3D 120000000,
> > +		},
> > +		.op_bk =3D {
> > +			.min_sys_clk_div =3D 1,
> > +			.max_sys_clk_div =3D 2,
> > +			.min_pix_clk_div =3D 6,
> > +			.max_pix_clk_div =3D 10,
> > +			.min_pix_clk_freq_hz =3D 30000000,
> > +			.max_pix_clk_freq_hz =3D 120000000,
> > +		},
> > +
> > +		.min_line_length_pck_bin =3D IMX214_PPL_DEFAULT,
> > +		.min_line_length_pck =3D IMX214_PPL_DEFAULT,
> > +	};
> > +	unsigned int num_lanes =3D imx214-
> > >bus_cfg.bus.mipi_csi2.num_data_lanes;
> > +	int ret;
> > +
> > +	/*
> > +	 * There are no documented constraints on the sys clock
> > frequency, for
> > +	 * either branch. Recover them based on the PLL output
> > clock frequency
> > +	 * and sys_clk_div limits on one hand, and the pix clock
> > frequency and
> > +	 * the pix_clk_div limits on the other hand.
> > +	 */
> > +	limits.vt_bk.min_sys_clk_freq_hz =3D
> > +		max(limits.vt_fr.min_pll_op_clk_freq_hz /
> > limits.vt_bk.max_sys_clk_div,
> > +		=C2=A0=C2=A0=C2=A0 limits.vt_bk.min_pix_clk_freq_hz *
> > limits.vt_bk.min_pix_clk_div);
> > +	limits.vt_bk.max_sys_clk_freq_hz =3D
> > +		min(limits.vt_fr.max_pll_op_clk_freq_hz /
> > limits.vt_bk.min_sys_clk_div,
> > +		=C2=A0=C2=A0=C2=A0 limits.vt_bk.max_pix_clk_freq_hz *
> > limits.vt_bk.max_pix_clk_div);
> > +
> > +	limits.op_bk.min_sys_clk_freq_hz =3D
> > +		max(limits.vt_fr.min_pll_op_clk_freq_hz /
> > limits.op_bk.max_sys_clk_div,
> > +		=C2=A0=C2=A0=C2=A0 limits.op_bk.min_pix_clk_freq_hz *
> > limits.op_bk.min_pix_clk_div);
> > +	limits.op_bk.max_sys_clk_freq_hz =3D
> > +		min(limits.vt_fr.max_pll_op_clk_freq_hz /
> > limits.op_bk.min_sys_clk_div,
> > +		=C2=A0=C2=A0=C2=A0 limits.op_bk.max_pix_clk_freq_hz *
> > limits.op_bk.max_pix_clk_div);
> > +
> > +	memset(pll, 0, sizeof(*pll));
> > +
> > +	pll->bus_type =3D CCS_PLL_BUS_TYPE_CSI2_DPHY;
> > +	pll->op_lanes =3D num_lanes;
> > +	pll->vt_lanes =3D num_lanes;
> > +	pll->csi2.lanes =3D num_lanes;
> > +
> > +	pll->binning_horizontal =3D 1;
> > +	pll->binning_vertical =3D 1;
> > +	pll->scale_m =3D 1;
> > +	pll->scale_n =3D 1;
> > +	pll->bits_per_pixel =3D
> > +		IMX214_CSI_DATA_FORMAT_RAW10 &
> > IMX214_BITS_PER_PIXEL_MASK;
> > +	pll->flags =3D CCS_PLL_FLAG_LANE_SPEED_MODEL;
> > +	pll->link_freq =3D link_freq;
> > +	pll->ext_clk_freq_hz =3D clk_get_rate(imx214->xclk);
> > +
> > +	ret =3D ccs_pll_calculate(imx214->dev, &limits, pll);
> > +
> > +	return ret;
>=20
> You can drop ret here.
>=20
> > +}
> > +
> > +static int imx214_pll_update(struct imx214 *imx214)
> > +{
> > +	u64 link_freq;
> > +	int ret;
> > +
> > +	link_freq =3D imx214->bus_cfg.link_frequencies[imx214-
> > >link_freq->val];
> > +	ret =3D imx214_pll_calculate(imx214, &imx214->pll,
> > link_freq);
> > +	if (ret) {
> > +		dev_err(imx214->dev, "PLL calculations failed:
> > %d\n", ret);
> > +		return ret;
> > +	}
> > +
> > +	ret =3D v4l2_ctrl_s_ctrl_int64(imx214->pixel_rate,
> > +				=C2=A0=C2=A0=C2=A0=C2=A0 imx214-
> > >pll.pixel_rate_pixel_array);
> > +	if (ret) {
> > +		dev_err(imx214->dev, "failed to set pixel
> > rate\n");
> > +		return ret;
> > +	}
> > +
> > +	return 0;
> > +}
> > +
> > =C2=A0static int imx214_get_frame_interval(struct v4l2_subdev *subdev,
> > =C2=A0				=C2=A0=C2=A0=C2=A0=C2=A0 struct v4l2_subdev_state
> > *sd_state,
> > =C2=A0				=C2=A0=C2=A0=C2=A0=C2=A0 struct
> > v4l2_subdev_frame_interval *fival)
> > @@ -1211,12 +1328,10 @@ static int imx214_identify_module(struct
> > imx214 *imx214)
> > =C2=A0	return 0;
> > =C2=A0}
> > =C2=A0
> > -static int imx214_parse_fwnode(struct device *dev)
> > +static int imx214_parse_fwnode(struct device *dev, struct imx214
> > *imx214)
> > =C2=A0{
> > +	struct v4l2_fwnode_endpoint *bus_cfg =3D &imx214->bus_cfg;
> > =C2=A0	struct fwnode_handle *endpoint;
> > -	struct v4l2_fwnode_endpoint bus_cfg =3D {
> > -		.bus_type =3D V4L2_MBUS_CSI2_DPHY,
> > -	};
> > =C2=A0	unsigned int i;
> > =C2=A0	int ret;
> > =C2=A0
> > @@ -1224,42 +1339,52 @@ static int imx214_parse_fwnode(struct
> > device *dev)
> > =C2=A0	if (!endpoint)
> > =C2=A0		return dev_err_probe(dev, -EINVAL, "endpoint node
> > not found\n");
> > =C2=A0
> > -	ret =3D v4l2_fwnode_endpoint_alloc_parse(endpoint,
> > &bus_cfg);
> > +	bus_cfg->bus_type =3D V4L2_MBUS_CSI2_DPHY;
> > +	ret =3D v4l2_fwnode_endpoint_alloc_parse(endpoint, bus_cfg);
> > +	fwnode_handle_put(endpoint);
> > =C2=A0	if (ret) {
> > =C2=A0		dev_err_probe(dev, ret, "parsing endpoint node
> > failed\n");
> > -		goto done;
> > +		goto error;
> > =C2=A0	}
> > =C2=A0
> > =C2=A0	/* Check the number of MIPI CSI2 data lanes */
> > -	if (bus_cfg.bus.mipi_csi2.num_data_lanes !=3D 4) {
> > +	if (bus_cfg->bus.mipi_csi2.num_data_lanes !=3D 4) {
> > =C2=A0		ret =3D dev_err_probe(dev, -EINVAL,
> > =C2=A0				=C2=A0=C2=A0=C2=A0 "only 4 data lanes are
> > currently supported\n");
> > -		goto done;
> > +		goto error;
> > =C2=A0	}
> > =C2=A0
> > -	if (bus_cfg.nr_of_link_frequencies !=3D 1)
> > +	if (bus_cfg->nr_of_link_frequencies !=3D 1)
> > =C2=A0		dev_warn(dev, "Only one link-frequency supported,
> > please review your DT. Continuing anyway\n");
> > =C2=A0
> > -	for (i =3D 0; i < bus_cfg.nr_of_link_frequencies; i++) {
> > -		if (bus_cfg.link_frequencies[i] =3D=3D
> > IMX214_DEFAULT_LINK_FREQ)
> > +	for (i =3D 0; i < bus_cfg->nr_of_link_frequencies; i++) {
> > +		u64 freq =3D bus_cfg->link_frequencies[i];
> > +		struct ccs_pll pll;
> > +
> > +		if (!imx214_pll_calculate(imx214, &pll, freq))
> > =C2=A0			break;
> > -		if (bus_cfg.link_frequencies[i] =3D=3D
> > -		=C2=A0=C2=A0=C2=A0 IMX214_DEFAULT_LINK_FREQ_LEGACY) {
> > +		if (freq =3D=3D IMX214_DEFAULT_LINK_FREQ_LEGACY) {
> > =C2=A0			dev_warn(dev,
> > =C2=A0				 "link-frequencies %d not
> > supported, please review your DT. Continuing anyway\n",
> > =C2=A0				 IMX214_DEFAULT_LINK_FREQ);
> > +			freq =3D IMX214_DEFAULT_LINK_FREQ;
> > +			if (imx214_pll_calculate(imx214, &pll,
> > freq))
> > +				continue;
> > +			bus_cfg->link_frequencies[i] =3D freq;
> > =C2=A0			break;
> > =C2=A0		}
> > =C2=A0	}
> > =C2=A0
> > -	if (i =3D=3D bus_cfg.nr_of_link_frequencies)
> > +	if (i =3D=3D bus_cfg->nr_of_link_frequencies)
> > =C2=A0		ret =3D dev_err_probe(dev, -EINVAL,
> > -				=C2=A0=C2=A0=C2=A0 "link-frequencies %d not
> > supported, please review your DT\n",
> > -				=C2=A0=C2=A0=C2=A0 IMX214_DEFAULT_LINK_FREQ);
> > +				=C2=A0=C2=A0=C2=A0 "link-frequencies %lld not
> > supported, please review your DT\n",
> > +				=C2=A0=C2=A0=C2=A0 bus_cfg-
> > >nr_of_link_frequencies ?
> > +				=C2=A0=C2=A0=C2=A0 bus_cfg->link_frequencies[0] :
> > 0);
> > =C2=A0
> > -done:
> > -	v4l2_fwnode_endpoint_free(&bus_cfg);
> > -	fwnode_handle_put(endpoint);
> > +	return 0;
> > +
> > +error:
> > +	v4l2_fwnode_endpoint_free(&imx214->bus_cfg);
> > =C2=A0	return ret;
> > =C2=A0}
> > =C2=A0
> > @@ -1299,7 +1424,7 @@ static int imx214_probe(struct i2c_client
> > *client)
> > =C2=A0		return dev_err_probe(dev, PTR_ERR(imx214->regmap),
> > =C2=A0				=C2=A0=C2=A0=C2=A0=C2=A0 "failed to initialize
> > CCI\n");
> > =C2=A0
> > -	ret =3D imx214_parse_fwnode(dev);
> > +	ret =3D imx214_parse_fwnode(dev, imx214);
> > =C2=A0	if (ret)
> > =C2=A0		return ret;
> > =C2=A0
> > @@ -1310,7 +1435,9 @@ static int imx214_probe(struct i2c_client
> > *client)
> > =C2=A0	 * Enable power initially, to avoid warnings
> > =C2=A0	 * from clk_disable on power_off
> > =C2=A0	 */
> > -	imx214_power_on(imx214->dev);
> > +	ret =3D imx214_power_on(imx214->dev);
> > +	if (ret < 0)
> > +		goto error_fwnode;
> > =C2=A0
> > =C2=A0	ret =3D imx214_identify_module(imx214);
> > =C2=A0	if (ret)
> > @@ -1341,6 +1468,12 @@ static int imx214_probe(struct i2c_client
> > *client)
> > =C2=A0	pm_runtime_set_active(imx214->dev);
> > =C2=A0	pm_runtime_enable(imx214->dev);
> > =C2=A0
> > +	ret =3D imx214_pll_update(imx214);
> > +	if (ret < 0) {
> > +		dev_err_probe(dev, ret, "failed to update PLL\n");
> > +		goto error_subdev_cleanup;
> > +	}
> > +
> > =C2=A0	ret =3D v4l2_async_register_subdev_sensor(&imx214->sd);
> > =C2=A0	if (ret < 0) {
> > =C2=A0		dev_err_probe(dev, ret,
> > @@ -1366,6 +1499,9 @@ static int imx214_probe(struct i2c_client
> > *client)
> > =C2=A0error_power_off:
> > =C2=A0	imx214_power_off(imx214->dev);
> > =C2=A0
> > +error_fwnode:
> > +	v4l2_fwnode_endpoint_free(&imx214->bus_cfg);
> > +
> > =C2=A0	return ret;
> > =C2=A0}
> > =C2=A0
> > @@ -1378,6 +1514,8 @@ static void imx214_remove(struct i2c_client
> > *client)
> > =C2=A0	v4l2_subdev_cleanup(sd);
> > =C2=A0	media_entity_cleanup(&imx214->sd.entity);
> > =C2=A0	v4l2_ctrl_handler_free(&imx214->ctrls);
> > +	v4l2_fwnode_endpoint_free(&imx214->bus_cfg);
> > +
> > =C2=A0	pm_runtime_disable(&client->dev);
> > =C2=A0	if (!pm_runtime_status_suspended(&client->dev)) {
> > =C2=A0		imx214_power_off(imx214->dev);
> >=20

