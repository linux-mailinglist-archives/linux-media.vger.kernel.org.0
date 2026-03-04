Return-Path: <linux-media+bounces-54454-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WFsBBWIEqGkRnQAAu9opvQ
	(envelope-from <linux-media+bounces-54454-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 04 Mar 2026 11:07:30 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 68E531FE1AA
	for <lists+linux-media@lfdr.de>; Wed, 04 Mar 2026 11:07:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2B8DA306DF3C
	for <lists+linux-media@lfdr.de>; Wed,  4 Mar 2026 10:06:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5EA4239F188;
	Wed,  4 Mar 2026 10:06:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GC5xXGgF"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03206392802
	for <linux-media@vger.kernel.org>; Wed,  4 Mar 2026 10:06:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772618769; cv=none; b=iK4wBTQ1CjgBed76FkC6EI+zRkpi5x5PFeCDcLWOU7/2UXs4kxwqXV/14xBgRTgJsVIzupnWT6VOQVki45+oE6UNBhqck59idpz32wdcFYdzR9Hmn9lDngzOPn5a++NOMAu15vheUY4dGoa8f30zsV3wNg5d2/HVxOE2ZAWpZxE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772618769; c=relaxed/simple;
	bh=CBiwXMAd3YWbKWaXPfqC7/kVDJWdCo99WBgOyx00/mI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=sWRzudPpGWTzaJXQs2m0SeMXlTmMoM3b9CPu4ZCyvECEQXp/SfbTPFPPHfh17thAZldqA3+0hFMLVzY5CiULd/bGD+paDs1ulI2ri6iZKzWoLrCpetgt3ElLqG5QSwnV0mcgYhBmaBW44ogu6o8e0LpwhOzbuiNrdysxB2wleWs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GC5xXGgF; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2ab46931cf1so49246415ad.0
        for <linux-media@vger.kernel.org>; Wed, 04 Mar 2026 02:06:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772618767; x=1773223567; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=bsGz9NobNNMerVOOjKKJ0LgJD2SxFYXhHAVBSa0LnTg=;
        b=GC5xXGgF3qmGctqo4V4TfFL8C1s/E1OaOh6Xuw9JpWcxhQRm+dtKBGOoPxtf3aRok3
         xrgH7QTmLTFU0+iV4HRaGKbc5n3pWs2nMBdzqFBp6Pezl3hiJ9Y6DnxnfOImMDSZWaEG
         AfxTku9Dx9E2T96j1sIZtjW3eC3GEoz0R9WtL/3wnKL5RWAKIEkC9BN/3MJ3Z5R+s44n
         deExRdxTuhRx6OmCjrUpUqJQS1y5qdFjpvJgVJgJVQln0rLCBRX+z4HYG+vzhxIdpO8e
         ePPw3NYOvOqTlE+o/vVEl8v0Wh7gIlPFcbG99vM2dlYyoDSta1A1nWLi1y9zQ3RMWiL0
         SO/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772618767; x=1773223567;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bsGz9NobNNMerVOOjKKJ0LgJD2SxFYXhHAVBSa0LnTg=;
        b=AwRxb/LroypefboTwq/YP/a3WfxoJAVzZH02NB4YJXGES3Ii2GR8RLuswjr59ZFkTM
         3dcoakmLm0me4Hww0tQT5rnGDzgtxvHcqjoFxENyif7sn4/nsX9rUdugcB3pwkHlKy8z
         FdNaJ7BezcgFMfMjT+O9kb/CdO1NW3nRbC3ilCnVU1a0YZj9aY2OdqiiTKE2ldg1uaRO
         LDsNbgip0LfMsloS5EorDTnFmgIdagklwzevCSN6a73SALtRd4FTBUAAJ9lX5tYTH0B1
         nTPdVX8cUcDxR/WjapRnlYYR1REEkfAXF2HBA1McT0aIaVpr77YIYquiqmDLaFvjSZ1e
         4XUQ==
X-Forwarded-Encrypted: i=1; AJvYcCVqh5AOzYWFCVsvZaTAvDBQ1EM23xstnJaGZlJFizJ1Ccohx6JBfGf5d/jw9lLOgR2Ji/Ll6laASaAGBQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzJITKX57cxfrjhgS/ljVOEOSmdSTnGyUQi7T2Iau7gH3DJRJhd
	fdmen7NhAkLWJRFcI4+kW3vVBgKz85eJ3gSUUZIT5OT/a02ZNXMcNbj6
X-Gm-Gg: ATEYQzxGtIGyIe8HoU2jQyLVSFVhVeB7yPwtU5PDk2+SjqOBU2HY3K/4F6Dle9ny8r5
	7+qwI1NAvdQPOv6xrX0QBlaChQ7aNynrnlIShLhyF09V2pQQkiTSi2TflE4uQmxIYdq7wcrSPM3
	FC6Rn0j1lDyXWWre/15wJAV4UVykKS1CLQ7/1ZVuFduk2PNk8G6zyBZ65yW6Zf6oPr3QlMP5yvm
	QVyyAphsVbVagsUZMGdKwcIYSguFwBqoDte3Zjg3sS2xdC2R/NrhQ0kPzAAuSfa9kA2ld63s+Do
	Wn3Z20R0QSjimXEnUyW634uInWJiBFqajapaBLSjBcShp8rYZ9mYM7oj8Q14HQ6b9pGqzRZZW1n
	19bTgpYt/3CH9vEfh2j21ND7q3VfKzk0zFge36skpbYEO8cFnLxAgdD4xZ7hHU3xsXGiFCVi+qj
	v0HzMvIgZRFo+2nsPlK7En
X-Received: by 2002:a17:902:fc87:b0:2ad:da28:8c7a with SMTP id d9443c01a7336-2ae6ae0bfefmr15253245ad.8.1772618767233;
        Wed, 04 Mar 2026 02:06:07 -0800 (PST)
Received: from rockpi-5b ([45.112.0.200])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2adfb5b48f4sm191220555ad.13.2026.03.04.02.06.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Mar 2026 02:06:06 -0800 (PST)
From: Anand Moon <linux.amoon@gmail.com>
To: Neil Armstrong <neil.armstrong@linaro.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Maxime Jourdan <mjourdan@baylibre.com>,
	Hans Verkuil <hverkuil@kernel.org>,
	linux-media@vger.kernel.org (open list:MESON VIDEO DECODER DRIVER FOR AMLOGIC SOCS),
	linux-amlogic@lists.infradead.org (open list:MESON VIDEO DECODER DRIVER FOR AMLOGIC SOCS),
	linux-staging@lists.linux.dev (open list:STAGING SUBSYSTEM),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/Amlogic Meson SoC support),
	linux-kernel@vger.kernel.org (open list)
