Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DAE5531D445
	for <lists+linux-media@lfdr.de>; Wed, 17 Feb 2021 04:31:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231145AbhBQDb3 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 16 Feb 2021 22:31:29 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49422 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229763AbhBQDb2 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 16 Feb 2021 22:31:28 -0500
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com [IPv6:2a00:1450:4864:20::22d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F1C23C0613D6
        for <linux-media@vger.kernel.org>; Tue, 16 Feb 2021 19:30:47 -0800 (PST)
Received: by mail-lj1-x22d.google.com with SMTP id v6so14407440ljh.9
        for <linux-media@vger.kernel.org>; Tue, 16 Feb 2021 19:30:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=90upSJkSBaDE94xLVKm4FyJgU7j3Yg9CERdZQjvg9pk=;
        b=xTQH0eT02RBCDqlx4bxESwjBElyyy/ItDV/JxYf/gTxWA6A/GjmR+wYABOFlFwPggP
         q4KMHg40Ghc/1QZXiHUo8W4fxm2Uur/NQBp8LxDgDX9HrMIScIR8VDXkqBHlLAhvC1Rg
         AcJJ5MHkNJwDfUH5XK1op++bPtdYi5fyeq06QKkZuYRzdIAKDhSRvoueMdoC6qfn1qXO
         92rCmedXnhGJhOcyZ4ka8eRb6cvCpXIBb+6P2fR9x7zp35+3UiNXWolQ5JWwXzesCW1q
         qi1BobVt7v8Trq1J4GjxcRb2q6P587ZgifJc52/3IB0z/Z/Zegv3kzVFHQblhQ8QsmL7
         hHYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=90upSJkSBaDE94xLVKm4FyJgU7j3Yg9CERdZQjvg9pk=;
        b=tGbXukAFhe4ttXJMrZsMFl1IgqXR1y5hNlCZPm8xRY9sq2vJQBILYVQCAL7Lwrkgik
         XRebakEXA4H3rgjCZN8UfaZi6cRab8pS0KEbB8cOFF2uDoyxSHEKDyFCHy68xx6hKSvf
         C2exe/+OID7Pqs+VwiCScDaiqpDJnIYTgSUMe7gqFTT2SuAwE4qqV0Bqrq0eMUCNFD+o
         YkayHTNvPFexNashCqI3KZZ2qZWScmRfHPSCUQtUmFpXS+aQJQ170PqjfCQjbkF5RGe5
         3+/I7+6jtUFNZZeveXbqXFoqGWceDydmDqbrDAOdieu4F0JZqKeRdDHGAUeb+NQ9UyNB
         1Pnw==
X-Gm-Message-State: AOAM531QUNKfosHlN2h0Rv9sFviw/OTBW3Gwo/1IJ7gDHzKht+vOY3yA
        TJ0oGMY9NQbNpNSK2lRiPQOpvqcQJ24zVfnXxRS/fi/nNMGzUQ==
X-Google-Smtp-Source: ABdhPJzv2bDGbeQ9djCtCiGwF7qL6JmCTWoZF/qHKXTj2cfs/nJVH6vMAR95/8KdPBQwsJ0jWK+uDckhngls20ZhHCc=
X-Received: by 2002:a2e:5356:: with SMTP id t22mr13942820ljd.257.1613532646388;
 Tue, 16 Feb 2021 19:30:46 -0800 (PST)
MIME-Version: 1.0
References: <20210113140604.3615437-1-daniel.vetter@ffwll.ch>
In-Reply-To: <20210113140604.3615437-1-daniel.vetter@ffwll.ch>
From:   John Stultz <john.stultz@linaro.org>
Date:   Tue, 16 Feb 2021 19:30:34 -0800
Message-ID: <CALAqxLWqgLXxry8FhVSK9xC2geiPOA+fTdC-oRENS9iG5AJz=A@mail.gmail.com>
Subject: Re: [PATCH] drm-buf: Add debug option
To:     Daniel Vetter <daniel.vetter@ffwll.ch>
Cc:     DRI Development <dri-devel@lists.freedesktop.org>,
        Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
        "moderated list:DMA BUFFER SHARING FRAMEWORK" 
        <linaro-mm-sig@lists.linaro.org>,
        David Stevens <stevensd@chromium.org>,
        Daniel Vetter <daniel.vetter@intel.com>,
        =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
        linux-media <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, Jan 13, 2021 at 6:06 AM Daniel Vetter <daniel.vetter@ffwll.ch> wrot=
e:
>
> We have too many people abusing the struct page they can get at but
> really shouldn't in importers. Aside from that the backing page might
> simply not exist (for dynamic p2p mappings) looking at it and using it
> e.g. for mmap can also wreak the page handling of the exporter
> completely. Importers really must go through the proper interface like
> dma_buf_mmap for everything.
>
> Just an RFC to see whether this idea has some stickiness. default y
> for now to make sure intel-gfx-ci picks it up too.
>
> I'm semi-tempted to enforce this for dynamic importers since those
> really have no excuse at all to break the rules.
>
> Unfortuantely we can't store the right pointers somewhere safe to make
> sure we oops on something recognizable, so best is to just wrangle
> them a bit by flipping all the bits. At least on x86 kernel addresses
> have all their high bits sets and the struct page array is fairly low
> in the kernel mapping, so flipping all the bits gives us a very high
> pointer in userspace and hence excellent chances for an invalid
> dereference.
>
> Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> Cc: Sumit Semwal <sumit.semwal@linaro.org>
> Cc: "Christian K=C3=B6nig" <christian.koenig@amd.com>
> Cc: David Stevens <stevensd@chromium.org>
> Cc: linux-media@vger.kernel.org
> Cc: linaro-mm-sig@lists.linaro.org
> ---
>  drivers/dma-buf/Kconfig   |  8 +++++++
>  drivers/dma-buf/dma-buf.c | 49 +++++++++++++++++++++++++++++++++++----
>  2 files changed, 53 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/dma-buf/Kconfig b/drivers/dma-buf/Kconfig
> index 4f8224a6ac95..cddb549e5e59 100644
> --- a/drivers/dma-buf/Kconfig
> +++ b/drivers/dma-buf/Kconfig
> @@ -50,6 +50,14 @@ config DMABUF_MOVE_NOTIFY
>           This is marked experimental because we don't yet have a consist=
ent
>           execution context and memory management between drivers.
>
> +config DMABUF_DEBUG
> +       bool "DMA-BUF debug checks"
> +       default y
> +       help
> +         This option enables additional checks for DMA-BUF importers and
> +         exporters. Specifically it validates that importers do not peek=
 at the
> +         underlying struct page when they import a buffer.
> +
>  config DMABUF_SELFTESTS
>         tristate "Selftests for the dma-buf interfaces"
>         default n
> diff --git a/drivers/dma-buf/dma-buf.c b/drivers/dma-buf/dma-buf.c
> index 1c9bd51db110..6e4725f7dfde 100644
> --- a/drivers/dma-buf/dma-buf.c
> +++ b/drivers/dma-buf/dma-buf.c
> @@ -666,6 +666,30 @@ void dma_buf_put(struct dma_buf *dmabuf)
>  }
>  EXPORT_SYMBOL_GPL(dma_buf_put);
>
> +static struct sg_table * __map_dma_buf(struct dma_buf_attachment *attach=
,
> +                                      enum dma_data_direction direction)
> +{
> +       struct sg_table *sg_table;
> +
> +       sg_table =3D attach->dmabuf->ops->map_dma_buf(attach, direction);
> +
> +#if CONFIG_DMABUF_DEBUG


Hey Daniel,
  I just noticed a build warning in a tree I pulled this patch into.
You probably want to use #ifdef here, as if its not defined we see:
drivers/dma-buf/dma-buf.c:813:5: warning: "CONFIG_DMABUF_DEBUG" is not
defined, evaluates to 0 [-Wundef]

thanks
-john
