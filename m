Return-Path: <linux-media+bounces-37646-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 8945BB041DC
	for <lists+linux-media@lfdr.de>; Mon, 14 Jul 2025 16:37:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 799561A62930
	for <lists+linux-media@lfdr.de>; Mon, 14 Jul 2025 14:37:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7B9F525A2C0;
	Mon, 14 Jul 2025 14:36:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="K39ZGBs3"
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF942248883
	for <linux-media@vger.kernel.org>; Mon, 14 Jul 2025 14:36:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752503809; cv=none; b=AwvMP9M6cxE1qJjWSRZaDLAPMgBOD5aa/UGaa0+YrxAOcc1qAINarI+XIaF+IPAltQluYU6cY5xUhvm4zeFg01jSb73yJa7FOu7L+yN1XW2Rh1tmxWEtaX/XxmkznJafpYkSHMtsbu9BqPwlxNi73DwWdj6QsqjgR6I/o0pkKMc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752503809; c=relaxed/simple;
	bh=VuqqMa72HKsGgw63UuN5cHyjaBeUWVPHJvFJII6coOY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ck38kHvu/nsWdBIbh5RdAuWdoI/PvWngIqyKSIdFUu3rEwAht5XdhlvYCktqogUC/Uv2QAHdz1PpwmUGBXRxN8BMDIUvLnpRpclPbIxXlgu5gXEWPZcggdwXjgfF7gz5augOFRqeizYW63uOoJn7L4C+6C5RIThcKGDtetpCoac=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=K39ZGBs3; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1752503806;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=stVCHu6LKp83uxTYBPZjVntnTY6VyQOczeCpnXoPZFg=;
	b=K39ZGBs3DW7er8HSJWu7e6MYjVBVE5qEDjqf0QXV/BeO2f4w/aay76F2hvF2V6u2AYOfo/
	UDjTOD1Vt8uKewCudDKb6S7AXu1IN5Ss924mVTSTNkxPM3jkOy670TKYWwBq0ka9/7jd+j
	vjnhfoR4s6weHdGSJ92/2IQ/D4JiaII=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-610-TMe-aWtVPlay172LzSLDaQ-1; Mon, 14 Jul 2025 10:36:45 -0400
X-MC-Unique: TMe-aWtVPlay172LzSLDaQ-1
X-Mimecast-MFC-AGG-ID: TMe-aWtVPlay172LzSLDaQ_1752503804
Received: by mail-ed1-f69.google.com with SMTP id 4fb4d7f45d1cf-607434dbc78so4165093a12.1
        for <linux-media@vger.kernel.org>; Mon, 14 Jul 2025 07:36:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752503804; x=1753108604;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=stVCHu6LKp83uxTYBPZjVntnTY6VyQOczeCpnXoPZFg=;
        b=Bo5OY2cH6e98evZ1j4o4Fn91bUQX/JH1vyNAZ6bPZmYyP85e6XjdEEnzewXN491E3e
         +vCdyrB8VuAj5LoEpeHILeeMy66OqTPvq/C5A7mR/DZRVvTwgK5wLBgtKqq+6m4cXJRO
         8NlfqJxaU6EUKom0AiiYelrKVhwT1JPvGAoQdQuvF73hZzPc01ygTCoikYF7eiA2Rwud
         hVJ+rt9/IEYoLs9UIy8C+Tc07oFElbRwVMfapDWq/DuLRdr2sWMBlsBEIPyEgfIqCC96
         DZ9TeywLcnId9cC2cPu/+pj+aimluegGioc97OjrB1BVAT6LMFksz/jcM5vOBuyPnGlC
         74rA==
X-Gm-Message-State: AOJu0Yw+FVylDYL/qmEUVtiXkKS+5J2mB0wsQVS5LD/HwKvluCL6h4B2
	LBN7CHFR6d/X4wpWxVFNvXAzz6tfqW3ymg/rzm4BFtgPN8zJKZJ7P2vQpHUuUwEhWMT5xKjD3pC
	NxUymMGRlLCi3W1jCaT6r+ygWjK5fv6ntv6N98lM+TFtHmju3ehAWsWYjPLGzcIKY
