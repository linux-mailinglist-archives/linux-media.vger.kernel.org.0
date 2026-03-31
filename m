Return-Path: <linux-media+bounces-57818-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4BLyEOU5zGn7RQYAu9opvQ
	(envelope-from <linux-media+bounces-57818-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 31 Mar 2026 23:17:25 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 01849371833
	for <lists+linux-media@lfdr.de>; Tue, 31 Mar 2026 23:17:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 066B730781B4
	for <lists+linux-media@lfdr.de>; Tue, 31 Mar 2026 21:17:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E4976451076;
	Tue, 31 Mar 2026 21:17:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="tE7z0xA2"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E112D4508FB
	for <linux-media@vger.kernel.org>; Tue, 31 Mar 2026 21:17:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774991830; cv=none; b=I5dj/YsZlhqELuCxZEkID4rqRCC7bVttHMiukVC+HT6geBkB6H7VHlmJMMpLv3+s4fpxburCwbuyt02GPyflUFZsLY/u7hbt4+GC+j8ZkcmxVPaZAJv/gaRsGlvqwAUsAsSBPx7l76WSBFKxuo0gzXRCIIbVqqKQPfRQEJHl0z8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774991830; c=relaxed/simple;
	bh=HEOh/2zfJtpsxctQhzZwUU9VXOdfk2AHOVDm77USX6E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fOkh6T3+Y/334AizRGTQ/KFkOB+xw5HMlVhpk6roQzBtOqtogdxyPOzQUrQHlBkygBp7tPycS6aSF2tsXU+Z7wBTvprkk8DJ+lH/ZN7kE4aYrpdBwERpTsLxh5/DqkvlaUllXHTsyXlmEOo/dZxroeBiyLvev/V4UkprUpL+Mfw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=tE7z0xA2; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-486b96760easo68422405e9.2
        for <linux-media@vger.kernel.org>; Tue, 31 Mar 2026 14:17:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774991827; x=1775596627; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0p+vcDzh9k//T8x4e9/jUT1tl1SO1LruCVo6s74BwBI=;
        b=tE7z0xA2tu9hGoz9ZgkGKoDzIu8W3cCgVxQzjw/pP6YRrkWSXOsi6hJhiNd9cjZeRR
         ETjXlAsYaulAd//qsqRAUhhGk1cdK8kzx6VBVVbs5OxRxLCx+sOXPjneGu0b7fwrEgs0
         OcdKW91u+PvS9gxSbxSWbBDXhcv6vsP3mX43Ha7DuZLg9IJw/BnK/+KejnooeNb67iyY
         bPRP0MbbuaDEWXYIXZaQYEx5vS8pY1P7iO2vH36O/XnePo4h4JqixLz6mVQANNjUuL/E
         J0z/qdBqvHoVjFENBt2unpvRg96yv2IAiaqNzpal0QO2sQ8P478bKj56egeUPx3tRO85
         GDBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774991827; x=1775596627;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=0p+vcDzh9k//T8x4e9/jUT1tl1SO1LruCVo6s74BwBI=;
        b=bsq14o0LF7nEsjGxOammlBKb+4ksG6GHYftqAnzWfan7GyrskAShNShwIQbhENX+aU
         jszh/V5kr053pdbsgG/mUmdQaPnO7R5tKyoVz5qRrLuH+XlqOrEqoALUUbVva4cAIRpd
         WF5RadwFpBmoeqCoFRf9jvw6DzGk8S0GTKtgXe8YuYM6/uj/zB2VJVUx2kykvl2FKXap
         ASm8lByqiqBs7ORr5aNp93/y4wYKmrV6m/B52r+nvTDN4ZTUkQladiyC5xYr8oc3CDQr
         WbETDI35buFadH+meX3Sc9UE7VdzAAH4J7C0bUH+h95v+Jfax9hDZ1zEcYQK9XLbS7Yh
         qUkA==
X-Forwarded-Encrypted: i=1; AJvYcCVLH2HjP2/DjAbH8x8aPu7OUOT/At7eVgys9jXuMLNMflLoH9c5c0AVZwwMy9cMkDG93Fr7/1e/H4v+4A==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz6sfGVFIS5ACNeDBvyvC+jEcR98zAc5ADXfjoJWnG16tor/1dL
	k1U+OR3l8yNPROz4hir6IJC8MI2Us7oGOMrFsAsJny+HHXb2LI+Ri5V3
X-Gm-Gg: ATEYQzzBaudX4CFgdJk0ox8YeGwMauZKT0AvXqAGaqX+xCq3fVK4A+3LzomrN+IRdJg
	hITMmZKy1JzOEs5ZsfCcUh6v2iLoR7AqStWuihqUVh63J+7Y9857xbs1gM9akArWQUicmQS8u8R
	Zjc0SZKgrlVmuw/yvFd9uqcYSzgdFx2ImrTpPvMngb0281pTK3BO/mLO2w4zXg+rEXhoJo3a9Kj
	eNY2da9K+UAq5vlwgu6wNHz09R9OcOaKVp5A67KB1Px7tYg6ld+qCGxUaucCH70LEziuqsr16ys
	HmgdISG1nu86QmtRf20ykQ+tSrU8N8n0MfRUzU0EKpJq30SWmXOrgWr6ef8cwwxGW/kuCjKowNw
	/MgBnA8aNKPJ+Cyr+GLWXAJgv1dpF0+iFbttOHHKzqUlPIIDGrO5fYf9fcoezxF9NuNfDouTa6t
	008VdJMrzD+mHFQYyLeYx07pgJER6mHk5oU/GaHbxVO7+qlcbJ5aZje3FZ
X-Received: by 2002:a05:600c:828f:b0:477:6d96:b3e5 with SMTP id 5b1f17b1804b1-48883562a22mr16825715e9.7.1774991827075;
        Tue, 31 Mar 2026 14:17:07 -0700 (PDT)
Received: from localhost.localdomain ([2a00:f41:186c:aad2:ccc1:5aff:fe8f:d494])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4887e81a2cesm66051735e9.8.2026.03.31.14.17.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Mar 2026 14:17:06 -0700 (PDT)
From: "Jose A. Perez de Azpillaga" <azpijr@gmail.com>
To: linux-staging@lists.linux.dev
Cc: Andy Shevchenko <andy@kernel.org>,
	Hans de Goede <hansg@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	Alan Cox <alan@linux.intel.com>
Subject: [PATCH v2 1/2] staging: media: atomisp: gate ref and tnr frame config behind ISP enable flags
Date: Tue, 31 Mar 2026 23:16:11 +0200
Message-ID: <20260331211649.421777-2-azpijr@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260331211649.421777-1-azpijr@gmail.com>
References: <20260331211649.421777-1-azpijr@gmail.com>
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
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-57818-lists,linux-media=lfdr.de];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[azpijr@gmail.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[gmail.com:+];
	TAGGED_RCPT(0.00)[linux-media];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 01849371833
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The FIXME comment noted that delay_frames can be NULL for certain
pipeline configurations, without knowing why. The reason is that when a
binary does not enable ref_frame, delay frame allocation is
intentionally skipped to save memory, leaving the pointers NULL by
design.

The ISP feature flags in binary->info->sp.enable accurately reflect
which features are active for a given binary. Using enable.ref_frame and
enable.tnr as the predicate for their respective configuration steps
ensures the configuration path stays in sync with what was actually
built into the pipeline.

Fixes: a49d25364dfb ("staging/atomisp: Add support for the Intel IPU v2")
Signed-off-by: Jose A. Perez de Azpillaga <azpijr@gmail.com>
---
 drivers/staging/media/atomisp/pci/sh_css_sp.c | 38 +++++++++----------
 1 file changed, 19 insertions(+), 19 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/sh_css_sp.c b/drivers/staging/media/atomisp/pci/sh_css_sp.c
index 6da151e7a873..abdffff41ae2 100644
--- a/drivers/staging/media/atomisp/pci/sh_css_sp.c
+++ b/drivers/staging/media/atomisp/pci/sh_css_sp.c
@@ -775,9 +775,13 @@ static int configure_isp_from_args(const struct sh_css_sp_pipeline *pipeline,
 	ret = ia_css_fpn_configure(binary,  &binary->in_frame_info);
 	if (ret)
 		return ret;
-	ret = ia_css_crop_configure(binary, ia_css_frame_get_info(args->delay_frames[0]));
-	if (ret)
-		return ret;
+
+	if (binary->info->sp.enable.ref_frame) {
+		ret = ia_css_crop_configure(binary, ia_css_frame_get_info(args->delay_frames[0]));
+		if (ret)
+			return ret;
+	}
+
 	ret = ia_css_qplane_configure(pipeline, binary, &binary->in_frame_info);
 	if (ret)
 		return ret;
@@ -807,22 +811,18 @@ static int configure_isp_from_args(const struct sh_css_sp_pipeline *pipeline,
 	if (ret)
 		return ret;

-	/*
-	 * FIXME: args->delay_frames can be NULL here
-	 *
-	 * Somehow, the driver at the Intel Atom Yocto tree doesn't seem to
-	 * suffer from the same issue.
-	 *
-	 * Anyway, the function below should now handle a NULL delay_frames
-	 * without crashing, but the pipeline should likely be built without
-	 * adding it at the first place (or there are a hidden bug somewhere)
-	 */
-	ret = ia_css_ref_configure(binary, args->delay_frames, pipeline->dvs_frame_delay);
-	if (ret)
-		return ret;
-	ret = ia_css_tnr_configure(binary, args->tnr_frames);
-	if (ret)
-		return ret;
+	if (binary->info->sp.enable.ref_frame) {
+		ret = ia_css_ref_configure(binary, args->delay_frames, pipeline->dvs_frame_delay);
+		if (ret)
+			return ret;
+	}
+
+	if (binary->info->sp.enable.tnr) {
+		ret = ia_css_tnr_configure(binary, args->tnr_frames);
+		if (ret)
+			return ret;
+	}
+
 	return ia_css_bayer_io_config(binary, args);
 }

--
2.53.0


