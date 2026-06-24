Return-Path: <linux-media+bounces-65517-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id bdqLOsaWO2pcaAgAu9opvQ
	(envelope-from <linux-media+bounces-65517-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 24 Jun 2026 10:35:18 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 405D86BC997
	for <lists+linux-media@lfdr.de>; Wed, 24 Jun 2026 10:35:18 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=baylibre.com header.s=google header.b=l3H3KZjt;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-65517-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-65517-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=none;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0666A305F146
	for <lists+linux-media@lfdr.de>; Wed, 24 Jun 2026 08:35:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BDDAB38C2DB;
	Wed, 24 Jun 2026 08:35:03 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 326773290A6
	for <linux-media@vger.kernel.org>; Wed, 24 Jun 2026 08:35:01 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782290103; cv=none; b=ZMcEBI0mF3873AY5zI0KMI6VxJLlyQVi68QKHz33G7DqJoBxWwt4qO48wPOxGX/UBzw1dlO+Vt7hVvfyM7Cct0fgtimFGngXOD5N02oV3TGA4PQeSO+EnzoDWGJp+eNsspsLsHbAdPR7Ck2agucDCmlF5gmt5Lr4628WUazvdC8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782290103; c=relaxed/simple;
	bh=BpPUHiplK1T1/6/tZs9tyt2/0DoOQ61KhcSlST41aGM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=M1nF1yslaBBHDWROuKT1KU02qXA9AVQ+Pk5YS++33aFKGPco7CfFlApbjSlivrCPuQC7u55N4eWsGnHZEVxh68VMdWB9ZxYTwgKXclPkqVibVsQDO9RqlWS2ZS8SeZ1IwEmi39wKfQi6ottp0VwOC8csUnPA5FoXx245Zwei4hU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=l3H3KZjt; arc=none smtp.client-ip=209.85.221.45
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-46caaa805b2so114920f8f.0
        for <linux-media@vger.kernel.org>; Wed, 24 Jun 2026 01:35:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1782290100; x=1782894900; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=mE1bGwqX71SFeolKeiwhYj6Vh55qQ7BEyA5oeTX9u04=;
        b=l3H3KZjtC+7aC1rk6YrCcPhP7LbKxGCC63Mc8UeURJdQxImQj1VdcLGNz32mo8NbsB
         gY1iTVP8bgMEcpRpftCWbSDhe0Br+Z+vT2U77jowc7HzKmjik03i2JbwHEcm4TDJKexN
         lausZx8tiOcbYvaFxCsAfdzEm3zc3rN4nwGUOmhnW9UGLlaYFR/cuzfSKjx3pGRZmIZc
         WcexqRr2JT3BqVuYsXEbJAm/JPQhU3PVk8xJ6/e1BVC1h4y4OeHXLMsJevp92a4Jw9/M
         2TLAUJkUF2vUg0S5W/4yX1ig183rvRRIvQ6mbFdB4TDYjiMA2kDrwmg6UwhLPnGailXQ
         RWnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782290100; x=1782894900;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mE1bGwqX71SFeolKeiwhYj6Vh55qQ7BEyA5oeTX9u04=;
        b=cw1SvYA3VPZSXlBaDYIMd488H7ILk5FPBX99D26X09EiOnTQgI3nVcTJvfDX3VcIRc
         nl1iS2m95jNGT4FJ6X8qElkq8LzkaQbfc6cKaLZgK60lERnRHVAXGiv/uyCcNq1GDvzA
         eprC5y7hr3YOjZa3o4bIATPGli1pGmZCYnS0/gDk3V98nlIguf/0Tc8qTrLDSGkJxquF
         qEquyRMZqytUps0ghhL6mccgaAXipepC+CLPlxxUGrlEHons8a6p7P7T+OXtU4IZb4pq
         eBAWn2/28u08oEc9/k6fpu1/GiMPoW7ifH6uHvim3jIQ8a7IlHJMlT9xpRZeNM8iaRs+
         f9dg==
X-Gm-Message-State: AOJu0Yw2zElC5/HmlDVye6mFG+QXFvZI94OqhOxx0v/+1fbLhXcWh+8p
	6fbikqirDv3RzTIT7U3ZOCsbQkl4tT0pP9ATtwWryzRWM6oSs3t1ftlVj18RpmfsJvo=
X-Gm-Gg: AfdE7cnVQOU0foVUM+ITehonCOHJUYwxwXnudxj139yLxXceTKBtsa2weZFuZzD8RIt
	n26qMMFxSM5HH2rWy+SKYxC3iRh0k0c8kN/v8S57La6Vr0nLtgzlEhMr765KofWTcLASwlj0Ee8
	68S25Q9Iq5PWxV1eKHtXnPML/oMionl6i7DmuJSQODWQw26KDQM8xXOuyY0c14jfnZsFd2uX3l7
	g4dIoa4dNupIv2OcItsQIozfWlrw+NBFxtu6VfKQ+/db177WUZBINeLVg4GPBLHqmb6h+/7uLCK
	/unUYvut8/hs6dA/sKzvneXQLmr8KbVZhPbIUGSuEd+y9oQawcXsBTukNV0gERbp07M0O1QwT0k
	oaiDNowOPbM7hoxS3hEdJh9SxWgM3BdtP0WrgUDwWHwOa/rm3dky43rrARUcoPCCjTWKQEQ0/dB
	lEKuG5iR1k6k0DFPjL97t5Jl6ra7kchRByC5s/E/ZAhsmohTpIO/M6WaG5Kbv3LCbqcBQRJ5YYJ
	EvG
X-Received: by 2002:a05:600d:8495:10b0:490:c032:ae92 with SMTP id 5b1f17b1804b1-4926087f7edmr21406845e9.33.1782290099563;
        Wed, 24 Jun 2026 01:34:59 -0700 (PDT)
Received: from localhost (p200300f65f47db0497adf84f78eebbb3.dip0.t-ipconnect.de. [2003:f6:5f47:db04:97ad:f84f:78ee:bbb3])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4923fc47720sm767202905e9.0.2026.06.24.01.34.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Jun 2026 01:34:58 -0700 (PDT)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig=20=28The=20Capable=20Hub=29?= <u.kleine-koenig@baylibre.com>
To: Yemike Abhilash Chandra <y-abhilashchandra@ti.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1] media: ti: vpe: #include <linux/platform_device.h> explicitly
Date: Wed, 24 Jun 2026 10:34:48 +0200
Message-ID: <20260624083450.241265-2-u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1083; i=u.kleine-koenig@baylibre.com; h=from:subject; bh=BpPUHiplK1T1/6/tZs9tyt2/0DoOQ61KhcSlST41aGM=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBqO5aql+H9yoCCUsqykxwW6xuZ9R8rqMiyakM9y Xxj+Ar7zl6JATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCajuWqgAKCRCPgPtYfRL+ TsZ0CACRAgymfmvHPBHF16NbtC5HyDNm42x1Fk7uD+Vbgmv3cjPso4/OdEuLJ3Ne1GmOBrNWCUz /Bx7guNylbVlmBi2n2W0tSKGMXmdIJvlZbbKVJh8FdSMVR/NmxVQvfvHHilMfscbdNUDwXRZls+ xytefHaYM8rCZO//QTEuefTUQtcTfsr6X5onmG6YL9KDt0QTFa4o99YJfUih7PCJvvQUG+BWxp0 Bmr3B5o+41zlqToJjU0z8M5LRhElrIX/7uTiimdeCNm7auak7XPYBjVwVao21yhxXSHPxszV2Sv sTxy6i718wTV5NHQRo019eRgotg9o+eLQ/TzXuGo/7Sm/zA6
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[baylibre.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-65517-lists,linux-media=lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FROM_HAS_DN(0.00)[];
	DMARC_NA(0.00)[baylibre.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:y-abhilashchandra@ti.com,m:mchehab@kernel.org,m:linux-media@vger.kernel.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[u.kleine-koenig@baylibre.com,linux-media@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[u.kleine-koenig@baylibre.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[baylibre.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 405D86BC997

The driver uses several symbols and structs defined in that header. The
header is currently included transitively via

	"vip.h" ->
	<media/v4l2-ctrls.h> ->
	<media/media-request.h> ->
	<media/media-device.h> ->
	<linux/platform_device.h>

which seems to be on the lower end of the scale between random and
reliable.

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

base-commit: ef0c9f75a19532d7675384708fc8621e10850104
prerequisite-patch-id: 9fe9c8859b763130453036a4748307de6005c1ba
-- 
2.47.3


