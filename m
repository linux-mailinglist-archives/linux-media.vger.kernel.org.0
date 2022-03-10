Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DAB9D4D4499
	for <lists+linux-media@lfdr.de>; Thu, 10 Mar 2022 11:30:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237035AbiCJKbJ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 10 Mar 2022 05:31:09 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56784 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229627AbiCJKbI (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 10 Mar 2022 05:31:08 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 57179139111;
        Thu, 10 Mar 2022 02:30:06 -0800 (PST)
Received: from pendragon.ideasonboard.com (cpc89244-aztw30-2-0-cust3082.18-1.cable.virginm.net [86.31.172.11])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 8EE594AB;
        Thu, 10 Mar 2022 11:30:03 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1646908203;
        bh=KAXmryB0vxqyrH/sdzNKVLSz4adLQt4di4zYqhekAdc=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=ZYU1IfhPmJzgsYdIal50+C8WOm01WYdRTGOMREaNlLXraOcX1ykANa8jTwvtKgMN3
         0fpae1h4/Dp1OtzrvxX83TEwa41bRAgsETConfhyWJs1EaddpaCuFimBxdgUrDoAQ4
         Td9ToBAKiMOaEEIk+iJ89XYMayVcIYo+jVQrrmMQ=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20220309194521.7028-4-biju.das.jz@bp.renesas.com>
References: <20220309194521.7028-1-biju.das.jz@bp.renesas.com> <20220309194521.7028-4-biju.das.jz@bp.renesas.com>
Subject: Re: [PATCH 3/3] media: vsp1: Add support for RZ/G2L VSPD
From:   Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Cc:     Biju Das <biju.das.jz@bp.renesas.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
To:     Biju Das <biju.das.jz@bp.renesas.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>
Date:   Thu, 10 Mar 2022 10:30:01 +0000
Message-ID: <164690820109.123014.3107899517422264094@Monstersaurus>
User-Agent: alot/0.10
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Biju,

Quoting Biju Das (2022-03-09 19:45:21)
> The RZ/G2L VSPD provides a single VSPD instance. It has the following
> sub modules MAU, CTU, RPF, DPR, LUT, BRS, WPF and LIF.
>=20
> The VSPD block on RZ/G2L does not have a version register, so added a
> new compatible string "renesas,vsp2-rzg2l" with a data pointer containing

Does this mean it is 'not' a VSP2? Is it a VSP2-lite or something
different? (As opposed to 'the vsp2 found in an rzg2l part').


> the info structure. Also the reset line is shared with the DU module
> so devm_reset_control_get_shared() call is used in case of RZ/G2L.
>=20
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> ---
> RFC->v1:
>  * Used data pointer containing info structure to retrieve version inform=
ation
> RFC:
>  * https://patchwork.kernel.org/project/linux-renesas-soc/patch/202201121=
74612.10773-21-biju.das.jz@bp.renesas.com/
> ---
>  drivers/media/platform/vsp1/vsp1_drv.c  | 32 +++++++++++++++++++------
>  drivers/media/platform/vsp1/vsp1_lif.c  |  7 ++++--
>  drivers/media/platform/vsp1/vsp1_regs.h |  1 +
>  3 files changed, 31 insertions(+), 9 deletions(-)
>=20
> diff --git a/drivers/media/platform/vsp1/vsp1_drv.c b/drivers/media/platf=
orm/vsp1/vsp1_drv.c
> index 77da6a6732d8..40c6d9290681 100644
> --- a/drivers/media/platform/vsp1/vsp1_drv.c
> +++ b/drivers/media/platform/vsp1/vsp1_drv.c
> @@ -811,6 +811,14 @@ static const struct vsp1_device_info vsp1_device_inf=
os[] =3D {
>                 .uif_count =3D 2,
>                 .wpf_count =3D 1,
>                 .num_bru_inputs =3D 5,
> +       }, {
> +               .version =3D VI6_IP_VERSION_MODEL_VSPD_RZG2L,
> +               .model =3D "VSP2-D",
> +               .gen =3D 3,
> +               .features =3D VSP1_HAS_BRS | VSP1_HAS_WPF_VFLIP | VSP1_HA=
S_EXT_DL,
> +               .lif_count =3D 1,
> +               .rpf_count =3D 2,
> +               .wpf_count =3D 1,
>         },
>  };
> =20
> @@ -841,7 +849,14 @@ static int vsp1_probe(struct platform_device *pdev)
>         if (irq < 0)
>                 return irq;
> =20
> -       vsp1->rstc =3D devm_reset_control_get_exclusive(&pdev->dev, NULL);
> +       vsp1->info =3D of_device_get_match_data(&pdev->dev);
> +       if (vsp1->info) {
> +               vsp1->version =3D vsp1->info->version;
> +               vsp1->rstc =3D devm_reset_control_get_shared(&pdev->dev, =
NULL);
> +       } else {
> +               vsp1->rstc =3D devm_reset_control_get_exclusive(&pdev->de=
v, NULL);
> +       }
> +

I'll leave this as Geert has already commented.

