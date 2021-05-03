Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 77928371344
	for <lists+linux-media@lfdr.de>; Mon,  3 May 2021 11:57:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233100AbhECJ56 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 3 May 2021 05:57:58 -0400
Received: from mail.kernel.org ([198.145.29.99]:53286 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232964AbhECJ56 (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 3 May 2021 05:57:58 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 33A7C61157;
        Mon,  3 May 2021 09:57:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1620035825;
        bh=NHIRO3+PyDbLugh6/AIoA+3M25be2L4BL+5JpSuPWs4=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=EjghMvyXqe4C3XAQOdQia+TDQPIrOeHVFc+Q8X7DOrmSK4v4CVpXxkKoHSt4i+OxA
         o6vf8bsPmcxMwvqfFuQzJJy4nwlSA90T91Fx6JjKGRni3jtd0SX22V1uAuB43pVMHu
         ychRh+6P1rKtZH2ZJR9WDO2fWcKNwZBDwyHPFPcf1VkcPHefgBs2B4x+dD/6ZEfJW2
         3MTLbyvu+eaMmTQ/uNeF5R9+MKJc74sJqS5ByyHTg87xi77mt+gJVRHt/tXcXIVyfz
         7fB/ePUP/53JgxCA49zUXF9JmYbnEG7S3feP3l3RYMUK/petVGjhQ6sUEFWN2nYYOf
         9Jalo8ZkqSzsA==
Received: from johan by xi.lan with local (Exim 4.93.0.4)
        (envelope-from <johan@kernel.org>)
        id 1ldVKF-0004I6-Nv; Mon, 03 May 2021 11:57:16 +0200
Date:   Mon, 3 May 2021 11:57:15 +0200
From:   Johan Hovold <johan@kernel.org>
To:     Jonathan Cameron <Jonathan.Cameron@Huawei.com>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        devel@driverdev.osuosl.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linuxarm@huawei.com, linux-kernel@vger.kernel.org,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        mauro.chehab@huawei.com, Bingbu Cao <bingbu.cao@intel.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Tianshu Qiu <tian.shu.qiu@intel.com>,
        linux-media@vger.kernel.org
Subject: Re: [PATCH v4 23/79] staging: media: ipu3: use
 pm_runtime_resume_and_get()
Message-ID: <YI/I+ztnoNUr+u1T@hovoldconsulting.com>
References: <cover.1619621413.git.mchehab+huawei@kernel.org>
 <ab2332b27d0043574a72a42ec8d757fd06279cc6.1619621413.git.mchehab+huawei@kernel.org>
 <20210430180338.00006e62@Huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210430180338.00006e62@Huawei.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Fri, Apr 30, 2021 at 06:03:38PM +0100, Jonathan Cameron wrote:
> On Wed, 28 Apr 2021 16:51:44 +0200
> Mauro Carvalho Chehab <mchehab+huawei@kernel.org> wrote:
> 
> > Commit dd8088d5a896 ("PM: runtime: Add pm_runtime_resume_and_get to deal with usage counter")
> > added pm_runtime_resume_and_get() in order to automatically handle
> > dev->power.usage_count decrement on errors.
> > 
> > Use the new API, in order to cleanup the error check logic.
> > 
> > Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
> Could add that pm_runtime_put() should have been pm_runtime_put_noidle()
> inorder to not potentially result in a call to runtime suspend when
> we never resumed in the first place.

No, that would never happen anyway and any pm_runtime_put() will do
even if pm_runtime_put_noidle() is the natural choice in this case to
balance the counter.

> Otherwise reasonable cleanup.
> 
> Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
> 
> > ---
> >  drivers/staging/media/ipu3/ipu3.c | 3 +--
> >  1 file changed, 1 insertion(+), 2 deletions(-)
> > 
> > diff --git a/drivers/staging/media/ipu3/ipu3.c b/drivers/staging/media/ipu3/ipu3.c
> > index ee1bba6bdcac..8e1e9e46e604 100644
> > --- a/drivers/staging/media/ipu3/ipu3.c
> > +++ b/drivers/staging/media/ipu3/ipu3.c
> > @@ -392,10 +392,9 @@ int imgu_s_stream(struct imgu_device *imgu, int enable)
> >  	}
> >  
> >  	/* Set Power */
> > -	r = pm_runtime_get_sync(dev);
> > +	r = pm_runtime_resume_and_get(dev);
> >  	if (r < 0) {
> >  		dev_err(dev, "failed to set imgu power\n");
> > -		pm_runtime_put(dev);
> >  		return r;
> >  	}

Johan
