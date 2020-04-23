Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EE1261B5B76
	for <lists+linux-media@lfdr.de>; Thu, 23 Apr 2020 14:32:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726434AbgDWMce (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 23 Apr 2020 08:32:34 -0400
Received: from elasmtp-masked.atl.sa.earthlink.net ([209.86.89.68]:58100 "EHLO
        elasmtp-masked.atl.sa.earthlink.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726105AbgDWMce (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 23 Apr 2020 08:32:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mindspring.com;
        s=dk12062016; t=1587645153; bh=l6AOgMZePT2J8X8M74Q/FF9AUe1F61hAHPLg
        dHzCTjA=; h=Received:From:Subject:To:Message-ID:Date:User-Agent:
         MIME-Version:Content-Type:Content-Transfer-Encoding:X-ELNK-Trace:
         X-Originating-IP; b=cM9ETZR4ZIO+LWgvzfbXZmO7c9rb9P8qLo6tjiMrLFQTcw
        +uowcjdcdS7zHrwpOYoDbW5rwwwa0aSOGr63Xg3+TAyCFHTzRKn34xpIab5l6Fe7wjf
        0quwffNhZKBJtVIR/NrAWgkLe+VmPqWz3zJfP+KTemqBekcgtQOPhgf0XyT9/NqBpt+
        bsVHks9uP7g/PGFenAeBj32m+paFZHTiBCCKHG/EYQVQD0w0Cf24JiYVe0ebxsOEorZ
        np1L4kAfA6SXgNe4T3dxM1D+G+cS8FyN3n8tCox4fIRFWLry4F3S3EplzfITfLJT10E
        0TCf0azO1bdDDWXA+eJt9x4P0WSg==
DomainKey-Signature: a=rsa-sha1; q=dns; c=nofws;
  s=dk12062016; d=mindspring.com;
  b=TP6epgX303/EnEkpvoMZ0I6NBJb6tIT/2UKzui8vdQQ3jlynwf/T//Cq4eE8+tFXHysR4dCWKpSG/zpY/9GXmnCTVIUV2+eFGIzDrV2jiMm4pAyrY8l5XX4ExGyC6/QM3uKEZxlHooNzXRF9uxLnBvad5xRXbj3DmxUn9WpTae8IMTevysZ+EhjMZIbfTYSuw9jWSoQRQBs9p/w5EqM3P8yeQ1JSqTp5cVrmSY2rFGMoBkDoic5w1U68PPiC3+UfluhkcdZPeFl1M0N54f6dXt/68wzyuBc3BSeV3WTtlQfS9tedWWW0aKv4rJRO+Vm16YAPzQ6zx+tLJm3zN+pmpg==;
  h=Received:From:Subject:To:Message-ID:Date:User-Agent:MIME-Version:Content-Type:Content-Transfer-Encoding:X-ELNK-Trace:X-Originating-IP;
Received: from [24.6.19.181] (helo=[192.168.1.217])
        by elasmtp-masked.atl.sa.earthlink.net with esmtpa (Exim 4)
        (envelope-from <rolfpedersen@mindspring.com>)
        id 1jRb1s-000DAJ-IR
        for linux-media@vger.kernel.org; Thu, 23 Apr 2020 08:32:32 -0400
From:   Rolf Pedersen <rolfpedersen@mindspring.com>
Subject: Re: HauppaugeTV-quadHD DVB-T mpeg risc op code error
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
Message-ID: <0c0ab661-17bb-231a-7311-c35d8d0435c0@mindspring.com>
Date:   Thu, 23 Apr 2020 05:32:32 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Firefox/52.0 SeaMonkey/2.49.5
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ELNK-Trace: 160c66f8c3bc2670427f8aa51e728925f402879cecb40bd5e83d8e5ea292f9c0d71279da8098c300e793f793464d3e2c350badd9bab72f9c350badd9bab72f9c
X-Originating-IP: 24.6.19.181
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Folks,
I just subscribed after having trouble with this card that worked for 3 
years on Skylake i5-6500 but stopped tuning when I moved it to AMD Ryzen 
5 3400G machine.  I found the workaround in the archived thread 
referenced in the subject line and don't know any way to reply directly 
to it: https://www.spinics.net/lists/linux-media/msg114563.html

My card is ATSC as on this page: 
https://www.kernel.org/doc/html/v4.10/media/v4l-drivers/cx23885-cardlist.html
57     Hauppauge WinTV-QuadHD-ATSC     0070:6a18, 0070:6b18

and

[rolf@x570i coup]$ lspcidrake -v | grep Conexant
cx23885         : Conexant Systems, Inc.|CX23887/8 PCIe Broadcast Audio 
and Video Decoder with 3D Comb [MULTIMEDIA_VIDEO] (vendor:14f1 
device:8880 subv:0070 subd:6b18) (rev: 04)
cx23885         : Conexant Systems, Inc.|CX23887/8 PCIe Broadcast Audio 
and Video Decoder with 3D Comb [MULTIMEDIA_VIDEO] (vendor:14f1 
device:8880 subv:0070 subd:6a18) (rev: 04)

Neither scan, dvbscan, nor w_scan2, nor Kaffeine TV, while finding 
working frequencies, could divulge any services.  The workaround was in 
the referenced post:  cx23885.debug=8

I've seen another report of a different kernel option that worked on 
Ryzen: |cx23885.dma_reset_workaround=2 here: 
https://www.dslreports.com/forum/r32639318-SFF-3400G-build#32640298

Ok.  Just wanted to join the chorus with a *metoo* in case I can provide 
some (guided) forensics.
Thanks,
Rolf
|
