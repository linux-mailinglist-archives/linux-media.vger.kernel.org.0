Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E091A25E4B
	for <lists+linux-media@lfdr.de>; Wed, 22 May 2019 08:48:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726480AbfEVGsa (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 22 May 2019 02:48:30 -0400
Received: from mail-ed1-f46.google.com ([209.85.208.46]:39596 "EHLO
        mail-ed1-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725796AbfEVGsa (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 22 May 2019 02:48:30 -0400
Received: by mail-ed1-f46.google.com with SMTP id e24so2170342edq.6
        for <linux-media@vger.kernel.org>; Tue, 21 May 2019 23:48:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=0gIeIjno51N6nlOHgHexG1yX9EF2HUMz6jQ/6lE07Co=;
        b=L8EOVIXfZ0l0wOKGCnyOTeI+lgrCcsg5Ie8kzFrR2ULStUsNGUk5I34+1zhxRLenW+
         mrZuSyYxnieyjQpDH36befYkky8kU1Ei15W8MwyD/hDG6YIH23pZlNgdm8l0QblKRRIw
         bRbWUWQDe7FI7UFFcJzZg5hB4hGcfXkeohihA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=0gIeIjno51N6nlOHgHexG1yX9EF2HUMz6jQ/6lE07Co=;
        b=cwpCiyfp/vgTBv9C3Dk21UDXUWU5pBV/K66giguY5G5xPa6Z239sqKpI/e5TpYUg2i
         YkH31sSU2afXvEVEaUVhwDh3nJV27PypTMJ7hTk5BL+CfJALPqVl+dgL2i6TARXKzGYc
         U6Yf2ISxw1jhf+lnjMmX2HVDzS3NAy1bLpOiV1VOhR6VLoDR3UFNt+ti/AUbkc0QIYBT
         WUkIhJOhjddtT5Bky2xvBvzkanL5tY3BqTnkuA8m4jjVFoFf6tmZGDxi037f2D9ntFLB
         xFewmPuu2cg99kyRKiYw5DLN/H5PSGkGvxZFFncq1ODb5MWkBx9gGNvDm6jibuq4jaB5
         eRDQ==
X-Gm-Message-State: APjAAAW7qLuMHI7wIFuY6ptZNzu+c2ImUVGO5UV7VuaHm/FYSXL5JuMV
        O0FQiq3uRKSgj1hwcjUgPwY26uT4c48a9QZh
X-Google-Smtp-Source: APXvYqy0W8p0oA6+yMzGavgTwBaHpEqANWRjpiHARpv4nMiWezT9qwm/nt0jpksL+sxv8o4yfWaa8g==
X-Received: by 2002:aa7:dd03:: with SMTP id i3mr50561016edv.93.1558507704690;
        Tue, 21 May 2019 23:48:24 -0700 (PDT)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com. [209.85.128.46])
        by smtp.gmail.com with ESMTPSA id h46sm6802055edh.66.2019.05.21.23.48.23
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
        Tue, 21 May 2019 23:48:24 -0700 (PDT)
Received: by mail-wm1-f46.google.com with SMTP id 7so896531wmo.2
        for <linux-media@vger.kernel.org>; Tue, 21 May 2019 23:48:23 -0700 (PDT)
X-Received: by 2002:a1c:2dd2:: with SMTP id t201mr6029346wmt.136.1558507702596;
 Tue, 21 May 2019 23:48:22 -0700 (PDT)
MIME-Version: 1.0
References: <0be542fabc57c38596bdb1db44aead7054a89158.camel@bootlin.com>
 <3de878d39d32280b5a83001944dd2b4aea9b3d43.camel@ndufresne.ca>
 <8bcc41efa3f477ca34a3da203a2f3fa91474e502.camel@bootlin.com>
 <2793216.N2HdOGtWhe@jernej-laptop> <5d9a5567eed5148fc7ade7c9a9cef5dcb48f47db.camel@bootlin.com>
 <58ef7cda93864ed88922dce76fa6ddb8dac0a38d.camel@ndufresne.ca>
In-Reply-To: <58ef7cda93864ed88922dce76fa6ddb8dac0a38d.camel@ndufresne.ca>
From:   Tomasz Figa <tfiga@chromium.org>
Date:   Wed, 22 May 2019 15:48:10 +0900
X-Gmail-Original-Message-ID: <CAAFQd5AintQedU7b1PQ3WgaO+EruLLtOWPcwVd3azTx+hiENHg@mail.gmail.com>
Message-ID: <CAAFQd5AintQedU7b1PQ3WgaO+EruLLtOWPcwVd3azTx+hiENHg@mail.gmail.com>
Subject: Re: Proposed updates and guidelines for MPEG-2, H.264 and H.265
 stateless support
To:     Nicolas Dufresne <nicolas@ndufresne.ca>
Cc:     Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        =?UTF-8?Q?Jernej_=C5=A0krabec?= <jernej.skrabec@siol.net>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Alexandre Courbot <acourbot@chromium.org>,
        Boris Brezillon <boris.brezillon@collabora.com>,
        Maxime Ripard <maxime.ripard@bootlin.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Jonas Karlman <jonas@kwiboo.se>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Sat, May 18, 2019 at 11:09 PM Nicolas Dufresne <nicolas@ndufresne.ca> wr=
ote:
>
> Le samedi 18 mai 2019 =C3=A0 12:29 +0200, Paul Kocialkowski a =C3=A9crit =
:
> > Hi,
> >
> > Le samedi 18 mai 2019 =C3=A0 12:04 +0200, Jernej =C5=A0krabec a =C3=A9c=
rit :
> > > Dne sobota, 18. maj 2019 ob 11:50:37 CEST je Paul Kocialkowski napisa=
l(a):
> > > > Hi,
> > > >
> > > > On Fri, 2019-05-17 at 16:43 -0400, Nicolas Dufresne wrote:
> > > > > Le jeudi 16 mai 2019 =C3=A0 20:45 +0200, Paul Kocialkowski a =C3=
=A9crit :
> > > > > > Hi,
> > > > > >
> > > > > > Le jeudi 16 mai 2019 =C3=A0 14:24 -0400, Nicolas Dufresne a =C3=
=A9crit :
> > > > > > > Le mercredi 15 mai 2019 =C3=A0 22:59 +0200, Paul Kocialkowski=
 a =C3=A9crit :
> > > > > > > > Hi,
> > > > > > > >
> > > > > > > > Le mercredi 15 mai 2019 =C3=A0 14:54 -0400, Nicolas Dufresn=
e a =C3=A9crit :
> > > > > > > > > Le mercredi 15 mai 2019 =C3=A0 19:42 +0200, Paul Kocialko=
wski a =C3=A9crit :
> > > > > > > > > > Hi,
> > > > > > > > > >
> > > > > > > > > > Le mercredi 15 mai 2019 =C3=A0 10:42 -0400, Nicolas Duf=
resne a =C3=A9crit
> > > :
> > > > > > > > > > > Le mercredi 15 mai 2019 =C3=A0 12:09 +0200, Paul Koci=
alkowski a
> > > =C3=A9crit :
> > > > > > > > > > > > Hi,
> > > > > > > > > > > >
> > > > > > > > > > > > With the Rockchip stateless VPU driver in the works=
, we now
> > > > > > > > > > > > have a
> > > > > > > > > > > > better idea of what the situation is like on platfo=
rms other
> > > > > > > > > > > > than
> > > > > > > > > > > > Allwinner. This email shares my conclusions about t=
he
> > > > > > > > > > > > situation and how
> > > > > > > > > > > > we should update the MPEG-2, H.264 and H.265 contro=
ls
> > > > > > > > > > > > accordingly.
> > > > > > > > > > > >
> > > > > > > > > > > > - Per-slice decoding
> > > > > > > > > > > >
> > > > > > > > > > > > We've discussed this one already[0] and Hans has su=
bmitted a
> > > > > > > > > > > > patch[1]
> > > > > > > > > > > > to implement the required core bits. When we agree =
it looks
> > > > > > > > > > > > good, we
> > > > > > > > > > > > should lift the restriction that all slices must be
> > > > > > > > > > > > concatenated and
> > > > > > > > > > > > have them submitted as individual requests.
> > > > > > > > > > > >
> > > > > > > > > > > > One question is what to do about other controls. I =
feel like
> > > > > > > > > > > > it would
> > > > > > > > > > > > make sense to always pass all the required controls=
 for
> > > > > > > > > > > > decoding the
> > > > > > > > > > > > slice, including the ones that don't change across =
slices.
> > > > > > > > > > > > But there
> > > > > > > > > > > > may be no particular advantage to this and only dow=
nsides.
> > > > > > > > > > > > Not doing it
> > > > > > > > > > > > and relying on the "control cache" can work, but we=
 need to
> > > > > > > > > > > > specify
> > > > > > > > > > > > that only a single stream can be decoded per opened=
 instance
> > > > > > > > > > > > of the
> > > > > > > > > > > > v4l2 device. This is the assumption we're going wit=
h for
> > > > > > > > > > > > handling
> > > > > > > > > > > > multi-slice anyway, so it shouldn't be an issue.
> > > > > > > > > > >
> > > > > > > > > > > My opinion on this is that the m2m instance is a stat=
e, and
> > > > > > > > > > > the driver
> > > > > > > > > > > should be responsible of doing time-division multiple=
xing
> > > > > > > > > > > across
> > > > > > > > > > > multiple m2m instance jobs. Doing the time-division
> > > > > > > > > > > multiplexing in
> > > > > > > > > > > userspace would require some sort of daemon to work p=
roperly
> > > > > > > > > > > across
> > > > > > > > > > > processes. I also think the kernel is better place fo=
r doing
> > > > > > > > > > > resource
> > > > > > > > > > > access scheduling in general.
> > > > > > > > > >
> > > > > > > > > > I agree with that yes. We always have a single m2m cont=
ext and
> > > > > > > > > > specific
> > > > > > > > > > controls per opened device so keeping cached values wor=
ks out
> > > > > > > > > > well.
> > > > > > > > > >
> > > > > > > > > > So maybe we shall explicitly require that the request w=
ith the
> > > > > > > > > > first
> > > > > > > > > > slice for a frame also contains the per-frame controls.
> > > > > > > > > >
> > > > > > > > > > > > - Annex-B formats
> > > > > > > > > > > >
> > > > > > > > > > > > I don't think we have really reached a conclusion o=
n the
> > > > > > > > > > > > pixel formats
> > > > > > > > > > > > we want to expose. The main issue is how to deal wi=
th codecs
> > > > > > > > > > > > that need
> > > > > > > > > > > > the full slice NALU with start code, where the slic=
e_header
> > > > > > > > > > > > is
> > > > > > > > > > > > duplicated in raw bitstream, when others are fine w=
ith just
> > > > > > > > > > > > the encoded
> > > > > > > > > > > > slice data and the parsed slice header control.
> > > > > > > > > > > >
> > > > > > > > > > > > My initial thinking was that we'd need 3 formats:
> > > > > > > > > > > > - One that only takes only the slice compressed dat=
a
> > > > > > > > > > > > (without raw slice
> > > > > > > > > > > > header and start code);
> > > > > > > > > > > > - One that takes both the NALU data (including star=
t code,
> > > > > > > > > > > > raw header
> > > > > > > > > > > > and compressed data) and slice header controls;
> > > > > > > > > > > > - One that takes the NALU data but no slice header.
> > > > > > > > > > > >
> > > > > > > > > > > > But I no longer think the latter really makes sense=
 in the
> > > > > > > > > > > > context of
> > > > > > > > > > > > stateless video decoding.
> > > > > > > > > > > >
> > > > > > > > > > > > A side-note: I think we should definitely have data=
 offsets
> > > > > > > > > > > > in every
> > > > > > > > > > > > case, so that implementations can just push the who=
le NALU
> > > > > > > > > > > > regardless
> > > > > > > > > > > > of the format if they're lazy.
> > > > > > > > > > >
> > > > > > > > > > > I realize that I didn't share our latest research on =
the
> > > > > > > > > > > subject. So a
> > > > > > > > > > > slice in the original bitstream is formed of the foll=
owing
> > > > > > > > > > > blocks
> > > > > > > > > > >
> > > > > > > > > > > (simplified):
> > > > > > > > > > >   [nal_header][nal_type][slice_header][slice]
> > > > > > > > > >
> > > > > > > > > > Thanks for the details!
> > > > > > > > > >
> > > > > > > > > > > nal_header:
> > > > > > > > > > > This one is a header used to locate the start and the=
 end of
> > > > > > > > > > > the of a
> > > > > > > > > > > NAL. There is two standard forms, the ANNEX B / start=
 code, a
> > > > > > > > > > > sequence
> > > > > > > > > > > of 3 bytes 0x00 0x00 0x01, you'll often see 4 bytes, =
the first
> > > > > > > > > > > byte
> > > > > > > > > > > would be a leading 0 from the previous NAL padding, b=
ut this
> > > > > > > > > > > is also
> > > > > > > > > > > totally valid start code. The second form is the AVC =
form,
> > > > > > > > > > > notably used
> > > > > > > > > > > in ISOMP4 container. It simply is the size of the NAL=
. You
> > > > > > > > > > > must keep
> > > > > > > > > > > your buffer aligned to NALs in this case as you canno=
t scan
> > > > > > > > > > > from random
> > > > > > > > > > > location.
> > > > > > > > > > >
> > > > > > > > > > > nal_type:
> > > > > > > > > > > It's a bit more then just the type, but it contains a=
t least
> > > > > > > > > > > the
> > > > > > > > > > > information of the nal type. This has different size =
on H.264
> > > > > > > > > > > and HEVC
> > > > > > > > > > > but I know it's size is in bytes.
> > > > > > > > > > >
> > > > > > > > > > > slice_header:
> > > > > > > > > > > This contains per slice parameters, like the modifica=
tion
> > > > > > > > > > > lists to
> > > > > > > > > > > apply on the references. This one has a size in bits,=
 not in
> > > > > > > > > > > bytes.
> > > > > > > > > > >
> > > > > > > > > > > slice:
> > > > > > > > > > > I don't really know what is in it exactly, but this i=
s the
> > > > > > > > > > > data used to
> > > > > > > > > > > decode. This bit has a special coding called the
> > > > > > > > > > > anti-emulation, which
> > > > > > > > > > > prevents a start-code from appearing in it. This codi=
ng is
> > > > > > > > > > > present in
> > > > > > > > > > > both forms, ANNEX-B or AVC (in GStreamer and some ref=
erence
> > > > > > > > > > > manual they
> > > > > > > > > > > call ANNEX-B the bytestream format).
> > > > > > > > > > >
> > > > > > > > > > > So, what we notice is that what is currently passed t=
hrough
> > > > > > > > > > > Cedrus
> > > > > > > > > > >
> > > > > > > > > > > driver:
> > > > > > > > > > >   [nal_type][slice_header][slice]
> > > > > > > > > > >
> > > > > > > > > > > This matches what is being passed through VA-API. We =
can
> > > > > > > > > > > understand
> > > > > > > > > > > that stripping off the slice_header would be hard, si=
nce it's
> > > > > > > > > > > size is
> > > > > > > > > > > in bits. Instead we pass size and header_bit_size in
> > > > > > > > > > > slice_params.
> > > > > > > > > >
> > > > > > > > > > True, there is that.
> > > > > > > > > >
> > > > > > > > > > > About Rockchip. RK3288 is a Hantro G1 and has a bit c=
alled
> > > > > > > > > > > start_code_e, when you turn this off, you don't need =
start
> > > > > > > > > > > code. As a
> > > > > > > > > > > side effect, the bitstream becomes identical. We do n=
ow know
> > > > > > > > > > > that it
> > > > > > > > > > > works with the ffmpeg branch implement for cedrus.
> > > > > > > > > >
> > > > > > > > > > Oh great, that makes life easier in the short term, but=
 I guess
> > > > > > > > > > the
> > > > > > > > > > issue could arise on another decoder sooner or later.
> > > > > > > > > >
> > > > > > > > > > > Now what's special about Hantro G1 (also found on IMX=
8M) is
> > > > > > > > > > > that it
> > > > > > > > > > > take care for us of reading and executing the modific=
ation
> > > > > > > > > > > lists found
> > > > > > > > > > > in the slice header. Mostly because I very disliked h=
aving to
> > > > > > > > > > > pass the
> > > > > > > > > > > p/b0/b1 parameters, is that Boris implemented in the =
driver
> > > > > > > > > > > the
> > > > > > > > > > > transformation from the DPB entries into this p/b0/b1=
 list.
> > > > > > > > > > > These list
> > > > > > > > > > > a standard, it's basically implementing 8.2.4.1 and 8=
.2.4.2.
> > > > > > > > > > > the
> > > > > > > > > > > following section is the execution of the modificatio=
n list.
> > > > > > > > > > > As this
> > > > > > > > > > > list is not modified, it only need to be calculated p=
er frame.
> > > > > > > > > > > As a
> > > > > > > > > > > result, we don't need these new lists, and we can wor=
k with
> > > > > > > > > > > the same
> > > > > > > > > > > H264_SLICE format as Cedrus is using.
> > > > > > > > > >
> > > > > > > > > > Yes but I definitely think it makes more sense to pass =
the list
> > > > > > > > > > modifications rather than reconstructing those in the d=
river
> > > > > > > > > > from a
> > > > > > > > > > full list. IMO controls should stick to the bitstream a=
s close
> > > > > > > > > > as
> > > > > > > > > > possible.
> > > > > > > > >
> > > > > > > > > For Hantro and RKVDEC, the list of modification is parsed=
 by the
> > > > > > > > > IP
> > > > > > > > > from the slice header bits. Just to make sure, because I =
myself
> > > > > > > > > was
> > > > > > > > > confused on this before, the slice header does not contai=
n a list
> > > > > > > > > of
> > > > > > > > > references, instead it contains a list modification to be=
 applied
> > > > > > > > > to
> > > > > > > > > the reference list. I need to check again, but to execute=
 these
> > > > > > > > > modification, you need to filter and sort the references =
in a
> > > > > > > > > specific
> > > > > > > > > order. This should be what is defined in the spec as 8.2.=
4.1 and
> > > > > > > > > 8.2.4.2. Then 8.2.4.3 is the process that creates the l0/=
l1.
> > > > > > > > >
> > > > > > > > > The list of references is deduced from the DPB. The DPB, =
which I
> > > > > > > > > thinks
> > > > > > > > > should be rename as "references", seems more useful then =
p/b0/b1,
> > > > > > > > > since
> > > > > > > > > this is the data that gives use the ability to implementi=
ng glue
> > > > > > > > > in the
> > > > > > > > > driver to compensate some HW differences.
> > > > > > > > >
> > > > > > > > > In the case of Hantro / RKVDEC, we think it's natural to =
build the
> > > > > > > > > HW
> > > > > > > > > specific lists (p/b0/b1) from the references rather then =
adding HW
> > > > > > > > > specific list in the decode_params structure. The fact th=
ese lists
> > > > > > > > > are
> > > > > > > > > standard intermediate step of the standard is not that im=
portant.
> > > > > > > >
> > > > > > > > Sorry I got confused (once more) about it. Boris just expla=
ined the
> > > > > > > > same thing to me over IRC :) Anyway my point is that we wan=
t to pass
> > > > > > > > what's in ffmpeg's short and long term ref lists, and name =
them that
> > > > > > > > instead of dpb.
> > > > > > > >
> > > > > > > > > > > Now, this is just a start. For RK3399, we have a diff=
erent
> > > > > > > > > > > CODEC
> > > > > > > > > > > design. This one does not have the start_code_e bit. =
What the
> > > > > > > > > > > IP does,
> > > > > > > > > > > is that you give it one or more slice per buffer, set=
up the
> > > > > > > > > > > params,
> > > > > > > > > > > start decoding, but the decoder then return the locat=
ion of
> > > > > > > > > > > the
> > > > > > > > > > > following NAL. So basically you could offload the sca=
nning of
> > > > > > > > > > > start
> > > > > > > > > > > code to the HW. That being said, with the driver laye=
r in
> > > > > > > > > > > between, that
> > > > > > > > > > > would be amazingly inconvenient to use, and with Boye=
r-more
> > > > > > > > > > > algorithm,
> > > > > > > > > > > it is pretty cheap to scan this type of start-code on=
 CPU. But
