Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D01A61039A1
	for <lists+linux-media@lfdr.de>; Wed, 20 Nov 2019 13:11:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729274AbfKTML2 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 20 Nov 2019 07:11:28 -0500
Received: from mail-ed1-f51.google.com ([209.85.208.51]:43284 "EHLO
        mail-ed1-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727975AbfKTML2 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 20 Nov 2019 07:11:28 -0500
Received: by mail-ed1-f51.google.com with SMTP id w6so20041568edx.10
        for <linux-media@vger.kernel.org>; Wed, 20 Nov 2019 04:11:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=GJbs7n+zbw4hCGFWh3KaaayfoAgFwo37GAAN1vh7zzY=;
        b=YZcP4atgYjSzIfOqrZjvHul/q9RDnRbhtxo/pWadKnmoSONh9KRg4NqnYnwBhiHuaJ
         YP/KHX7xe5/MnrJWF9bp6hEZOQhnRIkDMrs7z7mXmkM2Xue+TrBSRD+8PbB3w7wN4Rxi
         QfEu2ZEwh+A02vUs6VeBP2NoVs6omlpzekwdk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=GJbs7n+zbw4hCGFWh3KaaayfoAgFwo37GAAN1vh7zzY=;
        b=dkfpbVFFKyDo8OejOIdn1ZHrj5KT4UZwDUKF4BE+alq96NEGicHJfFizpiFaMQoXCy
         nC8yqlP4X5HKVyS/Su5Mxiam91qIcWJIqaTxrhla4IAYOh7tqe196V13keh5aYECOWeu
         t4of6VV6mRFbVHHdU5730z6OIPUPPvVizwYXw2YViXdafqjtpPE9I+06JXJ9yG128CrI
         DUOyLYaKbCrnLiWeRi1ehVwf+hy6/XDhH4gaV14viyBegg4Vdu+09n1bU3x3IiH/42sn
         GCaxjNHdMsVhG0JG4JvqPNZ/9k3/mmO22OKxdjrzPGIvnMeAXUR5Kk1Fk165cn+WOVhS
         ExSQ==
X-Gm-Message-State: APjAAAVH8GsOWr6tmx1O34aWh6kmKpygdK9RPZaa8j/oP5qOGORTBXQm
        JNmCxSCkkdhYVYrz8cyPH7iFythcSWDKLg==
X-Google-Smtp-Source: APXvYqw8FNNdTU3Ls8mY4xuG4SOOe/zbKXPGAINcaSSxyCAP+0simTf4gQx+7YmZYmLdBYEXHDiPgQ==
X-Received: by 2002:a17:907:4300:: with SMTP id oa24mr5045393ejb.8.1574251886108;
        Wed, 20 Nov 2019 04:11:26 -0800 (PST)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com. [209.85.128.41])
        by smtp.gmail.com with ESMTPSA id j52sm8010eda.89.2019.11.20.04.11.24
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 20 Nov 2019 04:11:25 -0800 (PST)
Received: by mail-wm1-f41.google.com with SMTP id t26so1027091wmi.0
        for <linux-media@vger.kernel.org>; Wed, 20 Nov 2019 04:11:24 -0800 (PST)
X-Received: by 2002:a1c:7fd8:: with SMTP id a207mr2863103wmd.10.1574251884421;
 Wed, 20 Nov 2019 04:11:24 -0800 (PST)
MIME-Version: 1.0
References: <20191105105456.7xbhtistnbp272lj@sirius.home.kraxel.org>
 <20191106084344.GB189998@stefanha-x1.localdomain> <20191106095122.jju7eo57scfoat6a@sirius.home.kraxel.org>
