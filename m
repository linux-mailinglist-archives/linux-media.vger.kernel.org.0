Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3D29843DF93
	for <lists+linux-media@lfdr.de>; Thu, 28 Oct 2021 12:58:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230119AbhJ1LAf (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 28 Oct 2021 07:00:35 -0400
Received: from mail.kernel.org ([198.145.29.99]:49220 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230049AbhJ1LAe (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 28 Oct 2021 07:00:34 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 71D5D610F8;
        Thu, 28 Oct 2021 10:58:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1635418687;
        bh=Gkr2M7tmNtttpnmRIuF7dQ106RqzchtOjG7lRkrUzbw=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=sh7DFrbTAMUW7cRKsSXrUpXu05gMw4SzitY5VmvMI67cJemTsugL2zzQullaVuih/
         aHcXeI4Sq2M0qhye/vXevYvIekb07XcyNT9xMgQc72Jf4rkCyO3pNR2kCLaktFqyQi
         z9cyNkhoaQ/yaF3jFaQMDctOk8b1/g04ZPEePKiR2sgNV3T/mz9jjFPBKgH/MjCw4B
         bYf5HuuOdRiZtq7LnRzSWr7Ja0YCQ/GMkkTVV7SBqS3P9pNDLS9eWhHCTpHxIElbGw
         Ksam/z0SoiMf0Wnd56CX7Lad9jeq2iW9aM6KKtWmA94EBOi1hyho88Gnzw7KQdWvIu
         wqDpOt+OTdabQ==
Date:   Thu, 28 Oct 2021 11:58:02 +0100
From:   Mauro Carvalho Chehab <mchehab@kernel.org>
To:     Tsuchiya Yuto <kitakar@gmail.com>
Cc:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
        linux-kernel@vger.kernel.org,
        Nable <nable.maininbox@googlemail.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Fabio Aiuto <fabioaiuto83@gmail.com>,
        "andrey.i.trufanov" <andrey.i.trufanov@gmail.com>,
        Patrik Gfeller <patrik.gfeller@gmail.com>
Subject: Re: [PATCH 00/17] various fixes for atomisp to make it work
Message-ID: <20211028115802.49258990@sal.lan>
In-Reply-To: <00dd9a0286e194696f6cc083a98de47d709b1d9e.camel@gmail.com>
References: <20211017161958.44351-1-kitakar@gmail.com>
        <00dd9a0286e194696f6cc083a98de47d709b1d9e.camel@gmail.com>
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Em Thu, 28 Oct 2021 13:32:29 +0900
Tsuchiya Yuto <kitakar@gmail.com> escreveu:

> <Fixed Cc list>
> 
> On Mon, 2021-10-18 at 01:19 +0900, Tsuchiya Yuto wrote:
> > [...]
> >   ## taking a picture with atomisp
> > 
> > Note that to try to take a picture, please also apply at least the
> > this RFC patch ("[BUG][RFC] media: atomisp: pci: assume run_mode is
> > PREVIEW") I'll send as almost a BUG report later.
> > 
> > You need to use firmware version irci_stable_candrpv_0415_20150521_0458,
> > which is available from the intel-aero [1]  
> 
> Just in case, the hash (as well as version) of firmware which I
> downloaded from intel-aero and I use to capture is the following:
> 
>         $ sha256sum /lib/firmware/shisp_2401a0_v21.bin
>         e89359f4e4934c410c83d525e283f34c5fcce9cb5caa75ad8a32d66d3842d95c  /lib/firmware/shisp_2401a0_v21.bin
> 
>         $ strings /lib/firmware/shisp_2401a0_v21.bin | grep 2015
>         irci_stable_candrpv_0415_20150521_0458
> 
> Regards,
> Tsuchiya Yuto
> 
> > The atomisp (ipu2), like the ipu3, needs userspace support. The libcamera
> > has now decent ipu3 support but does not have atomisp support yet.
> > 
> > I found some userspace tools for atomisp that run on Linux:
> > 
> >   - capturev4l2 from intel-aero/sample-apps
> >     (https://github.com/intel-aero/sample-apps/tree/master/capturev4l2)
> >   - hd-camera from intel-aero/sample-apps
> >     (https://github.com/intel-aero/sample-apps/tree/master/hd-camera)
> >   - intel/nvt
> >     (https://github.com/intel/nvt)
> > 
> > It looks like the nvt is the most feature-rich, like exposure and white
> > balance. Note that current upstreamed atomisp dropped 32-bit support.
> > So, you need to build it with `-m64` (change it in Makefile). Here is
> > the example of usage I use on mipad2:
> > 
> >         $ ./v4l2n -o testimage_@.raw \
> >                 --device /dev/video2 \
> >                 --input 0 \
> >                 --exposure=30000,30000,30000,30000 \
> >                 --parm type=1,capturemode=CI_MODE_PREVIEW \
> >                 --fmt type=1,width=1920,height=1080,pixelformat=NV12 \
> >                 --reqbufs count=2,memory=USERPTR \
> >                 --parameters=wb_config.r=32768,wb_config.gr=21043,wb_config.gb=21043,wb_config.b=30863 \
> >                 --capture=2 \
> > 
> >         ./raw2pnm -x1920 -y1080 -fNV12 testimage_001.raw testimage_001.pnm
> >         feh *.pnm # open the converted image
> >         rm testimage*

Great! that worked for me too on Asus T101HA (CHT). I had to tweak the
resolution, as ov2680 sensor has a max of 1616x1216 30fps. I had
to use a number smaller than that, though (1600x1200).

I guess the next step is to make a generic app to also work on it. 

> > 
> > Note that I see the following warn/err after capture:
> > 
> >         kern  :warn  : [72660.793335] atomisp-isp2 0000:00:03.0: stop stream timeout.
> >         kern  :err   : [72660.973629] atomisp-isp2 0000:00:03.0: atomisp_reset
> > 
> > but I see the same message on the Android kernel, too. So, I think this
> > is not a real issue (I hope).

Same here.

> > 
> > [1] https://github.com/intel-aero/meta-intel-aero-base/tree/master/recipes-kernel/linux/linux-yocto
> >     filename shisp_2401a0_v21.bin  
> 
> 
