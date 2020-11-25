Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D97852C418C
	for <lists+linux-media@lfdr.de>; Wed, 25 Nov 2020 14:59:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729746AbgKYN6r convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-media@lfdr.de>); Wed, 25 Nov 2020 08:58:47 -0500
Received: from mail-oi1-f196.google.com ([209.85.167.196]:34976 "EHLO
        mail-oi1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729650AbgKYN6q (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 25 Nov 2020 08:58:46 -0500
Received: by mail-oi1-f196.google.com with SMTP id c80so2928304oib.2;
        Wed, 25 Nov 2020 05:58:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=6exeu92EkD0QJPi3iK3VVV56ZBh8eo4xmepog4VDKQw=;
        b=N1/38pg8QLXnyp3NBiTycYcb4HRwiEsduU/0G/qSIdSVb41nD4kQJSh2SRyWhR9fht
         nj6BPIdkP7oTS286MGW0iOygjzfE2jQORwRnsQG9R8SjWADzkmdsrIme7AGRlAyTNm2h
         FjX8YE3T4555zwKbtEVUUEj/znLvqgiEh0coBzyPTLKNDVcKcOrDvm7nq67zRWI0kDOh
         8z9y1HP/qnQYDFTzYEhPC25w6surcyv7ZQhS1BMaSWjB0AJWV/PdXx3FCPEZJ2Tq8Iww
         PfRcPJo1HbdPPAxRrhseRLG0WrvdrCoiAFoyYzVrHX7B1GjMD0STb8avTBPzuun0/392
         zFlg==
X-Gm-Message-State: AOAM531MSH6Jsu76L6PZC2QMmG3QlW0Xyf/bIjuNrPOL+m4I4nZ1YkCr
        uAGTDXZQrU9aGwSZcGvQovNOtm6w+VtN5JiCen2Oec1k
X-Google-Smtp-Source: ABdhPJzZEEuHAeeZH2UbBVCbAhbemcFvwa2oCnGLJ2Rb5NvbgzWrNIT4WsVJD0CEK30MdXuefAjj7Q8jhE5zyDhAB00=
X-Received: by 2002:aca:1c0f:: with SMTP id c15mr2346583oic.54.1606312725737;
 Wed, 25 Nov 2020 05:58:45 -0800 (PST)
MIME-Version: 1.0
References: <20201122163637.3590465-1-niklas.soderlund+renesas@ragnatech.se>
 <7ec9c2ba-ea9c-2ce5-8ecf-6239448c711f@ideasonboard.com> <20201125133939.GC2162566@oden.dyn.berto.se>
In-Reply-To: <20201125133939.GC2162566@oden.dyn.berto.se>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 25 Nov 2020 14:58:34 +0100
Message-ID: <CAMuHMdXLMLUw9E4AwhhDpfDrWAc0p1wYEPh5VJuBkLsgx1y2AA@mail.gmail.com>
Subject: Re: [PATCH 0/3] adv748x: Add support for s2ram
To:     =?UTF-8?Q?Niklas_S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Cc:     Linux Media Mailing List <linux-media@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Niklas, Kieran,

On Wed, Nov 25, 2020 at 2:40 PM Niklas Söderlund
<niklas.soderlund+renesas@ragnatech.se> wrote:
> On 2020-11-25 13:09:39 +0000, Kieran Bingham wrote:
> > On 22/11/2020 16:36, Niklas Söderlund wrote:
> > > This series enables usage of the ADV748x after the system have been
> > > suspended to ram. During s2ram the ADV748x may be powered down and thus
> > > lose its configuration from probe time. The configuration contains
> > > among other things the i2c slave address mappings for the different
> > > blocks inside the ADV748x. If this is lost the hardware listens to the
> > > "wrong" i2c addresses and becomes inaccessible.
> > >
> > > Example trying to read the analog standard before and after s2ram with
> > > and without this this series.
> >
> > Should we be considering runtime_pm for this instead?
>
> I don't think so, why do you think we should?
>
> I opted for this solution because we need fine grain control of when the
> registers are restored when resuming from s2ram. If they are not
> restored before (in my case) the VIN driver is resumed and it was
> streaming at suspend time it will fail as the i2c address map is wrong
> at this time. For this reason the registers are restored in the early
> resume callback.
>
> Second I'm unsure how we could properly test such a solution as I don't
> think we can powerdown the ADV7482 without also s2ram the whole SoC on
> our test platforms as it's power is not controllable by the SoC. For
> example it's not powered down in s2idel.

Also, there is no need to reset the ADV7482 every time it is
runtime-resumed.  In fact such needless reset may impact performance, as
runtime-resume happens much more frequently than system resume during
the system's lifetime.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
