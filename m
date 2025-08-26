Return-Path: <linux-media+bounces-41065-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E93FB356E7
	for <lists+linux-media@lfdr.de>; Tue, 26 Aug 2025 10:30:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5CD695E4348
	for <lists+linux-media@lfdr.de>; Tue, 26 Aug 2025 08:30:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 384012F83D3;
	Tue, 26 Aug 2025 08:30:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="RNXZ4RDQ"
X-Original-To: linux-media@vger.kernel.org
Received: from fllvem-ot04.ext.ti.com (fllvem-ot04.ext.ti.com [198.47.19.246])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1C5822E004;
	Tue, 26 Aug 2025 08:30:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.19.246
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756197033; cv=none; b=smva25Y0ejggVjiR7VZPgOPqKJGdccPkIustq85Ii2Ej3ch0/VVWT5YaN041CBWyyooLXAOkIwU+RGnfXzN4EGiBm0z6901kumS9fl/NLWzwa53ho26UVXV26DNZF0Kze800rxv7s9nUBBI1HCcDhbjN5AXfurK85Skxr6WpOe4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756197033; c=relaxed/simple;
	bh=VNgkWQvunszqiwa2iCQGKFHn2EIFZXNxa26eYSuIAmM=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=JOkoayCHv11YH3Fuv9qrA9k8brqI0wl3C2Ev0nLRjBuY6ZBTjebTurN19u4Rb54/LVfSxgj2Uws60gW4GIwshUFTVh+CEtShFN1tIbbI+tKokBTftce80V0REV5VSRlbr1tVey1StxmVD94EmXWvvtdmE8zd0r0x2NDjxfEFbHU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=RNXZ4RDQ; arc=none smtp.client-ip=198.47.19.246
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Received: from fllvem-sh04.itg.ti.com ([10.64.41.54])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTP id 57Q8TpuD1474791;
	Tue, 26 Aug 2025 03:29:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1756196991;
	bh=qA4QtszB3lhYVxil4FY85NorKM9gDEhmhJP9fmqDZM0=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=RNXZ4RDQOHKqg91jIce38BPyes6xfCyL41zxjE5Fxuronah7zNCrbTzB9WI8J4FBq
	 6qEH2XOFxkaoa1kIlykoBp/G4OpGIjfZYRjsa0Fo59pkc2Z2fwOIV793HHwW2DJsZl
	 qH/s0rpWYp1eSTxm6oSnOj7zn+JLxeDZo9WQDTLA=
Received: from DFLE109.ent.ti.com (dfle109.ent.ti.com [10.64.6.30])
	by fllvem-sh04.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 57Q8ToHr2261537
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Tue, 26 Aug 2025 03:29:50 -0500
Received: from DFLE115.ent.ti.com (10.64.6.36) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Tue, 26
 Aug 2025 03:29:50 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Tue, 26 Aug 2025 03:29:49 -0500
Received: from [10.24.68.198] (abhilash-hp.dhcp.ti.com [10.24.68.198])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 57Q8Thoe1135709;
	Tue, 26 Aug 2025 03:29:43 -0500
Message-ID: <dcaaf0ee-2cfc-419e-8c4a-8834372f1948@ti.com>
Date: Tue, 26 Aug 2025 13:59:42 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V2 4/4] media: ti-vpe: Add the VIP driver
To: Krzysztof Kozlowski <krzk@kernel.org>, <mchehab@kernel.org>,
        <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>
CC: <linux@armlinux.org.uk>, <ardb@kernel.org>, <ebiggers@kernel.org>,
        <geert+renesas@glider.be>, <claudiu.beznea@tuxon.dev>,
        <bparrot@ti.com>, <andre.draszik@linaro.org>,
        <kuninori.morimoto.gx@renesas.com>,
        <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        <heikki.krogerus@linux.intel.com>, <kory.maincent@bootlin.com>,
        <florian.fainelli@broadcom.com>, <lumag@kernel.org>,
        <dale@farnsworth.org>, <sbellary@baylibre.com>,
        <linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <dagriego@biglakesoftware.com>, <u-kumar1@ti.com>
