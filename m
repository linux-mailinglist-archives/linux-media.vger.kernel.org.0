Return-Path: <linux-media+bounces-30010-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 431E9A856AA
	for <lists+linux-media@lfdr.de>; Fri, 11 Apr 2025 10:36:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 589E516B574
	for <lists+linux-media@lfdr.de>; Fri, 11 Apr 2025 08:35:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5E9EA29898D;
	Fri, 11 Apr 2025 08:34:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="JZPitmSi"
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6463298988
	for <linux-media@vger.kernel.org>; Fri, 11 Apr 2025 08:33:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744360440; cv=none; b=G+ws9j7PwxJalS1YgHMeRXdvSTGvXNFwueR479cD5sCkwMfzniUUXquTYoFQm1EWaMk6bqnM11uiA8P0NqOeHWahzJf46HmKkp2bfPv8KfLc1lnMMY0y5U7mrpX2JDkYpiYEbwjOJK5fYxguMLcyqrnJD+g2Rp3V4duhfdFQTbk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744360440; c=relaxed/simple;
	bh=/qo4gcSDylw9y3Y13r/kFOd4wQ4zfDTtcYDq9dLoHDE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Y5Ax3wM0h7PKg2Wp6TI5Oqx80JbAaNCxAgJY21lNHioZbEfnDTN3R/Gh++8ho4bFDStNDIFsMWnga6tE7tqZFmY0gc+HukPT+oZrKKvcCMNhHhFgR05Aq7kUmHlJLAkmFV0n0lbDgIkOEiMiSKCpIU2qye/c6AUNXQsBeXvvK6c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=JZPitmSi; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1744360438;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=rauBmq3K5j+aZ4ym535sl8BVfHytZNjgSVdV1u6bHGA=;
	b=JZPitmSiQ6UC6DL5Q7rcEeeuISdV/nud8xqBWChvAXkg3Df5W7k5YHDd3iAOHji16P95d7
	z50SGVnOClLx1gEpKMq72FFz4sSqhpMBX9MIc+IqK+m5XBdyvcWeoesQX7KgUQS2x3S7Xo
	X9P7Fh0Zjm7LJz70fNOjF4sGsoUiv7Y=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-204-O7D6WNbcM6OrVG8mhvw08w-1; Fri, 11 Apr 2025 04:33:56 -0400
X-MC-Unique: O7D6WNbcM6OrVG8mhvw08w-1
X-Mimecast-MFC-AGG-ID: O7D6WNbcM6OrVG8mhvw08w_1744360435
Received: by mail-ej1-f70.google.com with SMTP id a640c23a62f3a-ac3d175fe71so126803166b.0
        for <linux-media@vger.kernel.org>; Fri, 11 Apr 2025 01:33:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744360435; x=1744965235;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rauBmq3K5j+aZ4ym535sl8BVfHytZNjgSVdV1u6bHGA=;
        b=CpDIC6LweLhV1RABb5MF2YZ0wUYT2WXKjcfhduS68xVJqdE6URFS0YNr5F7Dln084O
         WZOQKWXZhOlQzkh37S7L4mHXttOg/DdXQmUfBdPuZ/lo1yUoOuZFtH5qs6VUv6HXR9/C
         ysiNray5LbIAnYOM3FZglUv1LZs/6GZ4rTBAnAm5cZdorKPAAwQiJ8wIBTtXCyNUaihy
         aj39vlXWbv+4BzQHP8j9dZL576EnHUsDXdHLDFkEB5M1xbfJthoO5PMm24sXwZDNaKbp
         CyYn50Gn8cJuy4CrSVaaFRv01CQfSNEpPY/MYKdNM+UXxk9QjY5Jnvwojt6wHnF2xLH3
         jXOg==
X-Forwarded-Encrypted: i=1; AJvYcCXKs4YPkVULOzAhcKJQCITTvvzLWncqtP5UYME7xwFqJlyKpJKYOX1IBSrYYrLBJpZQDf9YCS3UcpRoZg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxY9WEP/PsT9hndNX8VNtUU9E9uZa2f9LH74Wb3Rykw7MMJw6Vk
	4s/l3RWpPVSuFOQ3MHWgF2RMHLgc5HQuElCAH41ebt86NoX1BkU0u8EY+k6pKrRvFgCDSmwG57S
	+eVypnizyxy98SX7JhBaAA5rYwiYKvHVByxhcPlZ6LW7mnr+VgErOOR5pnhqs
