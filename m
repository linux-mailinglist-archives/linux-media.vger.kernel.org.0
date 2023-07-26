Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CA9B5762B65
	for <lists+linux-media@lfdr.de>; Wed, 26 Jul 2023 08:28:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230205AbjGZG2T (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 26 Jul 2023 02:28:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52528 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231778AbjGZG2Q (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 26 Jul 2023 02:28:16 -0400
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DD8A41FCF
        for <linux-media@vger.kernel.org>; Tue, 25 Jul 2023 23:28:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1690352895; x=1721888895;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=/Fnbe0MfDGSP8QxyI60Rnu8VUe6YB63e276DrVds+Go=;
  b=kGF5osAl8oYV++AIZdxYcLnJHbS4vWoVCYOrWZARy7ePFBFXE8NAi8YU
   Yl9rm0ERECBW2FjXOCaxASL/o7vUKdrDSCWlprDCVeC1fYrEcZIckO3le
   gQh/sZ9oZFeSvc9hRO9mUcmwdZ3zsP3XwOVWH21rOSV3F/KYrDLdw/5+Q
   u2RMekspjrldSKkwzENNXbvYq77GVZj4UclbGp3SqQy+hNMVeCHZkCUDd
   ymUz0LQf1PVX7OTjh8jtE6kK9/yeXUhaw6IDBslpFMiT6egQkN+A2q/um
   DT5/REgg+CVP3XvGueHRFe2Y+4CXytgvBu8+qT2S0cVxLdxpc7Jnj7nw3
   g==;
X-IronPort-AV: E=Sophos;i="6.01,231,1684792800"; 
   d="scan'208";a="32119097"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
  by mx1.tq-group.com with ESMTP; 26 Jul 2023 08:28:13 +0200
Received: from steina-w.localnet (unknown [10.123.53.21])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id 29BB0280075;
        Wed, 26 Jul 2023 08:28:13 +0200 (CEST)
From:   Alexander Stein <alexander.stein@ew.tq-group.com>
To:     linux-media@vger.kernel.org,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Rui Miguel Silva <rmfrfs@gmail.com>,
        Tim Harvey <tharvey@gateworks.com>,
        Fabio Estevam <festevam@denx.de>,
        NXP Linux Team <linux-imx@nxp.com>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Martin Kepplinger <martink@posteo.de>,
        Purism Kernel Team <kernel@puri.sm>
Subject: Re: [PATCH v3 3/3] media: imx: imx7-media-csi: Include headers explicitly
Date:   Wed, 26 Jul 2023 08:28:12 +0200
Message-ID: <4160136.1IzOArtZ34@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <20230725200249.15447-4-laurent.pinchart@ideasonboard.com>
References: <20230725200249.15447-1-laurent.pinchart@ideasonboard.com> <20230725200249.15447-4-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,
        URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Laurent,

thanks for the additional cleanup.

Am Dienstag, 25. Juli 2023, 22:02:49 CEST schrieb Laurent Pinchart:
> Include all the headers that the driver needs explicitly instead of
> relying on indirect inclusion. While at it, drop a few unneeded headers.
>=20
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> ---
>  drivers/media/platform/nxp/imx7-media-csi.c | 27 ++++++++++++++++-----
>  1 file changed, 21 insertions(+), 6 deletions(-)
>=20
> diff --git a/drivers/media/platform/nxp/imx7-media-csi.c
> b/drivers/media/platform/nxp/imx7-media-csi.c index
> 3aa7978d3f8a..95e9f22f21be 100644
> --- a/drivers/media/platform/nxp/imx7-media-csi.c
> +++ b/drivers/media/platform/nxp/imx7-media-csi.c
> @@ -3,31 +3,46 @@
>   * V4L2 Capture CSI Subdev for Freescale i.MX6UL/L / i.MX7 SOC
>   *
>   * Copyright (c) 2019 Linaro Ltd
> - *
>   */
>=20
>  #include <linux/clk.h>
> +#include <linux/completion.h>
> +#include <linux/container_of.h>
>  #include <linux/delay.h>
> +#include <linux/device.h>
> +#include <linux/dma-mapping.h>
> +#include <linux/err.h>
>  #include <linux/interrupt.h>
> +#include <linux/io.h>
> +#include <linux/jiffies.h>
> +#include <linux/kernel.h>
> +#include <linux/list.h>
>  #include <linux/math.h>
> -#include <linux/mfd/syscon.h>
>  #include <linux/minmax.h>
>  #include <linux/module.h>
> +#include <linux/mutex.h>
>  #include <linux/of.h>
> -#include <linux/of_graph.h>
> -#include <linux/pinctrl/consumer.h>
>  #include <linux/platform_device.h>
> -#include <linux/regmap.h>
> +#include <linux/property.h>
>  #include <linux/slab.h>
>  #include <linux/spinlock.h>
> +#include <linux/string.h>
> +#include <linux/timekeeping.h>
>  #include <linux/types.h>
>=20
> +#include <media/media-device.h>
> +#include <media/media-entity.h>
> +#include <media/v4l2-async.h>
> +#include <media/v4l2-common.h>
> +#include <media/v4l2-dev.h>
>  #include <media/v4l2-device.h>
> -#include <media/v4l2-fwnode.h>
> +#include <media/v4l2-fh.h>
>  #include <media/v4l2-ioctl.h>
>  #include <media/v4l2-mc.h>
>  #include <media/v4l2-subdev.h>
> +#include <media/videobuf2-core.h>
>  #include <media/videobuf2-dma-contig.h>
> +#include <media/videobuf2-v4l2.h>
>=20
>  #define IMX7_CSI_PAD_SINK		0
>  #define IMX7_CSI_PAD_SRC		1

Looks good to me.
Acked-by: Alexander Stein <alexander.stein@ew.tq-group.com>

=2D-=20
TQ-Systems GmbH | M=FChlstra=DFe 2, Gut Delling | 82229 Seefeld, Germany
Amtsgericht M=FCnchen, HRB 105018
Gesch=E4ftsf=FChrer: Detlef Schneider, R=FCdiger Stahl, Stefan Schneider
http://www.tq-group.com/