References: <20250716111912.235157-1-y-abhilashchandra@ti.com>
 <20250716111912.235157-5-y-abhilashchandra@ti.com>
 <b8149d7d-65ca-47c1-9338-45a0db614e77@kernel.org>
Content-Language: en-US
From: Yemike Abhilash Chandra <y-abhilashchandra@ti.com>
In-Reply-To: <b8149d7d-65ca-47c1-9338-45a0db614e77@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea

Hi Krzysztof,
Thanks for the review.

On 16/07/25 19:39, Krzysztof Kozlowski wrote:
> On 16/07/2025 13:19, Yemike Abhilash Chandra wrote:
> 
>> +static int vip_probe_complete(struct platform_device *pdev)
>> +{
>> +	struct vip_shared *shared = platform_get_drvdata(pdev);
>> +	struct regmap *syscon_pol = NULL;
>> +	u32 syscon_pol_offset = 0;
>> +	struct vip_port *port;
>> +	struct vip_dev *dev;
>> +	struct device_node *parent = pdev->dev.of_node;
>> +	struct fwnode_handle *ep = NULL;
>> +	int ret, slice_id, port_id, p;
>> +
>> +	if (parent && of_property_read_bool(parent, "ti,vip-clk-polarity")) {
>> +		syscon_pol = syscon_regmap_lookup_by_phandle(parent,
>> +							     "ti,vip-clk-polarity");
>> +		if (IS_ERR(syscon_pol)) {
>> +			dev_err(&pdev->dev, "failed to get ti,vip-clk-polarity regmap\n");
>> +			return PTR_ERR(syscon_pol);
> 
> Syntax is return dev_err_probe. If this is not probe path, then this has
> to be fixed.
> 

I will fix this in v3.

>> +		}
>> +
>> +		if (of_property_read_u32_index(parent, "ti,vip-clk-polarity",
>> +					       1, &syscon_pol_offset)) {
>> +			dev_err(&pdev->dev, "failed to get ti,vip-clk-polarity offset\n");
>> +			return -EINVAL;
>> +		}
>> +	}
>> +
>> +	for (p = 0; p < (VIP_NUM_PORTS * VIP_NUM_SLICES); p++) {
>> +		ep = fwnode_graph_get_next_endpoint_by_regs(of_fwnode_handle(parent),
>> +							    p, 0);
>> +		if (!ep)
>> +			continue;
>> +
>> +		switch (p) {
>> +		case 0:
>> +			slice_id = VIP_SLICE1;	port_id = VIP_PORTA;
>> +			break;
>> +		case 1:
>> +			slice_id = VIP_SLICE2;	port_id = VIP_PORTA;
>> +			break;
>> +		case 2:
>> +			slice_id = VIP_SLICE1;	port_id = VIP_PORTB;
>> +			break;
>> +		case 3:
>> +			slice_id = VIP_SLICE2;	port_id = VIP_PORTB;
>> +			break;
>> +		default:
>> +			dev_err(&pdev->dev, "Unknown port reg=<%d>\n", p);
>> +			continue;
>> +		}
>> +
>> +		ret = alloc_port(shared->devs[slice_id], port_id);
>> +		if (ret < 0)
>> +			continue;
>> +
>> +		dev = shared->devs[slice_id];
>> +		dev->syscon_pol = syscon_pol;
>> +		dev->syscon_pol_offset = syscon_pol_offset;
>> +		port = dev->ports[port_id];
>> +
>> +		vip_register_subdev_notif(port, ep);
>> +		fwnode_handle_put(ep);
>> +	}
>> +	return 0;
>> +}
>> +
>> +static int vip_probe_slice(struct platform_device *pdev, int slice, int instance_id)
>> +{
>> +	struct vip_shared *shared = platform_get_drvdata(pdev);
>> +	struct vip_dev *dev;
>> +	struct vip_parser_data *parser;
>> +	u32 vin_id;
>> +	int ret;
>> +
>> +	dev = devm_kzalloc(&pdev->dev, sizeof(*dev), GFP_KERNEL);
>> +	if (!dev)
>> +		return -ENOMEM;
>> +
>> +	dev->instance_id = instance_id;
>> +	vin_id = 1 + ((dev->instance_id - 1) * 2) + slice;
>> +	snprintf(dev->name, sizeof(dev->name), "vin%d", vin_id);
>> +
>> +	dev->irq = platform_get_irq(pdev, slice);
>> +	if (dev->irq < 0)
>> +		return dev->irq;
>> +
>> +	ret = devm_request_irq(&pdev->dev, dev->irq, vip_irq,
>> +			       0, dev->name, dev);
>> +	if (ret < 0)
>> +		return -ENOMEM;
>> +
>> +	spin_lock_init(&dev->slock);
>> +	mutex_init(&dev->mutex);
>> +
>> +	dev->slice_id = slice;
>> +	dev->pdev = pdev;
>> +	dev->res = shared->res;
>> +	dev->base = shared->base;
>> +	dev->v4l2_dev = &shared->v4l2_dev;
>> +
>> +	dev->shared = shared;
>> +	shared->devs[slice] = dev;
>> +
>> +	vip_top_reset(dev);
>> +	vip_set_slice_path(dev, VIP_MULTI_CHANNEL_DATA_SELECT, 1);
>> +
>> +	parser = devm_kzalloc(&pdev->dev, sizeof(*dev->parser), GFP_KERNEL);
>> +	if (!parser)
>> +		return PTR_ERR(parser);
>> +
>> +	parser->res = platform_get_resource_byname(pdev,
>> +						   IORESOURCE_MEM,
>> +						   (slice == 0) ?
>> +						   "parser0" :
>> +						   "parser1");
>> +	parser->base = devm_ioremap_resource(&pdev->dev, parser->res);
>> +	if (IS_ERR(parser->base))
>> +		return PTR_ERR(parser->base);
>> +
>> +	parser->pdev = pdev;
>> +	dev->parser = parser;
>> +
>> +	dev->sc_assigned = VIP_NOT_ASSIGNED;
>> +	dev->sc = sc_create(pdev, (slice == 0) ? "sc0" : "sc1");
>> +	if (IS_ERR(dev->sc))
>> +		return PTR_ERR(dev->sc);
>> +
>> +	dev->csc_assigned = VIP_NOT_ASSIGNED;
>> +	dev->csc = csc_create(pdev, (slice == 0) ? "csc0" : "csc1");
>> +	if (IS_ERR(dev->sc))
>> +		return PTR_ERR(dev->sc);
>> +
>> +	return 0;
>> +}
>> +
>> +static int vip_probe(struct platform_device *pdev)
>> +{
>> +	struct vip_shared *shared;
>> +	struct pinctrl *pinctrl;
>> +	int ret, slice = VIP_SLICE1;
>> +	int instance_id;
>> +	u32 tmp, pid;
>> +	const char *label;
>> +
>> +	if (!of_property_read_string(pdev->dev.of_node, "label", &label)) {
>> +		if (strcmp(label, "vip1") == 0)
>> +			instance_id = 1;
>> +		else if (strcmp(label, "vip2") == 0)
>> +			instance_id = 2;
>> +		else if (strcmp(label, "vip3") == 0)
> 
> 
> Heh, nice try. You cannot encode instance ID as different property (and
> instance ID is not allowed, see writing bindings in next).
> 
> And how does it work with label called "krzk"? Your binding said that
> "krzk" is a perfectly correct label.
> 
> You need to think about such cases.
> 
> 
>> +			instance_id = 3;
> 
> And past here you use uninitialized instance_id, because you did not
> consider "krzk".
> 

Understood. I will avoid this in v3

Thanks and Regards,
Yemike Abhilash Chandra

> 
> 
> Best regards,
> Krzysztof


