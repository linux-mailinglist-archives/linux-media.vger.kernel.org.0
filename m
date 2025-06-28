Return-Path: <linux-media+bounces-36145-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 02C70AEC374
	for <lists+linux-media@lfdr.de>; Sat, 28 Jun 2025 02:13:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D86201C4157D
	for <lists+linux-media@lfdr.de>; Sat, 28 Jun 2025 00:13:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 44BAC12B94;
	Sat, 28 Jun 2025 00:12:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="FmBSf7UV"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com [209.85.128.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAA84171CD
	for <linux-media@vger.kernel.org>; Sat, 28 Jun 2025 00:12:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.67
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751069577; cv=none; b=NJpi0Iky0e+xmv5YAJX3BrBNucjLu/JScQEUCj9O/vko4FgBT6UsjvVY0OwBpJp+YxQn/cEOL1f1sHZX9DV5VEKkrt2KoNlp/XfTMH380UyevnrB/+73EJKZRQe/e/Ha+TgBZGWQ3FRz6jSxnHnr+DZWPDMrdXizSQYFvcvJTEY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751069577; c=relaxed/simple;
	bh=8bqQ8U84P+FRqDSq3F4KLrzDEvU6RkgbtnUYnQ+g5YI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bmFbvKH95lvyravRhrFNc0KbxASCt3TiHScnDB2+baR8QiLeLBAJ+hzVGjlDwLsrj+yWxxNNKpdFTXUhzsPTx6BWv8ixCf1dEdy5ifIfuWUEZPOaBZYT07ztmZAGh/vn8rKzTbZJzIdPGJ7jThjDDPaFV/XKWoP2aF6EbEEfW+M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=FmBSf7UV; arc=none smtp.client-ip=209.85.128.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f67.google.com with SMTP id 5b1f17b1804b1-453426170b6so19953275e9.1
        for <linux-media@vger.kernel.org>; Fri, 27 Jun 2025 17:12:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1751069573; x=1751674373; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=PImxYHr3OSmCI17ka97beiCSKkKnJt+nKdZqCSncN8Q=;
        b=FmBSf7UVQ9P21s2lz7I3g3XnqJ3dLqr2l7n2Ttnq/pzhi6kuTL17Yr5nGXHtE1jZHc
         QreHlooLT64wGA5U/2pTMeHt93sxFBInB79HvUnAOM9U7JXei+lenaPHyoNPxhai2h3J
         gRFG5MV/wTM2vUWCwDd9ZR4gXTtec0WhnUa2eypXpfgfc+J59xNQlWu82eZt6Su9Blzn
         cUtKbCabNALdOYb/xineEO1dt8aoQ6HCJmJeF1PvMC+EdG9Dfu7JpvWWqqJkrvd78JAD
         tAUneKqF74W5BNmWqXBgI7i1AilquYHj9zNwAnymAzcmN6p6sMx4sNYPOkDctvanLe+1
         xGlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751069573; x=1751674373;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PImxYHr3OSmCI17ka97beiCSKkKnJt+nKdZqCSncN8Q=;
        b=GsqLAFyYkiNULWGAw3qmXzw8d093xGi8DviEgehg5/f09WbYZAH3W+K5psv4Vz4+N4
         owHCpmdegmq/WZLEh0Dejvj/XBKV56gGre0Ewoel4ByJMROcPlicGkucqteGq2NqL5j4
         p4wgGECowfeHnK7m4pZIYPQJG56fQZPlWTo8InNY0tgFiX1w/z0Ov3L2oZNExFfHQjl3
         ve7vdtVjsWUUGfsGNrM4sTN2iw66geRBj+h47OLG2Qd+i+vfL5q29Oi9DUJCaFahzNMW
         0z8uUuoDJqvN0RbQ5CaEXEg8zT3lntJT61VwqeYcjVBg0V/j2wuljuQHEiwAov+TZnjg
         YNdQ==
X-Forwarded-Encrypted: i=1; AJvYcCXYsRnEnujNxFErsne+UW9sNhqsi+UXE1psZQNa2x+ye8Q2KExucqnGZ9xKsu1NRmow2TGv360NTf5Gxw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzYSMNt+wyipaj+2ayUxPzavWEHz6pYu3y+O1pDd7oALrLQteSw
	lFaxfHeMWGnHav+wVyFAZr/GK4c0S4bGSDnjiB2ACUQcT20QYoy0pPFiAgVsiLsr9pA=
X-Gm-Gg: ASbGncvUCrKKMYSVSmPaLGokc2cqvJbrkt9akZSsKkaRgoeqKcR4grJ1vVO1u+zbkhx
	/pTyIf3nVKwFNs6Il2dYtrC9duTCxqzLSK7BBlGkt8gyb5yLXjOFMz0b95I2rQpq/erMnowg2GR
	N4Gbz1WZgbdd6IiKZmIJTCPADB73djk1PwmysAtr7Q/O+B5+xzjNCe7RRYJv7XE67o2appb1we3
	K/PsLYKPatKAwHSGntRpnES4MkIy1Nslox56LWNya7lRpbCn1Xw53KmsXXwnxNx9PHU4HE8j1gy
	xsmzQDUL7UCeUBvWQyjRcjAO99WlM1SlTwYmKUr/35L5RH8jeElNdhAzgvjdk/wjNTGDFpk14Xg
	Heloja6hqMY1yljsP46JnLpKyIVU=
X-Google-Smtp-Source: AGHT+IFn4AjBCHVO2EoBSnUsrz0IN9ZIcbAmCvFdZWWKZ3G1cy7qj59CpKXVM6SINcc+hvDyAzb3xg==
X-Received: by 2002:a05:6000:2b0f:b0:3a5:25e2:6129 with SMTP id ffacd0b85a97d-3a6f3152f1emr5790070f8f.21.1751069573129;
        Fri, 27 Jun 2025 17:12:53 -0700 (PDT)
Received: from [192.168.0.34] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4538a3fe592sm62779925e9.21.2025.06.27.17.12.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Jun 2025 17:12:52 -0700 (PDT)
Message-ID: <eaca9ef7-8acb-425a-96e3-a795b4cf1e6d@linaro.org>
Date: Sat, 28 Jun 2025 01:12:51 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] dt-bindings: media: qcom,x1e80100-camss: Fix isp unit
 address
