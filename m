Return-Path: <linux-media+bounces-48630-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id C685FCB59AF
	for <lists+linux-media@lfdr.de>; Thu, 11 Dec 2025 12:09:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C47173014631
	for <lists+linux-media@lfdr.de>; Thu, 11 Dec 2025 11:09:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A640C306485;
	Thu, 11 Dec 2025 11:09:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="B8FajkAt"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 459E22BE7DD
	for <linux-media@vger.kernel.org>; Thu, 11 Dec 2025 11:09:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765451382; cv=none; b=KBAzRiEr2gQmkxfpkjRX44rY6viFgJKPPpHY3OciGiosgQvMFPBnP1IB8ae1K5Z3spkS/Z/vfzj5g6DcHkBulcrBlcdb+RJZvHcA14Vk4k2D4NDYuhMkAXpnEXC4I0JvcriZQumX4DyczfCx7NTK+mkR4cRrfcB/XemFA292MLk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765451382; c=relaxed/simple;
	bh=CNGxVNdd0BeSWDaYjncbbECd94rZPpRsWPtt8x5bons=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pS1I76KC46rTobW196c+NaemOFMHpoLYB4b3hL7p0/t9yISwxuhARjevs+iKG93F3TP/t+jj+66fbPC5iI/d5hRdENRm2ExDaNRKD7ICLs1kVRGQZtPyjjKQmb970jlM6B3k2sw079jsEMTRYo72r2sL84wrmLKqCy5JGwKuWBY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=B8FajkAt; arc=none smtp.client-ip=209.85.208.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-37a5a3f6bc2so460211fa.1
        for <linux-media@vger.kernel.org>; Thu, 11 Dec 2025 03:09:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1765451378; x=1766056178; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8EyBRZPRp8b/cAnvFkXFeWu8lRTa53gJUQVL0pLmo3o=;
        b=B8FajkAtELrxs2TFpIPtPiu3a0fbprnsErOn74Sacs2QMnXkAj4z5RFh1D54stvvqe
         bgHEd8eTOvgsDRtODkZFge6icsUnwrcvs7iv0iJJmHnypcHlw5lRLqpXEcCECaN3emVi
         yMyf8jcx6M6EpxKN2+mIpZAd2slZWPhtDOg+tdZkcikkQLzxygnRxHNzMwU0PXGy0nsc
         f1IcfJuOVz5kyo9X1bCxagGxg3LYSVBC28GLngIlX3XccsYMdDiWWaHy2iM395Cx5Xan
         AMzlUPF4yqnljWB7lVMBWUs8Hb81aHRa0fvDdhTtRILW9qnx+O0itv8Em6/xsOBH2bbC
         sbqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765451378; x=1766056178;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8EyBRZPRp8b/cAnvFkXFeWu8lRTa53gJUQVL0pLmo3o=;
        b=bxbn49TtCZ71gtsLzqvkFqU9tEQvC+Z0BUIx58Zh90v0UQcYurM4k6EYtJm+UXMRCE
         usF3JVVW8sWqzOY574vMw4vzGxJdxrtq1S7nwJF2XMQcQ/r6eY6pnjM6i6X44lMRghnN
         RD/TUXgRX4azit+jwYVnAPi5HYMizYICr1ET7E5Lqb90GjJwcEcIJl9JL80fdmxIBxkT
         ta1JgMqhAph8d10LUDhZBW0f6twoGvc2c0LgrZBTx1J9sOWRFPorTnokJ7DCBj5EciNO
         2zeZjGlI3Gvl03CuAZm4FziS2tJdAKlrkgopPCiVafBBtmHjT/eAzh1tGTQDsDIzCVgf
         NUAQ==
X-Forwarded-Encrypted: i=1; AJvYcCWHkRMVdSR6z2wjXMozmHiG/TJVY7xxThTcKH3PAHrbsjB7fAAJJwT8tB45OtMFhRe3c5FGZDzedBjWqQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy2uYn5wBAnZkoQkMl4aDLVE41gFcPYXcGk8mumrFWtWzSJwvJj
	UcrlyL/4AxNky6LQX9kNzkrlFSz95XBoSXBMJOfjhCvZmkb66zONvYsoq6MqSg6sbBg=
