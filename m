Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5FB633119DE
	for <lists+linux-media@lfdr.de>; Sat,  6 Feb 2021 04:22:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229979AbhBFDW1 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 5 Feb 2021 22:22:27 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37188 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229596AbhBFCbe (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 5 Feb 2021 21:31:34 -0500
Received: from mail-yb1-xb30.google.com (mail-yb1-xb30.google.com [IPv6:2607:f8b0:4864:20::b30])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 86E07C033269
        for <linux-media@vger.kernel.org>; Fri,  5 Feb 2021 16:59:47 -0800 (PST)
Received: by mail-yb1-xb30.google.com with SMTP id c3so8568549ybi.3
        for <linux-media@vger.kernel.org>; Fri, 05 Feb 2021 16:59:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=mk056QhOZowFW0fikbcbrxwQxYCIEOoIKIEdZOiLW10=;
        b=EKCfGaj37EcLyIp6Y09ApzOUL1lHXqY9zlGRueUA4oS14Udv9rF2P9CnN4FkGB3nVh
         aOygklsziglYn6RKwmBVneif8SjKcggy7U/ymSF0l3k4CFfKNE2/0Hd8hChDSIaGQ/pF
         qTwHWlDoZH0yhjdXLOLxqLE7abrJ0EM1e3Ip2N+22MkDvCs+97743DiLqyZLxnQyfRiB
         w1bsCJzyQ8imgRTINHtBvs+Aj5GGx3jnI9tnSYqydos03KXxDuctNXuF5zjkcMn0SERE
         dhdUH2EAChuoJgXM8Wsl9A7LeV8HHRbowaYYW0IKurNKBoUI5GI7wAexYe2WBHNHA1z8
         6yrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=mk056QhOZowFW0fikbcbrxwQxYCIEOoIKIEdZOiLW10=;
        b=o8Ml8Q8XEnXzDxwSmt2q5dcJOTiu++wRy5s9W55QasSo+SJyUsgQb7GM8VBb6ZGxrA
         kxXdafYILGqC18gRHyp5fszwRDoansBCcoSfxwhLp+xoqjBxJhvimcEBMQX+3JFPxTgB
         VZef5ldY1ZjyQQga15NsCup2qqdgxvsT0N9qoibndsZ3vEuboNNt25FciMqBaegEQCJj
         tzKZKuRzLrB/NcACOXVJzTZxjeLH1vU8uMlXYNVE2bJmR+3cc70U2gVB/hmkXzWm/FX5
         WKlYsVofBZDldOma085ywNbHZOUiABNkDBbOs4Fn/qHp7dcjjiNju5szgsYDQ+SbyGvb
         2igQ==
X-Gm-Message-State: AOAM533zKQjmvdYBdktMN8qYWuPgTngcJXDrpctsZ9OWtD/tkOxCWHk/
        PvUPr5dA6CPwpNZ3LYjwiPw77CrPzaW2/InI4jK34O/63SW55w==
X-Google-Smtp-Source: ABdhPJyt2Ib7fYw0+QbLiq6NjOPtTv9dUjbWubBwYHbFhj4ceIJwT1Cl+MlLlxKAJj9BlPcmZdnUnGv0k7r6I3KctnY=
X-Received: by 2002:a25:ef0e:: with SMTP id g14mr10060168ybd.372.1612573186526;
 Fri, 05 Feb 2021 16:59:46 -0800 (PST)
MIME-Version: 1.0
References: <CAMfZQbzay0+tyYvZmF_L=iYfp+F02iz3qz=a=J1Yuf55P=RebA@mail.gmail.com>
 <211ad9f0-f888-61dc-656f-10c1c6c97aad@ideasonboard.com>
In-Reply-To: <211ad9f0-f888-61dc-656f-10c1c6c97aad@ideasonboard.com>
From:   Fritz Koenig <frkoenig@google.com>
Date:   Fri, 5 Feb 2021 16:59:35 -0800
Message-ID: <CAMfZQbwrSDa9vzXND8agaJMti1qG-_XKVx-5-J7MoGBxVVi8fg@mail.gmail.com>
Subject: Re: V4L2 logging for multiple streams
To:     kieran.bingham+renesas@ideasonboard.com
Cc:     Linux Media Mailing List <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, Jan 20, 2021 at 2:07 AM Kieran Bingham
<kieran.bingham+renesas@ideasonboard.com> wrote:
>
> Hi Fritz,
>
> On 16/01/2021 04:33, Fritz Koenig wrote:
> > Hi,
> >
> > I'm trying to sort some issues with regards to decoding multiple
> > streams at once.  Logging can be helpful with messages like this:
> >
> > [105188.500450] video2: VIDIOC_STREAMOFF: type=vid-out-mplane
> >
>
> The type is telling you useful information there, is that what you are
> after?
>

Sorry, I don't think I explained it well.  Here I'm decoding 3
different streams at the same time, say 1080x720, 640x480, and
320x240.  Nothing that denotes which is which is present in this level
of logging.  I understand the distinction between the CAPTURE and
OUTPUT queues.  I have found that at least for the venus driver, that
information is not exported anywhere.

This was also meant as a more general question of how to separate the
debugging information.  I've done that by creating trampoline
functions that print out the context information before calling
v4l2_m2m_ioctl_streamon/v4l2_m2m_ioctl_streamoff etc.  But it's a
patch that I have to maintain locally.

-Fritz

> > but when I have:
> >
> > [105188.498697] video2: VIDIOC_STREAMOFF: type=vid-out-mplane
> > [105188.498715] video2: VIDIOC_STREAMOFF: type=vid-cap-mplane
> > [105188.499116] video2: VIDIOC_UNSUBSCRIBE_EVENT: type=0x5, id=0x0, flags=0x0
> > [105188.500450] video2: VIDIOC_STREAMOFF: type=vid-out-mplane
> > [105188.500467] video2: VIDIOC_STREAMOFF: type=vid-cap-mplane
> > [105188.500611] video2: VIDIOC_UNSUBSCRIBE_EVENT: type=0x5, id=0x0, flags=0x0
> > [105188.501879] video2: VIDIOC_UNSUBSCRIBE_EVENT: type=0x5, id=0x0, flags=0x0
> > [105188.502276] video2: VIDIOC_STREAMOFF: type=vid-out-mplane
> > [105188.502331] video2: VIDIOC_STREAMOFF: type=vid-cap-mplane
> >
> > I can't tell which stream VIDIOC_STREAMOFF is associated with.  Is
> > there a logging option that I'm missing that would help indicate which
> > stream that ioctl is associated with.
>
> The type expresses if it's from an output queue or a capture queue.
>
>   type=vid-out-mplane : Output queue
>   type=vid-cap-mplane : Capture queue
>
>
> That's not so helpful/useful on the UNSUBSCRIBE_EVENT lines though, but
> your specific request is regarding STREAMOFF.
>
> I hope that helps you read the logs a little.
>
> --
> Kieran
