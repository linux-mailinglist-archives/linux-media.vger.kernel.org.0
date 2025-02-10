Return-Path: <linux-media+bounces-25905-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E669A2EBB6
	for <lists+linux-media@lfdr.de>; Mon, 10 Feb 2025 12:47:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5DF901885BDB
	for <lists+linux-media@lfdr.de>; Mon, 10 Feb 2025 11:47:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E315F1F3D50;
	Mon, 10 Feb 2025 11:46:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FmDPoQfz"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B67B1F4E25;
	Mon, 10 Feb 2025 11:46:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739187995; cv=none; b=XQSfl3IkIAD1nd0hHdvh8wa/nU56b84J5NtPiswigMiumKp098K09sJagM8p/OSRUf184bGB06njYHPzE2wW4UxXUPuFkbOdQRgtzgodUm7I56tfbpQixoB6XaRghSMPnyDV/K33V2Ed5noemBPfzAhIjm2FfCEMfCVoLLnQpew=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739187995; c=relaxed/simple;
	bh=m0aKVrk7tFoMOEcANYZLY8kSPo/fi11DmlNFeIDignY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=RwhkqVpe+O8J0IoCdp7YvytUq+eDqp8i9fEE0yy92aJQa7HaEbp4odJJ8v0riyTYIX/Z9PPAi1HWfimAtGHG8kWJv4QOgKo0aEa0/o5nuXl+m5jjMhAHqgu+sdb1De+PLLUoKmZf/IevAHUkwZk9r0eDlqyYAxkmgA3xCBEEokg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FmDPoQfz; arc=none smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-5de6069ceb5so3020546a12.1;
        Mon, 10 Feb 2025 03:46:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739187992; x=1739792792; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nz3szSsYkvkaaHse2i8ixxQzSkMQ/TCVXddNYl+k4PM=;
        b=FmDPoQfz9lcUMsj2wc2vHeTXrQe6sAoy+i89jgfyy8LRteYdR4L/eQ5t+k1qam4rhU
         wUL3OhYIXWkYA1/LfJvIx6j6iQ66w9ZcFrVO9Et/ISXgd1Dt530syIGhl12oUxTFkMxu
         iKP2M4WsDrOKaLzebjhiw4JCs38I6/eBlfSmnbPTXbmshygkODEaJ/rM1poVyykuWnJt
         8jESdxk2/rjL7JXquppk8Q6ljj+rhgC2wDZe3i5H8AOMSp4AiTwBL8fMYok70G6mwSjU
         ALTNd1UW5ldQ1OV9oGUHCy/DvDhgtGK63E86iItxeGz3Qenooz24y7yI8ojsNDd1kyep
         Zolg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739187992; x=1739792792;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nz3szSsYkvkaaHse2i8ixxQzSkMQ/TCVXddNYl+k4PM=;
        b=CW+IHI3SVilLfzGICMrwdAudzIqgeCDmselsqnSqHCxSUam9PyPY3HDSxlyj6kY7Jt
         hpPB4ZTjBc4M6iYPwoENFjZYRGO0ISWIdstI9iT58ok4OTB32hAJ+VkQ+jsmEDrBOk4y
         dOzwmwXftcYaQsDCWCNe1VFEdoiV7Q2Q4GChaZnpgey5+u4c/dSbKHvMxaC4zL/mrCoP
         bAwQIeaFog2fwoljhRnpBIW4oszRqrlP3wmQrfdCvKgEaY/iv0MXQ63nXfBSLG/b+crO
         E0mLrOXqD6gIuZhTx+706Oek2/VxFpWonABMecVasfSWG0Qld0sGCgkuW2ua1diQLjBt
         VS4Q==
