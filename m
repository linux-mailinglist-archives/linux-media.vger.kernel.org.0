Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A61483842F
	for <lists+linux-media@lfdr.de>; Fri,  7 Jun 2019 08:11:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726928AbfFGGLk (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 7 Jun 2019 02:11:40 -0400
Received: from mail-ed1-f65.google.com ([209.85.208.65]:36240 "EHLO
        mail-ed1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726292AbfFGGLk (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 7 Jun 2019 02:11:40 -0400
Received: by mail-ed1-f65.google.com with SMTP id a8so1347142edx.3
        for <linux-media@vger.kernel.org>; Thu, 06 Jun 2019 23:11:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=16Sw0rpxklCK6HwFfFxojQHw/WJqCGlnAozZWf2R1OM=;
        b=YC9oD+r4Vp046ZfwSECEyIIcd9qoPd1FU3i8ofKy9e7HeQdyI5UUlGYOePhYK7F0rU
         CxQQ+VuqoAvKn5xweloPg6Zn9rwUrJ12Z8XQHQxVAjUy//0yUZb1c86e6MkMJ1NlyBqX
         jka2sl0O7tpTM288ArfmGo7VFnOHMIZ6QxBA8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=16Sw0rpxklCK6HwFfFxojQHw/WJqCGlnAozZWf2R1OM=;
        b=mZVus8PK0M2X7KBAxlangvtU9i4I7y0CeCq8ilNlyDBouKQ39FvR0hgY8Mg7ttt9pw
         hiPlhDaDvYcw67d+FIv2syLDI0k88ud5LruXm/DFTz7YotLQhjOnQtYIzZig2f57yxlk
         vyCMcSHb6oZIZMpIJSKJu/aV7CR8s1DGvR4wITw3B9G4g7UYlhsD7Zy18LI0scsutpXQ
         vGFx9ch7LBTa39R3mlpmVXGxRz6CqdYZN0ZfTD98Da62sAOo/eFMJ4B07Q8a8yHcTKQG
         8chkcqzt8OT39N/rZgtqX2hIj8VSkv6xZMyymOYCpVhvViVNJ4pJ0AM5lHQxFCdSRT7Z
         tsFg==
X-Gm-Message-State: APjAAAXELrRyDx1hZEBpv4MTHzj9Q0FvIVfuerUF2NJXrT+vDc4k9flF
        fvfm/5xjxi/wdpMekjLkxLrKxqpvvOyZKQ==
X-Google-Smtp-Source: APXvYqzrO6apHLNgn/dJnfxUMdpLRdCovkZA8jLWbpHZ2qagop0+DHEMnoCutF/HZ+F1DEFvhuUsNA==
X-Received: by 2002:a17:906:2acf:: with SMTP id m15mr45107014eje.31.1559887896575;
        Thu, 06 Jun 2019 23:11:36 -0700 (PDT)
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com. [209.85.221.48])
        by smtp.gmail.com with ESMTPSA id y4sm265475edb.64.2019.06.06.23.11.35
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
        Thu, 06 Jun 2019 23:11:35 -0700 (PDT)
Received: by mail-wr1-f48.google.com with SMTP id x4so862566wrt.6
        for <linux-media@vger.kernel.org>; Thu, 06 Jun 2019 23:11:35 -0700 (PDT)
X-Received: by 2002:adf:ed41:: with SMTP id u1mr17332350wro.162.1559887894441;
 Thu, 06 Jun 2019 23:11:34 -0700 (PDT)
MIME-Version: 1.0
References: <0be542fabc57c38596bdb1db44aead7054a89158.camel@bootlin.com>
 <3de878d39d32280b5a83001944dd2b4aea9b3d43.camel@ndufresne.ca>
 <8bcc41efa3f477ca34a3da203a2f3fa91474e502.camel@bootlin.com>
 <2793216.N2HdOGtWhe@jernej-laptop> <5d9a5567eed5148fc7ade7c9a9cef5dcb48f47db.camel@bootlin.com>
 <58ef7cda93864ed88922dce76fa6ddb8dac0a38d.camel@ndufresne.ca>
 <CAAFQd5AintQedU7b1PQ3WgaO+EruLLtOWPcwVd3azTx+hiENHg@mail.gmail.com>
 <6ab029d01d532540dfb170072ca5063feaded946.camel@bootlin.com>
 <20190522104246.GD30938@ulmo> <310ac52d-8290-cc17-08b2-436efe7da26a@xs4all.nl>
In-Reply-To: <310ac52d-8290-cc17-08b2-436efe7da26a@xs4all.nl>
From:   Tomasz Figa <tfiga@chromium.org>
Date:   Fri, 7 Jun 2019 15:11:20 +0900
X-Gmail-Original-Message-ID: <CAAFQd5BYzvovq6tQQXu6u7tdW=rAe_-ottdDe8qL-BzHNUqF9Q@mail.gmail.com>
Message-ID: <CAAFQd5BYzvovq6tQQXu6u7tdW=rAe_-ottdDe8qL-BzHNUqF9Q@mail.gmail.com>
Subject: Re: Proposed updates and guidelines for MPEG-2, H.264 and H.265
 stateless support
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        Nicolas Dufresne <nicolas@ndufresne.ca>,
        =?UTF-8?Q?Jernej_=C5=A0krabec?= <jernej.skrabec@siol.net>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Alexandre Courbot <acourbot@chromium.org>,
        Boris Brezillon <boris.brezillon@collabora.com>,
        Maxime Ripard <maxime.ripard@bootlin.com>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Jonas Karlman <jonas@kwiboo.se>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, May 22, 2019 at 7:56 PM Hans Verkuil <hverkuil-cisco@xs4all.nl> wro=
te:
>
> On 5/22/19 12:42 PM, Thierry Reding wrote:
> > On Wed, May 22, 2019 at 10:26:28AM +0200, Paul Kocialkowski wrote:
> >> Hi,
> >>
> >> Le mercredi 22 mai 2019 =C3=A0 15:48 +0900, Tomasz Figa a =C3=A9crit :
> >>> On Sat, May 18, 2019 at 11:09 PM Nicolas Dufresne <nicolas@ndufresne.=
ca> wrote:
> >>>> Le samedi 18 mai 2019 =C3=A0 12:29 +0200, Paul Kocialkowski a =C3=A9=
crit :
> >>>>> Hi,
> >>>>>
> >>>>> Le samedi 18 mai 2019 =C3=A0 12:04 +0200, Jernej =C5=A0krabec a =C3=
=A9crit :
> >>>>>> Dne sobota, 18. maj 2019 ob 11:50:37 CEST je Paul Kocialkowski nap=
isal(a):
> >>>>>>> Hi,
> >>>>>>>
> >>>>>>> On Fri, 2019-05-17 at 16:43 -0400, Nicolas Dufresne wrote:
> >>>>>>>> Le jeudi 16 mai 2019 =C3=A0 20:45 +0200, Paul Kocialkowski a =C3=
=A9crit :
> >>>>>>>>> Hi,
> >>>>>>>>>
> >>>>>>>>> Le jeudi 16 mai 2019 =C3=A0 14:24 -0400, Nicolas Dufresne a =C3=
=A9crit :
> >>>>>>>>>> Le mercredi 15 mai 2019 =C3=A0 22:59 +0200, Paul Kocialkowski =
a =C3=A9crit :
> >>>>>>>>>>> Hi,
> >>>>>>>>>>>
> >>>>>>>>>>> Le mercredi 15 mai 2019 =C3=A0 14:54 -0400, Nicolas Dufresne =
a =C3=A9crit :
> >>>>>>>>>>>> Le mercredi 15 mai 2019 =C3=A0 19:42 +0200, Paul Kocialkowsk=
i a =C3=A9crit :
> >>>>>>>>>>>>> Hi,
> >>>>>>>>>>>>>
> >>>>>>>>>>>>> Le mercredi 15 mai 2019 =C3=A0 10:42 -0400, Nicolas Dufresn=
e a =C3=A9crit
> >>>>>> :
> >>>>>>>>>>>>>> Le mercredi 15 mai 2019 =C3=A0 12:09 +0200, Paul Kocialkow=
ski a
> >>>>>> =C3=A9crit :
> >>>>>>>>>>>>>>> Hi,
> >>>>>>>>>>>>>>>
> >>>>>>>>>>>>>>> With the Rockchip stateless VPU driver in the works, we n=
ow
> >>>>>>>>>>>>>>> have a
> >>>>>>>>>>>>>>> better idea of what the situation is like on platforms ot=
her
> >>>>>>>>>>>>>>> than
> >>>>>>>>>>>>>>> Allwinner. This email shares my conclusions about the
> >>>>>>>>>>>>>>> situation and how
> >>>>>>>>>>>>>>> we should update the MPEG-2, H.264 and H.265 controls
> >>>>>>>>>>>>>>> accordingly.
> >>>>>>>>>>>>>>>
> >>>>>>>>>>>>>>> - Per-slice decoding
> >>>>>>>>>>>>>>>
> >>>>>>>>>>>>>>> We've discussed this one already[0] and Hans has submitte=
d a
> >>>>>>>>>>>>>>> patch[1]
> >>>>>>>>>>>>>>> to implement the required core bits. When we agree it loo=
ks
> >>>>>>>>>>>>>>> good, we
> >>>>>>>>>>>>>>> should lift the restriction that all slices must be
> >>>>>>>>>>>>>>> concatenated and
> >>>>>>>>>>>>>>> have them submitted as individual requests.
> >>>>>>>>>>>>>>>
> >>>>>>>>>>>>>>> One question is what to do about other controls. I feel l=
ike
> >>>>>>>>>>>>>>> it would
> >>>>>>>>>>>>>>> make sense to always pass all the required controls for
> >>>>>>>>>>>>>>> decoding the
> >>>>>>>>>>>>>>> slice, including the ones that don't change across slices=
.
> >>>>>>>>>>>>>>> But there
> >>>>>>>>>>>>>>> may be no particular advantage to this and only downsides=
.
> >>>>>>>>>>>>>>> Not doing it
> >>>>>>>>>>>>>>> and relying on the "control cache" can work, but we need =
to
> >>>>>>>>>>>>>>> specify
> >>>>>>>>>>>>>>> that only a single stream can be decoded per opened insta=
nce
> >>>>>>>>>>>>>>> of the
> >>>>>>>>>>>>>>> v4l2 device. This is the assumption we're going with for
> >>>>>>>>>>>>>>> handling
> >>>>>>>>>>>>>>> multi-slice anyway, so it shouldn't be an issue.
> >>>>>>>>>>>>>>
> >>>>>>>>>>>>>> My opinion on this is that the m2m instance is a state, an=
d
> >>>>>>>>>>>>>> the driver
> >>>>>>>>>>>>>> should be responsible of doing time-division multiplexing
> >>>>>>>>>>>>>> across
> >>>>>>>>>>>>>> multiple m2m instance jobs. Doing the time-division
> >>>>>>>>>>>>>> multiplexing in
> >>>>>>>>>>>>>> userspace would require some sort of daemon to work proper=
ly
> >>>>>>>>>>>>>> across
> >>>>>>>>>>>>>> processes. I also think the kernel is better place for doi=
ng
> >>>>>>>>>>>>>> resource
> >>>>>>>>>>>>>> access scheduling in general.
> >>>>>>>>>>>>>
> >>>>>>>>>>>>> I agree with that yes. We always have a single m2m context =
and
> >>>>>>>>>>>>> specific
> >>>>>>>>>>>>> controls per opened device so keeping cached values works o=
ut
> >>>>>>>>>>>>> well.
> >>>>>>>>>>>>>
> >>>>>>>>>>>>> So maybe we shall explicitly require that the request with =
the
> >>>>>>>>>>>>> first
> >>>>>>>>>>>>> slice for a frame also contains the per-frame controls.
> >>>>>>>>>>>>>
> >>>>>>>>>>>>>>> - Annex-B formats
> >>>>>>>>>>>>>>>
> >>>>>>>>>>>>>>> I don't think we have really reached a conclusion on the
> >>>>>>>>>>>>>>> pixel formats
> >>>>>>>>>>>>>>> we want to expose. The main issue is how to deal with cod=
ecs
> >>>>>>>>>>>>>>> that need
> >>>>>>>>>>>>>>> the full slice NALU with start code, where the slice_head=
er
> >>>>>>>>>>>>>>> is
> >>>>>>>>>>>>>>> duplicated in raw bitstream, when others are fine with ju=
st
> >>>>>>>>>>>>>>> the encoded
> >>>>>>>>>>>>>>> slice data and the parsed slice header control.
> >>>>>>>>>>>>>>>
> >>>>>>>>>>>>>>> My initial thinking was that we'd need 3 formats:
> >>>>>>>>>>>>>>> - One that only takes only the slice compressed data
> >>>>>>>>>>>>>>> (without raw slice
> >>>>>>>>>>>>>>> header and start code);
> >>>>>>>>>>>>>>> - One that takes both the NALU data (including start code=
,
> >>>>>>>>>>>>>>> raw header
> >>>>>>>>>>>>>>> and compressed data) and slice header controls;
> >>>>>>>>>>>>>>> - One that takes the NALU data but no slice header.
> >>>>>>>>>>>>>>>
> >>>>>>>>>>>>>>> But I no longer think the latter really makes sense in th=
e
> >>>>>>>>>>>>>>> context of
> >>>>>>>>>>>>>>> stateless video decoding.
> >>>>>>>>>>>>>>>
> >>>>>>>>>>>>>>> A side-note: I think we should definitely have data offse=
ts
> >>>>>>>>>>>>>>> in every
> >>>>>>>>>>>>>>> case, so that implementations can just push the whole NAL=
U
> >>>>>>>>>>>>>>> regardless
> >>>>>>>>>>>>>>> of the format if they're lazy.
> >>>>>>>>>>>>>>
> >>>>>>>>>>>>>> I realize that I didn't share our latest research on the
> >>>>>>>>>>>>>> subject. So a
> >>>>>>>>>>>>>> slice in the original bitstream is formed of the following
> >>>>>>>>>>>>>> blocks
> >>>>>>>>>>>>>>
> >>>>>>>>>>>>>> (simplified):
> >>>>>>>>>>>>>>   [nal_header][nal_type][slice_header][slice]
> >>>>>>>>>>>>>
> >>>>>>>>>>>>> Thanks for the details!
> >>>>>>>>>>>>>
> >>>>>>>>>>>>>> nal_header:
> >>>>>>>>>>>>>> This one is a header used to locate the start and the end =
of
> >>>>>>>>>>>>>> the of a
> >>>>>>>>>>>>>> NAL. There is two standard forms, the ANNEX B / start code=
, a
> >>>>>>>>>>>>>> sequence
> >>>>>>>>>>>>>> of 3 bytes 0x00 0x00 0x01, you'll often see 4 bytes, the f=
irst
> >>>>>>>>>>>>>> byte
> >>>>>>>>>>>>>> would be a leading 0 from the previous NAL padding, but th=
is
> >>>>>>>>>>>>>> is also
> >>>>>>>>>>>>>> totally valid start code. The second form is the AVC form,
> >>>>>>>>>>>>>> notably used
> >>>>>>>>>>>>>> in ISOMP4 container. It simply is the size of the NAL. You
> >>>>>>>>>>>>>> must keep
> >>>>>>>>>>>>>> your buffer aligned to NALs in this case as you cannot sca=
n
> >>>>>>>>>>>>>> from random
> >>>>>>>>>>>>>> location.
> >>>>>>>>>>>>>>
> >>>>>>>>>>>>>> nal_type:
> >>>>>>>>>>>>>> It's a bit more then just the type, but it contains at lea=
st
> >>>>>>>>>>>>>> the
> >>>>>>>>>>>>>> information of the nal type. This has different size on H.=
264
> >>>>>>>>>>>>>> and HEVC
> >>>>>>>>>>>>>> but I know it's size is in bytes.
> >>>>>>>>>>>>>>
> >>>>>>>>>>>>>> slice_header:
> >>>>>>>>>>>>>> This contains per slice parameters, like the modification
> >>>>>>>>>>>>>> lists to
> >>>>>>>>>>>>>> apply on the references. This one has a size in bits, not =
in
> >>>>>>>>>>>>>> bytes.
> >>>>>>>>>>>>>>
> >>>>>>>>>>>>>> slice:
> >>>>>>>>>>>>>> I don't really know what is in it exactly, but this is the
> >>>>>>>>>>>>>> data used to
> >>>>>>>>>>>>>> decode. This bit has a special coding called the
> >>>>>>>>>>>>>> anti-emulation, which
> >>>>>>>>>>>>>> prevents a start-code from appearing in it. This coding is
> >>>>>>>>>>>>>> present in
> >>>>>>>>>>>>>> both forms, ANNEX-B or AVC (in GStreamer and some referenc=
e
> >>>>>>>>>>>>>> manual they
> >>>>>>>>>>>>>> call ANNEX-B the bytestream format).
> >>>>>>>>>>>>>>
> >>>>>>>>>>>>>> So, what we notice is that what is currently passed throug=
h
> >>>>>>>>>>>>>> Cedrus
> >>>>>>>>>>>>>>
> >>>>>>>>>>>>>> driver:
> >>>>>>>>>>>>>>   [nal_type][slice_header][slice]
> >>>>>>>>>>>>>>
> >>>>>>>>>>>>>> This matches what is being passed through VA-API. We can
> >>>>>>>>>>>>>> understand
> >>>>>>>>>>>>>> that stripping off the slice_header would be hard, since i=
t's
> >>>>>>>>>>>>>> size is
> >>>>>>>>>>>>>> in bits. Instead we pass size and header_bit_size in
> >>>>>>>>>>>>>> slice_params.
> >>>>>>>>>>>>>
> >>>>>>>>>>>>> True, there is that.
> >>>>>>>>>>>>>
> >>>>>>>>>>>>>> About Rockchip. RK3288 is a Hantro G1 and has a bit called
> >>>>>>>>>>>>>> start_code_e, when you turn this off, you don't need start
> >>>>>>>>>>>>>> code. As a
> >>>>>>>>>>>>>> side effect, the bitstream becomes identical. We do now kn=
ow
> >>>>>>>>>>>>>> that it
> >>>>>>>>>>>>>> works with the ffmpeg branch implement for cedrus.
> >>>>>>>>>>>>>
> >>>>>>>>>>>>> Oh great, that makes life easier in the short term, but I g=
uess
> >>>>>>>>>>>>> the
> >>>>>>>>>>>>> issue could arise on another decoder sooner or later.
> >>>>>>>>>>>>>
> >>>>>>>>>>>>>> Now what's special about Hantro G1 (also found on IMX8M) i=
s
> >>>>>>>>>>>>>> that it
> >>>>>>>>>>>>>> take care for us of reading and executing the modification
> >>>>>>>>>>>>>> lists found
> >>>>>>>>>>>>>> in the slice header. Mostly because I very disliked having=
 to
> >>>>>>>>>>>>>> pass the
> >>>>>>>>>>>>>> p/b0/b1 parameters, is that Boris implemented in the drive=
r
> >>>>>>>>>>>>>> the
> >>>>>>>>>>>>>> transformation from the DPB entries into this p/b0/b1 list=
.
> >>>>>>>>>>>>>> These list
> >>>>>>>>>>>>>> a standard, it's basically implementing 8.2.4.1 and 8.2.4.=
2.
> >>>>>>>>>>>>>> the
> >>>>>>>>>>>>>> following section is the execution of the modification lis=
t.
> >>>>>>>>>>>>>> As this
> >>>>>>>>>>>>>> list is not modified, it only need to be calculated per fr=
ame.
> >>>>>>>>>>>>>> As a
> >>>>>>>>>>>>>> result, we don't need these new lists, and we can work wit=
h
> >>>>>>>>>>>>>> the same
> >>>>>>>>>>>>>> H264_SLICE format as Cedrus is using.
> >>>>>>>>>>>>>
> >>>>>>>>>>>>> Yes but I definitely think it makes more sense to pass the =
list
> >>>>>>>>>>>>> modifications rather than reconstructing those in the drive=
r
> >>>>>>>>>>>>> from a
> >>>>>>>>>>>>> full list. IMO controls should stick to the bitstream as cl=
ose
> >>>>>>>>>>>>> as
> >>>>>>>>>>>>> possible.
> >>>>>>>>>>>>
> >>>>>>>>>>>> For Hantro and RKVDEC, the list of modification is parsed by=
 the
> >>>>>>>>>>>> IP
> >>>>>>>>>>>> from the slice header bits. Just to make sure, because I mys=
elf
> >>>>>>>>>>>> was
> >>>>>>>>>>>> confused on this before, the slice header does not contain a=
 list
> >>>>>>>>>>>> of
> >>>>>>>>>>>> references, instead it contains a list modification to be ap=
plied
> >>>>>>>>>>>> to
> >>>>>>>>>>>> the reference list. I need to check again, but to execute th=
ese
> >>>>>>>>>>>> modification, you need to filter and sort the references in =
a
> >>>>>>>>>>>> specific
> >>>>>>>>>>>> order. This should be what is defined in the spec as 8.2.4.1=
 and
> >>>>>>>>>>>> 8.2.4.2. Then 8.2.4.3 is the process that creates the l0/l1.
> >>>>>>>>>>>>
> >>>>>>>>>>>> The list of references is deduced from the DPB. The DPB, whi=
ch I
> >>>>>>>>>>>> thinks
> >>>>>>>>>>>> should be rename as "references", seems more useful then p/b=
0/b1,
> >>>>>>>>>>>> since
> >>>>>>>>>>>> this is the data that gives use the ability to implementing =
glue
> >>>>>>>>>>>> in the
> >>>>>>>>>>>> driver to compensate some HW differences.
> >>>>>>>>>>>>
> >>>>>>>>>>>> In the case of Hantro / RKVDEC, we think it's natural to bui=
ld the
> >>>>>>>>>>>> HW
> >>>>>>>>>>>> specific lists (p/b0/b1) from the references rather then add=
ing HW
> >>>>>>>>>>>> specific list in the decode_params structure. The fact these=
 lists
> >>>>>>>>>>>> are
> >>>>>>>>>>>> standard intermediate step of the standard is not that impor=
tant.
> >>>>>>>>>>>
> >>>>>>>>>>> Sorry I got confused (once more) about it. Boris just explain=
ed the
> >>>>>>>>>>> same thing to me over IRC :) Anyway my point is that we want =
to pass
> >>>>>>>>>>> what's in ffmpeg's short and long term ref lists, and name th=
em that
> >>>>>>>>>>> instead of dpb.
> >>>>>>>>>>>
> >>>>>>>>>>>>>> Now, this is just a start. For RK3399, we have a different
> >>>>>>>>>>>>>> CODEC
> >>>>>>>>>>>>>> design. This one does not have the start_code_e bit. What =
the
> >>>>>>>>>>>>>> IP does,
> >>>>>>>>>>>>>> is that you give it one or more slice per buffer, setup th=
e
> >>>>>>>>>>>>>> params,
> >>>>>>>>>>>>>> start decoding, but the decoder then return the location o=
f
> >>>>>>>>>>>>>> the
> >>>>>>>>>>>>>> following NAL. So basically you could offload the scanning=
 of
> >>>>>>>>>>>>>> start
> >>>>>>>>>>>>>> code to the HW. That being said, with the driver layer in
> >>>>>>>>>>>>>> between, that
> >>>>>>>>>>>>>> would be amazingly inconvenient to use, and with Boyer-mor=
e
> >>>>>>>>>>>>>> algorithm,
> >>>>>>>>>>>>>> it is pretty cheap to scan this type of start-code on CPU.=
 But
> >>>>>>>>>>>>>> the
> >>>>>>>>>>>>>> feature that this allows is to operate in frame mode. In t=
his
> >>>>>>>>>>>>>> mode, you
> >>>>>>>>>>>>>> have 1 interrupt per frame.
> >>>>>>>>>>>>>
> >>>>>>>>>>>>> I'm not sure there is any interest in exposing that from
> >>>>>>>>>>>>> userspace and
> >>>>>>>>>>>>> my current feeling is that we should just ditch support for
> >>>>>>>>>>>>> per-frame
> >>>>>>>>>>>>> decoding altogether. I think it mixes decoding with notions=
 that
> >>>>>>>>>>>>> are
> >>>>>>>>>>>>> higher-level than decoding, but I agree it's a blurry line.
> >>>>>>>>>>>>
> >>>>>>>>>>>> I'm not worried about this either. We can already support th=
at by
> >>>>>>>>>>>> copying the bitstream internally to the driver, though zero-=
copy
> >>>>>>>>>>>> with
> >>>>>>>>>>>> this would require a new format, the one we talked about,
> >>>>>>>>>>>> SLICE_ANNEX_B.
> >>>>>>>>>>>
> >>>>>>>>>>> Right, but what I'm thinking about is making that the one and=
 only
> >>>>>>>>>>> format. The rationale is that it's always easier to just appe=
nd a
> >>>>>>>>>>> start
> >>>>>>>>>>> code from userspace if needed. And we need a bit offset to th=
e slice
> >>>>>>>>>>> data part anyway, so it doesn't hurt to require a few extra b=
its to
> >>>>>>>>>>> have the whole thing that will work in every situation.
> >>>>>>>>>>
> >>>>>>>>>> What I'd like is to eventually allow zero-copy (aka userptr) i=
nto the
> >>>>>>>>>> driver. If you make the start code mandatory, any decoding fro=
m ISOMP4
> >>>>>>>>>> (.mp4, .mov) will require a full bitstream copy in userspace t=
o add
> >>>>>>>>>> the
> >>>>>>>>>> start code (unless you hack your allocation in your demuxer, b=
ut it's
> >>>>>>>>>> a
> >>>>>>>>>> bit complicated since this code might come from two libraries)=
. In
> >>>>>>>>>> ISOMP4, you have an AVC header, which is just the size of the =
NAL that
> >>>>>>>>>> follows.
> >>>>>>>>>
> >>>>>>>>> Well, I think we have to do a copy from system memory to the bu=
ffer
> >>>>>>>>> allocated by v4l2 anyway. Our hardware pipelines can reasonably=
 be
> >>>>>>>>> expected not to have any MMU unit and not allow sg import anywa=
y.
> >>>>>>>>
> >>>>>>>> The Rockchip has an mmu. You need one copy at least indeed,
> >>>>>>>
> >>>>>>> Is the MMU in use currently? That can make things troublesome if =
we run
> >>>>>>> into a case where the VPU has MMU and deals with scatter-gather w=
hile
> >>>>>>> the display part doesn't. As far as I know, there's no way for
> >>>>>>> userspace to know whether a dma-buf-exported buffer is backed by =
CMA or
> >>>>>>> by scatter-gather memory. This feels like a major issue for using=
 dma-
> >>>>>>> buf, since userspace can't predict whether a buffer exported on o=
ne
> >>>>>>> device can be imported on another when building its pipeline.
> >>>>>>
> >>>>>> FYI, Allwinner H6 also has IOMMU, it's just that there is no mainl=
ine driver
> >>>>>> for it yet. It is supported for display, both VPUs and some other =
devices. I
> >>>>>> think no sane SoC designer would left out one or another unit with=
out IOMMU
> >>>>>> support, that just calls for troubles, as you pointed out.
> >>>>>
> >>>>> Right right, I've been following that from a distance :)
> >>>>>
> >>>>> Indeed I think it's realistic to expect that for now, but it may no=
t
> >>>>> play out so well in the long term. For instance, maybe connecting a=
 USB
> >>>>> display would require CMA when the rest of the system can do with s=
g.
> >>>>>
> >>>>> I think it would really be useful for userspace to have a way to te=
st
> >>>>> whether a buffer can be imported from one device to another. It fee=
ls
> >>>>> better than indicating where the memory lives, since there are
> >>>>> countless cases where additional restrictions apply too.
> >>>>
> >>>> I don't know for the integration on the Rockchip, but I did notice t=
he
> >>>> register documentation for it.
> >>>
> >>> All the important components in the SoC have their IOMMUs as well -
> >>> display controller, GPU.
> >>>
> >>> There is a blitter called RGA that is not behind an IOMMU, but has
> >>> some scatter-gather capability (with a need for the hardware sg table
> >>> to be physically contiguous).
> >>
> >> That's definitely good to know and justfies the need to introduce a wa=
y
> >> for userspace to check if a buffer can be imported from one device to
> >> another.
> >
> > There's been a lot of discussion about this before. You may be aware of
> > James Jones' attempt to create an allocator library for this:
> >
> >       https://github.com/cubanismo/allocator
> >
> > I haven't heard an update on this for quite some time and I think it's
> > stagnated due to a lack of interest. However, I think the lack of
> > interest could be an indicator that the issue might not be pressing
> > enough. Luckily most SoCs are reasonably integrated, so there's usually
> > no issue sharing buffers between different hardware blocks.
> >
> > Technically it's already possible to check for compatibility of buffers
> > at import time.
> >
> > In the tegra-vde driver we do something along the lines of:
> >
> >       sgt =3D dma_buf_map_attachment(...);
> >       ...
> >       if (sgt->nents !=3D 1)
> >               return -EINVAL;
> >
> > because we don't support an IOMMU currently. Of course its still up to
> > userspace to react to that in a sensible way and it may not be obvious
> > what to do when the import fails.
> >
> >>> That said, significance of such blitters
> >>> nowadays is rather low, as most of the time you need a compositor on
> >>> the GPU anyway, which can do any transformation in the same pass as
> >>> the composition.
> >>
> >> I think that is a crucial mistake and the way I see things, this will
> >> have to change eventually. We cannot keep under-using the fast and
> >> efficient hardware components and going with the war machine that is
> >> the GPU in all situations. This has caused enough trouble in the
> >> GNU/Linux userspace display stack already and I strongly believe it ha=
s
> >> to stop.
> >
> > Unfortunately there's really no good API to develop drivers against. Al=
l
> > of the 2D APIs that exist are not really efficient when implemented via
> > hardware-accelerated drivers. And none of the attempts at defining an
> > API for hardware-accelerated 2D haven't really gained any momentum.
> >
> > I had looked a bit at ways to make use of some compositing hardware tha=
t
> > we have on Tegra (which is like a blender/blitter of a sort) and the
> > best thing I could find would've been to accelerate some paths in Mesa.
> > However that would require quite a bit of infrastructure work because i=
t
> > currently completely relies on GPU shaders to accelerate those paths.
> >
> > Daniel has written a very interesting bit about this, in case you
> > haven't seen it yet:
> >
> >       https://blog.ffwll.ch/2018/08/no-2d-in-drm.html
> >
> >>>> In general, the most significant gain
> >>>> with having iommu for CODECs is that it makes start up (and re-init)
> >>>> time much shorter, but also in a much more predictable duration. I d=
o
> >>>> believe that the Venus driver (qualcomm) is one with solid support f=
or
> >>>> this, and it's quite noticably more snappy then the others.
> >>>
> >>> Obviously you also get support for USERPTR if you have an IOMMU, but
> >>> that also has some costs - you need to pin the user pages and map to
> >>> the IOMMU before each frame and unmap and unpin after each frame,
> >>> which sometimes is more costly than actually having the userspace cop=
y
> >>> to a preallocated and premapped buffer, especially for relatively
> >>> small contents, such as compressed bitstream.
> >>
> >> Heh, interesting point!
> >
> > I share the same experience. Bitstream buffers are usually so small tha=
t
> > you can always find a physically contiguous memory region for them and =
a
> > memcpy() will be faster than the overhead of getting an IOMMU involved.
> > This obviously depends on the specific hardware, but there's always som=
e
> > threshold before which mapping through an IOMMU just doesn't make sense
> > from a fragmentation and/or performance point of view.
> >
> > I wonder, though, if it's not possible to keep userptr buffers around
> > and avoid the constant mapping/unmapping. If we only performed cache
> > maintenance on them as necessary, perhaps that could provide a viable,
> > maybe even good, zero-copy mechanism.
>
> The vb2 framework will keep the mapping for a userptr as long as userspac=
e
> uses the same userptr for every buffer.
>
> I.e. the first time a buffer with index I is queued the userptr is mapped=
.
> If that buffer is later dequeued and then requeued again with the same
> userptr the vb2 core will reuse the old mapping. Otherwise it will unmap
> and map again with the new userptr.

That's a good point. I forgot that we've been seeing random memory
corruptions (fortunately of the userptr memory only, not random system
memory) because of this behavior and carrying a patch in all
downstream branches to remove this caching.

I can see that we keep references on the pages that corresponded to
the user VMA at the time the buffer was queued, but are we guaranteed
that the list of pages backing that VMA hasn't changed over time?

>
> The same is done for dmabuf, BTW. So if userspace keeps changing dmabuf
> fds for each buffer, then that is not optimal.

We could possibly try to search through the other buffers and reuse
the mapping if there is a match?

Best regards,
Tomasz
