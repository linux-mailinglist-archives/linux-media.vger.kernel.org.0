Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7AE5B6E739C
	for <lists+linux-media@lfdr.de>; Wed, 19 Apr 2023 09:02:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230153AbjDSHCt (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 19 Apr 2023 03:02:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35638 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229850AbjDSHCs (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 19 Apr 2023 03:02:48 -0400
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A49794C21
        for <linux-media@vger.kernel.org>; Wed, 19 Apr 2023 00:02:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1681887766; x=1713423766;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=QYsl7dtzCYk0RvKpHTny/n/Gdf7RNnRqHNqkP7H4+Ws=;
  b=cRj/7MPGYHnu6oSQN2VRyeJFH9MYC/wcOoxM1OpFnvpH4LdAng5B1QHk
   1H+6nvJVvjLdrhSaoxeKOMBqmHf+MOYLi0F7eiyfcrF2S0IpiHsjbM4Ww
   tVJ15e4nlkTX8fnZMD5q3hLULZmqQAL1bpLVknAZkWKfHQURns41yb67o
   7RnrRupKExoDOf85d1in/gHTtxJVTJzDjM8eHHsfDV4E2RkxQgghPqlmh
   4jU02i2AIG0l6jERu+eIPJmq7XT0ppIInK+lhIIhpUZ2j4BV3vaE2gYoG
   6tPjTBxjWFez1wsOfd6wueg2lALm81TOMOxqg4TY4a3S2Z81yIi5ytyko
   g==;
X-IronPort-AV: E=Sophos;i="5.99,208,1677538800"; 
   d="scan'208";a="30415064"
Received: from unknown (HELO tq-pgp-pr1.tq-net.de) ([192.168.6.15])
  by mx1-pgp.tq-group.com with ESMTP; 19 Apr 2023 09:02:44 +0200
Received: from mx1.tq-group.com ([192.168.6.7])
  by tq-pgp-pr1.tq-net.de (PGP Universal service);
  Wed, 19 Apr 2023 09:02:45 +0200
X-PGP-Universal: processed;
        by tq-pgp-pr1.tq-net.de on Wed, 19 Apr 2023 09:02:45 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1681887765; x=1713423765;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=QYsl7dtzCYk0RvKpHTny/n/Gdf7RNnRqHNqkP7H4+Ws=;
  b=XUcAEALGAym08PmWplrmQedoFwx8PDlzCYpfacbLHylWctpMwZRL1+3F
   N2i0/Jllgs7hi4DS7Q25UDSj5mfxPaoHL4RvRKvUg93xpOjySERyJfuYf
   ICpJMkCfq6giuPhseQSbjMYGrhIUReOVZWlD3+IYF0lkOcxOZvT+qTkVe
   pqTxUheMPvj7rZlp9cUIbC0YhEph/2Y/+UjvCmj9kEM6wEPrRowr1QmT5
   Ro7hJfhUaztW51OSxZFAxNe3g943XLZrTnrSGUqFybarJ8mN/fRvO5Gw0
   o83LgEr2fDUmNqVXD2S/GEuOkzVR3LgY99iJBmfaBr7RFHaYlCuIcbovF
   g==;
X-IronPort-AV: E=Sophos;i="5.99,208,1677538800"; 
   d="scan'208";a="30415063"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
  by mx1.tq-group.com with ESMTP; 19 Apr 2023 09:02:44 +0200
Received: from steina-w.localnet (unknown [10.123.53.21])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id 9DB70280056;
        Wed, 19 Apr 2023 09:02:44 +0200 (CEST)
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
Subject: Re: [PATCH v3 2/4] media: imx: imx7-media-csi: Remove interlave fields
Date:   Wed, 19 Apr 2023 09:02:44 +0200
Message-ID: <3637672.ElGaqSPkdT@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <20230418154351.GH30837@pendragon.ideasonboard.com>
References: <20230418122041.1318862-1-alexander.stein@ew.tq-group.com> <20230418122041.1318862-3-alexander.stein@ew.tq-group.com> <20230418154351.GH30837@pendragon.ideasonboard.com>
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

Am Dienstag, 18. April 2023, 17:43:51 CEST schrieb Laurent Pinchart:
> Hi Alexander,
>=20
> Thank you for the patch.
>=20
> In the subject line, "interlave" is misspelled. I'd write "Remove
> incorrect interlacing support"

Sounds much better, thanks. I'll change that.

> On Tue, Apr 18, 2023 at 02:20:39PM +0200, Alexander Stein wrote:
> > Interlaced mode is currently not supported, so disable fields in try_fm=
t.
>=20
> And here,
>=20
> The driver doesn't currently support interlacing, but due to legacy
> leftovers, it accepts values for the pixel format "field" field other
> than V4L2_FIELD_NONE. Fix it by hardcoding V4L2_FIELD_NONE. Proper
> interlacing support can be implemented later if desired.
>=20
> With this,
>=20
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
>=20
> I can apply those changes directly to my tree if you would prefer
> avoiding a v4.

Thanks, as Patch 3/4 need another round anyway. I'll update accordingly and=
=20
resend.

Best regards,
Alexander

> > Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
> > ---
> > Changes in v3:
> > * Remove left-over interlace mode check
> >=20
> >  drivers/media/platform/nxp/imx7-media-csi.c | 15 +--------------
> >  1 file changed, 1 insertion(+), 14 deletions(-)
> >=20
> > diff --git a/drivers/media/platform/nxp/imx7-media-csi.c
> > b/drivers/media/platform/nxp/imx7-media-csi.c index
> > b149374b07ee1..1315f5743b76f 100644
> > --- a/drivers/media/platform/nxp/imx7-media-csi.c
> > +++ b/drivers/media/platform/nxp/imx7-media-csi.c
> > @@ -1162,20 +1162,6 @@ __imx7_csi_video_try_fmt(struct v4l2_pix_format
> > *pixfmt,>=20
> >  		cc =3D imx7_csi_find_pixel_format(pixfmt->pixelformat);
> >  =09
> >  	}
> >=20
> > -	/* Allow IDMAC interweave but enforce field order from source. */
> > -	if (V4L2_FIELD_IS_INTERLACED(pixfmt->field)) {
> > -		switch (pixfmt->field) {
> > -		case V4L2_FIELD_SEQ_TB:
> > -			pixfmt->field =3D V4L2_FIELD_INTERLACED_TB;
> > -			break;
> > -		case V4L2_FIELD_SEQ_BT:
> > -			pixfmt->field =3D V4L2_FIELD_INTERLACED_BT;
> > -			break;
> > -		default:
> > -			break;
> > -		}
> > -	}
> > -
> >=20
> >  	/*
> >  =09
> >  	 * Round up width for minimum burst size.
> >  	 *
> >=20
> > @@ -1187,6 +1173,7 @@ __imx7_csi_video_try_fmt(struct v4l2_pix_format
> > *pixfmt,>=20
> >  	pixfmt->bytesperline =3D pixfmt->width * cc->bpp / 8;
> >  	pixfmt->sizeimage =3D pixfmt->bytesperline * pixfmt->height;
> >=20
> > +	pixfmt->field =3D V4L2_FIELD_NONE;
> >=20
> >  	return cc;
> > =20
> >  }


=2D-=20
TQ-Systems GmbH | M=FChlstra=DFe 2, Gut Delling | 82229 Seefeld, Germany
Amtsgericht M=FCnchen, HRB 105018
Gesch=E4ftsf=FChrer: Detlef Schneider, R=FCdiger Stahl, Stefan Schneider
http://www.tq-group.com/


