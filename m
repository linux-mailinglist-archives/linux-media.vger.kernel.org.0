Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 17EC245D047
	for <lists+linux-media@lfdr.de>; Wed, 24 Nov 2021 23:45:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1348166AbhKXWsb (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 24 Nov 2021 17:48:31 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:41664 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345477AbhKXWsa (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 24 Nov 2021 17:48:30 -0500
Received: from pendragon.ideasonboard.com (cpc89244-aztw30-2-0-cust3082.18-1.cable.virginm.net [86.31.172.11])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 643AB92A;
        Wed, 24 Nov 2021 23:45:19 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1637793919;
        bh=bZDUepvDmlpvloLrD0poARIebcqsrEFGHTUvsBxmuBo=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=rZPgX9dloj620AwdAwAJCmtMw1WKrLGOrg3pQtv/Bc9+RnakiVv86rfcilp9cn49L
         cjb4r6OGmnQ6b6pDikTJutyH3E0JqUNY8xX5PEN4gRr1BylVuooPnNnxd8K2t09zTY
         Xo/AGVGpnLTAqeu6mSscWiQEpWhT62t9QGV0lQaE=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20211123155443.3705143-1-niklas.soderlund+renesas@ragnatech.se>
References: <20211123155443.3705143-1-niklas.soderlund+renesas@ragnatech.se>
Subject: Re: [PATCH] rcar-vin: Add check for completed capture before completing buffer
From:   Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc:     linux-renesas-soc@vger.kernel.org,
        Niklas =?utf-8?q?S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Niklas =?utf-8?q?S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>,
        linux-media@vger.kernel.org
Date:   Wed, 24 Nov 2021 22:45:17 +0000
Message-ID: <163779391741.3153335.8189408341245810954@Monstersaurus>
User-Agent: alot/0.10
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Quoting Niklas S=C3=B6derlund (2021-11-23 15:54:43)
> Before reading which slot was captured to by examining the module status
> (VnMS) register, make sure something was captured at all by examining
> the interrupt status register (VnINTS).
>=20
> Failing this a buffer maybe completed before it was captured too.
>=20
> Signed-off-by: Niklas S=C3=B6derlund <niklas.soderlund+renesas@ragnatech.=
se>
> ---
>  drivers/media/platform/rcar-vin/rcar-dma.c | 7 +++++++
>  1 file changed, 7 insertions(+)
>=20
> diff --git a/drivers/media/platform/rcar-vin/rcar-dma.c b/drivers/media/p=
latform/rcar-vin/rcar-dma.c
> index 25ead9333d0046e7..87ccbdc3d11a0f2d 100644
> --- a/drivers/media/platform/rcar-vin/rcar-dma.c
> +++ b/drivers/media/platform/rcar-vin/rcar-dma.c
> @@ -111,6 +111,9 @@
>  #define VNIE_FIE               (1 << 4)
>  #define VNIE_EFE               (1 << 1)
> =20
> +/* Video n Interrupt Status Register bits */
> +#define VNINTS_FIS             (1 << 4)
> +
>  /* Video n Data Mode Register bits */
>  #define VNDMR_A8BIT(n)         (((n) & 0xff) << 24)
>  #define VNDMR_A8BIT_MASK       (0xff << 24)
> @@ -1005,6 +1008,10 @@ static irqreturn_t rvin_irq(int irq, void *data)
>         rvin_ack_interrupt(vin);
>         handled =3D 1;
> =20
> +       /* Nothing to do if nothing was captured. */
> +       if (!(int_status & VNINTS_FIS))

Does this deserve a warning or debug print? It sounds like it may be
somewhat spurious or unexpected if it occurs?

--
Kieran


> +               goto done;
> +
>         /* Nothing to do if capture status is 'STOPPED' */
>         if (vin->state =3D=3D STOPPED) {
>                 vin_dbg(vin, "IRQ while state stopped\n");
> --=20
> 2.34.0
>
