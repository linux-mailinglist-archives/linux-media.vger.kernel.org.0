Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EFA2C70102
	for <lists+linux-media@lfdr.de>; Mon, 22 Jul 2019 15:26:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727513AbfGVN0s (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 22 Jul 2019 09:26:48 -0400
Received: from gofer.mess.org ([88.97.38.141]:38019 "EHLO gofer.mess.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726925AbfGVN0r (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 22 Jul 2019 09:26:47 -0400
Received: by gofer.mess.org (Postfix, from userid 1000)
        id CD7C46047B; Mon, 22 Jul 2019 14:26:45 +0100 (BST)
Date:   Mon, 22 Jul 2019 14:26:45 +0100
From:   Sean Young <sean@mess.org>
To:     John G <johngo7470@yahoo.com>
Cc:     linux-media@vger.kernel.org
Subject: Re: scancodes identified as invalid (I found the problem)
Message-ID: <20190722132645.5wevuv2d6opoeitw@gofer.mess.org>
References: <5370cd2b-f699-7831-e040-4b27e7f0cdaa@xnet.com>
 <20190721193607.hi3ipvxyedlhii3p@gofer.mess.org>
 <1881197532.5237588.1563795842895@mail.yahoo.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1881197532.5237588.1563795842895@mail.yahoo.com>
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi John,

On Mon, Jul 22, 2019 at 11:44:02AM +0000, John G wrote:
>  Hi Sean,
> Using s = 0x20df10ef, protocol_scancode_valid() will return false (meaning it is not a valid scancode).
> 
> s>>24 = 0x00000020
> s>>16 = 0x000020df
> ~(0x20df) = 0xdf20
> ( 0x0020 ^ 0xdf20) = 0xdf00
> 0xdf00 & 0xff = 00 !=0 will return false (fails scancode check)
> 
> I'm not sure I understand what is being checked, since any code between 0x0 and 0xffffffff should be valid for nec32.

So first of all, nec is divided into three sub-protocols: nec, nec-x and nec32.
This is done because there are a lot of dvb IR receivers which can only
decode nec, or only nec and nec-x.

So the way kernel nec decoder works means that if you transmit nec32:0x20df10ef,
it will be decoded as nec:0x20df.

See:
https://git.linuxtv.org/media_tree.git/tree/include/media/rc-core.h#n355

and:

https://git.linuxtv.org/media_tree.git/tree/drivers/media/rc/ir-nec-decoder.c#n134

ir-ctl is being pendantic about this and wants you to specify the protocol
the way it will be decode. How about the following output for ir-ctl:

$ ir-ctl -S nec32:0xef10c03f
warning: `nec32:0xef10c03f' will be decoded as `nec:0xefc0'

Does this make sense?


> Is this check really necessary? Maybe a -force option to bypass the scancode check? ;)
> 
> I did try to send ir-ctl -S 0x2010, but the TV did not respond.
> I've only had success sending it the RAW version, which does look like the full 32-bit code.
> -----
> Ah! I just had a breakthrough!  
> 
> I noticed the nec description you sent me to, has LSB being transmitted first.
> On a hunch, I reversed the bit order of the code, (ir-ctl -S 0x0408, instead of 0x2010), and bingo!  
> 
> It make sense, really, because the raw code that works, is in LSB first order, so my error was (unintentionally) giving the hex code to ir-ctl, in raw/LSB order, instead of first converting it to Big Endian/MSB order. 
> 
> So, it's still not clear why "any" 32-bit code can't be entered, but in any case, I'm able to control things now!
> 
> Thank you for your support!

Please keep it on the list and please don't top-post.

Thanks

Sean

> 
> Kind regards,JohnG
> 
> 
>     On Sunday, July 21, 2019, 2:36:29 PM CDT, Sean Young <sean@mess.org> wrote:  
>  
>  Hi,
> 
> On Fri, Jul 19, 2019 at 06:50:05AM -0500, JohnG wrote:
> > I have POWER_KEY scancodes, that work as RAW data with ir-ctl -s [file], but
> > are not working with ir-ctl -S:
> > 
> >     0x20df10ef (POWER_KEY for my LG tv)
> >     0x02FD48B7 (POWER_KEY for my Toshiba tv)
> 
> As you can see here https://www.sbprojects.net/knowledge/ir/nec.php the
> nec protocol has an inverted address (2nd byte) and inverted command
> (3rd byte). The inverted values are not in regular nec scancodes for ir-ctl,
> as they are redundant.
> 
> So the first values would be "ir-ctl -S nec:0x2010" and the second one
> "ir-ctl -s nec:0x0248".
> 
> > rc6_mce:0x800f0410 works, as does nec32:0x800f0410 (though not
> > nec:0x800f0410), so it doesn't seem to be an issue with 32-bit codes.
> > 
> > I use AnalysIR, and it indicates the protocol is NEC for the above codes,
> > though irdb.tk indicates the protocol is NEC1.
> > 
> > 1) is there a description of the various protocols? (how can I know if I
> > should use nec or nec32, with a 32 bit value?)
> 
> There isn't any documentation, although we could really use some. I'll try
> to write something up when I get some time. In the mean time, you
> can see a list of the protocols to and bitmask here:
> 
> https://git.linuxtv.org/v4l-utils.git/tree/utils/common/ir-encode.c#n344
> 
> So the scancode_mask shows which bits are actually valid; if any bits
> outside of the mask are set, ir-ctl will say the scancode is invalid.
> 
> So for nec any value between 0 and 0xffff is valid; necx it is 0 to 0xffffff
> and nec32 it is 0 to 0xffffffff.
> 
> > 2) are my scancodes failing to work, because they are (possibly) NEC1
> > protocol?
> 
> I'm not sure what the nec1 protocol is exactly. This sounds like a AnalysIR
> invention.
> 
> > 
> > 3) if NEC1 is not the same as nec or nec32, is it scheduled to be added to
> > ir-ctl in the near future?
> 
> Please let me know how you get on with the above.
> 
> Thanks
> 
> Sean
> 
>   
