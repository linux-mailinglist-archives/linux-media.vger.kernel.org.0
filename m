Return-Path: <linux-media+bounces-61847-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QBQQD7upCWq/kAQAu9opvQ
	(envelope-from <linux-media+bounces-61847-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sun, 17 May 2026 13:42:51 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 90796560C86
	for <lists+linux-media@lfdr.de>; Sun, 17 May 2026 13:42:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id CA19E301B701
	for <lists+linux-media@lfdr.de>; Sun, 17 May 2026 11:42:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9CF4834D3BE;
	Sun, 17 May 2026 11:42:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eno9kdH7"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDDCE405C5E
	for <linux-media@vger.kernel.org>; Sun, 17 May 2026 11:42:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779018153; cv=none; b=sIvWO0uiXM3EehMnPmdwnZRdW9+vAgKvH+dzHOoGqE0qxLlgyUVmAnJ54PJXTX07RItjxEkxWXgM7hUfosN8TsCQ+YqMwm9Vd+BgJ1uKFmAMeMTpyAy0cvBx1StRFZITYyulI+2mrlOrBzeQSwYgtMEhXghCdFVcpa9Ee0KQ9aA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779018153; c=relaxed/simple;
	bh=ldfhWekgKUz65lgUVgxyv+2f02yeSr66f4iVl3OLWNk=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=PWUkIImYMSpoSD4SyqqUU6Pu2Gunn13y68xOl+aXuEqJkQUyt3/43qxs/mu3SWxWoLxNikB4MRCn2Klb46vk4nh/UOgT2fafE/0sSkgUuMybaWR44/HhXyAX4lho/yrXadX1tDWs7jOzKEjafmIEDp8K4Vy+Tojbe4huV4aoQ7A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eno9kdH7; arc=none smtp.client-ip=209.85.215.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-c7ffe8eeaf2so437349a12.0
        for <linux-media@vger.kernel.org>; Sun, 17 May 2026 04:42:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779018150; x=1779622950; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=aybAOu/Wnku8jJKJm8nyG/Glu+5oR3YJ4061r8jTr0g=;
        b=eno9kdH7+qA3RMKG/m/WxV8tDempTu2kEwAFQMKxzP1/esQ8YDcP4+J8/usy3uGCn9
         2m7dhTG09DIY/HmlLq+TRK9mvMuxubytAfDxvQB5P0XyGh5GCneKYYOoys9ZhbZ9nyPk
         Xt29Ddxq5OMd8WlrAY+J8Fe5N63cqRKgptc2z6iPmfB3MCxPC9nlbd9p5pk1EeD1S2/W
         5bxue7OBm41H1DQxb6uUJc9FuIMVDaX3ECkZOqDJxu55AqWqlUT0o/TSQDWu4kuNZT9X
         qgBlDqwGiZfoj1Mkk1XZcFe8U4TcdcOG5p4DECdSUt9/rGFCZJ4ZphNal8KLnPuXLPvI
         0RkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779018150; x=1779622950;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aybAOu/Wnku8jJKJm8nyG/Glu+5oR3YJ4061r8jTr0g=;
        b=DTKstfywkB/ucmz2WHvufVbFlYfNeSCdTCzTmfe3oh4selggu43ElvBlUw0DimR2I6
         mrj/QjE77TQF6U1hWQ6pztDw/CJPcp9VMLVkpEDFw+ry6hAJbhSOJEXStuXE1yveYMYF
         JjdbD2P0G+kR8vigGqhfbjAFqk1dPwfX+00G3xZ9iBSPoQ7zJT62IIsYftkImoZU5+bx
         I0NTHOFWTytP2GPUOVObUpcm7wZvXAqxXdRx5bRPBGxrDtpLxN8jESHQmNipHWUBIduO
         QI8KPy4ZGDaVOoXKheSE1jthdwZU0TgJVc0HPvMqsf7HmxisRwdN4IXHZKL62lc3v9Vr
         vJFA==
X-Forwarded-Encrypted: i=1; AFNElJ9kkHML7p9S9Wc9reFQpn0GQTbeGO9Arc6O72/Cta0SSIJ9Ww8OVv0BViMSfLvexcxoQBvlCERfnLIEWg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz9NBwORvrZxfI5nFOzLOCLIYG12UA39Lvk/iPv7grnW2PhxBlQ
	wZOZzoZnh2DFsVzS7HXY5T477wBBtMOkiiZPAsW6SPJM/rOdsMUqx6b1
X-Gm-Gg: Acq92OHbjeNfwALL9jIpUq/GuVN9a1vV1eHCwEF/s1xIiGBKYRx6E+wznOgojlS45a7
	c+GfBt0ILHCx/li70kG11hjhmc425J66EvTaWblsoXb9Y5EF060f1+wSNlcLcYAzbWyfrZHVXAT
	3e/Fm/yiNvsirDfAW5QzFshAGntkg0D9mnKZSzvWPlrD0f7tEynVSdV/l+N4dL7s6sy7Yrf5/NU
	uZpYjeO6ese9za7fgYWE4pQpT18MFBTou3hSjdVLB2OGXMV8DCXSX3i03qgZ1Ve5qk2zw0jJdw0
	cYE3F8YwDG16B4jKR4Zgsc9V6285HNAZubMlsjJmdpFr6A0HwLaIDI7fil7TXzoB6tnDvIRSuKi
	F85MXnIiPe/w3FLXbVWj8uIknDDUVL2r//aY8BRAT9PXk90LkOTrpbNDNDW2riOkQveeyBPFf6R
	34ZlITAmVwIJfw
X-Received: by 2002:a17:903:1b45:b0:2bc:ffe1:c380 with SMTP id d9443c01a7336-2bd7e86c179mr114076265ad.8.1779018150104;
        Sun, 17 May 2026 04:42:30 -0700 (PDT)
Received: from lgs.. ([101.36.106.88])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bd5bd5f30bsm135198645ad.16.2026.05.17.04.42.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 May 2026 04:42:29 -0700 (PDT)
From: Guangshuo Li <lgs201920130244@gmail.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Benjamin Gaignard <benjamin.gaignard@collabora.com>,
	Kees Cook <kees@kernel.org>,
	Guangshuo Li <lgs201920130244@gmail.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Dillon Min <dillon.minfei@gmail.com>,
	linux-media@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] media: stm32: dma2d: avoid double free on video register failure
