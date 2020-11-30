Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5A1102C843C
	for <lists+linux-media@lfdr.de>; Mon, 30 Nov 2020 13:43:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725895AbgK3MnK (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 30 Nov 2020 07:43:10 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59024 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725870AbgK3MnJ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 30 Nov 2020 07:43:09 -0500
Received: from mail-oi1-x242.google.com (mail-oi1-x242.google.com [IPv6:2607:f8b0:4864:20::242])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9EA04C0613D2
        for <linux-media@vger.kernel.org>; Mon, 30 Nov 2020 04:42:29 -0800 (PST)
Received: by mail-oi1-x242.google.com with SMTP id k26so14001878oiw.0
        for <linux-media@vger.kernel.org>; Mon, 30 Nov 2020 04:42:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to;
        bh=dYcvtGoTgbwH0NA+dXkODhHCBZwAwMlIFX2cNpct9GE=;
        b=VPibJ8Op3WDeK0aY1Ml80RM/wl2r1FX7cQqTFTz6dOKLAEra90Aaug/fmfjvmHu/mo
         Ej0t0nUzv42ImCXu0v+03NOQs3XQ8M/LA9kts1Lj5farVIQBmjtwuCTDf2PhR+lVthem
         Y75LigFADZuCyqql5tamWpeFGXrygsjCV8A7hryKXj/vfcb0bcx9Jtl8M9SXqJwZaUSK
         nL1PijmbIsbSxsHx4KkkefxVqH+DN62UjbaRyCT4EgB72ufevfp0qxkBGwlNH4ZskfEi
         a/3BTVhiO6/2PMDJYCrzqWZaOtwFe4ipI9tOh7xR3AXYF03zrI8z2jCJAo0rp0nBKyrx
         z2VA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=dYcvtGoTgbwH0NA+dXkODhHCBZwAwMlIFX2cNpct9GE=;
        b=Yezx0SDPBsOKYgbkNP0huJFBBVaaHZ/+h8JjWruyXQuIInwOZQfBV0ZkcMZjP/Dgf9
         9xXhcUKkM0Q//ulxrRQoVqjvCWZYbRKXq5SX6ebKj30o7mOqU7q5UTEFlugaE3u1H4iI
         Fd+1mjVJzNrcjbfXK2c/wRpw6VoC9xRZd5eTeXqGQkupBkNwij8p4o/D+kO3qOVHjcda
         P2zUT7SebGKtmtdxlcj6u4aV0PuYVgSkjtCNuRkSM9f/K/rsbBx/cb9GU9uiSrrPrgPx
         Uiak/xuxi8oj4oEZbtWF5mHlze2+sZXZCqFNT0KBLzq4kXTbUO8IOnrm3CcG2Fc0lXpT
         rc1A==
X-Gm-Message-State: AOAM532lD0XRV7ULZ3aCuAwyJ/lUp/dVpe2uE7kTKzGG82ixJ0VlFyiF
        F/wnNf4ikBziSfboizGcHUH+s1jGh0E9hJw1YWrkZM49gCGg/Q==
X-Google-Smtp-Source: ABdhPJzVGkVgrq4dywDxGhdeTUGRvi8SHoRBv/bYktBpF80OCfEpYQVNhH0dV3XXSXfjgDoeNeuvZtbt7Hmh4GBcR0k=
X-Received: by 2002:aca:3ed5:: with SMTP id l204mr12732843oia.149.1606740148848;
 Mon, 30 Nov 2020 04:42:28 -0800 (PST)
MIME-Version: 1.0
From:   John Boero <boeroboy@gmail.com>
Date:   Mon, 30 Nov 2020 12:42:15 +0000
Message-ID: <CAO5W59geLtP7kHJkW=ELusAcd9==cEqhsuzznUkfradTkxz+vQ@mail.gmail.com>
Subject: [RFC PATCH] media:uvc usbcore segfault on device disconnect
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi my name is John Boero
I've been trying to patch a crash in usbcore triggered by uvc.
https://bugs.launchpad.net/ubuntu/+source/linux/+bug/1827452

This bug is common among IoT and low power envs or can be reproduced
with a thin USB extension cable.  I've determined the exact cause via
testing and tracing random crashes of the entire usbcore subsystem:

1. uvc_video_start_transfer on a perfectly healthy idle webcam.
2. Initialization of the device increases power requirements.
3. UVC continues to uvc_v42l_open.
4. Device with insufficient power intermittently disconnects itself
via interrupt.
5. uvc_parse_standard_control uses dev with NULL interfaces.
6. usb_ifnum_to_if dereferences NULL.

In my mind this was an issue with usbcore/usb.c so I submitted the following
patch which was denied on the grounds that this should be fixed in uvc.  I've
experimented with synchronization and msleep(5) during start_transfer which
can often catch a disconnected device before continuing but locks would
probably be better.  Sample patch and trace are below.
Can someone please suggest a fix strategy for this?

Thank you!
John

Denied usbcore/usb.c patch:
From 73019d79fe4fd8b2c945005f8a067f528d8056fd Mon Sep 17 00:00:00 200
1
From: jboero <boeroboy@gmail.com>
Date: Sun, 22 Nov 2020 19:30:41 +0000
Subject: [PATCH] USBCore NULL interface deref fix

---
drivers/usb/core/usb.c | 2 +-
1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/core/usb.c b/drivers/usb/core/usb.c
index bafc113f2b3e..da46c84c87ce 100644
--- a/drivers/usb/core/usb.c
+++ b/drivers/usb/core/usb.c
@@ -278,7 +278,7 @@ struct usb_interface *usb_ifnum_to_if(const struc
t usb_device *dev,
       if (!config)
               return NULL;
       for (i = 0; i < config->desc.bNumInterfaces; i++)
-               if (config->interface[i]->altsetting[0]
+               if (config->interface[i] && config->interface[i]->alt
setting[0]
                               .desc.bInterfaceNumber == ifnum)
                       return config->interface[i];

--
2.26.2


The below sample UVC trace of repeated open/close of webcam with usb.c patch
preserves functionality enough to show uvc struggling after a failure.  WARNING
inserted in usb_disconnect shows it being called from interrupts even
though the
comment header on hub.c:usb_disconnect says:
* This call is synchronous, and may not be used in an interrupt context.

[  113.720982] uvcvideo: Suspending interface 1
[  113.720989] uvcvideo: Suspending interface 0
[  115.130995] uvcvideo: uvc_v4l2_open
[  115.227047] uvcvideo: Resuming interface 0
[  115.227054] uvcvideo: Resuming interface 1
[  115.228431] uvcvideo: uvc_v4l2_release
[  115.288391] uvcvideo: uvc_v4l2_open
[  115.318154] uvcvideo: Trying format 0x56595559 (YUYV): 1280x720.
[  115.318159] uvcvideo: Using default frame interval 100000.0 us (10.0 fps).
[  115.344819] uvcvideo: Trying format 0x56595559 (YUYV): 1280x720.
[  115.344824] uvcvideo: Using default frame interval 100000.0 us (10.0 fps).
[  115.345174] uvcvideo: Setting frame interval to 1/10 (1000000).
[  115.345477] uvcvideo: Control 0x00980927 not found.
[  115.345692] uvcvideo: Control 0x00980927 not found.
[  115.348286] uvcvideo: Device requested 2688 B/frame bandwidth.
[  115.348290] uvcvideo: Selecting alternate setting 10 (2688 B/frame
bandwidth).
[  115.348291] uvcvideo: jboero sleeping 5ms for race condition.
[  115.526971] uvcvideo: Allocated 5 URB buffers of 32x2688 bytes each.
[  115.800585] uvcvideo: uvc_v4l2_release
[  115.802168] uvcvideo: uvc_v4l2_open
[  115.822412] uvcvideo: Trying format 0x56595559 (YUYV): 1280x720.
[  115.822417] uvcvideo: Using default frame interval 100000.0 us (10.0 fps).
[  115.869417] uvcvideo: Trying format 0x56595559 (YUYV): 1280x720.
[  115.869420] uvcvideo: Using default frame interval 100000.0 us (10.0 fps).
[  115.869763] uvcvideo: Setting frame interval to 1/10 (1000000).
[  115.870123] uvcvideo: Control 0x00980927 not found.
[  115.870244] uvcvideo: Control 0x00980927 not found.
[  115.872606] uvcvideo: Device requested 2688 B/frame bandwidth.
[  115.872610] uvcvideo: Selecting alternate setting 10 (2688 B/frame
bandwidth).
[  115.872611] uvcvideo: jboero sleeping 5ms for race condition.
[  115.886305] ------------[ cut here ]------------
[  115.886310] jboero dev disconnecting - 200ms sleep!
[  115.886354] WARNING: CPU: 18 PID: 321 at
drivers/usb/core/hub.c:2194 usb_disconnect+0x25/0xb0
[  115.886359] Modules linked in: snd_seq_dummy snd_hrtimer rfcomm
rc_cec nouveau vboxnetadp(OE) vboxnetflt(OE) mxm_wmi video vboxdrv(OE)
xt_CHECKSUM xt_MASQUERADE xt_conntrack ipt_REJECT nf_nat_tftp
nft_objref nf_conntrack_tftp tun bridge stp llc rpcsec_gss_krb5
auth_rpcgss nfsv4 dns_resolver nfs lockd grace fscache nft_fib_inet
nft_fib_ipv4 nft_fib_ipv6 nft_fib nft_reject_inet nf_reject_ipv4
nf_reject_ipv6 nft_reject nft_ct nft_chain_nat ip6table_nat
ip6table_mangle ip6table_raw ip6table_security iptable_nat nf_nat
nf_conntrack nf_defrag_ipv6 nf_defrag_ipv4 iptable_mangle iptable_raw
iptable_security ip_set nf_tables nfnetlink ip6table_filter ip6_tables
iptable_filter overlay cmac bnep lm75 sunrpc vfat fat squashfs loop
intel_rapl_msr intel_rapl_common btusb btrtl snd_hda_codec_realtek
sb_edac btbcm btintel x86_pkg_temp_thermal snd_hda_codec_generic
snd_hda_codec_hdmi ledtrig_audio uvcvideo intel_powerclamp ucsi_ccg
videobuf2_vmalloc snd_hda_intel coretemp dm_cache_smq videobuf2_memops
[  115.886422]  bluetooth typec_ucsi snd_intel_dspcfg videobuf2_v4l2
kvm_intel iTCO_wdt intel_pmc_bxt typec iTCO_vendor_support
snd_usb_audio videobuf2_common snd_hda_codec dm_cache ecdh_generic ecc
pktcdvd kvm dm_persistent_data snd_usbmidi_lib videodev snd_hda_core
dm_bio_prison snd_hwdep snd_rawmidi snd_seq mc joydev irqbypass
snd_seq_device ocrdma rapl intel_cstate ib_uverbs snd_pcm hp_wmi
sparse_keymap intel_uncore pcspkr rfkill wmi_bmof ib_core snd_timer
snd i2c_i801 i2c_smbus lpc_ich soundcore i2c_nvidia_gpu tpm_infineon
binfmt_misc ip_tables amdgpu iommu_v2 gpu_sched crct10dif_pclmul
crc32_pclmul i2c_algo_bit crc32c_intel ttm drm_kms_helper cec
ghash_clmulni_intel serio_raw nvme drm e1000e be2net nvme_core wmi nbd
fuse
[  115.886482] CPU: 18 PID: 321 Comm: kworker/18:1 Tainted: G        W
 OE     5.8.18-200.jboero.fc32.x86_64 #1
[  115.886485] Hardware name: Hewlett-Packard HP Z640
Workstation/212A, BIOS M60 v02.54 06/12/2020
[  115.886492] Workqueue: usb_hub_wq hub_event
[  115.886498] RIP: 0010:usb_disconnect+0x25/0xb0
[  115.886503] Code: 00 00 0f 1f 00 0f 1f 44 00 00 41 57 41 56 41 55
41 54 55 53 48 89 fb 48 83 ec 20 4c 8b 27 48 c7 c7 a0 29 68 98 e8 9f
86 78 ff <0f> 0b bf c8 00 00 00 e8 8f d7 83 ff 48 c7 c7 c0 b7 ea 98 e8
53 c5
[  115.886507] RSP: 0018:ffffb96645bffd28 EFLAGS: 00010292
[  115.886512] RAX: 0000000000000027 RBX: ffff92eab42e9000 RCX: 0000000000000000
[  115.886515] RDX: ffff92eab4d38000 RSI: ffffffff9716eac5 RDI: 0000000000000246
[  115.886519] RBP: 0000000000000100 R08: 0000001afb5cc4e1 R09: 0000000000000027
[  115.886522] R10: 0000000000000000 R11: 0000000000000000 R12: ffff92eab0793000
[  115.886526] R13: 000000000000000e R14: ffff92eab42eab70 R15: 000000000000000e
[  115.886530] FS:  0000000000000000(0000) GS:ffff92eacd200000(0000)
knlGS:0000000000000000
[  115.886534] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[  115.886537] CR2: 00007f11514b2f40 CR3: 0000001fb95a0004 CR4: 00000000001606e0
[  115.886541] Call Trace:
[  115.886554]  ? __mutex_unlock_slowpath+0x35/0x270
[  115.886562]  hub_event+0xc0e/0x1890
[  115.886582]  process_one_work+0x25d/0x570
[  115.886592]  worker_thread+0x55/0x3c0
[  115.886598]  ? process_one_work+0x570/0x570
[  115.886605]  kthread+0x13a/0x150
[  115.886611]  ? kthread_create_worker_on_cpu+0x40/0x40
[  115.886621]  ret_from_fork+0x22/0x30
[  115.886638] irq event stamp: 11070
[  115.886646] hardirqs last  enabled at (11069): [<ffffffff97cc66a4>]
_raw_spin_unlock_irq+0x24/0x40
[  115.886651] hardirqs last disabled at (11070): [<ffffffff97cbf702>]
__schedule+0xd2/0xa40
[  115.886656] softirqs last  enabled at (6882): [<ffffffff9800033d>]
__do_softirq+0x33d/0x44c
[  115.886661] softirqs last disabled at (6871): [<ffffffff97e010d2>]
asm_call_irq_on_stack+0x12/0x20
[  115.886664] ---[ end trace d02727115f119a2f ]---
[  116.094920] usb 3-14: USB disconnect, device number 7
[  120.933639] uvcvideo: uvc_v4l2_release
[  121.133946] usb 3-14: new high-speed USB device number 10 using xhci_hcd
[  123.489670] usb 3-14: New USB device found, idVendor=046d,
idProduct=082d, bcdDevice= 0.11
[  123.489678] usb 3-14: New USB device strings: Mfr=0, Product=2,
SerialNumber=1
[  123.489683] usb 3-14: Product: HD Pro Webcam C920
[  123.489687] usb 3-14: SerialNumber: 378FEEAF
[  123.490792] uvcvideo: Probing known UVC device 14 (046d:082d)
[  123.490895] uvcvideo: Found format YUV 4:2:2 (YUYV).
[  123.490900] uvcvideo: - 640x480 (30.0 fps)
[  123.490903] uvcvideo: - 160x90 (30.0 fps)
[  123.490906] uvcvideo: - 160x120 (30.0 fps)
[  123.490909] uvcvideo: - 176x144 (30.0 fps)
[  123.490930] uvcvideo: - 320x180 (30.0 fps)
[  123.490933] uvcvideo: - 320x240 (30.0 fps)
[  123.490936] uvcvideo: - 352x288 (30.0 fps)
[  123.490940] uvcvideo: - 432x240 (30.0 fps)
[  123.490943] uvcvideo: - 640x360 (30.0 fps)
[  123.490946] uvcvideo: - 800x448 (30.0 fps)
[  123.490953] uvcvideo: - 800x600 (24.0 fps)
[  123.490956] uvcvideo: - 864x480 (24.0 fps)
[  123.490959] uvcvideo: - 960x720 (15.0 fps)
[  123.490962] uvcvideo: - 1024x576 (15.0 fps)
[  123.490965] uvcvideo: - 1280x720 (10.0 fps)
[  123.490969] uvcvideo: - 1600x896 (7.5 fps)
[  123.490972] uvcvideo: - 1920x1080 (5.0 fps)
[  123.490975] uvcvideo: - 2304x1296 (2.0 fps)
[  123.490978] uvcvideo: - 2304x1536 (2.0 fps)
[  123.490982] uvcvideo: Found format H.264.
[  123.490985] uvcvideo: - 640x480 (30.0 fps)
[  123.490989] uvcvideo: - 160x90 (30.0 fps)
[  123.490992] uvcvideo: - 160x120 (30.0 fps)
[  123.490995] uvcvideo: - 176x144 (30.0 fps)
[  123.490998] uvcvideo: - 320x180 (30.0 fps)
[  123.491001] uvcvideo: - 320x240 (30.0 fps)
[  123.491004] uvcvideo: - 352x288 (30.0 fps)
[  123.491008] uvcvideo: - 432x240 (30.0 fps)
[  123.491011] uvcvideo: - 640x360 (30.0 fps)
[  123.491014] uvcvideo: - 800x448 (30.0 fps)
[  123.491017] uvcvideo: - 800x600 (30.0 fps)
[  123.491020] uvcvideo: - 864x480 (30.0 fps)
[  123.491023] uvcvideo: - 960x720 (30.0 fps)
[  123.491026] uvcvideo: - 1024x576 (30.0 fps)
[  123.491030] uvcvideo: - 1280x720 (30.0 fps)
[  123.491033] uvcvideo: - 1600x896 (30.0 fps)
[  123.491036] uvcvideo: - 1920x1080 (30.0 fps)
[  123.491039] uvcvideo: Found format MJPEG.
[  123.491042] uvcvideo: - 640x480 (30.0 fps)
[  123.491045] uvcvideo: - 160x90 (30.0 fps)
[  123.491049] uvcvideo: - 160x120 (30.0 fps)
[  123.491052] uvcvideo: - 176x144 (30.0 fps)
[  123.491055] uvcvideo: - 320x180 (30.0 fps)
[  123.491058] uvcvideo: - 320x240 (30.0 fps)
[  123.491061] uvcvideo: - 352x288 (30.0 fps)
[  123.491064] uvcvideo: - 432x240 (30.0 fps)
[  123.491067] uvcvideo: - 640x360 (30.0 fps)
[  123.491071] uvcvideo: - 800x448 (30.0 fps)
[  123.491074] uvcvideo: - 800x600 (30.0 fps)
[  123.491077] uvcvideo: - 864x480 (30.0 fps)
[  123.491080] uvcvideo: - 960x720 (30.0 fps)
[  123.491083] uvcvideo: - 1024x576 (30.0 fps)
[  123.491086] uvcvideo: - 1280x720 (30.0 fps)
[  123.491089] uvcvideo: - 1600x896 (30.0 fps)
[  123.491092] uvcvideo: - 1920x1080 (30.0 fps)
[  123.491105] uvcvideo: Found a Status endpoint (addr 83).
[  123.491109] uvcvideo: Found UVC 1.00 device HD Pro Webcam C920 (046d:082d)
[  123.491112] uvcvideo: Forcing device quirks to 0x100 by module
parameter for testing purpose.
[  123.491115] uvcvideo: Please report required quirks to the
linux-uvc-devel mailing list.
[  123.491197] uvcvideo: Added control
00000000-0000-0000-0000-000000000001/2 to device 14 entity 1
[  123.491203] uvcvideo: Adding mapping 'Exposure, Auto' to control
00000000-0000-0000-0000-000000000001/2.
[  123.491270] uvcvideo: Added control
00000000-0000-0000-0000-000000000001/3 to device 14 entity 1
[  123.491275] uvcvideo: Adding mapping 'Exposure, Auto Priority' to
control 00000000-0000-0000-0000-000000000001/3.
[  123.491336] uvcvideo: Added control
00000000-0000-0000-0000-000000000001/4 to device 14 entity 1
[  123.491341] uvcvideo: Adding mapping 'Exposure (Absolute)' to
control 00000000-0000-0000-0000-000000000001/4.
[  123.491402] uvcvideo: Added control
00000000-0000-0000-0000-000000000001/6 to device 14 entity 1
[  123.491406] uvcvideo: Adding mapping 'Focus (absolute)' to control
00000000-0000-0000-0000-000000000001/6.
[  123.491471] uvcvideo: Added control
00000000-0000-0000-0000-000000000001/11 to device 14 entity 1
[  123.491475] uvcvideo: Adding mapping 'Zoom, Absolute' to control
00000000-0000-0000-0000-000000000001/11.
[  123.491537] uvcvideo: Added control
00000000-0000-0000-0000-000000000001/13 to device 14 entity 1
[  123.491542] uvcvideo: Adding mapping 'Pan (Absolute)' to control
00000000-0000-0000-0000-000000000001/13.
[  123.491545] uvcvideo: Adding mapping 'Tilt (Absolute)' to control
00000000-0000-0000-0000-000000000001/13.
[  123.491608] uvcvideo: Added control
00000000-0000-0000-0000-000000000001/8 to device 14 entity 1
[  123.491613] uvcvideo: Adding mapping 'Focus, Auto' to control
00000000-0000-0000-0000-000000000001/8.
[  123.491675] uvcvideo: Added control
00000000-0000-0000-0000-000000000101/2 to device 14 entity 3
[  123.491679] uvcvideo: Adding mapping 'Brightness' to control
00000000-0000-0000-0000-000000000101/2.
[  123.491739] uvcvideo: Added control
00000000-0000-0000-0000-000000000101/3 to device 14 entity 3
[  123.491743] uvcvideo: Adding mapping 'Contrast' to control
00000000-0000-0000-0000-000000000101/3.
[  123.491803] uvcvideo: Added control
00000000-0000-0000-0000-000000000101/7 to device 14 entity 3
[  123.491807] uvcvideo: Adding mapping 'Saturation' to control
00000000-0000-0000-0000-000000000101/7.
[  123.491873] uvcvideo: Added control
00000000-0000-0000-0000-000000000101/8 to device 14 entity 3
[  123.491878] uvcvideo: Adding mapping 'Sharpness' to control
00000000-0000-0000-0000-000000000101/8.
[  123.491961] uvcvideo: Added control
00000000-0000-0000-0000-000000000101/10 to device 14 entity 3
[  123.491966] uvcvideo: Adding mapping 'White Balance Temperature' to
control 00000000-0000-0000-0000-000000000101/10.
[  123.492029] uvcvideo: Added control
00000000-0000-0000-0000-000000000101/1 to device 14 entity 3
[  123.492034] uvcvideo: Adding mapping 'Backlight Compensation' to
control 00000000-0000-0000-0000-000000000101/1.
[  123.492094] uvcvideo: Added control
00000000-0000-0000-0000-000000000101/4 to device 14 entity 3
[  123.492098] uvcvideo: Adding mapping 'Gain' to control
00000000-0000-0000-0000-000000000101/4.
[  123.492159] uvcvideo: Added control
00000000-0000-0000-0000-000000000101/5 to device 14 entity 3
[  123.492164] uvcvideo: Adding mapping 'Power Line Frequency' to
control 00000000-0000-0000-0000-000000000101/5.
[  123.492225] uvcvideo: Added control
00000000-0000-0000-0000-000000000101/11 to device 14 entity 3
[  123.492229] uvcvideo: Adding mapping 'White Balance Temperature,
Auto' to control 00000000-0000-0000-0000-000000000101/11.
[  123.492239] uvcvideo: Scanning UVC chain: OT 4 <- PU 3 (-> XU 6 XU
12) <- IT 1
[  123.492248]  (-> XU 8 XU 9 XU 10 XU 11)
[  123.492253] uvcvideo: Found a valid video chain (1 -> 4).
[  123.492933] input: HD Pro Webcam C920 as
/devices/pci0000:00/0000:00:14.0/usb3/3-14/3-14:1.0/input/input35
[  123.493064] uvcvideo: UVC device initialized.
[  123.792854] uvcvideo: uvc_v4l2_open
[  123.793000] uvcvideo: uvc_v4l2_release
[  123.803307] uvcvideo: uvc_v4l2_open
[  123.803379] uvcvideo: uvc_v4l2_release
[  123.803941] uvcvideo: uvc_v4l2_open
