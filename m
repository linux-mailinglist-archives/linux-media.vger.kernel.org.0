Return-Path: <linux-media+bounces-44790-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 185D8BE6673
	for <lists+linux-media@lfdr.de>; Fri, 17 Oct 2025 07:19:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id AA5F74EC00C
	for <lists+linux-media@lfdr.de>; Fri, 17 Oct 2025 05:19:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 25C7A30B50B;
	Fri, 17 Oct 2025 05:19:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EfHXTUzV"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79A502AEE1;
	Fri, 17 Oct 2025 05:19:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760678360; cv=none; b=UizdrCQtBI+s4RNbpadc9dE8W2L3AhjrAuIVSFoO8mXYwT4V5POux17vqNysNdQJozpLsafLQwDrJKhtd1NpFzlWfJ/Bq/8aZ/gwo3zQNhxOessvLzM4xgsXz3nEhbffcr/NR6bAxGkcbqSck7nH1+QB86cwtOALhkx5yV96mGA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760678360; c=relaxed/simple;
	bh=QUB/G7WsyDLzx45Unzge28OiR4IjLplv0l/Kb/Gm3EQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Y7v4L4igQrcqKgwNkADdFGMwCXmofQYhe+xMPKKw0YZjc7jyvDww7g+WRlhbSPPzfX2gQa8nffxXfdmlMpErmZqx+Fzxbn0SA81zBOErzlITR3cFdH1+/0ZC/pue+6vqMllVaGNvydMyUiSbV3ojCg8hD2OA9ccMlPvKgWQohJo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EfHXTUzV; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AB920C4CEE7;
	Fri, 17 Oct 2025 05:19:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760678360;
	bh=QUB/G7WsyDLzx45Unzge28OiR4IjLplv0l/Kb/Gm3EQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=EfHXTUzVSPL52RADebrhs3eUaBkkrBWFNZk9DES0A/fHBNpi6kYHw6m0fMaBthoJI
	 vM4PJ89glZtYqyvd6dHKU2/M6U5feQACAWqAwHqkVGWIj8Vb9goslbQDF+blr6TgQ8
	 qUwPhGcSfQ7p7xe3s/C/sOsq//9wxHgbx0xFi8ChXbSL2PsXq5RThieK25wdGvWnTL
	 k0PVR4VtC7GGEhra7tkR4sn1Wh9x8IuigneOJtPFJjSs9gwUHKrkEPu4N4+jsFYygF
	 1ygH7wXC2ZZIofuE9/1jzmP31CzWd8tZ5zkbC5SiIyuIwo2+49CxwdMXYVij+9+NV2
	 8dvPJmqdHjtrg==
Message-ID: <87e5f31a-5c3d-4cc0-8146-1b6b5923136b@kernel.org>
Date: Fri, 17 Oct 2025 07:19:14 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V4 4/4] media: ti: vpe: Add the VIP driver
To: Yemike Abhilash Chandra <y-abhilashchandra@ti.com>, mchehab@kernel.org,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 hverkuil+cisco@kernel.org
Cc: sakari.ailus@linux.intel.com, bparrot@ti.com,
 jai.luthra@ideasonboard.com, dale@farnsworth.org,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, u-kumar1@ti.com,
 Sukrut Bellary <sbellary@baylibre.com>
References: <20251015054010.3594423-1-y-abhilashchandra@ti.com>
 <20251015054010.3594423-5-y-abhilashchandra@ti.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 a/A=
