Return-Path: <linux-media+bounces-47718-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id A794BC8713C
	for <lists+linux-media@lfdr.de>; Tue, 25 Nov 2025 21:38:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id ECF8B4E6F1E
	for <lists+linux-media@lfdr.de>; Tue, 25 Nov 2025 20:38:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6A8CB2BEC31;
	Tue, 25 Nov 2025 20:38:05 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-il1-f200.google.com (mail-il1-f200.google.com [209.85.166.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56E6E21D585
	for <linux-media@vger.kernel.org>; Tue, 25 Nov 2025 20:38:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764103085; cv=none; b=sZ+9eoQItoEqLFCWuRF/74mvU/1F++Xwtbni8hJRHXvAZe4CBEw46e571XWiK7xTpjuVK68YdMkAHy7+BF7L+Qj7SSEYtVIZexwejU30hx/+fMtTMaNqFqMzwa3sgt9KQCNbvBAvI40/gzkvAw5YIsi66lWv66Fdu8cUsReMT4Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764103085; c=relaxed/simple;
	bh=AFbRpZO1suv6bVXKm5Il/XZfwW3nSkkzcQ0+YvFrMi8=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=bPIT/XxaGgfeKKemFA3JraWYZ4E1B4H2V92I5MxLGCKy/haGnWsuAiEPH5ndMWBfWykE3K2aUFhQVBM3Dwf9iAsw56/cYfUKX6m43qzvp8pzhV0bRfblsSE2ARF44k62T7MHw2Vl//PDXdvV8i1KhTy7n7lj2C5QHF24LkrHdb4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f200.google.com with SMTP id e9e14a558f8ab-43323ffc26bso40592835ab.0
        for <linux-media@vger.kernel.org>; Tue, 25 Nov 2025 12:38:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764103082; x=1764707882;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=08SYpejLFHg2uz2zEN10PasPgWYOD+iZSRnDu7wkvjg=;
        b=ASMm56I+d3Lp4Aat/ok2EXNOIOXd7lerfPRXM7eJATA4Petnm6I8lr8nsACWgBYBs7
         eiZiVQRRnGo5s2KigHn+WjDydq6aMdAkjYR+kZYu60mLOUu3LE/wknKE/mlVY4ZqTibo
         eCOUItob8Ju2T1IIya2A2TFPvdi5LhEXdzxzE+WaVR9CPa7GxLekmRgc+jW/dtT8OPGb
         By5hjVuiexxesStO3y/EfxGi5xnJYHiJLEQ+e7j8LyQFEmYjJ92jgRRNg4Fafac9w/T9
         Qr2Z6kxT+nSQWrZ5R0IFBTGTnRsoLHEXymrpNMAue7VF0J0z0zro4CBj9/cmv82uDBYM
         21Ww==
X-Forwarded-Encrypted: i=1; AJvYcCWnXTSUpozCmAGqaVJpv1CvGhj6rZIrS4pbb/tVUFAgiRU+ty2Ryicn3CVyscVgWnipJzqXioJQZcc9dQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzcdEqtcC88SbBFzeudq49qI63RrsnVrAuMX8W9cZ6oOlU+gS5y
	XR0ftXslOcn4uxFv0MzEIWGX58GtbgK2GmwwiqZbn7KZ/A9vrsviO7vAELXyxoGrWFk2Iz9r29l
	RLVvg/I4TB5lag7mUG95Xr0by9jITSaOHSojfzcG+5B+GPQuf46tcYsE7vu0=
X-Google-Smtp-Source: AGHT+IE6FH5F1BLYscMkT4yaGIK21hVKewkg/yaWe0LmXI9lcEnoOUn8NnMt8IBLYpbMFgndlwWCUrcT/7SzSSlALz0pO9Drl+/a
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:3085:b0:434:96ea:ff50 with SMTP id
 e9e14a558f8ab-435b98d7abbmr173328335ab.33.1764103082507; Tue, 25 Nov 2025
 12:38:02 -0800 (PST)
Date: Tue, 25 Nov 2025 12:38:02 -0800
In-Reply-To: <c0152541-a1ff-4eb4-afdd-5335150f29ba@gmail.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <692613aa.a70a0220.d98e3.00bd.GAE@google.com>
Subject: Re: [syzbot] [media?] [usb?] memory leak in v4l2_ctrl_handler_init_class
 (2)
From: syzbot <syzbot+a41b73dce23962a74c72@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	linux-usb@vger.kernel.org, ssranevjti@gmail.com, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch but the reproducer is still triggering an issue:
memory leak in v4l2_ctrl_handler_init_class

BUG: memory leak
unreferenced object 0xffff88812b84cfc0 (size 8):
  comm "kworker/0:7", pid 6710, jiffies 4294946048
  hex dump (first 8 bytes):
    40 fc ec 19 81 88 ff ff                          @.......
  backtrace (crc 82d035d3):
    kmemleak_alloc_recursive include/linux/kmemleak.h:44 [inline]
    slab_post_alloc_hook mm/slub.c:4983 [inline]
    slab_alloc_node mm/slub.c:5288 [inline]
    __do_kmalloc_node mm/slub.c:5649 [inline]
    __kvmalloc_node_noprof+0x51c/0x820 mm/slub.c:7112
    kvmalloc_array_node_noprof include/linux/slab.h:1122 [inline]
    v4l2_ctrl_handler_init_class+0x67/0x90 drivers/media/v4l2-core/v4l2-ctrls-core.c:1625
    usb_keene_probe+0xc4/0x450 drivers/media/radio/radio-keene.c:326
    usb_probe_interface+0x173/0x3f0 drivers/usb/core/driver.c:396
    call_driver_probe drivers/base/dd.c:581 [inline]
    really_probe+0x12f/0x430 drivers/base/dd.c:659
    __driver_probe_device+0xc3/0x1a0 drivers/base/dd.c:801
    driver_probe_device+0x2a/0x120 drivers/base/dd.c:831
    __device_attach_driver+0x10f/0x170 drivers/base/dd.c:959
    bus_for_each_drv+0xcf/0x120 drivers/base/bus.c:462
    __device_attach+0xf9/0x290 drivers/base/dd.c:1031
    bus_probe_device+0xcd/0xe0 drivers/base/bus.c:537
    device_add+0x983/0xc80 drivers/base/core.c:3689
    usb_set_configuration+0x961/0xc70 drivers/usb/core/message.c:2210
    usb_generic_driver_probe+0x83/0xd0 drivers/usb/core/generic.c:250
    usb_probe_device+0x7c/0x1d0 drivers/usb/core/driver.c:291
    call_driver_probe drivers/base/dd.c:581 [inline]
    really_probe+0x12f/0x430 drivers/base/dd.c:659

BUG: memory leak
unreferenced object 0xffff888119edee00 (size 256):
  comm "kworker/0:7", pid 6710, jiffies 4294946048
  hex dump (first 32 bytes):
    00 a0 ef 19 81 88 ff ff 00 ef ed 19 81 88 ff ff  ................
    10 ee ed 19 81 88 ff ff 10 ee ed 19 81 88 ff ff  ................
  backtrace (crc 3c002570):
    kmemleak_alloc_recursive include/linux/kmemleak.h:44 [inline]
    slab_post_alloc_hook mm/slub.c:4983 [inline]
    slab_alloc_node mm/slub.c:5288 [inline]
    __do_kmalloc_node mm/slub.c:5649 [inline]
    __kvmalloc_node_noprof+0x51c/0x820 mm/slub.c:7112
    v4l2_ctrl_new+0x2bf/0x1340 drivers/media/v4l2-core/v4l2-ctrls-core.c:2031
    v4l2_ctrl_new_std+0x122/0x180 drivers/media/v4l2-core/v4l2-ctrls-core.c:2185
    usb_keene_probe+0xe8/0x450 drivers/media/radio/radio-keene.c:327
    usb_probe_interface+0x173/0x3f0 drivers/usb/core/driver.c:396
    call_driver_probe drivers/base/dd.c:581 [inline]
    really_probe+0x12f/0x430 drivers/base/dd.c:659
    __driver_probe_device+0xc3/0x1a0 drivers/base/dd.c:801
    driver_probe_device+0x2a/0x120 drivers/base/dd.c:831
    __device_attach_driver+0x10f/0x170 drivers/base/dd.c:959
    bus_for_each_drv+0xcf/0x120 drivers/base/bus.c:462
    __device_attach+0xf9/0x290 drivers/base/dd.c:1031
    bus_probe_device+0xcd/0xe0 drivers/base/bus.c:537
    device_add+0x983/0xc80 drivers/base/core.c:3689
    usb_set_configuration+0x961/0xc70 drivers/usb/core/message.c:2210
    usb_generic_driver_probe+0x83/0xd0 drivers/usb/core/generic.c:250
    usb_probe_device+0x7c/0x1d0 drivers/usb/core/driver.c:291

BUG: memory leak
unreferenced object 0xffff888119edef00 (size 256):
  comm "kworker/0:7", pid 6710, jiffies 4294946048
  hex dump (first 32 bytes):
    00 ee ed 19 81 88 ff ff 30 fd 58 26 81 88 ff ff  ........0.X&....
    10 ef ed 19 81 88 ff ff 10 ef ed 19 81 88 ff ff  ................
  backtrace (crc 61944fdf):
    kmemleak_alloc_recursive include/linux/kmemleak.h:44 [inline]
    slab_post_alloc_hook mm/slub.c:4983 [inline]
    slab_alloc_node mm/slub.c:5288 [inline]
    __do_kmalloc_node mm/slub.c:5649 [inline]
    __kvmalloc_node_noprof+0x51c/0x820 mm/slub.c:7112
    v4l2_ctrl_new+0x2bf/0x1340 drivers/media/v4l2-core/v4l2-ctrls-core.c:2031
    v4l2_ctrl_new_std+0x122/0x180 drivers/media/v4l2-core/v4l2-ctrls-core.c:2185
    handler_new_ref+0x352/0x450 drivers/media/v4l2-core/v4l2-ctrls-core.c:1772
    v4l2_ctrl_new+0x67d/0x1340 drivers/media/v4l2-core/v4l2-ctrls-core.c:2114
    v4l2_ctrl_new_std+0x122/0x180 drivers/media/v4l2-core/v4l2-ctrls-core.c:2185
    usb_keene_probe+0xe8/0x450 drivers/media/radio/radio-keene.c:327
    usb_probe_interface+0x173/0x3f0 drivers/usb/core/driver.c:396
    call_driver_probe drivers/base/dd.c:581 [inline]
    really_probe+0x12f/0x430 drivers/base/dd.c:659
    __driver_probe_device+0xc3/0x1a0 drivers/base/dd.c:801
    driver_probe_device+0x2a/0x120 drivers/base/dd.c:831
    __device_attach_driver+0x10f/0x170 drivers/base/dd.c:959
    bus_for_each_drv+0xcf/0x120 drivers/base/bus.c:462
    __device_attach+0xf9/0x290 drivers/base/dd.c:1031
    bus_probe_device+0xcd/0xe0 drivers/base/bus.c:537
    device_add+0x983/0xc80 drivers/base/core.c:3689

BUG: memory leak
unreferenced object 0xffff888119ecfb40 (size 64):
  comm "kworker/0:7", pid 6710, jiffies 4294946048
  hex dump (first 32 bytes):
    80 fb ec 19 81 88 ff ff 40 fd 58 26 81 88 ff ff  ........@.X&....
    00 00 00 00 00 00 00 00 00 ef ed 19 81 88 ff ff  ................
  backtrace (crc 96c5954f):
    kmemleak_alloc_recursive include/linux/kmemleak.h:44 [inline]
    slab_post_alloc_hook mm/slub.c:4983 [inline]
    slab_alloc_node mm/slub.c:5288 [inline]
    __do_kmalloc_node mm/slub.c:5649 [inline]
    __kmalloc_noprof+0x3e3/0x6b0 mm/slub.c:5662
    kmalloc_noprof include/linux/slab.h:961 [inline]
    kzalloc_noprof include/linux/slab.h:1094 [inline]
    handler_new_ref+0xd7/0x450 drivers/media/v4l2-core/v4l2-ctrls-core.c:1780
    v4l2_ctrl_new+0x67d/0x1340 drivers/media/v4l2-core/v4l2-ctrls-core.c:2114
    v4l2_ctrl_new_std+0x122/0x180 drivers/media/v4l2-core/v4l2-ctrls-core.c:2185
    handler_new_ref+0x352/0x450 drivers/media/v4l2-core/v4l2-ctrls-core.c:1772
    v4l2_ctrl_new+0x67d/0x1340 drivers/media/v4l2-core/v4l2-ctrls-core.c:2114
    v4l2_ctrl_new_std+0x122/0x180 drivers/media/v4l2-core/v4l2-ctrls-core.c:2185
    usb_keene_probe+0xe8/0x450 drivers/media/radio/radio-keene.c:327
    usb_probe_interface+0x173/0x3f0 drivers/usb/core/driver.c:396
    call_driver_probe drivers/base/dd.c:581 [inline]
    really_probe+0x12f/0x430 drivers/base/dd.c:659
    __driver_probe_device+0xc3/0x1a0 drivers/base/dd.c:801
    driver_probe_device+0x2a/0x120 drivers/base/dd.c:831
    __device_attach_driver+0x10f/0x170 drivers/base/dd.c:959
    bus_for_each_drv+0xcf/0x120 drivers/base/bus.c:462
    __device_attach+0xf9/0x290 drivers/base/dd.c:1031
    bus_probe_device+0xcd/0xe0 drivers/base/bus.c:537

BUG: memory leak
unreferenced object 0xffff888119ecfb80 (size 64):
  comm "kworker/0:7", pid 6710, jiffies 4294946048
  hex dump (first 32 bytes):
    00 fb ec 19 81 88 ff ff 40 fb ec 19 81 88 ff ff  ........@.......
    40 fb ec 19 81 88 ff ff 00 ee ed 19 81 88 ff ff  @...............
  backtrace (crc ef37c6b5):
    kmemleak_alloc_recursive include/linux/kmemleak.h:44 [inline]
    slab_post_alloc_hook mm/slub.c:4983 [inline]
    slab_alloc_node mm/slub.c:5288 [inline]
    __do_kmalloc_node mm/slub.c:5649 [inline]
    __kmalloc_noprof+0x3e3/0x6b0 mm/slub.c:5662
    kmalloc_noprof include/linux/slab.h:961 [inline]
    kzalloc_noprof include/linux/slab.h:1094 [inline]
    handler_new_ref+0xd7/0x450 drivers/media/v4l2-core/v4l2-ctrls-core.c:1780
    v4l2_ctrl_new+0x67d/0x1340 drivers/media/v4l2-core/v4l2-ctrls-core.c:2114
    v4l2_ctrl_new_std+0x122/0x180 drivers/media/v4l2-core/v4l2-ctrls-core.c:2185
    usb_keene_probe+0xe8/0x450 drivers/media/radio/radio-keene.c:327
    usb_probe_interface+0x173/0x3f0 drivers/usb/core/driver.c:396
    call_driver_probe drivers/base/dd.c:581 [inline]
    really_probe+0x12f/0x430 drivers/base/dd.c:659
    __driver_probe_device+0xc3/0x1a0 drivers/base/dd.c:801
    driver_probe_device+0x2a/0x120 drivers/base/dd.c:831
    __device_attach_driver+0x10f/0x170 drivers/base/dd.c:959
    bus_for_each_drv+0xcf/0x120 drivers/base/bus.c:462
    __device_attach+0xf9/0x290 drivers/base/dd.c:1031
    bus_probe_device+0xcd/0xe0 drivers/base/bus.c:537
    device_add+0x983/0xc80 drivers/base/core.c:3689
    usb_set_configuration+0x961/0xc70 drivers/usb/core/message.c:2210
    usb_generic_driver_probe+0x83/0xd0 drivers/usb/core/generic.c:250

connection error: failed to recv *flatrpc.ExecutorMessageRawT: EOF


Tested on:

commit:         30f09200 Merge tag 'arm64-fixes' of git://git.kernel.o..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=17c4f8b4580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=f30cc590c4f6da44
dashboard link: https://syzkaller.appspot.com/bug?extid=a41b73dce23962a74c72
compiler:       gcc (Debian 12.2.0-14+deb12u1) 12.2.0, GNU ld (GNU Binutils for Debian) 2.40

Note: no patches were applied.

