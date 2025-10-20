Return-Path: <linux-media+bounces-44996-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 100C0BEFE5C
	for <lists+linux-media@lfdr.de>; Mon, 20 Oct 2025 10:21:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id B7CE84EF954
	for <lists+linux-media@lfdr.de>; Mon, 20 Oct 2025 08:21:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 046222EB5BF;
	Mon, 20 Oct 2025 08:21:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="H4qBAEVC"
X-Original-To: linux-media@vger.kernel.org
Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com [210.118.77.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5728C2EAB7A
	for <linux-media@vger.kernel.org>; Mon, 20 Oct 2025 08:21:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.118.77.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760948495; cv=none; b=ONHwdD5ilHFlDbkVNtdy8lsKWXIYvsM+3z5S84JSreUIsg9us4m0v0QaBHyqRnHTifomZ3BvK82JE7fc84wlsYekyjZjjtUKztEdY+YO1AWB2/sM1PBCvr21DT+g1++pGwx1iiyna35FJoNB6NtmX2i12QtCPytZ4HxDEq498xE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760948495; c=relaxed/simple;
	bh=vYIeq28h+h6uqLtsFXdAP42iMivoDA7xV9+y/sQhMCg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:From:In-Reply-To:
	 Content-Type:References; b=Eu84vdqFMml4QVEmNTqjFGu1JYEDpZulICo5NQFwdnWRKW/50YHEGu6LBJ+lLewYXsWGTR9JHXguNSmWgCmh2vH4yUq+f7ABHSuUgv9vnyzBPRsuDwT8L6vlrpR+MNePch26/vX6o1RIqEQUdfBpHbC/RcwePNiD0+JGx63Qyx4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=H4qBAEVC; arc=none smtp.client-ip=210.118.77.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
	by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20251020082131euoutp0225014c200d8f70982bbab6a6393b0253~wJVLHJ4ZR2722427224euoutp02g
	for <linux-media@vger.kernel.org>; Mon, 20 Oct 2025 08:21:31 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20251020082131euoutp0225014c200d8f70982bbab6a6393b0253~wJVLHJ4ZR2722427224euoutp02g
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1760948491;
	bh=ZFEomdtwKlWNv3vaRjUKVJ38TVbMvp19aEpEGTtW77A=;
	h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
	b=H4qBAEVCxlWoQSWtZ7L1rf1eWVhBfrk/7TQogUjlqSKeJQF2pgixJ9afkIGX8Xpj/
	 zE/UnPgB5KkA3RJBdCxGfy+PZf4bS90+d6OcZdw2/fF2Xvew7T+P1+ZGm0NK5Qi2m2
	 IbLR9jPHZfU8lPEP+TFPF4Nn/vpUsXpyqDPPk9wk=
Received: from eusmtip1.samsung.com (unknown [203.254.199.221]) by
	eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
	20251020082131eucas1p1d723f7687dc5453dd4d19f0aaaa68bcd~wJVKw2cA11652416524eucas1p1P;
	Mon, 20 Oct 2025 08:21:31 +0000 (GMT)
Received: from [106.210.134.192] (unknown [106.210.134.192]) by
	eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20251020082130eusmtip16db5dadda3e2e2ec69c92492a82572a2~wJVKGUsc92519025190eusmtip1h;
	Mon, 20 Oct 2025 08:21:30 +0000 (GMT)
Message-ID: <642c2102-8d0f-4883-ab02-dd1da66a7a94@samsung.com>
Date: Mon, 20 Oct 2025 10:21:30 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Betterbird (Windows)
Subject: Re: [PATCH] media: videobuf2: forbid create_bufs/remove_bufs when
 legacy fileio is active
To: Benjamin Gaignard <benjamin.gaignard@collabora.com>, Hans Verkuil
	<hverkuil+cisco@kernel.org>, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Tomasz Figa <tfiga@chromium.org>, Mauro Carvalho Chehab
	<mchehab@kernel.org>, Guennadi Liakhovetski <g.liakhovetski@gmx.de>, Hans
	Verkuil <hverkuil@kernel.org>, stable@vger.kernel.org
Content-Language: en-US
From: Marek Szyprowski <m.szyprowski@samsung.com>
In-Reply-To: <21707335-a45d-4f87-9490-ac2828a5d9e3@collabora.com>
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20251020082131eucas1p1d723f7687dc5453dd4d19f0aaaa68bcd
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20251016111208eucas1p24cd8cc1e952a8cdf73fbadea704b499d
X-EPHeader: CA
X-CMS-RootMailID: 20251016111208eucas1p24cd8cc1e952a8cdf73fbadea704b499d
References: <CGME20251016111208eucas1p24cd8cc1e952a8cdf73fbadea704b499d@eucas1p2.samsung.com>
	<20251016111154.993949-1-m.szyprowski@samsung.com>
	<36cfec0a-3717-4b0e-adc0-6887e6b58f44@collabora.com>
	<84133573-986d-4cc8-8147-246f0da34640@samsung.com>
	<1f2748a5-1955-48dd-93e4-69e032d895e0@kernel.org>
	<21707335-a45d-4f87-9490-ac2828a5d9e3@collabora.com>


On 20.10.2025 09:48, Benjamin Gaignard wrote:
>
> Le 20/10/2025 à 09:39, Hans Verkuil a écrit :
>> On 20/10/2025 09:34, Marek Szyprowski wrote:
>>> On 20.10.2025 09:11, Benjamin Gaignard wrote:
>>>> Le 16/10/2025 à 13:11, Marek Szyprowski a écrit :
>>>>> create_bufs and remove_bufs ioctl calls manipulate queue internal 
>>>>> buffer
>>>>> list, potentially overwriting some pointers used by the legacy fileio
>>>>> access mode. Simply forbid those calls when fileio is active to 
>>>>> protect
>>>>> internal queue state between subsequent read/write calls.
>>>> Hi Marek,
>>>>
>>>> I may be wrong but using fileio API and create/remove API at the same
>>>> time
>>>> sound incorrect from application point of view, right ? If that not 
>>>> the
>>>> case maybe we should also add a test in v4l2-compliance.
>>> Definitely that's incorrect and v4l2-core must forbid such calls. The
>>> standard reqbufs/qbuf/dqbuf API is also forbidden. Extending
>>> v4l2-compliance tools is probably a good idea.
>> Yes, please! A patch is welcome.
>>
>>   I also wonder if its a
>>> good time to add a kernel option to completely disable legacy fileio
>>> access mode, as it is not really needed for most of the systems 
>>> nowadays.
>> No, that will break applications. Using read() is very common (and 
>> convenient!)
>> for MPEG encoders such as the cx18 driver.
>>
>> The fileio code is not blocking any new development, it's just there 
>> for those
>> drivers were it makes sense.
>>
>> Regards,
>>
>>     Hans
>
> I wonder if this patch in useful because when calling 
> vb2_ioctl_create_bufs()
> it already check in vb2_verify_memory_type() if fileio is used or not.

Frankly speaking the original report I got was about mixing fileio with 
vb2_ioctl_remove_bufs and that case is indeed not protected.

While analyzing that I've inspected a symmetrical ioctl 
(vb2_ioctl_create_bufs), but it looks I've I missed that a check is in 
vb2_verify_memory_type(). I will remove it in v2 then.

Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland


