Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 688EB387C53
	for <lists+linux-media@lfdr.de>; Tue, 18 May 2021 17:20:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1350131AbhERPVi (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 18 May 2021 11:21:38 -0400
Received: from mail.kernel.org ([198.145.29.99]:54296 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1350112AbhERPVi (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 18 May 2021 11:21:38 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 7214D61074;
        Tue, 18 May 2021 15:20:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1621351219;
        bh=pM/wP3SO41YR80bpdiSeEVPNAWyq2ivENVttrfaRQHs=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=Cr1JVzJpVxA9bSwQKfEm7NFNpHGuLvIkYLdaPZDX+C04HCezG/s5TBTjK9uPufG5L
         GtFvCKBz5kMWgJHH+XhgR0JlDEF/iTBluzxOOc+4BO/fQpibetNmRFhufzRF1yV8VY
         x9HOX6XVrYiyd0Y6jgdV6N4WPeIaL/LVMNloD6yt0gchD6fM96IqYzeEj/4nkCFHWz
         hJwFzDA0zSO1mpfD+i5JynSGp5np3T8DSq3krsGVW3Gyc3r6/AnuebRjtw8pSeewCJ
         /TmysaiRwgEK2rr0mdEnEcSxpeg0+wpAqCYrC56AfBTeOqxua0LKmKqpAVJd4PCXKL
         FUajvLvD2jzOg==
Date:   Tue, 18 May 2021 17:20:14 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Stanimir Varbanov <stanimir.varbanov@linaro.org>
Cc:     linuxarm@huawei.com, mauro.chehab@huawei.com,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org
Subject: Re: [PATCH v5 13/25] media: venus: core: use
 pm_runtime_resume_and_get()
Message-ID: <20210518172014.68f7a655@coco.lan>
In-Reply-To: <3f41387e-a15f-1e45-6b63-bd6ef647a47f@linaro.org>
References: <cover.1620314616.git.mchehab+huawei@kernel.org>
        <492e148ae1c7b0a8858c1670037925d3e4adb719.1620314616.git.mchehab+huawei@kernel.org>
        <adb102ab-c197-fdc8-4858-5683bd97baf4@linaro.org>
        <3f41387e-a15f-1e45-6b63-bd6ef647a47f@linaro.org>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Em Mon, 17 May 2021 18:26:14 +0300
Stanimir Varbanov <stanimir.varbanov@linaro.org> escreveu:

> Hi Mauro,
> 
> On 5/10/21 4:54 PM, Stanimir Varbanov wrote:
> > 
> > 
> > On 5/6/21 6:25 PM, Mauro Carvalho Chehab wrote:  
> >> Commit dd8088d5a896 ("PM: runtime: Add pm_runtime_resume_and_get to deal with usage counter")
> >> added pm_runtime_resume_and_get() in order to automatically handle
> >> dev->power.usage_count decrement on errors.
> >>
> >> Use the new API, in order to cleanup the error check logic.
> >>
> >> Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
> >> ---
> >>  drivers/media/platform/qcom/venus/pm_helpers.c | 3 +--
> >>  1 file changed, 1 insertion(+), 2 deletions(-)  
> > 
> > Tested-by: Stanimir Varbanov <stanimir.varbanov@linaro.org>
> > Acked-by: Stanimir Varbanov <stanimir.varbanov@linaro.org>
> >   
> 
> What is the plan for these venus patches. Do I need to take them through
> my Venus pull request for v5.14 or you will take them directly?

Whatever works best for you. In principle, I should apply them on my
tree probably tomorrow, if ok for you.

Regards,
Mauro

> 
> >>
> >> diff --git a/drivers/media/platform/qcom/venus/pm_helpers.c b/drivers/media/platform/qcom/venus/pm_helpers.c
> >> index c7e1ebec47ee..d0fddf5e9a69 100644
> >> --- a/drivers/media/platform/qcom/venus/pm_helpers.c
> >> +++ b/drivers/media/platform/qcom/venus/pm_helpers.c
> >> @@ -990,9 +990,8 @@ static int core_power_v4(struct venus_core *core, int on)
> >>  
> >>  	if (on == POWER_ON) {
> >>  		if (pmctrl) {
> >> -			ret = pm_runtime_get_sync(pmctrl);
> >> +			ret = pm_runtime_resume_and_get(pmctrl);
> >>  			if (ret < 0) {
> >> -				pm_runtime_put_noidle(pmctrl);
> >>  				return ret;
> >>  			}
> >>  		}
> >>  
> >   
> 



Thanks,
Mauro
