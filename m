Return-Path: <linux-media+bounces-61997-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6OhCADwUC2o5/wQAu9opvQ
	(envelope-from <linux-media+bounces-61997-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 18 May 2026 15:29:32 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 07D3C56DA01
	for <lists+linux-media@lfdr.de>; Mon, 18 May 2026 15:29:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id ED000305C9CB
	for <lists+linux-media@lfdr.de>; Mon, 18 May 2026 13:17:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 97A52481243;
	Mon, 18 May 2026 13:17:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VmDnsxRx"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A55C817A2FB
	for <linux-media@vger.kernel.org>; Mon, 18 May 2026 13:17:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779110222; cv=none; b=KXdi7MpG9GN2BEPgGe6VZcmAUf3z5sq1g3dxYO6lErKn9kHwgXgsygw0dfZfYrmM769GbbgE1fIxJFZr1Wy/ceJnX0Pe7FBtDi53Zb6qSaLM2d99qMlmgv3VVsWfskHxA+soPECJ/QgD9bU2Nuc3qLoPJaXS8Fu3svnI6ptyB5c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779110222; c=relaxed/simple;
	bh=F50kce7m820nEJNgDTgDV7dt2jZ6kHeIKBH+7d3Bynk=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=tVzsC09abNfE26qWp3jzoLLYL6kYrP7eMLql9YRze8Cg4viHtUP5TtF4ecV7yZUUAxeKBLahduRLggnaRYF4I0Qi7XB7Bg+X5rNQnejIs8qIS70FvZVVTj/SNB7p0RWg5NmYl039dPKw9pzs5nwIv3tJS2g9BuVYy7JdE/SehLM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VmDnsxRx; arc=none smtp.client-ip=209.85.216.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-36936dcf19dso996489a91.0
        for <linux-media@vger.kernel.org>; Mon, 18 May 2026 06:17:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779110220; x=1779715020; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=TQnatVKvAZ1AidZJ+dfL02Tnt1fpmvrVA/OGueI656o=;
        b=VmDnsxRxt6qyUW4gBUG6Ld+aVmf/ZTc6GG4Di4+J60vvRG9iTmPICl47Z46fHI6iNg
         DV/BeuVSUZkFSRiw9qMfvXQQ/TsMnesyj3/6+ZJShN8G1FDdeDIbIFNCQpC00YFrPapJ
         bWqR9ZsenkxVFFuPYO8zfUe7qQDnqKLCpHXipfHtlD3T3UMGAWfO78bZmSh2SjgIB0Pn
         hkQUadQ2KlftsPhzzJbzzvy9kf3gnnIAxGPGYY5hYyso37FvElg3thOuH0UjtPuYH1gf
         cAtoeq7PbKlAZRgRZ8y7W2DBSQPUrWVTJ6TO00m30WiBuxLknlfSlIXLNp5ySnkwnPg8
         q3Rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779110220; x=1779715020;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TQnatVKvAZ1AidZJ+dfL02Tnt1fpmvrVA/OGueI656o=;
        b=dv5eT/BpnFK9YKB4re567WaH063/iT120BvSR1TVPTNskeowz/rkhDJYW70LD2RfqF
         SH5J7Fuskfn9RNgMGI5+I++9zOzPxaXiDy+C4xCppJNOSL0udXobDC6PXvPlXKYDYnbc
         qaQg4o5DUr619R/AlbbcyIeSRNojs3CmjgvaaH+r1srBi5wF2cT4iT/fVug6URCgWeAp
         l2QwRCYFhnkkJFkRBVmp9wDOm9h1xPE+52LAVWMBrkxI/aLiW7U+cZWzU6pmcVeR4P+a
         6INgaqrFp7HGQtIqanOanQU48mGOcTbDdFMe2LC43Ht+qPfrFVHA52LPSCeJqspiVqL0
         iRZA==
X-Forwarded-Encrypted: i=1; AFNElJ9TQQJxLusB08tpK5XSNIAk+fwhWfe5pIKcdrpZtBZsx2QGp9+XP9CPmJNAh/Y83Dv8PO7HnGMzlZCCtg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyLs+Rx4ZpaK985EhVTmUKPHJzmqX/ID3f34Bwn7q6t7aaGJLi5
	Xkiqu/fPKCXHnXduY0/Q+9G5akv8s8bKzbvPViXu0uinZ3ekf64yl/Gf
X-Gm-Gg: Acq92OE243KRqvTIsFDYMCJ9YpAPGKxISnSBR5X64y7NkVTrfOHgYms8U5wZmNe2ckd
	GjW4oujLZuGsk1NOngj0rA6SZ42ndnQ6DEyzXSAKO+p0cmImx+G8pwZ6ttzKrTXRRLWVdEYcqbQ
	0U4Kt4h7j7xkV9akaH1RAdSHWDkQV33zpyubeYb8/AIUJRPctIfLrWl07QV5Dijv+krn/s33kD1
	4vohTEUIiC+ItGhZDIZpvxg1crdm32qSPfFQhoVi90vJVT2TdcXP3jJLITtteA0F6a/JF7PYbuf
	R5Gd37sNy/qhw3lHgU2ULgMozH8tDmmW4792c+r0sUPy/1fpDcibtCVV+du+jfcgXQC4TPUJ0ye
	Llt7FKj/BaHCrE8M6oXLyED/B3jjTfeM0SbXoIh5kEZn2JM2EoURnLR1cDQCkfY7NziSVHZaOnM
	z/og0aCA==
X-Received: by 2002:a17:903:3ba4:b0:2b2:ccfb:8387 with SMTP id d9443c01a7336-2bd7e9769edmr171166715ad.28.1779110219919;
        Mon, 18 May 2026 06:16:59 -0700 (PDT)
Received: from lgs.. ([2001:250:5800:1000::f280])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bd5c26355csm149573365ad.35.2026.05.18.06.16.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 May 2026 06:16:59 -0700 (PDT)
From: Guangshuo Li <lgs201920130244@gmail.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Kees Cook <kees@kernel.org>,
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	Guangshuo Li <lgs201920130244@gmail.com>,
	Jai Luthra <jai.luthra@linux.dev>,
	Muralidharan Karicheri <mkaricheri@gmail.com>,
	Vaibhav Hiremath <hvaibhav@ti.com>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] media: omap: vout: avoid double free on video register failure
