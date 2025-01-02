Return-Path: <linux-media+bounces-24207-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 566539FF8EB
	for <lists+linux-media@lfdr.de>; Thu,  2 Jan 2025 12:40:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 559001882874
	for <lists+linux-media@lfdr.de>; Thu,  2 Jan 2025 11:40:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AB3061AD41F;
	Thu,  2 Jan 2025 11:40:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="UVeQjOTj"
X-Original-To: linux-media@vger.kernel.org
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com [91.207.212.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6A6513FEE
	for <linux-media@vger.kernel.org>; Thu,  2 Jan 2025 11:40:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.207.212.93
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735818024; cv=none; b=UaX5ELsHYgG5bUWPXqFG5VwTZiz9oDDT7Ic3aC9odYtajCTh+T0ztTzizl5/Z5EL1m5M23CnkSSWnJ3kDqLTEkbxh/uB9WCCIFknHUwoOO0FVgyUamWe5YuYAF8vv72+vf8+z/5MoiejU9eh19NNFNV4bpvjy9pZK0DoT+TgOC0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735818024; c=relaxed/simple;
	bh=fKee3SFWsl9zfWIEM4l6aHfHDRxMXN15dFgsykQb/8A=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=tNompqnegmjcfcUgnvcOpaZLpmFGIanQ2ybgEeOeq8R5eFhgZDooEGr8DhDlFdQqG8p971O0h8POwr764NE7O2QJuFYRgwcYc5S2gpVKA4AZb7W9Iq6YoOVK5Y+GhU4ufdWJbCRqdtDOKSXmfJ+d5uUARQPoJI10RzvgInX39Tg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=UVeQjOTj; arc=none smtp.client-ip=91.207.212.93
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 502AU4Vm031199;
	Thu, 2 Jan 2025 11:53:34 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	xWdYtG/6KJo67K+CJb9mB1ALlTi0iZBZXx5kDtlz9OY=; b=UVeQjOTjkoR4AvDA
	61kOh8coiBO7XR6FAOIr0rUCbpkaRQBC/RtCRZ1ztSJLCajglrvcoQZt4n5Y4ZJq
	lDGL4QHSPf1+e3dMWcPvjigWODgFwFVyzCbBcj9ayhGViVKtqvzY9DxY2a7h8PaL
	7BJ3Gt8gN6GtfYLeyhpM97mEgW1rjS6sBGCV9s7Cq1e0MXq6pGxhjn7cTjhETx45
	R9wUUpMm8k9RjeQD4hQ5yvo2BaVe87jSenf18xQ0L9M7HoeQXSaP5fWBkJ86DXPa
	vlwpjqsz8wYVJ1H4d+pNhugiXGf225Ox0rW+iJ6ii+DVslCBSuu7OUGALCdS0JIs
	01dO/w==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 43vuwmbumn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 02 Jan 2025 11:53:33 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id D544540048;
	Thu,  2 Jan 2025 11:51:21 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 8BAD926F8C2;
	Thu,  2 Jan 2025 11:49:56 +0100 (CET)
Received: from [10.130.73.167] (10.130.73.167) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.37; Thu, 2 Jan
 2025 11:49:55 +0100
Message-ID: <8919258f-00da-4242-ac7b-27c96b3c583e@foss.st.com>
Date: Thu, 2 Jan 2025 11:49:53 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RESEND PATCH v8 9/9] media: v4l: Convert the users of
 v4l2_get_link_freq to call it on a pad
