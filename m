Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 624F084A24
	for <lists+linux-media@lfdr.de>; Wed,  7 Aug 2019 12:54:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726860AbfHGKxv (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 7 Aug 2019 06:53:51 -0400
Received: from mail-ot1-f66.google.com ([209.85.210.66]:42817 "EHLO
        mail-ot1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726563AbfHGKxu (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 7 Aug 2019 06:53:50 -0400
Received: by mail-ot1-f66.google.com with SMTP id l15so102484501otn.9
        for <linux-media@vger.kernel.org>; Wed, 07 Aug 2019 03:53:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ptBIJaPqjzzFbOlt+wTcfpDxtdbCBPstiqPBsk+q0Dw=;
        b=FFQWm2sjnSXDLWMgX4eKRtUxZV6NKPL4x/Okmj9rd1jcS9TnacqDpdOsEAwPcyNwii
         KpPlP33/oZFe0qp8KLOJ0JLlvpa/FzyZLjsVpmll1DXW2mL58X4qpCjoJ5QqkEVTq7Xt
         gVPgFn0eRADrJitlW563/f2lq3KN7nakD3PnO9R0zcjfYPSpJ5uHdqCWFGPTqcwY6jME
         6RI27XmfPlRWT20phkiD+jXkk0uqbacnpHJo7kNyVIuS1y+MpINk80lD5ozXfK5+W/Eq
         7NCT2ilpT1bufPdLzcR0pPGc08KmAwSBwH2NzoszaKvupyQtoVhIS+0irddXM3CLB347
         eh0g==
X-Gm-Message-State: APjAAAUz0mR53jT+Yj3Orfs79KWYdIN6kjvM4kLdWfFr1GhxTg483TKE
        yXrSnUxVWLLNJKEWiWfGn9jjYNwfHVwAOi0EPUs=
X-Google-Smtp-Source: APXvYqxENaVSLf6mIRSAbWs3wPBxQBdUazgb7vv5wtIKPb7B1TD9Y5XW/LrjEc1SvSpIGClJu+win4/a8ZViu2UgAoc=
X-Received: by 2002:a05:6830:210f:: with SMTP id i15mr7688249otc.250.1565175230079;
 Wed, 07 Aug 2019 03:53:50 -0700 (PDT)
MIME-Version: 1.0
References: <20190731134121.18473-1-geert+renesas@glider.be>
 <95aa9f00-a01e-09ab-3cc3-5f1246052093@iki.fi> <CAMuHMdWZW-=8sD2KYEGY0f++++ocMjwDVut1r2z3pJk9OL2wmw@mail.gmail.com>
 <1201f416-26fe-862c-27ee-346ca50ff998@xs4all.nl>
In-Reply-To: <1201f416-26fe-862c-27ee-346ca50ff998@xs4all.nl>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 7 Aug 2019 12:53:38 +0200
Message-ID: <CAMuHMdUfm1p+91xBcjWO9Tm4BcmTr9R5p530ChMQC=0RKLuaDA@mail.gmail.com>
Subject: Re: [PATCH] media: tm6000: Spelling s/diconencted/diconnected/
To:     Hans Verkuil <hverkuil@xs4all.nl>
Cc:     Antti Palosaari <crope@iki.fi>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Hans,

On Wed, Aug 7, 2019 at 11:33 AM Hans Verkuil <hverkuil@xs4all.nl> wrote:
> On 7/31/19 8:43 PM, Geert Uytterhoeven wrote:
> > On Wed, Jul 31, 2019 at 8:36 PM Antti Palosaari <crope@iki.fi> wrote:
> >> On 7/31/19 4:41 PM, Geert Uytterhoeven wrote:
> >>> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> >>> ---
> >>>   drivers/media/usb/tm6000/tm6000-cards.c | 2 +-
> >>>   1 file changed, 1 insertion(+), 1 deletion(-)
> >>>
> >>> diff --git a/drivers/media/usb/tm6000/tm6000-cards.c b/drivers/media/usb/tm6000/tm6000-cards.c
> >>> index 23df50aa0a4af6da..9a0ffe678524987c 100644
> >>> --- a/drivers/media/usb/tm6000/tm6000-cards.c
> >>> +++ b/drivers/media/usb/tm6000/tm6000-cards.c
> >>> @@ -1328,7 +1328,7 @@ static int tm6000_usb_probe(struct usb_interface *interface,
> >>>
> >>>   /*
> >>>    * tm6000_usb_disconnect()
> >>> - * called when the device gets diconencted
> >>> + * called when the device gets diconnected
> >>
> >> disconnected ?
> >
> > Thanks, will fix!
>
> Can you also add a commit message when you post v2? Currently that's
> empty and Linus doesn't like empty commit messages :-)

Even if everything to be said is in the one-line summary?

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
