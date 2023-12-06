Return-Path: <linux-media+bounces-1715-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DF258068B8
	for <lists+linux-media@lfdr.de>; Wed,  6 Dec 2023 08:38:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D18561F2174D
	for <lists+linux-media@lfdr.de>; Wed,  6 Dec 2023 07:38:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D5DD518029;
	Wed,  6 Dec 2023 07:38:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b="j8FsryUW"
X-Original-To: linux-media@vger.kernel.org
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 022882125
	for <linux-media@vger.kernel.org>; Tue,  5 Dec 2023 23:38:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1701848292; x=1733384292;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=j/prfb+Jwv9Zd2EpASFrcdgUkIXBJdNB4Prj5SJo8CA=;
  b=j8FsryUWXYNaF1tlhIXRg41wOI/9wEaqA2yytL+yevqnIJ2IFH8xH0pN
   G88gKLrtSbAkipUTf5uicAI+Z6+8qVrHc7DWbUvMehkOHzLhtBWGUHgzx
   lIARFPD9tMOeMYschfw2w6VKcouamjsJVWy+lOgyYOtAqk71DvSBP78Tc
   O7KoXqW+mATVhumTurcKNtRIsYvhEL7GaVdEdsiDAeLrTcozKNQqlJHoV
   JZzE9pokeqH3DEUN3snO/R1bV9TaZlVTJgJ2f/S405aFoaMAiXnNLJSSO
   Y+4hu9gkB0abE+jlWimwlhSfZjYlNxshXZ2Wopk0yH9T7GpRs4FGU25EE
   A==;
X-IronPort-AV: E=Sophos;i="6.04,254,1695679200"; 
   d="scan'208";a="34350168"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
  by mx1.tq-group.com with ESMTP; 06 Dec 2023 08:38:09 +0100
