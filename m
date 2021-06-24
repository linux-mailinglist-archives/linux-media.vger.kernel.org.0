Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6023D3B2B2A
	for <lists+linux-media@lfdr.de>; Thu, 24 Jun 2021 11:13:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231439AbhFXJQL (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 24 Jun 2021 05:16:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56648 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231424AbhFXJQK (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 24 Jun 2021 05:16:10 -0400
Received: from gofer.mess.org (gofer.mess.org [IPv6:2a02:8011:d000:212::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1BA16C061574;
        Thu, 24 Jun 2021 02:13:52 -0700 (PDT)
Received: by gofer.mess.org (Postfix, from userid 1000)
        id B5ED6C63B7; Thu, 24 Jun 2021 10:13:49 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=mess.org; s=2020;
        t=1624526029; bh=KUgP+ME1MWJ7e04FwEMW140Cs6G9wwty/yFb8PwlM1Q=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=o7VZ2d4qH4zCommCiqd1vL8NzbZm4wfNbNtvmuQQIhRvcQQCvlqKDwlNhbhdeY1ZZ
         f+Fr5Hz4pwHYWTX8FAAK38Rn6x/w8e0l/KfsvtQjIA3HLU7gCx4IxKJCJ+Bw288G92
         NViV/OQbeMpb0y7GTrLxfp0FHfeRNhtDwFdFkWUQ5MymW02wnvofkxCBmcsgAiJ/cY
         kV+fDaP6948g7NUb3rIqDD/uUhbdTO0HmxN6BEGUZKdTpXZCu6ePDxFnngUixFQo9D
         wMWkA3s+FOpwQcevTnMmFcDj+cd3pVbGXT+JCnD5013rztwXP9Wty8HMV5oeIWNDD/
         FDLeBVO2IrGHA==
Date:   Thu, 24 Jun 2021 10:13:49 +0100
From:   Sean Young <sean@mess.org>
To:     Johan Hovold <johan@kernel.org>
Cc:     Oliver Neukum <oneukum@suse.com>, linux-media@vger.kernel.org,
        linux-usb@vger.kernel.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jon Rhees <support@usbuirt.com>
Subject: Re: [PATCH v3 0/3] IR driver for USB-UIRT device
Message-ID: <20210624091349.GA7476@gofer.mess.org>
References: <cover.1620304986.git.sean@mess.org>
 <YJjrkhfN9Sgq6UX8@hovoldconsulting.com>
 <20210511103219.GA13769@gofer.mess.org>
 <YJ5cH1Z5MdZHE8HU@hovoldconsulting.com>
 <20210515092226.GA31801@gofer.mess.org>
 <YKI3vyOE8XmpNAuC@hovoldconsulting.com>
 <20210517103522.GA4644@gofer.mess.org>
 <YKZktqzkddh3amqX@hovoldconsulting.com>
 <35840cdac1dcb2808e98ebb57afeba352624d15c.camel@suse.com>
 <YNMyvCaZUIDOnSc9@hovoldconsulting.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YNMyvCaZUIDOnSc9@hovoldconsulting.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, Jun 23, 2021 at 03:10:20PM +0200, Johan Hovold wrote:
> Sorry about the late reply on this one too.
> 
> On Tue, May 25, 2021 at 02:25:49PM +0200, Oliver Neukum wrote:
> > Am Donnerstag, den 20.05.2021, 15:31 +0200 schrieb Johan Hovold:
> 
> > > Isn't that already handled by lircd using uinput?
> > 
> > The problem with that reasoning, though it is true, is
> > 
> > 1) We would need to remove a lot of subsystems if we took that
> > to the logical conclusion. 
> 
> Removing code is always nice. ;)

So rather than adding hotplug to serdev, we should remove line-discipline,
serdev, and serio and all its drivers from the kernel? This is taking
your own argument and applying it your code.

> > 2) It makes runtime PM much harder
> 
> Possibly, depends on the bus and device.
> 
> > 3) We end up with two classes of LIRC devices
> 
> We already do, right? That's kind of my point since we have lircd
> supporting uinput.

This is not an either-or situation, lircd is the "old" solution which is
slowing being supplanted with rc-core. All the new keymaps are rc-core and
do not work with lircd. The new rc-core tooling (in the v4l-utils package) 
does not work with lircd. lircd hasn't had any real patches merged for years
now.

There is whole new tooling in the works for rc-core which is not compatible
with lircd.

> > > I hear you, but we still need to have those discussions from time to
> > > time to make sure our architecture is sane. One of the problems today
> > > with the kernel development process appears to be that too few
> > > questions
> > > are asked. If it builds, ship it...
> > 
> > Indeed, so, could we force a line discipline on a device on the kernel
> > level? Code duplication is bad.
> 
> Not sure I understand what you have mind here. serdev is sort of a
> line-discipline which we'd "force" on a device if there's a matching
> description in devicetree, while line disciplines always need to be
> instantiated by user space. Or are you referring to ldisc/serdev code
> reuse?

I am pretty sure Oliver is suggesting that all ldisc/serdev code in
the kernel is duplication of code which can be done in userspace, by your
own argument.

> > > But I think I've got that point across by now.
> > 
> > Yes and and we need to think about the conclusion we draw from
> > that point. It seems to me that an architecture that pushes data
> > through the whole tty layer into a demon, then through uinput
> > is definitely not elegant.
> 
> The elegant answer is serdev, but it does not yet support the features
> needed in this case (i.e. hotplugging).
> 
> Since we already support user-space drivers for these devices, I see
> nothing wrong with implementing support for another one in user space
> unless there are strong reasons against doing so (e.g. performance,
> pm or usability). But if uinput works then great, we're done.

As discussed lircd has terrible latency, and lircd is out of date and
unmaintained and does not work with modern tooling and keymaps.

Also essentially your saying that any input device that connects to a
serial port should be done in user space. There are a ton of kernel
drivers doing exactly that, and that is why serio exists in the first
place.


Sean
