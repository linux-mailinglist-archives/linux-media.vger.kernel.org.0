Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AAE2343184C
	for <lists+linux-media@lfdr.de>; Mon, 18 Oct 2021 13:58:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230478AbhJRMBB (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 18 Oct 2021 08:01:01 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:49496 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229781AbhJRMBA (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 18 Oct 2021 08:01:00 -0400
Received: from pendragon.ideasonboard.com (cpc89244-aztw30-2-0-cust3082.18-1.cable.virginm.net [86.31.172.11])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id A43AB8C6;
        Mon, 18 Oct 2021 13:58:47 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1634558327;
        bh=VO53NUXpVpxk/i/v3NczIQT48srH7kX+QlKH+aMbtMc=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=pIhfoL6N/JROU8/hNhymJYffG/VFkscXSPUqZftQNempnt5E3uQNxxclIibuD3ipa
         D4R/utKvNG4xhBVd28Jjk0HJPUDrm1ZyZ6hed7eRFjrQ1Rn5xxsmyu9LYTbocITBpC
         fQILki3OSL3uVwFoVJ7a/A+OEqh3ik69TkLs+HO0=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20210926155356.23861-1-nikita.yoush@cogentembedded.com>
References: <20210926155356.23861-1-nikita.yoush@cogentembedded.com>
Subject: Re: [PATCH] media: vsp1: mask interrupts before enabling
From:   Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Cc:     linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Koji Matsuoka <koji.matsuoka.xm@renesas.com>,
        Nikita Yushchenko <nikita.yoush@cogentembedded.com>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Nikita Yushchenko <nikita.yoush@cogentembedded.com>
Date:   Mon, 18 Oct 2021 12:58:45 +0100
Message-ID: <163455832550.1371157.18009256492359430197@Monstersaurus>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Nikita,

Quoting Nikita Yushchenko (2021-09-26 16:53:56)
> Setting up VSP interrupt handler without masking interrupt before causes
> interrupt handler to be immediately called (and crash due to null pointer
> dereference) on r8a77951-ulcb-kf board.
>=20
> Fix that by explicitly masking all interrupts before setting the interrupt
> handler. To do so, have to set the interrupt handler later, after hw
> revision is already detected and number of interrupts to mask gets
> known.
>=20
> Based on patch by Koji Matsuoka <koji.matsuoka.xm@renesas.com> included
> in the Renesas BSP kernel. Updated that to use wfp_count as the number of

s/wfp_count/wpf_count/

> WPF interrupts to mask.
>=20
> Signed-off-by: Nikita Yushchenko <nikita.yoush@cogentembedded.com>
> ---
>  drivers/media/platform/vsp1/vsp1_drv.c | 23 +++++++++++++++--------
>  1 file changed, 15 insertions(+), 8 deletions(-)
>=20
> diff --git a/drivers/media/platform/vsp1/vsp1_drv.c b/drivers/media/platf=
orm/vsp1/vsp1_drv.c
> index de442d6c9926..0e9a6fad54f8 100644
> --- a/drivers/media/platform/vsp1/vsp1_drv.c
> +++ b/drivers/media/platform/vsp1/vsp1_drv.c
> @@ -811,13 +811,6 @@ static int vsp1_probe(struct platform_device *pdev)
>                 return -EINVAL;
>         }
> =20
> -       ret =3D devm_request_irq(&pdev->dev, irq->start, vsp1_irq_handler,
> -                             IRQF_SHARED, dev_name(&pdev->dev), vsp1);
> -       if (ret < 0) {
> -               dev_err(&pdev->dev, "failed to request IRQ\n");
> -               return ret;
> -       }
> -
>         /* FCP (optional). */
>         fcp_node =3D of_parse_phandle(pdev->dev.of_node, "renesas,fcp", 0=
);
>         if (fcp_node) {
> @@ -847,7 +840,6 @@ static int vsp1_probe(struct platform_device *pdev)
>                 goto done;
> =20
>         vsp1->version =3D vsp1_read(vsp1, VI6_IP_VERSION);
> -       vsp1_device_put(vsp1);
> =20
>         for (i =3D 0; i < ARRAY_SIZE(vsp1_device_infos); ++i) {
>                 if ((vsp1->version & VI6_IP_VERSION_MODEL_MASK) =3D=3D
> @@ -861,11 +853,26 @@ static int vsp1_probe(struct platform_device *pdev)
>                 dev_err(&pdev->dev, "unsupported IP version 0x%08x\n",
>                         vsp1->version);
>                 ret =3D -ENXIO;
> +               vsp1_device_put(vsp1);
>                 goto done;
>         }
> =20
>         dev_dbg(&pdev->dev, "IP version 0x%08x\n", vsp1->version);
> =20
> +       for (i =3D 0; i < vsp1->info->lif_count; ++i)
> +               vsp1_write(vsp1, VI6_DISP_IRQ_ENB(i), 0);
> +       for (i =3D 0; i < vsp1->info->wpf_count; ++i)
> +               vsp1_write(vsp1, VI6_WPF_IRQ_ENB(i), 0);

Should any other state or context on the hardware be manually reset?

The initial value of VI6_WPFn_IRQ_ENB and VI6_DISPn_IRQ_ENB is
explicitly stated as H'00000000 in the datasheet. So perhaps that
implies that something else is going on here.

Perhaps the display is already used before the kernel boots to handle a
bootsplash screen or such ?

Will the 'pending' interrupts have otherwise been cleared by the time we
get to come to enable them? or will we still have a race...

Otherwise we should be clearing the status bits too. And if we need to
do a whole software reset, we should use the software reset controls
instead.

Looking at vsp1_device_init(), which does a vsp1_reset_wpf for any WPF
running, and is called at vsp1_pm_runtime_resume() means that everything
should already be getting reset by software at the first call to
pm_runtime_enable I think...

That said, I can see how there could still be a race so requesting the
IRQ below /after/ the device is initialised is a good thing. I just
don't think we need the manual resets that you've added above.

Could you test to see if those lines to explicitly set VI6_DISP_IRQ_ENB
and VI6_WPF_IRQ_ENB are really needed in your use case please?

--
Kieran


> +
> +       vsp1_device_put(vsp1);
> +
> +       ret =3D devm_request_irq(&pdev->dev, irq->start, vsp1_irq_handler,
> +                              IRQF_SHARED, dev_name(&pdev->dev), vsp1);
> +       if (ret < 0) {
> +               dev_err(&pdev->dev, "failed to request IRQ\n");
> +               goto done;
> +       }
> +
>         /* Instantiate entities. */
>         ret =3D vsp1_create_entities(vsp1);
>         if (ret < 0) {
> --=20
> 2.30.2
>
