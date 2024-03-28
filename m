Return-Path: <linux-media+bounces-8105-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id EA2B58902A9
	for <lists+linux-media@lfdr.de>; Thu, 28 Mar 2024 16:09:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A15D928E1C4
	for <lists+linux-media@lfdr.de>; Thu, 28 Mar 2024 15:09:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E037F12EBED;
	Thu, 28 Mar 2024 15:09:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Q9XOG6h4"
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA547823C8
	for <linux-media@vger.kernel.org>; Thu, 28 Mar 2024 15:09:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711638542; cv=none; b=tWMzKJpLuDelQr+FCg22WLEhbBSLjRXEP6jmdVrqVaiRW1dz4V+wD/S7n0TcjIAyJNsmqRuZnp9DbNkoSC8xWRTrpHs6/Ma8UIVim1BdZu2bSlJhwzLW3v+KJbEcnNdQscAloDzkIDV9zFY7CaacFoial1Ce6x/nTdzZ024anVQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711638542; c=relaxed/simple;
	bh=MJjNKJHOjyXQEhxmtw95z+KdJ3i3xDYWsBDk0pLDFn0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=a/ukvxWLO0ZBPalIf886AlBJJ+L74epLXhZdzPsi8i3+3zzrDX5T7a1cvz13gw0zPekMqSHSqiYO2BnIcIqU8vaGZAYn46cslKGwHm5XYHYf1HAWepcD8GEnOPqTyCENThJITrO0KGI9RWRTLinKOlCjC2PRXXn69Nd0DRQ+E8Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Q9XOG6h4; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1711638539;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+mSa1UH5ZKNr2vj44ux4HGmes84oVNKmwJwueXqJQ4U=;
	b=Q9XOG6h4LytkOCyiLpnEO264RcemwbaBfbnROAM/MPtlmXnzl7JaOvvCCeGVNtL1dbL9CV
	VJNqF4oG9USubkiXAl6RRyRrTfBFEsnRSkLzeVtZzsL8+XwiYif24r//f9TaL2s6F3koWt
	nhpmhdlTg2BCziGRkIeK0NRgW6sxDtw=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-447-KytAqSsVPUm5ZqilEI6njw-1; Thu, 28 Mar 2024 11:08:56 -0400
X-MC-Unique: KytAqSsVPUm5ZqilEI6njw-1
Received: by mail-ej1-f70.google.com with SMTP id a640c23a62f3a-a46ba1a19fdso79923966b.1
        for <linux-media@vger.kernel.org>; Thu, 28 Mar 2024 08:08:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711638535; x=1712243335;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+mSa1UH5ZKNr2vj44ux4HGmes84oVNKmwJwueXqJQ4U=;
        b=bPSBrC9dU6KGoxpuISac7e3XeOtoSBbfGSLGYZE+e/g9pCl4hxa+KCpTLCrp9R9Z9B
         VjUd+5ztm75ljNZuqHSC82i3orJknYJv6tTer6r+uxPwCjFDkC+mpwVkj/bhdSh6JqOI
         ldcPlL6yf/XoFl3EuDw9BM90GSqkA9k90tKCQH6ctZ2kxr8XkEGaKEuIut/3GF6zZF34
         yiTYuIMTy8jaSg1Da7j6rrCqzL9qwXLvCMCnRgd3V3lAq2O8Mq08yqfDYOC4BUi6W/Dj
         IJIesePwZnT12RgBCgErXF/2v/SS2yVIjzdMS6KNXzTNKOlsLx7dqsOHX6oEyfwrTenK
         DwKg==
X-Forwarded-Encrypted: i=1; AJvYcCUc2ifblvwKQ0TUYiM0O0RpOH1VrrEAFvUEp5vy1eyPPHWv0j1rRhRNfdidBMXy2SRdccZzFeRmSa70lr03R7IhvoGmALOyAAPje2g=
X-Gm-Message-State: AOJu0YxL8UiIM+t40kk2KWxiTLqMllU4CPrbJS7eETrEDNL/NaD0LXYS
	AYmC1k0YYMa6IkUewZTHeXENBMp2gFaOtHAkJjF/+2mggpSKFCjTJnezRm+FN7Eqwpdl0uOVkPI
	yPl4cn8j1giPFqJ5ZYhhLpSNu5LKNa7d0nFdoB3+tiv5QPWzs2LYtBzURovdx
