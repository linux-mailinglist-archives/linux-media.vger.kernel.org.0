Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 82DCBC1C04
	for <lists+linux-media@lfdr.de>; Mon, 30 Sep 2019 09:22:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729280AbfI3HWR (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 30 Sep 2019 03:22:17 -0400
Received: from mail-oi1-f193.google.com ([209.85.167.193]:40834 "EHLO
        mail-oi1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725767AbfI3HWQ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 30 Sep 2019 03:22:16 -0400
Received: by mail-oi1-f193.google.com with SMTP id k9so10224091oib.7
        for <linux-media@vger.kernel.org>; Mon, 30 Sep 2019 00:22:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=svnk0kf5Xru68vE4BD29OUahoTO1J+C23zLdUFz0Myw=;
        b=gvCsGY20HmK23Zn7UQJ2DiSuKibbzJrFEPNKg/RmOp/IXYuO0XbNtvnD1z0vsvIGfS
         nE6tcMWi78f/6X409tUKii7nh7mDrhTKrVgciIDQayzNrfna1/dKb7AsHE20gZKmRtYQ
         PY4hFu77EvVnAI5iyhluhAxuoVlIs62M2ZD/s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=svnk0kf5Xru68vE4BD29OUahoTO1J+C23zLdUFz0Myw=;
        b=UhC99uoU3mzxS2TPN2JUMfoDU+BR3pnxkkZyoyYfTJaXIiT3wOGNK0AaELt1t1rRPA
         YE+M6wKu6MkuMV6EeUPaLNRNrcJD2JO3PbsEbLtyEKyXCJ34TNzTzdRI93GNzZoX+07e
         +7DuQ0L50Kt/KNPRmNfXQQz/ad1+oturopfaqj8ne+YLTyqkT4GjC9ujdNKF4GVN6RBr
         RpjGGJjVWHLuP8JF+dzRwa2Regfm7pfs3VMrSIZXSEiQ1S/mpdhnGSb79+2QD9XAbcBI
         Gg1/lZE8EINSWikEtgxkkcyxs1DiimZcIh0OTzC/7Ih4jxnpQAghow/Y94wuMMBPPCqJ
         ySXg==
X-Gm-Message-State: APjAAAUdCR1LjEJq3mqFs43M8e8NdzotXcHmtNFm6r3IGtcB+qa9Lnzk
        PTAsGOYiHal3vIlDQEs2tO8Tpw1MaDuilHQQ/L8DDQ==
X-Google-Smtp-Source: APXvYqxwKR+QPHNX2ok2B2LSkEYN+8FGUtI+tPxhseBR9iydwvwshhXowsojDK1gwteppSZgpQVoGbplLypHZsMXfkU=
X-Received: by 2002:aca:d841:: with SMTP id p62mr17233434oig.128.1569828134719;
 Mon, 30 Sep 2019 00:22:14 -0700 (PDT)
MIME-Version: 1.0
References: <20190922074900.853-1-yuq825@gmail.com>
In-Reply-To: <20190922074900.853-1-yuq825@gmail.com>
From:   Daniel Vetter <daniel@ffwll.ch>
Date:   Mon, 30 Sep 2019 09:22:03 +0200
Message-ID: <CAKMK7uHro9W8GqvuVf0Ruji691U7Trc_jmS3U-OEacLFDH6P1A@mail.gmail.com>
Subject: Re: [PATCH] dma-buf/resv: fix exclusive fence get
To:     Qiang Yu <yuq825@gmail.com>
Cc:     dri-devel <dri-devel@lists.freedesktop.org>,
        lima@lists.freedesktop.org,
        "moderated list:DMA BUFFER SHARING FRAMEWORK" 
        <linaro-mm-sig@lists.linaro.org>,
        =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
        "open list:DMA BUFFER SHARING FRAMEWORK" 
        <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Sun, Sep 22, 2019 at 2:08 PM Qiang Yu <yuq825@gmail.com> wrote:
>
> This causes kernel crash when testing lima driver.
>
> Cc: Christian K=C3=B6nig <christian.koenig@amd.com>
> Fixes: b8c036dfc66f ("dma-buf: simplify reservation_object_get_fences_rcu=
 a bit")
> Signed-off-by: Qiang Yu <yuq825@gmail.com>

Selftest for this would be lovely, now that the basic infrastructure
is in place ...
-Daniel

> ---
>  drivers/dma-buf/dma-resv.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/dma-buf/dma-resv.c b/drivers/dma-buf/dma-resv.c
> index 42a8f3f11681..709002515550 100644
> --- a/drivers/dma-buf/dma-resv.c
> +++ b/drivers/dma-buf/dma-resv.c
> @@ -471,7 +471,7 @@ int dma_resv_get_fences_rcu(struct dma_resv *obj,
>         if (pfence_excl)
>                 *pfence_excl =3D fence_excl;
>         else if (fence_excl)
> -               shared[++shared_count] =3D fence_excl;
> +               shared[shared_count++] =3D fence_excl;
>
>         if (!shared_count) {
>                 kfree(shared);
> --
> 2.17.1
>
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel



--=20
Daniel Vetter
Software Engineer, Intel Corporation
+41 (0) 79 365 57 48 - http://blog.ffwll.ch
