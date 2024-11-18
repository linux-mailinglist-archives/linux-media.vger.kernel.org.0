Return-Path: <linux-media+bounces-21539-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EB189D126E
	for <lists+linux-media@lfdr.de>; Mon, 18 Nov 2024 14:48:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5FCCF28522A
	for <lists+linux-media@lfdr.de>; Mon, 18 Nov 2024 13:48:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2AAFB1A08B5;
	Mon, 18 Nov 2024 13:46:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="NArle4Q+"
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6579D19F42D
	for <linux-media@vger.kernel.org>; Mon, 18 Nov 2024 13:46:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731937583; cv=none; b=rd0BxVLcGPiOJcslq12xa+KVPRekKvdOW+zbnn4xyZO/ieAuaLfstYJehZcWqBeaVksQEs9EzgOUeDmfUWnGuTs/eGqauY51lKXGKQ3+OH+vks0QnrGqgdgD/1JdxNwZ04rsXlhFq2k3NDyDyISFHQ01TZIIZEpyadBpmELX/l0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731937583; c=relaxed/simple;
	bh=GxVrwZfFpDuQIIZLcpdosSJ1UNkV5LF++RPRF7SCrqM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=oWPycmjKqUD/q6ZC0oF8pVjwZsc9dyuLtXh7w515tAX/iE+MGFbCwaUoxNFz0Ku1xGmqd+uxNGUoTMa6zr5/90KDNQc0D+IEQgVFAYmMQbNVM5w6yYLSBuvr5DwWm60IOcD/G+LzlP7fdLZ4/QIORcTZXl5TbIOXZLnTsNekgH8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=NArle4Q+; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1731937580;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=OvAoDtmrfq/Vy5twjl/brnF7tQdLECbbdJmDLc03Iec=;
	b=NArle4Q++A7OTCF5kYfToAcrXObDQTNGuY2Vxwto419nym6IgxIwcKNQRd5wLMdDS0ZUpR
	jn6VgKM56uVpoHR4TR0HiJqHqPFYx5XE7T9w1/e7lYVvxA1+1D8X4YeNxXC+FjBqNWyA8H
	Eo0nGDIKStz9ZWcW4KWrrv3o7Qrezw4=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-662-tmapCZYsPUqE9RE4giZ7Ng-1; Mon, 18 Nov 2024 08:46:19 -0500
X-MC-Unique: tmapCZYsPUqE9RE4giZ7Ng-1
X-Mimecast-MFC-AGG-ID: tmapCZYsPUqE9RE4giZ7Ng
Received: by mail-ej1-f72.google.com with SMTP id a640c23a62f3a-a9a0c259715so75145766b.0
        for <linux-media@vger.kernel.org>; Mon, 18 Nov 2024 05:46:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731937578; x=1732542378;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=OvAoDtmrfq/Vy5twjl/brnF7tQdLECbbdJmDLc03Iec=;
        b=a0nbgWpH9dNxTIdseELYkV/bEpTcmi1Qqj4t21XjoFmkz/URp4awJyExI/uy1bMEOV
         OcQSRLgPsdBMBnGi31XvWcf5oerI878ZHK+9iJLmtCCBSwPSfOwaQny7JD8DWetc5FoV
         5WnPxMus5VJVwyjBCcAaTHLA9mZLTsUz1H7dPVmL9gsUOYVZh85NDZ+0HVUY94IJFJ4L
         wuAkI7gF07qgL4um6VxtV+TtrAjTJqH50BNxdvrOmCftYw8RuzWQDxDDLR6M4fmYkjSa
         2+JThwop8yO2QNR0pGvlxVCAOmJ8t5iRZiAAg2KMCEDGmqdv5tynvngiYg7Wy9uMBakm
         5WKw==
X-Gm-Message-State: AOJu0YyCrW1i49mA2x3M8gTL0h7OHrhq7+IO/1tWsVFzFnf/Sz3Vqgxl
	JuQCuqGmerO9GIwhyVugtxcKlN/OQJ1VbUTeH6RCSjsU+JhlJV3ocdlmccGY/cGB/6rxEbKX9hB
	gF9jSFT7FvsfA/fZ3anNJLuBir2HPZj0dpaoWBh+bp0KW2TNTWHY1NojXt1uM
X-Received: by 2002:a17:907:3f15:b0:aa2:be2:f21e with SMTP id a640c23a62f3a-aa4834138efmr1171353166b.24.1731937577830;
        Mon, 18 Nov 2024 05:46:17 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFlwxV/QOGuaU7RJAVsVFB3aCI4Mp5mNASzAcO2+dyyrrI6/VwBVpdz/ZkHqvLCg+z752SY8w==
