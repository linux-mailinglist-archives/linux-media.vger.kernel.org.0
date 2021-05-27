Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 19A10392B9D
	for <lists+linux-media@lfdr.de>; Thu, 27 May 2021 12:20:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236087AbhE0KW2 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 27 May 2021 06:22:28 -0400
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:12210 "EHLO
        mx0a-00069f02.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S236029AbhE0KW0 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 27 May 2021 06:22:26 -0400
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
        by mx0b-00069f02.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 14RACMIk024142;
        Thu, 27 May 2021 10:20:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=corp-2020-01-29;
 bh=GxPAzAA2rTenVEuG3bb0AUMRve/bW+NAnHdXSBwkWTE=;
 b=rjfXuuBbpTB06RvH2kfJAJqRhGA1y2aajUoJ1nQtkamvVuxTkEgmmVXFMBrJrktZIk8C
 iniQxjh7929jKCrn/7qBfUplkH2hMf0FbYZRnZ9VU7Siseuvhe4/+bFw8LAP092hECXN
 KVk9CV/Ye00tCDsPrP22N1mVQNhPph2MpflwjPlLWoRwGC+iHNRj60pcqUWE/orN31/j
 CW0fOqNZtfIJEqNsR3JyVK97G3bK9fTtwOsQN9tBEoU59N9GImH81IDqSPCtH4M42sQR
 g1mDL+8gOo5hXOtuKiE9C3CE/pT7UP4tlr+J0seYqolmJSseCP6N570cQN9Aclj+Diqw 0w== 
Received: from oracle.com (aserp3030.oracle.com [141.146.126.71])
        by mx0b-00069f02.pphosted.com with ESMTP id 38ssybra3y-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Thu, 27 May 2021 10:20:23 +0000
Received: from aserp3030.oracle.com (aserp3030.oracle.com [127.0.0.1])
        by pps.podrdrct (8.16.0.36/8.16.0.36) with SMTP id 14RAKMqp005434;
        Thu, 27 May 2021 10:20:22 GMT
Received: from pps.reinject (localhost [127.0.0.1])
        by aserp3030.oracle.com with ESMTP id 38pr0dfkr4-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Thu, 27 May 2021 10:20:22 +0000
Received: from aserp3030.oracle.com (aserp3030.oracle.com [127.0.0.1])
        by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 14RAAAml181291;
        Thu, 27 May 2021 10:20:21 GMT
Received: from userv0122.oracle.com (userv0122.oracle.com [156.151.31.75])
        by aserp3030.oracle.com with ESMTP id 38pr0dfkqp-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Thu, 27 May 2021 10:20:21 +0000
Received: from abhmp0018.oracle.com (abhmp0018.oracle.com [141.146.116.24])
        by userv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 14RAKHMK015806;
        Thu, 27 May 2021 10:20:17 GMT
Received: from kadam (/41.212.42.34)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Thu, 27 May 2021 03:20:16 -0700
Date:   Thu, 27 May 2021 13:20:06 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     Martin Kepplinger <martin.kepplinger@puri.sm>
Cc:     laurent.pinchart@ideasonboard.com, mchehab@kernel.org,
        robh@kernel.org, shawnguo@kernel.org, kernel@pengutronix.de,
        festevam@gmail.com, linux-imx@nxp.com, slongerbeam@gmail.com,
        kernel@puri.sm, krzk@kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev
Subject: Re: [PATCH v1 2/3] media: imx: add a driver for i.MX8MQ mipi csi rx
 phy and controller
Message-ID: <20210527102005.GR1955@kadam>
References: <20210527075407.3180744-1-martin.kepplinger@puri.sm>
 <20210527075407.3180744-3-martin.kepplinger@puri.sm>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210527075407.3180744-3-martin.kepplinger@puri.sm>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Proofpoint-ORIG-GUID: fLK62nis2s_su3wMEjNYBVeIfJ5QlYao
