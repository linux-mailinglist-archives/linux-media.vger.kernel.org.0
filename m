Return-Path: <linux-media+bounces-61843-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qK0/JHOZCWqqhAQAu9opvQ
	(envelope-from <linux-media+bounces-61843-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sun, 17 May 2026 12:33:23 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D4305607D4
	for <lists+linux-media@lfdr.de>; Sun, 17 May 2026 12:33:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id C9C3F300A11C
	for <lists+linux-media@lfdr.de>; Sun, 17 May 2026 10:33:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B2964356A0D;
	Sun, 17 May 2026 10:33:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eItSEa4x"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2B7D1B808
	for <linux-media@vger.kernel.org>; Sun, 17 May 2026 10:33:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779013995; cv=none; b=N0BcH5HvwT2T0yql3zlLl11c9jmBA3YJsxg390eLuZ1PIJnCQSHjtbklso+g3hH35UqIU9V1JSd26lwvbgBjm0lB+/6ZLdiHVxSn/AFC7Aba6WLLBiSKlmmPeAwl41qf2PECerWDeeA1wPZlzGmphJr+3XAlJPnkSgx2pszcHy0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779013995; c=relaxed/simple;
	bh=RNfWrcNuMMdAktZ+QfKHuUTMe74Q0MuSB1WuvMsxwEY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=p8kMrLEI2aXKH+xrdLWODEcpzaERRTZtP3skeBp5G12O34GO7ITOqe+vMbBLJIx0hDSWQhCXaagnd2TIxJ/f5IscYhtNbxb/c1dR71FXc/oJswvnfTNGcGY0ZW+lZuKLOzWWgpEVLGdgIw84MMVxwkbQKZQRIM6iP9GnKbhlrUw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eItSEa4x; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2bcd3ac3307so7250805ad.0
        for <linux-media@vger.kernel.org>; Sun, 17 May 2026 03:33:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779013993; x=1779618793; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=thBEA4Dix+rpZLGN0ylMuIWOXzTqgDFwroQtspug36M=;
        b=eItSEa4xSueulEzlX6l/rJJNcw7NCABseRhBozyTQ6cyclMjOyHLNu1AxZQKVIthK7
         LdQeYc9q+AngepnkKFGZ2GRISDlSt0l1f1imb0sXWh7dJ1M+1TIMhMpb7HqylTpD/BkS
         PQBJl0grpjYGgXsMkpN0U7juO4TikxORMi6/w8Y6FJjZWyJAutP6MB3hv01mmkv/k1s0
         KK0o5ninHq02eg1TuZ0b+/V0lewPPmY3wXlValScw6fb+4Ecl7TorC1bHxUIgpJrAbkF
         1qLA8YM1bhfmluChPMPtrPjQM4WjDlluZNYc8dEHua67F6k+wqGBuzlXGINErJzOYJgI
         y7xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779013993; x=1779618793;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=thBEA4Dix+rpZLGN0ylMuIWOXzTqgDFwroQtspug36M=;
        b=nbkAMtHCiSVv31XjFexzDv01WGScmlD/ceRmzsn0UW+fDYJ1AzUGPmQOrVyxwsG8K5
         jJKRaQbTWN3T/mpiKmjERC1R/F1mJe/cVjq2PNHCb1AMNDANhzGSN0ik3rGhPZjeYGrW
         EMYsVRW9b1AurouqJAJQ3lXIuxDiGbA/P9H8PctILIhv33h5BbHexzKX+3wPS6mfcIcw
         aXsHKnDmF5XM5cUXiUC5vipVJwY5CD+A9uWTup5Stidfmi0/DTAHxHiFTtj9MX8CZ0Tv
         0WaGv/50HH4b5KQ27SVFwyyguf+s6bhnSQSAwgDg/pOiLhtHYllDhKeEE6fS4kw7CP4t
         g1aA==
X-Forwarded-Encrypted: i=1; AFNElJ8zKQkDDJZztxEUZnHL4u9mIb3bVTF3uwnK83KXWkuzcqxqZ5RkHSndMs8ZguqVR54LplCLzZ22fBwAhg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy0bzHxiNW3YiEfNHA40pqx+/A0a2cE2mGPhWanpoM5zLV8qcMU
	GgjysyoCNoCQW37S1bgFGlLTZZCuXHh/oU9/I9NOSSIturZjp8U1KhfY
X-Gm-Gg: Acq92OFfVio/lTvh7XKjJwBV1lE+qd3v4zGHnd+ldNQti+mTBGFuGH6rN408kNNQUrD
	/PBeic1TRQQK8DOAOmBMH9xuwU5q/TSpqow5b6GeeitjsIIa/0rfuizXWa7p6itw4auQG9rs6Wd
	PkBxlIcr4qxdIZqqn1RG3tsnYLYe6fzzha7TRh1JNyV04/nxbwdZxd33kXYhg/cquCCP54cOum/
	2Ogto8IWmbN1TpqyIbeAzlgXxJd1p1rOMDnBiU6C7lGIKkj0ltzE73UTnTc/36F7W5lyDOGWQ+1
	+pBLSTqCfEq7Y+7pV+8vf3cW/bxEHrGvTT8TpzEiFIdoA8AEKjksWf8GITYqIK/qeaJkGXPtMjq
	81Xj7Pmzb3WCMng9XlLr4eKQndQXAUQdjv5/+8UZKQ51PACUl4rOu19IywEq/VpsD1GZM16N4T1
	g7YV3SFgZXNgPWLeZguSYDtyg=
X-Received: by 2002:a17:902:c2cf:b0:2bd:3bff:432 with SMTP id d9443c01a7336-2bd7e97e0damr79504205ad.25.1779013993296;
        Sun, 17 May 2026 03:33:13 -0700 (PDT)
Received: from lgs.. ([152.32.188.52])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bd5d12372bsm142689725ad.75.2026.05.17.03.33.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 May 2026 03:33:12 -0700 (PDT)
From: Guangshuo Li <lgs201920130244@gmail.com>
To: Yemike Abhilash Chandra <y-abhilashchandra@ti.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	Benoit Parrot <bparrot@ti.com>,
	Dale Farnsworth <dale@farnsworth.org>,
	Sukrut Bellary <sbellary@baylibre.com>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Guangshuo Li <lgs201920130244@gmail.com>
Subject: [PATCH] media: ti-vpe: vip: avoid double free on video register failure
Date: Sun, 17 May 2026 18:32:33 +0800
Message-ID: <20260517103233.944142-1-lgs201920130244@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 0D4305607D4
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[gmail.com];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-61843-lists,linux-media=lfdr.de];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	FREEMAIL_FROM(0.00)[gmail.com];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lgs201920130244@gmail.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	RCPT_COUNT_SEVEN(0.00)[9];
	NEURAL_HAM(-0.00)[-0.999];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,cisco];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Action: no action