X-Received: by 2002:a17:907:3f15:b0:aa2:be2:f21e with SMTP id a640c23a62f3a-aa4834138efmr1171351566b.24.1731937577442;
        Mon, 18 Nov 2024 05:46:17 -0800 (PST)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa20df26acasm551961966b.21.2024.11.18.05.46.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 18 Nov 2024 05:46:17 -0800 (PST)
Message-ID: <5c89b3ad-58d7-4100-998c-19f646306c93@redhat.com>
Date: Mon, 18 Nov 2024 14:46:16 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] media: i2c: Add Omnivision OCV02C10 sensor driver
To: Heimir Thor Sverrisson <heimir.sverrisson@gmail.com>,
 sakari.ailus@linux.intel.com, hao.yao@intel.com, mchehab@kernel.org
Cc: linux-media@vger.kernel.org, joachim.reichel@posteo.de
References: <20241116144254.23863-1-heimir.sverrisson@gmail.com>
Content-Language: en-US, nl
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20241116144254.23863-1-heimir.sverrisson@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Heimir,

On 16-Nov-24 3:42 PM, Heimir Thor Sverrisson wrote:
> Add a new driver for the Omnivision OCV02C10 camera sensor. This is based

I'm not sure where the "C" in OCV above and in the Subject (first
line of commit message) come from. Please do:

s/OCV02C10/OV02C10/ on the commit message.

> on the out of tree driver by Hao Yao <hao.yao@intel.com> from:
> https://github.com/intel/ipu6-drivers/blob/master/drivers/media/i2c/ov02c10.c
> 
> This has been tested on a Dell XPS 9440 together with the IPU6 isys CSI
> driver and the libcamera software ISP code.
> 
> Tested-by: Heimir Thor Sverrisson <heimir.sverrisson@gmail.com>
> Signed-off-by: Heimir Thor Sverrisson <heimir.sverrisson@gmail.com>
> ---
>  drivers/media/i2c/Kconfig   |   10 +
>  drivers/media/i2c/Makefile  |    1 +
>  drivers/media/i2c/ov02c10.c | 1393 +++++++++++++++++++++++++++++++++++
>  3 files changed, 1404 insertions(+)
>  create mode 100644 drivers/media/i2c/ov02c10.c

<snip>

> diff --git a/drivers/media/i2c/ov02c10.c b/drivers/media/i2c/ov02c10.c
> new file mode 100644
> index 000000000000..86ae15b8475e
> --- /dev/null
> +++ b/drivers/media/i2c/ov02c10.c
> @@ -0,0 +1,1393 @@

<snip>

