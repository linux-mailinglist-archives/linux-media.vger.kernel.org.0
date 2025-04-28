Return-Path: <linux-media+bounces-31215-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 65368A9F33E
	for <lists+linux-media@lfdr.de>; Mon, 28 Apr 2025 16:16:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EB27E1898E88
	for <lists+linux-media@lfdr.de>; Mon, 28 Apr 2025 14:16:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5379126FA41;
	Mon, 28 Apr 2025 14:16:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="FWxqQTTQ"
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27BD5269808
	for <linux-media@vger.kernel.org>; Mon, 28 Apr 2025 14:16:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745849768; cv=none; b=PqfytG9i6GI/uOOAaU4L4rWg+xW/hlL80+UaGxuWUsUjjWNa94dDP4eAt/ADILe6eVSXMMmQY1jlQmhIInRYIJjz4x1088N0QkwOlDgLQXm1QHX6EX/oe9nUOuNZQZS/pZAfmG9tSe5buCIoKILNWli4rEMePJX9eV2ujPN7o0U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745849768; c=relaxed/simple;
	bh=7jpFf0X44mvZPBwHm4oi95YMAiHMwB3njgHS2bzbL6U=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KKSsyGYIvnh3yYSU38yvXrHvlcJGoP/iCbz6ERdOjtVQrnrzWEx0vTAIZc0+DUKC4UX4clFCAgol2gocw4Ldn8WFNqi4YY2hWaldiJZAzxXYC+yGbOoftfmHZhIP0f45D+NVI6kTOSQemK7ywXBOrPxtVjVN9cvN5DRzAWL21v8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=FWxqQTTQ; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1745849765;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=uVeCmrqrUzw7XcCq/Od4x1SVTaUBINUIH5X6q+EccXM=;
	b=FWxqQTTQ7130GdvGTT2+0ExFlXju/EpheUZ0x5rUk30XNjlnIbmM94rISxbeuyfJLQIJ3G
	8ZKnPrkbP7ivblENM+q24z/Z4dKCGYlbXOAJaP5f0a4tBwvRB3T8TC7YfIz2HZnCfkrTOT
	9O2h2XLIfRR26muM8NZXs2TM2jFvE7k=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-30-zZ3CLI-2O0yeRwu3nwzyXw-1; Mon, 28 Apr 2025 10:16:04 -0400
X-MC-Unique: zZ3CLI-2O0yeRwu3nwzyXw-1
X-Mimecast-MFC-AGG-ID: zZ3CLI-2O0yeRwu3nwzyXw_1745849763
Received: by mail-ej1-f69.google.com with SMTP id a640c23a62f3a-acbbb0009aeso349422066b.1
        for <linux-media@vger.kernel.org>; Mon, 28 Apr 2025 07:16:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745849763; x=1746454563;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=uVeCmrqrUzw7XcCq/Od4x1SVTaUBINUIH5X6q+EccXM=;
        b=FYpUVL//kZLh0ojgPCdjId6CgNuZIA5KiUeBVyuzMUjih6W2XLIZBpNIPDr02vev5+
         +zdXYz6SqvGJdxXdQmmaqmDMyRcDgA03ywBHYA20fBIXQ45EmdoE2eWQNfCoL9q+Uj9t
         ssEX9AtzaSVicPB5b8alrDCjrebNBB9d6Dk/21FhXgtTwNWSKl5piT7JiL/9bcWxzl5M
         HvC9z6sAM5rIrAKoG2aRrZIxmiX4HVzOwxbwCTKDP2BFF4xSNIa46l8fzKAzHwhDNf2a
         7p1HV+Ml2pSPzf0qlA1slgUoKZfAJ3r22lOJYEX8nzG7ENhrMvXAVQ2slaYIsU4O9Vph
         F+cg==
X-Forwarded-Encrypted: i=1; AJvYcCWWcW2mhLOHYkBQlC2zrkUuTE+EFx+NG0iZ+R4IvbFT/xIHmG+Nzg7iwAgdkXdsrnRhObf9fJCn74lmWg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxKKB7KvSui4w5y6R+S/TfWCLNHSL8lj2cJOS+CmpRXRKPCFRj+
	CJM2Id3dNQwd+wYIaa5fCl9eA64RPOBpiXA5LpoOA5TZ4CoOQxuC9ChpX4At2FCYXeVHvIQrVm/
	Cl1yfnKER5ACwmEylQhsYh5oQ4KNE+0KyHAH3vd45yL9hXYKkitV44JLLMAVk
X-Gm-Gg: ASbGncuXYT6z5GSyRu4t4sMlG6dgXB2+nfOu4yiq+pu59ddjFjtSBGTICrbERXOD8N7
	vFtlE7oomufI8FKAlYYdKW+deB9OQajJcCct1g4h0DjyJ1981PfqipVsVj1ElIAvyJ8kC920slz
	fcm/bWmMfHD0L3SadBEJNKZVqPF3PRiSEka3vTNR+5EWG3kDD1yFT32YSii5MiMaoko263JIFsZ
	NeCx4pFe2AcmPlPE4CwwazFKWBlobvs+f26CchlHX+wee+2kgI/wJPREUvBKhZn2VlYlCzqSuaB
	Fx6pYFoWABhqYVc=