X-Gm-Gg: ASbGnctAR+06MKuJhyRJhn+vKkvo5EYAu5BScXXos1/+5C/qx3MMvnZUuOC2CpQpm06
	/NQX3dBs9dVpf1nigtuh5gp5VdG+8/LJkeG4kqsgVMAMCzBkq5yDUAxzmuFLffC7WA9/v9Gnagy
	s8CfjQCBNwjHYSwTBCc+bo/okuaZocBnSAtSogwH7M0icrybsPFb9gCTb5o77uUbGo1CKM261BI
	vxATjuB/DbMcwy1Y5rhFd3VfzLawkKYMyGklb1PUT1KtXigM3kTEIBFAOy6KIKxa75dWAfviuSJ
	Nso4pxt2PR6gc80fPLhogcJnB1TUr87DqeaqbzyVa+aa2RF2eYjy8qbNyU5fZH8pukkxUGwj2+5
	17SrOOc8xPiIu/i45KVfIEnjeelXjmGYKxRL8ZU5EV8NFSDVLbP6Mt248tq13RQ==
X-Received: by 2002:a05:6402:1ecc:b0:5e4:99af:b7c with SMTP id 4fb4d7f45d1cf-5f36f644fa1mr1206350a12.9.1744360435262;
        Fri, 11 Apr 2025 01:33:55 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG5ETctPXgmYy/3kOvhR7THcmsbYSpYhk7jhIPW9DPlhKebFvCO4nVWQ6lXtvrje1+ZZMpM1g==
X-Received: by 2002:a05:6402:1ecc:b0:5e4:99af:b7c with SMTP id 4fb4d7f45d1cf-5f36f644fa1mr1206330a12.9.1744360434865;
        Fri, 11 Apr 2025 01:33:54 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5f36f507687sm624677a12.56.2025.04.11.01.33.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 11 Apr 2025 01:33:53 -0700 (PDT)
Message-ID: <cfc709a8-85fc-4e44-9dcf-ae3ef7ee0738@redhat.com>
Date: Fri, 11 Apr 2025 10:33:52 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/2] platform/x86: int3472: add hpd pin support
To: Dongcheng Yan <dongcheng.yan@intel.com>, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, sakari.ailus@linux.intel.com,
 hverkuil@xs4all.nl, andriy.shevchenko@linux.intel.com,
 u.kleine-koenig@baylibre.com, ricardo.ribalda@gmail.com,
 bingbu.cao@linux.intel.com
Cc: stable@vger.kernel.org, dongcheng.yan@linux.intel.com, hao.yao@intel.com
References: <20250411082357.392713-1-dongcheng.yan@intel.com>
Content-Language: en-US, nl
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20250411082357.392713-1-dongcheng.yan@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 11-Apr-25 10:23 AM, Dongcheng Yan wrote:
> Typically HDMI to MIPI CSI-2 bridges have a pin to signal image data is
> being received. On the host side this is wired to a GPIO for polling or
> interrupts. This includes the Lontium HDMI to MIPI CSI-2 bridges
> lt6911uxe and lt6911uxc.
> 
> The GPIO "hpd" is used already by other HDMI to CSI-2 bridges, use it
> here as well.
> 
> Signed-off-by: Dongcheng Yan <dongcheng.yan@intel.com>
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
> index 30ff8f3ea1f5..28d41b1b3809 100644
> --- a/drivers/platform/x86/intel/int3472/discrete.c
> +++ b/drivers/platform/x86/intel/int3472/discrete.c
> @@ -186,6 +186,10 @@ static void int3472_get_con_id_and_polarity(struct acpi_device *adev, u8 *type,
>  		*con_id = "privacy-led";
>  		*gpio_flags = GPIO_ACTIVE_HIGH;
>  		break;
> +	case INT3472_GPIO_TYPE_HOTPLUG_DETECT:
> +		*con_id = "hpd";
> +		*gpio_flags = GPIO_LOOKUP_FLAGS_DEFAULT;

This looks wrong, we really need to clearly provide a polarity
here since the ACPI GPIO resources do not provide one.

Regards,

Hans



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


