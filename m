Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6711278658B
	for <lists+linux-media@lfdr.de>; Thu, 24 Aug 2023 04:46:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239201AbjHXCqA (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 23 Aug 2023 22:46:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49694 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239313AbjHXCpi (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 23 Aug 2023 22:45:38 -0400
Received: from mail-ua1-x932.google.com (mail-ua1-x932.google.com [IPv6:2607:f8b0:4864:20::932])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0B104198
        for <linux-media@vger.kernel.org>; Wed, 23 Aug 2023 19:45:36 -0700 (PDT)
Received: by mail-ua1-x932.google.com with SMTP id a1e0cc1a2514c-79969c14964so2062880241.2
        for <linux-media@vger.kernel.org>; Wed, 23 Aug 2023 19:45:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1692845135; x=1693449935;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SD4TQ7iFy4umItwAy6F4yebqR++5XFnrcQyodHwrQaQ=;
        b=W9CcXSSet115VxTXRZ3tM8/x884+5TCrfC9nMZ45lA1cQCVDSjPlnRcSrJciSJ3dPR
         lV7SDqDYCh2UJSjvxeCkplrgFt9IhqliDiamp9o3GLpkjmwUrrKpIsdFuCeLLX2yMav0
         180ORlqKAgw7be9fV9c/5AgCxetLn+tnE/LMg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692845135; x=1693449935;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SD4TQ7iFy4umItwAy6F4yebqR++5XFnrcQyodHwrQaQ=;
        b=YwQkbgvbEPaujhJbcC9ShOL0lSsqx2p3dgBcA6VSOdvU88BWkzUf5NPmhQMBZrhNQg
         qZh9/Pacj6zXJZyV7vt+gsqJuaMb3Vt5vjffJ2veFrnR6VDSBv/Wvk+7AyhgJVK2zfFi
         x6lj5/T8CAhytv53T+4+YZ2WKOsNL+8hDNNgH6WFnvxOm+LMm76uJzJHfkKDRGY5X4kC
         MjtGlRAzU3KXpOSKFxxhZEgKmA560W7kZeJcLtZjj/9S6nzYeRGKuNdVKu1x0oti7rlU
         AFjTXHtvB88kB61DCQHQvm0wFfKb11/jehVp6m7yBEmMjkIIdobOJkrnWH9WGPzuU/Tp
         0PKQ==
X-Gm-Message-State: AOJu0YwlvRkVh0zjk/0Iw4XHuRiLVDQXcqgMVt+ImS5hGM+dxRh1PQGg
        hWq/kr05ISAwMrwJciz0tDt5GpO6HGFk84KxF1ofOg==
X-Google-Smtp-Source: AGHT+IFOkdQtxNMt4CsJCo2OZQTZvDWYBNUVlTl6BoCEgnO2Ko4EXUfqlGJE5mXI6L57yQi3OKMBseYeJsKxCR6QeZ0=
X-Received: by 2002:a05:6102:3655:b0:44e:906d:58b with SMTP id
 s21-20020a056102365500b0044e906d058bmr2166335vsu.14.1692845135099; Wed, 23
 Aug 2023 19:45:35 -0700 (PDT)
MIME-Version: 1.0
References: <20230824013858.303105-1-marex@denx.de>
In-Reply-To: <20230824013858.303105-1-marex@denx.de>
From:   Chen-Yu Tsai <wenst@chromium.org>
Date:   Thu, 24 Aug 2023 10:45:23 +0800
Message-ID: <CAGXv+5HpmdNv40=vyHONsVq=Y868eDpy6iaLjoPFqhHvGqi1rA@mail.gmail.com>
Subject: Re: [PATCH] media: hantro: Check whether reset op is defined before use
To:     Marek Vasut <marex@denx.de>
Cc:     linux-media@vger.kernel.org, Adam Ford <aford173@gmail.com>,
        Benjamin Gaignard <benjamin.gaignard@collabora.com>,
        Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        linux-rockchip@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, Aug 24, 2023 at 9:39=E2=80=AFAM Marek Vasut <marex@denx.de> wrote:
>
> The i.MX8MM/N/P does not define the .reset op since reset of the VPU is
> done by genpd. Check whether the .reset op is defined before calling it
> to avoid NULL pointer dereference.
>
> Note that the Fixes tag is set to the commit which removed the reset op
> from i.MX8M Hantro G2 implementation, this is because before this commit
> all the implementations did define the .reset op.
>
> Fixes: 6971efb70ac3 ("media: hantro: Allow i.MX8MQ G1 and G2 to run indep=
endently")
> Signed-off-by: Marek Vasut <marex@denx.de>

Had the same change in my local tree, so

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>
Tested-by: Chen-Yu Tsai <wenst@chromium.org>

> ---
> Cc: Adam Ford <aford173@gmail.com>
> Cc: Benjamin Gaignard <benjamin.gaignard@collabora.com>
> Cc: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
> Cc: Mauro Carvalho Chehab <mchehab@kernel.org>
> Cc: Philipp Zabel <p.zabel@pengutronix.de>
> Cc: linux-media@vger.kernel.org
> Cc: linux-rockchip@lists.infradead.org
> ---
>  drivers/media/platform/verisilicon/hantro_drv.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/media/platform/verisilicon/hantro_drv.c b/drivers/me=
dia/platform/verisilicon/hantro_drv.c
> index 423fc85d79ee3..50ec24c753e9e 100644
> --- a/drivers/media/platform/verisilicon/hantro_drv.c
> +++ b/drivers/media/platform/verisilicon/hantro_drv.c
> @@ -125,7 +125,8 @@ void hantro_watchdog(struct work_struct *work)
>         ctx =3D v4l2_m2m_get_curr_priv(vpu->m2m_dev);
>         if (ctx) {
>                 vpu_err("frame processing timed out!\n");
> -               ctx->codec_ops->reset(ctx);
> +               if (ctx->codec_ops->reset)
> +                       ctx->codec_ops->reset(ctx);
>                 hantro_job_finish(vpu, ctx, VB2_BUF_STATE_ERROR);
>         }
>  }
> --
> 2.40.1
>
>
> _______________________________________________
> Linux-rockchip mailing list
> Linux-rockchip@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-rockchip
