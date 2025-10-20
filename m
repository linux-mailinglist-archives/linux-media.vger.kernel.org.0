Return-Path: <linux-media+bounces-45053-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id EE65FBF24FC
	for <lists+linux-media@lfdr.de>; Mon, 20 Oct 2025 18:07:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8434C3A942D
	for <lists+linux-media@lfdr.de>; Mon, 20 Oct 2025 16:05:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8C0E8283FDD;
	Mon, 20 Oct 2025 16:05:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="oJ9/rVdP"
X-Original-To: linux-media@vger.kernel.org
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com [210.118.77.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 189DC1CEADB
	for <linux-media@vger.kernel.org>; Mon, 20 Oct 2025 16:05:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.118.77.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760976323; cv=none; b=NUHpq55uFERABRF4GR4mCrl+iK2lV9SpYbLqWTp5kRdyVDCYrBp9L7qYsEdbfxIzQ95yknjC16EmdCoBVRuEw7c9+LmECerex5f7G8rMyvLoQKMejTVIzrDZenU8ffY6fijKgtvHO5UhDr6s++RUEoQ/WzKjlyBUvgQW18Vj96E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760976323; c=relaxed/simple;
	bh=3oF43lksJ9ygM8ewfRf+0YO+ZnJQICThOq7TsgiSkAw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:From:In-Reply-To:
	 Content-Type:References; b=Ov+z3L9sBH7H+A40y5xwYC64vmx0Fleqb1sd5Y4PE2R/qrCqN1Epdjf9CbLvAZhl/8o/DeU9ZJ1LN3S1IFmGqKUgYpJjsp0KALlZQOYzpcY9YQ30gOhI7dy6EecIO5xWHPF98P9LhkvRfg5XUWUmZhA4CiQlVTxB3zCgt1LfYo0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=oJ9/rVdP; arc=none smtp.client-ip=210.118.77.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
	by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20251020160519euoutp01eefc54127dd2667e1db7c7a1c6865b61~wPqHliQQa2237922379euoutp016
	for <linux-media@vger.kernel.org>; Mon, 20 Oct 2025 16:05:19 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20251020160519euoutp01eefc54127dd2667e1db7c7a1c6865b61~wPqHliQQa2237922379euoutp016
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1760976319;
	bh=epShz+CTOjY93xi7RVW37ayBnF7a/lRcVt7p/Q0G6UY=;
	h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
	b=oJ9/rVdPrTfHFcLWMVPkdpTgyvf+UUF5turT5qNnFT/su0+7pBMQGh/khYB2qw3g3
	 pRJLXAgTT6pXFTvzQssoBtmQX075DjmTDpGOYC1NRq+2ewa8F8Pp4PlXZhUsXHbdTE
	 YhepKCrYCrDr2oTatyLuN9VsD5kB1ggl6tMRTpxA=
Received: from eusmtip2.samsung.com (unknown [203.254.199.222]) by
	eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
	20251020160518eucas1p170b171f7b893a3ca0ddc4aed2a227836~wPqHFFq-02701827018eucas1p1t;
	Mon, 20 Oct 2025 16:05:18 +0000 (GMT)
Received: from [106.210.134.192] (unknown [106.210.134.192]) by
	eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20251020160518eusmtip225816944b290f34ad376016b247e0857~wPqGZ8Q4P1470014700eusmtip2Y;
	Mon, 20 Oct 2025 16:05:17 +0000 (GMT)
Message-ID: <0f159e72-e5e4-44ea-8b3e-1ccb9341a9e8@samsung.com>
Date: Mon, 20 Oct 2025 18:05:17 +0200
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
In-Reply-To: <258b9036-697d-48b2-91d6-5fb8ea2f1350@collabora.com>
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20251020160518eucas1p170b171f7b893a3ca0ddc4aed2a227836
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
	<642c2102-8d0f-4883-ab02-dd1da66a7a94@samsung.com>
	<258b9036-697d-48b2-91d6-5fb8ea2f1350@collabora.com>

On 20.10.2025 10:30, Benjamin Gaignard wrote:
> Le 20/10/2025 à 10:21, Marek Szyprowski a écrit :
>> On 20.10.2025 09:48, Benjamin Gaignard wrote:
>>> Le 20/10/2025 à 09:39, Hans Verkuil a écrit :
>>>> On 20/10/2025 09:34, Marek Szyprowski wrote:
>>>>> On 20.10.2025 09:11, Benjamin Gaignard wrote:
>>>>>> Le 16/10/2025 à 13:11, Marek Szyprowski a écrit :
>>>>>>> create_bufs and remove_bufs ioctl calls manipulate queue internal
>>>>>>> buffer
>>>>>>> list, potentially overwriting some pointers used by the legacy 
>>>>>>> fileio
>>>>>>> access mode. Simply forbid those calls when fileio is active to
>>>>>>> protect
>>>>>>> internal queue state between subsequent read/write calls.
>>>>>> Hi Marek,
>>>>>>
>>>>>> I may be wrong but using fileio API and create/remove API at the 
>>>>>> same
>>>>>> time
>>>>>> sound incorrect from application point of view, right ? If that not
>>>>>> the
>>>>>> case maybe we should also add a test in v4l2-compliance.
>>>>> Definitely that's incorrect and v4l2-core must forbid such calls. The
>>>>> standard reqbufs/qbuf/dqbuf API is also forbidden. Extending
>>>>> v4l2-compliance tools is probably a good idea.
>>>> Yes, please! A patch is welcome.
>>>>
>>>>    I also wonder if its a
>>>>> good time to add a kernel option to completely disable legacy fileio
>>>>> access mode, as it is not really needed for most of the systems
>>>>> nowadays.
>>>> No, that will break applications. Using read() is very common (and
>>>> convenient!)
>>>> for MPEG encoders such as the cx18 driver.
>>>>
>>>> The fileio code is not blocking any new development, it's just there
>>>> for those
>>>> drivers were it makes sense.
>>>>
>>>> Regards,
>>>>
>>>>      Hans
>>> I wonder if this patch in useful because when calling
>>> vb2_ioctl_create_bufs()
>>> it already check in vb2_verify_memory_type() if fileio is used or not.
>> Frankly speaking the original report I got was about mixing fileio with
>> vb2_ioctl_remove_bufs and that case is indeed not protected.
>>
>> While analyzing that I've inspected a symmetrical ioctl
>> (vb2_ioctl_create_bufs), but it looks I've I missed that a check is in
>> vb2_verify_memory_type(). I will remove it in v2 then.
>
> To keep vb2_ioctl_remove_bufs() symmetrical to vb2_ioctl_create_bufs()
> we should do in vb2_ioctl_remove_bufs() something like :
> res = vb2_verify_memory_type(vdev->queue, vdev->queue->memory, d->type);
> instead of vdev->queue->type != d->type.
>
> This way we test fileio too.


Right, that will fit best. I've sent a v2 with such change. Btw, the 
vb2_verify_memory_type() name is a bit misleading in this context. Maybe 
it should be renamed to something like vb2_is_queue_compatible()?


Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland


