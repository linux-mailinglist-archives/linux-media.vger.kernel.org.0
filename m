Return-Path: <linux-media+bounces-1815-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 65C2A808664
	for <lists+linux-media@lfdr.de>; Thu,  7 Dec 2023 12:10:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 213132814F4
	for <lists+linux-media@lfdr.de>; Thu,  7 Dec 2023 11:10:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0770F37D15;
	Thu,  7 Dec 2023 11:10:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b="FpeqAfRy"
X-Original-To: linux-media@vger.kernel.org
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7A0FBE9
	for <linux-media@vger.kernel.org>; Thu,  7 Dec 2023 03:09:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1701947395; x=1733483395;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=QOhb5G2GcwS7djpDTCaIRKb88TJ9zbH94YYmNY6THIw=;
  b=FpeqAfRyBKhViJMLrsHguC2WaghngXaPJCWxKZhkdvj++JwLcDcAKydD
   qHp+JDc4aUzlogV4GYw8ZIu0NrJVdivw4VL8qKpcvXGl57bENTFqbHDzU
   xs+74gK4MUPj1RE3HNmxXYsW33TUOXnighIYK5apqks1mBk4eINl0Bpqi
   2Uu/ggjR+UYuwvIRI5GMPQzBktBKkazVLfc615n8iE9fBdcGUqD26mY41
   IPHMX7nQlYaLKVMEMDibHHmqPz/i9qX1gqk+FaXD9ukB0XklOHKaN083O
   +xdhPEGQkTSmvcEGSkXiIcrAnnDSRyMFDpf3dWt+etPBD+gFqClghGegs
   A==;
X-IronPort-AV: E=Sophos;i="6.04,256,1695679200"; 
   d="scan'208";a="34381314"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
  by mx1.tq-group.com with ESMTP; 07 Dec 2023 12:09:53 +0100
Received: from steina-w.localnet (steina-w.tq-net.de [10.123.53.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id BC8E6280075;
	Thu,  7 Dec 2023 12:09:53 +0100 (CET)
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, Pengutronix Kernel Team <kernel@pengutronix.de>, NXP Linux Team <linux-imx@nxp.com>, linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 1/1] media: nxp: imx8-isi-debug: Add missing registers to debugfs output
Date: Thu, 07 Dec 2023 12:09:53 +0100
Message-ID: <3272819.44csPzL39Z@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <20231207101400.GB3681@pendragon.ideasonboard.com>
References: <20231206094401.491100-1-alexander.stein@ew.tq-group.com> <2915417.e9J7NaK4W3@steina-w> <20231207101400.GB3681@pendragon.ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"

Hi Laurent,

Am Donnerstag, 7. Dezember 2023, 11:14:00 CET schrieb Laurent Pinchart:
> Hi Alexander,
>=20
> On Thu, Dec 07, 2023 at 08:52:46AM +0100, Alexander Stein wrote:
> > Am Mittwoch, 6. Dezember 2023, 23:36:36 CET schrieb Laurent Pinchart:
> > > On Wed, Dec 06, 2023 at 10:44:01AM +0100, Alexander Stein wrote:
> > > > The extended address registers are missing in the debug output
> > > > register
> > > > list. Add them.
> > > >=20
> > > > Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
> > > > ---
> > > >=20
> > > >  drivers/media/platform/nxp/imx8-isi/imx8-isi-debug.c | 7 +++++++
> > > >  1 file changed, 7 insertions(+)
> > > >=20
> > > > diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-debug.c
> > > > b/drivers/media/platform/nxp/imx8-isi/imx8-isi-debug.c index
> > > > 6709ab7ea1f3..3ac5685d6cc1 100644
> > > > --- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-debug.c
> > > > +++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-debug.c
> > > > @@ -66,6 +66,13 @@ static int mxc_isi_debug_dump_regs_show(struct
> > > > seq_file *m, void *p)> > >=20
> > > >  		MXC_ISI_DEBUG_REG(CHNL_OUT_BUF2_ADDR_V),
> > > >  		MXC_ISI_DEBUG_REG(CHNL_SCL_IMG_CFG),
> > > >  		MXC_ISI_DEBUG_REG(CHNL_FLOW_CTRL),
> > > >=20
> > > > +		MXC_ISI_DEBUG_REG(CHNL_Y_BUF1_XTND_ADDR),
> > > > +		MXC_ISI_DEBUG_REG(CHNL_U_BUF1_XTND_ADDR),
> > > > +		MXC_ISI_DEBUG_REG(CHNL_V_BUF1_XTND_ADDR),
> > > > +		MXC_ISI_DEBUG_REG(CHNL_Y_BUF2_XTND_ADDR),
> > > > +		MXC_ISI_DEBUG_REG(CHNL_U_BUF2_XTND_ADDR),
> > > > +		MXC_ISI_DEBUG_REG(CHNL_V_BUF2_XTND_ADDR),
> > > > +		MXC_ISI_DEBUG_REG(CHNL_IN_BUF_XTND_ADDR),
> > >=20
> > > Those registers only exist in the i.MX8MP. The i.MX8MN referenece man=
ual
> > > lists them as reserved and indicates they read as 0's, so it should be
> > > safe.  The i.MX93 reference manual, however, doesn't list those
> > > registers at all, so accessing them may lead to issues.
> > >=20
> > > How what platform(s) have you tested this patch ?
> >=20
> > Ah, you are right. That's something I didn't take into account. Up until
> > now I only tested this on i.MX8MP. I hope I can test this on i.MX8MN and
> > i.MX93 soon.
> > Otherwise dumping these registers can depend on pdata->has_36bit_dma ju=
st
> > to be safe.
>=20
> That sounds like a good solution to me. Will you do so in a v2 ?

Yep, yep just sent it.

Best regards
Alexander

>=20
> > > >  	};
> > > >  =09
> > > >  	struct mxc_isi_pipe *pipe =3D m->private;


=2D-=20
TQ-Systems GmbH | M=FChlstra=DFe 2, Gut Delling | 82229 Seefeld, Germany
Amtsgericht M=FCnchen, HRB 105018
Gesch=E4ftsf=FChrer: Detlef Schneider, R=FCdiger Stahl, Stefan Schneider
http://www.tq-group.com/



