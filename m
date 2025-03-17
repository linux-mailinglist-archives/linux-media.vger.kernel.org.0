Return-Path: <linux-media+bounces-28344-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E5FEA64688
	for <lists+linux-media@lfdr.de>; Mon, 17 Mar 2025 10:05:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 70C0E1712B2
	for <lists+linux-media@lfdr.de>; Mon, 17 Mar 2025 09:05:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 44ED5221D9A;
	Mon, 17 Mar 2025 09:04:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="RmwK/Z/W"
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E66842206BA
	for <linux-media@vger.kernel.org>; Mon, 17 Mar 2025 09:04:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742202297; cv=none; b=Ip4qJdGz4JBp8gItAzB/JQfAxG+E4pWdL9i2zI6meB86HZzBQtEfSx1LLAAG8yPuXunArV9YPwCXqpRxXBbt7TO52HXv5NoHd7H4aEaBRpoGJ73lGWCzm/rsh5nPnF1h/KzYHm/Rbg2iKBT7yltp/sDn0bCl6xLicX4Lalsr7Gc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742202297; c=relaxed/simple;
	bh=05r/hUCU63UsH3457J7hzt32bAtzfzNcG98x63Sm74I=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rnJT3p0HmS1m61pWs6RPIvXvO/XnIeVzYbw7INocXdrVIqZrkqfLnTdsk6ZT+sd7uMp7g+4Tcpj1HM5AKnbJgo2C5eMrxr0QZ/C8gwl069InsZwkCmDCzQXa0yilmlULTDQU+PYeQL2y9MChJKoeJ1gm3nk4i6ulslVbhlpDqJw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=RmwK/Z/W; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1742202294;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=29vE6oaVEg14v+0pXwuE2t45Kpr7j22qUMLQirhD7Bg=;
	b=RmwK/Z/W1aXrsJx3Ylmpy5/Kmip/hJV+bkRFCEg2WjkVKJfQWOlNW55R3CNOQ4h0fWPPFV
	5kJzzT4qKbSTupLb/B6djgWvbL4iQf5vR/bjjb411MX3NsOdqOedC2U52S3cFBcv8eWW7z
	GXz4tkFeY84rnPDABIUPiQkIQEj2PaI=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-611-BkRa03SzM-GlJhpBwXed-w-1; Mon, 17 Mar 2025 05:04:53 -0400
X-MC-Unique: BkRa03SzM-GlJhpBwXed-w-1
X-Mimecast-MFC-AGG-ID: BkRa03SzM-GlJhpBwXed-w_1742202292
Received: by mail-ej1-f70.google.com with SMTP id a640c23a62f3a-ac2815aba51so307890066b.3
        for <linux-media@vger.kernel.org>; Mon, 17 Mar 2025 02:04:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742202292; x=1742807092;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=29vE6oaVEg14v+0pXwuE2t45Kpr7j22qUMLQirhD7Bg=;
        b=bfhXuUAGR20sBP/A+ZyevIHAYT++xJX+WDgm2VkoMDDo8r2IfBswRllHT07Dh1CB67
         q2o/HcRmYVP6F8pe7ntjvxG80rMW2QtuGWx57eLp1EsQqSGaTdMEgKiutgt1MPOKxnoI
         XX151IBx2ninZzAjLzzPutOd8zFePy3zY5fhiwkFeLPf6/zLEMXt6Pw5wlneSfPoh4U2
         6rgHNwo2h5x/Yxf6puG/v00+O7lTgOhkCGq8GPrAWb5ZV8w2B315a7TlklqKzA3MScho
         miAUOot9cN0a6QuzlZ0eXRu28VBiQsYyci++qTtrOKZtw6BM3JbYLUzxs8/SPIBrXxdi
         lwMA==
X-Forwarded-Encrypted: i=1; AJvYcCXhxI0wg8biZmQ/ptYUDCVvb3aaI3IiBZVoUzlsGn6y8Xpo9qnkQGWXecd447oEr0FeDXnBchKmAcWmjw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwH4H8b6BJOdlghgd/XrTFNbXJVdk1Qj7ANC4238f697ePepnij
	KqFxeSajJdzdsPQzOLn4saEpGet1pd1OgjHsbTVUXqB7DKNiLHHaABigihBhD2QM6bpMceMMT7K
	8J5fwIcbwOwEmnqjZakyW6uBI7DRnfK6XeIMENnGMIaAspWWmZqPuWBcg5m6E
