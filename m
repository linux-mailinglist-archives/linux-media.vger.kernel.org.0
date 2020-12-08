Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5218D2D36F9
	for <lists+linux-media@lfdr.de>; Wed,  9 Dec 2020 00:36:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731777AbgLHXg1 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 8 Dec 2020 18:36:27 -0500
Received: from mga06.intel.com ([134.134.136.31]:64449 "EHLO mga06.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1731719AbgLHXg0 (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 8 Dec 2020 18:36:26 -0500
IronPort-SDR: nMJuteYfHNTv3V8A6wnKsLCJLceyuIC6Ss0yJVlGm7twjFYE4uVfXog7LIYmkBf3GEPlazdfnl
 JpWeuK7/bUsg==
X-IronPort-AV: E=McAfee;i="6000,8403,9829"; a="235587088"
X-IronPort-AV: E=Sophos;i="5.78,404,1599548400"; 
   d="scan'208";a="235587088"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Dec 2020 15:34:41 -0800
IronPort-SDR: h5bnpUi2zZitS92VDr0+o5KfWLNrRGYdOOddyybbuHgxD3WgHCqDTVmAgcvboXHf2j8tX/q13w
 EoufAQvO/V2A==
X-IronPort-AV: E=Sophos;i="5.78,404,1599548400"; 
   d="scan'208";a="375334145"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
  by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Dec 2020 15:34:38 -0800
Received: by paasikivi.fi.intel.com (Postfix, from userid 1000)
        id 81FF520867; Wed,  9 Dec 2020 01:34:36 +0200 (EET)
Date:   Wed, 9 Dec 2020 01:34:36 +0200
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Paul Kocialkowski <paul.kocialkowski@bootlin.com>
Cc:     linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Maxime Ripard <mripard@kernel.org>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [PATCH v4 2/2] media: i2c: Add support for the OV5648 image
 sensor
Message-ID: <20201208233436.GF25763@paasikivi.fi.intel.com>
References: <20201128143350.531460-1-paul.kocialkowski@bootlin.com>
 <20201128143350.531460-3-paul.kocialkowski@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201128143350.531460-3-paul.kocialkowski@bootlin.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Paul,

On Sat, Nov 28, 2020 at 03:33:50PM +0100, Paul Kocialkowski wrote:
...
> +	if (ret)
> +		goto error_ctrls;
> +
> +	/* V4L2 subdev register */
> +
> +	ret = v4l2_async_register_subdev_sensor_common(subdev);

The driver's device node may be already available to the user here...

> +	if (ret)
> +		goto error_ctrls;
> +
> +	/* Runtime PM */
> +
> +	pm_runtime_enable(sensor->dev);
> +	pm_runtime_set_suspended(sensor->dev);

but runtime PM is enabled here.

This needs to be done in a different order. Otherwise chances are that the
device node is accessed before the device is powered on.

> +
> +	return 0;
> +
> +error_ctrls:
> +	v4l2_ctrl_handler_free(&sensor->ctrls.handler);
> +
> +error_mutex:
> +	mutex_destroy(&sensor->mutex);
> +
> +error_entity:
> +	media_entity_cleanup(&sensor->subdev.entity);
> +
> +error_endpoint:
> +	v4l2_fwnode_endpoint_free(&sensor->endpoint);
> +
> +	return ret;
> +}
> +
> +static int ov5648_remove(struct i2c_client *client)
> +{
> +	struct v4l2_subdev *subdev = i2c_get_clientdata(client);
> +	struct ov5648_sensor *sensor = ov5648_subdev_sensor(subdev);
> +
> +	clk_rate_exclusive_put(sensor->xvclk);
> +
> +	v4l2_async_unregister_subdev(subdev);
> +	mutex_destroy(&sensor->mutex);
> +	media_entity_cleanup(&subdev->entity);
> +	v4l2_device_unregister_subdev(subdev);
> +	pm_runtime_disable(sensor->dev);
> +
> +	ov5648_sensor_power(sensor, false);

This needs to go, too, as there's no corresponding operation that powered
on the device.

Also don't forget to release the control handler.

I believe these apply to both of the two drivers.

-- 
Kind regards,

Sakari Ailus
