Return-Path: <linux-media+bounces-58668-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sGiiML4C3Wk3YwkAu9opvQ
	(envelope-from <linux-media+bounces-58668-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 13 Apr 2026 16:50:38 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D3953ED8B5
	for <lists+linux-media@lfdr.de>; Mon, 13 Apr 2026 16:50:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 19D9630557E2
	for <lists+linux-media@lfdr.de>; Mon, 13 Apr 2026 14:44:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 346943E0229;
	Mon, 13 Apr 2026 14:44:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b="QJsJwDXV"
X-Original-To: linux-media@vger.kernel.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EEA93DF016;
	Mon, 13 Apr 2026 14:44:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.97.179.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776091485; cv=none; b=RNUBw/G3BJQ6PzfIqMivNSsQmtFmmzEPflMin/VvLxLdtyxvvo0bYcJjfPTwX/PaBmFuqtSyHnA2go27qHTojrcDtj9iYzTc48fR0ZBiMu/9h5LjR58fjBTi+jb2uCAXRZgtuNQxly4LTVaDaRORH+gSF2zWVgQjExRgrA7o88o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776091485; c=relaxed/simple;
	bh=mxch5lKH8KfHO6G6Nk/PS6ZdoA2RSYceHysfxwkACY0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=Dj4TurtGAdrpUmlJSqIxeWldx2B4PC4w4An+sz3SQ4X9xYQWSU/We9tU1sBkEQ2TxAkTzCifn+cAGwpQZkI3dNe0HnlwJt5oJApvpxc/FCmEk6cRHgkVJDvte3U+uCi5Elp/EDVS3kpZdQ2H55FrZYRzKq4uvHtXGboVW0i7dJw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com; spf=pass smtp.mailfrom=igalia.com; dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b=QJsJwDXV; arc=none smtp.client-ip=213.97.179.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=igalia.com
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Cc:To:Message-Id:Content-Transfer-Encoding:Content-Type:
	MIME-Version:Subject:Date:From:Sender:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=IhNmK3UBJN4bREwWhivjALUd1YHD6YnFqHl73+CJjBw=; b=QJsJwDXV3KUQvkb8BipcxblBI9
	f83ZRaPeBaUietFWimYTgS4Q9mPuKy9MRmgJ3DXwBJ8utw10YUoPIpTwfhFTV6V3NOeKnc+Sbpf/z
	zxF0hBB4z1wSgdiCtv58MJ0cLbgUtJDFTS7ET4HGPXzf5MI7GBBriZGHQfpkzMc627gdTHpVlAWsb
	uK6fbyCLE/tnUlpc9lozjAbZUeiInXYgtObAM62l+jWFERX1Ohz6OrBQxWONxU+8PksxZVosJ64Zx
	ZMrDs3Nsjad+w4yubG/Fqyv19+sOy6hu+9SXH0IlV8t+41Wd7jlzgMNzUsHqMSb+KG03vOQQpZBt7
	+QwdvRUw==;
Received: from 186-249-145-49.shared.desktop.com.br ([186.249.145.49] helo=[192.168.1.103])
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
	id 1wCIWk-00FSHu-Ma; Mon, 13 Apr 2026 16:44:39 +0200
From: Mauricio Faria de Oliveira <mfo@igalia.com>
Date: Mon, 13 Apr 2026 11:44:25 -0300
Subject: [PATCH] media: em28xx: fix use-after-free in
 em28xx_unregister_media_device()
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260413-em28xx-v4l-uaf-v1-1-52a5a71493ce@igalia.com>
X-B4-Tracking: v=1; b=H4sIAEgB3WkC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDE0Nj3dRcI4uKCt0ykxzd0sQ0XcMUQ0uzVFPjlGRTAyWgpoKi1LTMCrC
 B0bG1tQCRDU5oYAAAAA==
X-Change-ID: 20260413-em28xx-v4l-uaf-1d196e53dc50
To: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: kernel-dev@igalia.com, linux-media@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 syzbot+07b93bb3189febcab189@syzkaller.appspotmail.com, 
 Mauricio Faria de Oliveira <mfo@igalia.com>
X-Mailer: b4 0.14.2
X-Spamd-Result: default: False [-0.36 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_DKIM_REJECT(1.00)[igalia.com:s=20170329];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64];
	MAILLIST(-0.15)[generic];
	DMARC_POLICY_SOFTFAIL(0.10)[igalia.com : SPF not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-58668-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[igalia.com:-];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCPT_COUNT_FIVE(0.00)[6];
	FROM_NEQ_ENVFROM(0.00)[mfo@igalia.com,linux-media@vger.kernel.org];
	PRECEDENCE_BULK(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.951];
	TAGGED_RCPT(0.00)[linux-media,07b93bb3189febcab189];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,appspotmail.com:email]
X-Rspamd-Queue-Id: 0D3953ED8B5
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

During a short probe/disconnect test, the em28xx driver may load the
em28xx-v4l sub-driver asynchronously and em28xx-v4l may fail to init,
releasing memory that may be used in the em28xx's disconnect handler
if a video device was opened during init (eg, udev's v4l_id program).

In em28xx_v4l2_init() once video_register_device() returns, a struct
video_device (vdev) that is embedded in struct em28xx_v4l2 (v4l2) is
referenced by the list struct media_device.entities, which is looped
over when releasing resources in em28xx_usb_disconnect().

This list entry is only removed when the last reference to the video
device (struct video_device.dev) is put. Currently, this might occur
*after* the containing struct em28xx_v4l2 (v4l2) is released in the
error path of em28xx_v4l2_init() and *after* the disconnect handler
loops over the list -- causing an use-after-free. Specifically:

If the video device is opened right after em28xx_v4l2_init() calls
video_register_device(), which adds the memory reference to the list,
and continues open after em28xx_v4l2_init()'s error path releases the
containing struct em28xx_v4l2 as it does not find existing references,
the memory reference to the contained struct video_device is still in
the list -- but it has been released!

Now, if em28xx_usb_disconnect() is called, it proceeds to loop over the
list, accessing the struct list_head's pointers in the released memory,
and hits a use-after-free error.

In order to fix this, get references to struct em28xx_v4l2 (v4l2) when
initializing its struct video_device fields (vdev, vbi_dev, radio_dev),
and put them in the (added) release callback for struct video_device,
or if video_register_device() fails (no release callback).

Problematic code path/race condition:

em28xx_usb_probe
    em28xx_init_dev
        em28xx_media_device_init(dev, ...)
            mdev = kzalloc_obj(*mdev)
            dev->media_dev = mdev

    request_modules(dev)
        INIT_WORK(&dev->request_module_wk, request_module_async)
        schedule_work(&dev->request_module_wk)

    media_device_register(dev->media_dev)

request_module_async
    request_module("em28xx-v4l") // em28xx-video.c

module_init(em28xx_video_register)
    em28xx_register_extension()
        em28xx_v4l2_init()
            v4l2 = kzalloc_obj(*v4l2)
            video_register_device(&v4l2->vdev, ...)
                __video_register_device(vdev = &v4l2->vdev, ...)
                    vdev->dev.release = v4l2_device_release
                    device_register(&vdev->dev)
                    video_register_media_controller(vdev)
                        media_device_register_entity(..., &vdev->entity)
                            media_gobj_create(..., &entity->graph_obj)
                                list_add_tail(&gobj->list,
                                              &mdev->entities) // ref!

        (*) /usr/lib/udev/v4l_id: open("/dev/video0")
                // get_device(dev)

            v4l2_mc_create_media_graph(dev->media_dev) // fails.
                dev_err(..., "failed to create media graph\n")
                goto unregister_dev;

            unregister_dev:
                video_unregister_device(&v4l2->vdev);
                    device_unregister(dev = &vdev->dev);
                        put_device(dev) // if open() happens before this
                                        // no v4l2_device_release() yet.

                kref_put(&v4l2->ref, em28xx_free_v4l2) // frees v4l2!

em28xx_usb_disconnect
    em28xx_release_resources
        em28xx_unregister_media_device
            if (dev->media_dev)
                media_device_unregister(dev->media_dev)
                    list_for_each_entry_safe(entity, next,
                                             &mdev->entities, // ref!
                                             graph_obj.list)
                        // access to v4l2.vdev.entity.graph_object.list!

        (*) /usr/lib/udev/v4l_id: close("/dev/video0")
                // put_device(dev)
                //     v4l2_device_release()
                //         media_device_unregister_entity(&vdev->entity)
                //             media_gobj_destroy(&entity->graph_obj)
                //                 list_del(&gobj->list) // too late.

Reported-by: syzbot+07b93bb3189febcab189@syzkaller.appspotmail.com
Closes: https://syzbot.org/bug?extid=07b93bb3189febcab189
Signed-off-by: Mauricio Faria de Oliveira <mfo@igalia.com>
---
It's possible to synthetically reproduce this bug with wait-for/delays
in the driver's code paths exercised by syzbot's USB probe/disconnect.
If you're interested in it, just let me know and I'll send it as well.

Also tested/verified on next-20260410.

Before:

	...
	[   36.744362] em28xx 1-1:0.132: New device syz syz @ 480 Mbps (0413:6023, interface 132, class 132)
	...
	[   38.129591] em28xx 1-1:0.132: Registering V4L2 extension
	...
	[   38.200707] em28xx 1-1:0.132: failed to create media graph
	[   38.201237] DBG Step 1 em28xx_v4l2_init(): Waiting for dev->v4l2 to be opened...
	[   38.214578] DBG Step 2 em28xx_v4l2_open(): dev->v4l2 opened; waiting 5 seconds.
	[   39.099563] usb 1-1: USB disconnect, device number 2
	[   39.102683] em28xx 1-1:0.132: Disconnecting em28xx
	[   39.209877] DBG Step 1 em28xx_v4l2_init(): Done.
	[   39.211261] em28xx 1-1:0.132: V4L2 device video0 deregistered

	(differences below)

	[   39.212953] DBG Step 3 em28xx_free_v4l2(): Freeing dev->v4l2
	[   39.214128] DBG Step 3 em28xx_free_v4l2(): Done
	[   39.215233] DBG Step 4 em28xx_usb_disconnect(): Waiting for dev->v4l2 to be freed...
	[   39.217183] DBG Step 4 em28xx_usb_disconnect(): Done.
	[   39.218319] DBG Step 5 em28xx_unregister_media_device(): use-after-free expected...
	[   39.220381] ==================================================================
	[   39.222372] BUG: KASAN: slab-use-after-free in media_device_unregister+0x542/0x560
	[   39.223794] Read of size 8 at addr ffff888005f36168 by task kworker/1:1/43
	[   39.224872]
	[   39.225136] CPU: 1 UID: 0 PID: 43 Comm: kworker/1:1 Not tainted 7.0.0-rc5+ #28 PREEMPT(lazy)
	[   39.225149] Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS 1.16.3-debian-1.16.3-2 04/01/2014
	[   39.225156] Workqueue: usb_hub_wq hub_event
	[   39.225170] Call Trace:
	[   39.225176]  <TASK>
	[   39.225181]  dump_stack_lvl+0x4d/0x70
	[   39.225195]  print_report+0x170/0x4f3
	[   39.225230]  kasan_report+0xda/0x110
	[   39.225267]  media_device_unregister+0x542/0x560
	[   39.225275]  em28xx_unregister_media_device.part.0+0x4f/0xf0
	[   39.225305]  em28xx_release_resources+0xa1/0x1a0
	[   39.225314]  em28xx_usb_disconnect.cold+0x280/0x323
	[   39.225325]  usb_unbind_interface+0x154/0x690
	[   39.225350]  device_release_driver_internal+0x36b/0x500
	[   39.225370]  bus_remove_device+0x259/0x3e0
	[   39.225405]  device_del+0x364/0xce0
	[   39.225449]  usb_disable_device+0x270/0x4f0
	[   39.225457]  usb_disconnect+0x26a/0x920
	[   39.225465]  hub_event+0x966/0x3600
	[   39.225559]  process_one_work+0x617/0xf00
	[   39.225577]  worker_thread+0x422/0xbb0
	[   39.225611]  kthread+0x2cb/0x3a0
	[   39.225633]  ret_from_fork+0x357/0x540
	[   39.225663]  ret_from_fork_asm+0x1a/0x30
	[   39.225675]  </TASK>
	[   39.225678]
	[   39.277189] Allocated by task 113:
	[   39.277933]  kasan_save_stack+0x30/0x50
	[   39.278696]  kasan_save_track+0x14/0x30
	[   39.279186]  __kasan_kmalloc+0x7f/0x90
	[   39.280147]  em28xx_v4l2_init.cold+0xd2/0x3de6
	[   39.281702]  em28xx_init_extension+0xfb/0x1c0
	[   39.282763]  process_one_work+0x617/0xf00
	[   39.283524]  worker_thread+0x422/0xbb0
	[   39.284543]  kthread+0x2cb/0x3a0
	[   39.285461]  ret_from_fork+0x357/0x540
	[   39.286401]  ret_from_fork_asm+0x1a/0x30
	[   39.287180]
	[   39.287514] Freed by task 113:
	[   39.288117]  kasan_save_stack+0x30/0x50
	[   39.288921]  kasan_save_track+0x14/0x30
	[   39.289694]  kasan_save_free_info+0x3b/0x70
	[   39.290584]  __kasan_slab_free+0x47/0x70
	[   39.291494]  kfree+0x147/0x3b0
	[   39.292126]  em28xx_free_v4l2+0x9c/0xc0
	[   39.293059]  em28xx_v4l2_init.cold+0x2fe/0x3de6
	[   39.294157]  em28xx_init_extension+0xfb/0x1c0
	[   39.295216]  process_one_work+0x617/0xf00
	[   39.296028]  worker_thread+0x422/0xbb0
	[   39.296771]  kthread+0x2cb/0x3a0
	[   39.297605]  ret_from_fork+0x357/0x540
	[   39.298447]  ret_from_fork_asm+0x1a/0x30
	[   39.299269]
	...

After:

	...
	[   12.513485] em28xx 1-1:0.132: New device syz syz @ 480 Mbps (0413:6023, interface 132, class 132)
	...
	[   13.884186] em28xx 1-1:0.132: Registering V4L2 extension
	...
	[   13.946067] em28xx 1-1:0.132: failed to create media graph
	[   13.946522] DBG Step 1 em28xx_v4l2_init(): Waiting for dev->v4l2 to be opened...
	[   13.959775] DBG Step 2 em28xx_v4l2_open(): dev->v4l2 opened; waiting 5 seconds.
	[   14.915494] usb 1-1: USB disconnect, device number 2
	[   14.918849] em28xx 1-1:0.132: Disconnecting em28xx
	[   14.993575] DBG Step 1 em28xx_v4l2_init(): Done.
	[   14.994326] em28xx 1-1:0.132: V4L2 device video0 deregistered

	(differences below)

	[   14.996910] DBG Step 4 em28xx_usb_disconnect(): Waiting for dev->v4l2 to be freed...
	[   19.089597] DBG Step 2 em28xx_v4l2_open(): Done.
	[   19.091534] videodev: DBG v4l2_device_release(): removing dev->v4l2 media entity
	[   19.095550] DBG Step 3 em28xx_free_v4l2(): Freeing dev->v4l2
	[   19.099202] DBG Step 3 em28xx_free_v4l2(): Done
	[   20.113671] DBG Step 4 em28xx_usb_disconnect(): Done.
	[   20.115563] DBG Step 5 em28xx_unregister_media_device(): use-after-free expected...
	[   20.121025] em28xx 1-1:0.132: Freeing device

	(No use-after-free.)
---
 drivers/media/usb/em28xx/em28xx-video.c | 47 +++++++++++++++++++++++++++++++--
 1 file changed, 45 insertions(+), 2 deletions(-)

diff --git a/drivers/media/usb/em28xx/em28xx-video.c b/drivers/media/usb/em28xx/em28xx-video.c
index 4a0ce9c5ee4b4abde681cc373e1c6db2f3b3af70..870b16ba4fef04947acae89a0d63663e1485a34d 100644
--- a/drivers/media/usb/em28xx/em28xx-video.c
+++ b/drivers/media/usb/em28xx/em28xx-video.c
@@ -2495,6 +2495,8 @@ static int em28xx_v4l2_close(struct file *filp)
 	return 0;
 }
 
+static void em28xx_vdev_release(struct video_device *vfd);
+
 static const struct v4l2_file_operations em28xx_v4l_fops = {
 	.owner         = THIS_MODULE,
 	.open          = em28xx_v4l2_open,
@@ -2552,7 +2554,7 @@ static const struct v4l2_ioctl_ops video_ioctl_ops = {
 static const struct video_device em28xx_video_template = {
 	.fops		= &em28xx_v4l_fops,
 	.ioctl_ops	= &video_ioctl_ops,
-	.release	= video_device_release_empty,
+	.release	= em28xx_vdev_release,
 	.tvnorms	= V4L2_STD_ALL,
 };
 
@@ -2581,7 +2583,7 @@ static const struct v4l2_ioctl_ops radio_ioctl_ops = {
 static struct video_device em28xx_radio_template = {
 	.fops		= &radio_fops,
 	.ioctl_ops	= &radio_ioctl_ops,
-	.release	= video_device_release_empty,
+	.release	= em28xx_vdev_release,
 };
 
 /* I2C possible address to saa7115, tvp5150, msp3400, tvaudio */
@@ -2619,6 +2621,44 @@ static void em28xx_vdev_init(struct em28xx *dev,
 		 dev_name(&dev->intf->dev), type_name);
 
 	video_set_drvdata(vfd, dev);
+
+#ifdef CONFIG_MEDIA_CONTROLLER
+	/*
+	 * The struct video_device is referenced by struct media_device.entities
+	 * list (with video_device.entity.graph_obj.list) after the registration
+	 * until the last reference to struct video_device.dev is released, when
+	 * it is removed from the list.
+	 *
+	 * Keep a reference on struct em28xx_v4l2 (contains struct video_device)
+	 * so to account for this memory reference and not free it while in use,
+	 * and release this reference in struct video_device.release() callback.
+	 * (Note: if registration fails, this reference must be released.)
+	 *
+	 * See video_register_device(vdev)
+	 *       device_register(&vdev->dev) // .release = v4l2_device_release()
+	 *       video_register_media_controller(vdev)
+	 *         media_device_register_entity(..., &vdev->entity)
+	 * and v4l2_device_release(vdev)
+	 *       media_device_unregister_entity(&vdev->entity)
+	 *       vdev->release(vdev)
+	 */
+	kref_get(&dev->v4l2->ref);
+#endif
+}
+
+static void em28xx_vdev_release(struct video_device *vfd)
+{
+#ifdef CONFIG_MEDIA_CONTROLLER
+	struct em28xx_v4l2 *v4l2;
+
+	/*
+	 * Find struct em28xx_v4l2 with its embedded struct v4l2_device,
+	 * as video_get_drvdata() returns dev and dev->v4l2 may be NULL
+	 * (e.g., after em28xx_v4l2_init()'s error path).
+	 */
+	v4l2 = container_of(vfd->v4l2_dev, struct em28xx_v4l2, v4l2_dev);
+	kref_put(&v4l2->ref, em28xx_free_v4l2);
+#endif
 }
 
 static void em28xx_tuner_setup(struct em28xx *dev, unsigned short tuner_addr)
@@ -2961,6 +3001,7 @@ static int em28xx_v4l2_init(struct em28xx *dev)
 	if (ret) {
 		dev_err(&dev->intf->dev,
 			"unable to register video device (error=%i).\n", ret);
+		kref_put(&dev->v4l2->ref, em28xx_free_v4l2);
 		goto unregister_dev;
 	}
 
@@ -2995,6 +3036,7 @@ static int em28xx_v4l2_init(struct em28xx *dev)
 		if (ret < 0) {
 			dev_err(&dev->intf->dev,
 				"unable to register vbi device\n");
+			kref_put(&dev->v4l2->ref, em28xx_free_v4l2);
 			goto unregister_dev;
 		}
 	}
@@ -3008,6 +3050,7 @@ static int em28xx_v4l2_init(struct em28xx *dev)
 		if (ret < 0) {
 			dev_err(&dev->intf->dev,
 				"can't register radio device\n");
+			kref_put(&dev->v4l2->ref, em28xx_free_v4l2);
 			goto unregister_dev;
 		}
 		dev_info(&dev->intf->dev,

---
base-commit: 66672af7a095d89f082c5327f3b15bc2f93d558e
change-id: 20260413-em28xx-v4l-uaf-1d196e53dc50

Best regards,
-- 
Mauricio Faria de Oliveira <mfo@igalia.com>


