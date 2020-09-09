Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 54D6A2626C6
	for <lists+linux-media@lfdr.de>; Wed,  9 Sep 2020 07:30:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725826AbgIIFaQ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 9 Sep 2020 01:30:16 -0400
Received: from mail.kernel.org ([198.145.29.99]:46522 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725807AbgIIFaQ (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 9 Sep 2020 01:30:16 -0400
Received: from coco.lan (ip5f5ad5d6.dynamic.kabel-deutschland.de [95.90.213.214])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 3555921D40;
        Wed,  9 Sep 2020 05:30:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1599629414;
        bh=GRwd8dqBTLZ/DWyDb8mXamyviTknC72XE/GQe9hkE8M=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=nPYYJhlxxaUyMIi+1yHz+j5B8mS9P6a55oBOL6bHBEzant1t7EnHqGKcirL3BQfL2
         7KQxk6UeAxqcoTqbLMHAj35PoZBf9WaqHD6vNsCGGnPRcKyWUezkAeowv3eYrojeGW
         PPgoY7KUUbw7+y96g2E/1AJUaKTQpG0r0zdlWh/k=
Date:   Wed, 9 Sep 2020 07:30:10 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     "Jaymes, Casey" <jaymes@teralogics.com>
Cc:     linux-media@vger.kernel.org
Subject: Re: cx23885 on Red Hat 3.10.0-1127.18.2.el7.x86_64
Message-ID: <20200909073010.2cd532d0@coco.lan>
In-Reply-To: <CANvTTZJznQsMGTP=N-O-yGxCtAeLpVdf9vtbxEnJsrd-GLDx8Q@mail.gmail.com>
References: <CANvTTZJznQsMGTP=N-O-yGxCtAeLpVdf9vtbxEnJsrd-GLDx8Q@mail.gmail.com>
X-Mailer: Claws Mail 3.17.6 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Casey,

Em Tue, 8 Sep 2020 17:56:50 -0400
"Jaymes, Casey" <jaymes@teralogics.com> escreveu:

> I'm trying to get a cx23885 pci card (specifically an Osprey) to work
> on a Red Hat 7 system. The hardware works with the old kernel version
> (-1127.13.1 I think). We've previously compiled this from an old
> tarball, but the tarball is no longer available, so I started from
> latest.
> 
> I couldn't get the build to work out of the box, but I'm using the
> attached patches to get the build to work for this kernel version. I
> believe Red Hat applies some backports to their kernels. The build
> completes successfully. I insmod frame_vector.ko, and modprobe the
> cx23885 module, but that produces the following kernel panic:
> 
> > [ 1304.374594] cx23885: cx23885 driver version 0.0.4 loaded
> > [ 1304.374838] cx23885: CORE cx23885[0]: subsystem: 1576:0460, board: ViewCast 460e [card=55,autodetected]
> > [ 1304.530469] cx23885: cx23885[0]: card 'ViewCast 460e' sn# MM14182198
> > [ 1304.542750] cx25840 4-0044: cx23888 A/V decoder found @ 0x88 (cx23885[0])
> > [ 1305.161856] cx25840 4-0044: loaded v4l-cx23885-avcore-01.fw firmware (16382 bytes)
> > [ 1305.197830] cs3308 2-0040: chip found @ 0x80 (cx23885[0])
> > [ 1305.204288] cs3308 2-0041: chip found @ 0x82 (cx23885[0])
> > [ 1305.273433] cx23885: cx23885[0]: registered device video0 [v4l2]
> > [ 1305.273490] cx23885: cx23885[0]: registered device vbi0
> > [ 1305.274322] cx23885: cx23885[0]: alsa: registered ALSA audio device
> > [ 1305.274326] cx23885: cx23885_dev_checkrevision() Hardware revision = 0xd0
> > [ 1305.274333] cx23885: cx23885[0]/0: found at 0000:05:00.0, rev: 4, irq: 37, latency: 0, mmio: 0xdf800000
> > [ 1305.274577] cx23885: CORE cx23885[1]: subsystem: 1576:0460, board: ViewCast 460e [card=55,autodetected]
> > [ 1305.430379] cx23885: cx23885[1]: card 'ViewCast 460e' sn# MM14182198
> > [ 1305.434246] cx25840 7-0044: cx23888 A/V decoder found @ 0x88 (cx23885[1])
> > [ 1306.053067] cx25840 7-0044: loaded v4l-cx23885-avcore-01.fw firmware (16382 bytes)
> > [ 1306.151362] cx23885: cx23885[1]: registered device video1 [v4l2]
> > [ 1306.151423] cx23885: cx23885[1]: registered device vbi1
> > [ 1306.151599] cx23885: cx23885[1]: alsa: registered ALSA audio device
> > [ 1306.151603] cx23885: cx23885_dev_checkrevision() Hardware revision = 0xd0
> > [ 1306.151609] cx23885: cx23885[1]/0: found at 0000:07:00.0, rev: 4, irq: 37, latency: 0, mmio: 0xdf600000
> > [ 1306.151775] cx23885: CORE cx23885[2]: subsystem: 1576:0460, board: ViewCast 460e [card=55,autodetected]
> > [ 1306.307127] cx23885: cx23885[2]: card 'ViewCast 460e' sn# MM14182198
> > [ 1306.310374] cx25840 10-0044: cx23888 A/V decoder found @ 0x88 (cx23885[2])
> > [ 1306.928952] cx25840 10-0044: loaded v4l-cx23885-avcore-01.fw firmware (16382 bytes)
> > [ 1307.027740] cx23885: cx23885[2]: registered device video2 [v4l2]
> > [ 1307.027824] cx23885: cx23885[2]: registered device vbi2
> > [ 1307.028016] cx23885: cx23885[2]: alsa: registered ALSA audio device
> > [ 1307.028020] cx23885: cx23885_dev_checkrevision() Hardware revision = 0xd0
> > [ 1307.028025] cx23885: cx23885[2]/0: found at 0000:08:00.0, rev: 4, irq: 41, latency: 0, mmio: 0xdf400000
> > [ 1307.028230] cx23885: CORE cx23885[3]: subsystem: 1576:0460, board: ViewCast 460e [card=55,autodetected]
> > [ 1307.184364] cx23885: cx23885[3]: card 'ViewCast 460e' sn# MM14182198
> > [ 1307.187915] cx25840 13-0044: cx23888 A/V decoder found @ 0x88 (cx23885[3])
> > [ 1307.806138] cx25840 13-0044: loaded v4l-cx23885-avcore-01.fw firmware (16382 bytes)
> > [ 1307.904302] cx23885: cx23885[3]: registered device video3 [v4l2]
> > [ 1307.904390] cx23885: cx23885[3]: registered device vbi3
> > [ 1307.904614] cx23885: cx23885[3]: alsa: registered ALSA audio device
> > [ 1307.904618] cx23885: cx23885_dev_checkrevision() Hardware revision = 0xd0
> > [ 1307.904623] cx23885: cx23885[3]/0: found at 0000:09:00.0, rev: 4, irq: 37, latency: 0, mmio: 0xdf200000
> > [ 1310.728935] BUG: unable to handle kernel NULL pointer dereference at (null)
> > [ 1310.728997] IP: [<ffffffffc08bc80d>] set_queue_consistency+0xd/0x40 [videobuf2_common]
> > [ 1310.729051] PGD 800000022000e067 PUD 22000d067 PMD 0
> > [ 1310.729110] Oops: 0002 [#1] SMP
> > [ 1310.729150] Modules linked in: tuner(OE) cs3308(OE) cx25840(OE) cx23885(OE) videobuf2_dma_sg(OE) videobuf2_dvb(OE) altera_ci(OE) dvb_core(OE) videobuf2_vmalloc(OE) videobuf2_memops(OE) frame_vector(POE) cx2341x(OE) altera_stapl(OE) tda18271(OE) tveeprom(OE) snd_seq snd_seq_device snd_pcm snd_timer snd soundcore videobuf2_v4l2(OE) xt_pkttype ip6t_rpfilter ip6t_REJECT nf_reject_ipv6 ipt_REJECT nf_reject_ipv4 xt_conntrack ebtable_nat ebtable_broute bridge stp llc ip6table_nat nf_conntrack_ipv6 nf_defrag_ipv6 nf_nat_ipv6 ip6table_mangle ip6table_security ip6table_raw iptable_nat nf_conntrack_ipv4 nf_defrag_ipv4 nf_nat_ipv4 nf_nat iptable_mangle iptable_security iptable_raw nf_conntrack libcrc32c ip_set nfnetlink ebtable_filter ebtables ip6table_filter ip6_tables iptable_filter dm_mirror dm_region_hash
> > [ 1310.729939] dm_log sb_edac intel_powerclamp coretemp iTCO_wdt intel_rapl iTCO_vendor_support iosf_mbi kvm_intel mxm_wmi kvm irqbypass crc32_pclmul ghash_clmulni_intel aesni_intel ipmi_ssif pcspkr sg joydev i2c_i801 lpc_ich mei_me mei videobuf2_common(OE) rc_core(OE) videodev(OE) mc(OE) ioatdma dca ipmi_si ipmi_devintf ipmi_msghandler wmi ip_tables ext4 mbcache jbd2 sr_mod cdrom sd_mod crc_t10dif mgag200 i2c_algo_bit drm_kms_helper syscopyarea sysfillrect sysimgblt fb_sys_fops ttm isci ahci libsas drm scsi_transport_sas libahci e1000e crct10dif_pclmul libata ptp drm_panel_orientation_quirks pps_core authenc cmac zlib wp512 twofish_generic twofish_avx_x86_64 twofish_x86_64_3way twofish_x86_64 twofish_common tea sha512_ssse3 sha512_generic serpent_avx_x86_64 serpent_sse2_x86_64 serpent_generic seed
> > [ 1310.730726] salsa20_generic salsa20_x86_64 rmd320 rmd256 rmd160 rmd128 michael_mic md4 khazad ghash_generic gcm fcrypt drbg dm_crypt dm_mod des_generic deflate cts crypto_null crct10dif_generic crct10dif_common crc32c_intel ccm cast6_avx_x86_64 cast6_generic cast_common camellia_generic camellia_aesni_avx_x86_64 ablk_helper cryptd camellia_x86_64 xts lrw gf128mul glue_helper blowfish_generic blowfish_x86_64 blowfish_common arc4 ansi_cprng [last unloaded: tcrypt]
> > [ 1310.731100] CPU: 0 PID: 5200 Comm: ffmpeg Tainted: P OE ------------ 3.10.0-1127.18.2.el7.x86_64 #1
> > [ 1310.731189] Hardware name: Crystal Group, Inc. X9DRL-3F/iF/X9DRL-3F/iF, BIOS 3.0a 08/08/2013
> > [ 1310.731262] task: ffff895c3417b150 ti: ffff895c3cf7c000 task.ti: ffff895c3cf7c000
> > [ 1310.731328] RIP: 0010:[<ffffffffc08bc80d>] [<ffffffffc08bc80d>] set_queue_consistency+0xd/0x40 [videobuf2_common]
> > [ 1310.734585] RSP: 0018:ffff895c3cf7fbf0 EFLAGS: 00010246
> > [ 1310.737760] RAX: 0000000000000000 RBX: ffff895c2ceb6498 RCX: 0000000000000000
> > [ 1310.740908] RDX: 0000000000000000 RSI: 0000000000000001 RDI: ffff895c2ceb6498
> > [ 1310.743965] RBP: ffff895c3cf7fbf0 R08: 0000000000000000 R09: 0000000000000000
> > [ 1310.746988] R10: 0000000000000000 R11: 0000000000000000 R12: ffff895c3cf7fda8
> > [ 1310.749965] R13: 0000000000000001 R14: ffff895c2ceb6500 R15: 0000000000000001
> > [ 1310.752954] FS: 00007f031b0148c0(0000) GS:ffff895c77c00000(0000) knlGS:0000000000000000
> > [ 1310.755919] CS: 0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> > [ 1310.758845] CR2: 0000000000000000 CR3: 0000000274a12000 CR4: 00000000001607f0
> > [ 1310.761684] Call Trace:
> > [ 1310.764500] [<ffffffffc08be7e0>] vb2_core_reqbufs+0x1c0/0x5e0 [videobuf2_common]
> > [ 1310.767311] [<ffffffffc0b3098b>] vb2_ioctl_reqbufs+0x9b/0xd0 [videobuf2_v4l2]
> > [ 1310.770069] [<ffffffffc08ec850>] v4l_reqbufs+0x40/0x50 [videodev]
> > [ 1310.772897] [<ffffffffc08ebe5e>] __video_do_ioctl+0x38e/0x510 [videodev]
> > [ 1310.775567] [<ffffffff9080121c>] ? page_add_file_rmap+0x8c/0xc0
> > [ 1310.778193] [<ffffffffc08ebad0>] ? v4l_enum_fmt+0x240/0x240 [videodev]
> > [ 1310.780904] [<ffffffffc08eea7c>] video_usercopy+0x15c/0x520 [videodev]
> > [ 1310.783479] [<ffffffff907ee609>] ? do_read_fault.isra.63+0x139/0x1b0
> > [ 1310.786053] [<ffffffff907f5d80>] ? handle_mm_fault+0xa20/0xfb0
> > [ 1310.788731] [<ffffffffc08eee55>] video_ioctl2+0x15/0x20 [videodev]
> > [ 1310.791260] [<ffffffffc08e50d9>] v4l2_ioctl+0x49/0x60 [videodev]
> > [ 1310.793869] [<ffffffff90862890>] do_vfs_ioctl+0x3a0/0x5b0
> > [ 1310.796329] [<ffffffff90d8d678>] ? __do_page_fault+0x238/0x500
> > [ 1310.798876] [<ffffffff90862b41>] SyS_ioctl+0xa1/0xc0
> > [ 1310.801259] [<ffffffff90d92ed2>] system_call_fastpath+0x25/0x2a
> > [ 1310.803754] Code: 9b 05 00 00 48 c7 c7 90 11 8c c0 e8 4e f6 dd cf eb ea 66 90 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 44 00 00 55 48 8b 47 10 48 89 e5 <0f> ba 30 03 f6 47 19 02 74 09 83 bf d0 00 00 00 01 74 08 5d c3
> > [ 1310.808952] RIP [<ffffffffc08bc80d>] set_queue_consistency+0xd/0x40 [videobuf2_common]
> > [ 1310.811425] RSP <ffff895c3cf7fbf0>
> > [ 1310.813882] CR2: 0000000000000000
> > [ 1310.816189] ---[ end trace d8dab7f4f28e4264 ]---
> > [ 1312.815578] Kernel panic - not syncing: Fatal exception  
> 
> As near as I can tell so far, the oops happens somewhere around line
> #801 in media_build/linux/drivers/media/common/videobuf2/videobuf2-core.c:
> > WARN_ON(q->min_buffers_needed > VB2_MAX_FRAME);  
> 
> I'm not a kernel driver dev by any stretch, so if anyone has ideas,
> I'd love to hear them :)

It is very hard for us to help you with that, as 3.10 is a way too old,
and I'm almost sure that RHEL7 has a backport from a later media
stack. I did a few such backports myself, when I was working at
Red Hat several years ago.

So, if you're a RHEL customer, I strongly suggest you to open
a bug there.

That's said, if the issue is indeed at this line:

	WARN_ON(q->min_buffers_needed > VB2_MAX_FRAME);

and you're getting this error:

	BUG: unable to handle kernel NULL pointer dereference at (null)

Then it is saying that "q" is NULL.

Thanks,
Mauro
