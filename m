Return-Path: <linux-media+bounces-23956-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 76FE89F9762
	for <lists+linux-media@lfdr.de>; Fri, 20 Dec 2024 18:06:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5C22516759B
	for <lists+linux-media@lfdr.de>; Fri, 20 Dec 2024 17:06:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E627021CFED;
	Fri, 20 Dec 2024 17:03:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Cia0qRrQ"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 909D321CA1A
	for <linux-media@vger.kernel.org>; Fri, 20 Dec 2024 17:03:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734714201; cv=none; b=Ffx9svznJLsmq8BSN8jD60I9HqcIxNvB2Bhk0JqL+JXImqM9WUlhIl+peEybHmqezuBmo0FpvKNmqkZb717O+nmXe90Mt8MxEEvADkNLFjcMg56O/wOWm3oZcoT668VDxt6u2ojiaBor5NXVNAaL8Qdp4j41pfA6W4PeCAn9Hs8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734714201; c=relaxed/simple;
	bh=p4M17Cjzzi7xwE7kmC+Kk4l2JlhtQ/SwVXZ65oGT5oA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MBJu+rq7vIgHje49h0xtXGolc9SdC3BwdSc6aDThLmVWdqIL7uuwr8XuS/XBOQC67W45QLTIuqj3TVuUU0xFYBmGDe/kEBH4id81QKBuRT3kP/23qOw8wX6+K+HgLKNAZW1YaE34Hc/ll8A778UFHlI98xMAI8b6DmICof2VJGk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Cia0qRrQ; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4361f796586so23129065e9.3
        for <linux-media@vger.kernel.org>; Fri, 20 Dec 2024 09:03:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734714198; x=1735318998; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=oIAXI7gwAAw1kJKdNUTYMe/Kn7ka4qi33HHVDAXOXPU=;
        b=Cia0qRrQCWrszOu+c1b/N/VKCdXyGOmurFRqtY7MCNUHA/Eq4U4KvSL7oCYiv/kcC0
         JXdozjJcJTLDIeAqdsXfxw68G/0j9UtdBxS+yzyoIjA4GlFbTvNT5MQi/ixQQFEO0OjU
         iY6i5Z/AKbYWPhZuzjGs4go98lkEVuiBbBbhHhNZQs2Q8MGELhK/1rEgSCqp9NPT4SGg
         lSYChJwZ3XxoRGdLQDKw2CS2x3VgU38KtPXgJ5OtRoT0lx/zlq1nVqkqLU/gJnGF3TGX
         z9elBc+2MYRA1hgR9mBreCtDOOY8p8KnWqh9lIrwlOca+e5ZIspaYKVMnj8SJ238FZ7s
         eeJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734714198; x=1735318998;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=oIAXI7gwAAw1kJKdNUTYMe/Kn7ka4qi33HHVDAXOXPU=;
        b=vOsMS1nGE7DT397z3dE54nkB9FJkuV/s2Vqwt2SytNZuwSVc6STKhLrjlYbVpdeBb3
         afBeXIf8OcwiFYOBtZmndqbJE6zFNmI1cICSj3eSDdOfcVCJh1FEMtMUqn4KXlTZA1w2
         x0GSEFgfOiNzJoWVgyZYkAfdyL0VaJtbycnCFzZrW8XrDa7fDKoz9hv1WpHzRXQ1tmEW
         TZJSMoOQ/gT8AD380W/0k8e0NbHErMeHF4sVfrGl8mLmxCFCrCti2knnzNJDcJNhpKyr
         mVJ1ZQaLLKBJc6Qi2B4SrHB4vVYQTGiNTcdRiJ1md/WnI1bW4NY6GWPmZ7fZ5d25x9Il
         PDJw==
X-Forwarded-Encrypted: i=1; AJvYcCXaXHdb4tygxTR4fvrL96ji4zPK3li/VIjgNsbQ4nDA20MQXRlgoJzz/2BW8wx51TLOlUTWK+2R7JgG6A==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx/Rjuijudyqbw1ieO2/gDjHyrg1RVYmqXyJ+7mfioy4PHIhA/s
	My+vMrecuEOZR1JqpP91lqs71CWFXDO2HovDLfZ8DMgSI4J0NNi/irVbmlv3Kh0=
X-Gm-Gg: ASbGncvj6QBxb3HPDWJqxyIUFA6mBF063U9/OCeCv/wl+DLkyBbFsT0Iw39girnB76L
	OZsbOTtKJnwvL2AeV7x9FS4OzPoGXpT43KAcoLa6DZ5vXRFgclarcM2WpN+wXFGxDWC5E+iMfjS
	IMfxvsMBhWoqGJ+Sz8/lF4afRTSfoFyfPCGKDtm8CaDdZyrme30j66IMo29ih4lOIpfzVeS4lnz
	b5AR9tUUpvAlaAMmoQ1CYnDoXf4hLgIYrdDYhLjdtkvPK/efQ+nUw1xbSi003vjJTr8Mw==
X-Google-Smtp-Source: AGHT+IHmrqet7zYf+5c/MwPuy/ITc9k8ySkBTZS/vV4gparbLJP+zO3s2d4qTKn/qGMl+F/r1/YVeg==
X-Received: by 2002:a05:600c:4fd3:b0:431:54f3:11ab with SMTP id 5b1f17b1804b1-43668b600c9mr29938265e9.33.1734714197521;
        Fri, 20 Dec 2024 09:03:17 -0800 (PST)
Received: from [192.168.0.10] ([176.61.106.227])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43656af6c42sm84595055e9.9.2024.12.20.09.03.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 Dec 2024 09:03:16 -0800 (PST)
Message-ID: <21fb2807-3886-4559-a7a0-dca3031a5388@linaro.org>
Date: Fri, 20 Dec 2024 17:03:15 +0000
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 00/10] media: ov08x40: Various improvements
To: Hans de Goede <hdegoede@redhat.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Jason Chen <jason.z.chen@intel.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org
References: <20241220144130.66765-1-hdegoede@redhat.com>
 <b17e044e-b219-4245-9c03-88cfdce2f65f@linaro.org>
 <c8975cb9-3d57-4290-8ce9-7b13fd9c2639@redhat.com>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <c8975cb9-3d57-4290-8ce9-7b13fd9c2639@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 20/12/2024 16:03, Hans de Goede wrote:
>> If this commit goes first, then it can go to -stable:
>>
>> https://git.codelinaro.org/bryan.odonoghue/kernel/-/commit/ 
>> f10539a3cbe5c072829b082683f0d1393a7e50dc
> I'm fine with merging this one before this series, AFAICT it should not cause any
> conflicts. Note Patch 1/10 of this series also has a Fixes tag.
> 
> Note last work email from me before the Christmas break, see you all January 6th.
> 
> Regard,

OK, I did a tiny amount of gitting to prepend that patch to your series.

---
bod

