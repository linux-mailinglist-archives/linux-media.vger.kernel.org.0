Return-Path: <linux-media+bounces-24121-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 11C3C9FD0FA
	for <lists+linux-media@lfdr.de>; Fri, 27 Dec 2024 08:20:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AD42E3A0651
	for <lists+linux-media@lfdr.de>; Fri, 27 Dec 2024 07:20:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DF57D13665A;
	Fri, 27 Dec 2024 07:20:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="WGF1VaZl"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D2EE45C14
	for <linux-media@vger.kernel.org>; Fri, 27 Dec 2024 07:20:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735284023; cv=none; b=AmOVPrLQmB2pCmgVzkIksFc2OH8bip/iLRzyNv2Z5KpXdaZggmTeyQ+sG/74hPRCzZmNrgSwE0qOKgceZXZtRUG9+B5X7jIxJUsZ/HrjE7W32dMd2t1t1ZwwKimQYRA+NMWNH97HcqjjUJZnxGWcLLqlOVMma9yUg34jBVDKM6k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735284023; c=relaxed/simple;
	bh=wY/QvHNIVtnbu6h2rDswH2OCZY06zeitq3xg8gtPS48=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=IZps8zZcLn0ZeovVpDlJk52b5eloX+ady6yMg8MNEIOQtEbJ6TpiOQ5FipjiMMpP0Bfmv8qMJfW7dSk5wFsXICMUQ0saWFthZyU5+bLoKmegWjWZ4JtzNAT4ztNGRizhrhEG59OY/EmIlBL94orGu6N8jgFNifUyAjUyRVxpags=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=WGF1VaZl; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-3862e570832so860024f8f.0
        for <linux-media@vger.kernel.org>; Thu, 26 Dec 2024 23:20:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1735284020; x=1735888820; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=VXAJa9FIW33aWA+s0k664EUsn4laTLVqXCPlW15NvKU=;
        b=WGF1VaZlXUMFmmuJlKMcFgIUlR4nsJ++hjm5fQsAGpWbqUsofqYZDGzmL+MHkqxBB4
         0ZiucE6glaqiMfnhBrzQ+EiqBc3N9VGe7VAGFfEnqR+/beheLJcHCz99Rc0vi1mkXPk/
         eE0tP94gi9dIWs95nsX5Pes4RBQsctgYCvhLECQLiW1zVnf1U2ztgPJ6vfD+6fC4VaJy
         AV/gp7+pXkM9qb2Zv4y6EIhhmWxk77cZ3vQJE/Wz2tP0ltugb2uz0kjAw61a5tgHIYa2
         1y8OGrQEQsjJB+iLVm08DOBmY5ooOoND0PR09ySIppdlaiFOytcjl7bFIjDfABSgRg4J
         zPFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735284020; x=1735888820;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VXAJa9FIW33aWA+s0k664EUsn4laTLVqXCPlW15NvKU=;
        b=SBHPVN57ZYJ84Jq429ejZU98l99/fNkQI+6mISoT9OHVlavzAYdNwCOHIX9oh15Ic8
         W6d2opIGmyIv8l0FLWE4bE05h/RGIucF0LpjF/5GjOlbR7uKouWnWeGjpNL4CYv262rt
         OF+C6r+xRspUA6jQ1NBZWKDjOAmIDWrEkfZFgOUK2nPLVqNquXj4Wk8L4hT2Cto1TIa8
         cNcX8Z5hs31HatV43Ge0K/qRpN61pZUow2JyueSUJEBwLoA8031HdGINptGnK6600DIo
         ycEn9D8Tj4cMLmqjZPJl7zjH03uppb38ylAM2m1jFB2P7z5wipwPNeF2KK6C7i1l59GR
         6EsA==
X-Gm-Message-State: AOJu0YyiIKWLh+RCsok+ZxVduB9H8AlEz+GXK/9iY/bV+LOtQ7GtWxM6
	af9Lg1v+gL+lMr7zreW6/g7XT8qEPBz6onNZZuEN1sa4/IZoKCQc8PaPwqEgl3s=
