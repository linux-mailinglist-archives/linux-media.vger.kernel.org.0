Return-Path: <linux-media+bounces-9315-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E7CF8A4A83
	for <lists+linux-media@lfdr.de>; Mon, 15 Apr 2024 10:39:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 10A281F21DFA
	for <lists+linux-media@lfdr.de>; Mon, 15 Apr 2024 08:39:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9F00A38389;
	Mon, 15 Apr 2024 08:38:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="PDDU5KxY"
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3EE13770C
	for <linux-media@vger.kernel.org>; Mon, 15 Apr 2024 08:38:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713170336; cv=none; b=LITYPTZ2sGdqfDUO1A1TC0aLld9SzYBb68E+sD8bhU15tP76/ptc50e0sl5/LAYNFYjPzNV18dLVUNIJbYTk8ZbzFYdYgyRQVFj2IbX3f1Z8BJmHIj3R5ddR/IcRhFNwcwg7lkUQY5gHyI5MLRleyrxVK6qr+S7vyeUwMHEemqY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713170336; c=relaxed/simple;
	bh=HmRSd7TrneWuEKtzXSS+OumcM2wLYoH6cd/oJd9CbHo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=L8CxRzvBB1lqdjFtVFMpxE37L0j0AujleUxG/z0pqQrmXS6k1H4v3v7J+P9XvVQfZwFxFlObZOF0Ux8uPBTp+wxctmWAQAjaX7GPl1OzARShwE7PkudyKgUJm0Guc2vc7yPamTlVGrrKfG7r708bywU70lyPloO5EQh82mFKcms=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=PDDU5KxY; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1713170333;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=uK9jY+IvCTYi7p32Yh9arKaEfEe9PXdv+HTzfetQiII=;
	b=PDDU5KxYD3vUZp63o39FXJ5vZ8nfCZRXdOyUJyjT6cX7EMhc+duF6lnZw+RNDByE/X4oKp
	x05A+oUnZHAd+5/a85K2b6oBAisNsPO5CNt1PHTrjJjmoV0rB/NvQc8pF8EuHUjTPclJN9
	f39KMSvJOE5Lnqw3QjODw8rVOM5BJl4=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-537-QHknERcXMaGJ4Bw_fjL-Ow-1; Mon, 15 Apr 2024 04:38:52 -0400
X-MC-Unique: QHknERcXMaGJ4Bw_fjL-Ow-1
Received: by mail-ej1-f71.google.com with SMTP id a640c23a62f3a-a5193fab7e5so186988966b.3
        for <linux-media@vger.kernel.org>; Mon, 15 Apr 2024 01:38:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713170331; x=1713775131;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=uK9jY+IvCTYi7p32Yh9arKaEfEe9PXdv+HTzfetQiII=;
        b=LtN/EtL7o2hIMdkBXTeOFrXuhiD5fl7hDczRF/vIg2fwmkQacc90724Lmn5th9vhQx
         nD4la/MV5ZeeBifXuYCLgqhLtnDuqn4XTERMyUUn4RJMxnUgjS6qRcGLd/USptuCmfmb
         jxSCVuaCg3bAPf+OkssnVNq87bNQEeSGOEBl1lQDLUkjDjoRaBcEh0jRmtXDsvnvOlef
         j+CbgdTa2346/A1XIlAXtqQasnlLKKK5P6Da7vf4oOhpfPy5hZuAY6Ucg/4OvyIMRU5L
         qIvACN+G+vGVDo8kabR9t7Xv5e0AdB48h3LWsG/QrIipDD+txQeuhxmzGXwQ1QfcK1NN
         828A==
