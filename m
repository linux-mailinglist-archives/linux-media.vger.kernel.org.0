Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 67B5D1C26FB
	for <lists+linux-media@lfdr.de>; Sat,  2 May 2020 18:28:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728379AbgEBQ2m (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 2 May 2020 12:28:42 -0400
Received: from mail.kernel.org ([198.145.29.99]:55342 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728342AbgEBQ2l (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Sat, 2 May 2020 12:28:41 -0400
Received: from coco.lan (ip5f5ad5c5.dynamic.kabel-deutschland.de [95.90.213.197])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 80FC221974;
        Sat,  2 May 2020 16:28:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1588436921;
        bh=HbLk2qO6hRNsRv1Mh3ffSJyvYKECW9VUmmae5grsUzI=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=2uETBB96+Buh7Y8Vt4/uCMBOkWkxH0NFFa5NtOG+yU84KED6wX/65CEzXg/d9Sm9R
         dUC4qqmR9ZQoa0SpjQnRTRMwG+QwOzThQGK2cP9DPwbDhJOMZiUW3TDZ6ciQegHAKy
         UALNfy3CNTpttOsTaNjRDnbHKbfP9/b82wA/XTO4=
Date:   Sat, 2 May 2020 18:28:37 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Patrik Gfeller <patrik.gfeller@gmail.com>
Cc:     linux-media@vger.kernel.org
Subject: Re: atomisp kernel driver(s)
Message-ID: <20200502182837.3b254abc@coco.lan>
In-Reply-To: <20200502162951.0ad8a080@ASUS>
References: <f3348096-1fb3-5368-ba66-f42a300bde8e@gmail.com>
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
        <20200502113414.618964a9@coco.lan>
        <20200502162951.0ad8a080@ASUS>
X-Mailer: Claws Mail 3.17.5 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Em Sat, 2 May 2020 16:29:51 +0200
Patrik Gfeller <patrik.gfeller@gmail.com> escreveu:

> On Sat, 2 May 2020 11:34:14 +0200
> Mauro Carvalho Chehab <mchehab+huawei@kernel.org> wrote:
> 
> > Em Sat, 2 May 2020 10:15:42 +0200
> > Patrik Gfeller <patrik.gfeller@gmail.com> escreveu:
> > 
> >  [...]  
> >  [...]  
> >   
> > > > Ok. Btw, there is a driver for Atomisp on an yocto tree:
> > > > 
> > > > 	https://github.com/intel-aero/meta-intel-aero.git
> > > > 
> > > > It got removed back in 2018, but if you checkout this changeset:
> > > > 
> > > > 	Merge: db1df368eb58 08f476112708
> > > > 	Author: Lucas De Marchi <lucas.demarchi@intel.com>
> > > > 	Date:   Tue Apr 4 11:51:42 2017 -0700
> > > > 
> > > > 	    Merge pull request #70 from zehortigoza/jam
> > > >           
> > > 
> > > Cool, the code might give additional information.    
> > 
> > Yes. And, as it was released from Intel for a specific device,
> > it should very likely work for the model supported there (with
> > the Yocto 4.4 Kernel). So, it could be valuable to help identifying
> > if some of the cleanup patches would have broken something.
> > 
> > ON a quick look, it sounds that such build was is targeted for
> > ISP2401:
> > 
> > 	+++ b/drivers/media/pci/atomisp/Makefile
> > 	@@ -0,0 +1 @@
> > 	+obj-$(CONFIG_VIDEO_ATOMISP) += css2401a0_v21_build/
> >   
> > > I've also send a
> > > request regarding the firmware and HW documentation to the author and
> > > the engineers that signed the patch. The firmware in the patch has a
> > > different version string and the size is surprisingly a few MB bigger
> > > than the one I used for the first experiment.     
> > 
> > There are some vendors that generate a firmware together with a source
> > code. This could be the case here. That's my feeling when looking into
> > a file like:
> > 
> > 	drivers/staging/media/atomisp/pci/css_2401_system/spmem_dump.c
> > 
> > Which contains lots of addresses that it is different betwen 2401 and
> > 2400.
> > 
> > If so, using a different firmware version will likely cause at least
> > some parts of the driver to fail.
> > 
> > 
> >  [...]  
> >  [...]    
> > > 
> > > It looks a this firmware is for the 2400 variant; I could also not
> > > extract the irci version string. Thus I'll not try them for the moment
> > > to perform experiments.    
> > 
> > Ok.
> > 
> >  [...]    
> > > 
> > > It identifies itself as irci_stable_bw10p_0518_20150801_0537;     
> > 
> > Same year as what we had. Just a little older. Yeah, some things there
> > could work.  
> 
> Below the result from the test with
> irci_stable_bw10p_0518_20150801_0537 - looks like it loaded the
> firmare; I got an a message when the file was not present, or the
> version did not add up. I tried to cleanup the dmesg output a little
> (removed what was unrelated to atom-isp):

> [   10.089196] ------------[ cut here ]------------
> [   10.093225] WARNING: CPU: 1 PID: 503 at drivers/media/v4l2-core/v4l2-dev.c:885 __video_register_device+0x93e/0x1120 [videodev]

That's due to a change at the media core that added this test:

	/* the device_caps field MUST be set for all but subdevs */
	if (WARN_ON(type != VFL_TYPE_SUBDEV && !vdev->device_caps))
		return -EINVAL;

Added on this patch:

	commit 3c1350501c21db8e3b1a38d9e97db29694305c3b
	Author: Hans Verkuil <hverkuil-cisco@xs4all.nl>
	Date:   Tue Jul 23 04:21:25 2019 -0400

	    media: v4l2-dev/ioctl: require non-zero device_caps, verify sane querycap results
    
	    Now that all V4L2 drivers set device_caps in struct video_device, we can add
	    a check for this to ensure all future drivers fill this in.

Fixing it is simple. Just sent a patch.

> > I'm suspecting that, before being able of calling regulator_get(),
> > the code should use some match logic to get the regulators on this
> > board and call regulator_register().
> > 
> > Please run this command on your tablet:
> > 
> > 	$ sudo cat /sys/kernel/debug/regulator/supply_map
> > 
> > If this returns nothing - as I suspect - then calling regulator_get()
> > won't be doing anything.   
> 
> The statement to read the supply_map did return nothing, as you'd
> expected.

Ok. That explains why register_get() failed ;-)

If this time the probing part works, I guess the next step would
be to use some tools from https://git.linuxtv.org/v4l-utils.git/,
in order to test the stuff that doesn't depend on the sensors,
as, without the regulator settings, it won't be turned on.

The simplest test would be to run:

	$ v4l2-ctl --all -d /dev/video0

(and the same for the other /dev/video? nodes created by the driver)

-

A more complete test would be to run v4l2-compliance (without
enabling streaming), but let's first check if v4l2-ctl won't
hit any Kernel bugs.

Thanks,
Mauro
