Return-Path: <linux-media+bounces-1934-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A9C6809D38
	for <lists+linux-media@lfdr.de>; Fri,  8 Dec 2023 08:36:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C6CBDB20E1B
	for <lists+linux-media@lfdr.de>; Fri,  8 Dec 2023 07:36:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 051EF101F8;
	Fri,  8 Dec 2023 07:36:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b="RyQOgzGy"
X-Original-To: linux-media@vger.kernel.org
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9872F1720
	for <linux-media@vger.kernel.org>; Thu,  7 Dec 2023 23:36:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1702020976; x=1733556976;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=VPDr7ASZyETs7GLNzK5ZsQ+XZ+gRsJywjN7p2JYtPtQ=;
  b=RyQOgzGyNtWKLXZl4thDG7zVBrdaKC2RnM74N79mvHmYCeLOd4Zoqik0
   YTXQ125QcuJJmVpZQltmTNbED2XZuxZzRT8e3seqb00X1v2qOBqqD0P1J
   Vm/zKWOVdQvIMWww0HMSdAl+ypW4hbg7YDP0JLLRxJJuFZe81DiTmO7b7
   XbOZZEoRL5V7ng38vZ5KvJ2/etXGkajC98a78UNUR9sZG9UVdQB5fT3Vj
   kqmehna9Xq2cv4d7t8+i+sce+PVGp1cxFlh9HFtq89ymQK0MhVDcY6zhI
   WtbIAWBxH8d2kOHgejG4xwOWirIOItXIpecNdRMfapNX/Ucd2plVC/W3H
   A==;
X-IronPort-AV: E=Sophos;i="6.04,260,1695679200"; 
   d="scan'208";a="34396685"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
  by mx1.tq-group.com with ESMTP; 08 Dec 2023 08:36:14 +0100
