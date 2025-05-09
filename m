Return-Path: <linux-media+bounces-32084-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 78F47AB0D08
	for <lists+linux-media@lfdr.de>; Fri,  9 May 2025 10:22:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BEDFE1C07383
	for <lists+linux-media@lfdr.de>; Fri,  9 May 2025 08:21:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4CF8D270567;
	Fri,  9 May 2025 08:20:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="OgupxZwR"
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2601912C470
	for <linux-media@vger.kernel.org>; Fri,  9 May 2025 08:20:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746778858; cv=none; b=UTKH47PYAqcoV2UImOf+fu+2aNXwGuMDcHHisFQU04R1Agj61RSYwfoNQpeLTZsY74OqnkE/1hwCLMphhJ9AwU+cPbPOgB2zk5GRoWd2m7sYUogg/UX5IpDvoo6LE29rbUGoJXduv+9kO652gxzbQbtEmD8Nu8OBcmuf/5Rk9KA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746778858; c=relaxed/simple;
	bh=BM1+zV0Ilk6kUtc07FBzZLymiDW/JwThzX1brJ84YUE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Rs2qsoBNbEsR+s16InEOFF0Y8Ru7xNj3a0lYU32ike3omie/J/cgqnX0jDdmuIv1wYsB+unQ3sFGO8Uq8I7tUqu1SQ3sUhqzm6TapK3C7vkdNJV1uIBsNKDhamZCXK/ExZVE9ovh8ghDFyRJUSm/txiXfmDD/Zs2UTCrvY70YqE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=OgupxZwR; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1746778855;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=isreZ2c1ZlZZg3aE/qa+sh0f6nWEpdywiTI6MuOucsE=;
	b=OgupxZwRMUfUwV7GK+Y755zDpqlnyLNcZFIKvzSE7fC0a8GyCHANXZKcfjjW5HJrGeoTnY
	8XDFUABY5KSXSgDrdP2w1WLmKrr3vMXDPJ/KcOw47W9LRAJ9Ag7L6m8ZHyNBuwWx23qu1k
	MgKZrwXbh98NfG1ArEgxVD3OryVfWYY=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-222-cdl_EfMQOTWQfsklHRbB_Q-1; Fri, 09 May 2025 04:20:53 -0400
X-MC-Unique: cdl_EfMQOTWQfsklHRbB_Q-1
X-Mimecast-MFC-AGG-ID: cdl_EfMQOTWQfsklHRbB_Q_1746778852
Received: by mail-ej1-f70.google.com with SMTP id a640c23a62f3a-acb61452b27so207288366b.2
        for <linux-media@vger.kernel.org>; Fri, 09 May 2025 01:20:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746778852; x=1747383652;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=isreZ2c1ZlZZg3aE/qa+sh0f6nWEpdywiTI6MuOucsE=;
        b=ZvOh8TuOYJ/x5/mmpbynjR57ajgFR9biRE9JUjO5FkVmSBK8gIIgUasGwpyVV2fYgK
         cqD5pzQMpvkZTWkLJ68ypqwFry/A2J25N7jaePpR55B2c9gqXKKe+xwoa4S8waYYu2aM
         d+sAnu570BCBLXCsZmRWxayrXfj5a8wYVvlVa1LIpuNunjSieMVymY4Ix9Kjfc/1Ss6Q
         oLtrBcUnPVgRBkvR3npfSAnYykorjgFuar+PxyC9ODUxeuGEVy8Hwf0TrQHSwqJqFJ6y
         /E1xHG0jCqL1/AQKNP2aakCMrXqOod6xma8fna7TBAlroACk9bz561xrWdi9Guaqjzku
         budA==
X-Forwarded-Encrypted: i=1; AJvYcCXXRbcD5ZOxB+ELLcTTNs58soLPqU4iW1rW2skqtpungHoON6ZXby2LnvJh3SSA8nT2meiVyDGOonrNNw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwRf38Gw7mFX56M3EuSZQtbP00QKR0xMhhODxtr6Oe30nons6a9
	tzVtbV1fRN4RLJamoLWOZDOEcqLCq12LtipsAb0uaVkH1NcmHU1h1MuDt16uY1iPMtoFIvY/B0V
	oonxYUP8q1FCspiEN85HVqbFSxFCQmRaK7qoTlgbONdzXhLxGN/v93PGxNBpt