X-Received: by 2002:a17:906:4892:b0:a46:1e:d199 with SMTP id v18-20020a170906489200b00a46001ed199mr1956520ejq.39.1711638535052;
        Thu, 28 Mar 2024 08:08:55 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFmoRnXa/JwIx9zBLHhHcHVuXLVxEg2Lqq6CX5yBHRgZ9vkobqCqz2BC79Zlbht5nZYPQLa4A==
X-Received: by 2002:a17:906:4892:b0:a46:1e:d199 with SMTP id v18-20020a170906489200b00a46001ed199mr1956503ejq.39.1711638534707;
        Thu, 28 Mar 2024 08:08:54 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id bu13-20020a170906a14d00b00a46aba003eesm840957ejb.215.2024.03.28.08.08.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 28 Mar 2024 08:08:54 -0700 (PDT)
Message-ID: <04bdb05b-6054-4c6e-bbb1-7dc6898352cb@redhat.com>
Date: Thu, 28 Mar 2024 16:08:53 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] media: ov2680: Clear the 'ret' variable on success
Content-Language: en-US, nl
To: Fabio Estevam <festevam@gmail.com>, sakari.ailus@linux.intel.com
Cc: rmfrfs@gmail.com, hansg@kernel.org, linux-media@vger.kernel.org,
 Fabio Estevam <festevam@denx.de>, stable@vger.kernel.org
References: <20240328145841.2514534-1-festevam@gmail.com>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20240328145841.2514534-1-festevam@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 3/28/24 3:58 PM, Fabio Estevam wrote:
> From: Fabio Estevam <festevam@denx.de>
> 
> Since commit 63b0cd30b78e ("media: ov2680: Add bus-cfg / endpoint
> property verification") even when the correct 'link-frequencies'
> property is passed in the devicetree, the driver fails to probe:
> 
> ov2680 1-0036: probe with driver ov2680 failed with error -22
> 
> The reason is that the variable 'ret' may contain the -EINVAL value
> from a previous assignment:
> 
> ret = fwnode_property_read_u32(dev_fwnode(dev), "clock-frequency",
> 			       &rate);
> 
> Fix the problem by clearing 'ret' on the successful path.
> 
> Tested on imx7s-warp board with the following devicetree:
> 
> port {
> 	ov2680_to_mipi: endpoint {
> 		remote-endpoint = <&mipi_from_sensor>;
> 		clock-lanes = <0>;
> 		data-lanes = <1>;
> 		link-frequencies = /bits/ 64 <330000000>;
> 	};
> };
> 
> Cc: stable@vger.kernel.org
> Fixes: 63b0cd30b78e ("media: ov2680: Add bus-cfg / endpoint property verification")
> Suggested-by: Hans de Goede <hdegoede@redhat.com>
> Signed-off-by: Fabio Estevam <festevam@denx.de>

Thanks, patch looks good to me:

Reviewed-by: Hans de Goede <hdegoede@redhat.com>

Regards,

Hans




> ---
> Changes since v1:
> - Use Hans' suggestion to clear 'ret'.
> 
>  drivers/media/i2c/ov2680.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/media/i2c/ov2680.c b/drivers/media/i2c/ov2680.c
> index 39d321e2b7f9..3e3b7c2b492c 100644
> --- a/drivers/media/i2c/ov2680.c
> +++ b/drivers/media/i2c/ov2680.c
> @@ -1135,6 +1135,7 @@ static int ov2680_parse_dt(struct ov2680_dev *sensor)
>  		goto out_free_bus_cfg;
>  	}
>  
> +	ret = 0;
>  out_free_bus_cfg:
>  	v4l2_fwnode_endpoint_free(&bus_cfg);
>  	return ret;


