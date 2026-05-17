Return-Path: <linux-media+bounces-61848-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oKpICNGqCWq/kAQAu9opvQ
	(envelope-from <linux-media+bounces-61848-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sun, 17 May 2026 13:47:29 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 9482F560CF6
	for <lists+linux-media@lfdr.de>; Sun, 17 May 2026 13:47:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 60A9C301D6B0
	for <lists+linux-media@lfdr.de>; Sun, 17 May 2026 11:46:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D1264361641;
	Sun, 17 May 2026 11:46:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="c2ytDYwA"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 237D234EF0D
	for <linux-media@vger.kernel.org>; Sun, 17 May 2026 11:46:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779018416; cv=none; b=k52/T+sbLkh4O0WZcSlgvSXkC6cu3N4PllkVMDpI4EMAYTBF+cWj10nhj+PPaz6VY+ZDquFuh7C4hxpGJKOPZd5W+teFmas9E82GXPM6LZtKmCD2vzkuHUug1SfxARs7zi9dEEhfXZEowTNJGMkOVxPGhwnAm0ew37Xdm7B/ce4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779018416; c=relaxed/simple;
	bh=+bZSASniVZxkluqLHkj9KmClq+3fBddfwzzhV+xEhIA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=kLTw5KEWThnDTWWyuwXY5waPiI0ZNqC0iKafdtvR3GYjBfAICnqnicZT6v0rHp68wFlGr6gjS++XmXvY6pM6gCxv7ieabhJwNIAay2SzVPy0J1TbnOZqBy/ZFA1bRQzSaKOIB++VfSQtLIsWuy0kLh4AxdnzhpwooktrFkgm+ec=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=c2ytDYwA; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2bd8c4aa911so14817995ad.0
        for <linux-media@vger.kernel.org>; Sun, 17 May 2026 04:46:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779018414; x=1779623214; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Viu192jC4/rs0pGZtKEKHYWVgQLZru9+DaFpVD17To8=;
        b=c2ytDYwAEpck2Pf3PGwO6iHGyVkMB5PYFUIvUo2vo1U3/ocDv2dV54/pu5v+HoksAC
         F4XH7+2GQvCBYhRtpW8lCxEF/J5BeQaosFYHdi/XPNPwBlASP02xbz8ADyHhVzqTrdcC
         o1q1IDx+scmSYFivHmS2s5D2HUKL6J+4JSVNwoDXbCQt1sYzuV6MAIckbke82MDHHGkQ
         IzQ/5QMpsa6quIZCHO6bVkw6PH56kgBbrIulyjXsIopjbuC/YrLFgtKJ7CoS46crxPsW
         iV/dkQHcXMf6j5zCoU3oxqsGmSNdmhaaHo5ESGjg6dGFHuhsv2yE8hecYWcgM0gXcU0s
         bLGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779018414; x=1779623214;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Viu192jC4/rs0pGZtKEKHYWVgQLZru9+DaFpVD17To8=;
        b=iZxCxgOfzes67IfQbUhOSVEBc0W0kGhvMkDMfNvHWQe9wcPLNA+quXqbimGx3McxOd
         UnQhOI9CNZhAgGp2u+f5P9UhtmBjJ5w62iLPyUtc1XTvRvGhjuEVNBMDYciJgJzKNnM7
         l8NqMOj2iOpyNtlwwU+KtlgKt5josl62nOrds+9ty74zxz7qCTUfqmPWwWywhjftxYAx
         te5UHSExdWaD4YDZuerMZ1qNIW8kWFEghFCOibAkD5dw7C9hKqP9jtTrM4b3k0ILACjp
         HqGy+uw+TxfKjsQdXiXnCr7R3Hu73sCdC4NJhQwTJtuk14GbrR2fRxx3xUjsWXQHHBIh
         eLzA==
X-Forwarded-Encrypted: i=1; AFNElJ++4P/K8wxPF3FeI60Kmnw4wP/lrarOKrwqjp4XU0qSIC4V83zOF2kS22HfRc8aDFJUOBhAHtEOG1nlzg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwVHZXdg0EHnjkAeietUfCQMY+ZbJrEIGtuysRdSowHEDXEe3oA
	wKUcbwEv6y6sUf/P6iTvr7C8BlhPY7HNvzHsfGo1kleuGmKvU30jkSLZ3H5mN+btP3U=
X-Gm-Gg: Acq92OF+h/+8BsZW8s6WQ3B23u+Sy6EUzto/6Yw4VgP1fgWovhpCP+twbFwSuaPNdgw
	ZIYKQqLbsHhg+B22lwJYkIig1HSLjx+GimBvFFqdIPMQeBsHR+2nAcW6cGnpeOWpEYQETHvxagm
	9PO4Pvswg/PUl/RZRyhWc1Lu9dttMOgQf29fE7h8CDWh7PQHEtX1aZ1Ou3WTiGVjqR/MVG5t3/u
	bADtR/MEX585wkK4cyfwgqIBoZjtVRfcPoXfeKHcTgLON/d3hRaJOCM9G95Bd5by6KbhjVZg1Op
	WLtMzsxzfOHocS0a8ra+IiMVAN565tat04yt4HoMdwRBETU9SXyJS8vJB2FgSUN8nyFH/lhaWSj
	sJawuQ2fbhmd6SofCFU0b8KqQ07SUU7Mwp/E2uyQh7UhhFzZqOOBKiilYl9hLBVmBajw8hMYTWY
	rIzkoiGOo8rIUU
X-Received: by 2002:a17:902:da82:b0:2bd:2de3:5198 with SMTP id d9443c01a7336-2bd7e7fa235mr119231005ad.3.1779018414549;
        Sun, 17 May 2026 04:46:54 -0700 (PDT)
Received: from lgs.. ([118.193.39.24])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bd5cfe6492sm110180065ad.45.2026.05.17.04.46.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 May 2026 04:46:54 -0700 (PDT)
From: Guangshuo Li <lgs201920130244@gmail.com>
To: =?UTF-8?q?=C5=81ukasz=20Stelmach?= <l.stelmach@samsung.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Kamil Debski <k.debski@samsung.com>,
	Kyungmin Park <kyungmin.park@samsung.com>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Guangshuo Li <lgs201920130244@gmail.com>
Subject: [PATCH] media: s5p-g2d: avoid double free on video register failure
Date: Sun, 17 May 2026 19:46:42 +0800
Message-ID: <20260517114642.951949-1-lgs201920130244@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 9482F560CF6
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com];
	TAGGED_FROM(0.00)[bounces-61848-lists,linux-media=lfdr.de];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lgs201920130244@gmail.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[gmail.com:+];
	TAGGED_RCPT(0.00)[linux-media];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Action: no action

