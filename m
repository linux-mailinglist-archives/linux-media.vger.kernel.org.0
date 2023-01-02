Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5469265B259
	for <lists+linux-media@lfdr.de>; Mon,  2 Jan 2023 13:49:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232870AbjABMto (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 2 Jan 2023 07:49:44 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53462 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232841AbjABMtm (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 2 Jan 2023 07:49:42 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6174EE4E
        for <linux-media@vger.kernel.org>; Mon,  2 Jan 2023 04:49:41 -0800 (PST)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id E268A7C5;
        Mon,  2 Jan 2023 13:49:39 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1672663780;
        bh=DwU5zC5/zYEB9x/tKnmt6K6jFSmG94re+bMREh2EPQQ=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=OfLA1YmAYO07Mm5SetVVjV0myQy0Hz/eZrw0A/Yn93NYyHBDd53Z5Z2VPVy9FLtec
         4OBazwjC6nwezgKIOgKXu/D4D2Fv3TmwaWZoCrn0cbwM5IwtIBEf6WsL7V89L5go0H
         ofCmvHbd8oLc3T5Yg1soHyNd7bbJX1yT6iJ7dCwM=
Date:   Mon, 2 Jan 2023 14:49:36 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Giuliano Lotta <giuliano.lotta@gmail.com>
Cc:     Ricardo Ribalda <ribalda@chromium.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        mchehab@kernel.org
Subject: Re: ucv camera fix : tester offering :-)
Message-ID: <Y7LS4MMcSX/tO5EN@pendragon.ideasonboard.com>
References: <CA+DpmqZ1fh=MqEn-G6wb_6yELuPWVTROG2ReUDPJGAAOn7FN9Q@mail.gmail.com>
 <CANiDSCuoL4-L4zXPFRS88NpmYMdbbP2QNi90U9LkpS90_unb1w@mail.gmail.com>
 <Y689FvF1zULBkSHs@pendragon.ideasonboard.com>
 <CA+DpmqZ=v1TwfhnjpaT6ip9L4UnVuE-Cx2cJo0hDNybNhKwu4g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CA+DpmqZ=v1TwfhnjpaT6ip9L4UnVuE-Cx2cJo0hDNybNhKwu4g@mail.gmail.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Giuliano,

On Sun, Jan 01, 2023 at 10:26:00PM +0100, Giuliano Lotta wrote:
> *Hi Laurent *
> 
> *Thanks a lot for your kind help… and thanks for finding time close to the
> new year holiday (btw… Happy new year !)*
> 
> *I’m running **Ubuntu 22.04.1 LTS, with kernel **Ubuntu
> 5.15.0-56.62-generic 5.15.64*
> 
> 
> *I expanded the tar archive in my home directory, and created a new Eclipse
> project with Eclispe main site config info.*

You can use your favourite source code editor to work on the kernel, but
an Eclipse *project* may be overkill. I wouldn't recommend building the
kernel within Eclipse, running 'make' on the command line is preferable.

> *- UVC_DRIVER.C REFERENCE VERSION*
> 
> *Thanks for the diff your are submitting me… considering the line numbers,
> your diff are NOT aligned with uvcdriver.c for my running ubuntu (kernel
> 5,15) :*
> 
> *https://git.launchpad.net/~ubuntu-kernel-test/ubuntu/+source/linux/+git/linus--linux/tree/drivers/media/usb/uvc/uvc_driver.c?h=v5.15
> <https://git.launchpad.net/~ubuntu-kernel-test/ubuntu/+source/linux/+git/linus--linux/tree/drivers/media/usb/uvc/uvc_driver.c?h=v5.15>*
> 
> 
> 
> *I also checked the Linus Torsvald git, and the ubuntu kernel 6,1. I see
> that some “other” Quanta camera has been added in Ubuntu 6,1 mainline and
> Torvald one, (e,g, 0x0408:0x4034), but non yet mine camera (0x0408:0x4035)
> !!*
> 
> *https://git.launchpad.net/~ubuntu-kernel-test/ubuntu/+source/linux/+git/linus--linux/tree/drivers/media/usb/uvc/uvc_driver.c?h=v6.1
> <https://git.launchpad.net/~ubuntu-kernel-test/ubuntu/+source/linux/+git/linus--linux/tree/drivers/media/usb/uvc/uvc_driver.c?h=v6.1>*
> 
> *https://github.com/torvalds/linux/blob/master/drivers/media/usb/uvc/uvc_driver.c
> <https://github.com/torvalds/linux/blob/master/drivers/media/usb/uvc/uvc_driver.c>*
> 
> 
> *The diff line number 2447, seems to match the Ubuntu 6,1 version, and NOT
> the current Torvald version. Is that right ?*

I don't recall which version I used as a base, but that doesn't matter
much here, you can apply the diff manually in the worst case by adding
the match entry to the array. The exact position doesn't matter much, as
long as it's before the last two items.

> *-DEVICE**_**INFO FIELD MACRO*
> 
> 
> *comparing how suc field is created,  your macro seems to be different from
> the “ubuntu standard”. *
> 
> 
> *E.g. :*
> .driver_info = (kernel_ulong_t) &(const struct uvc_device_info ) { .uvc_version = 0x010a, } },
> vs
> .driver_info = (kernel_ulong_t)&uvc_quirk_probe_minmax },
> 
> *Can I reform the .device_info field to follow the ubuntu standard ? Are
> there any real differences or incompatibilities ?*

