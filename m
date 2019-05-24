Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8A15F28E68
	for <lists+linux-media@lfdr.de>; Fri, 24 May 2019 02:45:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387983AbfEXAp1 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 23 May 2019 20:45:27 -0400
Received: from mail.kernel.org ([198.145.29.99]:40610 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2387582AbfEXAp1 (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 23 May 2019 20:45:27 -0400
Received: from [192.168.1.112] (c-24-9-64-241.hsd1.co.comcast.net [24.9.64.241])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 76B3A2177E;
        Fri, 24 May 2019 00:45:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1558658725;
        bh=Hn9y1A1eL8VjS0KNUpMAVXisfCrIiqGz6z8fneR4aX4=;
        h=To:Cc:From:Subject:Date:From;
        b=nbrLtZn8X+GpCquTbADvU9Wer52Nj05EM3bwouazGYBveYpD+qxc4QLKf3WaTjqYR
         QHSYI3nIi43C6J3qNV+bUI1dn+vlQsjyf7UD/T95aTPjSVflrPbtdqOH0qOIAVY3t3
         T/7EocuoZk6WeCM02f3QdYwABHaCDfDqEj4hLLTA=
To:     Hans Verkuil <hverkuil@xs4all.nl>
Cc:     Linux Media Mailing List <linux-media@vger.kernel.org>,
        shuah <shuah@kernel.org>
From:   shuah <shuah@kernel.org>
Subject: Linux 5.2-rc1 rmmod on vimc_capture panics
Message-ID: <816e7fb2-e238-b17d-865e-513b84f8bc9c@kernel.org>
Date:   Thu, 23 May 2019 18:45:24 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Hans,

vimc isn't happy on Linux 5,2-rc1

When I do rmmod vimc_capture it panics. Just fine on Linux 5.1

commit 3650a23eda89 might be the problem.

[  302.974433] general protection fault: 0000 [#1] SMP PTI
[  302.974441] CPU: 3 PID: 1469 Comm: rmmod Not tainted 5.2.0-rc1+ #6
[  302.974444] Hardware name: Dell Inc. OptiPlex 790/0HY9JP, BIOS A18 
09/24/2013
[  302.974453] RIP: 0010:media_gobj_destroy.part.15+0x1f/0x60
[  302.974457] Code: ff 66 2e 0f 1f 84 00 00 00 00 00 66 66 66 66 90 55 
48 89 fe 48 89 e5 53 48 89 fb 48 c7 c7 a0 67 cf b0 e8 44 fa ff ff 48 8b 
03 <48> 83 80 a0 00 00 00 01 48 8b 43 18 48 8b 53 10 48 89 42 08 48 89
[  302.974461] RSP: 0018:ffffb275c3c97ca0 EFLAGS: 00010246
[  302.974465] RAX: 6096181706d5d9bd RBX: ffff8f28911d0c00 RCX: 
00000000802a0021
[  302.974468] RDX: ffff8f2891952278 RSI: ffff8f28911d0c00 RDI: 
ffffffffb0cf67a0
[  302.974471] RBP: ffffb275c3c97ca8 R08: 0000000001000016 R09: 
ffffffffb047d100
[  302.974474] R10: ffffb275c3c97c28 R11: 0000000000000001 R12: 
0000000000000038
[  302.974477] R13: ffff8f28c6d67d00 R14: ffff8f2891952228 R15: 
ffff8f28911c6aa0
[  302.974481] FS:  00007f9d7239e540(0000) GS:ffff8f28e5580000(0000) 
knlGS:0000000000000000
[  302.974484] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[  302.974487] CR2: 000055f43e465ec8 CR3: 00000001ac900005 CR4: 
00000000000606e0
[  302.974490] Call Trace:
[  302.974496]  media_gobj_destroy+0x14/0x20
[  302.974500]  __media_device_unregister_entity+0xb3/0xe0
[  302.974506]  media_device_unregister_entity+0x30/0x40
[  302.974511]  v4l2_device_unregister_subdev+0xaa/0xe0
[  302.974517]  vimc_ent_sd_unregister+0x1e/0x30 [vimc_common]
[  302.974523]  vimc_sca_comp_unbind+0x16/0x20 [vimc_scaler]
[  302.974529]  component_unbind.isra.8+0x27/0x40
[  302.974534]  component_unbind_all+0xaa/0xc0
[  302.974540]  vimc_comp_unbind+0x36/0x60 [vimc]
[  302.974545]  take_down_master+0x24/0x40
[  302.974550]  component_del+0x8b/0x110
[  302.974556]  vimc_cap_remove+0x19/0x20 [vimc_capture]
[  302.974562]  platform_drv_remove+0x25/0x50
[  302.974567]  device_release_driver_internal+0xe0/0x1b0
[  302.974572]  driver_detach+0x4a/0x90
[  302.974577]  bus_remove_driver+0x5c/0xd0
[  302.974582]  driver_unregister+0x2c/0x40
[  302.974587]  platform_driver_unregister+0x12/0x20
[  302.974592]  vimc_cap_pdrv_exit+0x10/0x4ad [vimc_capture]
[  302.974598]  __x64_sys_delete_module+0x148/0x280
[  302.974607]  do_syscall_64+0x5a/0x140
[  302.974613]  entry_SYSCALL_64_after_hwframe+0x44/0xa9
[  302.974617] RIP: 0033:0x7f9d71ec41b7
[  302.974621] Code: 73 01 c3 48 8b 0d d1 8c 2c 00 f7 d8 64 89 01 48 83 
c8 ff c3 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 44 00 00 b8 b0 00 00 00 0f 
05 <48> 3d 01 f0 ff ff 73 01 c3 48 8b 0d a1 8c 2c 00 f7 d8 64 89 01 48
[  302.974624] RSP: 002b:00007ffff44efba8 EFLAGS: 00000206 ORIG_RAX: 
00000000000000b0
[  302.974628] RAX: ffffffffffffffda RBX: 00007ffff44efc08 RCX: 
00007f9d71ec41b7
[  302.974631] RDX: 000000000000000a RSI: 0000000000000800 RDI: 
000055f43e45b7d8
[  302.974633] RBP: 000055f43e45b770 R08: 00007ffff44eeb21 R09: 
0000000000000000
[  302.974636] R10: 00007f9d71f40cc0 R11: 0000000000000206 R12: 
00007ffff44efdd0
[  302.974639] R13: 00007ffff44f08d6 R14: 000055f43e45b260 R15: 
000055f43e45b770
[  302.974648] Modules linked in: vimc_debayer vimc_sensor vimc_scaler 
vimc_capture(-) v4l2_tpg vimc_common vimc_streamer vimc binfmt_misc 
nls_iso8859_1 intel_rapl x86_pkg_temp_thermal intel_powerclamp coretemp 
kvm_intel kvm irqbypass crct10dif_pclmul crc32_pclmul 
ghash_clmulni_intel dcdbas snd_usb_audio snd_hda_codec_hdmi input_leds 
aesni_intel aes_x86_64 snd_hda_codec_realtek crypto_simd 
snd_hda_codec_generic snd_usbmidi_lib ledtrig_audio snd_seq_midi 
snd_seq_midi_event snd_hda_intel snd_seq cryptd snd_hda_codec 
snd_rawmidi glue_helper snd_seq_device snd_hda_core intel_cstate 
intel_rapl_perf snd_hwdep snd_pcm snd_timer mei_me mei serio_raw lpc_ich 
mac_hid sch_fq_codel parport_pc ppdev lp parport ip_tables x_tables 
autofs4 hid_generic usbhid hid nouveau mxm_wmi wmi ttm drm_kms_helper 
syscopyarea sysfillrect sysimgblt fb_sys_fops drm ahci psmouse e1000e 
i2c_i801 libahci video
[  302.974702] ---[ end trace 15812ed857d8af50 ]---
[  302.974706] RIP: 0010:media_gobj_destroy.part.15+0x1f/0x60
[  302.974710] Code: ff 66 2e 0f 1f 84 00 00 00 00 00 66 66 66 66 90 55 
48 89 fe 48 89 e5 53 48 89 fb 48 c7 c7 a0 67 cf b0 e8 44 fa ff ff 48 8b 
03 <48> 83 80 a0 00 00 00 01 48 8b 43 18 48 8b 53 10 48 89 42 08 48 89
[  302.974713] RSP: 0018:ffffb275c3c97ca0 EFLAGS: 00010246
[  302.974716] RAX: 6096181706d5d9bd RBX: ffff8f28911d0c00 RCX: 
00000000802a0021
[  302.974719] RDX: ffff8f2891952278 RSI: ffff8f28911d0c00 RDI: 
ffffffffb0cf67a0
[  302.974722] RBP: ffffb275c3c97ca8 R08: 0000000001000016 R09: 
ffffffffb047d100
[  302.974725] R10: ffffb275c3c97c28 R11: 0000000000000001 R12: 
0000000000000038
[  302.974728] R13: ffff8f28c6d67d00 R14: ffff8f2891952228 R15: 
ffff8f28911c6aa0
[  302.974731] FS:  00007f9d7239e540(0000) GS:ffff8f28e5580000(0000) 
knlGS:0000000000000000
[  302.974734] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[  302.974737] CR2: 000055f43e465ec8 CR3: 00000001ac900005 CR4: 
00000000000606e0

thanks,
-- Shuah
