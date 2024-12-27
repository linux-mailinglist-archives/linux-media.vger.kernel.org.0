Return-Path: <linux-media+bounces-24120-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 036219FD0F6
	for <lists+linux-media@lfdr.de>; Fri, 27 Dec 2024 08:19:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9FD621882B41
	for <lists+linux-media@lfdr.de>; Fri, 27 Dec 2024 07:19:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F1D7D145348;
	Fri, 27 Dec 2024 07:19:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="L7hPpapY"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DC5C13665A
	for <linux-media@vger.kernel.org>; Fri, 27 Dec 2024 07:19:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735283981; cv=none; b=l2/igHHLL6OnGg9YBb0UyCOPB4Lj/alz6vN6V+AQPnSVI2mYQMgD0jU12kTBtl2nt7c6NxIwCnIXq6fFDMLdeXA5A/c4e2fDxrSDg+r3rZmj1NfB0zFUsBNRmvsNugdfS9NPS7/uV7TbA5ouI7QvEy69DFMoy/wfWwzWBVAnGuk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735283981; c=relaxed/simple;
	bh=R9vq5QXh1GuL5/rGPEpSOhtg6XdZdg2hAfFNguQMw0M=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Sw1sD92Z9OFRkfsnCXGtJ4wg3AaSmtCA63LjJBy4o+OawynAifSNETypWjFhrv6hYC4XlGFaRFBWnddx0Wp3iP5PwU8bhGHt+ywnWkfr6y4n2aygz1tPYxQhQvYv3Swgk8YoYF3aHIyaOcEkbthjdY21/F7hXu/6h5tik6RmSt0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=L7hPpapY; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-436203f1203so9781145e9.2
        for <linux-media@vger.kernel.org>; Thu, 26 Dec 2024 23:19:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1735283978; x=1735888778; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=BGSb8pmPGSJ68yd0XrJuWpxwcRyD2MmcGIJrqHlCFMk=;
        b=L7hPpapYYmP0Kdg4W7eZF7RQVoz9kxHMsDM/HVe0dXqQ9BHv67oBwGZCsT50uYs4nf
         4wEdm/6VMUSvK2KyQz2MWQViIyvdaLfVrycdUyJ+uQNcDI71oUNlfpUPZibYTspkegEZ
         hbs5HG+2FFByFbrWCUGUGiGLWcks/Ee8DRNJfdgEUw1/zS4t2m9VAybXO9Ir1DO3r3Ja
         Cyw7yTUHrBnEJKFXlOEjhqVzpHSIeMrAN5fJW2/2tHUxTKskblRInsZwp3mqsdvK1DZ4
         KlfS4iLEyIAWda6C02SyIquzs0MLImCDMsPzERBxmItyPKTeTwFHyxvmeebxGzZIr+rc
         X8jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735283978; x=1735888778;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BGSb8pmPGSJ68yd0XrJuWpxwcRyD2MmcGIJrqHlCFMk=;
        b=IkdtPq9EE2PQWx2GndbD2PDLPh39vAb5NH/bRQKNcQwL+CLbf14EZNZ29TxSwtGiio
         kchd/Yco2Ru/o40k4n0anhm4obA717zV8yIfU00hiPknQH4lFlDPX6DYyenBBv4KQ28H
         SpU35U9OQAqPNgTYpagUTt8VTygYdAJ5fTHIpi3XsyJW0lf7quY2l56ABdadj/HpdNjz
         wtNxeB2Xp1iOtvtZM5ZoVkub4BU7Af30p6/0+Jrd0q4v0Zjfv+XWWq/cNv34EcRpIIu0
         QGV/ErMK7o0eCTSfeO+O7XQhFh99LVEb1hQtsfCMtBjWy9VHfFRpoRxiV+ez1zYoSFWX
         gyEw==
X-Gm-Message-State: AOJu0YxuwJjwgzgFL7iAk7CuYoBzV95HOGs//y9VmkAkhLFmzMnq3uA9
	pyffH8FykQUjK0GyOEeW3bHNGUS0K3P+ljUUCYTPz5cOe9icmhWIgTnndwGRgXU=
