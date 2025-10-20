Return-Path: <linux-media+bounces-45052-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 79D28BF24AB
	for <lists+linux-media@lfdr.de>; Mon, 20 Oct 2025 18:04:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id F314E18A6EE6
	for <lists+linux-media@lfdr.de>; Mon, 20 Oct 2025 16:04:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D119E283C87;
	Mon, 20 Oct 2025 16:03:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=benjamin.gaignard@collabora.com header.b="PgN5d+Wz"
X-Original-To: linux-media@vger.kernel.org
Received: from sender4-op-o12.zoho.com (sender4-op-o12.zoho.com [136.143.188.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 941D626B2B0;
	Mon, 20 Oct 2025 16:03:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760976227; cv=pass; b=UdvCA7TBT2Dnzv/eh7fvKabHSbnmy8R1LqP6hMd/LfbDYaq80YwdEfehV5ky/cWGC5ltjh+/CKq6eiSsP4nqw5dVcCDFRStfiXSD5I61qEVjKsdxE9CG756hCk1at2xmat47Z4oGbrKiZ5NZfnW0eow6l7JFJMm5HEYFVGPQLMw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760976227; c=relaxed/simple;
	bh=ro82tuJO2Pfqb531Qikn6skLjZyls+TNek52L3zOQfQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=umqrBsDXI00Lcnat6e8rKyBn99mDXfEyDBdtMMrt4GHU+R9EtCOKIaq9egNmf+Mm5MHPK8IIGipMYW4q6cLA/ExgjEBG0n0tl6Xr7dwIpbLAnmYCLJSAorva3RTGm6fWVUOy6BREjpGzXxU6UeRPq/oA5LxkW/GvVy5j+f4unac=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=benjamin.gaignard@collabora.com header.b=PgN5d+Wz; arc=pass smtp.client-ip=136.143.188.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
ARC-Seal: i=1; a=rsa-sha256; t=1760976215; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=RFrW5ZNk272kd1WcOV58uBEKs8lUI+Z+Xh/DiYF0TK4hquqDBxd+oBpNRcJTFSPULjYVgzo8YCCSEne++R34ba2SIT6GiY4wQe2ppOWxYBFscOVB/9wm3xuUc7z7dOzYo1w6dLPryRQ+GBihw8BeGF9JeMi773nkw7gmSh0cXyU=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1760976215; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=zNUjUWoucb2PzoYo+4bAqMEYEMS3kWl+sgHUY98jqEE=; 
	b=HepY1Bt83ItRKR0DkMZ2UzMWNafGtXQmwRV6yfHfE1WugzIoMPB3XYW9Teq5wOFrzbPiM4gfFG3eukgFU2nkt9xQYRjHGagZAdda0eTlscVh1ZgVpnAjr72ilG3+ZUvgT1p9WKK8grPIJTSTc1IqEqD0XpxGCq+HsLnDkgABNYY=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=benjamin.gaignard@collabora.com;
	dmarc=pass header.from=<benjamin.gaignard@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1760976215;
	s=zohomail; d=collabora.com; i=benjamin.gaignard@collabora.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=zNUjUWoucb2PzoYo+4bAqMEYEMS3kWl+sgHUY98jqEE=;
	b=PgN5d+WzjwI6HJ1gckTIeZ0AefZRbGjqO1JqiQLJD0ovbmXtxVl9fyPA8ykSDNdX
	IiQ+e72nf9L/cqzaH7kpEg8rI1Lb4cq+8E6mK2BeYeFVTlFF/Qbu72kAkCK0LbkwjuK
	KaIXpjVVAqjZIqg03OETFYanJWYEFXiCsIAg7+zY=
Received: by mx.zohomail.com with SMTPS id 1760976213261263.4457427334356;
	Mon, 20 Oct 2025 09:03:33 -0700 (PDT)
Message-ID: <d71a32f1-dbce-42e3-88f5-7c0628e05528@collabora.com>
Date: Mon, 20 Oct 2025 18:03:29 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] media: videobuf2: forbid remove_bufs when legacy
 fileio is active
To: Marek Szyprowski <m.szyprowski@samsung.com>, linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org
Cc: Tomasz Figa <tfiga@chromium.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Guennadi Liakhovetski <g.liakhovetski@gmx.de>,
 Hans Verkuil <hverkuil@kernel.org>, stable@vger.kernel.org,
 Shuangpeng Bai <SJB7183@psu.edu>
References: <CGME20251020160135eucas1p29eb8517e240f188f102e77713f85e29d@eucas1p2.samsung.com>
 <20251020160121.1985354-1-m.szyprowski@samsung.com>
Content-Language: en-US
From: Benjamin Gaignard <benjamin.gaignard@collabora.com>
In-Reply-To: <20251020160121.1985354-1-m.szyprowski@samsung.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


Le 20/10/2025 à 18:01, Marek Szyprowski a écrit :
> vb2_ioctl_remove_bufs() call manipulates queue internal buffer list,
> potentially overwriting some pointers used by the legacy fileio access
> mode. Add a vb2_verify_memory_type() check symmetrical to
> vb2_ioctl_create_bufs() to forbid that ioctl when fileio is active to
> protect internal queue state between subsequent read/write calls.
>
> CC: stable@vger.kernel.org
> Fixes: a3293a85381e ("media: v4l2: Add REMOVE_BUFS ioctl")
> Reported-by: Shuangpeng Bai<SJB7183@psu.edu>
> Suggested-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>

Thanks for the patch.

Reviewed-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>

> ---
> v2:
> - dropped a change to vb2_ioctl_create_bufs(), as it is already handled
>    by the vb2_verify_memory_type() call
> - replaced queue->type check in vb2_ioctl_remove_bufs() by a call to
>    vb2_verify_memory_type() which covers all cases
>
> v1: https://lore.kernel.org/all/20251016111154.993949-1-m.szyprowski@samsung.com/
> ---
>   drivers/media/common/videobuf2/videobuf2-v4l2.c | 6 ++++--
>   1 file changed, 4 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/media/common/videobuf2/videobuf2-v4l2.c b/drivers/media/common/videobuf2/videobuf2-v4l2.c
> index d911021c1bb0..0de7490292fe 100644
> --- a/drivers/media/common/videobuf2/videobuf2-v4l2.c
> +++ b/drivers/media/common/videobuf2/videobuf2-v4l2.c
> @@ -1000,9 +1000,11 @@ int vb2_ioctl_remove_bufs(struct file *file, void *priv,
>   			  struct v4l2_remove_buffers *d)
>   {
>   	struct video_device *vdev = video_devdata(file);
> +	int res;
>   
> -	if (vdev->queue->type != d->type)
> -		return -EINVAL;
> +	res = vb2_verify_memory_type(vdev->queue, vdev->queue->memory, d->type);
> +	if (res)
> +		return res;
>   
>   	if (d->count == 0)
>   		return 0;

