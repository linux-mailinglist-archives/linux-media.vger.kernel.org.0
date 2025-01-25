Return-Path: <linux-media+bounces-25296-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 04DCFA1BF9B
	for <lists+linux-media@lfdr.de>; Sat, 25 Jan 2025 01:15:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8F67A3ABB00
	for <lists+linux-media@lfdr.de>; Sat, 25 Jan 2025 00:15:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A82D68821;
	Sat, 25 Jan 2025 00:14:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="oFxDa9Nq"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAFD65680;
	Sat, 25 Jan 2025 00:14:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737764095; cv=none; b=FRhOguvTYa6umbfpSqO0ybYkM/2QRLQT72UMaXq+9N0pc8LVpebYZvd3Hmx+JRYgnsMYXwPWEGbGwYSHwMtP+QYVjGc06648Aj+60kIi0/SsLhi7fgJAqBHMEd/uNfUkO8aTiATAur0E7FwUgV0PYcxGKlmggnWcA7YHiu5ZgU0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737764095; c=relaxed/simple;
	bh=8vPHJU+KBLmrNVQuiSOn168nEMQXyqezpbS2kUp/eMg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CVxUjf89FyddyfRFEKYALNl0a33i7Fu0+KsJkv7m5/oJqX5kFdLuuEGTl/Wfl6Jf5zgE3GUTwiRHR8hOPNziFJifMzUiQ5qaN5yyes2ljPivtzxF6YgaMIX4oyCvEQZQ6mGL0IK/z9adYNdLk5vp327r3gSXZByVpPWr+STT3RA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=oFxDa9Nq; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 1EE80670;
	Sat, 25 Jan 2025 01:13:43 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1737764023;
	bh=8vPHJU+KBLmrNVQuiSOn168nEMQXyqezpbS2kUp/eMg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=oFxDa9NqTw+9OVUCFrVs0/ShkVO1W86pMCDKxFzxyeTXILvJNdEYJk7GbxXXZp2N2
	 G1lwfJmJu5e9riXLCqka/v2z+2vFG0YYoRwp+2wOad7gDOrpQhCTSPHlvr6kAOlF1E
	 rVBf5m9HNQH0jnu+8mdW0BJpItTrDroi3Y9J05nY=
Date: Sat, 25 Jan 2025 02:14:37 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Hans de Goede <hdegoede@redhat.com>
Cc: Mirela Rabulea <mirela.rabulea@nxp.com>, mchehab@kernel.org,
	sakari.ailus@linux.intel.com, hverkuil-cisco@xs4all.nl,
	robh@kernel.org, krzk+dt@kernel.org, bryan.odonoghue@linaro.org,
	laurentiu.palcu@nxp.com, robert.chiras@nxp.com,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	LnxRevLi@nxp.com, kieran.bingham@ideasonboard.com,
	dave.stevenson@raspberrypi.com, mike.rudenko@gmail.com,
	alain.volmat@foss.st.com, devicetree@vger.kernel.org,
	conor+dt@kernel.org, alexander.stein@ew.tq-group.com,
	umang.jain@ideasonboard.com, zhi.mao@mediatek.com, festevam@denx.de,
	julien.vuillaumier@nxp.com, alice.yuan@nxp.com
Subject: Re: [PATCH v2 2/4] media: ox05b1s: Add omnivision OX05B1S raw sensor
 driver
Message-ID: <20250125001437.GA19927@pendragon.ideasonboard.com>
References: <20241126155100.1263946-1-mirela.rabulea@nxp.com>
 <20241126155100.1263946-3-mirela.rabulea@nxp.com>
 <131271d3-f3be-450f-b4e1-a7efb65362f3@redhat.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <131271d3-f3be-450f-b4e1-a7efb65362f3@redhat.com>

Hi Hans,

