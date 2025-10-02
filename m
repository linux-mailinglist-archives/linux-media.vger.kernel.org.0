Return-Path: <linux-media+bounces-43639-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id ED695BB3F4A
	for <lists+linux-media@lfdr.de>; Thu, 02 Oct 2025 14:57:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id AF06B7B1BFB
	for <lists+linux-media@lfdr.de>; Thu,  2 Oct 2025 12:56:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DEDDB3112CB;
	Thu,  2 Oct 2025 12:57:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="GVmdYD5k"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-oi1-f179.google.com (mail-oi1-f179.google.com [209.85.167.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABAAB2E975E
	for <linux-media@vger.kernel.org>; Thu,  2 Oct 2025 12:57:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759409860; cv=none; b=DzZdJTpPYhLtyrl/RU9KGobpgEHbpxuZGx7CPntIQtqeVH5arPrBF95PNfMLB70mAzGUnvipDstGCVZ+wGBA7b5PQzUORzFK0D/MPGXiDjAkvvhiWTuDV8uA2G6zw9xHxlYALZn1YUtjsf+cVH2LQDz6BGIdHZbBbc70SgEkOjg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759409860; c=relaxed/simple;
	bh=Tsxz8tTRUdMdIeQsCupgeGS2mcbHuI4dtXzZw96hvdc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=l9MEJjqTj5TC3xGtvQf7G/o6qNx3rtUcDy/bMFvd+I8TkdI1muvZqK6QqEuPjREL/jwgX2rEgKI/ZpPXritdM5x5IYwHcatgax5TAJG8YNw8usjILFfn1F18KWhOnr/BldxTGdisBUvAPA1j7Zs1i1wWn/DGrhQElQS4AG7k1UM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=GVmdYD5k; arc=none smtp.client-ip=209.85.167.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-oi1-f179.google.com with SMTP id 5614622812f47-43f912f9738so379130b6e.0
        for <linux-media@vger.kernel.org>; Thu, 02 Oct 2025 05:57:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1759409858; x=1760014658; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NZ9DvIz4r5smSG4dSA4CIzbwRw8riJPhilOOGaBUqN0=;
        b=GVmdYD5kIIs3hYvdnZyu/T/abTrq9O1ZZIQ/EMIf0cZNPDV9I31L0nzruOKEDeQkln
         N9Vs/JNOrKsnire/MVVDkNcYXSzuZViPfzMZcMtEaZxRnhn5NMxKP1zGGQUJwgXF72Nx
         XhqJqGrwxw3GxyNaB3pW6d3/3gPF/ShcKGqOxH8RxAyLFnGXpXelxWBYR2gekVUxZRDS
         Mle9IUy23APekdks7M212DHGgjDxfcSURvCFcgiaU1kUwiOGzT9l/vK6ryaKj7F2p1qv
         05l1tJJ4m42vndOxEcxp7NvwaB7ymIxUGfdhwIrnVfH9+svAGAW4OdyNoQaNHbqHXHgn
         qxqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759409858; x=1760014658;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NZ9DvIz4r5smSG4dSA4CIzbwRw8riJPhilOOGaBUqN0=;
        b=GZu/CVoOMnZDZBEQuHOynvg/1RwdXEuLJbCGLnlCTVaPRPVczRnI7d/jVFteQnWeia
         6K40B6ibmiIbaVZsaoCXd83/BOpnHv6V03S1YKPAajRONSkMjTjY/ZZXjFfHxHVmweI4
         YxiSqBTN1r8fsle5aaceswoVm/7qtvtRE/3oBG4PxBvIXX2dzqM4/0/XT21ffvZErMh1
         ybyi8VlwSMP8/Xh91Szn68iAUsFxUaz61BryV+R4Qyu0oLGTdjg5NywbyMxH+fyS45V3
         a6EHvk7q9klPPLcT2oI9hZNp5NikElQptho8ycb4C6p5GFWDa+YOxXP4JosLfB4IMotv
         EfSw==
X-Forwarded-Encrypted: i=1; AJvYcCV3NIsMOCEYGe6tkG67IQ/1WIZNegBWMDsGAbv9ln7sdgQZZSPUxjGjax/QSNlaEtjCapJ5v5ktd2jvrg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy5Ae8FQFVKR5p0qoiWrjGLu/5ra9EiQYGRNmRQ1A4wzBshLQd4
	fgvRKjpD0eV/juDOp1pllT4h2SX+BPODREW7myf+TZT4RqPgzxH34CtZRRSAzzZNb74GvDOdjt8
	Slpvj8KLS89YHTHLL6E+SWJSpyQ2XxSak676k6UTgVQ==
X-Gm-Gg: ASbGnctvvg62kFQsFhyn+SCyRsOHLjPw8VgLuRbXBBqQK0zPhg6IrjHY4s6CXSP7bbo
	lrEH/n3uxeVfAhKecp9WBMKQLW9PcGqtQYyathlgX6VO89nNQszFOKxtZiiRg7eRB6LdJvqDl0R
	XGia7JJVypowY2tTO/MVrI3u5AeAOmwYAixBzhaNUcxj/ptPf4PjF+rHR3ZHgD4eKymq1DGZr56
	KOqjvaY/a9pHcNpiFAe7Gudw0umz/bp6GSf
X-Google-Smtp-Source: AGHT+IHYX7pg60feCJITkUMOxMprgz6P5nDIrUPJazgK/QAWeqrWOagX4EH5hYzH12fx7NdLiTURGQeRt8nyhXDnw20=
X-Received: by 2002:a05:6808:2385:b0:438:23ad:5dbc with SMTP id
 5614622812f47-43fb15cb75cmr1662193b6e.20.1759409857632; Thu, 02 Oct 2025
 05:57:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250911135007.1275833-1-jens.wiklander@linaro.org>
 <20250911135007.1275833-4-jens.wiklander@linaro.org> <20251002-sceptical-goose-of-fame-7b33d6@houat>
In-Reply-To: <20251002-sceptical-goose-of-fame-7b33d6@houat>
From: Jens Wiklander <jens.wiklander@linaro.org>
Date: Thu, 2 Oct 2025 14:57:25 +0200
X-Gm-Features: AS18NWB-MzLg3sZZl_om3Nb3U3T2KFc8NTfBmABGN9BozXUUDdedKeLjWJJE67A
Message-ID: <CAHUa44H3nGgY9q68YRRp5A7Q6Ku3P_URuv+L7H8chYzLAKd8mQ@mail.gmail.com>
Subject: Re: [PATCH v12 3/9] tee: implement protected DMA-heap
To: Maxime Ripard <mripard@redhat.com>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org, 
	op-tee@lists.trustedfirmware.org, linux-arm-kernel@lists.infradead.org, 
	Olivier Masse <olivier.masse@nxp.com>, Thierry Reding <thierry.reding@gmail.com>, 
	Yong Wu <yong.wu@mediatek.com>, Sumit Semwal <sumit.semwal@linaro.org>, 
	Benjamin Gaignard <benjamin.gaignard@collabora.com>, Brian Starkey <Brian.Starkey@arm.com>, 
	John Stultz <jstultz@google.com>, "T . J . Mercier" <tjmercier@google.com>, 
	=?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	Sumit Garg <sumit.garg@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, azarrabi@qti.qualcomm.com, 
	Simona Vetter <simona.vetter@ffwll.ch>, Daniel Stone <daniel@fooishbar.org>, 
	Rouven Czerwinski <rouven.czerwinski@linaro.org>, robin.murphy@arm.com, 
	Sumit Garg <sumit.garg@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Thu, Oct 2, 2025 at 9:54=E2=80=AFAM Maxime Ripard <mripard@redhat.com> w=
rote:
>
> On Thu, Sep 11, 2025 at 03:49:44PM +0200, Jens Wiklander wrote:
> > +static const char *heap_id_2_name(enum tee_dma_heap_id id)
> > +{
> > +     switch (id) {
> > +     case TEE_DMA_HEAP_SECURE_VIDEO_PLAY:
> > +             return "protected,secure-video";
> > +     case TEE_DMA_HEAP_TRUSTED_UI:
> > +             return "protected,trusted-ui";
> > +     case TEE_DMA_HEAP_SECURE_VIDEO_RECORD:
> > +             return "protected,secure-video-record";
> > +     default:
> > +             return NULL;
> > +     }
> > +}
>
> We've recently agreed on a naming guideline (even though it's not merged =
yet)
>
> https://lore.kernel.org/r/20250728-dma-buf-heap-names-doc-v4-1-f73f71cf0d=
fd@kernel.org

I wasn't aware of that (or had forgotten it), but during the revisions
of this patch set, we changed to use "protected".

>
> Secure and trusted should be defined I guess, because secure and
> protected at least seem redundant to me.

Depending on the use case, the protected buffer is only accessible to
a specific set of devices. This is typically configured by the TEE
firmware based on which heap we're using. To distinguish between the
different heaps, I've simply added the name of the use case after the
comma. So the name of the heap for the Trusted-UI use case is
"protected,trusted-ui". What would a heap called "protected,ui"
represent? Protected buffers for a UI use case? What kind of UI use
case? If the name of the heap is too generic, it might cover more than
one use case with conflicting requirements for which devices should be
able to access the protected memory.

Thanks,
Jens

