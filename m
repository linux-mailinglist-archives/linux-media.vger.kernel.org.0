Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6BA1457B227
	for <lists+linux-media@lfdr.de>; Wed, 20 Jul 2022 09:54:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235316AbiGTHyq (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 20 Jul 2022 03:54:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39806 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233984AbiGTHyp (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 20 Jul 2022 03:54:45 -0400
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9038F6554F
        for <linux-media@vger.kernel.org>; Wed, 20 Jul 2022 00:54:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1658303682; x=1689839682;
  h=subject:from:to:cc:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=3+T9gbvb0dt1+pqABU33aPToMBjN5u/okXmCyGieOzA=;
  b=QnTdOmkBs2dvlaw4n17fEudYa1V3PeuUoJJh3xW1wPIDXE+j0nwiNsT3
   HhaRXDTssg+e0XK+K87YqqgYk0i6X+YR6VQQ/pEmfUE2MggM9KYPJNN82
   13fGbXWlt0qxIJ5fkWtbO8wrHfm1hhkwVGhtd6Gd4hpRD7u7SCr4t+12h
   IhUduMMsbja5p7Z1OWspbWTgnhcxeyynFaOEQyTE2AOI+0U0FXe3r8Qt3
   aQUHn0h1ZN5HTPFqcAv4BXIzuTsHzWcPB7mUkSRCO+rDKXcwAUMYqh9b8
   Q/tGUdFLui/yr8A9pgiKujhr/QN1ZV+dMa2bs0Sle+r0FlSd20QH2KHye
   A==;
X-IronPort-AV: E=Sophos;i="5.92,286,1650924000"; 
   d="scan'208";a="25150899"
Received: from unknown (HELO tq-pgp-pr1.tq-net.de) ([192.168.6.15])
  by mx1-pgp.tq-group.com with ESMTP; 20 Jul 2022 09:54:40 +0200
Received: from mx1.tq-group.com ([192.168.6.7])
  by tq-pgp-pr1.tq-net.de (PGP Universal service);
  Wed, 20 Jul 2022 09:54:40 +0200
X-PGP-Universal: processed;
        by tq-pgp-pr1.tq-net.de on Wed, 20 Jul 2022 09:54:40 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1658303680; x=1689839680;
  h=from:to:cc:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding:subject;
  bh=3+T9gbvb0dt1+pqABU33aPToMBjN5u/okXmCyGieOzA=;
  b=G2FJ9DfkQHr7igrCtNzTkfiqut1koV4HSislewd+ptRc9pF2QI8H9PrV
   LDK/Pro9WBuFtuD3NEMEMIUNyMvc4TH2qZmaQNRkI3Xt1GFRs/NeAYRkj
   s0E2tQkV9ZEMdV9sf4dGZMqHgipxVxrUz6/aEfWWdw1WViUaDgA0GKIjw
   bRJA78tzj7x5rE6W0AbTYWUVNAkvR2Fa7xZcZSewR8MgOv9JMzu5ut+uT
   epnnhTNsrlZ/E8J4aEiCdo67Lw10PDV6Q7YmOWzfmLTOAmeJAWn/q4ral
   NNk+/tfFVuBmDqyi6d+nhyMwXxYaPNDlZ6fJjrJg/S2WjEZo91g2bA5Ir
   A==;
X-IronPort-AV: E=Sophos;i="5.92,286,1650924000"; 
   d="scan'208";a="25150898"
Subject: Re: Re: [PATCH 1/1] media: v4l2-core: v4l2-i2c: Fix default device name
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
  by mx1.tq-group.com with ESMTP; 20 Jul 2022 09:54:40 +0200
Received: from steina-w.localnet (unknown [10.123.49.12])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id 9C47E280056;
        Wed, 20 Jul 2022 09:54:40 +0200 (CEST)
From:   Alexander Stein <alexander.stein@ew.tq-group.com>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hans.verkuil@cisco.com>,
        linux-media@vger.kernel.org
Date:   Wed, 20 Jul 2022 09:54:40 +0200
Message-ID: <44845826.fMDQidcC6G@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <YtWo33+6J9DBtG0z@paasikivi.fi.intel.com>
References: <20220718120151.425388-1-alexander.stein@ew.tq-group.com> <YtWo33+6J9DBtG0z@paasikivi.fi.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Sakari,

thanks for the feedback.

Am Montag, 18. Juli 2022, 20:39:27 CEST schrieb Sakari Ailus:
> Hi Alexander,
>=20
> Thanks for the patch.
>=20
> On Mon, Jul 18, 2022 at 02:01:51PM +0200, Alexander Stein wrote:
> > Documentation to v4l2_i2c_subdev_set_name says I=B2C device name if
> > devname parameter is NULL. But instead the I=B2C driver name is assigne=
d.
> > Fix this by actually using the i2c_client->name for the subdev name.
> >=20
> > Fixes: 0658293012af ("media: v4l: subdev: Add a function to set an I=B2C
> > sub-device's name") Signed-off-by: Alexander Stein
> > <alexander.stein@ew.tq-group.com>
> > ---
> > Having a sensor node in DT with compatible =3D "ovti,ov9281" the subdev
> > name is "ov9282" without this patch. With this patch applied it is
> > "ov9281". The i2c_client->name is "ov9281" in every case.
> >=20
> >  drivers/media/v4l2-core/v4l2-i2c.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >=20
> > diff --git a/drivers/media/v4l2-core/v4l2-i2c.c
> > b/drivers/media/v4l2-core/v4l2-i2c.c index b4acca75644b..90c3c799317a
> > 100644
> > --- a/drivers/media/v4l2-core/v4l2-i2c.c
> > +++ b/drivers/media/v4l2-core/v4l2-i2c.c
> > @@ -33,7 +33,7 @@ void v4l2_i2c_subdev_set_name(struct v4l2_subdev *sd,
> >=20
> >  			      const char *devname, const char=20
*postfix)
> > =20
> >  {
> > =20
> >  	if (!devname)
> >=20
> > -		devname =3D client->dev.driver->name;
> > +		devname =3D client->name;
>=20
> This would work OF somehow but not on ACPI. At the moment, at least, I th=
ink
> this information needs to come from the driver itself.

I've not much experience regarding ACPI, nor can I test anything. Which=20
information from ACPI should be used as devname? AFAICS i2c_acpi_fill_info=
=20
need to be modified to set info->type as well. This should fix the ACPI cas=
e.

Nevertheless currently either the documentation or the implementation needs=
 a=20
fix, they don't match. You can also opt to driver name in case client->name=
 is=20
empty. Is this acceptable?

Best regards,
Alexander



