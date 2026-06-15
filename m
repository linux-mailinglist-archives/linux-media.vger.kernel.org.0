Return-Path: <linux-media+bounces-64867-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id CovnHKNWL2qL+gQAu9opvQ
	(envelope-from <linux-media+bounces-64867-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 15 Jun 2026 03:34:27 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C6811682C41
	for <lists+linux-media@lfdr.de>; Mon, 15 Jun 2026 03:34:26 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=B3V1WLZm;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-64867-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-64867-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E555C300B9D7
	for <lists+linux-media@lfdr.de>; Mon, 15 Jun 2026 01:34:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A7EDC1F3BA2;
	Mon, 15 Jun 2026 01:34:08 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com [209.85.160.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C893155757
	for <linux-media@vger.kernel.org>; Mon, 15 Jun 2026 01:34:05 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781487248; cv=none; b=u6tCblnNsPqEWN18Ammc1FjsoHNzjEOLXWD4zIFDEXoi8dYmyTBdeyQy5haJYoO73ZcsOfR6rcTwKPuPjHfogmyYc2LyX2NWrXb8rWcIPCSpMPcfc10OHWu4AV9aedoxl0IswhbZoT2uvwtJFPGsWdEvmpRoZkXJY6K6yofHQLU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781487248; c=relaxed/simple;
	bh=7oKXseGbTKhWClIn+IZFKhPmEVFAxBlA+YTrHY4Ksy8=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type; b=Fr05+e6EeLPz2PVI0ATnOuR+I6iOX4rPHPKDan8XaXY/weoJ4wKRfbQ8I+ApWK7XxMnWYE+cKUFWZ3GfZuJArYNvx4kouOiDd41EqqjK6YDBU1804YZadbaaHNh1OeZdu3cxKt5aaiMzYjy/7I7b3OREpkzYoksGGsSEP1XctgQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=B3V1WLZm; arc=none smtp.client-ip=209.85.160.180
Received: by mail-qt1-f180.google.com with SMTP id d75a77b69052e-517863a2edfso22707401cf.1
        for <linux-media@vger.kernel.org>; Sun, 14 Jun 2026 18:34:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781487244; x=1782092044; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=sEIYisvbqosdHIH3SQb5ZKXZqum9xA6gu1xzPhc+QVU=;
        b=B3V1WLZmNwGkrDA+6D4olUxm/VDF24E2PVu2gUzgwiW4lRHGmYvYJslKYBjZ9Juyp6
         obzTYbbTiyyqNHHoZr8yM9vOwfBYFtZ76YMNeSM8VqObr0qegzT/Yr2MenD66cu1Nz5E
         IQu9om2V8veFpK0md8TpvLfVZXApK31sn+Quj+SFZqxU2aONJJpYI/LLfN90Gid7GgKt
         iIJjPTd/CHGPwDsLQW6etCGJ3+3FPLsGyCfPMEXRUmkDHW0xVUF9GyOp7knSHAh3msyn
         GMKRiiWq14mn4YS9x1qiwST7liGBdQKT/sEKF7iminyu8kFTYl5d3UAc3iuPImOxiPgt
         CvIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781487244; x=1782092044;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sEIYisvbqosdHIH3SQb5ZKXZqum9xA6gu1xzPhc+QVU=;
        b=RB0rfDdgWkQwUseDDaUFkXtpQZaVsai2d3GoIZKh0Qze6sghNhf48LMeWkcQ132fXe
         ZjwffGMtZhUFnkD7P2EvmaAhUoPj/vkx7NHL27Zwf1BHFIbS+Wvf2Jruq0V3vltMNYBQ
         RX6N0F4yLtVWsTkX/7tOdOvLv87bogiIKCZMw2AV7oTim+hHsj3gL0GXyHvpQohLRFZL
         g2ZIlqn1y+73RZ83ckRZIiDRy1yWzv4AAM8dTdzgB3C2ERNdeRDT9vpw7TI000kveZ3B
         A+gZqqzd1HyhMHLbty0GRROcRMjrt3AcRHcG1/E3k/zA1O+hDQMhi4O1fCDUsbMqs2hV
         PfnA==
X-Forwarded-Encrypted: i=1; AFNElJ/GbpR1TB1p9jNR2iTWYTEguc+fPFJkPK+lmPsuwkJBmareprXcfuqA4teNpUMN2QO2AfB0JAFHK8w6+g==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx5PjJyOBzp9nTYfLI35XyCyKhaejXGed/W8tmmkBF6CNQj4EXP
	LWGu4YrShHr1qoVA9Jm4dnsHx4sqnWJ2E+BDgakJDPjzHz5VC43RxysY
X-Gm-Gg: Acq92OF+mBYFR4xtxMd34MqXmLB4NbodRk4FmYQnu1lw3myJlQYNS+6FHoWdnf5fpJb
	t0aEshP5grMa7m+gHy/ZA63JTVPBCswbYKKyMh4eLwiUBntKFKVz64IEsz/AES2gQb7usDZjv9i
	ZZ2yLERtRQvoB1wonb42denlhM7kvc9wYJy93953yfyw+DbqStzj+ZZmwsn3SZOeHM7uxX0Bzek
	klgRyEPu349pdAscXdFp29ZrwXzd/+ML+y7Ozxq5Vsf/yoD08GiZF6rGZ3PGqZJmnJHzUHDQzdK
	XqJ5zh+PPcTUrjAG/BubYWEoyLLX4PKu9KgVSFdF/IuNHjGoEVC09FLXc8AE4VcYMBiEtzsJjWe
	82LEBEDaG1RdgBtChgEubJpvPISDHvCdGsgFZM8OR4YevYVyPy9j+ia2/akwP44n8VUwm9mVnxp
	1dezHBXVnDtNLEwelAklUhdXZ0LxruRNO2tgz2b0+KbLHyNCC11f/ijBIu+fDWA1kXV8HeVe+Yg
	UXEII18
X-Received: by 2002:a05:622a:11c5:b0:517:906b:c043 with SMTP id d75a77b69052e-517fe4dd86dmr179688111cf.36.1781487244572;
        Sun, 14 Jun 2026 18:34:04 -0700 (PDT)
Received: from localhost.localdomain ([2601:985:4601:5df0:2106:6ce9:6b1:8f70])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-517fb61eaf4sm90857191cf.4.2026.06.14.18.34.03
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 14 Jun 2026 18:34:04 -0700 (PDT)
From: Shuangpeng Bai <shuangpeng.kernel@gmail.com>
To: mchehab@kernel.org,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [BUG] KASAN: slab-use-after-free in snd_usbtv_pcm_close
Date: Sun, 14 Jun 2026 21:34:02 -0400
Message-ID: <178144969601.60470.4852887710381872458@gmail.com>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[shuangpengkernel@gmail.com,linux-media@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-64867-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:mchehab@kernel.org,m:linux-media@vger.kernel.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	RCPT_COUNT_THREE(0.00)[3];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[shuangpengkernel@gmail.com,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_NONE(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: C6811682C41

Hi Kernel Maintainers,

I hit the following report while testing current upstream kernel:

KASAN: slab-use-after-free in snd_usbtv_pcm_close

I reproduced this on commit: e8c2f9fdadee7cbc75134dc463c1e0d856d6e5c7 (May 25 2026)

The reproducer and .config files are here.
https://gist.github.com/shuangpengbai/d75fcb55c539aa707f95debbbc541511

I'm happy to test debug patches or provide additional information.

Reported-by: Shuangpeng Bai <shuangpeng.kernel@gmail.com>

[  143.650776][ T8284] ==================================================================
[  143.653135][ T8284] BUG: KASAN: slab-use-after-free in snd_usbtv_pcm_close (include/linux/instrumented.h:82 include/linux/atomic/atomic-instrumented.h:32 drivers/media/usb/usbtv/usbtv-audio.c:80)
[  143.655348][ T8284] Read of size 4 at addr ffff88816f8b0858 by task repro_usbtv_als/8284
[  143.658360][ T8284] Hardware name: QEMU Ubuntu 24.04 PC v2 (i440FX + PIIX, arch_caps fix, 1996), BIOS 1.16.3-debian-1.16.3-2 04/01/2014
[  143.658373][ T8284] Call Trace:
[  143.658401][ T8284]  <TASK>
[  143.658412][ T8284]  dump_stack_lvl (lib/dump_stack.c:94 lib/dump_stack.c:120)
[  143.658466][ T8284]  print_report (mm/kasan/report.c:378 mm/kasan/report.c:482)
[  143.658590][ T8284]  kasan_report (mm/kasan/report.c:595)
[  143.658627][ T8284]  kasan_check_range (mm/kasan/generic.c:? mm/kasan/generic.c:200)
[  143.658645][ T8284]  snd_usbtv_pcm_close (include/linux/instrumented.h:82 include/linux/atomic/atomic-instrumented.h:32 drivers/media/usb/usbtv/usbtv-audio.c:80)
[  143.658661][ T8284]  snd_pcm_release_substream (sound/core/pcm_native.c:2777)
[  143.658708][ T8284]  snd_pcm_release (sound/core/pcm_native.c:2965)
[  143.658720][ T8284]  __fput (fs/file_table.c:510)
[  143.658744][ T8284]  fput_close_sync (fs/file_table.c:615)
[  143.658797][ T8284]  __x64_sys_close (fs/open.c:1507 fs/open.c:1492 fs/open.c:1492)
[  143.658817][ T8284]  do_syscall_64 (arch/x86/entry/syscall_64.c:63 arch/x86/entry/syscall_64.c:94)
[  143.658841][ T8284]  entry_SYSCALL_64_after_hwframe (arch/x86/entry/entry_64.S:121)
[  143.658929][ T8284]  </TASK>
[  143.675971][ T8284] Freed by task 10 on cpu 0 at 142.640459s:
[  143.676382][ T8284]  kasan_save_track (mm/kasan/common.c:57 mm/kasan/common.c:78)
[  143.676713][ T8284]  kasan_save_free_info (mm/kasan/generic.c:584)
[  143.677057][ T8284]  __kasan_slab_free (mm/kasan/common.c:253 mm/kasan/common.c:285)
[  143.677388][ T8284]  kfree (include/linux/kasan.h:235 mm/slub.c:2689 mm/slub.c:6251 mm/slub.c:6566)
[  143.677659][ T8284]  v4l2_device_put (drivers/media/v4l2-core/v4l2-device.c:51 include/linux/kref.h:65 drivers/media/v4l2-core/v4l2-device.c:56)
[  143.677981][ T8284]  usb_unbind_interface (drivers/usb/core/driver.c:458)
[  143.678538][ T8284]  device_release_driver_internal (drivers/base/dd.c:621 drivers/base/dd.c:1352 drivers/base/dd.c:1375)
[  143.678995][ T8284]  bus_remove_device (drivers/base/bus.c:657)
[  143.679349][ T8284]  device_del (drivers/base/core.c:3895)
[  143.679650][ T8284]  usb_disable_device (drivers/usb/core/message.c:1478)
[  143.680005][ T8284]  usb_disconnect (drivers/usb/core/hub.c:2315)
[  143.680340][ T8284]  hub_event (drivers/usb/core/hub.c:5407 drivers/usb/core/hub.c:5707 drivers/usb/core/hub.c:5871 drivers/usb/core/hub.c:5953)


Best,
Shuangpeng

