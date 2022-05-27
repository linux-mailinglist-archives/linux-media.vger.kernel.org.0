Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E2A0C53628D
	for <lists+linux-media@lfdr.de>; Fri, 27 May 2022 14:28:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241567AbiE0M2O (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 27 May 2022 08:28:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56064 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1354215AbiE0MZj (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 27 May 2022 08:25:39 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 47BB763391;
        Fri, 27 May 2022 05:03:21 -0700 (PDT)
Received: from pendragon.ideasonboard.com (cpc89244-aztw30-2-0-cust3082.18-1.cable.virginm.net [86.31.172.11])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id C8509305;
        Fri, 27 May 2022 14:03:18 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1653652998;
        bh=aHAtY9WKA3vunkfTCR0DRvsKmSw92w8t8NQ/qCaDuUY=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=sqrzisRqSYfVgSNMauSuDpxuM4dBw13ICXRSwbflrtHZ2X+qprvJpS728FCZvu7n9
         W9m9NSepEMHHE9ZTjSqaQtjhkU0LB6dyoDZ9Xx5QMBK6W2N4wa5sVP2QVtIsh1erK7
         0HN7jQfiJ3T2rX9AWngXwCAOU6E+eNR55y2R8DW0=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20220525092054.26089-1-laurent.pinchart+renesas@ideasonboard.com>
References: <20220525092054.26089-1-laurent.pinchart+renesas@ideasonboard.com>
Subject: Re: [PATCH] media: renesas: rcar_drif: Drop of_match_ptr()
From:   Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc:     linux-renesas-soc@vger.kernel.org,
        Fabrizio Castro <fabrizio.castro.jz@renesas.com>
To:     Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        linux-media@vger.kernel.org
Date:   Fri, 27 May 2022 13:03:17 +0100
Message-ID: <165365299706.1823135.14333390932062955644@Monstersaurus>
User-Agent: alot/0.10
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Quoting Laurent Pinchart (2022-05-25 10:20:54)
> The device_driver structure's of_match_table field exists
> unconditionally, so there's no need for of_match_ptr(). This fixes a
> compiler warning when test-compiling on non-OF platforms:
>=20
> drivers/media/platform/renesas/rcar_drif.c:1470:34: warning: unused varia=
ble 'rcar_drif_of_table' [-Wunused-const-variable]
> static const struct of_device_id rcar_drif_of_table[] =3D {
>                                  ^
> Reported-by: kernel test robot <lkp@intel.com>
> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.co=
m>

Reviewed-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>

> ---
>  drivers/media/platform/renesas/rcar_drif.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/media/platform/renesas/rcar_drif.c b/drivers/media/p=
latform/renesas/rcar_drif.c
> index 9a0982fa5c6b..5167960781bf 100644
> --- a/drivers/media/platform/renesas/rcar_drif.c
> +++ b/drivers/media/platform/renesas/rcar_drif.c
> @@ -1477,7 +1477,7 @@ MODULE_DEVICE_TABLE(of, rcar_drif_of_table);
>  static struct platform_driver rcar_drif_driver =3D {
>         .driver =3D {
>                 .name =3D RCAR_DRIF_DRV_NAME,
> -               .of_match_table =3D of_match_ptr(rcar_drif_of_table),
> +               .of_match_table =3D rcar_drif_of_table,
>                 .pm =3D &rcar_drif_pm_ops,
>                 },
>         .probe =3D rcar_drif_probe,
>=20
> base-commit: 6c1c1eb8c87de221051b9198d40971640060842f
> --=20
> Regards,
>=20
> Laurent Pinchart
>
