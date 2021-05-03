Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C195237183A
	for <lists+linux-media@lfdr.de>; Mon,  3 May 2021 17:44:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230424AbhECPpL (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 3 May 2021 11:45:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38250 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230416AbhECPpK (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 3 May 2021 11:45:10 -0400
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com [IPv6:2a00:1450:4864:20::231])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 69618C06174A
        for <linux-media@vger.kernel.org>; Mon,  3 May 2021 08:44:16 -0700 (PDT)
Received: by mail-lj1-x231.google.com with SMTP id s25so7365427lji.0
        for <linux-media@vger.kernel.org>; Mon, 03 May 2021 08:44:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=CMnE7uVlbVVh6/ZzHL0VV11oRxaKyvvKQkNdewiYDB8=;
        b=lYEIlwv1+A17m5EG7T5DW++9pQxNoHRv5PpAm3F7C/Tn+Ex72NZBb2yLiCG/84FkMX
         ejRf0ZsBhje/KguMhGbb/AF+4u/ydi0O9yj1hxs8q6qcDvo2EHQlygvqS+f8SBJVZHcy
         RetgVXIFjbjlOo74tb7zgOaYiXB+2ep8a6eLQ14FJ5R/OOIdNy7NntEH7+Ap9tgwO9vl
         ke5/X42MOp957RavYbkNMaNbqL/NSxwHoLTXLPNa92/BES5j1dAhwzzq9nNKa4ZlZT4F
         vWTSktK09E5BjRwiXcKm24LIDBmP/8fn2YX8VHyGSsAIMj91fX3Wzuphj9V1xEa+10aV
         esIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=CMnE7uVlbVVh6/ZzHL0VV11oRxaKyvvKQkNdewiYDB8=;
        b=FbJCBXsZDTu4MmY8HTGqQqNePGNAC/HQFkWOiPxFJMbyrZ3++SRF2maDh2Ty1XZvp1
         D70Qs8hbnvbGZZcwwWlrld6h5bFHMAAsb2bRo+wpKG9vX2bfLTUGrphwui/vai4f4xlm
         e3Qew1lQv+zk2IWxnXWUE6SDw88LzvYN3SAbLGSvN3L2wWdvDWWcOFevWOYtMIrrAGKM
         YbGc2J04Ex+pEs7TxxOryA3LMl0Klc4xeqg58YvzwBD0zWHkoCHMCKA+w8IwZti05IZ8
         Kjfgj/bs7xvxYo6HL/QIRpASMwVfFNBcNhrmLaJN3TT5Od6axjwFEKz7uXe0xyhbpKrP
         53sA==
X-Gm-Message-State: AOAM532bKKPJ1WYv3D/Bu7VQCT+B+EPbnTBIlGaeYlGUze2bA1ZHlBvt
        yj4tbtKnG8HILlAE3c4U6BwURXB5hEG4YwbE5/pvYyjgOZTp+w==
X-Google-Smtp-Source: ABdhPJyJvFxg/V4ZUAGCGLeyMapdd3OKwQ/3OqqNsE5SCdwF7n61fupFOtB5N6vhurD5zV9XdQPNZupWq+e4bBJE4EM=
X-Received: by 2002:a2e:9b0c:: with SMTP id u12mr14025016lji.506.1620056654942;
 Mon, 03 May 2021 08:44:14 -0700 (PDT)
MIME-Version: 1.0
References: <CAN2W0iNOsa6GYK28Vz=DmkyjY72H_bq=8EUkzFuy0_p9ZVms4A@mail.gmail.com>
 <20210503092005.GB14939@gofer.mess.org>
In-Reply-To: <20210503092005.GB14939@gofer.mess.org>
From:   Chris McCrae <chrismccraeworks@gmail.com>
Date:   Mon, 3 May 2021 11:44:04 -0400
Message-ID: <CAN2W0iME8VCdP=KdcH8PW7ZfEOdQJicKWQmE675-h3cd2=D1cA@mail.gmail.com>
Subject: Re: Asus PN62S vs PN50 - ITE8708
To:     Sean Young <sean@mess.org>
Cc:     linux-media@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Thanks for answering the call Sean.

On Mon, 3 May 2021 at 05:20, Sean Young <sean@mess.org> wrote:
>
> Hi Chris,
>
> On Fri, Apr 30, 2021 at 07:37:10PM -0400, Chris McCrae wrote:
> > Recently acquired an Asus PN62S (Intel) as a media centre frontend
> > (currently testing with Xubuntu 20.04 and a 5.10 kernel, and the most
> > current BIOS available).  Having an integrated IR was part of the
> > selling features.  However, getting it to be recognized by my system
> > has become a challenge that I am getting obsessed with.  There's very
> > little to find online on this device that is current, but there has
> > been some recent conversation on this list about the same device, on a
> > related machine, the PN50 (AMD).  I'm hoping that the knowledge here
> > may lead to a solution for my issue.
> >
> > I can provide more detail on request, but at the moment I am focusing
> > on the DSDT as a possible suspect.  I do not have the 16 byte issue
> > that the PN50 experiences.  Mine is defined as 8 bytes, which is
> > compatible with the ite-cir driver.  My issue is that there appears to
> > be no attempt to bind the device to the driver (but it is visible in
> > lsmod)... no messages about the driver in dmesg at all.  My thought is
> > that the definition of the device in DSDT may somehow give it enough
> > information (ITE8708) to know the driver could be needed, but not the
> > correct information to make it work.
> >
> > An earlier message provided only part of the device definition in DSDT
> > for the PN50.  I would like to be able to see the full definition for
> > it from the PN50, to see if anything is significantly different.
> > Ideally, if I had the full DSDT as a starting point, I could compare
> > other areas such as motherboard resources.
>
> It would be great if we could see the entries for the IR device in your
> DSDT. There is a guide here https://wiki.archlinux.org/title/DSDT on
> how to do that.
>
Here the full device from the DSDT:

            Device (CR00)
            {
                Name (_ADR, Zero)  // _ADR: Address
                Name (VBAN, 0x0680)
                Name (VIRQ, 0x0A)
                Name (UIDN, Zero)
                Name (_HID, EisaId ("ITE8708"))  // _HID: Hardware ID
                Method (_UID, 0, NotSerialized)  // _UID: Unique ID
                {
                    Return (UIDN) /* \_SB_.PCI0.CR00.UIDN */
                }

                Method (_STA, 0, Serialized)  // _STA: Status
                {
                    If ((CIRE == Zero))
                    {
                        Return (Zero)
                    }
                    Return (0x0F)
                }

                Method (_CRS, 0, Serialized)  // _CRS: Current Resource Settings
                {
                    Name (BUF0, ResourceTemplate ()
                    {
                        IO (Decode16,
                            0x0000,             // Range Minimum
                            0x0000,             // Range Maximum
                            0x01,               // Alignment
                            0x08,               // Length
                            _Y10)
                        IRQNoFlags (_Y11)
                            {}
                        DMA (Compatibility, NotBusMaster, Transfer8, )
                            {}
                    })
                    CreateWordField (BUF0,
\_SB.PCI0.CR00._CRS._Y10._MIN, IOPL)  // _MIN: Minimum Base Address
                    CreateWordField (BUF0,
\_SB.PCI0.CR00._CRS._Y10._MAX, IOPH)  // _MAX: Maximum Base Address
                    CreateWordField (BUF0,
\_SB.PCI0.CR00._CRS._Y11._INT, IRQ)  // _INT: Interrupts
                    IOPL = VBAN /* \_SB_.PCI0.CR00.VBAN */
                    IOPH = VBAN /* \_SB_.PCI0.CR00.VBAN */
                    IRQ = (One << VIRQ) /* \_SB_.PCI0.CR00.VIRQ */
                    Return (BUF0) /* \_SB_.PCI0.CR00._CRS.BUF0 */
                }
            }

> Thanks
>
> Sean

I've been using the latest ACPI Spec (6.3) to better comprehend the
macros, and what they should produce.  Running the DSDT through
acpiexec for \_SB.PCI0.CR00._CRS gives:

- execute \_SB.PCI0.CR00._CRS
Evaluating \_SB.PCI0.CR00._CRS
0x1 Outstanding allocations after evaluation of \_SB.PCI0.CR00._CRS
Evaluation of \_SB.PCI0.CR00._CRS returned object 0x562c4e9a9c90,
external buffer length 28
[Buffer] Length 10 =   0000: 47 01 80 06 80 06 01 08 22 00 04 2A 00 00
79 00  // G......."..*..y.

I'm still a little unclear on the first byte (47) and the last two (79
00), generated presumably by ResourceTemplate(), but the rest seem to
match the expected results based on the inputs.  Aside from the
obvious difference in the address range length compared to the PN50's
BUF0, which seems to be the PN50's problem, the definition of BUF0 is
consistent.  I've even recompiled the DSDT with a length of 0x10 just
to see if that made a difference, and it doesn't.  Still no sign of
the driver in dmesg.  Although it would be nice to see the full CR00
definition for the PN50, it seems less likely that the problem lies
here.

I've tried various acpi kernel debugging settings, but easily get
swamped with output.  Is there a process path somewhere that can be
followed to understand how the device goes through the ACPI process
and eventually gets picked up by the kernel?  I still feel like the
problem precedes the kernel's involvement.  The kernel obviously has
some degree of awareness of the DSDT entry, because I can find :

/sys/devices/LNXSYSTM:00/LNXSYBUS:00/PNP0A08:00/ITE8708:00/

The status is correct (0x0F), but under the physical_node, I have no
'resources' entry.  Should there be one?  I have a 'resource' file,
but it only returns zeroes.

And instead of being linked to ite_cir (which is showing in lsmod, but
not used by anything), the driver ->
../../../bus/pci/drivers/skl_uncore

To me, that seems like it's processing what it has been presented, but
I've been wrong before.  I'm open for directions on where to
investigate next.

Thanks,

Chris
