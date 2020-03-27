Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4FA64194FB5
	for <lists+linux-media@lfdr.de>; Fri, 27 Mar 2020 04:35:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727611AbgC0Df3 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 26 Mar 2020 23:35:29 -0400
Received: from mail-lj1-f193.google.com ([209.85.208.193]:34130 "EHLO
        mail-lj1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726496AbgC0Df2 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 26 Mar 2020 23:35:28 -0400
Received: by mail-lj1-f193.google.com with SMTP id p10so8543341ljn.1
        for <linux-media@vger.kernel.org>; Thu, 26 Mar 2020 20:35:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=XeKEAn+hfGPdPoufqsnHb2SpBKodsES2luZcQ7Ela5Q=;
        b=CSR5bJDBXMcoSEbB5Nd3zgKhlO79Icw0k7BnNPNgE2X3XmM1u5brug+nIpe3TRrBOF
         jRUFpO5GwXhRXzorRWkSuJBpTlh8HF1y+9oMW9vTWKyeHGW29CEX027LEwybcle+gz7h
         Q487S1K2luqmNMlKkOrrbCMm1TqjPAqPHfUUI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=XeKEAn+hfGPdPoufqsnHb2SpBKodsES2luZcQ7Ela5Q=;
        b=DYMduyagGzASrHafaAdSv3H7kusmyyrkC4QhEHOD3yygQxlBoLU5kYxSH5FvOdqjrw
         2PAG8TPQErxOuCaIE/nFMLeEMV+u6pGnP3gkUD9AjiddrBhsezS5Ez5+vlmq5AL52Gtr
         CjnwFWW2DezqJARsin735ql43FR2Y022+K9EIi/MrWlyG1UXhmFjFfU6g6K60inxUZyp
         HdwZaFTSbYzSMyQRvvendjwcCElI3vw1tw8xG5rvvWYn16PhX3CfU9fuX5nzJjkJAnuA
         6OBKUjOvEO4U2wV2a6qplqGbtdYvwdOumVGoZgtFr34I1/XjyMjF65nWglY/4+/2pJu0
         n5fQ==
X-Gm-Message-State: AGi0PuYDpbP3PZLOHE17ck/5RucVAgqn2gY5iJ3c6urwNab5bIIr1Y9q
        YjlkUrP1++AIkEaNav7PRcliwFUj6Sxy1hDVuScKew==
X-Google-Smtp-Source: ADFU+vtjulxSFTo36CtAnIJ5vsca80/mJlumHbCNSz5io67ukcq/GXdbEhAvsymt/X08b3XnJVezylK5cLVVj08J43s=
X-Received: by 2002:a2e:95c3:: with SMTP id y3mr7108877ljh.149.1585280124808;
 Thu, 26 Mar 2020 20:35:24 -0700 (PDT)
MIME-Version: 1.0
References: <20200206102058.247258-1-keiichiw@chromium.org>
 <8121654.T7Z3S40VBb@os-lin-dmo> <CAD90VcZ2zzzwveYgDs5UdjfZUt=yX4wNX-f_-3V18xz93_fpvQ@mail.gmail.com>
 <6557912.4vTCxPXJkl@os-lin-dmo>
In-Reply-To: <6557912.4vTCxPXJkl@os-lin-dmo>
From:   Keiichi Watanabe <keiichiw@chromium.org>
Date:   Fri, 27 Mar 2020 12:35:13 +0900
Message-ID: <CAD90VcZMDt=Xx0E+1h6U-8xa9EMjmhpvSqRb_GYq8BAHhnpTLw@mail.gmail.com>
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

Hi Dmitry,

On Wed, Mar 25, 2020 at 6:47 PM Dmitry Sepp <dmitry.sepp@opensynergy.com> w=
rote:
>
> Hi Keiichi,
>
> On Montag, 23. M=C3=A4rz 2020 16:48:14 CET Keiichi Watanabe wrote:
> > Hi,
> >
> > On Mon, Mar 23, 2020 at 10:28 PM Dmitry Sepp
> >
> > <dmitry.sepp@opensynergy.com> wrote:
> > > Hi Keiichi,
> > >
> > > On Montag, 23. M=C3=A4rz 2020 13:07:54 CET Keiichi Watanabe wrote:
> > > > Hi everyone,
> > > >
> > > > I have implemented a virtio-video device following my v3 spec in
> > > > crosvm, which worked well together with Dmitry's driver [1]. I've
> > > > started preparing v4 proposal to address problems found while
> > > > implementing the driver and the devices.
> > >
> > > Great news!
> > >
> > > > Regarding v3 protocol, I'm thinking about how we can differentiate
> > > > 'parameters' and 'controls' in the virtio-video spec?
> > > > In the previous discussion, we decided to have a profile, level and
> > > > bitrate as controls because we want to query supported values for e=
ach
> > > > field.
> > > > But, I don't think it's a good criteria because it'd be possible to
> > > > query other values in params.
> > >
> > > Could you elaborate on this? Do you now how the design could look lik=
e or
> > > it is just an idea? AFAIR during the discussion of OpenSynergy's orig=
inal
> > > v1 spec your point was to separate something that we call 'controls' =
now
> > > to reduce the command data size and make command handling less error
> > > prone.
> >
> > The problem in v3 is that if we want to add a new value to be set it'd
> > be unclear which params or controls is better to be extended.
> > One possible rule may be "if a value can be queried by the driver, it
> > should be a control". However, this rule doesn't explain why we have
> > "format" in params for example. So, I think we need a discussion and
> > may want to rearrange the structures.
> >
> > Yeah, in the previous discussion, I suggested to have profile, level
> > and bitrate as control values instead of members of params. Now, I'm
> > wondering whether we can have every values as control values.
> > I don't think it's a perfect idea, but I haven't come up with any
> > better concrete design yet. So, I'd really appreciate if you could
> > share your thoughts.
> >
>
> Ok, we can for example add more precise definition to input and output. L=
et's
> say we have 'bitstream' format structure and a 'image' format structure. =
E.g.
> for decoder obviously bitstream is input and image is output.
>
> Then instead of params and controls we can define some abstract 'properti=
es'.
> And make some of the properties assigned/mapped/available to bitstream an=
d
> some to image, depending on the current function. I think that could make
> sense as for example for decoder 'bitstream' probably requires very few b=
asic
> 'properties' like fourcc format, in contrast to 'image'. But for encoder
> 'bitstream' will also have the bitrate 'property' set.

Ah, it sounds like a good idea to have separate structs for bitstreams
and images.
Okay, let me sort out properties based on the idea.

# Bitstream
* format
* min/max number of buffers
* bitrate (encoder only)
* profile (depending on format)
* level (depending on format/profile)

# Image
* format
* min/max number of buffers
* width/height
* crop information
* number of planes
* plane format
* plane layout

Then, we have three categories here:
(a) Mandatory properties for bitstreams for both functions
(b) Mandatory properties for images for both functions
(c) Optional properties for bitstream (e.g. bitrate, profile, level)

So, how about defining structs for each (a), (b) and (c)?

(a) and (b) can be similar to virtio_video_params in v3 spec draft:
e.g.
struct virtio_video_{bitstream, image}_info {
  int format;
  int min_buffers;
  int max_buffers;
  ...
}

(c) would be very similar to struct virtio_video_*_control in v3.
Renaming them to 'properties' would be a nice idea as Dmitry said.

While the designs of structs are not changed from 'params' and
'controls', we now have rules for differentiation at least.
What do you think?

Best regards,
Keiichi



>
> > > On one hand if don't really see any difference in params vs controls =
it
> > > would for sure make sense to remove one of the two. On the other hand=
 I'd
> > > of course like to avoid moving back in forth, especially when it come=
s to
> > > such a major driver rework.
> >
> > Yes, I understand that it may require a big change in the implementatio=
n.
> > I'm sorry for not being able to think of this point seriously in the
> > previous thread.
> >
> > Of course, I'd also really like to avoid rework, but I believe we
> > shouldn't give up defining a clean and reasonable specification.
> > Let's find a clear definition in this cycle to avoid future rework.
> >
> > > > So, I'm thinking about what should be the difference between params
> > > > and controls. If no difference, we should deprecate
> > > > virtio_video_params and have every field there as a control value
> > > > instead.
> > >
> > > I deem we should then deprecate controls instead. Params seem to be m=
ore
> > > abstract. Width and height don't sound like a control for me.
> >
> > Though this is actually one of options, how can we query profiles and
> > levels if they are in params?
> > This is why we decided them as controls.
> >
> > Best regards,
> > Keiichi
> >
> > > > If we add a new command to get and set multiple controls at once, t=
his
> > > > change won't cause overhead.
> > >
> > > How would we do this? Provide a flexible array member where each entr=
y has
> > > a type field first?
> >
> > Yeah, something like the idea. But, I haven't designed an actual struct=
ure
> > yet.
> > > What can also make sense is to potentially join set and get calls
> > > (probably
> > > provide 'get' stuff automatically within a response to 'set'). Anyway=
 set
> > > and get are currently used in conjunction all the time.
> >
> > It'd make sense to return new input and output params when one of
> > params is updated.
> > But, if we choose this design, we need to assume one device has just
> > two params; input and output.
> >
> > This is okay for video decoder and encoder, but it may become a
> > problem if we want to support other types of video device that has
> > only one direction. (e.g. video capture device)
> > Though we have no plan for supporting this, OpenSynergy's v1 proposal
> > contained this type IIRC.
>
> Honestly speaking, the idea is not completely abandoned. The spec and the
> driver has more than enough functionality to handle a simple Android EVS
> camera use-case. But I think let's discuss this separately later.
>
> Best regards,
> Dmitry.
>
> >
> > Best regards,
> > Keiichi
> >
> > > Best regards,
> > > Dmitry.
> > >
> > > > What do you think? Is there anything I missed?
> > > > If it sounds fine, I'll remove virtio_video_params from the v4 spec
> > > > proposal.
> > > >
> > > > Best regards,
> > > > Keiichi
> > > >
> > > > [1]: https://patchwork.linuxtv.org/patch/61717/
>
>
