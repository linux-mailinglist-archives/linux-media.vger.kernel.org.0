Return-Path: <linux-media+bounces-17417-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 441E3968FD9
	for <lists+linux-media@lfdr.de>; Tue,  3 Sep 2024 00:43:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EE41B284BFB
	for <lists+linux-media@lfdr.de>; Mon,  2 Sep 2024 22:43:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E128718732A;
	Mon,  2 Sep 2024 22:43:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="FeopdXZL"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A18831A4E71
	for <linux-media@vger.kernel.org>; Mon,  2 Sep 2024 22:43:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725316991; cv=none; b=UJQXipT9l/WgDXhd3TXr+Ya7fdH+jpqDHK33jmJbFjEmOzM6KBQ7plmu5k9nQSliU+4CC3i7qp+O3jwKlP9ehiStqRbd4A0K+TS5GNclO07Okl9rBSbNOWVvKirhbYPKcmBcMEs4SpBfytHOfYg0RMgynMyrXWWpDMnvEj7d0pM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725316991; c=relaxed/simple;
	bh=rF0Zxx4Xrwa07FbO16pUZyin5zZKN1zzpP/4nryLmlI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HAN3oEH+cyTiUGZ+AknAgGAg/Rfb3waC/hqzMgnox3DlFTWeoOPT7pe2Rk4uW0hi2zUU/cBeM/58Y/LMk0IXQuaozyFtrwJJArludb8bQSzfTO5Me8L5Px4qpdT30SUXIN7Dme5Cp9USpV7aZfIwLMckN6N0bJtTAZy8YzL79rA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=FeopdXZL; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 26D6421E;
	Tue,  3 Sep 2024 00:41:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1725316916;
	bh=rF0Zxx4Xrwa07FbO16pUZyin5zZKN1zzpP/4nryLmlI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=FeopdXZLkoPoB0mDYRm/QKVvv4aL8FGRImsedTvVwE3U9Uu1nRlJBB+nSYx7ilLjD
	 LtEHxMhAiuVn3Xku4S9tPcXiuE7e87l/XSEiIyZZ6VL+vu3hSFmkdXUcccwzPHzRnA
	 lT7wQMA5CQDEUbo02cIEnRxb+1amarO374A+jGAE=
Date: Tue, 3 Sep 2024 01:42:34 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Cc: Naushir Patuck <naush@raspberrypi.com>,
	Nick Hollinghurst <nick.hollinghurst@raspberrypi.com>,
	David Plowman <david.plowman@raspberrypi.com>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	linux-media@vger.kernel.org
Subject: Re: [PATCH v4 1/4] media: pisp_be: Drop reference to non-existing
 function
Message-ID: <20240902224234.GA26371@pendragon.ideasonboard.com>
References: <20240902112408.493201-1-jacopo.mondi@ideasonboard.com>
 <20240902112408.493201-2-jacopo.mondi@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240902112408.493201-2-jacopo.mondi@ideasonboard.com>

Hi Jacopo,

Thank you for the patch.

On Mon, Sep 02, 2024 at 01:24:03PM +0200, Jacopo Mondi wrote:
> A comment in the pisp_be driver references the
> pispbe_schedule_internal() function which doesn't exist.
> 
> Drop it.
> 
> Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

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
>  		dev_warn(pispbe->dev, "ISP-BE missing input\n");
>  		hw_en->bayer_enables = 0;
>  		hw_en->rgb_enables = 0;

-- 
Regards,

Laurent Pinchart

