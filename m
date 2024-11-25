Return-Path: <linux-media+bounces-22055-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CC9E59D8E55
	for <lists+linux-media@lfdr.de>; Mon, 25 Nov 2024 23:08:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 627F2162C5A
	for <lists+linux-media@lfdr.de>; Mon, 25 Nov 2024 22:08:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AB4721CB53D;
	Mon, 25 Nov 2024 22:08:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="T/Li71Hr"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74059188724;
	Mon, 25 Nov 2024 22:08:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732572514; cv=none; b=b6YLhLgDXTpiqLyooMHlWAT+kHBQFuTmzSfQM6m5Z+V7KbX8o1tr2PTen9Dj9dz7XnBabloeTu9cATgUTWg8aUwOZiewvzOK0eQo0/TEGvmpJGDKqatnAgRNhaj7cOoBykCbs8/Q7Q23OcqmzcpThuUtAqxKgJJbNxdv0He7LgI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732572514; c=relaxed/simple;
	bh=I4HyOboDP12ePyDeC4l0EQTmYf7GSoYtqq7nwcHd8ac=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rso4pSKTGY0CW7/x0kgCsAJbYCwTEK6x8YjcWxbGSLWp+a16GpumItDo41tN1eqgvOPDOo8AXBXxanYMEJLnL+eQ001qA7e6a0AYYZMhSXgqTnzUhkldgg3YanZz8dNeDYYZv/mR3zqKPbUAHuFLwXgU1ZVNpDD0+ZIhTMzYFdk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=T/Li71Hr; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-3823eaad37aso3724357f8f.0;
        Mon, 25 Nov 2024 14:08:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732572511; x=1733177311; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=5p1qnifDyO3syun60fDSCevkveV/3toJASW8RyuXXOQ=;
        b=T/Li71Hr5GCm1bbcjJ50qWmZYOq9LBX7ejVvdmcsUjjc1ZI5KLhDROjbsIrV5dE3W8
         NMGYLKURpkYJFJ45wWYjhM/UQAfeYPOGk+Uth8w+9yIvmaLTbbPDsI+s1H2aGlxRB9ju
         lQYjeb2E99LM36sL027FTOMhO3vUxQtqxjPWnx5C5e865Plv2aYmfkwUX8VEVoM/EW/f
         jse5NoMWw4KqQYM6gWfgiKE7aIZGOqAUDF4mwnOlGGvwo74f9HesJ57541q9Gqq3icyj
         4VjWg/Wfcz14aKlHTdNsg2Y6hL/S8cuCJ0d3CtAS1lCkgxvIW+P//YMRf6W/M5NbYBEA
         7+8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732572511; x=1733177311;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5p1qnifDyO3syun60fDSCevkveV/3toJASW8RyuXXOQ=;
        b=lVeIevZagsaECDb9n9I0EtWzUtoocsNEym7+vMy9QBlcdZZgjTSVUa4Ed+aJWx7zbG
         dd/bN1tAMVrtjCp+rbYwzbQ//c0jluVWP7NSxLnOIcjc97q7Iu9EYLhmMoWuSTwFaUXz
         rpFUxKFF7dQl0281MMCYxMoMf+Sol834dRZGtcVh41DCFfj8AOww9wTu20/qZfaqNdEl
         HbGUyBQAezaf+81CLnPoIu4oUE/5M3kUdAqItvBdPTGJCsszwCMIUKXDYxW/pFj8MyKq
         7N67OA9NAoqpLG4HU3F9pCfQ+TVTik/zNSD5jTi68IouTrjiUI2o//8gtAAZexCLrmE5
         QZzw==
X-Forwarded-Encrypted: i=1; AJvYcCVfFayvWD/m/BFf6MBBGVjPk0K+whv7w7inomFB9FyKLE5mvhWhCuA6ZwTFchzyyO80zaY9PFPV8iNDWw==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywyiaj4g2iXQEb3Zax/p+kkDGau/LVZoqdMJNa9XSqSbQ0KXIBU
	zNOehEw84TtihTOVwVT3aD3CLx4iXKwZ2rG36PY3hwtTgA1MLP5E
X-Gm-Gg: ASbGnctw8UNzO/z0BkHGHVzwOQnc8QzP6TQ6O5p5NyF1lL+14spL+FnqaqHYHG8OuT/
	9n+fr7PbVl2qewjbO5gP9iBBCeaU8SFtmELaYt2JCVG6XnGx26/3dDuikFTswbvOheRu4ZCIIZx
	S613bCFbeoua+iqFRm1OEoxMq523Pd5eyOXq0mzeLRqfzuPC0rQtASkw0zmP2EbfRvGOkmqa6k1
	L6b/GEIRX9i0XkXp90gkf+uGekLQGrxkWjy64pfHvVq8/VSxDuCgRd3c2KIT+0Q3PVg5O9Zgd4r
	H4Ya3C8cNyfX5UEdK+f/
