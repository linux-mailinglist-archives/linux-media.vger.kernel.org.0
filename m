Return-Path: <linux-media+bounces-27557-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 63BE9A4F84F
	for <lists+linux-media@lfdr.de>; Wed,  5 Mar 2025 08:53:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7D93C16B44D
	for <lists+linux-media@lfdr.de>; Wed,  5 Mar 2025 07:53:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7B6FF1F5850;
	Wed,  5 Mar 2025 07:53:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CdQXpNRi"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 182451DED5F;
	Wed,  5 Mar 2025 07:53:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741161225; cv=none; b=p/JFsVY8VyQxV1g5O+T4zvYaRLbaqfqnkcyBdFTYBM3rLP/FPEaktwyI2mmt2715rLx+eawyjcAdOO37Q6/wFLnqeU+EVUrmKjVY4i0Kx1CLqWcU+4AKCTr2SsyiyagKpmJ/DlVbIStVxI9V8GJRksdImR8tJu3ZpxtuqibODJ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741161225; c=relaxed/simple;
	bh=RkEPUdpXCIQ3dj7yOMrlnTANphhK5Xv+8N4c/wD3VrY=;
	h=References:From:To:Cc:Subject:Date:In-reply-to:Message-ID:
	 MIME-Version:Content-Type; b=Fh25bPdBiG1hkFji40xpbexMhTI+9BCaVUVbKLBBzznk+1IZ9CJEJYD5I5zcu6m/5vsrTbjKFXIenUmehhkzvdnDxMJpXWe2efAAiTGm8tPwj4SVpGe1j9dXR1hA2vrmEdGJS8LTTr33rKU4gB4hf9+RYOllSNSwgD+AnSYc2TY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CdQXpNRi; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-5494cb8c2e7so5617894e87.0;
        Tue, 04 Mar 2025 23:53:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741161221; x=1741766021; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
         :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HiTpS6soFncX3ap+JUlkCx1cOPiDwgUNOLW0huS1jJo=;
        b=CdQXpNRiqZvfTs57gRAIg578FCEikb1pnfMcsDec6oQUNEWlGlL/ElWWxXpFII4bG0
         GbM8jWFOVDkPvkfY7d7CZy8V6+P9DRA6jQxnQeR72WMGIdQsS7Hd1Tke/S52Swk6NQ8A
         B4y1p/yP4N4jRkMBGAsA/qsJWCKkG6hu0NPS9VbA57squ7SioAPk9RPclDp6gglrroZZ
         4LgS7Y0kIdxsdKyI1QGRKU2k2dKi4PRqqzeTUO2OTfl3+UTxjjcK000wLkMT06F0HgD7
         1ZkHbUEhqTs8tC0Oi/6t6AYFvrt1U2xAXvp227m7lQBOP/c2CW2AUJ7i6+Wyuu/djr9l
         ouWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741161221; x=1741766021;
        h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
         :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=HiTpS6soFncX3ap+JUlkCx1cOPiDwgUNOLW0huS1jJo=;
        b=FUmvpJExzhaSCkZV0TfNFRY6LLd7gq9B1EAXUyu2w3avEPcjcegdMBH4GluJGcgpXW
         T/w/+Snir69MqGUcjmNKDZpQn7yF8oOP9jmX7s0asc1uUxYAc8BDKZmlR97+sqXSC34E
         YnBrckY9JtRLDRyv4mERgueIpXUd0MGed9CUKJjF+PZNC1HcPmYaw3zCxxE4JtC86DRW
         eVQpmAL11mvrVKOWa0+Baf1ASwnmRr4lVfc3YZ8g9HsI5ZAUB+mQN8dZqghhhYwhy6pn
         bUuB9yGsf1nGuAuG9NO5akwtMT0kBUgwo4wS50NiZa6rVDE065wSC8hMsTxxSA0m7Tx5
         o0PQ==
