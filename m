Return-Path: <linux-media+bounces-28305-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 7ECB6A63282
	for <lists+linux-media@lfdr.de>; Sat, 15 Mar 2025 21:44:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A0E273B35A1
	for <lists+linux-media@lfdr.de>; Sat, 15 Mar 2025 20:44:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0184B19E992;
	Sat, 15 Mar 2025 20:44:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="PlvXnK1O"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60E5B18B494
	for <linux-media@vger.kernel.org>; Sat, 15 Mar 2025 20:44:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742071461; cv=none; b=H2RGC0jgMGotqBQkdBFATCtjlqrbQx+xP+u6kp7BPbTSEBXQXuTfSQmEoVFLeQywOWUH8J00HkEvaNx9EheV+ctQnq8b8lbOmjFt8Ta/BnIY8YYgRinjmlri2P2383+gcj7YGAAJcy+GN2/6PtccNxhtKodqvoAJpP+jknmoe+Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742071461; c=relaxed/simple;
	bh=UrY6nMsgneyxwVitxpp8GdLiScsJ2kF1ZZ7lKeKD6VQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jjjOUABi/tne/AoWhVDskyIZRHKTkAQTwZwZ7CQDCDtBSDxv35WuFyfpgJ9WWwHMSCiwO0SKpGfk10z0Cm7MnYiv/hvszhgz3/FYdIzXzjXS7W2TBKG/TFnoBYdUVEiIfllKCD14GxRV6PmunCO58TOLf1qo90vTboiB5gt/ylM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=PlvXnK1O; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-ac29af3382dso531996766b.2
        for <linux-media@vger.kernel.org>; Sat, 15 Mar 2025 13:44:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742071458; x=1742676258; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=kiCbI7Gzyj+EF3OtodXFSWjoLnp83dFn8x6j5hCScRI=;
        b=PlvXnK1OuEBZnxKySh6V/nqlBW+qUAGnBltHNhgMV70pzvvInSBuaNrjbF1XaMRWKE
         CS/8miCcVb1DqP9lQv43M+za09oDH9weA59PS3vzdTCJG5K/HNnyuYSojqrON9xdUsSB
         H7th5XB2Z8BwQIoGYYZKLsSF1Bg5vugHYMS3PZfrNw0Bsi2eWeGCbAxkZJp6z5OuWect
         pRybzl/kQDjBwiXkmmhTldtTN5l2d00PfekD0uaeP7KzfGLRtU3rNLXJWlb1tV/ZcS+p
         vpKgRw8ogVuflQa/oHuY/uJjg/KpteqcuZ/45jmfVQG5QHXJqX/016/seMx61I6APjV9
         YLOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742071458; x=1742676258;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kiCbI7Gzyj+EF3OtodXFSWjoLnp83dFn8x6j5hCScRI=;
        b=CGJyHU8wLaq4Zj5J4ndfdWVx2+gDEQU7hrW/NUeVg3fELBeC0Qnw5ueZpJ8XNrVV1z
         kYYfDBgBWEytYQZMFQySx14vnIibbxlSCCEeBJuhhYDQYUaPM5HeOEdFhPuSk4k7qQfQ
         ZgOdEuSjM6wWdVB7C9FC9Imv+iZm/JZTCrRb8gfkBnFJ+bsGN1R4ZahDGVrAXIcV5Iv5
         MfFXpgb/eTkdZPRYWEpcDjDctkwIN1fQsryKPQku+lA+zpyw04WqYaMuIKOPX5mmBOQ8
         qi/O+P7fbMzmQ7C3oijrvgRbGAs1hT0KbpMYNUaWfKbMm5RGNmHNb60y3oK1MU8DarTb
         SnUQ==
X-Forwarded-Encrypted: i=1; AJvYcCU9I9y+2aJ3unjKiNXaT2ATJB6kRN/ODuYud/uilry6R10aT4tYBxkWq2aSclXDWlUU4CwaoYqYeAfJmQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzDGEswilTjUrTTWzks7g74T73n9TGysXnporeWB4QY+/J5nl77
	+0sJa7fEinRnTrIWPVK18WlazlLv9sFed8V//OjDEB/MYUBxQz6qvZ3nN8rDbec=
