Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 47FB52E1105
	for <lists+linux-media@lfdr.de>; Wed, 23 Dec 2020 02:08:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726239AbgLWBIG (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 22 Dec 2020 20:08:06 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53120 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725962AbgLWBIG (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 22 Dec 2020 20:08:06 -0500
Received: from mail-qk1-x72c.google.com (mail-qk1-x72c.google.com [IPv6:2607:f8b0:4864:20::72c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BADE3C0613D3;
        Tue, 22 Dec 2020 17:07:25 -0800 (PST)
Received: by mail-qk1-x72c.google.com with SMTP id b64so13681865qkc.12;
        Tue, 22 Dec 2020 17:07:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jms.id.au; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=b/IvHYt4zK7qrtLu/dIFfw1GWqSkerWH38ekPT2Fi8I=;
        b=FBLHaVSF9xVVMTPm3bwINQWKYKnm6a0cqbzSMhkX4GAX1RksMdNDHK2JguD4n/leut
         wlBTQBhTNkQsp0XAj9f0Bt/qO9vdusmj3o0Ux3Upl2JiPoIAl3XqFlMHYjgW8/uZsegf
         QxFHw0SsUQbzVaGUra6Z8zNUIOI/R8fDTVsBE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=b/IvHYt4zK7qrtLu/dIFfw1GWqSkerWH38ekPT2Fi8I=;
        b=oqweP4pelpH+Nlg7P1yGrzg5N7iLnxMEibCBBNb4mwo0pvgyqMXjhfE8YSZvPb1TJZ
         8+XNkE5X72KUQkMckFnmL/QZYW6j0J7wOhfGb5Pl5bwRmubvUyYTtaluyaVCCrwLjiAR
         2rvjzp43Jx2JdAT5O2gbWFWqqvna1alic37cktbVGXyN171DvwovCAVZpcNsNbi8Ijgq
         aNWbBCKjgcBRoADsFhuQ3C7/qflB/Fh7CwNSsASzNSdivAC50DyNSRALGklntBYr2fdy
         CQMwOHlbkJnZxkqOgzpD8504tFarC5B8NsvbYydJFSsIFcriQF1ebj4HnrDsyyh3SZev
         ClTg==
X-Gm-Message-State: AOAM531Z+IIXWYjwAg8mfZHszUqsm9BkXTgrGspqakpC1VKRuGcyla6a
        p0n4JXRbjNyvhUdhJLWVO0YR8orchNYciGxRvSypBZ1XF1g=
X-Google-Smtp-Source: ABdhPJweuxZG5b2ckpgGQ3CTgEg8EXlZp8qF2RXEjdc10DG4PVJk9A5cd6eJ1QbThAHKMa5XdNdfQsCKrqo435qrsp0=
X-Received: by 2002:a37:6790:: with SMTP id b138mr24838589qkc.465.1608685644841;
 Tue, 22 Dec 2020 17:07:24 -0800 (PST)
MIME-Version: 1.0
References: <20201215024542.18888-1-zev@bewilderbeest.net> <20201215024542.18888-3-zev@bewilderbeest.net>
 <CACPK8XczCUgqOENABoDbc-qwbMxOh=1OUyBtuHSmDG_Zo571Wg@mail.gmail.com> <20201222191433.3dgnfwyrod4tnvaf@hatter.bewilderbeest.net>
In-Reply-To: <20201222191433.3dgnfwyrod4tnvaf@hatter.bewilderbeest.net>
From:   Joel Stanley <joel@jms.id.au>
Date:   Wed, 23 Dec 2020 01:07:12 +0000
Message-ID: <CACPK8XeOZEkpAKcyhZLeMdGzbwtFmdGEnL6QXp0VK1HL_O2pSg@mail.gmail.com>
Subject: Re: [PATCH 2/3] aspeed-video: clear spurious interrupt bits unconditionally
To:     Zev Weiss <zev@bewilderbeest.net>,
        Ryan Chen <ryan_chen@aspeedtech.com>
Cc:     Eddie James <eajames@linux.ibm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Andrew Jeffery <andrew@aj.id.au>, linux-media@vger.kernel.org,
        OpenBMC Maillist <openbmc@lists.ozlabs.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        linux-aspeed <linux-aspeed@lists.ozlabs.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, 22 Dec 2020 at 19:14, Zev Weiss <zev@bewilderbeest.net> wrote:
>
> On Mon, Dec 21, 2020 at 10:47:37PM CST, Joel Stanley wrote:
> >On Tue, 15 Dec 2020 at 02:46, Zev Weiss <zev@bewilderbeest.net> wrote:
> >>
> >> Instead of testing and conditionally clearing them one by one, we can
> >> instead just unconditionally clear them all at once.
> >>
> >> Signed-off-by: Zev Weiss <zev@bewilderbeest.net>
> >
> >I had a poke at the assembly and it looks like GCC is clearing the
> >bits unconditionally anyway, so removing the tests provides no change.
> >
> >Combining them is a good further optimization.
> >
> >Reviewed-by: Joel Stanley <joel@jms.id.au>
> >
> >A question unrelated to this patch: Do you know why the driver doesn't
> >clear the status bits in the interrupt handler? I would expect it to
> >write the value of sts back to the register to ack the pending
> >interrupt.
> >
>
> No, I don't, and I was sort of wondering the same thing actually -- I'm
> not deeply familiar with this hardware or driver though, so I was a bit
> hesitant to start messing with things.  (Though maybe doing so would
> address the "stickiness" aspect when it does manifest.)  Perhaps Eddie
> or Jae can shed some light here?

I think you're onto something here - this would be why the status bits
seem to stick until the device is reset.

Until Aspeed can clarify if this is a hardware or software issue, I
suggest we ack the bits and log a message when we see them, instead of
always ignoring them without taking any action.

Can you write a patch that changes the interrupt handler to ack status
bits as it handles each of them?

>
>
> Zev
>
