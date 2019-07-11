Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 104556574E
	for <lists+linux-media@lfdr.de>; Thu, 11 Jul 2019 14:50:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728231AbfGKMuE (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 11 Jul 2019 08:50:04 -0400
Received: from mail-ed1-f65.google.com ([209.85.208.65]:34347 "EHLO
        mail-ed1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726016AbfGKMuE (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 11 Jul 2019 08:50:04 -0400
Received: by mail-ed1-f65.google.com with SMTP id s49so5700141edb.1
        for <linux-media@vger.kernel.org>; Thu, 11 Jul 2019 05:50:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=tuumzqklLCQWflGrXS3Bcst/0WhhR79egWgv5q79yJY=;
        b=HPjv43YPjc127KkOqy6AwcRK27hNbRVVpLtEmrZpi2SKvf9DRWaFsq2QeCVBmx+++v
         JM/Cy5QlGLnwORqkzIZ6jC+mL9CH3JMHq5fGeemqUULAie9Q88LSgvAd8s8Z1RYl+hAS
         Z7AmXDTXxA5myOIzQHydvbRMj6QFiioOKQIHk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=tuumzqklLCQWflGrXS3Bcst/0WhhR79egWgv5q79yJY=;
        b=tUa2/2QcQQIv8BRfkHdp7owHTIaN8RYh36h1BH5ltUCO9ii01Q73LSidUYx13l9DtS
         56SHxFGdmypdLm+l9bMOpPA0fkpESKTM+uKYWRjGz3J0UvUIi+qOP+kyHlC4SmYHqTxA
         OeRSkM95NhiP+sCkpfzPSLeb99/quIN6geqSCUTmxvmJugmWtWm27a90GeqxRzaB1Jmj
         aCg1llvY4OEjC72lPftsgwjkhwKMRe5+I1K2xrl3kRL7cMFuiCuLU91lkFfYNF+io2qp
         epP5C5xj6db2OH4UHtmeRNYTxod1ADoehgxIjAx6HstLxfogLYXFSZ4uPt0LyKRltszi
         UfaQ==
X-Gm-Message-State: APjAAAUmTJxsG1rfM99imcjBYN4aHim0ZZgKbWWUrihqHAP6evFLeO4X
        A2d0Ir/nw+tVKTMWjjZoE4AUDjpoxXxMJA==
X-Google-Smtp-Source: APXvYqwcXP8+BpIzxvKndZ3V1U//OVYBUrf/2G5L+0o26Gu1lK67hcnHbdctGPksEEnddgYAxHOHcA==
X-Received: by 2002:a17:906:af54:: with SMTP id ly20mr3002345ejb.194.1562849401436;
        Thu, 11 Jul 2019 05:50:01 -0700 (PDT)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com. [209.85.128.46])
        by smtp.gmail.com with ESMTPSA id v6sm1135391eju.6.2019.07.11.05.49.59
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
        Thu, 11 Jul 2019 05:49:59 -0700 (PDT)
Received: by mail-wm1-f46.google.com with SMTP id f17so5580141wme.2
        for <linux-media@vger.kernel.org>; Thu, 11 Jul 2019 05:49:59 -0700 (PDT)
X-Received: by 2002:a1c:343:: with SMTP id 64mr4433119wmd.116.1562849399151;
 Thu, 11 Jul 2019 05:49:59 -0700 (PDT)
MIME-Version: 1.0
References: <530f28e9-f686-6222-c6cc-9a5207b151f7@xs4all.nl>
 <CAAFQd5BqUS201QP4KHzmnKi5r+3P_KAa=L9CF3=zyQKypNyVuw@mail.gmail.com> <1d07312a-bff0-9274-6aeb-2d85c3eee61a@xs4all.nl>
In-Reply-To: <1d07312a-bff0-9274-6aeb-2d85c3eee61a@xs4all.nl>
From:   Tomasz Figa <tfiga@chromium.org>
Date:   Thu, 11 Jul 2019 21:49:47 +0900
X-Gmail-Original-Message-ID: <CAAFQd5Cr5y6-T+UgW53V7se_bB6F7a9dw-Zfi0UF0EYJ6U7g9Q@mail.gmail.com>
Message-ID: <CAAFQd5Cr5y6-T+UgW53V7se_bB6F7a9dw-Zfi0UF0EYJ6U7g9Q@mail.gmail.com>
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

On Wed, Jul 10, 2019 at 6:14 PM Hans Verkuil <hverkuil@xs4all.nl> wrote:
>
> On 7/3/19 10:32 AM, Tomasz Figa wrote:
> > Hi Hans,
> >
> > On Fri, Jun 28, 2019 at 11:34 PM Hans Verkuil <hverkuil@xs4all.nl> wrote:
> >>
> >> Hi all,
> >>
> >> I hope I Cc-ed everyone with a stake in this issue.
> >>
> >> One recurring question is how a stateful encoder fills buffers and how a stateful
> >> decoder consumes buffers.
> >>
> >> The most generic case is that an encoder produces a bitstream and just fills each
> >> CAPTURE buffer to the brim before continuing with the next buffer.
> >>
> >> I don't think there are drivers that do this, I believe that all drivers just
> >> output a single compressed frame. For interlaced formats I understand it is either
> >> one compressed field per buffer, or two compressed fields per buffer (this is
> >> what I heard, I don't know if this is true).
> >>
> >> In any case, I don't think this is specified anywhere. Please correct me if I am
> >> wrong.
> >>
> >> The latest stateful codec spec is here:
> >>
> >> https://hverkuil.home.xs4all.nl/codec-api/uapi/v4l/dev-mem2mem.html
> >>
> >> Assuming what I described above is indeed the case, then I think this should
> >> be documented. I don't know enough if a flag is needed somewhere to describe
> >> the behavior for interlaced formats, or can we leave this open and have userspace
> >> detect this?
> >>
> >
> > From Chromium perspective, we don't have any use case for encoding
> > interlaced contents, so we'll be okay with whatever the interested
> > parties decide on. :)
> >
> >>
> >> For decoders it is more complicated. The stateful decoder spec is written with
> >> the assumption that userspace can just fill each OUTPUT buffer to the brim with
> >> the compressed bitstream. I.e., no need to split at frame or other boundaries.
> >>
> >> See section 4.5.1.7 in the spec.
> >>
> >> But I understand that various HW decoders *do* have limitations. I would really
> >> like to know about those, since that needs to be exposed to userspace somehow.
> >
> > AFAIK mtk-vcodec needs H.264 SPS and PPS to be split into their own
> > separate buffers. I believe it also needs 1 buffer to contain exactly
> > 1 frame and 1 frame to be fully contained inside 1 buffer.
> >
> > Venus also needed 1 buffer to contain exactly 1 frame and 1 frame to
> > be fully contained inside 1 buffer. It used to have some specific
> > requirements regarding SPS and PPS too, but I think that was fixed in
> > the firmware.
> >
> >>
> >> Specifically, the venus decoder needs to know the resolution of the coded video
> >> beforehand
> >
> > I don't think that's true for venus. It does parsing and can detect
> > the resolution.
> >
> > However that's probably the case for coda...
> >
> >> and it expects a single frame per buffer (how does that work for
> >> interlaced formats?).
> >>
> >> Such requirements mean that some userspace parsing is still required, so these
> >> decoders are not completely stateful.
> >>
> >> Can every codec author give information about their decoder/encoder?
> >>
> >> I'll start off with my virtual codec driver:
> >>
> >> vicodec: the decoder fully parses the bitstream. The encoder produces a single
> >> compressed frame per buffer. This driver doesn't yet support interlaced formats,
> >> but when that is added it will encode one field per buffer.
> >>
> >> Let's see what the results are.
> >
> > s5p-mfc:
> >  decoder: fully parses the bitstream,
> >  encoder: produces a single frame per buffer (haven't tested interlaced stuff)
> >
> > mtk-vcodec:
> >  decoder: expects separate buffers for SPS, PPS and full frames
> > (including some random stuff like SEIMessage),
>
> Do you mean that the SPS/PPS etc. should all be in separate buffers? I.e.
> you can't combine SPS and PPS in a single buffer?

Exactly that. It's obviously a firmware bug, but we haven't been able
to get that fixed.

Best regards,
Tomasz
