Return-Path: <linux-media+bounces-33074-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6ECB4AC04E4
	for <lists+linux-media@lfdr.de>; Thu, 22 May 2025 08:56:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A454C8C580C
	for <lists+linux-media@lfdr.de>; Thu, 22 May 2025 06:56:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5D072221DAE;
	Thu, 22 May 2025 06:56:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="n59AH3V7"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ot1-f44.google.com (mail-ot1-f44.google.com [209.85.210.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17B973BBC9
	for <linux-media@vger.kernel.org>; Thu, 22 May 2025 06:56:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747897005; cv=none; b=CNx9SyNNzuq/mauWsN8NNtbJpiFam6yzlfeQ2G564wjnq7LLNj0uxTz54bhb6rwcgAcR/p/6uyIOEOm8PxZcUpYqPQETg7eZg56cs6Uti+ie6ZkcCf4WRILMYs0nEK20GIrp0Da7UPkKKHhoA630Dk8s7LjORLoyD/j6wRCBAnE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747897005; c=relaxed/simple;
	bh=Kz9JL8AUUhRuVWZMu/WcSf6wS1Z8DinfpEJQ6LTfN3o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Wqi0nkyG7/9VlQKbJoYZz0FXyWKzDZr35LnN7nOyRatZc2eVIB5rb5ydzCRZa94ypu+1WLBa3BzXu++fvBfXPu1I597DO0WKtA3p5ZtvPXPVs3sJHg08uvvAnC3t10LrYCNhDi2B2PPJyfoYLfpB9RxUW/hx+MUp/2O9Xe/BOnY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=n59AH3V7; arc=none smtp.client-ip=209.85.210.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ot1-f44.google.com with SMTP id 46e09a7af769-731e277a6b0so6887035a34.1
        for <linux-media@vger.kernel.org>; Wed, 21 May 2025 23:56:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747897003; x=1748501803; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WeKMC6ZBMvoz5mZGPjKGgi0Ohr2T8fh1E4A0BZHhyCM=;
        b=n59AH3V7PJX9TvuA4qHYxM1uXa+y+0lcrIvNRSecj+1dDQljKtZF8UxqpaDdzvnOEP
         YVpgVM4lDbOtdhTFNfH+6vBpsbSbE+a1SQJws/AiY7evsD5PUQbodGA1G8FE/iyXAlls
         vg7wZtakWo034zGo+NTF2JTq8homl4z71fk2ddBLGFx8z2+lzGbIiPPgXsd8g0gbFnCk
         BW+c7aF3ALWpjas2Mt1wKa+C18QlwDiTKbD4WJoimSI4XYnWO2AmUXFLBqV8vyX2BeeW
         5qKxrWk7BVI2XuUmPTEEogdcXYlI7fK9YnYVYvIGYOrkpV+JGq4aRr0rlZPzdOQCsWx8
         QWjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747897003; x=1748501803;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WeKMC6ZBMvoz5mZGPjKGgi0Ohr2T8fh1E4A0BZHhyCM=;
        b=rcNn+bemWvzL5iqaXE2fgllk0xI9QF/JwLgRonXGV7qq+4fPzLDkn0zYwEtJQxZX3m
         kbsaAwGTcAo9Qaq4Mogh7CzgTP6lgXrGCNAYz7GZFrYUdY7IofM33eLR3Gjs1Y7jkfLX
         9b8giQ5udd05E6Sm/DA92W3YZ5H1JGs6Ny9Of20OQJ7oeqhFp+oAMHWbeTKPlo42eSDY
         oixV/QsPrPb9H4xNEYYxaIlYHwK4f4cEjzKfCJfwwvyt3DFOxs43jbhAxMn6ZEZe4BB5
         PVNaf+Pxmhrgl6/gKY9yYlbOo0IUsX71Obt7o4LWmjivF1Fwb19UkUB52TPd3TxqyXIt
         pWzg==
X-Forwarded-Encrypted: i=1; AJvYcCWE5na+iwLyC7+1X1IyoS1Wdo1GyYN7f7saPOsYY0jPANSJqadya9kckPSQmhNT/ChyUXUJIGN7Ccyfiw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyq/EnMINF5EYgXgwWGePIwsGGeFG8nWusHjBuGIYkVncl+oB5E
	itmk7u+vFaSq732+dp60KuE2i0hey+vhv0Ohq1aAq0bJhfVOO0h52euKMzayQePRKkOV6LKkKgT
	mHwVH7Irr2nw6EHtjoHPk/0V+/HP15mXtKlFCDYn06Q==
X-Gm-Gg: ASbGnctiSJrS/9COs1VHQycBfuJmMXMgsCE0c0B+qG2CtKp7leKSlkU69HW9bxGp/Y+
	QW0L36Q/1EJW+jlaLKKI33fT5xc1c6LJfyoLcvSqcuukWSbmXRpR87Ix1k5zgrTALOJz1lPItk3
	fz2jngz4FG50YTqkkw5MADlgpLvLDtbXWh8g==
X-Google-Smtp-Source: AGHT+IHkFUemf1YsBa7Ra5vRLLSyYkClMUJvfuEYqOo7C5Q/HY7RUEskcqp+LiC0Z8m9NvJveoTaK0UdZlaYOd03Who=
X-Received: by 2002:a05:6808:6410:b0:3f7:ff67:1d8c with SMTP id
 5614622812f47-404d88d532amr14478281b6e.36.1747897003075; Wed, 21 May 2025
 23:56:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250520152436.474778-1-jens.wiklander@linaro.org>
 <20250520152436.474778-3-jens.wiklander@linaro.org> <dffbd709-def0-47af-93ff-a48686f04153@amd.com>
In-Reply-To: <dffbd709-def0-47af-93ff-a48686f04153@amd.com>
From: Jens Wiklander <jens.wiklander@linaro.org>
Date: Thu, 22 May 2025 08:56:31 +0200
X-Gm-Features: AX0GCFsuHYqDh1JYpWH8r8xDir4J3V2XXHJjiARqLynYHFcDQxMIIZpQ5oYhZd4
Message-ID: <CAHUa44Ec0+GPoDkcEG+Vg9_TY1NC=nh3yr0F=ezHMbaeX_A0Bg@mail.gmail.com>
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

On Wed, May 21, 2025 at 9:13=E2=80=AFAM Christian K=C3=B6nig
<christian.koenig@amd.com> wrote:
>
> On 5/20/25 17:16, Jens Wiklander wrote:
> > Export the dma-buf heap functions declared in <linux/dma-heap.h>.
>
> That is what this patch does and that should be obvious by looking at it.=
 You need to explain why you do this.
>
> Looking at the rest of the series it's most likely ok, but this commit me=
ssage should really be improved.

I'm considering something like this for the next version:
Export the dma-buf heap functions declared in <linux/dma-heap.h> to allow
them to be used by kernel modules. This will enable drivers like the OP-TEE
driver, to utilize these interfaces for registering and managing their
specific DMA heaps.

Thanks,
Jens

>
> Regards,
> Christian.
>
> >
> > Signed-off-by: Jens Wiklander <jens.wiklander@linaro.org>
> > ---
> >  drivers/dma-buf/dma-heap.c | 3 +++
> >  1 file changed, 3 insertions(+)
> >
> > diff --git a/drivers/dma-buf/dma-heap.c b/drivers/dma-buf/dma-heap.c
> > index 3cbe87d4a464..cdddf0e24dce 100644
> > --- a/drivers/dma-buf/dma-heap.c
> > +++ b/drivers/dma-buf/dma-heap.c
> > @@ -202,6 +202,7 @@ void *dma_heap_get_drvdata(struct dma_heap *heap)
> >  {
> >       return heap->priv;
> >  }
> > +EXPORT_SYMBOL(dma_heap_get_drvdata);
> >
> >  /**
> >   * dma_heap_get_name - get heap name
> > @@ -214,6 +215,7 @@ const char *dma_heap_get_name(struct dma_heap *heap=
)
> >  {
> >       return heap->name;
> >  }
> > +EXPORT_SYMBOL(dma_heap_get_name);
> >
> >  /**
> >   * dma_heap_add - adds a heap to dmabuf heaps
> > @@ -303,6 +305,7 @@ struct dma_heap *dma_heap_add(const struct dma_heap=
_export_info *exp_info)
> >       kfree(heap);
> >       return err_ret;
> >  }
> > +EXPORT_SYMBOL(dma_heap_add);
> >
> >  static char *dma_heap_devnode(const struct device *dev, umode_t *mode)
> >  {
>

