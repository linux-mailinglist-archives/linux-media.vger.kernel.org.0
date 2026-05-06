Return-Path: <linux-media+bounces-60511-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SGfQKrTf+mmGTgMAu9opvQ
	(envelope-from <linux-media+bounces-60511-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 06 May 2026 08:29:08 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 037794D699A
	for <lists+linux-media@lfdr.de>; Wed, 06 May 2026 08:29:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0AC05301F1B8
	for <lists+linux-media@lfdr.de>; Wed,  6 May 2026 06:29:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D8A2630C60E;
	Wed,  6 May 2026 06:29:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="an9AHO7p"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DA73219FC;
	Wed,  6 May 2026 06:29:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778048942; cv=none; b=BzhYJ/zsXV4L7bmDywg/fVqq1G1/W2PBhslzrvZubqFfTgbAfBLzwd3L3DpGBtaLbvG19mbd03P+wZoaipa+6a5c/2rHxDx02aqJVG6i8RxmkN/edDz7wcrn0TavGpbkQJuYJ6TPGV3fDGAy5FMBADPSt9RMjd+4K2rp5tis80A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778048942; c=relaxed/simple;
	bh=TssRJ+iH0K/BT4hKAd28wXYFu06hZXPxRPQX4p/2D3A=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=GgUSzmh/1mEUwzSigs7B95Vurl8d2U1YFz1JVkGOMNj4qXevQhqK2/o9XgAo7w96oqJWtPLvls4EHrCuo4gNOZZnoVpT7jD6E7SLJR0G5Vm7ErW/xonV01LF49f73DtHxLUVUg/QNnbxr1PLAmj5seu+OX1mG1oJJj9mWS1oKAM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=an9AHO7p; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 52FBBC2BCB8;
	Wed,  6 May 2026 06:29:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778048941;
	bh=TssRJ+iH0K/BT4hKAd28wXYFu06hZXPxRPQX4p/2D3A=;
	h=Date:From:Subject:To:Cc:References:In-Reply-To:From;
	b=an9AHO7ptlXohdXb2TsLW9DRO5zqmS2aI4ij7Sc0yCqQk0XCbs2Oul+KLELCdl7Ky
	 /Jmt7j1tmcHTrcilIazygNZtTTAM6kLLfphPtw9bkeHBiwzxmfS7pyYubn7VuS2zDu
	 8vhmoRk9ZqDYDdXbHJCrF0D9Y/wC0hROPAk/0TqJOpbPfz8or0NXSPEpn+5ePHZR2p
	 Efi9m+pJ3yLfVo/EOI4asL5Cr6+DjIYX8DsaWyYUyGfGB593JP5X7kPFmJx19Ds+fT
	 D870VAa6vKESoPBDj/EC4gMvL+AqVUWFa9VzuKucVMl4OtgoOQK4p4GZ04mVf9QwA+
	 ICxr6eMJ3zT7Q==
Message-ID: <bbc2fa7d-d6eb-4d06-bbd6-ed32c315a726@kernel.org>
Date: Wed, 6 May 2026 08:28:58 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Hans Verkuil <hverkuil+cisco@kernel.org>
Subject: Re: [PATCH v2] media: em28xx: fix use-after-free in
 em28xx_unregister_media_device()
To: Mauricio Faria de Oliveira <mfo@igalia.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: kernel-dev@igalia.com, linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 syzbot+07b93bb3189febcab189@syzkaller.appspotmail.com
References: <20260421-em28xx-v4l-uaf-v2-1-7d5032b8c384@igalia.com>
Content-Language: en-US, nl
In-Reply-To: <20260421-em28xx-v4l-uaf-v2-1-7d5032b8c384@igalia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: 037794D699A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-60511-lists,linux-media=lfdr.de,cisco];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCPT_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[hverkuil@kernel.org,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,07b93bb3189febcab189];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,video_device.dev:url]

