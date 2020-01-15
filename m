Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D747913BE0A
	for <lists+linux-media@lfdr.de>; Wed, 15 Jan 2020 12:00:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729274AbgAOLAt (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 15 Jan 2020 06:00:49 -0500
Received: from mail-ed1-f68.google.com ([209.85.208.68]:39809 "EHLO
        mail-ed1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729057AbgAOLAt (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 15 Jan 2020 06:00:49 -0500
Received: by mail-ed1-f68.google.com with SMTP id t17so15103374eds.6
        for <linux-media@vger.kernel.org>; Wed, 15 Jan 2020 03:00:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=rJzm62o0oregtlHx6JggNzvTeqhXQvySWqorYcc+30k=;
        b=Sqybs2to0brQ1/Eetk24II31DizBNUS4Hn23+0ncv1S4dt+csN19wcu+VTmmzG+KCI
         p5Mzb6pfRhtplMLMV3ishWLKJaAsiX8UjXWBxjUHEUVm8iHyuKOxd3DLdD6qngEN6k9d
         /k2sx4zJCZnuvsx+7axGzsEezQQ/l/TUivUQk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=rJzm62o0oregtlHx6JggNzvTeqhXQvySWqorYcc+30k=;
        b=hhIRjDLLYT5ZEGYjL4oUcxgaPQXITai5Qw8uaaXc7M532/x73hJMOmPUQeIkX8p2ZX
         sr2wawuUwxGqfVB64IkPLHlTEQWOrFOj2EsdfgFDtiP+u8yxKNNky4g5j83Lpf19B1C+
         nG3RrWcDwDBMEANLNl50gOWPL56+ANKdgWcSdXW0ReVulx3GsqUyuepynrAmorYlWM4K
         hAPNanILNSLwbC5WOV3yOgX+KiUNXZ+JWW7qVgfhF4uSiIVPfvBBcFy3as1iNubT+Fmp
         unn3+uS/Uq93U3N6tsEBdMuAuIQWrTyMwJFZbhmDDz4SAVSVsdDlsrD4fkla5NisCnUM
         m68w==
X-Gm-Message-State: APjAAAVRgLB+x5eHExfgqN+u6FD0+z4pBNt85fBGTpqINLm4TCMNtHIm
        HZ+Ok63N4BMKVG1S+26LnuRdmnGF9vXP7A==
X-Google-Smtp-Source: APXvYqyVybuUWRgan74Mn81NXjdgWEsnEoKXmDkynx99g/CUTeCzEIfkw9M5RFLBEEi/5mLCSgYZKg==
X-Received: by 2002:aa7:d3cd:: with SMTP id o13mr29528605edr.276.1579086046752;
        Wed, 15 Jan 2020 03:00:46 -0800 (PST)
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com. [209.85.221.54])
        by smtp.gmail.com with ESMTPSA id f13sm693195edq.26.2020.01.15.03.00.44
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Jan 2020 03:00:45 -0800 (PST)
Received: by mail-wr1-f54.google.com with SMTP id y17so15302658wrh.5
        for <linux-media@vger.kernel.org>; Wed, 15 Jan 2020 03:00:44 -0800 (PST)
X-Received: by 2002:a5d:4b8f:: with SMTP id b15mr32147207wrt.100.1579086044123;
 Wed, 15 Jan 2020 03:00:44 -0800 (PST)
MIME-Version: 1.0
References: <20191218130214.170703-1-keiichiw@chromium.org>
 <7740094.NyiUUSuA9g@os-lin-dmo> <20200113095636.blov62o4gbf27om5@sirius.home.kraxel.org>
 <12433898.dW097sEU6C@os-lin-dmo> <20200113110521.5ogc3fcy4zq32yzg@sirius.home.kraxel.org>
 <CAAFQd5D16G0E85BCZVx1LXd1TauQH8Lbgs5-0gLv7tNpm4sp_A@mail.gmail.com> <20200113132654.r4lhspfx2z7zse2v@sirius.home.kraxel.org>
In-Reply-To: <20200113132654.r4lhspfx2z7zse2v@sirius.home.kraxel.org>
From:   Tomasz Figa <tfiga@chromium.org>
Date:   Wed, 15 Jan 2020 20:00:31 +0900
X-Gmail-Original-Message-ID: <CAAFQd5A3=4JC+3bRf2iw8RwsoB1jJz8p5afi6KaHO6ML2LC0Rg@mail.gmail.com>
Message-ID: <CAAFQd5A3=4JC+3bRf2iw8RwsoB1jJz8p5afi6KaHO6ML2LC0Rg@mail.gmail.com>
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

On Mon, Jan 13, 2020 at 10:27 PM Gerd Hoffmann <kraxel@redhat.com> wrote:
>
>   Hi,
>
> > > Well, no.  Tomasz Figa had splitted the devices into three groups:
> > >
> > >   (1) requires single buffer.
> > >   (2) allows any layout (including the one (1) devices want).
> > >   (3) requires per-plane buffers.
> > >
> > > Category (3) devices are apparently rare and old.  Both category (1)+(2)
> > > devices can handle single buffers just fine.  So maybe support only
> > > that?
> >
> > From the guest implementation point of view, Linux V4L2 currently
> > supports 2 cases, if used in allocation-mode (i.e. the buffers are
> > allocated locally by V4L2):
> >
> > i) single buffer with plane offsets predetermined by the format, (can
> > be handled by devices from category 1) and 2))
> > ii) per-plane buffers with planes at the beginning of their own
> > buffers. (can be handled by devices from category 2) and 3))
> >
> > Support for ii) is required if one wants to be able to import buffers
> > with arbitrary plane offsets, so I'd consider it unavoidable.
>
> If you have (1) hardware you simply can't import buffers with arbitrary
> plane offsets, so I'd expect software would prefer the single buffer
> layout (i) over (ii), even when using another driver + dmabuf
> export/import, to be able to support as much hardware as possible.
> So (ii) might end up being unused in practice.
>
> But maybe not, was just an idea, feel free to scratch it.

That's true, simple user space would often do that. However, if more
devices are in the game, often some extra alignment or padding between
planes is needed and that is not allowed by (1), even though all the
planes are in the same buffer.

My suggestion, based on the latest V4L2 discussion on unifying the
UAPI of i) and ii), is that we may want to instead always specify
buffers on a per-plane basis. Any additional requirements would be
then validated by the host, which could check if the planes end up in
the same buffer (or different buffers for (3)) and/or at the right
offsets.

WDYT?

Best regards,
Tomasz
