Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7F0581B5F71
	for <lists+linux-media@lfdr.de>; Thu, 23 Apr 2020 17:35:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729325AbgDWPfH (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 23 Apr 2020 11:35:07 -0400
Received: from gofer.mess.org ([88.97.38.141]:45857 "EHLO gofer.mess.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729176AbgDWPfG (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 23 Apr 2020 11:35:06 -0400
Received: by gofer.mess.org (Postfix, from userid 1000)
        id 6D85DC637F; Thu, 23 Apr 2020 16:35:05 +0100 (BST)
Date:   Thu, 23 Apr 2020 16:35:05 +0100
From:   Sean Young <sean@mess.org>
To:     Rolf Pedersen <rolfpedersen@mindspring.com>
Cc:     Linux Media Mailing List <linux-media@vger.kernel.org>
Subject: Re: HauppaugeTV-quadHD DVB-T mpeg risc op code error
Message-ID: <20200423153505.GA22057@gofer.mess.org>
References: <0c0ab661-17bb-231a-7311-c35d8d0435c0@mindspring.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <0c0ab661-17bb-231a-7311-c35d8d0435c0@mindspring.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi,

On Thu, Apr 23, 2020 at 05:32:32AM -0700, Rolf Pedersen wrote:
> Hi Folks,
> I just subscribed after having trouble with this card that worked for 3
> years on Skylake i5-6500 but stopped tuning when I moved it to AMD Ryzen 5
> 3400G machine.  I found the workaround in the archived thread referenced in
> the subject line and don't know any way to reply directly to it:
> https://www.spinics.net/lists/linux-media/msg114563.html
> 
> My card is ATSC as on this page:
> https://www.kernel.org/doc/html/v4.10/media/v4l-drivers/cx23885-cardlist.html
> 57     Hauppauge WinTV-QuadHD-ATSC     0070:6a18, 0070:6b18
> 
> and
> 
> [rolf@x570i coup]$ lspcidrake -v | grep Conexant
> cx23885         : Conexant Systems, Inc.|CX23887/8 PCIe Broadcast Audio and
> Video Decoder with 3D Comb [MULTIMEDIA_VIDEO] (vendor:14f1 device:8880
> subv:0070 subd:6b18) (rev: 04)
> cx23885         : Conexant Systems, Inc.|CX23887/8 PCIe Broadcast Audio and
> Video Decoder with 3D Comb [MULTIMEDIA_VIDEO] (vendor:14f1 device:8880
> subv:0070 subd:6a18) (rev: 04)
> 
> Neither scan, dvbscan, nor w_scan2, nor Kaffeine TV, while finding working
> frequencies, could divulge any services.  The workaround was in the
> referenced post:  cx23885.debug=8
> 
> I've seen another report of a different kernel option that worked on Ryzen:
> |cx23885.dma_reset_workaround=2 here:
> https://www.dslreports.com/forum/r32639318-SFF-3400G-build#32640298
> 
> Ok.  Just wanted to join the chorus with a *metoo* in case I can provide
> some (guided) forensics.

So there is a commit for a related issue:

https://git.linuxtv.org/media_tree.git/commit/?id=4bd46aa0353e022c2401a258e93b107880a66533

That is kernel v5.0 and higher. So:

1. What kernel are you using?

2. What is the full lspci -n of your machine?

Thanks,

Sean
