Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4A8031B5FE1
	for <lists+linux-media@lfdr.de>; Thu, 23 Apr 2020 17:49:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729377AbgDWPtU (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 23 Apr 2020 11:49:20 -0400
Received: from elasmtp-masked.atl.sa.earthlink.net ([209.86.89.68]:43146 "EHLO
        elasmtp-masked.atl.sa.earthlink.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1729072AbgDWPtU (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 23 Apr 2020 11:49:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mindspring.com;
        s=dk12062016; t=1587656959; bh=Z5EKsCySlEmLHQl0JKRnC5rxROLDmmDwhFx5
        7q9CoOQ=; h=Received:Subject:To:Cc:References:From:Message-ID:Date:
         User-Agent:MIME-Version:In-Reply-To:Content-Type:
         Content-Transfer-Encoding:X-ELNK-Trace:X-Originating-IP; b=Ka3LbMO
        pMM6q/MHBFHTBGlVs5CwC0cYkNTnDnjnNadgAnsnn7VWoqe6sfhP8vbrIR5Y93YWlvi
        cPRGh9m7Suglb4Ul54qNBwv3hcEGvrja7JOj1cGVTWhQeQCuBKaUJSNDt4Hp2vlQ09x
        l3wRC/iUdXZs6A9X6N1jqohaUU1iRIeTmDDNjC/Nqh3kerIt8FQwPDlaZpbijZOwb4e
        9r42V3b/8cZ8g3FoePFeVFAvYNZCQf/6AkLRqCRHcATqEamSlvctCDQXsTMkdyB6//4
        CXwYoUN5au86smaTThmVvIvoQNaP01Ap3g7osJjIBzqkPWRq+45hdyLTqXKkVaih3GA
        ==
DomainKey-Signature: a=rsa-sha1; q=dns; c=nofws;
  s=dk12062016; d=mindspring.com;
  b=dDLWvb7BhURdEv5U0K8ewijZZl1LpLAieB72OWlvJOuqr4wuiLgNU++zcjF+N2+PRoG2WBRDNPfuPwPNkuVsIGqLXGxhU58IHQLfjsR56CGFoBoxM187Sc2UJBsacyNKDOXmC5cl4/wXA+OXGURkz5MSx1ghtq2Fka2twGF45xM4/jlfsn1uBYGIs/dnqH4+YrUFGf0QWIQVcNY9ZiZa2+Dbgy9Lo7skLjcCrxejzubJ8tNoN+GENpD90zFdT33tFFmMudagSmJZjnd71AFnI+G+ggfOv6ivNXAIH1Pl1aPITpXNeqzmlqjpYbhhmRkn3tJ8WVgZzOd6aRdoE5kZ/A==;
  h=Received:Subject:To:Cc:References:From:Message-ID:Date:User-Agent:MIME-Version:In-Reply-To:Content-Type:Content-Transfer-Encoding:X-ELNK-Trace:X-Originating-IP;
Received: from [24.6.19.181] (helo=[192.168.1.217])
        by elasmtp-masked.atl.sa.earthlink.net with esmtpa (Exim 4)
        (envelope-from <rolfpedersen@mindspring.com>)
        id 1jRe6I-000C8G-8r; Thu, 23 Apr 2020 11:49:18 -0400
Subject: Re: HauppaugeTV-quadHD DVB-T mpeg risc op code error
To:     Sean Young <sean@mess.org>
Cc:     Linux Media Mailing List <linux-media@vger.kernel.org>
References: <0c0ab661-17bb-231a-7311-c35d8d0435c0@mindspring.com>
 <20200423153505.GA22057@gofer.mess.org>
From:   Rolf Pedersen <rolfpedersen@mindspring.com>
Message-ID: <686f60be-7a37-42ce-b4c0-b34cf54055e7@mindspring.com>
Date:   Thu, 23 Apr 2020 08:49:17 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Firefox/52.0 SeaMonkey/2.49.5
MIME-Version: 1.0
In-Reply-To: <20200423153505.GA22057@gofer.mess.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ELNK-Trace: 160c66f8c3bc2670427f8aa51e728925f402879cecb40bd5e83d8e5ea292f9c0aa3da59392431d441b31ffc4f174dc91350badd9bab72f9c350badd9bab72f9c
X-Originating-IP: 24.6.19.181
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi,

On 04/23/2020 08:35 AM, Sean Young wrote:
> Hi,
>
> On Thu, Apr 23, 2020 at 05:32:32AM -0700, Rolf Pedersen wrote:
>> Hi Folks,
>> I just subscribed after having trouble with this card that worked for 3
>> years on Skylake i5-6500 but stopped tuning when I moved it to AMD Ryzen 5
>> 3400G machine.  I found the workaround in the archived thread referenced in
>> the subject line and don't know any way to reply directly to it:
>> https://www.spinics.net/lists/linux-media/msg114563.html
>>
>> My card is ATSC as on this page:
>> https://www.kernel.org/doc/html/v4.10/media/v4l-drivers/cx23885-cardlist.html
>> 57     Hauppauge WinTV-QuadHD-ATSC     0070:6a18, 0070:6b18
>>
>> and
>>
>> [rolf@x570i coup]$ lspcidrake -v | grep Conexant
>> cx23885         : Conexant Systems, Inc.|CX23887/8 PCIe Broadcast Audio and
>> Video Decoder with 3D Comb [MULTIMEDIA_VIDEO] (vendor:14f1 device:8880
>> subv:0070 subd:6b18) (rev: 04)
>> cx23885         : Conexant Systems, Inc.|CX23887/8 PCIe Broadcast Audio and
>> Video Decoder with 3D Comb [MULTIMEDIA_VIDEO] (vendor:14f1 device:8880
>> subv:0070 subd:6a18) (rev: 04)
>>
>> Neither scan, dvbscan, nor w_scan2, nor Kaffeine TV, while finding working
>> frequencies, could divulge any services.  The workaround was in the
>> referenced post:  cx23885.debug=8
>>
>> I've seen another report of a different kernel option that worked on Ryzen:
>> |cx23885.dma_reset_workaround=2 here:
>> https://www.dslreports.com/forum/r32639318-SFF-3400G-build#32640298
>>
>> Ok.  Just wanted to join the chorus with a *metoo* in case I can provide
>> some (guided) forensics.
> So there is a commit for a related issue:
>
> https://git.linuxtv.org/media_tree.git/commit/?id=4bd46aa0353e022c2401a258e93b107880a66533
>
> That is kernel v5.0 and higher. So:
>
> 1. What kernel are you using?
>
> 2. What is the full lspci -n of your machine?
>
> Thanks,
>
> Sean
>

[rolf@x570i ~]$ uname -r
5.5.15-desktop-3.mga7
[rolf@x570i ~]$
[rolf@x570i ~]$
[rolf@x570i ~]$ lspci -n
00:00.0 0600: 1022:15d0
00:00.2 0806: 1022:15d1
00:01.0 0600: 1022:1452
00:01.1 0604: 1022:15d3
00:01.2 0604: 1022:15d3
00:01.6 0604: 1022:15d3
00:08.0 0600: 1022:1452
00:08.1 0604: 1022:15db
00:08.2 0604: 1022:15dc
00:14.0 0c05: 1022:790b (rev 61)
00:14.3 0601: 1022:790e (rev 51)
00:18.0 0600: 1022:15e8
00:18.1 0600: 1022:15e9
00:18.2 0600: 1022:15ea
00:18.3 0600: 1022:15eb
00:18.4 0600: 1022:15ec
00:18.5 0600: 1022:15ed
00:18.6 0600: 1022:15ee
00:18.7 0600: 1022:15ef
01:00.0 0604: 12d8:2304 (rev 05)
02:01.0 0604: 12d8:2304 (rev 05)
02:02.0 0604: 12d8:2304 (rev 05)
03:00.0 0400: 14f1:8880 (rev 04)
04:00.0 0400: 14f1:8880 (rev 04)
05:00.0 0604: 1022:57ad
06:02.0 0604: 1022:57a3
06:04.0 0604: 1022:57a3
06:08.0 0604: 1022:57a4
06:09.0 0604: 1022:57a4
06:0a.0 0604: 1022:57a4
07:00.0 0280: 8086:2723 (rev 1a)
08:00.0 0200: 8086:1539 (rev 03)
09:00.0 1300: 1022:1485
09:00.1 0c03: 1022:149c
09:00.3 0c03: 1022:149c
0a:00.0 0106: 1022:7901 (rev 51)
0b:00.0 0106: 1022:7901 (rev 51)
0c:00.0 0108: 144d:a808
0d:00.0 0300: 1002:15d8 (rev c8)
0d:00.1 0403: 1002:15de
0d:00.2 1080: 1022:15df
0d:00.3 0c03: 1022:15e0
0d:00.4 0c03: 1022:15e1
0d:00.6 0403: 1022:15e3
0e:00.0 0106: 1022:7901 (rev 61)
[rolf@x570i ~]$

Thanks,
Rolf
