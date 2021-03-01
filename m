Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 28700327C18
	for <lists+linux-media@lfdr.de>; Mon,  1 Mar 2021 11:29:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234291AbhCAK2G (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 1 Mar 2021 05:28:06 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43542 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234284AbhCAK0z (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 1 Mar 2021 05:26:55 -0500
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com [IPv6:2a00:1450:4864:20::633])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 33DD0C061786
        for <linux-media@vger.kernel.org>; Mon,  1 Mar 2021 02:26:15 -0800 (PST)
Received: by mail-ej1-x633.google.com with SMTP id g5so27235274ejt.2
        for <linux-media@vger.kernel.org>; Mon, 01 Mar 2021 02:26:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=CYgM1id2R9zJf1hAsjLZUpdxdqZwVIb1y9Uy/sRW0so=;
        b=CqxH24y/MrPZHHCE5raF4mqb78avr5nCEtykSXmHyTa/LYFNhP+XnA02Py1yA6JA7y
         +iHmBjFq4xV1APtK2uXFFrkF7te1zdNEAbWJgKxlMn9SvDZWP/9N+OxDNbA4hWGnC9Qu
         35dCWeLietcgJzR8A7YZX4vBp/gqpgVyWE0qY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=CYgM1id2R9zJf1hAsjLZUpdxdqZwVIb1y9Uy/sRW0so=;
        b=TwHSoI4HvWyKSyP4iXtSK7xQ0Df/We70ghk/LfA7fTsEkM/F2Z4ctCta+Zx2/8LocG
         tFZBiOlRnr9UspwEQ0l0Dzv9y7HTXlP5+3bqbwe0qM9kKV2TqChNLy1O7JSc6HE5Fpmv
         s5Ew5ezTKXZSRGZjJY6eBvuQAzhmUmI0NGWhnJ3b/tZnZV4doWlUNcHeDMajigzbmsXF
         OywjZUr8S48UagP0gu+leyk8/5+n0wd1cbb4idxGKtHxorWSO641/0Gfpta6sq5gmQTe
         aOnUnlfFQYY8DE610FYmzrEQ3fIkpxk+rdpzkWyQj6mxKE/nsHuBbJfZovqm2CSYQ0pn
         9B6w==
X-Gm-Message-State: AOAM532t89VJZWx+gNh4RpCzEIdXb+jizyF6QzLgdzt0hBCdzby699OL
        VQFR7qr+M3pCOlaf2G4na2Yz02yb78yhDw==
X-Google-Smtp-Source: ABdhPJx43S02oySKjdnt0tPL4BxoFRKqe+2JGLmCqY55M3zUdfHSmNBoEja28Hr2gigPqWJ+QxeZaQ==
X-Received: by 2002:a17:906:d787:: with SMTP id pj7mr8854427ejb.257.1614594373649;
        Mon, 01 Mar 2021 02:26:13 -0800 (PST)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com. [209.85.128.52])
        by smtp.gmail.com with ESMTPSA id u17sm14713518edr.0.2021.03.01.02.26.12
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 01 Mar 2021 02:26:13 -0800 (PST)
Received: by mail-wm1-f52.google.com with SMTP id o16so13917503wmh.0
        for <linux-media@vger.kernel.org>; Mon, 01 Mar 2021 02:26:12 -0800 (PST)
X-Received: by 2002:a7b:c119:: with SMTP id w25mr14771835wmi.127.1614594372464;
 Mon, 01 Mar 2021 02:26:12 -0800 (PST)
MIME-Version: 1.0
References: <20201214125703.866998-1-acourbot@chromium.org>
 <5319c101-f4a4-9c99-b15d-4999366f7a63@linaro.org> <CAAFQd5AQ8VHiRYkzkd5ZJBPT5_5WO0tyQrwqBEfnMVKYiTugTA@mail.gmail.com>
 <b5d35bbd-ae50-7a09-9edf-ca23d1a4b168@linaro.org> <bc42c936d7a67609b9dc4212b5a34b0d761676ed.camel@ndufresne.ca>
 <CAAFQd5BQv2vu_FSxJjVZLpgcuFi1WHVem_O-0x-vkG1KZJi0eA@mail.gmail.com>
 <CAAFQd5BAT2Xe+_swAe+hMqm_cQVbWJUzkH3dS+8-QHknV=KTjw@mail.gmail.com> <b62575fd-7aac-57fe-b6f7-cf1e94f909f2@linaro.org>
In-Reply-To: <b62575fd-7aac-57fe-b6f7-cf1e94f909f2@linaro.org>
From:   Tomasz Figa <tfiga@chromium.org>
Date:   Mon, 1 Mar 2021 19:26:01 +0900
X-Gmail-Original-Message-ID: <CAAFQd5DYtmWna91HYYJP_8_xEGm9faggM7ejPC7sbbPso=xvow@mail.gmail.com>
Message-ID: <CAAFQd5DYtmWna91HYYJP_8_xEGm9faggM7ejPC7sbbPso=xvow@mail.gmail.com>
Subject: Re: [PATCH] media: venus: use contig vb2 ops
To:     Stanimir Varbanov <stanimir.varbanov@linaro.org>
Cc:     Alexandre Courbot <acourbot@chromium.org>,
        Fritz Koenig <frkoenig@chromium.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Nicolas Dufresne <nicolas@ndufresne.ca>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Robin Murphy <robin.murphy@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, Mar 1, 2021 at 7:22 PM Stanimir Varbanov
