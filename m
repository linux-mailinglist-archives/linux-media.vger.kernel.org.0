Return-Path: <linux-media+bounces-17287-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D788F967270
	for <lists+linux-media@lfdr.de>; Sat, 31 Aug 2024 17:44:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id F2F731C21234
	for <lists+linux-media@lfdr.de>; Sat, 31 Aug 2024 15:44:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 16B3229429;
	Sat, 31 Aug 2024 15:44:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="K1Xc9TCX"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AF5A8468
	for <linux-media@vger.kernel.org>; Sat, 31 Aug 2024 15:44:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725119049; cv=none; b=q1SDUfpCSLMVxy8lYgft9xu39jEnSxGgl51md3mwT56lbm7HRtdQf/pcTR3ytPQIYWnemoWO3EW5kRc1kZ1X6ZjYp/aWunmKMkM6d1aXJg981T1ffdfERArVkEKWHh2Wj/7tlUOMDWH2HFcT6+xdP87kbHCwLk2Cl/s2vON2gtg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725119049; c=relaxed/simple;
	bh=BdLVF9rpt1ngW7BhAfBSacoo93EGzZiRcLKypLx97VA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oljsA7rCgOrmtaEbekMq3QXarn46dIzp9ZLyahltzUz5t9UdO0hUUOa1+Mhb2pZ58SWxmXkv9gDMefDekidA3LserPMdN5mvayMuyt11TmYHAeSx2BVgKWw8vnf18IRhoayxO3KG16yBtFvITwY9YkbsLoy9kpsrG7haWlZBhcQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=K1Xc9TCX; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 78513735;
	Sat, 31 Aug 2024 17:42:55 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1725118975;
	bh=BdLVF9rpt1ngW7BhAfBSacoo93EGzZiRcLKypLx97VA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=K1Xc9TCX74U0c2yLtj/MqhrP8HAKTOx6scnnRBnlPKwjJGY+WUcgKZylJondHuigc
	 dGsXVS/Ik5XyjkecAa9v0xNNPLZ0jI0tm0Wz0QR+EdIvyHWbUcVO0INAYd9YAyVLT1
	 Co73J7tRFjI/VfRTR51bBxik8GDlqm7/54g49VRc=
Date: Sat, 31 Aug 2024 18:43:34 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Cc: Naushir Patuck <naush@raspberrypi.com>,
	Nick Hollinghurst <nick.hollinghurst@raspberrypi.com>,
	David Plowman <david.plowman@raspberrypi.com>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	linux-media@vger.kernel.org
Subject: Re: [PATCH v3 4/4] media: pisp_be: Fix pm_runtime underrun in probe
Message-ID: <20240831154334.GA3811@pendragon.ideasonboard.com>
References: <20240827074018.534354-1-jacopo.mondi@ideasonboard.com>
 <20240827074018.534354-5-jacopo.mondi@ideasonboard.com>
 <20240831110449.GD27958@pendragon.ideasonboard.com>
 <dvbch3rk5ahpmci3eittikwuagnivtanbeixcxh4hzvism7wwv@zbyywclrroc2>
 <20240831152030.GY3811@pendragon.ideasonboard.com>
 <6uycsum5djgivlmdbwenzfkwkt2tvu55excin2ufnfosm43eeu@beeiwnvgr5da>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <6uycsum5djgivlmdbwenzfkwkt2tvu55excin2ufnfosm43eeu@beeiwnvgr5da>

