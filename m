Return-Path: <linux-media+bounces-47410-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id B35C7C71054
	for <lists+linux-media@lfdr.de>; Wed, 19 Nov 2025 21:19:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 64DC8343F7F
	for <lists+linux-media@lfdr.de>; Wed, 19 Nov 2025 20:10:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B378336BCC9;
	Wed, 19 Nov 2025 20:05:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="GTE0xQdz"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-io1-f46.google.com (mail-io1-f46.google.com [209.85.166.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 244A7315D43
	for <linux-media@vger.kernel.org>; Wed, 19 Nov 2025 20:05:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763582751; cv=none; b=S6iHg1+0vtSN56m5Va/FmEFToR1/adppq2P3OPBIIvfkJ7TS1wVPGzDxn3gD374LgQJsLC0HjF+tRHv2Hjl4S//1euZdbfl3mas7B3JrcepMU6wPAoZx28zQy3Gj0nl2Cb0CXi+DT6gCzvmCczF89JfzDlfoIsqM1Gkx7c/abbo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763582751; c=relaxed/simple;
	bh=Edvp/r0H+9qfQH3ylHtC4AsmZDbZWW2Dbdj7gUdVW2s=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=g0uGj+YlS+gO+NEImEbfCSD5ToDf2DY563gxLbhKX1LcJqZxYDH1Kq3xhyRtXS9+MNSBNn+y2+sbiDU/liAnx1riRqPnr4iV/KVcL4QWu4qjxwYC9qmcpL4AyvkvxWHQ9UrY2xJUowqOlgVRaXnGQ3V9/nOziqqm6uul3XG2h5Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=GTE0xQdz; arc=none smtp.client-ip=209.85.166.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Received: by mail-io1-f46.google.com with SMTP id ca18e2360f4ac-92aee734585so3742839f.3
        for <linux-media@vger.kernel.org>; Wed, 19 Nov 2025 12:05:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1763582747; x=1764187547; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+HLe7CUVAdln3tUOoLTiQQTktKzCo7GVaO9dJqNiMNo=;
        b=GTE0xQdzCzJWfcPInF3KF+d2VmEC575AQJ3yCAJLqWwesTmc4CQXBzzBNvRBrAoD+9
         yQF9jg364Uh4YfCkCSMHpnqma7SS6eLjSGdJGclajrmHhEZewcQKpK4A2B6LeYhuxXZ+
         wplHjZNno0Rt6OYzwdPS92duBj0F8LzHk3aIw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763582747; x=1764187547;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+HLe7CUVAdln3tUOoLTiQQTktKzCo7GVaO9dJqNiMNo=;
        b=ByHV538XKqVYS+be+9Q6PUwZmh/zDFFSTzcyv/L2MjCc6oNbj69w3mO+TsIW9Qpih9
         e6D2Mqb9rlbD0fKpRvcOZzAHJDpryrqXyp1P5D5SihmAk1c4igP0UGCXYzmQmK4ClOkI
         WCI14a1tqpltKH9VRBvt9iPRX0JRCTbNgjSbdWfSal27mMCReuIsQKkzrG4ShPQ+uXmL
         cxkGjFvAmg0+lJFGDhst5tdYqdhiSy/veDqbWG02XP01n75qPDkPsGo6pMb8aP+Su+R4
         WLgs4aJiKCAG/RXeGtvmUlhNUawlMpJVnZI9dgcci/ncBU5S7Yw7FxZIG+gYBqFAqYVe
         GwPQ==
X-Forwarded-Encrypted: i=1; AJvYcCXiRnX/l9+7H94FWfYTVX4+O2mw06kAFk4wV0sblDW6yKnd65CMqo5SD5zhQdNTojsKqVJnqK/2YYbIGw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyMhZPjOXKm3dBEXDi+wUIO59SvybY8AC3u725mBPWoWbWhTMBo
	4nPN5ulSZNF5q0dEkFaY9RHucKKDSClblWbvMDB1zCLqyowfK8M9pD5sWpVOVmr8MEE=
X-Gm-Gg: ASbGncvrfkWzk8kcDMNRpWfX3xrdcu0W55XaBmQXGJyBj+7nNwlxyc5YMPGxvsdD6rg
	8ZpxcdBFhlUxZuJHnyYZSOTAe8lPv4fMvJPLIF/RHZa4MfRE4mqNYdYQLguBZdDGa35LqOJc9xS
	C4Yspczwd/sgVsHtpmRHRCcU97aJOpJVlzMMZfcetg/vYMKkrrFI9dyGlV0o3nYR1IL+uHMtDRB
	VpSWMShiD8tSkjAAxRo1bFcRZCkoh1yYo838LJGxSLDZ19JU3P9sGXxleRhnLqiuH3ok9XqTAj7
	kREv5ADa6s3ASfx0Yre/94UNWsmCKnZB/ffBKNgpVZPal3TVE2VJj9lMws0i6FEIYH1W2ES4dKn
	LOy6bFwnT8iPgOXeF/301wIKr5CzwvwpqZqer1SKwwYU1YxvjiKO5TvKU4zkFYXUxk4k4z53GOA
	gB43sLl3Tw9RQzQapFN4NgO/RNHc5IFuOaGw==
X-Google-Smtp-Source: AGHT+IHqpTx1fCKJCoUMk5o0n7baQ5DxxYVyZrm30vno6Hi1Mjg+zbIFcxjnPPnVBFu4ospwA0PQfg==
X-Received: by 2002:a05:6638:63d1:b0:5b7:115a:36b5 with SMTP id 8926c6da1cb9f-5b95419f4d6mr492657173.19.1763582746671;
        Wed, 19 Nov 2025 12:05:46 -0800 (PST)
Received: from [192.168.1.14] ([38.175.187.108])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-5b954b59576sm86074173.57.2025.11.19.12.05.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 19 Nov 2025 12:05:46 -0800 (PST)
Message-ID: <3150f8ed-5de4-48fa-a6ac-136b07955235@linuxfoundation.org>
Date: Wed, 19 Nov 2025 13:05:45 -0700
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] media: vimc: add RGB/YUV input entity implementation
To: opensource india <opensource206@gmail.com>
Cc: kieran.bingham@ideasonboard.com, mchehab@kernel.org,
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 Shuah Khan <skhan@linuxfoundation.org>
References: <20251101052651.6197-1-opensource206@gmail.com>
 <959ac74b-a8b7-4d4e-9d34-3b3d971f9f8a@linuxfoundation.org>
 <CAKPKb8-nFzqgh+k3aBxUvZ8g28usiAt5BEdFDQysVnCk3S+sEg@mail.gmail.com>
 <c64985f5-f1e5-4880-876d-0a3c9d83629c@linuxfoundation.org>
 <CAKPKb8830YHuY=h662wPVPvTz3LcyLio6pRDy9ZGStkqwu_Vdg@mail.gmail.com>
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <CAKPKb8830YHuY=h662wPVPvTz3LcyLio6pRDy9ZGStkqwu_Vdg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 11/6/25 22:02, opensource india wrote:
> On Fri, Nov 7, 2025 at 5:41 AM Shuah Khan <skhan@linuxfoundation.org> wrote:
>>
>> On 11/5/25 22:03, opensource india wrote:
>>> Hi Shuah,
>>>
>>> On Wed, Nov 5, 2025 at 10:43 PM Shuah Khan <skhan@linuxfoundation.org> wrote:
>>>>
>>>> On 10/31/25 23:26, Pavan Bobba wrote:
>>>>> Introduce a new vimc-input entity to simulate a color frame source in the
>>>>> Virtual Media Controller (VIMC) pipeline. This entity outputs RGB888 frames
>>>>> and allows testing of pipelines that start from a pre-processed RGB/YUV
>>>>> source instead of a raw Bayer sensor.
>>>>>
>>>>> The patch adds vimc-input.c with basic pad operations for format
>>>>> enumeration, get/set, and stream enable/disable handlers. The entity is
>>>>> registered in the VIMC core configuration, replacing the previous temporary
>>>>> use of vimc-sensor. Frame generation is not yet implemented and remains a
>>>>> TODO for future work.
>>>>>
>>>>> This change enables link validation and format negotiation for the
>>>>> RGB/YUV input path, paving the way for software frame injection and
>>>>> test-pattern generation.
>>>>>
>>>>> Signed-off-by: Pavan Bobba <opensource206@gmail.com>

>>>>
>>>> I see 4 patches - are they dependent then gerenrate a sries
>>>> with cover letter explaining the changes you are making.
>>>>
>>>> thanks,
>>>> -- Shuah
>>>
>>> even though all 4 patches are part of vimc driver,
>>> these are independent patches
>>
>> Independent in the sense that they can be applied and tested
>> independently?
> 
> Yes. all 4 patches can be applied and test independently
> 
Sorry for the delay - these four patches especially this one add
new features/functionality to to vimc.

These require updates - Documentation/admin-guide/media/vimc.rst
Please include the documentation patch - please send these as
series 4 patches + doc patch as a series.

The changes look okay to me.

thanks,
-- Shuah



