Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CDF9725E917
	for <lists+linux-media@lfdr.de>; Sat,  5 Sep 2020 18:43:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728042AbgIEQnU (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 5 Sep 2020 12:43:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47004 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726568AbgIEQnT (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sat, 5 Sep 2020 12:43:19 -0400
X-Greylist: delayed 133 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Sat, 05 Sep 2020 09:43:17 PDT
Received: from mxa2.seznam.cz (mxa2.seznam.cz [IPv6:2a02:598:2::90])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0A7D7C061244
        for <linux-media@vger.kernel.org>; Sat,  5 Sep 2020 09:43:17 -0700 (PDT)
Received: from email.seznam.cz
        by email-smtpc2b.ng.seznam.cz (email-smtpc2b.ng.seznam.cz [10.23.13.45])
        id 5c3497068b8f2e635c9c89c1;
        Sat, 05 Sep 2020 18:43:16 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=post.cz; s=beta;
        t=1599324196; bh=0BVWgKqwZLcnIMUdPnFuoyaigJyPF7STxEwt64wCJ04=;
        h=Received:From:To:Date:MIME-Version:Subject:Message-ID:Priority:
         In-reply-to:References:X-mailer:Content-type:
         Content-transfer-encoding:Content-description;
        b=H+Q8K+0KiY+/3zfsIgjYI7hEgRgNyAZCinQGANRDuT6g3xEQbKPLJDDzQ3t+8ZtYR
         YLfi8cHJtPhF3H64CYJBVnGn8p2O4J0KXU6fcvqUoeugzZIt9EinQSanaxsnSUwGQl
         TXGXPd3TI/ulF/LLgx1Z6HxtnmfbZ9NEml970xLo=
Received: from [192.168.254.6] (47.94.cust.tetanet.cz [109.202.94.47])
        by email-relay28.ng.seznam.cz (Seznam SMTPD 1.3.120) with ESMTP;
        Sat, 05 Sep 2020 18:40:41 +0200 (CEST)  
From:   "Frantisek Rysanek" <Frantisek.Rysanek@post.cz>
To:     "Pasveer, Ernie" <Ernie.Pasveer@CGG.com>,
        "'epasveer@att.net'" <epasveer@att.net>,
        "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>
Date:   Sat, 05 Sep 2020 18:40:39 +0200
MIME-Version: 1.0
Subject: Re: Need assistance installing a TV/FM card
Message-ID: <5F53BF87.17855.53D2DD1D@Frantisek.Rysanek.post.cz>
In-reply-to: <AM5P190MB0323F3AC73879BD3423A5860EB2D0@AM5P190MB0323.EURP190.PROD.OUTLOOK.COM>
References: <AM5P190MB0323F3AC73879BD3423A5860EB2D0@AM5P190MB0323.EURP190.PROD.OUTLOOK.COM>
X-mailer: Pegasus Mail for Windows (4.73.639)
Content-type: text/plain; charset=US-ASCII
Content-transfer-encoding: 7BIT
Content-description: Mail message body
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello Ernie,

the saa7134 driver in the kernel is suggesting some insmod parameter 
(card=) to force a particular known card model. And warns, that 
selecting the wrong model may damage your card.
And the card= parameter is an integer index into an array of cards 
known. Apparently that SnaZio is just the last in the list in that 
source code file, and it has index 196. The entries in that static 
array are not numbered in the source file. The index is implicit in 
their sequence in the file. If you find a matching entry, good luck 
finding out its number ;-)

To see what models are available, try reading through this source 
file:
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tre
e/drivers/media/pci/saa7134/saa7134-cards.c

The main insmod parameters are defined here:
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tre
e/drivers/media/pci/saa7134/saa7134-core.c

A detailed picture of the board (10 Mpix macro with a steady tripod 
and well tweaked lighting?) would hopefully tell us some chip labels.
The file would be large (a couple megabytes) - that probably wouldn't 
squeeze as an attachment here. You'd have to upload it somewhere and 
send us a link.
Not sure if "tuner" is a chip or a silvery metal package. An external 
DVB demodulator would be a dedicated chip too.

The SAA7134 itself is an analog receiver. Where I live in the EU, 
analog TV has gone out of fashion in about 2012, with the definitive 
arrival of DVB-T (aka analog darkness).
If you can make the card work in Linux, it might still function as an 
FM radio receiver. I'm wondering if that's worth the bother though.

Hmm... apparently there are cards using the SAA7134 as a PCI 
interface, but also equipped with a DVB-T demodulator. But I haven't 
found a single note about DVB-T2.

From a practical standpoint:

Some USB dongle based on the RTL2832U would probably prove more 
useful. Even if its DVB-T demodulation capability is nowadays out of 
date as well, it can still do FM radio, and can work as a front-end 
for SDR.

If you'd like to receive DVB-T2 TV, and I'm right in thinking that 
your card doesn't support that, I suggest that you get something yet 
more modern, such as the Mygica dongle.

Frank

On 4 Sep 2020 at 14:39, Pasveer, Ernie wrote:

> Hi All,
> 
> I bought this low-cost TV/FM card and it seems my linux box doesn't
> recognize it.  
> I'm not sure what bit of info to use to attempt to force it to a
> specific card.
> 
> Any help would be appreciated.
> 
> Here's my info. I can provide an image of the card if needed.
> 
> Thanks.
> 
> --ernie
> 
> 
> 
> 
> OpenSuse 15.2 (Kernel 5.3.18)
> 
> 
> 
> 
> erniep@gracie:~$ dmesg | grep saa7134
> [   12.004761] saa7134: saa7130/34: v4l2 driver version 0, 2, 17
> loaded
> [   12.005210] saa7134: saa7134[0]: found at 0000:07:04.0, rev: 1,
> irq: 16, latency: 64, mmio: 0xf9fffc00
> [   12.005217] saa7134: saa7134: Board is currently unknown. You
> might try to use the card=<nr>
>                saa7134: insmod option to specify which board do you
> have, but this is
>                saa7134: somewhat risky, as might damage your card.
> It is better to ask
>                saa7134: for support at
> linux-media@vger.kernel.org.
>                saa7134: The supported cards are:
> [   12.005219] saa7134: saa7134:   card=0 -> UNKNOWN/GENERIC        
>     .
>     .
>     .
> [   12.005881] saa7134: saa7134:   card=196 -> SnaZio* TVPVR PRO    
> 1779:13cf
> [   12.005886] saa7134: saa7134[0]: subsystem: 1131:0000, board:
> UNKNOWN/GENERIC [card=0,autodetected]
> [   12.006271] saa7134: saa7134[0]: board init: gpio is 70c000
> [   12.112568] saa7134: saa7134[0]: Huh, no eeprom present
> (err=-5)?
> [   12.112837] saa7134: saa7134[0]: registered device video0
> [v4l2]
> [   12.112917] saa7134: saa7134[0]: registered device vbi0
> [   12.174607] saa7134_alsa: saa7134 ALSA driver for DMA sound
> loaded
> [   12.174648] saa7134_alsa: saa7134[0]/alsa: saa7134[0] at
> 0xf9fffc00 irq 16 registered as card -1
>  
>  
> 07:04.0 Multimedia controller [0480]: Philips Semiconductors
> SAA7134/SAA7135HL Video Broadcast Decoder [1131:7134] (rev 01)
>         Subsystem: Philips Semiconductors SAA713x-based TV tuner
> card [1131:0000]
>         Control: I/O- Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop-
> ParErr- Stepping- SERR- FastB2B- DisINTx-
>         Status: Cap+ 66MHz- UDF- FastB2B+ ParErr- DEVSEL=medium
> >TAbort- <TAbort- <MAbort- >SERR- <PERR- INTx-
>         Latency: 64 (3750ns min, 9500ns max)
>         Interrupt: pin A routed to IRQ 16
>         Region 0: Memory at f9fffc00 (32-bit, non-prefetchable)
> [size=1K]
>         Capabilities: [40] Power Management version 1
>                 Flags: PMEClk- DSI- D1+ D2+ AuxCurrent=0mA
> PME(D0-,D1-,D2-,D3hot-,D3cold-)
>                 Status: D0 NoSoftRst- PME-Enable- DSel=0 DScale=0
> PME-
>         Kernel driver in use: saa7134
>         Kernel modules: saa7134
> 00: 31 11 34 71 06 00 90 02 01 00 80 04 00 40 00 00
> 10: 00 fc ff f9 00 00 00 00 00 00 00 00 00 00 00 00
> 20: 00 00 00 00 00 00 00 00 00 00 00 00 31 11 00 00
> 30: 00 00 00 00 40 00 00 00 00 00 00 00 0f 01 0f 26
> 40: 01 00 01 06 00 00 00 00 00 00 00 00 00 00 00 00
> 50: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
> 60: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
> 70: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
> 80: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
> 90: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
> a0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
> b0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
> c0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
> d0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
> e0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
> f0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
> 
> 
> 
> 
> --ernie
> 
> 
> --ernie
> 


