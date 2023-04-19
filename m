Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1BD526E7399
	for <lists+linux-media@lfdr.de>; Wed, 19 Apr 2023 09:01:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231862AbjDSHB1 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 19 Apr 2023 03:01:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34758 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229633AbjDSHBZ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 19 Apr 2023 03:01:25 -0400
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A03F3191
        for <linux-media@vger.kernel.org>; Wed, 19 Apr 2023 00:01:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1681887683; x=1713423683;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=aAx05+IOOVkajk9MsdTQnVq3/7ahZFO2x1LzaCMOaXk=;
  b=LW2eEK53jts5Jwe2P5nf+bJGWPg1/BvRCWoyCzksKRM2GHpTxuOZvpih
   QPiy65GvZAfCdsU7Yl1FeI+Dz6zvF9SuW24KQqPmaTm4un0vB5mLJ1RAY
   I9F+c07cz7mgJXv0QonYwEHJFZwTgjUTYxP/n1ur90ZUx91OgianZjxdS
   mlbs2mT3qF914GaSBoO5gmlcBdJHfCOwpByACFwYMySz+u3JIkbfd8qbR
   uY3mNSfleVNsUWL1vMNqXJaeFcfJNW91pUzr1Qf69l+k+qQpU3ZVcJ8XF
   W7uST8adcfoz4B4EPSlxT1m/dB6HdlJOLCllamE+dxYBwZ+Yz+atV6F7D
   A==;
X-IronPort-AV: E=Sophos;i="5.99,208,1677538800"; 
   d="scan'208";a="30414978"
Received: from unknown (HELO tq-pgp-pr1.tq-net.de) ([192.168.6.15])
  by mx1-pgp.tq-group.com with ESMTP; 19 Apr 2023 09:01:21 +0200
Received: from mx1.tq-group.com ([192.168.6.7])
  by tq-pgp-pr1.tq-net.de (PGP Universal service);
  Wed, 19 Apr 2023 09:01:21 +0200
X-PGP-Universal: processed;
        by tq-pgp-pr1.tq-net.de on Wed, 19 Apr 2023 09:01:21 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1681887681; x=1713423681;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=aAx05+IOOVkajk9MsdTQnVq3/7ahZFO2x1LzaCMOaXk=;
  b=QEe+koU3ta3uxlT+ZsLz6io6mpsRA56pRM8swko75D2uOzzO4vKlkRKz
   W1w795u6udsIFh/ytgpLQuefV/jn1dCJWdZBHbKUP7kO3frw4zG8yjuPT
   2lanEPRiDTAY6UfGUTHh48b6i/pW2NGFhlT2I0XcHuNU4NcJpUmIsIBWV
   48a9Cie6P69T8aJUXARkHMMaYKudm1miEuettWgR222ckguK4bxDL0u7v
   2n2qKyYe7YGLvsqmKyibCLDBJeyMb0h2ZxdKjEJOCJWHhVR1XTSPc/3jI
   MT6edeNXPORZiu8m8DHnbyFYZOXiTQTVQf8ivmKXQ1mmTTO6vmQsZiQcC
   w==;
X-IronPort-AV: E=Sophos;i="5.99,208,1677538800"; 
   d="scan'208";a="30414975"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
  by mx1.tq-group.com with ESMTP; 19 Apr 2023 09:01:20 +0200
Received: from steina-w.localnet (unknown [10.123.53.21])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id C5D27280056;
        Wed, 19 Apr 2023 09:01:19 +0200 (CEST)
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
Subject: Re: [PATCH v3 3/4] media: imx: imx7-media-csi: Lift width constraints for 8bpp formats
Date:   Wed, 19 Apr 2023 09:01:17 +0200
Message-ID: <6180938.31r3eYUQgx@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <20230418155947.GI30837@pendragon.ideasonboard.com>
References: <20230418122041.1318862-1-alexander.stein@ew.tq-group.com> <20230418122041.1318862-4-alexander.stein@ew.tq-group.com> <20230418155947.GI30837@pendragon.ideasonboard.com>
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

thanks for the feedback.

Am Dienstag, 18. April 2023, 17:59:47 CEST schrieb Laurent Pinchart:
> Hi Alexander,
>=20
> Thank you for the patch.
>=20
> The commit message should state "Lift width constraint for 16bpp
> formats".

To be pedantic it should be called "Lift width constraint for non-8bpp=20
formats" :)

> I would also phrase is "Relax" instead of "Lift" as it's not
> completely lifted.

