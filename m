Return-Path: <linux-media+bounces-16692-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 2361795DDAF
	for <lists+linux-media@lfdr.de>; Sat, 24 Aug 2024 13:59:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5546F1C212E4
	for <lists+linux-media@lfdr.de>; Sat, 24 Aug 2024 11:59:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 648671714BD;
	Sat, 24 Aug 2024 11:59:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="X6a07QXB"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40E3535894
	for <linux-media@vger.kernel.org>; Sat, 24 Aug 2024 11:59:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724500746; cv=none; b=H4aSA78U4WmVFnueh6x1TwTLI7RDIsAT6dJNzQCLVcb6eSGCJCd3EUTd/P9NDl3Sl4NH7PH2+l8nAJRkQlqHuZzPDkOeFG3iBdTIrnnQg4gq+kaaQQ89FGlie7hk9avlF0zrHWnvh7YAmYYRZcmXSO5x8S5jNQwqEovKrwVaTNg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724500746; c=relaxed/simple;
	bh=0DuzVKEoj/UXgJ7mEwk1mI8XAwz74JJWB+QxpB2dey4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rIbJR5Aeb1JINo9bvM4jDPurpF+/Mre+MIYkTaxbIHhnOb5ZqqdfVovSLIXPupzJWGg0qkV5GsS7U+FgWCGywltIW/qHFgDvRMtHaR2cv6oEhxvL5avcaPajsZeFalHFFzID2SYHmmMfbh43lV8bp28OiPQVXaEu+9VVut4Sm6M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=X6a07QXB; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-a868b739cd9so353097066b.2
        for <linux-media@vger.kernel.org>; Sat, 24 Aug 2024 04:59:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1724500744; x=1725105544; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nFI93y00zMD6bCmpfwEIFGjVAprudVxyzc0oGsV9Nws=;
        b=X6a07QXB62MNUrElErXJ+PQ2QJnh2hMxPNfZ9YfkG+0VYxnANmoJv899mwfqqtlSBU
         URvPL0nXwcA5ytbANWlmXYjOnrDJgC4VG3ZyxYdiw9VdhCk11yiqHNRviVffrMEpYgrV
         nZZooPltoUDOydmo6bMQA6I2CytMjSQiM/MUJapP/GKhUWpf6Bx9rQMHsqDQeShioe4v
         g9fn3M9OvpHawxrASbM2bi2skrZmt8PS7qSs6sXt2vxK9AVpJhvIRUC43cZlA5st1bFJ
         gaw6rHX0O/wUCsTrZaBcuPoHxtxxXavGCV41E/XFBQlu/0+rOOxkKfvhQ+t0knh2c038
         rhtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724500744; x=1725105544;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nFI93y00zMD6bCmpfwEIFGjVAprudVxyzc0oGsV9Nws=;
        b=VAcOjRLV1tE1AxgQtfru+2OHCIZRGuZUlB+d+5+JvYRcseAA00FzySOyJEkPMNPTN+
         pzrprbr0Z/g3BfCsI8sV1lvnb1prxoBbWLvtY2j8o7oCmbOv4B58oskncfOurY+dfml+
         CsHvIvmy2hzV7s5vwtPYdPIChlcjA0ahXire5Avas4DTWTypEuRsIPErbPrqOeDPOOMC
         LzaDgV9uqmid8jRxoPhOa0Tp5RGbderyIfuGP/NkTDhc8U0ZdoYcqZ0Fzbfx2ntfyuR/
         Q/WoYSzylnVsiiS3jdQvt1jNzcIypYsP9iPDUjxj9CN5d0VJqOKJuN8LIlMdYRJSrHx9
         cn/Q==
X-Forwarded-Encrypted: i=1; AJvYcCXvW+4mMxP0S4e0dXFEc4GbOUl0zwGN91fvDTb/Dwx0lFJ5KO9zEYUn1ddJ5rXEOtQQ8nirB0kC+MiJqw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzW7BPawYXiyCFOBDK2jiiDXON5IqxO2mks1VP4S+LaJUGvO9fK
	w5ZaG6dRwU+W5Ci3xHLeEwZQTS51lVZzZNG6R0Pcz4kIlh4KTYb0oZHneiEO9zo=
X-Google-Smtp-Source: AGHT+IFjioJWqfHoLZSyZtpbC3hGCEXMM/p8fgRmV3Ro8hWJPu+jWJN6wQIPD2x7AwJXhGlaVxPS1g==
X-Received: by 2002:a17:907:e2d8:b0:a86:80b7:471d with SMTP id a640c23a62f3a-a86a52de598mr403785866b.37.1724500743573;
        Sat, 24 Aug 2024 04:59:03 -0700 (PDT)
Received: from sagittarius-a.ht.home ([176.61.106.227])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a868f4f4a95sm390881166b.210.2024.08.24.04.59.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Aug 2024 04:59:03 -0700 (PDT)
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To: mailingradian@gmail.com,
	vladimir.zapolskiy@linaro.org,
	loic.poulain@linaro.org,
	rfoss@kernel.org
Cc: andi.shyti@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	todor.too@gmail.com,
	mchehab@kernel.org,
	andersson@kernel.org,
	konradybcio@kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-i2c@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-media@vger.kernel.org,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Subject: [PATCH] i2c: qcom-cci: Stop complaining about DT set clock rate
Date: Sat, 24 Aug 2024 12:59:00 +0100
Message-ID: <20240824115900.40702-1-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <Zske2ptZAV12YLyf@radian>
References: <Zske2ptZAV12YLyf@radian>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

It is common practice in the downstream and upstream CCI dt to set CCI
clock rates to 19.2 MHz. It appears to be fairly common for initial code to
set the CCI clock rate to 37.5 MHz.

Applying the widely used CCI clock rates from downstream ought not to cause
warning messages in the upstream kernel where our general policy is to
usually copy downstream hardware clock rates across the range of Qualcomm
drivers.

Drop the warning it is pervasive across CAMSS users but doesn't add any
information or warrant any changes to the DT to align the DT clock rate to
the bootloader clock rate.

Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 drivers/i2c/busses/i2c-qcom-cci.c | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/drivers/i2c/busses/i2c-qcom-cci.c b/drivers/i2c/busses/i2c-qcom-cci.c
index 414882c57d7f4..99e4305a33733 100644
--- a/drivers/i2c/busses/i2c-qcom-cci.c
+++ b/drivers/i2c/busses/i2c-qcom-cci.c
@@ -602,14 +602,6 @@ static int cci_probe(struct platform_device *pdev)
 		}
 	}
 
-	if (cci_clk_rate != cci->data->cci_clk_rate) {
-		/* cci clock set by the bootloader or via assigned clock rate
-		 * in DT.
-		 */
-		dev_warn(dev, "Found %lu cci clk rate while %lu was expected\n",
-			 cci_clk_rate, cci->data->cci_clk_rate);
-	}
-
 	ret = cci_enable_clocks(cci);
 	if (ret < 0)
 		return ret;
-- 
2.45.2


