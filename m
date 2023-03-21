Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A7D6F6C2E6B
	for <lists+linux-media@lfdr.de>; Tue, 21 Mar 2023 11:08:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229784AbjCUKIf (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 21 Mar 2023 06:08:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51044 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229755AbjCUKId (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 21 Mar 2023 06:08:33 -0400
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D509F19B0
        for <linux-media@vger.kernel.org>; Tue, 21 Mar 2023 03:08:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1679393312; x=1710929312;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=adF2aNaNl3IWC5s2kzUM/m6VZW5aUO+RIufl4f2rZbs=;
  b=aoTKVOY0oWTBtMN1ymdQ4gnv4xsLDPGg+4xi62yODxCv9AzPGv+9VbVH
   8FYidrly3qB32c/a9ddblTBax5P2n2jaVhoHQ6BSYhwn8PZrnrqx8KkTZ
   B3cbGawZBwC8JI1BJVq3YmW86dUAK4RizxWPLJe0sG58dpQIqQ134NZ56
   vJN1JujNDhBYpiFAOqHuBVL2FJXTtq9KOx1000cGbMV4N3VQGiFhDuEhb
   Qs01ikB8XKeyjdzxOI+33bVsEnDDU7kL3Rd1MG+M8eHCosywp8MBhCg1j
   dmwCPAWiBB4WOUFX9HQWB8cX0u+oN4iA6FgsostlmboSFj3YQ02AgIbov
   w==;
X-IronPort-AV: E=Sophos;i="5.98,278,1673910000"; 
   d="scan'208";a="29826595"
Received: from unknown (HELO tq-pgp-pr1.tq-net.de) ([192.168.6.15])
  by mx1-pgp.tq-group.com with ESMTP; 21 Mar 2023 11:08:29 +0100
Received: from mx1.tq-group.com ([192.168.6.7])
  by tq-pgp-pr1.tq-net.de (PGP Universal service);
  Tue, 21 Mar 2023 11:08:29 +0100
X-PGP-Universal: processed;
        by tq-pgp-pr1.tq-net.de on Tue, 21 Mar 2023 11:08:29 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1679393309; x=1710929309;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=adF2aNaNl3IWC5s2kzUM/m6VZW5aUO+RIufl4f2rZbs=;
  b=V4OIIX6jiAFg0TYZTrCsmSH6fRc5htVE+7IbNZkkn1bfMVqBqkCY4yc3
   wqt6mGVwWZlhwedLu3UpPDoPNqbwf0vTKPyx3Ce44MmNB5F7cKD9hhEIG
   2tnM8TFkL1o/U/E1Qe/NRAYvNnIxASAqrZgSfZRJXeJh89oVvRVPXUX9H
   3bBHRIDxeJ/xt1A7Y+X3aCiT9l7MksMX1k9AJwqt7FGdxODDLD90QobPa
   +S0PkkdZ9Lrs0YtTldX589Byr/seHcNKKO0s9OjNSe8sWc2o8nGtOly+1
   6sjxnt6n2avTQ/3oBhQdrN08RHhJtCqLrPjo2TxiP6usejs/rCijYsBrR
   Q==;
X-IronPort-AV: E=Sophos;i="5.98,278,1673910000"; 
   d="scan'208";a="29826594"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
  by mx1.tq-group.com with ESMTP; 21 Mar 2023 11:08:29 +0100
Received: from steina-w.localnet (unknown [10.123.53.21])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id 7FCEB280056;
        Tue, 21 Mar 2023 11:08:29 +0100 (CET)
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
Subject: Re: [PATCH v2 1/2] media: imx: imx7-media-csi: Fix mbus framefmt field init
Date:   Tue, 21 Mar 2023 11:08:27 +0100
Message-ID: <2884312.e9J7NaK4W3@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <20230321093757.GZ20234@pendragon.ideasonboard.com>
References: <20230321072707.678039-1-alexander.stein@ew.tq-group.com> <20230321072707.678039-2-alexander.stein@ew.tq-group.com> <20230321093757.GZ20234@pendragon.ideasonboard.com>
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

Hi Laurent,

Am Dienstag, 21. M=E4rz 2023, 10:37:57 CET schrieb Laurent Pinchart:
> Hi Alexander,
>=20
> Thank you for the patch.
>=20
> On Tue, Mar 21, 2023 at 08:27:06AM +0100, Alexander Stein wrote:
> > 'field' is zero-initialized to V4L2_FIELD_ANY, which is an invalid value
> > to return to userspace. Instead fefault to non-interleaving.
>=20
> I prefer defaulting to non-interleaving instead of fefaulting :-) I'll
> fix the typo in my tree.

Oh :-) thanks for fixing this.

Best regards,
Alexander

> > Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
>=20
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
>=20
> > ---
> >=20
> >  drivers/media/platform/nxp/imx7-media-csi.c | 1 +
> >  1 file changed, 1 insertion(+)
> >=20
> > diff --git a/drivers/media/platform/nxp/imx7-media-csi.c
> > b/drivers/media/platform/nxp/imx7-media-csi.c index
> > c22bf5c827e7..3e97b9f2ff69 100644
> > --- a/drivers/media/platform/nxp/imx7-media-csi.c
> > +++ b/drivers/media/platform/nxp/imx7-media-csi.c
> > @@ -1610,6 +1610,7 @@ static int imx7_csi_video_init_format(struct
> > imx7_csi *csi)>=20
> >  	format.code =3D IMX7_CSI_DEF_MBUS_CODE;
> >  	format.width =3D IMX7_CSI_DEF_PIX_WIDTH;
> >  	format.height =3D IMX7_CSI_DEF_PIX_HEIGHT;
> >=20
> > +	format.field =3D V4L2_FIELD_NONE;
> >=20
> >  	imx7_csi_mbus_fmt_to_pix_fmt(&csi->vdev_fmt, &format, NULL);
> >  	csi->vdev_compose.width =3D format.width;


=2D-=20
TQ-Systems GmbH | M=FChlstra=DFe 2, Gut Delling | 82229 Seefeld, Germany
Amtsgericht M=FCnchen, HRB 105018
Gesch=E4ftsf=FChrer: Detlef Schneider, R=FCdiger Stahl, Stefan Schneider
http://www.tq-group.com/


