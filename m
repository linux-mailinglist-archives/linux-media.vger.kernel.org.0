Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A861A26BDA7
	for <lists+linux-media@lfdr.de>; Wed, 16 Sep 2020 09:06:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726189AbgIPHGT (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 16 Sep 2020 03:06:19 -0400
Received: from mail-ot1-f67.google.com ([209.85.210.67]:43663 "EHLO
        mail-ot1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726136AbgIPHGS (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 16 Sep 2020 03:06:18 -0400
Received: by mail-ot1-f67.google.com with SMTP id n61so5698203ota.10;
        Wed, 16 Sep 2020 00:06:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=LsQvtHeib1atrvvp2feLEjcTV2UF2/kU0aaYslA7vbY=;
        b=eaJPkXMOR066DPgOaI8d/avzSx2KWlD71RWh7AcVPCJXPPrkNXA35oc6/6CP0c9Amy
         UE3cV1SMYUQQ32I9IiljZjjzC52mPAbtbEZR7fODnKIJY24Z+3JidaCjkf0EYaZZFdVV
         MwScgRvP1s/8Q4a+OKmZYuVeF1WTgQwKfvN8pHbOSgWNIFX8n7FxyY6yHxLs+VeVK/e/
         BJYqMx/3dIC4IvmouxRd0lZ/GYVgrSIB3ATe4thnK3Yxl7SY4wH1fWfDBcetv+GoAwVn
         FC0DydjU8U/Wbzc8UWJAimzi26NRBlhcyMbR6OwSdwGhMSHimyc9dD+bvLZE6GRRm4C3
         DyJg==
X-Gm-Message-State: AOAM530FSTGuQ8VY0SkdA0Hs+2v+d+SPN0oESD+Q6xGQvWsqVehi5UdA
        MdtwVTt8b8xOIbH49PAGJ+BCKx2A09XPasSo6QQ6VtunMm0=
X-Google-Smtp-Source: ABdhPJxKmwKiMQprL5cUYhYw8TtCpuH52UjOz5tY3oy5rjo3bFWSZ4m127dVecTxjDzhROsJWJLoZIyaiNxs2MyUSSk=
X-Received: by 2002:a9d:3b76:: with SMTP id z109mr15872454otb.250.1600239977269;
 Wed, 16 Sep 2020 00:06:17 -0700 (PDT)
MIME-Version: 1.0
References: <20200915180509.2661572-1-dwlsalmeida@gmail.com> <20200916084036.09e8f3c8@coco.lan>
In-Reply-To: <20200916084036.09e8f3c8@coco.lan>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 16 Sep 2020 09:06:06 +0200
Message-ID: <CAMuHMdXjA7q-v-mYY9DChC0XQbv9vfW6c3Vfn07-H-FgBr+izA@mail.gmail.com>
Subject: Re: [PATCH] media: vidtv: fix build on 32bit architectures
To:     Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>,
        r.verdejo@samsung.com,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        nicolas@ndufresne.ca, Shuah Khan <skhan@linuxfoundation.org>,
        linux-kernel-mentees@lists.linuxfoundation.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Randy Dunlap <rdunlap@infradead.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Mauro, Daniel,

On Wed, Sep 16, 2020 at 8:40 AM Mauro Carvalho Chehab
<mchehab@kernel.org> wrote:
> Em Tue, 15 Sep 2020 15:05:09 -0300
> "Daniel W. S. Almeida" <dwlsalmeida@gmail.com> escreveu:
> > From: Daniel W. S. Almeida <dwlsalmeida@gmail.com>
> >
> > Fix the following error for builds on 32bit architectures:
> >
> > ERROR: modpost: "__udivdi3"
> > [drivers/media/test-drivers/vidtv/dvb-vidtv-bridge.ko] undefined!
> >
> > Which is due to 64bit divisions that did not go through the helpers
> > in linux/math64.h
> >
> > As vidtv_mux_check_mux_rate was not operational in its current form,
> > drop the entire function  while it is not fixed properly.
> >
> > For now, call vidtv_mux_pad_with_nulls with a constant number of packets
> > to avoid warnings due to unused functions when building this driver.
> >
> > Fixes: f90cf6079bf67988 ("media: vidtv: add a bridge driver")
> > Signed-off-by: Daniel W. S. Almeida <dwlsalmeida@gmail.com>

Acked-by: Geert Uytterhoeven <geert@linux-m68k.org> # build-tested

> > --- a/drivers/media/test-drivers/vidtv/vidtv_s302m.c
> > +++ b/drivers/media/test-drivers/vidtv/vidtv_s302m.c
> > @@ -285,12 +285,12 @@ static void vidtv_s302m_compute_pts(struct vidtv_encoder *e)
> >  {
> >       u64 count = e->sample_count;
> >       struct vidtv_access_unit *au = e->access_units;
> > +     u32 duration = CLOCK_UNIT_90KHZ / e->sampling_rate_hz;
> >
> >       while (au) {
> >               count += au->num_samples;
> >
> > -             au->pts = count *
> > -                       CLOCK_UNIT_90KHZ / e->sampling_rate_hz;
> > +             au->pts = count * duration;
>
> That doesn't seem to be the right thing to do here.
>
> Assuming that sampling rate is 48 kHz, you'll
> have duration = 1.875, which would be rounded to 1.
>
> In other words, the above is identical to:
>
>         au->pts = count
>
> Now, I don't know from where that CLOCK_UNIT_90KHZ came from.
>
> If such constant is not needed anymore, just drop it.
>
> If, on the other hand, this is required by the specs, then
> you may need to do a 64 bits division, e. g. using
> div64_u64() or do_div().

As vidtv_encoder.sampling_rate_hz is u32, there's fortunately no need
to use div64_u64() (64-by-64), so div_u64() (64-by-32) is fine.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
