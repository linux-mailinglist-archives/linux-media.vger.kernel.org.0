Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CC03C2DC5C7
	for <lists+linux-media@lfdr.de>; Wed, 16 Dec 2020 18:58:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728613AbgLPR6d (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 16 Dec 2020 12:58:33 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44356 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728608AbgLPR6c (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 16 Dec 2020 12:58:32 -0500
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com [IPv6:2a00:1450:4864:20::130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 041C9C061794
        for <linux-media@vger.kernel.org>; Wed, 16 Dec 2020 09:57:51 -0800 (PST)
Received: by mail-lf1-x130.google.com with SMTP id l11so50611691lfg.0
        for <linux-media@vger.kernel.org>; Wed, 16 Dec 2020 09:57:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=3ZAA26HLG36Xvu0N7Lw9uUcJ1NvzFfW1dGKLX9h8st0=;
        b=JCF0T0BdODPAh9sgJ0Dbubl6gNI0wTOnfeA1T8bbhNeo4Vdg0ZcFBOsPWNhOsF0Nrb
         1uxgjazlpeN28DWB8onxe+uttiZ4WdgiQF/Z/hkz0JVHGKR8LveLBh3U6msHCD6KzhAE
         Kpo+GSw98uqa7eMuQ4zw7Bkai/n2qV0oPMn3ACiMf9UFrVlUv47zskfzOpBbKST+Tg2i
         xA6/UXlcrTrl3Xj7jEzqmU9/zq4GX81slNt0zdoGXz2DGwVxjt1rz7o+fOTdcHpstuB+
         l8kcyn+4nf19fOG7jXArN0uKS+OAoyWkx28Qo1ZNAQzARyAPJj1YgL1Slows/ghyHmNU
         13fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=3ZAA26HLG36Xvu0N7Lw9uUcJ1NvzFfW1dGKLX9h8st0=;
        b=QgA5sytngbjfee5MKOmeVj+HoDR1d6B2qHGi4A+Rzzk1KQTYES64RJZiMsooORiA59
         p5EPR+tRhCvDWtRAQjAxoHTOKiKUCP0ukP8QnOTiG5d/mVe7Fxnegmw2d/vfs1Nf3fpt
         W5yUgvtcZ4jWNEUAFqUHZ34vToo1f8piCRbDutMKpKlid93xsn/kgZy7/fd660P5DYyB
         Qw6FCoM2TTUz+9aQiv/dwOPicrYtLflF9O+uACCmNozFrq8V22rOY7jifTw76JjQyOGd
         V3bVnibIGsgC4CvuvK9MWRx6I7CbY5qaymiX2iKW0VuSO15isy6WmB0l6BLV3ayqHF4W
         flIQ==
X-Gm-Message-State: AOAM53245a6WBmwD0CyZsfN+dFRK5f0rjDnKL9+V6SVNs2PqXsBMxy6P
        x9zLCBaecj5eayc2zHZ0RVpQPgUDrKyPUke8Imodng==
X-Google-Smtp-Source: ABdhPJw5c3OCJIuoNhHcuvnrQn7/ICbS3gk2kd2nIfl23ui/Q3VovlTktYiHjFn9OPyAOKgVVUNg5KEldFqYcRrHNvQ=
X-Received: by 2002:a19:8c8:: with SMTP id 191mr12977544lfi.492.1608141469335;
 Wed, 16 Dec 2020 09:57:49 -0800 (PST)
MIME-Version: 1.0
References: <20201215235334.GA227480@roeck-us.net> <20201216004931.113505-1-john.stultz@linaro.org>
In-Reply-To: <20201216004931.113505-1-john.stultz@linaro.org>
From:   Sumit Semwal <sumit.semwal@linaro.org>
Date:   Wed, 16 Dec 2020 23:27:37 +0530
Message-ID: <CAO_48GGgK8uAVb7pBvusX8ZkQ1B0op4PmqYt7246ZH62aM7J8A@mail.gmail.com>
Subject: Re: [PATCH] dma-buf: cma_heap: Include linux/vmalloc.h to fix build
 failures on MIPS
To:     John Stultz <john.stultz@linaro.org>
Cc:     lkml <linux-kernel@vger.kernel.org>,
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


On Wed, 16 Dec 2020 at 06:19, John Stultz <john.stultz@linaro.org> wrote:
>
> We need to include <linux/vmalloc.h> in order for MIPS to find
> vmap(), as it doesn't otherwise get included there.
>
> Without this patch, one can hit the following build error:
>   drivers/dma-buf/heaps/cma_heap.c: In function 'cma_heap_do_vmap':
>   drivers/dma-buf/heaps/cma_heap.c:195:10: error: implicit declaration of=
 function 'vmap'

Thanks for the patch; I've merged it to drm-misc-next-fixes.

>
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
> Fixes: a5d2d29e24be ("dma-buf: heaps: Move heap-helper logic into the cma=
_heap implementation")
> Reported-by: Guenter Roeck <linux@roeck-us.net>
> Signed-off-by: John Stultz <john.stultz@linaro.org>
> ---
>  drivers/dma-buf/heaps/cma_heap.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/dma-buf/heaps/cma_heap.c b/drivers/dma-buf/heaps/cma=
_heap.c
> index 5e7c3436310c..3c4e34301172 100644
> --- a/drivers/dma-buf/heaps/cma_heap.c
> +++ b/drivers/dma-buf/heaps/cma_heap.c
> @@ -20,6 +20,7 @@
>  #include <linux/module.h>
>  #include <linux/scatterlist.h>
>  #include <linux/slab.h>
> +#include <linux/vmalloc.h>
>
>
>  struct cma_heap {
> --
> 2.17.1
>
Best,
Sumit.
