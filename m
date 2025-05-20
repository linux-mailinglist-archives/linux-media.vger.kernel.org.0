Return-Path: <linux-media+bounces-32938-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F899ABDF4B
	for <lists+linux-media@lfdr.de>; Tue, 20 May 2025 17:40:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 144227A7CB4
	for <lists+linux-media@lfdr.de>; Tue, 20 May 2025 15:38:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E03292571D7;
	Tue, 20 May 2025 15:39:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="ggqk1DuP"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58F061FFC54
	for <linux-media@vger.kernel.org>; Tue, 20 May 2025 15:39:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747755588; cv=none; b=ftlGdEY+3Xs6KnZmj71oWYXAc7u8VtD16jdwJ0XVNLgCOdv33feGKJN10/w+HA2zPDJ9mi0mquwD9+ynUlcoU+B9Sdw+uERcKMlV+ec79bQehiF1b5u0oAi0yT8vMwRyu1iTd+mOvTCkM/jc/EKKXfmODR/VFy9M72IjnBwUyVo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747755588; c=relaxed/simple;
	bh=s0LZ88Jtpzw+p4OyLOBjqCyG6m9rqkNIcq7ugHYKE+o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KbH4zXqYG2rE7+QJ/7uPLrD5EjkryqBjNbVw7wxNEDn3KZYj3p9ejhdgxiR/1gjpKKDFmq2qqKrWzc/ZQmaHeQ26SDMXx0X1CZvwowOvY4Mo6o23zc91Ovg6aTzbXLiEACcWqmaHRchP/qJQrNvG1FMeWaac6EWWfbDKnpM0nNs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=ggqk1DuP; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (179.218-130-109.adsl-dyn.isp.belgacom.be [109.130.218.179])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id C6C7B74C;
	Tue, 20 May 2025 17:39:23 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1747755563;
	bh=s0LZ88Jtpzw+p4OyLOBjqCyG6m9rqkNIcq7ugHYKE+o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ggqk1DuPZ73lzSe1XqNM7wvqBhYp986GCKj9COQObYgP53KV/Kpp4luustBKI3gey
	 IqMsSqPMBJjqmgPJ2xKBJM5/eLqJI/895EkGKnD1ieNTcQiC6ihLqI2kysmuLtpshZ
	 DMWvvImyDI5n6GLjDdQmhc9vTzIfR7g/nZDvQT8s=
Date: Tue, 20 May 2025 17:39:38 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, hans@jjverkuil.nl
Subject: Re: [RFC 1/1] media: mc: Add "kaboom" module parameter
Message-ID: <20250520153938.GE8070@pendragon.ideasonboard.com>
References: <20250519113809.296083-1-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250519113809.296083-1-sakari.ailus@linux.intel.com>

Hi Sakari,

Thank you for the patch.

On Mon, May 19, 2025 at 02:38:09PM +0300, Sakari Ailus wrote:
> Add "kaboom" module parameter for the "mc" module. Setting "kaboom" to a
> non-zero value will delay calling media device IOCTLs by 5 s and if the
> media device is unregistered and released during this time, NULL pointer
> is dereferenced and at least a kernel oops will happen:

This is useful for debugging, but do we really want to merge it in
mainline ? Can't this patch be carried out-of-tree ?

