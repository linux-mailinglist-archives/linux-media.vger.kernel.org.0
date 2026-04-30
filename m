Return-Path: <linux-media+bounces-60055-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0C5NO94c82kvxQEAu9opvQ
	(envelope-from <linux-media+bounces-60055-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 30 Apr 2026 11:11:58 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DC4D49FACB
	for <lists+linux-media@lfdr.de>; Thu, 30 Apr 2026 11:11:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 23A643015E22
	for <lists+linux-media@lfdr.de>; Thu, 30 Apr 2026 09:10:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D5BF0374E6C;
	Thu, 30 Apr 2026 09:10:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="m90HewGv"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D5C1353ED9
	for <linux-media@vger.kernel.org>; Thu, 30 Apr 2026 09:10:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777540216; cv=none; b=dCqzuOhWDGqesJdGIEaNVdGqJrpVidid2G+FIC4AwsGRw8p9XEE5Zkh5tOWqukh4Bf3Y0shqL8/a+F7zTnn7OZEF9GbQ21PQVzppGDxhPOnMtaiM+EKIg6Iw2B/TUxNM0RSWHEchIDSO8VsItmVQ7Mv5OyBkHQPJT3qO5FBq0M0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777540216; c=relaxed/simple;
	bh=4VajGRHwqqW1OW3StTaeSoxELJbW+gxNIgrIVHaeZ2U=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=n20VvqixPGoKDpj4a2lSrKryLyDn3S90S+WQJG48pOW7lMcELu30fG+cvXGNLiY2UR2KSHX1/9FrrRKL1nwG925m8gBhxnxplFTxLhQ95GWlFucGXeMj6DvrQV+5gBirWXr2gOlcjkI/Ns21lkAPqNlfxUVLN7gHkic3v2l6OVs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=m90HewGv; arc=none smtp.client-ip=209.85.210.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-82f9fdfc965so338406b3a.1
        for <linux-media@vger.kernel.org>; Thu, 30 Apr 2026 02:10:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777540214; x=1778145014; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=g24cpwlhdgkpjmh/f0yPDDS7asQqXWzHOuNgFla5f/U=;
        b=m90HewGv100uIRFDG0BMEYLOBXlfnPy3bR7cIVIjwh9f6mQD5Z+y3tAzDtP7R25Sdj
         R1KAJ9A6kOpOKuK6SFhD3Rm5y8koI86Jboleu633njtz/U20b7p0iwB88O1j2w4YfVE9
         9TShH8PCAqLWTCzILqL34MGmX8Ul+WX2hStbqWqjEOJObYYJEwoTavDz7xq7yLzcse1u
         RIGSJXLq4X7/HIBY/Vzf2NkjaBMT4vDL2VE2QVQxpMqPWRWuSffR3mAPvaxe0kCxYlAR
         JIehC7DfAn4askQ6LwQ3wabVM2OqnwOOIdlccEsCHoX95Y9OGGVulNqG3n+Tsq/zbbmy
         v9rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777540214; x=1778145014;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=g24cpwlhdgkpjmh/f0yPDDS7asQqXWzHOuNgFla5f/U=;
        b=joRRgbjf9RJqdph3K14r2hRnmftUa44fp0gCv5bl74jXGYAT8NI1OvEKLmNykJIG6f
         F0LCgKXZgeYM2EEfrDf4V1XxyNk292jf9gky7haPX9EWSbIShf8Ce2Ex3W/zlpaXpMOo
         eOGZxnf2KY2Cut2JSuoNe/JAl2KxzVA3igA/kUD+OQi/1MZZNn5xaplLrE8KYS9cQuAk
         Fn74Ch19RxSls+tqrGYLQV9yYGOd6j/b6iKvnwXVYbaHAwcWjQcEVmARJ4ks9J7cnEHl
         BmJNMmW1wMGU4NT5sgsKn/jMk5mOZ9KrS33Pem6XbJp/2N8srC6xTPa8gJdMYwzb3lWG
         h8QQ==
X-Forwarded-Encrypted: i=1; AFNElJ9ZpHkRtzUEASrPmyVpmcdWnTYNuPMNojx3dW8KqNzSdS58niZNzkD/J6F3LPv+6DeaigYKRrIOucQLNA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzu/62tDeu/zCl883u2jU0GANiHNs06MtZbDArEvrmMGGRwdZ8l
	vMUQeWD+n4TTUUj0XoKCEbJiytM9qlG4CvI2CWFalHU/vCzTUOD4S0iWnMO5OHPlq2+1aA==
X-Gm-Gg: AeBDiesqhPIPVlAMhOnkxp9k76AnCtNX0JJqBghS8lB+/eZe/De9yDer4eKlkkaCCCF
	O7aw+8xldfidtiwvNo3TT4VF8P9VgTi5GhU1hred2qH58UmnjNAo3AmfbMo6C/cSYLf4S97Wy5E
	6+jfyxuRsDyjlQDe/wQRbKLOSzOBt5QzbgKfH5A0AtFEIJOdEVdMQhqB7DNYLdhPKpMYhcmLLj7
	UDmVHsB4otFFvqnsMkeU6tD69h9rwlrz5l4JC8rBVxjKWgO1yzYV3xkl5h1Cdr5fT1WzcwHcI2o
	pQKMNYm/Lb9IDcxYNO7NJFIsnLuREHRWPuzrfP4e6G0PgSAupevflpVrjS8EgPsmMTr1J+cMqhi
	b2vHURs8uGMEkkA0HHNzZS2Ur6HgtSjinjAmcxx2RP5SCSQWNkh1G1e8qtlbGkZfQg9nEJ6kpvR
	rnT5SnVuvR6n1vKNpT
X-Received: by 2002:a05:6a00:3021:b0:82f:5a77:10e8 with SMTP id d2e1a72fcca58-834fe0bd639mr2256806b3a.20.1777540214429;
        Thu, 30 Apr 2026 02:10:14 -0700 (PDT)
Received: from lgs.. ([2001:250:5800:1000::5a26])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-834ed80df96sm4449025b3a.54.2026.04.30.02.10.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Apr 2026 02:10:13 -0700 (PDT)
From: Guangshuo Li <lgs201920130244@gmail.com>
To: Corentin Labbe <clabbe@baylibre.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil@kernel.org>,
	mjpeg-users@lists.sourceforge.net,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Guangshuo Li <lgs201920130244@gmail.com>
Subject: [PATCH] media: zoran: fix video_device double free
Date: Thu, 30 Apr 2026 17:08:01 +0800
Message-ID: <20260430090801.455012-1-lgs201920130244@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 4DC4D49FACB
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com];
	TAGGED_FROM(0.00)[bounces-60055-lists,linux-media=lfdr.de];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lgs201920130244@gmail.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[gmail.com:+];
	TAGGED_RCPT(0.00)[linux-media];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]

