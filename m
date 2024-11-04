Return-Path: <linux-media+bounces-20813-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F7249BBC2B
	for <lists+linux-media@lfdr.de>; Mon,  4 Nov 2024 18:40:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9FB2F1C20D06
	for <lists+linux-media@lfdr.de>; Mon,  4 Nov 2024 17:40:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 22E451C57A5;
	Mon,  4 Nov 2024 17:40:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="pHSDTYmd"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 816F81419A9
	for <linux-media@vger.kernel.org>; Mon,  4 Nov 2024 17:40:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730742023; cv=none; b=Wx/XEJGk1eC/vAJt/3afOU6zpRTtJhZY71AT+bTzoibo3ytxLfDZ0iMKqv/JpNBN5JVlWsgUMQBVY1h6NyTs1d+ZM48XABn1q6HcuVB04KGr9bXkWXSxC5t9ywDAA69ipZh5G/oEYLIcPhrNTMHWjK9FoWwQJ2LTQNeRqKy4raY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730742023; c=relaxed/simple;
	bh=tWK43UT0rLVGK8N5JwoVQQ8FvXmhIdwdzmHt370kMoc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=uNi8Jo4N4Ukfx9PSq5wtaQFVpuMGfb0gsv2ovFtZP0dsSNk/ZWGoLg1ApqKDwmqK+gwxOvXdg9KePzbtsu2iknaD4+Uabv0MgJzW/JaI7A8+W8OiY2xg05wsx5WkCKq2By0PffGb65AphLcWRIbFexcKNitfY6x5yDNe4QQywCM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=pHSDTYmd; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-a9a3dc089d8so752988466b.3
        for <linux-media@vger.kernel.org>; Mon, 04 Nov 2024 09:40:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1730742020; x=1731346820; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5+UGF1SJ7N6ATGLoz+2LNnReJnVLPP7cyWkTa6W9KvM=;
        b=pHSDTYmd0U6O3MXpShWr95FdAVuTuE3/PrhQrwmjKn+7USGrUzs2u1C3wZRhHL5ttl
         b10MSB8qker8T6wPgvCnCqcVUQ21xArzpwGt9D1hFFtgOALlXlJeS+Ba4ONr6wGPC/mv
         j41+jYYBJEezc6KKtpmg4bjdHQ+oKqVsrapkNDfje5++puuYje7Ccbm6k2oU0AeGLpfA
         +YTPBjcYWIQ8zyePjZ7peNfIbqVCG0rDOPVuXpv9sPWQ89Znr5D8/L4llJvDHvA1s2IH
         UVH5CiSDa0Zh9fs6zskDACRlsfC/e7fiRH8CAu+zXkfv8XE9ZanWzNgv3EPdLC0kqw30
         2vlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730742020; x=1731346820;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5+UGF1SJ7N6ATGLoz+2LNnReJnVLPP7cyWkTa6W9KvM=;
        b=kvhxa4UpIoKrPpYEpwhDUW8ptqzftfkGy+Mx6Sl0rXhq/EjvGeLZ/Sv5kNOrFtBcYy
         4OXQP/+U9CbdLx6MgqdsyomDw0ADO9fusADw8UuTDToRHBL79cQpFRTwTuoZ9zdW8elj
         p4YdAN1nL+yGBHKHKBH14uVQmmm/4JoIWIOz0+V4pfPFxcY+rkKT1VUctf44pGPTjdms
         /6YFo+rOC4fgfx98KoKRrVgFf8ogaBPJvQA+I0t2zFUXXQGhqoz10zh+12a/vBgXlxim
         uBCV9Wk4TI0qZmbqsCJWOM4k7TEwy0I/WowDGc814woVBGr7kgZysETzFxydQUuawhjH
         OvZg==
X-Gm-Message-State: AOJu0YxrO4U/ol2AU9t0UQyZQZTVvXXh1lyu0J1nuw035SxaWwO5LApK
	/dsixtpzmIRXfy45p2TathLnVWfGwyIF3c6wo8c8ragE3rZy/vShsqRDqq1ekuw=
