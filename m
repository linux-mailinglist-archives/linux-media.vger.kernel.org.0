Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5B6B46F4FE
	for <lists+linux-media@lfdr.de>; Sun, 21 Jul 2019 21:36:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726031AbfGUTgJ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 21 Jul 2019 15:36:09 -0400
Received: from gofer.mess.org ([88.97.38.141]:36259 "EHLO gofer.mess.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725796AbfGUTgJ (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Sun, 21 Jul 2019 15:36:09 -0400
Received: by gofer.mess.org (Postfix, from userid 1000)
        id 16B0760474; Sun, 21 Jul 2019 20:36:07 +0100 (BST)
Date:   Sun, 21 Jul 2019 20:36:07 +0100
From:   Sean Young <sean@mess.org>
To:     JohnG <tardis@xnet.com>
Cc:     linux-media@vger.kernel.org
Subject: Re: scancodes identified as invalid
Message-ID: <20190721193607.hi3ipvxyedlhii3p@gofer.mess.org>
References: <5370cd2b-f699-7831-e040-4b27e7f0cdaa@xnet.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <5370cd2b-f699-7831-e040-4b27e7f0cdaa@xnet.com>
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi,

On Fri, Jul 19, 2019 at 06:50:05AM -0500, JohnG wrote:
> I have POWER_KEY scancodes, that work as RAW data with ir-ctl -s [file], but
> are not working with ir-ctl -S:
> 
>     0x20df10ef (POWER_KEY for my LG tv)
>     0x02FD48B7 (POWER_KEY for my Toshiba tv)

As you can see here https://www.sbprojects.net/knowledge/ir/nec.php the
nec protocol has an inverted address (2nd byte) and inverted command
(3rd byte). The inverted values are not in regular nec scancodes for ir-ctl,
as they are redundant.

So the first values would be "ir-ctl -S nec:0x2010" and the second one
"ir-ctl -s nec:0x0248".

> rc6_mce:0x800f0410 works, as does nec32:0x800f0410 (though not
> nec:0x800f0410), so it doesn't seem to be an issue with 32-bit codes.
> 
> I use AnalysIR, and it indicates the protocol is NEC for the above codes,
> though irdb.tk indicates the protocol is NEC1.
> 
> 1) is there a description of the various protocols? (how can I know if I
> should use nec or nec32, with a 32 bit value?)

There isn't any documentation, although we could really use some. I'll try
to write something up when I get some time. In the mean time, you
can see a list of the protocols to and bitmask here:

https://git.linuxtv.org/v4l-utils.git/tree/utils/common/ir-encode.c#n344

So the scancode_mask shows which bits are actually valid; if any bits
outside of the mask are set, ir-ctl will say the scancode is invalid.

So for nec any value between 0 and 0xffff is valid; necx it is 0 to 0xffffff
and nec32 it is 0 to 0xffffffff.

> 2) are my scancodes failing to work, because they are (possibly) NEC1
> protocol?

I'm not sure what the nec1 protocol is exactly. This sounds like a AnalysIR
invention.

> 
> 3) if NEC1 is not the same as nec or nec32, is it scheduled to be added to
> ir-ctl in the near future?

Please let me know how you get on with the above.

Thanks

Sean
