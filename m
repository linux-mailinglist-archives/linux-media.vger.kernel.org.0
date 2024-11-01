Return-Path: <linux-media+bounces-20698-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D82AF9B925E
	for <lists+linux-media@lfdr.de>; Fri,  1 Nov 2024 14:48:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 830331F2226D
	for <lists+linux-media@lfdr.de>; Fri,  1 Nov 2024 13:48:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 522171AA7BE;
	Fri,  1 Nov 2024 13:47:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="ap27q1dZ"
X-Original-To: linux-media@vger.kernel.org
Received: from mail.mainlining.org (mail.mainlining.org [5.75.144.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98A2E1A0B06;
	Fri,  1 Nov 2024 13:47:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.75.144.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730468854; cv=none; b=j9qIA8XQC218y9/F5+SlblkpKAVM8q3CHS/rpkz21Qa1ionnEMG08dlb6bJ4I6njUAPBY9mRVybXNIm6nPHhMDP21yty1f9EGHwIkHsOZGblQ3Q/Yk0XGoVhJLUYRhoTnbqOuPpfTMs2Vv/teu5V/9rOhvvVkQ18irQ4nfSqasc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730468854; c=relaxed/simple;
	bh=bH081dbY2wq+jmqHheBoc805cGu+jE4ti0YSwteNCyM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ZA4RUhp3vBtbccioAsigbQNKQl27wI1wHBwaOmOTjxLqbDfcCTL5/xoMdppaQ5phk4Ltfcq5aIvgzZysKWSa4dLto5MrWB3eOfQKNFHepHzrjJHSiPLYfGOLKtVeU5xEaKujh9rn4lUxm5lF1ttHl0S0sPg8frf+lt+EunhwWtc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mainlining.org; spf=pass smtp.mailfrom=mainlining.org; dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=ap27q1dZ; arc=none smtp.client-ip=5.75.144.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mainlining.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mainlining.org
Received: from [192.168.1.130] (BC24930C.dsl.pool.telekom.hu [188.36.147.12])
	by mail.mainlining.org (Postfix) with ESMTPSA id 84CC7E45B7;
	Fri,  1 Nov 2024 13:47:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mainlining.org;
	s=psm; t=1730468844;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=GGuWgqH+1bwI/HrW60ySCtzBCVJ/NXD7MWi8uWD22S8=;
	b=ap27q1dZSqKYGB6mj8CwDEwLyXHvgykm/VLVwdAyQLbBlcaqquvdGcMZxQRM6O9aLRf9gz
	06KS1f7vmv2OgukLSP5bRoKb9aj5AaUvxwB20ePSfdQbFXhsV/UaY2119yXiMr8Gj5uxyY
	tgLJwtqqI8NUQVrMxc/A5dgpjB6zBC/t7p4xYDWaGUopo44ShEl+L/XJXwG7a0rD8hC8K3
	2pB9jZHkVgsz32GEFZ7PKcbR4i5WJAu4dGR95k2fNQXLzYe+5TUWZvYS88KFXwV7EcgrR7
	fu1FPSTObK15//cSebPrP9s9Ma4y/RAxQu14NDlDskMEP/VyvRv94jg0dRLULg==
From: =?utf-8?q?Barnab=C3=A1s_Cz=C3=A9m=C3=A1n?= <barnabas.czeman@mainlining.org>
Date: Fri, 01 Nov 2024 14:47:22 +0100
Subject: [PATCH 1/3] media: camss: vfe: implement pm domain ops for v4.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20241101-camss-msm8953-v1-1-4012559fcbc2@mainlining.org>
References: <20241101-camss-msm8953-v1-0-4012559fcbc2@mainlining.org>
In-Reply-To: <20241101-camss-msm8953-v1-0-4012559fcbc2@mainlining.org>
To: Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Barnabas Czeman <barnabas.czeman@mainlining.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1730468843; l=1166;
 i=barnabas.czeman@mainlining.org; s=20240730; h=from:subject:message-id;
 bh=bH081dbY2wq+jmqHheBoc805cGu+jE4ti0YSwteNCyM=;
 b=ZSkafLchsH5pdS/ACB+Z2AVt0O0ndUcRaHz3NfmH+Ns2ngoTLERQ2vpryv9siAhcrjyduKZoX
 k0Qer9Yn2l7B+OBVpkOMkgQG7s3UvFHbTr7u14Z/rsdONwYlFwlLcHj
X-Developer-Key: i=barnabas.czeman@mainlining.org; a=ed25519;
 pk=TWUSIGgwW/Sn4xnX25nw+lszj1AT/A3bzkahn7EhOFc=

MSM8917 and MSM8953 has multiple VFE power domains they
have to be power on/off explicitly.

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


