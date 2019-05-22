Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D1B1925E43
	for <lists+linux-media@lfdr.de>; Wed, 22 May 2019 08:40:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728590AbfEVGjz (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 22 May 2019 02:39:55 -0400
Received: from mail-ed1-f45.google.com ([209.85.208.45]:40843 "EHLO
        mail-ed1-f45.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728511AbfEVGjy (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 22 May 2019 02:39:54 -0400
Received: by mail-ed1-f45.google.com with SMTP id j12so2138392eds.7
        for <linux-media@vger.kernel.org>; Tue, 21 May 2019 23:39:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=03awr9TytyC8LZ2EeFrWehJNk8LDmwH84vrRRHHlbKI=;
        b=iswcYhPif4Qdjoy+elggl0VnMkTz7YS/41fQLtmkO7oCdZD9w04v6klbV3dM7ORK+/
         A5QvTbSs7jYJQigRJ9zXR4gZq6/H2GAAnr9Xclx7rXHzRWk16+FM8MmVzs0vEt5/uQDs
         4rQL2gIfWA3KlAoGe2/AIi85TAPGPeI+cjLRg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=03awr9TytyC8LZ2EeFrWehJNk8LDmwH84vrRRHHlbKI=;
        b=SNqgYTdmZh31In2FnUSvMf18TcEsEpNEQHO2bxOwf8ad9AcAf27wGPIiO96gZi9AXT
         Xnr8MH9zZy83hUo5HNYpIs0ofQB8OxGL77tF1RzTsFydSMalgZ5IzQQ0ehSw8xMIcvLU
         DKwavhXIsHl+NsZQlTfx0X6lkJbDez5G9eqcRxhcDo5Nt/QKkXnHo4LnmIJgI0YSfYeD
         1EDBDdcE3rNHRAzZFkPm7Dy6oz2Jp8EcNOzV9klSHeICOvVgvlx0t3Ihh2rizdEQi8SJ
         wQKJLJPMmWOgAouG5Gp8zuyROdn4sSJM/6wAwlofs/eJdKRSu6SxMVLR87c/ivcfX+Go
         KXHQ==
X-Gm-Message-State: APjAAAVZkF4WGb2ZA8GKEc7LraiDrwPgALnpLAzYLzxy5tb7ABrrEIl0
        MxDyCUU+48WSdzRjELDGxksqr/yxlHEQmA==
X-Google-Smtp-Source: APXvYqzTdOGSf73SIGrORPQ8jBZmTio3AYncDl6K0TAQB7MDJ/pnjfX0V45ObD7IkvEkdyvX1LHi6Q==
X-Received: by 2002:a05:6402:16d2:: with SMTP id r18mr87227333edx.261.1558507191905;
        Tue, 21 May 2019 23:39:51 -0700 (PDT)
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com. [209.85.221.48])
        by smtp.gmail.com with ESMTPSA id cc8sm985524ejb.22.2019.05.21.23.39.50
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
        Tue, 21 May 2019 23:39:50 -0700 (PDT)
Received: by mail-wr1-f48.google.com with SMTP id f8so881793wrt.1
        for <linux-media@vger.kernel.org>; Tue, 21 May 2019 23:39:50 -0700 (PDT)
X-Received: by 2002:adf:fa4e:: with SMTP id y14mr41478239wrr.149.1558507189563;
 Tue, 21 May 2019 23:39:49 -0700 (PDT)
MIME-Version: 1.0
References: <0be542fabc57c38596bdb1db44aead7054a89158.camel@bootlin.com>
 <3e0d6d5106e9c0c27ef4b11e64a488726ff77103.camel@ndufresne.ca>
 <39ded6d4ddf85849bf45abc94dc8e104fd4c0978.camel@bootlin.com>
 <20190521154358.GC7098@ulmo> <124db795c1ed77854be6c565092c2820776ac223.camel@ndufresne.ca>
In-Reply-To: <124db795c1ed77854be6c565092c2820776ac223.camel@ndufresne.ca>
From:   Tomasz Figa <tfiga@chromium.org>
Date:   Wed, 22 May 2019 15:39:37 +0900
X-Gmail-Original-Message-ID: <CAAFQd5Cmv-CJAsQ7QdoEPYyCFLDjAJjFFLo8PMZT=zeOumnkmQ@mail.gmail.com>
Message-ID: <CAAFQd5Cmv-CJAsQ7QdoEPYyCFLDjAJjFFLo8PMZT=zeOumnkmQ@mail.gmail.com>
Subject: Re: Proposed updates and guidelines for MPEG-2, H.264 and H.265
 stateless support
To:     Nicolas Dufresne <nicolas@ndufresne.ca>
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Alexandre Courbot <acourbot@chromium.org>,
        Boris Brezillon <boris.brezillon@collabora.com>,
        Maxime Ripard <maxime.ripard@bootlin.com>,
        Jernej Skrabec <jernej.skrabec@siol.net>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Jonas Karlman <jonas@kwiboo.se>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, May 22, 2019 at 1:23 AM Nicolas Dufresne <nicolas@ndufresne.ca> wro=
te:
>
> Le mardi 21 mai 2019 =C3=A0 17:43 +0200, Thierry Reding a =C3=A9crit :
> > On Wed, May 15, 2019 at 07:42:50PM +0200, Paul Kocialkowski wrote:
> > > Hi,
> > >
> > > Le mercredi 15 mai 2019 =C3=A0 10:42 -0400, Nicolas Dufresne a =C3=A9=
crit :
> > > > Le mercredi 15 mai 2019 =C3=A0 12:09 +0200, Paul Kocialkowski a =C3=
=A9crit :
> > > > > Hi,
> > > > >
> > > > > With the Rockchip stateless VPU driver in the works, we now have =
a
> > > > > better idea of what the situation is like on platforms other than
> > > > > Allwinner. This email shares my conclusions about the situation a=
nd how
> > > > > we should update the MPEG-2, H.264 and H.265 controls accordingly=
.
> > > > >
> > > > > - Per-slice decoding
> > > > >
> > > > > We've discussed this one already[0] and Hans has submitted a patc=
h[1]
> > > > > to implement the required core bits. When we agree it looks good,=
 we
> > > > > should lift the restriction that all slices must be concatenated =
and
> > > > > have them submitted as individual requests.
> > > > >
> > > > > One question is what to do about other controls. I feel like it w=
ould
> > > > > make sense to always pass all the required controls for decoding =
the
> > > > > slice, including the ones that don't change across slices. But th=
ere
> > > > > may be no particular advantage to this and only downsides. Not do=
ing it
> > > > > and relying on the "control cache" can work, but we need to speci=
fy
> > > > > that only a single stream can be decoded per opened instance of t=
he
> > > > > v4l2 device. This is the assumption we're going with for handling
> > > > > multi-slice anyway, so it shouldn't be an issue.
> > > >
> > > > My opinion on this is that the m2m instance is a state, and the dri=
ver
> > > > should be responsible of doing time-division multiplexing across
> > > > multiple m2m instance jobs. Doing the time-division multiplexing in
> > > > userspace would require some sort of daemon to work properly across
> > > > processes. I also think the kernel is better place for doing resour=
ce
> > > > access scheduling in general.
> > >
> > > I agree with that yes. We always have a single m2m context and specif=
ic
> > > controls per opened device so keeping cached values works out well.
> > >
> > > So maybe we shall explicitly require that the request with the first
> > > slice for a frame also contains the per-frame controls.
> > >
> > > > > - Annex-B formats
> > > > >
> > > > > I don't think we have really reached a conclusion on the pixel fo=
rmats
> > > > > we want to expose. The main issue is how to deal with codecs that=
 need
> > > > > the full slice NALU with start code, where the slice_header is
> > > > > duplicated in raw bitstream, when others are fine with just the e=
ncoded
> > > > > slice data and the parsed slice header control.
> > > > >
> > > > > My initial thinking was that we'd need 3 formats:
> > > > > - One that only takes only the slice compressed data (without raw=
 slice
> > > > > header and start code);
> > > > > - One that takes both the NALU data (including start code, raw he=
ader
> > > > > and compressed data) and slice header controls;
> > > > > - One that takes the NALU data but no slice header.
> > > > >
> > > > > But I no longer think the latter really makes sense in the contex=
t of
> > > > > stateless video decoding.
> > > > >
> > > > > A side-note: I think we should definitely have data offsets in ev=
ery
> > > > > case, so that implementations can just push the whole NALU regard=
less
> > > > > of the format if they're lazy.
> > > >
> > > > I realize that I didn't share our latest research on the subject. S=
o a
> > > > slice in the original bitstream is formed of the following blocks
> > > > (simplified):
> > > >
> > > >   [nal_header][nal_type][slice_header][slice]
> > >
> > > Thanks for the details!
> > >
> > > > nal_header:
> > > > This one is a header used to locate the start and the end of the of=
 a
> > > > NAL. There is two standard forms, the ANNEX B / start code, a seque=
nce
> > > > of 3 bytes 0x00 0x00 0x01, you'll often see 4 bytes, the first byte
> > > > would be a leading 0 from the previous NAL padding, but this is als=
o
> > > > totally valid start code. The second form is the AVC form, notably =
used
> > > > in ISOMP4 container. It simply is the size of the NAL. You must kee=
p
> > > > your buffer aligned to NALs in this case as you cannot scan from ra=
ndom
> > > > location.
> > > >
> > > > nal_type:
> > > > It's a bit more then just the type, but it contains at least the
> > > > information of the nal type. This has different size on H.264 and H=
EVC
> > > > but I know it's size is in bytes.
> > > >
> > > > slice_header:
> > > > This contains per slice parameters, like the modification lists to
> > > > apply on the references. This one has a size in bits, not in bytes.
> > > >
> > > > slice:
> > > > I don't really know what is in it exactly, but this is the data use=
d to
> > > > decode. This bit has a special coding called the anti-emulation, wh=
ich
> > > > prevents a start-code from appearing in it. This coding is present =
in
> > > > both forms, ANNEX-B or AVC (in GStreamer and some reference manual =
they
> > > > call ANNEX-B the bytestream format).
> > > >
> > > > So, what we notice is that what is currently passed through Cedrus
> > > > driver:
> > > >   [nal_type][slice_header][slice]
> > > >
> > > > This matches what is being passed through VA-API. We can understand
> > > > that stripping off the slice_header would be hard, since it's size =
is
> > > > in bits. Instead we pass size and header_bit_size in slice_params.
> > >
> > > True, there is that.
> > >
> > > > About Rockchip. RK3288 is a Hantro G1 and has a bit called
> > > > start_code_e, when you turn this off, you don't need start code. As=
 a
> > > > side effect, the bitstream becomes identical. We do now know that i=
t
> > > > works with the ffmpeg branch implement for cedrus.
> > >
> > > Oh great, that makes life easier in the short term, but I guess the
> > > issue could arise on another decoder sooner or later.
> > >
> > > > Now what's special about Hantro G1 (also found on IMX8M) is that it
> > > > take care for us of reading and executing the modification lists fo=
und
> > > > in the slice header. Mostly because I very disliked having to pass =
the
> > > > p/b0/b1 parameters, is that Boris implemented in the driver the
> > > > transformation from the DPB entries into this p/b0/b1 list. These l=
ist
> > > > a standard, it's basically implementing 8.2.4.1 and 8.2.4.2. the
> > > > following section is the execution of the modification list. As thi=
s
> > > > list is not modified, it only need to be calculated per frame. As a
> > > > result, we don't need these new lists, and we can work with the sam=
e
> > > > H264_SLICE format as Cedrus is using.
> > >
> > > Yes but I definitely think it makes more sense to pass the list
> > > modifications rather than reconstructing those in the driver from a
> > > full list. IMO controls should stick to the bitstream as close as
> > > possible.
> > >
> > > > Now, this is just a start. For RK3399, we have a different CODEC
> > > > design. This one does not have the start_code_e bit. What the IP do=
es,
> > > > is that you give it one or more slice per buffer, setup the params,
> > > > start decoding, but the decoder then return the location of the
> > > > following NAL. So basically you could offload the scanning of start
> > > > code to the HW. That being said, with the driver layer in between, =
that
> > > > would be amazingly inconvenient to use, and with Boyer-more algorit=
hm,
> > > > it is pretty cheap to scan this type of start-code on CPU. But the
> > > > feature that this allows is to operate in frame mode. In this mode,=
 you
> > > > have 1 interrupt per frame.
> > >
> > > I'm not sure there is any interest in exposing that from userspace an=
d
> > > my current feeling is that we should just ditch support for per-frame
> > > decoding altogether. I think it mixes decoding with notions that are
> > > higher-level than decoding, but I agree it's a blurry line.
> >
> > I'm not sure ditching support for per-frame decoding would be a wise
> > decision. What if some device comes around that only supports frame
> > decoding and can't handle individual slices?
> >
> > We have such a situation on Tegra, for example. I think the hardware ca=
n
> > technically decode individual slices, but it can also be set up to do a
> > lot more and operate in basically a per-frame mode where you just pass
> > it a buffer containing the complete bitstream for one frame and it'll
> > just raise an interrupt when it's done decoding.
> >
> > Per-frame mode is what's currently implemented in the staging driver an=
d
> > as far as I can tell it's also what's implemented in the downstream
> > driver, which uses a completely different architecture (it uploads a
> > firmware that processes a command stream). I have seen registers that
> > seem to be related to a slice-decoding mode, but honestly I have no ide=
a
> > how to program them to achieve that.
> >
> > Now the VDE IP that I'm dealing with is pretty old, but from what I kno=
w
> > of newer IP, they follow a similar command stream architecture as the
> > downstream VDE driver, so I'm not sure those support per-slice decoding
> > either. They typically have a firmware that processes command streams
> > and userspace typically just passes a single bitstream buffer along wit=
h
> > reference frames and gets back the decoded frame. I'd have to
> > investigate further to understand if slice-level decoding is supported
> > on the newer hardware.
> >
> > I'm not familiar with any other decoders, but per-frame decoding doesn'=
t
> > strike me as a very exotic idea. Excluding such decoders from the ABI
> > sounds a bit premature.
>
> It would be premature to state that we are excluding. We are just
> trying to find one format to get things upstream, and make sure we have
> a plan how to extend it. Trying to support everything on the first try
> is not going to work so well.
>
> What is interesting to provide is how does you IP achieve multi-slice
> decoding per frame. That's what we are studying on the RK/Hantro chip.
> Typical questions are:
>
>   1. Do all slices have to be contiguous in memory
>   2. If 1., do you place start-code, AVC header or pass a seperate index =
to let the HW locate the start of each NAL ?
>   3. Does the HW do support single interrupt per frame (RK3288 as an exam=
ple does not, but RK3399 do)

AFAICT, the bit about RK3288 isn't true. At least in our downstream
driver that was created mostly by RK themselves, we've been assuming
that the interrupt is for the complete frame, without any problems.

Best regards,
Tomasz

>
> And other things like this. The more data we have, the better the
> initial interface will be.
>
> >
> > > > But it also support slice mode, with an
> > > > interrupt per slice, which is what we decided to use.
> > >
> > > Easier for everyone and probably better for latency as well :)
> >
> > I'm not sure I understand what's easier about slice-level decoding or
> > how this would improve latency. If anything getting less interrupts is
> > good, isn't it?
> >
> > If we can offload more to hardware, certainly that's something we want
> > to take advantage of, no?
>
> In H.264, pretty much all stream have single slice per frame. That's
> because it gives the highest quality. But in live streaming, like for
> webrtc, it's getting more common to actually encode with multiple
> slices (it's group of macroblocks usually in raster order). Usually
> it's a very small amount of slices, 4, 8, something in this range.
>
> When a slice is encoded, the encoder will let it go before it starts
> the following, this allow network transfer to happen in parallel of
> decoding.
>
> On the receiver, as soon as a slice is available, the decoder will be
> started immediately, which allow the receiving of buffer and the
> decoding of the slices to happen in parallel. You end up with a lot
> less delay between the reception of the last slice and having a full
> frame ready.
>
> So that's how slices are used to reduce latency. Now, if you are
> decoding from a container like ISOMP4, you'll have full frame, so it
> make sense to queue all these frame, and le the decoder bundle that if
> possible, if the HW allow to enable mode where you have single IRQ per
> frame. Though, it's pretty rare that you'll find such a file with
> slices. What we'd like to resolve is how these are resolved. There is
> nothing that prevents it right now in the uAPI, but you'd have to copy
> the input into another buffer, adding the separators if needed.
>
> What we are trying to achieve in this thread is to find a compromise
> that makes uAPI sane, but also makes decoding efficient on all the HW
> we know at least.
>
> >
> > Thierry
> >
> > > > So in this case, indeed we strictly require on start-code. Though, =
to
> > > > me this is not a great reason to make a new fourcc, so we will try =
and
> > > > use (data_offset =3D 3) in order to make some space for that start =
code,
> > > > and write it down in the driver. This is to be continued, we will
> > > > report back on this later. This could have some side effect in the
> > > > ability to import buffers. But most userspace don't try to do zero-=
copy
> > > > on the encoded size and just copy anyway.
> > > >
> > > > To my opinion, having a single format is a big deal, since userspac=
e
> > > > will generally be developed for one specific HW and we would endup =
with
> > > > fragmented support. What we really want to achieve is having a driv=
er
> > > > interface which works across multiple HW, and I think this is quite
> > > > possible.
> > >
> > > I agree with that. The more I think about it, the more I believe we
> > > should just pass the whole [nal_header][nal_type][slice_header][slice=
]
> > > and the parsed list in every scenario.
> > >
> > > For H.265, our decoder needs some information from the NAL type too.
> > > We currently extract that in userspace and stick it to the
> > > slice_header, but maybe it would make more sense to have drivers pars=
e
> > > that info from the buffer if they need it. On the other hand, it seem=
s
> > > quite common to pass information from the NAL type, so maybe we shoul=
d
> > > either make a new control for it or have all the fields in the
> > > slice_header (which would still be wrong in terms of matching bitstre=
am
> > > description).
> > >
> > > > > - Dropping the DPB concept in H.264/H.265
> > > > >
> > > > > As far as I could understand, the decoded picture buffer (DPB) is=
 a
> > > > > concept that only makes sense relative to a decoder implementatio=
n. The
> > > > > spec mentions how to manage it with the Hypothetical reference de=
coder
> > > > > (Annex C), but that's about it.
> > > > >
> > > > > What's really in the bitstream is the list of modified short-term=
 and
> > > > > long-term references, which is enough for every decoder.
> > > > >
> > > > > For this reason, I strongly believe we should stop talking about =
DPB in
> > > > > the controls and just pass these lists agremented with relevant
> > > > > information for userspace.
> > > > >
> > > > > I think it should be up to the driver to maintain a DPB and we co=
uld
> > > > > have helpers for common cases. For instance, the rockchip decoder=
 needs
> > > > > to keep unused entries around[2] and cedrus has the same requirem=
ent
> > > > > for H.264. However for cedrus/H.265, we don't need to do any book=
-
> > > > > keeping in particular and can manage with the lists from the bits=
tream
> > > > > directly.
> > > >
> > > > As discusses today, we still need to pass that list. It's being ind=
ex
> > > > by the HW to retrieve the extra information we have collected about=
 the
> > > > status of the reference frames. In the case of Hantro, which proces=
s
> > > > the modification list from the slice header for us, we also need th=
at
> > > > list to construct the unmodified list.
> > > >
> > > > So the problem here is just a naming problem. That list is not real=
ly a
> > > > DPB. It is just the list of long-term/short-term references with th=
e
> > > > status of these references. So maybe we could just rename as
> > > > references/reference_entry ?
> > >
> > > What I'd like to pass is the diff to the references list, as ffmpeg
> > > currently provides for v4l2 request and vaapi (probably vdpau too). N=
o
> > > functional change here, only that we should stop calling it a DPB,
> > > which confuses everyone.
> > >
> > > > > - Using flags
> > > > >
> > > > > The current MPEG-2 controls have lots of u8 values that can be
> > > > > represented as flags. Using flags also helps with padding.
> > > > > It's unlikely that we'll get more than 64 flags, so using a u64 b=
y
> > > > > default for that sounds fine (we definitely do want to keep some =
room
> > > > > available and I don't think using 32 bits as a default is good en=
ough).
> > > > >
> > > > > I think H.264/HEVC per-control flags should also be moved to u64.
> > > >
> > > > Make sense, I guess bits (member : 1) are not allowed in uAPI right=
 ?
> > >
> > > Mhh, even if they are, it makes it much harder to verify 32/64 bit
> > > alignment constraints (we're dealing with 64-bit platforms that need =
to
> > > have 32-bit userspace and compat_ioctl).
> > >
> > > > > - Clear split of controls and terminology
> > > > >
> > > > > Some codecs have explicit NAL units that are good fits to match a=
s
> > > > > controls: e.g. slice header, pps, sps. I think we should stick to=
 the
> > > > > bitstream element names for those.
> > > > >
> > > > > For H.264, that would suggest the following changes:
> > > > > - renaming v4l2_ctrl_h264_decode_param to v4l2_ctrl_h264_slice_he=
ader;
> > > >
> > > > Oops, I think you meant slice_prams ? decode_params matches the
> > > > information found in SPS/PPS (combined?), while slice_params matche=
s
> > > > the information extracted (and executed in case of l0/l1) from the
> > > > slice headers.
> > >
> > > Yes you're right, I mixed them up.
> > >
> > > >  That being said, to me this name wasn't confusing, since
> > > > it's not just the slice header, and it's per slice.
> > >
> > > Mhh, what exactly remains in there and where does it originate in the
> > > bitstream? Maybe it wouldn't be too bad to have one control per actua=
l
> > > group of bitstream elements.
> > >
> > > > > - killing v4l2_ctrl_h264_decode_param and having the reference li=
sts
> > > > > where they belong, which seems to be slice_header;
> > > >
> > > > There reference list is only updated by userspace (through it's DPB=
)
> > > > base on the result of the last decoding step. I was very confused f=
or a
> > > > moment until I realize that the lists in the slice_header are just =
a
> > > > list of modification to apply to the reference list in order to pro=
duce
> > > > l0 and l1.
> > >
> > > Indeed, and I'm suggesting that we pass the modifications only, which
> > > would fit a slice_header control.
> > >
> > > Cheers,
> > >
> > > Paul
> > >
> > > > > I'm up for preparing and submitting these control changes and upd=
ating
> > > > > cedrus if they seem agreeable.
> > > > >
> > > > > What do you think?
> > > > >
> > > > > Cheers,
> > > > >
> > > > > Paul
> > > > >
> > > > > [0]: https://lkml.org/lkml/2019/3/6/82
> > > > > [1]: https://patchwork.linuxtv.org/patch/55947/
> > > > > [2]: https://chromium.googlesource.com/chromiumos/third_party/ker=
nel/+/4d7cb46539a93bb6acc802f5a46acddb5aaab378
> > > > >
