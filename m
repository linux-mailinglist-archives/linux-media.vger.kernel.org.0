Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CE8824C3219
	for <lists+linux-media@lfdr.de>; Thu, 24 Feb 2022 17:51:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231166AbiBXQuh (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 24 Feb 2022 11:50:37 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41394 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230420AbiBXQu2 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 24 Feb 2022 11:50:28 -0500
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com [IPv6:2a00:1450:4864:20::532])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0D1AA1EC9BD
        for <linux-media@vger.kernel.org>; Thu, 24 Feb 2022 08:49:25 -0800 (PST)
Received: by mail-ed1-x532.google.com with SMTP id x5so3678647edd.11
        for <linux-media@vger.kernel.org>; Thu, 24 Feb 2022 08:49:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=8MquFHT/UHM7DzRV5VG//l+uWPNW5Ldru3xmq5QGro4=;
        b=bjitvXT0Zgdn7lzARUR1K2LmNc1Z8EpCfArnG/QhWOTD2GhSw8tNwKgypxUC3nOMDu
         3njfcl64xKtcEZnSMFWsJdx+jabLj4R2eJoW0rAmoEY8oV2KwBZFvzdBx1eSwTAZuXbg
         AxyHu2B/ERSgZ/DKRzhG19MlNJrlWBMp9sR/I/Qrwevk6HfIY84Db8jxd22qWRn1iz9q
         TeW2VbZkZRcwHGS/TUiVzJUvNJyzP5bUIQHhh+e0cUC7L3pufgJ0hQ41ZoxLRGKmvkKV
         gV/xa8CTS7vgaQ+StL/KKykadaqy1Bc3OKrA8B9vUE1iKvxLpdnGLyKGN1It7zQheHrI
         mwZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=8MquFHT/UHM7DzRV5VG//l+uWPNW5Ldru3xmq5QGro4=;
        b=Y9XBIcCIq/zoMvfrj99ogwaS9joBQKdKrvqxv23mcycRjhDd2863k5ZUKbyOPYp0UB
         5/K02d8l3naadkHBTM0uplZZirgJ/Xofxn178ubLbFj85elJDNAzl8UspIC59yhqmcS7
         SU5p31HFDc94pC4/Oia1UmwoGLJf0bioqfK6v7dSP5tqkDYrV0/FDBGcy9dBVe+Hi1ra
         zf4kp4GjJTpsZoCuiNQrBq1YtpxvzcrqN9ZvYbCkCU+yq3cMbB5Oqv8DIP7j4hmzq7Qh
         8vpnshH3WRhCPzawXLKljrZC2geO9kMwQXLghlEmArptDo+Nxy2N7RzgrwKb5nIj6hT5
         TvgA==
X-Gm-Message-State: AOAM531D0PK/jNSWQEAjC5t+B2jEGSGvaq4BMLK/FOekZeFBQSBLzwXB
        /MIti2Zovt9yoSiVHcbUnAdLWmtdkn89fb4Y1mA=
X-Google-Smtp-Source: ABdhPJxajaztxWUnc78YaIcj+kn+mzaGNQWeOWfAc6JO3J415FTsOuGN8QQXl4CzwtZk5jnZ55oWTsrGJl9QrJR2eKw=
X-Received: by 2002:a05:6402:90b:b0:412:a7cc:f5f9 with SMTP id
 g11-20020a056402090b00b00412a7ccf5f9mr3090268edz.136.1645721363368; Thu, 24
 Feb 2022 08:49:23 -0800 (PST)
MIME-Version: 1.0
References: <20220218183421.583874-1-jacopo@jmondi.org> <20220218183421.583874-2-jacopo@jmondi.org>
In-Reply-To: <20220218183421.583874-2-jacopo@jmondi.org>
From:   Adam Ford <aford173@gmail.com>
Date:   Thu, 24 Feb 2022 10:49:13 -0600
Message-ID: <CAHCN7xLmcjKpW_UX2qHEx+s8bqik7OfXmQDgnq0JjKzjaqxNdQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/7] media: imx: De-stage imx7-mipi-csis
To:     Jacopo Mondi <jacopo@jmondi.org>
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
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, Feb 21, 2022 at 3:16 AM Jacopo Mondi <jacopo@jmondi.org> wrote:
>
> The imx7-mipi-csis driver is in a good state and can be destaged.
>
> Move the imx7-mipi-csis.c driver to the newly created
> drivers/media/platform/imx directory and plumb the related
> options in Kconfig and in Makefile.
>
> Signed-off-by: Jacopo Mondi <jacopo@jmondi.org>
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> ---
>  MAINTAINERS                                   |  2 +-
>  drivers/media/platform/Kconfig                |  1 +
>  drivers/media/platform/Makefile               |  1 +
>  drivers/media/platform/imx/Kconfig            | 24 +++++++++++++++++++
>  drivers/media/platform/imx/Makefile           |  1 +
>  .../platform}/imx/imx7-mipi-csis.c            |  0
>  drivers/staging/media/imx/Makefile            |  1 -
>  7 files changed, 28 insertions(+), 2 deletions(-)
>  create mode 100644 drivers/media/platform/imx/Kconfig
>  create mode 100644 drivers/media/platform/imx/Makefile
>  rename drivers/{staging/media => media/platform}/imx/imx7-mipi-csis.c (100%)
>

Jacopo,

