Return-Path: <linux-media+bounces-57174-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aFb6Nz6FxWlc+wQAu9opvQ
	(envelope-from <linux-media+bounces-57174-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 26 Mar 2026 20:13:02 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 437F533AC47
	for <lists+linux-media@lfdr.de>; Thu, 26 Mar 2026 20:13:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4204231AA7C6
	for <lists+linux-media@lfdr.de>; Thu, 26 Mar 2026 19:03:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AA53234CFDE;
	Thu, 26 Mar 2026 19:01:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KSMn4uAf"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 895F63A7824
	for <linux-media@vger.kernel.org>; Thu, 26 Mar 2026 19:00:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774551663; cv=none; b=cMs69QZnmub5mgoNo62CNewExVB8c2HBRN6DRo1YxYvPFVcaLl8BMJXW4zoElCaHkp5vKz8hcXDkK8hsBBC52bGVTcmD7Mdb0iJF6rjaOikG/ptHizo8pnWdEuStR45FB+Az4F+TquL+jSRHS2MSBfjCbnDDXtFAjZiy/HWnH2A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774551663; c=relaxed/simple;
	bh=k69XcNGqZA1yoRwOAPdRqVUlS+n7++vwFrRdtfF4/ZE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=rMcC61mVCUsLrOND/Oew9mVERK8Y29GyD8vu0GqshyiSl4rAc7LUwmf2lY6zS9wSthQ0f2R9Evcl9dnFJQyc1iEmqnvVGj/CVYgK3lXcxfxFz2tOS27gnScY4rtQRPRSETJT+BjDsJkLwKJBRocKUvgm1BjuwgI9XZ2rixnfBOA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KSMn4uAf; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-439b2965d4bso1046361f8f.2
        for <linux-media@vger.kernel.org>; Thu, 26 Mar 2026 12:00:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774551656; x=1775156456; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=JglxAbJwxC0RSdaWUygUvn1XAh97gEO4MyAua4nYFxs=;
        b=KSMn4uAfxymgCAhVB69ivUgA6mmFRn7FV58fS0Mph++40KBjB1DcnRJ8utATd7sLFS
         88Np5iwKgwBOce4MgYPu8tozTjLNjpwkZ3XDVQt+TEB9xNuBIhqJLgxvwgw07LSIFIoo
         kSgzbmqxZmpZbBoaV72SlU7iUrO8roWC219vPJBEGTNAp9Sb911uwNBlzElT3Am96X2W
         IwYpN/G1rTGDIINhOQjuX0Sld7rcgeNUycDtrmsDJhepqe+ZT42RK+WEDMmkTZ2MofY1
         atAl533wkft/OrIf7lsvf3Qu8YbdxEAoi02EqgYKCEuUXuydCCfHYapogevIkyZsOg3P
         MDqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774551656; x=1775156456;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JglxAbJwxC0RSdaWUygUvn1XAh97gEO4MyAua4nYFxs=;
        b=S3q3xdh17QwCkTNI0VOrnFoGE5wqUCtFszrXMU87dwhw7YbS+nPiRhutHq4eYRvKn/
         9MxpWVrNq9cxQswo+T5aTaH9Z4daV9F/Z2TickKC43fjx+jHZR/LRL68dxpO9HKbN/ht
         l/+5JGK1ZG1YDeh0R8ohSW0zUxJkrv0gcZefI+O8QtlbN4MSqcU18uPcCkKXR70nctve
         iKaeqB+5ltobhAjK8yecY3vofGJUUeLE/1bd7sff0Ag7oSNXYL1AR36DMyl3GcsfA5F5
         bjGrYHOVruU8vGCJiI1HilcnJXOfvANRrgEuBR2tyK4d3TDaf47/n1w/JO9ujpsC7ogc
         lYPA==
X-Gm-Message-State: AOJu0Ywg7yBbcu5J7X5HJ66Ac1zxR7OdEwHC5xgaXTK44XCpn9cwPQLH
	H0PNl5CVLPyPe4ANv5UY3C+mYcq7PCZbqUZqNqW3ujAHNlXk53Lrs/y2
X-Gm-Gg: ATEYQzyWZbeTV9FVeAsVPcwkVIsbc8jeolpn+PEC2ZUSoGHIyykT+CWM+hKSh5wrnls
	Fgjij/C7Kix9zhwJq4HZW1VXY6ab6NVkDi6dSGvurOz1S0gj42tNcxU7ntNO0vODyxDUwgUh0aM
	bkxiw9/PVcaGCOpJbtUvP39KNNYvGGCmfBP3BQT6iki/Kk08Wo9Z/rtdXvEPXwiRkQbgtWh9ZQg
	x/NshLpj99CmkgQgpSqWJcy3ssbpvABIMiVYMzVxP3/FJKMEY6rneRsoE9QOIRWlrnNlF8OiKmy
	G+o3ohRBhfQbhABGD7Na7LJIKO+IJmvEUXPh39d2xruxA+s6IM5c8GXAaEqfLpppr6xs26cYgzV
	DruahqckITjAEeFMs+uYrJbcO1XwwmCQpmhxFe5zppEqPZqxccJ2UsU3K7VOXYAs3cxZixfgch7
	3g+I/vK80dC4LEt98nUhXibtrGjzD3qvyOFiQjHM+WHpPKWn1r27a++WSL3NhSFhfhk1ZJ2ehRS
	sRsoKFU60g2jkxq+2eF8wA=
X-Received: by 2002:a05:600c:4685:b0:485:17a7:ba0d with SMTP id 5b1f17b1804b1-4871606cbcemr142953075e9.32.1774551655489;
        Thu, 26 Mar 2026 12:00:55 -0700 (PDT)
Received: from dohko.chello.ie (188-141-5-72.dynamic.upc.ie. [188.141.5.72])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48722be47a4sm68290385e9.0.2026.03.26.12.00.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Mar 2026 12:00:55 -0700 (PDT)
From: David Carlier <devnexen@gmail.com>
To: Daniel Scally <dan.scally@ideasonboard.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Nayden Kanchev <nayden.kanchev@arm.com>,
	Hans Verkuil <hverkuil+cisco@kernel.org>
Cc: linux-media@vger.kernel.org,
	David Carlier <devnexen@gmail.com>
Subject: [PATCH] media: mali-c55: fix resource leaks in probe and remove
Date: Thu, 26 Mar 2026 19:00:52 +0000
Message-ID: <20260326190052.11780-1-devnexen@gmail.com>
X-Mailer: git-send-email 2.53.0
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
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-57174-lists,linux-media=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[devnexen@gmail.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,cisco];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com]
X-Rspamd-Queue-Id: 437F533AC47
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
 .../media/platform/arm/mali-c55/mali-c55-core.c   | 15 +++++++++++----
 1 file changed, 11 insertions(+), 4 deletions(-)

diff --git a/drivers/media/platform/arm/mali-c55/mali-c55-core.c b/drivers/media/platform/arm/mali-c55/mali-c55-core.c
index c1a562cd214e..bfe811182cda 100644
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
 
@@ -841,11 +843,14 @@ static int mali_c55_probe(struct platform_device *pdev)
 
 err_deinit_media_frameworks:
 	mali_c55_media_frameworks_deinit(mali_c55);
+err_runtime_disable:
 	pm_runtime_disable(&pdev->dev);
 err_free_context_registers:
 	kfree(mali_c55->context.registers);
 err_power_off:
 	__mali_c55_power_off(mali_c55);
+err_release_mem:
+	of_reserved_mem_device_release(dev);
 
 	return ret;
 }
@@ -854,8 +859,10 @@ static void mali_c55_remove(struct platform_device *pdev)
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