X-Forwarded-Encrypted: i=1; AJvYcCUR0z3m0mYG2O1cPcdDav3ElwBuunmuJYejf+4mU239WtwszGaTW1Vr6ftEy7cMC3MydAa+QjPu57igrno=@vger.kernel.org, AJvYcCWrk4338oN3EdzSB8MLhBRIooYynRHxY+kxIbveb27yzRDwDouMepVOHvP6d2SGAIi0GRwo4pNtR+YKOw2k@vger.kernel.org, AJvYcCXkY5VRmI+cbc6kkP6qw6Ssr5CWtZPsVaXseKv4Xv8ZMRdv0xpioxbSjDdCpddeMypGNsH3s7/4sPSE@vger.kernel.org
X-Gm-Message-State: AOJu0Yx0OrlpsaybTJRDGv4yFAmRNgEtfaR8SGiw2zdccJF3X4Jb4Ibe
	oPOh1kXmeveUXHZVl+A4KsMZqePJO49Es319ioyR1qushyTqLeEl
X-Gm-Gg: ASbGncvaWV5OT3OrV8MZf4k8blePrMNKnA9SN4RnP9ZGtjLWsy8qNDZrMlSYeVepfKy
	T/V+imCvPy+bxKzgbdNhtatVGt35buuuRM7ija/oT5Glc6Z4ORxhODk4RF8uiRUjVL8Nq400+mB
	COQai9u8zhsPdiUAjcjVx6vDz02HJ1j9wGIu42XhCRrPDpGQscop4L5+Qz1WZyplbBI9vXfoSdq
	60CTKtN5xzYwtIJmQKon1it5Yd8Ob2mWo+hW9Wp9BYRSS5hnPRJoLJsIjh9elBOrd5/Uw57Ee/q
	4PjXIPDAfogywKgqiBLPotmA9yjUJTDkEoF/a23D7K3usinZ+UEH3TgTFzbjBZnPVuZVOk4AXBR
	vl68HvO3/kcIVgEsbOx9hUw74cFk=
X-Google-Smtp-Source: AGHT+IGbK56al2+IkAJDAkRxBgl79GgTLsF/jHB38d0GCZbDYUJMvCHJ++lVQG19QUdZ/eLFrwvXog==
X-Received: by 2002:a17:906:390f:b0:ab7:b821:6782 with SMTP id a640c23a62f3a-ab7b8216a00mr415884566b.14.1739187991300;
        Mon, 10 Feb 2025 03:46:31 -0800 (PST)
Received: from tom-desktop.example.org (net-188-217-54-237.cust.vodafonedsl.it. [188.217.54.237])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab7a9e6e06fsm428948566b.80.2025.02.10.03.46.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Feb 2025 03:46:30 -0800 (PST)
From: Tommaso Merciai <tomm.merciai@gmail.com>
X-Google-Original-From: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
To: tomm.merciai@gmail.com
Cc: linux-renesas-soc@vger.kernel.org,
	linux-media@vger.kernel.org,
	biju.das.jz@bp.renesas.com,
	prabhakar.mahadev-lad.rj@bp.renesas.com,
	Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
	Hans Verkuil <hverkuil@xs4all.nl>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 5/8] media: rzg2l-cru: csi2: Use temporary variable for struct device in rzg2l_csi2_probe()
Date: Mon, 10 Feb 2025 12:45:37 +0100
Message-Id: <20250210114540.524790-6-tommaso.merciai.xr@bp.renesas.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250210114540.524790-1-tommaso.merciai.xr@bp.renesas.com>
References: <20250210114540.524790-1-tommaso.merciai.xr@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Use a temporary variable for the struct device pointers to avoid
dereferencing.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
---
 .../platform/renesas/rzg2l-cru/rzg2l-csi2.c   | 31 ++++++++++---------
 1 file changed, 16 insertions(+), 15 deletions(-)

diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-csi2.c b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-csi2.c
index 881e910dce02..948f1917b830 100644
--- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-csi2.c
+++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-csi2.c
@@ -764,10 +764,11 @@ static const struct media_entity_operations rzg2l_csi2_entity_ops = {
 
 static int rzg2l_csi2_probe(struct platform_device *pdev)
 {
+	struct device *dev = &pdev->dev;
 	struct rzg2l_csi2 *csi2;
 	int ret;
 
-	csi2 = devm_kzalloc(&pdev->dev, sizeof(*csi2), GFP_KERNEL);
+	csi2 = devm_kzalloc(dev, sizeof(*csi2), GFP_KERNEL);
 	if (!csi2)
 		return -ENOMEM;
 
@@ -775,28 +776,28 @@ static int rzg2l_csi2_probe(struct platform_device *pdev)
 	if (IS_ERR(csi2->base))
 		return PTR_ERR(csi2->base);
 
-	csi2->cmn_rstb = devm_reset_control_get_exclusive(&pdev->dev, "cmn-rstb");
+	csi2->cmn_rstb = devm_reset_control_get_exclusive(dev, "cmn-rstb");
 	if (IS_ERR(csi2->cmn_rstb))
-		return dev_err_probe(&pdev->dev, PTR_ERR(csi2->cmn_rstb),
+		return dev_err_probe(dev, PTR_ERR(csi2->cmn_rstb),
 				     "Failed to get cpg cmn-rstb\n");
 
-	csi2->presetn = devm_reset_control_get_shared(&pdev->dev, "presetn");
+	csi2->presetn = devm_reset_control_get_shared(dev, "presetn");
 	if (IS_ERR(csi2->presetn))
-		return dev_err_probe(&pdev->dev, PTR_ERR(csi2->presetn),
+		return dev_err_probe(dev, PTR_ERR(csi2->presetn),
 				     "Failed to get cpg presetn\n");
 
-	csi2->sysclk = devm_clk_get(&pdev->dev, "system");
+	csi2->sysclk = devm_clk_get(dev, "system");
 	if (IS_ERR(csi2->sysclk))
-		return dev_err_probe(&pdev->dev, PTR_ERR(csi2->sysclk),
+		return dev_err_probe(dev, PTR_ERR(csi2->sysclk),
 				     "Failed to get system clk\n");
 
-	csi2->vclk = devm_clk_get(&pdev->dev, "video");
+	csi2->vclk = devm_clk_get(dev, "video");
 	if (IS_ERR(csi2->vclk))
-		return dev_err_probe(&pdev->dev, PTR_ERR(csi2->vclk),
+		return dev_err_probe(dev, PTR_ERR(csi2->vclk),
 				     "Failed to get video clock\n");
 	csi2->vclk_rate = clk_get_rate(csi2->vclk);
 
-	csi2->dev = &pdev->dev;
+	csi2->dev = dev;
 
 	platform_set_drvdata(pdev, csi2);
 
@@ -804,18 +805,18 @@ static int rzg2l_csi2_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
-	pm_runtime_enable(&pdev->dev);
+	pm_runtime_enable(dev);
 
 	ret = rzg2l_validate_csi2_lanes(csi2);
 	if (ret)
 		goto error_pm;
 
-	csi2->subdev.dev = &pdev->dev;
+	csi2->subdev.dev = dev;
 	v4l2_subdev_init(&csi2->subdev, &rzg2l_csi2_subdev_ops);
 	csi2->subdev.internal_ops = &rzg2l_csi2_internal_ops;
-	v4l2_set_subdevdata(&csi2->subdev, &pdev->dev);
+	v4l2_set_subdevdata(&csi2->subdev, dev);
 	snprintf(csi2->subdev.name, sizeof(csi2->subdev.name),
-		 "csi-%s", dev_name(&pdev->dev));
+		 "csi-%s", dev_name(dev));
 	csi2->subdev.flags = V4L2_SUBDEV_FL_HAS_DEVNODE;
 
 	csi2->subdev.entity.function = MEDIA_ENT_F_VID_IF_BRIDGE;
@@ -852,7 +853,7 @@ static int rzg2l_csi2_probe(struct platform_device *pdev)
 	v4l2_async_nf_cleanup(&csi2->notifier);
 	media_entity_cleanup(&csi2->subdev.entity);
 error_pm:
-	pm_runtime_disable(&pdev->dev);
+	pm_runtime_disable(dev);
 
 	return ret;
 }
-- 
2.34.1


