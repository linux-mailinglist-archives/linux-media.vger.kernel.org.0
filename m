Return-Path: <linux-media+bounces-50873-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id CD091D30B9D
	for <lists+linux-media@lfdr.de>; Fri, 16 Jan 2026 12:55:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 37CC03063263
	for <lists+linux-media@lfdr.de>; Fri, 16 Jan 2026 11:53:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 96F5937E2F2;
	Fri, 16 Jan 2026 11:53:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="dACYW8d7"
X-Original-To: linux-media@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CFC137A4A1;
	Fri, 16 Jan 2026 11:52:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768564382; cv=none; b=MCWVZNsjxm3LWByYkDR/qcg/dJ9oTC4GBzfA9UzzhnSkGK9MXaDb2Anc8xwMSXVQhCSP4/UKSpbO2MAITPSTtgc1Y7vWAFJRdHs4nr2lGJrOfBfK2BtF9PvJhLiBkJHS9b0e9YKoQm7LVhEbCaD7O79cYMRTSYlAvS//Z/t4ooU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768564382; c=relaxed/simple;
	bh=nknwdjwlTfZ9RlS5zqZbBOK2l5l0+b+5NYdaA3MTaNM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CCSGcqo2I2Khy7MzK2cd1/jaORJg6pJWNmyrUbHPLfhatqc3oeBuCD2M9APLp79xMN1aoY1cSq9OWbRRzFlP9LpcbCcEUrAdEQAqAxfwigLH1URagI/C8uic5lAdae267kimZ8QCwvDD+35LO2rQwdElzbMsQpTGyUBnb5EaBnY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=dACYW8d7; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1768564376;
	bh=nknwdjwlTfZ9RlS5zqZbBOK2l5l0+b+5NYdaA3MTaNM=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=dACYW8d7AN3fQWTePdA4eEQBJQXLG2fJ/HAc/QkTzGo2/XN6vbf6Wbq6KGqwKOdMY
	 jcX+dVMgcqhVrzvYzyA9dgYgfrs1NrGhxkRmHTvMCw8Pgh9dp27XMd4Mnhj+kRIkCM
	 SE+rCM+Snyn7GOWfAilrggBo7dmX/8emiA0AESpkZ+orwNJSOXrmHmGyyfR6+3lwtO
	 Bv1KFQ+ykohO3Qp1ORsyxAHFDDCdBRKR1oWTj2UJ6ljHZKn0R7CNHmNEo7tdN4U0EP
	 z6X6d/ffCqqYbFX2G+0BRdmKa53YnsBql1O5+8RUECR6jtyMbSryfMJmIFDT6W/Zpk
	 U5kRswXfAb5DQ==
Received: from [10.40.0.100] (185-67-175-126.lampert.tv [185.67.175.126])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: mriesch)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 5037017E1380;
	Fri, 16 Jan 2026 12:52:55 +0100 (CET)
Message-ID: <03547127-6903-4925-bb49-c77a377bf177@collabora.com>
Date: Fri, 16 Jan 2026 12:52:54 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/3] media: synopsys: add driver for the designware
 mipi csi-2 receiver
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Chaoyi Chen <chaoyi.chen@rock-chips.com>,
 Kever Yang <kever.yang@rock-chips.com>, Frank Li <Frank.li@nxp.com>,
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
 Collabora Kernel Team <kernel@collabora.com>, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20251114-rockchip-mipi-receiver-v4-0-a9c86fecd052@collabora.com>
 <20251114-rockchip-mipi-receiver-v4-2-a9c86fecd052@collabora.com>
 <aWoOoBS_hWRQP7ac@kekkonen.localdomain>
Content-Language: en-US
From: Michael Riesch <michael.riesch@collabora.com>
In-Reply-To: <aWoOoBS_hWRQP7ac@kekkonen.localdomain>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Sakari,

Thanks for your review!

