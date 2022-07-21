Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 17CDC57C9DF
	for <lists+linux-media@lfdr.de>; Thu, 21 Jul 2022 13:44:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232469AbiGULoB (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 21 Jul 2022 07:44:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54006 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230284AbiGULoA (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 21 Jul 2022 07:44:00 -0400
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 33E0181B1C
        for <linux-media@vger.kernel.org>; Thu, 21 Jul 2022 04:43:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1658403837; x=1689939837;
  h=subject:from:to:cc:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=+I6JntY4B70ceVGbfaXCSDq5w4ju0uguUHj2sWLpTyw=;
  b=mIGompHoYJ10UgbCF1tsNxR8Ixcj1FOwvtl3PZG9I4Ccxkh5vin6WgsC
   7MTzd4sgC1nBUJALNzgqx2QfRkjRyE4t8y5+Pf36Vw/kWXdJWXNtL0Bks
   GA469SAzZORmtdVJJ+UYVNBL81GD1pFNBB+WgHILfVJuUa08ZGkRiAZMR
   0Jwkuee/NY/WBgByJ74kJT/G5FQGAdnulDkEFpVXcbdbyajaBKbgfISS2
   SCQydKLBvg2yplVVYGQbdAOfQjPJuuwG+1K8OFERAo8DA/WBR3nSrIfvp
   Dbzq9TzFFwi+c8+Y6Ve0i140kK/JohM6sj/m6zOLQeyDt5t6mm8Vqd7Z/
   A==;
X-IronPort-AV: E=Sophos;i="5.92,289,1650924000"; 
   d="scan'208";a="25183829"
Received: from unknown (HELO tq-pgp-pr1.tq-net.de) ([192.168.6.15])
  by mx1-pgp.tq-group.com with ESMTP; 21 Jul 2022 13:43:55 +0200
Received: from mx1.tq-group.com ([192.168.6.7])
  by tq-pgp-pr1.tq-net.de (PGP Universal service);
  Thu, 21 Jul 2022 13:43:55 +0200
X-PGP-Universal: processed;
        by tq-pgp-pr1.tq-net.de on Thu, 21 Jul 2022 13:43:55 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1658403835; x=1689939835;
  h=from:to:cc:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding:subject;
  bh=+I6JntY4B70ceVGbfaXCSDq5w4ju0uguUHj2sWLpTyw=;
  b=R+pphxUDT0QkasjO6d6WAv8Td24R3Z/WSJmkAebCPXziIZK8GSEMM0ky
   uX9KOIWscU6L6hMjvTN2e4hnCPo+u5qTO1uM+Bcp1t5SOVaJZZqkNnzsk
   NO1ibBa+9HnYKjbHWIsdfpaGPHWGC3BFeipphrjVar72Ek3meqrE8jo3h
   /su37YW3GjcSMh5SNEqfjKSj9PSwuPE01LqRxhq+2rhc/lfTrcZVjQSXK
   gbrr7YUpWn13hOELc1y1ygfzGSa4O0IBKkF8YjJUNf4Ux7nIyEn29oVGY
   sq4M4XWNpn20bC2xe47trGZj3AArWtq+Nx+iuo5GWgYyWidMydM1nf+b6
   A==;
X-IronPort-AV: E=Sophos;i="5.92,289,1650924000"; 
   d="scan'208";a="25183828"
Subject: Re: Re: Re: [PATCH 07/19] media: i2c: imx290: Support variable-sized
 registers
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
  by mx1.tq-group.com with ESMTP; 21 Jul 2022 13:43:55 +0200
Received: from steina-w.localnet (unknown [10.123.49.12])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id 23BBA280056;
        Thu, 21 Jul 2022 13:43:55 +0200 (CEST)
From:   Alexander Stein <alexander.stein@ew.tq-group.com>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     linux-media@vger.kernel.org,
        Manivannan Sadhasivam <mani@kernel.org>,
        Sakari Ailus <sakari.ailus@iki.fi>
Date:   Thu, 21 Jul 2022 13:43:54 +0200
Message-ID: <8007753.G0QQBjFxQf@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <Ytk3nfwQ7eEQSTcV@pendragon.ideasonboard.com>
References: <20220721083540.1525-1-laurent.pinchart@ideasonboard.com> <6038880.cEBGB3zze1@steina-w> <Ytk3nfwQ7eEQSTcV@pendragon.ideasonboard.com>
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

Am Donnerstag, 21. Juli 2022, 13:25:17 CEST schrieb Laurent Pinchart:
> Hi Alexander,
>=20
> On Thu, Jul 21, 2022 at 01:18:29PM +0200, Alexander Stein wrote:
> > Am Donnerstag, 21. Juli 2022, 12:54:51 CEST schrieb Laurent Pinchart:
> > > On Thu, Jul 21, 2022 at 11:43:47AM +0200, Alexander Stein wrote:
> > > > Am Donnerstag, 21. Juli 2022, 10:35:28 CEST schrieb Laurent Pinchar=
t:
> > > > > The IMX290 has registers of different sizes. To simplify the code,
> > > > > handle this in the read/write functions instead of in the callers=
 by
> > > > > encoding the register size in the symbolic name macros. All
> > > > > registers
> > > > > are defined as 8-bit for now, a subsequent change will move to
> > > > > larger
> > > > > registers where applicable.
> > > > >=20
> > > > > Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.co=
m>
> > > > > ---
> > > > >=20
> > > > >  drivers/media/i2c/imx290.c | 352
> > > > >  +++++++++++++++++++------------------
> > > > >  1 file changed, 180 insertions(+), 172 deletions(-)
> > > > >=20
> > > > > diff --git a/drivers/media/i2c/imx290.c b/drivers/media/i2c/imx29=
0.c
> > > > > index 711282126c34..ac58bfe6db7f 100644
> > > > > --- a/drivers/media/i2c/imx290.c
> > > > > +++ b/drivers/media/i2c/imx290.c
> > > > > @@ -22,22 +22,28 @@
> > > > >=20
> > > > >  #include <media/v4l2-fwnode.h>
> > > > >  #include <media/v4l2-subdev.h>
> > > > >=20
> > > > > -#define IMX290_STANDBY 0x3000
> > > > > -#define IMX290_REGHOLD 0x3001
> > > > > -#define IMX290_XMSTA 0x3002
> > > > > -#define IMX290_FR_FDG_SEL 0x3009
> > > > > -#define IMX290_BLKLEVEL_LOW 0x300a
> > > > > -#define IMX290_BLKLEVEL_HIGH 0x300b
> > > > > -#define IMX290_GAIN 0x3014
> > > > > -#define IMX290_HMAX_LOW 0x301c
> > > > > -#define IMX290_HMAX_HIGH 0x301d
> > > > > -#define IMX290_PGCTRL 0x308c
> > > > > -#define IMX290_PHY_LANE_NUM 0x3407
> > > > > -#define IMX290_CSI_LANE_MODE 0x3443
> > > > > +#define IMX290_REG_8BIT(n)			=09
((1 << 16) |
> >=20
> > (n))
> >=20
> > > > > +#define IMX290_REG_16BIT(n)
> >=20
> > ((2 << 16) | (n))
> >=20
> > > > > +#define IMX290_REG_24BIT(n)
> >=20
> > ((3 << 16) | (n))
> >=20
> > > > IMX290_REG_SIZE_SHIFT instead of 16 here? Not exactly necessary, but
> > > > use
> > > > 1U, 2U and 3U instead.
> > >=20
> > > I'll fix that.
> > >=20
> > > > > +#define IMX290_REG_SIZE_SHIFT
> >=20
> > 16
> >=20
> > > > > +#define IMX290_REG_ADDR_MASK
> >=20
> > 0xffff
> >=20
> > > > > -#define IMX290_PGCTRL_REGEN BIT(0)
> > > > > -#define IMX290_PGCTRL_THRU BIT(1)
> > > > > -#define IMX290_PGCTRL_MODE(n) ((n) << 4)
> > > > > +#define IMX290_STANDBY
> >=20
> > IMX290_REG_8BIT(0x3000)
> >=20
> > > > > +#define IMX290_REGHOLD
> >=20
> > IMX290_REG_8BIT(0x3001)
> >=20
> > > > > +#define IMX290_XMSTA
> >=20
> > IMX290_REG_8BIT(0x3002)
> >=20
> > > > > +#define IMX290_FR_FDG_SEL
> >=20
> > IMX290_REG_8BIT(0x3009)
> >=20
> > > > > +#define IMX290_BLKLEVEL_LOW
> >=20
> > IMX290_REG_8BIT(0x300a)
> >=20
> > > > > +#define IMX290_BLKLEVEL_HIGH
> >=20
> > IMX290_REG_8BIT(0x300b)
> >=20
> > > > > +#define IMX290_GAIN
> >=20
> > IMX290_REG_8BIT(0x3014)
> >=20
> > > > > +#define IMX290_HMAX_LOW
> >=20
> > IMX290_REG_8BIT(0x301c)
> >=20
> > > > > +#define IMX290_HMAX_HIGH
> >=20
> > IMX290_REG_8BIT(0x301d)
> >=20
> > > > > +#define IMX290_PGCTRL
> >=20
> > IMX290_REG_8BIT(0x308c)
> >=20
> > > > > +#define IMX290_PHY_LANE_NUM
> >=20
> > IMX290_REG_8BIT(0x3407)
> >=20
> > > > > +#define IMX290_CSI_LANE_MODE
> >=20
> > IMX290_REG_8BIT(0x3443)
> >=20
> > > > > +
> > > > > +#define IMX290_PGCTRL_REGEN
> >=20
> > BIT(0)
> >=20
> > > > > +#define IMX290_PGCTRL_THRU			=09
BIT(1)
> > > > > +#define IMX290_PGCTRL_MODE(n)
> >=20
> > ((n) << 4)
> >=20
> > > > >  static const char * const imx290_supply_name[] =3D {
> > > > > =20
> > > > >  	"vdda",
> > > > >=20
> > > > > @@ -48,7 +54,7 @@ static const char * const imx290_supply_name[] =
=3D {
> > > > >=20
> > > > >  #define IMX290_NUM_SUPPLIES ARRAY_SIZE(imx290_supply_name)
> > > > > =20
> > > > >  struct imx290_regval {
> > > > >=20
> > > > > -	u16 reg;
> > > > > +	u32 reg;
> > > > >=20
> > > > >  	u8 val;
> > > > > =20
> > > > >  };
> > > > >=20
> > > > > @@ -111,163 +117,163 @@ static const char * const
> > > > > imx290_test_pattern_menu[] =3D { };
> > > > >=20
> > > > >  static const struct imx290_regval imx290_global_init_settings[] =
=3D {
> > > > >=20
> > > > > -	{ 0x3007, 0x00 },
> > > > > -	{ 0x3018, 0x65 },
> > > > > -	{ 0x3019, 0x04 },
> > > > > -	{ 0x301a, 0x00 },
> > > > > -	{ 0x3444, 0x20 },
> > > > > -	{ 0x3445, 0x25 },
> > > > > -	{ 0x303a, 0x0c },
> > > > > -	{ 0x3040, 0x00 },
> > > > > -	{ 0x3041, 0x00 },
> > > > > -	{ 0x303c, 0x00 },
> > > > > -	{ 0x303d, 0x00 },
> > > > > -	{ 0x3042, 0x9c },
> > > > > -	{ 0x3043, 0x07 },
> > > > > -	{ 0x303e, 0x49 },
> > > > > -	{ 0x303f, 0x04 },
> > > > > -	{ 0x304b, 0x0a },
> > > > > -	{ 0x300f, 0x00 },
> > > > > -	{ 0x3010, 0x21 },
> > > > > -	{ 0x3012, 0x64 },
> > > > > -	{ 0x3016, 0x09 },
> > > > > -	{ 0x3070, 0x02 },
> > > > > -	{ 0x3071, 0x11 },
> > > > > -	{ 0x309b, 0x10 },
> > > > > -	{ 0x309c, 0x22 },
> > > > > -	{ 0x30a2, 0x02 },
> > > > > -	{ 0x30a6, 0x20 },
> > > > > -	{ 0x30a8, 0x20 },
> > > > > -	{ 0x30aa, 0x20 },
> > > > > -	{ 0x30ac, 0x20 },
> > > > > -	{ 0x30b0, 0x43 },
> > > > > -	{ 0x3119, 0x9e },
> > > > > -	{ 0x311c, 0x1e },
> > > > > -	{ 0x311e, 0x08 },
> > > > > -	{ 0x3128, 0x05 },
> > > > > -	{ 0x313d, 0x83 },
> > > > > -	{ 0x3150, 0x03 },
> > > > > -	{ 0x317e, 0x00 },
> > > > > -	{ 0x32b8, 0x50 },
> > > > > -	{ 0x32b9, 0x10 },
> > > > > -	{ 0x32ba, 0x00 },
> > > > > -	{ 0x32bb, 0x04 },
> > > > > -	{ 0x32c8, 0x50 },
> > > > > -	{ 0x32c9, 0x10 },
> > > > > -	{ 0x32ca, 0x00 },
> > > > > -	{ 0x32cb, 0x04 },
> > > > > -	{ 0x332c, 0xd3 },
> > > > > -	{ 0x332d, 0x10 },
> > > > > -	{ 0x332e, 0x0d },
> > > > > -	{ 0x3358, 0x06 },
> > > > > -	{ 0x3359, 0xe1 },
> > > > > -	{ 0x335a, 0x11 },
> > > > > -	{ 0x3360, 0x1e },
> > > > > -	{ 0x3361, 0x61 },
> > > > > -	{ 0x3362, 0x10 },
> > > > > -	{ 0x33b0, 0x50 },
> > > > > -	{ 0x33b2, 0x1a },
> > > > > -	{ 0x33b3, 0x04 },
> > > > > +	{ IMX290_REG_8BIT(0x3007), 0x00 },
> > > > > +	{ IMX290_REG_8BIT(0x3018), 0x65 },
> > > > > +	{ IMX290_REG_8BIT(0x3019), 0x04 },
> > > > > +	{ IMX290_REG_8BIT(0x301a), 0x00 },
> > > > > +	{ IMX290_REG_8BIT(0x3444), 0x20 },
> > > > > +	{ IMX290_REG_8BIT(0x3445), 0x25 },
> > > > > +	{ IMX290_REG_8BIT(0x303a), 0x0c },
> > > > > +	{ IMX290_REG_8BIT(0x3040), 0x00 },
> > > > > +	{ IMX290_REG_8BIT(0x3041), 0x00 },
> > > > > +	{ IMX290_REG_8BIT(0x303c), 0x00 },
> > > > > +	{ IMX290_REG_8BIT(0x303d), 0x00 },
> > > > > +	{ IMX290_REG_8BIT(0x3042), 0x9c },
> > > > > +	{ IMX290_REG_8BIT(0x3043), 0x07 },
> > > > > +	{ IMX290_REG_8BIT(0x303e), 0x49 },
> > > > > +	{ IMX290_REG_8BIT(0x303f), 0x04 },
> > > > > +	{ IMX290_REG_8BIT(0x304b), 0x0a },
> > > > > +	{ IMX290_REG_8BIT(0x300f), 0x00 },
> > > > > +	{ IMX290_REG_8BIT(0x3010), 0x21 },
> > > > > +	{ IMX290_REG_8BIT(0x3012), 0x64 },
> > > > > +	{ IMX290_REG_8BIT(0x3016), 0x09 },
> > > > > +	{ IMX290_REG_8BIT(0x3070), 0x02 },
> > > > > +	{ IMX290_REG_8BIT(0x3071), 0x11 },
> > > > > +	{ IMX290_REG_8BIT(0x309b), 0x10 },
> > > > > +	{ IMX290_REG_8BIT(0x309c), 0x22 },
> > > > > +	{ IMX290_REG_8BIT(0x30a2), 0x02 },
> > > > > +	{ IMX290_REG_8BIT(0x30a6), 0x20 },
> > > > > +	{ IMX290_REG_8BIT(0x30a8), 0x20 },
> > > > > +	{ IMX290_REG_8BIT(0x30aa), 0x20 },
> > > > > +	{ IMX290_REG_8BIT(0x30ac), 0x20 },
> > > > > +	{ IMX290_REG_8BIT(0x30b0), 0x43 },
> > > > > +	{ IMX290_REG_8BIT(0x3119), 0x9e },
> > > > > +	{ IMX290_REG_8BIT(0x311c), 0x1e },
> > > > > +	{ IMX290_REG_8BIT(0x311e), 0x08 },
> > > > > +	{ IMX290_REG_8BIT(0x3128), 0x05 },
> > > > > +	{ IMX290_REG_8BIT(0x313d), 0x83 },
> > > > > +	{ IMX290_REG_8BIT(0x3150), 0x03 },
> > > > > +	{ IMX290_REG_8BIT(0x317e), 0x00 },
> > > > > +	{ IMX290_REG_8BIT(0x32b8), 0x50 },
> > > > > +	{ IMX290_REG_8BIT(0x32b9), 0x10 },
> > > > > +	{ IMX290_REG_8BIT(0x32ba), 0x00 },
> > > > > +	{ IMX290_REG_8BIT(0x32bb), 0x04 },
> > > > > +	{ IMX290_REG_8BIT(0x32c8), 0x50 },
> > > > > +	{ IMX290_REG_8BIT(0x32c9), 0x10 },
> > > > > +	{ IMX290_REG_8BIT(0x32ca), 0x00 },
> > > > > +	{ IMX290_REG_8BIT(0x32cb), 0x04 },
> > > > > +	{ IMX290_REG_8BIT(0x332c), 0xd3 },
> > > > > +	{ IMX290_REG_8BIT(0x332d), 0x10 },
> > > > > +	{ IMX290_REG_8BIT(0x332e), 0x0d },
> > > > > +	{ IMX290_REG_8BIT(0x3358), 0x06 },
> > > > > +	{ IMX290_REG_8BIT(0x3359), 0xe1 },
> > > > > +	{ IMX290_REG_8BIT(0x335a), 0x11 },
> > > > > +	{ IMX290_REG_8BIT(0x3360), 0x1e },
> > > > > +	{ IMX290_REG_8BIT(0x3361), 0x61 },
> > > > > +	{ IMX290_REG_8BIT(0x3362), 0x10 },
> > > > > +	{ IMX290_REG_8BIT(0x33b0), 0x50 },
> > > > > +	{ IMX290_REG_8BIT(0x33b2), 0x1a },
> > > > > +	{ IMX290_REG_8BIT(0x33b3), 0x04 },
> > > > >=20
> > > > >  };
> > > > > =20
> > > > >  static const struct imx290_regval imx290_1080p_settings[] =3D {
> > > > > =20
> > > > >  	/* mode settings */
> > > > >=20
> > > > > -	{ 0x3007, 0x00 },
> > > > > -	{ 0x303a, 0x0c },
> > > > > -	{ 0x3414, 0x0a },
> > > > > -	{ 0x3472, 0x80 },
> > > > > -	{ 0x3473, 0x07 },
> > > > > -	{ 0x3418, 0x38 },
> > > > > -	{ 0x3419, 0x04 },
> > > > > -	{ 0x3012, 0x64 },
> > > > > -	{ 0x3013, 0x00 },
> > > > > -	{ 0x305c, 0x18 },
> > > > > -	{ 0x305d, 0x03 },
> > > > > -	{ 0x305e, 0x20 },
> > > > > -	{ 0x305f, 0x01 },
> > > > > -	{ 0x315e, 0x1a },
> > > > > -	{ 0x3164, 0x1a },
> > > > > -	{ 0x3480, 0x49 },
> > > > > +	{ IMX290_REG_8BIT(0x3007), 0x00 },
> > > > > +	{ IMX290_REG_8BIT(0x303a), 0x0c },
> > > > > +	{ IMX290_REG_8BIT(0x3414), 0x0a },
> > > > > +	{ IMX290_REG_8BIT(0x3472), 0x80 },
> > > > > +	{ IMX290_REG_8BIT(0x3473), 0x07 },
> > > > > +	{ IMX290_REG_8BIT(0x3418), 0x38 },
> > > > > +	{ IMX290_REG_8BIT(0x3419), 0x04 },
> > > > > +	{ IMX290_REG_8BIT(0x3012), 0x64 },
> > > > > +	{ IMX290_REG_8BIT(0x3013), 0x00 },
> > > > > +	{ IMX290_REG_8BIT(0x305c), 0x18 },
> > > > > +	{ IMX290_REG_8BIT(0x305d), 0x03 },
> > > > > +	{ IMX290_REG_8BIT(0x305e), 0x20 },
> > > > > +	{ IMX290_REG_8BIT(0x305f), 0x01 },
> > > > > +	{ IMX290_REG_8BIT(0x315e), 0x1a },
> > > > > +	{ IMX290_REG_8BIT(0x3164), 0x1a },
> > > > > +	{ IMX290_REG_8BIT(0x3480), 0x49 },
> > > > >=20
> > > > >  	/* data rate settings */
> > > > >=20
> > > > > -	{ 0x3405, 0x10 },
> > > > > -	{ 0x3446, 0x57 },
> > > > > -	{ 0x3447, 0x00 },
> > > > > -	{ 0x3448, 0x37 },
> > > > > -	{ 0x3449, 0x00 },
> > > > > -	{ 0x344a, 0x1f },
> > > > > -	{ 0x344b, 0x00 },
> > > > > -	{ 0x344c, 0x1f },
> > > > > -	{ 0x344d, 0x00 },
> > > > > -	{ 0x344e, 0x1f },
> > > > > -	{ 0x344f, 0x00 },
> > > > > -	{ 0x3450, 0x77 },
> > > > > -	{ 0x3451, 0x00 },
> > > > > -	{ 0x3452, 0x1f },
> > > > > -	{ 0x3453, 0x00 },
> > > > > -	{ 0x3454, 0x17 },
> > > > > -	{ 0x3455, 0x00 },
> > > > > +	{ IMX290_REG_8BIT(0x3405), 0x10 },
> > > > > +	{ IMX290_REG_8BIT(0x3446), 0x57 },
> > > > > +	{ IMX290_REG_8BIT(0x3447), 0x00 },
> > > > > +	{ IMX290_REG_8BIT(0x3448), 0x37 },
> > > > > +	{ IMX290_REG_8BIT(0x3449), 0x00 },
> > > > > +	{ IMX290_REG_8BIT(0x344a), 0x1f },
> > > > > +	{ IMX290_REG_8BIT(0x344b), 0x00 },
> > > > > +	{ IMX290_REG_8BIT(0x344c), 0x1f },
> > > > > +	{ IMX290_REG_8BIT(0x344d), 0x00 },
> > > > > +	{ IMX290_REG_8BIT(0x344e), 0x1f },
> > > > > +	{ IMX290_REG_8BIT(0x344f), 0x00 },
> > > > > +	{ IMX290_REG_8BIT(0x3450), 0x77 },
> > > > > +	{ IMX290_REG_8BIT(0x3451), 0x00 },
> > > > > +	{ IMX290_REG_8BIT(0x3452), 0x1f },
> > > > > +	{ IMX290_REG_8BIT(0x3453), 0x00 },
> > > > > +	{ IMX290_REG_8BIT(0x3454), 0x17 },
> > > > > +	{ IMX290_REG_8BIT(0x3455), 0x00 },
> > > > >=20
> > > > >  };
> > > > > =20
> > > > >  static const struct imx290_regval imx290_720p_settings[] =3D {
> > > > > =20
> > > > >  	/* mode settings */
> > > > >=20
> > > > > -	{ 0x3007, 0x10 },
> > > > > -	{ 0x303a, 0x06 },
> > > > > -	{ 0x3414, 0x04 },
> > > > > -	{ 0x3472, 0x00 },
> > > > > -	{ 0x3473, 0x05 },
> > > > > -	{ 0x3418, 0xd0 },
> > > > > -	{ 0x3419, 0x02 },
> > > > > -	{ 0x3012, 0x64 },
> > > > > -	{ 0x3013, 0x00 },
> > > > > -	{ 0x305c, 0x20 },
> > > > > -	{ 0x305d, 0x00 },
> > > > > -	{ 0x305e, 0x20 },
> > > > > -	{ 0x305f, 0x01 },
> > > > > -	{ 0x315e, 0x1a },
> > > > > -	{ 0x3164, 0x1a },
> > > > > -	{ 0x3480, 0x49 },
> > > > > +	{ IMX290_REG_8BIT(0x3007), 0x10 },
> > > > > +	{ IMX290_REG_8BIT(0x303a), 0x06 },
> > > > > +	{ IMX290_REG_8BIT(0x3414), 0x04 },
> > > > > +	{ IMX290_REG_8BIT(0x3472), 0x00 },
> > > > > +	{ IMX290_REG_8BIT(0x3473), 0x05 },
> > > > > +	{ IMX290_REG_8BIT(0x3418), 0xd0 },
> > > > > +	{ IMX290_REG_8BIT(0x3419), 0x02 },
> > > > > +	{ IMX290_REG_8BIT(0x3012), 0x64 },
> > > > > +	{ IMX290_REG_8BIT(0x3013), 0x00 },
> > > > > +	{ IMX290_REG_8BIT(0x305c), 0x20 },
> > > > > +	{ IMX290_REG_8BIT(0x305d), 0x00 },
> > > > > +	{ IMX290_REG_8BIT(0x305e), 0x20 },
> > > > > +	{ IMX290_REG_8BIT(0x305f), 0x01 },
> > > > > +	{ IMX290_REG_8BIT(0x315e), 0x1a },
> > > > > +	{ IMX290_REG_8BIT(0x3164), 0x1a },
> > > > > +	{ IMX290_REG_8BIT(0x3480), 0x49 },
> > > > >=20
> > > > >  	/* data rate settings */
> > > > >=20
> > > > > -	{ 0x3405, 0x10 },
> > > > > -	{ 0x3446, 0x4f },
> > > > > -	{ 0x3447, 0x00 },
> > > > > -	{ 0x3448, 0x2f },
> > > > > -	{ 0x3449, 0x00 },
> > > > > -	{ 0x344a, 0x17 },
> > > > > -	{ 0x344b, 0x00 },
> > > > > -	{ 0x344c, 0x17 },
> > > > > -	{ 0x344d, 0x00 },
> > > > > -	{ 0x344e, 0x17 },
> > > > > -	{ 0x344f, 0x00 },
> > > > > -	{ 0x3450, 0x57 },
> > > > > -	{ 0x3451, 0x00 },
> > > > > -	{ 0x3452, 0x17 },
> > > > > -	{ 0x3453, 0x00 },
> > > > > -	{ 0x3454, 0x17 },
> > > > > -	{ 0x3455, 0x00 },
> > > > > +	{ IMX290_REG_8BIT(0x3405), 0x10 },
> > > > > +	{ IMX290_REG_8BIT(0x3446), 0x4f },
> > > > > +	{ IMX290_REG_8BIT(0x3447), 0x00 },
> > > > > +	{ IMX290_REG_8BIT(0x3448), 0x2f },
> > > > > +	{ IMX290_REG_8BIT(0x3449), 0x00 },
> > > > > +	{ IMX290_REG_8BIT(0x344a), 0x17 },
> > > > > +	{ IMX290_REG_8BIT(0x344b), 0x00 },
> > > > > +	{ IMX290_REG_8BIT(0x344c), 0x17 },
> > > > > +	{ IMX290_REG_8BIT(0x344d), 0x00 },
> > > > > +	{ IMX290_REG_8BIT(0x344e), 0x17 },
> > > > > +	{ IMX290_REG_8BIT(0x344f), 0x00 },
> > > > > +	{ IMX290_REG_8BIT(0x3450), 0x57 },
> > > > > +	{ IMX290_REG_8BIT(0x3451), 0x00 },
> > > > > +	{ IMX290_REG_8BIT(0x3452), 0x17 },
> > > > > +	{ IMX290_REG_8BIT(0x3453), 0x00 },
> > > > > +	{ IMX290_REG_8BIT(0x3454), 0x17 },
> > > > > +	{ IMX290_REG_8BIT(0x3455), 0x00 },
> > > > >=20
> > > > >  };
> > > > > =20
> > > > >  static const struct imx290_regval imx290_10bit_settings[] =3D {
> > > > >=20
> > > > > -	{ 0x3005, 0x00},
> > > > > -	{ 0x3046, 0x00},
> > > > > -	{ 0x3129, 0x1d},
> > > > > -	{ 0x317c, 0x12},
> > > > > -	{ 0x31ec, 0x37},
> > > > > -	{ 0x3441, 0x0a},
> > > > > -	{ 0x3442, 0x0a},
> > > > > -	{ 0x300a, 0x3c},
> > > > > -	{ 0x300b, 0x00},
> > > > > +	{ IMX290_REG_8BIT(0x3005), 0x00},
> > > > > +	{ IMX290_REG_8BIT(0x3046), 0x00},
> > > > > +	{ IMX290_REG_8BIT(0x3129), 0x1d},
> > > > > +	{ IMX290_REG_8BIT(0x317c), 0x12},
> > > > > +	{ IMX290_REG_8BIT(0x31ec), 0x37},
> > > > > +	{ IMX290_REG_8BIT(0x3441), 0x0a},
> > > > > +	{ IMX290_REG_8BIT(0x3442), 0x0a},
> > > > > +	{ IMX290_REG_8BIT(0x300a), 0x3c},
> > > > > +	{ IMX290_REG_8BIT(0x300b), 0x00},
> > > > >=20
> > > > >  };
> > > > > =20
> > > > >  static const struct imx290_regval imx290_12bit_settings[] =3D {
> > > > >=20
> > > > > -	{ 0x3005, 0x01 },
> > > > > -	{ 0x3046, 0x01 },
> > > > > -	{ 0x3129, 0x00 },
> > > > > -	{ 0x317c, 0x00 },
> > > > > -	{ 0x31ec, 0x0e },
> > > > > -	{ 0x3441, 0x0c },
> > > > > -	{ 0x3442, 0x0c },
> > > > > -	{ 0x300a, 0xf0 },
> > > > > -	{ 0x300b, 0x00 },
> > > > > +	{ IMX290_REG_8BIT(0x3005), 0x01 },
> > > > > +	{ IMX290_REG_8BIT(0x3046), 0x01 },
> > > > > +	{ IMX290_REG_8BIT(0x3129), 0x00 },
> > > > > +	{ IMX290_REG_8BIT(0x317c), 0x00 },
> > > > > +	{ IMX290_REG_8BIT(0x31ec), 0x0e },
> > > > > +	{ IMX290_REG_8BIT(0x3441), 0x0c },
> > > > > +	{ IMX290_REG_8BIT(0x3442), 0x0c },
> > > > > +	{ IMX290_REG_8BIT(0x300a), 0xf0 },
> > > > > +	{ IMX290_REG_8BIT(0x300b), 0x00 },
> > > > >=20
> > > > >  };
> > > > > =20
> > > > >  /* supported link frequencies */
> > > > >=20
> > > > > @@ -362,33 +368,35 @@ static inline struct imx290 *to_imx290(stru=
ct
> > > > > v4l2_subdev *_sd) return container_of(_sd, struct imx290, sd);
> > > > >=20
> > > > >  }
> > > > >=20
> > > > > -static inline int __always_unused imx290_read_reg(struct imx290
> > > > > *imx290, u16 addr, u8 *value) +static int __always_unused
> > > > > imx290_read_reg(struct imx290 *imx290, u32 addr, u32 *value) {
> > > > > -	unsigned int regval;
> > > > > +	u8 data[3] =3D { 0, 0, 0 };
> > > > >=20
> > > > >  	int ret;
> > > > >=20
> > > > > -	ret =3D regmap_read(imx290->regmap, addr, &regval);
> > > > > -	if (ret) {
> > > > > -		dev_err(imx290->dev, "Failed to read register=20
0x%04x: %d\n",
> > > > > -			addr, ret);
> > > > > +	ret =3D regmap_raw_read(imx290->regmap, addr &=20
IMX290_REG_ADDR_MASK,
> > > > > +			      data, (addr >>=20
IMX290_REG_SIZE_SHIFT) & 3);
> > > >=20
> > > > While I agree with the intention, it fails for some devices, e.g.
> > > > Vision
> > > > Components MIPI=E2=80=AFIMX327=E2=80=AFC does not support auto-incr=
ement and most
> > > > probably
> > > > also valid for the IMX290 model.
> > > > This is similar to the OV9281 variant, see [1].
> > >=20
> > > *sigh* Can't they get their firmware right ? :-( Inserting a
> > > microcontroller between the SoC and sensor is bad enough in itself,
> > > making it mess up I2C access due to firmware bugs is worse.
> >=20
> > [1] indicates this is due to NDA compliance.
>=20
> I don't buy that, sorry. That's not the reason, and even if it were, it
> wouldn't excuse breaking auto-increment on read.

I expect other (valid) sensor registers can't be read as well. And to preve=
nt=20
circumventing that by using auto-increment, it is blocked completely.
It's hassle I agree.

> > > How far do we need to go in sensor drivers to support messed up hardw=
are
> > > designs that are not related to the sensor at all ? I don't want to
> > > patch all sensor drivers to make I2C read slower because someone
> > > somewhere has taken the sensor and decided to screw up. That doesn't
> > > scale, and hurt all users of these sensors in sane camera modules.
> >=20
> > A somewhat acceptable solution might be to add a property indicating th=
at
> > auto-increment is not supported, so that each byte has to be fetched
> > individually.
>=20
> I would be fine with that. It should then be handled in the I2C core or
> regmap layer.

Nice the following snippet does the trick already:
=2D--8<---
=2D-- a/drivers/media/i2c/imx290.c
+++ b/drivers/media/i2c/imx290.c
@@ -221,6 +221,7 @@ static const struct imx290_pixfmt imx290_formats[] =3D {
 static const struct regmap_config imx290_regmap_config =3D {
        .reg_bits =3D 16,
        .val_bits =3D 8,
+       .use_single_read =3D true,
 };
=20
 static const char * const imx290_test_pattern_menu[] =3D {
=2D--8<---

As this affects the VC OV9281 as well, any suggestions for a common propert=
y?

Best regards,
Alexander

> > [1] https://github.com/raspberrypi/linux/commit/
> > 58deee7c917e1c3c5e37987c3a89ad19d791f58a
> >=20
> > > > Reading ID using 16bit register (using later patch) returns:
> > > > > imx290 2-001a: chip ID 0xffd0
> > > >=20
> > > > Using 2 8bit reads:
> > > > imx290 2-001a: chip ID 0x07d0
> > > >=20
> > > > Best regards,
> > > > Alexander
> > > >=20
> > > > [1]
> > > > https://patchwork.kernel.org/project/linux-media/patch/202207150748=
58.
> > > > 875
> > > > 808-7-alexander.stein@ew.tq-group.com/>
> > > >=20
> > > > > +	if (ret < 0) {
> > > > > +		dev_err(imx290->dev, "%u-bit read from 0x%04x=20
failed: %d\n",
> > > > > +			 ((addr >> IMX290_REG_SIZE_SHIFT)=20
& 3) * 8,
> > > > > +			 addr & IMX290_REG_ADDR_MASK,=20
ret);
> > > > >=20
> > > > >  		return ret;
> > > > >  =09
> > > > >  	}
> > > > >=20
> > > > > -	*value =3D regval & 0xff;
> > > > > -
> > > > > +	*value =3D (data[2] << 16) | (data[1] << 8) | data[0];
> > > > >=20
> > > > >  	return 0;
> > > > > =20
> > > > >  }
> > > > >=20
> > > > > -static int imx290_write_reg(struct imx290 *imx290, u16 addr, u8
> > > > > value)
> > > > > +static int imx290_write_reg(struct imx290 *imx290, u32 addr, u32
> > > > > value)
> > > > >=20
> > > > >  {
> > > > >=20
> > > > > +	u8 data[3] =3D { value & 0xff, (value >> 8) & 0xff, value=20
>> 16 };
> > > > >=20
> > > > >  	int ret;
> > > > >=20
> > > > > -	ret =3D regmap_write(imx290->regmap, addr, value);
> > > > > -	if (ret) {
> > > > > -		dev_err(imx290->dev, "Failed to write=20
register 0x%04x: %d\n",
> > > > > -			addr, ret);
> > > > > -		return ret;
> > > > > -	}
> > > > > +	ret =3D regmap_raw_write(imx290->regmap, addr &
> > > > > IMX290_REG_ADDR_MASK,
> > > > > +			       data, (addr >>=20
IMX290_REG_SIZE_SHIFT) & 3);
> > > > > +	if (ret < 0)
> > > > > +		dev_err(imx290->dev, "%u-bit write to 0x%04x=20
failed: %d\n",
> > > > > +			 ((addr >> IMX290_REG_SIZE_SHIFT)=20
& 3) * 8,
> > > > > +			 addr & IMX290_REG_ADDR_MASK,=20
ret);
> > > > >=20
> > > > >  	return ret;
> > > > > =20
> > > > >  }




