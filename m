Return-Path: <linux-media+bounces-15204-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E0CF59381C7
	for <lists+linux-media@lfdr.de>; Sat, 20 Jul 2024 17:14:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 84B7D1F215DC
	for <lists+linux-media@lfdr.de>; Sat, 20 Jul 2024 15:14:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3BE3713AD22;
	Sat, 20 Jul 2024 15:14:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b="niEuGOg7"
X-Original-To: linux-media@vger.kernel.org
Received: from mout.web.de (mout.web.de [212.227.15.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 180743211;
	Sat, 20 Jul 2024 15:14:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721488465; cv=none; b=NCsyN0M2XKKP6sfYlDpfIiU/lE5YABSyInDpSir8Ckcou3g8WLjnzMzOVyS2Es1CApKwqoMoJrrzMmHhZ+pwNCGIJyFAl1ksl5obsRpwQbbBh+mkG4LObfl61ZZMNk/M2HdPP2gnpH/DavFPrTKYZ21CiqK8SpoK49I/3Vpoc3w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721488465; c=relaxed/simple;
	bh=5pzifyv6T9S3l5lxU+v2lCCh2MU1upZk0O9VOXNqQ2A=;
	h=Message-ID:Date:MIME-Version:To:Cc:References:Subject:From:
	 In-Reply-To:Content-Type; b=mYtlZ//vA+FS/07Vz6rj/VudSo94yQvtAJIcByQIpu45HmJ5qi+fKznbs1gv7e7CZxZ+13KVJgewYflZB7guSjSn5gCulTGPtxMAZhrMlkwCAoKTMmQ+Xt7btu9zx5HyFaryazKdJ6NAagIDxmuYch9CMk6ylA2BSsy8LMZWf/Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de; spf=pass smtp.mailfrom=web.de; dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b=niEuGOg7; arc=none smtp.client-ip=212.227.15.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=web.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1721488426; x=1722093226; i=markus.elfring@web.de;
	bh=ANLLE1FZ2RR1WHzVhAMXGwQ0A90YNENVV09Nc6XgQhM=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:References:
	 Subject:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 cc:content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=niEuGOg7Z67VcGebyFHv3zykSxYdZG1fY+7vLDdpz1JGW6r4YueAX1G33SyKt+Tc
	 83PGlnI5ZYSmAazeUUkGWWTJ6nlq6Z4TL2XC1qQJxRzG4rgpHmtIlw+VycNvf4gft
	 k0aPq9W/9P9T5EhJqdG6+1VlFQnSWv/Dak6vV8HQJZ4+mCe02rHG9TYEa8ChaPmhO
	 ads+Q7f/cvqQERJhd/TlTMppI/kbikZN/MrpRcGduAEYVyVJ6ok2UgvYIk1Dd+v5A
	 a9O+1RsGm6UUHEOlRSHA36caPsiPca16KhpyqdQJo92cJJsbnnTDJIdluBLDC17/0
	 m3rM9rwiZXWbuK3xaw==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.21] ([94.31.89.95]) by smtp.web.de (mrweb005
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1MK52w-1sl4lg1Eo2-00Y4JF; Sat, 20
 Jul 2024 17:13:46 +0200
Message-ID: <2f5e5e81-21e1-421d-94ac-e4507b323680@web.de>
Date: Sat, 20 Jul 2024 17:13:40 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: John Stultz <jstultz@google.com>, "T. J. Mercier" <tjmercier@google.com>,
 Yong Wu <yong.wu@mediatek.com>, Yunfei Dong <yunfei.dong@mediatek.com>,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Angelo Gioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>,
 Jeffrey Kardatzke <jkardatzke@google.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Nathan Hebert <nhebert@chromium.org>,
 Nicolas Dufresne <nicolas.dufresne@collabora.com>,
 =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>,
 Sebastian Fricke <sebastian.fricke@collabora.com>,
 Tomasz Figa <tfiga@chromium.org>
Cc: LKML <linux-kernel@vger.kernel.org>, Brian Starkey
 <Brian.Starkey@arm.com>, Chen-Yu Tsai <wenst@chromium.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Daniel Vetter <daniel@ffwll.ch>, =?UTF-8?Q?Fritz_K=C3=B6nig?=
 <frkoenig@chromium.org>, Hsin-yi Wang <hsinyi@chromium.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Steve Cho
 <stevecho@chromium.org>, Sumit Semwal <sumit.semwal@linaro.org>
References: <20240720071606.27930-6-yunfei.dong@mediatek.com>
Subject: Re: [PATCH v7 05/28] dma-heap: Add proper kref handling on dma-buf
 heaps
Content-Language: en-GB
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <20240720071606.27930-6-yunfei.dong@mediatek.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:xCN5kVOJmi+99iZxV3ZaFC6z2tacIVcN87B7sFZUAIuVsvE+9jv
 va3LRkLSLMeceACmgBSFOUukvR38UNxFX/NlWYBwox7+fj26qbNooHxlk6pjhOuseQNeWnL
 /3+jMkhEj3ZKTq/IwIeY1nUIups/APFVOUGezCq2bLqs5N7p6eSG+gVqkMv/1p3PvzkCQFW
 Kw/AMe70ASauwualb0xxg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:fcstDclSA/c=;Ctdm7nJtr8AasI7Q1uuh4tDtijF
 9crG4aP1nI9tsA386U6h4nJ4nl+QyJ74s4jG208s6DMRxby79tk8cqJJMXDWAcgLgJY/zECSk
 r4+qULjryDobIvcd6U1fo70kUgJvuTM+U9CsyCsjt/X9sSfXQ/6FJtLVxH00s0+9BTyjdkPSg
 cVJVaUIXHWRHC6XMOYDSvqdoMBpcsfJWIEhcIwnn/8vAlCowZYitX3WH4+r21ha5tLMtaaZwm
 Ppd8g6ucZ8C9nLezzOXaGyb9Upy+Q7UIsGHq38JmxfM9N563opDD+HC558mkAf3QSwQVV2qWe
 Fg/SlTkdK6g+r1WIQvy78XKG2rp/SvJ4gofIxzvryrB4Chl5g4I9xg0I+q+x4a/2GMy9nV5Dl
 02+KmWYHGZA40OYYXhamroFBYKM9a2ibSAHI1b0+LJXs3AkaN3zbdZSSRvhGosBQ7y98S12Fq
 UMYWAiEhZtFfBCB4E020p1zDd3ye46noeNeNvWAT67NLDcjW/o8njm7XgaNipa/S69N6y2Hoc
 ep8QAGXO62ZFkUw4ndT65ch9qt2nfnVzP14T+V9eC8zVw2Nm0qGT1duSpiT8aPGwHHVGbEbue
 MzbvlaC8+GEFmeE3Nz6Vb9yeFrI0kAgHMNjis3L5SBxn99Fp9h1Ot0AAVARbH1AIXW7TNibDs
 8RIjviyBlUwBbu2uBGfyxqzBdtU0tjF3xL+pDimUQkFD4EyzH1j143hboMXSWwIDPQ0CP5k0E
 pVK5CEoEoLmbKrIeqbpK6qsfNKsZ+kCDxKOIRpG98ucqt+TibYt5xyc/NDINRVvEockjhnhQ3
 hPxiYz5X+aASwg/7ShR7ehMA==

=E2=80=A6
> +++ b/drivers/dma-buf/dma-heap.c
=E2=80=A6
> +static void dma_heap_release(struct kref *ref)
> +{
=E2=80=A6
> +	mutex_lock(&heap_list_lock);
> +	list_del(&heap->list);
> +	mutex_unlock(&heap_list_lock);
=E2=80=A6

Under which circumstances would you become interested to apply a statement
like =E2=80=9Cguard(mutex)(&heap_list_lock);=E2=80=9D?
https://elixir.bootlin.com/linux/v6.10/source/include/linux/mutex.h#L196

Regards,
Markus

