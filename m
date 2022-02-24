Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EB68A4C3518
	for <lists+linux-media@lfdr.de>; Thu, 24 Feb 2022 19:55:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232508AbiBXSzZ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 24 Feb 2022 13:55:25 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35574 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229681AbiBXSzY (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 24 Feb 2022 13:55:24 -0500
Received: from relay12.mail.gandi.net (relay12.mail.gandi.net [217.70.178.232])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EB35524CCE3
        for <linux-media@vger.kernel.org>; Thu, 24 Feb 2022 10:54:53 -0800 (PST)
Received: (Authenticated sender: jacopo@jmondi.org)
        by mail.gandi.net (Postfix) with ESMTPSA id F3B36200006;
        Thu, 24 Feb 2022 18:54:48 +0000 (UTC)
Date:   Thu, 24 Feb 2022 19:54:47 +0100
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     Adam Ford <aford173@gmail.com>
Cc:     Steve Longerbeam <slongerbeam@gmail.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        martin.kepplinger@puri.sm, rmfrfs@gmail.com,
        xavier.roumegue@oss.nxp.com,
        Alexander Stein <alexander.stein@ew.tq-group.com>,
        dorota.czaplejewicz@puri.sm, Sascha Hauer <kernel@pengutronix.de>,
        NXP Linux Team <linux-imx@nxp.com>,
        linux-media <linux-media@vger.kernel.org>,
        "open list:STAGING SUBSYSTEM" <linux-staging@lists.linux.dev>,
        arm-soc <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH v2 1/7] media: imx: De-stage imx7-mipi-csis
Message-ID: <20220224185447.yr2452dbxegkjoqq@uno.localdomain>
References: <20220218183421.583874-1-jacopo@jmondi.org>
 <20220218183421.583874-2-jacopo@jmondi.org>
 <CAHCN7xLmcjKpW_UX2qHEx+s8bqik7OfXmQDgnq0JjKzjaqxNdQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAHCN7xLmcjKpW_UX2qHEx+s8bqik7OfXmQDgnq0JjKzjaqxNdQ@mail.gmail.com>
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_LOW,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Adam,

On Thu, Feb 24, 2022 at 10:49:13AM -0600, Adam Ford wrote:
> On Mon, Feb 21, 2022 at 3:16 AM Jacopo Mondi <jacopo@jmondi.org> wrote:
> >
> > The imx7-mipi-csis driver is in a good state and can be destaged.
> >
> > Move the imx7-mipi-csis.c driver to the newly created
> > drivers/media/platform/imx directory and plumb the related
> > options in Kconfig and in Makefile.
> >
> > Signed-off-by: Jacopo Mondi <jacopo@jmondi.org>
> > Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > ---
> >  MAINTAINERS                                   |  2 +-
> >  drivers/media/platform/Kconfig                |  1 +
> >  drivers/media/platform/Makefile               |  1 +
> >  drivers/media/platform/imx/Kconfig            | 24 +++++++++++++++++++
> >  drivers/media/platform/imx/Makefile           |  1 +
> >  .../platform}/imx/imx7-mipi-csis.c            |  0
> >  drivers/staging/media/imx/Makefile            |  1 -
> >  7 files changed, 28 insertions(+), 2 deletions(-)
> >  create mode 100644 drivers/media/platform/imx/Kconfig
> >  create mode 100644 drivers/media/platform/imx/Makefile
> >  rename drivers/{staging/media => media/platform}/imx/imx7-mipi-csis.c (100%)
> >
>
> Jacopo,
>
> Will there be a subsequent patch to modify the arch64 defconfig to
> enable these modules by default?  With these changes, neither the CSI
> nor CSIS appear to be enabled as modules any more, and I thought they
> used to be enabled as modules by default.

I don't see the VIDEO_IMX7_CSI selected in v5.17-rc5 arch/arm64/configs/defconfig
What am I missing ? :)

I'm not aware of what are the policies to add a new symbol to the
arch64 defconfig, but if appropriate I would be happy to send a patch
to enable it.

Thanks
  j


