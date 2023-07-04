Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E36BE7474F1
	for <lists+linux-media@lfdr.de>; Tue,  4 Jul 2023 17:07:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230364AbjGDPHy (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 4 Jul 2023 11:07:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34982 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231249AbjGDPHx (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 4 Jul 2023 11:07:53 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C9E9910D5
        for <linux-media@vger.kernel.org>; Tue,  4 Jul 2023 08:07:48 -0700 (PDT)
Received: from [192.168.0.43] (cpc141996-chfd3-2-0-cust928.12-3.cable.virginm.net [86.13.91.161])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 9C849D4A;
        Tue,  4 Jul 2023 17:07:02 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1688483223;
        bh=dXbM6R8vWNTetquYJJ+piQHWcC6LDYs+4ryNPlfZfZA=;
        h=Date:To:Cc:References:From:Subject:In-Reply-To:From;
        b=bo2iAaZ3QEwE6LKyMGv8JkbWD7QeHdSPtjKnzBii2q+pfUMiTIp5qtOwL8zKY2y6S
         EzO1lyEraegBsnuufzQSzmXWmM3qBq0YqwzowmVXSvKT54d2aesEUj44xA2ou04/oD
         LwDBFjq9HCTbWi4kBGaZqxq6n2iZ3CiCVO4twd1U=
Message-ID: <24dc6ebe-0dd7-4f71-50af-c51ccb3714d5@ideasonboard.com>
Date:   Tue, 4 Jul 2023 16:07:43 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Content-Language: en-US
To:     Hans de Goede <hdegoede@redhat.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Andy Shevchenko <andy@kernel.org>, Kate Hsuan <hpa@redhat.com>,
        Hao Yao <hao.yao@intel.com>, Bingbu Cao <bingbu.cao@intel.com>,
        linux-media@vger.kernel.org
References: <20230630110643.209761-1-hdegoede@redhat.com>
 <20230630110643.209761-15-hdegoede@redhat.com>
From:   Dan Scally <dan.scally@ideasonboard.com>
Subject: Re: [PATCH v2 14/15] media: ipu-bridge: Add a runtime-pm device-link
 between VCM and sensor
In-Reply-To: <20230630110643.209761-15-hdegoede@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_PASS,
        SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Hans

On 30/06/2023 13:06, Hans de Goede wrote:
> In most cases when a VCM is used there is a single integrated module
> with the sensor + VCM + lens. This means that the sensor and VCM often
> share regulators and possibly also something like a powerdown pin.
>
> In the ACPI tables this is modelled as a single ACPI device with
> multiple I2cSerialBus resources.
>
> On atomisp devices the regulators and clks are modelled as ACPI
> power-resources, which are controlled by the (ACPI) power state
> of the sensor. So the sensor must be in D0 power state for the VCM
> to work.
>
> To make this work add a device-link with DL_FLAG_PM_RUNTIME flag
> so that the sensor will automatically be runtime-resumed whenever
> the VCM is runtime-resumed.
>
> This requires the probing of the VCM and thus the creation of the VCM
> I2C-client to be delayed till after the sensor driver has bound.
>
> Move the instantiation of the VCM I2C-client to the v4l2_async_notifier
> bound op, so that it is done after the sensor driver has bound; and
> add code to add the device-link.
>
> This fixes the problem with the shared ACPI power-resources on atomisp2
> and this avoids the need for VCM related workarounds on IPU3 / IPU6.
>
> E.g. until now the dw9719 driver needed to get and control a Vsio
> (V sensor IO) regulator since that needs to be enabled to enable I2C
> pass-through on the PMIC on the sensor module. So the driver was
> controlling this regulator even though the actual dw9719 chip has no
> Vsio pin / power-plane.
>
> This also removes the need for ipu_bridge_init() to return
> -EPROBE_DEFER since the VCM is now instantiated later.
>
> Reviewed-by: Andy Shevchenko <andy@kernel.org>
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> ---


This is a really cool way of solving the problem I think; Sakari mentioned it to me a little while 
ago, it's nice to see the implementation, thanks for doing it. Just one comment below for 
ipu_bridge_instantiate_vcm(), but:


Reviewed-by: Daniel Scally <dan.scally@ideasonboard.com>


I also tested the set on my Go and as far as I can tell everything works fine. Not really applicable 
to 13/15 since that's atomisp specific but otherwise:


Tested-by: Daniel Scally <dan.scally@ideasonboard.com>

>   drivers/media/pci/intel/ipu-bridge.c     | 159 +++++++++++++++--------
>   drivers/media/pci/intel/ipu3/ipu3-cio2.c |   5 +
>   include/media/ipu-bridge.h               |   5 +-
>   3 files changed, 109 insertions(+), 60 deletions(-)
>
> diff --git a/drivers/media/pci/intel/ipu-bridge.c b/drivers/media/pci/intel/ipu-bridge.c
> index 07a34f20af8e..32dabc16a7b4 100644
> --- a/drivers/media/pci/intel/ipu-bridge.c
> +++ b/drivers/media/pci/intel/ipu-bridge.c
> @@ -4,7 +4,9 @@
>   #include <linux/acpi.h>
>   #include <linux/device.h>
>   #include <linux/i2c.h>
> +#include <linux/pm_runtime.h>
>   #include <linux/property.h>
> +#include <linux/workqueue.h>
>   
>   #include <media/ipu-bridge.h>
>   #include <media/v4l2-fwnode.h>
> @@ -289,29 +291,112 @@ static void ipu_bridge_create_connection_swnodes(struct ipu_bridge *bridge,
>   	ipu_bridge_init_swnode_group(sensor);
>   }
>   
> -static void ipu_bridge_instantiate_vcm_i2c_client(struct ipu_sensor *sensor)
> -{
> -	struct i2c_board_info board_info = { };
> +/*
> + * The actual instantiation must be done from a workqueue to avoid
> + * a deadlock on taking list_lock from v4l2-async twice.
> + */
> +struct ipu_bridge_instantiate_vcm_work_data {
> +	struct work_struct work;
> +	struct device *sensor;
>   	char name[16];
> +	struct i2c_board_info board_info;
> +};
>   
> -	if (!sensor->vcm_type)
> -		return;
> +static void ipu_bridge_instantiate_vcm_work(struct work_struct *_work)
> +{
> +	struct ipu_bridge_instantiate_vcm_work_data *work =
> +		container_of(_work,
> +			     struct ipu_bridge_instantiate_vcm_work_data,
> +			     work);
> +	struct acpi_device *adev = ACPI_COMPANION(work->sensor);
> +	struct i2c_client *vcm_client;
> +	bool put_fwnode = true;
> +	int ret;
>   
> -	snprintf(name, sizeof(name), "%s-VCM", acpi_dev_name(sensor->adev));
> -	board_info.dev_name = name;
> -	strscpy(board_info.type, sensor->vcm_type, ARRAY_SIZE(board_info.type));
> -	board_info.swnode = &sensor->swnodes[SWNODE_VCM];
> -
> -	sensor->vcm_i2c_client =
> -		i2c_acpi_new_device_by_fwnode(acpi_fwnode_handle(sensor->adev),
> -					      1, &board_info);
> -	if (IS_ERR(sensor->vcm_i2c_client)) {
> -		dev_warn(&sensor->adev->dev, "Error instantiation VCM i2c-client: %ld\n",
> -			 PTR_ERR(sensor->vcm_i2c_client));
> -		sensor->vcm_i2c_client = NULL;
> +	/*
> +	 * The client may get probed before the device_link gets added below
> +	 * make sure the sensor is powered-up during probe.
> +	 */
> +	ret = pm_runtime_get_sync(work->sensor);
> +	if (ret < 0) {
> +		dev_err(work->sensor, "Error %d runtime-resuming sensor, cannot instantiate VCM\n",
> +			ret);
> +		goto out;
>   	}
> +
> +	/*
> +	 * Note the client is created only once and then kept around
> +	 * even after a rmmod, just like the software-nodes.
> +	 */
> +	vcm_client = i2c_acpi_new_device_by_fwnode(acpi_fwnode_handle(adev),
> +						   1, &work->board_info);
> +	if (IS_ERR(vcm_client)) {
> +		dev_err(work->sensor, "Error instantiating VCM client: %ld\n",
> +			PTR_ERR(vcm_client));
> +		goto out;
> +	}
> +
> +	device_link_add(&vcm_client->dev, work->sensor, DL_FLAG_PM_RUNTIME);
> +
> +	dev_info(work->sensor, "Instantiated %s VCM\n", work->board_info.type);
> +	put_fwnode = false; /* Ownership has passed to the i2c-client */
> +
> +out:
> +	pm_runtime_put(work->sensor);
> +	put_device(work->sensor);
> +	if (put_fwnode)
> +		fwnode_handle_put(work->board_info.fwnode);
> +	kfree(work);
>   }
>   
> +int ipu_bridge_instantiate_vcm(struct device *sensor)
> +{
> +	struct ipu_bridge_instantiate_vcm_work_data *work;
> +	struct fwnode_handle *vcm_fwnode;
> +	struct i2c_client *vcm_client;
> +	struct acpi_device *adev;
> +	char *sep;
> +
> +	adev = ACPI_COMPANION(sensor);
> +	if (!adev)
> +		return 0;
> +
> +	vcm_fwnode = fwnode_find_reference(dev_fwnode(sensor), "lens-focus", 0);
> +	if (IS_ERR(vcm_fwnode))
> +		return 0;
> +
> +	/* When reloading modules the client will already exist */
> +	vcm_client = i2c_find_device_by_fwnode(vcm_fwnode);
> +	if (vcm_client) {
> +		fwnode_handle_put(vcm_fwnode);
> +		put_device(&vcm_client->dev);
> +		return 0;
> +	}
> +
> +	work = kzalloc(sizeof(*work), GFP_KERNEL);
> +	if (!work) {
> +		fwnode_handle_put(vcm_fwnode);
> +		return -ENOMEM;
> +	}
> +
> +	INIT_WORK(&work->work, ipu_bridge_instantiate_vcm_work);
> +	work->sensor = get_device(sensor);
> +	snprintf(work->name, sizeof(work->name), "%s-VCM",
> +		 acpi_dev_name(adev));
> +	work->board_info.dev_name = work->name;
> +	work->board_info.fwnode = vcm_fwnode;
> +	strscpy(work->board_info.type, fwnode_get_name(vcm_fwnode),
> +		I2C_NAME_SIZE);
> +	/* Strip "-<link>" postfix */
> +	sep = strchrnul(work->board_info.type, '-');
> +	*sep = 0;

I think strreplace(work->board_info.type, '-', '\0') here would be cleaner, and either way probably 
we need #include <linux/string.h> for the str* funcs here


> +
> +	queue_work(system_long_wq, &work->work);
> +
> +	return 0;
> +}
> +EXPORT_SYMBOL(ipu_bridge_instantiate_vcm);
> +
>   static void ipu_bridge_unregister_sensors(struct ipu_bridge *bridge)
>   {
>   	struct ipu_sensor *sensor;
> @@ -321,7 +406,6 @@ static void ipu_bridge_unregister_sensors(struct ipu_bridge *bridge)
>   		sensor = &bridge->sensors[i];
>   		software_node_unregister_node_group(sensor->group);
>   		acpi_dev_put(sensor->adev);
> -		i2c_unregister_device(sensor->vcm_i2c_client);
>   	}
>   }
>   
> @@ -371,8 +455,6 @@ static int ipu_bridge_connect_sensor(const struct ipu_sensor_config *cfg,
>   		primary = acpi_fwnode_handle(adev);
>   		primary->secondary = fwnode;
>   
> -		ipu_bridge_instantiate_vcm_i2c_client(sensor);
> -
>   		dev_info(bridge->dev, "Found supported sensor %s\n",
>   			 acpi_dev_name(adev));
>   
> @@ -409,40 +491,6 @@ static int ipu_bridge_connect_sensors(struct ipu_bridge *bridge)
>   	return ret;
>   }
>   
> -/*
> - * The VCM cannot be probed until the PMIC is completely setup. We cannot rely
> - * on -EPROBE_DEFER for this, since the consumer<->supplier relations between
> - * the VCM and regulators/clks are not described in ACPI, instead they are
> - * passed as board-data to the PMIC drivers. Since -PROBE_DEFER does not work
> - * for the clks/regulators the VCM i2c-clients must not be instantiated until
> - * the PMIC is fully setup.
> - *
> - * The sensor/VCM ACPI device has an ACPI _DEP on the PMIC, check this using the
> - * acpi_dev_ready_for_enumeration() helper, like the i2c-core-acpi code does
> - * for the sensors.
> - */
> -static int ipu_bridge_sensors_are_ready(void)
> -{
> -	struct acpi_device *adev;
> -	bool ready = true;
> -	unsigned int i;
> -
> -	for (i = 0; i < ARRAY_SIZE(ipu_supported_sensors); i++) {
> -		const struct ipu_sensor_config *cfg =
> -			&ipu_supported_sensors[i];
> -
> -		for_each_acpi_dev_match(adev, cfg->hid, NULL, -1) {
> -			if (!adev->status.enabled)
> -				continue;
> -
> -			if (!acpi_dev_ready_for_enumeration(adev))
> -				ready = false;
> -		}
> -	}
> -
> -	return ready;
> -}
> -
>   int ipu_bridge_init(struct device *dev,
>   		    int (*parse_sensor_fwnode)(struct acpi_device *adev,
>   					       struct ipu_sensor *sensor))
> @@ -452,9 +500,6 @@ int ipu_bridge_init(struct device *dev,
>   	unsigned int i;
>   	int ret;
>   
> -	if (!ipu_bridge_sensors_are_ready())
> -		return -EPROBE_DEFER;
> -
>   	bridge = kzalloc(sizeof(*bridge), GFP_KERNEL);
>   	if (!bridge)
>   		return -ENOMEM;
> diff --git a/drivers/media/pci/intel/ipu3/ipu3-cio2.c b/drivers/media/pci/intel/ipu3/ipu3-cio2.c
> index 51a6d7cc44d2..690fc1c919af 100644
> --- a/drivers/media/pci/intel/ipu3/ipu3-cio2.c
> +++ b/drivers/media/pci/intel/ipu3/ipu3-cio2.c
> @@ -1388,10 +1388,15 @@ static int cio2_notifier_bound(struct v4l2_async_notifier *notifier,
>   	struct cio2_device *cio2 = to_cio2_device(notifier);
>   	struct sensor_async_subdev *s_asd = to_sensor_asd(asd);
>   	struct cio2_queue *q;
> +	int ret;
>   
>   	if (cio2->queue[s_asd->csi2.port].sensor)
>   		return -EBUSY;
>   
> +	ret = ipu_bridge_instantiate_vcm(sd->dev);
> +	if (ret)
> +		return ret;
> +
>   	q = &cio2->queue[s_asd->csi2.port];
>   
>   	q->csi2 = s_asd->csi2;
> diff --git a/include/media/ipu-bridge.h b/include/media/ipu-bridge.h
> index 969d8d7d6b93..31b138170c73 100644
> --- a/include/media/ipu-bridge.h
> +++ b/include/media/ipu-bridge.h
> @@ -7,8 +7,6 @@
>   #include <linux/types.h>
>   #include <media/v4l2-fwnode.h>
>   
> -struct i2c_client;
> -
>   #define IPU_HID				"INT343E"
>   #define IPU_MAX_LANES				4
>   #define IPU_MAX_PORTS				4
> @@ -117,7 +115,6 @@ struct ipu_sensor {
>   	/* append ssdb.link(u8) in "-%u" format as suffix of HID */
>   	char name[ACPI_ID_LEN + 4];
>   	struct acpi_device *adev;
> -	struct i2c_client *vcm_i2c_client;
>   
>   	/* SWNODE_COUNT + 1 for terminating NULL */
>   	const struct software_node *group[SWNODE_COUNT + 1];
> @@ -156,9 +153,11 @@ int ipu_bridge_init(struct device *dev,
>   		    int (*parse_sensor_fwnode)(struct acpi_device *adev,
>   					       struct ipu_sensor *sensor));
>   int ipu_bridge_parse_ssdb(struct acpi_device *adev, struct ipu_sensor *sensor);
> +int ipu_bridge_instantiate_vcm(struct device *sensor);
>   #else
>   /* Use a define to avoid the parse_sensor_fwnode arg getting evaluated */
>   #define ipu_bridge_init(dev, parse_sensor_fwnode)	(0)
> +static inline int ipu_bridge_instantiate_vcm(struct device *s) { return 0; }
>   #endif
>   
>   #endif
