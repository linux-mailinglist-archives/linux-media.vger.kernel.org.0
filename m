Return-Path: <linux-media+bounces-48608-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6058DCB4774
	for <lists+linux-media@lfdr.de>; Thu, 11 Dec 2025 02:49:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id BB37A30014C3
	for <lists+linux-media@lfdr.de>; Thu, 11 Dec 2025 01:49:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D95E726A0A7;
	Thu, 11 Dec 2025 01:49:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RgtwHo+8"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qv1-f50.google.com (mail-qv1-f50.google.com [209.85.219.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7AA126B76A
	for <linux-media@vger.kernel.org>; Thu, 11 Dec 2025 01:49:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765417751; cv=none; b=WaBDHzj5wcwNNfxGdABk4V2HZTA1lECEiHlIQmvTHnmJniK5IhG8m1nbljYZtV+ZeLWK2tZdxOgNM/3X9J/dP5r8qiyo3iWxIQ2+jT8WuiL7gaXuYkFOKByCD3xztMgpeoAQSVVGlbk0ZI+8dJ5V0yp8cvoxcVc40Ii/7UuPlAI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765417751; c=relaxed/simple;
	bh=6DKDr/25LQr5kXe8DDjOQecVCpueDt34M9W88LlMvos=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ePiiDY9xIKyO7UPvr/wAgVZXwy3S7VNSMm+ZVmp9khdyIN82WFRhZVYOxR6db/P+Cc0bvsni4CvJGRGgewlaBos9tq4eGDs+Tn4YYkoDSXWXu3w3EYVpHlyt3/NnxWZvEGwbyzuXQDXjYP4NvgRI5UVeoBJxe2SBh9fkj0ETP5U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RgtwHo+8; arc=none smtp.client-ip=209.85.219.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qv1-f50.google.com with SMTP id 6a1803df08f44-88267973e5cso2991906d6.3
        for <linux-media@vger.kernel.org>; Wed, 10 Dec 2025 17:49:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765417749; x=1766022549; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Wa8qDtdwKWqABstjmDFhVV9Ipjw33hVv7VY3da2yZow=;
        b=RgtwHo+8GuGWJRte7l3wQphmbwpSQxPSvswvvno7HCR9Fh983uCNJOhIlqGTLUyGmf
         BRKv1Wyi+JaS2u6m6X0epo295qwsn6qGsjG/s8VPShS8cx3bzu2Fa7+p8vtMKwcSTdEu
         ZHFQ9rlet+1Tgwh6Ipg3QEcQ7uFWzR1ln6+ifjPpLEf2Q+CPYRF6zBRAj4lxnbiE6PrR
         cdZ99rFHoPEHYTcRvMWvUcl5MJGTOhuU0NVwxBKTnVhEctQ7VDU59VzQfuwXEvX1JAGY
         FaGfCaWJlql578DpNY3CjfGAYKChhjFP12lClZErGSw+hAnQV4pIZZstgdkbpjOJjk86
         ViKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765417749; x=1766022549;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Wa8qDtdwKWqABstjmDFhVV9Ipjw33hVv7VY3da2yZow=;
        b=IYfS4JWxUlw5/J6WtnPjQNABUvrJRNg8Mui+uU8OqEfuNBUm8w9LLJqSbozUHIY/sG
         Lvc16wbBKwTKsHVAzhqeNnlR+hosNAqz0fUWsl25owS8oOnCzmOmeaBop3f/DXPsP+45
         5b0Vbwchmc//INVHOVa3WeWZ++YolpgnC2IaH3jrCqPrWTnZwDwx3LjGaNb6niXSjXqG
         Ey7jXkGcsOSvuucZRW6d3KP2wblVc+CeKQjel/d9gFRQ6BJ4IOFTsrUmX4oLbif83CSD
         DKs1g4vIkd9x0Jq8YgW+HKy+hVSEilwEDP/+QJ1KvFYarrOWl+nemEGQs+/UChdzI6PJ
         xqJg==
