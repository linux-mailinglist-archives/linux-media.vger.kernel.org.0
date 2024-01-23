Return-Path: <linux-media+bounces-4098-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EA6C683935F
	for <lists+linux-media@lfdr.de>; Tue, 23 Jan 2024 16:44:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 63E7AB25E53
	for <lists+linux-media@lfdr.de>; Tue, 23 Jan 2024 15:44:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4C67960871;
	Tue, 23 Jan 2024 15:35:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="BdrdgMHB"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B8E86086B;
	Tue, 23 Jan 2024 15:35:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706024155; cv=none; b=VNFOovCOlZNnw1JHEiWzJITSud/asdu1VjLAt8E9RB8jFI3zMh5UA/UtnwOpmUEPm/HoyUx6R/xIyuib+TZYA42NQ6u3+TFAkoxVoUIe5KeWcQjVv2biOnFIGBYFMLvYOBW93rIIMR0JQ343m1LvalwVmd04E/939urHuHt1TD4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706024155; c=relaxed/simple;
	bh=XLy4dtWyxyJMIHi5EauDFT1DpO0TRdbcoXCZfnL4DmI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bJQ/GTcGj6ZRi2EzwRgSMeGacm6+ZUXmhwOhz2IQH/FzGGSi2h4z0H0OdmUPrK216D323rTeRyssGUk7x3om9T18FugkFYS+vKzrL1nc18t6HsV7zjE6nO/O872tvGzXD3mHJ1N1UnMsPRpUexn5Soc8rnWh38w8Z6gp97UixoA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=BdrdgMHB; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (89-27-53-110.bb.dnainternet.fi [89.27.53.110])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 46BDC1B9A;
	Tue, 23 Jan 2024 16:34:38 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1706024078;
	bh=XLy4dtWyxyJMIHi5EauDFT1DpO0TRdbcoXCZfnL4DmI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=BdrdgMHBqsUQqliQXYm/fLPQZV4Be8XHWiNET6YQT1mpZa0Wms4GFZp2QbYCO9dV/
	 r9ODOOS9RYH5EqwuW46Rh4U3YWYS9Agiko4fnENsubMoARbHskRwSuVL4JdQzfM5xm
	 g+pdf3Kkrj12nLPgK15U9lmmmG5Q2p4cVgX4fMxQ=
Date: Tue, 23 Jan 2024 17:35:50 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	linux-media@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Biju Das <biju.das.au@gmail.com>, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 4/4] media: platform: rzg2l-cru: rzg2l-video: Restructure
 clk handling
Message-ID: <20240123153550.GT10679@pendragon.ideasonboard.com>
References: <20240123115821.292787-1-biju.das.jz@bp.renesas.com>
 <20240123115821.292787-5-biju.das.jz@bp.renesas.com>
 <Za-u9VO2OuY6vhT8@kekkonen.localdomain>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Za-u9VO2OuY6vhT8@kekkonen.localdomain>

