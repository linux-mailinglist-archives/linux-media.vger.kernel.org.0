Return-Path: <linux-media+bounces-67064-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id EEi9MTOTTmrgPgIAu9opvQ
	(envelope-from <linux-media+bounces-67064-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 08 Jul 2026 20:13:07 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id A76907296F7
	for <lists+linux-media@lfdr.de>; Wed, 08 Jul 2026 20:13:07 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=Mq0EXNbU;
	dmarc=pass (policy=none) header.from=gmail.com;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-67064-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-media+bounces-67064-lists+linux-media=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 07CA8301E022
	for <lists+linux-media@lfdr.de>; Wed,  8 Jul 2026 18:13:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0F7A137C908;
	Wed,  8 Jul 2026 18:13:03 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6F663BFE34
	for <linux-media@vger.kernel.org>; Wed,  8 Jul 2026 18:12:57 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783534381; cv=none; b=j1HfFhER2PvfjghndQVgLMJIFvQwkjOy0Q98ljTh9qeHto3WOH8GCg7XhDaDhjR77g88/IjzDt6RoR3j9CJKUpZMhSyAQMOhvK5lk2cHjDybeDaEIPq1OV/gGLbVLNaZEWhclBfI5SsQ3kMoMR9AL2/7NKMjq4xwH00iU3VM6ec=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783534381; c=relaxed/simple;
	bh=y1Zkb/qQ7tH76c5nw0yWw9pfRRFL5z9KF7XJjkvkH3c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BDOM1wrrO5kNN5bmipC0NkOcUaFLG6c55m1qQ4viEOmjisrd6gMLaEANLubV6wztNTVSM9VZSb0F+HLeiD/0CQWfsq38Ymb5Cimc4ia5Oy0lNinuGKS5GFKoIVHG/5DGiHnrVgwDONYSJGlKS/6nHj0yGs/kCbN6hF8EsFQEe6A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Mq0EXNbU; arc=none smtp.client-ip=209.85.215.177
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-c9aea40d799so435957a12.0
        for <linux-media@vger.kernel.org>; Wed, 08 Jul 2026 11:12:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783534376; x=1784139176; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=E7M+3gHwLkUuZk+ZzB1+zc6TOfv5YYqtskQPl4nbwro=;
        b=Mq0EXNbUIosTjJuWW4QPPcinw+8f1KwIFogYqknNG1BHNHRcHc4AI0cM74ZNGnVw0X
         /sJT2yWSOK6vpAeZqYf1sVtckf8nKm7FYE+0P/mE3uplWFMRB5QmZT4jBujOp/h8t65L
         ssR+6QUak/UhAm4sfKaRmjhcO1NlQTbx+isi7E9otGXGdrQKnNFMeANe4+e07K4rsXHG
         3lVOvz3ovx6Quy6TIsSBOKMG0XevjQ8sHSlQ8ol6GOlx+xe0a3BoPx1naTg0mWRTbCHc
         nzD80MmUvSbnsIIgfSYX35Z4XwIe190dDpLmOTdY0rCz1g6tyNwGpL2JmJOJr4XLKtbZ
         yVbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783534376; x=1784139176;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=E7M+3gHwLkUuZk+ZzB1+zc6TOfv5YYqtskQPl4nbwro=;
        b=mMVDfHaLDnsUr/Mxw+O+/w0UihE9fmQXaAtRHdILumRCh04AlfOvGkhvJem7IGpZyI
         8RNnQfE4tXivTYHAYjHdlk3fVz5K7b+po1DUJppsMtGsi09xG2SN+DTTZATFNhn7+Y9c
         mfl2bqYGao0MhB2OlWTcNLTTsB1oyWsq5n7NDcjeFrb18BzrHXmYs+tlQ4G8kSKRrfqB
         xBPTFjVISShxvxFwsEeZcPs5GwrnNxc+PGswiSYe945wRFTfwOeQrJKy1PmRSFgU3L1t
         frC6Nc06pzgAOmclADxt8YR8OesBpVwiz7ARlykfC4jYlaKbJJWjSKKFo3GvGA3iV7Al
         CdCA==
X-Forwarded-Encrypted: i=1; AHgh+RpszFKoaNu4hP2/oWlLHrQoVjmat0laMGhjOm97Ot0YwRlkARjU5hnpLca6e9/KgxqP9yL8xE8bJcUCVg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwyOshH7ZouOpOnKnBLr9rm3uZxxJDtOMofsTnu1qP5UTcuHa09
	JnjWmqi2cktTYyZtFPJPil1kxZFrF6KjFJ8zuGjmpmEpULCc2sslJ30ffDa04IEe
X-Gm-Gg: AfdE7ckuBC6H93mwXMZIJ+fVeo0mJ2qbNQhEMmgTq6NVniFo/OVB+2kmt53e4W6poIr
	w0pZ/H6m8rrK6sx2E7n90CT9/dyfYko0D+7Mx3xca7TNdnfDNEMEfVEDpKqlX6aOQcpVXp2A5P7
	nIrfjpk0B/5UiM0P0nEfsGqOrQdNDGpVfm8bjDs3obtNaA4KFZE8WT5kbweUylzkfnILqAc5NLU
	hWqk94FO4WxkSWT3Uo+Pn53w2kq934fMq/vPkCTbKA8nmJWAypUKQ9LulGkjDJysr4ZbTY7v1hO
	RGwfcpCicJj90WZ9MWuJn4veMCR53ZcWXgmMamwvN/LaSJUYpuD1K1B7BxqKQSwGtWyhsD7HS4E
	7A8UhwQpL5iFxBaJbsNMmin1aw5EnK6lwYTShtU5jZFiHTWNG+jUrVRneiLWQYBY0GurHBAuxoI
	12Pe/trG5x2ZBPjIlxJl/i2zCCi1IuCGkoaOWCq6w2XX9jt12QDXHb5w==
X-Received: by 2002:a05:6a21:7d02:b0:3c0:9c1a:894e with SMTP id adf61e73a8af0-3c0bd312f81mr3943968637.70.1783534376489;
        Wed, 08 Jul 2026 11:12:56 -0700 (PDT)
Received: from localhost.localdomain ([49.207.223.101])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13b659c8572sm22368639c88.9.2026.07.08.11.12.52
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 08 Jul 2026 11:12:56 -0700 (PDT)
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
Subject: [PATCH v4] media: i2c: ov02a10: fix endpoint parsing use-after-free
Date: Wed,  8 Jul 2026 23:42:48 +0530
Message-ID: <20260708181248.57758-2-birenpandya@gmail.com>
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
	TAGGED_FROM(0.00)[bounces-67064-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:sakari.ailus@linux.intel.com,m:mchehab@kernel.org,m:andriy.shevchenko@linux.intel.com,m:dongchun.zhu@mediatek.com,m:linux-media@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:birenpandya@gmail.com,m:stable@vger.kernel.org,m:vladimir.zapolskiy@linaro.org,s:lists@lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: A76907296F7

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


