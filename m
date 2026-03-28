Return-Path: <linux-media+bounces-57449-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YF4nLrHwx2lMfQUAu9opvQ
	(envelope-from <linux-media+bounces-57449-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sat, 28 Mar 2026 16:16:01 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 31A4D34ED17
	for <lists+linux-media@lfdr.de>; Sat, 28 Mar 2026 16:16:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C2BE3304604B
	for <lists+linux-media@lfdr.de>; Sat, 28 Mar 2026 15:15:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E891F28313D;
	Sat, 28 Mar 2026 15:15:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dXxr1Uyw"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80C9332B99F
	for <linux-media@vger.kernel.org>; Sat, 28 Mar 2026 15:15:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774710903; cv=none; b=TFvH9/eXBjNYJ53nrFJYAVpIyiCmnU5+oZOIqsnZ3jREGbQe+Mjxvj3m81hbUrcsMPhH9SgCL+7gEXsr4BIkC9//h1cDhAyQZM72y0HViaqLLEUHbQ06BVXWqlnRPQ3lEyQgUoSlolxFR4trQxScC1Nhf1TvkFF1fZg7y4AW4nE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774710903; c=relaxed/simple;
	bh=8a0gNtVykYgDR6+waIRbze9QAug3gZauHStbzAuJIfc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=q30WGStxIolegOlwAqY27inu+Kv05cplZ9X7HpDVsaWaBzFkKQ7Mxh5p/+Reyn4qqm3ZzUMhuprJFqhHd6UdgSDd7c73GbXkuhpIr8E5jjo5NREZvGh+CAdJnLMprzMGypo7O5UrpH4f/CBhr/y6fb6EalPIi/pKHXohn1/PfYY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dXxr1Uyw; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-48557c8ad47so23304165e9.0
        for <linux-media@vger.kernel.org>; Sat, 28 Mar 2026 08:15:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774710899; x=1775315699; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+X7JPJETnQPZSwpvLQ+Nx6DR2XzD/HlDNrW9w9MHCFs=;
        b=dXxr1UywTQjOAqDqXmpmPHeXGU2zPS6D6q7j/IyK+qke+RVyJrNi6qJX8PoNlYC3l2
         kLWTTjcLWK2DScxTyjUZt1O78wpGO3daKJFbyRBQIyEbDRXWWaHM/uA2WP9SHMVKpW0N
         zMNVlFnzg8QpUtcZ1y1hICxWk8PDGndgn52St6iul05j3cGbQWvVaE320r7GM8qT9FEo
         yIqWCDKqhXhL9ozWTmgPuwX5L3rqhZaGiKaP6TguHlMNk57NWRjxQdbiXkIcyqOlDNV8
         F+dmmYOyVECDzrbPBzbJ/hK7iV85YqIjfzA95cKO3rrhfPY13+YG5q0DCnYIadtqwoEi
         9Fsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774710899; x=1775315699;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=+X7JPJETnQPZSwpvLQ+Nx6DR2XzD/HlDNrW9w9MHCFs=;
        b=BaFQSZH9m+FnezZ02P2HsYA7fP62sFcmN30P5Zn62qh3N14hrY+xc55T0SDGA2pZ+W
         JEX+RYJKQyryt+2xsbFmfuGvZ74GSX99PYcTDrYGGBEyf77ua02GzypTxxl5vctW1wsZ
         rE5yj76ZcKx5t2WIHe3obJNucAKlCvWNJwgpaGX7eqbKeLUDFQTuuT30Nka2NHOwdK7e
         QYNegp8ZP7syhX1T6fvXiHsP5tWlpOt7LGsAZx7gLtR/x4Mq/SpdANUnZGTvvf/LkxTQ
         or7N9lgLxzBkf/XNyrm4XHjSd942GaqKWUg1Eui3jg9Sqrn6XCEAjrJe6qwF+yfhnYnF
         wsaQ==
X-Forwarded-Encrypted: i=1; AJvYcCWemHcsx261soP4sGbPZmowSJl08RVanHPwBROHp2luzwWNiyQOHVFewrfsTMtF3M7KiielL6s94QAwDQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxNeQTqv364y5amcf+vgT3FOSKQHq0UDyK4Vjyn0fT2UTQ8dxGi
	zVok8zpUw3kLifWWelcGTLcbXhLPtSDBF09ZT7lyzi3hTejrStQcVX/s
X-Gm-Gg: ATEYQzwSuRaetsJyV2D9PAmhBxi1ZP+xVZu1ZhgsUgxQ71cl6KinBgOTtL7b51Ftq0U
	k1FUaYRcEoBn9WJ/y1IkPwWCGyFzh+XqbvYuXm6kHBlQQDmGF3qth8VGNM++35JXNq7J1UNGExr
	hlNbvB+mkszd2jpCB5ZKhLQgcU2nzaOjOCvqcKPUu42umHxKuTG7Cjz+YeLptdS/CFiMvFTxZ5x
	WT8iv1kQpj3F8rjRyI8cxaQDvWrcqC0s1ZBL/BOipQcEwufgOwwBAFmkLVsWErTC3Phmg4342CW
	zNSUzl+A4rSrUmuTLTy6gry02BZm6Ij0PVPrlUMpZ6BgyoJZ6ItQ1hsZqJY1znhMYqvzcgzaLdf
	r7Pcv9x/tsKZ8l4tKJdA0GTV9whcCA1TiR3vYH9sT9fdy5D7WP5jespXFtN1VT/7d8manp3AAL/
	KqVL/y/OLlSHlL4+w1b8yzI/G5ukbYHx+2qrX7yk+tQmUFSFc/hxMxQMUr44C1GzvY/B2BgsAfb
	JG+BtI/qQTA
X-Received: by 2002:a05:600c:c8f:b0:485:5ba3:37d8 with SMTP id 5b1f17b1804b1-48727d59cf4mr108094595e9.5.1774710898710;
        Sat, 28 Mar 2026 08:14:58 -0700 (PDT)
Received: from dohko.chello.ie (188-141-5-72.dynamic.upc.ie. [188.141.5.72])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4873069961esm51573795e9.12.2026.03.28.08.14.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Mar 2026 08:14:58 -0700 (PDT)
From: David Carlier <devnexen@gmail.com>
To: dan.scally@ideasonboard.com,
	jacopo.mondi@ideasonboard.com,
	mchehab@kernel.org
Cc: nayden.kanchev@arm.com,
	hverkuil+cisco@kernel.org,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	David Carlier <devnexen@gmail.com>
Subject: [PATCH v4 2/3] media: mali-c55: Power-off the peripheral in remove()
Date: Sat, 28 Mar 2026 15:14:51 +0000
Message-ID: <20260328151452.148901-2-devnexen@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260328151452.148901-1-devnexen@gmail.com>
References: <20260328151452.148901-1-devnexen@gmail.com>
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
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[arm.com,kernel.org,vger.kernel.org,gmail.com];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-57449-lists,linux-media=lfdr.de];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FREEMAIL_FROM(0.00)[gmail.com];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[devnexen@gmail.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	RCPT_COUNT_SEVEN(0.00)[8];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,cisco];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 31A4D34ED17
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The Mali C55 driver doesn't depend on PM. For this reason, if pm_runtime
is not compiled in it is required to manually power-off the peripheral
during the driver's remove() handler.

