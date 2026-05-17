Return-Path: <linux-media+bounces-61850-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oITLD2asCWookgQAu9opvQ
	(envelope-from <linux-media+bounces-61850-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sun, 17 May 2026 13:54:14 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id C70D8560DB0
	for <lists+linux-media@lfdr.de>; Sun, 17 May 2026 13:54:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 96BDE30142AE
	for <lists+linux-media@lfdr.de>; Sun, 17 May 2026 11:54:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 83A05363C61;
	Sun, 17 May 2026 11:54:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MKxLECEO"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1E3F3603DF
	for <linux-media@vger.kernel.org>; Sun, 17 May 2026 11:53:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779018840; cv=none; b=HbD2cwSYDAWDMo0Ry0x5G0HVE0Vbv3bpiC4sUpqvWJO7nND9PJuaPCrLtEWFBZSlKOBJFfSX+qQexo1B3Jb7HMg9iCIxPSanZQCoPNIUond+DhndV6QlVe0adON5cpnmalzWpt9vMwsdN1I6vy+Oh/fwPt/m3KJwpjLbtX9laKA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779018840; c=relaxed/simple;
	bh=ncZtNx1Y7OuHHYSK44RquXi/bDCszx2wvAKmVP+oFhE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=jSGEVeAcDYesIO5Yga6oDcPIchmcXN2QUmDVW9UGBPaaOTHu3pN4bA2eo6wezqdpa/uZQocTJDhtAQQ3oZeSncS6y8tOhHl4/0om4NozGJMSlZINzGc/dSfve8viMWyF8tJwdufIu4ZUE7y9V9irRUsLZPLbu0XodMTGKKFg+qw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MKxLECEO; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2ba6485d219so8715195ad.3
        for <linux-media@vger.kernel.org>; Sun, 17 May 2026 04:53:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779018838; x=1779623638; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=eVgsGf4Z/8axsFXoaM/enuI2zsZhhgsgIIwSowsD/SY=;
        b=MKxLECEOt7do0myVK2DDnIZk6b6ktK64x+EU5pEphKYC36vpKdlH0FczD2E1L0460c
         Y6/6FxyjLNNBWVafk/CGPcU/LmLjNIyG3eVqh1maW1p8HgHS2wEfEOWxIUva96Za+Fsy
         y6hqu7tabtEJu+2z+KPJimxFQu46WfyvCICAWCeTQJQ85sHKmdlcv5uIQIfij93haZAE
         8aUTe4jG7ZWLX/xLHp95TUZrMbHmyog/htIe308ASmBzRqSlZGzWVdcfoSduhybnbi3H
         62+UwPNWTJxhCEKtNsIjJEqfX933B/7pOup/SfNjSOE2g8s3MF3B8RfUvibD2xk3jApw
         NvoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779018838; x=1779623638;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eVgsGf4Z/8axsFXoaM/enuI2zsZhhgsgIIwSowsD/SY=;
        b=jggOsGZRlGs4qXiWfT9V/MjFBf2U2bX+gdmdLt/tcv7amsLp/gqsbPEZZi4jycAOzo
         zht15hFkHXQ0lVIcwQZymzgVsc+NWj9iw6dGoZXStEY+anCHVyhC4cgU2EXKRxoitxYe
         mtaxmLyHeTcxQHEUMATKQ37QcDU4FjV/ghe2yDSYlUIqWYVDI9NhQzM1V2htfIRsydEy
         c/vs1qdbU/G92iGt+Eorh94H77LGBtcApTA7QvBAO4GJLolr3tS+G8ndusm6SBbEF/ng
         dwaYxM57Vjxvvizi/rospI3+uWInQH1Db69JXzoBPWe2ycNhs50cmDAK6Nbw0bb6deS6
         S0SQ==
X-Forwarded-Encrypted: i=1; AFNElJ/ZG6zMVTMbmZpskOg/Y9bQY5shBgAHopfnu1nw69Uaw7AolCg0BJoUP86mMNmOSAhSFv4w+swVczgFCA==@vger.kernel.org
X-Gm-Message-State: AOJu0YybFHS+3ZBu1fAg2J4Rw5mgTuxylbAvQChwF6ofBYcMViH7jDbH
	B0Ldi1AjUcDhile+RoG0gNHU1Ni74Nj8oyEExEt1eB2OqO8Zc2YmOdnF
X-Gm-Gg: Acq92OE8E7PsSLbBHVVqFvVWgMN16ddsXW3OCGOR5F66I8ozdD5wfmqJSTCBvvF6hX9
	lYUsQBctZuHlJq4KH8XJcZukGcWvaq04pqdRwlfTMHzYm4BDKpohfV5EO2XwWK1ntmd/iL1ukti
	fHuOO8OPCuAjNliL/CBmp/uiDdGQEUkgRhVmJyNl9y2dlCUgHGSIXkl2T88rEj1NZ7Sqkv9zJas
	wacRyDw3pomYL4ZqgY8zsBHy66hxZpD/9zbqCIyXAMsqWAwBAZ963oKKKfhFcioEM7AqOdC1fBJ
	P8E55uohdGqL1//OGac6o969PPS7ajeAELbzHXhpF7xbxWb9rAODjYZJjDvE11u5crQAzit/bVy
	IrLisN2i9xx4u4IZWksHqB9aOfpQ/urghXH7i666hPBTqHmpXfWuDiGl+O9vpLV8SSYXy3uTRER
	e09KN/VE6AHUx87OJPNZGP
X-Received: by 2002:a17:902:ebc3:b0:2b0:6e6a:8504 with SMTP id d9443c01a7336-2bd7e973c40mr125388885ad.27.1779018838177;
        Sun, 17 May 2026 04:53:58 -0700 (PDT)
Received: from lgs.. ([101.76.249.46])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bd5d0fd856sm118282215ad.66.2026.05.17.04.53.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 May 2026 04:53:57 -0700 (PDT)
From: Guangshuo Li <lgs201920130244@gmail.com>
To: Neil Armstrong <neil.armstrong@linaro.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Hans Verkuil <hverkuil@kernel.org>,
	linux-media@vger.kernel.org,
	linux-amlogic@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Guangshuo Li <lgs201920130244@gmail.com>
Subject: [PATCH] media: meson: ge2d: avoid double free on video register failure
Date: Sun, 17 May 2026 19:53:43 +0800
Message-ID: <20260517115343.955015-1-lgs201920130244@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: C70D8560DB0
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[gmail.com];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-61850-lists,linux-media=lfdr.de];
	FREEMAIL_TO(0.00)[linaro.org,kernel.org,baylibre.com,googlemail.com,vger.kernel.org,lists.infradead.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FREEMAIL_FROM(0.00)[gmail.com];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lgs201920130244@gmail.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	RCPT_COUNT_SEVEN(0.00)[11];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Action: no action

ge2d_probe() allocates a video_device with video_device_alloc() and
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

  ge2d_probe()
    -> rel_vdev
       -> video_device_release(ge2d->vfd)

Use video_device_release_empty() while registering the device so that
registration failure paths do not free ge2d->vfd through vdev->release().
ge2d_probe() then releases ge2d->vfd exactly once from rel_vdev. Restore
video_device_release() after successful registration so the registered
device keeps its normal lifetime handling.

This issue was found by a static analysis tool I am developing.

Fixes: 59a635327ca7 ("media: meson: Add M2M driver for the Amlogic GE2D Accelerator Unit")
Signed-off-by: Guangshuo Li <lgs201920130244@gmail.com>
---
 drivers/media/platform/amlogic/meson-ge2d/ge2d.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/media/platform/amlogic/meson-ge2d/ge2d.c b/drivers/media/platform/amlogic/meson-ge2d/ge2d.c
index c5dc03905ce0..b367169e6ad8 100644
--- a/drivers/media/platform/amlogic/meson-ge2d/ge2d.c
+++ b/drivers/media/platform/amlogic/meson-ge2d/ge2d.c
@@ -983,6 +983,7 @@ static int ge2d_probe(struct platform_device *pdev)
 	}
 
 	*vfd = ge2d_videodev;
+	vfd->release = video_device_release_empty;
 	vfd->lock = &ge2d->mutex;
 	vfd->v4l2_dev = &ge2d->v4l2_dev;
 
@@ -1005,6 +1006,7 @@ static int ge2d_probe(struct platform_device *pdev)
 
 	v4l2_info(&ge2d->v4l2_dev, "Registered %s as /dev/%s\n",
 		  vfd->name, video_device_node_name(vfd));
+	vfd->release = video_device_release;
 
 	return 0;
 
-- 
2.43.0


