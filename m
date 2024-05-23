Return-Path: <linux-media+bounces-11791-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 544D18CD018
	for <lists+linux-media@lfdr.de>; Thu, 23 May 2024 12:15:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D08281F23A99
	for <lists+linux-media@lfdr.de>; Thu, 23 May 2024 10:15:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1973613F001;
	Thu, 23 May 2024 10:14:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="hIRBbJKA"
X-Original-To: linux-media@vger.kernel.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com [46.235.227.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B32BD13DDA3;
	Thu, 23 May 2024 10:14:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.235.227.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716459288; cv=none; b=dme6kzVKMNhHfrqxXncp5+b5am+sTGXUO6BSCQOzVSCxCXjoZpcZiouaJWnWUOgsTgJpHrOpAgmdBpQwrndFhpQYbiOBzQCdiDIMGQuP26BJWK2/12afKnXC1c0NVSjjIImNmDXddyiq5ORfSRrZ4eJ8Nh/O6FDPhPXHXbNK22U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716459288; c=relaxed/simple;
	bh=Y3BoaPFgHcp3e0s6XB11yfnRYltsdW/fEeJj3u9YY7s=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=bKPFTigBkDuMKDOuy+0EkbDQDnYtO5yscVoDBW+u3tw3LEn3Mz0D4Q8I9k0VX1lPCW72MKpI8+LFv0HrFnwVkUSqK/MzxL2SAG0RHaBCmY6Jqikzry1hEh42DeZasq9XB8MUVx9MKzii8l9oYB7BLMn7DpMjZjOuP/eQPujQsWI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=hIRBbJKA; arc=none smtp.client-ip=46.235.227.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1716459284;
	bh=Y3BoaPFgHcp3e0s6XB11yfnRYltsdW/fEeJj3u9YY7s=;
	h=Date:Subject:From:To:Cc:References:In-Reply-To:From;
	b=hIRBbJKAv+89Th/8r3t5WoroS/VXirfeomXc3ufA+imdXW+nEQaSxOJ8vXypVY9Ey
	 crPp7y0zsJfxn0nMkiU7dRio0rM7TJ6ZmTL854wBW4b97PUe8t5jBNBC05S0bjdpj5
	 N6+MBelc0ZETsp7O9Xs8P+XgEwND9WZavnscf8PTjBCGL0bkKL2qdf17fntZAC4E1N
	 9hj5X1rw/E72rLVuhKuq05R/conjrZ5spOFno+NC/rijyavg1sdMgVn5s0cg1tnpo0
	 uwHmr8asNRQKd6CAANDsMkXMpeIfvaULptZJytZYOkR9AEzys58XjMesoLTsG2kJ61
	 yNqQ4QTv3327g==
Received: from [100.95.196.182] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: andrzej.p)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 33FCF37821B3;
	Thu, 23 May 2024 10:14:43 +0000 (UTC)
Message-ID: <537a0969-afdf-4e48-a640-2d8fc665c964@collabora.com>
Date: Thu, 23 May 2024 12:14:42 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6,14/24] media: mediatek: vcodec: Add capture format to
 support one plane memory
From: Andrzej Pietrasiewicz <andrzej.p@collabora.com>
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
 <20240516122102.16379-15-yunfei.dong@mediatek.com>
 <1d4618ac-4316-495d-afdb-5849e4b1e805@collabora.com>
Content-Language: en-US
In-Reply-To: <1d4618ac-4316-495d-afdb-5849e4b1e805@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi,

I'm having second thoughts, please see inline,

