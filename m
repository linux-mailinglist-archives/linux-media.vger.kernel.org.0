Return-Path: <linux-media+bounces-53132-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aFesAqSCmGlMJQMAu9opvQ
	(envelope-from <linux-media+bounces-53132-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 20 Feb 2026 16:49:56 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FAC91690AD
	for <lists+linux-media@lfdr.de>; Fri, 20 Feb 2026 16:49:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id B77C0301492B
	for <lists+linux-media@lfdr.de>; Fri, 20 Feb 2026 15:49:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3F87D337BAD;
	Fri, 20 Feb 2026 15:49:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="b6oUaepn"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-oo1-f54.google.com (mail-oo1-f54.google.com [209.85.161.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F90E34D90D
	for <linux-media@vger.kernel.org>; Fri, 20 Feb 2026 15:49:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771602590; cv=none; b=nZKlN6FByyboEy5AdQ6J4eyzHEmMYVIrSCN3JW4y3Mwef8xDP6TUCtp/PccYUSE5D/8dyIKyaC9d2tnIOx3XkTOOGsrDdoGb37OGq0klHoJ/G4dczh1z6zzRb+fR3i6RFNDHtz8P2cE17tre4cGl3GCnBurCulOEXXyv8DCmTYA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771602590; c=relaxed/simple;
	bh=9AhJdztj2ZCFHJRv+rhaT2m4fsSmMuT4KToLuZOuA6k=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UEyaHSM01kMu4ANgQ0SWlv/zuATSIrfemvovQ29OpY5Q9UzWL7g/7l84lC5TUh7mblF/Bg7vDgHrlC2/34gRyVfd8weBuU3IfE+yGmRNizwmNXm+lw/EEPYEIvUG6W5YTwIdrA08yypuLQlpLWOOOLh3M9uB1Q8ppIzVwtIfYPs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=b6oUaepn; arc=none smtp.client-ip=209.85.161.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Received: by mail-oo1-f54.google.com with SMTP id 006d021491bc7-677a11d11e0so817794eaf.2
        for <linux-media@vger.kernel.org>; Fri, 20 Feb 2026 07:49:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1771602588; x=1772207388; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xbv2HHzxugBTt4xnu5UsfHbvz3AzVtC3bkRSy7hD7Hw=;
        b=b6oUaepnEBjLVLBRRlavrJItMDb1RTehb8YuZXP88H0IKm4NDDbHKYoPTEPTTYOcWE
         q/k8aWgHh4fn7UIxRRdUtZ4f+nRI0xurIiQSOr75A/PeVrW/YnOooOvviQMtamtt9Wlk
         AZIEuqA/Y5jPXnzbccAuitanYij+CTmBXeugk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771602588; x=1772207388;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xbv2HHzxugBTt4xnu5UsfHbvz3AzVtC3bkRSy7hD7Hw=;
        b=LCxz6vEtmEuVM8qtbH1m/RnyCCEeh8QSAhkGRmkpoPp6S6t6YuwppKkqpdyFNoMxJv
         B9HCeNeDV0nNz0OzDAhKW5OZuaTkZbBm9QAzjdmVRTxUkjZ8c3PWe0cz6zK+fZFhTa8V
         FP9F7uqHVSxcjT0idrKjD/4Oi6WDbvbXvNuylUv+eYLvTmiETCYJCerhYOxR8VEmnQsA
         1MaAoNX31KfxJHMD1Kk548Tu4fZTdLSbD45gGCpYFhA7aiMzGrdHLZvmewRdn23qAdkP
         JU72oPCeL8L8WxutFC1hZq8fwq0lNa2S1YqqJ4Obf3wJsucIo5bX5I73xfa01USUVoLC
         5BFQ==
X-Forwarded-Encrypted: i=1; AJvYcCXJWuGoeMvkyOuAeBSPCehdd0rhnktnW3vN3uYWi/2WnJxicpAXO/0U+ZIqhiD8aTE+jmXjyfhrR+NqyQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyyB5o856eGOyqtsVisWkrUV7qPbNYDY1sT/FdeJwOSf7S9Y4ny
	reBHCejI2Rqm4NXS/8k6Usg0cqp0uWAC/2YifpUhThSxJbDP/ajxXlpsYcg+S1PqFhQ=
X-Gm-Gg: AZuq6aK02ih65DBZ0WcejSNVw3ppqwr3XyDPXWtVIaSdAXlOdvOnuTvgy3UHda24ykk
	X41PiubUtzUcZWiXI94/lK00wGL+diSL0vnJoUruESFYZyu/eyvVMOQVipA0FyK14yK3EhuvydZ
	4I4IBhhy7feOu3aEhsbYtGUWAr+AMhGm4cDpRl5Sh7d/jCukVdHux6XcBrXWSAEvAI25s/P3Ujb
	Q4fQHu8tmVWKLCxCL+73hgnQZP/LHUk67QsfJajI7YEwga22zOnUb40/6F7SM3QZSd96sJzcpQg
	cJEAyom40qjxZcUszQh8fXR5LKt+K5BZzNZ0kihnM1YJuu2TnqhYhMKWiIOuWbPLYx0/DC5oHDI
	h8kE3nW/mcR3EdT5ScBG6HkNozJikWc+RCxpUn1I+LK5bDOeczV29dP1c2Hpdv1brFlkNVm2ScW
	9guGcwktq1jWxwlEY4f/deqIgzuHkfF8WJ3izAobz5LoBwwQ==
X-Received: by 2002:a05:6820:1610:b0:663:46f:6042 with SMTP id 006d021491bc7-679c4694512mr132565eaf.28.1771602588224;
        Fri, 20 Feb 2026 07:49:48 -0800 (PST)
Received: from [192.168.1.14] ([38.175.187.108])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-67985df6ffcsm12189697eaf.4.2026.02.20.07.49.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 Feb 2026 07:49:47 -0800 (PST)
Message-ID: <4cb7125d-8023-4719-96e0-8322e4c6a241@linuxfoundation.org>
Date: Fri, 20 Feb 2026 08:49:47 -0700
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] Modified uvc_driver
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Jayesh Puri <jayeshkpuri@gmail.com>, mchehab@kernel.org,
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260219131816.1930881-1-jayeshkpuri@gmail.com>
 <20260219133206.GM520738@killaraus.ideasonboard.com>
 <def15d99-a2a6-4aaf-9ab5-bac1167c3476@linuxfoundation.org>
 <20260220102749.GC1619026@killaraus.ideasonboard.com>
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <20260220102749.GC1619026@killaraus.ideasonboard.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linuxfoundation.org,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[linuxfoundation.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-53132-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[linuxfoundation.org:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[skhan@linuxfoundation.org,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,linuxfoundation.org:mid,linuxfoundation.org:dkim]
X-Rspamd-Queue-Id: 0FAC91690AD
X-Rspamd-Action: no action

On 2/20/26 03:27, Laurent Pinchart wrote:
> On Thu, Feb 19, 2026 at 01:24:23PM -0700, Shuah Khan wrote:
>> On 2/19/26 06:32, Laurent Pinchart wrote:
>>> On Thu, Feb 19, 2026 at 06:48:11PM +0530, Jayesh Puri wrote:
>>>> ---
>>>>    Kconfig                            | 0
>>>>    drivers/media/usb/uvc/uvc_driver.c | 2 ++
>>>>    2 files changed, 2 insertions(+)
>>>>    mode change 100644 => 100755 Kconfig
>>>>
>>>> diff --git a/Kconfig b/Kconfig
>>>> old mode 100644
>>>> new mode 100755
>>>> diff --git a/drivers/media/usb/uvc/uvc_driver.c b/drivers/media/usb/uvc/uvc_driver.c
>>>> index aa3e8d295e0f..cec117328ab2 100644
>>>> --- a/drivers/media/usb/uvc/uvc_driver.c
>>>> +++ b/drivers/media/usb/uvc/uvc_driver.c
>>>> @@ -2191,6 +2191,8 @@ static int uvc_probe(struct usb_interface *intf,
>>>>    		(const struct uvc_device_info *)id->driver_info;
>>>>    	int function;
>>>>    	int ret;
>>>> +	
>>>> +	pr_info("I changed uvcvideo driver in the Linux Kernel\n");
>>>
>>> Congratulations, but I'm afraid we're out of medals.
>>>
>>> Shuah, I thought LFD103 has been updated to avoid spamming the lists
>>> with such patches. What happened ?
>>
>> It is changed a while back - not sure what's going on.
> 
> Could you please investigate ?
> 

I will look into it

thanks,
-- Shuah

