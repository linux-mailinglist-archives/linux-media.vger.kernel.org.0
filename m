Return-Path: <linux-media+bounces-64868-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id rIxBHDxZL2r3+gQAu9opvQ
	(envelope-from <linux-media+bounces-64868-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 15 Jun 2026 03:45:32 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id BFE9E682C92
	for <lists+linux-media@lfdr.de>; Mon, 15 Jun 2026 03:45:31 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=Xoqatfsn;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-64868-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-64868-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id BB17B30071F4
	for <lists+linux-media@lfdr.de>; Mon, 15 Jun 2026 01:45:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 96BE213A3ED;
	Mon, 15 Jun 2026 01:45:23 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qv1-f41.google.com (mail-qv1-f41.google.com [209.85.219.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC3B32CCC5
	for <linux-media@vger.kernel.org>; Mon, 15 Jun 2026 01:45:21 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781487923; cv=none; b=MZ1NkReHyzRkBhkNnuleSyWD0lQfK2PvgAzz9+KHO9XSxNOrPfOAYrj+9XV8GSpT+a3EeHl1J/zP6JEN4j+KXBPNo526CugtqJIyHhqHNtBtqRcylaH6n9X3FWcHxDDTw9HQuoInWQ4ihivyjBDN8729TxfeIbULLBxNoNhbOvc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781487923; c=relaxed/simple;
	bh=Q8IuwbarkNZPzJu5L/vZbu7+SdBMOVjz6huUaACKZbc=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type; b=DKng3hLp60SppOXP2V3b8hzvH3iYW2pNPQRiIWZtOn3lw4SjgIeOXpq0CDlPe5mLconWCcbVf3HBgJJ8IH0HIzKhIT1EpZT4ftkrcnpTKCjbGMHytvZKUmC+8XckrD8shY+vdk0MT5vh3kbowgbRt+2e+r3MBqgWoSfoREK+4JQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Xoqatfsn; arc=none smtp.client-ip=209.85.219.41
Received: by mail-qv1-f41.google.com with SMTP id 6a1803df08f44-8ce9ddeddefso34218026d6.0
        for <linux-media@vger.kernel.org>; Sun, 14 Jun 2026 18:45:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781487921; x=1782092721; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=8CHSv4ANqmSvhsROrXqRELTXQAD4dU70egcKmdBq7BQ=;
        b=Xoqatfsnt+doTt3nCVrUVh9Wbx9tCCDrlW7JlccU2tEIb5+8owjGS5c/C9dbVTzJdZ
         kwqzeHJDFO0a41YGawVNL2GN5ilx1oNo3QNEf2WwgoPZcts9Clv+cAvnMTEv/+cGRl3M
         yWFRSyLY3ZjTUC/J4ieDh5ijVKbc/j12ZzD4x7Gbf5gS6UK2gANrHNr8Uyf8EkPVvnSL
         eKtA7GjTV257br2lgffxydHmWYAAt3HR/Fpgm7PJDfk/Xwb6FxZRNjdcYlJXjd386obv
         P6gP5b5/H5Tb1m4AamlyeZXb9XBWNi0G2FWdbclOoPpctwc6orR+dulJbxfA+Pg7xQwM
         ZZ5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781487921; x=1782092721;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8CHSv4ANqmSvhsROrXqRELTXQAD4dU70egcKmdBq7BQ=;
        b=eMo8RVYLSUJKGICX2/XPkFW+IQ014u6pzngn8oYp9CHpOutzzuC6kUkNxehVkE5qYr
         skmNeBack4LXvlmKPBZRNYRGgLtneCiKDzW2mK2eo3TqQjAG409YOTKVoarx9yzA6AT5
         yrluFtY0HTvyqyMmg7iJpQCXT0wG0r4M/58ChpzFrXs2f9k7imY96lEtBzIMf7ji/Sl/
         l7AwZ6hHS+DVlVRpRhDQ6M80woEZl7VNrrVmwcCJlPcxn0jyIkZGj2VBbW6N0Xkr1gTf
         r7KP4CJiRHXM7pFxthXAdL803NL2Op+SWvwFJCFOKZ+8R6Tdh/3VVPzXZGpRw3zNCeMs
         A1pw==
X-Forwarded-Encrypted: i=1; AFNElJ//ec8v66RndSv8neF1z3OiON7RQQ41qNvSTHoh0bqIinEzHN6nfKFlTM84MZyyV+r9MbrkqrdapZrthg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx+63LgKDUct9CmmliCScYdsy+txp/NoMzN1rMIIiPzx5s8wXb5
	iWpyyGl8hDRC2GQ0rCtZt6rTTJ9wGPiI1qHa7JDeIPLjza+yWlLoak4o
X-Gm-Gg: Acq92OHEJoQul3HBGeTQ4cFW2yIsECakttIC+UMGHNE9yoWttEfFl9qDTNwffWcr6x6
	+Sbgc/cUqRRaqwYfCZHLZ/m23SViWE7cn1F1cwSWRsQLJm1s4/sm2XrL1ANjH7o1H4nC/hNdWqx
	RUhO5v5D97ACbkz2dDec59Tj0VP7r/HL1dJX4JZ6OWHXlG8LDGBhn55XVEZxVbn+EHOxMxan1Nk
	US5F9YSPF9P3I64b372Co131FEITGQj/422tg7eSevtTvEN2I0wx3VthjmGa2e3m8t/30yu1nSy
	vHY1QX8cze+Wh1M6Xs+vfAPz+6+d90kQJp1GLw8KQTffSJ6UOVyEuqZiKm3XR1WWrpCVv6gpFMu
	ZDC9Nkj/WZj4Vm2mc1Q1ALysBY9vZZy//O6GufDqCWj0d/o1+IPWuOp2WfF3ymSu3a4+1X0zNN9
	FZ8ISuc6ohNL7Fha7lX4QqgtfgWnkbvuxD8GlXPZE0+YT1C16/NoCtQ8w1S+yriXjvG61U8SRyi
	OD70wMY
X-Received: by 2002:ac8:7f85:0:b0:517:6ef7:f6e0 with SMTP id d75a77b69052e-517fe54f480mr184457611cf.46.1781487920807;
        Sun, 14 Jun 2026 18:45:20 -0700 (PDT)
Received: from localhost.localdomain ([2601:985:4601:5df0:2106:6ce9:6b1:8f70])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-51975955956sm11729771cf.17.2026.06.14.18.45.19
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 14 Jun 2026 18:45:20 -0700 (PDT)
From: Shuangpeng Bai <shuangpeng.kernel@gmail.com>
To: dmitry.torokhov@gmail.com,
	mchehab@kernel.org,
	linux-input@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [BUG] Input: rmi4: KASAN slab-use-after-free in v4l2_release
Date: Sun, 14 Jun 2026 21:45:18 -0400
Message-ID: <178144969601.60470.13645789994911690209@gmail.com>
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
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-64868-lists,linux-media=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:dmitry.torokhov@gmail.com,m:mchehab@kernel.org,m:linux-input@vger.kernel.org,m:linux-media@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:dmitrytorokhov@gmail.com,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[shuangpengkernel@gmail.com,linux-media@vger.kernel.org];
	FREEMAIL_FROM(0.00)[gmail.com];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org,vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCPT_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[shuangpengkernel@gmail.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_NONE(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: BFE9E682C92

Hi input and media maintainers,

I hit the following report while testing current upstream kernel:

Input: rmi4: KASAN slab-use-after-free in v4l2_release

The issue was reproduced by holding an rmi4_f54 /dev/v4l-touch node open,
unbinding the rmi4_f54 function, and then closing the held fd.

I am not sure whether this is specific to rmi_f54 or a more generic V4L2
lifetime issue.

I reproduced this on commit: e8c2f9fdadee7cbc75134dc463c1e0d856d6e5c7 (May 25 2026)

To help trigger the bug more reliably, we applied a minimal diagnostic patch
that only adds delays and print statements.

The reproducer and .config files are here.
https://gist.github.com/shuangpengbai/351f125869016d5ce915cbc113abb547

I'm happy to test debug patches or provide additional information.

Reported-by: Shuangpeng Bai <shuangpeng.kernel@gmail.com>

[   87.788267][ T8430] BUG: KASAN: slab-use-after-free in v4l2_release (drivers/media/v4l2-core/v4l2-dev.c:466)
[   87.790392][ T8430] Read of size 8 at addr ffff8881748dc588 by task rmi_f54_hold_cl/8430
[   87.790944][ T8430]
[   87.791114][ T8430] Hardware name: QEMU Ubuntu 24.04 PC v2 (i440FX + PIIX, arch_caps fix, 1996), BIOS 1.16.3-debian-1.16.3-2 04/01/2014
[   87.791116][ T8430] Call Trace:
[   87.791119][ T8430]  <TASK>
[   87.791121][ T8430]  dump_stack_lvl (lib/dump_stack.c:94 lib/dump_stack.c:120)
[   87.791125][ T8430]  print_report (mm/kasan/report.c:378 mm/kasan/report.c:482)
[   87.791137][ T8430]  kasan_report (mm/kasan/report.c:595)
[   87.791143][ T8430]  v4l2_release (drivers/media/v4l2-core/v4l2-dev.c:466)
[   87.791146][ T8430]  __fput (fs/file_table.c:510)
[   87.791150][ T8430]  fput_close_sync (fs/file_table.c:615)
[   87.791695][ T8430]  __x64_sys_close (fs/open.c:1507 fs/open.c:1492 fs/open.c:1492)
[   87.791698][ T8430]  do_syscall_64 (arch/x86/entry/syscall_64.c:63 arch/x86/entry/syscall_64.c:94)
[   87.791701][ T8430]  entry_SYSCALL_64_after_hwframe (arch/x86/entry/entry_64.S:121)
[   87.791704][ T8430] RIP: 0033:0x7fe62d972c03
[   87.791708][ T8430] Code: e9 37 ff ff ff e8 2d f9 01 00 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 00 64 8b 04 25 18 00 00 00 85 c0 75 14 b8 03 00 00 00 0f 05 <48> 3d 00 f0 ff ff 77 45 c3 0f 1f 40 00 48 83 ec 18 89 7c 24 0c e8
[   87.791710][ T8430] RSP: 002b:00007ffdc1dc6588 EFLAGS: 00000246 ORIG_RAX: 0000000000000003
[   87.791715][ T8430] RAX: ffffffffffffffda RBX: 000000000000000c RCX: 00007fe62d972c03
[   87.791717][ T8430] RDX: 0000000000000000 RSI: 0000000000000000 RDI: 0000000000000003
[   87.791718][ T8430] RBP: 0000000000000003 R08: 0000000000000000 R09: 00007fe62da160c0
[   87.791720][ T8430] R10: fffffffffffffc0d R11: 0000000000000246 R12: 0000000000000004
[   87.791722][ T8430] R13: 00007ffdc1dc66d0 R14: 00007ffdc1dc65d0 R15: 0000000000000000
[   87.791725][ T8430]  </TASK>
[   87.791727][ T8430]
[   87.803468][ T8430] Freed by task 8430 on cpu 1 at 87.787459s:
[   87.803881][ T8430]  kasan_save_track (mm/kasan/common.c:57 mm/kasan/common.c:78)
[   87.804205][ T8430]  kasan_save_free_info (mm/kasan/generic.c:584)
[   87.804556][ T8430]  __kasan_slab_free (mm/kasan/common.c:253 mm/kasan/common.c:285)
[   87.804885][ T8430]  kfree (include/linux/kasan.h:235 mm/slub.c:2689 mm/slub.c:6251 mm/slub.c:6566)
[   87.805157][ T8430]  devres_release_all (drivers/base/devres.c:50 drivers/base/devres.c:547 drivers/base/devres.c:576)
[   87.805504][ T8430]  device_release_driver_internal (drivers/base/dd.c:598 drivers/base/dd.c:1357 drivers/base/dd.c:1375)
[   87.805929][ T8430]  unbind_store (drivers/base/bus.c:244)
[   87.806246][ T8430]  kernfs_fop_write_iter (fs/kernfs/file.c:352)
[   87.806616][ T8430]  vfs_write (fs/read_write.c:595 fs/read_write.c:688)
[   87.806914][ T8430]  ksys_write (fs/read_write.c:740)
[   87.807214][ T8430]  do_syscall_64 (arch/x86/entry/syscall_64.c:63 arch/x86/entry/syscall_64.c:94)
[   87.807542][ T8430]  entry_SYSCALL_64_after_hwframe (arch/x86/entry/entry_64.S:121)
[   87.807955][ T8430]
[   87.808124][ T8430] The buggy address belongs to the object at ffff8881748dc000
[   87.808124][ T8430]  which belongs to the cache kmalloc-4k of size 4096
[   87.809083][ T8430] The buggy address is located 1416 bytes inside of
[   87.809083][ T8430]  freed 4096-byte region [ffff8881748dc000, ffff8881748dd000)
[   87.810030][ T8430]


Best,
Shuangpeng

