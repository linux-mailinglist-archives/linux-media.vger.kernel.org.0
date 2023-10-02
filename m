Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 266E07B5919
	for <lists+linux-media@lfdr.de>; Mon,  2 Oct 2023 19:42:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238691AbjJBRQl (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 2 Oct 2023 13:16:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34518 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237954AbjJBRQk (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 2 Oct 2023 13:16:40 -0400
Received: from mail-yw1-x112d.google.com (mail-yw1-x112d.google.com [IPv6:2607:f8b0:4864:20::112d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C3B84AD
        for <linux-media@vger.kernel.org>; Mon,  2 Oct 2023 10:16:37 -0700 (PDT)
Received: by mail-yw1-x112d.google.com with SMTP id 00721157ae682-5a1d0fee86aso131574677b3.2
        for <linux-media@vger.kernel.org>; Mon, 02 Oct 2023 10:16:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1696266997; x=1696871797; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=E7Zhp7fexBV0fC94HK3n7XG2/Cz9uGTnvzo3kRDXo4Y=;
        b=a7H/lTltdgcsnEqhzCEboQj8FAxo52Tjt2722Gl/9dDeKNy9lijLx+PmSfTGB5CUiu
         9ffEubwWAXt48KTueo8zSuW4PQzsquUhliuOfDaj6a1liGEvDcOtPHPwUbUtxORjGV3m
         2UzYlwdkuKAn9T6g75G/GYg7rV4ZTBcNmarXBVyJojeX8Zv+UCzOCidizXJmNMbZke+c
         7rWqSTdLjQp0DSCAnS8m0xotGaJPED3RFzNLIoyGXWrVt1OLA+uq0iuwMzQn/TtrOK0g
         siMNP0XOd3zI5p9IlGkpKf9zAv22YXR8XgJJqD/JHwY4d+SnP5YCZPODEDuMedJRsLb+
         lGrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696266997; x=1696871797;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=E7Zhp7fexBV0fC94HK3n7XG2/Cz9uGTnvzo3kRDXo4Y=;
        b=vSUC3EQ2lI2vOTqK7xnZ/tRAGokjJB9rYSykzLsD8qWgN4Kx1N9dWS+DyljX0Uu2sB
         x5n7zW0DX7MY8mJEY8eJAmxtjmcZ8muQLfpUHK5cCM7TidyeNlEd6IPIrQq0xofh4gBX
         cHUUW5dcrb3gBz2bf55W33TuZrRTZ/bEKwjF1f6wYdWzK9JF8y+/Mm5uAZ5ySq9oVdGq
         NyWyNgJaMo9GF7BW8L3PJ7L33rZCB/4aMJkg+T7k9tbNPLb/TkwT2r5SYsZHJlT42Mw8
         V0eWiZyJ0vwHrpWXBURJjPiqM5uqvYP68AskKfPqua4s1BKajBjUGY3yjyRbkar5f7ZR
         ClIw==
X-Gm-Message-State: AOJu0YyulSRq8eG3SUhuQVpBIELPwJJlB4q02MoypyNxc3Cy36V1INfd
        Z4on8glyW1FC/34Vn9CZGqsq7cA1Fr3ViwAv2A1A+g==
X-Google-Smtp-Source: AGHT+IGczrijvRMqUeno/TKgH4xvzytFv3IKeSpkULE/VT0+zPJxHRO0kz92Wya/ACW5S+oE2CZNgPh4TUBkGNL8H1o=
X-Received: by 2002:a0d:d44c:0:b0:586:b686:822c with SMTP id
 w73-20020a0dd44c000000b00586b686822cmr13050234ywd.7.1696266996808; Mon, 02
 Oct 2023 10:16:36 -0700 (PDT)
MIME-Version: 1.0
References: <bc145167-0471-4ab3-935c-aa5dc20e342a@moroto.mountain>
In-Reply-To: <bc145167-0471-4ab3-935c-aa5dc20e342a@moroto.mountain>
From:   "T.J. Mercier" <tjmercier@google.com>
Date:   Mon, 2 Oct 2023 10:16:24 -0700
Message-ID: <CABdmKX1PsCcRpsnUgwoS9yMhCXcin1bQt6D+N0b2mHP93cmX-A@mail.gmail.com>
Subject: Re: [PATCH] dma-buf: heaps: Fix off by one in cma_heap_vm_fault()
To:     Dan Carpenter <dan.carpenter@linaro.org>
Cc:     John Stultz <jstultz@google.com>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        Benjamin Gaignard <benjamin.gaignard@collabora.com>,
        Brian Starkey <Brian.Starkey@arm.com>,
        =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
        linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linaro-mm-sig@lists.linaro.org, kernel-janitors@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-17.6 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        ENV_AND_HDR_SPF_MATCH,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, Oct 2, 2023 at 12:04=E2=80=AFAM Dan Carpenter <dan.carpenter@linaro=
.org> wrote:
>
> The buffer->pages[] has "buffer->pagecount" elements so this > comparison
> has to be changed to >=3D to avoid reading beyond the end of the array.
> The buffer->pages[] array is allocated in cma_heap_allocate().
>
> Fixes: a5d2d29e24be ("dma-buf: heaps: Move heap-helper logic into the cma=
_heap implementation")
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> ---
>  drivers/dma-buf/heaps/cma_heap.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/dma-buf/heaps/cma_heap.c b/drivers/dma-buf/heaps/cma=
_heap.c
> index ee899f8e6721..bea7e574f916 100644
> --- a/drivers/dma-buf/heaps/cma_heap.c
> +++ b/drivers/dma-buf/heaps/cma_heap.c
> @@ -165,7 +165,7 @@ static vm_fault_t cma_heap_vm_fault(struct vm_fault *=
vmf)
>         struct vm_area_struct *vma =3D vmf->vma;
>         struct cma_heap_buffer *buffer =3D vma->vm_private_data;
>
> -       if (vmf->pgoff > buffer->pagecount)
> +       if (vmf->pgoff >=3D buffer->pagecount)
>                 return VM_FAULT_SIGBUS;
>
Hi Dan,

Your fix looks correct to me, but I'm curious if you observed this
problem on a device? The mmap in dma-buf.c looks like it prevents
creating a mapping that is too large, and I think an access beyond the
VMA should segfault before reaching here.

Thanks,
T.J.
