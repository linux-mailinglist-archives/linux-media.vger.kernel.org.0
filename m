Return-Path: <linux-media+bounces-28846-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 98C07A72E9D
	for <lists+linux-media@lfdr.de>; Thu, 27 Mar 2025 12:15:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8842118889AC
	for <lists+linux-media@lfdr.de>; Thu, 27 Mar 2025 11:15:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DA94D21019C;
	Thu, 27 Mar 2025 11:15:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ikzRHz8i"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B013A1B043C;
	Thu, 27 Mar 2025 11:15:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743074116; cv=none; b=pD+auu9nQS9NOkiVR9Yt+t82jqBI38XrpVqvMsukOWIZ+QDJP41K1wJML5Gr37jXKZhA2EsdtO92zRUWxQYogXfsERIzFWP8phoJEO4myRWTCd/r2YLgg0EklCMIFee7MYiYT8YjDvVwpetDb7sXewFIkbjw9CMe7FMA95UayVw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743074116; c=relaxed/simple;
	bh=2uDf9IAvebipTelbZqwvKpfbJf3eeOD3huz8PpZn0fE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aQM6BKndc/lHjXnf2MX0w+H9vbzvPIEv8qnvkpmscOYCMlVT5C2taU+6g282uPS0Alf56ZCsaGGIOJcZGbrXel2e0mpnAc1PItWHxLZiZWzNTSsyNzYO23bN6mdw3FyuMiA2FBq8o/BCmTvWQDmMPJJIubCYGmIqpeZi8sjy49E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ikzRHz8i; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1743074115; x=1774610115;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=2uDf9IAvebipTelbZqwvKpfbJf3eeOD3huz8PpZn0fE=;
  b=ikzRHz8i44rxifiCfi3ZjpLT9DI7R7t26NraNjltUsACQkorh+vEn7m8
   UaZohIAIz6XXTny7c3HwaNT6trJ2pjf4mleUZYAyjSfHogfuQTVspQ/kL
   bSk4MVbH48VAbRlrtvvzSTAW+Af3+WIaWx5Qw9b/gkzYH/CGv1AS1snYG
   RztABIxO3qr2vQ0tv4DVp5ekJdk9NtgD+BGN1y7PgbeIVmOXznhqG3VXX
   T+lSgUAHjYYblBIh1u5LuQMpqLR/LP0W7BbxV9pOjyixsGZTTdc3Mn5XV
   L9taSgReSoF/kyYFGRNIBqC364SbLm7+ffRoXdQzdh8c5RGpv6IcE2V/v
   A==;
X-CSE-ConnectionGUID: uzy/ZamuSlCGa+IzFS+H1Q==
X-CSE-MsgGUID: k6IV5vFeTb6KAIdIV0sxnw==
X-IronPort-AV: E=McAfee;i="6700,10204,11385"; a="44289437"
X-IronPort-AV: E=Sophos;i="6.14,280,1736841600"; 
   d="scan'208";a="44289437"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Mar 2025 04:14:33 -0700
X-CSE-ConnectionGUID: sCvCB3/DSESR0Eo8PTjdXQ==
X-CSE-MsgGUID: +Ux1168vRiamQdaR7ZNbWQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,280,1736841600"; 
   d="scan'208";a="130306039"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Mar 2025 04:14:29 -0700
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 2A21C1201BC;
	Thu, 27 Mar 2025 13:14:26 +0200 (EET)
Date: Thu, 27 Mar 2025 11:14:26 +0000
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Tarang Raval <tarang.raval@siliconsignals.io>
Cc: "kieran.bingham@ideasonboard.com" <kieran.bingham@ideasonboard.com>,
	"Shravan.Chippa@microchip.com" <Shravan.Chippa@microchip.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil@xs4all.nl>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Julien Massot <julien.massot@collabora.com>,
	Zhi Mao <zhi.mao@mediatek.com>,
	Mikhail Rudenko <mike.rudenko@gmail.com>,
	Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
	Luis Garcia <git@luigi311.com>,
	"linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 6/6] media: i2c: imx334: Enable runtime PM before
 sub-device registration
Message-ID: <Z-UzEnagFzWTnt_k@kekkonen.localdomain>
References: <20250310071751.151382-1-tarang.raval@siliconsignals.io>
 <20250310071751.151382-7-tarang.raval@siliconsignals.io>
 <Z-UjLSsATevtLT2k@kekkonen.localdomain>
 <PN3P287MB1829B0776EF3D34D0CA78CB18BA12@PN3P287MB1829.INDP287.PROD.OUTLOOK.COM>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <PN3P287MB1829B0776EF3D34D0CA78CB18BA12@PN3P287MB1829.INDP287.PROD.OUTLOOK.COM>

On Thu, Mar 27, 2025 at 11:02:33AM +0000, Tarang Raval wrote:
> Hi Sakari,
> 
> Thanks for the review.
> 
> > On Mon, Mar 10, 2025 at 12:47:48PM +0530, Tarang Raval wrote:
> > > Runtime PM is fully initialized before calling
> > > v4l2_async_register_subdev_sensor(). Moving the runtime PM initialization
> > > earlier prevents potential access to an uninitialized or powered-down device.
> > >
> > > Signed-off-by: Tarang Raval <tarang.raval@siliconsignals.io>
> > > ---
> > >  drivers/media/i2c/imx334.c | 5 +++--
> > >  1 file changed, 3 insertions(+), 2 deletions(-)
> > >
> > > diff --git a/drivers/media/i2c/imx334.c b/drivers/media/i2c/imx334.c
> > > index ffa39bb317f7..8964d60324e2 100644
> > > --- a/drivers/media/i2c/imx334.c
> > > +++ b/drivers/media/i2c/imx334.c
> > > @@ -1295,6 +1295,9 @@ static int imx334_probe(struct i2c_client *client)
> > >               goto error_handler_free;
> > >       }
> > >
> > > +     pm_runtime_set_active(imx334->dev);
> > > +     pm_runtime_enable(imx334->dev);
> > > +
> > >       ret = v4l2_async_register_subdev_sensor(&imx334->sd);
> > >       if (ret < 0) {
> > >               dev_err(imx334->dev,
> > > @@ -1302,8 +1305,6 @@ static int imx334_probe(struct i2c_client *client)
> > >               goto error_media_entity;
> > >       }
> > >
> > > -     pm_runtime_set_active(imx334->dev);
> > > -     pm_runtime_enable(imx334->dev);
> > 
> > Please also change error handling accordingly.
> 
> Oh, I missed that.
>   
> > Btw. the remove function calls pm_runtime_suspended() that does nothing
> > (use pm_runtime_set_suspended() instead). Could you add a patch to fix it?
>  
> Should I include these changes in this patch, or should I create a separate 
> patch for them.

A separate patch would be better as it could be cc'd to stable as well.
Probably this issue has been there all along...

-- 
Sakari Ailus