Date: Mon, 18 May 2026 21:14:12 +0800
Message-ID: <20260518131412.1005805-1-lgs201920130244@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 07D3C56DA01
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,ideasonboard.com,gmail.com,linux.dev,ti.com,vger.kernel.org];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-61997-lists,linux-media=lfdr.de];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	FREEMAIL_FROM(0.00)[gmail.com];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lgs201920130244@gmail.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	RCPT_COUNT_SEVEN(0.00)[10];
	NEURAL_HAM(-0.00)[-0.997];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,renesas,cisco];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Action: no action

omap_vout_create_video_devices() registers a video_device and releases it
from the error path if video_register_device() fails.

This can double free the video_device when __video_register_device()
reaches device_register() and that call fails:

  video_register_device()
    -> __video_register_device()
       -> device_register() fails
          -> put_device(&vdev->dev)
             -> v4l2_device_release()
                -> vdev->release(vdev)
                   -> video_device_release(vdev)

  omap_vout_create_video_devices()
    -> error1
       -> video_device_release(vfd)

Use video_device_release_empty() while registering the device so that
registration failure paths do not free vfd through vdev->release().
omap_vout_create_video_devices() then releases vfd exactly once from the
error path. Restore video_device_release() after successful registration
so the registered device keeps its normal lifetime handling.

This issue was found by a static analysis tool I am developing.

Fixes: 5c7ab6348e7b ("V4L/DVB: V4L2: Add support for OMAP2/3 V4L2 display driver on top of DSS2")
Signed-off-by: Guangshuo Li <lgs201920130244@gmail.com>
---
 drivers/media/platform/ti/omap/omap_vout.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/media/platform/ti/omap/omap_vout.c b/drivers/media/platform/ti/omap/omap_vout.c
index 8d0319a37ba8..691f97ac5ed4 100644
--- a/drivers/media/platform/ti/omap/omap_vout.c
+++ b/drivers/media/platform/ti/omap/omap_vout.c
@@ -1501,6 +1501,7 @@ static int __init omap_vout_create_video_devices(struct platform_device *pdev)
 		/* Register the Video device with V4L2
 		 */
 		vfd = vout->vfd;
+		vfd->release = video_device_release_empty;
 		if (video_register_device(vfd, VFL_TYPE_VIDEO, -1) < 0) {
 			dev_err(&pdev->dev,
 				": Could not register Video for Linux device\n");
@@ -1508,6 +1509,7 @@ static int __init omap_vout_create_video_devices(struct platform_device *pdev)
 			ret = -ENODEV;
 			goto error2;
 		}
+		vfd->release = video_device_release;
 		video_set_drvdata(vfd, vout);
 
 		dev_info(&pdev->dev,
-- 
2.43.0