That's true, this subtle difference should be accounted for. Thanks.

> On Tue, Apr 18, 2023 at 02:20:40PM +0200, Alexander Stein wrote:
> > For 8-bit formats the image_width just needs to be a multiple of 8 pixe=
ls
> > others just a multiple of 4 pixels.
>=20
> This is a bit terse, and I think a word or two are missing. It could be
> improved:
>=20
> The driver unconditionally aligns the image width to multiples of 8
> pixels. The real alignment constraint is 8 bytes, as indicated by the
> CSI_IMAG_PARA.IMAGE_WIDTH documentation that calls for 8 pixel alignment
> for 8bpp formats and 4 pixel alignment for other formats.

Thanks for this suggestion. This sounds much better.

> > Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
> > ---
> > Changes in v3:
> > * Fix commit message (Only 8-bit formats needs multiple of 8 pixels)
> >=20
> >  drivers/media/platform/nxp/imx7-media-csi.c | 9 ++++++++-
> >  1 file changed, 8 insertions(+), 1 deletion(-)
> >=20
> > diff --git a/drivers/media/platform/nxp/imx7-media-csi.c
> > b/drivers/media/platform/nxp/imx7-media-csi.c index
> > 1315f5743b76f..730c9c57bf4bc 100644
> > --- a/drivers/media/platform/nxp/imx7-media-csi.c
> > +++ b/drivers/media/platform/nxp/imx7-media-csi.c
> > @@ -1146,6 +1146,7 @@ __imx7_csi_video_try_fmt(struct v4l2_pix_format
> > *pixfmt,>=20
> >  			 struct v4l2_rect *compose)
> > =20
> >  {
> > =20
> >  	const struct imx7_csi_pixfmt *cc;
> >=20
> > +	u32 walign;
> >=20
> >  	if (compose) {
> >  =09
> >  		compose->width =3D pixfmt->width;
> >=20
> > @@ -1162,13 +1163,19 @@ __imx7_csi_video_try_fmt(struct v4l2_pix_format
> > *pixfmt,>=20
> >  		cc =3D imx7_csi_find_pixel_format(pixfmt->pixelformat);
> >  =09
> >  	}
> >=20
> > +	/* Refer to CSI_IMAG_PARA.IMAGE_WIDTH description */
> > +	if (cc->bpp =3D=3D 8)
> > +		walign =3D 8;
> > +	else
> > +		walign =3D 4;
>=20
> Would the following convey the purpose better ?
>=20
> 	/*
> 	 * The width alignment is 8 bytes as indicated by the
> 	 * CSI_IMAG_PARA.IMAGE_WIDTH documentation. Convert it to pixels.
> 	 */
> 	walign =3D 8 * 8 / cc->bpp;

I was wondering how to shorten this calculation without using ? operator,=20
nice.

> > +
> >=20
> >  	/*
> >  =09
> >  	 * Round up width for minimum burst size.
> >  	 *
> >  	 * TODO: Implement configurable stride support, and check what the=20
real
> >  	 * hardware alignment constraint on the width is.
> >  	 */
>=20
> We can now drop the second part of the sentence :-) The first line is
> actually not very accurate anymore. How about
>=20
> 	/*
> 	 * The width alignment is 8 bytes as indicated by the
> 	 * CSI_IMAG_PARA.IMAGE_WIDTH documentation. Convert it to pixels.
> 	 *
>   	 * TODO: Implement configurable stride support.
> 	 */
> 	walign =3D 8 * 8 / cc->bpp;
> 	v4l_bound_align_image(&pixfmt->width, 1, 0xffff, walign,
> 			      &pixfmt->height, 1, 0xffff, 1, 0);

That's neat, thanks. I'll update accordingly.

Best regards,
Alexander

> > -	v4l_bound_align_image(&pixfmt->width, 1, 0xffff, 8,
> > +	v4l_bound_align_image(&pixfmt->width, 1, 0xffff, walign,
> >=20
> >  			      &pixfmt->height, 1, 0xffff, 1, 0);
> >  =09
> >  	pixfmt->bytesperline =3D pixfmt->width * cc->bpp / 8;


=2D-=20
TQ-Systems GmbH | M=FChlstra=DFe 2, Gut Delling | 82229 Seefeld, Germany
Amtsgericht M=FCnchen, HRB 105018
Gesch=E4ftsf=FChrer: Detlef Schneider, R=FCdiger Stahl, Stefan Schneider
http://www.tq-group.com/


