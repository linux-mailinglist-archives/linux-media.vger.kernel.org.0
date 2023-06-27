Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8CEEA740396
	for <lists+linux-media@lfdr.de>; Tue, 27 Jun 2023 20:52:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231182AbjF0Swn (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 27 Jun 2023 14:52:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37184 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230229AbjF0Swm (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 27 Jun 2023 14:52:42 -0400
Received: from mail-qt1-x831.google.com (mail-qt1-x831.google.com [IPv6:2607:f8b0:4864:20::831])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4FB471BF9
        for <linux-media@vger.kernel.org>; Tue, 27 Jun 2023 11:52:40 -0700 (PDT)
Received: by mail-qt1-x831.google.com with SMTP id d75a77b69052e-4007b5bafceso46601cf.1
        for <linux-media@vger.kernel.org>; Tue, 27 Jun 2023 11:52:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1687891959; x=1690483959;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XanXoDlHYuqu7WYlucQ21J3KG2JUv31j1KTL+YaYRcw=;
        b=tPrpWdnP56AC15CdynAtlLaMhZcoMrwTEd/uWTCfR3x6ZSk2aQs18un036H4Ui91Mz
         yipTpkAWSSEw3sBbMhjNPTFYagOc2smOlg8be0RQW47nzZtgo+C5Ptfe55oDSxjaSkX0
         idJ5n7fJQSXQxasfFIWbg2LKCscxSP6nA95ZRZt6P+sFiMDn6Y+k3aHiI3giIk0UJOI+
         RsBiyEWPVmLE1yxdaMJ8gPZHKUeeMrjGJJGfIo73hE1hVi5UIcHUAG/2LgLNnAze8rTB
         /iF1/wOik0/z5RMYKefbcBecyhdwgNOoRGVNJZZZCrdwIR3VXSMUnaseQ55GbmLr05Td
         l7VA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687891959; x=1690483959;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XanXoDlHYuqu7WYlucQ21J3KG2JUv31j1KTL+YaYRcw=;
        b=kRqRAgbCzerop6h36opRAchHd9t1TyVJQbb2PC1GA2e489gNIvVnUd6x8Qc1Abm/fa
         vCJAPPkEEYiMVG7+ZI/u4ToZUdmqM0BErsNtmkb17J+n7z/fkH0hsqKTa/CNrZrQEZ3u
         R9jMu6a1QzsQj05aEoPd2SHERJC9vGXD7KmelMciDTaNEz0BPiJnsJj+W+eoBC0OfaLB
         yyYZEziGaiF4BtS5o0IW6UeJXrmSXOPRilVwLs8tQeM0CXdNM3XWtcdY67Do6a6t1oe/
         VEYoPzw33ZkZItMfCA53Wf3L77N4ity43E3ARIqZbjUxdekhqtf50PqIabx5dBB1zfI0
         GOzQ==
X-Gm-Message-State: AC+VfDwqIuli/Q+98BSM7RD74MiwyAWP5KXssNcyurRuAjhx4PWiqLwF
        4DdjTZphRiIBzyMzg6MRlQqaRQSw0CYO7uGuu6Rn
X-Google-Smtp-Source: ACHHUZ5dfRe4sjCsi1avwvjKJ8EPuqVzC75vPw7U/LlRFR2FRvQRAfeRSfejLqd26KQk3zITWlc71jc5mXyGnWmKbCs=
X-Received: by 2002:ac8:5905:0:b0:3f8:5b2:aef0 with SMTP id
 5-20020ac85905000000b003f805b2aef0mr19156qty.24.1687891959197; Tue, 27 Jun
 2023 11:52:39 -0700 (PDT)
MIME-Version: 1.0
References: <20230627144339.144478-1-Julia.Lawall@inria.fr> <20230627144339.144478-7-Julia.Lawall@inria.fr>
In-Reply-To: <20230627144339.144478-7-Julia.Lawall@inria.fr>
From:   John Stultz <jstultz@google.com>
Date:   Tue, 27 Jun 2023 11:52:27 -0700
Message-ID: <CANDhNCrPHJjDwGLMY_p8Z21bCnBvTzQmztYqRykTBD9t-+mbcQ@mail.gmail.com>
Subject: Re: [PATCH v2 06/24] dma-buf: system_heap: use vmalloc_array and vcalloc
To:     Julia Lawall <Julia.Lawall@inria.fr>
Cc:     Sumit Semwal <sumit.semwal@linaro.org>,
        kernel-janitors@vger.kernel.org, keescook@chromium.org,
        christophe.jaillet@wanadoo.fr, kuba@kernel.org,
        Benjamin Gaignard <benjamin.gaignard@collabora.com>,
        Liam Mark <lmark@codeaurora.org>,
        Laura Abbott <labbott@redhat.com>,
        Brian Starkey <Brian.Starkey@arm.com>,
        =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
        linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-17.6 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        ENV_AND_HDR_SPF_MATCH,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, Jun 27, 2023 at 7:44=E2=80=AFAM Julia Lawall <Julia.Lawall@inria.fr=
> wrote:
>
> Use vmalloc_array and vcalloc to protect against
> multiplication overflows.
>
> The changes were done using the following Coccinelle
> semantic patch:
>
> // <smpl>
> @initialize:ocaml@
> @@
>
> let rename alloc =3D
>   match alloc with
>     "vmalloc" -> "vmalloc_array"
>   | "vzalloc" -> "vcalloc"
>   | _ -> failwith "unknown"
>
> @@
>     size_t e1,e2;
>     constant C1, C2;
>     expression E1, E2, COUNT, x1, x2, x3;
>     typedef u8;
>     typedef __u8;
>     type t =3D {u8,__u8,char,unsigned char};
>     identifier alloc =3D {vmalloc,vzalloc};
>     fresh identifier realloc =3D script:ocaml(alloc) { rename alloc };
> @@
>
> (
>       alloc(x1*x2*x3)
> |
>       alloc(C1 * C2)
> |
>       alloc((sizeof(t)) * (COUNT), ...)
> |
> -     alloc((e1) * (e2))
> +     realloc(e1, e2)
> |
> -     alloc((e1) * (COUNT))
> +     realloc(COUNT, e1)
> |
> -     alloc((E1) * (E2))
> +     realloc(E1, E2)
> )
> // </smpl>
>
> Signed-off-by: Julia Lawall <Julia.Lawall@inria.fr>
>
> ---
> v2: Use vmalloc_array and vcalloc instead of array_size.
> This also leaves a multiplication of a constant by a sizeof
> as is.  Two patches are thus dropped from the series.
>
>  drivers/dma-buf/heaps/system_heap.c |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff -u -p a/drivers/dma-buf/heaps/system_heap.c b/drivers/dma-buf/heaps/=
system_heap.c
> --- a/drivers/dma-buf/heaps/system_heap.c
> +++ b/drivers/dma-buf/heaps/system_heap.c
> @@ -221,7 +221,7 @@ static void *system_heap_do_vmap(struct
>  {
>         struct sg_table *table =3D &buffer->sg_table;
>         int npages =3D PAGE_ALIGN(buffer->len) / PAGE_SIZE;
> -       struct page **pages =3D vmalloc(sizeof(struct page *) * npages);
> +       struct page **pages =3D vmalloc_array(npages, sizeof(struct page =
*));
>         struct page **tmp =3D pages;
>         struct sg_page_iter piter;
>         void *vaddr;

Seems reasonable. Thanks for sending this out!

Acked-by: John Stultz <jstultz@google.com>

thanks
-john
