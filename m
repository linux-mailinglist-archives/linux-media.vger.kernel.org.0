Return-Path: <linux-media+bounces-4826-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A7A2184CCF5
	for <lists+linux-media@lfdr.de>; Wed,  7 Feb 2024 15:38:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 0E6D3B23CA6
	for <lists+linux-media@lfdr.de>; Wed,  7 Feb 2024 14:38:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2A7D87E57A;
	Wed,  7 Feb 2024 14:38:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="jKRKYl40"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C46762E3EB
	for <linux-media@vger.kernel.org>; Wed,  7 Feb 2024 14:38:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707316686; cv=none; b=I2LbO9/kK0ObWE8sIlH8H0lVAVEx8J5bS9+HyHPzGJ9bA1ntOUbyti3wagRQEMDXWMhvzWKQNjL8B7LIcbOgCS5XlY6iafBpvm0sPBAEQO2cNZlFlIS5uqnw+KB4W9GcKxoCpSP/i3mYrBO22LNadJl4ZBeHsknVJTSMmga1Ocs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707316686; c=relaxed/simple;
	bh=DeLJG9dt6j8EfaBMeJb21rN71OhTniUucppy0qQG+kk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Fv4Lrvkhcc1le+iLnMElAQ/2BoO/7Kf5RkU3GiSCfth05csOe0wBjFi+OjX9vArpc1SZFxzmAIkhPWpjb427zIVj2YFeCRZXiwyMYb8264/XpOMcxO4C4rsf62ddATUml9AGrG9zhVXIZMezKVvo2w/Kqzmmr2mYBGNuuo7wXYU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=jKRKYl40; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (117.145-247-81.adsl-dyn.isp.belgacom.be [81.247.145.117])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 4A816975;
	Wed,  7 Feb 2024 15:36:39 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1707316599;
	bh=DeLJG9dt6j8EfaBMeJb21rN71OhTniUucppy0qQG+kk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jKRKYl40GKEnfDHC/eIHLLABFX8yP5CTg+RntNEvCZ7QyfztfvDEHNOkC2we1K0vN
	 zeUsZPN8Pv63BiQxHoXRAhvsfercOq7Y3/YYgzLZE9GXDBXta1ViG4wVEss+PQ20V7
	 MVUZUIRB53chykACIvSp+DEbePu4k1FdwIIiBtA0=
Date: Wed, 7 Feb 2024 16:38:05 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
	linux-media@vger.kernel.org
Subject: Re: [PATCH v2 23/29] media: vimc: Release resources on media device
 release
Message-ID: <20240207143805.GT23702@pendragon.ideasonboard.com>
References: <20231220103713.113386-1-sakari.ailus@linux.intel.com>
 <20231220103713.113386-24-sakari.ailus@linux.intel.com>
 <5f37ef41-151e-4320-8921-06e32a936818@xs4all.nl>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <5f37ef41-151e-4320-8921-06e32a936818@xs4all.nl>

On Mon, Feb 05, 2024 at 04:02:24PM +0100, Hans Verkuil wrote:
> On 20/12/2023 11:37, Sakari Ailus wrote:
> > Release all the resources when the media device is related, moving away

s/related/released/

> > form the struct v4l2_device used for that purpose.
> 
> form -> from

Please explain *why* in the commit message.

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

Laurent Pinchart

