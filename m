Return-Path: <linux-media+bounces-16657-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 465D195CE26
	for <lists+linux-media@lfdr.de>; Fri, 23 Aug 2024 15:41:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 75A111C218D0
	for <lists+linux-media@lfdr.de>; Fri, 23 Aug 2024 13:41:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A37AC18787F;
	Fri, 23 Aug 2024 13:41:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="XM9GRPdF"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 096D946556;
	Fri, 23 Aug 2024 13:41:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724420464; cv=none; b=r/YHVjaN9Ag8ljZ4UR+r8+MKw3v439en+oorFnj+zGDfULhWxAS/mpmRzZgaUgczVCy7Nt/C6d9mU5gKH8Nt8+xoXesWmVJQNz2Vk/EvrfkTbEgBOQUEwOTDtd6YZKJm6zfnBba4C4gin2iRVD6T44qknUZgHjJnLs/iZyp7nik=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724420464; c=relaxed/simple;
	bh=SnDmvmpyTypUld6j40M4MvsABnkQdDKqKCa2KNvoVoQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YtzLJuSN9pv+Ie6zeXs7eE7ty8so5+B180W5ueWiZfhdh1h8LUnbUXdDU7psKiigfgr1CxoHc2t5PnPV79mp52dR3320+uj++rhd5Aetjo5mEqfjsf9NhkD0Y8gyw/W+Acd9TdQAEGdsCWkN0yewD4fcY2SjeiJlOsE3mOvB9Sg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=XM9GRPdF; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 7C4A82D5;
	Fri, 23 Aug 2024 15:39:55 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1724420395;
	bh=SnDmvmpyTypUld6j40M4MvsABnkQdDKqKCa2KNvoVoQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=XM9GRPdFXf11BprIz4lU0o/AnDu10oPcqvMsJQ40LtrfTXERLIuGJTWcq0bqdMkyZ
	 MvQUSLv1HvMulSeF51VeVgDAehZYH8EB7VfOBJPmklh3/XMgCFLNmUWVTtZQQmm+u6
	 BKxgvo2fxObT/r/ZXetzqNkjrq0rafpPjwFxpi+A=
Date: Fri, 23 Aug 2024 16:40:56 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	linux-media@vger.kernel.org, devicetree@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v5 4/6] media: rcar-vin: Add family compatible for R-Car
 Gen4 family
Message-ID: <20240823134056.GH26098@pendragon.ideasonboard.com>
References: <20240704161620.1425409-1-niklas.soderlund+renesas@ragnatech.se>
 <20240704161620.1425409-5-niklas.soderlund+renesas@ragnatech.se>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240704161620.1425409-5-niklas.soderlund+renesas@ragnatech.se>

Hi Niklas,

Thank you for the patch.

On Thu, Jul 04, 2024 at 06:16:18PM +0200, Niklas Söderlund wrote:
> Add the Gen4 family compatible. This will be used instead of a SoC
> specific compatible for the new Gen4 SoC V4M. Two Gen4 boards (V3U and
> V4H) have already been added prior and their bindings need to be kept
> for backward compatibility.
> 
> Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

> ---
> * Changes since v4
> - Extend to cover V3U as well, which despite the name is the first Gen4
>   board.
> 
> * Changes since v3
> - Reworked to deal with a Gen4 family compatible instead of a V4M SoC
>   specific one.
> - Dropped review tags.
> 
> * Changes since v2
> - Extend commit message to explain why SoC specific compatibles are use
>   in the driver instead of adding a new Gen4 fallback to cover both V4H
>   and V4M.
> - Add review tags.
> 
> * Changes since v1
> - Create a shared Gen4 info structure.
> ---
>  .../platform/renesas/rcar-vin/rcar-core.c     | 21 ++++++++-----------
>  1 file changed, 9 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/media/platform/renesas/rcar-vin/rcar-core.c b/drivers/media/platform/renesas/rcar-vin/rcar-core.c
> index 809c3a38cc4a..695d884a22d1 100644
> --- a/drivers/media/platform/renesas/rcar-vin/rcar-core.c
> +++ b/drivers/media/platform/renesas/rcar-vin/rcar-core.c
> @@ -1274,16 +1274,7 @@ static const struct rvin_info rcar_info_r8a77995 = {
>  	.scaler = rvin_scaler_gen3,
>  };
>  
> -static const struct rvin_info rcar_info_r8a779a0 = {
> -	.model = RCAR_GEN3,
> -	.use_mc = true,
> -	.use_isp = true,
> -	.nv12 = true,
> -	.max_width = 4096,
> -	.max_height = 4096,
> -};
> -
> -static const struct rvin_info rcar_info_r8a779g0 = {
> +static const struct rvin_info rcar_info_gen4 = {
>  	.model = RCAR_GEN3,
>  	.use_mc = true,
>  	.use_isp = true,
> @@ -1354,12 +1345,18 @@ static const struct of_device_id rvin_of_id_table[] = {
>  		.data = &rcar_info_r8a77995,
>  	},
>  	{
> +		/* Keep to be compatible with old DTS files. */
>  		.compatible = "renesas,vin-r8a779a0",
> -		.data = &rcar_info_r8a779a0,
> +		.data = &rcar_info_gen4,
>  	},
>  	{
> +		/* Keep to be compatible with old DTS files. */
>  		.compatible = "renesas,vin-r8a779g0",
> -		.data = &rcar_info_r8a779g0,
> +		.data = &rcar_info_gen4,
> +	},
> +	{
> +		.compatible = "renesas,rcar-gen4-vin",
> +		.data = &rcar_info_gen4,
>  	},
>  	{ /* Sentinel */ },
>  };

-- 
Regards,

Laurent Pinchart

