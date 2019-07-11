Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B974764FF4
	for <lists+linux-media@lfdr.de>; Thu, 11 Jul 2019 03:42:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727783AbfGKBmc (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 10 Jul 2019 21:42:32 -0400
Received: from mail-qk1-f193.google.com ([209.85.222.193]:33333 "EHLO
        mail-qk1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727463AbfGKBmc (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 10 Jul 2019 21:42:32 -0400
Received: by mail-qk1-f193.google.com with SMTP id r6so3575907qkc.0
        for <linux-media@vger.kernel.org>; Wed, 10 Jul 2019 18:42:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20150623.gappssmtp.com; s=20150623;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=B2LAjxGd8HI+KSXTaVJzkH4iRrHqHyZWusXklVHU0CM=;
        b=kDmNU8g6mLuFn5tuDBuj6g9gfg+44HZxXVGhTzPiX2O8NXo4m12Y19KiqTAVQX1Uc/
         JWshlTR11efZ1NaLED4650W+i0LQ95EXeeKiSmej+u+QCsi09HgQDO5uQvtctgQ3m8rh
         p2zjRmNI7jJ9EKCKfVFJmYr17tt+4NGxcPBoq/cp94m5MQH8+X8YLNiadseNAZpwMgry
         Jrn38VsdfPfaq/WRqcKx7od/1+iqKbyvLgdg4blVK0PGpf1tTW2JEaxwMBsoIj3huyvd
         0KBnb2pfTcpRWTmhx2zZj3eICv8N8/hbbn6PMOGOzEnIm5rG7hn2MzcEXAPAp8WSbCZe
         ffSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=B2LAjxGd8HI+KSXTaVJzkH4iRrHqHyZWusXklVHU0CM=;
        b=CpKVC3cmAcHOGocWcMwJQzM4x1LUR/EZ/kEgBI5h1gDiPpN07D4tukAUENqlEGlUkh
         WgKNh1bk83vIrJ4LDevRxCufn4GwgVaQ8upAxUiid6Y+36t646T55Z5lm2QE+n1VVyVI
         6dnOf6JCqYLDXajUFcjkSepeDposL/rGtFBDcUN2hvouV4N+Pjrh0v4h3oMqj0v2fC52
         PS827PyHUrGg35l8SMllObyHGKDH3S6GyekHlkVTFmZTLCE1kNhFdocrItnvqcndl1NA
         sQQ9POc4d47KwNMmK/rkvlnHnkmUyAoLoXYf7FmrS7Hc/DEAgXL8g0MhVn6vJhlmdrds
         5m2A==
X-Gm-Message-State: APjAAAV2X+p14a4+6Vc56JAqlX4axtxzDyq7dJ6VC6QGLLZC2gKsihj4
        Yny1Iqpj+B7pAzEDMUfypyk=
X-Google-Smtp-Source: APXvYqygORUDvg1HsrmsvLgRQJe5XJuRUcidtle9fwpH0oljflFq0Fw/Q26KZnWQkv/alWBwBJ6z7Q==
X-Received: by 2002:a37:4dc6:: with SMTP id a189mr1051579qkb.41.1562809350735;
        Wed, 10 Jul 2019 18:42:30 -0700 (PDT)
Received: from skullcanyon ([192.222.193.21])
        by smtp.gmail.com with ESMTPSA id o5sm1849821qkf.10.2019.07.10.18.42.29
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Wed, 10 Jul 2019 18:42:30 -0700 (PDT)
Message-ID: <93798563c38e4df811109f78616573c559355839.camel@ndufresne.ca>
Subject: Re: [RFC] Stateful codecs and requirements for compressed formats
From:   Nicolas Dufresne <nicolas@ndufresne.ca>
To:     Tomasz Figa <tfiga@chromium.org>, Hans Verkuil <hverkuil@xs4all.nl>
Cc:     Linux Media Mailing List <linux-media@vger.kernel.org>,
        Dave Stevenson <dave.stevenson@raspberrypi.org>,
        Boris Brezillon <boris.brezillon@collabora.com>,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Michael Tretter <m.tretter@pengutronix.de>,
        Sylwester Nawrocki <snawrocki@kernel.org>
Date:   Wed, 10 Jul 2019 21:42:28 -0400
In-Reply-To: <CAAFQd5BqUS201QP4KHzmnKi5r+3P_KAa=L9CF3=zyQKypNyVuw@mail.gmail.com>
References: <530f28e9-f686-6222-c6cc-9a5207b151f7@xs4all.nl>
         <CAAFQd5BqUS201QP4KHzmnKi5r+3P_KAa=L9CF3=zyQKypNyVuw@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.32.2 (3.32.2-1.fc30) 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Le mercredi 03 juillet 2019 à 17:32 +0900, Tomasz Figa a écrit :
> Hi Hans,
> 
> On Fri, Jun 28, 2019 at 11:34 PM Hans Verkuil <hverkuil@xs4all.nl> wrote:
> > Hi all,
> > 
> > I hope I Cc-ed everyone with a stake in this issue.
> > 
> > One recurring question is how a stateful encoder fills buffers and how a stateful
> > decoder consumes buffers.
> > 
> > The most generic case is that an encoder produces a bitstream and just fills each
> > CAPTURE buffer to the brim before continuing with the next buffer.
> > 
> > I don't think there are drivers that do this, I believe that all drivers just
> > output a single compressed frame. For interlaced formats I understand it is either
> > one compressed field per buffer, or two compressed fields per buffer (this is
> > what I heard, I don't know if this is true).
> > 
> > In any case, I don't think this is specified anywhere. Please correct me if I am
> > wrong.
> > 
> > The latest stateful codec spec is here:
> > 
> > https://hverkuil.home.xs4all.nl/codec-api/uapi/v4l/dev-mem2mem.html
> > 
> > Assuming what I described above is indeed the case, then I think this should
> > be documented. I don't know enough if a flag is needed somewhere to describe
> > the behavior for interlaced formats, or can we leave this open and have userspace
> > detect this?
> > 
> 
> From Chromium perspective, we don't have any use case for encoding
> interlaced contents, so we'll be okay with whatever the interested
> parties decide on. :)
> 
> > For decoders it is more complicated. The stateful decoder spec is written with
> > the assumption that userspace can just fill each OUTPUT buffer to the brim with
> > the compressed bitstream. I.e., no need to split at frame or other boundaries.
> > 
> > See section 4.5.1.7 in the spec.
> > 
> > But I understand that various HW decoders *do* have limitations. I would really
> > like to know about those, since that needs to be exposed to userspace somehow.
> 
> AFAIK mtk-vcodec needs H.264 SPS and PPS to be split into their own
> separate buffers. I believe it also needs 1 buffer to contain exactly
> 1 frame and 1 frame to be fully contained inside 1 buffer.
> 
> Venus also needed 1 buffer to contain exactly 1 frame and 1 frame to
> be fully contained inside 1 buffer. It used to have some specific
> requirements regarding SPS and PPS too, but I think that was fixed in
> the firmware.
> 
> > Specifically, the venus decoder needs to know the resolution of the coded video
> > beforehand
> 
> I don't think that's true for venus. It does parsing and can detect
> the resolution.
> 
> However that's probably the case for coda...
> 
> > and it expects a single frame per buffer (how does that work for
> > interlaced formats?).
> > 
> > Such requirements mean that some userspace parsing is still required, so these
> > decoders are not completely stateful.
> > 
> > Can every codec author give information about their decoder/encoder?
> > 
> > I'll start off with my virtual codec driver:
> > 
> > vicodec: the decoder fully parses the bitstream. The encoder produces a single
> > compressed frame per buffer. This driver doesn't yet support interlaced formats,
> > but when that is added it will encode one field per buffer.
> > 
> > Let's see what the results are.
> 
> s5p-mfc:
>  decoder: fully parses the bitstream,
>  encoder: produces a single frame per buffer (haven't tested interlaced stuff)
> 
> mtk-vcodec:
>  decoder: expects separate buffers for SPS, PPS and full frames
> (including some random stuff like SEIMessage),
>  encoder: produces a single frame per buffer (haven't tested interlaced stuff)

Interesting, do I read correctly that what the encoder does not produce
what the decoder needs ?

> 
> Best regards,
> Tomasz

