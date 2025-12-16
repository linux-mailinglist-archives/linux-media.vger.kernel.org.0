Return-Path: <linux-media+bounces-48837-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 23EAFCC0759
	for <lists+linux-media@lfdr.de>; Tue, 16 Dec 2025 02:29:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C39F8301919F
	for <lists+linux-media@lfdr.de>; Tue, 16 Dec 2025 01:28:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 81EBF27A907;
	Tue, 16 Dec 2025 01:28:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="t5jDhLsg"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lj1-f194.google.com (mail-lj1-f194.google.com [209.85.208.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12D5222B8C5
	for <linux-media@vger.kernel.org>; Tue, 16 Dec 2025 01:28:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765848526; cv=none; b=JxzRFQFJu2z/ULU1mGkkE00x0guQH8IKrN5T3lgdnJvqAZAqVeFigdT1qS/uXbGjVOLTlec6B5eIpoj+TA061YrWPJg/DPB6q75z4uZjzMPpBLpF8pi7SXbxVYweQMRfNk2JY8/1Irwdouo/N+PID7Y6un7XId8aJVgXtXduzm8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765848526; c=relaxed/simple;
	bh=hJQUyd/Tffm4SCpUfbJx2EUwKEwz+GfXfQplQOV4Cwc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dsFm5sFso4NrHEOrxjERsCU5O1R5BlR42yy+5ci/lTxBPVr0W2tuQKoz1jS1pU5OG2GHqC6eVZkbqgondU6LVwnTp+OGsAamqRbZks2swy/q1Km4cinEKR9CsbVsebiX/MzWdEhFkpk/ujuZp5Ds/CbTwCyzwac+peXx8amLTkM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=t5jDhLsg; arc=none smtp.client-ip=209.85.208.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f194.google.com with SMTP id 38308e7fff4ca-37f8cc9a9feso5251951fa.0
        for <linux-media@vger.kernel.org>; Mon, 15 Dec 2025 17:28:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1765848523; x=1766453323; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VoJUokXplFCLaNhrWfSaomcCO83EZ2+r6h6vZ/nLX9k=;
        b=t5jDhLsgEA/rYzJhUflhqs0LBDv3oknYr3gYAVKml1h5BtX9Y3Nzv7sB4hCLc/KY3M
         1Soz5w6tGXad08wVZTm3HnPHQXqBdMN8OpvqBZqwcGmS76YFEal/BlnrJ611LuBMsFR3
         +YIZODWtWa6pPYaxcEndzI4SJma5w/0TRwVXWZ0DX2CN9mFToKLaH3CryF1EoJVS5RUM
         E9uJpBqb7kUVQCnEegos9iguzzEZgoBzDgQS3t67f7H5GZ7PFYJDX41lTbYaDJO4i4pd
         jm/KQAwxLGI8KWDkzn46TnQpSPbdTe5THDFuxtZ0C9fHvpLPGGpkTDSaZQkUtJ9gAhww
         46Lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765848523; x=1766453323;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=VoJUokXplFCLaNhrWfSaomcCO83EZ2+r6h6vZ/nLX9k=;
        b=ZMNDpxzEbvK+q7p+2SwMSvdkJTdPLYE8M13RhKyBxCwDxX5I4mCsK4efckhK5loPMj
         2SYwYiTJLTY0p6dwcaaAnQP9tyJ5fQoqQ+e8EuFoKkM+t85Y4Mz3hmdim9W3PhiE9Lhd
         AuV5gsFFsWxkVKiy7RbPFrkwN+mtmlxLcFGVl5JyDZzwsCg/XsSZuml8LARPaRkZ61+c
         gg+WGJ8pN4/nayjMTx83F7Jz4tnH4gqSQDRnThSlONPaMBdiJ2JUJmGNzBRbaBf4lrmO
         BVyBGGSlWk2O3Th8vWsUPGIlG+UPqdkl0Po3fzUh7HYVQjDWNA6Yv/LOlWY6rafzGfxb
         mbHg==
X-Forwarded-Encrypted: i=1; AJvYcCX7LkKcpou2mbLHyY9AUGD2g25JrpH083vaEKMQFFMrb8F8iRZCHwGucXVXBnxzpRfSdX+pZeUzKTvkzw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwSBrTcVxV59WgyPUwlnQsNF9YQ8Axi0wWAqSMr56PlPD0pDepB
	LeZGFRqjcpZ9RmdrGpOWGipchx99yCe7EyFo/SZQQBtBFBd2G1JfLGJKWHJpl1jKrO0=
X-Gm-Gg: AY/fxX6DX4D+EfScO3SVQrQvnDkdQ7b56axySAhbg7/XPZqeX5l8ubfAeKnCGUOURw3
	GEngoQnn0IVlr1d39zC/c6TzTP3TzQH4eibnVAwvBIag+S8oDdwpe9KY8QtgVrIbpZ+lQE2UKBf
	p2zaL0iohEg6SGQNl0JfAZ6hZ304ZfnMbmtC99JsDc1MUrG8CKByu3Lnhbu1XjkZvNsaa8OmgcY
	Dw0XRjcxEP1PFukILo8FiUWghbJtmlBYdmjOdTA/hnSF4b5Zxna3TfNNUy86wV5ZIIsZmnR4XAN
	+a1YoEp66Bvob8wh5XPUjhDaTnmhJjVd65FE92VvSmSVRddRvRznsKDUUh8fz8s5KMdzMLMjXga
	C0p/5De2MQh/hOinRfrdYgN/CZEyVjfPGr/izy/eBJLerOR7dv1sCggtNbFut5UrdTxtBlOovtE
	hHsnOfb1TmtvhuWoIOEeDPW2m5fI6Jb3argTP3l1J9ybF5uw29sfRAxFn0QVbBelp9kQ==
X-Google-Smtp-Source: AGHT+IHC8WNjiPU6d4sbijzNDiCXOegmWUkXuJiGVWiO79To/fTnH5v2SJuBpVOneaerqNjbtzcoAA==
X-Received: by 2002:a05:651c:2122:b0:37f:aa44:2d2c with SMTP id 38308e7fff4ca-37fd08cfc7cmr20712321fa.6.1765848522995;
        Mon, 15 Dec 2025 17:28:42 -0800 (PST)
Received: from [192.168.1.100] (91-159-24-186.elisa-laajakaista.fi. [91.159.24.186])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-37fdee05961sm31751041fa.44.2025.12.15.17.28.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 15 Dec 2025 17:28:41 -0800 (PST)
Message-ID: <ea9371e6-f986-46df-9200-b2f009c09773@linaro.org>
Date: Tue, 16 Dec 2025 03:28:39 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/2] dt-bindings: media: i2c: Add os05b10 sensor
To: Himanshu Bhavani <himanshu.bhavani@siliconsignals.io>, robh@kernel.org,
 krzk+dt@kernel.org, sakari.ailus@linux.intel.com
Cc: Elgin Perumbilly <elgin.perumbilly@siliconsignals.io>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Hans Verkuil <hverkuil@kernel.org>,
 Hans de Goede <hansg@kernel.org>, Mehdi Djait <mehdi.djait@linux.intel.com>,
 Arnd Bergmann <arnd@arndb.de>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 =?UTF-8?Q?Andr=C3=A9_Apitzsch?= <git@apitzsch.eu>,
 Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
 Sylvain Petinot <sylvain.petinot@foss.st.com>,
 Dongcheng Yan <dongcheng.yan@intel.com>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Jingjing Xiong <jingjing.xiong@intel.com>,
 Heimir Thor Sverrisson <heimir.sverrisson@gmail.com>,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20251215153932.46276-1-himanshu.bhavani@siliconsignals.io>
 <20251215153932.46276-2-himanshu.bhavani@siliconsignals.io>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <20251215153932.46276-2-himanshu.bhavani@siliconsignals.io>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 12/15/25 17:39, Himanshu Bhavani wrote:
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
> index 000000000000..b76771d81851
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
> +  1/2.78" optical format.
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
> +    description: Analog Domain Power Supply (2.8v)
> +
> +  dovdd-supply:
> +    description: I/O Domain Power Supply (1.8v)
> +
> +  dvdd-supply:
> +    description: Digital Domain Power Supply (1.2v)
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
> +            reset-gpios = <&gpio1 7 GPIO_ACTIVE_LOW>;
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

Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>

-- 
Best wishes,
Vladimir

