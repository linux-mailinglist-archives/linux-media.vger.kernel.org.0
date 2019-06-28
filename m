Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2D2F059EBC
	for <lists+linux-media@lfdr.de>; Fri, 28 Jun 2019 17:22:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726770AbfF1PWN (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 28 Jun 2019 11:22:13 -0400
Received: from mx08-00252a01.pphosted.com ([91.207.212.211]:48428 "EHLO
        mx08-00252a01.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726686AbfF1PWM (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 28 Jun 2019 11:22:12 -0400
Received: from pps.filterd (m0102629.ppops.net [127.0.0.1])
        by mx08-00252a01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id x5SFIkrB004525
        for <linux-media@vger.kernel.org>; Fri, 28 Jun 2019 16:22:11 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=raspberrypi.org; h=mime-version :
 references : in-reply-to : from : date : message-id : subject : to : cc :
 content-type; s=pp; bh=fT8mbgmCMCiyJ6LUzR2/91EA3p6ubfRgXTXmEmYOLIM=;
 b=arO24b52J7BU1IxQ3utxXn668sVqJAV72mxbJ2kJjNvOA/k17GBZcHkUGjZkWqEieI15
 Q2KVkN1N9/df5eFNCE6FgXI9rTYf+SVGJcUqTXVXrQ77RYPmTX+7rlAzJG12Tnws8hLG
 y+jCXNZeouwSh9Q4rCs/gx8K0dF5LP5V0rnksvQSNCkNqTUqf+kmJ1Yw8dJFYLdp0huR
 4AJGoTwk166VeIz9jrtqxf/MFmko/7Nfk4MOUgFtYT0EeMerwfgzsyEn5B7u7dGIeiFu
 UnWyizV6XEsf0LyESahxr1d4o3AQKXen17H7j7aJZLc9vcCrAgCNnNbaSRen0S98eary sQ== 
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
        by mx08-00252a01.pphosted.com with ESMTP id 2t9exhk69n-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=OK)
        for <linux-media@vger.kernel.org>; Fri, 28 Jun 2019 16:22:11 +0100
Received: by mail-pf1-f198.google.com with SMTP id q14so4105230pff.8
        for <linux-media@vger.kernel.org>; Fri, 28 Jun 2019 08:22:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=fT8mbgmCMCiyJ6LUzR2/91EA3p6ubfRgXTXmEmYOLIM=;
        b=WLz4xwVQHkzpIMv36qCKYqDvyaWb7uD/hUrlB0QDo0J9kQNBCHE77Etb5tktWMt5NL
         BP5xIPddPDx8gEHFdkQAxyr4/cdA4He/HR4d7Jm9Mp3A5tlZGYFawm83SlZf4a3Z9Ivj
         Z46jDwcmSg1E3ARXmy2oDNNnH5ODscnnchYbOnSFvgE5b7Uua8p3w1VBp+KnlqelwUzU
         XjGvdnsl/1ZCK8B/sXxYciCq4iSE4L+fQThooDc+glqgslD6ScVpjPjAeMTQlvpTWi+p
         86lSLOxtfDEcWuGYBYVzE8BRiTTcjgr77OvxRbHbXhmFp+Ur81esRE//GCGuusuOwctC
         yW3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=fT8mbgmCMCiyJ6LUzR2/91EA3p6ubfRgXTXmEmYOLIM=;
        b=EqwRBWfPlDss93hZLL5YdXuBXKXWXz5zY2G1SqtiHcDm5q1+ng47+uGN8CEyJfVHsS
         xYHYYWMerNPuqR66RBXxj5D8FBHjuc9TunO1PVDnga7qdSpFeQv03DhH4uNzFROk2YXK
         6Zz+6YieWxwCsRlt5Ic3AWP/p5E1DHOhKKvJcwZUCq6jy1Y6i+yO9H1IsJLNHDOZzCmk
         fuJVi+zsv8EMdo1o/UMNj/ca0vtSeHQDFkL1fSpbeSv1uOw/bpodVc6HwiPSu1OBF6CJ
         aV0WZCbG2M1ouJHegwwoG2NbQJSILbk/MsI0DFQfNOU7+pwFSM25kqlx/7iLOOimShLw
         Up4Q==
X-Gm-Message-State: APjAAAXc0qzfNk+urelTVgIwObvZQJS8qQgS/i18Mrw86i49w51QPZ6D
        RmLxDfGsaFa38s69PSfSilp6r02TmO7JzTUDlaL+QYDz9DKzu/k9QRWDhfB9saSKkjfMBWGGnVZ
        D024i6vXI4NqMiSko8iOdHS56fbbXXVUqFdfW7A==
X-Received: by 2002:a17:90a:f98a:: with SMTP id cq10mr13887040pjb.43.1561735328790;
        Fri, 28 Jun 2019 08:22:08 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxL5qKrqJJsg0nc2VZCn2fuPUAueo/er1Mbep9/JqYOuq+y/o0LoShhH12cFbAbIxGdvcrsSVUu28DFGvNWL5I=
X-Received: by 2002:a17:90a:f98a:: with SMTP id cq10mr13887007pjb.43.1561735328455;
 Fri, 28 Jun 2019 08:22:08 -0700 (PDT)
MIME-Version: 1.0
References: <530f28e9-f686-6222-c6cc-9a5207b151f7@xs4all.nl>
In-Reply-To: <530f28e9-f686-6222-c6cc-9a5207b151f7@xs4all.nl>
From:   Dave Stevenson <dave.stevenson@raspberrypi.org>
Date:   Fri, 28 Jun 2019 16:21:54 +0100
Message-ID: <CAAoAYcOa7ngH5pPJze+H25rDQgjeNnpKY=HWQqsGFTTrO5iFgg@mail.gmail.com>
Subject: Re: [RFC] Stateful codecs and requirements for compressed formats
To:     Hans Verkuil <hverkuil@xs4all.nl>
Cc:     Linux Media Mailing List <linux-media@vger.kernel.org>,
        Nicolas Dufresne <nicolas@ndufresne.ca>,
        Boris Brezillon <boris.brezillon@collabora.com>,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Michael Tretter <m.tretter@pengutronix.de>,
        Tomasz Figa <tfiga@chromium.org>,
        Sylwester Nawrocki <snawrocki@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:5.22.84,1.0.8
 definitions=2019-06-28_06:2019-06-25,2019-06-28 signatures=0
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Hans

On Fri, 28 Jun 2019 at 15:34, Hans Verkuil <hverkuil@xs4all.nl> wrote:
>
> Hi all,
>
> I hope I Cc-ed everyone with a stake in this issue.
>
> One recurring question is how a stateful encoder fills buffers and how a stateful
> decoder consumes buffers.
>
> The most generic case is that an encoder produces a bitstream and just fills each
> CAPTURE buffer to the brim before continuing with the next buffer.
>
> I don't think there are drivers that do this, I believe that all drivers just
> output a single compressed frame. For interlaced formats I understand it is either
> one compressed field per buffer, or two compressed fields per buffer (this is
> what I heard, I don't know if this is true).

From the discussion that started this thread, with H264 and similar,
does the V4L2 buffer contain just the frame data, or the SPS/PPS
headers as well.

> In any case, I don't think this is specified anywhere. Please correct me if I am
> wrong.
>
> The latest stateful codec spec is here:
>
> https://hverkuil.home.xs4all.nl/codec-api/uapi/v4l/dev-mem2mem.html
>
> Assuming what I described above is indeed the case, then I think this should
> be documented. I don't know enough if a flag is needed somewhere to describe
> the behavior for interlaced formats, or can we leave this open and have userspace
> detect this?
>
>
> For decoders it is more complicated. The stateful decoder spec is written with
> the assumption that userspace can just fill each OUTPUT buffer to the brim with
> the compressed bitstream. I.e., no need to split at frame or other boundaries.
>
> See section 4.5.1.7 in the spec.
>
> But I understand that various HW decoders *do* have limitations. I would really
> like to know about those, since that needs to be exposed to userspace somehow.
>
> Specifically, the venus decoder needs to know the resolution of the coded video
> beforehand and it expects a single frame per buffer (how does that work for
> interlaced formats?).
>
> Such requirements mean that some userspace parsing is still required, so these
> decoders are not completely stateful.
>
> Can every codec author give information about their decoder/encoder?
>
> I'll start off with my virtual codec driver:
>
> vicodec: the decoder fully parses the bitstream. The encoder produces a single
> compressed frame per buffer. This driver doesn't yet support interlaced formats,
> but when that is added it will encode one field per buffer.

On BCM283x:

The underlying decoder will accept anything, but giving it a single
frame per buffer reduces latency as the bitstream parser gets kicked
earlier. Based on previous discussions I am setting the flag so that
it expects one compressed frame per buffer, but I don't believe it
goes wrong should that not be the case (it'll just waste a bit of
processing effort).
It'll parse the headers and produce a V4L2_EVENT_SOURCE_CHANGE event
should the capture queue format not match the stream parameters.
Interlacing isn't supported yet (it's on the list), but I believe the
hardware produces the equivalent to V4L2_FIELD_INTERLACED_[TB|BT].

The encoder currently spits out the H264 SPS/PPS headers as a separate
V4L2 buffer, and then one compressed frame per V4L2 buffer (provided
the buffer is big enough). Should
V4L2_CID_MPEG_VIDEO_REPEAT_SEQ_HEADER be set, then it will repeat the
headers in an independent V4L2 buffer before each I frame.
I'm quite happy to amend this should we have a decent spec of what is
required. As I've never found a spec it's been trial and error until
now.
There is no interlaced support available.

  Dave