X-Gm-Gg: ASbGnctsEUZtUHtKkNpNt7aqtFFloDyaHDAxE+0lHghWDOeag7vfUwvvmOzuUytcz+6
	ekmxOoqHtdMmS56kSpeeElYE9DvWbyexfDKKhOzt+6fmbgEN8yI8TRbDiw3KfSX2Rb9/HIatLHM
	S7QZDD4790kyj+KV7FGPKBPgYX4SdVzN0oazQmUmdeYIBCja46LMWatz5zg5R3AgV1gVUMQ1nqT
	rCQPrHuUGykvjy1mx5mNVlJVR6yTR+ksaFUJ90asneDb+rT8Lwnts7Jgo7DFjyFJhoyZO/ikKMF
X-Google-Smtp-Source: AGHT+IE5FOOE7koOS4pebPXpYoJjUNkp+NGrot5mwKtsXyQG16K9PXiYUfUMbnNUo/ke02E2C6R6fQ==
X-Received: by 2002:a05:6000:1785:b0:385:e10a:4d98 with SMTP id ffacd0b85a97d-38a221fa483mr8982940f8f.8.1735284019934;
        Thu, 26 Dec 2024 23:20:19 -0800 (PST)
Received: from [192.168.1.20] ([178.197.223.165])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43656af6c66sm297193175e9.5.2024.12.26.23.20.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Dec 2024 23:20:18 -0800 (PST)
Message-ID: <f4dca976-3cce-49e7-bb06-25219623d987@linaro.org>
Date: Fri, 27 Dec 2024 08:20:16 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 03/10] dt-bindings: media: Add
 amlogic,c3-mipi-adapter.yaml
To: keke.li@amlogic.com, Mauro Carvalho Chehab <mchehab@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, kieran.bingham@ideasonboard.com,
 laurent.pinchart@ideasonboard.com, dan.scally@ideasonboard.com,
 jacopo.mondi@ideasonboard.com
References: <20241227-c3isp-v5-0-c7124e762ff6@amlogic.com>
 <20241227-c3isp-v5-3-c7124e762ff6@amlogic.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <20241227-c3isp-v5-3-c7124e762ff6@amlogic.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 27/12/2024 08:09, Keke Li via B4 Relay wrote:
> From: Keke Li <keke.li@amlogic.com>
> 
> c3-mipi-adapter is used to organize mipi data and
> send raw data to ISP module.
> 
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Signed-off-by: Keke Li <keke.li@amlogic.com>
> ---
>  .../bindings/media/amlogic,c3-mipi-adapter.yaml    | 115 +++++++++++++++++++++
>  MAINTAINERS                                        |   6 ++
>  2 files changed, 121 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/media/amlogic,c3-mipi-adapter.yaml b/Documentation/devicetree/bindings/media/amlogic,c3-mipi-adapter.yaml
> new file mode 100644
> index 000000000000..1105fee2d7a8
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/amlogic,c3-mipi-adapter.yaml
> @@ -0,0 +1,115 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/media/amlogic,c3-mipi-adapter.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Amlogic C3 MIPI adapter receiver
> +
> +maintainers:
> +  - Keke Li <keke.li@amlogic.com>
> +
> +description:
> +  MIPI adapter is used to convert the MIPI CSI-2 data
> +  into an ISP supported data format.
> +
> +properties:
> +  compatible:
> +    enum:
> +      - amlogic,c3-mipi-adapter
> +
> +  reg:
> +    maxItems: 3
> +
> +  reg-names:
> +    items:
> +      - const: top
> +      - const: fd
> +      - const: rd
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
> +      - const: isp0
> +
> +  assigned-clocks: true
> +
> +  assigned-clock-rates: true

NAK. Drop my review tag. You cannot keep someone's review while making
significant changes. Please carefully read submitting patches before
next posting.


Best regards,
Krzysztof

