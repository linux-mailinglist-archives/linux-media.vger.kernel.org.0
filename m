Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BAAC624A9D6
	for <lists+linux-media@lfdr.de>; Thu, 20 Aug 2020 01:10:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726482AbgHSXI4 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 19 Aug 2020 19:08:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46262 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726209AbgHSXIz (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 19 Aug 2020 19:08:55 -0400
Received: from mail-pj1-x1044.google.com (mail-pj1-x1044.google.com [IPv6:2607:f8b0:4864:20::1044])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B5F57C061757;
        Wed, 19 Aug 2020 16:08:54 -0700 (PDT)
Received: by mail-pj1-x1044.google.com with SMTP id t6so134610pjr.0;
        Wed, 19 Aug 2020 16:08:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=/TQbD/7FiZl5w7Gz4692JnPlqVeN1mC4zC5MUVcGuMU=;
        b=HncmxvcsyQ9Gct3joBJqjC4IVNe7uXxDv0UeOXqQrvC3Dwd4Jl6ysDSwx40JMkl1SQ
         anRkIDxrMOmJL+skSsYbY0X7aA0koWUtdSYicNLKRSBvr7sPaanoU6F05lAMNjl8bwKl
         VESeaKxOPSEdZ2Kqb9wTV2dk93NU/eFZyBWa/AdkxjlLZvc5/SpJWFIb/8JYU4eZx2iP
         cWGQWA43tF+sgItkZD7J8qt5hU7+sJ3BjEIVfChNk9oisFBju4OtBXhOw4eBXVWZ7MmE
         ZFEf5arTkVqE2CuQp1A5Cit8U+GXEeMzxge8J93TXLSqIFyq+WPfZ4m2X4zZIIXgJnWE
         j1ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to:user-agent;
        bh=/TQbD/7FiZl5w7Gz4692JnPlqVeN1mC4zC5MUVcGuMU=;
        b=iRLkqviUCu95HjevdIBADk8z54KPgBEZsRi8OWdtmLyWw0ss7/z1ntyhSuYTMRy8nq
         KQNrjyN92C41grenVzJ8ddIqYcYBAd8KYjIgHh3BwbJNxnqyKGSmKKD2OfXBkeEke+WW
         EZo2PNgvYJ9boFdeuxZ9zTvYVh9WIve9J+X+ra19/m5WjiOmmQzbkhZIm+gNzPB9KZLv
         Dyz9oH7nOY6TS5ktuTNQt5Pkw88ZaUdF45B6ppkR4hY5EiDLiNHaF8SJqaKZ3N3jK/Rv
         wJldItDQvytJEoFuNthh1HU9/86NDR9sqBm2VHBFwIXu96RxNlxI8zNX3015APAkgNeP
         wmPQ==
X-Gm-Message-State: AOAM532ROPFLXrUEoPqJdq3O7y3miL1aOs8tRxvhSjFB1A77kqrCbM9l
        DXMrNfiYTCfY6ka7BBr+bjo=
X-Google-Smtp-Source: ABdhPJysLDxUcLuakJlBqkXIsISb7nGvwz/B75s3HUSyZYBLV3CJfC2Rsw5LYHKp0LvXjPwLT2XafA==
X-Received: by 2002:a17:90b:1090:: with SMTP id gj16mr162749pjb.174.1597878534061;
        Wed, 19 Aug 2020 16:08:54 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id 207sm272469pfz.203.2020.08.19.16.08.52
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 19 Aug 2020 16:08:53 -0700 (PDT)
Date:   Wed, 19 Aug 2020 16:08:51 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        linux-usb <linux-usb@vger.kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Alan Stern <stern@rowland.harvard.edu>,
        linux-media@vger.kernel.org, linux-uvc-devel@lists.sourceforge.net,
        Sakari Ailus <sakari.ailus@iki.fi>
Subject: Re: Protecting uvcvideo againt USB device disconnect [Was: Re:
 Protecting usb_set_interface() against device removal]
Message-ID: <20200819230851.GA222844@roeck-us.net>
References: <b0a7247c-bed3-934b-2c73-7f4b0adb5e75@roeck-us.net>
 <20200815020739.GB52242@rowland.harvard.edu>
 <20200816003315.GA13826@roeck-us.net>
 <20200816121816.GC32174@pendragon.ideasonboard.com>
 <9bb20ed7-b156-f6c2-4d25-6acac1a0021b@roeck-us.net>
 <20200816235155.GA7729@pendragon.ideasonboard.com>
 <0684b71c-8ac5-8962-cbd5-c0bcaa8b6881@xs4all.nl>
 <20200819013002.GL2360@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200819013002.GL2360@pendragon.ideasonboard.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, Aug 19, 2020 at 04:30:02AM +0300, Laurent Pinchart wrote:
> Hi Hans,
> 
> On Mon, Aug 17, 2020 at 01:00:49PM +0200, Hans Verkuil wrote:
> > On 17/08/2020 01:51, Laurent Pinchart wrote:
> > > On Sun, Aug 16, 2020 at 08:54:18AM -0700, Guenter Roeck wrote:
> > >> On 8/16/20 5:18 AM, Laurent Pinchart wrote:
> > >>> CC'ing Hans Verkuil and Sakari Ailus for the discussion about handling
> > >>> file operations and disconnect in V4L2.
> > >>>
> > >>> On Sat, Aug 15, 2020 at 05:33:15PM -0700, Guenter Roeck wrote:
> > >>>> + linux-uvc-devel@lists.sourceforge.net
> > >>>> + linux-media@vger.kernel.org
> > >>>> + laurent.pinchart@ideasonboard.com
> > >>>>
> > >>>> and changed subject
> > >>>>
> > >>>> On Fri, Aug 14, 2020 at 10:07:39PM -0400, Alan Stern wrote:
> > >>>>> On Fri, Aug 14, 2020 at 04:07:03PM -0700, Guenter Roeck wrote:
> > >>>>>> Hi all,
> > >>>>>>
> > >>>>>> over time, there have been a number of reports of crashes in usb_ifnum_to_if(),
> > >>>>>> called from usb_hcd_alloc_bandwidth, which is in turn called from usb_set_interface().
> > >>>>>> Examples are [1] [2] [3]. A typical backtrace is:
> > >>>>>>
> > >>>>>> <3>[ 3489.445468] intel_sst_acpi 808622A8:00: sst: Busy wait failed, cant send this msg
> > >>>>>> <6>[ 3490.507273] usb 1-4: USB disconnect, device number 3
> > >>>>>> <1>[ 3490.516670] BUG: unable to handle kernel NULL pointer dereference at 0000000000000000
> > >>>>>> <6>[ 3490.516680] PGD 0 P4D 0
> > >>>>>> <4>[ 3490.516687] Oops: 0000 [#1] PREEMPT SMP PTI
> > >>>>>> <4>[ 3490.516693] CPU: 0 PID: 5633 Comm: V4L2CaptureThre Not tainted 4.19.113-08536-g5d29ca36db06 #1
> > >>>>>> <4>[ 3490.516696] Hardware name: GOOGLE Edgar, BIOS Google_Edgar.7287.167.156 03/25/2019
> > >>>>>> <4>[ 3490.516706] RIP: 0010:usb_ifnum_to_if+0x29/0x40
> > >>>>>> <4>[ 3490.516710] Code: ee 0f 1f 44 00 00 55 48 89 e5 48 8b 8f f8 03 00 00 48 85 c9 74 27 44 0f b6 41 04 4d 85 c0 74 1d 31 ff 48 8b 84 f9 98 00 00 00 <48> 8b 10 0f b6 52 02 39 f2 74 0a 48 ff c7 4c 39 c7 72 e5 31 c0 5d
> > >>>>>> <4>[ 3490.516714] RSP: 0018:ffffa46f42a47a80 EFLAGS: 00010246
> > >>>>>> <4>[ 3490.516718] RAX: 0000000000000000 RBX: 0000000000000000 RCX: ffff904a396c9000
> > >>>>>> <4>[ 3490.516721] RDX: ffff904a39641320 RSI: 0000000000000001 RDI: 0000000000000000
> > >>>>>> <4>[ 3490.516724] RBP: ffffa46f42a47a80 R08: 0000000000000002 R09: 0000000000000000
> > >>>>>> <4>[ 3490.516727] R10: 0000000000009975 R11: 0000000000000009 R12: 0000000000000000
> > >>>>>> <4>[ 3490.516731] R13: ffff904a396b3800 R14: ffff904a39e88000 R15: 0000000000000000
> > >>>>>> <4>[ 3490.516735] FS: 00007f396448e700(0000) GS:ffff904a3ba00000(0000) knlGS:0000000000000000
> > >>>>>> <4>[ 3490.516738] CS: 0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> > >>>>>> <4>[ 3490.516742] CR2: 0000000000000000 CR3: 000000016cb46000 CR4: 00000000001006f0
> > >>>>>> <4>[ 3490.516745] Call Trace:
> > >>>>>> <4>[ 3490.516756] usb_hcd_alloc_bandwidth+0x1ee/0x30f
> > >>>>>> <4>[ 3490.516762] usb_set_interface+0x1a3/0x2b7
> > >>>>>> <4>[ 3490.516773] uvc_video_start_transfer+0x29b/0x4b8 [uvcvideo]
> > >>>>>> <4>[ 3490.516781] uvc_video_start_streaming+0x91/0xdd [uvcvideo]
> > >>>>>> <4>[ 3490.516787] uvc_start_streaming+0x28/0x5d [uvcvideo]
> > >>>>>> <4>[ 3490.516795] vb2_start_streaming+0x61/0x143 [videobuf2_common]
> > >>>>>> <4>[ 3490.516801] vb2_core_streamon+0xf7/0x10f [videobuf2_common]
> > >>>>>> <4>[ 3490.516807] uvc_queue_streamon+0x2e/0x41 [uvcvideo]
> > >>>>>> <4>[ 3490.516814] uvc_ioctl_streamon+0x42/0x5c [uvcvideo]
> > >>>>>> <4>[ 3490.516820] __video_do_ioctl+0x33d/0x42a
> > >>>>>> <4>[ 3490.516826] video_usercopy+0x34e/0x5ff
> > >>>>>> <4>[ 3490.516831] ? video_ioctl2+0x16/0x16
> > >>>>>> <4>[ 3490.516837] v4l2_ioctl+0x46/0x53
> > >>>>>> <4>[ 3490.516843] do_vfs_ioctl+0x50a/0x76f
> > >>>>>> <4>[ 3490.516848] ksys_ioctl+0x58/0x83
> > >>>>>> <4>[ 3490.516853] __x64_sys_ioctl+0x1a/0x1e
> > >>>>>> <4>[ 3490.516858] do_syscall_64+0x54/0xde
> > >>>>>>
> > >>>>>> I have been able to reproduce the problem on a Chromebook by strategically placing
> > >>>>>> msleep() calls into usb_set_interface() and usb_disable_device(). Ultimately, the
> > >>>>>> problem boils down to lack of protection against device removal in usb_set_interface()
> > >>>>>> [and/or possibly other callers of usb_ifnum_to_if()].
> > >>>>>>
> > >>>>>> Sequence of events is roughly as follows:
> > >>>>>>
> > >>>>>> - usb_set_interface() is called and proceeds to some point, possibly to
> > >>>>>>   mutex_lock(hcd->bandwidth_mutex);
> > >>>>>> - Device removal event is detected, and usb_disable_device() is called
> > >>>>>
> > >>>>> At this point all interface drivers get unbound (their disconnect 
> > >>>>> routines are called).
> > >>>>>
> > >>>>>> - usb_disable_device() starts removing actconfig data. It has removed
> > >>>>>>   and cleared dev->actconfig->interface[i], but not dev->actconfig
> > >>>>>> - usb_set_interface() calls usb_hcd_alloc_bandwidth(), which calls
> > >>>>>>   usb_ifnum_to_if()
> > >>>>>> - In usb_ifnum_to_if(), dev->actconfig is not NULL, but
> > >>>>>>   dev->actconfig->interface[i] is NULL
> > >>>>>> - crash
> > >>>>>>
> > >>>>>> Question is what we can do about this. Checking if dev->state != USB_STATE_NOTATTACHED
> > >>>>>> in usb_ifnum_to_if() might be a possible approach, but strictly speaking it would
> > >>>>>> still be racy since there is still no lock against device removal. I have not tried
> > >>>>>> calling usb_lock_device() in usb_set_interface() - would that possibly be an option ?
> > >>>>>
> > >>>>> As far as I know, protecting against these races is the responsibility 
> > >>>>> of the USB interface drivers.  They must make sure that their disconnect 
> > >>>>> routines block until all outstanding calls to usb_set_interface return 
> > >>>>> (in fact, until all outstanding device accesses have finished).
> > >>>>>
> > >>>>> For instance, in the log extract you showed, it's obvious that the 
> > >>>>> uvc_start_streaming routine was running after the disconnect routine had 
> > >>>>> returned, which looks like a bug in itself: Once the disconnect routine 
> > >>>>> returns, the driver is not supposed to try to access the device at all 
> > >>>>> because some other driver may now be bound to it.
> > >>>>>
> > >>>>> We can't just call usb_lock_device from within usb_set_interface, 
> > >>>>> because usb_set_interface is often called with that lock already held.
> > >>>>>
> > >>>> I had a closer look into the uvcvideo driver and compared it to other usb
> > >>>> drivers, including drivers in drivers/media/usb/ which connect to the video
> > >>>> subsystem.
> > >>>>
> > >>>> The usbvideo driver lacks protection against calls to uvc_disconnect() while
> > >>>
> > >>> Are you confusing usbvideo and uvcvideo ? Both exist, and uvcvideo would
> > >>> have been called usbvideo if the former hadn't already been in use.
> > >>
> > >> Yes, sorry :-(. I am not sure how s/uvc/usb/ happened.
> > > 
> > > No worries.
> > > 
> > >>>> calls into file operations are ongoing. This is pretty widespread, and not
> > >>>> even limited to file operations (for example, there is a worker which is only
> > >>>> canceled in uvc_delete, not in ucv_disconnect). The existing protection only
> > >>>> ensures that no file operations are started after the call to ucv_disconnect,
> > >>>> but that is insufficient.
> > >>>>
> > >>>> Other drivers do have that protection and make sure that no usb operations
> > >>>> can happen after the disconnect call.
> > >>>>
> > >>>> The only remedy I can see is to rework the usbvideo driver and add the
> > >>>> necessary protections. At first glance, it looks like this may be a
> > >>>> substantial amount of work. I'd sign up for that, but before I start,
> > >>>> I would like to get input from the usbvideo community. Is such an effort
> > >>>> already going on ? If yes, how can I help ? If not, is the problem
> > >>>> understood and accepted ? Are there any ideas on how to solve it ?
> > >>>
> > >>> This is something that has been discussed before, and needs to be solved
> > >>> in the V4L2 framework itself, not in individual drivers. Not only would
> > >>> this avoid rolling out the same code manually everywhere (in different
> > >>> incorrect ways, as races are difficult to solve and implementations are
> > >>> more often wrong than right), but it will also avoid similar issues for
> > >>> non-USB devices.
> > >>
> > >> You mean code that ensures that no user-space v4l2 operation is in progress
> > >> after video_device_unregister / v4l2_device_unregister return ? I agree,
> > >> that would simplify the necessary changes on the uvc side.
> > > 
> > > I was thinking about adding a new function to be called from the
> > > disconnect handler to implement the wait on end of userspace access, but
> > > video_device_unregister() seems an even better idea.
> > > v4l2_device_unregister() is probably not very useful as v4l2_device
> > > isn't exposed to userspace, only video_device is (and v4l2_subdev and
> > > media_device, but that's a different story, although probably still an
> > > issue for the latter in the UVC driver).
> > 
> > Actually, all that is needed is to take the ioctl serialization lock in the disconnect
> > function.
> 
> It's not just ioctls though, the other file operations also need to be
> handled (read, write, mmap).
> 
> > See last paragraph in 1.4.1 here:
> > 
> > https://hverkuil.home.xs4all.nl/spec/driver-api/v4l2-dev.html
> > 
> > Since uvc uses its own lock, you need to take that one.
> 
> Drivers that use their own lock do so to avoid serializing all ioctls.
> This means that different ioctls may be covered by different locks
> (possibly with part of some ioctls running without locking). I don't
> think we can just dismiss the issue saying those drivers need to
> implement the disconnection manually. It would be much better to
> integrate handling of userspace access with video_device_unregister()
> like proposed above, as that will work for all drivers in a transparent
> way. It would also be fairly simple to implement in the V4L2 core.
> 

I don't think it is going to be that simple. Here is a traceback I was able
to collect after playing with msleep() in various locations. This is
_after_ uvc_disconnect() has returned, but before usb_disable_device()
set dev->actconfig to NULL.

[ 9619.003726] config->interface[0] is NULL
[ 9619.009114] WARNING: CPU: 0 PID: 2757 at drivers/usb/core/usb.c:285 usb_ifnum_to_if+0x81/0x85
               ^^^ added log message and WARN() to prevent crash

[ 9619.018647] Modules linked in: snd_seq_dummy snd_seq bridge stp llc veth tun nf_nat_tftp nf_conntrack_tftp nf_nat_ftp nf_conntrack_ftp xfrm6_mode_tunnel xfrm6_mode_transport xfrm4_mode_tunnel xfrm4_mode_transport esp6 ah6 ip6t_REJECT ip6t_ipv6header wacom rfcomm cmac algif_hash algif_skcipher af_alg uinput snd_soc_sst_bxt_da7219_max98357a snd_soc_hdac_hdmi snd_soc_dmic snd_soc_skl_ssp_clk snd_soc_skl snd_soc_skl_ipc snd_soc_sst_ipc snd_soc_sst_dsp snd_soc_acpi_intel_match snd_soc_acpi snd_hda_ext_core snd_intel_nhlt snd_hda_core snd_soc_max98357a acpi_als kfifo_buf industrialio snd_soc_da7219 ipt_MASQUERADE fuse snd_usb_audio snd_usbmidi_lib snd_hwdep snd_rawmidi snd_seq_device uvcvideo videobuf2_v4l2 videobuf2_common videobuf2_vmalloc videobuf2_memops iwlmvm iwl7000_mac80211 lzo_rle lzo_compress
[ 9619.097545]  zram r8152 mii iwlwifi cfg80211 btusb btrtl btintel btbcm bluetooth ecdh_generic joydev
[ 9619.107762] CPU: 0 PID: 2757 Comm: inotify_reader Not tainted 4.19.139 #20
[ 9619.115443] Hardware name: Google Phaser/Phaser, BIOS Google_Phaser.10952.0.0 08/09/2018
[ 9619.124490] RIP: 0010:usb_ifnum_to_if+0x81/0x85
[ 9619.129542] Code: 02 44 39 f1 74 0a 48 ff c6 48 39 c6 72 df 31 db 48 89 d8 5b 41 5e 41 5f 5d c3 31 db 48 c7 c7 08 f8 cd a8 31 c0 e8 dd 1b 9f ff <0f> 0b eb e2 0f 1f 44 00 00 55 48 89 e5 44 8b 47 10 31 c0 45 85 c0
[ 9619.150530] RSP: 0018:ffff9ee20141fa58 EFLAGS: 00010246
[ 9619.156368] RAX: 438a0e5a525f1800 RBX: 0000000000000000 RCX: 0000000000000000
[ 9619.164339] RDX: ffff975477a1de90 RSI: ffff975477a153d0 RDI: ffff975477a153d0
[ 9619.172309] RBP: ffff9ee20141fa70 R08: 000000000000002c R09: 002daec189138d78
[ 9619.180279] R10: 0000001000000000 R11: ffffffffa7da42e6 R12: ffff975459594800
[ 9619.188241] R13: 0000000000000001 R14: 0000000000000001 R15: ffff975465376400
[ 9619.196212] FS:  00007ddebffd6700(0000) GS:ffff975477a00000(0000) knlGS:0000000000000000
[ 9619.205251] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[ 9619.211670] CR2: 0000000012c83000 CR3: 00000001bbaf8000 CR4: 0000000000340ef0
[ 9619.219641] Call Trace:
[ 9619.222378]  usb_set_interface+0x3b/0x2f3
[ 9619.226862]  uvc_video_stop_streaming+0x38/0x81 [uvcvideo]
[ 9619.232983]  uvc_stop_streaming+0x21/0x49 [uvcvideo]
[ 9619.238531]  __vb2_queue_cancel+0x33/0x249 [videobuf2_common]
[ 9619.244951]  vb2_core_queue_release+0x1c/0x45 [videobuf2_common]
[ 9619.251662]  uvc_queue_release+0x26/0x32 [uvcvideo]
[ 9619.257114]  uvc_v4l2_release+0x41/0xdd [uvcvideo]
[ 9619.262469]  v4l2_release+0x99/0xed
[ 9619.266367]  __fput+0xf0/0x1ea
[ 9619.269778]  task_work_run+0x7f/0xa7
[ 9619.273769]  do_exit+0x1d1/0x6eb
[ 9619.277375]  do_group_exit+0x9d/0xac
[ 9619.281367]  get_signal+0x135/0x482
[ 9619.285262]  do_signal+0x4a/0x63c
[ 9619.288965]  exit_to_usermode_loop+0x86/0xa5
[ 9619.293732]  do_syscall_64+0x171/0x269
[ 9619.297919]  ? __do_page_fault+0x272/0x474
[ 9619.302495]  entry_SYSCALL_64_after_hwframe+0x44/0xa9
[ 9619.308156] RIP: 0033:0x7ddec156dc26
[ 9619.312161] Code: Bad RIP value.
[ 9619.315763] RSP: 002b:00007ddebffd5c10 EFLAGS: 00000293 ORIG_RAX: 0000000000000017
[ 9619.324221] RAX: fffffffffffffdfe RBX: 000000000000000a RCX: 00007ddec156dc26
[ 9619.332194] RDX: 0000000000000000 RSI: 00007ddebffd5d28 RDI: 000000000000000a
[ 9619.340166] RBP: 00007ddebffd5c50 R08: 0000000000000000 R09: 0000000000000000
[ 9619.348156] R10: 0000000000000000 R11: 0000000000000293 R12: 00007ddebffd5d28
[ 9619.356127] R13: 0000000000000000 R14: 0000000000000000 R15: 0000000000000000

usb_set_interface() should not be called anymore after uvc_disconnect(),
or at east I think so (is that documented anywhere ?).
Yet, that obviously happens, and it happens completely outside lock
control. And this is just one instance where I was actually able
to see the problem. I am quite sure that there are more.

> > > We also have a v4l2_device_disconnect() function which is supposed to
> > > handle hot-pluggable device disconnection, but it's fairly useless (I'd
> > > even say harmful as it gives the illusion that hotplugging is correctly
> > > handled, while in reality the media subsystem is plagged by hot-unplug
> > > issues :-S).
> > 
> > The v4l2_device_disconnect() is there to remove a v4l2_dev reference to
> > the device that is about to be removed when the disconnect() exists.
> > Otherwise v4l2_dev->dev would point to a missing device.
> > 
> > However, I wonder if it is still needed: commit 236c5441d703 from 2011 added
> > code to take a reference to v4l2_dev->dev in v4l2_device_register(). This
> > should prevent the device from disappearing until v4l2_device_unregister() is
> > called. I suspect that v4l2_device_disconnect() can be removed completely, and
> > instead v4l2_device_unregister() just calls put_device(v4l2_dev->dev).
> > 
> > I don't like v4l2_device_disconnect() either, so if this works, then that would
> > be a nice simplification.
> > 

Maybe I am missing something, but v4l2_device_unregister() already calls
v4l2_device_disconnect(). With that, I don't see a difference to just calling
v4l2_device_unregister().

Anyway, I'll keep digging.

Thanks,
Guenter
