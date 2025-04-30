Return-Path: <linux-media+bounces-31384-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FD80AA457F
	for <lists+linux-media@lfdr.de>; Wed, 30 Apr 2025 10:33:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 95D6F4E395C
	for <lists+linux-media@lfdr.de>; Wed, 30 Apr 2025 08:33:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5D87C214223;
	Wed, 30 Apr 2025 08:33:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="pzwxY7bA"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C8362A8D0
	for <linux-media@vger.kernel.org>; Wed, 30 Apr 2025 08:33:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746002013; cv=none; b=fO7Y8jkBeihDhffoYeQEYACxpswWeJc0bn90D42WzN+Tc4og1KvoweTDw+kDrkHOQJsjOrvaUXSC4fu0R8SnQRtomQlC87XJXslxRYqS7u+dN8fJny5XyIwGRd4rXcV3t5fXvz5MOyy6uiSkDz33Ttwqi5lDjl7ZiHv7Ka08IaI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746002013; c=relaxed/simple;
	bh=Z3LaTkcxiJgojaot90wwUsMA1wNZTgWHTYAzYoH3uP4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Xgj4qkUuJ7A1Lr06mkIMOOhCiqkvDCAaZwe2QkjL/AKLYBQqVxjXS05LI3wusmpRZHA/51Eyb9dTvTQgxBOFJDACW3yrR/PErqTaBhk4IPtSeObLCkfYZhBZZjdJvGTmfZlDK9xvji2zvB/31tb3A4qlyJTct9FCZVOF4lE/t8w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=pzwxY7bA; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-440668acbf3so9449615e9.0
        for <linux-media@vger.kernel.org>; Wed, 30 Apr 2025 01:33:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746002009; x=1746606809; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Swrs+lmcA6uxqjs3sfg5Wvj+czESaEqxVnzNv7GdoRA=;
        b=pzwxY7bAv3MVtBiVMpQpTwMzMpMdN21aj7WerMdULy3g0Ew5jObqFnLXNLUasrEKgR
         kNjgSZ3byz+lJiivnOeHy7kD/K3PRwPLb3sFOTupJcQJp00ntVlOEg4DKUuC88TBc2Tc
         fhu4l5kOu6+MecdI7IMdDF4eK6Z4gBeqZQJRikcsziChUQdvbnNJdQQE/gvPhYyfsnBi
         vPxbwA6NwJn4L7OHhmTznqNXa+U8ijaWtZ64fx8/eKzcNn4jtFOHiNezwrP2SkM/SL/5
         YiQa1Qglvoqc93sQxovbyHLSBh9j1yYwtvQa/FO/ZjNEx4azrDOrVLQddN4BLDhgCUhO
         vkzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746002009; x=1746606809;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Swrs+lmcA6uxqjs3sfg5Wvj+czESaEqxVnzNv7GdoRA=;
        b=NTEe3/4lEEUXHzvJexDUhjRjgqNulBtPP7dnsUhTmEfbCUUOsDVfO+EeqmU3EGOctS
         DKPvd89DsVsW9skkxLLsismXEBIZBgoM+Rsni3Up9yYKW7WuYBE4zWRsXi+sp0nkjjqd
         lG8wUdWYXm+wBaTJBbFylJMQKbxVXiOUo2FESqjpruYWt0+HQ+p7S19zmVS2cUul88Uh
         lIDUJYIx6Bs1HSzZHcBixEaf8gB84R2tAXa3+PVTVv0V2r6bhWrEg8vC7SqmakBsWfeq
         B5/hsU8i/xL4fIihiVu60ZOmeW01FTIWjTSWJvLTS3CcJlSt6Pq0QDs9Xwxnfqdzr5OW
         6C5g==
