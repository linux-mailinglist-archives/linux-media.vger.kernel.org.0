Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1DEB47DEDB9
	for <lists+linux-media@lfdr.de>; Thu,  2 Nov 2023 08:55:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229869AbjKBHzK (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 2 Nov 2023 03:55:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40740 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229481AbjKBHzJ (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 2 Nov 2023 03:55:09 -0400
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 34C3EE7;
        Thu,  2 Nov 2023 00:55:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1698911703; x=1730447703;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=UT9KkaWeC9iEHL3CytxD/4vaN52Hd3YMhJYH/SxmXPY=;
  b=MlIb+aTrca1U7IOlKSoNF+gZos3e+J3/XER3gyvl4CxKx6IMdbqaWfvP
   GwfSixPrW6O4tbMsDiecVI9JRfbvr8SzDhONzJpHUudFfiMaWDqDaz3EL
   ZqOi7YSy0iHyJPLqBsLzUS0TS+Uwy1ZyWyTC5l+1qSGLqvluKHcU9GmEk
   6DEVlaS7EvuLXHnKvY67WkVRyFRY3skDCHzgcpdnTL/tkK/JlldEYZEX9
   dcXAz6XTIiN/trqAQsDeulk5riewIUVqu/V1wRR45ljuqyHEPPO9/+O3x
   TY7W4SRwW4zRlyFw2NkDeTZVW9Kp54shJcWC1u4eqHMCuIBlEWgpGNGAl
   g==;
X-IronPort-AV: E=Sophos;i="6.03,270,1694728800"; 
   d="scan'208";a="33769933"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
  by mx1.tq-group.com with ESMTP; 02 Nov 2023 08:55:01 +0100
Received: from steina-w.localnet (steina-w.tq-net.de [10.123.53.18])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id 9601828007F;
        Thu,  2 Nov 2023 08:55:00 +0100 (CET)
From:   Alexander Stein <alexander.stein@ew.tq-group.com>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Hans de Goede <hdegoede@redhat.com>,
        linux-media@vger.kernel.org,
        Alain Volmat <alain.volmat@foss.st.com>, stable@vger.kernel.org
Subject: Re: [PATCH v2 1/2] media: v4l2-cci: Add support for little-endian encoded registers
Date:   Thu, 02 Nov 2023 08:55:01 +0100
Message-ID: <1977009.tdWV9SEqCh@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <20231102012217.GC5933@pendragon.ideasonboard.com>
References: <20231101122354.270453-1-alexander.stein@ew.tq-group.com> <20231101122354.270453-2-alexander.stein@ew.tq-group.com> <20231102012217.GC5933@pendragon.ideasonboard.com>
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

Am Donnerstag, 2. November 2023, 02:22:17 CET schrieb Laurent Pinchart:
> ********************
> Achtung externe E-Mail: =D6ffnen Sie Anh=E4nge und Links nur, wenn Sie wi=
ssen,
> dass diese aus einer sicheren Quelle stammen und sicher sind. Leiten Sie
> die E-Mail im Zweifelsfall zur Pr=FCfung an den IT-Helpdesk weiter.
> Attention external email: Open attachments and links only if you know that
> they are from a secure source and are safe. In doubt forward the email to
> the IT-Helpdesk to check it. ********************
>=20
> Hi Alexander,
>=20
> Thank you for the patch.
>=20
> On Wed, Nov 01, 2023 at 01:23:53PM +0100, Alexander Stein wrote:
> > Some sensors, e.g. Sony, are using little-endian registers. Add support
> > for
>=20
> I would write Sony IMX290 here, as there are Sony sensors that use big
> endian.
>=20
> > those by encoding the endianess into Bit 20 of the register address.
> >=20
> > Fixes: af73323b97702 ("media: imx290: Convert to new CCI register access
> > helpers") Cc: stable@vger.kernel.org
> > Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
> > ---
> >=20
> >  drivers/media/v4l2-core/v4l2-cci.c | 44 ++++++++++++++++++++++++------
> >  include/media/v4l2-cci.h           |  5 ++++
> >  2 files changed, 41 insertions(+), 8 deletions(-)
> >=20
> > diff --git a/drivers/media/v4l2-core/v4l2-cci.c
> > b/drivers/media/v4l2-core/v4l2-cci.c index bc2dbec019b04..673637b67bf67
> > 100644
> > --- a/drivers/media/v4l2-core/v4l2-cci.c
> > +++ b/drivers/media/v4l2-core/v4l2-cci.c
> > @@ -18,6 +18,7 @@
> >=20
> >  int cci_read(struct regmap *map, u32 reg, u64 *val, int *err)
> >  {
> >=20
> > +	bool little_endian;
> >=20
> >  	unsigned int len;
> >  	u8 buf[8];
> >  	int ret;
> >=20
> > @@ -25,6 +26,7 @@ int cci_read(struct regmap *map, u32 reg, u64 *val, i=
nt
> > *err)>=20
> >  	if (err && *err)
> >  =09
> >  		return *err;
> >=20
> > +	little_endian =3D reg & CCI_REG_LE;
>=20
> You could initialize the variable when declaring it. Same below.
>=20
> >  	len =3D FIELD_GET(CCI_REG_WIDTH_MASK, reg);
> >  	reg =3D FIELD_GET(CCI_REG_ADDR_MASK, reg);
> >=20
> > @@ -40,16 +42,28 @@ int cci_read(struct regmap *map, u32 reg, u64 *val,
> > int *err)>=20
> >  		*val =3D buf[0];
> >  		break;
> >  =09
> >  	case 2:
> > -		*val =3D get_unaligned_be16(buf);
> > +		if (little_endian)
> > +			*val =3D get_unaligned_le16(buf);
> > +		else
> > +			*val =3D get_unaligned_be16(buf);
>=20
> Unrelated to this patch, isn't buf aligned to a 4 bytes boundary ?
>=20
> >  		break;
> >  =09
> >  	case 3:
> > -		*val =3D get_unaligned_be24(buf);
> > +		if (little_endian)
> > +			*val =3D get_unaligned_le24(buf);
> > +		else
> > +			*val =3D get_unaligned_be24(buf);
> >=20
> >  		break;
> >  =09
> >  	case 4:
> > -		*val =3D get_unaligned_be32(buf);
> > +		if (little_endian)
> > +			*val =3D get_unaligned_le32(buf);
> > +		else
> > +			*val =3D get_unaligned_be32(buf);
> >=20
> >  		break;
> >  =09
> >  	case 8:
> > -		*val =3D get_unaligned_be64(buf);
> > +		if (little_endian)
> > +			*val =3D get_unaligned_le64(buf);
> > +		else
> > +			*val =3D get_unaligned_be64(buf);
> >=20
> >  		break;
> >  =09
> >  	default:
> >  		dev_err(regmap_get_device(map), "Error invalid reg-width=20
%u for reg
> >  		0x%04x\n",>=20
> > @@ -68,6 +82,7 @@ EXPORT_SYMBOL_GPL(cci_read);
> >=20
> >  int cci_write(struct regmap *map, u32 reg, u64 val, int *err)
> >  {
> >=20
> > +	bool little_endian;
> >=20
> >  	unsigned int len;
> >  	u8 buf[8];
> >  	int ret;
> >=20
> > @@ -75,6 +90,7 @@ int cci_write(struct regmap *map, u32 reg, u64 val, i=
nt
> > *err)>=20
> >  	if (err && *err)
> >  =09
> >  		return *err;
> >=20
> > +	little_endian =3D reg & CCI_REG_LE;
> >=20
> >  	len =3D FIELD_GET(CCI_REG_WIDTH_MASK, reg);
> >  	reg =3D FIELD_GET(CCI_REG_ADDR_MASK, reg);
> >=20
> > @@ -83,16 +99,28 @@ int cci_write(struct regmap *map, u32 reg, u64 val,
> > int *err)>=20
> >  		buf[0] =3D val;
> >  		break;
> >  =09
> >  	case 2:
> > -		put_unaligned_be16(val, buf);
> > +		if (little_endian)
> > +			put_unaligned_le16(val, buf);
> > +		else
> > +			put_unaligned_be16(val, buf);
> >=20
> >  		break;
> >  =09
> >  	case 3:
> > -		put_unaligned_be24(val, buf);
> > +		if (little_endian)
> > +			put_unaligned_le24(val, buf);
> > +		else
> > +			put_unaligned_be24(val, buf);
> >=20
> >  		break;
> >  =09
> >  	case 4:
> > -		put_unaligned_be32(val, buf);
> > +		if (little_endian)
> > +			put_unaligned_le32(val, buf);
> > +		else
> > +			put_unaligned_be32(val, buf);
> >=20
> >  		break;
> >  =09
> >  	case 8:
> > -		put_unaligned_be64(val, buf);
> > +		if (little_endian)
> > +			put_unaligned_le64(val, buf);
> > +		else
> > +			put_unaligned_be64(val, buf);
> >=20
> >  		break;
> >  =09
> >  	default:
> >  		dev_err(regmap_get_device(map), "Error invalid reg-width=20
%u for reg
> >  		0x%04x\n",>=20
> > diff --git a/include/media/v4l2-cci.h b/include/media/v4l2-cci.h
> > index 0f6803e4b17e9..ef3faf0c9d44d 100644
> > --- a/include/media/v4l2-cci.h
> > +++ b/include/media/v4l2-cci.h
> > @@ -32,12 +32,17 @@ struct cci_reg_sequence {
> >=20
> >  #define CCI_REG_ADDR_MASK		GENMASK(15, 0)
> >  #define CCI_REG_WIDTH_SHIFT		16
> >  #define CCI_REG_WIDTH_MASK		GENMASK(19, 16)
> >=20
> > +#define CCI_REG_LE			BIT(20)
> >=20
> >  #define CCI_REG8(x)			((1 << CCI_REG_WIDTH_SHIFT)=20
| (x))
> >  #define CCI_REG16(x)			((2 << CCI_REG_WIDTH_SHIFT)=20
| (x))
> >  #define CCI_REG24(x)			((3 << CCI_REG_WIDTH_SHIFT)=20
| (x))
> >  #define CCI_REG32(x)			((4 << CCI_REG_WIDTH_SHIFT)=20
| (x))
> >  #define CCI_REG64(x)			((8 << CCI_REG_WIDTH_SHIFT)=20
| (x))
> >=20
> > +#define CCI_REG16_LE(x)			((2 << CCI_REG_WIDTH_SHIFT)=20
| (x) | CCI_REG_LE)
> > +#define CCI_REG24_LE(x)			((3 << CCI_REG_WIDTH_SHIFT)=20
| (x) | CCI_REG_LE)
> > +#define CCI_REG32_LE(x)			((4 << CCI_REG_WIDTH_SHIFT)=20
| (x) | CCI_REG_LE)
> > +#define CCI_REG64_LE(x)			((8 << CCI_REG_WIDTH_SHIFT)=20
| (x) | CCI_REG_LE)
>=20
> I would put CCI_REG_LE first, to match the bits order.

You mean this order?

CCI_REG8(x)
CCI_REG16_LE(x)
CCI_REG16(x)
CCI_REG24_LE(x)
CCI_REG24(x)
CCI_REG32_LE(x)
CCI_REG32(x)
CCI_REG64_LE(x)
CCI_REG64(x)

I would either keep the _LE variants at the bottom or below to their big-
endian counterpart. I prefer readability thus I would put the _LE at the=20
bottom, also it aligns nicely with the additional bit set.

Best regards,
Alexander

> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
>=20
> >  /**
> > =20
> >   * cci_read() - Read a value from a single CCI register


=2D-=20
TQ-Systems GmbH | M=FChlstra=DFe 2, Gut Delling | 82229 Seefeld, Germany
Amtsgericht M=FCnchen, HRB 105018
Gesch=E4ftsf=FChrer: Detlef Schneider, R=FCdiger Stahl, Stefan Schneider
http://www.tq-group.com/