Also pm_runtime_enable() is called during probe but mali_c55_remove()
never calls pm_runtime_disable(), leaving the device's runtime PM state
enabled after the driver is unbound.

Manually power-off the peripheral in remove() if the peripheral has not
been suspended using runtime_pm and disable runtime pm.

Fixes: d5f281f3dd29 ("media: mali-c55: Add Mali-C55 ISP driver")
Signed-off-by: David Carlier <devnexen@gmail.com>
Reviewed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
---
 drivers/media/platform/arm/mali-c55/mali-c55-core.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/media/platform/arm/mali-c55/mali-c55-core.c b/drivers/media/platform/arm/mali-c55/mali-c55-core.c
index 5cb59c70ffc9..cf238bdf65c8 100644
--- a/drivers/media/platform/arm/mali-c55/mali-c55-core.c
+++ b/drivers/media/platform/arm/mali-c55/mali-c55-core.c
@@ -859,6 +859,11 @@ static void mali_c55_remove(struct platform_device *pdev)
 	struct mali_c55 *mali_c55 = platform_get_drvdata(pdev);
 
 	mali_c55_media_frameworks_deinit(mali_c55);
+	if (!pm_runtime_suspended(&pdev->dev)) {
+		__mali_c55_power_off(mali_c55);
+		pm_runtime_set_suspended(&pdev->dev);
+	}
+	pm_runtime_disable(&pdev->dev);
 	kfree(mali_c55->context.registers);
 	of_reserved_mem_device_release(&pdev->dev);
 }
-- 
2.53.0


