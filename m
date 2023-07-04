Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A98A7746FC1
	for <lists+linux-media@lfdr.de>; Tue,  4 Jul 2023 13:22:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230385AbjGDLWC (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 4 Jul 2023 07:22:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41510 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230326AbjGDLVz (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 4 Jul 2023 07:21:55 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3AE1B9D
        for <linux-media@vger.kernel.org>; Tue,  4 Jul 2023 04:21:37 -0700 (PDT)
Received: from [192.168.0.43] (cpc141996-chfd3-2-0-cust928.12-3.cable.virginm.net [86.13.91.161])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 6B7C89B9;
        Tue,  4 Jul 2023 13:20:51 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1688469651;
        bh=GT8m+cfVlUwrWo88kM3msZd7v8AQjuNo3m9Cl7zlXOo=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=KK0WCj5heVV7gJn9Q86RCKH3XhWhrYfadpnYuahtLL6I3lzCuZZfqQqCqPAprFYQI
         uZJbV2scOBtTxJE1eEFFJSMeSQ6i61yIzxOF4TKkG+SdM11ImBQ/san1cUrJNr+uiX
         PwcmEx99iu9LQpF4VNOSS0eVy/B6cKoxMME+2Uek=
Message-ID: <2f157fd4-22e0-7686-45c3-e97635ab5a08@ideasonboard.com>
Date:   Tue, 4 Jul 2023 12:21:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v2 07/15] media: ipu-bridge: Only keep PLD around while
 parsing
Content-Language: en-US
To:     Hans de Goede <hdegoede@redhat.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Andy Shevchenko <andy@kernel.org>, Kate Hsuan <hpa@redhat.com>,
        Hao Yao <hao.yao@intel.com>, Bingbu Cao <bingbu.cao@intel.com>,
        linux-media@vger.kernel.org
References: <20230630110643.209761-1-hdegoede@redhat.com>
 <20230630110643.209761-8-hdegoede@redhat.com>
From:   Dan Scally <dan.scally@ideasonboard.com>
In-Reply-To: <20230630110643.209761-8-hdegoede@redhat.com>
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
> There is no need to keep a reference to the PLD struct around,
> it is only used once the get the sensor orientation.
>
> Make ipu_bridge_parse_orientation() also get + put the PLD.
>
> This is a preparation patch for making the ipu-bridge code more generic
> so that it can be shared with the atomisp driver.
>
> Reviewed-by: Andy Shevchenko <andy@kernel.org>
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> ---
>   drivers/media/pci/intel/ipu-bridge.c | 48 ++++++++++++++++------------
>   drivers/media/pci/intel/ipu-bridge.h |  1 -
>   2 files changed, 27 insertions(+), 22 deletions(-)
>
> diff --git a/drivers/media/pci/intel/ipu-bridge.c b/drivers/media/pci/intel/ipu-bridge.c
> index 8e91d9b3e0fe..3a984d688b42 100644
> --- a/drivers/media/pci/intel/ipu-bridge.c
> +++ b/drivers/media/pci/intel/ipu-bridge.c
> @@ -112,23 +112,39 @@ static u32 ipu_bridge_parse_rotation(struct ipu_sensor *sensor)
>   	}
>   }
>   
> -static enum v4l2_fwnode_orientation ipu_bridge_parse_orientation(struct ipu_sensor *sensor)
> +static enum v4l2_fwnode_orientation ipu_bridge_parse_orientation(struct acpi_device *adev)
>   {
> -	switch (sensor->pld->panel) {
> +	enum v4l2_fwnode_orientation orientation;
> +	struct acpi_pld_info *pld;
> +	acpi_status status;
> +
> +	status = acpi_get_physical_device_location(adev->handle, &pld);
> +	if (ACPI_FAILURE(status)) {
> +		dev_warn(&adev->dev, "_PLD call failed using unknown orientation\n");


I think some punctuation after "_PLD call failed", and I'd probably say "default" rather than "unknown".


Reviewed-by: Daniel Scally <dan.scally@ideasonboard.com>

> +		return V4L2_FWNODE_ORIENTATION_EXTERNAL;
> +	}
> +
> +	switch (pld->panel) {
>   	case ACPI_PLD_PANEL_FRONT:
> -		return V4L2_FWNODE_ORIENTATION_FRONT;
> +		orientation = V4L2_FWNODE_ORIENTATION_FRONT;
> +		break;
>   	case ACPI_PLD_PANEL_BACK:
> -		return V4L2_FWNODE_ORIENTATION_BACK;
> +		orientation = V4L2_FWNODE_ORIENTATION_BACK;
> +		break;
>   	case ACPI_PLD_PANEL_TOP:
>   	case ACPI_PLD_PANEL_LEFT:
>   	case ACPI_PLD_PANEL_RIGHT:
>   	case ACPI_PLD_PANEL_UNKNOWN:
> -		return V4L2_FWNODE_ORIENTATION_EXTERNAL;
> +		orientation = V4L2_FWNODE_ORIENTATION_EXTERNAL;
> +		break;
>   	default:
> -		dev_warn(&sensor->adev->dev, "Unknown _PLD panel value %d\n",
> -			 sensor->pld->panel);
> -		return V4L2_FWNODE_ORIENTATION_EXTERNAL;
> +		dev_warn(&adev->dev, "Unknown _PLD panel val %d\n", pld->panel);
> +		orientation = V4L2_FWNODE_ORIENTATION_EXTERNAL;
> +		break;
>   	}
> +
> +	ACPI_FREE(pld);
> +	return orientation;
>   }
>   
>   static void ipu_bridge_create_fwnode_properties(
> @@ -140,7 +156,7 @@ static void ipu_bridge_create_fwnode_properties(
>   	enum v4l2_fwnode_orientation orientation;
>   
>   	rotation = ipu_bridge_parse_rotation(sensor);
> -	orientation = ipu_bridge_parse_orientation(sensor);
> +	orientation = ipu_bridge_parse_orientation(sensor->adev);
>   
>   	sensor->prop_names = prop_names;
>   
> @@ -279,7 +295,6 @@ static void ipu_bridge_unregister_sensors(struct ipu_bridge *bridge)
>   	for (i = 0; i < bridge->n_sensors; i++) {
>   		sensor = &bridge->sensors[i];
>   		software_node_unregister_node_group(sensor->group);
> -		ACPI_FREE(sensor->pld);
>   		acpi_dev_put(sensor->adev);
>   		i2c_unregister_device(sensor->vcm_i2c_client);
>   	}
> @@ -291,7 +306,6 @@ static int ipu_bridge_connect_sensor(const struct ipu_sensor_config *cfg,
>   	struct fwnode_handle *fwnode, *primary;
>   	struct ipu_sensor *sensor;
>   	struct acpi_device *adev;
> -	acpi_status status;
>   	int ret;
>   
>   	for_each_acpi_dev_match(adev, cfg->hid, NULL, -1) {
> @@ -326,17 +340,11 @@ static int ipu_bridge_connect_sensor(const struct ipu_sensor_config *cfg,
>   			sensor->ssdb.vcmtype = 0;
>   		}
>   
> -		status = acpi_get_physical_device_location(adev->handle, &sensor->pld);
> -		if (ACPI_FAILURE(status)) {
> -			ret = -ENODEV;
> -			goto err_put_adev;
> -		}
> -
>   		if (sensor->ssdb.lanes > IPU_MAX_LANES) {
>   			dev_err(&adev->dev,
>   				"Number of lanes in SSDB is invalid\n");
>   			ret = -EINVAL;
> -			goto err_free_pld;
> +			goto err_put_adev;
>   		}
>   
>   		ipu_bridge_create_fwnode_properties(sensor, bridge, cfg);
> @@ -344,7 +352,7 @@ static int ipu_bridge_connect_sensor(const struct ipu_sensor_config *cfg,
>   
>   		ret = software_node_register_node_group(sensor->group);
>   		if (ret)
> -			goto err_free_pld;
> +			goto err_put_adev;
>   
>   		fwnode = software_node_fwnode(&sensor->swnodes[
>   						      SWNODE_SENSOR_HID]);
> @@ -370,8 +378,6 @@ static int ipu_bridge_connect_sensor(const struct ipu_sensor_config *cfg,
>   
>   err_free_swnodes:
>   	software_node_unregister_node_group(sensor->group);
> -err_free_pld:
> -	ACPI_FREE(sensor->pld);
>   err_put_adev:
>   	acpi_dev_put(adev);
>   	return ret;
> diff --git a/drivers/media/pci/intel/ipu-bridge.h b/drivers/media/pci/intel/ipu-bridge.h
> index 6cb68e3344dc..907ca833a7c1 100644
> --- a/drivers/media/pci/intel/ipu-bridge.h
> +++ b/drivers/media/pci/intel/ipu-bridge.h
> @@ -124,7 +124,6 @@ struct ipu_sensor {
>   	struct ipu_node_names node_names;
>   
>   	struct ipu_sensor_ssdb ssdb;
> -	struct acpi_pld_info *pld;
>   
>   	struct ipu_property_names prop_names;
>   	struct property_entry ep_properties[5];
