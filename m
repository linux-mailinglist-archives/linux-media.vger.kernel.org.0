Return-Path: <linux-media+bounces-57266-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cBriOCidxmnrMQUAu9opvQ
	(envelope-from <linux-media+bounces-57266-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 27 Mar 2026 16:07:20 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 27E3A346763
	for <lists+linux-media@lfdr.de>; Fri, 27 Mar 2026 16:07:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A39FE301F9DE
	for <lists+linux-media@lfdr.de>; Fri, 27 Mar 2026 15:07:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 20EEE2ED154;
	Fri, 27 Mar 2026 15:07:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pW4/YbdI"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30156188735
	for <linux-media@vger.kernel.org>; Fri, 27 Mar 2026 15:07:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774624035; cv=none; b=E0Jd9lRji7gLb3QyK9rRNMUBZ4lTplYdceck74e4PxYetW9ukND4pZL2y+ew5481YyKENtllESXYneF/qsTj+tMG/ZSrGDYG5gCVEQvbJhkS5saubPTVsJ3qrGR8q9XrcO0F5CdWrCbai7fJyQjUBq85+zHjHJPWZ8G7K2urnhc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774624035; c=relaxed/simple;
	bh=QT1ktfNmN1UcDS1rLtjBYoZjSUgMc025Oyaz/fGFc7o=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=j0g6r9VXHnP5iIJtFk5+fFh3O7ao3KDxnLG+Tggm+wCcBgw2ktKhqgel+UWvWjESV5zkdDQc3eDoI4hjJSfXc+xWAmguJY0kGphO2e8bUkAsd6rf2SArTG61TEN9hsLgXEX5JSpB4BQdUpGwz38ljG8JMnaNnbgCrmOrNigzHTs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pW4/YbdI; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4852e9ca034so22553585e9.2
        for <linux-media@vger.kernel.org>; Fri, 27 Mar 2026 08:07:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774624032; x=1775228832; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=nd5Xli4czy19zxhELaWrbYsp5OrzbC0MTbSXRE2sw1A=;
        b=pW4/YbdI/Hs0f+mLG0SQ9GkR85sW/8rGdgcWZKzYpfvuZXpDuyQ+I3OyOa4YdDyuMH
         vPmL5gyupxFP4gNu1GFV+7GOwhnleL8dWwsL2F5ZX7zf8K+Py5BCIj/fn2oSiAGy2aUp
         00lX5jCzRVNkvxh4/l5WASdsKJa0pwYtYWz8Vc+F3Df8MgfxosEwSTsUqH+l0uTXur25
         kzq3dtAXTg3enmlVr0hnwv0KP+JHE94putGutjIqKAcRlnvB7XzvdEfHGVoCjpAyS2ZA
         0+brAWpP5q20ScRP/cefLJy7hAD1EwIX0qpShcGXUIlbmsTXwPiYB0DdjyhhZtvKGKmY
         0ayQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774624032; x=1775228832;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nd5Xli4czy19zxhELaWrbYsp5OrzbC0MTbSXRE2sw1A=;
        b=jufnmZ6DvB8h2cQHFCkGhQrveXfYnQY5zcBPO+UXwIHjTDnRSWj+mxJGMBr+6zqvl/
         uHNS5mSRqnSpFag0haSGCfnN2H+5zsQ5QXriLxzvIU2agcCSz6xBNjQbjRx/+tq8uVwK
         LSg/PezdZBiNzx07mZPa9j0sYMqZhbNCll+7Sy8Us0P+DyJU6HqtbqgDTjh8vkqBe4Xk
         BaahX7bqZNzopXpbZnAtxv7C/K3nslPS0mExVwO2fmo3+oeIrVTwYNIcjfBh5TtcYg6K
         650kZXbBU2kbxlbppZ4oIxHaJS0YMFKTDaz8tHvrLJbk6vSsTFna9H1v/uJE+rwQWJWR
         6pjg==
X-Gm-Message-State: AOJu0Yx8paOmAKj2GpnJip8L5zXKqCBTp+UWLK02yh+sAoglWFNvvMyT
	YTTUTGD60BmBRyaDz54twQsox8HwW0okutZuZxiHNFtashSILriB9sDD
X-Gm-Gg: ATEYQzzEwbf3+Rl7Z2YL3C0mWpWukdvM2+CM9Z4Oq5btZabuGO4KBDMkKRO5qQzY0nX
	NqtCvC03jPyh89uQIeNGEOA9up3/NtxOy1OIhItPbXXKzjN11Y4ExGgSDTEMUU1eOXydot82YHq
	dCpMIQJopE3W1Q0AGd9fVbGqmf34L3Ag7FFzu7UH59YofsHBpEnNZy/1Gf+dQuChwIspALNWKdk
	d3KB8QXCGYFEvqvou6w7z7e8xphlPBchEm5QfEB9HWqoRuLIscwDD/S8Hs9s5MN81uhhGxd5ZcW
	uhOwtTDIEpMUmX9sIQ0mppeeYa3pi6tsN2KC8bkxYhzJ4r3py8q4B53+i4B5ZEBAVuROtN5zZDm
	GiC/1O04FUxTpXMaplt0kt9OpxA1PAIfcXy0pvYnpbNOB8e/r7RSsSowovCqGHrVWLxQ+0NwOfS
	m3XQNVmp9jeodnqRg8cac8op3ZULw0Ebwk4v+5EIxRkNaj0TQAXGpOieaXJ+O0cDz9dycjLPMYw
	2PC8/mlNbuh
X-Received: by 2002:a05:600c:8b2a:b0:485:3dfc:57c with SMTP id 5b1f17b1804b1-48727f5fe97mr46485075e9.21.1774624032289;
        Fri, 27 Mar 2026 08:07:12 -0700 (PDT)
Received: from dohko.chello.ie (188-141-5-72.dynamic.upc.ie. [188.141.5.72])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48722d40741sm97475055e9.13.2026.03.27.08.07.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Mar 2026 08:07:11 -0700 (PDT)
From: David Carlier <devnexen@gmail.com>
To: Daniel Scally <dan.scally@ideasonboard.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Nayden Kanchev <nayden.kanchev@arm.com>,
	Hans Verkuil <hverkuil+cisco@kernel.org>
Cc: linux-media@vger.kernel.org,
	David Carlier <devnexen@gmail.com>
Subject: [PATCH v3 1/3] media: mali-c55: add missing of_reserved_mem_device_release()
Date: Fri, 27 Mar 2026 15:07:05 +0000
Message-ID: <20260327150707.256752-1-devnexen@gmail.com>
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
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-57266-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 27E3A346763
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

Fix this by adding an err_release_mem label at the end of the probe
error chain and calling of_reserved_mem_device_release() in
mali_c55_remove(). The remove teardown order is also corrected to call
mali_c55_media_frameworks_deinit() before kfree(), mirroring the probe
init order in reverse.

Fixes: d5f281f3dd29 ("media: mali-c55: Add Mali-C55 ISP driver")
Signed-off-by: David Carlier <devnexen@gmail.com>
---
 drivers/media/platform/arm/mali-c55/mali-c55-core.c | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/drivers/media/platform/arm/mali-c55/mali-c55-core.c b/drivers/media/platform/arm/mali-c55/mali-c55-core.c
index c1a562cd214e..5cb59c70ffc9 100644
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
@@ -846,6 +848,8 @@ static int mali_c55_probe(struct platform_device *pdev)
 	kfree(mali_c55->context.registers);
 err_power_off:
 	__mali_c55_power_off(mali_c55);
+err_release_mem:
+	of_reserved_mem_device_release(dev);
 
 	return ret;
 }
@@ -854,8 +858,9 @@ static void mali_c55_remove(struct platform_device *pdev)
 {
 	struct mali_c55 *mali_c55 = platform_get_drvdata(pdev);
 
-	kfree(mali_c55->context.registers);
 	mali_c55_media_frameworks_deinit(mali_c55);
+	kfree(mali_c55->context.registers);
+	of_reserved_mem_device_release(&pdev->dev);
 }
 
 static const struct of_device_id mali_c55_of_match[] = {
-- 
2.53.0


