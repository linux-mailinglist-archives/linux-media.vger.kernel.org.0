Return-Path: <linux-media+bounces-64679-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id PVdLGbvTK2plFwQAu9opvQ
	(envelope-from <linux-media+bounces-64679-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 12 Jun 2026 11:39:07 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id B9CEB678610
	for <lists+linux-media@lfdr.de>; Fri, 12 Jun 2026 11:39:06 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=linaro.org header.s=google header.b=Bcu6JEGT;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-64679-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-media+bounces-64679-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=linaro.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id AF71A3180326
	for <lists+linux-media@lfdr.de>; Fri, 12 Jun 2026 09:36:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3ED463A9851;
	Fri, 12 Jun 2026 09:36:05 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 981A33A6B6A
	for <linux-media@vger.kernel.org>; Fri, 12 Jun 2026 09:35:59 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781256963; cv=none; b=fKLfmexIBVyTuR4xFczuVjBP3WcWJun55OmCbIMudN5e/LL9vFsMgw7l3kHZHWWR2InAl9XomGngQph0SiS0ZCNXkavktGy9QuvGvP2u0tgHUAuh0M/+3jSMThu2mHsS/4OrIX0vyjcBmDixnCHU6PghO82Eit0rEkUeiAw39oE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781256963; c=relaxed/simple;
	bh=yc6AQIpTFzCK3Amfe19dBLsBJQvdflaZ7/6J7NBajWs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=uliYIFS4kTnTbwc9jhzNQ2/9xZ0gPYlWkSF2FulGBwM1HORc1nRlebrq5WJN0noYSzIiC3JCkbA79C3LmNwOQl8zc2gkMsU0bRtp4QN6QZDH7MY2ra7cdPBJkqAIkBnR+AXEOywOeQyCtAMpy9jK2tY5k/tl+4xZnqleeFYpDiA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Bcu6JEGT; arc=none smtp.client-ip=209.85.208.169
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-39667fd6773so270301fa.2
        for <linux-media@vger.kernel.org>; Fri, 12 Jun 2026 02:35:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1781256958; x=1781861758; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TrPR7xSpOuZlmh+JGym7wD7YJj4NLuArxxQbY8dlBkg=;
        b=Bcu6JEGT2wnF5anHE/oXCjFVFN7qm+GhLpR5wfrTVEiBDWB0wjTAJMMtE6eHqfA7Lp
         H0XBBEZPnVB7ifYhwrg6v3Etd6LbwCeyO62JHmdU7WKDtaU6rKWB1B9FvbNkAs1l6qsB
         6VmU55TjaKOM9ul0udMSu2s0fhXDG6QEGAvSq6gXI0VO+xezLNd5Mb0kvV0nydjjfeQB
         jEA+KqXheDOsiZECcYOhwPNiqW8Lwm62DDcAcp/TmsnTHJSBQSo+zM0ME4SzsVyz9Lq6
         gJEyWrwCUY5OrVlNZ80zHUEDHwFcIR982s9acA/CwdALu0wJKMoRiHop4BNXI7AVGxYr
         EkEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781256958; x=1781861758;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=TrPR7xSpOuZlmh+JGym7wD7YJj4NLuArxxQbY8dlBkg=;
        b=cAa+WehaE8abcSGJhCdLT36CedmXAGrJWb2wDSSIZKMp5TOlk9knofyFVfN8ussCKx
         +HLO4Y8qEDwY3kPA84k4iCXuEXRlPtxyL2Gnu04pEUA14M7Q+ebd8e9Kblj5FCcFgTNU
         Z70FbJcuwq6qrVkUTGkuN24wlWlvmBPvopg+3KueSbeY4UoL7bMqZ8jjTBk6yaN8dzWB
         G3bMDwb7FtkIwpr3Aq9mPUpg5npC69CuIig/rRL8Dbi+Yw6RSmtSvbKCFYAoGGkJ88wA
         zgWVoahDTpAAmDgbLgA51jqBi2RxcTL8uMP64feJk/zucTw/DnJf9C+7AupTN3LL/ma5
         7IIQ==
X-Forwarded-Encrypted: i=1; AFNElJ/1GvWcWNlV1NHAUgDHAKsHJ+F8iCsUcYZUDZmSarnCSwN9Oesd/UElUe0xklEcVHHH1hVaQzEh2s/pRA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyOCFlpiT0zhQ8aQJu8YEOvmUhy2+fJd/+o8kaeLvNHrzdRtPe9
	R5qkw5cVwzcCMchbgTTYNOXyCFnF0WKCKIF7Q9Al39FFQPrb1bH44yzrgm1eFD/TLB8=
X-Gm-Gg: Acq92OG3MTjEfPo1k6UFPLb7ILxSGZVFGlQ69Ob4pZwOQr9+xO27FRLJEwAbHCMwfv0
	4MGwxLp9JtIE5ekKDNLmN2vbl2wTkqYgRSsdmOfbDS21Pp0PWW+7jF7R4L/UELdxQkdgMGmnnmL
	qQA8TKiVns2k6cdnVjXnK9F468LA9OoMCPAB66jzIKZ6dhGDfueXhxDPMAkIhZ9evFDw+Eg0Tsf
	GethWNjCcvzbsW0wZminpgMJtdatb3MAZO5Yp6cEyE3w27AvY14c4zAi6cOeItZc1sZA+KLWQcV
	5oMObzvKWVx5dOBKwSI2sT7tDUGkJNN2tzHIQKTWXWZduKuaJ9xzwSJIqawsd2NW4omw4PwB9nn
	iIO4AYn9GSc2wtgArHiKrlkGAnyvUIa4ndtimTO4kmaPtRlu9TXNBXARESeA4q5jQ93nVf1Z+/d
	EWdSxVJ63jC30lgVlVntaeUd3+W7ifYCVXBjolJEpAx/reCBEPvx2ozPm7TqjYQqxaty/+vTtPo
	pVxvw==
X-Received: by 2002:a2e:bcc1:0:b0:393:d08b:2a0c with SMTP id 38308e7fff4ca-3992af6b7a2mr3254381fa.2.1781256957642;
        Fri, 12 Jun 2026 02:35:57 -0700 (PDT)
Received: from [192.168.1.100] (91-159-24-186.elisa-laajakaista.fi. [91.159.24.186])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-39929f6b879sm4890051fa.38.2026.06.12.02.35.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 12 Jun 2026 02:35:56 -0700 (PDT)
Message-ID: <7fd98a2f-2a5c-46bc-a819-14801780a448@linaro.org>
Date: Fri, 12 Jun 2026 12:35:56 +0300
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/3] dt-bindings: media: i2c: Add os02g10 sensor
To: Elgin Perumbilly <elgin.perumbilly@siliconsignals.io>,
 sakari.ailus@linux.intel.com, laurent.pinchart@ideasonboard.com