X-Forwarded-Encrypted: i=1; AJvYcCU4NOrbHASM75eWij0xwgL1zm7M/Af6YKtl7U2uS0M8nZigNPAvYPeSChKYd/q76GeDojGRs3SNN65y8xs=@vger.kernel.org, AJvYcCUNdzYpLqbH0UuCzoO0qizDZWoN6ByITZAMPzLvIU0lEAIllK0xoQRqjW0qywzgl2ILhkHy81Al@vger.kernel.org, AJvYcCVxpInp7vf//7qiH5hswbuis+x4QopRWsGyIlwC2xBLtpAchhN/R6FplNHvtVBSmboZ0ikPi5rDJgTSFzQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YxujdT7dymKPHFFdWsUbcaq7UmWTdhImn4Y9KGbdChTe0poEYR9
	ao0otgKkcQn4Yz+V49wxqpuFtYlwYsIMQ1DTI5a2GCtDO9TOORCKT6wGgUHd
X-Gm-Gg: ASbGnct6CRmVLF7O3qM2Sok6rV5eVGEX1fBzBtdpaC4SFPXqhS5eR61NQSfe0Bu3u7K
	AByz+hEOp+l+LaPuxRZRkZNfh/ox9zjnCcMoN2UnLjEUfP/NcKhA4T77ImnHrGRRJrs+SBDBlmL
	DkBeouvAJ+G8bKTZoE0OJkcjovu69KRvG9KBVsw4vLh8ZC5hODRhhZSOTb0rV9P4SHjw7fyjwR0
	9BpDy9B/+PQ98htm2YwUq0stLfjY4CmikdeJkAFmKehcYCXh2deY/Tnr0q2BrOK1eoCHsRl0on0
	dzoF7h16HJLv32PF4JR4I1178QQk1uzSnYDrJSqWkFOyu9X5wPlXm5So2fKdJ7E1YrJD2jxwi6R
	EsTZotnEqoPTfMwTXUGaKt5EbN9LxcoFb
X-Google-Smtp-Source: AGHT+IGoSfXFo2jQfX6zwJukiQLZftqM9VYE26ir2v2Z98LPwA2YNZbRZg8LePVsUKETExIau4wjew==
X-Received: by 2002:a05:6512:3190:b0:549:7c64:3bc0 with SMTP id 2adb3069b0e04-5497d35028emr565104e87.29.1741161221096;
        Tue, 04 Mar 2025 23:53:41 -0800 (PST)
Received: from razdolb (static.248.157.217.95.clients.your-server.de. [95.217.157.248])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5495b3f4ebdsm1155605e87.102.2025.03.04.23.53.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Mar 2025 23:53:40 -0800 (PST)
References: <20250303-b4-rkisp-noncoherent-v4-0-e32e843fb6ef@gmail.com>
 <20250303-b4-rkisp-noncoherent-v4-1-e32e843fb6ef@gmail.com>
 <8b3dac7baed1de9542452547454c53188c384391.camel@ndufresne.ca>
User-agent: mu4e 1.10.9; emacs 30.1
From: Mikhail Rudenko <mike.rudenko@gmail.com>
To: Nicolas Dufresne <nicolas@ndufresne.ca>
Cc: Dafna Hirschfeld <dafna@fastmail.com>, Laurent Pinchart
 <laurent.pinchart@ideasonboard.com>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, Heiko Stuebner <heiko@sntech.de>, Tomasz Figa
 <tfiga@chromium.org>, Marek Szyprowski <m.szyprowski@samsung.com>, Hans
 Verkuil <hverkuil@xs4all.nl>, Sergey  Senozhatsky
 <senozhatsky@chromium.org>, linux-media@vger.kernel.org,
 linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, Mauro  Carvalho Chehab
 <mchehab+huawei@kernel.org>, stable@vger.kernel.org
Subject: Re: [PATCH v4 1/2] media: videobuf2: Fix dmabuf cache sync/flush in
 dma-contig
Date: Wed, 05 Mar 2025 10:40:31 +0300
In-reply-to: <8b3dac7baed1de9542452547454c53188c384391.camel@ndufresne.ca>
Message-ID: <87y0xj29rz.fsf@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hi Nicolas,

On 2025-03-03 at 10:24 -05, Nicolas Dufresne <nicolas@ndufresne.ca> wrote:

