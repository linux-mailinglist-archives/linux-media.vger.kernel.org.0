Return-Path: <linux-media+bounces-14821-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C71992CCCD
	for <lists+linux-media@lfdr.de>; Wed, 10 Jul 2024 10:21:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 81CC72811EF
	for <lists+linux-media@lfdr.de>; Wed, 10 Jul 2024 08:21:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 34ED0127E3A;
	Wed, 10 Jul 2024 08:21:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GzLdO7xh"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDDCD126F1E;
	Wed, 10 Jul 2024 08:21:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720599701; cv=none; b=raeCF6D4FvWIScmjiBXEsF4uYaefGN0Li4vopeXIwUSxjuBVfP/83/rtsEv3yS2fyaZr5SRQVy7FG9u5Y5YeyUj/Au4xuQzDzuNWzTS1LIRRaRRAvdxL29X04lMCnFt468hseZv6SkUMnDc3Ldf+2LWOQ9sCQ9YJOXRG1DMWmQ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720599701; c=relaxed/simple;
	bh=JhdIxpcqbPbR1wzXRRVgQmW569HvrUgJrQ3ajSwtswI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RDR7y5wdjbYSgK03mE/UNP2tye8cZL+vKuWdiCcbVpXCc2JvGXiVyoev0plYV/cD05aSdiZ/mj24UbLQMX8yjs/DqSQiXqh41x8q+Kd4su//SRrsOgbjPJQo6oO0ffcE36AumODHdjhUkZWSuPKZKEYoVxxpGPnqlk133Ff9phg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GzLdO7xh; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-a77cbb5e987so572829966b.3;
        Wed, 10 Jul 2024 01:21:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720599698; x=1721204498; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=XpxD6E7ipxHMFpeAsZf9n7YZR0CgoPiU1T154zXbyhA=;
        b=GzLdO7xhr8w63KsIY8NLYjbNZwn2lqjQ2vCPlSPbzapuqZez+u3B0lxHjJrCABRnkc
         X/xOEdEbtQ2tKGDtAC88BxTr5hev/vIt9BUx+OHYlj9loAP0FSlkiwSTI5x6I1rUYfgO
         LV97ThNk3DVKSe25qDv5hhGjcSLPARx1Mn+oyoxMNrU+07y4oYmWyr/Dx5gdshWKTj0z
         gl2oySa/lrOw8wE88SZO5KACk7KDXquQ1hzYfiEIu8QWtWFWk/9go++KuzJS0uAQSywO
         lJbVJ8eahC21ulwBLxU/NtNnuWJsysQyU+Sai5FEf1tCezFOwqXlmpc9nM5VRjfVEKLt
         OZRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720599698; x=1721204498;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XpxD6E7ipxHMFpeAsZf9n7YZR0CgoPiU1T154zXbyhA=;
        b=lORYv6Q1gJjWK3mNtqwQ/Lh1ybrU0HZI8FsFZjbTbz8xv2u2LkhidWjKbs1muJrC7c
         HdDITdzuDvIfaTzNSQPhHefrP84VvZiyHA0jcasF015Ec8HNWvyKeNYD0Spbdy+IvcsB
         888UZAsQDsg1vhvtaYZ9Tsnz/oobYgcbo7SbtP1GDnbw7IJYp7KVJns6IFxC8GVcJQqE
         u4LGW9yKoIJcZ+HgVj4MzBb2kB+0DO5UNnZt9/xF7XX0FJa+rOSSaOFKEyGiVT/XOJNr
         txr8iLeEqSYzlcAnB17AZXHs6mn2XEeLro2seAPFBoO8+Y2THZcksr8olWQmYBKgTbwG
         J0zA==
X-Forwarded-Encrypted: i=1; AJvYcCVopXVx5MFMNwqPuFNyllXb5rNqQX7dI58qknrBB9BC4E+LkdymvvEdFVAs2QdGCw3pFK+UabtMLYYuWW7IPdKQA+S3m8zWlpTLOdUP
X-Gm-Message-State: AOJu0Yy/vu2GNDEoYExHf0WhV8X7L65pSFfQABpfMuupFb6i0YRwSkHr
	X2prmo/BcbjluUSKD8E/wsPGGED136fVUx5gJjuVEwnoEn9QXWkE
X-Google-Smtp-Source: AGHT+IEJS+Ea6KkptxvOMJTgjLF8Awo+2BsQyewBZ3YLTdAILLC2SdhDnh9qXPCzDfDdeKQQhVmveA==
X-Received: by 2002:a17:907:944f:b0:a77:db36:1ccf with SMTP id a640c23a62f3a-a780b70528emr448079866b.42.1720599697900;
        Wed, 10 Jul 2024 01:21:37 -0700 (PDT)
Received: from tom-HP-ZBook-Fury-15-G7-Mobile-Workstation (net-2-39-142-11.cust.vodafonedsl.it. [2.39.142.11])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a780a85435dsm139679766b.149.2024.07.10.01.21.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jul 2024 01:21:37 -0700 (PDT)
Date: Wed, 10 Jul 2024 10:21:35 +0200
From: Tommaso Merciai <tomm.merciai@gmail.com>
To: Umang Jain <umang.jain@ideasonboard.com>
Cc: linux-media@vger.kernel.org,
	Alexander Shiyan <eagle.alexander923@gmail.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 1/2] media: imx335: Rectify name of mode struct
Message-ID: <Zo5Ej2e9zHGUr0yp@tom-HP-ZBook-Fury-15-G7-Mobile-Workstation>
References: <20240710044633.81372-1-umang.jain@ideasonboard.com>
 <20240710044633.81372-2-umang.jain@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240710044633.81372-2-umang.jain@ideasonboard.com>

Hi Umang,

On Wed, Jul 10, 2024 at 10:16:31AM +0530, Umang Jain wrote:
> In commit 81495a59baeb ("media: imx335: Fix active area height discrepency")
> the height for the mode struct was rectified to '1944'. However, the
> name of mode struct is still reflecting to '1940'. Update it.
> 
> Signed-off-by: Umang Jain <umang.jain@ideasonboard.com>
> ---
>  drivers/media/i2c/imx335.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/media/i2c/imx335.c b/drivers/media/i2c/imx335.c
> index 990d74214cc2..6c1e61b6696b 100644
> --- a/drivers/media/i2c/imx335.c
> +++ b/drivers/media/i2c/imx335.c
> @@ -252,7 +252,7 @@ static const int imx335_tpg_val[] = {
>  };
>  
>  /* Sensor mode registers */
> -static const struct cci_reg_sequence mode_2592x1940_regs[] = {
> +static const struct cci_reg_sequence mode_2592x1944_regs[] = {
>  	{ IMX335_REG_MODE_SELECT, IMX335_MODE_STANDBY },
>  	{ IMX335_REG_MASTER_MODE, 0x00 },
>  	{ IMX335_REG_WINMODE, 0x04 },
> @@ -416,8 +416,8 @@ static const struct imx335_mode supported_mode = {
>  	.vblank_max = 133060,
>  	.pclk = 396000000,
>  	.reg_list = {
> -		.num_of_regs = ARRAY_SIZE(mode_2592x1940_regs),
> -		.regs = mode_2592x1940_regs,
> +		.num_of_regs = ARRAY_SIZE(mode_2592x1944_regs),
> +		.regs = mode_2592x1944_regs,
>  	},
>  };
>  
> -- 
> 2.45.0
> 
> 

Looks good to me.
Reviewed-by: Tommaso Merciai <tomm.merciai@gmail.com>

Thanks & Regards,
Tommaso

