Return-Path: <linux-media+bounces-62998-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4PEYAZr9GGoEpggAu9opvQ
	(envelope-from <linux-media+bounces-62998-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 29 May 2026 04:44:42 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 60AEE5FC759
	for <lists+linux-media@lfdr.de>; Fri, 29 May 2026 04:44:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 3351A3036711
	for <lists+linux-media@lfdr.de>; Fri, 29 May 2026 02:44:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 10310367B9B;
	Fri, 29 May 2026 02:44:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LpnB7SEt"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A5D3366DA3
	for <linux-media@vger.kernel.org>; Fri, 29 May 2026 02:44:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780022676; cv=none; b=SaofJU9FLDo+yEjOwizWC3eDr5ugifCN8eohdBJ3tPCCx7qqFPuBjA1i/sjE3n1OXkqzzXuflZa8ybhC3w5BBqoACHWbI4MNWOS11H8wIiUgJtwykWSyiZLkzxVLL8dKct/LEi/XeEQJDGWH+5iAKXQHCzNs5+Mxic+A5bJyk8Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780022676; c=relaxed/simple;
	bh=ERCUu0OTKyBW7d8BDg6b1CCWGXh2afeMFLXTgY0V+mg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=KmfJz4e6QjHcWzaTVtS7RyyO647vdQXv9mfrMBR5YpN/gfPUvddcHIu49EhbWXzHk3js6sgoQgSIePL5QLxuEIsHfJzjMBjpdql5XO1znk2SqS/IRXdGhThgknBeVkGRDuuUUa9it7pCq46OsMRdRGEk1OXff3HcQ/boc9G8WmI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LpnB7SEt; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-49048e043e5so56376685e9.1
        for <linux-media@vger.kernel.org>; Thu, 28 May 2026 19:44:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780022674; x=1780627474; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=PIeeAegIg2JykmlVBizWFPwVLHaIF4C+HMP59JRPEVg=;
        b=LpnB7SEtNAgAxeG+fxGILewB3ONlmgQGuMFJxyotYLDUmyjKyb8345cyLw2ktPTmpl
         wUQrFgwQD3FR/nMVjcuSm85RB7u39/AcO+WpOIs3cw5aCPL0Oq+QXb3ofctsR6613Qxa
         2btHsoJot3VqOPRVXdsSt3c/YRngAKMDjjOsPDcEErwOhnRxFxexkTK5KI8u6qbqK1Ux
         v2CjvB4GrVA1Rcepnv3Rbt5DwTK9lhkIxUTs79axnkBl91/FzxclijwxQl+J18VvXke0
         W7myMVcv7gVuqdq3Xs3hJtseWAfZmPh50VZEJ9AfR8ey22EbjN+1M1TA5Emat/k7BVw7
         A/Vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780022674; x=1780627474;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PIeeAegIg2JykmlVBizWFPwVLHaIF4C+HMP59JRPEVg=;
        b=VEGZvR73kPZgubJUuwnENf84c3CgHCjbKA3cnpKd3OYAXcDUcddaHYVbtcQyEvIOgq
         3VI8Plz/g4+k+FJ3Ppq+97bJI/X7ZHHJ281Z5c5hyoXUTl8AebRUsrLwxtDg0R0zmNvf
         ckfwjE4TTqz4+cy5dJzaKXLjzBFyyxI5txQQM/VgJH/GzqnkGblBs1iBNfU4zd6pENBS
         D43HcLtaRxvouDGRHVn/NPldIo1hG9nboG7DpQpk8VBlMTdcrcgwvxR/QCouiOzXGrh/
         a5x3fMBRi80aLj2bK9LAEP3WNccZQsBYHQM71T0DLGfZUMCPQ+/VefJflHWnrO9kHOWh
         1mww==
X-Forwarded-Encrypted: i=1; AFNElJ8dpMKyl4RBU7DoFej4XUyobptXF/7oQtaEAYeC8kLBqds6jx/v98HOiKeQaBHR4TX9CL2NRhNzUawVjQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyIaKeSzuPG/tosb+f5eIu9Z1sCkZv41zFB06uMtSzzhJtST2AE
	U38JlE+q/rqla0QHWJiqtnxzoiunQ6VWMtPExpk5li9Bts+Y/WGib1Rm
X-Gm-Gg: Acq92OHSHHzoNX9AviAnOjQy5m9hMtD/BON9mLSYEtkYp1bZs6SL8n0Hv20RUDkYYjc
	Kf+GJAAQOv56eOkilyg26ZzSY2RL73TkjTyEPTezXGLxw9q3p4KeeonNvweZ4yHSRf3dYejhc7a
	+IStvYvPjnrjO/VjAACVgXNCavm/AR9bHmh6vl+O16Wl/gAwzkYGVmJUIAUrTQUvreUSJZuDeaY
	J/VafDRxpjy07JdqBCkK28LYziXcvSGqqRlaBGJjPGl2l310xn1BcPszAhcqk2C6YUz4wajUieF
	nPnbFk7MXQMbPWViJA6zlK55uwgKYLU/1S++6Oqhxl3gON5DYcRSjrdSIg0pgcIdfNQpm+TZ47T
	jB4ipUG30OwzJIZ+F1ef43pLoZYDbl6aomadEtjlKauUVNwsL6ofsuft5IygRchhv5zMK8MKa3W
	czEkWq0tCHxNTtmBvJJWyHF7QVPqo2XW094rwbZO6VqzXmanT4prm8HcI3qj1DG4iase5hFKD01
	ZqEffoBB6okMCDmP1r7Kg==
X-Received: by 2002:a05:600c:e489:20b0:490:6869:46c6 with SMTP id 5b1f17b1804b1-4909c0c3aa4mr10788265e9.31.1780022673514;
        Thu, 28 May 2026 19:44:33 -0700 (PDT)
Received: from dohko.chello.ie (188-141-5-72.dynamic.upc.ie. [188.141.5.72])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45ef34a065esm178139f8f.5.2026.05.28.19.44.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 May 2026 19:44:32 -0700 (PDT)
From: David Carlier <devnexen@gmail.com>
To: Daniel Scally <dan.scally@ideasonboard.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	Nayden Kanchev <nayden.kanchev@arm.com>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	David Carlier <devnexen@gmail.com>
Subject: [PATCH] media: mali-c55: fix integer overflow in scaler factor calculation
Date: Fri, 29 May 2026 03:44:29 +0100
Message-ID: <20260529024429.6942-1-devnexen@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[kernel.org,arm.com,vger.kernel.org,gmail.com];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-62998-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[devnexen@gmail.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,cisco];
	RCPT_COUNT_SEVEN(0.00)[9];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Queue-Id: 60AEE5FC759
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The scaling factors are computed by multiplying the crop dimension by
the Q4.20 unit (1 << 20) and dividing by the output dimension. The
results are stored in u64, but both operands are 32-bit, so the product
is evaluated in 32-bit arithmetic and only widened afterwards.

Crop dimensions may be up to 8192. Once a dimension reaches 4096 the
product overflows 32 bits and wraps (zero at exactly 4096), programming
a corrupted scaling increment and corrupting the downscaled output.

Define the fixed-point unit as unsigned long long so the multiplication
is done in 64-bit arithmetic.

Fixes: d5f281f3dd29 ("media: mali-c55: Add Mali-C55 ISP driver")
Cc: stable@vger.kernel.org
Signed-off-by: David Carlier <devnexen@gmail.com>
---
 drivers/media/platform/arm/mali-c55/mali-c55-resizer.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/platform/arm/mali-c55/mali-c55-resizer.c b/drivers/media/platform/arm/mali-c55/mali-c55-resizer.c
index c4f46651dcee..182a1b19def4 100644
--- a/drivers/media/platform/arm/mali-c55/mali-c55-resizer.c
+++ b/drivers/media/platform/arm/mali-c55/mali-c55-resizer.c
@@ -15,7 +15,7 @@
 #include "mali-c55-registers.h"
 
 /* Scaling factor in Q4.20 format. */
-#define MALI_C55_RSZ_SCALER_FACTOR	(1U << 20)
+#define MALI_C55_RSZ_SCALER_FACTOR	(1ULL << 20)
 
 #define MALI_C55_RSZ_COEFS_BANKS	8
 #define MALI_C55_RSZ_COEFS_ENTRIES	64
-- 
2.53.0


