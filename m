Return-Path: <linux-media+bounces-62658-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SEHeBiHfEGr2ewYAu9opvQ
	(envelope-from <linux-media+bounces-62658-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sat, 23 May 2026 00:56:33 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C9985BB47A
	for <lists+linux-media@lfdr.de>; Sat, 23 May 2026 00:56:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id C0DD33020FCA
	for <lists+linux-media@lfdr.de>; Fri, 22 May 2026 22:55:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CA6983932D9;
	Fri, 22 May 2026 22:55:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KEkSnoYC"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DB53385D9E;
	Fri, 22 May 2026 22:55:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779490530; cv=none; b=dAUt3Ljl264aYTOREP5WEeOsETfw6Hwx1CGCPokNy/+H8f4PLt1L9TU1hamZ6/309YeTtFSlVe9hY2hjduLtLjotA+QaAj1Sb6N6HJvfGzgUvL+k0zGHV+pZ+Ba22d2c3KBYoWJ/7N8+dxAKpjCJYJp8Baq+ZbW+WNPE+KvM45s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779490530; c=relaxed/simple;
	bh=20+rGR4VNlKUJd746gK8rQxp0vIIBlrQqEUFsb9h5jc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dPHJPZORo6DJlrPnYkummAeC3q1u/g31QsXei7o84fMR0qirdia3iaMzubmxSozEbR/GdjusD1L0BH1uFZ6/7GQYs5jYQiIj9tFjLRuo7snWvV7g1mFZw3VGNZTommeuQmXE4TBZBBM378r26RQLoJhteQ9yHixo3wh+yAQatuU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KEkSnoYC; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779490528; x=1811026528;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=20+rGR4VNlKUJd746gK8rQxp0vIIBlrQqEUFsb9h5jc=;
  b=KEkSnoYCGpxVcaNVsuGeuq5+L+8oY+k2Ut5ptLV2++NmbwNKshubcOA9
   fsZ+ojeZUgDzXRUcO0wqCHp28jO2dM2d72v0oKXnoYa9zMd6DS2nOFEOd
   VC4BnW0ZCKjApj6qa5SfxBYhs465kiHlYQExnYLenyyUBjp8Rr3IAsr3Q
   /geq7L9KzlzCn4FadbjC65hjlP12YTP9l6ItSKub9x6+jET7ttvOBgBBm
   53vYWWHQXhh/O3a4BeHX+lPObmkg4oxkodDoCxFPexR2T7m4HMFoDbAfp
   TGRjIKeVFYRyPurqhJymM66qaY4qClWjeb1vR0+8/bATJTMYrUOJvoIXi
   g==;
X-CSE-ConnectionGUID: mVh7aAjfQXaaVnczcR2XIg==
X-CSE-MsgGUID: 99Goc7wXSYiwQbt65yA2+g==
X-IronPort-AV: E=McAfee;i="6800,10657,11794"; a="80457958"
X-IronPort-AV: E=Sophos;i="6.24,163,1774335600"; 
   d="scan'208";a="80457958"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 May 2026 15:55:27 -0700
X-CSE-ConnectionGUID: rG/vIGfnSD6z7Z65kz35pw==
X-CSE-MsgGUID: odWaqhwwQk2YC3XBvHIwqQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,163,1774335600"; 
   d="scan'208";a="240198787"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.81])
  by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 May 2026 15:55:25 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 01CE2121CA3;
	Sat, 23 May 2026 01:48:17 +0300 (EEST)
Date: Sat, 23 May 2026 01:48:17 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Kate Hsuan <hpa@redhat.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans de Goede <johannes.goede@oss.qualcomm.com>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	Serin Yeh <serin.yeh@intel.com>, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 2/3] media: i2c: imx471: Add Sony IMX471 image sensor
 driver
Message-ID: <ahDdMZjID07dRDhZ@kekkonen.localdomain>
References: <20260522031121.11968-1-hpa@redhat.com>
 <20260522031121.11968-3-hpa@redhat.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260522031121.11968-3-hpa@redhat.com>
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-62658-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	HAS_ORG_HEADER(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[intel.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sakari.ailus@linux.intel.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,cisco];
	RCPT_COUNT_SEVEN(0.00)[7];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,kekkonen.localdomain:mid,intel.com:email,intel.com:dkim]
X-Rspamd-Queue-Id: 7C9985BB47A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Kate,

Thanks for the update.

