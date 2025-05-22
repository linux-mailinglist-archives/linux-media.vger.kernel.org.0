Return-Path: <linux-media+bounces-33119-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 962F9AC0BAD
	for <lists+linux-media@lfdr.de>; Thu, 22 May 2025 14:37:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 84F02189EE77
	for <lists+linux-media@lfdr.de>; Thu, 22 May 2025 12:37:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8331A28AAED;
	Thu, 22 May 2025 12:36:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="s5yIPK8h"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-oi1-f179.google.com (mail-oi1-f179.google.com [209.85.167.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACB471E485
	for <linux-media@vger.kernel.org>; Thu, 22 May 2025 12:36:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747917414; cv=none; b=IosjQcRIN8VoCPUmF0KxdUvVchHSn7SwLjyicEwbGBFAx9lTlCG2TSBHGpmlF+vCe2Thx6mTQvqPCOj9BD7HkhrZ7axxoGPhornI/tfNjLhcWRj4SuRO0SPYzIXQjG4Ztkn69llxREj+jHJq/ESt7aavmsLTH7B9GqLDUPTV3eA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747917414; c=relaxed/simple;
	bh=hdYRP/ZlkZwZ6MgNBwKuzValqczEUy1hpGacpIQvX7Q=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dktogRHjVu5B1olssjfv8+g6QzkXpiIIC6SsCUWQBnp+2oBtKqqqqmvtuBzp6Q9Gp/3LKiii7b7+9ZfOSQOrq/eKGCsLPE8sRts1mIf8+h1Bwb8F5VWEo1iXYTmyBKguTDKrT8Lbja2/fjIOW6XaV7qwi/GwSw0mJSA8YQPUbHo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=s5yIPK8h; arc=none smtp.client-ip=209.85.167.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-oi1-f179.google.com with SMTP id 5614622812f47-3feaedb4085so4777098b6e.0
        for <linux-media@vger.kernel.org>; Thu, 22 May 2025 05:36:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747917411; x=1748522211; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=E/nM7ohI+OhW9Q09hMJxUkW/sk0nV2AyhKtXe2v8eEc=;
        b=s5yIPK8hKKZYX4Om9GLNGNrBD7KRHd7APtqx7P6MOoqY4UwB2zKMjCdBYhnieLHavs
         qBFYuK61Za2x0HyXndR0me77wPbFcFN6pNxye+y6GsxihVME9CgwQsvMv0RkACnKf6XC
         nLspmnKqewWpyrGXBusRa6da6jhOC8SNrlGuGdEzyVchNn+dXC5RZ81oF8O9SfDDTDJb
         nzddAxujXGW6xBrrn3Wd8kqtrgOC9bjD2rGEkzKYj+OU3rasC5Ml8XHMRsjZrGTYNyzi
         sHMo85RLMdCPJL7fhMYc1IYsZY3FBXCr/9wbuBGfbWkNxvqBTpYjrh/4QtBmH3j7nXmi
         yTyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747917411; x=1748522211;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=E/nM7ohI+OhW9Q09hMJxUkW/sk0nV2AyhKtXe2v8eEc=;
        b=Pd+cO7aXO5MOCMnGDze28mmYukgg4thrmp38W5v8E2OM6H8ysXG/C5nRtFfXMfHUuu
         I/kX/hmAnWn3oDD4c3I4rpd6W/8qjDG4dTpoHzQegWgkwJ5W6XLCMjzY7qmjDy0A2q2T
         bIW/96AIQQXQsjxTxr8DB6Fq6ARSKyaKwbGClS2OHV6eH6kftYrmctCgkYd+A3R8l1jb
         em7IkAvFx4Il2agxEHOQCPF4LPt0IfOF6MTZxriovZsIk1gmsqpfbnQAr7PeZ6BPMjMQ
         WR/tRrMRQ0nxKaRTQAR2K6ipZU3Bm2QmTruvyVPfOLECNjV0dPSeI9gLx/yoObtmEUOW
         U77w==
X-Forwarded-Encrypted: i=1; AJvYcCXnkssKdcPbMKI1eGW5szWrZoanVdQCzxFU2sLWazfgaevVvzquCbk5LRQJVJMqCeGK6lpKthLBv5/+tQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyGu9lIhE8GR1opheC8FyaW+CQnT17xetoEg4fFj06LAaQ2nueK
	wynSUnIJl0I8QMm0fEHkRrlrwUOC0EzCnrsfsp6WowVwmpCuY1Gbf6/DuZOP1wYM3lXt4X5bAAU
	nQ8u3wAz1RQvlKc6klrgAU6tGA+ywQxILVOnNIciHIA==
X-Gm-Gg: ASbGnctyu2OnsF+FAWoF+7i6YY4Y/RWGMsQ4rdMGO58NvEmcm9teO3MUMK1hx37EpN/
	pSWBbVpxV5kPNq/TjG1PhMiRsKjH7E2rDtu1CiqJVv5cFwFoPQGCVcE8VVkJ1eojRnkUtiM2ZRL
	/Nj/eTmK3POY5v/sgWLkjIi4EcS4VDU9mhWw==
X-Google-Smtp-Source: AGHT+IFaxfBHByqapVV2RXkEPTMYtDPJFaizTF3QtPLs+N+jP8G9GyXQ9nHLQfE3byrCa1MQmfMacM+snhhkwuWXSyE=
X-Received: by 2002:a05:6808:338a:b0:3f6:a9d4:b7e4 with SMTP id
 5614622812f47-404d86f3f18mr17232381b6e.20.1747917411552; Thu, 22 May 2025
 05:36:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250520152436.474778-1-jens.wiklander@linaro.org>
 <20250520152436.474778-3-jens.wiklander@linaro.org> <dffbd709-def0-47af-93ff-a48686f04153@amd.com>
 <CAHUa44Ec0+GPoDkcEG+Vg9_TY1NC=nh3yr0F=ezHMbaeX_A0Bg@mail.gmail.com> <1a65f370-2df2-4169-85f9-c45e7c537447@amd.com>
In-Reply-To: <1a65f370-2df2-4169-85f9-c45e7c537447@amd.com>
From: Jens Wiklander <jens.wiklander@linaro.org>
Date: Thu, 22 May 2025 14:36:39 +0200
X-Gm-Features: AX0GCFtomK6Kj4MbJdPbWNPCFM5pduAepClCBqfPEiiU97RKWiikvixpOO2yK1w
Message-ID: <CAHUa44Hgu9DnmeGXAoFKkRBt6jFCAb6Mi5zzuuvVVSgsxDZQWA@mail.gmail.com>
Subject: Re: [PATCH v9 2/9] dma-buf: dma-heap: export declared functions
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org, 
	op-tee@lists.trustedfirmware.org, linux-arm-kernel@lists.infradead.org, 
	Olivier Masse <olivier.masse@nxp.com>, Thierry Reding <thierry.reding@gmail.com>, 
	Yong Wu <yong.wu@mediatek.com>, Sumit Semwal <sumit.semwal@linaro.org>, 
	Benjamin Gaignard <benjamin.gaignard@collabora.com>, Brian Starkey <Brian.Starkey@arm.com>, 
	John Stultz <jstultz@google.com>, "T . J . Mercier" <tjmercier@google.com>, 
	Sumit Garg <sumit.garg@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, azarrabi@qti.qualcomm.com, 
	Simona Vetter <simona.vetter@ffwll.ch>, Daniel Stone <daniel@fooishbar.org>, 
	Rouven Czerwinski <rouven.czerwinski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, May 22, 2025 at 1:52=E2=80=AFPM Christian K=C3=B6nig
<christian.koenig@amd.com> wrote:
>
> On 5/22/25 08:56, Jens Wiklander wrote:
> > On Wed, May 21, 2025 at 9:13=E2=80=AFAM Christian K=C3=B6nig
> > <christian.koenig@amd.com> wrote:
> >>
> >> On 5/20/25 17:16, Jens Wiklander wrote:
> >>> Export the dma-buf heap functions declared in <linux/dma-heap.h>.
> >>
> >> That is what this patch does and that should be obvious by looking at =
it. You need to explain why you do this.
> >>
> >> Looking at the rest of the series it's most likely ok, but this commit=
 message should really be improved.
> >
> > I'm considering something like this for the next version:
> > Export the dma-buf heap functions declared in <linux/dma-heap.h> to all=
ow
> > them to be used by kernel modules. This will enable drivers like the OP=
-TEE
> > driver, to utilize these interfaces for registering and managing their
> > specific DMA heaps.
>
> Works for me, but it doesn't needs to be so detailed.
>
> Something like this here would be optimal I think:
>
> Export the dma-buf heap functions to allow them to be used by the OP-TEE =
driver.
> The OP-TEE driver wants to register and manage specific secure DMA heaps =
with it.

Great, I'll use that.

Thanks,
Jens

>
> Regards,
> Christian.
>
> >
> > Thanks,
> > Jens
> >
> >>
> >> Regards,
> >> Christian.
> >>
> >>>
> >>> Signed-off-by: Jens Wiklander <jens.wiklander@linaro.org>
> >>> ---
> >>>  drivers/dma-buf/dma-heap.c | 3 +++
> >>>  1 file changed, 3 insertions(+)
> >>>
> >>> diff --git a/drivers/dma-buf/dma-heap.c b/drivers/dma-buf/dma-heap.c
> >>> index 3cbe87d4a464..cdddf0e24dce 100644
> >>> --- a/drivers/dma-buf/dma-heap.c
> >>> +++ b/drivers/dma-buf/dma-heap.c
> >>> @@ -202,6 +202,7 @@ void *dma_heap_get_drvdata(struct dma_heap *heap)
> >>>  {
> >>>       return heap->priv;
> >>>  }
> >>> +EXPORT_SYMBOL(dma_heap_get_drvdata);
> >>>
> >>>  /**
> >>>   * dma_heap_get_name - get heap name
> >>> @@ -214,6 +215,7 @@ const char *dma_heap_get_name(struct dma_heap *he=
ap)
> >>>  {
> >>>       return heap->name;
> >>>  }
> >>> +EXPORT_SYMBOL(dma_heap_get_name);
> >>>
> >>>  /**
> >>>   * dma_heap_add - adds a heap to dmabuf heaps
> >>> @@ -303,6 +305,7 @@ struct dma_heap *dma_heap_add(const struct dma_he=
ap_export_info *exp_info)
> >>>       kfree(heap);
> >>>       return err_ret;
> >>>  }
> >>> +EXPORT_SYMBOL(dma_heap_add);
> >>>
> >>>  static char *dma_heap_devnode(const struct device *dev, umode_t *mod=
e)
> >>>  {
> >>
>

