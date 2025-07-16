Return-Path: <linux-media+bounces-37879-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EBE2B077A2
	for <lists+linux-media@lfdr.de>; Wed, 16 Jul 2025 16:10:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4E4C91C21676
	for <lists+linux-media@lfdr.de>; Wed, 16 Jul 2025 14:09:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D66EE21C9F9;
	Wed, 16 Jul 2025 14:09:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="syE+r3sV"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3263621C16A;
	Wed, 16 Jul 2025 14:09:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752674960; cv=none; b=P2lOdp9CBJruPEvtPw6BbegKjjmafw+4fJh1LU8lRmVBnqjGn9hp5skZlBhZPniZJ3xOskRF7mrSZMQDVdrS0MlDYzWu06OQSp2tqJwgFhMzxDBS29X5dqtdnv9UnSqA/Zl7Z2OxknSX5UHFp+SEI4JWgPfDwl59Vl1xwrkspkc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752674960; c=relaxed/simple;
	bh=wRoG1SA5cQDEQUbD+BeqOCdpMvHnqL8ubHtD4uhAfmQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SKTfI1iMDTHg9JezshsePYOuIP+E9K1IPfRECy3z4dnSAbQ3QxosddOWDsUnhfT80mswzWQbKh1m5DD8gD4ikADHEK1D2AEKW408vsJ7CQ0rC9l3M4FejjmZbZ0/ROqKEo0PZEal+8bwirBsCv+L7tw1IitW5L85GzzM9nqIVPM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=syE+r3sV; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 51CD1C4CEE7;
	Wed, 16 Jul 2025 14:09:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752674959;
	bh=wRoG1SA5cQDEQUbD+BeqOCdpMvHnqL8ubHtD4uhAfmQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=syE+r3sVJRyeMirB3BxlHoUKGdcwIn/tgwaZVLkT8lnOfgJhBmAkTn6/3dhThpqY/
	 pd5WZjZKkrtVsOgvhFownz1juJndJ/exCDgrOCpJPDgnAHE/KgVxw3XmXNcd5i3dgw
	 9911OS5dHqzOdZoOWuzCMroXUyeXi6HC1+YSlJ2JcIFPprQqp91eoJA6XmPyidbBZ4
	 +of9FywlWrG7XHEbmuDMuwVQhzaMhYvqWc/NgjJWFV7msxhiooreOYP9b4v5m/7RZK
	 Ho446m7sbjzG2HsxRqPa50J8ljrml6YgdlbGqPw7ZX68Sxl8gbDfsEWsaXjTkNLnkT
	 I0n7oterzb2cg==
Message-ID: <b8149d7d-65ca-47c1-9338-45a0db614e77@kernel.org>
Date: Wed, 16 Jul 2025 16:09:12 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V2 4/4] media: ti-vpe: Add the VIP driver
To: Yemike Abhilash Chandra <y-abhilashchandra@ti.com>, mchehab@kernel.org,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org
Cc: linux@armlinux.org.uk, ardb@kernel.org, ebiggers@kernel.org,
 geert+renesas@glider.be, claudiu.beznea@tuxon.dev, bparrot@ti.com,
 andre.draszik@linaro.org, kuninori.morimoto.gx@renesas.com,
 prabhakar.mahadev-lad.rj@bp.renesas.com, heikki.krogerus@linux.intel.com,
 kory.maincent@bootlin.com, florian.fainelli@broadcom.com, lumag@kernel.org,
 dale@farnsworth.org, sbellary@baylibre.com, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, dagriego@biglakesoftware.com,
 u-kumar1@ti.com
References: <20250716111912.235157-1-y-abhilashchandra@ti.com>
 <20250716111912.235157-5-y-abhilashchandra@ti.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 a/A=
In-Reply-To: <20250716111912.235157-5-y-abhilashchandra@ti.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 16/07/2025 13:19, Yemike Abhilash Chandra wrote:

