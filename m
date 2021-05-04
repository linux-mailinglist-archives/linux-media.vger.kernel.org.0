Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A553B372671
	for <lists+linux-media@lfdr.de>; Tue,  4 May 2021 09:19:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229769AbhEDHUM (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 4 May 2021 03:20:12 -0400
Received: from mail.kernel.org ([198.145.29.99]:39850 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229839AbhEDHUL (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 4 May 2021 03:20:11 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id AA610611AC;
        Tue,  4 May 2021 07:19:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1620112757;
        bh=QjGrbrutC+YFzoPgv/+mQZsmR02oRa2BIrxlsDN48c0=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=Y4i4/5FAkAGmAQv2thbwrlE1XxAV01TzEZeBh0I/u6PRn4sA8EWc0gFqFUrIEh8yI
         KSaayxMdV+F+9n6qqCBWwFegs6egfCZB8VMbdavgD/MSMfclOujaFCfSyk9MRG4rpY
         +chACu6z49pYjZuAVeAGDR0RViS05sIZThx6GsOJ1a+1y/Z1XAT8rTqkRDLQZK2cOK
         Yq9GaKVU7QcyoX0AbAPwpW9RCsJ150iHJgdi0+LicM1jOn30xOzWMQGZP+z6fqqDX9
         /eu67nMAuSCMH+0hmevQ64fsJoQhAlo80BqXmJjo1cZM3gy/w7kynCWapuB+MF7KHz
         J457KT/tyEr/A==
Date:   Tue, 4 May 2021 09:19:10 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Jonathan Cameron <Jonathan.Cameron@Huawei.com>
Cc:     <linuxarm@huawei.com>, <mauro.chehab@huawei.com>,
        "Lad, Prabhakar" <prabhakar.csengg@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-media@vger.kernel.org>
Subject: Re: [PATCH v4 14/79] media: am437x: fix pm_runtime_get_sync() usage
 count
Message-ID: <20210504091910.71c1b045@coco.lan>
In-Reply-To: <20210430173646.00007de1@Huawei.com>
References: <cover.1619621413.git.mchehab+huawei@kernel.org>
        <13b31912c93b56426660106d673d3c1a5be63170.1619621413.git.mchehab+huawei@kernel.org>
        <20210430173646.00007de1@Huawei.com>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Em Fri, 30 Apr 2021 17:36:46 +0100
Jonathan Cameron <Jonathan.Cameron@Huawei.com> escreveu:

> On Wed, 28 Apr 2021 16:51:35 +0200
> Mauro Carvalho Chehab <mchehab+huawei@kernel.org> wrote:
> 
> > The pm_runtime_get_sync() internally increments the
> > dev->power.usage_count without decrementing it, even on errors.
> > Replace it by the new pm_runtime_resume_and_get(), introduced by:
> > commit dd8088d5a896 ("PM: runtime: Add pm_runtime_resume_and_get to deal with usage counter")
> > in order to properly decrement the usage counter and avoid memory
> > leaks.
> > 
> > While here, ensure that the driver will check if PM runtime
> > resumed at vpfe_initialize_device().
> > 
> > Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>  
> 
> resume and suspend carrying regardless needs a comment I think.
> (see below)
> > ---
> >  drivers/media/platform/am437x/am437x-vpfe.c | 22 +++++++++++++++------
> >  1 file changed, 16 insertions(+), 6 deletions(-)
> > 
> > diff --git a/drivers/media/platform/am437x/am437x-vpfe.c b/drivers/media/platform/am437x/am437x-vpfe.c
> > index 6cdc77dda0e4..bced526f30f2 100644
> > --- a/drivers/media/platform/am437x/am437x-vpfe.c
> > +++ b/drivers/media/platform/am437x/am437x-vpfe.c
> > @@ -1021,7 +1021,9 @@ static int vpfe_initialize_device(struct vpfe_device *vpfe)
> >  	if (ret)
> >  		return ret;
> >  
> > -	pm_runtime_get_sync(vpfe->pdev);
> > +	ret = pm_runtime_resume_and_get(vpfe->pdev);
> > +	if (ret < 0)
> > +		return ret;
> >  
> >  	vpfe_config_enable(&vpfe->ccdc, 1);
> >  
> > @@ -2443,7 +2445,11 @@ static int vpfe_probe(struct platform_device *pdev)
> >  	pm_runtime_enable(&pdev->dev);
> >  
> >  	/* for now just enable it here instead of waiting for the open */
> > -	pm_runtime_get_sync(&pdev->dev);
> > +	ret = pm_runtime_resume_and_get(&pdev->dev);
> > +	if (ret < 0) {
> > +		vpfe_err(vpfe, "Unable to resume device.\n");
> > +		goto probe_out_v4l2_unregister;
> > +	}
> >  
> >  	vpfe_ccdc_config_defaults(ccdc);
> >  
> > @@ -2527,10 +2533,11 @@ static int vpfe_suspend(struct device *dev)
> >  {
> >  	struct vpfe_device *vpfe = dev_get_drvdata(dev);
> >  	struct vpfe_ccdc *ccdc = &vpfe->ccdc;
> > +	int ret;
> >  
> >  	/* only do full suspend if streaming has started */
> >  	if (vb2_start_streaming_called(&vpfe->buffer_queue)) {
> > -		pm_runtime_get_sync(dev);
> > +		ret = pm_runtime_resume_and_get(dev);  
> 
> Carrying on when you know the resume failed, seems interesting enough to
> deserve a comment in the code.  Not sure you can usefully do anything
> but it seems likely a lot of the calls that follow will fail.

This driver indeed has a different behavior. What most drivers do is to
either resume RPM when a V4L2 devnode is opened, or when the device
starts to stream. This one does, instead, at probing time. 

It even has a comment there which implies that this is something that may
require changes in the future:

    static int vpfe_probe(struct platform_device *pdev)
    {
...
	/* for now just enable it here instead of waiting for the open */
	ret = pm_runtime_resume_and_get(&pdev->dev);

After probe, the driver just assumes that RPM is not suspended during its 
entire lifetime (except suspend/resuume).

I can't even see a check at vpfe_open() or at vpfe_start_streaming()
that would cause the functions to fail if, for whatever reason, RPM is
suspended there[1], or if a command sent to the hardware failed.

[1] The only place where there's a check is at v4l2_subdev_call(),
    asking sensors to start streaming. If those are on a different
    power domain, a valid sensor answer call won't ensure that 
    am437x VPFE is operational.

Yet, suspend/resume only checks if videobuf2 started its streaming
logic. if streaming was started, suspend/resume logic tries ensure
that the hardware will be ready to be suspended, restoring it to
the previous state before at resume time, but neither one of those
has a check to see if the commands were succeeded, just like the
logic at vpfe_start_streaming().

-

In summary, I'll add a comment there, but fixing it would require 
adding error checks on several places (open, start_streaming,
resume and suspend).

Thanks,
Mauro