X-Gm-Gg: ASbGncswR0mXeQwfUHrtdl5KjRpYL4dIqNPoYQwH9vB1CS5Rc7SKMBhryELezwH17V0
	8ZNCMFTlEl3oTUr6NW3bIPTmdEmnmfw3VzGCrWtwGl//RH3lSnj+DNOy7YoGLdQjDANAE4lF7dY
	hQ2Sc3wy3R02MkTyVrqciS6HlRvXaJKoXN0GoEyxveBh8FlYcQRzzSRL3amlIdFQlMg4y+TuvXt
	z0LUHulC5eUPJJV2hdFXnFeYguPeIshHEIJSjIwNNjh1vDG4z45SE9RDbMJ84rrM1qO59KS30Fr
	X8yYasbNIfhLO+mjP8nrbPWxrSB1tIKqf7f34npvIN9Fj4WIv+0GAt8lnDoeO3itCwQy2eJCpnt
	XoK3aURBawELpjZYPUL63Wo3XIk5jJt0cQKetdL33UGGciuIjw+Ta8bpXk1IsTw==
X-Received: by 2002:a05:6402:440a:b0:5fb:fb49:9d0b with SMTP id 4fb4d7f45d1cf-5fca07eb66fmr1993124a12.26.1746778852259;
        Fri, 09 May 2025 01:20:52 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG6w4mRxr4r29BxFlTthKUIkL3hEK0Y1u615ISArHpCJjm/EiDIUSb3ZQlNu6FYJ28HhFwLSA==
X-Received: by 2002:a05:6402:440a:b0:5fb:fb49:9d0b with SMTP id 4fb4d7f45d1cf-5fca07eb66fmr1993113a12.26.1746778851868;
        Fri, 09 May 2025 01:20:51 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5fc9cbe4cb8sm1055578a12.2.2025.05.09.01.20.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 09 May 2025 01:20:51 -0700 (PDT)
Message-ID: <1f2545b6-1768-466a-8b56-43f9f368ddbe@redhat.com>
Date: Fri, 9 May 2025 10:20:50 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/1] media: ov02c10: Use div_u64 to divide a 64-bit number
To: Sakari Ailus <sakari.ailus@linux.intel.com>, linux-media@vger.kernel.org
Cc: hans@jjverkuil.nl, Hans de Goede <hansg@kernel.org>,
 Bryan O'Donoghue <bod@kernel.org>
References: <20250509062511.1092490-1-sakari.ailus@linux.intel.com>
Content-Language: en-US, nl
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20250509062511.1092490-1-sakari.ailus@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 9-May-25 8:25 AM, Sakari Ailus wrote:
> The ov02c10 driver divides a 64-bit number but reply relies on division
> operator to do that. Use div_u64() so this will compile everywhere.
> 
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>

I was just going to start working on fixing this myself, thank you,
patch looks good to me:

Reviewed-by: Hans de Goede <hdegoede@redhat.com>

Regards,

Hans




> ---
>  drivers/media/i2c/ov02c10.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/media/i2c/ov02c10.c b/drivers/media/i2c/ov02c10.c
> index 9e3d4a4e12ce..089a4fd9627c 100644
> --- a/drivers/media/i2c/ov02c10.c
> +++ b/drivers/media/i2c/ov02c10.c
> @@ -497,8 +497,8 @@ static int ov02c10_init_controls(struct ov02c10 *ov02c10)
>  		ov02c10->link_freq->flags |= V4L2_CTRL_FLAG_READ_ONLY;
>  
>  	/* MIPI lanes are DDR -> use link-freq * 2 */
> -	pixel_rate = link_freq_menu_items[ov02c10->link_freq_index] * 2 *
> -		     ov02c10->mipi_lanes / OV02C10_RGB_DEPTH;
> +	pixel_rate = div_u64(link_freq_menu_items[ov02c10->link_freq_index] *
> +			     2 * ov02c10->mipi_lanes, OV02C10_RGB_DEPTH);
>  
>  	ov02c10->pixel_rate = v4l2_ctrl_new_std(ctrl_hdlr, &ov02c10_ctrl_ops,
>  						V4L2_CID_PIXEL_RATE, 0,


