Return-Path: <linux-media+bounces-3982-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id EFB8683658C
	for <lists+linux-media@lfdr.de>; Mon, 22 Jan 2024 15:35:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A56FD1F23D01
	for <lists+linux-media@lfdr.de>; Mon, 22 Jan 2024 14:35:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E6E9B3D54C;
	Mon, 22 Jan 2024 14:35:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="ZFwI+c30"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6AE03D544
	for <linux-media@vger.kernel.org>; Mon, 22 Jan 2024 14:35:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705934149; cv=none; b=elXhF9iH82kypocYY+JD1AkHR7hZtEG17jVsoDNxD3Wpt+PUH2I+FujdLJYVahgdr0AE0OI51XDhIGXPTEr9Vxlhcs50xcAOZ6ZOQR5nvRwzC4yZPLYY9mSSe7UmTXJXSKqzkXGVYCfKHZmQmnQQ/GQT0cC/oppemjOcmV3PiAk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705934149; c=relaxed/simple;
	bh=V9v4WCD8LgiLv5SiSpdvCEHGXGjeWt6HNx5p4VyEc3k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TAcRX3w1XjbTWkNCWer++3p4zW36sKstFYF/S13t8V7ryZrIWZzlsvHKWILTpd0xUI2bjoD9FIG4pNHX/sh4q5hU9MSOBypp08eH8cTUNqEAhIljVTKI4LLONjCBbwXcmDdkC3FI397+wKgCabsDry10MZW3uesUIeLI1L43Y20=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=ZFwI+c30; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (89-27-53-110.bb.dnainternet.fi [89.27.53.110])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 6FD5DC67;
	Mon, 22 Jan 2024 15:34:26 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1705934066;
	bh=V9v4WCD8LgiLv5SiSpdvCEHGXGjeWt6HNx5p4VyEc3k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ZFwI+c30CRfi7ASfW9vkMvl+0kW9hBWwLvO5F5aodDXca1rOJRUQv12EPFLVa3JWX
	 0afM/VnPU7pfjjXaW7KlBJCY/kOjn5+hiFkPbXc8lR/lYWCR8Sc+xOvgqYRkM7DRFp
	 QOP3n2rCI2XwgOA2Qo2eITJLyCuHhSrW0hhLblW4=
Date: Mon, 22 Jan 2024 16:35:43 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: "Chen, Jason Z" <jason.z.chen@intel.com>, linux-media@vger.kernel.org,
	andy.yeh@intel.com, kieran.bingham@ideasonboard.com,
	qingwu.zhang@intel.com, bingbu.cao@linux.intel.com
Subject: Re: [PATCH v2] media: ov08x40: Add Signal Integration Adjustments
 for specific project
Message-ID: <20240122143543.GB12845@pendragon.ideasonboard.com>
References: <20240122030220.3009357-1-jason.z.chen@intel.com>
 <Za5oTILGp-3sYVdq@kekkonen.localdomain>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <Za5oTILGp-3sYVdq@kekkonen.localdomain>

On Mon, Jan 22, 2024 at 01:06:20PM +0000, Sakari Ailus wrote:
> On Mon, Jan 22, 2024 at 11:02:20AM +0800, Chen, Jason Z wrote:
> > From: Jason Chen <jason.z.chen@intel.com>
> > 
> > Due to certain MIPI hardware designs using overly long cables, there
> > is a loss of signal strength, resulting in failed signal integration.
> > The patch includes changes to adjust the driving strength in the register
> > settings for a specific project.
> > 
> > Signed-off-by: Jason Chen <jason.z.chen@intel.com>
> > ---
> >  drivers/media/i2c/ov08x40.c | 15 +++++++++++++++
> >  1 file changed, 15 insertions(+)
> > 
> > diff --git a/drivers/media/i2c/ov08x40.c b/drivers/media/i2c/ov08x40.c
> > index 520ccd4aecf..ddcb4b6848b 100644
> > --- a/drivers/media/i2c/ov08x40.c
> > +++ b/drivers/media/i2c/ov08x40.c
> > @@ -160,6 +160,18 @@ static const struct ov08x40_reg mipi_data_rate_800mbps[] = {
> >  	{0x6002, 0x2e},
> >  };
> >  
> > +static const struct ov08x40_reg mipi_si_changed_regs[] = {
> > +	{0x481b, 0x2c}, /* HS Exit: Data Tx TEOT - reducing 8ns */
> > +	{0x4826, 0x42}, /* HS Entry: Data Tx TREOT - raising 8ns */
> > +	{0x4829, 0x54}, /* HS Exit: Data Tx TREOT - reducing 8ns */
> > +	{0x4885, 0x1f}, /* driving strength change */
> 
> We need a better say to control these: if you need to change this to make
> it work on one board, another board may well need different settings.
> 
> Probably the easiest way would be to figure out canonical, hardware
> independent configuration parameters and define them in DT bindings
> (Documentation/devicetree/bindings/media/video-interfaces.yaml), and add
> support for those in this driver.
> 
> DMI as such could be how you figure out which settings you need, but it
> should not be the task of a the sensor driver to do that.
> 
> Cc Laurent.

Agreed.

> > +};
> > +
> > +struct ov08x40_reg_list si_regs = {
> > +	.regs = mipi_si_changed_regs,
> > +	.num_of_regs = ARRAY_SIZE(mipi_si_changed_regs),
> > +};
> > +
> >  static const struct ov08x40_reg mode_3856x2416_regs[] = {
> >  	{0x5000, 0x5d},
> >  	{0x5001, 0x20},
> > @@ -2913,6 +2925,9 @@ static int ov08x40_start_streaming(struct ov08x40 *ov08x)
> >  		return ret;
> >  	}
> >  
> > +	/* Apply SI change to current project */
> > +	ov08x40_write_reg_list(ov08x, &si_regs);
> > +
> >  	/* Apply default values of current mode */
> >  	reg_list = &ov08x->cur_mode->reg_list;
> >  	ret = ov08x40_write_reg_list(ov08x, reg_list);

-- 
Regards,

Laurent Pinchart

