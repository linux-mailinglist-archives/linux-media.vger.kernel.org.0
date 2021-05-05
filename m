Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B4DF2373D96
	for <lists+linux-media@lfdr.de>; Wed,  5 May 2021 16:23:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232836AbhEEOYc (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 5 May 2021 10:24:32 -0400
Received: from mail.kernel.org ([198.145.29.99]:42118 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232283AbhEEOYb (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 5 May 2021 10:24:31 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 22F9361029;
        Wed,  5 May 2021 14:23:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1620224614;
        bh=fHzvZb04EncTIhKLD9UpQo/lk3yj1BkGTtkLC0Aet3s=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=eR+gstgGSeKG+jWCsGQlOUU36DMvvYokFuDdQ8fWjhCk8SwIcIUeRsqMiy1w9JzOQ
         olgBZoyo/vuZ3T6yhYdZkzp76Wt/WHpTuyt6rusu8cCI7MhauTYQIlJLD8bUCeiWKQ
         a8vnBbb2ISRqNebLFV1/Qpud/P7sJDlJyy17vcNNHi+790hKOJcHxjTwbi70yt7LMR
         klp08xMRp1mXYk928MshmGC8Li2JXImIuvuLGPT9amHX95fyA2jXKdqWJFBKZISGve
         1+5qAtjO7WDzl5NYuFt+9rMdMyUZLBaQRFrpP3sbObpd/8xvzDoDey3oACapIaVrIc
         08Zz5Gi6x+aPQ==
Date:   Wed, 5 May 2021 16:23:28 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     "Rui Miguel Silva" <rmfrfs@gmail.com>
Cc:     "Jonathan Cameron" <Jonathan.Cameron@Huawei.com>,
        <linuxarm@huawei.com>, <mauro.chehab@huawei.com>,
        "Fabio Estevam" <festevam@gmail.com>,
        "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>,
        "Mauro Carvalho Chehab" <mchehab@kernel.org>,
        "NXP Linux Team" <linux-imx@nxp.com>,
        "Pengutronix Kernel Team" <kernel@pengutronix.de>,
        "Philipp Zabel" <p.zabel@pengutronix.de>,
        "Sascha Hauer" <s.hauer@pengutronix.de>,
        "Shawn Guo" <shawnguo@kernel.org>,
        "Steve Longerbeam" <slongerbeam@gmail.com>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <linux-media@vger.kernel.org>,
        <linux-staging@lists.linux.dev>
Subject: Re: [PATCH 02/25] staging: media: imx7-mipi-csis: fix
 pm_runtime_get_sync() usage count
Message-ID: <20210505162328.1e5fff80@coco.lan>
In-Reply-To: <CB5D4B64QTP4.GBH80G3VX3B6@arch-thunder>
References: <cover.1620207353.git.mchehab+huawei@kernel.org>
        <793a5806a63b6313606fd1c344b9eec41e61a440.1620207353.git.mchehab+huawei@kernel.org>
        <20210505120652.00001236@Huawei.com>
        <CB5D4B64QTP4.GBH80G3VX3B6@arch-thunder>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Em Wed, 05 May 2021 14:56:40 +0100
"Rui Miguel Silva" <rmfrfs@gmail.com> escreveu:

> Hi,
> On Wed May 5, 2021 at 12:06 PM WEST, Jonathan Cameron wrote:
> 
> > On Wed, 5 May 2021 11:41:52 +0200
> > Mauro Carvalho Chehab <mchehab+huawei@kernel.org> wrote:
> >  
> > > The pm_runtime_get_sync() internally increments the
> > > dev->power.usage_count without decrementing it, even on errors.
> > > Replace it by the new pm_runtime_resume_and_get(), introduced by:
> > > commit dd8088d5a896 ("PM: runtime: Add pm_runtime_resume_and_get to deal with usage counter")
> > > in order to properly decrement the usage counter, avoiding
> > > a potential PM usage counter leak.
> > > 
> > > Acked-by: Rui Miguel Silva <rmfrfs@gmail.com>
> > > Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>  
> >
> > Not a fix as far as I can see, just a cleanup - so perhaps not this set?  
> 
> yes, the original changelog of this patch, that I acked,  made it
> clear it was a cleanup:
> 
> "
> Commit dd8088d5a896 ("PM: runtime: Add pm_runtime_resume_and_get to
> deal with usage counter")                                                                                                                                         
> added pm_runtime_resume_and_get() in order to automatically handle 
> dev->power.usage_count decrement on errors.
> 
> Use the new API, in order to cleanup the error check logic.
> "
> 
> This one above is new, but I saw Mauro is going change it.

Yes, I'll change the subject/description to the
"use pm_runtime_resume_and_get()" one on this patch, as there's
no issue to be fixed here, just a cleanup ;-)

Sorry for the mess. I did lots of rebase on ~80 patch series
over the last couple of days, based on the reviews (and my own
internal reviews)...

See, the current patchset has ~80 patches with ~30% contained
fixes. It shows that writing a balanced PM runtime code is not
so trivial ;-)

Thanks,
Mauro
