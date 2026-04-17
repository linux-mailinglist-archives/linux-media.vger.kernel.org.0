Return-Path: <linux-media+bounces-59005-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ABkuCa8d4mlX1wAAu9opvQ
	(envelope-from <linux-media+bounces-59005-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 17 Apr 2026 13:46:55 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 7440441AEAB
	for <lists+linux-media@lfdr.de>; Fri, 17 Apr 2026 13:46:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 14FBD305E8CF
	for <lists+linux-media@lfdr.de>; Fri, 17 Apr 2026 11:43:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 20A123B4EBF;
	Fri, 17 Apr 2026 11:42:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QL7va/kr"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A4F839934A
	for <linux-media@vger.kernel.org>; Fri, 17 Apr 2026 11:42:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776426171; cv=none; b=cUMOdfIrbQe1oR1YoQHAMojmkZGp20Dw/eqC2boTjKc2PJC90ndcZmES/elALhU4dR8Fg+f7I+UjrkBu0PJV5Q06MwvEItgZ/2gcu2/DtjwRNGKA/C4fJjJpDrgvRyv84IIRFThmLIideJXfDqe6XQXmyIzKXc9XWhYuxrCTvcI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776426171; c=relaxed/simple;
	bh=yufkXp8REa55nKKKY25mbUUOR8zHhW1MM+JCVxnj/xY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=EdZBJcRNriqckLNrVmEnvvvke+8YybjGS9fPYWvQ26dJMCIqC5nHeCdQvLynuYvhAkjPmKPxDeR3iDooCN8NAMGDaGOhYgVvjhRksGrPjGO6GavUYkgseZCoxEjRmfPVCbBjKYFtL7iAzPwEC2VjbLPPNMQWM42pgnxpfeTKgTQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QL7va/kr; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-5a402dea4a5so655841e87.2
        for <linux-media@vger.kernel.org>; Fri, 17 Apr 2026 04:42:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776426168; x=1777030968; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hquw2DNWZgZvIoiMcHg+A2Rmxt4zwGE02aJk3heXeoY=;
        b=QL7va/krtQNJk1DjGFC5lXHZBtn/jVXUB4eP0KicKoEyd6/KdFJuX1mFYA+P7PnWbH
         0iH4b7W7FXqLkgID6w0iNKNYcUgxNbnE8eX26Z+xERVS1ZY54eo9GmPZRdxmOr6FneVV
         33Ze0ON74xlX5mt2UCO99XU6oQBnvgzNtaRBiBUINBEIDoEiwGOvnCskHk16K82vfHqy
         jlOripN24y8ldhQEgdKr7hmeMHqB0ipXkQ3Y66tWSZU+ojJVObtSB+jbR/4uO09PK8Qa
         17eHp7ryZLCP6ZGCJaA7eKGmoptcxUkmihxdEDFmmAP5nJHA4v+DWm3mrFPyKNQTj3Oe
         2l9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776426168; x=1777030968;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=hquw2DNWZgZvIoiMcHg+A2Rmxt4zwGE02aJk3heXeoY=;
        b=eumwpZ9x7FizqjHmpkI5fZx/NZAhmtq5EidwCGe2oaUWKovdD5e26R/0+pYkFgBB5m
         JjZyBxtzq0sdykRqffO4YrlgBvzuK8DNh9+5NjPLbNqDHX6dft2R0KFPPzZzNGS/oRtp
         78nUh9LlAiu57uul9OmSE/nHHGDWyQzF0h4zu+1TPkHbC7mmjV7q6IcYIcQi0kOfv2KA
         z3kjQ8dNDfZpFWM2y98/+/Gvi59UAdF/n01+FW7rMuato3tirf0skWoAoInyz/AyFj0m
         veUdekosTaOHWwiULf4QOEfcIZyf1yPpbx1XY/c1jRVYn0JeBQTkzCy+/tJeTmaWMGzt
         GVBQ==
X-Forwarded-Encrypted: i=1; AFNElJ+MLpimbam6G5XBohUJhtemUHyQMHKz2gfB6dxlI9bmuVHVwfrtMQEa2ybjKDXeiiNHmtgkhN8MHtkNnA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwEJ76zrVhcZLWTiRpTVHxhfcMalGX1vX5k8wGxjEW42x5jHVG3
	i0aoUb3E3kxHI8ZNHIJsD36kbBGAfluwvr1IkSwr2m8TkhcRVTYenLvd
X-Gm-Gg: AeBDievnJnPKxbJ9AdWxi7OhvspRVYMzK7bojKTCWhICjGByg7rkL2piEqmurgNxuwr
	3rWew6ZI/elJQ4jUbsf/8CjtexN7K9wzyXXJsmsUWH8Lq0dCr30zo+3+agVtFKNVAcn4RTKECDe
	WKxIaLiFyX4/HOmSAlPEtwCrGpkyIXImFg/kEoz0/we+oGnwFuDkzf+/YUso6lQ6xZtMWn+ZbjH
	H9qFE88jc4mRal4E/455wGMUj3ySgGN1T9M/HzQXq3kMfdc389Vs3pVWM63s/cpfvBzkFajaY9h
	Gslak8Qjdyfzztirs86uV4Bvom6je0xPMwGs4YtLCOVOWO88Nss1Il5fgZKYzt08w1unmnWtkGh
	F0o6vicg/QQOQFQ2HiTaO6ORQjBcRXTJLvq4J7LiQOEZ5cvWTWJ/IUKx9LvXQZlHx4UTFJdtfSD
	x7D+l8t96Kl6o6wx430Qpbk226/2smkzOacg==
X-Received: by 2002:a05:6512:108d:b0:5a3:ffc0:7882 with SMTP id 2adb3069b0e04-5a4172fc0b6mr706909e87.45.1776426168032;
        Fri, 17 Apr 2026 04:42:48 -0700 (PDT)
Received: from xeon ([188.163.112.56])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a4185bc672sm338636e87.34.2026.04.17.04.42.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Apr 2026 04:42:47 -0700 (PDT)
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
Subject: [PATCH v1 3/5] media: lm3560: Fix v4l2 subdev registration
Date: Fri, 17 Apr 2026 14:42:24 +0300
Message-ID: <20260417114226.100033-4-clamor95@gmail.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-59005-lists,linux-media=lfdr.de];
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
	NEURAL_HAM(-0.00)[-0.996];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 7440441AEAB
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The existing driver does not call media subdev registration, making it
invisible to the media framework. Since the LM3560 supports two
independent LEDs, register each LED as a separate media entity.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 drivers/media/i2c/lm3560.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/media/i2c/lm3560.c b/drivers/media/i2c/lm3560.c
index a2674af6c9fb..bee1681a1603 100644
--- a/drivers/media/i2c/lm3560.c
+++ b/drivers/media/i2c/lm3560.c
@@ -368,10 +368,16 @@ static int lm3560_subdev_init(struct lm3560_flash *flash,
 		goto err_out;
 	flash->subdev_led[led_no].entity.function = MEDIA_ENT_F_FLASH;
 
+	rval = v4l2_async_register_subdev(&flash->subdev_led[led_no]);
+	if (rval < 0)
+		goto err_out;
+
 	return rval;
 
 err_out:
 	v4l2_ctrl_handler_free(&flash->ctrls_led[led_no]);
+	media_entity_cleanup(&flash->subdev_led[led_no].entity);
+
 	return rval;
 }
 
-- 
2.51.0


