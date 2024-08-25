Return-Path: <linux-media+bounces-16735-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A4D6795E4A0
	for <lists+linux-media@lfdr.de>; Sun, 25 Aug 2024 19:54:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 541BD2819D3
	for <lists+linux-media@lfdr.de>; Sun, 25 Aug 2024 17:53:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A19203BB30;
	Sun, 25 Aug 2024 17:53:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MsKDVTW3"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DE472BAE5
	for <linux-media@vger.kernel.org>; Sun, 25 Aug 2024 17:53:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724608434; cv=none; b=gcz2oaswC1CduNziFaMQxrIgSDrhKldLdfFQyxC1zANvZxDGgZK17CAwpuNVZfVrwIStPN3kHO8uj81o5eGni929OyxfnwF/IXBM4nJ0v3kUDkYNX6jXLY9ULhq//buIlh1fO75Y/vHw7474oAQgacNupGYjAJHpNRMVEgLIm24=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724608434; c=relaxed/simple;
	bh=+Ifzff1Co5wvz7B6fLgmEEC/XxywxaUOFg9FMuYzjLI=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=GuoX4L58ZLGZagOIN97tJN2k7ao+xLGZd/b4RDGIgqAfp281h6V9xLjb9ZPOAdIKU3jb8E9lH2MEyimy8bFxOog+4DdEXjSq8XHLe6WtwFgTDijLxcLu2uiqa1LDTT1lEyLeN1e10mvCKav4F1HAL7TewSZzM0oycdmQtMD6keM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MsKDVTW3; arc=none smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-58ef19aa69dso3889426a12.3
        for <linux-media@vger.kernel.org>; Sun, 25 Aug 2024 10:53:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724608431; x=1725213231; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Kv5SyIHKjld56505Ouz5RnIrGu33pFcmWDCCQjfCoSI=;
        b=MsKDVTW3SCf40YAEhNQuZICKNc6gJKy1x510iVRv5bDxiHzQrwVs4K6GkDC6B0TX6W
         yT4uR1bv413L6XsEqZChxI7iRuQzLGxEf7TE21l+ylpmHstGwvnh+/8m/pP7/5/78HD+
         l/V0Y8Pg1PXdDHGFgGzdD8u61lYnkZguRBYZ0+tqBJ4YrcMvjq7Hx96iGMSBSCXegC3V
         obHw4EBvWj9K8ZhKnhr6QUM/LVB5N982R4cS7+EdQRkcy6LoiIfM1UA22bVi6wCgO1fI
         mmGg8SUtIRtPdXW4kE3H0hkHFEdwsQAeu8M3aeEv0Gvd7XgKjNmO9mxTIEyq9GJ7s6aq
         KQMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724608431; x=1725213231;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Kv5SyIHKjld56505Ouz5RnIrGu33pFcmWDCCQjfCoSI=;
        b=XX4YLnyfK17Y8f3vk2P2nXd4j0fvr4VlkEbuuCQJFVLlrPuIXX2SftyibzfKA2jQYJ
         J9fmbIqT1C2p0QH0fbALv2+MOjBI0Uz7YFKkud8gFj5xuWWrNG2sLC7TpPM9D6EcpXxg
         WA8VYfyn71rZLMfylJQt1q1isUWrTSDuwGpTOy9XpxAnm9R8xYODdxbZ5nEo14U+0lnV
         YM5QLKw4GW52m/RDhaEuIxRIXnTG0eyDL1OtvKwCpxFZnceP/XG6Zozh/Q/3zHF7msjn
         NfnhpeASIdGlklg+697hXvxIvzGI7FehL4XdEQ6Rr2xqrFFKCWlxi270OCtvfQHzl6Ej
         Pb5A==
X-Forwarded-Encrypted: i=1; AJvYcCU16kTl/kXJHCeSHNvvwmCQbN1ihfdQ/pUlCoavoZe18MUWCA4yzaLohCV5arjQhjQCW6glpTcWgDSPhw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzr5/8iQGgBnBJwdWNM1v1qugeNtCzGXDDSknByfLFfcveYAX8u
	xJlwaR3qveVwN//G5f7joBgiy/2Ug02+OSGBYBrJrgGobeWZskqO
X-Google-Smtp-Source: AGHT+IG+N6dt7KSHwuXbxpIJ5D8XJk3VdwCf3Lo70JoRDqmrtFkFnOfxUpmBAPjS7aHgdKK+rJzV7w==
X-Received: by 2002:a17:907:7247:b0:a7a:9fe9:99e7 with SMTP id a640c23a62f3a-a86a52c649amr623247266b.41.1724608430568;
        Sun, 25 Aug 2024 10:53:50 -0700 (PDT)
Received: from [192.168.1.19] (79-100-234-73.ip.btc-net.bg. [79.100.234.73])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a868f436cd8sm554307966b.118.2024.08.25.10.53.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 25 Aug 2024 10:53:50 -0700 (PDT)
Message-ID: <5f6fe961-a555-452d-b6cf-04c64d7f6ee7@gmail.com>
Date: Sun, 25 Aug 2024 20:53:49 +0300
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [GIT PULL FOR v6.12] Venus updates
To: Hans Verkuil <hverkuil@xs4all.nl>, linux-media@vger.kernel.org
References: <20240823090438.130446-1-stanimir.k.varbanov@gmail.com>
 <a300dda0-71db-473e-a566-0e25969c75cf@xs4all.nl>
Content-Language: en-US, bg-BG
From: Stanimir Varbanov <stanimir.k.varbanov@gmail.com>
In-Reply-To: <a300dda0-71db-473e-a566-0e25969c75cf@xs4all.nl>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Hans,

On 25.08.24 г. 9:29 ч., Hans Verkuil wrote:
> Hi Stan,
> 
> On 23/08/2024 11:04, Stanimir Varbanov wrote:
>> Hi Hans, Mauro,
>>
>> The pull request includes:
>>   - cocci warning/errors (Ricardo Ribalda).
> 
> Any reason why the first patch of this cocci series is missing in the PR?
> 
> https://patchwork.linuxtv.org/project/linux-media/patch/20240814-cocci-flexarray-v7-1-8a1cc09ae6c4@chromium.org/
> 
> If it is just a mistake, then I can add it.

It is not a mistake. Kees Cook already applied similar patch [1] and I 
have to drop it to avoid conflicts.

[1] 
https://lore.kernel.org/lkml/5a9939d7-dd05-4ce8-9231-5ae7af32b09f@linaro.org/T/

-- 
regards,
Stan

