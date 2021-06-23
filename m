Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F3B9F3B1ACC
	for <lists+linux-media@lfdr.de>; Wed, 23 Jun 2021 15:10:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230263AbhFWNMk (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 23 Jun 2021 09:12:40 -0400
Received: from mail.kernel.org ([198.145.29.99]:38466 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230019AbhFWNMj (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 23 Jun 2021 09:12:39 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id EA51E61076;
        Wed, 23 Jun 2021 13:10:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1624453822;
        bh=3GHxrS4L3QbnAx1faho6OvaJPejPcxHg6A6g5Y1fwZQ=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=rtGWujC8sqqmwvbon2nnZVkOH58WzoegDdx7+JjZ4ZxKXW0dp3f3qL0HalFYmA5ym
         MnXkLs/pwm1vUXyptVRcNC02cnwB53wqXlTI/0cVe8vQ9RQFkWHGwyBFacPAbYGZmJ
         S+As5O0Rinirkosnyc2ZDUqrpeUbzab+CcCRG4b9X3LyE9kTxqXGjtv+B0GAwlZvAB
         9XB97S0ejdNebsqAf+xG1OXzuybYA79e00iEIXUXxQ1Nr996DK6NKFnVawIvGSAWsc
         adgcYPmj/l7es0efbB98vl2ZVGwBL8dMhYXrYi00vmfP8f1R6sWb+5pNoSdO0FOOqy
         FpdjS5yElBfPA==
Received: from johan by xi.lan with local (Exim 4.94.2)
        (envelope-from <johan@kernel.org>)
        id 1lw2e4-0007Ej-GC; Wed, 23 Jun 2021 15:10:21 +0200
Date:   Wed, 23 Jun 2021 15:10:20 +0200
From:   Johan Hovold <johan@kernel.org>
To:     Oliver Neukum <oneukum@suse.com>
Cc:     Sean Young <sean@mess.org>, linux-media@vger.kernel.org,
        linux-usb@vger.kernel.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jon Rhees <support@usbuirt.com>
Subject: Re: [PATCH v3 0/3] IR driver for USB-UIRT device
Message-ID: <YNMyvCaZUIDOnSc9@hovoldconsulting.com>
References: <cover.1620304986.git.sean@mess.org>
 <YJjrkhfN9Sgq6UX8@hovoldconsulting.com>
 <20210511103219.GA13769@gofer.mess.org>
 <YJ5cH1Z5MdZHE8HU@hovoldconsulting.com>
 <20210515092226.GA31801@gofer.mess.org>
 <YKI3vyOE8XmpNAuC@hovoldconsulting.com>
 <20210517103522.GA4644@gofer.mess.org>
 <YKZktqzkddh3amqX@hovoldconsulting.com>
 <35840cdac1dcb2808e98ebb57afeba352624d15c.camel@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <35840cdac1dcb2808e98ebb57afeba352624d15c.camel@suse.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Sorry about the late reply on this one too.

On Tue, May 25, 2021 at 02:25:49PM +0200, Oliver Neukum wrote:
> Am Donnerstag, den 20.05.2021, 15:31 +0200 schrieb Johan Hovold:

> > Isn't that already handled by lircd using uinput?
> 
> The problem with that reasoning, though it is true, is
> 
> 1) We would need to remove a lot of subsystems if we took that
> to the logical conclusion. 

Removing code is always nice. ;)

> 2) It makes runtime PM much harder

Possibly, depends on the bus and device.

> 3) We end up with two classes of LIRC devices

We already do, right? That's kind of my point since we have lircd
supporting uinput.

> > I hear you, but we still need to have those discussions from time to
> > time to make sure our architecture is sane. One of the problems today
> > with the kernel development process appears to be that too few
> > questions
> > are asked. If it builds, ship it...
> 
> Indeed, so, could we force a line discipline on a device on the kernel
> level? Code duplication is bad.

Not sure I understand what you have mind here. serdev is sort of a
line-discipline which we'd "force" on a device if there's a matching
description in devicetree, while line disciplines always need to be
instantiated by user space. Or are you referring to ldisc/serdev code
reuse?

> > But I think I've got that point across by now.
> 
> Yes and and we need to think about the conclusion we draw from
> that point. It seems to me that an architecture that pushes data
> through the whole tty layer into a demon, then through uinput
> is definitely not elegant.

The elegant answer is serdev, but it does not yet support the features
needed in this case (i.e. hotplugging).

Since we already support user-space drivers for these devices, I see
nothing wrong with implementing support for another one in user space
unless there are strong reasons against doing so (e.g. performance,
pm or usability). But if uinput works then great, we're done.

> So what else can we do, so that devices that are internally
> a serial chip plus additional stuff but externally unrelated
> devices? It looks to me we are in need of creativity beyond two options
> here.

Why? Leaving hotplugging aside for a moment, what is it that you cannot
do using either a serdev/ldisc driver or a user-space driver?

Johan
