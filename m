Return-Path: <linux-media+bounces-17427-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C3489969388
	for <lists+linux-media@lfdr.de>; Tue,  3 Sep 2024 08:19:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6A9FC1F23CF9
	for <lists+linux-media@lfdr.de>; Tue,  3 Sep 2024 06:19:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A27A21CEADF;
	Tue,  3 Sep 2024 06:19:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="vXXa6gOn"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AC081A2625
	for <linux-media@vger.kernel.org>; Tue,  3 Sep 2024 06:19:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725344345; cv=none; b=U8//TMMep2WOcHuQmr51LR7bNBbVDhOPV4sHQmyXSMXOPXy7nEh9qKxAI5GEM3fCKbE4rqAtcBayQwhXw9pwN4LuVVHo1L4RQFCjVbIBuSCTdsF+zqc3ubbB2fZJQYJEO4ULooRB06jUpmYw+k7lLlKw6g6qVKTCBsxgQcUM02o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725344345; c=relaxed/simple;
	bh=1MBs89Pc4oOaS6OxC4xOxcq6ffJ00z0Js/6oVyDvEkE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AQgXgIPmzC8JV1y4d3WwC3l5eRxKGQkSLFlYNsSL7aG0/hvEkoW26PEd42Ve0vcmhs7LUw/QMn9r1aRqZ7/pDkULU+yzpP3pVpdTU7nxMmdQG0Y+ATmCEQT/8+YRT2KUbITjPsLBUFlF9RnsIvBxBMdRZ6vENRHyozs80pc+itI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=vXXa6gOn; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from ideasonboard.com (mob-5-90-56-115.net.vodafone.it [5.90.56.115])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id DD85D2D5;
	Tue,  3 Sep 2024 08:17:47 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1725344268;
	bh=1MBs89Pc4oOaS6OxC4xOxcq6ffJ00z0Js/6oVyDvEkE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=vXXa6gOn2Q30Ulzazi3igGVGh0KQq698i3s2mPUBUB43UREWx/OYjmcu2w5+nDv0J
	 GiWYYnpv+7ItxGKP76hOB16BFzc8pWN3k+ieIHNMFckDS67pVry8iPI9MVMl/S2J6X
	 1Sg8T372cMeBz8cegnnhSuD0mxa9fbC1waLoLTCg=
Date: Tue, 3 Sep 2024 08:18:53 +0200
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Jacopo Mondi <jacopo.mondi@ideasonboard.com>, 
	Naushir Patuck <naush@raspberrypi.com>, Nick Hollinghurst <nick.hollinghurst@raspberrypi.com>, 
	David Plowman <david.plowman@raspberrypi.com>, Dave Stevenson <dave.stevenson@raspberrypi.com>, 
	linux-media@vger.kernel.org
Subject: Re: [PATCH v4 4/4] media: pisp_be: Fix pm_runtime underrun in probe
Message-ID: <o4fyun4yu6ezsvv6ei5vjzepzunqp6elryypwshvf2zr32d3wj@cdmcvtor36nw>
References: <20240902112408.493201-1-jacopo.mondi@ideasonboard.com>
 <20240902112408.493201-5-jacopo.mondi@ideasonboard.com>
 <20240902231316.GC26371@pendragon.ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240902231316.GC26371@pendragon.ideasonboard.com>

Hi Laurent,

