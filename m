Return-Path: <linux-media+bounces-64813-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id mmFQG3LdLmrt5AQAu9opvQ
	(envelope-from <linux-media+bounces-64813-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sun, 14 Jun 2026 18:57:22 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D51BE6819A2
	for <lists+linux-media@lfdr.de>; Sun, 14 Jun 2026 18:57:21 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=mk+I8DM6;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-64813-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-64813-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 2CECB300B57B
	for <lists+linux-media@lfdr.de>; Sun, 14 Jun 2026 16:57:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 410B939A045;
	Sun, 14 Jun 2026 16:57:13 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4FCD32F748
	for <linux-media@vger.kernel.org>; Sun, 14 Jun 2026 16:57:11 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781456232; cv=none; b=nkqHNXYbdVzHEnW6yBKFgNWZ4YY60dd38g2yleHmSAzx4bDr/OakCp31xkBl1PBPObglL//e9cV3bIgESDNZPsnaf0cRM9rWG/RaoPoXNctgBzYeWpmpxKBeQf8MYkCeS2e8rGIjrPdxJ6B/JWMeWWxX4MskjKl+74U+0xYjx/E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781456232; c=relaxed/simple;
	bh=7Zhy1mQVW1t/ztSSKPcZqS28xrO83pxbCfwKTPiB0+Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=h/4O8HTa5NNpEMZbNgHH05FsSjKg9QUx67KTZsY4VDp4LSQESLG0LZhLPpbZXr441zr1ELjJzrrW//OzXFR+jgMl7kSr3Z+cuaMj+UFaoFTUmpNThlrLUUNt9lqD+1s2voUNZuOfBbASqzzRdx/NdqGaE5YwLMZnybi47JWkxvg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mk+I8DM6; arc=none smtp.client-ip=209.85.214.171
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2c0c20f0c0aso17274125ad.0
        for <linux-media@vger.kernel.org>; Sun, 14 Jun 2026 09:57:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781456231; x=1782061031; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QY5Ip+P8KRx1IM1Wpd7OwQvhD0XfR0winv2zlXLefIQ=;
        b=mk+I8DM6N2IKFe4xk65j87NGJ0QYZWbuXvR7BuxsFG+ZSmpm7Dy59JeecLyRn7PQu4
         LKzIi3LFNnUHNrmtiJY28PB1fdd77n54GGkhr/geu9Y0/6hvJi036PkatP+mKy+rI9o1
         1m44ml0p0UR3PTSp2bLwasworeuauvMJoxGNK9Oi+tRh2rWspg3oN1+vcqdvp3X/UZA8
         wO1c0Sh43djia9e6c5IbjYFVYBP3vUX9XRbiogsKzTYYm6z9MEXIEZKYcap5otQHs9y0
         1BFqaesx/fey6LQo5vTFGA4ZzRBDq3kmIGQfIwfrP1nt9mpvnydQZXRY7HpH5H1H0ufG
         nkGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781456231; x=1782061031;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=QY5Ip+P8KRx1IM1Wpd7OwQvhD0XfR0winv2zlXLefIQ=;
        b=iyRLE8EFleZ98CEhWZ3qLWgmh96JH17dpd7JDoiI1cMDgR25jlIMHES/fu5ZnlgehG
         5a/6cxGpgD8ocWLm1vUaYBw3jcwyF7owek5W1KegH7KoQa55yDWWZfex6Rn0R4OedAkN
         12JNYgkARhD0vlgFColOCdkpDiar/gvWSouXwI6BAgRF/ZTBKA4ppv6o5EfxiLB6xCt2
         oHCQNf+UeufTwjQadGkID1mH1Gp+IcuY/C93JiMt3/BwmfXArNuE9mCbyDK/IdouLSBU
         G2StDZpPgisYt9u5gh7jUabbhraqGP7sOyJ+Rdt8im7XahqHbgtJYR2L9VaBLlDpAT22
         p24A==
X-Gm-Message-State: AOJu0YwvaD0mUUi4Dtesd/hEtD8vHiQgmfrcf5CrrU8ZlFJV9WBBUf1q
	sXipE2LzlDeJ2pwNF4tb1E2RZxLiW3YP/YuPB+4E493XeqRrc0omNbr/C8r1A5wJ
X-Gm-Gg: Acq92OGIcyDn74v1oJ4lrhkKte57EtpJvoKI289RQ9puRFw3O9tnwNdZo+0MTwhbtWc
	akOAzjeo52GJsFHtn3zVerck+RLLH/fm2vwLNWuqy5fpbl0HNV7S89b1k1Q2mI859Ig/8+feT2e
	lDE8Uk27jKKhBK2BQTIJJr41c77DijVcu7/G7Y9M0jlh1EbG6RNt2XDQh+6IU3UxfEn3RX5WYMZ
	bgOHJKwTRXfkJNhpP1VrrDHiM1kJkkKkCYxR7LETfKWBNKnXjbM6Wk/S4aSxjES1gkvUQLgveu2
	6HGPvV2B1yCkKOp/EoyKjRhj+q6Yrgi5sAP1uYxqU5Mnz1tQJAAFzXcnMyX5lNtyH+WKbw0o/AC
	BsLVU6QUCi5FSUynXo8dy6tZfE+ZW+AvoSM5PTsgIckR7ndM2/4BLfv74ejHGO4poagAXIZ3N2X
	6E4uHdmJpM8jvk3mlr37x7Ct1yhfsxov0z5WtV5aoDPnM7KasnSduqMKs+oKYZlGs=
X-Received: by 2002:a17:902:d48f:b0:2c2:1982:5270 with SMTP id d9443c01a7336-2c6641e28f9mr86805045ad.21.1781456231128;
        Sun, 14 Jun 2026 09:57:11 -0700 (PDT)
Received: from localhost.localdomain ([49.207.217.37])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c42f2e5590sm85284025ad.14.2026.06.14.09.57.06
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 14 Jun 2026 09:57:10 -0700 (PDT)
From: Biren Pandya <birenpandya@gmail.com>
To: linux-media@vger.kernel.org,
	mchehab@kernel.org
Cc: Biren Pandya <birenpandya@gmail.com>,
	Maxime Ripard <mripard@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 07/22] media: platform: sun4i_csi: Add missing media_entity_cleanup()
