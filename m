Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 893C91B21D6
	for <lists+linux-media@lfdr.de>; Tue, 21 Apr 2020 10:39:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726403AbgDUIjI (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 21 Apr 2020 04:39:08 -0400
Received: from plasma4.jpberlin.de ([80.241.57.33]:52293 "EHLO
        plasma4.jpberlin.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726018AbgDUIjH (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 21 Apr 2020 04:39:07 -0400
Received: from spamfilter02.heinlein-hosting.de (spamfilter02.heinlein-hosting.de [80.241.56.116])
        by plasma.jpberlin.de (Postfix) with ESMTP id 458A4A735D;
        Tue, 21 Apr 2020 10:39:01 +0200 (CEST)
X-Virus-Scanned: amavisd-new at heinlein-support.de
Received: from plasma.jpberlin.de ([80.241.56.68])
        by spamfilter02.heinlein-hosting.de (spamfilter02.heinlein-hosting.de [80.241.56.116]) (amavisd-new, port 10030)
        with ESMTP id 4owlIETge-6x; Tue, 21 Apr 2020 10:39:00 +0200 (CEST)
Received: from webmail.opensynergy.com (unknown [217.66.60.5])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (Client CN "webmail.opensynergy.com", Issuer "GeoTrust EV RSA CA 2018" (not verified))
        (Authenticated sender: opensynergy@jpberlin.de)
        by plasma.jpberlin.de (Postfix) with ESMTPSA id 3B896BAD39;
        Tue, 21 Apr 2020 10:38:59 +0200 (CEST)
Received: from os-lin-dmo.localnet (10.25.255.1) by MXS01.open-synergy.com
 (10.25.10.17) with Microsoft SMTP Server (TLS) id 14.3.487.0; Tue, 21 Apr
 2020 10:38:58 +0200
From:   Dmitry Sepp <dmitry.sepp@opensynergy.com>
To:     Keiichi Watanabe <keiichiw@chromium.org>
CC:     Alexandre Courbot <acourbot@chromium.org>,
        Gerd Hoffmann <kraxel@redhat.com>,
        <virtio-dev@lists.oasis-open.org>,
        "Linux Media Mailing List" <linux-media@vger.kernel.org>,
        Alex Lau <alexlau@chromium.org>,
        "Daniel Vetter" <daniel@ffwll.ch>,
        Dylan Reid <dgreid@chromium.org>,
        David Staessens <dstaessens@chromium.org>,
        Enrico Granata <egranata@google.com>,
        "Frediano Ziglio" <fziglio@redhat.com>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        =?ISO-8859-1?Q?St=E9phane?= Marchesin <marcheu@chromium.org>,
        Pawel Osciak <posciak@chromium.org>,
        <spice-devel@lists.freedesktop.org>,
        David Stevens <stevensd@chromium.org>,
        Tomasz Figa <tfiga@chromium.org>, <uril@redhat.com>,
        Samiullah Khawaja <samiullah.khawaja@opensynergy.com>,
        Kiran Pawar <kiran.pawar@opensynergy.com>
Subject: Re: [PATCH v3 1/2] virtio-video: Add virtio video device specification
Date:   Tue, 21 Apr 2020 10:38:58 +0200
Message-ID: <3597088.V25eIC5XRa@os-lin-dmo>
Organization: OpenSynergy
In-Reply-To: <CAD90VcbgrcMEiYSGZo66qZS8uBznLim3nVPnsmbekstB3Brktg@mail.gmail.com>
References: <20200206102058.247258-1-keiichiw@chromium.org> <3536507.QJadu78ljV@os-lin-dmo> <CAD90VcbgrcMEiYSGZo66qZS8uBznLim3nVPnsmbekstB3Brktg@mail.gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
X-Originating-IP: [10.25.255.1]
X-Rspamd-Queue-Id: 458A4A735D
X-Rspamd-Score: -5.77 / 15.00 / 200.00
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Keiichi,

On Montag, 20. April 2020 11:57:52 CEST Keiichi Watanabe wrote:
> Hi Dmitry,
> 
> On Fri, Apr 17, 2020 at 5:09 PM Dmitry Sepp <dmitry.sepp@opensynergy.com> 
wrote:
> > Hi,
> > 
> > On Donnerstag, 9. April 2020 12:46:27 CEST Keiichi Watanabe wrote:
> > > Currently, we have three options of the design of per-stream properties:
> > > 
> > > 1. Have two structs for image format and bitstream format.
> > > Pros:
> > > Well structured. Easy to support uni-directional stream.
> > > Cons:
> > > Not all properties may not be classified well. For example, bitrate in
> > > encoder is about "how we encode it" rather than "what we encode it
> > > into". So, it may be a bit strange to have it in the bitstream
> > > information.
> > > 
> > > 2. Have one struct that contains all properties.
> > > Pros:
> > > Well structured. Since updating one format affects the other format,
> > > it may make more sense to have everything in one struct.
> > > Also, we can have any per-stream properties there that may be tied to
> > > neither image format nor bitstream format.
> > > Cons:
> > > If we want to support uni-directional streams in the virtio-video
> > > protocol, we may be going to have many unused fields in that struct.
> > > 
> > > 3. Have every property as a separate subcommand like v3's controls
> > > Pros:
> > > Easy to add more properties in the future.
> > > Cons:
> > > Less structured. So, we need to be careful not to overlook mandatory
> > > properties when we implement the driver and device.
> > > 
> > > 
> > > IMHO, I'm relatively supportive of 2, but we might need to rethink
> > > whether we really want to support uni-directional streams in
> > > virtio-video.
> > 
> > Ok, let's assume we keep it is one struct. Anyway, we indeed can just
> > ignore some of the fields if we want so. We need to define some
> > conventions for the struct. Like whether we should fill all the fields
> > all the time when sending set_params() and so on.
> 
> Right. We need to define whether each field in params is (i) either
> mandatory, (2) applicable for encoder and decoder and (3) the driver
> can modify it.
> 
> > I want to ask you about the frame-level bitrate control here [1]. Is it
> > planned to support it? If yes, we also need a control to enable that and a
> > way to pass minimum and maximum value for the quantization parameter.
> 
> I have no plan to support this kind of controls as I explained at
> https://markmail.org/message/orbtthzxcg3qyzxo.
> 
> Even if we want to support max of bitrates doesn't make much sense
> because a user can specify any big value as bitrate and encoder will
> do its best to make better bitstream in the specified bitrate.
> I think this is the reason why we didn't have a QUERY_CONTROL value
> for bitrates in v3 spec.
> 

Yes, we had already that discussion, but it does not answer the question. On 
open we need to init controls, bitrate is also there. So according to your 
proposal we should set max bitrate limit to 0xffffffff. Is it correct?

> > > I guess it's worthwhile to create a separate protocol like
> > > virtio-camera even if it somehow overlaps with virtio-video.
> > > Only for a simple video capture scenario, extending the virtio-video
> > > protocol can be one of simple solutions. However, if we want to extend
> > > it for more features like MIPI cameras, it's not hard to imagine the
> > > protocol becoming very complicated.
> > > I wonder if we can keep virtio protocols simple and clean rather than
> > > making an all-in-one protocol for media devices like V4L2.
> > > 
> > > > I could be useful if it was possible to store the structure in the
> > > > config
> > > > space, but that won't fly as we have multiple streams with different
> > > > settings. Also one device can support multiple formats, so we won't be
> > > > able to handle the unions.
> > > 
> > > Yeah, this structure should be per-stream properties but virtio's
> > > config is for per-device properties.
> > > So, it doesn't work as you said.
> > > 
> > > > > > The idea being that depending on the value of "format", only the
> > > > > > relevant member of the union becomes meaningful. This ensures that
> > > > > > the
> > > > > > device/driver does not need to check for every control whether it
> > > > > > is
> > > > > > valid in the current context ; it just needs to check what
> > > > > > "format" is
> > > > > > and take the values from the relevant members.
> > > > > 
> > > > > I like this idea to use union to make it more structured.
> > > > 
> > > > I don't really have any strong objections agains unions per se, but I
> > > > deem
> > > > we need to keep the structure flexible. At the very beginning of the
> > > > development there was a discussion about stream priority. If I add a
> > > > 'prio' field to this structure it will break the binary compatibility
> > > > with older versions.
> > > 
> > > Hmm, I don't think unions can incur any extra binary compatibility
> > > issues compared with designs using only structs.
> > > Since alignment rules are well-defined for unions as well as structs,
> > > it'd be okay.
> > > We might want to have an explicit field to show the size of a union
> > > like:
> > > 
> > > union {
> > > 
> > >   struct {
> > >   
> > >     ...
> > >   
> > >   } h264;
> > >   struct {
> > >   
> > >     ...
> > >   
> > >   } vp8;
> > >   ...
> > >   u8 _align[MAX_SIZE_OF_FIELDS_IN_THIS_UNION];
> > > 
> > > }
> > > 
> > > > > > I don't think we even need to have a different queue for both
> > > > > > structs
> > > > > > (which is what V4L2 does, but again for its own reasons). Just a
> > > > > > single one per coding or decoding context could be enough AFAICT.
> > > > > > 
> > > > > > Depending on whether we are decoding or encoding, access to some
> > > > > > members would be restricted to read/only for the device or driver.
> > > > > > For
> > > > > > instance, when encoding the driver can set "bitrate" to the
> > > > > > desired
> > > > > > encoding rate. When decoding, the decoder can report the video's
> > > > > > bitrate there.
> > > > > > 
> > > > > > Now I'm not sure what would be the best way to share this
> > > > > > structure.
> > > > > > Either a memory area shared between the driver and device, with
> > > > > > commands/messages sent to notify that something has changed, or
> > > > > > sending the whole structure with each command/message.
> > > > > 
> > > > > I don't think the first idea is feasible in the virtio mechanism.
> > > > > So,
> > > > > we can utilize the same way as the previous proposal; SET_PARAMS and
> > > > > GET_PARAMS.
> > > > 
> > > > For similar thing the virtio config space exists, but as I mentioned
> > > > above, it won't fit the current virtio-video design (or we probably
> > > > can
> > > > pre-define the max number of streams on the device side and have
> > > > params
> > > > for each stream in the config space, but this looks clumsy).
> > > > 
> > > > > We also need to think of how to advertise supported profiles and
> > > > > levels. Probably, we might want to extend struct
> > > > > virtio_video_format_desc to include supported profiles/levels in a
> > > > > response of QUERY_CAPABLITY.
> > > > 
> > > > It would mean back to spec v1 AFAIR. We probably need to recall why we
> > > > got
> > > > rid of that.
> > > 
> > > Probably, this reply:
> > > https://markmail.org/thread/zr3ycvxixnwi5agt
> > > At that time, I assumed that we'll have profiles/levels/bitrates as
> > > controls, aparting from other per-stream properties. In that
> > > situation, it made sense to have a separate mechanism to get/set/query
> > > these properties.
> > > However, we are likely not to end up distinguishing these properties
> > > from other properties. If so, we don't need any other querying
> > > mechanism other than QUERY_CAPABILITY.
> > > 
> > > To support profiles, we can extend virtio_video_format_desc to
> > > (a) add fields like "profiles" and "levels" that shows supported
> > > values as bit mask, or
> > > (b) add fields like "num_profiles" and "num_levels" that describes the
> > > lengths of arrays that follows.
> > > 
> > > My personal preference is (a).
> > 
> > Yes, this should be ok. We had arrays in the spec v1, but as we have now
> > bitmasks for formats, we can do so for profiles and levels.
> > 
> > We currently have two problems with capabilities when it comes to the real
> > implementation:
> > 
> > 1. If we want to avoid calling stream_create in open(), we need to have
> > bitrates already on per-format basis in capabilities.
> > 2. We also need to know min input and output buffer count in advance, i.e.
> > it should not be in params, especially for encoder that won't report it
> > after metadata parsing like decoder, please see [2] (thanks Nicolas
> > Dufresne for helping with that issue).
> 
> I think these problems wouldn't be problems if we distinguish "guest
> driver's internal session" and "virtio-video stream'.
> The open() is an operation to create a guest driver's internal
> session, not virtio-video stream.
> Specifically, in your driver patch, we can define a struct like the
> following example for the driver's internal context.
> 
> // Represents an internal state of a driver session.
> struct virtio_video_context {
>   enum virtio_video_context_state;
>   struct video-_device *video_dev;
>   struct v4l2_fh fh;
>   ...
> 
>   // The following pointers are NULL at the initialization.
>   virtio_video_stream *stream;
>   virtio_video_params *params;
> };
> 
> This struct will be allocated in open(), as it represents a driver's
> internal state.
> Its fields associated with a virtio-video stream will be initialized
> at the time when it's really needed via an accessor function like
> this:
> 
> // Gets virtio-video stream information from a context.
> // If a given context is associated to no virtio-video stream,
> // it creates one by the STREAM_CREATE command.
> virtio_video_stream* ctx2stream(struct virtio_video_context *ctx)
> {
>   if (!ctx->stream)
>     ctx->stream = virtio_video_cmd_stream_create(...);
> 
>   return ctx->stream;
> }
> 
> In this implementation, we can delay creation of a virtio-video stream
> until it's actually needed without considering where it is.
> 
> 
> Regarding the second problem you mentioned, I think the min/max number
> of buffers _should_ be in params because they're per-stream parameters
> and can be changed at the middle of a stream because of resolution
> changes, for example.
> 

Thanks for providing this detailed overview. But again, we have already 
discussed this in a similar way and it does not answer the questions. Ok, 
suppose we set bitrate to 0xffffffff as I assumed above. Then the decoder code 
should ideally wait until metadata has been parsed, then query parameters and 
get min buffers (using get_params). Encoder does not have such logic. What 
values should we set for encoder to make sure that the pipelines does not 
stall? Probably people from the Chromium team has better knowledge, if they 
can provide some sane value it'd be just great.

Best regards,
Dmitry.

> Best regards,
> Keiichi
> 
> > [1] https://github.com/chromium/chromium/blob/master/media/gpu/v4l2/
> > v4l2_video_encode_accelerator.cc#L1579
> > [2] https://gitlab.freedesktop.org/gstreamer/gst-plugins-good/-/issues/672
> > 
> > Best regards,
> > Dmitry.
> > 
> > > Best regards,
> > > Keiichi
> > > 
> > > > > > Now the parameters I have listed above are not subject to changing
> > > > > > a
> > > > > > lot, but there are also parameters that we may want to specify/be
> > > > > > notified on with each frame. For instance, whether we want a frame
> > > > > > to
> > > > > > be forcibly encoded as a keyframe. V4L2 uses a control for this,
> > > > > > but
> > > > > > we could probably do better if we can pass this information with
> > > > > > each
> > > > > > frame to be encoded. Maybe we can implement that by using
> > > > > > different
> > > > > > QUEUE commands for encoder and decoder, or again by using a union.
> > > > > 
> > > > > Ah, I haven't come up with such a kind of parameter. Perhaps, we can
> > > > > extend struct virtio_video_resource_queue to have this flag.
> > > > 
> > > > This looks sane for me.
> > > > 
> > > > Best regards,
> > > > Dmitry.