W dniu 22.05.2024 o 14:26, Andrzej Pietrasiewicz pisze:
> Hi Yunfei,
> 
> W dniu 16.05.2024 o 14:20, Yunfei Dong pisze:
>> Define one uncompressed capture format V4L2_PIX_FMT_MS21 in order to
>> support one plane memory. The buffer size is luma + chroma, luma is
>> stored at the start and chrome is stored at the end.
>>
>> Signed-off-by: Yunfei Dong <yunfei.dong@mediatek.com>
>> ---
>>   Documentation/userspace-api/media/v4l/pixfmt-reserved.rst | 8 ++++++++
>>   drivers/media/v4l2-core/v4l2-common.c                     | 2 ++
>>   drivers/media/v4l2-core/v4l2-ioctl.c                      | 1 +
>>   include/uapi/linux/videodev2.h                            | 1 +
>>   4 files changed, 12 insertions(+)
>>
>> diff --git a/Documentation/userspace-api/media/v4l/pixfmt-reserved.rst b/Documentation/userspace-api/media/v4l/pixfmt-reserved.rst
>> index 886ba7b08d6b..6ec899649d50 100644
>> --- a/Documentation/userspace-api/media/v4l/pixfmt-reserved.rst
>> +++ b/Documentation/userspace-api/media/v4l/pixfmt-reserved.rst
>> @@ -295,6 +295,14 @@ please make a proposal on the linux-media mailing list.
>>         - Compressed format used by Nuvoton NPCM video driver. This format is
>>           defined in Remote Framebuffer Protocol (RFC 6143, chapter 7.7.4 Hextile
>>           Encoding).
>> +    * .. _V4L2-PIX-FMT-MS21:
>> +
>> +      - ``V4L2_PIX_FMT_MS21``
>> +      - 'MS21'
>> +      - This format has one plane, luma and chroma are stored in a contiguous
> 
> Maybe s/one/single ?
> 
>> +        memory. Luma pixel in 16x32 tiles at the start, chroma pixel in 16x16
> 
> maybe the word "pixel" is reduntant here? What else than pixels could tile sizes mean?
> Any padding between luma and chroma?
> 
>> +        tiles at the end. The image height must be aligned with 32 and the image
>> +        width must be aligned with 16.
> 
> Maybe aligned to?
> 
>>   .. raw:: latex
>>       \normalsize
>> diff --git a/drivers/media/v4l2-core/v4l2-common.c b/drivers/media/v4l2-core/v4l2-common.c
>> index 4165c815faef..5ae54cf48dc7 100644
>> --- a/drivers/media/v4l2-core/v4l2-common.c
>> +++ b/drivers/media/v4l2-core/v4l2-common.c
>> @@ -271,6 +271,8 @@ const struct v4l2_format_info *v4l2_format_info(u32 format)
>>             .block_w = { 16, 8, 0, 0 }, .block_h = { 32, 16, 0, 0 }},
>>           { .format = V4L2_PIX_FMT_MT2110R, .pixel_enc = V4L2_PIXEL_ENC_YUV, .mem_planes = 2, .comp_planes = 2, .bpp = { 5, 10, 0, 0 }, .bpp_div = { 4, 4, 1, 1 }, .hdiv = 2, .vdiv = 2,
>>             .block_w = { 16, 8, 0, 0 }, .block_h = { 32, 16, 0, 0 }},
>> +        { .format = V4L2_PIX_FMT_MS21, pixel_enc = V4L2_PIXEL_ENC_YUV, .mem_planes = 1, .comp_planes = 2, .bpp = { 1, 2, 0, 0 }, .bpp_div = { 1, 1, 1, 1 }, .hdiv = 2, .vdiv = 2,
>> +          .block_w = { 16, 8, 0, 0 }, .block_h = { 32, 16, 0, 0 }},
>>           /* YUV planar formats */
>>           { .format = V4L2_PIX_FMT_NV12,    .pixel_enc = V4L2_PIXEL_ENC_YUV, .mem_planes = 1, .comp_planes = 2, .bpp = { 1, 2, 0, 0 }, .bpp_div = { 1, 1, 1, 1 }, .hdiv = 2, .vdiv = 2 },
>> diff --git a/drivers/media/v4l2-core/v4l2-ioctl.c b/drivers/media/v4l2-core/v4l2-ioctl.c
>> index 4c76d17b4629..3a68f2b9e7a4 100644
>> --- a/drivers/media/v4l2-core/v4l2-ioctl.c
>> +++ b/drivers/media/v4l2-core/v4l2-ioctl.c
>> @@ -1529,6 +1529,7 @@ static void v4l_fill_fmtdesc(struct v4l2_fmtdesc *fmt)
>>           case V4L2_PIX_FMT_MT2110T:    descr = "Mediatek 10bit Tile Mode"; break;
>>           case V4L2_PIX_FMT_MT2110R:    descr = "Mediatek 10bit Raster Mode"; break;
>>           case V4L2_PIX_FMT_HEXTILE:    descr = "Hextile Compressed Format"; break;
>> +        case V4L2_PIX_FMT_MS21:        descr = "MediaTek One Plane Format"; break;
> 
> s/One/Single ?
> 

On the other hand "single" would be [in this case incorrectly] associated with
single-planar API, which would be totally confusing.

Still, the reality you are trying to model is complex: you use
MPLANE, yet there's a single plane in case of secure playback.

Regards,

Andrzej


> Regards,
> 
> Andrzej
> 
>>           default:
>>               if (fmt->description[0])
>>                   return;
>> diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev2.h
>> index 89eb1a3c6555..7aff2f2c8f9c 100644
>> --- a/include/uapi/linux/videodev2.h
>> +++ b/include/uapi/linux/videodev2.h
>> @@ -800,6 +800,7 @@ struct v4l2_pix_format {
>>   #define V4L2_PIX_FMT_MM21     v4l2_fourcc('M', 'M', '2', '1') /* Mediatek 8-bit block mode, two non-contiguous planes */
>>   #define V4L2_PIX_FMT_MT2110T  v4l2_fourcc('M', 'T', '2', 'T') /* Mediatek 10-bit block tile mode */
>>   #define V4L2_PIX_FMT_MT2110R  v4l2_fourcc('M', 'T', '2', 'R') /* Mediatek 10-bit block raster mode */
>> +#define V4L2_PIX_FMT_MS21     v4l2_fourcc('M', 'S', '2', '1') /* MediaTek 8-bit block mode with one plane */
>>   #define V4L2_PIX_FMT_INZI     v4l2_fourcc('I', 'N', 'Z', 'I') /* Intel Planar Greyscale 10-bit and Depth 16-bit */
>>   #define V4L2_PIX_FMT_CNF4     v4l2_fourcc('C', 'N', 'F', '4') /* Intel 4-bit packed depth confidence information */
>>   #define V4L2_PIX_FMT_HI240    v4l2_fourcc('H', 'I', '2', '4') /* BTTV 8-bit dithered RGB */
> 