X-Received: by 2002:a17:907:720d:b0:ace:3ede:9d26 with SMTP id a640c23a62f3a-ace711175b7mr1232460666b.27.1745849762822;
        Mon, 28 Apr 2025 07:16:02 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGR/e9QmbwHOiCLBIV4zMYiJpJwXtmPx7xY++qV/czLNz8zUG7J1jnJV/Ws/7DrjDPUG1JACw==
X-Received: by 2002:a17:907:720d:b0:ace:3ede:9d26 with SMTP id a640c23a62f3a-ace711175b7mr1232455266b.27.1745849762340;
        Mon, 28 Apr 2025 07:16:02 -0700 (PDT)
Received: from [10.40.98.122] ([78.108.130.194])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5f7013ff9c5sm5977861a12.28.2025.04.28.07.16.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Apr 2025 07:16:01 -0700 (PDT)
Message-ID: <a9e32617-c8c8-4c26-a1ce-6908bc64f802@redhat.com>
Date: Mon, 28 Apr 2025 16:16:00 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/2] platform/x86: int3472: add hpd pin support
To: Dongcheng Yan <dongcheng.yan@intel.com>, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, sakari.ailus@linux.intel.com,
 hverkuil@xs4all.nl, andriy.shevchenko@linux.intel.com,
 u.kleine-koenig@baylibre.com, ricardo.ribalda@gmail.com,
 bingbu.cao@linux.intel.com
Cc: stable@vger.kernel.org, dongcheng.yan@linux.intel.com, hao.yao@intel.com
References: <20250425104331.3165876-1-dongcheng.yan@intel.com>
Content-Language: en-US, nl
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20250425104331.3165876-1-dongcheng.yan@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 25-Apr-25 12:43, Dongcheng Yan wrote:
> Typically HDMI to MIPI CSI-2 bridges have a pin to signal image data is
> being received. On the host side this is wired to a GPIO for polling or
> interrupts. This includes the Lontium HDMI to MIPI CSI-2 bridges
> lt6911uxe and lt6911uxc.
> 
> The GPIO "hpd" is used already by other HDMI to CSI-2 bridges, use it
> here as well.
> 
> Signed-off-by: Dongcheng Yan <dongcheng.yan@intel.com>

Thanks, patch looks good to me:

Reviewed-by: Hans de Goede <hdegoede@redhat.com>

Regards,

Hans



> ---
>  drivers/platform/x86/intel/int3472/common.h   | 1 +
>  drivers/platform/x86/intel/int3472/discrete.c | 6 ++++++
>  2 files changed, 7 insertions(+)
> 
> diff --git a/drivers/platform/x86/intel/int3472/common.h b/drivers/platform/x86/intel/int3472/common.h
> index 51b818e62a25..4593d567caf4 100644
> --- a/drivers/platform/x86/intel/int3472/common.h
> +++ b/drivers/platform/x86/intel/int3472/common.h
> @@ -23,6 +23,7 @@
>  #define INT3472_GPIO_TYPE_CLK_ENABLE				0x0c
>  #define INT3472_GPIO_TYPE_PRIVACY_LED				0x0d
>  #define INT3472_GPIO_TYPE_HANDSHAKE				0x12
> +#define INT3472_GPIO_TYPE_HOTPLUG_DETECT			0x13
>  
>  #define INT3472_PDEV_MAX_NAME_LEN				23
>  #define INT3472_MAX_SENSOR_GPIOS				3
> diff --git a/drivers/platform/x86/intel/int3472/discrete.c b/drivers/platform/x86/intel/int3472/discrete.c
> index 394975f55d64..efa3bc7af193 100644
> --- a/drivers/platform/x86/intel/int3472/discrete.c
> +++ b/drivers/platform/x86/intel/int3472/discrete.c
> @@ -191,6 +191,10 @@ static void int3472_get_con_id_and_polarity(struct int3472_discrete_device *int3
>  		*con_id = "privacy-led";
>  		*gpio_flags = GPIO_ACTIVE_HIGH;
>  		break;
> +	case INT3472_GPIO_TYPE_HOTPLUG_DETECT:
> +		*con_id = "hpd";
> +		*gpio_flags = GPIO_ACTIVE_HIGH;
> +		break;
>  	case INT3472_GPIO_TYPE_POWER_ENABLE:
>  		*con_id = "avdd";
>  		*gpio_flags = GPIO_ACTIVE_HIGH;
> @@ -221,6 +225,7 @@ static void int3472_get_con_id_and_polarity(struct int3472_discrete_device *int3
>   * 0x0b Power enable
>   * 0x0c Clock enable
>   * 0x0d Privacy LED
> + * 0x13 Hotplug detect
>   *
>   * There are some known platform specific quirks where that does not quite
>   * hold up; for example where a pin with type 0x01 (Power down) is mapped to
> @@ -290,6 +295,7 @@ static int skl_int3472_handle_gpio_resources(struct acpi_resource *ares,
>  	switch (type) {
>  	case INT3472_GPIO_TYPE_RESET:
>  	case INT3472_GPIO_TYPE_POWERDOWN:
> +	case INT3472_GPIO_TYPE_HOTPLUG_DETECT:
>  		ret = skl_int3472_map_gpio_to_sensor(int3472, agpio, con_id, gpio_flags);
>  		if (ret)
>  			err_msg = "Failed to map GPIO pin to sensor\n";
> 
> base-commit: 4d1e8c8f11c611db5828e4bae7292bc295eea8ef


