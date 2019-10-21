Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4CE40DE9D0
	for <lists+linux-media@lfdr.de>; Mon, 21 Oct 2019 12:38:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728160AbfJUKiJ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 21 Oct 2019 06:38:09 -0400
Received: from lb1-smtp-cloud7.xs4all.net ([194.109.24.24]:35437 "EHLO
        lb1-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726725AbfJUKiJ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 21 Oct 2019 06:38:09 -0400
Received: from [192.168.2.10] ([46.9.232.237])
        by smtp-cloud7.xs4all.net with ESMTPA
        id MV4diU1Tdo1ZhMV4giLfb1; Mon, 21 Oct 2019 12:38:06 +0200
Subject: Re: [Patch 07/19] media: ti-vpe: cal: add CSI2 PHY LDO errata support
To:     Benoit Parrot <bparrot@ti.com>, Rob Herring <robh+dt@kernel.org>
Cc:     linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Jyri Sarha <jsarha@ti.com>
References: <20191018153437.20614-1-bparrot@ti.com>
 <20191018153437.20614-8-bparrot@ti.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <68dbd926-0e37-93f7-e03e-def4b4146d32@xs4all.nl>
Date:   Mon, 21 Oct 2019 12:38:03 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191018153437.20614-8-bparrot@ti.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfN7I+pVfMgIkvnB5EwZLFJ0MzMPcjgiwikp5JFhEn8sQI3ONVzWrvTz1WXmzHqV32dd4F71xp6LHS8hxF4BjyMGFnGWLPZj+McnqgS56vq8S4Bh7FRGF
 azKBb52I+vN9gcbpc55rg0mhDafJYNqZWU6iBAh8/agM8cKH8aNp+QISlX5n1eMN87PuBq3vCtUkZ35NYta7W7tx59fugU/ozRxMXV5p4T8m7hNNkRgU/5B1
 2hJ9cl6y+exwcglLLHA6iB9+ZUYaQeJFAohkJVQ5zAyDankwfjUCloFx9XNQTlr1LYEWiJwPDV6VuJ8fw2jlltQ7f42ztQrt0m01A2lwTbo=
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 10/18/19 5:34 PM, Benoit Parrot wrote:
> Apply Errata i913 every time the functional clock is enabled.
> This should take care of suspend/resume case as well.
> 
> Signed-off-by: Benoit Parrot <bparrot@ti.com>
> Signed-off-by: Jyri Sarha <jsarha@ti.com>
> ---
>  drivers/media/platform/ti-vpe/cal.c      | 56 +++++++++++++++++++++++-
>  drivers/media/platform/ti-vpe/cal_regs.h | 27 ++++++++++++
>  2 files changed, 82 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/media/platform/ti-vpe/cal.c b/drivers/media/platform/ti-vpe/cal.c
> index 62aeedb705e9..3cbc4dca6de8 100644
> --- a/drivers/media/platform/ti-vpe/cal.c
> +++ b/drivers/media/platform/ti-vpe/cal.c
> @@ -284,6 +284,13 @@ static struct cal_data dra72x_cal_data = {
>  	.flags = 0,
>  };
>  
> +static struct cal_data dra72x_es1_cal_data = {
> +	.csi2_phy_core = dra72x_cal_csi_phy,
> +	.num_csi2_phy = ARRAY_SIZE(dra72x_cal_csi_phy),
> +
> +	.flags = DRA72_CAL_PRE_ES2_LDO_DISABLE,
> +};
> +
>  /*
>   * there is one cal_dev structure in the driver, it is shared by
>   * all instances.
> @@ -569,9 +576,52 @@ static void cal_get_hwinfo(struct cal_dev *dev)
>  		hwinfo);
>  }
>  
> +/*
> + *   Errata i913: CSI2 LDO Needs to be disabled when module is powered on
> + *
> + *   Enabling CSI2 LDO shorts it to core supply. It is crucial the 2 CSI2
> + *   LDOs on the device are disabled if CSI-2 module is powered on
> + *   (0x4845 B304 | 0x4845 B384 [28:27] = 0x1) or in ULPS (0x4845 B304
> + *   | 0x4845 B384 [28:27] = 0x2) mode. Common concerns include: high
> + *   current draw on the module supply in active mode.
> + *
> + *   Errata does not apply when CSI-2 module is powered off
> + *   (0x4845 B304 | 0x4845 B384 [28:27] = 0x0).
> + *
> + * SW Workaround:
> + *	Set the following register bits to disable the LDO,
> + *	which is essentially CSI2 REG10 bit 6:
> + *
> + *		Core 0:  0x4845 B828 = 0x0000 0040
> + *		Core 1:  0x4845 B928 = 0x0000 0040
> + */
> +static void i913_errata(struct cal_dev *dev, unsigned int port)
> +{
> +	u32 reg10 = reg_read(dev->cc[port], CAL_CSI2_PHY_REG10);
> +
> +	set_field(&reg10, CAL_CSI2_PHY_REG0_HSCLOCKCONFIG_DISABLE,
> +		  CAL_CSI2_PHY_REG10_I933_LDO_DISABLE_MASK);
> +
> +	cal_dbg(1, dev, "CSI2_%d_REG10 = 0x%08x\n", port, reg10);
> +	reg_write(dev->cc[port], CAL_CSI2_PHY_REG10, reg10);
> +}
> +
>  static inline int cal_runtime_get(struct cal_dev *dev)

I'd drop the 'inline' here. It doesn't seem appropriate anymore since this
function is now more complex.

Regards,

	Hans

>  {
> -	return pm_runtime_get_sync(&dev->pdev->dev);
> +	int r;
> +
> +	r = pm_runtime_get_sync(&dev->pdev->dev);
> +
> +	if (dev->flags & DRA72_CAL_PRE_ES2_LDO_DISABLE) {
> +		/*
> +		 * Apply errata on both port eveytime we (re-)enable
> +		 * the clock
> +		 */
> +		i913_errata(dev, 0);
> +		i913_errata(dev, 1);
> +	}
> +
> +	return r;
>  }
>  
>  static inline void cal_runtime_put(struct cal_dev *dev)
> @@ -2071,6 +2121,10 @@ static const struct of_device_id cal_of_match[] = {
>  		.compatible = "ti,dra72-cal",
>  		.data = (void *)&dra72x_cal_data,
>  	},
> +	{
> +		.compatible = "ti,dra72-pre-es2-cal",
> +		.data = (void *)&dra72x_es1_cal_data,
> +	},
>  	{},
>  };
>  MODULE_DEVICE_TABLE(of, cal_of_match);
> diff --git a/drivers/media/platform/ti-vpe/cal_regs.h b/drivers/media/platform/ti-vpe/cal_regs.h
> index 68cfc922b422..78d6f015c9ea 100644
> --- a/drivers/media/platform/ti-vpe/cal_regs.h
> +++ b/drivers/media/platform/ti-vpe/cal_regs.h
> @@ -10,6 +10,30 @@
>  #ifndef __TI_CAL_REGS_H
>  #define __TI_CAL_REGS_H
>  
> +/*
> + * struct cal_dev.flags possibilities
> + *
> + * DRA72_CAL_PRE_ES2_LDO_DISABLE:
> + *   Errata i913: CSI2 LDO Needs to be disabled when module is powered on
> + *
> + *   Enabling CSI2 LDO shorts it to core supply. It is crucial the 2 CSI2
> + *   LDOs on the device are disabled if CSI-2 module is powered on
> + *   (0x4845 B304 | 0x4845 B384 [28:27] = 0x1) or in ULPS (0x4845 B304
> + *   | 0x4845 B384 [28:27] = 0x2) mode. Common concerns include: high
> + *   current draw on the module supply in active mode.
> + *
> + *   Errata does not apply when CSI-2 module is powered off
> + *   (0x4845 B304 | 0x4845 B384 [28:27] = 0x0).
> + *
> + * SW Workaround:
> + *	Set the following register bits to disable the LDO,
> + *	which is essentially CSI2 REG10 bit 6:
> + *
> + *		Core 0:  0x4845 B828 = 0x0000 0040
> + *		Core 1:  0x4845 B928 = 0x0000 0040
> + */
> +#define DRA72_CAL_PRE_ES2_LDO_DISABLE BIT(0)
> +
>  #define CAL_NUM_CSI2_PORTS		2
>  
>  /* CAL register offsets */
> @@ -71,6 +95,7 @@
>  #define CAL_CSI2_PHY_REG0		0x000
>  #define CAL_CSI2_PHY_REG1		0x004
>  #define CAL_CSI2_PHY_REG2		0x008
> +#define CAL_CSI2_PHY_REG10		0x028
>  
>  /* CAL Control Module Core Camerrx Control register offsets */
>  #define CM_CTRL_CORE_CAMERRX_CONTROL	0x000
> @@ -458,6 +483,8 @@
>  #define CAL_CSI2_PHY_REG1_CLOCK_MISS_DETECTOR_STATUS_SUCCESS		0
>  #define CAL_CSI2_PHY_REG1_RESET_DONE_STATUS_MASK		GENMASK(29, 28)
>  
> +#define CAL_CSI2_PHY_REG10_I933_LDO_DISABLE_MASK		BIT_MASK(6)
> +
>  #define CAL_CSI2_PHY_REG2_CCP2_SYNC_PATTERN_MASK		GENMASK(23, 0)
>  #define CAL_CSI2_PHY_REG2_TRIGGER_CMD_RXTRIGESC3_MASK		GENMASK(25, 24)
>  #define CAL_CSI2_PHY_REG2_TRIGGER_CMD_RXTRIGESC2_MASK		GENMASK(27, 26)
> 