alloc_stream() allocates a video_device with video_device_alloc() and
releases it from the do_free_vfd error path if video_register_device()
fails.

This can double free the video_device when __video_register_device()
reaches device_register() and that call fails:

  video_register_device()
    -> __video_register_device()
       -> device_register() fails
          -> put_device(&vdev->dev)
             -> v4l2_device_release()
                -> vdev->release(vdev)
                   -> video_device_release(vdev)

  alloc_stream()
    -> do_free_vfd
       -> video_device_release(vfd)

Use video_device_release_empty() while registering the device so that
registration failure paths do not free vfd through vdev->release().
alloc_stream() then releases vfd exactly once from do_free_vfd. Restore
video_device_release() after successful registration so the registered
device keeps its normal lifetime handling.

This issue was found by a static analysis tool I am developing.

Fixes: fc2873aa4a21 ("media: ti: vpe: Add the VIP driver")
Signed-off-by: Guangshuo Li <lgs201920130244@gmail.com>
---
 drivers/media/platform/ti/vpe/vip.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/media/platform/ti/vpe/vip.c b/drivers/media/platform/ti/vpe/vip.c
index a4b616a5ece7..aae6cb3abe8d 100644
--- a/drivers/media/platform/ti/vpe/vip.c
+++ b/drivers/media/platform/ti/vpe/vip.c
@@ -3094,6 +3094,7 @@ static int alloc_stream(struct vip_port *port, int stream_id, int vfl_type)
 		goto do_free_dropq;
 	}
 	*vfd = vip_videodev;
+	vfd->release = video_device_release_empty;
 	vfd->v4l2_dev = &dev->v4l2_dev;
 	vfd->queue = q;
 
@@ -3107,6 +3108,8 @@ static int alloc_stream(struct vip_port *port, int stream_id, int vfl_type)
 		goto do_free_vfd;
 	}
 
+	vfd->release = video_device_release;
+
 	v4l2_info(&dev->v4l2_dev, "device registered as %s\n",
 		  video_device_node_name(vfd));
 	return 0;
-- 
2.43.0


