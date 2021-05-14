Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4DEC1380844
	for <lists+linux-media@lfdr.de>; Fri, 14 May 2021 13:16:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231750AbhENLR7 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 14 May 2021 07:17:59 -0400
Received: from mail.kernel.org ([198.145.29.99]:55034 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231968AbhENLR6 (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Fri, 14 May 2021 07:17:58 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 1E5FF61355;
        Fri, 14 May 2021 11:16:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1620991007;
        bh=3VWC1aueGlgxQBGe1RN+FHzYDJiVGhWhswGxph1UwXE=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=gNm1RNo+SemzqMkn/iCCFeKdU0GmfJrkAxKLJjilakXhkdVlFlz8epGU9h9pBUIEn
         b0VRi882FNPPRdd0gQ2WqVmnLThK9DQPsGw9azMFGX49docfZbw9SKXi7Osod3jfFn
         7IuBljQQ6U70h/WqrYg2gWez5hgBElmg/G0qm+ViOErpcj0ki+PnkHI9XOmHykh7LA
         wvhSmF6rw9nCaOYD2GGvWNsfywZNSgdhDv3Q+og35cEKeUMMFj35mhj33ow8yr/Ghc
         QA8EwPCPkHsDJDv5e/O8D8s2T8M6amVqfy8QROrHFylx1DPow/8o0v96+XEThmKp9e
         G12/V8WeobImA==
Received: from johan by xi.lan with local (Exim 4.94.2)
        (envelope-from <johan@kernel.org>)
        id 1lhVoF-0000qJ-Qb; Fri, 14 May 2021 13:16:47 +0200
Date:   Fri, 14 May 2021 13:16:47 +0200
From:   Johan Hovold <johan@kernel.org>
To:     Sean Young <sean@mess.org>
Cc:     linux-media@vger.kernel.org, linux-usb@vger.kernel.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jon Rhees <support@usbuirt.com>,
        Oliver Neukum <oneukum@suse.com>
Subject: Re: [PATCH v3 0/3] IR driver for USB-UIRT device
Message-ID: <YJ5cH1Z5MdZHE8HU@hovoldconsulting.com>
References: <cover.1620304986.git.sean@mess.org>
 <YJjrkhfN9Sgq6UX8@hovoldconsulting.com>
 <20210511103219.GA13769@gofer.mess.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210511103219.GA13769@gofer.mess.org>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, May 11, 2021 at 11:32:19AM +0100, Sean Young wrote:
> On Mon, May 10, 2021 at 10:15:14AM +0200, Johan Hovold wrote:
> > On Thu, May 06, 2021 at 01:44:52PM +0100, Sean Young wrote:
> > > This is a new rc-core driver for the USB-UIRT which you can see here
> > > http://www.usbuirt.com/
> > > 
> > > This device is supported in lirc, via the usb serial kernel driver. This
> > > driver is both for rc-core, which means it can use kernel/BPF decoding
> > > ec. Also this implement is superior because it can:
> > >  - support learning mode
> > >  - setting transmit carrier
> > >  - larger transmits using streaming tx command
> > 
> > This looks like something which should have been implemented as a
> > line-discipline or serdev driver instead of reimplementing a minimal
> > on-off ftdi driver and tying it closely to the RC subsystem.
> 
> The device is an infrared device, I'm not sure what it is lost by
> doing it this way. The "minimal on-off ftdi driver" is super trivial.

It's still code duplication (and I meant to say "one-off" above").

What is preventing you from supporting the above functionality through
lirc?

> > Why can't you just add support for the above features to whatever
> > subsystem is managing this device today?
> > 
> > Serdev still doesn't support hotplugging unfortunately so that route may
> > take a bit more work.
> 
> There seems to be at least three ways of attaching drivers to serial
> devices: serio, serdev, and line-discipline. All seem to have limitations,
> as you say none of them provide a way of hotplugging devices without
> user-space attaching them through an ioctl or so.

serio is also a line-discipline driver, which unlike serdev needs to be
set up by user space.

And the problem with serdev is that it does not (yet) support
hotplugging (specifically hangups) so it can't be enabled for USB serial
just yet.

> If you want to go down this route, then ideally you'd want a quirk on
> fdti saying "attach usb-uirt serdev device to this pid/vid". Considering
> module dependencies, I don't know how that could work without again
> userspace getting involved.

We'd just reuse or add another matching mechanism for USB devices. This
can be handled without user-space interaction just fine as long as you
have a dedicated device id as you do here.

> Getting userspace involved seem like a big song and dance because the
> device uses an fdti device, even though it's not a serial port because
> it's hardwired for infrared functions, no db9 connector in sight.

Far from every USB serial device have a db9 connector (e.g. modems,
barcode scanners, development board consoles, etc.) and you still have a
UART in your device.

In principle reimplementing a one-off ftdi driver is wrong but since
parts of the infrastructure needed to avoid this is still missing it may
be acceptable, especially if you can't get this to work with lirc.

Johan
