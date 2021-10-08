Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DFC48426430
	for <lists+linux-media@lfdr.de>; Fri,  8 Oct 2021 07:45:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229721AbhJHFrY (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 8 Oct 2021 01:47:24 -0400
Received: from mail.kernel.org ([198.145.29.99]:39990 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229511AbhJHFrV (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Fri, 8 Oct 2021 01:47:21 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id E6609610E5;
        Fri,  8 Oct 2021 05:45:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1633671926;
        bh=hM+LEo6jq0sP4p14rwXKnhJUAnXreXijp/k9Sn8qwVQ=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=lrh9ADDMfDgO+XapsVQdMVRnXrY8BIE5LKdZ6yUKCkAYaoI3jsMK8yGMPKTKmlUWK
         uIaGV774meo9+ScIbEyyEZlq9Y1h5SR0xThd/YS9MaUAigJOpmn4cSFyS0tuGwaar3
         w0azjLgyNDYW4wJUiJmnTiLjYn93wgDLlpmDltP4=
Date:   Fri, 8 Oct 2021 07:45:22 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Joel Stanley <joel@jms.id.au>
Cc:     Zev Weiss <zev@bewilderbeest.net>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Eddie James <eajames@linux.ibm.com>,
        "linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>,
        "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
        Ryan Chen <ryan_chen@aspeedtech.com>
Subject: Re: [PATCH v3] media: aspeed-video: ignore interrupts that aren't
 enabled
Message-ID: <YV/a8k2vI8TjJR2z@kroah.com>
References: <20210617220229.7352-1-zev@bewilderbeest.net>
 <46edf81d60a38747f7d2511f840253a1c6867652.camel@linux.ibm.com>
 <HK0PR06MB338081E134AA6F43ECBCBA4DF2D29@HK0PR06MB3380.apcprd06.prod.outlook.com>
 <CACPK8XfE6zB9BWYq7e8WbXkPFp2Cicwv2x2dc8h6jNaR2qZV0g@mail.gmail.com>
 <YVNlfwLUDNxtp0fs@hatter.bewilderbeest.net>
 <CACPK8Xfowe6k8KOucveUd-O3vMC4n7qyF8uoowcpWj-Sugqhbw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CACPK8Xfowe6k8KOucveUd-O3vMC4n7qyF8uoowcpWj-Sugqhbw@mail.gmail.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Fri, Oct 08, 2021 at 04:43:24AM +0000, Joel Stanley wrote:
> Hi Greg,
> 
> On Tue, 28 Sept 2021 at 18:57, Zev Weiss <zev@bewilderbeest.net> wrote:
> >
> > On Mon, Sep 06, 2021 at 04:47:14AM PDT, Joel Stanley wrote:
> > >Hi Mauro,
> > >
> > >On Mon, 6 Sept 2021 at 10:10, Ryan Chen <ryan_chen@aspeedtech.com> wrote:
> > >> > Subject: Re: [PATCH v3] media: aspeed-video: ignore interrupts that aren't
> > >> > enabled
> > >> >
> > >> > On Thu, 2021-06-17 at 17:02 -0500, Zev Weiss wrote:
> > >> > > As partially addressed in commit 65d270acb2d6 ("media: aspeed: clear
> > >> > > garbage interrupts"), the ASpeed video engine sometimes asserts
> > >> > > interrupts that the driver hasn't enabled.  In addition to the
> > >> > > CAPTURE_COMPLETE and FRAME_COMPLETE interrupts dealt with in that
> > >> > > patch, COMP_READY has also been observed.  Instead of playing
> > >> > > whack-a-mole with each one individually, we can instead just blanket
> > >> > > ignore everything we haven't explicitly enabled.
> > >> >
> > >> > Suspect this will fix an intermittent problem on AST2500 with screensaver.
> > >> > Change looks good, thanks!
> > >> >
> > >> > Reviewed-by: Eddie James <eajames@linux.ibm.com>
> > >> >
> > >> Reviewed-by: Ryan Chen <ryan_chen@aspeedtech.com>
> > >> > >
> > >> > > Signed-off-by: Zev Weiss <zev@bewilderbeest.net>
> > >
> > >I notice this wasn't merged in the pull request you sent for v5.15.
> > >Would you be able to ensure it makes it in the next pull request you
> > >send?
> > >
> > >It can have some fixes tags too:
> > >
> > >Fixes: 65d270acb2d6 ("media: aspeed: clear garbage interrupts")
> > >Fixes: d2b4387f3bdf ("media: platform: Add Aspeed Video Engine driver")
> > >Acked-by: Joel Stanley <joel@jms.id.au>
> > >
> > >Cheers,
> > >
> > >Joel
> > >
> >
> > Also not in the recent merge of the media/v5.15-2 tag it looks like -- ping?
> 
> We're struggling to get a hold of the media maintainers to merge this
> fix. Have you heard from them recently?

I have seen them on the mailing list, yes.

good luck!

greg k-h