> 
> [   63.754666] vim2m vim2m.0: Removing vim2m
> [   63.754681] vim2m vim2m.0: media_gobj_destroy id 13: interface link id 12 ==> id 1
> [   63.755611] vim2m vim2m.0: media_gobj_destroy id 9: data link id 2 ==> id 4
> [   63.755618] vim2m vim2m.0: media_gobj_destroy id 8: data link id 2 ==> id 4
> [   63.755622] vim2m vim2m.0: media_gobj_destroy id 2: source pad 'vim2m-source':0
> [   63.755628] vim2m vim2m.0: media_gobj_destroy id 1: entity 'vim2m-source'
> [   63.755633] vim2m vim2m.0: media_gobj_destroy id 11: data link id 5 ==> id 7
> [   63.755637] vim2m vim2m.0: media_gobj_destroy id 10: data link id 5 ==> id 7
> [   63.755641] vim2m vim2m.0: media_gobj_destroy id 4: sink pad 'vim2m-proc':0
> [   63.755646] vim2m vim2m.0: media_gobj_destroy id 5: source pad 'vim2m-proc':1
> [   63.755650] vim2m vim2m.0: media_gobj_destroy id 3: entity 'vim2m-proc'
> [   63.755654] vim2m vim2m.0: media_gobj_destroy id 14: interface link id 12 ==> id 6
> [   63.755659] vim2m vim2m.0: media_gobj_destroy id 7: sink pad 'vim2m-sink':0
> [   63.755663] vim2m vim2m.0: media_gobj_destroy id 6: entity 'vim2m-sink'
> [   63.755666] vim2m vim2m.0: media_gobj_destroy id 12: intf_devnode v4l-video - major: 81, minor: 0
> [   63.755672] vim2m vim2m.0: Media device unregistered
> [   68.105679] BUG: kernel NULL pointer dereference, address: 0000000000000000
> [   68.107196] #PF: supervisor read access in kernel mode
> [   68.108317] #PF: error_code(0x0000) - not-present page
> [   68.109396] PGD 0 P4D 0
> [   68.109596] Oops: Oops: 0000 [#1] SMP PTI
> [   68.109596] CPU: 0 UID: 1000 PID: 957 Comm: media-ctl Tainted: G            E       6.15.0-rc1+ #20 PREEMPT(voluntary)
> [   68.109596] Tainted: [E]=UNSIGNED_MODULE
> [   68.109596] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS 1.16.2-debian-1.16.2-1 04/01/2014
> [   68.109596] RIP: 0010:media_device_cleanup+0x20f/0xc00 [mc]
> [   68.109596] Code: 00 00 00 89 43 7c 31 c0 5b 41 5c 41 5d 41 5e 5d 31 d2 31 c9 31 f6 31 ff c3 cc cc cc cc 49 8b 04 24 be 10 00 00 00 48 8b 40 68 <4c> 8b 28 4c 89 ef e8 f6 29 ca c3 48 89 c2 48 83 f8 ff 0f 85 e8 fe
> [   68.109596] RSP: 0018:ffffb4efc0a6bd58 EFLAGS: 00010246
> [   68.109596] RAX: 0000000000000000 RBX: ffffb4efc0a6bda0 RCX: 0000000000000000
> [   68.109596] RDX: ffffffffc08244e0 RSI: 0000000000000010 RDI: ffffb4efc0a6bea0
> [   68.109596] RBP: ffffb4efc0a6bd78 R08: ffff99a84a7f7e10 R09: 0000000000000000
> [   68.109596] R10: 0000000000000000 R11: 0000000000000000 R12: ffff99a84a7f7cf8
> [   68.109596] R13: 0000000000000000 R14: ffffb4efc0a6bda0 R15: ffff99a84a7f7cf8
> [   68.109596] FS:  00007f5ceb8a4bc0(0000) GS:ffff99a9f24f3000(0000) knlGS:0000000000000000
> [   68.109596] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> [   68.109596] CR2: 0000000000000000 CR3: 00000001108d2000 CR4: 00000000000006f0
> [   68.109596] Call Trace:
> [   68.109596]  <TASK>
> [   68.109596]  media_device_cleanup+0x536/0xc00 [mc]
> [   68.109596]  __media_device_usb_init+0x8ff/0xc00 [mc]
> [   68.109596]  __x64_sys_ioctl+0xa7/0xe0
> [   68.109596]  x64_sys_call+0xb40/0x2550
> [   68.109596]  do_syscall_64+0x70/0x140
> [   68.109596]  entry_SYSCALL_64_after_hwframe+0x76/0x7e
> [   68.109596] RIP: 0033:0x7f5ceb9be8db
> [   68.109596] Code: 00 48 89 44 24 18 31 c0 48 8d 44 24 60 c7 04 24 10 00 00 00 48 89 44 24 08 48 8d 44 24 20 48 89 44 24 10 b8 10 00 00 00 0f 05 <89> c2 3d 00 f0 ff ff 77 1c 48 8b 44 24 18 64 48 2b 04 25 28 00 00
> [   68.109596] RSP: 002b:00007ffdacd35bd0 EFLAGS: 00000246 ORIG_RAX: 0000000000000010
> [   68.109596] RAX: ffffffffffffffda RBX: 000056536edc42a0 RCX: 00007f5ceb9be8db
> [   68.109596] RDX: 000056536edc42b0 RSI: 00000000c1007c00 RDI: 0000000000000003
> [   68.109596] RBP: 0000000000000000 R08: 0000000000000000 R09: 0000000000000000
> [   68.109596] R10: 0000000000000000 R11: 0000000000000246 R12: 0000000000000000
> [   68.109596] R13: 00007ffdacd35f10 R14: 00007f5cebb3d000 R15: 0000565362627d78
> [   68.109596]  </TASK>
> [   68.109596] Modules linked in: snd_seq_dummy(E) snd_hrtimer(E) snd_seq(E) snd_seq_device(E) sunrpc(E) vim2m(E) v4l2_mem2mem(E) videobuf2_vmalloc(E) videobuf2_memops(E) videobuf2_v4l2(E) videobuf2_common(E) videodev(E) mc(E) qrtr(E) binfmt_misc(E) snd_pcm(E) snd_timer(E) snd(E) soundcore(E) pcspkr(E) e1000(E) i2c_piix4(E) pata_acpi(E) i2c_smbus(E) joydev(E) sch_fq_codel(E) efi_pstore(E) drm(E) nfnetlink(E) vsock_loopback(E) vmw_vsock_virtio_transport_common(E) vmw_vsock_vmci_transport(E) vsock(E) vmw_vmci(E) dmi_sysfs(E) qemu_fw_cfg(E) ip_tables(E) x_tables(E) autofs4(E) input_leds(E) psmouse(E) serio_raw(E) virtio_blk(E) mac_hid(E)
> [   68.109596] CR2: 0000000000000000
> [   68.121045] ---[ end trace 0000000000000000 ]---
> [   68.121203] RIP: 0010:media_device_cleanup+0x20f/0xc00 [mc]
> [   68.121391] Code: 00 00 00 89 43 7c 31 c0 5b 41 5c 41 5d 41 5e 5d 31 d2 31 c9 31 f6 31 ff c3 cc cc cc cc 49 8b 04 24 be 10 00 00 00 48 8b 40 68 <4c> 8b 28 4c 89 ef e8 f6 29 ca c3 48 89 c2 48 83 f8 ff 0f 85 e8 fe
> [   68.123005] RSP: 0018:ffffb4efc0a6bd58 EFLAGS: 00010246
> [   68.123191] RAX: 0000000000000000 RBX: ffffb4efc0a6bda0 RCX: 0000000000000000
> [   68.123433] RDX: ffffffffc08244e0 RSI: 0000000000000010 RDI: ffffb4efc0a6bea0
> [   68.123679] RBP: ffffb4efc0a6bd78 R08: ffff99a84a7f7e10 R09: 0000000000000000
> [   68.123925] R10: 0000000000000000 R11: 0000000000000000 R12: ffff99a84a7f7cf8
> [   68.124307] R13: 0000000000000000 R14: ffffb4efc0a6bda0 R15: ffff99a84a7f7cf8
> [   68.124563] FS:  00007f5ceb8a4bc0(0000) GS:ffff99a9f24f3000(0000) knlGS:0000000000000000
> [   68.124849] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> [   68.125055] CR2: 0000000000000000 CR3: 00000001108d2000 CR4: 00000000000006f0
> [   68.125618] platform vim2m.0: Media device released
> [   68.125997] mc: media_devnode_release: Media Devnode Deallocated
> 
> Without this patch the time window typically remains small but it is still
> always there.
> 
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> ---
>  drivers/media/mc/mc-device.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/drivers/media/mc/mc-device.c b/drivers/media/mc/mc-device.c
> index c0dd4ae57227..116065b0038a 100644
> --- a/drivers/media/mc/mc-device.c
> +++ b/drivers/media/mc/mc-device.c
> @@ -9,10 +9,12 @@
>   */
>  
>  #include <linux/compat.h>
> +#include <linux/delay.h>
>  #include <linux/export.h>
>  #include <linux/idr.h>
>  #include <linux/ioctl.h>
>  #include <linux/media.h>
> +#include <linux/module.h>
>  #include <linux/slab.h>
>  #include <linux/types.h>
>  #include <linux/pci.h>
> @@ -26,6 +28,9 @@
>  
>  #ifdef CONFIG_MEDIA_CONTROLLER
>  
> +static unsigned int kaboom;
> +module_param(kaboom, int, 0600);
> +
>  /*
>   * Legacy defines from linux/media.h. This is the only place we need this
>   * so we just define it here. The media.h header doesn't expose it to the
> @@ -441,6 +446,9 @@ static long media_device_ioctl(struct file *filp, unsigned int cmd,
>  	char __karg[256], *karg = __karg;
>  	long ret;
>  
> +	if (kaboom)
> +		msleep(5000);
> +
>  	if (_IOC_NR(cmd) >= ARRAY_SIZE(ioctl_info)
>  	    || ioctl_info[_IOC_NR(cmd)].cmd != cmd)
>  		return -ENOIOCTLCMD;

-- 
Regards,

Laurent Pinchart

