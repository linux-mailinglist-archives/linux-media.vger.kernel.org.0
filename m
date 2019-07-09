Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 605A063407
	for <lists+linux-media@lfdr.de>; Tue,  9 Jul 2019 12:13:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726318AbfGIKN0 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 9 Jul 2019 06:13:26 -0400
Received: from mail-ot1-f65.google.com ([209.85.210.65]:44506 "EHLO
        mail-ot1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725989AbfGIKN0 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 9 Jul 2019 06:13:26 -0400
Received: by mail-ot1-f65.google.com with SMTP id b7so19323167otl.11;
        Tue, 09 Jul 2019 03:13:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Dj8MdtvBxthGJG0Xw/jyL7nzg3ItUVTqoHCviioSchw=;
        b=pIT/OdmsKg1PYqB42lZ5MOatyKIWIukrXiSZ0ak8zZKo+RNSeygWS1WQSF46XuVMQo
         Y3UB/niR5/fRmJYIVqQib5lEPHYreVI6IV+GnvNM+ClO8fSEeAEVqNDcs0xPBbpgPKV5
         DvTloSRXAm9A43Wvosd0rMCDXsxaAntW2mG1KnhyXOM5Wgz3mHS1NkHHu4aNGnhtmlW4
         A5nPl/up8CDQJUB40XshZjfV6+hBRfWrYmmTxTOLxjJTzQX/9Zny69p5um92pRTjxizp
         9J/GPv8xrhit8BmUQWKk1WZ8JXUnBIMdGP4YNcwyS2r1F0WU2DbT6JStbiXGdZHGXHAG
         8ZQA==
X-Gm-Message-State: APjAAAX7RiOizUtoGlVdOQrhdcuvct+wCMRet0OXY5/M19BfcJKb4vFo
        Ot2e7bO20QMF30E0F6G1LNGwysJmgxNGaDI0+bSx7PM/
X-Google-Smtp-Source: APXvYqyibYkOyXVHBkcPMBUi0+AvlNe+aTjLNFZKzHp3pQkObQoZvqV/GREvLL6oM3C9awHoNOv2XjSVBjZ5YJvYo0M=
X-Received: by 2002:a9d:7a90:: with SMTP id l16mr6656198otn.297.1562667205586;
 Tue, 09 Jul 2019 03:13:25 -0700 (PDT)
MIME-Version: 1.0
References: <20190709095952.5666-1-geert+renesas@glider.be> <17f28f31-73e1-5170-a0d5-31ad9826defa@ideasonboard.com>
In-Reply-To: <17f28f31-73e1-5170-a0d5-31ad9826defa@ideasonboard.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 9 Jul 2019 12:13:14 +0200
Message-ID: <CAMuHMdU-iTH0AjCx9TxJn+aWUxF_7D5zqrKrwvC_FPybKFBYMA@mail.gmail.com>
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

On Tue, Jul 9, 2019 at 12:07 PM Kieran Bingham
<kieran.bingham+renesas@ideasonboard.com> wrote:
> On 09/07/2019 10:59, Geert Uytterhoeven wrote:
> > When support for the IPMMU is not enabled, the FDP driver may be
> > probe-deferred multiple times, causing several messages to be printed
> > like:
> >
> >     rcar_fdp1 fe940000.fdp1: FCP not found (-517)
> >     rcar_fdp1 fe944000.fdp1: FCP not found (-517)
> >
> > Fix this by reducing the message level to debug level, as is done in the
> > VSP1 driver.
>
> Does the lack of IPMMU prevent the FDP1 being loaded entirely?

No it doesn't.
If CONFIG_IPMMU_VMSA=n,

    rcar_fdp1 fe940000.fdp1: FCP not found (-517)
    rcar_fdp1 fe944000.fdp1: FCP not found (-517)
    rcar_fdp1 fe940000.fdp1: FCP not found (-517)
    rcar_fdp1 fe944000.fdp1: FCP not found (-517)
    rcar_fdp1 fe940000.fdp1: FCP not found (-517)
    rcar_fdp1 fe944000.fdp1: FCP not found (-517)
    rcar_fdp1 fe940000.fdp1: Device registered as /dev/video8
    rcar_fdp1 fe944000.fdp1: Device registered as /dev/video9

So the driver succeeds, eventually.

If CONFIG_IPMMU_VMSA=y, it succeeds sooner:

    rcar_fdp1 fe940000.fdp1: Device registered as /dev/video0
    rcar_fdp1 fe944000.fdp1: Device registered as /dev/video1

Always be prepared to handle -EPROBE_DEFER.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