> > > > > > > > > > > the
> > > > > > > > > > > feature that this allows is to operate in frame mode.=
 In this
> > > > > > > > > > > mode, you
> > > > > > > > > > > have 1 interrupt per frame.
> > > > > > > > > >
> > > > > > > > > > I'm not sure there is any interest in exposing that fro=
m
> > > > > > > > > > userspace and
> > > > > > > > > > my current feeling is that we should just ditch support=
 for
> > > > > > > > > > per-frame
> > > > > > > > > > decoding altogether. I think it mixes decoding with not=
ions that
> > > > > > > > > > are
> > > > > > > > > > higher-level than decoding, but I agree it's a blurry l=
ine.
> > > > > > > > >
> > > > > > > > > I'm not worried about this either. We can already support=
 that by
> > > > > > > > > copying the bitstream internally to the driver, though ze=
ro-copy
> > > > > > > > > with
> > > > > > > > > this would require a new format, the one we talked about,
> > > > > > > > > SLICE_ANNEX_B.
> > > > > > > >
> > > > > > > > Right, but what I'm thinking about is making that the one a=
nd only
> > > > > > > > format. The rationale is that it's always easier to just ap=
pend a
> > > > > > > > start
> > > > > > > > code from userspace if needed. And we need a bit offset to =
the slice
> > > > > > > > data part anyway, so it doesn't hurt to require a few extra=
 bits to
