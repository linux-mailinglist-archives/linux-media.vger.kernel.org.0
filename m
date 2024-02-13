Return-Path: <linux-media+bounces-5051-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FB07852840
	for <lists+linux-media@lfdr.de>; Tue, 13 Feb 2024 06:37:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DFA471F23B4C
	for <lists+linux-media@lfdr.de>; Tue, 13 Feb 2024 05:37:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4260512B7D;
	Tue, 13 Feb 2024 05:37:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="J6NCqQql"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE505125BF
	for <linux-media@vger.kernel.org>; Tue, 13 Feb 2024 05:37:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707802661; cv=none; b=SYPG02U728JBodsaKs3RTEBZcI0vD6KUsexwmbsKg6E+N/+W2+MgHY3hJGlmYMGwPPSlC86bTqPM8/VJ5aFcrZwpZvXmVLW08XruxF1i/ZhpboxXZoK8sb230AazGcrb0trs0GfSrlGzSw4jHgS8cONz/HZ5c0hvAStjz5ISPec=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707802661; c=relaxed/simple;
	bh=2TvbNHOCXoHHQyd6QEHRFXTQkRdHsfAsdwIUTFsb3/o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ecGajyGPKhiveWzBHzoGD7ZPAJCpV+aGxSYziT9/XTYjXiOc/zFhsjms6+06Kp3U9l9l+XcjQnlIB/63eDG69uHZ1KFkqw76TEab1zb0IAXiXme4q5Y6cTf+0xGbZ8gCcyXPaLWJSZf/9QVuU3RFMn880xfSAkP/k8HT8aJRMl8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=J6NCqQql; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-a30e445602cso964919666b.0
        for <linux-media@vger.kernel.org>; Mon, 12 Feb 2024 21:37:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1707802657; x=1708407457; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jIaHZYRSgGkeuSC2R8bvkqzcC5ruMgkbFrkWrF4z2AY=;
        b=J6NCqQqlbo2P4Zyp+Xm2FUs679XVm4A6bETOkyiitf4a7KGwhDc5IINFz8APWleS5z
         sKlUosdnyBPIAR1C8homG/mRLyi4BzVc4u1nGQ++xkLtPxEWDvihffYijnmQ1Bgk+C9P
         btZCeGnFGHtUAE/yABjQEdvPgIS4JkJdgO0Tk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707802657; x=1708407457;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jIaHZYRSgGkeuSC2R8bvkqzcC5ruMgkbFrkWrF4z2AY=;
        b=T6nHQqFWCTDncpi6IKXiI7NYbVFDoNY8o7lFVRiCKpAS8KaRHtTmW+55WgiMPWn2UB
         78ii8CeVwjpYGESsML2erABZSJOuxY5r2g7noa9/9PlD3L/xxBkm5FYPf3+983pmdEZw
         6D8HiaYTC2RfmGObFTDApWxpOQwD5JJ+kvB5FqN3Olb3aUWUA6mHqfPwNi5q9TOwmoAU
         cDOT7R2PgylyCtxR6gvUJBgv1RhQcJF/33IkdWDYQorq+lOMRQwdr7x42g4nnPfQj/1w
         3nPz39lRSKjTubaDlncmFwMBtmAoQHz5OM2nwSwaov6a5Rdr3GhLpgmbdDioTym0CyiB
         qXCg==
X-Gm-Message-State: AOJu0Yw4nVUCsxx54vOtg0wq18VFviSuGJ7v120l7lt8oLADO0a2qKe3
	x33jdpZHsbbxkE20nn/VkQ0w2CidktHg7Dj0z8DzYdVtfAYp12+oGDsLJaG8A+WWlYNgch4At6g
	=
X-Google-Smtp-Source: AGHT+IGXQQWj7mWA0U6OKOWrOfY0tkf7Hs78NENua2GsQMHMhN99pyIzn3OKqkIuJUmdBkSLcCaA/w==
X-Received: by 2002:a17:907:174f:b0:a38:3eb1:40a1 with SMTP id lf15-20020a170907174f00b00a383eb140a1mr1270441ejc.26.1707802657487;
        Mon, 12 Feb 2024 21:37:37 -0800 (PST)
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com. [209.85.221.48])
        by smtp.gmail.com with ESMTPSA id k20-20020a170906681400b00a3bf7a9edc4sm928547ejr.15.2024.02.12.21.37.36
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Feb 2024 21:37:36 -0800 (PST)
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-3394bec856fso2912807f8f.0
        for <linux-media@vger.kernel.org>; Mon, 12 Feb 2024 21:37:36 -0800 (PST)
X-Received: by 2002:adf:e592:0:b0:33b:48f1:495c with SMTP id
 l18-20020adfe592000000b0033b48f1495cmr954078wrm.12.1707802655794; Mon, 12 Feb
 2024 21:37:35 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240212191203.39238-1-andrzej.p@collabora.com>
