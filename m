Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0D4DE64FF3
	for <lists+linux-media@lfdr.de>; Thu, 11 Jul 2019 03:40:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727773AbfGKBkl (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 10 Jul 2019 21:40:41 -0400
Received: from mail-qt1-f172.google.com ([209.85.160.172]:38457 "EHLO
        mail-qt1-f172.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727595AbfGKBkl (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 10 Jul 2019 21:40:41 -0400
Received: by mail-qt1-f172.google.com with SMTP id n11so4662982qtl.5
        for <linux-media@vger.kernel.org>; Wed, 10 Jul 2019 18:40:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20150623.gappssmtp.com; s=20150623;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=/IpgZ/neZ2aqqbkeJp9fUjDcT58qp+6d+BgJyOTjvG0=;
        b=ezRiUI9Fpcsc7gihZ8V0KGIhWwzd33nBpyr8kL3Bx3EFN3ZEX+ofC5pFsloLj0hL6g
         ADWuisivefOycT+m0fOQ7vBxZ0h4rjwW3lE76eClYzBuYRgRRl2qnyHKugoPe0FHQ2FR
         ZOy21PQER1EsEmar/wh4yaDDXNOFamlqbBtHHgcBsPsyri11Hx6sbfse0fimdOa7nnz/
         PIuZN0U7NwXyOgyDl72AVnboSwvHDNKfLDbD8YQhfrMbVey/shJpn16TTTvkDvmruPMt
         Tt1RKUeK80hnT4TElS8eX6Zrl4sec8+ps9DcT7FOJObC4wsij28fQ6xGuxP27SqBgFlz
         CnOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=/IpgZ/neZ2aqqbkeJp9fUjDcT58qp+6d+BgJyOTjvG0=;
        b=fyWuAA1TW5UhctXGp95UvmY2hT//l2y+0gzH5FZYUKAWcWERebTfnN7vqDeXBgojO7
         G9eYL8H+7vNSLCMDN95zI9LlfUuXdp1f3iV/P4IsPigA0xOUalxFbUfACRYPvD2W+Ko9
         YxQS+MOmUl88fyRoKPn6tZ8rd5XBLfJ76ZqBMZvw32nu404XVuE8gzTMyUifLJE/u/oM
         jU/AY0y/zHU0URyGcJSfbh9eL1J9a/Vq3DXKX1qg/nHJh7vnZSlNewJSX/BiPGJaly77
         V3XCKVAySPOqS7AhOuHpiev8m9e/4fZsyKtb8qy7CEJeMo0ZX8cEZ8WHk8ZI+6yWDuZV
         omsg==
X-Gm-Message-State: APjAAAWLfT/zna2VWKeG+e4b8jyv9UeX0s6lFlyLJInu64tyt5fqFVxK
        SihDN8qITkg5sFhocLz5U/w=
X-Google-Smtp-Source: APXvYqx2aATbyGevH08RS9H2awfebMo52fus/CnUJ/a1Pk28Qxr3gCuIldiNPUCOI5NZ0wOgCOjVww==
X-Received: by 2002:ac8:2e59:: with SMTP id s25mr925470qta.94.1562809239841;
        Wed, 10 Jul 2019 18:40:39 -0700 (PDT)
Received: from skullcanyon ([192.222.193.21])
        by smtp.gmail.com with ESMTPSA id z33sm1709154qtc.56.2019.07.10.18.40.36
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Wed, 10 Jul 2019 18:40:38 -0700 (PDT)
Message-ID: <a5f66bf147aa0e095a97ab1e3f138b232ddf5de4.camel@ndufresne.ca>
Subject: Re: [RFC] Stateful codecs and requirements for compressed formats
From:   Nicolas Dufresne <nicolas@ndufresne.ca>
To:     Hans Verkuil <hverkuil@xs4all.nl>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Dave Stevenson <dave.stevenson@raspberrypi.org>,
        Boris Brezillon <boris.brezillon@collabora.com>,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Michael Tretter <m.tretter@pengutronix.de>,
        Tomasz Figa <tfiga@chromium.org>,
        Sylwester Nawrocki <snawrocki@kernel.org>
Date:   Wed, 10 Jul 2019 21:40:35 -0400
In-Reply-To: <a2fb2846-2c29-d4ec-f3d9-9dedf497dd87@xs4all.nl>
References: <530f28e9-f686-6222-c6cc-9a5207b151f7@xs4all.nl>
         <5b1362779132c1a47c26cd5080d5eb9920e72db3.camel@ndufresne.ca>
         <a2fb2846-2c29-d4ec-f3d9-9dedf497dd87@xs4all.nl>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.32.2 (3.32.2-1.fc30) 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Le mercredi 10 juillet 2019 à 10:43 +0200, Hans Verkuil a écrit :
> On 6/28/19 8:09 PM, Nicolas Dufresne wrote:
> > Le vendredi 28 juin 2019 à 16:34 +0200, Hans Verkuil a écrit :
> > > Hi all,
> > > 
> > > I hope I Cc-ed everyone with a stake in this issue.
> > > 
> > > One recurring question is how a stateful encoder fills buffers and how a stateful
> > > decoder consumes buffers.
> > > 
> > > The most generic case is that an encoder produces a bitstream and just fills each
> > > CAPTURE buffer to the brim before continuing with the next buffer.
> > > 
> > > I don't think there are drivers that do this, I believe that all drivers just
> > > output a single compressed frame. For interlaced formats I understand it is either
> > > one compressed field per buffer, or two compressed fields per buffer (this is
> > > what I heard, I don't know if this is true).
> > > 
> > > In any case, I don't think this is specified anywhere. Please correct me if I am
> > > wrong.
> > > 
> > > The latest stateful codec spec is here:
> > > 
> > > https://hverkuil.home.xs4all.nl/codec-api/uapi/v4l/dev-mem2mem.html
> > > 
> > > Assuming what I described above is indeed the case, then I think this should
> > > be documented. I don't know enough if a flag is needed somewhere to describe
> > > the behavior for interlaced formats, or can we leave this open and have userspace
> > > detect this?
> > > 
> > > 
> > > For decoders it is more complicated. The stateful decoder spec is written with
> > > the assumption that userspace can just fill each OUTPUT buffer to the brim with
> > > the compressed bitstream. I.e., no need to split at frame or other boundaries.
> > > 
> > > See section 4.5.1.7 in the spec.
> > > 
> > > But I understand that various HW decoders *do* have limitations. I would really
> > > like to know about those, since that needs to be exposed to userspace somehow.
> > > 
> > > Specifically, the venus decoder needs to know the resolution of the coded video
> > > beforehand and it expects a single frame per buffer (how does that work for
> > > interlaced formats?).
> > > 
> > > Such requirements mean that some userspace parsing is still required, so these
> > > decoders are not completely stateful.
> > > 
> > > Can every codec author give information about their decoder/encoder?
> > > 
> > > I'll start off with my virtual codec driver:
> > > 
> > > vicodec: the decoder fully parses the bitstream. The encoder produces a single
> > > compressed frame per buffer. This driver doesn't yet support interlaced formats,
> > > but when that is added it will encode one field per buffer.
> > > 
> > > Let's see what the results are.
> > 
> > Hans though a summary of what existing userspace expects / assumes
> > would be nice.
> > 
> > GStreamer:
> > ==========
> > Encodes:
> >   fwht, h263, h264, hevc, jpeg, mpeg4, vp8, vp9
> > Decodes:
> >   fwht, h263, h264, hevc, jpeg, mpeg2, mpeg4, vc1, vp8, vp9
> > 
> > It assumes that each encoded v4l2_buffer contains exactly one frame
> > (any format, two fields for interlaced content). It may still work
> > otherwise, but some issues will appear, timestamp shift, lost of
> > metadata (e.g. timecode, cc, etc.).
> 
> When you say 'each encoded v4l2_buffer contains exactly on frame',
> does that include H.264 SPS/PPS headers? Or are those passed in
> a separate v4l2_buffer? 

Yes, the SPS/PPS is assumed to be in the same buffer. In the case of
the decoder it's guarantied to be, if the decoder does not do that, it
will still work with a timestamp shift.

> Ditto for FFMPEG.

I believe it's the same, but I'd need to re-read that code to confirm.
The thing about FFMPEG is that the internal format is always AVC
instead of bytestream. And the PPS/SPS travels out-of-band, which means
it's not inside an AVPacket internally.

> 
> Regards,
> 
> 	Hans
> 
> > FFMpeg:
> > =======
> > Encodes:
> >   h263, h264, hevc, mpeg4, vp8
> > Decodes:
> >   h263, h264, hevc, mpeg2, mpeg4, vc1, vp8, vp9
> > 
> > Similarly to GStreamer, it assumes that one AVPacket will fit one
> > v4l2_buffer. On the encoding side, it seems less of a problem, but they
> > don't fully implement the FFMPEG CODEC API for frame matching, which I
> > suspect would create some ambiguity if it was.
> > 
> > Chromium:
> > =========
> > Decodes:
> >   H264, VP8, VP9
> > Encodes:
> >   H264
> > 
> > That is the code I know the less, but the encoder does not seem
> > affected by the nal alignment. The keyframe flag and timestamps seems
> > to be used and are likely expected to correlate with the input, so I
> > suspect that there exist some possible ambiguity if the output is not
> > full frame. For the decoder, I'll have to ask someone else to comment,
> > the code is hard to follow and I could not get to the place where
> > output buffers are filled. I thought the GStreamer code was tough, but
> > this is quite similarly a mess.
> > 
> > Nicolas
> > 
> > 
> > 
> > 
> > 
> > 

