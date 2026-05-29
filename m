Return-Path: <linux-media+bounces-62996-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id tTiMBXrbGGpIoQgAu9opvQ
	(envelope-from <linux-media+bounces-62996-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 29 May 2026 02:19:06 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BE5F5FBAAB
	for <lists+linux-media@lfdr.de>; Fri, 29 May 2026 02:19:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id EE1723048DDB
	for <lists+linux-media@lfdr.de>; Fri, 29 May 2026 00:17:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 895D020468E;
	Fri, 29 May 2026 00:17:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Iz30MFDU"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qv1-f42.google.com (mail-qv1-f42.google.com [209.85.219.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96FC1175A6A
	for <linux-media@vger.kernel.org>; Fri, 29 May 2026 00:17:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780013875; cv=none; b=G0gGyqS+pga5CQ7XILfaLPhJyEi0ZdNjcAuSnf8XxyXX/qbXZRyK5dqNAn3ImgejtDdopa+Cb0hEVKL7Zik5qCWng6ypNZJiBYmvUkMwFmkc/0WXlixcLi6wEb9FS64EBlwBoYrywwD0tIZh1YwukQRXhdVRVPnGPbrghOGG5jc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780013875; c=relaxed/simple;
	bh=DXF0Z6/gzO4riLAC04rXXAqlY1Y5G9h4W4Mkub39fmE=;
	h=From:Content-Type:Mime-Version:Subject:Message-Id:Date:Cc:To; b=pQ42B/PFl3Lu2J6p0Z8wsbcoEWeSJAVwAmluvLU1Aj5MMjweTcwiXdMmznsptayLcZidecw9DQstG0JkrQ4MXaGCczLyqtIufuxbFv0rXzG8zoKkVQR6LTJibVZK0BOe7YS2T7qny9BDKo1veOKRSR0hYMJMiSDX8qTHjkoLZe4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Iz30MFDU; arc=none smtp.client-ip=209.85.219.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qv1-f42.google.com with SMTP id 6a1803df08f44-8b6dd874471so194187156d6.0
        for <linux-media@vger.kernel.org>; Thu, 28 May 2026 17:17:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780013872; x=1780618672; darn=vger.kernel.org;
        h=to:cc:date:message-id:subject:mime-version
         :content-transfer-encoding:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Jh+SF57kJ1ExDdlVGmKJbfwaub2nmewtDwy8NaAz/3o=;
        b=Iz30MFDUwlPIo7fS6s227fmLBC/z3kx565Eh7k+IYFwpef73VeY8LeQpvy7uX6f2AG
         2mlZ0Oe+AUv56vvU7Z40UwrNmaRjEjcdP4cu1vqxOMNYaQTVSrnlU1dd+9uNGQ9vljm7
         JJF4uGYPqhJgGjPPZccsqfMahWll59JMT775T5Zvzj99hv0O9klWV2dbTkIMzIY3n4AA
         HjrfPGujZdODQGNNGGV2LJfJNUGwmJOEZ/x8ECjZB+tqxHjzR5qzm8p+jNNHlMoxrTaa
         F0OjdS10mwQop7CqX0lMzvL6fGKZX4TvMs+c3MFlYBbWZ4F2xXfQAfyiYAjTeo9lX3tF
         oVoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780013872; x=1780618672;
        h=to:cc:date:message-id:subject:mime-version
         :content-transfer-encoding:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Jh+SF57kJ1ExDdlVGmKJbfwaub2nmewtDwy8NaAz/3o=;
        b=AZlOjLwzExikclkbMzFxMrQWgN4E8WJCQBTcUfEhd/BwU/uj66BX8hPVIUkJl+FCKQ
         h5ELhcK/sCyjirHA5lsOA22SuxZvQcZoIoqZQR924HZhdtiN8Djt3f3c1lngNrMFrl+q
         R2C/g+ViOIwjG38s0o8/7t3woknxHJBbTvypdujU903LLuVIgR4OekgwHhZoZbDotd+W
         +CDRWbsbn6d8EvHwqG5zWOVyJ4jlOq9YegByio0/9Jlo1JIm75RFykB45VHTPnYOnPR4
         6AlxK/IScU/7tJWwXaedU5JfwIgVkI5wf/sxBO0egRnuNHErPG/gBijKtattGnISOLjo
         //Cg==
X-Gm-Message-State: AOJu0Yz2HjIRqigzVEmFfZTeXpyLgAnr4cH/lRt6IT1qQ+co9YffuLWb
	zfZS66uNIrxWzpMbOMADXTI04aWEBVBjWC4y/lioQJXvd/ZG/0Z+UCkZLrcBOWgV
X-Gm-Gg: Acq92OFjA6iohMoA11dm5qPAqelIQKSlXRKD62h3Ubq+njlhWb7TFgVO25Sbe/6Vene
	1k9fx8miUT8iOJA3GJ+111hL/+YBaaUiHZFIK1ISsdrKtj2L5WgBOSsiQBZ1qWy2rfxh3Ml4+/h
	WWTkG2oYh0F04HORR/qJHiHEapbfj31ZdZCDO+yVnt8Q2G7XtmfJXaGBQu0BsFUhPwKkM9Yzk1X
	ytz4qQUUUM46yRYpcl53v48mwKRuO7XokqazDtXYwL6zI4XlmAcce9zjcx6IzyoUbYlV0KotqP3
	BUc/BvldZsycdzFM3h85OTWwfz2rG2ZW4bPppSeJ5VhFkTGmKkOL9Skbqf9V94nRGkQd0yj1OAB
	JVVkayelCXkL1VgjNGKz4qKr4YOH8mvZPrhgxLPAGXBnZrrAl8H0TBkWgMY2TAFRUx8zvPLAdiv
	/rpJuZGoRIIqgggdDBbW9DkHVvgFtoLlr46EVJeSh3K1Wi9JvPEos/tFnu6Hmkr4X6ZrczKCaj9
	V4=
X-Received: by 2002:a05:6214:5903:b0:8cb:e65d:bed5 with SMTP id 6a1803df08f44-8cce7eaa7ddmr6234836d6.13.1780013872349;
        Thu, 28 May 2026 17:17:52 -0700 (PDT)
Received: from smtpclient.apple ([2601:985:4601:5df0:bd13:5c67:2229:42bb])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8cce89fa04bsm1930206d6.20.2026.05.28.17.17.51
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 28 May 2026 17:17:52 -0700 (PDT)
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
Subject: [BUG] KASAN: slab-use-after-free in au0828_dvb_register
Message-Id: <AAC17221-93BF-436F-92AC-906A18F882F0@gmail.com>
Date: Thu, 28 May 2026 20:17:40 -0400
Cc: linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org
To: mchehab@kernel.org,
 mingo@kernel.org,
 hverkuil+cisco@kernel.org,
 tglx@kernel.org,
 brad@nextdimension.cc
X-Mailer: Apple Mail (2.3864.600.51.1.1)
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	MV_CASE(0.50)[];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-62996-lists,linux-media=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[shuangpengkernel@gmail.com,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_NONE(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,cisco];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Queue-Id: 5BE5F5FBAAB
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Kernel Maintainers,

We hit the following KASAN report while testing current upstream kernel:

KASAN: slab-use-after-free in au0828_dvb_register

on commit: e8c2f9fdadee7cbc75134dc463c1e0d856d6e5c7 (May 25 2026)

The reproducer and .config files are here.
https://gist.github.com/shuangpengbai/c31163f8ef234ba4fe85038c2f97f9cc

I=E2=80=99m happy to test debug patches or provide additional =
information.

Reported-by: Shuangpeng Bai <shuangpeng.kernel@gmail.com>


[  141.481576][   T48] =
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
[  141.482348][   T48] BUG: KASAN: slab-use-after-free in =
au0828_dvb_register (drivers/media/usb/au0828/au0828-dvb.c:636)
[  141.483148][   T48] Read of size 8 at addr ffff888171d4a118 by task =
kworker/1:1/48
[  141.483903][   T48]
[  141.484144][   T48] Hardware name: QEMU Ubuntu 24.04 PC v2 (i440FX + =
PIIX, arch_caps fix, 1996), BIOS 1.16.34
[  141.484148][   T48] Workqueue: usb_hub_wq hub_event
[  141.484154][   T48] Call Trace:
[  141.484157][   T48]  <TASK>
[  141.484159][   T48]  dump_stack_lvl (lib/dump_stack.c:94 =
lib/dump_stack.c:120)
[  141.484164][   T48]  print_report (mm/kasan/report.c:378 =
mm/kasan/report.c:482)
[  141.484177][   T48]  kasan_report (mm/kasan/report.c:595)
[  141.484183][   T48]  au0828_dvb_register =
(drivers/media/usb/au0828/au0828-dvb.c:636)
[  141.484190][   T48]  au0828_usb_probe =
(drivers/media/usb/au0828/au0828-core.c:733)
[  141.484193][   T48]  usb_probe_interface =
(drivers/usb/core/driver.c:396)
[  141.484198][   T48]  really_probe (drivers/base/dd.c:? =
drivers/base/dd.c:709)
[  141.484204][   T48]  __driver_probe_device (drivers/base/dd.c:871)
[  141.484207][   T48]  driver_probe_device (drivers/base/dd.c:901)
[  141.484211][   T48]  __device_attach_driver (drivers/base/dd.c:1029)
[  141.484217][   T48]  bus_for_each_drv (drivers/base/bus.c:500)
[  141.484264][   T48]  __device_attach (drivers/base/dd.c:1101)
[  141.484289][   T48]  device_initial_probe (drivers/base/dd.c:1156)
[  141.484292][   T48]  bus_probe_device (drivers/base/bus.c:613)
[  141.484296][   T48]  device_add (drivers/base/core.c:3706)
[  141.484299][   T48]  usb_set_configuration =
(drivers/usb/core/message.c:2268)
[  141.484303][   T48]  usb_generic_driver_probe =
(drivers/usb/core/generic.c:250)
[  141.484308][   T48]  usb_probe_device (drivers/usb/core/driver.c:291)
[  141.484311][   T48]  really_probe (drivers/base/dd.c:? =
drivers/base/dd.c:709)
[  141.484315][   T48]  __driver_probe_device (drivers/base/dd.c:871)
[  141.484318][   T48]  driver_probe_device (drivers/base/dd.c:901)
[  141.484321][   T48]  __device_attach_driver (drivers/base/dd.c:1029)
[  141.484328][   T48]  bus_for_each_drv (drivers/base/bus.c:500)
[  141.484346][   T48]  __device_attach (drivers/base/dd.c:1101)
[  141.484367][   T48]  device_initial_probe (drivers/base/dd.c:1156)
[  141.484370][   T48]  bus_probe_device (drivers/base/bus.c:613)
[  141.484374][   T48]  device_add (drivers/base/core.c:3706)
[  141.484376][   T48]  usb_new_device (drivers/usb/core/hub.c:2695)
[  141.484386][   T48]  hub_event (drivers/usb/core/hub.c:5567 =
drivers/usb/core/hub.c:5707 drivers/usb/core/hub.c:5871 =
drivers/usb/core/hub.c:5953)
[  141.484406][   T48]  process_scheduled_works (kernel/workqueue.c:3314 =
kernel/workqueue.c:3397)
[  141.484412][   T48]  worker_thread (kernel/workqueue.c:3478)
[  141.484420][   T48]  kthread (kernel/kthread.c:436)
[  141.484431][   T48]  ret_from_fork (arch/x86/kernel/process.c:158)
[  141.484445][   T48]  ret_from_fork_asm =
(arch/x86/entry/entry_64.S:245)
[  141.484450][   T48]  </TASK>
[  141.484451][   T48]
[  141.523531][   T48] Freed by task 48 on cpu 1 at 141.481575s:
[  141.524120][   T48]  kasan_save_track (mm/kasan/common.c:57 =
mm/kasan/common.c:78)
[  141.524594][   T48]  kasan_save_free_info (mm/kasan/generic.c:584)
[  141.525089][   T48]  __kasan_slab_free (mm/kasan/common.c:253 =
mm/kasan/common.c:285)
[  141.525570][   T48]  kfree (./include/linux/kasan.h:235 =
mm/slub.c:2689 mm/slub.c:6251 mm/slub.c:6566)
[  141.525957][   T48]  au8522_release_state =
(drivers/media/dvb-frontends/au8522_common.c:124)
[  141.526467][   T48]  dvb_frontend_put =
(drivers/media/dvb-core/dvb_frontend.c:3093 =
drivers/media/dvb-core/dvb_frontend.c:141 =
drivers/media/dvb-core/dvb_frontend.c:166)
[  141.526957][   T48]  au0828_dvb_register =
(drivers/media/usb/au0828/au0828-dvb.c:518 =
drivers/media/usb/au0828/au0828-dvb.c:634)
[  141.527469][   T48]  au0828_usb_probe =
(drivers/media/usb/au0828/au0828-core.c:733)
[  141.527952][   T48]  usb_probe_interface =
(drivers/usb/core/driver.c:396)
[  141.528455][   T48]  really_probe (drivers/base/dd.c:? =
drivers/base/dd.c:709)
[  141.528908][   T48]  __driver_probe_device (drivers/base/dd.c:871)
[  141.529426][   T48]  driver_probe_device (drivers/base/dd.c:901)
[  141.529932][   T48]  __device_attach_driver (drivers/base/dd.c:1029)
[  141.530459][   T48]  bus_for_each_drv (drivers/base/bus.c:500)
[  141.530949][   T48]  __device_attach (drivers/base/dd.c:1101)
[  141.531419][   T48]  device_initial_probe (drivers/base/dd.c:1156)
[  141.531923][   T48]  bus_probe_device (drivers/base/bus.c:613)
[  141.532404][   T48]  device_add (drivers/base/core.c:3706)
[  141.532840][   T48]  usb_set_configuration =
(drivers/usb/core/message.c:2268)
[  141.533373][   T48]  usb_generic_driver_probe =
(drivers/usb/core/generic.c:250)
[  141.533907][   T48]  usb_probe_device (drivers/usb/core/driver.c:291)
[  141.534377][   T48]  really_probe (drivers/base/dd.c:? =
drivers/base/dd.c:709)
[  141.534833][   T48]  __driver_probe_device (drivers/base/dd.c:871)
[  141.535352][   T48]  driver_probe_device (drivers/base/dd.c:901)
[  141.535856][   T48]  __device_attach_driver (drivers/base/dd.c:1029)
[  141.536384][   T48]  bus_for_each_drv (drivers/base/bus.c:500)
[  141.536869][   T48]  __device_attach (drivers/base/dd.c:1101)
[  141.537340][   T48]  device_initial_probe (drivers/base/dd.c:1156)
[  141.537839][   T48]  bus_probe_device (drivers/base/bus.c:613)
[  141.538320][   T48]  device_add (drivers/base/core.c:3706)
[  141.538753][   T48]  usb_new_device (drivers/usb/core/hub.c:2695)
[  141.539226][   T48]  hub_event (drivers/usb/core/hub.c:5567 =
drivers/usb/core/hub.c:5707 drivers/usb/core/hub.c:5871 =
drivers/usb/core/hub.c:5953)
[  141.539672][   T48]  process_scheduled_works (kernel/workqueue.c:3314 =
kernel/workqueue.c:3397)
[  141.540205][   T48]  worker_thread (kernel/workqueue.c:3478)
[  141.540666][   T48]  kthread (kernel/kthread.c:436)
[  141.541069][   T48]  ret_from_fork (arch/x86/kernel/process.c:158)
[  141.541524][   T48]  ret_from_fork_asm =
(arch/x86/entry/entry_64.S:245)
[  141.541999][   T48]
[  141.542236][   T48] The buggy address belongs to the object at =
ffff888171d4a000
[  141.542236][   T48]  which belongs to the cache kmalloc-4k of size =
4096
[  141.543602][   T48] The buggy address is located 280 bytes inside of
[  141.543602][   T48]  freed 4096-byte region [ffff888171d4a000, =
ffff888171d4b000)



Best,
Shuangpeng


