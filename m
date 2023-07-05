Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 60F5B74850F
	for <lists+linux-media@lfdr.de>; Wed,  5 Jul 2023 15:34:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231147AbjGENeq (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 5 Jul 2023 09:34:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42226 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229645AbjGENep (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 5 Jul 2023 09:34:45 -0400
Received: from meesny.iki.fi (meesny.iki.fi [195.140.195.201])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2D65E171B
        for <linux-media@vger.kernel.org>; Wed,  5 Jul 2023 06:34:43 -0700 (PDT)
Received: from hillosipuli.retiisi.eu (dkzdf0gkyyyyyyyyyyyyt-3.rev.dnainternet.fi [IPv6:2001:14ba:4506:4f15::1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: sailus)
        by meesny.iki.fi (Postfix) with ESMTPSA id 4Qx0y66H5PzyWs;
        Wed,  5 Jul 2023 16:34:38 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=meesny;
        t=1688564079;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=qRoCdtJKW0jrkDkC1ZNublNkd+XngAj735lnRAg9bbU=;
        b=v0bk6O4K4snmMMaIeKitkEyQOYTiCMUU6athD9tBtAg0h8QA/7MVn7bb76hsK/8O+iigdP
        xNPi/X44UUN9piwpGDghC1yBc4hSGAazb0dKu63WOMpTAZN/qp6hL45Q942+S/hwAiMkNW
        PKTqOaCTIXbMOkGADvJ9p1rE3IsHI7c=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
        s=meesny; t=1688564079;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=qRoCdtJKW0jrkDkC1ZNublNkd+XngAj735lnRAg9bbU=;
        b=ahjTDr6Jx4e5Xf+x457CphLfegVREBKjiDbun12d9CesWz4j8o+ILr9tyMOqYY2/w4G39F
        jDflswTsQduDSW//0P0YXCRFSdhrywHJdj9es75o6V/lSiFBUcCE0RZkaaXKwZrwz0Q0AZ
        hpkWa737isu2Xhog15AS75zk9N/WoFA=
ARC-Authentication-Results: i=1;
        ORIGINATING;
        auth=pass smtp.auth=sailus smtp.mailfrom=sakari.ailus@iki.fi
ARC-Seal: i=1; s=meesny; d=iki.fi; t=1688564079; a=rsa-sha256; cv=none;
        b=Ky6HN2jYaOFoMTSyHp4Q3FJEf8XK831tG3tdzn4fryKESSRc71TAlDcHoEDgdTNXCiyH1q
        8MzLOG/ZkfxzWydv7/78ro81QecibXGte05uSkdyVa4xjO5AULwfpjYhO6CaLTsRvXCObK
        kdjj90+4XaOM7AGwj6jb4GPj9XsE3xo=
Received: from valkosipuli.retiisi.eu (valkosipuli.localdomain [192.168.4.2])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by hillosipuli.retiisi.eu (Postfix) with ESMTPS id 6B5F8634C97;
        Wed,  5 Jul 2023 16:34:38 +0300 (EEST)
Date:   Wed, 5 Jul 2023 13:34:38 +0000
From:   Sakari Ailus <sakari.ailus@iki.fi>
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Andy Shevchenko <andy@kernel.org>, Kate Hsuan <hpa@redhat.com>,
        Tsuchiya Yuto <kitakar@gmail.com>,
        Yury Luneff <yury.lunev@gmail.com>,
        Nable <nable.maininbox@googlemail.com>,
        andrey.i.trufanov@gmail.com, Fabio Aiuto <fabioaiuto83@gmail.com>,
        Dan Scally <djrscally@gmail.com>, linux-media@vger.kernel.org,
        linux-staging@lists.linux.dev
Subject: Re: [PATCH v2 2/5] media: atomisp: ov2680: Turn into standard v4l2
 sensor driver
Message-ID: <ZKVxbt6F28wb8RWn@valkosipuli.retiisi.eu>
References: <20230525190100.130010-1-hdegoede@redhat.com>
 <20230525190100.130010-3-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230525190100.130010-3-hdegoede@redhat.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Hans,

Thanks for the set and sorry for the late review. I had originally thought
this was about atomisp driver itself (but was not).

On Thu, May 25, 2023 at 09:00:57PM +0200, Hans de Goede wrote:
> Turn the atomisp-ov2680 driver into a standard v4l2 sensor driver:
> 
> 1. Stop filling camera_mipi_info
> 2. Stop calling v4l2_get_acpi_sensor_info() this will be done by
>    atomisp_csi2_bridge_parse_firmware() now
> 3. Switch to v4l2 async device registration
> 
> After this change this driver no longer depends on
> atomisp_gmin_platform and all atomisp-isms are gone.
> 
> While at it, also add missing mutex_destroy() to ov2680_remove().
> 
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> ---
> Changes in v2:
> - Drop v4l2_get_acpi_sensor_info() call in this patch
> - Wait for fwnode graph endpoint so that the bridge's ACPI
>   parsing gets a chance to register the GPIO mappings
>   before probing the sensor
> - Switch to endpoint matching
> ---
>  .../media/atomisp/i2c/atomisp-ov2680.c        | 38 ++++++++-----------
>  drivers/staging/media/atomisp/i2c/ov2680.h    |  3 +-
>  .../media/atomisp/pci/atomisp_csi2_bridge.c   |  2 +
>  3 files changed, 18 insertions(+), 25 deletions(-)
> 
> diff --git a/drivers/staging/media/atomisp/i2c/atomisp-ov2680.c b/drivers/staging/media/atomisp/i2c/atomisp-ov2680.c
> index b5d93a96d588..b35ddf611e2b 100644
> --- a/drivers/staging/media/atomisp/i2c/atomisp-ov2680.c
> +++ b/drivers/staging/media/atomisp/i2c/atomisp-ov2680.c
> @@ -28,17 +28,8 @@
>  #include <media/ov_16bit_addr_reg_helpers.h>
>  #include <media/v4l2-device.h>
>  
> -#include "../include/linux/atomisp_gmin_platform.h"
> -
>  #include "ov2680.h"
>  
> -static enum atomisp_bayer_order ov2680_bayer_order_mapping[] = {
> -	atomisp_bayer_order_bggr,
> -	atomisp_bayer_order_grbg,
> -	atomisp_bayer_order_gbrg,
> -	atomisp_bayer_order_rggb,
> -};
> -
>  static int ov2680_write_reg_array(struct i2c_client *client,
>  				  const struct ov2680_reg *reglist)
>  {
> @@ -62,7 +53,6 @@ static void ov2680_set_bayer_order(struct ov2680_device *sensor, struct v4l2_mbu
>  		MEDIA_BUS_FMT_SGBRG10_1X10,
>  		MEDIA_BUS_FMT_SRGGB10_1X10,
>  	};
> -	struct camera_mipi_info *ov2680_info;
>  	int hv_flip = 0;
>  
>  	if (sensor->ctrls.vflip->val)
> @@ -72,11 +62,6 @@ static void ov2680_set_bayer_order(struct ov2680_device *sensor, struct v4l2_mbu
>  		hv_flip += 2;
>  
>  	fmt->code = ov2680_hv_flip_bayer_order[hv_flip];
> -
> -	/* TODO atomisp specific custom API, should be removed */
> -	ov2680_info = v4l2_get_subdev_hostdata(&sensor->sd);
> -	if (ov2680_info)
> -		ov2680_info->raw_bayer_order = ov2680_bayer_order_mapping[hv_flip];
>  }
>  
>  static int ov2680_set_vflip(struct ov2680_device *sensor, s32 val)
> @@ -609,10 +594,11 @@ static void ov2680_remove(struct i2c_client *client)
>  
>  	dev_dbg(&client->dev, "ov2680_remove...\n");
>  
> -	atomisp_unregister_subdev(sd);
> -	v4l2_device_unregister_subdev(sd);
> +	v4l2_async_unregister_subdev(&sensor->sd);
>  	media_entity_cleanup(&sensor->sd.entity);
>  	v4l2_ctrl_handler_free(&sensor->ctrls.handler);
> +	mutex_destroy(&sensor->input_lock);
> +	fwnode_handle_put(sensor->ep_fwnode);
>  	pm_runtime_disable(&client->dev);
>  }
>  
> @@ -631,13 +617,19 @@ static int ov2680_probe(struct i2c_client *client)
>  	sensor->client = client;
>  	v4l2_i2c_subdev_init(&sensor->sd, client, &ov2680_ops);
>  
> -	ret = v4l2_get_acpi_sensor_info(dev, NULL);
> -	if (ret)
> -		return ret;
> +	/*
> +	 * Sometimes the fwnode graph is initialized by the bridge driver.
> +	 * Bridge drivers doing this may also add GPIO mappings, wait for this.
> +	 */
> +	sensor->ep_fwnode = fwnode_graph_get_next_endpoint(dev_fwnode(dev), NULL);
> +	if (!sensor->ep_fwnode)
> +		return dev_err_probe(dev, -EPROBE_DEFER, "waiting for fwnode graph endpoint\n");
>  
>  	sensor->powerdown = devm_gpiod_get_optional(dev, "powerdown", GPIOD_OUT_HIGH);
> -	if (IS_ERR(sensor->powerdown))
> +	if (IS_ERR(sensor->powerdown)) {
> +		fwnode_handle_put(sensor->ep_fwnode);
>  		return dev_err_probe(dev, PTR_ERR(sensor->powerdown), "getting powerdown GPIO\n");
> +	}
>  
>  	pm_runtime_set_suspended(dev);
>  	pm_runtime_enable(dev);
> @@ -653,6 +645,7 @@ static int ov2680_probe(struct i2c_client *client)
>  	sensor->sd.flags |= V4L2_SUBDEV_FL_HAS_DEVNODE;
>  	sensor->pad.flags = MEDIA_PAD_FL_SOURCE;
>  	sensor->sd.entity.function = MEDIA_ENT_F_CAM_SENSOR;
> +	sensor->sd.fwnode = sensor->ep_fwnode;

You can drop this change: when
<URL:https://lore.kernel.org/linux-media/20230622114028.908825-1-sakari.ailus@linux.intel.com/T/#t>
gets merged (for 6.6 presumably), the async sub-devices should register the
device fwnode. Right now it works with device node albeit a warning
remains.

>  
>  	ret = ov2680_init_controls(sensor);
>  	if (ret) {
> @@ -668,8 +661,7 @@ static int ov2680_probe(struct i2c_client *client)
>  
>  	ov2680_fill_format(sensor, &sensor->mode.fmt, OV2680_NATIVE_WIDTH, OV2680_NATIVE_HEIGHT);
>  
> -	ret = atomisp_register_sensor_no_gmin(&sensor->sd, 1, ATOMISP_INPUT_FORMAT_RAW_10,
> -					      atomisp_bayer_order_bggr);
> +	ret = v4l2_async_register_subdev_sensor(&sensor->sd);
>  	if (ret) {
>  		ov2680_remove(client);
>  		return ret;
> diff --git a/drivers/staging/media/atomisp/i2c/ov2680.h b/drivers/staging/media/atomisp/i2c/ov2680.h
> index baf49eb0659e..a3eeb0c2de5c 100644
> --- a/drivers/staging/media/atomisp/i2c/ov2680.h
> +++ b/drivers/staging/media/atomisp/i2c/ov2680.h
> @@ -30,8 +30,6 @@
>  #include <linux/v4l2-mediabus.h>
>  #include <media/media-entity.h>
>  
> -#include "../include/linux/atomisp_platform.h"
> -
>  #define OV2680_NATIVE_WIDTH			1616
>  #define OV2680_NATIVE_HEIGHT			1216
>  
> @@ -114,6 +112,7 @@ struct ov2680_device {
>  	struct mutex input_lock;
>  	struct i2c_client *client;
>  	struct gpio_desc *powerdown;
> +	struct fwnode_handle *ep_fwnode;
>  	bool is_streaming;
>  
>  	struct ov2680_mode {
> diff --git a/drivers/staging/media/atomisp/pci/atomisp_csi2_bridge.c b/drivers/staging/media/atomisp/pci/atomisp_csi2_bridge.c
> index c80754755d9e..d7d9cac2c3b8 100644
> --- a/drivers/staging/media/atomisp/pci/atomisp_csi2_bridge.c
> +++ b/drivers/staging/media/atomisp/pci/atomisp_csi2_bridge.c
> @@ -89,6 +89,8 @@ static const guid_t atomisp_dsm_guid =
>   * power-management and with v4l2-async probing.
>   */
>  static const struct atomisp_csi2_sensor_config supported_sensors[] = {
> +	/* Omnivision OV2680 */
> +	{ "OVTI2680", 1 },
>  };
>  
>  /*

-- 
Kind regards,

Sakari Ailus
