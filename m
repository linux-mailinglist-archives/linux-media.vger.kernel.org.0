Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8ACF0762B45
	for <lists+linux-media@lfdr.de>; Wed, 26 Jul 2023 08:19:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229822AbjGZGTX (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 26 Jul 2023 02:19:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49314 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229489AbjGZGTW (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 26 Jul 2023 02:19:22 -0400
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1CFEA116
        for <linux-media@vger.kernel.org>; Tue, 25 Jul 2023 23:19:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1690352360; x=1721888360;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=CkuGYWztg3waRkjJkWHhgfV3rQke5DvXD4QUeuLFfPo=;
  b=OqOYF8+7Dw4aa+qaRPfyxugB0dGzdrnfW2c3dcFij4Gb8m485uwxxNm0
   zwOtRsiFJrShgmvkbPSo7YATKMHQrikvmKNJpcWTC0FU0+d29L2XoI8kP
   hUe8wNNcJwRznzSYYzaUfzKKk54PBCDNljOdNjiM88A53J08lEsdK2qQX
   L/YtkbBu3fw6UTxNXBgsWYZnD3fUW7eRqQtop3ear5PvcAdiV2sSmZNTI
   QqRJ+ozpaIpITTl9u2XdjHqBhP4+HYgX6Vv99k1FrFz+dn9xvd6ZZ2tnO
   gZG1qoSM0h4M/J21T7oDvX8gsOsOiIlWVHMqDTF950Q6vGWawGHo2PnZ4
   w==;
X-IronPort-AV: E=Sophos;i="6.01,231,1684792800"; 
   d="scan'208";a="32118904"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
  by mx1.tq-group.com with ESMTP; 26 Jul 2023 08:19:17 +0200
Received: from steina-w.localnet (unknown [10.123.53.21])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id 83EA8280075;
        Wed, 26 Jul 2023 08:19:17 +0200 (CEST)
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
Subject: Re: [PATCH v3 1/3] media: imx: imx7-media-csi: Fix applying format constraints
Date:   Wed, 26 Jul 2023 08:19:17 +0200
Message-ID: <5390222.Sb9uPGUboI@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <20230725200249.15447-2-laurent.pinchart@ideasonboard.com>
References: <20230725200249.15447-1-laurent.pinchart@ideasonboard.com> <20230725200249.15447-2-laurent.pinchart@ideasonboard.com>
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

thanks for picking this up.

Am Dienstag, 25. Juli 2023, 22:02:47 CEST schrieb Laurent Pinchart:
> From: Fabio Estevam <festevam@denx.de>
>=20
> v4l_bound_align_image() aligns to a multiple of 2 to the power of
> walign, not to walign. Depending on the pixel format, this causes the
> image width to be aligned to 16 or 256 pixels instead of 4 or 8 as
> required by the hardware. Fix it by rounding and clamping the width and
> height manually.
>=20
> Reported-by: Tim Harvey <tharvey@gateworks.com>
> Closes:
> https://lore.kernel.org/linux-media/CAJ+vNU0BOVLTL17ofgHwtexbpuMYwH_aGUC=
=3D=3DE
> XABUtHHiv_ag@mail.gmail.com Fixes: 6f482c4729d9 ("media: imx:
> imx7-media-csi: Get rid of superfluous call to
> imx7_csi_mbus_fmt_to_pix_fmt") Co-developed-by: Alexander Stein
> <alexander.stein@ew.tq-group.com> Signed-off-by: Alexander Stein
> <alexander.stein@ew.tq-group.com>
> Signed-off-by: Fabio Estevam <festevam@denx.de>
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> ---
> Changes since v2:
>=20
> - Don't export clamp_roundup() from v4l2-common.c
> - Simply clamp the height as no alignment is needed
> - Add required includes
> ---
>  drivers/media/platform/nxp/imx7-media-csi.c | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/media/platform/nxp/imx7-media-csi.c
> b/drivers/media/platform/nxp/imx7-media-csi.c index
> 2ec1f3cd56a0..5684ecd2e3fe 100644
> --- a/drivers/media/platform/nxp/imx7-media-csi.c
> +++ b/drivers/media/platform/nxp/imx7-media-csi.c
> @@ -9,7 +9,9 @@
>  #include <linux/clk.h>
>  #include <linux/delay.h>
>  #include <linux/interrupt.h>
> +#include <linux/math.h>
>  #include <linux/mfd/syscon.h>
> +#include <linux/minmax.h>
>  #include <linux/module.h>
>  #include <linux/of.h>
>  #include <linux/of_graph.h>
> @@ -1137,8 +1139,9 @@ __imx7_csi_video_try_fmt(struct v4l2_pix_format
> *pixfmt, * TODO: Implement configurable stride support.
>  	 */
>  	walign =3D 8 * 8 / cc->bpp;
> -	v4l_bound_align_image(&pixfmt->width, 1, 0xffff, walign,
> -			      &pixfmt->height, 1, 0xffff, 1, 0);
> +	pixfmt->width =3D clamp(round_up(pixfmt->width, walign), walign,
> +			      round_down(65535U, walign));
> +	pixfmt->height =3D clamp(pixfmt->height, 1U, 65535U);

Actually I have a slight preference for 0xffff over 65535, just because it =
is=20
indicating this is some (maximum) register value. But it may just be me.
I'm okay either way:
Reviewed-by: Alexander Stein <alexander.stein@ew.tq-group.com>

Thanks
Alexander

>=20
>  	pixfmt->bytesperline =3D pixfmt->width * cc->bpp / 8;
>  	pixfmt->sizeimage =3D pixfmt->bytesperline * pixfmt->height;


=2D-=20
TQ-Systems GmbH | M=FChlstra=DFe 2, Gut Delling | 82229 Seefeld, Germany
Amtsgericht M=FCnchen, HRB 105018
Gesch=E4ftsf=FChrer: Detlef Schneider, R=FCdiger Stahl, Stefan Schneider
http://www.tq-group.com/


