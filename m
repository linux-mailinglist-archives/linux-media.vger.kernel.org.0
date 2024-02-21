Return-Path: <linux-media+bounces-5546-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EC1EF85D661
	for <lists+linux-media@lfdr.de>; Wed, 21 Feb 2024 12:03:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A5A3628483E
	for <lists+linux-media@lfdr.de>; Wed, 21 Feb 2024 11:03:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0E00C3FE25;
	Wed, 21 Feb 2024 11:02:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="CJj19P9X"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55C2A3FB3A
	for <linux-media@vger.kernel.org>; Wed, 21 Feb 2024 11:02:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708513348; cv=none; b=fKFkp8OgGvecMTA7RvKPUGH27t7tzVw+gajJd0hX26XrE9LqXp/R96dpWj8p1ukNpIS2M+udRb25EyoocCIgCZqlWMjSRvp+vrOINcg/ox8oCBaeKhOjIPnkTSEHrQ2jtx+p1RqvWgZM3v62Z4iZxJKSlLhFv0YUFfLKeFU35eQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708513348; c=relaxed/simple;
	bh=H2Mn5OOcGtUn96uWgf21jgL0NYwLNeOoQW1NNGiOuhA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JAV9p7SeWUfMPryhknulP56duaGoJEFogA/kE2SI18xz4LQkqusLDaePJhgbi4948rmBJTA8Yss2vqsdqlKX2KMC51Y0RmCRfq9BPVwljCadouw2HH1x/Q+EOmcNa9JT0Deigv5cSrVYTEGFibqozzMUhuoRb6WBQEF6gX8w49M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=CJj19P9X; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (89-27-53-110.bb.dnainternet.fi [89.27.53.110])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id D20203F1;
	Wed, 21 Feb 2024 12:02:11 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1708513332;
	bh=H2Mn5OOcGtUn96uWgf21jgL0NYwLNeOoQW1NNGiOuhA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=CJj19P9XvDJIWRl1maxvsJwT/4vtQlNUu/uqeQ5ln7JUAn7c/vim9P4PSN2gG5FtK
	 0h9+fyt5eDLlwlxXRyS3tW3+eJ8gm02pUyz7dJ8YEqydyh6n0YafLfCh/3nUb8yIaT
	 RypPvY2gD1S7MHEZ/Y97T0wruiorGzm9BWsvxcLY=
Date: Wed, 21 Feb 2024 13:02:22 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Hans Verkuil <hverkuil-cisco@xs4all.nl>, linux-media@vger.kernel.org
Subject: Re: [PATCH v2 23/29] media: vimc: Release resources on media device
 release
Message-ID: <20240221110222.GB31348@pendragon.ideasonboard.com>
References: <20231220103713.113386-1-sakari.ailus@linux.intel.com>
 <20231220103713.113386-24-sakari.ailus@linux.intel.com>
 <5f37ef41-151e-4320-8921-06e32a936818@xs4all.nl>
 <ZdXWN4wPqT7XdK7K@kekkonen.localdomain>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <ZdXWN4wPqT7XdK7K@kekkonen.localdomain>

On Wed, Feb 21, 2024 at 10:53:43AM +0000, Sakari Ailus wrote:
> Hi Hans,
> 
> On Mon, Feb 05, 2024 at 04:02:24PM +0100, Hans Verkuil wrote:
> > On 20/12/2023 11:37, Sakari Ailus wrote:
> > > Release all the resources when the media device is related, moving away
> 
> s/related/released/
> 
> > > form the struct v4l2_device used for that purpose.
> > 
> > form -> from
> 
> Yes.
> 
> > 
> > > 
> > > Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> > > ---
> > >  drivers/media/test-drivers/vimc/vimc-core.c | 15 +++++++++------
> > >  1 file changed, 9 insertions(+), 6 deletions(-)
> > > 
> > > diff --git a/drivers/media/test-drivers/vimc/vimc-core.c b/drivers/media/test-drivers/vimc/vimc-core.c
> > > index af127476e920..3e59f8c256c7 100644
> > > --- a/drivers/media/test-drivers/vimc/vimc-core.c
> > > +++ b/drivers/media/test-drivers/vimc/vimc-core.c
> > > @@ -264,13 +264,12 @@ static int vimc_add_subdevs(struct vimc_device *vimc)
> > >  	return 0;
> > >  }
> > >  
> > > -static void vimc_v4l2_dev_release(struct v4l2_device *v4l2_dev)
> > > +static void vimc_mdev_release(struct media_device *mdev)
> > >  {
> > >  	struct vimc_device *vimc =
> > > -		container_of(v4l2_dev, struct vimc_device, v4l2_dev);
> > > +		container_of_const(mdev, struct vimc_device, mdev);
> > 
> > Why this change?
> 
> I changed the line already. There's no reason to continue using
> container_of() instead of container_of_const() that takes const-ness into
> account, too.

It should then be at least mentioned in the commit message.

Any plan to switch to container_of_const() globally in the subsystem ?

> > >  
> > >  	vimc_release_subdevs(vimc);
> > > -	media_device_cleanup(&vimc->mdev);
> > >  	kfree(vimc->ent_devs);
> > >  	kfree(vimc);
> > >  }
> > > @@ -336,6 +335,10 @@ static int vimc_register_devices(struct vimc_device *vimc)
> > >  	return ret;
> > >  }
> > >  
> > > +static const struct media_device_ops vimc_mdev_ops = {
> > > +	.release = vimc_mdev_release,
> > > +};
> > > +
> > >  static int vimc_probe(struct platform_device *pdev)
> > >  {
> > >  	const struct font_desc *font = find_font("VGA8x16");
> > > @@ -369,12 +372,12 @@ static int vimc_probe(struct platform_device *pdev)
> > >  	snprintf(vimc->mdev.bus_info, sizeof(vimc->mdev.bus_info),
> > >  		 "platform:%s", VIMC_PDEV_NAME);
> > >  	vimc->mdev.dev = &pdev->dev;
> > > +	vimc->mdev.ops = &vimc_mdev_ops;
> > >  	media_device_init(&vimc->mdev);
> > >  
> > >  	ret = vimc_register_devices(vimc);
> > >  	if (ret) {
> > > -		media_device_cleanup(&vimc->mdev);
> > > -		kfree(vimc);
> > > +		media_device_put(&vimc->mdev);
> > >  		return ret;
> > >  	}
> > >  	/*
> > > @@ -382,7 +385,6 @@ static int vimc_probe(struct platform_device *pdev)
> > >  	 * if the registration fails, we release directly from probe
> > >  	 */
> > >  
> > > -	vimc->v4l2_dev.release = vimc_v4l2_dev_release;
> > >  	platform_set_drvdata(pdev, vimc);
> > >  	return 0;
> > >  }
> > > @@ -397,6 +399,7 @@ static void vimc_remove(struct platform_device *pdev)
> > >  	media_device_unregister(&vimc->mdev);
> > >  	v4l2_device_unregister(&vimc->v4l2_dev);
> > >  	v4l2_device_put(&vimc->v4l2_dev);
> > > +	media_device_put(&vimc->mdev);
> > >  }
> > >  
> > >  static void vimc_dev_release(struct device *dev)

-- 
Regards,

Laurent Pinchart

