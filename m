Return-Path: <linux-media+bounces-23919-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 333AE9F9449
	for <lists+linux-media@lfdr.de>; Fri, 20 Dec 2024 15:29:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 88C45188AC34
	for <lists+linux-media@lfdr.de>; Fri, 20 Dec 2024 14:29:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D060921638C;
	Fri, 20 Dec 2024 14:29:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Dj23hesV"
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 731CD215F78
	for <linux-media@vger.kernel.org>; Fri, 20 Dec 2024 14:29:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734704960; cv=none; b=ZlSbiXuTsKgctrndos4lOtdy6nNNPX6fmtWWy/JRvskyd7ZuM5KyyBr5lEiaQfxV3Mp6hpbrf3BDQjSjQXngHLP6b51PWlsLzp9ElnSrmP8eYpZhKmicx0C0gnDqnd3H9pdRRj4TIqormmGX5IqYqmXyiQdZvzPelz/AP8BHzCg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734704960; c=relaxed/simple;
	bh=rYnknBKlfYFfL/9S/1ElQ+QBR+tmjhPSGipskw92xIU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=K/HNOrpAhp/hZiUFBezfRUWYhNNs1Zd84+VVFmpj0rAv614FC5pRxjxjoa8Z4cYSMqlNjeIinUOGP8lZFiU+mlOBP0r7vxOSRb82nT6ARiisQx73Hr2Ym6IDns45UCl6ceN28MF3UfPr6tkp9paCu+bv9OqAfwt2LUp8hS7+kno=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Dj23hesV; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1734704955;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=8YP3V5vLRqJQ2vdp8NefB6XGR4dGdh29y1zS+i8D8+E=;
	b=Dj23hesVn4LVUHouDpLgMzShTY1trCilUs67fbTeT3ZUfcShcsEtRcAya+4cI0JZyc0c5v
	dftrqV7JqGq+Eq1JOipe/moYF55/uJ8/WiNBj8AiLVUf6peEp62WqHmIYr/P+YmdfNoww6
	LvkoBGENRBVLjhxOOJVqtQ55VURoW2o=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-647-UUXZ4zP3Px-xbXdR8OBNNw-1; Fri, 20 Dec 2024 09:29:13 -0500
X-MC-Unique: UUXZ4zP3Px-xbXdR8OBNNw-1
X-Mimecast-MFC-AGG-ID: UUXZ4zP3Px-xbXdR8OBNNw
Received: by mail-ej1-f69.google.com with SMTP id a640c23a62f3a-aabf8e856e2so201908866b.0
        for <linux-media@vger.kernel.org>; Fri, 20 Dec 2024 06:29:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734704951; x=1735309751;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8YP3V5vLRqJQ2vdp8NefB6XGR4dGdh29y1zS+i8D8+E=;
        b=jnJihdfF6k7cdCOr8gCFuQW8VPlauqmhv32Zr928OeXmxAXxuOYZEHTBdnqCsLwkY1
         Yp15O5JEDrF6LqPwFl2EKELZ/uIE+DY8ByHwaKaor50INS7IV6I7ww0/am2kaqhitclm
         ItMEEnsM3GJyqS7j7RaacpRSPBaMaCAqOmMuHAFXfPQ5LJkb/jnmOiLNkWtwK6o4DENn
         vDfZLdj1qF955LPDY4ZDK16iLcMM1vzg+K2D3H2neUV8A4RaRZfQXEVtU0Fw1uW55clt
         v9G3e3pBn+biRGoK1ALU8Fx5SeibYzQ3Ae4CqC1YrZUtuS/8TWCu8A0UUkB2ZVrgi70i
         yjPw==
X-Forwarded-Encrypted: i=1; AJvYcCWmvlfbsbof5FUTFYCf7kzfSgrLfkj5P9LKW0XDJgLnlGwKkP9zq8qsDHyhw8xMQGR9YcuaXOFaZpA1WQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxYYk1M1yBspa0bldGHKiTD5e3p9nkM9V6p05CQJSTMi44dTbye
	b+kyfTkbsdnYh8HRhYMJ0AERzX6lhuUbWW1KB6FVT3Ad9iuICKkkoVHUbWwtdd5p2LeC9S80jIP
	SGlttJHk8O8rpiZRrOVeCsJmc8w6q6u/gVnx/ZCuk00B7YliiTbMes/CntTo1
X-Gm-Gg: ASbGncvNpc6KpFsa/Sk34GUbZoV/DZv35TtQynoXp06Qpf+vYPM05GLwreaO+Z3dJt1
	3GcSwXAnJLND5FAJBaD8k3TO3f2IY6sOnjkGIAlyrGDxU5t0KUCPAe4y/ZoFQ1uzhv4Ia47Luur
	jrJX5UFgzdmhqI7NM2R68j7NxvW8AN8eJkJgdcOQzwMhc2rn3Hv4686afq6GSM3GlweDsCbG9rR
	/YfSOs2kl8b7JJ/kDfyV5UWANiUHy1/iisKxi+4qSobp4ViicjcheI1e39iC35A550bZcH+due1
	WTPuLua12MvKDIp5QXEEOvMcfKpu2aJS9eEL2RJ+3N8jyNUG8t2fHccFxNQk2DjiPCv6zosoQSr
	kYJFgtzLFQ+azFEiZ/RtdeyxC2ZJCdZU=
X-Received: by 2002:a17:907:9712:b0:aa6:7cae:dba7 with SMTP id a640c23a62f3a-aac2874b6dcmr267821066b.4.1734704951465;
        Fri, 20 Dec 2024 06:29:11 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHWOYwMFx4V/tbPDZX4tTISX4X6kzf2n1Ih021YmJ1Jnia/vK7xJCXPe78Cf0IrKo5huh5piA==
X-Received: by 2002:a17:907:9712:b0:aa6:7cae:dba7 with SMTP id a640c23a62f3a-aac2874b6dcmr267818366b.4.1734704951085;
        Fri, 20 Dec 2024 06:29:11 -0800 (PST)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aac0e894781sm180538166b.44.2024.12.20.06.29.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 Dec 2024 06:29:10 -0800 (PST)
Message-ID: <1bf92f43-91ff-4c2f-8b86-cf7618333725@redhat.com>
Date: Fri, 20 Dec 2024 15:29:10 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/8] media: ov08x40: Properly turn sensor on/off when
 runtime-suspended
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Jason Chen <jason.z.chen@intel.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org
References: <20241219134940.15472-1-hdegoede@redhat.com>
 <20241219134940.15472-2-hdegoede@redhat.com>
 <a2efc7e7-6e73-41b0-b8df-ae28175d7dda@linaro.org>
 <e3573352-f73e-43f5-8e21-6c313dc54057@redhat.com>
 <c9f237bc-40c6-4b41-a963-abac306458bd@linaro.org>
 <a2fd753f-a999-4d17-b799-be4a6ece7bea@redhat.com>
 <2349c1b9-0cdd-4759-9f2a-68ae53f22391@linaro.org>
Content-Language: en-US, nl
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <2349c1b9-0cdd-4759-9f2a-68ae53f22391@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 20-Dec-24 3:27 PM, Bryan O'Donoghue wrote:
> On 20/12/2024 13:59, Hans de Goede wrote:
>> I guess you are going to test the rest of the series and then provided
>> a Tested-by?
>>
>> If yes then I'll wait with posting v2 until you're done testing.
> 
> I can give you Tested-by: for the series now + the change we discussed.

Yes please, then I can include it in the v2 posting.

Regards,

Hans


