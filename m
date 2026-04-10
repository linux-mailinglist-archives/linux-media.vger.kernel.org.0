Return-Path: <linux-media+bounces-58547-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6LtKNOXv2GnxjwgAu9opvQ
	(envelope-from <linux-media+bounces-58547-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 10 Apr 2026 14:41:09 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 93DE33D77E2
	for <lists+linux-media@lfdr.de>; Fri, 10 Apr 2026 14:41:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 5C0BA3031C5D
	for <lists+linux-media@lfdr.de>; Fri, 10 Apr 2026 12:37:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 06B521990A7;
	Fri, 10 Apr 2026 12:37:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="sT8NQUh1"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60B78175A9C
	for <linux-media@vger.kernel.org>; Fri, 10 Apr 2026 12:37:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775824638; cv=none; b=D+qIuRplz95HmXP/LYDM7IY+voyYlA+D+skiTqN1zngMfWHY3TF8q5LmI46TjK8dgye0ONlJBo0kMdjAbaaR3KwzDPW+qWc9urq4ptPhxpFqLAKHdTqj5SViUscD0FAIo4F7jtP3nJzFDPTvtuqc1J65cick53Tj0+OPyAQggBI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775824638; c=relaxed/simple;
	bh=B1v2q1OG8R3QC/7LCYsgcYJHY7L4xRv3rkstdtYf6uA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=sy/U/A8BymKiYA3eo84E7ztAgD07dekgED3+DXvuPHQyixeVThpc4A2SZuImKTaNIbDqTUnmftzWUim0uR+Bz0OhOzBrGh39lmm0XX4A8AG/qwUYaeljsTqmYjU9vlNLcAUjBh81/uJu/drpg7k4kOSlIUUzuWfHRWAJVpHy7V0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=sT8NQUh1; arc=none smtp.client-ip=209.85.216.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-35da01fc0baso1301428a91.2
        for <linux-media@vger.kernel.org>; Fri, 10 Apr 2026 05:37:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1775824637; x=1776429437; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ObSlHorYoFId3LOZrgQbV492ce1VusgbgOP1QwTrQ4w=;
        b=sT8NQUh1u0rS4lSEnoGk6/8ZlwOVjctywzEen+gCbie7hKrIiBzFFL0cGZyvukFPmT
         8eiPkAjXWkRmPZnQs7b30nj+TPZylBoBH5Or1TS7NVG8V+wS8XE1e/4zeZGUkwP2nEZG
         Hqet4qpA2QCxgAsH0nK2ItEFup15ucxtozqFE14BX6aWcfCsTVK4KbMfwgW8ujbqlDld
         j2pSO6G7cIX3KIdIk5qUOMTHhzgmL2T3W7er5CEzDC4ABDo4C0zCkj4WVqqPl1KbFFFA
         mVF7F0nrGKqlFDBBHGr3VK1XBl8LT58HsyP3DE2SOEe37NljVAbYvT4gqWYYRLN/T3SI
         bE9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775824637; x=1776429437;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ObSlHorYoFId3LOZrgQbV492ce1VusgbgOP1QwTrQ4w=;
        b=U8Mp/tbFrLaiqSpVIvFQE28yAn3Nusw5tqiTiCcVfEGpR2xloPdVx19e7qUpb7YUyF
         mGWDqRMFzUr+zqz8WMajkgAEcs8+Qy+/L7c1SLeoDkgBfOQI/PaIESM/E1XgWxj2bCu1
         XZy6FOlPO3ewxs+2GEMSgH27pgU2LkwZ79x9IIXq+gxXWRT6oozHDOJ+wJ5IscqM3eFd
         0vaIglH6ihbifiV+ghkzAQf+7qmHYjfT8UuZ3ozVjWB/2pIGR5bHoCoXrTsrnJ97/H5F
         AWH4Dgdgfn6IXp8tOhfyUkocvTgFaDFZ97SKsKkFmk5oWEGdTIsMH8EK4YVB4SeqUKSF
         R1sw==
X-Forwarded-Encrypted: i=1; AJvYcCVyW++ysaPLgK2foR7gPlvCRfp4wHiXshMQzt0v4FbEcmckziViFfO29i3Xkoh106tara4vT7MuL3fNrg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxGzKaM1TMRntrVm+x8MLKjUWER2WWvH6f1s1ucJnoKpnASSoiN
	GFbx0fE5J6yfXLTHM9VJAXs+PnqiAnrukaQ/Q/P1WhHPNWDcG01ZNZQZSjWLPkRdI+w=
X-Gm-Gg: AeBDiet/ehXyYAVqQoXEN9B53pQzars+4zzZUfSGIL3rWXuoXO8Y20qNX7+U3rUJOtt
	rwivlcami8rLU/IodfBSg2xctSMKv6Qo4H2OXh0tmS/N3nUwrfiAWeG8hj8zeMlh2I861bFSLnf
	yfjPfJwsnM5DIpsT5sRyBune3lEhz2+AKVaWG19Y6tiY1F1WHqvAaKz0cAF32mfU42wbFren6cy
	4KdtClTwuqP4gStKiB5QKBpiW93aY9PV3ncZOXfv3oe4OYm9DhUs+MiFhqp1baAbERuTDsv1LhL
	lBoNLfkjfXYYa8PAUo6r2gitc7EXdoU0VMcPJDhFEnjMoKjwCH4fMxNvKjFUs3DsCpIMTPhmT14
	E+YHy7tEiIM7+Jaqt+IhaA5vsX8/QNK1e8W7xxEI3OfAKNRg0XcFrgiuFUlDfBs51xqmZhFyPsh
	tExvSWLku5QuRjbi+a1Q7A5W1IcK+UyS7ckO3edziOPsSC
X-Received: by 2002:a17:90b:2ccb:b0:35d:a9bb:1e33 with SMTP id 98e67ed59e1d1-35e427afe02mr3338087a91.11.1775824636700;
        Fri, 10 Apr 2026 05:37:16 -0700 (PDT)
Received: from nagraj.tail8a2ac.ts.net ([2406:7400:98:af5f:a6a2:e126:5ae3:4132])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35e35155829sm6780138a91.13.2026.04.10.05.37.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Apr 2026 05:37:16 -0700 (PDT)
From: Sumit Semwal <sumit.semwal@linaro.org>
To: christian.koenig@amd.com
Cc: leon@kernel.org,
	broonie@kernel.org,
	linux-media@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	linux-next@vger.kernel.org,
	Sumit Semwal <sumit.semwal@linaro.org>
Subject: [PATCH] dma-buf: fix htmldocs error for dma_buf_attach_revocable
Date: Fri, 10 Apr 2026 18:07:03 +0530
Message-ID: <20260410123703.937822-1-sumit.semwal@linaro.org>
X-Mailer: git-send-email 2.51.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sumit.semwal@linaro.org,linux-media@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-58547-lists,linux-media=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[linaro.org:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCPT_COUNT_SEVEN(0.00)[8];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-media];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Queue-Id: 93DE33D77E2
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

linux-next testing showed this htmldoc error due to a missing extra
line in the comments; add it.

Fixes: be6d4c9e9d714 ("dma-buf: Add dma_buf_attach_revocable()")
Reported-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Sumit Semwal <sumit.semwal@linaro.org>
---
 drivers/dma-buf/dma-buf.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/dma-buf/dma-buf.c b/drivers/dma-buf/dma-buf.c
index a202a308c079..532c3f14bf9d 100644
--- a/drivers/dma-buf/dma-buf.c
+++ b/drivers/dma-buf/dma-buf.c
@@ -1353,6 +1353,7 @@ EXPORT_SYMBOL_NS_GPL(dma_buf_attach_revocable, "DMA_BUF");
  * Upon return importers may continue to access the DMA-buf memory. The caller
  * must do two additional waits to ensure that the memory is no longer being
  * accessed:
+ *
  *  1) Until dma_resv_wait_timeout() retires fences the importer is allowed to
  *     fully access the memory.
  *  2) Until the importer calls unmap it is allowed to speculatively
-- 
2.51.1


