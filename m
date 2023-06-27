Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4FA4474056D
	for <lists+linux-media@lfdr.de>; Tue, 27 Jun 2023 23:03:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229777AbjF0VDT (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 27 Jun 2023 17:03:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60348 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229746AbjF0VDS (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 27 Jun 2023 17:03:18 -0400
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1C38310EC
        for <linux-media@vger.kernel.org>; Tue, 27 Jun 2023 14:03:17 -0700 (PDT)
X-IronPort-AV: E=McAfee;i="6600,9927,10754"; a="364228510"
X-IronPort-AV: E=Sophos;i="6.01,163,1684825200"; 
   d="scan'208";a="364228510"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jun 2023 14:03:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10754"; a="751911316"
X-IronPort-AV: E=Sophos;i="6.01,163,1684825200"; 
   d="scan'208";a="751911316"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orsmga001.jf.intel.com with ESMTP; 27 Jun 2023 14:03:13 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
        (envelope-from <andy@kernel.org>)
        id 1qEFqC-000QKh-0h;
        Wed, 28 Jun 2023 00:03:12 +0300
Date:   Wed, 28 Jun 2023 00:03:11 +0300
From:   Andy Shevchenko <andy@kernel.org>
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Daniel Scally <dan.scally@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Kate Hsuan <hpa@redhat.com>, Hao Yao <hao.yao@intel.com>,
        Bingbu Cao <bingbu.cao@intel.com>, linux-media@vger.kernel.org
Subject: Re: [PATCH 11/12] media: intel-cio2-bridge: Add a runtime-pm
 device-link between VCM and sensor
Message-ID: <ZJtOj3q6sTkl2gw5@smile.fi.intel.com>
References: <20230627175643.114778-1-hdegoede@redhat.com>
 <20230627175643.114778-12-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230627175643.114778-12-hdegoede@redhat.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-3.5 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_SOFTFAIL,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, Jun 27, 2023 at 07:56:41PM +0200, Hans de Goede wrote:
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

...

> +struct intel_cio2_bridge_instantiate_vcm_work_data {

Hmm... A bit long name :-)

> +	struct work_struct work;
> +	struct device *sensor;
>  	char name[16];
> +	struct i2c_board_info board_info;
> +};

...

> +	if (IS_ERR(vcm_client)) {
> +		dev_err(work->sensor, "Error instantiating VCM client: %ld\n",

or even %pe

> +			PTR_ERR(vcm_client));

...

> +out:

out_put_pm: ?

> +	pm_runtime_put(work->sensor);
> +	put_device(work->sensor);
> +	if (put_fwnode)
> +		fwnode_handle_put(work->board_info.fwnode);
> +	kfree(work);

...

> +int intel_cio2_bridge_instantiate_vcm(struct device *sensor)
> +{
> +	struct intel_cio2_bridge_instantiate_vcm_work_data *work;
> +	struct acpi_device *adev = ACPI_COMPANION(sensor);
> +	struct fwnode_handle *vcm_fwnode;
> +	struct i2c_client *vcm_client;
> +	char *sep;


I would rather split assignment, so below won't look a bit puzzling.

	struct acpi_device *adev;
	...
	adev = ACPI_COMPANION(sensor);

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

-- 
With Best Regards,
Andy Shevchenko


