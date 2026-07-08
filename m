Return-Path: <linux-media+bounces-66988-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id IHZgE9xMTmq1KQIAu9opvQ
	(envelope-from <linux-media+bounces-66988-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 08 Jul 2026 15:13:00 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 99761726AC0
	for <lists+linux-media@lfdr.de>; Wed, 08 Jul 2026 15:12:59 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=gyRgVdR3;
	dmarc=pass (policy=none) header.from=gmail.com;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-66988-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-media+bounces-66988-lists+linux-media=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id AF4F530B8261
	for <lists+linux-media@lfdr.de>; Wed,  8 Jul 2026 13:05:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 06F722459C5;
	Wed,  8 Jul 2026 13:05:46 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0996A26ED2D
	for <linux-media@vger.kernel.org>; Wed,  8 Jul 2026 13:05:43 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783515945; cv=none; b=hJIlP8ITdDeAJl4cG7B80ZeEWyzB0nhGhs3PdJus7+2XNQZbfGgG+7YrIw177g+KzIc8ltxOTfgJfuggBq7gzPqWvpR67NDDMmtschb4TmYtno610fTt5tIr0azv2Fxz+4fZImZWyx/rX06AXIEuJkTuJF8L9sBEEIZVAJDxifc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783515945; c=relaxed/simple;
	bh=Myyijv87T89uidt4IlT3B+u6WDZawELqMmMmm2VS+Cw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=poYSvUGJV+VSBalAdlYyB6f+AEUujW95RgiJeOldWLemX1RVUH920796mCYSniDthzGKqDhylWg/B6jsq/y1jz8kcazelnTIQ7N1lEh/C5cedew+JEWpwfQoxXQW8tbbHm2vnCX1S6+5TovMcqH2hfNearaYStja+Lrojq/XeaI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gyRgVdR3; arc=none smtp.client-ip=209.85.214.180
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2ccf2360620so3464225ad.3
        for <linux-media@vger.kernel.org>; Wed, 08 Jul 2026 06:05:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783515943; x=1784120743; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oiV9BZ6JtLWxJM5aFV2ir0HHpN4TWqB4aWSQOFRnO6Q=;
        b=gyRgVdR3lzU4E4TSYPhCrjJxiHHgMW0R8wRU2jTSq7Q5EvyVN+8hFEEZX4T5a7xHTy
         9F2+P1eRa1NbYSpVoMvn1LH7nVHVNctdaHMWxiLt5wM2XZWh6i4UCei6+JuQ5cPkWaoE
         V9IBbb+1MFgmmbiMeM8ONYOceYrRaHjSzGtROcNr0QXxjC5ytrRnARjMp2gJaFqdehUT
         jnhyG1jeWyMpCuoQ5lTIdxD1qFJQBZ7cQh90tkzeyUAJ8lseZI5XhiPEFE/0qfa6a2tD
         vw5fJxnKLUSoryQTGIeF5auA0DeWoOB29+m+XzvzUUKCo/QXw0ye4M5rPTzk3NTEJSfL
         GUcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783515943; x=1784120743;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=oiV9BZ6JtLWxJM5aFV2ir0HHpN4TWqB4aWSQOFRnO6Q=;
        b=MhP5DkJcGrO1lNFKxJ+LXUNduKrsDyIKlgxRZOhNdlzGXfjKdyHaPkTPRK3o5cJ9bF
         xnIBa3K77kf/wrKl+LQER7iKQiB09Ujeccep6NIWYvL/HglNU865kNe1tWPWdVzHkN6L
         kqPpm2gFxg3KDGJHhfhpDyjSDFX4N/dLV9pLPuRL71sJg8qtX3nnC1lUZgYRbZUYi9AR
         Ke+vkpPtDAqNQ5YG0qpA7+uj4i9baCDK3UOH0EJxtfBbZA88fJl89fpzTzcoEptQlvCX
         2aLbUYCMy24u8LsHhd3FEO6m1vIPEkQ+lQdopjZt/fZ43B9xfnUBxHdfSwdz8hf7MfLx
         tUwQ==
X-Forwarded-Encrypted: i=1; AHgh+RqgpU9i+/rrboxSRwbCNwayp/ve4dmR72Yc18jvoP4z0gRLDz9DaivoppaO0fuIdxkzBJrCNI5jxyD6Rw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwgKLUODdUXABwAtpqzOFwbQIu24YlddlPRU1FmTOYCyGM/eGDb
	PUi5RkVkSexpQrCfQOMEOU8lcNuh8g+wMWOlD3+VQYguu/3Q0tRF01rjq6kOlAey
X-Gm-Gg: AfdE7cnehHLIfbOg3yU+EPsRZqrhz3rb6eNoVo2iAkwQxJg9vVFwq00CDeEqUJVo0zb
	r5cTDhpg831wYSEDvcyKIHCtyq/7zsjTkOxm8fBMbyJj56s2hhCY2jHCdxsjAFoRt+ziZSsj/C8
	msBfIrSwRLTl7geMWKXImRpRVpwRdndw8w6a3n+B4JPFQnxTfOH4qtysjYmmctumWkFZIGEV24+
	ybyW47OK2aab9Cm5SCVV6tQhKpNBNYZgY5RzQgiCiUpU2h9yQDyyWmx5hcMo5VqnFF4aVDrKgTP
	dFDT1BqCymXEWyN8ANDAzCTIlqZX+ZD9qd32CVPpdSKrRrQd15tEQH//I/ZT3myAxNpGfAqUg5j
	v2sTnSDUIUYmo93TKJMktxyur2VYxfFmiiyvHP1EuRvd07smMTK4h2Ir6vCdEhKiHUqThBLcKhl
	e6SF3bnPjqfAGw3HDXmUu0LOG9vszqUjLSlGNCUKxUpMg=
X-Received: by 2002:a05:6a20:a11d:b0:3bf:735d:7fb7 with SMTP id adf61e73a8af0-3c0bc8ab2bfmr3335231637.13.1783515943372;
        Wed, 08 Jul 2026 06:05:43 -0700 (PDT)
Received: from localhost.localdomain ([49.207.223.101])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31189cd8234sm9748365eec.9.2026.07.08.06.05.39
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 08 Jul 2026 06:05:42 -0700 (PDT)
From: Biren Pandya <birenpandya@gmail.com>
To: sakari.ailus@linux.intel.com,
	mchehab@kernel.org,
	andriy.shevchenko@linux.intel.com,
	dongchun.zhu@mediatek.com,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Biren Pandya <birenpandya@gmail.com>,
	stable@vger.kernel.org,
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Subject: [PATCH v3] media: i2c: ov02a10: fix endpoint parsing use-after-free
Date: Wed,  8 Jul 2026 18:35:33 +0530
Message-ID: <20260708130534.29329-2-birenpandya@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260613112920.64617-1-birenpandya@gmail.com>
References: <20260613112920.64617-1-birenpandya@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-66988-lists,linux-media=lfdr.de];
	FREEMAIL_CC(0.00)[gmail.com,vger.kernel.org,linaro.org];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER(0.00)[birenpandya@gmail.com,linux-media@vger.kernel.org];
	FORWARDED(0.00)[lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:sakari.ailus@linux.intel.com,m:mchehab@kernel.org,m:andriy.shevchenko@linux.intel.com,m:dongchun.zhu@mediatek.com,m:linux-media@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:birenpandya@gmail.com,m:stable@vger.kernel.org,m:vladimir.zapolskiy@linaro.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[birenpandya@gmail.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 99761726AC0

The ov02a10_check_hwcfg() function calls fwnode_handle_put(ep)
immediately after allocating and parsing the endpoint. However, it
subsequently calls fwnode_property_read_u32() using the same 'ep'
handle, leading to a potential use-after-free.

Additionally, reading the optional 'ovti,mipi-clock-voltage' property
used to overwrite the 'ret' variable. If the property was missing,
'ret' would become negative, and this failure code would be incorrectly
returned at the end of the function, causing probe to fail entirely.

Fix the use-after-free by moving fwnode_property_read_u32() before
the endpoint is parsed and freed. Avoid the error leak by not
assigning the result of fwnode_property_read_u32() to 'ret'.

Fixes: 91807efbe8ec ("media: i2c: add OV02A10 image sensor driver")
Cc: stable@vger.kernel.org
Signed-off-by: Biren Pandya <birenpandya@gmail.com>
Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
---
 v3: moved property reads before parse to avoid UAF; fixed error leak by dropping assignment to ret; added Fixes/Cc stable; picked up Reviewed-by.
---
 drivers/media/i2c/ov02a10.c | 12 +++++-------
 1 file changed, 5 insertions(+), 7 deletions(-)

diff --git a/drivers/media/i2c/ov02a10.c b/drivers/media/i2c/ov02a10.c
index 143dcfe104456..0150e4d296af6 100644
--- a/drivers/media/i2c/ov02a10.c
+++ b/drivers/media/i2c/ov02a10.c
@@ -820,18 +820,16 @@ static int ov02a10_check_hwcfg(struct device *dev, struct ov02a10 *ov02a10)
 	if (!ep)
 		return -ENXIO;
 
+	/* Optional indication of MIPI clock voltage unit */
+	if (!fwnode_property_read_u32(ep, "ovti,mipi-clock-voltage",
+				      &clk_volt))
+		ov02a10->mipi_clock_voltage = clk_volt;
+
 	ret = v4l2_fwnode_endpoint_alloc_parse(ep, &bus_cfg);
 	fwnode_handle_put(ep);
 	if (ret)
 		return ret;
 
-	/* Optional indication of MIPI clock voltage unit */
-	ret = fwnode_property_read_u32(ep, "ovti,mipi-clock-voltage",
-				       &clk_volt);
-
-	if (!ret)
-		ov02a10->mipi_clock_voltage = clk_volt;
-
 	for (i = 0; i < ARRAY_SIZE(link_freq_menu_items); i++) {
 		for (j = 0; j < bus_cfg.nr_of_link_frequencies; j++) {
 			if (link_freq_menu_items[i] ==
-- 
2.50.1 (Apple Git-155)


