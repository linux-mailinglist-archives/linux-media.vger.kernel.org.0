Return-Path: <linux-media+bounces-45736-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 00AD9C1340C
	for <lists+linux-media@lfdr.de>; Tue, 28 Oct 2025 08:10:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 8A8964EBC41
	for <lists+linux-media@lfdr.de>; Tue, 28 Oct 2025 07:10:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7D6032C159D;
	Tue, 28 Oct 2025 07:10:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="P8xg+Xi0"
X-Original-To: linux-media@vger.kernel.org
Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com [210.118.77.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA6CC2C0293
	for <linux-media@vger.kernel.org>; Tue, 28 Oct 2025 07:10:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.118.77.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761635406; cv=none; b=L6eanO8rBBpRa+TaITbt5jdQmCcOySs53oM+VeXyrvzgiYNdN6WXRCrH7PjbVJLRIIJdYWq08dCwp00TYhmXIzfGvbk0LLl/7RAgtZid1xfaX6rgan1VddjND1wnfLKOS+QGzzrI/J5adALWVD2eSOcNTCLwSyD7SmDoUsoBnKA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761635406; c=relaxed/simple;
	bh=pvVW4kKWOWWefij8Mw36nkpt3Eh7H4QBlpyCWLZrbZ0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:From:In-Reply-To:
	 Content-Type:References; b=HfMLveJC46Ao2OJOU2vGCKjNLEFr5ktwjJJLjwm5lMKrUpI7VgZmq3FjJkO3ow0KQSssdqPpItxtf//sfEAhwjg9488vMZXybMb9A9ILMKnHTkuQ+CnjBTwzwG/+aBhSDJUKz9a3uKX8s86JIm0eTeMsgN8BEogPgtdczVUV7eI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=P8xg+Xi0; arc=none smtp.client-ip=210.118.77.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
	by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20251028071002euoutp029a3811033e414e3165a88b108abf7373~ylhC5-1372640026400euoutp02O
	for <linux-media@vger.kernel.org>; Tue, 28 Oct 2025 07:10:02 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20251028071002euoutp029a3811033e414e3165a88b108abf7373~ylhC5-1372640026400euoutp02O
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1761635402;
	bh=9azUV6qrislQ96/bD+k4ki00mSrQhWDXIEpbgtd0QTo=;
	h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
	b=P8xg+Xi0WutXVQGfmmHknFX2lnWgXE1RHdFp7+2bW9mvEiDbRQ6Hsz8vu8uyjXhbf
	 KXoAd2Yy8dvBRrL8bHGpJ59Sv1uwZmmyxx3w/7wjcWqvuTIldGDtBSy/h+AHsTdk6h
	 gnTXgeVBkB+UzkRPbnTdcXusMHinhkq41bQ2zESg=
Received: from eusmtip1.samsung.com (unknown [203.254.199.221]) by
	eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
	20251028071002eucas1p114afef26983bf8ca23374624a804dcbd~ylhCfczNU1129611296eucas1p1E;
	Tue, 28 Oct 2025 07:10:02 +0000 (GMT)
Received: from [106.210.134.192] (unknown [106.210.134.192]) by
	eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20251028071001eusmtip1d3c9ba5b42870aa2c03d3176a0f93b2c~ylhCD6rRh1876418764eusmtip1B;
	Tue, 28 Oct 2025 07:10:01 +0000 (GMT)
Message-ID: <aaac0d2b-ec3f-4469-9334-a7216b85b33f@samsung.com>
Date: Tue, 28 Oct 2025 08:10:01 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Betterbird (Windows)
Subject: Re: [PATCH] media: videobuf2: Fix device reference leak in
 vb2_dc_alloc error path
To: Haotian Zhang <vulab@iscas.ac.cn>, tfiga@chromium.org, Mauro Carvalho
	Chehab <mchehab@kernel.org>, Hans Verkuil <hverkuil@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Language: en-US
From: Marek Szyprowski <m.szyprowski@samsung.com>
In-Reply-To: <20251028064443.655-1-vulab@iscas.ac.cn>
Content-Transfer-Encoding: 7bit
X-CMS-MailID: 20251028071002eucas1p114afef26983bf8ca23374624a804dcbd
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20251028064507eucas1p2895db44758261941ca898cb4edd2c7b3
X-EPHeader: CA
X-CMS-RootMailID: 20251028064507eucas1p2895db44758261941ca898cb4edd2c7b3
References: <CGME20251028064507eucas1p2895db44758261941ca898cb4edd2c7b3@eucas1p2.samsung.com>
	<20251028064443.655-1-vulab@iscas.ac.cn>

On 28.10.2025 07:44, Haotian Zhang wrote:
> In vb2_dc_alloc(), get_device() is called to increment the device
> reference count. However, if subsequent DMA allocation fails
> (vb2_dc_alloc_coherent or vb2_dc_alloc_non_coherent returns error),
> the function returns without calling put_device(), causing a device
> reference leak.
>
> Add put_device() call in the error path before kfree() to properly
> release the device reference acquired earlier.
>
> Fixes: de27891f675e ("media: videobuf2: handle non-contiguous DMA allocations")
> Signed-off-by: Haotian Zhang <vulab@iscas.ac.cn>
Reviewed-by: Marek Szyprowski <m.szyprowski@samsung.com>
> ---
>   drivers/media/common/videobuf2/videobuf2-dma-contig.c | 1 +
>   1 file changed, 1 insertion(+)
>
> diff --git a/drivers/media/common/videobuf2/videobuf2-dma-contig.c b/drivers/media/common/videobuf2/videobuf2-dma-contig.c
> index a13ec569c82f..7123c5fae92c 100644
> --- a/drivers/media/common/videobuf2/videobuf2-dma-contig.c
> +++ b/drivers/media/common/videobuf2/videobuf2-dma-contig.c
> @@ -258,6 +258,7 @@ static void *vb2_dc_alloc(struct vb2_buffer *vb,
>   
>   	if (ret) {
>   		dev_err(dev, "dma alloc of size %lu failed\n", size);
> +		put_device(buf->dev);
>   		kfree(buf);
>   		return ERR_PTR(-ENOMEM);
>   	}

Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland


