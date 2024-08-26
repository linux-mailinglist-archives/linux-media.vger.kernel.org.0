Return-Path: <linux-media+bounces-16796-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 23A3895F163
	for <lists+linux-media@lfdr.de>; Mon, 26 Aug 2024 14:36:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2417E1C21275
	for <lists+linux-media@lfdr.de>; Mon, 26 Aug 2024 12:36:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DFFD8176242;
	Mon, 26 Aug 2024 12:36:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="vJzK0Ep+"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D21B1514F6
	for <linux-media@vger.kernel.org>; Mon, 26 Aug 2024 12:36:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724675769; cv=none; b=ZHC1T7u0/sxi1i5acOk+BYbKkYIvUj2Hn4rJ9IuLMTAPsKB3NBiHVRbN0zSxe6CXpUgi8OIqJYz5dLEM6uAu0JluVD2xANcC84+jdBDohdNPgZbL/aHu6ZxoCqjEW5emfHXL6Fq4UFSDhWtbXMJUgs2qgS2Qp+PyvskE2Vbnrr0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724675769; c=relaxed/simple;
	bh=Ja4ynOGDs7r5fFu5xbcjLL+e+XO2ktSDY8OPVS23UWE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SrSTVnwTmDsIb15uE4ud8Z8KVQQpMnvJTarWomQTofoFlGiN+Y1inqIugqWVH1eLtbguVgAuahHyY6+Zc5cPh0z22vgBMyVTji4LE7SRKwULdBFe0J4QoXtXlLzoic8v6d6iHhzJq8pSaoQ/f3JaEEZ+XBPbjhwe6sxb2QCtwO8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=vJzK0Ep+; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4281e715904so4787145e9.0
        for <linux-media@vger.kernel.org>; Mon, 26 Aug 2024 05:36:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1724675766; x=1725280566; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=eZxUQ6rvTkSYMAbJPVsEw2y5XiZUn2reb1mGpvWf8Js=;
        b=vJzK0Ep+6VqBZDt3wKaHvDEnEviV1aeru5iQkCuIk+F5puk5NVR18xCABACm28j2dv
         5v197uPaLYaQMv31GkkEInS8/r7TfmuC1JAnL1ayalTAWq2rlFQCnC5Laru7KFlpMnsR
         WoMUbJflCTJRfoX7S/2IJNfSbp0ieaM0+NAH4fooQ329ncmJw7W1iWHUqcAvPB4p5RGR
         K8vxPnm/RR3fBKu38k3tKgeWM3SF3jIoMiVqSgw933RTOl71HfyNKOQRl5JKlGX+H/Bw
         KR/o/5Eg6pB7toSwahsAVqTO1zfF5LNTev18ppRI9EUehXr3QeDD1o4uxQ/SQOP592M5
         tLnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724675766; x=1725280566;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eZxUQ6rvTkSYMAbJPVsEw2y5XiZUn2reb1mGpvWf8Js=;
        b=XffAzM5Pq8KbjwzizUOUN17fxVMzJ50gs4EHR1gcM1tneg+hndih7TSLHMli3Ei0by
         HkFZJ+ZOfMQNvFLIoeNw9P+3hJLAuvm0W+O6gbgc+Ubid89hEytfzCReX2eNP+HBVhPz
         a5hTyOcMsq2V71o5iJEukdzLKvoEs6T45IMK1e607mTXigOo2ph4WXEljLRiSvW4drvo
         2b1ng3uCk1qmbB2TLzrAjJUZN0RoUF1qo8pTArDKhgC9n2b1E6vpkzEsuNF7MQHxs/Xc
         /q0QP4l9KlcKPBpVJoo0yrNz7yA9HD4qfICN9KCvVsQF25q5KsPyD9YlXrIS1c6hVqhG
         mfnw==
