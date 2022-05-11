Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5128D52342B
	for <lists+linux-media@lfdr.de>; Wed, 11 May 2022 15:22:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243465AbiEKNWq (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 11 May 2022 09:22:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45772 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243880AbiEKNWP (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 11 May 2022 09:22:15 -0400
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7D7C0205C4
        for <linux-media@vger.kernel.org>; Wed, 11 May 2022 06:22:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1652275325; x=1683811325;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=SQ5E2wIZAR1MDjch2SPhRHlLJoCw7I18ymRmpLm8bO0=;
  b=KYnvZG8GlWPtuWIKCbSX+IaVYtdtKwz+niux73eZakl6sN2tDE5pSWol
   HOdgdFikB9pTHGmtN0Ste/5V8vG9Apu1GPLkWlgi9uKvZyXlRPn7CZTCe
   WW4C/8/5Ooy3wFnjT26WZ56HkMmZE99Gsy5fpS8a2Vjlkg1o3I9bZI2s8
   GJiw+uTZ+QRnJcvSort+0CV/nY7hpdcO7vtPBrqxkOlCSlBSgp9CCcrO4
   BT7N1Zisazut1ONoKv95MmJWYGPswtjDiUcqVbpYQ9cnVRuz36NBL5IqY
   DwP7HJoWBjQ/B2TyWdiu0XI9rs8VeDUMfYS2s+M2f/kLIYHYY7qAeeRXm
   g==;
X-IronPort-AV: E=Sophos;i="5.91,217,1647298800"; 
   d="scan'208";a="23811325"
Received: from unknown (HELO tq-pgp-pr1.tq-net.de) ([192.168.6.15])
  by mx1-pgp.tq-group.com with ESMTP; 11 May 2022 15:22:03 +0200
Received: from mx1.tq-group.com ([192.168.6.7])
  by tq-pgp-pr1.tq-net.de (PGP Universal service);
  Wed, 11 May 2022 15:22:03 +0200
X-PGP-Universal: processed;
        by tq-pgp-pr1.tq-net.de on Wed, 11 May 2022 15:22:03 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1652275323; x=1683811323;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=SQ5E2wIZAR1MDjch2SPhRHlLJoCw7I18ymRmpLm8bO0=;
  b=lpbt7kAwLvT90XkoNgtYet1snuTxUe7T5fw40lm/o+xk3WAZCI5my6rm
   7JVrNc4ug0XTuU3MUZPbTvywIY0MmUOEnTDcjODPrjTTgdda39BMlEQ7t
   CaYO+Fz3SkVY8l/kvFV9CamnUiFxJ+ByWDqLZpNyeNsZjkQUs1K61a0F0
   JmcjEsD9DOqq+YbHMAxQu0r9Fdyk13ObhRE44sLlD4+f7/z+r07q/xNNH
   6kb6bG2QuvxJZG/uqcOdeH25xUZj4ocy/aVyhhD13jYmUoO8ahnrqYFMV
   1wnHrH04ya7PbHr+RF5xvLTGZ6GEaJt0Eq0G6gZ4vFZ6BQCqmcKEzRasz
   A==;
X-IronPort-AV: E=Sophos;i="5.91,217,1647298800"; 
   d="scan'208";a="23811324"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
  by mx1.tq-group.com with ESMTP; 11 May 2022 15:22:03 +0200
Received: from steina-w.localnet (unknown [10.123.49.12])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id 317ED280070;
        Wed, 11 May 2022 15:22:03 +0200 (CEST)
From:   Alexander Stein <alexander.stein@ew.tq-group.com>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     linux-media@vger.kernel.org, Rui Miguel Silva <rmfrfs@gmail.com>,
        Steve Longerbeam <slongerbeam@gmail.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Jacopo Mondi <jacopo@jmondi.org>,
        Martin Kepplinger <martin.kepplinger@puri.sm>,
        Dorota Czaplejewicz <dorota.czaplejewicz@puri.sm>,
        kernel@pengutronix.de
Subject: Re: [PATCH 39/50] staging: media: imx: imx7-media-csi: Define macro for default mbus code
Date:   Wed, 11 May 2022 15:22:02 +0200
Message-ID: <13014610.uLZWGnKmhe@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <20220510115859.19777-40-laurent.pinchart@ideasonboard.com>
References: <20220510115859.19777-1-laurent.pinchart@ideasonboard.com> <20220510115859.19777-40-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,
        URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello Laurent,

Am Dienstag, 10. Mai 2022, 13:58:48 CEST schrieb Laurent Pinchart:
> Define a macro for the default media bus code and use it through the
> driver to replace a hardcoded value and a dynamic query from the
> pixel_formats table.
> 
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> ---
>  drivers/staging/media/imx/imx7-media-csi.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/staging/media/imx/imx7-media-csi.c
> b/drivers/staging/media/imx/imx7-media-csi.c index
> bcf57aff3572..f2e85e9851e4 100644
> --- a/drivers/staging/media/imx/imx7-media-csi.c
> +++ b/drivers/staging/media/imx/imx7-media-csi.c
> @@ -167,6 +167,7 @@
>  #define IMX7_CSI_VIDEO_MEM_LIMIT	SZ_64M
>  #define IMX7_CSI_VIDEO_EOF_TIMEOUT	2000
> 
> +#define IMX7_CSI_DEF_MBUS_CODE		MEDIA_BUS_FMT_UYVY8_2X8
>  #define IMX7_CSI_DEF_PIX_WIDTH		640
>  #define IMX7_CSI_DEF_PIX_HEIGHT		480
> 
> @@ -1096,7 +1097,7 @@ static int imx7_csi_init_mbus_fmt(struct
> v4l2_mbus_framefmt *mbus, mbus->field = field;
> 
>  	if (code == 0)
> -		imx7_csi_enum_mbus_formats(&code, 0, 
IMX7_CSI_PIXFMT_SEL_YUV);
> +		code = IMX7_CSI_DEF_MBUS_CODE;
> 
>  	lcc = imx7_csi_find_mbus_format(code, IMX7_CSI_PIXFMT_SEL_ANY);
>  	if (!lcc)
> @@ -1629,7 +1630,7 @@ static int imx7_csi_video_init_format(struct imx7_csi
> *csi) .pad = IMX7_CSI_PAD_SRC,
>  		.which = V4L2_SUBDEV_FORMAT_ACTIVE,
>  	};
> -	fmt_src.format.code = MEDIA_BUS_FMT_UYVY8_2X8;
> +	fmt_src.format.code = IMX7_CSI_DEF_MBUS_CODE;
>  	fmt_src.format.width = IMX7_CSI_DEF_PIX_WIDTH;
>  	fmt_src.format.height = IMX7_CSI_DEF_PIX_HEIGHT;

This change assumes, like before, that MEDIA_BUS_FMT_UYVY8_2X8 is the 1st code 
in the 1st entry in pixel_formats. Maybe a comment is helpful to indicate 
that.

Regards,
Alexander


