Return-Path: <linux-media+bounces-36129-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B0A2DAEBD79
	for <lists+linux-media@lfdr.de>; Fri, 27 Jun 2025 18:33:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7FF853AAF27
	for <lists+linux-media@lfdr.de>; Fri, 27 Jun 2025 16:31:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C6ADE2EA174;
	Fri, 27 Jun 2025 16:32:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="GCgxnjsx"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48BC51D5CDE
	for <linux-media@vger.kernel.org>; Fri, 27 Jun 2025 16:31:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751041920; cv=none; b=bMBTtzyRgkum1qjc9BZSZUQxrH/z7nS9hK7TVLw86xD436omcdu+49ipiR00PV6uPlaIkjDdTbqVJWWji0pdWkzCcQ+LK+w7G/bCtbK0S2uo2HFBincgMOCRGiOL64B03CbQGnY37c/UvKXmnBKKNLUT39ci58O0SvQvBj7FAeY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751041920; c=relaxed/simple;
	bh=2aKPijUb3QIgGtXpLIncOT7+Mp6HTomzuFIkAXZ6ITQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tJSAcReGguIi+noqDK8HjqcbLkWEpN5jmgQ9UCgkJ2Kq0ITSVzFCmQb1jo1SWayX237ra5GfGNyTaVEMEgNuy5Em7tYewTBmsfNKn7UqL/YsIdZEOPxKe8cl56r3A/+smXsknPmTbik2Da0y7YcTft5JFtZPdhlYj+ODKvKfMM8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=GCgxnjsx; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-453398e90e9so626255e9.1
        for <linux-media@vger.kernel.org>; Fri, 27 Jun 2025 09:31:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1751041916; x=1751646716; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=b2cPm3js68sdrcbLc8BpXjVvreewHklz7Uoe+S4MGck=;
        b=GCgxnjsxYIOYb3nWKBhwQkNOnR5nmtb1hJfB1l/1XwAI+Isj4z85xSv2sR/vZWuo2h
         mQuydtvQZkGgL0Y9MjuW4bewIk3xBt/CLCoyZA4xhRAQDujnhuXAzn+F378JCmV+H6U6
         ajdI2cBG7hxoRKWgm5paFNPyVcXdjCr1/Q4j+452C5RKEoHYNNhmZpieW4GgCDDjfDGs
         3hIesvPy+1+ZwaabnH0Q88qXZFVFerCjFZlwZWD8EoQYtLcdw+xcgquuw6H6czJoNxcR
         tLBqAy9Mh+gjUONE0tBc8HbWRLSdK4Tyxbu3rUW9NMlIgrYweQ/DhvrtMZdDTWAs0vtM
         +IIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751041916; x=1751646716;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=b2cPm3js68sdrcbLc8BpXjVvreewHklz7Uoe+S4MGck=;
        b=tMwk1uIMRf2dha3UQp2Yc01/fZpyp3OY6cMxKSj+0DXe8RjM0QNo3VNzpiA2PyjxsI
         Yej9xIX9uRPETA4e01tLqg1tiMKWVr18GnNMW6jOjqaYYimEEE7pdSe9n+74C4sXQYLp
         kAFa8s5MV/KxWqJsVPNZ81zugiXI4dPqSg7A/yvP5nlas3L2iC9ljMvhEUAJraNew6zX
         rsduOd0+iJLUyor2JZO9D7kg1P9SeryDBZRJ6zNxztUmRvrwHXqxN77m+JBDUXM+nKDp
         yalPi1xsY9XCuG1tas6xmPHQn0SqKFjeJLu+uKXZWCiXeuEhh/6QHuM4tuP3r+ENmUcO
         ob3w==
X-Gm-Message-State: AOJu0YwtBfI9gF2v6zW7jcWYF3UocHqwZqqc6dWUkwVIBfYXaSCTJIZs
	Pf1rU6tX58FvP6RUoPdbtpgKKdRC4wjRnvAXs9RzMijh5k+wJB3ZnadnBIFvKs9F4ps=