On Sat, Aug 31, 2024 at 05:29:44PM +0200, Jacopo Mondi wrote:
> On Sat, Aug 31, 2024 at 06:20:30PM GMT, Laurent Pinchart wrote:
> > On Sat, Aug 31, 2024 at 05:05:47PM +0200, Jacopo Mondi wrote:
> > > On Sat, Aug 31, 2024 at 02:04:49PM GMT, Laurent Pinchart wrote:
> > > > On Tue, Aug 27, 2024 at 09:40:18AM +0200, Jacopo Mondi wrote:
> > > > > The pisp_be driver uses and depends on runtime_pm.
> > > > >
> > > > > During the probe() routine, the driver needs to power up the interface
> > > > > in order to identify and initialize the hardware and it later suspends
> > > > > it at the end of probe().
> > > > >
> > > > > The driver erroneously resumes the interface by calling the
> > > > > pispbe_runtime_resume() function directly, without going
> > > > > through the pm_runtime helpers, but later suspends it by calling
> > > > > pm_runtime_put_autosuspend().
> > > > >
> > > > > This causes a PM usage count imbalance at probe time, notified by the
> > > > > runtime_pm framework with the below message in the system log:
> > > > >
> > > > >  pispbe 1000880000.pisp_be: Runtime PM usage count underflow!
> > > > >
> > > > > Fix this by resuming the interface using the pm runtime helpers instead
> > > > > of calling the resume function directly.
> > > > >
> > > > > Fixes: 12187bd5d4f8 ("media: raspberrypi: Add support for PiSP BE")
> > > > > Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
> > > > >
> > > > > ---
> > > > > v2->v3:
> > > > > - Mark pispbe_runtime_resume() as __maybe_unused as reported by
> > > > >   the kernel test robot <lkp@intel.com>
> > > > > - Add fixes tag
> > > > > ---
> > > > >  drivers/media/platform/raspberrypi/pisp_be/pisp_be.c | 4 ++--
> > > > >  1 file changed, 2 insertions(+), 2 deletions(-)
> > > > >
> > > > > diff --git a/drivers/media/platform/raspberrypi/pisp_be/pisp_be.c b/drivers/media/platform/raspberrypi/pisp_be/pisp_be.c
> > > > > index f42541bb4827..7b62585d7510 100644
> > > > > --- a/drivers/media/platform/raspberrypi/pisp_be/pisp_be.c
> > > > > +++ b/drivers/media/platform/raspberrypi/pisp_be/pisp_be.c
> > > > > @@ -1638,7 +1638,7 @@ static int pispbe_runtime_suspend(struct device *dev)
> > > > >  	return 0;
> > > > >  }
> > > > >
> > > > > -static int pispbe_runtime_resume(struct device *dev)
> > > > > +static int __maybe_unused pispbe_runtime_resume(struct device *dev)
> > > >
> > > > The preferred way to handle this is to use RUNTIME_PM_OPS() instead of
> > > > SET_RUNTIME_PM_OPS(), not use __maybe_unused, and set the driver's .pm
> > > > field with pm_ptr(). That's probably a candidate for a separate patch,
> > > > before this one.
> > >
> > > Ah thanks, didn't consider that
> > >
> > > > >  {
> > > > >  	struct pispbe_dev *pispbe = dev_get_drvdata(dev);
> > > > >  	int ret;
> > > > > @@ -1741,7 +1741,7 @@ static int pispbe_probe(struct platform_device *pdev)
> > > > >  	pm_runtime_use_autosuspend(pispbe->dev);
> > > > >  	pm_runtime_enable(pispbe->dev);
> > > > >
> > > > > -	ret = pispbe_runtime_resume(pispbe->dev);
> > > > > +	ret = pm_runtime_resume_and_get(pispbe->dev);
> > > >
> > > > There's clearly a bug in the way runtime PM is used in this driver.
> > > > Here's the full initialization sequence at probe time:
> > > >
> > > > 	pm_runtime_set_autosuspend_delay(pispbe->dev, 200);
> > > > 	pm_runtime_use_autosuspend(pispbe->dev);
> > > > 	pm_runtime_enable(pispbe->dev);
> > > >
> > > > 	ret = pispbe_runtime_resume(pispbe->dev);
> > >
> > >         resume_and_get() ?
> >
> > No, I'm talking about the current code.
> >
> > > > 	if (ret)
> > > > 		goto pm_runtime_disable_err;
> > > >
> > > > 	...
> > > >
> > > > 	pm_runtime_mark_last_busy(pispbe->dev);
> > > > 	pm_runtime_put_autosuspend(pispbe->dev);
> > > >
> > > > I'm actually surprised there's no warning for PM use count underflow, as
> > > > the last line decreases the use count while it hasn't been increased
> > > > before.
> > >
> > > Doesn't
> > >
> > > 	ret = pm_runtime_resume_and_get(pispbe->dev);
> > >
> > > increase the reference count ??

It does but it's not called currently.

> > Re-read the code above.
> 
> If you're talking about the current code, there indeed is a PM use
> count underflow as reported in the commit message.
> 
>  This causes a PM usage count imbalance at probe time, notified by the
>  runtime_pm framework with the below message in the system log:
> 
>  pispbe 1000880000.pisp_be: Runtime PM usage count underflow!
> 
> Aren't we getting each other ?

Ah, I had missed that from the commit message. Makes sense now :-)

