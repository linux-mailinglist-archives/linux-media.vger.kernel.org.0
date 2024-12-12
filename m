Return-Path: <linux-media+bounces-23255-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 11DAD9EE17E
	for <lists+linux-media@lfdr.de>; Thu, 12 Dec 2024 09:41:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3419218873C6
	for <lists+linux-media@lfdr.de>; Thu, 12 Dec 2024 08:41:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D31D120CCEE;
	Thu, 12 Dec 2024 08:41:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="wdV6OOZQ"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B166259496;
	Thu, 12 Dec 2024 08:41:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733992884; cv=none; b=H0iyrwi1Kw8otuWPrnzfm96imiASw6OPO93BdrYDP/W56YYIesSeHQCXDNj+wonjSP0pwauClAvPRzKc+p8aJPYseuNdcPSMNLyqukH3OetfYvGdIRB3TU02dLvOskzcdK3rddCuJSYPh94kfO9WLFk2x4t/bo282rsugJ1v9RE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733992884; c=relaxed/simple;
	bh=1IvYEZ0rjs9KMpfuLglLhjeENQ/twygsYDNbWfg7+bU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=B6oi4GoVA+gyr7M5VL1imIIVueK9gqVlSg48pG1ppAZyknKXZBJVe0tCqdCHtkLRn9VMjtA0I2LLekFURpJGuO0KtPJYWX5sreAmfNdQwr3m7nKgoX7UwI5pojycoM97H6pQyyMPlDq2IFHHsZtPQ8Pqglv/mi4zjgXvTkktJz8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=wdV6OOZQ; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from ideasonboard.com (unknown [IPv6:2001:b07:6462:5de2:459e:1ee6:26ea:2d31])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id A35FB316;
	Thu, 12 Dec 2024 09:40:46 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1733992846;
	bh=1IvYEZ0rjs9KMpfuLglLhjeENQ/twygsYDNbWfg7+bU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=wdV6OOZQGor1fhNe6Twa/rvQ/Ka2Kvatl33g5DIKFds2+vkrY7Wg+pWiVy9t4xyzx
	 AWKeczEhoTU9bxiTBFWi+9x1iU+n9101WuMXAmpFAy68UFCNNmlXK4VYwxUkQcKTDy
	 k2AP/E35aURQTpNQfElqc38Aw2zSCjV+8lDR8zPo=
Date: Thu, 12 Dec 2024 09:41:16 +0100
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: keke.li@amlogic.com, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, kieran.bingham@ideasonboard.com, 
	laurent.pinchart@ideasonboard.com, dan.scally@ideasonboard.com
Subject: Re: [PATCH v4 02/10] media: platform: Add c3 mipi csi2 driver
Message-ID: <5sen6lv5xg4hjdc4j2l6k5iywqpllbutoaebyln74aeuplawtu@nmpmzgwkkgih>
References: <20241205-c3isp-v4-0-cb1868be0105@amlogic.com>
 <20241205-c3isp-v4-2-cb1868be0105@amlogic.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241205-c3isp-v4-2-cb1868be0105@amlogic.com>

Hi Keke,
  a question for Laurent and Sakari

On Thu, Dec 05, 2024 at 05:04:28PM +0800, Keke Li via B4 Relay wrote:
> From: Keke Li <keke.li@amlogic.com>
>
> This driver is used to receive mipi data from image sensor.
>
> Reviewed-by: Daniel Scally <dan.scally@ideasonboard.com>
> Signed-off-by: Keke Li <keke.li@amlogic.com>

[snip]

> +
> +static int c3_mipi_csi_configure_clocks(struct csi_device *csi)
> +{
> +	const struct csi_info *info = csi->info;
> +	int ret;
> +	u32 i;
> +
> +	for (i = 0; i < info->clock_num; i++)
> +		csi->clks[i].id = info->clocks[i];
> +
> +	ret = devm_clk_bulk_get(csi->dev, info->clock_num, csi->clks);
> +	if (ret)
> +		return ret;
> +
> +	for (i = 0; i < info->clock_num; i++) {
> +		if (!info->clock_rates[i])
> +			continue;
> +		ret = clk_set_rate(csi->clks[i].clk, info->clock_rates[i]);
> +		if (ret) {
> +			dev_err(csi->dev, "Failed to set %s rate %u\n", info->clocks[i],
> +				info->clock_rates[i]);
> +			return ret;
> +		}
> +	}
> +
> +	return 0;
> +}
> +

[snip]

> +
> +static const struct csi_info c3_mipi_csi_info = {
> +	.clocks = {"vapb", "phy0"},
> +	.clock_rates = {0, 200000000},
> +	.clock_num = 2
> +};
> +
> +static const struct of_device_id c3_mipi_csi_of_match[] = {
> +	{ .compatible = "amlogic,c3-mipi-csi2",
> +	  .data = &c3_mipi_csi_info,
> +	},
> +	{ },
> +};

All the drivers in this patch series implement the same pattern when
it comes to handling clock. There's a list of clock providers in the
driver associated with a clock frequency. The driver bulk_get the
clocks and set_rate() using the per-compatible info table.

Do you think this should rather come from dts using the
assigned-clocks and assigned-clock-rates properties ?