To: Sakari Ailus <sakari.ailus@linux.intel.com>, <linux-media@vger.kernel.org>
CC: Sylvain Petinot <sylvain.petinot@foss.st.com>,
        Yong Zhi
	<yong.zhi@intel.com>, Dan Scally <djrscally@gmail.com>,
        Jacopo Mondi
	<jacopo.mondi@ideasonboard.com>, <hverkuil@xs4all.nl>,
        <laurent.pinchart@ideasonboard.com>, <bingbu.cao@intel.com>,
        Tianshu Qiu
	<tian.shu.qiu@intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Rui Miguel
 Silva <rmfrfs@gmail.com>,
        Martin Kepplinger <martink@posteo.de>,
        Purism
 Kernel Team <kernel@puri.sm>, Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer
	<s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>, Robert Foss <rfoss@kernel.org>,
        Todor
 Tomov <todor.too@gmail.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
        Raspberry Pi Kernel
 Maintenance <kernel-list@raspberrypi.com>,
        Florian Fainelli
	<florian.fainelli@broadcom.com>,
        Broadcom internal kernel review list
	<bcm-kernel-feedback-list@broadcom.com>,
        Maxime Coquelin
	<mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Benoit Parrot <bparrot@ti.com>, Ricardo Ribalda <ribalda@chromium.org>,
        "Duc-Long, Le" <duclong.linux@gmail.com>
References: <20241217215445.901459-10-sakari.ailus@linux.intel.com>
 <20241219110302.954411-1-sakari.ailus@linux.intel.com>
Content-Language: en-US
From: Benjamin Mugnier <benjamin.mugnier@foss.st.com>
In-Reply-To: <20241219110302.954411-1-sakari.ailus@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: EQNCAS1NODE3.st.com (10.75.129.80) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01

Hi Sakari,

Thank you for your patch.

On 12/19/24 12:03, Sakari Ailus wrote:
> Call v4l2_get_link_freq() on a pad, instead of a control handler. This way
> we can soon convert v4l2_get_link_freq() to be callable only on a pad and
> remove the compatibility code.
> 
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>

For the st-mipid02 part :

Acked-by: Benjamin Mugnier <benjamin.mugnier@foss.st.com>

