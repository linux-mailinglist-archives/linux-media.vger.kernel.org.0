Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 08E1A1B0613
	for <lists+linux-media@lfdr.de>; Mon, 20 Apr 2020 11:58:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726055AbgDTJ6H (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 20 Apr 2020 05:58:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35672 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1725773AbgDTJ6G (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 20 Apr 2020 05:58:06 -0400
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com [IPv6:2a00:1450:4864:20::241])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2305AC061A0C
        for <linux-media@vger.kernel.org>; Mon, 20 Apr 2020 02:58:06 -0700 (PDT)
Received: by mail-lj1-x241.google.com with SMTP id l19so6688933lje.10
        for <linux-media@vger.kernel.org>; Mon, 20 Apr 2020 02:58:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=NlZvIc9o2Cek4zcd9+mjKA0yT9wI/3v9nTyqjv7SYx8=;
        b=IZ286rwZUZvoQOj7KR1oTB0U7CDKMchWpv3eF1RJ3/NuhMXQcisrtFedMZTu0qLOPY
         bXoNatYtVpsxuXs4w7kePzq+Ex7Q1rqSWEhOVtHndoXaj20cX0JoqdHeMyFOReRpusct
         YggctKf2/HvqyRYQPsq3zCE8AUZtXyav/wDk8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=NlZvIc9o2Cek4zcd9+mjKA0yT9wI/3v9nTyqjv7SYx8=;
        b=sJXIuavus3hcdlDqvXTkmG0oYZQx98W9SwNDcL4u6VCJw/MzWkk69VexKJnXsm2QnD
         URxk0h1d3FUV6ZnjJO6jnHbFvvHcOOfnpNkqLgTUITIZHlHycsDdWN0fT+pEbtBZNq6U
         1lQWr5So3c9avBDAdOi5EJ8wWN34KBVGSh9TzYcJTUhGBn5S0Sy58a9PcvxpIrl2Z3cE
         PVU1ZiGHWMVeQqECFJVPeftWOscdR+amYTxS+oBhGB8xNsTNm+sUYQFRcOR6QXV1f5XF
         Rv4fZccSGt4zJ4UfTORE3nrQxPJrMdWV7R2ztQQbzX1WsFcRtqiXn9zVeHaFHVWFqqxs
         NqBQ==
X-Gm-Message-State: AGi0PuaQzA1C1IqRKRNWdDfQKFpfH8q34Yq9twiPuLKKgob6F3/aWnUu
        +UeWj0LmXXCVHV5fez4kRoL+ZF/vWBNoQaAKkyo4fA==
X-Google-Smtp-Source: APiQypJ3cMIJuR2WlyQ5qL8azG3NOIxKksLMUbGdEZgItIU8VzY9pzxlltufsYLVI2BWO0rHnN/J5trGn60Js9GKRME=
X-Received: by 2002:a2e:89cf:: with SMTP id c15mr3418376ljk.149.1587376684467;
 Mon, 20 Apr 2020 02:58:04 -0700 (PDT)
MIME-Version: 1.0
References: <20200206102058.247258-1-keiichiw@chromium.org>
 <5576106.alqRGMn8q6@os-lin-dmo> <CAD90Vcb7UwWAqHOKb7rUV6q3TCSCCEpbbkv6oK0PnEL246TgJQ@mail.gmail.com>
 <3536507.QJadu78ljV@os-lin-dmo>
In-Reply-To: <3536507.QJadu78ljV@os-lin-dmo>
From:   Keiichi Watanabe <keiichiw@chromium.org>
Date:   Mon, 20 Apr 2020 18:57:52 +0900
Message-ID: <CAD90VcbgrcMEiYSGZo66qZS8uBznLim3nVPnsmbekstB3Brktg@mail.gmail.com>
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

On Fri, Apr 17, 2020 at 5:09 PM Dmitry Sepp <dmitry.sepp@opensynergy.com> wrote:
>
> Hi,
>
> On Donnerstag, 9. April 2020 12:46:27 CEST Keiichi Watanabe wrote:
> > Currently, we have three options of the design of per-stream properties:
> >
> > 1. Have two structs for image format and bitstream format.
> > Pros:
> > Well structured. Easy to support uni-directional stream.
> > Cons:
> > Not all properties may not be classified well. For example, bitrate in
> > encoder is about "how we encode it" rather than "what we encode it
> > into". So, it may be a bit strange to have it in the bitstream
> > information.
> >
> > 2. Have one struct that contains all properties.
> > Pros:
> > Well structured. Since updating one format affects the other format,
> > it may make more sense to have everything in one struct.
> > Also, we can have any per-stream properties there that may be tied to
> > neither image format nor bitstream format.
> > Cons:
> > If we want to support uni-directional streams in the virtio-video
> > protocol, we may be going to have many unused fields in that struct.
> >
> > 3. Have every property as a separate subcommand like v3's controls
> > Pros:
> > Easy to add more properties in the future.
> > Cons:
> > Less structured. So, we need to be careful not to overlook mandatory
> > properties when we implement the driver and device.
> >
> >
> > IMHO, I'm relatively supportive of 2, but we might need to rethink
> > whether we really want to support uni-directional streams in
> > virtio-video.
>
> Ok, let's assume we keep it is one struct. Anyway, we indeed can just ignore
> some of the fields if we want so. We need to define some conventions for the
> struct. Like whether we should fill all the fields all the time when sending
> set_params() and so on.

Right. We need to define whether each field in params is (i) either
mandatory, (2) applicable for encoder and decoder and (3) the driver
can modify it.

>
> I want to ask you about the frame-level bitrate control here [1]. Is it
> planned to support it? If yes, we also need a control to enable that and a way
> to pass minimum and maximum value for the quantization parameter.

I have no plan to support this kind of controls as I explained at
https://markmail.org/message/orbtthzxcg3qyzxo.

Even if we want to support max of bitrates doesn't make much sense
because a user can specify any big value as bitrate and encoder will
do its best to make better bitstream in the specified bitrate.
I think this is the reason why we didn't have a QUERY_CONTROL value
for bitrates in v3 spec.

>
> > I guess it's worthwhile to create a separate protocol like
> > virtio-camera even if it somehow overlaps with virtio-video.
> > Only for a simple video capture scenario, extending the virtio-video
> > protocol can be one of simple solutions. However, if we want to extend
> > it for more features like MIPI cameras, it's not hard to imagine the
> > protocol becoming very complicated.
> > I wonder if we can keep virtio protocols simple and clean rather than
> > making an all-in-one protocol for media devices like V4L2.
> >
> > > I could be useful if it was possible to store the structure in the config
> > > space, but that won't fly as we have multiple streams with different
> > > settings. Also one device can support multiple formats, so we won't be
> > > able to handle the unions.
> >
> > Yeah, this structure should be per-stream properties but virtio's
> > config is for per-device properties.
> > So, it doesn't work as you said.
> >
> > > > > The idea being that depending on the value of "format", only the
> > > > > relevant member of the union becomes meaningful. This ensures that the
> > > > > device/driver does not need to check for every control whether it is
> > > > > valid in the current context ; it just needs to check what "format" is
> > > > > and take the values from the relevant members.
> > > >
> > > > I like this idea to use union to make it more structured.
> > >
> > > I don't really have any strong objections agains unions per se, but I deem
> > > we need to keep the structure flexible. At the very beginning of the
> > > development there was a discussion about stream priority. If I add a
> > > 'prio' field to this structure it will break the binary compatibility
> > > with older versions.
> > Hmm, I don't think unions can incur any extra binary compatibility
> > issues compared with designs using only structs.
> > Since alignment rules are well-defined for unions as well as structs,
> > it'd be okay.
> > We might want to have an explicit field to show the size of a union like:
> >
> > union {
> >   struct {
> >     ...
> >   } h264;
> >   struct {
> >     ...
> >   } vp8;
> >   ...
> >   u8 _align[MAX_SIZE_OF_FIELDS_IN_THIS_UNION];
> > }
> >
> > > > > I don't think we even need to have a different queue for both structs
> > > > > (which is what V4L2 does, but again for its own reasons). Just a
> > > > > single one per coding or decoding context could be enough AFAICT.
> > > > >
> > > > > Depending on whether we are decoding or encoding, access to some
> > > > > members would be restricted to read/only for the device or driver. For
> > > > > instance, when encoding the driver can set "bitrate" to the desired
> > > > > encoding rate. When decoding, the decoder can report the video's
> > > > > bitrate there.
> > > > >
> > > > > Now I'm not sure what would be the best way to share this structure.
> > > > > Either a memory area shared between the driver and device, with
> > > > > commands/messages sent to notify that something has changed, or
> > > > > sending the whole structure with each command/message.
> > > >
> > > > I don't think the first idea is feasible in the virtio mechanism. So,
> > > > we can utilize the same way as the previous proposal; SET_PARAMS and
> > > > GET_PARAMS.
> > >
> > > For similar thing the virtio config space exists, but as I mentioned
> > > above, it won't fit the current virtio-video design (or we probably can
> > > pre-define the max number of streams on the device side and have params
> > > for each stream in the config space, but this looks clumsy).
> > >
> > > > We also need to think of how to advertise supported profiles and
> > > > levels. Probably, we might want to extend struct
> > > > virtio_video_format_desc to include supported profiles/levels in a
> > > > response of QUERY_CAPABLITY.
> > >
> > > It would mean back to spec v1 AFAIR. We probably need to recall why we got
> > > rid of that.
> >
> > Probably, this reply:
> > https://markmail.org/thread/zr3ycvxixnwi5agt
> > At that time, I assumed that we'll have profiles/levels/bitrates as
> > controls, aparting from other per-stream properties. In that
> > situation, it made sense to have a separate mechanism to get/set/query
> > these properties.
> > However, we are likely not to end up distinguishing these properties
> > from other properties. If so, we don't need any other querying
> > mechanism other than QUERY_CAPABILITY.
> >
> > To support profiles, we can extend virtio_video_format_desc to
> > (a) add fields like "profiles" and "levels" that shows supported
> > values as bit mask, or
> > (b) add fields like "num_profiles" and "num_levels" that describes the
> > lengths of arrays that follows.
> >
> > My personal preference is (a).
> >
>
> Yes, this should be ok. We had arrays in the spec v1, but as we have now
> bitmasks for formats, we can do so for profiles and levels.
>
> We currently have two problems with capabilities when it comes to the real
> implementation:
>
> 1. If we want to avoid calling stream_create in open(), we need to have
> bitrates already on per-format basis in capabilities.
> 2. We also need to know min input and output buffer count in advance, i.e. it
> should not be in params, especially for encoder that won't report it after
> metadata parsing like decoder, please see [2] (thanks Nicolas Dufresne for
> helping with that issue).

