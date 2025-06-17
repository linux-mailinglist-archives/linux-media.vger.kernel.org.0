Return-Path: <linux-media+bounces-35071-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B4C60ADC9F4
	for <lists+linux-media@lfdr.de>; Tue, 17 Jun 2025 13:53:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1294917113E
	for <lists+linux-media@lfdr.de>; Tue, 17 Jun 2025 11:53:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 38B092DF3E8;
	Tue, 17 Jun 2025 11:53:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=jjverkuil.nl header.i=@jjverkuil.nl header.b="Sg3VoXHU"
X-Original-To: linux-media@vger.kernel.org
Received: from dane.soverin.net (dane.soverin.net [185.233.34.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98CAB236A99;
	Tue, 17 Jun 2025 11:52:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.233.34.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750161179; cv=none; b=VAU9MY5y/MNoY4UvK/0F11wdp+UmNmxPkEobiGxK3PTQDsCNMZSInArdiyEUUAwerGfVy6aswuxfPbcvBJCFYpd3zXI+oF7pBAYQLm/L1tLhrcGUvqVJNn4OzK4XK3awyGkaiUIprF/sfJ86GQhdapb9ML9BPVwn4VVWK0PJfcM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750161179; c=relaxed/simple;
	bh=9ECkHn3haX5wHhY/cDc32cBJ1kHTwCloejyeu8wnOoc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mLmuZ/RiEQ2SNhJKSLR+QggjrOpLd2F7/nVhP3Lzr4bvVgpnVhPC+TVL12zZaKHOZ2cuqsxOACFq0mRItQi4c4Q0uJVeNu8AptHDHRXHAAb026J4TeDLemASu1Nal5GHoIWL2ws6tlRoVZJr5WdFkdPLh5Mi+INevsWBO+Jyu0k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=jjverkuil.nl; spf=pass smtp.mailfrom=jjverkuil.nl; dkim=pass (2048-bit key) header.d=jjverkuil.nl header.i=@jjverkuil.nl header.b=Sg3VoXHU; arc=none smtp.client-ip=185.233.34.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=jjverkuil.nl
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jjverkuil.nl
Received: from smtp.freedom.nl (unknown [10.10.4.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by dane.soverin.net (Postfix) with ESMTPS id 4bM4xb3Sswz16F7;
	Tue, 17 Jun 2025 11:52:51 +0000 (UTC)
Received: from smtp.freedom.nl (smtp.freedom.nl [10.10.4.107]) by freedom.nl (Postfix) with ESMTPSA id 4bM4xb0prYz6Z;
	Tue, 17 Jun 2025 11:52:51 +0000 (UTC)
Authentication-Results: smtp.freedom.nl;
	dkim=pass (2048-bit key; unprotected) header.d=jjverkuil.nl header.i=@jjverkuil.nl header.a=rsa-sha256 header.s=soverin1 header.b=Sg3VoXHU;
	dkim-atps=neutral
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jjverkuil.nl;
	s=soverin1; t=1750161171;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=excV/gzJVNpPCUfEh0q5UnJFwWlVoECZxdRG8lH8aGc=;
	b=Sg3VoXHUjmS1GvskRgsw27969RCrLkUAPq+5vbqSbi9qmOZZ70t6zLMRtbLwSaijHUH8jE
	yRPk1hyQhtdCb+JFBO/HwjVxteynNYORVplDGpIT+GSnoyAerT3SWVrUtEeyVFxLugBTeh
	kdP+bvYT3eDUvAj51B5EV/V9eJRILQVxM2FbOJ4dTIdE53kFao78PIekNZfX9tGadpqKqr
	ovy2k9b9DI3JzDW/MlsdkqalPLpz2OI+rKKe2UihFg7MVHsc+dVQ/KgyogzXP+lmHtS0CO
	K8OGbzvi6349nqAqVmX18eVCvquut7VIfsQfWrF6HaX4J85vjfIY0fyhfPabHg==
X-CM-Analysis: v=2.4 cv=d/oPyQjE c=1 sm=1 tr=0 ts=68515713 a=y7GQG8cVTJWmfFIGl7BB1w==:617 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=VwQbUJbxAAAA:8 a=cm27Pg_UAAAA:8 a=j2hkQBxl0sofITK2EG0A:9 a=QEXdDO2ut3YA:10
X-CM-Envelope: MS4xfKVVqi1t3qzY5KJTDIXKG8X9se96teABNsUUQhgJ0HHEkHRIL5ZpRRuxDQ1Kx2p25UkeJSkDAgFiAcStXKqQeI8QYjFMzUh6a2a12RuRXU5aOAvju8aW 3adMjsFIFk6AAaIRp+qBnZnSlp8VJgreir1kCvKGMbjIFGA1xniuBRU3V40ld+ol6qRC4gH17/dCRhlSJsafTY/iE6GvGHsZRJmhSR0HTxv8DxepbT2vKAKm gRIe/E09FknZ+YBx5AoN0vItQXe/si8B9KAQXDuvSTLkqlF66rMAuZQhSHGQ9B1cYe/4IsuxUXQpPNerVSfZDMUgHdlLtiU7RSyXcC37wMtVw02aiyHpCTPg 6qKJLydnoLapi4xb6NWqhXjVCG7samqrqYadc5O/W190SfmSeRK+8b/sX9oy9g3j05049mmWDuz2Nc2zwYr9eDb0UKcuQMABjIKAAdB3I7MC84wOmmxs85KO QV09D2tjQloa/Tj6
Message-ID: <08a426ae-be6e-4cbc-aaaf-7197bf839632@jjverkuil.nl>
Date: Tue, 17 Jun 2025 13:52:50 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH 0/2] media: uvcvideo: Enable keep-sorted
To: Hans de Goede <hansg@kernel.org>, Ricardo Ribalda <ribalda@chromium.org>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250429-keep-sorted-v1-0-2fa3538c0315@chromium.org>
 <f9275079-842a-406e-8bb7-b22a22b7c7e6@kernel.org>
 <CANiDSCt18PUWo2Z-9T2nBMMJfpRcdAGhO5S0jE85-1ZPO1qD7g@mail.gmail.com>
 <b78cde8b-23b2-48c5-b8c6-b935a403963f@kernel.org>
 <CANiDSCuPP+EOCps0gjH_bpJWsbyJDBcD+NoOeTB-sSUjUr0=Sg@mail.gmail.com>
 <61600bf6-92dc-49cd-bad9-a7342ce2fef9@kernel.org>
Content-Language: en-US, nl
From: Hans Verkuil <hans@jjverkuil.nl>
Autocrypt: addr=hans@jjverkuil.nl; keydata=
 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
In-Reply-To: <61600bf6-92dc-49cd-bad9-a7342ce2fef9@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spampanel-Class: ham

On 16/06/2025 15:38, Hans de Goede wrote:
> Hi Ricardo,
> 
> On 16-Jun-25 15:31, Ricardo Ribalda wrote:
>> On Mon, 16 Jun 2025 at 15:26, Hans de Goede <hansg@kernel.org> wrote:
>>>
>>> Hi Ricardo,
>>>
>>> On 16-Jun-25 15:22, Ricardo Ribalda wrote:
>>>> Hi Hans
>>>>
>>>> On Mon, 16 Jun 2025 at 15:05, Hans de Goede <hansg@kernel.org> wrote:
>>>>>
>>>>> Hi Ricardo,
>>>>>
>>>>> On 29-Apr-25 15:47, Ricardo Ribalda wrote:
>>>>>> When committers contribute quirks to the uvc driver, they usually add
>>>>>> them out of order.
>>>>>>
>>>>>> We can automatically validate that their follow our guidelines with the
>>>>>> use of keep-sorted.
>>>>>>
>>>>>> This patchset adds support for keep-sorted in the uvc driver. The two
>>>>>> patches can be squashed if needed.
>>>>>>
>>>>>> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
>>>>>
>>>>> I've no objections against these 2 patches, but these need to be
>>>>> rebased on top of the latest uvc/for-next. Can you send out a new
>>>>> version please ?
>>>>
>>>> I was waiting for HansV to say that keep-sorted was useful and then
>>>> add it to the CI.
>>>
>>> Ok, so should we drop this series from patchwork then ?
>>
>> If the series does not bother you too much in patchwork let it stay
>> there until HansV replies to the makefile series.

I did that. Basically I don't like the keep-sorted annotation unless it
is rolled out kernel-wide. It's not something we should do just in the
media subsystem.

That doesn't mean that a patch fixing the uvc_ids order isn't welcome,
but just drop the annotation.

If we do that, then patch 1/2 is also no longer needed. Although it
feels more logical that match_flags is at the end. I leave that to
HdG and Laurent to decide.

Regards,

	Hans

> 
> Sure that works for me.
> 
> Regards,
> 
> Hans
> 
> 


