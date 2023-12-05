Return-Path: <linux-media+bounces-1655-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B492E8051BC
	for <lists+linux-media@lfdr.de>; Tue,  5 Dec 2023 12:13:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id EA359B20C4F
	for <lists+linux-media@lfdr.de>; Tue,  5 Dec 2023 11:13:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BB20055C23;
	Tue,  5 Dec 2023 11:13:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b="PaaPWGXw"
X-Original-To: linux-media@vger.kernel.org
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D3DFC116
	for <linux-media@vger.kernel.org>; Tue,  5 Dec 2023 03:12:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1701774780; x=1733310780;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=z9cLPYAzn8E8qQS2feEwp3gO6vg5mADVtCN1oSE9ZGM=;
  b=PaaPWGXw93PeQ/+oFtFzTe9xlgcswFd1ZRwYyJFQjAfzbzGzw8/ni6d5
   S7X0IyYSh0LtD9h8tf3d36YcqK90hN62xwQFF5waM8QQlGU2hmMkDwL+E
   iSS3zoNdQp0ly12PDap5vCz9O4ewcvU6gBcvfSK7+PItShi697Dm7maqB
   ojU6W3QCmpUybY2jN1nmVQIxfhiBgXm7zSaYr8gRaLeJohWWO7XhO+Bim
   H/lkB8FITrl2ICgwL0wHzADq3UEgYvnv9WYR9JTu3CQ8Sgmo+9B9QATd0
   KJrYSTy4IXb3itHhqO9HllcOMKcfSayORccb6Ep444IrLLpBfD66Xvuqd
   A==;
X-IronPort-AV: E=Sophos;i="6.04,252,1695679200"; 
   d="scan'208";a="34333587"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
  by mx1.tq-group.com with ESMTP; 05 Dec 2023 12:12:58 +0100
