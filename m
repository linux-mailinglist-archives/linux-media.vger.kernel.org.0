Return-Path: <linux-media+bounces-20183-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C6CC89AE30F
	for <lists+linux-media@lfdr.de>; Thu, 24 Oct 2024 12:52:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 717051F23128
	for <lists+linux-media@lfdr.de>; Thu, 24 Oct 2024 10:52:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5D73D1C75F9;
	Thu, 24 Oct 2024 10:52:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="oENLzDxV"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC21B1B85E2
	for <linux-media@vger.kernel.org>; Thu, 24 Oct 2024 10:52:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729767160; cv=none; b=nOysmHiRSxJHYpQwTblprrllhznV3PWam6RuY8Wz9fFLh8/5+SHH+BEIid1z/+z82klk+ppJLTRXCWhUgqdoN2KPu+XtxTcxcJYNg24Bw+RoZKOVEYel0YW5lH0lKQwVtJ9UbEYA6ywlNVR8IXzGNt1TwtAWwgMyyhi9Ld+D174=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729767160; c=relaxed/simple;
	bh=4ekxkQmmhvir+5TyqyoCfKPaWhWRbylq+LC4f4N042s=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rKxl9vQ9CmNGCIjIgmJ4Q/tImF7/nZ2xp6A6Slr8mri8yPvUer0RpyZRG+bG1NG/GBbm5kcTs207ipuKDKwp/elj5a5JDZ2UB18Bwp6KabUQP55paMf31rbXmj9UbP3PI4J19Ytnn9UA+7IT1WNQD7VEC4nNq5wbP0NgaXt4Gqc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=oENLzDxV; arc=none smtp.client-ip=209.85.208.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-2fb58980711so6882291fa.0
        for <linux-media@vger.kernel.org>; Thu, 24 Oct 2024 03:52:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1729767157; x=1730371957; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=HOyAXE0GUW7cmndQ8mO+yG/0idrUbxgKGObOYyEO0PY=;
        b=oENLzDxVnsPkZqjdU6t81Ht/73nwSyVfScyb1kO/nY6gcbXDxW0Fw8fc1HHkP3/6Og
         VMuSUvKuIm3tQ1D9bffii+h6RCdsXIeB/nq3g3k3h05B+3UWW++8T/Z1M2fQIes6oeY+
         UsIa2VlfCHpz3Plrxq5quKtaLz2HClwl66g47pafWIW5QVu/FI9Uj6a524DwxS+sVgde
         S24Obk4qmvwCCpFEIojOvrMQrH6euPOv2Irqhrldo+GSZTY7RXGil46kTSotCeqw63Sw
         2aAMkLUSgpTh1aVQiWCqvhUVKwo7WtyYtwD+/LVTCJ/vAb1yFBdodZi3S88ZNPwa61n4
         mD7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729767157; x=1730371957;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HOyAXE0GUW7cmndQ8mO+yG/0idrUbxgKGObOYyEO0PY=;
        b=Z6D9FhMK97EplmMwQUQ4FsTDRbrYBTERYFJ3TaTbBwCj2PC6U91mRUQg2dmS5GiefU
         QBhenIZ6J2RdekR/OwK8RKac+kPFOcQdGCWPnwIb8aXo6/heNJNarTIVDowCwM9YHIcg
         sSnKG8juvs5Bq9KKwgQomxBXpYkA/52nCQUVAqoAnR/+re3BYka4af3EFq+cvscT1HHY
         6A0yf8infZ+qycb7bGi2f/11aivQaCVZOZ0rvPG2UJLn4KkruGUh08dgtk9WnMIt/jrM
         iKm95pjiC5y5+d2PT3QHie67mXUuonXG9iec+OUG92fEQAr+LyofWFrru5VKcn2/T0eH
         Du0A==
X-Forwarded-Encrypted: i=1; AJvYcCWsIiU9pFOC5NMTmwFj+T+7hGzRG5cmnOOjSdLNqCuPx3m4tGOou2f7dQBTe0GkoWsUSK18VU+qfq+vsA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy1zrOw3rAtZlWnHZj2AJKWTs4GltN1Smg9AIFKZ7CAdPnzkkRy
	NjDWTUqT3i2+NphzMuYI8xEFWJMOMbLdBoxYj9r3ZP7Vc6m3Yyx8UkLRvbayQXQ=
X-Google-Smtp-Source: AGHT+IENzz8Bqoyagoc4Wih98itZjoGtQwFFRLvNgNZBkineUHMgpQUAnSo8qRW6/WuGNnl0WyLEdg==
X-Received: by 2002:a2e:4e01:0:b0:2fb:6169:c42d with SMTP id 38308e7fff4ca-2fca8279527mr7472501fa.41.1729767156541;
        Thu, 24 Oct 2024 03:52:36 -0700 (PDT)
Received: from [192.168.0.40] ([176.61.106.227])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5cb66a654b9sm5603174a12.34.2024.10.24.03.52.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 24 Oct 2024 03:52:36 -0700 (PDT)
Message-ID: <43dbbe57-9045-4f85-84ba-1bd5a9951fdf@linaro.org>
Date: Thu, 24 Oct 2024 11:52:35 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCHv2 2/2] media: venus: sync with threaded IRQ during inst
 destruction
To: Sergey Senozhatsky <senozhatsky@chromium.org>
Cc: Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
 Vikash Garodia <quic_vgarodia@quicinc.com>, linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20241024061809.400260-1-senozhatsky@chromium.org>
 <20241024061809.400260-3-senozhatsky@chromium.org>
 <4b96f1f8-e084-4599-abe9-05039bfac569@linaro.org>
 <20241024093916.GM1279924@google.com>
 <b9a42abd-a078-4740-b070-ba5c86855e73@linaro.org>
 <20241024100857.GN1279924@google.com>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20241024100857.GN1279924@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 24/10/2024 11:08, Sergey Senozhatsky wrote:
> On (24/10/24 10:43), Bryan O'Donoghue wrote:
>>>> It also occurs to me that most of the close() operation code is shared
>>>> between venc_close() and vdec_close() a welcome patch for V3 would be to
>>>> functionally decompose the common code to a shared location.
>>>
>>> Any preferences where that "shared location" should be?
>>
>> Probably core.c is the only place we can jam stuff to be shared
> 
> Ack.
> 
> So, we need to
> - export a couple of symbols
> - include vdec header in core
> 
> Does something like this look OK to you?
y lgtm

---
bod

