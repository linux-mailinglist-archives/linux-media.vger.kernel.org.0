Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 87EB857CD8D
	for <lists+linux-media@lfdr.de>; Thu, 21 Jul 2022 16:25:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231421AbiGUOZ2 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 21 Jul 2022 10:25:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35346 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231809AbiGUOZI (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 21 Jul 2022 10:25:08 -0400
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D68F91A4;
        Thu, 21 Jul 2022 07:25:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1658413505; x=1689949505;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=XQScDuMOBKvn8Z5aTBhlDzIvRRDFh2npk7v9MDeNqBU=;
  b=PyKIAczwHhgC7Fm2G61QRpRCdKoKK27Um3xLP2odnONrkfNHDJtpWzfa
   /z0DEMPMA86Q6YQU4ykY8V1/8hgxvvmXQzxCJTjLPg6CZzI7YEasyrlQ7
   FCPZ9eGiOsx6OB8Gnj6EMty9yOymC+odMJLuteqIjGgjBft/PU1tr8mgG
   T7DZc1L64UEl+QxwP+0pVh8tMjZIhyzFHBmYecb9DwuJPSUT5N0nkn37L
   2jTTrzSPYDKACsCLuO3WwkyCi0P79RCzPKRC9Jqf5eoVYO1KSWug1hZ5a
   t7dgt6Lh3ZubNTvhftpVawEtf55Xj0Us5iEBbQk2MnWGAfw6zknP+GVKU
   Q==;
X-IronPort-AV: E=Sophos;i="5.93,289,1654552800"; 
   d="scan'208";a="25189515"
Received: from unknown (HELO tq-pgp-pr1.tq-net.de) ([192.168.6.15])
  by mx1-pgp.tq-group.com with ESMTP; 21 Jul 2022 16:25:03 +0200
Received: from mx1.tq-group.com ([192.168.6.7])
  by tq-pgp-pr1.tq-net.de (PGP Universal service);
  Thu, 21 Jul 2022 16:25:03 +0200
X-PGP-Universal: processed;
        by tq-pgp-pr1.tq-net.de on Thu, 21 Jul 2022 16:25:03 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1658413503; x=1689949503;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=XQScDuMOBKvn8Z5aTBhlDzIvRRDFh2npk7v9MDeNqBU=;
  b=RSfSqxHlKIGIOAQdYl4BKZ6R0QlBJz0tSYxdGyPeh3FN8ACwSBghL62c
   QJ52d4ySn4tCMs/pRv6LJ2yqWyfUPQgdDgdWb6kT74Xlpt/UfzoInAJAn
   a/uTXMCQ68IDIPceMZknhwlfQgXAIlNtH1VaSvB1GbQEW2WwKyRv7hSrB
   d3U/fW6Th9mPTuqHaaBmZdYIdxTYtWQ4rH2RO17UW+CJHum5I358Htdsw
   CeIsY329OpgxYUsGoMr8g1Sw+JIDGZWakmTYDbBEkB6z0rUJz8MxE/gwn
   YIQfL/5LX1qPWTd9DGmB2qe9Y0WsMXTiM6upzXGI9REJ3ecpfiqz4OCW4
   A==;
X-IronPort-AV: E=Sophos;i="5.93,289,1654552800"; 
   d="scan'208";a="25189514"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
  by mx1.tq-group.com with ESMTP; 21 Jul 2022 16:25:03 +0200
Received: from steina-w.localnet (unknown [10.123.49.12])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id EB355280056;
        Thu, 21 Jul 2022 16:25:02 +0200 (CEST)
From:   Alexander Stein <alexander.stein@ew.tq-group.com>
To:     Sakari Ailus <sakari.ailus@iki.fi>
Cc:     "Paul J . Murphy" <paul.j.murphy@intel.com>,
        Daniele Alessandrelli <daniele.alessandrelli@intel.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v2 6/6] media: i2c: ov9282: Fix device detection
Date:   Thu, 21 Jul 2022 16:25:02 +0200
Message-ID: <4156055.7s5MMGUR32@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <YtQbCYCdUHcpnTs5@valkosipuli.retiisi.eu>
References: <20220715074858.875808-1-alexander.stein@ew.tq-group.com> <20220715074858.875808-7-alexander.stein@ew.tq-group.com> <YtQbCYCdUHcpnTs5@valkosipuli.retiisi.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi,

Am Sonntag, 17. Juli 2022, 16:22:01 CEST schrieb Sakari Ailus:
> Hi Alexander,
>=20
> On Fri, Jul 15, 2022 at 09:48:58AM +0200, Alexander Stein wrote:
> > Apparently the Vision Components model (VC=E2=80=AFMIPI=E2=80=AFOV9281)=
 does not support
> > address auto-increment, so probe fails with:
> > ov9282 2-0060: chip id mismatch: 9281!=3D92ff
> > Instead do two 1 byte reads and combine the result.
> >=20
> > Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
> > ---
> > Changes in v2:
> > * Fix commit message
> > * Add comment about prevented auto-increment
> > * Return early if reading ID register failed
> > * Reorder ID registers, smaller register number first
> >=20
> >  drivers/media/i2c/ov9282.c | 15 ++++++++++++++-
> >  1 file changed, 14 insertions(+), 1 deletion(-)
> >=20
> > diff --git a/drivers/media/i2c/ov9282.c b/drivers/media/i2c/ov9282.c
> > index 263cdffc558f..532791304c3d 100644
> > --- a/drivers/media/i2c/ov9282.c
> > +++ b/drivers/media/i2c/ov9282.c
> > @@ -761,11 +761,24 @@ static int ov9282_set_stream(struct v4l2_subdev *=
sd,
> > int enable)>=20
> >  static int ov9282_detect(struct ov9282 *ov9282)
> >  {
> > =20
> >  	int ret;
> >=20
> > +	u32 id[2];
> >=20
> >  	u32 val;
> >=20
> > -	ret =3D ov9282_read_reg(ov9282, OV9282_REG_ID, 2, &val);
> > +	/*
> > +	 * Some vendors prevent auto-increment, so each register has to
> > +	 * be read separately
> > +	 */
>=20
> I suppose it still works for writes I guess? Would be nice to have this in
> the comment.
>=20
> > +	ret =3D ov9282_read_reg(ov9282, OV9282_REG_ID,
> > +			      1, &id[0]);
>=20
> Fits on one line. Same below.
>=20
> >  	if (ret)
> >  =09
> >  		return ret;
> >=20
> > +	ret =3D ov9282_read_reg(ov9282, OV9282_REG_ID + 1,
> > +			      1, &id[1]);
> > +	if (ret)
> > +		return ret;
> > +
> > +	val =3D id[1];
> > +	val |=3D (id[0] << 8);
> >=20
> >  	if (val !=3D OV9282_ID) {
> >  =09
> >  		dev_err(ov9282->dev, "chip id mismatch: %x!=3D%x",

imx290 is affected by the same problem. This can be handles by using regmap=
's=20
config option use_single_read=3Dtrue.

Will convert to regmap to address this.

Best regards,
Alexander



