Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 125491C0A61
	for <lists+linux-media@lfdr.de>; Fri,  1 May 2020 00:25:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727065AbgD3WZP (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 30 Apr 2020 18:25:15 -0400
Received: from mail.kernel.org ([198.145.29.99]:60130 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726697AbgD3WZP (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 30 Apr 2020 18:25:15 -0400
Received: from coco.lan (ip5f5ad5c5.dynamic.kabel-deutschland.de [95.90.213.197])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id CB83E206D9;
        Thu, 30 Apr 2020 22:25:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1588285514;
        bh=PVHQHhcGp1IbUmhBe/8piZ8ELOqI6YFayIIZMFj6Bl4=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=0wpcQNWhC7R1oUmHj4AAGC03BV3J9Qo2BDQzamOUulXGb9JwPoxSfyizFMEaPWk4y
         4p2d/5QfHuUpHEMooDbdmeJy/BbpczI6H7D02xi7ujdnbKV7/wu/2I8EiOMsaPhVQ6
         wQmzhSGaT9gdk/PthD6eaz+nlYee4KzCiNUYzw7U=
Date:   Fri, 1 May 2020 00:25:10 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Patrik Gfeller <patrik.gfeller@gmail.com>
Cc:     linux-media@vger.kernel.org
Subject: Re: atomisp kernel driver(s)
Message-ID: <20200501002510.0ead955d@coco.lan>
In-Reply-To: <403b799e-6ae9-d62b-1f3a-a1b6b874071b@gmail.com>
References: <f3348096-1fb3-5368-ba66-f42a300bde8e@gmail.com>
        <20200420013109.65babb54@coco.lan>
        <e45de3ea-4b5c-f2d0-0844-1233ca15a939@gmail.com>
        <eb83f789-9595-55f0-d922-bab00ae85cff@gmail.com>
        <20200420224750.28c0181d@coco.lan>
        <dd8ab5df-31c7-f009-36e4-ca4fd0605e97@gmail.com>
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
X-Mailer: Claws Mail 3.17.5 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Em Thu, 30 Apr 2020 17:09:48 +0200
Patrik Gfeller <patrik.gfeller@gmail.com> escreveu:

> Am 4/30/2020 um 12:55 PM schrieb Mauro Carvalho Chehab:
> > Em Thu, 30 Apr 2020 09:56:53 +0200
> > Patrik Gfeller<patrik.gfeller@gmail.com>  escreveu:
> >  
> >> For my first test tried to re-compile to module, without the whole
> >> kernel. That was a mistake, as I mixed something up, probably it loaded
> >> an old version of the module ... to be on the save side the steps I used
> >> this time (in case we see something unexpected and for my later reference):
> >>
> >> $ git log --oneline
> >> 4c922df10252 (HEAD -> atomisp, origin/atomisp) media: atomisp2: get rid
> >> of ia_css_sc_param.h version dependency
> >> ...
> >>
> >> $ make -j4 clean
> >> $ make -j4
> >> $ sudo make modules_install INSTALL_MOD_STRIP=1
> >> $ sudo make install  
> > Please try to build from this branch:
> >
> > 	https://git.linuxtv.org/mchehab/experimental.git/log/?h=atomisp_v2
> >
> > You'll need to setup a new config var there. So, please run this before
> > make clean. So, for building it, you will do:
> >
> > 	$ ./scripts/config -e CONFIG_VIDEO_ATOMISP_ISP2401 && make -j modules_prepare
> > 	$ make -j4 clean && make -j4
> > 	$ sudo make modules_install INSTALL_MOD_STRIP=1 && sudo make install
> >
> > This won't change the regulator detection, but it should hopefully use
> > the ISP2401-specific code, with seems to be needed for your device.  
> 
> I've updated to the latest source (git checkout atomisp_v2 && git pull) 
> and compiled using the instructions above. Compilation worked well, but 
> the linker had some problems (full log attached):
> 
> ...
> ld: 
> drivers/staging/media/atomisp/pci/css_2401_system/hive_isp_css_2401_system_generated/ia_css_isp_states.o:(.data+0x0): 
> multiple definition of `ia_css_kernel_init_state'; 
> drivers/staging/media/atomisp/pci/css_2401_csi2p_system/hive_isp_css_2401_system_csi2p_generated/ia_css_isp_states.o:(.data+0x0): 
> first defined here
> ...

Ok. That's because there are two "hive" variants. the building system
should use either one of them (but not both at the same time).

I didn't get the error before because I was just building a module
(that speeds up the development). Such errors only happen on a full 
build.

Fixed.

As I did a git rebase (in order to have something that we could
upstream later), you'll need to use this procedure to update:

	$ git remote update
	$ git reset --hard origin/atomisp_v2

There's no need to clean your last build. Just run:

	$ make -j4 

And it should build fine this time.

> 
> Not sure if I can help with that. Sounds like we have to remove 
> definitions - which I might be able to do. But I would need to know 
> where the right place is to keep the definitions.

> If a code generator is 
> involved (one of the paths looks like it) it will be more difficult for 
> me.

Intel seems to use some code generator internally. Basically, for each
specific device, it can remove/add/change things. Don't mind about that.

For us, we're seeing just the generated code and working to simplify it
and making it more generic.

> But with some hints I'm of course willing to give it a shot. Please 
> give me an example of a definition) and a hint in case we deal with 
> generated code.
> 
> > Ah, when replying, could you please use an emailer that won't be breaking
> > long lines? Your emailer is currently breaking lines longer than 80 columns,
> > with is quite annoying when checking log results ;-)  
> I changed the configuration of my mail client; a test message looked ok. 
> Let me know if the problem persists.

Yeah, is is fine now. Thanks!

Thanks,
Mauro
