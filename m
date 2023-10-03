Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 983347B6C8B
	for <lists+linux-media@lfdr.de>; Tue,  3 Oct 2023 16:59:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238639AbjJCO7r (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 3 Oct 2023 10:59:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35286 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231372AbjJCO7l (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 3 Oct 2023 10:59:41 -0400
Received: from mail-oo1-xc32.google.com (mail-oo1-xc32.google.com [IPv6:2607:f8b0:4864:20::c32])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1B5ACC9
        for <linux-media@vger.kernel.org>; Tue,  3 Oct 2023 07:59:25 -0700 (PDT)
Received: by mail-oo1-xc32.google.com with SMTP id 006d021491bc7-57b8a0f320dso595690eaf.1
        for <linux-media@vger.kernel.org>; Tue, 03 Oct 2023 07:59:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1696345164; x=1696949964; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=paCC2yP2dDTzgPbMIpAziwv1LCMCxhhjgQrwrl1gs1o=;
        b=XR0BKqTdQ+1gv+m+tJjp02By0Zq9DOh0KO0oBVMsLPZDtJErEyMEA7mQeVk4/tra5X
         tTAWQNDbUAZg4VYOlNSDyUAlhGClDDNxJJfPH0FFiC6tRABLBbE80gP1z7ERCSYVXM3S
         XzjYZmK/nGQ798gk88kBTItewdNxNPewnRyyMzc20eh1t7z974tnvI3s3WEyhComqyy3
         7GetT4POPE/3V/YWSvoKC71KK1JmtMfY5g3apdXuCBVJiujwhCwv2LG/UTgWH8Zwuaiq
         EfYG7FWQuVaI18sCkaHK6WlmGA8rb00XmgHXOFhIORJ3Q8Vk5Zxk+No8p5MIxXVP3yDQ
         ZFRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696345164; x=1696949964;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=paCC2yP2dDTzgPbMIpAziwv1LCMCxhhjgQrwrl1gs1o=;
        b=j7z2yRqNKhkjH8C+TjeEw7hGZ/Qc6Own/dHl8MWrqvXbiVfE9xajvnqD6NqZUyQ5c+
         46+S/cVIW74Rk7HwBmBhQ6vgp9M4HswQpRveaSrz+8pSLVbL4ey2FWffAHy7oRTLsaIP
         9m/SARW92QQzMpO0ULslFVWZmxu9TAgU2C1eajQ1TR3nze89M2ECM/IQU9btTLYHRnGo
         f7KHMRmZeSdMJR8ectO4aqcx8ZTitwSF1J1M84XobI0DyoZzIHnl2w+WsnMiohqlQ4WV
         M+VjnzRftPpboe90dt/TaWoztY6XTDAG4rYcJ3KcMO115KpV8p/blMcDjUnXVXMHwXQz
         IX9Q==
X-Gm-Message-State: AOJu0YwbZQnSJcs1VZz/dfeTJuQGkXzmECZ3Ey24rlN7RrEAkbZoq5u1
        eO+U3adiL+3qdOY/CIhLswQAevYGWMES/2vTOXtByQ==
X-Google-Smtp-Source: AGHT+IEC/Kn3ElM9sRc8RziFnK7dG4Mz8Mu+9fXziWBkbOanl/IOsnZjGUYnuFHW5isQpUi/P4sO/SVenJA9KUgaiWk=
X-Received: by 2002:a05:6358:2822:b0:143:8f7f:9150 with SMTP id
 k34-20020a056358282200b001438f7f9150mr14957693rwb.13.1696345163992; Tue, 03
 Oct 2023 07:59:23 -0700 (PDT)
MIME-Version: 1.0
References: <bc145167-0471-4ab3-935c-aa5dc20e342a@moroto.mountain>
 <CABdmKX1PsCcRpsnUgwoS9yMhCXcin1bQt6D+N0b2mHP93cmX-A@mail.gmail.com> <04ea5706-7373-48c4-a93e-e69c50816a0b@kadam.mountain>
In-Reply-To: <04ea5706-7373-48c4-a93e-e69c50816a0b@kadam.mountain>
From:   "T.J. Mercier" <tjmercier@google.com>
Date:   Tue, 3 Oct 2023 07:59:12 -0700
Message-ID: <CABdmKX3dg70gMnzmxOGHOM3ZucE6jFAFpskLShFNxE=g=LBy0g@mail.gmail.com>
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

On Tue, Oct 3, 2023 at 1:30=E2=80=AFAM Dan Carpenter <dan.carpenter@linaro.=
org> wrote:
>
> On Mon, Oct 02, 2023 at 10:16:24AM -0700, T.J. Mercier wrote:
> > On Mon, Oct 2, 2023 at 12:04=E2=80=AFAM Dan Carpenter <dan.carpenter@li=
naro.org> wrote:
> > >
> > > The buffer->pages[] has "buffer->pagecount" elements so this > compar=
ison
> > > has to be changed to >=3D to avoid reading beyond the end of the arra=
y.
> > > The buffer->pages[] array is allocated in cma_heap_allocate().
> > >
> > > Fixes: a5d2d29e24be ("dma-buf: heaps: Move heap-helper logic into the=
 cma_heap implementation")
> > > Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> > > ---
> > >  drivers/dma-buf/heaps/cma_heap.c | 2 +-
> > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > >
> > > diff --git a/drivers/dma-buf/heaps/cma_heap.c b/drivers/dma-buf/heaps=
/cma_heap.c
> > > index ee899f8e6721..bea7e574f916 100644
> > > --- a/drivers/dma-buf/heaps/cma_heap.c
> > > +++ b/drivers/dma-buf/heaps/cma_heap.c
> > > @@ -165,7 +165,7 @@ static vm_fault_t cma_heap_vm_fault(struct vm_fau=
lt *vmf)
> > >         struct vm_area_struct *vma =3D vmf->vma;
> > >         struct cma_heap_buffer *buffer =3D vma->vm_private_data;
> > >
> > > -       if (vmf->pgoff > buffer->pagecount)
> > > +       if (vmf->pgoff >=3D buffer->pagecount)
> > >                 return VM_FAULT_SIGBUS;
> > >
> > Hi Dan,
> >
> > Your fix looks correct to me, but I'm curious if you observed this
> > problem on a device? The mmap in dma-buf.c looks like it prevents
> > creating a mapping that is too large, and I think an access beyond the
> > VMA should segfault before reaching here.
>
> This is from static analysis and not from testing.  You could be correct
> that this bug can't affect real life.
>
> regards,
> dan carpenter

Ok, thanks Dan.

Reviewed-by: T.J. Mercier <tjmercier@google.com>
