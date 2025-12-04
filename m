Return-Path: <linux-media+bounces-48201-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C4E0CA207B
	for <lists+linux-media@lfdr.de>; Thu, 04 Dec 2025 01:20:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 601913013739
	for <lists+linux-media@lfdr.de>; Thu,  4 Dec 2025 00:20:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9BC8A18C02E;
	Thu,  4 Dec 2025 00:20:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="StwBcJGL"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C70E13DDAE
	for <linux-media@vger.kernel.org>; Thu,  4 Dec 2025 00:20:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764807603; cv=none; b=QD3x24+sK/bcmOTFzzAdAK/CFBwR+0pUx6IN7joCkd2JBslgR20kAfZ/PVIDGD7u3ZHrnWHowJETp11IggAuKCcsDTxw18tKxwDaqUTrtslTnW7Nv56lTfqXcdCAJjgdgIQoYJ9cV5FSKnoL7ekHhrV/jQq6dYH0WU7COPhewp8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764807603; c=relaxed/simple;
	bh=W8JDpJ0cszJ31H/pDOqCniqWJfMlgyzvY+vNNyzFof0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UOLA/aTK1bjtR8j+sivy2750PnmaLbQ+yP/m6KZ5jSiEqKq0ZYf/bjMr9aQK9iwLBcI7aXxsnM7Fj79R96otEN4q4uYbGoYxX7fOQq2vojIbktzV7VqtvNxSFeiX5C0ZgZjiW3QXhVikux+V4sDNWkzvngh2Gji473fQD5XeIy8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=StwBcJGL; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-477632d9326so2280005e9.1
        for <linux-media@vger.kernel.org>; Wed, 03 Dec 2025 16:19:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1764807598; x=1765412398; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Sy/9CGo8NUcxokw+wp92Xk3pkZwIb1w5SdSGUoemftk=;
        b=StwBcJGLcJfxTssaWb8uykX/xbNE8K89oLTIURWcXQswGIujc+q9L7GDbTeunhGmq/
         LBF/LmqaIkHhSQKSUPUVxe4cKnbs2EZvPYKikUjehxJoKYxZHim0cofRSvIc8NHMcu/s
         UhLlYJ6IN3zRbWIOw2vMiX21NULxRNnUiKkzTYFurXir/b9WoiXv1Q9Vyr2mpG8zaBeL
         FrwoCw72h2ucp/cBrLQJf7KBekH32J1IwAVFuYjc32hxOWQoSf2ojQ0L1YS0L6iUosPW
         5wXk0/BvsO1CjGWAI1StK6IuJWJOJk2jR0t/HMHUNJNDpxO13bodEXI5BR0Q1QayNblD
         +QWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764807598; x=1765412398;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Sy/9CGo8NUcxokw+wp92Xk3pkZwIb1w5SdSGUoemftk=;
        b=BvqCIXWdz/pphl6PIxmiBJPWR4crFBm5UX2yLMBB+cIqxEW7c+fuQbllRvv8mgS3oe
         v5djZe4wSwq4nzQvzlw7/RKaeYU8CregNJqFZXo+53IIbo7CLj31VXjAs1Hyoig9y3Jz
         86jzAR91rtLVENws2q4DbmTO5AnUh/r141RTB/100B3q+jFUc2O8ezrJNQJQyMP+W6Lg
         rYIGErVwejfL42hL0ZIEH+5Nv2LzycacpfzcNj2eeeMvRtmdhlEaO3yBvVjDYWzaNdxA
         XQChBXQMDrDT1SU7nMCGzbWTqkXy6bvCT4LrCbQe6sIh9hI4ozgmCdw8BzuVoLhtLmpt
         g96w==
X-Forwarded-Encrypted: i=1; AJvYcCXpykwDB/tiOZxsYarYQVxv51qFKRIb9/4iJy6FLoEr2QZUsf8l4wjp6Lloxb1suAENr4xUN8Z1ObHzoQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzu8JyK3DU1zII6XUJsjnA+2TpdXB7UIRc8jdW7PJH27OW9LhEw
	6BZs6pfhKjgaMdMCE+CY1QapVYzeOCRqaxxm3btjM6011vgc23JcWpfvK63yhLk1G1Q=
