Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DA8A42C0DB4
	for <lists+linux-media@lfdr.de>; Mon, 23 Nov 2020 15:41:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389155AbgKWObN (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 23 Nov 2020 09:31:13 -0500
Received: from mail.kernel.org ([198.145.29.99]:47610 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1731426AbgKWObN (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 23 Nov 2020 09:31:13 -0500
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id B75C52083E;
        Mon, 23 Nov 2020 14:31:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1606141872;
        bh=vuZ+rah2hE0LNJaScoerOKwY3fCT0EUtYP8hbvGF1o8=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=D01SUDy+AOXdGks3r6EavahhLVcEAH4UbH/COnWtfnARQswwUTjGU0Da4LEgSMvZH
         5oEB+rRWqD+Zcj/oNJBNUMdgBA6MjM9JHYG/XC35GJLcUaxFbJmRHe11UtVWoZS7F0
         NUCXLLEtcUvv8IS5a0O0Huvy08wnb3nk5Oy66jr4=
Received: by mail-ed1-f52.google.com with SMTP id v22so17289665edt.9;
        Mon, 23 Nov 2020 06:31:11 -0800 (PST)
X-Gm-Message-State: AOAM53011dUGCEQg6RfuHas5TI3prA7pKP1OQNbwbIiUi0LF4rMNRIrV
        UfSLtxddbm+LRN3h3ELTSgzQNxfE5aVV+dEaTQ==
X-Google-Smtp-Source: ABdhPJwOmjtyvLkvrDJkqOOjZKJiyogKz1KZcoxRJRbT0kCAwbM+Un1KY6jBLjQqvchQiCiAbumdEjhrGCQBqzMb6+E=
X-Received: by 2002:a50:f1d2:: with SMTP id y18mr13457355edl.166.1606141870269;
 Mon, 23 Nov 2020 06:31:10 -0800 (PST)
MIME-Version: 1.0
References: <20201113134938.4004947-1-lee.jones@linaro.org> <20201113134938.4004947-11-lee.jones@linaro.org>
In-Reply-To: <20201113134938.4004947-11-lee.jones@linaro.org>
From:   Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date:   Mon, 23 Nov 2020 22:30:58 +0800
X-Gmail-Original-Message-ID: <CAAOTY__N5E6TApkVomnvWpcsLAq4tpxZffpq+wxH6_q_0uNZ7g@mail.gmail.com>
Message-ID: <CAAOTY__N5E6TApkVomnvWpcsLAq4tpxZffpq+wxH6_q_0uNZ7g@mail.gmail.com>
Subject: Re: [PATCH 10/40] drm/mediatek/mtk_drm_drv: Staticise local function
 invoked by reference
To:     Lee Jones <lee.jones@linaro.org>
Cc:     linux-kernel <linux-kernel@vger.kernel.org>,
        Chun-Kuang Hu <chunkuang.hu@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
        YT SHEN <yt.shen@mediatek.com>,
        DRI Development <dri-devel@lists.freedesktop.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        "moderated list:ARM/Mediatek SoC support" 
        <linux-mediatek@lists.infradead.org>, linux-media@vger.kernel.org,
        linaro-mm-sig@lists.linaro.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi, Lee:

Lee Jones <lee.jones@linaro.org> =E6=96=BC 2020=E5=B9=B411=E6=9C=8813=E6=97=
=A5 =E9=80=B1=E4=BA=94 =E4=B8=8B=E5=8D=889:49=E5=AF=AB=E9=81=93=EF=BC=9A
>
> Fixes the following W=3D1 kernel build warning(s):
>
>  drivers/gpu/drm/mediatek/mtk_drm_drv.c:316:24: warning: no previous prot=
otype for =E2=80=98mtk_drm_gem_prime_import=E2=80=99 [-Wmissing-prototypes]
>

Applied to mediatek-drm-next [1], thanks.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/chunkuang.hu/linux.git/=
log/?h=3Dmediatek-drm-next

Regards,
Chun-Kuang.

> Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>
> Cc: Philipp Zabel <p.zabel@pengutronix.de>
> Cc: David Airlie <airlied@linux.ie>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: Matthias Brugger <matthias.bgg@gmail.com>
> Cc: Sumit Semwal <sumit.semwal@linaro.org>
> Cc: "Christian K=C3=B6nig" <christian.koenig@amd.com>
> Cc: YT SHEN <yt.shen@mediatek.com>
> Cc: dri-devel@lists.freedesktop.org
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-mediatek@lists.infradead.org
> Cc: linux-media@vger.kernel.org
> Cc: linaro-mm-sig@lists.linaro.org
> Signed-off-by: Lee Jones <lee.jones@linaro.org>
> ---
>  drivers/gpu/drm/mediatek/mtk_drm_drv.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/mediatek/mtk_drm_drv.c b/drivers/gpu/drm/med=
iatek/mtk_drm_drv.c
> index 2e8065b1e2bbc..401311453e7d0 100644
> --- a/drivers/gpu/drm/mediatek/mtk_drm_drv.c
> +++ b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
> @@ -313,8 +313,8 @@ static const struct file_operations mtk_drm_fops =3D =
{
>   * We need to override this because the device used to import the memory=
 is
>   * not dev->dev, as drm_gem_prime_import() expects.
>   */
> -struct drm_gem_object *mtk_drm_gem_prime_import(struct drm_device *dev,
> -                                               struct dma_buf *dma_buf)
> +static struct drm_gem_object *mtk_drm_gem_prime_import(struct drm_device=
 *dev,
> +                                                      struct dma_buf *dm=
a_buf)
>  {
>         struct mtk_drm_private *private =3D dev->dev_private;
>
> --
> 2.25.1
>
