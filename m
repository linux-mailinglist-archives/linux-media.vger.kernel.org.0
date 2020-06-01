Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E81E41E9EF3
	for <lists+linux-media@lfdr.de>; Mon,  1 Jun 2020 09:19:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726005AbgFAHTS (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 1 Jun 2020 03:19:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49034 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725886AbgFAHTR (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 1 Jun 2020 03:19:17 -0400
Received: from mail-ot1-x342.google.com (mail-ot1-x342.google.com [IPv6:2607:f8b0:4864:20::342])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8E718C061A0E
        for <linux-media@vger.kernel.org>; Mon,  1 Jun 2020 00:19:17 -0700 (PDT)
Received: by mail-ot1-x342.google.com with SMTP id o7so2775705oti.9
        for <linux-media@vger.kernel.org>; Mon, 01 Jun 2020 00:19:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=fCkuLnsjTNiZfCkRMfdS6q4uo3NkOFURSk/jIvqYtho=;
        b=QTUHczJTQz6MDWYuw02FKeTj6ZR8puMhcBTTKSHfVwWfkvOjezr/Q96lDH2+GFoN7o
         ySz2NXUIfuPf3fhCI3aLdSEcXeZoUnyli8Gr7kr9Phm1C+ZUl/xtQS4Z+eqLvpkQhNUo
         ED543M2yzXrH+fDmX8LPBOYM07SI1kkbLMSjs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=fCkuLnsjTNiZfCkRMfdS6q4uo3NkOFURSk/jIvqYtho=;
        b=nyKW48fl0l5sRVSOAZpgQn9Apd9ohWfj0lS13RVPajeLK/HMJ8RlFMkz6Vmfv6nYJn
         sItGrJxz3myyrD+QGRGoCxZXzDUVTFczEowgW7LF/6ZiXRF5KV21fQNujekuA1i8btiX
         9T7aEkOqZ1kpLai7lWp8mQaNsbYLX+YxT/cnXhxql+sJp26Oao/hp4iICvVmj7h6rj50
         RHrPygQHyv7wzkPGhtyX8WoxWe0TTAEMaJ8AKZelyFzULVyct0OO2N8ufUHIE6bZtqcJ
         TU4VR+E05dYBf6TnBruYbnh4UymyJ9Rwty1fh+maTQBVnPdxP0HdhHgIlMxWfpu/8eFQ
         3sIw==
X-Gm-Message-State: AOAM532419AwfXwp/mVaYf0b5h9izvtVrhK/CjVrrzIjdMwrBGeQ+VgN
        ChcLAR07a9TWZEPh8M6VeDx0oydhOTA=
X-Google-Smtp-Source: ABdhPJxgtzlgbaRNCiSDsnNN+4cyuNhtbc9xhjgxp+CYFJIZBa42z9wZ7fViuP1uG3w59FXDU/z53A==
X-Received: by 2002:a9d:6ad5:: with SMTP id m21mr4430712otq.307.1590995956043;
        Mon, 01 Jun 2020 00:19:16 -0700 (PDT)
Received: from mail-oi1-f173.google.com (mail-oi1-f173.google.com. [209.85.167.173])
        by smtp.gmail.com with ESMTPSA id 10sm2244118otq.52.2020.06.01.00.19.13
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 01 Jun 2020 00:19:14 -0700 (PDT)
Received: by mail-oi1-f173.google.com with SMTP id j189so695735oih.10
        for <linux-media@vger.kernel.org>; Mon, 01 Jun 2020 00:19:13 -0700 (PDT)
X-Received: by 2002:aca:2316:: with SMTP id e22mr13106574oie.71.1590995953018;
 Mon, 01 Jun 2020 00:19:13 -0700 (PDT)
MIME-Version: 1.0
References: <20200206102058.247258-1-keiichiw@chromium.org>
 <20200206102058.247258-2-keiichiw@chromium.org> <CAD90Vca6=AGq6aN8voNyQ7Lh69LeDZzCxebGQ+sv_mU+mqRGLA@mail.gmail.com>
 <3754945.rEp4dnK8H5@os-lin-dmo> <CAD90VcZuvDj+-fdM89w-gYH=v4vc7x=R3sn032An4-vAX6hN0A@mail.gmail.com>
In-Reply-To: <CAD90VcZuvDj+-fdM89w-gYH=v4vc7x=R3sn032An4-vAX6hN0A@mail.gmail.com>
From:   Alexandre Courbot <acourbot@chromium.org>
Date:   Mon, 1 Jun 2020 16:19:00 +0900
X-Gmail-Original-Message-ID: <CAPBb6MXPgqYskDJr=PFb5LCWh1bV2R-FWXokCoDrmN+sEow5Xg@mail.gmail.com>
Message-ID: <CAPBb6MXPgqYskDJr=PFb5LCWh1bV2R-FWXokCoDrmN+sEow5Xg@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] virtio-video: Add virtio video device specification
To:     Keiichi Watanabe <keiichiw@chromium.org>
Cc:     Dmitry Sepp <dmitry.sepp@opensynergy.com>,
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
        Kiran Pawar <kiran.pawar@opensynergy.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Fri, May 29, 2020 at 11:22 PM Keiichi Watanabe <keiichiw@chromium.org> wrote:
>
> Hi Dmitry,
>
> On Wed, May 27, 2020 at 9:12 PM Dmitry Sepp <dmitry.sepp@opensynergy.com> wrote:
> >
> > Hi Keiichi,
> >
> > On Montag, 18. Mai 2020 07:17:53 CEST Keiichi Watanabe wrote:
> > > > +struct virtio_video_stream_create {
> > > > +        struct virtio_video_cmd_hdr hdr;
> > > > +        le32 in_mem_type; /* One of VIRTIO_VIDEO_MEM_TYPE_* types */
> > > > +        le32 out_mem_type; /* One of VIRTIO_VIDEO_MEM_TYPE_* types */
> > > > +        le32 coded_format; /* One of VIRTIO_VIDEO_FORMAT_* types */
> > > > +        u8 padding[4];
> > > > +        u8 tag[64];
> > > > +};
> > > > +\end{lstlisting}
> > > > +\begin{description}
> > > > +\item[\field{in_mem_type, out_mem_type}] is a type of buffer
> > > > +  management for input /output buffers. The driver MUST set a value in
> > > > +  \field{enum virtio_video_mem_type} that the device reported a
> > > > +  corresponding feature bit.
> > > > +\begin{description}
> > > > +\item[\field{VIRTIO_VIDEO_MEM_TYPE_GUEST_PAGES}] Use guest pages.
> > > > +\end{description}
> > > > +\item[\field{coded_format}] is the encoded format that will be
> > > > +  processed.
> > > > +\item[\field{tag}] is the name associated with this stream. The tag
> > > > +  MUST be encoded in UTF-8 and NUL-terminated.
> > >
> > > I wonder why we need this "tag" field. I have kept this field from
> > > Dmitry's first proposal, where this was called "char debug_name[64]".
> > > However, on second thought, I have no idea what is the necessity to
> > > have this field. Our VMM implementation in ChromeOS simply ignores
> > > this field.
> > > If OpenSynergy's implementation relies on this field, I'm curious
> > > about the usage. We might want to have an enum value instead of this
> > > field where arbitrary values can be stored.
> > >
> >
> > The use of this field is not so clear because it was renamed. In fact, one can
> > have an idea how it is used by simply looking at the driver code: the field is
> > useful to know about the guest client app that uses the context. If someone
> > wants to store arbitrary values, they have 64 bytes to do so with this so-
> > called tag.
>
> Hmm, though I understand this can be useful for you, I don't think we
> should support it in the standard.
> For the first example, I feel something is not abstracted well if you
> want to send some information from a user app to the host device. User
> applications shouldn't have a way to send messages to hardware
> directly.

I am also a bit uncomfortable with having fields whose usage is not
clearly defined in the kernel. How would user-space specify the value
it wants to set there?

> For the second example, who is "someone"? Driver or device? In any
> case, I don't think it's the right way. They should extend existing
> structs or add commands or feature flags, I think. Also, if arbitrary
> values are allowed, the field won't be used correctly except in cases
> where both driver implementation and device implementation are
> available. This is against what the spec should be: virtio protocol
> must work independently from the implementations.
> Of course, it's obviously okay to have it as a downstream extension in
> your product's local repository.
>
> >
> > > > +\end{description}
> > > > +
> > > > +The driver MUST set \field{stream_id} in \field{virtio_video_cmd_hdr}
> > > > +to an integer that is not used before. If a used value is passed as
> > > > +\field{stream_id}, the device MUST reports an error with
> > > > +VIRTIO_VIDEO_RESP_ERR_INVALID_STREAM_ID.
> > >
> > > I'm wondering if we can't generate stream_id in the host side so that
> > > we will have less error control code. In the current design, both the
> > > device and the driver have error checks; the device must check that a
> > > given ID is available and the driver must check if the device didn't
> > > return the INVALID_STREAM_ID error. Instead, by generating IDs in the
> > > device, we will be free from this type of failure. Same for
> > > resource_id in RESOURCE_CREATE.
> > >
> > > I guess this design originally came from the virtio-gpu protocol.
> > > However, I couldn't find a benefit of adopting the same design here.
> > >
> >
> > Honestly I don't see too much difference: device still needs to check whether
> > the id provided by the driver within some particular command is correct. If it
> > is not, it will return an error. The driver needs to check (or skip checking)
> > for an error either way as long as it is possible for the driver code to send
> > a wrong number.
>
> I'm talking about creation commands only. So, other commands won't be affected.
>
> Let me try to explain my idea in a different way. The relationship
> between the driver and the device can be seen as a client-server
> model.
> The client (driver) sends a request and the server (device) sends a
> response by processing or generating some data.
> Thus, I feel it's more natural that new data, including IDs, are
> generated and provided by the device.

This also results in one less check on the device side: when creating
a stream it just needs to pick the first available ID, instead of
checking whether the client provided something valid. This also
removes the burden of managing stream IDs from the driver, since the
device is entirely in charge of it (something it would have to do
anyway in both cases since it would still need to check that the
client-provided ID is valid).
