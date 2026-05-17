Return-Path: <linux-media+bounces-61845-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kDifBnymCWqxjQQAu9opvQ
	(envelope-from <linux-media+bounces-61845-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sun, 17 May 2026 13:29:00 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 63043560B90
	for <lists+linux-media@lfdr.de>; Sun, 17 May 2026 13:28:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id B1E22301389E
	for <lists+linux-media@lfdr.de>; Sun, 17 May 2026 11:28:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BDD4D361DBC;
	Sun, 17 May 2026 11:28:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ph92M+Xm"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09D9C33FE36
	for <linux-media@vger.kernel.org>; Sun, 17 May 2026 11:28:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779017316; cv=none; b=XVrdOGe+LVaJbe+fUHgmAb4FqEPRSXlKOI2krorwRKKYn5QRBqPOLPT0HNpuXbP52QF9JKKdhjaeT+z8sl8xt/QnQGVc12fMdFxzJ+XR4CLg5OMHU8kOGkbkG3exQS8/8AKmsWgvkQ+XON7cMk8BbmiNTx3zEVQnMz5W/QuQLpo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779017316; c=relaxed/simple;
	bh=nTtDAhHlxRu8GFL/czu4etZg9Ouuv3xLOIpHKixnKzI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=X98SlZsEXrKlklqR9OAoDBpW5wqMjA9GOMTmBgAfAp9DIfohXAHzXYWzLcqwJmebIGcjEhnoR/F+aLErL6NIOXJDstWeu/d958h7X/bVxfOvCGI/SaGYXfBxWdE7KrqQhfQvYsCA5e2sCDshSKorJQvVAaBgVHSlia+d90we7qI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ph92M+Xm; arc=none smtp.client-ip=209.85.210.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-83d31ac4017so475547b3a.3
        for <linux-media@vger.kernel.org>; Sun, 17 May 2026 04:28:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779017314; x=1779622114; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Q2HNvBLsSkl5+JzqDGgnt/yv9ml8/MlQvATo1olceFk=;
        b=Ph92M+XmtCDf3laZ9++xr07PqHhc987UahoXHgJ6GQlHtTwuqyZZxnWVzADfSlpw5u
         Eb7VuczMC8TBxY71ff24OVrVjtuRuSDtkZProTaNTBDAUMF5Em0+FbcHMs98EXPm+5R7
         ig739PhVJwRwx4ZF4rkXey6v3Q5fZXdJ20pvTvAyEXeai1xuArhi8zNDGJNmzGCYnnDM
         zgAqyR+KLS6Kxv6pEDzosOUUPE3/WiWuMkW7fvpM0EINaUx2+AuwYr+xmVyyhJGRLUzW
         yWv/GKDIIrXFXjQoV4Gd4mYmcCui5LNWI9O0ltJFlDWP+HybGPe0JNI0P5DZgSMB+xUs
         JhUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779017314; x=1779622114;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Q2HNvBLsSkl5+JzqDGgnt/yv9ml8/MlQvATo1olceFk=;
        b=Ef6hPMG64oLFTplac3qA5gyiFOaLb7GOqYUhm82VGbt2kyeKQurZS/9kZ8//pBYzSg
         NF4SwmkxL3XxDkE6Voe+n1d3U/rIKWzI72xKuyjkP5ZuUzlOp7iV3EkB1KAmY6FaNe7P
         4iD6aaWZAXVxFldefG5WYHSuR+XVeeqv7RFyYNIoYrpaKnoH6SbLpmy7Z8MDk/kzRsTh
         pCV6Hhg1rARFP5x1EDGtMVt6K2LONo3tTM2onDBi/MUi1OvCox1W5i8ZuORloYwAoxJM
         1CY3IPxDrYgJh5+grXe8WdFh7R6sxWSYBOVENi2tsaS6g5Rr+cxJVU3M2oyynKqD4KZn
         ZmFg==
X-Forwarded-Encrypted: i=1; AFNElJ/cypYu17w4rw0kexn1XFNoowDd94fZtmwkTmI+W0OfO6T4/7iIE2x3vQupSvOjMFCyFAoi4Rm9v2DWvA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxzFBQhKtt3701idKmdJjqjIh/u9YEIcvnKHXf3SIvvaPWLWPCg
	v1nRIEmH/RLwIA3xajJy+ZDep6qYDzP5CcM9ftYNFBP+K9NV5KGT/JxN
X-Gm-Gg: Acq92OHQvoaf9eVq7bhi4DFgu6Cv6/M9FnlpJ97S/mSLnQ5vezrwjFHO/+C+aVolmwG
	JeQAkODtoutP4Bb28ZKtr6ueQRW3SB66lfSP97d2bgseYPKt3b8osVjTCFpPwzsAUcxkVP1YIdm
	O/SHiGKDUOrn97Ss9FvFM0UULH3WbzcuHmfjn7idRHAPghVFDNrrH3pbsjVD0wFbyBP8V+ONf1R
	iggW9fvDi78aKlLw0gWn79z13+a+RaRIVSE5kM4MP29krNW0lrZSmbBQu1gd/i5trbnkiTdi3VC
	GG+WnzzSPTEDF04WdC4yENPtGhK36GkhnqqH5uVb9XDy4BP6+o9GmLwmSTlbpdorcowHsPhW8qF
	xgVh5V4jqpXp6lJ4ptD1Sfpud9ahCAtPc9qeuWGJyoRRhTXJCNI0fhMLGOozWLd4jvDYwFMbJdT
	NprUgLoQ==
X-Received: by 2002:a05:6a00:39a8:b0:82f:7252:38cf with SMTP id d2e1a72fcca58-83f33cc34bcmr10847620b3a.16.1779017314366;
        Sun, 17 May 2026 04:28:34 -0700 (PDT)
Received: from lgs.. ([2001:250:5800:1000::f280])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-83f19c5ce1fsm11392149b3a.35.2026.05.17.04.28.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 May 2026 04:28:33 -0700 (PDT)
From: Guangshuo Li <lgs201920130244@gmail.com>
To: Bluecherry Maintainers <maintainers@bluecherrydvr.com>,
	Andrey Utkin <andrey_utkin@fastmail.com>,
	Ismael Luceno <ismael@iodev.co.uk>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hans.verkuil@cisco.com>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Guangshuo Li <lgs201920130244@gmail.com>
Subject: [PATCH] media: solo6x10: avoid double free on display register failure
Date: Sun, 17 May 2026 19:26:03 +0800
Message-ID: <20260517112603.947790-1-lgs201920130244@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 63043560B90
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com];
	TAGGED_FROM(0.00)[bounces-61845-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[bluecherrydvr.com,fastmail.com,iodev.co.uk,kernel.org,cisco.com,vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lgs201920130244@gmail.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_SEVEN(0.00)[8];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Action: no action

solo_v4l2_init() allocates a video_device with video_device_alloc() and
releases it from the fail error path if video_register_device() fails.

This can double free the video_device when __video_register_device()
reaches device_register() and that call fails:

  video_register_device()
    -> __video_register_device()
       -> device_register() fails
          -> put_device(&vdev->dev)
             -> v4l2_device_release()
                -> vdev->release(vdev)
                   -> video_device_release(vdev)

  solo_v4l2_init()
    -> fail
       -> video_device_release(solo_dev->vfd)

Use video_device_release_empty() while registering the device so that
registration failure paths do not free solo_dev->vfd through
vdev->release(). solo_v4l2_init() then releases solo_dev->vfd exactly
once from fail. Restore video_device_release() after successful
registration so the registered device keeps its normal lifetime handling.

This issue was found by a static analysis tool I am developing.

Fixes: a4056c2fb4c4 ("[media] solo6x10: convert the display node to vb2")
Signed-off-by: Guangshuo Li <lgs201920130244@gmail.com>
---
 drivers/media/pci/solo6x10/solo6x10-v4l2.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/media/pci/solo6x10/solo6x10-v4l2.c b/drivers/media/pci/solo6x10/solo6x10-v4l2.c
index 35715b21dbdf..6ce489919ecf 100644
--- a/drivers/media/pci/solo6x10/solo6x10-v4l2.c
+++ b/drivers/media/pci/solo6x10/solo6x10-v4l2.c
@@ -647,6 +647,7 @@ int solo_v4l2_init(struct solo_dev *solo_dev, unsigned nr)
 		return -ENOMEM;
 
 	*solo_dev->vfd = solo_v4l2_template;
+	solo_dev->vfd->release = video_device_release_empty;
 	solo_dev->vfd->v4l2_dev = &solo_dev->v4l2_dev;
 	solo_dev->vfd->queue = &solo_dev->vidq;
 	solo_dev->vfd->lock = &solo_dev->lock;
@@ -690,6 +691,8 @@ int solo_v4l2_init(struct solo_dev *solo_dev, unsigned nr)
 	if (ret < 0)
 		goto fail;
 
+	solo_dev->vfd->release = video_device_release;
+
 	snprintf(solo_dev->vfd->name, sizeof(solo_dev->vfd->name), "%s (%i)",
 		 SOLO6X10_NAME, solo_dev->vfd->num);
 
-- 
2.43.0


