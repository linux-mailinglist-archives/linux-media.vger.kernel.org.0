Return-Path: <linux-media+bounces-53113-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qOxKFvpwl2nUygIAu9opvQ
	(envelope-from <linux-media+bounces-53113-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 19 Feb 2026 21:22:18 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E4A06162481
	for <lists+linux-media@lfdr.de>; Thu, 19 Feb 2026 21:22:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id BF2673012B7E
	for <lists+linux-media@lfdr.de>; Thu, 19 Feb 2026 20:22:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 97423318BB3;
	Thu, 19 Feb 2026 20:22:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="Tie5TD5U"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-oa1-f47.google.com (mail-oa1-f47.google.com [209.85.160.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C60932E9730
	for <linux-media@vger.kernel.org>; Thu, 19 Feb 2026 20:22:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771532530; cv=none; b=VhkY/booDDyC9eK8KsmKF/X532X023rZVpzaF4S7qjJJypmz2Y8KsurLNoqWssugTa+5fbOF4jEfKvJy9ZTyhGs4L+6mkOzt0gafH8P+X1djOq3fmU32uUbfWdO1ZilOXAv+Nk7/dVgx0xLn065RODxNH8fu+mdy22tvGFiId34=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771532530; c=relaxed/simple;
	bh=ye5H8PFEx1/j0ChicMhvOBpCs848NTCLpUzcYe6Jecg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=iYjO1S/bGaEU1LzCuteuE6eCb7IPIguu3z1OLR2uiYLqYd4MSJDkO8antudu0zzie6tCLRq6HshRatko+uuwmAOtXQiKHeApwQw3htdK2a+EAtH4f40k7CLgMHlpAXMrxxrJNGvi1ge5PBxKYwpdWe4Fp8Dd481Kq1pMrwfmDJU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=Tie5TD5U; arc=none smtp.client-ip=209.85.160.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Received: by mail-oa1-f47.google.com with SMTP id 586e51a60fabf-40946982a78so487497fac.2
        for <linux-media@vger.kernel.org>; Thu, 19 Feb 2026 12:22:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1771532526; x=1772137326; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=U95IeWp67HVYjUv4N1CQ8RJNVeGwH40eBvvJSzZXWJk=;
        b=Tie5TD5Ua6nP+AykEEzO6cDT3UQToSvi09MjN1U1eQCA/bcU3BraqdxVXF2Qth/zlq
         iYyyf1p2jbOOcFsIhYdQdNF8MYWPvs8K+RsmcGVDZBzZFrucj5nA2i3VE/qNOH0RTUq0
         nJ7S3CCeFNrlkhnV7AIumZqQd/mZRhBaMotBE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771532526; x=1772137326;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=U95IeWp67HVYjUv4N1CQ8RJNVeGwH40eBvvJSzZXWJk=;
        b=RtBntdnW/T0/wp6V76m8PRJX/ldiEvqKw3TOcX/9XT0Rv4jIEvhKYrJfGvZ0rDOBod
         JRkIU5Kix+hvo5w0kq6YtNll9NY62z4vTLRG/kHCvZEy02md4cklQ0r3+kBqiRtc8jBK
         Wu5wF/81xw7/vfsUyUFTeN9QwIcTYXkmg7z/bm8cTJxmnbKT3VCVJQ+JmNZT4ohT1HJU
         xKOf60yWMiBrLNxkz35KENRGnkDfzmmz2xE5VRNmy0nagWcxu0ECUM74R2fzluem8PJW
         aKNzKx9Y6Xd6yJOY1JYdxY0AH6bgmki4YaNJPKiWExJmOqhB0xfJK4orlV1dobMmLoT1
         MdJg==
X-Forwarded-Encrypted: i=1; AJvYcCWtn6KRDn4eCUFI2NBM8usv5HR+hfZ3FKG3Cvrhc4BG0qIPZg8sB1Nmut1+hl+jQLtzv8CsAVioH0mQ4g==@vger.kernel.org
X-Gm-Message-State: AOJu0YyfYp3lzA0KmhiO/DYsgPNr5TAXKt2lCfaHbL91XnAdB2V8gSy0
	dIeiqOZAJuFF/639y3zN9UrOYiEed1HUIQWqfgn9LUg6kiIz8ic+uzTaY9q7Yf2u1p4=
X-Gm-Gg: AZuq6aLbro3P/OQQ0/fGQPmWLwfbcd1jAF3rdrhPe2fcy4hjgx5iRRxOntlSIucJqlp
	EV2o2d2zzLwwmo74JC/RZ1fyPl5sbvj0DN1R6xPCXIQsOWunVvTk0V6QkZjhU4Zp9PtKgAxj13e
	E3IkXRT24Yd9eSabZZejwd+4V2O22cT/RgtfcQkD/Iqwt+biwVhFHIOJwSiutOU9idov6RTa+Sb
	0ACKjFv8PrdISd2wVTKOeIloa/dl8rHtIx/3Jms6LAh4YOV17/Jbsxo7cT7VM2gWcRm/79kj4n8
	mvH1ZRMjtUR9MSa3ZhJovdq9MixgvVS/BKfHg7OnIKCNsXq5xFnoS2lpDEnGHctJluJcuD/nO2T
	Nqea2hSGGiJ292U769QWrDdrW2WIrGT/sioqMg+AgXmXL4z4YzHfYNwIwkNePVjCUv87MbxNZ4D
	By3YV4Lj+tmwDBTfV8mBX2dmxhQ9WnDf9Pqp0=
X-Received: by 2002:a05:6871:72a:b0:40e:df4d:9111 with SMTP id 586e51a60fabf-40ef3c5edaemr12082562fac.26.1771532526503;
        Thu, 19 Feb 2026 12:22:06 -0800 (PST)
Received: from [192.168.1.14] ([38.175.187.108])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-40ee06756easm21938304fac.13.2026.02.19.12.22.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Feb 2026 12:22:05 -0800 (PST)
Message-ID: <b2c47bc5-3ac5-454c-b979-2f9d33cf29cd@linuxfoundation.org>
Date: Thu, 19 Feb 2026 13:22:04 -0700
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/5] media: vimc: add RGB/YUV input entity and improve
 pipeline support
To: opensource india <opensource206@gmail.com>
Cc: kieran.bingham@ideasonboard.com, mchehab@kernel.org,
 Hans Verkuil <hverkuil@xs4all.nl>, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, Shuah Khan <skhan@linuxfoundation.org>
References: <20251120084926.18620-1-opensource206@gmail.com>
 <832f4621-53af-465a-a5e9-f7d65a082481@linuxfoundation.org>
 <CAKPKb8-qyqMmp6c9OnO+AapRRJyE8ygtQUyuUqK8+C0LvMTYTg@mail.gmail.com>
 <CAKPKb8-8ctSewOwBk7fFUMVnb-F_gXnyXS8gd9xJ-fpnW1_ZYA@mail.gmail.com>
 <b5240bd1-eee7-47fd-be70-88435519b12a@linuxfoundation.org>
 <CAKPKb8-VW3C8c-BmwLEWdLXZ8LVuH_MDMdVzzFs6O8QWmpDeuA@mail.gmail.com>
 <CAKPKb8_PGYUStAovWjWG8XxabjB5WuT7kQ3qxT3NuYSKihgDDA@mail.gmail.com>
 <754a344f-4759-4b94-aae5-41e1ce6b7e2f@linuxfoundation.org>
 <CAKPKb8-hd72r2-11xo6EaN33FfAZ7KFLt59kiwE8UCQKgW+z4Q@mail.gmail.com>
 <CAKPKb8-HZdpGzbnStwr6TvpPdFT=1J8mc=Bx1mtAcHBXiHhxtQ@mail.gmail.com>
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <CAKPKb8-HZdpGzbnStwr6TvpPdFT=1J8mc=Bx1mtAcHBXiHhxtQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linuxfoundation.org,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[linuxfoundation.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[ideasonboard.com,kernel.org,xs4all.nl,vger.kernel.org,linuxfoundation.org];
	TAGGED_FROM(0.00)[bounces-53113-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	DKIM_TRACE(0.00)[linuxfoundation.org:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[skhan@linuxfoundation.org,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	NEURAL_HAM(-0.00)[-0.999];
	RCPT_COUNT_SEVEN(0.00)[7];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linuxfoundation.org:mid,linuxfoundation.org:dkim,linuxfoundation.org:email]
X-Rspamd-Queue-Id: E4A06162481
X-Rspamd-Action: no action

On 2/17/26 21:16, opensource india wrote:
> On Thu, Jan 1, 2026 at 6:41 AM opensource india <opensource206@gmail.com> wrote:
>>
>> Hi Shuah
>>
>> On Thu, Jan 1, 2026 at 2:13 AM Shuah Khan <skhan@linuxfoundation.org> wrote:
>>>
>>> On 12/29/25 09:04, opensource india wrote:
>>>> Hi Shuah,
>>>>
>>>> On Tue, Dec 16, 2025 at 8:27 AM opensource india
>>>> <opensource206@gmail.com> wrote:
>>>>>
>>>>> On Tue, Dec 16, 2025 at 12:40 AM Shuah Khan <skhan@linuxfoundation.org> wrote:
>>>>>
>>>>>>>>
>>>>>>>> Hi Kieran and Hans,
>>>>>>>> can you please review?
>>>>>>>
>>>>>>> Hi team, can someone please review?
>>>>>>
>>>>>> I will send these up in my pull request to Mauro - it might be
>>>>>> later in December of early January.
>>>>>>
>>>>>> thanks,
>>>>>> -- Shuah
>>>>>>
>>>>>
>>>>> Thank you so much Shuah
>>>>
>>>> able to pick my changes?
>>>
>>> I applied them to vimc branch a while back.
>>>
>>> https://web.git.kernel.org/pub/scm/linux/kernel/git/shuah/linux.git/log/?h=vimc
>>>
>>> thanks,
>>> -- Shuah
>>>
>>
>> Thank you so much
> 
> Hi Shuah, is this patch series going to be part of the mainline kernel?

You have to resolve the problems Hans found - take a look at the response to
my pull request.

thanks,
-- Shuah

