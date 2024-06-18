Return-Path: <linux-media+bounces-13570-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C5DD990D6D5
	for <lists+linux-media@lfdr.de>; Tue, 18 Jun 2024 17:14:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D7E5C1C2549B
	for <lists+linux-media@lfdr.de>; Tue, 18 Jun 2024 15:14:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 376AB3DB89;
	Tue, 18 Jun 2024 15:11:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="IDvVcH2y"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1417D3DBB7;
	Tue, 18 Jun 2024 15:11:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718723517; cv=none; b=rqIIuDEWtAYwBkNLaI0ewfAaaB5d5jrR+lleqe6chTGULbtUZ6zJO+Kp6dFCn0qSTIje0M8R5d5yC8Zw1RXYursUuv+lagTedgPKvsi/yo0Pz1O5SFahbHdElZ7C0OJjhKD3I5pz+lAf4hdsWRDTqg4sKOktUK5/8zMUEhrmCSA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718723517; c=relaxed/simple;
	bh=5/8KXGO0PH1RFt/sKwfKQYjBbvvo5Q6jQ85zOGqIbME=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NOe0GwZdEcvOhkBeHiLm9I4r+fju5GvEB9F7ZHWbAHW4p7GAgJU05aoY7ZxBxuv8Ajz2FvtvgjMCyYb8ByTaxdqh/zWL1SKNYIyBE9ctdMy4jLwYLUcfMYt7tI8QOI7CKiseI+80c7rVePm4wJOw3m9/HhZmFjOFCIeE/cjF/Xg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=IDvVcH2y; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id A23EA908;
	Tue, 18 Jun 2024 17:11:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1718723496;
	bh=5/8KXGO0PH1RFt/sKwfKQYjBbvvo5Q6jQ85zOGqIbME=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=IDvVcH2yvZ0GxItcIjXhU2SuvQdzWTTGl7F4tBMSmtCorZVGjXsjPvUNdfkH5hG32
	 W+9opoSp9CQ2spyut/KeLpEid4N/I4NLbMMoerqAJGfdPt3f3t2idlCEGwNaUGJz1m
	 jHHeeEt3Tq5sHHwAhQbS29ADGnwOwVhdVficyJNs=
Date: Tue, 18 Jun 2024 18:11:30 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Cc: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v4 00/11] media: renesas: rcar-csi2: Use the subdev
 active state
Message-ID: <20240618151130.GC22767@pendragon.ideasonboard.com>
References: <20240617161135.130719-1-jacopo.mondi@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240617161135.130719-1-jacopo.mondi@ideasonboard.com>

Hi Jacopo,

I've taken the series in my tree and I'm running some tests. If all goes
well I'll send a pull request shortly.

On Mon, Jun 17, 2024 at 06:11:23PM +0200, Jacopo Mondi wrote:
> v3->v4:
> - Add tags
> - Re-sort patches as suggested by Niklas to avoid breaking bisection
> 
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
> jmondi/renesas-drivers-2024-06-11-v6.10-rc3/multistream-subdev-active-state
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
> 
> 
> Jacopo Mondi (11):
>   media: rcar-vin: Fix YUYV8_1X16 handling for CSI-2
>   media: rcar-csi2: Disable runtime_pm in probe error
>   media: rcar-csi2: Cleanup subdevice in remove()
>   media: rcar-csi2: Use the subdev active state
>   media: adv748x-csi2: Implement enum_mbus_codes
>   media: adv748x-afe: Use 1X16 media bus code
>   media: adv748x-csi2: Validate the image format
>   media: adv748x-csi2: Use the subdev active state
>   media: max9286: Fix enum_mbus_code
>   media: max9286: Use the subdev active state
>   media: max9286: Use frame interval from subdev state
> 
>  drivers/media/i2c/adv748x/adv748x-afe.c       |   4 +-
>  drivers/media/i2c/adv748x/adv748x-csi2.c      | 145 +++++++++-----
>  drivers/media/i2c/adv748x/adv748x.h           |   1 -
>  drivers/media/i2c/max9286.c                   | 181 +++++++-----------
>  drivers/media/platform/renesas/rcar-csi2.c    | 155 +++++++++------
>  .../platform/renesas/rcar-vin/rcar-dma.c      |  16 +-
>  6 files changed, 271 insertions(+), 231 deletions(-)

-- 
Regards,

Laurent Pinchart

