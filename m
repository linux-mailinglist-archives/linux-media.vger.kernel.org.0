Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 435422799B5
	for <lists+linux-media@lfdr.de>; Sat, 26 Sep 2020 15:33:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726210AbgIZNdg (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 26 Sep 2020 09:33:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41648 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725208AbgIZNdf (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 26 Sep 2020 09:33:35 -0400
Received: from gofer.mess.org (gofer.mess.org [IPv6:2a02:8011:d000:212::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B7095C0613CE
        for <linux-media@vger.kernel.org>; Sat, 26 Sep 2020 06:33:33 -0700 (PDT)
Received: by gofer.mess.org (Postfix, from userid 1000)
        id 1DD5111A001; Sat, 26 Sep 2020 14:33:31 +0100 (BST)
Date:   Sat, 26 Sep 2020 14:33:30 +0100
From:   Sean Young <sean@mess.org>
To:     Michael Zimmermann <sigmaepsilon92@gmail.com>
Cc:     linux-media@vger.kernel.org
Subject: Re: ITE8708 on ASUS PN50 uses a 16 byte io region
Message-ID: <20200926133330.GA25499@gofer.mess.org>
References: <CAN9vWDL5rK_UCi-dTUG_Si7MbVSB4hVjvhs1-TEgvdGi+ajUvQ@mail.gmail.com>
 <20200926113038.GA23934@gofer.mess.org>
 <CAN9vWD+rsg49VzioyGZb7wOiLjmpgM1ku8EEotns2AiQGGTHHg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAN9vWD+rsg49VzioyGZb7wOiLjmpgM1ku8EEotns2AiQGGTHHg@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Michael,

On Sat, Sep 26, 2020 at 02:32:21PM +0200, Michael Zimmermann wrote:
> The acpi _HID name of the device is "ITE8708" and the device works
> with linux's ITE8708 config.
> 
> I can't find any datasheet or even product page for that IC so I don't
> know what footprint to look for when looking at the PCB - none of the
> bigger ICs near the IR sensor have that name on them and the smaller
> ones usually don't have any useful information printed on them.
> Additionally I can only access one side of the PCB because I couldn't
> figure out how to fully disassemble the device yet.

This is a super i/o device, so this handles stuff like serial ports,
parallel ports, floppy disks. All the legacy stuff you don't need any more.

There is a coreboot tool which can identify super i/o devices:

	https://www.coreboot.org/Superiotool

The super io devices I've seen are about 2cm by 3cm.

I could find a datasheet for the IT8712F on google.


Sean

PS. Please don't top post.

> 
> Thanks
> Michael
> 
> On Sat, Sep 26, 2020 at 1:30 PM Sean Young <sean@mess.org> wrote:
> >
> > On Sat, Sep 26, 2020 at 10:22:46AM +0200, Michael Zimmermann wrote:
> > > Hi,
> > >
> > > here's the resource descriptor from my DSDT:
> > > Name (BUF0, ResourceTemplate ()
> > > {
> > >     IO (Decode16,
> > >         0x0000,             // Range Minimum
> > >         0x0000,             // Range Maximum
> > >         0x01,               // Alignment
> > >         0x10,               // Length
> > >         _Y1A)
> > >     IRQNoFlags (_Y1B)
> > >         {}
> > >     DMA (Compatibility, NotBusMaster, Transfer8, )
> > >         {}
> > > })
> > >
> > > As you can see it uses 16 bytes for the IO region while the driver
> > > drivers/media/rc/ite-cir.c expects 8.
> > > I don't see any obvious reason why they do that since they only seem
> > > to write two words in there, and if I edit the DSDT to change the
> > > length from 0x10 to 0x8 the linux driver detects the device properly
> > > it works just fine.
> > >
> > > So is this a bug on ASUS' side or should we just accept longer regions
> > > for the same device type?
> >
> > So looking at the driver, some devices do have an io region of 16 and
> > others expect 8. See the io_region_size field of ite_dev_descs.
> >
> > So for ITE8708 the io_region_size is set to 8. Does your device really
> > have an ITE8708 or is the DSDT wrong?
> >
> >
> > Sean
