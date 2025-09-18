Return-Path: <linux-media+bounces-42733-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E77FBB871FE
	for <lists+linux-media@lfdr.de>; Thu, 18 Sep 2025 23:26:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 94AF8B62C91
	for <lists+linux-media@lfdr.de>; Thu, 18 Sep 2025 21:23:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 07A0E2ED848;
	Thu, 18 Sep 2025 21:25:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="jdgu7m42"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B9D02EC09C
	for <linux-media@vger.kernel.org>; Thu, 18 Sep 2025 21:25:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758230707; cv=none; b=A2zMASv+D/EyzTnAC7VYGVsulw7+nnZpLUJ9u29sA6+BDlblWCInp8l2wH3WpdyeaUEEC+afje4TeIaJXQUGQStcCq9Gg1mnla3SNnrZrrS9hSET4aBW4qY3fuN7+H5dzAFtYX6BVvLO7lAJ20/vR5p5tKkW3Lq3B7k0NnFZL/Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758230707; c=relaxed/simple;
	bh=0Orrvnym9z6mx+qpAqsBTHEzgkRRZum9L9LV5MLQZns=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Y6c7wHZsUg8AU4RON7A70Jwt+BcBYpM89TJmIbGEwS1tZZhB2EEow4eRFzwqITbykbqvsbrvBopP2iNQJNrNZ69iGliiFLanG7RVJoJcK3EorP/hcsslF73jCGMQINBbB7hDFQqhf7hUZzuq/9sSgpwco2fa7KjNGsEUyu3v5Zo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=jdgu7m42; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-45f31adf368so10095095e9.3
        for <linux-media@vger.kernel.org>; Thu, 18 Sep 2025 14:25:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1758230704; x=1758835504; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=otQb23FFW/XLhr6Oh4NQ/t5sBVjKo9CxPKgxi2MGprU=;
        b=jdgu7m42NDv6ixwTSCratw0l9mcTHs/P6NKZbRYnE6OfYFPFsju6KnRP+UixwzdCHW
         JVrtA99LnWM5Z982z0SOHpWmUVk7S52HqXHXauIFZn5r9VRM8frmst/KczF/RAtDuKBd
         ybTDX9rNq0vWKRR7gUB25uVYrUTg3qxumLQdoKBR4L3j0TAxtom2A6jvYeUYK55MJE2N
         CRFvjTNw1X5cqeSpc1Y3/4J5M2SFBS2gMbyKZvSKfm9Z+AY24ah8WyW/DXbFlQjQx8eQ
         /KqRwa5+C3ISqAWgLIv50xYCpTo4/G7nENkcelQdfrQ8pvvehHEDKqLVZNqSBTtHkRxS
         blfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758230704; x=1758835504;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=otQb23FFW/XLhr6Oh4NQ/t5sBVjKo9CxPKgxi2MGprU=;
        b=Zc2rbJiAwQk9tp2cM6ld6GEHIBg+XtgFGoK5rfNU3fctvzLiixCLMPDgAMQ6u/5DP7
         O2E6HZnbAxZfNRfaFIFCWZCAOegM0qi6FohlqwT6AkQLmWXfbEAn1RvAkqAN3A6N+c7k
         uvGJC7UONsuJC+QzrDChb6fS94N9ezRozv6QmGS7XiDbO7Rq7vx/H4tqLi1EKR577VWW
         RMg848i6AOGYcX/20EgKdnHXusDxdXJjanwxsRrB5TmiMvo9vkKkMPeRcRjyUKdQuL6Q
         VZYQup2zt2vhcR4phkXtkvVtb+emyBZ98jyl08NNAF0P99eQHvIwgK6W9wR83d3NCWBs
         w6yg==
X-Forwarded-Encrypted: i=1; AJvYcCV+FO7OC3ct4jHd0kBaAw5Er4P1EZw5btbUmUB/7ITY/RbsSuFv+1If5orpBtJdgNUoGi8AcmydUPDWPA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxinPA6+19uTYBXOCRyduwkCTnLaHDdqOLu3l77GTQsMh7egG9G
	rr7hc54A/xppRz1bfPWN8GMbmgwd7pXqr/F4m9jAZRlKFQuhHZnClQ9ITlmiUkcWuaw=
X-Gm-Gg: ASbGncvarb6xn8tBi8QaDgtswfuuBXZ2/EECiLUeljRZ46WnMDxUbm/BSpkkrirYyHw
	Q6DEJ8OAeSXs/KQVYx5cq9OOV9gx0yTkNYsTLX2bUW1Hlxaf/ps6Ae7DjCqzPrrNBBg9WuHxnYB
	5l0YcHqHz2zx8glePT2VgAJvZO3FdLKE0YmacSIMB+OIE6CuUFUInHfakKrt8vqz+HMUKRDd5WG
	WfsE+YS7tKmVNbfP57UUHmC8xqBPJ7nIWslyqpVzn2VtkzhkeuXPjLY3dyB8EVoj8CcP/M5RN01
	kTsV4PfUnUjRAIEL1okSc89tEpxN8fOMkdF3NYpu2NW7B90UsA8oTaU8z0zvOhlrYOtjMHV6VW+
	2Zb/+hLEKha99vsDb2DTKMSVQmU4v+rPFJPpZHB3BisDJKA5STLVyJAcNh6RsThNnIRNyM8xEi0
	GHTCW95nkaa+Jr4v+Tw44xZzZgs8F9cJqo7UXdKQ==
X-Google-Smtp-Source: AGHT+IH01Q3BMBxvVH7m//3u3Ebb9hjBK36gAEMhS02bZTEjbdioULidegt2Ht2MGCXIEyWOW0PaKw==
X-Received: by 2002:a05:600c:1f85:b0:45b:79fd:cb3d with SMTP id 5b1f17b1804b1-467ec45ff4amr4854965e9.36.1758230704012;
        Thu, 18 Sep 2025 14:25:04 -0700 (PDT)
Received: from [192.168.0.19] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-464f64ad359sm70611035e9.22.2025.09.18.14.25.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 18 Sep 2025 14:25:03 -0700 (PDT)
Message-ID: <0bb932e4-9fb5-4ee0-bd21-6e30d6c8044c@linaro.org>
Date: Thu, 18 Sep 2025 22:25:02 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] media: Use of_reserved_mem_region_to_resource() for
 "memory-region"
To: Rob Herring <robh@kernel.org>, Ming Qian <ming.qian@nxp.com>,
 Zhou Peng <eagle.zhou@nxp.com>, Mauro Carvalho Chehab <mchehab@kernel.org>,
 Vikash Garodia <quic_vgarodia@quicinc.com>,
 Dikshita Agarwal <quic_dikshita@quicinc.com>,
 Abhinav Kumar <abhinav.kumar@linux.dev>
Cc: Ming Qian <ming.qian@oss.nxp.com>, linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
References: <20250813214949.897858-1-robh@kernel.org>
 <CAL_Jsq+vUNtMw6JS0ac6a8LTdJBB+UepadpDxP_S8vr6QwUiNA@mail.gmail.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <CAL_Jsq+vUNtMw6JS0ac6a8LTdJBB+UepadpDxP_S8vr6QwUiNA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 18/09/2025 21:22, Rob Herring wrote:
> On Wed, Aug 13, 2025 at 4:50 PM Rob Herring (Arm) <robh@kernel.org> wrote:
>>
>> Use the newly added of_reserved_mem_region_to_resource() function to
>> handle "memory-region" properties.
>>
>> Reviewed-by: Dikshita Agarwal <quic_dikshita@quicinc.com>
>> Reviewed-by: Ming Qian <ming.qian@oss.nxp.com>
>> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
>> ---
>> v2:
>>   - Rebase on v6.17-rc1
>> ---
>>   drivers/media/platform/amphion/vpu_core.c     | 40 +++++--------------
>>   .../media/platform/qcom/iris/iris_firmware.c  | 18 +++------
>>   drivers/media/platform/qcom/venus/firmware.c  | 19 +++------
>>   3 files changed, 21 insertions(+), 56 deletions(-)
> 
> Ping!
I'll pick this one up.

---
bod