To: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Hans Verkuil <hverkuil@xs4all.nl>,
 linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org
References: <20250610083318.2773727-1-vladimir.zapolskiy@linaro.org>
 <20250610083318.2773727-2-vladimir.zapolskiy@linaro.org>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20250610083318.2773727-2-vladimir.zapolskiy@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/06/2025 09:33, Vladimir Zapolskiy wrote:
> According to the devicetree specification a unit address shall match
> the first address value of the reg property.
> 
> Fixes: 2ab7f87a7f4b ("dt-bindings: media: Add qcom,x1e80100-camss")
> Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
> ---
> Another fix on top of https://lore.kernel.org/all/20250502204142.2064496-1-vladimir.zapolskiy@linaro.org/
> 
>   .../devicetree/bindings/media/qcom,x1e80100-camss.yaml          | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/media/qcom,x1e80100-camss.yaml b/Documentation/devicetree/bindings/media/qcom,x1e80100-camss.yaml
> index 7d4e6ef57bf8..959cff1a31a8 100644
> --- a/Documentation/devicetree/bindings/media/qcom,x1e80100-camss.yaml
> +++ b/Documentation/devicetree/bindings/media/qcom,x1e80100-camss.yaml
> @@ -190,7 +190,7 @@ examples:
>           #address-cells = <2>;
>           #size-cells = <2>;
>   
> -        camss: isp@acb6000 {
> +        camss: isp@acb7000 {
>               compatible = "qcom,x1e80100-camss";
>   
>               reg = <0 0x0acb7000 0 0x2000>,
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