On 21/04/2026 19:41, Mauricio Faria de Oliveira wrote:
> During a short probe/disconnect test, the em28xx driver may load the
> em28xx-v4l sub-driver asynchronously and em28xx-v4l may fail to init,
> releasing memory that may be used in the em28xx's disconnect handler
> if a video device was opened during init (eg, udev's v4l_id program)
> and remained open during disconnect, triggering an use-after-free.
> 
> Context:
> 
> In em28xx_v4l2_init() once video_register_device() returns, a struct
> video_device (vdev) that is embedded in struct em28xx_v4l2 (v4l2) is
> referenced by the list struct media_device.entities, which is looped
> over when releasing resources in em28xx_usb_disconnect().
> 
> This list entry is only removed when the last reference to the video
> device (struct video_device.dev) is put. However, this might occur
> *after* the containing struct em28xx_v4l2 (v4l2) is released in the
> error path of em28xx_v4l2_init() and *after* the disconnect handler
> loops over the list, leading to a use-after-free.
> 
> Details:
> 
> If the video device is opened right after em28xx_v4l2_init() calls
> video_register_device(), which adds the memory reference to the list,
> and remains open after em28xx_v4l2_init()'s error path releases the
> containing struct em28xx_v4l2 (as it does not find other references),
> the memory reference to the contained struct video_device is still in
> the list -- but it has been released!
> 
> Then, if em28xx_usb_disconnect() is called, it proceeds to loop over the
> list, accessing the struct list_head's pointers in now released memory.
> 
> Solution:
> 
> In order to fix this, get references to struct em28xx_v4l2 (v4l2) when
> initializing its struct video_device fields (vdev, vbi_dev, radio_dev).
> 
> Put these references in the new release callback for struct video_device
> or if video_register_device() fails (when the callback is not invoked).
> 
> Even though this particular issue is specific to CONFIG_MEDIA_CONTROLLER
> at this time, it is reasonable to get/put references due to the embedded
> struct video_device fields in any case, for correctness (as a pointer to
> it has been passed) and future-proofing to a non-CONFIG_MEDIA_CONTROLLER
> case/issue that might happen in the future.

This commit log has all the hallmarks of AI slop.

The real solution is to use the v4l2_device release() callback to have a
central place where all the data is freed once the last user disappeared.

That requires someone with real em28xx hardware to do the work and to test it.

I'm rejecting this patch.

Regards,

	Hans

> 
> Problematic code path/race condition:
> 
> em28xx_usb_probe
>     em28xx_init_dev
>         em28xx_media_device_init(dev, ...)
>             mdev = kzalloc_obj(*mdev)
>             dev->media_dev = mdev
> 
>     request_modules(dev)
>         INIT_WORK(&dev->request_module_wk, request_module_async)
>         schedule_work(&dev->request_module_wk)
> 
>     media_device_register(dev->media_dev)
> 
> request_module_async
>     request_module("em28xx-v4l") // em28xx-video.c
> 
> module_init(em28xx_video_register)
>     em28xx_register_extension()
>         em28xx_v4l2_init()
>             v4l2 = kzalloc_obj(*v4l2)
>             video_register_device(&v4l2->vdev, ...)
>                 __video_register_device(vdev = &v4l2->vdev, ...)
>                     vdev->dev.release = v4l2_device_release
>                     device_register(&vdev->dev)
>                     video_register_media_controller(vdev)
>                         media_device_register_entity(..., &vdev->entity)
>                             media_gobj_create(..., &entity->graph_obj)
>                                 list_add_tail(&gobj->list,
>                                               &mdev->entities) // ref!
> 
>         (*) /usr/lib/udev/v4l_id: open("/dev/video0")
>                 // get_device(dev)
> 
>             v4l2_mc_create_media_graph(dev->media_dev) // fails.
>                 dev_err(..., "failed to create media graph\n")
>                 goto unregister_dev;
> 
>             unregister_dev:
>                 video_unregister_device(&v4l2->vdev);
>                     device_unregister(dev = &vdev->dev);
>                         put_device(dev) // if open() happens before this
>                                         // no v4l2_device_release() yet.
> 
>                 kref_put(&v4l2->ref, em28xx_free_v4l2) // frees v4l2!
> 
> em28xx_usb_disconnect
>     em28xx_release_resources
>         em28xx_unregister_media_device
>             if (dev->media_dev)
>                 media_device_unregister(dev->media_dev)
>                     list_for_each_entry_safe(entity, next,
>                                              &mdev->entities, // ref!
>                                              graph_obj.list)
>                         // access to v4l2.vdev.entity.graph_object.list!
> 
>         (*) /usr/lib/udev/v4l_id: close("/dev/video0")
>                 // put_device(dev)
>                 //     v4l2_device_release()
>                 //         media_device_unregister_entity(&vdev->entity)
>                 //             media_gobj_destroy(&entity->graph_obj)
>                 //                 list_del(&gobj->list) // too late.
> 
> Note: commit d4352f3639d7 ("[media] em28xx: embed video_device") created
> the problem of memory references to struct em28xx_v4l2's embedded fields
> in struct media_device.entities, but this use-after-free didn't happen yet
> as media_device_unregister() in the em28xx_usb_disconnect() path was added
> in commit 37ecc7b1278f ("[media] em28xx: add media controller support").
> 
> Fixes: d4352f3639d7 ("[media] em28xx: embed video_device")
> Fixes: 37ecc7b1278f ("[media] em28xx: add media controller support")
> Reported-by: syzbot+07b93bb3189febcab189@syzkaller.appspotmail.com
> Closes: https://syzbot.org/bug?extid=07b93bb3189febcab189
> Signed-off-by: Mauricio Faria de Oliveira <mfo@igalia.com>
> ---
> It's possible to synthetically reproduce this bug with wait-for/delays
> in the driver's code paths exercised by syzbot's USB probe/disconnect.
> If you're interested in it, just let me know and I'll send it as well.
> 
> Tested on next-20260420.
> 
> Before:
> 
> 	[   33.348056] usb 1-1: new high-speed USB device number 2 using dummy_hcd
> 	...
> 	[   33.485616] em28xx 1-1:0.132: New device syz syz @ 480 Mbps (0413:6023, interface 132, class 132)
> 	[   33.487493] em28xx 1-1:0.132: Video interface 132 found:
> 	...
> 	[   34.874703] em28xx 1-1:0.132: Registering V4L2 extension
> 	...
> 	[   34.950464] em28xx 1-1:0.132: failed to create media graph
> 	[   34.951029] DBG Step 1 em28xx_v4l2_init(): Waiting for dev->v4l2 to be opened...
> 	[   34.966574] DBG Step 2 em28xx_v4l2_open(): dev->v4l2 opened; waiting 5 seconds.
> 	[   35.889389] usb 1-1: USB disconnect, device number 2
> 	[   35.893686] em28xx 1-1:0.132: Disconnecting em28xx
> 	[   35.981999] DBG Step 1 em28xx_v4l2_init(): Done.
> 	[   35.983443] em28xx 1-1:0.132: V4L2 device video0 deregistered
> 
> 	(differences below)
> 
> 	[   35.988481] DBG Step 3 em28xx_free_v4l2(): Freeing dev->v4l2
> 	[   35.991212] DBG Step 3 em28xx_free_v4l2(): Done
> 	[   35.993331] DBG Step 4 em28xx_usb_disconnect(): Waiting for dev->v4l2 to be freed...
> 	[   35.996234] DBG Step 4 em28xx_usb_disconnect(): Done.
> 	[   35.999200] DBG Step 5 em28xx_unregister_media_device(): use-after-free expected...
> 	[   36.004739] ==================================================================
> 	[   36.008074] BUG: KASAN: slab-use-after-free in media_device_unregister+0x542/0x560
> 	[   36.009908] Read of size 8 at addr ffff88800a1dc160 by task kworker/1:2/90
> 	[   36.011677]
> 	[   36.012045] CPU: 1 UID: 0 PID: 90 Comm: kworker/1:2 Not tainted 7.0.0-next-20260420-dirty #37 PREEMPT(lazy)
> 	[   36.012065] Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS 1.16.3-debian-1.16.3-2 04/01/2014
> 	[   36.012075] Workqueue: usb_hub_wq hub_event
> 	[   36.012097] Call Trace:
> 	[   36.012106]  <TASK>
> 	[   36.012114]  dump_stack_lvl+0x4d/0x70
> 	[   36.012133]  print_report+0x153/0x4c6
> 	[   36.012192]  kasan_report+0xda/0x110
> 	[   36.012239]  media_device_unregister+0x542/0x560
> 	[   36.012255]  em28xx_unregister_media_device.part.0+0x4f/0xf0
> 	[   36.012273]  em28xx_release_resources+0xa1/0x1a0
> 	[   36.012289]  em28xx_usb_disconnect.cold+0x280/0x323
> 	[   36.012306]  usb_unbind_interface+0x154/0x690
> 	[   36.012324]  device_release_driver_internal+0x36b/0x500
> 	[   36.012354]  bus_remove_device+0x259/0x3e0
> 	[   36.012408]  device_del+0x364/0xce0
> 	[   36.012482]  usb_disable_device+0x270/0x4f0
> 	[   36.012509]  usb_disconnect+0x26a/0x910
> 	[   36.012523]  hub_event+0x966/0x3600
> 	[   36.012589]  process_one_work+0x618/0xf20
> 	[   36.012613]  worker_thread+0x422/0xbb0
> 	[   36.012658]  kthread+0x2cb/0x3a0
> 	[   36.012686]  ret_from_fork+0x338/0x520
> 	[   36.012719]  ret_from_fork_asm+0x1a/0x30
> 	[   36.012729]  </TASK>
> 	[   36.012731]
> 	[   36.036089] Allocated by task 24:
> 	[   36.036416]  kasan_save_stack+0x30/0x50
> 	[   36.036886]  kasan_save_track+0x14/0x30
> 	[   36.037578]  __kasan_kmalloc+0x7f/0x90
> 	[   36.037953]  em28xx_v4l2_init.cold+0xa7/0x39f0
> 	[   36.038411]  em28xx_init_extension+0xfb/0x1c0
> 	[   36.038864]  process_one_work+0x618/0xf20
> 	[   36.039522]  worker_thread+0x422/0xbb0
> 	[   36.039784]  kthread+0x2cb/0x3a0
> 	[   36.039982]  ret_from_fork+0x338/0x520
> 	[   36.040298]  ret_from_fork_asm+0x1a/0x30
> 	[   36.040600]
> 	[   36.040703] Freed by task 24:
> 	[   36.040916]  kasan_save_stack+0x30/0x50
> 	[   36.041265]  kasan_save_track+0x14/0x30
> 	[   36.041586]  kasan_save_free_info+0x3b/0x70
> 	[   36.041902]  __kasan_slab_free+0x47/0x70
> 	[   36.042313]  kfree+0x16d/0x430
> 	[   36.042612]  em28xx_free_v4l2+0x9c/0xc0
> 	[   36.043024]  em28xx_v4l2_init.cold+0x306/0x39f0
> 	[   36.043425]  em28xx_init_extension+0xfb/0x1c0
> 	[   36.043765]  process_one_work+0x618/0xf20
> 	[   36.044156]  worker_thread+0x422/0xbb0
> 	[   36.044480]  kthread+0x2cb/0x3a0
> 	[   36.044749]  ret_from_fork+0x338/0x520
> 	[   36.045038]  ret_from_fork_asm+0x1a/0x30
> 	[   36.045308]
> 	...
> 	[   36.059006] ==================================================================
> 	...
> 	[   36.060423] em28xx 1-1:0.132: Freeing device
> 	[   40.078033] DBG Step 2 em28xx_v4l2_open(): Done.
> 
> After:
> 
> 	[   22.624582] usb 1-1: new high-speed USB device number 2 using dummy_hcd
> 	...
> 	[   22.786600] em28xx 1-1:0.132: New device syz syz @ 480 Mbps (0413:6023, interface 132, class 132)
> 	[   22.792225] em28xx 1-1:0.132: Video interface 132 found:
> 	...
> 	[   24.184584] em28xx 1-1:0.132: Registering V4L2 extension
> 	...
> 	[   24.262562] em28xx 1-1:0.132: failed to create media graph
> 	[   24.263116] DBG Step 1 em28xx_v4l2_init(): Waiting for dev->v4l2 to be opened...
> 	[   24.277644] DBG Step 2 em28xx_v4l2_open(): dev->v4l2 opened; waiting 5 seconds.
> 	[   25.186376] usb 1-1: USB disconnect, device number 2
> 	[   25.190080] em28xx 1-1:0.132: Disconnecting em28xx
> 	[   25.295219] DBG Step 1 em28xx_v4l2_init(): Done.
> 	[   25.299018] em28xx 1-1:0.132: V4L2 device video0 deregistered
> 
> 	(differences below)
> 
> 	[   25.308234] DBG Step 4 em28xx_usb_disconnect(): Waiting for dev->v4l2 to be freed...
> 	[   29.326594] DBG Step 2 em28xx_v4l2_open(): Done.
> 	[   29.328570] videodev: DBG v4l2_device_release(): removing dev->v4l2 media entity
> 	[   29.332302] DBG Step 3 em28xx_free_v4l2(): Freeing dev->v4l2
> 	[   29.333098] DBG Step 3 em28xx_free_v4l2(): Done
> 	[   29.454556] DBG Step 4 em28xx_usb_disconnect(): Done.
> 	[   29.455721] DBG Step 5 em28xx_unregister_media_device(): use-after-free expected...
> 	[   29.460142] em28xx 1-1:0.132: Freeing device
> 
> 	(No use-after-free.)
> ---
> Changes in v2:
> - Fix/improve logic:
>   - Remove CONFIG_MEDIA_CONTROLLER guards of kref_{get,put}().
>   - Explain that in commit message.
> - Improve readability:
>   - Use em28xx_vdev_release() to kref_put() if video_register_device()
>     fails, as it pairs more clearly with em28xx_vdev_init().
>   - Simplify comments in em28xx_vdev_{init,release}().
> - Commit message:
>   - Rephrase it a bit.
>   - Add Fixes: tags and trailing note about Fixed commits.
> - Link to v1: https://lore.kernel.org/r/20260413-em28xx-v4l-uaf-v1-1-52a5a71493ce@igalia.com
> ---
>  drivers/media/usb/em28xx/em28xx-video.c | 32 ++++++++++++++++++++++++++++++--
>  1 file changed, 30 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/media/usb/em28xx/em28xx-video.c b/drivers/media/usb/em28xx/em28xx-video.c
> index 4a0ce9c5ee4b4abde681cc373e1c6db2f3b3af70..c95370f298c1f9967e6031ebafb773487b0e8c8b 100644
> --- a/drivers/media/usb/em28xx/em28xx-video.c
> +++ b/drivers/media/usb/em28xx/em28xx-video.c
> @@ -2495,6 +2495,8 @@ static int em28xx_v4l2_close(struct file *filp)
>  	return 0;
>  }
>  
> +static void em28xx_vdev_release(struct video_device *vfd);
> +
>  static const struct v4l2_file_operations em28xx_v4l_fops = {
>  	.owner         = THIS_MODULE,
>  	.open          = em28xx_v4l2_open,
> @@ -2552,7 +2554,7 @@ static const struct v4l2_ioctl_ops video_ioctl_ops = {
>  static const struct video_device em28xx_video_template = {
>  	.fops		= &em28xx_v4l_fops,
>  	.ioctl_ops	= &video_ioctl_ops,
> -	.release	= video_device_release_empty,
> +	.release	= em28xx_vdev_release,
>  	.tvnorms	= V4L2_STD_ALL,
>  };
>  
> @@ -2581,7 +2583,7 @@ static const struct v4l2_ioctl_ops radio_ioctl_ops = {
>  static struct video_device em28xx_radio_template = {
>  	.fops		= &radio_fops,
>  	.ioctl_ops	= &radio_ioctl_ops,
> -	.release	= video_device_release_empty,
> +	.release	= em28xx_vdev_release,
>  };
>  
>  /* I2C possible address to saa7115, tvp5150, msp3400, tvaudio */
> @@ -2619,6 +2621,29 @@ static void em28xx_vdev_init(struct em28xx *dev,
>  		 dev_name(&dev->intf->dev), type_name);
>  
>  	video_set_drvdata(vfd, dev);
> +
> +	/*
> +	 * Get a reference to struct em28xx_v4l2 as embedded struct video_device
> +	 * may be accessed from elsewhere after video_register_device() returns.
> +	 *
> +	 * If video_register_device() succeeds, this reference will be released
> +	 * automatically in em28xx_vdev_release(); on error it must be released
> +	 * explicitly.
> +	 */
> +	kref_get(&dev->v4l2->ref);
> +}
> +
> +static void em28xx_vdev_release(struct video_device *vfd)
> +{
> +	struct em28xx_v4l2 *v4l2;
> +
> +	/*
> +	 * Find struct em28xx_v4l2 with its embedded struct v4l2_device,
> +	 * as video_get_drvdata() returns dev and dev->v4l2 may be NULL
> +	 * (e.g., after em28xx_v4l2_init()'s error path).
> +	 */
> +	v4l2 = container_of(vfd->v4l2_dev, struct em28xx_v4l2, v4l2_dev);
> +	kref_put(&v4l2->ref, em28xx_free_v4l2);
>  }
>  
>  static void em28xx_tuner_setup(struct em28xx *dev, unsigned short tuner_addr)
> @@ -2961,6 +2986,7 @@ static int em28xx_v4l2_init(struct em28xx *dev)
>  	if (ret) {
>  		dev_err(&dev->intf->dev,
>  			"unable to register video device (error=%i).\n", ret);
> +		em28xx_vdev_release(&v4l2->vdev);
>  		goto unregister_dev;
>  	}
>  
> @@ -2995,6 +3021,7 @@ static int em28xx_v4l2_init(struct em28xx *dev)
>  		if (ret < 0) {
>  			dev_err(&dev->intf->dev,
>  				"unable to register vbi device\n");
> +			em28xx_vdev_release(&v4l2->vbi_dev);
>  			goto unregister_dev;
>  		}
>  	}
> @@ -3008,6 +3035,7 @@ static int em28xx_v4l2_init(struct em28xx *dev)
>  		if (ret < 0) {
>  			dev_err(&dev->intf->dev,
>  				"can't register radio device\n");
> +			em28xx_vdev_release(&v4l2->radio_dev);
>  			goto unregister_dev;
>  		}
>  		dev_info(&dev->intf->dev,
> 
> ---
> base-commit: 97e797263a5e963da3d1e66e743fd518567dfe37
> change-id: 20260413-em28xx-v4l-uaf-1d196e53dc50
> 
> Best regards,


