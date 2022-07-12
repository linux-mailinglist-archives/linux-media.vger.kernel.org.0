Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 37970571B08
	for <lists+linux-media@lfdr.de>; Tue, 12 Jul 2022 15:21:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231600AbiGLNVD (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 12 Jul 2022 09:21:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35488 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229760AbiGLNVC (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 12 Jul 2022 09:21:02 -0400
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com [IPv6:2a00:1450:4864:20::531])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2F8074D82F
        for <linux-media@vger.kernel.org>; Tue, 12 Jul 2022 06:21:01 -0700 (PDT)
Received: by mail-ed1-x531.google.com with SMTP id r6so10063838edd.7
        for <linux-media@vger.kernel.org>; Tue, 12 Jul 2022 06:21:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=lzZX+A5QVL9QazKD0haBEjpKkR86ZVAetIBUsFsytto=;
        b=hCXsz9bRJuJf0s/Z20noLgz1dGhTSXWYsx6QR11YVNpHS59XmQM1BiJKu5NJnGLMZ8
         EfxqaGbMDqNNL92d1jaQi24zEvZw/l4GQubBiYpFPsVccHWDflP2BMgkulWuy6nMcAfO
         D3K/GPiKZvy20njVnAcEsk9xy62oDquRoK0wgXI+pHqkxBrLfx3au085GlOnxnIZRkzy
         xhyEy9+7HFEBr6ywAOLKFLaUYpWM0jivLbeolObA0m9vAawbBw1QRvlTH3I4c9fV3mSt
         NDzf79hCUWrubOaBzZzyKYipyj6PbF1LPlaaUovrNEfoSsr1rZ8Wo3dud/Ei01vItqoU
         Xtkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=lzZX+A5QVL9QazKD0haBEjpKkR86ZVAetIBUsFsytto=;
        b=rFsUF6pV6+TpBBaktAP8Ke+HkOJK4X/E0BNI9EHtpCOMIeTehRCK+pZ9ER/qM4Ober
         zfuyfrPiNMjWmdiAiXs9jKQUwgA4P45FbYoEkyn+MaNUOyY+9NRH6NYlHcQKllgmpt2D
         wnbe6pI+C8b/vtz1WZBgt2Q9rUQyh8wwMpoZxjE1bm/9iNAS33fM7ghvMq6uv28/R2Am
         QS0QObWzSjNRqMBKekWEPk2upcuYZuBJd1iMdwtP+4nZ6c2L27q5KuKS5OJLAeW3IOlS
         5BSrPVtqBrFrseY2E/3MPJWh+rWc5zsW0KWOAc46D3HaZmUKxgtBLdtmhaAX8pSTI1yQ
         b73g==
X-Gm-Message-State: AJIora8UUZAHuMPQOkOIotnvxmqUVoFkCaHrj/ipcY/t1Q4fMznyd7GV
        NZw6SZDqoGWTBT3mpyjQdetNQzpxScXkpjEtOQE=
X-Google-Smtp-Source: AGRyM1uOvVLhZw39DwdTGXT8YQ+sS0EOX2OdZ/7cJ5fgQFnonHM4r+CJXTsL9IW6uethLnLGFZy6DBGtN+ZEhGOEY70=
X-Received: by 2002:a05:6402:28c3:b0:43a:6d78:1b64 with SMTP id
 ef3-20020a05640228c300b0043a6d781b64mr31223403edb.93.1657632059623; Tue, 12
 Jul 2022 06:20:59 -0700 (PDT)
MIME-Version: 1.0
References: <20220712131201.131475-1-christian.koenig@amd.com>
In-Reply-To: <20220712131201.131475-1-christian.koenig@amd.com>
From:   Alex Deucher <alexdeucher@gmail.com>
Date:   Tue, 12 Jul 2022 09:20:47 -0400
Message-ID: <CADnq5_PSECF0b_ynF=UhXu3Os0hYZcvcQtk1pD+T3q+Z1g-Hgg@mail.gmail.com>
Subject: Re: [Linaro-mm-sig] [PATCH] dma-buf/dma_resv_usage: update explicit
 sync documentation
To:     =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>
Cc:     Sumit Semwal <sumit.semwal@linaro.org>,
        linux-media <linux-media@vger.kernel.org>,
        Maling list - DRI developers 
        <dri-devel@lists.freedesktop.org>,
        "moderated list:DMA BUFFER SHARING FRAMEWORK" 
        <linaro-mm-sig@lists.linaro.org>, Daniel Vetter <daniel@ffwll.ch>,
        Bas Nieuwenhuizen <bas@basnieuwenhuizen.nl>,
        =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, Jul 12, 2022 at 9:12 AM Christian K=C3=B6nig
<ckoenig.leichtzumerken@gmail.com> wrote:
>
> Make it clear that DMA_RESV_USAGE_BOOKMARK can be used for explicit synce=
d

DMA_RESV_USAGE_BOOKKEEP?

> user space submissions as well and document the rules around adding the
> same fence with different usages.
>
> Signed-off-by: Christian K=C3=B6nig <christian.koenig@amd.com>
> ---
>  include/linux/dma-resv.h | 16 +++++++++++++---
>  1 file changed, 13 insertions(+), 3 deletions(-)
>
> diff --git a/include/linux/dma-resv.h b/include/linux/dma-resv.h
> index c8ccbc94d5d2..264e27e56dff 100644
> --- a/include/linux/dma-resv.h
> +++ b/include/linux/dma-resv.h
> @@ -62,6 +62,11 @@ struct dma_resv_list;
>   * For example when asking for WRITE fences then the KERNEL fences are r=
eturned
>   * as well. Similar when asked for READ fences then both WRITE and KERNE=
L
>   * fences are returned as well.
> + *
> + * Already used fences can be promoted in the sense that a fence with
> + * DMA_RESV_USAGE_BOOKMARK could become DMA_RESV_USAGE_READ by adding it=
 again

Same here.

With that fixed,
Acked-by: Alex Deucher <alexander.deucher@amd.com>

Alex

> + * with this usage. But fences can never be degraded in the sense that a=
 fence
> + * with DMA_RESV_USAGE_WRITE could become DMA_RESV_USAGE_READ.
>   */
>  enum dma_resv_usage {
>         /**
> @@ -98,10 +103,15 @@ enum dma_resv_usage {
>          * @DMA_RESV_USAGE_BOOKKEEP: No implicit sync.
>          *
>          * This should be used by submissions which don't want to partici=
pate in
> -        * implicit synchronization.
> +        * any implicit synchronization.
> +        *
> +        * The most common case are preemption fences, page table updates=
, TLB
> +        * flushes as well as explicit synced user submissions.
>          *
> -        * The most common case are preemption fences as well as page tab=
le
> -        * updates and their TLB flushes.
> +        * Explicit synced user user submissions can be promoted to
> +        * DMA_RESV_USAGE_READ or DMA_RESV_USAGE_WRITE as needed using
> +        * dma_buf_import_sync_file() when implicit synchronization shoul=
d
> +        * become necessary after initial adding of the fence.
>          */
>         DMA_RESV_USAGE_BOOKKEEP
>  };
> --
> 2.25.1
>
> _______________________________________________
> Linaro-mm-sig mailing list -- linaro-mm-sig@lists.linaro.org
> To unsubscribe send an email to linaro-mm-sig-leave@lists.linaro.org
