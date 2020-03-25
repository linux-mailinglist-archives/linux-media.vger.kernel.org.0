Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A3FB9193092
	for <lists+linux-media@lfdr.de>; Wed, 25 Mar 2020 19:43:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727391AbgCYSnW (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 25 Mar 2020 14:43:22 -0400
Received: from mail-wr1-f68.google.com ([209.85.221.68]:36091 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727006AbgCYSnW (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 25 Mar 2020 14:43:22 -0400
Received: by mail-wr1-f68.google.com with SMTP id 31so4552587wrs.3;
        Wed, 25 Mar 2020 11:43:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=7O9ynMa/XszSiQjU9DnfA69BL3KK4uFcPsr5Zfru8hM=;
        b=netoBFLdadXAoh2L96ovXCkEk9G7QhSid9/SVDV3erhTy8xriUACPmZRHgkMG0RerT
         yvbw5JE2FdbT84nNaEJ4UUbVyG6oUJCNswSMmPCPULNvUEdTCBzgjSSjE0ZgoXVYirEz
         QKZ9EGgzvtMlwNvW7i2i9UfbsJnNiZFehh0dSVh6v+FPP1vATUI0TLMyRLgdPndYccR/
         c9TdR1IRgjrObZmVXmRehXBU901ho2hT+LPwzuNvk1MKogbTpulFyl2eGa3Y6PSBxpx+
         OtL2Hn/Js5qUH09Z/cA0fylwu7cUvnNnB29QjMh6qmRG2AXHlwTJT1ynVzmn99lh9qn+
         RPYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=7O9ynMa/XszSiQjU9DnfA69BL3KK4uFcPsr5Zfru8hM=;
        b=SECqYR7KsCpHaZdHdIGjJwvbZG1bpM9qjW4ojM1XlRYg2qvaDODNXbIr8abspUgEtL
         6iV08l/LuePK7Exsatz6LT8csIlf90BJ+34de4iMMBFi7aeObeAv5IGt5Zatxuk4F1+s
         VF8xJO08MCCgCfq2T1FCfAIA0cVL3JSwDkfKS7fAVKkW1fbqsVbv7Lir2LnIkFX9HJx/
         P97hd4X0jD3D7pbwWLcSjlH2giANrq00GRH7C1YEfE+9asGDnuuDqfGLg4lI1mmhCMAF
         gem+KDZK1xAiET+hIPSXHLU+Rzfg9rqCeGTD7aojijYO8SRG9OxViqWgT8GLXjWYq3Tv
         4kJQ==
X-Gm-Message-State: ANhLgQ1fH84z0ZNBZCXOXjeFe2nsl0VIBAOVrLIXaPnA+GbqOaof9/99
        6tVGaKjAVHLPH7ESVpfEH465tvT+f4UieglswoW8xg==
X-Google-Smtp-Source: ADFU+vtotW0hSWfsINdHPqKmskY8pGIuk5Gng3pWSqBKe0+phrdgl8o1zuoQd71BKYd/PsX6PY7UPK+NTvuaTbvqFCE=
X-Received: by 2002:a5d:6187:: with SMTP id j7mr5053880wru.419.1585161798469;
 Wed, 25 Mar 2020 11:43:18 -0700 (PDT)
MIME-Version: 1.0
References: <20200324125442.21983-1-geert+renesas@glider.be>
In-Reply-To: <20200324125442.21983-1-geert+renesas@glider.be>
From:   Alex Deucher <alexdeucher@gmail.com>
Date:   Wed, 25 Mar 2020 14:43:07 -0400
Message-ID: <CADnq5_M+2afonwdY2-8kdzx-_aidWPZ4OxwxRY31odPOJ8togg@mail.gmail.com>
Subject: Re: [PATCH] dma-buf: Improve CONFIG_DMABUF_MOVE_NOTIFY help text
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        Daniel Vetter <daniel.vetter@ffwll.ch>,
        LKML <linux-kernel@vger.kernel.org>,
        Maling list - DRI developers 
        <dri-devel@lists.freedesktop.org>,
        linux-media <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, Mar 24, 2020 at 8:54 AM Geert Uytterhoeven
<geert+renesas@glider.be> wrote:
>
> Improve the help text for the CONFIG_DMABUF_MOVE_NOTIFY symbol by:
>   1. Removing duplicated single quotes,
>   2. Adding a missing subject,
>   3. Fixing a misspelling of "yet",
>   4. Wrapping long lines.
>
> Fixes: bb42df4662a44765 ("dma-buf: add dynamic DMA-buf handling v15")
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Applied.  Thanks!

Alex

> ---
>  drivers/dma-buf/Kconfig | 11 ++++++-----
>  1 file changed, 6 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/dma-buf/Kconfig b/drivers/dma-buf/Kconfig
> index ef73b678419c6d86..9626673f1d83ae64 100644
> --- a/drivers/dma-buf/Kconfig
> +++ b/drivers/dma-buf/Kconfig
> @@ -43,11 +43,12 @@ config DMABUF_MOVE_NOTIFY
>         bool "Move notify between drivers (EXPERIMENTAL)"
>         default n
>         help
> -         Don''t pin buffers if the dynamic DMA-buf interface is available on both the
> -         exporter as well as the importer. This fixes a security problem where
> -         userspace is able to pin unrestricted amounts of memory through DMA-buf.
> -         But marked experimental because we don''t jet have a consistent execution
> -         context and memory management between drivers.
> +         Don't pin buffers if the dynamic DMA-buf interface is available on
> +         both the exporter as well as the importer. This fixes a security
> +         problem where userspace is able to pin unrestricted amounts of memory
> +         through DMA-buf.
> +         This is marked experimental because we don't yet have a consistent
> +         execution context and memory management between drivers.
>
>  config DMABUF_SELFTESTS
>         tristate "Selftests for the dma-buf interfaces"
> --
> 2.17.1
>
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
