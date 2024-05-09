Return-Path: <linux-media+bounces-11207-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 0440D8C0FE5
	for <lists+linux-media@lfdr.de>; Thu,  9 May 2024 14:47:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 32C2B1C21CC8
	for <lists+linux-media@lfdr.de>; Thu,  9 May 2024 12:47:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 695F8147C62;
	Thu,  9 May 2024 12:47:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="Yq5/8aN9"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 519C013B29F;
	Thu,  9 May 2024 12:47:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715258832; cv=none; b=afSOpBMCvQZw+Ol7vQO+/kYgK/al6drk/PTTh0/B70B4wSKYuJdsvM7HFb/5b6kycpaqD5m+KgQADxKcoc6ngN9pRwq9SsSGvwZ37qIjDgYisq5m2fhqmoCaOBxA3cd3QCykVkeprL0pyVc16WwtRZ+CAZsmWV+e4UKSeuqsDHA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715258832; c=relaxed/simple;
	bh=RbJECLSeHGc1diYjj9Nn0qD1prO8r6mnQobdtOGZtl0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=c3iSiFs9/k3glUG9v9HBEWbZg/aZzW8MmpMaXBkaB6uO3gLnHTCssC5YFmT4Wj5fbf1sSrLPEodnTPLHUv/SLAxsvoO9rRWVI90K4359ImabruByjgxTQnvYOhBIM/U/Akd0zbZ1UugIrXyWr1y5PJa/TePu5mCPfklKj0p060s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=Yq5/8aN9; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 7588AB3;
	Thu,  9 May 2024 14:47:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1715258826;
	bh=RbJECLSeHGc1diYjj9Nn0qD1prO8r6mnQobdtOGZtl0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Yq5/8aN9Mz86w03Dm7L13eA1DQQB/c2cSf2oLIdQHlFEBp2fLWE9mnzQaOxT8cuRH
	 hV7BM4w8/+tnAzsMX2r3ycdB5DV1VENjuhrT8+1+LhIAdPa3jEOCkHIGQjkdA+EGlz
	 RQ6VyJYaoGwAFC/BYleq0nNzpMol687RC5nGXr1g=
Date: Thu, 9 May 2024 15:47:01 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Cc: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v2 08/11] media: adv748x-afe: Use 1X16 media bus code
Message-ID: <20240509124701.GE17123@pendragon.ideasonboard.com>
References: <20240506164941.110389-1-jacopo.mondi@ideasonboard.com>
 <20240506164941.110389-9-jacopo.mondi@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240506164941.110389-9-jacopo.mondi@ideasonboard.com>

Hi Jacopo,

Thank you for the patch.

On Mon, May 06, 2024 at 06:49:36PM +0200, Jacopo Mondi wrote:
> Now that the adv748x CSI-2 transmitter drivers validate the supported
> formats, it is required for subdevices along the pipeline to produce
> and consume the same media bus codes.
> 
> The adv748x analog front end driver use the 2X8 variant of the UYVY8
> media bus code, while the CSI-2 transmitter use the 1X16 variant, which
> is the correct one to use for the serial bus.
> 
> Make the adv748x afe use the 1X16 format variant to maintain the
> pipeline validation correct.
> 
> Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  drivers/media/i2c/adv748x/adv748x-afe.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/media/i2c/adv748x/adv748x-afe.c b/drivers/media/i2c/adv748x/adv748x-afe.c
> index 50d9fbadbe38..5edb3295dc58 100644
> --- a/drivers/media/i2c/adv748x/adv748x-afe.c
> +++ b/drivers/media/i2c/adv748x/adv748x-afe.c
> @@ -114,7 +114,7 @@ static void adv748x_afe_fill_format(struct adv748x_afe *afe,
>  {
>  	memset(fmt, 0, sizeof(*fmt));
>  
> -	fmt->code = MEDIA_BUS_FMT_UYVY8_2X8;
> +	fmt->code = MEDIA_BUS_FMT_UYVY8_1X16;
>  	fmt->colorspace = V4L2_COLORSPACE_SMPTE170M;
>  	fmt->field = V4L2_FIELD_ALTERNATE;
>  
> @@ -337,7 +337,7 @@ static int adv748x_afe_enum_mbus_code(struct v4l2_subdev *sd,
>  	if (code->index != 0)
>  		return -EINVAL;
>  
> -	code->code = MEDIA_BUS_FMT_UYVY8_2X8;
> +	code->code = MEDIA_BUS_FMT_UYVY8_1X16;
>  
>  	return 0;
>  }

-- 
Regards,

Laurent Pinchart

