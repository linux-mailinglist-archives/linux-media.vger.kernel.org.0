Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 57CF91CD218
	for <lists+linux-media@lfdr.de>; Mon, 11 May 2020 08:51:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728030AbgEKGvV (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 11 May 2020 02:51:21 -0400
Received: from mail.kernel.org ([198.145.29.99]:57186 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726438AbgEKGvV (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 11 May 2020 02:51:21 -0400
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 508272075E;
        Mon, 11 May 2020 06:51:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1589179881;
        bh=Ex/q2HLfHwiYEB6FHWoOBEqEx2J/3/iQUzy2/kEnzX4=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=k6T4b8RlQzpxGh7XiL504K3yQ9OkM73Df8VH51HCTmanBl7QO8k7jujETqEMBY/UW
         v9eqQRoJEWkM3JoVmPKEJMQ1MIx5KSVVW2zcEDu6DVi2rbvCAn0uTj/HN4I5Zgtz3D
         0003e0jaTyLiHpEybm3/wRisv9mxYibI4Zt+gWrA=
Date:   Mon, 11 May 2020 08:51:18 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Sean Young <sean@mess.org>
Cc:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        linux-input@vger.kernel.org, linux-media@vger.kernel.org
Subject: Re: [PATCH 2/3] input: serio: allow more than one byte to be sent at
 once
Message-ID: <20200511065118.GA1293993@kroah.com>
References: <20200507135337.2343-1-sean@mess.org>
 <20200507135337.2343-2-sean@mess.org>
 <20200507202546.GM89269@dtor-ws>
 <20200507205918.GA13370@gofer.mess.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200507205918.GA13370@gofer.mess.org>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, May 07, 2020 at 09:59:18PM +0100, Sean Young wrote:
> On Thu, May 07, 2020 at 01:25:46PM -0700, Dmitry Torokhov wrote:
> > On Thu, May 07, 2020 at 02:53:36PM +0100, Sean Young wrote:
> > > serio drivers can only send one byte at a time. If the underlying tty
> > > is a usb serial port, then each byte will be put into separate usb
> > > urbs, which is not efficient.
> > > 
> > > Additionally, the Infrared Toy device refuses to transmit IR if the
> > > IR data is sent one byte at a time. IR data is formatted in u16 values,
> > > and the firmware expects complete u16 values in the packet.
> > > 
> > > https://github.com/DangerousPrototypes/USB_IR_Toy/blob/master/Firmware-main/IRs.c#L240
> > 
> > Ummm, serial protocol data size is at most 9 bits so I have no earthly
> > idea how they expect to get 16.
> 
> serio is a layer on top several serial protocols, including ttys. ttys allow
> more than one byte to be written at a time, see struct tty_operations:
> 
>         int  (*write)(struct tty_struct * tty,
>                       const unsigned char *buf, int count);
> 
> ttys would be very inefficient if you could only write one byte at a time,
> and they are very serial.
> 
> This patch exposes the underlying tty write() functionality to serio. When
> the underlying tty is a usb serial port this makes for far fewer usb packets
> being used to send the same data, and fixes my driver problem, and it
> would reduce the number of calls in a few other cases too.
> 
> I'm happy to rework the patch if there are comments on the style or
> approach.

Why not just use the ir-usb.c driver for this device instead?

thanks,

greg k-h
