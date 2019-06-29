Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2CC1D5AA04
	for <lists+linux-media@lfdr.de>; Sat, 29 Jun 2019 12:03:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726892AbfF2KDQ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 29 Jun 2019 06:03:16 -0400
Received: from mx08-00252a01.pphosted.com ([91.207.212.211]:60242 "EHLO
        mx08-00252a01.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726818AbfF2KDP (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 29 Jun 2019 06:03:15 -0400
Received: from pps.filterd (m0102629.ppops.net [127.0.0.1])
        by mx08-00252a01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id x5TA3CiF014302
        for <linux-media@vger.kernel.org>; Sat, 29 Jun 2019 11:03:12 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=raspberrypi.org; h=mime-version :
 references : in-reply-to : from : date : message-id : subject : to : cc :
 content-type : content-transfer-encoding; s=pp;
 bh=OW8Q1TGxcOK7hZLBSVJZXggCYgvQRlx4LLdaDGZOiEk=;
 b=Y7hePchZyLAoFeQyHpoThE+Tc+T3/dMG5+2IfSMblldGCOU90NWgWyKKh54Ic2KPgzqF
 538+q/SJ7LjI5ZJSgM6NiGkPMQfDSSbZXV6drPcFUKREvdKgm5Ng7wnhzP2CN2xffNRv
 HJqyMxp3T4kg5z6lHlQR9h+iWE+REAd1uxAWzows+LD/pbgIB595O95/WQJUTxbbqOP/
 3VE+MwEcaJqWXVMX53EUsUbjsG7N5cErgxsbOYex5O3S5jaj2FRfS8MeVfsLAccGEDVj
 o92inT6nJQikekKc5EW1LI3ZiLJ5ToPWKz3qyf4n/UbK4UJYjCMmLLE1X0c8VxHx/Sas nQ== 
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
        by mx08-00252a01.pphosted.com with ESMTP id 2tdvfh85bp-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=OK)
        for <linux-media@vger.kernel.org>; Sat, 29 Jun 2019 11:03:12 +0100
Received: by mail-pg1-f198.google.com with SMTP id s4so4469473pgr.3
        for <linux-media@vger.kernel.org>; Sat, 29 Jun 2019 03:03:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=OW8Q1TGxcOK7hZLBSVJZXggCYgvQRlx4LLdaDGZOiEk=;
        b=R/5h1Qgwjln5nMxshfuskTfZVOfWWFr57mmNVQYuhm36ozySua/Ikpsr62mjOJ+j/K
         afHDZWIlvI/O0+H2DosWCFxkN+A+OUg7Bp1GIKc2wnrU5Zdv5lBknPa/xZVG2C1/vgjL
         b3F9f9tg/sb0/HqwiamQffWGBB5UvFbOmI6wOQOAGE+ttqyzTa9fTqPv1AH30UUTJt/V
         4xaCJ7Cv7aQWeWwgrb1CQP5mJPUoN7oepfwU9xasLn8Q0dHxs5/mmljEfOXqweNy/9bI
         nkud5PrPk57LteMrIAG4SDs+EiomOIJJYN8gCGvHZNHYpcaLvrLRsUXPULZVWYPDjZ57
         6dmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=OW8Q1TGxcOK7hZLBSVJZXggCYgvQRlx4LLdaDGZOiEk=;
        b=ZPqhr0uIqt8HqfYtveW+G4gg+L56Biu+zDaaegv/hGo7rhVsD8wT97MLUm8vBQMJFT
         +lVucb30DJ/pu+7xdNUbQFay4gYbziMV6A4suu8oMO7cmRCGKdB3L4itdmRAtXKo38P5
         +L1xD0PJoXZzs8Q71JBUTe0lZMnnBJuoveqAfZev/N70Wg/2udBGZcB+L07gEKaeVAsY
         JZ/11S7TqN/9RibPoiwruZB+p3TEycEuq0t9rlmbs0cgEa72ubaPBut+41+pyHxKecQI
         M0EYd9r5qE6/c5sfZxi0WqTQrzNnUh59HW1HB30EFd6sCuDw7zbK9YKKPp12yemJcuwn
         te0g==
X-Gm-Message-State: APjAAAXtvOzfetNZcyCdyYxPLxzDfGE9B5cq6i7osAV5abhaDxlG4p7w
        pH6KcHQaVGhB6L4D3bIqETcg3Ee+1hThczaBOitMvCnvXTHWLh1QK1UbZd/3Tss92fs9iTCv6En
        +IB4T+omza+1Uw4776Py7k1TTu3OR5ItDxNDeZg==
X-Received: by 2002:a17:902:296a:: with SMTP id g97mr16532422plb.115.1561802590597;
        Sat, 29 Jun 2019 03:03:10 -0700 (PDT)
X-Google-Smtp-Source: APXvYqy7c6ikQcf0JvC3Wm0VLHXBUAclxoRvR7dH3j0zzB/kvqQHhf4WCOqffSouoM7bo+Zi6iCdSPiV889w0nxXyS0=
X-Received: by 2002:a17:902:296a:: with SMTP id g97mr16532406plb.115.1561802590354;
 Sat, 29 Jun 2019 03:03:10 -0700 (PDT)
MIME-Version: 1.0
References: <530f28e9-f686-6222-c6cc-9a5207b151f7@xs4all.nl>
 <CAAoAYcOa7ngH5pPJze+H25rDQgjeNnpKY=HWQqsGFTTrO5iFgg@mail.gmail.com> <9c3fe7a71aa4c2f9c3f92fa8d7a8fe0290f51da0.camel@ndufresne.ca>
In-Reply-To: <9c3fe7a71aa4c2f9c3f92fa8d7a8fe0290f51da0.camel@ndufresne.ca>
From:   Dave Stevenson <dave.stevenson@raspberrypi.org>
Date:   Sat, 29 Jun 2019 11:02:57 +0100
Message-ID: <CAAoAYcPhssrTG9X7mztLv=LG5R7z1UmLJkgZsw=DK7V1s32V+A@mail.gmail.com>
Subject: Re: [RFC] Stateful codecs and requirements for compressed formats
To:     Nicolas Dufresne <nicolas@ndufresne.ca>
Cc:     Hans Verkuil <hverkuil@xs4all.nl>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Boris Brezillon <boris.brezillon@collabora.com>,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Michael Tretter <m.tretter@pengutronix.de>,
        Tomasz Figa <tfiga@chromium.org>,
        Sylwester Nawrocki <snawrocki@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:5.22.84,1.0.8
 definitions=2019-06-29_08:2019-06-25,2019-06-29 signatures=0
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Nicolas

On Fri, 28 Jun 2019 at 16:48, Nicolas Dufresne <nicolas@ndufresne.ca> wrote=
:
>
> Le vendredi 28 juin 2019 =C3=A0 16:21 +0100, Dave Stevenson a =C3=A9crit =
:
> > Hi Hans
> >
> > On Fri, 28 Jun 2019 at 15:34, Hans Verkuil <hverkuil@xs4all.nl> wrote:
> > > Hi all,
> > >
> > > I hope I Cc-ed everyone with a stake in this issue.
> > >
> > > One recurring question is how a stateful encoder fills buffers and ho=
w a stateful
> > > decoder consumes buffers.
> > >
> > > The most generic case is that an encoder produces a bitstream and jus=
t fills each
> > > CAPTURE buffer to the brim before continuing with the next buffer.
> > >
> > > I don't think there are drivers that do this, I believe that all driv=
ers just
> > > output a single compressed frame. For interlaced formats I understand=
 it is either
> > > one compressed field per buffer, or two compressed fields per buffer =
(this is
> > > what I heard, I don't know if this is true).
> >
> > From the discussion that started this thread, with H264 and similar,
> > does the V4L2 buffer contain just the frame data, or the SPS/PPS
> > headers as well.
>
> In existing mainline encoder driver the SPS/PPS is included in the
> first frame produced. Decoders expect them to be in the first frame
> queued. For decoder, this is being relaxed now that we have a mechanism
> to notify the state change after the header has been processed.

So it sounds like the one bit missing is everyone's "friend" -
documentation. I'm eternally grateful to those who are making the
efforts in updating it. It's a thankless task, but absolutely
necessary.

For those outside the core linux-media circles there is a choice to be
made, and different APIs do adopt different approaches.
OpenMAX IL for one explicitly documents exactly the opposite approach
to V4L2, although admittedly through an optional flag. 1.1.2 spec [1],
section 3.1.2.7.1 (page 70)

The OMX_BUFFERFLAG_CODECCONFIG is an optional flag that is
set by an output port when all bytes in the buffer form part or all of a se=
t of
codec specific configuration data. Examples include SPS/PPS nal units
for OMX_VIDEO_CodingAVC or AudioSpecificConfig data for
OMX_AUDIO_CodingAAC. Any component that for a given stream sets
OMX_BUFFERFLAG_CODECCONFIG shall not mix codec
configuration bytes with frame data in the same buffer, and shall send all
buffers containing codec configuration bytes before any buffers containing
frame data that those configurations bytes describe.

  Dave

[1] https://www.khronos.org/registry/OpenMAX-IL/specs/OpenMAX_IL_1_1_2_Spec=
ification.pdf

> > > In any case, I don't think this is specified anywhere. Please correct=
 me if I am
> > > wrong.
> > >
> > > The latest stateful codec spec is here:
> > >
> > > https://hverkuil.home.xs4all.nl/codec-api/uapi/v4l/dev-mem2mem.html
> > >
> > > Assuming what I described above is indeed the case, then I think this=
 should
> > > be documented. I don't know enough if a flag is needed somewhere to d=
escribe
> > > the behavior for interlaced formats, or can we leave this open and ha=
ve userspace
> > > detect this?
> > >
> > >
> > > For decoders it is more complicated. The stateful decoder spec is wri=
tten with
> > > the assumption that userspace can just fill each OUTPUT buffer to the=
 brim with
> > > the compressed bitstream. I.e., no need to split at frame or other bo=
undaries.
> > >
> > > See section 4.5.1.7 in the spec.
> > >
> > > But I understand that various HW decoders *do* have limitations. I wo=
uld really
> > > like to know about those, since that needs to be exposed to userspace=
 somehow.
> > >
> > > Specifically, the venus decoder needs to know the resolution of the c=
oded video
> > > beforehand and it expects a single frame per buffer (how does that wo=
rk for
> > > interlaced formats?).
> > >
> > > Such requirements mean that some userspace parsing is still required,=
 so these
> > > decoders are not completely stateful.
> > >
> > > Can every codec author give information about their decoder/encoder?
> > >
> > > I'll start off with my virtual codec driver:
> > >
> > > vicodec: the decoder fully parses the bitstream. The encoder produces=
 a single
> > > compressed frame per buffer. This driver doesn't yet support interlac=
ed formats,
> > > but when that is added it will encode one field per buffer.
> >
> > On BCM283x:
> >
> > The underlying decoder will accept anything, but giving it a single
> > frame per buffer reduces latency as the bitstream parser gets kicked
> > earlier. Based on previous discussions I am setting the flag so that
> > it expects one compressed frame per buffer, but I don't believe it
> > goes wrong should that not be the case (it'll just waste a bit of
> > processing effort).
> > It'll parse the headers and produce a V4L2_EVENT_SOURCE_CHANGE event
> > should the capture queue format not match the stream parameters.
> > Interlacing isn't supported yet (it's on the list), but I believe the
> > hardware produces the equivalent to V4L2_FIELD_INTERLACED_[TB|BT].
> >
> > The encoder currently spits out the H264 SPS/PPS headers as a separate
> > V4L2 buffer, and then one compressed frame per V4L2 buffer (provided
> > the buffer is big enough). Should
> > V4L2_CID_MPEG_VIDEO_REPEAT_SEQ_HEADER be set, then it will repeat the
> > headers in an independent V4L2 buffer before each I frame.
> > I'm quite happy to amend this should we have a decent spec of what is
> > required. As I've never found a spec it's been trial and error until
> > now.
> > There is no interlaced support available.
> >
> >   Dave
