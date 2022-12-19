Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 756A6650E3A
	for <lists+linux-media@lfdr.de>; Mon, 19 Dec 2022 16:04:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231712AbiLSPEd (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 19 Dec 2022 10:04:33 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36296 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231861AbiLSPEb (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 19 Dec 2022 10:04:31 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2D1AE5F93;
        Mon, 19 Dec 2022 07:04:30 -0800 (PST)
Received: from pendragon.ideasonboard.com (cpc89244-aztw30-2-0-cust3082.18-1.cable.virginm.net [86.31.172.11])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 81078825;
        Mon, 19 Dec 2022 16:04:27 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1671462267;
        bh=SP+HsLI1vuvjD1JOA3TmOAYZnqvPEDNxAWXRP4j7pT0=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=R/WtVRb882wcvL7RXdzmurajW6C6xzxxzjM/jJvY4s1RE6ykAATLnF6qGR1U2m8ZW
         opRKjY9xtK/moe4cm5sQDzViAVGfckS/Lu1xx5EvI3o400vLcLUBTdTT8IZTkMypgn
         6xvj9E0owCDHBGNsULB+9bUzNfHkcx3Dcp2Cnzbg=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20221219140139.294245-7-tomi.valkeinen+renesas@ideasonboard.com>
References: <20221219140139.294245-1-tomi.valkeinen+renesas@ideasonboard.com> <20221219140139.294245-7-tomi.valkeinen+renesas@ideasonboard.com>
Subject: Re: [PATCH v2 6/7] drm: rcar-du: Bump V3U to gen 4
From:   Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc:     Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Nicolas Dufresne <nicolas@ndufresne.ca>,
        Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
        dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org
Date:   Mon, 19 Dec 2022 15:04:24 +0000
Message-ID: <167146226437.530483.10441477468827267006@Monstersaurus>
User-Agent: alot/0.10
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Quoting Tomi Valkeinen (2022-12-19 14:01:38)
> V3U is actually gen 4 IP, like in V4H. Bumb up V3U gen in the

s/Bumb/bump/

Reviewed-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>

> rcar_du_r8a779a0_info.
>=20
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
> ---
>  drivers/gpu/drm/rcar-du/rcar_du_drv.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/gpu/drm/rcar-du/rcar_du_drv.c b/drivers/gpu/drm/rcar=
-du/rcar_du_drv.c
> index 46c60a2d710d..c7c5217cfc1a 100644
> --- a/drivers/gpu/drm/rcar-du/rcar_du_drv.c
> +++ b/drivers/gpu/drm/rcar-du/rcar_du_drv.c
> @@ -504,7 +504,7 @@ static const struct rcar_du_device_info rcar_du_r8a77=
99x_info =3D {
>  };
> =20
>  static const struct rcar_du_device_info rcar_du_r8a779a0_info =3D {
> -       .gen =3D 3,
> +       .gen =3D 4,
>         .features =3D RCAR_DU_FEATURE_CRTC_IRQ
>                   | RCAR_DU_FEATURE_VSP1_SOURCE
>                   | RCAR_DU_FEATURE_NO_BLENDING,
> --=20
> 2.34.1
>