g2d_probe() allocates a video_device with video_device_alloc() and
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

  g2d_probe()
    -> rel_vdev
       -> video_device_release(vfd)

Use video_device_release_empty() while registering the device so that
registration failure paths do not free vfd through vdev->release().
g2d_probe() then releases vfd exactly once from rel_vdev. Restore
video_device_release() after successful registration so the registered
device keeps its normal lifetime handling.

This issue was found by a static analysis tool I am developing.

Fixes: 918847341af0 ("[media] v4l: add G2D driver for s5p device family")
Signed-off-by: Guangshuo Li <lgs201920130244@gmail.com>
---
 drivers/media/platform/samsung/s5p-g2d/g2d.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/media/platform/samsung/s5p-g2d/g2d.c b/drivers/media/platform/samsung/s5p-g2d/g2d.c
index a18b13db19d5..f38c28abd6d9 100644
--- a/drivers/media/platform/samsung/s5p-g2d/g2d.c
+++ b/drivers/media/platform/samsung/s5p-g2d/g2d.c
@@ -684,6 +684,7 @@ static int g2d_probe(struct platform_device *pdev)
 		goto unreg_v4l2_dev;
 	}
 	*vfd = g2d_videodev;
+	vfd->release = video_device_release_empty;
 	set_bit(V4L2_FL_QUIRK_INVERTED_CROP, &vfd->flags);
 	vfd->lock = &dev->mutex;
 	vfd->v4l2_dev = &dev->v4l2_dev;
@@ -711,6 +712,8 @@ static int g2d_probe(struct platform_device *pdev)
 		v4l2_err(&dev->v4l2_dev, "Failed to register video device\n");
 		goto free_m2m;
 	}
+
+	vfd->release = video_device_release;
 	video_set_drvdata(vfd, dev);
 	dev->vfd = vfd;
 	v4l2_info(&dev->v4l2_dev, "device registered as /dev/video%d\n",
-- 
2.43.0


