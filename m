Return-Path: <linux-media+bounces-58610-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UF+jNOu/22mTGAkAu9opvQ
	(envelope-from <linux-media+bounces-58610-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sun, 12 Apr 2026 17:53:15 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 32C543E49ED
	for <lists+linux-media@lfdr.de>; Sun, 12 Apr 2026 17:53:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E92743029AEE
	for <lists+linux-media@lfdr.de>; Sun, 12 Apr 2026 15:50:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0602A2BE026;
	Sun, 12 Apr 2026 15:50:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jiOmlDqt"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-dy1-f193.google.com (mail-dy1-f193.google.com [74.125.82.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46CFAD531
	for <linux-media@vger.kernel.org>; Sun, 12 Apr 2026 15:50:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.193
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776009041; cv=none; b=u3DLieFemaMU6KYkzUmW7qm9BFghh9YPxHKLJpUGiSFxo7Qn2bHvkoN4z7mBMODmnrtvj6CeAvNIbeQKm/RHfeI2nVKTDhIPmijkpiTjnzmONkHRu4ZOcdZj+PPXoK+38b0TJJmKbXYjijI4/eBfZMOTVBRxpG5yV1pbWEsB2Wc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776009041; c=relaxed/simple;
	bh=lwhat2bSQv6XJb0gxi3qwiTzBQ65AmGJ8xWTcMNNrUs=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=XFjCmWfraW5rYle1y+e5JIwIuG1D6ItTw+v6yxFzP1xnuMAKIUTdxkyMQvwZ/1bxGAmTXd11vkDr+BcA7HNPAh/BYpzO8krvVETUKA0SIaNhzIvxQR34SBDqYIvFtHBtkC1U/fPFwRC16fZVmTfrOGJ6nWGWi99CUE48g9ugPSQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jiOmlDqt; arc=none smtp.client-ip=74.125.82.193
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dy1-f193.google.com with SMTP id 5a478bee46e88-2ba895adfeaso3487305eec.0
        for <linux-media@vger.kernel.org>; Sun, 12 Apr 2026 08:50:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776009039; x=1776613839; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=SHDvV1CNmZJ3zUchoWzB/rMv8sKx+dY5re1OzoQ2tMA=;
        b=jiOmlDqtHfNEMgtxMZl57yN7oVgbbPCq7CaWJ8SIxqzI86Pzt1dNBqSfb7np0MdsMk
         qkzqvx+mFIEPLE3J3RJ8xC2PCZZxRvV1n9I1R7yRljqsywiTPzFh+NUiHu2xTpl0d/fN
         4D0jVNYMJyfsgMMfZlPKFgAkH0UPUwfKT40EtiUMqA/oYClUaHH1+Ryk64vPN59EuUL4
         m7uIxbH2AzDK8yvIBVwBqaG6c51ZEjTXKE73kAsrRvWY3ghpLYqjvbmVesPXXn4Y20IV
         GPqrk87GFLtCKof/DPUpGGwdn8aDlRIWxRtCiX9oiIli6wEiYwBB5wD7uZjt07WydMD8
         TKyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776009039; x=1776613839;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SHDvV1CNmZJ3zUchoWzB/rMv8sKx+dY5re1OzoQ2tMA=;
        b=GjHgAsUPHc9iwoRjwVA2GPuKsIBzpPGk8TJ8z9O284nnu5Mu71m4INIOP/JKW7lLQa
         QA0lh66Abb9dWuoTwihBpa93K34m6wOfZwR5bGAWjzBNUUgO+DgmWLD5z5tdP30h8JJf
         ldPNA+B/LHsvYS0Q/YGjxNZ/GH3KLG1mUEnpqa/SaY0+byVmQ4pWY0ZFYClnhSU9jIY1
         TmJP9VbaaQfFNU5garMQ8xdJ8gmVvi0bgn3z4bK8OutI7sMuRxf8d2QqyUbL/OQdhCY5
         iGGpugGIYtTErNVv0d+cCq5Tpd3Vh9qHiWbW1GgS8fz5Lh5PbxeEV1AkCtXDFAEa+n6I
         krfw==
X-Forwarded-Encrypted: i=1; AFNElJ8FtmcvZAs6/Z9iKYMwDWowG4+1Nx/Rorc/TLQkyX4Y3KuwU769b3tWbOCdc5Bi+rZakSjilN+Gp6CP9A==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx4GJrcyJXePEIh0OmaS8UMn1dyaJoO/uKnFvbkjaJN3qMnUR31
	Jw7CymaMkzxVfE01DnomSF0QTfhoqB8JQy4/N+iHM2VJyD+lsnTxZex0
X-Gm-Gg: AeBDiesA4mxIfXzmlbuUZbWZuzNx9QYj2cMbCnkBw+wgu+uBbApHd4e5fQTsvs93BLR
	b89X8I79RFM4UAP2vFvFr3dqJvwexzm7Px7EOoH6Fb7KpIPAtpidecccMJDgzoOHeA0IZLVrnZU
	t1r70cZph1O3ZA+ulxf/LTSQK0xoAJ3TQJUAyCzzsMLWT+bgLuIMjs1fTJJ1lVfn96MHkRzqoyi
	+bkFXSj7QJTxzUc/Su+QQarCXkbr2A3nHDPjsxrsSfnGSZNsfnnbsPefdHrmdZYL/17Y5sA6YXf
	zeGtgqkFdj7HAmBKWLPVwn5gYhSpY4D3j5oPA432bMbpkpddceNog/u75YTEf+NN0wBrPOlF/YF
	l4E9oDSc0Tns0bYQLCQwW1i3qSC/FzR6KTS+c9AY88ckvccWxORFiFfBUTYX52UCz5waSExjKyF
	jdblFdJvvhefpcMMTOGHET6sRav46J7e4xDpd8HduOFPR+tPNZB5hQbxU=
X-Received: by 2002:a05:7301:4b12:b0:2d6:526c:55cf with SMTP id 5a478bee46e88-2d6526c5a9emr3259901eec.9.1776009038931;
        Sun, 12 Apr 2026 08:50:38 -0700 (PDT)
Received: from localhost.localdomain ([76.32.119.210])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2d561cd2c09sm15403781eec.18.2026.04.12.08.50.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Apr 2026 08:50:38 -0700 (PDT)
From: Hungyu Lin <dennylin0707@gmail.com>
To: thierry.reding@gmail.com,
	jonathanh@nvidia.com,
	skomatineni@nvidia.com,
	luca.ceresoli@bootlin.com
Cc: mchehab@kernel.org,
	gregkh@linuxfoundation.org,
	linux-media@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Hungyu Lin <dennylin0707@gmail.com>
Subject: [PATCH] media: tegra-video: vi: validate format index before bitmap_set
Date: Sun, 12 Apr 2026 15:48:43 +0000
Message-Id: <20260412154843.29056-1-dennylin0707@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,linuxfoundation.org,vger.kernel.org,lists.linux.dev,gmail.com];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-58610-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,nvidia.com,bootlin.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dennylin0707@gmail.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_SEVEN(0.00)[11];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Queue-Id: 32C543E49ED
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

