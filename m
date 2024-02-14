Return-Path: <linux-media+bounces-5170-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 735BE855451
	for <lists+linux-media@lfdr.de>; Wed, 14 Feb 2024 21:49:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A1DA11C2182E
	for <lists+linux-media@lfdr.de>; Wed, 14 Feb 2024 20:49:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1C52D13B785;
	Wed, 14 Feb 2024 20:49:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZqyHzEe9"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3835128384;
	Wed, 14 Feb 2024 20:49:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707943777; cv=none; b=g47E86NADDZ4t7zy0GY4fNwMPZSaUpbXrqFxTcl+IK+WdywE/4BAekzihSjeo6Afe5qz+Xs+EkIF7djzrlvfShfgFlpHw/RJxmPK6VtxhIhj0URxZaWwCgirrExTZp9YE6HY7pMKfwGIVYzlOcrPcxO04SMqNVb8z1QBEMii4cE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707943777; c=relaxed/simple;
	bh=bwvF8W9PD7INh1tOMj8sB5rkwYbeQsKwTsXKdnU2Fr0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FMwk6U8X6zRlOIyK+RjLukDvH9FAi0ckrPI8bOiwN2KaY9rnZkQHLbsQ4z30Whgxkax2xhntLJd4FhjLZFtZGBUora8NTUoYIP36CPv49Z890EChDZUFXQti6UVjzJCSPAfnTBTzR6xH/MUbD5Y7BzOLlNvBuz7dFTszRolkDLc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZqyHzEe9; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1707943776; x=1739479776;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=bwvF8W9PD7INh1tOMj8sB5rkwYbeQsKwTsXKdnU2Fr0=;
  b=ZqyHzEe9RlxXdKy+huj/thJT3Xr6TOnFVs13BYWrgciQBNR7I9WxO/J4
   +N8ozVxKOPkZg2bjOHZ/EWjjhHAnNVXOjdTeMsZv+JTIJWgAgBtaJeWwL
   fFsVIFDp0XE8RY0PP3UG053FO84mLVkeRq1+fQ/0PSU1xU0YAuuYuDUct
   CNMwgIgD5r0WmR4mTmY3fo2bssqbRPt2U98oMxMmoARDdUFktP/sI14LK
   WDCqyWjQKGPL0Vx+SyxABAzySODeOG+Xc+zCjF+vzT9UOh6H2nk5+pDYS
   i4BsZAE0EKpX16qbdQrL9O/kPCdoIpx+mWL2zzWfK5/g+B7BX2N28KjfQ
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10984"; a="2154697"
X-IronPort-AV: E=Sophos;i="6.06,160,1705392000"; 
   d="scan'208";a="2154697"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Feb 2024 12:49:35 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,160,1705392000"; 
   d="scan'208";a="34127165"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Feb 2024 12:49:33 -0800
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id F188611F77C;
	Wed, 14 Feb 2024 22:49:29 +0200 (EET)
Date: Wed, 14 Feb 2024 20:49:29 +0000
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: Wolfram Sang <wsa@kernel.org>, "biju.das.au" <biju.das.au@gmail.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	"linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>
Subject: Re: [PATCH 1/2] media: i2c: ov5645: Move the register 0x3008 from
 ov5645_global_init_setting
Message-ID: <Zc0nWfwFFGhqxHQq@kekkonen.localdomain>
References: <20240213140240.159057-1-biju.das.jz@bp.renesas.com>
 <20240213140240.159057-2-biju.das.jz@bp.renesas.com>
 <ZcvsyRfVwC0aJ5fb@shikoro>
 <CADT+UeDNFBTvRMHd4_J85Yz0RYED4ioG9wjUe4C0X4x6LzVD9w@mail.gmail.com>
 <Zcx6Ty2tu_ZGdURj@ninjato>
 <TYCPR01MB11269CC8B2EAB564154C829A2864E2@TYCPR01MB11269.jpnprd01.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <TYCPR01MB11269CC8B2EAB564154C829A2864E2@TYCPR01MB11269.jpnprd01.prod.outlook.com>

Hi Biju,

On Wed, Feb 14, 2024 at 08:25:16PM +0000, Biju Das wrote:
> Hi Wolfram,
> 
> Thanks for the feedback.
> 
> > -----Original Message-----
> > From: Wolfram Sang <wsa@kernel.org>
> > Sent: Wednesday, February 14, 2024 8:31 AM
> > Subject: Re: [PATCH 1/2] media: i2c: ov5645: Move the register 0x3008 from
> > ov5645_global_init_setting
> > 
> > Hi Biju,
> > 
> > > I think it is different here. That 1 msec is delay associated with
> > > applying hardware power see [1]
> > 
> > Okay, ack.
> > 
> > > I will restore it.
> > 
> > Thanks!
> > 
> > I had meanwhile another thought. What if we kind of merge the two patches,
> > so the outcome is basically this:
> > 
> > In ov5645_set_register_array:
> > 
> > 	If (settings->reg == 0x3008 && settings->val == 0x82)
> > 		usleep_range(1000, 2000)
> > 
> > ?
> > 
> > Then, we don't need to split the array and we are also future proof if we
> > ever need to set the reset bit again somewhere else.
> > 
> > Bonus points for replacing 0x82 with a define :)
> > 
> > What do you think?
> 
> 
> OK, this will do check for all other registers.
> 
> But from your power down clue and checking ov5640.c
> Looks like there are 2 registers changes values after writing.
> 
> [1] 0x3008, 0x82-->0x80
> [2] 0x0601, 0x02-->0x00
> 
> I think [1] is soft reset based on ov5640. Since there is a gpio based
> hardware reset available, we can safely remove soft reset[1] and like
> ov5640.c, if there is no gpio for reset, then do the soft reset[1].

I guess that would work. My understanding is that hard reset control is
mandatory for the device, so there really should be no need for soft reset
in the driver.

> 
> 
> Then add 1msec delay for power down/up(0x3008: 0x42,0x02) and 0x0601
> registers.
> 
> With this looks like the Camera works ok @400kHz.
> 
> The plans is to add a u8 variable for delay and enable delays for the above registers
> and add a check like below
> 
> static int ov5645_set_register_array(struct ov5645 *ov5645,
> 				     const struct reg_value *settings,
> 				     unsigned int num_settings)
> {
> 	unsigned int i;
> 	int ret;
> 
> 	for (i = 0; i < num_settings; ++i, ++settings) {
> 		ret = ov5645_write_reg(ov5645, settings->reg, settings->val);
> 		if (ret < 0)
> 			return ret;
> 
> 		if (settings->delay_ms)
> 			usleep_range(1000 * settings->delay_ms, 2 * 1000 * settings->delay_ms);

I'd prefer checking the register address in the write function instead of
this if you really need it. But it seems you don't.

> 	}
> 
> 	return 0;
> }
> 
> Please share your thoughts on this approach.
> 
> Cheers,
> Biju

-- 
Regards,

Sakari Ailus