X-Forwarded-Encrypted: i=1; AJvYcCVLfBJSEQSZQp2vmpdZGmTA5FQq7/XpQNZpn2063asEelmPdEsJH6P/oEwpz3BwifyinEVW/J0Jbs6vdQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz+bhzmImiq3OeS8sHY9NhQQmd2YZFTbOuue2eCHkuP+Fw7j/0c
	o4WIF1mS/uZ0ifdf0wGGKkNPXvVZ3prYYbA3ofLx7Xm7rvsduo5B1svL
X-Gm-Gg: AY/fxX5+gSedCxnYzLgO5VKbcFIGHeNsMTMS5lpNt1/ezVU3NAmn/aiGNovbo/ueKXo
	dbLJCa5L4R8WtN/RFxhRekAZ904c3kBopESZ8vI5XBdJmvUfm/CCeh8A7ckXDHY0fw36W9wJRU6
	wUkxvw6sfHUApq4xx5TfbXBn3/PCOrrlR1UDEXv7JFKeSs2/8It8NpayIVLYZyo0T+hsU1mI8mq
	JYr6qI1BZ/Lf1t25HqyksVnr7kPL01G6Xfe0sWH92HoYdC3DrLjXccEWwndqiLgEM/JbUhx4+1J
	ebSuh+OJaHXxckgbo7Yi6XIZDCW1QnMYdWCt+/GmHakf/rZRPdTw6/5X5ARBuQqH1bDaHk7mxU/
	zGFiggzMEp05q7NIQNGlA1XGtMCXOX6KdzTrTAWLd+z5GY1R2DjMpwME3+n12yH0aT3jwyKJGgH
	Rva+bVnyTHZSuhLA==
X-Google-Smtp-Source: AGHT+IGASqjNc42d8qiqfBf9BxfqyN435KFhyfp6jeSw9yte7DRyfq+sWLlhcCvsV4DcfigGhykvBw==
X-Received: by 2002:a05:6214:1d0d:b0:888:3d1e:f95 with SMTP id 6a1803df08f44-88863a9717bmr71718106d6.32.1765417748670;
        Wed, 10 Dec 2025 17:49:08 -0800 (PST)
Received: from localhost ([184.144.58.243])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8886ef0d332sm11910316d6.45.2025.12.10.17.49.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Dec 2025 17:49:08 -0800 (PST)
From: Richard Acayan <mailingradian@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Tianshu Qiu <tian.shu.qiu@intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-media@vger.kernel.org
Cc: Robert Mader <robert.mader@collabora.com>,
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
	Richard Acayan <mailingradian@gmail.com>
Subject: [PATCH v4 3/5] arm64: dts: qcom: sdm670: remove camss endpoint nodes
Date: Wed, 10 Dec 2025 20:48:44 -0500
Message-ID: <20251211014846.16602-4-mailingradian@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251211014846.16602-1-mailingradian@gmail.com>
References: <20251211014846.16602-1-mailingradian@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

There is no need to add these by default for all of SDM670. Originally,
they were added so there could be a label for each port. This is
unnecessary if the endpoints are all added in a fixup to the camss node.

This is required since dcf6fb89e6f7 ("media: qcom: camss: remove a check
for unavailable CAMSS endpoint") was applied, forcing all endpoint nodes
to be probed, even if they are marked as disabled. According to the body
of this commit, there is "no valid or sane usecase".

Suggested-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Link: https://lore.kernel.org/r/488281f6-5e5d-4864-8220-63e2a0b2d7f2@linaro.org
Signed-off-by: Richard Acayan <mailingradian@gmail.com>
---
 arch/arm64/boot/dts/qcom/sdm670.dtsi | 12 ------------
 1 file changed, 12 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sdm670.dtsi b/arch/arm64/boot/dts/qcom/sdm670.dtsi
index c33f3de779f6..c275089237e4 100644
--- a/arch/arm64/boot/dts/qcom/sdm670.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm670.dtsi
@@ -1768,26 +1768,14 @@ ports {
 
 				port@0 {
 					reg = <0>;
-
-					camss_endpoint0: endpoint {
-						status = "disabled";
-					};
 				};
 
 				port@1 {
 					reg = <1>;
-
-					camss_endpoint1: endpoint {
-						status = "disabled";
-					};
 				};
 
 				port@2 {
 					reg = <2>;
-
-					camss_endpoint2: endpoint {
-						status = "disabled";
-					};
 				};
 			};
 		};
-- 
2.52.0


