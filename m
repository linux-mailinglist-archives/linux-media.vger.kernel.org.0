Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2D7286F269B
	for <lists+linux-media@lfdr.de>; Sat, 29 Apr 2023 23:34:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229951AbjD2Vei (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 29 Apr 2023 17:34:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56038 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229529AbjD2Veh (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 29 Apr 2023 17:34:37 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A5F0810C9;
        Sat, 29 Apr 2023 14:34:35 -0700 (PDT)
Received: from pendragon.ideasonboard.com (aztw-30-b2-v4wan-166917-cust845.vm26.cable.virginm.net [82.37.23.78])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 0256E7FC;
        Sat, 29 Apr 2023 23:34:18 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1682804059;
        bh=LZoXqan75UwcunOqomJ4jU4DlWKy5Qnfw6E0FgmY9bA=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=WD7km4CI2yDQ2ytWllTZFntADItuIrYeOyJsxsfY8hFlurzyA/qBwhEAqXPFBvqg3
         RilFmycAGiP4b02rMFxQOaxtP3wj1riw1XcO8zFZvdOOP+Ku5JyANvsm2l6m7gomte
         dRHy+kHjjhAwXr4L6fGBL9zJ0tETAuMaPSMsd7BI=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <2cd104d61289cafcf17d8f1b0dbf5de5778a0a0c.1682504219.git.geert+renesas@glider.be>
References: <2cd104d61289cafcf17d8f1b0dbf5de5778a0a0c.1682504219.git.geert+renesas@glider.be>
Subject: Re: [PATCH v2] media: renesas: fdp1: Identify R-Car Gen2 versions
From:   Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Cc:     linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
To:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Date:   Sat, 29 Apr 2023 22:34:29 +0100
Message-ID: <168280406967.3916342.4898040249621793630@Monstersaurus>
User-Agent: alot/0.10
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Geert,

Quoting Geert Uytterhoeven (2023-04-26 11:18:24)
> On R-Car M2-W:
>=20
>     rcar_fdp1 fe940000.fdp1: FDP1 Unidentifiable (0x02010101)
>     rcar_fdp1 fe944000.fdp1: FDP1 Unidentifiable (0x02010101)
>=20
> Although the IP Internal Data Register on R-Car Gen2 is documented to
> contain all zeros, the actual register contents seem to match the FDP1
> version ID of R-Car H3 ES1.*, which has just been removed.
> Fortunately this version is not used for any other purposes yet.
>=20
> Fix this by re-adding the ID, now using an R-Car Gen2-specific name.
>=20
> Fixes: af4273b43f2bd9ee ("media: renesas: fdp1: remove R-Car H3 ES1.* han=
dling")
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> ---
> Version register contents verified on R-Car H2 ES1.0, R-Car M2-W ES1.0 &
> ES3.0, and R-Car E2 ES1.0.  I couldn't get hold of an R-Car M2-N.
>=20
> v2:
>   - Add Reviewed-by,
>   - Add comment.

Looks good!. A pain that the hardware doesn't match the documentation
but ... ho hum!


Reviewed-by: Kieran Bingham <kieran.bingham@ideasonboard.com>


> ---
>  drivers/media/platform/renesas/rcar_fdp1.c | 5 +++++
>  1 file changed, 5 insertions(+)
>=20
> diff --git a/drivers/media/platform/renesas/rcar_fdp1.c b/drivers/media/p=
latform/renesas/rcar_fdp1.c
> index 99af68fddc9249f5..d3bb3e71d61fd9dc 100644
> --- a/drivers/media/platform/renesas/rcar_fdp1.c
> +++ b/drivers/media/platform/renesas/rcar_fdp1.c
> @@ -254,6 +254,8 @@ MODULE_PARM_DESC(debug, "activate debug info");
> =20
>  /* Internal Data (HW Version) */
>  #define FD1_IP_INTDATA                 0x0800
> +/* R-Car Gen2 HW manual says zero, but actual value matches R-Car H3 ES1=
.x */
> +#define FD1_IP_GEN2                    0x02010101
>  #define FD1_IP_M3W                     0x02010202
>  #define FD1_IP_H3                      0x02010203
>  #define FD1_IP_M3N                     0x02010204
> @@ -2360,6 +2362,9 @@ static int fdp1_probe(struct platform_device *pdev)
> =20
>         hw_version =3D fdp1_read(fdp1, FD1_IP_INTDATA);
>         switch (hw_version) {
> +       case FD1_IP_GEN2:
> +               dprintk(fdp1, "FDP1 Version R-Car Gen2\n");
> +               break;
>         case FD1_IP_M3W:
>                 dprintk(fdp1, "FDP1 Version R-Car M3-W\n");
>                 break;
> --=20
> 2.34.1
>
