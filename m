Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2D10332C7F4
	for <lists+linux-media@lfdr.de>; Thu,  4 Mar 2021 02:13:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1383509AbhCDAdR (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 3 Mar 2021 19:33:17 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55610 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1447028AbhCCWmP (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 3 Mar 2021 17:42:15 -0500
Received: from mail-qk1-x733.google.com (mail-qk1-x733.google.com [IPv6:2607:f8b0:4864:20::733])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3FE92C061756
        for <linux-media@vger.kernel.org>; Wed,  3 Mar 2021 14:41:07 -0800 (PST)
Received: by mail-qk1-x733.google.com with SMTP id f124so7677029qkj.5
        for <linux-media@vger.kernel.org>; Wed, 03 Mar 2021 14:41:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20150623.gappssmtp.com; s=20150623;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=ou5L7MATCVFiCOKeY+rUslrUk/vuHRpSRzGMIAVIOnA=;
        b=P3TUIkYeYzEdxcJ4EmbPy25IRTjtLyfPNWUNuBxEkpXXv4aMQfIe169T9slRaHuwv1
         8xzeMmBPGDlFCOvhSi2nx31wi6vK2UsKeilGB7n6MuZ5lSXpdYNXw3mFDxhwEC2663ik
         urEIiur/6eX9hmCVAmMnlQwEWKp3IuvOBpBRnuSXBHkErQuBpftbjuwabN8Nu6BimLvI
         vYvlxS0Z2M3K6SzYfUW6oGYb/94JgddK1yAg4g0G6uSXjwTgv7K0QiCN0dCqWBCBmj4t
         XfOEAQEWvqco5cIZgbjoEZ3n8/5Zj9EHRcuGdahKq5jQTKZxd+Es4CnUip7MObCarIgb
         MW+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=ou5L7MATCVFiCOKeY+rUslrUk/vuHRpSRzGMIAVIOnA=;
        b=BgodA93EdBC468MQ1Jq6uuInnjSYul5Kb20b5F9Qn1oEAnN2uPtZ8A/ZdVVYqJmXxU
         WWy/kRpiiUgKctyPOgsRTp8Q4kEiQOufUKN60nGva1C8bWa4QJZ+2tGknKLpm5g8cAoV
         I7J1ZexBQuEEUu2Qpok/wF4XXzerG7QsLd83OqQeMQqRhslY5r5KsrRiDezwfdUQT5xy
         0cDF0aNUjPi+KAiHCsDG4PyQ4LKxDPyQMSwDY0gBj559zl9tEMSrtjscY8SGr9txqK75
         duR4QetAN6e/2nULpNrbfOxtBt10Gh1sC+rprvi0nZsIWehTvkjVKK6+TJyqmENUwH8Z
         ZgLw==
X-Gm-Message-State: AOAM530lQa9uGFHFoHhU06CDlqRJjHgxTfN41VZ5QW5T4pQwhSDIAAHX
        ZzygiIahaJVLWl0H8sZ9fAk7ciHGPGfc5jb+
X-Google-Smtp-Source: ABdhPJx9E85x4Yiqoetm8Jxc2KBcJMzwRTlT6NZjl7JZootxrXAccNtu3woVEHMDe+QSO8DjdECmEA==
X-Received: by 2002:a37:886:: with SMTP id 128mr1409402qki.430.1614811265634;
        Wed, 03 Mar 2021 14:41:05 -0800 (PST)
Received: from nicolas-tpx395.lan (173-246-12-168.qc.cable.ebox.net. [173.246.12.168])
        by smtp.gmail.com with ESMTPSA id d84sm3502865qke.53.2021.03.03.14.41.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Mar 2021 14:41:04 -0800 (PST)
Message-ID: <2a70dbaaee14acd5652c80df2176ac9b183c6e1b.camel@ndufresne.ca>
Subject: Re: v4l2loopback and v4l2-mem2mem framework
From:   Nicolas Dufresne <nicolas@ndufresne.ca>
To:     Wren Turkal <wt@penguintechs.org>,
        Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Cc:     linux-media <linux-media@vger.kernel.org>
Date:   Wed, 03 Mar 2021 17:41:02 -0500
In-Reply-To: <b0c87b78-de21-07b5-6ae0-39401cf005b9@penguintechs.org>
References: <45cda97c-a0e4-eef2-ba8f-ddc7e33b40d5@penguintechs.org>
         <4cdd691f-dc55-fc6e-1830-ac0c24b8e96b@penguintechs.org>
         <CAAEAJfCSfwxv5NyaH05Dfiw4wm6vGxL_ajoFup6r-GKx_VymJA@mail.gmail.com>
         <86f1dd6b-7593-adba-b5a6-abf4f8e35d8b@penguintechs.org>
         <b0c87b78-de21-07b5-6ae0-39401cf005b9@penguintechs.org>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.38.3 (3.38.3-1.fc33) 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Le mardi 02 mars 2021 à 14:08 -0800, Wren Turkal a écrit :
> Okay, so I tried to write up a little bit of an RFC to organize my
> thoughts. I would love to get your thoughts:
> 
> RFC: A loopback device for the v4l2 subsystem.
> 
> # What is needed?
> 
> The common denominator for apps that use webcams in linux is the
> v4l2 subsystem. The v4l2 subsystem could benefit from a loopback
> device that allows one to compose custom video streams and present
> them in a normal way from a /dev/video* device.
> 
> # Why is it needed?
> 
> The v4l2 is the framework is the kernel interface used for supporting
> video output and video capture. This brings the webcam video to apps
> like Cheese or a web browser or OBS.
> 
> However, there is no way to customize the composition of the video
> stream before capture on these apps. Of course, apps like Cheese have
> filters, but this is not something that is composible with other apps.
> This makes it impossible to do something like the following:
> 
> * Composite a video scene with OBS.
> * Use that composed video as my webcam for my Zoom call.
> 
> I think this would be cool, and I think that it would allow interesting
> things to be done with video.
> 
> # Prior Art
> 
> The v4l2loopback project[1] provides a Linux kernel module to do just
> this. This module provides a misc device node used to control the
> loopback video devices. In particular, the misc device is used to create
> and destroy loopback video devices. It's somewhat similar to the
> /dev/loop-control dev node that is used to control block loop devices.
> 
> There is also the vim2m test driver[2] in the kernel that appears to do
> some similar things. This module is a module that is used for testing
> the v4l2-mem2mem framework. This module has a more modern structure with
> a platform device that is used as the context for the other devices.
> It also uses the m2m framework that I think could benefit an in-kernel
> loopback implementation. It is also important to note that this module
> does not generally ship with distribution kernels (like in Fedora),
> likely due to the "test" designation.

No, since m2m are instance base, you cannot have two process operating on the
same node (there is only 1 streaming state). You'd probably want to look at
extending the VIMC driver instead. It's a virtual media controller, it's missing
few bits to make loopback possible, but would be a good fit.

Note that vivid have a loopback capability, but it does not constraint the
width/height/format and will produce a test pattern if you request something
that differ from the source.

> 
> # Possible paths forward
> 
> ## Integrate v4l2loopback into the kernel
> 
> There is a lot to cleanup in the v4l2loopback code in order to get it
> in shape for mainline inclusion. Having said that, this also a somewhat
> tested implementation. There are even packages for using this project
> from Ubuntu.

It is very buggy, it often return a queued buffer back, and in fact, if you try
to use the queue too much it fails. Though all this would probably be fine if
you port it to VB2.

> 
> ## Start with vim2m
> 
> I think the vim2m.c could provide a really strong base on which to
> start a loopback implementation for the kernel. I see two options:
> 
> * Extend vim2m to include more loopback functionality, including
>    dynamic creation/deletion of video loopback devices.
> * Copy the vim2m code to a new module and develop there.
> 
> The extend option is attractive so that a new module mustn't be
> developed.
> 
> However, I am not sure that I want to complicate that module with
> options that would required for a proper loopback implementation.
> 
> # My thoughts on where to go next
> 
> I think that the vim2m module provides a much nicer starting point for
> an implementation of a mainline module. I think the the ideal solution
> would start by using the vim2m source as a template and developing a
> new module that incorporates the important functionality from
> v4l2loopback.
> 
> # Assumptions I have
> 
> I have looked into the code, and the m2m framework appears to provide a
> pair of vb2_queues that can be used for capture and output. I am assuming
> that the framework would be reasonable to use for a loopback implementation.
> 
> [1] https://github.com/umlaeute/v4l2loopback
> [2] 
>   
> https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/tree/drivers/media/test-drivers/vim2m.c?h=v5.11.2
> 
> Thanks,
> wt
> 
> On 3/2/21 10:03 AM, Wren Turkal wrote:
> > Ezequiel,
> > 
> > Submitting for upstream inclusion is a good idea, and the driver
> > is licensed appropriately (gpl v2) for the kernel. I have asked
> > the current maintainer for their thoughts. They are supportive
> > of the idea, but they are in the middle of implementing an new
> > feature that they would like to finish. I will work it up for
> > inclusion when that work concludes since it's a pretty major change.
> > 
> > Having said that, does the patch I posted make sense? I think
> > that being able to enable the m2m framework without having to
> > build in a m2m driver explicitly makes good sense.
> > 
> > Also, thinking about this a little more, it might make more
> > sense use use vim2m and v4l2loopback as inspiration and
> > make something like loopback that looks more like vim2m.
> > 
> > Things I like about vim2m vs v4l2loopback right now:
> > * vim2m uses the m2m framework
> > * vim2m is better organized by using a platform device
> >   to organize the devices that created under the context
> >   of the platform device. v4l2lb uses a misc device and
> >   doesn't explicitly place devices under in the context
> >   of that device.
> > * The misc device created by v4l2lb is used to
> >   dynamically add and remove v4l2lb video devices. It
> >   It uses new IOCTLs to do that, which I wonder if there
> >   is a better way.
> > * vim2m exposes config via a mechanism that doesn't
> >   require a new tool. v4l2lb requires a new control
> >   binary because of the custom ioctls.
> > 
> > So, I have a couple questions:
> > * Would it be better to use vim2m as a model to
> >   implement something like v4l2loopback?
> > * If I were to do that should I copy vim2m to a
> >   new module, or should vim2m be extended. FWIW,
> >   vim2m appears to have two things against it:
> >   * vim2m is a test v4l2 driver. It would need
> >     to be changed to build as a non-test driver.
> >     This is a pretty easy Kconfig change and maybe
> >     moving files to a more appropriate place in the
> >     linux source tree.
> >   * v4l2loopback does have a number of features that
> >     vim2m does not have. I will say that I think
> >     that adding most importantant functionality
> >     (new formats and dynamic creation of loopback
> >     video devices in my mind) is probably very
> >     approachable and may give us a more modern
> >     linux module code.
> > 
> > Give the above, I am kinda leaning toward extending
> > vim2m code. So, do you have an opinion on the following?
> > Should it be a new module, or should it literally extend
> > and improve vim2m?
> > 
> > wt
> > 
> > 
> > On 3/1/21 6:11 PM, Ezequiel Garcia wrote:
> > > Hi Wren,
> > > 
> > > How about you submit the loopback driver for integration in mainline?
> > > 
> > > We can review the driver, give feedback and help you get it merged.
> > > 
> > > Ezequiel
> > > 
> > > 
> > > On Mon, Mar 1, 2021, 5:32 PM Wren Turkal <wt@penguintechs.org 
> > > <mailto:wt@penguintechs.org>> wrote:
> > > 
> > >     Okay, so I have found how to enable the option to be manually
> > >     selected.
> > >     Would a patch like the following be acceptable? Or is there a better
> > >     way to do this?
> > > 
> > >     diff --git a/drivers/media/v4l2-core/Kconfig
> > >     b/drivers/media/v4l2-core/Kconfig
> > >     index bf49f83cb86f..25004137a982 100644
> > >     --- a/drivers/media/v4l2-core/Kconfig
> > >     +++ b/drivers/media/v4l2-core/Kconfig
> > >     @@ -54,7 +54,7 @@ config V4L2_H264
> > > 
> > >       # Used by drivers that need v4l2-mem2mem.ko
> > >       config V4L2_MEM2MEM_DEV
> > >     -       tristate
> > >     +       tristate "V4L2 mem2mem framework support"
> > >              depends on VIDEOBUF2_CORE
> > > 
> > >       # Used by LED subsystem flash drivers
> > > 
> > > 
> > >     Thanks,
> > >     wt
> > > 
> > >     On 2/28/21 2:07 PM, Wren Turkal wrote:
> > >     > Hi there linux-media experts,
> > >     >
> > >     > I am working on the out-of-tree v4l2loopback module[1]. My
> > >     > current goal is to implement the videobuf2 api. However,
> > >     > it appears that I must use a different vbuf2_queue for the
> > >     > OUTPUT and CAPTURE types. It appears that the mem2mem
> > >     > framework has the ability to do just this. I came to this
> > >     > conclusion while looking at the vim2m test module's code.
> > >     > While trying to modify the loopback module, I have added
> > >     > some code to try to call v4l2_m2m_init. You can see my very
> > >     > WIP attempt at code here[2].
> > >     >
> > >     > I have installed the kernel-devel package on Fedora, which.
> > >     > Unfortunately, I get he following error messages when trying
> > >     > to compile:
> > >     >
> > >     > <errors>
> > >     > ERROR: modpost: "v4l2_m2m_release"
> > >     > [/home/wt/projects/kernel/v4l2loopback/v4l2loopback.ko] undefined!
> > >     > ERROR: modpost: "v4l2_m2m_init"
> > >     > [/home/wt/projects/kernel/v4l2loopback/v4l2loopback.ko] undefined!
> > >     > </errors>
> > >     >
> > >     > So, I looked into it, and Module.symvers and /proc/kallsyms
> > >     > don't have those symbols listed, so I think the Fedora kernel
> > >     > was not compiled with those symbols exported.
> > >     >
> > >     > Okay, so next I tried to build a custom kernel that does
> > >     > export those symbols. I managed to get it done by enabling
> > >     > the vim2m (VIDEO_VIM2M config option) module. The new
> > >     > Module.symvers includes the symbols; and the compile succeeds,
> > >     > which brings me to my final act.
> > >     >
> > >     > I need to expose those symbols without enabling the vim2m
> > >     > module since it is a testing module. I do not see a way
> > >     > to do that explicitly. The config option in question
> > >     > appears to be V4L2_MEM2MEM_DEV. And I haven't found a
> > >     > way to enable it without enabling something that implicitly
> > >     > selects it (which vim2m does). Do y'all have any suggestions
> > >     > for how to get these symbols exported properly when vim2m is
> > >     > not enabled?
> > >     >
> > >     >
> > >     > Thanks,
> > >     > Wren Turkal (wt)
> > >     >
> > >     > [1] https://github.com/umlaeute/v4l2loopback
> > >     <https://github.com/umlaeute/v4l2loopback>
> > >     > [2] https://github.com/wt/v4l2loopback/tree/m2m_try
> > >     <https://github.com/wt/v4l2loopback/tree/m2m_try>
> > > 
> > 
> 


