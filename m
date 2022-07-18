Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AEBB6577BDE
	for <lists+linux-media@lfdr.de>; Mon, 18 Jul 2022 08:45:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230240AbiGRGps (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 18 Jul 2022 02:45:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57426 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229680AbiGRGpr (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 18 Jul 2022 02:45:47 -0400
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E351A15A3A;
        Sun, 17 Jul 2022 23:45:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1658126746; x=1689662746;
  h=subject:from:to:cc:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=K22OndFF88XJbLRArzXV4DYIqqfg/QAlJ8HOx0024HM=;
  b=Y8jgzCr97g1qkFtinDQSLri0VZ8EwYl6d8Fv6x+EZNyqB7hkJ5vUZ1/i
   IfTLWgM9iwDRgGq1C00u3aWiWzJEZqJhc1wNSqPYqPQ8FPFkEbukfk5tz
   6+q+lEMUNRXmrXryIcQc1vuuX5eIbn6qo3mypDunTYycQhGCcHoNKcPbS
   Xx4seDQ2UjIzrIOVuPaBeSKY4jnyMPUE8MpZhvIyjs3RVNV2i4igSvWfA
   ljAMfUf6P4umXU3UnkEpRNp5Py/mD11TR5REdz0PhWMtFUtMSFHjV5tuC
   Ynin8aWpZ+ZS/ASpwfWqfQ5aSi8xBENIziktwZTbBXWATqTRIjJL/e4rl
   Q==;
X-IronPort-AV: E=Sophos;i="5.92,280,1650924000"; 
   d="scan'208";a="25095177"
Received: from unknown (HELO tq-pgp-pr1.tq-net.de) ([192.168.6.15])
  by mx1-pgp.tq-group.com with ESMTP; 18 Jul 2022 08:45:44 +0200
Received: from mx1.tq-group.com ([192.168.6.7])
  by tq-pgp-pr1.tq-net.de (PGP Universal service);
  Mon, 18 Jul 2022 08:45:44 +0200
X-PGP-Universal: processed;
        by tq-pgp-pr1.tq-net.de on Mon, 18 Jul 2022 08:45:44 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1658126744; x=1689662744;
  h=from:to:cc:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding:subject;
  bh=K22OndFF88XJbLRArzXV4DYIqqfg/QAlJ8HOx0024HM=;
  b=BcAPBWNwBDv2PvrkTembsIdT3ygSmr++8buIAWhMOVhBthY3J2+bjISm
   K0iz5JwJdUeqT/mAkCJs6Yapy7nPP12RtbmVolTTbG5DUjnHNlpjYX5fW
   0l6dz0M1ph2KmRX34PdaVS7nZKjLVBQmWyVdrlkYXcXaiuoL9zm+HiMzF
   itahG/Zg0YSVh9ubtrXfy8ha+w7GScP054RWS1xu3wrP8OJR36xzyEH34
   IalG6WR18SirOGvd8Cga0T2NPWKGeDBXicKi9fIkhsYF4Rph9sxbC+h3z
   tjW1sXPwKe0oRpLc4bz6YcAeRNEopxhvl3u9jNQuXJBedwvFOCUev2Wet
   g==;
X-IronPort-AV: E=Sophos;i="5.92,280,1650924000"; 
   d="scan'208";a="25095176"
Subject: Re: Re: [PATCH v2 6/6] media: i2c: ov9282: Fix device detection
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
  by mx1.tq-group.com with ESMTP; 18 Jul 2022 08:45:44 +0200
Received: from steina-w.localnet (unknown [10.123.49.12])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id 133B3280056;
        Mon, 18 Jul 2022 08:45:44 +0200 (CEST)
From:   Alexander Stein <alexander.stein@ew.tq-group.com>
To:     Sakari Ailus <sakari.ailus@iki.fi>
Cc:     "Paul J . Murphy" <paul.j.murphy@intel.com>,
        Daniele Alessandrelli <daniele.alessandrelli@intel.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org
Date:   Mon, 18 Jul 2022 08:45:41 +0200
Message-ID: <4777887.31r3eYUQgx@steina-w>
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

Hello Sakari,

thanks for the feedback.

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

Yes, I didn't notice any problems regarding writes. Will address this in th=
e=20
comment.

> > +	ret =3D ov9282_read_reg(ov9282, OV9282_REG_ID,
> > +			      1, &id[0]);
>=20
> Fits on one line. Same below.

Sure, will be changed.

Thanks and best regards,
Alexander

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




