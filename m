Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C2CE3CE629
	for <lists+linux-media@lfdr.de>; Mon,  7 Oct 2019 16:55:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728019AbfJGOz4 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 7 Oct 2019 10:55:56 -0400
Received: from bombadil.infradead.org ([198.137.202.133]:39550 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727745AbfJGOz4 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 7 Oct 2019 10:55:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
        Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
        From:Date:Sender:Reply-To:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=LI8Q7C2YNukIfIFd7788eQ9/nEw1eNwIpCEuAzlBXMQ=; b=fi59Cnpgab24evPFQ2hyZ0kzs
        PDB8c118mbcq0CDZLerYic5EKSe7j1fhBe9iwfGT6HD4DMxPiqGLizL/95ut7eJWW+YBsOXTMrDbB
        yQiLqPZm8fgliYRTt1fDCNGKLPSNarE/uwOtuCIoca/1/QsOvTG1gPStfsZTrOYejaLWApEjDex0j
        pkdaI6LM9GNPYpjeyNfqtVUkJOK14LqqW2ll7gU4MAZvcoHV6U/92a9666A8p0jqyREc0gjnvFucy
        mtrL6ekwYOlsjOzogP9jWbQ02mRKkxH71QQo/DVAdUCnYy2FhY5jGwBCn3G344nznaRR1+h6zI3JD
        ayQaU+4dw==;
Received: from [179.95.33.153] (helo=coco.lan)
        by bombadil.infradead.org with esmtpsa (Exim 4.92.2 #3 (Red Hat Linux))
        id 1iHUQV-0000KH-KQ; Mon, 07 Oct 2019 14:55:56 +0000
Date:   Mon, 7 Oct 2019 11:55:51 -0300
From:   Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
To:     Stanimir Varbanov <stanimir.varbanov@linaro.org>
Cc:     Linux Media Mailing List <linux-media@vger.kernel.org>,
        Mauro Carvalho Chehab <mchehab@infradead.org>,
        Andy Gross <agross@kernel.org>, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH] media: venus: fix build on 32bit environments
Message-ID: <20191007115551.4619fb62@coco.lan>
In-Reply-To: <2f22ff7f-0e47-b03f-75bf-a9822afb0507@linaro.org>
References: <f8b266dea8594c046bd545ca1f497bfc1658835d.1570455418.git.mchehab+samsung@kernel.org>
        <2f22ff7f-0e47-b03f-75bf-a9822afb0507@linaro.org>
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Em Mon, 7 Oct 2019 17:38:53 +0300
Stanimir Varbanov <stanimir.varbanov@linaro.org> escreveu:

> Hi Mauro,
> 
> Thanks for the fix!
> 
> On 10/7/19 4:37 PM, Mauro Carvalho Chehab wrote:
> > As reported by jenkins@linuxtv.org, the build with i386 fails
> > with:
> > 
> > 	ld: drivers/media/platform/qcom/venus/helpers.o: in function `venus_helper_load_scale_clocks':
> > 	(.text+0x1d77): undefined reference to `__udivdi3'
> > 	ld: (.text+0x1dce): undefined reference to `__udivdi3'
> > 	make: *** [Makefile:1094: vmlinux] Error 1
> > 
> > That's because it divides an u32 bit integer by a u64 one.  
> 
> General question, shouldn't such errors been catch from builder on the
> pull request?

No, the pull request builder just builds drivers/media automatically
when a patch arrives patchwork.

This error only happens after a full build, when it tries to linkedit
vmlinux.

Due to time contraints, the complete build is done only after merging 
stuff at patchwork, as it may take hours to build for the platforms we
care.

My long term would be to push patches on a temporary tree, with would
start the builders. Only after all builders finish without issues, the
master one would be updated.

In thesis, jenkins supports it via pipelines. Basically, I would need to
setup a pipeline that:

1) it would fetch the latest tree on a common repository;

2) for each arch/config we support, it will start a builder;

3) after all builder process finishes, it will check if all builds
   went smoothly;

4) if everything runs smoothly, do a git fetch to the "permanent"
tree.

I quickly looked at Jenkins docs a few times: setting it doesn't
seem to be trivial, as it envolves learning a macro language that 
Jenkins uses internally. 

I failed to find a good documentation about the language it uses, and
was unable to find any example of a similar setup. All examples I
saw assumes that the tasks at the pipeline will use the same workspace.

I intend to seek for some time to better understand the pipeline
settings on Jenkins in the future.

> > Fix it by explicitly callind do_div.
> > 
> > That's said, why fps is a 64 bits integer?  
> 
> I don't have other explanation than - just to avoid casting after the
> math in vdec/venc_s_parm() functions.

IMO, avoiding the do_div() would be better than avoid the casting, but
that's your call.

> > 
> > Signed-off-by: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
> > ---
> >  drivers/media/platform/qcom/venus/helpers.c | 8 +++++++-
> >  1 file changed, 7 insertions(+), 1 deletion(-)
> > 
> > diff --git a/drivers/media/platform/qcom/venus/helpers.c b/drivers/media/platform/qcom/venus/helpers.c
> > index 5ea5d90f8e5f..09fa87e3c0a0 100644
> > --- a/drivers/media/platform/qcom/venus/helpers.c
> > +++ b/drivers/media/platform/qcom/venus/helpers.c
> > @@ -522,8 +522,14 @@ static unsigned long calculate_inst_freq(struct venus_inst *inst,
> >  	unsigned long vpp_freq = 0, vsp_freq = 0;
> >  	u64 fps = inst->fps;
> >  	u32 mbs_per_sec;
> > +	u64 tmp;
> > +  
> 
> you have extra blank line here.

Ok, I'll remove it.

> 
> > +
> > +	tmp = load_per_instance(inst);
> > +	do_div(tmp, inst->fps);
> > +
> > +	mbs_per_sec = (u32)tmp;
> >  
> > -	mbs_per_sec = load_per_instance(inst) / inst->fps;
> >  	vpp_freq = mbs_per_sec * inst->clk_data.codec_freq_data->vpp_freq;
> >  	/* 21 / 20 is overhead factor */
> >  	vpp_freq += vpp_freq / 20;
> >   
> 
> I guess this fix should be squashed with the commit which introduce it :(

Too late for that.

> Note taken, always build patches on i386 :/
> 



Thanks,
Mauro
