Return-Path: <linux-media+bounces-33451-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C414EAC4DDB
	for <lists+linux-media@lfdr.de>; Tue, 27 May 2025 13:49:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 73EE4179EEE
	for <lists+linux-media@lfdr.de>; Tue, 27 May 2025 11:49:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5FFDB25DCE0;
	Tue, 27 May 2025 11:49:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="qrlqOcQX"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5335125D8FA;
	Tue, 27 May 2025 11:49:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748346548; cv=none; b=oDqVKPo9hkw8QFhwsDB322fbfQhrFtoeCWKMX2b5TSTUCFMTDV4z1fgpZ4ARwPQtvCCW0ViW2KfwG7uXVv00+Tdwl3gpQAjELEGiyk794EY2D0k7RvNZD7z/rgxNXWjcy7UClX3qNHFowXNJDlD5PF9+x9RRJSPwuuUL85XHQGg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748346548; c=relaxed/simple;
	bh=oIKBUOrPhASIPkJjLEMK7yZmBDQQRrz6kx7F4aZn9Mo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=T+hLKTci+L4LqXPMVGaPWv2VsDQZWseYqya3WPUfrz2QyoV763XVV5YSJTJaKP1V52KNKoaF3JQT9o2WGFxfeDGgd9ND/IvftCRt3PEoM0YOFtR3OtpCTt41zLIIKlDH+6N1d4OnzqrPLf5K86QUr72GY/i2o7/9W5uuB4elmJ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=qrlqOcQX; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (unknown [145.15.244.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id C6DB22B3;
	Tue, 27 May 2025 13:48:39 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1748346520;
	bh=oIKBUOrPhASIPkJjLEMK7yZmBDQQRrz6kx7F4aZn9Mo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qrlqOcQX8N7cIm4z2M/9mI9IImF6RGjvU5O0/3t3TgZvrERZxt89SptbV1ojBWFsL
	 Wj9QHgs6qPjqM7Q9ERNfpMoQ5rrXof37ZkbGbCmg/hNToOCQhxyXfCTxDhslYNscQr
	 XDh/qMmLOybJBJKuZaebOSsAL8Wa8u2f0IS8AGHg=
Date: Tue, 27 May 2025 13:48:47 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
	linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v4 6/6] media: rcar-vin: Enable media-graph on Gen2
Message-ID: <20250527114847.GM12492@pendragon.ideasonboard.com>
References: <20250521132037.1463746-1-niklas.soderlund+renesas@ragnatech.se>
 <20250521132037.1463746-7-niklas.soderlund+renesas@ragnatech.se>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250521132037.1463746-7-niklas.soderlund+renesas@ragnatech.se>

Hi Niklas,

Thank you for the patch.

On Wed, May 21, 2025 at 03:20:37PM +0200, Niklas Söderlund wrote:
> Complete the conversion from soc_camera to a full fledge media
> controller enabled devices for all supported generations of the device.
> All work is already done as this is already supported on Gen3, and
> later.
> 
> All that is missing is some small touch ups of the unified v4l-notifier,
> unconditionally creation of a media pad for each VIN and removing all
> special cases for the non media-graph call paths.

Would it be possible to split the first two items from the last ?
Removal of all special cases and dead code is large, and makes it
difficult to spot the other changes.

> Mark the completion of converting from soc_camera by injecting an
> attribution of myself in the header.
> 
> Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
> ---
> * Changes since v3
> - Resolve conflicts with other VIN work merged a head of this series.
> ---
>  .../platform/renesas/rcar-vin/rcar-core.c     | 249 ++-------
>  .../platform/renesas/rcar-vin/rcar-dma.c      |  16 +-
>  .../platform/renesas/rcar-vin/rcar-v4l2.c     | 488 +-----------------
>  .../platform/renesas/rcar-vin/rcar-vin.h      |  10 +-
>  4 files changed, 66 insertions(+), 697 deletions(-)

[snip]

-- 
Regards,

Laurent Pinchart

