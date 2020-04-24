Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D5AB51B7364
	for <lists+linux-media@lfdr.de>; Fri, 24 Apr 2020 13:42:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726707AbgDXLmq (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 24 Apr 2020 07:42:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44610 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726770AbgDXLmq (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 24 Apr 2020 07:42:46 -0400
Received: from mail-lf1-x144.google.com (mail-lf1-x144.google.com [IPv6:2a00:1450:4864:20::144])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A41B5C09B045
        for <linux-media@vger.kernel.org>; Fri, 24 Apr 2020 04:42:45 -0700 (PDT)
Received: by mail-lf1-x144.google.com with SMTP id t11so7411467lfe.4
        for <linux-media@vger.kernel.org>; Fri, 24 Apr 2020 04:42:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=okNvWvsF8Yas195ZvYryaMdJu69u+fzs0lThCNkB1y4=;
        b=AsyoIEY/13X3CEdktGrgCl9/XAk9lpB7Mdkl3+d8YbymnCquPnMHgRVQmZyj5K3jhF
         QhG+Q0H00qZ0wl7NFnJk/zUvWrFAxoT3tiLUT4KhDs8eoP7n3FfzX3Cpx2S2IWs4ik5u
         zMLq9Nw+xIFPID1DVx5xIkQhMYdIRsbU3635A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=okNvWvsF8Yas195ZvYryaMdJu69u+fzs0lThCNkB1y4=;
        b=E2EK72ciURynBvFjQVwiNSYPJtySlv35woW0yijtQfcmNI4bhXyD7XZQT/L2QEIRsh
         E/fOYj5BfaMbKFcJIeSSh36G8kWgAzgslGxZVmTBW5PanK5btYtNg0zbSzsmUcQXOtEW
         IaaY6+a7EHPEKMV881lkB6X1wWJs/tR8zLBUQagnJGA4Y4oxHnm/a0Pd9qyTlkVOXC76
         pqXBtyqYVjB005k98dCOZutfZwkopi4gMH0kZvHQlsiEzOcJGXfGcv/yqr8RBa1zORPx
         xUy+EETzbf6r269dhNuplFejWCge1zsUJUw4uI3PXDXICkcVP/c1+cmxZ3KlLpbKkA+4
         tS7g==
X-Gm-Message-State: AGi0PuZJa33VEUT5pA6lfB6o2gtN8PN5CXnb54UlIrkflyUrmz4LHhzx
        B6DktbErRUBBPxYYVq4qpardNl2NtncefXxyyxYb9q5S2y8=
X-Google-Smtp-Source: APiQypIAw7yF75OWioJ3aWNUUYswSp0C8CUD5l0tq3P2AG0JU8owbLCsz+Ltw6B2PobheLwSuqV9YKda1j4eDVkL0wQ=
X-Received: by 2002:a05:6512:308e:: with SMTP id z14mr6066036lfd.110.1587728563788;
 Fri, 24 Apr 2020 04:42:43 -0700 (PDT)
MIME-Version: 1.0
References: <20200206102058.247258-1-keiichiw@chromium.org>
 <3536507.QJadu78ljV@os-lin-dmo> <CAD90VcbgrcMEiYSGZo66qZS8uBznLim3nVPnsmbekstB3Brktg@mail.gmail.com>
 <3597088.V25eIC5XRa@os-lin-dmo>
In-Reply-To: <3597088.V25eIC5XRa@os-lin-dmo>
From:   Keiichi Watanabe <keiichiw@chromium.org>
Date:   Fri, 24 Apr 2020 20:42:31 +0900
Message-ID: <CAD90VcZpXevAF9=d1FvdHyGkU3ShKWga+_AhPWN4BBFTTRY1aQ@mail.gmail.com>
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
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Dmitry,

On Tue, Apr 21, 2020 at 5:39 PM Dmitry Sepp <dmitry.sepp@opensynergy.com> wrote:
>
> Hi Keiichi,
>
> On Montag, 20. April 2020 11:57:52 CEST Keiichi Watanabe wrote:
> > Hi Dmitry,
> >
> > On Fri, Apr 17, 2020 at 5:09 PM Dmitry Sepp <dmitry.sepp@opensynergy.com>
> wrote:
> > > Hi,
> > >
> > > On Donnerstag, 9. April 2020 12:46:27 CEST Keiichi Watanabe wrote:
> > > > Currently, we have three options of the design of per-stream properties:
> > > >
> > > > 1. Have two structs for image format and bitstream format.
> > > > Pros:
> > > > Well structured. Easy to support uni-directional stream.
> > > > Cons:
> > > > Not all properties may not be classified well. For example, bitrate in
> > > > encoder is about "how we encode it" rather than "what we encode it
> > > > into". So, it may be a bit strange to have it in the bitstream
> > > > information.
> > > >
> > > > 2. Have one struct that contains all properties.
> > > > Pros:
> > > > Well structured. Since updating one format affects the other format,
> > > > it may make more sense to have everything in one struct.
> > > > Also, we can have any per-stream properties there that may be tied to
> > > > neither image format nor bitstream format.
> > > > Cons:
> > > > If we want to support uni-directional streams in the virtio-video
> > > > protocol, we may be going to have many unused fields in that struct.
> > > >
> > > > 3. Have every property as a separate subcommand like v3's controls
> > > > Pros:
> > > > Easy to add more properties in the future.
> > > > Cons:
> > > > Less structured. So, we need to be careful not to overlook mandatory
> > > > properties when we implement the driver and device.
> > > >
> > > >
> > > > IMHO, I'm relatively supportive of 2, but we might need to rethink
> > > > whether we really want to support uni-directional streams in
> > > > virtio-video.
> > >
> > > Ok, let's assume we keep it is one struct. Anyway, we indeed can just
> > > ignore some of the fields if we want so. We need to define some
> > > conventions for the struct. Like whether we should fill all the fields
> > > all the time when sending set_params() and so on.
> >
> > Right. We need to define whether each field in params is (i) either
> > mandatory, (2) applicable for encoder and decoder and (3) the driver
> > can modify it.
> >
> > > I want to ask you about the frame-level bitrate control here [1]. Is it
> > > planned to support it? If yes, we also need a control to enable that and a
> > > way to pass minimum and maximum value for the quantization parameter.
> >
> > I have no plan to support this kind of controls as I explained at
> > https://markmail.org/message/orbtthzxcg3qyzxo.
> >
> > Even if we want to support max of bitrates doesn't make much sense
> > because a user can specify any big value as bitrate and encoder will
> > do its best to make better bitstream in the specified bitrate.
> > I think this is the reason why we didn't have a QUERY_CONTROL value
> > for bitrates in v3 spec.
> >
>
> Yes, we had already that discussion, but it does not answer the question. On
> open we need to init controls, bitrate is also there. So according to your
> proposal we should set max bitrate limit to 0xffffffff. Is it correct?

Ah, you were talking about the actual placeholder value that we should
pass to v4l2_ctrl_new_std as "max" for V4L2_CID_MPEG_VIDEO_BITRATE.
Yeah, 0xffffffff sounds reasonable.

Or, we may be able to have a field of the "global" maximum bitrate;
max of "max bitrate for a format" for each format.
But, I don't think it doesn't make much sense even though it matches
with V4L2's design.

>
> > > > I guess it's worthwhile to create a separate protocol like
> > > > virtio-camera even if it somehow overlaps with virtio-video.
> > > > Only for a simple video capture scenario, extending the virtio-video
> > > > protocol can be one of simple solutions. However, if we want to extend
> > > > it for more features like MIPI cameras, it's not hard to imagine the
> > > > protocol becoming very complicated.
> > > > I wonder if we can keep virtio protocols simple and clean rather than
> > > > making an all-in-one protocol for media devices like V4L2.
> > > >
> > > > > I could be useful if it was possible to store the structure in the
> > > > > config
> > > > > space, but that won't fly as we have multiple streams with different
> > > > > settings. Also one device can support multiple formats, so we won't be
> > > > > able to handle the unions.
> > > >
> > > > Yeah, this structure should be per-stream properties but virtio's
> > > > config is for per-device properties.
> > > > So, it doesn't work as you said.
> > > >
> > > > > > > The idea being that depending on the value of "format", only the
> > > > > > > relevant member of the union becomes meaningful. This ensures that
> > > > > > > the
> > > > > > > device/driver does not need to check for every control whether it
> > > > > > > is
> > > > > > > valid in the current context ; it just needs to check what
> > > > > > > "format" is
> > > > > > > and take the values from the relevant members.
> > > > > >
> > > > > > I like this idea to use union to make it more structured.
> > > > >
> > > > > I don't really have any strong objections agains unions per se, but I
> > > > > deem
> > > > > we need to keep the structure flexible. At the very beginning of the
> > > > > development there was a discussion about stream priority. If I add a
> > > > > 'prio' field to this structure it will break the binary compatibility
> > > > > with older versions.
> > > >
> > > > Hmm, I don't think unions can incur any extra binary compatibility
> > > > issues compared with designs using only structs.
> > > > Since alignment rules are well-defined for unions as well as structs,
> > > > it'd be okay.
> > > > We might want to have an explicit field to show the size of a union
> > > > like:
> > > >
> > > > union {
> > > >
> > > >   struct {
> > > >
> > > >     ...
> > > >
> > > >   } h264;
> > > >   struct {
> > > >
> > > >     ...
> > > >
> > > >   } vp8;
> > > >   ...
> > > >   u8 _align[MAX_SIZE_OF_FIELDS_IN_THIS_UNION];
> > > >
> > > > }
> > > >
> > > > > > > I don't think we even need to have a different queue for both
> > > > > > > structs
> > > > > > > (which is what V4L2 does, but again for its own reasons). Just a
> > > > > > > single one per coding or decoding context could be enough AFAICT.
> > > > > > >
> > > > > > > Depending on whether we are decoding or encoding, access to some
> > > > > > > members would be restricted to read/only for the device or driver.
> > > > > > > For
> > > > > > > instance, when encoding the driver can set "bitrate" to the
> > > > > > > desired
> > > > > > > encoding rate. When decoding, the decoder can report the video's
> > > > > > > bitrate there.
> > > > > > >
> > > > > > > Now I'm not sure what would be the best way to share this
> > > > > > > structure.
> > > > > > > Either a memory area shared between the driver and device, with
> > > > > > > commands/messages sent to notify that something has changed, or
> > > > > > > sending the whole structure with each command/message.
> > > > > >
> > > > > > I don't think the first idea is feasible in the virtio mechanism.
> > > > > > So,
> > > > > > we can utilize the same way as the previous proposal; SET_PARAMS and
> > > > > > GET_PARAMS.
> > > > >
> > > > > For similar thing the virtio config space exists, but as I mentioned
> > > > > above, it won't fit the current virtio-video design (or we probably
> > > > > can
> > > > > pre-define the max number of streams on the device side and have
> > > > > params
> > > > > for each stream in the config space, but this looks clumsy).
> > > > >
> > > > > > We also need to think of how to advertise supported profiles and
> > > > > > levels. Probably, we might want to extend struct
> > > > > > virtio_video_format_desc to include supported profiles/levels in a
> > > > > > response of QUERY_CAPABLITY.
> > > > >
> > > > > It would mean back to spec v1 AFAIR. We probably need to recall why we
> > > > > got
> > > > > rid of that.
> > > >
> > > > Probably, this reply:
> > > > https://markmail.org/thread/zr3ycvxixnwi5agt
> > > > At that time, I assumed that we'll have profiles/levels/bitrates as
> > > > controls, aparting from other per-stream properties. In that
> > > > situation, it made sense to have a separate mechanism to get/set/query
> > > > these properties.
> > > > However, we are likely not to end up distinguishing these properties
> > > > from other properties. If so, we don't need any other querying
> > > > mechanism other than QUERY_CAPABILITY.
> > > >
> > > > To support profiles, we can extend virtio_video_format_desc to
> > > > (a) add fields like "profiles" and "levels" that shows supported
> > > > values as bit mask, or
> > > > (b) add fields like "num_profiles" and "num_levels" that describes the
> > > > lengths of arrays that follows.
> > > >
> > > > My personal preference is (a).
> > >
> > > Yes, this should be ok. We had arrays in the spec v1, but as we have now
> > > bitmasks for formats, we can do so for profiles and levels.
> > >
> > > We currently have two problems with capabilities when it comes to the real
> > > implementation:
> > >
> > > 1. If we want to avoid calling stream_create in open(), we need to have
> > > bitrates already on per-format basis in capabilities.
> > > 2. We also need to know min input and output buffer count in advance, i.e.
> > > it should not be in params, especially for encoder that won't report it
> > > after metadata parsing like decoder, please see [2] (thanks Nicolas
> > > Dufresne for helping with that issue).
> >
> > I think these problems wouldn't be problems if we distinguish "guest
> > driver's internal session" and "virtio-video stream'.
> > The open() is an operation to create a guest driver's internal
> > session, not virtio-video stream.
> > Specifically, in your driver patch, we can define a struct like the
> > following example for the driver's internal context.
> >
> > // Represents an internal state of a driver session.
> > struct virtio_video_context {
> >   enum virtio_video_context_state;
> >   struct video-_device *video_dev;
> >   struct v4l2_fh fh;
> >   ...
> >
> >   // The following pointers are NULL at the initialization.
> >   virtio_video_stream *stream;
> >   virtio_video_params *params;
> > };
> >
> > This struct will be allocated in open(), as it represents a driver's
> > internal state.
> > Its fields associated with a virtio-video stream will be initialized
> > at the time when it's really needed via an accessor function like
> > this:
> >
> > // Gets virtio-video stream information from a context.
> > // If a given context is associated to no virtio-video stream,
> > // it creates one by the STREAM_CREATE command.
> > virtio_video_stream* ctx2stream(struct virtio_video_context *ctx)
> > {
> >   if (!ctx->stream)
> >     ctx->stream = virtio_video_cmd_stream_create(...);
> >
> >   return ctx->stream;
> > }
> >
> > In this implementation, we can delay creation of a virtio-video stream
> > until it's actually needed without considering where it is.
> >
> >
> > Regarding the second problem you mentioned, I think the min/max number
> > of buffers _should_ be in params because they're per-stream parameters
> > and can be changed at the middle of a stream because of resolution
> > changes, for example.
> >
>
> Thanks for providing this detailed overview. But again, we have already
> discussed this in a similar way and it does not answer the questions. Ok,
> suppose we set bitrate to 0xffffffff as I assumed above. Then the decoder code
> should ideally wait until metadata has been parsed, then query parameters and
> get min buffers (using get_params). Encoder does not have such logic. What
> values should we set for encoder to make sure that the pipelines does not
> stall? Probably people from the Chromium team has better knowledge, if they
> can provide some sane value it'd be just great.

Sorry that my explanation was unclear to you.  Let me try to explain
my idea in another way.

The design I'm proposing can be seen as a kind of "Copy-on-Write"
strategy. The resource creation can be deferred to the first write.
In other words, the call of STREAM_CREATE can be delayed to the first
place where a user makes a change to the stream, instead of open().
The code snippet I wrote above explains a general way of achieving
CoW. In this design, ctx2stream() will be called when modifying a
stream.

In the V4L2 stateful encoder API, the first place in which a user
writes values is the first call of VIDIOC_S_FMT().
So, we can have a virtio_video_cmd_stream_cmd() call in the callback
for VIDIOC_S_FMT. I guess it's even better than my previous proposal
of ctx2stream, as the driver can raise an error when a user calls
ioctls in a wrong order.
(I think I said that the place would be REQBUFS callback in a previous
review comment to your patch. It was my misunderstanding. My
apologies.)

Does it make sense? I hope this answers your question.

Best regards,
Keiichi

>
> Best regards,
> Dmitry.
>
> > Best regards,
> > Keiichi
> >
> > > [1] https://github.com/chromium/chromium/blob/master/media/gpu/v4l2/
> > > v4l2_video_encode_accelerator.cc#L1579
> > > [2] https://gitlab.freedesktop.org/gstreamer/gst-plugins-good/-/issues/672
> > >
> > > Best regards,
> > > Dmitry.
> > >
> > > > Best regards,
> > > > Keiichi
> > > >
> > > > > > > Now the parameters I have listed above are not subject to changing
> > > > > > > a
> > > > > > > lot, but there are also parameters that we may want to specify/be
> > > > > > > notified on with each frame. For instance, whether we want a frame
> > > > > > > to
> > > > > > > be forcibly encoded as a keyframe. V4L2 uses a control for this,
> > > > > > > but
> > > > > > > we could probably do better if we can pass this information with
> > > > > > > each
> > > > > > > frame to be encoded. Maybe we can implement that by using
> > > > > > > different
> > > > > > > QUEUE commands for encoder and decoder, or again by using a union.
> > > > > >
> > > > > > Ah, I haven't come up with such a kind of parameter. Perhaps, we can
> > > > > > extend struct virtio_video_resource_queue to have this flag.
> > > > >
> > > > > This looks sane for me.
> > > > >
> > > > > Best regards,
> > > > > Dmitry.
>
>