X-Gm-Gg: ASbGnctsm2qijVtdoXJ5k9U81NbufMI+ujPKUy6hnZ7BxFT76HfCd+qkqN3DOVVnBxW
	HNAq+sDmM9QE+xwfJB81cTHRWFou2g0P3YfsmLdVDEpXumFFko33TVDniN4FhVO6WifrJT01Rp8
	DHXwrZRJNnw7UtuYvlcl+AN7H/3QEmXWnmyEgzXXNQ1klJi1LfV0kZlpIepYnRABd2Lu7o0AUMA
	3cZRg0V9zkyXrsDGhcFgcXpxBDUDhaYiKq7yTD1P9ZpA2KXAU1TZstnQPvaFBivgMZpWHbtFznX
	TFuF1CSyr0qt4q1fEl5pgQRdktvTXZVJYTo8vPopMiHL
X-Received: by 2002:a17:907:8689:b0:ae4:85d:76fc with SMTP id a640c23a62f3a-ae6fcbc35bfmr1263812866b.30.1752503804296;
        Mon, 14 Jul 2025 07:36:44 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEf9LW2oVjZhF5sLUcvf0WPEAbAeIZPxgH40L/19uJOl41oKRe5Iyk5Y7lPc7HLnpXjTK6irQ==
X-Received: by 2002:a17:907:8689:b0:ae4:85d:76fc with SMTP id a640c23a62f3a-ae6fcbc35bfmr1263810666b.30.1752503803914;
        Mon, 14 Jul 2025 07:36:43 -0700 (PDT)
Received: from [10.40.98.122] ([78.108.130.194])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae6e7ee47a2sm842823166b.58.2025.07.14.07.36.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Jul 2025 07:36:43 -0700 (PDT)
Message-ID: <71d9aa58-e166-419b-9d32-839f5c4ad62c@redhat.com>
Date: Mon, 14 Jul 2025 16:36:42 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 08/12] media: uvcvideo: Add support for
 V4L2_CID_CAMERA_ORIENTATION
To: Ricardo Ribalda <ribalda@chromium.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Hans Verkuil
 <hverkuil@xs4all.nl>, Sakari Ailus <sakari.ailus@linux.intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Linus Walleij
 <linus.walleij@linaro.org>, Bartosz Golaszewski <brgl@bgdev.pl>,
 "Rafael J. Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
 linux-gpio@vger.kernel.org, linux-acpi@vger.kernel.org
References: <20250605-uvc-orientation-v2-0-5710f9d030aa@chromium.org>
 <20250605-uvc-orientation-v2-8-5710f9d030aa@chromium.org>
Content-Language: en-US, nl
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20250605-uvc-orientation-v2-8-5710f9d030aa@chromium.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 5-Jun-25 19:53, Ricardo Ribalda wrote:
> Fetch the orientation from the fwnode and map it into a control.
> 
> The uvc driver does not use the media controller, so we need to create a
> virtual entity, like we previously did with the external gpio.
> 
> We do not re-purpose the external gpio entity because its is planned to
> remove it.
> 
> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>

...

Taking a second look at this I noticed the following:

> @@ -1869,11 +1869,15 @@ static int uvc_scan_device(struct uvc_device *dev)
>  		return -1;
>  	}
>  
> -	/* Add GPIO entity to the first chain. */
> -	if (dev->gpio_unit) {
> +	/* Add virtual entities to the first chain. */
> +	if (dev->gpio_unit || dev->swentity_unit) {
>  		chain = list_first_entry(&dev->chains,
>  					 struct uvc_video_chain, list);
> -		list_add_tail(&dev->gpio_unit->chain, &chain->entities);
> +		if (dev->gpio_unit)
> +			list_add_tail(&dev->gpio_unit->chain, &chain->entities);
> +		if (dev->swentity_unit)
> +			list_add_tail(&dev->swentity_unit->chain,
> +				      &chain->entities);
>  	}
>  
>  	return 0;

The double checking of if (dev->gpio_unit) / if (dev->swentity_unit) looks
unnecessary here list_first_entry() is pretty cheap and this only runs
once at probe() time. So maybe:

	/* Add virtual entities to the first chain. */
	chain = list_first_entry(&dev->chains, struct uvc_video_chain, list);

	if (dev->gpio_unit)
		list_add_tail(&dev->gpio_unit->chain, &chain->entities);

	if (dev->swentity_unit)
		list_add_tail(&dev->swentity_unit->chain, &chain->entities);

?

...

Regards,

Hans


