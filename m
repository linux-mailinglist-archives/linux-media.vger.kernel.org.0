Return-Path: <linux-media+bounces-33376-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C9BA9AC3F2B
	for <lists+linux-media@lfdr.de>; Mon, 26 May 2025 14:15:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8D10F3A3E3C
	for <lists+linux-media@lfdr.de>; Mon, 26 May 2025 12:15:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6E62E1FE443;
	Mon, 26 May 2025 12:15:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="nYDBm3eV"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F8CB4AEE2;
	Mon, 26 May 2025 12:15:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748261729; cv=none; b=mGwuh2qLwk/py6v2ClwAOTPfh2unNEDOyxe/TZaKG7IIlKQBtIonCtgtka37K1NcyzCbU8s/p/RxH4baPn/Fc48ssAdvGEeMvjho1pcrqhnjNy58J3ZHe0ldASIPRI3j3ZoKZusI2/ielR2h5jLh13FAU/YlEV1JRMUlw4UrUts=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748261729; c=relaxed/simple;
	bh=wKZ84rSUiqJ4oBYeWn0Yfd7vwqITA/nJdIUUtQp7npQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JOuTBunYZ8Y2TsSm6Rj1WF/kD8EV+1rMJP5v3TCS7aXUACu1QwIHSK54jBiU9ZrDmetPVI7vspwQp8E/QIxx1Go0hV8+AgnO64sSBKiXTRcamXrLX4KDhcTuiC2hgE/RuZThRjwixgKBJkykWMaPnGctcfUBWJ5/wd1Xg90Btpw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=nYDBm3eV; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (237.69-130-109.adsl-dyn.isp.belgacom.be [109.130.69.237])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id B9D32D77;
	Mon, 26 May 2025 14:15:01 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1748261701;
	bh=wKZ84rSUiqJ4oBYeWn0Yfd7vwqITA/nJdIUUtQp7npQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=nYDBm3eVdA3ASPVrxXfcbrOSDXsLPCZhjUEw6Gw4VyOkTfmbGz+KW8WmZn/9+5Ju5
	 iPFyxRMr85AXd7I91OQEzVeLz6EqEMDPrUEQRZIBXoXQxd9xIe8gn+urIbEhPZnCt3
	 cwqmAvveFpzJPV414VYNIJ+Fb3vVdGE6P/CPdi+s=
Date: Mon, 26 May 2025 14:15:20 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Mathis Foerst <mathis.foerst@mt.com>
Cc: linux-kernel@vger.kernel.org,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Steve Longerbeam <slongerbeam@gmail.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, linux-media@vger.kernel.org,
	devicetree@vger.kernel.org, linux-staging@lists.linux.dev,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	manuel.traut@mt.com, mathis.foerst@zuehlke.com
Subject: Re: [PATCH v6 0/7] MT9M114 driver bugfix and improvements
Message-ID: <20250526121520.GH17743@pendragon.ideasonboard.com>
References: <20250522143512.112043-1-mathis.foerst@mt.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250522143512.112043-1-mathis.foerst@mt.com>

Hi Mathis, Sakari,

On Thu, May 22, 2025 at 04:35:04PM +0200, Mathis Foerst wrote:
> Hi,
> 
> this patch series contains the following bugfix and improvements
> for the MT9M114 camera driver:

Review comments need to be addressed for patches 4/7 and 5/7, but the
rest of the series seems ready. Sakari, could you merge the other
patches, to reduce the size of the next version ?

> Changelog:
> 
> v5 -> v6:
> - Add 'Reviewed-By:' tags. Sorry for forgetting this in the previous versions
> 
> v4 -> v5:
> - Apply reformatings and small refactorings as suggested in review comments
> - Split PATCH 4 into two parts: One for applying HFLIP / VFLIP while 
>   streaming, one for applying set_selection while streaming.
> - Add condition to apply set_selection immediately only if the size of the
>   cropping rectangle does not change in PATCH 5
> - Use device_property_read_u32 instead of of_property_read_u32 in PATCH 7
> 
> v3 -> v4:
> - Rename DT binding from "onnn,slew-rate" to "slew-rate" in PATCH 1 and 6 as
>   requested in the review comment.
> 
> v2 -> v3:
> - Dropped PATCH 2 ("media: mt9m114: Add get_mbus_config").
>   Based on the comments, this issure won't be fixed in the MT9M114
>   driver but in "imx-media-csi.c" in a separate patch.
> - Renumbered patches accordingly.
> - Fix the incomplete renaming of the DT property from 'pad-slew-rate'
>   to 'onnn,slew-rate' in PATCH 1 and 6.
> - Fix checkpatch formatting suggestions in PATCH 2 and 6.
> 
> v1 -> v2:
> - Fix the subjects of the patches
> - Dropped PATCH 1 ("Add bypass-pll DT-binding") as it can be automatically
>   detected if the PLL should be bypassed.
> - Renumbered patches accordingly
> - Switch to uint32, add default value and clarify documentation in PATCH 1
> - Add 'Fixes' and 'Cc' tags as suggested in PATCH 6
> 
> Link to v1 discussion:
> https://lore.kernel.org/linux-media/20250226153929.274562-1-mathis.foerst@mt.com/
> Link to v2 discussion:
> https://lore.kernel.org/linux-media/20250304103647.34235-1-mathis.foerst@mt.com/
> Link to v3 discussion:
> https://lore.kernel.org/linux-media/20250305101453.708270-1-mathis.foerst@mt.com/
> Link to v4 discussion:
> https://lore.kernel.org/linux-media/20250307093140.370061-1-mathis.foerst@mt.com/
> 
> 
> Bugfixes:
> - Fix a deadlock when using the V4L2 pad-ops get/set_frame_interval
> 
> New Features:
> - Bypass the internal PLL if EXTCLK matches the configured link_frequency
> - Make the slew-rate of the output pads configurable via DT
> - Allow to change the cropping configuration and the horizontal/vertical
>   flipping while the sensor is in streaming state
> 
> Thanks,
> Mathis
> 
> Mathis Foerst (7):
>   media: dt-bindings: mt9m114: Add slew-rate DT-binding
>   media: mt9m114: Bypass PLL if required
>   media: mt9m114: Factor out mt9m114_configure_pa
>   media: mt9m114: Apply horizontal / vertical flip while streaming
>   media: mt9m114: Allow set_selection while streaming
>   media: mt9m114: Fix deadlock in get_frame_interval/set_frame_interval
>   media: mt9m114: Set pad-slew-rate
> 
>  .../bindings/media/i2c/onnn,mt9m114.yaml      |   9 +
>  drivers/media/i2c/mt9m114.c                   | 264 ++++++++++++------
>  2 files changed, 185 insertions(+), 88 deletions(-)
> 
> base-commit: d608703fcdd9e9538f6c7a0fcf98bf79b1375b60

-- 
Regards,

Laurent Pinchart

