Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 61FB870086D
	for <lists+linux-media@lfdr.de>; Fri, 12 May 2023 14:50:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240915AbjELMu4 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 12 May 2023 08:50:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49802 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240512AbjELMux (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 12 May 2023 08:50:53 -0400
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com [IPv6:2a00:1450:4864:20::332])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3248219AD
        for <linux-media@vger.kernel.org>; Fri, 12 May 2023 05:50:50 -0700 (PDT)
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-3f42769a0c1so56918085e9.2
        for <linux-media@vger.kernel.org>; Fri, 12 May 2023 05:50:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1683895848; x=1686487848;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=tvLnaD/Ah7NIOY2zgAqAWPPu5jFI32rjX1UXqRVJnCA=;
        b=mt/Jx2mBQig3RR/Ku5jYfqHSgC41yD43+dJ4nuFzba1NeJfLnsGFaZ4PZ3sE53yHpA
         mkKn5P62OTikpxEHrEiUPgx5/KQlsHdf60RZpgxep172nXwkZk0CEOLEkp1nw0RpmrOI
         wHAnEK1JrIT5Fehy8sIYp3CgHGM1HBDMZkQaKdHg3nbIqHJoYNMoKZzURqCUMcq6p/pl
         LBR4DMPY06iNGvnPkOgwzUxBnca9xdsgqIwMJLGgZWTefp16YEFqeMKBuB9mwI7FJQNc
         gmE59P5tmktHUtLjrzcKxlrv/uBhIV/HnBeOJSAn2uM1jbSNqX5+uuinaD/xvvjnau4a
         pv0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683895848; x=1686487848;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tvLnaD/Ah7NIOY2zgAqAWPPu5jFI32rjX1UXqRVJnCA=;
        b=ULyKWdqURfGtBjX72lPPFWm13DpftDfPLG71Fyqvsj16ILsfBbSa6bo0VxjC+FJKlI
         Eg12zt91VeMW4K7oM7qM4YA5njDcGgvDporq7PbayBP6bJ1FF7fKCE/K85HOYT7Lho7m
         V/xGuiW9y5YpgmkgwcLFsvHVDwBe51pDI69KI25w3YDk+OBuBgl6lbGZKyuwOFM/CWMI
         G2LUXIN3DP/pLh0NFNbMfgaiJiYjYP+niaN4g8rTgamB45lNZqQi/9C9Vu6yjKf3P7+v
         vZVbINPhKvuyjxPB4vI5XS2zzzQadjpBVAx4445z9HcgA5vHHsqe7+9AVgm4VXMp6NAC
         r1aw==
X-Gm-Message-State: AC+VfDythD6dnORdS5RvRf90SDy5yccn+J0002jmamqpnpQs3MVt7BYK
        jR6X4bTIqqxamfSiYF9J/N0q7Q==
X-Google-Smtp-Source: ACHHUZ4Ss102W4AFbLcs3K26EbJC32yJQbf3/PL5GH/2zWzdgGhzotkwNSUVtbjS2TAmn5+qdtlzaQ==
X-Received: by 2002:a1c:7304:0:b0:3f1:8223:6683 with SMTP id d4-20020a1c7304000000b003f182236683mr15590537wmb.40.1683895848531;
        Fri, 12 May 2023 05:50:48 -0700 (PDT)
Received: from [192.168.0.162] (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id s7-20020a1cf207000000b003f1733feb3dsm28466046wmc.0.2023.05.12.05.50.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 12 May 2023 05:50:47 -0700 (PDT)
Message-ID: <ca7e84ff-bdb3-8b37-d52d-7afd2c576c98@linaro.org>
Date:   Fri, 12 May 2023 13:50:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v5 3/6] media: starfive: Add basic driver
Content-Language: en-US
To:     Jack Zhu <jack.zhu@starfivetech.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Robert Foss <rfoss@kernel.org>,
        Todor Tomov <todor.too@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Eugen Hristev <eugen.hristev@collabora.com>,
        Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Cc:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, changhuang.liang@starfivetech.com
References: <20230512102844.51084-1-jack.zhu@starfivetech.com>
 <20230512102844.51084-4-jack.zhu@starfivetech.com>
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20230512102844.51084-4-jack.zhu@starfivetech.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 12/05/2023 11:28, Jack Zhu wrote:
> Add basic platform driver for StarFive Camera Subsystem.
> 
> Signed-off-by: Jack Zhu <jack.zhu@starfivetech.com>

