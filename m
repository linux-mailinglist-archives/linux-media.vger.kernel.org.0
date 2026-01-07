Return-Path: <linux-media+bounces-50146-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 03F85CFE465
	for <lists+linux-media@lfdr.de>; Wed, 07 Jan 2026 15:26:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id F063630DC65C
	for <lists+linux-media@lfdr.de>; Wed,  7 Jan 2026 14:20:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2AC2934107A;
	Wed,  7 Jan 2026 14:20:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="FjAmDuZl"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 511DC3081AD
	for <linux-media@vger.kernel.org>; Wed,  7 Jan 2026 14:20:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767795614; cv=none; b=LplqU7psqdvyd64/oiBdnBYbp8G3oyHve3mKR7P5rDIxqnQoFnQ6bB6kIRITiPQ02XEgvL7zbWWaafsVFZhFIZLZ6ObIGrNfeMET0RXTqkVKUkxlNAccTaohaxQPAxhd+p2A8zGvPtCUUlsc4gxYjRLzZvRMDxi9EjvdULMZdak=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767795614; c=relaxed/simple;
	bh=RP6yrOmfkgG1pSCCp/KgSQ837psbCw1sb+DDsPfjTA0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qL6Zg95h72q0B5oopUUfBJ8CgboNTmJWToyXrtyw9QhpFAcbqdAJReoxZMsVZhenHByDGeGXA0A1OPLVP4dD2N/04ms0lpzH3z93jnZRlaXJepVfPSFM8DWMpUMTKgLCoCSvYleCoi+AibUaUd0Kax2GR12lUleCDaKO1jVuNIU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=FjAmDuZl; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-42fb4eeb482so1158706f8f.0
        for <linux-media@vger.kernel.org>; Wed, 07 Jan 2026 06:20:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1767795611; x=1768400411; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=/3EuWWmPchcdKXlx3oZPsaTz80UKO5qPXs+yQV6vLYk=;
        b=FjAmDuZlSZE5kI+yW/BorTqN0MGGTsR0db90eFSlkd18rEgZXF/9Q+IJrjIVOPVbWI
         goVrwAiwmjuGybZyplrEX4TAMPDG6KXxzORDcJ6p7n8ATSRBgNstvuwO3PhB1O6HYodi
         oJcaEXRDkKpxcGOVA0src+6a+dzq5YFmcvcj2v1K8uKBNJKms/UQGG3pLB457kCi3Czl
         rJBAeRPbANvXE27bJjr2XQZm/FGBuArF1iVzZTLk0Fp6yJK0Vm+Aq4ksLwZ8vjFKjN0w
         bW7RaQ3mi8rrxkeu8+TQ0V+Utgyn29Zq0Pbl2vkTJ3PbT91t9j/8FquOWJC+7EvR+ewM
         RSHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767795611; x=1768400411;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/3EuWWmPchcdKXlx3oZPsaTz80UKO5qPXs+yQV6vLYk=;
        b=PwaUKt8najRyPz9cuDzXGXWsW/ON9rDO4neP8ol2YdXG6VLrlZq4I67RcdhqYtAJcI
         Uu/sJTe2X7OCwmGfpR4lGNhstmb/LnNzI2ODpFOGXuXMG45KYqAwDZQ9Ed7PnB1w/nEi
         84gdh+QUSw0peZURSromddRBJtTukd6q3e7qWRn5zzO0F2yL27A0hRrk/tae5yXrxY3Y
         TlXPj1d9gdPvX3mxZ/vmxLyOdNkY0BJaeEbN5ydgmz4dgBKTNruj0rA9lr1XFeBS8vXH
         CiZBzLGLJYU/woySvXechds2UmuCmiMMVFG93k3ty3czJ2WQ1OsJwhCcu64oEFhMWwJV
         rv1g==
X-Forwarded-Encrypted: i=1; AJvYcCXUQnoYl9sxb/Sl5AY15XwGfYaPdWRUZYMyWNE5OZC+f8BLikB8SaxT4eEMImIn77/q1aUCTBFWeGxYgg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwdEDyavpFJyzMt56uXLy5tVeDsftmjqpCgjpOkXLfRyHoKhqP9
	KmozyucgQ7IUc8aWbFMApfRdEODIVs7D6daHwF8BojwuKD8OyWMcpFI4ZV95l2mLDCc=
X-Gm-Gg: AY/fxX6hR23eO8dkby+emEp0Uf+3FKh0uF9znKlPJZG+lB8+uVpQsvqaQKWtSjgV9W2
	CLnT/Ma40+MaaI5Dta61w9FctC2lNGNv/9cJHF0NTnzYZbKZz72enoptj+n0/HGvRMlRQQSGLHV
	5D7Cgo3M/e4rLrB1FzJUbz39427fQN9ukgZoiHciRQ/zwockh5+2aIE7i2tzqcYWRTchWYhaKeF
	LmLNQ0c64ZoVHvIhYUgd1EQzebiVhSgNb3QFtSbWnQmMWS2/rKm47etHv1BPRZSjk4z3Kh+4xah
	OLbm5YX3x/wm4FI+fYqU9I1FzRx6yUxmj/YaZJNB8IgBn9YOKtVta0TRIxcWNdvU2cYUx1peI9d
	ZnnbptgsXkBBXdjBlZGNKzlmURbCVepJ9EocputhjMgNl3reDh3VzoV7yg7f6hHio0VMOoKCUUt
	lLXK9dcNj9LMODWZX/xI/CUkhBavg=
