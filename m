Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AE197746FE3
	for <lists+linux-media@lfdr.de>; Tue,  4 Jul 2023 13:27:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231140AbjGDL1I (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 4 Jul 2023 07:27:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43964 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231127AbjGDL1H (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 4 Jul 2023 07:27:07 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DBFE19D
        for <linux-media@vger.kernel.org>; Tue,  4 Jul 2023 04:27:06 -0700 (PDT)
Received: from [192.168.0.43] (cpc141996-chfd3-2-0-cust928.12-3.cable.virginm.net [86.13.91.161])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 759059B9;
        Tue,  4 Jul 2023 13:26:21 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1688469981;
        bh=5MVIxe0rd7pkVsIRI6H2Mg2hm3huQwP+2sM+u/kICw0=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=ibVQq6D878KBTKwJ4nPCHOlFV8d8XwM4PL8n8azCZXTJpVopkg6b1NPQ52+mH84vU
         7nyGMaYC5+hRPYllTWhotk2XCQVOXCiUxwzKxIiXyStf4nWy1Le3D3BLX1ArfFUHbb
         O/OvnvQpDTxTNQu2t8iKlPqPwuvInGr6kzQjUdiE=
Message-ID: <b9724c94-8b9b-72e5-9c69-da0cf17a93af@ideasonboard.com>
Date:   Tue, 4 Jul 2023 12:27:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v2 05/15] media: ipu-bridge: Make ipu_bridge_init() take a
 regular struct device as argument
Content-Language: en-US
To:     Hans de Goede <hdegoede@redhat.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Andy Shevchenko <andy@kernel.org>, Kate Hsuan <hpa@redhat.com>,
        Hao Yao <hao.yao@intel.com>, Bingbu Cao <bingbu.cao@intel.com>,
        linux-media@vger.kernel.org
References: <20230630110643.209761-1-hdegoede@redhat.com>
 <20230630110643.209761-6-hdegoede@redhat.com>
From:   Dan Scally <dan.scally@ideasonboard.com>
In-Reply-To: <20230630110643.209761-6-hdegoede@redhat.com>
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


On 30/06/2023 13:06, Hans de Goede wrote:
> Make ipu_bridge_init() take a regular struct device, rather then
> a pci_dev as argument.
>
> This is a preparation patch for making the ipu-bridge code more generic
> so that it can be shared with the atomisp driver.
>
> Reviewed-by: Andy Shevchenko <andy@kernel.org>
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> ---


Reviewed-by: Daniel Scally <dan.scally@ideasonboard.com>


And same for 6/15.

>   drivers/media/pci/intel/ipu-bridge.c     | 16 +++++++---------
>   drivers/media/pci/intel/ipu-bridge.h     |  4 ++--
>   drivers/media/pci/intel/ipu3/ipu3-cio2.c |  2 +-
>   3 files changed, 10 insertions(+), 12 deletions(-)
>
> diff --git a/drivers/media/pci/intel/ipu-bridge.c b/drivers/media/pci/intel/ipu-bridge.c
> index 97b544736af2..9027a8d2d176 100644
> --- a/drivers/media/pci/intel/ipu-bridge.c
> +++ b/drivers/media/pci/intel/ipu-bridge.c
> @@ -4,7 +4,6 @@
>   #include <linux/acpi.h>
>   #include <linux/device.h>
>   #include <linux/i2c.h>
> -#include <linux/pci.h>
>   #include <linux/property.h>
>   #include <media/v4l2-fwnode.h>
>   
> @@ -288,7 +287,7 @@ static void ipu_bridge_unregister_sensors(struct ipu_bridge *bridge)
>   
>   static int ipu_bridge_connect_sensor(const struct ipu_sensor_config *cfg,
>   				     struct ipu_bridge *bridge,
> -				     struct pci_dev *ipu)
> +				     struct device *dev)
>   {
>   	struct fwnode_handle *fwnode, *primary;
>   	struct ipu_sensor *sensor;
> @@ -302,7 +301,7 @@ static int ipu_bridge_connect_sensor(const struct ipu_sensor_config *cfg,
>   
>   		if (bridge->n_sensors >= IPU_MAX_PORTS) {
>   			acpi_dev_put(adev);
> -			dev_err(&ipu->dev, "Exceeded available IPU ports\n");
> +			dev_err(dev, "Exceeded available IPU ports\n");
>   			return -EINVAL;
>   		}
>   
> @@ -362,7 +361,7 @@ static int ipu_bridge_connect_sensor(const struct ipu_sensor_config *cfg,
>   
>   		ipu_bridge_instantiate_vcm_i2c_client(sensor);
>   
> -		dev_info(&ipu->dev, "Found supported sensor %s\n",
> +		dev_info(dev, "Found supported sensor %s\n",
>   			 acpi_dev_name(adev));
>   
>   		bridge->n_sensors++;
> @@ -380,7 +379,7 @@ static int ipu_bridge_connect_sensor(const struct ipu_sensor_config *cfg,
>   }
>   
>   static int ipu_bridge_connect_sensors(struct ipu_bridge *bridge,
> -				      struct pci_dev *ipu)
> +				      struct device *dev)
>   {
>   	unsigned int i;
>   	int ret;
> @@ -389,7 +388,7 @@ static int ipu_bridge_connect_sensors(struct ipu_bridge *bridge,
>   		const struct ipu_sensor_config *cfg =
>   			&ipu_supported_sensors[i];
>   
> -		ret = ipu_bridge_connect_sensor(cfg, bridge, ipu);
> +		ret = ipu_bridge_connect_sensor(cfg, bridge, dev);
>   		if (ret)
>   			goto err_unregister_sensors;
>   	}
> @@ -435,9 +434,8 @@ static int ipu_bridge_sensors_are_ready(void)
>   	return ready;
>   }
>   
> -int ipu_bridge_init(struct pci_dev *ipu)
> +int ipu_bridge_init(struct device *dev)
>   {
> -	struct device *dev = &ipu->dev;
>   	struct fwnode_handle *fwnode;
>   	struct ipu_bridge *bridge;
>   	unsigned int i;
> @@ -470,7 +468,7 @@ int ipu_bridge_init(struct pci_dev *ipu)
>   	for (i = 0; i < IPU_MAX_LANES; i++)
>   		bridge->data_lanes[i] = i + 1;
>   
> -	ret = ipu_bridge_connect_sensors(bridge, ipu);
> +	ret = ipu_bridge_connect_sensors(bridge, dev);
>   	if (ret || bridge->n_sensors == 0)
>   		goto err_unregister_ipu;
>   
> diff --git a/drivers/media/pci/intel/ipu-bridge.h b/drivers/media/pci/intel/ipu-bridge.h
> index 6cce712a0f34..8c1437f252d2 100644
> --- a/drivers/media/pci/intel/ipu-bridge.h
> +++ b/drivers/media/pci/intel/ipu-bridge.h
> @@ -144,9 +144,9 @@ struct ipu_bridge {
>   };
>   
>   #if IS_ENABLED(CONFIG_IPU_BRIDGE)
> -int ipu_bridge_init(struct pci_dev *ipu);
> +int ipu_bridge_init(struct device *dev);
>   #else
> -static inline int ipu_bridge_init(struct pci_dev *ipu) { return 0; }
> +static inline int ipu_bridge_init(struct device *dev) { return 0; }
>   #endif
>   
>   #endif
> diff --git a/drivers/media/pci/intel/ipu3/ipu3-cio2.c b/drivers/media/pci/intel/ipu3/ipu3-cio2.c
> index dc09fbdb062b..4068fa0a5ecf 100644
> --- a/drivers/media/pci/intel/ipu3/ipu3-cio2.c
> +++ b/drivers/media/pci/intel/ipu3/ipu3-cio2.c
> @@ -1725,7 +1725,7 @@ static int cio2_pci_probe(struct pci_dev *pci_dev,
>   			return -EINVAL;
>   		}
>   
> -		r = ipu_bridge_init(pci_dev);
> +		r = ipu_bridge_init(dev);
>   		if (r)
>   			return r;
>   	}
