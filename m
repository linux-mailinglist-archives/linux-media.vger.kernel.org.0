Return-Path: <linux-media+bounces-20720-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A162E9BA2CA
	for <lists+linux-media@lfdr.de>; Sat,  2 Nov 2024 23:40:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 598C21F22707
	for <lists+linux-media@lfdr.de>; Sat,  2 Nov 2024 22:40:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 033C31AD3E0;
	Sat,  2 Nov 2024 22:39:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="cJvGqrK5"
X-Original-To: linux-media@vger.kernel.org
Received: from mail.mainlining.org (mail.mainlining.org [5.75.144.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A681216087B;
	Sat,  2 Nov 2024 22:39:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.75.144.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730587185; cv=none; b=CdJn5XIMPxuMugy99ox/OmmW7iBWL+uMadeRy2iUoRl3VMQ5b0mrdi4oDEx4U2QpzkcoKJof4Q/sDXcySJ8JDZbdPUKxDZEwMKPL3CcqOoWPSB3BAPFPaBmaxH6uncYxYCHwZhI7lsRj33yV9W6a162gGfg5p290jEbP5M0vnus=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730587185; c=relaxed/simple;
	bh=bcZwjQcavw1ccUZa6lyJZyfRtl56H37sgRXQUOyswu0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hQ3JJ1Xs/SjOBzkRTqrHW6zYecTjK6fZLZF1rrlk2bnf81e6zI4nVEDhKKJ8T/Q55jumhd1nhUj71euBfLfNIUhLKWM9aidFcMmvwUNj+5D6PDVfLPGMHLPQzZtcA63k0kTZ35MVUshOIiclZ0l5FmJGuD4Rxi0DBmc/zBe8uQs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mainlining.org; spf=pass smtp.mailfrom=mainlining.org; dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=cJvGqrK5; arc=none smtp.client-ip=5.75.144.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mainlining.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mainlining.org
Received: from [192.168.0.162] (254C1E29.nat.pool.telekom.hu [37.76.30.41])
	by mail.mainlining.org (Postfix) with ESMTPSA id 79D3FE45BB;
	Sat,  2 Nov 2024 22:39:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mainlining.org;
	s=psm; t=1730587176;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=BTM0GqOuxYgyzxSjgXUar++pZMXdB5+ioIXljI/N+qk=;
	b=cJvGqrK5X/uoe/7y0R8i/N5vPaEBNx584zvYLEMQgTlZ413lSbySJCl5mD+wD2yJUdZINM
	xXbW9iz9taUYeaSvRihoTQcv3ymlgeoBbSL48GPCMZTqJnI9ITKMV8CwosCFxQe1PHIWoy
	xyhTY7usOBnJYWwzAHOvOdoLYKz/kDcJ4LGn0liAKjI3O3mC3x3/YgKocYqpJ9ofwj8nHI
	j6I7e8WrLQ9AEnf03DJZnrfjwUsGrH7dSPRrWk3J+evciATT/3dDjwRO5nPhkn99KrnEOe
	mm1KdBu8HI6Et1aMjDHXZxCD+En3mxg22UN6ev7AvNILBT8rP4HWthMUDeMAzQ==
From: =?utf-8?q?Barnab=C3=A1s_Cz=C3=A9m=C3=A1n?= <barnabas.czeman@mainlining.org>
Date: Sat, 02 Nov 2024 23:39:12 +0100
Subject: [PATCH v3 1/3] media: camss: vfe: implement pm domain ops for v4.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20241102-camss-msm8953-v3-1-7041c9fa7a58@mainlining.org>
References: <20241102-camss-msm8953-v3-0-7041c9fa7a58@mainlining.org>
In-Reply-To: <20241102-camss-msm8953-v3-0-7041c9fa7a58@mainlining.org>
To: Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Barnabas Czeman <barnabas.czeman@mainlining.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1730587174; l=1229;
 i=barnabas.czeman@mainlining.org; s=20240730; h=from:subject:message-id;
 bh=bcZwjQcavw1ccUZa6lyJZyfRtl56H37sgRXQUOyswu0=;
 b=7cYlupUfSbtIvnjb45zD68CGpoSYpLo/uzqx89MxlvAOE6pGWm/k8K4FDY63Y5SnS4909/wjz
 JMRLyfxwyi9B7Bsec8pf3UkyJwKlFX3/phh4vwOIBnExEBPs2AgZPEl
X-Developer-Key: i=barnabas.czeman@mainlining.org; a=ed25519;
 pk=TWUSIGgwW/Sn4xnX25nw+lszj1AT/A3bzkahn7EhOFc=

MSM8917 and MSM8953 have multiple VFE power-domains they
have to be powered on/off explicitly.

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


