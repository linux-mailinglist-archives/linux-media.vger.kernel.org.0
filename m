Return-Path: <linux-media+bounces-36041-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id F2421AEA841
	for <lists+linux-media@lfdr.de>; Thu, 26 Jun 2025 22:34:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 71DE61C400C2
	for <lists+linux-media@lfdr.de>; Thu, 26 Jun 2025 20:34:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3A6DC2F0055;
	Thu, 26 Jun 2025 20:34:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="aGH+dwJR"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2E812EBBB6;
	Thu, 26 Jun 2025 20:34:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750970055; cv=none; b=H9ZSBZ/lLwDlGiFOOpshKwcO/l9FL06r4kOvLsyXt11JF46OmTLMrrrp16DktfBGKXNNYbFfZoeQArbcfyqT1/muNd/loMMAd3SzqoNv8PieEoybX+bpZaFErn29WiXXbE9m9tahEXII/DqKYKib1HyE9ZJrxTzKSHvsSx4ka2c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750970055; c=relaxed/simple;
	bh=Lx08/Irv4x0+L5De+AWcscTGFMqD00JkSLHqG15EwkQ=;
	h=Content-Type:MIME-Version:In-Reply-To:References:Subject:From:Cc:
	 To:Date:Message-ID; b=Gz4zg4UHa7A0eKgLGMo91xT1lQL2rEIvrpN71o25vX0EcM+jdOyLur6Cj5Kol71OU1UYO0whwXJuw5Yxr48Ae/FgqTuGKXo0hrIHgrfzhcED794MT6iBQCQZQ3Ls/SNWZ2VKL0XxvoNCWVwupCLwZq7fJ6c9+IDU5T1PkK3vAF8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=aGH+dwJR; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from mail.ideasonboard.com (unknown [IPv6:2601:602:8100:c320::cf66])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id B565F6BE;
	Thu, 26 Jun 2025 22:33:52 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1750970033;
	bh=Lx08/Irv4x0+L5De+AWcscTGFMqD00JkSLHqG15EwkQ=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=aGH+dwJR+zCuMOrO7Q6/wo9lDGpZeyYjESlGeeUW1sNsnDZZBmBHMRAPpveuDwvC2
	 2a//M8liTqvlhSLEGyhdNEI0fuJl/6YVNnikQ+oKSAFejyGti2bSaVWPXfbS+s6vOz
	 xP17GYoce7TzZ0GESpPG46046hOZ/0ErlpfuN/Gk=
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <aFzif59lHvNz-p-0@kekkonen.localdomain>
References: <20250410-probe_fixes-v2-0-801bc6eebdea@ideasonboard.com> <20250410-probe_fixes-v2-6-801bc6eebdea@ideasonboard.com> <aFzif59lHvNz-p-0@kekkonen.localdomain>
Subject: Re: [PATCH v2 6/6] media: ti: j721e-csi2rx: Support multiple pixels per clock
From: Jai Luthra <jai.luthra@ideasonboard.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Hans Verkuil <hverkuil@xs4all.nl>, Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, Maxime Ripard <mripard@kernel.org>, Devarsh Thakkar <devarsht@ti.com>, Rishikesh Donadkar <r-donadkar@ti.com>, Vaishnav Achath <vaishnav.a@ti.com>, Changhuang Liang <changhuang.liang@starfivetech.com>, linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Date: Thu, 26 Jun 2025 13:34:07 -0700
Message-ID: <175097004739.8144.1542268744363236258@freya>
User-Agent: alot/0.12.dev28+gd2c823fe

Hi Sakari,

