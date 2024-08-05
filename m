Return-Path: <linux-media+bounces-15804-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 42064948509
	for <lists+linux-media@lfdr.de>; Mon,  5 Aug 2024 23:51:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 93EC81F2375B
	for <lists+linux-media@lfdr.de>; Mon,  5 Aug 2024 21:51:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7276316E870;
	Mon,  5 Aug 2024 21:51:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="VsaEc5W4"
X-Original-To: linux-media@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C8DC16B39C
	for <linux-media@vger.kernel.org>; Mon,  5 Aug 2024 21:51:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722894697; cv=none; b=k0DrgRl6HWkUYdFpeZNE/xLuzZP9xINaFnjLkgkuMqkJFZNfQTP9Fr3zYx12uyx73pMWeUMv0wGhQO/s/D3a5QCKLuOKVL3NDDiGpooH7TCWPIMzQeNT2d/b85J7NbbK8NkfgF/auSJOSMeeBJtQ4XA6Kqg3fFqgwMZ7sdVW4Bg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722894697; c=relaxed/simple;
	bh=6Dw6/Wq/G9/iJ+th9YS1xD5AfeJke+HEoIUu5IoZ92w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=b0wNglLwH6Z9fOE/7lDeOhv48rIMLufQlpgLPrBNR8EKETTs9lf1jNi47WVxgb//x6Xuk9ciOCTC77hFKj7gv5FZRuaNFpwGsfhBgE9nEVdaDk7J15miX4zLbB/7gbb/A7yTL/+fIk3VzmQLAyPq9CRmAL44YTuV4kMreKu0H5g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=VsaEc5W4; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	 s=k1; bh=7loi66eWoM4pglv0+trIoRx+8rGoC+Ly/55TuGaEhSQ=; b=VsaEc5
	W46msxU/DpeVVdyZcGKvIzaPRjQc2z2+g1hbevug0L0W8S1DRX06eh4J2MTNPmml
	9hdhpI3j2KNR74ijArlBYUQ2ZAPrsjstzFc45MS0xU6Zf5AfMhMftZpfXbTiPXOO
	JiQ3JgJ++YOmTBzmaVYn8UM+oQQKw/NTqrIB5Y5K9TscE6WDgD7089yZuzAQCAeg
	h2tTkco086vicAb5WI3rlTQDpIMyj3tgzojydU3Qkb/sLdtnB3QWe9LPIy4x/TZH
	qb9Bqoos78f3F5n8V5iDD7daRm4thzO0uwXltKJMGTGQM1yiVdeqSAqezzEoffqL
	xlAfwk9LPj4j7wYg==
Received: (qmail 18128 invoked from network); 5 Aug 2024 23:51:27 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 5 Aug 2024 23:51:27 +0200
X-UD-Smtp-Session: l3s3148p1@qPPNrfYe8pRehhYC
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-media@vger.kernel.org
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Eugen Hristev <eugen.hristev@collabora.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v2 2/8] media: atmel-isi: use 'time_left' variable with wait_for_completion_timeout()
Date: Mon,  5 Aug 2024 23:51:15 +0200
Message-ID: <20240805215123.3528-3-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240805215123.3528-1-wsa+renesas@sang-engineering.com>
References: <20240805215123.3528-1-wsa+renesas@sang-engineering.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

There is a confusing pattern in the kernel to use a variable named
'timeout' to store the result of wait_for_completion_timeout() causing
patterns like:

        timeout = wait_for_completion_timeout(...)
        if (!timeout) return -ETIMEDOUT;

with all kinds of permutations. Use 'time_left' as a variable to make the
code self explaining.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 drivers/media/platform/atmel/atmel-isi.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/media/platform/atmel/atmel-isi.c b/drivers/media/platform/atmel/atmel-isi.c
index c1108df72dd5..5c823d3f9cc0 100644
--- a/drivers/media/platform/atmel/atmel-isi.c
+++ b/drivers/media/platform/atmel/atmel-isi.c
@@ -242,7 +242,7 @@ static irqreturn_t isi_interrupt(int irq, void *dev_id)
 #define	WAIT_ISI_DISABLE	0
 static int atmel_isi_wait_status(struct atmel_isi *isi, int wait_reset)
 {
-	unsigned long timeout;
+	unsigned long time_left;
 	/*
 	 * The reset or disable will only succeed if we have a
 	 * pixel clock from the camera.
@@ -257,9 +257,9 @@ static int atmel_isi_wait_status(struct atmel_isi *isi, int wait_reset)
 		isi_writel(isi, ISI_CTRL, ISI_CTRL_DIS);
 	}
 
-	timeout = wait_for_completion_timeout(&isi->complete,
-			msecs_to_jiffies(500));
-	if (timeout == 0)
+	time_left = wait_for_completion_timeout(&isi->complete,
+						msecs_to_jiffies(500));
+	if (time_left == 0)
 		return -ETIMEDOUT;
 
 	return 0;
-- 
2.43.0


