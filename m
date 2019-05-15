Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C34A51F6CA
	for <lists+linux-media@lfdr.de>; Wed, 15 May 2019 16:43:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728204AbfEOOm5 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 15 May 2019 10:42:57 -0400
Received: from mail-qt1-f193.google.com ([209.85.160.193]:36109 "EHLO
        mail-qt1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726084AbfEOOm5 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 15 May 2019 10:42:57 -0400
Received: by mail-qt1-f193.google.com with SMTP id a17so3570501qth.3
        for <linux-media@vger.kernel.org>; Wed, 15 May 2019 07:42:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20150623.gappssmtp.com; s=20150623;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version;
        bh=1ezMZfUP9VFq2gqHE1YqadB74WpVB4UPrMJ6CtaxUeM=;
        b=JvGAAEfUWsxJXTew8iedLdHt5LbU/hPPOZmGQdmWGpV+HLQOAW6cW9kV2c+5aw2F/Y
         hCG0gPpVbzRu8y9TaKOFVe2MFM9cAXkobS6EePgJnR7JVLNFyrtM7E9ac8Fq1nPoCYKj
         87IPFbD0gZToVxzVcVJ8uGUgT9/f4Rl+f7NV3GeyCi/cEYwlka6O1CA9bYysnF52UgBH
         kUaE5rEP4n8l7ZMKp02Kh5mxDIJp4bkdih6MCFFk3yKI/jDpqJDZoQNXgYcDO0X32+PM
         Evovop8/HSGN9D9YJeLhkuPtNE44PKOlNWMAQoHq/yz9GF/2cb9Zc2JUZ3Im0Q3dLKUs
         zSwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version;
        bh=1ezMZfUP9VFq2gqHE1YqadB74WpVB4UPrMJ6CtaxUeM=;
        b=APyaNQTyZFq7P2AtYdUwtbFAeennARlVutfT6e7J9vIw5N1ZF8O2TzFl+wsJ2vJn1n
         1dW+sFU0kynS3FfJL3BDfoiuorJkMXQsrvWN8+eJJry8iM7EDse+kKkghhtA4pu3hdHu
         W14thbRGzYJJrMHcCm21qbn2EW8tXyQV+b6Q+rCIAObXLz723dOsWsdK29JisHh/nuj3
         kVfiB/uqWk76m3QwswJ+d3Jyb0wNuiO9Nd1BF/hfI6MZwb5b+Kym+7s9K3zMkKtA+lG3
         BbQ5/I/jPtZ0ILZuShJAxqSosOdQlaxyh2cIGV8rHZ0FNjCJFFJrP2m+2iDsvTmzAENY
         lkbQ==
X-Gm-Message-State: APjAAAXmaFXs28vGjRn+IOBii1csSPllcQFlsdY9PCUGZzNMjrse0U45
        6nHhAXW9VtAfe+yusVyQpqwRjw==
X-Google-Smtp-Source: APXvYqx5EYfgYgyG1YVgDB/ZNqklwlrLZtlAX2Z46G9NX52KxpIGjj1HbcssLR3d6li4BHdIV3ev+Q==
X-Received: by 2002:ac8:1ad2:: with SMTP id h18mr13871335qtk.273.1557931376224;
        Wed, 15 May 2019 07:42:56 -0700 (PDT)
Received: from tpx230-nicolas.collaboramtl (modemcable154.55-37-24.static.videotron.ca. [24.37.55.154])
        by smtp.gmail.com with ESMTPSA id k54sm1673076qtk.54.2019.05.15.07.42.53
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Wed, 15 May 2019 07:42:54 -0700 (PDT)
Message-ID: <3e0d6d5106e9c0c27ef4b11e64a488726ff77103.camel@ndufresne.ca>
Subject: Re: Proposed updates and guidelines for MPEG-2, H.264 and H.265
 stateless support
From:   Nicolas Dufresne <nicolas@ndufresne.ca>
To:     Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
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
Date:   Wed, 15 May 2019 10:42:52 -0400
In-Reply-To: <0be542fabc57c38596bdb1db44aead7054a89158.camel@bootlin.com>
References: <0be542fabc57c38596bdb1db44aead7054a89158.camel@bootlin.com>
Content-Type: multipart/signed; micalg="pgp-sha1"; protocol="application/pgp-signature";
        boundary="=-4GzKOC2yAxDOe4BCqcHu"
User-Agent: Evolution 3.32.2 (3.32.2-1.fc30) 
MIME-Version: 1.0
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


--=-4GzKOC2yAxDOe4BCqcHu
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le mercredi 15 mai 2019 =C3=A0 12:09 +0200, Paul Kocialkowski a =C3=A9crit =
:
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

My opinion on this is that the m2m instance is a state, and the driver
should be responsible of doing time-division multiplexing across
multiple m2m instance jobs. Doing the time-division multiplexing in
userspace would require some sort of daemon to work properly across
processes. I also think the kernel is better place for doing resource
access scheduling in general.

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

I realize that I didn't share our latest research on the subject. So a
slice in the original bitstream is formed of the following blocks
(simplified):

  [nal_header][nal_type][slice_header][slice]

nal_header:
This one is a header used to locate the start and the end of the of a
NAL. There is two standard forms, the ANNEX B / start code, a sequence
of 3 bytes 0x00 0x00 0x01, you'll often see 4 bytes, the first byte
would be a leading 0 from the previous NAL padding, but this is also
totally valid start code. The second form is the AVC form, notably used
in ISOMP4 container. It simply is the size of the NAL. You must keep
your buffer aligned to NALs in this case as you cannot scan from random
location.

nal_type:
It's a bit more then just the type, but it contains at least the
information of the nal type. This has different size on H.264 and HEVC
but I know it's size is in bytes.

slice_header:
This contains per slice parameters, like the modification lists to
apply on the references. This one has a size in bits, not in bytes.

slice:
I don't really know what is in it exactly, but this is the data used to
decode. This bit has a special coding called the anti-emulation, which
prevents a start-code from appearing in it. This coding is present in
both forms, ANNEX-B or AVC (in GStreamer and some reference manual they
call ANNEX-B the bytestream format).

So, what we notice is that what is currently passed through Cedrus
driver:
  [nal_type][slice_header][slice]

This matches what is being passed through VA-API. We can understand
that stripping off the slice_header would be hard, since it's size is
in bits. Instead we pass size and header_bit_size in slice_params.

About Rockchip. RK3288 is a Hantro G1 and has a bit called
start_code_e, when you turn this off, you don't need start code. As a
side effect, the bitstream becomes identical. We do now know that it
works with the ffmpeg branch implement for cedrus.

Now what's special about Hantro G1 (also found on IMX8M) is that it
take care for us of reading and executing the modification lists found
in the slice header. Mostly because I very disliked having to pass the
p/b0/b1 parameters, is that Boris implemented in the driver the
transformation from the DPB entries into this p/b0/b1 list. These list
a standard, it's basically implementing 8.2.4.1 and 8.2.4.2. the
following section is the execution of the modification list. As this
list is not modified, it only need to be calculated per frame. As a
result, we don't need these new lists, and we can work with the same
H264_SLICE format as Cedrus is using.

Now, this is just a start. For RK3399, we have a different CODEC
design. This one does not have the start_code_e bit. What the IP does,
is that you give it one or more slice per buffer, setup the params,
start decoding, but the decoder then return the location of the
following NAL. So basically you could offload the scanning of start
code to the HW. That being said, with the driver layer in between, that
would be amazingly inconvenient to use, and with Boyer-more algorithm,
it is pretty cheap to scan this type of start-code on CPU. But the
feature that this allows is to operate in frame mode. In this mode, you
have 1 interrupt per frame. But it also support slice mode, with an
interrupt per slice, which is what we decided to use.

So in this case, indeed we strictly require on start-code. Though, to
me this is not a great reason to make a new fourcc, so we will try and
use (data_offset =3D 3) in order to make some space for that start code,
and write it down in the driver. This is to be continued, we will
report back on this later. This could have some side effect in the
ability to import buffers. But most userspace don't try to do zero-copy=20
on the encoded size and just copy anyway.

To my opinion, having a single format is a big deal, since userspace
will generally be developed for one specific HW and we would endup with
fragmented support. What we really want to achieve is having a driver
interface which works across multiple HW, and I think this is quite
possible.

>=20
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

As discusses today, we still need to pass that list. It's being index
by the HW to retrieve the extra information we have collected about the
status of the reference frames. In the case of Hantro, which process
the modification list from the slice header for us, we also need that
list to construct the unmodified list.

So the problem here is just a naming problem. That list is not really a
DPB. It is just the list of long-term/short-term references with the
status of these references. So maybe we could just rename as
references/reference_entry ?

>=20
> - Using flags
>=20
> The current MPEG-2 controls have lots of u8 values that can be
> represented as flags. Using flags also helps with padding.
> It's unlikely that we'll get more than 64 flags, so using a u64 by
> default for that sounds fine (we definitely do want to keep some room
> available and I don't think using 32 bits as a default is good enough).
>=20
> I think H.264/HEVC per-control flags should also be moved to u64.

Make sense, I guess bits (member : 1) are not allowed in uAPI right ?

>=20
> - Clear split of controls and terminology
>=20
> Some codecs have explicit NAL units that are good fits to match as
> controls: e.g. slice header, pps, sps. I think we should stick to the
> bitstream element names for those.
>=20
> For H.264, that would suggest the following changes:
> - renaming v4l2_ctrl_h264_decode_param to v4l2_ctrl_h264_slice_header;

Oops, I think you meant slice_prams ? decode_params matches the
information found in SPS/PPS (combined?), while slice_params matches
the information extracted (and executed in case of l0/l1) from the
slice headers. That being said, to me this name wasn't confusing, since
it's not just the slice header, and it's per slice.

> - killing v4l2_ctrl_h264_decode_param and having the reference lists
> where they belong, which seems to be slice_header;

There reference list is only updated by userspace (through it's DPB)
base on the result of the last decoding step. I was very confused for a
moment until I realize that the lists in the slice_header are just a
list of modification to apply to the reference list in order to produce
l0 and l1.

>=20
> I'm up for preparing and submitting these control changes and updating
> cedrus if they seem agreeable.
>=20
> What do you think?
>=20
> Cheers,
>=20
> Paul
>=20
> [0]: https://lkml.org/lkml/2019/3/6/82
> [1]: https://patchwork.linuxtv.org/patch/55947/
> [2]: https://chromium.googlesource.com/chromiumos/third_party/kernel/+/4d=
7cb46539a93bb6acc802f5a46acddb5aaab378
>=20

--=-4GzKOC2yAxDOe4BCqcHu
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQSScpfJiL+hb5vvd45xUwItrAaoHAUCXNwlbAAKCRBxUwItrAao
HCbqAJ0XXVVBrXjGy4PI1vKY8KjvOVnBtgCgzrs+g4WdNx1nyDm8CUypynqvcvQ=
=TuCo
-----END PGP SIGNATURE-----

--=-4GzKOC2yAxDOe4BCqcHu--

