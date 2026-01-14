Return-Path: <linux-media+bounces-50708-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 97DDCD2004C
	for <lists+linux-media@lfdr.de>; Wed, 14 Jan 2026 17:01:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 93A9F309B766
	for <lists+linux-media@lfdr.de>; Wed, 14 Jan 2026 15:54:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D78683A1A29;
	Wed, 14 Jan 2026 15:54:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="AtHGbn+D"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-oa1-f51.google.com (mail-oa1-f51.google.com [209.85.160.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A7933A0EBB
	for <linux-media@vger.kernel.org>; Wed, 14 Jan 2026 15:54:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768406084; cv=none; b=aif/xkeVFduGvMoAwH+4IBxVdUC3HoefHu/BZ6j61sMSQVs4atT7B1OYopLBM2AzhaCF9iXBY4/6vcgLMfkqoCOvp+JqNtRfePWH7dqJ7w3qTavraR7/XANTPiODxjhXIUHqrWJ9vlF5uMJAqr3upPFtwOlG1h/Z6LAeavIa5aQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768406084; c=relaxed/simple;
	bh=tP0CWzJ+tYMvZQHRQMBzwTiUbhZYeFzBFwcWsfttrNc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=g1zzw9J0Y/TFiFZVWkRbnqZmZJ37oFwtCVXpAXzD3g6acobHQJG22BrNzdE56pk0KVOD9bnLPvcz2Iq1b2Z5cvAEH0nVxB/lMVFZrA3LGRdnYoOwQxtzgkZi0Mfi7i2a08TCNYDSuNzdNgpp2TQ1fCMBwaTB/oTCm1ZmQBM/83E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=AtHGbn+D; arc=none smtp.client-ip=209.85.160.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Received: by mail-oa1-f51.google.com with SMTP id 586e51a60fabf-3ec6c10a295so3941586fac.0
        for <linux-media@vger.kernel.org>; Wed, 14 Jan 2026 07:54:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1768406081; x=1769010881; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2Y3JOGxgVcT8sPwq2Y2PxfRwIRM4gI3P0JZqTIpC56k=;
        b=AtHGbn+DyNowAckh6KP6cHdwNXjgj4EgtQKBrTDIgugL7YClWZBu2WSf/Tn8nzncwo
         U7Kg4nHPZxAhj/ELzsF15/gRvPoeQgbkimnEDchx5X/pnuOSxlCcH7JbmOB/VY1rGnWi
         PaT9RbWK9dfuuhk8Ztjz2NU3KUKPcJpYa6nVE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768406081; x=1769010881;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2Y3JOGxgVcT8sPwq2Y2PxfRwIRM4gI3P0JZqTIpC56k=;
        b=d+4Z7SD7zwFdjCL0T38Ud/c9xygyTUF2ogpanGDY8WvHc3dWCYg1leh+CeIvcE4l+v
         k8z6fthtPIzQTx8mW/flUVSW/GMQCkFH5bJhGL/EFGy8GGbh1WBWOSBy9L1VWPeA7XsM
         9vC8g6DcoibF1pTQ1M7/4F1n2TEaITD8nTVnFyX4Pcqrbgm+nopKHHXJ+CGh70U4IAfe
         Jj+wiw5wwWLxTn2+HS9u03fpBUjN7ZuvLm7HJB1EVQ28CTe7ypKT/vOyz856QjgKGlrO
         YE/WaL4lX6lM6r7g8ND53updvQ5FKc5QqTdzk0ZaQGXDnAlMUlZ3O23A2jgluO4HFrDy
         QhDQ==
X-Forwarded-Encrypted: i=1; AJvYcCXVF4s9M9xxPmubclVwbhrJNYTm0tLfq0xKN8l1nczR7jxWSYb5/F0f8zHcu6qrMrrpJskBUp1vHe4n4A==@vger.kernel.org
X-Gm-Message-State: AOJu0YwiN0ujBHv9Yk5StxP7P16n3r1M/HYFhnHhMoL6CZNTpBr9VybD
	k1xUz9XKo5kWRbjzYmYbbiuoeBYPJWtx0oUJA7qEUAj9Fi/NHjyt9hwfF3V5ZwAGpVA=
X-Gm-Gg: AY/fxX7Xl8FDbn4lymIzUEtP8cWnr+pjidBs1gWnxzowzkwibfCfPko1Qvf91b2Cmzz
	QRuY1iOrhKBNlLOD0+4HibpBNrSF79u4K0DD7Msn0ZmEL+GA4RRzRorUX2jzlpN/A5BAsrKfUJd
	PpZNd8QV3I+v/QES2n9kOhymmf8SBMrBTIB1e+mMGMbgUuxQE448wDncBFFnGyiBwPRoYW07Sv9
	wRqZIbtAQDUGGyWbpilsegvx8L3aaqEAbkCeUjoMfgpGI2Voo/2kKvAwqzTDQKPM7U8zicm2qN6
	nm3vq1iWGbHv4ma5yfRaZO/5tDrim6EEzb6VkeIwfHXkeFAZm75Wp+M/Ba238oeV5A3nMGVZdeR
	SNRqZ30/8OlIAUbP01GARx6ayjCaTT78zrgiCfVYDmRbLp3NgQqvCTVjqVq91JFY3V5tVlB6GyW
	QbG/XLysrGnAfi5hmCVlg+F8U=
X-Received: by 2002:a05:6870:51cd:b0:332:8989:4ef8 with SMTP id 586e51a60fabf-4040bffc3dbmr1901087fac.31.1768406080713;
        Wed, 14 Jan 2026 07:54:40 -0800 (PST)
Received: from [192.168.1.14] ([38.175.187.108])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4041fcf2144sm610969fac.1.2026.01.14.07.54.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 Jan 2026 07:54:40 -0800 (PST)
Message-ID: <d002bedd-6fa0-458b-87cb-24146ff58e17@linuxfoundation.org>
Date: Wed, 14 Jan 2026 08:54:38 -0700
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [GIT PULL] Linux Media vimc update for 6.20-rc1
To: Hans Verkuil <hverkuil+cisco@kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Pavan Bobba <opensource206@gmail.com>
Cc: Kieran Bingham <kieran.bingham@ideasonboard.com>,
 Hans Verkuil <hverkuil@xs4all.nl>, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, shuah <shuah@kernel.org>,
 Shuah Khan <skhan@linuxfoundation.org>
References: <5e808887-c849-4ccd-8fbf-77d12e3d8730@linuxfoundation.org>
 <e9098813-3b5a-47a1-b1a8-192040093541@kernel.org>
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <e9098813-3b5a-47a1-b1a8-192040093541@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 1/13/26 02:19, Hans Verkuil wrote:
> Hi Shuah, Pavan,
> 
> On 08/01/2026 22:42, Shuah Khan wrote:
>> Hi Mauro,
>>
>> Please pull the vimc next update for Linux 6.20-rc1.
>>
>> Adds
>>       RGB/YUV input entity implementation
>>       support for V4L2_FIELD_ALTERNATE in vimc-sensor
>>       support for multiple RGB formats in vimc-debayer
>>       support custom bytesperline values in vimc-capture
>>       document RGB/YUV input entity
>>
>> diff is attached.
> 
> Unfortunately these vimc changes cause regressions in the vimc test-media test.
> 
> This test is run in our CI to catch regressions, so it must always pass.
> 
> The test is in the v4l-utils git repository (https://git.linuxtv.org/v4l-utils.git/)
> in the contrib/test directory. It's run as: 'sudo ./test-media vimc'.
> 
> It could be that these changes require changes in the vimc test itself.
> In that case I need a patch for test-media fixing this. However, looking
> at the failures I think that at least some of the issues are caused by these
> patches.
> 
> Since this series adds a new entity, I think that test-media needs to be patched
> anyway with a new test that tests this new entity as well.

Thank you Hans.

Pavan, please address the problems in the patch series.


> 
> Running the test-media vimc test results in:
> 
> Summary:
> 
> Total for vimc device /dev/media4: 8, Succeeded: 8, Failed: 0, Warnings: 0
> Total for vimc device /dev/video13: 60, Succeeded: 49, Failed: 11, Warnings: 0
> Total for vimc device /dev/video14: 60, Succeeded: 60, Failed: 0, Warnings: 0
> Total for vimc device /dev/video15: 60, Succeeded: 49, Failed: 11, Warnings: 0
> Total for vimc device /dev/v4l-subdev0: 54, Succeeded: 54, Failed: 0, Warnings: 0
> Total for vimc device /dev/v4l-subdev1: 54, Succeeded: 54, Failed: 0, Warnings: 0
> Total for vimc device /dev/v4l-subdev2: 61, Succeeded: 59, Failed: 2, Warnings: 0
> Total for vimc device /dev/v4l-subdev3: 61, Succeeded: 59, Failed: 2, Warnings: 0
> Total for vimc device /dev/v4l-subdev4: 54, Succeeded: 52, Failed: 2, Warnings: 0
> Total for vimc device /dev/v4l-subdev5: 61, Succeeded: 61, Failed: 0, Warnings: 0
> Total for vimc device /dev/v4l-subdev6: 47, Succeeded: 47, Failed: 0, Warnings: 0
> Total for vimc device /dev/v4l-subdev7: 47, Succeeded: 47, Failed: 0, Warnings: 0
> Grand Total for vimc device /dev/media4: 627, Succeeded: 599, Failed: 28, Warnings: 0
> 
> So I'm dropping this PR.
> 

Makes sense.

thanks,
-- Shuah

