Return-Path: <linux-media+bounces-3863-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0597083195A
	for <lists+linux-media@lfdr.de>; Thu, 18 Jan 2024 13:44:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B2951282065
	for <lists+linux-media@lfdr.de>; Thu, 18 Jan 2024 12:44:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C056124B46;
	Thu, 18 Jan 2024 12:44:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="HNgs5ZKw"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FDAF1D6A9
	for <linux-media@vger.kernel.org>; Thu, 18 Jan 2024 12:44:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705581880; cv=none; b=hqyWm55q+JBLzeIT6+YNIJmHA/phBbkU2C1CrfzEn7hVx2o0Amd38MwW24MBfvzcSwpoxzBleqscJLXtilhAjixq4p7vSSLPiWzgb7jgGhOvO5f51Rsjvkv3/FCmWlkvjIg+XMSwEkWu4Xu4yUnMul24xvniB0P4Hm0Yj5gX8ng=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705581880; c=relaxed/simple;
	bh=eUedD1uUdxArJOmOqoy6JbY9jaRf2S8Q4mrkCLZfWL0=;
	h=Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Google-Smtp-Source:X-Received:Received:
	 Received:X-Received:MIME-Version:References:In-Reply-To:From:Date:
	 X-Gmail-Original-Message-ID:Message-ID:Subject:To:Cc:Content-Type:
	 Content-Transfer-Encoding; b=j+QOu4VOs7Ir1xVeadEAID845xYA3nO4f8P1FFJUqDL4jWUHWcapPfHZbyjtErQlOnHC3OUT7L9ViGaxWAX/MiAJ51qsLF9SzhIjXpuYIAfG7Td7pATGsKWcvnlBPpK8omgFrecf2MBIp0o42QJ+jII50FgNDMetT3A3RjeATPM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=HNgs5ZKw; arc=none smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-555e07761acso14976327a12.0
        for <linux-media@vger.kernel.org>; Thu, 18 Jan 2024 04:44:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1705581876; x=1706186676; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vFs5WFNuIRub1VPrlJgHpKQe7Fz8TOGFyF7JArd77ng=;
        b=HNgs5ZKwAKaYdf+rXIWfz9YGak8+ZLHyQUTnWVvDmLtUH21f7V5V0jAi1t/3IW/Ste
         ZYvpPYnJc8e7hEizshuonsITIILqfZoAuNyEsYQu80frgY651B82VG3BZGRiw/UbXWvB
         m/ipb0bSdSKMv5YsNeQhOEHrNTTzLk5mKcni0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705581876; x=1706186676;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vFs5WFNuIRub1VPrlJgHpKQe7Fz8TOGFyF7JArd77ng=;
        b=N1a7K1Pb+QyFKOZeXc0mN6mNvqGcTpYyVYOhciD6W1WCoFRyKqglu9zB0NQaXVurQT
         S4PttbIjYKq0nCoXpqiXk7fOtvRTmphLEWvN+wXLIXCE+lXrY3FFeLwVn/IQWV70t1Ai
         wMNV5YYKHRcZtp+nYA8s4yncgzFIf2j+5njKkc/TmlCkbGyFtxPWKa3kBJrioM8WxLE3
         MpcPQ0ffw8FupNLq+LfFxxR0JgjTOfI9UIozzx8WBXkSSRBrm+mHzYUntODyUSJmn+yX
         vyphDfvoNNnufPGt4mZlgn5Sz3Yv7XIaIHY1wGWniFrt8A1O5lh/ehtAeGM+bpfE0xu/
         M+yA==
X-Gm-Message-State: AOJu0YwjAWoeaIwA+dY2AO8eueRoluOLaFj/4CFwewTlwcAFIMGcT2zh
	eXAHfNmqASr4UcsBsQ3f5rBKNGfchtiA9ezG89e1BqKPYjvemw2A23I6VXuWQNq9dWOQyUEepj5
	lSA==
