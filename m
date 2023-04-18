Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B4DDB6E5E3A
	for <lists+linux-media@lfdr.de>; Tue, 18 Apr 2023 12:08:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230231AbjDRKIO (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 18 Apr 2023 06:08:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36162 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230138AbjDRKIN (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 18 Apr 2023 06:08:13 -0400
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8B7E9525D
        for <linux-media@vger.kernel.org>; Tue, 18 Apr 2023 03:08:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1681812489; x=1713348489;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=tlaKVQjIOrOk6kHDZ3PwIXaDQygkMLeqcushxj+mKTg=;
  b=Z7miEddKUXYRxhhp+h17ZNcunvFayTD/F8WkoC1ygoTPhj0Ek0/9HON8
   3QSeKfDQJQ3ptC4QGtDmfc4AhaKYOCl+HHYYy39JucU8XMUkiNPJc79Ac
   Qoh0ZOzkeUOoYq4Oy2G0e8hQFxxgQGeTAVhku2ONO6kX45WHFVDyFnwP/
   BlIjXbHod02kPpq13U83LC9npWegr1X/ehpDBaV4qvgBiOTBJRGlVOe7d
   r8QehVz9g6WutG3GoCqNFXrA92AWx0TlXyzhRhzcV+B5HBreC2ckosVeo
   lwm4N3en3aPfL308/jDNV6xTe6se6nG7cBYAMHb5E1P3m2i6zfg99gp28
   A==;
X-IronPort-AV: E=Sophos;i="5.99,206,1677538800"; 
   d="scan'208";a="30394490"
Received: from unknown (HELO tq-pgp-pr1.tq-net.de) ([192.168.6.15])
  by mx1-pgp.tq-group.com with ESMTP; 18 Apr 2023 12:08:07 +0200
Received: from mx1.tq-group.com ([192.168.6.7])
  by tq-pgp-pr1.tq-net.de (PGP Universal service);
  Tue, 18 Apr 2023 12:08:07 +0200
X-PGP-Universal: processed;
        by tq-pgp-pr1.tq-net.de on Tue, 18 Apr 2023 12:08:07 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1681812487; x=1713348487;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=tlaKVQjIOrOk6kHDZ3PwIXaDQygkMLeqcushxj+mKTg=;
  b=mGad6q+bLpcPLLBT8xk2ugFaxLexjBx75bfyotV2Q2IGvPQdWmJOAlqE
   ixlbSZtoTJEwq6hO0ngapvqpa6+rlrwffSm+5mFVYCv8z5hhrjYPvxi0z
   jtEZRvEEFgEHO5dbf/iF+u83wgig+JCktubsZdUbC61oBIsnsZVQTUc0w
   Yviu9xVihFBvlSmkD4XPc3lJbLK3aKMkj0nEyjTlLgebxZu+SjkCRsklX
   JFTFJZTIt8KO7niSFZZ/s9JV1WsKxZYniSf36gzWUGt8O5WCGGuf0Z4tQ
   7+BuC/tz7faY605xGopd9iiMaWG1ojBVynWQZ/wiXmRRSG+2RFVIkzLjy
   g==;
X-IronPort-AV: E=Sophos;i="5.99,206,1677538800"; 
   d="scan'208";a="30394489"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
  by mx1.tq-group.com with ESMTP; 18 Apr 2023 12:08:07 +0200
Received: from steina-w.localnet (unknown [10.123.53.21])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id 71367280056;
        Tue, 18 Apr 2023 12:08:07 +0200 (CEST)
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
Date:   Tue, 18 Apr 2023 12:08:07 +0200
Message-ID: <4589555.LvFx2qVVIh@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <20230418100555.GC11510@pendragon.ideasonboard.com>
References: <20230418071439.197735-1-alexander.stein@ew.tq-group.com> <6038523.lOV4Wx5bFT@steina-w> <20230418100555.GC11510@pendragon.ideasonboard.com>
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

Am Dienstag, 18. April 2023, 12:05:55 CEST schrieb Laurent Pinchart:
> Hi Alexander,
>=20
> On Tue, Apr 18, 2023 at 12:00:43PM +0200, Alexander Stein wrote:
> > Am Dienstag, 18. April 2023, 11:27:13 CEST schrieb Laurent Pinchart:
> > > On Tue, Apr 18, 2023 at 09:14:37AM +0200, Alexander Stein wrote:
> > > > There is no need to convert input pixformat to mbus_framefmt and ba=
ck
> > > > again. Instead apply pixformat width contrains directly.
> > > >=20
> > > > Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
> > > > ---
> > > >=20
> > > >  drivers/media/platform/nxp/imx7-media-csi.c | 14 +++++++++-----
> > > >  1 file changed, 9 insertions(+), 5 deletions(-)
> > > >=20
> > > > diff --git a/drivers/media/platform/nxp/imx7-media-csi.c
> > > > b/drivers/media/platform/nxp/imx7-media-csi.c index
> > > > b701e823436a8..bd649fd9166fd 100644
> > > > --- a/drivers/media/platform/nxp/imx7-media-csi.c
> > > > +++ b/drivers/media/platform/nxp/imx7-media-csi.c
> > > > @@ -1145,8 +1145,8 @@ static const struct imx7_csi_pixfmt *
> > > >=20
> > > >  __imx7_csi_video_try_fmt(struct v4l2_pix_format *pixfmt,
> > > > =20
> > > >  			 struct v4l2_rect *compose)
> > > > =20
> > > >  {
> > > >=20
> > > > -	struct v4l2_mbus_framefmt fmt_src;
> > > >=20
> > > >  	const struct imx7_csi_pixfmt *cc;
> > > >=20
> > > > +	u32 stride;
> > > >=20
> > > >  	/*
> > > >  =09
> > > >  	 * Find the pixel format, default to the first supported format if
> > > >  	 not
> > > >=20
> > > > @@ -1172,12 +1172,16 @@ __imx7_csi_video_try_fmt(struct
> > > > v4l2_pix_format *pixfmt,> > >=20
> > > >  		}
> > > >  =09
> > > >  	}
> > > >=20
> > > > -	v4l2_fill_mbus_format(&fmt_src, pixfmt, 0);
> > > > -	imx7_csi_mbus_fmt_to_pix_fmt(pixfmt, &fmt_src, cc);
> > >=20
> > > Could you please keep the comment from imx7_csi_mbus_fmt_to_pix_fmt()
> > > here, to indicate where the alignment comes from ?
> >=20
> > Sure, why not.
> >=20
> > > 	/* Round up width for minimum burst size */
> > >=20
> > > We should likely revisit this in the future, I don't think the alignm=
ent
> > >=20
> > > is actually needed. This could be recorded already:
> > > 	/*
> > > =09
> > > 	 * Round up width for minimum burst size.
> > > 	 *
> > > 	 * TODO: Implement configurable stride support, and check what the=20
real
> > > 	 * hardware alignment constraint on the width is.
> > > 	 */
> >=20
> > Sounds good. I was already suspecting actual stride support is not
> > supported, as FBUF_PARA is set to 0 (in non-interlaced mode).
> >=20
> > > > +	v4l_bound_align_image(&pixfmt->width, 1, 0xffff, 8,
> > > > +			      &pixfmt->height, 1, 0xffff, 1, 0);
> > > > +
> > > > +	stride =3D round_up((pixfmt->width * cc->bpp) / 8, 8);
> > >=20
> > > You can drop the round_up(), as pixfmt->width is now a multiple of 8,=
 so
> > >=20
> > > 	pixfmt->bytesperline =3D pixfmt->width * cc->bpp / 8;
> >=20
> > But that is only identical if cc->bpp =3D=3D 8, or am I missing somethi=
ng
> > here?
>=20
> If cc->bpp is equal to 16, you will get
>=20
>  	pixfmt->bytesperline =3D pixfmt->width * 2;
>=20
> which will still be a multiple of 8 as width is a multiple of 8.

That's true only for 16 bpp. If you are using e.g. 'RG10' this assumption i=
s=20
not guaranteed.  Apparently it happens to be the case for 1080p on my imx32=
7=20
sensor though.

Best regards,
Alexander

> > > > +	pixfmt->bytesperline =3D stride;
> > > > +	pixfmt->sizeimage =3D stride * pixfmt->height;
> > > >=20
> > > >  	if (compose) {
> > > >=20
> > > > -		compose->width =3D fmt_src.width;
> > > > -		compose->height =3D fmt_src.height;
> > > > +		compose->width =3D pixfmt->width;
> > >=20
> > > This is a change of behaviour, compose->width used to be set to the
> > > unaligned width.
> >=20
> > Oh, you are right. I'll fix that.
> >=20
> > > > +		compose->height =3D pixfmt->height;
> > > >=20
> > > >  	}
> > > >  =09
> > > >  	return cc;


=2D-=20
TQ-Systems GmbH | M=FChlstra=DFe 2, Gut Delling | 82229 Seefeld, Germany
Amtsgericht M=FCnchen, HRB 105018
Gesch=E4ftsf=FChrer: Detlef Schneider, R=FCdiger Stahl, Stefan Schneider
http://www.tq-group.com/


