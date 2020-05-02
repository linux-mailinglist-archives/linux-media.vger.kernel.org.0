Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 36DF41C2463
	for <lists+linux-media@lfdr.de>; Sat,  2 May 2020 11:34:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726809AbgEBJeT (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 2 May 2020 05:34:19 -0400
Received: from mail.kernel.org ([198.145.29.99]:46174 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726548AbgEBJeS (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Sat, 2 May 2020 05:34:18 -0400
Received: from coco.lan (ip5f5ad5c5.dynamic.kabel-deutschland.de [95.90.213.197])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 824C82137B;
        Sat,  2 May 2020 09:34:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1588412058;
        bh=/LBY4v/A9DWiU0sENH+0vjh8HsSunZSbMf162tw0lKc=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=GGdyFbwT3spTWgkdCADo3cq0aAIwFRQMjF8kP4kQgWzNUo8gLxe+54Q4b7/0gImHV
         db7Ah827jJNcVDpLfDfidPHG62JbZaPYlWdU3EfNgqQLmCd1z+HA4+K/nva4U/MzzD
         4CyVnoIqsu9gF3v31wiNVcdTt7hBAWdVp6tZGz4o=
Date:   Sat, 2 May 2020 11:34:14 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Patrik Gfeller <patrik.gfeller@gmail.com>
Cc:     linux-media@vger.kernel.org
Subject: Re: atomisp kernel driver(s)
Message-ID: <20200502113414.618964a9@coco.lan>
In-Reply-To: <20200502101542.2972010a@ASUS>
References: <f3348096-1fb3-5368-ba66-f42a300bde8e@gmail.com>
        <20200422211344.2ec3d93e@coco.lan>
        <23b3a078-2a9a-5f50-a35e-9f40f5aa8a6e@gmail.com>
        <86413836-e4b5-cb53-3ac0-1764c693ec7b@gmail.com>
        <682558b0-a2cf-9fe2-6e54-20462ecccb5d@gmail.com>
        <20200425132255.4bf872b2@coco.lan>
        <131a4247-cef3-d651-a0ea-defd32b8bf20@gmail.com>
        <20200426185007.1954885a@coco.lan>
        <45817a6a-dd2f-13a6-835b-fd2b04ded23f@gmail.com>
        <20200427235027.15cd4e03@coco.lan>
        <d9ec5067-142c-66c9-c412-51ddf38e44f7@gmail.com>
        <20200429011339.03af3c2a@coco.lan>
        <3b7366b9-463d-c49b-0f2d-51a1d5475a9d@gmail.com>
        <20200429201753.3b2d679b@coco.lan>
        <6fffdf73-a0eb-1b1c-d894-e4799b8ef944@gmail.com>
        <20200430125544.10a9830d@coco.lan>
        <403b799e-6ae9-d62b-1f3a-a1b6b874071b@gmail.com>
        <20200501002510.0ead955d@coco.lan>
        <1a17ffad-9792-a4ff-519e-a4306e7bf3e1@gmail.com>
        <20200501113812.7f16b7ca@coco.lan>
        <20200501192844.397efcaa@ASUS>
        <20200501213023.7fe29188@coco.lan>
        <20200502101542.2972010a@ASUS>
X-Mailer: Claws Mail 3.17.5 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Em Sat, 2 May 2020 10:15:42 +0200
Patrik Gfeller <patrik.gfeller@gmail.com> escreveu:

> On Fri, 1 May 2020 21:30:23 +0200
> Mauro Carvalho Chehab <mchehab+huawei@kernel.org> wrote:
> 
> > Em Fri, 1 May 2020 19:31:05 +0200
> > Patrik Gfeller <patrik.gfeller@gmail.com> escreveu:
> >   

> > Ok. Btw, there is a driver for Atomisp on an yocto tree:
> > 
> > 	https://github.com/intel-aero/meta-intel-aero.git
> > 
> > It got removed back in 2018, but if you checkout this changeset:
> > 
> > 	Merge: db1df368eb58 08f476112708
> > 	Author: Lucas De Marchi <lucas.demarchi@intel.com>
> > 	Date:   Tue Apr 4 11:51:42 2017 -0700
> > 
> > 	    Merge pull request #70 from zehortigoza/jam
> >       
> 
> Cool, the code might give additional information.

Yes. And, as it was released from Intel for a specific device,
it should very likely work for the model supported there (with
the Yocto 4.4 Kernel). So, it could be valuable to help identifying
if some of the cleanup patches would have broken something.

ON a quick look, it sounds that such build was is targeted for
ISP2401:

	+++ b/drivers/media/pci/atomisp/Makefile
	@@ -0,0 +1 @@
	+obj-$(CONFIG_VIDEO_ATOMISP) += css2401a0_v21_build/

> I've also send a
> request regarding the firmware and HW documentation to the author and
> the engineers that signed the patch. The firmware in the patch has a
> different version string and the size is surprisingly a few MB bigger
> than the one I used for the first experiment. 

There are some vendors that generate a firmware together with a source
code. This could be the case here. That's my feeling when looking into
a file like:

	drivers/staging/media/atomisp/pci/css_2401_system/spmem_dump.c

Which contains lots of addresses that it is different betwen 2401 and
2400.

If so, using a different firmware version will likely cause at least
some parts of the driver to fail.


> I'll give that one a try as well.
> 
> > You would be able to see it. Unfortunately, the driver there
> > also came with shisp_2401a0_v21.bin.
> > 
> > The driver there forces this specific version, disabling the 
> > firmware version checking:
> > 
> > recipes-kernel/linux/linux-yocto/0013-temp-atomisp-support.patch:+ccflags-y += -DATOMISP_POSTFIX=\"css2401a0_v21\" -DATOMISP_FWNAME=\"shisp_2401a0_v21.bin\" -DISP2401 -DISP2401_NEW_INPUT_SYSTEM
> > 
> > I also found a firmware for some other Asus Transformer device:
> > 
> > 	https://github.com/jfwells/linux-asus-t100ta/tree/master/webcam/firmware
> >   
> 
> It looks a this firmware is for the 2400 variant; I could also not
> extract the irci version string. Thus I'll not try them for the moment
> to perform experiments.

Ok.

> > That's said, there's also a firmware for it inside this:
> > 	https://dlcdnets.asus.com/pub/ASUS/nb/DriversForWin10/Chipset/Chipset_Intel_CherryTrail_T_Win10_64_VER110.zip
> > 
> > Probably it is a different version, but it could be worth renaming it and
> > try it. The firmware load code should check if the firmware version is the
> > right one.  
> 
> It identifies itself as irci_stable_bw10p_0518_20150801_0537; 

Same year as what we had. Just a little older. Yeah, some things there
could work.

> I'll give
> that one a try first. As usual it will unfortunately take some time
> until I get back to you with the results, as every experiment takes
> many hours (building the kernel on what is essentially a tablet takes
> time).

I would suggest you to build on some other machine. Btw, you don't need
to build everything every time. If you build atomisp as a module, you
could do, instead:

	$ make modules_prepare && make M=drivers/staging/media/atomisp

This will build just the new module(s).

> > > [    9.691775] cpu_latency_qos_update_request called for unknown object

Btw, the patch I send earlier today should fix this issue.

-

I need to understand a little bit more about how ACPI is supposed to
detect and register regulators. While using regulators with DT is very
common, not many places use it for ACPI. 

I'm suspecting that, before being able of calling regulator_get(),
the code should use some match logic to get the regulators on this
board and call regulator_register().

Please run this command on your tablet:

	$ sudo cat /sys/kernel/debug/regulator/supply_map

If this returns nothing - as I suspect - then calling regulator_get()
won't be doing anything. 

Thanks,
Mauro
