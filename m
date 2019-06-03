Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DF18132E91
	for <lists+linux-media@lfdr.de>; Mon,  3 Jun 2019 13:24:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728282AbfFCLYz (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 3 Jun 2019 07:24:55 -0400
Received: from mail-wr1-f65.google.com ([209.85.221.65]:38839 "EHLO
        mail-wr1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727853AbfFCLYy (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 3 Jun 2019 07:24:54 -0400
Received: by mail-wr1-f65.google.com with SMTP id d18so11640054wrs.5
        for <linux-media@vger.kernel.org>; Mon, 03 Jun 2019 04:24:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=raUNEmpUb3UnkkCdZlnbTw+P1T9c37yU2uuZAyJ2CQY=;
        b=tXSKcmBNzCr3ZFkFesFTnHvIJEe6cq6womJoeHcWuf11hS15B9Lj3eCEAkPUCGoS1E
         /Rsrb53ZG2e/peeS5WkW7S8O+Kl6kfSivXUY59E+rtU47S1KuT+km2ZonVfLWn9mY+kq
         t2VSGS/Rz+WeQ0PEhz0wapWQl/tmirOhSFMwhU1BCk4EPyLTXHzuq/ItRQHzaLuDjoyi
         nw6pfHR5syl7+AD8OkdwT5YQsv1guvFY1OOVvBdMIB/PUSsumc1YTG7vEk7ylpfUyYIr
         B0nWG4L+yOSmr58kfQxmhuWLdzkPbqv/2bSCi5oYBNElN9Up/aZ+k/KhqMOjdQsUBFoa
         2OMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=raUNEmpUb3UnkkCdZlnbTw+P1T9c37yU2uuZAyJ2CQY=;
        b=dEm3Y2TEUWyBFCYTldKcVE2+0u9pIglJxwzOoWkW4zv9BiIhiI9zicaNx1unMFETqK
         JNrSyA/jbt6ujjiH3q9G8pDkRoycGBEF8M6Bq9zya5fg0lCGXApbUr+ENRQ2MsRVbjPK
         ZVVFszNAu2vEFM2t1Lph0PL82R1rW+KzTpi+YehbLMXmlXAERarTRbqRFYahUp2CtYaC
         Qb74kY9Onc/yzNXTdM0JDXycQi3HuLP9jXOHAZBOq+T6zkln8wgmsgNMOwzhPxtUIqSw
         baYt24nrWgf5pD4k8HwjojdDgbQwRtyer9n/4gSn2mEjwlsTOS3sX6ZBxQvoMmJuJsFZ
         t6kQ==
X-Gm-Message-State: APjAAAVpHJSXcPO4uo90XxX4PVeQSPu/s5Re62LZBxjYLu4Cr+nicilg
        JiwK7h5CMKvRuR3LZm5f288=
X-Google-Smtp-Source: APXvYqz8WriY1ygCaw+SdOJ2mfUQeOuv8Boasv0K45ZpZ2iUuJebmnry2Rsx4aF4kdY14O+yaRc8+w==
X-Received: by 2002:a5d:4310:: with SMTP id h16mr2209806wrq.331.1559561092302;
        Mon, 03 Jun 2019 04:24:52 -0700 (PDT)
Received: from localhost (p2E5BEF36.dip0.t-ipconnect.de. [46.91.239.54])
        by smtp.gmail.com with ESMTPSA id t6sm3439465wmb.29.2019.06.03.04.24.50
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Mon, 03 Jun 2019 04:24:50 -0700 (PDT)
Date:   Mon, 3 Jun 2019 13:24:49 +0200
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Paul Kocialkowski <paul.kocialkowski@bootlin.com>
Cc:     Linux Media Mailing List <linux-media@vger.kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Tomasz Figa <tfiga@chromium.org>,
        Nicolas Dufresne <nicolas@ndufresne.ca>,
        Alexandre Courbot <acourbot@chromium.org>,
        Boris Brezillon <boris.brezillon@collabora.com>,
        Maxime Ripard <maxime.ripard@bootlin.com>,
        Jernej Skrabec <jernej.skrabec@siol.net>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Jonas Karlman <jonas@kwiboo.se>
Subject: Re: Proposed updates and guidelines for MPEG-2, H.264 and H.265
 stateless support
Message-ID: <20190603112449.GA30132@ulmo>
References: <0be542fabc57c38596bdb1db44aead7054a89158.camel@bootlin.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="0OAP2g/MAC+5xKAE"
Content-Disposition: inline
In-Reply-To: <0be542fabc57c38596bdb1db44aead7054a89158.camel@bootlin.com>
User-Agent: Mutt/1.11.4 (2019-03-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


--0OAP2g/MAC+5xKAE
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, May 15, 2019 at 12:09:45PM +0200, Paul Kocialkowski wrote:
> Hi,
>=20
> With the Rockchip stateless VPU driver in the works, we now have a
> better idea of what the situation is like on platforms other than
> Allwinner. This email shares my conclusions about the situation and how
> we should update the MPEG-2, H.264 and H.265 controls accordingly.
>=20
> - Per-slice decoding
>=20
> We've discussed this one already[0] and Hans has submitted a patch[1]
> to implement the required core bits. When we agree it looks good, we
> should lift the restriction that all slices must be concatenated and
> have them submitted as individual requests.
>=20
> One question is what to do about other controls. I feel like it would
> make sense to always pass all the required controls for decoding the
> slice, including the ones that don't change across slices. But there
> may be no particular advantage to this and only downsides. Not doing it
> and relying on the "control cache" can work, but we need to specify
> that only a single stream can be decoded per opened instance of the
> v4l2 device. This is the assumption we're going with for handling
> multi-slice anyway, so it shouldn't be an issue.
>=20
> - Annex-B formats
>=20
> I don't think we have really reached a conclusion on the pixel formats
> we want to expose. The main issue is how to deal with codecs that need
> the full slice NALU with start code, where the slice_header is
> duplicated in raw bitstream, when others are fine with just the encoded
> slice data and the parsed slice header control.
>=20
> My initial thinking was that we'd need 3 formats:
> - One that only takes only the slice compressed data (without raw slice
> header and start code);
> - One that takes both the NALU data (including start code, raw header
> and compressed data) and slice header controls;
> - One that takes the NALU data but no slice header.
>=20
> But I no longer think the latter really makes sense in the context of
> stateless video decoding.
>=20
> A side-note: I think we should definitely have data offsets in every
> case, so that implementations can just push the whole NALU regardless
> of the format if they're lazy.

I started an NVIDIA internal discussion about this to get some thoughts
=66rom our local experts and to fill in my gaps in understanding of NVIDIA
hardware that we might want to support.

As far as input format goes, there was pretty broad consensus that in
order for the ABI to be most broadly useful we need to settle on the
lowest common denominator, while drawing some inspiration from existing
APIs because they've already gone through a lot of these discussions and
came up with standard interfaces to deal with the differences between
decoders.

In more concrete terms this means that we'll want to provide as much
data to the kernel as possible. On one hand that means that we need to
do all of the header parsing etc. in userspace and pass it to the kernel
to support hardware that can't parse this data by itself. At the same
time we want to provide the full bitstream to the kernel to make sure
that hardware that does some (or all) of the parsing itself has access
to this. We absolutely want to avoid having to reconstruct some of the
bitstream that userspace may not have passed in order to optimize for
some usecases.

Also, all bitstream parsing should be done in userspace, we don't want
to require the kernel to have to deal with this. There's nothing in the
bitstream that would be hardware-specific, so can all be done perfectly
fine in userspace.

As for an interface on what to pass along, most people suggested that we
pass both the raw bitstream along with a descriptor of what's contained
in that bitstream. That descriptor would contain the number of slices
contained in the bitstream chunk as well as per-slice data (such as the
offset in the bitstream chunk for that slice and the number/ID of the
slice). This is in addition to the extra meta data that we already pass
for the codecs (PPS, SPS, ...). The slice information would allow
drivers to point the hardware directly at the slice data if that's all
it needs, but it can also be used for error concealment if corrupted
slices are encountered. This would obviously require that controls can
be passed on a per-buffer basis. I'm not sure if that's possible since
the request API was already introduced to allow controls to be passed in
a more fine-grained manner than setting them globally. I'm not sure how
to pass per-buffer data in a nice way otherwise, but perhaps this is not
even a real problem?

The above is pretty close to the Mesa pipe_video infrastructure as well
as VAAPI and VDPAU, so I would expect most userspace to be able to deal
well with such an ABI.

Userspace applications would decide what the appropriate way is to pass
bitstream data. Network streaming applications may decide to send slices
individually, so number of slices =3D 1 and the descriptor would contain a
single entry for only that slice. For file-based playback userspace may
decide to forward the complete bitstream for a full frame, in which case
the descriptor would contain entries for all slices that make up the
frame.

On the driver side, the above interface gives drivers the flexibility to
implement what works best for them. Decoders that support scatter-gather
can be programmed for each buffer that they receive. IOMMU-capable
decoders can use the IOMMU to achieve something similar. And for very
simple decoders, the driver can always decide to concatenate in the
kernel and pass a single buffer with the complete bitstream for a full
frame if that's what the hardware needs.

The kernel can obviously assist userspace with making smart decisions by
advertising the capabilities of the kernel driver, but I think the above
is flexible enough to at least work in all cases, even if perhaps not at
the absolute best efficiency.

Allowing userspace to be flexible about how to pass this data will help
avoid situations like where data is contiguous in memory (such as would
be common for file-based playback) and then userspace having to break
this up into individual slices and the kernel having to concatenate all
of the slices, where it would be much easier to just use the contiguous
data directly (via something like userptr).

> - Dropping the DPB concept in H.264/H.265
>=20
> As far as I could understand, the decoded picture buffer (DPB) is a
> concept that only makes sense relative to a decoder implementation. The
> spec mentions how to manage it with the Hypothetical reference decoder
> (Annex C), but that's about it.
>=20
> What's really in the bitstream is the list of modified short-term and
> long-term references, which is enough for every decoder.
>=20
> For this reason, I strongly believe we should stop talking about DPB in
> the controls and just pass these lists agremented with relevant
> information for userspace.
>=20
> I think it should be up to the driver to maintain a DPB and we could
> have helpers for common cases. For instance, the rockchip decoder needs
> to keep unused entries around[2] and cedrus has the same requirement
> for H.264. However for cedrus/H.265, we don't need to do any book-
> keeping in particular and can manage with the lists from the bitstream
> directly.

There was a bit of concern regarding this. Given that DPB maintenance is
purely a software construct, this doesn't really belong in the kernel. A
DPB will be the same no matter what hardware operates on the bitstream.
Depending on the hardware it may use the DPB differently (or maybe not
at all), but that's beside the point, really. This is pretty much the
same rationale as discussed above for meta data.

Again, VAAPI and VDPAU don't require drivers to deal with this. Instead
they just get the final list of reference pictures, ready to use.

> - Using flags
>=20
> The current MPEG-2 controls have lots of u8 values that can be
> represented as flags. Using flags also helps with padding.
> It's unlikely that we'll get more than 64 flags, so using a u64 by
> default for that sounds fine (we definitely do want to keep some room
> available and I don't think using 32 bits as a default is good enough).
>=20
> I think H.264/HEVC per-control flags should also be moved to u64.

There was also some concensus on this, that u64 should be good enough
for anything out there, though we obviously don't know what the future
will hold, so perhaps adding some way for possible extending this in the
future might be good. I guess we'll get new controls for new codecs
anyway, so we can punt on this until then.

> - Clear split of controls and terminology
>=20
> Some codecs have explicit NAL units that are good fits to match as
> controls: e.g. slice header, pps, sps. I think we should stick to the
> bitstream element names for those.
>=20
> For H.264, that would suggest the following changes:
> - renaming v4l2_ctrl_h264_decode_param to v4l2_ctrl_h264_slice_header;
> - killing v4l2_ctrl_h264_decode_param and having the reference lists
> where they belong, which seems to be slice_header;
>=20
> I'm up for preparing and submitting these control changes and updating
> cedrus if they seem agreeable.
>=20
> What do you think?

One other thing that came up was with regards to frame-level vs. slice-
level decoding support. Turns out that we indeed have support for slice-
level decoding on old Tegra devices. Very recent ones also support it,
though only for HEVC but no other codecs. Everything between old and
very new chips (same goes for GPUs) doesn't have slice-level decoding.

Very old GPU decoders apparently also have an additional quirk in that
they provide two types of output frames. Generally what comes out of the
decoder as reference frames can't be used directly for display, so these
"shadow" frames have to be internally converted into something that can
be displayed. This restriction only applies to reference frames. I think
that's generally something that can be implemented in the driver, we
only need to make sure that whatever we hand back to userspace is data
that can be displayed. The shadow frame itself can be kept in internal
data structures and used as appropriate.

One final remark is that it might be interesting to reach out to people
that work on Vulkan video processing specification. I don't think much
of this is public yet, but I'm going to try to find some people
internally to compare notes. It'd be nice if V4L2 could serve as a
backend to the Vulkan Video API.

Thierry

--0OAP2g/MAC+5xKAE
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAlz1A38ACgkQ3SOs138+
s6E3/RAAoswDMyvKMP7DGf3T6u3Byr1ky9sQt/e/B2mst85qtFEz0kPIuU5c6fVs
ARMFDONRyiH0tHCT89iTAxJCCI7mzF/LQ4WzHpApiSA3i5lrBa80xHjpqKr9lBL+
eg5DvOCHzBhU5Uoq8/v8VnSmEIgLoPSL1tkWYPFrsfwf8VFD7ndZAUeog2hpgjAy
D4u9GX3F0adOI0t0dymNc+rArQW6HB/fPwcYsws3EJgYNkoBosko2Xx0S3g9H898
NVwfkfyCBo78OI7+Zrpwpg72h6dPFzGY47EWcEpINJJF3EIdiy9ZMoq9f5DD1ojX
lcDEqo1uaD8c2+1YvyiR1FyJc5bOAo5Mt+kJyDKGHLPD2wsYF1IJb5KzDKBfY8rE
jTFT0ISwopoWkqc/aYr5GR8N9ltTNQ1BYm1njLiTPUzpU8MrI7HX+E4oHxq04M0b
lemXPPAQVNkWCB3tzezTATLZtJ3rPocWncHegXc/rHLVyGD0D8n9FjCg5mOMQEIQ
Si7DEYvZEnNUVusGyN1Hw8ZXcJpxMkYGLc768nE5+QW9lK9sy5QhxjV0dl5+6/kH
FpwZUr6tyETTJFppqNYWwVpRmgV3SdwctoJ3ImAKTfBEYUIikYc13fs9hSK+bZ+k
AjAWZLGYq4rrzr606Je2mUYxAdSc4iKCbZL+5MmE+yC+RCYeTdM=
=xl5S
-----END PGP SIGNATURE-----

--0OAP2g/MAC+5xKAE--
