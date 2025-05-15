Return-Path: <linux-media+bounces-32616-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A6C81AB911D
	for <lists+linux-media@lfdr.de>; Thu, 15 May 2025 23:02:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 32DED4A3F48
	for <lists+linux-media@lfdr.de>; Thu, 15 May 2025 21:02:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C0FA72874E8;
	Thu, 15 May 2025 21:02:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fDnyW4Au"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78E381953AD;
	Thu, 15 May 2025 21:02:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747342943; cv=none; b=Ojc/7uAkzCl3jLLfE67aIlWGT/NqDrpNvEnJhAKrufIUKlfFbI8ikmBkZhy4+OPQkzEah/g68GxZ/3zzK50y/aiEYbSkGiNj/d4EMlPfy3+B3wmnOjHjF8eOr/AwBKSZu7zaZVrJ/qhWdZ/n/q15IIU90SXmbirFKbF4pxmDcgI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747342943; c=relaxed/simple;
	bh=RHt77bFv5evVuMMc+JyW0Hp/S0AcRu5oQI6stzOQhSk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=B9Rfn4zwqgR0oTTqezt9AF4zx7sNrgyB2Y22IqRF664xhtsn5p9wIHJ8mAIYvt86QmGPLvjQCpMtM+IgZBukF6i34azumGDgI9LybhBIFGVK9kByc1M3VlcLjPulg3SRbBizUsNyacV76uX4ApEEFRG578OfFh0Xf2tLrVRtksk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fDnyW4Au; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747342941; x=1778878941;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=RHt77bFv5evVuMMc+JyW0Hp/S0AcRu5oQI6stzOQhSk=;
  b=fDnyW4Au0E4tWsBW1LUeITZQEZvbi4N6TiTWD9OaPJllNNgvn1rThktQ
   45TiLRwp/YjP6lHgYgG87Q/NC3SSRgfY1yI3MbBU0j17k42JdG/gr5+hX
   htYl+zhX4vEiYcm2C5llZ6VPA8tEKQ5e1PeZMq/0Ww5pe9iJfPz0P9qqv
   1IpvxnmP07kvUOOX9tN7sb4IpkpKuwnW0fNUXAIgjjUyEkLRkOqh2yCLn
   XO15uF4vqICOniMJbIeckpjs39nTX2+upwr9YiwGP0Kw2SpwU0+8hwfh5
   aIjjJNtisftR4MB5xDpQIKELWLunIQDfPbS1jTHRpnzr2b2a23kORU8UI
   w==;
X-CSE-ConnectionGUID: XtmTXvtyR9uv/pnd6vdJlA==
X-CSE-MsgGUID: ZK2CK7L5RdmdYMI8zhMOGA==
X-IronPort-AV: E=McAfee;i="6700,10204,11434"; a="53104664"
X-IronPort-AV: E=Sophos;i="6.15,292,1739865600"; 
   d="scan'208";a="53104664"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 May 2025 14:02:20 -0700
X-CSE-ConnectionGUID: YopiuzxrTnyen6ZWe/Jx6w==
X-CSE-MsgGUID: Uo+G6v3DQgmdb7axSkzwYw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,292,1739865600"; 
   d="scan'208";a="169416201"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO svinhufvud) ([10.245.245.59])
  by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 May 2025 14:02:18 -0700
Date: Fri, 16 May 2025 00:02:15 +0300
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: git@apitzsch.eu, Ricardo Ribalda <ribalda@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 4/4] media: i2c: imx214: Remove hard-coded external
 clock frequency
Message-ID: <aCZWV6xj4vap5PFZ@svinhufvud>
References: <20250505-imx214_ccs_pll-v2-0-f50452061ff1@apitzsch.eu>
 <20250505-imx214_ccs_pll-v2-4-f50452061ff1@apitzsch.eu>
 <aBnHI1APgjfcj2xG@kekkonen.localdomain>
 <20250515085846.GR23592@pendragon.ideasonboard.com>
 <aCXWDnZhffjlt+8i@svinhufvud>
 <20250515130340.GC12492@pendragon.ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250515130340.GC12492@pendragon.ideasonboard.com>

Hi Laurent,