X-Gm-Gg: ASbGncsn2pofI3JL6z0M/BtODiweKKfv99iLHRXYUjf0PqMplYW1sg+IWd/zFxe3FWu
	z+DzD/GvF4Gfao1fAcMx3N+cNCW1OADv16RVM/9IBvBzeDMRKEoaGTwplFTU5g5MdsnRtlik0To
	3PBRNH6ZZ9cDzCeXDmEAQ6NtipTvG5kYishHCYEab+OvhpX46dBVVfnKXA8D6oPDEOaUAFSarym
	2IBJeeG9nIYMEou9MzmNmKxLjKyacd48LcjJdkcU/4bLl+X0ZgWkJP0zPw3D3VZhE2YDWtJCUj/
	u/aTYC3KZwF6lGrUBXet1k2Fe4D9BTy5S7zOcLqfwR8JMQS5DphUenld0yM2bO4W4fJ7UhigVRz
	ggm0ABzsLGkb/4WmgQk3JrZEOSgvJQkiO0MLQCZRaggpnp7BQ1HE/1yW+OHjWaWjtj5RbWa+3Wx
	24CcF7jRB3Cdw9i5NtxhSVqYOABPxmy9w=
X-Google-Smtp-Source: AGHT+IGvgJsrZFGZJ3hcO00qldh1D3av5Vm2noV9HFjtKx2uuz3SkYbCNX+mFNB4qccA4cQ+PmVACQ==
X-Received: by 2002:a17:906:c106:b0:ac3:4491:cf76 with SMTP id a640c23a62f3a-ac34491d8d9mr354582066b.26.1742071457594;
        Sat, 15 Mar 2025 13:44:17 -0700 (PDT)
Received: from ?IPV6:2001:1c06:2302:5600:7555:cca3:bbc4:648b? (2001-1c06-2302-5600-7555-cca3-bbc4-648b.cable.dynamic.v6.ziggo.nl. [2001:1c06:2302:5600:7555:cca3:bbc4:648b])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac3147f0cd3sm416177266b.70.2025.03.15.13.44.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 15 Mar 2025 13:44:17 -0700 (PDT)
Message-ID: <65a8dd5b-5737-4449-8ace-c325ed046884@linaro.org>
Date: Sat, 15 Mar 2025 20:44:15 +0000
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] media: i2c: ov02c10: Support full range of power
 rails
To: Hans de Goede <hdegoede@redhat.com>
Cc: sakari.ailus@linux.intel.com, heimir.sverrisson@gmail.com,
 linux-media@vger.kernel.org, stanislaw.gruszka@linux.intel.com,
 ingvar@redpill-linpro.com, hao.yao@intel.com, mchehab@kernel.org
References: <20250314101125.9853-1-hdegoede@redhat.com>
 <20250315134009.157132-1-bryan.odonoghue@linaro.org>
 <20250315134009.157132-2-bryan.odonoghue@linaro.org>
 <4115af83-3574-421d-93a9-650ece7523dd@redhat.com>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <4115af83-3574-421d-93a9-650ece7523dd@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 15/03/2025 20:41, Hans de Goede wrote:
> Hi,
> 
> On 15-Mar-25 2:40 PM, Bryan O'Donoghue wrote:
>> Use regulator_bulk_* to get the array of potential power rails for the
>> ov02c10.
>>
>> The original IPU6 sensor from Intel only has code for avdd but on other
>> systems such as Qualcomm Co-Pilot laptops we need to manage avdd, dvdd and
>> dovdd with regulator_bulk_enable/disable.
>>
>> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> 
> Ack for this change, is it ok if I squash this into the upcoming v10 ?
> 
> Regards,
> 
> Hans

Yep, please take/squash as many as make sense for your v10 and I'll 
follow up with anything else.

---
bod

