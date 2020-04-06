Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3A03919F2A8
	for <lists+linux-media@lfdr.de>; Mon,  6 Apr 2020 11:32:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726721AbgDFJcT (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 6 Apr 2020 05:32:19 -0400
Received: from mail-ot1-f66.google.com ([209.85.210.66]:36243 "EHLO
        mail-ot1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726687AbgDFJcS (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 6 Apr 2020 05:32:18 -0400
Received: by mail-ot1-f66.google.com with SMTP id l23so14623589otf.3
        for <linux-media@vger.kernel.org>; Mon, 06 Apr 2020 02:32:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=WxHqFjIQnculNgifvNK6MjxXc0Mxyv2GD32GQHnELZI=;
        b=PiFXmZCU5B/nfKqkZVwUyVsAeo8tFJz5lGJ98LPbD2bt3z5oHWNlRd58Oc/yDHW+M3
         hEvgSoB7jIb13RWYFNsaBTm/efM4I+sT+XCGRS1vTAi38zAaH8IVMZtk5yWT149oKynw
         7iaFsjvBDkacq11hNoS23Ah1+4fKFffFfSFuc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=WxHqFjIQnculNgifvNK6MjxXc0Mxyv2GD32GQHnELZI=;
        b=XCdlZTQe3Od0e0A3YhktHrT24hbO57tWtOIZJSF9xtby4xv5dhcio7/CthiEvPZ1PJ
         APpKw+QchBDvfHRR5rMUxLyWnVf2mhYrwnrj34X4+XyKXygJMX4GDSfwthJhbeyimdcw
         vOs6X3HeLPVLfWk4txh3byJGF/YcI4leSc0QE+nXJcHenH8hazfNRPQBxBqceWhbuykR
         X3jKTcpTVPp0LxvBPYHVAXzASqJsejZBl8p0BnjppALoVeZOqOYbuvZTtw2dQ1c304Qi
         2iU/Un3Aj7h6YWTigGANOeOZTsA6QYrx+7GnalMqoZp1U8xbJclChqto9dzjynyQdxfT
         q9EQ==
X-Gm-Message-State: AGi0PuYL1qRlGkSmNhn9hZkOvdIx0AKYGjykbaGHtxYG+mZbd/AVr7d7
        sivm7CjvIDmSTBlt6DNz6V6S+QIst34=
X-Google-Smtp-Source: APiQypJ6Fwk1JRiGsLUMGpM91byzKHZUbKTy/H10fXGLC3WhgT9mg0AMzxltENfntwnPbfaGglssOQ==
X-Received: by 2002:a4a:e08b:: with SMTP id w11mr16793950oos.62.1586165536475;
        Mon, 06 Apr 2020 02:32:16 -0700 (PDT)
Received: from mail-ot1-f42.google.com (mail-ot1-f42.google.com. [209.85.210.42])
        by smtp.gmail.com with ESMTPSA id z14sm4316980oia.23.2020.04.06.02.32.14
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Apr 2020 02:32:15 -0700 (PDT)
Received: by mail-ot1-f42.google.com with SMTP id v2so14617709oto.2
        for <linux-media@vger.kernel.org>; Mon, 06 Apr 2020 02:32:14 -0700 (PDT)
X-Received: by 2002:a05:6830:1aee:: with SMTP id c14mr16136373otd.141.1586165534244;
 Mon, 06 Apr 2020 02:32:14 -0700 (PDT)
MIME-Version: 1.0
References: <20200206102058.247258-1-keiichiw@chromium.org>
 <6557912.4vTCxPXJkl@os-lin-dmo> <CAD90VcZMDt=Xx0E+1h6U-8xa9EMjmhpvSqRb_GYq8BAHhnpTLw@mail.gmail.com>
 <2025004.irdbgypaU6@os-lin-dmo>
In-Reply-To: <2025004.irdbgypaU6@os-lin-dmo>
From:   Alexandre Courbot <acourbot@chromium.org>
Date:   Mon, 6 Apr 2020 18:32:01 +0900
X-Gmail-Original-Message-ID: <CAPBb6MVhVL-2EAJZ3UiN8BwjTyUXVirjF0gnfBBZjuvx07ijKA@mail.gmail.com>
Message-ID: <CAPBb6MVhVL-2EAJZ3UiN8BwjTyUXVirjF0gnfBBZjuvx07ijKA@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] virtio-video: Add virtio video device specification
To:     Dmitry Sepp <dmitry.sepp@opensynergy.com>
Cc:     Keiichi Watanabe <keiichiw@chromium.org>,
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

On Mon, Mar 30, 2020 at 6:54 PM Dmitry Sepp <dmitry.sepp@opensynergy.com> w=
rote:
>
> Hi Keiichi,
>
> On Freitag, 27. M=C3=A4rz 2020 04:35:13 CEST Keiichi Watanabe wrote:
> > Hi Dmitry,
> >
> > On Wed, Mar 25, 2020 at 6:47 PM Dmitry Sepp <dmitry.sepp@opensynergy.co=
m>
> wrote:
> > > Hi Keiichi,
> > >
> > > On Montag, 23. M=C3=A4rz 2020 16:48:14 CET Keiichi Watanabe wrote:
> > > > Hi,
> > > >
> > > > On Mon, Mar 23, 2020 at 10:28 PM Dmitry Sepp
> > > >
> > > > <dmitry.sepp@opensynergy.com> wrote:
> > > > > Hi Keiichi,
> > > > >
> > > > > On Montag, 23. M=C3=A4rz 2020 13:07:54 CET Keiichi Watanabe wrote=
:
> > > > > > Hi everyone,
> > > > > >
> > > > > > I have implemented a virtio-video device following my v3 spec i=
n
> > > > > > crosvm, which worked well together with Dmitry's driver [1]. I'=
ve
> > > > > > started preparing v4 proposal to address problems found while
> > > > > > implementing the driver and the devices.
> > > > >
> > > > > Great news!
> > > > >
> > > > > > Regarding v3 protocol, I'm thinking about how we can differenti=
ate
> > > > > > 'parameters' and 'controls' in the virtio-video spec?
> > > > > > In the previous discussion, we decided to have a profile, level=
 and
> > > > > > bitrate as controls because we want to query supported values f=
or
> > > > > > each
> > > > > > field.
> > > > > > But, I don't think it's a good criteria because it'd be possibl=
e to
> > > > > > query other values in params.
> > > > >
> > > > > Could you elaborate on this? Do you now how the design could look=
 like
> > > > > or
> > > > > it is just an idea? AFAIR during the discussion of OpenSynergy's
> > > > > original
> > > > > v1 spec your point was to separate something that we call 'contro=
ls'
> > > > > now
> > > > > to reduce the command data size and make command handling less er=
ror
> > > > > prone.
> > > >
> > > > The problem in v3 is that if we want to add a new value to be set i=
t'd
> > > > be unclear which params or controls is better to be extended.
> > > > One possible rule may be "if a value can be queried by the driver, =
it
> > > > should be a control". However, this rule doesn't explain why we hav=
e
> > > > "format" in params for example. So, I think we need a discussion an=
d
> > > > may want to rearrange the structures.
> > > >
> > > > Yeah, in the previous discussion, I suggested to have profile, leve=
l
> > > > and bitrate as control values instead of members of params. Now, I'=
m
> > > > wondering whether we can have every values as control values.
> > > > I don't think it's a perfect idea, but I haven't come up with any
> > > > better concrete design yet. So, I'd really appreciate if you could
> > > > share your thoughts.
> > >
> > > Ok, we can for example add more precise definition to input and outpu=
t.
> > > Let's say we have 'bitstream' format structure and a 'image' format
> > > structure. E.g. for decoder obviously bitstream is input and image is
> > > output.
> > >
> > > Then instead of params and controls we can define some abstract
> > > 'properties'. And make some of the properties assigned/mapped/availab=
le
> > > to bitstream and some to image, depending on the current function. I
> > > think that could make sense as for example for decoder 'bitstream'
> > > probably requires very few basic 'properties' like fourcc format, in
> > > contrast to 'image'. But for encoder 'bitstream' will also have the
> > > bitrate 'property' set.
> >
> > Ah, it sounds like a good idea to have separate structs for bitstreams
> > and images.
> > Okay, let me sort out properties based on the idea.
> >
> > # Bitstream
> > * format
> > * min/max number of buffers
> > * bitrate (encoder only)
> Also depending on format?
>
> > * profile (depending on format)
> > * level (depending on format/profile)
> >
> > # Image
> > * format
> > * min/max number of buffers
> > * width/height
> > * crop information
> > * number of planes
> > * plane format
> > * plane layout
> * frame rate?
>
> >
> > Then, we have three categories here:
> > (a) Mandatory properties for bitstreams for both functions
> > (b) Mandatory properties for images for both functions
> > (c) Optional properties for bitstream (e.g. bitrate, profile, level)
> >
> > So, how about defining structs for each (a), (b) and (c)?
> >
> > (a) and (b) can be similar to virtio_video_params in v3 spec draft:
> > e.g.
> > struct virtio_video_{bitstream, image}_info {
> >   int format;
> >   int min_buffers;
> >   int max_buffers;
> >   ...
> > }
> Yep, this could make sense. Not sure to which of the two the frame rate s=
hould
> belong. I'd guess to the image.
>
> We should also thing of a way to set this. Would we have a set/
> get_bistream_info() and set/get_image_info()? Plus one generic query/get/
> set_properties (can use a flexible array to provide several in one step).
>
> Or probably event better if properties would apply to the whole stream, n=
ot to
> bitstream or image in particular. WDYT?

Sorry for chiming in late.

Merging the controls and parameters into a single class makes sense to
me. Both controls and parameters are values that can be updated by
either the driver or the device, have a default value, and for some of
them are only relevant depending on the value of other controls (e.g.
profile depends on the active codec).

V4L2 needs to differentiate between the two because on top of codecs
it has to be able to manage other kinds of media devices. Since we are
focused on codecs, we don't have this constraint and thus can probably
keep things a bit more unified.

How about merging all the properties/controls into a single structure
which semantics would morph depending on the values of some of its
members? E.g.

struct codec_params {
    u32 frame_width;
    u32 frame_height;
    /* H264, VP8, VP9, etc */
    enum virtio_codec format;
    union {
        struct {
            enum h264_profile profile;
            enum h264_level level;
        } h264;
        struct {
            enum vp8_profile profile;
        } vp8;
        ....
    };
    u32 bitrate;
    ....
};

The idea being that depending on the value of "format", only the
relevant member of the union becomes meaningful. This ensures that the
device/driver does not need to check for every control whether it is
valid in the current context ; it just needs to check what "format" is
and take the values from the relevant members.

I don't think we even need to have a different queue for both structs
(which is what V4L2 does, but again for its own reasons). Just a
single one per coding or decoding context could be enough AFAICT.

Depending on whether we are decoding or encoding, access to some
members would be restricted to read/only for the device or driver. For
instance, when encoding the driver can set "bitrate" to the desired
encoding rate. When decoding, the decoder can report the video's
bitrate there.

Now I'm not sure what would be the best way to share this structure.
Either a memory area shared between the driver and device, with
commands/messages sent to notify that something has changed, or
sending the whole structure with each command/message.

Now the parameters I have listed above are not subject to changing a
lot, but there are also parameters that we may want to specify/be
notified on with each frame. For instance, whether we want a frame to
be forcibly encoded as a keyframe. V4L2 uses a control for this, but
we could probably do better if we can pass this information with each
frame to be encoded. Maybe we can implement that by using different
QUEUE commands for encoder and decoder, or again by using a union.

>
> Best regards,
> Dmitry.
>
> >
> > (c) would be very similar to struct virtio_video_*_control in v3.
> > Renaming them to 'properties' would be a nice idea as Dmitry said.
> >
> > While the designs of structs are not changed from 'params' and
> > 'controls', we now have rules for differentiation at least.
> > What do you think?
>
> >
> > Best regards,
> > Keiichi
> >
> > > > > On one hand if don't really see any difference in params vs contr=
ols
> > > > > it
> > > > > would for sure make sense to remove one of the two. On the other =
hand
> > > > > I'd
> > > > > of course like to avoid moving back in forth, especially when it =
comes
> > > > > to
> > > > > such a major driver rework.
> > > >
> > > > Yes, I understand that it may require a big change in the
> > > > implementation.
> > > > I'm sorry for not being able to think of this point seriously in th=
e
> > > > previous thread.
> > > >
> > > > Of course, I'd also really like to avoid rework, but I believe we
> > > > shouldn't give up defining a clean and reasonable specification.
> > > > Let's find a clear definition in this cycle to avoid future rework.
> > > >
> > > > > > So, I'm thinking about what should be the difference between pa=
rams
> > > > > > and controls. If no difference, we should deprecate
> > > > > > virtio_video_params and have every field there as a control val=
ue
> > > > > > instead.
> > > > >
> > > > > I deem we should then deprecate controls instead. Params seem to =
be
> > > > > more
> > > > > abstract. Width and height don't sound like a control for me.
> > > >
> > > > Though this is actually one of options, how can we query profiles a=
nd
> > > > levels if they are in params?
> > > > This is why we decided them as controls.
> > > >
> > > > Best regards,
> > > > Keiichi
> > > >
> > > > > > If we add a new command to get and set multiple controls at onc=
e,
> > > > > > this
> > > > > > change won't cause overhead.
> > > > >
> > > > > How would we do this? Provide a flexible array member where each =
entry
> > > > > has
> > > > > a type field first?
> > > >
> > > > Yeah, something like the idea. But, I haven't designed an actual
> > > > structure
> > > > yet.
> > > >
> > > > > What can also make sense is to potentially join set and get calls
> > > > > (probably
> > > > > provide 'get' stuff automatically within a response to 'set'). An=
yway
> > > > > set
> > > > > and get are currently used in conjunction all the time.
> > > >
> > > > It'd make sense to return new input and output params when one of
> > > > params is updated.
> > > > But, if we choose this design, we need to assume one device has jus=
t
> > > > two params; input and output.
> > > >
> > > > This is okay for video decoder and encoder, but it may become a
> > > > problem if we want to support other types of video device that has
> > > > only one direction. (e.g. video capture device)
> > > > Though we have no plan for supporting this, OpenSynergy's v1 propos=
al
> > > > contained this type IIRC.
> > >
> > > Honestly speaking, the idea is not completely abandoned. The spec and=
 the
> > > driver has more than enough functionality to handle a simple Android =
EVS
> > > camera use-case. But I think let's discuss this separately later.
> > >
> > > Best regards,
> > > Dmitry.
> > >
> > > > Best regards,
> > > > Keiichi
> > > >
> > > > > Best regards,
> > > > > Dmitry.
> > > > >
> > > > > > What do you think? Is there anything I missed?
> > > > > > If it sounds fine, I'll remove virtio_video_params from the v4 =
spec
> > > > > > proposal.
> > > > > >
> > > > > > Best regards,
> > > > > > Keiichi
> > > > > >
> > > > > > [1]: https://patchwork.linuxtv.org/patch/61717/
>
>