Cc: Anand Moon <linux.amoon@gmail.com>
Subject: [PATCH v1] media: meson: vdec: Fix memory leak in error path of vdec_open
Date: Wed,  4 Mar 2026 15:35:53 +0530
Message-ID: <20260304100557.126488-1-linux.amoon@gmail.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 68E531FE1AA
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	FREEMAIL_FROM(0.00)[gmail.com];
	TAGGED_FROM(0.00)[bounces-54454-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[linaro.org,kernel.org,linuxfoundation.org,baylibre.com,googlemail.com,vger.kernel.org,lists.infradead.org,lists.linux.dev];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[linuxamoon@gmail.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-media];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Action: no action

If vdec_init_ctrls(sess) fails, or any subsequent initialization step
during vdec_open fails, the control handler allocated for the session
is not released. This causes a memory leak of the v4l2_ctrl_handler
and its associated control objects.

Add a call to v4l2_ctrl_handler_free() in the err_m2m_release error
path to ensure resources are properly reclaimed.

unreferenced object 0xffff0000205d6878 (size 8):
  comm "v4l_id", pid 5289, jiffies 4294938580
  hex dump (first 8 bytes):
    40 d2 49 18 00 00 ff ff                          @.I.....
  backtrace (crc d3204599):
    kmemleak_alloc+0xc8/0xf0
    __kvmalloc_node_noprof+0x60c/0x850
    v4l2_ctrl_handler_init_class+0x1b4/0x2e8 [videodev]
    vdec_open+0x1f4/0x788 [meson_vdec]
    v4l2_open+0x144/0x460 [videodev]
    chrdev_open+0x1ac/0x500
    do_dentry_open+0x3f0/0xfe8
    vfs_open+0x68/0x320
    do_open+0x2d8/0x9a8
    path_openat+0x1d0/0x4f0
    do_filp_open+0x190/0x380
    do_sys_openat2+0xf8/0x1b0
    __arm64_sys_openat+0x13c/0x1e8
    invoke_syscall+0xdc/0x268
    el0_svc_common.constprop.0+0x178/0x258
    do_el0_svc+0x4c/0x70

Fixes: 3e7f51bd9607 ("media: meson: add v4l2 m2m video decoder driver")
Signed-off-by: Anand Moon <linux.amoon@gmail.com>
---
 drivers/staging/media/meson/vdec/vdec.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/staging/media/meson/vdec/vdec.c b/drivers/staging/media/meson/vdec/vdec.c
index 4b77ec1af5a7..a5ab0c2390f5 100644
--- a/drivers/staging/media/meson/vdec/vdec.c
+++ b/drivers/staging/media/meson/vdec/vdec.c
@@ -914,6 +914,7 @@ static int vdec_open(struct file *file)
 	return 0;
 
 err_m2m_release:
+	v4l2_ctrl_handler_free(&sess->ctrl_handler);
 	v4l2_m2m_release(sess->m2m_dev);
 err_free_sess:
 	kfree(sess);
@@ -926,6 +927,7 @@ static int vdec_close(struct file *file)
 
 	v4l2_m2m_ctx_release(sess->m2m_ctx);
 	v4l2_m2m_release(sess->m2m_dev);
+	v4l2_ctrl_handler_free(&sess->ctrl_handler);
 	v4l2_fh_del(&sess->fh, file);
 	v4l2_fh_exit(&sess->fh);
 

base-commit: 0031c06807cfa8aa51a759ff8aa09e1aa48149af
-- 
2.50.1