zoran allocates zr->video_dev with video_device_alloc() and installs
zoran_vdev_release() as the video_device release callback. That callback
frees the video_device.

After video_register_device() succeeds, the video_device lifetime is
managed by the V4L2 core. video_unregister_device() eventually invokes
the registered release callback, so the explicit kfree() after
video_unregister_device() frees the same object again.

There is also a registration failure path with the same risk. If
device_register() fails inside video_register_device(), the V4L2 core
calls put_device(&vdev->dev), which may run v4l2_device_release() and
invoke zoran_vdev_release(). Control then returns to
zoran_init_video_devices(), which frees zr->video_dev again.

Fix the successful unregister path by dropping the extra kfree(). For
registration failures, temporarily use video_device_release_empty while
calling video_register_device(), so that any release callback run from
the V4L2 core's registration failure path does not free the zoran-owned
video_device. zoran_init_video_devices() then remains responsible for
freeing the allocation exactly once.

This issue was found by a static analysis tool I am developing.

Fixes: 82e3a496eb56 ("media: staging: media: zoran: move videodev alloc")
Signed-off-by: Guangshuo Li <lgs201920130244@gmail.com>
---
 drivers/media/pci/zoran/zoran_card.c | 29 +++++++++++++++++++++++++---
 1 file changed, 26 insertions(+), 3 deletions(-)

diff --git a/drivers/media/pci/zoran/zoran_card.c b/drivers/media/pci/zoran/zoran_card.c
index d81facf735d9..e7268718f137 100644
--- a/drivers/media/pci/zoran/zoran_card.c
+++ b/drivers/media/pci/zoran/zoran_card.c
@@ -863,10 +863,12 @@ int zoran_check_jpg_settings(struct zoran *zr,
 
 static int zoran_init_video_device(struct zoran *zr, struct video_device *video_dev, int dir)
 {
+	void (*release)(struct video_device *vdev);
 	int err;
 
 	/* Now add the template and register the device unit. */
 	*video_dev = zoran_template;
+	release = video_dev->release;
 	video_dev->v4l2_dev = &zr->v4l2_dev;
 	video_dev->lock = &zr->lock;
 	video_dev->device_caps = V4L2_CAP_STREAMING | dir;
@@ -875,17 +877,36 @@ static int zoran_init_video_device(struct zoran *zr, struct video_device *video_
 	video_dev->vfl_dir = VFL_DIR_RX;
 	zoran_queue_init(zr, &zr->vq, V4L2_BUF_TYPE_VIDEO_CAPTURE);
 
+	/*
+	 * zr->video_dev is allocated by zoran_init_video_devices() and the
+	 * caller frees it again if registration fails. If device_register()
+	 * fails inside video_register_device(), the V4L2 core may still run
+	 * vdev->release() from its put_device() cleanup path. Use an empty
+	 * release callback while registering, so that this failure path cannot
+	 * free zr->video_dev before control returns to the caller.
+	 *
+	 * Restore zoran_vdev_release() after successful registration, since
+	 * the V4L2 core owns the video_device lifetime from that point on.
+	 */
+	video_dev->release = video_device_release_empty;
+
 	err = video_register_device(video_dev, VFL_TYPE_VIDEO, video_nr[zr->id]);
-	if (err < 0)
+	if (err < 0) {
+		video_dev->release = release;
 		return err;
+	}
+
+	video_dev->release = release;
 	video_set_drvdata(video_dev, zr);
 	return 0;
 }
 
 static void zoran_exit_video_devices(struct zoran *zr)
 {
+	if (!zr->video_dev)
+		return;
 	video_unregister_device(zr->video_dev);
-	kfree(zr->video_dev);
+	zr->video_dev = NULL;
 }
 
 static int zoran_init_video_devices(struct zoran *zr)
@@ -897,8 +918,10 @@ static int zoran_init_video_devices(struct zoran *zr)
 		return -ENOMEM;
 
 	err = zoran_init_video_device(zr, zr->video_dev, V4L2_CAP_VIDEO_CAPTURE);
-	if (err)
+	if (err) {
 		kfree(zr->video_dev);
+		zr->video_dev = NULL;
+	}
 	return err;
 }
 
-- 
2.43.0


