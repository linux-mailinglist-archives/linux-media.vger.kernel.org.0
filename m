Return-Path: <linux-media+bounces-8093-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C3F188FE10
	for <lists+linux-media@lfdr.de>; Thu, 28 Mar 2024 12:27:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8F6B21C21E23
	for <lists+linux-media@lfdr.de>; Thu, 28 Mar 2024 11:27:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E7F177E0E8;
	Thu, 28 Mar 2024 11:27:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="fbGs7q/9"
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 957C75F87C
	for <linux-media@vger.kernel.org>; Thu, 28 Mar 2024 11:27:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711625235; cv=none; b=jH8Vy99iUTTEggRHPFDOqPXGIwFTD7k/LZUEOTX6vTQIa7I1gnJWntGD63flUJOjYXRQK1OFU/6rt6X/4KeXefY+Li2JL8WjOEX76qjSPrPg/mXrDbQbyS3FaeNu7GlBkPmGq7BpxsvLk4jzmGOquS448ZblTmoOxXfz1ICmwD0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711625235; c=relaxed/simple;
	bh=44kiBZqFTaP5gPeydBqZrymI96x8lX3fKbCZJ9eSQBs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=A6G1Lxfzxw1/IAfxrMxeiKR47gLSOuagljtCMFQNT+CZzaEneZOxqO5PHl3OheRnZkR2Sqozt9BE6K/dI5AdOlPtZdOg/lbAxNzxrjYMH1OK5moH2VLZfx/EIHHYeIikHvoXNSR/cYYcAMLY1wXoDVWRDp0NNg0ErCrjvYGFPg8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=fbGs7q/9; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1711625232;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Pg0OITcJVy9yA5gEeGEy2hwLJsyzqBUNUFN2D0POo9U=;
	b=fbGs7q/9EMA31Hrl/b6vE3EuwDL64c139774rGgK6uW1E5CIO1/ZV8qXnJZE8mTCfv6plt
	Ujar8Ky4CCqi9KNpa+XsytA6u989d1FOYzmFH4LfrRQm+hxXwjelCCLA3LB67RYrRSY68Q
	EWQTbfxo1CvngzRFxTSXaN/kHQRu6mw=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-219-SXf1FfTrMkSFrknS_Ep_bA-1; Thu, 28 Mar 2024 07:27:11 -0400
X-MC-Unique: SXf1FfTrMkSFrknS_Ep_bA-1
Received: by mail-ej1-f72.google.com with SMTP id a640c23a62f3a-a4df17773a5so59990466b.1
        for <linux-media@vger.kernel.org>; Thu, 28 Mar 2024 04:27:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711625230; x=1712230030;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Pg0OITcJVy9yA5gEeGEy2hwLJsyzqBUNUFN2D0POo9U=;
        b=vGylZJe9T9ZHERTEBPj5OV0AYH+j6CTWxuvDvOw7RaIAGY4FJSs1kGurmZgclWwZbF
         iK2Zbigpry9c8LEOAtvV676O41s7K8eT63+3CuBOm+kQwdj7pjLe3KJ5iOORvRFgg7R0
         PlkTjT5reGGfcUWlYjldl6sj2gT46RLC2IOJ5Gwh13iT+i/Jxz3ChU7L5UsQP0DDjZBq
         zy2FPkuwwxapWZEEfKjQfsFoKu+tXsOpzrx8qr2VgqKesTkZQ7Gqw5iU2xH8mWrV0utj
         x4GM5aY1BF6e7ZvARpWd3JoSlKDIOJAY1C4UEcqlABM7zP1aqQoqEvrNyEpkQzTmU0dP
         Z3nw==
X-Forwarded-Encrypted: i=1; AJvYcCV6LfNXB4a244qJo2GQGqzfWY+i7FZ/BMkzBE2G+VOZFG4WUq10m3vR8zOqihu9LKoZvnmQLOLwO9JhuHoR+4soy8KsPnene1fsQnQ=
X-Gm-Message-State: AOJu0YziHOCLuE1g72VADijXxOP4G8lOiLYaRptAJbIKalv4rXJHztp5
	SzON6O+oK8g2dVWN4XOBYmtjddWwKL8P8P2T0paWoERF+JU9jBIjjCsYLAegyO980v2/lDJzUXG
	cFIpHjphTyt2dJeKzE01/nFOhMDsvAgqOV4k31oJoLNqpRdsoXEWaDFTaYxmA
