Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 62E4244F74C
	for <lists+linux-media@lfdr.de>; Sun, 14 Nov 2021 10:00:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232994AbhKNJCv (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 14 Nov 2021 04:02:51 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32830 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233170AbhKNJCr (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 14 Nov 2021 04:02:47 -0500
Received: from mail-oi1-x232.google.com (mail-oi1-x232.google.com [IPv6:2607:f8b0:4864:20::232])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0F606C061746
        for <linux-media@vger.kernel.org>; Sun, 14 Nov 2021 00:59:53 -0800 (PST)
Received: by mail-oi1-x232.google.com with SMTP id be32so27736505oib.11
        for <linux-media@vger.kernel.org>; Sun, 14 Nov 2021 00:59:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=AoeqEAVnnK83ehKMBe5v6vPNYntrrYdTUbX410ctPWc=;
        b=HyOkSRj6vTP++itD12HP/RHMWjtd80Wn88gSLjYIl/qo74saubUJ3nO0J1VW9uSIbD
         ywIkpgmT7zI1ABbTA1ZudyicSUFQZh/EuEztUY6vddyDj2ZRs04RPH8i9iDxlKCE7zlF
         iOqnQnymu/F0olKKEHopEbU1W0KSTs0IXzEgxzA1HIK0c8DribIFj6NzGmAi3LVwkPRH
         0EuN5F4sXZU4qYFxLJp4m/gZjRTpQYCJvAVjO4xipuArWkNny3v/s0O/iB/8DeItFWaX
         nNxiohRwV9sWqyMvzYAhXNO8xQ89f13hBEVNAIe47t7Lar3n7GFTpd4F7wazXNvYUdRj
         WoTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=AoeqEAVnnK83ehKMBe5v6vPNYntrrYdTUbX410ctPWc=;
        b=wg04DGJPXB5rAlFbUv7BUZ9j0uX5ORwwjPSYO3RgWxnB4s2FXgO3eZ5jcYK+eDQvIr
         vZ/yRMA7Y/SU6WuQ9gdfUpRUW2cnD+ZGNdubTFvBN/dtjeUN+spcTP8f2mpydu3BlBxm
         kkQhpG5kKg+PXfkoPG4ri8ehYCqJvU+u7wE8hThKB3dDBXobaGCoVLGl5Uh2ZMlj76Wv
         od/ZNByXqdN34db8nsU7zPX8iAIN6D+MVwIfME+wnvfGxOsqOg4foylp+ohFYIiydDF2
         WnpgAT1WlVTnc+0UU6vK0gCOyaw1ozVdfp5+dui6Zl+aYlDnitIPCSz2Kg2x4bJDZOtP
         7Utw==
X-Gm-Message-State: AOAM5339iiYpcEVc+vmQGI0BL2f6FCeHaHkadXNtUyf9Nz2DoQba+wlr
        6LoXykAdtMhX1nvZOjXgJs9WR2TQUZIC+Rt1bmCN5b+HPFQ=
X-Google-Smtp-Source: ABdhPJxFNrfQMOXd6y6D2a0Cv6G3knosanGtCNahOFWy9U5SNOTvN4IMU6s/ZjEW/6olIjUBS7hGkyueMhSjBBKAxVo=
X-Received: by 2002:a05:6808:118c:: with SMTP id j12mr23846506oil.65.1636880392246;
 Sun, 14 Nov 2021 00:59:52 -0800 (PST)
MIME-Version: 1.0
References: <20211112195710.286151-1-ribalda@chromium.org> <CADvTj4o9zzVJaiWOp=B24zv63jhaW+c45QawGOPc4VsNR2=hZA@mail.gmail.com>
 <CANiDSCsQRUPA1u=vC+7-+KxeUkOTqnpdu3OEMfpmzd8KN7OfSg@mail.gmail.com>
 <CADvTj4oSwupbndes-DMQdAhraWnAJvjkME+DZPh4Sr2TAFO8uQ@mail.gmail.com>
 <CANiDSCs20iMsh3O2T+jTrRAr4TMajPXeBDVH8Q1HfVBj53y8dQ@mail.gmail.com>
 <CADvTj4rd5KrOT8UHLmhTQ_KR-bgpQEONfJdaQcugdN_tXKfNrw@mail.gmail.com>
 <CANiDSCsw47OVS2L1cbA_HhnYMzLgJRfUVJBVu6vYc58USX=Auw@mail.gmail.com>
 <CADvTj4rnc0eJ8a=E-z+O=MQZFDa7XtKoeDkm4LDmVsYXjSVCxw@mail.gmail.com>
 <CANiDSCtKz90fu5RF8aC=6fB3X_g_68B86=w0L+C_YK0Go6K9nw@mail.gmail.com> <CADvTj4pKngXK0ihOEMVjs1jA8YJz=1bFJiNdx81zMqS=T7AzNg@mail.gmail.com>
In-Reply-To: <CADvTj4pKngXK0ihOEMVjs1jA8YJz=1bFJiNdx81zMqS=T7AzNg@mail.gmail.com>
From:   James Hilliard <james.hilliard1@gmail.com>
Date:   Sun, 14 Nov 2021 01:59:41 -0700
Message-ID: <CADvTj4rmxHti2YdkUFJ9KkRK5RFgP-kb+DSstJPVSiDsKLN6Cw@mail.gmail.com>
Subject: Re: [PATCH v2] media: uvcvideo: Set the colorspace as sRGB if undefined
To:     Ricardo Ribalda <ribalda@chromium.org>
Cc:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-media@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Fri, Nov 12, 2021 at 5:07 PM James Hilliard
<james.hilliard1@gmail.com> wrote:
>
> On Fri, Nov 12, 2021 at 5:02 PM Ricardo Ribalda <ribalda@chromium.org> wrote:
> >
> > Hi
> >
> > On Sat, 13 Nov 2021 at 00:59, James Hilliard <james.hilliard1@gmail.com> wrote:
> > >
> > > On Fri, Nov 12, 2021 at 4:50 PM Ricardo Ribalda <ribalda@chromium.org> wrote:
> > > >
> > > > HI James
> > > >
> > > > You are getting -EPROTO while trying to get the current value of a
> > > > control. I believe this is a hardware/firmware error.
> > >
> > > Hmm, any idea why v4l2-compliance passes some of the time but not
> > > always?
> >
> > Race condition in the firmware?
> > Not enough current to complete a request and end up in some kind of brown-out?
>
> Hmm, think that might be the way the camera might be indicating commands
> are being sent too fast? Maybe a retry on the first -EPROTO seen would be
> enough to fix it?

Seems it was just due to the timeout being too short, this seems to
fix the issue:
https://lore.kernel.org/linux-media/20211114085236.2345589-1-james.hilliard1@gmail.com/

The camera now passes all v4l2-compliance tests with this change applied.

>
> >
> > It is difficult to know without access to the hardware :)
> >
> > Maybe you can replicate what causes the error with just v4l-ctl calls
> > and then ping the manufacturer with a simple repro.
> >
> > >
> > > >
> > > >
> > > > Best regards!
> >
> >
> >
> > --
> > Ricardo Ribalda
