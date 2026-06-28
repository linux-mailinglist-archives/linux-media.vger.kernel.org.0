Return-Path: <linux-media+bounces-65832-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id NTNoFo2ZQWomsgkAu9opvQ
	(envelope-from <linux-media+bounces-65832-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 29 Jun 2026 00:00:45 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 041CA6D5111
	for <lists+linux-media@lfdr.de>; Mon, 29 Jun 2026 00:00:27 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=baylibre.com header.s=google header.b=OcnJ3TLs;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-65832-lists+linux-media=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-media+bounces-65832-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=none;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 31EA33008619
	for <lists+linux-media@lfdr.de>; Sun, 28 Jun 2026 22:00:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0A9B23BA23A;
	Sun, 28 Jun 2026 21:59:55 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52A823B95E9
	for <linux-media@vger.kernel.org>; Sun, 28 Jun 2026 21:59:51 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782683994; cv=none; b=msjsndvVooFQMEyJpumhF/ixzLTiEWbkFN+Jib3XCbgmoFBhnrBQDVQTX7+SWMT6dR/IqjBcxUyv5HUBBzHzwfFNBSkuV3J8Q3DvJ/PB1u2lXkeFDkOxG9CGsevmmqGGK1lPegFMXT3sQJJOqw8Qt597bGPnSNBZd+4mVkgppS8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782683994; c=relaxed/simple;
	bh=4EzIdDRUtw4t5bGv2aE92n3beG8LrrNZi5SE/buxdUU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=UqKMKz6fr9d2BuSKS8lMneAj+/XsXVgEHp7Ge/QJ4xL8NFsOug4bBQsj9+wA/mE7JhfK5zKgTP2X1Ig2WGrlP+y/WvLHqt8JrXfuW4AQ8rfZNA6ljC5RQ/YXzjAuHtS4Fd/MTJpv7mx8olqygCmgHIbmVoalXUvfpVLsSowpIas=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=OcnJ3TLs; arc=none smtp.client-ip=209.85.128.54
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4926f8e02e8so15344165e9.0
        for <linux-media@vger.kernel.org>; Sun, 28 Jun 2026 14:59:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1782683990; x=1783288790; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yAS1LOwW4iPbNBsZXbgmDeYjHMTNiWfBWwu+VzsMgQM=;
        b=OcnJ3TLs5FDmlCc8tX0kFvFYQaDWtxz85TISwK1wkl1XyyAYnp2o79Y56JE2zAlaMq
         MVH63LnwqQTV12w3JetF8Ijp0YPVfhzAljl4SYK97GDmu9lxqZb4f64FW8ozEI0/DPIS
         OUkbYqSfikWNgLyZ+XjyXjFQuVgD4Duc6d7Rw7/EBuTI31mLWqLiP1LLrBENPr1W7SHW
         Wy0QzXT2vDVw+JWMPE3Iqj3Y8U+FjkaEZ5XYbIwGIOc1h3iycQm9CQ0tFS3QrdMNmeD8
         k/BdPMB9ZzrM9bCjSblAm9NkjAfhzIjwf4Atwg/kKsraYPZnRaG4tFBjvmH5/DW2wJpm
         uSyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782683990; x=1783288790;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=yAS1LOwW4iPbNBsZXbgmDeYjHMTNiWfBWwu+VzsMgQM=;
        b=OZ44WbYXH9eyHz2stKtN9UYQW7uDgG+va1vVt8kyDd4plhlY6al5EV3KNnlD1IFPUd
         hHH3i1gQ+1Zpaki70WYFUwMjdRVRN/ZDZHTLEkw11XdBO6q4gIiGXrFSKJLcyAzCDINx
         OhlPFpfxZlNiGxv5B2YEnbUhUf41XJko1H/mwVKWq/7/v/nL6NI2Lyks5Z04SQHD+mA4
         nZQdHTOMmZscebBRlSztkb9OFplrqCr11+Za9fwUJpiLahWqFv+RHvKSp2liv+aL9FHC
         EA6hjjAXIEhbloGX/YK8eq3LQTc6pzzLCPPqLkTWHp2AujstOVA6sAsyUYD6lNpckTMa
         maOw==
X-Forwarded-Encrypted: i=1; AHgh+RoAPcAEkqpA1e0KiOw1pxL3Ca2K47kLRy4blPJGnpnkUBAEQN+aM8b796DvZmXCQ9bOWQUd6rvDg70lMQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxE8rgQn1uyG/MuvEhtMSydTWy9a2R/kQc2oXdOx657+8t7/V8S
	rTmEtEup2qK8KJNht2JFXNAAV1xKn5vUn8HD0QxsUNGjy6pkPr13biG/oU9Rh2Fl5zI=
X-Gm-Gg: AfdE7cnd80gSvC/g4yMLXC7DhnkYX0+94rkw0oLGYcyj/mMGsy43TnAnF8T2421bL3O
	wuWAp5ozhUc8Uo3x+B+GefzHZV9XdIXjY6ytBmTQ2SU0Itf/Ac2k1o+fXsR7yqAfl2T3rk4i4Gp
	+FJWUqo6dyFVpMyHW800X9Xh48VS8Qv3e5ma2U8grSBxTTfXvNEyY+dLFnGBWWYMXgdtLROXH6q
	EUzqURK2RrVYO79JHx8QH+4MzAcqAJKjaX0O6qz9YTa62nW+bBgh9co4CoEb7TlZVdaoi1jXhlM
	mAvz+9+g+DaNjyxyQgh4pdwOgjV0yGcmFv3KY/XGc44MxXTLRgC941qUOuQU7bnSDj8k77VQYm1
	hTH955J7oBwo6MiS4a1nLGuFALOc3wpXpEm1Z0RGyO3i43oh063B2kVc4diUUSHGUAqoGahX75k
	qs5xBwJAsIbsxCtXDSTA==
X-Received: by 2002:a05:6000:40c8:b0:472:c426:2ce9 with SMTP id ffacd0b85a97d-472c4262f54mr4673267f8f.12.1782683989794;
        Sun, 28 Jun 2026 14:59:49 -0700 (PDT)
Received: from localhost ([2a02:8071:56d1:2de0:559d:eec2:887f:c200])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-4726b76e6f8sm13082893f8f.13.2026.06.28.14.59.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Jun 2026 14:59:49 -0700 (PDT)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig=20=28The=20Capable=20Hub=29?= <u.kleine-koenig@baylibre.com>
To: Linus Torvalds <torvalds@linux-foundation.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Yemike Abhilash Chandra <y-abhilashchandra@ti.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Danilo Krummrich <dakr@kernel.org>
Subject: [PATCH v3 02/16] media: ti: vpe: #include <linux/platform_device.h> explicitly
Date: Sun, 28 Jun 2026 23:58:37 +0200
Message-ID:  <453257c9fa32acc4ab5b3e4c3b010244966a7b9d.1782682124.git.ukleinek@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1782682124.git.ukleinek@kernel.org>
References: <cover.1782682124.git.ukleinek@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1007; i=u.kleine-koenig@baylibre.com; h=from:subject:message-id; bh=4EzIdDRUtw4t5bGv2aE92n3beG8LrrNZi5SE/buxdUU=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBqQZkRvo4eNZX8wxkfmly9iAfpsfg9yvA7r++qs I4SQvr9CUCJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCakGZEQAKCRCPgPtYfRL+ TnbrB/9CSgJUxFffneUMsgGatyIb7FRr/47bollq3E/IrnKcRqbsSo5ZtlkBK221IjBj52tKECd NU6MLzxwfUhMsAwlHzI7tiRRNe9zCUR2B1LkE6gaCKo6ewFkORSMO0HTnkMW9ksWq//dk3e1kZf s9ZC7vJvK2cOEMmJdeXd89meo5tvvvpf99knf13R2ClGp4cwKE9auLQeZDILmSlEaP+YruD9fLT 9SfGwLPbU7cw+gvsWPDM/gGgFRqB5DTAyWAi5ViNznVAqo9ruO3+YwSwbW2OxTS9891PS1xOINl ntU2K+c+qttdCju47FFSRde2vePJSeEqBlKM5Bb8mNeqgFiA
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[baylibre.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	TAGGED_FROM(0.00)[bounces-65832-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:torvalds@linux-foundation.org,m:gregkh@linuxfoundation.org,m:y-abhilashchandra@ti.com,m:mchehab@kernel.org,m:linux-media@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:dakr@kernel.org,s:lists@lfdr.de];
	DMARC_NA(0.00)[baylibre.com];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[baylibre.com:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[u.kleine-koenig@baylibre.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_FORWARDING(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[u.kleine-koenig@baylibre.com,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	RCVD_COUNT_FIVE(0.00)[5];
	RCPT_COUNT_SEVEN(0.00)[7];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 041CA6D5111

The driver uses several symbols and structs defined in that header. The
header is currently included transitively via

	"vip.h" ->
	<media/v4l2-ctrls.h> ->
	<media/media-request.h> ->
	<media/media-device.h> ->
	<linux/platform_device.h>

which seems to be on the lower end of the scale between random and
reliable.

Acked-by: Danilo Krummrich <dakr@kernel.org>
Signed-off-by: Uwe Kleine-König (The Capable Hub) <u.kleine-koenig@baylibre.com>
---
 drivers/media/platform/ti/vpe/vip.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/media/platform/ti/vpe/vip.c b/drivers/media/platform/ti/vpe/vip.c
index cb0a5a07a3d4..e56a95f53ea9 100644
--- a/drivers/media/platform/ti/vpe/vip.c
+++ b/drivers/media/platform/ti/vpe/vip.c
@@ -16,6 +16,7 @@
 #include <linux/interrupt.h>
 #include <linux/module.h>
 #include <linux/workqueue.h>
+#include <linux/platform_device.h>
 #include <linux/pm_runtime.h>
 #include <linux/sched.h>
 #include <linux/mfd/syscon.h>
-- 
2.47.3