Cc: Tarang Raval <tarang.raval@siliconsignals.io>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Hans Verkuil <hverkuil+cisco@kernel.org>,
 Hans de Goede <johannes.goede@oss.qualcomm.com>,
 Mehdi Djait <mehdi.djait@linux.intel.com>,
 Sylvain Petinot <sylvain.petinot@foss.st.com>,
 Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
 Svyatoslav Ryhel <clamor95@gmail.com>,
 Hardevsinh Palaniya <hardevsinh.palaniya@siliconsignals.io>,
 Himanshu Bhavani <himanshu.bhavani@siliconsignals.io>,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260424092554.26130-1-elgin.perumbilly@siliconsignals.io>
 <20260424092554.26130-2-elgin.perumbilly@siliconsignals.io>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <20260424092554.26130-2-elgin.perumbilly@siliconsignals.io>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[lists@lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[19];
	TAGGED_FROM(0.00)[bounces-64679-lists,linux-media=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:elgin.perumbilly@siliconsignals.io,m:sakari.ailus@linux.intel.com,m:laurent.pinchart@ideasonboard.com,m:tarang.raval@siliconsignals.io,m:mchehab@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:hverkuil+cisco@kernel.org,m:johannes.goede@oss.qualcomm.com,m:mehdi.djait@linux.intel.com,m:sylvain.petinot@foss.st.com,m:benjamin.mugnier@foss.st.com,m:clamor95@gmail.com,m:hardevsinh.palaniya@siliconsignals.io,m:himanshu.bhavani@siliconsignals.io,m:linux-media@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,m:hverkuil@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[vladimir.zapolskiy@linaro.org,linux-media@vger.kernel.org];
	FREEMAIL_CC(0.00)[siliconsignals.io,kernel.org,oss.qualcomm.com,linux.intel.com,foss.st.com,gmail.com,vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[vladimir.zapolskiy@linaro.org,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[linaro.org:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt,cisco];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,linaro.org:dkim,linaro.org:email,linaro.org:mid,linaro.org:from_mime,devicetree.org:url,siliconsignals.io:email,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: B9CEB678610

On 4/24/26 12:25, Elgin Perumbilly wrote:
> Add bindings for Omnivision OS02G10 sensor.
> 
> Signed-off-by: Elgin Perumbilly <elgin.perumbilly@siliconsignals.io>
> ---
>   .../bindings/media/i2c/ovti,os02g10.yaml      | 91 +++++++++++++++++++
>   MAINTAINERS                                   |  7 ++
>   2 files changed, 98 insertions(+)
>   create mode 100644 Documentation/devicetree/bindings/media/i2c/ovti,os02g10.yaml
> 
> diff --git a/Documentation/devicetree/bindings/media/i2c/ovti,os02g10.yaml b/Documentation/devicetree/bindings/media/i2c/ovti,os02g10.yaml
> new file mode 100644
> index 000000000000..252059459390
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/i2c/ovti,os02g10.yaml
> @@ -0,0 +1,91 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/media/i2c/ovti,os02g10.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: OmniVision OS02G10 Image Sensor
> +
> +maintainers:
> +  - Tarang Raval <tarang.raval@siliconsignals.io>
> +
> +description:
> +  The OmniVision OS02G10 is a 2MP (1920x1080) color CMOS image sensor controlled
> +  through an I2C-compatible SCCB bus. It outputs RAW10 format data and supports
> +  a 2-lane MIPI interface.
> +
> +properties:
> +  compatible:
> +    const: ovti,os02g10
> +
> +  reg:
> +    maxItems: 1
> +
> +  clocks:
> +    items:
> +      - description: XCLK clock
> +
> +  avdd-supply:
> +    description: Analog Domain Power Supply (2.8v)
> +
> +  dovdd-supply:
> +    description: I/O Domain Power Supply (1.8v)
> +
> +  dvdd-supply:
> +    description: Digital core Power Supply (1.5v)
> +
> +  reset-gpios:
> +    maxItems: 1
> +    description: Reset Pin GPIO Control (active low)
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
> +        required:
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
> +        camera-sensor@3c {
> +            compatible = "ovti,os02g10";
> +            reg = <0x3c>;
> +            clocks = <&os02g10_clk>;
> +            reset-gpios = <&gpio1 7 GPIO_ACTIVE_LOW>;
> +
> +            avdd-supply = <&os02g10_avdd_2v8>;
> +            dvdd-supply = <&os02g10_dvdd_1v2>;
> +            dovdd-supply = <&os2gb10_dovdd_1v8>;
> +
> +            port {
> +                cam_out: endpoint {
> +                    remote-endpoint = <&mipi_in_cam>;
> +                    data-lanes = <1 2>;
> +                    link-frequencies = /bits/ 64 <720000000>;
> +                };
> +            };
> +        };
> +    };
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 900fc00b73e6..8a0a55073c30 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -19443,6 +19443,13 @@ T:	git git://linuxtv.org/media_tree.git
>   F:	Documentation/devicetree/bindings/media/i2c/ovti,og0ve1b.yaml
>   F:	drivers/media/i2c/og0ve1b.c
> 
> +OMNIVISION OS02G10 SENSOR DRIVER
> +M:	Tarang Raval <tarang.raval@siliconsignals.io>
> +M:	Elgin Perumbilly <elgin.perumbilly@siliconsignals.io>
> +L:	linux-media@vger.kernel.org
> +S:	Maintained
> +F:	Documentation/devicetree/bindings/media/i2c/ovti,os02g10.yaml
> +
>   OMNIVISION OS05B10 SENSOR DRIVER
>   M:	Himanshu Bhavani <himanshu.bhavani@siliconsignals.io>
>   M:	Elgin Perumbilly <elgin.perumbilly@siliconsignals.io>
> --
> 2.34.1
> 

Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>

-- 
Best wishes,
Vladimir

