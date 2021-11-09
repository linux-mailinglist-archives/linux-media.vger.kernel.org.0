Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6EB1B44A5B7
	for <lists+linux-media@lfdr.de>; Tue,  9 Nov 2021 05:15:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239920AbhKIER6 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 8 Nov 2021 23:17:58 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59112 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236991AbhKIER5 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 8 Nov 2021 23:17:57 -0500
Received: from mail-pf1-x435.google.com (mail-pf1-x435.google.com [IPv6:2607:f8b0:4864:20::435])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B07F5C061764;
        Mon,  8 Nov 2021 20:15:12 -0800 (PST)
Received: by mail-pf1-x435.google.com with SMTP id g19so12208715pfb.8;
        Mon, 08 Nov 2021 20:15:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=diveS3cmB+0mO95mgP66K3r1pONgbtACpNuECiPAciM=;
        b=ZxkmgismBj+MJ0ugdTuxyOzYouHxsDyfVYnoTi4YUBLYcIySTPwneZkTy8pSJPsofc
         ynXsxWY4gpLwNhXm5inIveR1RpWq2Lx8CbakYlvCuetB6IfX9f5XHMqJqTOc1UuYjPIO
         el+TSNc2vhP0ZaGwmmmMauCeJOF7GD+A9ggMl6PLj1NJMBQlpnXoOVCpiGzy10VkpBOO
         MW4GqpfgCfQ+HEZUWk1Lqx94iTLto3k/UJdzRyNaqevJU2l8/Qyit4ukHfY259DtmT5O
         g29n7ylVMJjOhc+3nBgijfwUQiMN9VxZ53DGoefpdISLeaRXsxdAO/EuHeL3HzU33PX6
         HdmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=diveS3cmB+0mO95mgP66K3r1pONgbtACpNuECiPAciM=;
        b=nUBP77nUey64jcj54KjIZh77/bVJhBK4wmenmxWOKeJvxLRJoEvmzDOgSowWK0KmY0
         oOaKUvwMlTv96G72czRjIxJvx7eBkUvzd5IvBtrQKy/ytLhfPIg43Nex3xUBWHtrzpo3
         e04bI2sbBkLPTyn44cGshrsvwEI4fec+mW/D27tLOwbr3YVZdzi2q1LD6Z82t0KLPL8+
         PZtqSZuz88//hcktX7sn5Ol4KZgqI+q3Jv9ybQHv8we+WXoYY1IqQisND+vXoNMJw9sL
         XnZhudFs55DGgy0PTvCHCi8ZCY6jxta09o1U6SrCdhp5zrxv3kJCn0x+V58Dis9dKaJV
         vsWA==
X-Gm-Message-State: AOAM530o+pQ0ZCwSpDx3LuWDp3hsaghwLneCgfd3aSrPG2Kgagqz2MNq
        DLXi3oFF2yII5ee9mPSWQ6M=
X-Google-Smtp-Source: ABdhPJyBAHDnnhMEYmUd2P6MbewT+wngInxP5/TbPS52VbIuC6P54KNcFb819nUH/hgWrtRl2QqPCg==
X-Received: by 2002:a63:ff04:: with SMTP id k4mr3579503pgi.309.1636431312063;
        Mon, 08 Nov 2021 20:15:12 -0800 (PST)
Received: from ?IPv6:2400:4052:6980:3800:dba7:2b1f:3f26:a5ec? ([2400:4052:6980:3800:dba7:2b1f:3f26:a5ec])
        by smtp.gmail.com with ESMTPSA id d2sm18184506pfj.42.2021.11.08.20.15.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Nov 2021 20:15:11 -0800 (PST)
Message-ID: <49805a35ff095b21ec364900d0451cc889590002.camel@gmail.com>
Subject: Re: [BUG 5/5] [BUG] media: atomisp: atomisp causes touchscreen to
 stop working on Microsoft Surface 3
From:   Tsuchiya Yuto <kitakar@gmail.com>
To:     Hans de Goede <hdegoede@redhat.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     Patrik Gfeller <patrik.gfeller@gmail.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Peter Zijlstra <peterz@infradead.org>,
        Ingo Molnar <mingo@kernel.org>,
        Kaixu Xia <kaixuxia@tencent.com>,
        Dan Carpenter <dan.carpenter@oracle.com>,
        Arnd Bergmann <arnd@arndb.de>, linux-media@vger.kernel.org,
        linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Date:   Tue, 09 Nov 2021 13:15:07 +0900
In-Reply-To: <310ace44-93d5-99a3-bb4c-371b0a13462d@redhat.com>
References: <20211017162337.44860-1-kitakar@gmail.com>
         <20211017162337.44860-6-kitakar@gmail.com>
         <103b5438-9f7c-7e89-28b9-29fe11eb818c@redhat.com>
         <cfad27a4bfdd94417305e1519e2f450a4422844d.camel@gmail.com>
         <310ace44-93d5-99a3-bb4c-371b0a13462d@redhat.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.4 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, 2021-11-08 at 00:39 +0100, Hans de Goede wrote:
