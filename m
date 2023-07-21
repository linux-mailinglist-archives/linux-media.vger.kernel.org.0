Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B880475BDFD
	for <lists+linux-media@lfdr.de>; Fri, 21 Jul 2023 07:50:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230004AbjGUFuQ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 21 Jul 2023 01:50:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36254 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229744AbjGUFtp (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 21 Jul 2023 01:49:45 -0400
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 35D3930FB
        for <linux-media@vger.kernel.org>; Thu, 20 Jul 2023 22:48:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1689918536; x=1721454536;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=gA1k3fUNwS6ZYW0mt9DLVamLHAOBCQDLW2rAQbt5CB0=;
  b=m9+o1lMoVQ0zSeemWPZnnibC/Jk87C18nWqg+D5z5m8QJVvskiUs3xdA
   B2u7QJB1k6U3N3oLxsG/r7UrqDVoAjnhk/LEMydWaK+c59vgJhOZ1RMe0
   46KYTZ1onscXicq8txyo2/pu7oJmsVnMjEsV6dfSCP04a+/I9mqX+7f2C
   nT0hOyl+ySs90hwG8a+seFb1h+JHX/mQ7sq/nrJXZPspBxAZV8iTyuKU4
   A9MGcd9EpzN74zozo75WbE+baDqy3OcKrQdNFbafl0F4G4VTwqfjjzKJD
   rGKeFTPkE0Udad6HKWU5y4mFVI2lwnoyMT/Pv0gId4rdVElwEiLhcAYsB
   w==;
X-IronPort-AV: E=Sophos;i="6.01,220,1684792800"; 
   d="scan'208";a="32043780"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
  by mx1.tq-group.com with ESMTP; 21 Jul 2023 07:48:54 +0200
Received: from steina-w.localnet (unknown [10.123.53.21])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id 1678D280078;
        Fri, 21 Jul 2023 07:48:54 +0200 (CEST)
From:   Alexander Stein <alexander.stein@ew.tq-group.com>
To:     hverkuil-cisco@xs4all.nl, Fabio Estevam <festevam@gmail.com>
Cc:     sakari.ailus@linux.intel.com, laurent.pinchart@ideasonboard.com,
        rmfrfs@gmail.com, tharvey@gateworks.com,
        linux-media@vger.kernel.org, Fabio Estevam <festevam@denx.de>
Subject: Re: [PATCH v2] media: imx: imx7-media-csi: Fix applying format constraints
Date:   Fri, 21 Jul 2023 07:48:52 +0200
Message-ID: <4522817.cEBGB3zze1@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <20230720222543.1740198-1-festevam@gmail.com>
References: <20230720222543.1740198-1-festevam@gmail.com>
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

Am Freitag, 21. Juli 2023, 00:25:43 CEST schrieb Fabio Estevam:
> From: Fabio Estevam <festevam@denx.de>
>=20
> v4l_bound_align_image() aligns to a multiple power of 2 of walign, but the
> result only needs to be a multiple of walign.
>=20
> This causes a 640x480 sensor that used to report:
>=20
> 	Width/Height      : 640/480
>=20
> to incorrectly report:
>=20
> 	Width/Height      : 768/480
>=20
> Fix this problem by doing the correct alignment via clamp_roundup().
>=20
> Reported-by: Tim Harvey <tharvey@gateworks.com>
> Fixes: 6f482c4729d9 ("media: imx: imx7-media-csi: Get rid of superfluous
> call to imx7_csi_mbus_fmt_to_pix_fmt") Co-developed-by: Alexander Stein
> <alexander.stein@ew.tq-group.com> Signed-off-by: Alexander Stein
> <alexander.stein@ew.tq-group.com>
> Signed-off-by: Fabio Estevam <festevam@denx.de>
> ---
> Changes since v1:
> - Export clamp_roundup().
>=20
>  drivers/media/platform/nxp/imx7-media-csi.c | 4 ++--
>  drivers/media/v4l2-core/v4l2-common.c       | 5 +++--
>  include/media/v4l2-common.h                 | 2 ++
>  3 files changed, 7 insertions(+), 4 deletions(-)
>=20
> diff --git a/drivers/media/platform/nxp/imx7-media-csi.c
> b/drivers/media/platform/nxp/imx7-media-csi.c index
> 0bd2613b9320..f3c506fc19c4 100644
> --- a/drivers/media/platform/nxp/imx7-media-csi.c
> +++ b/drivers/media/platform/nxp/imx7-media-csi.c
> @@ -1137,8 +1137,8 @@ __imx7_csi_video_try_fmt(struct v4l2_pix_format
> *pixfmt, * TODO: Implement configurable stride support.
>  	 */
>  	walign =3D 8 * 8 / cc->bpp;
> -	v4l_bound_align_image(&pixfmt->width, 1, 0xffff, walign,
> -			      &pixfmt->height, 1, 0xffff, 1, 0);
> +	pixfmt->width =3D clamp_roundup(pixfmt->width, 1, 0xffff, walign);
> +	pixfmt->height =3D clamp_roundup(pixfmt->height, 1, 0xffff, 1);
>=20
>  	pixfmt->bytesperline =3D pixfmt->width * cc->bpp / 8;
>  	pixfmt->sizeimage =3D pixfmt->bytesperline * pixfmt->height;
> diff --git a/drivers/media/v4l2-core/v4l2-common.c
> b/drivers/media/v4l2-core/v4l2-common.c index bee1535b04d3..3e8c16bcb0f6
> 100644
> --- a/drivers/media/v4l2-core/v4l2-common.c
> +++ b/drivers/media/v4l2-core/v4l2-common.c
> @@ -106,8 +106,8 @@ static unsigned int clamp_align(unsigned int x, unsig=
ned
> int min, return x;
>  }
>=20
> -static unsigned int clamp_roundup(unsigned int x, unsigned int min,
> -				   unsigned int max, unsigned int=20
alignment)
> +unsigned int clamp_roundup(unsigned int x, unsigned int min,
> +			   unsigned int max, unsigned int alignment)
>  {
>  	x =3D clamp(x, min, max);
>  	if (alignment)
> @@ -115,6 +115,7 @@ static unsigned int clamp_roundup(unsigned int x,
> unsigned int min,
>=20
>  	return x;
>  }
> +EXPORT_SYMBOL(clamp_roundup);
>=20
>  void v4l_bound_align_image(u32 *w, unsigned int wmin, unsigned int wmax,
>  			   unsigned int walign,
> diff --git a/include/media/v4l2-common.h b/include/media/v4l2-common.h
> index d278836fd9cb..7059b99f4afa 100644
> --- a/include/media/v4l2-common.h
> +++ b/include/media/v4l2-common.h
> @@ -521,6 +521,8 @@ int v4l2_fill_pixfmt(struct v4l2_pix_format *pixfmt, =
u32
> pixelformat, u32 width, u32 height);
>  int v4l2_fill_pixfmt_mp(struct v4l2_pix_format_mplane *pixfmt, u32
> pixelformat, u32 width, u32 height);
> +unsigned int clamp_roundup(unsigned int x, unsigned int min,
> +			   unsigned int max, unsigned int alignment);
>=20
>  /**
>   * v4l2_get_link_freq - Get link rate from transmitter

I expect this to work, but I'm not so sure about exporting clamp_roundup().
I would rather use v4l2_apply_frmsize_constraints() instead, but this requi=
res=20
additional work, refer to the TODO in imx7_csi_video_enum_framesizes().
See also my first (broken) try in [1].

As a short term fix, using clamp_roundup() is okay to me. But I'm thinking=
=20
about using a copy of clamp_roundup() as in v1 instead,so to avoid an event=
ual=20
unexport of clamp_roundup in the future. Maybe this concern doesn't matter,=
 I=20
guess the maintainers can tell.

Best regards,
Alexander

[1] https://lore.kernel.org/linux-media/202307210050.s7hfCvwG-lkp@intel.com=
/T/
#ma88811098cb96f3698a8248d903f0c3455febec7

=2D-=20
TQ-Systems GmbH | M=FChlstra=DFe 2, Gut Delling | 82229 Seefeld, Germany
Amtsgericht M=FCnchen, HRB 105018
Gesch=E4ftsf=FChrer: Detlef Schneider, R=FCdiger Stahl, Stefan Schneider
http://www.tq-group.com/


