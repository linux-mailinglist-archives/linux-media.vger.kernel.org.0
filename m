Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4418B2133C0
	for <lists+linux-media@lfdr.de>; Fri,  3 Jul 2020 07:53:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726074AbgGCFxj (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 3 Jul 2020 01:53:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48636 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726063AbgGCFxi (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 3 Jul 2020 01:53:38 -0400
Received: from mail-ot1-x342.google.com (mail-ot1-x342.google.com [IPv6:2607:f8b0:4864:20::342])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 79E3EC08C5C1
        for <linux-media@vger.kernel.org>; Thu,  2 Jul 2020 22:53:38 -0700 (PDT)
Received: by mail-ot1-x342.google.com with SMTP id 95so15268161otw.10
        for <linux-media@vger.kernel.org>; Thu, 02 Jul 2020 22:53:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=YHaRbdolqkz8jcWhwgVqLvvhyIEi7Wo2td1s1ya5wVA=;
        b=LSccDe/hO6HaOT7AeFBQkqj7VeHBevWDCM32VW6vhczFKuf4eABwtOO8sc+Qc5Gj9t
         slXcACPE/EE7ME+hdmWXM0VPk/mPVhhEzMC4jZG/EL70YY3rvPvUaoL4IUUCKfychOJB
         0muHZfaVRucQ/0/HFg7ZdnVLa9NmNr/OdWrtU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=YHaRbdolqkz8jcWhwgVqLvvhyIEi7Wo2td1s1ya5wVA=;
        b=Q4xl0JBLUxSmBynmkQhdoJrItZQhBnTgZr+hTn29dg58thZWjPaqaD8KGiMTe5Z4Ee
         jzSpx8Aj/+gETw/lJjo8gumyMI+hIGpx/CSqrXWGk7zzoDl8yGVisPaCpH1nSO/zlHs4
         3TqhtEFj/kdw6qRSvDteJdG+ah6ceScCNfDyCHCNZ1q9E5biYQfC39nUvfxqXvMyUhRi
         Gc4EMkwbVnqAWsHxPOr9t64efQsHmKLoDzBcHEusJoKMH3N6IeT1v8lcmKzh2ufWn0v2
         LGrsw3VIzVVKic3bAeqL7WY6CBzjmqb8UEBqsF62Mc8+jzCfmq8SpvHsd69wOy+dfK7s
         ROpA==
X-Gm-Message-State: AOAM531DIvUbOI//N4pEBJtDjSvBquRG1cStLKpR32tW0RmIhVkrrTA3
        H+Bs9hCuyJ2V4wuclzH/4GI3GG3snyc=
X-Google-Smtp-Source: ABdhPJzauyUBs0N3iYsy4KjPJXlOvMDPDPSpf0R/Nnpgb1EN5sPWGgDbA/Wtg3lymx4SszCU6+uLIg==
X-Received: by 2002:a05:6830:1543:: with SMTP id l3mr23115454otp.84.1593755613337;
        Thu, 02 Jul 2020 22:53:33 -0700 (PDT)
Received: from mail-oi1-f170.google.com (mail-oi1-f170.google.com. [209.85.167.170])
        by smtp.gmail.com with ESMTPSA id p73sm3367992oop.36.2020.07.02.22.53.32
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 02 Jul 2020 22:53:33 -0700 (PDT)
Received: by mail-oi1-f170.google.com with SMTP id k22so14292811oib.0
        for <linux-media@vger.kernel.org>; Thu, 02 Jul 2020 22:53:32 -0700 (PDT)
X-Received: by 2002:aca:7243:: with SMTP id p64mr16148813oic.94.1593755127258;
 Thu, 02 Jul 2020 22:45:27 -0700 (PDT)
MIME-Version: 1.0
References: <20200623111325.237158-1-keiichiw@chromium.org>
 <2850781.lI95146Gml@os-lin-dmo> <CAD90VcbmrismAXW0t7K6M-=a2-P+OCOw8PvBr6r8S_3LNYu=pw@mail.gmail.com>
 <3163123.i8GTTo9gJ5@os-lin-dmo>
In-Reply-To: <3163123.i8GTTo9gJ5@os-lin-dmo>
From:   Alexandre Courbot <acourbot@chromium.org>
Date:   Fri, 3 Jul 2020 14:45:15 +0900
X-Gmail-Original-Message-ID: <CAPBb6MWqYHidfaaTKq43yDtjOmKEi=AMC3O9vLdWpPBd_vFrUA@mail.gmail.com>
Message-ID: <CAPBb6MWqYHidfaaTKq43yDtjOmKEi=AMC3O9vLdWpPBd_vFrUA@mail.gmail.com>
Subject: Re: [PATCH RFC v4 0/1] Virtio Video Device Specification
To:     Dmitry Sepp <dmitry.sepp@opensynergy.com>
Cc:     Keiichi Watanabe <keiichiw@chromium.org>,
        virtio-dev@lists.oasis-open.org,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Alex Lau <alexlau@chromium.org>,
        Daniel Vetter <daniel@ffwll.ch>,
        Dylan Reid <dgreid@chromium.org>,
        David Staessens <dstaessens@chromium.org>,
        Enrico Granata <egranata@google.com>,
        Frediano Ziglio <fziglio@redhat.com>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Gerd Hoffmann <kraxel@redhat.com>,
        =?UTF-8?Q?St=C3=A9phane_Marchesin?= <marcheu@chromium.org>,
        Pawel Osciak <posciak@chromium.org>,
        spice-devel@lists.freedesktop.org,
        David Stevens <stevensd@chromium.org>,
        Tomasz Figa <tfiga@chromium.org>, uril@redhat.com,
        Samiullah Khawaja <samiullah.khawaja@opensynergy.com>,
        Kiran Pawar <kiran.pawar@opensynergy.com>,
        Saket Sinha <saket.sinha89@gmail.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Nicolas Dufresne <nicolas@ndufresne.ca>,
        "Michael S. Tsirkin" <mst@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Dmitry,

On Thu, Jul 2, 2020 at 10:47 PM Dmitry Sepp <dmitry.sepp@opensynergy.com> wrote:
>
> Hi Keiichi,
>
> Thanks for the clarification. I believe we should explicitly describe this in
> the VIRTIO_VIDEO_CMD_RESOURCE_ATTACH section. And I also still see a problem
> there. If it is a guest allocated resource, we cannot consider it to be free
> until the device really releases it. And it won't happen until we issue the
> next ATTACH call. Also, as we discussed before, it might be not possible to
> free individual buffers, but the whole queue only.

In the case of the encoder, a V4L2 driver is not supposed to let
user-space dequeue an input frame while it is used as reference for
the encoding process. So if we add a similar rule in the virtio-video
specification, I suppose this would solve the problem?

For the decoder case, we have a bigger problem though. Since DMABUFs
can be arbitrarily attached to any V4L2 buffer ID, we may end up
re-queueing the DMABUF of a decoded frame that is still used as
reference under a different V4L2 buffer ID. In this case I don't think
the driver has a way to know that the memory resource should not be
overwritten, and it will thus happily use it as a decode target. The
easiest fix is probably to update the V4L2 stateful specification to
require that reused DMABUFs must always be assigned to the same V4L2
buffer ID, and must be kept alive as long as decoding is in progress,
or until a resolution change event is received. We can then apply a
similar rule to the virtio device.

>
> Best regards,
> Dmitry.
>
> On Donnerstag, 2. Juli 2020 14:50:58 CEST Keiichi Watanabe wrote:
> > Hi Dmitry,
> >
> > On Thu, Jul 2, 2020 at 4:32 PM Dmitry Sepp <dmitry.sepp@opensynergy.com>
> wrote:
> > > Hi Keiichi,
> > >
> > > Thank you very much for the hard work to update the spec and to summarize
> > > all of the recent proposals!
> > >
> > > I want to again raise a topic that was discussed earlier and unfortunately
> > > the latest proposal cannot resolve the problem. I hope together with
> > > upstream people we'll be able to find a neat solution.
> > >
> > > Please consider the following case:
> > > 1. Encoder case
> > > 2. User app does reqbufs with DMABUF flag.
> > > 3. User app submits frames to encode, each frame has a different fd, might
> > > be a completely new buffer.
> > > 4. Driver receives this buffer via queue() and does this check to verify
> > > whether it is a known dmabuf:
> > > https://elixir.bootlin.com/linux/v5.7.6/source/drivers/media/common/videob
> > > uf2/ videobuf2-core.c#L1163
> > > 5. When the check fails, it does cleanup.
> > > 6. BUG: As we got rid of the flexible resource detach/destroy calls, host
> > > side has no way to know the resource has a new memory region. The new sgt
> > > is never propagated to the host.
> > >
> > > The mentioned earlier
> > > CMD_RESOURE_REASSIGN_ENTRIES/CMD_RESOURE_REASSIGN_OBJECT are not included
> > > in the spec.
> >
> > This shouldn't be a problem. Though we don't have a per-resource
> > detach command, we can _replace_ attached sg-list or virtio-object by
> > calling the attach command.
> > In your scenario, if the driver notices a new dmabuf is given at 4 and
> > 5, the driver should send RESOURCE_ATTACH command with the new dmabuf.
> > Then, the old dmabuf was regarded as "detached". Please see the
> > "Buffer life cycle" section.
> >
> > I renamed RESOURCE_REASSIGN_* commands to RESOURCE_ATTACH as it's also
> > used at the first time to attach a buffer.
> >
> > Best regards,
> > Keiichi
> >
> > > Thanks in advance.
> > >
> > > Best regards,
> > > Dmitry.
> > >
> > > On Dienstag, 23. Juni 2020 13:13:24 CEST Keiichi Watanabe wrote:
> > > > This is the v4 RFC of virtio video device specification.
> > > > PDF versions are available at [1, 2].
> > > >
> > > > Note that this patch depends on a recent patchset "Cross-device resource
> > > > sharing" [3].
> > > >
> > > > Here is a list of major changes from v3:
> > > > * Redesingned struct definitions for each command and request based on
> > > >
> > > >   discussions at [4].
> > > >
> > > > * Renamed commands/structs/enums to more descriptive names.
> > > > * Had different structs and fields for image formats and bitstream
> > > > formats.
> > > > * Added more detailed specification for supported video codecs.
> > > > * Made stream_id be allocated by the device.
> > > > * Had a single parameter struct per-stream instead of per-queue
> > > > parameters
> > > > and controls.
> > > > * Allowed the driver to specify the number of buffers to use via
> > > >
> > > >   "cur_{image,bitstream}_buffers".
> > > >
> > > > * Renamed RESOURCE_CREATE command to RESOURCE_ATTACH command and allow
> > > > the
> > > >
> > > >   driver to use this command when replacing backing memories as well.
> > > >
> > > > [5] is the diff of the header file from v3. Note that it only contains
> > > > changes in the header. We haven't updated the driver nor device
> > > > implementation to focus on protocol design discussion first.
> > > >
> > > > While it may appear that many parts have been changed since the previous
> > > > revision, these changes are to address the issues raised in previous
> > > > discussions or/and to make the protocol simpler and easier to prevent
> > > > misuse.
> > > > I'd appreciate any types of feedback.
> > > >
> > > > Best regards,
> > > > Keiichi
> > > >
> > > > [1] (full):
> > > > https://drive.google.com/file/d/1DiOJZfUJ5wvFtnNFQicxt0zkp4Ob1o9C/view?u
> > > > sp=
> > > > sharing [2] (only video section):
> > > > https://drive.google.com/file/d/188uAkIWE0BsXETECez98y5fJKw8rslj3/view?u
> > > > sp=
> > > > sharing [3]
> > > > https://lists.oasis-open.org/archives/virtio-comment/202003/msg00035.htm
> > > > l
> > > > [4] https://markmail.org/thread/c6h3e3zn647qli3w
> > > > [5]
> > > > https://chromium-review.googlesource.com/c/chromiumos/third_party/kernel
> > > > /+/
> > > > 2164411
> > > >
> > > > Keiichi Watanabe (1):
> > > >   virtio-video: Add virtio video device specification
> > > >
> > > >  .gitignore                        |    1 +
> > > >  content.tex                       |    1 +
> > > >  images/video-buffer-lifecycle.dot |   18 +
> > > >  make-setup-generated.sh           |    8 +
> > > >  virtio-video.tex                  | 1163 +++++++++++++++++++++++++++++
> > > >  5 files changed, 1191 insertions(+)
> > > >  create mode 100644 .gitignore
> > > >  create mode 100644 images/video-buffer-lifecycle.dot
> > > >  create mode 100644 virtio-video.tex
> > > >
> > > > --
> > > > 2.27.0.111.gc72c7da667-goog
>
>