> > > > > > > > have the whole thing that will work in every situation.
> > > > > > >
> > > > > > > What I'd like is to eventually allow zero-copy (aka userptr) =
into the
> > > > > > > driver. If you make the start code mandatory, any decoding fr=
om ISOMP4
> > > > > > > (.mp4, .mov) will require a full bitstream copy in userspace =
to add
> > > > > > > the
> > > > > > > start code (unless you hack your allocation in your demuxer, =
but it's
> > > > > > > a
> > > > > > > bit complicated since this code might come from two libraries=
). In
> > > > > > > ISOMP4, you have an AVC header, which is just the size of the=
 NAL that
> > > > > > > follows.
> > > > > >
> > > > > > Well, I think we have to do a copy from system memory to the bu=
ffer
> > > > > > allocated by v4l2 anyway. Our hardware pipelines can reasonably=
 be
> > > > > > expected not to have any MMU unit and not allow sg import anywa=
y.
> > > > >
> > > > > The Rockchip has an mmu. You need one copy at least indeed,
> > > >
> > > > Is the MMU in use currently? That can make things troublesome if we=
 run
> > > > into a case where the VPU has MMU and deals with scatter-gather whi=
le
> > > > the display part doesn't. As far as I know, there's no way for
> > > > userspace to know whether a dma-buf-exported buffer is backed by CM=
A or
> > > > by scatter-gather memory. This feels like a major issue for using d=
ma-
> > > > buf, since userspace can't predict whether a buffer exported on one
> > > > device can be imported on another when building its pipeline.
> > >
> > > FYI, Allwinner H6 also has IOMMU, it's just that there is no mainline=
 driver