On Fri, May 22, 2026 at 11:11:20AM +0800, Kate Hsuan wrote:
> Add a new driver for Sony imx471 camera sensor. It is based on
> Jimmy Su <jimmy.su@intel.com> implementation and the driver can be found
> in the following URL.
> https://github.com/intel/ipu6-drivers/commits/master/drivers/media/i2c/imx471.c
> 
> This sensor can be found on Lenovo X9-14 and X9-15 laptop and it is a part

s/laptop\K/s/

> of IPU7 solution. The driver was tested on Lenovo X9-14 and X9-15 laptops.
> 
> Signed-off-by: Kate Hsuan <hpa@redhat.com>
> ---
>  MAINTAINERS                |    6 +
>  drivers/media/i2c/Kconfig  |   10 +
>  drivers/media/i2c/Makefile |    1 +
>  drivers/media/i2c/imx471.c | 1006 ++++++++++++++++++++++++++++++++++++
>  4 files changed, 1023 insertions(+)
>  create mode 100644 drivers/media/i2c/imx471.c
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 1126fdd639ad..d597337e7c24 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -24735,6 +24735,12 @@ T:	git git://linuxtv.org/media.git
>  F:	Documentation/devicetree/bindings/media/i2c/sony,imx415.yaml
>  F:	drivers/media/i2c/imx415.c
>  
> +SONY IMX471 SENSOR DRIVER
> +M:	Kate Hsuan <hpa@redhat.com>
> +L:	linux-media@vger.kernel.org
> +S:	Maintained
> +F:	drivers/media/i2c/imx471.c
> +
>  SONY MEMORYSTICK SUBSYSTEM
>  M:	Maxim Levitsky <maximlevitsky@gmail.com>
>  M:	Alex Dubov <oakad@yahoo.com>

...

> diff --git a/drivers/media/i2c/imx471.c b/drivers/media/i2c/imx471.c
> new file mode 100644
> index 000000000000..f3c7fdce2d50
> --- /dev/null
> +++ b/drivers/media/i2c/imx471.c

...

> +
> +#define IMX471_NUM_SUPPLIES			ARRAY_SIZE(imx471_supply_name)

Please just use ARRAY_SIZE() where you need it.