X-Gm-Gg: ASbGncuz/Jeo84mRklRM2vTntB3H8AZ7AJOP7BAaAg3KcGmkuXBM5otwPtGRgcCKXHP
	0agV6hB4ymlNakaTSY2oNuupLrdi8Mk8b38hvBtMSdj3iO0Uz/Qg+iQPVDcasYJqT9xf9UXXIun
	GWW0G8DlFxO+NIUN7weNtk48yG/fwFQnhrx9EnyTYL6SJgJdZkCIHJTv+x0ut1/O3DRd+R42ea8
	BLUGEObd2koluo/VY3QQgVoFHZ3auTq7MG9Xqh6SlY95Zj6hRH/e31O0TLJeWNfw3Uyab2Z++XE
	QTcyCdzfG0h+e+H+WlI2RrN6+qF6vWPcvfw8HOLmq2l6vBb3u5xL8b5oBp0KzfjqG76a8C/WwPb
	TJvrZUmxfjO4Pb+Qou5CT6I6NBYLZecfsYNhyHRFY/mUUiyrJPRWfl44trHwj71J87m4DvEdYvR
	+jRwok60OpJ9Be7kfQtZnYQ1vmRdOXwkQzYpzpxisFfQsGKdLXM5v7
X-Google-Smtp-Source: AGHT+IGctIUBDJ4B++ZPZwfzieuoC6rE0jEla7NQRIEMiwCpYVYx+DGWozaw5tUyDHsHwHr4Gj1ARQ==
X-Received: by 2002:a05:600c:190d:b0:477:af07:dd1c with SMTP id 5b1f17b1804b1-4792af43c8amr45511535e9.35.1764807598460;
        Wed, 03 Dec 2025 16:19:58 -0800 (PST)
Received: from [192.168.0.27] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47930d70806sm2382045e9.13.2025.12.03.16.19.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 03 Dec 2025 16:19:57 -0800 (PST)
Message-ID: <65414d04-3db9-4dc2-bf1c-1e260713b818@linaro.org>
Date: Thu, 4 Dec 2025 00:19:55 +0000
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RESEND] media: camss: csiphy: Make CSIPHY status macro
 cross-platform
To: Andi Shyti <andi.shyti@kernel.org>,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Vijay Kumar Tumati <vijay.tumati@oss.qualcomm.com>,
 Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>,
 Loic Poulain <loic.poulain@oss.qualcomm.com>, Robert Foss
 <rfoss@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Todor Tomov <todor.too@gmail.com>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, linux-i2c@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
References: <20251130-make-csiphy-status-macro-cross-platform-v1-1-334664c6cf70@oss.qualcomm.com>
 <ae056a82-e5d4-4a73-b478-37533ce2e0ed@oss.qualcomm.com>
 <b9150026-cd87-4bed-8ba1-800e92203a30@oss.qualcomm.com>
 <577ece85-adf1-41c9-b7a4-ca65e27e6c75@oss.qualcomm.com>
 <n3w3lvw2tnqjcu74eesuo7sr7nbe5tqlufii5zsvvpwtapxd2p@6pbrr46cc26j>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <n3w3lvw2tnqjcu74eesuo7sr7nbe5tqlufii5zsvvpwtapxd2p@6pbrr46cc26j>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 03/12/2025 16:57, Andi Shyti wrote:
> Hi,
> 
> On Mon, Dec 01, 2025 at 06:18:51PM +0100, Konrad Dybcio wrote:
>> On 12/1/25 3:48 PM, Vijay Kumar Tumati wrote:
>>>
>>> On 12/1/2025 4:20 AM, Konrad Dybcio wrote:
>>>> On 12/1/25 7:25 AM, Hangxiang Ma wrote:
>>>>> The current value of '0xb0' that represents the offset to the status
>>>>> registers within the common registers of the CSIPHY has been changed on
>>>>> the newer SOCs and it requires generalizing the macro using a new
>>>>> variable 'common_status_offset'. This variable is initialized in the
>>>>> csiphy_init() function.
>>>> "offset" + "common_status_offset" is confusing
>>>>
>>>> Let's maybe add some platform data where we store the actual offset of
>>>> the registers in question and pass a csiphy ptr as an argument
>>>>
>>>> Konrad
>>> Hi Konrad, may be I didn't follow correctly. This is consistent with the way we maintain the other SOC specific reg offsets / data in the CSIPHY driver, in csiphy_device_regs, isn't it? I seem to think it's clearer this way for the reader to see all the offsets at one place. No? Thanks.
>>
>> I thought this driver was a little more complex.. anyway, big
>> changes that will make this prettier are coming so this works too in
>> the meantime
> 
> After this short discussion, in order to get it in, can someone
> from Qualcomm ack/r-b it?
> 
> Thanks,
> Andi

I'll pick it up per nomal.

---
bod

