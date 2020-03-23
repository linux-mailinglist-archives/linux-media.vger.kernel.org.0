Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3F35E18F8EB
	for <lists+linux-media@lfdr.de>; Mon, 23 Mar 2020 16:48:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727330AbgCWPsb (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 23 Mar 2020 11:48:31 -0400
Received: from mail-lf1-f68.google.com ([209.85.167.68]:39361 "EHLO
        mail-lf1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726049AbgCWPsb (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 23 Mar 2020 11:48:31 -0400
Received: by mail-lf1-f68.google.com with SMTP id j15so10624046lfk.6
        for <linux-media@vger.kernel.org>; Mon, 23 Mar 2020 08:48:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=lTTRaLtHtO/Dzo1hQ/OUZ0h7xwYtngBybpLWImeU4KU=;
        b=ZkKo4e5TLlsCTaA08LfGNHUPMBj6zhetIDQwYi4ZDxjkr827Tr786a+ehrUpJwlcXN
         d9C92OxTiTvUCj0i2pucNzGBGJ5+U6qGHNirsaQtkL2DpxQ2su622Swx+Sg2Tlipuj0r
         OevxjuYYYOwiMJAK5O4z7UNsVogbQkpb07+LQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=lTTRaLtHtO/Dzo1hQ/OUZ0h7xwYtngBybpLWImeU4KU=;
        b=MLPn99BuKZ9wEfCDd2+WX0T+J3aJ8sKzdQdUYByrTUzRWSpyuNMkCPCR+N39JBW23K
         yC3dMGkIOcC8cL7h1M3P99yPLW6MpFWMZMjnZZhMsQAFlPqzv/weVmkSp1umShI+HTYy
         /GTossLlZHcuN48P/4V/qxQyaN4vyzyeApr22MavMa4uQtIejzSgkiWzr82H9GlkmuzR
         h0Zh+Q+xl7POH2+1uG6eI7b67WzE4KhXFZ0cLrCzbfYVlbc58AH34NQC9oVA7PEQ9cqz
         CRBIbQ0Rj2rrlFVYEQFeIgFnnWrRwqwt4wIA7VH70gxongFVqtlZW1E9CTZnLhsZceS5
         BPgQ==
X-Gm-Message-State: ANhLgQ3aSczmKxIcBYzp7YLyyIyBV2aNL5utPdBEZqnA+hv/FO7PSZza
        g2X2c2IdGmhssUem9ipFUdZk2yKWbgEAr2EPFfwcBw==
X-Google-Smtp-Source: ADFU+vstBGHjHiJjILn7zs9DnLOB8AlIhFkiBss3AO8kr+mH4zRVkfRw3I1B1g97LdOEdshnC3/SG+VQ/fzyghRnDbg=
X-Received: by 2002:a05:6512:4cf:: with SMTP id w15mr13305202lfq.147.1584978506177;
 Mon, 23 Mar 2020 08:48:26 -0700 (PDT)
MIME-Version: 1.0
References: <20200206102058.247258-1-keiichiw@chromium.org>
 <CAPBb6MVPjgLkbVjOY6O3srywNm8Zb1pMR2pGM1NinByhgFaZ_A@mail.gmail.com>
 <CAD90VcaYi2KawNOewRaL1QihUjgja6nLyzU+0R7nsHPN3voXDA@mail.gmail.com> <8121654.T7Z3S40VBb@os-lin-dmo>
In-Reply-To: <8121654.T7Z3S40VBb@os-lin-dmo>
From:   Keiichi Watanabe <keiichiw@chromium.org>
Date:   Tue, 24 Mar 2020 00:48:14 +0900
Message-ID: <CAD90VcZ2zzzwveYgDs5UdjfZUt=yX4wNX-f_-3V18xz93_fpvQ@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] virtio-video: Add virtio video device specification
To:     Dmitry Sepp <dmitry.sepp@opensynergy.com>
Cc:     Alexandre Courbot <acourbot@chromium.org>,
        Gerd Hoffmann <kraxel@redhat.com>,
        virtio-dev@lists.oasis-open.org,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Alex Lau <alexlau@chromium.org>,
        Daniel Vetter <daniel@ffwll.ch>,
        Dylan Reid <dgreid@chromium.org>,
        David Staessens <dstaessens@chromium.org>,
        Enrico Granata <egranata@google.com>,
        Frediano Ziglio <fziglio@redhat.com>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        =?UTF-8?Q?St=C3=A9phane_Marchesin?= <marcheu@chromium.org>,
        Pawel Osciak <posciak@chromium.org>,
        spice-devel@lists.freedesktop.org,
        David Stevens <stevensd@chromium.org>,
        Tomasz Figa <tfiga@chromium.org>, uril@redhat.com,
        Samiullah Khawaja <samiullah.khawaja@opensynergy.com>,
        Kiran Pawar <kiran.pawar@opensynergy.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi,

On Mon, Mar 23, 2020 at 10:28 PM Dmitry Sepp
<dmitry.sepp@opensynergy.com> wrote:
>
> Hi Keiichi,
>
> On Montag, 23. M=C3=A4rz 2020 13:07:54 CET Keiichi Watanabe wrote:
> > Hi everyone,
> >
> > I have implemented a virtio-video device following my v3 spec in
> > crosvm, which worked well together with Dmitry's driver [1]. I've
> > started preparing v4 proposal to address problems found while
> > implementing the driver and the devices.
>
> Great news!
>
> >
> > Regarding v3 protocol, I'm thinking about how we can differentiate
> > 'parameters' and 'controls' in the virtio-video spec?
> > In the previous discussion, we decided to have a profile, level and
> > bitrate as controls because we want to query supported values for each
> > field.
> > But, I don't think it's a good criteria because it'd be possible to
> > query other values in params.
>
> Could you elaborate on this? Do you now how the design could look like or=
 it
> is just an idea? AFAIR during the discussion of OpenSynergy's original v1=
 spec
> your point was to separate something that we call 'controls' now to reduc=
e the
> command data size and make command handling less error prone.

The problem in v3 is that if we want to add a new value to be set it'd
be unclear which params or controls is better to be extended.
One possible rule may be "if a value can be queried by the driver, it
should be a control". However, this rule doesn't explain why we have
"format" in params for example. So, I think we need a discussion and
may want to rearrange the structures.

Yeah, in the previous discussion, I suggested to have profile, level
and bitrate as control values instead of members of params. Now, I'm
wondering whether we can have every values as control values.
I don't think it's a perfect idea, but I haven't come up with any
better concrete design yet. So, I'd really appreciate if you could
share your thoughts.

>
> On one hand if don't really see any difference in params vs controls it w=
ould
> for sure make sense to remove one of the two. On the other hand I'd of co=
urse
> like to avoid moving back in forth, especially when it comes to such a ma=
jor
> driver rework.

Yes, I understand that it may require a big change in the implementation.
I'm sorry for not being able to think of this point seriously in the
previous thread.

Of course, I'd also really like to avoid rework, but I believe we
shouldn't give up defining a clean and reasonable specification.
Let's find a clear definition in this cycle to avoid future rework.

>
> >
> > So, I'm thinking about what should be the difference between params
> > and controls. If no difference, we should deprecate
> > virtio_video_params and have every field there as a control value
> > instead.
>
> I deem we should then deprecate controls instead. Params seem to be more
> abstract. Width and height don't sound like a control for me.

Though this is actually one of options, how can we query profiles and
levels if they are in params?
This is why we decided them as controls.

Best regards,
Keiichi

>
> > If we add a new command to get and set multiple controls at once, this
> > change won't cause overhead.
> >
>
> How would we do this? Provide a flexible array member where each entry ha=
s a
> type field first?

Yeah, something like the idea. But, I haven't designed an actual structure =
yet.

>
> What can also make sense is to potentially join set and get calls (probab=
ly
> provide 'get' stuff automatically within a response to 'set'). Anyway set=
 and
> get are currently used in conjunction all the time.

It'd make sense to return new input and output params when one of
params is updated.
But, if we choose this design, we need to assume one device has just
two params; input and output.

This is okay for video decoder and encoder, but it may become a
problem if we want to support other types of video device that has
only one direction. (e.g. video capture device)
Though we have no plan for supporting this, OpenSynergy's v1 proposal
contained this type IIRC.

Best regards,
Keiichi

>
> Best regards,
> Dmitry.
>
> > What do you think? Is there anything I missed?
> > If it sounds fine, I'll remove virtio_video_params from the v4 spec
> > proposal.
> >
> > Best regards,
> > Keiichi
> >
> > [1]: https://patchwork.linuxtv.org/patch/61717/
>
>
