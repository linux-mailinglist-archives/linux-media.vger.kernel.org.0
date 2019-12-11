Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BA6B411B727
	for <lists+linux-media@lfdr.de>; Wed, 11 Dec 2019 17:06:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388102AbfLKQF4 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 11 Dec 2019 11:05:56 -0500
Received: from mail-qk1-f193.google.com ([209.85.222.193]:39725 "EHLO
        mail-qk1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732793AbfLKQFy (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 11 Dec 2019 11:05:54 -0500
Received: by mail-qk1-f193.google.com with SMTP id c16so11660381qko.6
        for <linux-media@vger.kernel.org>; Wed, 11 Dec 2019 08:05:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=rehiyiPENjIb3TkGzxdImMUheY4m13it4HkAOv4ifvA=;
        b=vTsmwQUGn0PUh4gMKS4wWcvmJG9Rls92dzR7yu3qn9LK1XT3kD28mO+CU67Z6t3Kjg
         Hdg1fiVHJmBBtpaFSWqVTc8/bEFywDYGJH/GPAe+PvySrIKunzLxecQ5DxeXrtNn04T7
         MZbJXaN6QLLDpvIJFkZoeoYorXVI56DjLDfGXfmV9VXgzcEvimD1OsJ/ObTAkyFpTK9j
         Bh4zi2aWz1IAadMIXSNWBe7WEjdVJM963QzpsU8/fprO8FZ2t6aMpI+3qrBcCClsTg7s
         fIaIr27QMj1Um5In/gi8No9JpBYd1pH9esdh8Wg/nVdRbFKofD6BOkla/vA26Wpq3lR9
         trzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=rehiyiPENjIb3TkGzxdImMUheY4m13it4HkAOv4ifvA=;
        b=MSpAAbXjNZ/KUauztmatZB4eG8Wu+78L0uhSRoZXxHDKpZKDLpsORrgqEUfBu88UjQ
         OfXs7OLJ6sIU+jCeoFkTa5MKJA8JXQ/4f6qor/ddTInn8uQf7alD6rgPBnYuavhekOme
         zjyvZur/n8AhShnQwt5NTm2GqjCQqOQvkfNS1SjtebraUjqFfC3w8YKoIyf2dxGGCZvZ
         VO4W7FbI5CuZmW4puJKmTSPMQIryR9zEGxZ9A6iY1XamSbdtTxNxKcBrUXmK46gFMLCY
         hIext33qksKvZjflRYobInA0VrHgP6rZYf9uDGfPjMlCGxwQQ4DKh01N0ajTJtCXK5R+
         jPsg==
X-Gm-Message-State: APjAAAUQklro4tHurWq2D3yPU03ai3yz5egc03kX3kTHkrBGuqEz+XIs
        QT7kYTR8cqI1xJERwISdY6Kkt+Jr/cYuP1YseefTKw==
X-Google-Smtp-Source: APXvYqwfhmkuQ3K22hYcRkCOlEFPEw9qgU3YRMBjW3CG9Yuk+ek1oqXWKsbNqkZQBQzVDCnoEwkSWILGRpBU8BTNRKM=
X-Received: by 2002:a37:48f:: with SMTP id 137mr3663089qke.25.1576080352362;
 Wed, 11 Dec 2019 08:05:52 -0800 (PST)
MIME-Version: 1.0
References: <20191105105456.7xbhtistnbp272lj@sirius.home.kraxel.org>
 <CAD=HUj7EsxrkSubmY6HE4aYJOykVKtmGXjMjeGqnoJw1KZUc5Q@mail.gmail.com>
 <20191106124101.fsfxibdkypo4rswv@sirius.home.kraxel.org> <72712fe048af1489368f7416faa92c45@hostfission.com>
 <CAAFQd5Cpb=3HRL3NbgxP+S259nkNEuA=u75ew1JQTzvVUU5NeQ@mail.gmail.com>
 <d65bec5074eda5f389668e28922c1609@hostfission.com> <CAAFQd5AWqYaNWfYQ2hepjg7OD8y8ehHn0guusAR8JYefc+BNaw@mail.gmail.com>
 <CAEUnVG77y2DrV5kLTHDy1xio+yzMGv9j=M0c4388vH_LUaiXLg@mail.gmail.com>
 <CAD=HUj40Jb2cy8EP=24coO-CPUvq6ib+01bvXHn1G9GD8KuenA@mail.gmail.com> <20191211092625.jzqx2ukphhggwavo@sirius.home.kraxel.org>
In-Reply-To: <20191211092625.jzqx2ukphhggwavo@sirius.home.kraxel.org>
From:   Enrico Granata <egranata@google.com>
Date:   Wed, 11 Dec 2019 08:05:40 -0800
Message-ID: <CAPR809tr7cY_ONLgc2Gq2hzuR+FZrtJ5nsLsq-UmV0LxFu0CRA@mail.gmail.com>
Subject: Re: [virtio-dev] Re: guest / host buffer sharing ...
To:     Gerd Hoffmann <kraxel@redhat.com>
Cc:     David Stevens <stevensd@chromium.org>,
        Dylan Reid <dgreid@chromium.org>,
        Tomasz Figa <tfiga@chromium.org>,
        Zach Reizner <zachr@chromium.org>,
        Geoffrey McRae <geoff@hostfission.com>,
        Keiichi Watanabe <keiichiw@chromium.org>,
        Dmitry Morozov <dmitry.morozov@opensynergy.com>,
        Alexandre Courbot <acourbot@chromium.org>,
        Alex Lau <alexlau@chromium.org>,
        =?UTF-8?Q?St=C3=A9phane_Marchesin?= <marcheu@chromium.org>,
        Pawel Osciak <posciak@chromium.org>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Daniel Vetter <daniel@ffwll.ch>,
        Gurchetan Singh <gurchetansingh@chromium.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        virtio-dev@lists.oasis-open.org, qemu-devel <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, Dec 11, 2019 at 1:26 AM Gerd Hoffmann <kraxel@redhat.com> wrote:
>
>   Hi,
>
> > None of the proposals directly address the use case of sharing host
> > allocated buffers between devices, but I think they can be extended to
> > support it. Host buffers can be identified by the following tuple:
> > (transport type enum, transport specific device address, shmid,
> > offset). I think this is sufficient even for host-allocated buffers
> > that aren't visible to the guest (e.g. protected memory, vram), since
> > they can still be given address space in some shared memory region,
> > even if those addresses are actually inaccessible to the guest. At
> > this point, the host buffer identifier can simply be passed in place
> > of the guest ram scatterlist with either proposed buffer sharing
> > mechanism.
>
> > I think the main question here is whether or not the complexity of
> > generic buffers and a buffer sharing device is worth it compared to
> > the more implicit definition of buffers.
>
> Here are two issues mixed up.  First is, whenever we'll go define a
> buffer sharing device or not.  Second is how we are going to address
> buffers.
>
> I think defining (and addressing) buffers implicitly is a bad idea.
> First the addressing is non-trivial, especially with the "transport
> specific device address" in the tuple.  Second I think it is a bad idea
> from the security point of view.  When explicitly exporting buffers it
> is easy to restrict access to the actual exports.
>

Strong +1 to the above. There are definitely use cases of interest
where it makes sense to be able to attach security attributes to
buffers.
Having an explicit interface that can handle all of this, instead of
duplicating logic in several subsystems, seems a worthy endeavor to
me.

> Instead of using a dedicated buffer sharing device we can also use
> virtio-gpu (or any other driver which supports dma-buf exports) to
> manage buffers.  virtio-gpu would create an identifier when exporting a
> buffer (dma-buf exports inside the guest), attach the identifier to the
> dma-buf so other drivers importing the buffer can see and use it.  Maybe
> add an ioctl to query, so guest userspace can query the identifier too.
> Also send the identifier to the host so it can also be used on the host
> side to lookup and access the buffer.
>
> With no central instance (buffer sharing device) being there managing
> the buffer identifiers I think using uuids as identifiers would be a
> good idea, to avoid clashes.  Also good for security because it's pretty
> much impossible to guess buffer identifiers then.
>
> cheers,
>   Gerd
>
>
> ---------------------------------------------------------------------
> To unsubscribe, e-mail: virtio-dev-unsubscribe@lists.oasis-open.org
> For additional commands, e-mail: virtio-dev-help@lists.oasis-open.org
>
