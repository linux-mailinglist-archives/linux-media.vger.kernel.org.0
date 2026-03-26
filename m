Return-Path: <linux-media+bounces-57177-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qJMUHjaYxWmK/wQAu9opvQ
	(envelope-from <linux-media+bounces-57177-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 26 Mar 2026 21:33:58 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id A099533B775
	for <lists+linux-media@lfdr.de>; Thu, 26 Mar 2026 21:33:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id A490B3010222
	for <lists+linux-media@lfdr.de>; Thu, 26 Mar 2026 20:33:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 28B3F39EF2D;
	Thu, 26 Mar 2026 20:33:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="T/K3Lryz"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08EE939A7F6
	for <linux-media@vger.kernel.org>; Thu, 26 Mar 2026 20:33:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774557226; cv=none; b=M+El4k5oiyGRm0e+ZZ2muvTCMmKv0xt/c5vUj5T8eNNRufaX8usO/2thIQykrRCoejM106sAGnytVtMfLxNkpHxPVSIsuYJ9wa1aF9C92LjdlVE8Y9c7hohvBHfCpeuAAG7y2OzqJU1u0kIzaId+IHSOXufG49v+1EcyfyV+HDg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774557226; c=relaxed/simple;
	bh=0BJWIEZUF+rQbxdkezu25IRpqxH5EBMbdIjT5617sHE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=oEkzsipvBfspzc9rYJJp7NTPfv+3cvAxPmSOPOD3DRNuo4Zmo3dWG/SIg+Bs/naRguw+lONpaeAi+nKLa6SF/UaQN5kP8ChZ5w4Unc/yNNNe4oa+zYDVa6AnY7quae8BwOu7Pv+X4CrgYL0MqmrZQ57p4Q5bkhRr2RcpdjwKNIg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=T/K3Lryz; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-48374014a77so17274275e9.3
        for <linux-media@vger.kernel.org>; Thu, 26 Mar 2026 13:33:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774557223; x=1775162023; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PMaxkx8blVwU4ZFq+ZuvurZwHvjaLzw9IVMj6+L7HrY=;
        b=T/K3LryzO0S6CpA0qTJxSruUDWFJTNJrUr3qdeRJCLWC89z0p4sCFtwMgFM+2ImCvW
         110EJshNiwn6rkEE11mTKby9yZJ/2/ZcJBUbVMsrC5Rnf0LPr2SfE79Uw6NgfWPUnnwr
         OxYRdHqkteJkXtnYzN+GNSw+nyK/Tt2j0toLjrQcSmuXrbqVuPLzKmHmZyZupf3oimiI
         wMXIpltnhW/7esqhT2Z8omqnS/WilIfMNZuYK492AtwthlxfgXxbyOgerfdyXb800CaG
         EgJzCKt5pxQG6nlnnZ07Z2uhIPAJDruEMPV7Mm3cU71W0PmNXY4alC97rCWeaPlZr7lG
         /aMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774557223; x=1775162023;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=PMaxkx8blVwU4ZFq+ZuvurZwHvjaLzw9IVMj6+L7HrY=;
        b=Q6i6aOz1B9zIdnsUOpn56MInqiTvpqhsckkB1Lq4Kl1y10081oqzaTNruwUbvTsQJN
         MAWzfvxrKPIo8hmgJeVFwEPI/zk8nGgcGSct/f4BsR3uWzmH/AnszTMi1XKI7YS4Aq+F
         fE35w56USqox5zrkYQSOajDxidb9QKN4NvCEa0WSA8VxW4EWiuiEDY+Lzb0rISuJoVSy
         hvfihtYUt2Sg5uO/j7yukDDIUKlPPTnX4XdFJSUWmvhffc1IhrpjHEkIbaK3vmSfgg3y
         +JbLK+hY43Dq8n0B9WOgTmN+ATHh59pPGn/DL7ihGqR/RXY+6/A0BgXXhur3j2AsAd1/
         SWlA==
X-Gm-Message-State: AOJu0YwPHI0huQpwRF8gWWhX/3FUxsQhovbPALaBAXdjqeNAQp/LnJSt
	sQCoKcp6swtJocEJsp8Lo8T3KZjuAivoRPr1v0z2Fh6c66fT1MNSqtRU
X-Gm-Gg: ATEYQzxbiSCdFiW7Z9SP5wxHovJl/6aM7e5WHdMYHd1sDpvMFrmxp8C4IWmZvMfAGlp
	JMv2SSGY9NgeLW3uAOgGaMFy1ZY82NxZn9P3pZt7x57u9Ivb5Hz0eKHBC6tFdBbKgGqHJk8CQBT
	NnHFStL2jVX0HbCSVZ3M34zBVa/B9QgKCrSn1mDuezpmV5hzSelCnq+6ImI85DHgzkvFf8C2+2Q
	LNyf3uQW7PVXPs5epQI51QwW7GwynVuI6eEZAhrteHR+QeRxFqnLkxpwTc84h7qbG9t2D+RCUCD
	tZYQI8a/3h0H9JCdPFUXIo3cQ61GYEMSJSeZsC/6R4NqvwmEHLJ0BJNNsGLLwEfmvBfjW4vUcXF
	DbcDKAScoF4eNbW/ZAVhLBCzkLye+59vZ+2CVGX7wL14XpbUEPS8XlWgftwn521ukb2+O+jTW5x
	AiH4U11oTXGIe/AG6zro1m/3/tJxBch4LD4QUdjDrXCvDDU0fK7FxOAB6DuJJbLCGUEWV0UxOEG
	BY5sMPZ8+Hy
X-Received: by 2002:a05:600c:a112:b0:485:4006:960c with SMTP id 5b1f17b1804b1-48727eb83a3mr1053715e9.16.1774557223039;
        Thu, 26 Mar 2026 13:33:43 -0700 (PDT)
Received: from dohko.chello.ie (188-141-5-72.dynamic.upc.ie. [188.141.5.72])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-487271be661sm1413405e9.35.2026.03.26.13.33.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Mar 2026 13:33:42 -0700 (PDT)
From: David Carlier <devnexen@gmail.com>
To: Daniel Scally <dan.scally@ideasonboard.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Nayden Kanchev <nayden.kanchev@arm.com>,
	Hans Verkuil <hverkuil+cisco@kernel.org>
Cc: linux-media@vger.kernel.org,
	David Carlier <devnexen@gmail.com>
Subject: [PATCH] media: mali-c55: fix resource leaks in probe and remove
Date: Thu, 26 Mar 2026 20:33:39 +0000
Message-ID: <20260326203339.35852-1-devnexen@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260326190052.11780-1-devnexen@gmail.com>
References: <20260326190052.11780-1-devnexen@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [0.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-57177-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[devnexen@gmail.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,cisco];
	RCPT_COUNT_SEVEN(0.00)[7];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: A099533B775
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

mali_c55_probe() calls of_reserved_mem_device_init() to associate
reserved memory regions with the device. This function allocates a
struct rmem_assigned_device and adds it to a global linked list, which
must be explicitly released via of_reserved_mem_device_release() — there
is no devm variant of this API.

However, neither the probe error paths nor mali_c55_remove() called
of_reserved_mem_device_release(). Any probe failure after the
of_reserved_mem_device_init() call, as well as every normal device
removal, leaked the reserved memory association on the global list.

Additionally, pm_runtime_enable() called during probe was never undone
in mali_c55_remove(), leaving the device's runtime PM state enabled
after the driver is unbound. The probe error path had a related issue:
when mali_c55_media_frameworks_init() failed, the goto target jumped
directly to err_free_context_registers, skipping pm_runtime_disable()
despite pm_runtime having already been enabled earlier in the function.

Fix these issues by:
 - Adding an err_release_mem label at the end of the error chain so all
   post-init failure paths release the reserved memory association.
 - Splitting pm_runtime_disable() into its own err_runtime_disable label
   so the media frameworks init failure correctly unwinds it.
 - Adding of_reserved_mem_device_release() and pm_runtime_disable() to
   mali_c55_remove(), with the teardown order mirroring probe in
   reverse.

Fixes: d5f281f3dd29 ("media: mali-c55: Add Mali-C55 ISP driver")
Signed-off-by: David Carlier <devnexen@gmail.com>
---
 .../media/platform/arm/mali-c55/mali-c55-core.c  | 16 +++++++++++-----
 1 file changed, 11 insertions(+), 5 deletions(-)

diff --git a/drivers/media/platform/arm/mali-c55/mali-c55-core.c b/drivers/media/platform/arm/mali-c55/mali-c55-core.c
index c1a562cd214e..de895b69d786 100644
--- a/drivers/media/platform/arm/mali-c55/mali-c55-core.c
+++ b/drivers/media/platform/arm/mali-c55/mali-c55-core.c
@@ -806,8 +806,10 @@ static int mali_c55_probe(struct platform_device *pdev)
 	vb2_dma_contig_set_max_seg_size(dev, UINT_MAX);
 
 	ret = __mali_c55_power_on(mali_c55);
-	if (ret)
-		return dev_err_probe(dev, ret, "failed to power on\n");
+	if (ret) {
+		dev_err_probe(dev, ret, "failed to power on\n");
+		goto err_release_mem;
+	}
 
 	ret = mali_c55_check_hwcfg(mali_c55);
 	if (ret)
@@ -826,7 +828,7 @@ static int mali_c55_probe(struct platform_device *pdev)
 
 	ret = mali_c55_media_frameworks_init(mali_c55);
 	if (ret)
-		goto err_free_context_registers;
+		goto err_runtime_disable;
 
 	pm_runtime_idle(&pdev->dev);
 
@@ -841,11 +843,13 @@ static int mali_c55_probe(struct platform_device *pdev)
 
 err_deinit_media_frameworks:
 	mali_c55_media_frameworks_deinit(mali_c55);
+err_runtime_disable:
 	pm_runtime_disable(&pdev->dev);
-err_free_context_registers:
 	kfree(mali_c55->context.registers);
 err_power_off:
 	__mali_c55_power_off(mali_c55);
+err_release_mem:
+	of_reserved_mem_device_release(dev);
 
 	return ret;
 }
@@ -854,8 +858,10 @@ static void mali_c55_remove(struct platform_device *pdev)
 {
 	struct mali_c55 *mali_c55 = platform_get_drvdata(pdev);
 
-	kfree(mali_c55->context.registers);
 	mali_c55_media_frameworks_deinit(mali_c55);
+	pm_runtime_disable(&pdev->dev);
+	kfree(mali_c55->context.registers);
+	of_reserved_mem_device_release(&pdev->dev);
 }
 
 static const struct of_device_id mali_c55_of_match[] = {
-- 
2.53.0


