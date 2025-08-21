Return-Path: <linux-media+bounces-40639-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 18256B2FFA0
	for <lists+linux-media@lfdr.de>; Thu, 21 Aug 2025 18:07:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A23B3B6469E
	for <lists+linux-media@lfdr.de>; Thu, 21 Aug 2025 16:05:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AC4A02BCF4C;
	Thu, 21 Aug 2025 16:06:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="pFfDnDKm"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 337282D4B61;
	Thu, 21 Aug 2025 16:06:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755792401; cv=none; b=iHTbI5KBXawZhJYQJkGo/pex7gjMQJQXZ4+NqL8S4WpKM+PguSCAyUcuWwbK6y4+8oGWF3Y8br6qoDPLQcDhGV8qe2ixlmaBR+1kzKsFJKtu3d7oL1Q9/GuFyx95I4gbd/kw0IQDxBb6sp+uNDBaR13Xq4BFHfdSJ4vcEVOrdhY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755792401; c=relaxed/simple;
	bh=reNOgaI66JpG7BCmaKX/JcvTZ2uK0khXqFeK3NpfnDQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mTyV9fSs1A6BiXDOeN6l7dH3vJ8qm13/5MWp0Dya99Dmeo+Iw0d/BoYArRbJwcZ50/w1P0vl8rBNat+vfgxeh9WLbnTb7o29UKGbOmNRkpAtBAKQwUL596F7djXgyCgaas5sNWn3/cFl7Sn0UZzbe/HTj1h//tSfKQhEp2Tu8No=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=pFfDnDKm; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id A6157C78;
	Thu, 21 Aug 2025 18:05:37 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1755792337;
	bh=reNOgaI66JpG7BCmaKX/JcvTZ2uK0khXqFeK3NpfnDQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=pFfDnDKmTxUVEqUGHNPN0kzSTpwjHEJtAD/4LerCKHwLoRSdRSlxa7oi0G8IOm3JK
	 B4lPhsBNxAv0fzDABC79KW8xpRLeh0s+capxkmRedX0aqwDj1jy7mOOUmiD/vdoO1y
	 3km2CpAPWVjOehJoS+ta2BSEXfVAC3+/4TZLHWe0=
Date: Thu, 21 Aug 2025 19:06:13 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Frank Li <Frank.li@nxp.com>
Cc: linux-media@vger.kernel.org, Isaac Scott <isaac.scott@ideasonboard.com>,
	Rui Miguel Silva <rmfrfs@gmail.com>,
	Martin Kepplinger <martink@posteo.de>,
	Purism Kernel Team <kernel@puri.sm>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 05/12] media: imx-mipi-csis: Rename register macros to
 match reference manual
Message-ID: <20250821160613.GA29629@pendragon.ideasonboard.com>
References: <20250821000944.27849-1-laurent.pinchart@ideasonboard.com>
 <20250821000944.27849-6-laurent.pinchart@ideasonboard.com>
 <aKc6gzH5nyAeusu3@lizhi-Precision-Tower-5810>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <aKc6gzH5nyAeusu3@lizhi-Precision-Tower-5810>

Hi Frank,

On Thu, Aug 21, 2025 at 11:25:55AM -0400, Frank Li wrote:
> On Thu, Aug 21, 2025 at 03:09:37AM +0300, Laurent Pinchart wrote:
> > The CSIS driver uses register macro names that do not match the
> > reference manual of the i.MX7[DS] and i.MX8M[MNP] SoCs in which the CSIS
> > is integrated. Rename them to match the documentation, making the code
> > easier to read alongside the reference manuals.
> >
> > One of the misnamed register fields is MIPI_CSIS_INT_SRC_ERR_UNKNOWN,
> > which led to the corresponding event being logged as "Unknown Error".
> > The correct register field name is MIPI_CSIS_INT_SRC_ERR_ID, documented
> > as "Unknown ID error". Update the event description accordingly.
> >
> > While at it, also replace a few *_OFFSET macros with parametric macros
> > for consistency, and add the missing MIPI_CSIS_ISP_RESOL_VRESOL and
> > MIPI_CSIS_ISP_RESOL_HRESOL register field macros.
> >
> > Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > ---
> >  drivers/media/platform/nxp/imx-mipi-csis.c | 69 +++++++++++-----------
> >  1 file changed, 36 insertions(+), 33 deletions(-)
> >
> > diff --git a/drivers/media/platform/nxp/imx-mipi-csis.c b/drivers/media/platform/nxp/imx-mipi-csis.c
> > index 894d12fef519..1ca327e6be00 100644
> > --- a/drivers/media/platform/nxp/imx-mipi-csis.c
> > +++ b/drivers/media/platform/nxp/imx-mipi-csis.c
> > @@ -55,13 +55,13 @@
> >  /* CSIS common control */
> >  #define MIPI_CSIS_CMN_CTRL			0x04
> >  #define MIPI_CSIS_CMN_CTRL_UPDATE_SHADOW	BIT(16)
> > -#define MIPI_CSIS_CMN_CTRL_INTER_MODE		BIT(10)
> > +#define MIPI_CSIS_CMN_CTRL_INTERLEAVE_MODE_NONE	(0 << 10)
> > +#define MIPI_CSIS_CMN_CTRL_INTERLEAVE_MODE_DT	(1 << 10)
> 
> BIT(10)?

INTERLAVE_MODE is a 2-bit field. I'm working on a series that add
support for the VC interleave mode, which has value 2. I'll however drop
this change and keep BIT(10) for now, as the commit message doesn't
explain why this has been modified.

> > +#define MIPI_CSIS_CMN_CTRL_LANE_NUMBER(n)	((n) << 8)
> > +#define MIPI_CSIS_CMN_CTRL_LANE_NUMBER_MASK	(3 << 8)
> 
> GEN_MASK() is better here, And below other registers.

It is, but I wanted this patch to focus on the renames. I actually have
a patch in my branch to switch to GENMASK for all masks, I will add it
to the next version of this series.

> >  #define MIPI_CSIS_CMN_CTRL_UPDATE_SHADOW_CTRL	BIT(2)
> > -#define MIPI_CSIS_CMN_CTRL_RESET		BIT(1)
> > -#define MIPI_CSIS_CMN_CTRL_ENABLE		BIT(0)
> > -
> > -#define MIPI_CSIS_CMN_CTRL_LANE_NR_OFFSET	8
> > -#define MIPI_CSIS_CMN_CTRL_LANE_NR_MASK		(3 << 8)
> > +#define MIPI_CSIS_CMN_CTRL_SW_RESET		BIT(1)
> > +#define MIPI_CSIS_CMN_CTRL_CSI_EN		BIT(0)
> >
> >  /* CSIS clock control */
> ...

-- 
Regards,

Laurent Pinchart

