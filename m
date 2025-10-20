Return-Path: <linux-media+bounces-44982-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id ACEB4BEF9F1
	for <lists+linux-media@lfdr.de>; Mon, 20 Oct 2025 09:14:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 72A121893D54
	for <lists+linux-media@lfdr.de>; Mon, 20 Oct 2025 07:14:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3E0C92EA165;
	Mon, 20 Oct 2025 07:11:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=benjamin.gaignard@collabora.com header.b="TUsE4oGO"
X-Original-To: linux-media@vger.kernel.org
Received: from sender4-op-o12.zoho.com (sender4-op-o12.zoho.com [136.143.188.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3DD72EA147;
	Mon, 20 Oct 2025 07:11:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760944302; cv=pass; b=tRU2YkzbsRYhayr7zq/2zSrMGSKPDcA+wxJ7g9QUKQS/I3rGucmiuKx8QlzFU9p4GfYsc/bEp53wCCrDw6Fcz/lcyPdDFPUoFEEH2okoiDZt88dnasFmQMnIZGh4cRJn6ba4mevVE0c+rqvTpVllpEk/PA89Ak6/KLxuWI2BrxU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760944302; c=relaxed/simple;
	bh=WVfiMNNWRiHFBrcRGE/MouaFQwHG99Zi3OjT/7dE4wo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=L0XtqIfY77HmDl1Ks5AlMcSjG3L50zSrVcJHpjFN/fxPIiSKhPeKzbSisD1BTk8WLXBpW2B9DGytPKERqEmDNjdj/6cL14kIMHsKi82WF7pubX7hqeT6txjBxeot8ru27tQBViNtwNpdMxbakpdja2jlu96YuZM7e7yNmhgZaHc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=benjamin.gaignard@collabora.com header.b=TUsE4oGO; arc=pass smtp.client-ip=136.143.188.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
ARC-Seal: i=1; a=rsa-sha256; t=1760944292; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=P/yBR+GyLqopb3+umWCbUXR8QIXzC0M/ZiaXrse+lsbn5geSeMLef6KDDXGFVZiP1PLGEQcmuVRnjQCSKbLumXwVFZLRbdUOMwV3KOGqZvIQIRZ1fF9N8C9cFWeYlPOT8DoT3BxI+cZ+1/Y3x7d+Gnw6ivrUVxzbXOktdWcfEaI=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1760944292; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=Grf8Aw8Kke2h/aVOmW63v6SnlnR1jcNw5IBgROmHZrM=; 
	b=nDyPjmJpsVIWsd09YDJNKnu+LGzr9HqdYF+UnWj6U4xy+168Qs3+E3THTl8EZ+DBjr+kzcZzbikA9+P08DQZYXIU12vHxJHw9ZIHzMX+RUkJD/GDf+qcsv/D7b4DGD7IzM8O1FiwqcYU2pl/xgvhwpOWUCcuhX1wyJ4xsTdNkp4=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=benjamin.gaignard@collabora.com;
	dmarc=pass header.from=<benjamin.gaignard@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1760944292;
	s=zohomail; d=collabora.com; i=benjamin.gaignard@collabora.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=Grf8Aw8Kke2h/aVOmW63v6SnlnR1jcNw5IBgROmHZrM=;
	b=TUsE4oGOYYFbymV9VuZ0hE/N4oeNcCPDTC/+rfVAo1g60VwIn9r8oCAjc9/2Lq1y
	BM+nKA9UMoGSFl2AeLqpt0EmAVTzO1Nmy7t1bUD2q+K5z2Pl0NXpMDUOT1nGpG1eY0w
	wuwNfg/hl01OFR78csVwT5te1HMBDIWjcR4vAOho=
Received: by mx.zohomail.com with SMTPS id 1760944290591597.1904263054131;
	Mon, 20 Oct 2025 00:11:30 -0700 (PDT)
Message-ID: <36cfec0a-3717-4b0e-adc0-6887e6b58f44@collabora.com>
Date: Mon, 20 Oct 2025 09:11:25 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] media: videobuf2: forbid create_bufs/remove_bufs when
 legacy fileio is active
To: Marek Szyprowski <m.szyprowski@samsung.com>, linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org
Cc: Tomasz Figa <tfiga@chromium.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Guennadi Liakhovetski <g.liakhovetski@gmx.de>,
 Hans Verkuil <hverkuil@kernel.org>, stable@vger.kernel.org
References: <CGME20251016111208eucas1p24cd8cc1e952a8cdf73fbadea704b499d@eucas1p2.samsung.com>
 <20251016111154.993949-1-m.szyprowski@samsung.com>
Content-Language: en-US
From: Benjamin Gaignard <benjamin.gaignard@collabora.com>
In-Reply-To: <20251016111154.993949-1-m.szyprowski@samsung.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


Le 16/10/2025 à 13:11, Marek Szyprowski a écrit :
> create_bufs and remove_bufs ioctl calls manipulate queue internal buffer
> list, potentially overwriting some pointers used by the legacy fileio
> access mode. Simply forbid those calls when fileio is active to protect
> internal queue state between subsequent read/write calls.

Hi Marek,

I may be wrong but using fileio API and create/remove API at the same time
sound incorrect from application point of view, right ? If that not the
case maybe we should also add a test in v4l2-compliance.

Regards,
Benjamin

>
> CC: stable@vger.kernel.org
> Fixes: 2d86401c2cbf ("[media] V4L: vb2: add support for buffers of different sizes on a single queue")
> Fixes: a3293a85381e ("media: v4l2: Add REMOVE_BUFS ioctl")
> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
> ---
>   drivers/media/common/videobuf2/videobuf2-v4l2.c | 10 ++++++++++
>   1 file changed, 10 insertions(+)
>
> diff --git a/drivers/media/common/videobuf2/videobuf2-v4l2.c b/drivers/media/common/videobuf2/videobuf2-v4l2.c
> index d911021c1bb0..f4104d5971dd 100644
> --- a/drivers/media/common/videobuf2/videobuf2-v4l2.c
> +++ b/drivers/media/common/videobuf2/videobuf2-v4l2.c
> @@ -751,6 +751,11 @@ int vb2_create_bufs(struct vb2_queue *q, struct v4l2_create_buffers *create)
>   	int ret = vb2_verify_memory_type(q, create->memory, f->type);
>   	unsigned i;
>   
> +	if (vb2_fileio_is_active(q)) {
> +		dprintk(q, 1, "file io in progress\n");
> +		return -EBUSY;
> +	}
> +
>   	create->index = vb2_get_num_buffers(q);
>   	vb2_set_flags_and_caps(q, create->memory, &create->flags,
>   			       &create->capabilities, &create->max_num_buffers);
> @@ -1010,6 +1015,11 @@ int vb2_ioctl_remove_bufs(struct file *file, void *priv,
>   	if (vb2_queue_is_busy(vdev->queue, file))
>   		return -EBUSY;
>   
> +	if (vb2_fileio_is_active(vdev->queue)) {
> +		dprintk(vdev->queue, 1, "file io in progress\n");
> +		return -EBUSY;
> +	}
> +
>   	return vb2_core_remove_bufs(vdev->queue, d->index, d->count);
>   }
>   EXPORT_SYMBOL_GPL(vb2_ioctl_remove_bufs);

