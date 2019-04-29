Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AFAEAEBAF
	for <lists+linux-media@lfdr.de>; Mon, 29 Apr 2019 22:33:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729376AbfD2UdC (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 29 Apr 2019 16:33:02 -0400
Received: from relay10.mail.gandi.net ([217.70.178.230]:52161 "EHLO
        relay10.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729252AbfD2UdC (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 29 Apr 2019 16:33:02 -0400
Received: from collins (196.109.29.93.rev.sfr.net [93.29.109.196])
        (Authenticated sender: paul.kocialkowski@bootlin.com)
        by relay10.mail.gandi.net (Postfix) with ESMTPSA id DDFC6240007;
        Mon, 29 Apr 2019 20:32:56 +0000 (UTC)
Message-ID: <0c8d534cf1ad262ab790f4ccfe9c2900e8a50aba.camel@bootlin.com>
Subject: Re: [PATCH v4] media: docs-rst: Document m2m stateless video
 decoder interface
From:   Paul Kocialkowski <paul.kocialkowski@bootlin.com>
To:     Nicolas Dufresne <nicolas@ndufresne.ca>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Alexandre Courbot <acourbot@chromium.org>
Cc:     Tomasz Figa <tfiga@chromium.org>,
        Maxime Ripard <maxime.ripard@bootlin.com>,
        Dafna Hirschfeld <dafna3@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Boris Brezillon <boris.brezillon@collabora.com>,
        kernel mailing list <kernel@lists.collabora.co.uk>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@siol.net>,
        Thierry Reding <thierry.reding@gmail.com>
Date:   Mon, 29 Apr 2019 22:32:56 +0200
In-Reply-To: <d656119e73d491fe307045639ccc2102cb8a8722.camel@ndufresne.ca>
References: <20190306080019.159676-1-acourbot@chromium.org>
         <371df0e4ec9e38d83d11171cbd98f19954cbf787.camel@ndufresne.ca>
         <da5aa9ab957923a72e30b169a3c242c4fe6260f1.camel@bootlin.com>
         <c07703459c7e48904bd7fd83be1e675c70eee83c.camel@ndufresne.ca>
         <d81d0112b99feba0a1899f3722077a4aeec9860c.camel@bootlin.com>
         <439b7f57aa3ba2b2ed5b043f961ef87cb83912af.camel@ndufresne.ca>
         <59e23c5ca5bfbadf9441ea06da2e9b9b5898c6d7.camel@bootlin.com>
         <0b495143bb260cf9f8927ee541e7f001842ac5c3.camel@ndufresne.ca>
         <CAPBb6MVG+3jQcw3AuhYDYCZ0YJ0aX=TmEuM5izh12GLw9V6B8Q@mail.gmail.com>
         <793af82c-6b37-6f69-648e-2cd2a2e87645@xs4all.nl>
         <f30f69af184cc80d5c56853b517943f45c90d9d9.camel@ndufresne.ca>
         <0a39c613-440d-c7a9-a078-b4688874f9e6@xs4all.nl>
         <16a3a61fe354dc545e99aef36aa58c7d4943de26.camel@bootlin.com>
         <d656119e73d491fe307045639ccc2102cb8a8722.camel@ndufresne.ca>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.32.0 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi,

Adding Thierry, Jonas and Jernej to the thread.

For context: this thread (was initially about the v4l2 m2m stateless
video decoder interface) is about defining a way to allow per-slice
video decoding to achieve a low latency. The main issue is that slices
are submitted one-by-one and share the same CAPTURE buffer, which must
only be marked as done once all the slices have finished decoding.

The proposed solution to do that is to pass a flag associated with the
OUTPUT buffer to indicate that the CAPTURE buffer must be held for now.
Once a buffer is passed without the flag set, the matching CAPTURE
buffer is released with the completion of the decoding of that slice.
(When adding support for parallel decoders in the future, we will need
to make sure that all the previously-submitted jobs are done in
addition to the one that should release thr CAPTURE buffer.)

Le lundi 29 avril 2019 à 14:27 -0400, Nicolas Dufresne a écrit :
> Le lundi 29 avril 2019 à 10:48 +0200, Paul Kocialkowski a écrit :
> > Hi,
> > 
> > On Mon, 2019-04-29 at 10:41 +0200, Hans Verkuil wrote:
> > > On 4/27/19 2:06 PM, Nicolas Dufresne wrote:
> > > > Le vendredi 26 avril 2019 à 16:18 +0200, Hans Verkuil a écrit :
> > > > > On 4/16/19 9:22 AM, Alexandre Courbot wrote:
> > > > > 
> > > > > <snip>
> > > > > 
> > > > > > Thanks for this great discussion. Let me try to summarize the status
> > > > > > of this thread + the IRC discussion and add my own thoughts:
> > > > > > 
> > > > > > Proper support for multiple decoding units (e.g. H.264 slices) per
> > > > > > frame should not be an afterthought ; compliance to encoded formats
> > > > > > depend on it, and the benefit of lower latency is a significant
> > > > > > consideration for vendors.
> > > > > > 
> > > > > > m2m, which we use for all stateless codecs, has a strong assumption
> > > > > > that one OUTPUT buffer consumed results in one CAPTURE buffer being
> > > > > > produced. This assumption can however be overruled: at least the venus
> > > > > > driver does it to implement the stateful specification.
> > > > > > 
> > > > > > So we need a way to specify frame boundaries when submitting encoded
> > > > > > content to the driver. One request should contain a single OUTPUT
> > > > > > buffer, containing a single decoding unit, but we need a way to
> > > > > > specify whether the driver should directly produce a CAPTURE buffer
> > > > > > from this request, or keep using the same CAPTURE buffer with
> > > > > > subsequent requests.
> > > > > > 
> > > > > > I can think of 2 ways this can be expressed:
> > > > > > 1) We keep the current m2m behavior as the default (a CAPTURE buffer
> > > > > > is produced), and add a flag to ask the driver to change that behavior
> > > > > > and hold on the CAPTURE buffer and reuse it with the next request(s) ;
> > > > > > 2) We specify that no CAPTURE buffer is produced by default, unless a
> > > > > > flag asking so is specified.
> > > > > > 
> > > > > > The flag could be specified in one of two ways:
> > > > > > a) As a new v4l2_buffer.flag for the OUTPUT buffer ;
> > > > > > b) As a dedicated control, either format-specific or more common to all codecs.
> > > > > > 
> > > > > > I tend to favor 2) and b) for this, for the reason that with H.264 at
> > > > > > least, user-space does not know whether a slice is the last slice of a
> > > > > > frame until it starts parsing the next one, and we don't know when we
> > > > > > will receive it. If we use a control to ask that a CAPTURE buffer be
> > > > > > produced, we can always submit another request with only that control
> > > > > > set once it is clear that the frame is complete (and not delay
> > > > > > decoding meanwhile). In practice I am not that familiar with
> > > > > > latency-sensitive streaming ; maybe a smart streamer would just append
> > > > > > an AUD NAL unit at the end of every frame and we can thus submit the
> > > > > > flag it with the last slice without further delay?
> > > > > > 
> > > > > > An extra constraint to enforce would be that each decoding unit
> > > > > > belonging to the same frame must be submitted with the same timestamp,
> > > > > > otherwise the request submission would fail. We really need a
> > > > > > framework to enforce all this at a higher level than individual
> > > > > > drivers, once we reach an agreement I will start working on this.
> > > > > > 
> > > > > > Formats that do not support multiple decoding units per frame would
> > > > > > reject any request that does not carry the end-of-frame information.
> > > > > > 
> > > > > > Anything missing / any further comment?
> > > > > > 
> > > > > 
> > > > > After reading through this thread and a further irc discussion I now
> > > > > understand the problem. I think there are several ways this can be
> > > > > solved, but I think this is the easiest:
> > > > > 
> > > > > Introduce a new V4L2_BUF_FLAG_HOLD_CAPTURE_BUFFER flag.
> > > > > 
> > > > > If set in the OUTPUT buffer, then don't mark the CAPTURE buffer as
> > > > > done after processing the OUTPUT buffer.
> > > > > 
> > > > > If an OUTPUT buffer was queued with a different timestamp than was
> > > > > used for the currently held CAPTURE buffer, then mark that CAPTURE
> > > > > buffer as done before starting processing this OUTPUT buffer.
> > > > 
> > > > Just a curiosity, can you extend on how this would be handled. If there
> > > > is a number of capture buffer, these should have "no-timestamp". So I
> > > > suspect we need the condition to differentiate no-timestamp from
> > > > previous timestamp. What I'm unclear is to what does it mean "no-
> > > > timestamp". We already stated the timestamp 0 cannot be reserved as
> > > > being an unset timestamp.
> > > 
> > > For OUTPUT buffers there is no such thing as 'no timestamp'. They always
> > > have a timestamp (which may be 0). The currently active CAPTURE buffer
> > > also always has a timestamp as that was copied from the first OUTPUT buffer
> > > for that CAPTURE buffer.
> > > 
> > > > > In other words, for slicing you can just always set this flag and
> > > > > group the slices by the OUTPUT timestamp. If you know that you
> > > > > reached the last slice of a frame, then you can optionally clear the
> > > > > flag to ensure the CAPTURE buffer is marked done without having to wait
> > > > > for the first slice of the next frame to arrive.
> > > > > 
> > > > > Potential disadvantage of this approach is that this relies on the
> > > > > OUTPUT timestamp to be the same for all slices of the same frame.
> > > > > 
> > > > > Which sounds reasonable to me.
> > > > > 
> > > > > In addition add a V4L2_BUF_CAP_SUPPORTS_HOLD_CAPTURE_BUFFER
> > > > > capability to signal support for this flag.
> > > > > 
> > > > > I think this can be fairly easily implemented in v4l2-mem2mem.c.
> > > > > 
> > > > > In addition, this approach is not specific to codecs, it can be
> > > > > used elsewhere as well (composing multiple output buffers into one
> > > > > capture buffer is one use-case that comes to mind).
> > > > > 
> > > > > Comments? Other ideas?
> > > > 
> > > > Sounds reasonable to me. I'll read through Paul's comment now and
> > > > comment if needed.
> > > 
> > > Paul's OK with it as well. The only thing I am not 100% happy with is
> > > the name of the flag. It's a very low-level name: i.e. it does what it
> > > says, but it doesn't say for what purpose.
> > > 
> > > Does anyone have any better suggestions?
> > 
> > Good naming is always so hard to find... I don't have anything better
> > to suggest off the top of my head, but will definitely keep thinking
> > about it.
> > 
> > > Also, who will implement this in v4l2-mem2mem? Paul, where you planning to do that?
> > 
> > Well, I no longer have time chunks allocated to the VPU topic at work,
> > so that means I'll have to do it on spare time and it may take me a
> > while to get there.
> > 
> > So if either one of you would like to pick it up to get it over with
> > faster, feel free to do that!
> 
> Adding Boris in CC. Boris, do you think that could possibly fit into
> your todo while working on the H264 accelerator on RK ? If needed I can
> generate test streams, there is couple of lines of code to remove / add
> in FFMPEG backend if you want to test this properly, though I'm not
> able to run this code atm (it requires a working DRM, and I'm having
> issues with my board in this regard).

Well, that seems like a task that requires in-depth knowledge about how
the v4l2 m2m core and the request API work and some familiary with
it. My feeling is that Boris is pretty new to all of this, so perhaps
it would be best for him to focus on the rockchip driver alone, which
is already a significant piece of work on its own.

It looks like Hans has proposed to come up with something soon, so
things are looking good for us. Once we have that, I think the next
area we need to look into is how we need to rework and refine the
controls. I think it would be good to define common guidelines for
adapting bitstream descriptions into controls with what the hardware
needs to know about precisely.

In spite of that, I would be very interested in knowing what the
rockchip MPEG-2 and H.264 decoders expect precisely. I'm also
interested in learning about Tegra decoders and there are also docs
about the Hantro G1 (MPEG-2 to H.264) and Hantro G2 (H.265) which are
well documented in the i.MX8M docs. It's also used on some Atmel
platforms apparently. So feedback regarding the current controls that
Maxime and I came up with would be welcome.

Cheers,

Paul