Will there be a subsequent patch to modify the arch64 defconfig to
enable these modules by default?  With these changes, neither the CSI
nor CSIS appear to be enabled as modules any more, and I thought they
used to be enabled as modules by default.

adam
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 83d27b57016f..5bdb8c881b0b 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -11891,8 +11891,8 @@ T:      git git://linuxtv.org/media_tree.git
>  F:     Documentation/admin-guide/media/imx7.rst
>  F:     Documentation/devicetree/bindings/media/nxp,imx7-csi.yaml
>  F:     Documentation/devicetree/bindings/media/nxp,imx7-mipi-csi2.yaml
> +F:     drivers/media/platform/imx/imx7-mipi-csis.c
>  F:     drivers/staging/media/imx/imx7-media-csi.c
> -F:     drivers/staging/media/imx/imx7-mipi-csis.c
>
>  MEDIA DRIVERS FOR HELENE
>  M:     Abylay Ospan <aospan@netup.ru>
> diff --git a/drivers/media/platform/Kconfig b/drivers/media/platform/Kconfig
> index 9fbdba0fd1e7..d9eeccffea69 100644
> --- a/drivers/media/platform/Kconfig
> +++ b/drivers/media/platform/Kconfig
> @@ -171,6 +171,7 @@ source "drivers/media/platform/xilinx/Kconfig"
>  source "drivers/media/platform/rcar-vin/Kconfig"
>  source "drivers/media/platform/atmel/Kconfig"
>  source "drivers/media/platform/sunxi/Kconfig"
> +source "drivers/media/platform/imx/Kconfig"
>
>  config VIDEO_TI_CAL
>         tristate "TI CAL (Camera Adaptation Layer) driver"
> diff --git a/drivers/media/platform/Makefile b/drivers/media/platform/Makefile
> index 28eb4aadbf45..a9466c854610 100644
> --- a/drivers/media/platform/Makefile
> +++ b/drivers/media/platform/Makefile
> @@ -20,6 +20,7 @@ obj-y += ti-vpe/
>  obj-$(CONFIG_VIDEO_MX2_EMMAPRP)                += mx2_emmaprp.o
>  obj-$(CONFIG_VIDEO_CODA)               += coda/
>
> +obj-$(CONFIG_VIDEO_IMX)                        += imx/
>  obj-$(CONFIG_VIDEO_IMX_PXP)            += imx-pxp.o
>  obj-$(CONFIG_VIDEO_IMX8_JPEG)          += imx-jpeg/
>
> diff --git a/drivers/media/platform/imx/Kconfig b/drivers/media/platform/imx/Kconfig
> new file mode 100644
> index 000000000000..683863572c20
> --- /dev/null
> +++ b/drivers/media/platform/imx/Kconfig
> @@ -0,0 +1,24 @@
> +# SPDX-License-Identifier: GPL-2.0-only
> +
> +menuconfig VIDEO_IMX
> +       bool "V4L2 capture drivers for NXP i.MX devices"
> +       depends on ARCH_MXC || COMPILE_TEST
> +       depends on VIDEO_DEV && VIDEO_V4L2
> +       help
> +         Say yes here to enable support for capture drivers on i.MX SoCs.
> +         Support for the single SoC features are selectable in the sub-menu
> +         options.
> +
> +if VIDEO_IMX
> +
> +config VIDEO_IMX_MIPI_CSIS
> +       tristate "MIPI CSI-2 CSIS receiver found on i.MX7 and i.MX8 models"
> +       select MEDIA_CONTROLLER
> +       select V4L2_FWNODE
> +       select VIDEO_V4L2_SUBDEV_API
> +       default n
> +       help
> +         Video4Linux2 sub-device driver for the MIPI CSI-2 CSIS receiver
> +         v3.3/v3.6.3 found on some i.MX7 and i.MX8 SoCs.
> +
> +endif # VIDEO_IMX
> diff --git a/drivers/media/platform/imx/Makefile b/drivers/media/platform/imx/Makefile
> new file mode 100644
> index 000000000000..ee272234c8d7
> --- /dev/null
> +++ b/drivers/media/platform/imx/Makefile
> @@ -0,0 +1 @@
> +obj-$(CONFIG_VIDEO_IMX_MIPI_CSIS) += imx7-mipi-csis.o
> diff --git a/drivers/staging/media/imx/imx7-mipi-csis.c b/drivers/media/platform/imx/imx7-mipi-csis.c
> similarity index 100%
> rename from drivers/staging/media/imx/imx7-mipi-csis.c
> rename to drivers/media/platform/imx/imx7-mipi-csis.c
> diff --git a/drivers/staging/media/imx/Makefile b/drivers/staging/media/imx/Makefile
> index 19c2fc54d424..d82be898145b 100644
> --- a/drivers/staging/media/imx/Makefile
> +++ b/drivers/staging/media/imx/Makefile
> @@ -15,5 +15,4 @@ obj-$(CONFIG_VIDEO_IMX_CSI) += imx6-media-csi.o
>  obj-$(CONFIG_VIDEO_IMX_CSI) += imx6-mipi-csi2.o
>
>  obj-$(CONFIG_VIDEO_IMX7_CSI) += imx7-media-csi.o
> -obj-$(CONFIG_VIDEO_IMX7_CSI) += imx7-mipi-csis.o
>  obj-$(CONFIG_VIDEO_IMX7_CSI) += imx8mq-mipi-csi2.o
> --
> 2.35.0
>
