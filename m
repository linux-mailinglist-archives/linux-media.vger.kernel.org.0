Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 188A5371563
	for <lists+linux-media@lfdr.de>; Mon,  3 May 2021 14:49:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233732AbhECMuY (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 3 May 2021 08:50:24 -0400
Received: from mail.kernel.org ([198.145.29.99]:52538 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233158AbhECMuX (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 3 May 2021 08:50:23 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 503FB611C9;
        Mon,  3 May 2021 12:49:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1620046170;
        bh=Hjj/jcXS+/014vBFrxZyw3FAreH3hNVNIIRmv/WauEQ=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=I/M355tkLUM83JxU7jsEnK6H4RXaWbJmDikN7suMEhx5nhQxcSJcoXsI6t7QEDYhj
         bUksFK2hv/mDjS94oDW2Yq0Wvz04n+l6r3A+5T7z7Oig9Pv32Pnu0upRCNbdvjSEwQ
         zLrB/0kEF00aVzZNDCYYEjgY3jOESZFYm5C3xbdz5LuauR3+TGE1LGNSD3DNVpoRmh
         FT+sKULrZbhaAukWLnUg6I3b0XjFHjOpY4y+6G9kWkyWDSKSBT/wY4iRL+F8/Em5rV
         u3JJxTmmKgcjtodjtZKk/CRfwZJ2Q0einwGHNhNiNOD1PWuY8gKj03kWVSdu1cjGv2
         JpXXzO5JVpn3Q==
Date:   Mon, 3 May 2021 14:49:25 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Jonathan Cameron <Jonathan.Cameron@Huawei.com>
Cc:     <linuxarm@huawei.com>, <mauro.chehab@huawei.com>,
        Benoit Parrot <bparrot@ti.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-media@vger.kernel.org>
Subject: Re: [PATCH v4 75/79] media: ti-vpe: use pm_runtime_resume_and_get()
Message-ID: <20210503144925.05b56132@coco.lan>
In-Reply-To: <20210430190311.000039eb@Huawei.com>
References: <cover.1619621413.git.mchehab+huawei@kernel.org>
        <bd62e8ed8b70a68a9173af82c26896d153657f9a.1619621413.git.mchehab+huawei@kernel.org>
        <20210430190311.000039eb@Huawei.com>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Em Fri, 30 Apr 2021 19:03:11 +0100
Jonathan Cameron <Jonathan.Cameron@Huawei.com> escreveu:

> On Wed, 28 Apr 2021 16:52:36 +0200
> Mauro Carvalho Chehab <mchehab+huawei@kernel.org> wrote:

> > diff --git a/drivers/media/platform/ti-vpe/vpe.c b/drivers/media/platform/ti-vpe/vpe.c
> > index 10251b787674..07cb2c140295 100644
> > --- a/drivers/media/platform/ti-vpe/vpe.c
> > +++ b/drivers/media/platform/ti-vpe/vpe.c
> > @@ -2471,10 +2471,8 @@ static int vpe_runtime_get(struct platform_device *pdev)
> >  
> >  	dev_dbg(&pdev->dev, "vpe_runtime_get\n");
> >  
> > -	r = pm_runtime_get_sync(&pdev->dev);
> > +	r = pm_runtime_resume_and_get(&pdev->dev);
> >  	WARN_ON(r < 0);
> > -	if (r)
> > -		pm_runtime_put_noidle(&pdev->dev);
> >  	return r < 0 ? r : 0;  
> r is <= 0 to zero so this isn't doing anything useful.

Not really. pm_runtime*get* routines may return positive values
as well. From Documentation/power/runtime_pm.rst:

  `int pm_runtime_resume(struct device *dev);`
    - execute the subsystem-level resume callback for the device; returns 0 on
      success, 1 if the device's runtime PM status was already 'active' or
      error code on failure, where -EAGAIN means it may be safe to attempt to
      resume the device again in future, but 'power.runtime_error' should be
      checked additionally, and -EACCES means that 'power.disable_depth' is
      different from 0

  `int pm_runtime_resume_and_get(struct device *dev);`
    - run pm_runtime_resume(dev) and if successful, increment the device's
      usage counter; return the result of pm_runtime_resume

  `int pm_runtime_get_sync(struct device *dev);`
    - increment the device's usage counter, run pm_runtime_resume(dev) and
      return its result

So, basically, if the device was already active, it would return 1.

Now, this is called as:

        ret = vpe_runtime_get(pdev);
        if (ret)
                goto rel_m2m;

So the logic could be simplified if the caller would be
doing, instead:

        ret = vpe_runtime_get(pdev);
        if (ret < 0)
                goto rel_m2m;

I'll do such change for the next version.

Thanks,
Mauro