Received: from steina-w.localnet (steina-w.tq-net.de [10.123.53.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id 9A945280075;
	Fri,  8 Dec 2023 08:36:14 +0100 (CET)
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, Pengutronix Kernel Team <kernel@pengutronix.de>, NXP Linux Team <linux-imx@nxp.com>, linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 1/1] media: nxp: imx8-isi-debug: Add missing 36-Bit DMA registers to debugfs output
Date: Fri, 08 Dec 2023 08:36:14 +0100
Message-ID: <22110294.EfDdHjke4D@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <20231207142845.GB15521@pendragon.ideasonboard.com>
References: <20231207110918.1338524-1-alexander.stein@ew.tq-group.com> <10383921.nUPlyArG6x@steina-w> <20231207142845.GB15521@pendragon.ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"

Hi Laurent,

Am Donnerstag, 7. Dezember 2023, 15:28:45 CET schrieb Laurent Pinchart:
> Hi Alexander,
>=20
> On Thu, Dec 07, 2023 at 03:15:10PM +0100, Alexander Stein wrote:
> > Am Donnerstag, 7. Dezember 2023, 14:55:39 CET schrieb Laurent Pinchart:
> > > On Thu, Dec 07, 2023 at 12:09:18PM +0100, Alexander Stein wrote:
> > > > The extended address registers are missing in the debug output
> > > > register
> > > > list. These are only available on 36-Bit DMA platforms. Due to the
> > > > prolonged name, the output width has to be adjusted as well.
> > > >=20
> > > > Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
> > > > ---
> > > > Changes in v2:
> > > > * Split register set into regular and 36-Bit DMA only
> > > > * Adjust output width to address longer register names
> > > >=20
> > > > Currently only tested on TQMa8MPxL (imx8mp-tqma8mpql-mba8mpxl.dts)
> > > >=20
> > > >  .../platform/nxp/imx8-isi/imx8-isi-debug.c    | 28
> > > >  +++++++++++++++++--
> > > >  1 file changed, 25 insertions(+), 3 deletions(-)
> > > >=20
> > > > diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-debug.c
> > > > b/drivers/media/platform/nxp/imx8-isi/imx8-isi-debug.c index
> > > > 6709ab7ea1f3..398864b5e506 100644
> > > > --- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-debug.c
> > > > +++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-debug.c
> > > > @@ -22,10 +22,11 @@ static inline u32 mxc_isi_read(struct mxc_isi_p=
ipe
> > > > *pipe, u32 reg)>
> > > >=20
> > > >  static int mxc_isi_debug_dump_regs_show(struct seq_file *m, void *=
p)
> > > >  {
> > > >  #define MXC_ISI_DEBUG_REG(name)		{ name, #name }
> > > >=20
> > > > -	static const struct {
> > > > +	struct debug_regs {
> > > >=20
> > > >  		u32 offset;
> > > >  		const char * const name;
> > > >=20
> > > > -	} registers[] =3D {
> > > > +	};
> > > > +	static const struct debug_regs registers[] =3D {
> > > >=20
> > > >  		MXC_ISI_DEBUG_REG(CHNL_CTRL),
> > > >  		MXC_ISI_DEBUG_REG(CHNL_IMG_CTRL),
> > > >  		MXC_ISI_DEBUG_REG(CHNL_OUT_BUF_CTRL),
> > > >=20
> > > > @@ -67,6 +68,16 @@ static int mxc_isi_debug_dump_regs_show(struct
> > > > seq_file
> > > > *m, void *p)>
> > > >=20
> > > >  		MXC_ISI_DEBUG_REG(CHNL_SCL_IMG_CFG),
> > > >  		MXC_ISI_DEBUG_REG(CHNL_FLOW_CTRL),
> > > >  =09
> > > >  	};
> > > >=20
> > > > +	/* There registers contain the upper 4Bits of 36-Bit DMA addresses
> > > > */
> > >=20
> > > s/There/These/
> > >=20
> > > > +	static const struct debug_regs registers_36bit_dma[] =3D {
> > > > +		MXC_ISI_DEBUG_REG(CHNL_Y_BUF1_XTND_ADDR),
> > > > +		MXC_ISI_DEBUG_REG(CHNL_U_BUF1_XTND_ADDR),
> > > > +		MXC_ISI_DEBUG_REG(CHNL_V_BUF1_XTND_ADDR),
> > > > +		MXC_ISI_DEBUG_REG(CHNL_Y_BUF2_XTND_ADDR),
> > > > +		MXC_ISI_DEBUG_REG(CHNL_U_BUF2_XTND_ADDR),
> > > > +		MXC_ISI_DEBUG_REG(CHNL_V_BUF2_XTND_ADDR),
> > > > +		MXC_ISI_DEBUG_REG(CHNL_IN_BUF_XTND_ADDR),
> > > > +	};
> > > >=20
> > > >  	struct mxc_isi_pipe *pipe =3D m->private;
> > > >  	unsigned int i;
> > > >=20
> > > > @@ -77,10 +88,21 @@ static int mxc_isi_debug_dump_regs_show(struct
> > > > seq_file *m, void *p)>
> > > >=20
> > > >  	seq_printf(m, "--- ISI pipe %u registers ---\n", pipe->id);
> > > >  =09
> > > >  	for (i =3D 0; i < ARRAY_SIZE(registers); ++i)
> > > >=20
> > > > -		seq_printf(m, "%20s[0x%02x]: 0x%08x\n",
> > > > +		seq_printf(m, "%21s[0x%02x]: 0x%08x\n",
> > > >=20
> > > >  			   registers[i].name, registers[i].offset,
> > > >  			   mxc_isi_read(pipe, registers[i].offset));
> > > >=20
> > > > +	if (pipe->isi->pdata->has_36bit_dma) {
> > > > +		for (i =3D 0; i < ARRAY_SIZE(registers_36bit_dma); ++i) {
> > > > +			const struct debug_regs *reg =3D=20
aregisters_36bit_dma[i];
> > > > +
> > > > +			seq_printf(m, "%21s[0x%02x]: 0x%08x\n",
> > > > +				reg->name,
> > > > +				reg->offset,
> > > > +				mxc_isi_read(pipe, reg->offset));
> > >=20
> > > Lines should be aligned under the "m" of the first line.
> > >=20
> > > I'll fix these small issues when applying, no need to send a v3.
> > >=20
> > > Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> >=20
> > For the records: Also tested on TQMa8MxNL (imx8mn-tqma8mqnl-mba8mx.dts).
> > As
> > expected it prints only the same registers as before.
>=20
> Thank you. Can I add
>=20
>     Tested-by: Alexander Stein <alexander.stein@ew.tq-group.com> # on imx=
8mn
>=20
> ?

Sure, you can add it for imx8mn, imx8mp and imx93 actually.

Best regards,
Alexander

>=20
> > > > +		}
> > > > +	}
> > > > +
> > > >=20
> > > >  	pm_runtime_put(pipe->isi->dev);
> > > >  =09
> > > >  	return 0;


=2D-=20
TQ-Systems GmbH | M=FChlstra=DFe 2, Gut Delling | 82229 Seefeld, Germany
Amtsgericht M=FCnchen, HRB 105018
Gesch=E4ftsf=FChrer: Detlef Schneider, R=FCdiger Stahl, Stefan Schneider
http://www.tq-group.com/