Quoting Sakari Ailus (2025-06-25 23:02:39)
> Hi Jai,
>=20
> On Thu, Apr 10, 2025 at 12:19:04PM +0530, Jai Luthra wrote:
> > Add support for negotiating the highest possible pixel mode (from
> > single, dual, quad) with the Cadence CSI2RX bridge. This is required to
> > drain the Cadence stream FIFOs without overflowing when the source is
> > operating at a high link-frequency [1].
> >=20
> > Also, update the Kconfig as this introduces a hard build-time dependency
> > on the Cadence CSI2RX driver, even for a COMPILE_TEST.
> >=20
> > [1] Section 12.6.1.4.8.14 CSI_RX_IF Programming Restrictions of AM62 TRM
> >=20
> > Link: https://www.ti.com/lit/pdf/spruj16
> > Signed-off-by: Jai Luthra <jai.luthra@ideasonboard.com>
>=20
> This creates a dependency between the two drivers.
>=20
> Can you confirm that the TI device only exists in conjunction with the
> cadence HW block?
>=20

Yes, the main job of TI device is to unwrap the Cadence-specific pixel
stream to something the TI K3 DMA engine can understand. So these are (and
will be) always paired together in all K3 SoCs that support CSI2RX.

> > ---
> >  drivers/media/platform/ti/Kconfig                  |  3 +-
> >  .../media/platform/ti/j721e-csi2rx/j721e-csi2rx.c  | 38 ++++++++++++++=
++++++--
> >  2 files changed, 37 insertions(+), 4 deletions(-)
> >=20
> > diff --git a/drivers/media/platform/ti/Kconfig b/drivers/media/platform=
/ti/Kconfig
> > index bab998c4179aca3b07372782b9be7de340cb8d45..3bc4aa35887e6edc9fa8749=
d9956a67714c59001 100644
> > --- a/drivers/media/platform/ti/Kconfig
> > +++ b/drivers/media/platform/ti/Kconfig
> > @@ -67,7 +67,8 @@ config VIDEO_TI_J721E_CSI2RX
> >       tristate "TI J721E CSI2RX wrapper layer driver"
> >       depends on VIDEO_DEV && VIDEO_V4L2_SUBDEV_API
> >       depends on MEDIA_SUPPORT && MEDIA_CONTROLLER
> > -     depends on (PHY_CADENCE_DPHY_RX && VIDEO_CADENCE_CSI2RX) || COMPI=
LE_TEST
> > +     depends on VIDEO_CADENCE_CSI2RX
> > +     depends on PHY_CADENCE_DPHY_RX || COMPILE_TEST
> >       depends on ARCH_K3 || COMPILE_TEST
> >       select VIDEOBUF2_DMA_CONTIG
> >       select V4L2_FWNODE
> > diff --git a/drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c b/dr=
ivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c
> > index ad51d033b6725426550578bdac1bae8443458f13..425324c3d6802cfda79d116=
d3967b61a2e7a015a 100644
> > --- a/drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c
> > +++ b/drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c
> > @@ -21,6 +21,8 @@
> >  #include <media/v4l2-mc.h>
> >  #include <media/videobuf2-dma-contig.h>
> > =20
> > +#include "../../cadence/cdns-csi2rx.h"
> > +
> >  #define TI_CSI2RX_MODULE_NAME                "j721e-csi2rx"
> > =20
> >  #define SHIM_CNTL                    0x10
> > @@ -29,6 +31,7 @@
> >  #define SHIM_DMACNTX                 0x20
> >  #define SHIM_DMACNTX_EN                      BIT(31)
> >  #define SHIM_DMACNTX_YUV422          GENMASK(27, 26)
> > +#define SHIM_DMACNTX_DUAL_PCK_CFG    BIT(24)
> >  #define SHIM_DMACNTX_SIZE            GENMASK(21, 20)
> >  #define SHIM_DMACNTX_FMT             GENMASK(5, 0)
> >  #define SHIM_DMACNTX_YUV422_MODE_11  3
> > @@ -40,6 +43,7 @@
> >  #define SHIM_PSI_CFG0_SRC_TAG                GENMASK(15, 0)
> >  #define SHIM_PSI_CFG0_DST_TAG                GENMASK(31, 16)
> > =20
> > +#define TI_CSI2RX_MAX_PIX_PER_CLK    4
> >  #define PSIL_WORD_SIZE_BYTES         16
> >  /*
> >   * There are no hard limits on the width or height. The DMA engine can=
 handle
> > @@ -110,6 +114,7 @@ struct ti_csi2rx_dev {
> >       struct v4l2_format              v_fmt;
> >       struct ti_csi2rx_dma            dma;
> >       u32                             sequence;
> > +     u8                              pix_per_clk;
> >  };
> > =20
> >  static const struct ti_csi2rx_fmt ti_csi2rx_formats[] =3D {
> > @@ -485,6 +490,26 @@ static int ti_csi2rx_notifier_register(struct ti_c=
si2rx_dev *csi)
> >       return 0;
> >  }
> > =20
> > +/* Request maximum possible pixels per clock from the bridge */
> > +static void ti_csi2rx_request_max_ppc(struct ti_csi2rx_dev *csi)
> > +{
> > +     struct media_pad *pad;
> > +     int ret;
> > +     u8 ppc =3D TI_CSI2RX_MAX_PIX_PER_CLK;
>=20
> Could you make this look like a reverse Christmas tree?
>=20

Will do.

> > +
> > +     pad =3D media_entity_remote_source_pad_unique(&csi->vdev.entity);
> > +     if (!pad)
> > +             return;
> > +
> > +     ret =3D cdns_csi2rx_negotiate_ppc(csi->source, pad->index, &ppc);
> > +     if (ret) {
> > +             dev_warn(csi->dev, "NUM_PIXELS negotiation failed: %d\n",=
 ret);
> > +             csi->pix_per_clk =3D 1;
> > +     } else {
> > +             csi->pix_per_clk =3D ppc;
> > +     }
> > +}
> > +
> >  static void ti_csi2rx_setup_shim(struct ti_csi2rx_dev *csi)
> >  {
> >       const struct ti_csi2rx_fmt *fmt;
> > @@ -496,6 +521,9 @@ static void ti_csi2rx_setup_shim(struct ti_csi2rx_d=
ev *csi)
> >       reg =3D SHIM_CNTL_PIX_RST;
> >       writel(reg, csi->shim + SHIM_CNTL);
> > =20
> > +     /* Negotiate pixel count from the source */
> > +     ti_csi2rx_request_max_ppc(csi);
> > +
> >       reg =3D SHIM_DMACNTX_EN;
> >       reg |=3D FIELD_PREP(SHIM_DMACNTX_FMT, fmt->csi_dt);
> > =20
> > @@ -524,14 +552,18 @@ static void ti_csi2rx_setup_shim(struct ti_csi2rx=
_dev *csi)
> >       case V4L2_PIX_FMT_YVYU:
> >               reg |=3D FIELD_PREP(SHIM_DMACNTX_YUV422,
> >                                 SHIM_DMACNTX_YUV422_MODE_11);
> > +             /* Multiple pixels are handled differently for packed YUV=
 */
> > +             if (csi->pix_per_clk =3D=3D 2)
> > +                     reg |=3D SHIM_DMACNTX_DUAL_PCK_CFG;
> > +             reg |=3D FIELD_PREP(SHIM_DMACNTX_SIZE, fmt->size);
> >               break;
> >       default:
> > -             /* Ignore if not YUV 4:2:2 */
> > +             /* By default we change the shift size for multiple pixel=
s */
> > +             reg |=3D FIELD_PREP(SHIM_DMACNTX_SIZE,
> > +                               fmt->size + (csi->pix_per_clk >> 1));
> >               break;
> >       }
> > =20
> > -     reg |=3D FIELD_PREP(SHIM_DMACNTX_SIZE, fmt->size);
> > -
> >       writel(reg, csi->shim + SHIM_DMACNTX);
> > =20
> >       reg =3D FIELD_PREP(SHIM_PSI_CFG0_SRC_TAG, 0) |
> >=20
>=20
> --=20
> Regards,
>=20
> Sakari Ailus

Thanks,
Jai

