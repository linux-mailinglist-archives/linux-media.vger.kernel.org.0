Return-Path: <linux-media+bounces-21477-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 57B679CFCCF
	for <lists+linux-media@lfdr.de>; Sat, 16 Nov 2024 07:06:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C99AE1F22057
	for <lists+linux-media@lfdr.de>; Sat, 16 Nov 2024 06:05:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C1E6C191F7C;
	Sat, 16 Nov 2024 06:05:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="G7Tt8ZcX"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A00D63D;
	Sat, 16 Nov 2024 06:05:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731737139; cv=none; b=QIGRFWsCBmQVvorWRgzRtkXSJiqDaKRjqft/P0KzTZSP/4zA4VvG1SAq1oVaK2ITmbLKYY/kR1QqgFTktbMptV0TR6vca1zS7WdaHwGzr1XBuvRPfNnFkbLxEe9ghXRMVpTA/kuBSEw8IM0fKR73+VDKRM7s8dE6mEh9Yx0QSSA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731737139; c=relaxed/simple;
	bh=OPiCguamCmuvjl3wwXifk3eAX7ShV9t+omsttjMjnFI=;
	h=Message-ID:Date:MIME-Version:To:Cc:References:Subject:From:
	 In-Reply-To:Content-Type; b=P9yOwsqvMof9OfqLSqy6CUT3hYRFWM6QUSI5cPH++gZ6acR9EsWOst+AyF8RjysJffj6/CGdo6zuXHmj6g350e3zqYZtntq8h0kR9jvmnztUYckQJRbjF64dawGGUG4NEYcogmCyd4hZjdq8N3oGGfcbR6qSVfLEltkva7EY174=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=G7Tt8ZcX; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4315eeb2601so4289445e9.2;
        Fri, 15 Nov 2024 22:05:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1731737136; x=1732341936; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:subject:references:cc:to:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=LRHqgSTvcOb5UIy8xuwGEyvuSYCON0t5LsHCXAqMuvE=;
        b=G7Tt8ZcX8nG6x4YYYHCF+IeXzvRT+h0JURdkx4WOKElkKwIE9IyD+BZPChjvBy8KMO
         p8BW6rejldjigupbFRnvDJmEtPu2hzq1h32vcI3S5n7+GbzN7vDTcX+SsuUtM4m3AID1
         zepvpi2a8H/UaTZqAum/9J5N6t7gBoGVzkxGQoBdStqyT/0ceJeOHMyzNl4lIb6LtPuf
         o73Fu3mIbzsJf2lsbxTwwLjyOegkc1OYutRRTZv69PX96xnXzmYxMlSeOIfzOiJTi+Rh
         5mUd6HKxB8EHvrFkyohKmxYRkcMy0gJI3n76f2QJ31GMo0yli/omvAsQgaO201V4dnUd
         ffhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731737136; x=1732341936;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:subject:references:cc:to:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LRHqgSTvcOb5UIy8xuwGEyvuSYCON0t5LsHCXAqMuvE=;
        b=tFGG/6AAZj260d0JPew+ry13l5N8ToWbS0acyVPXgAWWd3SaYg3k95Cy840lQdvXB6
         A1l+Pg9sQGeGB069e0Gbwo8VuhdbVtIJ76Wjib20MshOgvWsPpDiIrSmbqvKt97kxBZ0
         +1f6L/yif15vVK4cUHLrOxL8ww7NjDl+2fRvxwiwJQPtOX0DaoBBCf2ADowoA0Dk3kl4
         wjsz7dfNYMPhFe1SH05bMjEYbWM4DLhfS3mvXCt381ZONv/Bk1q388qH0Q/PmnViQ3AB
         2TnUGLgWa4wRab3Az9Tvp6ofgDMatNFGf9P1z/FDK3ZwYZsROMkKjDPvrRhGZFIIpLOz
         J89w==
