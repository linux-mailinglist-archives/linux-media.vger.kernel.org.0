Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 23B0425444
	for <lists+linux-media@lfdr.de>; Tue, 21 May 2019 17:44:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728691AbfEUPoE (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 21 May 2019 11:44:04 -0400
Received: from mail-wm1-f44.google.com ([209.85.128.44]:38995 "EHLO
        mail-wm1-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728527AbfEUPoD (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 21 May 2019 11:44:03 -0400
Received: by mail-wm1-f44.google.com with SMTP id n25so1560939wmk.4
        for <linux-media@vger.kernel.org>; Tue, 21 May 2019 08:44:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=3jquI4HhWICBZwwYbhH1km/UEoUGMjTSV2B7vueQUkU=;
        b=de3zNHpLlCMpv1CZpsTv1k0XfoKzqRhNvHKxjeVLVpXRJU9aSKnDvL+JTDp15UNUIT
         T16wEQuJ6niOWmAUHfauZ5vVlP3oilhPlxdlg9krPdfwSXg4Qv6ddAnzR7xL/DQN6zlf
         0cWCkaqItgWYKy220hjeP3tT7lc/8EqF5M6769XkU1xiigeoJzNpBiO8gXX5PGEu2wFw
         1EcyUt/+urW9XTpFsebQLKHIwMaXQ/pRlZktTTjdof05UeNchvYrs2aEIimcpKmeXCPK
         i81cZAOt3sv+jZDlZuP6TvXkLu0MePw8pMRHF05UvrFAnXi1K+fetwis6k+QCTTwyBwP
         WpOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=3jquI4HhWICBZwwYbhH1km/UEoUGMjTSV2B7vueQUkU=;
        b=hVhqbswNezY1N1HO+CTo8xuQG4IEPNAGh9u54lWvej3WfCadYlOtU10UdcwbX2twCp
         9Ueb2a/5wFycs2D8YvbUTyGa+mb2El3iwVHEpfRNDMA7GKhHjAGD9azrwB+5tMNj2DC/
         m2++Z5CvmBlGYUxd0Ma/k+tchrKD8iYEpY40tH5SoRGJG+pPcnbuIHgLC64myrJFaRWf
         1bdC2WhI9x7Ne8yeXlK+OS+FgngMtx/SebXfevGb3PzO96cQhfJX4rQjMbYDPvGlWL9s
         Sabk5JtQiTWZzFg/O1V+P2l1XaW3Jkc99b+7snyiASEg3w3r+2d3CkAnMuwu41L2P9Tw
         SS+A==
X-Gm-Message-State: APjAAAUB+pZLsY+z6Cj3VwAf7WEQH2D5oyIbirp18v6SOo39JAdtQKIe
        grk2IDi1RqrY9zfamnHahCw=
X-Google-Smtp-Source: APXvYqyDjHp9Ok4zpSoY52D7fT8KJvll57JlDn0gjjL7BAbm6LjCsRjXywDHg8ZdL2QzBjgvpeTmSQ==
X-Received: by 2002:a1c:7ed2:: with SMTP id z201mr3818401wmc.113.1558453440886;
        Tue, 21 May 2019 08:44:00 -0700 (PDT)
Received: from localhost (p2E5BEF36.dip0.t-ipconnect.de. [46.91.239.54])
        by smtp.gmail.com with ESMTPSA id h12sm14554966wre.14.2019.05.21.08.43.59
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 21 May 2019 08:44:00 -0700 (PDT)
Date:   Tue, 21 May 2019 17:43:58 +0200
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Paul Kocialkowski <paul.kocialkowski@bootlin.com>
Cc:     Nicolas Dufresne <nicolas@ndufresne.ca>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Tomasz Figa <tfiga@chromium.org>,
        Alexandre Courbot <acourbot@chromium.org>,
        Boris Brezillon <boris.brezillon@collabora.com>,
        Maxime Ripard <maxime.ripard@bootlin.com>,
        Jernej Skrabec <jernej.skrabec@siol.net>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Jonas Karlman <jonas@kwiboo.se>
Subject: Re: Proposed updates and guidelines for MPEG-2, H.264 and H.265
 stateless support
Message-ID: <20190521154358.GC7098@ulmo>
References: <0be542fabc57c38596bdb1db44aead7054a89158.camel@bootlin.com>
 <3e0d6d5106e9c0c27ef4b11e64a488726ff77103.camel@ndufresne.ca>
 <39ded6d4ddf85849bf45abc94dc8e104fd4c0978.camel@bootlin.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="qtZFehHsKgwS5rPz"
Content-Disposition: inline
In-Reply-To: <39ded6d4ddf85849bf45abc94dc8e104fd4c0978.camel@bootlin.com>
User-Agent: Mutt/1.11.4 (2019-03-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


--qtZFehHsKgwS5rPz
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, May 15, 2019 at 07:42:50PM +0200, Paul Kocialkowski wrote:
> Hi,
>=20
> Le mercredi 15 mai 2019 =C3=A0 10:42 -0400, Nicolas Dufresne a =C3=A9crit=
 :
> > Le mercredi 15 mai 2019 =C3=A0 12:09 +0200, Paul Kocialkowski a =C3=A9c=
rit :
> > > Hi,
> > >=20
> > > With the Rockchip stateless VPU driver in the works, we now have a
> > > better idea of what the situation is like on platforms other than
> > > Allwinner. This email shares my conclusions about the situation and h=
ow
> > > we should update the MPEG-2, H.264 and H.265 controls accordingly.
> > >=20
> > > - Per-slice decoding
> > >=20
> > > We've discussed this one already[0] and Hans has submitted a patch[1]
> > > to implement the required core bits. When we agree it looks good, we
> > > should lift the restriction that all slices must be concatenated and
> > > have them submitted as individual requests.
> > >=20
> > > One question is what to do about other controls. I feel like it would
> > > make sense to always pass all the required controls for decoding the
> > > slice, including the ones that don't change across slices. But there
> > > may be no particular advantage to this and only downsides. Not doing =
it
> > > and relying on the "control cache" can work, but we need to specify
> > > that only a single stream can be decoded per opened instance of the
> > > v4l2 device. This is the assumption we're going with for handling
> > > multi-slice anyway, so it shouldn't be an issue.
> >=20
> > My opinion on this is that the m2m instance is a state, and the driver
> > should be responsible of doing time-division multiplexing across
> > multiple m2m instance jobs. Doing the time-division multiplexing in
> > userspace would require some sort of daemon to work properly across
> > processes. I also think the kernel is better place for doing resource
> > access scheduling in general.
>=20
> I agree with that yes. We always have a single m2m context and specific
> controls per opened device so keeping cached values works out well.
>=20
> So maybe we shall explicitly require that the request with the first
> slice for a frame also contains the per-frame controls.
>=20
> > > - Annex-B formats
> > >=20
> > > I don't think we have really reached a conclusion on the pixel formats
> > > we want to expose. The main issue is how to deal with codecs that need
> > > the full slice NALU with start code, where the slice_header is
> > > duplicated in raw bitstream, when others are fine with just the encod=
ed
> > > slice data and the parsed slice header control.
> > >=20
> > > My initial thinking was that we'd need 3 formats:
> > > - One that only takes only the slice compressed data (without raw sli=
ce
> > > header and start code);
> > > - One that takes both the NALU data (including start code, raw header
> > > and compressed data) and slice header controls;
> > > - One that takes the NALU data but no slice header.
> > >=20
> > > But I no longer think the latter really makes sense in the context of
> > > stateless video decoding.
> > >=20
> > > A side-note: I think we should definitely have data offsets in every
> > > case, so that implementations can just push the whole NALU regardless
> > > of the format if they're lazy.
> >=20
> > I realize that I didn't share our latest research on the subject. So a
> > slice in the original bitstream is formed of the following blocks
> > (simplified):
> >=20
> >   [nal_header][nal_type][slice_header][slice]
>=20
> Thanks for the details!
>=20
> > nal_header:
> > This one is a header used to locate the start and the end of the of a
> > NAL. There is two standard forms, the ANNEX B / start code, a sequence
> > of 3 bytes 0x00 0x00 0x01, you'll often see 4 bytes, the first byte
> > would be a leading 0 from the previous NAL padding, but this is also
> > totally valid start code. The second form is the AVC form, notably used
> > in ISOMP4 container. It simply is the size of the NAL. You must keep
> > your buffer aligned to NALs in this case as you cannot scan from random
> > location.
> >=20
> > nal_type:
> > It's a bit more then just the type, but it contains at least the
> > information of the nal type. This has different size on H.264 and HEVC
> > but I know it's size is in bytes.
> >=20
> > slice_header:
> > This contains per slice parameters, like the modification lists to
> > apply on the references. This one has a size in bits, not in bytes.
> >=20
> > slice:
> > I don't really know what is in it exactly, but this is the data used to
> > decode. This bit has a special coding called the anti-emulation, which
> > prevents a start-code from appearing in it. This coding is present in
> > both forms, ANNEX-B or AVC (in GStreamer and some reference manual they
> > call ANNEX-B the bytestream format).
> >=20
> > So, what we notice is that what is currently passed through Cedrus
> > driver:
> >   [nal_type][slice_header][slice]
> >=20
> > This matches what is being passed through VA-API. We can understand
> > that stripping off the slice_header would be hard, since it's size is
> > in bits. Instead we pass size and header_bit_size in slice_params.
>=20
> True, there is that.
>=20
> > About Rockchip. RK3288 is a Hantro G1 and has a bit called
> > start_code_e, when you turn this off, you don't need start code. As a
> > side effect, the bitstream becomes identical. We do now know that it
> > works with the ffmpeg branch implement for cedrus.
>=20
> Oh great, that makes life easier in the short term, but I guess the
> issue could arise on another decoder sooner or later.
>=20
> > Now what's special about Hantro G1 (also found on IMX8M) is that it
> > take care for us of reading and executing the modification lists found
> > in the slice header. Mostly because I very disliked having to pass the
> > p/b0/b1 parameters, is that Boris implemented in the driver the
> > transformation from the DPB entries into this p/b0/b1 list. These list
> > a standard, it's basically implementing 8.2.4.1 and 8.2.4.2. the
> > following section is the execution of the modification list. As this
> > list is not modified, it only need to be calculated per frame. As a
> > result, we don't need these new lists, and we can work with the same
> > H264_SLICE format as Cedrus is using.
>=20
> Yes but I definitely think it makes more sense to pass the list
> modifications rather than reconstructing those in the driver from a
> full list. IMO controls should stick to the bitstream as close as
> possible.
>=20
> > Now, this is just a start. For RK3399, we have a different CODEC
> > design. This one does not have the start_code_e bit. What the IP does,
> > is that you give it one or more slice per buffer, setup the params,
> > start decoding, but the decoder then return the location of the
> > following NAL. So basically you could offload the scanning of start
> > code to the HW. That being said, with the driver layer in between, that
> > would be amazingly inconvenient to use, and with Boyer-more algorithm,
> > it is pretty cheap to scan this type of start-code on CPU. But the
> > feature that this allows is to operate in frame mode. In this mode, you
> > have 1 interrupt per frame.
>=20
> I'm not sure there is any interest in exposing that from userspace and
> my current feeling is that we should just ditch support for per-frame
> decoding altogether. I think it mixes decoding with notions that are
> higher-level than decoding, but I agree it's a blurry line.

I'm not sure ditching support for per-frame decoding would be a wise
decision. What if some device comes around that only supports frame
decoding and can't handle individual slices?

We have such a situation on Tegra, for example. I think the hardware can
technically decode individual slices, but it can also be set up to do a
lot more and operate in basically a per-frame mode where you just pass
it a buffer containing the complete bitstream for one frame and it'll
just raise an interrupt when it's done decoding.

Per-frame mode is what's currently implemented in the staging driver and
as far as I can tell it's also what's implemented in the downstream
driver, which uses a completely different architecture (it uploads a
firmware that processes a command stream). I have seen registers that
seem to be related to a slice-decoding mode, but honestly I have no idea
how to program them to achieve that.

Now the VDE IP that I'm dealing with is pretty old, but from what I know
of newer IP, they follow a similar command stream architecture as the
downstream VDE driver, so I'm not sure those support per-slice decoding
either. They typically have a firmware that processes command streams
and userspace typically just passes a single bitstream buffer along with
reference frames and gets back the decoded frame. I'd have to
investigate further to understand if slice-level decoding is supported
on the newer hardware.

I'm not familiar with any other decoders, but per-frame decoding doesn't
strike me as a very exotic idea. Excluding such decoders from the ABI
sounds a bit premature.

> > But it also support slice mode, with an
> > interrupt per slice, which is what we decided to use.
>=20
> Easier for everyone and probably better for latency as well :)

I'm not sure I understand what's easier about slice-level decoding or
how this would improve latency. If anything getting less interrupts is
good, isn't it?

If we can offload more to hardware, certainly that's something we want
to take advantage of, no?

Thierry

> > So in this case, indeed we strictly require on start-code. Though, to
> > me this is not a great reason to make a new fourcc, so we will try and
> > use (data_offset =3D 3) in order to make some space for that start code,
> > and write it down in the driver. This is to be continued, we will
> > report back on this later. This could have some side effect in the
> > ability to import buffers. But most userspace don't try to do zero-copy=
=20
> > on the encoded size and just copy anyway.
> >=20
> > To my opinion, having a single format is a big deal, since userspace
> > will generally be developed for one specific HW and we would endup with
> > fragmented support. What we really want to achieve is having a driver
> > interface which works across multiple HW, and I think this is quite
> > possible.
>=20
> I agree with that. The more I think about it, the more I believe we
> should just pass the whole [nal_header][nal_type][slice_header][slice]
> and the parsed list in every scenario.
>=20
> For H.265, our decoder needs some information from the NAL type too.
> We currently extract that in userspace and stick it to the
> slice_header, but maybe it would make more sense to have drivers parse
> that info from the buffer if they need it. On the other hand, it seems
> quite common to pass information from the NAL type, so maybe we should
> either make a new control for it or have all the fields in the
> slice_header (which would still be wrong in terms of matching bitstream
> description).
>=20
> > > - Dropping the DPB concept in H.264/H.265
> > >=20
> > > As far as I could understand, the decoded picture buffer (DPB) is a
> > > concept that only makes sense relative to a decoder implementation. T=
he
> > > spec mentions how to manage it with the Hypothetical reference decoder
> > > (Annex C), but that's about it.
> > >=20
> > > What's really in the bitstream is the list of modified short-term and
> > > long-term references, which is enough for every decoder.
> > >=20
> > > For this reason, I strongly believe we should stop talking about DPB =
in
> > > the controls and just pass these lists agremented with relevant
> > > information for userspace.
> > >=20
> > > I think it should be up to the driver to maintain a DPB and we could
> > > have helpers for common cases. For instance, the rockchip decoder nee=
ds
> > > to keep unused entries around[2] and cedrus has the same requirement
> > > for H.264. However for cedrus/H.265, we don't need to do any book-
> > > keeping in particular and can manage with the lists from the bitstream
> > > directly.
> >=20
> > As discusses today, we still need to pass that list. It's being index
> > by the HW to retrieve the extra information we have collected about the
> > status of the reference frames. In the case of Hantro, which process
> > the modification list from the slice header for us, we also need that
> > list to construct the unmodified list.
> >=20
> > So the problem here is just a naming problem. That list is not really a
> > DPB. It is just the list of long-term/short-term references with the
> > status of these references. So maybe we could just rename as
> > references/reference_entry ?
>=20
> What I'd like to pass is the diff to the references list, as ffmpeg
> currently provides for v4l2 request and vaapi (probably vdpau too). No
> functional change here, only that we should stop calling it a DPB,
> which confuses everyone.
>=20
> > > - Using flags
> > >=20
> > > The current MPEG-2 controls have lots of u8 values that can be
> > > represented as flags. Using flags also helps with padding.
> > > It's unlikely that we'll get more than 64 flags, so using a u64 by
> > > default for that sounds fine (we definitely do want to keep some room
> > > available and I don't think using 32 bits as a default is good enough=
).
> > >=20
> > > I think H.264/HEVC per-control flags should also be moved to u64.
> >=20
> > Make sense, I guess bits (member : 1) are not allowed in uAPI right ?
>=20
> Mhh, even if they are, it makes it much harder to verify 32/64 bit
> alignment constraints (we're dealing with 64-bit platforms that need to
> have 32-bit userspace and compat_ioctl).
>=20
> > > - Clear split of controls and terminology
> > >=20
> > > Some codecs have explicit NAL units that are good fits to match as
> > > controls: e.g. slice header, pps, sps. I think we should stick to the
> > > bitstream element names for those.
> > >=20
> > > For H.264, that would suggest the following changes:
> > > - renaming v4l2_ctrl_h264_decode_param to v4l2_ctrl_h264_slice_header;
> >=20
> > Oops, I think you meant slice_prams ? decode_params matches the
> > information found in SPS/PPS (combined?), while slice_params matches
> > the information extracted (and executed in case of l0/l1) from the
> > slice headers.
>=20
> Yes you're right, I mixed them up.
>=20
> >  That being said, to me this name wasn't confusing, since
> > it's not just the slice header, and it's per slice.
>=20
> Mhh, what exactly remains in there and where does it originate in the
> bitstream? Maybe it wouldn't be too bad to have one control per actual
> group of bitstream elements.
>=20
> > > - killing v4l2_ctrl_h264_decode_param and having the reference lists
> > > where they belong, which seems to be slice_header;
> >=20
> > There reference list is only updated by userspace (through it's DPB)
> > base on the result of the last decoding step. I was very confused for a
> > moment until I realize that the lists in the slice_header are just a
> > list of modification to apply to the reference list in order to produce
> > l0 and l1.
>=20
> Indeed, and I'm suggesting that we pass the modifications only, which
> would fit a slice_header control.
>=20
> Cheers,
>=20
> Paul
>=20
> > > I'm up for preparing and submitting these control changes and updating
> > > cedrus if they seem agreeable.
> > >=20
> > > What do you think?
> > >=20
> > > Cheers,
> > >=20
> > > Paul
> > >=20
> > > [0]: https://lkml.org/lkml/2019/3/6/82
> > > [1]: https://patchwork.linuxtv.org/patch/55947/
> > > [2]: https://chromium.googlesource.com/chromiumos/third_party/kernel/=
+/4d7cb46539a93bb6acc802f5a46acddb5aaab378
> > >=20
>=20

--qtZFehHsKgwS5rPz
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAlzkHLwACgkQ3SOs138+
s6GFvw//W6x4A0RGYpPVYk00+YAfuTsx6QWWCPYflA/wBhzxByAYFukZWG1KY+96
6z3HZWtJ0SE2hjQfvtZmHfi3ksL0/jDxvpSRnyXhyRP+LN8JxV7n/4kY8LpOj718
0Ox3Pm94f+R4nbz2dKlUaKiRIHRWylYlCpRm+rSGZ0LR3C2vYtCAlraboaPUru3E
tEZDmwYMhEqjObE922Ce5WIahl5TH43STl10UWBk9w4t7FpVNaBLuNT2ACqTY4fY
P5G+AKzMFxO9z1Z5iOaITWqZHC7mlkfvT5wIDm2u45Oh65QyWthpqMU05W2fjTpL
CZZsxTuemhhgMCItmyoRoRzSaY0j1XD/CuSsC96VDKLIZ8VJW9jGcmh0JVdMMoU4
9h4aTs2Psf6W7JRNyktmkykeLlNpuae4m2nrox3hcIsX7Gfg3dGEMxQ8WVTRQg0f
EUkBWG5GNHVxY0iG5YhKFoav6plAZxq3UOrRH4qGje/YLXkpl8GOQwXX+mX7PwRa
0CpGWj+Bz5vBInCyKGD18lvGYCp+kmfBbLnMt5HO2MDD7ItC9DGZo22dHg+pvSJT
BafKX5Zb6OUXKtEa7XAPHCLHApv3V8z78r3E9iA8IuXFaGaE0wjkWUkXL+JYLaeu
nxQLIdUw6rUyFvASBeVrDcUtKkMVjuJoDdAk+cecXxr3DLbY82I=
=1i4F
-----END PGP SIGNATURE-----

--qtZFehHsKgwS5rPz--
