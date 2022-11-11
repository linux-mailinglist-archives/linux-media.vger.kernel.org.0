Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 524CA6251CA
	for <lists+linux-media@lfdr.de>; Fri, 11 Nov 2022 04:40:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232045AbiKKDkC (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 10 Nov 2022 22:40:02 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40216 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231765AbiKKDkB (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 10 Nov 2022 22:40:01 -0500
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com [IPv6:2a00:1450:4864:20::52b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2204718E20
        for <linux-media@vger.kernel.org>; Thu, 10 Nov 2022 19:40:00 -0800 (PST)
Received: by mail-ed1-x52b.google.com with SMTP id s12so5986395edd.5
        for <linux-media@vger.kernel.org>; Thu, 10 Nov 2022 19:40:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=K+ov3P7MSKDC3zDq2K3swKKLzF2ZxWS9fJDHSnP7Go4=;
        b=LKNNmdDsVXvTCl8Wcq1POX6SybDvycSSR4CE8r7wAkIe2ZYVfHNLHpXN/JAN90tQ/y
         xHokgLfGCeEhZzKQdFKQk3kjeXJ4X2lcC6Ns627hli68sFlGpuH6IuqhOiOxaI8T2eXW
         QRD61HydTcyb6eGWmPAKULpN+vJr8cl/RiL5M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=K+ov3P7MSKDC3zDq2K3swKKLzF2ZxWS9fJDHSnP7Go4=;
        b=7niAuwsG8IBDD2N0hxNALGcX8vyPH9m+zGy64qd740CpKXignUvZhlaZwr0HB1nlLe
         DFpRmPGL6ADFCEpA+SZUoDUYQOSsZOxlDmnzJouUX1ikapV1zkyKOHQGRlmhcuwN7thv
         IY3LH5jfjJVpM7uzr4PEUV6I6HyzSLEFVsYPgPjYmG6ICBZi08Ea1eOB+iwhT5qIfUHn
         2hRLegG/7rJJ/k0fWVaTPGbJ1bzYMzpewUGZosviD6TbSmUgXwFK9yjfiEwbcTZEv4MI
         oMDFf5jkjd51NcBqH5PyG1EQ87k+MddDM2lopaNzJuWwcMYHwKeMAd6jv7GtpprHmuKf
         XdZg==
X-Gm-Message-State: ACrzQf2Gj9H99HBy+SNicf+fTANO/zxe2xbXwGyCq6W9RvloiM4oR0qp
        UGkso96UauuC1JR25PppgY0Gc8rTZ2iQyg==
X-Google-Smtp-Source: AMsMyM6fGoCVuS6F0PFGXUV1is2gTp96GXvT1sWgAq+Bj4TRBY53U3nYvgfNK1TcXTw4grGQaQQUDA==
X-Received: by 2002:aa7:c44a:0:b0:461:c2a4:c419 with SMTP id n10-20020aa7c44a000000b00461c2a4c419mr4246400edr.399.1668137998513;
        Thu, 10 Nov 2022 19:39:58 -0800 (PST)
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com. [209.85.208.54])
        by smtp.gmail.com with ESMTPSA id ca26-20020a170906a3da00b0078c468bd604sm429537ejb.57.2022.11.10.19.39.57
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 10 Nov 2022 19:39:58 -0800 (PST)
Received: by mail-ed1-f54.google.com with SMTP id i21so5973886edj.10
        for <linux-media@vger.kernel.org>; Thu, 10 Nov 2022 19:39:57 -0800 (PST)
X-Received: by 2002:a17:906:4e48:b0:73d:dfb2:d188 with SMTP id
 g8-20020a1709064e4800b0073ddfb2d188mr421713ejw.426.1668137986539; Thu, 10 Nov
 2022 19:39:46 -0800 (PST)
MIME-Version: 1.0
References: <20221110201349.351294-1-dmitry.osipenko@collabora.com> <20221110201349.351294-6-dmitry.osipenko@collabora.com>
In-Reply-To: <20221110201349.351294-6-dmitry.osipenko@collabora.com>
From:   Tomasz Figa <tfiga@chromium.org>
Date:   Fri, 11 Nov 2022 12:39:35 +0900
X-Gmail-Original-Message-ID: <CAAFQd5CsBEJkS=4nsH+4bQjCPNxwmw47Op4jnkydA+ivEfiPeA@mail.gmail.com>
Message-ID: <CAAFQd5CsBEJkS=4nsH+4bQjCPNxwmw47Op4jnkydA+ivEfiPeA@mail.gmail.com>
Subject: Re: [PATCH v1 5/6] media: videobuf2: Assert held reservation lock for
 dma-buf mmapping
To:     Dmitry Osipenko <dmitry.osipenko@collabora.com>
Cc:     Sumit Semwal <sumit.semwal@linaro.org>,
        =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
        Benjamin Gaignard <benjamin.gaignard@collabora.com>,
        Liam Mark <lmark@codeaurora.org>,
        Brian Starkey <Brian.Starkey@arm.com>,
        John Stultz <jstultz@google.com>,
        Gerd Hoffmann <kraxel@redhat.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Jani Nikula <jani.nikula@linux.intel.com>,
        Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
        Rodrigo Vivi <rodrigo.vivi@intel.com>,
        Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Tomi Valkeinen <tomba@kernel.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Amol Maheshwari <amahesh@qti.qualcomm.com>,
        linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, intel-gfx@lists.freedesktop.org,
        linux-tegra@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        kernel@collabora.com
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Fri, Nov 11, 2022 at 5:15 AM Dmitry Osipenko
<dmitry.osipenko@collabora.com> wrote:
>
> When userspace mmaps dma-buf's fd, the dma-buf reservation lock must be
> held. Add locking sanity checks to the dma-buf mmaping callbacks to ensure
> that the locking assumptions won't regress in the future.
>
> Suggested-by: Daniel Vetter <daniel@ffwll.ch>
> Signed-off-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>
> ---
>  drivers/media/common/videobuf2/videobuf2-dma-contig.c | 3 +++
>  drivers/media/common/videobuf2/videobuf2-dma-sg.c     | 3 +++
>  drivers/media/common/videobuf2/videobuf2-vmalloc.c    | 3 +++
>  3 files changed, 9 insertions(+)
>

Acked-by: Tomasz Figa <tfiga@chromium.org>

Best regards,
Tomasz

> diff --git a/drivers/media/common/videobuf2/videobuf2-dma-contig.c b/drivers/media/common/videobuf2/videobuf2-dma-contig.c
> index 555bd40fa472..7f45a62969f2 100644
> --- a/drivers/media/common/videobuf2/videobuf2-dma-contig.c
> +++ b/drivers/media/common/videobuf2/videobuf2-dma-contig.c
> @@ -11,6 +11,7 @@
>   */
>
>  #include <linux/dma-buf.h>
> +#include <linux/dma-resv.h>
>  #include <linux/module.h>
>  #include <linux/refcount.h>
>  #include <linux/scatterlist.h>
> @@ -455,6 +456,8 @@ static int vb2_dc_dmabuf_ops_vmap(struct dma_buf *dbuf, struct iosys_map *map)
>  static int vb2_dc_dmabuf_ops_mmap(struct dma_buf *dbuf,
>         struct vm_area_struct *vma)
>  {
> +       dma_resv_assert_held(dbuf->resv);
> +
>         return vb2_dc_mmap(dbuf->priv, vma);
>  }
>
> diff --git a/drivers/media/common/videobuf2/videobuf2-dma-sg.c b/drivers/media/common/videobuf2/videobuf2-dma-sg.c
> index 36981a5b5c53..b7f39ee49ed8 100644
> --- a/drivers/media/common/videobuf2/videobuf2-dma-sg.c
> +++ b/drivers/media/common/videobuf2/videobuf2-dma-sg.c
> @@ -10,6 +10,7 @@
>   * the Free Software Foundation.
>   */
>
> +#include <linux/dma-resv.h>
>  #include <linux/module.h>
>  #include <linux/mm.h>
>  #include <linux/refcount.h>
> @@ -495,6 +496,8 @@ static int vb2_dma_sg_dmabuf_ops_vmap(struct dma_buf *dbuf,
>  static int vb2_dma_sg_dmabuf_ops_mmap(struct dma_buf *dbuf,
>         struct vm_area_struct *vma)
>  {
> +       dma_resv_assert_held(dbuf->resv);
> +
>         return vb2_dma_sg_mmap(dbuf->priv, vma);
>  }
>
> diff --git a/drivers/media/common/videobuf2/videobuf2-vmalloc.c b/drivers/media/common/videobuf2/videobuf2-vmalloc.c
> index 41db707e43a4..f9b665366365 100644
> --- a/drivers/media/common/videobuf2/videobuf2-vmalloc.c
> +++ b/drivers/media/common/videobuf2/videobuf2-vmalloc.c
> @@ -10,6 +10,7 @@
>   * the Free Software Foundation.
>   */
>
> +#include <linux/dma-resv.h>
>  #include <linux/io.h>
>  #include <linux/module.h>
>  #include <linux/mm.h>
> @@ -316,6 +317,8 @@ static int vb2_vmalloc_dmabuf_ops_vmap(struct dma_buf *dbuf,
>  static int vb2_vmalloc_dmabuf_ops_mmap(struct dma_buf *dbuf,
>         struct vm_area_struct *vma)
>  {
> +       dma_resv_assert_held(dbuf->resv);
> +
>         return vb2_vmalloc_mmap(dbuf->priv, vma);
>  }
>
> --
> 2.37.3
>
