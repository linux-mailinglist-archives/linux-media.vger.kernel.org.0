Return-Path: <linux-media+bounces-64798-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id j5AyDYvKLmoS2wQAu9opvQ
	(envelope-from <linux-media+bounces-64798-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sun, 14 Jun 2026 17:36:43 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id DB096681691
	for <lists+linux-media@lfdr.de>; Sun, 14 Jun 2026 17:36:42 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b="L95jod/g";
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-64798-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-media+bounces-64798-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id DDFFD300C30F
	for <lists+linux-media@lfdr.de>; Sun, 14 Jun 2026 15:36:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 41FEA3C7E1E;
	Sun, 14 Jun 2026 15:36:08 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qv1-f44.google.com (mail-qv1-f44.google.com [209.85.219.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F7553C4167
	for <linux-media@vger.kernel.org>; Sun, 14 Jun 2026 15:36:06 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781451367; cv=none; b=mtKqLz6FU05fkpAZY4+w+ZnppS6ZCPF59Pfv1Nt0mbj0ZR8JxTn10mlpzJu0P/xV7lb8L1NbFfv+xJK7YIQxca5J5ikB7U/rTmP4ouT/tieIwOT3bYLv3nX8iyY453NCx7YGhn9z49bQULpbQS21mRaCvyKLm6/Diq/qELik16c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781451367; c=relaxed/simple;
	bh=212BLCbXWyBnhQ6kf54oRbPEYdVqzonk9K2Asx/g4V0=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type; b=BpfsoSKXr478Jyyap8Rlu0ozayRXfzzTdGakoEaEBHadmd4o6ilt0ajxd7S4BAXrc9oqjXXtpTx/jsPxVE0jRnnpl6CBvg7uyPqFyYbvC8z6gOdIw50mNPYV3CAyPHkcshL/cWHMk1WVoGd/PCXgoTNgqYPnNtp245ENy4cjv/8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=L95jod/g; arc=none smtp.client-ip=209.85.219.44
Received: by mail-qv1-f44.google.com with SMTP id 6a1803df08f44-8ce65629acaso30879316d6.3
        for <linux-media@vger.kernel.org>; Sun, 14 Jun 2026 08:36:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781451365; x=1782056165; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=gEf/BpWfnDvtQwx5BCMkDC0SY/8d4mHGUMQYalY89/4=;
        b=L95jod/gbu6ReNR9KrRFxLqX61C8d2s9+xr51lyZ9j0zUJiEJ9b8iEm+Vr5xor3LnJ
         +Z3C3/UPfKk/6IkMyr3TfUTI0PMxGAYdbq+P+bXp+2ij8oWDWZqbxpjrDJspzMypJLDn
         TuFvrWK2LGUJ3/zJIsV6l9R4J28KoAf6r6IkW9ByE8QGG6l38rEMrTWuz/DmteoZNqcH
         GNwNBjDqZpfZV6sDZcXWoBZnOHQ6wG3Jh5ZIDcurS0zgRGAq/ou5jrc/ry3QP1wVUIGO
         5FL0TUbcGyCJBwEK/WkHs8Td3K/q6p3l81m6hG9RfYradleLD/ZKarCvt4adXM5PwIpp
         V13g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781451365; x=1782056165;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gEf/BpWfnDvtQwx5BCMkDC0SY/8d4mHGUMQYalY89/4=;
        b=ZGRAaxjLouAniU294RTBWZ3mflkw0sGgs3wwdRnxWRx9vjzygsSbjbT0KxLG4YYfeW
         N7MKYTf7BkuPZprdC8nXdz0il/mPYLSz/+tmXFYfyPtgbxSHvCjdGmn7AqYJZ0OKnjDI
         76giFiF5u7aQ1ust7TvBdQr0g6QRZk796D1Qs9BTNy8AleaCvD1IAAR3KGQ1Wc5P1FuT
         BTBI7lIvWMm6F/As57cBHIZ0FrP572rJ4fNnvvauZnLP2sVosvHW3JDhEV/4reQSntZr
         VPTyRM15OWVy+PMrMD3+wEHyCaYT4L7oWPaqTj5hZwJenYfGuAV3+zTOGTIfz7Hf4393
         ejfg==
X-Forwarded-Encrypted: i=1; AFNElJ+a56Ppq360yFbRY1IS6GSSGftvkh381MGsDeXaSf1H1clETUTAKCXPjXpD0VPyvEDEqtpMBvk9onKIFw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzBuH1hZqcxOygeLV4Ve+vcENITP3EDW5F2styg+W5vnUgUpiSo
	Y5ggksPpzCaLtpJ5hT2co4HEofVfI//l9h2Hv5YjURf3ku/PP/mulwdj
X-Gm-Gg: Acq92OHUDCSzZtDYnh3Z5Tpr85V1SuOsXBYHgmw2xKLBmtwbz2i7eo6pwMWxUOFjxTp
	CvgqSZhl9Fpi7yqEmF8Rld6Cpui1gJlGlDRH6iZNIWkbPcwiKdN02U+fjLKIPQ6ZjejZ7IwqBJ8
	ZtW5IE9cKcj3AmFU2C2fcYRXHSjCCv/J1NlPm/Si/VZThstod0JCZk26amFQYay6asAVqwS4oun
	J/+Pd6MAX+Xl8bYZpA4oirJfEj5xI5IU5fEJ+qSAUIr8WLCGSg8U00p4Rm9D7cEsDrjCj90I1Nv
	BqMpz503UEFIBObEn0MgglQGGL2kSGR83m2kBnnnrzVf3GSBTrA6MAGGxhRQzv4mtI+ysIJhaGE
	S+vt9e2ip7SJuP8h3FZ6AfdwZozkou3NT3G+AG/FB+YEITADltzAqspmi/Z/V+wGWc1Ne7BkYyO
	g2ggNklNefUPfy0SPONRlBYe1pT7dPddF96MPl2ipKZa6Q9LMfT2PogwbXPAPLQsnlzY6dhHM1
X-Received: by 2002:a0c:f403:0:b0:8ce:c4cd:90b5 with SMTP id 6a1803df08f44-8d32e30db3fmr208047916d6.35.1781451365195;
        Sun, 14 Jun 2026 08:36:05 -0700 (PDT)
Received: from localhost.localdomain ([2607:fb91:8ed:87bb:6944:fb26:8a11:e7ae])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8d300f6b1c5sm82155416d6.3.2026.06.14.08.36.03
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 14 Jun 2026 08:36:04 -0700 (PDT)
From: Shuangpeng Bai <shuangpeng.kernel@gmail.com>
To: hverkuil@kernel.org,
	mchehab@kernel.org,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [BUG] KASAN: slab-use-after-free in __list_del_entry_valid_or_report from media/go7007
Date: Sun, 14 Jun 2026 11:35:59 -0400
Message-ID: <178144969600.60470.3698645248756209453@gmail.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-64798-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[shuangpengkernel@gmail.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:hverkuil@kernel.org,m:mchehab@kernel.org,m:linux-media@vger.kernel.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[shuangpengkernel@gmail.com,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TO_DN_NONE(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: DB096681691

Hi Kernel Maintainers,

I hit the following report while testing current upstream kernel:

KASAN: slab-use-after-free in __list_del_entry_valid_or_report from media/go7007

on commit: e8c2f9fdadee7cbc75134dc463c1e0d856d6e5c7 (May 25 2026)

The reproducer and .config files are here.
https://gist.github.com/shuangpengbai/12e07f377ad7e3dec1c62335b155f08f

I'm happy to test debug patches or provide additional information.

Reported-by: Shuangpeng Bai <shuangpeng.kernel@gmail.com>

[39245.125984][ T8682] BUG: KASAN: slab-use-after-free in __list_del_entry_valid_or_report (lib/list_debug.c:65)
[39245.127242][ T8682] Read of size 8 at addr ffff8881678a1210 by task kworker/1:1/8682
[39245.128368][ T8682]
[39245.128732][ T8682] Hardware name: QEMU Ubuntu 24.04 PC v2 (i440FX + PIIX, arch_caps fix, 1996), BIOS 1.16.3-debian-1.16.3-2 04/01/2014
[39245.128737][ T8682] Workqueue: usb_hub_wq hub_event
[39245.128749][ T8682] Call Trace:
[39245.128754][ T8682]  <TASK>
[39245.128757][ T8682]  dump_stack_lvl (lib/dump_stack.c:94 lib/dump_stack.c:120)
[39245.128765][ T8682]  print_report (mm/kasan/report.c:378 mm/kasan/report.c:482)
[39245.128788][ T8682]  kasan_report (mm/kasan/report.c:595)
[39245.128801][ T8682]  __list_del_entry_valid_or_report (lib/list_debug.c:65)
[39245.128807][ T8682]  device_pm_remove (include/linux/list.h:132 include/linux/list.h:246 include/linux/list.h:318 drivers/base/power/main.c:174)
[39245.128834][ T8682]  device_del (drivers/base/core.c:3896)
[39245.128860][ T8682]  usb_disable_device (drivers/usb/core/message.c:1478)
[39245.128869][ T8682]  usb_disconnect (drivers/input/misc/yealink.c:421)
[39245.128877][ T8682]  hub_event (drivers/usb/core/hub.c:5407 drivers/usb/core/hub.c:5707 drivers/usb/core/hub.c:5871 drivers/usb/core/hub.c:5953)
[39245.128917][ T8682]  process_scheduled_works (kernel/workqueue.c:3314 kernel/workqueue.c:3397)
[39245.128929][ T8682]  worker_thread (kernel/workqueue.c:3478)
[39245.128942][ T8682]  kthread (kernel/kthread.c:436)
[39245.128957][ T8682]  ret_from_fork (kernel/process.c:158)
[39245.129320][ T8682]  ret_from_fork_asm (arch/x86/entry/entry_64.S:245)
[39245.129329][ T8682]  </TASK>
[39245.129331][ T8682]
[39245.156185][ T8682] Freed by task 8682 on cpu 1 at 39245.017827s:
[39245.157077][ T8682]  kasan_save_track (mm/kasan/common.c:57 mm/kasan/common.c:78)
[39245.157769][ T8682]  kasan_save_free_info (mm/kasan/generic.c:584)
[39245.158483][ T8682]  __kasan_slab_free (mm/kasan/common.c:253 mm/kasan/common.c:285)
[39245.159149][ T8682]  kfree (include/linux/kasan.h:235 mm/slub.c:2689 mm/slub.c:6251 mm/slub.c:6566)
[39245.159724][ T8682]  go7007_usb_probe (drivers/media/usb/go7007/go7007-usb.c:1324)
[39245.160455][ T8682]  usb_probe_interface (drivers/usb/core/driver.c:396)
[39245.161203][ T8682]  really_probe (drivers/base/dd.c:? drivers/base/dd.c:709)
[39245.161840][ T8682]  __driver_probe_device (drivers/base/dd.c:871)
[39245.162605][ T8682]  driver_probe_device (drivers/base/dd.c:901)
[39245.163311][ T8682]  __device_attach_driver (drivers/base/dd.c:1029)
[39245.164060][ T8682]  bus_for_each_drv (drivers/base/bus.c:500)
[39245.164733][ T8682]  __device_attach (drivers/base/dd.c:1101)
[39245.165405][ T8682]  device_initial_probe (drivers/base/dd.c:1156)
[39245.166086][ T8682]  bus_probe_device (drivers/base/bus.c:613)
[39245.166754][ T8682]  device_add (drivers/base/core.c:3706)
[39245.167358][ T8682]  usb_set_configuration (drivers/usb/core/message.c:2268)
[39245.168129][ T8682]  usb_generic_driver_probe (drivers/usb/core/generic.c:250)
[39245.168861][ T8682]  usb_probe_device (drivers/usb/core/driver.c:291)
[39245.169503][ T8682]  really_probe (drivers/base/dd.c:? drivers/base/dd.c:709)
[39245.170123][ T8682]  __driver_probe_device (drivers/base/dd.c:871)
[39245.170841][ T8682]  driver_probe_device (drivers/base/dd.c:901)
[39245.171539][ T8682]  __device_attach_driver (drivers/base/dd.c:1029)
[39245.172277][ T8682]  bus_for_each_drv (drivers/base/bus.c:500)
[39245.172959][ T8682]  __device_attach (drivers/base/dd.c:1101)
[39245.173663][ T8682]  device_initial_probe (drivers/base/dd.c:1156)
[39245.174377][ T8682]  bus_probe_device (drivers/base/bus.c:613)
[39245.175054][ T8682]  device_add (drivers/base/core.c:3706)
[39245.175672][ T8682]  usb_new_device (drivers/usb/core/hub.c:2695)
[39245.176363][ T8682]  hub_event (drivers/usb/core/hub.c:5567 drivers/usb/core/hub.c:5707 drivers/usb/core/hub.c:5871 drivers/usb/core/hub.c:5953)
[39245.176996][ T8682]  process_scheduled_works (kernel/workqueue.c:3314 kernel/workqueue.c:3397)
[39245.177761][ T8682]  worker_thread (kernel/workqueue.c:3478)
[39245.178421][ T8682]  kthread (kernel/kthread.c:436)
[39245.178989][ T8682]  ret_from_fork (kernel/process.c:158)
[39245.179645][ T8682]  ret_from_fork_asm (arch/x86/entry/entry_64.S:245)


Best,
Shuangpeng

