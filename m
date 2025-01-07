Return-Path: <linux-media+bounces-24341-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BC18A03DBB
	for <lists+linux-media@lfdr.de>; Tue,  7 Jan 2025 12:30:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DC80E1886A5A
	for <lists+linux-media@lfdr.de>; Tue,  7 Jan 2025 11:30:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0ECBE1DE4CE;
	Tue,  7 Jan 2025 11:30:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iEICpyMI"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 934DD1D6DB7;
	Tue,  7 Jan 2025 11:30:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736249440; cv=none; b=sZbIOAsXnE/BqqyFg5rJcyKojiGMEwSph0ziaLdecE6jgDU2njQcELnLc6pTeebw9P356mxgKoSiotvpuU2XptGnI4AhTcCXQ/Diydd6dNYJdwYByLpk50/wDCOOAvQxNxvCiJzqCdYmQqhdCoG6o67BkEvqcYYecQDd53VKuJk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736249440; c=relaxed/simple;
	bh=CdbvG3PjFiYfbRw2sozVjDI+GvEC+EM3meT1WQS8s0Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MM9kcS+vNioR2hVNv29ZrrH1QFZnaptTLiXnM3vCFgYPxd2MxRj6MlC7xTgRwKG5MVorTdqtjcHzA7SdHH2ivIJFZsdMfRAhoc72xyce/wWj4g2313oyj79X91hnktB5rPBq4JVtQ1bIhs32uXE36dG46IEH0POysaKc5ZyDT5o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iEICpyMI; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736249437; x=1767785437;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=CdbvG3PjFiYfbRw2sozVjDI+GvEC+EM3meT1WQS8s0Q=;
  b=iEICpyMIX1rDjxrCqaa7Zyi4J0SoHm+FCMoSbe93Rv558APHVgSFbfdb
   iXUiQiT0eM9TOnWRTk3RYpTzE+pYM/HozVdLAGGLzrRglPvQOLEPBCidF
   2kK8AHEjdQ+78ihKDS9vcqC4o5TLr+zpyFjiTmf4bwjv0lISrnQftx5k5
   x5UtDwCn4iCxGhaXVfOx+JdImrw9oaisE+IAg2vc+4YvWfuNfMg1tMscp
   UcUkKlfrEict5YhmdehdxngXfWUSowoRaqkElta+JPS4m2PuEsg9j6Z8c
   4Q3aQLN3X06T4wX41zA2TrLXr7Lq1HU88yNYxPmAvNPK9U74s6fh39JhN
   Q==;
X-CSE-ConnectionGUID: GDpZkVDCTZKxK/+iWI7fgQ==
X-CSE-MsgGUID: YiOj1X3ERNmtGAxeSN47/A==
X-IronPort-AV: E=McAfee;i="6700,10204,11307"; a="39251882"
X-IronPort-AV: E=Sophos;i="6.12,295,1728975600"; 
   d="scan'208";a="39251882"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jan 2025 03:30:37 -0800
X-CSE-ConnectionGUID: 0L/k/aoyTlyLj6KXaAh1ig==
X-CSE-MsgGUID: g7vDkVzEQi+1gA0lOCB5zQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="107825700"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jan 2025 03:30:35 -0800
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 4D47411F8DF;
	Tue,  7 Jan 2025 13:30:32 +0200 (EET)
Date: Tue, 7 Jan 2025 11:30:32 +0000
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Lubomir Rintel <lrintel@redhat.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org, Lubomir Rintel <lkundrak@v3.sk>,
	stable@vger.kernel.org
Subject: Re: [PATCH] media/mmp: Bring back registration of the device
Message-ID: <Z30QWA-LfZHwVbmm@kekkonen.localdomain>
References: <20241231190434.438517-1-lkundrak@v3.sk>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241231190434.438517-1-lkundrak@v3.sk>

Hi Lubomir,

Thanks for the patch.

