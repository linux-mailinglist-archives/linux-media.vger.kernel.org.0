Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AD4854011E5
	for <lists+linux-media@lfdr.de>; Mon,  6 Sep 2021 00:21:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238428AbhIEWBE (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 5 Sep 2021 18:01:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36530 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238309AbhIEWBE (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sun, 5 Sep 2021 18:01:04 -0400
Received: from mail-yb1-xb2b.google.com (mail-yb1-xb2b.google.com [IPv6:2607:f8b0:4864:20::b2b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C0722C061575;
        Sun,  5 Sep 2021 15:00:00 -0700 (PDT)
Received: by mail-yb1-xb2b.google.com with SMTP id c206so9711827ybb.12;
        Sun, 05 Sep 2021 15:00:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=/e1Clhfb0EE0vE8QgS9OUA/07uCCpQzpyb8Fidsmn9o=;
        b=DYQm3st2buCREper5zV80Lei2dPGFF54QWXfwbDTaFK/fs5L9vLtMol7N2QbQqVSwW
         C1BfMAp9CUv3pHzfRqKrGardSYTnNhHpbr/9jCXu5fKUClGXi58AviGU9q48aHH2yqpD
         Vtx+VKP+9suHBbbV6IZZnarIHJtcb+RudzYU6E1bEI1q4/zDzWdG5whD6ymC8dxb5yrM
         BXW4caK3iMpbFliRrzT1nGH+k2MvlDKQEOwhRdTUHZgnK5GklNmSbFDDD60XJ0P0nuez
         FRC4C5uBcPK7xcvbTyR7CrbY+WBXDPzQlCjyh4pszktaZqaYKtLnLHffZC6YS9wGDGJP
         9dxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=/e1Clhfb0EE0vE8QgS9OUA/07uCCpQzpyb8Fidsmn9o=;
        b=s9E5QVKfTKGrV30kZ3ydB42GELFGDN712hAR3Ka9N8dHmiHixmwfQBbOri4L9KfqUu
         0Pawfpwc1RJwO6jSqx8q9ROf3Vb2PDmucXVlLsNplUDAHqO/Ao9nqwiLGS9N1L/GuNt6
         Cn9lCyajVT5qcjsXvuBCTVT5KzUoFc/zUjcvgJzC3KnJWqzkWNvmMY0U1wngywZoJbtr
         2yX+LBwGJa5UbdFDZI/W+4MN1TC1dsgDvh3OQNoMTOvGXsRMQ8u6XF+/Y7V/DPJnpY80
         y9LeXZDYV25j+7rMh3sfPaV3fefMEs46jSieum7SjFHIhyHniVsqdqP/KRi4na/+cjQB
         l2aw==
X-Gm-Message-State: AOAM532DuGtXeY5AzpSdaIsGZ7xNBNXNoTEHykouwRs8aplQRJZ4fvwC
        wNVcbH8EhF4HuljNyIZlsouo1VFXl6qN2SJDvQQ=
X-Google-Smtp-Source: ABdhPJyLdB6zY6x03C8ma21KDxLUHT6DOEu5UC3fQNG7eFpPrs8kqFwieTw1ovNsNgU0ur7Jy3IX98oKsQs55yngMWU=
X-Received: by 2002:a25:b7c6:: with SMTP id u6mr12230278ybj.16.1630879199934;
 Sun, 05 Sep 2021 14:59:59 -0700 (PDT)
MIME-Version: 1.0
References: <20210901055117.6579-1-caihuoqing@baidu.com>
In-Reply-To: <20210901055117.6579-1-caihuoqing@baidu.com>
From:   "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date:   Sun, 5 Sep 2021 22:59:34 +0100
Message-ID: <CA+V-a8t8fsjCQ78dK1oDEBVEEwsPXFRdEVWqnihdqSX1KN2VPA@mail.gmail.com>
Subject: Re: [PATCH] media: davinci: Make use of the helper function devm_platform_ioremap_resource()
To:     Cai Huoqing <caihuoqing@baidu.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media <linux-media@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Cai,

Thank you for the patch.

On Wed, Sep 1, 2021 at 6:51 AM Cai Huoqing <caihuoqing@baidu.com> wrote:
>
> Use the devm_platform_ioremap_resource() helper instead of
> calling platform_get_resource() and devm_ioremap_resource()
> separately
>
> Signed-off-by: Cai Huoqing <caihuoqing@baidu.com>
> ---
>  drivers/media/platform/davinci/vpbe_venc.c |  9 ++-------
>  drivers/media/platform/davinci/vpif.c      |  5 ++---
>  drivers/media/platform/davinci/vpss.c      | 10 ++--------
>  3 files changed, 6 insertions(+), 18 deletions(-)
>
Reviewed-by: Lad Prabhakar <prabhakar.csengg@gmail.com>

Cheers,
Prabhakar

> diff --git a/drivers/media/platform/davinci/vpbe_venc.c b/drivers/media/platform/davinci/vpbe_venc.c
> index bde241c26d79..4c8e31de12b1 100644
> --- a/drivers/media/platform/davinci/vpbe_venc.c
> +++ b/drivers/media/platform/davinci/vpbe_venc.c
> @@ -621,7 +621,6 @@ static int venc_probe(struct platform_device *pdev)
>  {
>         const struct platform_device_id *pdev_id;
>         struct venc_state *venc;
> -       struct resource *res;
>
>         if (!pdev->dev.platform_data) {
>                 dev_err(&pdev->dev, "No platform data for VENC sub device");
> @@ -640,16 +639,12 @@ static int venc_probe(struct platform_device *pdev)
>         venc->pdev = &pdev->dev;
>         venc->pdata = pdev->dev.platform_data;
>
> -       res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> -
> -       venc->venc_base = devm_ioremap_resource(&pdev->dev, res);
> +       venc->venc_base = devm_platform_ioremap_resource(pdev, 0);
>         if (IS_ERR(venc->venc_base))
>                 return PTR_ERR(venc->venc_base);
>
>         if (venc->venc_type != VPBE_VERSION_1) {
> -               res = platform_get_resource(pdev, IORESOURCE_MEM, 1);
> -
> -               venc->vdaccfg_reg = devm_ioremap_resource(&pdev->dev, res);
> +               venc->vdaccfg_reg = devm_platform_ioremap_resource(pdev, 1);
>                 if (IS_ERR(venc->vdaccfg_reg))
>                         return PTR_ERR(venc->vdaccfg_reg);
>         }
> diff --git a/drivers/media/platform/davinci/vpif.c b/drivers/media/platform/davinci/vpif.c
> index f1ce10828b8e..5a89d885d0e3 100644
> --- a/drivers/media/platform/davinci/vpif.c
> +++ b/drivers/media/platform/davinci/vpif.c
> @@ -425,12 +425,11 @@ EXPORT_SYMBOL(vpif_channel_getfid);
>
>  static int vpif_probe(struct platform_device *pdev)
>  {
> -       static struct resource  *res, *res_irq;
> +       static struct resource *res_irq;
>         struct platform_device *pdev_capture, *pdev_display;
>         struct device_node *endpoint = NULL;
>
> -       res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> -       vpif_base = devm_ioremap_resource(&pdev->dev, res);
> +       vpif_base = devm_platform_ioremap_resource(pdev, 0);
>         if (IS_ERR(vpif_base))
>                 return PTR_ERR(vpif_base);
>
> diff --git a/drivers/media/platform/davinci/vpss.c b/drivers/media/platform/davinci/vpss.c
> index 7000f0bf0b35..d15b991ab17c 100644
> --- a/drivers/media/platform/davinci/vpss.c
> +++ b/drivers/media/platform/davinci/vpss.c
> @@ -392,7 +392,6 @@ EXPORT_SYMBOL(dm365_vpss_set_pg_frame_size);
>
>  static int vpss_probe(struct platform_device *pdev)
>  {
> -       struct resource *res;
>         char *platform_name;
>
>         if (!pdev->dev.platform_data) {
> @@ -413,17 +412,12 @@ static int vpss_probe(struct platform_device *pdev)
>         }
>
>         dev_info(&pdev->dev, "%s vpss probed\n", platform_name);
> -       res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> -
> -       oper_cfg.vpss_regs_base0 = devm_ioremap_resource(&pdev->dev, res);
> +       oper_cfg.vpss_regs_base0 = devm_platform_ioremap_resource(pdev, 0);
>         if (IS_ERR(oper_cfg.vpss_regs_base0))
>                 return PTR_ERR(oper_cfg.vpss_regs_base0);
>
>         if (oper_cfg.platform == DM355 || oper_cfg.platform == DM365) {
> -               res = platform_get_resource(pdev, IORESOURCE_MEM, 1);
> -
> -               oper_cfg.vpss_regs_base1 = devm_ioremap_resource(&pdev->dev,
> -                                                                res);
> +               oper_cfg.vpss_regs_base1 = devm_platform_ioremap_resource(pdev, 1);
>                 if (IS_ERR(oper_cfg.vpss_regs_base1))
>                         return PTR_ERR(oper_cfg.vpss_regs_base1);
>         }
> --
> 2.25.1
>
