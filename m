Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 12882222CB
	for <lists+linux-media@lfdr.de>; Sat, 18 May 2019 11:50:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728859AbfERJux (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 18 May 2019 05:50:53 -0400
Received: from relay2-d.mail.gandi.net ([217.70.183.194]:46129 "EHLO
        relay2-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728395AbfERJuw (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 18 May 2019 05:50:52 -0400
X-Originating-IP: 93.29.109.196
Received: from aptenodytes (196.109.29.93.rev.sfr.net [93.29.109.196])
        (Authenticated sender: paul.kocialkowski@bootlin.com)
        by relay2-d.mail.gandi.net (Postfix) with ESMTPSA id 6030B40007;
        Sat, 18 May 2019 09:50:37 +0000 (UTC)
Message-ID: <8bcc41efa3f477ca34a3da203a2f3fa91474e502.camel@bootlin.com>
Subject: Re: Proposed updates and guidelines for MPEG-2, H.264 and H.265
 stateless support
From:   Paul Kocialkowski <paul.kocialkowski@bootlin.com>
To:     Nicolas Dufresne <nicolas@ndufresne.ca>,
        Linux Media Mailing List <linux-media@vger.kernel.org>
Cc:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Tomasz Figa <tfiga@chromium.org>,
        Alexandre Courbot <acourbot@chromium.org>,
        Boris Brezillon <boris.brezillon@collabora.com>,
        Maxime Ripard <maxime.ripard@bootlin.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jernej Skrabec <jernej.skrabec@siol.net>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Jonas Karlman <jonas@kwiboo.se>
Date:   Sat, 18 May 2019 11:50:37 +0200
In-Reply-To: <3de878d39d32280b5a83001944dd2b4aea9b3d43.camel@ndufresne.ca>
References: <0be542fabc57c38596bdb1db44aead7054a89158.camel@bootlin.com>
         <3e0d6d5106e9c0c27ef4b11e64a488726ff77103.camel@ndufresne.ca>
         <39ded6d4ddf85849bf45abc94dc8e104fd4c0978.camel@bootlin.com>
         <039e3a9dafe8c518ab2498e09594642ebccbeb18.camel@ndufresne.ca>
         <841578be5f11b4d34ed7cb0a4391f35603682e43.camel@bootlin.com>
         <1f39f90b1418ed971bfbff4f357b2631ed5fc99f.camel@ndufresne.ca>
         <4510502d4c25a4a9616d4175fe09b5ca2b0761a1.camel@bootlin.com>
         <3de878d39d32280b5a83001944dd2b4aea9b3d43.camel@ndufresne.ca>
Organization: Bootlin
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.32.2 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi,

On Fri, 2019-05-17 at 16:43 -0400, Nicolas Dufresne wrote:
> Le jeudi 16 mai 2019 à 20:45 +0200, Paul Kocialkowski a écrit :
> > Hi,
> > 
> > Le jeudi 16 mai 2019 à 14:24 -0400, Nicolas Dufresne a écrit :
> > > Le mercredi 15 mai 2019 à 22:59 +0200, Paul Kocialkowski a écrit :
> > > > Hi,
> > > > 
> > > > Le mercredi 15 mai 2019 à 14:54 -0400, Nicolas Dufresne a écrit :
> > > > > Le mercredi 15 mai 2019 à 19:42 +0200, Paul Kocialkowski a écrit :
> > > > > > Hi,
> > > > > > 
> > > > > > Le mercredi 15 mai 2019 à 10:42 -0400, Nicolas Dufresne a écrit :
> > > > > > > Le mercredi 15 mai 2019 à 12:09 +0200, Paul Kocialkowski a écrit :
> > > > > > > > Hi,
> > > > > > > > 
> > > > > > > > With the Rockchip stateless VPU driver in the works, we now have a
> > > > > > > > better idea of what the situation is like on platforms other than
> > > > > > > > Allwinner. This email shares my conclusions about the situation and how
> > > > > > > > we should update the MPEG-2, H.264 and H.265 controls accordingly.
> > > > > > > > 
> > > > > > > > - Per-slice decoding
> > > > > > > > 
> > > > > > > > We've discussed this one already[0] and Hans has submitted a patch[1]
> > > > > > > > to implement the required core bits. When we agree it looks good, we
> > > > > > > > should lift the restriction that all slices must be concatenated and
> > > > > > > > have them submitted as individual requests.
> > > > > > > > 
> > > > > > > > One question is what to do about other controls. I feel like it would
> > > > > > > > make sense to always pass all the required controls for decoding the
> > > > > > > > slice, including the ones that don't change across slices. But there
> > > > > > > > may be no particular advantage to this and only downsides. Not doing it
> > > > > > > > and relying on the "control cache" can work, but we need to specify
> > > > > > > > that only a single stream can be decoded per opened instance of the
> > > > > > > > v4l2 device. This is the assumption we're going with for handling
> > > > > > > > multi-slice anyway, so it shouldn't be an issue.
> > > > > > > 
> > > > > > > My opinion on this is that the m2m instance is a state, and the driver
> > > > > > > should be responsible of doing time-division multiplexing across
> > > > > > > multiple m2m instance jobs. Doing the time-division multiplexing in
> > > > > > > userspace would require some sort of daemon to work properly across
> > > > > > > processes. I also think the kernel is better place for doing resource
> > > > > > > access scheduling in general.
> > > > > > 
> > > > > > I agree with that yes. We always have a single m2m context and specific
> > > > > > controls per opened device so keeping cached values works out well.
> > > > > > 
> > > > > > So maybe we shall explicitly require that the request with the first
> > > > > > slice for a frame also contains the per-frame controls.
> > > > > > 
> > > > > > > > - Annex-B formats
> > > > > > > > 
> > > > > > > > I don't think we have really reached a conclusion on the pixel formats
> > > > > > > > we want to expose. The main issue is how to deal with codecs that need
> > > > > > > > the full slice NALU with start code, where the slice_header is
> > > > > > > > duplicated in raw bitstream, when others are fine with just the encoded
> > > > > > > > slice data and the parsed slice header control.
> > > > > > > > 
> > > > > > > > My initial thinking was that we'd need 3 formats:
> > > > > > > > - One that only takes only the slice compressed data (without raw slice
> > > > > > > > header and start code);
> > > > > > > > - One that takes both the NALU data (including start code, raw header
> > > > > > > > and compressed data) and slice header controls;
> > > > > > > > - One that takes the NALU data but no slice header.
> > > > > > > > 
> > > > > > > > But I no longer think the latter really makes sense in the context of
> > > > > > > > stateless video decoding.
> > > > > > > > 
> > > > > > > > A side-note: I think we should definitely have data offsets in every
> > > > > > > > case, so that implementations can just push the whole NALU regardless
> > > > > > > > of the format if they're lazy.
> > > > > > > 
> > > > > > > I realize that I didn't share our latest research on the subject. So a
> > > > > > > slice in the original bitstream is formed of the following blocks
> > > > > > > (simplified):
> > > > > > > 
> > > > > > >   [nal_header][nal_type][slice_header][slice]
> > > > > > 
> > > > > > Thanks for the details!
> > > > > > 
> > > > > > > nal_header:
> > > > > > > This one is a header used to locate the start and the end of the of a
> > > > > > > NAL. There is two standard forms, the ANNEX B / start code, a sequence
> > > > > > > of 3 bytes 0x00 0x00 0x01, you'll often see 4 bytes, the first byte
> > > > > > > would be a leading 0 from the previous NAL padding, but this is also
> > > > > > > totally valid start code. The second form is the AVC form, notably used
> > > > > > > in ISOMP4 container. It simply is the size of the NAL. You must keep
> > > > > > > your buffer aligned to NALs in this case as you cannot scan from random
> > > > > > > location.
> > > > > > > 
> > > > > > > nal_type:
> > > > > > > It's a bit more then just the type, but it contains at least the
> > > > > > > information of the nal type. This has different size on H.264 and HEVC
> > > > > > > but I know it's size is in bytes.
> > > > > > > 
> > > > > > > slice_header:
> > > > > > > This contains per slice parameters, like the modification lists to
> > > > > > > apply on the references. This one has a size in bits, not in bytes.
> > > > > > > 
> > > > > > > slice:
> > > > > > > I don't really know what is in it exactly, but this is the data used to
> > > > > > > decode. This bit has a special coding called the anti-emulation, which
> > > > > > > prevents a start-code from appearing in it. This coding is present in
> > > > > > > both forms, ANNEX-B or AVC (in GStreamer and some reference manual they
> > > > > > > call ANNEX-B the bytestream format).
> > > > > > > 
> > > > > > > So, what we notice is that what is currently passed through Cedrus
> > > > > > > driver:
> > > > > > >   [nal_type][slice_header][slice]
> > > > > > > 
> > > > > > > This matches what is being passed through VA-API. We can understand
> > > > > > > that stripping off the slice_header would be hard, since it's size is
> > > > > > > in bits. Instead we pass size and header_bit_size in slice_params.
> > > > > > 
> > > > > > True, there is that.
> > > > > > 
> > > > > > > About Rockchip. RK3288 is a Hantro G1 and has a bit called
> > > > > > > start_code_e, when you turn this off, you don't need start code. As a
> > > > > > > side effect, the bitstream becomes identical. We do now know that it
> > > > > > > works with the ffmpeg branch implement for cedrus.
> > > > > > 
> > > > > > Oh great, that makes life easier in the short term, but I guess the
> > > > > > issue could arise on another decoder sooner or later.
> > > > > > 
> > > > > > > Now what's special about Hantro G1 (also found on IMX8M) is that it
> > > > > > > take care for us of reading and executing the modification lists found
> > > > > > > in the slice header. Mostly because I very disliked having to pass the
> > > > > > > p/b0/b1 parameters, is that Boris implemented in the driver the
> > > > > > > transformation from the DPB entries into this p/b0/b1 list. These list
> > > > > > > a standard, it's basically implementing 8.2.4.1 and 8.2.4.2. the
> > > > > > > following section is the execution of the modification list. As this
> > > > > > > list is not modified, it only need to be calculated per frame. As a
> > > > > > > result, we don't need these new lists, and we can work with the same
> > > > > > > H264_SLICE format as Cedrus is using.
> > > > > > 
> > > > > > Yes but I definitely think it makes more sense to pass the list
> > > > > > modifications rather than reconstructing those in the driver from a
> > > > > > full list. IMO controls should stick to the bitstream as close as
> > > > > > possible.
> > > > > 
> > > > > For Hantro and RKVDEC, the list of modification is parsed by the IP
> > > > > from the slice header bits. Just to make sure, because I myself was
> > > > > confused on this before, the slice header does not contain a list of
> > > > > references, instead it contains a list modification to be applied to
> > > > > the reference list. I need to check again, but to execute these
> > > > > modification, you need to filter and sort the references in a specific
> > > > > order. This should be what is defined in the spec as 8.2.4.1 and
> > > > > 8.2.4.2. Then 8.2.4.3 is the process that creates the l0/l1.
> > > > > 
> > > > > The list of references is deduced from the DPB. The DPB, which I thinks
> > > > > should be rename as "references", seems more useful then p/b0/b1, since
> > > > > this is the data that gives use the ability to implementing glue in the
> > > > > driver to compensate some HW differences.
> > > > > 
> > > > > In the case of Hantro / RKVDEC, we think it's natural to build the HW
> > > > > specific lists (p/b0/b1) from the references rather then adding HW
> > > > > specific list in the decode_params structure. The fact these lists are
> > > > > standard intermediate step of the standard is not that important.
> > > > 
> > > > Sorry I got confused (once more) about it. Boris just explained the
> > > > same thing to me over IRC :) Anyway my point is that we want to pass
> > > > what's in ffmpeg's short and long term ref lists, and name them that
> > > > instead of dpb.
> > > > 
> > > > > > > Now, this is just a start. For RK3399, we have a different CODEC
> > > > > > > design. This one does not have the start_code_e bit. What the IP does,
> > > > > > > is that you give it one or more slice per buffer, setup the params,
> > > > > > > start decoding, but the decoder then return the location of the
> > > > > > > following NAL. So basically you could offload the scanning of start
> > > > > > > code to the HW. That being said, with the driver layer in between, that
> > > > > > > would be amazingly inconvenient to use, and with Boyer-more algorithm,
> > > > > > > it is pretty cheap to scan this type of start-code on CPU. But the
> > > > > > > feature that this allows is to operate in frame mode. In this mode, you
> > > > > > > have 1 interrupt per frame.
> > > > > > 
> > > > > > I'm not sure there is any interest in exposing that from userspace and
> > > > > > my current feeling is that we should just ditch support for per-frame
> > > > > > decoding altogether. I think it mixes decoding with notions that are
> > > > > > higher-level than decoding, but I agree it's a blurry line.
> > > > > 
> > > > > I'm not worried about this either. We can already support that by
> > > > > copying the bitstream internally to the driver, though zero-copy with
> > > > > this would require a new format, the one we talked about,
> > > > > SLICE_ANNEX_B.
> > > > 
> > > > Right, but what I'm thinking about is making that the one and only
> > > > format. The rationale is that it's always easier to just append a start
> > > > code from userspace if needed. And we need a bit offset to the slice
> > > > data part anyway, so it doesn't hurt to require a few extra bits to
> > > > have the whole thing that will work in every situation.
> > > 
> > > What I'd like is to eventually allow zero-copy (aka userptr) into the
> > > driver. If you make the start code mandatory, any decoding from ISOMP4
> > > (.mp4, .mov) will require a full bitstream copy in userspace to add the
> > > start code (unless you hack your allocation in your demuxer, but it's a
> > > bit complicated since this code might come from two libraries). In
> > > ISOMP4, you have an AVC header, which is just the size of the NAL that
> > > follows.
> > 
> > Well, I think we have to do a copy from system memory to the buffer
> > allocated by v4l2 anyway. Our hardware pipelines can reasonably be
> > expected not to have any MMU unit and not allow sg import anyway.
> 
> The Rockchip has an mmu. You need one copy at least indeed, 

Is the MMU in use currently? That can make things troublesome if we run
into a case where the VPU has MMU and deals with scatter-gather while
the display part doesn't. As far as I know, there's no way for
userspace to know whether a dma-buf-exported buffer is backed by CMA or
by scatter-gather memory. This feels like a major issue for using dma-
buf, since userspace can't predict whether a buffer exported on one
device can be imported on another when building its pipeline.

> e.g. file
> to mem, or udpsocket to mem. But right now, let's say with ffmpeg/mpeg-
> ts, first you need to copy the MPEG TS to mem, then to demux you copy
> that H264 stream to another buffer, you then copy in the parser,
> removing the start-code and finally copy in the accelerator, adding the
> start code. If the driver would allow userptr, it would be unusable.
> 
> GStreamer on the other side implement lazy conversion, so it would copy
> the mpegts to mem, copy to demux, aggregate (with lazy merging) in the
> parser (but stream format is negotiation, so it keeps the start-code).
> If you request alignment=au, you have full frame of buffers, so if your
> driver could do userptr, you can same that extra copy.
> 
> Now, if we demux an MP4 it's the same, the parser will need do a full
> copy instead of lazy aggregation in order to prepend the start code
> (since it had an AVC header). But userptr could save a copy.
> 
> If the driver requires no nal prefix, then we could just pass a
> slightly forward point to userptr and avoid ACV to ANNEX-B conversion,
> which is a bit slower (even know it's nothing compare to the full
> copies we already do.
> 
> That was my argument in favour for no NAL prefix in term of efficiency,
> and it does not prevent adding a control to enable start-code for cases
> it make sense.

I see, so the internal arcitecture of userspace software may not be a
good fit for adding these bits and it could hurt performance a bit.
That feels like a significant downside.

> > So with that in mind, asking userspace to add a startcode it already
> > knows doesn't seem to be asking too much.
> > 
> > > On the other end, the data_offset thing is likely just a thing for the
> > > RK3399 to handle, it does not affect RK3288, Cedrus or IMX8M.
> > 
> > Well, I think it's best to be fool-proof here and just require that
> > start code. We should also have per-slice bit offsets to the different
> > parts anyway, so drivers that don't need it can just ignore it.
> > 
> > In extreme cases where there is some interest in doing direct buffer
> > import without doing a copy in userspace, userspace could trick the
> > format and avoid a copy by not providing the start-code (assuming it
> > knows it doesn't need it) and specifying the bit offsets accordingly.
> > That'd be a hack for better performance, and it feels better to do
> > things in this order rather than having to hack around in the drivers
> > that need the start code in every other case.
> 
> So basically, you and Tomas are both strongly in favour of adding
> ANNEX-B start-code to the current uAPI. I have digged into Cedrus
> registers, and it seems that it does have start-code scanning support.
> I'm not sure it can do "full-frame" decoding, 1 interrupt per frame
> like the RK do. That requires the IP to deal with the modifications
> lists, which are per slices.

Actually the bitstream parser won't reconfigure the pipeline
configuration registers, it's only around for userspace to avoid
implementing bitstream parsing, but it's a standalone thing.

So if we want to do full-frame decoding we always need to reconfigure
our pipeline (or do it like we do currently and just use one of the
per-slice configuration and hope for the best).

Do we have more information on the RK3399 and what it requires exactly?
(Just to make sure it's not another issue altogether.)

> My question is, are you willing to adapt the Cedrus driver to support
> receiving start-code ? And will this have a performance impact or not ?
> On RK side, it's really just about flipping 1 bit.
> 
> On the Rockchip side, Tomas had concern about CPU wakeup and the fact
> that we didn't aim at supporting passing multiple slices at once to the
> IP (something RK supports). It's important to understand that multi-
> slice streams are relatively rare and mostly used for low-latency /
> video conferencing. So aggregating in these case defeats the purpose of
> using slices. So I think RK feature is not very important.

Agreed, let's aim for low-latency as a standard.

> Of course, I do believe that long term we will want to expose bot
> stream formats on RK (because the HW can do that), so then userspace
> can just pick the best when available. So that boils down to our first
> idea, shall we expose _SLICE_A and _SLICE_B or something like this ?
> Now that we have progressed on the matter, I'm quite in favour of
> having _SLICE in the first place, with the preferred format that
> everyone should support, and allow for variants later. Now, if we make
> one mandatory, we could also just have a menu control to allow other
> formats.

That seems fairly reasonable to me, and indeed, having one preferred
format at first seems to be a good move.

> > > > To me the breaking point was about having the slice header both in raw
> > > > bitstream and parsed forms. Since we agree that's fine, we might as
> > > > well push it to its logical conclusion and include all the bits that
> > > > can be useful.
> > > 
> > > To take your words, the bits that contain useful information starts
> > > from the NAL type byte, exactly were the data was cut by VA-API and the
> > > current uAPI.
> > 
> > Agreed, but I think that the advantages of always requiring the start
> > code outweigh the potential (yet quite unlikely) downsides.
> > 
> > > > > > > But it also support slice mode, with an
> > > > > > > interrupt per slice, which is what we decided to use.
> > > > > > 
> > > > > > Easier for everyone and probably better for latency as well :)
> > > > > > 
> > > > > > > So in this case, indeed we strictly require on start-code. Though, to
> > > > > > > me this is not a great reason to make a new fourcc, so we will try and
> > > > > > > use (data_offset = 3) in order to make some space for that start code,
> > > > > > > and write it down in the driver. This is to be continued, we will
> > > > > > > report back on this later. This could have some side effect in the
> > > > > > > ability to import buffers. But most userspace don't try to do zero-copy 
> > > > > > > on the encoded size and just copy anyway.
> > > > > > > 
> > > > > > > To my opinion, having a single format is a big deal, since userspace
> > > > > > > will generally be developed for one specific HW and we would endup with
> > > > > > > fragmented support. What we really want to achieve is having a driver
> > > > > > > interface which works across multiple HW, and I think this is quite
> > > > > > > possible.
> > > > > > 
> > > > > > I agree with that. The more I think about it, the more I believe we
> > > > > > should just pass the whole [nal_header][nal_type][slice_header][slice]
> > > > > > and the parsed list in every scenario.
> > > > > 
> > > > > What I like of the cut at nal_type, is that there is only format. If we
> > > > > cut at nal_header, then we need to expose 2 formats. And it makes our
> > > > > API similar to other accelerator API, so it's easy to "convert"
> > > > > existing userspace.
> > > > 
> > > > Unless we make that cut the single one and only true cut that shall
> > > > supersed all other cuts :)
> > > 
> > > That's basically what I've been trying to do, kill this _RAW/ANNEX_B
> > > thing and go back to our first idea.
> > 
> > Right, in the end I think we should go with:
> > V4L2_PIX_FMT_MPEG2_SLICE
> > V4L2_PIX_FMT_H264_SLICE
> > V4L2_PIX_FMT_HEVC_SLICE
> > 
> > And just require raw bitstream for the slice with emulation-prevention
> > bits included.
> 
> That's should be the set of format we start with indeed. The single
> format for which software gets written and tested, making sure software
> support is not fragmented, and other variants should be something to
> opt-in.

Cheers for that!

Paul

> > Cheers,
> > 
> > Paul
> > 
> > > > > > For H.265, our decoder needs some information from the NAL type too.
> > > > > > We currently extract that in userspace and stick it to the
> > > > > > slice_header, but maybe it would make more sense to have drivers parse
> > > > > > that info from the buffer if they need it. On the other hand, it seems
> > > > > > quite common to pass information from the NAL type, so maybe we should
> > > > > > either make a new control for it or have all the fields in the
> > > > > > slice_header (which would still be wrong in terms of matching bitstream
> > > > > > description).
> > > > > 
> > > > > Even in userspace, it's common to just parse this in place, it's a
> > > > > simple mask. But yes, if we don't have it yet, we should expose the NAL
> > > > > type, it would be cleaner.
> > > > 
> > > > Right, works for me.
> > > 
> > > Ack.
> > > 
> > > > Cheers,
> > > > 
> > > > Paul
> > > > 
> > > > > > > > - Dropping the DPB concept in H.264/H.265
> > > > > > > > 
> > > > > > > > As far as I could understand, the decoded picture buffer (DPB) is a
> > > > > > > > concept that only makes sense relative to a decoder implementation. The
> > > > > > > > spec mentions how to manage it with the Hypothetical reference decoder
> > > > > > > > (Annex C), but that's about it.
> > > > > > > > 
> > > > > > > > What's really in the bitstream is the list of modified short-term and
> > > > > > > > long-term references, which is enough for every decoder.
> > > > > > > > 
> > > > > > > > For this reason, I strongly believe we should stop talking about DPB in
> > > > > > > > the controls and just pass these lists agremented with relevant
> > > > > > > > information for userspace.
> > > > > > > > 
> > > > > > > > I think it should be up to the driver to maintain a DPB and we could
> > > > > > > > have helpers for common cases. For instance, the rockchip decoder needs
> > > > > > > > to keep unused entries around[2] and cedrus has the same requirement
> > > > > > > > for H.264. However for cedrus/H.265, we don't need to do any book-
> > > > > > > > keeping in particular and can manage with the lists from the bitstream
> > > > > > > > directly.
> > > > > > > 
> > > > > > > As discusses today, we still need to pass that list. It's being index
> > > > > > > by the HW to retrieve the extra information we have collected about the
> > > > > > > status of the reference frames. In the case of Hantro, which process
> > > > > > > the modification list from the slice header for us, we also need that
> > > > > > > list to construct the unmodified list.
> > > > > > > 
> > > > > > > So the problem here is just a naming problem. That list is not really a
> > > > > > > DPB. It is just the list of long-term/short-term references with the
> > > > > > > status of these references. So maybe we could just rename as
> > > > > > > references/reference_entry ?
> > > > > > 
> > > > > > What I'd like to pass is the diff to the references list, as ffmpeg
> > > > > > currently provides for v4l2 request and vaapi (probably vdpau too). No
> > > > > > functional change here, only that we should stop calling it a DPB,
> > > > > > which confuses everyone.
> > > > > 
> > > > > Yes.
> > > > > 
> > > > > > > > - Using flags
> > > > > > > > 
> > > > > > > > The current MPEG-2 controls have lots of u8 values that can be
> > > > > > > > represented as flags. Using flags also helps with padding.
> > > > > > > > It's unlikely that we'll get more than 64 flags, so using a u64 by
> > > > > > > > default for that sounds fine (we definitely do want to keep some room
> > > > > > > > available and I don't think using 32 bits as a default is good enough).
> > > > > > > > 
> > > > > > > > I think H.264/HEVC per-control flags should also be moved to u64.
> > > > > > > 
> > > > > > > Make sense, I guess bits (member : 1) are not allowed in uAPI right ?
> > > > > > 
> > > > > > Mhh, even if they are, it makes it much harder to verify 32/64 bit
> > > > > > alignment constraints (we're dealing with 64-bit platforms that need to
> > > > > > have 32-bit userspace and compat_ioctl).
> > > > > 
> > > > > I see, thanks.
> > > > > 
> > > > > > > > - Clear split of controls and terminology
> > > > > > > > 
> > > > > > > > Some codecs have explicit NAL units that are good fits to match as
> > > > > > > > controls: e.g. slice header, pps, sps. I think we should stick to the
> > > > > > > > bitstream element names for those.
> > > > > > > > 
> > > > > > > > For H.264, that would suggest the following changes:
> > > > > > > > - renaming v4l2_ctrl_h264_decode_param to v4l2_ctrl_h264_slice_header;
> > > > > > > 
> > > > > > > Oops, I think you meant slice_prams ? decode_params matches the
> > > > > > > information found in SPS/PPS (combined?), while slice_params matches
> > > > > > > the information extracted (and executed in case of l0/l1) from the
> > > > > > > slice headers.
> > > > > > 
> > > > > > Yes you're right, I mixed them up.
> > > > > > 
> > > > > > >  That being said, to me this name wasn't confusing, since
> > > > > > > it's not just the slice header, and it's per slice.
> > > > > > 
> > > > > > Mhh, what exactly remains in there and where does it originate in the
> > > > > > bitstream? Maybe it wouldn't be too bad to have one control per actual
> > > > > > group of bitstream elements.
> > > > > > 
> > > > > > > > - killing v4l2_ctrl_h264_decode_param and having the reference lists
> > > > > > > > where they belong, which seems to be slice_header;
> > > > > > > 
> > > > > > > There reference list is only updated by userspace (through it's DPB)
> > > > > > > base on the result of the last decoding step. I was very confused for a
> > > > > > > moment until I realize that the lists in the slice_header are just a
> > > > > > > list of modification to apply to the reference list in order to produce
> > > > > > > l0 and l1.
> > > > > > 
> > > > > > Indeed, and I'm suggesting that we pass the modifications only, which
> > > > > > would fit a slice_header control.
> > > > > 
> > > > > I think I made my point why we want the dpb -> references. I'm going to
> > > > > validate with the VA driver now, to see if the references list there is
> > > > > usable with our code.
> > > > > 
> > > > > > Cheers,
> > > > > > 
> > > > > > Paul
> > > > > > 
> > > > > > > > I'm up for preparing and submitting these control changes and updating
> > > > > > > > cedrus if they seem agreeable.
> > > > > > > > 
> > > > > > > > What do you think?
> > > > > > > > 
> > > > > > > > Cheers,
> > > > > > > > 
> > > > > > > > Paul
> > > > > > > > 
> > > > > > > > [0]: https://lkml.org/lkml/2019/3/6/82
> > > > > > > > [1]: https://patchwork.linuxtv.org/patch/55947/
> > > > > > > > [2]: https://chromium.googlesource.com/chromiumos/third_party/kernel/+/4d7cb46539a93bb6acc802f5a46acddb5aaab378
> > > > > > > > 
-- 
Paul Kocialkowski, Bootlin
Embedded Linux and kernel engineering
https://bootlin.com