> Hi Mikhail,
>
> Le lundi 03 mars 2025 =C3=A0 14:40 +0300, Mikhail Rudenko a =C3=A9crit=C2=
=A0:
>> When support for V4L2_FLAG_MEMORY_NON_CONSISTENT was removed in
>> commit 129134e5415d ("media: media/v4l2: remove
>> V4L2_FLAG_MEMORY_NON_CONSISTENT flag"),
>> vb2_dc_dmabuf_ops_{begin,end}_cpu_access() functions were made
>> no-ops. Later, when support for V4L2_MEMORY_FLAG_NON_COHERENT was
>> introduced in commit c0acf9cfeee0 ("media: videobuf2: handle
>> V4L2_MEMORY_FLAG_NON_COHERENT flag"), the above functions remained
>> no-ops, making cache maintenance for non-coherent dmabufs allocated
>> by
>> dma-contig impossible.
>>
>> Fix this by reintroducing dma_sync_sgtable_for_{cpu,device} and
>> {flush,invalidate}_kernel_vmap_range calls to
>> vb2_dc_dmabuf_ops_{begin,end}_cpu_access() functions for non-coherent
>> buffers.
>>
>> Fixes: c0acf9cfeee0 ("media: videobuf2: handle
>> V4L2_MEMORY_FLAG_NON_COHERENT flag")
>> Cc: stable@vger.kernel.org
>> Signed-off-by: Mikhail Rudenko <mike.rudenko@gmail.com>
>> ---
>> =C2=A0.../media/common/videobuf2/videobuf2-dma-contig.c=C2=A0 | 22
>> ++++++++++++++++++++++
>> =C2=A01 file changed, 22 insertions(+)
>>
>> diff --git a/drivers/media/common/videobuf2/videobuf2-dma-contig.c
>> b/drivers/media/common/videobuf2/videobuf2-dma-contig.c
>> index
>> a13ec569c82f6da2d977222b94af32e74c6c6c82..d41095fe5bd21faf815d6b035d7
>> bc888a84a95d5 100644
>> --- a/drivers/media/common/videobuf2/videobuf2-dma-contig.c
>> +++ b/drivers/media/common/videobuf2/videobuf2-dma-contig.c
>> @@ -427,6 +427,17 @@ static int
>> =C2=A0vb2_dc_dmabuf_ops_begin_cpu_access(struct dma_buf *dbuf,
>> =C2=A0				=C2=A0=C2=A0 enum dma_data_direction
>> direction)
>> =C2=A0{
>> +	struct vb2_dc_buf *buf =3D dbuf->priv;
>> +	struct sg_table *sgt =3D buf->dma_sgt;
>> +
>> +	if (!buf->non_coherent_mem)
>> +		return 0;
>> +
>> +	if (buf->vaddr)
>> +		invalidate_kernel_vmap_range(buf->vaddr, buf->size);
>
> What would make me a lot more confortable with this change is if you
> enable kernel mappings for one test. This will ensure you cover the
> call to "invalidate" in your testing. I'd like to know about the
> performance impact. With this implementation it should be identical to
> the VB2 one.

I'll enable kernel mappings and rerun my tests later this week.

> What I was trying to say in previous comments, is that my impression is
> that we can skip this for CPU read access, since we don't guaranty
> concurrent access anyway. Both address space can keep their cache in
> that case. Though, I see RKISP does not use kernel mapping plus I'm not
> reporting a bug, but checking if we should leave a comment for possible
> users of kernel mapping in the future ?

I trust Tomasz here, I'd wait for his comment on v4.

>> +
>> +	dma_sync_sgtable_for_cpu(buf->dev, sgt, direction);
>> +
>> =C2=A0	return 0;
>> =C2=A0}
>>
>> @@ -434,6 +445,17 @@ static int
>> =C2=A0vb2_dc_dmabuf_ops_end_cpu_access(struct dma_buf *dbuf,
>> =C2=A0				 enum dma_data_direction direction)
>> =C2=A0{
>> +	struct vb2_dc_buf *buf =3D dbuf->priv;
>> +	struct sg_table *sgt =3D buf->dma_sgt;
>> +
>> +	if (!buf->non_coherent_mem)
>> +		return 0;
>> +
>> +	if (buf->vaddr)
>> +		flush_kernel_vmap_range(buf->vaddr, buf->size);
>> +
>> +	dma_sync_sgtable_for_device(buf->dev, sgt, direction);
>> +
>> =C2=A0	return 0;
>> =C2=A0}
>>
>>


--
Best regards,
Mikhail Rudenko