X-Forwarded-Encrypted: i=1; AJvYcCURZofmDq0NWFBb2aCC75dAvkv8CcVi0XkYjvWz9SiQ9CA0V0OOot+cp3tyFE9dUXsDkT0gTZkeGQMgOQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyu2+9gmUIt9PN5Dq4eFQc5WAym234DJ5mPve23GaLC2Rllj2B+
	wCt9kos8P5S6//rbP9w7qv88ZT7k6FFPCOj190Igqv/zQImJp/lbdN4XAqOJnLQ=
X-Gm-Gg: ASbGncucPCo+7uiEfxZXkUpHZG7IErDMQEt/2BWl/2EfHodG68kVP+0WfN87LdKc0kO
	Ff7yaKhaOiH+IM1f6CaUE+Z1tkBgIM68aGVmui7vRAWxOfrti/CopQIDYBKjn+KqsqKwa37uI5h
	Kq/6vkVxswUW4aJ1oOdVrg0U91RmrmJ7vnO456rS3xxiKomLU2ci291q95yN3cM2iaL55cHzMvr
	VlsoBMxTNflxQ4hZXEbg9xLfS7qLpIjn3nPjhbaVDi/jdIlz+JqDrY+ME5tkjyI874jrEs53f0I
	+ZinMo+h4x8pIID2KAFeUi+2VTuaDSC4xzeIPKAx9E5Bn2k0413iU8KDU6g3tDSXCcjWJQ==
X-Google-Smtp-Source: AGHT+IF/2PVESluCNViaHOfmIkoRrUgZg7i66vLYFXA1sP6S1zjww2UvfK8PGk8gpX+uynjxdR4kMw==
X-Received: by 2002:a05:600c:8115:b0:43b:c844:a4ba with SMTP id 5b1f17b1804b1-441b2c91b7emr3838575e9.3.1746002009417;
        Wed, 30 Apr 2025 01:33:29 -0700 (PDT)
Received: from [192.168.1.28] ([178.197.207.88])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-441b2bbeed0sm15724935e9.33.2025.04.30.01.33.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 30 Apr 2025 01:33:27 -0700 (PDT)
Message-ID: <883eb54a-fcaf-443c-a4d7-e1278fd43f5a@linaro.org>
Date: Wed, 30 Apr 2025 10:33:26 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] media: qcom: camss: vfe: Stop spamming logs with
 version
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Johan Hovold <johan@kernel.org>
Cc: Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250429180828.950219-4-krzysztof.kozlowski@linaro.org>
 <aBHQejn_ksLyyUm1@hovoldconsulting.com>
 <3e34ce09-1207-4dba-bff8-38c01cad9b78@linaro.org>
 <4d942a6c-cbff-41ac-af8b-12a1ff5181aa@linaro.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <4d942a6c-cbff-41ac-af8b-12a1ff5181aa@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 30/04/2025 10:30, Bryan O'Donoghue wrote:
> On 30/04/2025 09:19, Krzysztof Kozlowski wrote:
>> If anyone wants to know it and cannot deduce from compatible, then add
>> debugfs interface.
> 
> dev_dbg(); isn't too offensive really IMO but if it really bothers you 
> switching to debugfs would be fine.

Yes, please. Dmesg should be only contain issues or some useful
debugging data. Probe success is not useful. It duplicates sysfs and
tracing. Version of hardware - well, I am sure it duplicates the compatible.

> 
> https://git.codelinaro.org/bryan.odonoghue/kernel/-/commit/e62825fc2ed737ab88085567f0947306a2a0da9b
> 
> https://git.codelinaro.org/bryan.odonoghue/kernel/-/commit/ff0d7d980ec8192b459b5926b85a105917746d91
> 
> https://git.codelinaro.org/bryan.odonoghue/kernel/-/commit/3580ffcbe507036c35e8f21e293f018fbb62d8bf
> 
> https://git.codelinaro.org/bryan.odonoghue/kernel/-/commit/cd88d924eb55f5dfeb2283e6e0eef37d5bd4c1c4
> 
> ---
> bod


Best regards,
Krzysztof

