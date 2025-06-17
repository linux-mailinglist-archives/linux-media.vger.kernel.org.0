Return-Path: <linux-media+bounces-35109-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 72707ADD649
	for <lists+linux-media@lfdr.de>; Tue, 17 Jun 2025 18:32:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E115E2C66FC
	for <lists+linux-media@lfdr.de>; Tue, 17 Jun 2025 16:21:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B10D62ED15A;
	Tue, 17 Jun 2025 16:14:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="bembcwHe"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 408812F94B0
	for <linux-media@vger.kernel.org>; Tue, 17 Jun 2025 16:14:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750176846; cv=none; b=rz6nOPNKqSxhCDC0Lc+CZwQNn4lAww04REXKQ2Ikf1dwtHOc462Lq2VvOQJ6z9XIJuWIZMfx9AdKJL7RW3jtQnqu0M+9YJ3gFz5K0/z1SS3i5YFNDwXmjV0CtzB0HvDAFBNI2UYmW68NtHD1EHOVAjeQEpDZqgZD3mKo/WDXm/c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750176846; c=relaxed/simple;
	bh=HibozGPFesliV8OgwYZN9gjYKS+jirgSrqd5NNkJ4Rg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lgdAoUI4Qrnt5XjQnhSnObKRyCFv6je8MZ4FYoQdi88VBZL/nKXY49r+wtfLocJHhlKOY/qvgdO2NReuoJhnGK033FXd0qNWcFJg0JvekcacLyIrHONUFtJxy5ij26Ad9cPM+DX0Byy3cIfkLbVEnFtYSnBITia72dzgT3tt09k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=bembcwHe; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-5532bb8687dso477370e87.2
        for <linux-media@vger.kernel.org>; Tue, 17 Jun 2025 09:14:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750176842; x=1750781642; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=VwHHP+Jm7jdfOBIcFA1eS4md1KjUxBNLlZ4Vxxq8f6Q=;
        b=bembcwHeVPdeWFI/0vSM60+1YXwJ5gqAsbQ6vWc9XN5GD3neC4c9PSOK/5rRZKt4mQ
         tIxhAUXFKEZrmefGUkquBARjvclkriFAGEtoezl+NevKWgNY5S9O2eL0EG5/vpto2ovn
         kvH1062/q1bukhCs0tD1pt8tS9RlBHBph1z50pg48x3s2F0+H1UmReXEwYz5MByFsese
         /NfXy05xvwQyM3zNSu6L/VX1bCuv2qFZ272F1aad3Mu40Mn9Wt/OApUi1qbUxEcHzByH
         L3tJ713mdGhxx69XpO1Sa5+Wv71CBK6Jr1G0YAURvdki1BLa43htUuykN7Cg3oG0avKJ
         fTOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750176842; x=1750781642;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VwHHP+Jm7jdfOBIcFA1eS4md1KjUxBNLlZ4Vxxq8f6Q=;
        b=QRq85NPPYJvKMTiZsx0aj31DXhvcrBqr6Vq3SSLs85F8tVBUsu8Ub5krVvfmuUslIX
         Ss30i6e7cjq6uRryGy8yRdDTY8vzGodc5JT55vL2atDLE3f22QIP4xgrwxw3ZGc8wEJx
         dl6G86CFD8NgTiEfFHUt5qiBLTEjKFf3OTDEaYAnKaHk3oVFHqUhbcFz8CrzKuKAIpvK
         nmYQxvCFdciAKqhmZLGDLU0FA7OkLkOBL39AXoUeDFbInLC09S7w5JggFZXZr1rgHyFc
         l+FnxR7jhx9oGTkM6qX7WJFUM65PwgerhH+HH0LhTGhW/m78CM1fMCoSv+iHKnkrLv9i
         D2Fg==
X-Gm-Message-State: AOJu0Ywi+b+aIU1LIoGkeZN4+0UXf56okLqEyFVsyJhLlgUbLraDadlX
	udVFQD08jL2GZDaCrUEBwnL/ve01kblxovUnDFA2jHbIgCjqcDQIHNiPuWdqxXYcqU8=
X-Gm-Gg: ASbGncvmyWDm1vetiyqOolBrenh2EPCBO8dWIaJNVJ6/O+C9/XrrHuxkcebNQWlU96o
	nw8q3HPWumUoduxSESJOkEjC4g4+YmIIOdvY1rr9s3jZmxL/exkfdbztxTbLKaneyC0LTNLO5KI
	8LC/htmH/xDAJPDHRO7D3onskpu+lOMCT5JXb61LlxaTnJhLwDwwBrZUxPJhEPhNUyICTleZG5M
	jQuq6IRRCtjn/F76mI5cMJUHpYLcayQtBjnmmk+vYNpnv9bF7O6VWy/TUEZzZHMHIiFL4VjCi/b
	3hRt1zR0Ej0XQGs5VKazb8B+HeemFUqcpKjh5WAlO7IUKcuIE6hT+NxD8pXFsTYpWmnrN8Pw7IG
	kOLrQsYFI8+mfR4VkIrj69gbokP4eiDQaaA3onsk5
X-Google-Smtp-Source: AGHT+IFtJGOsEIN9wIrE4whIwsLNcr4Gc4S5t1ikiNayAUpCipk8vMTEFAXl6LwEMedeqywtEQW/cA==
X-Received: by 2002:a05:6512:3501:b0:553:3897:7a7d with SMTP id 2adb3069b0e04-553b6f2bffemr1112524e87.16.1750176842380;
        Tue, 17 Jun 2025 09:14:02 -0700 (PDT)
Received: from [192.168.1.4] (88-112-131-206.elisa-laajakaista.fi. [88.112.131.206])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-553ce7a07f5sm206674e87.237.2025.06.17.09.14.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Jun 2025 09:14:02 -0700 (PDT)
Message-ID: <5f1eeac8-a977-4530-836d-7e0459d9a433@linaro.org>
Date: Tue, 17 Jun 2025 19:14:01 +0300
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/9] media: qcom: camss: register camss media device
 before subdevices
Content-Language: ru-RU
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Hans Verkuil <hans.verkuil@cisco.com>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org
References: <20250513142353.2572563-1-vladimir.zapolskiy@linaro.org>
 <vSVeMnj1dcmWmxoKEUeVmrGbtTJrcjhuCtom4Xf8vz4p_o8rEeZNaeyQGylGdx4vE1lgUmUwTCYq1aWf58n_AA==@protonmail.internalid>
 <20250513142353.2572563-5-vladimir.zapolskiy@linaro.org>
 <c6f463dd-f3e1-457c-b83d-29daaf7a8d00@linaro.org>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <c6f463dd-f3e1-457c-b83d-29daaf7a8d00@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hello Bryan.

On 6/13/25 12:06, Bryan O'Donoghue wrote:
> On 13/05/2025 15:23, Vladimir Zapolskiy wrote:
>> A media device can and at least for sake of simplicity should be registered
>> before V4L2 devices including the ones added on async completion.
>>
>> The change removes the second and out of camss_probe() media device
>> registration path, and it allows to get a working ISP media device
>> independently from connected or not sensor devices.
> 
> So are you proposing this change to simply the code or for this
> secondary reason ?
> 

This change halves the execution branches with media_device_register()
usage, this is a nice simplification by itself, isn't it?

Please let me know your worries about the change, if there are any.

--
Best wishes,
Vladimir

