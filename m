Return-Path: <linux-media+bounces-37304-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 74C33B003FB
	for <lists+linux-media@lfdr.de>; Thu, 10 Jul 2025 15:45:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D12E916FE91
	for <lists+linux-media@lfdr.de>; Thu, 10 Jul 2025 13:44:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A988E267F5C;
	Thu, 10 Jul 2025 13:44:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EzweQGPM"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67A8F1E7C32;
	Thu, 10 Jul 2025 13:44:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752155085; cv=none; b=CZa1B61fbejsp8GsSw12KRd7x8AECY30ZOBSrW3RXyDCnd/slfdYkhajwB23b7A2JEmMCKQ+oDrZf0oU+SD0s0M3an+DTVZhURK/knO/zhzYYZgvWchjjshnS/IoaogyJ5K6Upp9gf9nlCxBxKSlt1xz0AOzg46+S5Xt6UOS6/Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752155085; c=relaxed/simple;
	bh=axItH2vBexI9WYp+hgNirm/qy/Qm2h6LocHN2HrnuC4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=U6yS+mwV6rmx59sNXkXEvhBwHJl8MQg+5bcEsQJ7mGhSAX1/ZdjkTaacJsIbZaHnF363TTTu6+uQBS+ix+gka3pQS6Qh0sA2QzePc1IhPiAFmgnaGLyeifahUNkB54/Etu/Ac/pQ6uukXNHnkICNNdnsxHRqWtScwyXRXiN/dGs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EzweQGPM; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-5551a770828so875487e87.1;
        Thu, 10 Jul 2025 06:44:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752155081; x=1752759881; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=XZcBxk6Ub7G3BSN8mWlE2MxlVN1ULSz2H9YriMM7YwY=;
        b=EzweQGPMbwf2zQ/WWYcuisjxtIN1gH5oj98b1Bsare42HR8h2Umov3UwrQTmiVloAE
         vI8WZ2Ql6jq2eekvxBy16s4ZC4QcIwHD5wY9z5Gs/7Fzf7KOrZqeo2SdzG++AN3tRyKo
         vxSbtYXcCT1HNAUCQ7sFYnBnWLbv9Ny+iqSZRnNUNdPs6UZuWJJ9BPCHtYOHDE/zxW5n
         PCab9/QfsINRPE1n9veYujAGqOFQ5gY3L3JwlJ0+yMqBANJGKikNSQz9JD21clVS5En5
         PtgRIQm4kdpaUZslCl9+JMeVE2HpIzluwsXVSKMg85Z4OHD7ETwYevozbn7Y/JJtSrAa
         4CaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752155081; x=1752759881;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XZcBxk6Ub7G3BSN8mWlE2MxlVN1ULSz2H9YriMM7YwY=;
        b=aW1cRUweuzY1SBr5n2lo7fnYYDOk9G/lg9He1tyy7MYx7Q6FiKtCcnEAGVcqJrr/gY
         FauvNPDzSwFNMgQPgHZGi7mnJ+D2Oj41B1z1zr8uCTnAFIadvbc45U+iqh0tF55n90lJ
         OCYxtBvS9hhsLds0yeSQLx6YXDG4xtaax5SCuian9/0QqksCoeMvp8wXw2GN24d7fjnJ
         ik9RZUZgJL8piC/Fv1EJVAMFATQYjVvH2eTpMPBrMQKDGve4n7TBCUn3itR4AbPs+L0B
         qE5whFCzGnrL+HmUwP9tVRr1fNwW7Z8nkWqOXbk47js4CWoGENpGfMnaJW3auN4ljpW6
         XHwQ==
X-Forwarded-Encrypted: i=1; AJvYcCVJF82XZUNBnylNhyWiAwtu5c5yDoHQIj/Hghi576JuaEyHLCqHg5owzHGcDXNkO+FqUiDUqJdw+XMjuMU=@vger.kernel.org
X-Gm-Message-State: AOJu0YzLMF0jGLYj3ixFhNwIjn5/9MssSQB9zAMX9bL8c31W1wsd6/SS
	IeDD7gIh22IVA3KNcgCeOOgNVD2OBpqE246GtSIAP4o8vXTmNXKjav4eV+FdYUA4
