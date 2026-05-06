Return-Path: <linux-media+bounces-60591-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KDQzOUs4+2nUXwMAu9opvQ
	(envelope-from <linux-media+bounces-60591-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 06 May 2026 14:47:07 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DD2E4DA752
	for <lists+linux-media@lfdr.de>; Wed, 06 May 2026 14:47:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2D6C23050203
	for <lists+linux-media@lfdr.de>; Wed,  6 May 2026 12:41:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 159CE44D6AB;
	Wed,  6 May 2026 12:41:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Zeyiiv7N"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16E1544D024
	for <linux-media@vger.kernel.org>; Wed,  6 May 2026 12:41:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778071292; cv=none; b=aO5czWzo1g9x0sr3M5pC5ADdSDILoY6AcT05M/8a+cUBU3+qB3+oeFNkL1iPkDMSlxVpA03G//66TZqBKts8Fc8Ihvyrxp2JWKOb4NzU9WKhrizFxXN5yKYeLW+P0ubBdwNbP76h0NeqK6nWL4f4nZn7fxfvxnQTr6HUQeFLBvw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778071292; c=relaxed/simple;
	bh=OinERmBbACIBYleiV1Zs0L/VJbZMb7jzEBvebOjGfjs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=VoTIqJ1ZLB8d+hEc59QJnFf6h0Y8KpEXMdYKIikPW8s9kQKTSGDtXOeepzItmLo+KY1EVjOlRyWatWdXzBnLbD2ytmclbexrDJSQ0WqTFIJpS9FJO2ZpInaUg6RZJbBRvMPTVP5DuENoZ+VgKNcow6DKof4AuCQkVxnjy9efm58=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Zeyiiv7N; arc=none smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-835399c11e0so1672625b3a.0
        for <linux-media@vger.kernel.org>; Wed, 06 May 2026 05:41:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778071290; x=1778676090; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=0IlqU8VwEU2SI0FZdxgow47FUylG/UcOkwWktFbacV4=;
        b=Zeyiiv7NZKjdXGBQ/kCEqG66Qq9opnoRIOkkZWKS7tQXmZin7RSTUAfBIJqNleSZ9e
         nCuJf+R4600z5wn4L7b9u+4g2HptGg5rcnqA2yi3HibHcYJoirWcZRY7iQQ6JNdvVX6X
         IZyAt0zptWJSJ656G3c4aXNXo/PxxR70rMjrWmiWZn97kX4oKpavVVuTKAujmf2+vqA0
         OwvPKpkOf7gCXHbFdd3UIB6cDvPvEXwpEw/75QVVi7CXMiMPtXU+YYM8uzM5+KQp7ydv
         Vf8ShErn0r1etUhKKvIMVYBqMJx2EdXD1vKRJew05GDjiB6DVrhLNI8RQTuQ9ukUg8SM
         MRNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778071290; x=1778676090;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0IlqU8VwEU2SI0FZdxgow47FUylG/UcOkwWktFbacV4=;
        b=fIkDYL+CltizPzKr65lZoiiZW9LrJqHdrccgBE9knX1g/moqayaoFjvKKUjNVA9J8T
         h10hKwBfqCIAtxQAHvYtJiKFeS5iMI9VqpP5Z5eRWBnRcmiS/1/izg5ctdchwXLEnQV9
         vDnTMXRLkLoHctzMBqd32OaXWK+t3uYT6v70URcthoYXwBNui+Dr4xs6w4Heja2UoCmY
         ky/UQGV8ZJQG/1+CsZWn2rKvC6wa2nwwtS8vHyrHT+cwlJtTggkFRUeP+8tB+5lVqQE2
         sp4v7Jt9DQ3Q4OEzCRdMF3yo5TJqAQ2MgvCAp88ZUUELC3weajKOfcflwkBH6ENhoDD2
         5ndg==
X-Forwarded-Encrypted: i=1; AFNElJ/axzPodtlrWFmMS+G4TfmT2vCzrqnUlIh/fKyxRvyIz7tVElgtxlag6t+T3REWALhHUmfVf68tyC4mUA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzE0H4kzBDYPfAqWXhSifYni9L+RTTSfW3uExDW6OclMoLgVJkm
	x8kpvrZgvApoqXEmpV0yp5RyiDYcWZuKJC6h2pkZjn3+OwFgS237gWQ=
X-Gm-Gg: AeBDieuVHSAEKc2Nk38tUgP3M453IyvKIo/N6Ekbl/HxDUtXlHU6Cq8bNCttdM8TnZM
	0N+CH73IjB9MsMbm10itvVitblBRVskLmPBZxfgOGDAK5Th36ldWO5/URzQernkGaUar7cpuxq8
	DiKYU6Ycpf5gp5DPEM3hHOSIvmwNo6HnH/LicTy+zAu5yBnFqVBLSTSDfh1rEBi03/nybADsarK
	j8N9l72cB9pWrORRM8fXw6GIkqK8d0K2jb6SiZU6fGU8JCgvrSw1puAFxQQdVgz/D321VYB1Q0f
	Zei1XnBq7NkKhOdZaWWAylEvjRy28OGJwTvDsanDY53E/YFLtG5KqOu+Vw91a+8fcZQC98yQ3ci
	XmUEtdwXTD70/fG4tzHj6Su7vw362RxLlmzInG1k4Sd22kLBel57qLrXu54ve7GY2/nCTPW9GeT
	89o5GTRkMQVPGNxREJvRb0N9VGfJ/tfvk2VnvRmIvmmFk3Ec0+JAfduETYwDs2PPbCWdNQU9q1M
	RNjjM37cA==
X-Received: by 2002:a05:6a00:4193:b0:781:2291:1045 with SMTP id d2e1a72fcca58-83a5b2d34damr3232862b3a.8.1778071290350;
        Wed, 06 May 2026 05:41:30 -0700 (PDT)
Received: from localhost.localdomain ([1.226.165.54])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-839679c7ba9sm5494056b3a.35.2026.05.06.05.41.27
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 06 May 2026 05:41:29 -0700 (PDT)
From: Myeonghun Pak <mhun512@gmail.com>
To: Maxime Ripard <mripard@kernel.org>,
	Paul Kocialkowski <paulk@sys-base.io>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>
Cc: Myeonghun Pak <mhun512@gmail.com>,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Ijae Kim <ae878000@gmail.com>
Subject: [PATCH v3] media: cedrus: clean up media device on probe failure
Date: Wed,  6 May 2026 21:41:16 +0900
Message-ID: <20260506124124.27802-1-mhun512@gmail.com>
X-Mailer: git-send-email 2.47.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 7DD2E4DA752
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[gmail.com,vger.kernel.org,lists.linux.dev,lists.infradead.org];
	FREEMAIL_FROM(0.00)[gmail.com];
	TAGGED_FROM(0.00)[bounces-60591-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[kernel.org,sys-base.io,linuxfoundation.org,gmail.com,sholland.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mhun512@gmail.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-media];
	NEURAL_HAM(-0.00)[-0.998];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,sys-base.io:email]

cedrus_probe() initializes the media device before registering the video
device, the media controller, and the media device. If any of those later
steps fails, probe returns without calling media_device_cleanup(), so the
media device internals initialized by media_device_init() are left behind.

Add a media-device cleanup label to the probe unwind path and route video
registration failures through it as well.

Fixes: 50e761516f2b8c ("media: platform: Add Cedrus VPU decoder driver")
Cc: stable@vger.kernel.org
Reviewed-by: Paul Kocialkowski <paulk@sys-base.io>
Co-developed-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Myeonghun Pak <mhun512@gmail.com>
---
Changes in v3:
- Rename the media cleanup label to err_media.
- Add Paul's Reviewed-by tag.

Changes in v2:
- Drop the now-unused err_m2m label.

 drivers/staging/media/sunxi/cedrus/cedrus.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/media/sunxi/cedrus/cedrus.c b/drivers/staging/media/sunxi/cedrus/cedrus.c
index 6600245dff..7cb1f110d6 100644
--- a/drivers/staging/media/sunxi/cedrus/cedrus.c
+++ b/drivers/staging/media/sunxi/cedrus/cedrus.c
@@ -507,7 +507,7 @@ static int cedrus_probe(struct platform_device *pdev)
 	ret = video_register_device(vfd, VFL_TYPE_VIDEO, 0);
 	if (ret) {
 		v4l2_err(&dev->v4l2_dev, "Failed to register video device\n");
-		goto err_m2m;
+		goto err_media;
 	}
 
 	v4l2_info(&dev->v4l2_dev,
@@ -533,7 +533,8 @@ static int cedrus_probe(struct platform_device *pdev)
 	v4l2_m2m_unregister_media_controller(dev->m2m_dev);
 err_video:
 	video_unregister_device(&dev->vfd);
-err_m2m:
+err_media:
+	media_device_cleanup(&dev->mdev);
 	v4l2_m2m_release(dev->m2m_dev);
 err_v4l2:
 	v4l2_device_unregister(&dev->v4l2_dev);
-- 
2.47.1