Date: Sun, 14 Jun 2026 22:25:44 +0530
Message-ID: <20260614165630.3896-8-birenpandya@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260614165630.3896-1-birenpandya@gmail.com>
References: <20260614165630.3896-1-birenpandya@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,sholland.org,linux.intel.com,lists.infradead.org,lists.linux.dev,vger.kernel.org];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-64813-lists,linux-media=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:linux-media@vger.kernel.org,m:mchehab@kernel.org,m:birenpandya@gmail.com,m:mripard@kernel.org,m:wens@kernel.org,m:jernej.skrabec@gmail.com,m:samuel@sholland.org,m:sakari.ailus@linux.intel.com,m:linux-arm-kernel@lists.infradead.org,m:linux-sunxi@lists.linux.dev,m:linux-kernel@vger.kernel.org,m:jernejskrabec@gmail.com,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[birenpandya@gmail.com,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[birenpandya@gmail.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: D51BE6819A2

Fixes: 577bbf23b758 ("media: sunxi: Add A10 CSI driver")
Signed-off-by: Biren Pandya <birenpandya@gmail.com>
---
 drivers/media/platform/sunxi/sun4i-csi/sun4i_csi.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/sunxi/sun4i-csi/sun4i_csi.c b/drivers/media/platform/sunxi/sun4i-csi/sun4i_csi.c
index e53a07b770b7..f50d97ca795f 100644
--- a/drivers/media/platform/sunxi/sun4i-csi/sun4i_csi.c
+++ b/drivers/media/platform/sunxi/sun4i-csi/sun4i_csi.c
@@ -242,11 +242,11 @@ static int sun4i_csi_probe(struct platform_device *pdev)
 	vdev->entity.ops = &sun4i_csi_video_entity_ops;
 	ret = media_entity_pads_init(&vdev->entity, 1, &csi->vdev_pad);
 	if (ret < 0)
-		return ret;
+		goto err_clean_subdev_entity;
 
 	ret = sun4i_csi_dma_register(csi, irq);
 	if (ret)
-		goto err_clean_pad;
+		goto err_clean_vdev_entity;
 
 	ret = sun4i_csi_notifier_init(csi);
 	if (ret)
@@ -266,6 +266,10 @@ static int sun4i_csi_probe(struct platform_device *pdev)
 	media_device_unregister(&csi->mdev);
 	sun4i_csi_dma_unregister(csi);
 
+err_clean_vdev_entity:
+	media_entity_cleanup(&vdev->entity);
+err_clean_subdev_entity:
+	media_entity_cleanup(&subdev->entity);
 err_clean_pad:
 	media_device_cleanup(&csi->mdev);
 
@@ -282,6 +286,8 @@ static void sun4i_csi_remove(struct platform_device *pdev)
 	vb2_video_unregister_device(&csi->vdev);
 	media_device_unregister(&csi->mdev);
 	sun4i_csi_dma_unregister(csi);
+	media_entity_cleanup(&csi->subdev.entity);
+	media_entity_cleanup(&csi->vdev.entity);
 	media_device_cleanup(&csi->mdev);
 }
 
-- 
2.50.1 (Apple Git-155)


