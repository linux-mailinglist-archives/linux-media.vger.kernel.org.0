Return-Path: <linux-media+bounces-12929-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B9CB890359E
	for <lists+linux-media@lfdr.de>; Tue, 11 Jun 2024 10:19:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BAFFA1C21B4D
	for <lists+linux-media@lfdr.de>; Tue, 11 Jun 2024 08:19:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1C02A17334D;
	Tue, 11 Jun 2024 08:19:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="azgTWYMU"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B8DE18643;
	Tue, 11 Jun 2024 08:19:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718093968; cv=none; b=r22HsTu+FG+0VFg/FD5aDN1cgh+QoMcvYDmTQbFbkcpIGF2NOXz95s44OOxaqXNR3cUYh4gx6LWA1XPSPPboMWJHLB5zw7gyBu3V2E6lwxRV5LE9bufjm3nq3fLla2tyK449yxi3c2HVmyJweQj+30yZZgK0GPFX0st4f870c6w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718093968; c=relaxed/simple;
	bh=4CsqlWG3GWi6NQ7T5qx9u1MmnX3MRaWnL37ltfXOGk0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=u4Y1YcGOrA2VZSm42CURZTXAYqh/qFzLz50IJZU2AnCwfZRYVb3LJTX+azWSFeVZzh8DKUsoZ6D73dvFtNEFK92uN1dQ991/olbD7VkxUgIxeJsw3jVwoNDeQCNWHEf5cmMasEmPgrA/al8WEQR83arP95G55IjyLYd1FVt1ejI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=azgTWYMU; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718093968; x=1749629968;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=4CsqlWG3GWi6NQ7T5qx9u1MmnX3MRaWnL37ltfXOGk0=;
  b=azgTWYMU1/fxCWycMwaYe2HApq+QgjUGX2wo7YZZUJxb8QE21T2yUdeD
   ZHnXf4t9kOCAD0aBPWwNd+WLIdp6lcPeCOdj8cs7luM+slLoMWu37EgWR
   OO6RQRFcy43RJS5fByoSKj7XtkJ57mLJweAgS8Ej+9mVX7dkXC4e+ekba
   ZAcmSFeGTXk3ODfkgeFXndnh2bDTrd5oalQzbf31lwzERbKmN00T6Q2vJ
   12JPEc38HO7fS9+kcnq6M2HNx44Y5gobZoEKY38cTjrIxrFtwhy+cNMpg
   lDtAUTfO9wSKL3Motd7hwoTYsmQt5dimRJb97ZUTdj1jLmAtpF7GWVT6n
   g==;
X-CSE-ConnectionGUID: 6C+jZOUERjy6HPptJG9T6A==
X-CSE-MsgGUID: ZeAVmCISQq+lmEDit4K9jA==
X-IronPort-AV: E=McAfee;i="6600,9927,11099"; a="14915114"
X-IronPort-AV: E=Sophos;i="6.08,229,1712646000"; 
   d="scan'208";a="14915114"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jun 2024 01:19:27 -0700
X-CSE-ConnectionGUID: 6d1AAFPMT6+vCWnxuSctQw==
X-CSE-MsgGUID: MbD3fdBFSRyeY0XO5oy+zg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,229,1712646000"; 
   d="scan'208";a="43786868"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jun 2024 01:19:24 -0700
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 68CFC11F9C0;
	Tue, 11 Jun 2024 11:19:21 +0300 (EEST)
Date: Tue, 11 Jun 2024 08:19:21 +0000
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sylvain Petinot <sylvain.petinot@foss.st.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	linux-media@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/3] media: vgxy61: Add legacy compatible string
Message-ID: <ZmgIiaqJy1tWL4Yz@kekkonen.localdomain>
References: <20240610150815.228790-1-benjamin.mugnier@foss.st.com>
 <20240610150815.228790-3-benjamin.mugnier@foss.st.com>
 <b4de42ba-d884-44b1-9f0e-12f5818c6781@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b4de42ba-d884-44b1-9f0e-12f5818c6781@kernel.org>

Hi Krzysztof,

On Tue, Jun 11, 2024 at 08:47:25AM +0200, Krzysztof Kozlowski wrote:
> On 10/06/2024 17:08, Benjamin Mugnier wrote:
> > As the driver has been renamed from 'st-vgxy61' to 'vgxy61', its
> > compatible string has been updated to reflect this change. Therefore old
> > device trees will not work anymore.
> > Add the old driver name as another compatible name to handle the
> > retro compatibility.
> > 
> > Signed-off-by: Benjamin Mugnier <benjamin.mugnier@foss.st.com>
> > ---
> >  drivers/media/i2c/vgxy61.c | 5 +++++
> >  1 file changed, 5 insertions(+)
> > 
> > diff --git a/drivers/media/i2c/vgxy61.c b/drivers/media/i2c/vgxy61.c
> > index 30378e962016..ca3b43608dad 100644
> > --- a/drivers/media/i2c/vgxy61.c
> > +++ b/drivers/media/i2c/vgxy61.c
> > @@ -1867,6 +1867,11 @@ static void vgxy61_remove(struct i2c_client *client)
> >  }
> >  
> >  static const struct of_device_id vgxy61_dt_ids[] = {
> > +	{ .compatible = "st,vgxy61" },
> > +	/*
> > +	 * Previously the driver was named 'st-vgxy61' instead of simply
> > +	 * 'vgxy61', keep it for retrocompatibility purposes.
> 
> NAK.

Is that because the comment says "driver" rather than "device"?

Please try to express clearer what you'd expect from the patch author.

-- 
Kind regards,

Sakari Ailus

