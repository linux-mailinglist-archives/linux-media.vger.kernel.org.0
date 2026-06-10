Return-Path: <linux-media+bounces-64347-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id +wqkFNraKGqVKwMAu9opvQ
	(envelope-from <linux-media+bounces-64347-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 10 Jun 2026 05:32:42 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DCFD665A0A
	for <lists+linux-media@lfdr.de>; Wed, 10 Jun 2026 05:32:41 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b="COgO/iM/";
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-64347-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-media+bounces-64347-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 15B863076B32
	for <lists+linux-media@lfdr.de>; Wed, 10 Jun 2026 03:31:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AD67828850E;
	Wed, 10 Jun 2026 03:31:55 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com [209.85.160.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D818C224B15
	for <linux-media@vger.kernel.org>; Wed, 10 Jun 2026 03:31:53 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781062315; cv=none; b=Q1aEmmQ7XzQ+gt4VISc2Bdabd+BNjI2pW3mBkl6CDHjV5PyXc2tXEz7/Mo1/beiTa+YF4tkNpDndeugaII1diYujn5UlH3YW4FHvl12fPtTC0cZoVq4l82kgUW7cyAXPPUPlHt56/i9S+sYVAuM6R96TCJ2zQJX/neOiEhM+KyM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781062315; c=relaxed/simple;
	bh=oK0fuqvhIRC63Knx+gZh1qksAoIRk0FxbgtBcJABvZc=;
	h=From:Content-Type:Mime-Version:Subject:Message-Id:Date:Cc:To; b=I79TLfOhpjgwfSrd116yTASQbRSFdQaKS9h7ZN0zYgjVvd2pLZ8x2mM+9OGPf5LTtKmHXp9521Pc5xtPtHBHZ9fvxDS7L+Ei0hdDSGlkGcrEOqNu2IkdtY71J0ftSBnF/Ofvj6AP/JOp2o59ewuVIHtS1Nlg3defhpumwmA+oOs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=COgO/iM/; arc=none smtp.client-ip=209.85.160.175
Received: by mail-qt1-f175.google.com with SMTP id d75a77b69052e-5177ad0cc67so50330311cf.0
        for <linux-media@vger.kernel.org>; Tue, 09 Jun 2026 20:31:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781062313; x=1781667113; darn=vger.kernel.org;
        h=to:cc:date:message-id:subject:mime-version
         :content-transfer-encoding:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eEDJjvJyCLMfky77N9ovA0qlg3zasavZZCkFBCpyxdw=;
        b=COgO/iM/o0LhBKifpj/kpnmbGfHStZmPX/i7Sidx9Ssg3KDe20tHiqZMXv9kYUqwPw
         8y50aUdUEzB+MKCFt+C8Z5wabVWGyLIoyR61Sx9r+GJI/FkYDBVSsalrSBo0oUP/mAZO
         f/Lqe9ZutX2SXx/S01IWDziKODR8k16VbJunq1SlJ5wxMQM9Um2wVaDbGyxNmSiPfUGp
         xqObFBMOdM2DsYDWJpoepWGdoBoSyradkiOkzOHNZfsxDShgRYgxNMxbQhXAo7O7FCoZ
         RiieyM/RRdMvm1qTu5p8zgxVlvA37OeSFYJFUsKiSiR8PSuBzLFuyZ52wNDuJ7C4jjUW
         8uBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781062313; x=1781667113;
        h=to:cc:date:message-id:subject:mime-version
         :content-transfer-encoding:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=eEDJjvJyCLMfky77N9ovA0qlg3zasavZZCkFBCpyxdw=;
        b=c72AH/dsVFsn75CRjNzDbD90XvTmRJj6leW7iU2xwjcZsS/tS0hSkwhJFvLuQiAfgt
         FzNxvn+Ycp/Qn83kt9RauY+eKvnX5X2gsgO4QH3ZcFT4oSeRr2SP6itEFBjmZQJbUFXE
         dtnxb4dZd/fUGnVm3qJ/VgBfelslsEKL+ZuN1ewqDaHPRQlLEy4Rqqz9Tco8lTPKOlAQ
         73ND9GA0U+J/RI/4pkM7L82cUlztRbfO8BIVSLXI1kiWa3WeqdkMH4hLG+W53sftLgWH
         QdNzrVUx6Lz+qu6wtBVn6zgbCiJYlOLcB9EjEVyTUYASzRogjjJR/SrC3Yx4O4DgGHM2
         1nKg==
X-Gm-Message-State: AOJu0YxNpgE8erRlh9/HSpwf4xQGNCm8JgV6sunxceGPR1iXQqzwTrFr
	mfEbreph8Rsc+4HD4fBshW46J34dPtsPMloV6V7q3e4VWDFwrhAKJjt9
X-Gm-Gg: Acq92OHp2JRJoXdiwFukOG/LI8TBeYX96vi6bhoYCMDH25eDjSg8LYVzWc8HYsRJ5M5
	UTatLhhfy6eP+qcXeET1tUuu/wc72QGSfSWyg07nBbOHQyO9/iOKaPmdmufgHAU6ZE33Amf0EDk
	7v8mnxdvXRTStgEXase416y8sUgGwhnjj+VOqbkUrsmkYAlvU8P7RM5LGQKfHEKVbKS1hZWliYN
	/N2bNXJgANA8vEO/mll/H+8iXNWMsseht3vWMxMofSkHVs0e3kHeCb/yOcb7BvS4VElVvF30K+8
	mM+nwA+I5TIUeoJeFFH5+lVPdejCBptPF9wwVb+YpJ3OIQLIf5VRpa5V00jeZp5cnYKZqzSygvh
	HkE52rXWr34E+JCO7xE6HE8fNcntBu0TaBg4qf9HKwbGqdpfHm3hrL/nkaIQgl9GHPdhTz7tMIm
	ArxXzNdfFxV3xPH5y6U6uzCByVdVyODjzAnf31/3mRwGQW4C7Yi47yuDGnlz9c2bLjYhc9r+l6w
	Bc=
X-Received: by 2002:a05:622a:2515:b0:517:859b:b584 with SMTP id d75a77b69052e-51795a0909dmr328917231cf.1.1781062312953;
        Tue, 09 Jun 2026 20:31:52 -0700 (PDT)
Received: from smtpclient.apple ([2601:985:4601:5df0:21ff:7f24:219f:42ec])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-51775e25c5dsm204106401cf.30.2026.06.09.20.31.52
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 09 Jun 2026 20:31:52 -0700 (PDT)
From: Shuangpeng <shuangpeng.kernel@gmail.com>
Content-Type: text/plain;
	charset=us-ascii
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3864.600.51.1.1\))
Subject: [BUG] media: dvb: KASAN slab-use-after-free in dvb_frontend_do_ioctl
Message-Id: <0922F696-E044-488A-8281-1CDE8E054CF4@gmail.com>
Date: Tue, 9 Jun 2026 23:31:21 -0400
Cc: linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org
To: mchehab@kernel.org,
 dwlsalmeida@gmail.com