On Tue, Jan 23, 2024 at 12:20:05PM +0000, Sakari Ailus wrote:
> Hi Biju,
> 
> Thanks for the patch.
> 
> On Tue, Jan 23, 2024 at 11:58:21AM +0000, Biju Das wrote:
> > As per section 35.3.1 Starting Reception for the MIPI CSI-2 Input on the
> > latest hardware manual(R01UH0914EJ0140 Rev.1.40) it is mentioned that
> > we need to supply all CRU clks and  we need to disable the vclk before
> > enabling the LINK reception and enable the vclk after enabling the link
> > Reception. So restructure clk handling as per the HW manual.
> > 
> > Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> > ---
> >  .../platform/renesas/rzg2l-cru/rzg2l-cru.h    |  3 -
> >  .../platform/renesas/rzg2l-cru/rzg2l-csi2.c   | 55 ++++++++++++---
> >  .../platform/renesas/rzg2l-cru/rzg2l-ip.c     | 15 +---
> >  .../platform/renesas/rzg2l-cru/rzg2l-video.c  | 69 ++++++++-----------
> >  4 files changed, 74 insertions(+), 68 deletions(-)
> > 
> > diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru.h b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru.h
> > index 811603f18af0..a5a99b004322 100644
> > --- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru.h
> > +++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru.h
> > @@ -133,9 +133,6 @@ struct rzg2l_cru_dev {
> >  	struct v4l2_pix_format format;
> >  };
> >  
> > -void rzg2l_cru_vclk_unprepare(struct rzg2l_cru_dev *cru);
> > -int rzg2l_cru_vclk_prepare(struct rzg2l_cru_dev *cru);
> > -
> >  int rzg2l_cru_start_image_processing(struct rzg2l_cru_dev *cru);
> >  void rzg2l_cru_stop_image_processing(struct rzg2l_cru_dev *cru);
> >  
> > diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-csi2.c b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-csi2.c
> > index c4609da9bf1a..f4c5cbb30bc9 100644
> > --- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-csi2.c
> > +++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-csi2.c
> > @@ -6,6 +6,7 @@
> >   */
> >  
> >  #include <linux/clk.h>
> > +#include <linux/clk-provider.h>
> >  #include <linux/delay.h>
> >  #include <linux/interrupt.h>
> >  #include <linux/io.h>
> > @@ -108,6 +109,7 @@ struct rzg2l_csi2 {
> >  	struct reset_control *presetn;
> >  	struct reset_control *cmn_rstb;
> >  	struct clk *sysclk;
> > +	struct clk *vclk;
> >  	unsigned long vclk_rate;
> >  
> >  	struct v4l2_subdev subdev;
> > @@ -361,10 +363,11 @@ static int rzg2l_csi2_dphy_setting(struct v4l2_subdev *sd, bool on)
> >  	return rzg2l_csi2_dphy_disable(csi2);
> >  }
> >  
> > -static void rzg2l_csi2_mipi_link_enable(struct rzg2l_csi2 *csi2)
> > +static int rzg2l_csi2_mipi_link_enable(struct rzg2l_csi2 *csi2)
> >  {
> >  	unsigned long vclk_rate = csi2->vclk_rate / HZ_PER_MHZ;
> >  	u32 frrskw, frrclk, frrskw_coeff, frrclk_coeff;
> > +	int ret, count;
> >  
> >  	/* Select data lanes */
> >  	rzg2l_csi2_write(csi2, CSI2nMCT0, CSI2nMCT0_VDLN(csi2->lanes));
> > @@ -386,11 +389,40 @@ static void rzg2l_csi2_mipi_link_enable(struct rzg2l_csi2 *csi2)
> >  	rzg2l_csi2_write(csi2, CSI2nDTEL, 0xf778ff0f);
> >  	rzg2l_csi2_write(csi2, CSI2nDTEH, 0x00ffff1f);
> >  
> > +	clk_disable_unprepare(csi2->vclk);
> > +	for (count = 0; count < 5; count++) {
> > +		if (!(__clk_is_enabled(csi2->vclk)))
> > +			break;
> > +		usleep_range(10, 20);
> > +	}
> > +
> > +	if (count == 5) {
> > +		dev_err(csi2->dev, "Timeout, not able to turn OFF vclk\n");
> > +		return -ETIMEDOUT;
> > +	}
> 
> It'd be nice to have a CCF function to do this. Either way, you can use
> read_poll_timeout().

I would have sworn that clk_disable_unprepare() is synchronous, and
would have sworn even stronger for clk_prepare_enable(). What's going on
here, is there really a delay ? It sounds like a bug in the clock
driver.

> > +
> >  	/* Enable LINK reception */
> >  	rzg2l_csi2_write(csi2, CSI2nMCT3, CSI2nMCT3_RXEN);
> > +
> > +	ret = clk_prepare_enable(csi2->vclk);
> > +	if (ret)
> > +		return ret;
> > +
> > +	for (count = 0; count < 5; count++) {
> > +		if (__clk_is_enabled(csi2->vclk))
> > +			break;
> > +		usleep_range(10, 20);
> > +	}
> > +
> > +	if (count == 5) {
> > +		dev_err(csi2->dev, "Timeout, not able to turn ON vclk\n");
> > +		return -ETIMEDOUT;
> > +	}
> > +
> > +	return 0;
> >  }
> >  

-- 
Regards,

Laurent Pinchart