X-Forwarded-Encrypted: i=1; AJvYcCUutHmPU5Exl42mIFLCywhFzXcDouUVBHMewOSrK0Ez64gQH0ms3z61KUoqgAq/x+sQANSbAUfIjzcoRg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxOTovOeK4BVouqAel3E8BKbZCLOZUcgBSt3X099CCnkbiEyfSS
	EHqP0qyHHGAPnLqeOZJk23l17EHXpbbj0poitjykIMlxCQHyDcScKOmEgg==
X-Google-Smtp-Source: AGHT+IFrVhXxmMnW4R9wDoU0nryUL2gqeOV9Nt85kCkDtK9n63PysDR2ECaQ/OUCeoewMyomi8rzTg==
X-Received: by 2002:a05:600c:3583:b0:431:5f8c:ccb9 with SMTP id 5b1f17b1804b1-432df74fc2emr56984195e9.17.1731737135723;
        Fri, 15 Nov 2024 22:05:35 -0800 (PST)
Received: from ?IPV6:2a01:e34:ecab:8c20:136b:ac23:1f6:8240? ([2a01:e34:ecab:8c20:136b:ac23:1f6:8240])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-432dab788e1sm76273605e9.15.2024.11.15.22.05.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 15 Nov 2024 22:05:35 -0800 (PST)
Message-ID: <50811f23-4d59-4ea3-9259-042e7bf557fa@gmail.com>
Date: Sat, 16 Nov 2024 07:05:34 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: bingbu.cao@intel.com, sakari.ailus@linux.intel.com
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
References: <cb2c20c3-e9f9-4758-92bc-43591946ed9d@gmail.com>
Subject: Re: [BUG?] media: ipu6 / ov01a10 webcam not detected
Content-Language: en-US, fr
From: Nicolas Lorin <androw95220@gmail.com>
Autocrypt: addr=androw95220@gmail.com; keydata=
 xjMEY1VgjBYJKwYBBAHaRw8BAQdAz2n7kjNHne7ZkxorNsqC6fW9enBx9zGLd5L8iYFVaprN
 JU5pY29sYXMgTG9yaW4gPGFuZHJvdzk1MjIwQGdtYWlsLmNvbT7CtQQTFgoAXQIbAwUJCWYB
 gAULCQgHAgIiAgYVCgkICwIEFgIDAQIeBwIXgAIZARYhBFiBbK6iLbQ0x0TKoL3p1BRts4Ek
 BQJjoy18GBhoa3BzOi8va2V5cy5vcGVucGdwLm9yZwAKCRC96dQUbbOBJGeWAP479DfET1mN
 k5stAx1NoauJjUgqxFsCQnN0FRRKkERzgAD+M9EWStug/IJWh/i0oMufsUJUU1Liqm7zbSRZ
 /uLVbgPOOARjVWCMEgorBgEEAZdVAQUBAQdA7+DEoQ7KinwNOZmseIdLPEkAYpayeJM0f5Be
 Y5mPsgwDAQgHwn4EGBYKACYWIQRYgWyuoi20NMdEyqC96dQUbbOBJAUCY1VgjAIbDAUJCWYB
 gAAKCRC96dQUbbOBJBfXAQDNSRfNEZhM7p3hq5AikRiJ0tEWQ52iChfQ+IhbfK8PKAEAzhBt
 bREc3AKOcWQ7+PPLOL7ztWFKc3xykDOLoxHrcQ4=
In-Reply-To: <cb2c20c3-e9f9-4758-92bc-43591946ed9d@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Same thing on latest mainline:

   󱞪 uname -a
Linux androwbook 6.12.0-rc7-1-git #1 SMP PREEMPT_DYNAMIC Fri, 15 Nov 
2024 23:35:35 +0000 x86_64 GNU/Linux

dmesg also show this after stopping repeating the two lines:

[   17.272302] pci 0000:00:05.0: deferred probe pending: intel-ipu6: 
IPU6 bridge init failed

-- 
Nicolas Lorin


