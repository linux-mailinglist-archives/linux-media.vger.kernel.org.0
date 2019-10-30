Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B3E01EA191
	for <lists+linux-media@lfdr.de>; Wed, 30 Oct 2019 17:17:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727326AbfJ3QRb (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 30 Oct 2019 12:17:31 -0400
Received: from mail-ot1-f66.google.com ([209.85.210.66]:41062 "EHLO
        mail-ot1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726800AbfJ3QR1 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 30 Oct 2019 12:17:27 -0400
Received: by mail-ot1-f66.google.com with SMTP id 94so2604002oty.8
        for <linux-media@vger.kernel.org>; Wed, 30 Oct 2019 09:17:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=9Cj2/HXDLn8aS6ESVlsFGccn1N9mdAGQmhGwS0g3eOU=;
        b=loU8peBfVBq5shNbsqNfvsPiuBIenx6sek1Jikn6Qw5VElJ/47se4ZkXOea0N6HeSa
         9zAyMBnaKpBimNv0jGpE0U91oZAwjjqEThIvGbvEh/b0QLikNWo8VGlAmT/bTAHOUWmU
         3hFjaeUV34lRbrVScSy2IsEY9nR+gpOfVN8SVAGT1gKm0KFAyNXy2TPGmcXzK4srOTZr
         mo1wxLIuM5CHZriAkh9FZKoq3uS6L1IPsJ3HfPK0UYIMrImPc5E73qHHO11WtnN7oMrS
         HEEsXqengkEwOOwf6HOWS0EHde8/2ZyMabv0NgJ1o0X4IcmnChdnnEdjH8uqhxt4oHel
         4NHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=9Cj2/HXDLn8aS6ESVlsFGccn1N9mdAGQmhGwS0g3eOU=;
        b=MBJE/QFwLQnqtCE8ByzdyfbbRd1HXanVoLB3mhM8jfV64NFOQ8uK7PaMnPEs1mOUwr
         ooeFaOzEBSv+CK/9EzbxHycYD/NcuEoY+dZECxG3R4/2nLe1jgM+7Falhk7FQqDqpI1w
         6bp+MdvEg+lTA03hDYYh5fud5T8c0RoCfQuy4JRS+ZNbKQfQQL5PSFvqAmoKxiXb/A3B
         wKoBEF2SZa2gqQYOEF2Ly6Rlm6OAqUJ5a47uN+e+evvRhC/cP0hEZdh20jt8faoZB/DZ
         xypJu57/u2oGtIB9ufm+eeu9h80M9EojQ6aHwsyTHBDcT6zr7RCPgFoVVEpCPbIjfoFB
         ucXA==
X-Gm-Message-State: APjAAAVW3N8cuSR2512KyQVR0GPWX+L6AZdO/EC+PMA/VPQCIaqeQMls
        j1DFCUk3FqzGt59JjhWa+Hifn5S1VG49XXiWsFudnA==
X-Google-Smtp-Source: APXvYqyGIZXSa+DtUjwBGchbvDWoC92JPTPDAXB5UsVtXZB+/gNvTOEkAQTyhFxO7Jk/E+0BUW/SIrYMDoyFssBoOgQ=
X-Received: by 2002:a9d:630c:: with SMTP id q12mr590885otk.332.1572452245946;
 Wed, 30 Oct 2019 09:17:25 -0700 (PDT)
MIME-Version: 1.0
References: <20191029182943.GD17569@mwanda>
In-Reply-To: <20191029182943.GD17569@mwanda>
From:   John Stultz <john.stultz@linaro.org>
Date:   Wed, 30 Oct 2019 09:17:14 -0700
Message-ID: <CALAqxLU7k-z6JXbEFpK0D_7+jZz_Jdk7HxaSWm_rkBFEpQRQtg@mail.gmail.com>
Subject: Re: [PATCH] dma-buf: Fix a warning message in dma_heap_buffer_destroy()
To:     Dan Carpenter <dan.carpenter@oracle.com>
Cc:     Sumit Semwal <sumit.semwal@linaro.org>,
        "Andrew F. Davis" <afd@ti.com>,
        Benjamin Gaignard <benjamin.gaignard@linaro.org>,
        Liam Mark <lmark@codeaurora.org>,
        Laura Abbott <labbott@redhat.com>,
        Brian Starkey <Brian.Starkey@arm.com>,
        linux-media@vger.kernel.org,
        dri-devel <dri-devel@lists.freedesktop.org>,
        "moderated list:DMA BUFFER SHARING FRAMEWORK" 
        <linaro-mm-sig@lists.linaro.org>,
        lkml <linux-kernel@vger.kernel.org>,
        kernel-janitors@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, Oct 29, 2019 at 11:31 AM Dan Carpenter <dan.carpenter@oracle.com> wrote:
>
> The first argument of WARN() is a condition so this will just print the
> function name instead of the whole warning message.
>
> Fixes: 7b87ea704fd9 ("dma-buf: heaps: Add heap helpers")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
>  drivers/dma-buf/heaps/heap-helpers.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/dma-buf/heaps/heap-helpers.c b/drivers/dma-buf/heaps/heap-helpers.c
> index 750bef4e902d..a31684c0d5b2 100644
> --- a/drivers/dma-buf/heaps/heap-helpers.c
> +++ b/drivers/dma-buf/heaps/heap-helpers.c
> @@ -52,7 +52,7 @@ static void *dma_heap_map_kernel(struct heap_helper_buffer *buffer)
>  static void dma_heap_buffer_destroy(struct heap_helper_buffer *buffer)
>  {
>         if (buffer->vmap_cnt > 0) {
> -               WARN("%s: buffer still mapped in the kernel\n", __func__);
> +               WARN(1, "%s: buffer still mapped in the kernel\n", __func__);
>                 vunmap(buffer->vaddr);
>         }

Thanks for catching and reporting this!

Acked-by: John Stultz <john.stultz@linaro.org>

Sumit, do you mind picking this up for drm-misc-next?

thanks
-john
