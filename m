Return-Path: <linux-media+bounces-66995-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Sy+wKxJVTmppKwIAu9opvQ
	(envelope-from <linux-media+bounces-66995-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 08 Jul 2026 15:48:02 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C0912726F1C
	for <lists+linux-media@lfdr.de>; Wed, 08 Jul 2026 15:48:01 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=osLdB7ul;
	dmarc=pass (policy=none) header.from=gmail.com;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-66995-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-66995-lists+linux-media=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id E0D30301AC88
	for <lists+linux-media@lfdr.de>; Wed,  8 Jul 2026 13:44:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 02BDD3803D0;
	Wed,  8 Jul 2026 13:44:41 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33C8537701A
	for <linux-media@vger.kernel.org>; Wed,  8 Jul 2026 13:44:39 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783518280; cv=none; b=a6NBH8MtcugJmPMmYX8yzHwecWzju7GjK19gnXaa9ouGodFq686w612jzPERt9L11sR7qhvJjxFF9izjJibJmSWWD0MFPtJjkAo+/nTjlIAFj+4/VjPfS/INgMYSSeoaP32We/sDnvqrhDwcVa5el3O+rufMeZjW/Yq2jeLLGyk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783518280; c=relaxed/simple;
	bh=/6Y5BzB+EVp5vKZkO9J82JZh78BmOLVDTi8bf+Sx4O4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=i8+Kzp0k7usrb56M6JxQ3dChmKohpeemH2C2u46kqYlTAer3+RF2uYOlDfpQBgM64znjEGlTpHDPPspT4Q/6Boq5hJeN+rtMcdFK4MpmPeiGt3hsIGlOqOuMrrMG0wDgPTrSomHc5QUfcTY44e5MvC6mQyHDRrBpW6WzbVeH/GU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=osLdB7ul; arc=none smtp.client-ip=209.85.216.46
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-383adaa461fso500401a91.3
        for <linux-media@vger.kernel.org>; Wed, 08 Jul 2026 06:44:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783518278; x=1784123078; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=srig+IvhMKute5mu4bsH0Xyo4Nt0NXF37ssG3w80uYE=;
        b=osLdB7ulSOYNLbyi4HhN758jJPYXYf1pvbIKZOFKtOJjOabBWIUBTW8dSxR2L2Fr6f
         KuFDPuaidVKuEcy5x0JKJdfplWSWed43XFAjA3DevzL1rWxV2vZCNe5MqnY0klUkqfY7
         idDzqTehO50UXytT/8gEHYT8KjPZkl+9SnXHim+/fsRgzngSkm7J0gWAIeI1b4RqZl7s
         wTUaW4SwWfqCm52b/GN/xCcKVgD5G5FIe46nP+vADODujT0T327UaImdnjXJZi1RrzMn
         zlPFFbD+MaG51vCG5fAioLePWAoGBxO58YHa7FE17xAy4zIsM2aV57CUyOULRigTH25m
         mNVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783518278; x=1784123078;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=srig+IvhMKute5mu4bsH0Xyo4Nt0NXF37ssG3w80uYE=;
        b=nUVaGTMFPMQ5wgozf3VNFptVOoq55hRAMxuoMG1CQSK28b3tpJGgT47XRnPaM6urgB
         NHEjdKPa+rSM7EhaqT9dg9S8SZJFr3tP/hDzfkugFCM+L6go9GY3TMaXkMXnJQjlYhrA
         C+gMdkjV+6IUmwZHl4+otoZhowCndDBNXIJz/L+QWE4gDcZsYViMgtxs7avzQb49cd9G
         Agb+qe/n+sHU0MWHipaonXrgpK626w3MQNmw0LZGbvdxLQJ/kzwSiE6Nwvrs43TYNboo
         SfSetK/MBwUbOcV9NBQ7UUEgKTHkspJyx1pVEr/e0LhgXHQedzCjg/Rz9Dnf/q2F+7Ok
         +fHQ==
X-Forwarded-Encrypted: i=1; AHgh+RrbQhJRJ1MowrDOxMmPhu3OVSGwnnjGzjUiz7Zlc4aIJpU8LdVL7z2m8YCfUab69m7GbWoxm/ggYliHGw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyf+MWFrxxjir5p2ZamrScpJDzgNdaPNrGevRF6CLrFDrcpZSDM
	QIOhtGeJ1Bd2chqH8IvbSp5lSmNknZJBAYEjOtaCH+caeOvJhL5jT94h
X-Gm-Gg: AfdE7cmvNV4XOBEr6JVpf1E+A6KHAEaCrUK6P9URHxzrYCbtTjWJi4MUYKz1baiuFuc
	RoZ5UQIAzUmYK4XkPHJryvu3KMmANO2obBsQ9218Ej2BFGBHUdchlStNyURXveffPU0iM/8nHi8
	UXQJ6ci57GzYEP6D4rQxiSxAmoUZeiL2AQOymqetbTzHbm2KXRFm1B1tgMk3kUsiPmwrWh+096C
	xm0aEsz6kiHFn9TO0JmvEegNhJpEWHbQ0ms1flaCQGRbcVJ03wsJKg8jPH96EBS6GBVunP8s8fv
	oO76Rl91O6SkLv8CYnwIWOkpGAat/oKIvJ0GCg8s3E6fd8QYO2z/Ai0ElMuSyVuV4rPrWRRTEOB
	7wtWrjHHAnHxo6OYpRbpY/8rR2yLvYz1d+rlxeER4VMOPJy54LVjFWIfcpttuONuY8qY/jbTs/9
	+bxZvqIM3tpmr03s7bq2k1YYiwMEed1Q0/24tWicyCLaE=
X-Received: by 2002:a05:6a21:a49:b0:3bf:9a30:3a12 with SMTP id adf61e73a8af0-3c0bd1d8b2fmr2976963637.50.1783518278453;
        Wed, 08 Jul 2026 06:44:38 -0700 (PDT)
Received: from localhost.localdomain ([49.207.223.101])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-311747f72a6sm23648662eec.1.2026.07.08.06.44.35
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 08 Jul 2026 06:44:38 -0700 (PDT)
From: Biren Pandya <birenpandya@gmail.com>
To: sakari.ailus@linux.intel.com,
	mani@kernel.org,
	mchehab@kernel.org,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Biren Pandya <birenpandya@gmail.com>
Subject: [PATCH v3 2/3] media: i2c: imx290: Drop manual fwnode_handle_put() via scope-based cleanup
Date: Wed,  8 Jul 2026 19:14:05 +0530
Message-ID: <20260708134403.45935-7-birenpandya@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260708134403.45935-5-birenpandya@gmail.com>
References: <20260615223055.39953-1-birenpandya@gmail.com>
 <20260708134403.45935-5-birenpandya@gmail.com>
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
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[gmail.com];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-66995-lists,linux-media=lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:sakari.ailus@linux.intel.com,m:mani@kernel.org,m:mchehab@kernel.org,m:linux-media@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:birenpandya@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER(0.00)[birenpandya@gmail.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[birenpandya@gmail.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: C0912726F1C

Utilize the __free(fwnode_handle) scoped guard macro from
<linux/cleanup.h> to automate the lifecycle management of the endpoint
fwnode in imx290_parse_dt().
This safely ties the release of the fwnode_handle to its compiler
scope, allowing us to drop the manual fwnode_handle_put() call and
removing the risk of missed puts if new early returns are added in
the future.

Signed-off-by: Biren Pandya <birenpandya@gmail.com>
Reviewed-by: Manivannan Sadhasivam <mani@kernel.org>
---
Changes in v3:
- Resend as a complete series to fix broken threading.
- Collected Reviewed-by tag.
 drivers/media/i2c/imx290.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/i2c/imx290.c b/drivers/media/i2c/imx290.c
index 21cbc81cb2edc..5c369c7ee21f7 100644
--- a/drivers/media/i2c/imx290.c
+++ b/drivers/media/i2c/imx290.c
@@ -8,6 +8,7 @@
  * Author: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
  */
 
+#include <linux/cleanup.h>
 #include <linux/clk.h>
 #include <linux/delay.h>
 #include <linux/gpio/consumer.h>
@@ -1514,7 +1515,7 @@ static int imx290_parse_dt(struct imx290 *imx290)
 	struct v4l2_fwnode_endpoint ep = {
 		.bus_type = V4L2_MBUS_CSI2_DPHY
 	};
-	struct fwnode_handle *endpoint;
+	struct fwnode_handle *endpoint __free(fwnode_handle) = NULL;
 	int ret;
 	s64 fq;
 
@@ -1527,7 +1528,6 @@ static int imx290_parse_dt(struct imx290 *imx290)
 	}
 
 	ret = v4l2_fwnode_endpoint_alloc_parse(endpoint, &ep);
-	fwnode_handle_put(endpoint);
 	if (ret == -ENXIO) {
 		dev_err(imx290->dev, "Unsupported bus type, should be CSI2\n");
 		goto done;
-- 
2.50.1 (Apple Git-155)


