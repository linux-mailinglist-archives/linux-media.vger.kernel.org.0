Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6F37577CD85
	for <lists+linux-media@lfdr.de>; Tue, 15 Aug 2023 15:49:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236402AbjHONtL (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 15 Aug 2023 09:49:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37900 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237225AbjHONs6 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 15 Aug 2023 09:48:58 -0400
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A6122138
        for <linux-media@vger.kernel.org>; Tue, 15 Aug 2023 06:48:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1692107336; x=1723643336;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=bX/Qzoesdat8ROirhQuy8TEkxbKO2f8Spb1mCPB0ouM=;
  b=IRieqm97eFw2wldoFa0L49y/udo5a0buBTlUI+n6MiDsAwGaPVCQM1OK
   Ih91bGs2ssyHz/XaCg51JbfzGyXfCsc1htYFzw51JElDS/vzSdn2YbTGJ
   wzIilAqh/VnDKDtEJI8mVCKO5RU8pK38pm78duzNDs5MJSo2vLIdbr4S6
   DKyEkJHDcfJhqXjtxd5wdZNhG1+32sxF9/4Xvegc28V3ZvNTfJ2Bz1AFt
   fVZOihlYiHzeUxUvg2gLGwxqZz3jt7NqEXTZ3CED4Gdqt3KsfmT9s/CPe
   E1XPZ2CQ6sFFXOUcCxb/TEKMoC1AYTqJLPGaIOdxEB5D1I8U4rB8N1TZX
   Q==;
X-IronPort-AV: E=Sophos;i="6.01,174,1684792800"; 
   d="scan'208";a="32453495"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
  by mx1.tq-group.com with ESMTP; 15 Aug 2023 15:48:53 +0200
Received: from steina-w.localnet (steina-w.tq-net.de [10.123.53.21])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id A6D4E280075;
        Tue, 15 Aug 2023 15:48:53 +0200 (CEST)
From:   Alexander Stein <alexander.stein@ew.tq-group.com>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        Rui Miguel Silva <rmfrfs@gmail.com>,
        Daniel Scally <dan.scally@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Andy Shevchenko <andy@kernel.org>, Kate Hsuan <hpa@redhat.com>,
        Tommaso Merciai <tomm.merciai@gmail.com>,
        linux-media@vger.kernel.org
Subject: Re: [PATCH v4 3/5] media: imx290: Convert to new CCI register access helpers
Date:   Tue, 15 Aug 2023 15:48:53 +0200
Message-ID: <2156749.irdbgypaU6@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <ZNt+S6dl/rTNLgId@kekkonen.localdomain>
References: <20230627125109.52354-1-hdegoede@redhat.com> <20230815131539.GA9702@pendragon.ideasonboard.com> <ZNt+S6dl/rTNLgId@kekkonen.localdomain>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,
        URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Am Dienstag, 15. August 2023, 15:31:55 CEST schrieb Sakari Ailus:
> ********************
> Achtung externe E-Mail: =C3=96ffnen Sie Anh=C3=A4nge und Links nur, wenn =
Sie wissen,
> dass diese aus einer sicheren Quelle stammen und sicher sind. Leiten Sie
> die E-Mail im Zweifelsfall zur Pr=C3=BCfung an den IT-Helpdesk weiter.
> Attention external email: Open attachments and links only if you know that
> they are from a secure source and are safe. In doubt forward the email to
> the IT-Helpdesk to check it. ********************
>=20
> Hi Laurent,
>=20
> On Tue, Aug 15, 2023 at 04:15:39PM +0300, Laurent Pinchart wrote:
> > Hi Hans,
> >=20
> > On Tue, Jun 27, 2023 at 02:51:06PM +0200, Hans de Goede wrote:
> > > Use the new comon CCI register access helpers to replace the private
> > > register access helpers in the imx290 driver.
> > >=20
> > > Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > > Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> > > ---
> > > Note:
> > > 1. This is untested
> > > 2. For reviewers: all the IMX290_REG_?BIT defines in both the register
> > > address defines as well as in various reg-sequences were automatically
> > > changed using search replace.
> > > ---
> > > Changes in v3:
> > > - Fixed a couple of lines > 80 chars
> > >=20
> > > Changes in v2:
> > > - New patch in v2 of this series
> > > ---
> > >=20
> > >  drivers/media/i2c/Kconfig  |   1 +
> > >  drivers/media/i2c/imx290.c | 360 +++++++++++++++--------------------=
=2D-
> > >  2 files changed, 150 insertions(+), 211 deletions(-)
> >=20
> > [snip]
> >=20
> > > diff --git a/drivers/media/i2c/imx290.c b/drivers/media/i2c/imx290.c
> > > index b3f832e9d7e1..e78c7b91ae72 100644
> > > --- a/drivers/media/i2c/imx290.c
> > > +++ b/drivers/media/i2c/imx290.c
> > > @@ -21,91 +21,86 @@
> >=20
> > [snip]
> >=20
> > > @@ -615,63 +605,15 @@ imx290_format_info(const struct imx290 *imx290,
> > > u32 code)> >=20
> > >  	return NULL;
> > > =20
> > >  }
> > >=20
> > > -/*
> > > ---------------------------------------------------------------------=
=2D-
> > > ------ - * Register access
> > > - */
> > > -
> > > -static int __always_unused imx290_read(struct imx290 *imx290, u32 ad=
dr,
> > > u32 *value) -{
> > > -	u8 data[3] =3D { 0, 0, 0 };
> > > -	int ret;
> > > -
> > > -	ret =3D regmap_raw_read(imx290->regmap, addr & IMX290_REG_ADDR_MASK,
> > > -			      data, (addr >> IMX290_REG_SIZE_SHIFT) &=20
3);
> > > -	if (ret < 0) {
> > > -		dev_err(imx290->dev, "%u-bit read from 0x%04x failed:=20
%d\n",
> > > -			((addr >> IMX290_REG_SIZE_SHIFT) & 3) * 8,
> > > -			 addr & IMX290_REG_ADDR_MASK, ret);
> > > -		return ret;
> > > -	}
> > > -
> > > -	*value =3D get_unaligned_le24(data);
> > > -	return 0;
> > > -}
> > > -
> > > -static int imx290_write(struct imx290 *imx290, u32 addr, u32 value, =
int
> > > *err) -{
> > > -	u8 data[3];
> > > -	int ret;
> > > -
> > > -	if (err && *err)
> > > -		return *err;
> > > -
> > > -	put_unaligned_le24(value, data);
> >=20
> > We seem to be having a problem here, as the CCI helpers unconditionally
> > use big endian for the data :-(
>=20
> Well spotted. This driver needs to address this.
>=20
> It's a hardware issue though. It's the only sensor ever I've seen to have
> little endian registers.

It's getting even worse: There are cameras using this sensor when bulk read=
 is=20
broken (VC=E2=80=AFMIPI=E2=80=AFIMX327=E2=80=AFC, Laurent knows about this =
peculiar hardware), so=20
regmap_config.use_single_read has to be set to true. This is currently not=
=20
possible anymore insode this driver.

Best regards,
Alexander

> > > -
> > > -	ret =3D regmap_raw_write(imx290->regmap, addr & IMX290_REG_ADDR_MAS=
K,
> > > -			       data, (addr >> IMX290_REG_SIZE_SHIFT) &=20
3);
> > > -	if (ret < 0) {
> > > -		dev_err(imx290->dev, "%u-bit write to 0x%04x failed:=20
%d\n",
> > > -			((addr >> IMX290_REG_SIZE_SHIFT) & 3) * 8,
> > > -			 addr & IMX290_REG_ADDR_MASK, ret);
> > > -		if (err)
> > > -			*err =3D ret;
> > > -	}
> > > -
> > > -	return ret;
> > > -}
> > > -
> >=20
> > [snip]


=2D-=20
TQ-Systems GmbH | M=C3=BChlstra=C3=9Fe 2, Gut Delling | 82229 Seefeld, Germ=
any
Amtsgericht M=C3=BCnchen, HRB 105018
Gesch=C3=A4ftsf=C3=BChrer: Detlef Schneider, R=C3=BCdiger Stahl, Stefan Sch=
neider
http://www.tq-group.com/


