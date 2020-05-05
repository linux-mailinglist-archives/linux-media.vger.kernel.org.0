Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5F4351C6350
	for <lists+linux-media@lfdr.de>; Tue,  5 May 2020 23:46:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729315AbgEEVqA (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 5 May 2020 17:46:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35058 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1729284AbgEEVp7 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 5 May 2020 17:45:59 -0400
Received: from mail-qt1-x843.google.com (mail-qt1-x843.google.com [IPv6:2607:f8b0:4864:20::843])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B70AEC061A0F;
        Tue,  5 May 2020 14:45:57 -0700 (PDT)
Received: by mail-qt1-x843.google.com with SMTP id w29so3432704qtv.3;
        Tue, 05 May 2020 14:45:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
        bh=NpBCtXOwKgxraDAqMLQlaDGkzFixaXVJTgaJ+cTQxAU=;
        b=sqLgPwwXtoPOEBnbyVTD6cYOITJkB1ur03Mep+sRAK+XUgaNrFAyE1lDzIB00zAdlA
         6XeBSXZLSFiU0uDkHJyj6GZPTpQk8p56wyJ73XSh5t3n5bsFC5QSUMfcXSsogFI+J0jT
         xLT/Xublm0dIcBdi9dDi74+OWApLxpLXHg+HG4Gx1R3CN5yldhkFi9zffnP68om5Eg6q
         Uviv207VmRm03ls+hifi2+gaji2e/SnSxbGgpGlQM+S2DaDn06nMKEMmSoGroEg1pQ8Z
         EGooot7kZn4zrfiTkYucLr2zCOSkhfHBKx7sTeVB1Fr+Iy0mCYTrKgx+cJUpVFaEi8un
         PMGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to;
        bh=NpBCtXOwKgxraDAqMLQlaDGkzFixaXVJTgaJ+cTQxAU=;
        b=XCo646vh9FJ7do4bXiJyU7Ke5e6dUUAyi/vYCHUaEl1e5uhKCshJD7g3jYn5urwE7P
         I32mbDfy02eD7DQMa5QsKqqAc4TqeVvYkp9nnbzZMc80wojRLX0uvCbv8LDOugoos29Q
         jbookrl1IaiXHC7oacgzyIdQA8nv7QbpGJ3BGWhQA94SqVQzhH6bojtZutd/RYxR4Zbn
         CF6aJKqqFHy62QX9hba2bVUbDvDoLk9KYN/+wL0fYQnGHEcpqV/LYiKN3An6Kp0EihiN
         38MJQll04GpNzOR4r2qhvU8bs5UUCh8yqlc6sMOrLGmBr5CUCVbYAAEkEjgUqT6Mqrrz
         aVMw==
X-Gm-Message-State: AGi0PuZGpDt79h5VynyD6IEhjMdM6l6pbnxXtZ04O8Ar6GZ1WmlpkkNC
        b1s2BQnVA1GztylcB69zJQUSEjSwXrT2xKy+hf4=
X-Google-Smtp-Source: APiQypJ+I7qzGCg7I3XEFp+30dxyhhDaYL307MRMPZ3KJ2JDfJIaAmHE2VyjJI3pkzHl5cnzFRj2Db79lVlNOnLj3x4=
X-Received: by 2002:ac8:27cb:: with SMTP id x11mr5207636qtx.272.1588715156968;
 Tue, 05 May 2020 14:45:56 -0700 (PDT)
MIME-Version: 1.0
References: <20200505040048.132493-1-eizan@google.com> <20200505125042.v1.2.Ie596e59e0a18935f0b7321ff45e5c5f2ce8082b1@changeid>
In-Reply-To: <20200505125042.v1.2.Ie596e59e0a18935f0b7321ff45e5c5f2ce8082b1@changeid>
From:   Enric Balletbo Serra <eballetbo@gmail.com>
Date:   Tue, 5 May 2020 23:45:45 +0200
Message-ID: <CAFqH_52qx7g5BLUBGoUQGFTcFE9FjWGe+i9on=5p7ZqzObsB6g@mail.gmail.com>
Subject: Re: [PATCH v1 2/5] [media] mtk-mdp: handle vb2_dma_contig_set_max_seg_size
 errors during probe
To:     Eizan Miyamoto <eizan@chromium.org>,
        Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
        Minghsiu Tsai <minghsiu.tsai@mediatek.com>,
        Houlong Wei <houlong.wei@mediatek.com>,
        Eizan Miyamoto <eizan@google.com>,
        "moderated list:ARM/Mediatek SoC support" 
        <linux-mediatek@lists.infradead.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        linux-media@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Eizan,

Thank you for your patch.

Missatge de Eizan Miyamoto <eizan@chromium.org> del dia dt., 5 de maig
2020 a les 6:01:
>
> This is a cleanup to better handle errors during MDP probe.
>
> Signed-off-by: eizan@chromium.org
> Signed-off-by: Eizan Miyamoto <eizan@google.com>

Same comment as the first patch. You should probably fix your configuration.

> ---
>
>  drivers/media/platform/mtk-mdp/mtk_mdp_core.c | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/media/platform/mtk-mdp/mtk_mdp_core.c b/drivers/media/platform/mtk-mdp/mtk_mdp_core.c
> index aeaed2cf4458..c20ac7681c6f 100644
> --- a/drivers/media/platform/mtk-mdp/mtk_mdp_core.c
> +++ b/drivers/media/platform/mtk-mdp/mtk_mdp_core.c
> @@ -193,13 +193,19 @@ static int mtk_mdp_probe(struct platform_device *pdev)
>
>         platform_set_drvdata(pdev, mdp);
>
> -       vb2_dma_contig_set_max_seg_size(&pdev->dev, DMA_BIT_MASK(32));
> +       ret = vb2_dma_contig_set_max_seg_size(&pdev->dev, DMA_BIT_MASK(32));
> +       if (ret) {
> +               dev_err(&pdev->dev, "Failed to set vb2 dma mag seg size\n");
> +               goto err_set_max_seg_size;

You don't need to introduce a new label, just goto err_m2m_register



> +       }
>
>         pm_runtime_enable(dev);
>         dev_dbg(dev, "mdp-%d registered successfully\n", mdp->id);
>
>         return 0;
>
> +err_set_max_seg_size:
> +
>  err_m2m_register:
>         v4l2_device_unregister(&mdp->v4l2_dev);
>
> --
> 2.26.2.526.g744177e7f7-goog
>
>
> _______________________________________________
> Linux-mediatek mailing list
> Linux-mediatek@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-mediatek
