Return-Path: <linux-media+bounces-57268-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KNqXAXqdxmnrMQUAu9opvQ
	(envelope-from <linux-media+bounces-57268-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 27 Mar 2026 16:08:42 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 218AD3467B7
	for <lists+linux-media@lfdr.de>; Fri, 27 Mar 2026 16:08:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 1808630474A5
	for <lists+linux-media@lfdr.de>; Fri, 27 Mar 2026 15:07:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8FA853101B2;
	Fri, 27 Mar 2026 15:07:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="a3a+2Z4K"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1F6130E82D
	for <linux-media@vger.kernel.org>; Fri, 27 Mar 2026 15:07:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774624044; cv=none; b=B5UtAzEddOak2hwS8tX33m9ULwpcZNID8cr/RuX5E/T/hytX2gvrTTiXBf6zd67KvgioLUixVyPpk9pM8DMAn0X0Pzynwxm9F2OzZiJQt6/WfTlOvHB65JJ9hU4bQ6kTiLtaxc39jCBqIMzMmK9EaW/3o7HMVQnS52d8my6kub4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774624044; c=relaxed/simple;
	bh=wYEw2TX8JiAiDUC5n0ksSoC5QPU5YJHYQs/V8ceIeZo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QHOYZusSRCS0h90hVqIHwD9sZxTG9KdE1MFnddE4cChyDPfO3USCP+e38vSFfCTArjvJEGHnIH4pp1suOEDX1rILYeKmTf+Lqp4dlZUcUjjPyFF0zkCO/jkfBFoJLmQqeeKckFHwobMNIuyqmwC8P50YYUOsPi9BVNyno4ONfN8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=a3a+2Z4K; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-486b96760easo25036805e9.2
        for <linux-media@vger.kernel.org>; Fri, 27 Mar 2026 08:07:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774624040; x=1775228840; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=av/SRQg6XwvYlOTiKgMIdrdvkbBJ/dGVgqDY0w3IlU0=;
        b=a3a+2Z4Kr3TkORgR5vFDOmZEM4KVs3mnuesd8ObC2kycv8xbKb5uXLwM0Pm/Z5x3qA
         b40huQ/seCe0KhIRgovqDqJfv8rv83HEIStY0hbDS8Ksm01DEiX+obDgnZ2l1ilmMxIx
         tMflcWp+mmCKh6rv7D0OcUFXsAtTb5PV9hxi1AU4tD6HnIUgZDn9qbQjAsNJd/vPEtuZ
         deQ4jDbPHrF2hp9LmX8j0boJgPU05SkgtqXbMLlfQH8fIeXv5wZRmhxuKfHn+z+sfe0G
         jjw309J5Ci05FQbwfnOwYn6NwqwyP5xw7l7o58z8kn454jKapet5HERG95/hlPNA233i
         gTLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774624040; x=1775228840;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=av/SRQg6XwvYlOTiKgMIdrdvkbBJ/dGVgqDY0w3IlU0=;
        b=CVvMu0AJCDBM9sQkz4shabi/OOy2nXP4DH0E+jWhCyQ6rsMEUnXZrs87+Z9+ujjlaU
         jkXKYUXfGrBGgN3zwe3qJR9xHtWe1BcXgqEE23ngzODM1/VLyUtf9qFSJd1xcwCqFF6v
         wcOBtwl8Dgc+Kh6FGo0/49GjlVEFsee0Wl7Nhv5GyUw0l74DVe6uVgWSDkDzv0nae4V/
         kwWsXjjMWrBNLItDf3euIzai5ZraSy/4xEZAm6PGVHCfTcjBUHKropICCKKou+UshcWS
         2i/F4BWthSNnwVGEeeQRf2giLl5fsUgUp6pt9DWGNT74F2mUduVNDggxDlM76V4YGySV
         cE/Q==
X-Gm-Message-State: AOJu0YxLu/FEFXwbSwmykOz/uCIpWzktLZV4yu6Ev6pn9PqiitSAOMms
	Wc6k53ReeMBXgk0qoYcsMSHdA4Qisxwib4PFDocb4ZXZ4IFpI9QxLsnMjvgz6Hkgmts=
X-Gm-Gg: ATEYQzxAhknVqMw3LvEMkxS8mV2uenHksrOE1/TDpVvjNipMWXcI0Ida1kNye5x+7kt
	jTsIwxiujyiS/VLi+OWAUm4QQwXyYOv/aYSnDiRNBWY3qnZrjIQHDAqb6UgN6f4rZYkSWZg4pxm
	ESF//yG8jYN1tAeKqjYNVIshGQ7p1PNL3fX6Olp2rR2zlecUXDVIt5Yi8YGMS1TkEoqNDdse3E7
	5jUz3VDh4MVmbdfq5uTuDXRBsBdTCiV0aCiU3bDw57CsfAYScri9uS5svstRpzu3xuHp44NtUE9
	+2oq/T9jJ3zGKcIdr1LkjAzEl4mP/x/V5y4PUDcl3glaaJ20fWuhZPccKFYwn2NjhvU+NRN4l6H
	SA5BPgEdRyODhYFd/atZQiOr2jMt8HYByws++Mt6+r5wJ7WbTTZ27jbosMWymrMBbVxyLmLNz3Q
	Y97ZCWRNtYG9j16fEbBAgdZy9s74vpzmL7vDISfOEydACg/VvornIwPeF0ja+Svb0Gf9GbtnOMP
	SgY7tGMJYXs
X-Received: by 2002:a05:600c:8b31:b0:485:30f7:6e88 with SMTP id 5b1f17b1804b1-48727efabdemr56859805e9.31.1774624039921;
        Fri, 27 Mar 2026 08:07:19 -0700 (PDT)
Received: from dohko.chello.ie (188-141-5-72.dynamic.upc.ie. [188.141.5.72])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48722d40741sm97475055e9.13.2026.03.27.08.07.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Mar 2026 08:07:19 -0700 (PDT)
From: David Carlier <devnexen@gmail.com>
To: Daniel Scally <dan.scally@ideasonboard.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Nayden Kanchev <nayden.kanchev@arm.com>,
	Hans Verkuil <hverkuil+cisco@kernel.org>
Cc: linux-media@vger.kernel.org,
	David Carlier <devnexen@gmail.com>
Subject: [PATCH v3 3/3] media: mali-c55: fix probe error path skipping pm_runtime_disable()
Date: Fri, 27 Mar 2026 15:07:07 +0000
Message-ID: <20260327150707.256752-3-devnexen@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260327150707.256752-1-devnexen@gmail.com>
References: <20260327150707.256752-1-devnexen@gmail.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-57268-lists,linux-media=lfdr.de];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	FREEMAIL_FROM(0.00)[gmail.com];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[devnexen@gmail.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	RCPT_COUNT_SEVEN(0.00)[7];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,cisco];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 218AD3467B7
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

