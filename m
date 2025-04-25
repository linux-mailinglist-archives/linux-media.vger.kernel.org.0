Return-Path: <linux-media+bounces-31048-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id ADD31A9C4FB
	for <lists+linux-media@lfdr.de>; Fri, 25 Apr 2025 12:15:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 914213ADE8A
	for <lists+linux-media@lfdr.de>; Fri, 25 Apr 2025 10:14:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1AC7B245019;
	Fri, 25 Apr 2025 10:13:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="gVmXPmUD"
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE6C123FC49
	for <linux-media@vger.kernel.org>; Fri, 25 Apr 2025 10:13:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745576008; cv=none; b=ojvtjR62W8BhwsmYTaV45+/vFiesHbAD8e38KUZjOGyXJG6wKHeYSa9SQHwbce8q3NVL/yV3FfJRlN4RVHlZ2fyYPrhvLD1Z+9sHV9jmttu5XG3MO0fY6ldHgocf+0/ZMz0FKd5eyeUnSyfdXgHWqrjAMP9ToLRBL0XatNZST3Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745576008; c=relaxed/simple;
	bh=G/slIN/YQejFKxJKe0AEMCbMJu1x7O2oA2+moybJ5hI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=METtVHvRTMwuAHKG96yt7S7uYFn4/w+lfcW3973xJzO+qOpMZ6Xk34/lzJlZPv/THCR8xNuX9PK4EfyXsPXJKD9xRwV9dfkhpQA2m1hdb/CwvNpnM5rRid0Y+BX1YiRIZYfszf0dO2J9q47S8QoOYWa9gbnIjdNxA1RJLfShS5E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=gVmXPmUD; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1745576005;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=c3mmkWVGcSdiSfH6kfLgKeVG303ccg/Ai5NqIFewYeI=;
	b=gVmXPmUDSevHRLEHPrmN6dDIT+qpbIS2/y4sn8tQPifqKzE8MCeNAjpyjKy6/nQ7AuMc1r
	lCfA4OrIQ2SYZTNm3SW+KFIjSKlo+SNFsOIJWopauCdrqadTu1qI81oiXPr1l7qRwgzB3g
	n5v+ydIqKqYlOfejcJBAFrARtInciAY=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-104-SMKL5cmyOPqMZGZNCTlufA-1; Fri, 25 Apr 2025 06:13:24 -0400
X-MC-Unique: SMKL5cmyOPqMZGZNCTlufA-1
X-Mimecast-MFC-AGG-ID: SMKL5cmyOPqMZGZNCTlufA_1745576003
Received: by mail-ej1-f69.google.com with SMTP id a640c23a62f3a-acb8f9f58ebso154128566b.2
        for <linux-media@vger.kernel.org>; Fri, 25 Apr 2025 03:13:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745576003; x=1746180803;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=c3mmkWVGcSdiSfH6kfLgKeVG303ccg/Ai5NqIFewYeI=;
        b=gwTtjcoxzQaPq8tQZ+CUyw5XXgKMVpBYE0ZIp0O4xU62u28L1Yj+P3sZVYPBFle4/t
         MrjX8bM0BclInth9kncgmDv92JEKHmfhR8Gq0jqfLyJ2FTJ83yKZTSTZ076hEMZSAzon
         XIhdsEoCGi9cp3slkhgBrKz10RoprANgTGpAt1slQ/1WtPeF7Nk+59IW/XnetuLu7+Hm
         txQhXX5ykkaAieAUukAF3+dt14t1bG0UVZ2JuamHrrvH1b5ktJ4vtBYhEm9eskeOkJGT
         k3Aq4AorlGuBAxkWID9OAloFCgmEuVZf6JEyHrM5+Sd0IDatb4nfekoaHCLOBg+/uLCn
         LUjQ==
X-Forwarded-Encrypted: i=1; AJvYcCV0z7eNisjlGqupFi7AM6AOQ102JJLDtnnWZVcu2IeqerTlwxkVbrCPhVkNL3k4mYb7V9AiVNlY2SIDoQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyaEkSMPHRkh23LhgNNlyCRQbZ7v+jNuivIYXAXd9Yfmx2IosEC
	01ZEtd32/tCjFDUX+k/IpDJssO7PA5UwCZ/ysQnIPOsIoVbfNzonMATeHMj9i7faWzdUYcaiHOM
	9pp3lMTEyQye6tWHq5NNTbB89JS4/QrgkYWcQ1liSQmDOlC2PmL/OqD5XXJAA
X-Gm-Gg: ASbGncuSH8uamsKzHtFzFAIoWgxqW24D6I1KNCbntTc/3JeuxXNEQmPfCS+d1e3BruS
	wfAS/MENdoCNVPHyBPCljRDiLe5ExiBH5byc2+TFsgf591AeHZjtH9NwkZErha2v1WZjB+5wRYD
	QcmKX+lvIwUcuBXfGwGKb4lhHrLsHxCEwl3gLvloqQ7t3p7JaY1VoIg90STp9G/gZ/V4d6RD+w4
	uszc4tGW9XMeCKrN+sA+NGYH8RU/LCA+seV36qYE0Hnu1XMwDAWKemzndWy8KxvUiS8PPu5M21G
	8ClOPxJkTxhFNCzlVwk5HRGT8Mg5JjoE6VqnAvE/AP2TTs/lEKfcCBayjIDuG1iHDPbQUB5jwzE
	qoqunANIBA4Ut6sXdeKsAUJXlVP4KiJ9+ayPSQMNwSWTnaeQ20wHHbkZ/c4oI+Q==