Date: Sun, 17 May 2026 19:42:16 +0800
Message-ID: <20260517114216.950713-1-lgs201920130244@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 90796560C86
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-61847-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,foss.st.com,ideasonboard.com,collabora.com,vger.kernel.org,st-md-mailman.stormreply.com,lists.infradead.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lgs201920130244@gmail.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	NEURAL_HAM(-0.00)[-0.997];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,cisco];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Action: no action

dma2d_probe() allocates a video_device with video_device_alloc() and
releases it from the rel_vdev error path if video_register_device()
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

  dma2d_probe()
    -> rel_vdev
       -> video_device_release(vfd)

Use video_device_release_empty() while registering the device so that
registration failure paths do not free vfd through vdev->release().
dma2d_probe() then releases vfd exactly once from rel_vdev. Restore
video_device_release() after successful registration so the registered
device keeps its normal lifetime handling.

This issue was found by a static analysis tool I am developing.

Fixes: 002e8f0d5927 ("media: stm32-dma2d: STM32 DMA2D driver")
Signed-off-by: Guangshuo Li <lgs201920130244@gmail.com>
---
 drivers/media/platform/st/stm32/dma2d/dma2d.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/media/platform/st/stm32/dma2d/dma2d.c b/drivers/media/platform/st/stm32/dma2d/dma2d.c
index a3ad19256859..0e36ddfa8c7b 100644
--- a/drivers/media/platform/st/stm32/dma2d/dma2d.c
+++ b/drivers/media/platform/st/stm32/dma2d/dma2d.c
@@ -651,6 +651,7 @@ static int dma2d_probe(struct platform_device *pdev)
 	}
 
 	*vfd = dma2d_videodev;
+	vfd->release = video_device_release_empty;
 	vfd->lock = &dev->mutex;
 	vfd->v4l2_dev = &dev->v4l2_dev;
 	vfd->device_caps = V4L2_CAP_VIDEO_M2M | V4L2_CAP_STREAMING;
@@ -669,6 +670,8 @@ static int dma2d_probe(struct platform_device *pdev)
 		goto free_m2m;
 	}
 
+	vfd->release = video_device_release;
+
 	video_set_drvdata(vfd, dev);
 	dev->vfd = vfd;
 	v4l2_info(&dev->v4l2_dev, "device registered as /dev/video%d\n",
-- 
2.43.0


