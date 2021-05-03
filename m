Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3ED5E3712CE
	for <lists+linux-media@lfdr.de>; Mon,  3 May 2021 11:00:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233023AbhECJB1 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 3 May 2021 05:01:27 -0400
Received: from mail.kernel.org ([198.145.29.99]:42052 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231531AbhECJBY (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 3 May 2021 05:01:24 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 9D9E860FEB;
        Mon,  3 May 2021 09:00:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1620032431;
        bh=NM7OrmlALeZ32h6rHMv+l8Rr/iKbNjIkdTl15+pN+3s=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=KrMg7rZDAvuF8TSPaz3tHXjheVZ8VWJcWtxGSauCj+5vW2KabqwOdyeTgtGbqlfGF
         8unLL3Kt+lb+2P0TATB03NT5m66Xgz6HD3tncDgwXLUKrdrUJ8QhTLmDK+yM8MLAMp
         uv4KZQeiLzZyYpsnaevhEy2QLxVYPzYb5sNLoc6/FU034FCT0mDmPyKkICU4p4EGSK
         gJNajfcvnz635r/XYPr7DQved2cUsTrhpgZIFhPKYKgo6dMDlt/BKcsw6AohW8LZTu
         bLKgxm6rpBtgtkhXS/kkW9ChsK8hVxJ+L02Btp+3BITtue4jjDQPHDTVtoQR7L7xBG
         rQoCFDRJSkkwQ==
Date:   Mon, 3 May 2021 11:00:22 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Jonathan Cameron <Jonathan.Cameron@Huawei.com>
Cc:     <linuxarm@huawei.com>, <mauro.chehab@huawei.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        "Hans Verkuil" <hans.verkuil@cisco.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        <linux-arm-msm@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-media@vger.kernel.org>
Subject: Re: [PATCH v4 01/79] media: venus: fix PM runtime logic at
 venus_sys_error_handler()
Message-ID: <20210503110022.22503bfd@coco.lan>
In-Reply-To: <20210430162110.000058e0@Huawei.com>
References: <cover.1619621413.git.mchehab+huawei@kernel.org>
        <6d463d21f0dd55c3d84db0458c7a5c4e0d7c5bc1.1619621413.git.mchehab+huawei@kernel.org>
        <20210430162110.000058e0@Huawei.com>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Em Fri, 30 Apr 2021 16:21:10 +0100
Jonathan Cameron <Jonathan.Cameron@Huawei.com> escreveu:

> On Wed, 28 Apr 2021 16:51:22 +0200
> Mauro Carvalho Chehab <mchehab+huawei@kernel.org> wrote:
> 
> > The venus_sys_error_handler() assumes that pm_runtime was
> > able to resume, as it does things like:
> > 
> > 	while (pm_runtime_active(core->dev_dec) || pm_runtime_active(core->dev_enc))
> > 		msleep(10);
> > 
> > Well, if, for whatever reason, this won't happen, the routine
> > won't do what's expected. So, check for the returned error
> > condition, warning if it returns an error.
> > 
> > Fixes: af2c3834c8ca ("[media] media: venus: adding core part and helper functions")
> > Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
> > ---
> >  drivers/media/platform/qcom/venus/core.c | 14 +++++++++++---
> >  1 file changed, 11 insertions(+), 3 deletions(-)
> > 
> > diff --git a/drivers/media/platform/qcom/venus/core.c b/drivers/media/platform/qcom/venus/core.c
> > index 54bac7ec14c5..c80c27c87ccc 100644
> > --- a/drivers/media/platform/qcom/venus/core.c
> > +++ b/drivers/media/platform/qcom/venus/core.c
> > @@ -84,7 +84,11 @@ static void venus_sys_error_handler(struct work_struct *work)
> >  			container_of(work, struct venus_core, work.work);
> >  	int ret = 0;
> >  
> > -	pm_runtime_get_sync(core->dev);
> > +	ret = pm_runtime_get_sync(core->dev);
> > +	if (WARN_ON(ret < 0)) {
> > +		pm_runtime_put_noidle(core->dev);
> > +		return;
> > +	}
> >  
> >  	hfi_core_deinit(core, true);
> >  
> > @@ -106,9 +110,13 @@ static void venus_sys_error_handler(struct work_struct *work)
> >  
> >  	hfi_reinit(core);
> >  
> > -	pm_runtime_get_sync(core->dev);
> > +	ret = pm_runtime_get_sync(core->dev);
> > +	if (WARN_ON(ret < 0)) {
> > +		pm_runtime_put_noidle(core->dev);  

Thanks for review!

> mutex_unlock(&core->lock);
> (the unlock is currently just below the enable_irq() in 5.12)

Basically, this function assumes that the core->lock is not locked
and that IRQs are disabled, as can be seen at the function which
starts such work:

    static void venus_event_notify(struct venus_core *core, u32 event)
    {
	struct venus_inst *inst;

	switch (event) {
	case EVT_SYS_WATCHDOG_TIMEOUT:
	case EVT_SYS_ERROR:
		break;
	default:
		return;
	}

	mutex_lock(&core->lock);
	core->sys_error = true;
	list_for_each_entry(inst, &core->instances, list)
		inst->ops->event_notify(inst, EVT_SESSION_ERROR, NULL);
	mutex_unlock(&core->lock);

	disable_irq_nosync(core->irq);
	schedule_delayed_work(&core->work, msecs_to_jiffies(10));
    }

The code inside it actually locks/unlocks two times the core->lock. 
See, this is the original code:

    static void venus_sys_error_handler(struct work_struct *work)
    {
	<not locked>

        pm_runtime_get_sync(core->dev);

        hfi_core_deinit(core, true);

        dev_warn(core->dev, "system error has occurred, starting recovery!\n");

        mutex_lock(&core->lock);
	while (pm_runtime_active(core->dev_dec) || pm_runtime_active(core->dev_enc))
                msleep(10);
...
        enable_irq(core->irq);
        mutex_unlock(&core->lock);
...
	if (ret) {
                disable_irq_nosync(core->irq);
                dev_warn(core->dev, "recovery failed (%d)\n", ret);
                schedule_delayed_work(&core->work, msecs_to_jiffies(10));
                return;
        }

	mutex_lock(&core->lock);
        core->sys_error = false;
        mutex_unlock(&core->lock);
    }

It should be noticed that, once started, this delayed work re-starts
itself, with IRQs disabled, trying to reboot the Venus IP hardware,
until it stops failing [1].

[1] IMHO, it seems a very bad idea to keep running the work forever,
flooding syslog with error messages on every 10ms or so.

That's said, my patch doesn't seem to fix all potential issues that
could happen there.

I'll propose a separate fix, outside this patch series, as the issues
here are not only due to RPM, but the main issue is that both
while loops inside this code can run forever with the core->lock
hold.

Thanks,
Mauro
