Return-Path: <linux-media+bounces-28919-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C967A745C5
	for <lists+linux-media@lfdr.de>; Fri, 28 Mar 2025 09:56:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6C9981B60860
	for <lists+linux-media@lfdr.de>; Fri, 28 Mar 2025 08:56:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E420B2135C2;
	Fri, 28 Mar 2025 08:56:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="IkzDgYGP"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A20E721147C;
	Fri, 28 Mar 2025 08:56:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743152194; cv=none; b=c1BBU/tlBj85Mm9vMEiUJ0WdrsrZgxvExje7WhdrpRmKNZ0c40vsfMdsPNwKAlXUUWjOOQk+1+s2fOy1sNWieAqPDgBOSKQvPfcKOsn95amjiBkk6uIODN5dwv0gM2QtO+ZzPUvondlXJX9XL9/yG7SjjFEfyeGSguY4+9HvxPQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743152194; c=relaxed/simple;
	bh=8LFkZVlNrqslp/Rsd3HJnDbo9vMoZv8DWHlbdsSgBo8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=s1ztcS21Lhq3exTV+Lz6KI6DXWgunCz9Fa5Ut3VHFlnu7F1cVVEJwMjT1qwRuaMPfZhL3M6kjkPrXdDpzd6D8ctdWfdS3SViuxKiyEAJBGDufGsOc13ISnN47YK+1qJKe2eRk/NJyvDBtYEw6AaVYoxmtZD/Z7VaVC7XWPl0b08=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=IkzDgYGP; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 6ABA0844;
	Fri, 28 Mar 2025 09:54:41 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1743152081;
	bh=8LFkZVlNrqslp/Rsd3HJnDbo9vMoZv8DWHlbdsSgBo8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=IkzDgYGPVMxD3mg2AwvkZ17isoDdkfKt9nfBsfyBoTue9jtF1EhfThMNtkBkXObxy
	 GhJfFMdJv7+ZAuBJCV/Fw5ul134XKC69iVN/Kti8IVtiGkBOMszH0WiYiCDx5vCZog
	 G7vCeNxeVEnoQFWFQuu/zmkRgQ+IkLkYr+u/67dw=
Date: Fri, 28 Mar 2025 10:56:07 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Daniel Baluta <daniel.baluta@gmail.com>
Cc: Frank Li <Frank.Li@nxp.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Dong Aisheng <aisheng.dong@nxp.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rui Miguel Silva <rmfrfs@gmail.com>,
	Martin Kepplinger <martink@posteo.de>,
	Purism Kernel Team <kernel@puri.sm>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org,
	Robert Chiras <robert.chiras@nxp.com>,
	"Guoniu.zhou" <guoniu.zhou@nxp.com>
Subject: Re: [PATCH v3 07/12] media: imx8mq-mipi-csi2: Add imx8mq_plat_data
 for different compatible strings
Message-ID: <20250328085607.GE22295@pendragon.ideasonboard.com>
References: <20250210-8qxp_camera-v3-0-324f5105accc@nxp.com>
 <20250210-8qxp_camera-v3-7-324f5105accc@nxp.com>
 <CAEnQRZAmCrZ=OmMLWF80mrMih+uFDKMp3dGsEosJe0vCHgEEYw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAEnQRZAmCrZ=OmMLWF80mrMih+uFDKMp3dGsEosJe0vCHgEEYw@mail.gmail.com>

On Fri, Mar 28, 2025 at 10:35:44AM +0200, Daniel Baluta wrote:
> On Mon, Feb 10, 2025 at 11:02 PM Frank Li <Frank.Li@nxp.com> wrote:
> >
> > From: "Guoniu.zhou" <guoniu.zhou@nxp.com>
> >
> > Introduce `imx8mq_plat_data` along with enable/disable callback operations
> > to facilitate support for new chips. No functional changes.
> >
> > Signed-off-by: Guoniu.zhou <guoniu.zhou@nxp.com>
> > Signed-off-by: Frank Li <Frank.Li@nxp.com>
> > ---
> > Change from v2 to v3
> > - none
> > change from v1 to v2
> > - remove internal review tags
> > ---
> >  drivers/media/platform/nxp/imx8mq-mipi-csi2.c | 60 ++++++++++++++++++++-------
> >  1 file changed, 46 insertions(+), 14 deletions(-)
> >
> > diff --git a/drivers/media/platform/nxp/imx8mq-mipi-csi2.c b/drivers/media/platform/nxp/imx8mq-mipi-csi2.c
> > index 1f2657cf6e824..b5eae56d92f49 100644
> > --- a/drivers/media/platform/nxp/imx8mq-mipi-csi2.c
> > +++ b/drivers/media/platform/nxp/imx8mq-mipi-csi2.c
> > @@ -62,6 +62,8 @@
> >  #define CSI2RX_CFG_VID_P_FIFO_SEND_LEVEL       0x188
> >  #define CSI2RX_CFG_DISABLE_PAYLOAD_1           0x130
> >
> > +struct csi_state;
> > +
> >  enum {
> >         ST_POWERED      = 1,
> >         ST_STREAMING    = 2,
> > @@ -83,11 +85,11 @@ static const char * const imx8mq_mipi_csi_clk_id[CSI2_NUM_CLKS] = {
> >
> >  #define CSI2_NUM_CLKS  ARRAY_SIZE(imx8mq_mipi_csi_clk_id)
> >
> > -#define        GPR_CSI2_1_RX_ENABLE            BIT(13)
> > -#define        GPR_CSI2_1_VID_INTFC_ENB        BIT(12)
> > -#define        GPR_CSI2_1_HSEL                 BIT(10)
> > -#define        GPR_CSI2_1_CONT_CLK_MODE        BIT(8)
> > -#define        GPR_CSI2_1_S_PRG_RXHS_SETTLE(x) (((x) & 0x3f) << 2)
> > +struct imx8mq_plat_data {
> > +       const char *name;
> > +       int (*enable)(struct csi_state *state, u32 hs_settle);
> > +       void (*disable)(struct csi_state *state);
> > +};
> >
> >  /*
> >   * The send level configures the number of entries that must accumulate in
> > @@ -106,6 +108,7 @@ static const char * const imx8mq_mipi_csi_clk_id[CSI2_NUM_CLKS] = {
> >
> >  struct csi_state {
> >         struct device *dev;
> > +       const struct imx8mq_plat_data *pdata;
> >         void __iomem *regs;
> >         struct clk_bulk_data clks[CSI2_NUM_CLKS];
> >         struct reset_control *rst;
> > @@ -137,6 +140,35 @@ struct csi2_pix_format {
> >         u8 width;
> >  };
> >
> > +/* -----------------------------------------------------------------------------
> 
> I would drop this line. It doesn't make code easier to read.

I personally find that clear section markers make the code easier to
read. It's a personal preference though, so I leave it to individual
driver maintainers, and aim for consistency within drivers.

> > + * i.MX8MQ GPR
> > + */
> 
> Just say: /* i.MX8MQ GPR */
> 
> This pattern happens in a lot of places.

-- 
Regards,

Laurent Pinchart

