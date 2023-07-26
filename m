Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EE8AB762B64
	for <lists+linux-media@lfdr.de>; Wed, 26 Jul 2023 08:27:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229993AbjGZG1p (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 26 Jul 2023 02:27:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52370 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229528AbjGZG1o (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 26 Jul 2023 02:27:44 -0400
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7DF4E1995
        for <linux-media@vger.kernel.org>; Tue, 25 Jul 2023 23:27:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1690352863; x=1721888863;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=SO8qtq5n4vUs03x+BQHo8Bbf83RhpEqSbZNT0bEINiU=;
  b=MYxVhk4/wYqB8Q5xz5nFGiM2pj/kQSdqdUtbutWQqBdZtPPLbtvAyNjJ
   /avhrom1N5iOsQMzvtOuvs6E85G7VYiktmMsEmWBb0kQQYnCcYTMKmfGU
   6e1G3mjVIbZsOXFYrQCvOhYjWtFZL13kOHVkBhKFK37RuKBOzW6R2xCBW
   UN7y8Y3hCKrgOkUoE7Nqu9if0xVjUyPZawCH+LPQP/2s9Cse1nY4pOysB
   54OAlf8Z4l517TL2b1x7wJfCHCPBKKcgN8opfmpjP88ECWJHvgYcIcsp3
   cvEtpAcGofzubWXbmiwfVLevBYq4VBMcOYzYo9usKJJwUZyA1jVZT/uzB
   g==;
X-IronPort-AV: E=Sophos;i="6.01,231,1684792800"; 
   d="scan'208";a="32119091"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
  by mx1.tq-group.com with ESMTP; 26 Jul 2023 08:27:41 +0200
Received: from steina-w.localnet (unknown [10.123.53.21])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id AF7D2280075;
        Wed, 26 Jul 2023 08:27:41 +0200 (CEST)
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
Subject: Re: [PATCH v3 2/3] media: imx: imx7-media-csi: Fix frame sizes enumeration
Date:   Wed, 26 Jul 2023 08:27:41 +0200
Message-ID: <14965809.tv2OnDr8pf@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <20230725200249.15447-3-laurent.pinchart@ideasonboard.com>
References: <20230725200249.15447-1-laurent.pinchart@ideasonboard.com> <20230725200249.15447-3-laurent.pinchart@ideasonboard.com>
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

thanks for picking up my suggestion.

Am Dienstag, 25. Juli 2023, 22:02:48 CEST schrieb Laurent Pinchart:
> Enumeration of the minimum, maximum and step values for the image width
> does not take hardware constraints into account. Fix it.
>=20
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> ---
>  drivers/media/platform/nxp/imx7-media-csi.c | 14 ++++++++------
>  1 file changed, 8 insertions(+), 6 deletions(-)
>=20
> diff --git a/drivers/media/platform/nxp/imx7-media-csi.c
> b/drivers/media/platform/nxp/imx7-media-csi.c index
> 5684ecd2e3fe..3aa7978d3f8a 100644
> --- a/drivers/media/platform/nxp/imx7-media-csi.c
> +++ b/drivers/media/platform/nxp/imx7-media-csi.c
> @@ -1076,6 +1076,7 @@ static int imx7_csi_video_enum_framesizes(struct fi=
le
> *file, void *fh, struct v4l2_frmsizeenum *fsize)
>  {
>  	const struct imx7_csi_pixfmt *cc;
> +	u32 walign;
>=20
>  	if (fsize->index > 0)
>  		return -EINVAL;
> @@ -1085,16 +1086,17 @@ static int imx7_csi_video_enum_framesizes(struct
> file *file, void *fh, return -EINVAL;
>=20
>  	/*
> -	 * TODO: The constraints are hardware-specific and may depend on the
> -	 * pixel format. This should come from the driver using
> -	 * imx_media_capture.
> +	 * The width alignment is 8 bytes as indicated by the
> +	 * CSI_IMAG_PARA.IMAGE_WIDTH documentation. Convert it to pixels.
>  	 */
> +	walign =3D 8 * 8 / cc->bpp;
> +
>  	fsize->type =3D V4L2_FRMSIZE_TYPE_CONTINUOUS;
> -	fsize->stepwise.min_width =3D 1;
> -	fsize->stepwise.max_width =3D 65535;
> +	fsize->stepwise.min_width =3D walign;
> +	fsize->stepwise.max_width =3D round_down(65535U, walign);
>  	fsize->stepwise.min_height =3D 1;
>  	fsize->stepwise.max_height =3D 65535;
> -	fsize->stepwise.step_width =3D 1;
> +	fsize->stepwise.step_width =3D walign;
>  	fsize->stepwise.step_height =3D 1;
>=20
>  	return 0;

Looks good to me.
Reviewed-by: Alexander Stein <alexander.stein@ew.tq-group.com>

=2D-=20
TQ-Systems GmbH | M=FChlstra=DFe 2, Gut Delling | 82229 Seefeld, Germany
Amtsgericht M=FCnchen, HRB 105018
Gesch=E4ftsf=FChrer: Detlef Schneider, R=FCdiger Stahl, Stefan Schneider
http://www.tq-group.com/


