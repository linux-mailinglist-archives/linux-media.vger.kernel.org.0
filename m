Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7D3074E53D7
	for <lists+linux-media@lfdr.de>; Wed, 23 Mar 2022 15:01:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239928AbiCWODG (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 23 Mar 2022 10:03:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58522 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239785AbiCWODF (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 23 Mar 2022 10:03:05 -0400
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com [IPv6:2a00:1450:4864:20::429])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A4F2A7DE39
        for <linux-media@vger.kernel.org>; Wed, 23 Mar 2022 07:01:32 -0700 (PDT)
Received: by mail-wr1-x429.google.com with SMTP id u16so2287716wru.4
        for <linux-media@vger.kernel.org>; Wed, 23 Mar 2022 07:01:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:organization:in-reply-to
         :content-transfer-encoding;
        bh=Rg1K9zabcbbEDQTinbqemybSuh5neZkA99uDGbGCbwY=;
        b=VFlxG0HVzGKCdmVSmC7bHKF4gx5R++C7lbFdMjQKumrLUsywk0qIsJPOOnrQWPkOuX
         NUfexTDQR0mOa5cO0GWEARs6nOD33yjCHJJPfk4xWIshBPxrHR8xqmsMIMhug28PBB/t
         VYMZivdO2mImJXXLCgzo2TB/SdlWw8j/6iW3HaSdes183qlPACmW2hAP7MYklAD1gp+c
         sUcfZTzMBcY0L1Bv6QEFHySDjvj0CUQ3IJKp3+D/0F/EXgAeioyRnQbqeNVk5s5Zmpkn
         HCFECPjP8MGVliKatcpWDrm2dTVsWGnoLBpOD53gMwJTGKiknWCoAqQzuQvqf+ArDn3U
         aL6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:organization:in-reply-to
         :content-transfer-encoding;
        bh=Rg1K9zabcbbEDQTinbqemybSuh5neZkA99uDGbGCbwY=;
        b=fTSb55BQHj1k5XX/XKsXg1q2iEpf2lC6MgM6t+orxCtDvaBIIBq+Au2N9de6/gJs+0
         DUky1K863MFFYMA2FP7RLwkN5fYeG72Yv7I2/q5tNs0hw9trM8sOf4l+tOTZ8CA4bFYM
         qEzAOoQMfC3G/u6wuBwaiMUuPsprPgDY4POrSKnTZCi1GlTEBWT1HUwyCGuNKwDQ7NxI
         +zQoOJEzvhAiE/aWY1a2SeDGWiJKD4SWCRfgFGg9/9pVDnzk49VfQUxQEUwcDW8RKlAv
         K4yhsIuM5kBvMXWhmYuSygXtObgSk7hhpVWPwZbOvts8K6erLY6bvORUgeCnw4a3PpG9
         8GVw==
X-Gm-Message-State: AOAM5318+Wyx1GnNaRqbWEu0gCS+xHnDzPpJ+Le42NSrk+3f3VBFwjnb
        Ew+MmFkqhLCXT27KmPFdb0qMKL5cCyKuvQ==
X-Google-Smtp-Source: ABdhPJyTnpPes4cNZCtmfUGgBKaEM3mAFDFBQpLe790FGwf6rJEHaqU0zWrzds3ELxaXqvok5n4kXw==
X-Received: by 2002:adf:8021:0:b0:1f6:3413:2826 with SMTP id 30-20020adf8021000000b001f634132826mr27532214wrk.88.1648044089851;
        Wed, 23 Mar 2022 07:01:29 -0700 (PDT)
Received: from ?IPV6:2001:861:44c0:66c0:871b:e667:ca26:e5eb? ([2001:861:44c0:66c0:871b:e667:ca26:e5eb])
        by smtp.gmail.com with ESMTPSA id 11-20020a05600c26cb00b0037ff53511f2sm3870295wmv.31.2022.03.23.07.01.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Mar 2022 07:01:29 -0700 (PDT)
Message-ID: <b1a1fd6c-e203-3cab-e04b-ab67a9be40af@baylibre.com>
Date:   Wed, 23 Mar 2022 15:01:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v2 2/2] media: i2c: Add OV1063x sensor driver
Content-Language: en-US
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-media@vger.kernel.org
Cc:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
        Benoit Parrot <bparrot@ti.com>
References: <20211206230717.5836-1-laurent.pinchart@ideasonboard.com>
 <20211206230717.5836-3-laurent.pinchart@ideasonboard.com>
From:   Neil Armstrong <narmstrong@baylibre.com>
Organization: Baylibre
In-Reply-To: <20211206230717.5836-3-laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Laurent,


