Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DA74E26B7EB
	for <lists+linux-media@lfdr.de>; Wed, 16 Sep 2020 02:32:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726838AbgIPAby (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 15 Sep 2020 20:31:54 -0400
Received: from mail-oi1-f196.google.com ([209.85.167.196]:34833 "EHLO
        mail-oi1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726670AbgIONot (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 15 Sep 2020 09:44:49 -0400
Received: by mail-oi1-f196.google.com with SMTP id w16so3924781oia.2;
        Tue, 15 Sep 2020 06:44:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=nhx4zaRbvHv02wDkLtCiRzQ+T/cexy7Wy6YPEzIW6L4=;
        b=l8ocUXUSNwjluy8zzXAOmh7DlAc3Y8KxQQpc0EpewkGcHsYHv/RBLobUuMCTMDRv5n
         ZFdghksHYNyamFYX2siYsPb+4Op04iaKIvHcWoSuZnX5oxGUDVlIAoCBe8Ldalthr77z
         7fvxbdORFvmo30iCtr3nKqjC64SpyTHB1RmCyrH9y13bZyDXzrhoGeuXvI0mW5d6mcmL
         hX2AEq7Kl2rEac65beTg/kJcar/otm3CFGsgd+92KGArbyfF+chYZu9K8qP0hRP5ahDS
         KgdgVhfvf1R0FJSwPNc0Hy4cCNBnZKqjwm7YVwgqELJ7r08gwnrNRqwsqFqFbJ+NZ0Zo
         RBmA==
X-Gm-Message-State: AOAM532K3/GOSYZE5CZ5X16veR4txdht6FzQHVL9aQGvOJ5mPs3z8Vlf
        SLarfpJjQFDH6yGh6pDHYGlvSE81/P2ZHvrjE4jXHWGZ
X-Google-Smtp-Source: ABdhPJxjE7IZ1One9Nuag6nu0xEcQ8hWElbOe5QqICw2V/z+/yMb27HXjCabVPJXPjj9Z11F/OFVwDPyo408IPTG/6I=
X-Received: by 2002:aca:4441:: with SMTP id r62mr3178255oia.153.1600176911589;
 Tue, 15 Sep 2020 06:35:11 -0700 (PDT)
MIME-Version: 1.0
References: <alpine.DEB.2.21.2009151345001.31296@ramsan.of.borg> <EA89ED5D-E477-4464-B523-D729796CE0D0@getmailspring.com>
In-Reply-To: <EA89ED5D-E477-4464-B523-D729796CE0D0@getmailspring.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 15 Sep 2020 15:35:00 +0200
Message-ID: <CAMuHMdVfoQ-vW3VeO8vDVALNREBV1afaSnwnc0jnkoXmvw6xhQ@mail.gmail.com>
Subject: Re: [v10 3/4] media: vidtv: add a bridge driver
To:     "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>
Cc:     "mchehab+huawei@kernel.org" <mchehab+huawei@kernel.org>,
        "r.verdejo@samsung.com" <r.verdejo@samsung.com>,
        "nicolas@ndufresne.ca" <nicolas@ndufresne.ca>,
        "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
        "skhan@linuxfoundation.org" <skhan@linuxfoundation.org>,
        "linux-kernel-mentees@lists.linuxfoundation.org" 
        <linux-kernel-mentees@lists.linuxfoundation.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Daniel,

On Tue, Sep 15, 2020 at 3:26 PM Daniel W. S. Almeida
<dwlsalmeida@gmail.com> wrote:
> >> +    u32 nbytes = 0;  /* the number of bytes written by this function */
> >> +
> >> +    u64 nbytes_expected; /* the number of bytes we should have written */
> >> +    u64 nbytes_streamed; /* the number of bytes we actually wrote */
> >> +    u32 num_null_pkts; /* number of null packets to bridge the gap */
> >> +
> >> +    u64 elapsed_time_msecs = jiffies_to_usecs(m->timing.current_jiffies -
> >> +                                              m->timing.past_jiffies);
> >> +
> >> +    elapsed_time_msecs = min(elapsed_time_msecs,
> >> (u64)VIDTV_MAX_SLEEP_USECS / 1000);
> >> +    nbytes_expected = div64_u64(m->mux_rate_kbytes_sec * 1000, MSEC_PER_SEC);
> >
> > Seriously?!?
> >
> > You multiply by 1000 first, followed by a division by 1000 using an
> > expensive 64-by-64 division?
>
> This entire function is broken and needs a do-over :)
>
> > using an expensive 64-by-64 division?
>
> I am new to kernel development. I wasn't even aware that this was
> expensive, to be honest.

All divisions involving 64-bit data are expensive, especially on 32-bit
platforms.  That's why we have the helpers in <linux/math.h>.  Most
of them implement simplified variants, which are less expensive.

> >> +    if (nbytes_streamed < nbytes_expected) {
> >> +            /* can't write half a packet: roundup to a 188 multiple */
> >> +            nbytes_expected  = roundup(nbytes_expected - nbytes_streamed, TS_PACKET_LEN);
> >
> > drivers/media/test-drivers/vidtv/vidtv_mux.o: In function `vidtv_mux_tick':
> > vidtv_mux.c:(.text+0x788): undefined reference to `__udivdi3'
> >
> > This is a 64-by-32 division, hence it should use a helper from
> > <linux/math64.h>.
> >
> > However, I'm wondering if "nbytes_expected - nbytes_streamed" is
> > guaranteed to be a "small" number, hence a 32-by-32 division would be
> > sufficient?
>
> I think so.
>
> I will send a patch to address the things you pointed out in this email.

Thanks, looking forward to it!

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
