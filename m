Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BBCA284B40
	for <lists+linux-media@lfdr.de>; Wed,  7 Aug 2019 14:12:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729408AbfHGMM1 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 7 Aug 2019 08:12:27 -0400
Received: from mail-ot1-f67.google.com ([209.85.210.67]:33698 "EHLO
        mail-ot1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727213AbfHGMM1 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 7 Aug 2019 08:12:27 -0400
Received: by mail-ot1-f67.google.com with SMTP id q20so103172208otl.0
        for <linux-media@vger.kernel.org>; Wed, 07 Aug 2019 05:12:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=VDKGx4oXP5YGABfnjJntyMPwquiJIZRG5ZK7/Z07zhk=;
        b=iiENl9YnWQTIXtIDS2emEzqfI94uMOB1NWSFSHXCWOo5bzfcpcgOEFnIwSvWLurHlk
         41TkldKsvF0PyBgzPXP7Zg2EccHE3idlWOOJFNrgHjyhGGDesFyCXGHEtLLJl0Djl8NN
         zDv7FEEuMcYdX9yxx4ah/RkE/xsn9yJmlc4aupnyN2vDZX+V9SS28jNJ/xRNqcFilhvW
         LhPDV6xt1AbtADOsUFapv6E/V9dTJcPP+PXbaQeeYxAemX4lo55wd37qqZqEdwmRsf9R
         lVsQV6naqJ8LU8kf5qs3fGTuhJ3dOzHnPiVTrdFHlpQNSRMhSl0sU3gulHLGn7265bz1
         LHPg==
X-Gm-Message-State: APjAAAWyXoIrxMo1iAiemVvovEwEC2T2x7k8cOZJFMGzLmi153S8Kr/x
        Hd8p600P9ouTUZDJO4ox3r9DOmRq4BN9RDRaFY8=
X-Google-Smtp-Source: APXvYqw3+uRG64xW3GTAeQVu5moSWLBqXNBPj/nzKWIOr0pnPeOk5WtbXvXKYDS69VglgyrTvY+GhMifiuhMIPjXDxo=
X-Received: by 2002:aca:3bc6:: with SMTP id i189mr4608925oia.153.1565179945860;
 Wed, 07 Aug 2019 05:12:25 -0700 (PDT)
MIME-Version: 1.0
References: <20190731134121.18473-1-geert+renesas@glider.be>
 <95aa9f00-a01e-09ab-3cc3-5f1246052093@iki.fi> <CAMuHMdWZW-=8sD2KYEGY0f++++ocMjwDVut1r2z3pJk9OL2wmw@mail.gmail.com>
 <1201f416-26fe-862c-27ee-346ca50ff998@xs4all.nl> <CAMuHMdUfm1p+91xBcjWO9Tm4BcmTr9R5p530ChMQC=0RKLuaDA@mail.gmail.com>
 <040b2c92-516b-58c6-940e-54fb58f7ddee@xs4all.nl>
In-Reply-To: <040b2c92-516b-58c6-940e-54fb58f7ddee@xs4all.nl>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 7 Aug 2019 14:12:14 +0200
Message-ID: <CAMuHMdW8SAgT+KR9yEwhjaxijL07FuvqyGXmAOMv3xrvPB=HJw@mail.gmail.com>
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

On Wed, Aug 7, 2019 at 1:05 PM Hans Verkuil <hverkuil@xs4all.nl> wrote:
> On 8/7/19 12:53 PM, Geert Uytterhoeven wrote:
> > On Wed, Aug 7, 2019 at 11:33 AM Hans Verkuil <hverkuil@xs4all.nl> wrote:
> >> On 7/31/19 8:43 PM, Geert Uytterhoeven wrote:
> >>> On Wed, Jul 31, 2019 at 8:36 PM Antti Palosaari <crope@iki.fi> wrote:
> >>>> On 7/31/19 4:41 PM, Geert Uytterhoeven wrote:
> >>>>> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> >>>>> ---
> >>>>>   drivers/media/usb/tm6000/tm6000-cards.c | 2 +-
> >>>>>   1 file changed, 1 insertion(+), 1 deletion(-)
> >>>>>
> >>>>> diff --git a/drivers/media/usb/tm6000/tm6000-cards.c b/drivers/media/usb/tm6000/tm6000-cards.c
> >>>>> index 23df50aa0a4af6da..9a0ffe678524987c 100644
> >>>>> --- a/drivers/media/usb/tm6000/tm6000-cards.c
> >>>>> +++ b/drivers/media/usb/tm6000/tm6000-cards.c
> >>>>> @@ -1328,7 +1328,7 @@ static int tm6000_usb_probe(struct usb_interface *interface,
> >>>>>
> >>>>>   /*
> >>>>>    * tm6000_usb_disconnect()
> >>>>> - * called when the device gets diconencted
> >>>>> + * called when the device gets diconnected
> >>>>
> >>>> disconnected ?
> >>>
> >>> Thanks, will fix!
> >>
> >> Can you also add a commit message when you post v2? Currently that's
> >> empty and Linus doesn't like empty commit messages :-)
> >
> > Even if everything to be said is in the one-line summary?
>
> Yes. In fact, checkpatch warns if the commit description is empty.

Quoting the checkpatch.pl maintainer:

   "checkpatch is a stupid script and doesn't forbid anything.
    It's just a suggestion guide."

https://lore.kernel.org/lkml/20190801124037.11dcac71@gandalf.local.home/

> In this case, just say 'Fix typo.', that's sufficient.

If that makes you happy...

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