<stanimir.varbanov@linaro.org> wrote:
>
>
>
> On 3/1/21 11:23 AM, Tomasz Figa wrote:
> > Hi Alex, Stanimir,
> >
> > On Wed, Dec 16, 2020 at 12:15 PM Tomasz Figa <tfiga@chromium.org> wrote=
:
> >>
> >> On Wed, Dec 16, 2020 at 4:21 AM Nicolas Dufresne <nicolas@ndufresne.ca=
> wrote:
> >>>
> >>> Le mardi 15 d=C3=A9cembre 2020 =C3=A0 15:54 +0200, Stanimir Varbanov =
a =C3=A9crit :
> >>>> Hi Tomasz,
> >>>>
> >>>> On 12/15/20 1:47 PM, Tomasz Figa wrote:
> >>>>> On Tue, Dec 15, 2020 at 8:16 PM Stanimir Varbanov
> >>>>> <stanimir.varbanov@linaro.org> wrote:
> >>>>>>
> >>>>>> Hi,
> >>>>>>
> >>>>>> Cc: Robin
> >>>>>>
> >>>>>> On 12/14/20 2:57 PM, Alexandre Courbot wrote:
> >>>>>>> This driver uses the SG vb2 ops, but effectively only ever access=
es the
> >>>>>>> first entry of the SG table, indicating that it expects a flat la=
yout.
> >>>>>>> Switch it to use the contiguous ops to make sure this expected in=
variant
> >>>>>>
> >>>>>> Under what circumstances the sg table will has nents > 1? I came d=
own to
> >>>>>> [1] but not sure I got it right.
> >>>>>>
> >>>>>> I'm afraid that for systems with low amount of system memory and w=
hen
> >>>>>> the memory become fragmented, the driver will not work. That's why=
 I
> >>>>>> started with sg allocator.
> >>>>>
> >>>>> It is exactly the opposite. The vb2-dma-contig allocator is "contig=
"
> >>>>> in terms of the DMA (aka IOVA) address space. In other words, it
> >>>>> guarantees that having one DMA address and length fully describes t=
he
> >>>>
> >>>> Ahh, I missed that part. Looks like I misunderstood videobu2 contig
> >>>> allocator.
> >>>
> >>> I'm learning everyday too, but I'm surprised I don't see a call to
> >>> vb2_dma_contig_set_max_seg_size() in this driver (I could also just h=
ave missed
> >>> a patch when overlooking this thread) ?
> >>>
> >>> The reason I'm asking, doc says it should be called by driver support=
ing IOMMU,
> >>> which seems to be the case for such drivers (MFC, exynos4-is, exynos-=
gsc, mtk-
> >>> mdp, s5p-g2d, hantro, rkvdec, zoran, ti-vpe, ..). I posting it, worst=
 case it's
> >>> all covered and we are good, otherwise perhaps a downstream patch did=
n't make it
> >>> ?
> >>>
> >>> /**
> >>>  * vb2_dma_contig_set_max_seg_size() - configure DMA max segment size
> >>>  * @dev:        device for configuring DMA parameters
> >>>  * @size:       size of DMA max segment size to set
> >>>  *
> >>>  * To allow mapping the scatter-list into a single chunk in the DMA
> >>>  * address space, the device is required to have the DMA max segment
> >>>  * size parameter set to a value larger than the buffer size. Otherwi=
se,
> >>>  * the DMA-mapping subsystem will split the mapping into max segment
> >>>  * size chunks. This function sets the DMA max segment size
> >>>  * parameter to let DMA-mapping map a buffer as a single chunk in DMA
> >>>  * address space.
> >>>  * This code assumes that the DMA-mapping subsystem will merge all
> >>>  * scatterlist segments if this is really possible (for example when
> >>>  * an IOMMU is available and enabled).
> >>>  * Ideally, this parameter should be set by the generic bus code, but=
 it
> >>>  * is left with the default 64KiB value due to historical litmiations=
 in
> >>>  * other subsystems (like limited USB host drivers) and there no good
> >>>  * place to set it to the proper value.
> >>>  * This function should be called from the drivers, which are known t=
o
> >>>  * operate on platforms with IOMMU and provide access to shared buffe=
rs
> >>>  * (either USERPTR or DMABUF). This should be done before initializin=
g
> >>>  * videobuf2 queue.
> >>>  */
> >>
> >> It does call dma_set_max_seg_size() directly:
> >> https://elixir.bootlin.com/linux/latest/source/drivers/media/platform/=
qcom/venus/core.c#L230
> >>
> >> Actually, why do we even need a vb2 helper for this?
> >>
> >
> > What's the plan for this patch?
>
> It will be part of v5.12.

Great, thanks!