The uvc_device_info structure should be in the v5.15 kernel already, so
the code I've sent should compile fine, I don't think there's a need to
change anything.

> *- **NEW **COMPILED VERSION*
> 
> *I modified the 5,15 uvc_driver.c version with your lines of code, and
> loaded it on github*
> 
> *https://github.com/Giuliano69/uvc_driver-for-Quanta-HD-User-Facing-0x0408-0x4035-/blob/main/uvc_driver.c
> <https://github.com/Giuliano69/uvc_driver-for-Quanta-HD-User-Facing-0x0408-0x4035-/blob/main/uvc_driver.c>*
> 
> *Compiling the whole new kernel (“new” because the usb_driver.c is
> modified), shows NO ERROR:*

Good :-)

> > *21:42:38 **** Incremental Build of configuration Default for project
> > Linux 5.15 *****
> >
> make all
> >
> > CALL scripts/checksyscalls.sh
> > CALL scripts/atomic/check-atomics.sh
> > DESCEND objtool
> > DESCEND bpf/resolve_btfids
> > CHK include/generated/compile.h
> > CHK kernel/kheaders_data.tar.xz
> > CC [M] drivers/media/usb/uvc/uvc_driver.o
> > LD [M] drivers/media/usb/uvc/uvcvideo.o
> > Kernel: arch/x86/boot/bzImage is ready (#2)
> > MODPOST modules-only.symvers
> > GEN Module.symvers
> > CC [M] drivers/media/usb/uvc/uvcvideo.mod.o
> > LD [M] drivers/media/usb/uvc/uvcvideo.ko
> >
> > 21:43:52 Build Finished. 0 errors, 0 warnings. (took 1m:14s.207ms)
> >
> >
> *BUT **I’ve difficulties in finding WHERE is the new module after the
> building in my project directory tree!! *
> 
> *Here is the ls -al*
> 
> *giuliano@Astra2A:~/linux-source-5.15.0/drivers/media/usb/uvc$ ls -l*
> 
> *totale 13288*
> 
> *-rw-r--r-- 1 giuliano giuliano 623 ott 31 2021 Kconfig*
> *-rw-r--r-- 1 giuliano giuliano 290 ott 31 2021 Makefile*
> *-rw-rw-r-- 1 giuliano giuliano 34 gen 1 21:43 modules.order*
> *-rw-r--r-- 1 giuliano giuliano 61689 ott 31 2021 uvc_ctrl.c*
> *-rw-rw-r-- 1 giuliano giuliano 530176 gen 1 11:48 uvc_ctrl.o*
> *-rw-r--r-- 1 giuliano giuliano 2520 ott 31 2021 uvc_debugfs.c*
> *-rw-rw-r-- 1 giuliano giuliano 342808 gen 1 11:48 uvc_debugfs.o*
> *-rw-r--r-- 1 giuliano giuliano 87954 gen 1 21:42 uvc_driver.c*
> *-rw-rw-r-- 1 giuliano giuliano 631208 gen 1 21:43 uvc_driver.o*
> *-rw-r--r-- 1 giuliano giuliano 87571 ott 31 2021 uvc_driver.old*
> *-rw-r--r-- 1 giuliano giuliano 3967 ott 31 2021 uvc_entity.c*
> *-rw-rw-r-- 1 giuliano giuliano 344944 gen 1 11:48 uvc_entity.o*
> *-rw-r--r-- 1 giuliano giuliano 3779 ott 31 2021 uvc_isight.c*
> *-rw-rw-r-- 1 giuliano giuliano 315816 gen 1 11:48 uvc_isight.o*
> *-rw-r--r-- 1 giuliano giuliano 4964 ott 31 2021 uvc_metadata.c*
> *-rw-rw-r-- 1 giuliano giuliano 389056 gen 1 11:48 uvc_metadata.o*
> *-rw-r--r-- 1 giuliano giuliano 13448 ott 31 2021 uvc_queue.c*
> *-rw-rw-r-- 1 giuliano giuliano 416680 gen 1 11:48 uvc_queue.o*
> *-rw-r--r-- 1 giuliano giuliano 7213 ott 31 2021 uvc_status.c*
> *-rw-rw-r-- 1 giuliano giuliano 344240 gen 1 11:48 uvc_status.o*
> *-rw-r--r-- 1 giuliano giuliano 39618 nov 22 20:53 uvc_v4l2.c*
> *-rw-rw-r-- 1 giuliano giuliano 534856 gen 1 11:48 uvc_v4l2.o*
> *-rw-r--r-- 1 giuliano giuliano 64532 nov 22 20:53 uvc_video.c*
> *-rw-r--r-- 1 giuliano giuliano 27398 nov 22 20:53 uvcvideo.h*
> *-rw-rw-r-- 1 giuliano giuliano 4384280 gen 1 21:43 uvcvideo.ko*

This is the new module.

Normally modules are installed in the system by running `make
modules_install`. This will however overwrite all the modules installed
by the Ubuntu kernel package, so I don't recommend it, many things could
go wrong. Instead, you can try to load the module manually. First unload
the exising uvcvideo module with `sudo rmmod uvcvideo`, and then load
the new one with `sudo insmod drivers/media/usb/uvc/uvcvideo.ko` (note
how insmod uses the module file path as an argument, while modprobe uses
the module name and looks it up in /lib/modules - you should ajust the
path according to where you run the command).

If this fails, `dmesg` may give some useful information.

> *-rw-rw-r-- 1 giuliano giuliano 348 gen 1 21:43 uvcvideo.mod*
> *-rw-rw-r-- 1 giuliano giuliano 10098 gen 1 21:43 uvcvideo.mod.c*
> *-rw-rw-r-- 1 giuliano giuliano 70904 gen 1 21:43 uvcvideo.mod.o*
> *-rw-rw-r-- 1 giuliano giuliano 500384 gen 1 11:48 uvc_video.o*
> *-rw-rw-r-- 1 giuliano giuliano 4315312 gen 1 21:43 uvcvideo.o*
> 
> 
> *IF the new module file is created, may I load it with a simple modprobe in
> my running system ?*
> 
> *Can it interfere with the Nvidia driver (many times it showed some
> problems…) =*

They shouldn't be related, no.

> Il giorno ven 30 dic 2022 alle ore 20:33 Laurent Pinchart ha scritto:
> > On Wed, Dec 21, 2022 at 09:09:37PM +0100, Ricardo Ribalda wrote:
> > > Hi Giuliano
> > >
> > > Usually it is better to ask at the linux-media mailing list
> > > https://www.linuxtv.org/lists.php. there is better chance to get an
> > > answer and your question will get better chances to get be answered.
> > >
> > > On Wed, 21 Dec 2022 at 15:14, Giuliano Lotta wrote:
> > > >
> > > > Hi Laurent,
> > > >
> > > > I'm using using an ubuntu Ubuntu 22.04.1 LTS on 5.15.0-56-generic
> > > >
> > > > with an Acer Nitro 5 AN517-55 with Quanta ACER HD User Facing', USB
> > > > 0408:4035.
> > > >
> > > > Currently the camera is not working under linux. The camera works
> > > > perfectly on Windows 11 dual boot.
> > > >
> > > > The camera is reported to have problems on other linux versions:
> > > > https://linux-hardware.org/?id=usb:0408-4035
> > > >
> > > > My console commands report similar info to other users:
> > > > https://unix.stackexchange.com/questions/723504/integrated-camera-not-detected-working-on-acer-nitro-5-an515-58
> > > >
> > > > I see also that there is a proposed fix at
> > > > https://patchwork.kernel.org/project/linux-media/patch/20220617235610.321917-9-ribalda@chromium.org/
> > >
> > > If your error in dmesg is simiar
> > >
> > > [    4.629731] uvcvideo 3-6:1.1: Failed to query (129) UVC probe control: 26 (exp. 48).
> >
> > It looks like your device advertise UVC 1.5 support (as also hinted by
> > the availability of the Region of Interest control in the camera input
> > terminal) but implements the UVC 1.0a video control. I'm honestly
> > puzzled by how abysmal compliance testing seems to be among webcam
> > manufacturers. In older days this would have called for beheading with a
> > rusty tea spoon, or worse, cursing in them Finnish.
> >
> > > I am afraid that my patch won't help you much. My patch fixes the way
> > > a control can be configured.
> > >
> > > Can you copy your whole dmesg when you get an error.
> >
> > That would be useful.
> >
> > > Also the output of lsusb -v -d 0408:4035
> >
> > That seems to be available from https://pastebin.com/raw/GQVWC6i3.
> >
> > Giuliano, could you try the following patch ? You need to apply it to
> > the sources of the kernel you're running (available from your
> > distribution), and compile the uvcvideo module. Depending on the
> > distribution, it may sign kernel modules, in which case you may need to
> > recompile the whole kernel. That's a distribution-specific issue that
> > you should bring up with your distribution's support channel if you run
> > into issues.
> >
> > diff --git a/drivers/media/usb/uvc/uvc_driver.c
> > b/drivers/media/usb/uvc/uvc_driver.c
> > index 6abec7a51f47..52e7cae5c249 100644
> > --- a/drivers/media/usb/uvc/uvc_driver.c
> > +++ b/drivers/media/usb/uvc/uvc_driver.c
> > @@ -2447,6 +2447,17 @@ static const struct usb_device_id uvc_ids[] = {
> >           .bInterfaceSubClass   = 1,
> >           .bInterfaceProtocol   = UVC_PC_PROTOCOL_15,
> >           .driver_info          = (kernel_ulong_t)&uvc_ctrl_power_line_limited },
> > +       /* Quanta ACER HD User Facing */
> > +       { .match_flags          = USB_DEVICE_ID_MATCH_DEVICE
> > +                               | USB_DEVICE_ID_MATCH_INT_INFO,
> > +         .idVendor             = 0x0408,
> > +         .idProduct            = 0x4035,
> > +         .bInterfaceClass      = USB_CLASS_VIDEO,
> > +         .bInterfaceSubClass   = 1,
> > +         .bInterfaceProtocol   = UVC_PC_PROTOCOL_15,
> > +         .driver_info          = (kernel_ulong_t)&(const struct uvc_device_info) {
> > +               .uvc_version = 0x010a,
> > +         } },
> >         /* LogiLink Wireless Webcam */
> >         { .match_flags          = USB_DEVICE_ID_MATCH_DEVICE
> >                                 | USB_DEVICE_ID_MATCH_INT_INFO,
> >
> > This may cause side effects, for instance when it comes to handling of
> > the power line frequency control or other controls whose implementation
> > depend on the UVC version, but we'll worry about that later.
> >
> > > > Installed linux-source but uvc_driver.c I found in the directory tree
> > > > of Ubuntu is different from both :
> > > >
> > > > - https://github.com/torvalds/linux/blob/master/drivers/media/usb/uvc/uvc_driver.c
> > > >
> > > > - https://patchwork.kernel.org/project/linux-media/patch/20220617235610.321917-9-ribalda@chromium.org/
> > > >
> > > >
> > > > I would like to test your patch and see if the solution can be
> > > > submitted to Ubuntu for the next fix release.
> > > >
> > > > - Could you give me some instructions on how to proceed ?
> > > >
> > > > - Should I compile a new whole kernel or just a mod?
> > > >
> > > > - Where can I find the source to which your fix applies (seems to
> > > >   apply to something different from Ubuntu and torvald versions) ?
> > > >   Will it be compatible with the current Ubuntu version?
> > > >
> > > > - May I ask for some instructions on how to proceed with testing
> > > >   your fix ?

-- 
Regards,

Laurent Pinchart