In-Reply-To: <20240212191203.39238-1-andrzej.p@collabora.com>
From: Tomasz Figa <tfiga@chromium.org>
Date: Tue, 13 Feb 2024 14:37:17 +0900
X-Gmail-Original-Message-ID: <CAAFQd5AHXWPpwnV910-8SyDRVgP6Trm_AR8GfBv-pkaYpzk1aA@mail.gmail.com>
Message-ID: <CAAFQd5AHXWPpwnV910-8SyDRVgP6Trm_AR8GfBv-pkaYpzk1aA@mail.gmail.com>
Subject: Re: [PATCH v2] media: videobuf2: Add missing doc comment for waiting_in_dqbuf
To: Andrzej Pietrasiewicz <andrzej.p@collabora.com>
Cc: linux-media@vger.kernel.org, Marek Szyprowski <m.szyprowski@samsung.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Hans Verkuil <hverkuil@xs4all.nl>, kernel@collabora.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 13, 2024 at 4:12=E2=80=AFAM Andrzej Pietrasiewicz
<andrzej.p@collabora.com> wrote:
>
> While at it rearrange other comments to match the order of struct members=
.
>
> Fixes: d65842f7126a ("media: vb2: add waiting_in_dqbuf flag")
>
> Signed-off-by: Andrzej Pietrasiewicz <andrzej.p@collabora.com>
> ---
> v2: - rebased onto latest media_tree
>     - reformulated the actual doc comment according to Tomasz
>       Figa's suggestion (thx Tomasz)
>  include/media/videobuf2-core.h | 13 ++++++++-----
>  1 file changed, 8 insertions(+), 5 deletions(-)
>
> diff --git a/include/media/videobuf2-core.h b/include/media/videobuf2-cor=
e.h
> index 56719a26a46c..bec8c3a1ed82 100644
> --- a/include/media/videobuf2-core.h
> +++ b/include/media/videobuf2-core.h
> @@ -72,6 +72,10 @@ struct vb2_buffer;
>   *              argument to other ops in this structure.
>   * @put_userptr: inform the allocator that a USERPTR buffer will no long=
er
>   *              be used.
> + * @prepare:   called every time the buffer is passed from userspace to =
the
> + *             driver, useful for cache synchronisation, optional.
> + * @finish:    called every time the buffer is passed back from the driv=
er
> + *             to the userspace, also optional.
>   * @attach_dmabuf: attach a shared &struct dma_buf for a hardware operat=
ion;
>   *                used for DMABUF memory types; dev is the alloc device
>   *                dbuf is the shared dma_buf; returns ERR_PTR() on failu=
re;
> @@ -86,10 +90,6 @@ struct vb2_buffer;
>   *             dmabuf.
>   * @unmap_dmabuf: releases access control to the dmabuf - allocator is n=
otified
>   *               that this driver is done using the dmabuf for now.
> - * @prepare:   called every time the buffer is passed from userspace to =
the
> - *             driver, useful for cache synchronisation, optional.
> - * @finish:    called every time the buffer is passed back from the driv=
er
> - *             to the userspace, also optional.
>   * @vaddr:     return a kernel virtual address to a given memory buffer
>   *             associated with the passed private structure or NULL if n=
o
>   *             such mapping exists.
> @@ -484,7 +484,6 @@ struct vb2_buf_ops {
>   *             caller. For example, for V4L2, it should match
>   *             the types defined on &enum v4l2_buf_type.
>   * @io_modes:  supported io methods (see &enum vb2_io_modes).
> - * @alloc_devs:        &struct device memory type/allocator-specific per=
-plane device
>   * @dev:       device to use for the default allocation context if the d=
river
>   *             doesn't fill in the @alloc_devs array.
>   * @dma_attrs: DMA attributes to use for the DMA.
> @@ -553,6 +552,7 @@ struct vb2_buf_ops {
>   *             VIDIOC_REQBUFS will ensure at least @min_queued_buffers
>   *             buffers will be allocated. Note that VIDIOC_CREATE_BUFS w=
ill not
>   *             modify the requested buffer count.
> + * @alloc_devs:        &struct device memory type/allocator-specific per=
-plane device
>   */
>  /*
>   * Private elements (won't appear at the uAPI book):
> @@ -577,6 +577,9 @@ struct vb2_buf_ops {
>   * @waiting_for_buffers: used in poll() to check if vb2 is still waiting=
 for
>   *             buffers. Only set for capture queues if qbuf has not yet =
been
>   *             called since poll() needs to return %EPOLLERR in that sit=
uation.
> + * @waiting_in_dqbuf: set by the core for the duration of a blocking DQB=
UF, when
> + *             it has to wait for a buffer to become available with vb2_=
queue->lock
> + *             released. Used to prevent destroying the queue by other t=
hreads.
>   * @is_multiplanar: set if buffer type is multiplanar
>   * @is_output: set if buffer type is output
>   * @copy_timestamp: set if vb2-core should set timestamps
> --
> 2.34.1
>

Thanks!

Acked-by: Tomasz Figa <tfiga@chromium.org>

Best regards,
Tomasz

