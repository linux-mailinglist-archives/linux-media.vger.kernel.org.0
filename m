Return-Path: <linux-media+bounces-62674-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yAyUGaHbEWq0rQYAu9opvQ
	(envelope-from <linux-media+bounces-62674-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sat, 23 May 2026 18:53:53 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 12BDB5BFE64
	for <lists+linux-media@lfdr.de>; Sat, 23 May 2026 18:53:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 56FF43015D16
	for <lists+linux-media@lfdr.de>; Sat, 23 May 2026 16:53:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BA83C31F9A5;
	Sat, 23 May 2026 16:53:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LZOJIAyf"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2092315793
	for <linux-media@vger.kernel.org>; Sat, 23 May 2026 16:53:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779555223; cv=none; b=Dd3y5KwVHv0RETa2J48sT7hG5SgeHqxffKz+ob0/LqvJfNrOWjOayEF4hmVrivCcRABG6EQ7DEm/R/j1GwC4KkECkqtQPe/HO/3Ey02qZU178Y0rSS/+6lxGsLt70QLRtbd9ekyJ7WQgfdXnd4Wm2TdQX8ey39M1FdxrXtVzOU0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779555223; c=relaxed/simple;
	bh=som4gKyO96dhfc0ih3Y9ugIff6/5J1vxdGe58HMxGPg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KIZELQq+79YSCVisO87hXHsObM+1B4JVTrtFXr2ZhN1XG/ymX76iG8zJyfAR8McA6MpYpVsMNhaKjDbv5mFKSTRwbyLyYNj5LYhliagdc/GCLIrJcBN992HiQCYptGwpyc6FPY8m3Wp6ivOiixZYsjOlsbei+99UvukiFX8043o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LZOJIAyf; arc=none smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-5a87782588cso885190e87.3
        for <linux-media@vger.kernel.org>; Sat, 23 May 2026 09:53:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779555220; x=1780160020; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=utnaPVtluIiTyEzwOhIMr0EOUnXAQ6TiN8kOxttnpoQ=;
        b=LZOJIAyf4mfLtwE2dXfVaB3lTmmoSi4T//KX4/gyBmnmdD15NHNgbIkaZa16M314jZ
         gRylO7Ku79zYnlkPnEWWsGacu5TfuaYMoHS08iU22EaS3leNquXEHkDFlQnD6/xYwVHk
         ocq99hcZdYDpOn/i3rrtpUCkKbDOYrm2UxI7bq8X9WB8bjTKi1I3YbKC2Qy6DOBUP7N+
         lHRSNvONDZJiJwErmzZB5ySlpUIg0zE4WD+mynZOJM6r1DgsTkTxZUmUr/DFsc8Wz9iE
         xTInViUA2BFQIK6fP0SxqEoyMlZjnWmbX+Rwfyh7ku2hz5CJRI0S1KHkgPXGUKBdwjnX
         ZtHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779555220; x=1780160020;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=utnaPVtluIiTyEzwOhIMr0EOUnXAQ6TiN8kOxttnpoQ=;
        b=n+B9L40af9PMSsEROvTrBx/0HobXJ3evRr5jFipuketMGnoq4f9j5ofulA6rH74uAy
         OW0JH3buIiB84lZ0LNNonzUZC4tJXWzjFAJEyEhWKTYhA7ygqd1lbognECkhzNHLRSL0
         zyUDRw28aQUuePBfK/uStV4FPxAbYrmOWqsxvilmS9OrDaDtNnkCV8YeCI9PtxwuhV+Y
         t1aVndLs6Z4qxbbwi9XQRMtCMQVvBJSFwhwc3RhrKWL2F4vYIgYe4MqOt7MSFgDti1pX
         RaQd4SzxeoLKPzhiGBgqfKnfE4Lhx4BZXyrW6lVun7ea9L86wuDDZEFQo2bCdqYRm0l+
         uwnA==
X-Forwarded-Encrypted: i=1; AFNElJ9yuIgtM7SsSfYWJYMOimqbOrP5VvPolWyU9lZlByQm4ex+FL26KII1KGGzfyph2OVlhGDxFqRFFgEgXQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzPdeBfy08CcMysLa0BghIeDZIY5hO2NXsUsmsouutrP5Yg21Nc
	T8tgA8xgXhD2iF/1dU5R4pwiDeBND5J/M5BA4F+4YbwqRu3ZC92srmW0
X-Gm-Gg: Acq92OFPEz2B55qO29yo4kZw3NebS3K1aszXndCiHo2wfG0y5UDnGjo7jCMelF9amYJ
	r2XM3jVtDUfLO8uJSUpNE2J6PT4R6E5yi0AmbmB3wbQaN5YAjYp1WnFOfRy24VZEReHBvk4zzLD
	Ur41tPxl2p9S7nl9HuNsp+QwKLwfaNBPpfuP2M8aZ8K0YYTLFnlXsu3ajzJgrdS8azmsAA1CdPo
	WOIuhcAsgFS7ZBTofpKsFAXnxVqq/Ap//qATcH3NX3xMc5IHxjFf+v4dKi54nZ0N0d8/7mgTiLo
	3RsiNzOWrd+JofXQV0iO8Z9OYDgXWNQ/t4RQM8ey7Fk9DbLvEXgnlJIputsxROzUDkHl6PWKrcQ
	s+sYkB1bocRrT6cHHvopMtnupXe43z9d4s4FtHtobD0+e2T/2MeWK8KS+7p0j6QmhhyufA1Hch/
	aN5QUQIJhhSZGcyCgLdmy5+6CmTQm8CS753nE9Iu4zQAAXVOM+T5TelxvDqZ0=
X-Received: by 2002:a05:6512:2147:b0:5aa:b6b:93c3 with SMTP id 2adb3069b0e04-5aa323aaec3mr1730104e87.45.1779555219626;
        Sat, 23 May 2026 09:53:39 -0700 (PDT)
Received: from va-HP-Pavilion-Desktop-595-p0xxx.mshome.net ([193.0.150.248])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aa32ceb558sm1293839e87.41.2026.05.23.09.53.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 23 May 2026 09:53:39 -0700 (PDT)
From: Valery Borovsky <vebohr@gmail.com>
To: mchehab@kernel.org,
	crope@iki.fi
Cc: hverkuil+cisco@kernel.org,
	linux-media@vger.kernel.org,
	stable@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] media: rtl2832_sdr: use vb2_video_unregister_device() on remove to fix DMA leak
