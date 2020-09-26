Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 37C2E279CBE
	for <lists+linux-media@lfdr.de>; Sun, 27 Sep 2020 00:03:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727529AbgIZWD0 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 26 Sep 2020 18:03:26 -0400
Received: from gofer.mess.org ([88.97.38.141]:35041 "EHLO gofer.mess.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726462AbgIZWDZ (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Sat, 26 Sep 2020 18:03:25 -0400
Received: by gofer.mess.org (Postfix, from userid 1000)
        id 817DB11A001; Sat, 26 Sep 2020 23:03:24 +0100 (BST)
Date:   Sat, 26 Sep 2020 23:03:24 +0100
From:   Sean Young <sean@mess.org>
To:     Michael Zimmermann <sigmaepsilon92@gmail.com>
Cc:     linux-media@vger.kernel.org
Subject: Re: ITE8708 on ASUS PN50 uses a 16 byte io region
Message-ID: <20200926220324.GA30485@gofer.mess.org>
References: <CAN9vWDL5rK_UCi-dTUG_Si7MbVSB4hVjvhs1-TEgvdGi+ajUvQ@mail.gmail.com>
 <20200926113038.GA23934@gofer.mess.org>
 <CAN9vWD+rsg49VzioyGZb7wOiLjmpgM1ku8EEotns2AiQGGTHHg@mail.gmail.com>
 <20200926133330.GA25499@gofer.mess.org>
 <CAN9vWDK5EF4-9-SXpMHObEesbU5-2O-dK8j9m4x2gvD5CgfpiQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAN9vWDK5EF4-9-SXpMHObEesbU5-2O-dK8j9m4x2gvD5CgfpiQ@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Sat, Sep 26, 2020 at 04:18:10PM +0200, Michael Zimmermann wrote:
> On Sat, Sep 26, 2020 at 3:33 PM Sean Young <sean@mess.org> wrote:
> >
> > Hi Michael,
> >
> > On Sat, Sep 26, 2020 at 02:32:21PM +0200, Michael Zimmermann wrote:
> > > The acpi _HID name of the device is "ITE8708" and the device works
> > > with linux's ITE8708 config.
> > >
> > > I can't find any datasheet or even product page for that IC so I don't
> > > know what footprint to look for when looking at the PCB - none of the
> > > bigger ICs near the IR sensor have that name on them and the smaller
> > > ones usually don't have any useful information printed on them.
> > > Additionally I can only access one side of the PCB because I couldn't
> > > figure out how to fully disassemble the device yet.
> >
> > This is a super i/o device, so this handles stuff like serial ports,
> > parallel ports, floppy disks. All the legacy stuff you don't need any more.
> >
> > There is a coreboot tool which can identify super i/o devices:
> >
> >         https://www.coreboot.org/Superiotool
> >
> > The super io devices I've seen are about 2cm by 3cm.
> >
> > I could find a datasheet for the IT8712F on google.
> >
> >
> > Sean
> >
> > PS. Please don't top post.
> 
> Hi Sean,
> 
> superiotool r4.12-2974-ga32df26ec07
> Found Aspeed AST2400 (id=0x00) at 0x2e
> 
> Which is kinda confusing. So either the superiotool detection is
> flawed or the PN50 actually has an AST2400 and is programmed to
> emulate the IR part of an IT8708F.
> Also, that thing seems beefy enough to be the systems EC, does that seem likely?

Strange. To be honest, I don't know.

So looking at the driver, there are four models supported. They have an
io_region_size of IT87_IOREG_LENGTH, IT8708_IOREG_LENGTH, and
IT8709_IOREG_LENGTH. That's 8, 8, and 2. The header file also has a size
of IT85_IOREG_LENGTH which is 16, but this is not used anywhere.

The documentation I can find for one IT85 model is:

http://www.recomb-omsk.ru/published/SC/html/scripts/doc/94689_datasheet_IT8512E_F_V0.4.1.pdf

As far as I can make out, if it was this device, the driver wouldn't work
at all.

I'm thinking the likely explanation is that the DSDT is wrong and we should
make the change as you originally suggested.


Sean


> 
> Thanks
> Michael
> >
> > >
> > > Thanks
> > > Michael
> > >
> > > On Sat, Sep 26, 2020 at 1:30 PM Sean Young <sean@mess.org> wrote:
> > > >
> > > > On Sat, Sep 26, 2020 at 10:22:46AM +0200, Michael Zimmermann wrote:
> > > > > Hi,
> > > > >
> > > > > here's the resource descriptor from my DSDT:
> > > > > Name (BUF0, ResourceTemplate ()
> > > > > {
> > > > >     IO (Decode16,
> > > > >         0x0000,             // Range Minimum
> > > > >         0x0000,             // Range Maximum
> > > > >         0x01,               // Alignment
> > > > >         0x10,               // Length
> > > > >         _Y1A)
> > > > >     IRQNoFlags (_Y1B)
> > > > >         {}
> > > > >     DMA (Compatibility, NotBusMaster, Transfer8, )
> > > > >         {}
> > > > > })
> > > > >
> > > > > As you can see it uses 16 bytes for the IO region while the driver
> > > > > drivers/media/rc/ite-cir.c expects 8.
> > > > > I don't see any obvious reason why they do that since they only seem
> > > > > to write two words in there, and if I edit the DSDT to change the
> > > > > length from 0x10 to 0x8 the linux driver detects the device properly
> > > > > it works just fine.
> > > > >
> > > > > So is this a bug on ASUS' side or should we just accept longer regions
> > > > > for the same device type?
> > > >
> > > > So looking at the driver, some devices do have an io region of 16 and
> > > > others expect 8. See the io_region_size field of ite_dev_descs.
> > > >
> > > > So for ITE8708 the io_region_size is set to 8. Does your device really
> > > > have an ITE8708 or is the DSDT wrong?
> > > >
> > > >
> > > > Sean
