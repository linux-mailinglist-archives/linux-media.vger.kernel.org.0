Return-Path: <linux-media+bounces-53114-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4JGAHI1xl2nUygIAu9opvQ
	(envelope-from <linux-media+bounces-53114-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 19 Feb 2026 21:24:45 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id E7CB21624C9
	for <lists+linux-media@lfdr.de>; Thu, 19 Feb 2026 21:24:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0DF0E3030E9A
	for <lists+linux-media@lfdr.de>; Thu, 19 Feb 2026 20:24:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 52DEA318EC5;
	Thu, 19 Feb 2026 20:24:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="GMgWJjDW"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ot1-f49.google.com (mail-ot1-f49.google.com [209.85.210.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBF832F28FC
	for <linux-media@vger.kernel.org>; Thu, 19 Feb 2026 20:24:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771532667; cv=none; b=ek3yhevjiGPbnCriFWEfS+iOdo6u1AI7mheJuTEV5eigKvoiyMyi4gaCMKTkkcKPknPp7VonTwP6CoPW4TDfaUFa6Ps4/grZkkdBF+hyLWa1kwkkdxn+Ws0IHDvINXrvFTMB+IRlJWgTsF6Ubiqx7pqc6yyO1u8BlwTfMgZJbEg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771532667; c=relaxed/simple;
	bh=HioDXdu76SvTnOmwNYUg4TXIMzj8J7WHC1hkZjIHOz0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XjPuZUv9afC2eJh+rRFSgoHGI1m88cuPaG37Nab7nS1l9Q8ETwD1i9UVPD9YHCJnsnTnokNsW43QsFRX7HY1wdoJKh1JuTq9DO2ppAvxS5nHiQqLnE+Icbcu75VKo8RvJJwgcmh1oeGnaTkT+U4cX9g1Y0tW8D+f1HzmKJlXmT4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=GMgWJjDW; arc=none smtp.client-ip=209.85.210.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Received: by mail-ot1-f49.google.com with SMTP id 46e09a7af769-7d4be94eeacso1192884a34.2
        for <linux-media@vger.kernel.org>; Thu, 19 Feb 2026 12:24:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1771532665; x=1772137465; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=F/tAZ+pLHeMGc0ykZZEFiO6GCv6YT/iiuPZ47+YMDmI=;
        b=GMgWJjDWIABZOKqKlBfbL5j6uoE+on4Qw/L3+5lw62uPWea6vPG3O/cA9aB7bUzGgi
         0uBHsxjYpbik+kdhNWBmGa6IosIBU2PV8CzFhY5iFmtcgM9xTSENl+pgtxeOV9rgALre
         oYCXgnRIFwBbAHFQif6PxDJMHA0+qoTXBbT8Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771532665; x=1772137465;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=F/tAZ+pLHeMGc0ykZZEFiO6GCv6YT/iiuPZ47+YMDmI=;
        b=hvQwA+tfDXJUd/MGEAT7GmRtYCgt2DmZwEfPh8vqb3T3vqtAadLLY74Q1wdQ5eb/20
         0VhYPcEIZHtyRMHmK7H4wtEtvZFb2Hj9raCMER5o9FBwdXu2w1/0DCZHvCBTGanUEfjk
         EfgZFPdO73o+DUALG/WNLKG23Nj2v/R7DrnLcerGAvhurL4T/fo5fUk3BWN7UMitAZd6
         TicxcBpNVscCdwvABU7pnRR3gRKBBDKtRPfSuxrqKYDxMHljlZIaW2+ts4Z4WyGQmPKM
         fte125CLKY2w328T5+tTNUbI9tGEY2xTnp44hIIBhRqOpwpC5CeqOhTjWogNWY0TtlNf
         QJFg==
X-Forwarded-Encrypted: i=1; AJvYcCWTuF03dcUIwFnflwhgbXQ31YlMX6BsynLObTa8AlGFGtHTjqE5uxF/zTPA8MA7v9qGqajIPo+1eJ/hXA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwHnH5F3keBjI2Hkx9JzF0BUmiK+dWMRp+9etNb1oHWGQ8TMwYT
	9Rz8zvwLH91ReId8v2dUcoT6e/3BUZMAw6jT9diez/9jpM1SRBtUdCBYuP/cl+uNaGw=
X-Gm-Gg: AZuq6aKI3hFPyhi9QeQ9IWfqfUsw+GUUGutxQIudr+qmILhtjTPzKENpSS7lXiQqH9o
	+/kT0zsr5eBl3ptBqbJosOmov6dR0YiM75H0lhVs86nDkIMmOfHeY/6uV9kdaOlOfl0iyHEBejC
	muayG6nCSoBlze2V9pFKFij05GP2hk/x321TjrCmzDzsh9On1kgSUdHi5OYN4naFHKu79MbWzAs
	Kcv2TZEaNrn6976ct3HRQWSViwDFwy123yZ09zcE9yPwAi1sAlWpauBCA7zXIT/bfYBqKHm9n1/
	okMG2s6J2NrLjUiXYL4NfB3M1N3n2KZIUrEaZJGR8Kx4Tl71I8plEC/EKV+OY7knsefHfLN+uLD
	NEr3uQe7SPvygWDS8fJHDZkmi6xNAPu/qaza3ZM+ROL+X43/u/6UQ0FBhJXTcXwysrjnpoQHmYx
	THJNYqHqcETXFfgumYx8rrJ2wZkXombsLQ0xuyq7Q3kfU35A==
X-Received: by 2002:a05:6830:6601:b0:7c7:b4e:edb4 with SMTP id 46e09a7af769-7d505da9c3amr5734067a34.8.1771532664789;
        Thu, 19 Feb 2026 12:24:24 -0800 (PST)
Received: from [192.168.1.14] ([38.175.187.108])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7d4a7547ac1sm20722731a34.7.2026.02.19.12.24.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Feb 2026 12:24:24 -0800 (PST)
Message-ID: <def15d99-a2a6-4aaf-9ab5-bac1167c3476@linuxfoundation.org>
Date: Thu, 19 Feb 2026 13:24:23 -0700
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] Modified uvc_driver
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Jayesh Puri <jayeshkpuri@gmail.com>
Cc: mchehab@kernel.org, linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org, Shuah Khan <skhan@linuxfoundation.org>
References: <20260219131816.1930881-1-jayeshkpuri@gmail.com>
 <20260219133206.GM520738@killaraus.ideasonboard.com>
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <20260219133206.GM520738@killaraus.ideasonboard.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linuxfoundation.org,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10];
	R_DKIM_ALLOW(-0.20)[linuxfoundation.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-53114-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[ideasonboard.com,gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[linuxfoundation.org:+];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[skhan@linuxfoundation.org,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-media];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linuxfoundation.org:mid,linuxfoundation.org:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: E7CB21624C9
X-Rspamd-Action: no action

On 2/19/26 06:32, Laurent Pinchart wrote:
> On Thu, Feb 19, 2026 at 06:48:11PM +0530, Jayesh Puri wrote:
>> ---
>>   Kconfig                            | 0
>>   drivers/media/usb/uvc/uvc_driver.c | 2 ++
>>   2 files changed, 2 insertions(+)
>>   mode change 100644 => 100755 Kconfig
>>
>> diff --git a/Kconfig b/Kconfig
>> old mode 100644
>> new mode 100755
>> diff --git a/drivers/media/usb/uvc/uvc_driver.c b/drivers/media/usb/uvc/uvc_driver.c
>> index aa3e8d295e0f..cec117328ab2 100644
>> --- a/drivers/media/usb/uvc/uvc_driver.c
>> +++ b/drivers/media/usb/uvc/uvc_driver.c
>> @@ -2191,6 +2191,8 @@ static int uvc_probe(struct usb_interface *intf,
>>   		(const struct uvc_device_info *)id->driver_info;
>>   	int function;
>>   	int ret;
>> +	
>> +	pr_info("I changed uvcvideo driver in the Linux Kernel\n");
> 
> Congratulations, but I'm afraid we're out of medals.
> 
> Shuah, I thought LFD103 has been updated to avoid spamming the lists
> with such patches. What happened ?

It is changed a while back - not sure what's going on.

thanks,
-- Shuah

