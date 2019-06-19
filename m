Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 44ECA4B005
	for <lists+linux-media@lfdr.de>; Wed, 19 Jun 2019 04:29:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728195AbfFSC3p (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 18 Jun 2019 22:29:45 -0400
Received: from cdptpa-outbound-snat.email.rr.com ([107.14.166.228]:23422 "EHLO
        cdptpa-cmomta01.email.rr.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726037AbfFSC3p (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 18 Jun 2019 22:29:45 -0400
Received: from [192.168.2.97] ([72.182.16.184])
        by cmsmtp with ESMTP
        id dQLkhpbaTXdhhdQLmhg29U; Wed, 19 Jun 2019 02:29:27 +0000
Subject: Re: hdpvr mutex deadlock on kernel 5.1.x
To:     Hans Verkuil <hverkuil@xs4all.nl>,
        Linux Media Mailing List <linux-media@vger.kernel.org>
References: <14d31c83-f48f-319d-6b3a-0753ea9d2c02@austin.rr.com>
 <8e18508d-7c36-ead7-4c92-7335813895d0@xs4all.nl>
 <1aa17133-342a-45e3-453d-896a1062ea21@austin.rr.com>
 <857b40ad-d474-5a4c-e65b-99035fa1a50b@xs4all.nl>
From:   Keith Pyle <kpyle@austin.rr.com>
Message-ID: <15f3c149-4597-2f45-06af-a668db4c694b@austin.rr.com>
Date:   Tue, 18 Jun 2019 21:29:23 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.0
MIME-Version: 1.0
In-Reply-To: <857b40ad-d474-5a4c-e65b-99035fa1a50b@xs4all.nl>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-CMAE-Envelope: MS4wfHHg61QyCD+ResGo4PmidSB+2PiVPdaZCdp5v/6xyUHQIqYD3cr1HJT1TnMK7SzOi+dYUNvoH8rr6vuqY7j1wc5j7K2CwhFCQsO9GNYRgaetKzMfSiog
 kHfgQhVov/nTwoxY5dHX6ZxB0Hnbr5NLN/tM02NmBqoxUmmX/PHd4IQeoldCZptFmD0paF1kh8ze6nBr7Lk5tx/hVnhGujEKt4k=
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 06/18/19 02:16, Hans Verkuil wrote:
> Hi Keith,
>
> On 6/18/19 6:17 AM, Keith Pyle wrote:
>> We made the suggested change, compiled, installed, and rebooted. There was some progress - test 2 (turning the HD-PVR off) no longer produces a splat.  Test 1 (start capture) and test 3 (run capture
>> and trigger HD-PVR to stop streaming) both still produce a traceback (see below).  Test 3 also still results in the unkillable process.
> Try the following patch. Test 2 was caused by locking when it shouldn't, test 3 was caused by not
> locking when it should :-) and I think test 1 was caused by locking when it is not allowed.
>
> Let me know if this works!
>
> Regards,
>
> 	Hans
Good news!  With these patches, lockdep does not report any of the prior 
problems and the capture process does not deadlock for my test3.

There is one item I noted: hdpvr_read has the line

msec_to_jiffies(4000);

that doesn't really do anything.  This should be a 4 second sleep, based 
on our discussion back in 2014 
(https://www.mail-archive.com/linux-media@vger.kernel.org/msg75163.html), 
since the restart will certainly fail unless the HD-PVR is given at 
least 3 seconds to reset after the stop.

Keith
>
> Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
> ---
> diff --git a/drivers/media/usb/hdpvr/hdpvr-video.c b/drivers/media/usb/hdpvr/hdpvr-video.c
> index 3786ddcc0d18..4ba134a3bc25 100644
> --- a/drivers/media/usb/hdpvr/hdpvr-video.c
> +++ b/drivers/media/usb/hdpvr/hdpvr-video.c
> @@ -435,7 +435,7 @@ static ssize_t hdpvr_read(struct file *file, char __user *buffer, size_t count,
>   	/* wait for the first buffer */
>   	if (!(file->f_flags & O_NONBLOCK)) {
>   		if (wait_event_interruptible(dev->wait_data,
> -					     hdpvr_get_next_buffer(dev)))
> +					     !list_empty_careful(&dev->rec_buff_list)))
>   			return -ERESTARTSYS;
>   	}
>
> @@ -463,7 +463,9 @@ static ssize_t hdpvr_read(struct file *file, char __user *buffer, size_t count,
>   			if (!err) {
>   				v4l2_dbg(MSG_INFO, hdpvr_debug, &dev->v4l2_dev,
>   					"timeout: restart streaming\n");
> +				mutex_lock(&dev->io_mutex);
>   				hdpvr_stop_streaming(dev);
> +				mutex_unlock(&dev->io_mutex);
>   				msecs_to_jiffies(4000);
>   				err = hdpvr_start_streaming(dev);
>   				if (err) {
> @@ -1124,9 +1126,7 @@ static void hdpvr_device_release(struct video_device *vdev)
>   	struct hdpvr_device *dev = video_get_drvdata(vdev);
>
>   	hdpvr_delete(dev);
> -	mutex_lock(&dev->io_mutex);
>   	flush_work(&dev->worker);
> -	mutex_unlock(&dev->io_mutex);
>
>   	v4l2_device_unregister(&dev->v4l2_dev);
>   	v4l2_ctrl_handler_free(&dev->hdl);
>
>
>
>> --- test 1 trace
>>
>> [  286.987001] ------------[ cut here ]------------
>> [  286.987006] do not call blocking ops when !TASK_RUNNING; state=1 set at [<0000000007f37036>] prepare_to_wait_event+0xa7/0xe5
>> [  286.987009] WARNING: CPU: 1 PID: 2768 at __might_sleep+0x52/0x65
>> [  286.987010] Modules linked in: x86_pkg_temp_thermal hdpvr efivarfs
>> [  286.987013] CPU: 1 PID: 2768 Comm: cat_hdpvr Not tainted 5.1.10-ld+ #4
>> [  286.987014] Hardware name: MSI MS-7A72/Z270 PC MATE (MS-7A72), BIOS 1.60 07/11/2017
>> [  286.987015] RIP: 0010:__might_sleep+0x52/0x65
>> [  286.987016] Code: 80 3d e7 98 43 01 00 75 23 48 8b 90 38 21 00 00 48 c7 c7 ce 46 11 b7 c6 05 d0 98 43 01 01 48 8b 70 10 48 89 d1 e8 56 b2 fd ff <0f> 0b 44 89 e2 89 ee 48 89 df 5b 5d 41 5c e9 de fd
>> ff ff 83 fe 07
>> [  286.987017] RSP: 0018:ffffa24480677d30 EFLAGS: 00010282
>> [  286.987018] RAX: 0000000000000070 RBX: ffffffffb71164a0 RCX: 0000000000000007
>> [  286.987019] RDX: 0000000000000000 RSI: 0000000000000006 RDI: ffff9f1c5ea95610
>> [  286.987020] RBP: 000000000000038c R08: 0000000000000001 R09: 000000000000000c
>> [  286.987020] R10: ffffa24480677e18 R11: 0000012dadcb5f34 R12: 0000000000000000
>> [  286.987021] R13: 0000000000002000 R14: 0000000000000002 R15: 0000000000000000
>> [  286.987022] FS:  00007f8130e71540(0000) GS:ffff9f1c5ea80000(0000) knlGS:0000000000000000
>> [  286.987023] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
>> [  286.987024] CR2: 00007ffc0fb650a0 CR3: 000000043f3c6002 CR4: 00000000001606e0
>> [  286.987025] DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
>> [  286.987025] DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
>> [  286.987026] Call Trace:
>> [  286.987028]  __mutex_lock+0x47/0x7ac
>> [  286.987031]  ? hdpvr_get_next_buffer+0x16/0x4a [hdpvr]
>> [  286.987032]  ? find_held_lock+0x2b/0x6e
>> [  286.987033]  ? prepare_to_wait_event+0xdc/0xe5
>> [  286.987034]  ? _raw_spin_unlock_irqrestore+0x37/0x4a
>> [  286.987036]  ? hdpvr_get_next_buffer+0x16/0x4a [hdpvr]
>> [  286.987037]  hdpvr_get_next_buffer+0x16/0x4a [hdpvr]
>> [  286.987038]  hdpvr_read+0x174/0x450 [hdpvr]
>> [  286.987040]  ? _raw_spin_unlock_irq+0x24/0x35
>> [  286.987041]  ? lockdep_hardirqs_on+0x168/0x183
>> [  286.987042]  ? wait_woken+0x86/0x86
>> [  286.987044]  v4l2_read+0x38/0x7a
>> [  286.987045]  vfs_read+0xad/0x136
>> [  286.987047]  ksys_read+0x53/0x95
>> [  286.987048]  do_syscall_64+0x52/0x155
>> [  286.987050]  entry_SYSCALL_64_after_hwframe+0x49/0xbe
>> [  286.987051] RIP: 0033:0x7f8130d97005
>> [  286.987052] Code: 00 00 0f 1f 00 48 83 ec 38 64 48 8b 04 25 28 00 00 00 48 89 44 24 28 31 c0 48 8d 05 35 85 0d 00 8b 00 85 c0 75 27 31 c0 0f 05 <48> 3d 00 f0 ff ff 77 63 48 8b 4c 24 28 64 48 33 0c
>> 25 28 00 00 00
>> [  286.987052] RSP: 002b:00007ffc0fb2aea0 EFLAGS: 00000246 ORIG_RAX: 0000000000000000
>> [  286.987053] RAX: ffffffffffffffda RBX: 0000000000000003 RCX: 00007f8130d97005
>> [  286.987054] RDX: 0000000000002000 RSI: 0000555c13090080 RDI: 0000000000000003
>> [  286.987055] RBP: 00007ffc0fb2af70 R08: 0000000000000000 R09: 0000000000000000
>> [  286.987056] R10: 0000000000000000 R11: 0000000000000246 R12: 0000555c13090080
>> [  286.987056] R13: 0000000000000000 R14: 00007ffc0fb2d165 R15: 0000000000000000
>> [  286.987058] irq event stamp: 1644
>> [  286.987059] hardirqs last  enabled at (1643): [<ffffffffb614832b>] console_unlock+0x493/0x4da
>> [  286.987060] hardirqs last disabled at (1644): [<ffffffffb6001460>] trace_hardirqs_off_thunk+0x1a/0x1c
>> [  286.987062] softirqs last  enabled at (1246): [<ffffffffb6c00376>] __do_softirq+0x376/0x3b2
>> [  286.987063] softirqs last disabled at (1237): [<ffffffffb60f1ea2>] irq_exit+0x4e/0x9d
>> [  286.987064] ---[ end trace 64a925bcd732953e ]---
>>
>> --- test 3 trace
>>
>> [ 7933.630215] ------------[ cut here ]------------
>> [ 7933.630218] DEBUG_LOCKS_WARN_ON(depth <= 0)
>> [ 7933.630224] WARNING: CPU: 0 PID: 14570 at lock_release+0x147/0x230
>> [ 7933.630226] Modules linked in: x86_pkg_temp_thermal hdpvr efivarfs
>> [ 7933.630229] CPU: 0 PID: 14570 Comm: cat_hdpvr Tainted: G W         5.1.10-ld+ #4
>> [ 7933.630230] Hardware name: MSI MS-7A72/Z270 PC MATE (MS-7A72), BIOS 1.60 07/11/2017
>> [ 7933.630232] RIP: 0010:lock_release+0x147/0x230
>> [ 7933.630233] Code: 01 5f 04 75 29 e8 35 e7 25 00 85 c0 74 3b 83 3d 18 1a 42 01 00 75 32 48 c7 c6 a3 78 11 b7 48 c7 c7 2f 44 10 b7 e8 a9 10 fb ff <0f> 0b eb 1b 48 8d 4c 24 04 44 89 fa 48 89 ee 48 89
>> df e8 87 c4 ff
>> [ 7933.630234] RSP: 0018:ffffa24481c6fd88 EFLAGS: 00010082
>> [ 7933.630236] RAX: 000000000000001f RBX: ffff9f1c28ea8000 RCX: 0000000000000000
>> [ 7933.630237] RDX: ffffffffb6149356 RSI: 0000000000000001 RDI: ffffffffb6149368
>> [ 7933.630238] RBP: ffff9f1c2c838820 R08: ffffffffba72cee0 R09: 000000000000001f
>> [ 7933.630239] R10: 0000000000000001 R11: 00001e633eb23eea R12: ffffffffc0366de1
>> [ 7933.630240] R13: 0000000000000246 R14: ffff9f1c28500700 R15: 0000000000000000
>> [ 7933.630241] FS:  00007fd61de88540(0000) GS:ffff9f1c5ea00000(0000) knlGS:0000000000000000
>> [ 7933.630242] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
>> [ 7933.630243] CR2: 0000000007af0000 CR3: 0000000428622002 CR4: 00000000001606f0
>> [ 7933.630244] DR0: 0000000037e28bcc DR1: 0000000000000000 DR2: 0000000000000000
>> [ 7933.630245] DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000600
>> [ 7933.630245] Call Trace:
>> [ 7933.630249]  __mutex_unlock_slowpath+0x34/0x1e9
>> [ 7933.630252]  hdpvr_stop_streaming+0x78/0x169 [hdpvr]
>> [ 7933.630254]  hdpvr_read+0x33c/0x450 [hdpvr]
>> [ 7933.630256]  ? lockdep_hardirqs_on+0x168/0x183
>> [ 7933.630258]  ? wait_woken+0x86/0x86
>> [ 7933.630260]  v4l2_read+0x38/0x7a
>> [ 7933.630262]  vfs_read+0xad/0x136
>> [ 7933.630264]  ksys_read+0x53/0x95
>> [ 7933.630266]  do_syscall_64+0x52/0x155
>> [ 7933.630268]  entry_SYSCALL_64_after_hwframe+0x49/0xbe
>> [ 7933.630270] RIP: 0033:0x7fd61ddae005
>> [ 7933.630271] Code: 00 00 0f 1f 00 48 83 ec 38 64 48 8b 04 25 28 00 00 00 48 89 44 24 28 31 c0 48 8d 05 35 85 0d 00 8b 00 85 c0 75 27 31 c0 0f 05 <48> 3d 00 f0 ff ff 77 63 48 8b 4c 24 28 64 48 33 0c
>> 25 28 00 00 00
>> [ 7933.630272] RSP: 002b:00007fffdb949a60 EFLAGS: 00000246 ORIG_RAX: 0000000000000000
>> [ 7933.630274] RAX: ffffffffffffffda RBX: 0000000000000003 RCX: 00007fd61ddae005
>> [ 7933.630275] RDX: 0000000000002000 RSI: 000055caa2856080 RDI: 0000000000000003
>> [ 7933.630275] RBP: 00007fffdb949b30 R08: 0000000000000000 R09: 0000000000000000
>> [ 7933.630276] R10: 0000000000000000 R11: 0000000000000246 R12: 000055caa2856080
>> [ 7933.630277] R13: 0000000000000000 R14: 00007fffdb94a156 R15: 0000000000002000
>> [ 7933.630279] irq event stamp: 30970489
>> [ 7933.630281] hardirqs last  enabled at (30970489): [<ffffffffb620e6eb>] kfree+0x196/0x217
>> [ 7933.630283] hardirqs last disabled at (30970488): [<ffffffffb620e6c8>] kfree+0x173/0x217
>> [ 7933.630284] softirqs last  enabled at (30970034): [<ffffffffb6c00376>] __do_softirq+0x376/0x3b2
>> [ 7933.630286] softirqs last disabled at (30970027): [<ffffffffb60f1ea2>] irq_exit+0x4e/0x9d
>> [ 7933.630287] ---[ end trace 64a925bcd732953f ]---
>>
>

