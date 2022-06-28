Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 171C755E242
	for <lists+linux-media@lfdr.de>; Tue, 28 Jun 2022 15:35:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344602AbiF1JtY (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 28 Jun 2022 05:49:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39408 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344508AbiF1Js6 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 28 Jun 2022 05:48:58 -0400
Received: from mail-yb1-xb30.google.com (mail-yb1-xb30.google.com [IPv6:2607:f8b0:4864:20::b30])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 75A1D2A40F
        for <linux-media@vger.kernel.org>; Tue, 28 Jun 2022 02:48:47 -0700 (PDT)
Received: by mail-yb1-xb30.google.com with SMTP id i15so21363433ybp.1
        for <linux-media@vger.kernel.org>; Tue, 28 Jun 2022 02:48:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=nnzSecJwwLdHdpah55TWOev8stQAWT9vGpRIkDipvhw=;
        b=I7H7zqGdOfwwpsDfe9uF8VojqU+qtuDQRgt7FtGBoFlVFCSJN9YFG+1NWGSiIuox8S
         W+KTN+aOhO/ktobsqKb4feN5yBBDNx0wm/w13zu9GE1MpTeJ9BkKCl/bKqoxTj+butyG
         02/IG1kxsMpY40YD0RA6epXortCUPMP7sMFf2G2KAsGaM15F0G20pAiOcgk96rxpR8ke
         4UAfgPRBQGXYCKfOAsUeqXv2EnFCWpyg0H2uCQj9u81Sa+kwI5qveTjwZLSeOF0LEPCz
         orDz4fOkku7jaCsorv9stb6v1uGkuYXGTaB+8k6Pjso/QtNIucekoLsh+TNJkKdQ3yXO
         +FxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=nnzSecJwwLdHdpah55TWOev8stQAWT9vGpRIkDipvhw=;
        b=GsBGa+2E6uahI107ichxj+xP+xJxHJ9Ss6wAj66kVQ0IqPwZY6EzdfOIYZCtZO2M/p
         8GJgh0Gg5AwajjFK5FpuydW8GzSu0R9WR1Oe50LHmQPhNLj0JSP7k4yvOo4atGPFu5y4
         KDwddo8qJ2Z/sRgdJoo4/UytiwuaWd+sYOSYlbtfuDJtUSD4n+z/jY/N/L31BT3CwIAt
         B81/0ENiaHQDXEIQQ2ViAozomHiFScvUuuv17ablrPxhWqMjwL70fYiBzEAK1yDqs/U7
         /66nHLVj07VQ9iQm78XS7I1/8v8UzrsABl+reODMc6oMy8Vc4XGY5erUlRCf2bmWnsqc
         eY1Q==
X-Gm-Message-State: AJIora9OVv/4E1i+PayndCIYyM3jGoySm8BQj2gak3J6TGmz7AQwlIT1
        M0vCgcBNwtkQ/peRaoqZFpdVQ6xkWVtDAhV3Liy19w==
X-Google-Smtp-Source: AGRyM1vPz47fcquk2IzBhzy+bTY7luIs+lRfkEnNwxblxcyPcZABp99gUxefsLLFGaLceF6zmZkkxVh4KZO10IEsTiQ=
X-Received: by 2002:a05:6902:152:b0:66c:e116:6a7 with SMTP id
 p18-20020a056902015200b0066ce11606a7mr8598779ybh.533.1656409726603; Tue, 28
 Jun 2022 02:48:46 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1656409369.git.mchehab@kernel.org> <687a2e724020d135bc7dfef0ec9010a00ecc0a3a.1656409369.git.mchehab@kernel.org>
In-Reply-To: <687a2e724020d135bc7dfef0ec9010a00ecc0a3a.1656409369.git.mchehab@kernel.org>
From:   Marco Elver <elver@google.com>
Date:   Tue, 28 Jun 2022 11:48:10 +0200
Message-ID: <CANpmjNPbHYKJqFB-qNjPWsLQyk3fWrqfU3qob_E-8KMLrzpCQQ@mail.gmail.com>
Subject: Re: [PATCH 14/22] kfence: fix a kernel-doc parameter
To:     Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Alexander Potapenko <glider@google.com>,
        Dmitry Vyukov <dvyukov@google.com>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        dri-devel@lists.freedesktop.org, kasan-dev@googlegroups.com,
        linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-17.6 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        ENV_AND_HDR_SPF_MATCH,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, 28 Jun 2022 at 11:46, Mauro Carvalho Chehab <mchehab@kernel.org> wrote:
>
> The kernel-doc markup is missing the slab pointer description:
>
>         include/linux/kfence.h:221: warning: Function parameter or member 'slab' not described in '__kfence_obj_info'
>
> Document it.
>
> Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>

Reviewed-by: Marco Elver <elver@google.com>

Thank you.

> ---
>
> To avoid mailbombing on a large number of people, only mailing lists were C/C on the cover.
> See [PATCH 00/22] at: https://lore.kernel.org/all/cover.1656409369.git.mchehab@kernel.org/
>
>  include/linux/kfence.h | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/include/linux/kfence.h b/include/linux/kfence.h
> index 726857a4b680..9c242f4e9fab 100644
> --- a/include/linux/kfence.h
> +++ b/include/linux/kfence.h
> @@ -210,6 +210,7 @@ struct kmem_obj_info;
>   * __kfence_obj_info() - fill kmem_obj_info struct
>   * @kpp: kmem_obj_info to be filled
>   * @object: the object
> + * @slab: pointer to slab
>   *
>   * Return:
>   * * false - not a KFENCE object
> --
> 2.36.1
>
