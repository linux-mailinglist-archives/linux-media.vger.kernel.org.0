Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5737E33895
	for <lists+linux-media@lfdr.de>; Mon,  3 Jun 2019 20:52:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726269AbfFCSwu (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 3 Jun 2019 14:52:50 -0400
Received: from mail-qt1-f180.google.com ([209.85.160.180]:42712 "EHLO
        mail-qt1-f180.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726112AbfFCSwu (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 3 Jun 2019 14:52:50 -0400
Received: by mail-qt1-f180.google.com with SMTP id s15so10682545qtk.9
        for <linux-media@vger.kernel.org>; Mon, 03 Jun 2019 11:52:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20150623.gappssmtp.com; s=20150623;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version;
        bh=QejNKUQEOWCSKbh18b++nlh02rImI1FLBXGjrnlb5zI=;
        b=R6gpwEE0hm3elDN9uw0OO+VsL9tfw2FHTe8pqg+/EBvMUBlgqcr4U6xC/52VXJDeqn
         p/uy5SwolCAKnFZE473NteKLbf0PXLhpkKP6TQdWDlcZzUkenynUQKRIzQ7Hm3ybqDvX
         Uxv8CaODNA53Wn0EjJP6xvcwoc1B1BlfvmW1Xty+6pTJ0hno6gjKsuDIO4t9fxUBJBt2
         VdnDPzoJAWuSiljjEuVbmXybQncrcghf8oIMgtq49EgOezHq5JPN1kHg7XiMCgTap8Um
         0OZxcyfLMfjiZ5SUa40n4B5UgEETQbKkjRdFd9OeF9CaUIcu0iNDMs6A8OehHknN1+O1
         vKcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version;
        bh=QejNKUQEOWCSKbh18b++nlh02rImI1FLBXGjrnlb5zI=;
        b=adG5WkbSIreEn+RBmPqGfyYVN1anaZtoUpTz7cdMzwx3cW1Qnx6vez7w0NYQbEk3F6
         iP9WsYP1x12cApL4BkwxU4bp4tQcK897aKtu0jhBILIKzHBHyV1vPgXyydnfqhRQhyeZ
         pBcrl2sTNcBdEC4tRVyPnF/6+fQfG6+xB2r68IzXVHgMMErx50JOfeRiCulJiYSu/zMr
         medBdOogo03kIWYRqXTVvKi6O/dxmSQ7VYoEBNadhFNMKcds0H6dE4vt8AhwapTlHlb4
         KtrGnzN/5gAXGVo0b1pYrBy2avAhyl9HWu/FQhDKkP/Qr6y5kqi1xbZBEtMHpZwJWOKC
         ErEA==
X-Gm-Message-State: APjAAAUOVcfXNJJK4JkEG4Djif6RT5b1uS8+orRAenB6JDRDNfei9/7G
        Uqnm+H45NKxwxj+cDvwHiGlRUQ==
X-Google-Smtp-Source: APXvYqxbvVl4NzpdcFr8ZbecIlk389UZkSTN3UcttNr/j8wk+3/nitQGvnZepgWDqVAytdsD3g6c5Q==
X-Received: by 2002:aed:2339:: with SMTP id h54mr23508331qtc.200.1559587968860;
        Mon, 03 Jun 2019 11:52:48 -0700 (PDT)
Received: from tpx230-nicolas (modemcable154.55-37-24.static.videotron.ca. [24.37.55.154])
        by smtp.gmail.com with ESMTPSA id b2sm11721660qtb.7.2019.06.03.11.52.46
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Mon, 03 Jun 2019 11:52:47 -0700 (PDT)
Message-ID: <a2f6bac6596da86d597d9ac4c12b1f72b772dbe5.camel@ndufresne.ca>
Subject: Re: Proposed updates and guidelines for MPEG-2, H.264 and H.265
 stateless support
From:   Nicolas Dufresne <nicolas@ndufresne.ca>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>
Cc:     Linux Media Mailing List <linux-media@vger.kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Tomasz Figa <tfiga@chromium.org>,
        Alexandre Courbot <acourbot@chromium.org>,
        Boris Brezillon <boris.brezillon@collabora.com>,
        Maxime Ripard <maxime.ripard@bootlin.com>,
        Jernej Skrabec <jernej.skrabec@siol.net>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Jonas Karlman <jonas@kwiboo.se>
Date:   Mon, 03 Jun 2019 14:52:44 -0400
In-Reply-To: <20190603112449.GA30132@ulmo>
References: <0be542fabc57c38596bdb1db44aead7054a89158.camel@bootlin.com>
         <20190603112449.GA30132@ulmo>
Content-Type: multipart/signed; micalg="pgp-sha1"; protocol="application/pgp-signature";
        boundary="=-XPFvKaYUrSJ8B8Jw44xk"
User-Agent: Evolution 3.32.2 (3.32.2-1.fc30) 
MIME-Version: 1.0
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


--=-XPFvKaYUrSJ8B8Jw44xk
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le lundi 03 juin 2019 =C3=A0 13:24 +0200, Thierry Reding a =C3=A9crit :
> On Wed, May 15, 2019 at 12:09:45PM +0200, Paul Kocialkowski wrote:
> > Hi,
> >=20
> > With the Rockchip stateless VPU driver in the works, we now have a
> > better idea of what the situation is like on platforms other than
> > Allwinner. This email shares my conclusions about the situation and how
> > we should update the MPEG-2, H.264 and H.265 controls accordingly.
> >=20
> > - Per-slice decoding
> >=20
> > We've discussed this one already[0] and Hans has submitted a patch[1]
> > to implement the required core bits. When we agree it looks good, we
> > should lift the restriction that all slices must be concatenated and
> > have them submitted as individual requests.
> >=20
> > One question is what to do about other controls. I feel like it would
> > make sense to always pass all the required controls for decoding the
> > slice, including the ones that don't change across slices. But there
> > may be no particular advantage to this and only downsides. Not doing it
> > and relying on the "control cache" can work, but we need to specify
> > that only a single stream can be decoded per opened instance of the
> > v4l2 device. This is the assumption we're going with for handling
> > multi-slice anyway, so it shouldn't be an issue.
> >=20
> > - Annex-B formats
> >=20
> > I don't think we have really reached a conclusion on the pixel formats
> > we want to expose. The main issue is how to deal with codecs that need
> > the full slice NALU with start code, where the slice_header is
> > duplicated in raw bitstream, when others are fine with just the encoded
> > slice data and the parsed slice header control.
> >=20
> > My initial thinking was that we'd need 3 formats:
> > - One that only takes only the slice compressed data (without raw slice
> > header and start code);
> > - One that takes both the NALU data (including start code, raw header
> > and compressed data) and slice header controls;
> > - One that takes the NALU data but no slice header.
> >=20
> > But I no longer think the latter really makes sense in the context of
> > stateless video decoding.
> >=20
> > A side-note: I think we should definitely have data offsets in every
> > case, so that implementations can just push the whole NALU regardless
> > of the format if they're lazy.
>=20
> I started an NVIDIA internal discussion about this to get some thoughts
> from our local experts and to fill in my gaps in understanding of NVIDIA
> hardware that we might want to support.
>=20
> As far as input format goes, there was pretty broad consensus that in
> order for the ABI to be most broadly useful we need to settle on the
> lowest common denominator, while drawing some inspiration from existing
> APIs because they've already gone through a lot of these discussions and
> came up with standard interfaces to deal with the differences between
> decoders.

Note that we are making a statement with the sateless/stateful split.
The userspace overhead is non-negligible if you start passing all this
useless data to a stateful HW. About other implementation, that's what
we went through in order to reach the state we are at now.

It's interesting that you have this dicussion with NVIDIA specialist,
that being said, I think it would be better to provide with the actual
data (how different generation of HW works) before providing
conclusions made by your team. Right now, we have deeply studied
Cedrus, Hantro and Rockchip IP, and that's how we manage to reach this
low overhead compromise. What we really want to see, is if there exist
NVidia HW, that does not fit any of the two interface, and why.

>=20
> In more concrete terms this means that we'll want to provide as much
> data to the kernel as possible. On one hand that means that we need to
> do all of the header parsing etc. in userspace and pass it to the kernel
> to support hardware that can't parse this data by itself. At the same
> time we want to provide the full bitstream to the kernel to make sure
> that hardware that does some (or all) of the parsing itself has access
> to this. We absolutely want to avoid having to reconstruct some of the
> bitstream that userspace may not have passed in order to optimize for
> some usecases.

Passing the entire bitstream without reconstruction is near impossible
for a VDPAU or VAAPI driver. Even for FFMPEG, it makes everything much
more complex. I think at some point we need to draw a line what this
new API should cover.

An example here, we have decided to support a new format H264_SLICE,
and this format has been defined as "slice only" stream where pps,sps
et. would be described in C structure. There is nothing that prevents
adding other formats in the future. What we would like is that this
remains as inclusive as possible to the "slice" accelerators we know,
hence adding "per-frame" decoding, since we know the "per-slice"
decoding is compatible. We also know that this does not add more work
to existing userspace code the supports similar accelerator.

In fact, the first thing we kept in mind in our work is that it's very
difficult to implement this userspace, so keeping in mind compatibility
with VAAPI/VDPAU existing userspace (like the accelerator in FFMPEG and
GStreamer) felt like essential to lead toward fully Open Source
solution.

>=20
> Also, all bitstream parsing should be done in userspace, we don't want
> to require the kernel to have to deal with this. There's nothing in the
> bitstream that would be hardware-specific, so can all be done perfectly
> fine in userspace.
>=20
> As for an interface on what to pass along, most people suggested that we
> pass both the raw bitstream along with a descriptor of what's contained
> in that bitstream. That descriptor would contain the number of slices
> contained in the bitstream chunk as well as per-slice data (such as the
> offset in the bitstream chunk for that slice and the number/ID of the
> slice). This is in addition to the extra meta data that we already pass
> for the codecs (PPS, SPS, ...). The slice information would allow
> drivers to point the hardware directly at the slice data if that's all
> it needs, but it can also be used for error concealment if corrupted
> slices are encountered. This would obviously require that controls can
> be passed on a per-buffer basis. I'm not sure if that's possible since
> the request API was already introduced to allow controls to be passed in
> a more fine-grained manner than setting them globally. I'm not sure how
> to pass per-buffer data in a nice way otherwise, but perhaps this is not
> even a real problem?
>=20
> The above is pretty close to the Mesa pipe_video infrastructure as well
> as VAAPI and VDPAU, so I would expect most userspace to be able to deal
> well with such an ABI.
>=20
> Userspace applications would decide what the appropriate way is to pass
> bitstream data. Network streaming applications may decide to send slices
> individually, so number of slices =3D 1 and the descriptor would contain =
a
> single entry for only that slice. For file-based playback userspace may
> decide to forward the complete bitstream for a full frame, in which case
> the descriptor would contain entries for all slices that make up the
> frame.
>=20
> On the driver side, the above interface gives drivers the flexibility to
> implement what works best for them. Decoders that support scatter-gather
> can be programmed for each buffer that they receive. IOMMU-capable
> decoders can use the IOMMU to achieve something similar. And for very
> simple decoders, the driver can always decide to concatenate in the
> kernel and pass a single buffer with the complete bitstream for a full
> frame if that's what the hardware needs.
>=20
> The kernel can obviously assist userspace with making smart decisions by
> advertising the capabilities of the kernel driver, but I think the above
> is flexible enough to at least work in all cases, even if perhaps not at
> the absolute best efficiency.
>=20
> Allowing userspace to be flexible about how to pass this data will help
> avoid situations like where data is contiguous in memory (such as would
> be common for file-based playback) and then userspace having to break
> this up into individual slices and the kernel having to concatenate all
> of the slices, where it would be much easier to just use the contiguous
> data directly (via something like userptr).



>=20
> > - Dropping the DPB concept in H.264/H.265
> >=20
> > As far as I could understand, the decoded picture buffer (DPB) is a
> > concept that only makes sense relative to a decoder implementation. The
> > spec mentions how to manage it with the Hypothetical reference decoder
> > (Annex C), but that's about it.
> >=20
> > What's really in the bitstream is the list of modified short-term and
> > long-term references, which is enough for every decoder.
> >=20
> > For this reason, I strongly believe we should stop talking about DPB in
> > the controls and just pass these lists agremented with relevant
> > information for userspace.
> >=20
> > I think it should be up to the driver to maintain a DPB and we could
> > have helpers for common cases. For instance, the rockchip decoder needs
> > to keep unused entries around[2] and cedrus has the same requirement
> > for H.264. However for cedrus/H.265, we don't need to do any book-
> > keeping in particular and can manage with the lists from the bitstream
> > directly.
>=20
> There was a bit of concern regarding this. Given that DPB maintenance is
> purely a software construct, this doesn't really belong in the kernel. A
> DPB will be the same no matter what hardware operates on the bitstream.
> Depending on the hardware it may use the DPB differently (or maybe not
> at all), but that's beside the point, really. This is pretty much the
> same rationale as discussed above for meta data.
>=20
> Again, VAAPI and VDPAU don't require drivers to deal with this. Instead
> they just get the final list of reference pictures, ready to use.

I think we need a bit of clarification from Boris, as what I read here
is a bit contradictory (or at least I am a bit confused). When I first
read this, I understood that this was just about renaming the dpb as
being the references list and only require the active references to be
there.

So what I'm not clear is where exactly this "active reference list"
comes from. In VAAPI it is describe "per-frame" ....

>=20
> > - Using flags
> >=20
> > The current MPEG-2 controls have lots of u8 values that can be
> > represented as flags. Using flags also helps with padding.
> > It's unlikely that we'll get more than 64 flags, so using a u64 by
> > default for that sounds fine (we definitely do want to keep some room
> > available and I don't think using 32 bits as a default is good enough).
> >=20
> > I think H.264/HEVC per-control flags should also be moved to u64.
>=20
> There was also some concensus on this, that u64 should be good enough
> for anything out there, though we obviously don't know what the future
> will hold, so perhaps adding some way for possible extending this in the
> future might be good. I guess we'll get new controls for new codecs
> anyway, so we can punt on this until then.
>=20
> > - Clear split of controls and terminology
> >=20
> > Some codecs have explicit NAL units that are good fits to match as
> > controls: e.g. slice header, pps, sps. I think we should stick to the
> > bitstream element names for those.
> >=20
> > For H.264, that would suggest the following changes:
> > - renaming v4l2_ctrl_h264_decode_param to v4l2_ctrl_h264_slice_header;
> > - killing v4l2_ctrl_h264_decode_param and having the reference lists
> > where they belong, which seems to be slice_header;

But now here it's being described per slice. When I look at the slice
header, I only see list of modifications and when I look at userspace,
That list is simply built from DPB, the modifications list found in the
slice header seems to be only used to craft the l0/l1 list.

There is one thing that come up though, if we enable per-frame decoding
on top of per-slice decoder (like Cedrus), won't we force userspace to
always compute l0/l1 even though the HW might be handling that ? Shall
we instead pass the modification list and implement the non-parsing
bits of applying the modifications in the kernel ?

> >=20
> > I'm up for preparing and submitting these control changes and updating
> > cedrus if they seem agreeable.
> >=20
> > What do you think?
>=20
> One other thing that came up was with regards to frame-level vs. slice-
> level decoding support. Turns out that we indeed have support for slice-
> level decoding on old Tegra devices. Very recent ones also support it,
> though only for HEVC but no other codecs. Everything between old and
> very new chips (same goes for GPUs) doesn't have slice-level decoding.
>=20
> Very old GPU decoders apparently also have an additional quirk in that
> they provide two types of output frames. Generally what comes out of the
> decoder as reference frames can't be used directly for display, so these
> "shadow" frames have to be internally converted into something that can
> be displayed. This restriction only applies to reference frames. I think
> that's generally something that can be implemented in the driver, we
> only need to make sure that whatever we hand back to userspace is data
> that can be displayed. The shadow frame itself can be kept in internal
> data structures and used as appropriate.

This looks similar to what CODA driver do, maybe that could be used as
inspiration. Though in their case it's simple, the CODA tiling is not
supported by anything else in the SoC it was integrated on, so in this
case they use some IMX specific feature to output linear layout.

That gives me the impression that this can be done by the driver as you
said.

>=20
> One final remark is that it might be interesting to reach out to people
> that work on Vulkan video processing specification. I don't think much
> of this is public yet, but I'm going to try to find some people
> internally to compare notes. It'd be nice if V4L2 could serve as a
> backend to the Vulkan Video API.
>=20
> Thierry

--=-XPFvKaYUrSJ8B8Jw44xk
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQSScpfJiL+hb5vvd45xUwItrAaoHAUCXPVsfAAKCRBxUwItrAao
HFRFAJ9cbcGP2maFGQVqqh7glRlPFiRI2gCfeADCjIsxrW1FY7aKi33XnU4Q1dc=
=dYbA
-----END PGP SIGNATURE-----

--=-XPFvKaYUrSJ8B8Jw44xk--

