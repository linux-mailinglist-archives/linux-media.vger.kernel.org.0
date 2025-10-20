Return-Path: <linux-media+bounces-45006-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B094BEFF4F
	for <lists+linux-media@lfdr.de>; Mon, 20 Oct 2025 10:31:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id D1A7234A520
	for <lists+linux-media@lfdr.de>; Mon, 20 Oct 2025 08:31:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8FD452EBDEB;
	Mon, 20 Oct 2025 08:31:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=benjamin.gaignard@collabora.com header.b="Hz510bjN"
X-Original-To: linux-media@vger.kernel.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D67754763;
	Mon, 20 Oct 2025 08:31:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760949078; cv=pass; b=JPRsB6lX+Ty1/Fd5PAOQynw5dyRwOy2Al55ZQryZJ3sDPy70ap4PEoucE3bhnz+PN1PFTjH5eB96YuZuKXslkBBdJB+T2Bclby8LoahonlMHTotTu2e29Rp/80QpAQg7Nx37dMSqKTxKVDozOiSTuKkraA3eN3C9a2tfAo08H6M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760949078; c=relaxed/simple;
	bh=GxDW6HUYxD1XUJYrmVdYCf0aaVS7E0xLMcKwUuyGJy0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=oxAdGVnfb9AzqEgk49Vrnv6tkE8HP5CQI1Bbtwg/uJxyIixy5Pg5Xqk1/FxogNRND6UuUIbEkIz2vZeXb/miZKdGFS9INDsWYp8iE447DfotO4+sqXS3W3rpnc0iQeHa8Unho6zvj4Ip0pKtwZaFNoEatqcVk0N08VEpD8ZilWU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=benjamin.gaignard@collabora.com header.b=Hz510bjN; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
ARC-Seal: i=1; a=rsa-sha256; t=1760949065; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=fuGrOvO5gEcKfcaA5DfZD5Td/6duZ3meJlYvUUXHuNfZKtTAwGDtB+TclWhyfkzwT4l+P2tbuB9Kq1VNxJKE9gR8lTpt4qHIPikrC/XrkgU1tcaA8TX6DSoR6fGwH8lavbzavY4jSArjD0WJnzavv4K4vOrnHYFTC3r6QfW65Ek=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1760949065; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=i2q52bXAKqn7gOfHhudM0m7RKKiSLxsHofXnBnnwlZU=; 
	b=KC2+fpAA6gHyMSH2GNoleqoGqhL4o+OBU/vqP83vsGm5ubPjm1q87zkXiDqWjMUMDPdPd00ZmYDa5TkDIhAkE0CBw2cSe4IQQc1AVTiRhc1mf2fVK44azU758p4uXkLxfzZhgNKjvUTOmcs8iwYTiwheZWg9OsDeJx/rt9ItZ7k=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=benjamin.gaignard@collabora.com;
	dmarc=pass header.from=<benjamin.gaignard@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1760949064;
	s=zohomail; d=collabora.com; i=benjamin.gaignard@collabora.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=i2q52bXAKqn7gOfHhudM0m7RKKiSLxsHofXnBnnwlZU=;
	b=Hz510bjNICHwjJ9c9WlvE/kJMH/Vcs2NB9XaFCoLdwYtqJv8TvSBJrvIKPIaHGFo
	LLAU4P7dHA0HWaAuzhwCsF6HbOHPiTlr5xuqhs7uuvhZOZ411VAGmLxQ2ifF6ileenm
	o0oPb/tY08JYjFPheFXr8xI4tDzLbzvm/LUOQALo=
Received: by mx.zohomail.com with SMTPS id 1760949062626473.4112073699241;
	Mon, 20 Oct 2025 01:31:02 -0700 (PDT)
Message-ID: <258b9036-697d-48b2-91d6-5fb8ea2f1350@collabora.com>
Date: Mon, 20 Oct 2025 10:30:59 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] media: videobuf2: forbid create_bufs/remove_bufs when
 legacy fileio is active
To: Marek Szyprowski <m.szyprowski@samsung.com>,
 Hans Verkuil <hverkuil+cisco@kernel.org>, linux-media@vger.kernel.org,
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
 <21707335-a45d-4f87-9490-ac2828a5d9e3@collabora.com>
 <642c2102-8d0f-4883-ab02-dd1da66a7a94@samsung.com>
Content-Language: en-US
From: Benjamin Gaignard <benjamin.gaignard@collabora.com>
In-Reply-To: <642c2102-8d0f-4883-ab02-dd1da66a7a94@samsung.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


Le 20/10/2025 à 10:21, Marek Szyprowski a écrit :
> On 20.10.2025 09:48, Benjamin Gaignard wrote:
>> Le 20/10/2025 à 09:39, Hans Verkuil a écrit :
>>> On 20/10/2025 09:34, Marek Szyprowski wrote:
>>>> On 20.10.2025 09:11, Benjamin Gaignard wrote:
>>>>> Le 16/10/2025 à 13:11, Marek Szyprowski a écrit :
>>>>>> create_bufs and remove_bufs ioctl calls manipulate queue internal
>>>>>> buffer
>>>>>> list, potentially overwriting some pointers used by the legacy fileio
>>>>>> access mode. Simply forbid those calls when fileio is active to
>>>>>> protect
>>>>>> internal queue state between subsequent read/write calls.
>>>>> Hi Marek,
>>>>>
>>>>> I may be wrong but using fileio API and create/remove API at the same
>>>>> time
>>>>> sound incorrect from application point of view, right ? If that not
>>>>> the
>>>>> case maybe we should also add a test in v4l2-compliance.
>>>> Definitely that's incorrect and v4l2-core must forbid such calls. The
>>>> standard reqbufs/qbuf/dqbuf API is also forbidden. Extending
>>>> v4l2-compliance tools is probably a good idea.
>>> Yes, please! A patch is welcome.
>>>
>>>    I also wonder if its a
>>>> good time to add a kernel option to completely disable legacy fileio
>>>> access mode, as it is not really needed for most of the systems
>>>> nowadays.
>>> No, that will break applications. Using read() is very common (and
>>> convenient!)
>>> for MPEG encoders such as the cx18 driver.
>>>
>>> The fileio code is not blocking any new development, it's just there
>>> for those
>>> drivers were it makes sense.
>>>
>>> Regards,
>>>
>>>      Hans
>> I wonder if this patch in useful because when calling
>> vb2_ioctl_create_bufs()
>> it already check in vb2_verify_memory_type() if fileio is used or not.
> Frankly speaking the original report I got was about mixing fileio with
> vb2_ioctl_remove_bufs and that case is indeed not protected.
>
> While analyzing that I've inspected a symmetrical ioctl
> (vb2_ioctl_create_bufs), but it looks I've I missed that a check is in
> vb2_verify_memory_type(). I will remove it in v2 then.

To keep vb2_ioctl_remove_bufs() symmetrical to vb2_ioctl_create_bufs()
we should do in vb2_ioctl_remove_bufs() something like :
res = vb2_verify_memory_type(vdev->queue, vdev->queue->memory, d->type);
instead of vdev->queue->type != d->type.

This way we test fileio too.


>
> Best regards