> +
> +/* Mode : resolution and related config&values */
> +struct imx471_mode {
> +	/* Frame width */
> +	u32 width;
> +	/* Frame height */
> +	u32 height;
> +
> +	/* V-timing */
> +	u32 fll_def;
> +	u32 fll_min;
> +
> +	/* H-timing */
> +	u32 llp;
> +
> +	/* index of link frequency */
> +	u32 link_freq_index;
> +
> +	/* Default register values */
> +	const struct cci_reg_sequence *default_mode_regs;
> +	const int default_mode_regs_length;

unsigned int?

const-ness here doesn't really matter as the entire struct is const.

> +};
> +
> +struct imx471 {
> +	struct v4l2_subdev sd;
> +	struct media_pad pad;
> +
> +	struct v4l2_ctrl_handler ctrl_handler;
> +	/* V4L2 Controls */
> +	struct v4l2_ctrl *link_freq;
> +	struct v4l2_ctrl *pixel_rate;
> +	struct v4l2_ctrl *vblank;
> +	struct v4l2_ctrl *hblank;
> +	struct v4l2_ctrl *vflip;
> +	struct v4l2_ctrl *hflip;
> +	struct v4l2_ctrl *exposure;

Do you need all these? At least link_freq remains effectively unused.

> +
> +	struct gpio_desc *reset_gpio;
> +	struct regulator_bulk_data supplies[IMX471_NUM_SUPPLIES];
> +	struct clk *img_clk;
> +
> +	struct device *dev;
> +	struct regmap *regmap;
> +};
> +
> +static const struct cci_reg_sequence imx471_global_regs[] = {
> +	{ CCI_REG8(0x0136), 0x13 },
> +	{ CCI_REG8(0x0137), 0x33 },
> +	{ CCI_REG8(0x3c7e), 0x08 },
> +	{ CCI_REG8(0x3c7f), 0x05 },
> +	{ CCI_REG8(0x3e35), 0x00 },
> +	{ CCI_REG8(0x3e36), 0x00 },
> +	{ CCI_REG8(0x3e37), 0x00 },
> +	{ CCI_REG8(0x3f7f), 0x01 },
> +	{ CCI_REG8(0x4431), 0x04 },
> +	{ CCI_REG8(0x531c), 0x01 },
> +	{ CCI_REG8(0x531d), 0x02 },
> +	{ CCI_REG8(0x531e), 0x04 },
> +	{ CCI_REG8(0x5928), 0x00 },
> +	{ CCI_REG8(0x5929), 0x2f },
> +	{ CCI_REG8(0x592a), 0x00 },
> +	{ CCI_REG8(0x592b), 0x85 },
> +	{ CCI_REG8(0x592c), 0x00 },
> +	{ CCI_REG8(0x592d), 0x32 },
> +	{ CCI_REG8(0x592e), 0x00 },
> +	{ CCI_REG8(0x592f), 0x88 },
> +	{ CCI_REG8(0x5930), 0x00 },
> +	{ CCI_REG8(0x5931), 0x3d },
> +	{ CCI_REG8(0x5932), 0x00 },
> +	{ CCI_REG8(0x5933), 0x93 },
> +	{ CCI_REG8(0x5938), 0x00 },
> +	{ CCI_REG8(0x5939), 0x24 },
> +	{ CCI_REG8(0x593a), 0x00 },
> +	{ CCI_REG8(0x593b), 0x7a },
> +	{ CCI_REG8(0x593c), 0x00 },
> +	{ CCI_REG8(0x593d), 0x24 },
> +	{ CCI_REG8(0x593e), 0x00 },
> +	{ CCI_REG8(0x593f), 0x7a },
> +	{ CCI_REG8(0x5940), 0x00 },
> +	{ CCI_REG8(0x5941), 0x2f },
> +	{ CCI_REG8(0x5942), 0x00 },
> +	{ CCI_REG8(0x5943), 0x85 },
> +	{ CCI_REG8(0x5f0e), 0x6e },
> +	{ CCI_REG8(0x5f11), 0xc6 },
> +	{ CCI_REG8(0x5f17), 0x5e },
> +	{ CCI_REG8(0x7990), 0x01 },
> +	{ CCI_REG8(0x7993), 0x5d },
> +	{ CCI_REG8(0x7994), 0x5d },
> +	{ CCI_REG8(0x7995), 0xa1 },
> +	{ CCI_REG8(0x799a), 0x01 },
> +	{ CCI_REG8(0x799d), 0x00 },
> +	{ CCI_REG8(0x8169), 0x01 },
> +	{ CCI_REG8(0x8359), 0x01 },
> +	{ CCI_REG8(0x9302), 0x1e },
> +	{ CCI_REG8(0x9306), 0x1f },
> +	{ CCI_REG8(0x930a), 0x26 },
> +	{ CCI_REG8(0x930e), 0x23 },
> +	{ CCI_REG8(0x9312), 0x23 },
> +	{ CCI_REG8(0x9316), 0x2c },
> +	{ CCI_REG8(0x9317), 0x19 },
> +	{ CCI_REG8(0xb046), 0x01 },
> +	{ CCI_REG8(0xb048), 0x01 },
> +};
> +
> +static const struct cci_reg_sequence mode_1928x1088_regs[] = {
> +	{ CCI_REG8(0x0101), 0x00 },
> +	{ CCI_REG8(0x0112), 0x0a },
> +	{ CCI_REG8(0x0113), 0x0a },
> +	{ CCI_REG8(0x0114), 0x03 },
> +	{ CCI_REG8(0x0342), 0x0a },
> +	{ CCI_REG8(0x0343), 0x00 },
> +	{ CCI_REG8(0x0340), 0x13 },
> +	{ CCI_REG8(0x0341), 0xb0 },
> +	{ CCI_REG8(0x0344), 0x00 },
> +	{ CCI_REG8(0x0345), 0x00 },
> +	{ CCI_REG8(0x0346), 0x01 },
> +	{ CCI_REG8(0x0347), 0xbc },
> +	{ CCI_REG8(0x0348), 0x12 },
> +	{ CCI_REG8(0x0349), 0x2f },
> +	{ CCI_REG8(0x034a), 0x0b },
> +	{ CCI_REG8(0x034b), 0xeb },
> +	{ CCI_REG8(0x0381), 0x01 },
> +	{ CCI_REG8(0x0383), 0x01 },
> +	{ CCI_REG8(0x0385), 0x01 },
> +	{ CCI_REG8(0x0387), 0x01 },
> +	{ CCI_REG8(0x0900), 0x01 },
> +	{ CCI_REG8(0x0901), 0x22 },
> +	{ CCI_REG8(0x0902), 0x08 },
> +	{ CCI_REG8(0x3f4c), 0x81 },
> +	{ CCI_REG8(0x3f4d), 0x81 },
> +	{ CCI_REG8(0x0408), 0x00 },
> +	{ CCI_REG8(0x0409), 0xc8 },
> +	{ CCI_REG8(0x040a), 0x00 },
> +	{ CCI_REG8(0x040b), 0x6c },
> +	{ CCI_REG8(0x040c), 0x07 },
> +	{ CCI_REG8(0x040d), 0x88 },
> +	{ CCI_REG8(0x040e), 0x04 },
> +	{ CCI_REG8(0x040f), 0x40 },
> +	{ CCI_REG8(0x034c), 0x07 },
> +	{ CCI_REG8(0x034d), 0x88 },
> +	{ CCI_REG8(0x034e), 0x04 },
> +	{ CCI_REG8(0x034f), 0x40 },
> +	{ CCI_REG8(0x0301), 0x06 },
> +	{ CCI_REG8(0x0303), 0x02 },
> +	{ CCI_REG8(0x0305), 0x02 },
> +	{ CCI_REG8(0x0306), 0x00 },
> +	{ CCI_REG8(0x0307), 0x79 },
> +	{ CCI_REG8(0x030b), 0x01 },
> +	{ CCI_REG8(0x030d), 0x02 },
> +	{ CCI_REG8(0x030e), 0x00 },
> +	{ CCI_REG8(0x030f), 0x53 },
> +	{ CCI_REG8(0x0310), 0x01 },
> +	{ CCI_REG8(0x0202), 0x13 },
> +	{ CCI_REG8(0x0203), 0x9e },
> +	{ CCI_REG8(0x0204), 0x00 },
> +	{ CCI_REG8(0x0205), 0x00 },
> +	{ CCI_REG8(0x020e), 0x01 },
> +	{ CCI_REG8(0x020f), 0x00 },
> +	{ CCI_REG8(0x3f78), 0x01 },
> +	{ CCI_REG8(0x3f79), 0x31 },
> +	{ CCI_REG8(0x3ffe), 0x00 },
> +	{ CCI_REG8(0x3fff), 0x8a },
> +	{ CCI_REG8(0x5f0a), 0xb6 },
> +};
> +
> +static const char * const imx471_test_pattern_menu[] = {
> +	"Disabled",
> +	"Solid Colour",
> +	"Eight Vertical Colour Bars",
> +	"Colour Bars With Fade to Grey",
> +	"Pseudorandom Sequence (PN9)",
> +};
> +
> +/*
> + * When adding more than the one below, make sure the disallowed ones will
> + * actually be disabled in the LINK_FREQ control.
> + */
> +static const s64 link_freq_menu_items[] = {
> +	IMX471_LINK_FREQ_DEFAULT,
> +};
> +
> +/*
> + * The Bayer formats for the flipping.
> + * - no flip
> + * - h flip
> + * - v flip
> + * - h and v flips
> + */
> +static const u32 imx471_hv_flips_bayer_order[] = {
> +	MEDIA_BUS_FMT_SRGGB10_1X10,
> +	MEDIA_BUS_FMT_SGRBG10_1X10,
> +	MEDIA_BUS_FMT_SGBRG10_1X10,
> +	MEDIA_BUS_FMT_SBGGR10_1X10,
> +};
> +
> +/* Mode configs */
> +static const struct imx471_mode imx471_modes[] = {
> +	{
> +		.width = 1928,
> +		.height = 1088,
> +		.fll_def = 1308,
> +		.fll_min = 1308,
> +		.llp = 2328,
> +		.link_freq_index = IMX471_LINK_FREQ_INDEX,
> +		.default_mode_regs = mode_1928x1088_regs,
> +		.default_mode_regs_length = ARRAY_SIZE(mode_1928x1088_regs),
> +	},
> +};
> +
> +static int imx471_get_regulators(struct device *dev, struct imx471 *sensor)
> +{
> +	for (unsigned int  i = 0; i < IMX471_NUM_SUPPLIES; i++)

s/ \K //

> +		sensor->supplies[i].supply = imx471_supply_name[i];
> +
> +	return devm_regulator_bulk_get(dev, IMX471_NUM_SUPPLIES,
> +				       sensor->supplies);
> +}