A couple of nits below

Other than those

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

> ---
>   MAINTAINERS                                  |   1 +
>   drivers/media/platform/Kconfig               |   1 +
>   drivers/media/platform/Makefile              |   1 +
>   drivers/media/platform/starfive/Kconfig      |  19 +
>   drivers/media/platform/starfive/Makefile     |   9 +
>   drivers/media/platform/starfive/stf_camss.c  | 372 +++++++++++++++++++
>   drivers/media/platform/starfive/stf_camss.h  | 153 ++++++++
>   drivers/media/platform/starfive/stf_common.h |  18 +
>   8 files changed, 574 insertions(+)
>   create mode 100644 drivers/media/platform/starfive/Kconfig
>   create mode 100644 drivers/media/platform/starfive/Makefile
>   create mode 100644 drivers/media/platform/starfive/stf_camss.c
>   create mode 100644 drivers/media/platform/starfive/stf_camss.h
>   create mode 100644 drivers/media/platform/starfive/stf_common.h
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 71291dc58671..33a752569942 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -20077,6 +20077,7 @@ L:	linux-media@vger.kernel.org
>   S:	Maintained
>   F:	Documentation/admin-guide/media/starfive_camss.rst
>   F:	Documentation/devicetree/bindings/media/starfive,jh7110-camss.yaml
> +F:	drivers/media/platform/starfive/
>   
>   STARFIVE DEVICETREES
>   M:	Emil Renner Berthing <kernel@esmil.dk>
> diff --git a/drivers/media/platform/Kconfig b/drivers/media/platform/Kconfig
> index ee579916f874..627eaa0ab3ee 100644
> --- a/drivers/media/platform/Kconfig
> +++ b/drivers/media/platform/Kconfig
> @@ -80,6 +80,7 @@ source "drivers/media/platform/renesas/Kconfig"
>   source "drivers/media/platform/rockchip/Kconfig"
>   source "drivers/media/platform/samsung/Kconfig"
>   source "drivers/media/platform/st/Kconfig"
> +source "drivers/media/platform/starfive/Kconfig"
>   source "drivers/media/platform/sunxi/Kconfig"
>   source "drivers/media/platform/ti/Kconfig"
>   source "drivers/media/platform/verisilicon/Kconfig"
> diff --git a/drivers/media/platform/Makefile b/drivers/media/platform/Makefile
> index 5453bb868e67..5a038498a370 100644
> --- a/drivers/media/platform/Makefile
> +++ b/drivers/media/platform/Makefile
> @@ -23,6 +23,7 @@ obj-y += renesas/
>   obj-y += rockchip/
>   obj-y += samsung/
>   obj-y += st/
> +obj-y += starfive/
>   obj-y += sunxi/
>   obj-y += ti/
>   obj-y += verisilicon/
> diff --git a/drivers/media/platform/starfive/Kconfig b/drivers/media/platform/starfive/Kconfig
> new file mode 100644
> index 000000000000..1a2293475bd2
> --- /dev/null
> +++ b/drivers/media/platform/starfive/Kconfig
> @@ -0,0 +1,19 @@
> +# SPDX-License-Identifier: GPL-2.0-only
> +
> +comment "Starfive media platform drivers"
> +
> +config VIDEO_STARFIVE_CAMSS
> +	tristate "Starfive Camera Subsystem driver"
> +	depends on V4L_PLATFORM_DRIVERS
> +	depends on VIDEO_DEV && OF
> +	depends on DMA_CMA
> +	select MEDIA_CONTROLLER
> +	select VIDEO_V4L2_SUBDEV_API
> +	select VIDEOBUF2_DMA_CONTIG
> +	select V4L2_FWNODE
> +	help
> +	   Enable this to support for the Starfive Camera subsystem
> +	   found on Starfive JH7110 SoC.
> +
> +	   To compile this driver as a module, choose M here: the
> +	   module will be called stf-camss.
> diff --git a/drivers/media/platform/starfive/Makefile b/drivers/media/platform/starfive/Makefile
> new file mode 100644
> index 000000000000..796775fa52f4
> --- /dev/null
> +++ b/drivers/media/platform/starfive/Makefile
> @@ -0,0 +1,9 @@
> +# SPDX-License-Identifier: GPL-2.0
> +#
> +# Makefile for StarFive camera subsystem driver.
> +#
> +
> +starfive-camss-objs += \
> +		stf_camss.o
> +
> +obj-$(CONFIG_VIDEO_STARFIVE_CAMSS) += starfive-camss.o \
> diff --git a/drivers/media/platform/starfive/stf_camss.c b/drivers/media/platform/starfive/stf_camss.c
> new file mode 100644
> index 000000000000..ba3a2bc8a8ab
> --- /dev/null
> +++ b/drivers/media/platform/starfive/stf_camss.c
> @@ -0,0 +1,372 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * stf_camss.c
> + *
> + * Starfive Camera Subsystem driver
> + *
> + * Copyright (C) 2021-2023 StarFive Technology Co., Ltd.
> + */
> +#include <linux/module.h>
> +#include <linux/of.h>
> +#include <linux/of_graph.h>
> +#include <linux/platform_device.h>
> +#include <linux/pm_runtime.h>
> +#include <linux/videodev2.h>
> +#include <media/media-device.h>
> +#include <media/v4l2-async.h>
> +#include <media/v4l2-fwnode.h>
> +#include <media/v4l2-mc.h>
> +
> +#include "stf_camss.h"
> +
> +static const char * const stfcamss_clocks[] = {
> +	"clk_apb_func",
> +	"clk_wrapper_clk_c",
> +	"clk_dvp_inv",
> +	"clk_axiwr",
> +	"clk_mipi_rx0_pxl",
> +	"clk_ispcore_2x",
> +	"clk_isp_axi",
> +};
> +
> +static const char * const stfcamss_resets[] = {
> +	"rst_wrapper_p",
> +	"rst_wrapper_c",
> +	"rst_axird",
> +	"rst_axiwr",
> +	"rst_isp_top_n",
> +	"rst_isp_top_axi",
> +};
> +
> +static int stfcamss_get_mem_res(struct platform_device *pdev,
> +				struct stfcamss *stfcamss)
> +{
> +	stfcamss->syscon_base =
> +		devm_platform_ioremap_resource_byname(pdev, "syscon");
> +	if (IS_ERR(stfcamss->syscon_base))
> +		return PTR_ERR(stfcamss->syscon_base);
> +
> +	stfcamss->isp_base =
> +		devm_platform_ioremap_resource_byname(pdev, "isp");
> +	if (IS_ERR(stfcamss->isp_base))
> +		return PTR_ERR(stfcamss->isp_base);
> +
> +	return 0;
> +}
> +
> +/*
> + * stfcamss_of_parse_endpoint_node - Parse port endpoint node
> + * @dev: Device
> + * @node: Device node to be parsed
> + * @csd: Parsed data from port endpoint node
> + *
> + * Return 0 on success or a negative error code on failure
> + */
> +static int stfcamss_of_parse_endpoint_node(struct device *dev,
> +					   struct device_node *node,
> +					   struct stfcamss_async_subdev *csd)
> +{
> +	struct v4l2_fwnode_endpoint vep = { { 0 } };
> +
> +	v4l2_fwnode_endpoint_parse(of_fwnode_handle(node), &vep);
> +	dev_dbg(dev, "vep.base.port = 0x%x, id = 0x%x\n",
> +		vep.base.port, vep.base.id);
> +
> +	csd->port = vep.base.port;
> +
> +	return 0;
> +}
> +
> +/*
> + * stfcamss_of_parse_ports - Parse ports node
> + * @stfcamss: STFCAMSS device
> + *
> + * Return number of "port" nodes found in "ports" node
> + */
> +static int stfcamss_of_parse_ports(struct stfcamss *stfcamss)
> +{
> +	struct device *dev = stfcamss->dev;
> +	struct device_node *node = NULL;
> +	struct device_node *remote = NULL;
> +	int ret, num_subdevs = 0;
> +
> +	for_each_endpoint_of_node(dev->of_node, node) {
> +		struct stfcamss_async_subdev *csd;
> +
> +		if (!of_device_is_available(node))
> +			continue;
> +
> +		remote = of_graph_get_remote_port_parent(node);
> +		if (!remote) {
> +			dev_err(dev, "Cannot get remote parent\n");
> +			ret = -EINVAL;
> +			goto err_cleanup;
> +		}
> +
> +		csd = v4l2_async_nf_add_fwnode(&stfcamss->notifier,
> +					       of_fwnode_handle(remote),
> +					       struct stfcamss_async_subdev);
> +		of_node_put(remote);
> +		if (IS_ERR(csd)) {
> +			ret = PTR_ERR(csd);
> +			goto err_cleanup;
> +		}
> +
> +		ret = stfcamss_of_parse_endpoint_node(dev, node, csd);
> +		if (ret < 0)
> +			goto err_cleanup;
> +
> +		num_subdevs++;
> +	}
> +
> +	return num_subdevs;
> +
> +err_cleanup:
> +	of_node_put(node);
> +	return ret;
> +}
> +
> +static int stfcamss_subdev_notifier_bound(struct v4l2_async_notifier *async,
> +					  struct v4l2_subdev *subdev,
> +					  struct v4l2_async_subdev *asd)
> +{
> +	struct stfcamss *stfcamss =
> +		container_of(async, struct stfcamss, notifier);
> +	struct host_data *host_data = &stfcamss->host_data;
> +	struct media_entity *source;
> +	int i, j;
> +
> +	source = &subdev->entity;
> +
> +	for (i = 0; i < source->num_pads; i++) {
> +		if (source->pads[i].flags & MEDIA_PAD_FL_SOURCE)
> +			break;
> +	}
> +
> +	if (i == source->num_pads) {
> +		dev_err(stfcamss->dev, "No source pad in external entity\n");
> +		return -EINVAL;
> +	}
> +
> +	for (j = 0; host_data->host_entity[j] && (j < HOST_ENTITY_MAX); j++) {
> +		struct media_entity *input;
> +		int ret;
> +
> +		input = host_data->host_entity[j];
> +
> +		ret = media_create_pad_link(
> +			source,
> +			i,
> +			input,
> +			STF_PAD_SINK,
> +			source->function == MEDIA_ENT_F_CAM_SENSOR ?
> +			MEDIA_LNK_FL_IMMUTABLE | MEDIA_LNK_FL_ENABLED :
> +			0);
> +		if (ret < 0) {
> +			dev_err(stfcamss->dev,
> +				"Failed to link %s->%s entities: %d\n",
> +				source->name, input->name, ret);
> +			return ret;
> +		}
> +	}
> +
> +	return 0;
> +}
> +
> +static int stfcamss_subdev_notifier_complete(struct v4l2_async_notifier *ntf)
> +{
> +	struct stfcamss *stfcamss =
> +		container_of(ntf, struct stfcamss, notifier);
> +
> +	return v4l2_device_register_subdev_nodes(&stfcamss->v4l2_dev);
> +}
> +
> +static const struct v4l2_async_notifier_operations
> +stfcamss_subdev_notifier_ops = {
> +	.bound = stfcamss_subdev_notifier_bound,
> +	.complete = stfcamss_subdev_notifier_complete,
> +};
> +
> +static const struct media_device_ops stfcamss_media_ops = {
> +	.link_notify = v4l2_pipeline_link_notify,
> +};
> +
> +static void stfcamss_mc_init(struct platform_device *pdev,
> +			     struct stfcamss *stfcamss)
> +{
> +	stfcamss->media_dev.dev = stfcamss->dev;
> +	strscpy(stfcamss->media_dev.model, "Starfive Camera Subsystem",
> +		sizeof(stfcamss->media_dev.model));
> +	snprintf(stfcamss->media_dev.bus_info,
> +		 sizeof(stfcamss->media_dev.bus_info),
> +		 "%s:%s", dev_bus_name(&pdev->dev), pdev->name);
> +	stfcamss->media_dev.hw_revision = 0x01;
> +	stfcamss->media_dev.ops = &stfcamss_media_ops;
> +	media_device_init(&stfcamss->media_dev);
> +
> +	stfcamss->v4l2_dev.mdev = &stfcamss->media_dev;
> +}
> +
> +/*
> + * stfcamss_probe - Probe STFCAMSS platform device
> + * @pdev: Pointer to STFCAMSS platform device
> + *
> + * Return 0 on success or a negative error code on failure
> + */
> +static int stfcamss_probe(struct platform_device *pdev)
> +{
> +	struct stfcamss *stfcamss;
> +	struct device *dev = &pdev->dev;
> +	int ret = 0, i, num_subdevs;
> +
> +	stfcamss = devm_kzalloc(dev, sizeof(*stfcamss), GFP_KERNEL);
> +	if (!stfcamss)
> +		return -ENOMEM;
> +
> +	for (i = 0; i < ARRAY_SIZE(stfcamss->irq); ++i) {
> +		stfcamss->irq[i] = platform_get_irq(pdev, i);
> +		if (stfcamss->irq[i] < 0)
> +			return dev_err_probe(&pdev->dev, stfcamss->irq[i],
> +					     "Failed to get clock%d", i);
> +	}
> +
> +	stfcamss->nclks = ARRAY_SIZE(stfcamss->sys_clk);
> +	for (i = 0; i < ARRAY_SIZE(stfcamss->sys_clk); ++i)

Why use ARRAY_SIZE twice - you just derived stfcamss->nclks

> +		stfcamss->sys_clk[i].id = stfcamss_clocks[i];
> +	ret = devm_clk_bulk_get(dev, stfcamss->nclks, stfcamss->sys_clk);
> +	if (ret) {
> +		dev_err(dev, "Failed to get clk controls\n");
> +		return ret;
> +	}
> +
> +	stfcamss->nrsts = ARRAY_SIZE(stfcamss->sys_rst);
> +	for (i = 0; i < ARRAY_SIZE(stfcamss->sys_rst); ++i)

i < stfcamss->nrsts

> +		stfcamss->sys_rst[i].id = stfcamss_resets[i];
> +	ret = devm_reset_control_bulk_get_shared(dev, stfcamss->nrsts,
> +						 stfcamss->sys_rst);
> +	if (ret) {
> +		dev_err(dev, "Failed to get reset controls\n");
> +		return ret;
> +	}
> +
> +	ret = stfcamss_get_mem_res(pdev, stfcamss);
> +	if (ret) {
> +		dev_err(dev, "Could not map registers\n");
> +		return ret;
> +	}
> +
> +	stfcamss->dev = dev;
> +	platform_set_drvdata(pdev, stfcamss);
> +
> +	v4l2_async_nf_init(&stfcamss->notifier);
> +
> +	num_subdevs = stfcamss_of_parse_ports(stfcamss);
> +	if (num_subdevs < 0) {
> +		dev_err(dev, "Failed to find subdevices\n");
> +		return -ENODEV;
> +	}
> +
> +	stfcamss_mc_init(pdev, stfcamss);
> +
> +	ret = v4l2_device_register(stfcamss->dev, &stfcamss->v4l2_dev);
> +	if (ret < 0) {
> +		dev_err(dev, "Failed to register V4L2 device: %d\n", ret);
> +		goto err_cleanup_notifier;
> +	}
> +
> +	ret = media_device_register(&stfcamss->media_dev);
> +	if (ret) {
> +		dev_err(dev, "Failed to register media device: %d\n", ret);
> +		goto err_unregister_device;
> +	}
> +
> +	stfcamss->notifier.ops = &stfcamss_subdev_notifier_ops;
> +	ret = v4l2_async_nf_register(&stfcamss->v4l2_dev, &stfcamss->notifier);
> +	if (ret) {
> +		dev_err(dev, "Failed to register async subdev nodes: %d\n",
> +			ret);
> +		goto err_unregister_media_dev;
> +	}
> +
> +	pm_runtime_enable(dev);
> +
> +	return 0;
> +
> +err_unregister_media_dev:
> +	media_device_unregister(&stfcamss->media_dev);
> +err_unregister_device:
> +	v4l2_device_unregister(&stfcamss->v4l2_dev);
> +err_cleanup_notifier:
> +	v4l2_async_nf_cleanup(&stfcamss->notifier);
> +	return ret;
> +}
> +
> +/*
> + * stfcamss_remove - Remove STFCAMSS platform device
> + * @pdev: Pointer to STFCAMSS platform device
> + *
> + * Always returns 0.
> + */
> +static int stfcamss_remove(struct platform_device *pdev)
> +{
> +	struct stfcamss *stfcamss = platform_get_drvdata(pdev);
> +
> +	v4l2_device_unregister(&stfcamss->v4l2_dev);
> +	media_device_cleanup(&stfcamss->media_dev);
> +	pm_runtime_disable(&pdev->dev);
> +
> +	return 0;
> +}
> +
> +static const struct of_device_id stfcamss_of_match[] = {
> +	{ .compatible = "starfive,jh7110-camss" },
> +	{ /* sentinel */ },
> +};
> +
> +MODULE_DEVICE_TABLE(of, stfcamss_of_match);
> +
> +static int __maybe_unused stfcamss_runtime_suspend(struct device *dev)
> +{
> +	struct stfcamss *stfcamss = dev_get_drvdata(dev);
> +
> +	reset_control_assert(stfcamss->sys_rst[STF_RST_ISP_TOP_AXI].rstc);
> +	reset_control_assert(stfcamss->sys_rst[STF_RST_ISP_TOP_N].rstc);
> +	clk_disable_unprepare(stfcamss->sys_clk[STF_CLK_ISP_AXI].clk);
> +	clk_disable_unprepare(stfcamss->sys_clk[STF_CLK_ISPCORE_2X].clk);
> +
> +	return 0;
> +}
> +
> +static int __maybe_unused stfcamss_runtime_resume(struct device *dev)
> +{
> +	struct stfcamss *stfcamss = dev_get_drvdata(dev);
> +
> +	clk_prepare_enable(stfcamss->sys_clk[STF_CLK_ISPCORE_2X].clk);
> +	clk_prepare_enable(stfcamss->sys_clk[STF_CLK_ISP_AXI].clk);
> +	reset_control_deassert(stfcamss->sys_rst[STF_RST_ISP_TOP_N].rstc);
> +	reset_control_deassert(stfcamss->sys_rst[STF_RST_ISP_TOP_AXI].rstc);
> +
> +	return 0;
> +}
> +
> +static const struct dev_pm_ops stfcamss_pm_ops = {
> +	SET_RUNTIME_PM_OPS(stfcamss_runtime_suspend,
> +			   stfcamss_runtime_resume,
> +			   NULL)
> +};
> +
> +static struct platform_driver stfcamss_driver = {
> +	.probe = stfcamss_probe,
> +	.remove = stfcamss_remove,
> +	.driver = {
> +		.name = DRV_NAME,
> +		.pm = &stfcamss_pm_ops,
> +		.of_match_table = of_match_ptr(stfcamss_of_match),
> +	},
> +};
> +
> +module_platform_driver(stfcamss_driver);
> +
> +MODULE_AUTHOR("StarFive Corporation");
> +MODULE_DESCRIPTION("StarFive Camera Subsystem driver");
> +MODULE_LICENSE("GPL");
> diff --git a/drivers/media/platform/starfive/stf_camss.h b/drivers/media/platform/starfive/stf_camss.h
> new file mode 100644
> index 000000000000..8f39cd65950c
> --- /dev/null
> +++ b/drivers/media/platform/starfive/stf_camss.h
> @@ -0,0 +1,153 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * stf_camss.h
> + *
> + * Starfive Camera Subsystem driver
> + *
> + * Copyright (C) 2021-2023 StarFive Technology Co., Ltd.
> + */
> +
> +#ifndef STF_CAMSS_H
> +#define STF_CAMSS_H
> +
> +#include <linux/clk.h>
> +#include <linux/delay.h>
> +#include <linux/reset.h>
> +#include <media/v4l2-device.h>
> +
> +#include "stf_common.h"
> +
> +#define DRV_NAME     "starfive-camss"
> +#define STF_DVP_NAME "stf_dvp"
> +#define STF_CSI_NAME "cdns_csi2rx"
> +#define STF_ISP_NAME "stf_isp"
> +#define STF_VIN_NAME "stf_vin"
> +
> +#define STF_PAD_SINK   0
> +#define STF_PAD_SRC    1
> +#define STF_PADS_NUM   2
> +
> +enum port_num {
> +	PORT_NUMBER_DVP_SENSOR = 0,
> +	PORT_NUMBER_CSI2RX
> +};
> +
> +enum stf_clk {
> +	STF_CLK_APB_FUNC = 0,
> +	STF_CLK_WRAPPER_CLK_C,
> +	STF_CLK_DVP_INV,
> +	STF_CLK_AXIWR,
> +	STF_CLK_MIPI_RX0_PXL,
> +	STF_CLK_ISPCORE_2X,
> +	STF_CLK_ISP_AXI,
> +	STF_CLK_NUM
> +};
> +
> +enum stf_rst {
> +	STF_RST_WRAPPER_P = 0,
> +	STF_RST_WRAPPER_C,
> +	STF_RST_AXIRD,
> +	STF_RST_AXIWR,
> +	STF_RST_ISP_TOP_N,
> +	STF_RST_ISP_TOP_AXI,
> +	STF_RST_NUM
> +};
> +
> +enum stf_irq {
> +	STF_IRQ_VINWR = 0,
> +	STF_IRQ_ISP,
> +	STF_IRQ_ISPCSIL,
> +	STF_IRQ_NUM
> +};
> +
> +#define HOST_ENTITY_MAX		2
> +
> +struct host_data {
> +	struct media_entity *host_entity[HOST_ENTITY_MAX];
> +};
> +
> +struct stfcamss {
> +	struct v4l2_device v4l2_dev;
> +	struct media_device media_dev;
> +	struct media_pipeline pipe;
> +	struct device *dev;
> +	struct v4l2_async_notifier notifier;
> +	struct host_data host_data;
> +	void __iomem *syscon_base;
> +	void __iomem *isp_base;
> +	int irq[STF_IRQ_NUM];
> +	struct clk_bulk_data sys_clk[STF_CLK_NUM];
> +	int nclks;
> +	struct reset_control_bulk_data sys_rst[STF_RST_NUM];
> +	int nrsts;
> +};
> +
> +struct stfcamss_async_subdev {
> +	struct v4l2_async_subdev asd;  /* must be first */
> +	enum port_num port;
> +};
> +
> +static inline u32 stf_isp_reg_read(struct stfcamss *stfcamss, u32 reg)
> +{
> +	return ioread32(stfcamss->isp_base + reg);
> +}
> +
> +static inline void stf_isp_reg_write(struct stfcamss *stfcamss,
> +				     u32 reg, u32 val)
> +{
> +	iowrite32(val, stfcamss->isp_base + reg);
> +}
> +
> +static inline void stf_isp_reg_write_delay(struct stfcamss *stfcamss,
> +					   u32 reg, u32 val, u32 delay)
> +{
> +	iowrite32(val, stfcamss->isp_base + reg);
> +	usleep_range(1000 * delay, 1000 * delay + 100);
> +}
> +
> +static inline void stf_isp_reg_set_bit(struct stfcamss *stfcamss,
> +				       u32 reg, u32 mask, u32 val)
> +{
> +	u32 value;
> +
> +	value = ioread32(stfcamss->isp_base + reg) & ~mask;
> +	val &= mask;
> +	val |= value;
> +	iowrite32(val, stfcamss->isp_base + reg);
> +}
> +
> +static inline void stf_isp_reg_set(struct stfcamss *stfcamss, u32 reg, u32 mask)
> +{
> +	iowrite32(ioread32(stfcamss->isp_base + reg) | mask,
> +		  stfcamss->isp_base + reg);
> +}
> +
> +static inline u32 stf_syscon_reg_read(struct stfcamss *stfcamss, u32 reg)
> +{
> +	return ioread32(stfcamss->syscon_base + reg);
> +}
> +
> +static inline void stf_syscon_reg_write(struct stfcamss *stfcamss,
> +					u32 reg, u32 val)
> +{
> +	iowrite32(val, stfcamss->syscon_base + reg);
> +}
> +
> +static inline void stf_syscon_reg_set_bit(struct stfcamss *stfcamss,
> +					  u32 reg, u32 bit_mask)
> +{
> +	u32 value;
> +
> +	value = ioread32(stfcamss->syscon_base + reg);
> +	iowrite32(value | bit_mask, stfcamss->syscon_base + reg);
> +}
> +
> +static inline void stf_syscon_reg_clear_bit(struct stfcamss *stfcamss,
> +					    u32 reg, u32 bit_mask)
> +{
> +	u32 value;
> +
> +	value = ioread32(stfcamss->syscon_base + reg);
> +	iowrite32(value & ~bit_mask, stfcamss->syscon_base + reg);
> +}
> +#endif /* STF_CAMSS_H */
> diff --git a/drivers/media/platform/starfive/stf_common.h b/drivers/media/platform/starfive/stf_common.h
> new file mode 100644
> index 000000000000..e04fca2d9cd4
> --- /dev/null
> +++ b/drivers/media/platform/starfive/stf_common.h
> @@ -0,0 +1,18 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * stf_common.h
> + *
> + * StarFive Camera Subsystem - Common definitions
> + *
> + * Copyright (C) 2021-2023 StarFive Technology Co., Ltd.
> + */
> +
> +#ifndef STF_COMMON_H
> +#define STF_COMMON_H
> +
> +enum stf_subdev_type {
> +	STF_SUBDEV_TYPE_VIN,
> +	STF_SUBDEV_TYPE_ISP,
> +};
> +
> +#endif /* STF_COMMON_H */

