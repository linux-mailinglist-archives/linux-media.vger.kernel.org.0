Return-Path: <linux-media+bounces-67041-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id V9grMPhuTmqRMgIAu9opvQ
	(envelope-from <linux-media+bounces-67041-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 08 Jul 2026 17:38:32 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B8BA7281F4
	for <lists+linux-media@lfdr.de>; Wed, 08 Jul 2026 17:38:32 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=LKRw+KqK;
	dmarc=pass (policy=none) header.from=gmail.com;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-67041-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-media+bounces-67041-lists+linux-media=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 0D42B3014365
	for <lists+linux-media@lfdr.de>; Wed,  8 Jul 2026 15:38:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3B7E43F12F1;
	Wed,  8 Jul 2026 15:38:27 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BA5333E35B
	for <linux-media@vger.kernel.org>; Wed,  8 Jul 2026 15:38:25 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783525106; cv=none; b=KBQsa8Le7hixd16CO4BcRKhV7AZZ1XjbIRwUA52UrJIRx7l1D6/I43Bq7Cxjl9GnA8KnZUQdi5PUmr0rasLLDaP0NvMIpPuSeRWmL++3g8W7yRava+5m9BS7cPL9ht17cWeoH6oVVLt0mu/StDHXFzzhG6BHIPqaupd3K9gH0NE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783525106; c=relaxed/simple;
	bh=y1Zkb/qQ7tH76c5nw0yWw9pfRRFL5z9KF7XJjkvkH3c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kVw+oBIlmgLAurlAFomBianrQWt48mXy+h06ON60JgPecOSfpduv8OATPBTR7yLK3WWDEzawjr9kbjM/MqvamfZ+BmwT4der9OPLg0JtrTrRbCUi3yUK5nMZnSGBfNbe7rdzz7fGK4GBefkjiYnpfWJBaYmwYui9AxX6BTwkDm8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LKRw+KqK; arc=none smtp.client-ip=209.85.214.174
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2caea3f742bso14331465ad.0
        for <linux-media@vger.kernel.org>; Wed, 08 Jul 2026 08:38:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783525105; x=1784129905; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=E7M+3gHwLkUuZk+ZzB1+zc6TOfv5YYqtskQPl4nbwro=;
        b=LKRw+KqKrPUGMl3c149vOZRWpZbsXbk4Ycm4mUuHMgaiBk8qaoFjnbbj3eqR6TELcU
         iIJ3yWUSvw0TOofMr90DyGK8Sso30iLH4raoksC6+VgPjsb6QYDTXTfRVa+zYGgGxw7E
         BHV+Z83vvly+BOLX/Xq+fOpONF429m0X6zgRzFGgKqM4AuRJd2nUTiutiUwdy+ULSJIj
         PAA52xbIVk4CA5O9B5RHK4gO8LhIyt3aM2u4IwsiM5JdT2NsFyvDhEFzDAEAZr6rd595
         rd4QcC+7xguCaHseLu5AwcD75qN4/SWIUk0iOV+Q1qAdsOhmMJMQ4h66A0sg/kKJxzzL
         N2eA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783525105; x=1784129905;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=E7M+3gHwLkUuZk+ZzB1+zc6TOfv5YYqtskQPl4nbwro=;
        b=Pcz3rSWvoBtXvSIlMXODEuzXAkrdfAUSrozbwCRvzwVHP4L6tQ2fUcKDREhRoHoSTt
         YldRSzyceuX99zNQidjT9rXxaBLZvN61CXXeSo6S0jxBV2I8R2k0QZ3AnXt9uK8PM2Ou
         RZ0Rn30tbtO42Yso6jroTnddV1NrsYhS/McM9AAVx/fuTy8FETwnZ/Kx77a9C9s13A3t
         Lbo4ao5QXJQS+Ads+xxD25CS/9uJAksZ/ZaQGjAI1Kv0cUTDUOgSPHcM3VLTJCYYWd5D
         ya7Ct/IlyqvSjgbUlpJl7V4AUkbsT5IOL7WR6aK4Ali/gIji0Sdrjr1bZBAlKHoPdN8h
         jFUg==
X-Forwarded-Encrypted: i=1; AHgh+RrKpzUahYVWqbJKO77Y4px7lzcGuPBaVMEnESrkn7JGAfIRvTJGoTQqutbn0QySh7YJcUSjkOrBK42sXA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzx5pSHfQEhVBJaemLP6s9CmQjAzUjLg4MBQAVdu99DHm8bjbfO
	7Dd73sA3Zpi1uF/hovyp3MkYCmow+5flhWj7P89A5yIe8PY1uGaKb1ed
X-Gm-Gg: AfdE7ck5Si6oRR8TXc8tUjtSDqEjuu/sJgh1fnqml2YSbnEHxCDHTaseng+uDHQ7EjI
	Mfuu60YRoAr2IsM7e51lNhVUKchdkuD7j34CVFmoZ7FxP+B4R6vEdyG0TwKvmGuE87VpjRl+XiH
	yb2lHMDNsrBugbVlltFFJTbO6ESN7H5pR+ydgxlkIQWZSCeWVKjzRR3lj/OFOz2RXQuOUJ1kLDo
	P1JTx+lQ0k/OMxWK7Oz+v5xbo9gxxJSspFgE35CmLFiIVodB6r0St0HGF27YIM1oa4geY1EDS5V
	Y0mXHkhJvcwSJU2qjYx60H8wVqtinvTf0xFR9aLbMB4WfiAW+lYDf5KcmQwYrWK/PDZCsdp1pni
	yShERZ5mPsWfjXJak6dF1rtvdjVmtLHDOaovRXO6hTo480fy6ySe4UFN7XGO7MCpFTHCdH7c0Fz
	jVFu7Zy0UUuHgWUwp+SocuFwsnKG6mSxIf6fbbKDIwibQ=
X-Received: by 2002:a05:6a20:c998:b0:3bf:bdb9:f602 with SMTP id adf61e73a8af0-3c0bcc6a270mr3505171637.22.1783525104357;
        Wed, 08 Jul 2026 08:38:24 -0700 (PDT)
Received: from localhost.localdomain ([49.207.223.101])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31174a583bcsm24462238eec.19.2026.07.08.08.38.20
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 08 Jul 2026 08:38:23 -0700 (PDT)
From: Biren Pandya <birenpandya@gmail.com>
To: sakari.ailus@linux.intel.com,
	mchehab@kernel.org,
	dongchun.zhu@mediatek.com,
	andriy.shevchenko@linux.intel.com,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Biren Pandya <birenpandya@gmail.com>,
	stable@vger.kernel.org,
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Subject: [PATCH v4] media: i2c: ov02a10: fix endpoint parsing use-after-free
Date: Wed,  8 Jul 2026 21:08:15 +0530
Message-ID: <20260708153815.50692-2-birenpandya@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260613083235.57363-1-birenpandya@gmail.com>
References: <20260613083235.57363-1-birenpandya@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[lists@lfdr.de];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,vger.kernel.org,linaro.org];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-67041-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:sakari.ailus@linux.intel.com,m:mchehab@kernel.org,m:dongchun.zhu@mediatek.com,m:andriy.shevchenko@linux.intel.com,m:linux-media@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:birenpandya@gmail.com,m:stable@vger.kernel.org,m:vladimir.zapolskiy@linaro.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[birenpandya@gmail.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	FREEMAIL_FROM(0.00)[gmail.com];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[birenpandya@gmail.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:email,vger.kernel.org:from_smtp,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 5B8BA7281F4

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
Changes in v4:
- Collapsed fwnode_property_read_u32() into a single line per Vladimir's review.

Changes in v3:
- Moved property reads before parse to avoid UAF.
- Fixed error leak by dropping assignment to ret.
- Added Fixes/Cc stable.
- Picked up Reviewed-by.
---
 drivers/media/i2c/ov02a10.c | 11 ++++-------
 1 file changed, 4 insertions(+), 7 deletions(-)

diff --git a/drivers/media/i2c/ov02a10.c b/drivers/media/i2c/ov02a10.c
index 143dcfe104456..98f8fc5b6a5ae 100644
--- a/drivers/media/i2c/ov02a10.c
+++ b/drivers/media/i2c/ov02a10.c
@@ -820,18 +820,15 @@ static int ov02a10_check_hwcfg(struct device *dev, struct ov02a10 *ov02a10)
 	if (!ep)
 		return -ENXIO;
 
+	/* Optional indication of MIPI clock voltage unit */
+	if (!fwnode_property_read_u32(ep, "ovti,mipi-clock-voltage", &clk_volt))
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


