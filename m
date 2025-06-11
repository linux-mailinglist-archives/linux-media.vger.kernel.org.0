Return-Path: <linux-media+bounces-34515-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B53E7AD58A8
	for <lists+linux-media@lfdr.de>; Wed, 11 Jun 2025 16:26:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 38AF77A8CDF
	for <lists+linux-media@lfdr.de>; Wed, 11 Jun 2025 14:24:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6783329B23D;
	Wed, 11 Jun 2025 14:25:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="JZcUDvbJ"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 092652BDC25;
	Wed, 11 Jun 2025 14:25:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749651924; cv=none; b=FxDy2KCy4GumHuO48KO1YEmz+obtDy17Bfw6vhnNNASuYr4dXSvZRrLV+q+r8ZN6zxKk6mmWEXDQ09QEBFs9A3bbr/Nf3T9iqY0HP4pbl2fgVwO6grEl9ocRp6rNOLrzy+f+i+n/lCm0eJJvYK5Qbt7OV4zMYZBD7ThqLsSl3uA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749651924; c=relaxed/simple;
	bh=ydw5XstCOj0yxT3ihCpLEUcyvE3z56cERDKWAm+csSg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lnCrR4GgZ9HUUei4h/HqHuGx5ZQzGfD8M4oRGrCr6uodX6j9hoIYREn+XBpyWNP5vP8h674Alm0QL2zc9sJjgm1hTEzDHCajX46P82rTxPW77lZcl36/z28qTQCVjtIVsjbF1nz3tE9ZggKo6ReW/a6Bt5b8h+LRVaREY3BGQBY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=JZcUDvbJ; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 23B992329;
	Wed, 11 Jun 2025 16:25:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1749651908;
	bh=ydw5XstCOj0yxT3ihCpLEUcyvE3z56cERDKWAm+csSg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=JZcUDvbJTHLRCMKztArv5XRBV2UHFvGOjmfkOUZFrAhTDdy9AxA7voYcK2/vHn6Nu
	 WyMEobdEFcsh1Q9xpCzPWwsRiRv8z60zykAImLj8Brf+fdGkALvw/eDug2eansN/FX
	 dBXPhuJWGeeBKrFPsRq82hjT9uHQJ3lRkp960daM=
Date: Wed, 11 Jun 2025 17:25:03 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Frank Li <Frank.li@nxp.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Rui Miguel Silva <rmfrfs@gmail.com>,
	Martin Kepplinger <martink@posteo.de>,
	Purism Kernel Team <kernel@puri.sm>, linux-media@vger.kernel.org,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Robert Chiras <robert.chiras@nxp.com>,
	"Guoniu.zhou" <guoniu.zhou@nxp.com>
Subject: Re: [PATCH v5 00/13] media: imx8: add camera support
Message-ID: <20250611142503.GB22730@pendragon.ideasonboard.com>
References: <20250522-8qxp_camera-v5-0-d4be869fdb7e@nxp.com>
 <aEcUGXeAdf/gBBFX@lizhi-Precision-Tower-5810>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <aEcUGXeAdf/gBBFX@lizhi-Precision-Tower-5810>

Hi Frank,

On Mon, Jun 09, 2025 at 01:04:25PM -0400, Frank Li wrote:
> On Thu, May 22, 2025 at 01:56:38PM -0400, Frank Li wrote:
> > Add SCU reset driver for i.MX8QM/i.MX8QXP.
> > Update binding doc.
> > Update driver for imx8qxp and imx8qm.
> > Add dts files for it.
> >
> > Signed-off-by: Frank Li <Frank.Li@nxp.com>
> 
> Laurent Pinchart:
> 
> 	Do you have chance to check these patches? Only below patch
> media: nxp: imx8-isi: Use devm_clk_bulk_get_all() to fetch clocks
> missed your review tag.

I've just pinged Rob in the v4 thread.

> 	DT team member still have not any comments about your concern by
> use devm_clk_bulk_get_all(). I have quite confidence about this
> devm_clk_bulk_get_all(), many drivers already switched to use
> devm_clk_bulk_get_all() recently.
> 
> 	Do you need me rebase to v6.16-rc1?

The patches apply cleanly on v6.16-rc1, no need to rebase. I'll wait a
few more days for Rob's reply.

