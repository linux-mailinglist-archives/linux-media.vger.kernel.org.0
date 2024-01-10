Return-Path: <linux-media+bounces-3441-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 60ABF829451
	for <lists+linux-media@lfdr.de>; Wed, 10 Jan 2024 08:29:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BC0321F2600C
	for <lists+linux-media@lfdr.de>; Wed, 10 Jan 2024 07:29:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F2ED339FC0;
	Wed, 10 Jan 2024 07:29:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b="kBnfgmGx"
X-Original-To: linux-media@vger.kernel.org
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B2BC3A8D2
	for <linux-media@vger.kernel.org>; Wed, 10 Jan 2024 07:29:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1704871754; x=1736407754;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=oYNZII2teGopVdeSm+rjS+3K/CPdklRbUoPX8TJBi2w=;
  b=kBnfgmGxVWBsZtASxHtN243BaHzbvyNYj4Ee1JZFQ4mFNY611q91eDDi
   WGhA7n06pybJItJ+CEbSuOvEUBFMWkW6+9faeweZNZgRXNjDyTMzYDL4D
   4/+bHI6i6UDBwonlwo/73us3Vy28pLMJIjcoCSxqbR60pkQQFKfOQu84v
   xjPWTYYwVkYBam9lS2EtBxlJlBdxoDKRgVZ4sIKVssA1xMbfR/4sUWMkj
   PmFzyuRq8h11pYNnXI7TIjxXPqhFtDYrzw5n/9LYTenfb7qeH1rDzR7Zf
   H44AVs4yZHmiOZchlthkvxnY46iFm1zy6c7HYHSFemNEcgELGb6zwl6NN
   Q==;
X-IronPort-AV: E=Sophos;i="6.04,184,1695679200"; 
   d="scan'208";a="34819892"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
  by mx1.tq-group.com with ESMTP; 10 Jan 2024 08:29:05 +0100
