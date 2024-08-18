Return-Path: <linux-media+bounces-16419-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 29A8E955E5B
	for <lists+linux-media@lfdr.de>; Sun, 18 Aug 2024 19:46:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D2A892815FB
	for <lists+linux-media@lfdr.de>; Sun, 18 Aug 2024 17:46:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3D3D014C59A;
	Sun, 18 Aug 2024 17:46:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="pQxo5/yR"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F086013B293
	for <linux-media@vger.kernel.org>; Sun, 18 Aug 2024 17:45:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724003161; cv=none; b=dz1Zdsz9FQZ6biXtOlodf0ZwarbW5+4+qoPi/dgynaaIWoZ1J+aR9Q/1yt9E/VfmENGI0B0pWH2J6V7nYodoZWvkajxObQQv0CecXFyCsMao2nPZYZS0jmBdTR/eFFibkY4sqzQThED6b+4aQyCQpeSZLo3XO0eIMVgN1NwK/v0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724003161; c=relaxed/simple;
	bh=SEvTjPi6TvRSkuiJvrDhnZ/fnb0GJI9HiYcxXYQ0juU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DPOdhrSfiUGUgoSGpqR1dANYx4zfxk/4AJqvADiiI4sUzihJ3POJGvblLRR/W/juyh1QG5w4j46m84kfCc8zXsYHtHcjgm3b+UO9OAjbsf5GEQVwqU1M3bKLN7iuGHuZkbW3D71aUEjLbU49slOsF7QAS1f/tXtk51JTt9Ne2Sw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=pQxo5/yR; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4280ee5f1e3so27876215e9.0
        for <linux-media@vger.kernel.org>; Sun, 18 Aug 2024 10:45:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1724003158; x=1724607958; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=gBg/XfN0ECDAiavbK5j2fh2JVme//1tOMtBJ4ZtdgRo=;
        b=pQxo5/yRRP2zOze0B/mO/IFkETUmiMrspQu8K2zMuTiI5xh7jj2JZI/uuJbNCMuzSB
         WBSF23idIMBxv9H8N/Gz1EqVJp8NxixzB7hcxaFyGLWQvtmqMEr5sij6wM/gNmqMnAYj
         lr3raZ5v9hapy3GqrJYsA7QIlS4+4YSNkT+Hr37gIjGq5nu3QfwfLprJOkgvEg5uYsCC
         cugRGvby9GZUtnd7hQCnnxpxXMDIfo7xulr/L5k8033z615EnztrpJtu8gJ6NarOAl2p
         0pQHpLnJ6FUMfd9Ftsh7V5XT0AYFS95+X2xYLyK7uH2o3ViebyCE1mcBj1GqSqof0okW
         +HJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724003158; x=1724607958;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gBg/XfN0ECDAiavbK5j2fh2JVme//1tOMtBJ4ZtdgRo=;
        b=EqAq1XCDV+BVpyBKaVBilXaY+Vj0fRXYwre+6DtI+mCqAO2qHzw8/HwjmLf94Xkmfb
         o3m8KRJguCIPVOy5j2Cmno5Cz/gBRVoNQyHCap6Pfrom/jzMGeV670jws5Lz/NCWqbDS
         ykTwEgsoGn7z57/WT0fEcr5QZGDbLl1fh75PIoM9M+LRVehnCFCDlaitaOcsEZmEIC+2
         4++X98kTH0ZdfCfvM1WWZ9OKE6raZumSc7bKw3DcmCAPpUctMn+cnBmUccR/2wJP6zf+
         46bQ1oD6YqINQua9yuFxRUxshpoChOI197LfYseuywcTNd6F3IMOrY5UBCaF/OnKQimf
         4O6Q==
X-Forwarded-Encrypted: i=1; AJvYcCVBkaDQ23CJrA3LYKTFunmCV6Uf/mB0q5XuarZdSYL8JqZZDoe5tpY1o6XV3H6PjCXGXeugO00Ciqs+M0KOHJ48ZL71MB6gN6/w+0o=
X-Gm-Message-State: AOJu0YwzEbPb83Xiv+nXnBEKg921ORiKAwE7cVrQyXgtTEe+BwshR0e1
	iT6gxDEfGthW03M5+mRRCNKSg8/O2puv2eJ8Sof/L1Icgh0s2nxi+nXlrkCnNt8=
X-Google-Smtp-Source: AGHT+IEFPEcHDzFmCAzsn423r49i4irClrAQ2eEJLK5Bvj9VNCEJA1CzzvJNJ5QME9opkFT2wkTYjw==
X-Received: by 2002:adf:f892:0:b0:368:664a:d4f9 with SMTP id ffacd0b85a97d-3719443f896mr6619820f8f.28.1724003157845;
        Sun, 18 Aug 2024 10:45:57 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.215.209])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3718985a286sm8522934f8f.54.2024.08.18.10.45.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 18 Aug 2024 10:45:57 -0700 (PDT)
Message-ID: <286524f7-d240-4675-bfff-599ce8e4b16c@linaro.org>
Date: Sun, 18 Aug 2024 19:45:55 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] media: dt-bindings: renesas,fcp: add top-level
 constraints
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Magnus Damm <magnus.damm@gmail.com>, linux-media@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20240818172937.121928-1-krzysztof.kozlowski@linaro.org>
 <20240818173758.GA29465@pendragon.ideasonboard.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <20240818173758.GA29465@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 18/08/2024 19:37, Laurent Pinchart wrote:
> Hi Krzysztof,
> 
> Thank you for the patch.
> 
> On Sun, Aug 18, 2024 at 07:29:36PM +0200, Krzysztof Kozlowski wrote:
>> Properties with variable number of items per each device are expected to
>> have widest constraints in top-level "properties:" block and further
>> customized (narrowed) in "if:then:".  Add missing top-level constraints
>> for clocks and clock-names.
> 
> In this specific case I think it's fine, but generally speaking, how do
> you handle that rule when different variants have completely different
> clocks, not just lack some of the clocks ?

I don't understand the problem. We handle it as usual, as in all
bindings. Here there is no such case, thus names go to the top.

>>  
>> -  clock-names: true
>> +  clock-names:
>> +    items:
>> +      - const: aclk
>> +      - const: pclk
>> +      - const: vclk
>>  
>>    iommus:
>>      maxItems: 1
>> @@ -71,11 +77,6 @@ allOf:
>>              - description: Main clock
>>              - description: Register access clock
>>              - description: Video clock
>> -        clock-names:
>> -          items:
>> -            - const: aclk
>> -            - const: pclk
>> -            - const: vclk
> 
> Any specific reason to move the clock names but not the descriptions ?
> The assymetry bothers me.

The other variant does not have description of the first clock, so
moving it would be incorrect. Moving names is correct, because other
variant does not have clock-names at all.

Best regards,
Krzysztof


