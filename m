Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E32C53C85BD
	for <lists+linux-media@lfdr.de>; Wed, 14 Jul 2021 16:04:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232512AbhGNOHB (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 14 Jul 2021 10:07:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55326 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231543AbhGNOHA (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 14 Jul 2021 10:07:00 -0400
Received: from mail-ot1-x336.google.com (mail-ot1-x336.google.com [IPv6:2607:f8b0:4864:20::336])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 37F8CC06175F;
        Wed, 14 Jul 2021 07:04:09 -0700 (PDT)
Received: by mail-ot1-x336.google.com with SMTP id v32-20020a0568300920b02904b90fde9029so2554789ott.7;
        Wed, 14 Jul 2021 07:04:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=wZziUwL+M2w730ClvqNdJYiu4SC1wJywplU+5JkQfL4=;
        b=HlzOW3cQoA1QoGQZjHbgn4ILjfXFrLzvqmIt2lPaPUucIfYdqUPlzurKfsFEWaeG0H
         5+EfyyfbF1PZPN1SXhX2h94Fre9jQLh4UZC1COm4Gg/EIifu5dB6qKDvODtH4QFB6SOi
         /+l6LPYDm279wnuPv+2XbzoMWRDNkX6IAQZUBQXf5ORWaQV763j3INsNArSLeF+dNgpK
         hq5a0NMqkNlmsIu0eLhPYCp5l/23V+iheToBy2PZWVhz0Bx8JlmLUbXL397vxfrg/L5W
         YoxurOaFc2pUTaV5gtiVGW4xFIs4aYy3LJ2DSLi9dMvQXsWeWG45voxcG8ryAymW27cA
         ZIwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=wZziUwL+M2w730ClvqNdJYiu4SC1wJywplU+5JkQfL4=;
        b=Hz/7fpO4Od69OrYR8B+73B+lbdMsYCMwi9cnP+IEe2eTKtoZFJNmwtvcw/89DyfoTi
         cTOjGPc1aznovHX//vWU2RrRy9qw5h+CxA0bYpSnEQFekdcAG5g8Szp1FPInRxYZVULk
         w6bwMJoBMSRmYs6SlDUY/VKDYvpm5cyYpHdALkRd183q8WznijTkFH685VJK3oi7v+Mz
         Z/FDhbi/tCmYCdsFvC8JipRjtIY+LpnSlgSsWdPy05GZ2cQZ/4QJG3/cuScIUm3U/Q07
         h++KZrqgoXWR/UeGTVQMHnCJqi9MA7nVhijW0vNDb4ZlunMwi8xcQqVzkoXdWvp8yOid
         FPNw==
X-Gm-Message-State: AOAM533En3eD8fzur4lnfer5fai6MrFQWaXkrn0GuJW/yR9OKY1WtPVS
        OLuUs7lCHdgyf6MJNHB6+V6fzT+Dc4Kr9OFLwAQ=
X-Google-Smtp-Source: ABdhPJyeowY6sKdOkSN1oqD0CTSf04bn/X5iMfBstx2S5hpuYx6gteWjVwa+Om6ZLAm/oHzITr9E8FsJ0sSOcw7R2qc=
X-Received: by 2002:a05:6830:1bef:: with SMTP id k15mr8483724otb.362.1626271448603;
 Wed, 14 Jul 2021 07:04:08 -0700 (PDT)
MIME-Version: 1.0
References: <20210714134850.402-1-dafna.hirschfeld@collabora.com>
In-Reply-To: <20210714134850.402-1-dafna.hirschfeld@collabora.com>
From:   Enric Balletbo Serra <eballetbo@gmail.com>
Date:   Wed, 14 Jul 2021 16:03:56 +0200
Message-ID: <CAFqH_52s0qtPT5SE1BUQrsrwg1XB7hLSExeC-ER5nTggKaeeOA@mail.gmail.com>
Subject: Re: [PATCH] media: mtk-vpu: Ensure alignment of 8 for DTCM buffer
To:     Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
Cc:     Linux Media Mailing List <linux-media@vger.kernel.org>,
        "moderated list:ARM/Mediatek SoC support" 
        <linux-mediatek@lists.infradead.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Collabora Kernel ML <kernel@collabora.com>, dafna3@gmail.com,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Tomasz Figa <tfiga@chromium.org>,
        Enric Balletbo i Serra <enric.balletbo@collabora.com>,
        Minghsiu Tsai <minghsiu.tsai@mediatek.com>,
        Houlong Wei <houlong.wei@mediatek.com>,
        Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
        Tiffany Lin <tiffany.lin@mediatek.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Alexandre Courbot <acourbot@chromium.org>,
        Hsin-Yi Wang <hsinyi@chromium.org>,
        Eizan Miyamoto <eizan@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Dafna,

Thank you for working on this and sending the patch to upstream for
further discussion.

Missatge de Dafna Hirschfeld <dafna.hirschfeld@collabora.com> del dia
dc., 14 de jul. 2021 a les 15:49:
>
> From: Enric Balletbo i Serra <enric.balletbo@collabora.com>
>

Sorry to confuse you, but I'm not the author of this patch, my from is
only here because I shared with you that patch that I really picked
from a discussion that took place here:

  https://chromium-review.googlesource.com/c/chromiumos/third_party/kernel/+/2251840

It'd be really nice to continue the discussion here and set a proper
fix and understand better the root cause and the fix. The patch really
fixes an issue in mainline for mtk-vcodec driver on the mt8173
devices, I can confirm that without it doesn't work properly.

Waiting for your thoughts,
  Enric

> When running memcpy_toio:
> memcpy_toio(send_obj->share_buf, buf, len);
> it was found that errors appear if len is not a multiple of 8:
>
> [58.350841] mtk-mdp 14001000.rdma: processing failed: -22
>
> This patch ensure copy of a multile of 8 size by calling
> round_up(len, 8) when copying
>
> Fixes: e6599adfad30 ("media: mtk-vpu: avoid unaligned access to DTCM buffer.")
> Reported-by: Alexandre Courbot <acourbot@chromium.org>
> Signed-off-by: Enric Balletbo i Serra <enric.balletbo@collabora.com>
> Signed-off-by: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
> ---
>  drivers/media/platform/mtk-vpu/mtk_vpu.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/media/platform/mtk-vpu/mtk_vpu.c b/drivers/media/platform/mtk-vpu/mtk_vpu.c
> index ec290dde59cf..b464d8192119 100644
> --- a/drivers/media/platform/mtk-vpu/mtk_vpu.c
> +++ b/drivers/media/platform/mtk-vpu/mtk_vpu.c
> @@ -316,6 +316,7 @@ int vpu_ipi_send(struct platform_device *pdev,
>  {
>         struct mtk_vpu *vpu = platform_get_drvdata(pdev);
>         struct share_obj __iomem *send_obj = vpu->send_buf;
> +       unsigned char data[SHARE_BUF_SIZE];
>         unsigned long timeout;
>         int ret = 0;
>
> @@ -349,7 +350,9 @@ int vpu_ipi_send(struct platform_device *pdev,
>                 }
>         } while (vpu_cfg_readl(vpu, HOST_TO_VPU));
>
> -       memcpy_toio(send_obj->share_buf, buf, len);
> +       memset(data, 0, sizeof(data));
> +       memcpy(data, buf, len);
> +       memcpy_toio(send_obj->share_buf, data, round_up(len, 8));
>         writel(len, &send_obj->len);
>         writel(id, &send_obj->id);
>
> --
> 2.17.1
>
>
> _______________________________________________
> Linux-mediatek mailing list
> Linux-mediatek@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-mediatek