X-Google-Smtp-Source: AGHT+IF4nGsBr2pEGPY+O8wE7gDx5fwAvp1q+DmMR3MQ854tS6TTG/unf2cX3aq5NfeuObTU4oyKrg==
X-Received: by 2002:a17:907:2d27:b0:a9e:1fc7:fc11 with SMTP id a640c23a62f3a-a9e655b931cmr1415582166b.40.1730742019805;
        Mon, 04 Nov 2024 09:40:19 -0800 (PST)
Received: from [192.168.0.157] ([79.115.63.225])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9eb16d5478sm9475066b.45.2024.11.04.09.40.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 04 Nov 2024 09:40:19 -0800 (PST)
Message-ID: <ee2f1ece-30fc-44e7-bf36-1c6c8f04301d@linaro.org>
Date: Mon, 4 Nov 2024 17:40:17 +0000
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 2/4] media: videobuf2-core: release all planes first in
 __prepare_dmabuf()
To: Yunke Cao <yunkec@chromium.org>, Tomasz Figa <tfiga@chromium.org>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Hans Verkuil <hverkuil@xs4all.nl>
Cc: linux-media@vger.kernel.org, Peter Griffin <peter.griffin@linaro.org>,
 =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>,
 kernel-team@android.com, William McVicker <willmcvicker@google.com>,
 linux-samsung-soc@vger.kernel.org
References: <20240814020643.2229637-1-yunkec@chromium.org>
 <20240814020643.2229637-3-yunkec@chromium.org>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <20240814020643.2229637-3-yunkec@chromium.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

+linux-samsung-soc@vger.kernel.org

Hi, Yunke, Tomasz, Hans,

On 8/14/24 3:06 AM, Yunke Cao wrote:
> In the existing implementation, validating planes, checking if the planes
> changed, releasing previous planes and reaquiring new planes all happens in
> the same for loop.
> 
> Split the for loop into 3 parts
> 1. In the first for loop, validate planes and check if planes changed.
> 2. Call __vb2_buf_dmabuf_put() to release all planes.
> 3. In the second for loop, reaquire new planes.
> 
> Signed-off-by: Yunke Cao <yunkec@chromium.org>
> Acked-by: Tomasz Figa <tfiga@chromium.org>
> ---
> v3:
> - Applied Tomasz's review comment:
> - Rename err_put_dbuf as err_put_planes.
> - Move code that only executed once into if (reacquired) to simply it.
> - In error handling, only call dma_buf_put() for valid pointers.
> ---
>  .../media/common/videobuf2/videobuf2-core.c   | 115 +++++++++---------
>  1 file changed, 59 insertions(+), 56 deletions(-)
> 
> diff --git a/drivers/media/common/videobuf2/videobuf2-core.c b/drivers/media/common/videobuf2/videobuf2-core.c
> index 4d232b08f950..b53d94659e30 100644
> --- a/drivers/media/common/videobuf2/videobuf2-core.c
> +++ b/drivers/media/common/videobuf2/videobuf2-core.c
> @@ -1387,11 +1387,13 @@ static int __prepare_dmabuf(struct vb2_buffer *vb)

