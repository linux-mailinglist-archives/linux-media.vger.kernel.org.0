Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B8732423D6B
	for <lists+linux-media@lfdr.de>; Wed,  6 Oct 2021 14:02:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238167AbhJFMEe (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 6 Oct 2021 08:04:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59944 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238265AbhJFMEd (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 6 Oct 2021 08:04:33 -0400
Received: from mail-io1-xd2c.google.com (mail-io1-xd2c.google.com [IPv6:2607:f8b0:4864:20::d2c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6644EC061753
        for <linux-media@vger.kernel.org>; Wed,  6 Oct 2021 05:02:41 -0700 (PDT)
Received: by mail-io1-xd2c.google.com with SMTP id b78so2527921iof.2
        for <linux-media@vger.kernel.org>; Wed, 06 Oct 2021 05:02:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ER+sBbbmOujTnlV3dTXGLJ1LPOZvb7rLVMW0+nPLGLY=;
        b=h3PHJNXebsQnHv57F0M9bQn6auKzndWEPHovEka2Ka6Z/kZChPeOVTTPBBRBXzl94K
         PpLOw/k1CFa4jcqTW69xBsOP8406bakdVhVRpxvmysr/ufS+O+xyiYSZK5GWdO14SEtE
         Zms1e7z3wcRG62YbqcSpiaLDUvNtI/T1NGftlcfdvB1PCFTYvy6OUj7ifjoR99oxoxZc
         brFqXE7d8yT4/u6KdvfYO2CmMp5R7XxTwov8WT3yHKHwVhuTCO7/S3pn4VsckGoOAGoD
         lnvc11Xi9uVMr3R7fIXEFFOZurIzJdhzZ0dO04tv0X+fQEGSuART+BNuj1Zp5GLD4Cgg
         h99Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ER+sBbbmOujTnlV3dTXGLJ1LPOZvb7rLVMW0+nPLGLY=;
        b=2fpbV2q5nAt9KfgMGwume8aoE1eFsc6jxfDEz5wyoj+i1AE+6BjGa49lYUAdN1PQ4k
         nfVP7nP7VgJunJQ6je5XBkTUWhAssccB0zZ1g52ZzAJROcsAcj7tVUiGunZXitWh3YeS
         VsiOIkuMRcLyQQGrZ/VbqzALI4W5AntN1GMBnrLZzZGiUsskzTDNJU6JRMtdpXi9zFP4
         LsWIRx843X0rohLfC29YHPwDZQwDj2t1HTOEbW4tuNIn9VRwZPc0FiqJ/ZNnaLUl1Orx
         1jIqjgTuD4GAtlJ5Ruito6ZOzV68kFYXmVR7lX7quqwsvWbAubVPJi3UDrhTbLYQLUuw
         sh1Q==
X-Gm-Message-State: AOAM5313Pp2jHP2ryhkaYsl2l/nrjEO5M4afFSFRxgTCiuh2SfVI4ggU
        uK4xp2fHM0JAGIVmBXxl5uwq0mZy3nmtOXuI/Oe96eUi
X-Google-Smtp-Source: ABdhPJzdYCqgGOoO40vW+yUj5ZU4g/Q6hO87/v2hJtMfTtCRL/6KBO6n2C4E6YN1zU00bv4lIsY92xfqaUdaL+wLVIE=
X-Received: by 2002:a6b:ec03:: with SMTP id c3mr6094285ioh.179.1633521760711;
 Wed, 06 Oct 2021 05:02:40 -0700 (PDT)
MIME-Version: 1.0
References: <CAHfbzRsFzunBDNPbQt=HUx+cBSHdBzzrJ-s4bjj+bEoB2sNvqw@mail.gmail.com>
 <20210928095023.ezrmeivie3yr7su5@uno.localdomain> <CAHfbzRuRnwijtdaE_HgBYFf25tBm1xd=Qp5Dya14TpvaYfOGSQ@mail.gmail.com>
 <20210928160249.xcgpay5x2kaccsdi@uno.localdomain>
In-Reply-To: <20210928160249.xcgpay5x2kaccsdi@uno.localdomain>
From:   Borut Lampe <nude.bird@gmail.com>
Date:   Wed, 6 Oct 2021 14:02:29 +0200
Message-ID: <CAHfbzRsO65KNfHXTF-Psn3Hq0qkPoAz2ZgFSjHDS5suATnCiaw@mail.gmail.com>
Subject: Re: OV5640 720p@60fps
To:     Jacopo Mondi <jacopo@jmondi.org>
Cc:     linux-media@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Jacopo,

Thanks for the info. I will look into it and get back to you if I have
any additional questions, hopefully I can get it working.

Kind regards,

V V tor., 28. sep. 2021 ob 18:02 je oseba Jacopo Mondi
<jacopo@jmondi.org> napisala:
>
> Hi Borut,
>
> On Tue, Sep 28, 2021 at 04:31:11PM +0200, Borut Lampe wrote:
> > Hi Jacopo,
> >
> > I am using MIPI CSI-2 with the Qualcomm Camera Subsystem driver on a
> > custom 820 dragonboard.
>
> 2 lanes, right ?
>
> I don't have an easy solution but I can provide a bit of context.
>
> It started with
> aa2882481cad ("media: ov5640: Adjust the clock based on the expected rate")
>
> where we moved to compute the clock tree at runtime instead of relying
> on the hardcoded configuration in the register tables:
>
> c14d107e7417 ("media: ov5640: Remove the clocks registers initialization")
>
> From there the ov5640_set_mipi_pclk() went in and we never really got
> to a version that works for all the modes supported by the sensor.
>
> There were a few attempts to improve it, Tomi has found a discrepancy
> in the H/V TOT values, I tried to re-implement the CSI-2 clock tree
> calculation, but we never get to a set of results that was globally
> satisfying and I guess we all dropped the ball
>
> You can find more about that here:
> https://patchwork.linuxtv.org/project/linux-media/cover/20201028225706.110078-1-jacopo+renesas@jmondi.org/
>
> And if you're willing to test those patches and see if the situation
> improves it would be very useful.
>
> Thanks and good luck!
>
> >
> > Kind regards,
> > Borut
> >
> > V V tor., 28. sep. 2021 ob 11:49 je oseba Jacopo Mondi
> > <jacopo@jmondi.org> napisala:
> > >
> > > Hi Borut,
> > >    which kind of setup are you working with, parallel or CSI-2 ?
> > >
> > > On Thu, Sep 23, 2021 at 12:37:01PM +0200, Borut Lampe wrote:
> > > > Hi,
> > > >
> > > > I noticed that for now only VGA resolution supports 60fps even though
> > > > the documentation says that 60fps is possible also for 1280x720.
> > > > Is there a reason this hasn't been implemented yet (e.g hardware
> > > > restraints)? Are there any plans to implement this? Can anyone give me
> > > > some pointers on what would have to be changed in the ov5640 driver to
> > > > achieve this (starting point would be linaro kernel qcomlt-4.14)?
> > > >
> > > > Kind regards,
> > > > Borut
