Return-Path: <linux-media+bounces-38231-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 1351CB0ED55
	for <lists+linux-media@lfdr.de>; Wed, 23 Jul 2025 10:34:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C16913BB80F
	for <lists+linux-media@lfdr.de>; Wed, 23 Jul 2025 08:33:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A59E8248F4D;
	Wed, 23 Jul 2025 08:34:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="cjreUs4z"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 736E017BEBF
	for <linux-media@vger.kernel.org>; Wed, 23 Jul 2025 08:34:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753259652; cv=none; b=VtfPZF8eqyEjlQ5j4isEtWifBwxBKnE4VoC1tPxU4Wc62QIr75bpgMaeGRg3DTjE4RB9W9trLYpnIO3IGoDEZ70dY36m30uKVqoc7t7/NnXWXVZSYRjZXUTkeO88NnIssU+jOTRuEY1ovb5WYeMdmKU9+BZzRMceUmWJCkaBkqk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753259652; c=relaxed/simple;
	bh=fqqTU5Q2Wts1JqfPaHt73vG1jMrBA1lvDzSJGM0bLjE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kTU+WB7uTvaG7ycALo4jH5bJhplcoTmnJEOmrgwhQZG8su9iYbYcRiUYywrM+yZYzOGaPAaX/454D45HEtOqzDgC0LyrZ4cInUwfEG1kQGSlCZyFLmWFhTw7WvD9JskxAMaG+MMWF+YCNHJi5mTO0TSW/dfz61/E4mI8vj2ozpc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=cjreUs4z; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4561a4a8bf2so71506455e9.1
        for <linux-media@vger.kernel.org>; Wed, 23 Jul 2025 01:34:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1753259649; x=1753864449; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=zKVnFomYy8E8KQwcfNsj6ulD0Xw2fyUDVFD8613P6Yg=;
        b=cjreUs4z8imaUe4vpRGLubhJENAEX32Kgx6Jv+ZYY19ztwb8fs3dLnNj1aEKU4xS8h
         GYsvABMAcqp5PXWk12WcXkarwisabnVUPJPh+TAd7Xqfv1iDu0eJyYdObqcNn8a5VmR5
         jT/so9LD5REEpZvPVfJVzFpdq1pM0p49HB1y7UQ6Pklo6s219CXyahVGtUi+VeTA2JRO
         lG0/r+2RCY02SPR1MbkjhVhpuqrVpv3VwXlPZPLMguO80FZzYr4GKtPBhJ6ayDZzfSwO
         mGtOFZ7Btzz2XS3J6NPspBW+w12JVAseGT7uMgHIh1SRUvoA/+NfBBvo36/YqEAGSkqm
         lI9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753259649; x=1753864449;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zKVnFomYy8E8KQwcfNsj6ulD0Xw2fyUDVFD8613P6Yg=;
        b=oqf4MzbXlIDNwQg/tSaR5pqeTqAKVWvEAscvq1tp93ozyrzI/5KVxP721bYF1nROOC
         Hev0wp1hGDVXLZKBYWcnCp83xd1646fTmh8bYEOP9Ba5sqoFcpan6WzDGlHzC6eEgWWK
         DIsYFJbbcmDV7T1Vrx5+uavzCz0+BthTjdZI/x7n8i3BYPQqvrx4bs2IcYV2WBnWDqY1
         eorX4S85dI2cwD3C5YLq8kr/8MDihcHDRxeOnht3HkfNQWiQFV9cO3nlfLMu9CoEXJBo
         f1km2Mcn6G/aMNPWvhbKd18zsKoFnNHBrcFd1WRD6CSXF8BPdeboY0j0Qz2f5jWla36K
         Fi4A==
X-Gm-Message-State: AOJu0YzK8ag3KlBLyU7KSqDIvXY+9ze4jo7RYT/xsgfib6B72PBdiAUO
	v5v4sc5xHKvQjeF3v0tyHffe7ObpsDA24WYoBWzJVWxrbKmPLUgByZfCWglL5fHuvss=
