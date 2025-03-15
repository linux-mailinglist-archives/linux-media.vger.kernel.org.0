Return-Path: <linux-media+bounces-28310-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 130D5A6328F
	for <lists+linux-media@lfdr.de>; Sat, 15 Mar 2025 22:12:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0339A18901E1
	for <lists+linux-media@lfdr.de>; Sat, 15 Mar 2025 21:12:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A07161A23A1;
	Sat, 15 Mar 2025 21:12:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Qz9m9Lx9"
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 611D8197A8E
	for <linux-media@vger.kernel.org>; Sat, 15 Mar 2025 21:12:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742073137; cv=none; b=gLBH6yKrZgFIyEv6bHEgslbDonJG7RPdw8Cpj422v4FT7lwdi9TkNt/OEh7c7cZ6NiCmCTSmDv1520zk04MhCcxoKT44luDLdc4r+tLV/zzaPUF0LI8BKjsbaycQI0TZY6/WNlc2v2fab7iNeZrt860zmul/lARC+on08PXQyxk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742073137; c=relaxed/simple;
	bh=LlscGHFCyExCofD7so4puSbqHd/KK534erjve7WEOsU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pIvLeBJ1Zs7QBEBfUZzVccSe0QSb8RPKXUXCaa0NbI65IUuo0G5zAvjTpJOtwwZoh8YvVdChqdSAon5oxA6aQiVmjQEmfHyRmAxbK6Za76bIioJ6SAgzez8mqh1QdSUAFLoPwn3/T2Qia4dRHXnwAnfO+vOERGYf7yhG8ZbHXIg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Qz9m9Lx9; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1742073132;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=QBKwUPcWHG1UDx+j2SDyZ1EMe7WQ/s6OR9xnLxgvOyc=;
	b=Qz9m9Lx95+dO/mbGwRjAE1SGoz+M7JkNvo8TMFTLodVYYIHQWHwZL39LdxDRh9bVDuYlmh
	+L/mriq/ZG/uVsPwMBX060XodcMbB7BB5ZDfxxb9oFZRj3Mi95O3kho7yMUYkT4tMnUu0k
	fPRwup/FmDSTmPhhlN0taiZHrcBxGgA=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-92-hFKg584iOwuQvaJDF1LTFw-1; Sat, 15 Mar 2025 17:12:11 -0400
X-MC-Unique: hFKg584iOwuQvaJDF1LTFw-1
X-Mimecast-MFC-AGG-ID: hFKg584iOwuQvaJDF1LTFw_1742073130
Received: by mail-ej1-f71.google.com with SMTP id a640c23a62f3a-ac297c79dabso314826666b.0
        for <linux-media@vger.kernel.org>; Sat, 15 Mar 2025 14:12:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742073130; x=1742677930;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QBKwUPcWHG1UDx+j2SDyZ1EMe7WQ/s6OR9xnLxgvOyc=;
        b=SM7V4QpLd4FbWVk9lWyYonr6IY2kGSiZRyEM374QFa8w290jXE/VJlJCSo6aOQREc3
         IGOU4sczG1gRzRugO2oj02rLFGzEcmenej1ei8wqoQQ+vFrVy9IflAiXVYlaGTbeL0eZ
         Rs5h7x81Gu0j7bUgff6uZ3bervFJZ8312nd5KDD9v63JFlwXQAcZCyxHN/vWqx4M/Uaj
         QLOH7oAMUQKfpgRbkcY5zpnm3/MMNzyneD6d/ChA8hbAukyjhsdXLJjUJz1AgU6xiPQ3
         pm8hiLgeOz/IYHux4ZjjeLu+2980GItgzKeA7XzvxSMHR0MQAghFLkHT5/dLxs5aHeYT
         w56w==
X-Forwarded-Encrypted: i=1; AJvYcCUMYkhlDg+9ZXGWejHeLGfJA1FTCx4yXNSwLj8jBPVjkgPQz7GnRX1qR6RwA5jCL2XZWiW3lRjMoorxgA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzIazVkwVfpG2R7n0xsjZo3LlITnA/VUcCJaF94UPSROflTRX5m
	NkQFILwRsBgGK9SiJHyv+385G9hXEadtaYyIX0ortFrxBTWLB1qBm6/I681PfQP0gkVfnXASzBp
	5Ac1i75NOH9uQvoHsocK5NjADQk+q4S5ufLTKeILyYxgIIxrqrwR99/vZMcrL
