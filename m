Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4C5BA2123AE
	for <lists+linux-media@lfdr.de>; Thu,  2 Jul 2020 14:51:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728917AbgGBMvM (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 2 Jul 2020 08:51:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60432 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728851AbgGBMvM (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 2 Jul 2020 08:51:12 -0400
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com [IPv6:2a00:1450:4864:20::244])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EA266C08C5C1
        for <linux-media@vger.kernel.org>; Thu,  2 Jul 2020 05:51:11 -0700 (PDT)
Received: by mail-lj1-x244.google.com with SMTP id h19so31870168ljg.13
        for <linux-media@vger.kernel.org>; Thu, 02 Jul 2020 05:51:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Om4uTrCN8xkUirJdIKXiYjpK2aPsQISXbuQouET3Xvc=;
        b=HyH4mY49Rv+NRiK2oKsq0mnRnwMrS6YMnBxZfK8wBhsyPVf5d7/QTTaBaD++MFGqxj
         0bsnEUnPgHpmVpMYvtAEEoYk7xFp2l9wv21GdcvkmHId/4lmvslnynpCp9eFnM6/Mct2
         gi1WkslmGt4nI44NxAy6z0nmIKQpPojztznJQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Om4uTrCN8xkUirJdIKXiYjpK2aPsQISXbuQouET3Xvc=;
        b=PkO2T/wn1Vjmh92lVIsm/t06QeR7cCZTGUyEUkUXa5mgi7cIUqpXA2X0j+WQmLT7bz
         HTmCU+rCGo+pNFbDLsqV9Hw8Tqc7ftXjvw4gxE7SzPM+hhC1xFgKPPGxmLhrLzNKooHu
         N7K4PQsaBMDUYxZQv3fIkHN2XnJQJIxT+2jae/Vj1NVCHblTykBlAjeeThC/DdcgvpaR
         FRFZi939/OwcT165U7pQQpqVqq5jJ7jV1s141I9Ir+gq+0vYlKRdcr1Tak8PgRk+87zg
         hnh1jrNwysx9A/Fda8A5Q/BZ5X5L+bv25LtfAZBcubzlT46mGqWbU4r+DXd4ySgzZg3h
         MzNw==
X-Gm-Message-State: AOAM5306izAab2IcBbbnKQd5SBPUXlGXZnsUtfzFVqSMOObD+G4ko8Qj
        0iIYKXakxXBDX/xrRYkv4KG9SyH8J+BOgUiUo59/HQ==
X-Google-Smtp-Source: ABdhPJxgTLd1WUSCBKeYVGZONAJF66pxbyVIxELx1CmDzpE78kNV3LllehQPuVXMJt2m/pdw3wWkx/fFkoCO42+R8+E=
X-Received: by 2002:a2e:b5a3:: with SMTP id f3mr14938775ljn.361.1593694268323;
 Thu, 02 Jul 2020 05:51:08 -0700 (PDT)
MIME-Version: 1.0
References: <20200623111325.237158-1-keiichiw@chromium.org> <2850781.lI95146Gml@os-lin-dmo>
In-Reply-To: <2850781.lI95146Gml@os-lin-dmo>
From:   Keiichi Watanabe <keiichiw@chromium.org>
Date:   Thu, 2 Jul 2020 21:50:58 +0900
Message-ID: <CAD90VcbmrismAXW0t7K6M-=a2-P+OCOw8PvBr6r8S_3LNYu=pw@mail.gmail.com>
Subject: Re: [PATCH RFC v4 0/1] Virtio Video Device Specification
To:     Dmitry Sepp <dmitry.sepp@opensynergy.com>
Cc:     virtio-dev@lists.oasis-open.org,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Alexandre Courbot <acourbot@chromium.org>,
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

On Thu, Jul 2, 2020 at 4:32 PM Dmitry Sepp <dmitry.sepp@opensynergy.com> wrote:
>
> Hi Keiichi,
>
> Thank you very much for the hard work to update the spec and to summarize all
> of the recent proposals!
>
> I want to again raise a topic that was discussed earlier and unfortunately the
> latest proposal cannot resolve the problem. I hope together with upstream
> people we'll be able to find a neat solution.
>
> Please consider the following case:
> 1. Encoder case
> 2. User app does reqbufs with DMABUF flag.
> 3. User app submits frames to encode, each frame has a different fd, might be a
> completely new buffer.
> 4. Driver receives this buffer via queue() and does this check to verify
> whether it is a known dmabuf:
> https://elixir.bootlin.com/linux/v5.7.6/source/drivers/media/common/videobuf2/
> videobuf2-core.c#L1163
> 5. When the check fails, it does cleanup.
> 6. BUG: As we got rid of the flexible resource detach/destroy calls, host side
> has no way to know the resource has a new memory region. The new sgt is never
> propagated to the host.
>
> The mentioned earlier CMD_RESOURE_REASSIGN_ENTRIES/CMD_RESOURE_REASSIGN_OBJECT
> are not included in the spec.

This shouldn't be a problem. Though we don't have a per-resource
detach command, we can _replace_ attached sg-list or virtio-object by
calling the attach command.
In your scenario, if the driver notices a new dmabuf is given at 4 and
5, the driver should send RESOURCE_ATTACH command with the new dmabuf.
Then, the old dmabuf was regarded as "detached". Please see the
"Buffer life cycle" section.

I renamed RESOURCE_REASSIGN_* commands to RESOURCE_ATTACH as it's also
used at the first time to attach a buffer.

Best regards,
Keiichi

>
> Thanks in advance.
>
> Best regards,
> Dmitry.
>
> On Dienstag, 23. Juni 2020 13:13:24 CEST Keiichi Watanabe wrote:
> >
> > This is the v4 RFC of virtio video device specification.
> > PDF versions are available at [1, 2].
> >
> > Note that this patch depends on a recent patchset "Cross-device resource
> > sharing" [3].
> >
> > Here is a list of major changes from v3:
> > * Redesingned struct definitions for each command and request based on
> >   discussions at [4].
> > * Renamed commands/structs/enums to more descriptive names.
> > * Had different structs and fields for image formats and bitstream formats.
> > * Added more detailed specification for supported video codecs.
> > * Made stream_id be allocated by the device.
> > * Had a single parameter struct per-stream instead of per-queue parameters
> > and controls.
> > * Allowed the driver to specify the number of buffers to use via
> >   "cur_{image,bitstream}_buffers".
> > * Renamed RESOURCE_CREATE command to RESOURCE_ATTACH command and allow the
> >   driver to use this command when replacing backing memories as well.
> >
> > [5] is the diff of the header file from v3. Note that it only contains
> > changes in the header. We haven't updated the driver nor device
> > implementation to focus on protocol design discussion first.
> >
> > While it may appear that many parts have been changed since the previous
> > revision, these changes are to address the issues raised in previous
> > discussions or/and to make the protocol simpler and easier to prevent
> > misuse.
> > I'd appreciate any types of feedback.
> >
> > Best regards,
> > Keiichi
> >
> > [1] (full):
> > https://drive.google.com/file/d/1DiOJZfUJ5wvFtnNFQicxt0zkp4Ob1o9C/view?usp=
> > sharing [2] (only video section):
> > https://drive.google.com/file/d/188uAkIWE0BsXETECez98y5fJKw8rslj3/view?usp=
> > sharing [3]
> > https://lists.oasis-open.org/archives/virtio-comment/202003/msg00035.html
> > [4] https://markmail.org/thread/c6h3e3zn647qli3w
> > [5]
> > https://chromium-review.googlesource.com/c/chromiumos/third_party/kernel/+/
> > 2164411
> >
> > Keiichi Watanabe (1):
> >   virtio-video: Add virtio video device specification
> >
> >  .gitignore                        |    1 +
> >  content.tex                       |    1 +
> >  images/video-buffer-lifecycle.dot |   18 +
> >  make-setup-generated.sh           |    8 +
> >  virtio-video.tex                  | 1163 +++++++++++++++++++++++++++++
> >  5 files changed, 1191 insertions(+)
> >  create mode 100644 .gitignore
> >  create mode 100644 images/video-buffer-lifecycle.dot
> >  create mode 100644 virtio-video.tex
> >
> > --
> > 2.27.0.111.gc72c7da667-goog
>
>