On 07/12/2021 00:07, Laurent Pinchart wrote:
> Add a new V4L2 subdev driver for the OmniVision OV10633 and OV10635
> camera sensors. The work is based on the driver from the TI BSP, itself
> based on original work by Phil Edworthy posted to the linux-media
> mailing list ([1]). This version of the code is a large rewrite of many
> parts.
> 
> [1] http://www.spinics.net/lists/linux-media/msg64347.html
> 
> Signed-off-by: Nikhil Devshatwar <nikhil.nd@ti.com>
> Signed-off-by: Benoit Parrot <bparrot@ti.com>
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> ---
> Changes since v1:
> 
> - Drop unneeded debug message
> - Fix MODULE_LICENSE
> - Fix priv pointer retrieval in remove()
> - Add more registers macros
> - Fix PLL calculation
> - Update to subdev state API
> - Fix test pattern when starting streaming
> ---
>   MAINTAINERS                      |    2 +
>   drivers/media/i2c/Kconfig        |   12 +
>   drivers/media/i2c/Makefile       |    1 +
>   drivers/media/i2c/ov1063x.c      | 1716 ++++++++++++++++++++++++++++++
>   drivers/media/i2c/ov1063x_regs.h |  627 +++++++++++
>   5 files changed, 2358 insertions(+)
>   create mode 100644 drivers/media/i2c/ov1063x.c
>   create mode 100644 drivers/media/i2c/ov1063x_regs.h
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 9c7748b160dd..eb24dc54e046 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -14044,6 +14044,8 @@ L:	linux-media@vger.kernel.org
>   S:	Maintained
>   T:	git git://linuxtv.org/media_tree.git
>   F:	Documentation/devicetree/bindings/media/i2c/ov1063x.yaml
> +F:	drivers/media/i2c/ov1063x.c
> +F:	drivers/media/i2c/ov1063x_regs.h
>   
>   OMNIVISION OV13858 SENSOR DRIVER
>   M:	Sakari Ailus <sakari.ailus@linux.intel.com>
> diff --git a/drivers/media/i2c/Kconfig b/drivers/media/i2c/Kconfig
> index d6a5d4ca439a..7a0d7bd17a3c 100644
> --- a/drivers/media/i2c/Kconfig
> +++ b/drivers/media/i2c/Kconfig
> @@ -1192,6 +1192,18 @@ config VIDEO_OV9734
>   	  To compile this driver as a module, choose M here: the
>   	  module's name is ov9734.
>   
> +config VIDEO_OV10633
> +	tristate "OmniVision OV10633/OV10635 sensor support"
> +	depends on I2C && VIDEO_V4L2
> +	depends on GPIOLIB && OF
> +	select MEDIA_CONTROLLER
> +	select REGMAP_I2C
> +	select V4L2_FWNODE
> +	select VIDEO_V4L2_SUBDEV_API
> +	help
> +	  This is a Video4Linux2 driver for the OmniVision
> +	  OV10633 and OV10635 camera sensors.
> +
>   config VIDEO_OV13858
>   	tristate "OmniVision OV13858 sensor support"
>   	depends on I2C && VIDEO_V4L2
> diff --git a/drivers/media/i2c/Makefile b/drivers/media/i2c/Makefile
> index 4d4fe08d7a6a..a16299de56c0 100644
> --- a/drivers/media/i2c/Makefile
> +++ b/drivers/media/i2c/Makefile
> @@ -88,6 +88,7 @@ obj-$(CONFIG_VIDEO_OV9282) += ov9282.o
>   obj-$(CONFIG_VIDEO_OV9640) += ov9640.o
>   obj-$(CONFIG_VIDEO_OV9650) += ov9650.o
>   obj-$(CONFIG_VIDEO_OV9734) += ov9734.o
> +obj-$(CONFIG_VIDEO_OV10633) += ov1063x.o
>   obj-$(CONFIG_VIDEO_OV13858) += ov13858.o
>   obj-$(CONFIG_VIDEO_OV13B10) += ov13b10.o
>   obj-$(CONFIG_VIDEO_MT9M001) += mt9m001.o
> diff --git a/drivers/media/i2c/ov1063x.c b/drivers/media/i2c/ov1063x.c
> new file mode 100644
> index 000000000000..fb4ef5ea9a9f
> --- /dev/null
> +++ b/drivers/media/i2c/ov1063x.c
> @@ -0,0 +1,1716 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * OmniVision OV10633/OV10635 Camera Driver
> + *
> + * Based on the original driver written by Phil Edworthy.
> + * Copyright (C) 2013 Phil Edworthy
> + * Copyright (C) 2013 Renesas Electronics
> + * Copyright (C) 2018 Texas Instruments Incorporated - http://www.ti.com/
> + * Copyright (C) 2020 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> + */
> +
> +#include <linux/clk.h>
> +#include <linux/gpio/consumer.h>
> +#include <linux/i2c.h>
> +#include <linux/init.h>
> +#include <linux/module.h>
> +#include <linux/of.h>
> +#include <linux/pm_runtime.h>
> +#include <linux/regmap.h>
> +#include <linux/slab.h>
> +#include <linux/v4l2-mediabus.h>
> +#include <linux/videodev2.h>
> +
> +#include <media/v4l2-common.h>
> +#include <media/v4l2-ctrls.h>
> +#include <media/v4l2-event.h>
> +#include <media/v4l2-fwnode.h>
> +#include <media/v4l2-subdev.h>
> +
> +/* Register definitions */
> +#define OV1063X_REG_8BIT(n)			((1 << 16) | (n))
> +#define OV1063X_REG_16BIT(n)			((2 << 16) | (n))
> +#define OV1063X_REG_24BIT(n)			((3 << 16) | (n))
> +#define OV1063X_REG_32BIT(n)			((4 << 16) | (n))
> +#define OV1063X_REG_SIZE_SHIFT			16
> +#define OV1063X_REG_ADDR_MASK			0xffff
> +
> +#define OV1063X_STREAM_MODE			OV1063X_REG_8BIT(0x0100)
> +#define OV1063X_STREAM_MODE_ON			BIT(0)
> +#define OV1063X_SOFTWARE_RESET			OV1063X_REG_8BIT(0x0103)
> +
> +#define OV1063X_SC_CMMN_PLL_CTRL0		OV1063X_REG_8BIT(0x3003)
> +#define OV1063X_SC_CMMN_PLL_SCLK_CP(n)		((n) << 6)
> +#define OV1063X_SC_CMMN_PLL_SCLK_MULTI(n)	((n) << 0)
> +#define OV1063X_SC_CMMN_PLL_CTRL1		OV1063X_REG_8BIT(0x3004)
> +#define OV1063X_SC_CMMN_PLL_SCLK_BYPASS		BIT(7)
> +#define OV1063X_SC_CMMN_PLL_SCLK_PRE_DIV(n)	((n) << 4)	/* /1, /1.5, /2, /3, /4, /5, /6, /7 */
> +#define OV1063X_SC_CMMN_PLL_SCLK_CP2(n)		((n) << 3)
> +#define OV1063X_SC_CMMN_PLL_SCLK_DIV(n)		((n) << 0)	/* Divider = 2 * (1 + n) */
> +#define OV1063X_SC_CMMN_PLL_CTRL2		OV1063X_REG_8BIT(0x3005)
> +#define OV1063X_SC_CMMN_PLL_PCLK_CP(n)		((n) << 6)
> +#define OV1063X_SC_CMMN_PLL_PCLK_MULTI(n)	((n) << 0)
> +#define OV1063X_SC_CMMN_PLL_CTRL3		OV1063X_REG_8BIT(0x3006)
> +#define OV1063X_SC_CMMN_PLL_PCLK_BYPASS		BIT(7)
> +#define OV1063X_SC_CMMN_PLL_PCLK_PRE_DIV(n)	((n) << 4)	/* /1, /1.5, /2, /3, /4, /5, /6, /7 */
> +#define OV1063X_SC_CMMN_PLL_PCLK_CP2(n)		((n) << 3)
> +#define OV1063X_SC_CMMN_PLL_PCLK_DIV(n)		((n) << 0)	/* Divider = 2 * (1 + n) */
> +#define OV1063X_SC_CMMN_PCLK_DIV_CTRL		OV1063X_REG_8BIT(0x3007)
> +#define OV1063X_PID				OV1063X_REG_16BIT(0x300a)
> +#define OV1063X_SC_CMMN_SCCB_ID			OV1063X_REG_8BIT(0x300c)
> +#define OV1063X_SC_CMMN_SCCB_ID_ADDR(n)		((n) << 1)
> +#define OV1063X_SC_CMMN_SCCB_ID_SEL		BIT(0)
> +#define OV1063X_SC_CMMN_PAD			OV1063X_REG_8BIT(0x3011)
> +#define OV1063X_SC_CMMN_PAD_DRIVE(n)		((n) << 6)
> +#define OV1063X_SC_CMMN_CLKRST0			OV1063X_REG_8BIT(0x301a)
> +#define OV1063X_SC_CMMN_CLKRST0_SCLK		GENMASK(7, 4)
> +#define OV1063X_SC_CMMN_CLKRST0_RST		GENMASK(3, 0)
> +#define OV1063X_SC_CMMN_CLKRST1			OV1063X_REG_8BIT(0x301b)
> +#define OV1063X_SC_CMMN_CLKRST1_SCLK		GENMASK(7, 4)
> +#define OV1063X_SC_CMMN_CLKRST1_RST		GENMASK(3, 0)
> +#define OV1063X_SC_CMMN_CLKRST2			OV1063X_REG_8BIT(0x301c)
> +#define OV1063X_SC_CMMN_CLKRST2_PCLK_DVP	BIT(7)
> +#define OV1063X_SC_CMMN_CLKRST2_SCLK		GENMASK(6, 4)
> +#define OV1063X_SC_CMMN_CLKRST2_RST_DVP		BIT(3)
> +#define OV1063X_SC_CMMN_CLKRST2_RST		GENMASK(2, 0)
> +#define OV1063X_SC_CMMN_CLOCK_SEL		OV1063X_REG_8BIT(0x3020)
> +#define OV1063X_SC_CMMN_CLOCK_SEL_SCLK2X	BIT(0)
> +#define OV1063X_SC_CMMN_MISC_CTRL		OV1063X_REG_8BIT(0x3021)
> +#define OV1063X_SC_CMMN_MISC_CTRL_PCLK_INV	BIT(7)
> +#define OV1063X_SC_CMMN_MISC_CTRL_SCLK_INV	BIT(6)
> +#define OV1063X_SC_CMMN_MISC_CTRL_SCLK2X_INV	BIT(5)
> +#define OV1063X_SC_CMMN_MISC_CTRL_CEN_GLOBAL_O	BIT(0)
> +#define OV1063X_SC_CMMN_CORE_CTRL_1		OV1063X_REG_8BIT(0x3022)
> +#define OV1063X_SC_CMMN_CORE_CTRL_2		OV1063X_REG_8BIT(0x3023)
> +#define OV1063X_SC_CMMN_CORE_CTRL_BIST_EN	BIT(5)
> +#define OV1063X_SC_CMMN_CORE_CTRL_CLK_SWITCH	BIT(4)
> +#define OV1063X_SC_CMMN_CORE_CTRL_3		OV1063X_REG_8BIT(0x3024)
> +#define OV1063X_SC_CMMN_CORE_CTRL_RAW_LONG	(0U << 4)
> +#define OV1063X_SC_CMMN_CORE_CTRL_RAW_SHORT	(1U << 4)
> +#define OV1063X_SC_CMMN_CORE_CTRL_RAW_LONG_SHORT	(2U << 4)
> +#define OV1063X_SC_CMMN_CORE_CTRL_RAW_COMBINED	(0U << 4)
> +#define OV1063X_SC_CMMN_CORE_CTRL_YUV_LONG	(1U << 1)
> +#define OV1063X_SC_CMMN_CORE_CTRL_YUV_SHORT	(2U << 1)
> +#define OV1063X_SC_CMMN_CORE_CTRL_PCLK_SYS	(0U << 0)	/* PCLK from system PLL */
> +#define OV1063X_SC_CMMN_CORE_CTRL_PCLK_SEC	(1U << 0)	/* PCLK from secondary PLL */
> +#define OV1063X_SC_CMMN_CORE_CTRL1		OV1063X_REG_8BIT(0x3025)
> +#define OV1063X_SC_CMMN_PWDN_CTRL2		OV1063X_REG_8BIT(0x302d)
> +#define OV1063X_SC_CMMN_PWDN_CTRL2_RST_DIG1	BIT(3)
> +#define OV1063X_SC_CMMN_PWDN_CTRL2_RST_DIG2	BIT(2)
> +#define OV1063X_SC_CMMN_PWDN_CTRL2_RST_ISP	BIT(1)
> +#define OV1063X_SC_CMMN_PWDN_CTRL2_SEQUENCE	BIT(0)
> +#define OV1063X_SC_CMMN_SCLK2X_SEL		OV1063X_REG_8BIT(0x3033)
> +#define OV1063X_SC_CMMN_SCLK2X_SEL_DIV2		(1U << 2)
> +#define OV1063X_SC_CMMN_SCLK2X_SEL_DIV4		(2U << 2)
> +#define OV1063X_SC_SOC_CLKRST7			OV1063X_REG_8BIT(0x3042)
> +#define OV1063X_SC_SOC_CLKRST7_SCLK		GENMASK(7, 4)
> +#define OV1063X_SC_SOC_CLKRST7_RST		GENMASK(3, 0)
> +
> +#define OV1063X_AEC_PK_MANUAL			OV1063X_REG_8BIT(0x3503)
> +#define OV1063X_AEC_PK_MANUAL_GAIN_DELAY	BIT(5)
> +#define OV1063X_AEC_PK_MANUAL_DELAY		BIT(4)
> +#define OV1063X_AEC_PK_MAN_DONE			OV1063X_REG_8BIT(0x3504)
> +#define OV1063X_AEC_PK_MAN_DONE_AEC_DONE	BIT(0)
> +
> +#define OV1063X_ANA_ADC1			OV1063X_REG_8BIT(0x3600)
> +#define OV1063X_ANA_ADC2			OV1063X_REG_8BIT(0x3601)
> +#define OV1063X_ANA_ADC3			OV1063X_REG_8BIT(0x3602)
> +#define OV1063X_ANA_ADC4			OV1063X_REG_8BIT(0x3603)
> +#define OV1063X_ANA_ANALOG1			OV1063X_REG_8BIT(0x3610)
> +#define OV1063X_ANA_ANALOG2			OV1063X_REG_8BIT(0x3611)
> +#define OV1063X_ANA_ANALOG3			OV1063X_REG_8BIT(0x3612)
> +#define OV1063X_ANA_ARRAY1			OV1063X_REG_8BIT(0x3621)
> +#define OV1063X_ANA_ARRAY1_FULL			(0 << 3)
> +#define OV1063X_ANA_ARRAY1_CROP_768		(1 << 3)
> +#define OV1063X_ANA_ARRAY1_CROP_656		(2 << 3)
> +#define OV1063X_ANA_ARRAY1_DELAY(n)		((n) << 0)
> +#define OV1063X_ANA_PWC1			OV1063X_REG_8BIT(0x3630)
> +#define OV1063X_ANA_PWC2			OV1063X_REG_8BIT(0x3631)
> +#define OV1063X_ANA_PWC3			OV1063X_REG_8BIT(0x3632)
> +#define OV1063X_ANA_PWC4			OV1063X_REG_8BIT(0x3633)
> +
> +#define OV1063X_SENSOR_RSTGOLOW			OV1063X_REG_8BIT(0x3702)
> +#define OV1063X_SENSOR_HLDWIDTH			OV1063X_REG_8BIT(0x3703)
> +#define OV1063X_SENSOR_TXWIDTH			OV1063X_REG_8BIT(0x3704)
> +#define OV1063X_SENSOR_REG9			OV1063X_REG_8BIT(0x3709)
> +#define OV1063X_SENSOR_REGD			OV1063X_REG_8BIT(0x370d)
> +#define OV1063X_SENSOR_RSTYZ_GOLOW		OV1063X_REG_16BIT(0x3712)
> +#define OV1063X_SENSOR_EQ_GOLOW			OV1063X_REG_8BIT(0x3714)
> +#define OV1063X_SENSOR_REG15			OV1063X_REG_8BIT(0x3715)
> +#define OV1063X_SENSOR_BITSW_GO			OV1063X_REG_16BIT(0x371c)
> +
> +#define OV1063X_TIMING_X_START_ADDR		OV1063X_REG_16BIT(0x3800)
> +#define OV1063X_TIMING_Y_START_ADDR		OV1063X_REG_16BIT(0x3802)
> +#define OV1063X_TIMING_X_END_ADDR		OV1063X_REG_16BIT(0x3804)
> +#define OV1063X_TIMING_Y_END_ADDR		OV1063X_REG_16BIT(0x3806)
> +#define OV1063X_TIMING_X_OUTPUT_SIZE		OV1063X_REG_16BIT(0x3808)
> +#define OV1063X_TIMING_Y_OUTPUT_SIZE		OV1063X_REG_16BIT(0x380a)
> +#define OV1063X_TIMING_HTS			OV1063X_REG_16BIT(0x380c)
> +#define OV1063X_TIMING_VTS			OV1063X_REG_16BIT(0x380e)
> +#define OV1063X_TIMING_ISP_X_WIN		OV1063X_REG_16BIT(0x3810)
> +#define OV1063X_TIMING_ISP_Y_WIN		OV1063X_REG_16BIT(0x3812)
> +#define OV1063X_TIMING_CTRL15			OV1063X_REG_8BIT(0x3815)
> +#define OV1063X_TIMING_CTRL15_BLACK_LINE_HREF	BIT(7)
> +#define OV1063X_TIMING_CTRL15_RIP_SOF		BIT(5)
> +#define OV1063X_TIMING_CTRL15_BLACK_LINES(n)	((n) << 0)
> +#define OV1063X_TIMING_CTRL1C			OV1063X_REG_8BIT(0x381c)
> +#define OV1063X_TIMING_CTRL1C_VFLIP_DIG		BIT(7)
> +#define OV1063X_TIMING_CTRL1C_VFLIP_ARRAY	BIT(6)
> +#define OV1063X_TIMING_CTRL1C_VSUB4		BIT(1)
> +#define OV1063X_TIMING_CTRL1C_VSUB2		BIT(0)
> +#define OV1063X_TIMING_CTRL1D			OV1063X_REG_8BIT(0x381d)
> +#define OV1063X_TIMING_CTRL1D_VFLIP_BLACK_LINE	BIT(7)
> +#define OV1063X_TIMING_CTRL1D_WDR		BIT(6)
> +#define OV1063X_TIMING_CTRL1D_HFLIP_DIG		BIT(1)
> +#define OV1063X_TIMING_CTRL1D_HFLIP_ARRAY	BIT(0)
> +#define OV1063X_TIMING_CTRL24			OV1063X_REG_8BIT(0x3824)
> +#define OV1063X_VSTART_OFFSET			OV1063X_REG_16BIT(0x381e)
> +#define OV1063X_TIMING_TC_CS_RST		OV1063X_REG_16BIT(0x3832)
> +#define OV1063X_TIMING_TC_R_RST			OV1063X_REG_16BIT(0x3834)
> +
> +#define OV1063X_START_LINE			OV1063X_REG_8BIT(0x4001)
> +#define OV1063X_LINE_NUM			OV1063X_REG_8BIT(0x4004)	/* Black lines */
> +#define OV1063X_BLC_CTRL05			OV1063X_REG_8BIT(0x4005)
> +#define OV1063X_BLC_CTRL05_ONE_LINE_MODE	BIT(5)
> +#define OV1063X_BLC_CTRL05_REMOVE_BLACK_LINE	BIT(4)
> +#define OV1063X_BLC_CTRL05_ONE_MAN_OFFSET_MODE	BIT(3)
> +#define OV1063X_BLC_CTRL05_BL_RBLUE_RVS		BIT(2)
> +#define OV1063X_BLC_CTRL05_BLC_ALWAYS_DO	BIT(1)
> +#define OV1063X_BLC_AVG_CTRL1			OV1063X_REG_8BIT(0x4050)
> +#define OV1063X_BLC_AVG_CTRL2			OV1063X_REG_8BIT(0x4051)
> +#define OV1063X_BLC_OFFSET_TOP_LIMIT		OV1063X_REG_16BIT(0x4056)
> +#define OV1063X_BLC_OFFSET_BOT_LIMIT		OV1063X_REG_16BIT(0x4058)
> +#define OV1063X_BLC_CTRL5A			OV1063X_REG_8BIT(0x405a)
> +
> +#define OV1063X_FC_R2				OV1063X_REG_8BIT(0x4202)
> +
> +#define OV1063X_FORMAT_CTRL00			OV1063X_REG_8BIT(0x4300)
> +#define OV1063X_FORMAT_YUYV			0x38
> +#define OV1063X_FORMAT_YYYU			0x39
> +#define OV1063X_FORMAT_UYVY			0x3a
> +#define OV1063X_FORMAT_VYUY			0x3b
> +#define OV1063X_FORMAT_YMAX			OV1063X_REG_16BIT(0x4302)
> +#define OV1063X_FORMAT_YMIN			OV1063X_REG_16BIT(0x4304)
> +#define OV1063X_FORMAT_UMAX			OV1063X_REG_16BIT(0x4306)
> +#define OV1063X_FORMAT_UMIN			OV1063X_REG_16BIT(0x4308)
> +
> +#define OV1063X_VFIFO_LLEN_FIRS1_SEL		OV1063X_REG_8BIT(0x4605)
> +#define OV1063X_VFIFO_LLEN_FIRS1_SEL_8B_YUV	BIT(3)
> +#define OV1063X_VFIFO_LINE_LENGTH_MAN		OV1063X_REG_16BIT(0x4606)
> +#define OV1063X_VFIFO_READ_START		OV1063X_REG_16BIT(0x4608)
> +#define OV1063X_VFIFO_HSYNC_START_POSITION	OV1063X_REG_16BIT(0x460a)
> +#define OV1063X_VFIFO_HSYNC_CTRL		OV1063X_REG_8BIT(0x460c)
> +#define OV1063X_VFIFO_HSYNC_CTRL_HEADER_WIDTH(n)	((n) << 4)
> +#define OV1063X_VFIFO_HSYNC_CTRL_TRAILER_WIDTH(n)	((n) << 0)
> +#define OV1063X_VFIFO_EMBD_LINE_CTRL		OV1063X_REG_8BIT(0x460e)
> +#define OV1063X_VFIFO_EMBD_LINE_CTRL_SOF_CLR_RAM	BIT(3)
> +#define OV1063X_VFIFO_EMBD_LINE_CTRL_ST_MOD	BIT(2)
> +#define OV1063X_VFIFO_EMBD_LINE_CTRL_EMBD_ROM	BIT(1)
> +#define OV1063X_VFIFO_EMBD_LINE_CTRL_EMBD_EN	BIT(0)
> +#define OV1063X_VFIFO_EMBD_LINE_NUM		OV1063X_REG_8BIT(0x460f)
> +#define OV1063X_EMB_START_PCNT			OV1063X_REG_16BIT(0x4610)
> +#define OV1063X_EMB_START_LCNT			OV1063X_REG_16BIT(0x4612)
> +#define OV1063X_ROI_CTRL0			OV1063X_REG_8BIT(0x4620)
> +#define OV1063X_ROI_CTRL0_SYNC_BYP		BIT(7)
> +#define OV1063X_ROI_CTRL0_FR_COMP		BIT(6)
> +#define OV1063X_ROI_CTRL0_FULL_DAT_MOD		BIT(5)
> +#define OV1063X_ROI_CTRL0_EN_3			BIT(3)
> +#define OV1063X_ROI_CTRL0_EN_2			BIT(2)
> +#define OV1063X_ROI_CTRL0_EN_1			BIT(1)
> +#define OV1063X_ROI_CTRL0_FUNC_E		BIT(0)
> +
> +#define OV1063X_DVP_MOD_SEL			OV1063X_REG_8BIT(0x4700)
> +#define OV1063X_DVP_MOD_SEL_CCIR_V		BIT(3)
> +#define OV1063X_DVP_MOD_SEL_CCIR_F		BIT(2)
> +#define OV1063X_DVP_MOD_SEL_CCIR_656		BIT(1)
> +#define OV1063X_DVP_MOD_SEL_HSYNC		BIT(0)
> +#define OV1063X_DVP_VSYNC_WIDTH			OV1063X_REG_8BIT(0x4701)
> +#define OV1063X_DVP_HSYVSY_NEG_WIDTH		OV1063X_REG_16BIT(0x4702)
> +#define OV1063X_DVP_VSYNC_MODE			OV1063X_REG_8BIT(0x4704)
> +#define OV1063X_DVP_VSYNC_MODE_VSYNCOUT_SEL(n)	((n) << 2)
> +#define OV1063X_DVP_VSYNC_MODE_VSYNC3_MOD	BIT(1)
> +#define OV1063X_DVP_VSYNC_MODE_VSYNC2_MOD	BIT(0)
> +#define OV1063X_DVP_EOF_VSYNC_DELAY		OV1063X_REG_24BIT(0x4705)
> +
> +#define OV1063X_ISP_RW00			OV1063X_REG_8BIT(0x5000)
> +#define OV1063X_ISP_RW00_COLOR_MATRIX_EN	BIT(7)
> +#define OV1063X_ISP_RW00_COLOR_INTERP_EN	BIT(6)
> +#define OV1063X_ISP_RW00_DENOISE_EN		BIT(5)
> +#define OV1063X_ISP_RW00_WHITE_DPC_EN		BIT(4)	/* White defect pixel correction enable */
> +#define OV1063X_ISP_RW00_BLACK_DPC_EN		BIT(3)	/* Black defect pixel connection enable */
> +#define OV1063X_ISP_RW00_AWB_STATS_EN		BIT(2)
> +#define OV1063X_ISP_RW00_AWB_GAIN_EN		BIT(1)
> +#define OV1063X_ISP_RW00_LSC_EN			BIT(0)
> +#define OV1063X_ISP_RW01			OV1063X_REG_8BIT(0x5001)
> +#define OV1063X_ISP_RW01_DATA_WEIGHT_SYNC_EN	BIT(7)
> +#define OV1063X_ISP_RW01_BLACK_WHITE_MODE_EN	BIT(6)
> +#define OV1063X_ISP_RW01_DARK_LEVEL_FILTER_EN	BIT(5)
> +#define OV1063X_ISP_RW01_BUFFER_CONTROL_EN	BIT(4)
> +#define OV1063X_ISP_RW01_AEC_EN			BIT(3)
> +#define OV1063X_ISP_RW01_TONE_MAPPING_EN	BIT(2)
> +#define OV1063X_ISP_RW01_NORMALIZE_EN		BIT(1)
> +#define OV1063X_ISP_RW01_LONG_SHORT_COMB_EN	BIT(0)
> +#define OV1063X_ISP_RW02			OV1063X_REG_8BIT(0x5002)
> +#define OV1063X_ISP_RW02_OTP_MANUAL_OFFSET_EN	BIT(7)
> +#define OV1063X_ISP_RW02_OTP_EN			BIT(6)
> +#define OV1063X_ISP_RW02_INTER_FRAME_CALC	BIT(5)
> +#define OV1063X_ISP_RW02_CT_AWB_EN		BIT(4)
> +#define OV1063X_ISP_RW02_DIGITAL_GAIN_EN	BIT(3)
> +#define OV1063X_ISP_RW02_WINDOW_BORDER_CUT_EN	BIT(2)
> +#define OV1063X_ISP_RW02_DITHERING_EN		BIT(1)
> +#define OV1063X_ISP_RW02_LSLS			(0U << 0)
> +#define OV1063X_ISP_RW02_SLSL			(1U << 0)
> +#define OV1063X_ISP_RW05			OV1063X_REG_8BIT(0x5005)
> +#define OV1063X_ISP_RW05_VERT_SUB_EN		BIT(7)	/* Enable vertical subsampling */
> +#define OV1063X_ISP_RW05_LSC_CENTER_AUTO	BIT(6)	/* Set LSC center automatically based on image window */
> +#define OV1063X_ISP_RW05_SUB_OUT_ROW_2ND	BIT(5)	/* Output 2nd (1) or 1st (0) row when skipping */
> +#define OV1063X_ISP_RW05_SUB_OUT_COL_2ND	BIT(4)	/* Output 2nd (1) or 1st (0) column when skipping */
> +#define OV1063X_ISP_RW05_SUB_AVG		BIT(3)	/* Average (1) or sum (0) when binning */
> +#define OV1063X_ISP_RW05_SUB_G_DROP		BIT(2)	/* Skip (1) or bin (0) Green / Y */
> +#define OV1063X_ISP_RW05_SUB_RB_DROP		BIT(1)	/* Skip (1) or bin (0) Red Blue / UV */
> +#define OV1063X_ISP_RW05_SUB_ENABLE		BIT(0)	/* Enable sub-sampling */
> +#define OV1063X_ISP_RW06			OV1063X_REG_8BIT(0x5006)
> +#define OV1063X_ISP_RW06_RAW_MODE_MAN(n)	((n) << 6)
> +#define OV1063X_ISP_RW06_YUV_MODE_MAN(n)	((n) << 4)
> +#define OV1063X_ISP_RW06_RAW_MODE_MAN_EN	BIT(3)
> +#define OV1063X_ISP_RW06_YUV_MODE_MAN_EN	BIT(2)
> +#define OV1063X_ISP_CTRL3D			OV1063X_REG_8BIT(0x503d)
> +#define OV1063X_ISP_CTRL3D_TEST_PATTERN_EN	BIT(7)
> +#define OV1063X_ISP_CTRL3D_COLOR_BAR(n)		((n) << 4)
> +#define OV1063X_ISP_CTRL3D_ROLLING_BAR_EN	BIT(2)
> +#define OV1063X_ISP_CTRL3E			OV1063X_REG_8BIT(0x503e)
> +#define OV1063X_ISP_CTRL3E_SQUARE_BW		BIT(3)
> +#define OV1063X_ISP_CTRL3E_TRANSPARENT_EN	BIT(2)
> +#define OV1063X_ISP_CTRL3E_PATTERN_BARS		(0U << 0)
> +#define OV1063X_ISP_CTRL3E_PATTERN_RANDOM	(1U << 0)
> +#define OV1063X_ISP_CTRL3E_PATTERN_SQUARES	(2U << 0)
> +
> +#define OV1063X_GAIN_AWB_MAN_GAIN_B_LONG	OV1063X_REG_16BIT(0x5100)
> +#define OV1063X_GAIN_AWB_MAN_GAIN_GB_LONG	OV1063X_REG_16BIT(0x5102)
> +#define OV1063X_GAIN_AWB_MAN_GAIN_GR_LONG	OV1063X_REG_16BIT(0x5104)
> +#define OV1063X_GAIN_AWB_MAN_GAIN_R_LONG	OV1063X_REG_16BIT(0x5106)
> +#define OV1063X_GAIN_AWB_MAN_OFFSET_B_LONG	OV1063X_REG_16BIT(0x5108)
> +#define OV1063X_GAIN_AWB_MAN_OFFSET_GB_LONG	OV1063X_REG_16BIT(0x510a)
> +#define OV1063X_GAIN_AWB_MAN_OFFSET_GR_LONG	OV1063X_REG_16BIT(0x510c)
> +#define OV1063X_GAIN_AWB_MAN_OFFSET_R_LONG	OV1063X_REG_16BIT(0x510e)
> +#define OV1063X_GAIN_AWB_MAN_GAIN_B_SHORT	OV1063X_REG_16BIT(0x5110)
> +#define OV1063X_GAIN_AWB_MAN_GAIN_GB_SHORT	OV1063X_REG_16BIT(0x5112)
> +#define OV1063X_GAIN_AWB_MAN_GAIN_GR_SHORT	OV1063X_REG_16BIT(0x5114)
> +#define OV1063X_GAIN_AWB_MAN_GAIN_R_SHORT	OV1063X_REG_16BIT(0x5116)
> +#define OV1063X_GAIN_AWB_MAN_OFFSET_B_SHORT	OV1063X_REG_16BIT(0x5118)
> +#define OV1063X_GAIN_AWB_MAN_OFFSET_GB_SHORT	OV1063X_REG_16BIT(0x511a)
> +#define OV1063X_GAIN_AWB_MAN_OFFSET_GR_SHORT	OV1063X_REG_16BIT(0x511c)
> +#define OV1063X_GAIN_AWB_MAN_OFFSET_R_SHORT	OV1063X_REG_16BIT(0x511e)
> +#define OV1063X_GAIN_AWB_CTRL32			OV1063X_REG_8BIT(0x5120)
> +#define OV1063X_GAIN_AWB_CTRL32_MANUAL_EN	BIT(0)
> +
> +#define OV1063X_DNS_NOISE_Y_LIST_LONG(n)	OV1063X_REG_8BIT(0x521a + (n))
> +#define OV1063X_DNS_NOISE_UV_LIST_LONG(n)	OV1063X_REG_16BIT(0x5222 + (n) * 2)
> +#define OV1063X_DNS_GBGR_EXTRA_SHORT		OV1063X_REG_8BIT(0x5241)
> +#define OV1063X_DNS_NOISE_Y_LIST_SHORT(n)	OV1063X_REG_8BIT(0x5242 + (n))
> +#define OV1063X_DNS_NOISE_UV_LIST_SHORT(n)	OV1063X_REG_16BIT(0x5249 + (n) * 2)
> +#define OV1063X_CIP_UNSHARPEN_MASK_LONG(n)	OV1063X_REG_8BIT(0x5288 + (n))
> +#define OV1063X_CIP_MAX_SHARPEN_LONG		OV1063X_REG_8BIT(0x528d)
> +#define OV1063X_CIP_SHARPEN_ALPHA_LONG		OV1063X_REG_8BIT(0x5293)
> +#define OV1063X_CIP_UNSHARPEN_MASK_SHORT(n)	OV1063X_REG_8BIT(0x52c8 + (n))
> +#define OV1063X_CIP_MAX_SHARPEN_SHORT		OV1063X_REG_8BIT(0x52cd)
> +#define OV1063X_CIP_SHARPEN_ALPHA_SHORT		OV1063X_REG_8BIT(0x52d3)
> +#define OV1063X_CIP_HFREQ_COEF_SHORT		OV1063X_REG_8BIT(0x52d7)
> +
> +#define OV1063X_LLF_MAX_LOW_LEVEL		OV1063X_REG_16BIT(0x5381)
> +
> +#define OV1063X_AWB_CT_CTRL1			OV1063X_REG_8BIT(0x5581)
> +#define OV1063X_AWB_CT_CTRL1_GAIN_STEP_NORMAL(n)	((n) << 6)
> +#define OV1063X_AWB_CT_CTRL1_GAIN_STEP_FAST(n)	((n) << 4)
> +#define OV1063X_AWB_CT_CTRL1_SCALE_LONG_2X	(0 << 2)
> +#define OV1063X_AWB_CT_CTRL1_SCALE_LONG_4X	(1 << 2)
> +#define OV1063X_AWB_CT_CTRL1_SCALE_LONG_8X	(2 << 2)
> +#define OV1063X_AWB_M_RNG_LONG			OV1063X_REG_8BIT(0x5586)
> +#define OV1063X_AWB_L_XRNG_LONG			OV1063X_REG_8BIT(0x5587)
> +#define OV1063X_AWB_H_YRNG_LONG			OV1063X_REG_8BIT(0x5588)
> +#define OV1063X_AWB_M_X_LONG			OV1063X_REG_8BIT(0x5589)
> +#define OV1063X_AWB_M_Y_LONG			OV1063X_REG_8BIT(0x558a)
> +#define OV1063X_AWB_L_K_LONG			OV1063X_REG_8BIT(0x558b)
> +#define OV1063X_AWB_H_K_LONG			OV1063X_REG_8BIT(0x558c)
> +#define OV1063X_AWB_H_LMT_LONG			OV1063X_REG_8BIT(0x558d)
> +#define OV1063X_AWB_L_LMT_LONG			OV1063X_REG_8BIT(0x558e)
> +#define OV1063X_AWB_DATA_ULMT_LONG		OV1063X_REG_8BIT(0x5591)
> +#define OV1063X_AWB_DATA_LLMT_LONG		OV1063X_REG_8BIT(0x5592)
> +#define OV1063X_AWB_M_RNG_SHORT			OV1063X_REG_8BIT(0x559f)
> +#define OV1063X_AWB_L_XRNG_SHORT		OV1063X_REG_8BIT(0x55a0)
> +#define OV1063X_AWB_H_YRNG_SHORT		OV1063X_REG_8BIT(0x55a1)
> +#define OV1063X_AWB_M_X_SHORT			OV1063X_REG_8BIT(0x55a2)
> +#define OV1063X_AWB_M_Y_SHORT			OV1063X_REG_8BIT(0x55a3)
> +#define OV1063X_AWB_L_K_SHORT			OV1063X_REG_8BIT(0x55a4)
> +#define OV1063X_AWB_H_K_SHORT			OV1063X_REG_8BIT(0x55a5)
> +#define OV1063X_AWB_H_LMT_SHORT			OV1063X_REG_8BIT(0x55a6)
> +#define OV1063X_AWB_L_LMT_SHORT			OV1063X_REG_8BIT(0x55a7)
> +#define OV1063X_AWB_DATA_ULMT_SHORT		OV1063X_REG_8BIT(0x55aa)
> +#define OV1063X_AWB_DATA_LLMT_SHORT		OV1063X_REG_8BIT(0x55ab)
> +
> +#define OV1063X_AEC_CTRL07			OV1063X_REG_16BIT(0x5607)
> +#define OV1063X_AEC_WIN_LEFT_LONG		OV1063X_REG_16BIT(0x5609)
> +#define OV1063X_AEC_WIN_LEFT_SHORT		OV1063X_REG_16BIT(0x560b)
> +#define OV1063X_AEC_WIN_TOP_LONG		OV1063X_REG_16BIT(0x560d)
> +#define OV1063X_AEC_WIN_TOP_SHORT		OV1063X_REG_16BIT(0x560f)
> +#define OV1063X_AEC_WIN_WIDTH_LONG		OV1063X_REG_16BIT(0x5611)
> +#define OV1063X_AEC_WIN_WIDTH_SHORT		OV1063X_REG_16BIT(0x5613)
> +#define OV1063X_AEC_WIN_HEIGHT_LONG		OV1063X_REG_16BIT(0x5615)
> +#define OV1063X_AEC_WIN_HEIGHT_SHORT		OV1063X_REG_16BIT(0x5617)
> +#define OV1063X_AEC_WEIGHT_SHORT(n)		OV1063X_REG_8BIT(0x563b + (n))
> +#define OV1063X_AEC_FINAL_SATURATE_THRESH	OV1063X_REG_16BIT(0x5651)
> +#define OV1063X_AEC_CTRLD0			OV1063X_REG_8BIT(0x56d0)
> +#define OV1063X_AEC_CTRLD0_R_MAN_EN(n)		((n) << 0)
> +#define OV1063X_AEC_CTRLD5			OV1063X_REG_32BIT(0x56d5)	/* r_exp_l_m */
> +#define OV1063X_AEC_CTRLD9			OV1063X_REG_32BIT(0x56d9)	/* r_exp_s_m */
> +#define OV1063X_AEC_CTRLE8			OV1063X_REG_16BIT(0x56e8)	/* r_snrgain_l_m */
> +#define OV1063X_AEC_CTRLEA			OV1063X_REG_16BIT(0x56ea)	/* r_snrgain_s_m */
> +
> +#define OV1063X_TPM_SLOPE(n)			OV1063X_REG_8BIT(0x6700 + (n))
> +#define OV1063X_TPM_OFFSET(n)			OV1063X_REG_8BIT(0x6702 + (n))
> +#define OV1063X_TPM_CTRL6			OV1063X_REG_8BIT(0x6706)
> +#define OV1063X_TPM_CTRL6_CLK_DIV(n)		((n) << 0)
> +
> +#define OV1063X_GROUP_WRITER_COMMAND		OV1063X_REG_8BIT(0x6f00)
> +#define OV1063X_GROUP_WRITER_COMMAND_OP(n)	((n) << 6)
> +#define OV1063X_GROUP_WRITER_COMMAND_ID(n)	((n) << 4)
> +#define OV1063X_GROUP_WRITER_COMMAND_EN		(3U << 0)
> +#define OV1063X_PARI_ADDR_MIN			OV1063X_REG_16BIT(0x6f06)
> +#define OV1063X_PARI_ADDR_MAX			OV1063X_REG_16BIT(0x6f0a)
> +
> +#define OV1063X_EMB_LINE_EN			OV1063X_REG_8BIT(0x6800)
> +#define OV1063X_EMB_LINE_EN_ENABLE		BIT(0)
> +#define OV1063X_EMB_SIZE_MANU_EN		OV1063X_REG_8BIT(0x6804)
> +#define OV1063X_EMB_SIZE_EN_ENABLE		BIT(0)
> +#define OV1063X_EMB_SIZE_MANU			OV1063X_REG_16BIT(0x6805)
> +
> +#define OV1063X_HORIZ_COLORCORRECT		OV1063X_REG_8BIT(0x6900)
> +#define OV1063X_HORIZ_COLORCORRECT_ON		BIT(0)
> +
> +#define OV1063X_AEC_TARGET_NUM			OV1063X_REG_8BIT(0xc450)
> +#define OV1063X_AEC_TARGET_NUM_AA_MODE		(1U << 0)
> +#define OV1063X_AEC_TARGET_NUM_AB_MODE		(2U << 0)
> +#define OV1063X_AEC_TARGET_NUM_ABC_MODE		(3U << 0)
> +#define OV1063X_AEC_LS_SENS_RATIO		OV1063X_REG_16BIT(0xc452)
> +#define OV1063X_AEC_NONWDR_EN			OV1063X_REG_8BIT(0xc454)
> +#define OV1063X_AEC_NONWDR_SWITCH		OV1063X_REG_8BIT(0xc455)
> +#define OV1063X_AEC_FIXED_RATIO_EN		OV1063X_REG_8BIT(0xc456)
> +#define OV1063X_AEC_GP_MODE_EN			OV1063X_REG_8BIT(0xc457)
> +#define OV1063X_AEC_NIGHT_MODE_EN		OV1063X_REG_8BIT(0xc458)
> +#define OV1063X_AEC_NIGHT_MODE_CTRL		OV1063X_REG_8BIT(0xc459)
> +#define OV1063X_AEC_NIGHT_MODE_CTRL_INSERT	BIT(0)
> +#define OV1063X_AEC_FRACTAL_EXP_EN		OV1063X_REG_8BIT(0xc45a)
> +#define OV1063X_AEC_NONLINEAR_GAIN_EN		OV1063X_REG_8BIT(0xc45b)
> +#define OV1063X_AEC_MANU_GAMMA_EN		OV1063X_REG_8BIT(0xc45c)
> +#define OV1063X_AEC_HOLD_BAND_EN		OV1063X_REG_8BIT(0xc45d)
> +#define OV1063X_AEC_BAND_FILTER_FLAG		OV1063X_REG_8BIT(0xc45e)
> +#define OV1063X_AEC_BAND_FILTER_FLAG_0HZ	(0U << 0)
> +#define OV1063X_AEC_BAND_FILTER_FLAG_60HZ	(1U << 0)
> +#define OV1063X_AEC_BAND_FILTER_FLAG_50HZ	(2U << 0)
> +#define OV1063X_AEC_BAND_FILTER_EN		OV1063X_REG_8BIT(0xc45f)
> +#define OV1063X_AEC_BAND_FILTER_SHORT		OV1063X_REG_8BIT(0xc460)
> +#define OV1063X_AEC_LESS_1BAND_EN		OV1063X_REG_8BIT(0xc461)
> +#define OV1063X_AEC_LESS_1BAND_SHORT		OV1063X_REG_8BIT(0xc462)
> +#define OV1063X_AEC_WDR_GAIN_LIMIT_EN		OV1063X_REG_8BIT(0xc463)
> +#define OV1063X_AEC_LOG_TARGET(n)		OV1063X_REG_16BIT(0xc464 + (n) * 2)
> +#define OV1063X_AEC_TARGET_LONG(n)		OV1063X_REG_8BIT(0xc46a + (n))
> +#define OV1063X_AEC_TARGET_SHORT(n)		OV1063X_REG_8BIT(0xc46d + (n))
> +#define OV1063X_AEC_MAX_SHORT_LE		OV1063X_REG_32BIT(0xc47c)
> +#define OV1063X_AEC_MAX_GAIN_LONG		OV1063X_REG_16BIT(0xc480)
> +#define OV1063X_AEC_MAX_GAIN_SHORT		OV1063X_REG_16BIT(0xc482)
> +#define OV1063X_AEC_MIN_GAIN_LONG		OV1063X_REG_16BIT(0xc484)
> +#define OV1063X_AEC_MIN_GAIN_SHORT		OV1063X_REG_16BIT(0xc486)
> +#define OV1063X_AEC_MAX_EXP_LONG		OV1063X_REG_16BIT(0xc488)
> +#define OV1063X_AEC_MAX_EXP_SHORT		OV1063X_REG_16BIT(0xc48a)
> +#define OV1063X_AEC_MIN_EXP_LONG		OV1063X_REG_16BIT(0xc48c)
> +#define OV1063X_AEC_MIN_EXP_SHORT		OV1063X_REG_16BIT(0xc48e)
> +#define OV1063X_AEC_FIXED_RATIO			OV1063X_REG_8BIT(0xc490)
> +#define OV1063X_AEC_GP_MODE_RATIO_B2A		OV1063X_REG_8BIT(0xc492)
> +#define OV1063X_AEC_GP_MODE_RATIO_C2A		OV1063X_REG_8BIT(0xc493)
> +#define OV1063X_AEC_MIN_GAMMA_LIST(n)		OV1063X_REG_16BIT(0xc498 + (n) * 2)
> +#define OV1063X_AEC_MAX_GAMMA_LIST(n)		OV1063X_REG_16BIT(0xc49e + (n) * 2)
> +#define OV1063X_AEC_DR_LIST(n)			OV1063X_REG_16BIT(0xc4a4 + (n) * 2)
> +#define OV1063X_AEC_BAND_VALUE_60HZ		OV1063X_REG_16BIT(0xc4aa)
> +#define OV1063X_AEC_BAND_VALUE_50HZ		OV1063X_REG_16BIT(0xc4ac)
> +
> +#define OV1063X_AWB_SIMPLE_MIN_NUM		OV1063X_REG_16BIT(0xc4cc)
> +#define OV1063X_AWB_CT_MIN_NUM			OV1063X_REG_16BIT(0xc4ce)
> +
> +#define OV1063X_VTS_ADDR			OV1063X_REG_16BIT(0xc518)
> +#define OV1063X_HTS_ADDR			OV1063X_REG_16BIT(0xc51a)
> +
> +#include "ov1063x_regs.h"
> +
> +/* IDs */
> +#define OV10633_VERSION_REG			0xa630
> +#define OV10635_VERSION_REG			0xa635
> +
> +enum ov1063x_model {
> +	SENSOR_OV10633,
> +	SENSOR_OV10635,
> +};
> +
> +enum ov1063x_streaming_state {
> +	OV1063X_STREAM_OFF = 0,
> +	OV1063X_STREAM_STARTING,
> +	OV1063X_STREAM_ON,
> +};
> +
> +#define OV1063X_SENSOR_WIDTH			1312
> +#define OV1063X_SENSOR_HEIGHT			814
> +
> +struct ov1063x_priv {
> +	struct device			*dev;
> +
> +	struct regmap			*regmap;
> +	struct clk			*clk;
> +	struct gpio_desc		*reset_gpio;
> +	struct gpio_desc		*pwdn_gpio;
> +
> +	int				model;
> +	const char			*name;
> +	unsigned long			clk_rate;
> +
> +	struct v4l2_subdev		subdev;
> +	struct media_pad		pad;
> +
> +	struct v4l2_ctrl_handler	hdl;
> +
> +	/*
> +	 * The streaming and format fields are protected by the control handler
> +	 * lock.
> +	 */
> +	enum ov1063x_streaming_state	streaming;
> +	struct v4l2_rect		analog_crop;
> +	struct v4l2_rect		digital_crop;
> +	struct v4l2_mbus_framefmt	format;
> +
> +	unsigned int			fps_numerator;
> +	unsigned int			fps_denominator;
> +};
> +
> +/*
> + * TODO: Expose multiple subdevs to control cropping and subsampling separately
> + * from userspace instead of hardcoding resolutions.
> + *
> + * TODO: Resolutions with an analog crop rectangle width equal to 768 or higher
> + * don't work properly.
> + */
> +static const struct v4l2_area ov1063x_framesizes[] = {
> +	{
> +		.width		= 1280,
> +		.height		= 800,
> +	}, {
> +		.width		= 1280,
> +		.height		= 720,
> +	}, {
> +		.width		= 752,
> +		.height		= 480,
> +	}, {
> +		.width		= 640,
> +		.height		= 480,
> +	}, {
> +		.width		= 600,
> +		.height		= 400,
> +	}, {

I have an issue when 600x400 is requested on the ov10635 from the TI tree VIP
driver, on the am57xx-evm platform.

With this resolution (any bus format), output is very dark, we only see very
bright objects (light bulbs). It seems IPS doesn't drive exposure correctly
or ISP doesn't have the right parameters.

But while testing the colorbars, the output is also wrong:

Command:
# v4l2-ctl -d1 --set-ctrl test_pattern=1 --set-fmt-video=pixelformat=YUYV,width=600,height=400 --stream-to=out.raw --stream-count=10 --stream-poll --stream-mmap=20

https://people.freedesktop.org/~narmstrong/ov1065x-600-400-YUYV-colorbar.png

VIP log is:
[12324.323181] vin3a: vip_init_port: g_mbus_fmt subdev mbus_code: 2006 fourcc:NV12 size: 600x400
[12324.323211] vin3a: calc_format_size: fourcc:NV12 size: 600x400 bpl:608 img_size:364800
[12324.323211] vin3a-0: init_stream fourcc:NV12 size: 600x400 bpl:608 img_size:364800
[12324.323211] vin3a-0: init_stream vpdma data type: 0x02
[12324.323242] vin3a-0: vip_init_stream: stream instance 0x00000000c267b000
[12324.323455] vin3a-0: g_fmt fourcc:NV12 code: 2006 size: 600x400 bpl:608 img_size:364800
[12324.323455] vin3a-0: g_fmt vpdma data type: 0x02
[12324.323486] vin3a-0: enum_fmt index:0
[12324.323486] vin3a-0: enum_fmt fourcc:NV12
[12324.323486] vin3a-0: enum_fmt index:1
[12324.323516] vin3a-0: enum_fmt fourcc:UYVY
[12324.323516] vin3a-0: enum_fmt index:2
[12324.323516] vin3a-0: enum_fmt fourcc:YUYV
[12324.323547] vin3a-0: s_fmt input fourcc:YUYV size: 600x400 bpl:0 img_size:364800
[12324.323547] vin3a-0: try_fmt fourcc:YUYV size: 600x400
[12324.323547] vin3a-0: try_fmt loop:0 fourcc:YUYV size: 1280x800
[12324.323577] vin3a-0: try_fmt loop:0 found new larger: 1280x800
[12324.323577] vin3a-0: try_fmt loop:0 found at least larger: 1280x800
[12324.323577] vin3a-0: try_fmt loop:0 found new best: 1280x800
[12324.323577] vin3a-0: try_fmt loop:1 fourcc:YUYV size: 1280x720
[12324.323608] vin3a-0: try_fmt loop:1 found at least larger: 1280x720
[12324.323608] vin3a-0: try_fmt loop:1 found new best: 1280x720
[12324.323608] vin3a-0: try_fmt loop:2 fourcc:YUYV size: 752x480
[12324.323608] vin3a-0: try_fmt loop:2 found at least larger: 752x480
[12324.323638] vin3a-0: try_fmt loop:2 found new best: 752x480
[12324.323638] vin3a-0: try_fmt loop:3 fourcc:YUYV size: 640x480
[12324.323638] vin3a-0: try_fmt loop:3 found at least larger: 640x480
[12324.323638] vin3a-0: try_fmt loop:3 found new best: 640x480
[12324.323669] vin3a-0: try_fmt loop:4 fourcc:YUYV size: 600x400
[12324.323669] vin3a-0: try_fmt loop:4 found at least larger: 600x400
[12324.323669] vin3a-0: try_fmt loop:4 found new best: 600x400
[12324.323669] vin3a-0: try_fmt loop:4 found direct match: 600x400
[12324.323699] vin3a: calc_format_size: fourcc:YUYV size: 600x400 bpl:1200 img_size:480000
[12324.323699] vin3a-0: s_fmt try_fmt fourcc:YUYV size: 600x400 bpl:1200 img_size:480000
[12324.323699] vin3a-0: s_fmt fourcc:YUYV size: 600x400 bpl:1200 img_size:480000
[12324.323730] vin3a-0: s_fmt pix_to_mbus mbus_code: 2006 size: 600x400
[12324.323730] vin3a-0: s_fmt subdev fmt mbus_code: 2006 size: 600x400
[12324.323730] vin3a-0: s_fmt vpdma data type: 0x07

ov10635 is correctly set with 600x400 and VIP is pass-throught.

The image & colorbar is OK with any other framesizes requested to ov10635.

Is this a known issue ?

Neil

> +		.width		= 352,
> +		.height		= 288,
> +	}, {
> +		.width		= 320,
> +		.height		= 240,
> +	},
> +};
> +
> +static const u32 ov1063x_mbus_formats[] = {
> +	MEDIA_BUS_FMT_YUYV8_2X8,
> +	MEDIA_BUS_FMT_UYVY8_2X8,
> +	MEDIA_BUS_FMT_VYUY8_2X8,
> +	MEDIA_BUS_FMT_YVYU8_2X8,
> +};
> +
> +static inline struct ov1063x_priv *to_ov1063x(struct v4l2_subdev *sd)
> +{
> +	return container_of(sd, struct ov1063x_priv, subdev);
> +}
> +
> +/* -----------------------------------------------------------------------------
> + * Read/Write Helpers
> + */
> +
> +static int ov1063x_read(struct ov1063x_priv *priv, u32 reg, u32 *val)
> +{
> +	unsigned int len = (reg >> OV1063X_REG_SIZE_SHIFT) & 3;
> +	u16 addr = reg & OV1063X_REG_ADDR_MASK;
> +	unsigned int i;
> +	int ret;
> +
> +	*val = 0;
> +
> +	for (i = 0; i < len; ++i) {
> +		u32 byte;
> +
> +		ret = regmap_read(priv->regmap, addr, &byte);
> +		if (ret)
> +			return ret;
> +
> +		*val = (*val << 8) | byte;
> +		addr++;
> +	}
> +
> +	return 0;
> +}
> +
> +static int ov1063x_write(struct ov1063x_priv *priv, u32 reg, u32 val, int *err)
> +{
> +	unsigned int len = (reg >> OV1063X_REG_SIZE_SHIFT) & 7;
> +	u16 addr = reg & OV1063X_REG_ADDR_MASK;
> +	unsigned int shift = (len - 1) * 8;
> +	unsigned int i;
> +	int ret;
> +
> +	if (err && *err)
> +		return *err;
> +
> +	for (i = 0; i < len; ++i) {
> +		ret = regmap_write(priv->regmap, addr, (val >> shift) & 0xff);
> +		if (ret) {
> +			if (err)
> +				*err = ret;
> +			return ret;
> +		}
> +
> +		shift -= 8;
> +		addr++;
> +	}
> +
> +	return 0;
> +}
> +
> +static int ov1063x_write_array(struct ov1063x_priv *priv,
> +			       const struct ov1063x_reg *regs,
> +			       unsigned int nr_regs)
> +{
> +	unsigned int i;
> +	int ret;
> +
> +	for (i = 0; i < nr_regs; i++) {
> +		ret = ov1063x_write(priv, regs[i].reg, regs[i].val, NULL);
> +		if (ret)
> +			return ret;
> +	}
> +
> +	return 0;
> +}
> +
> +static int ov1063x_update(struct ov1063x_priv *priv, u32 reg, u32 mask, u32 val,
> +			  int *err)
> +{
> +	unsigned int len = (reg >> OV1063X_REG_SIZE_SHIFT) & 7;
> +	u16 addr = reg & OV1063X_REG_ADDR_MASK;
> +	unsigned int shift = (len - 1) * 8;
> +	unsigned int i;
> +	int ret;
> +
> +	if (err && *err)
> +		return *err;
> +
> +	for (i = 0; i < len; ++i) {
> +		ret = regmap_update_bits(priv->regmap, addr,
> +					 (mask >> shift) & 0xff,
> +					 (val >> shift) & 0xff);
> +		if (ret) {
> +			if (err)
> +				*err = ret;
> +			return ret;
> +		}
> +
> +		shift -= 8;
> +		addr++;
> +	}
> +
> +	return 0;
> +}
> +
> +/* -----------------------------------------------------------------------------
> + * Hardware Configuration
> + */
> +
> +struct ov1063x_pll_config {
> +	unsigned int pre_div;
> +	unsigned int mult;
> +	unsigned int div;
> +	unsigned int clk_out;
> +};
> +
> +static int ov1063x_pll_setup(unsigned int clk_rate,
> +			     unsigned int *htsmin, unsigned int vts,
> +			     unsigned int fps_numerator,
> +			     unsigned int fps_denominator,
> +			     struct ov1063x_pll_config *cfg)
> +{
> +	unsigned int best_pclk = UINT_MAX;
> +	unsigned int best_pre_div_x2;
> +	unsigned int best_mult;
> +	unsigned int best_div;
> +	unsigned int best_hts;
> +	unsigned int max_pre_div_x2;
> +	unsigned int pre_div_x2;
> +	unsigned int hts;
> +
> +	/*
> +	 *  XVCLK --> pre-div -------> mult ----------> div --> output
> +	 * 6-27 MHz           3-27 MHz      200-500 MHz       Max 96 MHz
> +	 *
> +	 * Valid pre-divider values are 1, 1.5, 2, 3, 4, 5, 6 and 7, stored in
> +	 * registers as the index in this list of values.
> +	 *
> +	 * Valid multiplier values are [1, 63], stored as-is in registers.
> +	 *
> +	 * Valid divider values are 2 to 16 with a step of 2, stored in
> +	 * registers as (div / 2) - 1.
> +	 */
> +
> +	if (clk_rate < 6 * 1000 * 1000 || clk_rate > 27 * 1000 * 1000)
> +		return -EINVAL;
> +
> +	/*
> +	 * We try all valid combinations of settings for the 3 blocks to get
> +	 * the pixel clock, and from that calculate the actual hts/vts to use.
> +	 * The vts is extended so as to achieve the required frame rate.
> +	 */
> +
> +	/*
> +	 * The pre_div_x2 variable stores the pre-div value multiplied by 2, to
> +	 * support the fractional divider 1.5.
> +	 */
> +	max_pre_div_x2 = min(clk_rate * 2 / (3 * 1000 * 1000), 14U);
> +
> +	for (pre_div_x2 = 2; pre_div_x2 <= max_pre_div_x2;
> +	     pre_div_x2 += (pre_div_x2 < 4 ? 1 : 2)) {
> +		unsigned int clk1 = clk_rate * 2 / pre_div_x2;
> +		unsigned int min_mult;
> +		unsigned int max_mult;
> +		unsigned int mult;
> +
> +		if (clk1 < 3 * 1000 * 1000 || clk1 > 27 * 1000 * 1000)
> +			continue;
> +
> +		min_mult = DIV_ROUND_UP(200 * 1000 * 1000, clk1);
> +		max_mult = min(500 * 1000 * 1000 / clk1, 63U);
> +
> +		for (mult = min_mult; mult <= max_mult; mult++) {
> +			unsigned int clk2 = clk1 * mult;
> +			unsigned int min_div;
> +			unsigned int div;
> +
> +			min_div = DIV_ROUND_UP(clk2, 96 * 1000 * 1000);
> +			min_div = round_up(min_div, 2);
> +
> +			for (div = min_div; div <= 16; div += 2) {
> +				unsigned int pclk = clk2 / div;
> +				unsigned int min_pclk;
> +
> +				/*
> +				 * TODO: HTS calculation should ideally be split
> +				 * from the PLL calculations. This requires
> +				 * figuring out where the pclk / 300000 comes
> +				 * from.
> +				 */
> +				hts = *htsmin + pclk / (300*1000);
> +
> +				/* 2 clock cycles for every YUV422 pixel. */
> +				min_pclk = hts * vts / fps_denominator
> +					 * fps_numerator * 2;
> +				if (pclk < min_pclk)
> +					continue;
> +
> +				if (pclk < best_pclk) {
> +					best_pclk = pclk;
> +					best_hts = hts;
> +					best_pre_div_x2 = pre_div_x2;
> +					best_mult = mult;
> +					best_div = div;
> +				}
> +			}
> +		}
> +	}
> +
> +	if (best_pclk == UINT_MAX)
> +		return -EINVAL;
> +
> +	/* Store the mult, pre_div and div as register values. */
> +	cfg->mult = best_mult;
> +	cfg->pre_div = best_pre_div_x2 < 4 ? best_pre_div_x2 - 2
> +		     : best_pre_div_x2 / 2;
> +	cfg->div = (best_div / 2) - 1;
> +	cfg->clk_out = best_pclk;
> +
> +	*htsmin = best_hts;
> +
> +	return 0;
> +}
> +
> +static int ov1063x_isp_reset(struct ov1063x_priv *priv, bool reset)
> +{
> +	unsigned int i;
> +	int ret = 0;
> +
> +	if (!reset) {
> +		/*
> +		 * Enable ISP blocks. Why OV1063X_SC_SOC_CLKRST7 needs to be
> +		 * written 26 times is unknown.
> +		 */
> +		for (i = 0; i < 26; ++i)
> +			ov1063x_write(priv, OV1063X_SC_SOC_CLKRST7,
> +				      OV1063X_SC_SOC_CLKRST7_SCLK, &ret);
> +
> +		ov1063x_write(priv, OV1063X_SC_CMMN_CLKRST1,
> +			      OV1063X_SC_CMMN_CLKRST1_SCLK, &ret);
> +		ov1063x_write(priv, OV1063X_SC_CMMN_CLKRST2,
> +			      OV1063X_SC_CMMN_CLKRST2_PCLK_DVP |
> +			      OV1063X_SC_CMMN_CLKRST2_SCLK, &ret);
> +		ov1063x_write(priv, OV1063X_SC_CMMN_CLKRST0,
> +			      OV1063X_SC_CMMN_CLKRST0_SCLK, &ret);
> +	} else {
> +		/* Reset the ISP. */
> +		ov1063x_write(priv, OV1063X_SC_CMMN_CLKRST1,
> +			      OV1063X_SC_CMMN_CLKRST1_SCLK |
> +			      OV1063X_SC_CMMN_CLKRST1_RST, &ret);
> +		ov1063x_write(priv, OV1063X_SC_CMMN_CLKRST2,
> +			      OV1063X_SC_CMMN_CLKRST2_PCLK_DVP |
> +			      OV1063X_SC_CMMN_CLKRST2_SCLK |
> +			      OV1063X_SC_CMMN_CLKRST2_RST_DVP |
> +			      OV1063X_SC_CMMN_CLKRST2_RST, &ret);
> +		ov1063x_write(priv, OV1063X_SC_CMMN_CLKRST0,
> +			      OV1063X_SC_CMMN_CLKRST0_SCLK |
> +			      OV1063X_SC_CMMN_CLKRST0_RST, &ret);
> +	}
> +
> +	return ret;
> +}
> +
> +static int ov1063x_configure(struct ov1063x_priv *priv)
> +{
> +	struct ov1063x_pll_config pll_cfg;
> +	unsigned int width_pre_subsample;
> +	unsigned int nr_isp_pixels;
> +	unsigned int hts, vts;
> +	u32 val;
> +	int ret;
> +
> +	/* Minimum values for HTS anv VTS. */
> +	hts = priv->analog_crop.width + 200;
> +	vts = priv->analog_crop.height + 50;
> +
> +	/*
> +	 * Get the best PCLK and adjust HTS accordingly. Adjust VTS to get as
> +	 * close to the desired frame rate as we can.
> +	 */
> +	ret = ov1063x_pll_setup(priv->clk_rate, &hts, vts,
> +				priv->fps_numerator, priv->fps_denominator,
> +				&pll_cfg);
> +	if (ret < 0)
> +		return -EINVAL;
> +
> +	vts = pll_cfg.clk_out
> +	    / (hts * 2 * priv->fps_numerator / priv->fps_denominator);
> +
> +	dev_dbg(priv->dev, "active %ux%u (total %ux%u) %u/%u fps, @%u MP/s\n",
> +		priv->format.width, priv->format.height,
> +		hts, vts, priv->fps_numerator, priv->fps_denominator,
> +		pll_cfg.clk_out);
> +	dev_dbg(priv->dev, "PLL pre-div %u mult %u div %u\n",
> +		pll_cfg.pre_div, pll_cfg.mult, pll_cfg.div);
> +
> +	/* Reset the ISP and configure the PLL. */
> +	ret = ov1063x_isp_reset(priv, true);
> +
> +	ov1063x_write(priv, OV1063X_SC_CMMN_PLL_CTRL0, pll_cfg.mult, &ret);
> +	ov1063x_write(priv, OV1063X_SC_CMMN_PLL_CTRL1,
> +		      (pll_cfg.pre_div << 4) | pll_cfg.div, &ret);
> +
> +	/* Analog array configuration (including horizontal cropping) */
> +	switch (priv->analog_crop.width) {
> +	case OV1063X_SENSOR_WIDTH:
> +	default:
> +		val = 0x60 | OV1063X_ANA_ARRAY1_FULL
> +		    | OV1063X_ANA_ARRAY1_DELAY(3);
> +		break;
> +	case 768:
> +		val = 0x60 | OV1063X_ANA_ARRAY1_CROP_768
> +		    | OV1063X_ANA_ARRAY1_DELAY(3);
> +		break;
> +	case 656:
> +		val = 0x60 | OV1063X_ANA_ARRAY1_CROP_656
> +		    | OV1063X_ANA_ARRAY1_DELAY(3);
> +		break;
> +	}
> +
> +	ov1063x_write(priv, OV1063X_ANA_ARRAY1, val, &ret);
> +
> +	/* Sensor configuration */
> +	ov1063x_write(priv, OV1063X_SENSOR_RSTGOLOW,
> +		      (pll_cfg.clk_out + 1500000) / 3000000, &ret);
> +	ov1063x_write(priv, OV1063X_SENSOR_HLDWIDTH,
> +		      (pll_cfg.clk_out + 666666) / 1333333, &ret);
> +	ov1063x_write(priv, OV1063X_SENSOR_TXWIDTH,
> +		      (pll_cfg.clk_out + 961500) / 1923000, &ret);
> +
> +	/*
> +	 * Timings (including cropping)
> +	 *
> +	 * TODO: The vertical size is set to the height of the analog crop
> +	 * rectangle plus 4 pixels. This margin is probably used by the ISP for
> +	 * CFA interpolation, and should be moved to the crop rectangle height
> +	 * after investigating how the ISP operates.
> +	 */
> +	ov1063x_write(priv, OV1063X_TIMING_Y_START_ADDR,
> +		      priv->analog_crop.top, &ret);
> +	ov1063x_write(priv, OV1063X_TIMING_Y_END_ADDR,
> +		      priv->analog_crop.top + priv->analog_crop.height + 3,
> +		      &ret);
> +	ov1063x_write(priv, OV1063X_TIMING_ISP_X_WIN, priv->digital_crop.left,
> +		      &ret);
> +	ov1063x_write(priv, OV1063X_TIMING_ISP_Y_WIN, priv->digital_crop.top,
> +		      &ret);
> +	ov1063x_write(priv, OV1063X_TIMING_X_OUTPUT_SIZE, priv->format.width,
> +		      &ret);
> +	ov1063x_write(priv, OV1063X_TIMING_Y_OUTPUT_SIZE, priv->format.height,
> +		      &ret);
> +	ov1063x_write(priv, OV1063X_TIMING_HTS, hts, &ret);
> +	ov1063x_write(priv, OV1063X_TIMING_VTS, vts, &ret);
> +
> +	/*
> +	 * Sub-sampling. Horizontal sub-sampling is applied in the ISP, vertical
> +	 * sub-sampling in the pixel array.
> +	 */
> +	if (priv->format.width <= 640) {
> +		ov1063x_write(priv, OV1063X_ISP_RW05, OV1063X_ISP_RW05_SUB_AVG |
> +			      OV1063X_ISP_RW05_SUB_ENABLE, &ret);
> +		ov1063x_write(priv, OV1063X_SC_CMMN_PCLK_DIV_CTRL, 2, &ret);
> +	} else {
> +		ov1063x_write(priv, OV1063X_ISP_RW05, OV1063X_ISP_RW05_SUB_AVG,
> +			      &ret);
> +		ov1063x_write(priv, OV1063X_SC_CMMN_PCLK_DIV_CTRL, 1, &ret);
> +	}
> +
> +	if (ret < 0)
> +		return ret;
> +
> +	if (priv->format.height <= 400)
> +		ret = ov1063x_write_array(priv, ov1063x_regs_vert_sub2,
> +					  ARRAY_SIZE(ov1063x_regs_vert_sub2));
> +	else
> +		ret = ov1063x_write_array(priv, ov1063x_regs_vert_no_sub,
> +					  ARRAY_SIZE(ov1063x_regs_vert_no_sub));
> +
> +	/*
> +	 * AEC & AWB
> +	 *
> +	 * TODO: The number of pixels fed to the ISP is computed using the
> +	 * analog crop width and the vertical output size, to account for the
> +	 * fact that vertical sub-sampling is applied in the pixel array while
> +	 * horizontal sub-sampling is applied in the ISP. The 4 pixels margin
> +	 * seems incorrect when sub-sampling, as the vertical timing start and
> +	 * stop registers are programmed with a 4 pixels margin before
> +	 * sub-sampling, the ISP should thus receive a 2 pixels margin only.
> +	 * This needs to be investigated.
> +	 *
> +	 * TODO: When applying vertical digital crop, the output height is
> +	 * likely the wrong value to compute the total number of pixels fed to
> +	 * the ISP.
> +	 */
> +	val = (vts - 8) * 16;
> +	ov1063x_write(priv, OV1063X_AEC_MAX_EXP_LONG, val, &ret);
> +	ov1063x_write(priv, OV1063X_AEC_MAX_EXP_SHORT, val, &ret);
> +
> +	nr_isp_pixels = priv->analog_crop.width * (priv->format.height + 4);
> +	ov1063x_write(priv, OV1063X_AWB_SIMPLE_MIN_NUM, nr_isp_pixels / 256, &ret);
> +	ov1063x_write(priv, OV1063X_AWB_CT_MIN_NUM, nr_isp_pixels / 256, &ret);
> +	ov1063x_write(priv, OV1063X_REG_16BIT(0xc512), nr_isp_pixels / 16,
> +		      &ret);
> +
> +	ov1063x_write(priv, OV1063X_VTS_ADDR, vts, &ret);
> +	ov1063x_write(priv, OV1063X_HTS_ADDR, hts, &ret);
> +
> +	/* FIFO */
> +	ov1063x_write(priv, OV1063X_VFIFO_LLEN_FIRS1_SEL,
> +		      OV1063X_VFIFO_LLEN_FIRS1_SEL_8B_YUV, &ret);
> +	width_pre_subsample = priv->format.width <= 640
> +			    ? priv->format.width * 2 : priv->format.width;
> +	ov1063x_write(priv, OV1063X_VFIFO_LINE_LENGTH_MAN, 2 * hts, &ret);
> +	ov1063x_write(priv, OV1063X_VFIFO_HSYNC_START_POSITION,
> +		      2 * (hts - width_pre_subsample), &ret);
> +
> +	/* Output interface (DVP). */
> +	switch (priv->format.code) {
> +	case MEDIA_BUS_FMT_UYVY8_2X8:
> +		val = OV1063X_FORMAT_UYVY;
> +		break;
> +	case MEDIA_BUS_FMT_VYUY8_2X8:
> +		val = OV1063X_FORMAT_VYUY;
> +		break;
> +	case MEDIA_BUS_FMT_YUYV8_2X8:
> +		val = OV1063X_FORMAT_YUYV;
> +		break;
> +	case MEDIA_BUS_FMT_YVYU8_2X8:
> +		val = OV1063X_FORMAT_YYYU;
> +		break;
> +	default:
> +		val = OV1063X_FORMAT_UYVY;
> +		break;
> +	}
> +
> +	ov1063x_write(priv, OV1063X_FORMAT_CTRL00, val, &ret);
> +	ov1063x_write(priv, OV1063X_DVP_MOD_SEL, 0, &ret);
> +
> +	if (ret)
> +		return ret;
> +
> +	/* Take the ISP out of reset. */
> +	return ov1063x_isp_reset(priv, false);
> +}
> +
> +/* -----------------------------------------------------------------------------
> + * V4L2 Control Operations
> + */
> +
> +static const char * const ov1063x_test_pattern_menu[] = {
> +	"Disabled",
> +	"Color Bars, Plain",
> +	"Color Bars, Vertical Gradient",
> +	"Color Bars, Horizontal Gradient",
> +	"Color Bars, Repeating",
> +	"Random Data",
> +	"Squares, Color",
> +	"Squares, Black & White",
> +};
> +
> +struct ov1063x_tpg_config {
> +	u8 ctrl3d;
> +	u8 ctrl3e;
> +};
> +
> +static const struct ov1063x_tpg_config
> +ov1063x_tpg_configs[ARRAY_SIZE(ov1063x_test_pattern_menu) - 1] = {
> +	{
> +		.ctrl3d = OV1063X_ISP_CTRL3D_TEST_PATTERN_EN
> +			| OV1063X_ISP_CTRL3D_COLOR_BAR(0),
> +		.ctrl3e = OV1063X_ISP_CTRL3E_PATTERN_BARS,
> +	}, {
> +		.ctrl3d = OV1063X_ISP_CTRL3D_TEST_PATTERN_EN
> +			| OV1063X_ISP_CTRL3D_COLOR_BAR(1),
> +		.ctrl3e = OV1063X_ISP_CTRL3E_PATTERN_BARS,
> +	}, {
> +		.ctrl3d = OV1063X_ISP_CTRL3D_TEST_PATTERN_EN
> +			| OV1063X_ISP_CTRL3D_COLOR_BAR(2),
> +		.ctrl3e = OV1063X_ISP_CTRL3E_PATTERN_BARS,
> +	}, {
> +		.ctrl3d = OV1063X_ISP_CTRL3D_TEST_PATTERN_EN
> +			| OV1063X_ISP_CTRL3D_COLOR_BAR(3),
> +		.ctrl3e = OV1063X_ISP_CTRL3E_PATTERN_BARS,
> +	}, {
> +		.ctrl3d = OV1063X_ISP_CTRL3D_TEST_PATTERN_EN,
> +		.ctrl3e = OV1063X_ISP_CTRL3E_PATTERN_RANDOM,
> +	}, {
> +		.ctrl3d = OV1063X_ISP_CTRL3D_TEST_PATTERN_EN,
> +		.ctrl3e = OV1063X_ISP_CTRL3E_PATTERN_SQUARES,
> +	}, {
> +		.ctrl3d = OV1063X_ISP_CTRL3D_TEST_PATTERN_EN,
> +		.ctrl3e = OV1063X_ISP_CTRL3E_SQUARE_BW
> +			| OV1063X_ISP_CTRL3E_PATTERN_SQUARES,
> +	},
> +};
> +
> +static int ov1063x_tpg_setup(struct ov1063x_priv *priv, struct v4l2_ctrl *ctrl)
> +{
> +	const struct ov1063x_tpg_config *cfg;
> +	int ret = 0;
> +
> +	if (!ctrl->val)
> +		return ov1063x_write_array(priv, ov1063x_regs_colorbar_disable,
> +					   ARRAY_SIZE(ov1063x_regs_colorbar_disable));
> +
> +	if (!ctrl->cur.val || priv->streaming == OV1063X_STREAM_STARTING) {
> +		/*
> +		 * Only write the full settings when the test pattern was
> +		 * disabled or when we start streaming, not when we're just
> +		 * changing the test pattern type.
> +		 */
> +		ret = ov1063x_write_array(priv, ov1063x_regs_colorbar_enable,
> +					  ARRAY_SIZE(ov1063x_regs_colorbar_enable));
> +		if (ret < 0)
> +			return ret;
> +	}
> +
> +	cfg = &ov1063x_tpg_configs[ctrl->val - 1];
> +
> +	/* TODO: Add support for the moving bar overlay. */
> +	ov1063x_write(priv, OV1063X_ISP_CTRL3D, cfg->ctrl3d, &ret);
> +	ov1063x_write(priv, OV1063X_ISP_CTRL3E, cfg->ctrl3e, &ret);
> +
> +	return ret;
> +}
> +
> +static int ov1063x_s_ctrl(struct v4l2_ctrl *ctrl)
> +{
> +	struct ov1063x_priv *priv = container_of(ctrl->handler,
> +					struct ov1063x_priv, hdl);
> +	int ret = 0;
> +
> +	if (priv->streaming == OV1063X_STREAM_OFF)
> +		return 0;
> +
> +	switch (ctrl->id) {
> +	case V4L2_CID_VFLIP: {
> +		const u32 vflip = OV1063X_TIMING_CTRL1C_VFLIP_DIG
> +				| OV1063X_TIMING_CTRL1C_VFLIP_ARRAY;
> +
> +		return ov1063x_update(priv, OV1063X_TIMING_CTRL1C, vflip,
> +				      ctrl->val ? vflip : 0, NULL);
> +	}
> +
> +	case V4L2_CID_HFLIP: {
> +		const u32 hflip = OV1063X_TIMING_CTRL1D_HFLIP_DIG
> +				| OV1063X_TIMING_CTRL1D_HFLIP_ARRAY;
> +
> +		ov1063x_update(priv, OV1063X_HORIZ_COLORCORRECT,
> +			       OV1063X_HORIZ_COLORCORRECT_ON,
> +			       ctrl->val ? OV1063X_HORIZ_COLORCORRECT_ON : 0,
> +			       &ret);
> +		ov1063x_update(priv, OV1063X_TIMING_CTRL1D, hflip,
> +			       ctrl->val ? hflip : 0, &ret);
> +		return ret;
> +	}
> +
> +	case V4L2_CID_TEST_PATTERN:
> +		return ov1063x_tpg_setup(priv, ctrl);
> +	}
> +
> +	return -EINVAL;
> +}
> +
> +static const struct v4l2_ctrl_ops ov1063x_ctrl_ops = {
> +	.s_ctrl = ov1063x_s_ctrl,
> +};
> +
> +/* -----------------------------------------------------------------------------
> + * V4L2 Subdev Operations
> + */
> +
> +static int ov1063x_s_stream(struct v4l2_subdev *sd, int enable)
> +{
> +	struct ov1063x_priv *priv = to_ov1063x(sd);
> +	int ret = 0;
> +
> +	if (!enable) {
> +		ov1063x_write(priv, OV1063X_STREAM_MODE, 0, &ret);
> +		ov1063x_write(priv, OV1063X_SC_CMMN_CLKRST2,
> +			      OV1063X_SC_CMMN_CLKRST2_SCLK, &ret);
> +
> +		pm_runtime_mark_last_busy(priv->dev);
> +		pm_runtime_put_autosuspend(priv->dev);
> +
> +		mutex_lock(priv->hdl.lock);
> +		priv->streaming = OV1063X_STREAM_OFF;
> +		mutex_unlock(priv->hdl.lock);
> +
> +		return ret;
> +	}
> +
> +	mutex_lock(priv->hdl.lock);
> +
> +	/* Streaming needs to be true for ov1063x_s_ctrl() to proceed. */
> +	priv->streaming = OV1063X_STREAM_STARTING;
> +
> +	ret = pm_runtime_get_sync(priv->dev);
> +	if (ret < 0)
> +		goto done;
> +
> +	ret = ov1063x_configure(priv);
> +	if (ret < 0)
> +		goto done;
> +
> +	ret = __v4l2_ctrl_handler_setup(&priv->hdl);
> +	if (ret < 0)
> +		goto done;
> +
> +	ret = 0;
> +	ov1063x_write(priv, OV1063X_STREAM_MODE, OV1063X_STREAM_MODE_ON, &ret);
> +	ov1063x_write(priv, OV1063X_SC_CMMN_CLKRST2,
> +		      OV1063X_SC_CMMN_CLKRST2_PCLK_DVP |
> +		      OV1063X_SC_CMMN_CLKRST2_SCLK, &ret);
> +
> +	priv->streaming = OV1063X_STREAM_ON;
> +
> +done:
> +	if (ret < 0) {
> +		/*
> +		 * In case of error, turn the power off synchronously as the
> +		 * device likely has no other chance to recover.
> +		 */
> +		pm_runtime_put_sync(priv->dev);
> +		priv->streaming = OV1063X_STREAM_OFF;
> +	}
> +
> +	mutex_unlock(priv->hdl.lock);
> +
> +	return ret;
> +}
> +
> +static struct v4l2_mbus_framefmt *
> +__ov1063x_get_pad_format(struct ov1063x_priv *priv,
> +			 struct v4l2_subdev_state *state,
> +			 unsigned int pad, u32 which)
> +{
> +	switch (which) {
> +	case V4L2_SUBDEV_FORMAT_TRY:
> +		return v4l2_subdev_get_try_format(&priv->subdev, state, pad);
> +	case V4L2_SUBDEV_FORMAT_ACTIVE:
> +		return &priv->format;
> +	default:
> +		return NULL;
> +	}
> +}
> +
> +static int ov1063x_init_cfg(struct v4l2_subdev *sd,
> +			    struct v4l2_subdev_state *state)
> +{
> +	u32 which = state ? V4L2_SUBDEV_FORMAT_TRY : V4L2_SUBDEV_FORMAT_ACTIVE;
> +	struct ov1063x_priv *priv = to_ov1063x(sd);
> +	struct v4l2_mbus_framefmt *format;
> +
> +	format = __ov1063x_get_pad_format(priv, state, 0, which);
> +	format->code = ov1063x_mbus_formats[0];
> +	format->width = ov1063x_framesizes[0].width;
> +	format->height = ov1063x_framesizes[0].height;
> +	format->field = V4L2_FIELD_NONE;
> +	format->colorspace = V4L2_COLORSPACE_SMPTE170M;
> +
> +	if (which == V4L2_SUBDEV_FORMAT_ACTIVE) {
> +		/*
> +		 * This assumes that ov1063x_mbus_formats[0] doesn't
> +		 * sub-sample.
> +		 */
> +		priv->analog_crop.width = OV1063X_SENSOR_WIDTH;
> +		priv->analog_crop.height = format->height;
> +		priv->analog_crop.left = ((OV1063X_SENSOR_WIDTH -
> +					   priv->analog_crop.width) / 2) & ~1;
> +		priv->analog_crop.top = ((OV1063X_SENSOR_HEIGHT -
> +					  priv->analog_crop.height) / 2) & ~1;
> +
> +		priv->digital_crop.width = format->width;
> +		priv->digital_crop.height = format->height;
> +		priv->digital_crop.left = ((priv->analog_crop.width -
> +					    priv->digital_crop.width) / 2) & ~1;
> +		priv->digital_crop.top = 0;
> +	}
> +
> +	return 0;
> +}
> +
> +static int ov1063x_enum_mbus_code(struct v4l2_subdev *sd,
> +				  struct v4l2_subdev_state *state,
> +				  struct v4l2_subdev_mbus_code_enum *code)
> +{
> +	if (code->index >= ARRAY_SIZE(ov1063x_mbus_formats))
> +		return -EINVAL;
> +
> +	code->code = ov1063x_mbus_formats[code->index];
> +
> +	return 0;
> +}
> +
> +static int ov1063x_enum_frame_sizes(struct v4l2_subdev *sd,
> +				    struct v4l2_subdev_state *state,
> +				    struct v4l2_subdev_frame_size_enum *fse)
> +{
> +	unsigned int i;
> +
> +	for (i = 0; i < ARRAY_SIZE(ov1063x_mbus_formats); ++i) {
> +		if (ov1063x_mbus_formats[i] == fse->code)
> +			break;
> +	}
> +
> +	if (i == ARRAY_SIZE(ov1063x_mbus_formats))
> +		return -EINVAL;
> +
> +	if (fse->index >= ARRAY_SIZE(ov1063x_framesizes))
> +		return -EINVAL;
> +
> +	fse->min_width  = ov1063x_framesizes[fse->index].width;
> +	fse->max_width  = fse->min_width;
> +	fse->max_height = ov1063x_framesizes[fse->index].height;
> +	fse->min_height = fse->max_height;
> +
> +	return 0;
> +}
> +
> +static int ov1063x_get_fmt(struct v4l2_subdev *sd,
> +			   struct v4l2_subdev_state *state,
> +			   struct v4l2_subdev_format *fmt)
> +{
> +	struct ov1063x_priv *priv = to_ov1063x(sd);
> +
> +	fmt->format = *__ov1063x_get_pad_format(priv, state, fmt->pad,
> +						fmt->which);
> +
> +	return 0;
> +}
> +
> +static int ov1063x_set_fmt(struct v4l2_subdev *sd,
> +			   struct v4l2_subdev_state *state,
> +			   struct v4l2_subdev_format *fmt)
> +{
> +	struct ov1063x_priv *priv = to_ov1063x(sd);
> +	struct v4l2_mbus_framefmt *format;
> +	const struct v4l2_area *fsize;
> +	unsigned int i;
> +	u32 code;
> +	int ret = 0;
> +
> +	/*
> +	 * Validate the media bus code, defaulting to the first one if the
> +	 * requested code isn't supported.
> +	 */
> +	for (i = 0; i < ARRAY_SIZE(ov1063x_mbus_formats); ++i) {
> +		if (ov1063x_mbus_formats[i] == fmt->format.code) {
> +			code = fmt->format.code;
> +			break;
> +		}
> +	}
> +
> +	if (i == ARRAY_SIZE(ov1063x_mbus_formats))
> +		code = ov1063x_mbus_formats[0];
> +
> +	/* Find the nearest supported frame size. */
> +	fsize = v4l2_find_nearest_size(ov1063x_framesizes,
> +				       ARRAY_SIZE(ov1063x_framesizes),
> +				       width, height, fmt->format.width,
> +				       fmt->format.height);
> +
> +	/* Update the stored format and return it. */
> +	format = __ov1063x_get_pad_format(priv, state, fmt->pad, fmt->which);
> +
> +	mutex_lock(priv->hdl.lock);
> +
> +	if (fmt->which == V4L2_SUBDEV_FORMAT_ACTIVE &&
> +	    priv->streaming != OV1063X_STREAM_OFF) {
> +		ret = -EBUSY;
> +		goto done;
> +	}
> +
> +	format->code = code;
> +	format->width = fsize->width;
> +	format->height = fsize->height;
> +
> +	if (fmt->which == V4L2_SUBDEV_FORMAT_ACTIVE) {
> +		unsigned int hsub;
> +		unsigned int vsub;
> +
> +		/*
> +		 * Enable horizontal or vertical sub-sampling automatically when
> +		 * the width or height are smaller than half the maximum
> +		 * resolution.
> +		 */
> +		hsub = format->width <= 640 ? 2 : 1;
> +		vsub = format->height <= 400 ? 2 : 1;
> +
> +		/*
> +		 * The analog horizontal crop is restricted to the full sensor
> +		 * width (1312 pixels), 768 or 656 pixels. Additional cropping
> +		 * will be applied in the digital domain.
> +		 */
> +		priv->analog_crop.width = format->width * hsub;
> +		priv->analog_crop.height = format->height * vsub;
> +
> +		if (priv->analog_crop.width > 768)
> +			priv->analog_crop.width = OV1063X_SENSOR_WIDTH;
> +		else if (priv->analog_crop.width > 656)
> +			priv->analog_crop.width = 768;
> +		else
> +			priv->analog_crop.width = 656;
> +
> +		/*
> +		 * The digital crop is applied at the ISP input, before
> +		 * horizontal sub-sampling but after vertical sub-sampling as
> +		 * the latter is applied in the pixel array.
> +		 */
> +		priv->digital_crop.width = format->width * hsub;
> +		priv->digital_crop.height = format->height;
> +
> +		/*
> +		 * Center the crop rectangles, rounding coordinates to a
> +		 * multiple of 2 to avoid changing the Bayer pattern.
> +		 */
> +		priv->analog_crop.left = ((OV1063X_SENSOR_WIDTH -
> +					   priv->analog_crop.width) / 2) & ~1;
> +		priv->analog_crop.top = ((OV1063X_SENSOR_HEIGHT -
> +					  priv->analog_crop.height) / 2) & ~1;
> +		priv->digital_crop.left = ((priv->analog_crop.width -
> +					    priv->digital_crop.width) / 2) & ~1;
> +		priv->analog_crop.top = 0;
> +	}
> +
> +	fmt->format = *format;
> +
> +done:
> +	mutex_unlock(priv->hdl.lock);
> +
> +	return ret;
> +}
> +
> +static const struct v4l2_subdev_core_ops ov1063x_subdev_core_ops = {
> +	.log_status		= v4l2_ctrl_subdev_log_status,
> +	.subscribe_event	= v4l2_ctrl_subdev_subscribe_event,
> +	.unsubscribe_event	= v4l2_event_subdev_unsubscribe,
> +};
> +
> +static const struct v4l2_subdev_video_ops ov1063x_subdev_video_ops = {
> +	.s_stream	= ov1063x_s_stream,
> +};
> +
> +static const struct v4l2_subdev_pad_ops ov1063x_subdev_pad_ops = {
> +	.init_cfg		= ov1063x_init_cfg,
> +	.enum_mbus_code		= ov1063x_enum_mbus_code,
> +	.enum_frame_size	= ov1063x_enum_frame_sizes,
> +	.get_fmt		= ov1063x_get_fmt,
> +	.set_fmt		= ov1063x_set_fmt,
> +};
> +
> +static const struct v4l2_subdev_ops ov1063x_subdev_ops = {
> +	.core	= &ov1063x_subdev_core_ops,
> +	.video	= &ov1063x_subdev_video_ops,
> +	.pad	= &ov1063x_subdev_pad_ops,
> +};
> +
> +/* -----------------------------------------------------------------------------
> + * Power Management
> + */
> +
> +static int ov1063x_power_on_init(struct ov1063x_priv *priv)
> +{
> +	struct i2c_client *client = to_i2c_client(priv->dev);
> +	unsigned int i;
> +	int ret;
> +
> +	ret = ov1063x_write(priv, OV1063X_SOFTWARE_RESET, 0x01, NULL);
> +	if (ret < 0)
> +		return ret;
> +
> +	ret = ov1063x_isp_reset(priv, true);
> +	if (ret < 0)
> +		return ret;
> +
> +	/*
> +	 * Why the I2C address has to be written 23 times (or, actually, at
> +	 * all) is unknown. This may not be required.
> +	 */
> +	for (i = 0; i < 23; ++i) {
> +		ret = ov1063x_write(priv, OV1063X_SC_CMMN_SCCB_ID,
> +				    OV1063X_SC_CMMN_SCCB_ID_ADDR(client->addr) |
> +				    OV1063X_SC_CMMN_SCCB_ID_SEL, NULL);
> +		if (ret < 0)
> +			return ret;
> +	}
> +
> +	ret = ov1063x_write_array(priv, ov1063x_regs_default,
> +				  ARRAY_SIZE(ov1063x_regs_default));
> +	if (ret < 0)
> +		return ret;
> +
> +	ret = ov1063x_isp_reset(priv, false);
> +	if (ret < 0)
> +		return ret;
> +
> +	usleep_range(500, 510);
> +	return 0;
> +}
> +
> +static int ov1063x_power_on(struct ov1063x_priv *priv)
> +{
> +	int ret;
> +
> +	ret = clk_prepare_enable(priv->clk);
> +	if (ret < 0)
> +		return ret;
> +
> +	if (priv->pwdn_gpio) {
> +		gpiod_set_value_cansleep(priv->pwdn_gpio, 0);
> +		usleep_range(1000, 1200);
> +	}
> +
> +	if (priv->reset_gpio) {
> +		gpiod_set_value_cansleep(priv->reset_gpio, 0);
> +		usleep_range(250000, 260000);
> +	}
> +
> +	return 0;
> +}
> +
> +static void ov1063x_power_off(struct ov1063x_priv *priv)
> +{
> +	gpiod_set_value_cansleep(priv->pwdn_gpio, 1);
> +	gpiod_set_value_cansleep(priv->reset_gpio, 1);
> +
> +	clk_disable_unprepare(priv->clk);
> +}
> +
> +static int ov1063x_runtime_resume(struct device *dev)
> +{
> +	struct i2c_client *client = to_i2c_client(dev);
> +	struct v4l2_subdev *subdev = i2c_get_clientdata(client);
> +	struct ov1063x_priv *priv = to_ov1063x(subdev);
> +	int ret;
> +
> +	ret = ov1063x_power_on(priv);
> +	if (ret < 0)
> +		return ret;
> +
> +	ret = ov1063x_power_on_init(priv);
> +	if (ret < 0) {
> +		ov1063x_power_off(priv);
> +		return ret;
> +	}
> +
> +	return 0;
> +}
> +
> +static int ov1063x_runtime_suspend(struct device *dev)
> +{
> +	struct i2c_client *client = to_i2c_client(dev);
> +	struct v4l2_subdev *subdev = i2c_get_clientdata(client);
> +	struct ov1063x_priv *priv = to_ov1063x(subdev);
> +
> +	ov1063x_power_off(priv);
> +
> +	return 0;
> +}
> +
> +static const struct dev_pm_ops ov1063x_pm_ops = {
> +	SET_RUNTIME_PM_OPS(ov1063x_runtime_suspend, ov1063x_runtime_resume, NULL)
> +};
> +
> +/* -----------------------------------------------------------------------------
> + * I2C Driver, Probe & Remove
> + */
> +
> +static int ov1063x_detect(struct ov1063x_priv *priv)
> +{
> +	u32 pid;
> +	int ret;
> +
> +	/* Read and check the product ID. */
> +	ret = ov1063x_read(priv, OV1063X_PID, &pid);
> +	if (ret)
> +		return ret;
> +
> +	switch (pid) {
> +	case OV10633_VERSION_REG:
> +		priv->model = SENSOR_OV10633;
> +		priv->name = "ov10633";
> +		break;
> +	case OV10635_VERSION_REG:
> +		priv->model = SENSOR_OV10635;
> +		priv->name = "ov10635";
> +		break;
> +	default:
> +		dev_err(priv->dev, "Unknown product ID %04x\n", pid);
> +		return -ENODEV;
> +	}
> +
> +	return 0;
> +}
> +
> +static const struct regmap_config ov1063x_regmap_config = {
> +	.reg_bits = 16,
> +	.val_bits = 8,
> +};
> +
> +static int ov1063x_probe(struct i2c_client *client)
> +{
> +	struct ov1063x_priv *priv;
> +	struct v4l2_subdev *sd;
> +	int ret;
> +
> +	priv = devm_kzalloc(&client->dev, sizeof(*priv), GFP_KERNEL);
> +	if (!priv)
> +		return -ENOMEM;
> +
> +	priv->dev = &client->dev;
> +
> +	/* Acquire resources: regmap, GPIOs and clock. The GPIOs are optional. */
> +	priv->regmap = devm_regmap_init_i2c(client, &ov1063x_regmap_config);
> +	if (IS_ERR(priv->regmap))
> +		return PTR_ERR(priv->regmap);
> +
> +	priv->pwdn_gpio = devm_gpiod_get_optional(priv->dev, "powerdown",
> +						  GPIOD_OUT_HIGH);
> +	if (IS_ERR(priv->pwdn_gpio))
> +		return PTR_ERR(priv->pwdn_gpio);
> +
> +	priv->reset_gpio = devm_gpiod_get_optional(priv->dev, "reset",
> +						   GPIOD_OUT_HIGH);
> +	if (IS_ERR(priv->reset_gpio))
> +		return PTR_ERR(priv->reset_gpio);
> +	priv->clk = devm_clk_get(priv->dev, "xvclk");
> +	if (IS_ERR(priv->clk)) {
> +		ret = PTR_ERR(priv->clk);
> +		dev_err(priv->dev, "Failed to get xvclk clock: %d\n", ret);
> +		return ret;
> +	}
> +
> +	priv->clk_rate = clk_get_rate(priv->clk);
> +	dev_dbg(priv->dev, "xvclk rate: %lu Hz\n", priv->clk_rate);
> +
> +	if (priv->clk_rate < 6000000 || priv->clk_rate > 27000000)
> +		return -EINVAL;
> +
> +	/*
> +	 * Enable power and detect the device.
> +	 *
> +	 * The driver supports runtime PM, but needs to work when runtime PM is
> +	 * disabled in the kernel. To that end, power it on manually here.
> +	 */
> +	ret = ov1063x_power_on(priv);
> +	if (ret < 0)
> +		return ret;
> +
> +	ret = ov1063x_detect(priv);
> +	if (ret)
> +		goto err_power;
> +
> +	/* Initialize the subdev and its controls. */
> +	sd = &priv->subdev;
> +	v4l2_i2c_subdev_init(sd, client, &ov1063x_subdev_ops);
> +	v4l2_i2c_subdev_set_name(sd, client, priv->name, NULL);
> +
> +	sd->flags |= V4L2_SUBDEV_FL_HAS_DEVNODE |
> +		     V4L2_SUBDEV_FL_HAS_EVENTS;
> +
> +	v4l2_ctrl_handler_init(&priv->hdl, 3);
> +	v4l2_ctrl_new_std(&priv->hdl, &ov1063x_ctrl_ops,
> +			  V4L2_CID_VFLIP, 0, 1, 1, 0);
> +	v4l2_ctrl_new_std(&priv->hdl, &ov1063x_ctrl_ops,
> +			  V4L2_CID_HFLIP, 0, 1, 1, 0);
> +	v4l2_ctrl_new_std_menu_items(&priv->hdl, &ov1063x_ctrl_ops,
> +				     V4L2_CID_TEST_PATTERN,
> +				     ARRAY_SIZE(ov1063x_test_pattern_menu) - 1,
> +				     0, 0, ov1063x_test_pattern_menu);
> +
> +	if (priv->hdl.error) {
> +		ret = priv->hdl.error;
> +		goto err_power;
> +	}
> +
> +	sd->ctrl_handler = &priv->hdl;
> +
> +	/* Default framerate */
> +	priv->fps_numerator = 30;
> +	priv->fps_denominator = 1;
> +	ov1063x_init_cfg(&priv->subdev, NULL);
> +
> +	/* Initialize the media entity. */
> +	priv->pad.flags = MEDIA_PAD_FL_SOURCE;
> +	sd->entity.function = MEDIA_ENT_F_CAM_SENSOR;
> +	ret = media_entity_pads_init(&sd->entity, 1, &priv->pad);
> +	if (ret < 0)
> +		goto err_ctrls;
> +
> +	/*
> +	 * Enable runtime PM. As the device has been powered manually, mark it
> +	 * as active, and increase the usage count without resuming the device.
> +	 */
> +	pm_runtime_set_active(priv->dev);
> +	pm_runtime_get_noresume(priv->dev);
> +	pm_runtime_enable(priv->dev);
> +
> +	/*
> +	 * Enable autosuspend as it can help avoiding costly power transitions
> +	 * when reconfiguring the sensor.
> +	 */
> +	pm_runtime_set_autosuspend_delay(priv->dev, 1000);
> +	pm_runtime_use_autosuspend(priv->dev);
> +
> +	/*
> +	 * At this point the device is powered on and active from a runtime PM
> +	 * point of view, but hasn't gone through the full initialization
> +	 * performed by the runtime resume operation. Suspend it synchronously
> +	 * to turn the power off, ensuring proper initialization will take
> +	 * place before the first usage.
> +	 */
> +	pm_runtime_put_sync(priv->dev);
> +
> +	/*
> +	 * In case runtime PM is disabled in the kernel, the device remains
> +	 * active and needs to be fully initialized at this point.
> +	 */
> +	if (!pm_runtime_status_suspended(priv->dev)) {
> +		ret = ov1063x_power_on_init(priv);
> +		if (ret < 0)
> +			goto err_pm;
> +	}
> +
> +	/* Finally, register the subdev. */
> +	ret = v4l2_async_register_subdev(sd);
> +	if (ret < 0)
> +		goto err_pm;
> +
> +	dev_info(priv->dev, "%s probed\n", priv->name);
> +
> +	return 0;
> +
> +err_pm:
> +	pm_runtime_disable(priv->dev);
> +	media_entity_cleanup(&priv->subdev.entity);
> +err_ctrls:
> +	v4l2_ctrl_handler_free(&priv->hdl);
> +err_power:
> +	if (!pm_runtime_status_suspended(priv->dev))
> +		ov1063x_power_off(priv);
> +	return ret;
> +}
> +
> +static int ov1063x_remove(struct i2c_client *client)
> +{
> +	struct v4l2_subdev *sd = i2c_get_clientdata(client);
> +	struct ov1063x_priv *priv = to_ov1063x(sd);
> +
> +	v4l2_ctrl_handler_free(&priv->hdl);
> +	v4l2_async_unregister_subdev(&priv->subdev);
> +	media_entity_cleanup(&priv->subdev.entity);
> +
> +	/*
> +	 * Disable runtime PM. In case runtime PM is disabled in the kernel,
> +	 * make sure to turn power off manually.
> +	 */
> +	pm_runtime_disable(priv->dev);
> +	if (!pm_runtime_status_suspended(priv->dev))
> +		ov1063x_power_off(priv);
> +	pm_runtime_set_suspended(priv->dev);
> +
> +	return 0;
> +}
> +
> +static const struct of_device_id ov1063x_dt_id[] = {
> +	{ .compatible = "ovti,ov10635" },
> +	{ .compatible = "ovti,ov10633" },
> +	{ /* sentinel */ }
> +};
> +MODULE_DEVICE_TABLE(of, ov1063x_dt_id);
> +
> +static struct i2c_driver ov1063x_i2c_driver = {
> +	.driver = {
> +		.name = "ov1063x",
> +		.of_match_table = of_match_ptr(ov1063x_dt_id),
> +		.pm = &ov1063x_pm_ops,
> +	},
> +	.probe_new = ov1063x_probe,
> +	.remove = ov1063x_remove,
> +};
> +
> +module_i2c_driver(ov1063x_i2c_driver);
> +
> +MODULE_DESCRIPTION("Camera Sensor Driver for OmniVision OV10633/OV10635");
> +MODULE_AUTHOR("Texas Instruments Inc.");
> +MODULE_LICENSE("GPL");
> diff --git a/drivers/media/i2c/ov1063x_regs.h b/drivers/media/i2c/ov1063x_regs.h
> new file mode 100644
> index 000000000000..7622de5c9069
> --- /dev/null
> +++ b/drivers/media/i2c/ov1063x_regs.h
> @@ -0,0 +1,627 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * OmniVision OV1063x Camera Driver
> + *
> + * Copyright (C) 2018 Texas Instruments Incorporated -  http://www.ti.com/
> + * Copyright (C) 2020 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> + */
> +
> +struct ov1063x_reg {
> +	u32	reg;
> +	u32	val;
> +};
> +
> +static const struct ov1063x_reg ov1063x_regs_default[] = {
> +	/* Register configuration for full resolution : 1280x720 */
> +	{ OV1063X_SC_CMMN_MISC_CTRL, 0x02 |
> +				     OV1063X_SC_CMMN_MISC_CTRL_CEN_GLOBAL_O },
> +	{ OV1063X_SC_CMMN_PAD, 0x02 },
> +	{ OV1063X_HORIZ_COLORCORRECT, 0x0c },
> +	{ OV1063X_REG_8BIT(0x6901), 0x01 },
> +	{ OV1063X_SC_CMMN_SCLK2X_SEL, OV1063X_SC_CMMN_SCLK2X_SEL_DIV4 },
> +	{ OV1063X_AEC_PK_MANUAL, OV1063X_AEC_PK_MANUAL_DELAY },
> +	{ OV1063X_SC_CMMN_PWDN_CTRL2, 0x20 |
> +				      OV1063X_SC_CMMN_PWDN_CTRL2_RST_DIG1 |
> +				      OV1063X_SC_CMMN_PWDN_CTRL2_RST_DIG2 |
> +				      OV1063X_SC_CMMN_PWDN_CTRL2_RST_ISP |
> +				      OV1063X_SC_CMMN_PWDN_CTRL2_SEQUENCE },
> +	{ OV1063X_SC_CMMN_CORE_CTRL1, 0x03 },
> +	/*
> +	 * For 15fps
> +	 *
> +	 * XVCLK: 9MHz
> +	 * Pre divider: 1
> +	 * Multiplier: 32
> +	 * Divider: 8
> +	 * SCLK: 36MHz
> +	 */
> +	{ OV1063X_SC_CMMN_PLL_CTRL0, OV1063X_SC_CMMN_PLL_SCLK_CP(0) |
> +				     OV1063X_SC_CMMN_PLL_SCLK_MULTI(32) },
> +	{ OV1063X_SC_CMMN_PLL_CTRL1, OV1063X_SC_CMMN_PLL_SCLK_PRE_DIV(0) |
> +				     OV1063X_SC_CMMN_PLL_SCLK_CP2(0) |
> +				     OV1063X_SC_CMMN_PLL_SCLK_DIV(3) },
> +	{ OV1063X_SC_CMMN_PLL_CTRL2, OV1063X_SC_CMMN_PLL_SCLK_CP(0) |
> +				     OV1063X_SC_CMMN_PLL_SCLK_MULTI(32) },
> +	{ OV1063X_SC_CMMN_PLL_CTRL3, OV1063X_SC_CMMN_PLL_PCLK_BYPASS |
> +				     OV1063X_SC_CMMN_PLL_SCLK_PRE_DIV(1) |
> +				     OV1063X_SC_CMMN_PLL_SCLK_CP2(0) |
> +				     OV1063X_SC_CMMN_PLL_SCLK_DIV(1) },
> +	{ OV1063X_ANA_ADC1, 0x74 },
> +	{ OV1063X_ANA_ADC2, 0x2b },
> +	{ OV1063X_ANA_ANALOG3, 0x00 },
> +	{ OV1063X_ANA_ANALOG2, 0x67 },
> +	{ OV1063X_ANA_PWC4, 0xba },
> +	{ OV1063X_ANA_ADC3, 0x2f },
> +	{ OV1063X_ANA_ADC4, 0x00 },
> +	{ OV1063X_ANA_PWC1, 0xa8 },
> +	{ OV1063X_ANA_PWC2, 0x16 },
> +	{ OV1063X_SENSOR_EQ_GOLOW, 0x10 },
> +	{ OV1063X_SENSOR_BITSW_GO, 0x0001 },
> +	{ OV1063X_FORMAT_CTRL00, OV1063X_FORMAT_UYVY },
> +	{ OV1063X_SC_CMMN_PCLK_DIV_CTRL, 1 },
> +	{ OV1063X_SC_CMMN_CORE_CTRL_3, OV1063X_SC_CMMN_CORE_CTRL_PCLK_SEC },
> +	{ OV1063X_SC_CMMN_CLOCK_SEL, 0x0a | OV1063X_SC_CMMN_CLOCK_SEL_SCLK2X },
> +	{ OV1063X_SENSOR_RSTGOLOW, 0x0d },
> +	{ OV1063X_SENSOR_HLDWIDTH, 0x20 },
> +	{ OV1063X_SENSOR_TXWIDTH, 0x15 },
> +	{ OV1063X_SENSOR_REG9, 0x28 },
> +	{ OV1063X_SENSOR_REGD, 0x00 },
> +	{ OV1063X_SENSOR_RSTYZ_GOLOW, 32 },
> +	{ OV1063X_SENSOR_REG15, 0x04 },
> +	{ OV1063X_TIMING_CTRL1D, OV1063X_TIMING_CTRL1D_WDR },
> +	{ OV1063X_TIMING_CTRL1C, 0 },
> +	{ OV1063X_TIMING_CTRL24, 0x10 },
> +	{ OV1063X_TIMING_CTRL15, OV1063X_TIMING_CTRL15_BLACK_LINE_HREF |
> +				 OV1063X_TIMING_CTRL15_BLACK_LINES(12) },
> +	{ OV1063X_TIMING_X_END_ADDR, 1311 },
> +	{ OV1063X_TIMING_X_START_ADDR, 0 },
> +	{ OV1063X_TIMING_Y_END_ADDR, 769 },
> +	{ OV1063X_TIMING_Y_START_ADDR, 46 },
> +	{ OV1063X_TIMING_X_OUTPUT_SIZE, 1280 },
> +	{ OV1063X_TIMING_Y_OUTPUT_SIZE, 720 },
> +	{ OV1063X_TIMING_HTS, 1782 },
> +	{ OV1063X_TIMING_VTS, 748 },
> +	{ OV1063X_TIMING_ISP_X_WIN, 8 },
> +	{ OV1063X_VSTART_OFFSET, 12 },
> +	{ OV1063X_ANA_ARRAY1, 0x60 |
> +			      OV1063X_ANA_ARRAY1_FULL |
> +			      OV1063X_ANA_ARRAY1_DELAY(3) },
> +	{ OV1063X_ISP_RW05, OV1063X_ISP_RW05_SUB_AVG },
> +	{ OV1063X_AEC_CTRLD5, 8 * 1024 * 1024 },
> +	{ OV1063X_AEC_CTRLD9, 8 * 1024 * 1024 },
> +	{ OV1063X_AEC_CTRLE8, 127 },
> +	{ OV1063X_AEC_CTRLEA, 127 },
> +	{ OV1063X_GAIN_AWB_MAN_GAIN_B_LONG, 128 },
> +	{ OV1063X_GAIN_AWB_MAN_GAIN_GB_LONG, 128 },
> +	{ OV1063X_GAIN_AWB_MAN_GAIN_GR_LONG, 128 },
> +	{ OV1063X_GAIN_AWB_MAN_GAIN_R_LONG, 128 },
> +	{ OV1063X_GAIN_AWB_MAN_OFFSET_B_LONG, 0 },
> +	{ OV1063X_GAIN_AWB_MAN_OFFSET_GB_LONG, 0 },
> +	{ OV1063X_GAIN_AWB_MAN_OFFSET_GR_LONG, 0 },
> +	{ OV1063X_GAIN_AWB_MAN_OFFSET_R_LONG, 0 },
> +	{ OV1063X_GAIN_AWB_MAN_GAIN_B_SHORT, 128 },
> +	{ OV1063X_GAIN_AWB_MAN_GAIN_GB_SHORT, 128 },
> +	{ OV1063X_GAIN_AWB_MAN_GAIN_GR_SHORT, 128 },
> +	{ OV1063X_GAIN_AWB_MAN_GAIN_R_SHORT, 128 },
> +	{ OV1063X_GAIN_AWB_MAN_OFFSET_B_SHORT, 0 },
> +	{ OV1063X_GAIN_AWB_MAN_OFFSET_GB_SHORT, 0 },
> +	{ OV1063X_GAIN_AWB_MAN_OFFSET_GR_SHORT, 0 },
> +	{ OV1063X_GAIN_AWB_MAN_OFFSET_R_SHORT, 0 },
> +	{ OV1063X_AEC_CTRLD0, OV1063X_AEC_CTRLD0_R_MAN_EN(0) },
> +	{ OV1063X_ISP_RW06, OV1063X_ISP_RW06_YUV_MODE_MAN(2) |
> +			    OV1063X_ISP_RW06_YUV_MODE_MAN_EN },
> +	{ OV1063X_AEC_CTRL07, 0 },
> +	{ OV1063X_CIP_HFREQ_COEF_SHORT, 0x06 },
> +	{ OV1063X_CIP_MAX_SHARPEN_LONG, 0x08 },
> +	{ OV1063X_CIP_SHARPEN_ALPHA_LONG, 0x12 },
> +	{ OV1063X_CIP_SHARPEN_ALPHA_SHORT, 0x12 },
> +	{ OV1063X_CIP_UNSHARPEN_MASK_LONG(0), 0x06 },
> +	{ OV1063X_CIP_UNSHARPEN_MASK_LONG(1), 0x20 },
> +	{ OV1063X_CIP_UNSHARPEN_MASK_SHORT(0), 0x06 },
> +	{ OV1063X_CIP_UNSHARPEN_MASK_SHORT(1), 0x20 },
> +	{ OV1063X_CIP_MAX_SHARPEN_SHORT, 0x04 },
> +	{ OV1063X_LLF_MAX_LOW_LEVEL, 255 },
> +	{ OV1063X_AWB_M_X_LONG, 0x76 },
> +	{ OV1063X_AWB_M_Y_LONG, 0x47 },
> +	{ OV1063X_AWB_L_K_LONG, 0xef },
> +	{ OV1063X_AWB_H_K_LONG, 0xc9 },
> +	{ OV1063X_AWB_H_LMT_LONG, 0x49 },
> +	{ OV1063X_AWB_L_LMT_LONG, 0x30 },
> +	{ OV1063X_REG_8BIT(0x558f), 0x67 },
> +	{ OV1063X_REG_8BIT(0x5590), 0x3f },
> +	{ OV1063X_AWB_DATA_ULMT_LONG, 0xf0 },
> +	{ OV1063X_AWB_DATA_LLMT_LONG, 0x10 },
> +	{ OV1063X_AWB_M_X_SHORT, 0x6d },
> +	{ OV1063X_AWB_M_Y_SHORT, 0x55 },
> +	{ OV1063X_AWB_L_K_SHORT, 0xc3 },
> +	{ OV1063X_AWB_H_K_SHORT, 0xb5 },
> +	{ OV1063X_AWB_H_LMT_SHORT, 0x43 },
> +	{ OV1063X_AWB_L_LMT_SHORT, 0x38 },
> +	{ OV1063X_REG_8BIT(0x55a8), 0x5f },
> +	{ OV1063X_REG_8BIT(0x55a9), 0x4b },
> +	{ OV1063X_AWB_DATA_ULMT_SHORT, 0xf0 },
> +	{ OV1063X_AWB_DATA_LLMT_SHORT, 0x10 },
> +	{ OV1063X_AWB_CT_CTRL1, OV1063X_AWB_CT_CTRL1_GAIN_STEP_NORMAL(1) |
> +				OV1063X_AWB_CT_CTRL1_GAIN_STEP_FAST(1) |
> +				OV1063X_AWB_CT_CTRL1_SCALE_LONG_2X |
> +				0x02 },
> +	{ OV1063X_REG_8BIT(0x5300), 0x01 },
> +	{ OV1063X_REG_8BIT(0x5301), 0x00 },
> +	{ OV1063X_REG_8BIT(0x5302), 0x00 },
> +	{ OV1063X_REG_8BIT(0x5303), 0x0e },
> +	{ OV1063X_REG_8BIT(0x5304), 0x00 },
> +	{ OV1063X_REG_8BIT(0x5305), 0x0e },
> +	{ OV1063X_REG_8BIT(0x5306), 0x00 },
> +	{ OV1063X_REG_8BIT(0x5307), 0x36 },
> +	{ OV1063X_REG_8BIT(0x5308), 0x00 },
> +	{ OV1063X_REG_8BIT(0x5309), 0xd9 },
> +	{ OV1063X_REG_8BIT(0x530a), 0x00 },
> +	{ OV1063X_REG_8BIT(0x530b), 0x0f },
> +	{ OV1063X_REG_8BIT(0x530c), 0x00 },
> +	{ OV1063X_REG_8BIT(0x530d), 0x2c },
> +	{ OV1063X_REG_8BIT(0x530e), 0x00 },
> +	{ OV1063X_REG_8BIT(0x530f), 0x59 },
> +	{ OV1063X_REG_8BIT(0x5310), 0x00 },
> +	{ OV1063X_REG_8BIT(0x5311), 0x7b },
> +	{ OV1063X_REG_8BIT(0x5312), 0x00 },
> +	{ OV1063X_REG_8BIT(0x5313), 0x22 },
> +	{ OV1063X_REG_8BIT(0x5314), 0x00 },
> +	{ OV1063X_REG_8BIT(0x5315), 0xd5 },
> +	{ OV1063X_REG_8BIT(0x5316), 0x00 },
> +	{ OV1063X_REG_8BIT(0x5317), 0x13 },
> +	{ OV1063X_REG_8BIT(0x5318), 0x00 },
> +	{ OV1063X_REG_8BIT(0x5319), 0x18 },
> +	{ OV1063X_REG_8BIT(0x531a), 0x00 },
> +	{ OV1063X_REG_8BIT(0x531b), 0x26 },
> +	{ OV1063X_REG_8BIT(0x531c), 0x00 },
> +	{ OV1063X_REG_8BIT(0x531d), 0xdc },
> +	{ OV1063X_REG_8BIT(0x531e), 0x00 },
> +	{ OV1063X_REG_8BIT(0x531f), 0x02 },
> +	{ OV1063X_REG_8BIT(0x5320), 0x00 },
> +	{ OV1063X_REG_8BIT(0x5321), 0x24 },
> +	{ OV1063X_REG_8BIT(0x5322), 0x00 },
> +	{ OV1063X_REG_8BIT(0x5323), 0x56 },
> +	{ OV1063X_REG_8BIT(0x5324), 0x00 },
> +	{ OV1063X_REG_8BIT(0x5325), 0x85 },
> +	{ OV1063X_REG_8BIT(0x5326), 0x00 },
> +	{ OV1063X_REG_8BIT(0x5327), 0x20 },
> +	{ OV1063X_AEC_WIN_LEFT_LONG, 320 },
> +	{ OV1063X_AEC_WIN_LEFT_SHORT, 320 },
> +	{ OV1063X_AEC_WIN_TOP_LONG, 250 },
> +	{ OV1063X_AEC_WIN_TOP_SHORT, 250 },
> +	{ OV1063X_AEC_WIN_WIDTH_LONG, 640 },
> +	{ OV1063X_AEC_WIN_WIDTH_SHORT, 640 },
> +	{ OV1063X_AEC_WIN_HEIGHT_LONG, 300 },
> +	{ OV1063X_AEC_WIN_HEIGHT_SHORT, 300 },
> +	{ OV1063X_AEC_WEIGHT_SHORT(0), 1 },
> +	{ OV1063X_AEC_WEIGHT_SHORT(1), 1 },
> +	{ OV1063X_AEC_WEIGHT_SHORT(2), 1 },
> +	{ OV1063X_AEC_WEIGHT_SHORT(3), 1 },
> +	{ OV1063X_AEC_WEIGHT_SHORT(4), 3 },
> +	{ OV1063X_AEC_WEIGHT_SHORT(5), 3 },
> +	{ OV1063X_AEC_WEIGHT_SHORT(6), 3 },
> +	{ OV1063X_AEC_WEIGHT_SHORT(7), 5 },
> +	{ OV1063X_AEC_WEIGHT_SHORT(8), 9 },
> +	{ OV1063X_AEC_WEIGHT_SHORT(9), 5 },
> +	{ OV1063X_AEC_WEIGHT_SHORT(10), 5 },
> +	{ OV1063X_AEC_WEIGHT_SHORT(11), 5 },
> +	{ OV1063X_AEC_WEIGHT_SHORT(12), 5 },
> +	{ OV1063X_AEC_FINAL_SATURATE_THRESH, 128 },
> +	{ OV1063X_DNS_NOISE_Y_LIST_LONG(0), 1 },
> +	{ OV1063X_DNS_NOISE_Y_LIST_LONG(1), 3 },
> +	{ OV1063X_DNS_NOISE_Y_LIST_LONG(2), 6 },
> +	{ OV1063X_DNS_NOISE_Y_LIST_LONG(3), 10 },
> +	{ OV1063X_DNS_NOISE_Y_LIST_LONG(4), 14 },
> +	{ OV1063X_DNS_NOISE_Y_LIST_LONG(5), 18 },
> +	{ OV1063X_DNS_NOISE_Y_LIST_LONG(6), 22 },
> +	{ OV1063X_DNS_NOISE_UV_LIST_LONG(0), 2 },
> +	{ OV1063X_DNS_NOISE_UV_LIST_LONG(1), 4 },
> +	{ OV1063X_DNS_NOISE_UV_LIST_LONG(2), 8 },
> +	{ OV1063X_DNS_NOISE_UV_LIST_LONG(3), 12 },
> +	{ OV1063X_DNS_NOISE_UV_LIST_LONG(4), 18 },
> +	{ OV1063X_DNS_NOISE_UV_LIST_LONG(5), 24 },
> +	{ OV1063X_DNS_NOISE_UV_LIST_LONG(6), 30 },
> +	{ OV1063X_DNS_GBGR_EXTRA_SHORT, 4 },
> +	{ OV1063X_DNS_NOISE_Y_LIST_SHORT(0), 1 },
> +	{ OV1063X_DNS_NOISE_Y_LIST_SHORT(1), 3 },
> +	{ OV1063X_DNS_NOISE_Y_LIST_SHORT(2), 6 },
> +	{ OV1063X_DNS_NOISE_Y_LIST_SHORT(3), 10 },
> +	{ OV1063X_DNS_NOISE_Y_LIST_SHORT(4), 14 },
> +	{ OV1063X_DNS_NOISE_Y_LIST_SHORT(5), 18 },
> +	{ OV1063X_DNS_NOISE_Y_LIST_SHORT(6), 22 },
> +	{ OV1063X_DNS_NOISE_UV_LIST_SHORT(0), 3 },
> +	{ OV1063X_DNS_NOISE_UV_LIST_SHORT(1), 4 },
> +	{ OV1063X_DNS_NOISE_UV_LIST_SHORT(2), 8 },
> +	{ OV1063X_DNS_NOISE_UV_LIST_SHORT(3), 12 },
> +	{ OV1063X_DNS_NOISE_UV_LIST_SHORT(4), 18 },
> +	{ OV1063X_DNS_NOISE_UV_LIST_SHORT(5), 24 },
> +	{ OV1063X_DNS_NOISE_UV_LIST_SHORT(6), 30 },
> +	{ OV1063X_VFIFO_LLEN_FIRS1_SEL, 0x00 }, /* 8-bit YUV mode */
> +	{ OV1063X_VFIFO_LINE_LENGTH_MAN, 1905 },
> +	{ OV1063X_VFIFO_HSYNC_START_POSITION, 624 },
> +	{ OV1063X_VFIFO_HSYNC_CTRL, OV1063X_VFIFO_HSYNC_CTRL_HEADER_WIDTH(0) |
> +				    OV1063X_VFIFO_HSYNC_CTRL_TRAILER_WIDTH(0) },
> +	{ OV1063X_ROI_CTRL0, OV1063X_ROI_CTRL0_EN_3 |
> +			     OV1063X_ROI_CTRL0_EN_2 |
> +			     OV1063X_ROI_CTRL0_EN_1 },
> +	{ OV1063X_DVP_MOD_SEL, OV1063X_DVP_MOD_SEL_CCIR_F },
> +	{ OV1063X_DVP_VSYNC_WIDTH, 1 },
> +	{ OV1063X_DVP_HSYVSY_NEG_WIDTH, 0 },
> +	{ OV1063X_DVP_VSYNC_MODE, OV1063X_DVP_VSYNC_MODE_VSYNCOUT_SEL(0) },
> +	/*
> +	 * Non-overlapping HSYNC-VSYNC.
> +	 * Therefore do not set the VSYNC delay registers.
> +	 */
> +	{ OV1063X_DVP_EOF_VSYNC_DELAY, 0 },
> +	{ OV1063X_LINE_NUM, 8 },
> +	{ OV1063X_BLC_CTRL05, OV1063X_BLC_CTRL05_REMOVE_BLACK_LINE |
> +			      OV1063X_BLC_CTRL05_ONE_MAN_OFFSET_MODE },
> +	{ OV1063X_START_LINE, 4 },
> +	{ OV1063X_BLC_AVG_CTRL1, 0x20 },
> +	{ OV1063X_BLC_AVG_CTRL2, 0x22 },
> +	{ OV1063X_BLC_OFFSET_TOP_LIMIT, 1948 },
> +	{ OV1063X_BLC_CTRL5A, 0x00 },
> +	{ OV1063X_FC_R2, 2 },
> +	{ OV1063X_SC_CMMN_CORE_CTRL_2, OV1063X_SC_CMMN_CORE_CTRL_CLK_SWITCH },
> +	{ OV1063X_STREAM_MODE, OV1063X_STREAM_MODE_ON },
> +	{ OV1063X_STREAM_MODE, OV1063X_STREAM_MODE_ON },
> +	{ OV1063X_REG_8BIT(0x6f0e), 0x00 },
> +	{ OV1063X_REG_8BIT(0x6f0f), 0x00 },
> +	{ OV1063X_VFIFO_EMBD_LINE_CTRL, OV1063X_VFIFO_EMBD_LINE_CTRL_SOF_CLR_RAM },
> +	{ OV1063X_VFIFO_EMBD_LINE_NUM, 1 },
> +	{ OV1063X_EMB_START_PCNT, 1 },
> +	{ OV1063X_EMB_START_LCNT, 1 },
> +	{ OV1063X_VFIFO_LLEN_FIRS1_SEL, 0x00 },
> +	{ OV1063X_VFIFO_READ_START, 8 },
> +	{ OV1063X_EMB_SIZE_MANU_EN, 0 },
> +	{ OV1063X_EMB_SIZE_MANU, 1536 },
> +	{ OV1063X_GAIN_AWB_CTRL32, 0 },
> +	{ OV1063X_REG_8BIT(0x3510), 0x00 },
> +	{ OV1063X_AEC_PK_MAN_DONE, 0 },
> +	{ OV1063X_EMB_LINE_EN, 0 },
> +	{ OV1063X_REG_8BIT(0x6f0d), 0x00 },
> +	{ OV1063X_ISP_RW00, OV1063X_ISP_RW00_COLOR_MATRIX_EN |
> +			    OV1063X_ISP_RW00_COLOR_INTERP_EN |
> +			    OV1063X_ISP_RW00_DENOISE_EN |
> +			    OV1063X_ISP_RW00_WHITE_DPC_EN |
> +			    OV1063X_ISP_RW00_BLACK_DPC_EN |
> +			    OV1063X_ISP_RW00_AWB_STATS_EN |
> +			    OV1063X_ISP_RW00_AWB_GAIN_EN |
> +			    OV1063X_ISP_RW00_LSC_EN },
> +	{ OV1063X_ISP_RW01, OV1063X_ISP_RW01_DATA_WEIGHT_SYNC_EN |
> +			    OV1063X_ISP_RW01_DARK_LEVEL_FILTER_EN |
> +			    OV1063X_ISP_RW01_BUFFER_CONTROL_EN |
> +			    OV1063X_ISP_RW01_AEC_EN |
> +			    OV1063X_ISP_RW01_TONE_MAPPING_EN |
> +			    OV1063X_ISP_RW01_NORMALIZE_EN |
> +			    OV1063X_ISP_RW01_LONG_SHORT_COMB_EN },
> +	{ OV1063X_ISP_RW02, OV1063X_ISP_RW02_OTP_MANUAL_OFFSET_EN |
> +			    OV1063X_ISP_RW02_OTP_EN |
> +			    OV1063X_ISP_RW02_INTER_FRAME_CALC |
> +			    OV1063X_ISP_RW02_CT_AWB_EN |
> +			    OV1063X_ISP_RW02_DIGITAL_GAIN_EN |
> +			    OV1063X_ISP_RW02_WINDOW_BORDER_CUT_EN |
> +			    OV1063X_ISP_RW02_DITHERING_EN },
> +	{ OV1063X_ISP_CTRL3D, 0 },
> +	{ OV1063X_AEC_TARGET_NUM, OV1063X_AEC_TARGET_NUM_AA_MODE },
> +	{ OV1063X_AEC_LS_SENS_RATIO, 1024 },
> +	{ OV1063X_AEC_NONWDR_EN, 0 },
> +	{ OV1063X_AEC_NONWDR_SWITCH, 0 },
> +	{ OV1063X_AEC_FIXED_RATIO_EN, 0 },
> +	{ OV1063X_AEC_GP_MODE_EN, 0 },
> +	{ OV1063X_AEC_NIGHT_MODE_EN, 0 },
> +	{ OV1063X_AEC_NIGHT_MODE_CTRL, 0 },
> +	{ OV1063X_AEC_NONLINEAR_GAIN_EN, 0 },
> +	{ OV1063X_AEC_MANU_GAMMA_EN, 0 },
> +	{ OV1063X_AEC_HOLD_BAND_EN, 0 },
> +	{ OV1063X_AEC_BAND_FILTER_FLAG, OV1063X_AEC_BAND_FILTER_FLAG_0HZ },
> +	{ OV1063X_AEC_BAND_FILTER_EN, 0 },
> +	{ OV1063X_AEC_BAND_FILTER_SHORT, 0 },
> +	{ OV1063X_AEC_LESS_1BAND_EN, 1 },
> +	{ OV1063X_AEC_LESS_1BAND_SHORT, 1 },
> +	{ OV1063X_AEC_LOG_TARGET(0), 0x8800 },
> +	{ OV1063X_AEC_LOG_TARGET(1), 0x8a00 },
> +	{ OV1063X_AEC_LOG_TARGET(2), 0x8600 },
> +	{ OV1063X_AEC_TARGET_LONG(0), 0x40 },
> +	{ OV1063X_AEC_TARGET_LONG(1), 0x50 },
> +	{ OV1063X_AEC_TARGET_LONG(2), 0x30 },
> +	{ OV1063X_AEC_TARGET_SHORT(0), 0x28 },
> +	{ OV1063X_AEC_TARGET_SHORT(1), 0x60 },
> +	{ OV1063X_AEC_TARGET_SHORT(2), 0x40 },
> +	{ OV1063X_AEC_MAX_SHORT_LE, 0x01380000 },
> +	{ OV1063X_AEC_MAX_GAIN_LONG, 255 },
> +	{ OV1063X_AEC_MAX_GAIN_SHORT, 64 },
> +	{ OV1063X_AEC_MIN_GAIN_LONG, 24 },
> +	{ OV1063X_AEC_MIN_GAIN_SHORT, 24 },
> +	{ OV1063X_AEC_MAX_EXP_LONG, 11904 },
> +	{ OV1063X_AEC_MAX_EXP_SHORT, 11904 },
> +	{ OV1063X_AEC_MIN_EXP_LONG, 4 },
> +	{ OV1063X_AEC_MIN_EXP_SHORT, 4 },
> +	{ OV1063X_AEC_FIXED_RATIO, 0x07 },
> +	{ OV1063X_AEC_GP_MODE_RATIO_B2A, 0x20 },
> +	{ OV1063X_AEC_GP_MODE_RATIO_C2A, 0x08 },
> +	{ OV1063X_AEC_MIN_GAMMA_LIST(0), 512 },
> +	{ OV1063X_AEC_MIN_GAMMA_LIST(1), 512 },
> +	{ OV1063X_AEC_MIN_GAMMA_LIST(2), 512 },
> +	{ OV1063X_AEC_MAX_GAMMA_LIST(0), 308 },
> +	{ OV1063X_AEC_MAX_GAMMA_LIST(1), 1024 },
> +	{ OV1063X_AEC_MAX_GAMMA_LIST(2), 1536 },
> +	{ OV1063X_AEC_DR_LIST(0), 16 },
> +	{ OV1063X_AEC_DR_LIST(1), 64 },
> +	{ OV1063X_AEC_DR_LIST(2), 128 },
> +	{ OV1063X_AEC_BAND_VALUE_60HZ, 3328 },
> +	{ OV1063X_AEC_BAND_VALUE_50HZ, 4032 },
> +	{ OV1063X_REG_8BIT(0xc4b4), 0x01 },
> +	{ OV1063X_REG_8BIT(0xc4b5), 0x01 },
> +	{ OV1063X_REG_8BIT(0xc4b6), 0x00 },
> +	{ OV1063X_REG_8BIT(0xc4b7), 0x01 },
> +	{ OV1063X_REG_8BIT(0xc4b8), 0x00 },
> +	{ OV1063X_REG_8BIT(0xc4b9), 0x01 },
> +	{ OV1063X_REG_8BIT(0xc4ba), 0x01 },
> +	{ OV1063X_REG_8BIT(0xc4bb), 0x00 },
> +	{ OV1063X_REG_8BIT(0xc4be), 0x02 },
> +	{ OV1063X_REG_8BIT(0xc4bf), 0x33 },
> +	{ OV1063X_REG_8BIT(0xc4c8), 0x03 },
> +	{ OV1063X_REG_8BIT(0xc4c9), 0xd0 },
> +	{ OV1063X_REG_8BIT(0xc4ca), 0x0e },
> +	{ OV1063X_REG_8BIT(0xc4cb), 0x00 },
> +	{ OV1063X_AWB_SIMPLE_MIN_NUM, 3665 },
> +	{ OV1063X_AWB_CT_MIN_NUM, 3665 },
> +	{ OV1063X_REG_8BIT(0xc4d0), 0x04 },
> +	{ OV1063X_REG_8BIT(0xc4d1), 0x80 },
> +	{ OV1063X_REG_8BIT(0xc4e0), 0x04 },
> +	{ OV1063X_REG_8BIT(0xc4e1), 0x02 },
> +	{ OV1063X_REG_8BIT(0xc4e2), 0x01 },
> +	{ OV1063X_REG_8BIT(0xc4e4), 0x10 },
> +	{ OV1063X_REG_8BIT(0xc4e5), 0x20 },
> +	{ OV1063X_REG_8BIT(0xc4e6), 0x30 },
> +	{ OV1063X_REG_8BIT(0xc4e7), 0x40 },
> +	{ OV1063X_REG_8BIT(0xc4e8), 0x50 },
> +	{ OV1063X_REG_8BIT(0xc4e9), 0x60 },
> +	{ OV1063X_REG_8BIT(0xc4ea), 0x70 },
> +	{ OV1063X_REG_8BIT(0xc4eb), 0x80 },
> +	{ OV1063X_REG_8BIT(0xc4ec), 0x90 },
> +	{ OV1063X_REG_8BIT(0xc4ed), 0xa0 },
> +	{ OV1063X_REG_8BIT(0xc4ee), 0xb0 },
> +	{ OV1063X_REG_8BIT(0xc4ef), 0xc0 },
> +	{ OV1063X_REG_8BIT(0xc4f0), 0xd0 },
> +	{ OV1063X_REG_8BIT(0xc4f1), 0xe0 },
> +	{ OV1063X_REG_8BIT(0xc4f2), 0xf0 },
> +	{ OV1063X_REG_8BIT(0xc4f3), 0x80 },
> +	{ OV1063X_REG_8BIT(0xc4f4), 0x00 },
> +	{ OV1063X_REG_8BIT(0xc4f5), 0x20 },
> +	{ OV1063X_REG_8BIT(0xc4f6), 0x02 },
> +	{ OV1063X_REG_8BIT(0xc4f7), 0x00 },
> +	{ OV1063X_REG_8BIT(0xc4f8), 0x04 },
> +	{ OV1063X_REG_8BIT(0xc4f9), 0x0b },
> +	{ OV1063X_REG_8BIT(0xc4fa), 0x00 },
> +	{ OV1063X_REG_8BIT(0xc4fb), 0x01 },
> +	{ OV1063X_REG_8BIT(0xc4fc), 0x01 },
> +	{ OV1063X_REG_8BIT(0xc4fd), 0x01 },
> +	{ OV1063X_REG_8BIT(0xc4fe), 0x04 },
> +	{ OV1063X_REG_8BIT(0xc4ff), 0x02 },
> +	{ OV1063X_REG_8BIT(0xc500), 0x68 },
> +	{ OV1063X_REG_8BIT(0xc501), 0x74 },
> +	{ OV1063X_REG_8BIT(0xc502), 0x70 },
> +	{ OV1063X_REG_8BIT(0xc503), 0x80 },
> +	{ OV1063X_REG_8BIT(0xc504), 0x05 },
> +	{ OV1063X_REG_8BIT(0xc505), 0x80 },
> +	{ OV1063X_REG_8BIT(0xc506), 0x03 },
> +	{ OV1063X_REG_8BIT(0xc507), 0x80 },
> +	{ OV1063X_REG_8BIT(0xc508), 0x01 },
> +	{ OV1063X_REG_8BIT(0xc509), 0xc0 },
> +	{ OV1063X_REG_8BIT(0xc50a), 0x01 },
> +	{ OV1063X_REG_8BIT(0xc50b), 0xa0 },
> +	{ OV1063X_REG_8BIT(0xc50c), 0x01 },
> +	{ OV1063X_REG_8BIT(0xc50d), 0x2c },
> +	{ OV1063X_REG_8BIT(0xc50e), 0x01 },
> +	{ OV1063X_REG_8BIT(0xc50f), 0x0a },
> +	{ OV1063X_REG_8BIT(0xc510), 0x00 },
> +	{ OV1063X_REG_8BIT(0xc511), 0x00 },
> +	{ OV1063X_REG_8BIT(0xc512), 0xe5 },
> +	{ OV1063X_REG_8BIT(0xc513), 0x14 },
> +	{ OV1063X_REG_8BIT(0xc514), 0x04 },
> +	{ OV1063X_REG_8BIT(0xc515), 0x00 },
> +	{ OV1063X_VTS_ADDR, 840 },
> +	{ OV1063X_HTS_ADDR, 1904 },
> +	{ OV1063X_REG_8BIT(0xc2e0), 0x00 },
> +	{ OV1063X_REG_8BIT(0xc2e1), 0x51 },
> +	{ OV1063X_REG_8BIT(0xc2e2), 0x00 },
> +	{ OV1063X_REG_8BIT(0xc2e3), 0xd6 },
> +	{ OV1063X_REG_8BIT(0xc2e4), 0x01 },
> +	{ OV1063X_REG_8BIT(0xc2e5), 0x5e },
> +	{ OV1063X_REG_8BIT(0xc2e9), 0x01 },
> +	{ OV1063X_REG_8BIT(0xc2ea), 0x7a },
> +	{ OV1063X_REG_8BIT(0xc2eb), 0x90 },
> +	{ OV1063X_REG_8BIT(0xc2ed), 0x01 },
> +	{ OV1063X_REG_8BIT(0xc2ee), 0x7a },
> +	{ OV1063X_REG_8BIT(0xc2ef), 0x64 },
> +	{ OV1063X_REG_8BIT(0xc308), 0x00 },
> +	{ OV1063X_REG_8BIT(0xc309), 0x00 },
> +	{ OV1063X_REG_8BIT(0xc30a), 0x00 },
> +	{ OV1063X_REG_8BIT(0xc30c), 0x00 },
> +	{ OV1063X_REG_8BIT(0xc30d), 0x01 },
> +	{ OV1063X_REG_8BIT(0xc30e), 0x00 },
> +	{ OV1063X_REG_8BIT(0xc30f), 0x00 },
> +	{ OV1063X_REG_8BIT(0xc310), 0x01 },
> +	{ OV1063X_REG_8BIT(0xc311), 0x60 },
> +	{ OV1063X_REG_8BIT(0xc312), 0xff },
> +	{ OV1063X_REG_8BIT(0xc313), 0x08 },
> +	{ OV1063X_REG_8BIT(0xc314), 0x01 },
> +	{ OV1063X_REG_8BIT(0xc315), 0x7f },
> +	{ OV1063X_REG_8BIT(0xc316), 0xff },
> +	{ OV1063X_REG_8BIT(0xc317), 0x0b },
> +	{ OV1063X_REG_8BIT(0xc318), 0x00 },
> +	{ OV1063X_REG_8BIT(0xc319), 0x0c },
> +	{ OV1063X_REG_8BIT(0xc31a), 0x00 },
> +	{ OV1063X_REG_8BIT(0xc31b), 0xe0 },
> +	{ OV1063X_REG_8BIT(0xc31c), 0x00 },
> +	{ OV1063X_REG_8BIT(0xc31d), 0x14 },
> +	{ OV1063X_REG_8BIT(0xc31e), 0x00 },
> +	{ OV1063X_REG_8BIT(0xc31f), 0xc5 },
> +	{ OV1063X_REG_8BIT(0xc320), 0xff },
> +	{ OV1063X_REG_8BIT(0xc321), 0x4b },
> +	{ OV1063X_REG_8BIT(0xc322), 0xff },
> +	{ OV1063X_REG_8BIT(0xc323), 0xf0 },
> +	{ OV1063X_REG_8BIT(0xc324), 0xff },
> +	{ OV1063X_REG_8BIT(0xc325), 0xe8 },
> +	{ OV1063X_REG_8BIT(0xc326), 0x00 },
> +	{ OV1063X_REG_8BIT(0xc327), 0x46 },
> +	{ OV1063X_REG_8BIT(0xc328), 0xff },
> +	{ OV1063X_REG_8BIT(0xc329), 0xd2 },
> +	{ OV1063X_REG_8BIT(0xc32a), 0xff },
> +	{ OV1063X_REG_8BIT(0xc32b), 0xe4 },
> +	{ OV1063X_REG_8BIT(0xc32c), 0xff },
> +	{ OV1063X_REG_8BIT(0xc32d), 0xbb },
> +	{ OV1063X_REG_8BIT(0xc32e), 0x00 },
> +	{ OV1063X_REG_8BIT(0xc32f), 0x61 },
> +	{ OV1063X_REG_8BIT(0xc330), 0xff },
> +	{ OV1063X_REG_8BIT(0xc331), 0xf9 },
> +	{ OV1063X_REG_8BIT(0xc332), 0x00 },
> +	{ OV1063X_REG_8BIT(0xc333), 0xd9 },
> +	{ OV1063X_REG_8BIT(0xc334), 0x00 },
> +	{ OV1063X_REG_8BIT(0xc335), 0x2e },
> +	{ OV1063X_REG_8BIT(0xc336), 0x00 },
> +	{ OV1063X_REG_8BIT(0xc337), 0xb1 },
> +	{ OV1063X_REG_8BIT(0xc338), 0xff },
> +	{ OV1063X_REG_8BIT(0xc339), 0x64 },
> +	{ OV1063X_REG_8BIT(0xc33a), 0xff },
> +	{ OV1063X_REG_8BIT(0xc33b), 0xeb },
> +	{ OV1063X_REG_8BIT(0xc33c), 0xff },
> +	{ OV1063X_REG_8BIT(0xc33d), 0xe8 },
> +	{ OV1063X_REG_8BIT(0xc33e), 0x00 },
> +	{ OV1063X_REG_8BIT(0xc33f), 0x48 },
> +	{ OV1063X_REG_8BIT(0xc340), 0xff },
> +	{ OV1063X_REG_8BIT(0xc341), 0xd0 },
> +	{ OV1063X_REG_8BIT(0xc342), 0xff },
> +	{ OV1063X_REG_8BIT(0xc343), 0xed },
> +	{ OV1063X_REG_8BIT(0xc344), 0xff },
> +	{ OV1063X_REG_8BIT(0xc345), 0xad },
> +	{ OV1063X_REG_8BIT(0xc346), 0x00 },
> +	{ OV1063X_REG_8BIT(0xc347), 0x66 },
> +	{ OV1063X_REG_8BIT(0xc348), 0x01 },
> +	{ OV1063X_REG_8BIT(0xc349), 0x00 },
> +	{ OV1063X_TPM_SLOPE(0), 4 },
> +	{ OV1063X_TPM_SLOPE(1), 123 },
> +	{ OV1063X_TPM_OFFSET(0), 253 },
> +	{ OV1063X_TPM_OFFSET(1), 249 },
> +	{ OV1063X_TPM_OFFSET(2), 61 },
> +	{ OV1063X_TPM_OFFSET(3), 113 },
> +	{ OV1063X_TPM_CTRL6, 0x70 | OV1063X_TPM_CTRL6_CLK_DIV(1) },
> +	{ OV1063X_REG_8BIT(0x6708), 0x05 },
> +	{ OV1063X_REG_8BIT(0x3822), 0x50 },
> +	{ OV1063X_PARI_ADDR_MIN, 0x6f00 },
> +	{ OV1063X_PARI_ADDR_MAX, 0x6f00 },
> +	{ OV1063X_GROUP_WRITER_COMMAND, OV1063X_GROUP_WRITER_COMMAND_EN },
> +};
> +
> +static const struct ov1063x_reg ov1063x_regs_bt656[] = {
> +	{ OV1063X_DVP_MOD_SEL, OV1063X_DVP_MOD_SEL_CCIR_656 },
> +	{ OV1063X_FORMAT_YMAX, 1016 },
> +	{ OV1063X_FORMAT_YMIN, 8 },
> +	{ OV1063X_FORMAT_UMAX, 1016 },
> +	{ OV1063X_FORMAT_UMIN, 8 },
> +};
> +
> +static const struct ov1063x_reg ov1063x_regs_bt656_10bit[] = {
> +	{ OV1063X_DVP_MOD_SEL, OV1063X_DVP_MOD_SEL_CCIR_656 },
> +	{ OV1063X_FORMAT_YMAX, 1022 },
> +	{ OV1063X_FORMAT_YMIN, 2 },
> +	{ OV1063X_FORMAT_UMAX, 1022 },
> +	{ OV1063X_FORMAT_UMIN, 2 },
> +};
> +
> +static const struct ov1063x_reg ov1063x_regs_vert_no_sub[] = {
> +	{ OV1063X_TIMING_CTRL1C, 0 },
> +	{ OV1063X_VSTART_OFFSET, 12 },
> +	{ OV1063X_START_LINE, 4 },
> +	{ OV1063X_LINE_NUM, 8 },
> +	{ OV1063X_BLC_AVG_CTRL1, 0x20 },
> +	{ OV1063X_BLC_AVG_CTRL2, 0x22 },
> +	{ OV1063X_REG_8BIT(0x6e47), 0x0c },
> +	{ OV1063X_EMB_START_PCNT, 1281 },
> +	{ OV1063X_EMB_START_LCNT, 16 },
> +};
> +
> +static const struct ov1063x_reg ov1063x_regs_vert_sub2[] = {
> +	{ OV1063X_TIMING_CTRL1C, OV1063X_TIMING_CTRL1C_VSUB2 },
> +	{ OV1063X_VSTART_OFFSET, 6 },
> +	{ OV1063X_START_LINE, 2 },
> +	{ OV1063X_LINE_NUM, 2 },
> +	{ OV1063X_BLC_AVG_CTRL1, 0x10 },
> +	{ OV1063X_BLC_AVG_CTRL2, 0x11 },
> +	{ OV1063X_REG_8BIT(0x6e47), 0x06 },
> +	{ OV1063X_EMB_START_PCNT, 769 },
> +	{ OV1063X_EMB_START_LCNT, 10 },
> +};
> +
> +/*
> + * Datasheet highlight the following sequence to enable and disable
> + * Test Pattern mode i.e. colobar
> + */
> +static const struct ov1063x_reg ov1063x_regs_colorbar_enable[] = {
> +	{ OV1063X_GAIN_AWB_CTRL32, OV1063X_GAIN_AWB_CTRL32_MANUAL_EN },
> +	{ OV1063X_AEC_CTRLD0, OV1063X_AEC_CTRLD0_R_MAN_EN(1) },
> +	{ OV1063X_REG_8BIT(0x5300), 0x01 }, { OV1063X_REG_8BIT(0x5301), 0x00 },
> +	{ OV1063X_REG_8BIT(0x5302), 0x00 }, { OV1063X_REG_8BIT(0x5303), 0x00 },
> +	{ OV1063X_REG_8BIT(0x5304), 0x00 }, { OV1063X_REG_8BIT(0x5305), 0x00 },
> +	{ OV1063X_REG_8BIT(0x5306), 0x00 }, { OV1063X_REG_8BIT(0x5307), 0x00 },
> +	{ OV1063X_REG_8BIT(0x5308), 0x01 }, { OV1063X_REG_8BIT(0x5309), 0x00 },
> +	{ OV1063X_REG_8BIT(0x530a), 0x00 }, { OV1063X_REG_8BIT(0x530b), 0x00 },
> +	{ OV1063X_REG_8BIT(0x530c), 0x00 }, { OV1063X_REG_8BIT(0x530d), 0x00 },
> +	{ OV1063X_REG_8BIT(0x530e), 0x00 }, { OV1063X_REG_8BIT(0x530f), 0x00 },
> +	{ OV1063X_REG_8BIT(0x5310), 0x01 }, { OV1063X_REG_8BIT(0x5311), 0x00 },
> +	{ OV1063X_REG_8BIT(0x5312), 0x00 }, { OV1063X_REG_8BIT(0x5313), 0x00 },
> +	{ OV1063X_REG_8BIT(0x5314), 0x01 }, { OV1063X_REG_8BIT(0x5315), 0x00 },
> +	{ OV1063X_REG_8BIT(0x5316), 0x00 }, { OV1063X_REG_8BIT(0x5317), 0x00 },
> +	{ OV1063X_REG_8BIT(0x5318), 0x00 }, { OV1063X_REG_8BIT(0x5319), 0x00 },
> +	{ OV1063X_REG_8BIT(0x531a), 0x00 }, { OV1063X_REG_8BIT(0x531b), 0x00 },
> +	{ OV1063X_REG_8BIT(0x531c), 0x01 }, { OV1063X_REG_8BIT(0x531d), 0x00 },
> +	{ OV1063X_REG_8BIT(0x531e), 0x00 }, { OV1063X_REG_8BIT(0x531f), 0x00 },
> +	{ OV1063X_REG_8BIT(0x5320), 0x00 }, { OV1063X_REG_8BIT(0x5321), 0x00 },
> +	{ OV1063X_REG_8BIT(0x5322), 0x00 }, { OV1063X_REG_8BIT(0x5323), 0x00 },
> +	{ OV1063X_REG_8BIT(0x5324), 0x01 }, { OV1063X_REG_8BIT(0x5325), 0x00 },
> +	{ OV1063X_REG_8BIT(0x5326), 0x00 }, { OV1063X_REG_8BIT(0x5327), 0x00 },
> +	{ OV1063X_REG_8BIT(0xc2ea), 0x80 }, { OV1063X_REG_8BIT(0xc2eb), 0x80 },
> +	{ OV1063X_ISP_RW00, OV1063X_ISP_RW00_COLOR_INTERP_EN |
> +			    OV1063X_ISP_RW00_DENOISE_EN |
> +			    OV1063X_ISP_RW00_WHITE_DPC_EN |
> +			    OV1063X_ISP_RW00_BLACK_DPC_EN |
> +			    OV1063X_ISP_RW00_LSC_EN },
> +};
> +
> +static const struct ov1063x_reg ov1063x_regs_colorbar_disable[] = {
> +	{ OV1063X_ISP_CTRL3D, 0 },
> +	{ OV1063X_ISP_CTRL3E, 0 },
> +	{ OV1063X_GAIN_AWB_CTRL32, 0 },
> +	{ OV1063X_AEC_CTRLD0, OV1063X_AEC_CTRLD0_R_MAN_EN(0) },
> +	{ OV1063X_REG_8BIT(0x5300), 0x01 }, { OV1063X_REG_8BIT(0x5301), 0x00 },
> +	{ OV1063X_REG_8BIT(0x5302), 0x00 }, { OV1063X_REG_8BIT(0x5303), 0x0e },
> +	{ OV1063X_REG_8BIT(0x5304), 0x00 }, { OV1063X_REG_8BIT(0x5305), 0x0e },
> +	{ OV1063X_REG_8BIT(0x5306), 0x00 }, { OV1063X_REG_8BIT(0x5307), 0x36 },
> +	{ OV1063X_REG_8BIT(0x5308), 0x00 }, { OV1063X_REG_8BIT(0x5309), 0xd9 },
> +	{ OV1063X_REG_8BIT(0x530a), 0x00 }, { OV1063X_REG_8BIT(0x530b), 0x0f },
> +	{ OV1063X_REG_8BIT(0x530c), 0x00 }, { OV1063X_REG_8BIT(0x530d), 0x2c },
> +	{ OV1063X_REG_8BIT(0x530e), 0x00 }, { OV1063X_REG_8BIT(0x530f), 0x59 },
> +	{ OV1063X_REG_8BIT(0x5310), 0x00 }, { OV1063X_REG_8BIT(0x5311), 0x7b },
> +	{ OV1063X_REG_8BIT(0x5312), 0x00 }, { OV1063X_REG_8BIT(0x5313), 0x22 },
> +	{ OV1063X_REG_8BIT(0x5314), 0x00 }, { OV1063X_REG_8BIT(0x5315), 0xd5 },
> +	{ OV1063X_REG_8BIT(0x5316), 0x00 }, { OV1063X_REG_8BIT(0x5317), 0x13 },
> +	{ OV1063X_REG_8BIT(0x5318), 0x00 }, { OV1063X_REG_8BIT(0x5319), 0x18 },
> +	{ OV1063X_REG_8BIT(0x531a), 0x00 }, { OV1063X_REG_8BIT(0x531b), 0x26 },
> +	{ OV1063X_REG_8BIT(0x531c), 0x00 }, { OV1063X_REG_8BIT(0x531d), 0xdc },
> +	{ OV1063X_REG_8BIT(0x531e), 0x00 }, { OV1063X_REG_8BIT(0x531f), 0x02 },
> +	{ OV1063X_REG_8BIT(0x5320), 0x00 }, { OV1063X_REG_8BIT(0x5321), 0x24 },
> +	{ OV1063X_REG_8BIT(0x5322), 0x00 }, { OV1063X_REG_8BIT(0x5323), 0x56 },
> +	{ OV1063X_REG_8BIT(0x5324), 0x00 }, { OV1063X_REG_8BIT(0x5325), 0x85 },
> +	{ OV1063X_REG_8BIT(0x5326), 0x00 }, { OV1063X_REG_8BIT(0x5327), 0x20 },
> +	{ OV1063X_REG_8BIT(0xc2ea), 0x7a }, { OV1063X_REG_8BIT(0xc2eb), 0x90 },
> +	{ OV1063X_ISP_RW00, OV1063X_ISP_RW00_COLOR_MATRIX_EN |
> +			    OV1063X_ISP_RW00_COLOR_INTERP_EN |
> +			    OV1063X_ISP_RW00_DENOISE_EN |
> +			    OV1063X_ISP_RW00_WHITE_DPC_EN |
> +			    OV1063X_ISP_RW00_BLACK_DPC_EN |
> +			    OV1063X_ISP_RW00_AWB_STATS_EN |
> +			    OV1063X_ISP_RW00_AWB_GAIN_EN |
> +			    OV1063X_ISP_RW00_LSC_EN },
> +};

