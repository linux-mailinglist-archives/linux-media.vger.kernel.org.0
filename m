Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E59B25A1FA5
	for <lists+linux-media@lfdr.de>; Fri, 26 Aug 2022 06:09:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243311AbiHZEJG (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 26 Aug 2022 00:09:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46420 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238529AbiHZEJE (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 26 Aug 2022 00:09:04 -0400
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com [IPv6:2a00:1450:4864:20::633])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6FD6FC6EB9
        for <linux-media@vger.kernel.org>; Thu, 25 Aug 2022 21:09:02 -0700 (PDT)
Received: by mail-ej1-x633.google.com with SMTP id gb36so880608ejc.10
        for <linux-media@vger.kernel.org>; Thu, 25 Aug 2022 21:09:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=nfavuWqsga9k882E8+MW27Dc7w6nkSmp6dmrzCaSBa8=;
        b=auaX9NL078V2jQ22g6geanRo4qZgCfxascPAwZLxdTpxPyzPYywc2dou1ZYhcRULDj
         SPoXe+ojJ8cZ26IfVZM+1e593dZ30nsOzMbK8OQ3BD+4Ii44ZUIxjQxzbARwlnIbYBZ4
         eFv5ITB4zd1gSGzc6fvPICF/Xe8xA2tDVwNX8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=nfavuWqsga9k882E8+MW27Dc7w6nkSmp6dmrzCaSBa8=;
        b=J1sBfS8OWzr/MQsbrGtWy+ulICeKPIEFoIBTcdMloCPbWAb4eC6I1wgp9kx54SRE89
         wlJi8MUD7opN1yJ2wjL+7LhZYg6dQVZTSSmhbwDWEq1bGMgKDRaAjL3Z0+9AUMgPn0dU
         YIu6bWuleD2BceRhi7esVXuz8OvFqwdGSGKZIc+dYJH1RL2ZRF662drT/ISsdIJ+oEHW
         nG3OSN2czikBwfXaruH2P8o7a/QHZlLlSB6YrfBCESkZn9Dwd61x8Li5bMMzZfxllty8
         mmFbxdB3TfzP18X+4SvcWVc6q4rT1VzDi//k5I+/H+uWqWLeU3QLJWPneoHnnoB5nYcK
         1aoQ==
X-Gm-Message-State: ACgBeo28yEdcJCvBGH1DIgLeElMXg8uiLu5uN5gShpfiSU9RvCBrP4Ea
        jAuUuuiLxeRPH8V5gXo68Xq0vrKBd3AolInHO+K3sJug54S8iQ==
X-Google-Smtp-Source: AA6agR4P9lJ2jCOXLxO3fu5pzVr8QQon3biII9pZufVQXE6IfPh3piLXnL5yinNDFW3MHI/dSrraW9UClF4wseNeZfY=
X-Received: by 2002:a17:907:60c7:b0:739:52ba:cbd0 with SMTP id
 hv7-20020a17090760c700b0073952bacbd0mr4329186ejc.152.1661486940981; Thu, 25
 Aug 2022 21:09:00 -0700 (PDT)
MIME-Version: 1.0
References: <20220720085731.11011-1-irui.wang@mediatek.com> <20220720085731.11011-5-irui.wang@mediatek.com>
In-Reply-To: <20220720085731.11011-5-irui.wang@mediatek.com>
From:   Chen-Yu Tsai <wenst@chromium.org>
Date:   Fri, 26 Aug 2022 12:08:49 +0800
Message-ID: <CAGXv+5Eqcv-K1O-5foTcHYXKh+0yipo-i+EjgYOMemS3_82fAQ@mail.gmail.com>
Subject: Re: [PATCH v2, 4/6] media: mediatek: vcodec: Remove encoder driver
 get IRQ resource
To:     Irui Wang <irui.wang@mediatek.com>
Cc:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Tiffany Lin <tiffany.lin@mediatek.com>,
        Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        angelogioacchino.delregno@collabora.com,
        Maoguang Meng <maoguang.meng@mediatek.com>,
        Longfei Wang <longfei.wang@mediatek.com>,
        Yunfei Dong <yunfei.dong@mediatek.com>,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        srv_heupstream@mediatek.com, linux-mediatek@lists.infradead.org,
        Project_Global_Chrome_Upstream_Group@mediatek.com
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi,

On Wed, Jul 20, 2022 at 4:58 PM Irui Wang <irui.wang@mediatek.com> wrote:
>
> The "platform_get_resource(pdev, IORESOURCE_IRQ, 0)" is no longer
> used after commit a1a2b7125e107("of/platform: Drop static setup of
> IRQ resource from DT core"), so just remove the function in
> encoder driver to avoid driver probe failed.
>
> Signed-off-by: Irui Wang <irui.wang@mediatek.com>
> ---
>  .../media/platform/mediatek/vcodec/mtk_vcodec_enc_drv.c   | 8 --------
>  1 file changed, 8 deletions(-)
>
> diff --git a/drivers/media/platform/mediatek/vcodec/mtk_vcodec_enc_drv.c b/drivers/media/platform/mediatek/vcodec/mtk_vcodec_enc_drv.c
> index ea667b867b56..6d8964fb4fa2 100644
> --- a/drivers/media/platform/mediatek/vcodec/mtk_vcodec_enc_drv.c
> +++ b/drivers/media/platform/mediatek/vcodec/mtk_vcodec_enc_drv.c
> @@ -228,7 +228,6 @@ static int mtk_vcodec_probe(struct platform_device *pdev)
>  {
>         struct mtk_vcodec_dev *dev;
>         struct video_device *vfd_enc;
> -       struct resource *res;
>         phandle rproc_phandle;
>         enum mtk_vcodec_fw_type fw_type;
>         int ret;
> @@ -272,13 +271,6 @@ static int mtk_vcodec_probe(struct platform_device *pdev)
>                 goto err_res;
>         }
>
> -       res = platform_get_resource(pdev, IORESOURCE_IRQ, 0);
> -       if (res == NULL) {
> -               dev_err(&pdev->dev, "failed to get irq resource");
> -               ret = -ENOENT;
> -               goto err_res;
> -       }
> -
>         dev->enc_irq = platform_get_irq(pdev, 0);

platform_get_irq() returns a negative number on failure. You should
check for errors here as the previous check was removed.

The description of platform_get_irq() explicitly mentions:

    Device drivers should check the return value for errors so as to
    not pass a negative integer value to the request_irq() APIs.

Hans has queued up this patch, so maybe you could provide a follow-up
patch to fix this?


Regards
ChenYu


>         irq_set_status_flags(dev->enc_irq, IRQ_NOAUTOEN);
>         ret = devm_request_irq(&pdev->dev, dev->enc_irq,
> --
> 2.18.0
>
