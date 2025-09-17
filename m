Return-Path: <linux-media+bounces-42676-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E2939B80029
	for <lists+linux-media@lfdr.de>; Wed, 17 Sep 2025 16:32:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3F5D51888DA1
	for <lists+linux-media@lfdr.de>; Wed, 17 Sep 2025 14:26:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 59D532BE7B2;
	Wed, 17 Sep 2025 14:25:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="Um3WIhCl"
X-Original-To: linux-media@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F77D28B51E;
	Wed, 17 Sep 2025 14:25:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758119138; cv=none; b=Mo3t1gu0FHZxXks7X3n1nhGf+jtA7rpzSl8VCOkT4x805epAkPcLAkBobJq9kY7mhaLh/RGtdYt6GDYVvXYoO1rkaYb5/cdD2uF+j2ULp6dcoQ43pgLoJHQf2Q/wSRRjuwZP85P3L3yPlUG/H+i0tW05An2qh3qH59ZPl6X1+5Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758119138; c=relaxed/simple;
	bh=gdQ4bVQx9UsfgOGWthahXwQYrBNrMjs0pw9DZQGxUVU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DnnpFdu7O1cv4J+NFJEC4qJ3es2aGzy56MpJdKJhcgN33wmC3XAkCcu5C7CH/vnG+i4f1Ub1aSQ39uW3PpgwczbmVgTCGSE6gFX67zCRE4PlSskls6Pg9vQIsVw6A+ZbR41hzbrct/vqxOw1AzApfOIBypYTROuFAun33Brayvs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=Um3WIhCl; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1758119134;
	bh=gdQ4bVQx9UsfgOGWthahXwQYrBNrMjs0pw9DZQGxUVU=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Um3WIhClnacJr72kepL51Jb68Z6nP193VKArJdLLLDO+57zbEiMA24rF69RpT4rG1
	 /4/nyURj22/z2h8xSlC08eecHlawBsUoNFMHSJ0w1yU9stIMhvchJxiy+sIUGzX2fI
	 Hby58O3agOef0ZXi3l1MZ1lJ3S5KrUrVCIUyEC5x/ctJFEzID1ZLuytvPtDBX6IYQ/
	 Ib1G78e26a4x3RWEjHV8JFzEqCnvUjbrWC4NOuC93gWUZDMGdg3+0WY7YjAwwjl6Ni
	 KT0GC/L6ePfl8fshgUywT3SE819dhSBguV34jB1VYLFlF5X0ZASXHcmtTkdVWWd96l
	 oyXFp4qv1/bIA==
Received: from [10.40.0.100] (185-251-200-65.lampert.tv [185.251.200.65])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: mriesch)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 7AC0F17E0237;
	Wed, 17 Sep 2025 16:25:33 +0200 (CEST)
Message-ID: <f9f8fb39-51d5-415c-b2dd-3fd837252edb@collabora.com>
Date: Wed, 17 Sep 2025 16:25:32 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 07/13] media: rockchip: add driver for mipi csi-2
 receiver
To: Philipp Zabel <p.zabel@pengutronix.de>,
 Mehdi Djait <mehdi.djait@linux.intel.com>,
 Maxime Chevallier <maxime.chevallier@bootlin.com>,
 =?UTF-8?Q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Gerald Loacker <gerald.loacker@wolfvision.net>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Markus Elfring <Markus.Elfring@web.de>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring
 <robh+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
 Kever Yang <kever.yang@rock-chips.com>,
 Nicolas Dufresne <nicolas.dufresne@collabora.com>,
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 Collabora Kernel Team <kernel@collabora.com>,
 Paul Kocialkowski <paulk@sys-base.io>,
 Alexander Shiyan <eagle.alexander923@gmail.com>,
 Val Packett <val@packett.cool>, Rob Herring <robh@kernel.org>,
 Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org
References: <20240220-rk3568-vicap-v10-0-62d8a7b209b4@collabora.com>
 <20240220-rk3568-vicap-v10-7-62d8a7b209b4@collabora.com>
 <c5d8d527ca6194b606b5627e51abbb82ab6dd76c.camel@pengutronix.de>
Content-Language: en-US
From: Michael Riesch <michael.riesch@collabora.com>
In-Reply-To: <c5d8d527ca6194b606b5627e51abbb82ab6dd76c.camel@pengutronix.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Philipp,

On 8/25/25 12:37, Philipp Zabel wrote:
> On Di, 2025-08-19 at 01:25 +0200, Michael Riesch via B4 Relay wrote:
>> From: Michael Riesch <michael.riesch@collabora.com>
>>
>> The Rockchip RK3568 MIPI CSI-2 Receiver is a CSI-2 bridge with one
>> input port and one output port. It receives the data with the help
>> of an external MIPI PHY (C-PHY or D-PHY) and passes it to the
>> Rockchip RK3568 Video Capture (VICAP) block.
>>
>> Add a V4L2 subdevice driver for this unit.
>>
>> Signed-off-by: Michael Riesch <michael.riesch@wolfvision.net>
>> Signed-off-by: Michael Riesch <michael.riesch@collabora.com>
>> ---
>>  MAINTAINERS                                    |   1 +
>>  drivers/media/platform/rockchip/Kconfig        |   1 +
>>  drivers/media/platform/rockchip/Makefile       |   1 +
>>  drivers/media/platform/rockchip/rkcsi/Kconfig  |  16 +
>>  drivers/media/platform/rockchip/rkcsi/Makefile |   3 +
>>  drivers/media/platform/rockchip/rkcsi/rkcsi.c  | 741 +++++++++++++++++++++++++
>>  6 files changed, 763 insertions(+)
>>
> [...]
>> diff --git a/drivers/media/platform/rockchip/rkcsi/rkcsi.c b/drivers/media/platform/rockchip/rkcsi/rkcsi.c
>> new file mode 100644
>> index 000000000000..5658ffb60769
>> --- /dev/null
>> +++ b/drivers/media/platform/rockchip/rkcsi/rkcsi.c
>> @@ -0,0 +1,741 @@
> [...]
>> +static int rkcsi_probe(struct platform_device *pdev)
>> +{
>> +	struct device *dev = &pdev->dev;
>> +	struct rkcsi_device *csi_dev;
>> +	int ret;
>> +
>> +	csi_dev = devm_kzalloc(dev, sizeof(*csi_dev), GFP_KERNEL);
>> +	if (!csi_dev)
>> +		return -ENOMEM;
>> +	csi_dev->dev = dev;
>> +	dev_set_drvdata(dev, csi_dev);
>> +
>> +	csi_dev->base_addr = devm_platform_ioremap_resource(pdev, 0);
>> +	if (IS_ERR(csi_dev->base_addr))
>> +		return PTR_ERR(csi_dev->base_addr);
>> +
>> +	ret = devm_clk_bulk_get_all(dev, &csi_dev->clks);
>> +	if (ret != RKCSI_CLKS_MAX)
>> +		return dev_err_probe(dev, -ENODEV, "failed to get clocks\n");
>> +	csi_dev->clks_num = ret;
>> +
>> +	csi_dev->phy = devm_phy_get(dev, NULL);
>> +	if (IS_ERR(csi_dev->phy))
>> +		return dev_err_probe(dev, PTR_ERR(csi_dev->phy),
>> +				     "failed to get MIPI CSI PHY\n");
>> +
>> +	csi_dev->reset = devm_reset_control_array_get_exclusive(dev);
> 
> Why array? rockchip,rk3568-mipi-csi bindings specify a single reset.

Hm. Copy-paste issue, I guess. Good catch, thanks for pointing it out.

Best regards,
Michael

> 
> regards
> Philipp


