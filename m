Return-Path: <linux-media+bounces-15273-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F2B919393A0
	for <lists+linux-media@lfdr.de>; Mon, 22 Jul 2024 20:39:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id F1EB71C2161D
	for <lists+linux-media@lfdr.de>; Mon, 22 Jul 2024 18:39:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0C33B16FF48;
	Mon, 22 Jul 2024 18:39:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b="I4iTSIAo"
X-Original-To: linux-media@vger.kernel.org
Received: from mout.web.de (mout.web.de [217.72.192.78])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AF36770E6;
	Mon, 22 Jul 2024 18:39:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.72.192.78
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721673547; cv=none; b=kpxy6hEctVh7XUi1P+7C32bjSeaYCk6/IUvUC8PQuiu9pJXJwQdLTBgNbDDfCtesU7wTax4P+N7M3vLTINMiklDz2OxW8wPt6n3JUoxAHqRAfzjyrGqnV5Y/scZ9Uu37ewx/XssIIHK5evpfZ13pZSk2ubOrF+RGQvAqvgv6t+w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721673547; c=relaxed/simple;
	bh=JVueuaQxc50mO20jJ1vHlpyC2l8+s9yhIhgUYNKGJrE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Q2VI5kcyYkSwmSIdibfdu0/NF3rjI7FgM+5Ki3/5VFoT+ML8IF2VLGOdxxiBsRt7znj5dnTUQN9CUlSK7aM+ZTXa5D4jCpvyveEzp0eHftJGE1ksKhojVALo1/7LDpTJUVdXIkHaAVXlUnQRDuMHOuyrnilcmyux02CjYPnYdFg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de; spf=pass smtp.mailfrom=web.de; dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b=I4iTSIAo; arc=none smtp.client-ip=217.72.192.78
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=web.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1721673507; x=1722278307; i=markus.elfring@web.de;
	bh=ZWBanF7ancu1eZNKQrcMwj3+MkIgAZbQm2LNdRgEOCs=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=I4iTSIAobGyOd+AymvOsGwuGnjZUqOv/TqDFglY00EC4Nkc3lIJVgH5Q1ouSe2br
	 45pPLt3Uu9z3WboNK7hNKOGBRvEYo0WGIoHTO5CulEhiNpkU0LoboFH0erUEgpH91
	 nCFBdPhy542VWyRoNy30j5R/tryZQ80XbE1u7ZXVE0EAPMxYA9wXlBvMNCMaw2W39
	 QSMyYTjAM4/cXvH5ohnuNS48foxkbUqAz7fYC6eHfUH/GZgLpXEC8a3djDJf+xGnA
	 88PbcOn7Lk2+0OvN20lkoYJPCPe6wAxxXy+CTCxtyTvGd2OZBy5EXdGgLjthYBXmN
	 UjGruqdPANY4d/6Ecw==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.21] ([94.31.89.95]) by smtp.web.de (mrweb105
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1MxYbD-1s7zzu1CqP-00xc8g; Mon, 22
 Jul 2024 20:38:27 +0200
Message-ID: <7c0e8a0e-3282-4d4e-a5b8-bcd979da3bfa@web.de>
Date: Mon, 22 Jul 2024 20:38:23 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 05/28] dma-heap: Add proper kref handling on dma-buf
 heaps
To: John Stultz <jstultz@google.com>, "T. J. Mercier" <tjmercier@google.com>,
 Yong Wu <yong.wu@mediatek.com>, Yunfei Dong <yunfei.dong@mediatek.com>,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org
Cc: Angelo Gioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>,
 Jeffrey Kardatzke <jkardatzke@google.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Nathan Hebert <nhebert@chromium.org>,
 Nicolas Dufresne <nicolas.dufresne@collabora.com>,
 =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>,
 Sebastian Fricke <sebastian.fricke@collabora.com>,
 Tomasz Figa <tfiga@chromium.org>, LKML <linux-kernel@vger.kernel.org>,
 Brian Starkey <Brian.Starkey@arm.com>, Chen-Yu Tsai <wenst@chromium.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Daniel Vetter <daniel@ffwll.ch>, =?UTF-8?Q?Fritz_K=C3=B6nig?=
 <frkoenig@chromium.org>, Hsin-yi Wang <hsinyi@chromium.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Steve Cho
 <stevecho@chromium.org>, Sumit Semwal <sumit.semwal@linaro.org>
