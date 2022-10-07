Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3A6145F797A
	for <lists+linux-media@lfdr.de>; Fri,  7 Oct 2022 16:07:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229870AbiJGOHJ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 7 Oct 2022 10:07:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34168 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229582AbiJGOHH (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 7 Oct 2022 10:07:07 -0400
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com [91.207.212.93])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B0742120EC5
        for <linux-media@vger.kernel.org>; Fri,  7 Oct 2022 07:07:05 -0700 (PDT)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 2979vIpO014907;
        Fri, 7 Oct 2022 16:06:58 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=GVYQQy1+RHKDNWe7AOJIYtZo7ZBHA5nNIjFlCwaHQE0=;
 b=4iV5X5OJYx365M3DW9IBGFf55Czxw4xgdeTWmYpPdXsG57tXw7UI2Yp/Ng9uphJ5rGb3
 GpIq7SLzT6arBa1OZT6iTBNi4RYdvlAcoVQV9U0yaiybPjXdFyB+/5ilnTlcrZpNFAeA
 WJt7YAHN35MV6GVEh09+evT1t8oT27AiRLmg7SD0NJKffJSLLEwlQQYHj4RxbhGmqvWG
 JVnNTtXV7QA7X58Wk2h1ItUvU3Ls4V0bKsuXvVLAkCS5iMjKZpEVALit8XPPdd+gJHPS
 imvTKnhD1nSn+tNVZZNCrVS7CwgZ0stc13KXK9VrXheVht9DDhpgGWxtPZaQhx2RpU6P ow== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3k1fsuuxpc-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Fri, 07 Oct 2022 16:06:58 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id BB0CD100034;
        Fri,  7 Oct 2022 16:06:52 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id AB6D52309D3;
        Fri,  7 Oct 2022 16:06:52 +0200 (CEST)
Received: from [10.252.8.171] (10.75.127.121) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2375.31; Fri, 7 Oct
 2022 16:06:52 +0200
Message-ID: <d758fa87-84b8-7e95-3531-e6d7bf1c02b3@foss.st.com>
Date:   Fri, 7 Oct 2022 16:06:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v6 4/4] media: i2c: Add driver for ST VGXY61 camera sensor
Content-Language: en-US
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
CC:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        <linux-media@vger.kernel.org>, <alain.volmat@foss.st.com>,
        <hugues.fruchet@foss.st.com>, <sylvain.petinot@foss.st.com>,
        <dave.stevenson@raspberrypi.com>,
        <kieran.bingham@ideasonboard.com>, <nicolas@ndufresne.ca>,
        <hverkuil@xs4all.nl>
References: <20220927083702.14138-1-benjamin.mugnier@foss.st.com>
 <20220927083702.14138-5-benjamin.mugnier@foss.st.com>
 <Yz8pE15/9tDf6Tjy@paasikivi.fi.intel.com>
 <af876e81-9105-9a0f-4dd1-47bc17886536@foss.st.com>
 <Y0AcRntvOlouAs8+@pendragon.ideasonboard.com>
 <1ad96ce2-9d25-14e8-9475-70fa58ce7a94@foss.st.com>
 <Y0AndkhzhA7fLZC+@pendragon.ideasonboard.com>
From:   Benjamin MUGNIER <benjamin.mugnier@foss.st.com>
In-Reply-To: <Y0AndkhzhA7fLZC+@pendragon.ideasonboard.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.75.127.121]
X-ClientProxiedBy: GPXDAG2NODE4.st.com (10.75.127.68) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-10-06_05,2022-10-07_01,2022-06-22_01
X-Spam-Status: No, score=-5.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,NICE_REPLY_A,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Laurent,

