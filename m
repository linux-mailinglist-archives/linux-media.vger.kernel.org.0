Return-Path: <linux-media+bounces-22978-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EF829EA9CE
	for <lists+linux-media@lfdr.de>; Tue, 10 Dec 2024 08:42:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 339D3281DCE
	for <lists+linux-media@lfdr.de>; Tue, 10 Dec 2024 07:42:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4450322D4D5;
	Tue, 10 Dec 2024 07:42:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dYs32Ks4"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 765B422839A;
	Tue, 10 Dec 2024 07:42:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733816551; cv=none; b=fMtYkHDY1/YynfxsI/CdhOBWUgJ8d822durEsSCM+1EmVjbqpK2bw828sS6sN4WERgIRK+stn34RljCoC7+SLQuZ8hlKWMi/NNT87/ZbPCepgq+xCLx7AV/TesyqZfO0UPPDYjLxa8PdIGspNx0qdrm/J049Oraua3ToM0w56AM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733816551; c=relaxed/simple;
	bh=8hjTD94y9nFNvIoE44eb2J6vN/+FjBwV0spUClTOLto=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CupjfosjZJlzZ7u2mjOTB/SUrJE+2UXqLPwxcnY/b3nx0Mc6HY21qFaL3RW/cjGob77Vz1CIAu7R3R5rWNEV036JAk8I+GQgxuSj1Xpw4bxS4bE1pO/ke/f/I5Xkdlg4fQgWwustCY+zaTsp2PxLQHZjZ/zJcM/y9+PosaE2DPk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dYs32Ks4; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733816550; x=1765352550;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=8hjTD94y9nFNvIoE44eb2J6vN/+FjBwV0spUClTOLto=;
  b=dYs32Ks4kxEyPe4gJcRAOo6x4FWE6CxZW6xVbWDxuQsZ4zYOoYT9Gz13
   0LJ4+Gn2Qt06azlYG+W2zXV2qAM5HUrRPaMvc5wttKMv5rzd4RPfKTDnX
   V3UCpTQK4aFPEwr0t9YX9erY02DwRwnL7xylFDLnCRtpj3nHcwNAX34Oy
   XrpYQNM1rVoiUF+zQHf1hvcji+uNNCxj/IUjF5FAN74AZYqgunukpJE34
   4NiSjRh3zUUk+ANYGTEJPtwyNf3hOn10OYAci7hdNg/BJ0Wbh7nGy1Ie3
   7zziV6aB2N77oSa2O6zbDTk/f3Dkpr6iZUrilJm/nz6YTsmdfWKvuTK8F
   g==;
X-CSE-ConnectionGUID: /WahzK1rTDGtTN/LvNfTqA==
X-CSE-MsgGUID: dl9O4c0dSw6Vtxg4IJ+MUw==
X-IronPort-AV: E=McAfee;i="6700,10204,11281"; a="44820329"
X-IronPort-AV: E=Sophos;i="6.12,221,1728975600"; 
   d="scan'208";a="44820329"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Dec 2024 23:42:27 -0800
X-CSE-ConnectionGUID: k/NybUJjR3qiT+0izjIHEw==
X-CSE-MsgGUID: IBChTmGvTRiqnl3u8X09KA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,221,1728975600"; 
   d="scan'208";a="95772494"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Dec 2024 23:42:24 -0800
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 66BA911F71F;
	Tue, 10 Dec 2024 09:42:21 +0200 (EET)
Date: Tue, 10 Dec 2024 07:42:21 +0000
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Jai Luthra <jai.luthra@ideasonboard.com>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH v4 04/15] media: i2c: ds90ub960: Fix logging SP & EQ
 status only for UB9702
Message-ID: <Z1fw3YPN3F8aeUeW@kekkonen.localdomain>
References: <20241206-ub9xx-fixes-v4-0-466786eec7cc@ideasonboard.com>
 <20241206-ub9xx-fixes-v4-4-466786eec7cc@ideasonboard.com>
 <Z1a0OiRDw92o1w6_@kekkonen.localdomain>
 <e53c8964-5373-4c1f-ad48-69a474a997fb@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e53c8964-5373-4c1f-ad48-69a474a997fb@ideasonboard.com>

Huomenta,

On Tue, Dec 10, 2024 at 09:38:30AM +0200, Tomi Valkeinen wrote:
> Hi,
> 
> On 09/12/2024 11:11, Sakari Ailus wrote:
> > Huomenta,
> > 
> > On Fri, Dec 06, 2024 at 10:26:40AM +0200, Tomi Valkeinen wrote:
> > > UB9702 does not have SP and EQ registers, but the driver uses them in
> > > log_status(). Fix this by separating the SP and EQ related log_status()
> > > work into a separate function (for clarity) and calling that function
> > > only for UB960.
> > > 
> > > Cc: stable@vger.kernel.org
> > > Fixes: afe267f2d368 ("media: i2c: add DS90UB960 driver")
> > > Reviewed-by: Jai Luthra <jai.luthra@ideasonboard.com>
> > > Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
> > > ---
> > >   drivers/media/i2c/ds90ub960.c | 90 ++++++++++++++++++++++++-------------------
> > >   1 file changed, 50 insertions(+), 40 deletions(-)
> > > 
> > > diff --git a/drivers/media/i2c/ds90ub960.c b/drivers/media/i2c/ds90ub960.c
> > > index 24198b803eff..94c8acf171b4 100644
> > > --- a/drivers/media/i2c/ds90ub960.c
> > > +++ b/drivers/media/i2c/ds90ub960.c
> > > @@ -2950,6 +2950,54 @@ static const struct v4l2_subdev_pad_ops ub960_pad_ops = {
> > >   	.set_fmt = ub960_set_fmt,
> > >   };
> > > +static void ub960_log_status_ub960_sp_eq(struct ub960_data *priv,
> > > +					 unsigned int nport)
> > > +{
> > > +	struct device *dev = &priv->client->dev;
> > > +	u8 eq_level;
> > > +	s8 strobe_pos;
> > > +	u8 v = 0;
> > > +
> > > +	/* Strobe */
> > > +
> > > +	ub960_read(priv, UB960_XR_AEQ_CTL1, &v);
> > 
> > How about adding __must_check to the ub960_read()?
> 
> Actually, this is just moving code around (behind an if), so I'd rather not
> add more to this patch, especially as this is a fix.
> 
> We'll add the error handling separately on top.

Works for me.

-- 
Sakari Ailus

