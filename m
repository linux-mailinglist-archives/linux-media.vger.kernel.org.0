Return-Path: <linux-media+bounces-57151-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cFE7On86xWn/8AQAu9opvQ
	(envelope-from <linux-media+bounces-57151-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 26 Mar 2026 14:54:07 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 70400336551
	for <lists+linux-media@lfdr.de>; Thu, 26 Mar 2026 14:54:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 92C7E30238EB
	for <lists+linux-media@lfdr.de>; Thu, 26 Mar 2026 13:47:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4FF952F9D85;
	Thu, 26 Mar 2026 13:47:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MkZO5oSZ"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94AC22DF701
	for <linux-media@vger.kernel.org>; Thu, 26 Mar 2026 13:47:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774532836; cv=none; b=SPVAkT5ZRCblSFgiUz1Q9wbEnBatyPmJuUDMhQfHvC/6rtcoXXfq8Ros2XVH4L7QqJGoCXQ6P5d4rRIg6IxvgEnvUuL6ILX8k8RFCYqT/KGph8xu52Got35huozVCC90W0SYfeezK8jDESsifMnAU4XDCMJW8iXx4cDxjHMrMoY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774532836; c=relaxed/simple;
	bh=/EmpQJt4jirvoJcEvh/Ibbcbr/SLiT/fuNG91+Q+Fxw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VhAmV6sh0Z3MmKkg8zTX+JH2NFyP062gK0D6G+ZnE7oTrXqyfhcU/jJxHqnP2RpogcGh+9Ocitq1hqKVjhJuua/WE1Al5ZqzgCJ52tHWZW/s5P1SSfIHpnCn0mLgKTKUPuH6bFam+bN49eUgCaQXj/9cK1+AWfGqBUhcEFBofXU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MkZO5oSZ; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4852c9b4158so8337135e9.0
        for <linux-media@vger.kernel.org>; Thu, 26 Mar 2026 06:47:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774532833; x=1775137633; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gdDADL35od0i3VJpKdtDwsBvGTpeEZhGKE9GqA7aHKY=;
        b=MkZO5oSZsq7PlA8W8NvFKcl0NgQidShdv6Kne67HU1odVaSlg4rqsaA8vPWgsYLaYV
         NUqYBsWxN0sSISdg4K9rmmqfibQMe4Hd1eGxc+k4uk3OwK9dWREA/epeZG4B5rVd9SB9
         u3dceyTH09Upxy1yINYuxu/RV2x0fO6OI/4V/4IzB91hFQU3GzIxxq1BG3XNH/KgbeGt
         /WGzFIs6nEp4qe+w2ZW4ExqsAxOJJpnp5IFs21e49ZOeu/TxDeiD68qL1QI3kEWlzs24
         WrEVisCOPQ3i2LGEi0ERVcD2mxZ44/8TYpdWRYNZRvQ7tIKLaSsgMkYD6p/Jswnzaq0i
         8/fA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774532833; x=1775137633;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=gdDADL35od0i3VJpKdtDwsBvGTpeEZhGKE9GqA7aHKY=;
        b=cgdAPYGoweBBfaC37IsJXRmQIewOny1y0zAjBB1PnKP1gP51SmqRY0Pw+qtskgLj6X
         t5z+d0vOsepK4cWyS9ybtII/2Gsr812WBbk1+/0OfppPXrEZ24ns6bubJH4oH3MTlxc+
         rj6I1KduqDa4D+ReHk4ZySGFYDbDGJb2CjmEqQR5ymyq4m+yALPWOrhZlJdKhohsa+QV
         eFMUbKhVjs51fkIIEc7PlkRzW2IB1ZRBtYc7fLKxMeerP50D1JhaOJBkRoydvCgM0cS2
         ACMrlceZirYcRohm/y/DRMbMqTxrhXFbhLyrnWkZl0BrjnpAvGtyDuCUEo8mg+5AoxJp
         ewew==
X-Gm-Message-State: AOJu0YzeXjvwDdL+2aXHFiIXujv1+BOt1CG7pmQvMIjnNAXQjBHIfWWg
	ZTeJqnHe40iK/CNtZdXR4iiJSVa1XWuA+NFeXQ9GAp9lfkS3B/ALqylEE9rx5PFU
X-Gm-Gg: ATEYQzza7FHGepcQP7/y8rTDFhGtnz/3yqJdh9563AYV5RMFpPhut6PpxRmkWfI8izh
	zLiOYqEgDq65jtU0ICWJdgnDjpC61E+50mNynWWlM+eNtqnvu/XIclNZEihwthodoDTeK3VyPz9
	ftBvkEiX1pt7br34MsLeZJiSZ0MHSMRR+vpIrJA1ROuAEmOznkiEVa/WkrYcOIQYOq5VZ/Sig4V
	l7WoUmD0C4ODXhL+3x6VDB8J9eqhslvpuaFAN4e9/7EQMTYEFuC7ydx8uLafhgXZc5mHtt+IR9H
	rvrUk6zTrc1S2Aw16ZHbo/GhrC3bj3LITSq4EGJ0u4C7oNpz/UwbsSW/RmYFpe2MXPB9m2bVHYB
	gkoYQ8CLTAhkFrERCEGa4iiP6osazD+C1B7S7v27/7zuII7G+6S+KWvQ7IMYdwjKU6ljCDHzH61
	4cokdZccQNQJt8roaq+xzj8JvIia2E421kQvd5VcN2AE4k8M5W
X-Received: by 2002:a05:600c:8216:b0:483:709e:f238 with SMTP id 5b1f17b1804b1-4871609399cmr105530095e9.29.1774532833119;
        Thu, 26 Mar 2026 06:47:13 -0700 (PDT)
Received: from sarah-VirtualBox.Dlink ([46.31.102.73])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48722c95041sm29705765e9.6.2026.03.26.06.47.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Mar 2026 06:47:11 -0700 (PDT)
From: Sarah Gershuni <sarah556726@gmail.com>
To: linux-media@vger.kernel.org
Cc: hverkuil+cisco@kernel.org,
	Sarah Gershuni <sarah556726@gmail.com>
Subject: [PATCH v4l-utils v2 2/2] use bytesperline for expected buffer length calculation
Date: Thu, 26 Mar 2026 15:45:03 +0200
Message-ID: <20260326134503.10323-3-sarah556726@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260326134503.10323-1-sarah556726@gmail.com>
References: <20260326134503.10323-1-sarah556726@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-57151-lists,linux-media=lfdr.de];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCPT_COUNT_THREE(0.00)[3];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sarah556726@gmail.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-media,cisco];
	NEURAL_HAM(-0.00)[-1.000];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 70400336551
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The current implementation of get_expected_length_trace() assumes
that the stride is equal to the image width, which can lead to
incorrect buffer size calculations when padding is present.