> > > > The way you fix it in this patch makes the driver depend on CONFIG_PM
> > >
> > > I would have sworn the driver depends on CONFIG_PM, sorry I haven't
> > > check
> > >
> > > > for proper operation. Without CONFIG_PM, the PM runtime calls are
> > > > no-ops, and so the device will never be powered on. I'm fine with that,
> > > > assuming that there's no use case for running a !CONFIG_PM kernel on a
> > > > Raspberry Pi 5. In this case, you should however add a dependency on
> > > > CONFIG_PM in Kconfig to make this clear.
> > >
> > > That would be my prefernce
> >
> > It would likely be simpler. I'll let RPi decide, I don't know if
> > !CONFIG_PM is something that should be supported.
> >
> > > > There are other related issues. The error paths in probe() call
> > > > pispbe_runtime_suspend(), and remove() does the same. Additionally,
> > > > remove() should not call pispbe_runtime_suspend(), as the device should
> > > > be suspended by the time remove() is called. These need to be fixed too.
> > >
> > > Are you suggesting these two should go through runtime_pm() ?
> >
> > If you replace pispbe_runtime_resume() with pm_runtime_resume_and_get()
> > in probe(), you should replace pispbe_runtime_suspend() too.
> >
> > > > If we want to keep !CONFIG_PM support, the direct call to
> > >
> > > Should we ? What's your and other's opinion, RPi's one in particular ?
> > >
> > > > pispbe_runtime_resume() is fine, but the rest of the runtime PM
> > > > initialization isn't. What you should instead do is
> > > >
> > > > 	ret = pispbe_runtime_resume(pispbe->dev);
> > > > 	if (ret)
> > > > 		goto pm_runtime_disable_err;
> > > >
> > > > 	...
> > > >
> > > > 	pm_runtime_set_autosuspend_delay(pispbe->dev, 200);
> > > > 	pm_runtime_use_autosuspend(pispbe->dev);
> > > > 	pm_runtime_set_active(pispbe->dev);
> > > > 	pm_runtime_enable(pispbe->dev);
> > > > 	pm_runtime_idle(pispbe->dev);
> > > >
> > > > When CONFIG_PM is enabled, the pm_runtime_set_active() call tells
> > > > runtime PM that the device is powered on, and pm_runtime_idle() then
> > > > powers it off without decrementing the use count, which has never been
> > > > incremented in the first place. When CONFIG_PM is disabled, all the
> > > > pm_runtime_*() calls are no-ops, and the device will remaining powered
> > > > until remove().
> > > >
> > > > The corresponding implementation in remove() would be
> > > >
> > > > 	pm_runtime_dont_use_autosuspend(pispbe->dev);
> > > > 	pm_runtime_disable(pispbe->dev);
> > > > 	if (!pm_runtime_status_suspended(pispbe->dev))
> > > > 		pispbe_runtime_suspend(pispbe->dev);
> > > > 	pm_runtime_set_suspended(pispbe->dev);
> > > >
> > > > >  	if (ret)
> > > > >  		goto pm_runtime_disable_err;
> > > > >

-- 
Regards,

Laurent Pinchart

