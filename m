Return-Path: <linux-media+bounces-26448-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 509B1A3D87F
	for <lists+linux-media@lfdr.de>; Thu, 20 Feb 2025 12:26:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 943AF19C2CC1
	for <lists+linux-media@lfdr.de>; Thu, 20 Feb 2025 11:25:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0F71E1F868C;
	Thu, 20 Feb 2025 11:20:03 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from exchange.fintech.ru (exchange.fintech.ru [195.54.195.159])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 674A21F540C;
	Thu, 20 Feb 2025 11:19:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.54.195.159
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740050402; cv=none; b=Ct8HxbIh0lvVl1Ze3ZiLiw3VUCTSHrM8Q/ydFVPlaSIw3MWLmcMBpW6xM9n3uZlq1yN8k1UmP+Ug86EjuntDERWNu4Eljicup7pjMp28d9ToazLC3Um8lIUMs0wyu3y2eeb7gwncXeSi3FHgyPlaJdArEDmOgiEzC0KzJsKWAk4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740050402; c=relaxed/simple;
	bh=NDdWMhGsVv5SnCqjh/JMa7aBl97LCJ5tTwMBPTYOerU=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=iY7c1a79cYYd5dvTL2sm5XUTZKhXpQf9xkHC1pupxQQArWTpsZziHkztVE3xnsFcbl+39g6XZDpK3DxnaRhShhxatAX7TrnGD8dJrPkBe3Q87BPKc9IBdOp/6FvnyDdtSVCqCIaTpp5EhbgxWG/FR9zlG35RtDDRCT4KmPOT1Ag=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fintech.ru; spf=pass smtp.mailfrom=fintech.ru; arc=none smtp.client-ip=195.54.195.159
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fintech.ru
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fintech.ru
Received: from Ex16-01.fintech.ru (10.0.10.18) by exchange.fintech.ru
 (195.54.195.169) with Microsoft SMTP Server (TLS) id 14.3.498.0; Thu, 20 Feb
 2025 14:19:50 +0300
Received: from [192.168.211.132] (10.0.253.138) by Ex16-01.fintech.ru
 (10.0.10.18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2242.4; Thu, 20 Feb
 2025 14:19:49 +0300
Message-ID: <16dba069-119f-4556-befa-0f3db626eada@fintech.ru>
Date: Thu, 20 Feb 2025 14:19:46 +0300
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] media: usb: hackrf: fix device unregister order in
 hackrf_probe()
To: Mauro Carvalho Chehab <mchehab@kernel.org>, Hans Verkuil
	<hverkuil@xs4all.nl>
CC: <linux-media@vger.kernel.org>,
	<syzbot+6b52c2b24e341804a58c@syzkaller.appspotmail.com>,
	<syzkaller-bugs@googlegroups.com>, <linux-kernel@vger.kernel.org>,
	<lvc-project@linuxtesting.org>
References: <20250213182608.757954-1-n.zhandarovich@fintech.ru>
From: Nikita Zhandarovich <n.zhandarovich@fintech.ru>
Content-Language: en-US
In-Reply-To: <20250213182608.757954-1-n.zhandarovich@fintech.ru>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: Ex16-02.fintech.ru (10.0.10.19) To Ex16-01.fintech.ru
 (10.0.10.18)

Hi, please disregard my patch for following reasons:

1) The issue at hand isn't addressed properly - looking back I haven't
properly identified root cause and my fix is flawed.
2) Even if the approach is correct, I messed up the move of the label
err_v4l2_device_unregister. If video_register_device(&dev->rx_vdev,...)
fails we skip necessary deregistering steps.

I'll attempt to come up with a better solution, thank you for your
patience.

Regards,
Nikita

