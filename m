Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 545626E6111
	for <lists+linux-media@lfdr.de>; Tue, 18 Apr 2023 14:20:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230434AbjDRMUT (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 18 Apr 2023 08:20:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57654 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230026AbjDRMUR (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 18 Apr 2023 08:20:17 -0400
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4FB202108
        for <linux-media@vger.kernel.org>; Tue, 18 Apr 2023 05:20:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1681820414; x=1713356414;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=XIY9R3U0v54xAcDhl9OTq5nNyJ9/NWSYPz4k0wiW49E=;
  b=CW/zGb8yhvj6/eoBUV8K7yqr8sxMlQdmlJTrjKj7VvJX01bYWfL4rofk
   T+dWGrXOo1RzxizSBGYmu/dZlE8zffEjnd81Dl7b8+/VeUyI4go61mhZL
   9pS5/7qiyjiQrb74Yn014fKaUM6Zpzg0jHSOHSyA/FY2TG5or+L8TcU50
   JX2mW8uhZwOs7//qPzRy7prpZ/eMMb7eP2x51FwkQP6EPBOAVMJ2+yfE1
   8c/SHNrwc+7t8NCKSySXp9BHh//liuSqhuQtm23/u+fGMxSNsnDaBJb3C
   uFu0aRDMsaI15aB6x4PXJqhuMQzXYyiSiQzVM2zGEyzlWFczQ23Hr3/P7
   A==;
X-IronPort-AV: E=Sophos;i="5.99,207,1677538800"; 
   d="scan'208";a="30398463"
Received: from unknown (HELO tq-pgp-pr1.tq-net.de) ([192.168.6.15])
  by mx1-pgp.tq-group.com with ESMTP; 18 Apr 2023 14:20:12 +0200
Received: from mx1.tq-group.com ([192.168.6.7])
  by tq-pgp-pr1.tq-net.de (PGP Universal service);
  Tue, 18 Apr 2023 14:20:12 +0200
X-PGP-Universal: processed;
        by tq-pgp-pr1.tq-net.de on Tue, 18 Apr 2023 14:20:12 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1681820412; x=1713356412;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=XIY9R3U0v54xAcDhl9OTq5nNyJ9/NWSYPz4k0wiW49E=;
  b=TE53WcDrySQ8UWDICrqtOBFYCwtET7vLQMOQHvxP2DC48Go3GmxiS9hl
   8ASjGGMFceQhPpEAOrJPg9oQciNXbk2zXxPitSCqWopTrsjckjG2Ejgp0
   Ld1QN7sV8ccVqwU9W4l5iFfJ35QIYyDQXSA8uvhuQO8+mkSd8PvG8XtCS
   Nk8ULSyouzpowQWb158SxLfav4l+1HHUi872Uk2kaPPAP4A8ETyxNAHbP
   YnGpppDyKu6lEjOEX0lRsYO7ypcrLQrTnvx6vMC4v7bKFizg9Auhr3gaA
   Ma93P3O50fTtrhPvXHstEB85fMGIuGweviQMruQK/Y4FLoojp0sIQBMTa
   Q==;
X-IronPort-AV: E=Sophos;i="5.99,207,1677538800"; 
   d="scan'208";a="30398462"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
  by mx1.tq-group.com with ESMTP; 18 Apr 2023 14:20:12 +0200
Received: from steina-w.localnet (unknown [10.123.53.21])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id 07716280056;
        Tue, 18 Apr 2023 14:20:12 +0200 (CEST)
From:   Alexander Stein <alexander.stein@ew.tq-group.com>
To:     linux-media@vger.kernel.org,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Rui Miguel Silva <rmfrfs@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        NXP Linux Team <linux-imx@nxp.com>,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] media: imx: imx7-media-csi: Init default format with __imx7_csi_video_try_fmt()
Date:   Tue, 18 Apr 2023 14:20:11 +0200
Message-ID: <2253651.irdbgypaU6@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <20230418100417.20428-1-laurent.pinchart@ideasonboard.com>
References: <20230418071439.197735-1-alexander.stein@ew.tq-group.com> <20230418100417.20428-1-laurent.pinchart@ideasonboard.com>
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

thanks for the nice cleanup.

Am Dienstag, 18. April 2023, 12:04:17 CEST schrieb Laurent Pinchart:
> Use the __imx7_csi_video_try_fmt() helper function to initialize the
> default format at probe time. This improves consistency by using the
> same code path for both default initialization and validation at
> runtime, and allows dropping the now unused imx7_csi_find_pixel_format()
> function.
>=20
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> ---
> Hi Alexander,
>=20
> This is an additional cleanup that applies on top of "[PATCH v2 0/3] Fix
> imx7-media-csi format settings". I've only compile-tested it as I'm
> currently lacking access to test hardware. Would you be able to test the
> patch ? If so, could you please include it in the v2 of your series ?

I can't detect any difference in 'media-ctl -p' right after boot, so I
assume the initialization is identical. LGTM, I'll include in v3 of my
series.

Thanks,
Alexander

> ---
>  drivers/media/platform/nxp/imx7-media-csi.c | 55 +++------------------
>  1 file changed, 6 insertions(+), 49 deletions(-)
>=20
> diff --git a/drivers/media/platform/nxp/imx7-media-csi.c
> b/drivers/media/platform/nxp/imx7-media-csi.c index
> 5240670476b2..e52d617eea59 100644
> --- a/drivers/media/platform/nxp/imx7-media-csi.c
> +++ b/drivers/media/platform/nxp/imx7-media-csi.c
> @@ -1014,39 +1014,6 @@ static int imx7_csi_enum_mbus_formats(u32 *code, u=
32
> index) return -EINVAL;
>  }
>=20
> -static int imx7_csi_mbus_fmt_to_pix_fmt(struct v4l2_pix_format *pix,
> -					const struct=20
v4l2_mbus_framefmt *mbus,
> -					const struct imx7_csi_pixfmt=20
*cc)
> -{
> -	u32 width;
> -	u32 stride;
> -
> -	if (!cc) {
> -		cc =3D imx7_csi_find_mbus_format(mbus->code);
> -		if (!cc)
> -			return -EINVAL;
> -	}
> -
> -	/* Round up width for minimum burst size */
> -	width =3D round_up(mbus->width, 8);
> -
> -	/* Round up stride for IDMAC line start address alignment */
> -	stride =3D round_up((width * cc->bpp) >> 3, 8);
> -
> -	pix->width =3D width;
> -	pix->height =3D mbus->height;
> -	pix->pixelformat =3D cc->fourcc;
> -	pix->colorspace =3D mbus->colorspace;
> -	pix->xfer_func =3D mbus->xfer_func;
> -	pix->ycbcr_enc =3D mbus->ycbcr_enc;
> -	pix->quantization =3D mbus->quantization;
> -	pix->field =3D mbus->field;
> -	pix->bytesperline =3D stride;
> -	pix->sizeimage =3D stride * pix->height;
> -
> -	return 0;
> -}
> -
>  /*
> -------------------------------------------------------------------------=
=2D-
> -- * Video Capture Device - IOCTLs
>   */
> @@ -1618,22 +1585,14 @@ static struct imx7_csi_vb2_buffer
> *imx7_csi_video_next_buf(struct imx7_csi *csi) return buf;
>  }
>=20
> -static int imx7_csi_video_init_format(struct imx7_csi *csi)
> +static void imx7_csi_video_init_format(struct imx7_csi *csi)
>  {
> -	struct v4l2_mbus_framefmt format =3D { };
> +	struct v4l2_pix_format *pixfmt =3D &csi->vdev_fmt;
>=20
> -	format.code =3D IMX7_CSI_DEF_MBUS_CODE;
> -	format.width =3D IMX7_CSI_DEF_PIX_WIDTH;
> -	format.height =3D IMX7_CSI_DEF_PIX_HEIGHT;
> -	format.field =3D V4L2_FIELD_NONE;
> +	pixfmt->width =3D IMX7_CSI_DEF_PIX_WIDTH;
> +	pixfmt->height =3D IMX7_CSI_DEF_PIX_HEIGHT;
>=20
> -	imx7_csi_mbus_fmt_to_pix_fmt(&csi->vdev_fmt, &format, NULL);
> -	csi->vdev_compose.width =3D format.width;
> -	csi->vdev_compose.height =3D format.height;
> -
> -	csi->vdev_cc =3D imx7_csi_find_pixel_format(csi-
>vdev_fmt.pixelformat);
> -
> -	return 0;
> +	csi->vdev_cc =3D __imx7_csi_video_try_fmt(pixfmt, &csi->vdev_compose);
>  }
>=20
>  static int imx7_csi_video_register(struct imx7_csi *csi)
> @@ -1646,9 +1605,7 @@ static int imx7_csi_video_register(struct imx7_csi
> *csi) vdev->v4l2_dev =3D v4l2_dev;
>=20
>  	/* Initialize the default format and compose rectangle. */
> -	ret =3D imx7_csi_video_init_format(csi);
> -	if (ret < 0)
> -		return ret;
> +	imx7_csi_video_init_format(csi);
>=20
>  	/* Register the video device. */
>  	ret =3D video_register_device(vdev, VFL_TYPE_VIDEO, -1);


=2D-=20
TQ-Systems GmbH | M=FChlstra=DFe 2, Gut Delling | 82229 Seefeld, Germany
Amtsgericht M=FCnchen, HRB 105018
Gesch=E4ftsf=FChrer: Detlef Schneider, R=FCdiger Stahl, Stefan Schneider
http://www.tq-group.com/


