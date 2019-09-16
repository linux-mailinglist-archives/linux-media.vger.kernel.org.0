Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 251CEB3901
	for <lists+linux-media@lfdr.de>; Mon, 16 Sep 2019 13:06:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726330AbfIPLGl (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 16 Sep 2019 07:06:41 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:55408 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726081AbfIPLGl (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 16 Sep 2019 07:06:41 -0400
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: koike)
        with ESMTPSA id 0FDC728B28A
Subject: Re: media: vimc-debayer: lock problem
To:     Randy Dunlap <rdunlap@infradead.org>,
        linux-media <linux-media@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Shuah Khan <skhan@linuxfoundation.org>
References: <977ffd28-7dfe-f434-008c-847c2527d540@infradead.org>
From:   Helen Koike <helen.koike@collabora.com>
Openpgp: preference=signencrypt
Autocrypt: addr=helen.koike@collabora.com; keydata=
 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
Message-ID: <60c15719-56b9-f996-b494-430dbd8c6d3d@collabora.com>
Date:   Mon, 16 Sep 2019 08:06:30 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <977ffd28-7dfe-f434-008c-847c2527d540@infradead.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Randy,

On 9/14/19 11:16 PM, Randy Dunlap wrote:
> Kernel is 5.3-rc8 on x86_64.
> 
> Loading, unloading, and then loading the vimc-debayer module causes:
> 
> 
> [  793.542496] ------------[ cut here ]------------
> [  793.542518] DEBUG_LOCKS_WARN_ON(lock->magic != lock)
> [  793.542536] WARNING: CPU: 3 PID: 2029 at ../kernel/locking/mutex.c:912 __mutex_lock+0xd7c/0x1480
> [  793.542559] Modules linked in: vimc_debayer(+) vimc_capture vimc_scaler vimc_sensor v4l2_tpg vimc v4l2_common ccm xt_tcpudp ip6t_rpfilter ip6t_REJECT nf_reject_ipv6 ipt_REJECT nf_reject_ipv4 af_packet xt_conntrack ip_set nfnetlink ebtable_nat ebtable_broute ip6table_nat ip6table_mangle ip6table_raw ip6table_security iptable_nat scsi_transport_iscsi nf_nat nf_conntrack nf_defrag_ipv6 nf_defrag_ipv4 iptable_mangle iptable_raw iptable_security ebtable_filter ebtables ip6table_filter ip6_tables iptable_filter ip_tables x_tables bpfilter coretemp hwmon intel_rapl_msr intel_rapl_common x86_pkg_temp_thermal intel_powerclamp kvm_intel kvm irqbypass crct10dif_pclmul crc32_generic crc32_pclmul ghash_clmulni_intel msr ghash_generic gf128mul uvcvideo hid_generic btrfs videobuf2_vmalloc gcm videobuf2_memops xor videobuf2_v4l2 iTCO_wdt zstd_compress videobuf2_common videodev iTCO_vendor_support usbmouse usb_debug mei_hdcp usbserial xts raid6_pq mc usbhid libcrc32c crc32c_intel hid
> [  793.542617]  zstd_decompress iwldvm ctr snd_hda_codec_hdmi aesni_intel mac80211 aes_x86_64 snd_hda_codec_realtek crypto_simd snd_hda_codec_generic cryptd ledtrig_audio glue_helper libarc4 snd_hda_intel intel_cstate iwlwifi snd_hda_codec intel_uncore intel_rapl_perf snd_hda_core joydev snd_hwdep input_leds cfg80211 mousedev sdhci_pci toshiba_acpi cqhci sparse_keymap sr_mod snd_pcm uio_pdrv_genirq sdhci uio snd_timer wmi serio_raw pcspkr mmc_core cdrom rfkill led_class snd rtc_cmos mei_me industrialio evdev mei thermal lpc_ich mac_hid soundcore toshiba_haps ac battery sg dm_multipath dm_mod scsi_dh_rdac scsi_dh_emc scsi_dh_alua autofs4 [last unloaded: vimc_debayer]
> [  793.542817] CPU: 3 PID: 2029 Comm: modprobe Not tainted 5.3.0-rc8 #3
> [  793.542829] Hardware name: TOSHIBA PORTEGE R835/Portable PC, BIOS Version 4.10   01/08/2013
> [  793.542845] RIP: 0010:__mutex_lock+0xd7c/0x1480
> [  793.542857] Code: d2 0f 85 35 05 00 00 44 8b 0d 50 7f b2 01 45 85 c9 0f 85 b1 f3 ff ff 48 c7 c6 60 15 89 9c 48 c7 c7 00 14 89 9c e8 b4 86 eb fd <0f> 0b e9 97 f3 ff ff 48 8b 85 88 fe ff ff 48 c1 e8 03 42 80 3c 28
> [  793.542882] RSP: 0018:ffff88812a5eefd0 EFLAGS: 00010282
> [  793.542894] RAX: dffffc0000000008 RBX: ffffffffc1c0f7e0 RCX: ffffffff9a2b67f4
> [  793.542906] RDX: 1ffffffff3a3dfc5 RSI: 0000000000000004 RDI: 0000000000000246
> [  793.542919] RBP: ffff88812a5ef150 R08: fffffbfff3a3dfc5 R09: fffffbfff3a3dfc5
> [  793.542931] R10: 0000000000000001 R11: fffffbfff3a3dfc4 R12: 0000000000000000
> [  793.542944] R13: 0000000000000000 R14: dffffc0000000000 R15: ffffffff9e700400
> [  793.542957] FS:  00007f080c4a6b80(0000) GS:ffff88812aa00000(0000) knlGS:0000000000000000
> [  793.542970] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> [  793.542981] CR2: 00007ffeab8adee8 CR3: 000000010fd66005 CR4: 00000000000606e0
> [  793.542993] Call Trace:
> [  793.543007]  ? do_raw_spin_unlock+0x54/0x220
> [  793.543026]  ? media_device_register_entity+0x1fd/0x710 [mc]
> [  793.543044]  ? mutex_lock_io_nested+0x1380/0x1380
> [  793.543055]  ? ida_alloc_range+0x5b7/0x6e0
> [  793.543068]  ? ida_destroy+0x260/0x260
> [  793.543080]  ? save_stack+0x21/0x90
> [  793.543090]  ? __kasan_kmalloc.constprop.8+0xa7/0xd0
> [  793.543101]  ? kasan_kmalloc+0x9/0x10
> [  793.543111]  ? __kmalloc+0x11f/0x260
> [  793.543123]  ? vimc_pads_init+0x33/0x130 [vimc]
> [  793.543134]  ? vimc_ent_sd_register+0x36/0x350 [vimc]
> [  793.543147]  ? vimc_sen_comp_bind+0x280/0x520 [vimc_sensor]
> [  793.543160]  ? component_bind_all+0x2ef/0xa60
> [  793.543171]  ? vimc_comp_bind+0x74/0x630 [vimc]
> [  793.543188]  ? driver_probe_device+0xf0/0x3a0
> [  793.543199]  ? device_driver_attach+0xec/0x120
> [  793.543212]  mutex_lock_nested+0x16/0x20
> [  793.543223]  ? mutex_lock_nested+0x16/0x20
> [  793.543236]  media_device_register_entity+0x1fd/0x710 [mc]
> [  793.543249]  ? __x64_sys_finit_module+0x6e/0xb0
> [  793.543260]  ? do_syscall_64+0xaa/0x380
> [  793.543271]  ? check_object+0xb2/0x300
> [  793.543282]  ? vimc_pads_init+0x33/0x130 [vimc]
> [  793.543296]  ? media_device_unregister_entity_notify+0xf0/0xf0 [mc]
> [  793.543311]  ? ___slab_alloc+0x5b3/0x600
> [  793.543321]  ? ___slab_alloc+0x5b3/0x600
> [  793.543335]  ? kasan_unpoison_shadow+0x35/0x50
> [  793.543346]  ? __kasan_kmalloc.constprop.8+0xa7/0xd0
> [  793.543358]  ? kasan_kmalloc+0x9/0x10
> [  793.543377]  v4l2_device_register_subdev+0x261/0x620 [videodev]
> [  793.543392]  vimc_ent_sd_register+0x26b/0x350 [vimc]
> [  793.543406]  vimc_sen_comp_bind+0x280/0x520 [vimc_sensor]
> [  793.543421]  component_bind_all+0x2ef/0xa60
> [  793.543433]  ? refcount_inc_checked+0xa/0x50
> [  793.543446]  ? vimc_comp_unbind+0x60/0x60 [vimc]
> [  793.543459]  vimc_comp_bind+0x74/0x630 [vimc]
> [  793.543471]  ? devres_open_group+0x2a0/0x460
> [  793.543483]  ? vimc_comp_unbind+0x60/0x60 [vimc]
> [  793.543499]  try_to_bring_up_master+0x586/0x960
> [  793.543515]  __component_add+0x202/0x520
> [  793.543527]  ? sysfs_do_create_link_sd+0x8c/0x110
> [  793.543540]  component_add+0xb/0x10
> [  793.543552]  vimc_deb_probe+0x14/0x20 [vimc_debayer]
> [  793.543565]  platform_drv_probe+0xbb/0x210
> [  793.543577]  really_probe+0x516/0xb00
> [  793.543589]  driver_probe_device+0xf0/0x3a0
> [  793.543601]  ? mutex_lock_nested+0x16/0x20
> [  793.543613]  device_driver_attach+0xec/0x120
> [  793.543625]  __driver_attach+0x108/0x270
> [  793.543636]  ? device_driver_attach+0x120/0x120
> [  793.543648]  bus_for_each_dev+0x116/0x1b0
> [  793.543659]  ? klist_add_tail+0x2f/0xe0
> [  793.543669]  ? subsys_dev_iter_init+0xe0/0xe0
> [  793.543681]  ? do_raw_spin_unlock+0x54/0x220
> [  793.543692]  ? _raw_spin_unlock+0x22/0x40
> [  793.543704]  driver_attach+0x38/0x50
> [  793.543715]  bus_add_driver+0x44e/0x6a0
> [  793.543727]  driver_register+0x18e/0x410
> [  793.543738]  ? 0xffffffffc1c88000
> [  793.543748]  ? 0xffffffffc1c88000
> [  793.543759]  __platform_driver_register+0xc8/0x110
> [  793.543772]  vimc_deb_pdrv_init+0x17/0x1000 [vimc_debayer]
> [  793.543785]  do_one_initcall+0xab/0x2d5
> [  793.543796]  ? initcall_blacklisted+0x190/0x190
> [  793.543807]  ? kasan_unpoison_shadow+0x35/0x50
> [  793.543819]  ? kasan_unpoison_shadow+0x35/0x50
> [  793.543830]  ? kasan_unpoison_shadow+0x35/0x50
> [  793.543841]  ? kasan_poison_shadow+0x2f/0x40
> [  793.543852]  ? __asan_register_globals+0x5a/0x70
> [  793.543864]  do_init_module+0x1c7/0x582
> [  793.543877]  load_module+0x4efa/0x5f30
> [  793.543897]  ? layout_and_allocate+0x2e10/0x2e10
> [  793.543909]  ? __kasan_check_write+0x14/0x20
> [  793.543920]  ? kernel_read+0xf1/0x140
> [  793.543931]  ? __kasan_check_write+0x14/0x20
> [  793.543943]  ? kernel_read_file+0x244/0x600
> [  793.543957]  ? do_mmap+0x744/0xe40
> [  793.543968]  ? down_write_killable_nested+0x210/0x210
> [  793.543983]  __do_sys_finit_module+0x12a/0x1b0
> [  793.543994]  ? __do_sys_finit_module+0x12a/0x1b0
> [  793.544006]  ? __ia32_sys_init_module+0xa0/0xa0
> [  793.544018]  ? iterate_fd+0x140/0x140
> [  793.544035]  ? vfs_statx_fd+0x45/0x80
> [  793.544045]  ? __kasan_check_write+0x14/0x20
> [  793.544056]  ? fput_many+0x1b/0x130
> [  793.544073]  __x64_sys_finit_module+0x6e/0xb0
> [  793.544085]  do_syscall_64+0xaa/0x380
> [  793.544097]  ? prepare_exit_to_usermode+0xad/0x1b0
> [  793.544110]  entry_SYSCALL_64_after_hwframe+0x44/0xa9
> [  793.544121] RIP: 0033:0x7f080bb922a9
> [  793.544132] Code: 00 f3 c3 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 40 00 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 8b 0d bf 0b 2c 00 f7 d8 64 89 01 48
> [  793.544167] RSP: 002b:00007ffeab8b0fb8 EFLAGS: 00000246 ORIG_RAX: 0000000000000139
> [  793.544190] RAX: ffffffffffffffda RBX: 00005584684d5c10 RCX: 00007f080bb922a9
> [  793.544210] RDX: 0000000000000000 RSI: 00005584682c3548 RDI: 0000000000000003
> [  793.544230] RBP: 00005584682c3548 R08: 0000000000000000 R09: 00005584684d5400
> [  793.544251] R10: 0000000000000003 R11: 0000000000000246 R12: 0000000000040000
> [  793.544272] R13: 00005584684d5dd0 R14: 0000000000000000 R15: 00005584684d5c10
> [  793.544301] ---[ end trace 89125559482bbf21 ]---
> 
> 

Thanks for the report, I believe this should be fixed once this series [1] which
collapses all the vimc modules gets merged.

[1] https://patchwork.kernel.org/project/linux-media/list/?series=171283

Regards,
Helen

