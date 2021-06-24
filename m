Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7D9FC3B2B9F
	for <lists+linux-media@lfdr.de>; Thu, 24 Jun 2021 11:41:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232011AbhFXJns (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 24 Jun 2021 05:43:48 -0400
Received: from mail.kernel.org ([198.145.29.99]:55976 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231970AbhFXJnr (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 24 Jun 2021 05:43:47 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id AF14F613F7;
        Thu, 24 Jun 2021 09:41:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1624527688;
        bh=lZOcRIF3+B4FcwIfVBPRt5XbFgWx1ZZSqOL4AsLKvIo=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=bPT1txauEg14L7DsCFdH16wBodBrNqojhISJZ9EmtcbRRVZeAMOb0rkA+Z6G/PwMj
         jmWkHiQrc67LNYWw1HvXqNqcvgVGHxzWKcksEzbmfPXR5TmqgdofjzX7xLf9G7A2it
         j/VyDFr6PaaS32v5dvVu7OZF3r6F33tdc58f7fSaFRuCOAm6MNRJoAebcH2NsbNl48
         rWI2me/i2ExQJkd4vLdbh4D6ahR7FxHAnH2zY/pCio3zpfseGR6A3dwe80Wj1GJ+0A
         6c4WMMrXr3Wsg+B70XlFUqNjRQdHvkTDO+w5jO8LkyD8u3aZXj2PaDI2VPwfSiZcj2
         UD5KhyTU2ehHQ==
Received: from johan by xi.lan with local (Exim 4.94.2)
        (envelope-from <johan@kernel.org>)
        id 1lwLrU-0006nz-5P; Thu, 24 Jun 2021 11:41:28 +0200
Date:   Thu, 24 Jun 2021 11:41:28 +0200
From:   Johan Hovold <johan@kernel.org>
To:     Sean Young <sean@mess.org>
Cc:     Oliver Neukum <oneukum@suse.com>, linux-media@vger.kernel.org,
        linux-usb@vger.kernel.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jon Rhees <support@usbuirt.com>
Subject: Re: [PATCH v3 0/3] IR driver for USB-UIRT device
Message-ID: <YNRTSLEHzFKU1KOa@hovoldconsulting.com>
References: <YJjrkhfN9Sgq6UX8@hovoldconsulting.com>
 <20210511103219.GA13769@gofer.mess.org>
 <YJ5cH1Z5MdZHE8HU@hovoldconsulting.com>
 <20210515092226.GA31801@gofer.mess.org>
 <YKI3vyOE8XmpNAuC@hovoldconsulting.com>
 <20210517103522.GA4644@gofer.mess.org>
 <YKZktqzkddh3amqX@hovoldconsulting.com>
 <35840cdac1dcb2808e98ebb57afeba352624d15c.camel@suse.com>
 <YNMyvCaZUIDOnSc9@hovoldconsulting.com>
 <20210624091349.GA7476@gofer.mess.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210624091349.GA7476@gofer.mess.org>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, Jun 24, 2021 at 10:13:49AM +0100, Sean Young wrote:
> On Wed, Jun 23, 2021 at 03:10:20PM +0200, Johan Hovold wrote:
> > Sorry about the late reply on this one too.
> > 
> > On Tue, May 25, 2021 at 02:25:49PM +0200, Oliver Neukum wrote:
> > > Am Donnerstag, den 20.05.2021, 15:31 +0200 schrieb Johan Hovold:
> > 
> > > > Isn't that already handled by lircd using uinput?
> > > 
> > > The problem with that reasoning, though it is true, is
> > > 
> > > 1) We would need to remove a lot of subsystems if we took that
> > > to the logical conclusion. 
> > 
> > Removing code is always nice. ;)
> 
> So rather than adding hotplug to serdev, we should remove line-discipline,
> serdev, and serio and all its drivers from the kernel? This is taking
> your own argument and applying it your code.

Not at all. Not everything can be done in user space, but some things
can.

> > > 3) We end up with two classes of LIRC devices
> > 
> > We already do, right? That's kind of my point since we have lircd
> > supporting uinput.
> 
> This is not an either-or situation, lircd is the "old" solution which is
> slowing being supplanted with rc-core. All the new keymaps are rc-core and
> do not work with lircd. The new rc-core tooling (in the v4l-utils package) 
> does not work with lircd. lircd hasn't had any real patches merged for years
> now.
> 
> There is whole new tooling in the works for rc-core which is not compatible
> with lircd.

Sure, you already explained that. I was just asking (earlier) why you
didn't use the infrastructure that's already in place. If there are good
reasons for not doing so then fine. 

> > > > I hear you, but we still need to have those discussions from time to
> > > > time to make sure our architecture is sane. One of the problems today
> > > > with the kernel development process appears to be that too few
> > > > questions
> > > > are asked. If it builds, ship it...
> > > 
> > > Indeed, so, could we force a line discipline on a device on the kernel
> > > level? Code duplication is bad.
> > 
> > Not sure I understand what you have mind here. serdev is sort of a
> > line-discipline which we'd "force" on a device if there's a matching
> > description in devicetree, while line disciplines always need to be
> > instantiated by user space. Or are you referring to ldisc/serdev code
> > reuse?
> 
> I am pretty sure Oliver is suggesting that all ldisc/serdev code in
> the kernel is duplication of code which can be done in userspace, by your
> own argument.

See above.

> > > > But I think I've got that point across by now.
> > > 
> > > Yes and and we need to think about the conclusion we draw from
> > > that point. It seems to me that an architecture that pushes data
> > > through the whole tty layer into a demon, then through uinput
> > > is definitely not elegant.
> > 
> > The elegant answer is serdev, but it does not yet support the features
> > needed in this case (i.e. hotplugging).
> > 
> > Since we already support user-space drivers for these devices, I see
> > nothing wrong with implementing support for another one in user space
> > unless there are strong reasons against doing so (e.g. performance,
> > pm or usability). But if uinput works then great, we're done.
> 
> As discussed lircd has terrible latency, and lircd is out of date and
> unmaintained and does not work with modern tooling and keymaps.
> 
> Also essentially your saying that any input device that connects to a
> serial port should be done in user space. There are a ton of kernel
> drivers doing exactly that, and that is why serio exists in the first
> place.

I'm not, again see above. I'm saying that we should not make one-off
copies of serial drivers if we can avoid it.

In this case the limitations of lircd and the lack of hotplugging in
serdev may be a sufficient reason for making an exception. As we've
already discussed.

Johan
