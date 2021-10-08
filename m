Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 72D414263E1
	for <lists+linux-media@lfdr.de>; Fri,  8 Oct 2021 06:43:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230080AbhJHEpd (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 8 Oct 2021 00:45:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55022 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229501AbhJHEpc (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 8 Oct 2021 00:45:32 -0400
Received: from mail-qk1-x733.google.com (mail-qk1-x733.google.com [IPv6:2607:f8b0:4864:20::733])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2CBDAC061570;
        Thu,  7 Oct 2021 21:43:37 -0700 (PDT)
Received: by mail-qk1-x733.google.com with SMTP id t63so3561334qkf.1;
        Thu, 07 Oct 2021 21:43:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jms.id.au; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Gw7wgCaTvKYfMbMV5PxHZoE3kvEBXYtxmjTRmjNu3yU=;
        b=Z/L+yZ5MrjWEkKwsTluewvUnMYn1psbS+3h1jYz5KDe5q+emwrnH5WqoC6/flz4U57
         raR168czq8D1ADzDZ5FjPapHJcO4OPq3Pk9WYTpA4jsP8sLqtpzxOIo4N71qkW61LtLc
         H54bnTcrokGgQpOqfPhM6cj2PmiWdv5mGJ/8k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Gw7wgCaTvKYfMbMV5PxHZoE3kvEBXYtxmjTRmjNu3yU=;
        b=NDX7/uNJ/y3MAskpTubON+cx43bt8OoN3MBy08ap/Vj1YhqMCWSLBZryBUGT6utiaV
         HOZDFiDdItu3QqdHQAm75JOZY1qQExxDqCgzjMXgJoahT4L8/mkbqEbDZl1emdF0pV8n
         I8hcXnUOJOovGyC9Yo0zMzIkVexWbb0ETtAAZeVWPdX5q0Ry3KBcJGwE8vg+oJ0MacVH
         wLf44l4XZlUCQ2FirFfSSUi8isTJuX4t9IQOmB92QZAv2WBNettM29GIPELURoF/JSIS
         AOwPH/QEzrWhDI66520uEtE1Vq/6a+mTSnxyehHapt62Q0BcWDcEp4xgypjLnpQEf9CJ
         HGqA==
X-Gm-Message-State: AOAM531Ie990H4ZfH4HVK/F+cUYOG+ZgbU+WvxXguCk+znC/UXEELOE7
        RnIzt3wLVMwaUZxnYepZsvlOMmRF9ZZFS+xWGJM=
X-Google-Smtp-Source: ABdhPJyMiuGznZhJ+Kw46FLW26WDpsOFcbXLbn863aS0Ef7/II4nBu4wAPfJG+qTVxqTQSL0dCOJxsMUJyRRkyrdGy8=
X-Received: by 2002:a05:620a:5fd:: with SMTP id z29mr1130132qkg.36.1633668216260;
 Thu, 07 Oct 2021 21:43:36 -0700 (PDT)
MIME-Version: 1.0
References: <20210617220229.7352-1-zev@bewilderbeest.net> <46edf81d60a38747f7d2511f840253a1c6867652.camel@linux.ibm.com>
 <HK0PR06MB338081E134AA6F43ECBCBA4DF2D29@HK0PR06MB3380.apcprd06.prod.outlook.com>
 <CACPK8XfE6zB9BWYq7e8WbXkPFp2Cicwv2x2dc8h6jNaR2qZV0g@mail.gmail.com> <YVNlfwLUDNxtp0fs@hatter.bewilderbeest.net>
In-Reply-To: <YVNlfwLUDNxtp0fs@hatter.bewilderbeest.net>
From:   Joel Stanley <joel@jms.id.au>
Date:   Fri, 8 Oct 2021 04:43:24 +0000
Message-ID: <CACPK8Xfowe6k8KOucveUd-O3vMC4n7qyF8uoowcpWj-Sugqhbw@mail.gmail.com>
Subject: Re: [PATCH v3] media: aspeed-video: ignore interrupts that aren't enabled
To:     Zev Weiss <zev@bewilderbeest.net>,
        Greg KH <gregkh@linuxfoundation.org>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Eddie James <eajames@linux.ibm.com>,
        "linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>,
        "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
        Ryan Chen <ryan_chen@aspeedtech.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Greg,

On Tue, 28 Sept 2021 at 18:57, Zev Weiss <zev@bewilderbeest.net> wrote:
>
> On Mon, Sep 06, 2021 at 04:47:14AM PDT, Joel Stanley wrote:
> >Hi Mauro,
> >
> >On Mon, 6 Sept 2021 at 10:10, Ryan Chen <ryan_chen@aspeedtech.com> wrote:
> >> > Subject: Re: [PATCH v3] media: aspeed-video: ignore interrupts that aren't
> >> > enabled
> >> >
> >> > On Thu, 2021-06-17 at 17:02 -0500, Zev Weiss wrote:
> >> > > As partially addressed in commit 65d270acb2d6 ("media: aspeed: clear
> >> > > garbage interrupts"), the ASpeed video engine sometimes asserts
> >> > > interrupts that the driver hasn't enabled.  In addition to the
> >> > > CAPTURE_COMPLETE and FRAME_COMPLETE interrupts dealt with in that
> >> > > patch, COMP_READY has also been observed.  Instead of playing
> >> > > whack-a-mole with each one individually, we can instead just blanket
> >> > > ignore everything we haven't explicitly enabled.
> >> >
> >> > Suspect this will fix an intermittent problem on AST2500 with screensaver.
> >> > Change looks good, thanks!
> >> >
> >> > Reviewed-by: Eddie James <eajames@linux.ibm.com>
> >> >
> >> Reviewed-by: Ryan Chen <ryan_chen@aspeedtech.com>
> >> > >
> >> > > Signed-off-by: Zev Weiss <zev@bewilderbeest.net>
> >
> >I notice this wasn't merged in the pull request you sent for v5.15.
> >Would you be able to ensure it makes it in the next pull request you
> >send?
> >
> >It can have some fixes tags too:
> >
> >Fixes: 65d270acb2d6 ("media: aspeed: clear garbage interrupts")
> >Fixes: d2b4387f3bdf ("media: platform: Add Aspeed Video Engine driver")
> >Acked-by: Joel Stanley <joel@jms.id.au>
> >
> >Cheers,
> >
> >Joel
> >
>
> Also not in the recent merge of the media/v5.15-2 tag it looks like -- ping?

We're struggling to get a hold of the media maintainers to merge this
fix. Have you heard from them recently?

Cheers,

Joel