X-Gm-Gg: ASbGnct2SzTaylsv+VMSdHzpK9vWm9t++hEp1ogFvtsmH32ednQxZQ7S5BXukDsthQJ
	pxJIC2jxJn4mDTJgUtKJkwOUYeacyu9XDNkh/4OxAHms1up4rMFUX3Buirt+WfBKPx+2HdZhkJU
	Sp8G5SB3dRS0gQD9i8SpJSh7CVpncdGqba1VjniwQ8nCQDy/oTI/W3X1N6mBA96L3uqO3XfFrfH
	BaWQ53RENKFDqxz7wn0iVq7rz2OoxBEDJec9xITApnWrq+dmabP55YCflQO6ALjuuFuULY9oAea
X-Google-Smtp-Source: AGHT+IG7i6bQDt3/mKimrQm4dDO0yvPNhqF8fcgg73PD3o+4LQbySUSrxdwzwcF4Ntyezzt2TuKSZw==
X-Received: by 2002:a05:6000:1546:b0:385:edd4:1242 with SMTP id ffacd0b85a97d-38a223f635emr8330747f8f.10.1735283977756;
        Thu, 26 Dec 2024 23:19:37 -0800 (PST)
Received: from [192.168.1.20] ([178.197.223.165])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38a1c848a47sm21203598f8f.62.2024.12.26.23.19.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Dec 2024 23:19:37 -0800 (PST)
Message-ID: <712ed366-233d-477b-b760-907b3d77a7db@linaro.org>
Date: Fri, 27 Dec 2024 08:19:35 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 01/10] dt-bindings: media: Add
 amlogic,c3-mipi-csi2.yaml
To: keke.li@amlogic.com, Mauro Carvalho Chehab <mchehab@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, kieran.bingham@ideasonboard.com,
 laurent.pinchart@ideasonboard.com, dan.scally@ideasonboard.com,
 jacopo.mondi@ideasonboard.com
References: <20241227-c3isp-v5-0-c7124e762ff6@amlogic.com>
 <20241227-c3isp-v5-1-c7124e762ff6@amlogic.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <20241227-c3isp-v5-1-c7124e762ff6@amlogic.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 27/12/2024 08:09, Keke Li via B4 Relay wrote:
> From: Keke Li <keke.li@amlogic.com>
> 
> c3-mipi-csi2 is used to receive mipi data from image sensor.
> 
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Signed-off-by: Keke Li <keke.li@amlogic.com>
> ---
>  .../bindings/media/amlogic,c3-mipi-csi2.yaml       | 131 +++++++++++++++++++++
>  MAINTAINERS                                        |   6 +
>  2 files changed, 137 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/media/amlogic,c3-mipi-csi2.yaml b/Documentation/devicetree/bindings/media/amlogic,c3-mipi-csi2.yaml
> new file mode 100644
> index 000000000000..76b68d1e7316
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/amlogic,c3-mipi-csi2.yaml
> @@ -0,0 +1,131 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/media/amlogic,c3-mipi-csi2.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Amlogic C3 MIPI CSI-2 receiver
> +
> +maintainers:
> +  - Keke Li <keke.li@amlogic.com>
> +
> +description:
> +  MIPI CSI-2 receiver contains CSI-2 RX PHY and host controller.
> +  It receives the MIPI data from the image sensor and sends MIPI data
> +  to MIPI adapter.
> +
> +properties:
> +  compatible:
> +    enum:
> +      - amlogic,c3-mipi-csi2
> +
> +  reg:
> +    maxItems: 3
> +
> +  reg-names:
> +    items:
> +      - const: aphy
> +      - const: dphy
> +      - const: host
> +
> +  power-domains:
> +    maxItems: 1
> +
> +  clocks:
> +    maxItems: 2
> +
> +  clock-names:
> +    items:
> +      - const: vapb
> +      - const: phy0
> +
> +  assigned-clocks: true
> +
> +  assigned-clock-rates: true

NAK

Adding new properties *INVALIDATES REVIEW*. Otherwise you can sneak
whatever crap past reviewers.

Drop all new properties and drop my review tag.

Best regards,
Krzysztof