I think these problems wouldn't be problems if we distinguish "guest
driver's internal session" and "virtio-video stream'.
The open() is an operation to create a guest driver's internal
session, not virtio-video stream.
Specifically, in your driver patch, we can define a struct like the
following example for the driver's internal context.

// Represents an internal state of a driver session.
struct virtio_video_context {
  enum virtio_video_context_state;
  struct video-_device *video_dev;
  struct v4l2_fh fh;
  ...

  // The following pointers are NULL at the initialization.
  virtio_video_stream *stream;
  virtio_video_params *params;
};

This struct will be allocated in open(), as it represents a driver's
internal state.
Its fields associated with a virtio-video stream will be initialized
at the time when it's really needed via an accessor function like
this:

// Gets virtio-video stream information from a context.
// If a given context is associated to no virtio-video stream,
// it creates one by the STREAM_CREATE command.
virtio_video_stream* ctx2stream(struct virtio_video_context *ctx)
{
  if (!ctx->stream)
    ctx->stream = virtio_video_cmd_stream_create(...);

  return ctx->stream;
}

In this implementation, we can delay creation of a virtio-video stream
until it's actually needed without considering where it is.


Regarding the second problem you mentioned, I think the min/max number
of buffers _should_ be in params because they're per-stream parameters
and can be changed at the middle of a stream because of resolution
changes, for example.

Best regards,
Keiichi

>
> [1] https://github.com/chromium/chromium/blob/master/media/gpu/v4l2/
> v4l2_video_encode_accelerator.cc#L1579
> [2] https://gitlab.freedesktop.org/gstreamer/gst-plugins-good/-/issues/672
>
> Best regards,
> Dmitry.
>
> > Best regards,
> > Keiichi
> >
> > > > > Now the parameters I have listed above are not subject to changing a
> > > > > lot, but there are also parameters that we may want to specify/be
> > > > > notified on with each frame. For instance, whether we want a frame to
> > > > > be forcibly encoded as a keyframe. V4L2 uses a control for this, but
> > > > > we could probably do better if we can pass this information with each
> > > > > frame to be encoded. Maybe we can implement that by using different
> > > > > QUEUE commands for encoder and decoder, or again by using a union.
> > > >
> > > > Ah, I haven't come up with such a kind of parameter. Perhaps, we can
> > > > extend struct virtio_video_resource_queue to have this flag.
> > >
> > > This looks sane for me.
> > >
> > > Best regards,
> > > Dmitry.
>
>