On 1/16/26 11:10, Sakari Ailus wrote:
> Hi Michael,
> 
> Thanks for the update. A few minor comments below...
> 
> On Thu, Jan 15, 2026 at 07:26:08PM +0100, Michael Riesch via B4 Relay wrote:
>> From: Michael Riesch <michael.riesch@collabora.com>
>>
>> The Synopsys DesignWare MIPI CSI-2 Receiver is a CSI-2 bridge with
>> one input port and one output port. It receives the data with the
>> help of an external MIPI PHY (C-PHY or D-PHY) and passes it to e.g.,
>> the Rockchip Video Capture (VICAP) block on recent Rockchip SoCs.
>>
>> Add a V4L2 subdevice driver for this unit.
>>
>> Signed-off-by: Michael Riesch <michael.riesch@wolfvision.net>
>> Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
>> Reviewed-by: Mehdi Djait <mehdi.djait@linux.intel.com>
>> Signed-off-by: Michael Riesch <michael.riesch@collabora.com>
>> ---
>>  MAINTAINERS                                        |   1 +
>>  drivers/media/platform/synopsys/Kconfig            |   1 +
>>  drivers/media/platform/synopsys/Makefile           |   1 +
>>  .../media/platform/synopsys/dw-mipi-csi2/Kconfig   |  17 +
>>  .../media/platform/synopsys/dw-mipi-csi2/Makefile  |   2 +
>>  .../platform/synopsys/dw-mipi-csi2/dw-mipi-csi2.c  | 735 +++++++++++++++++++++
> 
> How about dw-mipi-csi2rx (or dw-csi2rx)? There might be a tx chip, too...

Heiko and I had an offlist name bikeshedding discussion, and he already
responded to that concern. Please find the rationale for this there.

> 
>>  [...]
>> +static int dw_mipi_csi2_disable_streams(struct v4l2_subdev *sd,
>> +					struct v4l2_subdev_state *state,
>> +					u32 pad, u64 streams_mask)
>> +{
>> +	struct dw_mipi_csi2_device *csi2 = to_csi2(sd);
>> +	struct v4l2_subdev *remote_sd;
>> +	struct media_pad *sink_pad, *remote_pad;
>> +	struct device *dev = csi2->dev;
>> +	u64 mask;
>> +	int ret;
>> +
>> +	sink_pad = &sd->entity.pads[DW_MIPI_CSI2_PAD_SINK];
>> +	remote_pad = media_pad_remote_pad_first(sink_pad);
>> +	remote_sd = media_entity_to_v4l2_subdev(remote_pad->entity);
>> +
>> +	mask = v4l2_subdev_state_xlate_streams(state, DW_MIPI_CSI2_PAD_SINK,
>> +					       DW_MIPI_CSI2_PAD_SRC,
>> +					       &streams_mask);
>> +
>> +	ret = v4l2_subdev_disable_streams(remote_sd, remote_pad->index, mask);
>> +
>> +	dw_mipi_csi2_stop(csi2);
>> +
>> +	pm_runtime_put_sync(dev);
> 
> How about just pm_runtime_put()?

Ah right, for some reason I used the _sync variant in the error path of
_enable_streams and used it here, too.

But I can change both instances to plain _put.


> [...]
>> +static struct platform_driver dw_mipi_csi2_drv = {
>> +	.driver = {
>> +		   .name = "dw-mipi-csi2",
>> +		   .of_match_table = dw_mipi_csi2_of_match,
>> +		   .pm = &dw_mipi_csi2_pm_ops,
> 
> Just tabs, please.

Oops! Not sure how this could happen. Sorry for that, will fix!

I'll send out v5 soon.

Best regards,
Michael

> 
>> +	},
>> +	.probe = dw_mipi_csi2_probe,
>> +	.remove = dw_mipi_csi2_remove,
>> +};
>> +module_platform_driver(dw_mipi_csi2_drv);
>> +
>> +MODULE_DESCRIPTION("Synopsys DesignWare MIPI CSI-2 Receiver platform driver");
>> +MODULE_LICENSE("GPL");
>>
> 


