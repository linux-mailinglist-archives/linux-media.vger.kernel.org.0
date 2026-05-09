Return-Path: <linux-media+bounces-60991-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SKa2NzLP/mm1wgAAu9opvQ
	(envelope-from <linux-media+bounces-60991-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sat, 09 May 2026 08:07:46 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B32E4FE30A
	for <lists+linux-media@lfdr.de>; Sat, 09 May 2026 08:07:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B1835301952D
	for <lists+linux-media@lfdr.de>; Sat,  9 May 2026 06:07:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D92822C027B;
	Sat,  9 May 2026 06:07:27 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-vk1-f176.google.com (mail-vk1-f176.google.com [209.85.221.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EA121F936
	for <linux-media@vger.kernel.org>; Sat,  9 May 2026 06:07:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778306847; cv=none; b=Q50mddoou9JyiH7M6/+ykCNvRxs8xhrLrP2iBWJZg2lXRP2N98o1e9YXHTpt+CuPz4b5FQDFHd9tqQZ3xvtv6Iew4XG5Xiwk8kqsx35LtG3/17iJLlxTDd7fdQiCcQ8JpwxuiEd/XwrhA0v0I/prVOHH+8SkBLkLjWSHCW0Rit8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778306847; c=relaxed/simple;
	bh=Gn9UmhGa7aN97CmrQIY7PcjPmO1oIdNoOwu5cD3CDL8=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Content-Type; b=u2jz2w1rGfBJr5AZI+cxgx7jA9SQcwWhPlTDApykHM0ocxPvCSj+/0eDSJi6xTmQzlDlyEHyX/bqGZMOXH0IBfAzJPjYiL5LVZ3+z/eaS+aUXHDy0B2aH0ZzGuXqBRPW6UD5EOsQc5ZX3Nek27PuB0IMW7Yn4GiSokaK7kpTXQA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ruehm.land; spf=pass smtp.mailfrom=googlemail.com; arc=none smtp.client-ip=209.85.221.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ruehm.land
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=googlemail.com
Received: by mail-vk1-f176.google.com with SMTP id 71dfb90a1353d-56a9c5cb48bso1008404e0c.0
        for <linux-media@vger.kernel.org>; Fri, 08 May 2026 23:07:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778306845; x=1778911645;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1q0VsQPEiad3FRd5KJS6OwLZ/uB/VHgsTTWAUmLJ0Q0=;
        b=k32F5JtFKrtF0XpChHGFP14kXxggOzxWekbgA5JQaDrRFxUgKB9jiQ+zLPa6ht0Tyi
         bzHZjnTwAXBoBVaSy4ZuJc8+LqVD5mUa9kLBfOAOnBgNNdrASgzdB8Ig80p7qCB9VqDS
         yHG3nt83yJLSNmbz9DxbvXh+M17O1g5v7w7z1gNigStX3R8ymTYzkE58NrF/+teAbmVo
         zT9RUMdKfqa5LcjEO1rSsltkvxXYXL5K1qGhQr4zwuW3MiuRGj16vTpGDOMoJwu8TNiS
         y2TtsvVO5szqxPvyPFfCHXuHyRZ8QXl74O13uwg0JTCMs4foDMHZalfnCwPlOXXNSVJJ
         A14Q==
X-Gm-Message-State: AOJu0YzBY5Qejy4FFxBJrvlCPsx564ld4sE2dC3titjJEtgfw1Oxcbml
	cLxkeLwirFigppJZVYmvlb3eJi22mZnaVZgoUqPkx9CZqNMML5WOf7MIo5b9N0kS
X-Gm-Gg: Acq92OHdKGWxkfvOEtPqZfT/ugktLZeI+A1jjLu/jTCqMuav29yTUhO6yYx8WBIsKiW
	sWhSB4Wqm7mZgt16yvwLBWaSsZ8eO8h71MIxzxzskhsv1QIZYI4ab25VZYbi2eifrKUHNulOJmp
	4y75pAfgKNGBhJQLUhBk7ZSZpYD3LwVirSajR1/rgr/wGQMEfntMjGk+0gcgaV8CNHeywT1jYNd
	HLbShyzM2Ilkca2zAX893Pr7pZAMDeC5dYti1LBi74xafUnhBLhQRwj0V5ob+uiRr7PU14nIoC0
	SrIJoyI1XmITXHVfrBZ3mQL/rwNa5IJlI+W7ki0WB2QR3Cygk7+nTMFtSHiCCikg9h+cZlfovc3
	YYvttoQiWuctwte4PK3mzep4GGCeGaCe4X7NT2vzjDhja34eIUqqKKMmvBonsFL+KwUItaDBHqd
	iENjTKd42fN01qnAD0W5KWBlm+9CfunVAdEUrjaqNXR9JuADkk3iIV/PS/ygl80uDV
X-Received: by 2002:a05:6102:1620:b0:631:2472:e832 with SMTP id ada2fe7eead31-631da131c39mr394845137.8.1778306844960;
        Fri, 08 May 2026 23:07:24 -0700 (PDT)
Received: from mail-vs1-f52.google.com (mail-vs1-f52.google.com. [209.85.217.52])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-6313ffe8ac0sm2319573137.1.2026.05.08.23.07.24
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 08 May 2026 23:07:24 -0700 (PDT)
Received: by mail-vs1-f52.google.com with SMTP id ada2fe7eead31-6314cff521aso378183137.2
        for <linux-media@vger.kernel.org>; Fri, 08 May 2026 23:07:24 -0700 (PDT)
X-Received: by 2002:a05:6102:6c9:b0:631:28c1:155c with SMTP id
 ada2fe7eead31-631da12d5c3mr379350137.7.1778306844495; Fri, 08 May 2026
 23:07:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: =?UTF-8?Q?Emil_R=C3=BChmland?= <emil@ruehm.land>
Date: Sat, 9 May 2026 08:07:13 +0200
X-Gmail-Original-Message-ID: <CABsLJ3r=68DWkgHrQhnoUY6hQdOYbSB8=N7OxJMrdDKYrCGmcw@mail.gmail.com>
X-Gm-Features: AVHnY4JN5SxgW1rg-PdM0UsByOpvicu1vSC338U17O5qjwJKzxKYcV4PNjjoEwg
Message-ID: <CABsLJ3r=68DWkgHrQhnoUY6hQdOYbSB8=N7OxJMrdDKYrCGmcw@mail.gmail.com>
Subject: [BUG] videodev: kernel panic in subdev_close during shutdown with
 IPU6 camera (Alder Lake)
To: linux-media@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Queue-Id: 3B32E4FE30A
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.46 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DMARC_NA(0.00)[ruehm.land];
	TAGGED_FROM(0.00)[bounces-60991-lists,linux-media=lfdr.de];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_ONE(0.00)[1];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[emil@ruehm.land,linux-media@vger.kernel.org];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_NONE(0.00)[];
	R_DKIM_NA(0.00)[];
	NEURAL_HAM(-0.00)[-0.991];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,mail.gmail.com:mid]
X-Rspamd-Action: no action

Reported-by: Emil R=C3=BChmland <emil@ruehm.land>

System shuts down with kernel panic in subdev_close() when WirePlumber
(PipeWire session manager) exits while holding V4L2 subdevice file
descriptors for an Intel IPU6 camera. The initial oops cascades into
NULL pointer dereferences and recursive faults, hanging the machine
and requiring a power button hold. Reproducible on every shutdown when
the camera was used during the session. Confirmed on both 6.10.26 LTS
and 7.0.3 mainline.

Hardware
--------
Lenovo ThinkPad X1 Carbon Gen 10 (21CB009TGE)
BIOS: N3AET82W (1.47) 06/25/2024
IPU6 ISP: Intel Alder Lake Imaging Signal Processor [8086:465d] (rev 04)
Sensor: OV2740 (MIPI CSI-2, via ipu_bridge)

System
------
Arch Linux x86_64
Linux 7.0.3-arch1-2 (gcc 16.1.1, GNU ld 2.46.0) #1 SMP PREEMPT(full)
Also reproduced on: Linux 6.10.26-2-lts

PipeWire 1.6.4, WirePlumber 0.5.14, libcamera 0.7.0
Camera accessed via native PipeWire/WirePlumber libcamera SPA path.

Reproduction
------------
1. Boot system
2. Use IPU6 camera via browser (WebRTC) or any PipeWire camera consumer
3. Close camera application
4. Shut down or reboot

WirePlumber holds /dev/video8 (IPU6 internal V4L2 node) throughout the
session. On shutdown, WirePlumber receives SIGTERM and begins exiting.
The kernel runs subdev_close() in the fd cleanup path, which crashes.

Oops #1 (CameraManager thread, initial crash)
----------------------------------------------
[38330.255927] Oops: Oops: 0011 [#1] SMP NOPTI
[38330.256037] CPU: 7 UID: 1000 PID: 1489 Comm: CameraManager Tainted:
G S                  7.0.3-arch1-2 #1 PREEMPT(full)
[38330.256234] Hardware name: LENOVO 21CB009TGE/21CB009TGE, BIOS
N3AET82W (1.47 ) 06/25/2024
[38330.256353] RIP: 0010:ext4_fast_symlink_inode_operations+0x0/0x100
[38330.256425] Code: 6e 63 72 79 70 74 65 64 5f 67 65 74 5f 6c 69 6e
6b 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 <00> 00 00 00 00 00 00 00 40 d5 5e 8c ff ff ff ff 00 00 00 00
00 00
[38330.256492] RSP: 0018:ffffd4fec6613c88 EFLAGS: 00010282
[38330.256573] RAX: ffffffff8d4bd180 RBX: ffff8f51dfb3f6c0 RCX: 00000000000=
00000
[38330.256648] RDX: 000000000000000d RSI: ffff8f51dfb3f6c0 RDI: ffff8f51e0f=
4c430
[38330.256677] RBP: ffff8f51e718e840 R08: ffff8f51c8e07840 R09: ffff8f51db6=
b1ee8
[38330.256701] R10: ffffd4fec6613cc0 R11: 0000000000000002 R12: ffff8f51db6=
b1ee8
[38330.256720] R13: ffff8f51c315a620 R14: ffff8f51c8e07840 R15: 00000000000=
00000
[38330.256740] FS:  00007f02aab9f6c0(0000) GS:ffff8f5580327000(0000)
knlGS:0000000000000000
[38330.256765] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[38330.256790] CR2: ffffffff8d4bd180 CR3: 000000010556f006 CR4: 0000000000f=
72ef0
[38330.256816] PKRU: 55555554
[38330.256835] Call Trace:
[38330.256872]  <TASK>
[38330.256894]  ? subdev_close+0x3b/0xb0 [videodev]
[38330.256927]  ? v4l2_release+0x92/0xc0 [videodev]
[38330.256953]  ? __fput+0xf6/0x2d0
[38330.256980]  ? __x64_sys_close+0x47/0xa0
[38330.257014]  ? do_syscall_64+0x12b/0x1640
[38330.257042]  ? refill_obj_stock+0x14b/0x280
[38330.257066]  ? __memcg_slab_free_hook+0xf7/0x150
[38330.257085]  ? kmem_cache_free+0x26a/0x420
[38330.257107]  ? task_work_run+0x66/0xa0
[38330.257126]  ? __fput+0x190/0x2d0
[38330.257145]  ? exit_to_user_mode_loop+0xc9/0x640
[38330.257173]  ? do_syscall_64+0x2ae/0x1640
[38330.257203]  ? filp_flush+0x5e/0xa0
[38330.257219]  ? __x64_sys_close+0x47/0xa0
[38330.257238]  ? do_syscall_64+0x12b/0x1640
[38330.257258]  ? irqentry_exit+0x349/0x740
[38330.257278]  ? __irq_exit_rcu+0x4c/0xf0
[38330.257300]  ? entry_SYSCALL_64_after_hwframe+0x76/0x7e
[38330.257321]  </TASK>
[38330.257818] note: CameraManager[1489] exited with irqs disabled

Oops #2 (gmain thread, cascading crash ~90s later)
---------------------------------------------------
[38420.519652] kernel tried to execute NX-protected page - exploit
attempt? (uid: 1000)
[38420.519858] BUG: unable to handle page fault for address: ffffffff8d4b9d=
c0
[38420.522446] #PF: supervisor instruction fetch in kernel mode
[38420.535029] #PF: error_code(0x0011) - permissions violation
[38420.535277] Oops: Oops: 0011 [#2] SMP NOPTI
[38420.535323] CPU: 3 UID: 1000 PID: 1427 Comm: gmain Tainted: G S
D             7.0.3-arch1-2 #1 PREEMPT(full)
[38420.535411] RIP: 0010:ext4_dir_inode_operations+0x0/0x100
[38420.535751] Call Trace:
[38420.535778]  <TASK>
[38420.535802]  ? subdev_close+0x3b/0xb0 [videodev]
[38420.535831]  ? v4l2_release+0x92/0xc0 [videodev]
[38420.535862]  ? __fput+0xf6/0x2d0
[38420.535884]  ? task_work_run+0x66/0xa0
[38420.535920]  ? do_exit+0x2d1/0xba0
[38420.535946]  ? do_group_exit+0x2d/0xc0
[38420.535969]  ? get_signal+0x810/0x8a0
[38420.535993]  ? arch_do_signal_or_restart+0x77/0x2b0
[38420.536028]  ? exit_to_user_mode_loop+0x89/0x640
[38420.536056]  ? do_syscall_64+0x2ae/0x1640
[38420.536466]  </TASK>
[38420.537030] note: gmain[1427] exited with irqs disabled
[38420.537059] Fixing recursive fault but reboot is needed!
[38420.537139] BUG: scheduling while atomic: gmain/1427/0x00000000
[38420.551107] BUG: kernel NULL pointer dereference, address: 0000000000000=
000

Modules linked in (camera-relevant)
------------------------------------
intel_ipu6_isys, intel_ipu6, ipu_bridge, ov2740, videodev,
videobuf2_v4l2, videobuf2_dma_sg, videobuf2_memops, videobuf2_common,
v4l2_fwnode, v4l2_async, mc

Analysis
--------
The RIP in both oops points to ext4 inode_operations, which is clearly
a corrupted function pointer, not an actual ext4 bug. The call trace
shows subdev_close() calling into a corrupted vfunc. The
internal_ops->close callback pointer in the V4L2 subdev appears to
reference freed or corrupted memory during the shutdown teardown.

The first crash (CameraManager, PID 1489) happens during a sys_close
syscall. The second crash (gmain, PID 1427) happens ~90 seconds later
during forced process exit (get_signal -> do_group_exit -> do_exit),
hitting the same corrupted subdev_close path. Both threads exit with
IRQs disabled, leading to "scheduling while atomic" and cascading NULL
pointer dereferences.

Workaround
----------
A systemd user service that runs "modprobe -r intel_ipu6_isys" before
WirePlumber stops during shutdown. This unloads the IPU6 module stack
before the buggy subdev_close teardown path is reached. Confirmed to
produce clean shutdowns with no oops.

Previous kernel (6.10.26 LTS) showed the same crash pattern but with
RIP at subdev_close+0x2a/0xb0 directly (rather than through a
corrupted function pointer), suggesting the corruption may be
kernel-version-dependent but the underlying subdev_close bug is the
same.

