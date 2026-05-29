Return-Path: <linux-media+bounces-63017-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SIRBBoNQGWrzuQgAu9opvQ
	(envelope-from <linux-media+bounces-63017-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 29 May 2026 10:38:27 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 79E225FF4F4
	for <lists+linux-media@lfdr.de>; Fri, 29 May 2026 10:38:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id CC7A731102A5
	for <lists+linux-media@lfdr.de>; Fri, 29 May 2026 08:35:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1F7A33B47D7;
	Fri, 29 May 2026 08:35:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=foxmail.com header.i=@foxmail.com header.b="M2DEUgOV"
X-Original-To: linux-media@vger.kernel.org
Received: from out203-205-221-210.mail.qq.com (out203-205-221-210.mail.qq.com [203.205.221.210])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F7AA3A9625;
	Fri, 29 May 2026 08:35:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.205.221.210
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780043710; cv=none; b=orTn5u0yAUUF2McQyptPANW9eucbDLsyrJ3Oj03iNXo9yh8wjF5N8xlPg2fResa8WcY51k5im4/ReKZRN82JejaSS59UQq8NqB+6D3kNlN46LOHxelwB3hM/VwNw3pFbfywjKSnW7cCQSYFtrQGf33niPDjze6W9mPHRY/nM3uQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780043710; c=relaxed/simple;
	bh=ZFpNFnBKLB7vOlrUAAx2HAPGd+C7ABB+slCfe9aFfGk=;
	h=Message-ID:From:To:Cc:Subject:Date:In-Reply-To:References:
	 MIME-Version:Content-Type; b=nGP+x2apklF1JJmeBlOrzHvsr1x2VlBswgUbH3rFs09nx5FeUGcWnwwbQ7E8qwxrQEWOwhrmE7qNTW3HIepcWrE+rOnBlBuFeHu4R0EP2DgvR2/+jGix+nUwjqDuUJ7/RfegNf+mv+vGfV53jWO0xCSswKWSoR8wYcpNAMGnMV8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foxmail.com; spf=pass smtp.mailfrom=foxmail.com; dkim=pass (1024-bit key) header.d=foxmail.com header.i=@foxmail.com header.b=M2DEUgOV; arc=none smtp.client-ip=203.205.221.210
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foxmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foxmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foxmail.com;
	s=s201512; t=1780043699;
	bh=zlCPB78MDMlErlTgDazXad+UAsiLpuXdCinw7PeD1IM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=M2DEUgOVcioM4lrrVZV8FHIwXB4wume7ttuaR09/fXajKMabEp77C5lH9i93Up4HO
	 OoLY7NvgjaJurASvyS6WprE1wntCc0KmYU4JdEnqp2HaxAwLn0/zHVEuTAhMfjXSky
	 GRkoTpVyvR5nxQV8MtTolgV+VfWNl5V2acaxXa1M=
Received: from localhost.localdomain ([116.128.244.169])
	by newxmesmtplogicsvrszb43-0.qq.com (NewEsmtp) with SMTP
	id 7D10BE62; Fri, 29 May 2026 16:31:17 +0800
X-QQ-mid: xmsmtpt1780043477tu8f6qdjn
Message-ID: <tencent_6DDC3554CD90D85E21277073C6AE67116F08@qq.com>
X-QQ-XMAILINFO: MJf32pulH481N+hnGHe0Jimnz09D00sEZlOMlBwWqK/dq8BRiVBa12vLxzNkln
	 AfisXqUlmv1Ydb6eRPjGtLMKtkGQ6AIm6KutLyeszIufj8IVFUzk+VRAGUYv7hfjXcEI1Nu5o/D+
	 Ta5UdOYSBZ9zzp3HQ4Hpa0GXVJ+ZYhN4AdiZ0t8p5URRjI/MkE9/pKoDwy9P0v4WiJVRFWKqsatO
	 Mgg8g80bbQSQvmZRF7k76Vhf97bjeOeWez+fGbmxc9KR8f0duVbY96V+VKEBU7LI6WeWEqwR6Uq6
	 zAj6AOVDCx4tz6sVpOQFyEq54NZj/QKYbJdA6HHsxKYeRuB40sutCqQ87dUJIt9/d1LHq00LMZWi
	 49Gzyv6ZsjhpIL42omOi79IFeo2AqhkD77+nJUTd6EA2IBg6QuBF0Dh31oi+7E0XdSPXez45fDQ1
	 AFDaIDjkqzXVZpn/bkTz06ahxxnit4uVlo+yJEjV0IiVI1GQWGQ/vCp/4637V5uexKx1t0m2em1X
	 G8BSIUbXeDrFWzW7gCAqe5zZm0mtPhs/lTWQ7cPOJFbXJCXCKb6lYpZ9wbatS6mabOpqnf+R4mUy
	 WxHrCfLlg1wJ3satZS5vXsEUFGoeZKjsTWeh0rPyC8ij7CvWhoY5gP+aqMWrqs01w615EMbwpwPX
	 IMXK9OA7d5dbI4ZqXH6TcpPP38OwuDNN70IbPQgqHoSd9n+KPLrWa9PQj0Ajrk2LDMKzkmYra6fE
	 Okl/5XKmkoToIYpXD9Ju/l10scfJs+SeCZ6MGHLF1FrTLTcZxHqA/KX4+mAQTTn1sTsk2qfEyryI
	 k6fJRLYpqIzIcpwObaY+GeuuVCu6njXD7T61Ktnpbm5ICWAxxQ4/wFxvLPYvYltnAUfXlOFU7Pwh
	 9UobchH3+yily4Qj5E+e/jFpilOKWGnLVvf3uqtp9AXw6sZwIVPAgYLgNPsIJjnr5AqeklkHttuF
	 x5+oQrpoOsdDIXw2aVOxZTLB1mFzW8YAYp3IagiYDM0kftJhHyOE3eLmhRlxn7i2X0+jQiyuItXa
	 +uyC61ZU1uaUC9E51qqKCeypeeR6s=
X-QQ-XMRINFO: OD9hHCdaPRBwH5bRRRw8tsiH4UAatJqXfg==
From: xiaopeitux@foxmail.com
To: shuangpeng.kernel@gmail.com
Cc: brad@nextdimension.cc,
	hverkuil+cisco@kernel.org,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	mchehab@kernel.org,
	mingo@kernel.org,
	tglx@kernel.org,
	Pei Xiao <xiaopei01@kylinos.cn>
Subject: Re:[BUG] KASAN: slab-use-after-free in au0828_dvb_register
Date: Fri, 29 May 2026 16:30:54 +0800
X-OQ-MSGID: <cover.1779876412.git.xiaopei01@kylinos.cn>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <AAC17221-93BF-436F-92AC-906A18F882F0@gmail.com>
References: <AAC17221-93BF-436F-92AC-906A18F882F0@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[foxmail.com,none];
	R_DKIM_ALLOW(-0.20)[foxmail.com:s=s201512];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-63017-lists,linux-media=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[xiaopeitux@foxmail.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[foxmail.com];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	DKIM_TRACE(0.00)[foxmail.com:+];
	RCPT_COUNT_SEVEN(0.00)[9];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-media,cisco];
	FROM_NO_DN(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[kylinos.cn:email,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,foxmail.com:dkim,qq.com:mid]
X-Rspamd-Queue-Id: 79E225FF4F4
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Pei Xiao <xiaopei01@kylinos.cn>

> Hi Kernel Maintainers,
>
> We hit the following KASAN report while testing current upstream kernel:
>
> KASAN: slab-use-after-free in au0828_dvb_register
>
> on commit: e8c2f9fdadee7cbc75134dc463c1e0d856d6e5c7 (May 25 2026)
>
> The reproducer and .config files are here.
> https://gist.github.com/shuangpengbai/c31163f8ef234ba4fe85038c2f97f9cc
>
> I’m happy to test debug patches or provide additional information.
>
> Reported-by: Shuangpeng Bai <shuangpeng.kernel@gmail.com>
Can you help post all the crash logs? 
Does the kernel log have this print: 
"The frontend of your DVB/ATSC card isn't supported yet." 
Please help post all the logs, thank you!

>
>
> [  141.481576][   T48] ==================================================================
> [  141.482348][   T48] BUG: KASAN: slab-use-after-free in au0828_dvb_register (drivers/media/usb/au0828/au0828-dvb.c:636)
> [  141.483148][   T48] Read of size 8 at addr ffff888171d4a118 by task kworker/1:1/48
> [  141.483903][   T48]
> [  141.484144][   T48] Hardware name: QEMU Ubuntu 24.04 PC v2 (i440FX + PIIX, arch_caps fix, 1996), BIOS 1.16.34
> [  141.484148][   T48] Workqueue: usb_hub_wq hub_event
> [  141.484154][   T48] Call Trace:
> [  141.484157][   T48]  <TASK>
> [  141.484159][   T48]  dump_stack_lvl (lib/dump_stack.c:94 lib/dump_stack.c:120)
> [  141.484164][   T48]  print_report (mm/kasan/report.c:378 mm/kasan/report.c:482)
> [  141.484177][   T48]  kasan_report (mm/kasan/report.c:595)
> [  141.484183][   T48]  au0828_dvb_register (drivers/media/usb/au0828/au0828-dvb.c:636)
> [  141.484190][   T48]  au0828_usb_probe (drivers/media/usb/au0828/au0828-core.c:733)
> [  141.484193][   T48]  usb_probe_interface (drivers/usb/core/driver.c:396)
> [  141.484198][   T48]  really_probe (drivers/base/dd.c:? drivers/base/dd.c:709)
> [  141.484204][   T48]  __driver_probe_device (drivers/base/dd.c:871)
> [  141.484207][   T48]  driver_probe_device (drivers/base/dd.c:901)
> [  141.484211][   T48]  __device_attach_driver (drivers/base/dd.c:1029)
> [  141.484217][   T48]  bus_for_each_drv (drivers/base/bus.c:500)
> [  141.484264][   T48]  __device_attach (drivers/base/dd.c:1101)
> [  141.484289][   T48]  device_initial_probe (drivers/base/dd.c:1156)
> [  141.484292][   T48]  bus_probe_device (drivers/base/bus.c:613)
> [  141.484296][   T48]  device_add (drivers/base/core.c:3706)
> [  141.484299][   T48]  usb_set_configuration (drivers/usb/core/message.c:2268)
> [  141.484303][   T48]  usb_generic_driver_probe (drivers/usb/core/generic.c:250)
> [  141.484308][   T48]  usb_probe_device (drivers/usb/core/driver.c:291)
> [  141.484311][   T48]  really_probe (drivers/base/dd.c:? drivers/base/dd.c:709)
> [  141.484315][   T48]  __driver_probe_device (drivers/base/dd.c:871)
> [  141.484318][   T48]  driver_probe_device (drivers/base/dd.c:901)
> [  141.484321][   T48]  __device_attach_driver (drivers/base/dd.c:1029)
> [  141.484328][   T48]  bus_for_each_drv (drivers/base/bus.c:500)
> [  141.484346][   T48]  __device_attach (drivers/base/dd.c:1101)
> [  141.484367][   T48]  device_initial_probe (drivers/base/dd.c:1156)
> [  141.484370][   T48]  bus_probe_device (drivers/base/bus.c:613)
> [  141.484374][   T48]  device_add (drivers/base/core.c:3706)
> [  141.484376][   T48]  usb_new_device (drivers/usb/core/hub.c:2695)
> [  141.484386][   T48]  hub_event (drivers/usb/core/hub.c:5567 drivers/usb/core/hub.c:5707 drivers/usb/core/hub.c:5871 drivers/usb/core/hub.c:5953)
> [  141.484406][   T48]  process_scheduled_works (kernel/workqueue.c:3314 kernel/workqueue.c:3397)
> [  141.484412][   T48]  worker_thread (kernel/workqueue.c:3478)
> [  141.484420][   T48]  kthread (kernel/kthread.c:436)
> [  141.484431][   T48]  ret_from_fork (arch/x86/kernel/process.c:158)
> [  141.484445][   T48]  ret_from_fork_asm (arch/x86/entry/entry_64.S:245)
> [  141.484450][   T48]  </TASK>
> [  141.484451][   T48]
> [  141.523531][   T48] Freed by task 48 on cpu 1 at 141.481575s:
> [  141.524120][   T48]  kasan_save_track (mm/kasan/common.c:57 mm/kasan/common.c:78)
> [  141.524594][   T48]  kasan_save_free_info (mm/kasan/generic.c:584)
> [  141.525089][   T48]  __kasan_slab_free (mm/kasan/common.c:253 mm/kasan/common.c:285)
> [  141.525570][   T48]  kfree (./include/linux/kasan.h:235 mm/slub.c:2689 mm/slub.c:6251 mm/slub.c:6566)
> [  141.525957][   T48]  au8522_release_state (drivers/media/dvb-frontends/au8522_common.c:124)
> [  141.526467][   T48]  dvb_frontend_put (drivers/media/dvb-core/dvb_frontend.c:3093 drivers/media/dvb-core/dvb_frontend.c:141 drivers/media/dvb-core/dvb_frontend.c:166)
> [  141.526957][   T48]  au0828_dvb_register (drivers/media/usb/au0828/au0828-dvb.c:518 drivers/media/usb/au0828/au0828-dvb.c:634)
> [  141.527469][   T48]  au0828_usb_probe (drivers/media/usb/au0828/au0828-core.c:733)
> [  141.527952][   T48]  usb_probe_interface (drivers/usb/core/driver.c:396)
> [  141.528455][   T48]  really_probe (drivers/base/dd.c:? drivers/base/dd.c:709)
> [  141.528908][   T48]  __driver_probe_device (drivers/base/dd.c:871)
> [  141.529426][   T48]  driver_probe_device (drivers/base/dd.c:901)
> [  141.529932][   T48]  __device_attach_driver (drivers/base/dd.c:1029)
> [  141.530459][   T48]  bus_for_each_drv (drivers/base/bus.c:500)
> [  141.530949][   T48]  __device_attach (drivers/base/dd.c:1101)
> [  141.531419][   T48]  device_initial_probe (drivers/base/dd.c:1156)
> [  141.531923][   T48]  bus_probe_device (drivers/base/bus.c:613)
> [  141.532404][   T48]  device_add (drivers/base/core.c:3706)
> [  141.532840][   T48]  usb_set_configuration (drivers/usb/core/message.c:2268)
> [  141.533373][   T48]  usb_generic_driver_probe (drivers/usb/core/generic.c:250)
> [  141.533907][   T48]  usb_probe_device (drivers/usb/core/driver.c:291)
> [  141.534377][   T48]  really_probe (drivers/base/dd.c:? drivers/base/dd.c:709)
> [  141.534833][   T48]  __driver_probe_device (drivers/base/dd.c:871)
> [  141.535352][   T48]  driver_probe_device (drivers/base/dd.c:901)
> [  141.535856][   T48]  __device_attach_driver (drivers/base/dd.c:1029)
> [  141.536384][   T48]  bus_for_each_drv (drivers/base/bus.c:500)
> [  141.536869][   T48]  __device_attach (drivers/base/dd.c:1101)
> [  141.537340][   T48]  device_initial_probe (drivers/base/dd.c:1156)
> [  141.537839][   T48]  bus_probe_device (drivers/base/bus.c:613)
> [  141.538320][   T48]  device_add (drivers/base/core.c:3706)
> [  141.538753][   T48]  usb_new_device (drivers/usb/core/hub.c:2695)
> [  141.539226][   T48]  hub_event (drivers/usb/core/hub.c:5567 drivers/usb/core/hub.c:5707 drivers/usb/core/hub.c:5871 drivers/usb/core/hub.c:5953)
> [  141.539672][   T48]  process_scheduled_works (kernel/workqueue.c:3314 kernel/workqueue.c:3397)
> [  141.540205][   T48]  worker_thread (kernel/workqueue.c:3478)
> [  141.540666][   T48]  kthread (kernel/kthread.c:436)
> [  141.541069][   T48]  ret_from_fork (arch/x86/kernel/process.c:158)
> [  141.541524][   T48]  ret_from_fork_asm (arch/x86/entry/entry_64.S:245)
> [  141.541999][   T48]
> [  141.542236][   T48] The buggy address belongs to the object at ffff888171d4a000
> [  141.542236][   T48]  which belongs to the cache kmalloc-4k of size 4096
> [  141.543602][   T48] The buggy address is located 280 bytes inside of
> [  141.543602][   T48]  freed 4096-byte region [ffff888171d4a000, ffff888171d4b000)


