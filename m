Return-Path: <linux-media+bounces-5543-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id C691C85D619
	for <lists+linux-media@lfdr.de>; Wed, 21 Feb 2024 11:53:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 680A0B236F0
	for <lists+linux-media@lfdr.de>; Wed, 21 Feb 2024 10:53:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B6BE33D38F;
	Wed, 21 Feb 2024 10:53:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="H7JPL6AH"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCAF23A1C1
	for <linux-media@vger.kernel.org>; Wed, 21 Feb 2024 10:53:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708512830; cv=none; b=B0I4xva/CgmAsSNiphmV2iDVUZcXb7DpNTXNDAerfqaDaSWMHMdjJPbw08hVvjTcD9wcsPxRHXoOBlmid+P1G5r7fgayA0DeTBuoT1AHDIuHXdPhjOcbzYHvkX75/Dazf//qpQzkgIMa36RAGIC2WIGFEALuFwDV4AIx07M9DDE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708512830; c=relaxed/simple;
	bh=3gTPSm5sLJ9BHHnGe6AGu0uicF6yEW2Pl+tR4NmzkNA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ihJ8mhjcKZhNyJbDFYDkuqffKtbMFcJBwmrPJKYwo38+4txf0MNxt8PCBiAlOgfBmwHALveRpPx5e2B4MU3odnDVZkFnwt1b1T+QS51D03Vrt8I0eAnhGp5uL/aC3eumMBKPn1q7MrsArte0t173UjMAGCfNCj2iKff57ydAvdk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=H7JPL6AH; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1708512829; x=1740048829;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=3gTPSm5sLJ9BHHnGe6AGu0uicF6yEW2Pl+tR4NmzkNA=;
  b=H7JPL6AHvbLEhuPOJ3H45IZZL2nNOy9x23nAk6Ne+UP7gU0R9b5rDkQP
   7GTajn4OYdGfb8vrATJo1dfs09i2qYRZbjMeQQiI8PJ4FDhjsAeuRO1/7
   lw2x0FNEwh2u1w2XWoxW/N3mOVtEnRNyEgdG6O1K1525Gvp6mhYesj1rL
   2o4rs4oTvcMbvO6NlXyUU9h/JjLrejI444MQpyUA+yDspPjKUhfZaOB3m
   WVawyNCma0Fugi58Y96AljLcqHSQ+skKe2O5i2rHfTiukQ4CEM9PGOrlw
   ttckf6F9l+2R1t34tLvn/LQXIQh74+9i3tf/Bk2YSxaDJM5amqfIqg0aU
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10990"; a="5619939"
X-IronPort-AV: E=Sophos;i="6.06,175,1705392000"; 
   d="scan'208";a="5619939"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Feb 2024 02:53:48 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,175,1705392000"; 
   d="scan'208";a="5114667"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Feb 2024 02:53:46 -0800
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 14AD711F855;
	Wed, 21 Feb 2024 12:53:43 +0200 (EET)
Date: Wed, 21 Feb 2024 10:53:43 +0000
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc: linux-media@vger.kernel.org, laurent.pinchart@ideasonboard.com
Subject: Re: [PATCH v2 23/29] media: vimc: Release resources on media device
 release
Message-ID: <ZdXWN4wPqT7XdK7K@kekkonen.localdomain>
References: <20231220103713.113386-1-sakari.ailus@linux.intel.com>
 <20231220103713.113386-24-sakari.ailus@linux.intel.com>
 <5f37ef41-151e-4320-8921-06e32a936818@xs4all.nl>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5f37ef41-151e-4320-8921-06e32a936818@xs4all.nl>

Hi Hans,

On Mon, Feb 05, 2024 at 04:02:24PM +0100, Hans Verkuil wrote:
> On 20/12/2023 11:37, Sakari Ailus wrote:
> > Release all the resources when the media device is related, moving away

s/related/released/

> > form the struct v4l2_device used for that purpose.
> 
> form -> from

Yes.

> 
> > 
> > Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> > ---
> >  drivers/media/test-drivers/vimc/vimc-core.c | 15 +++++++++------
> >  1 file changed, 9 insertions(+), 6 deletions(-)
> > 
> > diff --git a/drivers/media/test-drivers/vimc/vimc-core.c b/drivers/media/test-drivers/vimc/vimc-core.c
> > index af127476e920..3e59f8c256c7 100644
> > --- a/drivers/media/test-drivers/vimc/vimc-core.c
> > +++ b/drivers/media/test-drivers/vimc/vimc-core.c
> > @@ -264,13 +264,12 @@ static int vimc_add_subdevs(struct vimc_device *vimc)
> >  	return 0;
> >  }
> >  
> > -static void vimc_v4l2_dev_release(struct v4l2_device *v4l2_dev)
> > +static void vimc_mdev_release(struct media_device *mdev)
> >  {
> >  	struct vimc_device *vimc =
> > -		container_of(v4l2_dev, struct vimc_device, v4l2_dev);
> > +		container_of_const(mdev, struct vimc_device, mdev);
> 
> Why this change?

I changed the line already. There's no reason to continue using
container_of() instead of container_of_const() that takes const-ness into
account, too.

> 
> >  
> >  	vimc_release_subdevs(vimc);
> > -	media_device_cleanup(&vimc->mdev);
> >  	kfree(vimc->ent_devs);
> >  	kfree(vimc);
> >  }
> > @@ -336,6 +335,10 @@ static int vimc_register_devices(struct vimc_device *vimc)
> >  	return ret;
> >  }
> >  
> > +static const struct media_device_ops vimc_mdev_ops = {
> > +	.release = vimc_mdev_release,
> > +};
> > +
> >  static int vimc_probe(struct platform_device *pdev)
> >  {
> >  	const struct font_desc *font = find_font("VGA8x16");
> > @@ -369,12 +372,12 @@ static int vimc_probe(struct platform_device *pdev)
> >  	snprintf(vimc->mdev.bus_info, sizeof(vimc->mdev.bus_info),
> >  		 "platform:%s", VIMC_PDEV_NAME);
> >  	vimc->mdev.dev = &pdev->dev;
> > +	vimc->mdev.ops = &vimc_mdev_ops;
> >  	media_device_init(&vimc->mdev);
> >  
> >  	ret = vimc_register_devices(vimc);
> >  	if (ret) {
> > -		media_device_cleanup(&vimc->mdev);
> > -		kfree(vimc);
> > +		media_device_put(&vimc->mdev);
> >  		return ret;
> >  	}
> >  	/*
> > @@ -382,7 +385,6 @@ static int vimc_probe(struct platform_device *pdev)
> >  	 * if the registration fails, we release directly from probe
> >  	 */
> >  
> > -	vimc->v4l2_dev.release = vimc_v4l2_dev_release;
> >  	platform_set_drvdata(pdev, vimc);
> >  	return 0;
> >  }
> > @@ -397,6 +399,7 @@ static void vimc_remove(struct platform_device *pdev)
> >  	media_device_unregister(&vimc->mdev);
> >  	v4l2_device_unregister(&vimc->v4l2_dev);
> >  	v4l2_device_put(&vimc->v4l2_dev);
> > +	media_device_put(&vimc->mdev);
> >  }
> >  
> >  static void vimc_dev_release(struct device *dev)

-- 
Regards,

Sakari Ailus

