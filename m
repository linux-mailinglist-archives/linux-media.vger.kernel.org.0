Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A15DE4979F9
	for <lists+linux-media@lfdr.de>; Mon, 24 Jan 2022 09:06:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242008AbiAXIGU (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 24 Jan 2022 03:06:20 -0500
Received: from mail-ua1-f49.google.com ([209.85.222.49]:45047 "EHLO
        mail-ua1-f49.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233770AbiAXIGS (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 24 Jan 2022 03:06:18 -0500
Received: by mail-ua1-f49.google.com with SMTP id f24so29265117uab.11;
        Mon, 24 Jan 2022 00:06:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=f2tIXgru6KSjoHEY08c/9t4jD7pdITrEPHWFSQkXS0Y=;
        b=DTI/Yjds3ScGk3jA9/9Srj1zXWSb0csmQFPNnoC1m6nOCtDSAJg1dMjtiBnOxpyC1g
         IrWFedE2cveeqJi4Pqd3X6uBQqPHI40jIgrryIca3RIHT9+Lp7NbyRMllmGg1FKdZLEX
         MD7Su8AwOInwoX6Ia4mjdoW3ApNVmaqNEuFig9KNh70JFm/HKh1OVojkAMcjgTDz8zKC
         xCNBikcbNdDAXs2BmCte9jyMt7G/+j+p4aMffAIQo7J1lHOS1/zL3jVHkqVxt7udHpJ/
         yf9UijkK7/SSuaTGbo1mi3jesY8hpkuZm3d94R70UrjsXtWa5vcU85kL0gq5FDLXEdU+
         8SRw==
X-Gm-Message-State: AOAM5316kwbmIPDgbTjFJJ0ZAsuU2zAj8SpwMeY9ae/ew+QwGyYeqZMH
        bsXsVH5paOzmTvXsewhVSbCuRYeNWWUpcg==
X-Google-Smtp-Source: ABdhPJyL8SI4kAAwpJEm0n1bgdFMdSPN4sEGWxh9ZZE5dBD0EDoTBOtUR43do6zhYVRzMhYeJ6/vIQ==
X-Received: by 2002:a67:f8cc:: with SMTP id c12mr1069128vsp.63.1643011577441;
        Mon, 24 Jan 2022 00:06:17 -0800 (PST)
Received: from mail-ua1-f49.google.com (mail-ua1-f49.google.com. [209.85.222.49])
        by smtp.gmail.com with ESMTPSA id f68sm2820415vke.55.2022.01.24.00.06.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Jan 2022 00:06:17 -0800 (PST)
Received: by mail-ua1-f49.google.com with SMTP id 2so29376975uax.10;
        Mon, 24 Jan 2022 00:06:17 -0800 (PST)
X-Received: by 2002:a9f:3d89:: with SMTP id c9mr5323806uai.78.1643011576863;
 Mon, 24 Jan 2022 00:06:16 -0800 (PST)
MIME-Version: 1.0
References: <20220112174612.10773-1-biju.das.jz@bp.renesas.com>
 <20220112174612.10773-21-biju.das.jz@bp.renesas.com> <YeyuqbNfETGOxzfZ@pendragon.ideasonboard.com>
 <OS0PR01MB592252F975741BFF56CAFEFE865D9@OS0PR01MB5922.jpnprd01.prod.outlook.com>
In-Reply-To: <OS0PR01MB592252F975741BFF56CAFEFE865D9@OS0PR01MB5922.jpnprd01.prod.outlook.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 24 Jan 2022 09:06:05 +0100
X-Gmail-Original-Message-ID: <CAMuHMdX1-TNGmH0a6i6DKcsvk2VEeFyOvkyOaq0V5KDR-4kO1Q@mail.gmail.com>
Message-ID: <CAMuHMdX1-TNGmH0a6i6DKcsvk2VEeFyOvkyOaq0V5KDR-4kO1Q@mail.gmail.com>
Subject: Re: [RFC 20/28] media: vsp1: Add support for the RZ/G2L VSPD
To:     Biju Das <biju.das.jz@bp.renesas.com>
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Biju,

On Sun, Jan 23, 2022 at 4:20 PM Biju Das <biju.das.jz@bp.renesas.com> wrote:
> > On Wed, Jan 12, 2022 at 05:46:04PM +0000, Biju Das wrote:
> > > The RZ/G2L VSPD provides a single VSPD instance. it has the following
> > > sub modules MAU, CTU, RPF, DPR, LUT, BRS, WPF and LIF.
> > >
> > > It does not have version register, so added a new compatible string to
> > > match to get the version value. Also the reset is shared with DU
> > > module.
> >
> > Does it really lack the version register, or is it just not documented ?
> > It hasn't been documented on all R-Car variants, but has consistently been
> > present.
>
> No, it is not present on RZ/G2L. the read value of this register is 0x0.

Just to be sure: you did check that while the module clock is enabled and
the module reset is deasserted?

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
