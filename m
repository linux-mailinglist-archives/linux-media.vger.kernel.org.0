Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4479B26BDAD
	for <lists+linux-media@lfdr.de>; Wed, 16 Sep 2020 09:09:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726342AbgIPHJo (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 16 Sep 2020 03:09:44 -0400
Received: from mail-ot1-f65.google.com ([209.85.210.65]:38257 "EHLO
        mail-ot1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726149AbgIPHJm (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 16 Sep 2020 03:09:42 -0400
Received: by mail-ot1-f65.google.com with SMTP id y5so5751974otg.5;
        Wed, 16 Sep 2020 00:09:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=D3ZsO49KVaYq2py9m5cc26md3Laz3QAxI2qPOKnva08=;
        b=eCJua0Tojw2609khHECJCZ1pzQEtDH6Im1XRS27q9g2HNAwuLAeox8zG1gJ00fRxax
         GOVGQDf35O6zzMmQl7LOqiZ3xxev7J8HCUMoNrf3KW9yHJhpZehZk8z4QOU+qFPU63w+
         qMrcvh/gJ5SBNed4dQtOJLPmfQMIsdZikCXm99d9iz+wE+xDewbEDJL+mjUGGolT1Cxn
         aGCwEyJXeV9Yiuo5sAOqPSONDbGflZld5tpceu34ubTsTvF8BARPQATZMVOEm1igfcpP
         0YNFihMUCtvyybIoSaRVSZRr10V0AJNLJbgNM6LAMNwb1KLyKs5a5pQAN/z+Cwfo/K2V
         DmJA==
X-Gm-Message-State: AOAM531z75yEmTnk+uvbBKtq1YXbAf9RNo59FyHkmZENyVSYiYbxMF/2
        LVpWElfLeCv9D78+IObYaahuby/kSfaPRRdCha4=
X-Google-Smtp-Source: ABdhPJx0hz9CuVlFI9T56ch9l9oYJEaHv/X8jtRyojKjzekwVZzufpCDXBQJRhrHrtZVSJAxOxgUI9K81Ggjs6zUBD8=
X-Received: by 2002:a9d:3b76:: with SMTP id z109mr15880170otb.250.1600240181722;
 Wed, 16 Sep 2020 00:09:41 -0700 (PDT)
MIME-Version: 1.0
References: <alpine.DEB.2.21.2009151345001.31296@ramsan.of.borg>
 <EA89ED5D-E477-4464-B523-D729796CE0D0@getmailspring.com> <CAMuHMdVfoQ-vW3VeO8vDVALNREBV1afaSnwnc0jnkoXmvw6xhQ@mail.gmail.com>
 <20200916090111.7dcfa0fe@coco.lan>
In-Reply-To: <20200916090111.7dcfa0fe@coco.lan>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 16 Sep 2020 09:09:30 +0200
Message-ID: <CAMuHMdW8kzcugxoDosT_50mfAbaHks72_CLWs5yJH5UQ6rz_Zw@mail.gmail.com>
Subject: Re: [v10 3/4] media: vidtv: add a bridge driver
To:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>,
        "r.verdejo@samsung.com" <r.verdejo@samsung.com>,
        "nicolas@ndufresne.ca" <nicolas@ndufresne.ca>,
        "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
        "skhan@linuxfoundation.org" <skhan@linuxfoundation.org>,
        "linux-kernel-mentees@lists.linuxfoundation.org
        <linux-kernel-mentees@lists.linuxfoundation.org>,
        linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Mauro,

On Wed, Sep 16, 2020 at 9:01 AM Mauro Carvalho Chehab
<mchehab+huawei@kernel.org> wrote:
> Em Tue, 15 Sep 2020 15:35:00 +0200
> Geert Uytterhoeven <geert@linux-m68k.org> escreveu:
> > On Tue, Sep 15, 2020 at 3:26 PM Daniel W. S. Almeida
> > <dwlsalmeida@gmail.com> wrote:
> > > >> +    u32 nbytes = 0;  /* the number of bytes written by this function */
> > > >> +
> > > >> +    u64 nbytes_expected; /* the number of bytes we should have written */
> > > >> +    u64 nbytes_streamed; /* the number of bytes we actually wrote */
> > > >> +    u32 num_null_pkts; /* number of null packets to bridge the gap */
> > > >> +
> > > >> +    u64 elapsed_time_msecs = jiffies_to_usecs(m->timing.current_jiffies -
> > > >> +                                              m->timing.past_jiffies);
> > > >> +
> > > >> +    elapsed_time_msecs = min(elapsed_time_msecs,
> > > >> (u64)VIDTV_MAX_SLEEP_USECS / 1000);
> > > >> +    nbytes_expected = div64_u64(m->mux_rate_kbytes_sec * 1000, MSEC_PER_SEC);
> > > >
> > > > Seriously?!?
> > > >
> > > > You multiply by 1000 first, followed by a division by 1000 using an
> > > > expensive 64-by-64 division?
> > >
> > > This entire function is broken and needs a do-over :)
> > >
> > > > using an expensive 64-by-64 division?
> > >
> > > I am new to kernel development. I wasn't even aware that this was
> > > expensive, to be honest.
> >
> > All divisions involving 64-bit data are expensive, especially on 32-bit
> > platforms.  That's why we have the helpers in <linux/math.h>.  Most
> > of them implement simplified variants, which are less expensive.
>
> I agree that 64-bit math is something that should be used with some
> care. However, it is almost unavoidable do to 64-bit divisions for
> digital TV.

Sure. If 64-bit math is needed, it should be used.

The macros (and the link failure on 32-bit) exist to (a) make sure
people think twice before using 64-math, and (b) let people pick a
less-expensive variant if that is sufficient.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
