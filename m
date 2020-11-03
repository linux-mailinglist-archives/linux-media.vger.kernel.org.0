Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CFCD62A3F52
	for <lists+linux-media@lfdr.de>; Tue,  3 Nov 2020 09:52:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727880AbgKCIvj (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 3 Nov 2020 03:51:39 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50696 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726388AbgKCIvi (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 3 Nov 2020 03:51:38 -0500
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com [IPv6:2a00:1450:4864:20::244])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 19329C0613D1;
        Tue,  3 Nov 2020 00:51:38 -0800 (PST)
Received: by mail-lj1-x244.google.com with SMTP id t13so18071855ljk.12;
        Tue, 03 Nov 2020 00:51:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=PbXe1gSHDJtWpmFhQy3RN/GG3byFqOLTcG3m6UD8/EE=;
        b=XFbUDt6At7a6IcBVG5+dt2H5oaIlgs0pZlVdGxQemMsQhJQOAkktr9puE0svB8lcjO
         uh7AabaIUYoHQglfLVkcvXdm3pLFM4Qa2DSPCDi2wTIKEztgQ08aUqIEKEZ5n6Ir+MeB
         0PGy8qV2COLEGDj6/esurAvGdIiEj0DHVPNAZ50XsDot/5S6hOYU0Y659neTQ7PoP0EN
         N8YgX04/oUVMBqZbBceKR9zvn7oY1SPeL6I07A3aPzbNs0FVEwZJoZwnNmKLZcC6yhBc
         ms9eQJdfg+SyH9cJiLxXgSAJjpm9R5rvPoIJd3sJlu6zMKJ5SP9A7ntFHzN82rOrVGiM
         tYuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=PbXe1gSHDJtWpmFhQy3RN/GG3byFqOLTcG3m6UD8/EE=;
        b=svby4BVWcs9H+KY8pXYQq5GLy+HFmiT5VXcD6AgAqz1VTUNJ7oMTSiUslh66n3RcCA
         ooKOE9tae+1hVk1yMt8BD4JK4JpX2jfqqJvn8FQhqvATahy9GKekRr96hCNZ5+ysYvNh
         F93ObewGLfmP3z1fezTHLFgQZZ8gkuK0mmYX/PmQs3BPG/UpbAHBJwSzSW242JpLkZ2P
         plKfJaGFFr02el305BSuV9r6vjhB9cYre+87x+7hLFGw2ooYdHkR8yfc+5y3DtDErvza
         eXxjWNspzNQlMjyaNPZEQ+oYJ7y+BEblI1eW2tegksbK6XKM45ybZX62cDl6FhUfNaOH
         7D8w==
X-Gm-Message-State: AOAM532EepOTc+NjV8fcXEhDDDEuZerLD2ogZJv+S/y4Mn+7bjfPa1J8
        7wRR8F7AsjFnSo5yBpjP0txPonb6Oy769Pn+Xn8=
X-Google-Smtp-Source: ABdhPJyY+Fu78Ls0VuBpA0ax7wQZa2fb41kBkHynOYsX7pdQKvuvkHHMStDqk3iemAWYKaWGnHRwe8Ui77LH33hMLyE=
X-Received: by 2002:a2e:86c8:: with SMTP id n8mr8044638ljj.321.1604393496516;
 Tue, 03 Nov 2020 00:51:36 -0800 (PST)
MIME-Version: 1.0
References: <20201022122421.133976-1-gnurou@gmail.com> <c6454292-935b-f14a-e743-838ccabc6590@xs4all.nl>
In-Reply-To: <c6454292-935b-f14a-e743-838ccabc6590@xs4all.nl>
From:   Alexandre Courbot <gnurou@gmail.com>
Date:   Tue, 3 Nov 2020 17:51:24 +0900
Message-ID: <CAAVeFuKCEQYBs84ssCvwAkGUxGikeDFc+XNX2LzkENGc5B1n8g@mail.gmail.com>
Subject: Re: [PATCH] media: v4l2-mem2mem: always call poll_wait() on queues
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media <linux-media@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Hans,

On Sat, Oct 31, 2020 at 12:09 AM Hans Verkuil <hverkuil-cisco@xs4all.nl> wrote:
>
> On 22/10/2020 14:24, Alexandre Courbot wrote:
> > do_poll()/do_select() seem to set the _qproc member of poll_table to
> > NULL the first time they are called on a given table, making subsequent
> > calls of poll_wait() on that table no-ops. This is a problem for mem2mem
> > which calls poll_wait() on the V4L2 queues' waitqueues only when a
> > queue-related event is requested, which may not necessarily be the case
> > during the first poll.
> >
> > For instance, a stateful decoder is typically only interested in
> > EPOLLPRI events when it starts, and will switch to listening to both
> > EPOLLPRI and EPOLLIN after receiving the initial resolution change event
> > and configuring the CAPTURE queue. However by the time that switch
> > happens and v4l2_m2m_poll_for_data() is called for the first time,
> > poll_wait() has become a no-op and the V4L2 queues waitqueues thus
> > cannot be registered.
> >
> > Fix this by moving the registration to v4l2_m2m_poll() and do it whether
> > or not one of the queue-related events are requested.
>
> This looks good, but would it be possible to add a test for this to
> v4l2-compliance? (Look for POLL_MODE_EPOLL in v4l2-test-buffers.cpp)
>
> If I understand this right, calling EPOLL_CTL_ADD for EPOLLPRI, then
> calling EPOLL_CTL_ADD for EPOLLIN/OUT would trigger this? Or does there
> have to be an epoll_wait call in between?

Even without an epoll_wait() in between the behavior is visible.
v4l2_m2m_poll() will be called once during the initial EPOLL_CTL_ADD
and this will trigger the bug.

> Another reason for adding this test is that I wonder if regular capture
> or output V4L2 devices don't have the same issue.
>
> It's a very subtle bug and so adding a test for this to v4l2-compliance
> would be very useful.

I fully agree, this is very counter-intuitive since what basically
happens is that the kernel's poll_wait() function becomes a no-op
after the poll() hook of a driver is called for the first time. There
is no way one can expect this behavior just from browsing the code so
this is likely to affect other drivers.

As for the test itself, we can easily reproduce the conditions for
failure in v4l2-test-buffers.cpp's captureBufs() function, but doing
so will make the streaming tests fail without being specific about the
cause. Or maybe we should add another pollmode to specifically test
epoll in this setup? Can I get your thoughts?

Cheers,
Alex.
