Return-Path: <linux-media+bounces-44989-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 963EBBEFBC3
	for <lists+linux-media@lfdr.de>; Mon, 20 Oct 2025 09:48:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4FB913BF2B1
	for <lists+linux-media@lfdr.de>; Mon, 20 Oct 2025 07:48:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 96C4A2E1F0E;
	Mon, 20 Oct 2025 07:48:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=benjamin.gaignard@collabora.com header.b="I2K0FfsJ"
X-Original-To: linux-media@vger.kernel.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E8842E03E6;
	Mon, 20 Oct 2025 07:48:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760946524; cv=pass; b=hPtgDoEezTEiNoJ4tEGYsXVc9MKSnZMy0du62n+kLie7X3Vfz7YM+0xFMuRnFwQbcby60X2NVhmEwxxIoGrvaAv8KHs+PszI/Ro+pA1R09vfSmPKNo+l2RzTgkBtjMJ1NdS25fbcRyn47Be/fmwdVlCuKIyf+fa3YHwbp7O3mVk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760946524; c=relaxed/simple;
	bh=yizVlvXbz8Es7RJa61rxSIoFAkW0XSoMAY0g09sSWAU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kcphp4vUWqD2Qf7xFmp4iKCLM4q2kNh0fckDJTwj6fclmWGq0gTRka3dMTdBriLaQ1B9fRa5EBEujBdt/+xfga8gGmFd/kDu+F+GUC8kxHaJe4rGnWase8cuSNlac35k+Qb06jZDBvR/2preyXHX78L5R6OZv2lEViFXiNnrEKA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=benjamin.gaignard@collabora.com header.b=I2K0FfsJ; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
ARC-Seal: i=1; a=rsa-sha256; t=1760946516; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=hSuXc7b8dPF7zdmfKcabME6hXjM9CNEIJba4gEirKLP0AW9cqPIro7HycKXBE8p5ottioTc6Gwt9mAyvSULf9Umx1DBQjRDg+247vErVeNYg0X47RY+DF2JBr/huDusacya8blIdHi2//5JmK/Ic6NraXKNlDsg8jA1nc7SuHbM=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1760946516; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=F7qIvKTzEW6jumALJeFIwOEbUuUhF9KkO1gT88g/dVs=; 
	b=nOPY2l3Wdjw+eDxZISe9X00uMsclAuq+Iy2h6a/H0EusQ9p+klR61qf2ukPQf/U+1Qp6Qfzq4fLlUZlQYCC0a6mknP9zxjmNbByPNAnTizR4cJOEBGmeeWKaYRQVGx/3tLcr/FaFMv+HlBdj1dlqpIBRCtuyo7pZn2I5tvrL91A=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=benjamin.gaignard@collabora.com;
	dmarc=pass header.from=<benjamin.gaignard@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1760946516;
	s=zohomail; d=collabora.com; i=benjamin.gaignard@collabora.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=F7qIvKTzEW6jumALJeFIwOEbUuUhF9KkO1gT88g/dVs=;
	b=I2K0FfsJaDyih/+I2MdgM/NIv9WuS/APZoTM0PZ9d6td4W2oCiV2flBljmIVdaA+
	GZjkagCrutGhEJNfhDjWKI3Su+D/C8aSTzWGjUwwxkW9OptpPiYS1JiM9LiMtORRump
	S6ECYcmwLEbLX5XpeRB0ienV+xBmgyvaE5RfPygs=
Received: by mx.zohomail.com with SMTPS id 176094651202838.60314450046212;
	Mon, 20 Oct 2025 00:48:32 -0700 (PDT)
Message-ID: <21707335-a45d-4f87-9490-ac2828a5d9e3@collabora.com>
Date: Mon, 20 Oct 2025 09:48:28 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] media: videobuf2: forbid create_bufs/remove_bufs when
 legacy fileio is active
To: Hans Verkuil <hverkuil+cisco@kernel.org>,
 Marek Szyprowski <m.szyprowski@samsung.com>, linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org
Cc: Tomasz Figa <tfiga@chromium.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Guennadi Liakhovetski <g.liakhovetski@gmx.de>,
 Hans Verkuil <hverkuil@kernel.org>, stable@vger.kernel.org
References: <CGME20251016111208eucas1p24cd8cc1e952a8cdf73fbadea704b499d@eucas1p2.samsung.com>
 <20251016111154.993949-1-m.szyprowski@samsung.com>
 <36cfec0a-3717-4b0e-adc0-6887e6b58f44@collabora.com>
 <84133573-986d-4cc8-8147-246f0da34640@samsung.com>
 <1f2748a5-1955-48dd-93e4-69e032d895e0@kernel.org>
Content-Language: en-US
From: Benjamin Gaignard <benjamin.gaignard@collabora.com>
In-Reply-To: <1f2748a5-1955-48dd-93e4-69e032d895e0@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


Le 20/10/2025 à 09:39, Hans Verkuil a écrit :
> On 20/10/2025 09:34, Marek Szyprowski wrote:
>> On 20.10.2025 09:11, Benjamin Gaignard wrote:
>>> Le 16/10/2025 à 13:11, Marek Szyprowski a écrit :
>>>> create_bufs and remove_bufs ioctl calls manipulate queue internal buffer
>>>> list, potentially overwriting some pointers used by the legacy fileio
>>>> access mode. Simply forbid those calls when fileio is active to protect
>>>> internal queue state between subsequent read/write calls.
>>> Hi Marek,
>>>
>>> I may be wrong but using fileio API and create/remove API at the same
>>> time
>>> sound incorrect from application point of view, right ? If that not the
>>> case maybe we should also add a test in v4l2-compliance.
>> Definitely that's incorrect and v4l2-core must forbid such calls. The
>> standard reqbufs/qbuf/dqbuf API is also forbidden. Extending
>> v4l2-compliance tools is probably a good idea.
> Yes, please! A patch is welcome.
>
>   I also wonder if its a
>> good time to add a kernel option to completely disable legacy fileio
>> access mode, as it is not really needed for most of the systems nowadays.
> No, that will break applications. Using read() is very common (and convenient!)
> for MPEG encoders such as the cx18 driver.
>
> The fileio code is not blocking any new development, it's just there for those
> drivers were it makes sense.
>
> Regards,
>
> 	Hans

I wonder if this patch in useful because when calling vb2_ioctl_create_bufs()
it already check in vb2_verify_memory_type() if fileio is used or not.

>>   > ...
>>
>> Best regards
>