X-Gm-Gg: AY/fxX6zKWCounEHaGHxAxeHy2b+QRIB4FWfVWefsOQoaCh68SYWDGb9gp2QuwhvXEB
	rNfr6n8RDaNxtvYVn6+K8L8KKYpgefrZjGP9OWh118OucH2A/Gkug9pv5UtfusQlayXpxL7PDVA
	+HHc0b1w+2Xc/jqUIfjYO0SkCtczxN5ts9sI2GjE1obTPYEjguhzkB6utkGmOTKJeOIdzE3x6qC
	3jTNwuMgsApAvFwyzaJSJ7pq4+KNGfXcpxKqyBcCN1gGiUuScY+TEFwwUfU71W+abTv6BhSvYSs
	cxkDQ3vr9Dx/l6YF5m40l0WJH6iVk1J1FdjiRDUvUb+aXzEnnfS4BSQ5JJWo4epL8taI/AkfSSH
	QIwvGzu4J3kFPPyUVafw1nWRnh10HbfDMVsq7dyJCIPjfdcCNl/qZo3y+Zu6A1UHGc2AtNnBVEq
	5waWk+NosUeBvMFXchX6x62Idtpl9nsxilZkxtRX/fpEQhTOMiOmWN9De64ms0z0awnA==
X-Google-Smtp-Source: AGHT+IEVhRY0kPCxpKfnu3mkzNfGXD92o3Dd/PndMoowcESrQWjQ+spldYQtJfLrkziZioOdsCo8Vg==
X-Received: by 2002:a05:6512:3e19:b0:594:5582:f77e with SMTP id 2adb3069b0e04-598ee52a384mr1208087e87.4.1765451378286;
        Thu, 11 Dec 2025 03:09:38 -0800 (PST)
Received: from [192.168.1.100] (91-159-24-186.elisa-laajakaista.fi. [91.159.24.186])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-598f2fa8702sm763706e87.76.2025.12.11.03.09.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 11 Dec 2025 03:09:37 -0800 (PST)
Message-ID: <dbd4c202-5be9-4f18-9413-5c5e50d3db88@linaro.org>
Date: Thu, 11 Dec 2025 13:09:36 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] dt-bindings: media: i2c: Add os05b10 sensor
Content-Language: ru-RU
To: Himanshu Bhavani <himanshu.bhavani@siliconsignals.io>, robh@kernel.org,
 krzk+dt@kernel.org, sakari.ailus@linux.intel.com
Cc: Elgin Perumbilly <elgin.perumbilly@siliconsignals.io>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Hans Verkuil <hverkuil@kernel.org>,
 Hans de Goede <hansg@kernel.org>, Mehdi Djait <mehdi.djait@linux.intel.com>,
 =?UTF-8?Q?Andr=C3=A9_Apitzsch?= <git@apitzsch.eu>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Dongcheng Yan <dongcheng.yan@intel.com>,
 Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
 Sylvain Petinot <sylvain.petinot@foss.st.com>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Jingjing Xiong <jingjing.xiong@intel.com>,
 Svyatoslav Ryhel <clamor95@gmail.com>,
 Heimir Thor Sverrisson <heimir.sverrisson@gmail.com>,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20251211105427.22374-1-himanshu.bhavani@siliconsignals.io>
 <20251211105427.22374-2-himanshu.bhavani@siliconsignals.io>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <20251211105427.22374-2-himanshu.bhavani@siliconsignals.io>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 12/11/25 12:54, Himanshu Bhavani wrote:
