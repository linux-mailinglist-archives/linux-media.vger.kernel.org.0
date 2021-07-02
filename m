Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1DE653BA0D1
	for <lists+linux-media@lfdr.de>; Fri,  2 Jul 2021 15:00:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232438AbhGBNCc (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 2 Jul 2021 09:02:32 -0400
Received: from gofer.mess.org ([88.97.38.141]:50373 "EHLO gofer.mess.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232377AbhGBNCb (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Fri, 2 Jul 2021 09:02:31 -0400
Received: by gofer.mess.org (Postfix, from userid 1000)
        id 98A32C631A; Fri,  2 Jul 2021 13:59:57 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=mess.org; s=2020;
        t=1625230797; bh=2Q0WyKO9OMN5HkKntjd+3837+uPuZZBxFjRyp4pqwBs=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=bng/xXqIZyPiwrjfVrUq8c1CilVQgAr5HkBe3+of1JXY9Pfvkkv90o3WDDmaFbmLh
         THdo4+9Oo/7HO8U4cnoQzUBOQ7s02DqGVYXA6gtzrWER7HNk03ggzEmhKF+dGPAlVZ
         BjsEJDvfaUKGay4jlG+1sMc4eEgo08YTYQD5HuJihC6VGuPDI++GrDAu+HaR7XNPAQ
         J0xC0MfEWImNLNfjcQT4IQYn4hV5fd1aJsuu0aJWSqVA///8Ncw6QGYLogP4rNE7MX
         MDHVAlJ3xnoM6KfZ5k212VU6FQueBcZ2Sd6povcXsDLs71OnYngbXmR5CRHHPDqxm9
         YKeV9Z8I5Tdpw==
Date:   Fri, 2 Jul 2021 13:59:57 +0100
From:   Sean Young <sean@mess.org>
To:     Johan Hovold <johan@kernel.org>
Cc:     linux-media@vger.kernel.org, linux-usb@vger.kernel.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jon Rhees <support@usbuirt.com>,
        Oliver Neukum <oneukum@suse.com>
Subject: Re: [PATCH v5 0/2] IR driver for USB-UIRT device
Message-ID: <20210702125957.GA29760@gofer.mess.org>
References: <cover.1624006513.git.sean@mess.org>
 <YN7kF17pfhDr1ccy@hovoldconsulting.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YN7kF17pfhDr1ccy@hovoldconsulting.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Fri, Jul 02, 2021 at 12:01:59PM +0200, Johan Hovold wrote:
> On Fri, Jun 18, 2021 at 11:18:45AM +0100, Sean Young wrote:
> > This is a new rc-core driver for the USB-UIRT which you can see here
> > http://www.usbuirt.com/
> > 
> > This device is supported in lirc, via the usb serial kernel driver. This
> > driver is both for rc-core, which means it can use kernel/BPF decoding
> > ec. Also this implement is superior because it can:
> >  - support learning mode
> >  - setting transmit carrier
> >  - larger transmits using streaming tx command
> >  - Much better latency since it is a kernel driver
> 
> A ball-park number to back this claim up would be good here. Your driver
> sets the ftdi latency timer to 50 ms which adds quite a bit of latency
> for short packets (e.g. a single key press?) to begin with.

Yes, I'll do some measurements. This is based on observations with other
in kernel drivers.

> > Changes since v4:
> >  - Fixed clang warning/uninitialized variable usage
> >  - Some cosmetic changes
> > 
> > Changes since v3:
> >  - Review comments from Johan Hovold
> 
> In the future, please include some details on what changed also when
> addressing review feedback.

Right, good point. Will do.

> >  - Do not move the ftdi_sio.h file an copy FTDI_* definitions instead
> > 
> > Changes since v2:
> >  - Fixed race condition is disconnect
> >  - Removed superfluous kmalloc in short tx
> > 
> > Changes since v1:
> >  - Review comments from Oliver Neukum
> >  - Simplified wideband read function
> > 
> > Sean Young (2):
> >   media: rc: new driver for USB-UIRT device
> >   USB: serial: blacklist USB-UIRT when driver is selected
> > 
> >  drivers/media/rc/Kconfig      |  11 +
> >  drivers/media/rc/Makefile     |   1 +
> >  drivers/media/rc/uirt.c       | 744 ++++++++++++++++++++++++++++++++++
> >  drivers/usb/serial/ftdi_sio.c |   6 +-
> >  4 files changed, 760 insertions(+), 2 deletions(-)
> >  create mode 100644 drivers/media/rc/uirt.c
> 
> Johan

Thanks
Sean
