Return-Path: <linux-media+bounces-36360-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 45108AEEA45
	for <lists+linux-media@lfdr.de>; Tue,  1 Jul 2025 00:30:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5C8394224E0
	for <lists+linux-media@lfdr.de>; Mon, 30 Jun 2025 22:29:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0051E2E9EAE;
	Mon, 30 Jun 2025 22:28:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="SBQqaSIv"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADBA62EA730
	for <linux-media@vger.kernel.org>; Mon, 30 Jun 2025 22:28:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751322530; cv=none; b=j2bQxDApKTyNMtm+tNFnIxq1vevUwyQ1c8IHS31pvqBBlcJnQNNnCHm12I74Pjh4oGwZoMIf7GQkzE1rZBHtu2KzH8XdrbgKGOGBwZOFFXa8tp3fr7nuwBqF4WVwGyOkIN492SWdaCPioNOdH2o+NGeEaQu/jRXtq3bdcqWuKtU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751322530; c=relaxed/simple;
	bh=mk/3qtL8p3DsmUYi2ExS3tUM1ZdtEtVqA/25kdtvJnc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kbShvN7cgZ4Wy8qAYx4xffHIls7XBfEoW2cqda+Yg9gmST6RB1UkHNuX6SV8RJ2RQJskvUlgP77gFm59Mb9ty9qa2D0xeJ3fjblk6uAyqY2fNHAfLMdePFN9z9hJ3hj+7H/Ysm82rnWkRQLsZta2JRvhD96MvFCtcSuCtAzPU44=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=SBQqaSIv; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 018C76A6;
	Tue,  1 Jul 2025 00:28:24 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1751322505;
	bh=mk/3qtL8p3DsmUYi2ExS3tUM1ZdtEtVqA/25kdtvJnc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=SBQqaSIvj+UqYSNLcPgGSDJGwZE84vHrSVO3Q7InPWPiUGrDEuiiDtqcygtWASSnu
	 szwfAAwJHTLaWcD3yJ1ql93a0yyjB9T7iVnhJ/TstweJlp4fl+cSjaKbN6pgX0F1zf
	 GC4yyUtIu/7e/3iY2xgQNSTers8qYBV2T5y+PACA=
Date: Tue, 1 Jul 2025 01:28:21 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Hans de Goede <hansg@kernel.org>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mathis Foerst <mathis.foerst@mt.com>, linux-media@vger.kernel.org
Subject: Re: [PATCH v3 00/15] media: mt9m114: Changes to make it work with
 atomisp devices
Message-ID: <20250630222821.GD15184@pendragon.ideasonboard.com>
References: <20250629205626.68341-1-hansg@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250629205626.68341-1-hansg@kernel.org>

Hi Hans,

On Sun, Jun 29, 2025 at 10:56:10PM +0200, Hans de Goede wrote:
> Hi All,
> 
> Here is v3 of my series to make the "mainline" mt9m114 driver work
> on devices with an atomisp CSI2 receiver / ISP. This has been tested on
> an Asus T100TA.
> 
> Changes in v3:
> - Document that using 768Mhz for out_clock_max does not work
> - Improve "media: mt9m114: Put sensor in reset on power down" commit message
> - Drop setting of the MT9M114_CAM_OUTPUT_FORMAT_BT656_CROP_SCALE_DISABLE bit
> - Split "media: mt9m114: Fix scaler bypass mode" into multiple patches,
>   addressing various review comments as part of this
> 
> Changes in v2:
> - Rebase on top of sailus/media_tree.git/fixes which now has 4 of
>   the patches from Mathis': "MT9M114 driver bugfix and improvements"
>   series, this avoids most of the conlicts between the 2 series
> - Add Laurent's Reviewed-by to some of the patches
> - Add select VIDEO_APTINA_PLL to Kconfig
> - Use correct aptina_pll_limits
> - After setting reset high wait 20 clk cycles before disabling
>   the clk and regulators
> - When bypassing the scalar make ifp_get_selection() / ifp_set_selection()
>   fill sel->r with a rectangle of (0,0)/wxh and return 0 instead of
>   returning -EINVAL

It appears that some of my review comments on v2 crossed your v3. That's
the case for 03/12 and 10/12. For 03/12 in particular, I think the
comments will result in changes for v4. How would you like to proceed,
should I review the rest first ?

> Hans de Goede (15):
>   media: aptina-pll: Debug log p1 min and max values
>   media: mt9m114: Add support for clock-frequency property
>   media: mt9m114: Use aptina-PLL helper to get PLL values
>   media: mt9m114: Lower minimum vblank value
>   media: mt9m114: Fix default hblank and vblank values
>   media: mt9m114: Tweak default hblank and vblank for more accurate fps
>   media: mt9m114: Avoid a reset low spike during probe()
>   media: mt9m114: Put sensor in reset on power down
>   media: mt9m114: Add and use mt9m114_ifp_get_border() helper function
>   media: mt9m114: Adjust IFP selections and src format when src pixelfmt
>     changes to/from RAW10
>   media: mt9m114: Update src pad sel and format when sink pad format
>     changes
>   media: mt9m114: Don't allow changing the IFP crop/compose selections
>     when bypassing the scaler
>   media: mt9m114: Drop start-, stop-streaming sequence from initialize
>   media: mt9m114: Return -EPROBE_DEFER if no endpoint is found
>   media: mt9m114: Add ACPI enumeration support
> 
>  drivers/media/i2c/Kconfig      |   1 +
>  drivers/media/i2c/aptina-pll.c |   2 +
>  drivers/media/i2c/mt9m114.c    | 255 +++++++++++++++++++++++++--------
>  3 files changed, 196 insertions(+), 62 deletions(-)

-- 
Regards,

Laurent Pinchart

