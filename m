Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 65D872A7E79
	for <lists+linux-media@lfdr.de>; Thu,  5 Nov 2020 13:21:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730445AbgKEMVl (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 5 Nov 2020 07:21:41 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52662 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725468AbgKEMVk (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 5 Nov 2020 07:21:40 -0500
Received: from mail-lf1-x143.google.com (mail-lf1-x143.google.com [IPv6:2a00:1450:4864:20::143])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C8277C0613CF;
        Thu,  5 Nov 2020 04:21:39 -0800 (PST)
Received: by mail-lf1-x143.google.com with SMTP id h6so2008141lfj.3;
        Thu, 05 Nov 2020 04:21:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=nl8/XcSo5npDTXvRYjKf28LcA8OJMzH5M7EJrj7FCrE=;
        b=OazK+A8kxglaaIuq2KGJ4seXC7YezLIYXArpgFKHCPuJGB5FY6rBtFmGwRirWINIo/
         jGvtqgbVj+Y2vpn6utxGORIL0NMfb5B7xNJoZ+GFghMioXqWszbkmnV/CrunIYc1EYEx
         f4W78KdrarisPxECT8yVgmYORHwBk9bOsPKOWbXcERcCjRBBbSWxtq6cwft6xdqVLyIG
         0XZUH2qKzDbmdvaKrgMIB82m1mQwFIzbfqnMrz7ucVMTXMvmoFYLHCSGHGD2LNJ3xben
         wE72wwOkIKQ45gt/Q6MoQL4evHDkiO3pTa/LdOYuR0sui+AuG6JPjl0w4ct+TXPuhcNM
         TvWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=nl8/XcSo5npDTXvRYjKf28LcA8OJMzH5M7EJrj7FCrE=;
        b=hX1ZS9/YL/Biin9flndXHfWWXeq1Biurj+ayjVgmeMXJsqZ6aEyd9gjgA3e/wWnTsg
         DKfWzcumQyQ4o5iHQzF8aIss1GzZR8kqw649ZmNzGc4jkd2nyW8NRHsr3Z/htK1Z7PZK
         ohO8/4Uxs4UsKpnZNCQIoeG7POR7MjnbRh4YzW9ELSj0944SWyL1WW0WDcdxvzFZHRzN
         CPZxR834NYM3NgeFCOmOo58kh/HFm3XzfL1/H5vDV1Z80LIZPrP3BdiVw372vp7+Nu09
         Oi/3Y63nqpmNGHv2LlIH7UkbYwG/WuNa0iR0XHR8NvKC8tijKUklCpA6/BGiZx7jFjGU
         D8rw==
X-Gm-Message-State: AOAM531CC7plxoqs0kUERhkviIsicZ8AV4oM3UsnVocJTUKugjb4h4MZ
        wcOplozteouzEx1uC0EH1Sie0vF20STNJ1C+Dck=
X-Google-Smtp-Source: ABdhPJynSSNGXgj8qUlEI1G+YZTJD3PV1ObCH4cbm6KUO684u+n7sV+CDebG6HE28cKAAwU5UXDx9VOaMcgPYaqS8xM=
X-Received: by 2002:ac2:4d58:: with SMTP id 24mr872009lfp.32.1604578898187;
 Thu, 05 Nov 2020 04:21:38 -0800 (PST)
MIME-Version: 1.0
References: <20201022122421.133976-1-gnurou@gmail.com> <c6454292-935b-f14a-e743-838ccabc6590@xs4all.nl>
 <CAAVeFuKCEQYBs84ssCvwAkGUxGikeDFc+XNX2LzkENGc5B1n8g@mail.gmail.com> <db7a95b0-3d63-ed38-fb8a-62f32c83c13e@xs4all.nl>
In-Reply-To: <db7a95b0-3d63-ed38-fb8a-62f32c83c13e@xs4all.nl>
From:   Alexandre Courbot <gnurou@gmail.com>
Date:   Thu, 5 Nov 2020 21:21:26 +0900
Message-ID: <CAAVeFuL8TaArTd_fOLSSE-854n9vwpob5LxdqgHNa-bTTn5Gxg@mail.gmail.com>
Subject: Re: [PATCH] media: v4l2-mem2mem: always call poll_wait() on queues
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media <linux-media@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, Nov 3, 2020 at 6:48 PM Hans Verkuil <hverkuil-cisco@xs4all.nl> wrote:
>
> On 03/11/2020 09:51, Alexandre Courbot wrote:
> > Hi Hans,
> >
> > On Sat, Oct 31, 2020 at 12:09 AM Hans Verkuil <hverkuil-cisco@xs4all.nl> wrote:
> >>
> >> On 22/10/2020 14:24, Alexandre Courbot wrote:
> >>> do_poll()/do_select() seem to set the _qproc member of poll_table to
> >>> NULL the first time they are called on a given table, making subsequent
> >>> calls of poll_wait() on that table no-ops. This is a problem for mem2mem
> >>> which calls poll_wait() on the V4L2 queues' waitqueues only when a
> >>> queue-related event is requested, which may not necessarily be the case
> >>> during the first poll.
> >>>
> >>> For instance, a stateful decoder is typically only interested in
> >>> EPOLLPRI events when it starts, and will switch to listening to both
> >>> EPOLLPRI and EPOLLIN after receiving the initial resolution change event
> >>> and configuring the CAPTURE queue. However by the time that switch
> >>> happens and v4l2_m2m_poll_for_data() is called for the first time,
> >>> poll_wait() has become a no-op and the V4L2 queues waitqueues thus
> >>> cannot be registered.
> >>>
> >>> Fix this by moving the registration to v4l2_m2m_poll() and do it whether
> >>> or not one of the queue-related events are requested.
> >>
> >> This looks good, but would it be possible to add a test for this to
> >> v4l2-compliance? (Look for POLL_MODE_EPOLL in v4l2-test-buffers.cpp)
> >>
> >> If I understand this right, calling EPOLL_CTL_ADD for EPOLLPRI, then
> >> calling EPOLL_CTL_ADD for EPOLLIN/OUT would trigger this? Or does there
> >> have to be an epoll_wait call in between?
> >
> > Even without an epoll_wait() in between the behavior is visible.
> > v4l2_m2m_poll() will be called once during the initial EPOLL_CTL_ADD
> > and this will trigger the bug.
> >
> >> Another reason for adding this test is that I wonder if regular capture
> >> or output V4L2 devices don't have the same issue.
> >>
> >> It's a very subtle bug and so adding a test for this to v4l2-compliance
> >> would be very useful.
> >
> > I fully agree, this is very counter-intuitive since what basically
> > happens is that the kernel's poll_wait() function becomes a no-op
> > after the poll() hook of a driver is called for the first time. There
> > is no way one can expect this behavior just from browsing the code so
> > this is likely to affect other drivers.
> >
> > As for the test itself, we can easily reproduce the conditions for
> > failure in v4l2-test-buffers.cpp's captureBufs() function, but doing
> > so will make the streaming tests fail without being specific about the
> > cause. Or maybe we should add another pollmode to specifically test
> > epoll in this setup? Can I get your thoughts?
>
> No, just keep it as part of the poll test. Just add comments at the place
> where it fails describing this error.
>
> After all, it *is* a poll() bug, so it is only fair that it is tested as
> part of the epoll test.
>
> Can you call EPOLL_CTL_ADD with ev.events set to 0? And then call it again
> with the actual value that you need? If that triggers this issue as well,
> then that is a nice test (but perhaps EPOLL_CTL_ADD won't call poll() if
> ev.events is 0, but perhaps EPOLLERR would work instead of 0).

Yup, actually the following is enough to make v4l2-compliance -s fail
with vicodec:

diff --git a/utils/v4l2-compliance/v4l2-test-buffers.cpp
b/utils/v4l2-compliance/v4l2-test-buffers.cpp
index 8000db23..b63326cd 100644
--- a/utils/v4l2-compliance/v4l2-test-buffers.cpp
+++ b/utils/v4l2-compliance/v4l2-test-buffers.cpp
@@ -903,6 +903,10 @@ static int captureBufs(struct node *node, struct
node *node_m2m_cap, const cv4l_
                epollfd = epoll_create1(0);

                fail_on_test(epollfd < 0);
+
+               ev.events = 0;
+               fail_on_test(epoll_ctl(epollfd, EPOLL_CTL_ADD,
node->g_fd(), &ev));
+
                if (node->is_m2m)
                        ev.events = EPOLLIN | EPOLLOUT | EPOLLPRI;
                else if (v4l_type_is_output(q.g_type()))
@@ -910,7 +914,7 @@ static int captureBufs(struct node *node, struct
node *node_m2m_cap, const cv4l_
                else
                        ev.events = EPOLLIN;
                ev.data.fd = node->g_fd();
-               fail_on_test(epoll_ctl(epollfd, EPOLL_CTL_ADD,
node->g_fd(), &ev));
+               fail_on_test(epoll_ctl(epollfd, EPOLL_CTL_MOD,
node->g_fd(), &ev));
        }

        if (pollmode)

>
> The epoll_wait() will fail when this issue hits, so that's a good place
> to add comments explaining this problem.
>
> There is one other place where this needs to be tested: testEvents() in
> v4l2-test-controls.cpp: currently this only tests select(), but there
> should be a second epoll test here as well that just tests EPOLLPRI.
>
> This would catch drivers that do not stream (i.e. no EPOLLIN/OUT) but
> that do have controls (so support EPOLLPRI).

I'll take a look there as well, and think about a proper comment
before sending a patch towards you.

Cheers,
Alex.