On Tue, Sep 03, 2024 at 02:13:16AM GMT, Laurent Pinchart wrote:
> Hi Jacopo,
>
> Thank you for the patch.
>
> On Mon, Sep 02, 2024 at 01:24:06PM +0200, Jacopo Mondi wrote:
> > During the probe() routine, the driver needs to power up the interface
> > in order to identify and initialize the hardware and it later suspends
> > it at the end of probe().
> >
> > The driver erroneously resumes the interface by calling the
> > pispbe_runtime_resume() function directly but suspends it by
> > calling pm_runtime_put_autosuspend().
> >
> > This causes a PM usage count imbalance at probe time, notified by the
> > runtime_pm framework with the below message in the system log:
> >
> >  pispbe 1000880000.pisp_be: Runtime PM usage count underflow!
> >
> > Fix this by suspending the interface using pm_runtime_idle() which
> > doesn't decrease the pm_runtime usage count and inform the PM framework
> > that the device is active by calling pm_runtime_set_active().
> >
> > Adjust the pispbe_remove() function as well to disable
> > the pm_runtime in the correct order,
>
> s/,$/./
>
> > Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
> >
> > ---
> > v3->v4:
> > - Instead of using pm_runtime for resuming, suspend using
> >   pm_runtime_idle() to support !CONFIG_PM
> >
> > v2->v3:
> > - Mark pispbe_runtime_resume() as __maybe_unused as reported by
> >   the kernel test robot <lkp@intel.com>
> > ---
> >  .../platform/raspberrypi/pisp_be/pisp_be.c    | 26 +++++++++----------
> >  1 file changed, 12 insertions(+), 14 deletions(-)
> >
> > diff --git a/drivers/media/platform/raspberrypi/pisp_be/pisp_be.c b/drivers/media/platform/raspberrypi/pisp_be/pisp_be.c
> > index d614f53f0f68..1c19ca946bd4 100644
> > --- a/drivers/media/platform/raspberrypi/pisp_be/pisp_be.c
> > +++ b/drivers/media/platform/raspberrypi/pisp_be/pisp_be.c
> > @@ -1720,36 +1720,32 @@ static int pispbe_probe(struct platform_device *pdev)
> >  				     "Failed to get clock");
> >
> >  	/* Hardware initialisation */
> > -	pm_runtime_set_autosuspend_delay(pispbe->dev, 200);
> > -	pm_runtime_use_autosuspend(pispbe->dev);
> > -	pm_runtime_enable(pispbe->dev);
> > -
> >  	ret = pispbe_runtime_resume(pispbe->dev);
> >  	if (ret)
> > -		goto pm_runtime_disable_err;
> > +		return ret;
> >
> >  	pispbe->hw_busy = false;
> >  	spin_lock_init(&pispbe->hw_lock);
> >  	ret = pispbe_hw_init(pispbe);
> >  	if (ret)
> > -		goto pm_runtime_suspend_err;
> > +		goto runtime_suspend_err;
> >
> >  	ret = pispbe_init_devices(pispbe);
> >  	if (ret)
> >  		goto disable_devs_err;
> >
> > -	pm_runtime_mark_last_busy(pispbe->dev);
> > -	pm_runtime_put_autosuspend(pispbe->dev);
> > +	pm_runtime_set_autosuspend_delay(pispbe->dev, 200);
> > +	pm_runtime_use_autosuspend(pispbe->dev);
> > +	pm_runtime_set_active(pispbe->dev);
> > +	pm_runtime_enable(pispbe->dev);
> > +	pm_runtime_idle(pispbe->dev);
> >
> >  	return 0;
> >
> >  disable_devs_err:
>
> It would be nice to rename the error labels to start with err_, like
> commonly done (in another patch of course).
>
> >  	pispbe_destroy_devices(pispbe);
> > -pm_runtime_suspend_err:
> > +runtime_suspend_err:
> >  	pispbe_runtime_suspend(pispbe->dev);
> > -pm_runtime_disable_err:
> > -	pm_runtime_dont_use_autosuspend(pispbe->dev);
> > -	pm_runtime_disable(pispbe->dev);
> >
> >  	return ret;
> >  }
> > @@ -1760,9 +1756,11 @@ static void pispbe_remove(struct platform_device *pdev)
> >
> >  	pispbe_destroy_devices(pispbe);
> >
> > -	pispbe_runtime_suspend(pispbe->dev);
> >  	pm_runtime_dont_use_autosuspend(pispbe->dev);
> > -	pm_runtime_disable(pispbe->dev);
> > +        pm_runtime_disable(pispbe->dev);
> > +        if (!pm_runtime_status_suspended(pispbe->dev))
> > +                pispbe_runtime_suspend(pispbe->dev);
> > +        pm_runtime_set_suspended(pispbe->dev);
>
> Wrong indentation, you're using spaces instead of tabs.

Oh crabs, how did I missed that ?

>
> With those issues fixed,
>
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

Thanks

>
> >  }
> >
> >  static const struct dev_pm_ops pispbe_pm_ops = {
>
> --
> Regards,
>
> Laurent Pinchart

