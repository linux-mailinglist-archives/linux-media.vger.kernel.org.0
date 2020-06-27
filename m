Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 30FA520C063
	for <lists+linux-media@lfdr.de>; Sat, 27 Jun 2020 10:59:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726402AbgF0I66 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 27 Jun 2020 04:58:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44194 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725831AbgF0I65 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 27 Jun 2020 04:58:57 -0400
Received: from mail-lf1-x144.google.com (mail-lf1-x144.google.com [IPv6:2a00:1450:4864:20::144])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6D43FC03E979
        for <linux-media@vger.kernel.org>; Sat, 27 Jun 2020 01:58:57 -0700 (PDT)
Received: by mail-lf1-x144.google.com with SMTP id k15so6384023lfc.4
        for <linux-media@vger.kernel.org>; Sat, 27 Jun 2020 01:58:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=pesu-pes-edu.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=QKV1r6C8//IPYV99TpfkgFMNXesYLRNzzT96YTJF3tw=;
        b=Y/cIGhRz04nSz/e1Yb6lbZ8Wjx6MM8VMB/3BhWbxV6sQZtPC8xKKgHfQk3iBCUDqdx
         8mWobVejsEXpiRZMsGbkDwPT0/9wMTdFfvmF8SP6F7slI09RNNyPdF/mLmAl/wm0Tf95
         iHmPWAv9yIpqr0YBmciPlRNHrYsbzSaDJxxsX7syTSqGwd8bs6I6yThGsCLfw+pm8xwP
         I3qwDfLpX4FU6mfoIadrCWAqWPvsHPEwYt6c1K5QW5YfS7G86W0fLwfF9chjBvq8HS8n
         u+WO1cDk8FDlYzo8GHUV9sag1ps9iRvQRhnunakTi4HGtvQv675ewdusehB4/PpR8a8/
         y8EQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=QKV1r6C8//IPYV99TpfkgFMNXesYLRNzzT96YTJF3tw=;
        b=YvlU5zbhB7aEsCt6MrJmMx7xs4xI0hiK/zMmGMorrksHfZYSOMuyy/D3alxX+gurVe
         Lak8BYv02/0mSn2cq/lRtX5a7yKsZomoKiGEBvI+AqThmMlUjPkBCIqrPPmCkA3Fe5Xq
         PYbd2MT20QoOxMUkUnN431mnZkhQsHf9s8c2FxNtFUVX2tGF4mC0KnoRNwLYkqMofM78
         PeBzMqu49ZWGiTF1/H9jK8tBmzTcsbPMurSKYub5yce0YO2cwt4P33M/N6wh1GqRsUxU
         AIOzrmc1YrAUFvG3qcDdLzrtwozj3aqEWVWZg4VfrXFfnMAG8GmTUW7E6Jo5ihB21Pk5
         kS/w==
X-Gm-Message-State: AOAM5316xp0OKma45Qy3U1dz+C7POLKpe/2klyHF8PKcDwrYt34MA1pD
        AZ0Yec5xn73+cq2KgH6s6n1+C1bLoY1H8gA+jMK0yg==
X-Google-Smtp-Source: ABdhPJx7U2X5RD8sayxg4a0IOn4pwsm3iim1b+b6ncO8SyHU+UV4FzHo/35eWqkovOhidBlzpqApnsRg0BJKkO21cfQ=
X-Received: by 2002:a19:c797:: with SMTP id x145mr4068841lff.143.1593248334135;
 Sat, 27 Jun 2020 01:58:54 -0700 (PDT)
MIME-Version: 1.0
References: <20200626143205.xns6nwggskssujao@pesu-pes-edu> <CAAhDqq0tSftPxMWGeVy3mp4DGDN3o0uQwTqVbjYUwjqzWpbibQ@mail.gmail.com>
 <20200627050745.GD226238@kroah.com> <f73c5a69-1bf9-d80d-2399-ef18ce78b8ac@xs4all.nl>
 <20200627084932.GA1560170@kroah.com>
In-Reply-To: <20200627084932.GA1560170@kroah.com>
From:   B K Karthik <bkkarthik@pesu.pes.edu>
Date:   Sat, 27 Jun 2020 04:58:41 -0400
Message-ID: <CAAhDqq1g5WYL07F68Dy2mvPuQTabYcqSwOFOjBU1nccWxSL5rg@mail.gmail.com>
Subject: Re: [PATCH] staging: media: usbvision: removing prohibited space
 before ',' (ctx:WxW)
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Hans Verkuil <hverkuil@xs4all.nl>, devel@driverdev.osuosl.org,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Thank you for the information.
I will take care of all these things from the next time.

sorry for wasting your time

thanks,

karthik

On Sat, Jun 27, 2020 at 4:49 AM Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
>
> On Sat, Jun 27, 2020 at 10:28:31AM +0200, Hans Verkuil wrote:
> > On 27/06/2020 07:07, Greg Kroah-Hartman wrote:
> > >
> > > A: http://en.wikipedia.org/wiki/Top_post
> > > Q: Were do I find info about this thing called top-posting?
> > > A: Because it messes up the order in which people normally read text.
> > > Q: Why is top-posting such a bad thing?
> > > A: Top-posting.
> > > Q: What is the most annoying thing in e-mail?
> > >
> > > A: No.
> > > Q: Should I include quotations after my reply?
> > >
> > > http://daringfireball.net/2007/07/on_top
> > >
> > > On Fri, Jun 26, 2020 at 11:42:49AM -0400, B K KARTHIK PES2201800185STUDENT ECE DeptPESU EC Campus wrote:
> > >> Oh, I'm sorry but wouldn't it be helpful if we had a file that lists
> > >> all drivers that are scheduled for removal?
> > >
> > > The TODO file in the directory for the driver should have this
> > > information in it.  I don't know if all of the media drivers have this,
> > > if not, then there is no way you could have known this.
> >
> > They have, and in addition the Kconfig entry will mention that the driver
> > is deprecated.
> >
> > TODO of usbvision:
> >
> > The driver is deprecated and scheduled for removal by the end
> > of 2020.
> >
> > In order to prevent removal the following actions would have to
> > be taken:
> >
> > - clean up the code
> > - convert to the vb2 framework
> > - fix the disconnect and free-on-last-user handling (i.e., add
> >   a release callback for struct v4l2_device and rework the code
> >   to use that correctly).
>
> Ah, great, nevermind then!
>
> B K, your wish is already granted, the text is present, you just needed
> to have noticed it :)
>
> greg k-h