On 10/7/22 15:19, Laurent Pinchart wrote:
> Hi Benjamin,
> 
> On Fri, Oct 07, 2022 at 02:38:33PM +0200, Benjamin MUGNIER wrote:
>> On 10/7/22 14:32, Laurent Pinchart wrote:
>>> On Fri, Oct 07, 2022 at 02:24:16PM +0200, Benjamin MUGNIER wrote:
>>>> Hi Sakari,
>>>>
>>>> Thank you for your review.
>>>> Please consider everything not commented as queued for v7.
>>>>
>>>> On 10/6/22 21:14, Sakari Ailus wrote:
>>>>> Hi Benjamin,
>>>>>
>>>>> Thanks for the update. A few more comments below...
>>>>>
>>>>> On Tue, Sep 27, 2022 at 10:37:02AM +0200, Benjamin Mugnier wrote:
>>>>>> +static const char * const vgxy61_hdr_mode_menu[] = {
>>>>>> +	"HDR linearize",
>>>>>> +	"HDR substraction",
>>>>>> +	"No HDR",
>>>>>> +};
>>>>>
>>>>> I think more documentation is needed on the HDR modes. What do these mean?
>>>>> For instance, are they something that requires further processing or is the
>>>>> result e.g. a ready HDR image?
>>>>>
>>>>> This should probably make it to driver specific documentation.
>>>>
>>>> Sure, in fact I did something like this in v3:
>>>> https://lore.kernel.org/linux-media/20220512074037.3829926-4-benjamin.mugnier@foss.st.com/
>>>>
>>>> Since I standardized the control I was unsure what to do with this
>>>> documentation, and dropped it.
>>>>
>>>> I will add back the
>>>> Documentation/userspace-api/media/drivers/st-vgxy61.rst file from this
>>>> commit to the patchset, while changing the control name to the new
>>>> one.
>>>
>>> The documentation there is about modes for HDR merge on the sensor side.
>>> Can the sensor also output the unmerged images, for instance
>>> line-interleaved ?
>>
>> The sensor can not output unmerged images. It can only output a single
>> image and frame merging as to be done sensor side.
> 
> I wonder then, should we have two HDR mode controls, one for sensor-side
> HDR, and one to control the interleaving of images for host-side HDR ?
> The latter would need some standardization I think, as the ISP
> configuration needs to match, so there must be some industry de-facto
> standards.
> 

I forgot to change it for this version, but Nicolas advised in v5 ircc to change the sensor side control from 'V4L2_CID_HDR_MODE' to 'V4L2_CID_HDR_SENSOR_MODE'.
I'll do it for v7. That will give space for the host side HDR control later on.

