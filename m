Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B6AF4CEA9B
	for <lists+linux-media@lfdr.de>; Mon,  7 Oct 2019 19:29:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728185AbfJGR3F (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 7 Oct 2019 13:29:05 -0400
Received: from bombadil.infradead.org ([198.137.202.133]:45976 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727801AbfJGR3F (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 7 Oct 2019 13:29:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
        Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
        From:Date:Sender:Reply-To:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=mAZpKKLW5QL9YA2y+0y83J0N3ODcJsclSzGxVPFdbY4=; b=VaafqPdJr89+0vROfi8/I+N6X
        KXnrDA8EojLWgR3o2FvYOIa1CMkMc/RFeAxSISkELOmL8psTETC9mMvOjjaoixTIjpSJFVcmoKc9u
        Odw+sb7uGU8TLPvdYuBgLvwUcMl70TBCqBvTBtUwerUMkoBvlQW2WXkCk5Hr+cMTuItGJRdBiLAVk
        U0ZgltGG45ZSpAUaB9M6/AVwWoOL/FCpi6343zE8lyROzdOaTOygJqWeywG/nw/E/9UbaWml0+1VX
        p3ilT5phPJdQ+qGgkS2e1Pzg8joqzWfulgC5XqSYsyb8SkTeUSrSpNAQyIb2feB2+yUGc79Fn+Asp
        bLd4uNeHg==;
Received: from [179.95.33.153] (helo=coco.lan)
        by bombadil.infradead.org with esmtpsa (Exim 4.92.2 #3 (Red Hat Linux))
        id 1iHWof-0004SI-VU; Mon, 07 Oct 2019 17:29:04 +0000
Date:   Mon, 7 Oct 2019 14:28:58 -0300
From:   Mauro Carvalho Chehab <mchehab@infradead.org>
To:     Stanimir Varbanov <stanimir.varbanov@linaro.org>
Cc:     Linux Media Mailing List <linux-media@vger.kernel.org>,
        Andy Gross <agross@kernel.org>, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH] media: venus: fix build on 32bit environments
Message-ID: <20191007142858.3602db8d@coco.lan>
In-Reply-To: <20191007115551.4619fb62@coco.lan>
References: <f8b266dea8594c046bd545ca1f497bfc1658835d.1570455418.git.mchehab+samsung@kernel.org>
        <2f22ff7f-0e47-b03f-75bf-a9822afb0507@linaro.org>
        <20191007115551.4619fb62@coco.lan>
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <mchehab@infradead.org> by bombadil.infradead.org. See http://www.infradead.org/rpr.html
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Em Mon, 7 Oct 2019 11:55:51 -0300
Mauro Carvalho Chehab <mchehab+samsung@kernel.org> escreveu:

> Em Mon, 7 Oct 2019 17:38:53 +0300
> Stanimir Varbanov <stanimir.varbanov@linaro.org> escreveu:
> 
> > Hi Mauro,
> > 
> > Thanks for the fix!
> > 
> > On 10/7/19 4:37 PM, Mauro Carvalho Chehab wrote:  
> > > As reported by jenkins@linuxtv.org, the build with i386 fails
> > > with:
> > > 
> > > 	ld: drivers/media/platform/qcom/venus/helpers.o: in function `venus_helper_load_scale_clocks':
> > > 	(.text+0x1d77): undefined reference to `__udivdi3'
> > > 	ld: (.text+0x1dce): undefined reference to `__udivdi3'
> > > 	make: *** [Makefile:1094: vmlinux] Error 1
> > > 
> > > That's because it divides an u32 bit integer by a u64 one.    
> > 
> > General question, shouldn't such errors been catch from builder on the
> > pull request?  
> 
> No, the pull request builder just builds drivers/media automatically
> when a patch arrives patchwork.
> 
> This error only happens after a full build, when it tries to linkedit
> vmlinux.
> 
> Due to time contraints, the complete build is done only after merging 
> stuff at patchwork, as it may take hours to build for the platforms we
> care.
> 
> My long term would be to push patches on a temporary tree, with would
> start the builders. Only after all builders finish without issues, the
> master one would be updated.
> 
> In thesis, jenkins supports it via pipelines. Basically, I would need to
> setup a pipeline that:
> 
> 1) it would fetch the latest tree on a common repository;
> 
> 2) for each arch/config we support, it will start a builder;
> 
> 3) after all builder process finishes, it will check if all builds
>    went smoothly;
> 
> 4) if everything runs smoothly, do a git fetch to the "permanent"
> tree.
> 
> I quickly looked at Jenkins docs a few times: setting it doesn't
> seem to be trivial, as it envolves learning a macro language that 
> Jenkins uses internally. 
> 
> I failed to find a good documentation about the language it uses, and
> was unable to find any example of a similar setup. All examples I
> saw assumes that the tasks at the pipeline will use the same workspace.
> 
> I intend to seek for some time to better understand the pipeline
> settings on Jenkins in the future.

Ok, I'm investing some time on trying to set a single pipeline that will
handle all Kernel builds at once. It should take some time for it
to run, but hopefully I may be able to replace it by the individual
build jobs and, on some future, use it to automate the push to my
master branch in order to happen only after passing the tests.

The pipeline is at:

	https://builder.linuxtv.org/job/media_kernel_pipeline/

Just the fetching time usually takes ~30 mins or so. So, it should
take a while to be sure that what I wrote would do the right thing.

Thanks,
Mauro