>         if (IS_ERR(vsp1->rstc))
>                 return dev_err_probe(&pdev->dev, PTR_ERR(vsp1->rstc),
>                                      "failed to get reset ctrl\n");
> @@ -874,13 +889,15 @@ static int vsp1_probe(struct platform_device *pdev)
>         if (ret < 0)
>                 goto done;
> =20
> -       vsp1->version =3D vsp1_read(vsp1, VI6_IP_VERSION);
> +       if (!vsp1->info) {
> +               vsp1->version =3D vsp1_read(vsp1, VI6_IP_VERSION);
> =20
> -       for (i =3D 0; i < ARRAY_SIZE(vsp1_device_infos); ++i) {
> -               if ((vsp1->version & VI6_IP_VERSION_MODEL_MASK) =3D=3D
> -                   vsp1_device_infos[i].version) {
> -                       vsp1->info =3D &vsp1_device_infos[i];
> -                       break;
> +               for (i =3D 0; i < ARRAY_SIZE(vsp1_device_infos); ++i) {
> +                       if ((vsp1->version & VI6_IP_VERSION_MODEL_MASK) =
=3D=3D
> +                           vsp1_device_infos[i].version) {
> +                               vsp1->info =3D &vsp1_device_infos[i];
> +                               break;
> +                       }


This is looking like it gets a bit awkward. Two methods for identifying
the version and info structure is going to be a pain.


>                 }
>         }
> =20
> @@ -943,6 +960,7 @@ static int vsp1_remove(struct platform_device *pdev)
>  static const struct of_device_id vsp1_of_match[] =3D {
>         { .compatible =3D "renesas,vsp1" },
>         { .compatible =3D "renesas,vsp2" },
> +       { .compatible =3D "renesas,vsp2-rzg2l", .data =3D &vsp1_device_in=
fos[14] },

I don't think you should reference a specific index of the infos table.
What happens if someone adds an entry higher in the table which pushes
the indexes down ?


>         { },
>  };
>  MODULE_DEVICE_TABLE(of, vsp1_of_match);
> diff --git a/drivers/media/platform/vsp1/vsp1_lif.c b/drivers/media/platf=
orm/vsp1/vsp1_lif.c
> index 6a6857ac9327..6e997653cfac 100644
> --- a/drivers/media/platform/vsp1/vsp1_lif.c
> +++ b/drivers/media/platform/vsp1/vsp1_lif.c
> @@ -107,6 +107,7 @@ static void lif_configure_stream(struct vsp1_entity *=
entity,
> =20
>         case VI6_IP_VERSION_MODEL_VSPDL_GEN3:
>         case VI6_IP_VERSION_MODEL_VSPD_V3:
> +       case VI6_IP_VERSION_MODEL_VSPD_RZG2L:
>                 hbth =3D 0;
>                 obth =3D 1500;
>                 lbth =3D 0;
> @@ -135,8 +136,10 @@ static void lif_configure_stream(struct vsp1_entity =
*entity,
>          * may appear on the output). The value required by the manual is=
 not
>          * explained but is likely a buffer size or threshold.
>          */
> -       if ((entity->vsp1->version & VI6_IP_VERSION_MASK) =3D=3D
> -           (VI6_IP_VERSION_MODEL_VSPD_V3 | VI6_IP_VERSION_SOC_V3M))
> +       if (((entity->vsp1->version & VI6_IP_VERSION_MASK) =3D=3D
> +           (VI6_IP_VERSION_MODEL_VSPD_V3 | VI6_IP_VERSION_SOC_V3M)) ||
> +           ((entity->vsp1->version & VI6_IP_VERSION_MASK) =3D=3D
> +            VI6_IP_VERSION_MODEL_VSPD_RZG2L))

The comment here directly references V3M, and you haven't updated it.
But if this is going to grow I wonder if it will end up needing a quirks
flag that can be set per device in the vsp1_device_info rather than
coding a massive conditional if (platform x or platform y or platform
z.3);

>                 vsp1_lif_write(lif, dlb, VI6_LIF_LBA,
>                                VI6_LIF_LBA_LBA0 |
>                                (1536 << VI6_LIF_LBA_LBA1_SHIFT));
> diff --git a/drivers/media/platform/vsp1/vsp1_regs.h b/drivers/media/plat=
form/vsp1/vsp1_regs.h
> index fae7286eb01e..12c5b09885dc 100644
> --- a/drivers/media/platform/vsp1/vsp1_regs.h
> +++ b/drivers/media/platform/vsp1/vsp1_regs.h
> @@ -766,6 +766,7 @@
>  #define VI6_IP_VERSION_MODEL_VSPD_V3   (0x18 << 8)
>  #define VI6_IP_VERSION_MODEL_VSPDL_GEN3        (0x19 << 8)
>  #define VI6_IP_VERSION_MODEL_VSPBS_GEN3        (0x1a << 8)
> +#define VI6_IP_VERSION_MODEL_VSPD_RZG2L        (0x1b << 8)

I don't like the idea of using a value here that could really be used on
a real device somewhere.

The hole in the sequence is only there because we havent' seen a
datasheet with 0x1b defined.

If there truely is no version register on this hardware, we're going to
have to make sure this version value can't conflict.

--
Kieran


>  #define VI6_IP_VERSION_MODEL_VSPD_V3U  (0x1c << 8)
> =20
>  #define VI6_IP_VERSION_SOC_MASK                (0xff << 0)
> --=20
> 2.17.1
>
