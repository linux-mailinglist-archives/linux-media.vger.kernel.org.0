Return-Path: <linux-media+bounces-21554-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E90089D18AA
	for <lists+linux-media@lfdr.de>; Mon, 18 Nov 2024 20:09:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A807C282CBD
	for <lists+linux-media@lfdr.de>; Mon, 18 Nov 2024 19:09:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AEBE71E130F;
	Mon, 18 Nov 2024 19:08:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="naprKXhB"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 709101A08BC;
	Mon, 18 Nov 2024 19:08:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731956929; cv=none; b=ETNK7rcunuXFl/qwlUS1wNsi8dWzsJmWRwc/VzrvQUsBDr61r5mNP/kuWR1SbPIDg+Q9TYsW3DP5uv4/zpUkEaI9seTpAdfZuTTWNVOSs4+CNZyMyDMRb9iofle7R3W+G7pbHWsoA6HjaboXctCGRrXyZD24dC1RR15qDexMF6Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731956929; c=relaxed/simple;
	bh=FRctSKTi4ljQmoGIf11xuFgeMolp1npsrZG651smQnc=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=lHm6ytJA21DmeqA18QaR90hV5/R0/hF3oAwPN2PBidQRwZhbZ6MldLmR/QcitqDnplexu3BpYy3kUlLEd2zf1a8QA+mzq1iV+KEtsOKTsP85fK1ri+4RZ14E/Ld4g+VIQM4i8wKlnSDL3PW1ePskQeUGVXhEtSp58LteYs3EH74=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=naprKXhB; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-3824709ee03so944965f8f.2;
        Mon, 18 Nov 2024 11:08:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1731956926; x=1732561726; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=U/TGKajPIRXs7eCh5oRymh/TdrEMqDOgCG5uyDJWT70=;
        b=naprKXhB+u8UJ7Vl/wGwlEF73FcEdRFJlJLRPpRArLvHsmj1sjMGbME26/f7B+PTja
         TkXreC+ArVXMeXTzVkXHtjPf4b5taRZMKQCO/Cva0sEEq5clozp1hyKVx65YnwQl7PHB
         zZvursv21mrTXQ2zPUHEJc8hijgHi7WOiWXs4IXKG1jXXE+FVVu6+XrGWY/TMQ/VCNqt
         +EIhDpp4GLPCwdoVvXQlLhJnoFPt/e4HSDCJSk+2e7gPa7/sbMbmCMwb4Swx2dkf2ZmA
         UxeWDMM+DvrIgRAmD+rM2k0l7XsC2xiPvpKwHkhVeBiAO1xAKZRFM1yqq8BSngOLb/mE
         +2ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731956926; x=1732561726;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=U/TGKajPIRXs7eCh5oRymh/TdrEMqDOgCG5uyDJWT70=;
        b=EMm9IA9niAHVuyDlTqcWz+jLlOHwO16B/25thR356HsGg1BiuMvmVHgm4WPkyPk6ee
         U/J9BAsQe0L6Ed8PjcinL7CObFVq+pZS3dueGOeXmwUy2Zpbd6wPzHlca5sCRHDsMcZF
         cusvrAJgoToDNvg9fQP67AY2h91fqbh0aZo16zNcj/9VzDZZoIlRZ03u4leq0i/LGqd5
         eAnPhztC6KuLANJ/V0rlUqjADG50k9v0oI/7QPOoghOXlSuN+mZ3GvVSythTpNT4YMVl
         3+ZPVnlsORX0jwCpJ47pJwkRNAo+dcUiKdYQXUoTj8stC3s1cqMZ9HnTLMtdvBtPj23g
         /xrQ==
X-Forwarded-Encrypted: i=1; AJvYcCX3OzzRjlIwL5r2L/8MLq2r0oVov3q3GOWqrhVuvu+W8YK2W/jyQX3mGwEe1YvF8Ely8syXbpnelydizg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy7qN0S5ntkh/Z45lGAtWoc9WnVAovGv38P8HEhkI4r/urj1Uvt
	XKgsdnKkbcbEOmT8MTMaRWUCxmJXRN5h6Ady5Mw6FxkVU1DH6Ltotuvnkw==
X-Google-Smtp-Source: AGHT+IHjHA8BxaGM1W7OtJm8OHCc0InkOfY6KcceBQ3ARwEUH3AfIbNaWsWdvm+p4Lih8ygNBuhYKA==
X-Received: by 2002:a5d:584f:0:b0:382:4a6c:fdd4 with SMTP id ffacd0b85a97d-3824a6cfde2mr2344890f8f.9.1731956925597;
        Mon, 18 Nov 2024 11:08:45 -0800 (PST)
Received: from ?IPV6:2a01:e34:ecab:8c20:70d8:4e22:e28c:4e7d? ([2a01:e34:ecab:8c20:70d8:4e22:e28c:4e7d])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3824a855aedsm2254290f8f.83.2024.11.18.11.08.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 18 Nov 2024 11:08:45 -0800 (PST)
Message-ID: <82148acf-3998-47b7-8fad-ba0118662cf9@gmail.com>
Date: Mon, 18 Nov 2024 20:08:44 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Nicolas Lorin <androw95220@gmail.com>
Subject: Re: [BUG?] media: ipu6 / ov01a10 webcam not detected
To: "Cao, Bingbu" <bingbu.cao@intel.com>,
 "sakari.ailus@linux.intel.com" <sakari.ailus@linux.intel.com>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>
References: <cb2c20c3-e9f9-4758-92bc-43591946ed9d@gmail.com>
 <50811f23-4d59-4ea3-9259-042e7bf557fa@gmail.com>
 <DM8PR11MB5653FF8ED0A4E9BA67B42CF799272@DM8PR11MB5653.namprd11.prod.outlook.com>
Content-Language: en-US, fr
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
In-Reply-To: <DM8PR11MB5653FF8ED0A4E9BA67B42CF799272@DM8PR11MB5653.namprd11.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Bingdu,

How can I enforce secure mode? I didn't find any way to change that.

The computer is running Dell BIOS firmware 1.24.0. What do you mean with 
correct?

Regards,

Nicolas Lorin

Le 18/11/2024 à 05:46, Cao, Bingbu a écrit :
> Nicolas,
>
> Why was your IPU device  running on non-secure mode?
> `intel-ipu6 0000:00:05.0: IPU6 in non-secure mode touch 0x0 mask 0xff`
>
> Could you please confirm that you are running with a correct IFWI(BIOS)?
>
>
> ------------------------------------------------------------------------
> BRs,
> Bingbu Cao
>
>> -----Original Message-----
>> From: Nicolas Lorin<androw95220@gmail.com>
>> Sent: Saturday, November 16, 2024 2:06 PM
>> To: Cao, Bingbu<bingbu.cao@intel.com>;sakari.ailus@linux.intel.com
>> Cc:linux-kernel@vger.kernel.org;linux-media@vger.kernel.org
>> Subject: Re: [BUG?] media: ipu6 / ov01a10 webcam not detected
>>
>> Same thing on latest mainline:
>>
>>    󱞪 uname -a
>> Linux androwbook 6.12.0-rc7-1-git #1 SMP PREEMPT_DYNAMIC Fri, 15 Nov
>> 2024 23:35:35 +0000 x86_64 GNU/Linux
>>
>> dmesg also show this after stopping repeating the two lines:
>>
>> [   17.272302] pci 0000:00:05.0: deferred probe pending: intel-ipu6:
>> IPU6 bridge init failed
>>
>> --
>> Nicolas Lorin