X-Mailer: Apple Mail (2.3864.600.51.1.1)
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	MV_CASE(0.50)[];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-64347-lists,linux-media=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	FORGED_SENDER(0.00)[shuangpengkernel@gmail.com,linux-media@vger.kernel.org];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com];
	FORGED_RECIPIENTS(0.00)[m:linux-media@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:mchehab@kernel.org,m:dwlsalmeida@gmail.com,s:lists@lfdr.de];
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
X-Rspamd-Queue-Id: 9DCFD665A0A

Hi Kernel Maintainers,

I hit the following KASAN report while testing current upstream kernel:

KASAN: slab-use-after-free in dvb_frontend_do_ioctl

on commit: e8c2f9fdadee7cbc75134dc463c1e0d856d6e5c7 (May 25 2026)

The reproducer and .config files are here.
https://gist.github.com/shuangpengbai/56637725184e4b313cd7ce9a14bd04e8

Although the report below was triggered with vidtv, I have reproduced=20
the similar lifetime bug pattern across a broader series of DVB=20
frontend drivers, like cxd2880-spi, smsdvb, DVBSky using si2168, and
GL861/Friio using tc90522.

I'm happy to test debug patches or provide additional information.

Reported-by: Shuangpeng Bai <shuangpeng.kernel@gmail.com>