On Thu, May 15, 2025 at 03:03:40PM +0200, Laurent Pinchart wrote:
> On Thu, May 15, 2025 at 02:54:54PM +0300, Sakari Ailus wrote:
> > On Thu, May 15, 2025 at 10:58:46AM +0200, Laurent Pinchart wrote:
> > > On Tue, May 06, 2025 at 08:24:03AM +0000, Sakari Ailus wrote:
> > > > On Mon, May 05, 2025 at 11:05:56PM +0200, André Apitzsch via B4 Relay wrote:
> > > > > From: André Apitzsch <git@apitzsch.eu>
> > > > > 
> > > > > Instead rely on the rate set on the clock (using assigned-clock-rates
> > > > > etc.)
> > > > > 
> > > > > Signed-off-by: André Apitzsch <git@apitzsch.eu>
> > > > > ---
> > > > >  drivers/media/i2c/imx214.c | 6 ------
> > > > >  1 file changed, 6 deletions(-)
> > > > > 
> > > > > diff --git a/drivers/media/i2c/imx214.c b/drivers/media/i2c/imx214.c
> > > > > index 9e9be47394ec768a5b34d44b06b5bbb0988da5a1..c12996e294dccebb18c608254f1e0d14dc064423 100644
> > > > > --- a/drivers/media/i2c/imx214.c
> > > > > +++ b/drivers/media/i2c/imx214.c
> > > > > @@ -32,7 +32,6 @@
> > > > >  
> > > > >  #define IMX214_REG_FAST_STANDBY_CTRL	CCI_REG8(0x0106)
> > > > >  
> > > > > -#define IMX214_DEFAULT_CLK_FREQ	24000000
> > > > >  #define IMX214_DEFAULT_LINK_FREQ	600000000
> > > > >  /* Keep wrong link frequency for backward compatibility */
> > > > >  #define IMX214_DEFAULT_LINK_FREQ_LEGACY	480000000
> > > > > @@ -1405,11 +1404,6 @@ static int imx214_probe(struct i2c_client *client)
> > > > >  		return dev_err_probe(dev, PTR_ERR(imx214->xclk),
> > > > >  				     "failed to get xclk\n");
> > > > >  
> > > > > -	ret = clk_set_rate(imx214->xclk, IMX214_DEFAULT_CLK_FREQ);
> > > > > -	if (ret)
> > > > > -		return dev_err_probe(dev, ret,
> > > > > -				     "failed to set xclk frequency\n");
> > > > > -
> > > > 
> > > > Oops. I missed this is what the driver was doing already. Indeed, this is
> > > > one of the historic sensor drivers that do set the frequency in DT systems.
> > > > 
> > > > The driver never used the clock-frequency property and instead used a fixed
> > > > frequency. Changing the behaviour now could be problematic.
> > > > 
> > > > There are options here that I think we could do:
> > > > 
> > > > 1) use your v1 patch (4) which uses "clock-frequency" if it exists and
> > > > otherwise uses the default, fixed frequency or
> > > > 
> > > > 2) set the frequency only if the "clock-frequency" property exists. The DT
> > > > currently requires clock-frequency and the YAML conversion was done in 2020
> > > > whereas the driver is from 2018. If we do this, the clock-frequency should
> > > > be deprecated (or even removed from bingings).
> > > > 
> > > > I wonder what others think. Cc'd Laurent in any case.
> > > 
> > > Maybe I'm missing something, but I don't really see the issue here. The
> > > clock-frequency DT property is currently ignored, and this patch doesn't
> > > change that situation, does it ?
> > > 
> > > The change of behaviour here is related to the assigned-clock-rates
> > > property. If that property is specified today, it will set the clock
> > > rate, and the driver will override it to 24MHz right after. With this
> > > patch, the clock rate won't be overridden. I think the risk of
> > > regression is very low here, as I don't expect systems to set
> > > assigned-clock-rates in DT to a value different than 24MHz and expect
> > > the driver to override it.
> > 
> > If the DTS had assigned-clock-rates set correctly, then yes. How much can
> > we trust the older DTS did have that?
> 
> I am relatively confident that DT-based systems wouldn't have an
> assigned-clock-rates property with a frequency that doesn't match
> IMX214_DEFAULT_CLK_FREQ. The real question is whether or not I'm
> over-confident :-)

The assigned-clock stuff wasn't always there. But nowadays I guess a lot
of things in practice depends on it.

So I guess doing this should be fine then.

-- 
Sakari Ailus

