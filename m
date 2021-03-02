Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2A7AC32A859
	for <lists+linux-media@lfdr.de>; Tue,  2 Mar 2021 18:42:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1580205AbhCBRal (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 2 Mar 2021 12:30:41 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41014 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1349450AbhCBILu (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 2 Mar 2021 03:11:50 -0500
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com [IPv6:2a00:1450:4864:20::534])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A9525C061788
        for <linux-media@vger.kernel.org>; Tue,  2 Mar 2021 00:01:29 -0800 (PST)
Received: by mail-ed1-x534.google.com with SMTP id d13so18976758edp.4
        for <linux-media@vger.kernel.org>; Tue, 02 Mar 2021 00:01:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=vanguardiasur-com-ar.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=entmvbZ8i681EpzN5mf9CCRSjm4HEIDRlW5kbwcaU3M=;
        b=idELUY6CRBJ1OZND+CUSdd7nD3zXIycLJlx3qbuVVxA+wJSuT/H9vk0NOsYtrgkAtS
         zfO+SNxzCHI9bwkoexVT+jJjI2DppPSkeDnqTYVvPHeLJUqhts2xNLWddP1Fr6fVKGqW
         kApQbd0qROPZCCLzaPQt40M49mPH6HkX16OQCk2TOYU2Kj1WWllnEDL9JfEbYeS+mEFP
         d6W2iEN7nPDV4hs/lHVuhDhtzQHaIrHmmwXz4d4OCcJ8k6G5QBJFQ+sdo1TF7tovJkCK
         1pwOli0c8UGsZ83oOkJF5u7da4z6VRzwVMCHANKx5Y3FihJ4nm38nBMkgHuDvS3GG8U4
         P8lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=entmvbZ8i681EpzN5mf9CCRSjm4HEIDRlW5kbwcaU3M=;
        b=WK9Fdj2sRTCiaPGc2konsTTbdBTAMkou7f9SdidvS3KECrMVUm2vjiyYVDYF6m55kw
         YhewkhjB1ykjy1QwbdjEpmRVN1S56lwa31qbqpAVOOhHuROzO/+VsiTteZVXlXKw9R6C
         IKHpWdrJe2EmSa6Z1iWwajsmy8L1Y6HR03sJdNlfTrcovQxCNA1YAr4whrM3mrN04DUZ
         xKx+K5L6nF6HmwEovkRh1bjUN1r/F4gtBmhGXAT1WBsvDO8iuLRN8QGYxX3Hk+bl412Y
         HCAy1Nw0vKY8SKx3txkma4+r9dPAX3iL2f4RAsGz9LU/UyiwYHLydAaDvKjQJCJ7biqf
         WAsQ==
X-Gm-Message-State: AOAM531uVjUwaTAziLzibhFSox0L+10TBm4Toz8gCr1MzW1VwmJiij47
        w5I3DiPdbVqRe58YzZz+JakhhYrwQbqloDTgvy0uQFgONrUCUA==
X-Google-Smtp-Source: ABdhPJwR2Td6Lrkz7TWuhSCAP4TraqjqPIb2RjyBHyuUqglXrHHRAwLOrqOWfN3E42U2XCRAIdG4zOGe8KHPRtwO3RQ=
X-Received: by 2002:aa7:cf14:: with SMTP id a20mr5226991edy.49.1614672088286;
 Tue, 02 Mar 2021 00:01:28 -0800 (PST)
MIME-Version: 1.0
References: <45cda97c-a0e4-eef2-ba8f-ddc7e33b40d5@penguintechs.org> <4cdd691f-dc55-fc6e-1830-ac0c24b8e96b@penguintechs.org>
In-Reply-To: <4cdd691f-dc55-fc6e-1830-ac0c24b8e96b@penguintechs.org>
From:   Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Date:   Tue, 2 Mar 2021 05:01:16 -0300
Message-ID: <CAAEAJfAyuGwL==BHwyEwF0dMfrUQacEQyv8+zz82_P+BM-C5bw@mail.gmail.com>
Subject: Re: v4l2loopback and v4l2-mem2mem framework
To:     Wren Turkal <wt@penguintechs.org>
Cc:     linux-media <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Wren,

How about you submit the loopback driver for integration in mainline?
We can review the driver, give feedback and help you get it merged.

Ezequiel

On Mon, 1 Mar 2021 at 17:32, Wren Turkal <wt@penguintechs.org> wrote:
>
> Okay, so I have found how to enable the option to be manually selected.
> Would a patch like the following be acceptable? Or is there a better
> way to do this?
>
> diff --git a/drivers/media/v4l2-core/Kconfig
> b/drivers/media/v4l2-core/Kconfig
> index bf49f83cb86f..25004137a982 100644
> --- a/drivers/media/v4l2-core/Kconfig
> +++ b/drivers/media/v4l2-core/Kconfig
> @@ -54,7 +54,7 @@ config V4L2_H264
>
>   # Used by drivers that need v4l2-mem2mem.ko
>   config V4L2_MEM2MEM_DEV
> -       tristate
> +       tristate "V4L2 mem2mem framework support"
>          depends on VIDEOBUF2_CORE
>
>   # Used by LED subsystem flash drivers
>
>
> Thanks,
> wt
>
> On 2/28/21 2:07 PM, Wren Turkal wrote:
> > Hi there linux-media experts,
> >
> > I am working on the out-of-tree v4l2loopback module[1]. My
> > current goal is to implement the videobuf2 api. However,
> > it appears that I must use a different vbuf2_queue for the
> > OUTPUT and CAPTURE types. It appears that the mem2mem
> > framework has the ability to do just this. I came to this
> > conclusion while looking at the vim2m test module's code.
> > While trying to modify the loopback module, I have added
> > some code to try to call v4l2_m2m_init. You can see my very
> > WIP attempt at code here[2].
> >
> > I have installed the kernel-devel package on Fedora, which.
> > Unfortunately, I get he following error messages when trying
> > to compile:
> >
> > <errors>
> > ERROR: modpost: "v4l2_m2m_release"
> > [/home/wt/projects/kernel/v4l2loopback/v4l2loopback.ko] undefined!
> > ERROR: modpost: "v4l2_m2m_init"
> > [/home/wt/projects/kernel/v4l2loopback/v4l2loopback.ko] undefined!
> > </errors>
> >
> > So, I looked into it, and Module.symvers and /proc/kallsyms
> > don't have those symbols listed, so I think the Fedora kernel
> > was not compiled with those symbols exported.
> >
> > Okay, so next I tried to build a custom kernel that does
> > export those symbols. I managed to get it done by enabling
> > the vim2m (VIDEO_VIM2M config option) module. The new
> > Module.symvers includes the symbols; and the compile succeeds,
> > which brings me to my final act.
> >
> > I need to expose those symbols without enabling the vim2m
> > module since it is a testing module. I do not see a way
> > to do that explicitly. The config option in question
> > appears to be V4L2_MEM2MEM_DEV. And I haven't found a
> > way to enable it without enabling something that implicitly
> > selects it (which vim2m does). Do y'all have any suggestions
> > for how to get these symbols exported properly when vim2m is
> > not enabled?
> >
> >
> > Thanks,
> > Wren Turkal (wt)
> >
> > [1] https://github.com/umlaeute/v4l2loopback
> > [2] https://github.com/wt/v4l2loopback/tree/m2m_try
>
