Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 43C118340C
	for <lists+linux-media@lfdr.de>; Tue,  6 Aug 2019 16:35:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1733012AbfHFOfa (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 6 Aug 2019 10:35:30 -0400
Received: from mail-out.m-online.net ([212.18.0.10]:53078 "EHLO
        mail-out.m-online.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731988AbfHFOfa (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 6 Aug 2019 10:35:30 -0400
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
        by mail-out.m-online.net (Postfix) with ESMTP id 462xxp2c3mz1rVv9;
        Tue,  6 Aug 2019 16:35:26 +0200 (CEST)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
        by mail.m-online.net (Postfix) with ESMTP id 462xxp29nPz1qqkV;
        Tue,  6 Aug 2019 16:35:26 +0200 (CEST)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
        by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new, port 10024)
        with ESMTP id p4QGpCLLKEwo; Tue,  6 Aug 2019 16:35:24 +0200 (CEST)
X-Auth-Info: adcY0HBwUmyTdehm8KyQmxAa399Sq5/2URuCZMvXYGE=
Received: from [IPv6:::1] (unknown [195.140.253.167])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.mnet-online.de (Postfix) with ESMTPSA;
        Tue,  6 Aug 2019 16:35:24 +0200 (CEST)
Subject: Re: [PATCH 2/2] media: i2c: isl7998x: Add driver for Intersil
 ISL7998x
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     linux-media@vger.kernel.org,
        Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
        Rob Herring <robh+dt@kernel.org>
References: <20190520201812.7937-1-marex@denx.de>
 <20190520201812.7937-2-marex@denx.de>
 <20190701084315.eygyytirydies422@paasikivi.fi.intel.com>
From:   Marek Vasut <marex@denx.de>
Openpgp: preference=signencrypt
Autocrypt: addr=marex@denx.de; prefer-encrypt=mutual; keydata=
 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
Message-ID: <0b89ba80-46dd-7b5a-6e20-2212e5828147@denx.de>
Date:   Tue, 6 Aug 2019 16:25:26 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190701084315.eygyytirydies422@paasikivi.fi.intel.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 7/1/19 10:43 AM, Sakari Ailus wrote:
[...]

>> +	{ ISL7998x_REG_P0_CLK_CTL_1, 0x1f },
>> +	{ ISL7998x_REG_P0_CLK_CTL_2, 0x43 },
>> +	{ ISL7998x_REG_P0_CLK_CTL_3, 0x4f },
> 
> It'd be great to see what these magical numbers signify. How about some
> additional #defines for the bits? Same below.

That would mean mindlessly transcribing big part of the datasheet here,
but I think it would add very little value, except for another level of
obfuscation. If anyone ever needs to tweak anything here , they would
have a datasheet along with it anyway.

[...]

>> +
>> +/* Menu items for LINK_FREQ V4L2 control */
>> +static const s64 link_freq_menu_items[] = {
>> +	108000000, 216000000, 432000000
>> +};
> 
> Where to these numbers come from?

The datasheet, these are the mipi csi2 link frequencies.

>> +
>> +/* Menu items for TEST_PATTERN V4L2 control */
>> +static const char * const isl7998x_test_pattern_menu[] = {
>> +	"Disabled", "Enabled-PAL (720x576)", "Enabled-NTSC (720x480)"
>> +};
>> +
>> +struct isl7998x {
>> +	struct v4l2_subdev		subdev;
>> +	struct regmap			*regmap;
>> +	struct gpio_desc		*pd_gpio;
>> +	unsigned int			nr_mipi_lanes;
>> +	u32				nr_inputs;
>> +
>> +	unsigned int			width;
>> +	unsigned int			height;
>> +	const struct isl7998x_datafmt	*fmt;
>> +#ifdef CONFIG_MEDIA_CONTROLLER
>> +	struct media_pad		pad;
> 
> Hmm. Didn't you have four inputs in your device?

Yes, this is the output (mipi csi2) pad. There is only one.

> 
>> +#endif
>> +
>> +	struct v4l2_ctrl_handler	ctrl_handler;
>> +	struct mutex			ctrl_mutex;
>> +	/* V4L2 Controls */
>> +	struct v4l2_ctrl		*link_freq;
>> +	u8				test_pattern_enabled;
>> +	u8				test_pattern_bars;
>> +	u8				test_pattern_chans;
>> +	u8				test_pattern_color;
>> +};
>> +
>> +static struct isl7998x *sd_to_isl7998x(struct v4l2_subdev *sd)
>> +{
>> +	return container_of(sd, struct isl7998x, subdev);
>> +}
>> +
>> +static struct isl7998x *i2c_to_isl7998x(const struct i2c_client *client)
>> +{
>> +	return sd_to_isl7998x(i2c_get_clientdata(client));
>> +}
>> +
>> +static int isl7998x_init(struct isl7998x *isl7998x)
>> +{
>> +	const unsigned int lanes = isl7998x->nr_mipi_lanes;
>> +	const u32 isl7998x_video_in_chan_map[] = { 0x00, 0x11, 0x02, 0x02 };
>> +	const struct reg_sequence isl7998x_init_seq_custom[] = {
>> +		{ ISL7998x_REG_P0_VIDEO_IN_CHAN_CTL,
>> +		  isl7998x_video_in_chan_map[isl7998x->nr_inputs - 1] },
>> +		{ ISL7998x_REG_P0_CLK_CTL_4, (lanes == 1) ? 0x40 : 0x41 },
>> +		{ ISL7998x_REG_P5_LI_ENGINE_CTL, (lanes == 1) ? 0x01 : 0x02 },
>> +		{ ISL7998x_REG_P5_LI_ENGINE_LINE_CTL,
>> +		  0x20 | ((isl7998x->width >> 7) & 0x1f) },
>> +		{ ISL7998x_REG_P5_LI_ENGINE_PIC_WIDTH,
>> +		  (isl7998x->width << 1) & 0xff },
>> +	};
>> +	struct regmap *regmap = isl7998x->regmap;
>> +	int ret;
>> +
>> +	ret = regmap_register_patch(regmap, isl7998x_init_seq_1,
>> +				      ARRAY_SIZE(isl7998x_init_seq_1));
>> +	if (ret)
>> +		return ret;
>> +
>> +	ret = regmap_register_patch(regmap, isl7998x_init_seq_custom,
>> +				      ARRAY_SIZE(isl7998x_init_seq_custom));
>> +	if (ret)
>> +		return ret;
>> +
>> +	return regmap_register_patch(regmap, isl7998x_init_seq_2,
>> +				      ARRAY_SIZE(isl7998x_init_seq_2));
>> +}
>> +
>> +static int isl7998x_g_mbus_config(struct v4l2_subdev *sd,
>> +				  struct v4l2_mbus_config *cfg)
>> +{
>> +	struct isl7998x *isl7998x = sd_to_isl7998x(sd);
>> +
>> +	cfg->type = V4L2_MBUS_CSI2_DPHY;
>> +	cfg->flags = V4L2_MBUS_CSI2_CONTINUOUS_CLOCK;
>> +	if (isl7998x->nr_mipi_lanes == 1)
>> +		cfg->flags |= V4L2_MBUS_CSI2_1_LANE;
>> +	else
>> +		cfg->flags |= V4L2_MBUS_CSI2_2_LANE;
> 
> Drivers nowadays generally get this from DT. You can omit this function
> safely. For dynamic configuration we'll need something else (Jacopo's been
> working on that with me).

So how else would I configure my MIPI CSI2 receiver ? I presume the iMX6
CSI2 driver needs to be updated somehow ?

>> +
>> +	return 0;
>> +}
>> +
>> +static int isl7998x_s_stream(struct v4l2_subdev *sd, int enable)
>> +{
>> +	struct isl7998x *isl7998x = sd_to_isl7998x(sd);
>> +
>> +	return isl7998x_init(isl7998x);
> 
> Is this needed both to initialise the hardware as well as start streaming?

Yes, otherwise the csi2 link is unstable.

> Does this also enable the CSI-2 transmitter in driver's probe? This could
> be problematic for some receivers.

How so ?

>> +}
>> +
>> +static int isl7998x_enum_mbus_code(struct v4l2_subdev *sd,
>> +				   struct v4l2_subdev_pad_config *cfg,
>> +				   struct v4l2_subdev_mbus_code_enum *code)
>> +{
>> +	if (code->pad || code->index >= ARRAY_SIZE(isl7998x_colour_fmts))
>> +		return -EINVAL;
>> +
>> +	code->code = isl7998x_colour_fmts[code->index].code;
> 
> A newline would be nice here.
> 
>> +	return 0;
>> +}
>> +
>> +static const unsigned int isl7998x_std_res[] = {
>> +	480, 576, 576, 480, 480, 576, 480, 480
>> +};
>> +
>> +static int isl7998x_update_std(struct isl7998x *isl7998x)
>> +{
>> +	unsigned int height[ISL7998x_INPUTS];
>> +	u8 scanning = GENMASK(ISL7998x_INPUTS - 1, 0);
>> +	unsigned int i;
>> +	int ret;
>> +	u32 reg;
>> +
>> +	while (true) {
>> +		for (i = 0; i < ISL7998x_INPUTS; i++) {
>> +			ret = regmap_read(isl7998x->regmap,
>> +					  ISL7998x_REG_Px_DEC_SDT(i + 1), &reg);
>> +			if (ret)
>> +				return ret;
>> +
>> +			/* Detection is still in progress, restart. */
>> +			if (reg & ISL7998x_REG_Px_DEC_SDT_DET) {
>> +				scanning = GENMASK(ISL7998x_INPUTS - 1, 0);
>> +				break;
>> +			}
>> +
>> +			scanning &= ~BIT(i);
>> +			height[i] = isl7998x_std_res[(reg >> 4) & 0x7];
>> +		}
>> +
>> +		if (!scanning)
>> +			break;
>> +
>> +		mdelay(1);
> 
> How long does this take in general? Could you use msleep() instead of
> mdelay() in order to avoid a busy loop at least seemingly of unknown
> length?

I changed it to usleep_range()

>> +	}
>> +
>> +	/*
>> +	 * According to Renesas FAE, all input cameras must have the
>> +	 * same standard on this chip.
>> +	 */
>> +	for (i = 1; i < isl7998x->nr_inputs ; i++)
>> +		if (height[i - 1] != height[i])
>> +			return -EINVAL;
>> +
>> +	isl7998x->height = height[0];
>> +
>> +	return 0;
>> +}
>> +
>> +static int isl7998x_get_fmt(struct v4l2_subdev *sd,
>> +			    struct v4l2_subdev_pad_config *cfg,
>> +			    struct v4l2_subdev_format *format)
>> +{
>> +	struct isl7998x *isl7998x = sd_to_isl7998x(sd);
>> +	struct v4l2_mbus_framefmt *mf = &format->format;
>> +
>> +	if (format->pad != 0)
>> +		return -EINVAL;
>> +
>> +	if (isl7998x->test_pattern_enabled == 1) {
>> +		mf->width	= 720;
>> +		mf->height	= 576;
>> +	} else if (isl7998x->test_pattern_enabled == 2) {
>> +		mf->width	= 720;
>> +		mf->height	= 480;
>> +	} else {
>> +		mf->width	= isl7998x->width;
>> +		mf->height	= isl7998x->height;
>> +	}
>> +
>> +	mf->code	= isl7998x->fmt->code;
>> +	mf->field	= V4L2_FIELD_INTERLACED;
>> +	mf->colorspace	= 0;
>> +
>> +	return 0;
>> +}
>> +
>> +static int isl7998x_set_fmt(struct v4l2_subdev *sd,
>> +		struct v4l2_subdev_pad_config *cfg,
>> +		struct v4l2_subdev_format *format)
>> +{
>> +	struct isl7998x *isl7998x = sd_to_isl7998x(sd);
>> +	struct v4l2_mbus_framefmt *mf = &format->format;
>> +	int ret;
>> +
>> +	if (format->pad != 0)
>> +		return -EINVAL;
> 
> You can omit the pad checks in pad ops; the framework does that nowadays.

OK

>> +
>> +	if (format->format.width != 720 ||
>> +	    (format->format.height != 480 && format->format.height != 576))
>> +		return -EINVAL;
>> +
>> +	if (format->format.code != MEDIA_BUS_FMT_YUYV8_2X8)
>> +		return -EINVAL;
> 
> Instead of returning an error, you should simply pick a valid format if the
> user-supplied format (mbus code, size) isn't supported.
> 
>> +
>> +	mf->width	= format->format.width;
>> +	mf->height	= format->format.height;
>> +	mf->code	= format->format.code;
>> +	mf->field	= V4L2_FIELD_INTERLACED;
>> +	mf->colorspace	= 0;
> 
> I'd just use what the user provided.

How can that even work ? The hardware might not support that.

>> +
>> +	if (format->which != V4L2_SUBDEV_FORMAT_TRY) {
>> +		ret = isl7998x_update_std(isl7998x);
>> +		if (ret)
>> +			return ret;
>> +		mf->width = isl7998x->width;
>> +		mf->height = isl7998x->height;
>> +		isl7998x->fmt = &isl7998x_colour_fmts[0];
>> +	}
>> +
>> +	return 0;
>> +}
>> +
>> +static int isl7998x_set_test_pattern(struct isl7998x *isl7998x)
>> +{
>> +	const struct reg_sequence isl7998x_init_seq_tpg_off[] = {
>> +		{ ISL7998x_REG_P5_LI_ENGINE_TP_GEN_CTL, 0 },
>> +		{ ISL7998x_REG_P5_LI_ENGINE_CTL_2, 0 }
>> +	};
>> +	const struct reg_sequence isl7998x_init_seq_tpg_on[] = {
>> +		{ ISL7998x_REG_P5_TP_GEN_BAR_PATTERN,
>> +		  isl7998x->test_pattern_bars << 6 },
>> +		{ ISL7998x_REG_P5_LI_ENGINE_CTL_2,
>> +		  isl7998x->test_pattern_enabled == 1 ? BIT(2) : 0 },
>> +		{ ISL7998x_REG_P5_LI_ENGINE_TP_GEN_CTL,
>> +		  (isl7998x->test_pattern_chans << 4) |
>> +		  (isl7998x->test_pattern_color << 2) }
>> +	};
>> +	struct regmap *regmap = isl7998x->regmap;
>> +
>> +	if (isl7998x->test_pattern_enabled) {
>> +		return regmap_register_patch(regmap, isl7998x_init_seq_tpg_on,
>> +					ARRAY_SIZE(isl7998x_init_seq_tpg_on));
>> +	} else {
>> +		return regmap_register_patch(regmap, isl7998x_init_seq_tpg_off,
>> +					ARRAY_SIZE(isl7998x_init_seq_tpg_off));
>> +	}
> 
> No need for braces.

I believe they are required by checkpatch for multiline conditionals.

>> +}
>> +
>> +static int isl7998x_set_ctrl(struct v4l2_ctrl *ctrl)
>> +{
>> +	struct isl7998x *isl7998x = container_of(ctrl->handler,
>> +					       struct isl7998x, ctrl_handler);
>> +
>> +	switch (ctrl->id) {
>> +	case V4L2_CID_TEST_PATTERN_BARS:
>> +		isl7998x->test_pattern_bars = ctrl->val & 0x3;
>> +		return isl7998x_set_test_pattern(isl7998x);
>> +	case V4L2_CID_TEST_PATTERN_CHANNELS:
>> +		isl7998x->test_pattern_chans = ctrl->val & 0xf;
>> +		return isl7998x_set_test_pattern(isl7998x);
>> +	case V4L2_CID_TEST_PATTERN_COLOR:
>> +		isl7998x->test_pattern_color = ctrl->val & 0x3;
>> +		return isl7998x_set_test_pattern(isl7998x);
>> +	case V4L2_CID_TEST_PATTERN:
>> +		isl7998x->test_pattern_enabled = !!ctrl->val;
>> +		return isl7998x_set_test_pattern(isl7998x);
> 
> It'd simplify the driver to use the control value in
> isl7998x_set_test_pattern() without storing the intermediate result in
> driver's own struct.

You need to keep track of which controls are set and how , which is why
they are stored in the drivers' private data.

>> +	}
>> +
>> +	return 0;
>> +}
>> +
>> +static int isl7998x_get_ctrl(struct v4l2_ctrl *ctrl)
>> +{
>> +	struct isl7998x *isl7998x = container_of(ctrl->handler,
>> +					       struct isl7998x, ctrl_handler);
>> +
>> +	v4l2_info(&isl7998x->subdev, "ctrl(id:0x%x,val:0x%x) is not handled\n",
>> +		  ctrl->id, ctrl->val);
> 
> If you have no volatile controls, you can omit this function.

OK

[...]

>> +static int isl7998x_probe(struct i2c_client *client,
>> +			 const struct i2c_device_id *did)
>> +{
>> +	struct device *dev = &client->dev;
>> +	struct v4l2_fwnode_endpoint endpoint;
> 
> Please do initialise the bus_type field at least.

v4l2_fwnode_endpoint_parse() should do that, right ?

>> +	struct device_node *ep;
>> +	struct isl7998x *isl7998x;
>> +	struct i2c_adapter *adapter = to_i2c_adapter(client->dev.parent);
>> +	u32 chip_id;
>> +	int i, ret;
>> +
>> +	ret = i2c_check_functionality(adapter, I2C_FUNC_SMBUS_WORD_DATA);
>> +	if (!ret) {
>> +		dev_warn(&adapter->dev,
>> +			 "I2C-Adapter doesn't support I2C_FUNC_SMBUS_WORD\n");
>> +		return -EIO;
>> +	}
>> +
>> +	isl7998x = devm_kzalloc(dev, sizeof(*isl7998x), GFP_KERNEL);
>> +	if (!isl7998x)
>> +		return -ENOMEM;
>> +
>> +	/* Default to all four inputs active unless specified otherwise. */
>> +	ret = of_property_read_u32(dev->of_node, "isil,num-inputs",
>> +				   &isl7998x->nr_inputs);
>> +	if (ret)
>> +		isl7998x->nr_inputs = 4;
>> +
>> +	if (isl7998x->nr_inputs != 1 && isl7998x->nr_inputs != 2 &&
>> +	    isl7998x->nr_inputs != 4) {
>> +		dev_err(dev, "Invalid number of inputs selected in DT\n");
>> +		return -EINVAL;
>> +	}
>> +
>> +	isl7998x->pd_gpio = devm_gpiod_get_optional(dev, "pd", GPIOD_OUT_HIGH);
>> +	if (IS_ERR(isl7998x->pd_gpio)) {
>> +		dev_err(dev, "Failed to retrieve/request PD GPIO: %ld\n",
>> +			PTR_ERR(isl7998x->pd_gpio));
>> +		return PTR_ERR(isl7998x->pd_gpio);
>> +	}
>> +
>> +	isl7998x->regmap = devm_regmap_init_i2c(client, &isl7998x_regmap);
>> +	if (IS_ERR(isl7998x->regmap)) {
>> +		ret = PTR_ERR(isl7998x->regmap);
>> +		dev_err(dev, "Failed to allocate register map: %d\n", ret);
>> +		return ret;
>> +	}
>> +
>> +	ep = of_graph_get_next_endpoint(dev->of_node, NULL);
>> +	if (!ep) {
>> +		dev_err(dev, "Missing endpoint node\n");
>> +		return -EINVAL;
>> +	}
>> +
>> +	ret = v4l2_fwnode_endpoint_parse(of_fwnode_handle(ep), &endpoint);
>> +	of_node_put(ep);
>> +	if (ret) {
>> +		dev_err(dev, "Failed to parse endpoint\n");
>> +		return ret;
>> +	}
>> +
>> +	if (endpoint.bus_type != V4L2_MBUS_CSI2_DPHY ||
>> +	    endpoint.bus.mipi_csi2.num_data_lanes == 0 ||
>> +	    endpoint.bus.mipi_csi2.num_data_lanes > 2) {
>> +		dev_err(dev, "Invalid bus type or number of MIPI lanes\n");
>> +		return -EINVAL;
>> +	}
>> +
>> +	isl7998x->nr_mipi_lanes = endpoint.bus.mipi_csi2.num_data_lanes;
>> +
>> +	v4l2_i2c_subdev_init(&isl7998x->subdev, client, &isl7998x_subdev_ops);
>> +	isl7998x->subdev.flags |= V4L2_SUBDEV_FL_HAS_DEVNODE;
>> +
>> +#ifdef CONFIG_MEDIA_CONTROLLER
>> +	isl7998x->pad.flags = MEDIA_PAD_FL_SOURCE;
>> +	isl7998x->subdev.entity.ops = &isl7998x_entity_ops;
>> +	isl7998x->subdev.entity.function = MEDIA_ENT_F_CAM_SENSOR;
> 
> This is definitely not a camera sensor.
> 
> MEDIA_ENT_F_VID_IF_BRIDGE perhaps?
> 
> How does the driver work without MC?

MC ?

> E.g. how are the formats on the inputs set up?

They are auto-detected by the chip.

[...]

-- 
Best regards,
Marek Vasut
