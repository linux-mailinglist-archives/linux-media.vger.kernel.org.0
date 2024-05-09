Return-Path: <linux-media+bounces-11250-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A4D58C17F7
	for <lists+linux-media@lfdr.de>; Thu,  9 May 2024 22:52:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id AB599B24A40
	for <lists+linux-media@lfdr.de>; Thu,  9 May 2024 20:52:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1F17A84D08;
	Thu,  9 May 2024 20:51:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="l7+kZshC"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0013853A7;
	Thu,  9 May 2024 20:51:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715287902; cv=none; b=WU5AgjLnHsfeyQL1s6/ly4778/lkfTJMluTsjyDUVL/Z10s7q8JlV9CO3euG1K4H2ikJ2Ji6JgJ4BeDBUoxlDC4p5pZ8/k9Ai0zxKh8loP4BMDTgtB8LKrg15ZU1pGqyLudJJ7KhKhDqCkvqBluYb8OHJc9ITy8qlyq5XS5irT8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715287902; c=relaxed/simple;
	bh=brmS5eA2lD06qOEDIGoxgpLO/ESC2PwB78prXCz8emE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LdXZAoR1llvx5Nr9rEkRgXqDvstOAliiZkzxjbqiCU8wViSi9UIBpSj9QuJofH3Tivd29gF+Svy2yrwJbLC9e1aTs1NQH2EiVJWZYb2td3Nk8BCzT55DShA2QQbGpKUnE5H3R2UvqJruVSlR8NEDwgrXovhXcAIZjMM48l8rGVM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=l7+kZshC; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 6CF153D5;
	Thu,  9 May 2024 22:51:35 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1715287895;
	bh=brmS5eA2lD06qOEDIGoxgpLO/ESC2PwB78prXCz8emE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=l7+kZshC61eqp4m8+VTRMtk8Su8jwKsAe9ZAB3jawtCVDT6GIK1RkHiyKSd2OYDbi
	 8bIYsNyOUfAWwgocR195jmjSlA2eHfoIeaayeFqhpQkdNJGd8Vvut76O9TnrwvrAKl
	 BHp8Z/Y/Vxo42HVgqptE3wcEVMV2dlZQAT5m/ue4=
Date: Thu, 9 May 2024 23:51:29 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Cc: Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v3 00/11] media: renesas: rcar-csi2: Use the subdev
 active state
Message-ID: <20240509205129.GD6407@pendragon.ideasonboard.com>
References: <20240509161403.111789-1-jacopo.mondi@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240509161403.111789-1-jacopo.mondi@ideasonboard.com>

Hello,

On Thu, May 09, 2024 at 06:13:50PM +0200, Jacopo Mondi wrote:
> v2->v3:
> - rcar-csi2: Collect v2.2 of [4/11]
> - adv748x: enum_mbus_code: reduce the number of formats to the ones supported
>   by the HDMI and Analog front ends;
> - adv748x: enum_mbus_code: enumerate all formats on sink pad; enumerate the
>   active format on the source pad
> - max9286: Apply the format to all pads to enforce all links to have the same
>   format
> - max9286: Remove max9286_set_fsync_period() from setup
> 
> v2->v1:
>   - Remove "media: adv748x-csi2: Initialize subdev format"
>   - Add "media: adv748x-afe: Use 1X16 media bus code"
>   - Tested with CVBS
>   - address comments from Laurent and Niklas
> 
> A branch is available at
> https://git.kernel.org/pub/scm/linux/kernel/git/jmondi/linux.git/
> jmondi/renesas-drivers-2024-04-23-v6.9-rc5/multistream-prep
> 
> As a follow-up to the recently sent
> "media: renesas: rcar-csi2: Support multiple streams" series, this smaller
> version collects some fixes and implement usage of the subdev active state
> to simplify the R-Car CSI-2, ADV748x and MAX9286 drivers implementations.
> 
> Tested with GMSL on Eagle V3M
> Tested with HDMI on Salvator-X
> Tested with CVBS on Salvator-X
> Boot tested on WhiteHawk V4H

Niklas, would you be able to runtime-test this on V4H ? The series is
otherwise ready to be merged in my opinion.

> Jacopo Mondi (11):
>   media: rcar-vin: Fix YUYV8_1X16 handling for CSI-2
>   media: rcar-csi2: Disable runtime_pm in probe error
>   media: rcar-csi2: Cleanup subdevice in remove()
>   media: rcar-csi2: Use the subdev active state
>   media: adv748x-csi2: Implement enum_mbus_codes
>   media: adv748x-csi2: Validate the image format
>   media: adv748x-csi2: Use the subdev active state
>   media: adv748x-afe: Use 1X16 media bus code
>   media: max9286: Fix enum_mbus_code
>   media: max9286: Use the subdev active state
>   media: max9286: Use frame interval from subdev state
> 
>  drivers/media/i2c/adv748x/adv748x-afe.c       |   4 +-
>  drivers/media/i2c/adv748x/adv748x-csi2.c      | 145 +++++++++-----
>  drivers/media/i2c/adv748x/adv748x.h           |   1 -
>  drivers/media/i2c/max9286.c                   | 182 +++++++-----------
>  drivers/media/platform/renesas/rcar-csi2.c    | 155 +++++++++------
>  .../platform/renesas/rcar-vin/rcar-dma.c      |  16 +-
>  6 files changed, 271 insertions(+), 232 deletions(-)

-- 
Regards,

Laurent Pinchart