Received: from steina-w.localnet (steina-w.tq-net.de [10.123.53.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id 53427280075;
	Wed,  6 Dec 2023 08:38:09 +0100 (CET)
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Gerald Loacker <gerald.loacker@wolfvision.net>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Michael Riesch <michael.riesch@wolfvision.net>, Sakari Ailus <sakari.ailus@linux.intel.com>, linux-media@vger.kernel.org
Subject: Re: [PATCH 3/3] media: i2c: imx415: Add more supported modes
Date: Wed, 06 Dec 2023 08:38:08 +0100
Message-ID: <2309033.ElGaqSPkdT@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <20231205145435.GA22607@pendragon.ideasonboard.com>
References: <20231205090557.298680-1-alexander.stein@ew.tq-group.com> <e14a0d97-7a99-4ad6-8938-3e0025437ed6@wolfvision.net> <20231205145435.GA22607@pendragon.ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"

Hi,

Am Dienstag, 5. Dezember 2023, 15:54:35 CET schrieb Laurent Pinchart:
> Hello,
>=20
> On Tue, Dec 05, 2023 at 03:47:15PM +0100, Gerald Loacker wrote:
> > Am 05.12.2023 um 12:12 schrieb Alexander Stein:
> > > Am Dienstag, 5. Dezember 2023, 11:45:09 CET schrieb Laurent Pinchart:
> > >> On Tue, Dec 05, 2023 at 10:05:57AM +0100, Alexander Stein wrote:
> > >>> These modes are listed in section "All-pixel mode" of the datasheet
> > >>> IMX415-AAQR-C (Rev. E19504, 2019/05/21).
> > >>> hmax_pix and pixel_rate are taken from the comment above the mode
> > >>> list.
> > >>>=20
> > >>> Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
> > >>> ---
> > >>>=20
> > >>>  drivers/media/i2c/imx415.c | 362
> > >>>  +++++++++++++++++++++++++++++++++++++
> > >>>  1 file changed, 362 insertions(+)
> > >>>=20
> > >>> diff --git a/drivers/media/i2c/imx415.c b/drivers/media/i2c/imx415.c
> > >>> index a222b9134aa2..48b8ae6d790d 100644
> > >>> --- a/drivers/media/i2c/imx415.c
> > >>> +++ b/drivers/media/i2c/imx415.c
> > >>> @@ -445,6 +445,38 @@ static const struct imx415_clk_params
> > >>> imx415_clk_params[] =3D {> >>>=20
> > >>>  	},
> > >>> =20
> > >>>  };
> > >>>=20
> > >>> +/* all-pixel 2-lane 594 Mbps 10 Hz mode */
> > >>> +static const struct cci_reg_sequence imx415_mode_2_594[] =3D {
> > >>> +	{ IMX415_VMAX, 0x08CA },
> > >>> +	{ IMX415_HMAX, 0x0CE4 },
> > >>> +	{ IMX415_LANEMODE, IMX415_LANEMODE_2 },
> > >>> +	{ IMX415_TCLKPOST, 0x0067 },
> > >>> +	{ IMX415_TCLKPREPARE, 0x0027 },
> > >>> +	{ IMX415_TCLKTRAIL, 0x0027 },
> > >>> +	{ IMX415_TCLKZERO, 0x00B7 },
> > >>> +	{ IMX415_THSPREPARE, 0x002F },
> > >>> +	{ IMX415_THSZERO, 0x004F },
> > >>> +	{ IMX415_THSTRAIL, 0x002F },
> > >>> +	{ IMX415_THSEXIT, 0x0047 },
> > >>> +	{ IMX415_TLPX, 0x0027 },
> > >>> +};
> > >>> +
> > >>> +/* all-pixel 2-lane 891 Mbps 15 Hz mode */
> > >>> +static const struct cci_reg_sequence imx415_mode_2_891[] =3D {
> > >>> +	{ IMX415_VMAX, 0x08CA },
> > >>> +	{ IMX415_HMAX, 0x0898 },
> > >>> +	{ IMX415_LANEMODE, IMX415_LANEMODE_2 },
> > >>> +	{ IMX415_TCLKPOST, 0x007F },
> > >>> +	{ IMX415_TCLKPREPARE, 0x0037 },
> > >>> +	{ IMX415_TCLKTRAIL, 0x0037 },
> > >>> +	{ IMX415_TCLKZERO, 0x00F7 },
> > >>> +	{ IMX415_THSPREPARE, 0x003F },
> > >>> +	{ IMX415_THSZERO, 0x006F },
> > >>> +	{ IMX415_THSTRAIL, 0x003F },
> > >>> +	{ IMX415_THSEXIT, 0x005F },
> > >>> +	{ IMX415_TLPX, 0x002F },
> > >>> +};
> > >>> +
> > >>>=20
> > >>>  /* all-pixel 2-lane 720 Mbps 15.74 Hz mode */
> > >>>  static const struct cci_reg_sequence imx415_mode_2_720[] =3D {
> > >>> =20
> > >>>  	{ IMX415_VMAX, 0x08CA },
> > >>>=20
> > >>> @@ -461,6 +493,38 @@ static const struct cci_reg_sequence
> > >>> imx415_mode_2_720[] =3D {> >>>=20
> > >>>  	{ IMX415_TLPX, 0x0027 },
> > >>> =20
> > >>>  };
> > >>>=20
> > >>> +/* all-pixel 2-lane 1782 Mbps 30 Hz mode */
> > >>> +static const struct cci_reg_sequence imx415_mode_2_1782[] =3D {
> > >>> +	{ IMX415_VMAX, 0x08CA },
> > >>> +	{ IMX415_HMAX, 0x044C },
> > >>> +	{ IMX415_LANEMODE, IMX415_LANEMODE_2 },
> > >>> +	{ IMX415_TCLKPOST, 0x00B7 },
> > >>> +	{ IMX415_TCLKPREPARE, 0x0067 },
> > >>> +	{ IMX415_TCLKTRAIL, 0x006F },
> > >>> +	{ IMX415_TCLKZERO, 0x01DF },
> > >>> +	{ IMX415_THSPREPARE, 0x006F },
> > >>> +	{ IMX415_THSZERO, 0x00CF },
> > >>> +	{ IMX415_THSTRAIL, 0x006F },
> > >>> +	{ IMX415_THSEXIT, 0x00B7 },
> > >>> +	{ IMX415_TLPX, 0x005F },
> > >>> +};
> > >>> +
> > >>> +/* all-pixel 2-lane 2079 Mbps 30 Hz mode */
> > >>> +static const struct cci_reg_sequence imx415_mode_2_2079[] =3D {
> > >>> +	{ IMX415_VMAX, 0x08CA },
> > >>> +	{ IMX415_HMAX, 0x044C },
> > >>> +	{ IMX415_LANEMODE, IMX415_LANEMODE_2 },
> > >>> +	{ IMX415_TCLKPOST, 0x00D7 },
> > >>> +	{ IMX415_TCLKPREPARE, 0x007F },
> > >>> +	{ IMX415_TCLKTRAIL, 0x007F },
> > >>> +	{ IMX415_TCLKZERO, 0x0237 },
> > >>> +	{ IMX415_THSPREPARE, 0x0087 },
> > >>> +	{ IMX415_THSZERO, 0x00EF },
> > >>> +	{ IMX415_THSTRAIL, 0x0087 },
> > >>> +	{ IMX415_THSEXIT, 0x00DF },
> > >>> +	{ IMX415_TLPX, 0x006F },
> > >>> +};
> > >>> +
> > >>>=20
> > >>>  /* all-pixel 2-lane 1440 Mbps 30.01 Hz mode */
> > >>>  static const struct cci_reg_sequence imx415_mode_2_1440[] =3D {
> > >>> =20
> > >>>  	{ IMX415_VMAX, 0x08CA },
> > >>>=20
> > >>> @@ -477,6 +541,70 @@ static const struct cci_reg_sequence
> > >>> imx415_mode_2_1440[] =3D {> >>>=20
> > >>>  	{ IMX415_TLPX, 0x004F },
> > >>> =20
> > >>>  };
> > >>>=20
> > >>> +/* all-pixel 4-lane 594 Mbps 20 Hz mode */
> > >>> +static const struct cci_reg_sequence imx415_mode_4_594_20fps[] =3D=
 {
> > >>> +	{ IMX415_VMAX, 0x08CA },
> > >>> +	{ IMX415_HMAX, 0x0672 },
> > >>> +	{ IMX415_LANEMODE, IMX415_LANEMODE_4 },
> > >>> +	{ IMX415_TCLKPOST, 0x0067 },
> > >>> +	{ IMX415_TCLKPREPARE, 0x0027 },
> > >>> +	{ IMX415_TCLKTRAIL, 0x0027 },
> > >>> +	{ IMX415_TCLKZERO, 0x00B7 },
> > >>> +	{ IMX415_THSPREPARE, 0x002F },
> > >>> +	{ IMX415_THSZERO, 0x004F },
> > >>> +	{ IMX415_THSTRAIL, 0x002F },
> > >>> +	{ IMX415_THSEXIT, 0x0047 },
> > >>> +	{ IMX415_TLPX, 0x0027 },
> > >>> +};
> > >>> +
> > >>> +/* all-pixel 4-lane 594 Mbps 25 Hz mode */
> > >>> +static const struct cci_reg_sequence imx415_mode_4_594_25fps[] =3D=
 {
> > >>> +	{ IMX415_VMAX, 0x08CA },
> > >>> +	{ IMX415_HMAX, 0x0528 },
> > >>> +	{ IMX415_LANEMODE, IMX415_LANEMODE_4 },
> > >>> +	{ IMX415_TCLKPOST, 0x0067 },
> > >>> +	{ IMX415_TCLKPREPARE, 0x0027 },
> > >>> +	{ IMX415_TCLKTRAIL, 0x0027 },
> > >>> +	{ IMX415_TCLKZERO, 0x00B7 },
> > >>> +	{ IMX415_THSPREPARE, 0x002F },
> > >>> +	{ IMX415_THSZERO, 0x004F },
> > >>> +	{ IMX415_THSTRAIL, 0x002F },
> > >>> +	{ IMX415_THSEXIT, 0x0047 },
> > >>> +	{ IMX415_TLPX, 0x0027 },
> > >>> +};
> > >>> +
> > >>> +/* all-pixel 4-lane 720 Mbps 25 Hz mode */
> > >>> +static const struct cci_reg_sequence imx415_mode_4_720_25fps[] =3D=
 {
> > >>> +	{ IMX415_VMAX, 0x08CA },
> > >>> +	{ IMX415_HMAX, 0x0500 },
> > >>> +	{ IMX415_LANEMODE, IMX415_LANEMODE_4 },
> > >>> +	{ IMX415_TCLKPOST, 0x006F },
> > >>> +	{ IMX415_TCLKPREPARE, 0x002F },
> > >>> +	{ IMX415_TCLKTRAIL, 0x002F },
> > >>> +	{ IMX415_TCLKZERO, 0x00BF },
> > >>> +	{ IMX415_THSPREPARE, 0x002F },
> > >>> +	{ IMX415_THSZERO, 0x0057 },
> > >>> +	{ IMX415_THSTRAIL, 0x002F },
> > >>> +	{ IMX415_THSEXIT, 0x004F },
> > >>> +	{ IMX415_TLPX, 0x0027 },
> > >>> +};
> > >>> +
> > >>> +/* all-pixel 4-lane 720 Mbps 30.01 Hz mode */
> > >>> +static const struct cci_reg_sequence imx415_mode_4_720_30fps[] =3D=
 {
> > >>> +	{ IMX415_VMAX, 0x08CA },
> > >>> +	{ IMX415_HMAX, 0x042A },
> > >>> +	{ IMX415_LANEMODE, IMX415_LANEMODE_4 },
> > >>> +	{ IMX415_TCLKPOST, 0x006F },
> > >>> +	{ IMX415_TCLKPREPARE, 0x002F },
> > >>> +	{ IMX415_TCLKTRAIL, 0x002F },
> > >>> +	{ IMX415_TCLKZERO, 0x00BF },
> > >>> +	{ IMX415_THSPREPARE, 0x002F },
> > >>> +	{ IMX415_THSZERO, 0x0057 },
> > >>> +	{ IMX415_THSTRAIL, 0x002F },
> > >>> +	{ IMX415_THSEXIT, 0x004F },
> > >>> +	{ IMX415_TLPX, 0x0027 },
> > >>> +};
> > >>> +
> > >>>=20
> > >>>  /* all-pixel 4-lane 891 Mbps 30 Hz mode */
> > >>>  static const struct cci_reg_sequence imx415_mode_4_891[] =3D {
> > >>> =20
> > >>>  	{ IMX415_VMAX, 0x08CA },
> > >>>=20
> > >>> @@ -493,6 +621,102 @@ static const struct cci_reg_sequence
> > >>> imx415_mode_4_891[] =3D {> >>>=20
> > >>>  	{ IMX415_TLPX, 0x002F },
> > >>> =20
> > >>>  };
> > >>>=20
> > >>> +/* all-pixel 4-lane 1440 Mbps 30.01 Hz mode */
> > >>> +static const struct cci_reg_sequence imx415_mode_4_1440_30fps[] =
=3D {
> > >>> +	{ IMX415_VMAX, 0x08CA },
> > >>> +	{ IMX415_HMAX, 0x042A },
> > >>> +	{ IMX415_LANEMODE, IMX415_LANEMODE_4 },
> > >>> +	{ IMX415_TCLKPOST, 0x009F },
> > >>> +	{ IMX415_TCLKPREPARE, 0x0057 },
> > >>> +	{ IMX415_TCLKTRAIL, 0x0057 },
> > >>> +	{ IMX415_TCLKZERO, 0x0187 },
> > >>> +	{ IMX415_THSPREPARE, 0x005F },
> > >>> +	{ IMX415_THSZERO, 0x00A7 },
> > >>> +	{ IMX415_THSTRAIL, 0x005F },
> > >>> +	{ IMX415_THSEXIT, 0x0097 },
> > >>> +	{ IMX415_TLPX, 0x004F },
> > >>> +};
> > >>> +
> > >>> +/* all-pixel 4-lane 1440 Mbps 60.03 Hz mode */
> > >>> +static const struct cci_reg_sequence imx415_mode_4_1440_60fps[] =
=3D {
> > >>> +	{ IMX415_VMAX, 0x08CA },
> > >>> +	{ IMX415_HMAX, 0x0215 },
> > >>> +	{ IMX415_LANEMODE, IMX415_LANEMODE_4 },
> > >>> +	{ IMX415_TCLKPOST, 0x009F },
> > >>> +	{ IMX415_TCLKPREPARE, 0x0057 },
> > >>> +	{ IMX415_TCLKTRAIL, 0x0057 },
> > >>> +	{ IMX415_TCLKZERO, 0x0187 },
> > >>> +	{ IMX415_THSPREPARE, 0x005F },
> > >>> +	{ IMX415_THSZERO, 0x00A7 },
> > >>> +	{ IMX415_THSTRAIL, 0x005F },
> > >>> +	{ IMX415_THSEXIT, 0x0097 },
> > >>> +	{ IMX415_TLPX, 0x004F },
> > >>> +};
> > >>> +
> > >>> +/* all-pixel 4-lane 1485 Mbps 60 Hz mode */
> > >>> +static const struct cci_reg_sequence imx415_mode_4_1485[] =3D {
> > >>> +	{ IMX415_VMAX, 0x08CA },
> > >>> +	{ IMX415_HMAX, 0x0226 },
> > >>> +	{ IMX415_LANEMODE, IMX415_LANEMODE_4 },
> > >>> +	{ IMX415_TCLKPOST, 0x00A7 },
> > >>> +	{ IMX415_TCLKPREPARE, 0x0057 },
> > >>> +	{ IMX415_TCLKTRAIL, 0x005F },
> > >>> +	{ IMX415_TCLKZERO, 0x0197 },
> > >>> +	{ IMX415_THSPREPARE, 0x005F },
> > >>> +	{ IMX415_THSZERO, 0x00AF },
> > >>> +	{ IMX415_THSTRAIL, 0x005F },
> > >>> +	{ IMX415_THSEXIT, 0x009F },
> > >>> +	{ IMX415_TLPX, 0x004F },
> > >>> +};
> > >>> +
> > >>> +/* all-pixel 4-lane 1782 Mbps 60 Hz mode */
> > >>> +static const struct cci_reg_sequence imx415_mode_4_1782[] =3D {
> > >>> +	{ IMX415_VMAX, 0x08CA },
> > >>> +	{ IMX415_HMAX, 0x0226 },
> > >>> +	{ IMX415_LANEMODE, IMX415_LANEMODE_4 },
> > >>> +	{ IMX415_TCLKPOST, 0x00B7 },
> > >>> +	{ IMX415_TCLKPREPARE, 0x0067 },
> > >>> +	{ IMX415_TCLKTRAIL, 0x006F },
> > >>> +	{ IMX415_TCLKZERO, 0x01DF },
> > >>> +	{ IMX415_THSPREPARE, 0x006F },
> > >>> +	{ IMX415_THSZERO, 0x00CF },
> > >>> +	{ IMX415_THSTRAIL, 0x006F },
> > >>> +	{ IMX415_THSEXIT, 0x00B7 },
> > >>> +	{ IMX415_TLPX, 0x005F },
> > >>> +};
> > >>> +
> > >>> +/* all-pixel 4-lane 2079 Mbps 60 Hz mode */
> > >>> +static const struct cci_reg_sequence imx415_mode_4_2079[] =3D {
> > >>> +	{ IMX415_VMAX, 0x08CA },
> > >>> +	{ IMX415_HMAX, 0x0226 },
> > >>> +	{ IMX415_LANEMODE, IMX415_LANEMODE_4 },
> > >>> +	{ IMX415_TCLKPOST, 0x00D7 },
> > >>> +	{ IMX415_TCLKPREPARE, 0x007F },
> > >>> +	{ IMX415_TCLKTRAIL, 0x007F },
> > >>> +	{ IMX415_TCLKZERO, 0x0237 },
> > >>> +	{ IMX415_THSPREPARE, 0x0087 },
> > >>> +	{ IMX415_THSZERO, 0x00EF },
> > >>> +	{ IMX415_THSTRAIL, 0x0087 },
> > >>> +	{ IMX415_THSEXIT, 0x00DF },
> > >>> +	{ IMX415_TLPX, 0x006F },
> > >>> +};
> > >>> +
> > >>> +/* all-pixel 4-lane 2376 Mbps 60 Hz mode */
> > >>> +static const struct cci_reg_sequence imx415_mode_4_2376[] =3D {
> > >>> +	{ IMX415_VMAX, 0x08CA },
> > >>> +	{ IMX415_HMAX, 0x016E },
> > >>> +	{ IMX415_LANEMODE, IMX415_LANEMODE_4 },
> > >>> +	{ IMX415_TCLKPOST, 0x00E7 },
> > >>> +	{ IMX415_TCLKPREPARE, 0x008F },
> > >>> +	{ IMX415_TCLKTRAIL, 0x008F },
> > >>> +	{ IMX415_TCLKZERO, 0x027F },
> > >>> +	{ IMX415_THSPREPARE, 0x0097 },
> > >>> +	{ IMX415_THSZERO, 0x010F },
> > >>> +	{ IMX415_THSTRAIL, 0x0097 },
> > >>> +	{ IMX415_THSEXIT, 0x00F7 },
> > >>> +	{ IMX415_TLPX, 0x007F },
> > >>> +};
> > >>> +
> > >>>=20
> > >>>  struct imx415_mode_reg_list {
> > >>> =20
> > >>>  	u32 num_of_regs;
> > >>>  	const struct cci_reg_sequence *regs;
> > >>>=20
> > >>> @@ -536,6 +760,26 @@ struct imx415_mode {
> > >>>=20
> > >>>  /* mode configs */
> > >>>  static const struct imx415_mode supported_modes[] =3D {
> > >>>=20
> > >>> +	{
> > >>> +		.lane_rate =3D 594000000,
> > >>> +		.lanes =3D 2,
> > >>> +		.hmax_pix =3D 4400,
> > >>> +		.pixel_rate =3D 99000000,
> > >>> +		.reg_list =3D {
> > >>> +			.num_of_regs =3D ARRAY_SIZE(imx415_mode_2_594),
> > >>> +			.regs =3D imx415_mode_2_594,
> > >>> +		},
> > >>> +	},
> > >>> +	{
> > >>> +		.lane_rate =3D 891000000,
> > >>> +		.lanes =3D 2,
> > >>> +		.hmax_pix =3D 4400,
> > >>> +		.pixel_rate =3D 148500000,
> > >>> +		.reg_list =3D {
> > >>> +			.num_of_regs =3D ARRAY_SIZE(imx415_mode_2_891),
> > >>> +			.regs =3D imx415_mode_2_891,
> > >>> +		},
> > >>> +	},
> > >>>=20
> > >>>  	{
> > >>>  =09
> > >>>  		.lane_rate =3D 720000000,
> > >>>  		.lanes =3D 2,
> > >>>=20
> > >>> @@ -547,6 +791,24 @@ static const struct imx415_mode supported_mode=
s[]
> > >>> =3D {
> > >>>=20
> > >>>  		},
> > >>>  =09
> > >>>  	},
> > >>>  	{
> > >>>=20
> > >>> +		.lane_rate =3D 1782000000,
> > >>> +		.lanes =3D 2,
> > >>> +		.hmax_pix =3D 4400,
> > >>> +		.pixel_rate =3D 297000000,
> > >>> +		.reg_list =3D {
> > >>> +			.num_of_regs =3D ARRAY_SIZE(imx415_mode_2_1782),
> > >>> +			.regs =3D imx415_mode_2_1782,
> > >>> +		},
> > >>> +	},	{
> > >>> +		.lane_rate =3D 2079000000,
> > >>> +		.lanes =3D 2,
> > >>> +		.hmax_pix =3D 4400,
> > >>> +		.pixel_rate =3D 304615385,
> > >>> +		.reg_list =3D {
> > >>> +			.num_of_regs =3D ARRAY_SIZE(imx415_mode_2_2079),
> > >>> +			.regs =3D imx415_mode_2_2079,
> > >>> +		},
> > >>> +	},	{
> > >>>=20
> > >>>  		.lane_rate =3D 1440000000,
> > >>>  		.lanes =3D 2,
> > >>>  		.hmax_pix =3D 4510,
> > >>>=20
> > >>> @@ -556,6 +818,46 @@ static const struct imx415_mode supported_mode=
s[]
> > >>> =3D {
> > >>>=20
> > >>>  			.regs =3D imx415_mode_2_1440,
> > >>>  	=09
> > >>>  		},
> > >>>  =09
> > >>>  	},
> > >>>=20
> > >>> +	{
> > >>> +		.lane_rate =3D 594000000,
> > >>> +		.lanes =3D 4,
> > >>> +		.hmax_pix =3D 5500,
> > >>> +		.pixel_rate =3D 247500000,
> > >>> +		.reg_list =3D {
> > >>> +			.num_of_regs =3D=20
ARRAY_SIZE(imx415_mode_4_594_20fps),
> > >>> +			.regs =3D imx415_mode_4_594_20fps,
> > >>> +		},
> > >>> +	},
> > >>> +	{
> > >>> +		.lane_rate =3D 594000000,
> > >>> +		.lanes =3D 4,
> > >>=20
> > >> The mode is selected from the number of data lanes and the lane rate.
> > >> They're the same as the previous entry, so this entry will never be
> > >> selected. Same below.
> > >=20
> > > I noticed that as well. The datasheet lists different FPS for the same
> > > link
> > > frequency / lane combination, only HMAX being different. Right now
> > > HMAX/VMAX is fixed, so is FPS.
> > > I am aware there is no way to select between these modes, but I added
> > > them for completeness.
> >=20
> > I'd prefer to only add common and tested modes. We have to keep in mind
> > that in future we may want to add more features as 12 bit support or
> > HDR. Adding all modes could make this more complex.
>=20
> More than that, it would also be good to start computing parameters
> dynamically instead of adding lots of hardcoded values. The
> IMX415_LANEMODE register value in the cci_reg_sequence arrays is a
> low-hanging fruit, the register can be programmed from the number of
> lanes. The CSI-2 timings would also benefit from being computed
> dynamically based on the lane rate. Dynamic calculation of the HMAX and
> VMAX values to achieve a particular default frame rate should be
> possible too, but more importantly, they should be configurable from
> userspace too.

=46ine by me. But I don't know when I will be able to do that.
Nevertheless patches 1 & 2 can be applied meanwhile, if there are no commen=
ts

Best regards,
Alexander

>=20
> > >>> +		.hmax_pix =3D 4400,
> > >>> +		.pixel_rate =3D 247500000,
> > >>> +		.reg_list =3D {
> > >>> +			.num_of_regs =3D=20
ARRAY_SIZE(imx415_mode_4_594_25fps),
> > >>> +			.regs =3D imx415_mode_4_594_25fps,
> > >>> +		},
> > >>> +	},
> > >>> +	{
> > >>> +		.lane_rate =3D 720000000,
> > >>> +		.lanes =3D 4,
> > >>> +		.hmax_pix =3D 4400,
> > >>> +		.pixel_rate =3D 247500000,
> > >>> +		.reg_list =3D {
> > >>> +			.num_of_regs =3D=20
ARRAY_SIZE(imx415_mode_4_720_25fps),
> > >>> +			.regs =3D imx415_mode_4_720_25fps,
> > >>> +		},
> > >>> +	},
> > >>> +	{
> > >>> +		.lane_rate =3D 720000000,
> > >>> +		.lanes =3D 4,
> > >>> +		.hmax_pix =3D 4510,
> > >>> +		.pixel_rate =3D 304615385,
> > >>> +		.reg_list =3D {
> > >>> +			.num_of_regs =3D=20
ARRAY_SIZE(imx415_mode_4_720_30fps),
> > >>> +			.regs =3D imx415_mode_4_720_30fps,
> > >>> +		},
> > >>> +	},
> > >>>=20
> > >>>  	{
> > >>>  =09
> > >>>  		.lane_rate =3D 891000000,
> > >>>  		.lanes =3D 4,
> > >>>=20
> > >>> @@ -566,6 +868,66 @@ static const struct imx415_mode supported_mode=
s[]
> > >>> =3D {
> > >>>=20
> > >>>  			.regs =3D imx415_mode_4_891,
> > >>>  	=09
> > >>>  		},
> > >>>  =09
> > >>>  	},
> > >>>=20
> > >>> +	{
> > >>> +		.lane_rate =3D 1440000000,
> > >>> +		.lanes =3D 4,
> > >>> +		.hmax_pix =3D 4510,
> > >>> +		.pixel_rate =3D 304615385,
> > >>> +		.reg_list =3D {
> > >>> +			.num_of_regs =3D=20
ARRAY_SIZE(imx415_mode_4_1440_30fps),
> > >>> +			.regs =3D imx415_mode_4_1440_30fps,
> > >>> +		},
> > >>> +	},
> > >>> +	{
> > >>> +		.lane_rate =3D 1440000000,
> > >>> +		.lanes =3D 4,
> > >>> +		.hmax_pix =3D 4510,
> > >>> +		.pixel_rate =3D 609230769,
> > >>> +		.reg_list =3D {
> > >>> +			.num_of_regs =3D=20
ARRAY_SIZE(imx415_mode_4_1440_60fps),
> > >>> +			.regs =3D imx415_mode_4_1440_60fps,
> > >>> +		},
> > >>> +	},
> > >>> +	{
> > >>> +		.lane_rate =3D 1485000000,
> > >>> +		.lanes =3D 4,
> > >>> +		.hmax_pix =3D 4400,
> > >>> +		.pixel_rate =3D 594000000,
> > >>> +		.reg_list =3D {
> > >>> +			.num_of_regs =3D ARRAY_SIZE(imx415_mode_4_1485),
> > >>> +			.regs =3D imx415_mode_4_1485,
> > >>> +		},
> > >>> +	},
> > >>> +	{
> > >>> +		.lane_rate =3D 1782000000,
> > >>> +		.lanes =3D 4,
> > >>> +		.hmax_pix =3D 4400,
> > >>> +		.pixel_rate =3D 594000000,
> > >>> +		.reg_list =3D {
> > >>> +			.num_of_regs =3D ARRAY_SIZE(imx415_mode_4_1782),
> > >>> +			.regs =3D imx415_mode_4_1782,
> > >>> +		},
> > >>> +	},
> > >>> +	{
> > >>> +		.lane_rate =3D 2079000000,
> > >>> +		.lanes =3D 4,
> > >>> +		.hmax_pix =3D 4400,
> > >>> +		.pixel_rate =3D 594000000,
> > >>> +		.reg_list =3D {
> > >>> +			.num_of_regs =3D ARRAY_SIZE(imx415_mode_4_2079),
> > >>> +			.regs =3D imx415_mode_4_2079,
> > >>> +		},
> > >>> +	},
> > >>> +	{
> > >>> +		.lane_rate =3D 12376000000,
> > >>> +		.lanes =3D 4,
> > >>> +		.hmax_pix =3D 4392,
> > >>> +		.pixel_rate =3D 891000000,
> > >>> +		.reg_list =3D {
> > >>> +			.num_of_regs =3D ARRAY_SIZE(imx415_mode_4_2376),
> > >>> +			.regs =3D imx415_mode_4_2376,
> > >>> +		},
> > >>> +	},
> > >>>=20
> > >>>  };
> > >>> =20
> > >>>  static const char *const imx415_test_pattern_menu[] =3D {


=2D-=20
TQ-Systems GmbH | M=FChlstra=DFe 2, Gut Delling | 82229 Seefeld, Germany
Amtsgericht M=FCnchen, HRB 105018
Gesch=E4ftsf=FChrer: Detlef Schneider, R=FCdiger Stahl, Stefan Schneider
http://www.tq-group.com/



