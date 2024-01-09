Return-Path: <linux-media+bounces-3424-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 25D768289BE
	for <lists+linux-media@lfdr.de>; Tue,  9 Jan 2024 17:11:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A4D8B1F2581E
	for <lists+linux-media@lfdr.de>; Tue,  9 Jan 2024 16:11:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9682A3A1AA;
	Tue,  9 Jan 2024 16:11:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b="I18p6kls"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qk1-f171.google.com (mail-qk1-f171.google.com [209.85.222.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A0C539ADE
	for <linux-media@vger.kernel.org>; Tue,  9 Jan 2024 16:11:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ndufresne.ca
Received: by mail-qk1-f171.google.com with SMTP id af79cd13be357-7831f567100so184180885a.0
        for <linux-media@vger.kernel.org>; Tue, 09 Jan 2024 08:11:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20230601.gappssmtp.com; s=20230601; t=1704816685; x=1705421485; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:autocrypt
         :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=vFptk53wn4JFtsVYg8hb5F0+FRXRwx3THgRb2uhxx04=;
        b=I18p6klslyMgAoqOkDjLD5U/ez6doeRW8ThIzT9Bna+PKlmJJFQUWVdvMIfTJ6hWZj
         JWPcLiaCRhgxA0hMTy3VwFU8kRxnldtm0bcCqaDHJddNilSr8YAhMCAsyRyka7z/nQNO
         EYWRrmOajABEc+r2t3g+vHGs8BV22HzCiLJuMwr1sOQr0QxIl6hkQaUw3A41SKGhFMFZ
         IjS+hZa3K19Hu6MxjNtJAOzF3pNbk/aZgMDmxay+UeIiUeo8BNHoWHU45GEOHKUM9Ef4
         +7V+zGBbmOlVujAlSi8olrBsD3qk6Ba/PArjLlkLbStB77NAFcASWjh/IgwIe3ibAYVA
         wYkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704816685; x=1705421485;
        h=mime-version:user-agent:content-transfer-encoding:autocrypt
         :references:in-reply-to:date:cc:to:from:subject:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vFptk53wn4JFtsVYg8hb5F0+FRXRwx3THgRb2uhxx04=;
        b=BCra7/wmO0KbZxv78tUSWyWdnLJd6X8hCflbCotydYddU4M+Dh+avj8NJHZ8Tf3LMl
         LbBy5deqz5sddmr76o7/LX9oST3MoClqLlGjzMeRghBOi+9k9DIgEAK+x9Q7H6ZFAhBr
         V6e3HHQG+HFKnvjcq4tEOKGPbXJ5xnR6X+/yYGPGBfAQp1WuU1zoWtDAT8rjqsmszr3u
         cUxpHsRjtk3V3wBXsLG4/YcTGA8IJLOUNZRjDCye29Xwp51oQvNNrXa5HF2UGuAyFWY5
         sX/uh5IOFyckIgrX+aEMRU/MpqzVL0M+g6Pg8f5/hA6qx1umsz/aWjGMcuQh5Bvvub4s
         XAfA==
X-Gm-Message-State: AOJu0YxrECEiOKJsl9+FlyBSNIMTHEammcw8rKJutb6o03rI0VPxRsLk
	I/f0ZPwPjbQ0xN9DXTw+6sEE3jG6IZbrVg==
X-Google-Smtp-Source: AGHT+IFpx2lBoMf5GT/r5JKw+UQMYCxqLYOGQ3zZ6EWwOxxCPN4w+5a+EQzQLE74mvj3J0kj1rwC7A==
X-Received: by 2002:a05:620a:38b:b0:783:902:bcad with SMTP id q11-20020a05620a038b00b007830902bcadmr5067063qkm.56.1704816685299;
        Tue, 09 Jan 2024 08:11:25 -0800 (PST)
Received: from nicolas-tpx395.localdomain ([2606:6d00:11:9202::7a9])
        by smtp.gmail.com with ESMTPSA id m4-20020ae9e704000000b00781de2da438sm903158qka.107.2024.01.09.08.11.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jan 2024 08:11:25 -0800 (PST)
Message-ID: <ba08ba6a8bd26b33b5168caec68377268a6cdc85.camel@ndufresne.ca>
Subject: Re: [PATCH] media: videobuf2: Add missing doc comment for
 waiting_in_dqbuf
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Andrzej Pietrasiewicz <andrzej.p@collabora.com>, 
	linux-media@vger.kernel.org
Cc: Tomasz Figa <tfiga@chromium.org>, Marek Szyprowski
	 <m.szyprowski@samsung.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	kernel@collabora.com
Date: Tue, 09 Jan 2024 11:11:24 -0500
In-Reply-To: <20240105134020.34312-1-andrzej.p@collabora.com>
References: <20240105134020.34312-1-andrzej.p@collabora.com>
Autocrypt: addr=nicolas@ndufresne.ca; prefer-encrypt=mutual; keydata=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
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.50.2 (3.50.2-1.fc39) 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Le vendredi 05 janvier 2024 =C3=A0 14:40 +0100, Andrzej Pietrasiewicz a =C3=
=A9crit=C2=A0:
> While at it rearrange other comments to match the order of struct members=
.
>=20
> Fixes: d65842f7126a ("media: vb2: add waiting_in_dqbuf flag")
> Signed-off-by: Andrzej Pietrasiewicz <andrzej.p@collabora.com>

Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>

> ---
>  include/media/videobuf2-core.h | 12 +++++++-----
>  1 file changed, 7 insertions(+), 5 deletions(-)
>=20
> diff --git a/include/media/videobuf2-core.h b/include/media/videobuf2-cor=
e.h
> index e41204df19f0..5020e052eda0 100644
> --- a/include/media/videobuf2-core.h
> +++ b/include/media/videobuf2-core.h
> @@ -72,6 +72,10 @@ struct vb2_buffer;
>   *		 argument to other ops in this structure.
>   * @put_userptr: inform the allocator that a USERPTR buffer will no long=
er
>   *		 be used.
> + * @prepare:	called every time the buffer is passed from userspace to th=
e
> + *		driver, useful for cache synchronisation, optional.
> + * @finish:	called every time the buffer is passed back from the driver
> + *		to the userspace, also optional.
>   * @attach_dmabuf: attach a shared &struct dma_buf for a hardware operat=
ion;
>   *		   used for DMABUF memory types; dev is the alloc device
>   *		   dbuf is the shared dma_buf; returns ERR_PTR() on failure;
> @@ -86,10 +90,6 @@ struct vb2_buffer;
>   *		dmabuf.
>   * @unmap_dmabuf: releases access control to the dmabuf - allocator is n=
otified
>   *		  that this driver is done using the dmabuf for now.
> - * @prepare:	called every time the buffer is passed from userspace to th=
e
> - *		driver, useful for cache synchronisation, optional.
> - * @finish:	called every time the buffer is passed back from the driver
> - *		to the userspace, also optional.
>   * @vaddr:	return a kernel virtual address to a given memory buffer
>   *		associated with the passed private structure or NULL if no
>   *		such mapping exists.
> @@ -484,7 +484,6 @@ struct vb2_buf_ops {
>   *		caller. For example, for V4L2, it should match
>   *		the types defined on &enum v4l2_buf_type.
>   * @io_modes:	supported io methods (see &enum vb2_io_modes).
> - * @alloc_devs:	&struct device memory type/allocator-specific per-plane =
device
>   * @dev:	device to use for the default allocation context if the driver
>   *		doesn't fill in the @alloc_devs array.
>   * @dma_attrs:	DMA attributes to use for the DMA.
> @@ -550,6 +549,7 @@ struct vb2_buf_ops {
>   *		@start_streaming can be called. Used when a DMA engine
>   *		cannot be started unless at least this number of buffers
>   *		have been queued into the driver.
> + * @alloc_devs:	&struct device memory type/allocator-specific per-plane =
device
>   */
>  /*
>   * Private elements (won't appear at the uAPI book):
> @@ -571,6 +571,8 @@ struct vb2_buf_ops {
>   * @waiting_for_buffers: used in poll() to check if vb2 is still waiting=
 for
>   *		buffers. Only set for capture queues if qbuf has not yet been
>   *		called since poll() needs to return %EPOLLERR in that situation.
> + * @waiting_in_dqbuf: set whenever vb2_queue->lock is released while wai=
ting for
> + *		a buffer to arrive so that -EBUSY can be returned when appropriate
>   * @is_multiplanar: set if buffer type is multiplanar
>   * @is_output:	set if buffer type is output
>   * @copy_timestamp: set if vb2-core should set timestamps