> > Changes in v5:
> > - collect Laurent Pinchart's review tags
> > - remove empty endpoint in dts
> >
> > Changes in v4:
> > - Add 4 clean up patches
> > 	media: nxp: imx8-isi: Remove unused offset in mxc_isi_reg and use BIT() macro for mask
> > 	media: nxp: imx8-isi: Use dev_err_probe() simplify code
> > 	media: nxp: imx8-isi: Remove redundant check for dma_set_mask_and_coherent()
> > 	media: nxp: imx8-isi: Use devm_clk_bulk_get_all() to fetch clocks
> > - rebase to v6.15-rc1.
> > - Remove scu reset patches, which already in linux-next
> > - Remove patch
> > 	 Add fixed clock node clock-xtal24m to prepare to add camera support.
> > - other detail change log see each patch's change log
> > - Link to v3: https://lore.kernel.org/r/20250210-8qxp_camera-v3-0-324f5105accc@nxp.com
> >
> > Changes in v3:
> > - Remove phy driver parts.
> > - csr is dedicate for mipi csi2, so add it as second register space. csr is
> > mixed with PHY and link control with csi2.
> > - Link to v2: https://lore.kernel.org/r/20250205-8qxp_camera-v2-0-731a3edf2744@nxp.com
> >
> > Changes in v2:
> > - move scu reset binding doc to top scu doc.
> > - isi use seperate binding doc for imx8qxp and imx8qm.
> > - phy and csi2, compatible string 8qm fallback to qxp
> > - remove internal review tags
> > - Link to v1: https://lore.kernel.org/r/20250131-8qxp_camera-v1-0-319402ab606a@nxp.com
> >
> > ---
> > Frank Li (10):
> >       media: dt-bindings: Add binding doc for i.MX8QXP and i.MX8QM ISI
> >       media: nxp: imx8-isi: Allow num_sources to be greater than num_sink
> >       media: nxp: imx8-isi: Remove unused offset in mxc_isi_reg and use BIT() macro for mask
> >       media: nxp: imx8-isi: Use devm_clk_bulk_get_all() to fetch clocks
> >       media: nxp: imx8-isi: Remove redundant check for dma_set_mask_and_coherent()
> >       media: nxp: imx8-isi: Use dev_err_probe() to simplify code
> >       media: imx8mq-mipi-csi2: Add support for i.MX8QXP
> >       arm64: dts: imx8: add capture controller for i.MX8's img subsystem
> >       arm64: dts: imx8q: add linux,cma node for imx8qm-mek and imx8qxp-mek
> >       arm64: dts: imx8q: add camera ov5640 support for imx8qm-mek and imx8qxp-mek
> >
> > Guoniu.zhou (1):
> >       media: imx8mq-mipi-csi2: Add imx8mq_plat_data for different compatible strings
> >
> > Robert Chiras (2):
> >       media: imx8-isi: Add support for i.MX8QM and i.MX8QXP
> >       media: dt-bindings: nxp,imx8mq-mipi-csi2: Add i.MX8QM(QXP) compatible strings
> >
> >  .../devicetree/bindings/media/fsl,imx8qm-isi.yaml  | 117 +++++++
> >  .../devicetree/bindings/media/fsl,imx8qxp-isi.yaml | 106 ++++++
> >  .../bindings/media/nxp,imx8mq-mipi-csi2.yaml       |  38 ++-
> >  MAINTAINERS                                        |   1 +
> >  arch/arm64/boot/dts/freescale/Makefile             |  11 +
> >  arch/arm64/boot/dts/freescale/imx8-ss-img.dtsi     | 362 +++++++++++++++++++++
> >  .../boot/dts/freescale/imx8qm-mek-ov5640-csi0.dtso |  64 ++++
> >  .../boot/dts/freescale/imx8qm-mek-ov5640-csi1.dtso |  64 ++++
> >  arch/arm64/boot/dts/freescale/imx8qm-mek.dts       |  67 ++++
> >  arch/arm64/boot/dts/freescale/imx8qm-ss-img.dtsi   |  79 +++++
> >  arch/arm64/boot/dts/freescale/imx8qm.dtsi          |   5 +
> >  .../boot/dts/freescale/imx8qxp-mek-ov5640-csi.dtso |  63 ++++
> >  arch/arm64/boot/dts/freescale/imx8qxp-mek.dts      |  45 +++
> >  arch/arm64/boot/dts/freescale/imx8qxp-ss-img.dtsi  |  83 +++++
> >  arch/arm64/boot/dts/freescale/imx8qxp.dtsi         |   5 +
> >  .../media/platform/nxp/imx8-isi/imx8-isi-core.c    | 135 ++++----
> >  .../media/platform/nxp/imx8-isi/imx8-isi-core.h    |   6 +-
> >  .../platform/nxp/imx8-isi/imx8-isi-crossbar.c      |   8 +-
> >  drivers/media/platform/nxp/imx8mq-mipi-csi2.c      | 169 +++++++++-
> >  19 files changed, 1334 insertions(+), 94 deletions(-)
> > ---
> > base-commit: ae1fdcf4b210cd66ac7e97b24219c160e4bb7be5
> > change-id: 20250114-8qxp_camera-c1af5749d304

-- 
Regards,

Laurent Pinchart

