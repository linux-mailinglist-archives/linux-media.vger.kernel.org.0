Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 27CCB2AF10C
	for <lists+linux-media@lfdr.de>; Wed, 11 Nov 2020 13:42:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726980AbgKKMlw (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 11 Nov 2020 07:41:52 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45866 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726955AbgKKMlt (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 11 Nov 2020 07:41:49 -0500
Received: from mail-lf1-x144.google.com (mail-lf1-x144.google.com [IPv6:2a00:1450:4864:20::144])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 73C25C0613D1;
        Wed, 11 Nov 2020 04:41:49 -0800 (PST)
Received: by mail-lf1-x144.google.com with SMTP id w142so2935985lff.8;
        Wed, 11 Nov 2020 04:41:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=p09sB7YHU/bDDzgMxuLQXPTX1TBYFFjC8vLK3IStYYs=;
        b=jsacUJVfZifsMa0Od0ifyXIYeQBOyfqKY1dbaeYP1+U9OUQdn+hdRyObztAbzcnx/p
         uk++tbnY2njal5E0vTh/ByNS5edhg1cnmwO0W1QO7jZCHQkCwbvXo6TqElo7HqOw05Z9
         L4KpZ+Yzd9ZHXSsbtNej6L1ebjaqigRDmPe+xkHWN+XfTsCn/g96sMCBN5hp4K7k9NKB
         ksueb4mmGgqR3zq8U9FLjOH2EjrKem904+I8ckgWVMeEyar2a5QwfowcoKqK6o3pNAEp
         dcM6cx7zf9DZ8j4RAC555BCLYLxOe6gOHlXRzWVT35VWg8r9A4LNpmSp6uwKtUtDNFfx
         VkzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=p09sB7YHU/bDDzgMxuLQXPTX1TBYFFjC8vLK3IStYYs=;
        b=BfvRNJU2/2Ysu3vfZ6bpYe+Yqz6Tdt+MmdJXV0MtDOstKRDZa5AbcqcCVI+eIhG6UQ
         8ofewDISqqYS98AT+Z14nQZaWHmN72E+hoIeRVr2Ym480VsnUx6zoW0CTIVmmAKttT5z
         VdMCQUPNktYFfMjYN+vvHfSgokOMQUGb2oTY+JZHDIBnzkdvznWCKDDPaLgPS9es43pv
         crGNomEeriSnFe/SKc1VzDD+kOCsupy6oCzuZX7T1oKIjIIlIOk94Ar0Kz0SEeFrBkMg
         LcCqW+Luf3TlqQSyNsudCl9mgjPGJThvX89HAc2s4CdEbG+NhGLXFsvoq0DyF2h3OZxx
         bENA==
X-Gm-Message-State: AOAM530IOoVSuM51G4IfcMj79mK614GuQ1bfU81w7KcXoG+7AzRcwvQp
        fO8UHkjbbTVvL9ReHRt7W0PDcvFQBqNReSF/xveyFdsekpB6qA==
X-Google-Smtp-Source: ABdhPJyeoMTvxm99hJFLil3+3qpGIB8eKHBJ0gbr+qzyieVuMOkPPf61uLVEpXxwtJRNLz5hZvU35qVMLpDGRDBw/xo=
X-Received: by 2002:a19:2292:: with SMTP id i140mr607457lfi.77.1605098507820;
 Wed, 11 Nov 2020 04:41:47 -0800 (PST)
MIME-Version: 1.0
References: <20201022122421.133976-1-gnurou@gmail.com> <c6454292-935b-f14a-e743-838ccabc6590@xs4all.nl>
 <CAAVeFuKCEQYBs84ssCvwAkGUxGikeDFc+XNX2LzkENGc5B1n8g@mail.gmail.com>
 <db7a95b0-3d63-ed38-fb8a-62f32c83c13e@xs4all.nl> <CAAVeFuL8TaArTd_fOLSSE-854n9vwpob5LxdqgHNa-bTTn5Gxg@mail.gmail.com>
 <695e6163-7bdc-d120-cd02-0cff6efb53ef@xs4all.nl> <CAAVeFuL9PDgirADEVXUNbNKY4YVw9uFpjbr5Zmt_Vb-3K4-2Yg@mail.gmail.com>
 <92db8b0e-c348-70ef-a607-eb5c42f86fac@xs4all.nl> <CAAVeFuJ_rSN=JBi-2L2-v7eVonarGRzL5agTL-UW_WOD91D_tw@mail.gmail.com>
In-Reply-To: <CAAVeFuJ_rSN=JBi-2L2-v7eVonarGRzL5agTL-UW_WOD91D_tw@mail.gmail.com>
From:   Alexandre Courbot <gnurou@gmail.com>
Date:   Wed, 11 Nov 2020 21:41:35 +0900
Message-ID: <CAAVeFu+ASgmkWhddJrhkrsoYbW1u1uCjckU44GTDxoKykc9aVQ@mail.gmail.com>
Subject: Re: [PATCH] media: v4l2-mem2mem: always call poll_wait() on queues
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media <linux-media@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, Nov 5, 2020 at 11:05 PM Alexandre Courbot <gnurou@gmail.com> wrote:
>
> On Thu, Nov 5, 2020 at 10:12 PM Hans Verkuil <hverkuil-cisco@xs4all.nl> wrote:
> >
> > On 05/11/2020 13:52, Alexandre Courbot wrote:
> > > On Thu, Nov 5, 2020 at 9:36 PM Hans Verkuil <hverkuil-cisco@xs4all.nl> wrote:
> > >>
> > >> On 05/11/2020 13:21, Alexandre Courbot wrote:
> > >>> On Tue, Nov 3, 2020 at 6:48 PM Hans Verkuil <hverkuil-cisco@xs4all.nl> wrote:
> > >>>>
> > >>>> On 03/11/2020 09:51, Alexandre Courbot wrote:
> > >>>>> Hi Hans,
> > >>>>>
> > >>>>> On Sat, Oct 31, 2020 at 12:09 AM Hans Verkuil <hverkuil-cisco@xs4all.nl> wrote:
> > >>>>>>
> > >>>>>> On 22/10/2020 14:24, Alexandre Courbot wrote:
> > >>>>>>> do_poll()/do_select() seem to set the _qproc member of poll_table to
> > >>>>>>> NULL the first time they are called on a given table, making subsequent
> > >>>>>>> calls of poll_wait() on that table no-ops. This is a problem for mem2mem
> > >>>>>>> which calls poll_wait() on the V4L2 queues' waitqueues only when a
> > >>>>>>> queue-related event is requested, which may not necessarily be the case
> > >>>>>>> during the first poll.
> > >>>>>>>
> > >>>>>>> For instance, a stateful decoder is typically only interested in
> > >>>>>>> EPOLLPRI events when it starts, and will switch to listening to both
> > >>>>>>> EPOLLPRI and EPOLLIN after receiving the initial resolution change event
> > >>>>>>> and configuring the CAPTURE queue. However by the time that switch
> > >>>>>>> happens and v4l2_m2m_poll_for_data() is called for the first time,
> > >>>>>>> poll_wait() has become a no-op and the V4L2 queues waitqueues thus
> > >>>>>>> cannot be registered.
> > >>>>>>>
> > >>>>>>> Fix this by moving the registration to v4l2_m2m_poll() and do it whether
> > >>>>>>> or not one of the queue-related events are requested.
> > >>>>>>
> > >>>>>> This looks good, but would it be possible to add a test for this to
> > >>>>>> v4l2-compliance? (Look for POLL_MODE_EPOLL in v4l2-test-buffers.cpp)
> > >>>>>>
> > >>>>>> If I understand this right, calling EPOLL_CTL_ADD for EPOLLPRI, then
> > >>>>>> calling EPOLL_CTL_ADD for EPOLLIN/OUT would trigger this? Or does there
> > >>>>>> have to be an epoll_wait call in between?
> > >>>>>
> > >>>>> Even without an epoll_wait() in between the behavior is visible.
> > >>>>> v4l2_m2m_poll() will be called once during the initial EPOLL_CTL_ADD
> > >>>>> and this will trigger the bug.
> > >>>>>
> > >>>>>> Another reason for adding this test is that I wonder if regular capture
> > >>>>>> or output V4L2 devices don't have the same issue.
> > >>>>>>
> > >>>>>> It's a very subtle bug and so adding a test for this to v4l2-compliance
> > >>>>>> would be very useful.
> > >>>>>
> > >>>>> I fully agree, this is very counter-intuitive since what basically
> > >>>>> happens is that the kernel's poll_wait() function becomes a no-op
> > >>>>> after the poll() hook of a driver is called for the first time. There
> > >>>>> is no way one can expect this behavior just from browsing the code so
> > >>>>> this is likely to affect other drivers.
> > >>>>>
> > >>>>> As for the test itself, we can easily reproduce the conditions for
> > >>>>> failure in v4l2-test-buffers.cpp's captureBufs() function, but doing
> > >>>>> so will make the streaming tests fail without being specific about the
> > >>>>> cause. Or maybe we should add another pollmode to specifically test
> > >>>>> epoll in this setup? Can I get your thoughts?
> > >>>>
> > >>>> No, just keep it as part of the poll test. Just add comments at the place
> > >>>> where it fails describing this error.
> > >>>>
> > >>>> After all, it *is* a poll() bug, so it is only fair that it is tested as
> > >>>> part of the epoll test.
> > >>>>
> > >>>> Can you call EPOLL_CTL_ADD with ev.events set to 0? And then call it again
> > >>>> with the actual value that you need? If that triggers this issue as well,
> > >>>> then that is a nice test (but perhaps EPOLL_CTL_ADD won't call poll() if
> > >>>> ev.events is 0, but perhaps EPOLLERR would work instead of 0).
> > >>>
> > >>> Yup, actually the following is enough to make v4l2-compliance -s fail
> > >>> with vicodec:
> > >>
> > >> Does it also fail with vivid? I am curious to know whether this issue is
> > >> m2m specific or a more general problem.
> > >
> > > It does fail actually! And that made me notice that vb2_poll() uses
> > > the same pattern as v4l2_m2m_poll() (probably because the latter is
> > > inspired by the former?) and needs to be fixed similarly. I will send
> > > another patch to fix vb2_poll() as well, thanks for pointing it out!
> >
> > I was afraid of that.
> >
> > Testing epoll for control events would be interesting as well. The
> > vivid radio device is an example of a device that has controls, but
> > does not do streaming (so is not using vb2).
> >
> > But from what I can see v4l2_ctrl_poll() does the right thing, so this
> > should be fine.
>
> Indeed, it unconditionally calls poll_wait() with all the wait queues
> that may wake us up (that is, only one), so there is no problem there.

Sorry, I noticed that this patch was marked with "Changes Requested"
in patchwork, but isn't it valid as-is? We need a similar change to
VB2, but that should go as a separate patch IMHO. I'm fine with doing
both in one go if you prefer that though.