Received: from steina-w.localnet (steina-w.tq-net.de [10.123.53.25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id B607B280075;
	Wed, 10 Jan 2024 08:29:05 +0100 (CET)
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Michael Riesch <michael.riesch@wolfvision.net>, Sakari Ailus <sakari.ailus@linux.intel.com>, Gerald Loacker <gerald.loacker@wolfvision.net>, linux-media@vger.kernel.org
Subject: Re: [PATCH v2 1/2] media: i2c: imx415: Convert to new CCI register access helpers
Date: Wed, 10 Jan 2024 08:29:05 +0100
Message-ID: <5754372.DvuYhMxLoT@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <20240108105055.GB20868@pendragon.ideasonboard.com>
References: <20231212072637.67642-1-alexander.stein@ew.tq-group.com> <20231212072637.67642-2-alexander.stein@ew.tq-group.com> <20240108105055.GB20868@pendragon.ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"

Hi Laurent,

Am Montag, 8. Januar 2024, 11:50:55 CET schrieb Laurent Pinchart:
> Hi Alexander,
>=20
> Thank you for the patch.
>=20
> On Tue, Dec 12, 2023 at 08:26:36AM +0100, Alexander Stein wrote:
> > Use the new common CCI register access helpers to replace the private
> > register access helpers in the imx415 driver.
> >=20
> > Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
> > ---
> >=20
> >  drivers/media/i2c/Kconfig  |   1 +
> >  drivers/media/i2c/imx415.c | 396 +++++++++++++++----------------------
> >  2 files changed, 161 insertions(+), 236 deletions(-)
> >=20
> > diff --git a/drivers/media/i2c/Kconfig b/drivers/media/i2c/Kconfig
> > index 7ccac4e08d1d7..f6baa22372ac2 100644
> > --- a/drivers/media/i2c/Kconfig
> > +++ b/drivers/media/i2c/Kconfig
> > @@ -204,6 +204,7 @@ config VIDEO_IMX412
> >=20
> >  config VIDEO_IMX415
> > =20
> >  	tristate "Sony IMX415 sensor support"
> >  	depends on OF_GPIO
> >=20
> > +	select V4L2_CCI_I2C
> >=20
> >  	help
> >  =09
> >  	  This is a Video4Linux2 sensor driver for the Sony
> >  	  IMX415 camera.
> >=20
> > diff --git a/drivers/media/i2c/imx415.c b/drivers/media/i2c/imx415.c
> > index 1e5f20c3ed824..a20ece87d6e23 100644
> > --- a/drivers/media/i2c/imx415.c
> > +++ b/drivers/media/i2c/imx415.c
> > @@ -16,6 +16,7 @@
> >=20
> >  #include <linux/slab.h>
> >  #include <linux/videodev2.h>
> >=20
> > +#include <media/v4l2-cci.h>
> >=20
> >  #include <media/v4l2-ctrls.h>
> >  #include <media/v4l2-fwnode.h>
> >  #include <media/v4l2-subdev.h>
> >=20
> > @@ -28,76 +29,65 @@
> >=20
> >  #define IMX415_NUM_CLK_PARAM_REGS 11
> >=20
> > -#define IMX415_REG_8BIT(n)	  ((1 << 16) | (n))
> > -#define IMX415_REG_16BIT(n)	  ((2 << 16) | (n))
> > -#define IMX415_REG_24BIT(n)	  ((3 << 16) | (n))
> > -#define IMX415_REG_SIZE_SHIFT	  16
> > -#define IMX415_REG_ADDR_MASK	  0xffff
> > -
> > -#define IMX415_MODE		  IMX415_REG_8BIT(0x3000)
> > +#define IMX415_MODE		  CCI_REG8(0x3000)
> >=20
> >  #define IMX415_MODE_OPERATING	  (0)
> >  #define IMX415_MODE_STANDBY	  BIT(0)
> >=20
> > -#define IMX415_REGHOLD		  IMX415_REG_8BIT(0x3001)
> > +#define IMX415_REGHOLD		  CCI_REG8(0x3001)
> >=20
> >  #define IMX415_REGHOLD_INVALID	  (0)
> >  #define IMX415_REGHOLD_VALID	  BIT(0)
> >=20
> > -#define IMX415_XMSTA		  IMX415_REG_8BIT(0x3002)
> > +#define IMX415_XMSTA		  CCI_REG8(0x3002)
> >=20
> >  #define IMX415_XMSTA_START	  (0)
> >  #define IMX415_XMSTA_STOP	  BIT(0)
> >=20
> > -#define IMX415_BCWAIT_TIME	  IMX415_REG_16BIT(0x3008)
> > -#define IMX415_CPWAIT_TIME	  IMX415_REG_16BIT(0x300A)
> > -#define IMX415_WINMODE		  IMX415_REG_8BIT(0x301C)
> > -#define IMX415_ADDMODE		  IMX415_REG_8BIT(0x3022)
> > -#define IMX415_REVERSE		  IMX415_REG_8BIT(0x3030)
> > +#define IMX415_BCWAIT_TIME	  CCI_REG16_LE(0x3008)
> > +#define IMX415_CPWAIT_TIME	  CCI_REG16_LE(0x300A)
> > +#define IMX415_WINMODE		  CCI_REG8(0x301C)
> > +#define IMX415_ADDMODE		  CCI_REG8(0x3022)
> > +#define IMX415_REVERSE		  CCI_REG8(0x3030)
> >=20
> >  #define IMX415_HREVERSE_SHIFT	  (0)
> >  #define IMX415_VREVERSE_SHIFT	  BIT(0)
> >=20
> > -#define IMX415_ADBIT		  IMX415_REG_8BIT(0x3031)
> > -#define IMX415_MDBIT		  IMX415_REG_8BIT(0x3032)
> > -#define IMX415_SYS_MODE		  IMX415_REG_8BIT(0x3033)
> > -#define IMX415_OUTSEL		  IMX415_REG_8BIT(0x30C0)
> > -#define IMX415_DRV		  IMX415_REG_8BIT(0x30C1)
> > -#define IMX415_VMAX		  IMX415_REG_24BIT(0x3024)
> > -#define IMX415_HMAX		  IMX415_REG_16BIT(0x3028)
> > -#define IMX415_SHR0		  IMX415_REG_24BIT(0x3050)
> > -#define IMX415_GAIN_PCG_0	  IMX415_REG_16BIT(0x3090)
> > +#define IMX415_ADBIT		  CCI_REG8(0x3031)
> > +#define IMX415_MDBIT		  CCI_REG8(0x3032)
> > +#define IMX415_SYS_MODE		  CCI_REG8(0x3033)
> > +#define IMX415_OUTSEL		  CCI_REG8(0x30C0)
> > +#define IMX415_DRV		  CCI_REG8(0x30C1)
> > +#define IMX415_VMAX		  CCI_REG24_LE(0x3024)
> > +#define IMX415_HMAX		  CCI_REG16_LE(0x3028)
> > +#define IMX415_SHR0		  CCI_REG24_LE(0x3050)
> > +#define IMX415_GAIN_PCG_0	  CCI_REG16_LE(0x3090)
> >=20
> >  #define IMX415_AGAIN_MIN	  0
> >  #define IMX415_AGAIN_MAX	  100
> >  #define IMX415_AGAIN_STEP	  1
> >=20
> > -#define IMX415_BLKLEVEL		  IMX415_REG_16BIT(0x30E2)
> > +#define IMX415_BLKLEVEL		  CCI_REG16_LE(0x30E2)
> >=20
> >  #define IMX415_BLKLEVEL_DEFAULT	  50
> >=20
> > -#define IMX415_TPG_EN_DUOUT	  IMX415_REG_8BIT(0x30E4)
> > -#define IMX415_TPG_PATSEL_DUOUT	  IMX415_REG_8BIT(0x30E6)
> > -#define IMX415_TPG_COLORWIDTH	  IMX415_REG_8BIT(0x30E8)
> > -#define IMX415_TESTCLKEN_MIPI	  IMX415_REG_8BIT(0x3110)
> > -#define IMX415_INCKSEL1		  IMX415_REG_8BIT(0x3115)
> > -#define IMX415_INCKSEL2		  IMX415_REG_8BIT(0x3116)
> > -#define IMX415_INCKSEL3		  IMX415_REG_16BIT(0x3118)
> > -#define IMX415_INCKSEL4		  IMX415_REG_16BIT(0x311A)
> > -#define IMX415_INCKSEL5		  IMX415_REG_8BIT(0x311E)
> > -#define IMX415_DIG_CLP_MODE	  IMX415_REG_8BIT(0x32C8)
> > -#define IMX415_WRJ_OPEN		  IMX415_REG_8BIT(0x3390)
> > -#define IMX415_SENSOR_INFO	  IMX415_REG_16BIT(0x3F12)
> > +#define IMX415_TPG_EN_DUOUT	  CCI_REG8(0x30E4)
> > +#define IMX415_TPG_PATSEL_DUOUT	  CCI_REG8(0x30E6)
> > +#define IMX415_TPG_COLORWIDTH	  CCI_REG8(0x30E8)
> > +#define IMX415_TESTCLKEN_MIPI	  CCI_REG8(0x3110)
> > +#define IMX415_INCKSEL1		  CCI_REG8(0x3115)
> > +#define IMX415_INCKSEL2		  CCI_REG8(0x3116)
> > +#define IMX415_INCKSEL3		  CCI_REG16_LE(0x3118)
> > +#define IMX415_INCKSEL4		  CCI_REG16_LE(0x311A)
> > +#define IMX415_INCKSEL5		  CCI_REG8(0x311E)
> > +#define IMX415_DIG_CLP_MODE	  CCI_REG8(0x32C8)
> > +#define IMX415_WRJ_OPEN		  CCI_REG8(0x3390)
> > +#define IMX415_SENSOR_INFO	  CCI_REG16_LE(0x3F12)
> >=20
> >  #define IMX415_SENSOR_INFO_MASK	  0xFFF
> >  #define IMX415_CHIP_ID		  0x514
> >=20
> > -#define IMX415_LANEMODE		  IMX415_REG_16BIT(0x4001)
> > +#define IMX415_LANEMODE		  CCI_REG16_LE(0x4001)
> >=20
> >  #define IMX415_LANEMODE_2	  1
> >  #define IMX415_LANEMODE_4	  3
> >=20
> > -#define IMX415_TXCLKESC_FREQ	  IMX415_REG_16BIT(0x4004)
> > -#define IMX415_INCKSEL6		  IMX415_REG_8BIT(0x400C)
> > -#define IMX415_TCLKPOST		  IMX415_REG_16BIT(0x4018)
> > -#define IMX415_TCLKPREPARE	  IMX415_REG_16BIT(0x401A)
> > -#define IMX415_TCLKTRAIL	  IMX415_REG_16BIT(0x401C)
> > -#define IMX415_TCLKZERO		  IMX415_REG_16BIT(0x401E)
> > -#define IMX415_THSPREPARE	  IMX415_REG_16BIT(0x4020)
> > -#define IMX415_THSZERO		  IMX415_REG_16BIT(0x4022)
> > -#define IMX415_THSTRAIL		  IMX415_REG_16BIT(0x4024)
> > -#define IMX415_THSEXIT		  IMX415_REG_16BIT(0x4026)
> > -#define IMX415_TLPX		  IMX415_REG_16BIT(0x4028)
> > -#define IMX415_INCKSEL7		  IMX415_REG_8BIT(0x4074)
> > -
> > -struct imx415_reg {
> > -	u32 address;
> > -	u32 val;
> > -};
> > +#define IMX415_TXCLKESC_FREQ	  CCI_REG16_LE(0x4004)
> > +#define IMX415_INCKSEL6		  CCI_REG8(0x400C)
> > +#define IMX415_TCLKPOST		  CCI_REG16_LE(0x4018)
> > +#define IMX415_TCLKPREPARE	  CCI_REG16_LE(0x401A)
> > +#define IMX415_TCLKTRAIL	  CCI_REG16_LE(0x401C)
> > +#define IMX415_TCLKZERO		  CCI_REG16_LE(0x401E)
> > +#define IMX415_THSPREPARE	  CCI_REG16_LE(0x4020)
> > +#define IMX415_THSZERO		  CCI_REG16_LE(0x4022)
> > +#define IMX415_THSTRAIL		  CCI_REG16_LE(0x4024)
> > +#define IMX415_THSEXIT		  CCI_REG16_LE(0x4026)
> > +#define IMX415_TLPX		  CCI_REG16_LE(0x4028)
> > +#define IMX415_INCKSEL7		  CCI_REG8(0x4074)
> >=20
> >  static const char *const imx415_supply_names[] =3D {
> > =20
> >  	"dvdd",
> >=20
> > @@ -118,7 +108,7 @@ static const s64 link_freq_menu_items[] =3D {
> >=20
> >  struct imx415_clk_params {
> > =20
> >  	u64 lane_rate;
> >  	u64 inck;
> >=20
> > -	struct imx415_reg regs[IMX415_NUM_CLK_PARAM_REGS];
> > +	struct cci_reg_sequence regs[IMX415_NUM_CLK_PARAM_REGS];
> >=20
> >  };
> > =20
> >  /* INCK Settings - includes all lane rate and INCK dependent registers=
 */
> >=20
> > @@ -201,7 +191,7 @@ static const struct imx415_clk_params
> > imx415_clk_params[] =3D {>=20
> >  };
> > =20
> >  /* all-pixel 2-lane 720 Mbps 15.74 Hz mode */
> >=20
> > -static const struct imx415_reg imx415_mode_2_720[] =3D {
> > +static const struct cci_reg_sequence imx415_mode_2_720[] =3D {
> >=20
> >  	{ IMX415_VMAX, 0x08CA },
> >  	{ IMX415_HMAX, 0x07F0 },
> >  	{ IMX415_LANEMODE, IMX415_LANEMODE_2 },
> >=20
> > @@ -217,7 +207,7 @@ static const struct imx415_reg imx415_mode_2_720[] =
=3D {
> >=20
> >  };
> > =20
> >  /* all-pixel 2-lane 1440 Mbps 30.01 Hz mode */
> >=20
> > -static const struct imx415_reg imx415_mode_2_1440[] =3D {
> > +static const struct cci_reg_sequence imx415_mode_2_1440[] =3D {
> >=20
> >  	{ IMX415_VMAX, 0x08CA },
> >  	{ IMX415_HMAX, 0x042A },
> >  	{ IMX415_LANEMODE, IMX415_LANEMODE_2 },
> >=20
> > @@ -233,7 +223,7 @@ static const struct imx415_reg imx415_mode_2_1440[]=
 =3D
> > {
> >=20
> >  };
> > =20
> >  /* all-pixel 4-lane 891 Mbps 30 Hz mode */
> >=20
> > -static const struct imx415_reg imx415_mode_4_891[] =3D {
> > +static const struct cci_reg_sequence imx415_mode_4_891[] =3D {
> >=20
> >  	{ IMX415_VMAX, 0x08CA },
> >  	{ IMX415_HMAX, 0x044C },
> >  	{ IMX415_LANEMODE, IMX415_LANEMODE_4 },
> >=20
> > @@ -250,7 +240,7 @@ static const struct imx415_reg imx415_mode_4_891[] =
=3D {
> >=20
> >  struct imx415_mode_reg_list {
> > =20
> >  	u32 num_of_regs;
> >=20
> > -	const struct imx415_reg *regs;
> > +	const struct cci_reg_sequence *regs;
> >=20
> >  };
> > =20
> >  /*
> >=20
> > @@ -323,11 +313,6 @@ static const struct imx415_mode supported_modes[] =
=3D {
> >=20
> >  	},
> > =20
> >  };
> >=20
> > -static const struct regmap_config imx415_regmap_config =3D {
> > -	.reg_bits =3D 16,
> > -	.val_bits =3D 8,
> > -};
> > -
> >=20
> >  static const char *const imx415_test_pattern_menu[] =3D {
> > =20
> >  	"disabled",
> >  	"solid black",
> >=20
> > @@ -369,7 +354,7 @@ struct imx415 {
> >=20
> >   * This table includes fixed register settings and a bunch of
> >   undocumented
> >   * registers that have to be set to another value than default.
> >   */
> >=20
> > -static const struct imx415_reg imx415_init_table[] =3D {
> > +static const struct cci_reg_sequence imx415_init_table[] =3D {
> >=20
> >  	/* use all-pixel readout mode, no flip */
> >  	{ IMX415_WINMODE, 0x00 },
> >  	{ IMX415_ADDMODE, 0x00 },
> >=20
> > @@ -382,77 +367,77 @@ static const struct imx415_reg imx415_init_table[=
] =3D
> > {>=20
> >  	{ IMX415_DRV, 0x00 },
> >  =09
> >  	/* SONY magic registers */
> >=20
> > -	{ IMX415_REG_8BIT(0x32D4), 0x21 },
> > -	{ IMX415_REG_8BIT(0x32EC), 0xA1 },
> > -	{ IMX415_REG_8BIT(0x3452), 0x7F },
> > -	{ IMX415_REG_8BIT(0x3453), 0x03 },
> > -	{ IMX415_REG_8BIT(0x358A), 0x04 },
> > -	{ IMX415_REG_8BIT(0x35A1), 0x02 },
> > -	{ IMX415_REG_8BIT(0x36BC), 0x0C },
> > -	{ IMX415_REG_8BIT(0x36CC), 0x53 },
> > -	{ IMX415_REG_8BIT(0x36CD), 0x00 },
> > -	{ IMX415_REG_8BIT(0x36CE), 0x3C },
> > -	{ IMX415_REG_8BIT(0x36D0), 0x8C },
> > -	{ IMX415_REG_8BIT(0x36D1), 0x00 },
> > -	{ IMX415_REG_8BIT(0x36D2), 0x71 },
> > -	{ IMX415_REG_8BIT(0x36D4), 0x3C },
> > -	{ IMX415_REG_8BIT(0x36D6), 0x53 },
> > -	{ IMX415_REG_8BIT(0x36D7), 0x00 },
> > -	{ IMX415_REG_8BIT(0x36D8), 0x71 },
> > -	{ IMX415_REG_8BIT(0x36DA), 0x8C },
> > -	{ IMX415_REG_8BIT(0x36DB), 0x00 },
> > -	{ IMX415_REG_8BIT(0x3724), 0x02 },
> > -	{ IMX415_REG_8BIT(0x3726), 0x02 },
> > -	{ IMX415_REG_8BIT(0x3732), 0x02 },
> > -	{ IMX415_REG_8BIT(0x3734), 0x03 },
> > -	{ IMX415_REG_8BIT(0x3736), 0x03 },
> > -	{ IMX415_REG_8BIT(0x3742), 0x03 },
> > -	{ IMX415_REG_8BIT(0x3862), 0xE0 },
> > -	{ IMX415_REG_8BIT(0x38CC), 0x30 },
> > -	{ IMX415_REG_8BIT(0x38CD), 0x2F },
> > -	{ IMX415_REG_8BIT(0x395C), 0x0C },
> > -	{ IMX415_REG_8BIT(0x3A42), 0xD1 },
> > -	{ IMX415_REG_8BIT(0x3A4C), 0x77 },
> > -	{ IMX415_REG_8BIT(0x3AE0), 0x02 },
> > -	{ IMX415_REG_8BIT(0x3AEC), 0x0C },
> > -	{ IMX415_REG_8BIT(0x3B00), 0x2E },
> > -	{ IMX415_REG_8BIT(0x3B06), 0x29 },
> > -	{ IMX415_REG_8BIT(0x3B98), 0x25 },
> > -	{ IMX415_REG_8BIT(0x3B99), 0x21 },
> > -	{ IMX415_REG_8BIT(0x3B9B), 0x13 },
> > -	{ IMX415_REG_8BIT(0x3B9C), 0x13 },
> > -	{ IMX415_REG_8BIT(0x3B9D), 0x13 },
> > -	{ IMX415_REG_8BIT(0x3B9E), 0x13 },
> > -	{ IMX415_REG_8BIT(0x3BA1), 0x00 },
> > -	{ IMX415_REG_8BIT(0x3BA2), 0x06 },
> > -	{ IMX415_REG_8BIT(0x3BA3), 0x0B },
> > -	{ IMX415_REG_8BIT(0x3BA4), 0x10 },
> > -	{ IMX415_REG_8BIT(0x3BA5), 0x14 },
> > -	{ IMX415_REG_8BIT(0x3BA6), 0x18 },
> > -	{ IMX415_REG_8BIT(0x3BA7), 0x1A },
> > -	{ IMX415_REG_8BIT(0x3BA8), 0x1A },
> > -	{ IMX415_REG_8BIT(0x3BA9), 0x1A },
> > -	{ IMX415_REG_8BIT(0x3BAC), 0xED },
> > -	{ IMX415_REG_8BIT(0x3BAD), 0x01 },
> > -	{ IMX415_REG_8BIT(0x3BAE), 0xF6 },
> > -	{ IMX415_REG_8BIT(0x3BAF), 0x02 },
> > -	{ IMX415_REG_8BIT(0x3BB0), 0xA2 },
> > -	{ IMX415_REG_8BIT(0x3BB1), 0x03 },
> > -	{ IMX415_REG_8BIT(0x3BB2), 0xE0 },
> > -	{ IMX415_REG_8BIT(0x3BB3), 0x03 },
> > -	{ IMX415_REG_8BIT(0x3BB4), 0xE0 },
> > -	{ IMX415_REG_8BIT(0x3BB5), 0x03 },
> > -	{ IMX415_REG_8BIT(0x3BB6), 0xE0 },
> > -	{ IMX415_REG_8BIT(0x3BB7), 0x03 },
> > -	{ IMX415_REG_8BIT(0x3BB8), 0xE0 },
> > -	{ IMX415_REG_8BIT(0x3BBA), 0xE0 },
> > -	{ IMX415_REG_8BIT(0x3BBC), 0xDA },
> > -	{ IMX415_REG_8BIT(0x3BBE), 0x88 },
> > -	{ IMX415_REG_8BIT(0x3BC0), 0x44 },
> > -	{ IMX415_REG_8BIT(0x3BC2), 0x7B },
> > -	{ IMX415_REG_8BIT(0x3BC4), 0xA2 },
> > -	{ IMX415_REG_8BIT(0x3BC8), 0xBD },
> > -	{ IMX415_REG_8BIT(0x3BCA), 0xBD },
> > +	{ CCI_REG8(0x32D4), 0x21 },
> > +	{ CCI_REG8(0x32EC), 0xA1 },
> > +	{ CCI_REG8(0x3452), 0x7F },
> > +	{ CCI_REG8(0x3453), 0x03 },
> > +	{ CCI_REG8(0x358A), 0x04 },
> > +	{ CCI_REG8(0x35A1), 0x02 },
> > +	{ CCI_REG8(0x36BC), 0x0C },
> > +	{ CCI_REG8(0x36CC), 0x53 },
> > +	{ CCI_REG8(0x36CD), 0x00 },
> > +	{ CCI_REG8(0x36CE), 0x3C },
> > +	{ CCI_REG8(0x36D0), 0x8C },
> > +	{ CCI_REG8(0x36D1), 0x00 },
> > +	{ CCI_REG8(0x36D2), 0x71 },
> > +	{ CCI_REG8(0x36D4), 0x3C },
> > +	{ CCI_REG8(0x36D6), 0x53 },
> > +	{ CCI_REG8(0x36D7), 0x00 },
> > +	{ CCI_REG8(0x36D8), 0x71 },
> > +	{ CCI_REG8(0x36DA), 0x8C },
> > +	{ CCI_REG8(0x36DB), 0x00 },
> > +	{ CCI_REG8(0x3724), 0x02 },
> > +	{ CCI_REG8(0x3726), 0x02 },
> > +	{ CCI_REG8(0x3732), 0x02 },
> > +	{ CCI_REG8(0x3734), 0x03 },
> > +	{ CCI_REG8(0x3736), 0x03 },
> > +	{ CCI_REG8(0x3742), 0x03 },
> > +	{ CCI_REG8(0x3862), 0xE0 },
> > +	{ CCI_REG8(0x38CC), 0x30 },
> > +	{ CCI_REG8(0x38CD), 0x2F },
> > +	{ CCI_REG8(0x395C), 0x0C },
> > +	{ CCI_REG8(0x3A42), 0xD1 },
> > +	{ CCI_REG8(0x3A4C), 0x77 },
> > +	{ CCI_REG8(0x3AE0), 0x02 },
> > +	{ CCI_REG8(0x3AEC), 0x0C },
> > +	{ CCI_REG8(0x3B00), 0x2E },
> > +	{ CCI_REG8(0x3B06), 0x29 },
> > +	{ CCI_REG8(0x3B98), 0x25 },
> > +	{ CCI_REG8(0x3B99), 0x21 },
> > +	{ CCI_REG8(0x3B9B), 0x13 },
> > +	{ CCI_REG8(0x3B9C), 0x13 },
> > +	{ CCI_REG8(0x3B9D), 0x13 },
> > +	{ CCI_REG8(0x3B9E), 0x13 },
> > +	{ CCI_REG8(0x3BA1), 0x00 },
> > +	{ CCI_REG8(0x3BA2), 0x06 },
> > +	{ CCI_REG8(0x3BA3), 0x0B },
> > +	{ CCI_REG8(0x3BA4), 0x10 },
> > +	{ CCI_REG8(0x3BA5), 0x14 },
> > +	{ CCI_REG8(0x3BA6), 0x18 },
> > +	{ CCI_REG8(0x3BA7), 0x1A },
> > +	{ CCI_REG8(0x3BA8), 0x1A },
> > +	{ CCI_REG8(0x3BA9), 0x1A },
> > +	{ CCI_REG8(0x3BAC), 0xED },
> > +	{ CCI_REG8(0x3BAD), 0x01 },
> > +	{ CCI_REG8(0x3BAE), 0xF6 },
> > +	{ CCI_REG8(0x3BAF), 0x02 },
> > +	{ CCI_REG8(0x3BB0), 0xA2 },
> > +	{ CCI_REG8(0x3BB1), 0x03 },
> > +	{ CCI_REG8(0x3BB2), 0xE0 },
> > +	{ CCI_REG8(0x3BB3), 0x03 },
> > +	{ CCI_REG8(0x3BB4), 0xE0 },
> > +	{ CCI_REG8(0x3BB5), 0x03 },
> > +	{ CCI_REG8(0x3BB6), 0xE0 },
> > +	{ CCI_REG8(0x3BB7), 0x03 },
> > +	{ CCI_REG8(0x3BB8), 0xE0 },
> > +	{ CCI_REG8(0x3BBA), 0xE0 },
> > +	{ CCI_REG8(0x3BBC), 0xDA },
> > +	{ CCI_REG8(0x3BBE), 0x88 },
> > +	{ CCI_REG8(0x3BC0), 0x44 },
> > +	{ CCI_REG8(0x3BC2), 0x7B },
> > +	{ CCI_REG8(0x3BC4), 0xA2 },
> > +	{ CCI_REG8(0x3BC8), 0xBD },
> > +	{ CCI_REG8(0x3BCA), 0xBD },
> >=20
> >  };
> > =20
> >  static inline struct imx415 *to_imx415(struct v4l2_subdev *sd)
> >=20
> > @@ -460,74 +445,25 @@ static inline struct imx415 *to_imx415(struct
> > v4l2_subdev *sd)>=20
> >  	return container_of(sd, struct imx415, subdev);
> > =20
> >  }
> >=20
> > -static int imx415_read(struct imx415 *sensor, u32 addr)
> > -{
> > -	u8 data[3] =3D { 0 };
> > -	int ret;
> > -
> > -	ret =3D regmap_raw_read(sensor->regmap, addr & IMX415_REG_ADDR_MASK,=
=20
data,
> > -			      (addr >> IMX415_REG_SIZE_SHIFT) & 3);
> > -	if (ret < 0)
> > -		return ret;
> > -
> > -	return (data[2] << 16) | (data[1] << 8) | data[0];
> > -}
> > -
> > -static int imx415_write(struct imx415 *sensor, u32 addr, u32 value)
> > -{
> > -	u8 data[3] =3D { value & 0xff, (value >> 8) & 0xff, value >> 16 };
> > -	int ret;
> > -
> > -	ret =3D regmap_raw_write(sensor->regmap, addr & IMX415_REG_ADDR_MASK,
> > -			       data, (addr >> IMX415_REG_SIZE_SHIFT) &=20
3);
> > -	if (ret < 0)
> > -		dev_err_ratelimited(sensor->dev,
> > -				    "%u-bit write to 0x%04x failed:=20
%d\n",
> > -				    ((addr >> IMX415_REG_SIZE_SHIFT) &=20
3) * 8,
> > -				    addr & IMX415_REG_ADDR_MASK, ret);
> > -
> > -	return 0;
> > -}
> > -
> >=20
> >  static int imx415_set_testpattern(struct imx415 *sensor, int val)
> >  {
> > =20
> >  	int ret;
>=20
> You need to initialize ret to 0 here, otherwise the first cci_write()
> call will get a random value.

Nice catch. Thanks.

> As a v3 is needed, would you consider switching to lower-case hex
> constants for registers while at it ?

Sure, I'll change them accordingly.

>=20
> >  	if (val) {
> >=20
> > -		ret =3D imx415_write(sensor, IMX415_BLKLEVEL, 0x00);
> > -		if (ret)
> > -			return ret;
> > -		ret =3D imx415_write(sensor, IMX415_TPG_EN_DUOUT, 0x01);
> > -		if (ret)
> > -			return ret;
> > -		ret =3D imx415_write(sensor, IMX415_TPG_PATSEL_DUOUT, val -=20
1);
> > -		if (ret)
> > -			return ret;
> > -		ret =3D imx415_write(sensor, IMX415_TPG_COLORWIDTH, 0x01);
> > -		if (ret)
> > -			return ret;
> > -		ret =3D imx415_write(sensor, IMX415_TESTCLKEN_MIPI, 0x20);
> > -		if (ret)
> > -			return ret;
> > -		ret =3D imx415_write(sensor, IMX415_DIG_CLP_MODE, 0x00);
> > -		if (ret)
> > -			return ret;
> > -		ret =3D imx415_write(sensor, IMX415_WRJ_OPEN, 0x00);
> > +		cci_write(sensor->regmap, IMX415_BLKLEVEL, 0x00, &ret);
> > +		cci_write(sensor->regmap, IMX415_TPG_EN_DUOUT, 0x01,=20
&ret);
> > +		cci_write(sensor->regmap, IMX415_TPG_PATSEL_DUOUT, val -=20
1, &ret);
> > +		cci_write(sensor->regmap, IMX415_TPG_COLORWIDTH, 0x01,=20
&ret);
> > +		cci_write(sensor->regmap, IMX415_TESTCLKEN_MIPI, 0x20,=20
&ret);
> > +		cci_write(sensor->regmap, IMX415_DIG_CLP_MODE, 0x00,=20
&ret);
> > +		cci_write(sensor->regmap, IMX415_WRJ_OPEN, 0x00, &ret);
> >=20
> >  	} else {
> >=20
> > -		ret =3D imx415_write(sensor, IMX415_BLKLEVEL,
> > -				   IMX415_BLKLEVEL_DEFAULT);
> > -		if (ret)
> > -			return ret;
> > -		ret =3D imx415_write(sensor, IMX415_TPG_EN_DUOUT, 0x00);
> > -		if (ret)
> > -			return ret;
> > -		ret =3D imx415_write(sensor, IMX415_TESTCLKEN_MIPI, 0x00);
> > -		if (ret)
> > -			return ret;
> > -		ret =3D imx415_write(sensor, IMX415_DIG_CLP_MODE, 0x01);
> > -		if (ret)
> > -			return ret;
> > -		ret =3D imx415_write(sensor, IMX415_WRJ_OPEN, 0x01);
> > +		cci_write(sensor->regmap, IMX415_BLKLEVEL,
> > +				   IMX415_BLKLEVEL_DEFAULT, &ret);
> > +		cci_write(sensor->regmap, IMX415_TPG_EN_DUOUT, 0x00,=20
&ret);
> > +		cci_write(sensor->regmap, IMX415_TESTCLKEN_MIPI, 0x00,=20
&ret);
> > +		cci_write(sensor->regmap, IMX415_DIG_CLP_MODE, 0x01,=20
&ret);
> > +		cci_write(sensor->regmap, IMX415_WRJ_OPEN, 0x01, &ret);
> >=20
> >  	}
> >  	return 0;
> > =20
> >  }
> >=20
> > @@ -540,7 +476,7 @@ static int imx415_s_ctrl(struct v4l2_ctrl *ctrl)
> >=20
> >  	struct v4l2_subdev_state *state;
> >  	unsigned int vmax;
> >  	unsigned int flip;
> >=20
> > -	int ret;
> > +	int ret =3D 0;
> >=20
> >  	if (!pm_runtime_get_if_in_use(sensor->dev))
> >  =09
> >  		return 0;
> >=20
> > @@ -553,19 +489,19 @@ static int imx415_s_ctrl(struct v4l2_ctrl *ctrl)
> >=20
> >  		/* clamp the exposure value to VMAX. */
> >  		vmax =3D format->height + sensor->vblank->cur.val;
> >  		ctrl->val =3D min_t(int, ctrl->val, vmax);
> >=20
> > -		ret =3D imx415_write(sensor, IMX415_SHR0, vmax - ctrl->val);
> > +		ret =3D cci_write(sensor->regmap, IMX415_SHR0, vmax - ctrl-
>val, &ret);
>=20
> If you assign the return value to ret, you don't need to pass &ret as
> the last argument, you can use NULL. Initializating ret to 0 will then
> not be required.

My ides was to use &ret in case an additional write before or afterwards is=
=20
added, so these lines don't need to be touched again. But I'll keep it simp=
le=20
for now.

>=20
> With these small issues addressed,
>=20
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

Thanks.

Best regards,
Alexander

>=20
> >  		break;
> >  =09
> >  	case V4L2_CID_ANALOGUE_GAIN:
> >  		/* analogue gain in 0.3 dB step size */
> >=20
> > -		ret =3D imx415_write(sensor, IMX415_GAIN_PCG_0, ctrl->val);
> > +		ret =3D cci_write(sensor->regmap, IMX415_GAIN_PCG_0, ctrl-
>val, &ret);
> >=20
> >  		break;
> >  =09
> >  	case V4L2_CID_HFLIP:
> >  =09
> >  	case V4L2_CID_VFLIP:
> >  		flip =3D (sensor->hflip->val << IMX415_HREVERSE_SHIFT) |
> >  	=09
> >  		       (sensor->vflip->val << IMX415_VREVERSE_SHIFT);
> >=20
> > -		ret =3D imx415_write(sensor, IMX415_REVERSE, flip);
> > +		ret =3D cci_write(sensor->regmap, IMX415_REVERSE, flip,=20
&ret);
> >=20
> >  		break;
> >  =09
> >  	case V4L2_CID_TEST_PATTERN:
> > @@ -679,8 +615,6 @@ static int imx415_ctrls_init(struct imx415 *sensor)
> >=20
> >  static int imx415_set_mode(struct imx415 *sensor, int mode)
> >  {
> >=20
> > -	const struct imx415_reg *reg;
> > -	unsigned int i;
> >=20
> >  	int ret =3D 0;
> >  =09
> >  	if (mode >=3D ARRAY_SIZE(supported_modes)) {
> >=20
> > @@ -688,34 +622,29 @@ static int imx415_set_mode(struct imx415 *sensor,
> > int mode)>=20
> >  		return -EINVAL;
> >  =09
> >  	}
> >=20
> > -	for (i =3D 0; i < supported_modes[mode].reg_list.num_of_regs; ++i) {
> > -		reg =3D &supported_modes[mode].reg_list.regs[i];
> > -		ret =3D imx415_write(sensor, reg->address, reg->val);
> > -		if (ret)
> > -			return ret;
> > -	}
> > +	cci_multi_reg_write(sensor->regmap,
> > +			    supported_modes[mode].reg_list.regs,
> > +			    supported_modes[mode].reg_list.num_of_regs,
> > +			    &ret);
> >=20
> > -	for (i =3D 0; i < IMX415_NUM_CLK_PARAM_REGS; ++i) {
> > -		reg =3D &sensor->clk_params->regs[i];
> > -		ret =3D imx415_write(sensor, reg->address, reg->val);
> > -		if (ret)
> > -			return ret;
> > -	}
> > +	cci_multi_reg_write(sensor->regmap,
> > +			    sensor->clk_params->regs,
> > +			    IMX415_NUM_CLK_PARAM_REGS,
> > +			    &ret);
> >=20
> >  	return 0;
> > =20
> >  }
> > =20
> >  static int imx415_setup(struct imx415 *sensor, struct v4l2_subdev_state
> >  *state) {
> >=20
> > -	unsigned int i;
> >=20
> >  	int ret;
> >=20
> > -	for (i =3D 0; i < ARRAY_SIZE(imx415_init_table); ++i) {
> > -		ret =3D imx415_write(sensor, imx415_init_table[i].address,
> > -				   imx415_init_table[i].val);
> > -		if (ret)
> > -			return ret;
> > -	}
> > +	ret =3D cci_multi_reg_write(sensor->regmap,
> > +				  imx415_init_table,
> > +				  ARRAY_SIZE(imx415_init_table),
> > +				  NULL);
> > +	if (ret)
> > +		return ret;
> >=20
> >  	return imx415_set_mode(sensor, sensor->cur_mode);
> > =20
> >  }
> >=20
> > @@ -724,7 +653,7 @@ static int imx415_wakeup(struct imx415 *sensor)
> >=20
> >  {
> > =20
> >  	int ret;
> >=20
> > -	ret =3D imx415_write(sensor, IMX415_MODE, IMX415_MODE_OPERATING);
> > +	ret =3D cci_write(sensor->regmap, IMX415_MODE, IMX415_MODE_OPERATING,
> > NULL);>=20
> >  	if (ret)
> >  =09
> >  		return ret;
> >=20
> > @@ -743,21 +672,15 @@ static int imx415_stream_on(struct imx415 *sensor)
> >=20
> >  	int ret;
> >  =09
> >  	ret =3D imx415_wakeup(sensor);
> >=20
> > -	if (ret)
> > -		return ret;
> > -
> > -	return imx415_write(sensor, IMX415_XMSTA, IMX415_XMSTA_START);
> > +	return cci_write(sensor->regmap, IMX415_XMSTA, IMX415_XMSTA_START,
> > &ret);
> >=20
> >  }
> > =20
> >  static int imx415_stream_off(struct imx415 *sensor)
> >  {
> > =20
> >  	int ret;
> >=20
> > -	ret =3D imx415_write(sensor, IMX415_XMSTA, IMX415_XMSTA_STOP);
> > -	if (ret)
> > -		return ret;
> > -
> > -	return imx415_write(sensor, IMX415_MODE, IMX415_MODE_STANDBY);
> > +	ret =3D cci_write(sensor->regmap, IMX415_XMSTA, IMX415_XMSTA_STOP,=20
NULL);
> > +	return cci_write(sensor->regmap, IMX415_MODE, IMX415_MODE_STANDBY,
> > &ret);
> >=20
> >  }
> > =20
> >  static int imx415_s_stream(struct v4l2_subdev *sd, int enable)
> >=20
> > @@ -992,6 +915,7 @@ static void imx415_power_off(struct imx415 *sensor)
> >=20
> >  static int imx415_identify_model(struct imx415 *sensor)
> >  {
> > =20
> >  	int model, ret;
> >=20
> > +	u64 chip_id;
> >=20
> >  	/*
> >  =09
> >  	 * While most registers can be read when the sensor is in standby,=20
this
> >=20
> > @@ -1002,7 +926,7 @@ static int imx415_identify_model(struct imx415
> > *sensor)>=20
> >  		return dev_err_probe(sensor->dev, ret,
> >  	=09
> >  				     "failed to get sensor out of=20
standby\n");
> >=20
> > -	ret =3D imx415_read(sensor, IMX415_SENSOR_INFO);
> > +	ret =3D cci_read(sensor->regmap, IMX415_SENSOR_INFO, &chip_id, NULL);
> >=20
> >  	if (ret < 0) {
> >  =09
> >  		dev_err_probe(sensor->dev, ret,
> >  	=09
> >  			      "failed to read sensor information\n");
> >=20
> > @@ -1024,7 +948,7 @@ static int imx415_identify_model(struct imx415
> > *sensor)>=20
> >  	ret =3D 0;
> > =20
> >  done:
> > -	imx415_write(sensor, IMX415_MODE, IMX415_MODE_STANDBY);
> > +	cci_write(sensor->regmap, IMX415_MODE, IMX415_MODE_STANDBY, &ret);
> >=20
> >  	return ret;
> > =20
> >  }
> >=20
> > @@ -1173,7 +1097,7 @@ static int imx415_probe(struct i2c_client *client)
> >=20
> >  	if (ret)
> >  =09
> >  		return ret;
> >=20
> > -	sensor->regmap =3D devm_regmap_init_i2c(client,=20
&imx415_regmap_config);
> > +	sensor->regmap =3D devm_cci_regmap_init_i2c(client, 16);
> >=20
> >  	if (IS_ERR(sensor->regmap))
> >  =09
> >  		return PTR_ERR(sensor->regmap);


=2D-=20
TQ-Systems GmbH | M=FChlstra=DFe 2, Gut Delling | 82229 Seefeld, Germany
Amtsgericht M=FCnchen, HRB 105018
Gesch=E4ftsf=FChrer: Detlef Schneider, R=FCdiger Stahl, Stefan Schneider
http://www.tq-group.com/



