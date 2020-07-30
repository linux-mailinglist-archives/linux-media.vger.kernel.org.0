Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 445E8233636
	for <lists+linux-media@lfdr.de>; Thu, 30 Jul 2020 18:01:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729387AbgG3QBm (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 30 Jul 2020 12:01:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41204 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726275AbgG3QBl (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 30 Jul 2020 12:01:41 -0400
Received: from mail-qv1-xf43.google.com (mail-qv1-xf43.google.com [IPv6:2607:f8b0:4864:20::f43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6DDD3C061574
        for <linux-media@vger.kernel.org>; Thu, 30 Jul 2020 09:01:41 -0700 (PDT)
Received: by mail-qv1-xf43.google.com with SMTP id s15so8294615qvv.7
        for <linux-media@vger.kernel.org>; Thu, 30 Jul 2020 09:01:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:message-id:subject:mime-version
         :content-transfer-encoding:content-disposition;
        bh=6YrPwBW7khoA/zVUoxjs2wDBtXZ7HcZQ14CO1K0QvmQ=;
        b=kUE3s+ezpN+252mAewAuR/ZIwywo9d4XrjrUdySvzPP1PyNeUn1Zho2iQjl6Y0q8Id
         laU8Io24vWCJB6T6hlniTtsM8s5Z12DPowne9EMrjhCCkmCL9j5P0Ty5oqJdBckHgETA
         ba8lhn75u+FxInccBr2s4d4F7Z/Y4W4DCArqzxccmdcSpHJRKJxZ9YYmm5ZHiUlw0qW2
         rMgJNkacAwZrzRbJ0nItYShc3anSZZmwt0PPRcb2emXh3o5nAPj7wKQzrHPn/1bpDW+m
         tWU7Pn8IhzYbcfeE2o8PebV6MnQTri86lc1muOh3pjq+4RYSvkkXYQ5SMCLFgwPpBwUa
         sezQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:message-id:subject:mime-version
         :content-transfer-encoding:content-disposition;
        bh=6YrPwBW7khoA/zVUoxjs2wDBtXZ7HcZQ14CO1K0QvmQ=;
        b=NxEY1CnM7ncYB018YwyS9I0TOsmxi9uQLbQT7YMS5ATAXAjRGFMJQJGrvxI/2mQ/oH
         PbgQczEHJE8xk8k6vTLY4rww2Bc0f9CS+FXJNbXzSf+O5A3EsiOgWBOIkGNzgduPl+Sr
         1FVpeIVQx7kCmUgxiLUr5Pp9xx6a+mkaB2DGAImqdUqns64K7CIDuSqBh1d4rGTwq9eN
         akFUT7tzroDEajX9vFH1gdjLgx/Q3SnHPZKOyHk3hqGnVPsP89dsseFmW/WmqgNZubPh
         0GA6LTcc0q5U1nbkv2jZz2QtyKRvlVd5McQpXMGaSv3uJ6AdN2ERNFkdkerHn1EJj1OX
         wLmw==
X-Gm-Message-State: AOAM533mW9H59ktDMH4Zta6CqBJN0gd0bzIsGmhcfaXc1egaTAx6Sr35
        q7ybsWZK1US1ivSyfCrycPc=
X-Google-Smtp-Source: ABdhPJxnm2hmPogutoS4BS/HlWsTfoXllvT9VGq03KJ1nXFTVNRzh7qngw5y2bj9XqDbhSYfwfxM6w==
X-Received: by 2002:ad4:4302:: with SMTP id c2mr3512416qvs.246.1596124900236;
        Thu, 30 Jul 2020 09:01:40 -0700 (PDT)
Received: from dwls-dell ([2804:14d:72b1:8920:a2ce:f815:f14d:bfac])
        by smtp.gmail.com with ESMTPSA id d15sm4161635qka.91.2020.07.30.09.01.37
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 30 Jul 2020 09:01:39 -0700 (PDT)
Date:   Thu, 30 Jul 2020 13:01:28 -0300
From:   "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>
To:     "=?utf-8?Q?mchehab=40kernel.org?=" <mchehab@kernel.org>
Cc:     "=?utf-8?Q?skhan=40linuxfoundation.org?=" <skhan@linuxfoundation.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        "=?utf-8?Q?linux-kernel-mentees=40lists.linuxfoundation.org?=" 
        <linux-kernel-mentees@lists.linuxfoundation.org>
Message-ID: <F27027DA-83DE-4D66-B716-676EF6F85DFF@getmailspring.com>
Subject: vidtv discussion
X-Mailer: Mailspring
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello Mauro & everyone :)

Here's the state of affairs for vidtv.

- Driver is modprobed without any errors on dmesg
- Using dvbv5-scan does not cause the driver to crash
- Driver feeds the demux with TS packets (PSI, PCR, AES3 audio
and NULL packets for padding), but the stream is not valid
yet.
- Kmemleak shows no leaks. UBSAN & KASAN pick up some bugs
- dvbv5-scan fails with: dvb_read_sections: no data read on section filter.

I am using this scan-file:
[Channel]
FREQUENCY = 330000000
MODULATION = QAM/AUTO
SYMBOL_RATE = 6940000
INNER_FEC = AUTO
DELIVERY_SYSTEM = DVBC/ANNEX_A

I find the information reported by UBSAN & KASAN a little bit off, to be
honest. KASAN reports a use after free but nothing crashes, and looking
at the code, I am not sure I agree with it.

The tuner expects an array with valid frequencies so it can simulate a
bad signal quality but so far no default exists in vidtv. What values
should I use?

Lastly, you'll notice that I left the range check commented out for the
buffer I am using in 'struct vidtv_mux'. That's because I'd like some
pointers on what values to use there. Please see 
'static u32 vidtv_bridge_mux_buf_sz_for_mux_rate(void)' in vidtv_bridge.c
to get a feel about what I was thinking in order to keep a constant
mux rate.

dmesg for reference:

[   55.322627] dvbdev: DVB: registering new adapter (dvb_vidtv_bridge)
[   55.353586] i2c i2c-1: DVB: registering adapter 0 frontend 0 (Dummy
demod for DVB-T/T2/C/S/S2)...
[   55.362569] dvb_vidtv_bridge:vidtv_bridge_probe, 458: Successfully
initialized vidtv!
[   58.714772] ================================================================================
[   58.714785] UBSAN: misaligned-access in drivers/media/test-drivers/vidtv/vidtv_psi.c:321:6
[   58.714792] load of misaligned address 00000000214867d8 for type
'struct vidtv_psi_desc *'
[   58.714794] which requires 8 byte alignment
[   58.714799] CPU: 4 PID: 1316 Comm: dvbv5-scan Not tainted 5.8.0-rc6+ #12
[   58.714800] Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS
?-20200516_175120-felixonmars2 04/01/2014
[   58.714802] Call Trace:
[   58.714815]  dump_stack+0x7d/0xb0
[   58.714819]  ubsan_epilogue+0x5/0x40
[   58.714822]  ubsan_type_mismatch_common.cold+0x47/0xcd
[   58.714826]  __ubsan_handle_type_mismatch_v1+0x32/0x37
[   58.714834]  vidtv_psi_desc_assign+0x50/0x80 [dvb_vidtv_bridge]
[   58.714840]  vidtv_channel_si_init+0x1d0/0x5d0 [dvb_vidtv_bridge]
[   58.714848]  vidtv_mux_init+0x1c0/0x660 [dvb_vidtv_bridge]
[   58.714855]  ? vidtv_mux_stop_thread+0xa0/0xa0 [dvb_vidtv_bridge]
[   58.714861]  ? vidtv_bridge_probe_tuner.constprop.0+0x230/0x230 [dvb_vidtv_bridge]
[   58.714864]  ? mutex_lock+0x89/0xd0
[   58.714870]  vidtv_start_feed+0x26a/0x400 [dvb_vidtv_bridge]
[   58.714876]  ? vidtv_bridge_probe_tuner.constprop.0+0x230/0x230 [dvb_vidtv_bridge]
[   58.714881]  ? vidtv_stop_feed+0x230/0x230 [dvb_vidtv_bridge]
[   58.714887]  ? vidtv_bridge_probe_tuner.constprop.0+0x230/0x230 [dvb_vidtv_bridge]
[   58.714890]  ? __mutex_lock_interruptible_slowpath+0x10/0x10
[   58.714894]  dmx_section_feed_start_filtering+0x194/0x260
[   58.714899]  dvb_dmxdev_filter_start+0x33b/0x570
[   58.714902]  dvb_demux_do_ioctl+0x6c3/0x871
[   58.714906]  dvb_usercopy+0x92/0x1d0
[   58.714909]  ? dvb_dmxdev_filter_start+0x570/0x570
[   58.714912]  ? dvb_remove_device+0xc0/0xc0
[   58.714916]  ? vfs_write+0x152/0x2c0
[   58.714919]  dvb_demux_ioctl+0xc/0x10
[   58.714923]  ksys_ioctl+0x95/0xd0
[   58.714926]  __x64_sys_ioctl+0x38/0x40
[   58.714938]  do_syscall_64+0x3e/0x70
[   58.714941]  entry_SYSCALL_64_after_hwframe+0x44/0xa9
[   58.714944] RIP: 0033:0x7fac76fa45d7
[   58.714948] Code: b3 66 90 48 8b 05 b1 48 2d 00 64 c7 00 26 00 00 00
48 c7 c0 ff ff ff ff c3 66 2e 0f 1f 84 00 00 00 00 00 b8 10 00 00 00 0f
05 <48> 3d 01 f0 ff ff 73 01 c3 48 8b 0d 81 48 2d 00 f7 d8 64 89 01 48
[   58.714949] RSP: 002b:00007ffe76a24658 EFLAGS: 00000246 ORIG_RAX: 0000000000000010
[   58.714952] RAX: ffffffffffffffda RBX: 0000000000000001 RCX: 00007fac76fa45d7
[   58.714954] RDX: 00007ffe76a24690 RSI: 00000000403c6f2b RDI: 0000000000000004
[   58.714955] RBP: 55e63b88c230e77f R08: 0000000f5fa13c98 R09: 00007ffe76a51090
[   58.714957] R10: 000000000001098e R11: 0000000000000246 R12: 00007ffe76a24690
[   58.714959] R13: 0000000000000004 R14: 00007ffe76a24680 R15: 0000000000000001
[   58.714960] ================================================================================
[   58.714963] ================================================================================
[   58.714966] UBSAN: misaligned-access in drivers/media/test-drivers/vidtv/vidtv_psi.c:324:6
[   58.714969] store to misaligned address 00000000214867d8 for type
'struct vidtv_psi_desc *'
[   58.714971] which requires 8 byte alignment
[   58.714974] CPU: 4 PID: 1316 Comm: dvbv5-scan Not tainted 5.8.0-rc6+ #12
[   58.714975] Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS
?-20200516_175120-felixonmars2 04/01/2014
[   58.714976] Call Trace:
[   58.714980]  dump_stack+0x7d/0xb0
[   58.714982]  ubsan_epilogue+0x5/0x40
[   58.714986]  ubsan_type_mismatch_common.cold+0x47/0xcd
[   58.714989]  __ubsan_handle_type_mismatch_v1+0x32/0x37
[   58.714995]  vidtv_psi_desc_assign+0x61/0x80 [dvb_vidtv_bridge]
[   58.715001]  vidtv_channel_si_init+0x1d0/0x5d0 [dvb_vidtv_bridge]
[   58.715007]  vidtv_mux_init+0x1c0/0x660 [dvb_vidtv_bridge]
[   58.715013]  ? vidtv_mux_stop_thread+0xa0/0xa0 [dvb_vidtv_bridge]
[   58.715018]  ? vidtv_bridge_probe_tuner.constprop.0+0x230/0x230 [dvb_vidtv_bridge]
[   58.715021]  ? mutex_lock+0x89/0xd0
[   58.715027]  vidtv_start_feed+0x26a/0x400 [dvb_vidtv_bridge]
[   58.715032]  ? vidtv_bridge_probe_tuner.constprop.0+0x230/0x230 [dvb_vidtv_bridge]
[   58.715038]  ? vidtv_stop_feed+0x230/0x230 [dvb_vidtv_bridge]
[   58.715043]  ? vidtv_bridge_probe_tuner.constprop.0+0x230/0x230 [dvb_vidtv_bridge]
[   58.715046]  ? __mutex_lock_interruptible_slowpath+0x10/0x10
[   58.715049]  dmx_section_feed_start_filtering+0x194/0x260
[   58.715053]  dvb_dmxdev_filter_start+0x33b/0x570
[   58.715057]  dvb_demux_do_ioctl+0x6c3/0x871
[   58.715060]  dvb_usercopy+0x92/0x1d0
[   58.715063]  ? dvb_dmxdev_filter_start+0x570/0x570
[   58.715066]  ? dvb_remove_device+0xc0/0xc0
[   58.715069]  ? vfs_write+0x152/0x2c0
[   58.715072]  dvb_demux_ioctl+0xc/0x10
[   58.715075]  ksys_ioctl+0x95/0xd0
[   58.715078]  __x64_sys_ioctl+0x38/0x40
[   58.715081]  do_syscall_64+0x3e/0x70
[   58.715087]  entry_SYSCALL_64_after_hwframe+0x44/0xa9
[   58.715090] RIP: 0033:0x7fac76fa45d7
[   58.715093] Code: b3 66 90 48 8b 05 b1 48 2d 00 64 c7 00 26 00 00 00
48 c7 c0 ff ff ff ff c3 66 2e 0f 1f 84 00 00 00 00 00 b8 10 00 00 00 0f
05 <48> 3d 01 f0 ff ff 73 01 c3 48 8b 0d 81 48 2d 00 f7 d8 64 89 01 48
[   58.715094] RSP: 002b:00007ffe76a24658 EFLAGS: 00000246 ORIG_RAX: 0000000000000010
[   58.715097] RAX: ffffffffffffffda RBX: 0000000000000001 RCX: 00007fac76fa45d7
[   58.715098] RDX: 00007ffe76a24690 RSI: 00000000403c6f2b RDI: 0000000000000004
[   58.715100] RBP: 55e63b88c230e77f R08: 0000000f5fa13c98 R09: 00007ffe76a51090
[   58.715101] R10: 000000000001098e R11: 0000000000000246 R12: 00007ffe76a24690
[   58.715103] R13: 0000000000000004 R14: 00007ffe76a24680 R15: 0000000000000001
[   58.715105] ================================================================================
[   58.715292] ================================================================================
[   58.715295] UBSAN: misaligned-access in drivers/media/test-drivers/vidtv/vidtv_psi.c:321:6
[   58.715298] load of misaligned address 00000000f5ef6dd7 for type
'struct vidtv_psi_desc *'
[   58.715300] which requires 8 byte alignment
[   58.715303] CPU: 4 PID: 1316 Comm: dvbv5-scan Not tainted 5.8.0-rc6+ #12
[   58.715305] Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS
?-20200516_175120-felixonmars2 04/01/2014
[   58.715305] Call Trace:
[   58.715309]  dump_stack+0x7d/0xb0
[   58.715312]  ubsan_epilogue+0x5/0x40
[   58.715315]  ubsan_type_mismatch_common.cold+0x47/0xcd
[   58.715318]  __ubsan_handle_type_mismatch_v1+0x32/0x37
[   58.715324]  vidtv_pmt_desc_assign+0x5e/0x90 [dvb_vidtv_bridge]
[   58.715330]  vidtv_channels_add_registration_descs+0x1c5/0x2b0 [dvb_vidtv_bridge]
[   58.715336]  vidtv_mux_init+0x4eb/0x660 [dvb_vidtv_bridge]
[   58.715342]  ? vidtv_mux_stop_thread+0xa0/0xa0 [dvb_vidtv_bridge]
[   58.715348]  ? vidtv_bridge_probe_tuner.constprop.0+0x230/0x230 [dvb_vidtv_bridge]
[   58.715350]  ? mutex_lock+0x89/0xd0
[   58.715356]  vidtv_start_feed+0x26a/0x400 [dvb_vidtv_bridge]
[   58.715362]  ? vidtv_bridge_probe_tuner.constprop.0+0x230/0x230 [dvb_vidtv_bridge]
[   58.715367]  ? vidtv_stop_feed+0x230/0x230 [dvb_vidtv_bridge]
[   58.715373]  ? vidtv_bridge_probe_tuner.constprop.0+0x230/0x230 [dvb_vidtv_bridge]
[   58.715376]  ? __mutex_lock_interruptible_slowpath+0x10/0x10
[   58.715378]  dmx_section_feed_start_filtering+0x194/0x260
[   58.715382]  dvb_dmxdev_filter_start+0x33b/0x570
[   58.715386]  dvb_demux_do_ioctl+0x6c3/0x871
[   58.715389]  dvb_usercopy+0x92/0x1d0
[   58.715392]  ? dvb_dmxdev_filter_start+0x570/0x570
[   58.715395]  ? dvb_remove_device+0xc0/0xc0
[   58.715398]  ? vfs_write+0x152/0x2c0
[   58.715402]  dvb_demux_ioctl+0xc/0x10
[   58.715404]  ksys_ioctl+0x95/0xd0
[   58.715407]  __x64_sys_ioctl+0x38/0x40
[   58.715410]  do_syscall_64+0x3e/0x70
[   58.715413]  entry_SYSCALL_64_after_hwframe+0x44/0xa9
[   58.715415] RIP: 0033:0x7fac76fa45d7
[   58.715418] Code: b3 66 90 48 8b 05 b1 48 2d 00 64 c7 00 26 00 00 00
48 c7 c0 ff ff ff ff c3 66 2e 0f 1f 84 00 00 00 00 00 b8 10 00 00 00 0f
05 <48> 3d 01 f0 ff ff 73 01 c3 48 8b 0d 81 48 2d 00 f7 d8 64 89 01 48
[   58.715419] RSP: 002b:00007ffe76a24658 EFLAGS: 00000246 ORIG_RAX: 0000000000000010
[   58.715422] RAX: ffffffffffffffda RBX: 0000000000000001 RCX: 00007fac76fa45d7
[   58.715423] RDX: 00007ffe76a24690 RSI: 00000000403c6f2b RDI: 0000000000000004
[   58.715425] RBP: 55e63b88c230e77f R08: 0000000f5fa13c98 R09: 00007ffe76a51090
[   58.715426] R10: 000000000001098e R11: 0000000000000246 R12: 00007ffe76a24690
[   58.715428] R13: 0000000000000004 R14: 00007ffe76a24680 R15: 0000000000000001
[   58.715429] ================================================================================
[   58.715432] ================================================================================
[   58.715434] UBSAN: misaligned-access in drivers/media/test-drivers/vidtv/vidtv_psi.c:324:6
[   58.715440] store to misaligned address 00000000f5ef6dd7 for type
'struct vidtv_psi_desc *'
[   58.715443] which requires 8 byte alignment
[   58.715446] CPU: 4 PID: 1316 Comm: dvbv5-scan Not tainted 5.8.0-rc6+ #12
[   58.715447] Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS
?-20200516_175120-felixonmars2 04/01/2014
[   58.715448] Call Trace:
[   58.715451]  dump_stack+0x7d/0xb0
[   58.715454]  ubsan_epilogue+0x5/0x40
[   58.715457]  ubsan_type_mismatch_common.cold+0x47/0xcd
[   58.715460]  __ubsan_handle_type_mismatch_v1+0x32/0x37
[   58.715466]  vidtv_pmt_desc_assign+0x6f/0x90 [dvb_vidtv_bridge]
[   58.715473]  vidtv_channels_add_registration_descs+0x1c5/0x2b0 [dvb_vidtv_bridge]
[   58.715479]  vidtv_mux_init+0x4eb/0x660 [dvb_vidtv_bridge]
[   58.715485]  ? vidtv_mux_stop_thread+0xa0/0xa0 [dvb_vidtv_bridge]
[   58.715490]  ? vidtv_bridge_probe_tuner.constprop.0+0x230/0x230 [dvb_vidtv_bridge]
[   58.715493]  ? mutex_lock+0x89/0xd0
[   58.715498]  vidtv_start_feed+0x26a/0x400 [dvb_vidtv_bridge]
[   58.715504]  ? vidtv_bridge_probe_tuner.constprop.0+0x230/0x230 [dvb_vidtv_bridge]
[   58.715510]  ? vidtv_stop_feed+0x230/0x230 [dvb_vidtv_bridge]
[   58.715515]  ? vidtv_bridge_probe_tuner.constprop.0+0x230/0x230 [dvb_vidtv_bridge]
[   58.715518]  ? __mutex_lock_interruptible_slowpath+0x10/0x10
[   58.715521]  dmx_section_feed_start_filtering+0x194/0x260
[   58.715525]  dvb_dmxdev_filter_start+0x33b/0x570
[   58.715528]  dvb_demux_do_ioctl+0x6c3/0x871
[   58.715532]  dvb_usercopy+0x92/0x1d0
[   58.715535]  ? dvb_dmxdev_filter_start+0x570/0x570
[   58.715538]  ? dvb_remove_device+0xc0/0xc0
[   58.715541]  ? vfs_write+0x152/0x2c0
[   58.715544]  dvb_demux_ioctl+0xc/0x10
[   58.715547]  ksys_ioctl+0x95/0xd0
[   58.715550]  __x64_sys_ioctl+0x38/0x40
[   58.715553]  do_syscall_64+0x3e/0x70
[   58.715556]  entry_SYSCALL_64_after_hwframe+0x44/0xa9
[   58.715558] RIP: 0033:0x7fac76fa45d7
[   58.715560] Code: b3 66 90 48 8b 05 b1 48 2d 00 64 c7 00 26 00 00 00
48 c7 c0 ff ff ff ff c3 66 2e 0f 1f 84 00 00 00 00 00 b8 10 00 00 00 0f
05 <48> 3d 01 f0 ff ff 73 01 c3 48 8b 0d 81 48 2d 00 f7 d8 64 89 01 48
[   58.715562] RSP: 002b:00007ffe76a24658 EFLAGS: 00000246 ORIG_RAX: 0000000000000010
[   58.715564] RAX: ffffffffffffffda RBX: 0000000000000001 RCX: 00007fac76fa45d7
[   58.715565] RDX: 00007ffe76a24690 RSI: 00000000403c6f2b RDI: 0000000000000004
[   58.715567] RBP: 55e63b88c230e77f R08: 0000000f5fa13c98 R09: 00007ffe76a51090
[   58.715569] R10: 000000000001098e R11: 0000000000000246 R12: 00007ffe76a24690
[   58.715570] R13: 0000000000000004 R14: 00007ffe76a24680 R15: 0000000000000001
[   58.715572] ================================================================================
[   58.715580] dvb_vidtv_bridge:vidtv_start_streaming, 170: Started streaming
[   59.715128] ==================================================================
[   59.715149] BUG: KASAN: use-after-free in
vidtv_mux_destroy+0x15c/0x356 [dvb_vidtv_bridge]
[   59.715156] Read of size 8 at addr ffff88806bcd4888 by task dvbv5-scan/1316
[   59.715165] CPU: 4 PID: 1316 Comm: dvbv5-scan Not tainted 5.8.0-rc6+ #12
[   59.715168] Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS
?-20200516_175120-felixonmars2 04/01/2014
[   59.715170] Call Trace:
[   59.715178]  dump_stack+0x7d/0xb0
[   59.715196]  print_address_description.constprop.0+0x1a/0x210
[   59.715202]  ? _raw_spin_lock_irqsave+0x7b/0xd0
[   59.715207]  ? _raw_write_lock_irqsave+0xd0/0xd0
[   59.715211]  ? rcu_segcblist_enqueue+0x56/0x70
[   59.715219]  ? vidtv_mux_destroy+0x15c/0x356 [dvb_vidtv_bridge]
[   59.715222]  kasan_report.cold+0x37/0x7c
[   59.715229]  ? vidtv_mux_destroy+0x15c/0x356 [dvb_vidtv_bridge]
[   59.715236]  vidtv_mux_destroy+0x15c/0x356 [dvb_vidtv_bridge]
[   59.715242]  ? detach_if_pending+0x160/0x160
[   59.715251]  vidtv_stop_feed+0x112/0x230 [dvb_vidtv_bridge]
[   59.715257]  dmx_section_feed_stop_filtering+0x54/0xc0
[   59.715270]  dvb_dmxdev_filter_stop.part.0+0x10b/0x170
[   59.715276]  dvb_demux_do_ioctl+0x285/0x871
[   59.715282]  dvb_usercopy+0x92/0x1d0
[   59.715288]  ? dvb_remove_device+0xc0/0xc0
[   59.715292]  ? tty_write+0x2fe/0x430
[   59.715296]  ? vfs_write+0x152/0x2c0
[   59.715300]  dvb_demux_ioctl+0xc/0x10
[   59.715304]  ksys_ioctl+0x95/0xd0
[   59.715307]  __x64_sys_ioctl+0x38/0x40
[   59.715310]  do_syscall_64+0x3e/0x70
[   59.715313]  entry_SYSCALL_64_after_hwframe+0x44/0xa9
[   59.715316] RIP: 0033:0x7fac76fa45d7
[   59.715320] Code: b3 66 90 48 8b 05 b1 48 2d 00 64 c7 00 26 00 00 00
48 c7 c0 ff ff ff ff c3 66 2e 0f 1f 84 00 00 00 00 00 b8 10 00 00 00 0f
05 <48> 3d 01 f0 ff ff 73 01 c3 48 8b 0d 81 48 2d 00 f7 d8 64 89 01 48
[   59.715322] RSP: 002b:00007ffe76a246d8 EFLAGS: 00000246 ORIG_RAX: 0000000000000010
[   59.715325] RAX: ffffffffffffffda RBX: 55e63b88c230e77f RCX: 00007fac76fa45d7
[   59.715326] RDX: 0000000000010d3e RSI: 0000000000006f2a RDI: 0000000000000004
[   59.715328] RBP: 0000000000000004 R08: 0000000fa11c7fc7 R09: 00007ffe76a51090
[   59.715330] R10: 0000000000010d3e R11: 0000000000000246 R12: 00007ffe76a246f0
[   59.715331] R13: 0000000000000010 R14: 0000000000000004 R15: 0000000000000001
[   59.715336] Allocated by task 1316:
[   59.715340]  save_stack+0x1b/0x40
[   59.715343]  __kasan_kmalloc.constprop.0+0xc2/0xd0
[   59.715349]  vidtv_mux_create_pid_ctx_once.part.0+0x31/0x190 [dvb_vidtv_bridge]
[   59.715354]  vidtv_mux_init+0x55c/0x660 [dvb_vidtv_bridge]
[   59.715359]  vidtv_start_feed+0x26a/0x400 [dvb_vidtv_bridge]
[   59.715361]  dmx_section_feed_start_filtering+0x194/0x260
[   59.715364]  dvb_dmxdev_filter_start+0x33b/0x570
[   59.715367]  dvb_demux_do_ioctl+0x6c3/0x871
[   59.715369]  dvb_usercopy+0x92/0x1d0
[   59.715372]  dvb_demux_ioctl+0xc/0x10
[   59.715374]  ksys_ioctl+0x95/0xd0
[   59.715377]  __x64_sys_ioctl+0x38/0x40
[   59.715379]  do_syscall_64+0x3e/0x70
[   59.715382]  entry_SYSCALL_64_after_hwframe+0x44/0xa9
[   59.715384] Freed by task 1316:
[   59.715388]  save_stack+0x1b/0x40
[   59.715390]  __kasan_slab_free+0x12d/0x170
[   59.715393]  kfree+0x9f/0x240
[   59.715398]  vidtv_mux_destroy+0x14b/0x356 [dvb_vidtv_bridge]
[   59.715403]  vidtv_stop_feed+0x112/0x230 [dvb_vidtv_bridge]
[   59.715405]  dmx_section_feed_stop_filtering+0x54/0xc0
[   59.715408]  dvb_dmxdev_filter_stop.part.0+0x10b/0x170
[   59.715411]  dvb_demux_do_ioctl+0x285/0x871
[   59.715413]  dvb_usercopy+0x92/0x1d0
[   59.715416]  dvb_demux_ioctl+0xc/0x10
[   59.715418]  ksys_ioctl+0x95/0xd0
[   59.715421]  __x64_sys_ioctl+0x38/0x40
[   59.715423]  do_syscall_64+0x3e/0x70
[   59.715426]  entry_SYSCALL_64_after_hwframe+0x44/0xa9
[   59.715429] The buggy address belongs to the object at ffff88806bcd4880
[   59.715429]  which belongs to the cache kmalloc-32 of size 32
[   59.715433] The buggy address is located 8 bytes inside of
[   59.715433]  32-byte region [ffff88806bcd4880, ffff88806bcd48a0)
[   59.715435] The buggy address belongs to the page:
[   59.715439] page:ffffea0001af3500 refcount:1 mapcount:0
mapping:0000000000000000 index:0x0
[   59.715446] flags: 0x100000000000200(slab)
[   59.715451] raw: 0100000000000200 0000000000000000 0000000100000001 ffff88806cc03a40
[   59.715454] raw: 0000000000000000 0000000080400040 00000001ffffffff 0000000000000000
[   59.715455] page dumped because: kasan: bad access detected
[   59.715457] Memory state around the buggy address:
[   59.715461]  ffff88806bcd4780: fb fb fb fb fc fc fc fc 00 00 00 fc fc
fc fc fc
[   59.715464]  ffff88806bcd4800: 00 00 00 fc fc fc fc fc 00 00 00 fc fc
fc fc fc
[   59.715467] >ffff88806bcd4880: fb fb fb fb fc fc fc fc fb fb fb fb fc
fc fc fc
[   59.715469]                       ^
[   59.715472]  ffff88806bcd4900: 00 00 00 fc fc fc fc fc 00 00 00 fc fc
fc fc fc
[   59.715475]  ffff88806bcd4980: 00 00 05 fc fc fc fc fc 00 00 00 04 fc
fc fc fc
[   59.715477] ==================================================================
[   59.715482] Disabling lock debugging due to kernel taint
[   59.715661] dvb_vidtv_bridge:vidtv_stop_streaming, 181: Stopped streaming

--thanks
- Daniel

