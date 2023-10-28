Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 994657DA75A
	for <lists+linux-media@lfdr.de>; Sat, 28 Oct 2023 15:40:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229848AbjJ1Nkv (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 28 Oct 2023 09:40:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52592 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229449AbjJ1Nkv (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 28 Oct 2023 09:40:51 -0400
Received: from gofer.mess.org (gofer.mess.org [88.97.38.141])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 48BFBC0
        for <linux-media@vger.kernel.org>; Sat, 28 Oct 2023 06:40:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mess.org; s=2020;
        t=1698500445; bh=hU8Br4janeX2khZAO7wDSue7Q3FsC21+FF+Ea8kOLs8=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=M++iW9jSr2lzww8IJkaG6rDrZTwZJ25Y78W4bHmI7a/BE8ir5av4rEFSfZ2nclY5Z
         Y+cnbTelAT52Z9ahL79klF0dN1KrvAs7QOwBC0ALmlTNVB0XQHazQBh6fDMfvP/5lA
         WnAjDHGIKSMwXz9vSQ77PRlb3zMXkhOFoeQh4ICabE+Dq62VHK1WY59c7JmaUfgZhf
         C8/JnTlHVjyZcQk9KpoG70/AY6KodCqFQX5Y+90//YDb5V3oz0TArk3OFinfhMMygl
         dCOnJorQetJb+TnaGzevy0BKaNCRLhgrfHrSVCX0+wxewoMWFUd7Kx77eHv3S/RZ84
         WX674l5GpbdEA==
Received: by gofer.mess.org (Postfix, from userid 1000)
        id A49D21000FF; Sat, 28 Oct 2023 14:40:45 +0100 (BST)
Date:   Sat, 28 Oct 2023 14:40:45 +0100
From:   Sean Young <sean@mess.org>
To:     Vince Ricosti <vricosti@outlook.com>
Cc:     "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>
Subject: Re: Questions about ir-keytable and ir-ctl
Message-ID: <ZT0PXddD2tphScNh@gofer.mess.org>
References: <DS0PR19MB6526C9164F0E0883B380D2D3D3A3A@DS0PR19MB6526.namprd19.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <DS0PR19MB6526C9164F0E0883B380D2D3D3A3A@DS0PR19MB6526.namprd19.prod.outlook.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Vince,

On Sat, Oct 28, 2023 at 01:21:15PM +0000, Vince Ricosti wrote:
> I have described my experiments on linux with a rpi and I am a bit surprised that nothing works as it should.
> I have posted here my tests https://forums.raspberrypi.com/viewtopic.php?t=358522
> And I would like to discuss the different issues.
> 
> 1) Why when enabling all protocols a sony15 is not properly recognized ?
> 
> Testing events. Please, press CTRL-C to abort.
> 557.572052: lirc protocol(rc5_sz): scancode = 0x2fff toggle=1
> 557.572077: event type EV_MSC(0x04): scancode = 0x2fff
> 557.572077: event type EV_SYN(0x00).

That's a "suprious" decode. You can ignore it.

This is a case where the same IR can be decoded in multiple ways, if all
the decoders are enabled. The Sony/rc5_sz protocols are "non-robust", see
http://hifi-remote.com/wiki/index.php/Spurious_decodes_and_non-robust_protocols

> 557.572138: event type EV_MSC(0x04): scancode = 0x970026
> 557.572138: event type EV_SYN(0x00).
> 557.572130: lirc protocol(sony15): scancode = 0x970026
> 
> and when I enable only sony protocol it's properly recognized:
> 1236.384059: lirc protocol(sony15): scancode = 0x970026
> 1236.384082: event type EV_MSC(0x04): scancode = 0x970026
> 1236.384082: event type EV_SYN(0x00).

Only enabling the sony protocol is the right solution, or simply ignoring
the spurious decode. This works in most cases, because the resulting scancode
is not something you would expect.

> 2) When sending a sony scancode it doesn't work because the scancode is sent only once while for it work it need to be sent 3 times (or at least 2 times separated with a space of 43 * 600ms = 28500. Is there any flags to do that because I had to patch ir-ctl to make it work.

Yes, you are right about this. My sony system also needs the IR repeated at
least twice or else it ignores it.

> If nothing exists can I submit some patches to fix it ?

Sure, I think this is a useful addition to ir-ctl. 

On the other hand, I have been working on a new tool that replaces ir-ctl
and ir-keytable called cir: https://github.com/seanyoung/cir/ It might be
interesting to use this instead.

Using cir you would describe the sony protocol in IRP and send it that way,
and the IRP says that it should be repeated 3 times, rather than building 
this into the IR tool itself:

	cir transmit irp -fD=1,F=1 '{40k,600}<1,-1|2,-1>(4,-1,F:7,D:8,^45m)3[D:0..255,F:0..127]'

Alternatively you can also specify IRP repeats like so:

	cir transmit irp -fD=1,F=1 -r 3 '{40k,600}<1,-1|2,-1>(4,-1,F:7,D:8,^45m)*[D:0..255,F:0..127]'

cir transmit works very well and can also transmit lircd.conf files and
pronto hex, that is well tested and stable. However decoding needs work,
and the day-job is keeping me very busy lately. When I have some time I want
convert the decoding DFA to BPF and generate an IR decoder for the IRP.


Sean
