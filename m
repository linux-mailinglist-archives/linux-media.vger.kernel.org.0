Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4C6D437A4A3
	for <lists+linux-media@lfdr.de>; Tue, 11 May 2021 12:32:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231294AbhEKKd1 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 11 May 2021 06:33:27 -0400
Received: from gofer.mess.org ([88.97.38.141]:45825 "EHLO gofer.mess.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231272AbhEKKd1 (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 11 May 2021 06:33:27 -0400
Received: by gofer.mess.org (Postfix, from userid 1000)
        id 62A88C6387; Tue, 11 May 2021 11:32:19 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=mess.org; s=2020;
        t=1620729139; bh=3qZe47ccXZi94QbD/AGEgaZol/0JCzTRr/e1v62Fbb4=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=FAc2mVIpLJOw0xAqKhsxrAh1zP0zAawVbasoE36G7Pb7AR5kK7PijluWH16trFxTb
         IaD/SBCGTlfqIW+aZmh1+RJwLPFmxYiX7qWMxGWmPXVBYohVXVSnToOPhAlW3w/nql
         rVTjxD7OYsnk35uPBLzx+qqiuluaKc2iJS8ITYMheUwRn4deDQHwOzP2ftvGOgWWpe
         eKhtUaoIv7FSMiT1BqQm35H5eOZ+Fa4Nb6EJcj2M+WG4MyWTd8YPnDsD7E9GRk6fWp
         2yefxvhmduFixjF5AWtFIyyNeheTi29fMEcC76NNT1pT2VOUx7djnskIAOA29ppxbM
         ke0B4+gxaejXw==
Date:   Tue, 11 May 2021 11:32:19 +0100
From:   Sean Young <sean@mess.org>
To:     Johan Hovold <johan@kernel.org>
Cc:     linux-media@vger.kernel.org, linux-usb@vger.kernel.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jon Rhees <support@usbuirt.com>,
        Oliver Neukum <oneukum@suse.com>
Subject: Re: [PATCH v3 0/3] IR driver for USB-UIRT device
Message-ID: <20210511103219.GA13769@gofer.mess.org>
References: <cover.1620304986.git.sean@mess.org>
 <YJjrkhfN9Sgq6UX8@hovoldconsulting.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YJjrkhfN9Sgq6UX8@hovoldconsulting.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, May 10, 2021 at 10:15:14AM +0200, Johan Hovold wrote:
> On Thu, May 06, 2021 at 01:44:52PM +0100, Sean Young wrote:
> > This is a new rc-core driver for the USB-UIRT which you can see here
> > http://www.usbuirt.com/
> > 
> > This device is supported in lirc, via the usb serial kernel driver. This
> > driver is both for rc-core, which means it can use kernel/BPF decoding
> > ec. Also this implement is superior because it can:
> >  - support learning mode
> >  - setting transmit carrier
> >  - larger transmits using streaming tx command
> 
> This looks like something which should have been implemented as a
> line-discipline or serdev driver instead of reimplementing a minimal
> on-off ftdi driver and tying it closely to the RC subsystem.

The device is an infrared device, I'm not sure what it is lost by
doing it this way. The "minimal on-off ftdi driver" is super trivial.

> Why can't you just add support for the above features to whatever
> subsystem is managing this device today?
> 
> Serdev still doesn't support hotplugging unfortunately so that route may
> take a bit more work.

There seems to be at least three ways of attaching drivers to serial
devices: serio, serdev, and line-discipline. All seem to have limitations,
as you say none of them provide a way of hotplugging devices without
user-space attaching them through an ioctl or so.

If you want to go down this route, then ideally you'd want a quirk on
fdti saying "attach usb-uirt serdev device to this pid/vid". Considering
module dependencies, I don't know how that could work without again
userspace getting involved.

Getting userspace involved seem like a big song and dance because the
device uses an fdti device, even though it's not a serial port because
it's hardwired for infrared functions, no db9 connector in sight.


Sean
