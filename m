Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DEF4257DAA3
	for <lists+linux-media@lfdr.de>; Fri, 22 Jul 2022 09:10:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234343AbiGVHKH (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 22 Jul 2022 03:10:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34470 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234299AbiGVHKF (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 22 Jul 2022 03:10:05 -0400
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C83AA8E6F8
        for <linux-media@vger.kernel.org>; Fri, 22 Jul 2022 00:10:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1658473804; x=1690009804;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=0jqZG4e4VfoW11mglvDaPkoN1sNBv5jv4e8aSo7jl3I=;
  b=dbtv1J+uyo+4nUbY5CcWxwhQQ30UzqPKANN85bSwdF+/uAvLq+ETG8pV
   yK+pQL3o/lN4to/v7jeJX/2OlQfi+++yo0YIhCrW7J6b2JwFYO0yG599k
   pzrj2h+WWpIgM7Xf+eCxooI+uvigx8DxKMNbo2c9YH/BL8dZED1DJsnjP
   S7jN5GoQEdcC6gAnjqf4bF4UhST+pwixZdK/lU89wN/nCo5enmLkoAFWi
   sEitG1I54Nif33ZPsfOKnGN+Xis1p/wOq45zPiVxOrdOLE0/EqP4xkJDe
   VX/x37AUAGBiVv1NRmJ7vBRfJ3FmcPKhLytviVuL6jcVOOqesYJmCZYvS
   A==;
X-IronPort-AV: E=Sophos;i="5.93,185,1654552800"; 
   d="scan'208";a="25201258"
Received: from unknown (HELO tq-pgp-pr1.tq-net.de) ([192.168.6.15])
  by mx1-pgp.tq-group.com with ESMTP; 22 Jul 2022 09:10:01 +0200
Received: from mx1.tq-group.com ([192.168.6.7])
  by tq-pgp-pr1.tq-net.de (PGP Universal service);
  Fri, 22 Jul 2022 09:10:01 +0200
X-PGP-Universal: processed;
        by tq-pgp-pr1.tq-net.de on Fri, 22 Jul 2022 09:10:01 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1658473801; x=1690009801;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=0jqZG4e4VfoW11mglvDaPkoN1sNBv5jv4e8aSo7jl3I=;
  b=n+RKw3Tm7SugyV0ffn3VQ98Y8BavUym1Z/xCTA8vR1aoVoU2Dt6zymkl
   r0dqKw/n9496a1jbUS4Oz9rtLYAAayKmvPvA9SsCdvJ3zIgO2zAHlkCDu
   VxeYxZPYgam2ac1CB4J2fcT2Ea6PLLCcz1ukfsEPfH56vk42pPqxAiLLs
   yGw5VySxhbPO5zV3wXwagN7WI2fOh7lKWYvUgMEayrYHxLFcU4mSc05yP
   4wfawqjuYTvInI63f/J5GyhhwKbqeQXKmItSlWvngVlDZDPjEd73j3ytC
   jaJjh3yQt1Z1MNqouNg7nQciG4NSm5fzPBWbwaO5b8vEXFJ9LMwQTgj+9
   g==;
X-IronPort-AV: E=Sophos;i="5.93,185,1654552800"; 
   d="scan'208";a="25201257"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
  by mx1.tq-group.com with ESMTP; 22 Jul 2022 09:10:01 +0200
Received: from steina-w.localnet (unknown [10.123.49.12])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id 9AC7A280056;
        Fri, 22 Jul 2022 09:10:01 +0200 (CEST)
From:   Alexander Stein <alexander.stein@ew.tq-group.com>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hans.verkuil@cisco.com>,
        linux-media@vger.kernel.org
Subject: Re: Re: [PATCH 1/1] media: v4l2-core: v4l2-i2c: Fix default device name
Date:   Fri, 22 Jul 2022 09:09:59 +0200
Message-ID: <4191972.Isy0gbHreE@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <YtpDp3ahpabQ1ubY@paasikivi.fi.intel.com>
References: <20220718120151.425388-1-alexander.stein@ew.tq-group.com> <44845826.fMDQidcC6G@steina-w> <YtpDp3ahpabQ1ubY@paasikivi.fi.intel.com>
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

Am Freitag, 22. Juli 2022, 08:28:55 CEST schrieb Sakari Ailus:
> Hi Alexander,
>=20
> On Wed, Jul 20, 2022 at 09:54:40AM +0200, Alexander Stein wrote:
> > Hi Sakari,
> >=20
> > thanks for the feedback.
> >=20
> > Am Montag, 18. Juli 2022, 20:39:27 CEST schrieb Sakari Ailus:
> > > Hi Alexander,
> > >=20
> > > Thanks for the patch.
> > >=20
> > > On Mon, Jul 18, 2022 at 02:01:51PM +0200, Alexander Stein wrote:
> > > > Documentation to v4l2_i2c_subdev_set_name says I=B2C device name if
> > > > devname parameter is NULL. But instead the I=B2C driver name is
> > > > assigned.
> > > > Fix this by actually using the i2c_client->name for the subdev name.
> > > >=20
> > > > Fixes: 0658293012af ("media: v4l: subdev: Add a function to set an =
I=B2C
> > > > sub-device's name") Signed-off-by: Alexander Stein
> > > > <alexander.stein@ew.tq-group.com>
> > > > ---
> > > > Having a sensor node in DT with compatible =3D "ovti,ov9281" the su=
bdev
> > > > name is "ov9282" without this patch. With this patch applied it is
> > > > "ov9281". The i2c_client->name is "ov9281" in every case.
> > > >=20
> > > >  drivers/media/v4l2-core/v4l2-i2c.c | 2 +-
> > > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > > >=20
> > > > diff --git a/drivers/media/v4l2-core/v4l2-i2c.c
> > > > b/drivers/media/v4l2-core/v4l2-i2c.c index b4acca75644b..90c3c79931=
7a
> > > > 100644
> > > > --- a/drivers/media/v4l2-core/v4l2-i2c.c
> > > > +++ b/drivers/media/v4l2-core/v4l2-i2c.c
> > > > @@ -33,7 +33,7 @@ void v4l2_i2c_subdev_set_name(struct v4l2_subdev
> > > > *sd,
> > > >=20
> > > >  			      const char *devname, const char
> >=20
> > *postfix)
> >=20
> > > >  {
> > > > =20
> > > >  	if (!devname)
> > > >=20
> > > > -		devname =3D client->dev.driver->name;
> > > > +		devname =3D client->name;
> > >=20
> > > This would work OF somehow but not on ACPI. At the moment, at least, I
> > > think this information needs to come from the driver itself.
> >=20
> > I've not much experience regarding ACPI, nor can I test anything. Which
> > information from ACPI should be used as devname? AFAICS i2c_acpi_fill_i=
nfo
> > need to be modified to set info->type as well. This should fix the ACPI
> > case.
> Where would that information come from?

I don't have experience with ACPI. So you essentially are saying ACPI can't=
=20
provide this kind of information?

> > Nevertheless currently either the documentation or the implementation
> > needs a fix, they don't match. You can also opt to driver name in case
> > client->name is empty. Is this acceptable?
>=20
> How would you "fix" it? It currently uses the driver name unless the driv=
er
> set the name for the device. This works reasonably well in all cases.

If ACPI can't provide the actual device model name, then you can't fix it,=
=20
agreed.

Best regards,
Alexander



