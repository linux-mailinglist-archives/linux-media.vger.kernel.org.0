Return-Path: <linux-media+bounces-51067-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EE92D3AF55
	for <lists+linux-media@lfdr.de>; Mon, 19 Jan 2026 16:41:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 7CF5E300BD9F
	for <lists+linux-media@lfdr.de>; Mon, 19 Jan 2026 15:41:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5826738B9B5;
	Mon, 19 Jan 2026 15:41:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="FmCyE4Es"
X-Original-To: linux-media@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB62F35CBDA;
	Mon, 19 Jan 2026 15:41:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768837264; cv=none; b=TcF0UzNAzFrqlHCzK4bWE3UiFnZFl05LGgSzLU3Y5IJcH4TesE+8UnZ84RznBTiL5MQxImsWYP/6H4D0ZS+rlgOpjZ37pdFXf7MneRx7Ogc6B+/s+3OXnbuDvv7BlY6miriPIkycE1dUkNgsZlYew/tXaJubwUgxZR0nMjzA4MU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768837264; c=relaxed/simple;
	bh=WGje4+ey1jXaVxohpYLHfCxVK7LiezHtVRN34MEwaUQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Iwcg0NRSvSklslTPnuzn0RkxEM3vDbHNHBOGAaudtQ/2ErhVPAIpBdsoab6MI+EU4sjU/UXYSkMUneRVPbqTriMeM4iBxiura05XzUQfaEEQT78skWF3oyZPlSX/ZXYFrLwLxPlM3ukv+92R/7Fm7hgLIA6IRbrkuDHOetkLgbU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=FmCyE4Es; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1768837261;
	bh=WGje4+ey1jXaVxohpYLHfCxVK7LiezHtVRN34MEwaUQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=FmCyE4EsGHuEGsVCgS3ZHCNmr1HZ0JgHB/6ULTjwJ4rtZ/iB2vMXCTTsmDK9leCcc
	 xxfkjlbe9cBdTp/mN+roDs4MyBW9Yok/DOrprw+6g8XsvoI/6YaMrxs+2vlMr+uyel
	 tCks0ibnW/FqNOtlPF7KITC+elSm3taLy9cuMJ5vI+zIk2zRUtZy0MmPTB7f1ID48g
	 TZ0u9BEknq+EOVXxIcw6BKjiSrTtfOkCrlhRD9KYG4zkhvivuCug9nTK7U8UqEuLHS
	 UbaM831YPK/V0dK5TWIc+KWwTYN548YcDrs1KMPeQcLcuaL/W1gPVKbI1yNhkrqE/L
	 udOQRo9lCLG4g==
Received: from [10.40.0.100] (185-67-175-126.lampert.tv [185.67.175.126])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: mriesch)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 2340F17E0FFA;
	Mon, 19 Jan 2026 16:41:00 +0100 (CET)
Message-ID: <37c83a9a-088a-4a96-b6f6-343fa6cdddc6@collabora.com>
Date: Mon, 19 Jan 2026 16:40:59 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 2/3] media: synopsys: add driver for the designware
 mipi csi-2 receiver
To: Frank Li <Frank.li@nxp.com>
Cc: Chaoyi Chen <chaoyi.chen@rock-chips.com>,
 Kever Yang <kever.yang@rock-chips.com>,
 Mehdi Djait <mehdi.djait@linux.intel.com>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Hans Verkuil <hverkuil@kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 Nicolas Dufresne <nicolas.dufresne@collabora.com>,
 Collabora Kernel Team <kernel@collabora.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20251114-rockchip-mipi-receiver-v5-0-45aa117f190a@collabora.com>
 <20251114-rockchip-mipi-receiver-v5-2-45aa117f190a@collabora.com>
 <aWpil6jI1Ad0DcEI@lizhi-Precision-Tower-5810>
 <db2f0c20-ca7e-41c9-be08-67fd1f92c2af@collabora.com>
 <aW5PLIv2w+OY7xJD@lizhi-Precision-Tower-5810>
Content-Language: en-US
From: Michael Riesch <michael.riesch@collabora.com>
In-Reply-To: <aW5PLIv2w+OY7xJD@lizhi-Precision-Tower-5810>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Frank,