On Fri, Jan 24, 2025 at 06:17:40PM +0100, Hans de Goede wrote:
> On 26-Nov-24 4:50 PM, Mirela Rabulea wrote:
> > Add a v4l2 subdevice driver for the Omnivision OX05B1S RGB-IR sensor.
> > 
> > The Omnivision OX05B1S is a 1/2.5-Inch CMOS image sensor with an
> > active array size of 2592 x 1944.
> > 
> > The following features are supported for OX05B1S:
> > - Manual exposure an gain control support
> > - vblank/hblank control support
> > - Supported resolution: 2592 x 1944 @ 30fps (SGRBG10)
> > 
> > Signed-off-by: Mirela Rabulea <mirela.rabulea@nxp.com>
> 
> Thank you for your contribution, I noticed in $subject
> that the model-nr ends in a "S" and that you describe
> this as a RGB-IR sensor.
> 
> I've been working on OV01A1S support myself and one of
> the issues is how to communicate the RGB-IR color-filter
> to userspace.
> 
> <snip>
> 
> I see here:
> 
> > +static const struct ox05b1s_sizes ox05b1s_supported_codes[] = {
> > +	{
> > +		.code = MEDIA_BUS_FMT_SGRBG10_1X10,
> > +		.sizes = ox05b1s_sgrbg10_sizes,
> > +	}, {
> > +		/* sentinel */
> > +	}
> > +};
> 
> That you are using MEDIA_BUS_FMT_SGRBG10_1X10, but that suggests
> this sensor is using a plain Bayer color filter which is not correct.
> 
> Here is what I have come up with:
> 
> diff --git a/include/linux/drm_fourcc.h b/include/linux/drm_fourcc.h
> index db679877..68ed65c5 100644
> --- a/include/linux/drm_fourcc.h
> +++ b/include/linux/drm_fourcc.h
> @@ -447,6 +447,8 @@ extern "C" {
>  #define DRM_FORMAT_SGRBG10	fourcc_code('B', 'A', '1', '0')
>  #define DRM_FORMAT_SGBRG10	fourcc_code('G', 'B', '1', '0')
>  #define DRM_FORMAT_SBGGR10	fourcc_code('B', 'G', '1', '0')
> +/* Mixed 10 bit bayer + ir pixel pattern found on Omnivision ov01a1s */
> +#define DRM_FORMAT_SIGIG_GBGR_IGIG_GRGB10 fourcc_code('O', 'V', '1', 'S')
>  
>  /* 12-bit Bayer formats */
>  #define DRM_FORMAT_SRGGB12	fourcc_code('R', 'G', '1', '2')
> diff --git a/include/linux/media-bus-format.h b/include/linux/media-bus-format.h
> index b6acf8c8..e2938f0d 100644
> --- a/include/linux/media-bus-format.h
> +++ b/include/linux/media-bus-format.h
> @@ -122,7 +122,7 @@
>  #define MEDIA_BUS_FMT_YUV16_1X48		0x202a
>  #define MEDIA_BUS_FMT_UYYVYY16_0_5X48		0x202b
>  
> -/* Bayer - next is	0x3025 */
> +/* Bayer - next is	0x3026 */
>  #define MEDIA_BUS_FMT_SBGGR8_1X8		0x3001
>  #define MEDIA_BUS_FMT_SGBRG8_1X8		0x3013
>  #define MEDIA_BUS_FMT_SGRBG8_1X8		0x3002
> @@ -159,6 +159,8 @@
>  #define MEDIA_BUS_FMT_SGBRG20_1X20		0x3022
>  #define MEDIA_BUS_FMT_SGRBG20_1X20		0x3023
>  #define MEDIA_BUS_FMT_SRGGB20_1X20		0x3024
> +/* Mixed bayer + ir pixel pattern found on ov01a1s */
> +#define MEDIA_BUS_FMT_SIGIG_GBGR_IGIG_GRGB10_1X10 0x3025
>  
>  /* JPEG compressed formats - next is	0x4002 */
>  #define MEDIA_BUS_FMT_JPEG_1X8			0x4001
> diff --git a/include/linux/videodev2.h b/include/linux/videodev2.h
> index 3829c0b6..1b91ed0e 100644
> --- a/include/linux/videodev2.h
> +++ b/include/linux/videodev2.h
> @@ -706,6 +706,9 @@ struct v4l2_pix_format {
>  #define V4L2_PIX_FMT_SGBRG16 v4l2_fourcc('G', 'B', '1', '6') /* 16  GBGB.. RGRG.. */
>  #define V4L2_PIX_FMT_SGRBG16 v4l2_fourcc('G', 'R', '1', '6') /* 16  GRGR.. BGBG.. */
>  #define V4L2_PIX_FMT_SRGGB16 v4l2_fourcc('R', 'G', '1', '6') /* 16  RGRG.. GBGB.. */
> +	/* 10bit mixed bayer + ir pixel pattern found on ov01a1s */
> +#define V4L2_PIX_FMT_SIGIG_GBGR_IGIG_GRGB10  v4l2_fourcc('O', 'V', '1', 'S') /* unpacked */
> +#define V4L2_PIX_FMT_SIGIG_GBGR_IGIG_GRGB10P v4l2_fourcc('O', 'V', '1', 'P') /* packed */
>  
>  /* HSV formats */
>  #define V4L2_PIX_FMT_HSV24 v4l2_fourcc('H', 'S', 'V', '3')
> 
> For this, note:
> 
> 1. This is against libcamera's copy of the relevant linux headers, the paths
> to the .h files are different in the kernel
> 
> 2. Since I wrote this I learned that it looks like the intel driver for
> the ov01a1s:
> 
> https://github.com/intel/ipu6-drivers/blob/master/drivers/media/i2c/ov01a1s.c
> 
> may have enabled horizontal-flip / mirroring by default, which means that
> the order of each of the quads needs to be flipped.
> 
> IMHO we need to resolve how to communicate the color-filters used on
> these OV xxxxx"S" models to userspace. When I last discussed this with
> Laurent, Laurent suggested using V4L2_PIX_FMT_Y10, combined with
> a new field or v4l2-control to query the actual filter.

Yes, adding new pixel formats and media bus codes to represent CFA
patterns won't scale. We need to switch to using controls to report
those. Sakari is already working on a series for that.

> The idea is to separate the depth/packing info from the filter info,
> avoiding the possible combinatioral explosion of needing this special
> filter with all possible deths. I gave this a quick try but at least on
> the libcamera side there is still a lot of code assuming that both
> depth and color-filter-type are communicated through a single fmt
> integer. Also it seems that in practice there only is this one new
> RGB-IR color filter used on the OV xxxxx"S" models so I think we
> need just 1 new V4L2_PIX_FMT_ define (*).

Changes in libcamera are surely needed. There's work to be done, we'll
do the work, and we'll solve this problem. Let's focus the effort in
that direction.

> If it interests you I also have code for the libcamera softwareISP
> to demosaiq this format (ignoring the IR pixels).
> 
> Regards,
> 
> Hans
> 
> 
> *) or 4 if we want to be able to do mirror + flip and then communicate
> the changed order due to the mirror / flip. But given the extra effort
> of demosaqing this format, IMHO we should just not offer mirror/flip
> functionality for the "S" version of the sensors. Otherwise the softisp
> would need 4 separate custom demosaiq functions for these sensors.
> 
> > +
> > +static const struct regmap_config ox05b1s_regmap_config = {
> > +	.reg_bits = 16,
> > +	.val_bits = 8,
> > +	.cache_type = REGCACHE_RBTREE,
> > +};
> > +
> > +static int ox05b1s_power_on(struct ox05b1s *sensor)
> > +{
> > +	struct device *dev = &sensor->i2c_client->dev;
> > +	int ret = 0;
> > +
> > +	ret = regulator_bulk_enable(OX05B1S_NUM_SUPPLIES, sensor->supplies);
> > +	if (ret) {
> > +		dev_err(dev, "Failed to enable regulators\n");
> > +		return ret;
> > +	}
> > +
> > +	/* get out of powerdown and reset */
> > +	gpiod_set_value_cansleep(sensor->rst_gpio, 0);
> > +
> > +	ret = clk_prepare_enable(sensor->sensor_clk);
> > +	if (ret < 0) {
> > +		dev_err(dev, "Enable sensor clk fail ret=%d\n", ret);
> > +		goto reg_off;
> > +	}
> > +
> > +	/* with XVCLK@24MHz, t2 = 6ms required delay for ox05b1s before first SCCB transaction */
> > +	fsleep(6000);
> > +
> > +	return ret;
> > +
> > +reg_off:
> > +	regulator_bulk_disable(OX05B1S_NUM_SUPPLIES, sensor->supplies);
> > +
> > +	return ret;
> > +}
> > +
> > +static int ox05b1s_power_off(struct ox05b1s *sensor)
> > +{
> > +	gpiod_set_value_cansleep(sensor->rst_gpio, 1);
> > +
> > +	/* XVCLK must be active for 512 cycles (0.34 ms at 24MHz) after last SCCB transaction */
> > +	fsleep(350);
> > +	clk_disable_unprepare(sensor->sensor_clk);
> > +
> > +	regulator_bulk_disable(OX05B1S_NUM_SUPPLIES, sensor->supplies);
> > +
> > +	return 0;
> > +}
> > +
> > +static int ox05b1s_runtime_suspend(struct device *dev)
> > +{
> > +	struct v4l2_subdev *sd = dev_get_drvdata(dev);
> > +	struct i2c_client *client = v4l2_get_subdevdata(sd);
> > +	struct ox05b1s *sensor = client_to_ox05b1s(client);
> > +
> > +	return ox05b1s_power_off(sensor);
> > +}
> > +
> > +static int ox05b1s_runtime_resume(struct device *dev)
> > +{
> > +	struct v4l2_subdev *sd = dev_get_drvdata(dev);
> > +	struct i2c_client *client = v4l2_get_subdevdata(sd);
> > +	struct ox05b1s *sensor = client_to_ox05b1s(client);
> > +
> > +	return ox05b1s_power_on(sensor);
> > +}
> > +
> > +static int ox05b1s_write_reg(struct ox05b1s *sensor, u16 reg, u8 val)
> > +{
> > +	struct device *dev = &sensor->i2c_client->dev;
> > +	int ret;
> > +
> > +	ret = regmap_write(sensor->regmap, reg, val);
> > +	if (ret < 0)
> > +		dev_err(dev, "Failed to write reg addr 0x%04x with 0x%02x\n", reg, val);
> > +
> > +	return ret;
> > +}
> > +
> > +static int ox05b1s_read_reg(struct ox05b1s *sensor, u16 reg, u8 *val)
> > +{
> > +	struct device *dev = &sensor->i2c_client->dev;
> > +	int ret;
> > +
> > +	ret = regmap_raw_read(sensor->regmap, reg, val, 1);
> > +	if (ret)
> > +		dev_err(dev, "Read reg error: reg=%x, val=%x\n", reg, *val);
> > +
> > +	return ret;
> > +}
> > +
> > +#define OX05B1S_MAX_REG_BULK 16
> > +static int ox05b1s_write_reg_array(struct ox05b1s *sensor,
> > +				   struct ox05b1s_reg *reg_array)
> > +{
> > +	struct device *dev = &sensor->i2c_client->dev;
> > +	struct ox05b1s_reg *table = reg_array;
> > +	u8 vals[OX05B1S_MAX_REG_BULK];
> > +	int i;
> > +	int ret;
> > +
> > +	while (table->addr) {
> > +		for (i = 0; i < OX05B1S_MAX_REG_BULK; i++) {
> > +			if (table[i].addr != (table[0].addr + i))
> > +				break;
> > +			vals[i] = table[i].data;
> > +		}
> > +		ret = regmap_bulk_write(sensor->regmap, table->addr, vals, i);
> > +		if (ret) {
> > +			dev_err(dev, "Failed to write reg addr=%x, count %d\n", table->addr, i);
> > +			return ret;
> > +		}
> > +		table += i;
> > +	}
> > +
> > +	return 0;
> > +}
> > +
> > +static int ox05b1s_set_hts(struct ox05b1s *sensor, u32 hts)
> > +{
> > +	u8 values[2] = { (u8)(hts >> 8) & 0xff, (u8)(hts & 0xff) };
> > +
> > +	return regmap_bulk_write(sensor->regmap, OX05B1S_REG_TIMING_HTS_H, values, 2);
> > +}
> > +
> > +static int ox05b1s_set_vts(struct ox05b1s *sensor, u32 vts)
> > +{
> > +	u8 values[2] = { (u8)(vts >> 8) & 0xff, (u8)(vts & 0xff) };
> > +
> > +	return regmap_bulk_write(sensor->regmap, OX05B1S_REG_TIMING_VTS_H, values, 2);
> > +}
> > +
> > +static int ox05b1s_set_exp(struct ox05b1s *sensor, u32 exp)
> > +{
> > +	u8 values[2] = { (u8)(exp >> 8) & 0xff, (u8)(exp & 0xff) };
> > +
> > +	return regmap_bulk_write(sensor->regmap, OX05B1S_REG_EXPOSURE_H, values, 2);
> > +}
> > +
> > +static int ox05b1s_set_analog_gain(struct ox05b1s *sensor, u32 again)
> > +{
> > +	u8 values[2] = { (u8)(again >> 8) & 0xff, (u8)(again & 0xff) };
> > +
> > +	/* real gain */
> > +	return regmap_bulk_write(sensor->regmap, OX05B1S_REG_GAIN_H, values, 2);
> > +}
> > +
> > +static inline struct v4l2_subdev *ctrl_to_sd(struct v4l2_ctrl *ctrl)
> > +{
> > +	return &container_of(ctrl->handler, struct ox05b1s,
> > +			     ctrls.handler)->subdev;
> > +}
> > +
> > +static int ox05b1s_s_ctrl(struct v4l2_ctrl *ctrl)
> > +{
> > +	struct v4l2_subdev *sd = ctrl_to_sd(ctrl);
> > +	struct i2c_client *client = v4l2_get_subdevdata(sd);
> > +	struct ox05b1s *sensor = client_to_ox05b1s(client);
> > +	u32 w = sensor->mode->width;
> > +	u32 h = sensor->mode->height;
> > +	int ret = 0;
> > +
> > +	/* apply V4L2 controls values only if power is already up */
> > +	if (!pm_runtime_get_if_in_use(&client->dev))
> > +		return 0;
> > +
> > +	/* s_ctrl holds sensor lock */
> > +	switch (ctrl->id) {
> > +	case V4L2_CID_VBLANK:
> > +		ret = ox05b1s_set_vts(sensor, h + ctrl->val);
> > +		break;
> > +	case V4L2_CID_HBLANK:
> > +		if (sensor->mode->h_bin)
> > +			ret = ox05b1s_set_hts(sensor, w + ctrl->val);
> > +		else
> > +			ret = ox05b1s_set_hts(sensor, (w + ctrl->val) / 2);
> > +		break;
> > +	case V4L2_CID_PIXEL_RATE:
> > +		/* Read-only, but we adjust it based on mode. */
> > +		break;
> > +	case V4L2_CID_ANALOGUE_GAIN:
> > +		ret = ox05b1s_set_analog_gain(sensor, ctrl->val);
> > +		break;
> > +	case V4L2_CID_EXPOSURE:
> > +		ret = ox05b1s_set_exp(sensor, ctrl->val);
> > +		break;
> > +	default:
> > +		ret = -EINVAL;
> > +		break;
> > +	}
> > +
> > +	pm_runtime_put(&client->dev);
> > +
> > +	return ret;
> > +}
> > +
> > +static const struct v4l2_ctrl_ops ox05b1s_ctrl_ops = {
> > +	.s_ctrl = ox05b1s_s_ctrl,
> > +};
> > +
> > +/*
> > + * MIPI CSI-2 link frequencies.
> > + * link_freq = (pixel_rate * bpp) / (2 * data_lanes)
> > + */
> > +static const s64 ox05b1s_csi2_link_freqs[] = {
> > +	200000000,
> > +};
> > +
> > +/* Link freq for default mode: 1080p RAW10, 4 data lanes 800 Mbps/lane. */
> > +#define OX05B1S_DEFAULT_LINK_FREQ	0
> > +
> > +static int ox05b1s_init_controls(struct ox05b1s *sensor)
> > +{
> > +	const struct v4l2_ctrl_ops *ops = &ox05b1s_ctrl_ops;
> > +	struct ox05b1s_ctrls *ctrls = &sensor->ctrls;
> > +	struct v4l2_ctrl_handler *hdl = &ctrls->handler;
> > +	struct device *dev = &sensor->i2c_client->dev;
> > +	struct v4l2_fwnode_device_properties props;
> > +	int ret;
> > +
> > +	v4l2_ctrl_handler_init(hdl, 7);
> > +
> > +	/* we can use our own mutex for the ctrl lock */
> > +	hdl->lock = &sensor->lock;
> > +
> > +	/* Clock related controls */
> > +	ctrls->link_freq = v4l2_ctrl_new_int_menu(hdl, ops,
> > +						  V4L2_CID_LINK_FREQ,
> > +						  ARRAY_SIZE(ox05b1s_csi2_link_freqs) - 1,
> > +						  OX05B1S_DEFAULT_LINK_FREQ,
> > +						  ox05b1s_csi2_link_freqs);
> > +
> > +	/* mode dependent, actual range set in ox05b1s_update_controls */
> > +	ctrls->pixel_rate = v4l2_ctrl_new_std(hdl, ops, V4L2_CID_PIXEL_RATE,
> > +					      0, 0, 1, 0);
> > +
> > +	ctrls->hblank = v4l2_ctrl_new_std(hdl, ops, V4L2_CID_HBLANK,
> > +					  0, 0, 1, 0);
> > +
> > +	ctrls->vblank = v4l2_ctrl_new_std(hdl, ops, V4L2_CID_VBLANK,
> > +					  0, 0, 1, 0);
> > +
> > +	ctrls->exposure = v4l2_ctrl_new_std(hdl, ops, V4L2_CID_EXPOSURE,
> > +					    0, 0, 1, 0);
> > +
> > +	ctrls->gain = v4l2_ctrl_new_std(hdl, ops, V4L2_CID_ANALOGUE_GAIN,
> > +					0, 0xFFFF, 1, 0x80);
> > +
> > +	if (hdl->error) {
> > +		ret = hdl->error;
> > +		goto free_ctrls;
> > +	}
> > +
> > +	ctrls->link_freq->flags |= V4L2_CTRL_FLAG_READ_ONLY;
> > +	ctrls->pixel_rate->flags |= V4L2_CTRL_FLAG_READ_ONLY;
> > +
> > +	ret = v4l2_fwnode_device_parse(dev, &props);
> > +	if (ret)
> > +		goto free_ctrls;
> > +
> > +	ret = v4l2_ctrl_new_fwnode_properties(hdl, ops, &props);
> > +	if (ret)
> > +		goto free_ctrls;
> > +
> > +	sensor->subdev.ctrl_handler = hdl;
> > +	return 0;
> > +
> > +free_ctrls:
> > +	dev_err(dev, "Failed to init controls\n");
> > +	v4l2_ctrl_handler_free(hdl);
> > +	return ret;
> > +}
> > +
> > +static int ox05b1s_apply_current_mode(struct ox05b1s *sensor);
> > +
> > +static int ox05b1s_s_stream(struct v4l2_subdev *sd, int enable)
> > +{
> > +	struct i2c_client *client = v4l2_get_subdevdata(sd);
> > +	struct ox05b1s *sensor = client_to_ox05b1s(client);
> > +	int ret = 0;
> > +
> > +	if (enable) {
> > +		ret = pm_runtime_resume_and_get(&client->dev);
> > +		if (ret < 0)
> > +			return ret;
> > +		ret = ox05b1s_apply_current_mode(sensor);
> > +		if (!ret)
> > +			ret = ox05b1s_write_reg(sensor, OX05B1S_REG_SW_STB, 0x01);
> > +	} else {
> > +		ret = ox05b1s_write_reg(sensor, OX05B1S_REG_SW_STB, 0x00);
> > +	}
> > +
> > +	sensor->stream_status = enable;
> > +
> > +	if (!enable || ret) {
> > +		pm_runtime_mark_last_busy(&sensor->i2c_client->dev);
> > +		pm_runtime_put_autosuspend(&client->dev);
> > +	}
> > +
> > +	return 0;
> > +}
> > +
> > +static void ox05b1s_update_pad_format(struct ox05b1s *sensor,
> > +				      const struct ox05b1s_mode *mode,
> > +				      struct v4l2_mbus_framefmt *fmt)
> > +{
> > +	fmt->code = mode->code;
> > +	fmt->width = mode->width;
> > +	fmt->height = mode->height;
> > +	fmt->field = V4L2_FIELD_NONE;
> > +	fmt->colorspace = V4L2_COLORSPACE_RAW;
> > +	fmt->quantization = V4L2_QUANTIZATION_FULL_RANGE;
> > +	fmt->xfer_func = V4L2_XFER_FUNC_NONE;
> > +}
> > +
> > +static int ox05b1s_init_state(struct v4l2_subdev *sd,
> > +			      struct v4l2_subdev_state *state)
> > +{
> > +	struct i2c_client *client = v4l2_get_subdevdata(sd);
> > +	struct ox05b1s *sensor = client_to_ox05b1s(client);
> > +	struct v4l2_mbus_framefmt *format;
> > +
> > +	/* Initialize the format. */
> > +	format = v4l2_subdev_state_get_format(state, 0);
> > +	ox05b1s_update_pad_format(sensor, &sensor->model->supported_modes[0], format);
> > +
> > +	return 0;
> > +}
> > +
> > +static int ox05b1s_enum_mbus_code(struct v4l2_subdev *sd,
> > +				  struct v4l2_subdev_state *state,
> > +				  struct v4l2_subdev_mbus_code_enum *code)
> > +{
> > +	struct i2c_client *client = v4l2_get_subdevdata(sd);
> > +	struct ox05b1s *sensor = client_to_ox05b1s(client);
> > +	const struct ox05b1s_sizes *supported_codes = sensor->model->supported_codes;
> > +	int i = 0;
> > +
> > +	while (i++ < code->index && supported_codes->code)
> > +		supported_codes++;
> > +	if (!supported_codes->code) /* code->index outside supported_codes[] */
> > +		return -EINVAL;
> > +
> > +	code->code = supported_codes->code;
> > +
> > +	return 0;
> > +}
> > +
> > +static int ox05b1s_enum_frame_size(struct v4l2_subdev *sd,
> > +				   struct v4l2_subdev_state *sd_state,
> > +				   struct v4l2_subdev_frame_size_enum *fse)
> > +{
> > +	struct i2c_client *client = v4l2_get_subdevdata(sd);
> > +	struct ox05b1s *sensor = client_to_ox05b1s(client);
> > +	const struct ox05b1s_sizes *supported_codes = sensor->model->supported_codes;
> > +	const struct v4l2_area *sizes;
> > +	int i = 0;
> > +
> > +	if (fse->pad != 0)
> > +		return -EINVAL;
> > +
> > +	while (supported_codes->code) {
> > +		if (supported_codes->code == fse->code)
> > +			break;
> > +		supported_codes++;
> > +	}
> > +
> > +	if (!supported_codes->code) /* fse->code not in supported_codes[] */
> > +		return -EINVAL;
> > +
> > +	sizes = supported_codes->sizes;
> > +	while (i++ < fse->index && sizes->width)
> > +		sizes++;
> > +	if (!sizes->width) /* fse->index outside sizes[] */
> > +		return -EINVAL;
> > +
> > +	fse->min_width = sizes->width;
> > +	fse->max_width = fse->min_width;
> > +	fse->min_height = sizes->height;
> > +	fse->max_height = fse->min_height;
> > +
> > +	return 0;
> > +}
> > +
> > +/* Update control ranges based on current streaming mode, needs sensor lock */
> > +static int ox05b1s_update_controls(struct ox05b1s *sensor)
> > +{
> > +	int ret;
> > +	struct device *dev = &sensor->i2c_client->dev;
> > +	u32 hts = sensor->mode->hts;
> > +	u32 hblank;
> > +	u32 vts = sensor->mode->vts;
> > +	u32 vblank = vts - sensor->mode->height;
> > +	u32 fps = sensor->mode->fps;
> > +	u64 pixel_rate = (sensor->mode->h_bin) ? hts * vts * fps : 2 * hts * vts * fps;
> > +	u32 min_exp = 8;
> > +	u32 max_exp = vts - 8;
> > +
> > +	ret = __v4l2_ctrl_modify_range(sensor->ctrls.pixel_rate, pixel_rate,
> > +				       pixel_rate, 1, pixel_rate);
> > +	if (ret) {
> > +		dev_err(dev, "Modify range for ctrl: pixel_rate %llu-%llu failed\n",
> > +			pixel_rate, pixel_rate);
> > +		goto out;
> > +	}
> > +
> > +	if (sensor->mode->h_bin)
> > +		hblank = hts - sensor->mode->width;
> > +	else
> > +		hblank = 2 * hts - sensor->mode->width;
> > +
> > +	ret = __v4l2_ctrl_modify_range(sensor->ctrls.hblank, hblank, hblank,
> > +				       1, hblank);
> > +	if (ret) {
> > +		dev_err(dev, "Modify range for ctrl: hblank %u-%u failed\n",
> > +			hblank, hblank);
> > +		goto out;
> > +	}
> > +	__v4l2_ctrl_s_ctrl(sensor->ctrls.hblank, sensor->ctrls.hblank->default_value);
> > +
> > +	ret = __v4l2_ctrl_modify_range(sensor->ctrls.vblank, 0, vblank * 4,
> > +				       1, vblank);
> > +	if (ret) {
> > +		dev_err(dev, "Modify range for ctrl: vblank %u-%u failed\n",
> > +			vblank, vblank);
> > +		goto out;
> > +	}
> > +	__v4l2_ctrl_s_ctrl(sensor->ctrls.vblank, sensor->ctrls.vblank->default_value);
> > +
> > +	ret = __v4l2_ctrl_modify_range(sensor->ctrls.exposure, min_exp, max_exp,
> > +				       1, max_exp / 2);
> > +	if (ret) {
> > +		dev_err(dev, "Modify range for ctrl: exposure %u-%u failed\n",
> > +			min_exp, max_exp);
> > +		goto out;
> > +	}
> > +	__v4l2_ctrl_s_ctrl(sensor->ctrls.exposure, sensor->ctrls.exposure->default_value);
> > +
> > +out:
> > +	return ret;
> > +}
> > +
> > +/* needs sensor lock and power on */
> > +static int ox05b1s_apply_current_mode(struct ox05b1s *sensor)
> > +{
> > +	struct device *dev = &sensor->i2c_client->dev;
> > +	struct ox05b1s_reglist *reg_data = sensor->mode->reg_data;
> > +	int ret = 0;
> > +
> > +	ox05b1s_write_reg(sensor, OX05B1S_REG_SW_RST, 0x01);
> > +
> > +	while (reg_data->regs) {
> > +		ret = ox05b1s_write_reg_array(sensor, reg_data->regs);
> > +		if (ret)
> > +			goto out;
> > +		reg_data++;
> > +	}
> > +
> > +	/* setup handler will write actual controls into sensor registers */
> > +	ret =  __v4l2_ctrl_handler_setup(&sensor->ctrls.handler);
> > +
> > +out:
> > +	if (ret < 0)
> > +		dev_err(dev, "Failed to apply mode %dx%d,bpp=%d\n", sensor->mode->width,
> > +			sensor->mode->height, sensor->mode->bpp);
> > +
> > +	return ret;
> > +}
> > +
> > +/* similar with v4l2_find_nearest_size but filter for mbus code, needs sensor lock */
> > +static const struct ox05b1s_mode *ox05b1s_nearest_size(const struct ox05b1s_mode *supported_modes,
> > +						       struct v4l2_subdev_format *fmt)
> > +{
> > +	u32 error, min_error = U32_MAX;
> > +	const struct ox05b1s_mode *best = NULL;
> > +
> > +	if (!supported_modes)
> > +		return NULL;
> > +
> > +	while (supported_modes->width) {
> > +		const u32 w = supported_modes->width;
> > +		const u32 h = supported_modes->height;
> > +
> > +		if (supported_modes->code != fmt->format.code)
> > +			continue;
> > +
> > +		error = abs(w - fmt->format.width) + abs(h - fmt->format.height);
> > +		if (error > min_error)
> > +			continue;
> > +
> > +		min_error = error;
> > +		best = supported_modes;
> > +		if (!error)
> > +			break;
> > +
> > +		supported_modes++;
> > +	}
> > +
> > +	return best;
> > +}
> > +
> > +/* get a valid mbus code for the model, either the requested one or the default one */
> > +static u32 ox05b1s_find_code(const struct ox05b1s_plat_data *model, u32 code)
> > +{
> > +	u32 found_code = 0;
> > +	const struct ox05b1s_sizes *supported_codes = model->supported_codes;
> > +
> > +	while (supported_codes->code) {
> > +		if (supported_codes->code == code) {
> > +			found_code = code;
> > +			break;
> > +		}
> > +		supported_codes++;
> > +	}
> > +
> > +	if (!supported_codes->code) /* code not in supported_codes[] */
> > +		found_code = model->supported_codes[model->default_mode_index].code;
> > +
> > +	return found_code;
> > +}
> > +
> > +static int ox05b1s_set_fmt(struct v4l2_subdev *sd,
> > +			   struct v4l2_subdev_state *state,
> > +			   struct v4l2_subdev_format *fmt)
> > +{
> > +	struct i2c_client *client = v4l2_get_subdevdata(sd);
> > +	struct ox05b1s *sensor = client_to_ox05b1s(client);
> > +	struct device *dev = &sensor->i2c_client->dev;
> > +	struct v4l2_mbus_framefmt *format;
> > +	const struct ox05b1s_mode *mode;
> > +
> > +	/* if no matching mbus code is found, use the one from the default mode */
> > +	fmt->format.code = ox05b1s_find_code(sensor->model, fmt->format.code);
> > +	mode = ox05b1s_nearest_size(sensor->model->supported_modes, fmt);
> > +
> > +	fmt->format.width = mode->width;
> > +	fmt->format.height = mode->height;
> > +	fmt->format.field = V4L2_FIELD_NONE;
> > +
> > +	if (fmt->which == V4L2_SUBDEV_FORMAT_TRY) {
> > +		format = v4l2_subdev_state_get_format(state, 0);
> > +		*format = fmt->format;
> > +		return 0;
> > +	}
> > +
> > +	sensor->mode = mode;
> > +
> > +	/* update controls that depend on current mode */
> > +	ox05b1s_update_controls(sensor);
> > +
> > +	dev_dbg(dev, "Set mode index=%d, %d x %d, code=0x%x\n", sensor->mode->index,
> > +		fmt->format.width, fmt->format.height, fmt->format.code);
> > +
> > +	return 0;
> > +}
> > +
> > +static u8 ox05b1s_code2dt(const u32 code)
> > +{
> > +	switch (code) {
> > +	case MEDIA_BUS_FMT_SGRBG10_1X10:
> > +		return MIPI_CSI2_DT_RAW10;
> > +	default:
> > +		return MIPI_CSI2_DT_RAW10;
> > +	}
> > +}
> > +
> > +static int ox05b1s_get_frame_desc(struct v4l2_subdev *sd, unsigned int pad,
> > +				  struct v4l2_mbus_frame_desc *fd)
> > +{
> > +	struct i2c_client *client = v4l2_get_subdevdata(sd);
> > +	struct ox05b1s *sensor = client_to_ox05b1s(client);
> > +
> > +	fd->type = V4L2_MBUS_FRAME_DESC_TYPE_CSI2;
> > +	fd->num_entries = 1;
> > +
> > +	/* get sensor current code*/
> > +	mutex_lock(&sensor->lock);
> > +	fd->entry[0].pixelcode = sensor->mode->code;
> > +	mutex_unlock(&sensor->lock);
> > +
> > +	fd->entry[0].bus.csi2.vc = 0;
> > +	fd->entry[0].bus.csi2.dt = ox05b1s_code2dt(fd->entry[0].pixelcode);
> > +
> > +	return 0;
> > +}
> > +
> > +static int ox05b1s_get_selection(struct v4l2_subdev *sd,
> > +				 struct v4l2_subdev_state *sd_state,
> > +				 struct v4l2_subdev_selection *sel)
> > +{
> > +	struct i2c_client *client = v4l2_get_subdevdata(sd);
> > +	struct ox05b1s *sensor = client_to_ox05b1s(client);
> > +
> > +	switch (sel->target) {
> > +	case V4L2_SEL_TGT_NATIVE_SIZE:
> > +	case V4L2_SEL_TGT_CROP_BOUNDS:
> > +		sel->r.top = 0;
> > +		sel->r.left = 0;
> > +		sel->r.width = sensor->model->native_width;
> > +		sel->r.height = sensor->model->native_height;
> > +		return 0;
> > +	case V4L2_SEL_TGT_CROP:
> > +	case V4L2_SEL_TGT_CROP_DEFAULT:
> > +		sel->r.top = sensor->model->active_top;
> > +		sel->r.left = sensor->model->active_left;
> > +		sel->r.width = sensor->model->active_width;
> > +		sel->r.height = sensor->model->active_height;
> > +		return 0;
> > +	}
> > +
> > +	return -EINVAL;
> > +}
> > +
> > +static const struct v4l2_subdev_video_ops ox05b1s_subdev_video_ops = {
> > +	.s_stream = ox05b1s_s_stream,
> > +};
> > +
> > +static const struct v4l2_subdev_pad_ops ox05b1s_subdev_pad_ops = {
> > +	.set_fmt		= ox05b1s_set_fmt,
> > +	.get_fmt		= v4l2_subdev_get_fmt,
> > +	.get_frame_desc		= ox05b1s_get_frame_desc,
> > +	.enum_mbus_code		= ox05b1s_enum_mbus_code,
> > +	.enum_frame_size	= ox05b1s_enum_frame_size,
> > +	.get_selection		= ox05b1s_get_selection,
> > +};
> > +
> > +static const struct v4l2_subdev_ops ox05b1s_subdev_ops = {
> > +	.video = &ox05b1s_subdev_video_ops,
> > +	.pad   = &ox05b1s_subdev_pad_ops,
> > +};
> > +
> > +static const struct v4l2_subdev_internal_ops ox05b1s_internal_ops = {
> > +	.init_state = ox05b1s_init_state,
> > +};
> > +
> > +static void ox05b1s_get_gpios(struct ox05b1s *sensor)
> > +{
> > +	struct device *dev = &sensor->i2c_client->dev;
> > +
> > +	sensor->rst_gpio = devm_gpiod_get_optional(dev, "reset",
> > +						   GPIOD_OUT_HIGH);
> > +	if (IS_ERR(sensor->rst_gpio))
> > +		dev_warn(dev, "No sensor reset pin available");
> > +}
> > +
> > +static int ox05b1s_get_regulators(struct ox05b1s *sensor)
> > +{
> > +	struct device *dev = &sensor->i2c_client->dev;
> > +	unsigned int i;
> > +
> > +	for (i = 0; i < OX05B1S_NUM_SUPPLIES; i++)
> > +		sensor->supplies[i].supply = ox05b1s_supply_name[i];
> > +
> > +	return devm_regulator_bulk_get(dev, OX05B1S_NUM_SUPPLIES, sensor->supplies);
> > +}
> > +
> > +static int ox05b1s_read_chip_id(struct ox05b1s *sensor)
> > +{
> > +	struct device *dev = &sensor->i2c_client->dev;
> > +	u32 chip_id = 0;
> > +	u8 reg_val = 0;
> > +	char *camera_name;
> > +	int ret = 0;
> > +
> > +	ret = ox05b1s_read_reg(sensor, OX05B1S_REG_CHIP_ID_23_16, &reg_val);
> > +	chip_id |= reg_val << 16;
> > +	ret |= ox05b1s_read_reg(sensor, OX05B1S_REG_CHIP_ID_15_8, &reg_val);
> > +	chip_id |= reg_val << 8;
> > +	ret |= ox05b1s_read_reg(sensor, OX05B1S_REG_CHIP_ID_7_0, &reg_val);
> > +	chip_id |= reg_val;
> > +	if (ret) {
> > +		dev_err(dev, "Camera chip_id read error\n");
> > +		return -ENODEV;
> > +	}
> > +
> > +	switch (chip_id) {
> > +	case 0x580542:
> > +		camera_name = "ox05b1s";
> > +		break;
> > +	default:
> > +		camera_name = "unknown";
> > +		break;
> > +	}
> > +
> > +	if (chip_id == sensor->model->chip_id) {
> > +		dev_info(dev, "Camera %s detected, chip_id=%x\n", camera_name, chip_id);
> > +	} else {
> > +		dev_err(dev, "Detected %s camera (chip_id=%x), but expected %s (chip_id=%x)\n",
> > +			camera_name, chip_id, sensor->model->name, sensor->model->chip_id);
> > +		ret = -ENODEV;
> > +	}
> > +
> > +	return ret;
> > +}
> > +
> > +static int ox05b1s_probe(struct i2c_client *client)
> > +{
> > +	int retval;
> > +	struct device *dev = &client->dev;
> > +	struct v4l2_subdev *sd;
> > +	struct ox05b1s *sensor;
> > +
> > +	sensor = devm_kzalloc(dev, sizeof(*sensor), GFP_KERNEL);
> > +	if (!sensor)
> > +		return -ENOMEM;
> > +
> > +	sensor->regmap = devm_regmap_init_i2c(client, &ox05b1s_regmap_config);
> > +	if (IS_ERR(sensor->regmap))
> > +		return PTR_ERR(sensor->regmap);
> > +
> > +	sensor->i2c_client = client;
> > +
> > +	sensor->model = of_device_get_match_data(dev);
> > +
> > +	ox05b1s_get_gpios(sensor);
> > +
> > +	/* Get system clock, xvclk */
> > +	sensor->sensor_clk = devm_clk_get(dev, NULL);
> > +	if (IS_ERR(sensor->sensor_clk)) {
> > +		return dev_err_probe(dev, PTR_ERR(sensor->sensor_clk),
> > +				     "Failed to get xvclk\n");
> > +	}
> > +
> > +	retval = ox05b1s_get_regulators(sensor);
> > +	if (retval)
> > +		return dev_err_probe(dev, retval, "Failed to get regulators\n");
> > +
> > +	sd = &sensor->subdev;
> > +	v4l2_i2c_subdev_init(sd, client, &ox05b1s_subdev_ops);
> > +	sd->internal_ops = &ox05b1s_internal_ops;
> > +	sd->flags |= V4L2_SUBDEV_FL_HAS_DEVNODE;
> > +	sd->dev = &client->dev;
> > +	sd->entity.function = MEDIA_ENT_F_CAM_SENSOR;
> > +	sensor->pads[OX05B1S_SENS_PAD_SOURCE].flags = MEDIA_PAD_FL_SOURCE;
> > +	retval = media_entity_pads_init(&sd->entity, OX05B1S_SENS_PADS_NUM,
> > +					sensor->pads);
> > +	if (retval)
> > +		goto probe_out;
> > +
> > +	mutex_init(&sensor->lock);
> > +
> > +	retval = ox05b1s_init_controls(sensor);
> > +	if (retval)
> > +		goto probe_err_entity_cleanup;
> > +
> > +	/* power on manually */
> > +	retval = ox05b1s_power_on(sensor);
> > +	if (retval) {
> > +		dev_err(dev, "Failed to power on\n");
> > +		goto probe_err_free_ctrls;
> > +	}
> > +
> > +	pm_runtime_set_active(dev);
> > +	pm_runtime_get_noresume(dev);
> > +	pm_runtime_enable(dev);
> > +
> > +	retval = ox05b1s_read_chip_id(sensor);
> > +	if (retval)
> > +		goto probe_err_pm_runtime;
> > +
> > +	v4l2_i2c_subdev_set_name(sd, client, sensor->model->name, NULL);
> > +
> > +	/* Centrally managed subdev active state */
> > +	sd->state_lock = &sensor->lock;
> > +	retval = v4l2_subdev_init_finalize(sd);
> > +	if (retval < 0) {
> > +		dev_err(dev, "Subdev init error: %d\n", retval);
> > +		goto probe_err_pm_runtime;
> > +	}
> > +
> > +	retval = v4l2_async_register_subdev_sensor(sd);
> > +	if (retval < 0) {
> > +		dev_err(&client->dev, "Async register failed, ret=%d\n", retval);
> > +		goto probe_err_subdev_cleanup;
> > +	}
> > +
> > +	sensor->mode = &sensor->model->supported_modes[0];
> > +	ox05b1s_update_controls(sensor);
> > +
> > +	pm_runtime_set_autosuspend_delay(dev, 1000);
> > +	pm_runtime_use_autosuspend(dev);
> > +	pm_runtime_put_autosuspend(dev);
> > +
> > +	return 0;
> > +
> > +probe_err_subdev_cleanup:
> > +	v4l2_subdev_cleanup(sd);
> > +probe_err_pm_runtime:
> > +	pm_runtime_put_noidle(dev);
> > +	pm_runtime_disable(dev);
> > +	ox05b1s_runtime_suspend(dev);
> > +probe_err_free_ctrls:
> > +	v4l2_ctrl_handler_free(&sensor->ctrls.handler);
> > +probe_err_entity_cleanup:
> > +	media_entity_cleanup(&sd->entity);
> > +probe_out:
> > +	return retval;
> > +}
> > +
> > +static void ox05b1s_remove(struct i2c_client *client)
> > +{
> > +	struct v4l2_subdev *sd = i2c_get_clientdata(client);
> > +	struct ox05b1s *sensor = client_to_ox05b1s(client);
> > +	struct device *dev = &client->dev;
> > +
> > +	pm_runtime_disable(dev);
> > +	if (!pm_runtime_status_suspended(dev))
> > +		ox05b1s_runtime_suspend(dev);
> > +	pm_runtime_set_suspended(dev);
> > +	v4l2_async_unregister_subdev(sd);
> > +	v4l2_subdev_cleanup(sd);
> > +	media_entity_cleanup(&sd->entity);
> > +	v4l2_ctrl_handler_free(&sensor->ctrls.handler);
> > +	mutex_destroy(&sensor->lock);
> > +}
> > +
> > +static DEFINE_RUNTIME_DEV_PM_OPS(ox05b1s_pm_ops, ox05b1s_runtime_suspend,
> > +				 ox05b1s_runtime_resume, NULL);
> > +
> > +static const struct ox05b1s_plat_data ox05b1s_data = {
> > +	.name			= "ox05b1s",
> > +	.chip_id		= 0x580542,
> > +	.native_width		= 2608, /* 8 dummy + 2592 active pixels + 8 dummy */
> > +	.native_height		= 1960, /* 8 dummy + 1944 active lines + 8 dummy */
> > +	.active_top		= 8,
> > +	.active_left		= 8,
> > +	.active_width		= 2592,
> > +	.active_height		= 1944,
> > +	.supported_modes	= ox05b1s_supported_modes,
> > +	.default_mode_index	= 0,
> > +	.supported_codes	= ox05b1s_supported_codes,
> > +};
> > +
> > +static const struct of_device_id ox05b1s_of_match[] = {
> > +	{
> > +		.compatible = "ovti,ox05b1s",
> > +		.data = &ox05b1s_data,
> > +	},
> > +	{ /* sentinel */ }
> > +};
> > +MODULE_DEVICE_TABLE(of, ox05b1s_of_match);
> > +
> > +static struct i2c_driver ox05b1s_i2c_driver = {
> > +	.driver = {
> > +		.name  = "ox05b1s",
> > +		.pm = pm_ptr(&ox05b1s_pm_ops),
> > +		.of_match_table	= ox05b1s_of_match,
> > +	},
> > +	.probe	= ox05b1s_probe,
> > +	.remove = ox05b1s_remove,
> > +};
> > +
> > +module_i2c_driver(ox05b1s_i2c_driver);
> > +MODULE_DESCRIPTION("Omnivision OX05B1S MIPI Camera Subdev Driver");
> > +MODULE_AUTHOR("Mirela Rabulea <mirela.rabulea@nxp.com>");
> > +MODULE_LICENSE("GPL");
> > diff --git a/drivers/media/i2c/ox05b1s/ox05b1s_modes.c b/drivers/media/i2c/ox05b1s/ox05b1s_modes.c
> > new file mode 100644
> > index 000000000000..1830e9a9cc35
> > --- /dev/null
> > +++ b/drivers/media/i2c/ox05b1s/ox05b1s_modes.c
> > @@ -0,0 +1,1171 @@
> > +// SPDX-License-Identifier: GPL-2.0-only
> > +/*
> > + * Register configurations for all sensor supported modes
> > + * Copyright (C) 2024, NXP
> > + * Copyright (C) 2024, Omnivision
> > + * Copyright (C) 2024, Verisilicon
> > + *
> > + */
> > +
> > +#include "ox05b1s.h"
> > +
> > +/*
> > + * Register configuration for Omnivision OX05B1S raw camera
> > + * 2592X1944_30FPS_FULL_RGBIr 2592 1944
> > + */
> > +struct ox05b1s_reg ovx5b_init_setting_2592x1944[] = {
> > +	{0x0100, 0x00},
> > +	{0x0107, 0x01}, /* reserved */
> > +	{0x0104, 0x00},
> > +	{0x0301, 0x1a},
> > +	{0x0304, 0x01},
> > +	{0x0305, 0xe0},
> > +	{0x0306, 0x04},
> > +	{0x0307, 0x02}, /* reset 0x01 */
> > +	{0x0321, 0x03},
> > +	{0x0324, 0x01},
> > +	{0x0325, 0x80},
> > +	{0x0341, 0x03},
> > +	{0x0344, 0x01},
> > +	{0x0345, 0xb0},
> > +	{0x0347, 0x07},
> > +	{0x034a, 0x05}, /* reset 0x03 */
> > +	{0x034b, 0x06},
> > +	{0x0360, 0x80}, /* PLL_CTRL_REG60 bit7 mipi_enable */
> > +	{0x0400, 0xe8},
> > +	{0x0401, 0x00},
> > +	{0x0402, 0x2b},
> > +	{0x0403, 0x32},
> > +	{0x0404, 0x3a},
> > +	{0x0405, 0x00},
> > +	{0x0406, 0x0c},
> > +	{0x0407, 0xe8},
> > +	{0x0408, 0x00},
> > +	{0x0409, 0x2b},
> > +	{0x040a, 0x32},
> > +	{0x040b, 0x5c}, /* reset 0x30 */
> > +	{0x040c, 0xcd}, /* reset 0x00 */
> > +	{0x040d, 0x0c},
> > +	{0x040e, 0xe7},
> > +	{0x040f, 0xff},
> > +	{0x0410, 0x2b},
> > +	{0x0411, 0x32},
> > +	{0x0412, 0x33},
> > +	{0x0413, 0x8f},
> > +	{0x0414, 0x0c},
> > +	{0x2000, 0x04},
> > +	{0x2805, 0xff},
> > +	{0x2806, 0x0f},
> > +	{0x3000, 0x00},
> > +	{0x3001, 0x00},
> > +	{0x3002, 0x10},
> > +	{0x3004, 0x00},
> > +	{0x3009, 0x2e},
> > +	{0x3010, 0x41}, /* SC_CMMN_REG10 mipi_lane_num = 4, phy_mode = 1 */
> > +	{0x3015, 0xf0},
> > +	{0x3016, 0xf0},
> > +	{0x3017, 0xf0},
> > +	{0x3018, 0xf0}, /* SC_CMMN_REG18 */
> > +	{0x301a, 0x78},
> > +	{0x301b, 0xb4},
> > +	{0x301f, 0xe9},
> > +	{0x3024, 0x80},
> > +	{0x3039, 0x00},
> > +	{0x3044, 0x70},
> > +	{0x3101, 0x32},
> > +	{0x3182, 0x10},
> > +	{0x3187, 0xff},
> > +	{0x320a, 0x00},
> > +	{0x320b, 0x00},
> > +	{0x320c, 0x00},
> > +	{0x320d, 0x00},
> > +	{0x320e, 0x00},
> > +	{0x320f, 0x00},
> > +	{0x3211, 0x61},
> > +	{0x3212, 0x00},
> > +	{0x3215, 0xcc},
> > +	{0x3218, 0x06},
> > +	{0x3219, 0x08},
> > +	{0x3251, 0x00},
> > +	{0x3252, 0xe4},
> > +	{0x3253, 0x00},
> > +	{0x3304, 0x11},
> > +	{0x3305, 0x00},
> > +	{0x3306, 0x01},
> > +	{0x3307, 0x00},
> > +	{0x3308, 0x02},
> > +	{0x3309, 0x00},
> > +	{0x330a, 0x02},
> > +	{0x330b, 0x00},
> > +	{0x330c, 0x02},
> > +	{0x330d, 0x00},
> > +	{0x330e, 0x02},
> > +	{0x330f, 0x00},
> > +	{0x3310, 0x02},
> > +	{0x3311, 0x00},
> > +	{0x3312, 0x02},
> > +	{0x3313, 0x00},
> > +	{0x3314, 0x02},
> > +	{0x3315, 0x00},
> > +	{0x3316, 0x02},
> > +	{0x3317, 0x11},
> > +	{0x3400, 0x0c},
> > +	{0x3421, 0x00},
> > +	{0x3422, 0x00},
> > +	{0x3423, 0x00},
> > +	{0x3424, 0x00},
> > +	{0x3425, 0x00},
> > +	{0x3426, 0x00},
> > +	{0x3427, 0x00},
> > +	{0x3428, 0x00},
> > +	{0x3429, 0x40},
> > +	{0x342a, 0x55},
> > +	{0x342b, 0x05},
> > +	{0x342c, 0x00},
> > +	{0x342d, 0x00},
> > +	{0x342e, 0x00},
> > +	{0x3500, 0x00},
> > +	{0x3501, 0x00},
> > +	{0x3502, 0x08},
> > +	{0x3503, 0xa8},
> > +	{0x3504, 0x08},
> > +	{0x3505, 0x00},
> > +	{0x3506, 0x00},
> > +	{0x3507, 0x00},
> > +	{0x3508, 0x01},
> > +	{0x3509, 0x00},
> > +	{0x350a, 0x01},
> > +	{0x350b, 0x00},
> > +	{0x350c, 0x00},
> > +	{0x3541, 0x00},
> > +	{0x3542, 0x08},
> > +	{0x3603, 0x65},
> > +	{0x3604, 0x24},
> > +	{0x3608, 0x08},
> > +	{0x3610, 0x00},
> > +	{0x3612, 0x00},
> > +	{0x3619, 0x09},
> > +	{0x361a, 0x27},
> > +	{0x3620, 0x40},
> > +	{0x3622, 0x15},
> > +	{0x3623, 0x0e},
> > +	{0x3624, 0x1f},
> > +	{0x3625, 0x1f},
> > +	{0x362a, 0x01}, /* ANA_REG2A mipi_pk_0 */
> > +	{0x362b, 0x00}, /* ANA_REG2B mipi_pk_1 */
> > +	{0x3633, 0x88},
> > +	{0x3634, 0x86},
> > +	{0x3636, 0x80},
> > +	{0x3638, 0x3b},
> > +	{0x363a, 0x00},
> > +	{0x363b, 0x22},
> > +	{0x363c, 0x07},
> > +	{0x363d, 0x11},
> > +	{0x363e, 0x21},
> > +	{0x363f, 0x24},
> > +	{0x3640, 0xd3},
> > +	{0x3641, 0x00},
> > +	{0x3650, 0xe4},
> > +	{0x3651, 0x80},
> > +	{0x3652, 0xff},
> > +	{0x3653, 0x00},
> > +	{0x3654, 0x05},
> > +	{0x3655, 0xf8},
> > +	{0x3656, 0x00},
> > +	{0x3660, 0x00},
> > +	{0x3664, 0x00},
> > +	{0x366a, 0x80},
> > +	{0x366b, 0x00},
> > +	{0x3670, 0x00},
> > +	{0x3674, 0x00},
> > +	{0x367b, 0x50},
> > +	{0x3684, 0x6d},
> > +	{0x3685, 0x6d},
> > +	{0x3686, 0x6d},
> > +	{0x3687, 0x6d},
> > +	{0x368c, 0x07},
> > +	{0x368d, 0x07},
> > +	{0x368e, 0x07},
> > +	{0x368f, 0x00},
> > +	{0x3690, 0x04},
> > +	{0x3691, 0x04},
> > +	{0x3692, 0x04},
> > +	{0x3693, 0x04},
> > +	{0x3698, 0x00},
> > +	{0x369e, 0x1f},
> > +	{0x369f, 0x19},
> > +	{0x36a0, 0x05},
> > +	{0x36a2, 0x16},
> > +	{0x36a3, 0x03},
> > +	{0x36a4, 0x07},
> > +	{0x36a5, 0x24},
> > +	{0x36a6, 0x00},
> > +	{0x36a7, 0x80},
> > +	{0x36e3, 0x09},
> > +	{0x3700, 0x07},
> > +	{0x3701, 0x1b},
> > +	{0x3702, 0x0a},
> > +	{0x3703, 0x21},
> > +	{0x3704, 0x19},
> > +	{0x3705, 0x07},
> > +	{0x3706, 0x36},
> > +	{0x370a, 0x1c},
> > +	{0x370b, 0x02},
> > +	{0x370c, 0x00},
> > +	{0x370d, 0x6e},
> > +	{0x370f, 0x80},
> > +	{0x3710, 0x10},
> > +	{0x3712, 0x09},
> > +	{0x3714, 0x42},
> > +	{0x3715, 0x00},
> > +	{0x3716, 0x02},
> > +	{0x3717, 0xa2},
> > +	{0x3718, 0x41},
> > +	{0x371a, 0x80},
> > +	{0x371b, 0x0a},
> > +	{0x371c, 0x0a},
> > +	{0x371d, 0x08},
> > +	{0x371e, 0x01},
> > +	{0x371f, 0x20},
> > +	{0x3720, 0x0e},
> > +	{0x3721, 0x22},
> > +	{0x3722, 0x0c},
> > +	{0x3727, 0x84},
> > +	{0x3728, 0x03},
> > +	{0x3729, 0x64},
> > +	{0x372a, 0x0c},
> > +	{0x372b, 0x14},
> > +	{0x372d, 0x50},
> > +	{0x372e, 0x14},
> > +	{0x3731, 0x11},
> > +	{0x3732, 0x24},
> > +	{0x3733, 0x00},
> > +	{0x3734, 0x00},
> > +	{0x3735, 0x12},
> > +	{0x3736, 0x00},
> > +	{0x373b, 0x0b},
> > +	{0x373c, 0x14},
> > +	{0x373f, 0x3e},
> > +	{0x3740, 0x12},
> > +	{0x3741, 0x12},
> > +	{0x3753, 0x80},
> > +	{0x3754, 0x01},
> > +	{0x3756, 0x11},
> > +	{0x375c, 0x0f},
> > +	{0x375d, 0x35},
> > +	{0x375e, 0x0f},
> > +	{0x375f, 0x37},
> > +	{0x3760, 0x0f},
> > +	{0x3761, 0x27},
> > +	{0x3762, 0x3f},
> > +	{0x3763, 0x5d},
> > +	{0x3764, 0x01},
> > +	{0x3765, 0x17},
> > +	{0x3766, 0x02},
> > +	{0x3768, 0x52},
> > +	{0x376a, 0x30},
> > +	{0x376b, 0x02},
> > +	{0x376c, 0x08},
> > +	{0x376d, 0x2a},
> > +	{0x376e, 0x00},
> > +	{0x376f, 0x18},
> > +	{0x3770, 0x2c},
> > +	{0x3771, 0x0c},
> > +	{0x3772, 0x71},
> > +	{0x3776, 0xc0},
> > +	{0x3778, 0x00},
> > +	{0x3779, 0x80},
> > +	{0x377a, 0x00},
> > +	{0x377d, 0x14},
> > +	{0x377e, 0x0c},
> > +	{0x379c, 0x25},
> > +	{0x379f, 0x00},
> > +	{0x37a3, 0x40},
> > +	{0x37a4, 0x03},
> > +	{0x37a5, 0x10},
> > +	{0x37a6, 0x02},
> > +	{0x37a7, 0x0e},
> > +	{0x37a9, 0x00},
> > +	{0x37aa, 0x08},
> > +	{0x37ab, 0x08},
> > +	{0x37ac, 0x36},
> > +	{0x37ad, 0x40},
> > +	{0x37b0, 0x48},
> > +	{0x37d0, 0x00},
> > +	{0x37d1, 0x0b},
> > +	{0x37d2, 0x0c},
> > +	{0x37d3, 0x10},
> > +	{0x37d4, 0x10},
> > +	{0x37d5, 0x10},
> > +	{0x37d8, 0x0e},
> > +	{0x37d9, 0x0e},
> > +	{0x37da, 0x3c},
> > +	{0x37db, 0x52},
> > +	{0x37dc, 0x50},
> > +	{0x37dd, 0x00},
> > +	{0x37de, 0x55},
> > +	{0x37df, 0x7d},
> > +	{0x37e5, 0x88},
> > +	{0x37e7, 0x68},
> > +	{0x37e8, 0x07},
> > +	{0x37f0, 0x00},
> > +	{0x37f1, 0x0e},
> > +	{0x37f2, 0x35},
> > +	{0x37f3, 0x14},
> > +	{0x37f4, 0x0c},
> > +	{0x37f5, 0x14},
> > +	{0x37f6, 0x0c},
> > +	{0x37f7, 0x35},
> > +	{0x37f8, 0x35},
> > +	{0x37f9, 0x37},
> > +	{0x37fa, 0x37},
> > +	{0x37fb, 0x37},
> > +	{0x3800, 0x00},
> > +	{0x3801, 0x00},
> > +	{0x3802, 0x00},
> > +	{0x3803, 0x00},
> > +	{0x3804, 0x0a},
> > +	{0x3805, 0x2f},
> > +	{0x3806, 0x07},
> > +	{0x3807, 0xa7},
> > +	{0x3808, 0x0a}, /* width 2592 = 0xa20 */
> > +	{0x3809, 0x20}, /* width */
> > +	{0x380a, 0x07}, /* height 1944 = 0x798 */
> > +	{0x380b, 0x98}, /* height */
> > +	{0x380c, 0x02},
> > +	{0x380d, 0xf0},
> > +	{0x380e, 0x08},
> > +	{0x380f, 0x50},
> > +	{0x3810, 0x00},
> > +	{0x3811, 0x08},
> > +	{0x3812, 0x00},
> > +	{0x3813, 0x08},
> > +	{0x3814, 0x11},
> > +	{0x3815, 0x11},
> > +	{0x3820, 0x40},
> > +	{0x3821, 0x04}, /* TIMING_CTRL_REG21 bit[2] = mirror */
> > +	{0x3822, 0x10},
> > +	{0x3823, 0x00},
> > +	{0x3826, 0x00},
> > +	{0x3827, 0x00},
> > +	{0x382b, 0x03},
> > +	{0x382c, 0x0c},
> > +	{0x382d, 0x15},
> > +	{0x382e, 0x01},
> > +	{0x3830, 0x00},
> > +	{0x3838, 0x00},
> > +	{0x383b, 0x00},
> > +	{0x3840, 0x00},
> > +	{0x384a, 0xa2},
> > +	{0x3858, 0x00},
> > +	{0x3859, 0x00},
> > +	{0x3860, 0x00},
> > +	{0x3861, 0x00},
> > +	{0x3866, 0x10},
> > +	{0x3867, 0x07},
> > +	{0x3868, 0x01},
> > +	{0x3869, 0x01},
> > +	{0x386a, 0x01},
> > +	{0x386b, 0x01},
> > +	{0x386c, 0x46},
> > +	{0x386d, 0x08},
> > +	{0x386e, 0x7b},
> > +	{0x3871, 0x01},
> > +	{0x3872, 0x01},
> > +	{0x3873, 0x01},
> > +	{0x3874, 0x01},
> > +	{0x3880, 0x00},
> > +	{0x3881, 0x00},
> > +	{0x3882, 0x00},
> > +	{0x3883, 0x00},
> > +	{0x3884, 0x00},
> > +	{0x3885, 0x00},
> > +	{0x3886, 0x00},
> > +	{0x3887, 0x00},
> > +	{0x3888, 0x00},
> > +	{0x3889, 0x00},
> > +	{0x3900, 0x13},
> > +	{0x3901, 0x19},
> > +	{0x3902, 0x05},
> > +	{0x3903, 0x00},
> > +	{0x3904, 0x00},
> > +	{0x3908, 0x00},
> > +	{0x3909, 0x18},
> > +	{0x390a, 0x00},
> > +	{0x390b, 0x11},
> > +	{0x390c, 0x15},
> > +	{0x390d, 0x84},
> > +	{0x390f, 0x88},
> > +	{0x3910, 0x00},
> > +	{0x3911, 0x00},
> > +	{0x3912, 0x03},
> > +	{0x3913, 0x62},
> > +	{0x3914, 0x00},
> > +	{0x3915, 0x06},
> > +	{0x3916, 0x0c},
> > +	{0x3917, 0x81},
> > +	{0x3918, 0xc8},
> > +	{0x3919, 0x94},
> > +	{0x391a, 0x17},
> > +	{0x391b, 0x05},
> > +	{0x391c, 0x81},
> > +	{0x391d, 0x05},
> > +	{0x391e, 0x81},
> > +	{0x391f, 0x05},
> > +	{0x3920, 0x81},
> > +	{0x3921, 0x14},
> > +	{0x3922, 0x0b},
> > +	{0x3929, 0x00},
> > +	{0x392a, 0x00},
> > +	{0x392b, 0xc8},
> > +	{0x392c, 0x81},
> > +	{0x392f, 0x00},
> > +	{0x3930, 0x00},
> > +	{0x3931, 0x00},
> > +	{0x3932, 0x00},
> > +	{0x3933, 0x00},
> > +	{0x3934, 0x1b},
> > +	{0x3935, 0xc0},
> > +	{0x3936, 0x1c},
> > +	{0x3937, 0x21},
> > +	{0x3938, 0x0d},
> > +	{0x3939, 0x92},
> > +	{0x393a, 0x85},
> > +	{0x393b, 0x8a},
> > +	{0x393c, 0x06},
> > +	{0x393d, 0x8b},
> > +	{0x393e, 0x0f},
> > +	{0x393f, 0x14},
> > +	{0x3940, 0x0f},
> > +	{0x3941, 0x14},
> > +	{0x3945, 0xc0},
> > +	{0x3946, 0x05},
> > +	{0x3947, 0xc0},
> > +	{0x3948, 0x01},
> > +	{0x3949, 0x00},
> > +	{0x394a, 0x00},
> > +	{0x394b, 0x0b},
> > +	{0x394c, 0x0c},
> > +	{0x394d, 0x0b},
> > +	{0x394e, 0x09},
> > +	{0x3951, 0xc7},
> > +	{0x3952, 0x0f},
> > +	{0x3953, 0x0f},
> > +	{0x3954, 0x0f},
> > +	{0x3955, 0x00},
> > +	{0x3956, 0x27},
> > +	{0x3957, 0x27},
> > +	{0x3958, 0x27},
> > +	{0x3959, 0x01},
> > +	{0x395a, 0x02},
> > +	{0x395b, 0x14},
> > +	{0x395c, 0x36},
> > +	{0x395e, 0xc0},
> > +	{0x3964, 0x55},
> > +	{0x3965, 0x55},
> > +	{0x3966, 0x88},
> > +	{0x3967, 0x88},
> > +	{0x3968, 0x66},
> > +	{0x3969, 0x66},
> > +	{0x396d, 0x80},
> > +	{0x396e, 0xff},
> > +	{0x396f, 0x10},
> > +	{0x3970, 0x80},
> > +	{0x3971, 0x80},
> > +	{0x3972, 0x00},
> > +	{0x397a, 0x55},
> > +	{0x397b, 0x10},
> > +	{0x397c, 0x10},
> > +	{0x397d, 0x10},
> > +	{0x397e, 0x10},
> > +	{0x3980, 0xfc},
> > +	{0x3981, 0xfc},
> > +	{0x3982, 0x66},
> > +	{0x3983, 0xfc},
> > +	{0x3984, 0xfc},
> > +	{0x3985, 0x66},
> > +	{0x3986, 0x00},
> > +	{0x3987, 0x00},
> > +	{0x3988, 0x00},
> > +	{0x3989, 0x00},
> > +	{0x398a, 0x00},
> > +	{0x398b, 0x00},
> > +	{0x398c, 0x00},
> > +	{0x398d, 0x00},
> > +	{0x398e, 0x00},
> > +	{0x398f, 0x00},
> > +	{0x3990, 0x00},
> > +	{0x3991, 0x00},
> > +	{0x3992, 0x00},
> > +	{0x3993, 0x00},
> > +	{0x3994, 0x00},
> > +	{0x3995, 0x00},
> > +	{0x3996, 0x00},
> > +	{0x3997, 0x0f},
> > +	{0x3998, 0x0c},
> > +	{0x3999, 0x0c},
> > +	{0x399a, 0x0c},
> > +	{0x399b, 0xf0},
> > +	{0x399c, 0x14},
> > +	{0x399d, 0x0d},
> > +	{0x399e, 0x00},
> > +	{0x399f, 0x0c},
> > +	{0x39a0, 0x0c},
> > +	{0x39a1, 0x0c},
> > +	{0x39a2, 0x00},
> > +	{0x39a3, 0x0f},
> > +	{0x39a4, 0x0c},
> > +	{0x39a5, 0x0c},
> > +	{0x39a6, 0x0c},
> > +	{0x39a7, 0x0c},
> > +	{0x39a8, 0x0f},
> > +	{0x39a9, 0xff},
> > +	{0x39aa, 0xbf},
> > +	{0x39ab, 0x3f},
> > +	{0x39ac, 0x7e},
> > +	{0x39ad, 0xff},
> > +	{0x39ae, 0x00},
> > +	{0x39af, 0x00},
> > +	{0x39b0, 0x00},
> > +	{0x39b1, 0x00},
> > +	{0x39b2, 0x00},
> > +	{0x39b3, 0x00},
> > +	{0x39b4, 0x00},
> > +	{0x39b5, 0x00},
> > +	{0x39b6, 0x00},
> > +	{0x39b7, 0x00},
> > +	{0x39b8, 0x00},
> > +	{0x39b9, 0x00},
> > +	{0x39ba, 0x00},
> > +	{0x39bb, 0x00},
> > +	{0x39bc, 0x00},
> > +	{0x39c2, 0x00},
> > +	{0x39c3, 0x00},
> > +	{0x39c4, 0x00},
> > +	{0x39c5, 0x00},
> > +	{0x39c7, 0x00},
> > +	{0x39c8, 0x00},
> > +	{0x39c9, 0x00},
> > +	{0x39ca, 0x01},
> > +	{0x39cb, 0x00},
> > +	{0x39cc, 0x85},
> > +	{0x39cd, 0x09},
> > +	{0x39cf, 0x04},
> > +	{0x39d0, 0x85},
> > +	{0x39d1, 0x09},
> > +	{0x39d2, 0x04},
> > +	{0x39d4, 0x02},
> > +	{0x39d5, 0x0e},
> > +	{0x39db, 0x00},
> > +	{0x39dc, 0x01},
> > +	{0x39dd, 0x0c},
> > +	{0x39e5, 0xff},
> > +	{0x39e6, 0xff},
> > +	{0x39fa, 0x38},
> > +	{0x39fb, 0x07},
> > +	{0x39ff, 0x00},
> > +	{0x3a05, 0x00},
> > +	{0x3a06, 0x07},
> > +	{0x3a07, 0x0d},
> > +	{0x3a08, 0x08},
> > +	{0x3a09, 0xb2},
> > +	{0x3a0a, 0x0a},
> > +	{0x3a0b, 0x3c},
> > +	{0x3a0c, 0x0b},
> > +	{0x3a0d, 0xe1},
> > +	{0x3a0e, 0x03},
> > +	{0x3a0f, 0x85},
> > +	{0x3a10, 0x0b},
> > +	{0x3a11, 0xff},
> > +	{0x3a12, 0x00},
> > +	{0x3a13, 0x01},
> > +	{0x3a14, 0x0c},
> > +	{0x3a15, 0x04},
> > +	{0x3a17, 0x09},
> > +	{0x3a18, 0x20},
> > +	{0x3a19, 0x09},
> > +	{0x3a1a, 0x9d},
> > +	{0x3a1b, 0x09},
> > +	{0x3a1e, 0x34},
> > +	{0x3a1f, 0x09},
> > +	{0x3a20, 0x89},
> > +	{0x3a21, 0x09},
> > +	{0x3a48, 0xbe},
> > +	{0x3a52, 0x00},
> > +	{0x3a53, 0x01},
> > +	{0x3a54, 0x0c},
> > +	{0x3a55, 0x04},
> > +	{0x3a58, 0x0c},
> > +	{0x3a59, 0x04},
> > +	{0x3a5a, 0x01},
> > +	{0x3a5b, 0x00},
> > +	{0x3a5c, 0x01},
> > +	{0x3a5d, 0xe8},
> > +	{0x3a62, 0x03},
> > +	{0x3a63, 0x86},
> > +	{0x3a64, 0x0b},
> > +	{0x3a65, 0xbe},
> > +	{0x3a6a, 0xdc},
> > +	{0x3a6b, 0x0b},
> > +	{0x3a6c, 0x1a},
> > +	{0x3a6d, 0x06},
> > +	{0x3a6e, 0x01},
> > +	{0x3a6f, 0x04},
> > +	{0x3a70, 0xdc},
> > +	{0x3a71, 0x0b},
> > +	{0x3a83, 0x10},
> > +	{0x3a84, 0x00},
> > +	{0x3a85, 0x08},
> > +	{0x3a87, 0x00},
> > +	{0x3a88, 0x6b},
> > +	{0x3a89, 0x01},
> > +	{0x3a8a, 0x53},
> > +	{0x3a8f, 0x00},
> > +	{0x3a90, 0x00},
> > +	{0x3a91, 0x00},
> > +	{0x3a92, 0x00},
> > +	{0x3a93, 0x60},
> > +	{0x3a94, 0xea},
> > +	{0x3a98, 0x00},
> > +	{0x3a99, 0x31},
> > +	{0x3a9a, 0x01},
> > +	{0x3a9b, 0x04},
> > +	{0x3a9c, 0xdc},
> > +	{0x3a9d, 0x0b},
> > +	{0x3aa4, 0x0f},
> > +	{0x3aad, 0x00},
> > +	{0x3aae, 0x3e},
> > +	{0x3aaf, 0x02},
> > +	{0x3ab0, 0x77},
> > +	{0x3ab2, 0x00},
> > +	{0x3ab3, 0x08},
> > +	{0x3ab6, 0x0b},
> > +	{0x3ab7, 0xff},
> > +	{0x3aba, 0x0b},
> > +	{0x3abb, 0xfa},
> > +	{0x3abd, 0x05},
> > +	{0x3abe, 0x09},
> > +	{0x3abf, 0x1e},
> > +	{0x3ac0, 0x00},
> > +	{0x3ac1, 0x63},
> > +	{0x3ac2, 0x01},
> > +	{0x3ac3, 0x55},
> > +	{0x3ac8, 0x00},
> > +	{0x3ac9, 0x2a},
> > +	{0x3aca, 0x01},
> > +	{0x3acb, 0x36},
> > +	{0x3acc, 0x00},
> > +	{0x3acd, 0x6f},
> > +	{0x3ad0, 0x00},
> > +	{0x3ad1, 0x79},
> > +	{0x3ad2, 0x02},
> > +	{0x3ad3, 0x59},
> > +	{0x3ad4, 0x06},
> > +	{0x3ad5, 0x5a},
> > +	{0x3ad6, 0x08},
> > +	{0x3ad7, 0x3a},
> > +	{0x3ad8, 0x00},
> > +	{0x3ad9, 0x79},
> > +	{0x3ada, 0x02},
> > +	{0x3adb, 0x59},
> > +	{0x3adc, 0x09},
> > +	{0x3add, 0x89},
> > +	{0x3ade, 0x0b},
> > +	{0x3adf, 0x69},
> > +	{0x3ae0, 0x03},
> > +	{0x3ae1, 0xc1},
> > +	{0x3ae2, 0x0b},
> > +	{0x3ae3, 0xaf},
> > +	{0x3ae4, 0x00},
> > +	{0x3ae5, 0x3e},
> > +	{0x3ae6, 0x02},
> > +	{0x3ae7, 0x77},
> > +	{0x3ae8, 0x00},
> > +	{0x3aea, 0x0b},
> > +	{0x3aeb, 0xbe},
> > +	{0x3aee, 0x08},
> > +	{0x3aef, 0x80},
> > +	{0x3af0, 0x09},
> > +	{0x3af1, 0x70},
> > +	{0x3af2, 0x08},
> > +	{0x3af3, 0x94},
> > +	{0x3af4, 0x09},
> > +	{0x3af5, 0x5c},
> > +	{0x3af6, 0x03},
> > +	{0x3af7, 0x85},
> > +	{0x3af8, 0x08},
> > +	{0x3af9, 0x80},
> > +	{0x3afa, 0x0b},
> > +	{0x3afb, 0xaf},
> > +	{0x3afc, 0x01},
> > +	{0x3afd, 0x5a},
> > +	{0x3b1e, 0x00},
> > +	{0x3b20, 0xa5},
> > +	{0x3b21, 0x00},
> > +	{0x3b22, 0x00},
> > +	{0x3b23, 0x00},
> > +	{0x3b24, 0x05},
> > +	{0x3b25, 0x00},
> > +	{0x3b26, 0x00},
> > +	{0x3b27, 0x00},
> > +	{0x3b28, 0x1a},
> > +	{0x3b2f, 0x40},
> > +	{0x3b40, 0x08},
> > +	{0x3b41, 0x70},
> > +	{0x3b42, 0x05},
> > +	{0x3b43, 0xf0},
> > +	{0x3b44, 0x01},
> > +	{0x3b45, 0x54},
> > +	{0x3b46, 0x01},
> > +	{0x3b47, 0x54},
> > +	{0x3b56, 0x08},
> > +	{0x3b80, 0x00},
> > +	{0x3b81, 0x00},
> > +	{0x3b82, 0x64},
> > +	{0x3b83, 0x00},
> > +	{0x3b84, 0x00},
> > +	{0x3b85, 0x64},
> > +	{0x3b9d, 0x61},
> > +	{0x3ba8, 0x38},
> > +	{0x3c11, 0x33},
> > +	{0x3c12, 0x3d},
> > +	{0x3c13, 0x00},
> > +	{0x3c14, 0xbe},
> > +	{0x3c15, 0x0b},
> > +	{0x3c16, 0xa8},
> > +	{0x3c17, 0x03},
> > +	{0x3c18, 0x9c},
> > +	{0x3c19, 0x0b},
> > +	{0x3c1a, 0x0f},
> > +	{0x3c1b, 0x97},
> > +	{0x3c1c, 0x00},
> > +	{0x3c1d, 0x3c},
> > +	{0x3c1e, 0x02},
> > +	{0x3c1f, 0x78},
> > +	{0x3c20, 0x06},
> > +	{0x3c21, 0x80},
> > +	{0x3c22, 0x08},
> > +	{0x3c23, 0x0f},
> > +	{0x3c24, 0x97},
> > +	{0x3c25, 0x00},
> > +	{0x3c26, 0x3c},
> > +	{0x3c27, 0x02},
> > +	{0x3c28, 0xa7},
> > +	{0x3c29, 0x09},
> > +	{0x3c2a, 0xaf},
> > +	{0x3c2b, 0x0b},
> > +	{0x3c2c, 0x38},
> > +	{0x3c2d, 0xf9},
> > +	{0x3c2e, 0x0b},
> > +	{0x3c2f, 0xfd},
> > +	{0x3c30, 0x05},
> > +	{0x3c35, 0x8c},
> > +	{0x3c3e, 0xc3},
> > +	{0x3c43, 0xcb},
> > +	{0x3c44, 0x00},
> > +	{0x3c45, 0xff},
> > +	{0x3c46, 0x0b},
> > +	{0x3c48, 0x3b},
> > +	{0x3c49, 0x40},
> > +	{0x3c4a, 0x00},
> > +	{0x3c4b, 0x5b},
> > +	{0x3c4c, 0x02},
> > +	{0x3c4d, 0x02},
> > +	{0x3c4e, 0x00},
> > +	{0x3c4f, 0x04},
> > +	{0x3c50, 0x0c},
> > +	{0x3c51, 0x00},
> > +	{0x3c52, 0x3b},
> > +	{0x3c53, 0x3a},
> > +	{0x3c54, 0x07},
> > +	{0x3c55, 0x9e},
> > +	{0x3c56, 0x07},
> > +	{0x3c57, 0x9e},
> > +	{0x3c58, 0x07},
> > +	{0x3c59, 0xe8},
> > +	{0x3c5a, 0x03},
> > +	{0x3c5b, 0x33},
> > +	{0x3c5c, 0xa8},
> > +	{0x3c5d, 0x07},
> > +	{0x3c5e, 0xd0},
> > +	{0x3c5f, 0x07},
> > +	{0x3c60, 0x32},
> > +	{0x3c61, 0x00},
> > +	{0x3c62, 0xd0},
> > +	{0x3c63, 0x07},
> > +	{0x3c64, 0x80},
> > +	{0x3c65, 0x80},
> > +	{0x3c66, 0x3f},
> > +	{0x3c67, 0x01},
> > +	{0x3c68, 0x00},
> > +	{0x3c69, 0xd0},
> > +	{0x3c6a, 0x07},
> > +	{0x3c6b, 0x01},
> > +	{0x3c6c, 0x00},
> > +	{0x3c6d, 0xcd},
> > +	{0x3c6e, 0x07},
> > +	{0x3c6f, 0xd1},
> > +	{0x3c70, 0x07},
> > +	{0x3c71, 0x01},
> > +	{0x3c72, 0x00},
> > +	{0x3c73, 0xc3},
> > +	{0x3c74, 0x01},
> > +	{0x3c75, 0x00},
> > +	{0x3c76, 0xcd},
> > +	{0x3c77, 0x07},
> > +	{0x3c78, 0xea},
> > +	{0x3c79, 0x03},
> > +	{0x3c7a, 0xcd},
> > +	{0x3c7b, 0x07},
> > +	{0x3c7c, 0x08},
> > +	{0x3c7d, 0x06},
> > +	{0x3c7e, 0x03},
> > +	{0x3c85, 0x3a},
> > +	{0x3c86, 0x08},
> > +	{0x3c87, 0x69},
> > +	{0x3c88, 0x0b},
> > +	{0x3c8f, 0xb2},
> > +	{0x3c90, 0x08},
> > +	{0x3c91, 0xe1},
> > +	{0x3c92, 0x0b},
> > +	{0x3c93, 0x06},
> > +	{0x3c94, 0x03},
> > +	{0x3c9b, 0x35},
> > +	{0x3c9c, 0x08},
> > +	{0x3c9d, 0x64},
> > +	{0x3c9e, 0x0b},
> > +	{0x3ca5, 0xb7},
> > +	{0x3ca6, 0x08},
> > +	{0x3ca7, 0xe6},
> > +	{0x3ca8, 0x0b},
> > +	{0x3ca9, 0x83},
> > +	{0x3caa, 0x3c},
> > +	{0x3cab, 0x01},
> > +	{0x3cac, 0x00},
> > +	{0x3cad, 0x9e},
> > +	{0x3cae, 0x07},
> > +	{0x3caf, 0x85},
> > +	{0x3cb0, 0x03},
> > +	{0x3cb1, 0xbc},
> > +	{0x3cb2, 0x0b},
> > +	{0x3cb7, 0x3c},
> > +	{0x3cb8, 0x01},
> > +	{0x3cb9, 0x00},
> > +	{0x3cba, 0xbc},
> > +	{0x3cbb, 0x07},
> > +	{0x3cbc, 0xa3},
> > +	{0x3cbd, 0x03},
> > +	{0x3cbe, 0x9e},
> > +	{0x3cbf, 0x0b},
> > +	{0x3cc4, 0x66},
> > +	{0x3cc5, 0xe6},
> > +	{0x3cc6, 0x99},
> > +	{0x3cc7, 0xe9},
> > +	{0x3cc8, 0x33},
> > +	{0x3cc9, 0x03},
> > +	{0x3cca, 0x33},
> > +	{0x3ccb, 0x03},
> > +	{0x3cce, 0x66},
> > +	{0x3ccf, 0x66},
> > +	{0x3cd0, 0x00},
> > +	{0x3cd1, 0x04},
> > +	{0x3cd2, 0xf4},
> > +	{0x3cd3, 0xb7},
> > +	{0x3cd4, 0x03},
> > +	{0x3cd5, 0x10},
> > +	{0x3cd6, 0x06},
> > +	{0x3cd7, 0x30},
> > +	{0x3cd8, 0x08},
> > +	{0x3cd9, 0x5f},
> > +	{0x3cda, 0x0b},
> > +	{0x3cdd, 0x88},
> > +	{0x3cde, 0x88},
> > +	{0x3cdf, 0x08},
> > +	{0x3ce0, 0x00},
> > +	{0x3ce1, 0x00},
> > +	{0x3ce3, 0x00},
> > +	{0x3ce4, 0x00},
> > +	{0x3ce5, 0x00},
> > +	{0x3ce6, 0x00},
> > +	{0x3ce7, 0x00},
> > +	{0x3ce8, 0x00},
> > +	{0x3ce9, 0x00},
> > +	{0x3cea, 0x00},
> > +	{0x3ceb, 0x00},
> > +	{0x3cec, 0x00},
> > +	{0x3ced, 0x00},
> > +	{0x3cee, 0x00},
> > +	{0x3cef, 0x85},
> > +	{0x3cf0, 0x03},
> > +	{0x3cf1, 0xaf},
> > +	{0x3cf2, 0x0b},
> > +	{0x3cf3, 0x03},
> > +	{0x3cf4, 0x2c},
> > +	{0x3cf5, 0x00},
> > +	{0x3cf6, 0x42},
> > +	{0x3cf7, 0x00},
> > +	{0x3cf8, 0x03},
> > +	{0x3cf9, 0x2c},
> > +	{0x3cfa, 0x00},
> > +	{0x3cfb, 0x42},
> > +	{0x3cfc, 0x00},
> > +	{0x3cfd, 0x03},
> > +	{0x3cfe, 0x01},
> > +	{0x3d81, 0x00},
> > +	{0x3e94, 0x0f},
> > +	{0x3e95, 0x5f},
> > +	{0x3e96, 0x02},
> > +	{0x3e97, 0x3c},
> > +	{0x3e98, 0x00},
> > +	{0x3e9f, 0x00},
> > +	{0x3f00, 0x00},
> > +	{0x3f05, 0x03},
> > +	{0x3f07, 0x01},
> > +	{0x3f08, 0x55},
> > +	{0x3f09, 0x25},
> > +	{0x3f0a, 0x35},
> > +	{0x3f0b, 0x20},
> > +	{0x3f11, 0x05},
> > +	{0x3f12, 0x05},
> > +	{0x3f40, 0x00},
> > +	{0x3f41, 0x03},
> > +	{0x3f43, 0x10},
> > +	{0x3f44, 0x02},
> > +	{0x3f45, 0xe6},
> > +	{0x4000, 0xf9},
> > +	{0x4001, 0x2b},
> > +	{0x4008, 0x04},
> > +	{0x4009, 0x1b},
> > +	{0x400a, 0x03},
> > +	{0x400e, 0x10},
> > +	{0x4010, 0x04},
> > +	{0x4011, 0xf7},
> > +	{0x4032, 0x3e},
> > +	{0x4033, 0x02},
> > +	{0x4050, 0x02},
> > +	{0x4051, 0x0d},
> > +	{0x40b0, 0x0f},
> > +	{0x40f9, 0x00},
> > +	{0x4200, 0x00},
> > +	{0x4204, 0x00},
> > +	{0x4205, 0x00},
> > +	{0x4206, 0x00},
> > +	{0x4207, 0x00},
> > +	{0x4208, 0x00},
> > +	{0x4244, 0x00},
> > +	{0x4300, 0x00},
> > +	{0x4301, 0xff},
> > +	{0x4302, 0xf0},
> > +	{0x4303, 0x00},
> > +	{0x4304, 0xff},
> > +	{0x4305, 0xf0},
> > +	{0x4306, 0x00},
> > +	{0x4307, 0x06},
> > +	{0x4308, 0x00},
> > +	{0x430a, 0x90}, /* reset 0x10 emb_dt */
> > +	{0x430b, 0x11},
> > +	{0x4310, 0x00},
> > +	{0x4316, 0x00},
> > +	{0x431c, 0x00},
> > +	{0x431e, 0x00},
> > +	{0x431f, 0x0a},
> > +	{0x4320, 0x20},
> > +	{0x4410, 0x08},
> > +	{0x4433, 0x08},
> > +	{0x4434, 0xf8},
> > +	{0x4508, 0x80},
> > +	{0x4509, 0x10},
> > +	{0x450b, 0x83},
> > +	{0x4511, 0x00},
> > +	{0x4580, 0x09},
> > +	{0x4587, 0x00},
> > +	{0x458c, 0x00},
> > +	{0x4640, 0x00},
> > +	{0x4641, 0xc1},
> > +	{0x4642, 0x00},
> > +	{0x4643, 0x00},
> > +	{0x4649, 0x00},
> > +	{0x4681, 0x04},
> > +	{0x4682, 0x10},
> > +	{0x4683, 0xa0},
> > +	{0x4698, 0x07},
> > +	{0x4699, 0xf0},
> > +	{0x4700, 0xe0},
> > +	{0x4710, 0x00},
> > +	{0x4718, 0x04},
> > +	{0x4802, 0x00}, /* MIPI_CORE_REG00 */
> > +	{0x481b, 0x3c}, /* MIPI_CORE_REG1B */
> > +	{0x4837, 0x19}, /* MIPI_CORE_REG37 pclk_period[7:0] */
> > +	{0x4860, 0x00},
> > +	{0x4883, 0x00},
> > +	{0x4884, 0x09},
> > +	{0x4885, 0x80},
> > +	{0x4886, 0x00},
> > +	{0x4888, 0x10},
> > +	{0x488b, 0x00},
> > +	{0x488c, 0x10},
> > +	{0x4980, 0x03},
> > +	{0x4981, 0x06},
> > +	{0x4984, 0x00},
> > +	{0x4985, 0x00},
> > +	{0x4a14, 0x04},
> > +	{0x4b01, 0x44},
> > +	{0x4b03, 0x80},
> > +	{0x4d06, 0xc8},
> > +	{0x4d09, 0xdf},
> > +	{0x4d12, 0x80},
> > +	{0x4d15, 0x7d},
> > +	{0x4d34, 0x7d},
> > +	{0x4d3c, 0x7d},
> > +	{0x4d5a, 0x14},
> > +	{0x4e03, 0x06},
> > +	{0x4e04, 0xb9},
> > +	{0x4e05, 0x08},
> > +	{0x4e06, 0x36},
> > +	{0x4e07, 0x04},
> > +	{0x4e08, 0x52},
> > +	{0x4e09, 0x05},
> > +	{0x4e0a, 0x47},
> > +	{0x4e0b, 0x02},
> > +	{0x4e0c, 0xe2},
> > +	{0x4e0d, 0x03},
> > +	{0x4e0e, 0x85},
> > +	{0x4e18, 0xf3},
> > +	{0x4e19, 0x0f},
> > +	{0x4e1b, 0x08},
> > +	{0x4e1c, 0x04},
> > +	{0x4f00, 0x7f},
> > +	{0x4f01, 0xff},
> > +	{0x4f03, 0x00},
> > +	{0x4f04, 0x18},
> > +	{0x4f05, 0x13},
> > +	{0x5000, 0x6e},
> > +	{0x5001, 0x00},
> > +	{0x500a, 0x00},
> > +	{0x5080, 0x00},
> > +	{0x5081, 0x00},
> > +	{0x5082, 0x00},
> > +	{0x5083, 0x00},
> > +	{0x5100, 0x00},
> > +	{0x5103, 0x00},
> > +	{0x5180, 0x70},
> > +	{0x5181, 0x70},
> > +	{0x5182, 0x73},
> > +	{0x5183, 0xff},
> > +	{0x5240, 0x73},
> > +	{0x5249, 0x06},
> > +	{0x524a, 0x44},
> > +	{0x524b, 0x44},
> > +	{0x524c, 0x44},
> > +	{0x524e, 0x66},
> > +	{0x524f, 0x06},
> > +	{0x5250, 0x00},
> > +	{0x5281, 0x18},
> > +	{0x5282, 0x08},
> > +	{0x5283, 0x08},
> > +	{0x5284, 0x18},
> > +	{0x5285, 0x18},
> > +	{0x5286, 0x08},
> > +	{0x5287, 0x08},
> > +	{0x5288, 0x18},
> > +	{0x5289, 0x2d},
> > +	{0x6000, 0x40},
> > +	{0x6001, 0x40},
> > +	{0x6002, 0x00},
> > +	{0x6003, 0x00},
> > +	{0x6004, 0x00},
> > +	{0x6005, 0x00},
> > +	{0x6006, 0x00},
> > +	{0x6007, 0x00},
> > +	{0x6008, 0x00},
> > +	{0x6009, 0x00},
> > +	{0x600a, 0x00},
> > +	{0x600b, 0x00},
> > +	{0x600c, 0x02},
> > +	{0x600d, 0x00},
> > +	{0x600e, 0x04},
> > +	{0x600f, 0x00},
> > +	{0x6010, 0x06},
> > +	{0x6011, 0x00},
> > +	{0x6012, 0x00},
> > +	{0x6013, 0x00},
> > +	{0x6014, 0x02},
> > +	{0x6015, 0x00},
> > +	{0x6016, 0x04},
> > +	{0x6017, 0x00},
> > +	{0x6018, 0x06},
> > +	{0x6019, 0x00},
> > +	{0x601a, 0x01},
> > +	{0x601b, 0x00},
> > +	{0x601c, 0x01},
> > +	{0x601d, 0x00},
> > +	{0x601e, 0x01},
> > +	{0x601f, 0x00},
> > +	{0x6020, 0x01},
> > +	{0x6021, 0x00},
> > +	{0x6022, 0x01},
> > +	{0x6023, 0x00},
> > +	{0x6024, 0x01},
> > +	{0x6025, 0x00},
> > +	{0x6026, 0x01},
> > +	{0x6027, 0x00},
> > +	{0x6028, 0x01},
> > +	{0x6029, 0x00},
> > +
> > +	{0x3501, 0x08},
> > +	{0x3502, 0x32},
> > +
> > +	/* PLL 6G */
> > +	{0x0307, 0x01}, /* pll1_divm */
> > +	{0x304a, 0x03},
> > +	{0x4837, 0x10}, /* MIPI_CORE_REG37 pclk_period[7:0] */
> > +
> > +	/* Ficosa specific */
> > +	{0x3503, 0xa8}, /* AEC enable */
> > +	{0x3501, 0x00}, /* AEC expusure time 0x3501, 0x3502 */
> > +	{0x3502, 0x40},
> > +	{0x3508, 0x01}, /* AEC gain 0x3508, 0x3509 */
> > +	{0x3509, 0x00},
> > +	{0x3002, 0x6f}, /* I/O */ /* SC_CMMN_REG02 io_pad_oen[7:0] */
> > +	{0x3005, 0x6a}, /* SC_CMMN_REG05 io_pad_out[7:0] */
> > +	{0x3008, 0x6a}, /* SC_CMMN_REG08 io_pad_sel[7:0] */
> > +	{0x3b20, 0xff}, /* Strobe */ /* STOBE_REG20 stobe_pattern[7:0] */
> > +	{0x3a9f, 0x08}, /* GLOBAL_SHUTTER_REG9F */
> > +	{0x3aa0, 0x00}, /* GLOBAL_SHUTTER_REGA0 */
> > +	{0x3aa1, 0x00}, /* GLOBAL_SHUTTER_REGA1 */
> > +	{0x3b21, 0x00},
> > +	{0x3b22, 0x00},
> > +	{0x3b23, 0x00},
> > +	{0x3b24, 0x00},
> > +	{0x3b25, 0x00},
> > +	{0x3b26, 0x00},
> > +	{0x3b27, 0x00},
> > +	{0x3b28, 0x10},
> > +	{0x3b2f, 0x4a},
> > +	{0x3b2d, 0x01},
> > +	{0x3b2e, 0x78},
> > +	{0x3b1e, 0x01},
> > +	{0x3b1f, 0x05},
> > +
> > +	{0x4e04, 0x06},
> > +	{0x4e04, 0xee},
> > +	{0x4e05, 0x08},
> > +	{0x4e06, 0x88},
> > +	{0x4e07, 0x04},
> > +	{0x4e08, 0x0d},
> > +	{0x4e09, 0x09},
> > +	{0x4e0a, 0xae},
> > +	{0x4e0b, 0x02},
> > +	{0x4e0c, 0x44},
> > +	{0x4e0d, 0x03},
> > +	{0x4e0e, 0x55},
> > +	{ /* sentinel*/ },
> > +};
> > +
> > +struct ox05b1s_reglist ox05b1s_reglist_2592x1944[] = {
> > +	{
> > +		.regs = ovx5b_init_setting_2592x1944
> > +	}, {
> > +		/* sentinel */
> > +	}
> > +};

-- 
Regards,

Laurent Pinchart

