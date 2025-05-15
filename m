Return-Path: <linux-media+bounces-32586-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 19D00AB8560
	for <lists+linux-media@lfdr.de>; Thu, 15 May 2025 13:55:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 4FC0E7B4CA2
	for <lists+linux-media@lfdr.de>; Thu, 15 May 2025 11:53:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CDC99298C04;
	Thu, 15 May 2025 11:55:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PSen6O3u"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B33F4298271;
	Thu, 15 May 2025 11:55:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747310104; cv=none; b=eghalXlaoH3uhEUdNsCsGtEMfmjpYz0QdFFIb4paERUCWNSmStPgFeoRBtwyFI8Y5KGvsyH2dE/tsOn1l2W9ZSyvsiMBBh2ajgqfl9LW14HfCMyiD+BybqmK4YEJ1tvJqIFBNK7DUrPRL/E17lEXJUbaNgM2KlywI56OglgWREg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747310104; c=relaxed/simple;
	bh=darqkpwsQQkX0Z8eO2+7h0SOrywhnSb4/n44KEKi+9E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kNng8iUMUNSJG7AjDgavkjApq3/T9+XJ3xXbBXLceComPcRxZ/Ri0FJPHiW6pg+aLUlyzVw763i13qtTzQnE8os5Jxw2MaZpRceT8wqkWbpw5Jqb/SZJXCsTfGRXmCfuA5SRkd9oyH2849BQLPqTZIpwp32f5XtxKhDWswr3vV0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PSen6O3u; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747310103; x=1778846103;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=darqkpwsQQkX0Z8eO2+7h0SOrywhnSb4/n44KEKi+9E=;
  b=PSen6O3uM9+WQ2tcmO84K53RQR9Qkdm5bfyW5YL9hEJzwPXxZhL/VmOK
   +ssqKzHFBO6Okndo+ibyFNcZMsUcUo81E6lODL49gOp0D5IHWYs1NEtxu
   ar81lFuI6hl9c3FtNev/xu53WIh/a8fT5+R7SdITwsSH03I9BpxN5KAbw
   9km8jJw5HIAhaoexi0GYPSnpcjFMlSwlH+mpBTNIAs0cvqCtyaL0sA9Q+
   822vS4Z8t9DRnv1XX39Lx0O9+hyztTUSxxuhlTA6fFmXVgdDHwowqdQOP
   ux9sjJgPK24l4Je7qUn+OJsjVBoX+o8pMgKfy4OQXL/zq8TpG8FkhpIap
   w==;
X-CSE-ConnectionGUID: fxXi+EAcTSa5xakEuwMxyA==
X-CSE-MsgGUID: 7/ClBFLWQ0O8v8azB1tR+w==
X-IronPort-AV: E=McAfee;i="6700,10204,11434"; a="49400534"
X-IronPort-AV: E=Sophos;i="6.15,291,1739865600"; 
   d="scan'208";a="49400534"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 May 2025 04:55:03 -0700
X-CSE-ConnectionGUID: gmIRgYz3Q0iHz8sQS5qfvw==
X-CSE-MsgGUID: 219S3fH+RJ+HXMRnH0JUvw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,291,1739865600"; 
   d="scan'208";a="143112925"
Received: from sschumil-mobl2.ger.corp.intel.com (HELO svinhufvud) ([10.245.244.230])
  by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 May 2025 04:54:57 -0700
Date: Thu, 15 May 2025 14:54:54 +0300
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: git@apitzsch.eu, Ricardo Ribalda <ribalda@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 4/4] media: i2c: imx214: Remove hard-coded external
 clock frequency
Message-ID: <aCXWDnZhffjlt+8i@svinhufvud>
References: <20250505-imx214_ccs_pll-v2-0-f50452061ff1@apitzsch.eu>
 <20250505-imx214_ccs_pll-v2-4-f50452061ff1@apitzsch.eu>
 <aBnHI1APgjfcj2xG@kekkonen.localdomain>
 <20250515085846.GR23592@pendragon.ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250515085846.GR23592@pendragon.ideasonboard.com>

Hi Laurent,

On Thu, May 15, 2025 at 10:58:46AM +0200, Laurent Pinchart wrote:
> Hi Sakari,
> 
> On Tue, May 06, 2025 at 08:24:03AM +0000, Sakari Ailus wrote:
> > On Mon, May 05, 2025 at 11:05:56PM +0200, André Apitzsch via B4 Relay wrote:
> > > From: André Apitzsch <git@apitzsch.eu>
> > > 
> > > Instead rely on the rate set on the clock (using assigned-clock-rates
> > > etc.)
> > > 
> > > Signed-off-by: André Apitzsch <git@apitzsch.eu>
> > > ---
> > >  drivers/media/i2c/imx214.c | 6 ------
> > >  1 file changed, 6 deletions(-)
> > > 
> > > diff --git a/drivers/media/i2c/imx214.c b/drivers/media/i2c/imx214.c
> > > index 9e9be47394ec768a5b34d44b06b5bbb0988da5a1..c12996e294dccebb18c608254f1e0d14dc064423 100644
> > > --- a/drivers/media/i2c/imx214.c
> > > +++ b/drivers/media/i2c/imx214.c
> > > @@ -32,7 +32,6 @@
> > >  
> > >  #define IMX214_REG_FAST_STANDBY_CTRL	CCI_REG8(0x0106)
> > >  
> > > -#define IMX214_DEFAULT_CLK_FREQ	24000000
> > >  #define IMX214_DEFAULT_LINK_FREQ	600000000
> > >  /* Keep wrong link frequency for backward compatibility */
> > >  #define IMX214_DEFAULT_LINK_FREQ_LEGACY	480000000
> > > @@ -1405,11 +1404,6 @@ static int imx214_probe(struct i2c_client *client)
> > >  		return dev_err_probe(dev, PTR_ERR(imx214->xclk),
> > >  				     "failed to get xclk\n");
> > >  
> > > -	ret = clk_set_rate(imx214->xclk, IMX214_DEFAULT_CLK_FREQ);
> > > -	if (ret)
> > > -		return dev_err_probe(dev, ret,
> > > -				     "failed to set xclk frequency\n");
> > > -
> > 
> > Oops. I missed this is what the driver was doing already. Indeed, this is
> > one of the historic sensor drivers that do set the frequency in DT systems.
> > 
> > The driver never used the clock-frequency property and instead used a fixed
> > frequency. Changing the behaviour now could be problematic.
> > 
> > There are options here that I think we could do:
> > 
> > 1) use your v1 patch (4) which uses "clock-frequency" if it exists and
> > otherwise uses the default, fixed frequency or
> > 
> > 2) set the frequency only if the "clock-frequency" property exists. The DT
> > currently requires clock-frequency and the YAML conversion was done in 2020
> > whereas the driver is from 2018. If we do this, the clock-frequency should
> > be deprecated (or even removed from bingings).
> > 
> > I wonder what others think. Cc'd Laurent in any case.
> 
> Maybe I'm missing something, but I don't really see the issue here. The
> clock-frequency DT property is currently ignored, and this patch doesn't
> change that situation, does it ?
> 
> The change of behaviour here is related to the assigned-clock-rates
> property. If that property is specified today, it will set the clock
> rate, and the driver will override it to 24MHz right after. With this
> patch, the clock rate won't be overridden. I think the risk of
> regression is very low here, as I don't expect systems to set
> assigned-clock-rates in DT to a value different than 24MHz and expect
> the driver to override it.

If the DTS had assigned-clock-rates set correctly, then yes. How much can
we trust the older DTS did have that?

-- 
Regards,

Sakari Ailus