X-Gm-Gg: ASbGncu8Qb0L4e20aegfwN4I90A/CF7JrZ3jlJh48CIqSHyTDCEYS3ejEAvsp7viOpZ
	3H/W+e/Z92F8ZOy0Gl1iBCwAN2Xy1lldaXqGcJmwTUcrWkeN4REcmDQRCXtwtYpigrRn8IoI48y
	U7PlvVyH3GTmcymdOgQLFH9JXw3Zc2KiWgYiLeTiXUq0Y5BY98B/4x1u96EkdOSIfITn+7nXfYP
	dFSsZJ/ipoN3MEebQ2rA8g80SDYPeV7QdDAPo2hYgSyoaeR7JtTNxND2S7r78LMMF6uZVFnoDM6
	t+8cpbIb3ggclXHLreafozJAtYm8Y5oQ1gPROQubuLsn4f2KcjF4dKUAjD7CrinpecUdYlqMkNR
	De8AhgKPcnL3un3KClLUVK8aU6fvJBVzjiKtOKJ5bYuNW2Sg/Pkt4vb5jrHtpsWopcg==
X-Received: by 2002:a17:907:2dac:b0:abf:7b38:7e64 with SMTP id a640c23a62f3a-ac330396bccmr861744866b.43.1742073130078;
        Sat, 15 Mar 2025 14:12:10 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEqtJUMyzabZTVkcg1FtYLF9LluPBc8yKlxpXKGJss8GU2g52DLKcBKPN5zdPY6xY8fyfAEdQ==
X-Received: by 2002:a17:907:2dac:b0:abf:7b38:7e64 with SMTP id a640c23a62f3a-ac330396bccmr861742566b.43.1742073129736;
        Sat, 15 Mar 2025 14:12:09 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac3146aef90sm417946566b.6.2025.03.15.14.12.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 15 Mar 2025 14:12:09 -0700 (PDT)
Message-ID: <e8d5161c-1a33-4c7c-aa85-ff5eb2d33374@redhat.com>
Date: Sat, 15 Mar 2025 22:12:08 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] media: i2c: ov02c10: Implement power-on reset
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: sakari.ailus@linux.intel.com, heimir.sverrisson@gmail.com,
 linux-media@vger.kernel.org, stanislaw.gruszka@linux.intel.com,
 ingvar@redpill-linpro.com, hao.yao@intel.com, mchehab@kernel.org
References: <20250314101125.9853-1-hdegoede@redhat.com>
 <20250315134009.157132-1-bryan.odonoghue@linaro.org>
 <20250315134009.157132-4-bryan.odonoghue@linaro.org>
 <54b4b5e6-06fe-46f8-8484-3c86aaa46cad@redhat.com>
 <c9c6858f-a250-45d1-ac0c-3aeaa56fcdc5@linaro.org>
Content-Language: en-US, nl
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <c9c6858f-a250-45d1-ac0c-3aeaa56fcdc5@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 15-Mar-25 10:09 PM, Bryan O'Donoghue wrote:
> On 15/03/2025 21:05, Hans de Goede wrote:
>> So I think for v10 I'll go with the above solution to sleep
>> 2 ms in power_on() before de-asserting reset.
>>
>> Bryan, any comments on that ?
> 
> Don't we go through power_on/power_off cycles if/when we add runtime PM though ?

Right, notice that I said "to sleep 2 ms in power_on()
before de-asserting reset"

IOW I'm suggesting to go with your solution.

> So to me it makes sense to do it the same way we did it in ov08x40 for example.

Ack, I agreee :)

Except for explictly driving the GPIO high before
the 2ms sleep, it should always be high when we enter
the power_on() helper since power_on() / off() calls
are guaranteed to be paired (and we request it to be
high initially).

Regards,

Hans




