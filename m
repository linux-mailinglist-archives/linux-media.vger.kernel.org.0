Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0EB4C7DEDAB
	for <lists+linux-media@lfdr.de>; Thu,  2 Nov 2023 08:51:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234368AbjKBHvW (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 2 Nov 2023 03:51:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48246 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344681AbjKBHvV (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 2 Nov 2023 03:51:21 -0400
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9BE70102;
        Thu,  2 Nov 2023 00:51:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1698911475; x=1730447475;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=n0IBIAq8RhNq6Ga+B8so/nLlfc3ITUL9PJF7fmJSBHE=;
  b=ZT7guAhmle8nHfmjCQMGas8ggECrItzrahXSFD1zigDChYMsr50kv5ZK
   T29Cp8XTbF171lcw6CJxBUj9bisD+RoFy5oELnAY7SW6iPw1FRzcCknsq
   RIFnQno6gJgH2/gq6nrlX5xoqFBFvdNeUeMAnnxbvcnKA47/lInzoRAyK
   Ul+2xS0CRwh/A3UVZDn5bUAnY53G6qskAVYLMxpL+XXq6NM4GQCtOgWFv
   cz0yR9ZxP66q+QpwgA7yMIkRc7EmOOcn/L9za3P9Mlk567SolAejRIGNU
   3Rx3zFG0hj98hjZp14Vf1Tq/q3bnkKAYEt8IKICN68x0COm1Am9aqmfPY
   g==;
X-IronPort-AV: E=Sophos;i="6.03,270,1694728800"; 
   d="scan'208";a="33769828"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
  by mx1.tq-group.com with ESMTP; 02 Nov 2023 08:51:12 +0100
Received: from steina-w.localnet (steina-w.tq-net.de [10.123.53.18])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id 4948728007F;
        Thu,  2 Nov 2023 08:51:12 +0100 (CET)
From:   Alexander Stein <alexander.stein@ew.tq-group.com>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Hans de Goede <hdegoede@redhat.com>,
        linux-media@vger.kernel.org,
        Alain Volmat <alain.volmat@foss.st.com>, stable@vger.kernel.org
Subject: Re: [PATCH v2 1/2] media: v4l2-cci: Add support for little-endian encoded registers
Date:   Thu, 02 Nov 2023 08:51:12 +0100
Message-ID: <4980064.31r3eYUQgx@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <ZUNCFESRnKMwkHl7@kekkonen.localdomain>
References: <20231101122354.270453-1-alexander.stein@ew.tq-group.com> <20231102012217.GC5933@pendragon.ideasonboard.com> <ZUNCFESRnKMwkHl7@kekkonen.localdomain>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi,

thanks for the feedback.

Am Donnerstag, 2. November 2023, 07:30:44 CET schrieb Sakari Ailus:
> Hi Laurent,
>=20
> On Thu, Nov 02, 2023 at 03:22:17AM +0200, Laurent Pinchart wrote:
> > Hi Alexander,
> >=20
> > Thank you for the patch.
> >=20
> > On Wed, Nov 01, 2023 at 01:23:53PM +0100, Alexander Stein wrote:
> > > Some sensors, e.g. Sony, are using little-endian registers. Add suppo=
rt
> > > for
> >=20
> > I would write Sony IMX290 here, as there are Sony sensors that use big
> > endian.
>=20
> Almost all of them. There are a few exceptions indeed. This seems to be a
> bug.

Let's name IMX290 here as an actual example. No need to worry about other=20
models here.

> > > those by encoding the endianess into Bit 20 of the register address.
> > >=20
> > > Fixes: af73323b97702 ("media: imx290: Convert to new CCI register acc=
ess
> > > helpers") Cc: stable@vger.kernel.org
> > > Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
> > > ---
> > >=20
> > >  drivers/media/v4l2-core/v4l2-cci.c | 44 ++++++++++++++++++++++++----=
=2D-
> > >  include/media/v4l2-cci.h           |  5 ++++
> > >  2 files changed, 41 insertions(+), 8 deletions(-)
> > >=20
> > > diff --git a/drivers/media/v4l2-core/v4l2-cci.c
> > > b/drivers/media/v4l2-core/v4l2-cci.c index bc2dbec019b04..673637b67bf=
67
> > > 100644
> > > --- a/drivers/media/v4l2-core/v4l2-cci.c
> > > +++ b/drivers/media/v4l2-core/v4l2-cci.c
> > > @@ -18,6 +18,7 @@
> > >=20
> > >  int cci_read(struct regmap *map, u32 reg, u64 *val, int *err)
> > >  {
> > >=20
> > > +	bool little_endian;
> > >=20
> > >  	unsigned int len;
> > >  	u8 buf[8];
> > >  	int ret;
> > >=20
> > > @@ -25,6 +26,7 @@ int cci_read(struct regmap *map, u32 reg, u64 *val,
> > > int *err)> >=20
> > >  	if (err && *err)
> > >  =09
> > >  		return *err;
> > >=20
> > > +	little_endian =3D reg & CCI_REG_LE;
> >=20
> > You could initialize the variable when declaring it. Same below.
>=20
> I was thinking of the same, but then it'd be logical to move initialisati=
on
> of all related variables there. reg is modified here though. I'd keep
> setting little_endian here. If someone wants to move it, that could be do=
ne
> in a separate patch.
>=20
> > >  	len =3D FIELD_GET(CCI_REG_WIDTH_MASK, reg);
> > >  	reg =3D FIELD_GET(CCI_REG_ADDR_MASK, reg);
> > >=20
> > > @@ -40,16 +42,28 @@ int cci_read(struct regmap *map, u32 reg, u64 *va=
l,
> > > int *err)> >=20
> > >  		*val =3D buf[0];
> > >  		break;
> > >  =09
> > >  	case 2:
> > > -		*val =3D get_unaligned_be16(buf);
> > > +		if (little_endian)
> > > +			*val =3D get_unaligned_le16(buf);
> > > +		else
> > > +			*val =3D get_unaligned_be16(buf);
> >=20
> > Unrelated to this patch, isn't buf aligned to a 4 bytes boundary ?
>=20
> Very probably, as it's right after len that's an unsigned int. Adding
> __aligned(8) would ensure we don't need any of the unaligned variants, and
> most likely would keep the stack layout as-is.

You mean something like this?

u8 __aligned(8) buf[8];
[...]
if (little_endian)
	*val =3D le64_to_cpup(buf);
else
	*val =3D be64_to_cpup(buf);

But what about 24 Bits? There is no le24_to_cpup. I would rather use the sa=
me=20
API for all cases.

> Or... how about putting it in an union with a u64? That would mean it's
> accessible as u64 alignment-wise while the alignment itself is up to the
> ABI. A comment would be good to have probably.

An additional union seems a bit too much here. Unless something suitable=20
already exists for general usage.

Best regards,
Alexander

> > >  		break;
> > >  =09
> > >  	case 3:
> > > -		*val =3D get_unaligned_be24(buf);
> > > +		if (little_endian)
> > > +			*val =3D get_unaligned_le24(buf);
> > > +		else
> > > +			*val =3D get_unaligned_be24(buf);
> > >=20
> > >  		break;
> > >  =09
> > >  	case 4:
> > > -		*val =3D get_unaligned_be32(buf);
> > > +		if (little_endian)
> > > +			*val =3D get_unaligned_le32(buf);
> > > +		else
> > > +			*val =3D get_unaligned_be32(buf);
> > >=20
> > >  		break;
> > >  =09
> > >  	case 8:
> > > -		*val =3D get_unaligned_be64(buf);
> > > +		if (little_endian)
> > > +			*val =3D get_unaligned_le64(buf);
> > > +		else
> > > +			*val =3D get_unaligned_be64(buf);
> > >=20
> > >  		break;
> > >  =09
> > >  	default:
> > >  		dev_err(regmap_get_device(map), "Error invalid reg-width=20
%u for reg
> > >  		0x%04x\n",


=2D-=20
TQ-Systems GmbH | M=FChlstra=DFe 2, Gut Delling | 82229 Seefeld, Germany
Amtsgericht M=FCnchen, HRB 105018
Gesch=E4ftsf=FChrer: Detlef Schneider, R=FCdiger Stahl, Stefan Schneider
http://www.tq-group.com/


