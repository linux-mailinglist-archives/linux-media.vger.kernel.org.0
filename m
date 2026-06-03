Return-Path: <linux-media+bounces-63473-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id pskqCD2dH2p6nwAAu9opvQ
	(envelope-from <linux-media+bounces-63473-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 03 Jun 2026 05:19:25 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AA90633D53
	for <lists+linux-media@lfdr.de>; Wed, 03 Jun 2026 05:19:24 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=ISHcX0vR;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-63473-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-media+bounces-63473-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 707ED3057E22
	for <lists+linux-media@lfdr.de>; Wed,  3 Jun 2026 03:15:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A74D53EDAD1;
	Wed,  3 Jun 2026 03:15:25 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qv1-f42.google.com (mail-qv1-f42.google.com [209.85.219.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D831A3ED5DC
	for <linux-media@vger.kernel.org>; Wed,  3 Jun 2026 03:15:23 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780456525; cv=none; b=mvqGogE7gJJkWYRfp9Wztk+wYAxecWqaEY3oW5LULjdcdZFFE0gx2eet6O4NOiPsOmdPGd9VB8MWJWdpL5WZZHlMJzWEQvY4wqdY2tZiB8UZoq9LVlu/GjE8LVZrWhVPBbQGJu//tuzYX3lDhbfnTJflfkGg3n0bkOrisBXJV6E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780456525; c=relaxed/simple;
	bh=QGGjOLDzzFZ0oaThLwWTpjJnB0OoTEFbgnyNymeN5Cg=;
	h=From:Content-Type:Mime-Version:Subject:Message-Id:Date:Cc:To; b=msxylhGion4P5FwGK+PGqM/5CsZUQScIr7deGUigSPu6x6JthsZl8trC9jyEBXUkqDLg2cGu8CqiCIYbxWx/94WFd7fgCQXQ26aP49Kv8J0P4q0egQ58mAtkVPKZGJKo0DXGD3zy2qjSagStGjjpzuFFqukGMpuqI6exh8VzS/8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ISHcX0vR; arc=none smtp.client-ip=209.85.219.42
Received: by mail-qv1-f42.google.com with SMTP id 6a1803df08f44-8ccdf8d4ac5so55563286d6.1
        for <linux-media@vger.kernel.org>; Tue, 02 Jun 2026 20:15:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780456523; x=1781061323; darn=vger.kernel.org;
        h=to:cc:date:message-id:subject:mime-version
         :content-transfer-encoding:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=r5PaakmDObNtfyoDT6IPk/0GVwBbjH2Axz2rUNVenOg=;
        b=ISHcX0vRDtqXZ6np14e2BZHtlDmQRcios6GMy8o5VyQYSMCwmKEzuGJ9zTkn68qa8c
         ZLC0RCAVty+mQSLOuXoMcP0b77lSsd9gGOfoQM7Ojzi2Uw/f82qeXmiED6txLX7RUxGp
         SEwpkJcwiKWhNKKAonbLTbCSAmKVPyUdJQkSdVc1ujhDVY2v+SkV9lsmSPL124noR6KJ
         /8jEgRG1/uuTZtWcAtCHzEm4XbM/ghwrx95//e2YRBizkRZvQdoj7LJEuGOORrC6wMXy
         GYuW4U7eXtIBoFhFco9g1NqB+ok5gsEo7hNi2X5rSLbVJAUcm08DxKsKv52B+UVeZ6D9
         gRpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780456523; x=1781061323;
        h=to:cc:date:message-id:subject:mime-version
         :content-transfer-encoding:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=r5PaakmDObNtfyoDT6IPk/0GVwBbjH2Axz2rUNVenOg=;
        b=YByOcIh7T8Bhv1z/HUE0A688dD2F0i9XbhEcOUtpMrr6BXQ6s7/9gq8sZVf0013dSA
         2rr0sne6rhbdp6aWgj3zP0tb8whTNUBEOqC6oWX1C8vS7H5KycdlFRZAFh4d9eaTTuaJ
         VLJ5ZKAXX9ecL1Cu+zNWMnoAiIWbOO+g2J7draLtwUHfUAgB7MJF6AQLYNS+k6LcRrUO
         0F3gnA2Rwgf9zo44Tj9KDuySVa16eJHH44ncUlIjKcB4AiEa577JbR4/318hofmg9Fqa
         nXkBfYJXAlkH7ADtZt8754Ptvl+vf2rc1WAez4TlbrNqtjVrATuSwmGaSuOz9Tk2Pap3
         1UVg==
X-Gm-Message-State: AOJu0YyO1ZlGaXsaPHtVVkSrzvYZ9O3SGtwcNdvIV1bu4QzK7m6802zj
	5N+F1PHB2ptzIvSFv7cMiFAZCmZt5KBVFPURhGp2Fke4SFHIPwQrthI5
X-Gm-Gg: Acq92OEQhbs+7dm+HyNrs179cqWs94WxFUjRnZQyPEtWqiD+U5fZ/GJlCOTAWii3Wee
	ky8mqWd2V+5d/3rr31+06Sk/6GlgojlQ1QX7ExilsBhSbfmFxVxtmRZB/6kpkXrksbsf3gEPWj1
	Xp7Jjx3gG0WK93Z8VhiYN6KPbsT1TP4v0YKTrMxjFj44K3ax9mVZnMxyeUXvXGvIdxPm1z7Yvgi
	eC3TTrFf4h2Fx3rSRHBLANgGkZJOsSumDTUZNji31ywvj0xnN08m3bYnepOUbhDnXmuV3spurJK
	MsLnPqE5bgT1tOQyRLCyGM+LO8B0SNY0C+NJJNZURjo5ULc5MIqT8rBIilBtFrFl0mUHuxjFLIf
	+hOjoxmHKwgkNmdWIys/MMWsVxfvocTsLR9Mulk5tWCA13MOXn+nk/C9bwW4uwHcJ9c864oFNpE
	rH81nc6IKjxz3RL+tej2IAhiVTKtbo71g0hdnaCic495KD/br9AsF5vaHrERkgHYnhPOe6KFoTh
	GA=
X-Received: by 2002:ad4:5be8:0:b0:8cc:e965:a562 with SMTP id 6a1803df08f44-8cecdf0c010mr21134226d6.25.1780456522909;
        Tue, 02 Jun 2026 20:15:22 -0700 (PDT)
Received: from smtpclient.apple ([2601:985:4601:5df0:6079:17ed:fd11:8e45])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8cecd2629cesm8795536d6.41.2026.06.02.20.15.22
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 02 Jun 2026 20:15:22 -0700 (PDT)
From: Shuangpeng <shuangpeng.kernel@gmail.com>
Content-Type: text/plain;
	charset=utf-8
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3864.600.51.1.1\))
Subject: [BUG] KASAN: slab-use-after-free in pvr2_v4l2_dev_init
Message-Id: <6C2D160B-37DD-40F0-B8A2-089B8CAACB58@gmail.com>
Date: Tue, 2 Jun 2026 23:15:11 -0400
Cc: linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org
To: isely@pobox.com,
 mchehab@kernel.org
X-Mailer: Apple Mail (2.3864.600.51.1.1)
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MV_CASE(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-63473-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:linux-media@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:isely@pobox.com,m:mchehab@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[gmail.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[shuangpengkernel@gmail.com,linux-media@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[shuangpengkernel@gmail.com,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_NONE(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 6AA90633D53

Hi Kernel Maintainers,

I hit the following KASAN report while testing current upstream kernel:

KASAN: slab-use-after-free in pvr2_v4l2_dev_init

on commit: e8c2f9fdadee7cbc75134dc463c1e0d856d6e5c7 (May 25 2026)

The reproducer and .config files are here.
https://gist.github.com/shuangpengbai/1bb11709aa99114979c00138773e23f3

I=E2=80=99m happy to test debug patches or provide additional =
information.

Reported-by: Shuangpeng Bai <shuangpeng.kernel@gmail.com>


[  594.064526][ T2009] =
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
[  594.066061][ T2009] BUG: KASAN: slab-use-after-free in =
pvr2_v4l2_dev_init (drivers/media/usb/pvrusb2/pvrusb2-v4l2.c:1221)
[  594.067466][ T2009] Read of size 4 at addr ffff88810a2aa4b4 by task =
pvrusb2-context/2009
[  594.068813][ T2009]
[  594.069190][ T2009] Hardware name: QEMU Ubuntu 24.04 PC v2 (i440FX + =
PIIX, arch_caps fix, 1996), BIOS 1.16.3-debian-1.16.3-2 04/01/2014
[  594.069195][ T2009] Call Trace:
[  594.069199][ T2009]  <TASK>
[  594.069204][ T2009]  dump_stack_lvl (lib/dump_stack.c:94 =
lib/dump_stack.c:120)
[  594.069211][ T2009]  print_report (mm/kasan/report.c:378 =
mm/kasan/report.c:482)
[  594.069231][ T2009]  kasan_report (mm/kasan/report.c:595)
[  594.069243][ T2009]  pvr2_v4l2_dev_init =
(drivers/media/usb/pvrusb2/pvrusb2-v4l2.c:1221)
[  594.069263][ T2009]  pvr2_v4l2_create =
(drivers/media/usb/pvrusb2/pvrusb2-v4l2.c:1249)
[  594.069270][ T2009]  pvr_setup_attach =
(drivers/media/usb/pvrusb2/pvrusb2-main.c:40)
[  594.069275][ T2009]  pvr2_context_thread_func =
(drivers/media/usb/pvrusb2/pvrusb2-context.c:117 =
drivers/media/usb/pvrusb2/pvrusb2-context.c:158)
[  594.069333][ T2009]  kthread (kernel/kthread.c:436)
[  594.069351][ T2009]  ret_from_fork (arch/x86/kernel/process.c:158)
[  594.069375][ T2009]  ret_from_fork_asm =
(arch/x86/entry/entry_64.S:245)
[  594.069383][ T2009]  </TASK>
[  594.069385][ T2009]
[  594.087179][ T2009] Freed by task 2009 on cpu 1 at 594.064509s:
[  594.087705][ T2009]  kasan_save_track (mm/kasan/common.c:57 =
mm/kasan/common.c:78)
[  594.088130][ T2009]  kasan_save_free_info (mm/kasan/generic.c:584)
[  594.088566][ T2009]  __kasan_slab_free (mm/kasan/common.c:253 =
mm/kasan/common.c:285)
[  594.088980][ T2009]  kfree (./include/linux/kasan.h:235 =
mm/slub.c:2689 mm/slub.c:6251 mm/slub.c:6566)
[  594.089324][ T2009]  v4l2_device_release =
(drivers/media/v4l2-core/v4l2-dev.c:225)
[  594.089762][ T2009]  device_release =
(drivers/gpu/drm/vkms/vkms_configfs.c:690)
[  594.090164][ T2009]  kobject_put (lib/kobject.c:689 lib/kobject.c:720 =
./include/linux/kref.h:65 lib/kobject.c:737)
[  594.090544][ T2009]  __video_register_device =
(drivers/media/v4l2-core/v4l2-dev.c:1080)
[  594.091031][ T2009]  pvr2_v4l2_dev_init =
(./include/media/v4l2-dev.h:390 =
drivers/media/usb/pvrusb2/pvrusb2-v4l2.c:1218)
[  594.091460][ T2009]  pvr2_v4l2_create =
(drivers/media/usb/pvrusb2/pvrusb2-v4l2.c:1249)
[  594.091943][ T2009]  pvr_setup_attach =
(drivers/media/usb/pvrusb2/pvrusb2-main.c:40)
[  594.092348][ T2009]  pvr2_context_thread_func =
(drivers/media/usb/pvrusb2/pvrusb2-context.c:117 =
drivers/media/usb/pvrusb2/pvrusb2-context.c:158)
[  594.092825][ T2009]  kthread (kernel/kthread.c:436)
[  594.093188][ T2009]  ret_from_fork (arch/x86/kernel/process.c:158)
[  594.093587][ T2009]  ret_from_fork_asm =
(arch/x86/entry/entry_64.S:245)
[  594.094004][ T2009]
[  594.094213][ T2009] The buggy address belongs to the object at =
ffff88810a2aa000
[  594.094213][ T2009]  which belongs to the cache kmalloc-2k of size =
2048
[  594.095415][ T2009] The buggy address is located 1204 bytes inside of
[  594.095415][ T2009]  freed 2048-byte region [ffff88810a2aa000, =
ffff88810a2aa800)


Best,
Shuangpeng


