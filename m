Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 506C21C030F
	for <lists+linux-media@lfdr.de>; Thu, 30 Apr 2020 18:49:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726467AbgD3Qti (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 30 Apr 2020 12:49:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54602 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726404AbgD3Qth (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 30 Apr 2020 12:49:37 -0400
Received: from gofer.mess.org (gofer.mess.org [IPv6:2a02:8011:d000:212::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B207BC035494
        for <linux-media@vger.kernel.org>; Thu, 30 Apr 2020 09:49:37 -0700 (PDT)
Received: by gofer.mess.org (Postfix, from userid 1000)
        id CEFFCC63EF; Thu, 30 Apr 2020 17:49:34 +0100 (BST)
Date:   Thu, 30 Apr 2020 17:49:34 +0100
From:   Sean Young <sean@mess.org>
To:     Martin Burnicki <martin.burnicki@burnicki.net>
Cc:     Rolf Pedersen <rolfpedersen@mindspring.com>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Brad Love <brad@nextdimension.cc>
Subject: Re: HauppaugeTV-quadHD DVB-T mpeg risc op code error
Message-ID: <20200430164934.GA16730@gofer.mess.org>
References: <20200423155908.GA22613@gofer.mess.org>
 <bc0644cd-3438-6505-d438-8f3f71347ccb@mindspring.com>
 <20200423163559.GB23006@gofer.mess.org>
 <0cd2436c-0a39-0f85-929e-5d8f333b5027@burnicki.net>
 <20200425114147.GA3037@gofer.mess.org>
 <4aa38e2a-6b98-6530-69d9-d945a467bf0b@burnicki.net>
 <1a2d9e15-55e2-88a7-d197-208a8ce99218@burnicki.net>
 <20200427080751.GA5925@gofer.mess.org>
 <e7d8aeb8-124a-f7b3-d469-4c47f182f067@burnicki.net>
 <0fc5d43f-7928-1649-220b-45916b189d8f@burnicki.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0fc5d43f-7928-1649-220b-45916b189d8f@burnicki.net>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, Apr 28, 2020 at 08:24:20PM +0200, Martin Burnicki wrote:
> Hi,
> 
> Am 27.04.20 um 10:59 schrieb Martin Burnicki:
> > Sean Young wrote:
> >> Would you mind testing this patch please?
> > 
> > I'm going to try it this evening.
> > 
> > I'll have to find out how to do an out-of-tree build for a copy of the
> > cx module that includes the patch.
> > 
> > My own kernel driver is always and only built out-of-tree, but for the
> > cx driver I need to see which files I need to copy to a local directory,
> > and if there is anything else that needs to be done to build a copy of
> > it out-of-tree.
> 
> Sorry, I haven't managed to test the patch, yet.
> 
> Currently I have the driver loaded with
> 
> options cx23885 dma_reset_workaround=2
> 
> but today there were 3 occurrences of the risc opcode error:
> 
> root@pc:~# dmesg | grep risc
> [166528.023263] cx23885: cx23885[0]: mpeg risc op code error
> [166528.023273] cx23885: cx23885[0]:   cmds: init risc lo   : 0xff667000
> [166528.023277] cx23885: cx23885[0]:   cmds: init risc hi   : 0x00000000
> [166528.023293] cx23885: cx23885[0]:   cmds: risc pc lo     : 0xff667018
> [166528.023296] cx23885: cx23885[0]:   cmds: risc pc hi     : 0x00000000
> [166528.023319] cx23885: cx23885[0]:   risc0:
> [166528.023324] cx23885: cx23885[0]:   risc1:
> [166528.023330] cx23885: cx23885[0]:   risc2:
> [166528.023334] cx23885: cx23885[0]:   risc3:
> [180595.947077] cx23885: cx23885[0]: mpeg risc op code error
> [180595.947087] cx23885: cx23885[0]:   cmds: init risc lo   : 0xfc6ee000
> [180595.947090] cx23885: cx23885[0]:   cmds: init risc hi   : 0x00000000
> [180595.947107] cx23885: cx23885[0]:   cmds: risc pc lo     : 0xfc6ee018
> [180595.947110] cx23885: cx23885[0]:   cmds: risc pc hi     : 0x00000000
> [180595.947133] cx23885: cx23885[0]:   risc0:
> [180595.947138] cx23885: cx23885[0]:   risc1:
> [180595.947143] cx23885: cx23885[0]:   risc2:
> [180595.947147] cx23885: cx23885[0]:   risc3:
> [180595.947263] cx23885: cx23885[0]: mpeg risc op code error
> [180595.947270] cx23885: cx23885[0]:   cmds: init risc lo   : 0xfc6ee000
> [180595.947274] cx23885: cx23885[0]:   cmds: init risc hi   : 0x00000000
> [180595.947290] cx23885: cx23885[0]:   cmds: risc pc lo     : 0xfc6ee018
> [180595.947293] cx23885: cx23885[0]:   cmds: risc pc hi     : 0x00000000
> [180595.947315] cx23885: cx23885[0]:   risc0:
> [180595.947319] cx23885: cx23885[0]:   risc1:
> [180595.947324] cx23885: cx23885[0]:   risc2:
> [180595.947328] cx23885: cx23885[0]:   risc3:
> 
> My wife is very happy that the recordings of the TV shows she wanted to
> see later were aborted. ;-)

Drats.

> So the workaround doesn't seem to fix the problem anyway, and the patch
> would just enable the workaround with out the specific option, right?

Yes, that's right.

> The effect of the workaround looks just like debug levels lower than 7,
> it just seems to reduce the probability that the bug occurs, but doesn't
> really fix it.
> 
> So my conclusion is still that that this smells like a missing memory
> barrier or so in the driver.
> 
> Since the driver seems to work properly with older mainboards/CPU types,
> this doesn't sound like a problem in the CX chip, IMO.

I would agree with that. I would suspect same issue was being papered over
by the patch; now what that issue is, I don't know. Certainly some ordering
or barrier issue seems likely.

Actually I suspected this all along, but the workaround is the best we have.

I think, some time spent hunting down the issue would really be helpful
here. Hopefully that doesn't mean too many aborted recordings..

Thanks,

Sean
