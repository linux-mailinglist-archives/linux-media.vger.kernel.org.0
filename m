Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 21A472798B6
	for <lists+linux-media@lfdr.de>; Sat, 26 Sep 2020 13:30:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726239AbgIZLak (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 26 Sep 2020 07:30:40 -0400
Received: from gofer.mess.org ([88.97.38.141]:44197 "EHLO gofer.mess.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725208AbgIZLak (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Sat, 26 Sep 2020 07:30:40 -0400
X-Greylist: delayed 73847 seconds by postgrey-1.27 at vger.kernel.org; Sat, 26 Sep 2020 07:30:40 EDT
Received: by gofer.mess.org (Postfix, from userid 1000)
        id 2EB1611A001; Sat, 26 Sep 2020 12:30:39 +0100 (BST)
Date:   Sat, 26 Sep 2020 12:30:39 +0100
From:   Sean Young <sean@mess.org>
To:     Michael Zimmermann <sigmaepsilon92@gmail.com>
Cc:     linux-media@vger.kernel.org
Subject: Re: ITE8708 on ASUS PN50 uses a 16 byte io region
Message-ID: <20200926113038.GA23934@gofer.mess.org>
References: <CAN9vWDL5rK_UCi-dTUG_Si7MbVSB4hVjvhs1-TEgvdGi+ajUvQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAN9vWDL5rK_UCi-dTUG_Si7MbVSB4hVjvhs1-TEgvdGi+ajUvQ@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Sat, Sep 26, 2020 at 10:22:46AM +0200, Michael Zimmermann wrote:
> Hi,
> 
> here's the resource descriptor from my DSDT:
> Name (BUF0, ResourceTemplate ()
> {
>     IO (Decode16,
>         0x0000,             // Range Minimum
>         0x0000,             // Range Maximum
>         0x01,               // Alignment
>         0x10,               // Length
>         _Y1A)
>     IRQNoFlags (_Y1B)
>         {}
>     DMA (Compatibility, NotBusMaster, Transfer8, )
>         {}
> })
> 
> As you can see it uses 16 bytes for the IO region while the driver
> drivers/media/rc/ite-cir.c expects 8.
> I don't see any obvious reason why they do that since they only seem
> to write two words in there, and if I edit the DSDT to change the
> length from 0x10 to 0x8 the linux driver detects the device properly
> it works just fine.
> 
> So is this a bug on ASUS' side or should we just accept longer regions
> for the same device type?

So looking at the driver, some devices do have an io region of 16 and
others expect 8. See the io_region_size field of ite_dev_descs.

So for ITE8708 the io_region_size is set to 8. Does your device really
have an ITE8708 or is the DSDT wrong? 


Sean