> +static int ov02c10_read_mipi_lanes(struct ov02c10 *ov02c10, struct device *dev)
> +{
> +	struct i2c_client *client = v4l2_get_subdevdata(&ov02c10->sd);
> +	struct v4l2_fwnode_endpoint bus_cfg = {
> +		.bus_type = V4L2_MBUS_CSI2_DPHY
> +	};
> +	struct fwnode_handle *ep;
> +	struct fwnode_handle *fwnode = dev_fwnode(dev);
> +

Since you are now getting the mipi-lanes from the fwnode, all
the ACPI stuff here is no longer necessary. Sorry I missed this
before when we were preparing the driver for submitting it
upstream off-list.

So you can drop everything starting here:

> +	struct acpi_buffer buffer = { ACPI_ALLOCATE_BUFFER, NULL };
> +	struct acpi_device *adev = ACPI_COMPANION(&client->dev);
> +	union acpi_object *obj;
> +	acpi_status status;
> +	int ret;
> +
> +	if (!adev) {
> +		dev_info(&client->dev, "Not ACPI device\n");
> +		return -EBADF;
> +	}
> +	status = acpi_evaluate_object(adev->handle, "SSDB", NULL, &buffer);
> +	if (ACPI_FAILURE(status)) {
> +		dev_info(&client->dev, "ACPI fail: %d\n", -ENODEV);
> +		return -EBADF;
> +	}
> +
> +	obj = buffer.pointer;
> +	if (!obj) {
> +		dev_info(&client->dev, "Couldn't locate ACPI buffer\n");
> +		return -ENOMEM;
> +	}
> +
> +	if (obj->type != ACPI_TYPE_BUFFER) {
> +		dev_info(&client->dev, "Not an ACPI buffer\n");
> +		goto out_free_buff;
> +	}

Up to here, notice buffer / obj is never used below again except
for the kfree(buffer.pointer) which of course also can be dropped.

Regards,

Hans





> +
> +	ep = fwnode_graph_get_next_endpoint(fwnode, NULL);
> +	if (!ep)
> +		return -ENXIO;
> +
> +	ret = v4l2_fwnode_endpoint_alloc_parse(ep, &bus_cfg);
> +	fwnode_handle_put(ep);
> +	if (ret)
> +		return ret;
> +
> +	if (bus_cfg.bus.mipi_csi2.num_data_lanes != 2 &&
> +	    bus_cfg.bus.mipi_csi2.num_data_lanes != 4) {
> +		dev_err(dev, "number of CSI2 data lanes %d is not supported",
> +			bus_cfg.bus.mipi_csi2.num_data_lanes);
> +		ret = -EINVAL;
> +		goto out_free_buff;
> +	}
> +	ov02c10->mipi_lanes = bus_cfg.bus.mipi_csi2.num_data_lanes;
> +	ret = 0;
> +out_free_buff:
> +	kfree(buffer.pointer);
> +	return ret;
> +}
> +
> +static int ov02c10_identify_module(struct ov02c10 *ov02c10)
> +{
> +	struct i2c_client *client = v4l2_get_subdevdata(&ov02c10->sd);
> +	u64 chip_id;
> +	u32 ret = 0;
> +
> +	ov02c10->regmap = devm_cci_regmap_init_i2c(client, 16);
> +	cci_read(ov02c10->regmap, OV02C10_REG_CHIP_ID, &chip_id, &ret);
> +	if (ret < 0)
> +		return ret;
> +
> +	if (chip_id != OV02C10_CHIP_ID) {
> +		dev_err(&client->dev, "chip id mismatch: %x!=%llx",
> +			OV02C10_CHIP_ID, chip_id);
> +		return -ENXIO;
> +	}
> +
> +	return 0;
> +}
> +
> +static int ov02c10_check_hwcfg(struct device *dev)
> +{
> +	struct v4l2_fwnode_endpoint bus_cfg = {
> +		.bus_type = V4L2_MBUS_CSI2_DPHY
> +	};
> +	struct fwnode_handle *ep;
> +	struct fwnode_handle *fwnode = dev_fwnode(dev);
> +	unsigned int i, j;
> +	int ret;
> +	u32 ext_clk;
> +
> +	if (!fwnode)
> +		return -ENXIO;
> +
> +	ep = fwnode_graph_get_next_endpoint(fwnode, NULL);
> +	if (!ep)
> +		return -EPROBE_DEFER;
> +
> +	ret = fwnode_property_read_u32(dev_fwnode(dev), "clock-frequency",
> +				       &ext_clk);
> +	if (ret) {
> +		dev_err(dev, "can't get clock frequency");
> +		return ret;
> +	}
> +
> +	ret = v4l2_fwnode_endpoint_alloc_parse(ep, &bus_cfg);
> +	fwnode_handle_put(ep);
> +	if (ret)
> +		return ret;
> +
> +	if (!bus_cfg.nr_of_link_frequencies) {
> +		dev_err(dev, "no link frequencies defined");
> +		ret = -EINVAL;
> +		goto out_err;
> +	}
> +
> +	for (i = 0; i < ARRAY_SIZE(link_freq_menu_items); i++) {
> +		for (j = 0; j < bus_cfg.nr_of_link_frequencies; j++) {
> +			if (link_freq_menu_items[i] ==
> +				bus_cfg.link_frequencies[j])
> +				break;
> +		}
> +
> +		if (j == bus_cfg.nr_of_link_frequencies) {
> +			dev_err(dev, "no link frequency %lld supported",
> +				link_freq_menu_items[i]);
> +			ret = -EINVAL;
> +			goto out_err;
> +		}
> +	}
> +
> +out_err:
> +	v4l2_fwnode_endpoint_free(&bus_cfg);
> +
> +	return ret;
> +}
> +
> +static void ov02c10_remove(struct i2c_client *client)
> +{
> +	struct v4l2_subdev *sd = i2c_get_clientdata(client);
> +	struct ov02c10 *ov02c10 = to_ov02c10(sd);
> +
> +	v4l2_async_unregister_subdev(sd);
> +	media_entity_cleanup(&sd->entity);
> +	v4l2_ctrl_handler_free(sd->ctrl_handler);
> +	pm_runtime_disable(&client->dev);
> +	mutex_destroy(&ov02c10->mutex);
> +}
> +
> +static int ov02c10_probe(struct i2c_client *client)
> +{
> +	struct ov02c10 *ov02c10;
> +	int ret = 0;
> +
> +	/* Check HW config */
> +	ret = ov02c10_check_hwcfg(&client->dev);
> +	if (ret) {
> +		dev_err(&client->dev, "failed to check hwcfg: %d", ret);
> +		return ret;
> +	}
> +
> +	ov02c10 = devm_kzalloc(&client->dev, sizeof(*ov02c10), GFP_KERNEL);
> +	if (!ov02c10)
> +		return -ENOMEM;
> +
> +	v4l2_i2c_subdev_init(&ov02c10->sd, client, &ov02c10_subdev_ops);
> +	ov02c10_get_pm_resources(&client->dev);
> +
> +	ret = ov02c10_power_on(&client->dev);
> +	if (ret) {
> +		dev_err_probe(&client->dev, ret, "failed to power on\n");
> +		return ret;
> +	}
> +
> +	ret = ov02c10_identify_module(ov02c10);
> +	if (ret) {
> +		dev_err(&client->dev, "failed to find sensor: %d", ret);
> +		goto probe_error_ret;
> +	}
> +
> +	ret = ov02c10_read_mipi_lanes(ov02c10, &client->dev);
> +	if (ret)
> +		goto probe_error_ret;
> +
> +	mutex_init(&ov02c10->mutex);
> +	ov02c10->cur_mode = &supported_modes[0];
> +	if (ov02c10->mipi_lanes == 2)
> +		ov02c10->cur_mode = &supported_modes[1];
> +	ret = ov02c10_init_controls(ov02c10);
> +	if (ret) {
> +		dev_err(&client->dev, "failed to init controls: %d", ret);
> +		goto probe_error_v4l2_ctrl_handler_free;
> +	}
> +
> +	ov02c10->sd.internal_ops = &ov02c10_internal_ops;
> +	ov02c10->sd.flags |= V4L2_SUBDEV_FL_HAS_DEVNODE;
> +	ov02c10->sd.entity.ops = &ov02c10_subdev_entity_ops;
> +	ov02c10->sd.entity.function = MEDIA_ENT_F_CAM_SENSOR;
> +	ov02c10->pad.flags = MEDIA_PAD_FL_SOURCE;
> +	ret = media_entity_pads_init(&ov02c10->sd.entity, 1, &ov02c10->pad);
> +	if (ret) {
> +		dev_err(&client->dev, "failed to init entity pads: %d", ret);
> +		goto probe_error_v4l2_ctrl_handler_free;
> +	}
> +
> +	ret = v4l2_async_register_subdev_sensor(&ov02c10->sd);
> +	if (ret < 0) {
> +		dev_err(&client->dev, "failed to register V4L2 subdev: %d",
> +			ret);
> +		goto probe_error_media_entity_cleanup;
> +	}
> +
> +	/*
> +	 * Device is already turned on by i2c-core with ACPI domain PM.
> +	 * Enable runtime PM and turn off the device.
> +	 */
> +	pm_runtime_set_active(&client->dev);
> +	pm_runtime_enable(&client->dev);
> +	pm_runtime_idle(&client->dev);
> +
> +	return 0;
> +
> +probe_error_media_entity_cleanup:
> +	media_entity_cleanup(&ov02c10->sd.entity);
> +
> +probe_error_v4l2_ctrl_handler_free:
> +	v4l2_ctrl_handler_free(ov02c10->sd.ctrl_handler);
> +	mutex_destroy(&ov02c10->mutex);
> +
> +probe_error_ret:
> +	ov02c10_power_off(&client->dev);
> +
> +	return ret;
> +}
> +
> +static const struct dev_pm_ops ov02c10_pm_ops = {
> +	SET_SYSTEM_SLEEP_PM_OPS(ov02c10_suspend, ov02c10_resume)
> +	SET_RUNTIME_PM_OPS(ov02c10_power_off, ov02c10_power_on, NULL)
> +};
> +
> +#ifdef CONFIG_ACPI
> +static const struct acpi_device_id ov02c10_acpi_ids[] = {
> +	{"OVTI02C1"},
> +	{}
> +};
> +
> +MODULE_DEVICE_TABLE(acpi, ov02c10_acpi_ids);
> +#endif
> +
> +static struct i2c_driver ov02c10_i2c_driver = {
> +	.driver = {
> +		.name = "ov02c10",
> +		.pm = &ov02c10_pm_ops,
> +		.acpi_match_table = ACPI_PTR(ov02c10_acpi_ids),
> +	},
> +	.probe = ov02c10_probe,
> +	.remove = ov02c10_remove,
> +};
> +
> +module_i2c_driver(ov02c10_i2c_driver);
> +
> +MODULE_AUTHOR("Hao Yao <hao.yao@intel.com>");
> +MODULE_DESCRIPTION("OmniVision OV02C10 sensor driver");
> +MODULE_LICENSE("GPL");


