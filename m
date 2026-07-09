Return-Path: <linux-media+bounces-67126-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Ma79HKZnT2pegAIAu9opvQ
	(envelope-from <linux-media+bounces-67126-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 09 Jul 2026 11:19:34 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CC3B72ED4D
	for <lists+linux-media@lfdr.de>; Thu, 09 Jul 2026 11:19:34 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=HGPh1hQh;
	dmarc=pass (policy=none) header.from=gmail.com;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-67126-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-media+bounces-67126-lists+linux-media=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 47E55302B5A3
	for <lists+linux-media@lfdr.de>; Thu,  9 Jul 2026 09:19:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2B33E404BD5;
	Thu,  9 Jul 2026 09:18:40 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9EF53FFF8E
	for <linux-media@vger.kernel.org>; Thu,  9 Jul 2026 09:18:33 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783588717; cv=none; b=BxXTHhnTaG3uFu9rMzmnKHBkqRZOjdUswYX6ujJEah2SIuHBUK6mfhm8OhV+X71AvB+The5MSifPubs78YHtGZRPcOlDTgNoAPd89jayQHVIXiixtKQKyPiAoLJdTGzs2PxyCMT4hyNMOkERyIiu+Tm/zJb3aLjKjLifJrPT0Ck=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783588717; c=relaxed/simple;
	bh=QGFu2RUEhXCVBflXn7BkzuXbVflskdy9XRAuynQwkPU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=RgxMG+Cjt88Pj2R8BUpEJGWxNI2Y6A2fT6duGY36M0m3twGvuRVmtF5x4ZAailh8k7bssiLI207QnyOikM30jWxchTdU0DE7BYl7Maw9CyUjNVHZfiBDCoSQ/AaFWJ8cLjLauNPF6jgz+GEUzTun5SV3A+gzzmsQowVzIpBOBY8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HGPh1hQh; arc=none smtp.client-ip=209.85.215.169
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-c99eaa1f020so1509912a12.2
        for <linux-media@vger.kernel.org>; Thu, 09 Jul 2026 02:18:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783588711; x=1784193511; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=eiEd63IM6B5U2kFBDICWvsiDZ3Nf3kdcvUkPjHM7VPg=;
        b=HGPh1hQhq+z3YnXA9kPYN7m6KVML1yqyJuT3KBtNfZSWa3Pea7Oph+PUF4dPkZLBYj
         1WnkYEEhD1ae5mXXKE4su6T7LKMmF+PxvHP63mc6qISx6g4N7deHX+DvowND/0EmXmyS
         iQuPLR51GPAbLZfgBMaD7DeXgLW/XHihhUb3JzV7IcOzm7ubeMKc5lBBzCtmGOUoCz6j
         oZoXoyOS3LUKDJn9hHyZiXtMofidIK3jXlv5ZuvKw1El/G7qbatPpxh842h1DyCVQHXV
         ErLpIkKWaoT/ZFymH1+acH08J+Yo4nAkF1ezjrRAPZvcdkQ1C06Zb6wNaxVRKGWKB/Ju
         cY0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783588711; x=1784193511;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=eiEd63IM6B5U2kFBDICWvsiDZ3Nf3kdcvUkPjHM7VPg=;
        b=XiNzepmjNFcA+pFO3FHTfWqWn6f4+a48cmmKO0ntxtMqJNMafhhO1cDNqBOuT+/s94
         JsxthLgq/sh6UdApXtVuoXTfICvWMougZcNxGmEairy++RtT2/kGHWNOjrPbuPPZuLyQ
         z+7kZzutfud9LWl26HCHPoHBRAO/c/mDUIUDPSJIORe+PrmAHwj1G/oAdhPm8qG5XCgQ
         WOzDGH2TpZJx1uJJ6ZlZ2FGzi/xriI1qqWck5By9m/7Ub9CxCJ64NRoXP51Mq2oNQfmt
         XfrEAqxeEofXFOYQ35ToQwXXumxM43/QTnA3w5uzo9qC/Ip405l/a/SuZjI5iYj/sREO
         x07g==
X-Forwarded-Encrypted: i=1; AHgh+RqjNOEp7xLVdZfs4UvmURBoiGIta0K4WOMAOfxvvhixci60Z92ua66kWr/gBJm0XnvfwbrOXr1YwZeGNw==@vger.kernel.org
X-Gm-Message-State: AOJu0YypOTJ2N5jxQ26WRrSU3UGRGb2QDO82JFxpWhQ704+9P43lP/LL
	V/TpG+BKmTCh8jsoKd7faNnC7ZnK+AzNy3sh56F0SoC8fh/cry/quwXX
X-Gm-Gg: AfdE7cnyn0+KWZSfxwJjjdl95eo7KHNH0iJa1j8aPLLeXHgdKRMfbQiCheGH0S3tnvw
	+XY4U9ONrDcCGMwSylOXe0abET4o0Wv4FKUVectcdtYpfNyN9mo5evDty/2cutidR8jjKamXpHS
	LnaDLrjvt56CGMxvzjMeOGVkqSV1Njf93y2e8CY8fWb1lG4oIRVfssM3Uid46fhqh5y1rOcfv0a
	8xDnvtp3P9cW1faQkmPjdGycIebuvYi5fJD5Yd41kwVis03NuqIwO5M4JtjVh3YuBnheosG2Kyx
	GVJtjoqa5+3dXxLvcuezlpp30v8JtptTU/FNIFwfit91zD5ekPe/xW94qLyVeBIOsvWxHfMZmM9
	Z1K+jUkEccCeUWSpM25z89YerpuugqyOA/OeUunvZZe5D52TwiFAw7kq7EbiBgAvt9RmdOtzYnG
	CbaSSYEOWsMGcNeZFcsQrFnhuw2eyK94QixCss4HYRAso=
X-Received: by 2002:a05:6a21:512:b0:39c:126c:93b5 with SMTP id adf61e73a8af0-3c0bcfea433mr7947944637.21.1783588711529;
        Thu, 09 Jul 2026 02:18:31 -0700 (PDT)
Received: from localhost.localdomain ([49.207.223.101])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13b6594f6a9sm29682728c88.5.2026.07.09.02.18.27
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 09 Jul 2026 02:18:31 -0700 (PDT)
From: Biren Pandya <birenpandya@gmail.com>
To: niklas.soderlund@ragnatech.se,
	mchehab@kernel.org,
	geert+renesas@glider.be,
	magnus.damm@gmail.com,
	linux-media@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: jacopo.mondi+renesas@ideasonboard.com,
	Biren Pandya <birenpandya@gmail.com>
Subject: [PATCH v6 2/4] media: renesas: csisp: Add missing media_entity_cleanup()
Date: Thu,  9 Jul 2026 14:48:16 +0530
Message-ID: <20260709091813.67081-8-birenpandya@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260709091813.67081-6-birenpandya@gmail.com>
References: <20260709091813.67081-6-birenpandya@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[ideasonboard.com,gmail.com];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-67126-lists,linux-media=lfdr.de];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:niklas.soderlund@ragnatech.se,m:mchehab@kernel.org,m:geert+renesas@glider.be,m:magnus.damm@gmail.com,m:linux-media@vger.kernel.org,m:linux-renesas-soc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:jacopo.mondi+renesas@ideasonboard.com,m:birenpandya@gmail.com,m:geert@glider.be,m:magnusdamm@gmail.com,m:jacopo.mondi@ideasonboard.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[ragnatech.se,kernel.org,glider.be,gmail.com,vger.kernel.org];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[birenpandya@gmail.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[birenpandya@gmail.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,renesas];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,ideasonboard.com:email,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 2CC3B72ED4D

The probe error path and remove function fail to call
media_entity_cleanup() upon teardown.

While currently a no-op, calling media_entity_cleanup()
is an API requirement for entities initialized with
media_entity_pads_init() to prevent memory leaks.

Add a dedicated error_entity label so the cleanup is only invoked when
media_entity_pads_init() has actually succeeded. This ensures that the
teardown logic properly mirrors initialization.

Signed-off-by: Biren Pandya <birenpandya@gmail.com>
Reviewed-by: Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>
---
 drivers/media/platform/renesas/rcar-isp/csisp.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/renesas/rcar-isp/csisp.c b/drivers/media/platform/renesas/rcar-isp/csisp.c
index 8fb2cc3b56503..199b70ea841d9 100644
--- a/drivers/media/platform/renesas/rcar-isp/csisp.c
+++ b/drivers/media/platform/renesas/rcar-isp/csisp.c
@@ -539,7 +539,7 @@ static int risp_probe(struct platform_device *pdev)
 
 	ret = v4l2_subdev_init_finalize(&isp->subdev);
 	if (ret)
-		goto error_notifier;
+		goto error_entity;
 
 	ret = v4l2_async_register_subdev(&isp->subdev);
 	if (ret < 0)
@@ -551,6 +551,9 @@ static int risp_probe(struct platform_device *pdev)
 
 error_subdev:
 	v4l2_subdev_cleanup(&isp->subdev);
+error_entity:
+	media_entity_cleanup(&isp->subdev.entity);
+
 error_notifier:
 	v4l2_async_nf_unregister(&isp->notifier);
 	v4l2_async_nf_cleanup(&isp->notifier);
@@ -569,6 +572,7 @@ static void risp_remove(struct platform_device *pdev)
 
 	v4l2_async_unregister_subdev(&isp->subdev);
 	v4l2_subdev_cleanup(&isp->subdev);
+	media_entity_cleanup(&isp->subdev.entity);
 
 	pm_runtime_disable(&pdev->dev);
 }
-- 
2.50.1 (Apple Git-155)


