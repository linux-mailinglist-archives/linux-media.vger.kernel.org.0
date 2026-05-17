Return-Path: <linux-media+bounces-61846-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ODV1NomoCWrdjgQAu9opvQ
	(envelope-from <linux-media+bounces-61846-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sun, 17 May 2026 13:37:45 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 42D14560C33
	for <lists+linux-media@lfdr.de>; Sun, 17 May 2026 13:37:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id DFB6630177B3
	for <lists+linux-media@lfdr.de>; Sun, 17 May 2026 11:37:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0C64B3603DF;
	Sun, 17 May 2026 11:37:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YH/p/0T1"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5937D29D264
	for <linux-media@vger.kernel.org>; Sun, 17 May 2026 11:37:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779017840; cv=none; b=sYw+eQMnaS/nsfD68TYLKP5rreOH4zeggYtkmO6Pz1OQcdDcyZud7A75LjJB6IGfQjTyL5y32XTXwF8exc7rACh3hDY+Ss4kC2KQAMRMfA1fsLy1cudD5D8T+u6I8Ikg6wPvovAfRoCfIphgCx5X69v75n4fNwm05GJzxfp/RYA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779017840; c=relaxed/simple;
	bh=GYeLmyLcYBRO2WMlE11F/2pqaJGP/wShi264pbJUNjM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=tXC/jY/RpbHiHd62Qr2rwIOSiOOASQH1rf16mXdmVEBP76sezN2V91FXeUhIilXUEOLbpfH2nfyrlzOUo2Dty0mMGZvP63Yss3ANVdt3JfK1ozNwwXkXtzJ7rQKQ68e9wjZUcnxbFtuNevB5n7L7NQ0S9TEDurkPHnz/SKcTL8Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YH/p/0T1; arc=none smtp.client-ip=209.85.216.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-3699cdeec05so209596a91.3
        for <linux-media@vger.kernel.org>; Sun, 17 May 2026 04:37:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779017839; x=1779622639; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=YwCtNa2bNCMGQ/e87qwfib5kmy7GWvXNJtX206pcf+A=;
        b=YH/p/0T1E7a30xYGmGmvsUHleZy4LEz4RLQKCigKGznjoEw/oH9wdRS3tMS749ex4P
         4xcTd041dzuhS4y+RiWoLV5dtM+PFkSvkaioRrJS5u721LbseZRMnX0pnbQVR+KHcq/V
         TsRsvHRF9YxWUgLh8N/lbejse77Elon4v7cfDoOdLU8sJtWkXvEPnTVsRGbOXPZwnQeI
         GEJalh5k8lsNRrgd9VQTcA5Ss6xQimKVtg1lNVoC7fv/qfqvGUQ4TtrcMnlAJcRV2AHu
         ov6uum/QyXuUdvzJUlXAwQQ79ioKfrPvgL6feKhlvuAcyGRqyxuNp2NSm/XAzWmkKWaK
         /4iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779017839; x=1779622639;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YwCtNa2bNCMGQ/e87qwfib5kmy7GWvXNJtX206pcf+A=;
        b=iyR2isjQ7igBTUtzhDCePTBSvVJU+OtM0ySzAs7Dzv+ztxVxBR5ffXoE3BrthO4dO8
         rLhOWMVCQokqFnjRupCS2y99eq67jwDPSyuGNTkHtBp0KyJ310JZZ8qv8OnKpXmQijSM
         Y2+/hQYUWyk4V46Tee8l/rnwsbTfsRFTAbd+ygKkm2XXz5Dfce3bigIGXMqFzAKDOcz5
         pBp04/kjU2YMVeXG9aZHimmC+U4L4TvWC/3M7OU0VbG5hn63rBPeCqy+JbN8l/eb9hzK
         un82OmzZ+EeRs1BvOBjq7eYthLIv3ZnIEuG7VJ+l91QM9D5PQvPBFnO/G2HeWjbjpLY6
         9Eow==
X-Forwarded-Encrypted: i=1; AFNElJ9l9t6iDDl5Y8f3Vun9KMYdaBsu4CzmKvz4xuZmUS9tftZbjGQ0RYhYu5ENV/QqXbWqkK444eadMqoaKw==@vger.kernel.org
X-Gm-Message-State: AOJu0YywM7h9voMBdc6Fx5AFMMx95pboSJ2+epgYmXqESSAwarNSXEhF
	RWPRcZtgtneaHbwKY2s4vgiX+FKHQPXIgWcLJ6vKZl3gduO25Nopk1u6
X-Gm-Gg: Acq92OEoZjk6aY8eT58mtAxb6yZI4wuRxJla7x6gAtELCQc6R3j25RcP5b8EdU/nPG9
	jqT06XTME59F27m1DcMcHn++dIk4Vz5udNcCCgag+5xz0yd499kJ05SiEWdpcwfNk5cs/uNhEO2
	a2HP+/oDUVGJHix0Fvaf3lmaTm3fIyNM99Y6KMPkqe+tEjg5jtViySFx7KHxoAE1Qt2DNhTQOWi
	+Al8A+Pno99b89Zgywx4ZvEkvWQMhYO4qEvdeDuUneFJdOm9DuuAkAJf9YphxeNvAWHQMVO5BYQ
	M5h5YheQukZWKyL5XiaT71WI8tzAAEY+Cu+jYUpTgNoX0ovJVB84LvgCDwDH0QQj8vvrlWl0vJO
	MdKhuHXbvcYzTzyNlrpcscNN0LfHUW4712CH/Tfwj/Bnk1MdQjQ3YjuNg2/yLeBx/cPKcqGlq4q
	mZEV0cwg==
X-Received: by 2002:a17:90a:d648:b0:368:95e1:8d45 with SMTP id 98e67ed59e1d1-36951cb7706mr10428613a91.26.1779017838713;
        Sun, 17 May 2026 04:37:18 -0700 (PDT)
Received: from lgs.. ([2001:250:5800:1000::f280])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36957261d59sm3162871a91.4.2026.05.17.04.37.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 May 2026 04:37:18 -0700 (PDT)
From: Guangshuo Li <lgs201920130244@gmail.com>
To: Jacob Chen <jacob-chen@iotwrt.com>,
	Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Hans Verkuil <hverkuil@kernel.org>,
	linux-media@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Guangshuo Li <lgs201920130244@gmail.com>
Subject: [PATCH] media: rockchip: rga: avoid double free on video register failure
Date: Sun, 17 May 2026 19:34:49 +0800
Message-ID: <20260517113449.949222-1-lgs201920130244@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 42D14560C33
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
	TAGGED_FROM(0.00)[bounces-61846-lists,linux-media=lfdr.de];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lgs201920130244@gmail.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[gmail.com:+];
	TAGGED_RCPT(0.00)[linux-media];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Action: no action

rga_probe() allocates a video_device with video_device_alloc() and
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

  rga_probe()
    -> rel_vdev
       -> video_device_release(vfd)

Use video_device_release_empty() while registering the device so that
registration failure paths do not free vfd through vdev->release().
rga_probe() then releases vfd exactly once from rel_vdev. Restore
video_device_release() after successful registration so the registered
device keeps its normal lifetime handling.

This issue was found by a static analysis tool I am developing.

Fixes: f7e7b48e6d79 ("[media] rockchip/rga: v4l2 m2m support")
Signed-off-by: Guangshuo Li <lgs201920130244@gmail.com>
---
 drivers/media/platform/rockchip/rga/rga.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/media/platform/rockchip/rga/rga.c b/drivers/media/platform/rockchip/rga/rga.c
index fea63b94c5f3..90ae01de3216 100644
--- a/drivers/media/platform/rockchip/rga/rga.c
+++ b/drivers/media/platform/rockchip/rga/rga.c
@@ -851,6 +851,7 @@ static int rga_probe(struct platform_device *pdev)
 		goto unreg_v4l2_dev;
 	}
 	*vfd = rga_videodev;
+	vfd->release = video_device_release_empty;
 	vfd->lock = &rga->mutex;
 	vfd->v4l2_dev = &rga->v4l2_dev;
 
@@ -895,6 +896,8 @@ static int rga_probe(struct platform_device *pdev)
 		goto free_dma;
 	}
 
+	vfd->release = video_device_release;
+
 	v4l2_info(&rga->v4l2_dev, "Registered %s as /dev/%s\n",
 		  vfd->name, video_device_node_name(vfd));
 
-- 
2.43.0


