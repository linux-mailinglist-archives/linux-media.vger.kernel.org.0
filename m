Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A30B0139085
	for <lists+linux-media@lfdr.de>; Mon, 13 Jan 2020 12:59:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726480AbgAML77 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 13 Jan 2020 06:59:59 -0500
Received: from mail-ed1-f66.google.com ([209.85.208.66]:41485 "EHLO
        mail-ed1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726127AbgAML76 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 13 Jan 2020 06:59:58 -0500
Received: by mail-ed1-f66.google.com with SMTP id c26so8189814eds.8
        for <linux-media@vger.kernel.org>; Mon, 13 Jan 2020 03:59:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=thjqlNkvwtIDUnt8FnThirW43Q0B9qt8eiRUT807FXM=;
        b=N8rHDPN27UPJg5z8G8CCz9WL9rr3g1XgmKdsIKbYH0RSF7ux0mOCHAWcWt+a0S6MRq
         gZAcZK4RFDOzV85u/kqzJjTDmTe4Qs1UR4ndJH08rQbMV2wHhqupfaJjQx+avlNtpFOm
         bdDHMBbBiXOqsWxgG7ta5rVnyvO04HDyYQnIE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=thjqlNkvwtIDUnt8FnThirW43Q0B9qt8eiRUT807FXM=;
        b=G3IJNN8PVonFLVmUUeiWH53e1FruhZQBbpfYIyBNsk2Py1V9f5PvjQaG1rXwWzztT5
         kpVBaaO77t8HSvHffI+dOe4QwuBJNCxz5w8ph1LwYwrg5LNYq5RHLq4rHGQGQb+RBPJj
         6MMhKF8UmbcGW+Xv5lr44oLYoF+xgsbR1GP1LkBNEhEF4V+KUt1QyQktFIbFwufRcLWQ
         M77wezWmRQNwIsRvwBNIHKW3QgtwQ5tLS9iQLb8M/59VnfNw09WQPpA2nt4ECmR0yaaA
         9s0omkj0TDYDKnBDjmulGUsQrp56JSxwBR8SjaqtLLtV3bM3NGSjoXmHy7JS0XcKzTre
         TVew==
X-Gm-Message-State: APjAAAWtq7ATVipXR6wh10IuRyJJJh8+QgvJiJ94ts02jgZuYpVWoG3K
        YWG9oqmUBmoyaWTqwgCUVho61H9N8bc=
X-Google-Smtp-Source: APXvYqw3t8WGBbDcr7Wkk4mmn3gnISuHL5vchI8cGTuCV6OYk7mC2q8O1yqjTkJKkf70rkgVSQEb5Q==
X-Received: by 2002:a05:6402:889:: with SMTP id e9mr13642541edy.313.1578916796763;
        Mon, 13 Jan 2020 03:59:56 -0800 (PST)
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com. [209.85.221.54])
        by smtp.gmail.com with ESMTPSA id u29sm413251edb.22.2020.01.13.03.59.55
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Jan 2020 03:59:55 -0800 (PST)
Received: by mail-wr1-f54.google.com with SMTP id c9so8258742wrw.8
        for <linux-media@vger.kernel.org>; Mon, 13 Jan 2020 03:59:55 -0800 (PST)
X-Received: by 2002:a5d:49c3:: with SMTP id t3mr18142495wrs.113.1578916794914;
 Mon, 13 Jan 2020 03:59:54 -0800 (PST)
MIME-Version: 1.0
References: <20191218130214.170703-1-keiichiw@chromium.org>
 <7740094.NyiUUSuA9g@os-lin-dmo> <20200113095636.blov62o4gbf27om5@sirius.home.kraxel.org>
 <12433898.dW097sEU6C@os-lin-dmo> <20200113110521.5ogc3fcy4zq32yzg@sirius.home.kraxel.org>
In-Reply-To: <20200113110521.5ogc3fcy4zq32yzg@sirius.home.kraxel.org>
From:   Tomasz Figa <tfiga@chromium.org>
Date:   Mon, 13 Jan 2020 20:59:42 +0900
X-Gmail-Original-Message-ID: <CAAFQd5D16G0E85BCZVx1LXd1TauQH8Lbgs5-0gLv7tNpm4sp_A@mail.gmail.com>
Message-ID: <CAAFQd5D16G0E85BCZVx1LXd1TauQH8Lbgs5-0gLv7tNpm4sp_A@mail.gmail.com>
Subject: Re: [virtio-dev] Re: [PATCH v2 0/1] VirtIO video device specification
To:     Gerd Hoffmann <kraxel@redhat.com>
Cc:     Dmitry Sepp <dmitry.sepp@opensynergy.com>,
        spice-devel@lists.freedesktop.org,
        Keiichi Watanabe <keiichiw@chromium.org>,
        virtio-dev@lists.oasis-open.org,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Alexandre Courbot <acourbot@chromium.org>,
        Alex Lau <alexlau@chromium.org>,
        Daniel Vetter <daniel@ffwll.ch>,
        Dylan Reid <dgreid@chromium.org>,
        Enrico Granata <egranata@google.com>,
        Frediano Ziglio <fziglio@redhat.com>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        =?UTF-8?Q?St=C3=A9phane_Marchesin?= <marcheu@chromium.org>,
        Pawel Osciak <posciak@chromium.org>,
        David Stevens <stevensd@chromium.org>, uril@redhat.com
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, Jan 13, 2020 at 8:05 PM Gerd Hoffmann <kraxel@redhat.com> wrote:
>
> On Mon, Jan 13, 2020 at 11:41:45AM +0100, Dmitry Sepp wrote:
> > Hi Gerd,
> >
> > Thanks for reviewing!
> >
> > On Montag, 13. Januar 2020 10:56:36 CET Gerd Hoffmann wrote:
> > >   Hi,
> > >
> > > > This also means that we cannot have unspec for planes layout. Device
> > > > either
> > > > expects planes in separate buffers or in one buffer with some offsets,
> > > > there cannot be mixed cases.
> > >
> > > Hmm.  Is it useful to support both?  Or maybe support the "one buffer +
> > > offsets" case only?  Splitting one buffer into multiple smaller ones
> > > internally if needed shouldn't be a problem, and it would simplify the
> > > interface a bit ...
> > >
> >
> > Ok, let's consider the following case:
> >  - the device expects planes in separate buffers.
> >  - say, Android on the guest side also imports planes in separate buffers into the driver.
> >  - but he driver only supports one buffer + offsets.
> >
> > Do you mean the driver then can join the underlying page lists and set offsets then? Yes,
> > this would probably make sense.
>
> Well, no.  Tomasz Figa had splitted the devices into three groups:
>
>   (1) requires single buffer.
>   (2) allows any layout (including the one (1) devices want).
>   (3) requires per-plane buffers.
>
> Category (3) devices are apparently rare and old.  Both category (1)+(2)
> devices can handle single buffers just fine.  So maybe support only
> that?

From the guest implementation point of view, Linux V4L2 currently
supports 2 cases, if used in allocation-mode (i.e. the buffers are
allocated locally by V4L2):

i) single buffer with plane offsets predetermined by the format, (can
be handled by devices from category 1) and 2))
ii) per-plane buffers with planes at the beginning of their own
buffers. (can be handled by devices from category 2) and 3))

Support for ii) is required if one wants to be able to import buffers
with arbitrary plane offsets, so I'd consider it unavoidable.

Given that, I'd suggest going with per-plane buffer specifiers. I feel
like it doesn't have much cost associated, but gives the most
flexibility.

Best regards,
Tomasz
