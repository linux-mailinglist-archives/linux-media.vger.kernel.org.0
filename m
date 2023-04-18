Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1C31D6E5E23
	for <lists+linux-media@lfdr.de>; Tue, 18 Apr 2023 12:01:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229958AbjDRKBA (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 18 Apr 2023 06:01:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59982 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229652AbjDRKA7 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 18 Apr 2023 06:00:59 -0400
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C3971EC
        for <linux-media@vger.kernel.org>; Tue, 18 Apr 2023 03:00:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1681812054; x=1713348054;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=dWWlwOleC3JsfX7CKvESIahpJItJm1NO1du1T9ChI2E=;
  b=UKPP4HZx0KMlrVJCXCBzhQUiiUX74XPRV/pwyU1u8y/pD0gkuxczItvT
   nugjyLDAM+d462M2jFITESDGH7TFKF2G7ZvQE5qBOIAXh8l2d5YAfTucD
   xEN5PHIrtL8tlwtXBpuNw6aOWSmzR1TOoM9v37SbX/NaZdmXMSp7QL4uy
   /JlbND/Z900yzSKUUddneCjyaMn7s+V+g+C/VIq3zwQ5LLh8xEdq9AOci
   dujImqZFaAaeUcB8xyxfzSA9nxEFTcWsJ1xTbk/xOFvDAFdEkKgN7xvV3
   YmRkROxJhQXDfnchkTRL94W8p6GYXggGapzQFb20UwgYoP7HoUxhJ+qt7
   Q==;
X-IronPort-AV: E=Sophos;i="5.99,206,1677538800"; 
   d="scan'208";a="30394096"
Received: from unknown (HELO tq-pgp-pr1.tq-net.de) ([192.168.6.15])
  by mx1-pgp.tq-group.com with ESMTP; 18 Apr 2023 12:00:51 +0200
Received: from mx1.tq-group.com ([192.168.6.7])
  by tq-pgp-pr1.tq-net.de (PGP Universal service);
  Tue, 18 Apr 2023 12:00:51 +0200
X-PGP-Universal: processed;
        by tq-pgp-pr1.tq-net.de on Tue, 18 Apr 2023 12:00:51 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1681812051; x=1713348051;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=dWWlwOleC3JsfX7CKvESIahpJItJm1NO1du1T9ChI2E=;
  b=GlmZBsT0vNSogUilwe9w/g5MyOgDMEatQV5mTaQUDB+wKCsxNAweC4mI
   SQ2WQ0Jmj3ELgHTPR8zCCJZGtM0KJc97CVxru+nrQW0xX6arB0SnjJuv3
   Hje/Gjjt8hZI+F5dP6O7Qddm0w8QPMJlNmB9Uvi8p7QXPLuCFTM7Jd3IG
   hrnEZ7nU/PctJp9tUV9LcusmVVEk99lNqXP8HgbiAGreCQ51M/Lmeg/yg
   zWjdtXN93rwrNV1K2Ky2uihwHtdtp/5xnifxPyYptJegM00/wH45L1THT
   5BZ2L+kUR94O98cDBrcNeMeHaSKk6hgtIeBq7Ck4tZjghEFrY+ym1egQ/
   w==;
X-IronPort-AV: E=Sophos;i="5.99,206,1677538800"; 
   d="scan'208";a="30394094"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
  by mx1.tq-group.com with ESMTP; 18 Apr 2023 12:00:51 +0200
Received: from steina-w.localnet (unknown [10.123.53.21])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id C6EA4280056;
        Tue, 18 Apr 2023 12:00:50 +0200 (CEST)
From:   Alexander Stein <alexander.stein@ew.tq-group.com>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Rui Miguel Silva <rmfrfs@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        NXP Linux Team <linux-imx@nxp.com>,
        linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 1/3] media: imx: imx7-media-csi: Get rid of superfluous call to imx7_csi_mbus_fmt_to_pix_fmt
Date:   Tue, 18 Apr 2023 12:00:43 +0200
Message-ID: <6038523.lOV4Wx5bFT@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <20230418092713.GA26319@pendragon.ideasonboard.com>
References: <20230418071439.197735-1-alexander.stein@ew.tq-group.com> <20230418071439.197735-2-alexander.stein@ew.tq-group.com> <20230418092713.GA26319@pendragon.ideasonboard.com>
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