On Tue, Dec 31, 2024 at 08:04:34PM +0100, Lubomir Rintel wrote:
> In commit 4af65141e38e ("media: marvell: cafe: Register V4L2 device
> earlier"), a call to v4l2_device_register() was moved away from
> mccic_register() into its caller, marvell/cafe's cafe_pci_probe().
> This is not the only caller though -- there's also marvell/mmp.
> 
> Add v4l2_device_register() into mmpcam_probe() to unbreak the MMP camera
> driver, in a fashion analogous to what's been done to the Cafe driver.
> Same for the teardown path.
> 
> Fixes: 4af65141e38e ("media: marvell: cafe: Register V4L2 device earlier")
> Signed-off-by: Lubomir Rintel <lkundrak@v3.sk>
> Cc: stable@vger.kernel.org # v6.6+
> ---
>  drivers/media/platform/marvell/mmp-driver.c | 21 +++++++++++++++++----
>  1 file changed, 17 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/media/platform/marvell/mmp-driver.c b/drivers/media/platform/marvell/mmp-driver.c
> index 3fd4fc1b9c48..d3da7ebb4a2b 100644
> --- a/drivers/media/platform/marvell/mmp-driver.c
> +++ b/drivers/media/platform/marvell/mmp-driver.c
> @@ -231,13 +231,23 @@ static int mmpcam_probe(struct platform_device *pdev)
>  
>  	mcam_init_clk(mcam);
>  
> +	/*
> +	 * Register with V4L.
> +	 */
> +
> +	ret = v4l2_device_register(mcam->dev, &mcam->v4l2_dev);

I'd do this just before initialising the notifier (as in the patch in
Fixes: tag): registering the V4L2 device requires probably severe memory
pressure while it's entirely plausible there's no endpoint for the device.

> +	if (ret)
> +		return ret;
> +
>  	/*
>  	 * Create a match of the sensor against its OF node.
>  	 */
>  	ep = fwnode_graph_get_next_endpoint(of_fwnode_handle(pdev->dev.of_node),
>  					    NULL);
> -	if (!ep)
> -		return -ENODEV;
> +	if (!ep) {
> +		ret = -ENODEV;
> +		goto out_v4l2_device_unregister;
> +	}
>  
>  	v4l2_async_nf_init(&mcam->notifier, &mcam->v4l2_dev);
>  
> @@ -246,7 +256,7 @@ static int mmpcam_probe(struct platform_device *pdev)
>  	fwnode_handle_put(ep);
>  	if (IS_ERR(asd)) {
>  		ret = PTR_ERR(asd);
> -		goto out;
> +		goto out_v4l2_device_unregister;
>  	}
>  
>  	/*
> @@ -254,7 +264,7 @@ static int mmpcam_probe(struct platform_device *pdev)
>  	 */
>  	ret = mccic_register(mcam);
>  	if (ret)
> -		goto out;
> +		goto out_v4l2_device_unregister;
>  
>  	/*
>  	 * Add OF clock provider.
> @@ -283,6 +293,8 @@ static int mmpcam_probe(struct platform_device *pdev)
>  	return 0;
>  out:

For clarity, it'd be best to rename the out label to something more
specific, i.e. out_mccic_shutdown. Either way,

Reviewed-by: Sakari Ailus <sakari.ailus@linux.intel.com>

>  	mccic_shutdown(mcam);
> +out_v4l2_device_unregister:
> +	v4l2_device_unregister(&mcam->v4l2_dev);
>  
>  	return ret;
>  }
> @@ -293,6 +305,7 @@ static void mmpcam_remove(struct platform_device *pdev)
>  	struct mcam_camera *mcam = &cam->mcam;
>  
>  	mccic_shutdown(mcam);
> +	v4l2_device_unregister(&mcam->v4l2_dev);
>  	pm_runtime_force_suspend(mcam->dev);
>  }
>  

-- 
Regards,

Sakari Ailus

