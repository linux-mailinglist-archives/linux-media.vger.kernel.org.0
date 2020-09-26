Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A0E75279A16
	for <lists+linux-media@lfdr.de>; Sat, 26 Sep 2020 16:18:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728504AbgIZOSY (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 26 Sep 2020 10:18:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48652 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726244AbgIZOSX (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 26 Sep 2020 10:18:23 -0400
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com [IPv6:2a00:1450:4864:20::241])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7B2DFC0613CE
        for <linux-media@vger.kernel.org>; Sat, 26 Sep 2020 07:18:23 -0700 (PDT)
Received: by mail-lj1-x241.google.com with SMTP id v23so4791111ljd.1
        for <linux-media@vger.kernel.org>; Sat, 26 Sep 2020 07:18:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=9XaAbmoQwq7P+JEmTtpggvZeLCOwlKL3K4UmLyhFjfE=;
        b=RHeDtMtUhNdoxd3w9u+lSWPmidW3xFiCzRQkjPp1ErqyFcph1MTIq24HF1j7hGi74D
         mdJVjx/b/icL3RQ5JrW1G45l56O/3tWimJPxmr9ZhxqY3q1gPMQsJTRfQwkplbnuXi+3
         aD+aKJ6iXUIqv01IBZVjhu6LjwAU0UwK/+a+5Vd7fNdXp/b7DZhO93JJ1qEhtxMQeids
         NjdTfIwU2JUB9Zp9VUmrZDlV70qAsizATZWSckheuUdLyeO2ABX1T6IvU2gs/cnm8Lae
         O6SkCOzzg9VKAg7fxAOFxj4XLqffl3jSZqAAhdCaTFHqV1U7kvezQlpkoT+8pXR57tB5
         Oh0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=9XaAbmoQwq7P+JEmTtpggvZeLCOwlKL3K4UmLyhFjfE=;
        b=JKTty5CYP6VejfkLdoiJ4XGKLYZQuqI5S6vENgXWqGObRCXX3vMjq3saN8leT3hsC5
         QjJZvBDmiEt+9Ppqr51lwylT/nw4mKdzUbKH7gA89a66hQVhXPlxH/xRKI9TTxr9fmDF
         kkxibyDeLc3SVjR/7J/YZ8mcRj/I2oCHZ6L9sJJVGmfSV6ZSXAgkDKCz8SM85a+c56Zg
         kKK+H/20v4Genf7alROH0koPDLyuP0If/iobClGLFNu2kN+giM6ug4lp0KESi5NBfFeE
         MaikcDBx6lfwR4qu22HzST1vycz7NSVKI3koXDYhspR2Mp70uv9a/N/K4XVIrHkJxvhi
         WKTg==
X-Gm-Message-State: AOAM532zSYLQhbV24YfXwcXj0FWlJpcZ1ia6qfKNYKmqPuZELfLAoa1l
        ojuWTBVILUerk7ktGyDsdmUofodemkvBfElTFus=
X-Google-Smtp-Source: ABdhPJyIeeFSYZJ1sp7Kxejdm9q1klYSc0D4NoJSFSM0NV+8fbUCG5mkiU5IFOq06mRverJY746u5VLRDDJX7rlq0MI=
X-Received: by 2002:a2e:4b12:: with SMTP id y18mr2559465lja.330.1601129901913;
 Sat, 26 Sep 2020 07:18:21 -0700 (PDT)
MIME-Version: 1.0
References: <CAN9vWDL5rK_UCi-dTUG_Si7MbVSB4hVjvhs1-TEgvdGi+ajUvQ@mail.gmail.com>
 <20200926113038.GA23934@gofer.mess.org> <CAN9vWD+rsg49VzioyGZb7wOiLjmpgM1ku8EEotns2AiQGGTHHg@mail.gmail.com>
 <20200926133330.GA25499@gofer.mess.org>
In-Reply-To: <20200926133330.GA25499@gofer.mess.org>
From:   Michael Zimmermann <sigmaepsilon92@gmail.com>
Date:   Sat, 26 Sep 2020 16:18:10 +0200
Message-ID: <CAN9vWDK5EF4-9-SXpMHObEesbU5-2O-dK8j9m4x2gvD5CgfpiQ@mail.gmail.com>
Subject: Re: ITE8708 on ASUS PN50 uses a 16 byte io region
To:     Sean Young <sean@mess.org>
Cc:     linux-media@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Sat, Sep 26, 2020 at 3:33 PM Sean Young <sean@mess.org> wrote:
>
> Hi Michael,
>
> On Sat, Sep 26, 2020 at 02:32:21PM +0200, Michael Zimmermann wrote:
> > The acpi _HID name of the device is "ITE8708" and the device works
> > with linux's ITE8708 config.
> >
> > I can't find any datasheet or even product page for that IC so I don't
> > know what footprint to look for when looking at the PCB - none of the
> > bigger ICs near the IR sensor have that name on them and the smaller
> > ones usually don't have any useful information printed on them.
> > Additionally I can only access one side of the PCB because I couldn't
> > figure out how to fully disassemble the device yet.
>
> This is a super i/o device, so this handles stuff like serial ports,
> parallel ports, floppy disks. All the legacy stuff you don't need any more.
>
> There is a coreboot tool which can identify super i/o devices:
>
>         https://www.coreboot.org/Superiotool
>
> The super io devices I've seen are about 2cm by 3cm.
>
> I could find a datasheet for the IT8712F on google.
>
>
> Sean
>
> PS. Please don't top post.

Hi Sean,

superiotool r4.12-2974-ga32df26ec07
Found Aspeed AST2400 (id=0x00) at 0x2e

Which is kinda confusing. So either the superiotool detection is
flawed or the PN50 actually has an AST2400 and is programmed to
emulate the IR part of an IT8708F.
Also, that thing seems beefy enough to be the systems EC, does that seem likely?

Thanks
Michael
>
> >
> > Thanks
> > Michael
> >
> > On Sat, Sep 26, 2020 at 1:30 PM Sean Young <sean@mess.org> wrote:
> > >
> > > On Sat, Sep 26, 2020 at 10:22:46AM +0200, Michael Zimmermann wrote:
> > > > Hi,
> > > >
> > > > here's the resource descriptor from my DSDT:
> > > > Name (BUF0, ResourceTemplate ()
> > > > {
> > > >     IO (Decode16,
> > > >         0x0000,             // Range Minimum
> > > >         0x0000,             // Range Maximum
> > > >         0x01,               // Alignment
> > > >         0x10,               // Length
> > > >         _Y1A)
> > > >     IRQNoFlags (_Y1B)
> > > >         {}
> > > >     DMA (Compatibility, NotBusMaster, Transfer8, )
> > > >         {}
> > > > })
> > > >
> > > > As you can see it uses 16 bytes for the IO region while the driver
> > > > drivers/media/rc/ite-cir.c expects 8.
> > > > I don't see any obvious reason why they do that since they only seem
> > > > to write two words in there, and if I edit the DSDT to change the
> > > > length from 0x10 to 0x8 the linux driver detects the device properly
> > > > it works just fine.
> > > >
> > > > So is this a bug on ASUS' side or should we just accept longer regions
> > > > for the same device type?
> > >
> > > So looking at the driver, some devices do have an io region of 16 and
> > > others expect 8. See the io_region_size field of ite_dev_descs.
> > >
> > > So for ITE8708 the io_region_size is set to 8. Does your device really
> > > have an ITE8708 or is the DSDT wrong?
> > >
> > >
> > > Sean