> > > for it yet. It is supported for display, both VPUs and some other dev=
ices. I
> > > think no sane SoC designer would left out one or another unit without=
 IOMMU
> > > support, that just calls for troubles, as you pointed out.
> >
> > Right right, I've been following that from a distance :)
> >
> > Indeed I think it's realistic to expect that for now, but it may not
> > play out so well in the long term. For instance, maybe connecting a USB
> > display would require CMA when the rest of the system can do with sg.
> >
> > I think it would really be useful for userspace to have a way to test
> > whether a buffer can be imported from one device to another. It feels
> > better than indicating where the memory lives, since there are
> > countless cases where additional restrictions apply too.
>
> I don't know for the integration on the Rockchip, but I did notice the
> register documentation for it.

All the important components in the SoC have their IOMMUs as well -
display controller, GPU.

There is a blitter called RGA that is not behind an IOMMU, but has
some scatter-gather capability (with a need for the hardware sg table
to be physically contiguous). That said, significance of such blitters
nowadays is rather low, as most of the time you need a compositor on
the GPU anyway, which can do any transformation in the same pass as
the composition.

> In general, the most significant gain
> with having iommu for CODECs is that it makes start up (and re-init)
> time much shorter, but also in a much more predictable duration. I do
> believe that the Venus driver (qualcomm) is one with solid support for
> this, and it's quite noticably more snappy then the others.