X-Gm-Gg: ASbGncu6HMTTng8pWbv8oBVIARqDEJZp2OgoOXZEzT49he0P0GJqiDAWF7xN3cOZUkK
	PvATPN+CXqCbs/u4GaGvaQzV465fbqMNMJp6YPg84T9OKVMRxMuUa/PUvUeoYmyxWDUsM+L5nWl
	12xOA7TIBmL2B6Q2GJhjk+N4nNqWSxQaPCL/Y9lc+0BczDiga0AmcKrvF+jAGFHCNgDWw9h3UUO
	QBA80pBte31yu8Jss3j+0EtNc3IYpjDUyibXxIVAt8K+AIR/PAvni6a5eQXyeKV/7vH6nUUITDv
	Eqs07sjbQVlz1fA5TKoez9pqrQi7eakkGrWz6AnVLNpamcIpqUTaneNO1pzoQuM9oV/YYc4mXDK
	2SMe8+SN6GDc67E6PNvvk97owqbs=
X-Google-Smtp-Source: AGHT+IGcrhSInexhP9+glXgd5+9IZfwvB+FowKiaT032v77elhBzd1dbReORt/pjYxik8VzqpRI8Mg==
X-Received: by 2002:a05:6000:2183:b0:3a6:d967:380c with SMTP id ffacd0b85a97d-3a8fe5b1d42mr3260611f8f.36.1751041916428;
        Fri, 27 Jun 2025 09:31:56 -0700 (PDT)
Received: from [192.168.0.35] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a88c80b5aesm3080728f8f.44.2025.06.27.09.31.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Jun 2025 09:31:55 -0700 (PDT)
Message-ID: <5dcc3dc3-ba12-4d66-88e9-5e06bb707135@linaro.org>
Date: Fri, 27 Jun 2025 17:31:54 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/5] media: dt-bindings: add non-pixel property in iris
 schema
To: Vikash Garodia <quic_vgarodia@quicinc.com>,
 Dikshita Agarwal <quic_dikshita@quicinc.com>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250627-video_cb-v3-0-51e18c0ffbce@quicinc.com>
 <20250627-video_cb-v3-1-51e18c0ffbce@quicinc.com>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20250627-video_cb-v3-1-51e18c0ffbce@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 27/06/2025 16:48, Vikash Garodia wrote:
> Existing definition limits the IOVA to an addressable range of 4GiB, and
> even within that range, some of the space is used by IO registers,
> thereby limiting the available IOVA to even lesser. Video hardware is
> designed to emit different stream-ID for pixel and non-pixel buffers,
> thereby introduce a non-pixel sub node to handle non-pixel stream-ID.
> 
> With this, both iris and non-pixel device can have IOVA range of 0-4GiB
> individually. Certain video usecases like higher video concurrency needs
> IOVA higher than 4GiB.
> 
> Add reference to the reserve-memory schema, which defines reserved IOVA
> regions that are *excluded* from addressable range. Video hardware
> generates different stream IDs based on the predefined range of IOVA
> addresses. Thereby IOVA addresses for firmware and data buffers need to
> be non overlapping. For ex. 0x0-0x25800000 address range is reserved for
> firmware stream-ID, while non-pixel (bitstream) stream-ID can be
> generated by hardware only when bitstream buffers IOVA address is from
> 0x25800000-0xe0000000.
> Non-pixel stream-ID can now be part of the new sub-node, hence iommus in
> iris node can have either 1 entry for pixel stream-id or 2 entries for
> pixel and non-pixel stream-ids.
> 
> Signed-off-by: Vikash Garodia <quic_vgarodia@quicinc.com>
> ---
>   .../bindings/media/qcom,sm8550-iris.yaml           | 40 ++++++++++++++++++++--
>   1 file changed, 38 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/media/qcom,sm8550-iris.yaml b/Documentation/devicetree/bindings/media/qcom,sm8550-iris.yaml
> index c79bf2101812d83b99704f38b7348a9f728dff44..4dda2c9ca1293baa7aee3b9ee10aff38d280fe05 100644
> --- a/Documentation/devicetree/bindings/media/qcom,sm8550-iris.yaml
> +++ b/Documentation/devicetree/bindings/media/qcom,sm8550-iris.yaml
> @@ -65,10 +65,31 @@ properties:
>         - const: core
>   
>     iommus:
> +    minItems: 1
>       maxItems: 2
>   
>     dma-coherent: true
>   
> +  non-pixel:
> +    type: object
> +    additionalProperties: false
> +
> +    description:
> +      Non pixel context bank is needed when video hardware have distinct iommus
> +      for non pixel buffers. Non pixel buffers are mainly compressed and
> +      internal buffers.

