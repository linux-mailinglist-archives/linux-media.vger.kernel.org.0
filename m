Return-Path: <linux-media+bounces-11726-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 31B968CC129
	for <lists+linux-media@lfdr.de>; Wed, 22 May 2024 14:24:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DD5C22832E7
	for <lists+linux-media@lfdr.de>; Wed, 22 May 2024 12:24:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DB9E113D62C;
	Wed, 22 May 2024 12:24:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="sozDw0DP"
X-Original-To: linux-media@vger.kernel.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com [46.235.227.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E02AF13D53E;
	Wed, 22 May 2024 12:24:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.235.227.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716380671; cv=none; b=oPxlj3BI4j5dGMNopQyD5yx39RoKPvPDonLUHnfJZ16Q5zdTA2HsBTIQRDQ9krMVhPkQwqUMDgSnA/390VjmVSWppvkqPEQnCTvrnhSscYivpNTatAXbAnYwfHJEIJAmAp271IgrVX1Th2gUWC+LNZgglW7KLrx6ESRMlOCeeIs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716380671; c=relaxed/simple;
	bh=EPQiEdOm8pWQsKWJp92+fqy66UV0mN3U7t5279kB71c=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=JHvG0XiBGr2TPepNV6kriuR4VRZA0lbCpaTvmTLqUlL3kuGBSlLYPiDqmNJD8Lx5FEdAW4D/B9GUaNquqCv44ygtumPHuXkjBY2ds4FmyVC+7lTRhoen41xl3WolcXsAQvR0VoaGvzb5ktEi9A/tsr62oE3EjQ13DEd3mUBUh2g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=sozDw0DP; arc=none smtp.client-ip=46.235.227.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1716380668;
	bh=EPQiEdOm8pWQsKWJp92+fqy66UV0mN3U7t5279kB71c=;
	h=Date:From:Subject:To:Cc:References:In-Reply-To:From;
	b=sozDw0DPD0uUURT3kUpLdSLj4oFB+YkwD4ki4HAn2/SPsB3gVGldkHTul93jLe1Yv
	 sQz2WKx8N7XR5bH0rKz1lxIZG/eEYW8/lX59gPAjfXX62EtctyKRUG/vLSObWZBYhE
	 IZfxvTjLTMrLP9IJpF63a2spdtVdyUpekBl8hU9PVA4WBLb3j8xlvxCxgarSRaf9z7
	 dlRtSh7i67t6SuGRlwIldPf6OYni9kAgtMoreCUswb70DhL9+iH+GgBBWFa597CUL8
	 HKRiDv7uU6C2OchAaGZVccJty1TSliFdFcbUVUHx+Qcok3c9JduJaBDtBu4Sx6KQsb
	 BBWLUd04o+Utg==
Received: from [100.95.196.182] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: andrzej.p)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id D3E2337821A0;
	Wed, 22 May 2024 12:24:26 +0000 (UTC)
Message-ID: <f6819ac7-ba7a-442e-9408-af7bb673667c@collabora.com>
Date: Wed, 22 May 2024 14:24:26 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Andrzej Pietrasiewicz <andrzej.p@collabora.com>
Subject: Re: [PATCH v6,04/24] v4l: add documentation for restricted memory
 flag
To: Yunfei Dong <yunfei.dong@mediatek.com>,
 Jeffrey Kardatzke <jkardatzke@google.com>,
 =?UTF-8?Q?N=C3=ADcolas_F_=2E_R_=2E_A_=2E_Prado?= <nfraprado@collabora.com>,
 Nathan Hebert <nhebert@chromium.org>,
 Nicolas Dufresne <nicolas.dufresne@collabora.com>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Sebastian Fricke <sebastian.fricke@collabora.com>,
 Tomasz Figa <tfiga@chromium.org>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, Marek Szyprowski <m.szyprowski@samsung.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>, Yong Wu <yong.wu@mediatek.com>,
 Hsin-Yi Wang <hsinyi@chromium.org>, Fritz Koenig <frkoenig@chromium.org>,
 Daniel Vetter <daniel@ffwll.ch>, Steve Cho <stevecho@chromium.org>,
 Sumit Semwal <sumit.semwal@linaro.org>, Brian Starkey
 <Brian.Starkey@arm.com>, John Stultz <jstultz@google.com>,
 "T . J . Mercier" <tjmercier@google.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20240516122102.16379-1-yunfei.dong@mediatek.com>
 <20240516122102.16379-5-yunfei.dong@mediatek.com>
Content-Language: en-US
In-Reply-To: <20240516122102.16379-5-yunfei.dong@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Yunfei & Jeffrey,

W dniu 16.05.2024 o 14:20, Yunfei Dong pisze:
> From: Jeffrey Kardatzke <jkardatzke@google.com>
> 
> Adds documentation for V4L2_MEMORY_FLAG_RESTRICTED.
> 

Why not in the patch where the flag is actually being added?
 From that commit until this commit it would be undocumented.

While at it...

> Signed-off-by: Jeffrey Kardatzke <jkardatzke@google.com>
> Signed-off-by: Yunfei Dong <yunfei.dong@mediatek.com>
> ---
>   Documentation/userspace-api/media/v4l/buffer.rst | 10 +++++++++-
>   1 file changed, 9 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/userspace-api/media/v4l/buffer.rst b/Documentation/userspace-api/media/v4l/buffer.rst
> index 52bbee81c080..807e43bfed2b 100644
> --- a/Documentation/userspace-api/media/v4l/buffer.rst
> +++ b/Documentation/userspace-api/media/v4l/buffer.rst
> @@ -696,7 +696,7 @@ enum v4l2_memory
>   
>   .. _memory-flags:
>   
> -Memory Consistency Flags
> +Memory Flags
>   ------------------------
>   
>   .. raw:: latex
> @@ -728,6 +728,14 @@ Memory Consistency Flags
>   	only if the buffer is used for :ref:`memory mapping <mmap>` I/O and the
>   	queue reports the :ref:`V4L2_BUF_CAP_SUPPORTS_MMAP_CACHE_HINTS
>   	<V4L2-BUF-CAP-SUPPORTS-MMAP-CACHE-HINTS>` capability.
> +    * .. _`V4L2-MEMORY-FLAG-RESTRICTED`:
> +
> +      - ``V4L2_MEMORY_FLAG_RESTRICTED``
> +      - 0x00000002
> +      - The queued buffers are expected to be in restricted memory. If not, an
> +	error will be returned. This flag can only be used with ``V4L2_MEMORY_DMABUF``.
> +	Typically restricted buffers are allocated using a restricted dma-heap. This flag
> +	can only be specified if the ``V4L2_BUF_CAP_SUPPORTS_RESTRICTED_MEM`` is set.

is V4L2_BUF_CAP_SUPPORTS_RESTRICTED_MEM documented? Can it be referenced here
in a way similar to how V4L2_BUF_CAP_SUPPORTS_MMAP_CACHE_HINTS is?

Regards,

Andrzej

>   
>   .. raw:: latex
>   


