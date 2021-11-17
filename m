Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 84A9C454906
	for <lists+linux-media@lfdr.de>; Wed, 17 Nov 2021 15:40:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238677AbhKQOnw (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 17 Nov 2021 09:43:52 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:37132 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236521AbhKQOnw (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 17 Nov 2021 09:43:52 -0500
Received: from pendragon.ideasonboard.com (cpc89244-aztw30-2-0-cust3082.18-1.cable.virginm.net [86.31.172.11])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 6D9B22CF;
        Wed, 17 Nov 2021 15:40:52 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1637160052;
        bh=GlVxoafIkyTWNV9NuopOo/VpJXkPbHQdWMm1exK22FQ=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=i29wD4YPyenTFWFe0R+ff88SAocCBgEfjd11jsGsKFXmHEc3os+2ecmLe47AhNJ41
         JWhnVcnJTktP8HnHr58dUAEVBlPPvy9ma8wPS/tVtx2AcFBI2CCG3MYd/zX4adX0G0
         MOUiIomPBFyWnQkm8UQxWEMNBw6Nfk68sSM9A+HU=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20211116014726.1452-1-vulab@iscas.ac.cn>
References: <20211116014726.1452-1-vulab@iscas.ac.cn>
Subject: Re: [PATCH] media: mtk-jpeg: Remove unnecessary print function dev_err()
From:   Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc:     linux-media@vger.kernel.org, linux-mediatek@lists.infradead.org,
        linux-kernel@vger.kernel.org
To:     Xu Wang <vulab@iscas.ac.cn>, bin.liu@mediatek.com,
        matthias.bgg@gmail.com, mchehab@kernel.org, rick.chang@mediatek.com
Date:   Wed, 17 Nov 2021 14:40:49 +0000
Message-ID: <163716004951.420308.9398665375877390415@Monstersaurus>
User-Agent: alot/0.10
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Quoting Xu Wang (2021-11-16 01:47:26)
> The print function dev_err() is redundant because
> platform_get_irq() already prints an error.

This one was also reporting errors in the case of -EPROBE_DEFER, which
will now go away, so this looks like a valid change to me.

Reviewed-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>

> Signed-off-by: Xu Wang <vulab@iscas.ac.cn>
> ---
>  drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
>=20
> diff --git a/drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c b/drivers/me=
dia/platform/mtk-jpeg/mtk_jpeg_core.c
> index af994b9913a6..f332beb06d51 100644
> --- a/drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c
> +++ b/drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c
> @@ -1361,10 +1361,8 @@ static int mtk_jpeg_probe(struct platform_device *=
pdev)
>         }
> =20
>         jpeg_irq =3D platform_get_irq(pdev, 0);
> -       if (jpeg_irq < 0) {
> -               dev_err(&pdev->dev, "Failed to get jpeg_irq %d.\n", jpeg_=
irq);
> +       if (jpeg_irq < 0)
>                 return jpeg_irq;
> -       }
> =20
>         ret =3D devm_request_irq(&pdev->dev, jpeg_irq,
>                                jpeg->variant->irq_handler, 0, pdev->name,=
 jpeg);
> --=20
> 2.25.1
>
