Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DB1E9200CA
	for <lists+linux-media@lfdr.de>; Thu, 16 May 2019 10:00:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726513AbfEPIAN (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 16 May 2019 04:00:13 -0400
Received: from mo4-p01-ob.smtp.rzone.de ([81.169.146.167]:36130 "EHLO
        mo4-p01-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726363AbfEPIAM (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 16 May 2019 04:00:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1557993611;
        s=strato-dkim-0002; d=fpond.eu;
        h=Subject:References:In-Reply-To:Message-ID:Cc:To:From:Date:
        X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
        bh=Fh/E99ZZmYm0AzFfSE/eH8T6ntLQF2HZJuv5OApnqmg=;
        b=pF1zWVCrVt8gvEX7xCyGhwwvwGrja2CfsjRhXiP841MesQ12PlVUMoqb5qEWwet/4U
        /yzkOZOXyvWLboEGNjK4NBjYFrLkfUtvL72BE886l9KIVTZcMkUrVLTfToCYXCecDiiG
        YFOb/QwbbWwhpDpHE21nxp/JQd2Pdg+LGfOWle5jGtDrEULXJoa94pD3zonUzN3Agtph
        PzbZA8xM0FrtpuOvXSrSTMkfgIRkgVeuwX7hQlu9MHzQ/axRcLtkc+jaD1fLUoNw+gvH
        feNw8DEBfgJGP7eR0yG5i06y1D8/ywjAXGAXvsJ9XenOBcVohM8Kr2/GxvqiDlJJYczV
        D6CQ==
X-RZG-AUTH: ":OWANVUa4dPFUgKR/3dpvnYP0Np73amq+g13rqGzmt2bYDnKIKaws6YXTsc4="
X-RZG-CLASS-ID: mo00
Received: from oxapp02-01.back.ox.d0m.de
        by smtp-ox.front (RZmta 44.18 AUTH)
        with ESMTPSA id y08c83v4G803sEa
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (curve X9_62_prime256v1 with 256 ECDH bits, eq. 3072 bits RSA))
        (Client did not present a certificate);
        Thu, 16 May 2019 10:00:03 +0200 (CEST)
Date:   Thu, 16 May 2019 10:00:03 +0200 (CEST)
From:   Ulrich Hecht <uli@fpond.eu>
To:     =?UTF-8?Q?Niklas_S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-media@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        kbuild test robot <lkp@intel.com>
Message-ID: <1852589922.68806.1557993603921@webmail.strato.com>
In-Reply-To: <20190516003538.32172-1-niklas.soderlund+renesas@ragnatech.se>
References: <20190516003538.32172-1-niklas.soderlund+renesas@ragnatech.se>
Subject: Re: [PATCH] rcar-csi2: Fix coccinelle warning for PTR_ERR_OR_ZERO()
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


> On May 16, 2019 at 2:35 AM Niklas S=C3=B6derlund <niklas.soderlund+renesa=
s@ragnatech.se> wrote:
>=20
>=20
> Use the PTR_ERR_OR_ZERO() macro instead of construct:
>=20
>     if (IS_ERR(foo))
>         return PTR_ERR(foo);
>=20
>     return 0;
>=20
> Reported-by: kbuild test robot <lkp@intel.com>
> Fixes: 3ae854cafd76 ("rcar-csi2: Use standby mode instead of resetting")
> Signed-off-by: Niklas S=C3=B6derlund <niklas.soderlund+renesas@ragnatech.=
se>
> ---
>  drivers/media/platform/rcar-vin/rcar-csi2.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
>=20
> diff --git a/drivers/media/platform/rcar-vin/rcar-csi2.c b/drivers/media/=
platform/rcar-vin/rcar-csi2.c
> index 8f097e514900307f..c14af1b929dffd34 100644
> --- a/drivers/media/platform/rcar-vin/rcar-csi2.c
> +++ b/drivers/media/platform/rcar-vin/rcar-csi2.c
> @@ -1019,10 +1019,8 @@ static int rcsi2_probe_resources(struct rcar_csi2 =
*priv,
>  =09=09return ret;
> =20
>  =09priv->rstc =3D devm_reset_control_get(&pdev->dev, NULL);
> -=09if (IS_ERR(priv->rstc))
> -=09=09return PTR_ERR(priv->rstc);
> =20
> -=09return 0;
> +=09return PTR_ERR_OR_ZERO(priv->rstc);
>  }
> =20
>  static const struct rcar_csi2_info rcar_csi2_info_r8a7795 =3D {
> --=20
> 2.21.0
>

Reviewed-by: Ulrich Hecht <uli+renesas@fpond.eu>

CU
Uli