>
> adam
> > diff --git a/MAINTAINERS b/MAINTAINERS
> > index 83d27b57016f..5bdb8c881b0b 100644
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -11891,8 +11891,8 @@ T:      git git://linuxtv.org/media_tree.git
> >  F:     Documentation/admin-guide/media/imx7.rst
> >  F:     Documentation/devicetree/bindings/media/nxp,imx7-csi.yaml
> >  F:     Documentation/devicetree/bindings/media/nxp,imx7-mipi-csi2.yaml
> > +F:     drivers/media/platform/imx/imx7-mipi-csis.c
> >  F:     drivers/staging/media/imx/imx7-media-csi.c
> > -F:     drivers/staging/media/imx/imx7-mipi-csis.c
> >
> >  MEDIA DRIVERS FOR HELENE
> >  M:     Abylay Ospan <aospan@netup.ru>
> > diff --git a/drivers/media/platform/Kconfig b/drivers/media/platform/Kconfig
> > index 9fbdba0fd1e7..d9eeccffea69 100644
> > --- a/drivers/media/platform/Kconfig
> > +++ b/drivers/media/platform/Kconfig
> > @@ -171,6 +171,7 @@ source "drivers/media/platform/xilinx/Kconfig"
> >  source "drivers/media/platform/rcar-vin/Kconfig"
> >  source "drivers/media/platform/atmel/Kconfig"
> >  source "drivers/media/platform/sunxi/Kconfig"
> > +source "drivers/media/platform/imx/Kconfig"
> >
> >  config VIDEO_TI_CAL
> >         tristate "TI CAL (Camera Adaptation Layer) driver"
> > diff --git a/drivers/media/platform/Makefile b/drivers/media/platform/Makefile
> > index 28eb4aadbf45..a9466c854610 100644
> > --- a/drivers/media/platform/Makefile
> > +++ b/drivers/media/platform/Makefile
> > @@ -20,6 +20,7 @@ obj-y += ti-vpe/
> >  obj-$(CONFIG_VIDEO_MX2_EMMAPRP)                += mx2_emmaprp.o
> >  obj-$(CONFIG_VIDEO_CODA)               += coda/
> >
> > +obj-$(CONFIG_VIDEO_IMX)                        += imx/
> >  obj-$(CONFIG_VIDEO_IMX_PXP)            += imx-pxp.o
> >  obj-$(CONFIG_VIDEO_IMX8_JPEG)          += imx-jpeg/
> >
> > diff --git a/drivers/media/platform/imx/Kconfig b/drivers/media/platform/imx/Kconfig
> > new file mode 100644
> > index 000000000000..683863572c20
> > --- /dev/null
> > +++ b/drivers/media/platform/imx/Kconfig
> > @@ -0,0 +1,24 @@
> > +# SPDX-License-Identifier: GPL-2.0-only
> > +
> > +menuconfig VIDEO_IMX
> > +       bool "V4L2 capture drivers for NXP i.MX devices"
> > +       depends on ARCH_MXC || COMPILE_TEST
> > +       depends on VIDEO_DEV && VIDEO_V4L2
> > +       help
> > +         Say yes here to enable support for capture drivers on i.MX SoCs.
> > +         Support for the single SoC features are selectable in the sub-menu
> > +         options.
> > +
> > +if VIDEO_IMX
> > +
> > +config VIDEO_IMX_MIPI_CSIS
> > +       tristate "MIPI CSI-2 CSIS receiver found on i.MX7 and i.MX8 models"
> > +       select MEDIA_CONTROLLER
> > +       select V4L2_FWNODE
> > +       select VIDEO_V4L2_SUBDEV_API
> > +       default n
> > +       help
> > +         Video4Linux2 sub-device driver for the MIPI CSI-2 CSIS receiver
> > +         v3.3/v3.6.3 found on some i.MX7 and i.MX8 SoCs.
> > +
> > +endif # VIDEO_IMX
> > diff --git a/drivers/media/platform/imx/Makefile b/drivers/media/platform/imx/Makefile
> > new file mode 100644
> > index 000000000000..ee272234c8d7
> > --- /dev/null
> > +++ b/drivers/media/platform/imx/Makefile
> > @@ -0,0 +1 @@
> > +obj-$(CONFIG_VIDEO_IMX_MIPI_CSIS) += imx7-mipi-csis.o
> > diff --git a/drivers/staging/media/imx/imx7-mipi-csis.c b/drivers/media/platform/imx/imx7-mipi-csis.c
> > similarity index 100%
> > rename from drivers/staging/media/imx/imx7-mipi-csis.c
> > rename to drivers/media/platform/imx/imx7-mipi-csis.c
> > diff --git a/drivers/staging/media/imx/Makefile b/drivers/staging/media/imx/Makefile
> > index 19c2fc54d424..d82be898145b 100644
> > --- a/drivers/staging/media/imx/Makefile
> > +++ b/drivers/staging/media/imx/Makefile
> > @@ -15,5 +15,4 @@ obj-$(CONFIG_VIDEO_IMX_CSI) += imx6-media-csi.o
> >  obj-$(CONFIG_VIDEO_IMX_CSI) += imx6-mipi-csi2.o
> >
> >  obj-$(CONFIG_VIDEO_IMX7_CSI) += imx7-media-csi.o
> > -obj-$(CONFIG_VIDEO_IMX7_CSI) += imx7-mipi-csis.o
> >  obj-$(CONFIG_VIDEO_IMX7_CSI) += imx8mq-mipi-csi2.o
> > --
> > 2.35.0
> >
