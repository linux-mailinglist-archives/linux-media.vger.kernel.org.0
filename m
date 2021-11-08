Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4D7F7448111
	for <lists+linux-media@lfdr.de>; Mon,  8 Nov 2021 15:14:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239031AbhKHOQw (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 8 Nov 2021 09:16:52 -0500
Received: from mga14.intel.com ([192.55.52.115]:5168 "EHLO mga14.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S236213AbhKHOQv (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 8 Nov 2021 09:16:51 -0500
X-IronPort-AV: E=McAfee;i="6200,9189,10161"; a="232477503"
X-IronPort-AV: E=Sophos;i="5.87,218,1631602800"; 
   d="scan'208";a="232477503"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Nov 2021 06:13:13 -0800
X-IronPort-AV: E=Sophos;i="5.87,218,1631602800"; 
   d="scan'208";a="451535644"
Received: from smile.fi.intel.com ([10.237.72.184])
  by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Nov 2021 06:13:10 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.95)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1mk5OL-004iec-GD;
        Mon, 08 Nov 2021 16:12:57 +0200
Date:   Mon, 8 Nov 2021 16:12:57 +0200
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Daniel Scally <djrscally@gmail.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Kate Hsuan <hpa@redhat.com>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        libcamera-devel@lists.libcamera.org
Subject: Re: Fwd: Surface Go VCM type (was: Need to pass
 acpi_enforce_resources=lax on the Surface Go (version1))
Message-ID: <YYkwaY1C77BRmJat@smile.fi.intel.com>
References: <e2312277-f967-7d3f-5ce9-fbb197d35fd6@gmail.com>
 <3b61bb2d-1136-cf35-ba7a-724da9642855@gmail.com>
 <418dc16a-2a03-7604-a8e2-31c5ddfcf436@redhat.com>
 <58dabc46-211c-844d-3ed3-fd2411936d6d@gmail.com>
 <b0a6a762-3445-7c61-3510-6bd493f8e0fa@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b0a6a762-3445-7c61-3510-6bd493f8e0fa@redhat.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, Nov 08, 2021 at 02:12:38PM +0100, Hans de Goede wrote:
> On 11/2/21 00:43, Daniel Scally wrote:

> Does this sound reasonable / like I'm heading in the right direction?

It is up to you folks, since I have no time to participate in this with
a full dive right now. Below just some comments on the patches in case
they will go.

...

> -	struct acpi_device *adev = ACPI_COMPANION(dev);
> +	struct acpi_device *adev = to_acpi_device_node(fwnode);
>  	struct i2c_acpi_lookup lookup;
>  	struct i2c_adapter *adapter;
>  	LIST_HEAD(resource_list);
>  	int ret;

Make sense to move assignment here.

	adev = to_acpi_device_node(fwnode);

> +	if (!adev)
> +		return ERR_PTR(-ENODEV);

...

> +static inline struct i2c_client *i2c_acpi_new_device(struct device *dev,
> +						     int index,
> +						     struct i2c_board_info *info)
> +{
> +	return i2c_acpi_new_device_by_fwnode(dev->fwnode, index, info);

dev_fwnode(dev)

> +}

...

> +int cio2_bridge_sensors_are_ready(void)
> +{
> +	struct acpi_device *adev;

> +	bool ready = true;

Redundant. See below.

> +	unsigned int i;
> +
> +	for (i = 0; i < ARRAY_SIZE(cio2_supported_sensors); i++) {
> +		const struct cio2_sensor_config *cfg =
> +			&cio2_supported_sensors[i];
> +
> +		for_each_acpi_dev_match(adev, cfg->hid, NULL, -1) {
> +			if (!adev->status.enabled)
> +				continue;

> +			if (!acpi_dev_ready_for_enumeration(adev))
> +				ready = false;

You may put the adev here and return false.

> +		}
> +	}

> +	return ready;

So return true.

> +}

...

> +	if (sensor->ssdb.vcmtype)
> +		nodes[SWNODE_VCM] = NODE_VCM(
> +					cio2_vcm_types[sensor->ssdb.vcmtype - 1]);

Wouldn't be better

		nodes[SWNODE_VCM] =
			NODE_VCM(cio2_vcm_types[sensor->ssdb.vcmtype - 1]);

?

...

> +	sensor->vcm_i2c_client = i2c_acpi_new_device_by_fwnode(
> +					acpi_fwnode_handle(sensor->adev),
> +					1, &board_info);

Ditto.

-- 
With Best Regards,
Andy Shevchenko


