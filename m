Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 723051B8633
	for <lists+linux-media@lfdr.de>; Sat, 25 Apr 2020 13:41:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726155AbgDYLlv (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 25 Apr 2020 07:41:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43178 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726121AbgDYLlu (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 25 Apr 2020 07:41:50 -0400
Received: from gofer.mess.org (gofer.mess.org [IPv6:2a02:8011:d000:212::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3E944C09B04B
        for <linux-media@vger.kernel.org>; Sat, 25 Apr 2020 04:41:50 -0700 (PDT)
Received: by gofer.mess.org (Postfix, from userid 1000)
        id 6748DC6391; Sat, 25 Apr 2020 12:41:47 +0100 (BST)
Date:   Sat, 25 Apr 2020 12:41:47 +0100
From:   Sean Young <sean@mess.org>
To:     Martin Burnicki <martin.burnicki@burnicki.net>
Cc:     Rolf Pedersen <rolfpedersen@mindspring.com>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Brad Love <brad@nextdimension.cc>
Subject: Re: HauppaugeTV-quadHD DVB-T mpeg risc op code error
Message-ID: <20200425114147.GA3037@gofer.mess.org>
References: <0c0ab661-17bb-231a-7311-c35d8d0435c0@mindspring.com>
 <20200423153505.GA22057@gofer.mess.org>
 <686f60be-7a37-42ce-b4c0-b34cf54055e7@mindspring.com>
 <20200423155908.GA22613@gofer.mess.org>
 <bc0644cd-3438-6505-d438-8f3f71347ccb@mindspring.com>
 <20200423163559.GB23006@gofer.mess.org>
 <0cd2436c-0a39-0f85-929e-5d8f333b5027@burnicki.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0cd2436c-0a39-0f85-929e-5d8f333b5027@burnicki.net>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi,

On Fri, Apr 24, 2020 at 07:46:26PM +0200, Martin Burnicki wrote:
> I came across this thread and want to let you know that I also have
> problems with the cx23885 driver on a Ryzen system.
> 
> The only solution I found on the 'net that could make it work was to add
> a line
> 
> options cx23885 debug=7
> 
> to the file /etc/modprobe.d/cx23885.conf

Have you tried: 

options cx23885 dma_reset_workaround=2

?

> However, this causes a *huge* number of debug messages, so I also run
> the command
> 
> rm -f /var/log/kern.log*
> 
> in a daily cronjob. This works stable here for some months now.
> 
> With lower debug levels the problem occurred less often, but it still
> occurred. Only with debug level 7 (at least) the driver runs stable over
> time here.
> 
> In case somebody is interested in details of the systemI'm running here:
> https://burnicki.net/public_html/martin/tmp/system-etails.txt

Not found, I'm afraid.

> The commit messages mentioned earlier in this thread are already pretty
> old (from ~2018 or so), and I'm running kernel 5.3 on my Ubuntu system,
> so I guess those commits are already in there, but the problem still occurs.

Those commits check for a particular PCI PID/VIDs; newer IDs could be
missing, if they are still broken.

> I'm not familiar with the video stuff, with the cx23885 driver, etc.,
> but I'm maintaining another kernel driver for different PCI cards and
> encountered similar problems as the cx23885 driver.
> 
> The symptoms were that the driver worked stable for many years on all
> systems, but suddenly failed to work properly on systems with very new
> chips sets and/or CPUs (not only AMD Ryzen).
> 
> It turned out that the problem was due to missing barriers when
> accessing memory mapped registers.
> 
> In my original driver code (written many years ago) the driver accessed
> the memory mapped registers directly
> 
> val = *mem_addr
> *mem_addr = val
> 
> which worked without problems for a long time, so it looks like older
> CPUs/chipsets didn't do reordering which would have been inhibited by
> barriers.
> 
> As said above, with recent versions of CPUs/chipsets this seems indeed
> to happen, but since I changed the driver code so that all access to
> memory mapped registers uses the specific kernel inline functions (which
> use barriers, AFAIK), all problems have vanished and my driver works
> fine with the latest CPUs and chipsets.
> 
> So maybe somewhere in the cx23885 driver code a memory barrier may be
> missing, and depending on whether debugging is enabled, or not, accesses
> to the device are re-ordered, or not.
> 
> This is just an idea, and maybe this is not the case here, but by chance
> someone who is familiar with the cx23885 code may have a look.

That does seem possible.

Actually I think it would be very useful if you could try and track down
this issue, by replacing the various lines that do some debug action
with a memory barrier or nothing. That would tell where the problem is.

Unless anyone has better ideas, of course.

Thanks,

Sean
