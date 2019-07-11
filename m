Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BB3BE65746
	for <lists+linux-media@lfdr.de>; Thu, 11 Jul 2019 14:47:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728375AbfGKMrb (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 11 Jul 2019 08:47:31 -0400
Received: from mail-ed1-f65.google.com ([209.85.208.65]:35537 "EHLO
        mail-ed1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726016AbfGKMra (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 11 Jul 2019 08:47:30 -0400
Received: by mail-ed1-f65.google.com with SMTP id w20so5660315edd.2
        for <linux-media@vger.kernel.org>; Thu, 11 Jul 2019 05:47:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=4KfDrkKLRGDotYS7HQrz5CKtC7m6jfexz8XUswYp77k=;
        b=UeR/znmRQBriIbtL09O9uw/WAg+XP9cPV3qCrOEgk4NKLX9Glx31uWDnxcccGWMFVK
         04fkG/R+lYs4Kh2UVbGeJBSfawMmxqfcur0tSN+Jew9hpvASSHzxutKDoOMo5G+gnycY
         ovr8+UnvKt6unrjMj00yS5fzuU2ra/RfG9dfk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=4KfDrkKLRGDotYS7HQrz5CKtC7m6jfexz8XUswYp77k=;
        b=IusShZvtJIsIZeF1idIx9MeZ6F8geUE73E7MGTTkEIe0sEC8cc4S2mBDB0ALhWKClc
         gi4FO9Og2AotvtMIaTtzt6EiV4q7fjfsLVJmEOw85LCKPOmTPkxMCMopXiQOtYqj9UNf
         OSbBf+9n1UmLiAm09f09oRVfOlrILg1mnrXFI7Pb5RgiEFXfPHzms6A2lyj3urKqhvvF
         ZrgwdmF9AKIklf3+94wcreTVsRBuFNShdjdaBqZxxSt2PrSxVIt07isl1jH+XCcpWrVH
         3Q1N+IWmIOnKdSnDly6IGqK1xLCw7indQNxd74BpcL7c8eq12uJxJRpEZSZDZHxu4WOR
         g1lQ==
X-Gm-Message-State: APjAAAUxt/RhM61doCRwyiZQJhZOm7PLayDlQASDRWlWA96zyxAfXbnC
        N4CcvGAwEt7OsSjimvPtIOIB7ETjSjC7nA==
X-Google-Smtp-Source: APXvYqwBgh06Asgxgy44IrJ6klZZUwpQ6ysClUHKItSpHUCHbT0Y5zqsmHdddu7/dycWRrh2W56PpA==
X-Received: by 2002:a50:a5ec:: with SMTP id b41mr3191699edc.52.1562849248310;
        Thu, 11 Jul 2019 05:47:28 -0700 (PDT)
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com. [209.85.221.43])
        by smtp.gmail.com with ESMTPSA id j16sm1135196ejq.66.2019.07.11.05.47.27
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
        Thu, 11 Jul 2019 05:47:27 -0700 (PDT)
Received: by mail-wr1-f43.google.com with SMTP id y4so6185035wrm.2
        for <linux-media@vger.kernel.org>; Thu, 11 Jul 2019 05:47:27 -0700 (PDT)
X-Received: by 2002:adf:e541:: with SMTP id z1mr4852058wrm.48.1562849246701;
 Thu, 11 Jul 2019 05:47:26 -0700 (PDT)
MIME-Version: 1.0
References: <530f28e9-f686-6222-c6cc-9a5207b151f7@xs4all.nl>
 <CAAFQd5BqUS201QP4KHzmnKi5r+3P_KAa=L9CF3=zyQKypNyVuw@mail.gmail.com> <93798563c38e4df811109f78616573c559355839.camel@ndufresne.ca>
In-Reply-To: <93798563c38e4df811109f78616573c559355839.camel@ndufresne.ca>
From:   Tomasz Figa <tfiga@chromium.org>
Date:   Thu, 11 Jul 2019 21:47:14 +0900
X-Gmail-Original-Message-ID: <CAAFQd5A3M9hRgqOOLepwxHsxjnkhaJ6yPo62masUu6FYQzufEw@mail.gmail.com>
Message-ID: <CAAFQd5A3M9hRgqOOLepwxHsxjnkhaJ6yPo62masUu6FYQzufEw@mail.gmail.com>
Subject: Re: [RFC] Stateful codecs and requirements for compressed formats
To:     Nicolas Dufresne <nicolas@ndufresne.ca>
Cc:     Hans Verkuil <hverkuil@xs4all.nl>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Dave Stevenson <dave.stevenson@raspberrypi.org>,
        Boris Brezillon <boris.brezillon@collabora.com>,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Michael Tretter <m.tretter@pengutronix.de>,
        Sylwester Nawrocki <snawrocki@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, Jul 11, 2019 at 10:42 AM Nicolas Dufresne <nicolas@ndufresne.ca> wr=
ote:
>
> Le mercredi 03 juillet 2019 =C3=A0 17:32 +0900, Tomasz Figa a =C3=A9crit =
:
> > Hi Hans,
> >
> > On Fri, Jun 28, 2019 at 11:34 PM Hans Verkuil <hverkuil@xs4all.nl> wrot=
e:
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
> > >
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
> >
> > From Chromium perspective, we don't have any use case for encoding
> > interlaced contents, so we'll be okay with whatever the interested
> > parties decide on. :)
> >
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
> > > Specifically, the venus decoder needs to know the resolution of the c=
oded video
> > > beforehand
> >
> > I don't think that's true for venus. It does parsing and can detect
> > the resolution.
> >
> > However that's probably the case for coda...
> >
> > > and it expects a single frame per buffer (how does that work for
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
> > >
> > > Let's see what the results are.
> >
> > s5p-mfc:
> >  decoder: fully parses the bitstream,
> >  encoder: produces a single frame per buffer (haven't tested interlaced=
 stuff)
> >
> > mtk-vcodec:
> >  decoder: expects separate buffers for SPS, PPS and full frames
> > (including some random stuff like SEIMessage),
> >  encoder: produces a single frame per buffer (haven't tested interlaced=
 stuff)
>
> Interesting, do I read correctly that what the encoder does not produce
> what the decoder needs ?

Apparently. :)

But given all the diversity that was mentioned in this thread, one
can't expect to be able to feed a decoder with the exact buffers from
an encoder, although first of all I'm not sure why one would even want
to do that.

Best regards,
Tomasz
