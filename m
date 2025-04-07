Return-Path: <linux-media+bounces-29471-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B555A7D90F
	for <lists+linux-media@lfdr.de>; Mon,  7 Apr 2025 11:11:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 11CAB3AD5A3
	for <lists+linux-media@lfdr.de>; Mon,  7 Apr 2025 09:09:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AAB3322F17C;
	Mon,  7 Apr 2025 09:09:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="AmSThOXL"
X-Original-To: linux-media@vger.kernel.org
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com [185.132.182.106])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2660B23AD;
	Mon,  7 Apr 2025 09:09:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.132.182.106
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744016963; cv=none; b=NkLcqiotTaf+qlPL1U08ew+Q3bTjn9w6HwmtjutEQiNJosE9fC7X8Gr4O5JR4dt7RdtGmCX9+tJUJvyBzqB3C3v4E9FwzTyJYvC9Fd77CJckv1VhuFMP2ItpFYdzt0VAEOvPrYsz6conjq9P1h8r+ncLBzw67gMzv1bdd+5u8+g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744016963; c=relaxed/simple;
	bh=dliYsE7n5323VjM9vSoaOnrWvaPOVFyyEVRVGf9LVqw=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:CC:References:
	 In-Reply-To:Content-Type; b=S7Bl1SplWGiN7RAy/S2kFUA6tWLmXiGtLXmTwSBGFDG2D6jNPbZdHBBTEyumRfjPdcnpFWUeyjSCPrCiDg7XtdLaXF/ObI22EtwqFmboskzVkKFQdFD0X6uTBkTsFTvL4rEvrfVD2rXCzxbIeqfyAOyd3jbvY+rp4YKvHtkCu/s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=AmSThOXL; arc=none smtp.client-ip=185.132.182.106
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Received: from pps.filterd (m0369458.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5377sk6W008420;
	Mon, 7 Apr 2025 11:09:10 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	yjNTI6HpbR/Krk2pbRd+sNgVSbqvShHKCwB5LTuynic=; b=AmSThOXLdL1mNC3f
	qy5xwe9b5rljXeWNuilXxT/CFlL6b93QYb84NMZJH4cZRnWdVRy/E7G5Q9WW3JBE
	dUeAtmdZEdUH0Liu5ixwyr86tnxRMaHFAApgoxERvPjx/ztnxhRkDA7jORpdPvHw
	nRAl5t0fBGbNOd4mJ75LTFVmeDOxb0O1X2o3gZVFmWHhg/PmVxG7xWR1AIX8gtUo
	t+2TL1ytxfvqHHvNx6zRIsxUkEUYtVKKBelTaG9qBKyw7y2BcKz1ODF53/DHaiJP
	zVJ4iFZ08SzhZ1IghXM+yZ4XtrG8DPwnss124cf7mIX/PBjYfMbAax0nUFjDwVIZ
	SVpdKw==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 45ue33vmeu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 07 Apr 2025 11:09:10 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id F2D8340046;
	Mon,  7 Apr 2025 11:08:15 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id A30CC94635E;
	Mon,  7 Apr 2025 11:07:42 +0200 (CEST)
Received: from [10.252.1.150] (10.252.1.150) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 7 Apr
 2025 11:07:41 +0200
Message-ID: <27a0989a-8cb6-4b21-b94b-8cec86f2c6d1@foss.st.com>
Date: Mon, 7 Apr 2025 11:07:40 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Benjamin Mugnier <benjamin.mugnier@foss.st.com>
Subject: Re: [PATCH v5 2/2] media: i2c: Add driver for ST VD55G1 camera sensor
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
CC: <conor+dt@kernel.org>, <devicetree@vger.kernel.org>, <krzk+dt@kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-media@vger.kernel.org>,
        <mchehab@kernel.org>, <robh@kernel.org>,
        <sakari.ailus@linux.intel.com>, <sylvain.petinot@foss.st.com>
References: <20250404-b4-vd55g1-v5-0-98f2f02eec59@foss.st.com>
 <20250404-b4-vd55g1-v5-2-98f2f02eec59@foss.st.com>
 <33abd6fc-9ab3-497e-b421-0816a32b8141@wanadoo.fr>
Content-Language: en-US
In-Reply-To: <33abd6fc-9ab3-497e-b421-0816a32b8141@wanadoo.fr>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-07_02,2025-04-03_03,2024-11-22_01

Hi Christophe

Thank you for your review.

On 4/4/25 18:09, Christophe JAILLET wrote:
> Le 04/04/2025 à 16:50, Benjamin Mugnier a écrit :
>> The VD55G1 is a monochrome global shutter camera with a 804x704 maximum
>> resolution with RAW8 and RAW10 bytes per pixel.
>> The driver supports :
>> - Auto exposure from the sensor, or manual exposure mode
>> - HDR subtraction mode, allowing edge detection and background removal
>> - Auto exposure cold start, using configuration values from last stream
>> to start the next one
>> - LED GPIOs for illumination
>> - Most standard camera sensor features (hblank, vblank, test patterns,
>> again, dgain, hflip, vflip, auto exposure bias, etc.)
>> Add driver source code to MAINTAINERS file.
> 
> Hi, a few nitpicks below, should they make sense.
> 
> ...
> 
>> +static int vd55g1_prepare_clock_tree(struct vd55g1 *sensor)
>> +{
>> +    struct i2c_client *client = sensor->i2c_client;
>> +    /* Double data rate */
>> +    u32 mipi_freq = sensor->link_freq * 2;
>> +    u32 sys_clk, mipi_div, pixel_div;
>> +    int ret = 0;
>> +
>> +    if (sensor->xclk_freq < 6 * HZ_PER_MHZ ||
>> +        sensor->xclk_freq > 27 * HZ_PER_MHZ) {
>> +        dev_err(&client->dev,
>> +            "Only 6Mhz-27Mhz clock range supported. Provided %lu MHz\n",
>> +            sensor->xclk_freq / HZ_PER_MHZ);
>> +        return -EINVAL;
>> +    }
>> +
>> +    if (mipi_freq < 250 * HZ_PER_MHZ ||
>> +        mipi_freq > 1200 * HZ_PER_MHZ) {
>> +        dev_err(&client->dev,
>> +            "Only 250Mhz-1200Mhz link frequency range supported.
>> Provided %lu MHz\n",
>> +            mipi_freq / HZ_PER_MHZ);
>> +        return -EINVAL;
>> +    }
>> +
>> +    if (mipi_freq <= 300 * HZ_PER_MHZ)
>> +        mipi_div = 4;
>> +    else if (mipi_freq <= 600 * HZ_PER_MHZ)
>> +        mipi_div = 2;
>> +    else
>> +        mipi_div = 1;
>> +
>> +    sys_clk = mipi_freq * mipi_div;
>> +
>> +    if (sys_clk <= 780 * HZ_PER_MHZ)
>> +        pixel_div = 5;
>> +    else if (sys_clk <= 900 * HZ_PER_MHZ)
>> +        pixel_div = 6;
>> +    else
>> +        pixel_div = 8;
>> +
>> +    sensor->pixel_clock = sys_clk / pixel_div;
>> +    /* Frequency to data rate is 1:1 ratio for MIPI */
>> +    sensor->data_rate_in_mbps = mipi_freq;
>> +
>> +    return ret;
> 
> Could be return 0, and ret could be removed.

Yes, I replaced all valid return paths by return 0.

> 
>> +}
> 
> ...
> 
>> +static int vd55g1_enable_streams(struct v4l2_subdev *sd,
>> +                 struct v4l2_subdev_state *state, u32 pad,
>> +                 u64 streams_mask)
>> +{
>> +    struct vd55g1 *sensor = to_vd55g1(sd);
>> +    struct i2c_client *client = v4l2_get_subdevdata(&sensor->sd);
>> +    int ret = 0;
> 
> Un-needed init, it is set just the line after.

I always wonder if it is worth removing the initialization if it is
redundant. I find myself spending time debugging issues happening
because I modified the flow of a function and now the return value
needs to be initialized.
You're absolutely correct in these initializations being unnecessary
though, and I removed them for v6, but I'll gladly take your thinking on
my comment :)

> 
>> +
>> +    ret = pm_runtime_resume_and_get(&client->dev);
>> +    if (ret < 0)
>> +        return ret;
>> +
>> +    vd55g1_write(sensor, VD55G1_REG_EXT_CLOCK, sensor->xclk_freq, &ret);
>> +
>> +    /* configure output */
>> +    vd55g1_write(sensor, VD55G1_REG_MIPI_DATA_RATE,
>> +             sensor->data_rate_in_mbps, &ret);
>> +    vd55g1_write(sensor, VD55G1_REG_OIF_CTRL, sensor->oif_ctrl, &ret);
>> +    vd55g1_write(sensor, VD55G1_REG_ISL_ENABLE, 0, &ret);
>> +    if (ret)
>> +        goto err_rpm_put;
>> +
>> +    ret = vd55g1_set_framefmt(sensor);
>> +    if (ret)
>> +        goto err_rpm_put;
>> +
>> +    /* Setup default GPIO values; could be overridden by V4L2 ctrl
>> setup */
>> +    ret = vd55g1_update_gpios(sensor, GENMASK(VD55G1_NB_GPIOS - 1, 0));
>> +    if (ret)
>> +        goto err_rpm_put;
>> +
>> +    ret = vd55g1_apply_cold_start(sensor);
>> +    if (ret)
>> +        goto err_rpm_put;
>> +
>> +    /* Apply settings from V4L2 ctrls */
>> +    ret = __v4l2_ctrl_handler_setup(&sensor->ctrl_handler);
>> +    if (ret)
>> +        goto err_rpm_put;
>> +
>> +    /* Also apply settings from read-only V4L2 ctrls */
>> +    ret = vd55g1_ro_ctrls_setup(sensor);
>> +    if (ret)
>> +        goto err_rpm_put;
>> +
>> +    /* Start streaming */
>> +    vd55g1_write(sensor, VD55G1_REG_STBY, VD55G1_STBY_START_STREAM,
>> &ret);
>> +    vd55g1_poll_reg(sensor, VD55G1_REG_STBY, 0, &ret);
>> +    vd55g1_wait_state(sensor, VD55G1_SYSTEM_FSM_STREAMING, &ret);
>> +    if (ret)
>> +        goto err_rpm_put;
>> +
>> +    vd55g1_lock_ctrls(sensor, true);
>> +
>> +    return ret;
> 
> return 0?
> 
>> +
>> +err_rpm_put:
>> +    pm_runtime_put(&client->dev);
>> +    return ret;
>> +}
> 
> 
> ...
> 
>> +static int vd55g1_check_csi_conf(struct vd55g1 *sensor,
>> +                 struct fwnode_handle *endpoint)
>> +{
>> +    struct i2c_client *client = sensor->i2c_client;
>> +    struct v4l2_fwnode_endpoint ep = { .bus_type =
>> V4L2_MBUS_CSI2_DPHY };
>> +    u8 n_lanes;
>> +    int ret = 0;
> 
> Un-needed init, it is set just the line after.
> 
>> +
>> +    ret = v4l2_fwnode_endpoint_alloc_parse(endpoint, &ep);
>> +    if (ret)
>> +        return -EINVAL;
>> +
>> +    /* Check lanes number */
>> +    n_lanes = ep.bus.mipi_csi2.num_data_lanes;
>> +    if (n_lanes != 1) {
>> +        dev_err(&client->dev, "Sensor only supports 1 lane, found %d\n",
>> +            n_lanes);
>> +        ret = -EINVAL;
>> +        goto done;
>> +    }
>> +
>> +    /* Clock lane must be first */
>> +    if (ep.bus.mipi_csi2.clock_lane != 0) {
>> +        dev_err(&client->dev, "Clock lane must be mapped to lane 0\n");
>> +        ret = -EINVAL;
>> +        goto done;
>> +    }
>> +
>> +    /* Handle polarities in sensor configuration */
>> +    sensor->oif_ctrl = (ep.bus.mipi_csi2.lane_polarities[0] << 3) |
>> +               (ep.bus.mipi_csi2.lane_polarities[1] << 6);
>> +
>> +    /* Check the link frequency set in device tree */
>> +    if (!ep.nr_of_link_frequencies) {
>> +        dev_err(&client->dev, "link-frequency property not found in
>> DT\n");
>> +        ret = -EINVAL;
>> +        goto done;
>> +    }
>> +    if (ep.nr_of_link_frequencies != 1) {
>> +        dev_err(&client->dev, "Multiple link frequencies not
>> supported\n");
>> +        ret = -EINVAL;
>> +        goto done;
>> +    }
>> +    sensor->link_freq = ep.link_frequencies[0];
>> +
>> +done:
>> +    v4l2_fwnode_endpoint_free(&ep);
>> +
>> +    return ret;
>> +}
> ...
> 
>> +static int vd55g1_parse_dt(struct vd55g1 *sensor)
>> +{
>> +    struct i2c_client *client = sensor->i2c_client;
>> +    struct device *dev = &client->dev;
>> +    struct fwnode_handle *endpoint;
>> +    int ret;
>> +
>> +    endpoint = fwnode_graph_get_endpoint_by_id(dev_fwnode(dev), 0, 0,
>> 0);
>> +    if (!endpoint) {
>> +        dev_err(dev, "Endpoint node not found\n");
> 
> The usage of trailing \n with dev_err() and dev_err_probe() is not
> consistant in this driver.
> 
> I would go for \n everywhere, but some people argue that it is no more
> necessary.

I prefer \n everywhere too. Added.

> 
>> +        return -EINVAL;
>> +    }
>> +
>> +    ret = vd55g1_check_csi_conf(sensor, endpoint);
>> +    fwnode_handle_put(endpoint);
>> +    if (ret)
>> +        return ret;
>> +
>> +    return vd55g1_parse_dt_gpios(sensor);
>> +}
>> +
>> +static int vd55g1_subdev_init(struct vd55g1 *sensor)
>> +{
>> +    struct i2c_client *client = sensor->i2c_client;
>> +    int ret;
>> +
>> +    /* Init sub device */
>> +    sensor->sd.flags |= V4L2_SUBDEV_FL_HAS_DEVNODE;
>> +    sensor->sd.internal_ops = &vd55g1_internal_ops;
>> +
>> +    /* Init source pad */
>> +    sensor->pad.flags = MEDIA_PAD_FL_SOURCE;
>> +    sensor->sd.entity.function = MEDIA_ENT_F_CAM_SENSOR;
>> +    ret = media_entity_pads_init(&sensor->sd.entity, 1, &sensor->pad);
>> +    if (ret) {
>> +        dev_err(&client->dev, "Failed to init media entity : %d", ret);
> 
> Unneeded space before : (to be consitant with code below)

My french betrays me. Thank you.

> 
>> +        return ret;
>> +    }
>> +
>> +    sensor->sd.state_lock = sensor->ctrl_handler.lock;
>> +    ret = v4l2_subdev_init_finalize(&sensor->sd);
>> +    if (ret) {
>> +        dev_err(&client->dev, "Subdev init error: %d", ret);
>> +        goto err_ctrls;
>> +    }
>> +
>> +    /*
>> +     * Initiliaze controls after v4l2_subdev_init_finalize() to make
>> sure
> 
> Initialize?

Nice catch.

> 
>> +     * default values are set.
>> +     */
>> +    ret = vd55g1_init_ctrls(sensor);
>> +    if (ret) {
>> +        dev_err(&client->dev, "Controls initialization failed %d", ret);
>> +        goto err_media;
>> +    }
>> +
>> +    return ret;
> 
> return 0?
> 
>> +
>> +err_ctrls:
>> +    v4l2_ctrl_handler_free(sensor->sd.ctrl_handler);
>> +
>> +err_media:
>> +    media_entity_cleanup(&sensor->sd.entity);
>> +    return ret;
>> +}
> 
> ...
> 
> CJ
> 

-- 
Regards,
Benjamin