X-Forwarded-Encrypted: i=1; AJvYcCVGphNZlrofH38C5umFl8rA3qRswEdCOSDsshJVUWpQaDHnvjJkCOnRNW4292UmgJnuvS37YcrJtJDLm82ZxWfOerhMsT4oEfztv9M=
X-Gm-Message-State: AOJu0YyLvkKcOg6oyhJCY0N9kRVaBAOpPDySFr9ccp8xfD0c945FIoAR
	dGf2i5P9VSwzbK5W+DCpT3QwuqM/CKGKiOZhoZb7ph6qxSczcpiHxnzp/goBe6ZniKolh8V/iXA
	lRcDMsXS5jLi7QRGb5IZV54RTO3F7DiQEbAP0Y8uMxpezMG3SuKCGNvROD8vB
X-Received: by 2002:a17:906:f590:b0:a52:4b3c:823d with SMTP id cm16-20020a170906f59000b00a524b3c823dmr4202191ejd.46.1713170331025;
        Mon, 15 Apr 2024 01:38:51 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEDAOGTwT06qK+gb3s/8oekbtkte2XpJxSTwRfRdWdOHoDqQol2feHZ/XBkHpVj7rITcmbP7g==
X-Received: by 2002:a17:906:f590:b0:a52:4b3c:823d with SMTP id cm16-20020a170906f59000b00a524b3c823dmr4202170ejd.46.1713170330640;
        Mon, 15 Apr 2024 01:38:50 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id bb2-20020a1709070a0200b00a520e463227sm5189996ejc.127.2024.04.15.01.38.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 15 Apr 2024 01:38:50 -0700 (PDT)
Message-ID: <647e08ad-0b08-4c0e-bbe3-78c55bf1e128@redhat.com>
Date: Mon, 15 Apr 2024 10:38:49 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] media: ov2680: Do not fail if data-lanes property is
 absent
To: Fabio Estevam <festevam@gmail.com>, sakari.ailus@linux.intel.com
Cc: rmfrfs@gmail.com, hansg@kernel.org, linux-media@vger.kernel.org,
 laurent.pinchart@ideasonboard.com, Fabio Estevam <festevam@denx.de>
References: <20240414210906.3497879-1-festevam@gmail.com>
Content-Language: en-US, nl
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20240414210906.3497879-1-festevam@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi.

On 4/14/24 11:09 PM, Fabio Estevam wrote:
> From: Fabio Estevam <festevam@denx.de>
> 
> Since commit 63b0cd30b78e ("media: ov2680: Add bus-cfg / endpoint
> property verification") the ov2680 driver no longer probes when the
> 'data-lanes' property is absent.
> 
> The OV2680 sensor has only one data lane, so there is no need for
> describing it the devicetree.
> 
> Remove the unnecessary data-lanes property check. 
> 
> Suggested-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> Fixes: 63b0cd30b78e ("media: ov2680: Add bus-cfg / endpoint property verification")
> Signed-off-by: Fabio Estevam <festevam@denx.de>

Thanks, patch looks good to me:

Reviewed-by: Hans de Goede <hdegoede@redhat.com>

Regards,

Hans



> ---
>  drivers/media/i2c/ov2680.c | 7 -------
>  1 file changed, 7 deletions(-)
> 
> diff --git a/drivers/media/i2c/ov2680.c b/drivers/media/i2c/ov2680.c
> index a857763c7984..4577a8977c85 100644
> --- a/drivers/media/i2c/ov2680.c
> +++ b/drivers/media/i2c/ov2680.c
> @@ -1116,13 +1116,6 @@ static int ov2680_parse_dt(struct ov2680_dev *sensor)
>  	sensor->pixel_rate = sensor->link_freq[0] * 2;
>  	do_div(sensor->pixel_rate, 10);
>  
> -	/* Verify bus cfg */
> -	if (bus_cfg.bus.mipi_csi2.num_data_lanes != 1) {
> -		ret = dev_err_probe(dev, -EINVAL,
> -				    "only a 1-lane CSI2 config is supported");
> -		goto out_free_bus_cfg;
> -	}
> -
>  	if (!bus_cfg.nr_of_link_frequencies) {
>  		dev_warn(dev, "Consider passing 'link-frequencies' in DT\n");
>  		goto skip_link_freq_validation;


