Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BA7E944A7A4
	for <lists+linux-media@lfdr.de>; Tue,  9 Nov 2021 08:35:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241207AbhKIHi0 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 9 Nov 2021 02:38:26 -0500
Received: from mail.kernel.org ([198.145.29.99]:44156 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231136AbhKIHiZ (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 9 Nov 2021 02:38:25 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 52EF2610A6;
        Tue,  9 Nov 2021 07:35:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1636443340;
        bh=RApeh5j6BivyvF+6+rDqICAIVI9fe8NZw7R3wdX4EbY=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=W06ZRaFts+Unf3RoHSEVUdiIANazSXzdtR3eot0esfhutLqTAG4CcF84b9HZDizz6
         wglK16CSYfSfgWp3/f9NVJDRF9DKMDGgovX5Thuxf/fbWTVNcUuS/vv7Dx6BXuIWn6
         5X028tGpOVdry620gkZH81pnfg2QC1/tDqdK++mmH3uE9B8xWnSyrpGudJBV86vesg
         yN6kp9XarQUM6Qp8O5jyX4Re052MvgoK9TQP2ZvXfwf7FNx6kBMBbYhNkex/12dhgc
         SAIb/dq+NcG3YGdUarlsp59IGGBWr17fmXdxlVjmWLOVeTgc9yypQk3uII7MkmebFp
         PUpGaQnrJrBTQ==
Date:   Tue, 9 Nov 2021 07:35:34 +0000
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Tsuchiya Yuto <kitakar@gmail.com>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        Patrik Gfeller <patrik.gfeller@gmail.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Peter Zijlstra <peterz@infradead.org>,
        Ingo Molnar <mingo@kernel.org>,
        Kaixu Xia <kaixuxia@tencent.com>,
        Dan Carpenter <dan.carpenter@oracle.com>,
        Arnd Bergmann <arnd@arndb.de>, linux-media@vger.kernel.org,
        linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [BUG 5/5] [BUG] media: atomisp: atomisp causes touchscreen to
 stop working on Microsoft Surface 3
Message-ID: <20211109073534.29353535@sal.lan>
In-Reply-To: <49805a35ff095b21ec364900d0451cc889590002.camel@gmail.com>
References: <20211017162337.44860-1-kitakar@gmail.com>
        <20211017162337.44860-6-kitakar@gmail.com>
        <103b5438-9f7c-7e89-28b9-29fe11eb818c@redhat.com>
        <cfad27a4bfdd94417305e1519e2f450a4422844d.camel@gmail.com>
        <310ace44-93d5-99a3-bb4c-371b0a13462d@redhat.com>
        <49805a35ff095b21ec364900d0451cc889590002.camel@gmail.com>
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.30; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Em Tue, 09 Nov 2021 13:15:07 +0900
Tsuchiya Yuto <kitakar@gmail.com> escreveu:

> On Mon, 2021-11-08 at 00:39 +0100, Hans de Goede wrote:
> > Hi,
> > 
> > On 10/21/21 11:52, Tsuchiya Yuto wrote:  
> > > Thank you for your comment :-)
> > > 
> > > First, I need to correct what I said in the previous mail. I later found
> > > that loading only "atomisp" (as well as its dependency,
> > > atomisp_gmin_platform) does not cause this issue.
> > > 
> > > What causes this issue is rather, loading sensor drivers (as well as its
> > > dependency, atomisp_gmin_platform).
> > > 
> > > These sensor drivers for surface3 are both not upstream, but I made them
> > > as similar as possible to the upstreamed ones. So, I guess this issue
> > > can still be reproducible on some other devices.  
> > 
> > I've run some test on my own surface3 and the problem is the writing
> > of 0x62 (which becomes just 0x02) to the 0x57 register of the PMIC,
> > writing 0x00 to that after loading the sensor driver makes things work
> > again.
> > 
> > I have not had time to investigate this further.
> > 
> > I used media-staging + your sensor drivers from:
> > https://github.com/kitakar5525/surface3-atomisp-cameras.git
> > 
> > Which was enough to figure this out, but I've not actually gotten
> > either of the cameras working :|  I get:
> > 
> > [user@fedora nvt]$ ./atomisp-test.sh 
> > p0: OPEN video device `/dev/video2'
> > p0: VIDIOC_S_INPUT <- 1
> > p0: ATOMISP_IOC_S_EXPOSURE integration_time={30000,30000} gain={30000,30000}
> > p0: ./v4l2n: ATOMISP_IOC_S_EXPOSURE failed on fd 3: Inappropriate ioctl for device (25)
> > p0: CLOSED video device
> > 
> > No matter which value I pass for VIDIOC_S_INPUT (tried 0 and 1) any ideas?  
> 
> I also tried with the latest media-staging patches, and turned out that
> somehow I need to revert this commit ("media: atomisp: fix VIDIOC_S_FMT
> logic"). If you applied this patch, reverting this for now should make
> the world-facing camera (ov8835) work.
> 
> Quick test revealed that upstreamed ov5693 driver is also affected this
> (confirmed on mipad2) with the following log:
> 
>         $ sudo dmesg -xw
>         kern  :err   : [  840.165422] atomisp-isp2 0000:00:03.0: can't change power state from D3cold to D0 (config space inaccessible)
>         kern  :warn  : [  840.171126] isys dma store at addr(0xcd408) val(0)
>         kern  :info  : [  840.171890] ov5693_s_power: on 1
>         kern  :info  : [  840.220418] ov5693_init
>         kern  :warn  : [  840.321579] CPU: 3 PID: 3114 Comm: v4l2n Tainted: G        WC OE     5.15.0-1-surface-mainline #4 a88d9b28206d4c7ef4fe4f41076a231501cdd2c8
>         kern  :warn  : [  840.321613] Hardware name: Xiaomi Inc Mipad2/Mipad, BIOS MIPad-P4.X64.0043.R03.1603071414 03/07/2016
>         kern  :warn  : [  840.321622] Call Trace:
>         kern  :warn  : [  840.321641]  dump_stack_lvl+0x46/0x62
>         kern  :warn  : [  840.321678]  ia_css_binary_find+0xa7d/0xd10 [atomisp f8192e88d06518afeafd868d132019e1c605ae55]
>         kern  :warn  : [  840.321959]  load_preview_binaries+0x41f/0x4d0 [atomisp f8192e88d06518afeafd868d132019e1c605ae55]
>         kern  :warn  : [  840.322216]  ia_css_stream_create+0xd98/0x17c0 [atomisp f8192e88d06518afeafd868d132019e1c605ae55]
>         kern  :warn  : [  840.322467]  __create_streams+0x264/0xd80 [atomisp f8192e88d06518afeafd868d132019e1c605ae55]
>         kern  :warn  : [  840.322694]  __get_frame_info+0xc0/0x320 [atomisp f8192e88d06518afeafd868d132019e1c605ae55]
>         kern  :warn  : [  840.322931]  ? atomisp_css_video_get_output_frame_info+0x80/0x80 [atomisp f8192e88d06518afeafd868d132019e1c605ae55]
>         kern  :warn  : [  840.323157]  atomisp_set_fmt+0x121c/0x1cc0 [atomisp f8192e88d06518afeafd868d132019e1c605ae55]
>         kern  :warn  : [  840.323377]  ? newidle_balance+0x138/0x430
>         kern  :warn  : [  840.323396]  ? atomisp_css_copy_get_output_frame_info+0x20/0x20 [atomisp f8192e88d06518afeafd868d132019e1c605ae55]
>         kern  :warn  : [  840.323663]  atomisp_s_fmt_cap+0x40/0x70 [atomisp f8192e88d06518afeafd868d132019e1c605ae55]
>         kern  :warn  : [  840.323898]  v4l_s_fmt+0x32a/0x5d0 [videodev dd91554b6b7a8a8394b47bdd48fb7420233a4650]
>         kern  :warn  : [  840.324003]  __video_do_ioctl+0x3c5/0x400 [videodev dd91554b6b7a8a8394b47bdd48fb7420233a4650]
>         kern  :warn  : [  840.324108]  video_usercopy+0x151/0x780 [videodev dd91554b6b7a8a8394b47bdd48fb7420233a4650]
>         kern  :warn  : [  840.324205]  ? v4l_print_control+0x20/0x20 [videodev dd91554b6b7a8a8394b47bdd48fb7420233a4650]
>         kern  :warn  : [  840.324308]  v4l2_ioctl+0x48/0x60 [videodev dd91554b6b7a8a8394b47bdd48fb7420233a4650]
>         kern  :warn  : [  840.324401]  __x64_sys_ioctl+0x8e/0xd0
>         kern  :warn  : [  840.324426]  do_syscall_64+0x5c/0x90
>         kern  :warn  : [  840.324450]  ? do_syscall_64+0x69/0x90
>         kern  :warn  : [  840.324466]  ? ksys_write+0x67/0xf0
>         kern  :warn  : [  840.324485]  ? syscall_exit_to_user_mode+0x23/0x50
>         kern  :warn  : [  840.324502]  ? do_syscall_64+0x69/0x90
>         kern  :warn  : [  840.324519]  ? exc_page_fault+0x72/0x180
>         kern  :warn  : [  840.324533]  entry_SYSCALL_64_after_hwframe+0x44/0xae
>         kern  :warn  : [  840.324554] RIP: 0033:0x46c08b
>         kern  :warn  : [  840.324572] Code: 5c c3 0f 1f 44 00 00 31 ff e8 91 7a 02 00 4c 8b 25 e2 30 0a 00 85 c0 79 90 eb ab 0f 1f 40 00 f3 0f 1e fa b8 10 00 00 00 0f 05 <48> 3d 01 f0 ff ff 73 01 c3
> 48 c7 c1 c0 ff ff ff f7 d8 64 89 01 48
>         kern  :warn  : [  840.324584] RSP: 002b:00007ffcd87d0378 EFLAGS: 00000246 ORIG_RAX: 0000000000000010
>         kern  :warn  : [  840.324606] RAX: ffffffffffffffda RBX: 0000000000000000 RCX: 000000000046c08b
>         kern  :warn  : [  840.324616] RDX: 00007ffcd87d03e0 RSI: ffffffffc0d05605 RDI: 0000000000000003
>         kern  :warn  : [  840.324625] RBP: 00007ffcd87d03b0 R08: 0000000000000000 R09: 00007ffcd87d0100
>         kern  :warn  : [  840.324635] R10: 000000003231564e R11: 0000000000000246 R12: 000000000040cef0
>         kern  :warn  : [  840.324644] R13: 0000000000000000 R14: 00000000004e5018 R15: 0000000000400580
>         kern  :warn  : [  840.324661]  ? perf_trace_rdev_set_default_beacon_key+0x225/0x230 [cfg80211 0c5445915bd6781bf918218ab74f6ed610236fa6]
>         kern  :err   : [  840.325998] atomisp-isp2 0000:00:03.0: can't create streams
>         kern  :err   : [  840.326028] atomisp-isp2 0000:00:03.0: __get_frame_info 2560x1440 (padded to 0) returned -22
>         kern  :warn  : [  840.326045] atomisp-isp2 0000:00:03.0: Can't set format on ISP. Error -22
>         kern  :info  : [  840.326177] ov5693_s_power: on 0
> 
>         # output from intel-nvt
>         $ ./v4l2n -o testimage_@.raw \
>                 --device /dev/video0 \
>                 --input 0 \
>                 --exposure=100000,100000,100000,100000 \
>                 --parm type=1,capturemode=CI_MODE_PREVIEW \
>                 --fmt type=1,width=1920,height=1080,pixelformat=NV12 \
>                 --reqbufs count=2,memory=USERPTR \
>                 --parameters=wb_config.r=32768,wb_config.gr=21043,wb_config.gb=21043,wb_config.b=30863 \
>                 --capture=2 \
> 
>         p0: OPEN video device `/dev/video0'
>         p0: VIDIOC_S_INPUT <- 0
>         p0: ATOMISP_IOC_S_EXPOSURE integration_time={100000,100000} gain={100000,100000}
>         p0: VIDIOC_S_PARM
>         p0: : type:          VIDEO_CAPTURE [1]
>         p0: : capability:    0
>         p0: : capturemode:   CI_MODE_PREVIEW [0x00008000]
>         p0: : timeperframe:  0/0
>         p0: : extendedmode:  0
>         p0: : readbuffers:   0
>         p0: VIDIOC_S_FMT
>         p0: ./v4l2n: VIDIOC_S_FMT failed on fd 3: Invalid argument (22)
>         p0: CLOSED video device
> 
> But somehow the world-facing camera (t4ka3) on mipad2 (which I ported
> from Android kernel, non-upstream) is still working. So, I guess there
> are issues on some sensor drivers side?
> 
> Mauro: do you know what could be a issue on sensor drivers? (especially
> for the upstreamed ov5693)?

I have some hints, based on what changeset e4c5cfe8d96d ("media: atomisp:
 fix VIDIOC_S_FMT logic") is meant to fix:

1. atomisp wastes 16 columns and 16 lines per default (pad_h/pad_w). Those
   are controlled by a modprobe parameter. The entire logic is based on
   the assumption that the sensor drivers will add those extra 16 bytes
   to the formats. Upstreamed sensors (out of staging) won't do the same,
   which could be the cause of problems.
 
   On other words, if you set 1920x1080, atomisp will try to find a
   resolution at the source pad (sensor) with 1936x1096, and will set
   the output pad to 1920x1080.

   I would try:

		$ modprobe atomisp with pad_h=0 pad_w=0

   and see if it would solve the issue. I would expect some artifacts
   at the image borders, though, depending on the pipeline;

2. I got a bug with atomisp-ov2680 when setting resolution. Such
   driver supports two resolutions:

	- 1616x1216
	- 1616x916

   The logic which finds the nearest resolution at the downstream drivers
   were broken, causing the driver to get the wrong resolution if the
   atomisp driver requests a higher resolution. So, it returns 1616x916
   if, for instance, userspace requests 1616x1216 (which is internally
   converted into 1632x1232).

   You could enable some debug info in order to check what resolution
   atomisp is requesting and what the sensor is returning back.

Besides that, the patch also fix two issues that aren't probably related
to the issue you're seeing:

- The driver returns the sensor format, e.g. with pad (+16) added to
  both vertical and horizontal resolutions;
 
- if pixfmt==BG10 (and probably any other bayer format), S_FMT fails.

I hope that helps.

Regards,
Mauro
