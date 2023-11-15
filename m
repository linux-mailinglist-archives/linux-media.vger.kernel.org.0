Return-Path: <linux-media+bounces-409-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 770487ED699
	for <lists+linux-media@lfdr.de>; Wed, 15 Nov 2023 23:02:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 311702814AF
	for <lists+linux-media@lfdr.de>; Wed, 15 Nov 2023 22:02:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5C3E6446C4;
	Wed, 15 Nov 2023 22:02:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="sxgBdC5H"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pl1-x635.google.com (mail-pl1-x635.google.com [IPv6:2607:f8b0:4864:20::635])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 92F0F1A4
	for <linux-media@vger.kernel.org>; Wed, 15 Nov 2023 14:02:17 -0800 (PST)
Received: by mail-pl1-x635.google.com with SMTP id d9443c01a7336-1cc209561c3so48195ad.0
        for <linux-media@vger.kernel.org>; Wed, 15 Nov 2023 14:02:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1700085737; x=1700690537; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JuZvFHzKeqbg6jXEYOC+etK401rPBU1DU0zLZUwkdow=;
        b=sxgBdC5HQ3kZkiv5KXeRWfdoecOm7BeBoruDDM69bAn8ZvCYN/gvJdmxWZjiBoNgXE
         2EXf/qBs6IX4OifiVA0V+Kr3WKDF+xbi26x+6B1PeFaMPKRDl0uGPLadCXJyGTsij1KQ
         /JhbqavPLYQs+kHrFiaueUry+YqwzWz6eEQZl81d9MICcFxRWtTaWlehLqXlHHgfdRC7
         NsmOpieFe0qH7Vu+w4cGxXfXWFxBw4SIpEEcNy6/b2AsEui4GsNl2xceFhT+OlCOQtx/
         neBwrmXLktMcPqhXaW67k/8nUQQ03xp0diUww/e5DtzybWO2MhGUFUm1SxFJGwwHgLNe
         C0Wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700085737; x=1700690537;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JuZvFHzKeqbg6jXEYOC+etK401rPBU1DU0zLZUwkdow=;
        b=cWoB2XSW+2r2VOiHRao3/7uMAH3hl0+bIItQ6553gDMPgzd3vLgjLb7gr3g24lHj5Q
         coK3JNGbbnBj/Bev8ZV8T6BOwrNpPC0p8kwQ6PvCJxlgk+AILLgo7S3ah+zVRFOYkn3d
         KGNuMZpMOsZt0k9wtOjGDkTd+swv5DS/iaVOgUhcf1lT8a15yhjgVi9ozBiuDBFR6bRV
         xl2SyIOeeAaVmRuVnkS+EjnmSVLkMFTAVsa1UJSxWAMhgoddr6qkyzAovT5KWQrYb4hO
         fT0ohjT/EECWSkcwrmx8IGvzbG4Q0EiTurQOj6Oe9EPEtV2WTNbQz4taTdA9uwoPBplA
         S+Ig==
X-Gm-Message-State: AOJu0YyeikfMZXLs/XWL4KBIseBam+ehY7RBgrvbfNWwDq7eK2Pg8A2Y
	gQt2MWCXmQixmau1IbN6S4oZP1QfR50gfbnDe/ix
X-Google-Smtp-Source: AGHT+IFRrz+wFMxIvQfSahyfIBqJGBGy54Oa9WJpbdDj3Indo4j6kQ+gLppqjmS9wzYszPzrga5jiO2H91ugbxFInwY=
X-Received: by 2002:a17:902:d506:b0:1c7:25e4:a9d5 with SMTP id
 b6-20020a170902d50600b001c725e4a9d5mr45085plg.17.1700085736744; Wed, 15 Nov
 2023 14:02:16 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231111111559.8218-1-yong.wu@mediatek.com> <ZU/V2XX71GbaV6Q8@duo.ucw.cz>
In-Reply-To: <ZU/V2XX71GbaV6Q8@duo.ucw.cz>
From: Jeffrey Kardatzke <jkardatzke@google.com>
Date: Wed, 15 Nov 2023 14:02:05 -0800
Message-ID: <CA+ddPcNd20Bg_pYWqty90NafwC54dz0LGEmTMpia5_7e4=N-cg@mail.gmail.com>
Subject: Re: [PATCH v2 0/8] dma-buf: heaps: Add secure heap
To: Pavel Machek <pavel@ucw.cz>
Cc: Yong Wu <yong.wu@mediatek.com>, Rob Herring <robh+dt@kernel.org>, 
	Sumit Semwal <sumit.semwal@linaro.org>, christian.koenig@amd.com, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Benjamin Gaignard <benjamin.gaignard@collabora.com>, Brian Starkey <Brian.Starkey@arm.com>, 
	John Stultz <jstultz@google.com>, tjmercier@google.com, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	jianjiao.zeng@mediatek.com, kuohong.wang@mediatek.com, 
	Vijayanand Jitta <quic_vjitta@quicinc.com>, Joakim Bech <joakim.bech@linaro.org>, 
	Nicolas Dufresne <nicolas@ndufresne.ca>, ckoenig.leichtzumerken@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

The main goal is for secure video playback, and to also enable other
potential uses of this in the future. The 'secure dma-heap' will be
used to allocate dma_buf objects that reference memory in the secure
world that is inaccessible/unmappable by the non-secure (i.e.
kernel/userspace) world.  That memory will be used by the secure world
to store secure information (i.e. decrypted media content). The
dma_bufs allocated from the kernel will be passed to V4L2 for video
decoding (as input and output). They will also be used by the drm
system for rendering of the content.

Hope that helps.

Cheers,
Jeff

On Mon, Nov 13, 2023 at 3:38=E2=80=AFAM Pavel Machek <pavel@ucw.cz> wrote:
>
> Hi!
>
> > This patchset adds three secure heaps:
> > 1) secure_mtk_cm: secure chunk memory for MediaTek SVP (Secure Video Pa=
th).
> >    The buffer is reserved for the secure world after bootup and it is u=
sed
> >    for vcodec's ES/working buffer;
> > 2) secure_mtk_cma: secure CMA memory for MediaTek SVP. This buffer is
> >    dynamically reserved for the secure world and will be got when we st=
art
> >    playing secure videos, Once the security video playing is complete, =
the
> >    CMA will be released. This heap is used for the vcodec's frame buffe=
r.
> > 3) secure_cma: Use the kerne CMA ops as the allocation ops.
> >    currently it is a draft version for Vijay and Jaskaran.
>
> Is there high-level description of what the security goals here are,
> somewhere?
>
> BR,
>                                                                         P=
avel
> --
> People of Russia, stop Putin before his war on Ukraine escalates.

