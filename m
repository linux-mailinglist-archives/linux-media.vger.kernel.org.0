Return-Path: <linux-media+bounces-58604-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SLesErFc22mWAwkAu9opvQ
	(envelope-from <linux-media+bounces-58604-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sun, 12 Apr 2026 10:49:53 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id DCF423E3200
	for <lists+linux-media@lfdr.de>; Sun, 12 Apr 2026 10:49:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 313B1301CCE9
	for <lists+linux-media@lfdr.de>; Sun, 12 Apr 2026 08:49:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 01C703101A2;
	Sun, 12 Apr 2026 08:49:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iBxb5y51"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 254EF2C0296
	for <linux-media@vger.kernel.org>; Sun, 12 Apr 2026 08:49:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775983778; cv=none; b=fBWBYVu7wPL5UZtSbT0nE6XuB+5F0RPRnPL2cHueVG5kwb2nQiWjpwV0PZd+yi8YSZ14V3a3GwOgIMXwJA8PUvtHl3WyNkYa6aO+dBzLI5mpG1wHzjYDzGqrRXmJTBxO4v2MKnsN+D8GR4wcLVcDWgMV6LMI7MWn5PfCmoT5dZk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775983778; c=relaxed/simple;
	bh=Zh1gMWcDLON+NjfzXUS2eYcY2NU/RrfJ8BIhx6gE90w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Tn1PMvNj1jCp6dsYnW4UFVQqOFbiV62VSFSj/aHOS2NZ2WijmbHm+FjFpiIoqpElNfhaMussQ+Gngdt61jyLQC0YxsCjlJJAqZNg3jRezfedd0QpI8UZRUwMR5ZvWrmyd9+94a0qq8ZbLqvAoSMY7P00si+Zflhirs0v0WLQO0Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iBxb5y51; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-b9c01854477so557419766b.0
        for <linux-media@vger.kernel.org>; Sun, 12 Apr 2026 01:49:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775983775; x=1776588575; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=U+KERGfJ0lgKno7VzsagW4vKndlmZyVJae2CPohMXXU=;
        b=iBxb5y51wrQK1NV3WgNsk50NxLIsFxZuC9xecAUt6PmH6MHEfTRDIUdfmo8P2zTo9k
         1taWXM19afs8cuyi9nmsObviYpMz0mG1uiqaSdKVLa6SDB31R8nOr427MhPRR8yDgOik
         TyLI56tJLGBmcDR+NMwLOaEKTmVk7B2zhSKs2uFB8clO6ub49OCNsqIQGvjnU73W/jq6
         OZRhhgskzq/e1DbglsVby+/k+m522EyOXtuJgej0fQshxxdQqVAm7d4CAFCWCc0RZ51U
         2RXT0a1Lopwl4ohyZH6lQP6t0PfnLV0N6aE/HEmPlbJ/nW07YJAEPfJMnDg89qir6WAU
         5W2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775983775; x=1776588575;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=U+KERGfJ0lgKno7VzsagW4vKndlmZyVJae2CPohMXXU=;
        b=ca/doF3FX0WJIwxTc98Po44qD/N2ZegdgpXadPR+Xeoqaqfof6oJYH+MIWpThjEvq2
         DAuV5aWwU5bWRn4EjRK2VWELCn4CNK/PrpZsFmXpOBFO17BNt9eJw/tDRGRHPY32z1Vc
         OOlnsAKPI/KHVQS8xBpQdw50WdpEbTIafgK3eTiuiu4+jgZw5kHB5ANs+wtKKulpVc7q
         EvvY7rQv72FufOT8lqW4J7TpwzDU4lQy5aWBgYgfMQpeeEUrILDwMa9fwkLpgiP8MLxh
         klNbmh89CdN1FDtotU5Qc82s9C7OMCa18yEnbo/RQPaewZ1sKemJqIdLOiI49t7qvPXi
         1Izg==
X-Forwarded-Encrypted: i=1; AJvYcCXWuP/AIDn1ZaFHDJGqykbtUG5tx26anBpOJERrjtdFA4qCZOwuCXe8f2hNaK/g0/KqGhHs7plcQqxIMg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx3HlyJbpu0fZqWprVl2pQuoM6yXrCbb9+kePL3AI9B4kcMB1Nu
	9jL3/AFDxODbTKX3dCxMwVPnNIPHeaTibTLj9fD6Ctc1CE5EYGKs0j//
X-Gm-Gg: AeBDiet1Pt9H5aNJgVFIXVQ3jOehlNSYGfBScrpSuDmfePmg5Qjr6qhFYKGgI9ZAWBW
	cIrZWeEbBDgbJFZ3H+v7r0yd9P8cFtTliSANSGXN8vfDedjsqoE3+TcGJIbQCxPrqcLxwSDBpxY
	y4+U/Vp7A5ps4HYnttHkaVqJ9A1lZmjjzWQXLEczEyQsmS7J2j5cZtNoLkguze8zz8iTPCpURmx
	R8m95pKPdcPelgQIMPaPPHSqmXg7GoOiCFLYIPWqGff4LzF6kFbC+V/j6CERIfon3q/DYDM6IoM
	wPHbTmLsELDlpXsn4FqvAWjlNfGhPyuQtEKKA98wlJxjBZupyyllJj2BYcm0yPUQPaNo8HpL6Sz
	4F6SFHkG1P3iGrx4WlhXDzoPjfXeelWo5FpIh8JYXfaIEJpvESlckVnpiPsv8xYb6fjDKNMWNEM
	xMPxFwlJxAO7XC9ZHYfPLsOjGSBlRsm27vjIbMcGHSTD6KbrL/ccACz9lfTGU+lehHkBcfQnh6h
	RcbcONKabz4vx7uBsx3QbzC0M0ShlIwMbPd0hmLeXt1RlKqEW1o0kAhSPf8y1hqzSzgciX8+mvI
	3mtMKQ==
X-Received: by 2002:a17:907:3f87:b0:b9d:df73:f0b8 with SMTP id a640c23a62f3a-b9ddf7429e8mr7795766b.32.1775983775119;
        Sun, 12 Apr 2026 01:49:35 -0700 (PDT)
Received: from ahossu.residents.sin.openfiber.nl ([88.202.160.248])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9d6dfd89a9sm226253366b.25.2026.04.12.01.49.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Apr 2026 01:49:34 -0700 (PDT)
From: Alexandru Hossu <hossu.alexandru@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	Sowjanya Komatineni <skomatineni@nvidia.com>
Cc: Jonathan Hunter <jonathanh@nvidia.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Alexandru Hossu <hossu.alexandru@gmail.com>
Subject: [PATCH 2/2] staging: media: tegra-video: add missing error checks in vi_tpg_fmts_bitmap_init()
Date: Sun, 12 Apr 2026 10:48:08 +0200
Message-ID: <20260412084808.232010-1-hossu.alexandru@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260412045245.GA2019381@kroah.com>
References: <20260412045245.GA2019381@kroah.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-58604-lists,linux-media=lfdr.de];
	RCVD_COUNT_FIVE(0.00)[5];
	FREEMAIL_TO(0.00)[linuxfoundation.org,gmail.com,nvidia.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[nvidia.com,bootlin.com,kernel.org,vger.kernel.org,lists.linux.dev,gmail.com];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_NEQ_ENVFROM(0.00)[hossualexandru@gmail.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[gmail.com:+];
	TAGGED_RCPT(0.00)[linux-media];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: DCF423E3200
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

tegra_get_format_idx_by_code() returns -1 when the requested format is
not found in the SoC format table. vi_tpg_fmts_bitmap_init() does not
check this return value before passing it to bitmap_set(). A negative
index converted to unsigned would result in an out-of-bounds memory
access, corrupting adjacent kernel memory.

Add WARN_ON() guards so that any future SoC addition or Kconfig change
that exposes this path fails loudly rather than silently corrupting memory.

Signed-off-by: Alexandru Hossu <hossu.alexandru@gmail.com>
---
 drivers/staging/media/tegra-video/vi.c | 16 ++++++++++++++--
 1 file changed, 14 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/media/tegra-video/vi.c b/drivers/staging/media/tegra-video/vi.c
index afc7327ef318..d1d934e361f7 100644
--- a/drivers/staging/media/tegra-video/vi.c
+++ b/drivers/staging/media/tegra-video/vi.c
@@ -1017,7 +1017,7 @@ static int tegra_channel_setup_ctrl_handler(struct tegra_vi_channel *chan)
 }
 
 /* VI only support 2 formats in TPG mode */
-static void vi_tpg_fmts_bitmap_init(struct tegra_vi_channel *chan)
+static int vi_tpg_fmts_bitmap_init(struct tegra_vi_channel *chan)
 {
 	int index;
 
@@ -1025,12 +1025,22 @@ static void vi_tpg_fmts_bitmap_init(struct tegra_vi_channel *chan)
 
 	index = tegra_get_format_idx_by_code(chan->vi,
 					     MEDIA_BUS_FMT_SRGGB10_1X10, 0);
+	if (index < 0) {
+		dev_err(chan->vi->dev, "format SRGGB10_1X10 not found\n");
+		return -EINVAL;
+	}
 	bitmap_set(chan->tpg_fmts_bitmap, index, 1);
 
 	index = tegra_get_format_idx_by_code(chan->vi,
 					     MEDIA_BUS_FMT_RGB888_1X32_PADHI,
 					     0);
+	if (index < 0) {
+		dev_err(chan->vi->dev, "format RGB888_1X32_PADHI not found\n");
+		return -EINVAL;
+	}
 	bitmap_set(chan->tpg_fmts_bitmap, index, 1);
+
+	return 0;
 }
 
 static int vi_fmts_bitmap_init(struct tegra_vi_channel *chan)
@@ -1410,7 +1420,9 @@ int tegra_v4l2_nodes_setup_tpg(struct tegra_video_device *vid)
 			goto cleanup;
 
 		v4l2_set_subdev_hostdata(&csi_chan->subdev, vi_chan);
-		vi_tpg_fmts_bitmap_init(vi_chan);
+		ret = vi_tpg_fmts_bitmap_init(vi_chan);
+		if (ret < 0)
+			goto cleanup;
 		csi_chan = list_next_entry(csi_chan, list);
 	}
 
-- 
2.53.0


