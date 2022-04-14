Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3A889500886
	for <lists+linux-media@lfdr.de>; Thu, 14 Apr 2022 10:39:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241038AbiDNImI (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 14 Apr 2022 04:42:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46480 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241056AbiDNIl4 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 14 Apr 2022 04:41:56 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7B356DC0;
        Thu, 14 Apr 2022 01:39:25 -0700 (PDT)
Received: from pendragon.ideasonboard.com (cpc89244-aztw30-2-0-cust3082.18-1.cable.virginm.net [86.31.172.11])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 2E262494;
        Thu, 14 Apr 2022 10:39:23 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1649925563;
        bh=7zcNvjT2C35YQ4lYblCXCj37EY4kC/Br/Sge4DDP9rI=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=rledlip5g3ycex6pUTStjlNbRwKinnHs3rNoFUVNIrZvzcDgyJ+SB28CH7rScPm4W
         THrJ/LDImkGmhZLOxEgiR8ayOPYtOTbHAu6o/L7Ey84SKG1DSmIxNMRhn2VoUatsz7
         J6VNfb8zc6smH9e+60cQKkJblYP/vrUcM34kChFY=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20220316115551.29222-4-biju.das.jz@bp.renesas.com>
References: <20220316115551.29222-1-biju.das.jz@bp.renesas.com> <20220316115551.29222-4-biju.das.jz@bp.renesas.com>
Subject: Re: [PATCH v6 3/3] media: renesas: vsp1: Add support for RZ/G2L VSPD
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
Date:   Thu, 14 Apr 2022 09:39:20 +0100
Message-ID: <164992556078.22830.1913645020940169619@Monstersaurus>
User-Agent: alot/0.10
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Quoting Biju Das (2022-03-16 11:55:51)
> The RZ/G2L VSPD provides a single VSPD instance. It has the following
> sub modules MAU, CTU, RPF, DPR, LUT, BRS, WPF and LIF.
>=20
> The VSPD block on RZ/G2L does not have a version register, so added a
> new compatible string "renesas,rzg2l-vsp2" with a data pointer containing
> the info structure. Also the reset line is shared with the DU module.
>=20
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> v5->v6:
>  * Rebased to media_staging and updated commit header
>  * Removed the extra tab from rzg2l_vsp2_device_info
>  * Changed the function vsp1_lookup->vsp1_lookup_info and
>    all info match related code moved here.
>  * Add VI6_IP_VERSION_VSP and VI6_IP_VERSION_VSP_SW macros to
>    distinguish HW & SW IP_VSP_Version.
>  * Used 0x80 for RZG2L VSPD model and SoC identification
>  * Updated Switch() for LIF0 buffer attribute handling.
> v4->v5:
>  * Fixed typo VI6_IP_VERSION_MODEL_MASK->VI6_IP_VERSION_MASK
>  * To be consistent with other SoC's, introduced VI6_IP_VERSION_SOC_G2L
>    for RZ/G2L SoC's.
> v3->v4:
>  * Added Rb tag from Geert
>  * Add switch() for LIF0 buffer attribute handling for RZ/G2L and V3M
> v2->v3:
>  * Fixed version comparison in vsp1_lookup()
> v1->v2:
>  * Changed the compatible from vsp2-rzg2l->rzg2l-vsp2
>  * Added standalone device info for rzg2l-vsp2.
>  * Added vsp1_lookup helper function.
>  * Updated comments for LIF0 buffer attribute register
>  * Used last ID for rzg2l-vsp2.
> RFC->v1:
>  * Used data pointer containing info structure to retrieve version inform=
ation
> RFC:
>  * https://patchwork.kernel.org/project/linux-renesas-soc/patch/202201121=
74612.10773-21-biju.das.jz@bp.renesas.com/
> ---
>  .../media/platform/renesas/vsp1/vsp1_drv.c    | 56 ++++++++++++++-----
>  .../media/platform/renesas/vsp1/vsp1_lif.c    | 18 ++++--
>  .../media/platform/renesas/vsp1/vsp1_regs.h   |  8 +++
>  3 files changed, 62 insertions(+), 20 deletions(-)
>=20
> diff --git a/drivers/media/platform/renesas/vsp1/vsp1_drv.c b/drivers/med=
ia/platform/renesas/vsp1/vsp1_drv.c
> index 159b68fa0829..f1f52c0c1c59 100644
> --- a/drivers/media/platform/renesas/vsp1/vsp1_drv.c
> +++ b/drivers/media/platform/renesas/vsp1/vsp1_drv.c
> @@ -812,11 +812,47 @@ static const struct vsp1_device_info vsp1_device_in=
fos[] =3D {
>         },
>  };
> =20
> +static const struct vsp1_device_info rzg2l_vsp2_device_info =3D {
> +       .version =3D VI6_IP_VERSION_MODEL_VSPD_RZG2L,
> +       .model =3D "VSP2-D",
> +       .gen =3D 3,
> +       .features =3D VSP1_HAS_BRS | VSP1_HAS_WPF_VFLIP | VSP1_HAS_EXT_DL,
> +       .lif_count =3D 1,
> +       .rpf_count =3D 2,
> +       .wpf_count =3D 1,
> +};
> +
> +static const struct vsp1_device_info *vsp1_lookup_info(struct vsp1_devic=
e *vsp1)
> +{
> +       const struct vsp1_device_info *info;
> +       unsigned int i;
> +
> +       /*
> +        * Try the info stored in match data first for devices that don't=
 have
> +        * a version register.
> +        */
> +       info =3D of_device_get_match_data(vsp1->dev);
> +       if (info)

Presumably - as this will not call vsp1_read(vsp1, VI6_IP_VERSION), we
could/should always set vsp1->version here, or'ing in the _SW flag with
the derived version and SoC identifiers from the info structure.

> +               return info;
> +
> +       vsp1->version =3D vsp1_read(vsp1, VI6_IP_VERSION);
> +
> +       for (i =3D 0; i < ARRAY_SIZE(vsp1_device_infos); ++i) {
> +               info =3D &vsp1_device_infos[i];
> +
> +               if ((vsp1->version & VI6_IP_VERSION_MODEL_MASK) =3D=3D in=
fo->version)
> +                       return info;
> +       }
> +
> +       dev_err(vsp1->dev, "unsupported IP version 0x%08x\n", vsp1->versi=
on);
> +
> +       return NULL;
> +}
> +
>  static int vsp1_probe(struct platform_device *pdev)
>  {
>         struct vsp1_device *vsp1;
>         struct device_node *fcp_node;
> -       unsigned int i;
>         int ret;
>         int irq;
> =20
> @@ -872,25 +908,16 @@ static int vsp1_probe(struct platform_device *pdev)
>         if (ret < 0)
>                 goto done;
> =20
> -       vsp1->version =3D vsp1_read(vsp1, VI6_IP_VERSION);
> -
> -       for (i =3D 0; i < ARRAY_SIZE(vsp1_device_infos); ++i) {
> -               if ((vsp1->version & VI6_IP_VERSION_MODEL_MASK) =3D=3D
> -                   vsp1_device_infos[i].version) {
> -                       vsp1->info =3D &vsp1_device_infos[i];
> -                       break;
> -               }
> -       }
> -
> +       vsp1->info =3D vsp1_lookup_info(vsp1);
>         if (!vsp1->info) {
> -               dev_err(&pdev->dev, "unsupported IP version 0x%08x\n",
> -                       vsp1->version);
>                 vsp1_device_put(vsp1);
>                 ret =3D -ENXIO;
>                 goto done;
>         }
> =20
> -       dev_dbg(&pdev->dev, "IP version 0x%08x\n", vsp1->version);
> +       if ((vsp1->version & VI6_IP_VERSION_VSP_MASK) !=3D VI6_IP_VERSION=
_VSP)
> +               vsp1->version =3D VI6_IP_VERSION_VSP_SW | vsp1->info->ver=
sion |
> +                               VI6_IP_VERSION_SOC_RZG2L;

It seems odd to have this specific version assignment here. Shouldn't
that be set during vsp1_lookup_info() in the case that there is a match
from of_device_get_match_data()? That way it would be extendable by
adding just a new vsp1_device_info structure for the next platform that
has this issue. This implies that they will 'always' be RZG2L but that
information should live in the vsp1_device_info structure I think.

Could be handled when/if we get a new device added I guess, but I think
that VI6_IP_VERSION_SOC_RZG2L should be something that is retrieved from
the vsp1_device_info structure.

Re-reading the vsp1_lookup_info() function - it does seem like something
suited to there, as the vsp1->version is never read from hardware in the
new case.

> =20
>         /*
>          * Previous use of the hardware (e.g. by the bootloader) could le=
ave
> @@ -941,6 +968,7 @@ static int vsp1_remove(struct platform_device *pdev)
>  static const struct of_device_id vsp1_of_match[] =3D {
>         { .compatible =3D "renesas,vsp1" },
>         { .compatible =3D "renesas,vsp2" },
> +       { .compatible =3D "renesas,rzg2l-vsp2", .data =3D &rzg2l_vsp2_dev=
ice_info },
>         { },
>  };
>  MODULE_DEVICE_TABLE(of, vsp1_of_match);
> diff --git a/drivers/media/platform/renesas/vsp1/vsp1_lif.c b/drivers/med=
ia/platform/renesas/vsp1/vsp1_lif.c
> index 6a6857ac9327..e36ed2d2b22b 100644
> --- a/drivers/media/platform/renesas/vsp1/vsp1_lif.c
> +++ b/drivers/media/platform/renesas/vsp1/vsp1_lif.c
> @@ -107,6 +107,7 @@ static void lif_configure_stream(struct vsp1_entity *=
entity,
> =20
>         case VI6_IP_VERSION_MODEL_VSPDL_GEN3:
>         case VI6_IP_VERSION_MODEL_VSPD_V3:
> +       case VI6_IP_VERSION_MODEL_VSPD_RZG2L:
>                 hbth =3D 0;
>                 obth =3D 1500;
>                 lbth =3D 0;
> @@ -130,16 +131,21 @@ static void lif_configure_stream(struct vsp1_entity=
 *entity,
>                         VI6_LIF_CTRL_REQSEL | VI6_LIF_CTRL_LIF_EN);
> =20
>         /*
> -        * On R-Car V3M the LIF0 buffer attribute register has to be set =
to a
> -        * non-default value to guarantee proper operation (otherwise art=
ifacts
> -        * may appear on the output). The value required by the manual is=
 not
> -        * explained but is likely a buffer size or threshold.
> +        * On R-Car V3M and RZ/G2L the LIF0 buffer attribute register has=
 to be
> +        * set to a non-default value to guarantee proper operation (othe=
rwise
> +        * artifacts may appear on the output). The value required by the
> +        * manual is not explained but is likely a buffer size or thresho=
ld.
>          */
> -       if ((entity->vsp1->version & VI6_IP_VERSION_MASK) =3D=3D
> -           (VI6_IP_VERSION_MODEL_VSPD_V3 | VI6_IP_VERSION_SOC_V3M))
> +       switch (entity->vsp1->version) {
> +       case (VI6_IP_VERSION_VSP | VI6_IP_VERSION_MODEL_VSPD_V3 |
> +             VI6_IP_VERSION_SOC_V3M):
> +       case (VI6_IP_VERSION_VSP_SW | VI6_IP_VERSION_MODEL_VSPD_RZG2L |
> +             VI6_IP_VERSION_SOC_RZG2L):

If this is going to grow - I would think it would be better served with
a feature flag - although this isn't so much of a feature, and more of a
quirk, so I wonder if that would push us closer to getting a quirks
flag.

I'm weary that this may not scale otherwise, but ... for now this works,
but I think it means we have multiple ways of handling platform specific
code already.


>                 vsp1_lif_write(lif, dlb, VI6_LIF_LBA,
>                                VI6_LIF_LBA_LBA0 |
>                                (1536 << VI6_LIF_LBA_LBA1_SHIFT));
> +               break;
> +       }
>  }
> =20
>  static const struct vsp1_entity_operations lif_entity_ops =3D {
> diff --git a/drivers/media/platform/renesas/vsp1/vsp1_regs.h b/drivers/me=
dia/platform/renesas/vsp1/vsp1_regs.h
> index fae7286eb01e..e66553c42e50 100644
> --- a/drivers/media/platform/renesas/vsp1/vsp1_regs.h
> +++ b/drivers/media/platform/renesas/vsp1/vsp1_regs.h
> @@ -767,6 +767,8 @@
>  #define VI6_IP_VERSION_MODEL_VSPDL_GEN3        (0x19 << 8)
>  #define VI6_IP_VERSION_MODEL_VSPBS_GEN3        (0x1a << 8)
>  #define VI6_IP_VERSION_MODEL_VSPD_V3U  (0x1c << 8)
> +/* RZ/G2L SoC's have no version register, So use 0x80 as the model versi=
on */
> +#define VI6_IP_VERSION_MODEL_VSPD_RZG2L        (0x80 << 8)
> =20
>  #define VI6_IP_VERSION_SOC_MASK                (0xff << 0)
>  #define VI6_IP_VERSION_SOC_H2          (0x01 << 0)
> @@ -780,6 +782,12 @@
>  #define VI6_IP_VERSION_SOC_M3N         (0x04 << 0)
>  #define VI6_IP_VERSION_SOC_E3          (0x04 << 0)
>  #define VI6_IP_VERSION_SOC_V3U         (0x05 << 0)
> +/* RZ/G2L SoC's have no version register, So use 0x80 for SoC Identifica=
tion */
> +#define VI6_IP_VERSION_SOC_RZG2L       (0x80 << 0)
> +
> +#define VI6_IP_VERSION_VSP_MASK                (0xffff << 16)
> +#define VI6_IP_VERSION_VSP             (0x0101 << 16) /* HW VSP version =
*/

Is this constant on all supported platforms? both Gen2 and Gen3? (Is
there a gen1?). Does it need to be specified to the generation?

There's nothing specifically complex there or blocking I don't think -
so with comments considered as required:

Reviewed-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>

> +#define VI6_IP_VERSION_VSP_SW          (0xfffe << 16) /* SW VSP version =
*/
> =20
>  /* ---------------------------------------------------------------------=
--------
>   * RPF CLUT Registers
> --=20
> 2.17.1
>
