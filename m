Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AD36A5DFD0
	for <lists+linux-media@lfdr.de>; Wed,  3 Jul 2019 10:32:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727142AbfGCIcj (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 3 Jul 2019 04:32:39 -0400
Received: from mail-ed1-f50.google.com ([209.85.208.50]:45736 "EHLO
        mail-ed1-f50.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727103AbfGCIcj (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 3 Jul 2019 04:32:39 -0400
Received: by mail-ed1-f50.google.com with SMTP id a14so1186662edv.12
        for <linux-media@vger.kernel.org>; Wed, 03 Jul 2019 01:32:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=fJZN4T1wxhdeBjOAWLZm6RcRzgL4AXAvZbBVItk53do=;
        b=Y7LYj0WmpcHTAG9Xp4kIF5h6euLpOd6Zvt1/bencnNTp3dLP2lXM1a2VKx4PfW9eht
         x1u1b2llXRO00ucfdAXQY36ErmiLB56jgyyxObTvGIxbyiVzQEg+qQ/xo8/K5ZS8VIM3
         3MIFsZKHphdVr9QgFmBk2a8N/dNHfymZpYSRk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=fJZN4T1wxhdeBjOAWLZm6RcRzgL4AXAvZbBVItk53do=;
        b=RCxhyaNInFCO6qKPGddUzwZbieiq1ZjA37jLAOlESK/Yh0drqTyKdVeXnBXmijDYTz
         fwRgfayDSWqOQMotc1fGXQ2sZ7abO2FFlRT4tRR5n17RT0Y5DslZ3VqJmgQyahhEqA71
         5zDVofWRukM0RoS+xUACJC/DrXs2rIEv01J8zh3vPmamw51+Q88BLN6T+0Bob8a5QB5i
         HHk774Oo4ptSLVXI5ElIjCU/H9RimyUcI/npoNGF8pCWxGAISdEDIA4J0H75Qa60bAtt
         A5H6MHeG3o+PMnTiEsZYjYzOqI4wboitWzSZAA/XoKUJCwk9C9hf38qgisoaaM2R97dt
         5uNg==
X-Gm-Message-State: APjAAAXd181h8Us3vtynjBmm1/YtXUJbw2kZ0ThHO29ptDb30gIIpwiU
        kOWgpTujtsgUSCbou/KJyxH6FgfYvDj6tg==
X-Google-Smtp-Source: APXvYqzDdQV0QVvMFO70EOEyJN8/jcH+hw/mt4nWyml5/lrEHNezRehRU/E4Vqg0/RqOeV7kV4DzRw==
X-Received: by 2002:a50:ba19:: with SMTP id g25mr40993150edc.123.1562142757281;
        Wed, 03 Jul 2019 01:32:37 -0700 (PDT)
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com. [209.85.221.43])
        by smtp.gmail.com with ESMTPSA id p22sm313301ejm.38.2019.07.03.01.32.34
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
        Wed, 03 Jul 2019 01:32:35 -0700 (PDT)
Received: by mail-wr1-f43.google.com with SMTP id c2so1707185wrm.8
        for <linux-media@vger.kernel.org>; Wed, 03 Jul 2019 01:32:34 -0700 (PDT)
X-Received: by 2002:a05:6000:1150:: with SMTP id d16mr3672075wrx.48.1562142754625;
 Wed, 03 Jul 2019 01:32:34 -0700 (PDT)
MIME-Version: 1.0
References: <530f28e9-f686-6222-c6cc-9a5207b151f7@xs4all.nl>
In-Reply-To: <530f28e9-f686-6222-c6cc-9a5207b151f7@xs4all.nl>
From:   Tomasz Figa <tfiga@chromium.org>
Date:   Wed, 3 Jul 2019 17:32:23 +0900
X-Gmail-Original-Message-ID: <CAAFQd5BqUS201QP4KHzmnKi5r+3P_KAa=L9CF3=zyQKypNyVuw@mail.gmail.com>
Message-ID: <CAAFQd5BqUS201QP4KHzmnKi5r+3P_KAa=L9CF3=zyQKypNyVuw@mail.gmail.com>
Subject: Re: [RFC] Stateful codecs and requirements for compressed formats
To:     Hans Verkuil <hverkuil@xs4all.nl>
Cc:     Linux Media Mailing List <linux-media@vger.kernel.org>,
        Nicolas Dufresne <nicolas@ndufresne.ca>,
        Dave Stevenson <dave.stevenson@raspberrypi.org>,
        Boris Brezillon <boris.brezillon@collabora.com>,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Michael Tretter <m.tretter@pengutronix.de>,
        Sylwester Nawrocki <snawrocki@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Hans,

On Fri, Jun 28, 2019 at 11:34 PM Hans Verkuil <hverkuil@xs4all.nl> wrote:
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
>
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

From Chromium perspective, we don't have any use case for encoding
interlaced contents, so we'll be okay with whatever the interested
parties decide on. :)

>
> For decoders it is more complicated. The stateful decoder spec is written with
> the assumption that userspace can just fill each OUTPUT buffer to the brim with
> the compressed bitstream. I.e., no need to split at frame or other boundaries.
>
> See section 4.5.1.7 in the spec.
>
> But I understand that various HW decoders *do* have limitations. I would really
> like to know about those, since that needs to be exposed to userspace somehow.

AFAIK mtk-vcodec needs H.264 SPS and PPS to be split into their own
separate buffers. I believe it also needs 1 buffer to contain exactly
1 frame and 1 frame to be fully contained inside 1 buffer.

Venus also needed 1 buffer to contain exactly 1 frame and 1 frame to
be fully contained inside 1 buffer. It used to have some specific
requirements regarding SPS and PPS too, but I think that was fixed in
the firmware.

>
> Specifically, the venus decoder needs to know the resolution of the coded video
> beforehand

I don't think that's true for venus. It does parsing and can detect
the resolution.

However that's probably the case for coda...

> and it expects a single frame per buffer (how does that work for
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
>
> Let's see what the results are.

s5p-mfc:
 decoder: fully parses the bitstream,
 encoder: produces a single frame per buffer (haven't tested interlaced stuff)

mtk-vcodec:
 decoder: expects separate buffers for SPS, PPS and full frames
(including some random stuff like SEIMessage),
 encoder: produces a single frame per buffer (haven't tested interlaced stuff)

Best regards,
Tomasz