> Hi,
> 
> On 10/21/21 11:52, Tsuchiya Yuto wrote:
> > Thank you for your comment :-)
> > 
> > First, I need to correct what I said in the previous mail. I later found
> > that loading only "atomisp" (as well as its dependency,
> > atomisp_gmin_platform) does not cause this issue.
> > 
> > What causes this issue is rather, loading sensor drivers (as well as its
> > dependency, atomisp_gmin_platform).
> > 
> > These sensor drivers for surface3 are both not upstream, but I made them
> > as similar as possible to the upstreamed ones. So, I guess this issue
> > can still be reproducible on some other devices.
> 
> I've run some test on my own surface3 and the problem is the writing
> of 0x62 (which becomes just 0x02) to the 0x57 register of the PMIC,
> writing 0x00 to that after loading the sensor driver makes things work
> again.
> 
> I have not had time to investigate this further.
> 
> I used media-staging + your sensor drivers from:
> https://github.com/kitakar5525/surface3-atomisp-cameras.git
> 
> Which was enough to figure this out, but I've not actually gotten
> either of the cameras working :|  I get:
> 
> [user@fedora nvt]$ ./atomisp-test.sh 
> p0: OPEN video device `/dev/video2'
> p0: VIDIOC_S_INPUT <- 1
> p0: ATOMISP_IOC_S_EXPOSURE integration_time={30000,30000} gain={30000,30000}
> p0: ./v4l2n: ATOMISP_IOC_S_EXPOSURE failed on fd 3: Inappropriate ioctl for device (25)
> p0: CLOSED video device
> 
> No matter which value I pass for VIDIOC_S_INPUT (tried 0 and 1) any ideas?

I also tried with the latest media-staging patches, and turned out that
somehow I need to revert this commit ("media: atomisp: fix VIDIOC_S_FMT
logic"). If you applied this patch, reverting this for now should make
the world-facing camera (ov8835) work.

Quick test revealed that upstreamed ov5693 driver is also affected this
(confirmed on mipad2) with the following log:

        $ sudo dmesg -xw
        kern  :err   : [  840.165422] atomisp-isp2 0000:00:03.0: can't change power state from D3cold to D0 (config space inaccessible)
        kern  :warn  : [  840.171126] isys dma store at addr(0xcd408) val(0)
        kern  :info  : [  840.171890] ov5693_s_power: on 1
        kern  :info  : [  840.220418] ov5693_init
        kern  :warn  : [  840.321579] CPU: 3 PID: 3114 Comm: v4l2n Tainted: G        WC OE     5.15.0-1-surface-mainline #4 a88d9b28206d4c7ef4fe4f41076a231501cdd2c8
        kern  :warn  : [  840.321613] Hardware name: Xiaomi Inc Mipad2/Mipad, BIOS MIPad-P4.X64.0043.R03.1603071414 03/07/2016
        kern  :warn  : [  840.321622] Call Trace:
        kern  :warn  : [  840.321641]  dump_stack_lvl+0x46/0x62
        kern  :warn  : [  840.321678]  ia_css_binary_find+0xa7d/0xd10 [atomisp f8192e88d06518afeafd868d132019e1c605ae55]
        kern  :warn  : [  840.321959]  load_preview_binaries+0x41f/0x4d0 [atomisp f8192e88d06518afeafd868d132019e1c605ae55]
        kern  :warn  : [  840.322216]  ia_css_stream_create+0xd98/0x17c0 [atomisp f8192e88d06518afeafd868d132019e1c605ae55]
        kern  :warn  : [  840.322467]  __create_streams+0x264/0xd80 [atomisp f8192e88d06518afeafd868d132019e1c605ae55]
        kern  :warn  : [  840.322694]  __get_frame_info+0xc0/0x320 [atomisp f8192e88d06518afeafd868d132019e1c605ae55]
        kern  :warn  : [  840.322931]  ? atomisp_css_video_get_output_frame_info+0x80/0x80 [atomisp f8192e88d06518afeafd868d132019e1c605ae55]
        kern  :warn  : [  840.323157]  atomisp_set_fmt+0x121c/0x1cc0 [atomisp f8192e88d06518afeafd868d132019e1c605ae55]
        kern  :warn  : [  840.323377]  ? newidle_balance+0x138/0x430
        kern  :warn  : [  840.323396]  ? atomisp_css_copy_get_output_frame_info+0x20/0x20 [atomisp f8192e88d06518afeafd868d132019e1c605ae55]
        kern  :warn  : [  840.323663]  atomisp_s_fmt_cap+0x40/0x70 [atomisp f8192e88d06518afeafd868d132019e1c605ae55]
        kern  :warn  : [  840.323898]  v4l_s_fmt+0x32a/0x5d0 [videodev dd91554b6b7a8a8394b47bdd48fb7420233a4650]
        kern  :warn  : [  840.324003]  __video_do_ioctl+0x3c5/0x400 [videodev dd91554b6b7a8a8394b47bdd48fb7420233a4650]
        kern  :warn  : [  840.324108]  video_usercopy+0x151/0x780 [videodev dd91554b6b7a8a8394b47bdd48fb7420233a4650]
        kern  :warn  : [  840.324205]  ? v4l_print_control+0x20/0x20 [videodev dd91554b6b7a8a8394b47bdd48fb7420233a4650]
        kern  :warn  : [  840.324308]  v4l2_ioctl+0x48/0x60 [videodev dd91554b6b7a8a8394b47bdd48fb7420233a4650]
        kern  :warn  : [  840.324401]  __x64_sys_ioctl+0x8e/0xd0
        kern  :warn  : [  840.324426]  do_syscall_64+0x5c/0x90
        kern  :warn  : [  840.324450]  ? do_syscall_64+0x69/0x90
        kern  :warn  : [  840.324466]  ? ksys_write+0x67/0xf0
        kern  :warn  : [  840.324485]  ? syscall_exit_to_user_mode+0x23/0x50
        kern  :warn  : [  840.324502]  ? do_syscall_64+0x69/0x90
        kern  :warn  : [  840.324519]  ? exc_page_fault+0x72/0x180
        kern  :warn  : [  840.324533]  entry_SYSCALL_64_after_hwframe+0x44/0xae
        kern  :warn  : [  840.324554] RIP: 0033:0x46c08b
        kern  :warn  : [  840.324572] Code: 5c c3 0f 1f 44 00 00 31 ff e8 91 7a 02 00 4c 8b 25 e2 30 0a 00 85 c0 79 90 eb ab 0f 1f 40 00 f3 0f 1e fa b8 10 00 00 00 0f 05 <48> 3d 01 f0 ff ff 73 01 c3
48 c7 c1 c0 ff ff ff f7 d8 64 89 01 48
        kern  :warn  : [  840.324584] RSP: 002b:00007ffcd87d0378 EFLAGS: 00000246 ORIG_RAX: 0000000000000010
        kern  :warn  : [  840.324606] RAX: ffffffffffffffda RBX: 0000000000000000 RCX: 000000000046c08b
        kern  :warn  : [  840.324616] RDX: 00007ffcd87d03e0 RSI: ffffffffc0d05605 RDI: 0000000000000003
        kern  :warn  : [  840.324625] RBP: 00007ffcd87d03b0 R08: 0000000000000000 R09: 00007ffcd87d0100
        kern  :warn  : [  840.324635] R10: 000000003231564e R11: 0000000000000246 R12: 000000000040cef0
        kern  :warn  : [  840.324644] R13: 0000000000000000 R14: 00000000004e5018 R15: 0000000000400580
        kern  :warn  : [  840.324661]  ? perf_trace_rdev_set_default_beacon_key+0x225/0x230 [cfg80211 0c5445915bd6781bf918218ab74f6ed610236fa6]
        kern  :err   : [  840.325998] atomisp-isp2 0000:00:03.0: can't create streams
        kern  :err   : [  840.326028] atomisp-isp2 0000:00:03.0: __get_frame_info 2560x1440 (padded to 0) returned -22
        kern  :warn  : [  840.326045] atomisp-isp2 0000:00:03.0: Can't set format on ISP. Error -22
        kern  :info  : [  840.326177] ov5693_s_power: on 0

        # output from intel-nvt
        $ ./v4l2n -o testimage_@.raw \
                --device /dev/video0 \
                --input 0 \
                --exposure=100000,100000,100000,100000 \
                --parm type=1,capturemode=CI_MODE_PREVIEW \
                --fmt type=1,width=1920,height=1080,pixelformat=NV12 \
                --reqbufs count=2,memory=USERPTR \
                --parameters=wb_config.r=32768,wb_config.gr=21043,wb_config.gb=21043,wb_config.b=30863 \
                --capture=2 \

        p0: OPEN video device `/dev/video0'
        p0: VIDIOC_S_INPUT <- 0
        p0: ATOMISP_IOC_S_EXPOSURE integration_time={100000,100000} gain={100000,100000}
        p0: VIDIOC_S_PARM
        p0: : type:          VIDEO_CAPTURE [1]
        p0: : capability:    0
        p0: : capturemode:   CI_MODE_PREVIEW [0x00008000]
        p0: : timeperframe:  0/0
        p0: : extendedmode:  0
        p0: : readbuffers:   0
        p0: VIDIOC_S_FMT
        p0: ./v4l2n: VIDIOC_S_FMT failed on fd 3: Invalid argument (22)
        p0: CLOSED video device

But somehow the world-facing camera (t4ka3) on mipad2 (which I ported
from Android kernel, non-upstream) is still working. So, I guess there
are issues on some sensor drivers side?

Mauro: do you know what could be a issue on sensor drivers? (especially
for the upstreamed ov5693)?

For the user-facing camera (ar0330), I haven't added this note anywhere,
exposure is not implemented yet. And in this case, if I try to set
exposure values using intel-nvt, atomisp stops working. Your above nvt
log shows this case. If you remove the `--exposure` option, you should
get a black image at least (yes, somehow not working yet).



Regards,
Tsuchiya Yuto

