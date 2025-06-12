Return-Path: <linux-media+bounces-34688-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E7957AD7ED9
	for <lists+linux-media@lfdr.de>; Fri, 13 Jun 2025 01:18:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 708663B4B24
	for <lists+linux-media@lfdr.de>; Thu, 12 Jun 2025 23:17:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BB4F2278E71;
	Thu, 12 Jun 2025 23:18:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="Bmqq9isV"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1A2515C158;
	Thu, 12 Jun 2025 23:18:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749770294; cv=none; b=VnRHMiNGhkisnnoqw+7eAPCiwngrzmGccEob5G3avGU6VWDUH5rsmjVne6WJJ0hJrNd7Nf9HbXqs2Uakt+35B08h0qnJXqpYvH9jRJyxouh7cP48wGWtopH1bAvc1Tf0VJpdfy/GaryoDASIXkhm1fMyCb+QKfJTC0zxKfZofx8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749770294; c=relaxed/simple;
	bh=mdtsjoDfhzecBlr9EfiwYmVK+u7sPWPw3P5lqVhtP7Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sSQi9iym0R9NZeQSzAq4/p78GhuYopFxRuwivJqzYXp4ZjHMLHXR24542VROljnibxjJmBouG+0/9+XJhqx1iGo5YThav/9ZXqzFxryVRGtAGq/kYc/JDvNbZUmjH3dzGK4kiOJjruvXRmO6thKMUPLarOO6wW1SfPwR/szANiE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=Bmqq9isV; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id BBF047E1;
	Fri, 13 Jun 2025 01:18:00 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1749770280;
	bh=mdtsjoDfhzecBlr9EfiwYmVK+u7sPWPw3P5lqVhtP7Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Bmqq9isV7L6CiOw9bEDdzkLdrOqGofE0JIFhpCvyDOIPpvN1i3ACKcVimi4xWJkN9
	 0z6kJG9TWmbho2yTNSpiGSFZfAzQZf2ReLMRMb4++PQd4Z3IHN2ByQb16uh1DZ9NCt
	 znnod/ubdrWP18okkrnjryDjCPHnmqourmbdUexE=
Date: Fri, 13 Jun 2025 02:17:54 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
	linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v5 09/12] media: rcar-vin: Remove NTSC workaround
Message-ID: <20250612231754.GF10542@pendragon.ideasonboard.com>
References: <20250606182606.3984508-1-niklas.soderlund+renesas@ragnatech.se>
 <20250606182606.3984508-10-niklas.soderlund+renesas@ragnatech.se>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250606182606.3984508-10-niklas.soderlund+renesas@ragnatech.se>

Hi Niklas,

Thank you for the patch.

On Fri, Jun 06, 2025 at 08:26:03PM +0200, Niklas Söderlund wrote:
> On Gen2 where sub-devices where not exposed to user-space the filed

s/filed/field/

> TB/BT ordering was controlled by a hack in the VIN driver. Before
> converting it to media device model where the subdevice is exposed
> remove that hack.
> 
> Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

> ---
> * Changes since v4
> - Broken out from larger patch.
> ---
>  drivers/media/platform/renesas/rcar-vin/rcar-dma.c | 3 ---
>  1 file changed, 3 deletions(-)
> 
> diff --git a/drivers/media/platform/renesas/rcar-vin/rcar-dma.c b/drivers/media/platform/renesas/rcar-vin/rcar-dma.c
> index 5c08ee2c9807..4fb33359bb0f 100644
> --- a/drivers/media/platform/renesas/rcar-vin/rcar-dma.c
> +++ b/drivers/media/platform/renesas/rcar-vin/rcar-dma.c
> @@ -700,9 +700,6 @@ static int rvin_setup(struct rvin_dev *vin)
>  	case V4L2_FIELD_INTERLACED:
>  		/* Default to TB */
>  		vnmc = VNMC_IM_FULL;
> -		/* Use BT if video standard can be read and is 60 Hz format */
> -		if (!vin->info->use_mc && vin->std & V4L2_STD_525_60)
> -			vnmc = VNMC_IM_FULL | VNMC_FOC;
>  		break;
>  	case V4L2_FIELD_INTERLACED_TB:
>  		vnmc = VNMC_IM_FULL;

-- 
Regards,

Laurent Pinchart

