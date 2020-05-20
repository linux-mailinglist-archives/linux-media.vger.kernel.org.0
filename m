Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 798FF1DACDA
	for <lists+linux-media@lfdr.de>; Wed, 20 May 2020 10:05:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726801AbgETIFA (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 20 May 2020 04:05:00 -0400
Received: from mail.kernel.org ([198.145.29.99]:39654 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726436AbgETIE7 (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 20 May 2020 04:04:59 -0400
Received: from coco.lan (ip5f5ad5c5.dynamic.kabel-deutschland.de [95.90.213.197])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 3A2EF207E8;
        Wed, 20 May 2020 08:04:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1589961899;
        bh=B5TMjMJbKkSc+r03bsDYg+TQB9R5KYqr3FaVzjO6RlY=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=Wvn56wiaDs7kUY5zV0QTo5Y6fFk3bU2GZMaj0lhjTXmH1i32DM9uI5KnIkVhY/eHu
         OLw3aZUii6J8XBJ8FW245vx/5z2IXUNnHPVCq+yPVga+6ScJ8JwvuRxrMs7rEWruUG
         nnJx71Mggc48Li+AY6v2d3NXK3JhMymOzi0yu2nA=
Date:   Wed, 20 May 2020 10:04:54 +0200
From:   Mauro Carvalho Chehab <mchehab@kernel.org>
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Patrik Gfeller <patrik.gfeller@gmail.com>,
        Linux Media Mailing List <linux-media@vger.kernel.org>
Subject: Re: atomisp kernel driver(s)
Message-ID: <20200520100454.087168db@coco.lan>
In-Reply-To: <CAHp75VcSCd5PGhdchK+Yn_7HVvr7pJPK_9pORzwBhPzd2=MGFw@mail.gmail.com>
References: <f3348096-1fb3-5368-ba66-f42a300bde8e@gmail.com>
        <CAHp75Vf9M7=Gf=mCgdBgt0-aR+kBOjtE3pvJyEya2OGmqbr6XA@mail.gmail.com>
        <20200502190414.7ede79b6@coco.lan>
        <CAHp75VeeQ61nUCDr3Fr=mrhxKvVRZ6gWJet+QX+c7jXjTwEhtg@mail.gmail.com>
        <20200512122056.6ae3580f@coco.lan>
        <CAHp75VdjdZCFq=uk0M9QG0tNf+wfD6iFzZvmzBWTWNVpgUpfxQ@mail.gmail.com>
        <CAHp75VdDm+NLVdG7AfwO=FwmA=naqVwAiqbUyyUWc4hwHHSRHg@mail.gmail.com>
        <20200512165644.6609098b@coco.lan>
        <CAHp75VcSCd5PGhdchK+Yn_7HVvr7pJPK_9pORzwBhPzd2=MGFw@mail.gmail.com>
X-Mailer: Claws Mail 3.17.5 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Em Tue, 12 May 2020 19:01:22 +0300
Andy Shevchenko <andy.shevchenko@gmail.com> escreveu:

> On Tue, May 12, 2020 at 5:56 PM Mauro Carvalho Chehab
> <mchehab@kernel.org> wrote:
> > Em Tue, 12 May 2020 14:21:49 +0300
> > Andy Shevchenko <andy.shevchenko@gmail.com> escreveu:  
> > > On Tue, May 12, 2020 at 2:12 PM Andy Shevchenko
> > > <andy.shevchenko@gmail.com> wrote:  
> > > > On Tue, May 12, 2020 at 1:21 PM Mauro Carvalho Chehab
> > > > <mchehab@kernel.org> wrote:  
> > > > > Em Sat, 2 May 2020 20:33:14 +0300
> > > > > Andy Shevchenko <andy.shevchenko@gmail.com> escreveu:  
> > > > > > On Sat, May 2, 2020 at 8:04 PM Mauro Carvalho Chehab <mchehab@kernel.org> wrote:  
> > > > > > > Em Sat, 2 May 2020 19:08:36 +0300
> > > > > > > Andy Shevchenko <andy.shevchenko@gmail.com> escreveu:  
> > >
> > > ...
> > >  
> > > > Btw, https://git.linuxtv.org/mchehab/experimental.git/commit/?h=atomisp_v2.1&id=65608aa8d34ea274600ab2cf6f0cf54ee86d8fd1
> > > > is incorrect approach. Look closer what PCI does in case when
> > > > pcim_enable_device() has been called.  
> > >
> > > This has resource leaks
> > > https://git.linuxtv.org/mchehab/experimental.git/commit/?h=atomisp_v2.1&id=88b03de5d705f5f46a896dbd21ef9472030bb8d3
> > >
> > > Easier just to acpi_handle_info(ACPI_HANDLE(...), ...);
> > >
> > > We don't enumerate them w/o ACPI IIRC.  
> >
> > Well, at least while in staging, it would be good to know more details
> > about the probing issues on different hardware that people might be
> > testing it.
> >
> > avoiding to use a get_device() here is not possible, because the
> > prints will use the adev to return some info we may need:
> >
> >         ov2680 i2c-OVTI2680:00: ov2680_probe: ACPI detected it on bus ID=CAM1, HID=OVTI2680  
> 
> Why do you need get_device()? Are you expecting device may have gone?
> acpi_handle_*() / dev_*() are not enough?

Sorry for not answering this earlier. Got sidetracked by other things.

That's my miss-understanding: when I saw the name acpi_bus_get_device()
and looked at the code, where there is a function called
acpi_bus_put_acpi_device() that it is just a wrapper for 
put_device(&adev->dev), I just assumed that this function would be
internally calling get_device.

So, calling "put_device(&adev->dev)" or calling acpi_dev_put() would
get rid of any memory leaks.

After checking it better, that doesn't seem the case.

Anyway, for now, I'll just keep a call for acpi_bus_get_device() there,
as this is really helpful for debugging purposes. I'll add a notice
about potential memory leaks there, for us to address if/when porting
them to be generic I2C drivers.

If you have some suggestions about how to avoid memory leaks when
using it, feel free to suggest (or send us a patch).

There's zero chance of those sensor drivers to leave staging as-is.

A *major* re-work would be needed - and some drivers will just be
replaced by the upstream ones (like ov2680).

They have several stuff there with are specific to atomisp, including
the entire ACPI binding. We'll need to work on a different way to
do that outside staging.

> > This, together with the DMI product ID on this message:
> >
> >         atomisp-isp2 0000:00:03.0: Detected Cherrytrail version 54 (ISP2401) on T101HA
> >
> > may help to avoid users to run acpixtract/iasl/dmidecode when adding
> > new entries to the dmi match tables. Not 100%, since BIOSes may
> > still use different names for the sensor data.  
> 
> > Trying to open a video devnode returns error and produce those logs:
> >
> >         [ 3262.961623] atomisp-isp2 0000:00:03.0: open device ATOMISP ISP CAPTURE output
> >         [ 3262.971350] sh_css_hrt_system_is_idle() 44: warning: SP not idle
> >         [ 3262.971364] sh_css_hrt_system_is_idle() 49: warning: ISP not idle
> >         [ 3262.971712] sh_css_hrt_system_is_idle() 56: warning: FIFO channel 12 is not empty
> >         [ 3262.972079] sh_css_hrt_system_is_idle() 56: warning: FIFO channel 26 is not empty
> >         [ 3262.972188] atomisp-isp2 0000:00:03.0: css init failed --- bad firmware?
> >         [ 3262.974982] atomisp-isp2 0000:00:03.0: atomisp_mrfld_pre_power_down: error in iunit interrupt. status reg=0xffffffff  
> 
> In my case when I tried with 2015-04 / 2015-05 firmware for ISP2400 I
> got to no crashes, but no IRQs, presumably due to absence of PMIC
> integration.

Yeah, maybe. With the current version, I'm getting IRQs telling
that the frames are ready:

	[ 3635.285469] atomisp-isp2 0000:00:03.0: irq:0x200000
	[ 3635.285494] atomisp-isp2 0000:00:03.0: atomisp_isr EOF exp_id 97, asd 0
	[ 3635.285600] atomisp-isp2 0000:00:03.0: irq:0x200000
	[ 3635.285625] atomisp-isp2 0000:00:03.0: atomisp_isr EOF exp_id 98, asd 0
	[ 3635.285734] atomisp-isp2 0000:00:03.0: irq:0x200000
	[ 3635.285750] atomisp-isp2 0000:00:03.0: atomisp_isr EOF exp_id 99, asd 0
	[ 3635.285861] atomisp-isp2 0000:00:03.0: irq:0x200000
	[ 3635.285879] atomisp-isp2 0000:00:03.0: atomisp_isr EOF exp_id 100, asd 0
	[ 3635.285990] atomisp-isp2 0000:00:03.0: irq:0x200000
	[ 3635.286005] atomisp-isp2 0000:00:03.0: atomisp_isr EOF exp_id 101, asd 0
	[ 3635.286120] atomisp-isp2 0000:00:03.0: irq:0x200000
	[ 3635.286135] atomisp-isp2 0000:00:03.0: atomisp_isr EOF exp_id 102, asd 0
	[ 3635.286251] atomisp-isp2 0000:00:03.0: irq:0x200000
	[ 3635.286265] atomisp-isp2 0000:00:03.0: atomisp_isr EOF exp_id 103, asd 0
	[ 3635.286384] atomisp-isp2 0000:00:03.0: irq:0x200000
	[ 3635.286401] atomisp-isp2 0000:00:03.0: atomisp_isr EOF exp_id 104, asd 0

What is funny is that those events are producing v4l2 events, instead of
being written to the dqbuf directly.

I suspect that the userspace code should do something with such
events, before the driver release the buffers to userspace via DQBUF.

Btw, if you still have your isp2400 hardware, it would be worth if you
could check if the current driver produces some result there.

Thanks,
Mauro