X-Received: by 2002:a17:906:b118:b0:a47:3b21:161a with SMTP id u24-20020a170906b11800b00a473b21161amr1499075ejy.37.1711625229974;
        Thu, 28 Mar 2024 04:27:09 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG8+yWDz8vEt3NyruQyXCfPDZTfZs8dSVl8kpJKgx4lyEzbDOWqXngKqrAb8HGeKI4jWW/Nsw==
X-Received: by 2002:a17:906:b118:b0:a47:3b21:161a with SMTP id u24-20020a170906b11800b00a473b21161amr1499065ejy.37.1711625229592;
        Thu, 28 Mar 2024 04:27:09 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id x16-20020a170906135000b00a46ee3c31afsm631877ejb.154.2024.03.28.04.27.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 28 Mar 2024 04:27:09 -0700 (PDT)
Message-ID: <dbba19b3-0ca2-47a3-ac6c-58872da87f66@redhat.com>
Date: Thu, 28 Mar 2024 12:27:08 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] media: ov2680: Report success on link-frequency match
To: Fabio Estevam <festevam@gmail.com>, sakari.ailus@linux.intel.com
Cc: rmfrfs@gmail.com, hansg@kernel.org, linux-media@vger.kernel.org,
 laurent.pinchart@ideasonboard.com, Fabio Estevam <festevam@denx.de>
References: <20240328051320.2428125-1-festevam@gmail.com>
 <20240328051320.2428125-2-festevam@gmail.com>
Content-Language: en-US, nl
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20240328051320.2428125-2-festevam@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Fabio,

On 3/28/24 6:13 AM, Fabio Estevam wrote:
> From: Fabio Estevam <festevam@denx.de>
> 
> When passing the correct 'link-frequencies' in the DT, the
> driver should report success on the match case:
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
> However, this does not happen and the probe fails like this:
> 
> ov2680 1-0036: probe with driver ov2680 failed with error -22
> 
> Fix it by returning success upon link-frequency match.
> 
> Also tested passing a wrong link-frequencies value in th DT and
> confirmed that the driver correctly rejects it.
> 
> Fixes: 63b0cd30b78e ("media: ov2680: Add bus-cfg / endpoint property verification")
> Signed-off-by: Fabio Estevam <festevam@denx.de>
> ---
>  drivers/media/i2c/ov2680.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/media/i2c/ov2680.c b/drivers/media/i2c/ov2680.c
> index f611ce3a749c..37c21749dc14 100644
> --- a/drivers/media/i2c/ov2680.c
> +++ b/drivers/media/i2c/ov2680.c
> @@ -1128,7 +1128,7 @@ static int ov2680_parse_dt(struct ov2680_dev *sensor)
>  
>  	for (i = 0; i < bus_cfg.nr_of_link_frequencies; i++)
>  		if (bus_cfg.link_frequencies[i] == sensor->link_freq[0])
> -			break;
> +			return 0;

If you need this then that suggests that bus_cfg.nr_of_link_frequencies != 0
otherwise this patch will not make a difference. So that suggests that
patch 1/2 is not necessary ?

And if bus_cfg.nr_of_link_frequencies != 0 and we break then:

>  
>  	if (bus_cfg.nr_of_link_frequencies == 0 ||
>  	    bus_cfg.nr_of_link_frequencies == i) {

This will never be true (neither condition is true) so we will continue
with a clean exit of the function. Except that that clean exit
does "return ret" and I see there may some paths where that is not 0
even though we are doing a clean exit.

I think that what is necessary for your case with fixed dts file is:

diff --git a/drivers/media/i2c/ov2680.c b/drivers/media/i2c/ov2680.c
index bcd031882a37..5c789b5a4bfb 100644
--- a/drivers/media/i2c/ov2680.c
+++ b/drivers/media/i2c/ov2680.c
@@ -1179,6 +1179,8 @@ static int ov2680_parse_dt(struct ov2680_dev *sensor)
 		goto out_free_bus_cfg;
 	}
 
+	ret = 0;
+
 out_free_bus_cfg:
 	v4l2_fwnode_endpoint_free(&bus_cfg);
 	return ret;

and that then replaces both your patches, can you give this a try ?

Regards,

Hans


p.s.

Your early return 0 in this patch also leaks the bus_cfg.



