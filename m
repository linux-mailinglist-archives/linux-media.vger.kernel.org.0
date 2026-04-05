Return-Path: <linux-media+bounces-58060-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aYLZI+Yr0mn5TwcAu9opvQ
	(envelope-from <linux-media+bounces-58060-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sun, 05 Apr 2026 11:31:18 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id DA7D439DFB0
	for <lists+linux-media@lfdr.de>; Sun, 05 Apr 2026 11:31:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id C97723009001
	for <lists+linux-media@lfdr.de>; Sun,  5 Apr 2026 09:31:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 666BE2FFDD6;
	Sun,  5 Apr 2026 09:31:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bTdFoDdk"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B502267AF2
	for <linux-media@vger.kernel.org>; Sun,  5 Apr 2026 09:31:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775381471; cv=none; b=M4WgY86WQfeHl9CwccBwwvIUi5hUETI59a9GXW93QXoy29dmSJkMz9OBeU6ZZwxW9TIvLzQgtGHqiqeHmcxXBocK5CJf6itqdBb1xMTttP0YLYQLXN4VD2g4wYGYWQgebkU/qf9JwXdTVlKiDEvmhsAtrJRQ6K25iQgoyC6fgC0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775381471; c=relaxed/simple;
	bh=wyq5W/u57ccvu5nuOwIucSKyF20x4rNLLNnxHJNFwaI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nGfqp5r++Dw4oy50Nu0wQUPyleHIAb2/RDi4xVLfyObfBNZMEqezGVgY2/Xyibd7us8rjqMBYy143l0s5h9bKqj9+VCpRZUW6GwWswKyqWEXG4gHkZJae4EafwhIMocmKVKvABbB7SYnDHo3Cq+7SaigZglDqKLnyIRIB6Q1w8g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bTdFoDdk; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4852a9c6309so27948195e9.0
        for <linux-media@vger.kernel.org>; Sun, 05 Apr 2026 02:31:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775381469; x=1775986269; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+HPdsHvT9b8ErzkI6+gScL5hWU8x38ZFsJYEpzY5RL0=;
        b=bTdFoDdkEI22Cm1/VU0majykNDeGkouRIYQSDzBRasWXt5fd9DScmuoS6To+gZ5p31
         mtG66aidA1VhgsFTdnkX9aZ5laJRkAloEjFWeoheOJNeUMvL7iqRgJ5vqvhDgQKq9q8t
         0sZ1EymHdKUU6rDhhPCyJagHqqRbepB/9oEP7a8otCGJe5MCbupNLgLndN6OPYsf1f2M
         J6fHhYwC4dbhZ16NCzEGIprh8O5g+JRFrDnsuLZl3WZ2HbSOa0ssdSH4V2GY6ZXb66hN
         ni0AsRp3QC7o7Bi+UpN2gIlVSUE+z2oWmAWznkmVWteQxCbd/Jeus2iqNIDQ45K8rsya
         LzcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775381469; x=1775986269;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=+HPdsHvT9b8ErzkI6+gScL5hWU8x38ZFsJYEpzY5RL0=;
        b=QbjQXVkHPjuhKU2HWTeiKoR4eU6H5PqhxXO/GjTTJwv+LQydhyIU2l+z+nx6WgmfCe
         w+vfohlJ33saQVf0FdibK2em8yQsEB4EQYNKeQM9BaivFQqY1lms7aq19dI0KsmivF3K
         zVYKG+LnNa+MBHEV6+lLA2l/GDDffTKFeAIpavfUHfqjGpoFmil5/UTO7W61Ogan3Jhq
         Bg2U0goSbkkEZWl+LC4kLE6Ra5DgFLZ2GriKJU4NcqralE7+wc8NEv4a+iFdYDT88qDr
         /dC1ngaS3sBw5K/ytybPilVjESAqf7hnuqFp/5VdxuuXw2JChDEYmd2N6jpTszQQF/PZ
         FFFQ==
X-Forwarded-Encrypted: i=1; AJvYcCULLASvIDNCJCdDKomXv6JEX14KZ5kW/Vz2ccw8UHis2F4bc61pOANnuZb4xLdYMj9VC0bU4wXMdRl/xQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwNHW9IzsIivsK002hRtt7IKbKCJo84Kub/3loqpprVwfh0MODc
	6m/R50g9DDIxG4qI5pn34kW4mbF6h4NrTYOkGf2CQwC1IS8kccNwb3OD
X-Gm-Gg: AeBDievgu02S1//vkLo7oUq89DUmrkUmfy4IunauKDthHrpzc5wHIZP3KMkJ+VheXf5
	Q3zwnqjAuwi0yibNalGB1qEdQstiINora7bKmnsc6YkMEciXEhppooerAGrp0JGTzk6sGZ+WtC6
	bKz5R49u035xYPytKMwLwKxsvsEZtjUXFvYWDYokEmJndy3OoV0Hs8EmY0Hyo9LIMZDaj/1Lqku
	bF4yM/7Hjw+PDMT4t9bw0lFz/bfrka9K0QEH9gzuuh39JV+od2kDgFODW83rWsXYNtrtMG6DaTI
	2B31I/qv2c0OauEVTfa4eJElGcq56aAH6ufbXdztRdQQaK7wVj1xu9ulB48hY4G8x+QMzbep4By
	EQO5ARyvPcNl7OlipDdiJ4If/LkpkM0Gxp+1JqphQE+VeiEKSEn8gBl/sL2Svjs5JproelYxc0B
	oN/5jnawwHecYilxGOulsWNSwNuSd7xSEzdoslBcWg/svpWA==
X-Received: by 2002:a05:600c:a4a:b0:488:904b:f31 with SMTP id 5b1f17b1804b1-488997a44e2mr135868585e9.22.1775381468491;
        Sun, 05 Apr 2026 02:31:08 -0700 (PDT)
Received: from localhost.localdomain ([2a00:f41:1c83:b0bd:2a0c:50ff:fe2f:36f4])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43d1e4e221bsm29156707f8f.29.2026.04.05.02.31.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Apr 2026 02:31:08 -0700 (PDT)
From: "Jose A. Perez de Azpillaga" <azpijr@gmail.com>
To: linux-staging@lists.linux.dev
Cc: Andy Shevchenko <andy@kernel.org>,
	Hans de Goede <hansg@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org
Subject: [PATCH v4 1/2] media: atomisp: gate ref and tnr frame config behind ISP enable flags
Date: Sun,  5 Apr 2026 11:30:43 +0200
Message-ID: <20260405093051.515222-2-azpijr@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260405093051.515222-1-azpijr@gmail.com>
References: <20260405093051.515222-1-azpijr@gmail.com>
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
	TAGGED_FROM(0.00)[bounces-58060-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_NEQ_ENVFROM(0.00)[azpijr@gmail.com,linux-media@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	RCPT_COUNT_SEVEN(0.00)[8];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[gmail.com:+];
	TAGGED_RCPT(0.00)[linux-media];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Queue-Id: DA7D439DFB0
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
built into the pipeline

Signed-off-by: Jose A. Perez de Azpillaga <azpijr@gmail.com>
Reviewed-by: Andy Shevchenko <andy@kernel.org>
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