Fix this by using the bytesperline value provided by the driver
instead of width when computing the expected buffer length.

Keep the existing format-specific logic for formats such as NV12
and YUV420 unchanged, but base the calculation on the actual stride.

This addresses the TODO comment regarding incorrect assumptions
about stride handling.

Signed-off-by: Sarah Gershuni <sarah556726@gmail.com>
---
 utils/v4l2-tracer/trace-helper.cpp | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/utils/v4l2-tracer/trace-helper.cpp b/utils/v4l2-tracer/trace-helper.cpp
index 6c296dbf..a56e2d02 100644
--- a/utils/v4l2-tracer/trace-helper.cpp
+++ b/utils/v4l2-tracer/trace-helper.cpp
@@ -233,12 +233,7 @@ void print_buffers_trace(void)
 
 unsigned get_expected_length_trace()
 {
-	/*
-	 * TODO: this assumes that the stride is equal to the real width and that the
-	 * padding follows the end of the chroma plane. It could be improved by
-	 * following the model in v4l2-ctl-streaming.cpp read_write_padded_frame()
-	 */
-	unsigned expected_length = ctx_trace.width * ctx_trace.height;
+	unsigned expected_length = ctx_trace.plane_bytesperline[0] * ctx_trace.height;
 	if (ctx_trace.pixelformat == V4L2_PIX_FMT_NV12 || ctx_trace.pixelformat == V4L2_PIX_FMT_YUV420) {
 		expected_length *= 3;
 		expected_length /= 2;
-- 
2.43.0


