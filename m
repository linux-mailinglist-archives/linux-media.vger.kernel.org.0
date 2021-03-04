Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 03F0632DA1E
	for <lists+linux-media@lfdr.de>; Thu,  4 Mar 2021 20:12:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232608AbhCDTLr (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 4 Mar 2021 14:11:47 -0500
Received: from mail.kernel.org ([198.145.29.99]:40152 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231889AbhCDTLl (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 4 Mar 2021 14:11:41 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 5BD8964F69;
        Thu,  4 Mar 2021 19:10:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1614885060;
        bh=bF4062QaI8wEEuNNaZKNU7IwYMwBHfTdEkKeMscshJQ=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=OWYA0oFgGzgGF4p3w9EtBSohn+Vu2eWTQByW3SORAvio+kwj5+vRYJeVNZipg8H85
         oGWwB/kthnxo4MUP+pi69xr8t0PBernXGOqhCF0dcFtO6rLSy8j+j40O7Gm+FtIaPu
         WUqqHPvStldiDAfWeWrXpNhjENAJCAC3Fpvm8Tkmae3nc3PbNTx76J8DJ3ZzQxRp+G
         QWZQFW4V/02gTc1Q66goUTf9CCCMTriG8rM5A/VD6DLMGMnR82z/CU7zzavLbHrf6U
         RvenIOq/7au3pyM1FYFK33CXtKO9FpbAL+03+mdwhHaR/dGi+IEpK3V+LKBQ+ySlWJ
         aOjj1MQbJVIOw==
Date:   Thu, 4 Mar 2021 20:10:55 +0100
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Cc:     Wren Turkal <wt@penguintechs.org>,
        linux-media <linux-media@vger.kernel.org>
Subject: Re: v4l2loopback and v4l2-mem2mem framework
Message-ID: <20210304201055.78145b04@coco.lan>
In-Reply-To: <CAAEAJfAyuGwL==BHwyEwF0dMfrUQacEQyv8+zz82_P+BM-C5bw@mail.gmail.com>
References: <45cda97c-a0e4-eef2-ba8f-ddc7e33b40d5@penguintechs.org>
        <4cdd691f-dc55-fc6e-1830-ac0c24b8e96b@penguintechs.org>
        <CAAEAJfAyuGwL==BHwyEwF0dMfrUQacEQyv8+zz82_P+BM-C5bw@mail.gmail.com>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Em Tue, 2 Mar 2021 05:01:16 -0300
Ezequiel Garcia <ezequiel@vanguardiasur.com.ar> escreveu:

> Hi Wren,
> 
> How about you submit the loopback driver for integration in mainline?
> We can review the driver, give feedback and help you get it merged.

Please, don't top post.

The loopback driver is not something that could be merged. It was
already submitted a few times.

One of the main issues is that userspace may sleep, and this could cause
some bad effects and even hangups due to V4L2 core and VB2 mutex and
spin locks.

Regards,
Mauro

> 
> Ezequiel
> 
> On Mon, 1 Mar 2021 at 17:32, Wren Turkal <wt@penguintechs.org> wrote:
> >
> > Okay, so I have found how to enable the option to be manually selected.
> > Would a patch like the following be acceptable? Or is there a better
> > way to do this?
> >
> > diff --git a/drivers/media/v4l2-core/Kconfig
> > b/drivers/media/v4l2-core/Kconfig
> > index bf49f83cb86f..25004137a982 100644
> > --- a/drivers/media/v4l2-core/Kconfig
> > +++ b/drivers/media/v4l2-core/Kconfig
> > @@ -54,7 +54,7 @@ config V4L2_H264
> >
> >   # Used by drivers that need v4l2-mem2mem.ko
> >   config V4L2_MEM2MEM_DEV
> > -       tristate
> > +       tristate "V4L2 mem2mem framework support"
> >          depends on VIDEOBUF2_CORE
> >
> >   # Used by LED subsystem flash drivers
> >
> >
> > Thanks,
> > wt
> >
> > On 2/28/21 2:07 PM, Wren Turkal wrote:  
> > > Hi there linux-media experts,
> > >
> > > I am working on the out-of-tree v4l2loopback module[1]. My
> > > current goal is to implement the videobuf2 api. However,
> > > it appears that I must use a different vbuf2_queue for the
> > > OUTPUT and CAPTURE types. It appears that the mem2mem
> > > framework has the ability to do just this. I came to this
> > > conclusion while looking at the vim2m test module's code.
> > > While trying to modify the loopback module, I have added
> > > some code to try to call v4l2_m2m_init. You can see my very
> > > WIP attempt at code here[2].
> > >
> > > I have installed the kernel-devel package on Fedora, which.
> > > Unfortunately, I get he following error messages when trying
> > > to compile:
> > >
> > > <errors>
> > > ERROR: modpost: "v4l2_m2m_release"
> > > [/home/wt/projects/kernel/v4l2loopback/v4l2loopback.ko] undefined!
> > > ERROR: modpost: "v4l2_m2m_init"
> > > [/home/wt/projects/kernel/v4l2loopback/v4l2loopback.ko] undefined!
> > > </errors>
> > >
> > > So, I looked into it, and Module.symvers and /proc/kallsyms
> > > don't have those symbols listed, so I think the Fedora kernel
> > > was not compiled with those symbols exported.
> > >
> > > Okay, so next I tried to build a custom kernel that does
> > > export those symbols. I managed to get it done by enabling
> > > the vim2m (VIDEO_VIM2M config option) module. The new
> > > Module.symvers includes the symbols; and the compile succeeds,
> > > which brings me to my final act.
> > >
> > > I need to expose those symbols without enabling the vim2m
> > > module since it is a testing module. I do not see a way
> > > to do that explicitly. The config option in question
> > > appears to be V4L2_MEM2MEM_DEV. And I haven't found a
> > > way to enable it without enabling something that implicitly
> > > selects it (which vim2m does). Do y'all have any suggestions
> > > for how to get these symbols exported properly when vim2m is
> > > not enabled?
> > >
> > >
> > > Thanks,
> > > Wren Turkal (wt)
> > >
> > > [1] https://github.com/umlaeute/v4l2loopback
> > > [2] https://github.com/wt/v4l2loopback/tree/m2m_try  
> >  



Thanks,
Mauro
