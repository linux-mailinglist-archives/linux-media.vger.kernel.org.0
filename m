Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4DA6041973
	for <lists+linux-media@lfdr.de>; Wed, 12 Jun 2019 02:33:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2407292AbfFLAdM (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 11 Jun 2019 20:33:12 -0400
Received: from mail-qk1-f196.google.com ([209.85.222.196]:41415 "EHLO
        mail-qk1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2407273AbfFLAdM (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 11 Jun 2019 20:33:12 -0400
Received: by mail-qk1-f196.google.com with SMTP id c11so8888022qkk.8
        for <linux-media@vger.kernel.org>; Tue, 11 Jun 2019 17:33:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20150623.gappssmtp.com; s=20150623;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=YskuotKZ1ju/Sd7KV3N/54AMIwBSytcUxbzE4Q/MEzc=;
        b=E8ZL5CJ1jB86Z76Sd+8CzpTe74eYEDALXhnwIMZY6Xnd56E1GB6lrqrBUWEha2yzN8
         guVjrOerJH76HRTsEz1N5dSuRYuKOSafgJISU7eFmzPHt3IPscVy/jhPeX1nI19N+Lyf
         goD2mGaVJ8Ohl+fJs319CcZHfZVy5oYlx0uJtOqnCPVHx/7pDZFFJhAZD7ZAuUM9dJRr
         YHewdD1aTwQBwkMuABmJ/pK4mFYktN30yTezfXwdeFNYrg0Ryb9hboTTGQtR+ph7proj
         Ry19sXP4Y5N6U2C6KPwwfnsIy77aIFfQ0nR4jbk55GlxRhAaJwjIou8T3Lg5fb78Vybg
         9Frw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=YskuotKZ1ju/Sd7KV3N/54AMIwBSytcUxbzE4Q/MEzc=;
        b=ciOWLNoAOVAP3m8bnyOJeEoEjBchwzRzHeQJEm+FTP0hjx8eI8QAvbbLZ644CrGLk9
         KA9YOHi1QLeG88enMVsO8Oq0rCunyV98ATbmwxhvUL0yNmKEBQvNcqHIJr/yaOtNiXzk
         ltvKPtpqxY8jppEplE2EbqpSTsbH6+hKNypjNAYxa6Y43HHaZbOfIqKAs6O52eDGk1E5
         TKYN0uQVA7wzG/Ix4oeaVZQ6YDmNDcFTalA74Yl5QrvCySOHSZWPwh3ZH2+JIqSyqboA
         J2Vi7gU0DqL4QwKDTP/zcc+SJ1thLyjcalYpbShLohHxMkd/W6KqI+ymOM0+SqCw/xkE
         xHGw==
X-Gm-Message-State: APjAAAVh9hmI9nlJJZXos2aPod7TF/WqRoTC98CGE6xemS8TKBOW040v
        MOQf7uV4r+ElL46y9wWIYRVaZNxD2DhD1aVY
X-Google-Smtp-Source: APXvYqwwj3fguJ4Uffl3GUJ338wFJOm4Bz3nYTMAQMgiP4kzMRCE6ZQKa9KLV004WVsIo67a611dxw==
X-Received: by 2002:a37:795:: with SMTP id 143mr63565712qkh.140.1560299591236;
        Tue, 11 Jun 2019 17:33:11 -0700 (PDT)
Received: from skullcanyon ([192.222.193.21])
        by smtp.gmail.com with ESMTPSA id g54sm1672708qtc.61.2019.06.11.17.33.09
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Tue, 11 Jun 2019 17:33:10 -0700 (PDT)
Message-ID: <8dfac9c5ff144ce2a3d221ea52d972ebdbd9910f.camel@ndufresne.ca>
Subject: Re: [PATCHv4 0/2] Document memory-to-memory video codec interfaces
From:   Nicolas Dufresne <nicolas@ndufresne.ca>
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        linux-media@vger.kernel.org
Cc:     Tomasz Figa <tfiga@chromium.org>, linux-kernel@vger.kernel.org,
        Alexandre Courbot <acourbot@chromium.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
        Tiffany Lin <tiffany.lin@mediatek.com>,
        Pawel Osciak <posciak@chromium.org>
Date:   Tue, 11 Jun 2019 20:33:08 -0400
In-Reply-To: <41bac425-65bf-2cd7-ef70-e705f7b1717d@xs4all.nl>
References: <20190603112835.19661-1-hverkuil-cisco@xs4all.nl>
         <e40174b9a3d813389dc9529598541e4849067387.camel@ndufresne.ca>
         <41bac425-65bf-2cd7-ef70-e705f7b1717d@xs4all.nl>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.32.2 (3.32.2-1.fc30) 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Le mardi 11 juin 2019 à 10:35 +0200, Hans Verkuil a écrit :
> On 6/10/19 5:57 PM, Nicolas Dufresne wrote:
> > Le lundi 03 juin 2019 à 13:28 +0200, Hans Verkuil a écrit :
> > > Since Thomasz was very busy with other things, I've taken over this
> > > patch series. This v4 includes his draft changes and additional changes
> > > from me.
> > > 
> > > This series attempts to add the documentation of what was discussed
> > > during Media Workshops at LinuxCon Europe 2012 in Barcelona and then
> > > later Embedded Linux Conference Europe 2014 in Düsseldorf and then
> > > eventually written down by Pawel Osciak and tweaked a bit by Chrome OS
> > > video team (but mostly in a cosmetic way or making the document more
> > > precise), during the several years of Chrome OS using the APIs in
> > > production.
> > > 
> > > Note that most, if not all, of the API is already implemented in
> > > existing mainline drivers, such as s5p-mfc or mtk-vcodec. Intention of
> > > this series is just to formalize what we already have.
> > > 
> > > Thanks everyone for the huge amount of useful comments to previous
> > > versions of this series. Much of the credits should go to Pawel Osciak
> > > too, for writing most of the original text of the initial RFC.
> > > 
> > > This v4 incorporates all known comments (let me know if I missed
> > > something!) and should be complete for the decoder.
> > > 
> > > For the encoder there are two remaining TODOs for the API:
> > > 
> > > 1) Setting the frame rate so bitrate control can make sense, since
> > >    they need to know this information.
> > > 
> > >    Suggested solution: require support for ENUM_FRAMEINTERVALS for the
> > >    coded pixelformats and S_PARM(OUTPUT). Open question: some drivers
> > >    (mediatek, hva, coda) require S_PARM(OUTPUT), some (venus) allow both
> > >    S_PARM(CAPTURE) and S_PARM(OUTPUT). I am inclined to allow both since
> > >    this is not a CAPTURE vs OUTPUT thing, it is global to both queues.
> > 
> > Is ENUM_FRAMEINTERVALS really required ? This will be a hint to the
> > encoder, so that the encoder round to it's internal precision does not
> > seem very important.
> 
> I don't like this proposal. Especially the use of S_PARM (I *hate* that ioctl).
> I think the frame period should be a control with a min/max range, like
> any other control.
> 
> FRAMEINTERVALS really refers to the rate at which frames arrive when
> capturing, and that's not quite what is happening in an encoder.

Only side is that this is exactly what happens when doing live encoding
(to site GStreamer):

   v4l2src ! v4l2encoder ! ...

The frameinterval is exactly what the V4L2 capture device reports.
Though, a lot of encoder used for RTP transcoding takes a per frame
duration as input, as RTP does not always expose the framerate (aka
frame duration). Or the other way around is that the frameinterval is
calculates and updated periodically (S_PARM do have this advantage that
you are suppose to be able to change that while streaming, no idea if
that works in practice). I do not like the ioctl() though. This could
have been a control and could be called framerate to match what the
rest of the world uses.

> 
> For now I want to concentrate on the decoder spec, and I'll come back to
> this later.

Ok.

> 
> > > 2) Interactions between OUTPUT and CAPTURE formats.
> > > 
> > >    The main problem is what to do if the capture sizeimage is too small
> > >    for the OUTPUT resolution when streaming starts.
> > > 
> > >    Proposal: width and height of S_FMT(OUTPUT) are used to
> > >    calculate a minimum sizeimage (app may request more). This is
> > >    driver-specific.
> > > 
> > >    V4L2_FMT_FLAG_FIXED_RESOLUTION is always set for codec formats
> > >    for the encoder (i.e. we don't support mid-stream resolution
> > >    changes for now) and V4L2_EVENT_SOURCE_CHANGE is not
> > >    supported. See https://patchwork.linuxtv.org/patch/56478/ for
> > >    the patch adding this flag.
> > > 
> > >    Of course, if we start to support mid-stream resolution
> > >    changes (or other changes that require a source change event),
> > >    then this flag should be dropped by the encoder driver and
> > >    documentation on how to handle the source change event should
> > >    be documented in the encoder spec. I prefer to postpone this
> > >    until we have an encoder than can actually do mid-stream
> > >    resolution changes.
> > 
> > For H264, mid-stream changes would make sense for the case we'd like
> > the statefull encoder to emit multiple PPS at start, so then the switch
> > would simply change the PPS index. The problem seems to be how do we
> > expose "multiple" resolution in our interface ? As there is currently
> > no solution to this, I would not see much use for having this supported
> > at the moment.
> 
> I agree. That's why I want to postpone that part.
> 
> > >    If sizeimage of the OUTPUT is too small for the CAPTURE
> > >    resolution and V4L2_EVENT_SOURCE_CHANGE is not supported,
> > >    then the second STREAMON (either CAPTURE or OUTPUT) will
> > >    return -ENOMEM since there is not enough memory to do the
> > >    encode.
> > > 
> > >    If V4L2_FMT_FLAG_FIXED_RESOLUTION is set (i.e. that should
> > >    be the case for all current encoders), then any bitrate controls
> > >    will be limited in range to what the current state (CAPTURE and
> > >    OUTPUT formats and frame rate) supports.
> 
> Note that this flag will be inverted: V4L2_FMT_FLAG_DYN_RESOLUTION.
> So this text is out of date in that regard.
> 
> Regards,
> 
> 	Hans
> 
> > > Comments regarding these two encoder proposals are welcome!
> > > 
> > > Regards,
> > > 
> > > 	Hans
> > > 
> > > Changes since v3:
> > > 
> > > - Lots of stylistic fixes and fixing typos/grammar/etc.
> > > 
> > > Decoder:
> > > 
> > > - width/height for S_FMT(OUTPUT):
> > > 
> > >   Expects that the output width and height is always a valid
> > >   resolution (i.e. never 0x0), and G/S/TRY_FMT and REQBUFS will use that
> > >   instead of returning an error. Note that this resolution is a placeholder
> > >   until the actual resolution is parsed from the stream.
> > > 
> > > - Dropped step 3 (Query the minimum number of buffers required for the CAPTURE
> > >   queue via VIDIOC_G_CTRL().) in the Capture Setup section. It seems to be
> > >   a left-over from earlier versions. The same information is also in Step 10,
> > >   so no need to have this in two places.
> > > 
> > > - Added step 5 in the Capture Setup section: set COMPOSE rectangle if needed.
> > > 
> > > - VIDIO_DECODER_CMD: document EBUSY return while draining the queue.
> > > 
> > > Encoder:
> > > 
> > > - width/height for S_FMT(CAPTURE): The width/height for the CAPTURE format
> > >   are marked as read-only and are based on the encoders current state such
> > >   as the OUTPUT format.
> > > 
> > > - Drop TGT_COMPOSE support in the encoder: there are currently
> > >   no encoders that can do composing/scaling.
> > > 
> > > - Document corner cases in the Drain sequence
> > > 
> > > - Document error handling.
> > > 
> > > - VIDIO_ENCODER_CMD: document EBUSY return while draining the queue.
> > > 
> > > Changes since v2:
> > > (https://lore.kernel.org/patchwork/cover/1002474/)
> > > Decoder:
> > >  - Specified that the initial source change event is signaled
> > >    regardless of whether the client-set format matches the
> > >    stream format.
> > >  - Dropped V4L2_CID_MIN_BUFFERS_FOR_OUTPUT since it's meaningless
> > >    for the bitstream input buffers of decoders.
> > >  - Explicitly stated that VIDIOC_REQBUFS is not allowed on CAPTURE
> > >    if the stream information is not available.
> > >  - Described decode error handling.
> > >  - Mentioned that timestamps can be observed after a seek to
> > >    determine whether the CAPTURE buffers originated from before
> > >    or after the seek.
> > >  - Explicitly stated that after a pair of V4L2_DEC_CMD_STOP and
> > >    V4L2_DEC_CMD_START, the decoder is not reset and preserves
> > >    all the state.
> > > 
> > > Encoder:
> > >  - Specified that width and height of CAPTURE format are ignored
> > >    and always zero.
> > >  - Explicitly noted the common use case for the CROP target with
> > >    macroblock-unaligned video resolutions.
> > >  - Added a reference to Request API.
> > >  - Dropped V4L2_CID_MIN_BUFFERS_FOR_CAPTURE since it's meaningless
> > >    for the bitstream output buffers of encoders.
> > >  - Explicitly stated that after a pair of V4L2_ENC_CMD_STOP and
> > >    V4L2_ENC_CMD_START, the encoder is not reset and preserves
> > >    all the state.
> > > 
> > > General:
> > >  - Dropped format enumeration from "Initialization", since it's already
> > >    a part of "Querying capabilities".
> > >  - Many spelling, grammar, stylistic, etc. changes.
> > >  - Changed the style of note blocks.
> > >  - Rebased onto Hans' documentation cleanup series.
> > >    (https://patchwork.kernel.org/cover/10775407/
> > >     https://patchwork.kernel.org/patch/10776737/)
> > >  - Moved the interfaces under the "Video Memory-To-Memory Interface"
> > >    section.
> > > 
> > > For changes since v1 see the v2:
> > > https://lore.kernel.org/patchwork/cover/1002474/
> > > 
> > > For changes since RFC see the v1:
> > > https://patchwork.kernel.org/cover/10542207/
> > > 
> > > Tomasz Figa (2):
> > >   media: docs-rst: Document memory-to-memory video decoder interface
> > >   media: docs-rst: Document memory-to-memory video encoder interface
> > > 
> > >  Documentation/media/uapi/v4l/dev-decoder.rst  | 1084 +++++++++++++++++
> > >  Documentation/media/uapi/v4l/dev-encoder.rst  |  608 +++++++++
> > >  Documentation/media/uapi/v4l/dev-mem2mem.rst  |    9 +-
> > >  Documentation/media/uapi/v4l/pixfmt-v4l2.rst  |   10 +
> > >  Documentation/media/uapi/v4l/v4l2.rst         |   12 +-
> > >  .../media/uapi/v4l/vidioc-decoder-cmd.rst     |   41 +-
> > >  .../media/uapi/v4l/vidioc-encoder-cmd.rst     |   51 +-
> > >  7 files changed, 1779 insertions(+), 36 deletions(-)
> > >  create mode 100644 Documentation/media/uapi/v4l/dev-decoder.rst
> > >  create mode 100644 Documentation/media/uapi/v4l/dev-encoder.rst
> > > 