When mali_c55_media_frameworks_init() fails, the goto target jumps to
err_free_context_registers, skipping pm_runtime_disable() despite
pm_runtime having already been enabled earlier in the function.

Fix this by adding an err_pm_runtime_disable label and redirecting the
frameworks init failure to it, so pm_runtime is properly unwound on
that error path.

Fixes: d5f281f3dd29 ("media: mali-c55: Add Mali-C55 ISP driver")
Signed-off-by: David Carlier <devnexen@gmail.com>
---
 drivers/media/platform/arm/mali-c55/mali-c55-core.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/arm/mali-c55/mali-c55-core.c b/drivers/media/platform/arm/mali-c55/mali-c55-core.c
index 38b11d5ba168..f998f914b355 100644
--- a/drivers/media/platform/arm/mali-c55/mali-c55-core.c
+++ b/drivers/media/platform/arm/mali-c55/mali-c55-core.c
@@ -828,7 +828,7 @@ static int mali_c55_probe(struct platform_device *pdev)
 
 	ret = mali_c55_media_frameworks_init(mali_c55);
 	if (ret)
-		goto err_free_context_registers;
+		goto err_pm_runtime_disable;
 
 	pm_runtime_idle(&pdev->dev);
 
@@ -843,8 +843,8 @@ static int mali_c55_probe(struct platform_device *pdev)
 
 err_deinit_media_frameworks:
 	mali_c55_media_frameworks_deinit(mali_c55);
+err_pm_runtime_disable:
 	pm_runtime_disable(&pdev->dev);
-err_free_context_registers:
 	kfree(mali_c55->context.registers);
 err_power_off:
 	__mali_c55_power_off(mali_c55);
-- 
2.53.0


