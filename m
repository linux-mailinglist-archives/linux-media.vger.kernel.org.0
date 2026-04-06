Return-Path: <linux-media+bounces-58138-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IBJoGmIw1GmUsAcAu9opvQ
	(envelope-from <linux-media+bounces-58138-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 07 Apr 2026 00:14:58 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C02833A7C74
	for <lists+linux-media@lfdr.de>; Tue, 07 Apr 2026 00:14:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id DD9F6303FF36
	for <lists+linux-media@lfdr.de>; Mon,  6 Apr 2026 22:14:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5F77F39DBDE;
	Mon,  6 Apr 2026 22:14:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sqAszjHW"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com [209.85.208.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49237358363
	for <linux-media@vger.kernel.org>; Mon,  6 Apr 2026 22:14:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775513691; cv=none; b=ZEwas7I4liJ13oxmOV1ez1rbYdNCplRJxsGr7pI0oU8ISr/LJKkUgBgyRWa29OuDIzQD6WRrxUPwGLCYm3zADdv19N1GeqnWsHIzGem92onm6Xyzrgs3Pq4Ney6PXRmHJMkpqMBjms4FppdYmlTeCph1qYcm0INomq33d8xHpwk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775513691; c=relaxed/simple;
	bh=lmqzuOQqgNOAyPi5swfvuKRWX8HE/D1ZIzOxJVc5ihw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ptpKkIzpq9EaOusIvHnP5mg+YK70SnGA3AAfRy5pGnHj67Z6PaevllVieUfNM3ugn75gZ3KMl3emlLYdacXb2p1fqGu+t2FQq7z+R/SA/mw2j4ZG/b1oD8MVPI65lVtrXnWLTp6pZDa2IX56t/IQSCwMEIsaj31rwv7sVMS/YVQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=sqAszjHW; arc=none smtp.client-ip=209.85.208.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-38def541b0bso19388981fa.1
        for <linux-media@vger.kernel.org>; Mon, 06 Apr 2026 15:14:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775513688; x=1776118488; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=tpN+/b8lu9/yvEaNtHU/WVfOxILX+ZQUzWAcfY4lXzo=;
        b=sqAszjHWXf5lGhi6zo7WO4YgnkPMfqf8f8uDL349ZpBW8BtQCCQIClyI2BUDJFhY6C
         Xe3IQmpoMqtHOjpHUFI0nDCHp42oxWrcAq19egCyUQduGCSzH2VplvKEM/XMpwvrFB/t
         sd+fydl/QUf6ZzlVDRusRsLkPM9RX5V29e1weC3jFFX45Xkubx2S467liMk5tRnHdv4w
         DtPE0OGFccGDqmhrGkGatRO4AKN0MKEtF8RsUdFf75AiCFLTirSSWTWpkQMXMwuIMNBi
         Eqb0fvzwmms3r57rGZzFysP1JGPQVkPH6HQwO7iTf3uwR+IoRfzXdrIsmtbtJOaaoHml
         t0CQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775513688; x=1776118488;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tpN+/b8lu9/yvEaNtHU/WVfOxILX+ZQUzWAcfY4lXzo=;
        b=FaCzSXYL0sMmCmWQHsqNLDJYF+TOfzMAshYvFJbcFLLve22ZKKlHe1uEtO+zT4NjuE
         DizmUBqEXsbjDBf52cGYXLi9Nuh1/f+UzeAsPf/0lxQOzoAh6aL4KODjFWDFOB/8m4oE
         Oj5fMJ1nENbmd0nbGDG9JteXFKqVnGwS2SveTD/De2wLekGnTnlk0HvQXH0WqAye6eEY
         f1duqHHUkjvkbW0QoSicGRroxo8ByU63B6R7X06+F1RVHdUAmq+Fe1eHLGTlJoEkhRKM
         KPz4zo+E1E3A7ZHQZriBKRm+a5vOg8XsHjkccuAslNE1kztlgTjT3XFrxUFebGl2gjVa
         bH1g==
X-Forwarded-Encrypted: i=1; AJvYcCUL2Wg2U36q/SN1Q6KOT4lNSSeN1KHWmh+3LqowKTyP7fBvVPjlJ6Gv1rXu4v2lDFq+z7OxmuNLJ4cUwg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyBL8LoS0T9ymtbI4+Mn3a1V7HsQJnWqtlnbmUg0lRewpV2octW
	1514QPJeN2VocESYf1xjVhQJe0kCoZHBS48vz6f/fvuZhTk0ESrfxAi5
X-Gm-Gg: AeBDievaqY5TNJhZOIAU0RNlH+FwNY79bkdLfUMUqXVx6xUmkqf602WAg4LdopbTGo3
	fecBHGNoQi7lviWL/As0Xd5dqdcSJL9mS5WgAECiISj1SP6PozL6AmrVq/aikPHyBN+c1mDn8XM
	MImTdundbH1Eju2dtj65E/27nU0bsoGLHDEj5beIlHFzrB2WuhWR4C3PSFtECLrGBTQj1gebzXx
	hfymYOPVSQOni4AvmSSahHEF5XLf+5aWLqDBCueMjeFItI8S3fpqmJCbKnIQc4UdH/zsQKzT1Z5
	TJED6ZjzvCOKbA1M+K4HkMJaXfX0+FR0/sPyHgLbwmfYE8YBnntJPwDSSAC/f+nBTkouFcontJ3
	iJOCNDivyUrNf6zHNEBMQbm2yUlUWJuR6OwF0fK8FrAlikEDCJOWDzkEJvaaUAICErtePemQcUJ
	8wErj+1jW5Ea0yuqFArLYiVVs7bA==
X-Received: by 2002:a05:651c:1b13:b0:38b:f0f0:e38f with SMTP id 38308e7fff4ca-38d91d78c88mr39211001fa.2.1775513688308;
        Mon, 06 Apr 2026 15:14:48 -0700 (PDT)
Received: from new-nest ([94.19.228.143])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38cd2108c9dsm31924801fa.21.2026.04.06.15.14.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Apr 2026 15:14:47 -0700 (PDT)
From: Andrey Skvortsov <andrej.skvortzov@gmail.com>
To: Dan Carpenter <error27@gmail.com>,
	Maxime Ripard <mripard@kernel.org>,
	Paul Kocialkowski <paulk@sys-base.io>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Hans Verkuil <hverkuil@kernel.org>,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Andrey Skvortsov <andrej.skvortzov@gmail.com>
Subject: [PATCH v2] media: cedrus: Fix failure to clean up hardware on probe failure
Date: Tue,  7 Apr 2026 01:14:40 +0300
Message-ID: <20260406221440.3721863-1-andrej.skvortzov@gmail.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-58138-lists,linux-media=lfdr.de];
	FREEMAIL_FROM(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org,sys-base.io,linuxfoundation.org,sholland.org,vger.kernel.org,lists.linux.dev,lists.infradead.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andrejskvortzov@gmail.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	NEURAL_HAM(-0.00)[-0.994];
	TAGGED_RCPT(0.00)[linux-media];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Queue-Id: C02833A7C74
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Samuel Holland <samuel@sholland.org>

If V4L2 device fails to register, then SRAM still be claimed and as a
result driver will not be able to probe again.

 cedrus 1c0e000.video-codec: Failed to claim SRAM
 cedrus 1c0e000.video-codec: Failed to probe hardware
 cedrus 1c0e000.video-codec: probe with driver cedrus failed with error -16

cedrus_hw_remove undoes everything that was previously done by
cedrus_hw_probe, such as disabling runtime power management and
releasing the claimed SRAM and reserved memory region.

Signed-off-by: Samuel Holland <samuel@sholland.org>
Signed-off-by: Andrey Skvortsov <andrej.skvortzov@gmail.com>
Fixes: 50e761516f2b ("media: platform: Add Cedrus VPU decoder driver")
---

Changes in v2:
 - remove duplicate 'in-body' From: record
 - add more technical details to commit message

 drivers/staging/media/sunxi/cedrus/cedrus.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/staging/media/sunxi/cedrus/cedrus.c b/drivers/staging/media/sunxi/cedrus/cedrus.c
index 1d2130f35fffc..ee0e286add67d 100644
--- a/drivers/staging/media/sunxi/cedrus/cedrus.c
+++ b/drivers/staging/media/sunxi/cedrus/cedrus.c
@@ -477,7 +477,7 @@ static int cedrus_probe(struct platform_device *pdev)
 	ret = v4l2_device_register(&pdev->dev, &dev->v4l2_dev);
 	if (ret) {
 		dev_err(&pdev->dev, "Failed to register V4L2 device\n");
-		return ret;
+		goto err_hw;
 	}
 
 	vfd = &dev->vfd;
@@ -538,6 +538,8 @@ static int cedrus_probe(struct platform_device *pdev)
 	v4l2_m2m_release(dev->m2m_dev);
 err_v4l2:
 	v4l2_device_unregister(&dev->v4l2_dev);
+err_hw:
+	cedrus_hw_remove(dev);
 
 	return ret;
 }
-- 
2.51.0


