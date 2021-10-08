Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E9D054267E2
	for <lists+linux-media@lfdr.de>; Fri,  8 Oct 2021 12:30:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239911AbhJHKcm (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 8 Oct 2021 06:32:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48766 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239912AbhJHKcf (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 8 Oct 2021 06:32:35 -0400
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com [IPv6:2a00:1450:4864:20::129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EDE4FC061760
        for <linux-media@vger.kernel.org>; Fri,  8 Oct 2021 03:30:39 -0700 (PDT)
Received: by mail-lf1-x129.google.com with SMTP id r19so35530833lfe.10
        for <linux-media@vger.kernel.org>; Fri, 08 Oct 2021 03:30:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=xAJV6rpYehfTK9nnciNhDpMqZQK02ZVmng3Ho9JExgo=;
        b=WUFufoTxqA+JTTGukQW4lBGtCc6qPp3iXYEHJKCwXNRrYOf9uteuXRod7K/a5tl41d
         TyytV5xNYgGRRU0zyrhr8aPQD6NAbmd8ax/ctLn3bTFIDRqmRLGFvIIwcsriB/9RNglW
         l58ng7vWsERBcsUQ6nKAO/9d/vt1wUdtqb0MA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=xAJV6rpYehfTK9nnciNhDpMqZQK02ZVmng3Ho9JExgo=;
        b=rDF8NeVg0L0PlXwBpY7altvzWsKO0U4KuSikozPGPOmDb/sKsq3d9ibXgJ2bGp30Q+
         pq0tq8rf3wXPG3vjwEMbAhAbONTZlrg3G7/XzibUo23GH2VN6m5r/+mSFodwbFSKFTp2
         avg+xpyomSdcmhq6bcc9939ixwOi6kfml5+JU9wP0hBUX2HAMZP0mfmgz45MQALFihGk
         hmMLkyg6q2NMmSNg/uFMjcoSJLxhRMxjqYa/iNtSMZTIThr47aHAlfLHtj0Q9HK4zLAo
         9jHF8nzRwZG1S/Zv/CJMFBKFUSjlig5rYtwq31pEvoPZqdHyfT1O/aQArgv2PV4rieDa
         SALA==
X-Gm-Message-State: AOAM5333mMhCFjUbd581Skwbdtso5Hp9kHyEa7VJle8u5vwmkBaF0OQf
        8dZJv42oezr6h6fr/hZAWRQOO31MfPdo/Cg28O10ow==
X-Google-Smtp-Source: ABdhPJyNLLNnwHcH3PPTk54y5XMO2BahGGz++OdUH26GrfjhbgYTvnY0SqT1yb9T3vmlVy2LqM13V+w9DHH6Lm20TWI=
X-Received: by 2002:a2e:9c4b:: with SMTP id t11mr2805530ljj.376.1633689037713;
 Fri, 08 Oct 2021 03:30:37 -0700 (PDT)
MIME-Version: 1.0
References: <20210929160439.6601-1-andrzej.p@collabora.com> <20210929160439.6601-8-andrzej.p@collabora.com>
In-Reply-To: <20210929160439.6601-8-andrzej.p@collabora.com>
From:   Chen-Yu Tsai <wenst@chromium.org>
Date:   Fri, 8 Oct 2021 18:30:26 +0800
Message-ID: <CAGXv+5GU3f40BijQxazGVtJ0o9rZY_cux9mxRUEtXYHF2Oz-UQ@mail.gmail.com>
Subject: Re: [PATCH v7 07/11] media: rkvdec: Add the VP9 backend
To:     Andrzej Pietrasiewicz <andrzej.p@collabora.com>
Cc:     Linux Media Mailing List <linux-media@vger.kernel.org>,
        "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" 
        <linux-arm-kernel@lists.infradead.org>,
        LKML <linux-kernel@vger.kernel.org>,
        "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>,
        linux-staging@lists.linux.dev,
        Benjamin Gaignard <benjamin.gaignard@collabora.com>,
        Boris Brezillon <boris.brezillon@collabora.com>,
        Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
        Fabio Estevam <festevam@gmail.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Heiko Stuebner <heiko@sntech.de>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Nicolas Dufresne <nicolas.dufresne@collabora.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Shawn Guo <shawnguo@kernel.org>, kernel@collabora.com,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Adrian Ratiu <adrian.ratiu@collabora.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi,

On Thu, Sep 30, 2021 at 12:07 AM Andrzej Pietrasiewicz
<andrzej.p@collabora.com> wrote:
>
> From: Boris Brezillon <boris.brezillon@collabora.com>
>
> The Rockchip VDEC supports VP9 profile 0 up to 4096x2304@30fps. Add
> a backend for this new format.
>
> Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
> Signed-off-by: Ezequiel Garcia <ezequiel@collabora.com>
> Signed-off-by: Adrian Ratiu <adrian.ratiu@collabora.com>
> Co-developed-by: Andrzej Pietrasiewicz <andrzej.p@collabora.com>
> Signed-off-by: Andrzej Pietrasiewicz <andrzej.p@collabora.com>
> ---
>  drivers/staging/media/rkvdec/Kconfig      |    1 +
>  drivers/staging/media/rkvdec/Makefile     |    2 +-
>  drivers/staging/media/rkvdec/rkvdec-vp9.c | 1078 +++++++++++++++++++++
>  drivers/staging/media/rkvdec/rkvdec.c     |   52 +-
>  drivers/staging/media/rkvdec/rkvdec.h     |   12 +-
>  5 files changed, 1137 insertions(+), 8 deletions(-)
>  create mode 100644 drivers/staging/media/rkvdec/rkvdec-vp9.c
>

[...]

> diff --git a/drivers/staging/media/rkvdec/rkvdec.c b/drivers/staging/media/rkvdec/rkvdec.c
> index 7131156c1f2c..6aa8aca66547 100644
> --- a/drivers/staging/media/rkvdec/rkvdec.c
> +++ b/drivers/staging/media/rkvdec/rkvdec.c

[...]

> @@ -319,7 +354,7 @@ static int rkvdec_s_output_fmt(struct file *file, void *priv,
>         struct v4l2_m2m_ctx *m2m_ctx = ctx->fh.m2m_ctx;
>         const struct rkvdec_coded_fmt_desc *desc;
>         struct v4l2_format *cap_fmt;
> -       struct vb2_queue *peer_vq;
> +       struct vb2_queue *peer_vq, *vq;
>         int ret;
>
>         /*
> @@ -331,6 +366,15 @@ static int rkvdec_s_output_fmt(struct file *file, void *priv,
>         if (vb2_is_busy(peer_vq))
>                 return -EBUSY;
>
> +       /*
> +        * Some codecs like VP9 can contain dynamic resolution changes which
> +        * are currently not supported by the V4L2 API or driver, so return
> +        * an error if userspace tries to reconfigure the output format.
> +        */
> +       vq = v4l2_m2m_get_vq(m2m_ctx, V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE);
> +       if (vb2_is_busy(vq))
> +               return -EINVAL;

This check is already done in rkvdec_s_fmt(), though it returns -EBUSY
instead. And I don't see similar changes to Hantro, so maybe this isn't
an API limitation as described in the comment? My recent patch [1] also
loosens the restrictions on this.

ChenYu

[1] https://lore.kernel.org/linux-media/20211008100423.739462-3-wenst@chromium.org/

> +
>         ret = rkvdec_s_fmt(file, priv, f, rkvdec_try_output_fmt);
>         if (ret)
>                 return ret;
