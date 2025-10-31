Return-Path: <linux-media+bounces-46108-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id BDF9CC268D6
	for <lists+linux-media@lfdr.de>; Fri, 31 Oct 2025 19:26:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 1476E4E6261
	for <lists+linux-media@lfdr.de>; Fri, 31 Oct 2025 18:26:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3112B351FCA;
	Fri, 31 Oct 2025 18:26:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MT1ndava"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00A531C2334
	for <linux-media@vger.kernel.org>; Fri, 31 Oct 2025 18:26:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761935162; cv=none; b=YgKfHm15lkDtfKGAyZb6IeKrSexIN1nYl4FfCmdqfI0h6tlG1WzQ6yMgZpjiR9XaNdf5lwOGXF3HDCfed5Cu3Ik+5Z1GajU/S3tbWdR/cK0BgrLwKrDGTCPeGWejYhgjrWtfavHjmwVswqMdkGd2bPj5v8Zc7A85AgqJzdtY9sU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761935162; c=relaxed/simple;
	bh=5wljyuN7l1+3LAcJYC29peRbv9g1B2O+lJ3AvNAmBCQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Gc61eR25oNBX2CYTkch2Dv/kdlHJUeUkP7fzD6duJgg0n06xFfN8ff4UtUA8ZweH7xDygrCK1OZo8rC5C7UsWof49cDTsLwbEes+zIr+NdZGMEVi1CraoIiuBiEONUdQoq05i87SowKR5yC3Em97yR6AZcbUceqpKKUxqvOQJZA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MT1ndava; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-b50206773adso676584266b.0
        for <linux-media@vger.kernel.org>; Fri, 31 Oct 2025 11:26:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761935159; x=1762539959; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=jEshRtDhnFN7lkf9rQy/GnzunvRb4T+XwfuS99hpovo=;
        b=MT1ndavag2Rj+s3IHekLEoZ0ZWXvl1PapShXhQI1WDFHRilSNv7jq3k1El9Ui6rNBc
         ItLkMPTQG0xkAkT+rz/Y2Dm8Qoda5XtLWPox6RlhC/0utdXmeLZNbGl5HYWq85yl9RE0
         3AL+lnd2vBInWpZ+XNiW+VBjWvhCxRV9L4BCeH+xLcV7T3/ZrjHRfMnwMlEFpnjhBDRi
         B7/xkM7SXHhUcKQ/5UxLr4PrVUU8LJgvkwei/GWmEgQ8DZpjEj9+tH4xn0wUbyykOMmA
         Nz4AHIIYffdsvHtbiQXYjt0VDEXalsiwzxp8kyhhc2gy5N0xP0ENqO+fJ+VtRb1M1tyn
         Mn2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761935159; x=1762539959;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jEshRtDhnFN7lkf9rQy/GnzunvRb4T+XwfuS99hpovo=;
        b=DsN6J6bv4w+/azXSSpfILxwL33/9naKiOgHvcdXuGJxcQJK6SwggKxQzEHVIgaTiaf
         Ezam+/Rd7cVhtq/WAyNMJ6Hi+B+hjsfYdPdy0Rdnx+HeP9VBlskW/WEc68Tb9WKXSMt0
         RhMaOhVRjjuBPGRGEx4qyttsjHaskwFg7T4x7LIjhL5E4omArqNzYI9AXp2m2OP7td1N
         C/Ezq/LMuwvqUtextFa0eMi474DDyiOcWxyMrK2YpVIKzpKgVp9g9rCMkpEG2p3dPFOv
         CtpbtWXTqe+L2JZCNMRiShRkd7yilQQMMEikltNuY9KMGFW7cGTvNcKdJoQJ057oKIUY
         IMCQ==
X-Forwarded-Encrypted: i=1; AJvYcCWNXnnQkbaAXqKH4Og5AxwlIji9C2wT4GxI06uYkcAl+pBbr2selxd6HnGmG7LQiteKzSsmVn6ssYGtnw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz02LiyeWygy0r8D/CN3RDJHoXqfj84yMXV2pIAOmduJaVi6zWz
	9UiNMYDKroCOY+TR5bEWyZ37J4UCC5FOUZubYedWUpEaiCPlszd5ekPETuY8MfCGWAk=