> ---
> Included driver maintainers and reviewers.
> 
> The full set is here
> <URL:https://lore.kernel.org/linux-media/20241217215445.901459-1-sakari.ailus@linux.intel.com/T/#t>.
> 
>  drivers/media/i2c/st-mipid02.c                  |  5 +++--
>  drivers/media/i2c/tc358746.c                    |  4 +++-
>  drivers/media/pci/intel/ipu3/ipu3-cio2.c        | 11 ++++++++---
>  drivers/media/platform/cadence/cdns-csi2rx.c    |  4 +++-
>  drivers/media/platform/nxp/imx-mipi-csis.c      |  5 +++--
>  drivers/media/platform/nxp/imx8mq-mipi-csi2.c   | 11 +++++++++--
>  .../media/platform/qcom/camss/camss-vfe-17x.c   |  8 +++++---
>  .../media/platform/qcom/camss/camss-vfe-gen1.c  |  8 +++++---
>  drivers/media/platform/qcom/camss/camss.c       | 17 +++++++----------
>  drivers/media/platform/qcom/camss/camss.h       |  2 +-
>  .../media/platform/raspberrypi/rp1-cfe/cfe.c    |  4 +++-
>  drivers/media/platform/st/stm32/stm32-csi.c     |  4 +++-
>  drivers/media/platform/ti/cal/cal-camerarx.c    |  3 ++-
>  drivers/media/platform/ti/cal/cal.c             |  4 +++-
>  drivers/media/platform/ti/cal/cal.h             |  1 +
>  15 files changed, 59 insertions(+), 32 deletions(-)
> 
> diff --git a/drivers/media/i2c/st-mipid02.c b/drivers/media/i2c/st-mipid02.c
> index f08db3cfe076..f4568e87f018 100644
> --- a/drivers/media/i2c/st-mipid02.c
> +++ b/drivers/media/i2c/st-mipid02.c
> @@ -301,8 +301,9 @@ static int mipid02_detect(struct mipid02_dev *bridge)
>  static int mipid02_configure_from_rx_speed(struct mipid02_dev *bridge,
>  					   struct v4l2_mbus_framefmt *fmt)
>  {
> +	struct media_pad *remote =
> +		&bridge->s_subdev->entity.pads[bridge->s_subdev_pad_id];
>  	struct i2c_client *client = bridge->i2c_client;
> -	struct v4l2_subdev *subdev = bridge->s_subdev;
>  	struct v4l2_fwnode_endpoint *ep = &bridge->rx;
>  	u32 bpp = bpp_from_code(fmt->code);
>  	/*
> @@ -312,7 +313,7 @@ static int mipid02_configure_from_rx_speed(struct mipid02_dev *bridge,
>  	u64 ui_4 = 2000000000;
>  	s64 link_freq;
>  
> -	link_freq = v4l2_get_link_freq(subdev->ctrl_handler, bpp,
> +	link_freq = v4l2_get_link_freq(remote, bpp,
>  				       2 * ep->bus.mipi_csi2.num_data_lanes);
>  	if (link_freq < 0) {
>  		dev_err(&client->dev, "Failed to get link frequency");
> diff --git a/drivers/media/i2c/tc358746.c b/drivers/media/i2c/tc358746.c
> index 389582420ba7..31586f8e4be4 100644
> --- a/drivers/media/i2c/tc358746.c
> +++ b/drivers/media/i2c/tc358746.c
> @@ -896,6 +896,7 @@ tc358746_link_validate(struct v4l2_subdev *sd, struct media_link *link,
>  	const struct tc358746_format *fmt;
>  	unsigned int fifo_sz, tmp, n;
>  	struct v4l2_subdev *source;
> +	struct media_pad *src_pad;
>  	s64 source_link_freq;
>  	int err;
>  
> @@ -910,7 +911,8 @@ tc358746_link_validate(struct v4l2_subdev *sd, struct media_link *link,
>  	fmt = tc358746_get_format_by_code(TC358746_SINK, mbusfmt->code);
>  
>  	source = media_entity_to_v4l2_subdev(link->source->entity);
> -	source_link_freq = v4l2_get_link_freq(source->ctrl_handler, 0, 0);
> +	src_pad = &source->entity.pads[source_fmt->pad];
> +	source_link_freq = v4l2_get_link_freq(src_pad, 0, 0);
>  	if (source_link_freq <= 0) {
>  		dev_err(tc358746->sd.dev,
>  			"Failed to query or invalid source link frequency\n");
> diff --git a/drivers/media/pci/intel/ipu3/ipu3-cio2.c b/drivers/media/pci/intel/ipu3/ipu3-cio2.c
> index 4e98f432ed55..7731eb70fc8e 100644
> --- a/drivers/media/pci/intel/ipu3/ipu3-cio2.c
> +++ b/drivers/media/pci/intel/ipu3/ipu3-cio2.c
> @@ -309,12 +309,17 @@ static int cio2_csi2_calc_timing(struct cio2_device *cio2, struct cio2_queue *q,
>  				 unsigned int bpp, unsigned int lanes)
>  {
>  	struct device *dev = &cio2->pci_dev->dev;
> +	struct media_pad *src_pad;
>  	s64 freq;
>  
> -	if (!q->sensor)
> -		return -ENODEV;
> +	src_pad = media_entity_remote_source_pad_unique(&q->subdev.entity);
> +	if (IS_ERR(src_pad)) {
> +		dev_err(dev, "can't get source pad of %s (%ld)\n",
> +			q->subdev.name, PTR_ERR(src_pad));
> +		return PTR_ERR(src_pad);
> +	}
>  
> -	freq = v4l2_get_link_freq(q->sensor->ctrl_handler, bpp, lanes * 2);
> +	freq = v4l2_get_link_freq(src_pad, bpp, lanes * 2);
>  	if (freq < 0) {
>  		dev_err(dev, "error %lld, invalid link_freq\n", freq);
>  		return freq;
> diff --git a/drivers/media/platform/cadence/cdns-csi2rx.c b/drivers/media/platform/cadence/cdns-csi2rx.c
> index 4d64df829e75..cebcae196eec 100644
> --- a/drivers/media/platform/cadence/cdns-csi2rx.c
> +++ b/drivers/media/platform/cadence/cdns-csi2rx.c
> @@ -164,6 +164,8 @@ static void csi2rx_reset(struct csi2rx_priv *csi2rx)
>  
>  static int csi2rx_configure_ext_dphy(struct csi2rx_priv *csi2rx)
>  {
> +	struct media_pad *src_pad =
> +		&csi2rx->source_subdev->entity.pads[csi2rx->source_pad];
>  	union phy_configure_opts opts = { };
>  	struct phy_configure_opts_mipi_dphy *cfg = &opts.mipi_dphy;
>  	struct v4l2_subdev_format sd_fmt = {
> @@ -181,7 +183,7 @@ static int csi2rx_configure_ext_dphy(struct csi2rx_priv *csi2rx)
>  
>  	fmt = csi2rx_get_fmt_by_code(sd_fmt.format.code);
>  
> -	link_freq = v4l2_get_link_freq(csi2rx->source_subdev->ctrl_handler,
> +	link_freq = v4l2_get_link_freq(src_pad,
>  				       fmt->bpp, 2 * csi2rx->num_lanes);
>  	if (link_freq < 0)
>  		return link_freq;
> diff --git a/drivers/media/platform/nxp/imx-mipi-csis.c b/drivers/media/platform/nxp/imx-mipi-csis.c
> index 29523bb84d95..d060eadebc7a 100644
> --- a/drivers/media/platform/nxp/imx-mipi-csis.c
> +++ b/drivers/media/platform/nxp/imx-mipi-csis.c
> @@ -597,12 +597,13 @@ static void __mipi_csis_set_format(struct mipi_csis_device *csis,
>  static int mipi_csis_calculate_params(struct mipi_csis_device *csis,
>  				      const struct csis_pix_format *csis_fmt)
>  {
> +	struct media_pad *src_pad =
> +		&csis->source.sd->entity.pads[csis->source.pad->index];
>  	s64 link_freq;
>  	u32 lane_rate;
>  
>  	/* Calculate the line rate from the pixel rate. */
> -	link_freq = v4l2_get_link_freq(csis->source.sd->ctrl_handler,
> -				       csis_fmt->width,
> +	link_freq = v4l2_get_link_freq(src_pad, csis_fmt->width,
>  				       csis->bus.num_data_lanes * 2);
>  	if (link_freq < 0) {
>  		dev_err(csis->dev, "Unable to obtain link frequency: %d\n",
> diff --git a/drivers/media/platform/nxp/imx8mq-mipi-csi2.c b/drivers/media/platform/nxp/imx8mq-mipi-csi2.c
> index 1f2657cf6e82..a8bcf60e2f37 100644
> --- a/drivers/media/platform/nxp/imx8mq-mipi-csi2.c
> +++ b/drivers/media/platform/nxp/imx8mq-mipi-csi2.c
> @@ -287,6 +287,7 @@ static int imx8mq_mipi_csi_calc_hs_settle(struct csi_state *state,
>  					  struct v4l2_subdev_state *sd_state,
>  					  u32 *hs_settle)
>  {
> +	struct media_pad *src_pad;
>  	s64 link_freq;
>  	u32 lane_rate;
>  	unsigned long esc_clk_rate;
> @@ -294,13 +295,19 @@ static int imx8mq_mipi_csi_calc_hs_settle(struct csi_state *state,
>  	const struct v4l2_mbus_framefmt *fmt;
>  	const struct csi2_pix_format *csi2_fmt;
>  
> +	src_pad = media_entity_remote_source_pad_unique(&sd_state->sd->entity);
> +	if (IS_ERR(src_pad)) {
> +		dev_err(state->dev, "can't get source pad of %s (%ld)\n",
> +			sd_state->sd->name, PTR_ERR(src_pad));
> +		return PTR_ERR(src_pad);
> +	}
> +
>  	/* Calculate the line rate from the pixel rate. */
>  
>  	fmt = v4l2_subdev_state_get_format(sd_state, MIPI_CSI2_PAD_SINK);
>  	csi2_fmt = find_csi2_format(fmt->code);
>  
> -	link_freq = v4l2_get_link_freq(state->src_sd->ctrl_handler,
> -				       csi2_fmt->width,
> +	link_freq = v4l2_get_link_freq(src_pad, csi2_fmt->width,
>  				       state->bus.num_data_lanes * 2);
>  	if (link_freq < 0) {
>  		dev_err(state->dev, "Unable to obtain link frequency: %d\n",
> diff --git a/drivers/media/platform/qcom/camss/camss-vfe-17x.c b/drivers/media/platform/qcom/camss/camss-vfe-17x.c
> index 380c99321030..cc93f79179dd 100644
> --- a/drivers/media/platform/qcom/camss/camss-vfe-17x.c
> +++ b/drivers/media/platform/qcom/camss/camss-vfe-17x.c
> @@ -443,16 +443,18 @@ static int vfe_enable_output(struct vfe_line *line)
>  	struct vfe_device *vfe = to_vfe(line);
>  	struct vfe_output *output = &line->output;
>  	const struct vfe_hw_ops *ops = vfe->res->hw_ops;
> -	struct media_entity *sensor;
> +	struct media_pad *sensor;
>  	unsigned long flags;
>  	unsigned int frame_skip = 0;
>  	unsigned int i;
>  
>  	sensor = camss_find_sensor(&line->subdev.entity);
>  	if (sensor) {
> -		struct v4l2_subdev *subdev = media_entity_to_v4l2_subdev(sensor);
> +		struct v4l2_subdev *subdev =
> +			media_entity_to_v4l2_subdev(sensor->entity);
>  
> -		v4l2_subdev_call(subdev, sensor, g_skip_frames, &frame_skip);
> +		v4l2_subdev_call(subdev, sensor, g_skip_frames,
> +				 &frame_skip);
>  		/* Max frame skip is 29 frames */
>  		if (frame_skip > VFE_FRAME_DROP_VAL - 1)
>  			frame_skip = VFE_FRAME_DROP_VAL - 1;
> diff --git a/drivers/media/platform/qcom/camss/camss-vfe-gen1.c b/drivers/media/platform/qcom/camss/camss-vfe-gen1.c
> index eb33c03df27e..1970f7aa6d4d 100644
> --- a/drivers/media/platform/qcom/camss/camss-vfe-gen1.c
> +++ b/drivers/media/platform/qcom/camss/camss-vfe-gen1.c
> @@ -170,7 +170,7 @@ static int vfe_enable_output(struct vfe_line *line)
>  	struct vfe_device *vfe = to_vfe(line);
>  	struct vfe_output *output = &line->output;
>  	const struct vfe_hw_ops *ops = vfe->res->hw_ops;
> -	struct media_entity *sensor;
> +	struct media_pad *sensor;
>  	unsigned long flags;
>  	unsigned int frame_skip = 0;
>  	unsigned int i;
> @@ -182,9 +182,11 @@ static int vfe_enable_output(struct vfe_line *line)
>  
>  	sensor = camss_find_sensor(&line->subdev.entity);
>  	if (sensor) {
> -		struct v4l2_subdev *subdev = media_entity_to_v4l2_subdev(sensor);
> +		struct v4l2_subdev *subdev =
> +			media_entity_to_v4l2_subdev(sensor->entity);
>  
> -		v4l2_subdev_call(subdev, sensor, g_skip_frames, &frame_skip);
> +		v4l2_subdev_call(subdev, sensor, g_skip_frames,
> +				 &frame_skip);
>  		/* Max frame skip is 29 frames */
>  		if (frame_skip > VFE_FRAME_DROP_VAL - 1)
>  			frame_skip = VFE_FRAME_DROP_VAL - 1;
> diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
> index 004a74f6b2f6..e86de4b59723 100644
> --- a/drivers/media/platform/qcom/camss/camss.c
> +++ b/drivers/media/platform/qcom/camss/camss.c
> @@ -1996,12 +1996,12 @@ void camss_disable_clocks(int nclocks, struct camss_clock *clock)
>  }
>  
>  /*
> - * camss_find_sensor - Find a linked media entity which represents a sensor
> + * camss_find_sensor - Find the media pad via which the sensor is linked
>   * @entity: Media entity to start searching from
>   *
>   * Return a pointer to sensor media entity or NULL if not found
>   */
> -struct media_entity *camss_find_sensor(struct media_entity *entity)
> +struct media_pad *camss_find_sensor(struct media_entity *entity)
>  {
>  	struct media_pad *pad;
>  
> @@ -2017,7 +2017,7 @@ struct media_entity *camss_find_sensor(struct media_entity *entity)
>  		entity = pad->entity;
>  
>  		if (entity->function == MEDIA_ENT_F_CAM_SENSOR)
> -			return entity;
> +			return pad;
>  	}
>  }
>  
> @@ -2032,16 +2032,13 @@ struct media_entity *camss_find_sensor(struct media_entity *entity)
>  s64 camss_get_link_freq(struct media_entity *entity, unsigned int bpp,
>  			unsigned int lanes)
>  {
> -	struct media_entity *sensor;
> -	struct v4l2_subdev *subdev;
> +	struct media_pad *sensor;
>  
>  	sensor = camss_find_sensor(entity);
>  	if (!sensor)
>  		return -ENODEV;
>  
> -	subdev = media_entity_to_v4l2_subdev(sensor);
> -
> -	return v4l2_get_link_freq(subdev->ctrl_handler, bpp, 2 * lanes);
> +	return v4l2_get_link_freq(sensor, bpp, 2 * lanes);
>  }
>  
>  /*
> @@ -2053,7 +2050,7 @@ s64 camss_get_link_freq(struct media_entity *entity, unsigned int bpp,
>   */
>  int camss_get_pixel_clock(struct media_entity *entity, u64 *pixel_clock)
>  {
> -	struct media_entity *sensor;
> +	struct media_pad *sensor;
>  	struct v4l2_subdev *subdev;
>  	struct v4l2_ctrl *ctrl;
>  
> @@ -2061,7 +2058,7 @@ int camss_get_pixel_clock(struct media_entity *entity, u64 *pixel_clock)
>  	if (!sensor)
>  		return -ENODEV;
>  
> -	subdev = media_entity_to_v4l2_subdev(sensor);
> +	subdev = media_entity_to_v4l2_subdev(sensor->entity);
>  
>  	ctrl = v4l2_ctrl_find(subdev->ctrl_handler, V4L2_CID_PIXEL_RATE);
>  
> diff --git a/drivers/media/platform/qcom/camss/camss.h b/drivers/media/platform/qcom/camss/camss.h
> index 9a046eea334f..6da7131c0aaa 100644
> --- a/drivers/media/platform/qcom/camss/camss.h
> +++ b/drivers/media/platform/qcom/camss/camss.h
> @@ -153,7 +153,7 @@ void camss_add_clock_margin(u64 *rate);
>  int camss_enable_clocks(int nclocks, struct camss_clock *clock,
>  			struct device *dev);
>  void camss_disable_clocks(int nclocks, struct camss_clock *clock);
> -struct media_entity *camss_find_sensor(struct media_entity *entity);
> +struct media_pad *camss_find_sensor(struct media_entity *entity);
>  s64 camss_get_link_freq(struct media_entity *entity, unsigned int bpp,
>  			unsigned int lanes);
>  int camss_get_pixel_clock(struct media_entity *entity, u64 *pixel_clock);
> diff --git a/drivers/media/platform/raspberrypi/rp1-cfe/cfe.c b/drivers/media/platform/raspberrypi/rp1-cfe/cfe.c
> index 12660087b12f..ed3d18917f2d 100644
> --- a/drivers/media/platform/raspberrypi/rp1-cfe/cfe.c
> +++ b/drivers/media/platform/raspberrypi/rp1-cfe/cfe.c
> @@ -1102,6 +1102,8 @@ static void cfe_buffer_queue(struct vb2_buffer *vb)
>  
>  static s64 cfe_get_source_link_freq(struct cfe_device *cfe)
>  {
> +	struct media_pad *src_pad =
> +		&cfe->source_sd->entity.pads[cfe->source_pad];
>  	struct v4l2_subdev_state *state;
>  	s64 link_freq;
>  	u32 bpp;
> @@ -1136,7 +1138,7 @@ static s64 cfe_get_source_link_freq(struct cfe_device *cfe)
>  		bpp = 0;
>  	}
>  
> -	link_freq = v4l2_get_link_freq(cfe->source_sd->ctrl_handler, bpp,
> +	link_freq = v4l2_get_link_freq(src_pad, bpp,
>  				       2 * cfe->csi2.dphy.active_lanes);
>  	if (link_freq < 0)
>  		cfe_err(cfe, "failed to get link freq for subdev '%s'\n",
> diff --git a/drivers/media/platform/st/stm32/stm32-csi.c b/drivers/media/platform/st/stm32/stm32-csi.c
> index 48941aae8c9b..b25afeee4f24 100644
> --- a/drivers/media/platform/st/stm32/stm32-csi.c
> +++ b/drivers/media/platform/st/stm32/stm32-csi.c
> @@ -444,6 +444,8 @@ static void stm32_csi_phy_reg_write(struct stm32_csi_dev *csidev,
>  static int stm32_csi_start(struct stm32_csi_dev *csidev,
>  			   struct v4l2_subdev_state *state)
>  {
> +	struct media_pad *src_pad =
> +		&csidev->s_subdev->entity.pads[csidev->s_subdev_pad_nb];
>  	const struct stm32_csi_mbps_phy_reg *phy_regs;
>  	struct v4l2_mbus_framefmt *sink_fmt;
>  	const struct stm32_csi_fmts *fmt;
> @@ -465,7 +467,7 @@ static int stm32_csi_start(struct stm32_csi_dev *csidev,
>  	if (!csidev->s_subdev)
>  		return -EIO;
>  
> -	link_freq = v4l2_get_link_freq(csidev->s_subdev->ctrl_handler,
> +	link_freq = v4l2_get_link_freq(src_pad,
>  				       fmt->bpp, 2 * csidev->num_lanes);
>  	if (link_freq < 0)
>  		return link_freq;
> diff --git a/drivers/media/platform/ti/cal/cal-camerarx.c b/drivers/media/platform/ti/cal/cal-camerarx.c
> index 42dfe08b765f..9cc875665695 100644
> --- a/drivers/media/platform/ti/cal/cal-camerarx.c
> +++ b/drivers/media/platform/ti/cal/cal-camerarx.c
> @@ -65,7 +65,8 @@ static s64 cal_camerarx_get_ext_link_freq(struct cal_camerarx *phy)
>  
>  	bpp = fmtinfo->bpp;
>  
> -	freq = v4l2_get_link_freq(phy->source->ctrl_handler, bpp, 2 * num_lanes);
> +	freq = v4l2_get_link_freq(&phy->source->entity.pads[phy->source_pad],
> +				  bpp, 2 * num_lanes);
>  	if (freq < 0) {
>  		phy_err(phy, "failed to get link freq for subdev '%s'\n",
>  			phy->source->name);
> diff --git a/drivers/media/platform/ti/cal/cal.c b/drivers/media/platform/ti/cal/cal.c
> index 4bd2092e0255..6cb3e5f49686 100644
> --- a/drivers/media/platform/ti/cal/cal.c
> +++ b/drivers/media/platform/ti/cal/cal.c
> @@ -798,7 +798,6 @@ static int cal_async_notifier_bound(struct v4l2_async_notifier *notifier,
>  		return 0;
>  	}
>  
> -	phy->source = subdev;
>  	phy_dbg(1, phy, "Using source %s for capture\n", subdev->name);
>  
>  	pad = media_entity_get_fwnode_pad(&subdev->entity,
> @@ -820,6 +819,9 @@ static int cal_async_notifier_bound(struct v4l2_async_notifier *notifier,
>  		return ret;
>  	}
>  
> +	phy->source = subdev;
> +	phy->source_pad = pad;
> +
>  	return 0;
>  }
>  
> diff --git a/drivers/media/platform/ti/cal/cal.h b/drivers/media/platform/ti/cal/cal.h
> index 0856297adc0b..72a246a64d9e 100644
> --- a/drivers/media/platform/ti/cal/cal.h
> +++ b/drivers/media/platform/ti/cal/cal.h
> @@ -174,6 +174,7 @@ struct cal_camerarx {
>  	struct device_node	*source_ep_node;
>  	struct device_node	*source_node;
>  	struct v4l2_subdev	*source;
> +	unsigned int		source_pad;
>  
>  	struct v4l2_subdev	subdev;
>  	struct media_pad	pads[CAL_CAMERARX_NUM_PADS];

-- 
Regards,

Benjamin