X-Google-Smtp-Source: AGHT+IGCciFQDKp89XsM0YJsVrEfmcDu3jvM4M7g3yt5w5+MY6tg1G2sfUCX7pZjxR69CHGqHTK9xg==
X-Received: by 2002:a17:907:8b95:b0:a28:d9df:40f8 with SMTP id tb21-20020a1709078b9500b00a28d9df40f8mr376684ejc.29.1705581876629;
        Thu, 18 Jan 2024 04:44:36 -0800 (PST)
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com. [209.85.221.41])
        by smtp.gmail.com with ESMTPSA id ap3-20020a17090735c300b00a2c879e89a8sm8642994ejc.188.2024.01.18.04.44.35
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 18 Jan 2024 04:44:35 -0800 (PST)
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-337b8da1f49so2471130f8f.0
        for <linux-media@vger.kernel.org>; Thu, 18 Jan 2024 04:44:35 -0800 (PST)
X-Received: by 2002:adf:e6c6:0:b0:337:c6da:9705 with SMTP id
 y6-20020adfe6c6000000b00337c6da9705mr331995wrm.146.1705581875197; Thu, 18 Jan
 2024 04:44:35 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240118121452.29151-1-benjamin.gaignard@collabora.com>
In-Reply-To: <20240118121452.29151-1-benjamin.gaignard@collabora.com>
From: Tomasz Figa <tfiga@chromium.org>
Date: Thu, 18 Jan 2024 21:44:15 +0900
X-Gmail-Original-Message-ID: <CAAFQd5DddJt5EY8JnofJZuiQG8WqM7AjOF2cZ29Z=u6nh4YgCg@mail.gmail.com>
Message-ID: <CAAFQd5DddJt5EY8JnofJZuiQG8WqM7AjOF2cZ29Z=u6nh4YgCg@mail.gmail.com>
Subject: Re: [PATCH v2] media: media videobuf2: Stop direct calls to queue
 num_buffers field
To: Benjamin Gaignard <benjamin.gaignard@collabora.com>
Cc: m.szyprowski@samsung.com, mchehab@kernel.org, hverkuil-cisco@xs4all.nl, 
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
	kernel@collabora.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 18, 2024 at 9:15=E2=80=AFPM Benjamin Gaignard
<benjamin.gaignard@collabora.com> wrote:
>
> Use vb2_get_num_buffers() to avoid using queue num_buffers field directly=
.
> This allows us to change how the number of buffers is computed in the
> future.
>
> Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
> ---
> version 2:
> - Change vdev->queue->num_buffers to vb2_get_num_buffers(vdev->queue)
>   in vb2_ioctl_create_bufs().
> - Remove Fixes tag
>
>  drivers/media/common/videobuf2/videobuf2-core.c | 2 +-
>  drivers/media/common/videobuf2/videobuf2-v4l2.c | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/media/common/videobuf2/videobuf2-core.c b/drivers/me=
dia/common/videobuf2/videobuf2-core.c
> index 41a832dd1426..b6bf8f232f48 100644
> --- a/drivers/media/common/videobuf2/videobuf2-core.c
> +++ b/drivers/media/common/videobuf2/videobuf2-core.c
> @@ -989,7 +989,7 @@ int vb2_core_create_bufs(struct vb2_queue *q, enum vb=
2_memory memory,
>         bool no_previous_buffers =3D !q_num_bufs;
>         int ret =3D 0;
>
> -       if (q->num_buffers =3D=3D q->max_num_buffers) {
> +       if (q_num_bufs =3D=3D q->max_num_buffers) {
>                 dprintk(q, 1, "maximum number of buffers already allocate=
d\n");
>                 return -ENOBUFS;
>         }
> diff --git a/drivers/media/common/videobuf2/videobuf2-v4l2.c b/drivers/me=
dia/common/videobuf2/videobuf2-v4l2.c
> index 54d572c3b515..6380155d8575 100644
> --- a/drivers/media/common/videobuf2/videobuf2-v4l2.c
> +++ b/drivers/media/common/videobuf2/videobuf2-v4l2.c
> @@ -1029,7 +1029,7 @@ int vb2_ioctl_create_bufs(struct file *file, void *=
priv,
>         int res =3D vb2_verify_memory_type(vdev->queue, p->memory,
>                         p->format.type);
>
> -       p->index =3D vdev->queue->num_buffers;
> +       p->index =3D vb2_get_num_buffers(vdev->queue);
>         fill_buf_caps(vdev->queue, &p->capabilities);
>         validate_memory_flags(vdev->queue, p->memory, &p->flags);
>         /*
> --
> 2.40.1
>

Acked-by: Tomasz Figa <tfiga@chromium.org>

Best regards,
Tomasz