X-Gm-Gg: ASbGncvjgr7rjOiaIMmV+479Hxhg7iDCNuYidrOQZHhqPRkBo2nAF2kT4HfRLSvWU35
	ovdJd+g1S74EjT/1frvkZPu8yPPZ8aDLDNrmwsU7zemqGHMPwCRnNvH3YCeNslgFJPqGAchHj0c
	TVhUnbd0+p1YySNl0OWz2FHQiQfq/B6vwd0s67h1pnllWF/NZhhDmVmXzh31AIjkQf2ja2WmyMX
	y6CB41I6FtqWGeu55O658Jqnphyp8G2mPkYQUBxbFkMbYkXMnkL1x8j75kPnfa+Njr+vMjs3bNu
	GdW+aPlJdNfbY6Ks+GWZgm6X/+hC1/4y4CDLsAlvhsffcPUJJTBt0M4hjyU708ZDWTU3lXIarUg
	JvcDNiLBPfu1IZ557vrzj8uewjuwnqgc+KaaR61LDnBTICx3jBKkyCbK9fKnAX4Y=
X-Google-Smtp-Source: AGHT+IHh6It645AxDuSmVuSvYrBa/qT8yZ8JYoP6ZpWAS5lzUHw2g8ZbWyzuQU3s670wb4c/O9V4bg==
X-Received: by 2002:a05:600c:8717:b0:456:26d1:445d with SMTP id 5b1f17b1804b1-45868d4ce4cmr14590345e9.31.1753259648734;
        Wed, 23 Jul 2025 01:34:08 -0700 (PDT)
Received: from [192.168.0.35] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b61ca4893fsm15791493f8f.52.2025.07.23.01.34.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Jul 2025 01:34:08 -0700 (PDT)
Message-ID: <cea0acf6-5ffe-4cce-87f4-12be3c8f31f0@linaro.org>
Date: Wed, 23 Jul 2025 09:34:06 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 00/25] Enable H.264/H.265 encoder support and fixes in
 common code
To: Dikshita Agarwal <quic_dikshita@quicinc.com>,
 Vikash Garodia <quic_vgarodia@quicinc.com>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Hans Verkuil
 <hverkuil@xs4all.nl>, Stefan Schmidt <stefan.schmidt@linaro.org>,
 Vedang Nagar <quic_vnagar@quicinc.com>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250704-iris-video-encoder-v1-0-b6ce24e273cf@quicinc.com>
 <f48ac2fc-2239-7ece-730c-342b495b8986@quicinc.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <f48ac2fc-2239-7ece-730c-342b495b8986@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 23/07/2025 07:40, Dikshita Agarwal wrote:
> 
> 
> On 7/4/2025 1:23 PM, Dikshita Agarwal wrote:
>> Hi All,
>>
>> This patch series adds support for H.264 and H.265 encoder in iris
>> driver and includes a few fixes and cleanup in the common code that were
>> identified during encoder bring-up process.
>>
>> The changes include:
>> - Enabling support for H.264 and H.265 encoding.
>> - Fixes and improvements in shared componenets used by both encoder and
>> decoder paths.
>> - Ensuring compatibility and stability with the existing decoder flow.
>>
>> All patches have been tested with v4l2-compliance, v4l2-ctl and
>> Gstreamer on SM8250 and SM8550 for encoder, at the same time ensured
>> that the existing decoder functionality remains uneffected.
>>
> 
> @bryan/@vikash
> do you have any further comments on this series, I have few smatch/cocci
> fixes which I plan to push with v2.
> If you have any comments, I can address them as well in v2.
> 
> Thanks,
> Dikshita

Will review this week.

I have it stacked on a Hamoa tree and it passes v4l2-compliance but, I 
haven't put it through an actual test of the encoder yet.

Will do ASAP.

---
bod