Obviously you also get support for USERPTR if you have an IOMMU, but
that also has some costs - you need to pin the user pages and map to
the IOMMU before each frame and unmap and unpin after each frame,
which sometimes is more costly than actually having the userspace copy
to a preallocated and premapped buffer, especially for relatively
small contents, such as compressed bitstream.

Best regards,
Tomasz

>
> We also faced an interesting issue recently on IMX.6 (there is just no
> mmu there). We where playing a stream from the camera, and the
> framerate would drastically drop as soon as you plug a USB camera (and
> it would drop for quite a while). We found out that Etnaviv is doing
> cma allocation per frame, hopefully this won't happen under V4L2
> queues. But on this platform, starting a new stream while pluggin a USB
> key could take several seconds to start.
>
> About the RK3399, work will continue in the next couple of weeks, and
> when this is done, we should have a much wider view of this subject.
> Hopefully what we learned about H.264 will be useful for HEVC and
> eventually AV1, which in term of bitstream uses similar stream formats
> method. AV1 is by far the most complicated CODEC I have read about.
>
> >
> > Cheers,
> >
> > Paul
> >
> > > Best regards,
> > > Jernej
> > >
> > > > > e.g. file
> > > > > to mem, or udpsocket to mem. But right now, let's say with ffmpeg=
/mpeg-
> > > > > ts, first you need to copy the MPEG TS to mem, then to demux you =
copy
> > > > > that H264 stream to another buffer, you then copy in the parser,
> > > > > removing the start-code and finally copy in the accelerator, addi=
ng the
> > > > > start code. If the driver would allow userptr, it would be unusab=
le.
> > > > >
> > > > > GStreamer on the other side implement lazy conversion, so it woul=
d copy
> > > > > the mpegts to mem, copy to demux, aggregate (with lazy merging) i=
n the
> > > > > parser (but stream format is negotiation, so it keeps the start-c=
ode).
> > > > > If you request alignment=3Dau, you have full frame of buffers, so=
 if your