You do a better job in the cover letter of describing what this is, why 
its needed etc.

Not asking for this verbatim but its clearer:

"All non pixel buffers, i.e bitstream, HFI queues
and internal buffers related to bitstream processing, would be managed
by this non_pixel device."

Where does the term "non-pixel" come from if its a meaningful name wrt 
to the firmware then non-pixel is fine but, consider a name such as 
"out-of-band" or "oob"

out-of-band is a common term as is "sideband" but sideband I think has a 
different meaning, really this non-data/non-pixel data stuff is out-of-band.

At least for the way the language pack I have installed in my brain 
right now, "oob" or "out-of-band" is a more intuitive name. Its really 
up to you though the main point would be to enumerate the description 
here with some of the detail you've put into the cover letter.

> +
> +    properties:
> +      iommus:
> +        maxItems: 1
> +
> +      memory-region:
> +        maxItems: 1
> +
> +    required:
> +      - iommus
> +      - memory-region
> +
>     operating-points-v2: true

>     opp-table:
> @@ -86,6 +107,7 @@ required:
>   
>   allOf:
>     - $ref: qcom,venus-common.yaml#
> +  - $ref: /schemas/reserved-memory/reserved-memory.yaml
>     - if:
>         properties:
>           compatible:
> @@ -117,6 +139,16 @@ examples:
>       #include <dt-bindings/power/qcom-rpmpd.h>
>       #include <dt-bindings/power/qcom,rpmhpd.h>
>   
> +    reserved-memory {
> +      #address-cells = <2>;
> +      #size-cells = <2>;
> +
> +      iris_resv: reservation-iris {
> +        iommu-addresses = <&iris_non_pixel 0x0 0x0 0x0 0x25800000>,
> +                          <&iris_non_pixel 0x0 0xe0000000 0x0 0x20000000>;
> +      };
> +    };

iris_oob would be less text in the end.

> +
>       video-codec@aa00000 {
>           compatible = "qcom,sm8550-iris";
>           reg = <0x0aa00000 0xf0000>;
> @@ -144,12 +176,16 @@ examples:
>           resets = <&gcc GCC_VIDEO_AXI0_CLK_ARES>;
>           reset-names = "bus";
>   
> -        iommus = <&apps_smmu 0x1940 0x0000>,
> -                 <&apps_smmu 0x1947 0x0000>;
> +        iommus = <&apps_smmu 0x1947 0x0000>;
>           dma-coherent;
>   
>           operating-points-v2 = <&iris_opp_table>;
>   
> +        iris_non_pixel: non-pixel {
> +            iommus = <&apps_smmu 0x1940 0x0000>;
> +            memory-region = <&iris_resv>;
> +        };
> +
>           iris_opp_table: opp-table {
>               compatible = "operating-points-v2";
>   
> 

So I was trying to think of a way to catch you out with an ABI break 
but, I don't see how you add minItems: 1 to the iommus declaration above 
so dts prior to this change should still be valid.

I think this adds up but, consider oob instead of non-pixel.

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

---
bod

