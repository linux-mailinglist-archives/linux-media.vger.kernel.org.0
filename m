Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CDC8D5AB1F
	for <lists+linux-media@lfdr.de>; Sat, 29 Jun 2019 14:55:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726912AbfF2Mz0 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 29 Jun 2019 08:55:26 -0400
Received: from mail-qk1-f193.google.com ([209.85.222.193]:41477 "EHLO
        mail-qk1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726906AbfF2Mz0 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 29 Jun 2019 08:55:26 -0400
Received: by mail-qk1-f193.google.com with SMTP id c11so7327931qkk.8
        for <linux-media@vger.kernel.org>; Sat, 29 Jun 2019 05:55:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20150623.gappssmtp.com; s=20150623;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=qCvVTC+Oc6PFoRGrjpMRBIYbKkI0wh0d/5g7+dPyweI=;
        b=tW/Z6bXlvNn6GuiaLzmro1oT3AbBh0JhOKMZo4SNKIl8li8rmQ4ZLFgUjbSb7gPihh
         +XwCNun6n1jfVXCTtq1lwmTPMM+aRV54jrGR6UcmlFn1gQZcrnsC9R7HlPPtOFpJuzMH
         CJvF5S7BMCet+ZSE82nnoWGatYD7WXFsa6XTZgSUTg4uzoUeH3Zfqr7VlzPi0pjArLxz
         HV/8o5TtZ8s+Jtr9FPGy6v09dLO5Hp3YsvuJMkzh3AZDhb12Xy3P5Fhn0MJTVaV9v43E
         zFOjH0uv5KtB6SY/ZTtIgIrMqpzzJPbSD0cIRfLUg5eKyYtefpok7hipSNDBN6mBgtGs
         oszg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=qCvVTC+Oc6PFoRGrjpMRBIYbKkI0wh0d/5g7+dPyweI=;
        b=JPBNM9KeAiSaN/8zCXmufyo24J1d1GsdSiPE50TdOqbLFtqLGzO8hlh0Qnsnd/bSIH
         Xd8wWqpJkXGPxXmGVyZhiyl7Epue4LnoWguxAdxJInxZqF9eZAP+13FYo71SubNpaAXv
         db0IjTzvIiKjzFVqYcmxPgoh/cyzsBDfmpI+Twi4gvMWg2yxcInMGVCCkGe/voiz8JxS
         /j7Wiy91RlUCcXfiijqCU/AYzb3bQknS1mjxuz+e0VYOgvqcIV2h0X44SM2xCy253Ahh
         6noruxb+nH8fNJIy3xTx6HNgBh7e0Usypm8VSUyyi9FyFGoW12yrb8G401JHQIWnf3vo
         XbmA==
X-Gm-Message-State: APjAAAWHdMwvQf1bnTXxQbyqiYV/oehkMOf1BezUKrGicuKhHzI0jT19
        p9b3lhfLua1Ff1C4WW0cYfyr0A==
X-Google-Smtp-Source: APXvYqzSAdyvY7M6S52Fe9DhGG+X7Viz0p2ZxuwRIAvU5apJ535KdaMt953wKOnb4V59xZEhvdww2Q==
X-Received: by 2002:a37:7e84:: with SMTP id z126mr12449627qkc.386.1561812924955;
        Sat, 29 Jun 2019 05:55:24 -0700 (PDT)
Received: from skullcanyon ([192.222.193.21])
        by smtp.gmail.com with ESMTPSA id g5sm2525735qta.77.2019.06.29.05.55.23
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Sat, 29 Jun 2019 05:55:24 -0700 (PDT)
Message-ID: <ce8251cfb964610fed9c9d55e777deaabd017abb.camel@ndufresne.ca>
Subject: Re: [RFC] Stateful codecs and requirements for compressed formats
From:   Nicolas Dufresne <nicolas@ndufresne.ca>
To:     Dave Stevenson <dave.stevenson@raspberrypi.org>
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
Date:   Sat, 29 Jun 2019 08:55:22 -0400
In-Reply-To: <CAAoAYcPhssrTG9X7mztLv=LG5R7z1UmLJkgZsw=DK7V1s32V+A@mail.gmail.com>
References: <530f28e9-f686-6222-c6cc-9a5207b151f7@xs4all.nl>
         <CAAoAYcOa7ngH5pPJze+H25rDQgjeNnpKY=HWQqsGFTTrO5iFgg@mail.gmail.com>
         <9c3fe7a71aa4c2f9c3f92fa8d7a8fe0290f51da0.camel@ndufresne.ca>
         <CAAoAYcPhssrTG9X7mztLv=LG5R7z1UmLJkgZsw=DK7V1s32V+A@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.32.2 (3.32.2-1.fc30) 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Le samedi 29 juin 2019 à 11:02 +0100, Dave Stevenson a écrit :
> Hi Nicolas
> 
> On Fri, 28 Jun 2019 at 16:48, Nicolas Dufresne <nicolas@ndufresne.ca> wrote:
> > Le vendredi 28 juin 2019 à 16:21 +0100, Dave Stevenson a écrit :
> > > Hi Hans
> > > 
> > > On Fri, 28 Jun 2019 at 15:34, Hans Verkuil <hverkuil@xs4all.nl> wrote:
> > > > Hi all,
> > > > 
> > > > I hope I Cc-ed everyone with a stake in this issue.
> > > > 
> > > > One recurring question is how a stateful encoder fills buffers and how a stateful
> > > > decoder consumes buffers.
> > > > 
> > > > The most generic case is that an encoder produces a bitstream and just fills each
> > > > CAPTURE buffer to the brim before continuing with the next buffer.
> > > > 
> > > > I don't think there are drivers that do this, I believe that all drivers just
> > > > output a single compressed frame. For interlaced formats I understand it is either
> > > > one compressed field per buffer, or two compressed fields per buffer (this is
> > > > what I heard, I don't know if this is true).
> > > 
> > > From the discussion that started this thread, with H264 and similar,
> > > does the V4L2 buffer contain just the frame data, or the SPS/PPS
> > > headers as well.
> > 
> > In existing mainline encoder driver the SPS/PPS is included in the
> > first frame produced. Decoders expect them to be in the first frame
> > queued. For decoder, this is being relaxed now that we have a mechanism
> > to notify the state change after the header has been processed.
> 
> So it sounds like the one bit missing is everyone's "friend" -
> documentation. I'm eternally grateful to those who are making the
> efforts in updating it. It's a thankless task, but absolutely
> necessary.
> 
> For those outside the core linux-media circles there is a choice to be
> made, and different APIs do adopt different approaches.
> OpenMAX IL for one explicitly documents exactly the opposite approach
> to V4L2, although admittedly through an optional flag. 1.1.2 spec [1],
> section 3.1.2.7.1 (page 70)
> 
> The OMX_BUFFERFLAG_CODECCONFIG is an optional flag that is
> set by an output port when all bytes in the buffer form part or all of a set of
> codec specific configuration data. Examples include SPS/PPS nal units
> for OMX_VIDEO_CodingAVC or AudioSpecificConfig data for
> OMX_AUDIO_CodingAAC. Any component that for a given stream sets
> OMX_BUFFERFLAG_CODECCONFIG shall not mix codec
> configuration bytes with frame data in the same buffer, and shall send all
> buffers containing codec configuration bytes before any buffers containing
> frame data that those configurations bytes describe.

That only applies to OMX encoders. OMX decoders accepts any alignment
but will have higher latency. On the decoder side they use an
END_OF_FRAME kind of flag for when the data is pre-parsed in order to
reduce that latency (I have only found NVidia respecting this).

A rational for doing it like this is that it will ease use cases where
you want to pass the codec config out-of-band. This is notably the case
for ISOMP4, but then you need to convert start-code into AVC header
(which requires parsing) or for some RTP based protocols where you'd
pass the headers through an SDP or other signalling. I have never met
two OMX stack doing the same thing is this regard, so we ended merging
these together and letting our generic parser handle the conversion.

For the Linux kernel, I don't think we have an equivalent of
OMX_BUFFERFLAG_CODECCONFIG. I believe we also have the problem that if
a firmware decides to merge things, we would have to do some bitstream
parsing in order to separate them (which has been clearly stated as a
no-go so far). Note that some firmware don't even produce the headers,
the drivers need to produce them.

What I'm bringing here is what drivers has been doing since 2011. I
think most userspace will work regardless of the encoder buffer
alignment, but some glitches may also exist. An example, in GStreamer
the code that do input/output timestamp matching was commented out
because the value coming from Samsung MFC driver was completely random.
No one have worked on re-enabling this since, as all drivers started
following this 1 buffer 1 frame rule. The side effect, is that the
matching of metadata (timestamp, timecode, AFB, CC, Tags, etc.) may be
off by a small amount of frames. In general it does not break
completely.

> 
>   Dave
> 
> [1] https://www.khronos.org/registry/OpenMAX-IL/specs/OpenMAX_IL_1_1_2_Specification.pdf

Just a reminder that OMX is a dead specification. All member of the
board have left and no further update will be made available. There was
very good advances in 1.2 draft, but it still got abandoned. In the
end, each implementation represent it's own fork of the specification.
You'll even find some DMABuf support on the ZynqMP OMX stack. But
supporting OMX has became a incredible mess and is not portable at all
(which defeat the purpose of the spec in the first place).

> 
> > > > In any case, I don't think this is specified anywhere. Please correct me if I am
> > > > wrong.
> > > > 
> > > > The latest stateful codec spec is here:
> > > > 
> > > > https://hverkuil.home.xs4all.nl/codec-api/uapi/v4l/dev-mem2mem.html
> > > > 
> > > > Assuming what I described above is indeed the case, then I think this should
> > > > be documented. I don't know enough if a flag is needed somewhere to describe
> > > > the behavior for interlaced formats, or can we leave this open and have userspace
> > > > detect this?
> > > > 
> > > > 
> > > > For decoders it is more complicated. The stateful decoder spec is written with
> > > > the assumption that userspace can just fill each OUTPUT buffer to the brim with
> > > > the compressed bitstream. I.e., no need to split at frame or other boundaries.
> > > > 
> > > > See section 4.5.1.7 in the spec.
> > > > 
> > > > But I understand that various HW decoders *do* have limitations. I would really
> > > > like to know about those, since that needs to be exposed to userspace somehow.
> > > > 
> > > > Specifically, the venus decoder needs to know the resolution of the coded video
> > > > beforehand and it expects a single frame per buffer (how does that work for
> > > > interlaced formats?).
> > > > 
> > > > Such requirements mean that some userspace parsing is still required, so these
> > > > decoders are not completely stateful.
> > > > 
> > > > Can every codec author give information about their decoder/encoder?
> > > > 
> > > > I'll start off with my virtual codec driver:
> > > > 
> > > > vicodec: the decoder fully parses the bitstream. The encoder produces a single
> > > > compressed frame per buffer. This driver doesn't yet support interlaced formats,
> > > > but when that is added it will encode one field per buffer.
> > > 
> > > On BCM283x:
> > > 
> > > The underlying decoder will accept anything, but giving it a single
> > > frame per buffer reduces latency as the bitstream parser gets kicked
> > > earlier. Based on previous discussions I am setting the flag so that
> > > it expects one compressed frame per buffer, but I don't believe it
> > > goes wrong should that not be the case (it'll just waste a bit of
> > > processing effort).
> > > It'll parse the headers and produce a V4L2_EVENT_SOURCE_CHANGE event
> > > should the capture queue format not match the stream parameters.
> > > Interlacing isn't supported yet (it's on the list), but I believe the
> > > hardware produces the equivalent to V4L2_FIELD_INTERLACED_[TB|BT].
> > > 
> > > The encoder currently spits out the H264 SPS/PPS headers as a separate
> > > V4L2 buffer, and then one compressed frame per V4L2 buffer (provided
> > > the buffer is big enough). Should
> > > V4L2_CID_MPEG_VIDEO_REPEAT_SEQ_HEADER be set, then it will repeat the
> > > headers in an independent V4L2 buffer before each I frame.
> > > I'm quite happy to amend this should we have a decent spec of what is
> > > required. As I've never found a spec it's been trial and error until
> > > now.
> > > There is no interlaced support available.
> > > 
> > >   Dave

