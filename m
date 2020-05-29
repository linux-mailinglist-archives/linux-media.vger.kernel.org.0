Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5321F1E7AAE
	for <lists+linux-media@lfdr.de>; Fri, 29 May 2020 12:34:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725795AbgE2Ke5 convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-media@lfdr.de>); Fri, 29 May 2020 06:34:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60502 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725601AbgE2Ke5 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 29 May 2020 06:34:57 -0400
Received: from gofer.mess.org (gofer.mess.org [IPv6:2a02:8011:d000:212::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1AF10C03E969
        for <linux-media@vger.kernel.org>; Fri, 29 May 2020 03:34:57 -0700 (PDT)
Received: by gofer.mess.org (Postfix, from userid 1000)
        id DF190C638E; Fri, 29 May 2020 11:34:53 +0100 (BST)
Date:   Fri, 29 May 2020 11:34:53 +0100
From:   Sean Young <sean@mess.org>
To:     Johan Claude-Breuninger <johan.claudebreuninger@gmail.com>
Cc:     linux-media@vger.kernel.org
Subject: Re: em28xx driver issue kernel 5.7.0
Message-ID: <20200529103453.GA27598@gofer.mess.org>
References: <3329904.flSn8SIOqe@johan-pc>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: 8BIT
In-Reply-To: <3329904.flSn8SIOqe@johan-pc>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Fri, May 29, 2020 at 10:32:38AM +0200, Johan Claude-Breuninger wrote:
> Good morning,
> 
> 
> I hope that this is the right place to report a bug for the em28xx driver as I did not have success on the kernel bug tracker.
> 
> Since I started using the 5.7.0 rcs I am getting following call trace with a Hauppauge WinTV-soloHD using the em28xx driver. Other tuners work as expected.

What kernel version are you using exactly? I would not expect this on a
v5.7.0-rc* version, without patches.

There is a fix for this here: https://git.linuxtv.org/media_tree.git/commit/?id=9f984cacf4f4d53fd8a3f44d7f13528b81c1f6a8

Thanks

Sean

> 
> 
> Dmesg output:
> 
> [    4.576429] ------------[ cut here ]------------
> [    4.576438] WARNING: CPU: 4 PID: 891 at drivers/media/mc/mc-entity.c:669 media_create_pad_link+0x1cd/0x200 [mc]
> [    4.576439] Modules linked in: si2157 si2168 i2c_mux em28xx_dvb(+) dvb_core cmac algif_hash algif_skcipher af_alg bnep btusb btrtl btbcm btintel bluetooth snd_usb_audio uvcvideo videobuf2_vmalloc videobuf2_memops snd_usbmidi_lib videobuf2_v4l2 snd_rawmidi videobuf2_common ecdh_generic snd_seq_device ecc em28xx tveeprom videodev mousedev input_leds joydev mc rfkill lm92 it87 hwmon_vid hid_generic usbhid hid edac_mce_amd amdgpu kvm_amd kvm nls_iso8859_1 nls_cp437 vfat snd_hda_codec_realtek fat snd_hda_codec_generic irqbypass ledtrig_audio snd_hda_codec_hdmi snd_hda_intel snd_intel_dspcfg gpu_sched snd_hda_codec ttm crct10dif_pclmul crc32_pclmul snd_hda_core ghash_clmulni_intel wmi_bmof mxm_wmi drm_kms_helper snd_hwdep snd_pcm igb cec aesni_intel rc_core snd_timer ccp snd sp5100_tco crypto_simd syscopyarea sysfillrect cryptd i2c_algo_bit sysimgblt pcspkr k10temp i2c_piix4 glue_helper dca fb_sys_fops soundcore rng_core wmi evdev pinctrl_amd mac_hid acpi_cpufreq vboxnetflt(OE) vboxnetadp(OE)
> [    4.576486]  drm vboxdrv(OE) crypto_user agpgart ip_tables x_tables ext4 crc32c_generic crc16 mbcache jbd2 crc32c_intel xhci_pci xhci_hcd
> [    4.576496] CPU: 4 PID: 891 Comm: modprobe Tainted: G           OE     5.7.0-rc7-1-mainline #1
> [    4.576497] Hardware name: Gigabyte Technology Co., Ltd. X570 AORUS PRO/X570 AORUS PRO, BIOS F12e 03/06/2020
> [    4.576502] RIP: 0010:media_create_pad_link+0x1cd/0x200 [mc]
> [    4.576505] Code: 5f c3 0f 0b 48 83 c4 10 b8 ea ff ff ff 5b 5d 41 5c 41 5d 41 5e 41 5f c3 0f 0b b8 ea ff ff ff eb d2 0f 0b b8 ea ff ff ff eb c9 <0f> 0b b8 ea ff ff ff eb c0 0f 0b b8 ea ff ff ff eb b7 b8 f4 ff ff
> [    4.576507] RSP: 0018:ffffa670411d3af8 EFLAGS: 00010246
> [    4.576509] RAX: 0000000000000000 RBX: ffffa0f9a7d75400 RCX: 0000000000000000
> [    4.576510] RDX: ffffa0f9a97cd310 RSI: 0000000000000000 RDI: ffffa0f9a97cd290
> [    4.576512] RBP: ffffa0f9a97cd290 R08: 0000000000000001 R09: 0000000000000000
> [    4.576513] R10: 0000000000000001 R11: 0000000000000001 R12: 0000000000000000
> [    4.576514] R13: ffffa0f9c13b0cc8 R14: ffffa0f9cbca1038 R15: 0000000000000000
> [    4.576516] FS:  00007f6781ea2740(0000) GS:ffffa0f9ceb00000(0000) knlGS:0000000000000000
> [    4.576517] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> [    4.576518] CR2: 00007f5db8b8ccb0 CR3: 00000003df630000 CR4: 0000000000340ee0
> [    4.576520] Call Trace:
> [    4.576533]  dvb_create_media_graph+0x48a/0x590 [dvb_core]
> [    4.576540]  em28xx_dvb_init.cold+0x1028/0x25e4 [em28xx_dvb]
> [    4.576550]  em28xx_register_extension+0x5a/0xb0 [em28xx]
> [    4.576554]  ? 0xffffffffc03dd000
> [    4.576558]  do_one_initcall+0x59/0x240
> [    4.576564]  do_init_module+0x5c/0x260
> [    4.576567]  load_module+0x2137/0x23a0
> [    4.576574]  __do_sys_init_module+0x172/0x1a0
> [    4.576580]  do_syscall_64+0x49/0x90
> [    4.576584]  entry_SYSCALL_64_after_hwframe+0x44/0xa9
> [    4.576586] RIP: 0033:0x7f6781fcf73e
> [    4.576589] Code: 48 8b 0d 55 f7 0b 00 f7 d8 64 89 01 48 83 c8 ff c3 66 2e 0f 1f 84 00 00 00 00 00 90 f3 0f 1e fa 49 89 ca b8 af 00 00 00 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 8b 0d 22 f7 0b 00 f7 d8 64 89 01 48
> [    4.576591] RSP: 002b:00007ffcbe457b48 EFLAGS: 00000246 ORIG_RAX: 00000000000000af
> [    4.576593] RAX: ffffffffffffffda RBX: 000056363963fff0 RCX: 00007f6781fcf73e
> [    4.576594] RDX: 00005636389fd368 RSI: 000000000000e158 RDI: 0000563639e4e4e0
> [    4.576595] RBP: 0000563639e4e4e0 R08: 0000000000000000 R09: 00007ffcbe455b48
> [    4.576596] R10: 0000000000000001 R11: 0000000000000246 R12: 00005636389fd368
> [    4.576598] R13: 0000000000000000 R14: 0000563639640070 R15: 000056363963fff0
> [    4.576601] ---[ end trace 12d333b621a2a68c ]---
> 
> 
> Thanks
> 
> Johan Breuninger
> 
> 
