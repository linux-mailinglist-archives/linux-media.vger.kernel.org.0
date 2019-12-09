Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 56324116DD0
	for <lists+linux-media@lfdr.de>; Mon,  9 Dec 2019 14:18:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727715AbfLINSI (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 9 Dec 2019 08:18:08 -0500
Received: from mail-lj1-f196.google.com ([209.85.208.196]:39888 "EHLO
        mail-lj1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727513AbfLINSI (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 9 Dec 2019 08:18:08 -0500
Received: by mail-lj1-f196.google.com with SMTP id e10so15584222ljj.6
        for <linux-media@vger.kernel.org>; Mon, 09 Dec 2019 05:18:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=aU5mgHvICgEwTorqhLzb99Mw6hzmxrQTFSmnY+KJ2vI=;
        b=Vouz7gqfAYNl/KFfR2THaISgv6Ffw+z15nsU7RTu06/4cDBOeE56GJwz2FmEJGkhcv
         TF7MG4Rf+Tw9B/nSs2q8JLopeHOSmBzEsZQIi9srlD/NzYYXfi6PuDsxk9cGTkTu6BHu
         t90CGSOVegeORKVyJE8ouqKNpcpjystGq0X2Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=aU5mgHvICgEwTorqhLzb99Mw6hzmxrQTFSmnY+KJ2vI=;
        b=jvvGK+/2D4hnhWto9qOYIT5ZLhi7Cg/YucO6p7R9MD4GXMMOBHHGue311AlttN0fpH
         6n1juRH+IMaO8ascWG+NP6KyG3P9qlURlFCW2t/UMm0zYteAcuO52kdbjvERFeZgP7w4
         nJKmcf+KiTbg56rDzuKJnvreiBWI3MGtqk1xeO/W2+LlCpBLvXxivSQmBFG1BRyXvPlh
         XFKuINOTz19DIvsUO0iJRul+Fo3avS69U7ee6b3AnDGHoGzJh2N9AB/1zHgjvrg0BOwY
         se8MyXu/r9abaiqbHn94ApPLbaHb3og/fTHPZBCUCaur2GnVDuWN8DEIh8EK/13B93Om
         dByA==
X-Gm-Message-State: APjAAAXYrNh3a/nwU1w0VFD/RRqxXkKObQih+h9u+ypNLPsy3cqqIBII
        VFFPI2+pxqaXbCfe9W4V6NM0AznSwrBEgA6KuDcDig==
X-Google-Smtp-Source: APXvYqyZQu2ty/E2nm7Vb+3Cns3sk8tjbBs5CjQdwQUoFU+aaSLsoPkYLv27wb2mNzIPxhncxOtDstcfAhgQxkTYMow=
X-Received: by 2002:a2e:2e14:: with SMTP id u20mr3103849lju.120.1575897485920;
 Mon, 09 Dec 2019 05:18:05 -0800 (PST)
MIME-Version: 1.0
References: <20191105191919.167345-1-dmitry.sepp@opensynergy.com>
 <CAD90VcY1QgJGYYXTWDFMVshtV0ZnwLjYUzf3uHcDR=FNA2mMEw@mail.gmail.com>
 <20191209104615.ulct6p34cn7ypvrz@sirius.home.kraxel.org> <1970145.L65FEUb58e@os-lin-dmo>
In-Reply-To: <1970145.L65FEUb58e@os-lin-dmo>
From:   Keiichi Watanabe <keiichiw@chromium.org>
Date:   Mon, 9 Dec 2019 22:17:54 +0900
Message-ID: <CAD90VcaeEti2BW4BoVfP9Qm9J7QtTVPp0wFJAMdgeiCFf2U-Ag@mail.gmail.com>
Subject: Re: [virtio-dev] [RFC RESEND] virtio-video: Add virtio video device specification
To:     Dmitry Sepp <dmitry.sepp@opensynergy.com>
Cc:     Gerd Hoffmann <kraxel@redhat.com>,
        Enrico Granata <egranata@google.com>,
        virtio-dev@lists.oasis-open.org, Tomasz Figa <tfiga@chromium.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Alexandre Courbot <acourbot@chromium.org>,
        Alex Lau <alexlau@chromium.org>,
        Dylan Reid <dgreid@chromium.org>,
        =?UTF-8?Q?St=C3=A9phane_Marchesin?= <marcheu@chromium.org>,
        Pawel Osciak <posciak@chromium.org>,
        David Stevens <stevensd@chromium.org>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Daniel Vetter <daniel@ffwll.ch>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi,

On Mon, Dec 9, 2019 at 8:38 PM Dmitry Sepp <dmitry.sepp@opensynergy.com> wrote:
>
> Hi,
>
> On Montag, 9. Dezember 2019 11:46:15 CET Gerd Hoffmann wrote:
> >   Hi,
> >
> > > > For (1) you'll simply do a QUEUE_BUFFER.  The command carries references
> > > > to the buffer pages.  No resource management needed.
> > > >
> > > > For (2) you'll have RESOURCE_CREATE + RESOURCE_DESTROY + QUEUE_RESOURCE,
> > > > where RESOURCE_CREATE passes the scatter list of buffer pages to the
> > > > host and QUEUE_RESOURCE will carry just the resource id.
> > > >
> > > > For (3) you'll have RESOURCE_IMPORT + RESOURCE_DESTROY + QUEUE_RESOURCE.
> > >
> > > Thanks for the clarification.
> > > On second thought, however, I'm wondering if we should keep all
> > > RESOURCE controls.
> > > This should be an option (4).
> >
> > Well, that's actually (2), aka "we use RESOURCE_* commands to manage
> > resources".  With the commands in the latest draft that would be:
> >
> >   (1) RESOURCE_CREATE
> >   (2) RESOURCE_ATTACH_BACKING
> >   (3) RESOURCE_QUEUE (resource can be used multiple times here)
> >   (4) RESOURCE_DETACH_BACKING
> >   (5) RESOURCE_DESTROY
> >
> > I'm not sure we need the separate *_BACKING commands.  I think we could
> > also have RESOURCE_CREATE pass the buffer pages scatter list instead.
> >
> > Why it is done this way?  Just because the design was copied from
> > virtio-gpu?  Or is there some specific reason?
>
> Yes, the design was just derived from virtio-gpu at early stages.
>
> I do agree we should merge the two steps.

Thanks for the explanation.  Merging them sounds good to me.

-Keiichi

>
> >
> > cheers,
> >   Gerd
>
>