[  252.618007][ T8317] =
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
[  252.618841][ T8317] BUG: KASAN: slab-use-after-free in =
dvb_frontend_do_ioctl (drivers/media/dvb-core/dvb_frontend.c:2067)
[  252.619807][ T8317] Read of size 8 at addr ffff88811be3c320 by task =
vidtv_frontend_/8317
[  252.620723][ T8317]
[  252.621036][ T8317] Hardware name: QEMU Ubuntu 24.04 PC v2 (i440FX + =
PIIX, arch_caps fix, 1996), BIOS 1.16.3-debian-1.16.3-2 04/01/2014
[  252.621039][ T8317] Call Trace:
[  252.621054][ T8317]  <TASK>
[  252.621056][ T8317]  dump_stack_lvl (lib/dump_stack.c:94 =
lib/dump_stack.c:120)
[  252.621112][ T8317]  print_report (mm/kasan/report.c:378 =
mm/kasan/report.c:482)
[  252.621194][ T8317]  kasan_report (mm/kasan/report.c:595)
[  252.621202][ T8317]  dvb_frontend_do_ioctl =
(drivers/media/dvb-core/dvb_frontend.c:2067)
[  252.621588][ T8317]  dvb_usercopy =
(drivers/media/dvb-core/dvbdev.c:996)
[  252.621611][ T8317]  dvb_frontend_ioctl =
(drivers/media/dvb-core/dvb_frontend.c:2114)
[  252.621614][ T8317]  __se_sys_ioctl (fs/ioctl.c:51 fs/ioctl.c:597 =
fs/ioctl.c:583)
[  252.621618][ T8317]  do_syscall_64 (arch/x86/entry/syscall_64.c:63 =
arch/x86/entry/syscall_64.c:94)
[  252.621621][ T8317]  entry_SYSCALL_64_after_hwframe =
(arch/x86/entry/entry_64.S:121)
[  252.621654][ T8317]  </TASK>
[  252.621656][ T8317]
[  252.669947][ T8317] Freed by task 8317 on cpu 0 at 252.606789s:
[  252.670700][ T8317]  kasan_save_track (mm/kasan/common.c:57 =
mm/kasan/common.c:78)
[  252.671325][ T8317]  kasan_save_free_info (mm/kasan/generic.c:584)
[  252.671904][ T8317]  __kasan_slab_free (mm/kasan/common.c:253 =
mm/kasan/common.c:285)
[  252.672463][ T8317]  kfree (include/linux/kasan.h:235 mm/slub.c:2689 =
mm/slub.c:6251 mm/slub.c:6566)
[  252.672970][ T8317]  i2c_device_remove =
(drivers/i2c/i2c-core-base.c:630)
[  252.673482][ T8317]  device_release_driver_internal =
(drivers/base/dd.c:619 drivers/base/dd.c:1352 drivers/base/dd.c:1375)
[  252.674139][ T8317]  bus_remove_device (drivers/base/bus.c:657)
[  252.674721][ T8317]  device_del (drivers/base/core.c:3895)
[  252.675233][ T8317]  device_unregister (drivers/base/core.c:3936)
[  252.675673][ T8317]  vidtv_bridge_remove =
(drivers/media/test-drivers/vidtv/vidtv_bridge.c:556)
[  252.676187][ T8317]  device_release_driver_internal =
(drivers/base/dd.c:619 drivers/base/dd.c:1352 drivers/base/dd.c:1375)
[  252.676907][ T8317]  unbind_store (drivers/base/bus.c:244)
[  252.677402][ T8317]  kernfs_fop_write_iter (fs/kernfs/file.c:352)
[  252.678054][ T8317]  vfs_write (fs/read_write.c:595 =
fs/read_write.c:688)
[  252.678527][ T8317]  ksys_write (fs/read_write.c:740)
[  252.678933][ T8317]  do_syscall_64 (arch/x86/entry/syscall_64.c:63 =
arch/x86/entry/syscall_64.c:94)
[  252.679374][ T8317]  entry_SYSCALL_64_after_hwframe =
(arch/x86/entry/entry_64.S:121)
[  252.680070][ T8317]
[  252.680347][ T8317] The buggy address belongs to the object at =
ffff88811be3c000
[  252.680347][ T8317]  which belongs to the cache kmalloc-2k of size =
2048
[  252.681923][ T8317] The buggy address is located 800 bytes inside of
[  252.681923][ T8317]  freed 2048-byte region [ffff88811be3c000, =
ffff88811be3c800)


Best,
Shuangpeng