>>>>>> +
>>>>>> +static const char * const vgxy61_supply_name[] = {
>>>>>> +	"VCORE",
>>>>>> +	"VDDIO",
>>>>>> +	"VANA",
>>>>>> +};
>>>>>> +
>>>>>> +#define VGXY61_NUM_SUPPLIES		ARRAY_SIZE(vgxy61_supply_name)
>>>>>
>>>>> Please use plain ARRAY_SIZE() instead.
>>>>>
>>>>> ...
>>>>>
>>>>>> +static int vgxy61_poll_reg(struct vgxy61_dev *sensor, u32 reg, u8 poll_val,
>>>>>> +			   unsigned int timeout_ms)
>>>>>> +{
>>>>>> +	const unsigned int loop_delay_ms = 10;
>>>>>> +	int ret, timeout;
>>>>>> +
>>>>>> +	timeout = read_poll_timeout(vgxy61_read_reg, ret,
>>>>>> +				    ((ret < 0) || (ret == poll_val)),
>>>>>> +				    loop_delay_ms * 1000, timeout_ms * 1000,
>>>>>> +				    false, sensor, reg);
>>>>>> +	if (timeout)
>>>>>> +		return timeout;
>>>>>> +
>>>>>> +	return 0;
>>>>>
>>>>> "timeout" here is entirely pointless.
>>>>>
>>>>>> +}
>>>>>
>>>>> ...
>>>>>
>>>>>> +static int vgxy61_apply_exposure(struct vgxy61_dev *sensor)
>>>>>> +{
>>>>>> +	int ret = 0;
>>>>>> +
>>>>>> +	 /* We first set expo to zero to avoid forbidden parameters couple */
>>>>>> +	ret = vgxy61_write_reg(sensor, VGXY61_REG_COARSE_EXPOSURE_SHORT,
>>>>>> +			       0, &ret);
>>>>>> +	ret = vgxy61_write_reg(sensor, VGXY61_REG_COARSE_EXPOSURE_LONG,
>>>>>> +			       sensor->expo_long, &ret);
>>>>>> +	ret = vgxy61_write_reg(sensor, VGXY61_REG_COARSE_EXPOSURE_SHORT,
>>>>>> +			       sensor->expo_short, &ret);
>>>>>
>>>>> return vgxy61_write_reg(...);
>>>>>
>>>>>> +	if (ret)
>>>>>> +		return ret;
>>>>>> +
>>>>>> +	return 0;
>>>>>> +}
>>>>>
>>>>> ...
>>>>>
>>>>>> +static int vgxy61_init_controls(struct vgxy61_dev *sensor)
>>>>>> +{
>>>>>> +	const struct v4l2_ctrl_ops *ops = &vgxy61_ctrl_ops;
>>>>>> +	struct v4l2_ctrl_handler *hdl = &sensor->ctrl_handler;
>>>>>> +	const struct vgxy61_mode_info *cur_mode = sensor->current_mode;
>>>>>> +	struct v4l2_ctrl *ctrl;
>>>>>> +	int ret;
>>>>>> +
>>>>>> +	v4l2_ctrl_handler_init(hdl, 16);
>>>>>> +	/* We can use our own mutex for the ctrl lock */
>>>>>> +	hdl->lock = &sensor->lock;
>>>>>> +	v4l2_ctrl_new_std(hdl, ops, V4L2_CID_ANALOGUE_GAIN, 0, 0x1c, 1,
>>>>>> +			  sensor->analog_gain);
>>>>>> +	v4l2_ctrl_new_std(hdl, ops, V4L2_CID_DIGITAL_GAIN, 0, 0xfff, 1,
>>>>>> +			  sensor->digital_gain);
>>>>>> +	v4l2_ctrl_new_std_menu_items(hdl, ops, V4L2_CID_TEST_PATTERN,
>>>>>> +				     ARRAY_SIZE(vgxy61_test_pattern_menu) - 1,
>>>>>> +				     0, 0, vgxy61_test_pattern_menu);
>>>>>> +	ctrl = v4l2_ctrl_new_std(hdl, ops, V4L2_CID_HBLANK, 0,
>>>>>> +				 sensor->line_length, 1,
>>>>>> +				 sensor->line_length - cur_mode->width);
>>>>>> +	if (ctrl)
>>>>>> +		ctrl->flags |= V4L2_CTRL_FLAG_READ_ONLY;
>>>>>> +	ctrl = v4l2_ctrl_new_int_menu(hdl, ops, V4L2_CID_LINK_FREQ,
>>>>>> +				      ARRAY_SIZE(link_freq) - 1, 0, link_freq);
>>>>>> +	if (ctrl)
>>>>>> +		ctrl->flags |= V4L2_CTRL_FLAG_READ_ONLY;
>>>>>> +	v4l2_ctrl_new_std_menu_items(hdl, ops, V4L2_CID_HDR_MODE,
>>>>>> +				     ARRAY_SIZE(vgxy61_hdr_mode_menu) - 1, 0,
>>>>>> +				     VGXY61_NO_HDR, vgxy61_hdr_mode_menu);
>>>>>> +
>>>>>> +	/*
>>>>>> +	 * Keep a pointer to these controls as we need to update them when
>>>>>> +	 * setting the format
>>>>>> +	 */
>>>>>> +	sensor->pixel_rate_ctrl = v4l2_ctrl_new_std(hdl, ops,
>>>>>> +						    V4L2_CID_PIXEL_RATE, 1,
>>>>>> +						    INT_MAX, 1,
>>>>>> +						    get_pixel_rate(sensor));
>>>>>> +	sensor->pixel_rate_ctrl->flags |= V4L2_CTRL_FLAG_READ_ONLY;
>>>>>
>>>>> Also sensor->pixel_rate_ctrl may be NULL here.
>>>>>
>>>>>> +	sensor->expo_ctrl = v4l2_ctrl_new_std(hdl, ops, V4L2_CID_EXPOSURE,
>>>>>> +					      sensor->expo_min,
>>>>>> +					      sensor->expo_max, 1,
>>>>>> +					      sensor->expo_long);
>>>>>> +	sensor->vblank_ctrl = v4l2_ctrl_new_std(hdl, ops, V4L2_CID_VBLANK,
>>>>>> +						sensor->vblank_min,
>>>>>> +						0xffff - cur_mode->crop.height,
>>>>>> +						1, sensor->vblank);
>>>>>> +	sensor->vflip_ctrl = v4l2_ctrl_new_std(hdl, ops, V4L2_CID_VFLIP,
>>>>>> +					       0, 1, 1, sensor->vflip);
>>>>>> +	sensor->hflip_ctrl = v4l2_ctrl_new_std(hdl, ops, V4L2_CID_HFLIP,
>>>>>> +					       0, 1, 1, sensor->hflip);
>>>>>> +
>>>>>> +	if (hdl->error) {
>>>>>> +		ret = hdl->error;
>>>>>> +		goto free_ctrls;
>>>>>> +	}
>>>>>> +
>>>>>> +	sensor->sd.ctrl_handler = hdl;
>>>>>> +	return 0;
>>>>>> +
>>>>>> +free_ctrls:
>>>>>> +	v4l2_ctrl_handler_free(hdl);
>>>>>> +	return ret;
>>>>>> +}
>>>>>
>>>>> ...
>>>>>
>>>>>> +static int vgxy61_probe(struct i2c_client *client)
>>>>>> +{
>>>>>> +	struct device *dev = &client->dev;
>>>>>> +	struct fwnode_handle *handle;
>>>>>> +	struct vgxy61_dev *sensor;
>>>>>> +	int ret;
>>>>>> +
>>>>>> +	sensor = devm_kzalloc(dev, sizeof(*sensor), GFP_KERNEL);
>>>>>> +	if (!sensor)
>>>>>> +		return -ENOMEM;
>>>>>> +
>>>>>> +	sensor->i2c_client = client;
>>>>>> +	sensor->streaming = false;
>>>>>> +	sensor->hdr = VGXY61_NO_HDR;
>>>>>> +	sensor->expo_long = 200;
>>>>>> +	sensor->expo_short = 0;
>>>>>> +	sensor->hflip = false;
>>>>>> +	sensor->vflip = false;
>>>>>> +	sensor->analog_gain = 0;
>>>>>> +	sensor->digital_gain = 256;
>>>>>> +
>>>>>> +	handle = fwnode_graph_get_next_endpoint(of_fwnode_handle(dev->of_node),
>>>>>> +						NULL);
>>>>>
>>>>> handle = fwnode_graph_get_endpoint_by_id(dev_fwnode(dev), 0, 0, 0);
>>>>>
>>>>>> +	if (!handle) {
>>>>>> +		dev_err(dev, "handle node not found\n");
>>>>>> +		return -EINVAL;
>>>>>> +	}
>>>>>> +
>>>>>> +	ret = vgxy61_tx_from_ep(sensor, handle);
>>>>>> +	fwnode_handle_put(handle);
>>>>>> +	if (ret) {
>>>>>> +		dev_err(dev, "Failed to parse handle %d\n", ret);
>>>>>> +		return ret;
>>>>>> +	}
>>>>>> +
>>>>>> +	sensor->xclk = devm_clk_get(dev, NULL);
>>>>>> +	if (IS_ERR(sensor->xclk)) {
>>>>>> +		dev_err(dev, "failed to get xclk\n");
>>>>>> +		return PTR_ERR(sensor->xclk);
>>>>>> +	}
>>>>>> +	sensor->clk_freq = clk_get_rate(sensor->xclk);
>>>>>> +	if (sensor->clk_freq < 6 * HZ_PER_MHZ ||
>>>>>> +	    sensor->clk_freq > 27 * HZ_PER_MHZ) {
>>>>>> +		dev_err(dev, "Only 6Mhz-27Mhz clock range supported. provide %lu MHz\n",
>>>>>> +			sensor->clk_freq / HZ_PER_MHZ);
>>>>>> +		return -EINVAL;
>>>>>> +	}
>>>>>> +	sensor->gpios_polarity = of_property_read_bool(dev->of_node,
>>>>>> +						       "invert-gpios-polarity");
>>>>>
>>>>> I thought we did discuss dropping support for sensor synchronisation in
>>>>> this version?
>>>>
>>>> This properties affects strobing lights gpios polarities as you can
>>>> see in vgxy61_update_gpios_strobe_polarity. If set to '1' all strobing
>>>> gpios are inverted. This has nothing to do with the sensor
>>>> synchronization.
>>>>
>>>> Now I realize this is poorly named, and I even forgot to document it
>>>> in the device tree bindings file. I apologize.
>>>>
>>>> I would like to rename it to 'st,strobe-polarity' since this is vendor
>>>> specific and to better reflect that it affects strobing gpios.
>>>> I'll make this change for v7 and document this in the bindings file
>>>> too. Tell me if there is any issues with that.
>>>>
>>>>>> +
>>>>>> +	v4l2_i2c_subdev_init(&sensor->sd, client, &vgxy61_subdev_ops);
>>>>>> +	sensor->sd.flags |= V4L2_SUBDEV_FL_HAS_DEVNODE;
>>>>>> +	sensor->pad.flags = MEDIA_PAD_FL_SOURCE;
>>>>>> +	sensor->sd.entity.ops = &vgxy61_subdev_entity_ops;
>>>>>> +	sensor->sd.entity.function = MEDIA_ENT_F_CAM_SENSOR;
>>>>>> +
>>>>>> +	sensor->reset_gpio = devm_gpiod_get_optional(dev, "reset",
>>>>>> +						     GPIOD_OUT_HIGH);
>>>>>> +
>>>>>> +	ret = vgxy61_get_regulators(sensor);
>>>>>> +	if (ret) {
>>>>>> +		dev_err(&client->dev, "failed to get regulators %d\n", ret);
>>>>>> +		return ret;
>>>>>> +	}
>>>>>> +
>>>>>> +	ret = regulator_bulk_enable(VGXY61_NUM_SUPPLIES, sensor->supplies);
>>>>>> +	if (ret) {
>>>>>> +		dev_err(&client->dev, "failed to enable regulators %d\n", ret);
>>>>>> +		return ret;
>>>>>> +	}
>>>>>> +
>>>>>> +	ret = vgxy61_power_on(dev);
>>>>>> +	if (ret)
>>>>>> +		return ret;
>>>>>> +
>>>>>> +	ret = vgxy61_detect(sensor);
>>>>>> +	if (ret) {
>>>>>> +		dev_err(&client->dev, "sensor detect failed %d\n", ret);
>>>>>> +		return ret;
>>>>>> +	}
>>>>>> +
>>>>>> +	vgxy61_fill_sensor_param(sensor);
>>>>>> +	vgxy61_fill_framefmt(sensor, sensor->current_mode, &sensor->fmt,
>>>>>> +			     VGXY61_MEDIA_BUS_FMT_DEF);
>>>>>> +
>>>>>> +	ret = vgxy61_update_hdr(sensor, sensor->hdr);
>>>>>> +	if (ret)
>>>>>> +		return ret;
>>>>>> +
>>>>>> +	mutex_init(&sensor->lock);
>>>>>> +
>>>>>> +	ret = vgxy61_init_controls(sensor);
>>>>>> +	if (ret) {
>>>>>> +		dev_err(&client->dev, "controls initialization failed %d\n",
>>>>>> +			ret);
>>>>>> +		goto error_power_off;
>>>>>> +	}
>>>>>> +
>>>>>> +	ret = media_entity_pads_init(&sensor->sd.entity, 1, &sensor->pad);
>>>>>> +	if (ret) {
>>>>>> +		dev_err(&client->dev, "pads init failed %d\n", ret);
>>>>>> +		goto error_handler_free;
>>>>>> +	}
>>>>>> +
>>>>>> +	/* Enable runtime PM and turn off the device */
>>>>>> +	pm_runtime_set_active(dev);
>>>>>> +	pm_runtime_enable(dev);
>>>>>> +	pm_runtime_idle(dev);
>>>>>> +
>>>>>> +	ret = v4l2_async_register_subdev(&sensor->sd);
>>>>>> +	if (ret) {
>>>>>> +		dev_err(&client->dev, "async subdev register failed %d\n", ret);
>>>>>> +		goto error_pm_runtime;
>>>>>> +	}
>>>>>> +
>>>>>> +	pm_runtime_set_autosuspend_delay(&client->dev, 1000);
>>>>>> +	pm_runtime_use_autosuspend(&client->dev);
>>>>>> +
>>>>>> +	dev_dbg(&client->dev, "vgxy61 probe successfully\n");
>>>>>> +
>>>>>> +	return 0;
>>>>>> +
>>>>>> +error_pm_runtime:
>>>>>> +	pm_runtime_disable(&client->dev);
>>>>>> +	pm_runtime_set_suspended(&client->dev);
>>>>>> +	media_entity_cleanup(&sensor->sd.entity);
>>>>>> +error_handler_free:
>>>>>> +	v4l2_ctrl_handler_free(sensor->sd.ctrl_handler);
>>>>>> +	mutex_destroy(&sensor->lock);
>>>>>> +error_power_off:
>>>>>> +	vgxy61_power_off(dev);
>>>>>> +
>>>>>> +	return ret;
>>>>>> +}
>>>
> 