tegra_get_format_idx_by_code() returns -1 when no matching format
is found. vi_tpg_fmts_bitmap_init() used the returned index directly
in bitmap_set(), which may lead to an out-of-bounds access when the
format is not present.

This can occur when TPG is enabled on SoCs whose video_formats[]
table does not include the requested media bus formats.

Validate the index before calling bitmap_set().

Signed-off-by: Hungyu Lin <dennylin0707@gmail.com>
---
 drivers/staging/media/tegra-video/vi.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/media/tegra-video/vi.c b/drivers/staging/media/tegra-video/vi.c
index 9c0b38585d63..dd8911640d98 100644
--- a/drivers/staging/media/tegra-video/vi.c
+++ b/drivers/staging/media/tegra-video/vi.c
@@ -1020,12 +1020,14 @@ static void vi_tpg_fmts_bitmap_init(struct tegra_vi_channel *chan)
 
 	index = tegra_get_format_idx_by_code(chan->vi,
 					     MEDIA_BUS_FMT_SRGGB10_1X10, 0);
-	bitmap_set(chan->tpg_fmts_bitmap, index, 1);
+	if (index >= 0)
+		bitmap_set(chan->tpg_fmts_bitmap, index, 1);
 
 	index = tegra_get_format_idx_by_code(chan->vi,
 					     MEDIA_BUS_FMT_RGB888_1X32_PADHI,
 					     0);
-	bitmap_set(chan->tpg_fmts_bitmap, index, 1);
+	if (index >= 0)
+		bitmap_set(chan->tpg_fmts_bitmap, index, 1);
 }
 
 static int vi_fmts_bitmap_init(struct tegra_vi_channel *chan)
-- 
2.34.1