> From: Elgin Perumbilly <elgin.perumbilly@siliconsignals.io>
> 
> Add bindings for Omnivision OS05B10 sensor.
> 
> Add MAINTAINERS entry for Omnivision OS05B10 binding documentation
> 
> Signed-off-by: Elgin Perumbilly <elgin.perumbilly@siliconsignals.io>
> Signed-off-by: Himanshu Bhavani <himanshu.bhavani@siliconsignals.io>
> ---
>   .../bindings/media/i2c/ovti,os05b10.yaml      | 103 ++++++++++++++++++
>   MAINTAINERS                                   |   7 ++
>   2 files changed, 110 insertions(+)
>   create mode 100644 Documentation/devicetree/bindings/media/i2c/ovti,os05b10.yaml
> 
> diff --git a/Documentation/devicetree/bindings/media/i2c/ovti,os05b10.yaml b/Documentation/devicetree/bindings/media/i2c/ovti,os05b10.yaml
> new file mode 100644
> index 000000000000..b16e5333b1ec
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/i2c/ovti,os05b10.yaml
> @@ -0,0 +1,103 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/media/i2c/ovti,os05b10.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: OmniVision OS05B10 Image Sensor
> +
> +maintainers:
> +  - Elgin Perumbilly <elgin.perumbilly@siliconsignals.io>
> +
> +description:
> +  The OmniVision OS05B10 is a 5MP (2592x1944) color CMOS image sensor controlled
> +  through an I2C-compatible SCCB bus. it outputs RAW10/RAW12 format and uses a
> +  1/2.78"optical format.

A space symbol is missing before 'optical'.

> +
> +properties:
> +  compatible:
> +    const: ovti,os05b10
> +
> +  reg:
> +    maxItems: 1
> +
> +  clocks:
> +    items:
> +      - description: XCLK clock
> +
> +  avdd-supply:
> +    description: Analog Domain Power Supply
> +
> +  dovdd-supply:
> +    description: I/O Domain Power Supply
> +
> +  dvdd-supply:
> +    description: Digital Domain Power Supply
> +
> +  reset-gpios:
> +    maxItems: 1
> +    description: Reset Pin GPIO Control (active high)

If you have access to datasheet, what does it say about the reset GPIO?

It's very uncommon to see an active high GPIO here, most likely it
shoud be changed to active low.

> +
> +  port:
> +    description: MIPI CSI-2 transmitter port
> +    $ref: /schemas/graph.yaml#/$defs/port-base
> +    additionalProperties: false
> +
> +    properties:
> +      endpoint:
> +        $ref: /schemas/media/video-interfaces.yaml#
> +        unevaluatedProperties: false
> +
> +        properties:
> +          data-lanes:
> +            oneOf:
> +              - items:
> +                  - const: 1
> +                  - const: 2
> +                  - const: 3
> +                  - const: 4
> +              - items:
> +                  - const: 1
> +                  - const: 2
> +        required:
> +          - data-lanes
> +          - link-frequencies
> +
> +required:
> +  - compatible
> +  - reg
> +  - clocks
> +  - avdd-supply
> +  - dovdd-supply
> +  - dvdd-supply
> +  - port
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/gpio/gpio.h>
> +
> +    i2c {
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +
> +        camera-sensor@36 {
> +            compatible = "ovti,os05b10";
> +            reg = <0x36>;
> +            clocks = <&os05b10_clk>;
> +            reset-gpios = <&gpio1 7 GPIO_ACTIVE_HIGH>;
> +
> +            avdd-supply = <&os05b10_avdd_2v8>;
> +            dvdd-supply = <&os05b10_dvdd_1v2>;
> +            dovdd-supply = <&os05b10_dovdd_1v8>;
> +
> +            port {
> +                cam_out: endpoint {
> +                    remote-endpoint = <&mipi_in_cam>;
> +                    data-lanes = <1 2 3 4>;
> +                    link-frequencies = /bits/ 64 <600000000>;
> +                };
> +            };
> +        };
> +    };
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 663e86eb9ff1..c85915d5d20e 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -19234,6 +19234,13 @@ T:	git git://linuxtv.org/media_tree.git
>   F:	Documentation/devicetree/bindings/media/i2c/ovti,og0ve1b.yaml
>   F:	drivers/media/i2c/og0ve1b.c
>   
> +OMNIVISION OS05B10 SENSOR DRIVER
> +M:	Himanshu Bhavani <himanshu.bhavani@siliconsignals.io>
> +M:	Elgin Perumbilly <elgin.perumbilly@siliconsignals.io>
> +L:	linux-media@vger.kernel.org
> +S:	Maintained
> +F:	Documentation/devicetree/bindings/media/i2c/ovti,os05b10.yaml
> +
>   OMNIVISION OV01A10 SENSOR DRIVER
>   M:	Bingbu Cao <bingbu.cao@intel.com>
>   L:	linux-media@vger.kernel.org

-- 
Best wishes,
Vladimir