> > > > > driver could do userptr, you can same that extra copy.
> > > > >
> > > > > Now, if we demux an MP4 it's the same, the parser will need do a =
full
> > > > > copy instead of lazy aggregation in order to prepend the start co=
de
> > > > > (since it had an AVC header). But userptr could save a copy.
> > > > >
> > > > > If the driver requires no nal prefix, then we could just pass a
> > > > > slightly forward point to userptr and avoid ACV to ANNEX-B conver=
sion,
> > > > > which is a bit slower (even know it's nothing compare to the full
> > > > > copies we already do.
> > > > >
> > > > > That was my argument in favour for no NAL prefix in term of effic=
iency,
> > > > > and it does not prevent adding a control to enable start-code for=
 cases
> > > > > it make sense.
> > > >
> > > > I see, so the internal arcitecture of userspace software may not be=
 a
> > > > good fit for adding these bits and it could hurt performance a bit.
> > > > That feels like a significant downside.
> > > >
> > > > > > So with that in mind, asking userspace to add a startcode it al=
ready
> > > > > > knows doesn't seem to be asking too much.
> > > > > >
> > > > > > > On the other end, the data_offset thing is likely just a thin=
g for the
> > > > > > > RK3399 to handle, it does not affect RK3288, Cedrus or IMX8M.
> > > > > >
> > > > > > Well, I think it's best to be fool-proof here and just require =
that
> > > > > > start code. We should also have per-slice bit offsets to the di=
fferent
> > > > > > parts anyway, so drivers that don't need it can just ignore it.
> > > > > >
> > > > > > In extreme cases where there is some interest in doing direct b=
uffer
> > > > > > import without doing a copy in userspace, userspace could trick=
 the
> > > > > > format and avoid a copy by not providing the start-code (assumi=
ng it
> > > > > > knows it doesn't need it) and specifying the bit offsets accord=
ingly.
> > > > > > That'd be a hack for better performance, and it feels better to=
 do
> > > > > > things in this order rather than having to hack around in the d=
rivers
> > > > > > that need the start code in every other case.
> > > > >
> > > > > So basically, you and Tomas are both strongly in favour of adding
> > > > > ANNEX-B start-code to the current uAPI. I have digged into Cedrus
> > > > > registers, and it seems that it does have start-code scanning sup=
port.
> > > > > I'm not sure it can do "full-frame" decoding, 1 interrupt per fra=
me
> > > > > like the RK do. That requires the IP to deal with the modificatio=
ns
> > > > > lists, which are per slices.
> > > >
> > > > Actually the bitstream parser won't reconfigure the pipeline
> > > > configuration registers, it's only around for userspace to avoid
> > > > implementing bitstream parsing, but it's a standalone thing.
> > > >
> > > > So if we want to do full-frame decoding we always need to reconfigu=
re
> > > > our pipeline (or do it like we do currently and just use one of the
> > > > per-slice configuration and hope for the best).
> > > >
> > > > Do we have more information on the RK3399 and what it requires exac=
tly?
> > > > (Just to make sure it's not another issue altogether.)
> > > >
> > > > > My question is, are you willing to adapt the Cedrus driver to sup=
port
> > > > > receiving start-code ? And will this have a performance impact or=
 not ?
> > > > > On RK side, it's really just about flipping 1 bit.
> > > > >
> > > > > On the Rockchip side, Tomas had concern about CPU wakeup and the =
fact
> > > > > that we didn't aim at supporting passing multiple slices at once =
to the
> > > > > IP (something RK supports). It's important to understand that mul=
ti-
> > > > > slice streams are relatively rare and mostly used for low-latency=
 /
> > > > > video conferencing. So aggregating in these case defeats the purp=
ose of
> > > > > using slices. So I think RK feature is not very important.
> > > >
> > > > Agreed, let's aim for low-latency as a standard.
> > > >
> > > > > Of course, I do believe that long term we will want to expose bot
> > > > > stream formats on RK (because the HW can do that), so then usersp=
ace
> > > > > can just pick the best when available. So that boils down to our =
first
> > > > > idea, shall we expose _SLICE_A and _SLICE_B or something like thi=
s ?
> > > > > Now that we have progressed on the matter, I'm quite in favour of
> > > > > having _SLICE in the first place, with the preferred format that
> > > > > everyone should support, and allow for variants later. Now, if we=
 make
> > > > > one mandatory, we could also just have a menu control to allow ot=
her
> > > > > formats.
> > > >
> > > > That seems fairly reasonable to me, and indeed, having one preferre=
d
> > > > format at first seems to be a good move.
> > > >
> > > > > > > > To me the breaking point was about having the slice header =
both in
> > > > > > > > raw
> > > > > > > > bitstream and parsed forms. Since we agree that's fine, we =
might as
> > > > > > > > well push it to its logical conclusion and include all the =
bits that
> > > > > > > > can be useful.
> > > > > > >
> > > > > > > To take your words, the bits that contain useful information =
starts
> > > > > > > from the NAL type byte, exactly were the data was cut by VA-A=
PI and
> > > > > > > the
> > > > > > > current uAPI.
> > > > > >
> > > > > > Agreed, but I think that the advantages of always requiring the=
 start
> > > > > > code outweigh the potential (yet quite unlikely) downsides.
> > > > > >
> > > > > > > > > > > But it also support slice mode, with an
> > > > > > > > > > > interrupt per slice, which is what we decided to use.
> > > > > > > > > >
> > > > > > > > > > Easier for everyone and probably better for latency as =
well :)
> > > > > > > > > >
> > > > > > > > > > > So in this case, indeed we strictly require on start-=
code.
> > > > > > > > > > > Though, to
> > > > > > > > > > > me this is not a great reason to make a new fourcc, s=
o we will
> > > > > > > > > > > try and
> > > > > > > > > > > use (data_offset =3D 3) in order to make some space f=
or that
> > > > > > > > > > > start code,
> > > > > > > > > > > and write it down in the driver. This is to be contin=
ued, we
> > > > > > > > > > > will
> > > > > > > > > > > report back on this later. This could have some side =
effect in
> > > > > > > > > > > the
> > > > > > > > > > > ability to import buffers. But most userspace don't t=
ry to do
> > > > > > > > > > > zero-copy
> > > > > > > > > > > on the encoded size and just copy anyway.
> > > > > > > > > > >
> > > > > > > > > > > To my opinion, having a single format is a big deal, =
since
> > > > > > > > > > > userspace
> > > > > > > > > > > will generally be developed for one specific HW and w=
e would
> > > > > > > > > > > endup with
> > > > > > > > > > > fragmented support. What we really want to achieve is=
 having a
> > > > > > > > > > > driver
> > > > > > > > > > > interface which works across multiple HW, and I think=
 this is
> > > > > > > > > > > quite
> > > > > > > > > > > possible.
> > > > > > > > > >
> > > > > > > > > > I agree with that. The more I think about it, the more =
I believe
> > > > > > > > > > we
> > > > > > > > > > should just pass the whole
> > > > > > > > > > [nal_header][nal_type][slice_header][slice]
> > > > > > > > > > and the parsed list in every scenario.
> > > > > > > > >
> > > > > > > > > What I like of the cut at nal_type, is that there is only=
 format.
> > > > > > > > > If we
> > > > > > > > > cut at nal_header, then we need to expose 2 formats. And =
it makes
> > > > > > > > > our
> > > > > > > > > API similar to other accelerator API, so it's easy to "co=
nvert"
> > > > > > > > > existing userspace.
> > > > > > > >
> > > > > > > > Unless we make that cut the single one and only true cut th=
at shall
> > > > > > > > supersed all other cuts :)
> > > > > > >
> > > > > > > That's basically what I've been trying to do, kill this _RAW/=
ANNEX_B
> > > > > > > thing and go back to our first idea.
> > > > > >
> > > > > > Right, in the end I think we should go with:
> > > > > > V4L2_PIX_FMT_MPEG2_SLICE
> > > > > > V4L2_PIX_FMT_H264_SLICE
> > > > > > V4L2_PIX_FMT_HEVC_SLICE
> > > > > >
> > > > > > And just require raw bitstream for the slice with emulation-pre=
vention
> > > > > > bits included.
> > > > >
> > > > > That's should be the set of format we start with indeed. The sing=
le
> > > > > format for which software gets written and tested, making sure so=
ftware
> > > > > support is not fragmented, and other variants should be something=
 to
> > > > > opt-in.
> > > >
> > > > Cheers for that!
> > > >
> > > > Paul
> > > >
> > > > > > Cheers,
> > > > > >
> > > > > > Paul
> > > > > >
> > > > > > > > > > For H.265, our decoder needs some information from the =
NAL type
> > > > > > > > > > too.
> > > > > > > > > > We currently extract that in userspace and stick it to =
the
> > > > > > > > > > slice_header, but maybe it would make more sense to hav=
e drivers
> > > > > > > > > > parse
> > > > > > > > > > that info from the buffer if they need it. On the other=
 hand, it
> > > > > > > > > > seems
> > > > > > > > > > quite common to pass information from the NAL type, so =
maybe we
> > > > > > > > > > should
> > > > > > > > > > either make a new control for it or have all the fields=
 in the
> > > > > > > > > > slice_header (which would still be wrong in terms of ma=
tching
> > > > > > > > > > bitstream
> > > > > > > > > > description).
> > > > > > > > >
> > > > > > > > > Even in userspace, it's common to just parse this in plac=
e, it's a
> > > > > > > > > simple mask. But yes, if we don't have it yet, we should =
expose
> > > > > > > > > the NAL
> > > > > > > > > type, it would be cleaner.
> > > > > > > >
> > > > > > > > Right, works for me.
> > > > > > >
> > > > > > > Ack.
> > > > > > >
> > > > > > > > Cheers,
> > > > > > > >
> > > > > > > > Paul
> > > > > > > >
> > > > > > > > > > > > - Dropping the DPB concept in H.264/H.265
> > > > > > > > > > > >
> > > > > > > > > > > > As far as I could understand, the decoded picture b=
uffer
> > > > > > > > > > > > (DPB) is a
> > > > > > > > > > > > concept that only makes sense relative to a decoder
> > > > > > > > > > > > implementation. The
> > > > > > > > > > > > spec mentions how to manage it with the Hypothetica=
l
> > > > > > > > > > > > reference decoder
> > > > > > > > > > > > (Annex C), but that's about it.
> > > > > > > > > > > >
> > > > > > > > > > > > What's really in the bitstream is the list of modif=
ied
> > > > > > > > > > > > short-term and
> > > > > > > > > > > > long-term references, which is enough for every dec=
oder.
> > > > > > > > > > > >
> > > > > > > > > > > > For this reason, I strongly believe we should stop =
talking
> > > > > > > > > > > > about DPB in
> > > > > > > > > > > > the controls and just pass these lists agremented w=
ith
> > > > > > > > > > > > relevant
> > > > > > > > > > > > information for userspace.
> > > > > > > > > > > >
> > > > > > > > > > > > I think it should be up to the driver to maintain a=
 DPB and
> > > > > > > > > > > > we could
> > > > > > > > > > > > have helpers for common cases. For instance, the ro=
ckchip
> > > > > > > > > > > > decoder needs
> > > > > > > > > > > > to keep unused entries around[2] and cedrus has the=
 same
> > > > > > > > > > > > requirement
> > > > > > > > > > > > for H.264. However for cedrus/H.265, we don't need =
to do any
> > > > > > > > > > > > book-
> > > > > > > > > > > > keeping in particular and can manage with the lists=
 from the
> > > > > > > > > > > > bitstream
> > > > > > > > > > > > directly.
> > > > > > > > > > >
> > > > > > > > > > > As discusses today, we still need to pass that list. =
It's
> > > > > > > > > > > being index
> > > > > > > > > > > by the HW to retrieve the extra information we have c=
ollected
> > > > > > > > > > > about the
> > > > > > > > > > > status of the reference frames. In the case of Hantro=
, which
> > > > > > > > > > > process
> > > > > > > > > > > the modification list from the slice header for us, w=
e also
> > > > > > > > > > > need that
> > > > > > > > > > > list to construct the unmodified list.
> > > > > > > > > > >
> > > > > > > > > > > So the problem here is just a naming problem. That li=
st is not
> > > > > > > > > > > really a
> > > > > > > > > > > DPB. It is just the list of long-term/short-term refe=
rences
> > > > > > > > > > > with the
> > > > > > > > > > > status of these references. So maybe we could just re=
name as
> > > > > > > > > > > references/reference_entry ?
> > > > > > > > > >
> > > > > > > > > > What I'd like to pass is the diff to the references lis=
t, as
> > > > > > > > > > ffmpeg
> > > > > > > > > > currently provides for v4l2 request and vaapi (probably=
 vdpau
> > > > > > > > > > too). No
> > > > > > > > > > functional change here, only that we should stop callin=
g it a
> > > > > > > > > > DPB,
> > > > > > > > > > which confuses everyone.
> > > > > > > > >
> > > > > > > > > Yes.
> > > > > > > > >
> > > > > > > > > > > > - Using flags
> > > > > > > > > > > >
> > > > > > > > > > > > The current MPEG-2 controls have lots of u8 values =
that can
> > > > > > > > > > > > be
> > > > > > > > > > > > represented as flags. Using flags also helps with p=
adding.
> > > > > > > > > > > > It's unlikely that we'll get more than 64 flags, so=
 using a
> > > > > > > > > > > > u64 by
> > > > > > > > > > > > default for that sounds fine (we definitely do want=
 to keep
> > > > > > > > > > > > some room
> > > > > > > > > > > > available and I don't think using 32 bits as a defa=
ult is
> > > > > > > > > > > > good enough).
> > > > > > > > > > > >
> > > > > > > > > > > > I think H.264/HEVC per-control flags should also be=
 moved to
> > > > > > > > > > > > u64.
> > > > > > > > > > >
> > > > > > > > > > > Make sense, I guess bits (member : 1) are not allowed=
 in uAPI
> > > > > > > > > > > right ?
> > > > > > > > > >
> > > > > > > > > > Mhh, even if they are, it makes it much harder to verif=
y 32/64
> > > > > > > > > > bit
> > > > > > > > > > alignment constraints (we're dealing with 64-bit platfo=
rms that
> > > > > > > > > > need to
> > > > > > > > > > have 32-bit userspace and compat_ioctl).
> > > > > > > > >
> > > > > > > > > I see, thanks.
> > > > > > > > >
> > > > > > > > > > > > - Clear split of controls and terminology
> > > > > > > > > > > >
> > > > > > > > > > > > Some codecs have explicit NAL units that are good f=
its to
> > > > > > > > > > > > match as
> > > > > > > > > > > > controls: e.g. slice header, pps, sps. I think we s=
hould
> > > > > > > > > > > > stick to the
> > > > > > > > > > > > bitstream element names for those.
> > > > > > > > > > > >
> > > > > > > > > > > > For H.264, that would suggest the following changes=
:
> > > > > > > > > > > > - renaming v4l2_ctrl_h264_decode_param to
> > > > > > > > > > > > v4l2_ctrl_h264_slice_header;
> > > > > > > > > > >
> > > > > > > > > > > Oops, I think you meant slice_prams ? decode_params m=
atches
> > > > > > > > > > > the
> > > > > > > > > > > information found in SPS/PPS (combined?), while slice=
_params
> > > > > > > > > > > matches
> > > > > > > > > > > the information extracted (and executed in case of l0=
/l1) from
> > > > > > > > > > > the
> > > > > > > > > > > slice headers.
> > > > > > > > > >
> > > > > > > > > > Yes you're right, I mixed them up.
> > > > > > > > > >
> > > > > > > > > > >  That being said, to me this name wasn't confusing, s=
ince
> > > > > > > > > > >
> > > > > > > > > > > it's not just the slice header, and it's per slice.
> > > > > > > > > >
> > > > > > > > > > Mhh, what exactly remains in there and where does it or=
iginate
> > > > > > > > > > in the
> > > > > > > > > > bitstream? Maybe it wouldn't be too bad to have one con=
trol per
> > > > > > > > > > actual
> > > > > > > > > > group of bitstream elements.
> > > > > > > > > >
> > > > > > > > > > > > - killing v4l2_ctrl_h264_decode_param and having th=
e
> > > > > > > > > > > > reference lists
> > > > > > > > > > > > where they belong, which seems to be slice_header;
> > > > > > > > > > >
> > > > > > > > > > > There reference list is only updated by userspace (th=
rough
> > > > > > > > > > > it's DPB)
> > > > > > > > > > > base on the result of the last decoding step. I was v=
ery
> > > > > > > > > > > confused for a
> > > > > > > > > > > moment until I realize that the lists in the slice_he=
ader are
> > > > > > > > > > > just a
> > > > > > > > > > > list of modification to apply to the reference list i=
n order
> > > > > > > > > > > to produce
> > > > > > > > > > > l0 and l1.
> > > > > > > > > >
> > > > > > > > > > Indeed, and I'm suggesting that we pass the modificatio=
ns only,
> > > > > > > > > > which
> > > > > > > > > > would fit a slice_header control.
> > > > > > > > >
> > > > > > > > > I think I made my point why we want the dpb -> references=
. I'm
> > > > > > > > > going to
> > > > > > > > > validate with the VA driver now, to see if the references=
 list
> > > > > > > > > there is
> > > > > > > > > usable with our code.
> > > > > > > > >
> > > > > > > > > > Cheers,
> > > > > > > > > >
> > > > > > > > > > Paul
> > > > > > > > > >
> > > > > > > > > > > > I'm up for preparing and submitting these control c=
hanges
> > > > > > > > > > > > and updating
> > > > > > > > > > > > cedrus if they seem agreeable.
> > > > > > > > > > > >
> > > > > > > > > > > > What do you think?
> > > > > > > > > > > >
> > > > > > > > > > > > Cheers,
> > > > > > > > > > > >
> > > > > > > > > > > > Paul
> > > > > > > > > > > >
> > > > > > > > > > > > [0]: https://lkml.org/lkml/2019/3/6/82
> > > > > > > > > > > > [1]: https://patchwork.linuxtv.org/patch/55947/
> > > > > > > > > > > > [2]:
> > > > > > > > > > > > https://chromium.googlesource.com/chromiumos/third_=
party/ke
> > > > > > > > > > > > rnel/+/4d7cb46539a93bb6acc802f5a46acddb5aaab378
> > >
> > >
>