...

> +/* Start streaming */
> +static int imx471_enable_stream(struct v4l2_subdev *sd,
> +				struct v4l2_subdev_state *state,
> +				u32 pad, u64 streams_mask)
> +{
> +	struct imx471 *sensor = to_imx471(sd);
> +	const struct imx471_mode *mode;
> +	struct v4l2_mbus_framefmt *fmt;
> +	int ret;
> +
> +	ret = pm_runtime_resume_and_get(sensor->dev);
> +	if (ret)

Just return the error code here -- pm_runtime_resume_and_get() won't
increment the usage count unless it succeeds.

> +		goto error_powerdown;
> +
> +	ret = imx471_identify_module(sensor);
> +	if (ret)
> +		return ret;
> +
> +	/* Global Setting */
> +	cci_multi_reg_write(sensor->regmap, imx471_global_regs,
> +			    ARRAY_SIZE(imx471_global_regs), &ret);
> +	if (ret) {
> +		dev_err(sensor->dev, "failed to set global settings");
> +		goto error_powerdown;
> +	}
> +
> +	state = v4l2_subdev_get_locked_active_state(&sensor->sd);
> +	fmt = v4l2_subdev_state_get_format(state, 0);
> +	mode = v4l2_find_nearest_size(imx471_modes, ARRAY_SIZE(imx471_modes),
> +				      width, height, fmt->width, fmt->height);
> +
> +	/* Apply default values of current mode */
> +	cci_multi_reg_write(sensor->regmap, mode->default_mode_regs,
> +			    mode->default_mode_regs_length, &ret);
> +	if (ret) {
> +		dev_err(sensor->dev, "failed to set mode");
> +		goto error_powerdown;
> +	}
> +
> +	/* set digital gain control to all color mode */
> +	cci_write(sensor->regmap, IMX471_REG_DPGA_USE_GLOBAL_GAIN, 1, &ret);
> +	if (ret)
> +		goto error_powerdown;
> +
> +	/* Apply customized values from user */
> +	ret =  __v4l2_ctrl_handler_setup(&sensor->ctrl_handler);
> +	if (ret)
> +		goto error_powerdown;
> +
> +	cci_write(sensor->regmap, IMX471_REG_MODE_SELECT,
> +		  IMX471_MODE_STREAMING, &ret);
> +	if (ret)
> +		goto error_powerdown;
> +
> +	__v4l2_ctrl_grab(sensor->vflip, true);
> +	__v4l2_ctrl_grab(sensor->hflip, true);
> +
> +	return ret;
> +
> +error_powerdown:
> +	pm_runtime_put(sensor->dev);
> +
> +	return ret;
> +}
> +
> +/* Stop streaming */
> +static int imx471_disable_stream(struct v4l2_subdev *sd,
> +				 struct v4l2_subdev_state *state,
> +				 u32 pad, u64 streams_mask)
> +{
> +	struct imx471 *sensor = to_imx471(sd);
> +	int ret;
> +
> +	cci_write(sensor->regmap, IMX471_REG_MODE_SELECT,
> +		  IMX471_MODE_STANDBY, &ret);
> +	pm_runtime_put(sensor->dev);
> +
> +	if (ret)
> +		dev_err(sensor->dev,
> +			"failed to disable stream with return value: %d\n",
> +			ret);
> +	__v4l2_ctrl_grab(sensor->vflip, false);
> +	__v4l2_ctrl_grab(sensor->hflip, false);
> +
> +	return 0;
> +}
> +
> +static const struct v4l2_subdev_core_ops imx471_subdev_core_ops = {
> +	.subscribe_event = v4l2_ctrl_subdev_subscribe_event,
> +	.unsubscribe_event = v4l2_event_subdev_unsubscribe,
> +};
> +
> +static const struct v4l2_subdev_video_ops imx471_video_ops = {
> +	.s_stream = v4l2_subdev_s_stream_helper,
> +};
> +
> +static const struct v4l2_subdev_pad_ops imx471_pad_ops = {
> +	.enum_mbus_code = imx471_enum_mbus_code,
> +	.get_fmt = v4l2_subdev_get_fmt,
> +	.set_fmt = imx471_set_pad_format,
> +	.get_selection = imx471_get_selection,
> +	.enum_frame_size = imx471_enum_frame_size,
> +	.enable_streams = imx471_enable_stream,
> +	.disable_streams = imx471_disable_stream,
> +};
> +
> +static const struct v4l2_subdev_ops imx471_subdev_ops = {
> +	.core = &imx471_subdev_core_ops,
> +	.video = &imx471_video_ops,
> +	.pad = &imx471_pad_ops,
> +};
> +
> +static const struct v4l2_subdev_internal_ops imx471_internal_ops = {
> +	.init_state = imx471_init_state,
> +};
> +
> +/* Initialize control handlers */
> +static int imx471_init_controls(struct imx471 *sensor)
> +{
> +	const struct imx471_mode *mode = &imx471_modes[0];
> +	struct v4l2_ctrl_handler *ctrl_hdlr;
> +	struct v4l2_fwnode_device_properties props;
> +	s64 exposure_max, hblank;
> +	u64 pixel_rate;
> +	int ret;
> +
> +	ctrl_hdlr = &sensor->ctrl_handler;
> +	ret = v4l2_ctrl_handler_init(ctrl_hdlr, 10);
> +	if (ret)
> +		return ret;
> +
> +	ret = v4l2_fwnode_device_parse(sensor->dev, &props);
> +	if (ret) {
> +		dev_err(sensor->dev, "failed to parse fwnode: %d", ret);
> +		return ret;
> +	}
> +
> +	v4l2_ctrl_new_fwnode_properties(ctrl_hdlr, &imx471_ctrl_ops, &props);
> +
> +	sensor->link_freq = v4l2_ctrl_new_int_menu(ctrl_hdlr,
> +						   &imx471_ctrl_ops,
> +						   V4L2_CID_LINK_FREQ,
> +						   ARRAY_SIZE(link_freq_menu_items) - 1,
> +						   0,
> +						   link_freq_menu_items);
> +	if (sensor->link_freq)
> +		sensor->link_freq->flags |= V4L2_CTRL_FLAG_READ_ONLY;
> +
> +	/* pixel_rate = link_freq * 2 * nr_of_lanes / bits_per_sample */
> +	pixel_rate = IMX471_LINK_FREQ_DEFAULT * 2 * 4;
> +	div_u64(pixel_rate, 10);
> +	/* By default, PIXEL_RATE is read only */
> +	sensor->pixel_rate = v4l2_ctrl_new_std(ctrl_hdlr, &imx471_ctrl_ops,
> +					       V4L2_CID_PIXEL_RATE, pixel_rate,
> +					       pixel_rate, 1, pixel_rate);
> +
> +	/* Initial vblank/hblank/exposure parameters based on current mode */
> +	sensor->vblank = v4l2_ctrl_new_std(ctrl_hdlr,
> +					   &imx471_ctrl_ops,
> +					   V4L2_CID_VBLANK,
> +					   mode->fll_min - mode->height,
> +					   IMX471_FLL_MAX - mode->height,
> +					   1,
> +					   mode->fll_def - mode->height);
> +
> +	hblank = mode->llp - mode->width;
> +	sensor->hblank = v4l2_ctrl_new_std(ctrl_hdlr, &imx471_ctrl_ops,
> +					   V4L2_CID_HBLANK, hblank, hblank,
> +					   1, hblank);
> +	if (sensor->hblank)
> +		sensor->hblank->flags |= V4L2_CTRL_FLAG_READ_ONLY;
> +
> +	/* fll >= exposure time + adjust parameter (default value is 18) */
> +	exposure_max = mode->fll_def - IMX471_EXPOSURE_MARGIN;
> +	sensor->exposure = v4l2_ctrl_new_std(ctrl_hdlr, &imx471_ctrl_ops,
> +					     V4L2_CID_EXPOSURE,
> +					     IMX471_EXPOSURE_MIN, exposure_max,
> +					     IMX471_EXPOSURE_STEP,
> +					     IMX471_EXPOSURE_DEFAULT);
> +
> +	v4l2_ctrl_new_std(ctrl_hdlr, &imx471_ctrl_ops, V4L2_CID_ANALOGUE_GAIN,
> +			  IMX471_ANA_GAIN_MIN, IMX471_ANA_GAIN_MAX,
> +			  IMX471_ANA_GAIN_STEP, IMX471_ANA_GAIN_DEFAULT);
> +
> +	/* Digital gain */
> +	v4l2_ctrl_new_std(ctrl_hdlr, &imx471_ctrl_ops, V4L2_CID_DIGITAL_GAIN,
> +			  IMX471_DGTL_GAIN_MIN, IMX471_DGTL_GAIN_MAX,
> +			  IMX471_DGTL_GAIN_STEP, IMX471_DGTL_GAIN_DEFAULT);
> +
> +	v4l2_ctrl_new_std_menu_items(ctrl_hdlr, &imx471_ctrl_ops,
> +				     V4L2_CID_TEST_PATTERN,
> +				     ARRAY_SIZE(imx471_test_pattern_menu) - 1,
> +				     0, 0, imx471_test_pattern_menu);
> +
> +	/* HFLIP & VFLIP */
> +	sensor->hflip = v4l2_ctrl_new_std(ctrl_hdlr, &imx471_ctrl_ops,
> +					  V4L2_CID_HFLIP, 0, 1, 1, 0);
> +
> +	sensor->vflip = v4l2_ctrl_new_std(ctrl_hdlr, &imx471_ctrl_ops,
> +					  V4L2_CID_VFLIP, 0, 1, 1, 0);
> +
> +	if (ctrl_hdlr->error) {
> +		dev_err(sensor->dev, "%s control init failed: %d",
> +			__func__, ctrl_hdlr->error);
> +		goto error;
> +	}
> +
> +	sensor->hflip->flags |= V4L2_CTRL_FLAG_MODIFY_LAYOUT;
> +	sensor->vflip->flags |= V4L2_CTRL_FLAG_MODIFY_LAYOUT;

Either set all flags where controls are created or here. I think I'd move
them here.

> +
> +	sensor->sd.ctrl_handler = ctrl_hdlr;
> +
> +	return 0;
> +
> +error:
> +	v4l2_ctrl_handler_free(ctrl_hdlr);
> +
> +	return ctrl_hdlr->error;
> +}
> +
> +static int imx471_check_hwcfg(struct imx471 *sensor)
> +{
> +	struct v4l2_fwnode_endpoint bus_cfg = {
> +		.bus_type = V4L2_MBUS_CSI2_DPHY,
> +	};
> +	struct fwnode_handle *ep, *fwnode = dev_fwnode(sensor->dev);
> +	struct clk *clk;
> +	unsigned long link_freq_bitmap;
> +	int ret;
> +
> +	clk = devm_v4l2_sensor_clk_get(sensor->dev, NULL);
> +	if (IS_ERR(clk))
> +		return dev_err_probe(sensor->dev, PTR_ERR(clk),
> +				     "can't get clock frequency\n");
> +
> +	if (clk_get_rate(clk) != IMX471_EXT_CLK)
> +		return dev_err_probe(sensor->dev, -EINVAL,
> +				     "external clock %lu is not supported\n",
> +				     clk_get_rate(clk));
> +
> +	ep = fwnode_graph_get_endpoint_by_id(fwnode, 0, 0, 0);
> +	ret = v4l2_fwnode_endpoint_alloc_parse(ep, &bus_cfg);
> +	fwnode_handle_put(ep);
> +	if (ret)
> +		return dev_err_probe(sensor->dev, ret,
> +				     "parsing endpoint failed");
> +
> +	ret = v4l2_link_freq_to_bitmap(sensor->dev, bus_cfg.link_frequencies,
> +				       bus_cfg.nr_of_link_frequencies,
> +				       link_freq_menu_items,
> +				       ARRAY_SIZE(link_freq_menu_items),
> +				       &link_freq_bitmap);
> +
> +	v4l2_fwnode_endpoint_free(&bus_cfg);
> +
> +	return ret;
> +}
> +
> +static int imx471_probe(struct i2c_client *client)
> +{
> +	struct imx471 *sensor;
> +	int ret;
> +
> +	sensor = devm_kzalloc(&client->dev, sizeof(*sensor), GFP_KERNEL);
> +	if (!sensor)
> +		return dev_err_probe(&client->dev, -ENOMEM,
> +				     "failed to allocate memory\n");
> +
> +	sensor->dev = &client->dev;
> +
> +	/* Check HW config */
> +	ret = imx471_check_hwcfg(sensor);
> +	if (ret)
> +		return dev_err_probe(sensor->dev, ret,
> +				     "failed to check hwcfg: %d\n", ret);
> +
> +	ret = imx471_get_regulators(sensor->dev, sensor);
> +	if (ret)
> +		return dev_err_probe(sensor->dev, ret,
> +				     "failed to get regulators\n");
> +
> +	sensor->reset_gpio = devm_gpiod_get_optional(sensor->dev, "reset",
> +						     GPIOD_OUT_HIGH);
> +	if (IS_ERR(sensor->reset_gpio))
> +		return dev_err_probe(sensor->dev, PTR_ERR(sensor->reset_gpio),
> +				     "failed to get reset gpio\n");
> +
> +	sensor->img_clk = devm_clk_get_optional(sensor->dev, NULL);
> +	if (IS_ERR(sensor->img_clk))
> +		return dev_err_probe(sensor->dev, PTR_ERR(sensor->img_clk),
> +				     "failed to get imaging clock\n");
> +
> +	/* Initialize subdev */
> +	v4l2_i2c_subdev_init(&sensor->sd, client, &imx471_subdev_ops);
> +
> +	/* Initialize regmap */
> +	sensor->regmap = devm_cci_regmap_init_i2c(client, 16);
> +	if (IS_ERR(sensor->regmap))
> +		return PTR_ERR(sensor->regmap);
> +
> +	ret = imx471_power_on(sensor->dev);
> +	if (ret)
> +		return dev_err_probe(sensor->dev, ret,
> +				     "failed to power on\n");
> +
> +	/* Check module identity */
> +	ret = imx471_identify_module(sensor);
> +	if (ret) {
> +		dev_err(&client->dev, "failed to find sensor: %d", ret);
> +		goto error_power_off;
> +	}
> +
> +	ret = imx471_init_controls(sensor);
> +	if (ret) {
> +		dev_err(sensor->dev, "failed to init controls: %d", ret);
> +		goto error_power_off;
> +	}
> +
> +	/* Initialize subdev */
> +	sensor->sd.internal_ops = &imx471_internal_ops;
> +	sensor->sd.flags |= V4L2_SUBDEV_FL_HAS_DEVNODE |
> +			    V4L2_SUBDEV_FL_HAS_EVENTS;
> +	sensor->sd.entity.function = MEDIA_ENT_F_CAM_SENSOR;
> +
> +	/* Initialize source pad */
> +	sensor->pad.flags = MEDIA_PAD_FL_SOURCE;
> +	ret = media_entity_pads_init(&sensor->sd.entity, 1, &sensor->pad);
> +	if (ret) {
> +		dev_err(&client->dev, "failed to init entity pads: %d", ret);
> +		goto error_v4l2_ctrl_handler_free;
> +	}
> +
> +	sensor->sd.state_lock = sensor->ctrl_handler.lock;
> +	ret = v4l2_subdev_init_finalize(&sensor->sd);
> +	if (ret < 0) {
> +		dev_err(&client->dev, "failed to init subdev: %d", ret);
> +		goto error_media_entity_pm;
> +	}
> +
> +	pm_runtime_set_active(sensor->dev);
> +	pm_runtime_enable(sensor->dev);
> +	pm_runtime_idle(sensor->dev);

Move the pm_runtime_idle() call after v4l2_async_register_subdev_sensor().
Otherwise Runtime PM may power off the sensor on error and the driver still
calls imx471_power_off().

> +
> +	ret = v4l2_async_register_subdev_sensor(&sensor->sd);
> +	if (ret < 0)
> +		goto error_v4l2_subdev_cleanup;
> +
> +	return 0;
> +
> +error_v4l2_subdev_cleanup:
> +	pm_runtime_disable(sensor->dev);
> +	pm_runtime_set_suspended(sensor->dev);
> +	v4l2_subdev_cleanup(&sensor->sd);
> +
> +error_media_entity_pm:
> +	media_entity_cleanup(&sensor->sd.entity);
> +
> +error_v4l2_ctrl_handler_free:
> +	v4l2_ctrl_handler_free(sensor->sd.ctrl_handler);
> +
> +error_power_off:
> +	imx471_power_off(sensor->dev);
> +
> +	return ret;
> +}
> +
> +static void imx471_remove(struct i2c_client *client)
> +{
> +	struct v4l2_subdev *sd = i2c_get_clientdata(client);
> +	struct imx471 *sensor = to_imx471(sd);
> +
> +	v4l2_async_unregister_subdev(sd);
> +	v4l2_subdev_cleanup(sd);
> +	media_entity_cleanup(&sd->entity);
> +	v4l2_ctrl_handler_free(sd->ctrl_handler);
> +
> +	pm_runtime_disable(&client->dev);
> +
> +	if (!pm_runtime_status_suspended(sensor->dev)) {
> +		imx471_power_off(sensor->dev);
> +		pm_runtime_set_suspended(sensor->dev);
> +	}
> +}
> +
> +static DEFINE_RUNTIME_DEV_PM_OPS(imx471_pm_ops, imx471_power_off,
> +				 imx471_power_on, NULL);
> +
> +static const struct acpi_device_id imx471_acpi_ids[] __maybe_unused = {
> +	{ "SONY471A" },
> +	{ /* sentinel */ }
> +};
> +MODULE_DEVICE_TABLE(acpi, imx471_acpi_ids);
> +
> +static struct i2c_driver imx471_i2c_driver = {
> +	.driver = {
> +		.name = "imx471",
> +		.acpi_match_table = ACPI_PTR(imx471_acpi_ids),
> +		.pm = pm_sleep_ptr(&imx471_pm_ops),
> +	},
> +	.probe = imx471_probe,
> +	.remove = imx471_remove,
> +};
> +module_i2c_driver(imx471_i2c_driver);
> +
> +MODULE_AUTHOR("Jimmy Su <jimmy.su@intel.com>");
> +MODULE_AUTHOR("Serin Yeh <serin.yeh@intel.com>");
> +MODULE_AUTHOR("Kate Hsuan <hpa@redhat.com>");
> +MODULE_DESCRIPTION("Sony imx471 sensor driver");
> +MODULE_LICENSE("GPL");

-- 
Kind regards,

Sakari Ailus

