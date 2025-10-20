Return-Path: <linux-media+bounces-44986-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id C5B1DBEFB0F
	for <lists+linux-media@lfdr.de>; Mon, 20 Oct 2025 09:36:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 7838C4ED1CB
	for <lists+linux-media@lfdr.de>; Mon, 20 Oct 2025 07:36:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0AC592DECD3;
	Mon, 20 Oct 2025 07:36:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="KhfaRwUI"
X-Original-To: linux-media@vger.kernel.org
Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com [210.118.77.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 607DA2BFC70
	for <linux-media@vger.kernel.org>; Mon, 20 Oct 2025 07:36:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.118.77.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760945802; cv=none; b=tdwqhW7Sot2glOZGwhT5eeIKGkFLyT1sNsR4SeOC0eZxsZXitQ7m45dInlxwsOUJ6nDu2R4B9cmItZjJNzJRr8AypmUUsBLC4m8xEv/89piQS+6r02Q1auc6HJVlfCbxLHUnvlsbmYk2duWpyO1M5Ilxu7WZ1tg01MgKSZAWGmQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760945802; c=relaxed/simple;
	bh=x0j7qAAZyh1TUxJ815tp8gjcfVHO9OYxjegCdiMyRIc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:From:In-Reply-To:
	 Content-Type:References; b=faqrQOpiM+fc1G6DaopUPcoR0Dx717Ytpz9zdzvobwlyswQE532hVe+fD5erKcfxT8+mLT7S73MS7eh8fyEXjBTEtfvOpnfEBFYcGFXLX3+nkoYlrwpqnST5P5DZdYJFU+dkSvqE8581BbueeT/5+w7cO9381MuD1F9q8qlkPNo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=KhfaRwUI; arc=none smtp.client-ip=210.118.77.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
	by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20251020073638euoutp02bd9636af72fd2636da23fe04bc68e175~wIt_5FGIE1119711197euoutp02W
	for <linux-media@vger.kernel.org>; Mon, 20 Oct 2025 07:36:38 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20251020073638euoutp02bd9636af72fd2636da23fe04bc68e175~wIt_5FGIE1119711197euoutp02W
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1760945798;
	bh=GoL5kOGHdEjPxsTc7d/4NSIxvA8/Iprxh8LI8sTxaYw=;
	h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
	b=KhfaRwUIsmFMl1LfdDBzzDv1NA9rpA8sOshWTXV29bKkobXHmauAhK2oyZr3351Tf
	 lY4ENMQTd6rkXyeAnjtVSeELG7rQeuSMIFjJJzHWpfAFbMF6Rgjrqfw+NvD2G8ZXcS
	 JjRzf7p1NwXNMpYPyOqjfL8HjvlYFDKy3PNDTPdw=
Received: from eusmtip1.samsung.com (unknown [203.254.199.221]) by
	eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
	20251020073638eucas1p25a7cedcf3cbbb94479447587e4e717ca~wIt_hCm552197321973eucas1p2Y;
	Mon, 20 Oct 2025 07:36:38 +0000 (GMT)
Received: from [106.210.134.192] (unknown [106.210.134.192]) by
	eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20251020073637eusmtip10f52564bb702e0dc07850c778d7ac13e~wIt9sSHtr0650706507eusmtip1M;
	Mon, 20 Oct 2025 07:36:37 +0000 (GMT)
Message-ID: <8f4131c1-5a3e-4e67-af86-009005b39540@samsung.com>
Date: Mon, 20 Oct 2025 09:36:36 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Betterbird (Windows)
Subject: Re: [PATCH] media: videobuf2: forbid create_bufs/remove_bufs when
 legacy fileio is active
To: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Tomasz Figa <tfiga@chromium.org>, Mauro Carvalho Chehab
	<mchehab@kernel.org>, Guennadi Liakhovetski <g.liakhovetski@gmx.de>,
	Benjamin Gaignard <benjamin.gaignard@collabora.com>, Hans Verkuil
	<hverkuil@kernel.org>, stable@vger.kernel.org
Content-Language: en-US
From: Marek Szyprowski <m.szyprowski@samsung.com>
In-Reply-To: <20251016111154.993949-1-m.szyprowski@samsung.com>
Content-Transfer-Encoding: 7bit
X-CMS-MailID: 20251020073638eucas1p25a7cedcf3cbbb94479447587e4e717ca
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20251016111208eucas1p24cd8cc1e952a8cdf73fbadea704b499d
X-EPHeader: CA
X-CMS-RootMailID: 20251016111208eucas1p24cd8cc1e952a8cdf73fbadea704b499d
References: <CGME20251016111208eucas1p24cd8cc1e952a8cdf73fbadea704b499d@eucas1p2.samsung.com>
	<20251016111154.993949-1-m.szyprowski@samsung.com>

On 16.10.2025 13:11, Marek Szyprowski wrote:
> create_bufs and remove_bufs ioctl calls manipulate queue internal buffer
> list, potentially overwriting some pointers used by the legacy fileio
> access mode. Simply forbid those calls when fileio is active to protect
> internal queue state between subsequent read/write calls.
>
> CC: stable@vger.kernel.org
> Fixes: 2d86401c2cbf ("[media] V4L: vb2: add support for buffers of different sizes on a single queue")
> Fixes: a3293a85381e ("media: v4l2: Add REMOVE_BUFS ioctl")
> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>

Just for completeness, as I forgot to add in the initial patch:

Reported-by: Shuangpeng Bai<SJB7183@psu.edu>


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

Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland


