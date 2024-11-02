Return-Path: <linux-media+bounces-20711-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D87479B9BF5
	for <lists+linux-media@lfdr.de>; Sat,  2 Nov 2024 02:32:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9CDF8282947
	for <lists+linux-media@lfdr.de>; Sat,  2 Nov 2024 01:32:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5D5747F7FC;
	Sat,  2 Nov 2024 01:32:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="el0eZMlT"
X-Original-To: linux-media@vger.kernel.org
Received: from mail.mainlining.org (mail.mainlining.org [5.75.144.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31D42EEB2;
	Sat,  2 Nov 2024 01:32:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.75.144.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730511157; cv=none; b=hLxk7VxtrePNWAAU66PRV5MqESx4x/U4jPTkcYzLubQDAo7Nj3JMVrqgTVDNU0mVUIJ/9UgLhRmAIfFLxetHXFq4M3m9SITgQMBdYZ9UVdEsgq9ld/PUTHZOCioQXfbgSyhEogqP0Vdm2cZ/2on8xpmSwEBbcAn6+ZukRNojkAY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730511157; c=relaxed/simple;
	bh=VbfW68jNk08gKCD1ZXwIfMPeQ+HC/yPqMuv90x2keTg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=AVPF1S/uQWkC9NR4Kznq1QdXSFG4rrBLrkzxeOnfVX3xTdRS/zV09Mi6FbVA/8zy5FMooy161rlvMbuELv22l9r6ti0jTLOV+7DU/FXWVcK3AAZ6vyqMwIZKuoJynC5Qr4ECcwjrTB3+zAtX8h3BYYixuORhXIoltT/5+AkF65Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mainlining.org; spf=pass smtp.mailfrom=mainlining.org; dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=el0eZMlT; arc=none smtp.client-ip=5.75.144.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mainlining.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mainlining.org
Received: from [192.168.0.162] (BC24930C.dsl.pool.telekom.hu [188.36.147.12])
	by mail.mainlining.org (Postfix) with ESMTPSA id D3AA4E45B9;
	Sat,  2 Nov 2024 01:32:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mainlining.org;
	s=psm; t=1730511154;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=p95gbMZ+fmV1xj/HSPj666UzFrBVuOd/R+wP1iPBKDY=;
	b=el0eZMlTujkYWhTXQkGX3bHA95cJViYv0siW3PPDxSY3ihthMuI8tyg0S0bYl4p6R/98z5
	E4fKKtAV5rV4mZpPNRfIRRkYJ7GdqNb9mGPcKxPrDRYO0R79K2Dgp29nKDr+P6v0cezdI7
	X6mekVirDRlL5DNeZiCHkCvCEtdccAgNDA1TBB+HYalgaLW0+yJrGlxp7diWw1WwuKbUPb
	TN6dBXBCTQF/+7MfwSFOO8bF+iBiLBHxj+6yzGNg5tayKu7KiFWwrGLLMRErtYTlt2XiUg
	sGJDMHqUO8eInscubWi+k08hbR++dHS9dD1BnBixpfU29j+GUHqtaSS18N8l/g==
From: =?utf-8?q?Barnab=C3=A1s_Cz=C3=A9m=C3=A1n?= <barnabas.czeman@mainlining.org>
Date: Sat, 02 Nov 2024 02:32:28 +0100
Subject: [PATCH v2 1/3] media: camss: vfe: implement pm domain ops for v4.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20241102-camss-msm8953-v2-1-837310e4541c@mainlining.org>
References: <20241102-camss-msm8953-v2-0-837310e4541c@mainlining.org>
In-Reply-To: <20241102-camss-msm8953-v2-0-837310e4541c@mainlining.org>
To: Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Barnabas Czeman <barnabas.czeman@mainlining.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1730511153; l=1227;
 i=barnabas.czeman@mainlining.org; s=20240730; h=from:subject:message-id;
 bh=VbfW68jNk08gKCD1ZXwIfMPeQ+HC/yPqMuv90x2keTg=;
 b=rWAU8NX8DLlnnvAySF6z/yuhYzvRUX2X6RwTOCUV26qSysXxSX3gQHdpTwHbZkzKK3XRJCUFv
 p4aBIrzB80ID7fl9uUn83V3kUauvGmtIOAqv3UeU8yl138R7SHn6wIb
X-Developer-Key: i=barnabas.czeman@mainlining.org; a=ed25519;
 pk=TWUSIGgwW/Sn4xnX25nw+lszj1AT/A3bzkahn7EhOFc=

MSM8917 and MSM8953 have multiple VFE power-domains they
have to be power on/off explicitly.

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Signed-off-by: Barnabás Czémán <barnabas.czeman@mainlining.org>
---
 drivers/media/platform/qcom/camss/camss-vfe-4-1.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/qcom/camss/camss-vfe-4-1.c b/drivers/media/platform/qcom/camss/camss-vfe-4-1.c
index 1bd3a6ef1d04d8610fd1bee0c22cdbc147c98de5..9a9007c3ff33b40f4c88cd30283f0ad42f8e8d00 100644
--- a/drivers/media/platform/qcom/camss/camss-vfe-4-1.c
+++ b/drivers/media/platform/qcom/camss/camss-vfe-4-1.c
@@ -938,7 +938,10 @@ static irqreturn_t vfe_isr(int irq, void *dev)
  */
 static void vfe_4_1_pm_domain_off(struct vfe_device *vfe)
 {
-	/* nop */
+	if (!vfe->res->has_pd)
+		return;
+
+	vfe_pm_domain_off(vfe);
 }
 
 /*
@@ -947,7 +950,10 @@ static void vfe_4_1_pm_domain_off(struct vfe_device *vfe)
  */
 static int vfe_4_1_pm_domain_on(struct vfe_device *vfe)
 {
-	return 0;
+	if (!vfe->res->has_pd)
+		return 0;
+
+	return vfe_pm_domain_on(vfe);
 }
 
 static const struct vfe_hw_ops_gen1 vfe_ops_gen1_4_1 = {

-- 
2.47.0