On 1/19/26 16:35, Frank Li wrote:
> On Mon, Jan 19, 2026 at 10:49:20AM +0100, Michael Riesch wrote:
>> Hi Frank,
>>
>> Thanks for your review.
>>
>> On 1/16/26 17:08, Frank Li wrote:
>>> On Fri, Jan 16, 2026 at 02:02:47PM +0100, Michael Riesch wrote:
>>>> The Synopsys DesignWare MIPI CSI-2 Receiver is a CSI-2 bridge with
>>>> one input port and one output port. It receives the data with the
>>>> help of an external MIPI PHY (C-PHY or D-PHY) and passes it to e.g.,
>>>> the Rockchip Video Capture (VICAP) block on recent Rockchip SoCs.
>>>>
>>>> Add a V4L2 subdevice driver for this unit.
>>>>
>>>> Signed-off-by: Michael Riesch <michael.riesch@wolfvision.net>
>>>> Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
>>>> Reviewed-by: Mehdi Djait <mehdi.djait@linux.intel.com>
>>>> Signed-off-by: Michael Riesch <michael.riesch@collabora.com>
>>>> ---
>>> ...
>>>> +
>>>> +static inline struct dw_mipi_csi2_device *to_csi2(struct v4l2_subdev *sd)
>>>> +{
>>>> +	return container_of(sd, struct dw_mipi_csi2_device, sd);
>>>> +}
>>>> +
>>>> +static inline __maybe_unused void
>>>
>>> why need '__maybe_unused', needn't inline. compiler can auto decide and
>>> report unused function if no 'inline'.
>>
>> The __maybe_unused was helpful during development and is not really
>> required now. It doesn't hurt either, so I left it in. I can remove it
>> if you wish.
>>
>>>
>>>> +
>>>> +	ep = fwnode_graph_get_endpoint_by_id(dev_fwnode(dev), 0, 0, 0);
>>>
>>> use  struct fwnode_handle *ep __free(fwnode_handle) can simplify err
>>> handler.
>>
>> Sorry, I don't see the benefit of that.
>>
> 
> I remember reduce one goto

Since Sakari requested this variant as well, I changed it to as you
suggested in v7.

> 
>>>
>>>> +	if (!ep)
>>>> +		return dev_err_probe(dev, -ENODEV, "failed to get endpoint\n");
>>>> +
>>> ...
>>>> +{
>>>> +	struct media_pad *pads = csi2->pads;
>>>> +	struct v4l2_subdev *sd = &csi2->sd;
>>>> +	int ret;
>>>> +
>>>> +	ret = dw_mipi_csi2_register_notifier(csi2);
>>>> +	if (ret)
>>>> +		goto err;
>>>> +
>>>> +	v4l2_subdev_init(sd, &dw_mipi_csi2_ops);
>>>> +	sd->dev = csi2->dev;
>>>> +	sd->entity.ops = &dw_mipi_csi2_media_ops;
>>>> +	sd->entity.function = MEDIA_ENT_F_VID_IF_BRIDGE;
>>>> +	sd->flags |= V4L2_SUBDEV_FL_HAS_DEVNODE | V4L2_SUBDEV_FL_STREAMS;
>>>> +
>>>> +static int dw_mipi_csi2_runtime_resume(struct device *dev)
>>>> +{
>>>> +	struct dw_mipi_csi2_device *csi2 = dev_get_drvdata(dev);
>>>> +	int ret;
>>>> +
>>>> +	reset_control_assert(csi2->reset);
>>>> +	udelay(5);
>>>
>>> Now prefer use fsleep(), which auto choose difference sleep function
>>> according to delay number.
>>
>> I'll keep that in mind, but here the first thing that fsleep does is to
>> check whether the parameter is <= 10 and (since this is true) call
>> udelay. So here I don't see the point really.
> 
> Thank.
> 
>>
>>>
>>>> +	reset_control_deassert(csi2->reset);
>>>> +
>>>> +	ret = clk_bulk_prepare_enable(csi2->clks_num, csi2->clks);
>>>> +	if (ret) {
>>>> +		dev_err(dev, "failed to enable clocks\n");
>>>> +		return ret;
>>>> +	}
>>>> +
>>>> +	return 0;
>>>> +}
>>>> +
>>>> +static DEFINE_RUNTIME_DEV_PM_OPS(dw_mipi_csi2_pm_ops,
>>>> +				 dw_mipi_csi2_runtime_suspend,
>>>> +				 dw_mipi_csi2_runtime_resume, NULL);
>>>> +
>>>> +static struct platform_driver dw_mipi_csi2_drv = {
>>>> +	.driver = {
>>>> +		.name = "dw-mipi-csi2",
>>>> +		.of_match_table = dw_mipi_csi2_of_match,
>>>> +		.pm = &dw_mipi_csi2_pm_ops,
>>>
>>> pm_ptr( &dw_mipi_csi2_pm_ops)
>>
>> Shouldn't make a difference here since this driver depends on CONFIG_PM.
>>
> 
> Avoid some static scan tools to report the problem, no harmful to add
> pm_ptr().

Interesting. Which tools to you use?

I hope v7 is accepted as sent earlier today, and this should not be a
blocker. We can add pm_ptr() easily in a follow-up patch.

Thanks and regards,
Michael

> 
> Frank
> 
>> Best regards,
>> Michael
>>
>>>
>>> Frank
>>>> +	},
>>>> +	.probe = dw_mipi_csi2_probe,
>>>> +	.remove = dw_mipi_csi2_remove,
>>>> +};
>>>> +module_platform_driver(dw_mipi_csi2_drv);
>>>> +
>>>> +MODULE_DESCRIPTION("Synopsys DesignWare MIPI CSI-2 Receiver platform driver");
>>>> +MODULE_LICENSE("GPL");
>>>>
>>>> --
>>>> 2.39.5
>>>>
>>


