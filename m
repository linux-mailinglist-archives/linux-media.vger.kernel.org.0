Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 37FB641B6E1
	for <lists+linux-media@lfdr.de>; Tue, 28 Sep 2021 21:05:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242169AbhI1THS (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 28 Sep 2021 15:07:18 -0400
Received: from thorn.bewilderbeest.net ([71.19.156.171]:51219 "EHLO
        thorn.bewilderbeest.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230109AbhI1THS (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 28 Sep 2021 15:07:18 -0400
X-Greylist: delayed 491 seconds by postgrey-1.27 at vger.kernel.org; Tue, 28 Sep 2021 15:07:18 EDT
Received: from hatter.bewilderbeest.net (71-212-29-146.tukw.qwest.net [71.212.29.146])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: zev)
        by thorn.bewilderbeest.net (Postfix) with ESMTPSA id 8CF6F293;
        Tue, 28 Sep 2021 11:57:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bewilderbeest.net;
        s=thorn; t=1632855446;
        bh=IFT3ZrpRZd+Ibr02i8FrlOCSYn/cxKG+rD5MpR8Vock=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=DWL+C+dHOgnPcq0cZchQ12PhW3t9SddpmR2MCjXQLHiGjRkmHFwkj9b5Fxcx308dN
         WkzsqUDmdqAMqFjnryQZ3xWDMM603fAOMHZzB8wQL+2+A5H0NRuApMACU2H3jptchH
         j/SDraM5EGdylpEkqfLBwv2INKURWptZ+I6RjTao=
Date:   Tue, 28 Sep 2021 11:57:03 -0700
From:   Zev Weiss <zev@bewilderbeest.net>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     Joel Stanley <joel@jms.id.au>, Eddie James <eajames@linux.ibm.com>,
        "linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>,
        "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
        Ryan Chen <ryan_chen@aspeedtech.com>
Subject: Re: [PATCH v3] media: aspeed-video: ignore interrupts that aren't
 enabled
Message-ID: <YVNlfwLUDNxtp0fs@hatter.bewilderbeest.net>
References: <20210617220229.7352-1-zev@bewilderbeest.net>
 <46edf81d60a38747f7d2511f840253a1c6867652.camel@linux.ibm.com>
 <HK0PR06MB338081E134AA6F43ECBCBA4DF2D29@HK0PR06MB3380.apcprd06.prod.outlook.com>
 <CACPK8XfE6zB9BWYq7e8WbXkPFp2Cicwv2x2dc8h6jNaR2qZV0g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <CACPK8XfE6zB9BWYq7e8WbXkPFp2Cicwv2x2dc8h6jNaR2qZV0g@mail.gmail.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, Sep 06, 2021 at 04:47:14AM PDT, Joel Stanley wrote:
>Hi Mauro,
>
>On Mon, 6 Sept 2021 at 10:10, Ryan Chen <ryan_chen@aspeedtech.com> wrote:
>> > Subject: Re: [PATCH v3] media: aspeed-video: ignore interrupts that aren't
>> > enabled
>> >
>> > On Thu, 2021-06-17 at 17:02 -0500, Zev Weiss wrote:
>> > > As partially addressed in commit 65d270acb2d6 ("media: aspeed: clear
>> > > garbage interrupts"), the ASpeed video engine sometimes asserts
>> > > interrupts that the driver hasn't enabled.  In addition to the
>> > > CAPTURE_COMPLETE and FRAME_COMPLETE interrupts dealt with in that
>> > > patch, COMP_READY has also been observed.  Instead of playing
>> > > whack-a-mole with each one individually, we can instead just blanket
>> > > ignore everything we haven't explicitly enabled.
>> >
>> > Suspect this will fix an intermittent problem on AST2500 with screensaver.
>> > Change looks good, thanks!
>> >
>> > Reviewed-by: Eddie James <eajames@linux.ibm.com>
>> >
>> Reviewed-by: Ryan Chen <ryan_chen@aspeedtech.com>
>> > >
>> > > Signed-off-by: Zev Weiss <zev@bewilderbeest.net>
>
>I notice this wasn't merged in the pull request you sent for v5.15.
>Would you be able to ensure it makes it in the next pull request you
>send?
>
>It can have some fixes tags too:
>
>Fixes: 65d270acb2d6 ("media: aspeed: clear garbage interrupts")
>Fixes: d2b4387f3bdf ("media: platform: Add Aspeed Video Engine driver")
>Acked-by: Joel Stanley <joel@jms.id.au>
>
>Cheers,
>
>Joel
>

Also not in the recent merge of the media/v5.15-2 tag it looks like -- ping?


Thanks,
Zev

