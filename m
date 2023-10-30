Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 866317DB538
	for <lists+linux-media@lfdr.de>; Mon, 30 Oct 2023 09:36:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231789AbjJ3IgH (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 30 Oct 2023 04:36:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54666 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230147AbjJ3IgF (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 30 Oct 2023 04:36:05 -0400
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6E45DB6
        for <linux-media@vger.kernel.org>; Mon, 30 Oct 2023 01:36:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1698654962; x=1730190962;
  h=subject:to:cc:references:from:message-id:date:
   mime-version:in-reply-to:content-transfer-encoding;
  bh=WFRCwDwdL2thP5rzpG/bnwwFQNpFT2q/4HJqVDTFzRA=;
  b=X6tsHTtCB/FdjNTBwM4dPXS+WcQDMg5pjRZ+CjBljE5qidT/LrwZJzQc
   /XNrg/gGbptCGjjsNWgplYERiCXlQSbEyueZARlYlQggaqtlqAX1N1EnB
   reAvXTP88kn/BD0aYzBm1qK14guDRZDpE87jE9lwyh4nWzmDm8XsXY/o3
   4ArOVPm0NCcuZ4IpSYLEikhkPt8dyV4xIZBi4jOmGCUGNk5TFPFqE4K2M
   0RoeNeGTfXXK3w6+S094xNCoWTKjFnixLPG/+pAT9m0scp5pLe/uL2vB1
   mxFRf89wK6F9yQtP7AIs7ngmNk+ilT0hNZ/2aBz537sGXN2lOUFP+freo
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10878"; a="419146478"
X-IronPort-AV: E=Sophos;i="6.03,263,1694761200"; 
   d="scan'208";a="419146478"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Oct 2023 01:35:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10878"; a="933718841"
X-IronPort-AV: E=Sophos;i="6.03,263,1694761200"; 
   d="scan'208";a="933718841"
Received: from ipu5-build.bj.intel.com (HELO [10.238.232.146]) ([10.238.232.146])
  by orsmga005.jf.intel.com with ESMTP; 30 Oct 2023 01:35:12 -0700
Subject: Re: [PATCH 11/12] media: intel-cio2-bridge: Add a runtime-pm
 device-link between VCM and sensor
To:     Hans de Goede <hdegoede@redhat.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Daniel Scally <dan.scally@ideasonboard.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Andy Shevchenko <andy@kernel.org>, Kate Hsuan <hpa@redhat.com>,
        Bingbu Cao <bingbu.cao@intel.com>, linux-media@vger.kernel.org
References: <20230627175643.114778-1-hdegoede@redhat.com>
 <20230627175643.114778-12-hdegoede@redhat.com>
From:   Bingbu Cao <bingbu.cao@linux.intel.com>
Message-ID: <d1736dfb-e66c-2497-a71b-97f2e28f435f@linux.intel.com>
Date:   Mon, 30 Oct 2023 16:30:39 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20230627175643.114778-12-hdegoede@redhat.com>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-9.2 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hans,

On 6/28/23 1:56 AM, Hans de Goede wrote:
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
> and this avoids the need for VCM related workarounds on IPU3.
> 
> E.g. until now the dw9719 driver needed to get and control a Vsio
> (V sensor IO) regulator since that needs to be enabled to enable I2C
> pass-through on the PMIC on the sensor module. So the driver was
> controlling this regulator even though the actual dw9719 chip has no
> Vsio pin / power-plane.
> 
> This also removes the need for intel_cio2_bridge_init() to return
> -EPROBE_DEFER since the VCM is now instantiated later.
> 
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> ---
>  drivers/media/common/intel-cio2-bridge.c      | 160 +++++++++++-------
>  drivers/media/pci/intel/ipu3/ipu3-cio2-main.c |   5 +
>  drivers/media/pci/intel/ipu3/ipu3-cio2.h      |   3 +
>  include/media/intel-cio2-bridge.h             |   4 +-
>  4 files changed, 111 insertions(+), 61 deletions(-)
> 
> diff --git a/drivers/media/common/intel-cio2-bridge.c b/drivers/media/common/intel-cio2-bridge.c
> index 2f4256f9152c..997581bcc3b9 100644
> --- a/drivers/media/common/intel-cio2-bridge.c
> +++ b/drivers/media/common/intel-cio2-bridge.c
> @@ -5,7 +5,9 @@
>  #include <linux/acpi.h>
>  #include <linux/device.h>
>  #include <linux/i2c.h>
> +#include <linux/pm_runtime.h>
>  #include <linux/property.h>
> +#include <linux/workqueue.h>
>  
>  #include <media/intel-cio2-bridge.h>
>  #include <media/v4l2-fwnode.h>
> @@ -189,30 +191,111 @@ static void cio2_bridge_create_connection_swnodes(
>  	cio2_bridge_init_swnode_group(sensor);
>  }
>  
> -static void cio2_bridge_instantiate_vcm_i2c_client(
> -	struct intel_cio2_sensor *sensor)
> -{
> -	struct i2c_board_info board_info = { };
> +/*
> + * The actual instantiation must be done from a workqueue to avoid
> + * a deadlock on taking list_lock from v4l2-async twice.
> + */
> +struct intel_cio2_bridge_instantiate_vcm_work_data {
> +	struct work_struct work;
> +	struct device *sensor;
>  	char name[16];
> +	struct i2c_board_info board_info;
> +};
>  
> -	if (!sensor->vcm_type)
> -		return;
> +static void intel_cio2_bridge_instantiate_vcm_work(struct work_struct *_work)
> +{
> +	struct intel_cio2_bridge_instantiate_vcm_work_data *work =
> +		container_of(_work,
> +			     struct intel_cio2_bridge_instantiate_vcm_work_data,
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
>  	}

One question here: how do we make sure that the runtime PM of the sensor
is enabled during the .bound callback? Or is it a mandatory requirement
of driver of such camera sensors?

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
>  }
>  
> +int intel_cio2_bridge_instantiate_vcm(struct device *sensor)
> +{
> +	struct intel_cio2_bridge_instantiate_vcm_work_data *work;
> +	struct acpi_device *adev = ACPI_COMPANION(sensor);
> +	struct fwnode_handle *vcm_fwnode;
> +	struct i2c_client *vcm_client;
> +	char *sep;
> +
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
> +	INIT_WORK(&work->work, intel_cio2_bridge_instantiate_vcm_work);
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
> +
> +	queue_work(system_long_wq, &work->work);
> +
> +	return 0;
> +}
> +EXPORT_SYMBOL(intel_cio2_bridge_instantiate_vcm);
> +
>  static void cio2_bridge_unregister_sensors(struct intel_cio2_bridge *bridge)
>  {
>  	struct intel_cio2_sensor *sensor;
> @@ -222,7 +305,6 @@ static void cio2_bridge_unregister_sensors(struct intel_cio2_bridge *bridge)
>  		sensor = &bridge->sensors[i];
>  		software_node_unregister_node_group(sensor->group);
>  		acpi_dev_put(sensor->adev);
> -		i2c_unregister_device(sensor->vcm_i2c_client);
>  	}
>  }
>  
> @@ -273,8 +355,6 @@ static int cio2_bridge_connect_sensor(
>  		primary = acpi_fwnode_handle(adev);
>  		primary->secondary = fwnode;
>  
> -		cio2_bridge_instantiate_vcm_i2c_client(sensor);
> -
>  		dev_info(bridge->dev, "Found supported sensor %s\n",
>  			 acpi_dev_name(adev));
>  
> @@ -311,41 +391,6 @@ static int cio2_bridge_connect_sensors(struct intel_cio2_bridge *bridge)
>  	return ret;
>  }
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
> -static int cio2_bridge_sensors_are_ready(
> -	const struct intel_cio2_sensor_config *supported_sensors)
> -{
> -	struct acpi_device *adev;
> -	bool ready = true;
> -	unsigned int i;
> -
> -	for (i = 0; supported_sensors[i].hid; i++) {
> -		const struct intel_cio2_sensor_config *cfg =
> -			&supported_sensors[i];
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
>  int intel_cio2_bridge_init(
>  	struct device *dev,
>  	int (*parse_sensor_fwnode)(struct acpi_device *adev,
> @@ -358,9 +403,6 @@ int intel_cio2_bridge_init(
>  	unsigned int i;
>  	int ret;
>  
> -	if (!cio2_bridge_sensors_are_ready(supported_sensors))
> -		return -EPROBE_DEFER;
> -
>  	bridge = kzalloc(sizeof(*bridge), GFP_KERNEL);
>  	if (!bridge)
>  		return -ENOMEM;
> diff --git a/drivers/media/pci/intel/ipu3/ipu3-cio2-main.c b/drivers/media/pci/intel/ipu3/ipu3-cio2-main.c
> index afc3255b5eb8..a22d213d66e9 100644
> --- a/drivers/media/pci/intel/ipu3/ipu3-cio2-main.c
> +++ b/drivers/media/pci/intel/ipu3/ipu3-cio2-main.c
> @@ -1386,10 +1386,15 @@ static int cio2_notifier_bound(struct v4l2_async_notifier *notifier,
>  	struct cio2_device *cio2 = to_cio2_device(notifier);
>  	struct sensor_async_subdev *s_asd = to_sensor_asd(asd);
>  	struct cio2_queue *q;
> +	int ret;
>  
>  	if (cio2->queue[s_asd->csi2.port].sensor)
>  		return -EBUSY;
>  
> +	ret = intel_cio2_bridge_instantiate_vcm(sd->dev);
> +	if (ret)
> +		return ret;
> +
>  	q = &cio2->queue[s_asd->csi2.port];
>  
>  	q->csi2 = s_asd->csi2;
> diff --git a/drivers/media/pci/intel/ipu3/ipu3-cio2.h b/drivers/media/pci/intel/ipu3/ipu3-cio2.h
> index 7ff7915f9823..208d60364f44 100644
> --- a/drivers/media/pci/intel/ipu3/ipu3-cio2.h
> +++ b/drivers/media/pci/intel/ipu3/ipu3-cio2.h
> @@ -12,6 +12,7 @@
>  
>  #include <asm/page.h>
>  
> +#include <media/intel-cio2-bridge.h>
>  #include <media/media-device.h>
>  #include <media/media-entity.h>
>  #include <media/v4l2-async.h>
> @@ -463,6 +464,8 @@ static inline struct cio2_queue *vb2q_to_cio2_queue(struct vb2_queue *vq)
>  int cio2_bridge_init(struct device *dev);
>  #else
>  static inline int cio2_bridge_init(struct device *dev) { return 0; }
> +static inline int
> +intel_cio2_bridge_instantiate_vcm(struct device *dev) { return 0; }
>  #endif
>  
>  #endif
> diff --git a/include/media/intel-cio2-bridge.h b/include/media/intel-cio2-bridge.h
> index 90fde180faef..faa60a5b1cd8 100644
> --- a/include/media/intel-cio2-bridge.h
> +++ b/include/media/intel-cio2-bridge.h
> @@ -10,7 +10,6 @@
>  #include <media/v4l2-fwnode.h>
>  
>  struct acpi_device;
> -struct i2c_client;
>  
>  #define INTEL_CIO2_HID					"INT343E"
>  #define INTEL_CIO2_MAX_LANES				4
> @@ -56,7 +55,6 @@ struct intel_cio2_sensor {
>  	/* append link(u8) in "-%u" format as suffix of HID */
>  	char name[ACPI_ID_LEN + 4];
>  	struct acpi_device *adev;
> -	struct i2c_client *vcm_i2c_client;
>  
>  	/* SWNODE_COUNT + 1 for terminating NULL */
>  	const struct software_node *group[SWNODE_COUNT + 1];
> @@ -99,6 +97,8 @@ int intel_cio2_bridge_init(
>  				   const struct intel_cio2_sensor_config *cfg),
>  	const struct intel_cio2_sensor_config *supported_sensors);
>  
> +int intel_cio2_bridge_instantiate_vcm(struct device *sensor);
> +
>  enum v4l2_fwnode_orientation
>  intel_cio2_bridge_get_orientation(struct acpi_device *adev);
>  
> 

-- 
Best regards,
Bingbu Cao
