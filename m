Return-Path: <linux-media+bounces-64870-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id ZLhBGz9lL2rO/gQAu9opvQ
	(envelope-from <linux-media+bounces-64870-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 15 Jun 2026 04:36:47 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id E2A30682E63
	for <lists+linux-media@lfdr.de>; Mon, 15 Jun 2026 04:36:46 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=LQGnIL+1;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-64870-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-media+bounces-64870-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 2D5A8300955D
	for <lists+linux-media@lfdr.de>; Mon, 15 Jun 2026 02:36:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F3136259C80;
	Mon, 15 Jun 2026 02:36:38 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com [209.85.222.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 101AD2472B6
	for <linux-media@vger.kernel.org>; Mon, 15 Jun 2026 02:36:36 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781490998; cv=none; b=VhnSgKuZ9EyXmC3lKJb0dFzKyVXo4Z2CEpNSG1lsOjU6R2d3ucK8QeCxaUkvrnftt9Tqx1o7xShpUFuxjeVjjUCgiUvTytfGQi18LGLAhlubOpvzKRXrq/I4U1GJ9I/sEwjXrsD763a7q39KO3O+zYR+r9Dtl2IclXmzzqm+ac8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781490998; c=relaxed/simple;
	bh=3xZXV15nfu/kDl0x+P8csHbIrvDz1ccGEuR1+nsH+Pg=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type; b=I8Dw8Qmz0r0BHEplwc9B6Pivkiko7QoXhcrfZkGim4zhVdzbYonO5dgIlOZlkbJrTror8tJDabu8cFEGSE1heEBU872D65ppu2LdB1PJAxeVYZ3SCmgLj6MheI8QVD9noLbOh3lkqECjL5tMiJo6n01GOnz6YPLBwHbiXqcAt0c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LQGnIL+1; arc=none smtp.client-ip=209.85.222.180
Received: by mail-qk1-f180.google.com with SMTP id af79cd13be357-9158643e538so269214385a.1
        for <linux-media@vger.kernel.org>; Sun, 14 Jun 2026 19:36:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781490996; x=1782095796; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=Mr50aan00YSZlZIxK83jWpHkvDxONUHESMJpth2W5As=;
        b=LQGnIL+1TdklqzLbkyGUvFbvIP7W2o0XwD4eNroKu3XosEKYcxNSi9YsoAHyn2FhUp
         BgCcOjOoqvHNv5JGQdpw/x53o9MMLOCrDNspBwAUaFaPlYSc7XrZ7s7SGgU5Vm4ie0WS
         tyvgODfk0OlVSYBDczHAMwhy8i6aOMb9OqH/QJrji32AbM7MCiB2p6fkbrAjd3axBDf4
         Ye2iA1ewLQ1NObjRQVHGrc9YZTbbbe8QhFeWxQjVN8d9upcAvJIaaTZ8rxJSMJq9WCc0
         v49cu2DOmiXO6AotZdInQCwXXcM3dJ9Y5BFVAB8SxUQv8tnf3xjUolP5p4wiSBoxY3yC
         gS/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781490996; x=1782095796;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Mr50aan00YSZlZIxK83jWpHkvDxONUHESMJpth2W5As=;
        b=R3YPcTNhv5lxvkttpomjQR2MsnlSoyqhIgqZ013MasFAyuvUC0ytjnMJ+34eppwSQv
         q5cj9TRjSqobMmuKMipUXzisUiz8gDcsOcFEW8ULPnpStZyEmfWoD7vmcK2jTBfwbYiL
         T43PmeCfiByIdc9FLJfndlpZ4ySId6SZxnMDNnM8EvcQ3HTGNBi7RrsHLS+AiQBl29i1
         qyibLwM86AfRZgq+EnauaSfIjvOxM/TZ8VTDChXD1hhAqkBpZVrob/u/LMcpwYpu8MAC
         1u0Tlb3gU3LLZOsAKEvUbimCbGUqIZwYi5Q8kCb40XCNg1cBhapTVl/ngw/7imcJOMSi
         rXVw==
X-Forwarded-Encrypted: i=1; AFNElJ+D1Ny7u1+kgKyJQtkgfYoQFI8/+lYVXoux+AY+DpLsoi/yo0EAsuS+hKib/jWcqEpmtMEMfWb5MweBHA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzi3qV5Gfy8bjMV0Jjn2DWrX3C42FwO3oDYaNQCxcxkyjkS5Y0H
	wsgtaxqvrH0HZklOSAHjgjOEEvkUMNNxjod0lIH92u9xbfS96JZWacPpD5oCEsfvuBr6VA==
X-Gm-Gg: Acq92OHUkhxl4nuDaWJUr+gfNflRiRyjwnthG6rv/j5dD2aQgIgfBxC6XRmNRcX19Sb
	WYgcr9PUWhaOUn9z4sJvnCQORqcF8OkvMLCXaZkHVl3gPRWtF+kl+4hPiT0YKaN/iaghQt4qgM8
	8P1iljgsJrzf/VgirLJ/+nRyfG64TkPaRAjGCI8h4wTEbh9/Ah8i7ko/2oaV4loS7kBt/mel6oH
	f2gkZ/QxHNKf58UJjAYm5oUdmyISkCFiRRopn0HRoTYopJkIaMp8Pc0+o0rKGar4qR6/94i1beZ
	lmApOLpBXHU0PKaROUwFLSyUpXI0IzzCY0k6XccZaW1idbpLLRXLogB2OS+dhI/WQmi+bFJrDw4
	Uu8FUEdsq06NiPWC5uZrcOIxCd7awDSgI+XtJr0xRZg0zf35JyOJ435EhbonKyNyQAqBmMefCD1
	vud/ouEt9J2LAUttNuyvSOAxNn2LPL28wxPd+mcUTWkYZ2AZwFcLNsZa/ql6EkIdM0dETFvZ+3l
	0h62y9z
X-Received: by 2002:a05:620a:1791:b0:915:d5d6:f1fa with SMTP id af79cd13be357-9161bd3a595mr1906241285a.31.1781490995970;
        Sun, 14 Jun 2026 19:36:35 -0700 (PDT)
Received: from localhost.localdomain ([2601:985:4601:5df0:2106:6ce9:6b1:8f70])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-91619ed7f16sm947806785a.1.2026.06.14.19.36.35
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 14 Jun 2026 19:36:35 -0700 (PDT)
From: Shuangpeng Bai <shuangpeng.kernel@gmail.com>
To: mchehab@kernel.org,
	kees@kernel.org,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [BUG] media: siano: WARNING in free_large_kmalloc from smsusb_term_device
Date: Sun, 14 Jun 2026 22:36:34 -0400
Message-ID: <178144969601.60470.6468623939816148386@gmail.com>
X-Mailer: git-send-email 2.47.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[shuangpengkernel@gmail.com,linux-media@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-64870-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:mchehab@kernel.org,m:kees@kernel.org,m:linux-media@vger.kernel.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	RCPT_COUNT_THREE(0.00)[4];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[shuangpengkernel@gmail.com,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_NONE(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: E2A30682E63

Hi,

I hit the following report while testing current upstream kernel:

WARNING in free_large_kmalloc from smsusb_term_device

I reproduced this on commit: e8c2f9fdadee7cbc75134dc463c1e0d856d6e5c7 (May 25 2026)

The issue was reproduced with a Siano USB DVB raw gadget.

The reproducer and .config files are here.
https://gist.github.com/shuangpengbai/8e2dbdcbfc6362c50e18028dc5ecb810

I'm happy to test debug patches or provide additional information.

Reported-by: Shuangpeng Bai <shuangpeng.kernel@gmail.com>

[  122.434215][  T776] WARNING: mm/slub.c:6476 at free_large_kmalloc+0x96/0xf0, CPU#0: kworker/0:2/776
[  122.434930][  T776] Modules linked in:
[  122.436062][  T776] Hardware name: QEMU Ubuntu 24.04 PC v2 (i440FX + PIIX, arch_caps fix, 1996), BIOS 1.16.3-debian-1.16.3-2 04/01/2014
[  122.436866][  T776] Workqueue: usb_hub_wq hub_event
[  122.437246][  T776] RIP: 0010:free_large_kmalloc (mm/slub.c:6491)
[  122.437623][  T776] Code: 8b 43 30 83 f8 ff 74 13 25 00 00 00 ff 3d 00 00 00 f8 75 55 c7 43 30 ff ff ff ff 48 89 df 44 89 f6 5b 41 5e 5d e9 ba f9 fc ff <0f> 0b 48 89 df 48 c7 c6 b0 ee 9c 8c 5b 41 5e 5d e9 45 df f0 ff 0f
[  122.438900][  T776] RSP: 0000:ffff88810cb373c0 EFLAGS: 00010206
[  122.439409][  T776] RAX: 00000000ff000000 RBX: ffffea00048cf880 RCX: 0000000000000028
[  122.440124][  T776] RDX: 0000000000000001 RSI: ffff8881233e2000 RDI: ffffea00048cf880
[  122.440674][  T776] RBP: ffff8881233e2000 R08: ffff8881187e4f03 R09: 1ffff110230fc9e0
[  122.441228][  T776] R10: dffffc0000000000 R11: ffffed10230fc9e1 R12: ffff888170006800
[  122.441817][  T776] R13: ffffffff90eec020 R14: 0000000000000000 R15: ffffffff86bdeb1c
[  122.442384][  T776] FS:  0000000000000000(0000) GS:ffff8882c5d34000(0000) knlGS:0000000000000000
[  122.443011][  T776] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[  122.443485][  T776] CR2: 0000563ae7328600 CR3: 0000000169f46000 CR4: 00000000000006f0
[  122.444038][  T776] Call Trace:
[  122.444289][  T776]  <TASK>
[  122.444498][  T776]  kfree (mm/slub.c:6561)
[  122.445204][  T776]  usb_free_urb (drivers/usb/core/urb.c:25 include/linux/kref.h:65 drivers/usb/core/urb.c:96)
[  122.445513][  T776]  smsusb_term_device (drivers/media/usb/siano/smsusb.c:352)
[  122.445872][  T776]  usb_unbind_interface (drivers/usb/core/driver.c:458)
[  122.446999][  T776]  device_release_driver_internal (drivers/base/dd.c:621 drivers/base/dd.c:1352 drivers/base/dd.c:1375)
[  122.447444][  T776]  bus_remove_device (drivers/base/bus.c:657)
[  122.448591][  T776]  device_del (drivers/base/core.c:3895)
[  122.449952][  T776]  usb_disable_device (drivers/usb/core/message.c:1478)
[  122.450311][  T776]  usb_disconnect (drivers/usb/core/hub.c:2315)
[  122.450636][  T776]  hub_event (drivers/usb/core/hub.c:5407 drivers/usb/core/hub.c:5707 drivers/usb/core/hub.c:5871 drivers/usb/core/hub.c:5953)
[  122.453252][  T776]  process_scheduled_works (kernel/workqueue.c:3314 kernel/workqueue.c:3397)
[  122.453653][  T776]  worker_thread (kernel/workqueue.c:3478)
[  122.454355][  T776]  kthread (kernel/kthread.c:436)
[  122.455464][  T776]  ret_from_fork (arch/x86/kernel/process.c:158)
[  122.456865][  T776]  ret_from_fork_asm (arch/x86/entry/entry_64.S:245)
[  122.457222][  T776]  </TASK>
[  122.457452][  T776] Kernel panic - not syncing: kernel: panic_on_warn set ...
[  122.458826][  T776] Hardware name: QEMU Ubuntu 24.04 PC v2 (i440FX + PIIX, arch_caps fix, 1996), BIOS 1.16.3-debian-1.16.3-2 04/01/2014
[  122.459672][  T776] Workqueue: usb_hub_wq hub_event
[  122.460034][  T776] Call Trace:
[  122.460284][  T776]  <TASK>
[  122.460501][  T776]  dump_stack_lvl (lib/dump_stack.c:94 lib/dump_stack.c:120)
[  122.460838][  T776]  vpanic (kernel/panic.c:650)
[  122.462244][  T776]  panic (kernel/panic.c:787)
[  122.463524][  T776]  __report_bug (lib/bug.c:246)
[  122.467504][  T776]  report_bug (lib/bug.c:278)
[  122.468548][  T776]  handle_bug (arch/x86/kernel/traps.c:436)
[  122.468865][  T776]  exc_invalid_op (arch/x86/kernel/traps.c:490)
[  122.469198][  T776]  asm_exc_invalid_op (arch/x86/include/asm/idtentry.h:616)
[  122.469558][  T776] RIP: 0010:free_large_kmalloc (mm/slub.c:6491)
[  122.469951][  T776] Code: 8b 43 30 83 f8 ff 74 13 25 00 00 00 ff 3d 00 00 00 f8 75 55 c7 43 30 ff ff ff ff 48 89 df 44 89 f6 5b 41 5e 5d e9 ba f9 fc ff <0f> 0b 48 89 df 48 c7 c6 b0 ee 9c 8c 5b 41 5e 5d e9 45 df f0 ff 0f
[  122.471301][  T776] RSP: 0000:ffff88810cb373c0 EFLAGS: 00010206
[  122.471724][  T776] RAX: 00000000ff000000 RBX: ffffea00048cf880 RCX: 0000000000000028
[  122.472283][  T776] RDX: 0000000000000001 RSI: ffff8881233e2000 RDI: ffffea00048cf880
[  122.472849][  T776] RBP: ffff8881233e2000 R08: ffff8881187e4f03 R09: 1ffff110230fc9e0
[  122.473431][  T776] R10: dffffc0000000000 R11: ffffed10230fc9e1 R12: ffff888170006800
[  122.474003][  T776] R13: ffffffff90eec020 R14: 0000000000000000 R15: ffffffff86bdeb1c
[  122.474904][  T776]  kfree (mm/slub.c:6561)
[  122.475616][  T776]  usb_free_urb (drivers/usb/core/urb.c:25 include/linux/kref.h:65 drivers/usb/core/urb.c:96)
[  122.475927][  T776]  smsusb_term_device (drivers/media/usb/siano/smsusb.c:352)
[  122.476283][  T776]  usb_unbind_interface (drivers/usb/core/driver.c:458)


Best,
Shuangpeng