X-Gm-Gg: ASbGncuYngIJEtciw0CmxsyClUAsw1nx6oiBlqa1FyLzG0MItxKWPQ9CvvAUP8GbgJe
	iB4JD4XMmwpLS3G2v8MVYOKLPAiy6829t5XqffdWhHP7PyKTOFMoZ9SW7OT0BlGWOZnqfOlVo1j
	iqGxL1Rw7moOk2cHdRcFaPnXoYULVWTrMBsRkerPzs5M+FFTY8i8bvBpjPLIpL5aP0TNkD/Kz4O
	Nle9EmOzQLmPKt9gY7beGbWN7Nmb70HmOGSK6mIkDFLfuOXa7K/X6JzeBlYEOqR9wd+GU8PPbz5
	CFqkJYpbpXrpkIq9srqcNcBIcy+peJFmeAW/z0swzyq+BoyNCp+WK9nUaZuP199Z+mx6I97sCoP
	rWSdWf9O+WUC6O7rXsYD/n9U7gV+Pfa4fqIEumYZb0/sBV4GcqAMagcY+6nyo9raVse99D4H+j/
	LLSMjazSiiALZjJCUm0tX1iOno
X-Google-Smtp-Source: AGHT+IF3xzLbFd6eb1uuvSPRe25LEU48vxGpoZoR54hsmwmCzDQWYAU+9W5sMZtYCz1b98KqiGXgsg==
X-Received: by 2002:a05:6512:3508:b0:554:f9c5:6b3e with SMTP id 2adb3069b0e04-558fa90c6f4mr2987115e87.41.1752155081143;
        Thu, 10 Jul 2025 06:44:41 -0700 (PDT)
Received: from ?IPV6:2001:14ba:6e:3100:f766:61ba:c3c7:fc97? (2001-14ba-6e-3100-f766-61ba-c3c7-fc97.rev.dnainternet.fi. [2001:14ba:6e:3100:f766:61ba:c3c7:fc97])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55943b736d5sm369615e87.213.2025.07.10.06.44.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 10 Jul 2025 06:44:39 -0700 (PDT)
Message-ID: <221b6c0b-ac23-4b27-804a-aab9e563453d@gmail.com>
Date: Thu, 10 Jul 2025 16:44:39 +0300
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4] media: Documentation: Improve grammar in DVB API
To: David Hunter <david.hunter.linux@gmail.com>, mchehab@kernel.org
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-kernel-mentees@lists.linux.dev, skhan@linuxfoundation.org
References: <20250708155206.91281-1-hannelotta@gmail.com>
 <680b91c0-0fae-4230-9fa1-da988cb82e65@gmail.com>
Content-Language: en-US
From: =?UTF-8?B?SGFubmUtTG90dGEgTcOkZW5ww6TDpA==?= <hannelotta@gmail.com>
In-Reply-To: <680b91c0-0fae-4230-9fa1-da988cb82e65@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hello,

On 7/10/25 7:22 AM, David Hunter wrote:
> On 7/8/25 11:52, Hanne-Lotta Mäenpää wrote:
>> Fix typos and punctuation and improve grammar in documentation.
>>
>> Signed-off-by: Hanne-Lotta Mäenpää <hannelotta@gmail.com>
> 
> Overall, good work. Here is a suggestion for future patch series:

Thank you very much!

> Subsequent versions of patch series should be posted as replies in the same thread. Currently, each version is its own independent thread, which makes it hard to track changes. This link has the documentation for the proper way to handle subsequent patches:
> 
> https://www.kernel.org/pub/software/scm/git/docs/SubmittingPatches.html
> 
> The relevant part starts at "To that end, send them as replies to either..."

I wonder which way is preferred. I have been reading the kernel 
documentation at 
https://www.kernel.org/doc/html/latest/process/submitting-patches.html#explicit-in-reply-to-headers

Quoting the instructions:

"However, for a multi-patch series, it is generally best to avoid using 
In-Reply-To: to link to older versions of the series."

> Another good practice is to have the previous versions' links from "lore.kernel.org" directly in the change log.

Good point, thank you. I will start to include the links to previous 
versions.

> Thanks,
> David Hunter

How come there are two sets of documentation?

Best regards,

Hanne-Lotta Mäenpää

