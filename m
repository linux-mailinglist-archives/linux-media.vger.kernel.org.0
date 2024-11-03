Return-Path: <linux-media+bounces-20729-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C2609BA4EE
	for <lists+linux-media@lfdr.de>; Sun,  3 Nov 2024 10:46:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C429EB21A6F
	for <lists+linux-media@lfdr.de>; Sun,  3 Nov 2024 09:46:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 769FB16D4EF;
	Sun,  3 Nov 2024 09:46:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="T1s1mckS"
X-Original-To: linux-media@vger.kernel.org
Received: from mail.mainlining.org (mail.mainlining.org [5.75.144.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6060E142633;
	Sun,  3 Nov 2024 09:46:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.75.144.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730627161; cv=none; b=gAnENhOhzZvn27YnEproso3DCdu/aMfTPOhWFdhWbjLhlbUmeRgFl6GNUKdhQIsrGT+CxnGdp+6rXLcKMmZqXf/5uqj5deH+mPMUVP5wngsKZYWDzevuJJagz+1F+2umehSd2Yc8jUxfqEWodwoM6rAbRKyge0qLhtHzrHEOuAY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730627161; c=relaxed/simple;
	bh=bcZwjQcavw1ccUZa6lyJZyfRtl56H37sgRXQUOyswu0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=GITrgB1QGRDVxQvuKwLA96Dh2YKak2vPB3H6a+one9ppsuSY5fweNawJoFvL5hX9yIqeHf5dckzCfefnLXKR5KOWTZjLaEVte6nRO5jyXRlYr4kqijD4cO7ZlEZY2oR9Np1vplTwdHztUSC6ULqqyVvYXB7x1E1G2DP1+wAxOhE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mainlining.org; spf=pass smtp.mailfrom=mainlining.org; dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=T1s1mckS; arc=none smtp.client-ip=5.75.144.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mainlining.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mainlining.org
Received: from [192.168.0.162] (254C1CEE.nat.pool.telekom.hu [37.76.28.238])
	by mail.mainlining.org (Postfix) with ESMTPSA id 8655EE45BC;
	Sun,  3 Nov 2024 09:45:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mainlining.org;
	s=psm; t=1730627158;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=BTM0GqOuxYgyzxSjgXUar++pZMXdB5+ioIXljI/N+qk=;
	b=T1s1mckSxGIFQ30b4oPnkikwmMI9MQv8u07/Tb6wSc0vTiZ24LewlytACZCRmPGjx6Vdr2
	V8TeuTbJ15tdSrFbjpTWXQZwe9jXYA+1v9/vxe0kGwXF7Ypsfli6Jrt9TTnmoTeeA5Reyp
	3y3SLndboUYdDH/UoDrX0zoIN9zSIJiA+AB5rx2yNlEMCdkl3U6g7eQF/xdI9GOep1G4B0
	n7/8b6eAy7c/T1Cs0jKQLRvPrzv8lE7UpnGnMWwuNejSaGNu5fB6/jDVf5QtR8LlIXNH3D
	EjTdRvp90Pv+gaZzh1T0Xaha3hQB6C5qn6U1RcP5P5AszB5cqTWGXLtCanFXGQ==
From: =?utf-8?q?Barnab=C3=A1s_Cz=C3=A9m=C3=A1n?= <barnabas.czeman@mainlining.org>
Date: Sun, 03 Nov 2024 10:45:34 +0100
Subject: [PATCH v4 1/3] media: qcom: camss: implement pm domain ops for VFE
 v4.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20241103-camss-msm8953-v4-1-48d0ec75958d@mainlining.org>
References: <20241103-camss-msm8953-v4-0-48d0ec75958d@mainlining.org>
In-Reply-To: <20241103-camss-msm8953-v4-0-48d0ec75958d@mainlining.org>
To: Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Barnabas Czeman <barnabas.czeman@mainlining.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1730627156; l=1229;
 i=barnabas.czeman@mainlining.org; s=20240730; h=from:subject:message-id;
 bh=bcZwjQcavw1ccUZa6lyJZyfRtl56H37sgRXQUOyswu0=;
 b=dK/ZKPSihwxYqXPgZDxOkuEKt3d5MIOXvPU7S2oK4c9k05RV2Y0RMHWiYMZW85JXP3cqoF+OM
 s/azMDlNCa+AxGoX0w1BoWpLO0+MIKrQLnlrCKflu/9qdRzekaj+vMe
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


