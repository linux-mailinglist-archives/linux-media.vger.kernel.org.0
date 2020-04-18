Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B422C1AF190
	for <lists+linux-media@lfdr.de>; Sat, 18 Apr 2020 17:25:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726089AbgDRPZy (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 18 Apr 2020 11:25:54 -0400
Received: from mail.kernel.org ([198.145.29.99]:54124 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725903AbgDRPZy (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Sat, 18 Apr 2020 11:25:54 -0400
Received: from coco.lan (ip5f5ad4d8.dynamic.kabel-deutschland.de [95.90.212.216])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id F125120732;
        Sat, 18 Apr 2020 15:25:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1587223553;
        bh=HBl/CdcjWf44IEsd28xLPBLxzAV91W0NSgfeUCJFUiw=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=Sdv1tF1Yw7XEADWUJ36fSsP1BAGfDeZCmI4lEIgOQz9ecRZgX/Pc3gdWCnTLPE2a/
         FziSRCehmTGeoWhjDdje1NpCiOroTVes1dsBSq8MGjXmheaNMxbDLaUv8oVotb2ebV
         Q1dJ5pkBpxBNSOrrHMbz4QAlpGpiJEMFzSpGZobI=
Date:   Sat, 18 Apr 2020 17:25:49 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Patrik Gfeller <patrik.gfeller@gmail.com>
Cc:     linux-media@vger.kernel.org
Subject: Re: atomisp kernel driver(s)
Message-ID: <20200418172549.7cca07a7@coco.lan>
In-Reply-To: <f3348096-1fb3-5368-ba66-f42a300bde8e@gmail.com>
References: <f3348096-1fb3-5368-ba66-f42a300bde8e@gmail.com>
X-Mailer: Claws Mail 3.17.5 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Em Sat, 18 Apr 2020 16:39:25 +0200
Patrik Gfeller <patrik.gfeller@gmail.com> escreveu:

> Hello Mauro et al,
> 
> I've recently switched to Linux, and I'm very impressed. Almost 
> everything thing works out of the box. Only the webcam on my device does 
> not. I did some digging and if I'm right an atomisp driver would be 
> required. Is this correct? Below the output of lspci:
> 
> 00:00.0 Host bridge: Intel Corporation Atom/Celeron/Pentium Processor 
> x5-E8000/J3xxx/N3xxx Series SoC Transaction Register (rev 36) 00:02.0 
> VGA compatible controller: Intel Corporation Atom/Celeron/Pentium 
> Processor x5-E8000/J3xxx/N3xxx Integrated Graphics Controller (rev 36) 
> 00:03.0 Multimedia controller: Intel Corporation Atom/Celeron/Pentium 
> Processor x5-E8000/J3xxx/N3xxx Series Imaging Unit (rev 36) 00:0a.0 
> Non-VGA unclassified device: Intel Corporation Device 22d8 (rev 36) 
> 00:0b.0 Signal processing controller: Intel Corporation 
> Atom/Celeron/Pentium Processor x5-E8000/J3xxx/N3xxx Series Power 
> Management Controller (rev 36) 00:14.0 USB controller: Intel Corporation 
> Atom/Celeron/Pentium Processor x5-E8000/J3xxx/N3xxx Series USB xHCI 
> Controller (rev 36) 00:1a.0 Encryption controller: Intel Corporation 
> Atom/Celeron/Pentium Processor x5-E8000/J3xxx/N3xxx Series Trusted 
> Execution Engine (rev 36) 00:1c.0 PCI bridge: Intel Corporation 
> Atom/Celeron/Pentium Processor x5-E8000/J3xxx/N3xxx Series PCI Express 
> Port #1 (rev 36) 00:1f.0 ISA bridge: Intel Corporation 
> Atom/Celeron/Pentium Processor x5-E8000/J3xxx/N3xxx Series PCU (rev 36) 
> 01:00.0 Network controller: Qualcomm Atheros QCA9377 802.11ac Wireless 
> Network Adapter (rev 31)
> 
> According to the history it looks like the driver was removed from the 
> kernel in 2018 and replaced with a dummy driver (to make sure power save 
> works).
> 
> Is there a chance that the atomisp driver will return to the kernel? 
> There are quite a few older tablets and 2in1 devices that would benefit. 
> Unfortunately I do not understand the removed code (my coding skills are 
> very basic) and can thus not help to change what ever is necessary to 
> make it fit for the kernel :-( (does not sound like a beginner project). 
> However - I would be glad to help out to help testing an ISP driver.

There are simply too many things there to be fixed, and nobody without
time for it. Also, the last reports we had is that the driver was not
working.

Unfortunately, I don't have myself any atomisp hardware, otherwise I
could try fixing it on my spare time.

> However - even without the cam it is a very impressing operating system 
> which I enjoy very much. I would like to thank all of you for your work 
> that benefits so many people!
> 
> All the best and stay healthy.
> 
> With kind regards,
> 
> Patrik Gfeller <patrik.gfeller@gmail.com>
> 



Thanks,
Mauro