Date: Sat, 23 May 2026 19:53:37 +0300
Message-ID: <20260523165337.286141-1-vebohr@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <3c427dde-54c5-4a63-bcab-dd0079593ba1@kernel.org>
References: <3c427dde-54c5-4a63-bcab-dd0079593ba1@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-62674-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FROM_NEQ_ENVFROM(0.00)[vebohr@gmail.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_NONE(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	TAGGED_RCPT(0.00)[linux-media,cisco];
	RCPT_COUNT_FIVE(0.00)[6];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,sashiko.dev:url]
X-Rspamd-Queue-Id: 12BDB5BFE64
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

rtl2832_sdr_remove() runs on USB disconnect and clears dev->udev to
NULL before any pending streaming teardown has run. When user space
later closes its file descriptor, vb2 calls rtl2832_sdr_stop_streaming()
which in turn calls rtl2832_sdr_free_stream_bufs(). That helper releases
each coherent buffer with:

    usb_free_coherent(dev->udev, dev->buf_size,
                      dev->buf_list[dev->buf_num],
                      dev->dma_addr[dev->buf_num]);

usb_free_coherent() returns immediately when its dev argument is NULL,
so every DMA stream buffer that was live at disconnect is silently
leaked. The URBs allocated in rtl2832_sdr_alloc_urbs() outlive the
device for the same reason.

The rtl2832_sdr driver uses vb2_fop_release() in its file_operations,
so replace video_unregister_device(&dev->vdev) with
vb2_video_unregister_device(&dev->vdev) and move it before clearing
dev->udev. vb2_video_unregister_device() releases the vb2 queue, which
synchronously runs rtl2832_sdr_stop_streaming() if streaming is active,
so URBs and coherent DMA stream buffers are freed while dev->udev is
still valid.

vb2_video_unregister_device() locks vdev->queue->lock (vb_queue_lock)
internally, and stop_streaming() locks v4l2_lock, so the previous outer
mutex_lock(&dev->vb_queue_lock) / mutex_lock(&dev->v4l2_lock) pair
around the unregister sequence would self-deadlock and has been removed.
A short v4l2_lock critical section around dev->udev = NULL remains so
any ioctl path that still holds the file descriptor sees coherent state.

Issue identified by automated review of the INV-003 series at
https://sashiko.dev/

Fixes: 771138920eaf ("[media] rtl2832_sdr: Realtek RTL2832 SDR driver module")
Cc: stable@vger.kernel.org
Suggested-by: Hans Verkuil <hverkuil+cisco@kernel.org>
Signed-off-by: Valery Borovsky <vebohr@gmail.com>
---
Changes since v1
(https://lore.kernel.org/linux-media/20260513055745.146998-1-vebohr@gmail.com/):
- Rewritten per Hans Verkuil's review
  (https://lore.kernel.org/linux-media/3c427dde-54c5-4a63-bcab-dd0079593ba1@kernel.org/):
  replace video_unregister_device() with vb2_video_unregister_device()
  and move it before clearing dev->udev, instead of open-coding the
  URB/DMA teardown. vb2_video_unregister_device() releases the queue,
  which synchronously calls stop_streaming() while dev->udev is still
  valid, so the explicit rtl2832_sdr_kill_urbs() /
  rtl2832_sdr_free_urbs() / rtl2832_sdr_free_stream_bufs() block from
  v1 is no longer needed.
- Dropped the outer mutex_lock(&dev->vb_queue_lock) /
  mutex_lock(&dev->v4l2_lock) around the unregister sequence:
  vb2_video_unregister_device() acquires vb_queue_lock internally and
  stop_streaming() acquires v4l2_lock, so holding either of those
  while calling the unregister helper self-deadlocks.
- Rebased on media-committers/next.

 drivers/media/dvb-frontends/rtl2832_sdr.c | 18 +++++++++++++-----
 1 file changed, 13 insertions(+), 5 deletions(-)

diff --git a/drivers/media/dvb-frontends/rtl2832_sdr.c b/drivers/media/dvb-frontends/rtl2832_sdr.c
index c564485e3bbb..c1f5f07c42a8 100644
--- a/drivers/media/dvb-frontends/rtl2832_sdr.c
+++ b/drivers/media/dvb-frontends/rtl2832_sdr.c
@@ -1477,14 +1477,22 @@ static void rtl2832_sdr_remove(struct platform_device *pdev)
 
 	dev_dbg(&pdev->dev, "\n");
 
-	mutex_lock(&dev->vb_queue_lock);
+	/*
+	 * vb2_video_unregister_device() releases the vb2 queue, which
+	 * triggers rtl2832_sdr_stop_streaming() if streaming is active.
+	 * stop_streaming() uses dev->udev to free URBs and coherent DMA
+	 * stream buffers via usb_free_coherent(), so it must run before
+	 * dev->udev is cleared. vb2_video_unregister_device() locks
+	 * vb_queue_lock internally and stop_streaming() locks v4l2_lock,
+	 * so neither may be held by the caller.
+	 */
+	v4l2_device_disconnect(&dev->v4l2_dev);
+	vb2_video_unregister_device(&dev->vdev);
+
 	mutex_lock(&dev->v4l2_lock);
-	/* No need to keep the urbs around after disconnection */
 	dev->udev = NULL;
-	v4l2_device_disconnect(&dev->v4l2_dev);
-	video_unregister_device(&dev->vdev);
 	mutex_unlock(&dev->v4l2_lock);
-	mutex_unlock(&dev->vb_queue_lock);
+
 	v4l2_device_put(&dev->v4l2_dev);
 	module_put(pdev->dev.parent->driver->owner);
 }
-- 
2.51.0


