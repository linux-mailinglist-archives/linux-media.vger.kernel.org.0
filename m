Return-Path: <linux-media+bounces-59004-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8F9tM/gc4mlX1wAAu9opvQ
	(envelope-from <linux-media+bounces-59004-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 17 Apr 2026 13:43:52 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C1D0C41AE27
	for <lists+linux-media@lfdr.de>; Fri, 17 Apr 2026 13:43:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 0BFB1302238C
	for <lists+linux-media@lfdr.de>; Fri, 17 Apr 2026 11:43:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E975E3988E4;
	Fri, 17 Apr 2026 11:42:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qVN4u5g+"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED5093947B6
	for <linux-media@vger.kernel.org>; Fri, 17 Apr 2026 11:42:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776426170; cv=none; b=H6ttNZf8llxDvq8LWxGgeQ6TaRX2KClLNZMw/Kkuw32pDEz9Ge4OwIZRM3uron8N4gLGCv19nNmXO4QTyDUi0aOC1EjcxZm6lB+c+q4+BxGwxfDQegg7bUXTYFODYapW8gQ7R8+BzhCFsfrE2ZvNRIUz7AOWJGjstgXF4sydMVs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776426170; c=relaxed/simple;
	bh=Pji0/ofzjtQ63oZLWNDkDfpZTnQz3RIaDahYeQ6edfE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=exa4kpH3nXX8LSYobRXMdINRtrhIS2JfMt/lDxYDwc7rrQMPttPO8wG30n709Fmd2r+/itrqE5nsJ1h0BTcP3gJGHxsj9SxwUJoVsQWp/2PzKe9U+SOzLgXmiasLH8ggBztox0am/b+1hAxBVdaVukCaTnRToCEpgLVKUgtofDQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qVN4u5g+; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-5a40d02b58bso515932e87.3
        for <linux-media@vger.kernel.org>; Fri, 17 Apr 2026 04:42:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776426167; x=1777030967; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bTztIzyLZUtX46/uC4DmLedmtQKgb/ItDKns9uW8WRo=;
        b=qVN4u5g+HrPiZXYg85xntUJPHeFQd7o11O0U71PmH9ce4MtuET8xY0Hovmqm+3ifsA
         uJ35nvO1sLB6BbR4G0N7JQWysH3JmNEmT+vF7ZHDMr0zX8DVVSlWY1FwniQkF1L9xTc9
         OjW/v8Jm8A5IVfW/H/6RHIdt4HN/Z9VKtwQkjMwFpCMJaFtR9jzjHEnva3h4yWcR5Vdp
         f4TXkV12SRr5+xcjBuaAz5eBbCGjHUFbDbmSalO2Sl2r5lSnsQgOLuQmw1dPsZ3Fryp0
         1Z+DLHbBzEbcS1EQH7TMsdA7PjbnxR0xzeGJX9TrRAOej6AQJVJ3yQyL2TofUz0k0lCm
         cSRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776426167; x=1777030967;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=bTztIzyLZUtX46/uC4DmLedmtQKgb/ItDKns9uW8WRo=;
        b=cCOCq6BcMpzFc+4LB93obuVLhE858YTLs5QKuOgd92HeUvLX8i+y+7TN/47X79MrpK
         DgWWvVvlR6Z22+nScCrx55rKkhpanE/a5EciZv5k++L+YW52Aohv23T0MrPs6P/7mo8l
         273+uVEa8aZc14aICZaKn2Z8ym8rdBt+Xc7Bfv8xOIShfC/mAktXSrofgXEBKL6fsap8
         NkkPtFNQdjHAmiDeLjFhQ/ZJIBIuVQFJ2LDdPD337Odnp8oVCudIM2vVP3gmO+0q3KhS
         mZk0bSRaONMEB+a/lLy5GhG7/OtPzj578Zeg5pu+iYdw8MbrO27A8sEHAAHG7v7l/Wfj
         G+rA==
X-Forwarded-Encrypted: i=1; AFNElJ9Z1zVzlHhbfAmZPR9VkqcroenTB52fpdEP6Yd2R//+Q44PxGJjmNfIFR2H5pQULKdj4lAQoL0WZdwHGw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwnUVwozXXGsvuWkDz/5vHT5LpNIj/yD9pfLZqAIQoVo5g7yRs0
	ToPKej9mD6dGzmKZ5f25BWzIUEOSgjdsb9PGII+7O8ICXcS+DYtD6q60
X-Gm-Gg: AeBDietjB6/w6CYVF1FNMahxFkAQK9ckKcre1JrYAsYwFBZpSpY0JOtdEguzel43LCz
	2a86s2Jm5R3sQDcWQ/uHU3sIZW5iF3snCfgVIdiOfgJaPMWJYLJ5XRXTTgDrlhbRJnXcIByqUT0
	V6r8m+jdj8ZbopuHY9QuXLY+nfju49gHgjhnxczbV/iz3U/Ms5vUTD4M6oFe9ldLIJ56jMGXdCZ
	nSr5uSxan4LyaVR2tduDIcVWH6VH9+VXMPFoNChprPxJWRAMygNaNjxEQQhSmyW+FVBC4VrJLql
	tj0RbFZKDNn7o35tTrilc1c+H8B/TMt8GOjXEKsyZF3h8Cv6VOoR8fbu0E7o4/9kBhVbeSsBZll
	OGy9ByQl4W+7XIJD7Piqlji0HVRn6u1WiFMxJk+FtEgMQ/s+NPicC4P9P/ecJaPofQcJpiHDNNy
	ENs/ufppWFMtzsVxMPe86plEY=
X-Received: by 2002:a05:6512:6d0:b0:5a2:b487:b945 with SMTP id 2adb3069b0e04-5a4172c67afmr809260e87.18.1776426166838;
        Fri, 17 Apr 2026 04:42:46 -0700 (PDT)
Received: from xeon ([188.163.112.56])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a4185bc672sm338636e87.34.2026.04.17.04.42.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Apr 2026 04:42:46 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Lee Jones <lee@kernel.org>,
	Pavel Machek <pavel@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Svyatoslav Ryhel <clamor95@gmail.com>
Cc: linux-leds@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org
Subject: [PATCH v1 2/5] media: lm3560: Add IN supply support
Date: Fri, 17 Apr 2026 14:42:23 +0300
Message-ID: <20260417114226.100033-3-clamor95@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260417114226.100033-1-clamor95@gmail.com>
References: <20260417114226.100033-1-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-59004-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	FREEMAIL_TO(0.00)[kernel.org,linux.intel.com,gmail.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[clamor95@gmail.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-media,dt];
	NEURAL_HAM(-0.00)[-0.995];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: C1D0C41AE27
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add IN supply (2.5V - 5.5V) found in LM3560 to ensure its proper work.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 drivers/media/i2c/lm3560.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/media/i2c/lm3560.c b/drivers/media/i2c/lm3560.c
index e6af61415821..a2674af6c9fb 100644
--- a/drivers/media/i2c/lm3560.c
+++ b/drivers/media/i2c/lm3560.c
@@ -16,6 +16,7 @@
 #include <linux/slab.h>
 #include <linux/mutex.h>
 #include <linux/regmap.h>
+#include <linux/regulator/consumer.h>
 #include <linux/videodev2.h>
 #include <media/i2c/lm3560.h>
 #include <media/v4l2-ctrls.h>
@@ -434,6 +435,11 @@ static int lm3560_probe(struct i2c_client *client)
 		return dev_err_probe(&client->dev, PTR_ERR(flash->hwen_gpio),
 				     "failed to get hwen gpio\n");
 
+	rval = devm_regulator_get_enable(&client->dev, "vin");
+	if (rval)
+		return dev_err_probe(&client->dev, rval,
+				     "failed to enable regulator\n");
+
 	rval = lm3560_subdev_init(flash, LM3560_LED0, "lm3560-led0");
 	if (rval < 0)
 		return rval;
-- 
2.51.0