> +static int vip_probe_complete(struct platform_device *pdev)
> +{
> +	struct vip_shared *shared = platform_get_drvdata(pdev);
> +	struct regmap *syscon_pol = NULL;
> +	u32 syscon_pol_offset = 0;
> +	struct vip_port *port;
> +	struct vip_dev *dev;
> +	struct device_node *parent = pdev->dev.of_node;
> +	struct fwnode_handle *ep = NULL;
> +	int ret, slice_id, port_id, p;
> +
> +	if (parent && of_property_read_bool(parent, "ti,vip-clk-polarity")) {
> +		syscon_pol = syscon_regmap_lookup_by_phandle(parent,
> +							     "ti,vip-clk-polarity");
> +		if (IS_ERR(syscon_pol)) {
> +			dev_err(&pdev->dev, "failed to get ti,vip-clk-polarity regmap\n");
> +			return PTR_ERR(syscon_pol);

Syntax is return dev_err_probe. If this is not probe path, then this has
to be fixed.

> +		}
> +
> +		if (of_property_read_u32_index(parent, "ti,vip-clk-polarity",
> +					       1, &syscon_pol_offset)) {
> +			dev_err(&pdev->dev, "failed to get ti,vip-clk-polarity offset\n");
> +			return -EINVAL;
> +		}
> +	}
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
> +		dev->syscon_pol = syscon_pol;
> +		dev->syscon_pol_offset = syscon_pol_offset;
> +		port = dev->ports[port_id];
> +
> +		vip_register_subdev_notif(port, ep);
> +		fwnode_handle_put(ep);
> +	}
> +	return 0;
> +}
> +
> +static int vip_probe_slice(struct platform_device *pdev, int slice, int instance_id)
> +{
> +	struct vip_shared *shared = platform_get_drvdata(pdev);
> +	struct vip_dev *dev;
> +	struct vip_parser_data *parser;
> +	u32 vin_id;
> +	int ret;
> +
> +	dev = devm_kzalloc(&pdev->dev, sizeof(*dev), GFP_KERNEL);
> +	if (!dev)
> +		return -ENOMEM;
> +
> +	dev->instance_id = instance_id;
> +	vin_id = 1 + ((dev->instance_id - 1) * 2) + slice;
> +	snprintf(dev->name, sizeof(dev->name), "vin%d", vin_id);
> +
> +	dev->irq = platform_get_irq(pdev, slice);
> +	if (dev->irq < 0)
> +		return dev->irq;
> +
> +	ret = devm_request_irq(&pdev->dev, dev->irq, vip_irq,
> +			       0, dev->name, dev);
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
> +	dev->v4l2_dev = &shared->v4l2_dev;
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
> +	parser->res = platform_get_resource_byname(pdev,
> +						   IORESOURCE_MEM,
> +						   (slice == 0) ?
> +						   "parser0" :
> +						   "parser1");
> +	parser->base = devm_ioremap_resource(&pdev->dev, parser->res);
> +	if (IS_ERR(parser->base))
> +		return PTR_ERR(parser->base);
> +
> +	parser->pdev = pdev;
> +	dev->parser = parser;
> +
> +	dev->sc_assigned = VIP_NOT_ASSIGNED;
> +	dev->sc = sc_create(pdev, (slice == 0) ? "sc0" : "sc1");
> +	if (IS_ERR(dev->sc))
> +		return PTR_ERR(dev->sc);
> +
> +	dev->csc_assigned = VIP_NOT_ASSIGNED;
> +	dev->csc = csc_create(pdev, (slice == 0) ? "csc0" : "csc1");
> +	if (IS_ERR(dev->sc))
> +		return PTR_ERR(dev->sc);
> +
> +	return 0;
> +}
> +
> +static int vip_probe(struct platform_device *pdev)
> +{
> +	struct vip_shared *shared;
> +	struct pinctrl *pinctrl;
> +	int ret, slice = VIP_SLICE1;
> +	int instance_id;
> +	u32 tmp, pid;
> +	const char *label;
> +
> +	if (!of_property_read_string(pdev->dev.of_node, "label", &label)) {
> +		if (strcmp(label, "vip1") == 0)
> +			instance_id = 1;
> +		else if (strcmp(label, "vip2") == 0)
> +			instance_id = 2;
> +		else if (strcmp(label, "vip3") == 0)


Heh, nice try. You cannot encode instance ID as different property (and
instance ID is not allowed, see writing bindings in next).

And how does it work with label called "krzk"? Your binding said that
"krzk" is a perfectly correct label.

You need to think about such cases.


> +			instance_id = 3;

And past here you use uninitialized instance_id, because you did not
consider "krzk".



Best regards,
Krzysztof