X-Gm-Gg: ASbGncvsVb8bmUOSCggH0NwFjM4q4vq/ex2XF+IzHQRMz7MQyAzr80DthTSE2LNlYnD
	lZMNr26zuImNlkKEr1EV+Uv4dfjSt1DhcJKtXHV5e9DK3ecU4o14+nQIIu4jZPEwGalaFt25nSh
	VfP/blyRHAqdZuW9+fpvpPjxNNtDedJnfZMJbx2DusZHpU3IY8EGy/XX9du9MA0l25E9Y7WkHh0
	kPQIv6ptKuo2jg1qEL1o1cDGbgkOqpacegmgZiH+eYcKwGW4sSa5aYQsjlwHetdA9hGA19l+MrC
	G77T/fv1DiKmM66o5xo=
X-Received: by 2002:a17:907:7290:b0:abf:e7c1:b3bf with SMTP id a640c23a62f3a-ac3301e352amr1336402366b.11.1742202291901;
        Mon, 17 Mar 2025 02:04:51 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG+G5BfaNF92AjsKhcSSJIGr22ciY52oU2w94T7cj7w7uUFajbxZD3Z37SlZi7kKNz9ge2okw==
X-Received: by 2002:a17:907:7290:b0:abf:e7c1:b3bf with SMTP id a640c23a62f3a-ac3301e352amr1336400066b.11.1742202291505;
        Mon, 17 Mar 2025 02:04:51 -0700 (PDT)
Received: from [10.40.98.122] ([78.108.130.194])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac3149cf219sm626215966b.88.2025.03.17.02.04.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Mar 2025 02:04:51 -0700 (PDT)
Message-ID: <94bc2fef-1138-4252-9ad3-dd6e01d55290@redhat.com>
Date: Mon, 17 Mar 2025 10:04:50 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6/8] media: i2c: ov02e10: Implement specification t3 and
 t5 delays on power-up
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>
Cc: Jingjing Xiong <jingjing.xiong@intel.com>, Hao Yao <hao.yao@intel.com>,
 Jim Lai <jim.lai@intel.com>, You-Sheng Yang <vicamo.yang@canonical.com>,
 Alan Stern <stern@rowland.harvard.edu>, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org
References: <20250317-b4-media-comitters-next-25-03-13-ov02e10-v1-0-bd924634b889@linaro.org>
 <20250317-b4-media-comitters-next-25-03-13-ov02e10-v1-6-bd924634b889@linaro.org>
Content-Language: en-US, nl
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20250317-b4-media-comitters-next-25-03-13-ov02e10-v1-6-bd924634b889@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 17-Mar-25 01:39, Bryan O'Donoghue wrote:
> The ov02e10 specification says for power-on:
> 
> t3 = the time between dvdd stable and XSHUTDOWN deassert
> t5 = the time between XSHUTDOWN deassert and SCCB ready
> 
> The power-off path in the spec shows no required delays between XSHUTDONW
> and power-rail shut off so power-off is left alone.
> 
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> ---
>  drivers/media/i2c/ov02e10.c | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/media/i2c/ov02e10.c b/drivers/media/i2c/ov02e10.c
> index 9ad70671a718ea0aaf80ad3adcc5738ee57a7ff6..40c4d3ee36e3e2a0bb8be3ff10d016e2bb9bbc9d 100644
> --- a/drivers/media/i2c/ov02e10.c
> +++ b/drivers/media/i2c/ov02e10.c
> @@ -579,7 +579,11 @@ static int ov02e10_power_on(struct device *dev)
>  		goto disable_clk;
>  	}
>  
> -	gpiod_set_value_cansleep(ov02e10->reset, 0);
> +	if (ov02e10->reset) {
> +		usleep_range(5000, 5100);
> +		gpiod_set_value_cansleep(ov02e10->reset, 0);
> +		usleep_range(8000, 8100);
> +	}
>  
>  	return 0;
>  


Note ATM ov02e10->reset is requested with GPIOD_OUT_LOW and it is not
guaranteed that it was high before that. It really should be requested
with GPIOD_OUT_HIGH so that it is guaranteed to be high before
ov02e10_power_on() gets called as the code expects here.

Regards,

Hans



