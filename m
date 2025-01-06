Return-Path: <linux-media+bounces-24261-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E604A020A9
	for <lists+linux-media@lfdr.de>; Mon,  6 Jan 2025 09:29:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C294F1883C23
	for <lists+linux-media@lfdr.de>; Mon,  6 Jan 2025 08:29:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6A16F1D7E31;
	Mon,  6 Jan 2025 08:29:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="y1F7NlJ9"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24E8A2BAEC
	for <linux-media@vger.kernel.org>; Mon,  6 Jan 2025 08:29:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736152142; cv=none; b=oxTgriqeZG85Mjueh+a9DO0WQxEgC89e4llSASD0WiMd6UG+Td7rWt2sCBHgbpAqVw48SCDmslBJRKIa7BpaUq+nP5743QpzRSZJpV4cJO6Joq8aFjSP3ZMnDABc7+lfWmvgY7Oew+PG4vRi9bjUCkbU+G7j6fDGRdR8JLcdfXs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736152142; c=relaxed/simple;
	bh=M5hUhat/bAuUMc8q55/KJv/JnbBudv+hp3ctOvU0WHw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DseFl6c+gQJLIlCr1x9Wd60YpwXSwM5T4yP0SEzXxpcacZfXnVzG5kLIh3KN7XhMoGJb87+JLVT7oPHS6shCNm9Mil6ZUNpDdFAmYgGdOOTXKh1UgEw84VRaqnruGbQmQ1QNhQu5kt5bBdKezEpz7pqbcecexHCPPnR2/1rRMKY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=y1F7NlJ9; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4361815b96cso93274495e9.1
        for <linux-media@vger.kernel.org>; Mon, 06 Jan 2025 00:29:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736152139; x=1736756939; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=UDxsIOaiaJxaktdlNg4I9YAwK+RVYjasmpkTXj+LKDM=;
        b=y1F7NlJ9eAf1JnvtYYiRCDZg/xQTNaoT1KgNbLVk7goZvX2x5WNsng4KCyqX/0Ya/l
         AK5KoQZB65lgyXX0lWjz9nHP1RtcJtrT9vNFqqVjw5bk2xoJ/FuB/Qya11ElFJHYtIHi
         GuRh5jGWMqkyqF0WAgwDJL2xCLfsQU7ZLdFdqZ9RSmHcTAGJ4SERnQ6ofIGpJJsZsTGW
         ovSQ46AxKzwKBQIYIrXvWWf78h72uBThdHSS4tBzt9Ey9RQdnLVQUxVy6vXrbwBAodhM
         10G45phYmfajxoDvTdInTGXPd8Q4nKIKcIdeSfdnXpW9iEo8AYB3HwLCBICTNByvZtpL
         +WNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736152139; x=1736756939;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UDxsIOaiaJxaktdlNg4I9YAwK+RVYjasmpkTXj+LKDM=;
        b=KO0Sh7+88PFe8gKrK/PoApiuNG7FxHskKbAA4A4B+05UPVj06FnxtLBlK/CJbyT/bi
         DeqkGofYN8Xvct14UKZvxp8dD8vD+MU8SrS48Fpm+UvhdnqSCo+yYKYoTP0WAFNgMoV3
         S5VqLbJGTuywa1HHCbvfHstO+ZDOwg15Yuo/BrZJd2a0HfZWzKIs9+smxZZghsUQQ7XV
         UMNPaBnNfpeWPE9g8QDNo8iJ1MUrUk3NJN6iYyisDArJV5gvZUWj0vfdqEsL4d7tZzb0
         HOfL9obG52dgCqxacbLAKEfapK+pDSo7z+wBecy62Pt+fX0658BNFNpF6u7Xj7NB86dD
         P9Ag==
X-Forwarded-Encrypted: i=1; AJvYcCWDLcrmdqUej0Sgynw4XwU1dE/JbBq6YJpA0mfwYO0wyjx2Ghs9VBYc6vY0NZMjSlYLVKWuayHJANu0bg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxpcsy0+36aQyVyxWzvEVbM2fkf+WwOrNCHSdgq+mOwSohDLda1
	BP7gvuPwgA4XALmuHhCMh8+NR1IAsozx4VmJRgxPVJs8f0hbJVKQ99cKIMc7SP0=
X-Gm-Gg: ASbGncvk7FCGDjLgzpmAE4txwJsn4Ijt4u6lYe70VTqlBlG4A8VQm5k5wKNrdNuw829
	MZo8ABlq+qCppUd0RTatWkEaOrW2DAC4jq2lLvustrCOSn8wu0ttufyPLjTP46b15jZbb7vH732
	DEDVOyCLRBO/sAz4nvhGAErJxPojjPK1jx7zulkR7/Lp+WPbLStIdg4WY8nWLP7BO5A0iv1SBA+
	umt6lAFZ6sA3h2dBmVxPhtXgMNAMSM+zUB7iL2Ymaiq1QUssfm4az0g0bIV/Q==
X-Google-Smtp-Source: AGHT+IHJZErPKbdmzIpBYh1QikYHGJ3nST5M+FNfn5aNkfTTsqIMFPTb13dTvpPJsfRjBNoKswvCsA==
X-Received: by 2002:a5d:6486:0:b0:386:5b2:a9d9 with SMTP id ffacd0b85a97d-38a22408e42mr55544487f8f.53.1736152139171;
        Mon, 06 Jan 2025 00:28:59 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38a1c848a47sm46737989f8f.62.2025.01.06.00.28.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jan 2025 00:28:58 -0800 (PST)
Date: Mon, 6 Jan 2025 11:28:55 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
Cc: Niklas =?iso-8859-1?Q?S=F6derlund?= <niklas.soderlund@ragnatech.se>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: Re: [PATCH 1/3] staging: media: max96712: fix typo
Message-ID: <2e9a2faa-29c2-413f-aaa9-c8f2dfced28f@stanley.mountain>
References: <20241219150644.64507-1-laurentiu.palcu@oss.nxp.com>
 <20241219150644.64507-2-laurentiu.palcu@oss.nxp.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241219150644.64507-2-laurentiu.palcu@oss.nxp.com>

On Thu, Dec 19, 2024 at 05:06:41PM +0200, Laurentiu Palcu wrote:
> Fix a typo in VS_LOW expression.
> 
> Signed-off-by: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
> ---
>  drivers/staging/media/max96712/max96712.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/staging/media/max96712/max96712.c b/drivers/staging/media/max96712/max96712.c
> index 0751b2e048958..5228f9ec60859 100644
> --- a/drivers/staging/media/max96712/max96712.c
> +++ b/drivers/staging/media/max96712/max96712.c
> @@ -182,7 +182,7 @@ static void max96712_pattern_enable(struct max96712_priv *priv, bool enable)
>  	max96712_write_bulk_value(priv, 0x1052, 0, 3);
>  	max96712_write_bulk_value(priv, 0x1055, v_sw * h_tot, 3);
>  	max96712_write_bulk_value(priv, 0x1058,
> -				  (v_active + v_fp + + v_bp) * h_tot, 3);
> +				  (v_active + v_fp + v_bp) * h_tot, 3);

Huh.  I had expected this would be a bug in some way, but it actually
works fine.  #MysteriesOfC

regards,
dan carpenter


