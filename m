Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0D32E2798D3
	for <lists+linux-media@lfdr.de>; Sat, 26 Sep 2020 14:32:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727072AbgIZMce (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 26 Sep 2020 08:32:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60342 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725208AbgIZMcd (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 26 Sep 2020 08:32:33 -0400
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com [IPv6:2a00:1450:4864:20::244])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8D8A3C0613CE
        for <linux-media@vger.kernel.org>; Sat, 26 Sep 2020 05:32:33 -0700 (PDT)
Received: by mail-lj1-x244.google.com with SMTP id u21so4629340ljl.6
        for <linux-media@vger.kernel.org>; Sat, 26 Sep 2020 05:32:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=s/Qjgk31D3jK9bHtJMai1ENIqHA3QrF7XjBpduswWqw=;
        b=A63nZDJpirtKNrg4s5sBAAsCKwVL9H2pMAyTG68x2W82Tmm16kxloPrj9QaFNtA5Oa
         Xku5/5twd1IGy5EtjTxPy8NNAy6XTD5GpOOIkBKD8iY9vAf4RI5Xjwl4ypJxzmQHew2o
         GG8ipeACcfXzh4NvSyGfE80TzVlhWluMPShLmv0c32kfnbTLOHWA6FfsRHE3R6aASeat
         9FmgJVGPJcMFjZ7Z/Db0B6JmVx/TVhKDj0F4DXWSZAsczZf4uQ8edw3ap7F47XMAnrXX
         OY5vFc5DXEu5f9x+7lLZFDIUy0J+vEA+/RrmaOLZAfDcqZJEBPbI5SNgu73DIkvNZItz
         nUDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=s/Qjgk31D3jK9bHtJMai1ENIqHA3QrF7XjBpduswWqw=;
        b=JL8vBXyO6GUadQrogCxNyIPBAxuUWVcAPnzZMSGPpDfxi6pIxAnVM/3JkvXvKZpSaN
         7uLJdQc7sVr1DLG5zG4MyuYAXl7uj3kMbxv6LWgSESr+I+91Md7pM9dIdPFDs8wsJ4ye
         ikdPOxBWtbyMI9helZ8mgaMj3tn1QzOicIEl3dlBKm/OFi3UswojQNpshd24WUTWh2MC
         PO6duKwCIrnOowiDr6pTs1kcpOXvlYHIqVMiO459RxFH/nEJfpu8ew0/f6Lw7jDjuNqq
         VmQA9AdW8m2DPis4KqORCi3FRug4JVzLzOcS1rtse5Q+fyMaS3wZBold5W3zQLNUUOIS
         26ig==
X-Gm-Message-State: AOAM532/LBFNA0VP/m4DcTkEMBbUWpjnvUvbo0UuXxCwGU7xkDwKxaHt
        VEjIaRnkpx6JdTzNX0GwqqenXF2b4Hy9t7LZVvX8tox8AAo=
X-Google-Smtp-Source: ABdhPJxXXNEgtudgSw7AMFiU9UhSQYbjYhA/p/9msJKzHRva8dKpff38E0Rka/oF4RBdx3hapwpU0w5pA2PVrHyiebI=
X-Received: by 2002:a2e:8ec1:: with SMTP id e1mr2905495ljl.84.1601123551995;
 Sat, 26 Sep 2020 05:32:31 -0700 (PDT)
MIME-Version: 1.0
References: <CAN9vWDL5rK_UCi-dTUG_Si7MbVSB4hVjvhs1-TEgvdGi+ajUvQ@mail.gmail.com>
 <20200926113038.GA23934@gofer.mess.org>
In-Reply-To: <20200926113038.GA23934@gofer.mess.org>
From:   Michael Zimmermann <sigmaepsilon92@gmail.com>
Date:   Sat, 26 Sep 2020 14:32:21 +0200
Message-ID: <CAN9vWD+rsg49VzioyGZb7wOiLjmpgM1ku8EEotns2AiQGGTHHg@mail.gmail.com>
Subject: Re: ITE8708 on ASUS PN50 uses a 16 byte io region
To:     Sean Young <sean@mess.org>
Cc:     linux-media@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The acpi _HID name of the device is "ITE8708" and the device works
with linux's ITE8708 config.

I can't find any datasheet or even product page for that IC so I don't
know what footprint to look for when looking at the PCB - none of the
bigger ICs near the IR sensor have that name on them and the smaller
ones usually don't have any useful information printed on them.
Additionally I can only access one side of the PCB because I couldn't
figure out how to fully disassemble the device yet.

Thanks
Michael

On Sat, Sep 26, 2020 at 1:30 PM Sean Young <sean@mess.org> wrote:
>
> On Sat, Sep 26, 2020 at 10:22:46AM +0200, Michael Zimmermann wrote:
> > Hi,
> >
> > here's the resource descriptor from my DSDT:
> > Name (BUF0, ResourceTemplate ()
> > {
> >     IO (Decode16,
> >         0x0000,             // Range Minimum
> >         0x0000,             // Range Maximum
> >         0x01,               // Alignment
> >         0x10,               // Length
> >         _Y1A)
> >     IRQNoFlags (_Y1B)
> >         {}
> >     DMA (Compatibility, NotBusMaster, Transfer8, )
> >         {}
> > })
> >
> > As you can see it uses 16 bytes for the IO region while the driver
> > drivers/media/rc/ite-cir.c expects 8.
> > I don't see any obvious reason why they do that since they only seem
> > to write two words in there, and if I edit the DSDT to change the
> > length from 0x10 to 0x8 the linux driver detects the device properly
> > it works just fine.
> >
> > So is this a bug on ASUS' side or should we just accept longer regions
> > for the same device type?
>
> So looking at the driver, some devices do have an io region of 16 and
> others expect 8. See the io_region_size field of ite_dev_descs.
>
> So for ITE8708 the io_region_size is set to 8. Does your device really
> have an ITE8708 or is the DSDT wrong?
>
>
> Sean
