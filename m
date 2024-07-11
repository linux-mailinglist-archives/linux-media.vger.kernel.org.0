Return-Path: <linux-media+bounces-14921-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F7EA92E7D5
	for <lists+linux-media@lfdr.de>; Thu, 11 Jul 2024 14:01:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5992B282B3E
	for <lists+linux-media@lfdr.de>; Thu, 11 Jul 2024 12:01:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0BD8515B12C;
	Thu, 11 Jul 2024 12:01:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="JBjOyswt"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBF2E1459E3
	for <linux-media@vger.kernel.org>; Thu, 11 Jul 2024 12:00:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720699261; cv=none; b=t4ODmw4DSwvoBgK8tK1NJE2k5aR+qPNuQjCm1KhIKnBIjZv36ISn9EP+34wZpUKaeVkSwOfb8cVhwOiK88zdEjDWMY2rAwd4wfQ+4wVI12jWdxZv55z+ZjwgcLAJwlExmVx1aOwJc+G3hKPYVTj4dY8RiaqU2RJxdlxD0j9LRoY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720699261; c=relaxed/simple;
	bh=v49Vip4jZ4oBWopBF6Z/4qZU0UdOimIaGgazufPlW2g=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RM8l3W7jPX7rqJ7XO10mNdBm4NOOnahw+UzLbYY710f3wjch8kkDRSiljDi0YX6oEMxs9vU2qlxDdTrsNXdp/gXDPDZ+l68cKjvg2n635rdWLwFbPqZ/P2dfWtR4Jh2sg04UGO9XdM9CLgSdJYRaROZY4Iq7T3gZm+t2BMKLr18=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=JBjOyswt; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4265c2b602aso5262345e9.3
        for <linux-media@vger.kernel.org>; Thu, 11 Jul 2024 05:00:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1720699258; x=1721304058; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2JUd2oLXgxshKzRFVISFxh+A+Mvcy+qNlBasbhAfNdM=;
        b=JBjOyswtkOKjO/rVl5GyhQrUk1FTLWGA39KEEcIUX/Jrm9LrlJIUgBXPqPxiCU+lHv
         RULBP5UeSZ9KZ8KG9cA6r+R9tfZZ2LvlQnY+LwPqY13keA5st6cHLwPacf2gNb7wMWlQ
         Mx1Cq09ZsUv86NNrwyXNiJ9yYsrpdzNcqzsQ8cFB5Wj4IRMrV0KrFz4xBQ8BLC1SgQet
         hyKyYbNIUKIjQ55UbWse9iN02kmwvNhAdGyM9Xds/hv1a7Uf4MrS9vsJ6CUUj5lG1nyM
         FJQps4NpfYtSBQiqXeGhRcA9Iyw/U3KUcijvXzMwPFozD7n3NTYaO68F69b+7DezbKfe
         bDpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720699258; x=1721304058;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2JUd2oLXgxshKzRFVISFxh+A+Mvcy+qNlBasbhAfNdM=;
        b=gDYlT2PgdxSaCdA4swjGELYBJ/NL/REoXdShf95i894W9EGBh7ehyMdqBJrJn5xaMq
         Qjw2RO6I7J/g6e7CEF6FUQyrsE55afZzi0jMx3KHK41WGMLVjNzLjv2+1OlAX56Z3+sh
         lOK7v/RoJjGTr3t8ViFOVyTWDG5WgxEoJpXckChKjfLHXzzS5/VQTECMqm6pzJXiNw3+
         FEYIHPIRRnX+03QGLCIagxITdNLlxJp/vgniMrB3vHY57+mGtNiSWbS+vWAzGcV2IBAT
         s15GumWHVvSl60aviJbNV3URKIAUVGYejnDl/vLTQaKcJbzevI4Q7Ml32bUbjfgVt0jg
         wWrQ==
X-Forwarded-Encrypted: i=1; AJvYcCWaH4KkhQHGpnbXbfPsXOydpgOZwy0zjqLDDH9W6F4XI5zSKLqnGcuAu0XpgdlRRB+B2jo8AX3iybiCAkdoyJ/u5u75Em3LK10UfKw=
X-Gm-Message-State: AOJu0YyV+5QIpCijr/9IIW20KvY97MF52qrPY14Vu9ltYhRClDWZjZo0
	21P0UpAtoldQK0L0+10gw89qGJD7wB20ABPiXrPN+dcNHZPdFkWU6D4MVR5fXdc=
X-Google-Smtp-Source: AGHT+IEYp8K8dzwxo8IceVvIX+AjIdtBRRlmCQuuavFPvMmMwPrAreMKuYzQFVtHTSRgUEKZznR3tA==
X-Received: by 2002:a05:600c:4d0d:b0:426:6e8b:3dc5 with SMTP id 5b1f17b1804b1-426708f1fb7mr54216235e9.32.1720699258137;
        Thu, 11 Jul 2024 05:00:58 -0700 (PDT)
Received: from [192.168.0.3] ([176.61.106.227])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42650b26c48sm248723315e9.17.2024.07.11.05.00.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 11 Jul 2024 05:00:57 -0700 (PDT)
Message-ID: <4c26e896-69fa-413b-ace3-39c9698dd6aa@linaro.org>
Date: Thu, 11 Jul 2024 13:00:56 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 09/13] media: qcom: camss: Add CSID Gen3 support for
 SM8550
To: Depeng Shao <quic_depengs@quicinc.com>,
 Krzysztof Kozlowski <krzk@kernel.org>, rfoss@kernel.org,
 todor.too@gmail.com, mchehab@kernel.org, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org
Cc: quic_eberman@quicinc.com, linux-media@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, kernel@quicinc.com,
 Yongsheng Li <quic_yon@quicinc.com>
References: <20240709160656.31146-1-quic_depengs@quicinc.com>
 <20240709160656.31146-10-quic_depengs@quicinc.com>
 <1da50dd1-b170-4775-94fc-19a10b7f9c47@kernel.org>
 <4c8095dd-4f96-4b0e-9282-8bdfb5badbc3@quicinc.com>
 <9255b3e4-874c-4919-b50a-919cf0f42f75@kernel.org>
 <064baf66-eecd-4982-864f-50b86b104ff6@quicinc.com>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <064baf66-eecd-4982-864f-50b86b104ff6@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/07/2024 12:41, Depeng Shao wrote:
>>> Yes, these are some sequences to initialize the HW.
>>
>> Hm? It's like you ignore the problem and just answer with whatever to
>> shut up the reviewer. Instead of replying with the same, address the
>> problem. Why ordering is not a problem here?
>>
> 
> Sorry, I didn't mean that, was trying to understand the problem, then 
> just sent out the mail by mistake.
> Do you mean we should use writel to ensure the strict sequences?
> Thanks for catching this problem, this problem is also in the the 
> existing camss driver. I will check all of them in this series, but the 
> problem in some existing camss drivers, maybe Bryan from Linaro can help 
> to fix them, since I don't have these devices to verify the modifications.

_relaxed is used I'm sure because that's what's always been used and 
what downstream does.

Is there a good reason for it ? None that I can think of.

Krzysztof is right, there's no good reason to use relaxed() here at all, 
you should drop it.

---
bod

