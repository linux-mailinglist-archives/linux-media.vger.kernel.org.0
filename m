Return-Path: <linux-media+bounces-64841-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id gB2mNugEL2ov7QQAu9opvQ
	(envelope-from <linux-media+bounces-64841-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sun, 14 Jun 2026 21:45:44 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 512C3682122
	for <lists+linux-media@lfdr.de>; Sun, 14 Jun 2026 21:45:44 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=cxtdCsBh;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-64841-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-media+bounces-64841-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 12476300A8E1
	for <lists+linux-media@lfdr.de>; Sun, 14 Jun 2026 19:45:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 87A7430C631;
	Sun, 14 Jun 2026 19:45:18 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qv1-f44.google.com (mail-qv1-f44.google.com [209.85.219.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FC7317A31E
	for <linux-media@vger.kernel.org>; Sun, 14 Jun 2026 19:45:16 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781466318; cv=none; b=uvCxs3sc2Io5wcpk0wE0O6UMpY8Iu/H7SsbuHIQWsv446xgjjCTY81b7CWB2ADvbSDYYZtNQpEZMkYlFGhjZh49/1c+zN8mTFUCq9jKc7FrTk1FN3/yBRHsQvkKk7FGeB/b5erxE2LGvggNQ0HgcBymHHb72b3n9yO8McJaRcd8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781466318; c=relaxed/simple;
	bh=KTnICNAQTF4i26gA627TLyz/PWcWikqmlgsl3+3c8W4=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type; b=uow9vzmYdsFEL3t1n1S7DN9AOjPJP8pCa9EZRfqmwrMlAeBaiFTbvyAGaQO5UlN7h8ZVZINcfe9xC2njTzHOYGBjSJeAC704AWC4zFAv+SBHo1PdC1XvNzInD1IgMqqAR4BBQS5JYiSCfrsl7rFqsdC57buBg5Jx6W+t6ztWmBI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cxtdCsBh; arc=none smtp.client-ip=209.85.219.44
Received: by mail-qv1-f44.google.com with SMTP id 6a1803df08f44-8ccda0ac4fcso29877166d6.2
        for <linux-media@vger.kernel.org>; Sun, 14 Jun 2026 12:45:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781466315; x=1782071115; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=KMpCCOXv0azA5mkwnu6PvzwQuj9/EOXZ9xkp0k7t/n4=;
        b=cxtdCsBhkHXAF5kAQWuoEy6RZPmyHgeROL7VL0vSqZ89x10RwlQJ26NKIAYers+8CF
         6GwFY5CzdA0ZtzYcWO7ST8RHthylXcg7W3DzRiLMQW0wcGjMu+x16IeFVVfEstIkWu76
         ZMxH2Y4NpIishnaErbhZnql7LTeO1rUFBFxUpdbW/OHQnRMGjiQcPYthxvLm1iNFb2jA
         U1KNScvJNMRG+Kkprgh71O7IiwvIPlef7g6OtOCck5yxXascQLitBoLe4fctDUsCgDk3
         35uoSF/rYducP4LjmpsAgSddmB/q4ZhaIMP/qp1lGJPPfDpNBQbrB58wge7OWv4tvkXv
         vUwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781466315; x=1782071115;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KMpCCOXv0azA5mkwnu6PvzwQuj9/EOXZ9xkp0k7t/n4=;
        b=rgjKvXaY6jYN9sU0u42uxwZfNKL4tA/Rekor4EOd+CI1RZqphY9L5+lmfj46nd9phK
         Z1DM5zxPhYEPylJpUzfb15/m36LdwsGtJlMqP41lRdxhNj3cYS2A0JUC6O9gbbOkENgT
         leP3NgNeT3p2oDS5dWpVfzQDIY1bz/HLDnQbyLAGG78XIMEziPUqF9mqHZ2c3jRivZCx
         MCYq1lpP5EIU/ZwZLR1UAw06Z1vnDQySAXwuiV5UzuJE8fRGh7mrqupkYcXTkOP9EQsX
         9bMHkxvdShITYya8MCNkC0IXpHG5U9RDwlSTk9EOiVdN4K3HVh1e+1E5f02pHb9B1UrF
         2fDA==
X-Forwarded-Encrypted: i=1; AFNElJ9TsIE6AepfqyKhCC8ECGrg6lAp5C4roNUZnRQSPDeP4u9GIF7wbkTGWqGhVmatoc11ddTaxK5Fsm3E7A==@vger.kernel.org
X-Gm-Message-State: AOJu0YzPWdxeUnJhYvkT2CJ0eUcOhJTVgQWae/BxQRwSNi7Wp/2EebPi
	OmCP4IeuOPLUmh8ExWvoh2i4kbAKmHR8xmB1VLldjkmwl4R0UG+qe+Jr
X-Gm-Gg: Acq92OESilhK6Z6yqtEp7AWcUZOioqUoCqjaZgcXNqhctTHsQEWmaiKakJMqVTFOgkV
	qQMlUFb3QwL/FdocYmtCxReWxOEc8moLvnnvEnyt6C0kS7twFfAetqKyHpSw7k8R1MuMJ/nEzxG
	d64IP/Of+E9OeB+h5QWPBfBq+qwz86YltyKUFNFoR8vbT0WokA45ItOR6OzbMYF7pwLFRDLCyRU
	RJeGllSBqC0skpMAImQsmTQYiviCl6PQetAcsR7qjZBZBZaU7uR/otkTfV8KDg2eexoAZLDL05W
	jK685pdDJtb8p1bTuJpLOXJSzVZkCywCTYx4LF2wLeuIaFc2TxHnbV8GCSIuxd6qNz4Nl7xtohD
	tRcj0GhvyN8b1BpFx9YmTGcPC8HE3ZtBJoU+DHhx6QA+1xOGsZuBf4VqVJ0iXspXf3zkYwPpYWY
	jJGPJcaRJ/x0C8TB8W2HoXJkcEDRU2yYLkDpVIk+5flDmfyUfXefZC3XMC35AA3CwfukWf8zWv
X-Received: by 2002:ac8:5a47:0:b0:517:9593:ed90 with SMTP id d75a77b69052e-517fe4d6cb0mr172866311cf.34.1781466315476;
        Sun, 14 Jun 2026 12:45:15 -0700 (PDT)
Received: from localhost.localdomain ([2607:fb90:a8d1:8eec:c0e9:106e:b2e:e8e9])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-517fb7a00desm87285451cf.19.2026.06.14.12.45.14
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 14 Jun 2026 12:45:15 -0700 (PDT)
From: Shuangpeng Bai <shuangpeng.kernel@gmail.com>
To: hverkuil@kernel.org,
	mchehab@kernel.org,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [BUG] KASAN: slab-use-after-free in go7007_snd_hw_free
Date: Sun, 14 Jun 2026 15:45:14 -0400
Message-ID: <178144969601.60470.6005237146425573205@gmail.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[shuangpengkernel@gmail.com,linux-media@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-64841-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:hverkuil@kernel.org,m:mchehab@kernel.org,m:linux-media@vger.kernel.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	RCPT_COUNT_THREE(0.00)[4];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[shuangpengkernel@gmail.com,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_NONE(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 512C3682122

Hi Kernel Maintainers,

I hit the following report while testing current upstream kernel:

KASAN: slab-use-after-free in go7007_snd_hw_free

on commit: e8c2f9fdadee7cbc75134dc463c1e0d856d6e5c7 (May 25 2026)

The reproducer and .config files are here.
https://gist.github.com/shuangpengbai/88fca2a40cdcef309541cf4e9f6c1d5b

I'm happy to test debug patches or provide additional information.

Reported-by: Shuangpeng Bai <shuangpeng.kernel@gmail.com>

[  136.245938][ T8273] BUG: KASAN: slab-use-after-free in go7007_snd_hw_free (drivers/media/usb/go7007/snd-go7007.c:111)
[  136.247442][ T8273] Write of size 8 at addr ffff888108745090 by task repro_go7007_al/8273
[  136.248893][ T8273]
[  136.249399][ T8273] Hardware name: QEMU Ubuntu 24.04 PC v2 (i440FX + PIIX, arch_caps fix, 1996), BIOS 1.16.3-debian-1.16.3-2 04/01/2014
[  136.249421][ T8273] Call Trace:
[  136.249439][ T8273]  <TASK>
[  136.249444][ T8273]  dump_stack_lvl (lib/dump_stack.c:94 lib/dump_stack.c:120)
[  136.249571][ T8273]  print_report (mm/kasan/report.c:378 mm/kasan/report.c:482)
[  136.249689][ T8273]  kasan_report (mm/kasan/report.c:595)
[  136.249704][ T8273]  go7007_snd_hw_free (drivers/media/usb/go7007/snd-go7007.c:111)
[  136.249711][ T8273]  snd_pcm_release_substream (sound/core/pcm_native.c:933 sound/core/pcm_native.c:2776)
[  136.249773][ T8273]  snd_pcm_release (sound/core/pcm_native.c:2965)
[  136.249782][ T8273]  __fput (fs/file_table.c:510)
[  136.249806][ T8273]  fput_close_sync (fs/file_table.c:615)
[  136.249889][ T8273]  __x64_sys_close (fs/open.c:1507 fs/open.c:1492 fs/open.c:1492)
[  136.249912][ T8273]  do_syscall_64 (arch/x86/entry/syscall_64.c:63 arch/x86/entry/syscall_64.c:94)
[  136.249930][ T8273]  entry_SYSCALL_64_after_hwframe (arch/x86/entry/entry_64.S:121)
[  136.249974][ T8273] RIP: 0033:0x7ff69a1cfc03
[  136.249990][ T8273] Code: e9 37 ff ff ff e8 2d f9 01 00 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 00 64 8b 04 25 18 00 00 00 85 c0 75 14 b8 03 00 00 00 0f 05 <48> 3d 00 f0 ff ff 77 45 c3 0f 1f 40 00 48 83 ec 18 89 7c 24 0c e8
[  136.249997][ T8273] RSP: 002b:00007ffefc060c38 EFLAGS: 00000246 ORIG_RAX: 0000000000000003
[  136.250036][ T8273] RAX: ffffffffffffffda RBX: 0000000000000009 RCX: 00007ff69a1cfc03
[  136.250042][ T8273] RDX: 24abb4819636a0c4 RSI: 0000000000000000 RDI: 000000000000000b
[  136.250046][ T8273] RBP: 0000000000000001 R08: 0000000000000009 R09: 0000000000000000
[  136.250049][ T8273] R10: 0000000000000005 R11: 0000000000000246 R12: 0000000000000001
[  136.250053][ T8273] R13: 000055e2002d7e60 R14: 00007ffefc060ce0 R15: 0000000000000000
[  136.250085][ T8273]  </TASK>
[  136.250088][ T8273]
[  136.264706][ T8273] Freed by task 776 on cpu 1 at 135.227504s:
[  136.265113][ T8273]  kasan_save_track (mm/kasan/common.c:57 mm/kasan/common.c:78)
[  136.265447][ T8273]  kasan_save_free_info (mm/kasan/generic.c:584)
[  136.265801][ T8273]  __kasan_slab_free (mm/kasan/common.c:253 mm/kasan/common.c:285)
[  136.266132][ T8273]  kfree (include/linux/kasan.h:235 mm/slub.c:2689 mm/slub.c:6251 mm/slub.c:6566)
[  136.266414][ T8273]  v4l2_device_put (drivers/media/v4l2-core/v4l2-device.c:51 include/linux/kref.h:65 drivers/media/v4l2-core/v4l2-device.c:56)
[  136.266753][ T8273]  usb_unbind_interface (drivers/usb/core/driver.c:458)
[  136.267128][ T8273]  device_release_driver_internal (drivers/base/dd.c:621 drivers/base/dd.c:1352 drivers/base/dd.c:1375)
[  136.267579][ T8273]  bus_remove_device (drivers/base/bus.c:657)
[  136.267918][ T8273]  device_del (drivers/base/core.c:3895)
[  136.268214][ T8273]  usb_disable_device (drivers/usb/core/message.c:1478)
[  136.268577][ T8273]  usb_disconnect (drivers/input/misc/yealink.c:421)
[  136.268904][ T8273]  hub_event (drivers/usb/core/hub.c:5407 drivers/usb/core/hub.c:5707 drivers/usb/core/hub.c:5871 drivers/usb/core/hub.c:5953)
[  136.269209][ T8273]  process_scheduled_works (kernel/workqueue.c:3314 kernel/workqueue.c:3397)
[  136.269599][ T8273]  worker_thread (kernel/workqueue.c:3478)
[  136.269968][ T8273]  kthread (kernel/kthread.c:436)
[  136.270335][ T8273]  ret_from_fork (kernel/process.c:158)
[  136.270667][ T8273]  ret_from_fork_asm (arch/x86/entry/entry_64.S:245)
[  136.270993][ T8273]
[  136.271155][ T8273] The buggy address belongs to the object at ffff888108744000
[  136.271155][ T8273]  which belongs to the cache kmalloc-8k of size 8192
[  136.272231][ T8273] The buggy address is located 4240 bytes inside of
[  136.272231][ T8273]  freed 8192-byte region [ffff888108744000, ffff888108746000)
[  136.273166][ T8273]


Best,
Shuangpeng