On 2/13/25 21:26, Nikita Zhandarovich wrote:
> Syzkaller reports [1] a slab-use-after-free error identified by KASAN
> sanitizer and most likely caused by the wrong order of device
> unregister steps once a call to video_register_device() fails.
> 
> Fix aforementioned flaw by first freeing control and reference
> handlers, only then dealing with dev->v4l2_dev() via
> v4l2_device_unregister().
> 
> [1] Syzkaller (partial) report:
> BUG: KASAN: slab-use-after-free in v4l2_release+0x3e2/0x460 drivers/media/v4l2-core/v4l2-dev.c:453
> Read of size 8 at addr ffff8880502e80c8 by task v4l_id/7854
> ...
> Call Trace:
>  <TASK>
>  __dump_stack lib/dump_stack.c:94 [inline]
>  dump_stack_lvl+0x116/0x1f0 lib/dump_stack.c:120
>  print_address_description mm/kasan/report.c:377 [inline]
>  print_report+0xc3/0x620 mm/kasan/report.c:488
>  kasan_report+0xd9/0x110 mm/kasan/report.c:601
>  v4l2_release+0x3e2/0x460 drivers/media/v4l2-core/v4l2-dev.c:453
>  __fput+0x3f6/0xb60 fs/file_table.c:431
>  __fput_sync+0x45/0x50 fs/file_table.c:516
>  __do_sys_close fs/open.c:1567 [inline]
>  __se_sys_close fs/open.c:1552 [inline]
>  __x64_sys_close+0x86/0x100 fs/open.c:1552
>  do_syscall_x64 arch/x86/entry/common.c:52 [inline]
>  do_syscall_64+0xcd/0x250 arch/x86/entry/common.c:83
>  entry_SYSCALL_64_after_hwframe+0x77/0x7f
> ...
> 
> Allocated by task 6058:
>  kasan_save_stack+0x33/0x60 mm/kasan/common.c:47
>  kasan_save_track+0x14/0x30 mm/kasan/common.c:68
>  poison_kmalloc_redzone mm/kasan/common.c:377 [inline]
>  __kasan_kmalloc+0xaa/0xb0 mm/kasan/common.c:394
>  kmalloc_noprof include/linux/slab.h:878 [inline]
>  kzalloc_noprof include/linux/slab.h:1014 [inline]
>  hackrf_probe+0xd1/0x1cf0 drivers/media/usb/hackrf/hackrf.c:1353
>  usb_probe_interface+0x309/0x9d0 drivers/usb/core/driver.c:399
> ...
> 
> Freed by task 6058:
>  kasan_save_stack+0x33/0x60 mm/kasan/common.c:47
>  kasan_save_track+0x14/0x30 mm/kasan/common.c:68
>  kasan_save_free_info+0x3b/0x60 mm/kasan/generic.c:579
>  poison_slab_object mm/kasan/common.c:247 [inline]
>  __kasan_slab_free+0x51/0x70 mm/kasan/common.c:264
>  kasan_slab_free include/linux/kasan.h:230 [inline]
>  slab_free_hook mm/slub.c:2342 [inline]
>  slab_free mm/slub.c:4579 [inline]
>  kfree+0x14f/0x4b0 mm/slub.c:4727
>  hackrf_probe+0x4c9/0x1cf0 drivers/media/usb/hackrf/hackrf.c:1525
>  usb_probe_interface+0x309/0x9d0 drivers/usb/core/driver.c:399
> ...
> 
> Reported-by: syzbot+6b52c2b24e341804a58c@syzkaller.appspotmail.com
> Closes: https://syzkaller.appspot.com/bug?extid=6b52c2b24e341804a58c
> Fixes: 8bc4a9ed8504 ("[media] hackrf: add support for transmitter")
> Cc: stable@vger.kernel.org
> Signed-off-by: Nikita Zhandarovich <n.zhandarovich@fintech.ru>
> ---
> v1 -> v2: fix overlong lines in patch description to remove warnings
> from checkpatch.
> 
>  drivers/media/usb/hackrf/hackrf.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/media/usb/hackrf/hackrf.c b/drivers/media/usb/hackrf/hackrf.c
> index 0b50de8775a3..bc910b35f605 100644
> --- a/drivers/media/usb/hackrf/hackrf.c
> +++ b/drivers/media/usb/hackrf/hackrf.c
> @@ -1513,12 +1513,12 @@ static int hackrf_probe(struct usb_interface *intf,
>  	return 0;
>  err_video_unregister_device_rx:
>  	video_unregister_device(&dev->rx_vdev);
> -err_v4l2_device_unregister:
> -	v4l2_device_unregister(&dev->v4l2_dev);
>  err_v4l2_ctrl_handler_free_tx:
>  	v4l2_ctrl_handler_free(&dev->tx_ctrl_handler);
>  err_v4l2_ctrl_handler_free_rx:
>  	v4l2_ctrl_handler_free(&dev->rx_ctrl_handler);
> +err_v4l2_device_unregister:
> +	v4l2_device_unregister(&dev->v4l2_dev);
>  err_kfree:
>  	kfree(dev);
>  err:
> 


