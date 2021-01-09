Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0B8602EFD95
	for <lists+linux-media@lfdr.de>; Sat,  9 Jan 2021 04:45:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726077AbhAIDpI (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 8 Jan 2021 22:45:08 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49384 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725906AbhAIDpI (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 8 Jan 2021 22:45:08 -0500
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com [IPv6:2a00:1450:4864:20::12b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F06F9C061573
        for <linux-media@vger.kernel.org>; Fri,  8 Jan 2021 19:44:27 -0800 (PST)
Received: by mail-lf1-x12b.google.com with SMTP id 23so27728990lfg.10
        for <linux-media@vger.kernel.org>; Fri, 08 Jan 2021 19:44:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=HD/4viRtfwM399mGOKfKs0Gn3g0BoLDsv4d+I17dgcw=;
        b=WK8ARnKNiOzvrjlOgn3JOdaq1kaUecOF/7zvSZnDR6+k0sE+pM3XL/wX0NhL8y+LWR
         maEu4/DnDNd6Q2i9XurgxLiK0jbfmB9uFbCEoxVVeYb1zN1XL7wnDdadzZoU54KkrivG
         4PRSAlLJw7a+esJO5ppq5/CXBeqLV1eEbMZFZ1/Qw7KuM3+JQchcDZP2jKK7vLuI90zw
         PHydTkyuaL6mpwSaiNwxIufYaZfiLBkaku5FGAtTxrz6RrGqR1LhkdP58evQ3+y0vvyP
         Ls+yUy3ZjGBlGylO2bUghiCwYk5RLN4GVrYP3mmPGbZOcUrtSFNZW7vKYHpIUS823ySd
         F5pA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=HD/4viRtfwM399mGOKfKs0Gn3g0BoLDsv4d+I17dgcw=;
        b=hgIkmqDaXYjD2yxmOAiayYvXVZjzj1ev+yRi2RGrjnqC9ULGIVVoUsw82qmw6F9Etk
         pfayVD1Q7016ZNSaOYeYLpxqtOYrsQCOO4pfJKGYgaGHf0sAr56zcpn0y5mZANdQfQpn
         G2c33hYB2Z4ruSqjjMV2D8cFyPW+qw/lX5cjQnbuZ5DjqvqRrmax9YEXrehl/kEZ7h3R
         vN4OMqwhRhduFq9FI173ykH6uyM32iMRj6bgvNUo1DZYliz0blg1NfhLBFzpGUEX9Re3
         T77W+GJ1GwPYXOqup7IesILq0AnBoIilQcj9kdw5qfrUbiX9UpjKAxYOhbUQF38EyrOG
         BErw==
X-Gm-Message-State: AOAM533jTNrCsQ+qFc9qZuKZOpq4fPewU5oP5becHjaDrBnTcOq41FiK
        rIes1xMun+pRHv9VD/4+mt/ZeUA9fY3dyL88cAsEQg==
X-Google-Smtp-Source: ABdhPJyZXQilDKeEMaUqBwDSsXwImGMNtYgnwmPGpRArK1E1OR4/l0JkRDIUv/vXuXgmte5xrqEJ1m1RX8xMyQEYtVs=
X-Received: by 2002:a05:6512:61:: with SMTP id i1mr2683474lfo.343.1610163866124;
 Fri, 08 Jan 2021 19:44:26 -0800 (PST)
MIME-Version: 1.0
References: <20210107202616.75170-1-john.stultz@linaro.org>
In-Reply-To: <20210107202616.75170-1-john.stultz@linaro.org>
From:   Sumit Semwal <sumit.semwal@linaro.org>
Date:   Sat, 9 Jan 2021 09:14:14 +0530
Message-ID: <CAO_48GGyAhz_sXe22H6aZSiJQ2sSEgJ=HpaAkOfi-DmVmwvNtw@mail.gmail.com>
Subject: Re: [PATCH] dma-buf: cma_heap: Fix memory leak in CMA heap
To:     John Stultz <john.stultz@linaro.org>
Cc:     lkml <linux-kernel@vger.kernel.org>, Bing Song <bing.song@nxp.com>,
        Liam Mark <lmark@codeaurora.org>,
        Laura Abbott <labbott@kernel.org>,
        Brian Starkey <Brian.Starkey@arm.com>,
        Hridya Valsaraju <hridya@google.com>,
        Suren Baghdasaryan <surenb@google.com>,
        Sandeep Patil <sspatil@google.com>,
        Daniel Mentz <danielmentz@google.com>,
        Chris Goldsworthy <cgoldswo@codeaurora.org>,
        =?UTF-8?Q?=C3=98rjan_Eide?= <orjan.eide@arm.com>,
        Robin Murphy <robin.murphy@arm.com>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Simon Ser <contact@emersion.fr>,
        James Jones <jajones@nvidia.com>,
        "open list:DMA BUFFER SHARING FRAMEWORK" 
        <linux-media@vger.kernel.org>,
        DRI mailing list <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi John,

On Fri, 8 Jan 2021 at 01:56, John Stultz <john.stultz@linaro.org> wrote:
>
> Bing Song noticed the CMA heap was leaking memory due to a flub
> I made in commit a5d2d29e24be ("dma-buf: heaps: Move heap-helper
> logic into the cma_heap implementation"), and provided this fix
> which ensures the pagelist is also freed on release.
Thanks for your patch.
>
> Cc: Bing Song <bing.song@nxp.com>
> Cc: Sumit Semwal <sumit.semwal@linaro.org>
> Cc: Liam Mark <lmark@codeaurora.org>
> Cc: Laura Abbott <labbott@kernel.org>
> Cc: Brian Starkey <Brian.Starkey@arm.com>
> Cc: Hridya Valsaraju <hridya@google.com>
> Cc: Suren Baghdasaryan <surenb@google.com>
> Cc: Sandeep Patil <sspatil@google.com>
> Cc: Daniel Mentz <danielmentz@google.com>
> Cc: Chris Goldsworthy <cgoldswo@codeaurora.org>
> Cc: =C3=98rjan Eide <orjan.eide@arm.com>
> Cc: Robin Murphy <robin.murphy@arm.com>
> Cc: Ezequiel Garcia <ezequiel@collabora.com>
> Cc: Simon Ser <contact@emersion.fr>
> Cc: James Jones <jajones@nvidia.com>
> Cc: linux-media@vger.kernel.org
> Cc: dri-devel@lists.freedesktop.org
> Reported-by: Bing Song <bing.song@nxp.com>
> Fixes: a5d2d29e24be ("dma-buf: heaps: Move heap-helper logic into the cma=
_heap implementation")
> Signed-off-by: John Stultz <john.stultz@linaro.org>

I will queue it up so it gets in the v5.11 cycle.
> ---
>  drivers/dma-buf/heaps/cma_heap.c | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/drivers/dma-buf/heaps/cma_heap.c b/drivers/dma-buf/heaps/cma=
_heap.c
> index 3c4e34301172..364fc2f3e499 100644
> --- a/drivers/dma-buf/heaps/cma_heap.c
> +++ b/drivers/dma-buf/heaps/cma_heap.c
> @@ -251,6 +251,9 @@ static void cma_heap_dma_buf_release(struct dma_buf *=
dmabuf)
>                 buffer->vaddr =3D NULL;
>         }
>
> +       /* free page list */
> +       kfree(buffer->pages);
> +       /* release memory */
>         cma_release(cma_heap->cma, buffer->cma_pages, buffer->pagecount);
>         kfree(buffer);
>  }
> --
> 2.17.1
>
Best,
Sumit.
