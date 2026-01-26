Return-Path: <linux-media+bounces-51545-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sPh6CVNAd2mMdQEAu9opvQ
	(envelope-from <linux-media+bounces-51545-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 26 Jan 2026 11:22:11 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3574386C18
	for <lists+linux-media@lfdr.de>; Mon, 26 Jan 2026 11:22:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 9D4E9300461C
	for <lists+linux-media@lfdr.de>; Mon, 26 Jan 2026 10:22:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1A25E32F741;
	Mon, 26 Jan 2026 10:22:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="f8L1Dubc"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0ADBC3064AF
	for <linux-media@vger.kernel.org>; Mon, 26 Jan 2026 10:22:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769422925; cv=none; b=WBRkf6ETuMlYWPW1ojXagWOyGHR3QUfPf6fociqPvUc+b2+KLh5bwVAdjb4K5wasbtqCzhAYXJtxrfKdnfwAyBTghChcmyiZH0ziF+dXQ8eSNQ0V9CuGD0yCWh+RXAn9oXzw5zlCxGL395g3NodhDu32apGxYUZQsNA0MZfBL70=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769422925; c=relaxed/simple;
	bh=hhHVJuWcsGPZS4w0Oz7Y8dL6uLtRGKYuwtyUBBadydw=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=ABhegtGV1LImSkhvOO5cC2gi3UulIXM3fmGrDzXSQhtOvmx65TIhOBv/skojhUSFnUs7yKHKowRdmLUlxNuFwdYroQCZ4AJ+5+Hp0oYOtKcCypAIkNySJkoQIKv2evwkmH/ztvWUUOQTNTY0yJ3X9nnExh5qBb1PaX2zYDPAQf4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=f8L1Dubc; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4801bc328easo49216235e9.3
        for <linux-media@vger.kernel.org>; Mon, 26 Jan 2026 02:22:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769422922; x=1770027722; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=fxdsOX1mc8rr4Qts+Y9ulGeC1IJPumDA0ysh1WBo1IU=;
        b=f8L1DubcYP8jaV+lksmTHTQKuQUB9gc2/ivVaWgLKch06l7mMORyLEuciFq1oDaM3L
         3zXYR821IIXtr352H9FBnTjxiTSiRlonfApEkOBymyiakbkxfMIyqyJmc+1xpra53RF6
         IM/QFPzZz1ZLO4cFMO39NHZ7AJk5c6CtQ556/CQ95IAFnDa5PafYTQD3ttAFVbX0ALp5
         S+PZkwCKENNmCA+LjLtDYpfLApmXKB9zNVv1FhtDsOalXyQWZG/uX9WHSgQDjsU51tgH
         Zi+vOQ8fC4Ch7AZlBF83TD6sqktbFP/RQerp0TX/qz2pHIBttBDRnosZIme1dGi0wfII
         tSag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769422922; x=1770027722;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fxdsOX1mc8rr4Qts+Y9ulGeC1IJPumDA0ysh1WBo1IU=;
        b=S5D4ze5W2dRlWgvtOSbHtc1VoIlXDiZUW4uBsbT4AjDO90EX/LXjjow7CwamA+ViDF
         /EbfJlxE3rtcpa2QwtpT1wvnc40GVtBio2PBcLAOZ225weIv6bFuY8zmCZ5KTvNsV5T8
         X38Ck86D56WqOCq+BX7xc6P7d6hop4FmaVB5ZTPDPqW3yrDUYCnoe+CMCd9wRq1+Vcu3
         ODgSPY9Y4R/+tgJVenHR2F/ygCp4wu3yPMAIGXtZYkRRDDbVNrzwK94M7S2Yl1piAlPs
         Ra7R0U/z1WYgCxhXeb2zj3TQBrVrV4aq2cITvfG6PB6zoGznGMLqMGcEGOfScFY1c14k
         RKXQ==
X-Gm-Message-State: AOJu0YxAqfc5zsF1uTYl3vigMh6Smdim3eELdxWbopaH8thDPoE4eDZQ
	PsjW0T0o+ADtwq63TjoFnFwREqELIk7HjQknFAhoSjvzALYuyJBwRIux
X-Gm-Gg: AZuq6aIrhP8haQs5N54sZO12/E7jIu9D/iIh5JahcEEQ2rzjGc6zSgfIPKpuZLpjY92
	sdPX6q4YdqIBi91oZNdmcdkeQ/K0zjGm4pl5q+on5mvwBpr0bT/fG0iaL8z9tN8uVhBJjr3Eu7/
	CJU2ZmcKSgohRCLhcKqxJdE0zpO6NCVRCuBC3QFnxgjVolZs6H2+eMuPdGsgs+OBQ9Tf36SAGuf
	uKPU4nKgF7tQno31HQhNiCakmVC7DPJj0US41FdTOH9y40/VL/KXtloNWhzBKsEaDvJZ1ZVVbv4
	7EygcYnW1DxNU5/QHFvHJ3Gld00xCNt0w4g48jed9yPiF30DxrJi+M7czr69P8EJWA4FgXVLqcC
	zah3W+ysxj4y0T37gd5CRBNXE7ZMBttlH+QSiVW3gRXlCKalBceVnolorxXX5IHF5gfVBOT93G1
	u8+mVzTUg9JX2baX9rT6HuIzGkWCs7UH5Bw0Y1SxJHPicJCWNt9NOpQ7dZFf6pU2B6sLh1
X-Received: by 2002:a05:600c:4f86:b0:475:dd89:acb with SMTP id 5b1f17b1804b1-4805cf6749bmr56202315e9.22.1769422922324;
        Mon, 26 Jan 2026 02:22:02 -0800 (PST)
Received: from thinkpad ([5.215.56.190])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4804d8b4fc3sm263805995e9.13.2026.01.26.02.22.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Jan 2026 02:22:01 -0800 (PST)
From: Arash Golgol <arash.golgol@gmail.com>
To: linux-media@vger.kernel.org
Cc: paulk@sys-base.io,
	mchehab@kernel.org,
	wens@kernel.org,
	jernej.skrabec@gmail.com,
	samuel@sholland.org,
	linux-sunxi@lists.linux.dev,
	Arash Golgol <arash.golgol@gmail.com>
Subject: [PATCH] media: sun6i-mipi-csi2: Propagate format to source pad in TRY mode
Date: Mon, 26 Jan 2026 13:51:49 +0330
Message-Id: <20260126102149.39563-1-arash.golgol@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-51545-lists,linux-media=lfdr.de];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[sys-base.io,kernel.org,gmail.com,sholland.org,lists.linux.dev];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[arashgolgol@gmail.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[gmail.com:+];
	TAGGED_RCPT(0.00)[linux-media];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 3574386C18
X-Rspamd-Action: no action

sun6i-mipi-csi2 does not support any format conversion. So the format
on sink and source pad must always match. This limitation is handled for
ACTIVE state via mbus_format member of bridge private structure.

To enforce this limitation in TRY state, user space should only be able
to set format on sink pad. The sink format must be propagated to source
pad to ensure consistent behavior.

This also aligns the driver with userspace relying on media controller
based format negotiation.

Signed-off-by: Arash Golgol <arash.golgol@gmail.com>
---
 .../sunxi/sun6i-mipi-csi2/sun6i_mipi_csi2.c   | 19 +++++++++++++++----
 1 file changed, 15 insertions(+), 4 deletions(-)

diff --git a/drivers/media/platform/sunxi/sun6i-mipi-csi2/sun6i_mipi_csi2.c b/drivers/media/platform/sunxi/sun6i-mipi-csi2/sun6i_mipi_csi2.c
index b06cb73015cd..6ee0f6685663 100644
--- a/drivers/media/platform/sunxi/sun6i-mipi-csi2/sun6i_mipi_csi2.c
+++ b/drivers/media/platform/sunxi/sun6i-mipi-csi2/sun6i_mipi_csi2.c
@@ -369,15 +369,26 @@ static int sun6i_mipi_csi2_set_fmt(struct v4l2_subdev *subdev,
 	struct v4l2_mbus_framefmt *mbus_format = &format->format;
 	struct mutex *lock = &csi2_dev->bridge.lock;
 
+	/* The format on the source pad always matches the sink pad. */
+	if (format->pad != SUN6I_MIPI_CSI2_PAD_SINK)
+		return v4l2_subdev_get_fmt(subdev, state, format);
+
 	mutex_lock(lock);
 
 	sun6i_mipi_csi2_mbus_format_prepare(mbus_format);
 
-	if (format->which == V4L2_SUBDEV_FORMAT_TRY)
-		*v4l2_subdev_state_get_format(state, format->pad) =
-			*mbus_format;
-	else
+	if (format->which == V4L2_SUBDEV_FORMAT_TRY) {
+		struct v4l2_mbus_framefmt *fmt;
+
+		fmt = v4l2_subdev_state_get_format(state, format->pad);
+		*fmt = *mbus_format;
+
+		/* Propagate the format to the source pad. */
+		fmt = v4l2_subdev_state_get_format(state, SUN6I_MIPI_CSI2_PAD_SOURCE);
+		*fmt = *mbus_format;
+	} else {
 		csi2_dev->bridge.mbus_format = *mbus_format;
+	}
 
 	mutex_unlock(lock);
 
-- 
2.34.1


