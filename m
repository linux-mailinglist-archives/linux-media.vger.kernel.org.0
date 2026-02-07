Return-Path: <linux-media+bounces-52334-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oH3mI5IKh2l2TAQAu9opvQ
	(envelope-from <linux-media+bounces-52334-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sat, 07 Feb 2026 10:49:06 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CF9F105667
	for <lists+linux-media@lfdr.de>; Sat, 07 Feb 2026 10:49:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 47AAF3021E69
	for <lists+linux-media@lfdr.de>; Sat,  7 Feb 2026 09:48:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 561BC322B8C;
	Sat,  7 Feb 2026 09:48:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EF7iw2Ay"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67F1A31B80B
	for <linux-media@vger.kernel.org>; Sat,  7 Feb 2026 09:48:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770457733; cv=none; b=fWP8LVaRo/z2Ap6JbLnjFRHMgBNjgyfWpXujA7QKuogQuNF4CkmvoHs35EU0nmh22y3I7rVG37kgllXnh6+4thr16c2hPjyZR7bvXQMxjboPz548RzluH1YQzwfP6rMWcJPvrOgMZ7a8lObDSssNfGio2e6t9BiKkXZErLH6igY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770457733; c=relaxed/simple;
	bh=TGsE2fB5VTyKMU0l7HF00EXkkyMHxoKJRndW309YkdM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=G9PdDQAsNkJytmMKgvq1XOj54R3rVvWJPNOLYWeMe0/UV/8bJ7YC9t1loVzj+FPbkavrm6i+Bji4tU/zoRX8wJFaU57vp6vpGX5pdsLWrvB3IhN2M5v1TcGNtYW4VtndlKvnsDtMdq3laz3jWUfFCBf3R5dSv6yd+NMZ4H3IA8w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EF7iw2Ay; arc=none smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-59dcd9b89ecso3966816e87.1
        for <linux-media@vger.kernel.org>; Sat, 07 Feb 2026 01:48:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770457731; x=1771062531; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=wEM++L2wpFRImt5jUOuUMN5DTiB5ZK9kF5mPmLtnWQA=;
        b=EF7iw2AyRwwdgSO9PcJnc6SqpKEduQNx0gwTLCh/KMbiWxkTLE4VNhioD3yaNKgsif
         bAdt8p4EgeqUjKfURMJl9r8t7TItHLCch85k5ioIyCY1u9LrPSnHOYrm+soc2We2cmXe
         IKbrxo07N0ge1P0X2lPa/oU1qrVLeQSBaMHz9tonNIeSYjZmVZqpu2s680ffF2NuOisF
         KNGAOfdEdPo/RwArgMRjkewXvRQeeMlW68YNUKqhYmvXNt9rRYDPMLlzl9/tGd44qxFY
         XMmdwOkL798mOo6XwDY8leUxIjdcakVAX6uITIzkG0TWM4EpKovRynqj0YiYVcNeumdZ
         U1mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770457731; x=1771062531;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wEM++L2wpFRImt5jUOuUMN5DTiB5ZK9kF5mPmLtnWQA=;
        b=pg7uMsZy39hA2jF9URgh1FxxJY59uw2AJjIvRxdnINgcNSBzXEcmbx074TtMQzX757
         fOlIuoXL6QPizsWmTPVF2nba0jFhG9rqJPb3JCP9285Q1Rvdt4D9e3PtcqQcO9ykpx/u
         N8F1oj/LV27vEZXaJaZIwRFIvZxNnvcalB6oSxaCnOtHVdjOu9QRcquhLuAmo6YWHOJJ
         +7vh1qJdBEpv/f6cwA2RdhdIzRoDsfFX5yLn6w7zKoJC80tycVFnjb3twzqYYpVaghlG
         WwVhCbarPaYnfqiRaQ2nxn4a387pt4CWzrSzCMGrK0MPRX4k2NgciZw25/YUlzARXYTb
         3mZw==
X-Forwarded-Encrypted: i=1; AJvYcCXahJqyW73UaVrXux2YyclCQN7McfYksENekKtHp987InSeXl9LHyTvDuyAu6yBung84aeKRkkPZY9SHQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwdamnUa19Y1VVeZ4W29DQAIZQZl9kD63Jm4LvUCnMW3WQ8ohUP
	NcJMdpFHWShHFi9qDGUJ6P8gk80yNShjfIgHYVigaOSzWUybj1Jt4U2H
X-Gm-Gg: AZuq6aK1FB1X9xHfqdHzIuhSJ8kL5NaRbe+KNxOwrNluA2QZYBKBEJhyvZ4LpdeA74L
	4+ixSYEoddpyKJzXvdAl3mgx5DwuW6SNTs4wjDj+3VAQxTcvavejHSMs0GUTBXNZVovh7i/S6ih
	u4X6B5334/KiwASHYc1nVsgWk1umiXteLqit2+okA5ZNuthDgsKvy7LqjMZvKY+PqC1tt78cmA5
	4ECmARTQ3CCZSbdYG2IiREbf4JZ4B1swQSDPudFMYSrtibSSUPr53arWep97jovoWTuuWVyxmdA
	YhoA9aKeFEQMDs17O1oBUf/CXXG7yjIgRKk7bYObYV7YxqkBktgITO0qMHHafkkp1JTJ3xL4NlQ
	a3pex0SrO3nVB5Pqwnk5tqtZaiDfDOPU1RsKEGLNjNC9lE2wE0ZybYBeVsiwc377MoxmHbk+Zio
	Ib+fZvF9UVtfUVD2HWuwYrGvSn2F3JsUXlXysktao28fhsmTE2UmvJEaayu0E/Y2nGgjQYhGcnL
	gH4ZH5TS5FUNNVhhygJL2pMYg==
X-Received: by 2002:a05:6512:1327:b0:59e:2d6a:b8a5 with SMTP id 2adb3069b0e04-59e44b59e59mr1936663e87.0.1770457731309;
        Sat, 07 Feb 2026 01:48:51 -0800 (PST)
Received: from localhost.localdomain ([176.33.64.73])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59e44cf700dsm1210132e87.11.2026.02.07.01.48.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Feb 2026 01:48:50 -0800 (PST)
From: Alper Ak <alperyasinak1@gmail.com>
To: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Cc: Alper Ak <alperyasinak1@gmail.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>,
	Daniel Scally <dan.scally+renesas@ideasonboard.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] media: rzg2l-cru: Fix possible ERR_PTR deference
