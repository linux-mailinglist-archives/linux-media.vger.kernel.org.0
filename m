Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 091B547201
	for <lists+linux-media@lfdr.de>; Sat, 15 Jun 2019 22:15:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726566AbfFOUPS (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 15 Jun 2019 16:15:18 -0400
Received: from cdptpa-outbound-snat.email.rr.com ([107.14.166.226]:36430 "EHLO
        cdptpa-cmomta03.email.rr.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1725944AbfFOUPS (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 15 Jun 2019 16:15:18 -0400
X-Greylist: delayed 487 seconds by postgrey-1.27 at vger.kernel.org; Sat, 15 Jun 2019 16:14:57 EDT
Received: from [192.168.2.97] ([72.182.16.184])
        by cmsmtp with ESMTP
        id cEwph73LaXGq6cEwrhCXzR; Sat, 15 Jun 2019 20:06:49 +0000
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
From:   Keith Pyle <kpyle@austin.rr.com>
Subject: hdpvr mutex deadlock on kernel 5.1.x
Message-ID: <14d31c83-f48f-319d-6b3a-0753ea9d2c02@austin.rr.com>
Date:   Sat, 15 Jun 2019 15:06:46 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-CMAE-Envelope: MS4wfIys4Js5r4/Z7lB0/eCX/9qWAYgQg7nja4mWJWz6QCcWf+wCpCHRg5QeUTN3lrK4qQqbxJOF958EzkOSWDaHLRQXqfROzIWrX+dnYocHLwqAHfzkHzR6
 j4+buSIVU59FSru7sYOSCLgfrYCG+Cynk2WQ2SCjiGSv+qhrwH4wd1mvoP5910Ir/cX8+TePcCJd0Q==
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

We have observed a hard mutex deadlock in the hdpvr driver on both 5.1.8
and 5.1.10.  The problem occurs while reading from the HD-PVR device
and results in an unkillable user process.  It is readily reproducible.

The problem has been reproduced on two different systems and with two
different HD-PVR devices using the 0x1e firmware.

We're not particularly familiar with the hdpvr code and could use
advice/assistance on this problem.  We're certainly willing to test patches.

As of this writing, origin/master is
0011572c883082a95e02d47f45fc4a42dc0e8634 (a commit in Linus' tree).

`git log v5.1.10..origin/master --grep=hdpvr --` returns no output, so
there appear to be no post-5.1 commits mentioning the hdpvr directly.

`git log v5.1.10..origin/master -- drivers/media/usb/hdpvr/` shows
only some comment updates and a strncpy change.  There's nothing that
appears locking related.

-----

Steps taken to characterize and demonstrate the problem:

We enabled kernel lock debugging using these options:

CONFIG_LOCK_DEBUGGING_SUPPORT=y
CONFIG_LOCKDEP_SUPPORT=y
CONFIG_LOCKDEP=y
CONFIG_DEBUG_RT_MUTEXES=y
CONFIG_DEBUG_SPINLOCK=y
CONFIG_DEBUG_MUTEXES=y
CONFIG_DEBUG_WW_MUTEX_SLOWPATH=y
CONFIG_DEBUG_RWSEMS=y
CONFIG_DEBUG_LOCK_ALLOC=y
CONFIG_DEBUG_ATOMIC_SLEEP=y

The kernel was built with:

gcc version 7.4.0 (Gentoo Hardened 7.4.0-r1 p1.2)
GNU ld (Gentoo 2.31.1 p5) 2.31.1

Three snippets of lockdep output are included below.

1. On opening the device, lockdep reported the following:

[  113.195852] ------------[ cut here ]------------
[  113.195869] do not call blocking ops when !TASK_RUNNING; state=1 set 
at [<00000000e54b9652>] prepare_to_wait_event+0xa7/0xe5
[  113.195885] WARNING: CPU: 2 PID: 2616 at __might_sleep+0x52/0x65
[  113.195889] Modules linked in: hdpvr x86_pkg_temp_thermal efivarfs
[  113.195902] CPU: 2 PID: 2616 Comm: cat Not tainted 5.1.10-ld+ #4
[  113.195906] Hardware name: MSI MS-7A72/Z270 PC MATE (MS-7A72), BIOS 
1.60 07/11/2017
[  113.195914] RIP: 0010:__might_sleep+0x52/0x65
[  113.195920] Code: 80 3d e7 98 43 01 00 75 23 48 8b 90 38 21 00 00 48 
c7 c7 ce 46 11 b8 c6 05 d0 98 43 01 01 48 8b 70 10 48 89 d1 e8 56 b2 fd 
ff <0f> 0b 44 89 e2 89 ee 48 89 df 5b 5d 41 5c e9 de fd ff ff 83 fe 07
[  113.195925] RSP: 0018:ffffb73b0057fd30 EFLAGS: 00010282
[  113.195930] RAX: 0000000000000070 RBX: ffffffffb81164a0 RCX: 
0000000000000007
[  113.195935] RDX: 0000000000000000 RSI: 0000000000000006 RDI: 
ffff9ed35eb15610
[  113.195939] RBP: 000000000000038c R08: 0000000000000001 R09: 
000000000000000c
[  113.195943] R10: ffffb73b0057fe18 R11: 0000008391c86b93 R12: 
0000000000000000
[  113.195947] R13: 0000000000020000 R14: 0000000000000002 R15: 
0000000000000000
[  113.195953] FS:  00007fa6eee2c580(0000) GS:ffff9ed35eb00000(0000) 
knlGS:0000000000000000
[  113.195958] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[  113.195963] CR2: 000056533197de84 CR3: 00000004425de002 CR4: 
00000000001606e0
[  113.195967] DR0: 0000000000000000 DR1: 0000000000000000 DR2: 
0000000000000000
[  113.195972] DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 
0000000000000400
[  113.195975] Call Trace:
[  113.195985]  __mutex_lock+0x47/0x7ac
[  113.195997]  ? hdpvr_get_next_buffer+0x16/0x4a [hdpvr]
[  113.196005]  ? _raw_spin_unlock_irqrestore+0x39/0x4a
[  113.196013]  ? hdpvr_get_next_buffer+0x16/0x4a [hdpvr]
[  113.196020]  hdpvr_get_next_buffer+0x16/0x4a [hdpvr]
[  113.196029]  hdpvr_read+0x174/0x450 [hdpvr]
[  113.196037]  ? wait_woken+0x86/0x86
[  113.196044]  v4l2_read+0x38/0x7a
[  113.196052]  vfs_read+0xad/0x136
[  113.196059]  ksys_read+0x53/0x95
[  113.196066]  do_syscall_64+0x52/0x155
[  113.196074]  entry_SYSCALL_64_after_hwframe+0x49/0xbe
[  113.196079] RIP: 0033:0x7fa6eed52005
[  113.196085] Code: 00 00 0f 1f 00 48 83 ec 38 64 48 8b 04 25 28 00 00 
00 48 89 44 24 28 31 c0 48 8d 05 35 85 0d 00 8b 00 85 c0 75 27 31 c0 0f 
05 <48> 3d 00 f0 ff ff 77 63 48 8b 4c 24 28 64 48 33 0c 25 28 00 00 00
[  113.196089] RSP: 002b:00007fffd97d5630 EFLAGS: 00000246 ORIG_RAX: 
0000000000000000
[  113.196096] RAX: ffffffffffffffda RBX: 0000000000020000 RCX: 
00007fa6eed52005
[  113.196100] RDX: 0000000000020000 RSI: 00007fa6eee31000 RDI: 
0000000000000003
[  113.196104] RBP: 0000000000020000 R08: 00000000ffffffff R09: 
0000000000000000
[  113.196109] R10: 0000000000000022 R11: 0000000000000246 R12: 
00007fa6eee31000
[  113.196113] R13: 0000000000000003 R14: 0000000000020000 R15: 
0000000000000000
[  113.196119] irq event stamp: 1514
[  113.196128] hardirqs last  enabled at (1513): [<ffffffffb714832b>] 
console_unlock+0x493/0x4da
[  113.196134] hardirqs last disabled at (1514): [<ffffffffb7001460>] 
trace_hardirqs_off_thunk+0x1a/0x1c
[  113.196140] softirqs last  enabled at (1500): [<ffffffffb7c00376>] 
__do_softirq+0x376/0x3b2
[  113.196148] softirqs last disabled at (1491): [<ffffffffb70f1ea2>] 
irq_exit+0x4e/0x9d
[  113.196152] ---[ end trace 0881f93401450644 ]---

2. A short capture from the device proceeded successfully and lockdep
reported the following on turning the device off:

[  227.915296] usb 1-10: USB disconnect, device number 9
[  227.917973] hdpvr 1-10:1.0: device video0 disconnected

[  228.024287] ======================================================
[  228.024291] WARNING: possible circular locking dependency detected
[  228.024296] 5.1.10-ld+ #4 Tainted: G        W
[  228.024300] ------------------------------------------------------
[  228.024304] kworker/3:1/41 is trying to acquire lock:
[  228.024308] 000000002a90d673 ((work_completion)(&dev->worker)){+.+.}, 
at: __flush_work+0x3d/0x245
[  228.024322]
                but task is already holding lock:
[  228.024326] 000000009cff49c4 (&dev->io_mutex){+.+.}, at: 
hdpvr_device_release+0x22/0x89 [hdpvr]
[  228.024337]
                which lock already depends on the new lock.

[  228.024341]
                the existing dependency chain (in reverse order) is:
[  228.024344]
                -> #1 (&dev->io_mutex){+.+.}:
[  228.024354]        __mutex_lock+0x81/0x7ac
[  228.024360]        hdpvr_transmit_buffers+0x3c/0x26c [hdpvr]
[  228.024366]        process_one_work+0x2b9/0x4db
[  228.024372]        worker_thread+0x1d1/0x2a5
[  228.024377]        kthread+0x11c/0x124
[  228.024383]        ret_from_fork+0x3a/0x50
[  228.024386]
                -> #0 ((work_completion)(&dev->worker)){+.+.}:
[  228.024395]        lock_acquire+0x14f/0x17a
[  228.024400]        __flush_work+0x60/0x245
[  228.024406]        hdpvr_device_release+0x2e/0x89 [hdpvr]
[  228.024413]        v4l2_device_release+0xaa/0xc0
[  228.024420]        device_release+0x52/0x7a
[  228.024427]        kobject_put+0x78/0x8f
[  228.024433]        hdpvr_disconnect+0xd1/0xdd [hdpvr]
[  228.024441]        usb_unbind_interface+0x8a/0x1c5
[  228.024447]        device_release_driver_internal+0xe7/0x198
[  228.024452]        bus_remove_device+0xf8/0x10d
[  228.024459]        device_del+0x19e/0x2c4
[  228.024465]        usb_disable_device+0x7b/0x18d
[  228.024470]        usb_disconnect+0x90/0x190
[  228.024475]        hub_event+0x6c4/0xfc4
[  228.024481]        process_one_work+0x2b9/0x4db
[  228.024487]        worker_thread+0x1d1/0x2a5
[  228.024491]        kthread+0x11c/0x124
[  228.024497]        ret_from_fork+0x3a/0x50
[  228.024500]
                other info that might help us debug this:

[  228.024503]  Possible unsafe locking scenario:

[  228.024506]        CPU0                    CPU1
[  228.024509]        ----                    ----
[  228.024512]   lock(&dev->io_mutex);
[  228.024516] lock((work_completion)(&dev->worker));
[  228.024520] lock(&dev->io_mutex);
[  228.024524]   lock((work_completion)(&dev->worker));
[  228.024528]
                 *** DEADLOCK ***

[  228.024532] 6 locks held by kworker/3:1/41:
[  228.024535]  #0: 00000000d157af1b ((wq_completion)usb_hub_wq){+.+.}, 
at: process_one_work+0x187/0x4db
[  228.024545]  #1: 000000009ea387d9 
((work_completion)(&hub->events)){+.+.}, at: process_one_work+0x187/0x4db
[  228.024553]  #2: 00000000cf24eaef (&dev->mutex){....}, at: 
hub_event+0x5b/0xfc4
[  228.024561]  #3: 0000000096a7bf78 (&dev->mutex){....}, at: 
usb_disconnect+0x55/0x190
[  228.024568]  #4: 00000000681cf121 (&dev->mutex){....}, at: 
device_release_driver_internal+0x15/0x198
[  228.024576]  #5: 000000009cff49c4 (&dev->io_mutex){+.+.}, at: 
hdpvr_device_release+0x22/0x89 [hdpvr]
[  228.024585]
                stack backtrace:
[  228.024592] CPU: 3 PID: 41 Comm: kworker/3:1 Tainted: G W         
5.1.10-ld+ #4
[  228.024595] Hardware name: MSI MS-7A72/Z270 PC MATE (MS-7A72), BIOS 
1.60 07/11/2017
[  228.024602] Workqueue: usb_hub_wq hub_event
[  228.024606] Call Trace:
[  228.024614]  dump_stack+0x67/0x8e
[  228.024622]  print_circular_bug.isra.21+0x265/0x272
[  228.024629]  check_prev_add.constprop.29+0x479/0xa1c
[  228.024636]  ? add_lock_to_list.isra.13+0x28/0xc1
[  228.024642]  ? __lock_acquire+0xe83/0xf65
[  228.024647]  ? alloc_lock_chain+0x11/0x34
[  228.024652]  __lock_acquire+0xe83/0xf65
[  228.024658]  lock_acquire+0x14f/0x17a
[  228.024664]  ? __flush_work+0x3d/0x245
[  228.024670]  __flush_work+0x60/0x245
[  228.024675]  ? __flush_work+0x3d/0x245
[  228.024682]  ? hdpvr_device_release+0x22/0x89 [hdpvr]
[  228.024690]  ? kfree+0x196/0x217
[  228.024696]  ? hdpvr_free_queue+0x68/0x73 [hdpvr]
[  228.024703]  hdpvr_device_release+0x2e/0x89 [hdpvr]
[  228.024708]  v4l2_device_release+0xaa/0xc0
[  228.024716]  device_release+0x52/0x7a
[  228.024723]  kobject_put+0x78/0x8f
[  228.024729]  hdpvr_disconnect+0xd1/0xdd [hdpvr]
[  228.024738]  usb_unbind_interface+0x8a/0x1c5
[  228.024745]  device_release_driver_internal+0xe7/0x198
[  228.024750]  bus_remove_device+0xf8/0x10d
[  228.024758]  device_del+0x19e/0x2c4
[  228.024764]  ? usb_remove_ep_devs+0x16/0x21
[  228.024771]  usb_disable_device+0x7b/0x18d
[  228.024777]  usb_disconnect+0x90/0x190
[  228.024783]  hub_event+0x6c4/0xfc4
[  228.024790]  ? process_one_work+0x187/0x4db
[  228.024796]  process_one_work+0x2b9/0x4db
[  228.024803]  ? worker_thread+0x22d/0x2a5
[  228.024809]  worker_thread+0x1d1/0x2a5
[  228.024815]  ? rescuer_thread+0x278/0x278
[  228.024820]  kthread+0x11c/0x124
[  228.024824]  ? kthread_park+0x71/0x71
[  228.024831]  ret_from_fork+0x3a/0x50

3. A longer capture test was then run.  After ~20 minutes, the reading 
process
deadlocked and lockdep reported the following.  A reboot was required.

[ 3196.020009] INFO: task kworker/2:4:412 blocked for more than 122 seconds.
[ 3196.020020]       Tainted: G        W         5.1.10-ld+ #4
[ 3196.020025] "echo 0 > /proc/sys/kernel/hung_task_timeout_secs" 
disables this message.
[ 3196.020032] kworker/2:4     D    0   412      2 0x80000000
[ 3196.020049] Workqueue: events hdpvr_transmit_buffers [hdpvr]
[ 3196.020055] Call Trace:
[ 3196.020069]  ? __schedule+0x8f8/0x959
[ 3196.020077]  ? __mutex_lock+0x2f7/0x7ac
[ 3196.020084]  schedule+0x69/0x81
[ 3196.020092]  schedule_preempt_disabled+0xc/0x14
[ 3196.020099]  __mutex_lock+0x4d0/0x7ac
[ 3196.020107]  ? __switch_to_asm+0x31/0x60
[ 3196.020115]  ? __switch_to_asm+0x25/0x60
[ 3196.020123]  ? hdpvr_transmit_buffers+0x3c/0x26c [hdpvr]
[ 3196.020131]  ? __switch_to_asm+0x25/0x60
[ 3196.020138]  ? __switch_to_asm+0x25/0x60
[ 3196.020146]  ? hdpvr_transmit_buffers+0x3c/0x26c [hdpvr]
[ 3196.020154]  hdpvr_transmit_buffers+0x3c/0x26c [hdpvr]
[ 3196.020164]  ? process_one_work+0x187/0x4db
[ 3196.020172]  process_one_work+0x2b9/0x4db
[ 3196.020181]  ? worker_thread+0x22d/0x2a5
[ 3196.020188]  worker_thread+0x1d1/0x2a5
[ 3196.020196]  ? rescuer_thread+0x278/0x278
[ 3196.020202]  kthread+0x11c/0x124
[ 3196.020209]  ? kthread_park+0x71/0x71
[ 3196.020217]  ret_from_fork+0x3a/0x50
[ 3196.020250] INFO: task cat_hdpvr:3736 blocked for more than 122 seconds.
[ 3196.020256]       Tainted: G        W         5.1.10-ld+ #4
[ 3196.020261] "echo 0 > /proc/sys/kernel/hung_task_timeout_secs" 
disables this message.
[ 3196.020266] cat_hdpvr       D    0  3736   3735 0x80000002
[ 3196.020273] Call Trace:
[ 3196.020281]  ? __schedule+0x8f8/0x959
[ 3196.020287]  ? __mutex_lock+0x2f7/0x7ac
[ 3196.020294]  schedule+0x69/0x81
[ 3196.020301]  schedule_preempt_disabled+0xc/0x14
[ 3196.020307]  __mutex_lock+0x4d0/0x7ac
[ 3196.020316]  ? hdpvr_release+0x24/0x5b [hdpvr]
[ 3196.020327]  ? kmem_cache_free+0x13a/0x20c
[ 3196.020334]  ? hdpvr_release+0x24/0x5b [hdpvr]
[ 3196.020341]  hdpvr_release+0x24/0x5b [hdpvr]
[ 3196.020350]  v4l2_release+0x83/0xbe
[ 3196.020360]  __fput+0xfa/0x19b
[ 3196.020369]  task_work_run+0x7a/0x9c
[ 3196.020377]  do_exit+0x4f3/0xa41
[ 3196.020385]  do_group_exit+0xad/0xad
[ 3196.020393]  __x64_sys_exit_group+0xf/0xf
[ 3196.020400]  do_syscall_64+0x52/0x155
[ 3196.020409]  entry_SYSCALL_64_after_hwframe+0x49/0xbe
[ 3196.020416] RIP: 0033:0x7f41505bdcd6
[ 3196.020427] Code: Bad RIP value.
[ 3196.020433] RSP: 002b:00007ffe864cdad8 EFLAGS: 00000246 ORIG_RAX: 
00000000000000e7
[ 3196.020442] RAX: ffffffffffffffda RBX: 00007f41506b25c0 RCX: 
00007f41505bdcd6
[ 3196.020447] RDX: 0000000000000000 RSI: 000000000000003c RDI: 
0000000000000000
[ 3196.020453] RBP: 0000000000000000 R08: 00000000000000e7 R09: 
ffffffffffffff80
[ 3196.020458] R10: 0000000000000002 R11: 0000000000000246 R12: 
00007f41506b25c0
[ 3196.020463] R13: 0000000000000001 R14: 00007f41506bb268 R15: 
0000000000000000
[ 3196.020495] INFO: lockdep is turned off.