X-Proofpoint-GUID: fLK62nis2s_su3wMEjNYBVeIfJ5QlYao
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, May 27, 2021 at 09:54:06AM +0200, Martin Kepplinger wrote:
> +static void mipi_csi2_sw_reset(struct csi_state *state)
> +{
> +	struct device *dev = state->dev;
> +	struct device_node *np = dev->of_node;
> +	struct device_node *node;
> +	phandle phandle;
> +	int ret;
> +
> +	dev_dbg(dev, "%s: starting\n", __func__);
> +
> +	ret = of_property_read_u32(np, "phy-reset", &phandle);
> +	if (ret) {
> +		dev_info(dev, "no csis-hw-reset property found: %d\n", ret);
> +		return;
> +	}
> +
> +	node = of_find_node_by_phandle(phandle);
> +	if (!node) {
> +		ret = PTR_ERR(node);

Node is NULL, not an error pointer.

> +		dev_dbg(dev, "not find src node by phandle: %d\n", ret);

Probably change this to "error finding node by phandle\n".
This should just return after printing the error.  syscon_node_to_regmap()
is not going to succeed with a NULL node.

> +	}
> +	state->hw_reset = syscon_node_to_regmap(node);
> +	if (IS_ERR(state->hw_reset)) {
> +		ret = PTR_ERR(state->hw_reset);
> +		dev_err(dev, "failed to get src regmap: %d\n", ret);

There is a new cool %pe which prints "failed to get src regmap: -ENODEV\n".

		dev_err(dev, "failed to get src regmap: %pe\n", state->hw_reset);


> +	}
> +	of_node_put(node);
> +	if (ret < 0)
> +		return;
> +
> +	/* reset imx8mq mipi phy */
> +	regmap_update_bits(state->hw_reset, state->hw_reset_reg, 7, 7);
> +	msleep(20);
> +}
> +
> +static void mipi_csi2_system_enable(struct csi_state *state, int on)
> +{
> +	struct device *dev = state->dev;
> +	struct device_node *np = dev->of_node;
> +	struct device_node *node;
> +	phandle phandle;
> +	int ret;
> +
> +	if (!on) {
> +		/* Disable Data lanes */
> +		mipi_csi2_write(state, CSI2RX_CFG_DISABLE_DATA_LANES, 0xf);
> +		return;
> +	}
> +
> +	ret = of_property_read_u32(np, "phy-gpr", &phandle);
> +	if (ret) {
> +		dev_info(dev, "no phy-gpr property found\n");
> +		return;
> +	}
> +
> +	node = of_find_node_by_phandle(phandle);
> +	if (!node) {
> +		dev_dbg(dev, "not find gpr node by phandle\n");
> +		ret = PTR_ERR(node);

Not an error pointer.

> +	}
> +	state->phy_gpr = syscon_node_to_regmap(node);
> +	if (IS_ERR(state->phy_gpr)) {
> +		dev_err(dev, "failed to get gpr regmap\n");
> +		ret = PTR_ERR(state->phy_gpr);
> +	}
> +	of_node_put(node);
> +	if (ret < 0)
> +		return;
> +
> +	regmap_update_bits(state->phy_gpr,
> +			   state->phy_gpr_reg,
> +			   0x3FFF,
> +			   GPR_CSI2_1_RX_ENABLE |
> +			   GPR_CSI2_1_VID_INTFC_ENB |
> +			   GPR_CSI2_1_HSEL |
> +			   GPR_CSI2_1_CONT_CLK_MODE |
> +			   GPR_CSI2_1_S_PRG_RXHS_SETTLE(state->hs_settle));
> +
> +	dev_dbg(dev, "%s: hs_settle: 0x%X\n", __func__, state->hs_settle);
> +}
> +
> +static void mipi_csi2_set_params(struct csi_state *state)
> +{
> +	int lanes = state->bus.num_data_lanes;
> +	u32 val = 0;
> +	int i;
> +
> +	/* Lanes */
> +	mipi_csi2_write(state, CSI2RX_CFG_NUM_LANES, lanes - 1);
> +
> +	for (i = 0; i < lanes; i++)
> +		val |= (1 << i);
> +
> +	val = 0xF & ~val;
> +	mipi_csi2_write(state, CSI2RX_CFG_DISABLE_DATA_LANES, val);
> +
> +	dev_dbg(state->dev, "imx8mq: CSI2RX_CFG_DISABLE_DATA_LANES: 0x%X\n", val);
> +
> +	/* Mask interrupt */
> +	// Don't let ULPS (ultra-low power status) interrupts flood
> +	mipi_csi2_write(state, CSI2RX_IRQ_MASK, 0x1ff);
> +
> +	mipi_csi2_write(state, 0x180, 1);
> +	/* vid_vc */
> +	mipi_csi2_write(state, 0x184, 1);
> +	mipi_csi2_write(state, 0x188, state->send_level);
> +}
> +
> +static int mipi_csi2_clk_enable(struct csi_state *state)
> +{
> +	return clk_bulk_prepare_enable(ARRAY_SIZE(mipi_csi2_clk_id), state->clks);
> +}
> +
> +static void mipi_csi2_clk_disable(struct csi_state *state)
> +{
> +	clk_bulk_disable_unprepare(ARRAY_SIZE(mipi_csi2_clk_id), state->clks);
> +}
> +
> +static int mipi_csi2_clk_get(struct csi_state *state)
> +{
> +	unsigned int i;
> +	int ret;
> +
> +	state->clks = devm_kcalloc(state->dev, ARRAY_SIZE(mipi_csi2_clk_id),
> +				   sizeof(*state->clks), GFP_KERNEL);
> +
> +	if (!state->clks)
> +		return -ENOMEM;
> +
> +	for (i = 0; i < ARRAY_SIZE(mipi_csi2_clk_id); i++)
> +		state->clks[i].id = mipi_csi2_clk_id[i];
> +
> +	ret = devm_clk_bulk_get(state->dev, ARRAY_SIZE(mipi_csi2_clk_id),
> +				state->clks);
> +	return ret;
> +}
> +
> +static void mipi_csi2_start_stream(struct csi_state *state)
> +{
> +	mipi_csi2_sw_reset(state);
> +	mipi_csi2_set_params(state);
> +	mipi_csi2_system_enable(state, true);
> +}
> +
> +static void mipi_csi2_stop_stream(struct csi_state *state)
> +{
> +	mipi_csi2_system_enable(state, false);
> +}
> +
> +/* -----------------------------------------------------------------------------
> + * V4L2 subdev operations
> + */
> +
> +static struct csi_state *mipi_sd_to_csi2_state(struct v4l2_subdev *sdev)
> +{
> +	return container_of(sdev, struct csi_state, sd);
> +}
> +
> +static int mipi_csi2_s_stream(struct v4l2_subdev *sd, int enable)
> +{
> +	struct csi_state *state = mipi_sd_to_csi2_state(sd);
> +	int ret;
> +
> +	mipi_csi2_write(state, CSI2RX_IRQ_MASK, 0x008);
> +
> +	dev_dbg(state->dev, "%s: enable: %d\n", __func__, enable);
> +
> +	if (enable) {
> +		ret = pm_runtime_get_sync(state->dev);
> +		if (ret < 0) {
> +			pm_runtime_put_noidle(state->dev);
> +			return ret;
> +		}
> +		ret = v4l2_subdev_call(state->src_sd, core, s_power, 1);
> +		if (ret < 0 && ret != -ENOIOCTLCMD)
> +			goto done;
> +	}
> +
> +	mutex_lock(&state->lock);
> +
> +	if (enable) {
> +		if (state->state & ST_SUSPENDED) {
> +			ret = -EBUSY;
> +			goto unlock;
> +		}
> +
> +		mipi_csi2_start_stream(state);
> +		ret = v4l2_subdev_call(state->src_sd, video, s_stream, 1);
> +		if (ret < 0)
> +			goto unlock;
> +
> +		state->state |= ST_STREAMING;
> +	} else {
> +		v4l2_subdev_call(state->src_sd, video, s_stream, 0);
> +		ret = v4l2_subdev_call(state->src_sd, core, s_power, 0);
> +		if (ret == -ENOIOCTLCMD)
> +			ret = 0;
> +		mipi_csi2_stop_stream(state);
> +		state->state &= ~ST_STREAMING;
> +	}
> +
> +unlock:
> +	mutex_unlock(&state->lock);
> +
> +done:
> +	if (!enable || ret < 0)
> +		pm_runtime_put(state->dev);
> +
> +	return ret;
> +}
> +
> +static struct v4l2_mbus_framefmt *
> +mipi_csi2_get_format(struct csi_state *state,
> +		     struct v4l2_subdev_pad_config *cfg,
> +		     enum v4l2_subdev_format_whence which,
> +		     unsigned int pad)
> +{
> +	if (which == V4L2_SUBDEV_FORMAT_TRY)
> +		return v4l2_subdev_get_try_format(&state->sd, cfg, pad);
> +
> +	return &state->format_mbus;
> +}
> +
> +static int mipi_csi2_init_cfg(struct v4l2_subdev *sd,
> +			      struct v4l2_subdev_pad_config *cfg)
> +{
> +	struct csi_state *state = mipi_sd_to_csi2_state(sd);
> +	struct v4l2_mbus_framefmt *fmt_sink;
> +	struct v4l2_mbus_framefmt *fmt_source;
> +	enum v4l2_subdev_format_whence which;
> +
> +	which = cfg ? V4L2_SUBDEV_FORMAT_TRY : V4L2_SUBDEV_FORMAT_ACTIVE;
> +	fmt_sink = mipi_csi2_get_format(state, cfg, which, MIPI_CSI2_PAD_SINK);
> +
> +	fmt_sink->code = MEDIA_BUS_FMT_SGBRG10_1X10;
> +	fmt_sink->width = MIPI_CSI2_DEF_PIX_WIDTH;
> +	fmt_sink->height = MIPI_CSI2_DEF_PIX_HEIGHT;
> +	fmt_sink->field = V4L2_FIELD_NONE;
> +
> +	fmt_sink->colorspace = V4L2_COLORSPACE_RAW;
> +	fmt_sink->xfer_func = V4L2_MAP_XFER_FUNC_DEFAULT(fmt_sink->colorspace);
> +	fmt_sink->ycbcr_enc = V4L2_MAP_YCBCR_ENC_DEFAULT(fmt_sink->colorspace);
> +	fmt_sink->quantization =
> +		V4L2_MAP_QUANTIZATION_DEFAULT(false, fmt_sink->colorspace,
> +					      fmt_sink->ycbcr_enc);
> +
> +	/*
> +	 * When called from mipi_csi2_subdev_init() to initialize the active
> +	 * configuration, cfg is NULL, which indicates there's no source pad
> +	 * configuration to set.
> +	 */
> +	if (!cfg)
> +		return 0;
> +
> +	fmt_source = mipi_csi2_get_format(state, cfg, which, MIPI_CSI2_PAD_SOURCE);
> +	*fmt_source = *fmt_sink;
> +
> +	return 0;
> +}
> +
> +static int mipi_csi2_get_fmt(struct v4l2_subdev *sd,
> +			     struct v4l2_subdev_pad_config *cfg,
> +			     struct v4l2_subdev_format *sdformat)
> +{
> +	struct csi_state *state = mipi_sd_to_csi2_state(sd);
> +	struct v4l2_mbus_framefmt *fmt;
> +
> +	fmt = mipi_csi2_get_format(state, cfg, sdformat->which, sdformat->pad);
> +
> +	mutex_lock(&state->lock);
> +	sdformat->format = *fmt;
> +	mutex_unlock(&state->lock);
> +
> +	return 0;
> +}
> +
> +static int mipi_csi2_enum_mbus_code(struct v4l2_subdev *sd,
> +				    struct v4l2_subdev_pad_config *cfg,
> +				    struct v4l2_subdev_mbus_code_enum *code)
> +{
> +	struct csi_state *state = mipi_sd_to_csi2_state(sd);
> +
> +	/*
> +	 * We can't transcode in any way, the source format is identical
> +	 * to the sink format.
> +	 */
> +	if (code->pad == MIPI_CSI2_PAD_SOURCE) {
> +		struct v4l2_mbus_framefmt *fmt;
> +
> +		if (code->index > 0)
> +			return -EINVAL;
> +
> +		fmt = mipi_csi2_get_format(state, cfg, code->which, code->pad);
> +		code->code = fmt->code;
> +		return 0;
> +	}
> +
> +	if (code->pad != MIPI_CSI2_PAD_SINK)
> +		return -EINVAL;
> +
> +	if (code->index >= ARRAY_SIZE(mipi_csi2_formats))
> +		return -EINVAL;
> +
> +	code->code = mipi_csi2_formats[code->index].code;
> +
> +	return 0;
> +}
> +
> +static int mipi_csi2_set_fmt(struct v4l2_subdev *sd,
> +			     struct v4l2_subdev_pad_config *cfg,
> +			     struct v4l2_subdev_format *sdformat)
> +{
> +	struct csi_state *state = mipi_sd_to_csi2_state(sd);
> +	struct csi2_pix_format const *csi2_fmt;
> +	struct v4l2_mbus_framefmt *fmt;
> +
> +	/*
> +	 * The device can't transcode in any way, the source format can't be
> +	 * modified.
> +	 */
> +	if (sdformat->pad == MIPI_CSI2_PAD_SOURCE)
> +		return mipi_csi2_get_fmt(sd, cfg, sdformat);
> +
> +	if (sdformat->pad != MIPI_CSI2_PAD_SINK)
> +		return -EINVAL;
> +
> +	csi2_fmt = find_csi2_format(sdformat->format.code);
> +	if (!csi2_fmt) {
> +		dev_err(state->dev, "no format found based on code %d\n",
> +			sdformat->format.code);
> +		csi2_fmt = &mipi_csi2_formats[0];
> +	}
> +
> +	fmt = mipi_csi2_get_format(state, cfg, sdformat->which, sdformat->pad);
> +
> +	mutex_lock(&state->lock);
> +
> +	fmt->code = csi2_fmt->code;
> +	fmt->width = sdformat->format.width;
> +	fmt->height = sdformat->format.height;
> +
> +	sdformat->format = *fmt;
> +
> +	/* Propagate the format from sink to source. */
> +	fmt = mipi_csi2_get_format(state, cfg, sdformat->which,
> +				   MIPI_CSI2_PAD_SOURCE);
> +	*fmt = sdformat->format;
> +
> +	/* Store the CSI2 format descriptor for active formats. */
> +	if (sdformat->which == V4L2_SUBDEV_FORMAT_ACTIVE)
> +		state->csi2_fmt = csi2_fmt;
> +
> +	mutex_unlock(&state->lock);
> +
> +	/* https://community.nxp.com/t5/i-MX-Processors/Explenation-for-HS-SETTLE-parameter-in-MIPI-CSI-D-PHY-registers/m-p/764275/highlight/true#M118744 */
> +	if (sdformat->format.width * sdformat->format.height > 720 * 480)
> +		state->hs_settle = 0x9;
> +	else
> +		state->hs_settle = 0x14;
> +
> +	state->send_level = 64;
> +
> +	dev_dbg(state->dev,
> +		"%s: format %dx%d send_level %d hs_settle 0x%X\n", __func__,
> +		sdformat->format.width, sdformat->format.height,
> +		state->send_level, state->hs_settle);
> +
> +	return 0;
> +}
> +
> +static int mipi_csi2_log_status(struct v4l2_subdev *sd)
> +{
> +	struct csi_state *state = mipi_sd_to_csi2_state(sd);
> +
> +	mutex_lock(&state->lock);
> +	mutex_unlock(&state->lock);
> +
> +	return 0;

Please don't push stub code upstream.

> +}
> +
> +static const struct v4l2_subdev_core_ops mipi_csi2_core_ops = {
> +	.log_status	= mipi_csi2_log_status,
> +};
> +
> +static const struct v4l2_subdev_video_ops mipi_csi2_video_ops = {
> +	.s_stream	= mipi_csi2_s_stream,
> +};
> +
> +static const struct v4l2_subdev_pad_ops mipi_csi2_pad_ops = {
> +	.init_cfg		= mipi_csi2_init_cfg,
> +	.enum_mbus_code		= mipi_csi2_enum_mbus_code,
> +	.get_fmt		= mipi_csi2_get_fmt,
> +	.set_fmt		= mipi_csi2_set_fmt,
> +};
> +
> +static const struct v4l2_subdev_ops mipi_csi2_subdev_ops = {
> +	.core	= &mipi_csi2_core_ops,
> +	.video	= &mipi_csi2_video_ops,
> +	.pad	= &mipi_csi2_pad_ops,
> +};
> +
> +/* -----------------------------------------------------------------------------
> + * Media entity operations
> + */
> +
> +static int mipi_csi2_link_setup(struct media_entity *entity,
> +				const struct media_pad *local_pad,
> +				const struct media_pad *remote_pad, u32 flags)
> +{
> +	struct v4l2_subdev *sd = media_entity_to_v4l2_subdev(entity);
> +	struct csi_state *state = mipi_sd_to_csi2_state(sd);
> +	struct v4l2_subdev *remote_sd;
> +
> +	dev_dbg(state->dev, "link setup %s -> %s", remote_pad->entity->name,
> +		local_pad->entity->name);
> +
> +	/* We only care about the link to the source. */
> +	if (!(local_pad->flags & MEDIA_PAD_FL_SINK))
> +		return 0;
> +
> +	remote_sd = media_entity_to_v4l2_subdev(remote_pad->entity);
> +
> +	if (flags & MEDIA_LNK_FL_ENABLED) {
> +		if (state->src_sd)
> +			return -EBUSY;
> +
> +		state->src_sd = remote_sd;
> +	} else {
> +		state->src_sd = NULL;
> +	}
> +
> +	return 0;
> +}
> +
> +static const struct media_entity_operations mipi_csi2_entity_ops = {
> +	.link_setup	= mipi_csi2_link_setup,
> +	.link_validate	= v4l2_subdev_link_validate,
> +	.get_fwnode_pad = v4l2_subdev_get_fwnode_pad_1_to_1,
> +};
> +
> +/* -----------------------------------------------------------------------------
> + * Async subdev notifier
> + */
> +
> +static struct csi_state *
> +mipi_notifier_to_csi2_state(struct v4l2_async_notifier *n)
> +{
> +	return container_of(n, struct csi_state, notifier);
> +}
> +
> +static int mipi_csi2_notify_bound(struct v4l2_async_notifier *notifier,
> +				  struct v4l2_subdev *sd,
> +				  struct v4l2_async_subdev *asd)
> +{
> +	struct csi_state *state = mipi_notifier_to_csi2_state(notifier);
> +	struct media_pad *sink = &state->sd.entity.pads[MIPI_CSI2_PAD_SINK];
> +
> +	return v4l2_create_fwnode_links_to_pad(sd, sink, 0);
> +}
> +
> +static const struct v4l2_async_notifier_operations mipi_csi2_notify_ops = {
> +	.bound = mipi_csi2_notify_bound,
> +};
> +
> +static int mipi_csi2_async_register(struct csi_state *state)
> +{
> +	struct v4l2_fwnode_endpoint vep = {
> +		.bus_type = V4L2_MBUS_CSI2_DPHY,
> +	};
> +	struct v4l2_async_subdev *asd;
> +	struct fwnode_handle *ep;
> +	unsigned int i;
> +	int ret;
> +
> +	v4l2_async_notifier_init(&state->notifier);
> +
> +	ep = fwnode_graph_get_endpoint_by_id(dev_fwnode(state->dev), 0, 0,
> +					     FWNODE_GRAPH_ENDPOINT_NEXT);
> +	if (!ep)
> +		return -ENOTCONN;
> +
> +	ret = v4l2_fwnode_endpoint_parse(ep, &vep);
> +	if (ret)
> +		goto err_parse;
> +
> +	for (i = 0; i < vep.bus.mipi_csi2.num_data_lanes; ++i) {
> +		if (vep.bus.mipi_csi2.data_lanes[i] != i + 1) {
> +			dev_err(state->dev,
> +				"data lanes reordering is not supported");
> +			goto err_parse;

Missing error code.

> +		}
> +	}
> +
> +	state->bus = vep.bus.mipi_csi2;
> +
> +	dev_dbg(state->dev, "data lanes: %d\n", state->bus.num_data_lanes);
> +	dev_dbg(state->dev, "flags: 0x%08x\n", state->bus.flags);
> +
> +	asd = v4l2_async_notifier_add_fwnode_remote_subdev(&state->notifier,
> +							   ep, struct v4l2_async_subdev);
> +	if (IS_ERR(asd)) {
> +		ret = PTR_ERR(asd);
> +		goto err_parse;
> +	}
> +
> +	fwnode_handle_put(ep);
> +
> +	state->notifier.ops = &mipi_csi2_notify_ops;
> +
> +	ret = v4l2_async_subdev_notifier_register(&state->sd, &state->notifier);
> +	if (ret)
> +		return ret;
> +
> +	return v4l2_async_register_subdev(&state->sd);
> +
> +err_parse:
> +	fwnode_handle_put(ep);
> +
> +	return ret;
> +}
> +
> +/* -----------------------------------------------------------------------------
> + * Suspend/resume
> + */
> +
> +static int mipi_csi2_pm_suspend(struct device *dev, bool runtime)
> +{
> +	struct v4l2_subdev *sd = dev_get_drvdata(dev);
> +	struct csi_state *state = mipi_sd_to_csi2_state(sd);
> +	int ret = 0;
> +
> +	mutex_lock(&state->lock);
> +	if (state->state & ST_POWERED) {
> +		mipi_csi2_stop_stream(state);
> +		mipi_csi2_clk_disable(state);
> +		state->state &= ~ST_POWERED;
> +		if (!runtime)
> +			state->state |= ST_SUSPENDED;
> +	}
> +
> +	mutex_unlock(&state->lock);
> +
> +	ret = icc_set_bw(state->icc_path, 0, 0);
> +	if (ret)
> +		dev_err(dev, "icc_set_bw failed with %d\n", ret);
> +
> +	return ret ? -EAGAIN : 0;
> +}
> +
> +static int mipi_csi2_pm_resume(struct device *dev, bool runtime)
> +{
> +	struct v4l2_subdev *sd = dev_get_drvdata(dev);
> +	struct csi_state *state = mipi_sd_to_csi2_state(sd);
> +	int ret = 0;
> +
> +	ret = icc_set_bw(state->icc_path, 0, state->icc_path_bw);
> +	if (ret) {
> +		dev_err(dev, "icc_set_bw failed with %d\n", ret);
> +		return ret;
> +	}
> +
> +	mutex_lock(&state->lock);
> +	if (!runtime && !(state->state & ST_SUSPENDED))
> +		goto unlock;
> +
> +	if (!(state->state & ST_POWERED)) {
> +		state->state |= ST_POWERED;
> +		ret = mipi_csi2_clk_enable(state);
> +	}
> +	if (state->state & ST_STREAMING)
> +		mipi_csi2_start_stream(state);
> +
> +	state->state &= ~ST_SUSPENDED;
> +
> +unlock:
> +	mutex_unlock(&state->lock);
> +
> +	return ret ? -EAGAIN : 0;
> +}
> +
> +static int __maybe_unused mipi_csi2_suspend(struct device *dev)
> +{
> +	return mipi_csi2_pm_suspend(dev, false);
> +}
> +
> +static int __maybe_unused mipi_csi2_resume(struct device *dev)
> +{
> +	return mipi_csi2_pm_resume(dev, false);
> +}
> +
> +static int __maybe_unused mipi_csi2_runtime_suspend(struct device *dev)
> +{
> +	return mipi_csi2_pm_suspend(dev, true);
> +}
> +
> +static int __maybe_unused mipi_csi2_runtime_resume(struct device *dev)
> +{
> +	return mipi_csi2_pm_resume(dev, true);
> +}
> +
> +static const struct dev_pm_ops mipi_csi2_pm_ops = {
> +	SET_RUNTIME_PM_OPS(mipi_csi2_runtime_suspend, mipi_csi2_runtime_resume,
> +			   NULL)
> +	SET_SYSTEM_SLEEP_PM_OPS(mipi_csi2_suspend, mipi_csi2_resume)
> +};
> +
> +/* -----------------------------------------------------------------------------
> + * Probe/remove & platform driver
> + */
> +
> +static int mipi_csi2_subdev_init(struct csi_state *state)
> +{
> +	struct v4l2_subdev *sd = &state->sd;
> +
> +	v4l2_subdev_init(sd, &mipi_csi2_subdev_ops);
> +	sd->owner = THIS_MODULE;
> +	snprintf(sd->name, sizeof(sd->name), "%s.%d",
> +		 MIPI_CSI2_SUBDEV_NAME, state->index);
> +
> +	sd->flags |= V4L2_SUBDEV_FL_HAS_DEVNODE;
> +	sd->ctrl_handler = NULL;
> +
> +	sd->entity.function = MEDIA_ENT_F_VID_IF_BRIDGE;
> +	sd->entity.ops = &mipi_csi2_entity_ops;
> +
> +	sd->dev = state->dev;
> +
> +	state->csi2_fmt = &mipi_csi2_formats[0];
> +	mipi_csi2_init_cfg(sd, NULL);
> +
> +	state->pads[MIPI_CSI2_PAD_SINK].flags = MEDIA_PAD_FL_SINK
> +					 | MEDIA_PAD_FL_MUST_CONNECT;
> +	state->pads[MIPI_CSI2_PAD_SOURCE].flags = MEDIA_PAD_FL_SOURCE
> +					   | MEDIA_PAD_FL_MUST_CONNECT;
> +	return media_entity_pads_init(&sd->entity, MIPI_CSI2_PADS_NUM,
> +				      state->pads);
> +}
> +
> +static int init_icc(struct platform_device *pdev)
> +{
> +	struct v4l2_subdev *sd = dev_get_drvdata(&pdev->dev);
> +	struct csi_state *state = mipi_sd_to_csi2_state(sd);
> +	int ret;
> +
> +	/* Optional interconnect request */
> +	state->icc_path = of_icc_get(&pdev->dev, "dram");
> +	if (IS_ERR(state->icc_path)) {
> +		ret = PTR_ERR(state->icc_path);
> +		if (ret == -EPROBE_DEFER)
> +			return ret;
> +
> +		state->icc_path = NULL;
> +		return 0;

Normally if a feature is optional feature then it will return NULL if
the option is disabled and error pointers if there is an error.  And
that's true here too because of_icc_get() will return NULL if it's
disabled.

And normally if there is an error then we treat it like an error instead
of just disabling it.  The user can then fix the error or disable the
feature and try again.  It's like at a restaurant if you order pancakes
but they don't have any, they don't silently replace it with fried egg
because pancakes are not a requirement for life.

So my instinct is that this should be written as:

	state->icc_path = of_icc_get(&pdev->dev, "dram");
	if (PTR_ERR_OR_NULL(state->icc_path))
		return PTR_ERR(state->icc_path);

> +	}
> +
> +	state->icc_path_bw = MBps_to_icc(700);
> +
> +	ret = icc_set_bw(state->icc_path, 0, state->icc_path_bw);
> +	if (ret) {
> +		dev_err(&pdev->dev, "icc_set_bw failed with %d\n", ret);
> +		return ret;

Probably we need to call icc_put(state->icc_path) before returning?
I wish there were a of_icc_put() function even if it were very simple:

void of_icc_put(struct icc_path *path)
{
	icc_put(path);
}

There needs to be a free function for init_icc() as well:

void release_icc(struct platform_device *pdev)
{
	struct v4l2_subdev *sd = dev_get_drvdata(&pdev->dev);
	struct csi_state *state = mipi_sd_to_csi2_state(sd);

	icc_put(state->path);
}

We could call it from probe if mipi_csi2_pm_resume() fails.  Currently
that leaks.  Also we could call it from the remove function instead of
calling icc_put() directly.


regards,
dan carpenter

> +	}
> +
> +	return 0;
> +}
> +
> +static int mipi_csi2_parse_dt(struct csi_state *state)
> +{
> +	struct device_node *node = state->dev->of_node;
> +	const u32 *addr;
> +	int len;
> +	int reg;
> +
> +	addr = of_get_property(node, "reg", &len);
> +	if (!addr) {
> +		dev_err(state->dev, "no reg property found\n");
> +		return -EINVAL;
> +	}
> +
> +	reg = be32_to_cpup(addr);
> +
> +	if ((reg >> 16) == MIPI_CSI2_RX_CSR_1_BASE_ADDR >> 16) {
> +		state->phy_gpr_reg = MIPI_CSI2_RX_CSR_1_GPR_REG;
> +		state->hw_reset_reg = MIPI_CSI2_RX_CSR_1_HW_RESET_REG;
> +	} else if ((reg >> 16) == MIPI_CSI2_RX_CSR_2_BASE_ADDR >> 16) {
> +		state->phy_gpr_reg = MIPI_CSI2_RX_CSR_2_GPR_REG;
> +		state->hw_reset_reg = MIPI_CSI2_RX_CSR_2_HW_RESET_REG;
> +	}
> +
> +	return 0;
> +}
> +
> +static int mipi_csi2_probe(struct platform_device *pdev)
> +{
> +	struct device *dev = &pdev->dev;
> +	struct csi_state *state;
> +	int ret;
> +
> +	state = devm_kzalloc(dev, sizeof(*state), GFP_KERNEL);
> +	if (!state)
> +		return -ENOMEM;
> +
> +	mutex_init(&state->lock);
> +
> +	state->dev = dev;
> +
> +	ret = mipi_csi2_parse_dt(state);
> +	if (ret < 0) {
> +		dev_err(dev, "Failed to parse device tree: %d\n", ret);
> +		return ret;
> +	}
> +
> +	/* Acquire resources. */
> +	state->regs = devm_platform_ioremap_resource(pdev, 0);
> +	if (IS_ERR(state->regs))
> +		return PTR_ERR(state->regs);
> +
> +	ret = mipi_csi2_clk_get(state);
> +	if (ret < 0)
> +		return ret;
> +
> +	/* Initialize and register the subdev. */
> +	ret = mipi_csi2_subdev_init(state);
> +	if (ret < 0)
> +		goto disable_clock;
> +
> +	platform_set_drvdata(pdev, &state->sd);
> +
> +	ret = mipi_csi2_async_register(state);
> +	if (ret < 0) {
> +		dev_err(dev, "async register failed: %d\n", ret);
> +		goto cleanup;
> +	}
> +
> +	ret = init_icc(pdev);
> +	if (ret)
> +		goto cleanup;
> +
> +	/* Enable runtime PM. */
> +	pm_runtime_enable(dev);
> +	if (!pm_runtime_enabled(dev)) {
> +		ret = mipi_csi2_pm_resume(dev, true);
> +		if (ret < 0)
> +			goto cleanup;
> +	}
> +
> +	dev_info(dev, "lanes: %d\n", state->bus.num_data_lanes);
> +
> +	return 0;
> +
> +cleanup:
> +	media_entity_cleanup(&state->sd.entity);
> +	v4l2_async_notifier_unregister(&state->notifier);
> +	v4l2_async_notifier_cleanup(&state->notifier);
> +	v4l2_async_unregister_subdev(&state->sd);
> +disable_clock:
> +	mipi_csi2_clk_disable(state);
> +	mutex_destroy(&state->lock);
> +
> +	return ret;
> +}
> +
> +static int mipi_csi2_remove(struct platform_device *pdev)
> +{
> +	struct v4l2_subdev *sd = platform_get_drvdata(pdev);
> +	struct csi_state *state = mipi_sd_to_csi2_state(sd);
> +
> +	v4l2_async_notifier_unregister(&state->notifier);
> +	v4l2_async_notifier_cleanup(&state->notifier);
> +	v4l2_async_unregister_subdev(&state->sd);
> +
> +	pm_runtime_disable(&pdev->dev);
> +	mipi_csi2_pm_suspend(&pdev->dev, true);
> +	mipi_csi2_clk_disable(state);
> +	media_entity_cleanup(&state->sd.entity);
> +	mutex_destroy(&state->lock);
> +	pm_runtime_set_suspended(&pdev->dev);
> +	icc_put(state->icc_path);
> +
> +	return 0;
> +}
> +
> +static const struct of_device_id mipi_csi2_of_match[] = {
> +	{ .compatible = "fsl,imx8mq-mipi-csi2",},
> +	{ /* sentinel */ },
> +};
> +MODULE_DEVICE_TABLE(of, mipi_csi2_of_match);
> +
> +static struct platform_driver mipi_csi2_driver = {
> +	.probe		= mipi_csi2_probe,
> +	.remove		= mipi_csi2_remove,
> +	.driver		= {
> +		.of_match_table = mipi_csi2_of_match,
> +		.name		= MIPI_CSI2_DRIVER_NAME,
> +		.pm		= &mipi_csi2_pm_ops,
> +	},
> +};
> +
> +module_platform_driver(mipi_csi2_driver);
> +
> +MODULE_DESCRIPTION("i.MX8MQ MIPI CSI-2 receiver driver");
> +MODULE_LICENSE("GPL v2");
> +MODULE_ALIAS("platform:imx8mq-mipi-csi2");
> -- 
> 2.30.2
> 