In-Reply-To: <20251015054010.3594423-5-y-abhilashchandra@ti.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 15/10/2025 07:40, Yemike Abhilash Chandra wrote:
> +static int vip_probe_complete(struct platform_device *pdev)
> +{
> +	struct vip_shared *shared = platform_get_drvdata(pdev);
> +	struct vip_ctrl_module *ctrl = NULL;
> +	struct vip_port *port;
> +	struct vip_dev *dev;
> +	struct device_node *parent = pdev->dev.of_node;
> +	struct fwnode_handle *ep = NULL;
> +	struct of_phandle_args args;
> +	int ret, i, slice_id, port_id, p;
> +
> +	/* Allocate ctrl before using it */
> +	ctrl = devm_kzalloc(&pdev->dev, sizeof(*ctrl), GFP_KERNEL);
> +	if (!ctrl)
> +		return -ENOMEM;
> +
> +	if (parent && of_property_present(parent, "ti,ctrl-module")) {
> +		ctrl->syscon_pol = syscon_regmap_lookup_by_phandle(parent,
> +								   "ti,ctrl-module");
> +		if (IS_ERR(ctrl->syscon_pol))
> +			return dev_err_probe(&pdev->dev, PTR_ERR(ctrl->syscon_pol),
> +				     "Failed to get ti,ctrl-module regmap\n");
> +	}
> +
> +	ret = of_parse_phandle_with_fixed_args(parent, "ti,ctrl-module",
> +					       5, 0, &args);

1. You leak parent.
2. Why you can't just just take it from syscon call? This is not only
leaking, but actually duplicated and unnecessary.

> +
> +	if (ret) {
> +		dev_err(&pdev->dev, "failed to parse ti,ctrl-module\n");
> +		return ret;
> +	}
> +
> +	ctrl->syscon_offset = args.args[0];
> +
> +	for (i = 0; i < ARRAY_SIZE(ctrl->syscon_bit_field); i++)
> +		ctrl->syscon_bit_field[i] = args.args[i + 1];
> +
> +	for (p = 0; p < (VIP_NUM_PORTS * VIP_NUM_SLICES); p++) {
> +		ep = fwnode_graph_get_next_endpoint_by_regs(of_fwnode_handle(parent),
> +							    p, 0);
> +		if (!ep)
> +			continue;
> +
> +		switch (p) {
> +		case 0:
> +			slice_id = VIP_SLICE1;	port_id = VIP_PORTA;
> +			break;
> +		case 1:
> +			slice_id = VIP_SLICE2;	port_id = VIP_PORTA;
> +			break;
> +		case 2:
> +			slice_id = VIP_SLICE1;	port_id = VIP_PORTB;
> +			break;
> +		case 3:
> +			slice_id = VIP_SLICE2;	port_id = VIP_PORTB;
> +			break;
> +		default:
> +			dev_err(&pdev->dev, "Unknown port reg=<%d>\n", p);
> +			continue;
> +		}
> +
> +		ret = alloc_port(shared->devs[slice_id], port_id);
> +		if (ret < 0)
> +			continue;
> +
> +		dev = shared->devs[slice_id];
> +		dev->syscon = ctrl;
> +		port = dev->ports[port_id];
> +
> +		vip_register_subdev_notif(port, ep);
> +		fwnode_handle_put(ep);
> +	}
> +	return 0;
> +}
> +
> +static int vip_probe_slice(struct platform_device *pdev, int slice)
> +{
> +	struct vip_shared *shared = platform_get_drvdata(pdev);
> +	struct vip_dev *dev;
> +	struct vip_parser_data *parser;
> +	struct sc_data *sc;
> +	struct csc_data *csc;
> +	int ret;
> +
> +	dev = devm_kzalloc(&pdev->dev, sizeof(*dev), GFP_KERNEL);
> +	if (!dev)
> +		return -ENOMEM;
> +
> +	dev->irq = platform_get_irq(pdev, slice);
> +	if (dev->irq < 0)
> +		return dev->irq;
> +
> +	ret = devm_request_irq(&pdev->dev, dev->irq, vip_irq,
> +			       0, VIP_MODULE_NAME, dev);
> +	if (ret < 0)
> +		return -ENOMEM;
> +
> +	spin_lock_init(&dev->slock);
> +	mutex_init(&dev->mutex);
> +
> +	dev->slice_id = slice;
> +	dev->pdev = pdev;
> +	dev->res = shared->res;
> +	dev->base = shared->base;
> +	dev->v4l2_dev = shared->v4l2_dev;
> +
> +	dev->shared = shared;
> +	shared->devs[slice] = dev;
> +
> +	vip_top_reset(dev);
> +	vip_set_slice_path(dev, VIP_MULTI_CHANNEL_DATA_SELECT, 1);
> +
> +	parser = devm_kzalloc(&pdev->dev, sizeof(*dev->parser), GFP_KERNEL);
> +	if (!parser)
> +		return PTR_ERR(parser);
> +
> +	parser->base = dev->base + (slice ? VIP_SLICE1_PARSER : VIP_SLICE0_PARSER);
> +	if (IS_ERR(parser->base))
> +		return PTR_ERR(parser->base);
> +
> +	parser->pdev = pdev;
> +	dev->parser = parser;
> +
> +	dev->sc_assigned = VIP_NOT_ASSIGNED;
> +	sc = devm_kzalloc(&pdev->dev, sizeof(*dev->sc), GFP_KERNEL);
> +	if (!sc)
> +		return PTR_ERR(sc);
> +
> +	sc->base = dev->base + (slice ? VIP_SLICE1_SC : VIP_SLICE0_SC);
> +	if (IS_ERR(sc->base))
> +		return PTR_ERR(sc->base);
> +
> +	sc->pdev = pdev;
> +	dev->sc = sc;
> +
> +	dev->csc_assigned = VIP_NOT_ASSIGNED;
> +	csc = devm_kzalloc(&pdev->dev, sizeof(*dev->csc), GFP_KERNEL);
> +	if (!csc)
> +		return PTR_ERR(csc);
> +
> +	csc->base = dev->base + (slice ? VIP_SLICE1_CSC : VIP_SLICE0_CSC);
> +	if (IS_ERR(csc->base))
> +		return PTR_ERR(csc->base);
> +
> +	csc->pdev = pdev;
> +	dev->csc = csc;
> +
> +	return 0;
> +}
> +
> +static int vip_probe(struct platform_device *pdev)
> +{
> +	struct vip_shared *shared;
> +	struct pinctrl *pinctrl;
> +	int ret, slice = VIP_SLICE1;
> +	u32 tmp, pid;
> +
> +	/* If there are no endpoint defined there is nothing to do */
> +	if (!vip_endpoint_scan(pdev)) {
> +		dev_err(&pdev->dev, "%s: No sensor", __func__);
> +		return -ENODEV;
> +	}
> +
> +	ret = dma_coerce_mask_and_coherent(&pdev->dev, DMA_BIT_MASK(32));
> +	if (ret) {
> +		dev_err(&pdev->dev,
> +			"32-bit consistent DMA enable failed\n");
> +		return ret;
> +	}
> +
> +	shared = devm_kzalloc(&pdev->dev, sizeof(*shared), GFP_KERNEL);
> +	if (!shared)
> +		return -ENOMEM;
> +
> +	shared->res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> +	shared->base = devm_ioremap_resource(&pdev->dev, shared->res);

Use proper wrapper for these two.

> +	if (IS_ERR(shared->base))
> +		return PTR_ERR(shared->base);
> +
> +	vip_init_format_info(&pdev->dev);
> +
> +	pinctrl = devm_pinctrl_get_select_default(&pdev->dev);
> +
> +	pm_runtime_enable(&pdev->dev);
> +
> +	ret = pm_runtime_get_sync(&pdev->dev);
> +	if (ret)
> +		goto err_runtime_disable;
> +
> +	/* Make sure H/W module has the right functionality */
> +	pid = reg_read(shared, VIP_PID);
> +	tmp = get_field(pid, VIP_PID_FUNC_MASK, VIP_PID_FUNC_SHIFT);
> +
> +	if (tmp != VIP_PID_FUNC) {
> +		dev_info(&pdev->dev, "vip: unexpected PID function: 0x%x\n",
> +			 tmp);
> +		ret = -ENODEV;
> +		goto err_runtime_put;
> +	}
> +
> +	ret = v4l2_device_register(&pdev->dev, &shared->v4l2_dev);
> +	if (ret)
> +		goto err_runtime_put;
> +
> +	/* enable clocks, so the firmware will load properly */
> +	vip_shared_set_clock_enable(shared, 1);
> +	vip_top_vpdma_reset(shared);
> +
> +	platform_set_drvdata(pdev, shared);
> +
> +	v4l2_ctrl_handler_init(&shared->ctrl_handler, 11);
> +	shared->v4l2_dev.ctrl_handler = &shared->ctrl_handler;
> +
> +	for (slice = VIP_SLICE1; slice < VIP_NUM_SLICES; slice++) {
> +		ret = vip_probe_slice(pdev, slice);
> +		if (ret) {
> +			dev_err(&pdev->dev, "Creating slice failed");
> +			goto err_dev_unreg;
> +		}
> +	}
Best regards,
Krzysztof