References: <20240720071606.27930-6-yunfei.dong@mediatek.com>
 <2f5e5e81-21e1-421d-94ac-e4507b323680@web.de>
 <CANDhNCqzme0q7vey1jc84T0HJPiOSQF2fkyBfBLntdiyafEzYA@mail.gmail.com>
Content-Language: en-GB
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <CANDhNCqzme0q7vey1jc84T0HJPiOSQF2fkyBfBLntdiyafEzYA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:GUZxA/Aux5PMQCDi3hxau4Wsl2vvcaVXo8wngueekGYUSpLKpTZ
 SZ+IkMcGhDyOu7j4TOaus2e6WUeeytvl7jOYhQjntSgL0UusCDupvyPI0aSvEzrhTH+t2k1
 e1NVUTk+FeAJcAzHmGE9z+kk0ieRGaYH5NxGNR3jGF/f2iK9INYl2UO+y1UbNctEegCUcue
 ZHTwISnzOUpyr5bexuTFg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:bhFioqfY1wU=;Kv7lhJ+Q4TRnO+ldpI1Gz2iy26A
 pANDVEbpH4EydeHjXK71eW28xjh18xq5JfjQvHCQl+F17L4AyXNPsC6GcFLS9VFgb7kdjE5em
 QnAMeV/0La7mktwt+cl8iJS+dRSbb5ItdlNCUNGVB86sfJs4gCwhxWGZjXqV7x54GbJbMq0Kf
 fIqbNQE6vaxgOFXiyqSz+jqgfgVUhJqtZiW7erQpdiXSlthth7tMRQ9wkPjG5kcj2xEhudjOg
 pcmRtMhLRL9ti202DzpemmZkXAnYdvd3Vt/2dJuQ10ysPsHPEPweRmNVdHQlWATkm61WPn2PD
 3KNyabzkSPAfHhIYDNKthb6N53EGpdEzmwVUCtIW2L2CW4+8Eyx8+Z/hNqwcsaHTGpHBbC7yg
 J0EOTOf/UqYoldI6LRKEjAWa+Un6X/BcSVGZiNPcyl5yY3Zoph64mlx8ptMjkm5NuqquJtukc
 YY7eDBFUkjUla+LYRuqiZTrube6fLqXb53czu/NilHVb0h0qbFwGKR7+CewhgqzYTZSYWNTta
 InM0lpqFxLJiZQWUcoFAp4xDPOD3MmCwUvs+0F0w7FoOd0cNdQ2WsVkS26ghFSJxYClfsXgq6
 BTCkzzJmjGwr2oHuFwHLM/Nlbx3trNTCQd2dIzm0yhwYSbPO9z1hb+NYxgoBCCGYNgtY6PN2C
 rDWGoLwKUpU7sVQJkOzTDxC+0o+Bp/rhKvsFXBQQC/hibLG+XHEa8g7d/nt7oyTzGs5zjs8EZ
 EKOVs9AH/OHOlWZYic6+E4pKHnqG1cFaq7ZJuZJ9iigQ595a6AP0AyEsk0lr5SOf2PS0Kx8/8
 28KGCtFSpm6jv+2f2bDFVfaQ==

>> =E2=80=A6
>>> +++ b/drivers/dma-buf/dma-heap.c
>> =E2=80=A6
>>> +static void dma_heap_release(struct kref *ref)
>>> +{
>> =E2=80=A6
>>> +     mutex_lock(&heap_list_lock);
>>> +     list_del(&heap->list);
>>> +     mutex_unlock(&heap_list_lock);
>> =E2=80=A6
>>
>> Under which circumstances would you become interested to apply a statem=
ent
>> like =E2=80=9Cguard(mutex)(&heap_list_lock);=E2=80=9D?
>> https://elixir.bootlin.com/linux/v6.10/source/include/linux/mutex.h#L19=
6
>
> This strikes me as a strange place to apply it, as it seems like it
> would grow the lock hold time to the entire scope of the function
> unless one created a subscope for just the list_del, at which point
> you're not saving much or really improving readability.  I definitely
> think guard usage is very interesting in places where locks are
> released in multiple exit paths, etc. but this is a very trivial and
> straightforward lock/unlock usage, so I fret I don't quite understand
> the suggestion.

I propose to take further design possibilities better into account for
applications of scope-based resource management.
Additional compound statements may be constructed on demand by adding
extra curly brackets.
You might occasionally find scoped guards more appealing.
https://elixir.bootlin.com/linux/v6.10/source/include/linux/cleanup.h#L137

Regards,
Markus

