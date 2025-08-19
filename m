Return-Path: <linux-media+bounces-40281-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D8733B2C5D6
	for <lists+linux-media@lfdr.de>; Tue, 19 Aug 2025 15:40:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 00F7EA0061F
	for <lists+linux-media@lfdr.de>; Tue, 19 Aug 2025 13:34:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 83A03322A22;
	Tue, 19 Aug 2025 13:34:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="e09qY7GF"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54A851DE89B
	for <linux-media@vger.kernel.org>; Tue, 19 Aug 2025 13:34:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755610477; cv=none; b=prmqA/AvwUye0SsiO0tx3RzOXq2LlRLM1f1QxvGGXjIQFefzqmR6yB2YndRcEbmtT9cerYBzSf92fBDa4e0lCezVfULZ/FRf+VEpP0XAaylmySG3pKNetT+fxTApWM+3yOMHuiBArrUbQbvdJvmJlxy7d9av70rHIwF7NNiBYAk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755610477; c=relaxed/simple;
	bh=wipzgxzu/rUCZ24ZntLQzz9oqTSOOsAe7X1A0+zrX08=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=OJYOAI5sTYneSOaglPrKSz837mgAf9fzdFO+n/4cUJrxn3O1ZmmczNLJsoglqPDZquyRhK49ktzPLNAVfoQlmiVox8Dyr4oqFuYtJ3JE8cLjTTGNB8DHmXnYdSlxbEIZOIPWiYnJAiVN7W6qlizujRKkcweJPo2hH7eD2wA0qiI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=e09qY7GF; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-45a1b065d59so27303925e9.1
        for <linux-media@vger.kernel.org>; Tue, 19 Aug 2025 06:34:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755610475; x=1756215275; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=a9ZFei03fy4ZPyixVVD0bhhT9fRXV0zABOzey2pvCiY=;
        b=e09qY7GFqk2uaOkiQe3ID/b1q5kb8s1xn35ziiaUZ+1zHECeWonxQJoPp6Y9dSOglV
         1oXZLKEbLZ+7dXCUFP9J7aXYENfzubh4muCxPj88BjjMLi/l6M4A3VNVxcHyFDcg3m/O
         9oizJST5wMvxj/eGXMcvcNAdLmW6ahOs+asL2A5+gNUiBiTV92Y1mZG18G5Yml1CCW9j
         YSpHjoL0w4c5uGtPtaDy5PwBKh0WeyuQkHwtTkayt3Mt9ohr5kQPI3VWrwpBNmOtHne6
         z1nNYT/j92GR3VIvPBolgSgf3qy/sHn+9PEByLSN9w35yffeVqlGZAYlHTFZMhqAmCAj
         juVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755610475; x=1756215275;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=a9ZFei03fy4ZPyixVVD0bhhT9fRXV0zABOzey2pvCiY=;
        b=b7xOG6IB6IteqVkMs5ZltM9TD7xYUmdPo80gnEJMaBMAEhQp8NmQJ45i2aJYdv43PD
         YQDY7cwjncZGn1gI/jPFmqkLF05FtTmz/53JL3WN72RuKtTuk9219dsmnl1aef+w2Fmq
         ZMS9e2wSc5ndaD4BS4Ll8hJZe48zShxopHbpqRmq+K0wvTDKFsPQqQtGCdTH+wL/ukgr
         +gQDFTMeKUCEkxfGCkV9+yzldvfo+872R/9GSsRXEkoBZCrqB953fsWAPQvZD+gki1gW
         aLL5EyDnPlF9GvWAzNNXRm9hVfYf8TTXMyDqgg8rSNLAXj7EuxEoNeTqQV1NiR0rNR2n
         Qipw==
X-Gm-Message-State: AOJu0YzdSzDv3QE6lgyDXAsgtAlDOpJqN33YOmxt2EJyMawNwQcobPYZ
	B5GzM2m9iy4EkkgU69XE18f6LjGzc1r87qhMVOhXzolIulNT+AK+XQZbqS8PmRmWm+c=
X-Gm-Gg: ASbGncvaWI71+xWpiTinyj8G9/9aMD3CTm5kOgVE3rDCieIXW7zv7ACLd16SeIORHye
	K8VWww3Lm5o3ERLT97nKcaB1qwu0IantOdCKN1ylNqcGERFsLFQDNT0ndKNwxW4kNOSem1EIQfv
	ptqXVAo86SVR1Wn0tAr34pkBNsAC66DraCV45wSU+FdpkItrthtN7XbC0jZuSHfNMioFR6cQlro
	qzKJpZfDuIoQOWCrymBoiQISXDvP0Cm1MBHFoON10Hm1R9T+YmfdjZkyKUXs/ElZzEm78xMVWz9
	VlAUTetSNTWWszFMxD/YeSx6wvrv+DwRYA7nh2O4TQb6PFnfpR9nxy6F9xeA2REHgp6P+qdvVnO
	NuDl+CmW2sxDFI9klBiD5y+03mBcNaYaDqq1S+l4WKCUDwqN9HoIYJEEheNdTv7E=
X-Google-Smtp-Source: AGHT+IGA4uZOavHskRVazrBsrJEpwCCS9yNXa5Q7x4nDv12AaruKezbMFjMhYQNh3voiuKoxjMWquQ==
X-Received: by 2002:a05:600c:46c6:b0:456:24aa:9586 with SMTP id 5b1f17b1804b1-45b43dfff1amr20520035e9.21.1755610474714;
        Tue, 19 Aug 2025 06:34:34 -0700 (PDT)
Received: from [192.168.0.35] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45b42a7756asm40936015e9.11.2025.08.19.06.34.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 19 Aug 2025 06:34:34 -0700 (PDT)
Message-ID: <552c0e8d-f3ae-4c2e-ac8d-f43cde5c5ccb@linaro.org>
Date: Tue, 19 Aug 2025 14:34:33 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 04/24] media: iris: Fix port streaming handling
To: Dikshita Agarwal <quic_dikshita@quicinc.com>,
 Vikash Garodia <quic_vgarodia@quicinc.com>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Hans Verkuil
 <hverkuil@xs4all.nl>, Stefan Schmidt <stefan.schmidt@linaro.org>,
 Vedang Nagar <quic_vnagar@quicinc.com>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, Renjiang Han <quic_renjiang@quicinc.com>,
 Wangao Wang <quic_wangaow@quicinc.com>
References: <20250813-iris-video-encoder-v2-0-c725ff673078@quicinc.com>
 <20250813-iris-video-encoder-v2-4-c725ff673078@quicinc.com>
 <40673a17-a19c-4722-ae5b-272082af917b@linaro.org>
 <8b9d5f6e-ee95-e4d1-3fac-fdcb277a7af3@quicinc.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <8b9d5f6e-ee95-e4d1-3fac-fdcb277a7af3@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 18/08/2025 10:45, Dikshita Agarwal wrote:
> 
> 
> On 8/16/2025 4:10 PM, Bryan O'Donoghue wrote:
>> On 13/08/2025 10:37, Dikshita Agarwal wrote:
>>> +    if (!ret)
>>
>> I think you should have a consistent error pattern
>>
>> if (ret)
>>      goto error;
>>
> Its done to avoid duplication of code, otherwise it would look like
> 
> if (inst->state == IRIS_INST_STREAMING)
> 	ret = iris_queue_internal_deferred_buffers(inst, BUF_DPB);
> 	if (ret)
> 		goto error;
> 	
> 	ret = iris_queue_deferred_buffers(inst, buf_type);
> 	if (ret)
> 		goto error;
> 
> and more duplication when encoder is added.

Understood, IMO the pattern above is clearer and easier to read.

Up to you if you want to change it though.

---
bod

