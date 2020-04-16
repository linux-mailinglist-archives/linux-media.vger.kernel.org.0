Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A36CF1AC1C3
	for <lists+linux-media@lfdr.de>; Thu, 16 Apr 2020 14:48:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2636238AbgDPMsq (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 16 Apr 2020 08:48:46 -0400
Received: from foss.arm.com ([217.140.110.172]:60258 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2635962AbgDPMsj (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 16 Apr 2020 08:48:39 -0400
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B0A39C14;
        Thu, 16 Apr 2020 05:48:38 -0700 (PDT)
Received: from [10.57.59.184] (unknown [10.57.59.184])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 940FD3F68F;
        Thu, 16 Apr 2020 05:48:36 -0700 (PDT)
Subject: Re: [PATCH 2/3] media: rockchip: Introduce driver for Rockhip's
 camera interface
To:     Maxime Chevallier <maxime.chevallier@bootlin.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Heiko Stuebner <heiko@sntech.de>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc:     devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        linux-rockchip@lists.infradead.org,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
        Miquel Raynal <miquel.raynal@bootlin.com>,
        linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
References: <20200403142122.297283-1-maxime.chevallier@bootlin.com>
 <20200403142122.297283-3-maxime.chevallier@bootlin.com>
From:   Robin Murphy <robin.murphy@arm.com>
Message-ID: <18d46e23-a7fa-ddaf-690f-f06580a536cb@arm.com>
Date:   Thu, 16 Apr 2020 13:48:35 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200403142122.297283-3-maxime.chevallier@bootlin.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Maxime,

Just a handful of drive-by cleanup suggestions to help this smell less 
like a BSP driver...

(one day I still hope to get round to playing with what appears to be 
the DVP interface populated but unused inside my RK3288 box, and the 
camera module I picked up to supposedly fit it, but alas not today)

On 2020-04-03 3:21 pm, Maxime Chevallier wrote:
[...]
> +static int rkcif_plat_probe(struct platform_device *pdev)
> +{
> +	const struct of_device_id *match;
> +	struct device_node *node = pdev->dev.of_node;
> +	struct device *dev = &pdev->dev;
> +	struct v4l2_device *v4l2_dev;
> +	struct rkcif_device *cif_dev;
> +	const struct cif_match_data *data;
> +	struct resource *res;
> +	int i, ret, irq;
> +
> +	match = of_match_node(rkcif_plat_of_match, node);
> +	if (IS_ERR(match))
> +		return PTR_ERR(match);

of_device_get_match_data()

> +
> +	cif_dev = devm_kzalloc(dev, sizeof(*cif_dev), GFP_KERNEL);
> +	if (!cif_dev)
> +		return -ENOMEM;
> +
> +	dev_set_drvdata(dev, cif_dev);
> +	cif_dev->dev = dev;
> +
> +	irq = platform_get_irq(pdev, 0);
> +	if (irq < 0)
> +		return irq;
> +
> +	ret = devm_request_irq(dev, irq, rkcif_irq_handler, IRQF_SHARED,
> +			       dev_driver_string(dev), dev);
> +	if (ret < 0) {
> +		dev_err(dev, "request irq failed: %d\n", ret);
> +		return ret;
> +	}
> +
> +	cif_dev->irq = irq;
> +	data = match->data;
> +	cif_dev->chip_id = data->chip_id;

It pretty much breaks even at the moment, but consider just holding a 
pointer to data itself rather than copying multiple fields into cif_dev, 
particularly if there's any likelihood of adding more in future. The 
couple of places clk_size and chip_id are used here don't really look 
like critical fast-paths where cache/TLB locality is super-important.

> +
> +	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> +	cif_dev->base_addr = devm_ioremap_resource(dev, res);

devm_platform_ioremap_resource()

> +
> +	if (IS_ERR(cif_dev->base_addr))
> +		return PTR_ERR(cif_dev->base_addr);
> +
> +	if (data->clks_num > RKCIF_MAX_BUS_CLK ||
> +		data->rsts_num > RKCIF_MAX_RESET) {

It's silly to have runtime checks of constants - BUILD_BUG_ON() 
somewhere if you really want to validate that the driver data is 
self-consistent.

> +		dev_err(dev, "out of range: clks(%d %d) rsts(%d %d)\n",
> +			data->clks_num, RKCIF_MAX_BUS_CLK,
> +			data->rsts_num, RKCIF_MAX_RESET);
> +		return -EINVAL;
> +	}
> +
> +	for (i = 0; i < data->clks_num; i++) {
> +		struct clk *clk = devm_clk_get(dev, data->clks[i]);
> +
> +		if (IS_ERR(clk)) {
> +			dev_err(dev, "failed to get %s\n", data->clks[i]);
> +			return PTR_ERR(clk);
> +		}
> +
> +		cif_dev->clks[i] = clk;
> +	}

All of the clock handling looks like it could use the clk_bulk_* APIs.

> +
> +	cif_dev->clk_size = data->clks_num;
> +
> +	for (i = 0; i < data->rsts_num; i++) {
> +		struct reset_control *rst =
> +			devm_reset_control_get(dev, data->rsts[i]);
> +		if (IS_ERR(rst)) {
> +			dev_err(dev, "failed to get %s\n", data->rsts[i]);
> +			return PTR_ERR(rst);
> +		}
> +		cif_dev->cif_rst[i] = rst;
> +	}

And possibly the reset_control_array_* APIs for resets? (assuming there 
isn't a subtle ordering requirement implicit in data->rsts)

> +
> +	/* Initialize the stream */
> +	rkcif_stream_init(cif_dev);
> +
> +	strlcpy(cif_dev->media_dev.model, "rkcif",
> +		sizeof(cif_dev->media_dev.model));
> +	cif_dev->media_dev.dev = &pdev->dev;
> +	v4l2_dev = &cif_dev->v4l2_dev;
> +	v4l2_dev->mdev = &cif_dev->media_dev;
> +	strlcpy(v4l2_dev->name, "rkcif", sizeof(v4l2_dev->name));
> +	v4l2_ctrl_handler_init(&cif_dev->ctrl_handler, 8);
> +	v4l2_dev->ctrl_handler = &cif_dev->ctrl_handler;
> +
> +	ret = v4l2_device_register(cif_dev->dev, &cif_dev->v4l2_dev);
> +	if (ret < 0)
> +		return ret;
> +
> +	media_device_init(&cif_dev->media_dev);
> +
> +	ret = media_device_register(&cif_dev->media_dev);
> +	if (ret < 0) {
> +		v4l2_err(v4l2_dev, "Failed to register media device: %d\n",
> +			 ret);
> +		goto err_unreg_v4l2_dev;
> +	}
> +
> +	/* create & register platefom subdev (from of_node) */
> +	ret = rkcif_register_platform_subdevs(cif_dev);
> +	if (ret < 0)
> +		goto err_unreg_media_dev;
> +
> +	ret = of_reserved_mem_device_init(dev);
> +	if (ret)
> +		v4l2_warn(v4l2_dev, "No reserved memory region assign to CIF\n");

It feels like that should probably happen earlier in the "resource 
acquisition" part of probe, before any external init/register calls that 
in principle could want to preallocate DMA buffers.

Also, is the lack of reserved memory really a warn-level condition? The 
DT binding doesn't even appear to treat a "memory-region" property as 
legal, and with CMA or (as appears to be the case for at least RK3288) 
an IOMMU, it should be largely moot anyway.

Robin.

> +
> +	pm_runtime_enable(&pdev->dev);
> +
> +	return 0;
> +
> +err_unreg_media_dev:
> +	media_device_unregister(&cif_dev->media_dev);
> +err_unreg_v4l2_dev:
> +	v4l2_device_unregister(&cif_dev->v4l2_dev);
> +	return ret;
> +}
