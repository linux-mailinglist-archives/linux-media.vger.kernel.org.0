Return-Path: <linux-media+bounces-49810-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F5E0CEC89E
	for <lists+linux-media@lfdr.de>; Wed, 31 Dec 2025 21:43:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 394B23012BE4
	for <lists+linux-media@lfdr.de>; Wed, 31 Dec 2025 20:43:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6728E30DEA4;
	Wed, 31 Dec 2025 20:43:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="cniYUFSa"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ot1-f45.google.com (mail-ot1-f45.google.com [209.85.210.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4A5330DD11
	for <linux-media@vger.kernel.org>; Wed, 31 Dec 2025 20:43:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767213788; cv=none; b=mXmE1AYfazzs3o0h+EuOabVPy92shRlPY3TymO0unn2elkCOjF2M1Ol3IIqC/T4dsAcSVjqymnY8J7nheXGlt5SbX0nAOaiq11lrW2IVnQwUdKQeNZlhGQRtmEdgzsUIY999EU8CDFw6EYg+1CnkTj4B+GqSx726EQLEVhhYkdg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767213788; c=relaxed/simple;
	bh=eID4mAf2Re/FYuWMtjvtBLGSf5C06Qfx1jLXYl8kJTo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KUi8FDfoncU3Q8ZLpe54Vu4cTP9C83t/WChU+q42VC8/R3lbhPKOis/B2Q55tQbFwg8IIznjLFq5VNgWBLNevL6E2a2IUpMG5JHHZ76TiD9ksZGw/5I76TpTJl5oplyeS7cVRp/I0zLTEhN1LloNrQc6h6l3MB9c4EUNdfmAMQw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=cniYUFSa; arc=none smtp.client-ip=209.85.210.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Received: by mail-ot1-f45.google.com with SMTP id 46e09a7af769-7c76f65feb5so8340133a34.0
        for <linux-media@vger.kernel.org>; Wed, 31 Dec 2025 12:43:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1767213784; x=1767818584; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qNbAhI7J4c1jYk9LP+C6uecp/ybTWPJGWOZx/jURDOI=;
        b=cniYUFSalNbFfRvOTLIGzOQRTWZMOIDvapNd1JfDIP+K295mmqpoINhs3ralZQHr1e
         wMsaXX9wm7ZAs9JXalg5xgGAlgbITZL+9n/5I65mPyLrdnFqe9Fqv1PcW/S+1hfmr2oh
         a9Gb/B1eNAGbfPJPBm61m7kxiyauxnEysXw94=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767213784; x=1767818584;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qNbAhI7J4c1jYk9LP+C6uecp/ybTWPJGWOZx/jURDOI=;
        b=WEGp3bCIx2gJtDAAH/+1qvpSZDItIepp6Iu0Qzbv1CxVPyBaF+FCrHREm4Vc/p9LfA
         jeTDvwEz86IA6OSMjX/CL9shFEe/tb4BJEDpeuMvBEbtKsNaBxbpxJ3RYQHveL40yAju
         GaQN7IMDVocXplKgo6+K4BvbK6Cr3RA/LsM0j4sbPqspTceTW7UVfepBl7S0Q35BnPdD
         qJxP0/1GQDeKaaB6B0QtHuBJtb2mEV0Cd1I++tFfOAlj/Av9Ee3+2btngFxH+8OcrlCT
         XMNT8YuGGEkYwdne/dPmu94UnrmqYSGM+PbYDt5pYiNVUD6hGvBnkrxIU3eEDadlADv+
         a7/Q==
X-Forwarded-Encrypted: i=1; AJvYcCUwnudFfNIphADT8xMszUMUU9iKUm76vXClKngQN/dJgsURv66xLssQ60zv5+BbLmlVtdWxeXdzNeyDvA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyhswMErjCiLhSHiWwTFNSvSXpImlWZPPjCjSqWHymTdcp/wehY
	3yfoicXRV5i2zevRB/mz2UG1r9uH+cCskyqQE2kAY+et0GtMXVLQNT/I/REX9uvEP+A2p11f+fb
	3lSx8
X-Gm-Gg: AY/fxX4DAz/XfQhlz0377Lbu8aA6op8CcxqgFJzEJThc6BC6yWZ+/ZhZK2l9tXllTyZ
	8rswVSEt1+Xb+KWWnyZ4SIE2QQIE/JWjORExd7tktXCmFqMVLEhaCPZB3ZFGeJo13Txs8+rFVoN
	FhUaTi2Eufg8BxKbA+HGKfpVWHY1Wt13LEVizfETeT1Eu0XnBMm9+tt9jWAmQSnH7kUAfsRP48B
	D+9kle9PGxW6eWGCoigEFdXwDK9ah/x1+ZptiP9ck3tDtcR1vki4CBYF9tABpZxeKBDYtT9HtMR
	CpdNRWtes7Vk+LuoqtQaAPi0P07n6eKvjMbSr3D9KnVlo2kDZmXXUvvBlIAyDr+YVHU85prcoRt
	O/FjrVDMx6xW9wWBGE3Mm7KDLcZjflvtZxbzhjGs5j1tyrHGBGT0URQvEyHLZqoUxBeE3QgV/5n
	Xztem3RXxbt/TF5HIxtnY/Tu4=
X-Google-Smtp-Source: AGHT+IHst31ff1ZDugo0Qk0fHS2d06TyDDkzq4TI3giQsaCOdvlsGWtNXBF5/Zsmk84mJ+mdqjYX3Q==
X-Received: by 2002:a05:6830:468d:b0:7b2:aba7:f4e with SMTP id 46e09a7af769-7cc668c4937mr16779934a34.10.1767213784567;
        Wed, 31 Dec 2025 12:43:04 -0800 (PST)
Received: from [192.168.1.14] ([38.175.187.108])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7cc6673c32esm25245103a34.9.2025.12.31.12.43.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 31 Dec 2025 12:43:04 -0800 (PST)
Message-ID: <754a344f-4759-4b94-aae5-41e1ce6b7e2f@linuxfoundation.org>
Date: Wed, 31 Dec 2025 13:43:03 -0700
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/5] media: vimc: add RGB/YUV input entity and improve
 pipeline support
To: opensource india <opensource206@gmail.com>
Cc: kieran.bingham@ideasonboard.com, mchehab@kernel.org,
 Hans Verkuil <hverkuil@xs4all.nl>, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, Shuah Khan <skhan@linuxfoundation.org>
References: <20251120084926.18620-1-opensource206@gmail.com>
 <832f4621-53af-465a-a5e9-f7d65a082481@linuxfoundation.org>
 <CAKPKb8-qyqMmp6c9OnO+AapRRJyE8ygtQUyuUqK8+C0LvMTYTg@mail.gmail.com>
 <CAKPKb8-8ctSewOwBk7fFUMVnb-F_gXnyXS8gd9xJ-fpnW1_ZYA@mail.gmail.com>
 <b5240bd1-eee7-47fd-be70-88435519b12a@linuxfoundation.org>
 <CAKPKb8-VW3C8c-BmwLEWdLXZ8LVuH_MDMdVzzFs6O8QWmpDeuA@mail.gmail.com>
 <CAKPKb8_PGYUStAovWjWG8XxabjB5WuT7kQ3qxT3NuYSKihgDDA@mail.gmail.com>
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <CAKPKb8_PGYUStAovWjWG8XxabjB5WuT7kQ3qxT3NuYSKihgDDA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 12/29/25 09:04, opensource india wrote:
> Hi Shuah,
> 
> On Tue, Dec 16, 2025 at 8:27 AM opensource india
> <opensource206@gmail.com> wrote:
>>
>> On Tue, Dec 16, 2025 at 12:40 AM Shuah Khan <skhan@linuxfoundation.org> wrote:
>>
>>>>>
>>>>> Hi Kieran and Hans,
>>>>> can you please review?
>>>>
>>>> Hi team, can someone please review?
>>>
>>> I will send these up in my pull request to Mauro - it might be
>>> later in December of early January.
>>>
>>> thanks,
>>> -- Shuah
>>>
>>
>> Thank you so much Shuah
> 
> able to pick my changes?

I applied them to vimc branch a while back.

https://web.git.kernel.org/pub/scm/linux/kernel/git/shuah/linux.git/log/?h=vimc

thanks,
-- Shuah


