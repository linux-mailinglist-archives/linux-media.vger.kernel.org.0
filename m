Return-Path: <linux-media+bounces-23914-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AE1C89F93BB
	for <lists+linux-media@lfdr.de>; Fri, 20 Dec 2024 14:56:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E5C3A1621EB
	for <lists+linux-media@lfdr.de>; Fri, 20 Dec 2024 13:56:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 79BCE217F58;
	Fri, 20 Dec 2024 13:51:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="NhSgHnex"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2199C217F3D
	for <linux-media@vger.kernel.org>; Fri, 20 Dec 2024 13:51:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734702697; cv=none; b=DVLCVsZUI8m7IpYMoMhUpDN9qXbRj5UQ9mBg8/VyOh5KH69UcGDHamLV7qXP/hQxTz/YiuQAILnTWueZbG2KIKAxKAQwr18JUZC0wcVMgWGCOGVo0EW94vik+N1Gk8Jz/6YXvXswk5B+ni5UJtS9qo5vxzFpirgQq0MztXWa1hQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734702697; c=relaxed/simple;
	bh=EsvH9YJ0WvR2MKlsaNkveTqvceW1TF8x+5ALOaxJ5W8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hRr81vgG9GWSQ3H8ZlJ+cSRCNaJS2v1Qtop5ZUOaQhjGuvfxmItf9dN6JClWTu/hjnvHtevZoLnDjZGlNktEhh5lGoiDEj7msZ9aGEea4P26VsUtS8wRRe7x4gbrV49zkHkRkvSMSeYrSAeWC5Hi0T6sm+PMocHRtsWrPC0ao20=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=NhSgHnex; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-385df53e559so1549510f8f.3
        for <linux-media@vger.kernel.org>; Fri, 20 Dec 2024 05:51:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734702693; x=1735307493; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3acQZgyaZl4Km72yKnDQ2Egdob+XLCB6LBTEzcAyKG4=;
        b=NhSgHnex9sZCUOYI2JCY8NBEvnZ/By3y330zexq8vnoUF3oJJtJRVssmFwHBa2wIk3
         LAzp11tTxUBvZD50XMoP2vhnoGOhjfM2amvssnFTBJyDEyJHIhkBcJL/zOgsAxXk3qyI
         dDyniLQkaep+jF3UI+33z7CkTnQrgp+Ros3tvbZ7Q9oEgDGaGYFI8znHR7x7N9if4F3W
         s4DLurXNDyxMSx6N/dXHP1TlTeagHXr3pv72tjbTZZ99d7F6rdpgGM4LWmONZS9eToC/
         QIwEuR0PeRqbK31LkrERfnRqZbxDtlFmgJ8qIuOlLTAEYqbobaNDlLGvm1FugGe5AqBB
         o7ZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734702693; x=1735307493;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3acQZgyaZl4Km72yKnDQ2Egdob+XLCB6LBTEzcAyKG4=;
        b=dJZQeXe7Y24CYtOKX8yroHHu2b4lSdSzuKjpfAEeKSmdsuXgFTPsZqUuMFmptKsctF
         SHMVmmCbrTCD8kYMTxhDctsn31oSsuUGxvlmqEWfexQ3qLXrqi8YHKtTo+5nFF2G6u5/
         umC9tnR72Yr2pGJR5iHKFOytVwnosI71dkcyu6w0amBUm7MG1LFE9nuxyhmeCtXqm+CK
         SP3XkJ9MMdGDbDltHbslaH9pefrn1L/omo85h7u8jpxSdKIPZ6ZQDEiQEEsGRJha+PHG
         9R268zvo/mg6QAoCbp/jbhSDFvyWoFma06z9AYB+cVumR5Qy8hLpoDeyCdUqzX7Edxwj
         Ix+w==
X-Forwarded-Encrypted: i=1; AJvYcCWEMNGP3AaKjKpNPZLovfrfl2dTvomn3+V5+3gwNeBruydNyCyUcNdYVEEFQM0kwN5oN2TVEum7fuD/gg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxHI+HzPpXmacVGClmRsdCblHcwJTRPaWb58npFEllfiKV1soIP
	4SCn8D2j17/4bvl1tqssnKEQKPMLoxunc8uxJNrpJc9dtLzj3ZEjihLH/HoO1ldzofiC7jEOK3q
	I
X-Gm-Gg: ASbGncvXG8vqz4CwLV9hgf0sxcf4CN5KwFsprRsVWsaBuD6J3NgiWsEnXxGnFVxYSZQ
	Nm87i8wxHnh3F5hfW0x83JXzrHh9o8Xxz3BhsCKd/0kqD4XZ+cf4vPYQ05og5TPfWr7XQGu96a1
	5x3Mdp/b88+4/uo7x9vl3hdNvGvWLDGwADVhCDUJtFZ5ukEaXxU5auS0+dXy3BWNRwWvhSgZI0Q
	X9taXf5CrFb65AFnjJYJMYUhiZMfnSRxJ4Z75Nv0w97vdaXUocwGMFLZzZNzGxGbKFaaA==
X-Google-Smtp-Source: AGHT+IEGlLjJFXpVVOm4m9s2aBhPPk5mgkPCTT0T/Kb76YM376vrWlPfFeKUweABCPNVmFGTEoKvnA==
X-Received: by 2002:a05:6000:4803:b0:385:ef39:6cf7 with SMTP id ffacd0b85a97d-38a222019a6mr2392886f8f.32.1734702693349;
        Fri, 20 Dec 2024 05:51:33 -0800 (PST)
Received: from [192.168.0.10] ([176.61.106.227])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38a1c8288b8sm4099735f8f.11.2024.12.20.05.51.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 Dec 2024 05:51:32 -0800 (PST)
Message-ID: <c9f237bc-40c6-4b41-a963-abac306458bd@linaro.org>
Date: Fri, 20 Dec 2024 13:51:31 +0000
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/8] media: ov08x40: Properly turn sensor on/off when
 runtime-suspended
To: Hans de Goede <hdegoede@redhat.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Jason Chen <jason.z.chen@intel.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org
References: <20241219134940.15472-1-hdegoede@redhat.com>
 <20241219134940.15472-2-hdegoede@redhat.com>
 <a2efc7e7-6e73-41b0-b8df-ae28175d7dda@linaro.org>
 <e3573352-f73e-43f5-8e21-6c313dc54057@redhat.com>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <e3573352-f73e-43f5-8e21-6c313dc54057@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 20/12/2024 13:47, Hans de Goede wrote:
>>>    }
>>>    +static DEFINE_RUNTIME_DEV_PM_OPS(ov08x40_pm_ops, ov08x40_power_on,
>>> +                 ov08x40_power_off, NULL);
>>> +
> Ugh I have on/off swapped here, second argument of the macro is the suspend
> function so that should be ov08x40_power_off. IOW this should be:
> 
> static DEFINE_RUNTIME_DEV_PM_OPS(ov08x40_pm_ops, ov08x40_power_off,
> 				 ov08x40_power_on, NULL);
> 
> Can you give this a try with that change?
> 
> Regards,
> 
> Hans

Heh.

That'd do it, works now.

---
bod

