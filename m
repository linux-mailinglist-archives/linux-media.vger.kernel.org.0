Return-Path: <linux-media+bounces-32461-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 879C4AB692F
	for <lists+linux-media@lfdr.de>; Wed, 14 May 2025 12:51:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4F16719E0E9E
	for <lists+linux-media@lfdr.de>; Wed, 14 May 2025 10:51:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 793DB272E74;
	Wed, 14 May 2025 10:51:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=emfend.at header.i=@emfend.at header.b="eU4tAhvA"
X-Original-To: linux-media@vger.kernel.org
Received: from lx20.hoststar.hosting (lx20.hoststar.hosting [168.119.41.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46CE4235040;
	Wed, 14 May 2025 10:51:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=168.119.41.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747219880; cv=none; b=D6c/3v/2dRRkq7CKNBejLP3vB4AptLxsULSGC9COpF9U8MUIDs64y8pLE+djnmxH0CpuqL+crpx1hNYMXkfQuxLMEQn2Qd6EvmeLBwJhJIF7aA13Y55nM+iG/+CT9W0pJpfuYGKdph1Y9YI4oLXAdpFCMIZc7M8/OvNhLv7KgRI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747219880; c=relaxed/simple;
	bh=NCaZIeFJ4u0k0+k5VE/wnkRm4+sYfQzsc4g8EclFg3o=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=m5fOjquNXSDqM989wIIO3rapOAL4ppQiMLySOo2crZGX0CO/gg/m3OATk0VCdUdON9AV5prjbfDrUXR7ZwoN+XySbM7h1MdGVAphGIen/JTZcaFEVVxV0htjM8nP+Eo+xb5p8nKqix3anCa3tIl5FdJEcY+QyVRGfLBHVRuYMIQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=emfend.at; spf=pass smtp.mailfrom=emfend.at; dkim=pass (1024-bit key) header.d=emfend.at header.i=@emfend.at header.b=eU4tAhvA; arc=none smtp.client-ip=168.119.41.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=emfend.at
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=emfend.at
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=emfend.at;
	 s=mail; h=Cc:To:Message-Id:Content-Transfer-Encoding:Content-Type:
	MIME-Version:Subject:Date:From:Sender:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=qvsLr7xSZK93gkQDSs7lGScGL5iBFqHkujRlVKie03k=; b=eU4tAhvAhF/xZaBukjqQXdMwJr
	+OVkbFItp/uLeJUF0+aqCo5TehAwVxmS17lljw5wopCbFVd6QByeRM+8ssbPZUUYVEDWumCxdxOBL
	H9/LGTFRZUjG+rsKwWdo4aT2eQENVUncn4eQ3Ur4m4anWRGzQ5b7a30nU6EckcXP48g8=;
Received: from 194-208-208-245.tele.net ([194.208.208.245]:59146 helo=[127.0.1.1])
	by lx20.hoststar.hosting with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.93)
	(envelope-from <matthias.fend@emfend.at>)
	id 1uF9hf-00Bvwv-LW; Wed, 14 May 2025 12:51:11 +0200
From: Matthias Fend <matthias.fend@emfend.at>
Date: Wed, 14 May 2025 12:51:01 +0200
Subject: [PATCH] media: i2c: imx415: Request the sensor clock without a
 name
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250514-imx415-v1-1-bb29fa622bb1@emfend.at>
X-B4-Tracking: v=1; b=H4sIAJR1JGgC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDU0MT3czcChNDU91kM1MLC8tUU1MjQ0MloOKCotS0zAqwQdGxtbUANAR
 3BFgAAAA=
X-Change-ID: 20250514-imx415-c65889e55211
To: Michael Riesch <michael.riesch@wolfvision.net>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Matthias Fend <matthias.fend@emfend.at>
X-Mailer: b4 0.14.2
X-Spam-Score: 
X-Spam-Bar: 
X-Spam-Report: 

Request the sensor clock without specifying a name so that the driver
behaves as described in the imx415 bindings.

Signed-off-by: Matthias Fend <matthias.fend@emfend.at>
---
 drivers/media/i2c/imx415.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/i2c/imx415.c b/drivers/media/i2c/imx415.c
index 9f37779bd6111f434c198ad1cf70c14b80724042..278e743646ea15819d5a79577e786b47c259dbfa 100644
--- a/drivers/media/i2c/imx415.c
+++ b/drivers/media/i2c/imx415.c
@@ -1251,7 +1251,7 @@ static int imx415_parse_hw_config(struct imx415 *sensor)
 		return dev_err_probe(sensor->dev, PTR_ERR(sensor->reset),
 				     "failed to get reset GPIO\n");
 
-	sensor->clk = devm_clk_get(sensor->dev, "inck");
+	sensor->clk = devm_clk_get(sensor->dev, NULL);
 	if (IS_ERR(sensor->clk))
 		return dev_err_probe(sensor->dev, PTR_ERR(sensor->clk),
 				     "failed to get clock\n");

---
base-commit: 9f35e33144ae5377d6a8de86dd3bd4d995c6ac65
change-id: 20250514-imx415-c65889e55211

Best regards,
-- 
Matthias Fend <matthias.fend@emfend.at>


