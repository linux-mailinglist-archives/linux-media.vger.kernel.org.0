Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2F0261B6003
	for <lists+linux-media@lfdr.de>; Thu, 23 Apr 2020 17:59:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729363AbgDWP7M (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 23 Apr 2020 11:59:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57844 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1729072AbgDWP7M (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 23 Apr 2020 11:59:12 -0400
Received: from gofer.mess.org (gofer.mess.org [IPv6:2a02:8011:d000:212::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 37512C09B040
        for <linux-media@vger.kernel.org>; Thu, 23 Apr 2020 08:59:12 -0700 (PDT)
Received: by gofer.mess.org (Postfix, from userid 1000)
        id 43B00C637F; Thu, 23 Apr 2020 16:59:08 +0100 (BST)
Date:   Thu, 23 Apr 2020 16:59:08 +0100
From:   Sean Young <sean@mess.org>
To:     Rolf Pedersen <rolfpedersen@mindspring.com>
Cc:     Linux Media Mailing List <linux-media@vger.kernel.org>
Subject: Re: HauppaugeTV-quadHD DVB-T mpeg risc op code error
Message-ID: <20200423155908.GA22613@gofer.mess.org>
References: <0c0ab661-17bb-231a-7311-c35d8d0435c0@mindspring.com>
 <20200423153505.GA22057@gofer.mess.org>
 <686f60be-7a37-42ce-b4c0-b34cf54055e7@mindspring.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <686f60be-7a37-42ce-b4c0-b34cf54055e7@mindspring.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi,

On Thu, Apr 23, 2020 at 08:49:17AM -0700, Rolf Pedersen wrote:
> Hi,
> 
> On 04/23/2020 08:35 AM, Sean Young wrote:
> > Hi,
> > 
> > On Thu, Apr 23, 2020 at 05:32:32AM -0700, Rolf Pedersen wrote:
> > > Hi Folks,
> > > I just subscribed after having trouble with this card that worked for 3
> > > years on Skylake i5-6500 but stopped tuning when I moved it to AMD Ryzen 5
> > > 3400G machine.  I found the workaround in the archived thread referenced in
> > > the subject line and don't know any way to reply directly to it:
> > > https://www.spinics.net/lists/linux-media/msg114563.html
> > > 
> > > My card is ATSC as on this page:
> > > https://www.kernel.org/doc/html/v4.10/media/v4l-drivers/cx23885-cardlist.html
> > > 57     Hauppauge WinTV-QuadHD-ATSC     0070:6a18, 0070:6b18
> > > 
> > > and
> > > 
> > > [rolf@x570i coup]$ lspcidrake -v | grep Conexant
> > > cx23885         : Conexant Systems, Inc.|CX23887/8 PCIe Broadcast Audio and
> > > Video Decoder with 3D Comb [MULTIMEDIA_VIDEO] (vendor:14f1 device:8880
> > > subv:0070 subd:6b18) (rev: 04)
> > > cx23885         : Conexant Systems, Inc.|CX23887/8 PCIe Broadcast Audio and
> > > Video Decoder with 3D Comb [MULTIMEDIA_VIDEO] (vendor:14f1 device:8880
> > > subv:0070 subd:6a18) (rev: 04)
> > > 
> > > Neither scan, dvbscan, nor w_scan2, nor Kaffeine TV, while finding working
> > > frequencies, could divulge any services.  The workaround was in the
> > > referenced post:  cx23885.debug=8
> > > 
> > > I've seen another report of a different kernel option that worked on Ryzen:
> > > |cx23885.dma_reset_workaround=2 here:
> > > https://www.dslreports.com/forum/r32639318-SFF-3400G-build#32640298
> > > 
> > > Ok.  Just wanted to join the chorus with a *metoo* in case I can provide
> > > some (guided) forensics.
> > So there is a commit for a related issue:
> > 
> > https://git.linuxtv.org/media_tree.git/commit/?id=4bd46aa0353e022c2401a258e93b107880a66533
> > 
> > That is kernel v5.0 and higher. So:
> > 
> > 1. What kernel are you using?
> > 
> > 2. What is the full lspci -n of your machine?
> > 
> > Thanks,
> > 
> > Sean
> > 
> 
> [rolf@x570i ~]$ uname -r
> 5.5.15-desktop-3.mga7
> [rolf@x570i ~]$
> [rolf@x570i ~]$
> [rolf@x570i ~]$ lspci -n
> 00:00.0 0600: 1022:15d0
> 00:00.2 0806: 1022:15d1
> 00:01.0 0600: 1022:1452
> 00:01.1 0604: 1022:15d3
> 00:01.2 0604: 1022:15d3
> 00:01.6 0604: 1022:15d3
> 00:08.0 0600: 1022:1452
> 00:08.1 0604: 1022:15db
> 00:08.2 0604: 1022:15dc
> 00:14.0 0c05: 1022:790b (rev 61)
> 00:14.3 0601: 1022:790e (rev 51)
> 00:18.0 0600: 1022:15e8
> 00:18.1 0600: 1022:15e9
> 00:18.2 0600: 1022:15ea
> 00:18.3 0600: 1022:15eb
> 00:18.4 0600: 1022:15ec
> 00:18.5 0600: 1022:15ed
> 00:18.6 0600: 1022:15ee
> 00:18.7 0600: 1022:15ef
> 01:00.0 0604: 12d8:2304 (rev 05)
> 02:01.0 0604: 12d8:2304 (rev 05)
> 02:02.0 0604: 12d8:2304 (rev 05)
> 03:00.0 0400: 14f1:8880 (rev 04)
> 04:00.0 0400: 14f1:8880 (rev 04)
> 05:00.0 0604: 1022:57ad
> 06:02.0 0604: 1022:57a3
> 06:04.0 0604: 1022:57a3
> 06:08.0 0604: 1022:57a4
> 06:09.0 0604: 1022:57a4
> 06:0a.0 0604: 1022:57a4
> 07:00.0 0280: 8086:2723 (rev 1a)
> 08:00.0 0200: 8086:1539 (rev 03)
> 09:00.0 1300: 1022:1485
> 09:00.1 0c03: 1022:149c
> 09:00.3 0c03: 1022:149c
> 0a:00.0 0106: 1022:7901 (rev 51)
> 0b:00.0 0106: 1022:7901 (rev 51)
> 0c:00.0 0108: 144d:a808
> 0d:00.0 0300: 1002:15d8 (rev c8)
> 0d:00.1 0403: 1002:15de
> 0d:00.2 1080: 1022:15df
> 0d:00.3 0c03: 1022:15e0
> 0d:00.4 0c03: 1022:15e1
> 0d:00.6 0403: 1022:15e3
> 0e:00.0 0106: 1022:7901 (rev 61)

Thanks.

I'm afraid that I should have asked for: lspci -v

That would be helpful, thanks.


Sean
