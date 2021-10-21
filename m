Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 707B2435DA2
	for <lists+linux-media@lfdr.de>; Thu, 21 Oct 2021 11:08:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231490AbhJUJLG (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 21 Oct 2021 05:11:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49292 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231153AbhJUJLF (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 21 Oct 2021 05:11:05 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 85D5EC06161C;
        Thu, 21 Oct 2021 02:08:49 -0700 (PDT)
Received: from pendragon.ideasonboard.com (cpc89244-aztw30-2-0-cust3082.18-1.cable.virginm.net [86.31.172.11])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 2376A2BA;
        Thu, 21 Oct 2021 11:08:46 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1634807326;
        bh=1R6z7yIisJy0tgOfsaD+O62w7W2Ho8F1w+hStl7uzrg=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=YNAPTcfNR2J+82uNeXYvZHAGeNBD5FoZBGBv6M15A/fOyxo3LDkXjYu+PVSRgnTBk
         vXxsqIyFCUIETwvthk5YPEPohRz+jIIXPb29K3d00N2TWb12Ikt8ajPClROhcKVBXV
         4Iavf6AvkSWquBGCNhLVgYjOF+6ZxTEdRdB5sjQs=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <CAMuHMdWD+FXt-rUz6oiU9MNq3EiKExgic17kCnUjynidii470w@mail.gmail.com>
References: <20211021030938.51884-1-tangbin@cmss.chinamobile.com> <CAMuHMdWD+FXt-rUz6oiU9MNq3EiKExgic17kCnUjynidii470w@mail.gmail.com>
Subject: Re: [PATCH] media: rcar_fdp1: Fix the correct variable assignments
From:   Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
To:     Geert Uytterhoeven <geert@linux-m68k.org>,
        Tang Bin <tangbin@cmss.chinamobile.com>
Date:   Thu, 21 Oct 2021 10:08:43 +0100
Message-ID: <163480732348.2663858.5189176300885425535@Monstersaurus>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Tang,

Quoting Geert Uytterhoeven (2021-10-21 08:59:18)
> Hi Tang,
>=20
> Thanks for your patch!
>=20
> On Thu, Oct 21, 2021 at 5:10 AM Tang Bin <tangbin@cmss.chinamobile.com> w=
rote:
> > In the function fdp1_probe(), when get irq failed, the
> > function platform_get_irq() log an error message, so
> > remove redundant message here. And the variable type
> > of "ret" is int, the "fdp1->irq" is unsigned int, when
> > irq failed, this place maybe wrong, thus fix it.
>=20
> The second issue is not actually present, as the error check
> operates on ret, not fdp1->irq?

Agreed, the error print is redundant.=20

In fact it would have erroneously print on ret=3D-EPROBE_DEFER cases too,
so it's not just redundant, but inaccurate too.

I don't think the assignment of fdp1->irq =3D ret at the same time is an
issue, because if ret < 0, fdp1->irq wouldn't ever get read, as the call
returns.

But .. I have no objection to setting it after instead.

> > Signed-off-by: Tang Bin <tangbin@cmss.chinamobile.com>
>=20
> > --- a/drivers/media/platform/rcar_fdp1.c
> > +++ b/drivers/media/platform/rcar_fdp1.c
> > @@ -2289,11 +2289,10 @@ static int fdp1_probe(struct platform_device *p=
dev)
> >                 return PTR_ERR(fdp1->regs);
> >
> >         /* Interrupt service routine registration */
> > -       fdp1->irq =3D ret =3D platform_get_irq(pdev, 0);
> > -       if (ret < 0) {
> > -               dev_err(&pdev->dev, "cannot find IRQ\n");
> > +       ret =3D platform_get_irq(pdev, 0);
> > +       if (ret < 0)
> >                 return ret;
> > -       }
> > +       fdp1->irq =3D ret;
> >
> >         ret =3D devm_request_irq(&pdev->dev, fdp1->irq, fdp1_irq_handle=
r, 0,
> >                                dev_name(&pdev->dev), fdp1);
>=20
> Anyway, the code is correct, so:
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Perhaps with the commit message updated/simplified, but either way:

Reviewed-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>

>=20
> Gr{oetje,eeting}s,
>=20
>                         Geert
>=20
> --
> Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m6=
8k.org
>=20
> In personal conversations with technical people, I call myself a hacker. =
But
> when I'm talking to journalists I just say "programmer" or something like=
 that.
>                                 -- Linus Torvalds