cut
> +
> +	if (reacquired) {

cut

> -	/*
> -	 * Now that everything is in order, copy relevant information
> -	 * provided by userspace.
> -	 */
> -	for (plane = 0; plane < vb->num_planes; ++plane) {
> -		vb->planes[plane].bytesused = planes[plane].bytesused;
> -		vb->planes[plane].length = planes[plane].length;
> -		vb->planes[plane].m.fd = planes[plane].m.fd;
> -		vb->planes[plane].data_offset = planes[plane].data_offset;
> -	}
> +		/*
> +		 * Now that everything is in order, copy relevant information
> +		 * provided by userspace.
> +		 */
> +		for (plane = 0; plane < vb->num_planes; ++plane) {
> +			vb->planes[plane].bytesused = planes[plane].bytesused;
> +			vb->planes[plane].length = planes[plane].length;
> +			vb->planes[plane].m.fd = planes[plane].m.fd;
> +			vb->planes[plane].data_offset = planes[plane].data_offset;
> +		}

I'm running into an issue on my Pixel 6 device with this change.

I see that this chunk of code was moved only for the `reacquired` case.

> -	if (reacquired) {
>  		/*
>  		 * Call driver-specific initialization on the newly acquired buffer,
>  		 * if provided.
> @@ -1479,19 +1473,28 @@ static int __prepare_dmabuf(struct vb2_buffer *vb)
>  		ret = call_vb_qop(vb, buf_init, vb);
>  		if (ret) {
>  			dprintk(q, 1, "buffer initialization failed\n");
> -			goto err;
> +			goto err_put_vb2_buf;
>  		}
> +	} else {
> +		for (plane = 0; plane < vb->num_planes; ++plane)
> +			dma_buf_put(planes[plane].dbuf);
>  	}
>  
>  	ret = call_vb_qop(vb, buf_prepare, vb);

But then the above method is called, were the pixel downstream driver
[1] tries to:
	bufcon_dmabuf[i] = dma_buf_get(vb->planes[i].m.fd);

This fails with -EBADF as the core driver did not set
vb->planes[plane].m.fd for `!reacquired`.

The following diff makes the Pixel 6 downstream driver work as before
this change. Shall we set the relevant data copied from userspace to
vb->planes in the `!reacquired` case again?

Thanks,
ta

[1]
https://android.googlesource.com/kernel/gs/+/refs/tags/android-15.0.0_r0.14/drivers/media/platform/exynos/mfc/mfc_enc_vb2.c#215

diff --git a/drivers/media/common/videobuf2/videobuf2-core.c
b/drivers/media/common/videobuf2/videobuf2-core.c
index 02fe81b9be28..0acaf8deaf78 100644
--- a/drivers/media/common/videobuf2/videobuf2-core.c
+++ b/drivers/media/common/videobuf2/videobuf2-core.c
@@ -1365,6 +1365,18 @@ static int __prepare_userptr(struct vb2_buffer *vb)
        return ret;
 }

+static void __v2buf_set_planes(struct vb2_buffer *vb, struct vb2_plane
*planes)
+{
+       unsigned int plane;
+
+       for (plane = 0; plane < vb->num_planes; ++plane) {
+               vb->planes[plane].bytesused = planes[plane].bytesused;
+               vb->planes[plane].length = planes[plane].length;
+               vb->planes[plane].m.fd = planes[plane].m.fd;
+               vb->planes[plane].data_offset = planes[plane].data_offset;
+       }
+}
+
 /*
  * __prepare_dmabuf() - prepare a DMABUF buffer
  */
@@ -1459,12 +1471,7 @@ static int __prepare_dmabuf(struct vb2_buffer *vb)
                 * Now that everything is in order, copy relevant
information
                 * provided by userspace.
                 */
-               for (plane = 0; plane < vb->num_planes; ++plane) {
-                       vb->planes[plane].bytesused =
planes[plane].bytesused;
-                       vb->planes[plane].length = planes[plane].length;
-                       vb->planes[plane].m.fd = planes[plane].m.fd;
-                       vb->planes[plane].data_offset =
planes[plane].data_offset;
-               }
+               __v2buf_set_planes(vb, planes);

                /*
                 * Call driver-specific initialization on the newly
acquired buffer,
@@ -1476,6 +1483,8 @@ static int __prepare_dmabuf(struct vb2_buffer *vb)
                        goto err_put_vb2_buf;
                }
        } else {
+               __v2buf_set_planes(vb, planes);
+
                for (plane = 0; plane < vb->num_planes; ++plane)
                        dma_buf_put(planes[plane].dbuf);
        }

