Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5ACFD11CD1C
	for <lists+linux-media@lfdr.de>; Thu, 12 Dec 2019 13:26:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729174AbfLLM0o (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 12 Dec 2019 07:26:44 -0500
Received: from mail-qt1-f193.google.com ([209.85.160.193]:46348 "EHLO
        mail-qt1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729159AbfLLM0o (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 12 Dec 2019 07:26:44 -0500
Received: by mail-qt1-f193.google.com with SMTP id 38so2068205qtb.13
        for <linux-media@vger.kernel.org>; Thu, 12 Dec 2019 04:26:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=zzuaDacu5BFhoisZaoQtnflxPHTSJ1BMzYrW5oVhp6A=;
        b=ccGurdDWOjVoQeL3FLvqQ+fVjvam+gDriu9+NtKrTWLFwG7hAdq/96uznle/g7ot87
         zkuNY4KDorEuL4NVOkq6tFOB8S4Zcs0tcbdhvvOUhJlQ6YDUyfl6Dvg5yzOwHNUeokxE
         VKkje5Uql4RRBOtKUD6+7/lHTHFe6sm2xdo2U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=zzuaDacu5BFhoisZaoQtnflxPHTSJ1BMzYrW5oVhp6A=;
        b=AAN3QYyBdMr6H10qm8dLUh2zqm5sruxlVs+Vep3CmES+wA54GWOeCnDvFHPlCVEVju
         9Cv3i08Sw6tcwlxNPqsetyQvBzjXcUGFkQKHXYfyDR+6Snaol/FzMYkKwtdVP7ltV1yr
         izYp8NCKZTzjmwVoNnEQV5DQSve4ZOslCawl74nyTuB1h+aXtKjgmI4SWmWBPX+zQA3D
         usd+uvC5i7kWis6mLV2X+X3S+zhjtySwldDjGKq4qE1StfFTz3I5sXfYnFMAb3QIj5gf
         G3CUoX26AU7FXJeXUP6We3DVF7Fvv0ddnsmcE22E9nlYJ3bn8wa6NcFyFzF+mo8TkHsy
         K3hQ==
X-Gm-Message-State: APjAAAW7AoHFc0hlhfKAZKqnJB8pDSDk6UkoeNzWWJy92MHVt4mUvKT+
        p3vTbIhfZEAm5/UBJJ7RBEvwil5wcmUgYvbss1/+1A==
X-Google-Smtp-Source: APXvYqyyW9xksRz10OUFM4sUWiAeVJQVc8sXvXBShkOf1bK8grmGt1MOoQHtahVrRAWGVxDTH6FRr9lamDi8qA2+Pt8=
X-Received: by 2002:aed:2344:: with SMTP id i4mr7392923qtc.136.1576153603247;
 Thu, 12 Dec 2019 04:26:43 -0800 (PST)
MIME-Version: 1.0
References: <CAD=HUj7EsxrkSubmY6HE4aYJOykVKtmGXjMjeGqnoJw1KZUc5Q@mail.gmail.com>
 <20191106124101.fsfxibdkypo4rswv@sirius.home.kraxel.org> <72712fe048af1489368f7416faa92c45@hostfission.com>
 <CAAFQd5Cpb=3HRL3NbgxP+S259nkNEuA=u75ew1JQTzvVUU5NeQ@mail.gmail.com>
 <d65bec5074eda5f389668e28922c1609@hostfission.com> <CAAFQd5AWqYaNWfYQ2hepjg7OD8y8ehHn0guusAR8JYefc+BNaw@mail.gmail.com>
 <CAEUnVG77y2DrV5kLTHDy1xio+yzMGv9j=M0c4388vH_LUaiXLg@mail.gmail.com>
 <CAD=HUj40Jb2cy8EP=24coO-CPUvq6ib+01bvXHn1G9GD8KuenA@mail.gmail.com>
 <20191211092625.jzqx2ukphhggwavo@sirius.home.kraxel.org> <CAD=HUj7d3SWqCH=57ymy-BVd6xdJWc=WSqHAFyQXt-3MjchEAA@mail.gmail.com>
 <20191212094121.by7w7fywlzdfoktn@sirius.home.kraxel.org>
In-Reply-To: <20191212094121.by7w7fywlzdfoktn@sirius.home.kraxel.org>
From:   David Stevens <stevensd@chromium.org>
Date:   Thu, 12 Dec 2019 21:26:32 +0900
Message-ID: <CAD=HUj6YYupjdxxz2mgMmE2DcKhXP-qdhRORvUNTmzcORRrLzg@mail.gmail.com>
Subject: Re: [virtio-dev] Re: guest / host buffer sharing ...
To:     Gerd Hoffmann <kraxel@redhat.com>
Cc:     Dylan Reid <dgreid@chromium.org>, Tomasz Figa <tfiga@chromium.org>,
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

> > > Second I think it is a bad idea
> > > from the security point of view.  When explicitly exporting buffers it
> > > is easy to restrict access to the actual exports.
> >
> > Restricting access to actual exports could perhaps help catch bugs.
> > However, I don't think it provides any security guarantees, since the
> > guest can always just export every buffer before using it.
>
> Probably not on the guest/host boundary.
>
> It's important for security inside the guest though.  You don't want
> process A being able to access process B private resources via buffer
> sharing support, by guessing implicit buffer identifiers.

At least for the linux guest implementation, I wouldn't think the
uuids would be exposed from the kernel. To me, it seems like something
that should be handled internally by the virtio drivers. Especially
since the 'export' process would be very much a virtio-specific
action, so it's likely that it wouldn't fit nicely into existing
userspace software. If you use some other guest with untrusted
userspace drivers, or if you're pulling the uuids out of the kernel to
give to some non-virtio transport, then I can see it being a concern.

> > > Instead of using a dedicated buffer sharing device we can also use
> > > virtio-gpu (or any other driver which supports dma-buf exports) to
> > > manage buffers.

Ah, okay. I misunderstood the original statement. I read the sentence
as 'we can use virtio-gpu in place of the dedicated buffer sharing
device', rather than 'every device can manage its own buffers'. I can
agree with the second meaning.

> Without buffer sharing support the driver importing a virtio-gpu dma-buf
> can send the buffer scatter list to the host.  So both virtio-gpu and
> the other device would actually access the same guest pages, but they
> are not aware that the buffer is shared between devices.

With the uuid approach, how should this case be handled? Should it be
equivalent to exporting and importing the buffer which was created
first? Should the spec say it's undefined behavior that might work as
expected but might not, depending on the device implementation? Does
the spec even need to say anything about it?

> With buffer sharing virtio-gpu would attach a uuid to the dma-buf, and
> the importing driver can send the uuid (instead of the scatter list) to
> the host.  So the device can simply lookup the buffer on the host side
> and use it directly.  Another advantage is that this enables some more
> use cases like sharing buffers between devices which are not backed by
> guest ram.

Not just buffers not backed by guest ram, but things like fences. I
would suggest the uuids represent 'exported resources' rather than
'exported buffers'.

> Well, security-wise you want have buffer identifiers which can't be
> easily guessed.  And guessing uuid is pretty much impossible due to
> the namespace being huge.

I guess this depends on what you're passing around within the guest.
If you're passing around the raw uuids, sure. But I would argue it's
better to pass around unforgeable identifiers (e.g. fds), and to
restrict the uuids to when talking directly to the virtio transport.
But I guess there are likely situations where that's not possible.

-David