Received: from steina-w.localnet (steina-w.tq-net.de [10.123.53.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id DF820280075;
	Tue,  5 Dec 2023 12:12:57 +0100 (CET)
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Michael Riesch <michael.riesch@wolfvision.net>, Sakari Ailus <sakari.ailus@linux.intel.com>, Gerald Loacker <gerald.loacker@wolfvision.net>, linux-media@vger.kernel.org
Subject: Re: [PATCH 3/3] media: i2c: imx415: Add more supported modes
Date: Tue, 05 Dec 2023 12:12:57 +0100
Message-ID: <12337827.O9o76ZdvQC@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <20231205104509.GB17394@pendragon.ideasonboard.com>
References: <20231205090557.298680-1-alexander.stein@ew.tq-group.com> <20231205090557.298680-4-alexander.stein@ew.tq-group.com> <20231205104509.GB17394@pendragon.ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"

Hi Laurent,

Am Dienstag, 5. Dezember 2023, 11:45:09 CET schrieb Laurent Pinchart:
> Hi Alexander,
>=20
> Thank you for the patch.
>=20
> On Tue, Dec 05, 2023 at 10:05:57AM +0100, Alexander Stein wrote:
> > These modes are listed in section "All-pixel mode" of the datasheet
> > IMX415-AAQR-C (Rev. E19504, 2019/05/21).
> > hmax_pix and pixel_rate are taken from the comment above the mode list.
> >=20
> > Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
> > ---
> >=20
> >  drivers/media/i2c/imx415.c | 362 +++++++++++++++++++++++++++++++++++++
> >  1 file changed, 362 insertions(+)
> >=20
> > diff --git a/drivers/media/i2c/imx415.c b/drivers/media/i2c/imx415.c
> > index a222b9134aa2..48b8ae6d790d 100644
> > --- a/drivers/media/i2c/imx415.c
> > +++ b/drivers/media/i2c/imx415.c
> > @@ -445,6 +445,38 @@ static const struct imx415_clk_params
> > imx415_clk_params[] =3D {>=20
> >  	},
> > =20
> >  };
> >=20
> > +/* all-pixel 2-lane 594 Mbps 10 Hz mode */
> > +static const struct cci_reg_sequence imx415_mode_2_594[] =3D {
> > +	{ IMX415_VMAX, 0x08CA },
> > +	{ IMX415_HMAX, 0x0CE4 },
> > +	{ IMX415_LANEMODE, IMX415_LANEMODE_2 },
> > +	{ IMX415_TCLKPOST, 0x0067 },
> > +	{ IMX415_TCLKPREPARE, 0x0027 },
> > +	{ IMX415_TCLKTRAIL, 0x0027 },
> > +	{ IMX415_TCLKZERO, 0x00B7 },
> > +	{ IMX415_THSPREPARE, 0x002F },
> > +	{ IMX415_THSZERO, 0x004F },
> > +	{ IMX415_THSTRAIL, 0x002F },
> > +	{ IMX415_THSEXIT, 0x0047 },
> > +	{ IMX415_TLPX, 0x0027 },
> > +};
> > +
> > +/* all-pixel 2-lane 891 Mbps 15 Hz mode */
> > +static const struct cci_reg_sequence imx415_mode_2_891[] =3D {
> > +	{ IMX415_VMAX, 0x08CA },
> > +	{ IMX415_HMAX, 0x0898 },
> > +	{ IMX415_LANEMODE, IMX415_LANEMODE_2 },
> > +	{ IMX415_TCLKPOST, 0x007F },
> > +	{ IMX415_TCLKPREPARE, 0x0037 },
> > +	{ IMX415_TCLKTRAIL, 0x0037 },
> > +	{ IMX415_TCLKZERO, 0x00F7 },
> > +	{ IMX415_THSPREPARE, 0x003F },
> > +	{ IMX415_THSZERO, 0x006F },
> > +	{ IMX415_THSTRAIL, 0x003F },
> > +	{ IMX415_THSEXIT, 0x005F },
> > +	{ IMX415_TLPX, 0x002F },
> > +};
> > +
> >=20
> >  /* all-pixel 2-lane 720 Mbps 15.74 Hz mode */
> >  static const struct cci_reg_sequence imx415_mode_2_720[] =3D {
> > =20
> >  	{ IMX415_VMAX, 0x08CA },
> >=20
> > @@ -461,6 +493,38 @@ static const struct cci_reg_sequence
> > imx415_mode_2_720[] =3D {>=20
> >  	{ IMX415_TLPX, 0x0027 },
> > =20
> >  };
> >=20
> > +/* all-pixel 2-lane 1782 Mbps 30 Hz mode */
> > +static const struct cci_reg_sequence imx415_mode_2_1782[] =3D {
> > +	{ IMX415_VMAX, 0x08CA },
> > +	{ IMX415_HMAX, 0x044C },
> > +	{ IMX415_LANEMODE, IMX415_LANEMODE_2 },
> > +	{ IMX415_TCLKPOST, 0x00B7 },
> > +	{ IMX415_TCLKPREPARE, 0x0067 },
> > +	{ IMX415_TCLKTRAIL, 0x006F },
> > +	{ IMX415_TCLKZERO, 0x01DF },
> > +	{ IMX415_THSPREPARE, 0x006F },
> > +	{ IMX415_THSZERO, 0x00CF },
> > +	{ IMX415_THSTRAIL, 0x006F },
> > +	{ IMX415_THSEXIT, 0x00B7 },
> > +	{ IMX415_TLPX, 0x005F },
> > +};
> > +
> > +/* all-pixel 2-lane 2079 Mbps 30 Hz mode */
> > +static const struct cci_reg_sequence imx415_mode_2_2079[] =3D {
> > +	{ IMX415_VMAX, 0x08CA },
> > +	{ IMX415_HMAX, 0x044C },
> > +	{ IMX415_LANEMODE, IMX415_LANEMODE_2 },
> > +	{ IMX415_TCLKPOST, 0x00D7 },
> > +	{ IMX415_TCLKPREPARE, 0x007F },
> > +	{ IMX415_TCLKTRAIL, 0x007F },
> > +	{ IMX415_TCLKZERO, 0x0237 },
> > +	{ IMX415_THSPREPARE, 0x0087 },
> > +	{ IMX415_THSZERO, 0x00EF },
> > +	{ IMX415_THSTRAIL, 0x0087 },
> > +	{ IMX415_THSEXIT, 0x00DF },
> > +	{ IMX415_TLPX, 0x006F },
> > +};
> > +
> >=20
> >  /* all-pixel 2-lane 1440 Mbps 30.01 Hz mode */
> >  static const struct cci_reg_sequence imx415_mode_2_1440[] =3D {
> > =20
> >  	{ IMX415_VMAX, 0x08CA },
> >=20
> > @@ -477,6 +541,70 @@ static const struct cci_reg_sequence
> > imx415_mode_2_1440[] =3D {>=20
> >  	{ IMX415_TLPX, 0x004F },
> > =20
> >  };
> >=20
> > +/* all-pixel 4-lane 594 Mbps 20 Hz mode */
> > +static const struct cci_reg_sequence imx415_mode_4_594_20fps[] =3D {
> > +	{ IMX415_VMAX, 0x08CA },
> > +	{ IMX415_HMAX, 0x0672 },
> > +	{ IMX415_LANEMODE, IMX415_LANEMODE_4 },
> > +	{ IMX415_TCLKPOST, 0x0067 },
> > +	{ IMX415_TCLKPREPARE, 0x0027 },
> > +	{ IMX415_TCLKTRAIL, 0x0027 },
> > +	{ IMX415_TCLKZERO, 0x00B7 },
> > +	{ IMX415_THSPREPARE, 0x002F },
> > +	{ IMX415_THSZERO, 0x004F },
> > +	{ IMX415_THSTRAIL, 0x002F },
> > +	{ IMX415_THSEXIT, 0x0047 },
> > +	{ IMX415_TLPX, 0x0027 },
> > +};
> > +
> > +/* all-pixel 4-lane 594 Mbps 25 Hz mode */
> > +static const struct cci_reg_sequence imx415_mode_4_594_25fps[] =3D {
> > +	{ IMX415_VMAX, 0x08CA },
> > +	{ IMX415_HMAX, 0x0528 },
> > +	{ IMX415_LANEMODE, IMX415_LANEMODE_4 },
> > +	{ IMX415_TCLKPOST, 0x0067 },
> > +	{ IMX415_TCLKPREPARE, 0x0027 },
> > +	{ IMX415_TCLKTRAIL, 0x0027 },
> > +	{ IMX415_TCLKZERO, 0x00B7 },
> > +	{ IMX415_THSPREPARE, 0x002F },
> > +	{ IMX415_THSZERO, 0x004F },
> > +	{ IMX415_THSTRAIL, 0x002F },
> > +	{ IMX415_THSEXIT, 0x0047 },
> > +	{ IMX415_TLPX, 0x0027 },
> > +};
> > +
> > +/* all-pixel 4-lane 720 Mbps 25 Hz mode */
> > +static const struct cci_reg_sequence imx415_mode_4_720_25fps[] =3D {
> > +	{ IMX415_VMAX, 0x08CA },
> > +	{ IMX415_HMAX, 0x0500 },
> > +	{ IMX415_LANEMODE, IMX415_LANEMODE_4 },
> > +	{ IMX415_TCLKPOST, 0x006F },
> > +	{ IMX415_TCLKPREPARE, 0x002F },
> > +	{ IMX415_TCLKTRAIL, 0x002F },
> > +	{ IMX415_TCLKZERO, 0x00BF },
> > +	{ IMX415_THSPREPARE, 0x002F },
> > +	{ IMX415_THSZERO, 0x0057 },
> > +	{ IMX415_THSTRAIL, 0x002F },
> > +	{ IMX415_THSEXIT, 0x004F },
> > +	{ IMX415_TLPX, 0x0027 },
> > +};
> > +
> > +/* all-pixel 4-lane 720 Mbps 30.01 Hz mode */
> > +static const struct cci_reg_sequence imx415_mode_4_720_30fps[] =3D {
> > +	{ IMX415_VMAX, 0x08CA },
> > +	{ IMX415_HMAX, 0x042A },
> > +	{ IMX415_LANEMODE, IMX415_LANEMODE_4 },
> > +	{ IMX415_TCLKPOST, 0x006F },
> > +	{ IMX415_TCLKPREPARE, 0x002F },
> > +	{ IMX415_TCLKTRAIL, 0x002F },
> > +	{ IMX415_TCLKZERO, 0x00BF },
> > +	{ IMX415_THSPREPARE, 0x002F },
> > +	{ IMX415_THSZERO, 0x0057 },
> > +	{ IMX415_THSTRAIL, 0x002F },
> > +	{ IMX415_THSEXIT, 0x004F },
> > +	{ IMX415_TLPX, 0x0027 },
> > +};
> > +
> >=20
> >  /* all-pixel 4-lane 891 Mbps 30 Hz mode */
> >  static const struct cci_reg_sequence imx415_mode_4_891[] =3D {
> > =20
> >  	{ IMX415_VMAX, 0x08CA },
> >=20
> > @@ -493,6 +621,102 @@ static const struct cci_reg_sequence
> > imx415_mode_4_891[] =3D {>=20
> >  	{ IMX415_TLPX, 0x002F },
> > =20
> >  };
> >=20
> > +/* all-pixel 4-lane 1440 Mbps 30.01 Hz mode */
> > +static const struct cci_reg_sequence imx415_mode_4_1440_30fps[] =3D {
> > +	{ IMX415_VMAX, 0x08CA },
> > +	{ IMX415_HMAX, 0x042A },
> > +	{ IMX415_LANEMODE, IMX415_LANEMODE_4 },
> > +	{ IMX415_TCLKPOST, 0x009F },
> > +	{ IMX415_TCLKPREPARE, 0x0057 },
> > +	{ IMX415_TCLKTRAIL, 0x0057 },
> > +	{ IMX415_TCLKZERO, 0x0187 },
> > +	{ IMX415_THSPREPARE, 0x005F },
> > +	{ IMX415_THSZERO, 0x00A7 },
> > +	{ IMX415_THSTRAIL, 0x005F },
> > +	{ IMX415_THSEXIT, 0x0097 },
> > +	{ IMX415_TLPX, 0x004F },
> > +};
> > +
> > +/* all-pixel 4-lane 1440 Mbps 60.03 Hz mode */
> > +static const struct cci_reg_sequence imx415_mode_4_1440_60fps[] =3D {
> > +	{ IMX415_VMAX, 0x08CA },
> > +	{ IMX415_HMAX, 0x0215 },
> > +	{ IMX415_LANEMODE, IMX415_LANEMODE_4 },
> > +	{ IMX415_TCLKPOST, 0x009F },
> > +	{ IMX415_TCLKPREPARE, 0x0057 },
> > +	{ IMX415_TCLKTRAIL, 0x0057 },
> > +	{ IMX415_TCLKZERO, 0x0187 },
> > +	{ IMX415_THSPREPARE, 0x005F },
> > +	{ IMX415_THSZERO, 0x00A7 },
> > +	{ IMX415_THSTRAIL, 0x005F },
> > +	{ IMX415_THSEXIT, 0x0097 },
> > +	{ IMX415_TLPX, 0x004F },
> > +};
> > +
> > +/* all-pixel 4-lane 1485 Mbps 60 Hz mode */
> > +static const struct cci_reg_sequence imx415_mode_4_1485[] =3D {
> > +	{ IMX415_VMAX, 0x08CA },
> > +	{ IMX415_HMAX, 0x0226 },
> > +	{ IMX415_LANEMODE, IMX415_LANEMODE_4 },
> > +	{ IMX415_TCLKPOST, 0x00A7 },
> > +	{ IMX415_TCLKPREPARE, 0x0057 },
> > +	{ IMX415_TCLKTRAIL, 0x005F },
> > +	{ IMX415_TCLKZERO, 0x0197 },
> > +	{ IMX415_THSPREPARE, 0x005F },
> > +	{ IMX415_THSZERO, 0x00AF },
> > +	{ IMX415_THSTRAIL, 0x005F },
> > +	{ IMX415_THSEXIT, 0x009F },
> > +	{ IMX415_TLPX, 0x004F },
> > +};
> > +
> > +/* all-pixel 4-lane 1782 Mbps 60 Hz mode */
> > +static const struct cci_reg_sequence imx415_mode_4_1782[] =3D {
> > +	{ IMX415_VMAX, 0x08CA },
> > +	{ IMX415_HMAX, 0x0226 },
> > +	{ IMX415_LANEMODE, IMX415_LANEMODE_4 },
> > +	{ IMX415_TCLKPOST, 0x00B7 },
> > +	{ IMX415_TCLKPREPARE, 0x0067 },
> > +	{ IMX415_TCLKTRAIL, 0x006F },
> > +	{ IMX415_TCLKZERO, 0x01DF },
> > +	{ IMX415_THSPREPARE, 0x006F },
> > +	{ IMX415_THSZERO, 0x00CF },
> > +	{ IMX415_THSTRAIL, 0x006F },
> > +	{ IMX415_THSEXIT, 0x00B7 },
> > +	{ IMX415_TLPX, 0x005F },
> > +};
> > +
> > +/* all-pixel 4-lane 2079 Mbps 60 Hz mode */
> > +static const struct cci_reg_sequence imx415_mode_4_2079[] =3D {
> > +	{ IMX415_VMAX, 0x08CA },
> > +	{ IMX415_HMAX, 0x0226 },
> > +	{ IMX415_LANEMODE, IMX415_LANEMODE_4 },
> > +	{ IMX415_TCLKPOST, 0x00D7 },
> > +	{ IMX415_TCLKPREPARE, 0x007F },
> > +	{ IMX415_TCLKTRAIL, 0x007F },
> > +	{ IMX415_TCLKZERO, 0x0237 },
> > +	{ IMX415_THSPREPARE, 0x0087 },
> > +	{ IMX415_THSZERO, 0x00EF },
> > +	{ IMX415_THSTRAIL, 0x0087 },
> > +	{ IMX415_THSEXIT, 0x00DF },
> > +	{ IMX415_TLPX, 0x006F },
> > +};
> > +
> > +/* all-pixel 4-lane 2376 Mbps 60 Hz mode */
> > +static const struct cci_reg_sequence imx415_mode_4_2376[] =3D {
> > +	{ IMX415_VMAX, 0x08CA },
> > +	{ IMX415_HMAX, 0x016E },
> > +	{ IMX415_LANEMODE, IMX415_LANEMODE_4 },
> > +	{ IMX415_TCLKPOST, 0x00E7 },
> > +	{ IMX415_TCLKPREPARE, 0x008F },
> > +	{ IMX415_TCLKTRAIL, 0x008F },
> > +	{ IMX415_TCLKZERO, 0x027F },
> > +	{ IMX415_THSPREPARE, 0x0097 },
> > +	{ IMX415_THSZERO, 0x010F },
> > +	{ IMX415_THSTRAIL, 0x0097 },
> > +	{ IMX415_THSEXIT, 0x00F7 },
> > +	{ IMX415_TLPX, 0x007F },
> > +};
> > +
> >=20
> >  struct imx415_mode_reg_list {
> > =20
> >  	u32 num_of_regs;
> >  	const struct cci_reg_sequence *regs;
> >=20
> > @@ -536,6 +760,26 @@ struct imx415_mode {
> >=20
> >  /* mode configs */
> >  static const struct imx415_mode supported_modes[] =3D {
> >=20
> > +	{
> > +		.lane_rate =3D 594000000,
> > +		.lanes =3D 2,
> > +		.hmax_pix =3D 4400,
> > +		.pixel_rate =3D 99000000,
> > +		.reg_list =3D {
> > +			.num_of_regs =3D ARRAY_SIZE(imx415_mode_2_594),
> > +			.regs =3D imx415_mode_2_594,
> > +		},
> > +	},
> > +	{
> > +		.lane_rate =3D 891000000,
> > +		.lanes =3D 2,
> > +		.hmax_pix =3D 4400,
> > +		.pixel_rate =3D 148500000,
> > +		.reg_list =3D {
> > +			.num_of_regs =3D ARRAY_SIZE(imx415_mode_2_891),
> > +			.regs =3D imx415_mode_2_891,
> > +		},
> > +	},
> >=20
> >  	{
> >  =09
> >  		.lane_rate =3D 720000000,
> >  		.lanes =3D 2,
> >=20
> > @@ -547,6 +791,24 @@ static const struct imx415_mode supported_modes[] =
=3D {
> >=20
> >  		},
> >  =09
> >  	},
> >  	{
> >=20
> > +		.lane_rate =3D 1782000000,
> > +		.lanes =3D 2,
> > +		.hmax_pix =3D 4400,
> > +		.pixel_rate =3D 297000000,
> > +		.reg_list =3D {
> > +			.num_of_regs =3D ARRAY_SIZE(imx415_mode_2_1782),
> > +			.regs =3D imx415_mode_2_1782,
> > +		},
> > +	},	{
> > +		.lane_rate =3D 2079000000,
> > +		.lanes =3D 2,
> > +		.hmax_pix =3D 4400,
> > +		.pixel_rate =3D 304615385,
> > +		.reg_list =3D {
> > +			.num_of_regs =3D ARRAY_SIZE(imx415_mode_2_2079),
> > +			.regs =3D imx415_mode_2_2079,
> > +		},
> > +	},	{
> >=20
> >  		.lane_rate =3D 1440000000,
> >  		.lanes =3D 2,
> >  		.hmax_pix =3D 4510,
> >=20
> > @@ -556,6 +818,46 @@ static const struct imx415_mode supported_modes[] =
=3D {
> >=20
> >  			.regs =3D imx415_mode_2_1440,
> >  	=09
> >  		},
> >  =09
> >  	},
> >=20
> > +	{
> > +		.lane_rate =3D 594000000,
> > +		.lanes =3D 4,
> > +		.hmax_pix =3D 5500,
> > +		.pixel_rate =3D 247500000,
> > +		.reg_list =3D {
> > +			.num_of_regs =3D=20
ARRAY_SIZE(imx415_mode_4_594_20fps),
> > +			.regs =3D imx415_mode_4_594_20fps,
> > +		},
> > +	},
> > +	{
> > +		.lane_rate =3D 594000000,
> > +		.lanes =3D 4,
>=20
> The mode is selected from the number of data lanes and the lane rate.
> They're the same as the previous entry, so this entry will never be
> selected. Same below.

I noticed that as well. The datasheet lists different FPS for the same link=
=20
frequency / lane combination, only HMAX being different. Right now HMAX/VMA=
X=20
is fixed, so is FPS.
I am aware there is no way to select between these modes, but I added them =
for=20
completeness.

Best regards
Alexander

>=20
> > +		.hmax_pix =3D 4400,
> > +		.pixel_rate =3D 247500000,
> > +		.reg_list =3D {
> > +			.num_of_regs =3D=20
ARRAY_SIZE(imx415_mode_4_594_25fps),
> > +			.regs =3D imx415_mode_4_594_25fps,
> > +		},
> > +	},
> > +	{
> > +		.lane_rate =3D 720000000,
> > +		.lanes =3D 4,
> > +		.hmax_pix =3D 4400,
> > +		.pixel_rate =3D 247500000,
> > +		.reg_list =3D {
> > +			.num_of_regs =3D=20
ARRAY_SIZE(imx415_mode_4_720_25fps),
> > +			.regs =3D imx415_mode_4_720_25fps,
> > +		},
> > +	},
> > +	{
> > +		.lane_rate =3D 720000000,
> > +		.lanes =3D 4,
> > +		.hmax_pix =3D 4510,
> > +		.pixel_rate =3D 304615385,
> > +		.reg_list =3D {
> > +			.num_of_regs =3D=20
ARRAY_SIZE(imx415_mode_4_720_30fps),
> > +			.regs =3D imx415_mode_4_720_30fps,
> > +		},
> > +	},
> >=20
> >  	{
> >  =09
> >  		.lane_rate =3D 891000000,
> >  		.lanes =3D 4,
> >=20
> > @@ -566,6 +868,66 @@ static const struct imx415_mode supported_modes[] =
=3D {
> >=20
> >  			.regs =3D imx415_mode_4_891,
> >  	=09
> >  		},
> >  =09
> >  	},
> >=20
> > +	{
> > +		.lane_rate =3D 1440000000,
> > +		.lanes =3D 4,
> > +		.hmax_pix =3D 4510,
> > +		.pixel_rate =3D 304615385,
> > +		.reg_list =3D {
> > +			.num_of_regs =3D=20
ARRAY_SIZE(imx415_mode_4_1440_30fps),
> > +			.regs =3D imx415_mode_4_1440_30fps,
> > +		},
> > +	},
> > +	{
> > +		.lane_rate =3D 1440000000,
> > +		.lanes =3D 4,
> > +		.hmax_pix =3D 4510,
> > +		.pixel_rate =3D 609230769,
> > +		.reg_list =3D {
> > +			.num_of_regs =3D=20
ARRAY_SIZE(imx415_mode_4_1440_60fps),
> > +			.regs =3D imx415_mode_4_1440_60fps,
> > +		},
> > +	},
> > +	{
> > +		.lane_rate =3D 1485000000,
> > +		.lanes =3D 4,
> > +		.hmax_pix =3D 4400,
> > +		.pixel_rate =3D 594000000,
> > +		.reg_list =3D {
> > +			.num_of_regs =3D ARRAY_SIZE(imx415_mode_4_1485),
> > +			.regs =3D imx415_mode_4_1485,
> > +		},
> > +	},
> > +	{
> > +		.lane_rate =3D 1782000000,
> > +		.lanes =3D 4,
> > +		.hmax_pix =3D 4400,
> > +		.pixel_rate =3D 594000000,
> > +		.reg_list =3D {
> > +			.num_of_regs =3D ARRAY_SIZE(imx415_mode_4_1782),
> > +			.regs =3D imx415_mode_4_1782,
> > +		},
> > +	},
> > +	{
> > +		.lane_rate =3D 2079000000,
> > +		.lanes =3D 4,
> > +		.hmax_pix =3D 4400,
> > +		.pixel_rate =3D 594000000,
> > +		.reg_list =3D {
> > +			.num_of_regs =3D ARRAY_SIZE(imx415_mode_4_2079),
> > +			.regs =3D imx415_mode_4_2079,
> > +		},
> > +	},
> > +	{
> > +		.lane_rate =3D 12376000000,
> > +		.lanes =3D 4,
> > +		.hmax_pix =3D 4392,
> > +		.pixel_rate =3D 891000000,
> > +		.reg_list =3D {
> > +			.num_of_regs =3D ARRAY_SIZE(imx415_mode_4_2376),
> > +			.regs =3D imx415_mode_4_2376,
> > +		},
> > +	},
> >=20
> >  };
> > =20
> >  static const char *const imx415_test_pattern_menu[] =3D {


=2D-=20
TQ-Systems GmbH | M=FChlstra=DFe 2, Gut Delling | 82229 Seefeld, Germany
Amtsgericht M=FCnchen, HRB 105018
Gesch=E4ftsf=FChrer: Detlef Schneider, R=FCdiger Stahl, Stefan Schneider
http://www.tq-group.com/



