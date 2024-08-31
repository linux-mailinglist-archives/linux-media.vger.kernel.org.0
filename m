Return-Path: <linux-media+bounces-17266-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C8961966E54
	for <lists+linux-media@lfdr.de>; Sat, 31 Aug 2024 03:04:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 77DE71F23047
	for <lists+linux-media@lfdr.de>; Sat, 31 Aug 2024 01:04:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B85A71A277;
	Sat, 31 Aug 2024 01:04:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="tKVzcXLr"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB48F28EF
	for <linux-media@vger.kernel.org>; Sat, 31 Aug 2024 01:04:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725066246; cv=none; b=d0V45NUWvgNXaWewdwbrI1o91PPR87n2CzM34McsCdvbqjH6q7DPH1lUL197NN/CdIXia67H9WcPGNL7FiCd0HTjWiBtS1KXm2zg4fhXdupw3MFJXhB5UlNPiFFKvAAcxX2axCRHj5OLSwYrGhWjUjDo6wLJ1vfLPxA8VWvrHik=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725066246; c=relaxed/simple;
	bh=0HCFbL3z3ls8ATOGljGotMoC6OfydcqbyEqKbLZL0uw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Z8E0BwPkbeDMhvgEqf5NM8pp2m5bsbBtimkaMqbX4fmyUo902yLEYbMN+///LmkCyIkPX9EMwO3SW5VM2uRAucE6kCrNRnT3Wf0YHuaPvu3xwGyr261zmt48DeYcsJa8UFPNwbSx+hylB6Kxrm2WRMbGx1byFcK9ebk3HtSFKck=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=tKVzcXLr; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 2762074C;
	Sat, 31 Aug 2024 03:02:53 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1725066173;
	bh=0HCFbL3z3ls8ATOGljGotMoC6OfydcqbyEqKbLZL0uw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=tKVzcXLrQwesL094hH1TB86JBPaRysFuMTpT4pUaySx5/d1WnISp1kSALeZ1pUGd3
	 Fqt9rc+LZznZkA8u4BqTZLtmeyKzHWeOZQgIcxBk09r18trTNlWTyCsOCYwdDYc/Ct
	 p985ARwrA85rl6pNI6khDnUZtuW1WdtQHlujq3l0=
Date: Sat, 31 Aug 2024 04:03:30 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Cc: Naushir Patuck <naush@raspberrypi.com>,
	Nick Hollinghurst <nick.hollinghurst@raspberrypi.com>,
	David Plowman <david.plowman@raspberrypi.com>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	linux-media@vger.kernel.org
Subject: Re: [PATCH v3 1/4] media: pisp_be: Drop reference to non-existing
 function
Message-ID: <20240831010330.GC27958@pendragon.ideasonboard.com>
References: <20240827074018.534354-1-jacopo.mondi@ideasonboard.com>
 <20240827074018.534354-2-jacopo.mondi@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240827074018.534354-2-jacopo.mondi@ideasonboard.com>

Hi Jacopo,

Thank you for the patch.

On Tue, Aug 27, 2024 at 09:40:15AM +0200, Jacopo Mondi wrote:
> A comment in the pisp_be driver references to the

s/to the/the/

>  pispbe_schedule_internal() which doesn't exist.

s/which/function which/

> 
> Drop it.
> 
> Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
> ---
>  drivers/media/platform/raspberrypi/pisp_be/pisp_be.c | 5 +----
>  1 file changed, 1 insertion(+), 4 deletions(-)
> 
> diff --git a/drivers/media/platform/raspberrypi/pisp_be/pisp_be.c b/drivers/media/platform/raspberrypi/pisp_be/pisp_be.c
> index 65ff2382cffe..8ba1b9f43ba1 100644
> --- a/drivers/media/platform/raspberrypi/pisp_be/pisp_be.c
> +++ b/drivers/media/platform/raspberrypi/pisp_be/pisp_be.c
> @@ -368,10 +368,7 @@ static void pispbe_xlate_addrs(struct pispbe_dev *pispbe,
>  	ret = pispbe_get_planes_addr(addrs, buf[MAIN_INPUT_NODE],
>  				     &pispbe->node[MAIN_INPUT_NODE]);
>  	if (ret <= 0) {
> -		/*
> -		 * This shouldn't happen; pispbe_schedule_internal should insist
> -		 * on an input.
> -		 */
> +		/* Shouldn't happen, we have validated an input is available. */

Actually, where is that validated ?

>  		dev_warn(pispbe->dev, "ISP-BE missing input\n");
>  		hw_en->bayer_enables = 0;
>  		hw_en->rgb_enables = 0;

-- 
Regards,

Laurent Pinchart

