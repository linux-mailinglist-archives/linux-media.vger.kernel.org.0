Return-Path: <linux-media+bounces-66595-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id L0P9Jd1ISWoT0AAAu9opvQ
	(envelope-from <linux-media+bounces-66595-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sat, 04 Jul 2026 19:54:37 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 30D8270821A
	for <lists+linux-media@lfdr.de>; Sat, 04 Jul 2026 19:54:37 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=erba5iI9;
	dmarc=pass (policy=none) header.from=gmail.com;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-66595-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-media+bounces-66595-lists+linux-media=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id BCBA23028F0B
	for <lists+linux-media@lfdr.de>; Sat,  4 Jul 2026 17:53:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2B1863749F6;
	Sat,  4 Jul 2026 17:53:57 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A9AF29D265
	for <linux-media@vger.kernel.org>; Sat,  4 Jul 2026 17:53:55 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783187636; cv=none; b=ChQGiNjZvEHOwEbTWFOoEeyY7QyuVaM7+gmFxj8Vc8B6vZRtd9Decx6sOa7vr0bwG1RY983/5x2ZaqFOXfcujLJLIKFU57OKvdr9nmSUz9k19roB8nQoDmvvda2qHmeEdxtrrH/eq/r4NBYsTZ9nemfQYy5xzTtDhn/L8ydRG1s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783187636; c=relaxed/simple;
	bh=nqVTW6DH4ASUkqta93gyc9UKrqMdUX7EO+mifFx2woo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DoGVKFaRePWLF6gkUX5dXieDeFyeO2/3JpJIz7Kim25Q/kxTgy4GgDWktHl7iac/eXNgmKWrhzJlaQwjk723kt/GSSma2F/ajtSyffctziEjuauUH5+6w9keaU4B2oDBXta9XrzhMiRR5Z4Uxr0riGr1QB6TQTFpX2HgJdq44RI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=erba5iI9; arc=none smtp.client-ip=209.85.216.46
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-37df72c9984so1477525a91.3
        for <linux-media@vger.kernel.org>; Sat, 04 Jul 2026 10:53:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783187635; x=1783792435; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6KZPajTGZcSmUhFo1x8c8s6SejNqBr3EonFM7GD4NfQ=;
        b=erba5iI90Ihw06gOb4xgFcV22XBzSClfyDXy+RyEDHQcGE4gLQsUunK/RhSH1LLTsh
         ZfNhAi/VWi/z379ql3LDs4tSGgxbfo2/obOHsHl9MRAmn3nw/Pqn9bWpKtdSt4zVikxy
         j6wCdxxp1nd+Md1zlnHNRLV0IRv57wZXFA5/2O0CbGXg6ZWDeKs8S8gSg5n5pV9EIYVC
         0VEML8wcbmsqvWtNZXZhELGYX0HsXbqN53pXi3tezD4cq+yUei321aao47Rr+B1L4/XF
         HCWYlrK9CdX55djaqrdIpn4pKMd1+BQnW71o9QJIQB3cxvvCcNjlHqxuwmRhROw1Pl0A
         bwSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783187635; x=1783792435;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=6KZPajTGZcSmUhFo1x8c8s6SejNqBr3EonFM7GD4NfQ=;
        b=fJ34wWWYCy1ftzQAOBnaLjDKmLpWAT4Ngxt9DRLgakoeZ8e+6HujeVE6SfU/348/Pm
         NTtnKsabvDUnrY8d7yBrIHMS4US3Ri0yBLD5fpkUJIv1rMjNdUUSlGqJ+2lxl3ORb9VP
         XB/KjFt1AMSdQm3g/+iya+wJWmW2o+OWpAkQpyiuvh+0kwsuKuk3ydiNWcBhDs5JhJ6C
         ldtfa9Xs463W6IF/qMxJPgzcPsJGiurAq3yDph142W4XOm61+y9VYPlLny056FSWufRa
         7Vb7yOdrbqZ6Qv+YKqMf2h4CQp6xVx9jfdIEGIk0B9Pz/WijPC/2H5lH043bKGzgGMJI
         pP8A==
X-Gm-Message-State: AOJu0YzCi5d25vjHKJgu/puf5pk4OmyppZDPZfR6HdnosY4AIOKRPfwH
	yaHcFFDy7DG1rATlwM7ER350eLAhrZ+zG781256XMUvLZyjzqDAIvD6GNSqtGTXs
X-Gm-Gg: AfdE7clos1hTyqXN4Lx5vLBS27zrIhYuDpiZmTKXcRWsYDcF/ZHr3qV49PQD/X0uV5p
	4TdAa7pbX3mrn3pcTtrnbmnSs/kK39CaWyj+sAZe5GEQjszmLIuM/flCiK+06ZeQITmJfud9Mw5
	FpdYRA7Z4sYBTUT0vJvSUltaIsxqIIaW86jAYWADCnWgkxxfW8Evk5dalr70BSpJq8aOoi0St7C
	P5gXcqdqFFCkxDvgkbTvi+gVZtec+yv1JTOA8hyFYwGFLr1xTRJK3H9GpH/JfFduYoACaZIDmiJ
	eKtv4arDnNSG+Ty5KtoBdmNi0Dnd35k9H0HwMzb+WtYpMVSREtsjil6UzaK+SWP8yCYFPQvwzXO
	qJ/GgBzVmu+KvS5D+//xrTchHsVmjVTzqVNf7UWMJZs3JEs/TeWDTNzcAA/SFfKKvffZfrQu9E5
	enUGHZi9JO+//L8M4OOTyFj15FurJobVrFkvQDPCcAIPTLX83DoMUvnA==
X-Received: by 2002:a17:90b:1802:b0:380:83fc:4315 with SMTP id 98e67ed59e1d1-3829f007711mr3908482a91.21.1783187634777;
        Sat, 04 Jul 2026 10:53:54 -0700 (PDT)
Received: from localhost.localdomain ([49.207.223.101])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30f39e07e0bsm15588749eec.30.2026.07.04.10.53.50
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 04 Jul 2026 10:53:54 -0700 (PDT)
From: Biren Pandya <birenpandya@gmail.com>
To: linux-media@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	niklas.soderlund@ragnatech.se,
	mchehab@kernel.org,
	geert+renesas@glider.be,
	magnus.damm@gmail.com,
	laurent.pinchart@ideasonboard.com,
	jacopo.mondi@ideasonboard.com,
	Biren Pandya <birenpandya@gmail.com>
Subject: [PATCH v3 1/4] media: renesas: rcar-csi2: Add missing media_entity_cleanup()
Date: Sat,  4 Jul 2026 23:16:40 +0530
Message-ID: <20260704174638.66302-7-birenpandya@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260704174638.66302-6-birenpandya@gmail.com>
References: <20260704174638.66302-6-birenpandya@gmail.com>
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
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,ragnatech.se,kernel.org,glider.be,gmail.com,ideasonboard.com];
	TAGGED_FROM(0.00)[bounces-66595-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[birenpandya@gmail.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:linux-media@vger.kernel.org,m:linux-renesas-soc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:niklas.soderlund@ragnatech.se,m:mchehab@kernel.org,m:geert+renesas@glider.be,m:magnus.damm@gmail.com,m:laurent.pinchart@ideasonboard.com,m:jacopo.mondi@ideasonboard.com,m:birenpandya@gmail.com,m:geert@glider.be,m:magnusdamm@gmail.com,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[birenpandya@gmail.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,renesas];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 30D8270821A

The probe error paths and the remove function fail to call
media_entity_cleanup() upon teardown.

While currently a no-op in most cases, calling media_entity_cleanup()
is an API requirement for entities initialized with media_entity_pads_init()
to prevent memory leaks.

Add the missing media_entity_cleanup() calls.
Signed-off-by: Biren Pandya <birenpandya@gmail.com>
---
 drivers/media/platform/renesas/rcar-csi2.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/media/platform/renesas/rcar-csi2.c b/drivers/media/platform/renesas/rcar-csi2.c
index 7305cc4a04cb..f9c818b0faf7 100644
--- a/drivers/media/platform/renesas/rcar-csi2.c
+++ b/drivers/media/platform/renesas/rcar-csi2.c
@@ -2631,6 +2631,7 @@ static int rcsi2_probe(struct platform_device *pdev)
 	v4l2_subdev_cleanup(&priv->subdev);
 error_pm_runtime:
 	pm_runtime_disable(&pdev->dev);
+	media_entity_cleanup(&priv->subdev.entity);
 error_async:
 	v4l2_async_nf_unregister(&priv->notifier);
 	v4l2_async_nf_cleanup(&priv->notifier);
@@ -2646,6 +2647,7 @@ static void rcsi2_remove(struct platform_device *pdev)
 	v4l2_async_nf_cleanup(&priv->notifier);
 	v4l2_async_unregister_subdev(&priv->subdev);
 	v4l2_subdev_cleanup(&priv->subdev);
+	media_entity_cleanup(&priv->subdev.entity);
 
 	pm_runtime_disable(&pdev->dev);
 }
-- 
2.50.1 (Apple Git-155)


