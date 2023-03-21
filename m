Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D87566C2B40
	for <lists+linux-media@lfdr.de>; Tue, 21 Mar 2023 08:19:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229524AbjCUHTM (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 21 Mar 2023 03:19:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43426 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230488AbjCUHTC (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 21 Mar 2023 03:19:02 -0400
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7E98CF952
        for <linux-media@vger.kernel.org>; Tue, 21 Mar 2023 00:18:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1679383138; x=1710919138;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=oK6CV2HFA5Wiy/dDG0auXp4uS+U9M8gs2qElsMCsmaI=;
  b=prcF9ZwwUn3agyxew7+WakM9FRzkjI4Fka1sfDvYgouLSg0cS2scDF3f
   NXd+arYHVsFuMLHBTNCAziVwBmpwDtypzdWqQnBUpiMoPm1f48ay4Z+aq
   yW7t8nDnOhzoHpfWTWdKMYAUQ/M2Es62ay4HkIRK+GqQYuats3s4siYFJ
   MTSBU5X8At9DF002AHzkj10fu14L8MXWwzoaK6CW4XPomCtVUNGDrNMg0
   9lm8pQeC6Gzd2oLoCDVgE6RVhroPCuaPsD+eenifNDGjLWhkquLLCB5BF
   JtfgSBmZI7NnThgBddd2gEIGZCMjBhPP85cxnnBqTR1XafPFirhDrNYsm
   Q==;
X-IronPort-AV: E=Sophos;i="5.98,278,1673910000"; 
   d="scan'208";a="29818752"
Received: from unknown (HELO tq-pgp-pr1.tq-net.de) ([192.168.6.15])
  by mx1-pgp.tq-group.com with ESMTP; 21 Mar 2023 08:18:56 +0100
Received: from mx1.tq-group.com ([192.168.6.7])
  by tq-pgp-pr1.tq-net.de (PGP Universal service);
  Tue, 21 Mar 2023 08:18:56 +0100
X-PGP-Universal: processed;
        by tq-pgp-pr1.tq-net.de on Tue, 21 Mar 2023 08:18:56 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1679383136; x=1710919136;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=oK6CV2HFA5Wiy/dDG0auXp4uS+U9M8gs2qElsMCsmaI=;
  b=N2x5dRrtvdgbqwdiym2PL4n1f4zbxCA/tAdGMz5KB0vOQycj+q5tL7oL
   Qk++boVynfMHOuSgvA080YWPyBedwEx27ztIEiFzQFrkwmpyr0JHnVua3
   zKDk3xMmuJ5JGFFirIWFq9ZOStSB5LjQIIAXoNKx3vHAMAMGbP+E4KU9k
   lHkDIt8nq/SJ3mslFElf91RV3FqjnY6ahr5HEW+hiIxGious7LAoMVzUr
   kLALTgxeJ+EkhGwBx8xqQ9mlCuADLMKtpsjcJX8GahDKkpbKf4Tdj+rl2
   ouR1NLPAYdzIATMeezRRYMFJ2vJANObeQtHK+4ThhoKQc5NdZJwSxMzA3
   g==;
X-IronPort-AV: E=Sophos;i="5.98,278,1673910000"; 
   d="scan'208";a="29818751"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
  by mx1.tq-group.com with ESMTP; 21 Mar 2023 08:18:56 +0100
Received: from steina-w.localnet (unknown [10.123.53.21])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id 20689280056;
        Tue, 21 Mar 2023 08:18:56 +0100 (CET)
From:   Alexander Stein <alexander.stein@ew.tq-group.com>
To:     Rui Miguel Silva <rmfrfs@gmail.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 3/3] media: imx: imx7-media-csi: Fail for non video-capture formats
Date:   Tue, 21 Mar 2023 08:18:53 +0100
Message-ID: <5926875.lOV4Wx5bFT@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <20230317175744.GA28322@pendragon.ideasonboard.com>
References: <20230316143829.499039-1-alexander.stein@ew.tq-group.com> <m3o7or47hq.fsf@gmail.com> <20230317175744.GA28322@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi all,

Am Freitag, 17. M=E4rz 2023, 18:57:44 CET schrieb Laurent Pinchart:
> On Fri, Mar 17, 2023 at 05:23:29PM +0000, Rui Miguel Silva wrote:
> > Hi Alexander,
> > thanks for the patch.
> >=20
> > Alexander Stein <alexander.stein@ew.tq-group.com> writes:
> > > This driver only support V4L2_BUF_TYPE_VIDEO_CAPTURE, so fail for oth=
er
> > > passed types.
> > >=20
> > > Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
> > > ---
> > >=20
> > >  drivers/media/platform/nxp/imx7-media-csi.c | 8 ++++++++
> > >  1 file changed, 8 insertions(+)
> > >=20
> > > diff --git a/drivers/media/platform/nxp/imx7-media-csi.c
> > > b/drivers/media/platform/nxp/imx7-media-csi.c index
> > > 389d7d88b341..e470b0505d3b 100644
> > > --- a/drivers/media/platform/nxp/imx7-media-csi.c
> > > +++ b/drivers/media/platform/nxp/imx7-media-csi.c
> > > @@ -1186,6 +1186,11 @@ __imx7_csi_video_try_fmt(struct v4l2_pix_format
> > > *pixfmt,> >=20
> > >  static int imx7_csi_video_try_fmt_vid_cap(struct file *file, void *f=
h,
> > > =20
> > >  					  struct v4l2_format *f)
> > > =20
> > >  {
> > >=20
> > > +	struct imx7_csi *csi =3D video_drvdata(file);
> >=20
> > Maybe copy/paste problem csi is never used.

Yes, leftover from reordering patches.

> > > +
> > > +	if (f->type !=3D V4L2_BUF_TYPE_VIDEO_CAPTURE)
> > > +		return -EINVAL;
> >=20
> > Is this function ever called if f->type is not TYPE_VIDEO_CAPTURE?
>=20
> It shouldn't, v4l_g_fmt() and v4l_s_fmt() check the type and call the
> appropriate operation accordingly. I don't think this patch is needed.

You are right. I was mislead by the fact that imx7_csi_video_g_selection do=
es=20
need this check.

Best regards,
Alexander

> > > +
> > >=20
> > >  	__imx7_csi_video_try_fmt(&f->fmt.pix, NULL);
> > >  	return 0;
> > > =20
> > >  }
> > >=20
> > > @@ -1196,6 +1201,9 @@ static int imx7_csi_video_s_fmt_vid_cap(struct
> > > file *file, void *fh,> >=20
> > >  	struct imx7_csi *csi =3D video_drvdata(file);
> > >  	const struct imx7_csi_pixfmt *cc;
> > >=20
> > > +	if (f->type !=3D V4L2_BUF_TYPE_VIDEO_CAPTURE)
> > > +		return -EINVAL;
> >=20
> > Ditto?
> >=20
> > Cheers,
> >=20
> >    Rui
> > >=20
> > > +
> > >=20
> > >  	if (vb2_is_busy(&csi->q)) {
> > >  =09
> > >  		dev_err(csi->dev, "%s queue busy\n", __func__);
> > >  		return -EBUSY;


=2D-=20
TQ-Systems GmbH | M=FChlstra=DFe 2, Gut Delling | 82229 Seefeld, Germany
Amtsgericht M=FCnchen, HRB 105018
Gesch=E4ftsf=FChrer: Detlef Schneider, R=FCdiger Stahl, Stefan Schneider
http://www.tq-group.com/