X-Forwarded-Encrypted: i=1; AJvYcCUg+j0unNFKRch2SvRDnC0lPqWbhJ/8Q53rAzFJME6txqMFj9Ngi9Hud8cT40m1ZXW35GzyCmLrQj2Mdg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyneHLRIAWRIaapJEvbgw/blE26p1ZoZObPUYY9PtTBd6CoxfXK
	hrNIfsED2HBF6Rul4c7RqtB/tthLkVfR7Luv4K8oVvWBRdqZdvdhccPSQoIYZgo=
X-Google-Smtp-Source: AGHT+IFAnklK+XOXn9+WuMUUgu55FUFp31K3mN+Tx7AOoGQf0pg5wxkskjPjCIP1Ab6rF9SEgTtvWQ==
X-Received: by 2002:a5d:648a:0:b0:36b:b2a1:ef74 with SMTP id ffacd0b85a97d-373118fdf11mr3766303f8f.8.1724675765915;
        Mon, 26 Aug 2024 05:36:05 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.222.82])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-373081ff633sm10689277f8f.77.2024.08.26.05.36.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Aug 2024 05:36:05 -0700 (PDT)
Message-ID: <09b7ea1e-1ddf-47fd-9e46-886c07ad882b@linaro.org>
Date: Mon, 26 Aug 2024 14:36:02 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4] dt-bindings: media: s5p-mfc: Remove s5p-mfc.txt
 binding
To: Aakarsh Jain <aakarsh.jain@samsung.com>,
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org
Cc: m.szyprowski@samsung.com, andrzej.hajda@intel.com, mchehab@kernel.org,
 hverkuil-cisco@xs4all.nl, krzysztof.kozlowski+dt@linaro.org,
 linux-samsung-soc@vger.kernel.org, gost.dev@samsung.com,
 aswani.reddy@samsung.com, pankaj.dubey@samsung.com
References: <CGME20240808135645epcas5p37c6bf0c6ad8efbe43e8451874900c111@epcas5p3.samsung.com>
 <20240808134432.50073-1-aakarsh.jain@samsung.com>
 <8c7127c5-e8f8-4ba2-b39a-0c9ada871977@linaro.org>
 <0cca01daf797$9e636f50$db2a4df0$@samsung.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <0cca01daf797$9e636f50$db2a4df0$@samsung.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 26/08/2024 11:09, Aakarsh Jain wrote:
> 
> 
>> -----Original Message-----
>> From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>> Sent: 08 August 2024 20:52
>> To: Aakarsh Jain <aakarsh.jain@samsung.com>; linux-arm-
>> kernel@lists.infradead.org; linux-media@vger.kernel.org; linux-
>> kernel@vger.kernel.org
>> Cc: m.szyprowski@samsung.com; andrzej.hajda@intel.com;
>> mchehab@kernel.org; hverkuil-cisco@xs4all.nl;
>> krzysztof.kozlowski+dt@linaro.org; linux-samsung-soc@vger.kernel.org;
>> gost.dev@samsung.com; aswani.reddy@samsung.com;
>> pankaj.dubey@samsung.com
>> Subject: Re: [PATCH v4] dt-bindings: media: s5p-mfc: Remove s5p-mfc.txt
>> binding
>>
> Hi Krzysztof,
>> On 08/08/2024 15:44, Aakarsh Jain wrote:
>>> s5p-mfc bindings to json-schema is already merged with this commit
>>> 538af6e5856b ("dt-bindings: media: s5p-mfc:
>>> convert bindings to json-schema"). Remove s5p-mfc.txt file.
>>>
>>> Fixes: 538af6e5856b ("dt-bindings: media: s5p-mfc: convert bindings to
>>> json-schema")
>>> Signed-off-by: Aakarsh Jain <aakarsh.jain@samsung.com>
>>
>> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>>
> Thanks for your review.
> I don’t see this patch in linux-next. Please let me know if any other changes required.
> You will pick up this patch via your tree or this will go via Rob's or Media tree?
> Better you only pick.

Should go via media. Eventually via Rob... but let me just take it so it
will be faster.

Best regards,
Krzysztof


