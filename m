Return-Path: <linux-media+bounces-34562-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1828AAD6501
	for <lists+linux-media@lfdr.de>; Thu, 12 Jun 2025 03:16:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 074F71BC0A08
	for <lists+linux-media@lfdr.de>; Thu, 12 Jun 2025 01:16:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D7D711422DD;
	Thu, 12 Jun 2025 01:15:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="tV76yzRj"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F745153BF0
	for <linux-media@vger.kernel.org>; Thu, 12 Jun 2025 01:15:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749690952; cv=none; b=R1gyYYG976yqnGzpThioeNcwJFPu3WfWpot1gWrTkQmty6TR1Ep+VGDoqkVfCpmpzwr6QmF8tUkEA42exrZyMmcK6FtKDVcsLHnVd9+5DY6j1qpI7y+5UMtboFvC0ZAqVvIQRVw/NuHQ+E2k6Uaxcvg3GMgMQbjlRRLpDro8yy8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749690952; c=relaxed/simple;
	bh=Br2+sPECo0mbbnRGjEs+gcJ7Da6KTtHQtd0Iun2iP4g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=h+LDXk2IiqXqUXRXyBCjwWCR6x7eHhc0ryXgcBqLjLGlrI2Synaq4/ukXtyPgE1IKNCBOskYpmOJVtOyb/07drsVLATZ5b9pCypbwwvGhc9Z17ziptUSN8cKn++nyuNsTuC/2PjKDkPaDWW85i/YNwd1zJKqblcLffooP7E66Es=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=tV76yzRj; arc=none smtp.client-ip=209.85.208.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-32a75c31b32so418571fa.3
        for <linux-media@vger.kernel.org>; Wed, 11 Jun 2025 18:15:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749690948; x=1750295748; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mBPHq117dWQljJbOWkWsV8bZPt4ezjyADVBAza4ih8A=;
        b=tV76yzRjD0AcIgQ7aCrkcn8omiQifxA7P9fjX9C4rrRaFik8IXARUiOxgVoOFEVu5O
         wUEPSN3Io9oIWJKqiWMPWeaJLcWtulHZJy80aS5TkDGob7zDdc6OwQiHC1hrdpHwvLFU
         amHPNHzeaWAU0UUKcoLnVnfh5fi2a882nZdNhe/7Da/rtM9xhY1UAGjF90MPBmm1GU9B
         THJhUh7qyJcWiHu/Dx/TguFGUgHSh4TkDAgNQVangT7k5aY5hPJ5sJ2s0Ha9S3qVS4BP
         CTHAxSiAaFYBh/KVJhgkDwPcFBkml4niFaoLqSUWz/8HqGhjS/Wb6o6QJJJL9PCPqJWS
         nLDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749690948; x=1750295748;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mBPHq117dWQljJbOWkWsV8bZPt4ezjyADVBAza4ih8A=;
        b=PFZ2+csyXuiCOIQKhRDIF4vqQXntURs4YMWsxOr9Xi8ShXiNAJ9yLpeLCpJoYUlpUC
         P8FnpCuzYrryRRbHZlkiJYXIzOddMrNiJAUuVv/aUccoquIsLqneb/tVUcxz3fNVifWB
         BvM0MqoGOja2dTjZi0iIl/+PMP/DTM1mFrBRPraXjKZjB7kkwVg9X4rP/SYyp5Je7vKZ
         g4P3XDFASSX2rLb98kYdGDp3Oxaf3kkVetDUMt66P1nALBcfERQFm/hQ1qsCYtfERliK
         LA9wH77v7RztZkhgt6ZVAIuZgyN0ekatPjhh5R9cr96xY/b+h0O3b+u5QFhCjE5Psr7i
         Qxsg==
X-Forwarded-Encrypted: i=1; AJvYcCVlYv+Ci8KnxJntM7FjALIDgLFn8HaRmtG0fNoWsrXrivkZuHJCkQZiW0LjqCdcxmGXMel7qmkgZZMg7A==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy3zph/m9fplktyGBsObvmIiVok3Z2iz7uPO2WJq+C0nzZjzaDs
	3XDKsphhoH/PFNPgfdkB4UAebPoIJomR08w6svvOl9IZeRPIGUH4e02ugCo0ViyZyCM=
X-Gm-Gg: ASbGncvP/7YIZiUIPnMWweNH67v+gaUinbvzpoyW0NIVswNH67fqtJt5Lw9gE75/zZU
	FUBBiMhhcPFSpsQCJDvIQMhUIskJndptuekhFd5ZPWQoE6Q8QFMmjkcNEQpCT20af8Q4s44HnJp
	KT8XlNNRFx3S0ApxI1URqlJ8NyARN8P5/bS403sA+cjHV0VPQt+qmgkWLHagJD4DEPVYGNyHnd9
	cPWjusatf0OVeZWX3bzUxrqvxVkdf/VmdWcMvxs8nblIlTB676JzbPClPwf/GPH78t6wcPCdRax
	6JqlSdPPd3k8MG/4HQyeIJlBmAaCjtpGBfffZMUnqxbDDV9dS2IwqmoY4Lli24wWlbHnkx03Aay
	bSdQgu/bmKDLj82WvjRBncIPCRDO+1YHppXsrdd5PnyKTwQaEdgg=
X-Google-Smtp-Source: AGHT+IGjvJjUSGUrBTNd9Gheaxu65cY98U3D2htsFy57efkcRMWJJtiq8QTKRbMHsaxIiIbQ4v6Wfw==
X-Received: by 2002:a05:6512:23a4:b0:553:a78d:2c44 with SMTP id 2adb3069b0e04-553a78d381bmr36548e87.7.1749690948390;
        Wed, 11 Jun 2025 18:15:48 -0700 (PDT)
Received: from localhost.localdomain (88-112-131-206.elisa-laajakaista.fi. [88.112.131.206])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-553a7018069sm62808e87.157.2025.06.11.18.15.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Jun 2025 18:15:46 -0700 (PDT)
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: Conor Dooley <conor+dt@kernel.org>,
	Robert Foss <rfoss@kernel.org>,
	Todor Tomov <todor.too@gmail.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Vinod Koul <vkoul@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	linux-media@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH 05/10] media: qcom: camss: unwrap platform driver registration
Date: Thu, 12 Jun 2025 04:15:26 +0300
Message-ID: <20250612011531.2923701-6-vladimir.zapolskiy@linaro.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250612011531.2923701-1-vladimir.zapolskiy@linaro.org>
References: <20250612011531.2923701-1-vladimir.zapolskiy@linaro.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

To be able to register new CSIPHY device drivers unfold
module_platform_driver() into module_init()/module_exit().

Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
---
 drivers/media/platform/qcom/camss/camss.c | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
index 71a37447e17a..e03308d7a366 100644
--- a/drivers/media/platform/qcom/camss/camss.c
+++ b/drivers/media/platform/qcom/camss/camss.c
@@ -3953,7 +3953,17 @@ static struct platform_driver qcom_camss_driver = {
 	},
 };
 
-module_platform_driver(qcom_camss_driver);
+static int __init qcom_camss_init(void)
+{
+	return platform_driver_register(&qcom_camss_driver);
+}
+module_init(qcom_camss_init);
+
+static void __exit qcom_camss_exit(void)
+{
+	platform_driver_unregister(&qcom_camss_driver);
+}
+module_exit(qcom_camss_exit);
 
 MODULE_ALIAS("platform:qcom-camss");
 MODULE_DESCRIPTION("Qualcomm Camera Subsystem driver");
-- 
2.49.0


