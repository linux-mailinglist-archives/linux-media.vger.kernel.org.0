Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9891D6343F
	for <lists+linux-media@lfdr.de>; Tue,  9 Jul 2019 12:28:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726091AbfGIK2d (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 9 Jul 2019 06:28:33 -0400
Received: from mail-ot1-f66.google.com ([209.85.210.66]:36931 "EHLO
        mail-ot1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726018AbfGIK2c (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 9 Jul 2019 06:28:32 -0400
Received: by mail-ot1-f66.google.com with SMTP id s20so19412177otp.4;
        Tue, 09 Jul 2019 03:28:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=U4Ze+EBg1pxr4RvmQIS+6KLPYm2gsPa0r7l9E0VG4tg=;
        b=CXjMT5A3uOYjrn6TRV3OUi0EcW2q07yZkkMP+emhK0vam+BGdEOQhOeng0nNZaIt/s
         +QsmLSsdrQED0xNzZtvWUJQNqlBkw2lXr5LngPoEV52Rf63Pzke8T9H4vDyBbTwE1Mpt
         c7Ya8aoSk+04jyyYk7nfCNpAJE/+fSGPlfyBeIw6aLL1KzfBoSd/6QF1z9JBVgGv9iww
         eVBQzskHfWWPkMvzb4wZ2IScWIb19KzZTuBxvC66GUjL5+FLX94Zs6J/rz/9hMtxDoOC
         7Vb31+bVbJC0WLSAm9hCitfhtVLGdoXDtrDytFkc7kndxHUqGi+jRH5wg2XaAO4b4PqH
         20/Q==
X-Gm-Message-State: APjAAAWoQ3QdsfnQOC+r5TZoVJGv8MmvEchYAmlTuTidjQT2Z0ezLgLD
        qXKskw+Tnj1RUHSY/Tgn7nEFLddlucpOk2DEP10=
X-Google-Smtp-Source: APXvYqxFZQWNdaYg5Jvp6VDTI6ormIW150FFZQxe67AdnnbwRic7ntvpUSmHWfo8ekrM8Xcd8+9l/Jcljq9rAAt32Wg=
X-Received: by 2002:a9d:7a90:: with SMTP id l16mr6703735otn.297.1562668112050;
 Tue, 09 Jul 2019 03:28:32 -0700 (PDT)
MIME-Version: 1.0
References: <20190709095952.5666-1-geert+renesas@glider.be>
 <17f28f31-73e1-5170-a0d5-31ad9826defa@ideasonboard.com> <CAMuHMdU-iTH0AjCx9TxJn+aWUxF_7D5zqrKrwvC_FPybKFBYMA@mail.gmail.com>
 <bee131c3-e07e-6d6f-9315-774f638da53f@ideasonboard.com>
In-Reply-To: <bee131c3-e07e-6d6f-9315-774f638da53f@ideasonboard.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 9 Jul 2019 12:28:21 +0200
Message-ID: <CAMuHMdWQDriyMkkOHNO=neNsH4Q1c2ALRg4aj1+vyez16a0Ubw@mail.gmail.com>
Subject: Re: [PATCH] media: fdp1: Reduce FCP not found message level to debug
To:     Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Cc:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Kieran,

On Tue, Jul 9, 2019 at 12:18 PM Kieran Bingham
<kieran.bingham+renesas@ideasonboard.com> wrote:
> On 09/07/2019 11:13, Geert Uytterhoeven wrote:
> > On Tue, Jul 9, 2019 at 12:07 PM Kieran Bingham
> > <kieran.bingham+renesas@ideasonboard.com> wrote:
> >> On 09/07/2019 10:59, Geert Uytterhoeven wrote:
> >>> When support for the IPMMU is not enabled, the FDP driver may be
> >>> probe-deferred multiple times, causing several messages to be printed
> >>> like:
> >>>
> >>>     rcar_fdp1 fe940000.fdp1: FCP not found (-517)
> >>>     rcar_fdp1 fe944000.fdp1: FCP not found (-517)
> >>>
> >>> Fix this by reducing the message level to debug level, as is done in the
> >>> VSP1 driver.
> >>
> >> Does the lack of IPMMU prevent the FDP1 being loaded entirely?
> >
> > No it doesn't.
> > If CONFIG_IPMMU_VMSA=n,
> >
> >     rcar_fdp1 fe940000.fdp1: FCP not found (-517)
> >     rcar_fdp1 fe944000.fdp1: FCP not found (-517)
> >     rcar_fdp1 fe940000.fdp1: FCP not found (-517)
> >     rcar_fdp1 fe944000.fdp1: FCP not found (-517)
> >     rcar_fdp1 fe940000.fdp1: FCP not found (-517)
> >     rcar_fdp1 fe944000.fdp1: FCP not found (-517)
> >     rcar_fdp1 fe940000.fdp1: Device registered as /dev/video8
> >     rcar_fdp1 fe944000.fdp1: Device registered as /dev/video9
> >
> > So the driver succeeds, eventually.
> >
> > If CONFIG_IPMMU_VMSA=y, it succeeds sooner:
> >
> >     rcar_fdp1 fe940000.fdp1: Device registered as /dev/video0
> >     rcar_fdp1 fe944000.fdp1: Device registered as /dev/video1
> >
> > Always be prepared to handle -EPROBE_DEFER.
>
> On the basis that the driver is not prevented from loading, then the
> message does indeed become more of a debug print.
>
> I wonder if it's better to print something different in the event of
> EPROBE_DEFER vs another actual error preventing the loading of the
> driver, but in either case if someone hits an issue they're likely to
> start adding/enabling debug.

That's why some driver suppress printing errors for -EPROBE_DEFER.

> So, with that and a precedent for this change in VSP1, I'm happy here.
>
> Reviewed-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>

Thanks!

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