In-Reply-To: <20191106095122.jju7eo57scfoat6a@sirius.home.kraxel.org>
From:   Tomasz Figa <tfiga@chromium.org>
Date:   Wed, 20 Nov 2019 21:11:12 +0900
X-Gmail-Original-Message-ID: <CAAFQd5BVXv7SU2JWf_pa__tWydd6UqNpMo6aQHLDjjU+Vch75A@mail.gmail.com>
Message-ID: <CAAFQd5BVXv7SU2JWf_pa__tWydd6UqNpMo6aQHLDjjU+Vch75A@mail.gmail.com>
Subject: Re: guest / host buffer sharing ...
To:     Gerd Hoffmann <kraxel@redhat.com>
Cc:     Stefan Hajnoczi <stefanha@gmail.com>, geoff@hostfission.com,
        virtio-dev@lists.oasis-open.org, Alex Lau <alexlau@chromium.org>,
        Daniel Vetter <daniel@ffwll.ch>,
        Alexandre Courbot <acourbot@chromium.org>,
        qemu-devel <qemu-devel@nongnu.org>,
        Keiichi Watanabe <keiichiw@chromium.org>,
        David Stevens <stevensd@chromium.org>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        =?UTF-8?Q?St=C3=A9phane_Marchesin?= <marcheu@chromium.org>,
        Dylan Reid <dgreid@chromium.org>,
        Gurchetan Singh <gurchetansingh@chromium.org>,
        Dmitry Morozov <dmitry.morozov@opensynergy.com>,
        Pawel Osciak <posciak@chromium.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, Nov 6, 2019 at 6:51 PM Gerd Hoffmann <kraxel@redhat.com> wrote:
>
>   Hi,
>
> > > Reason is:  Meanwhile I'm wondering whenever "just use virtio-gpu
> > > resources" is really a good answer for all the different use cases
> > > we have collected over time.  Maybe it is better to have a dedicated
> > > buffer sharing virtio device?  Here is the rough idea:
> >
> > My concern is that buffer sharing isn't a "device".  It's a primitive
> > used in building other devices.  When someone asks for just buffer
> > sharing it's often because they do not intend to upstream a
> > specification for their device.
>
> Well, "vsock" isn't a classic device (aka nic/storage/gpu/...) either.
> It is more a service to allow communication between host and guest
>
> That buffer sharing device falls into the same category.  Maybe it even
> makes sense to build that as virtio-vsock extension.  Not sure how well
> that would work with the multi-transport architecture of vsock though.
>
> > If this buffer sharing device's main purpose is for building proprietary
> > devices without contributing to VIRTIO, then I don't think it makes
> > sense for the VIRTIO community to assist in its development.
>
> One possible use case would be building a wayland proxy, using vsock for
> the wayland protocol messages and virtio-buffers for the shared buffers
> (wayland client window content).
>
> It could also simplify buffer sharing between devices (feed decoded
> video frames from decoder to gpu), although in that case it is less
> clear that it'll actually simplify things because virtio-gpu is
> involved anyway.
>
> We can't prevent people from using that for proprietary stuff (same goes
> for vsock).
>
> There is the option to use virtio-gpu instead, i.e. add support to qemu
> to export dma-buf handles for virtio-gpu resources to other processes
> (such as a wayland proxy).  That would provide very similar
> functionality (and thereby create the same loophole).
>
> > VIRTIO recently gained a shared memory resource concept for access to
> > host memory.  It is being used in virtio-pmem and virtio-fs (and
> > virtio-gpu?).
>
> virtio-gpu is in progress still unfortunately (all kinds of fixes for
> the qemu drm drivers and virtio-gpu guest driver refactoring kept me
> busy for quite a while ...).
>
> > If another flavor of shared memory is required it can be
> > added to the spec and new VIRTIO device types can use it.  But it's not
> > clear why this should be its own device.
>
> This is not about host memory, buffers are in guest ram, everything else
> would make sharing those buffers between drivers inside the guest (as
> dma-buf) quite difficult.

I wonder if we're not forgetting about the main reason we ended up
with all this chaos - the host-allocated buffers. ;)

Do we really have an issue with sharing guest memory between different
virtio devices? Each of those devices could just accept a scatterlist
of guest pages and import that memory to whatever host component it's
backed by.

The case that really needs some support from VIRTIO is when the
buffers are allocated in the host. Sharing buffers from virtio-gpu
with a virtio video decoder or Wayland (be it a dedicated virtio
device or vsock) are some of the examples.

Best regards,
Tomasz