X-Google-Smtp-Source: AGHT+IGnQjTvmDMaQ3a1S/VFy020fQCmStmaocgu+w5qhbJEjuZOEmo/xkIima9mzHiKFIO/vrAtJg==
X-Received: by 2002:a5d:6484:0:b0:382:5a29:199 with SMTP id ffacd0b85a97d-385bfae8583mr790184f8f.11.1732572510547;
        Mon, 25 Nov 2024 14:08:30 -0800 (PST)
Received: from ?IPV6:2a01:e34:ecab:8c20:136b:ac23:1f6:8240? ([2a01:e34:ecab:8c20:136b:ac23:1f6:8240])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3825fad6723sm11630220f8f.16.2024.11.25.14.08.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 25 Nov 2024 14:08:29 -0800 (PST)
Message-ID: <fd7754e4-2d93-4d77-81d1-13326165cf6a@gmail.com>
Date: Mon, 25 Nov 2024 23:08:28 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [BUG?] media: ipu6 / ov01a10 webcam not detected
To: "Cao, Bingbu" <bingbu.cao@intel.com>,
 "sakari.ailus@linux.intel.com" <sakari.ailus@linux.intel.com>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>
References: <cb2c20c3-e9f9-4758-92bc-43591946ed9d@gmail.com>
 <50811f23-4d59-4ea3-9259-042e7bf557fa@gmail.com>
 <DM8PR11MB5653FF8ED0A4E9BA67B42CF799272@DM8PR11MB5653.namprd11.prod.outlook.com>
 <82148acf-3998-47b7-8fad-ba0118662cf9@gmail.com>
 <DM8PR11MB565358EF5A7F96CD1A364C5F99202@DM8PR11MB5653.namprd11.prod.outlook.com>
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
In-Reply-To: <DM8PR11MB565358EF5A7F96CD1A364C5F99202@DM8PR11MB5653.namprd11.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Thanks!
Got no help from Dell.

Somebody seems to have some clue here 
https://bugzilla.redhat.com/show_bug.cgi?id=2316918#c22

The non-secure mode doesn't seem to be an issue.

Nicolas Lorin

Le 19/11/2024 à 05:26, Cao, Bingbu a écrit :
> Nicolas,
>
> The IPU should be enforced to run in secure mode(not the `secure boot`)
> in product, no BIOS option for it. I suggest you get support from vendor
> to check.
>
> ------------------------------------------------------------------------
> BRs,
> Bingbu Cao
>
>> -----Original Message-----
>> From: Nicolas Lorin <androw95220@gmail.com>
>> Sent: Tuesday, November 19, 2024 3:09 AM
>> To: Cao, Bingbu <bingbu.cao@intel.com>; sakari.ailus@linux.intel.com
>> Cc: linux-kernel@vger.kernel.org; linux-media@vger.kernel.org
>> Subject: Re: [BUG?] media: ipu6 / ov01a10 webcam not detected
>>
>> Bingdu,
>>
>> How can I enforce secure mode? I didn't find any way to change that.
>>
>> The computer is running Dell BIOS firmware 1.24.0. What do you mean
>> with correct?
>>
>> Regards,
>>
>> Nicolas Lorin
>>
>> Le 18/11/2024 à 05:46, Cao, Bingbu a écrit :
>>> Nicolas,
>>>
>>> Why was your IPU device  running on non-secure mode?
>>> `intel-ipu6 0000:00:05.0: IPU6 in non-secure mode touch 0x0 mask
>> 0xff`
>>> Could you please confirm that you are running with a correct
>> IFWI(BIOS)?
>>>
>>> -------------------------------------------------------------------
>> ---
>>> --
>>> BRs,
>>> Bingbu Cao
>>>
>>>> -----Original Message-----
>>>> From: Nicolas Lorin<androw95220@gmail.com>
>>>> Sent: Saturday, November 16, 2024 2:06 PM
>>>> To: Cao, Bingbu<bingbu.cao@intel.com>;sakari.ailus@linux.intel.com
>>>> Cc:linux-kernel@vger.kernel.org;linux-media@vger.kernel.org
>>>> Subject: Re: [BUG?] media: ipu6 / ov01a10 webcam not detected
>>>>
>>>> Same thing on latest mainline:
>>>>
>>>>     󱞪 uname -a
>>>> Linux androwbook 6.12.0-rc7-1-git #1 SMP PREEMPT_DYNAMIC Fri, 15
>> Nov
>>>> 2024 23:35:35 +0000 x86_64 GNU/Linux
>>>>
>>>> dmesg also show this after stopping repeating the two lines:
>>>>
>>>> [   17.272302] pci 0000:00:05.0: deferred probe pending: intel-
>> ipu6:
>>>> IPU6 bridge init failed
>>>>
>>>> --
>>>> Nicolas Lorin