X-Received: by 2002:a17:907:1b22:b0:acb:94d6:a841 with SMTP id a640c23a62f3a-ace7108a209mr151849766b.16.1745576003150;
        Fri, 25 Apr 2025 03:13:23 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG7hpa0BS6PG9ebdCJ6WIapt6vCC/k4yEO6v7ADZBdEUPa6WQN3zZ/a7svwpaovIE6s9cT1Bw==
X-Received: by 2002:a17:907:1b22:b0:acb:94d6:a841 with SMTP id a640c23a62f3a-ace7108a209mr151848466b.16.1745576002717;
        Fri, 25 Apr 2025 03:13:22 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ace6e41c898sm112354166b.7.2025.04.25.03.13.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 25 Apr 2025 03:13:22 -0700 (PDT)
Message-ID: <0db6de06-9d74-47d5-8625-7875bc376ecd@redhat.com>
Date: Fri, 25 Apr 2025 12:13:21 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] platform/x86: int3472: add hpd pin support
To: Dongcheng Yan <dongcheng.yan@intel.com>, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, sakari.ailus@linux.intel.com,
 hverkuil@xs4all.nl, andriy.shevchenko@linux.intel.com,
 u.kleine-koenig@baylibre.com, ricardo.ribalda@gmail.com,
 bingbu.cao@linux.intel.com
Cc: stable@vger.kernel.org, dongcheng.yan@linux.intel.com, hao.yao@intel.com
References: <20250425100739.3099535-1-dongcheng.yan@intel.com>
Content-Language: en-US, nl
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20250425100739.3099535-1-dongcheng.yan@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Doncheng,

On 25-Apr-25 12:07 PM, Dongcheng Yan wrote:
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

Note my handshake control series has just landed / is on its
way to next, see:

https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git/log/?h=review-ilpo-next

Please send a v3 rebased on top of this to resolve the conflict
we now have.

Regards,

Hans






> ---
>  drivers/platform/x86/intel/int3472/common.h   | 1 +
>  drivers/platform/x86/intel/int3472/discrete.c | 6 ++++++
>  2 files changed, 7 insertions(+)
> 
> diff --git a/drivers/platform/x86/intel/int3472/common.h b/drivers/platform/x86/intel/int3472/common.h
> index 145dec66df64..db4cd3720e24 100644
> --- a/drivers/platform/x86/intel/int3472/common.h
> +++ b/drivers/platform/x86/intel/int3472/common.h
> @@ -22,6 +22,7 @@
>  #define INT3472_GPIO_TYPE_POWER_ENABLE				0x0b
>  #define INT3472_GPIO_TYPE_CLK_ENABLE				0x0c
>  #define INT3472_GPIO_TYPE_PRIVACY_LED				0x0d
> +#define INT3472_GPIO_TYPE_HOTPLUG_DETECT			0x13
>  
>  #define INT3472_PDEV_MAX_NAME_LEN				23
>  #define INT3472_MAX_SENSOR_GPIOS				3
> diff --git a/drivers/platform/x86/intel/int3472/discrete.c b/drivers/platform/x86/intel/int3472/discrete.c
> index 30ff8f3ea1f5..26215d1b63a2 100644
> --- a/drivers/platform/x86/intel/int3472/discrete.c
> +++ b/drivers/platform/x86/intel/int3472/discrete.c
> @@ -186,6 +186,10 @@ static void int3472_get_con_id_and_polarity(struct acpi_device *adev, u8 *type,
>  		*con_id = "privacy-led";
>  		*gpio_flags = GPIO_ACTIVE_HIGH;
>  		break;
> +	case INT3472_GPIO_TYPE_HOTPLUG_DETECT:
> +		*con_id = "hpd";
> +		*gpio_flags = GPIO_ACTIVE_HIGH;
> +		break;
>  	case INT3472_GPIO_TYPE_POWER_ENABLE:
>  		*con_id = "power-enable";
>  		*gpio_flags = GPIO_ACTIVE_HIGH;
> @@ -212,6 +216,7 @@ static void int3472_get_con_id_and_polarity(struct acpi_device *adev, u8 *type,
>   * 0x0b Power enable
>   * 0x0c Clock enable
>   * 0x0d Privacy LED
> + * 0x13 Hotplug detect
>   *
>   * There are some known platform specific quirks where that does not quite
>   * hold up; for example where a pin with type 0x01 (Power down) is mapped to
> @@ -281,6 +286,7 @@ static int skl_int3472_handle_gpio_resources(struct acpi_resource *ares,
>  	switch (type) {
>  	case INT3472_GPIO_TYPE_RESET:
>  	case INT3472_GPIO_TYPE_POWERDOWN:
> +	case INT3472_GPIO_TYPE_HOTPLUG_DETECT:
>  		ret = skl_int3472_map_gpio_to_sensor(int3472, agpio, con_id, gpio_flags);
>  		if (ret)
>  			err_msg = "Failed to map GPIO pin to sensor\n";
> 
> base-commit: 01c6df60d5d4ae00cd5c1648818744838bba7763