X-Google-Smtp-Source: AGHT+IHUqb1cXUtZCpRJ8P4UFLSIpAgDZ36o1m7wd/K9meyda/t653aOMHHTvrT9/dtiigGlLK+MGQ==
X-Received: by 2002:a05:6000:2302:b0:431:316:920a with SMTP id ffacd0b85a97d-432c3628fdemr2605337f8f.8.1767795610407;
        Wed, 07 Jan 2026 06:20:10 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-432bd5ff319sm10689604f8f.43.2026.01.07.06.20.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Jan 2026 06:20:09 -0800 (PST)
Date: Wed, 7 Jan 2026 17:20:06 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Karthikey D Kadati <karthikey3608@gmail.com>
Cc: Hans de Goede <hansg@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 RESEND v2 1/3] media: atomisp: replace shadow zoom
 structs with v4l2_rect
Message-ID: <aV5rloYmYfLMkMKA@stanley.mountain>
References: <81e2d12c-342b-4b88-88a0-3e24115541aa@kernel.org>
 <20260107134844.68074-1-karthikey3608@gmail.com>
 <20260107134844.68074-2-karthikey3608@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260107134844.68074-2-karthikey3608@gmail.com>

On Wed, Jan 07, 2026 at 07:18:42PM +0530, Karthikey D Kadati wrote:
> Remove custom atomisp_zoom_point and atomisp_zoom_region structs and
> 
> usage in favor of standard v4l2_rect within atomisp_dz_config.
> 
> This aligns the driver with V4L2 standards and removes unnecessary
> 
> custom types.
> 
> Also standardizes the internal ia_css_region struct members to match
> 
> V4L2 naming conventions (left, top, width, height) to facilitate the
> 
> bridge mapping.
> 
> Updates atomisp_cmd.c and sh_css_params.c to use the new member names
> 
> and ensures safe math using long long casts to prevent overflow during
> 
> resolution scaling.
> 

The commit message has extra new lines obviously.

> diff --git a/drivers/staging/media/atomisp/pci/atomisp_cmd.c b/drivers/staging/media/atomisp/pci/atomisp_cmd.c
> index 327836372..4ed6b8aea 100644
> --- a/drivers/staging/media/atomisp/pci/atomisp_cmd.c
> +++ b/drivers/staging/media/atomisp/pci/atomisp_cmd.c
> @@ -1764,15 +1764,13 @@ int atomisp_calculate_real_zoom_region(struct atomisp_sub_device *asd,
>  		return -EINVAL;
>  	}
>  
> -	if (dz_config->zoom_region.resolution.width
> -	    == asd->sensor_array_res.width
> -	    || dz_config->zoom_region.resolution.height
> -	    == asd->sensor_array_res.height) {
> +	if (dz_config->zoom_region.width == asd->sensor_array_res.width ||
> +	    dz_config->zoom_region.height == asd->sensor_array_res.height) {
>  		/*no need crop region*/
> -		dz_config->zoom_region.origin.x = 0;
> -		dz_config->zoom_region.origin.y = 0;
> -		dz_config->zoom_region.resolution.width = eff_res.width;
> -		dz_config->zoom_region.resolution.height = eff_res.height;
> +		dz_config->zoom_region.left = 0;
> +		dz_config->zoom_region.top = 0;
> +		dz_config->zoom_region.width = eff_res.width;
> +		dz_config->zoom_region.height = eff_res.height;
>  		return 0;
>  	}
>  
> @@ -1783,18 +1781,18 @@ int atomisp_calculate_real_zoom_region(struct atomisp_sub_device *asd,
>  	 */
>  
>  	if (!IS_ISP2401) {
> -		dz_config->zoom_region.origin.x = dz_config->zoom_region.origin.x
> -						  * eff_res.width
> -						  / asd->sensor_array_res.width;
> -		dz_config->zoom_region.origin.y = dz_config->zoom_region.origin.y
> -						  * eff_res.height
> -						  / asd->sensor_array_res.height;
> -		dz_config->zoom_region.resolution.width = dz_config->zoom_region.resolution.width
> -							  * eff_res.width
> -							  / asd->sensor_array_res.width;
> -		dz_config->zoom_region.resolution.height = dz_config->zoom_region.resolution.height
> -							  * eff_res.height
> -							  / asd->sensor_array_res.height;
> +		dz_config->zoom_region.left =
> +			(s32)((long long)dz_config->zoom_region.left *
> +			      eff_res.width / asd->sensor_array_res.width);
> +		dz_config->zoom_region.top =
> +			(s32)((long long)dz_config->zoom_region.top *
> +			      eff_res.height / asd->sensor_array_res.height);
> +		dz_config->zoom_region.width =
> +			(u32)((long long)dz_config->zoom_region.width *
> +			      eff_res.width / asd->sensor_array_res.width);
> +		dz_config->zoom_region.height =
> +			(u32)((long long)dz_config->zoom_region.height *
> +			      eff_res.height / asd->sensor_array_res.height);


Why do we need this new casting?  Is it a bugfix?

I don't love the casts to s32 and u32.  Those are unnecessary.  Also
width and height are s32 so why are we casting to u32?  Same comments
for the other casts later on.

There are more style changes than strictly necessary to just rename the
struct members.

regards,
dan carpenter