Date: Sat,  7 Feb 2026 12:48:39 +0300
Message-ID: <20260207094841.603932-1-alperyasinak1@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,bp.renesas.com,ideasonboard.com,vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-52334-lists,linux-media=lfdr.de];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[alperyasinak1@gmail.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[gmail.com:+];
	TAGGED_RCPT(0.00)[linux-media,renesas,cisco];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 3CF9F105667
X-Rspamd-Action: no action

The media_pad_remote_pad_unique() can return ERR_PTR() on failure
(-ENOTUNIQ or -ENOLINK), but the code was dereferencing the return
value without checking for errors. Add IS_ERR() check before
dereferencing the pointer.

Fixes: d7d72dae81d5 ("media: rzg2l-cru: Retrieve virtual channel information")
Signed-off-by: Alper Ak <alperyasinak1@gmail.com>
---
 drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
index 162e2ace6931..a34c2188df1a 100644
--- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
+++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
@@ -411,6 +411,12 @@ static int rzg2l_cru_get_virtual_channel(struct rzg2l_cru_dev *cru)
 	int ret;
 
 	remote_pad = media_pad_remote_pad_unique(&cru->ip.pads[RZG2L_CRU_IP_SINK]);
+	if (IS_ERR(remote_pad)) {
+		ret = PTR_ERR(remote_pad);
+		dev_err(cru->dev, "Failed to get remote source pad: %d\n", ret);
+		return ret;
+	}
+
 	ret = v4l2_subdev_call(cru->ip.remote, pad, get_frame_desc, remote_pad->index, &fd);
 	if (ret < 0 && ret != -ENOIOCTLCMD) {
 		dev_err(cru->dev, "get_frame_desc failed on IP remote subdev\n");
-- 
2.43.0