thanks or your feedback.

Am Dienstag, 18. April 2023, 11:27:13 CEST schrieb Laurent Pinchart:
> Hi Alexander,
>=20
> Thank you for the patch.
>=20
> On Tue, Apr 18, 2023 at 09:14:37AM +0200, Alexander Stein wrote:
> > There is no need to convert input pixformat to mbus_framefmt and back
> > again. Instead apply pixformat width contrains directly.
> >=20
> > Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
> > ---
> >=20
> >  drivers/media/platform/nxp/imx7-media-csi.c | 14 +++++++++-----
> >  1 file changed, 9 insertions(+), 5 deletions(-)
> >=20
> > diff --git a/drivers/media/platform/nxp/imx7-media-csi.c
> > b/drivers/media/platform/nxp/imx7-media-csi.c index
> > b701e823436a8..bd649fd9166fd 100644
> > --- a/drivers/media/platform/nxp/imx7-media-csi.c
> > +++ b/drivers/media/platform/nxp/imx7-media-csi.c
> > @@ -1145,8 +1145,8 @@ static const struct imx7_csi_pixfmt *
> >=20
> >  __imx7_csi_video_try_fmt(struct v4l2_pix_format *pixfmt,
> > =20
> >  			 struct v4l2_rect *compose)
> > =20
> >  {
> >=20
> > -	struct v4l2_mbus_framefmt fmt_src;
> >=20
> >  	const struct imx7_csi_pixfmt *cc;
> >=20
> > +	u32 stride;
> >=20
> >  	/*
> >  =09
> >  	 * Find the pixel format, default to the first supported format if=20
not
> >=20
> > @@ -1172,12 +1172,16 @@ __imx7_csi_video_try_fmt(struct v4l2_pix_format
> > *pixfmt,>=20
> >  		}
> >  =09
> >  	}
> >=20
> > -	v4l2_fill_mbus_format(&fmt_src, pixfmt, 0);
> > -	imx7_csi_mbus_fmt_to_pix_fmt(pixfmt, &fmt_src, cc);
>=20
> Could you please keep the comment from imx7_csi_mbus_fmt_to_pix_fmt()
> here, to indicate where the alignment comes from ?

Sure, why not.

> 	/* Round up width for minimum burst size */
>=20
> We should likely revisit this in the future, I don't think the alignment
> is actually needed. This could be recorded already:
>=20
> 	/*
> 	 * Round up width for minimum burst size.
> 	 *
> 	 * TODO: Implement configurable stride support, and check what the=20
real
> 	 * hardware alignment constraint on the width is.
> 	 */

Sounds good. I was already suspecting actual stride support is not supporte=
d,=20
as FBUF_PARA is set to 0 (in non-interlaced mode).

> > +	v4l_bound_align_image(&pixfmt->width, 1, 0xffff, 8,
> > +			      &pixfmt->height, 1, 0xffff, 1, 0);
> > +
> > +	stride =3D round_up((pixfmt->width * cc->bpp) / 8, 8);
>=20
> You can drop the round_up(), as pixfmt->width is now a multiple of 8, so
>=20
> 	pixfmt->bytesperline =3D pixfmt->width * cc->bpp / 8;

But that is only identical if cc->bpp =3D=3D 8, or am I missing something h=
ere?

> > +	pixfmt->bytesperline =3D stride;
> > +	pixfmt->sizeimage =3D stride * pixfmt->height;
> >=20
> >  	if (compose) {
> >=20
> > -		compose->width =3D fmt_src.width;
> > -		compose->height =3D fmt_src.height;
> > +		compose->width =3D pixfmt->width;
>=20
> This is a change of behaviour, compose->width used to be set to the
> unaligned width.

Oh, you are right. I'll fix that.

Best regards,
Alexander

> > +		compose->height =3D pixfmt->height;
> >=20
> >  	}
> >  =09
> >  	return cc;


=2D-=20
TQ-Systems GmbH | M=FChlstra=DFe 2, Gut Delling | 82229 Seefeld, Germany
Amtsgericht M=FCnchen, HRB 105018
Gesch=E4ftsf=FChrer: Detlef Schneider, R=FCdiger Stahl, Stefan Schneider
http://www.tq-group.com/