X-Gm-Gg: ASbGncungd4e7w/nCGrWZNKfKLAVMqpdCukHUcbCk1ay72f6FYHUl9zclIvgZU+yLCi
	cvQ85vScW/TddcYQw3VZQ50M7CIGBVxc8DcZBQHrK22ayB0y0DNJS38p1KC3WRqN3NJ+xfz9BjK
	MhK3Xxcv02HVprf+RIiYHHJJ0Grl7ic3Pktn34qfvZmp7F2l91vaX843Jb09wO9gPnW53tvDPKz
	sdq58pZ0jwCm3QspTFPf2sy0oELtzc94a+k/ESdGU52kDupnJuQSNI/M0+93lzEP1JWIg+mOx5I
	961pvj+1rrDI0o6YUmufIf7nE2q4f/HyC+cjmZGXTfekNnpDeS3YtIW+VL4Pi/+iN1GiW2/37Gw
	nKkQeSRAoLC70a27dZF53YLBAHjmMBSEv/TCjApf2RCOSTtYdHf+Bv/W5lU+CVXGUwpxJPa+lw0
	r1EABiyBVbNStBqiLD2pwDfQ+pp799oN+SNww3mtzqWv/tIUfAfGoUttXGcqPDXg==
X-Google-Smtp-Source: AGHT+IHyFdVGQ4BYUefw8ss+YKmRH03XXYCIYh5LZFLMqDlOfcbRTa9BSOdWEqNs3a7IKHiLKgF0iQ==
X-Received: by 2002:a17:907:7f0c:b0:b6d:595b:f54d with SMTP id a640c23a62f3a-b7051f28070mr798658466b.7.1761935158895;
        Fri, 31 Oct 2025 11:25:58 -0700 (PDT)
Received: from ?IPV6:2a00:1370:8180:d0cf:85f5:d5bc:7d26:fc39? ([2a00:1370:8180:d0cf:85f5:d5bc:7d26:fc39])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b7077cfa966sm239463966b.65.2025.10.31.11.25.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 31 Oct 2025 11:25:57 -0700 (PDT)
Message-ID: <2c3ee140-69f7-4927-aaaa-6002f47253ec@gmail.com>
Date: Fri, 31 Oct 2025 21:25:56 +0300
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: On https://syzkaller.appspot.com/bug?extid=a6969ef522a36d3344c9
 again
To: Dmitry Antipov <dmantipov@yandex.ru>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Hans Verkuil <hverkuil-cisco@xs4all.nl>,
 =?UTF-8?Q?Maximilian_B=C3=B6hm?= <maximilian.boehm@elbmurf.de>,
 linux-media@vger.kernel.org
References: <cea19615-2251-45a3-8458-726a92573418@yandex.ru>
 <05582ebc-fbe2-4b54-bdae-ab61fb0894ea@gmail.com>
 <746a20f0-cd31-4ed0-b2e9-f6a445493796@yandex.ru>
Content-Language: en-US
From: Pavel Skripkin <paskripkin@gmail.com>
In-Reply-To: <746a20f0-cd31-4ed0-b2e9-f6a445493796@yandex.ru>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Dmitry,

Dmitry Antipov <dmantipov@yandex.ru> says:
> On 10/31/25 5:25 PM, Pavel Skripkin wrote:
> 
>> I barely remember details about this bug. IIRC fix caused failure of some real HW and I had to revert it.
> 
> This confuses syzbot which seems knows nothing about revert and thinks that the bug
> is fixed. This means that it doesn't even try to reproduce it. But, as of upstream
> d127176862a93c4b3216bda533d2bee170af5e71, it can be reproduced manually:
> 

If it reproduces, then bug is indeed active not fixed. You can try to 
re-apply my original patch and see if it breaks something.

On the other hand, the thing that I broke is quite old, IIRC, so you 
likely won't be able to debug that failure.

So I don't really know what to suggest...



With regards,
Pavel Skripkin

