Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D7302202F7
	for <lists+linux-media@lfdr.de>; Thu, 16 May 2019 11:57:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727135AbfEPJ5t (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 16 May 2019 05:57:49 -0400
Received: from mo4-p00-ob.smtp.rzone.de ([81.169.146.217]:15533 "EHLO
        mo4-p00-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726597AbfEPJ5t (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 16 May 2019 05:57:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1558000666;
        s=strato-dkim-0002; d=fpond.eu;
        h=Subject:References:In-Reply-To:Message-ID:Cc:To:From:Date:
        X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
        bh=r0BsnoAtSmCzcPQi3INo+ocomq2H/zEmz/Z3lWmNcVc=;
        b=WGqfgV8Io1a1zs//wvEr7KmM5yjBuHudfnukbEZui1sqCUXUBUtgFzEZJ8l+BQSwSA
        A2Ik9XxAcytr+p/UkIZTueVY7Kik9Kr0wQwwEt7vwZR2OZOEGKdgFcA0QlqQUnFfJqlj
        xWJ+cPxqcipV88dbVpmtoj6UREgHZhGzbIu49uNlm+dT+1qTeUo0ejdJFY5l50sPO75/
        1IXkjPzIZOOSS4PclCyWwTNJ7rIYjnE/B2OLL1F+fEZQVfBfHriqlY6NlHGjJr8mQecn
        0ctc763HtYevF2K4aJ5n4JiebC3MDAxTBamHbjfuKP5Kax9G2eWDTYFe6S4nHV2MXqFe
        41Ag==
X-RZG-AUTH: ":OWANVUa4dPFUgKR/3dpvnYP0Np73amq+g13rqGzmt2bYDnKIKaws6YXTsc4="
X-RZG-CLASS-ID: mo00
Received: from oxapp02-01.back.ox.d0m.de
        by smtp-ox.front (RZmta 44.18 AUTH)
        with ESMTPSA id y08c83v4G9vksu0
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (curve X9_62_prime256v1 with 256 ECDH bits, eq. 3072 bits RSA))
        (Client did not present a certificate);
        Thu, 16 May 2019 11:57:46 +0200 (CEST)
Date:   Thu, 16 May 2019 11:57:46 +0200 (CEST)
From:   Ulrich Hecht <uli@fpond.eu>
To:     =?UTF-8?Q?Niklas_S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-media@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org
Message-ID: <1641688353.81825.1558000666748@webmail.strato.com>
In-Reply-To: <20190516004746.3794-2-niklas.soderlund+renesas@ragnatech.se>
References: <20190516004746.3794-1-niklas.soderlund+renesas@ragnatech.se>
 <20190516004746.3794-2-niklas.soderlund+renesas@ragnatech.se>
Subject: Re: [PATCH 1/3] rcar-vin: Rename VNDMR_DTMD_ARGB1555 to
 VNDMR_DTMD_ARGB
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Priority: 3
Importance: Medium
X-Mailer: Open-Xchange Mailer v7.8.4-Rev57
X-Originating-IP: 85.212.214.135
X-Originating-Client: open-xchange-appsuite
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


> On May 16, 2019 at 2:47 AM Niklas S=C3=B6derlund <niklas.soderlund+renesa=
s@ragnatech.se> wrote:
>=20
>=20
> The value have nothing to do with ARGB1555, it controls if the alpha
> component should be filled in for ARGB1555 or ARGB888. Rename it to
> reflect this.
>=20
> Signed-off-by: Niklas S=C3=B6derlund <niklas.soderlund+renesas@ragnatech.=
se>
> ---
>  drivers/media/platform/rcar-vin/rcar-dma.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/media/platform/rcar-vin/rcar-dma.c b/drivers/media/p=
latform/rcar-vin/rcar-dma.c
> index 91ab064404a185af..2d146ecf93d66ad5 100644
> --- a/drivers/media/platform/rcar-vin/rcar-dma.c
> +++ b/drivers/media/platform/rcar-vin/rcar-dma.c
> @@ -114,7 +114,7 @@
>  #define VNDMR_EXRGB=09=09(1 << 8)
>  #define VNDMR_BPSM=09=09(1 << 4)
>  #define VNDMR_DTMD_YCSEP=09(1 << 1)
> -#define VNDMR_DTMD_ARGB1555=09(1 << 0)
> +#define VNDMR_DTMD_ARGB=09=09(1 << 0)
> =20
>  /* Video n Data Mode Register 2 bits */
>  #define VNDMR2_VPS=09=09(1 << 30)
> @@ -721,7 +721,7 @@ static int rvin_setup(struct rvin_dev *vin)
>  =09=09output_is_yuv =3D true;
>  =09=09break;
>  =09case V4L2_PIX_FMT_XRGB555:
> -=09=09dmr =3D VNDMR_DTMD_ARGB1555;
> +=09=09dmr =3D VNDMR_DTMD_ARGB;
>  =09=09break;
>  =09case V4L2_PIX_FMT_RGB565:
>  =09=09dmr =3D 0;
> --=20
> 2.21.0
>

Reviewed-by: Ulrich Hecht <uli+renesas@fpond.eu>

CU
Uli
