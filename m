Return-Path: <linux-media+bounces-19966-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F42A9A5C6C
	for <lists+linux-media@lfdr.de>; Mon, 21 Oct 2024 09:17:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7F18C1C21BB4
	for <lists+linux-media@lfdr.de>; Mon, 21 Oct 2024 07:17:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CEDFC1D14E5;
	Mon, 21 Oct 2024 07:16:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cAoWKM4f"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 433561CF5E0;
	Mon, 21 Oct 2024 07:16:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729495018; cv=none; b=ExdEV32aGowEhl7Iprjhnf50kB0IW7+lYywygBG7vMVV7rYLNzuLYbOkzCzeEuNBeldtLvrImenQfw1bIKyB3BvVFsLq5vkrWX9d8HQBbMHZ9fHwuNUBVaG3oSLEjvNl17iPKd2l4LrJmTtecBu0+nE5sSGwCaOdXNTDORbQPyE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729495018; c=relaxed/simple;
	bh=xCyoWaLU81vOfCP4OIoPVPC3LdTR5f+9uwMxu666v+k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Hjn1e60W60Itijs8gAjZBV2LNpBn/ks8RhmL83CcM9jjPS50a24FfJhLVvziTEnsRk7oiBFef8dqCmpBcRR7Ru29pD+7wW8D8s6qlT2xqg7ILeLXTuldhK08IkCWForfV4HqeLeOxAJiDSihivsdQ78Kbz5RCabxtq68wr3Z9i0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cAoWKM4f; arc=none smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-5cb15b84544so1558265a12.2;
        Mon, 21 Oct 2024 00:16:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729495014; x=1730099814; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=JJj4G5/EKvTSyQRauSEPmLSCKD5A3cq9wZquVufYhRg=;
        b=cAoWKM4f/sQArf03S6/v79C294K93/d8F/oOKoDAS3Bj9b+USRSuJytbV0OE5PJTfU
         ClcCP8piQbdQnPrXmaeJH/r0sG3a8LjnhCBWtFrtISDfqCZmZ5KDTcW0Kmho2hkLKl7x
         Oglgy5tIoqkfjOupcHIjy5vS+zaplDpZpWYjUSuR0q59NNTgycfs2rCeVx4sY1cUNJn/
         n35167HXCJZhHIQ7jpzfcOXO30Nd+hdF5jXpj4f3oJR7D8idZNYY5BWoQD/jkwlABRI3
         g8QJZ/SBEQ1WhUMfsKoYaAkTrrT8x9KFi6+FAHBpSZDk0MEXixhT4Go0T5ww81y9kJU+
         zsRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729495014; x=1730099814;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JJj4G5/EKvTSyQRauSEPmLSCKD5A3cq9wZquVufYhRg=;
        b=enJw4mCf1M572V6BYQ7IpeCfT4kknjGn0Nzb4u9PVAEllyzcOav/LfFjAqwRuZjwaH
         IwHBUYFvUVoTLLUDkgaKqTn07+/0nzaze90hAWLGoCXy2L+XhDKwbm59ORdRcnwQs+yk
         NGHtR6QghHiw7/rJFC0aI9DlXJeZo/vRfuzN2Lrh5wqubz1YxRI86kh5VBo9l0hkgm3d
         JBnrm7lQ1v6S6F+8AXy9+AyE2PWKBBu+YiKuzz1mZIaU4xXZ0tiK8XdAxGF9vJgZeTFB
         7JWtMo0P7dhYyR2Ob9euIODaJ0pUd5MxAaMWrgzpQho/54DsEZ+GYO6nR7lwWz/SWdbA
         lJ4A==
X-Forwarded-Encrypted: i=1; AJvYcCV3LS1YAlWW+8Wnh4Q2kjB4uGgCrfr5RG30hIhPOJSgTJGVPXZ9jPayqZ5iJ5uvPFQbwydaurEdUGl1CSM=@vger.kernel.org, AJvYcCWidO7IFlFpUO+ImGMym4nyKlPoyzodSQuAo//De72aPEvmk4TLEcVSKvLUtkHCc2UIsElfZCIliogMUPA=@vger.kernel.org, AJvYcCX0x6axa5MYsYkRNi78XpeRi3gBJdvBRRfN2ZyqsytjGxHEWQzK9+HZ27vgTEvUSxxPT2i7kW2wT9CqRv5oqGtNtJk=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx317iML7H1T9G2pM5lYNBZQzz0gdqi9G3CkYV334aTD1nBuRVD
	m0tPqzAygfoy15/kmVVBws1iCfLNSRagL53T+3rVo2DaG5TaiMHv
X-Google-Smtp-Source: AGHT+IFwxnvCeZMsWBbxvjLa/0N3yW930DRY0OP76c4vln7t3sigu4eT3LuuDVP2FhQG7AWlm3wBhQ==
X-Received: by 2002:a05:6402:34d5:b0:5cb:6792:8e44 with SMTP id 4fb4d7f45d1cf-5cb67928e73mr3156110a12.36.1729495014306;
        Mon, 21 Oct 2024 00:16:54 -0700 (PDT)
Received: from tom-HP-ZBook-Fury-15-G7-Mobile-Workstation (net-188-217-51-176.cust.vodafonedsl.it. [188.217.51.176])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5cb6696b53bsm1602149a12.17.2024.10.21.00.16.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Oct 2024 00:16:53 -0700 (PDT)
Date: Mon, 21 Oct 2024 09:16:51 +0200
From: Tommaso Merciai <tomm.merciai@gmail.com>
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: Re: [PATCH v3 02/10] media: i2c: ov5645: Use local `dev` pointer for
 subdev device assignment
Message-ID: <ZxX/4+rOjqao1hB1@tom-HP-ZBook-Fury-15-G7-Mobile-Workstation>
References: <20241018153230.235647-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20241018153230.235647-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241018153230.235647-3-prabhakar.mahadev-lad.rj@bp.renesas.com>

Hi Prabhakar,

On Fri, Oct 18, 2024 at 04:32:22PM +0100, Prabhakar wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> 
> While assigning the subdev device pointer, use the local `dev` pointer
> which is already extracted from the `i2c_client` pointer.
> 
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> ---
>  drivers/media/i2c/ov5645.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/media/i2c/ov5645.c b/drivers/media/i2c/ov5645.c
> index bcbf3239d3ea..d344d3447a95 100644
> --- a/drivers/media/i2c/ov5645.c
> +++ b/drivers/media/i2c/ov5645.c
> @@ -1188,7 +1188,7 @@ static int ov5645_probe(struct i2c_client *client)
>  	ov5645->sd.flags |= V4L2_SUBDEV_FL_HAS_DEVNODE |
>  			    V4L2_SUBDEV_FL_HAS_EVENTS;
>  	ov5645->pad.flags = MEDIA_PAD_FL_SOURCE;
> -	ov5645->sd.dev = &client->dev;
> +	ov5645->sd.dev = dev;
>  	ov5645->sd.entity.function = MEDIA_ENT_F_CAM_SENSOR;
>  
>  	ret = media_entity_pads_init(&ov5645->sd.entity, 1, &ov5645->pad);
> -- 
> 2.43.0
> 
> 

Looks good to me.

Reviewed-by: Tommaso Merciai <tomm.merciai@gmail.com>
Tested-by: Tommaso Merciai <tomm.merciai@gmail.com>

Thanks & Regards,
Tommaso


