Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1F7E22A7C68
	for <lists+linux-media@lfdr.de>; Thu,  5 Nov 2020 11:56:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727836AbgKEK4S (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 5 Nov 2020 05:56:18 -0500
Received: from mail.kernel.org ([198.145.29.99]:47418 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726400AbgKEK4R (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 5 Nov 2020 05:56:17 -0500
Received: from coco.lan (ip5f5ad5d8.dynamic.kabel-deutschland.de [95.90.213.216])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 3581E206FA;
        Thu,  5 Nov 2020 10:56:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1604573776;
        bh=EoajVXvWETIAVXPUM0H860DqGTLn1P1F4unApz/SSoA=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=EoNoW6Flo8Jbjt1vmrqMttIq8+SV5inNTH/uOiY+8DFM4C9NrTulzFRTFOoacBW4f
         DJdeoCxGRYDA1fdJmpQPZMIChVVWVPnJtZJqIKTTETYc7YF0xVZhqR6bjI77l5i5qU
         IEpROfN0j1iivjyKuBO5yf+IgDvcjCwy8N4HVM4c=
Date:   Thu, 5 Nov 2020 11:56:12 +0100
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     linux-media@vger.kernel.org
Subject: Re: [PATCH v2 035/106] ccs: Read CCS static data from firmware
 binaries
Message-ID: <20201105115612.269e1543@coco.lan>
In-Reply-To: <20201007084557.25843-28-sakari.ailus@linux.intel.com>
References: <20201007084505.25761-1-sakari.ailus@linux.intel.com>
        <20201007084557.25843-1-sakari.ailus@linux.intel.com>
        <20201007084557.25843-28-sakari.ailus@linux.intel.com>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Em Wed,  7 Oct 2020 11:44:48 +0300
Sakari Ailus <sakari.ailus@linux.intel.com> escreveu:

> Read the CCS static data for sensors and modules. The files are expected
> to be found in "ccs" directory.
> 
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> ---
>  drivers/media/i2c/ccs/ccs-core.c | 30 ++++++++++++++++++++++++++++++
>  drivers/media/i2c/ccs/ccs.h      |  2 ++
>  2 files changed, 32 insertions(+)
> 
> diff --git a/drivers/media/i2c/ccs/ccs-core.c b/drivers/media/i2c/ccs/ccs-core.c
> index 34e86ddbb06a..0cc6e7423f26 100644
> --- a/drivers/media/i2c/ccs/ccs-core.c
> +++ b/drivers/media/i2c/ccs/ccs-core.c
> @@ -16,6 +16,7 @@
>  #include <linux/clk.h>
>  #include <linux/delay.h>
>  #include <linux/device.h>
> +#include <linux/firmware.h>
>  #include <linux/gpio.h>
>  #include <linux/gpio/consumer.h>
>  #include <linux/module.h>
> @@ -2947,6 +2948,8 @@ static int ccs_get_hwconfig(struct ccs_sensor *sensor, struct device *dev)
>  static int ccs_probe(struct i2c_client *client)
>  {
>  	struct ccs_sensor *sensor;
> +	const struct firmware *fw;
> +	char filename[40];
>  	unsigned int i;
>  	int rval;
>  
> @@ -3036,6 +3039,31 @@ static int ccs_probe(struct i2c_client *client)
>  		goto out_power_off;
>  	}
>  
> +	WARN_ON(snprintf(filename, sizeof(filename),
> +			 "ccs/ccs-sensor-%4.4x-%4.4x-%4.4x.fw",
> +			 sensor->minfo.sensor_mipi_manufacturer_id,
> +			 sensor->minfo.sensor_model_id,
> +			 sensor->minfo.sensor_revision_number) >=
> +		sizeof(filename));

Nitpick: better to do something like:

	int len;

	len = snprintf(filename, sizeof(filename),
			 "ccs/ccs-sensor-%4.4x-%4.4x-%4.4x.fw",
			 sensor->minfo.sensor_mipi_manufacturer_id,
			 sensor->minfo.sensor_model_id,
			 sensor->minfo.sensor_revision_number);

	if (WARN_ON(len >= sizeof(filename))
		return -ENOMEM;


> +	rval = request_firmware(&fw, filename, &client->dev);
> +	if (!rval) {
> +		ccs_data_parse(&sensor->sdata, fw->data, fw->size, &client->dev,
> +			       true);
> +		release_firmware(fw);
> +	}
> +
> +	WARN_ON(snprintf(filename, sizeof(filename),
> +			 "ccs/ccs-module-%4.4x-%4.4x-%4.4x.fw",
> +			 sensor->minfo.mipi_manufacturer_id,
> +			 sensor->minfo.model_id,
> +			 sensor->minfo.revision_number) >= sizeof(filename));

Same here.

> +	rval = request_firmware(&fw, filename, &client->dev);
> +	if (!rval) {
> +		ccs_data_parse(&sensor->mdata, fw->data, fw->size, &client->dev,
> +			       true);
> +		release_firmware(fw);
> +	}
> +
>  	rval = ccs_read_all_limits(sensor);
>  	if (rval)
>  		goto out_power_off;
> @@ -3232,6 +3260,8 @@ static int ccs_remove(struct i2c_client *client)
>  	ccs_cleanup(sensor);
>  	mutex_destroy(&sensor->mutex);
>  	kfree(sensor->ccs_limits);
> +	kvfree(sensor->sdata.backing);
> +	kvfree(sensor->mdata.backing);
>  
>  	return 0;
>  }
> diff --git a/drivers/media/i2c/ccs/ccs.h b/drivers/media/i2c/ccs/ccs.h
> index ad2ff5a74424..cbcd93b519da 100644
> --- a/drivers/media/i2c/ccs/ccs.h
> +++ b/drivers/media/i2c/ccs/ccs.h
> @@ -16,6 +16,7 @@
>  #include <media/v4l2-ctrls.h>
>  #include <media/v4l2-subdev.h>
>  
> +#include "ccs-data.h"
>  #include "ccs-quirk.h"
>  #include "ccs-regs.h"
>  #include "ccs-reg-access.h"
> @@ -227,6 +228,7 @@ struct ccs_sensor {
>  	const struct ccs_csi_data_format *internal_csi_format;
>  	u32 default_mbus_frame_fmts;
>  	int default_pixel_order;
> +	struct ccs_data_container sdata, mdata;
>  
>  	u8 binning_horizontal;
>  	u8 binning_vertical;



Thanks,
Mauro
