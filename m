Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BD76A373942
	for <lists+linux-media@lfdr.de>; Wed,  5 May 2021 13:24:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232904AbhEELZc (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 5 May 2021 07:25:32 -0400
Received: from mail.kernel.org ([198.145.29.99]:60934 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230001AbhEELZb (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 5 May 2021 07:25:31 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 0373C60FDB;
        Wed,  5 May 2021 11:24:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1620213875;
        bh=rVCsHanvqm4YbOH1pKSl0D43qcxm+rzTIq9CtXtWzII=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=mGtDIMBLxCuyomx94k+BVEGqlmSHB7386cweu5nx3hDaUMDhk+yURvJ/YoigukApd
         fKC+upgdwCvhE0htHj03x4lIiu1oo7Xt5OV32bTPhcAOw3lLppnIElbp2j12Hsm5Gp
         6jttOLICZ0CD8ZUww33tZ2Xb9fkizYX96jrf87rZq8lpgRs99+mqpBPKGWbju5aF8T
         0XsVi/YDGpLaWgo0BhwcEVmxWbHR/q5llS1o2KKZwSpROd+Rwwu8gxgkngD5os3ph/
         zd5DwxsqxetKl6T1ZoLzwVZ+wd5V2B0WTqmZpbK5BV8K75+5+elGV2GqLnRgCqJgTL
         fuNfcWIxsW+ow==
Date:   Wed, 5 May 2021 13:24:26 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Jonathan Cameron <Jonathan.Cameron@Huawei.com>
Cc:     <linuxarm@huawei.com>, <mauro.chehab@huawei.com>,
        "Paul J. Murphy" <paul.j.murphy@intel.com>,
        Daniele Alessandrelli <daniele.alessandrelli@intel.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-media@vger.kernel.org>,
        Dan Carpenter <dan.carpenter@oracle.com>
Subject: Re: [PATCH 06/25] media: i2c: imx334: fix the pm runtime get logic
Message-ID: <20210505132426.201e9262@coco.lan>
In-Reply-To: <20210505121040.00002094@Huawei.com>
References: <cover.1620207353.git.mchehab+huawei@kernel.org>
        <9552f3daece8bec6869b518410b2998c3fc0a1fc.1620207353.git.mchehab+huawei@kernel.org>
        <20210505121040.00002094@Huawei.com>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Em Wed, 5 May 2021 12:10:40 +0100
Jonathan Cameron <Jonathan.Cameron@Huawei.com> escreveu:

> On Wed, 5 May 2021 11:41:56 +0200
> Mauro Carvalho Chehab <mchehab+huawei@kernel.org> wrote:
> 
> > The PM runtime get logic is currently broken, as it checks if
> > ret is zero instead of checking if it is an error code,
> > as reported by Dan Carpenter.
> > 
> > While here, use the pm_runtime_resume_and_get() as added by:
> > commit dd8088d5a896 ("PM: runtime: Add pm_runtime_resume_and_get to deal with usage counter")
> > added pm_runtime_resume_and_get() in order to automatically handle
> > dev->power.usage_count decrement on errors. As a bonus, such function
> > always return zero on success.
> > 
> > It should also be noticed that a fail of pm_runtime_get_sync() would
> > potentially result in a spurious runtime_suspend(), instead of
> > using pm_runtime_put_noidle().  
> 
> Irony here is that pm_runtime_resume_and_get() returns <= 0 so with that
> function change, you can stick with if (ret) and still be correct.
> 
> So only one of the two changes is needed to fix the bug.

Yeah, I noticed ;-)

On media, almost all devices have I2C bus(es), and I2C send/receive functions
return positive values. So, a good practice is to check for errors with:

	if (ret < 0)

That's why I opted to keep both changes here ;-)

Regards,
Mauro

> 
> J
> > 
> > Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
> > Reviewed-by: Daniele Alessandrelli <daniele.alessandrelli@intel.com>
> > Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
> > ---
> >  drivers/media/i2c/imx334.c | 7 ++++---
> >  1 file changed, 4 insertions(+), 3 deletions(-)
> > 
> > diff --git a/drivers/media/i2c/imx334.c b/drivers/media/i2c/imx334.c
> > index 047aa7658d21..23f28606e570 100644
> > --- a/drivers/media/i2c/imx334.c
> > +++ b/drivers/media/i2c/imx334.c
> > @@ -717,9 +717,9 @@ static int imx334_set_stream(struct v4l2_subdev *sd, int enable)
> >  	}
> >  
> >  	if (enable) {
> > -		ret = pm_runtime_get_sync(imx334->dev);
> > -		if (ret)
> > -			goto error_power_off;
> > +		ret = pm_runtime_resume_and_get(imx334->dev);
> > +		if (ret < 0)
> > +			goto error_unlock;
> >  
> >  		ret = imx334_start_streaming(imx334);
> >  		if (ret)
> > @@ -737,6 +737,7 @@ static int imx334_set_stream(struct v4l2_subdev *sd, int enable)
> >  
> >  error_power_off:
> >  	pm_runtime_put(imx334->dev);
> > +error_unlock:
> >  	mutex_unlock(&imx334->mutex);
> >  
> >  	return ret;  
> 



Thanks,
Mauro
