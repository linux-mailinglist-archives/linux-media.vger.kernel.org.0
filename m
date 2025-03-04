Return-Path: <linux-media+bounces-27483-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D738EA4DECC
	for <lists+linux-media@lfdr.de>; Tue,  4 Mar 2025 14:10:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EA1FB18981E1
	for <lists+linux-media@lfdr.de>; Tue,  4 Mar 2025 13:10:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9C5C1205E2E;
	Tue,  4 Mar 2025 13:07:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="tZTujuxP"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51EF6205AB1
	for <linux-media@vger.kernel.org>; Tue,  4 Mar 2025 13:07:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741093644; cv=none; b=Yq0Rga1/TYoe2DqamRMgmzYl66kgB9uC+FEJwHuyuojyoHtzLTURceiEsRFz7AApF0XLZ7BUHNPaE9vpcbiOjlUhLn6Tsleksi2vpe+eMQSrXhAN3lfpIdSznNbIz+T0XB/YE9SKD4FId1ndVjttM5EoiBMEdc5jcPI3+CR2qE8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741093644; c=relaxed/simple;
	bh=hbTVezICqr8e2a2ELXb8vmVSM+zmKLpGBJ8kAi4wDWg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=cEeg92RyRDeI3zZJEA+NCrysuK1p/FL5IilXFuqP4o6Ry3NWaoEHXs0ZPndAQJABQwsed5cX2ENMDH6k/AsrKUQTYwVn8d8EuBsm8HO7YPxIJyNE1LRlMSlQPfMV4MOzs+5EVJ7LsvyvHFqhmsqZCoSsDJjyVpWCnr1xCVoOalM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=tZTujuxP; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-43bc4b1603fso12867595e9.0
        for <linux-media@vger.kernel.org>; Tue, 04 Mar 2025 05:07:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741093640; x=1741698440; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0sMLvCT1fnTWe+fQQZYyr06r8CMaLxKRmrVcKoI1NIQ=;
        b=tZTujuxPDg2GNgl1jcs1IhE7wLC4TNKfyI0C5rE9aBY7nF7r23ql5s22CPO2b1GTIY
         1SpJ3jEtI7kG842OfqgYsFZoX6+4hErHw28dw75EtCTH7FfrjPsmqhoU6MsixhW9gcX9
         zhA3bcUHoV1p3EAEaLMMD+V77FHr4k/nTHd4f7CYyLNPoYDWajUQ0JAbjsggkExNVIIF
         tCnO+x+wRgrZOt3QptBx2igALb3RY7wk7LYCTeP9kQle831yO18y7P75VJwP7trH6vZR
         14mqh8e6Jl+b/mH6SItHvuPLT/d9H0Gok+Q7/lozlQGno8IupClXclvlvbRSoNj5k7Q0
         wobw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741093640; x=1741698440;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0sMLvCT1fnTWe+fQQZYyr06r8CMaLxKRmrVcKoI1NIQ=;
        b=EDEBmJMb/HDbMt5vBlBIRvNjdfB1Bq8PtkcahbExjwrvelRL39n5czd1EM4ChJ2PPK
         byk4QNEG1GSKHrfixnozk2PV1TrtIdPw4Vr5VCoec/T2PaFsPwkQwZJf55nASThejsQT
         0yE8F7YMTAQ7oGDglkzhmmSHJ+e/yBVHHUL4P79m1pkLHTAf1t3Gb+LIbUr0ZHoW6LIm
         UR3lEvDGHz3GtMAjOHeTPOc3w0++Ahf/R/wrdf2/eXK/5VHBUjODwy+QsGn8iLI2H2kX
         riI46ULUFZMbQ+rDClMxl8PqR2fSBim1MuousG62JD7fw5iCyylR58tVF0V/F5JprF8Y
         sEeA==
X-Gm-Message-State: AOJu0Yz4VdDWnXYi3dwLvt9jJBQwxkyN7qMiHQWPZ5c+0d6FhumSoDnt
	OTa9/s2D33TVKibuQ+bl7+N5PdSjFlA6OEKlJaaEr4SW84+u442NxYDzDtuWk3M=
X-Gm-Gg: ASbGnculeeIgSnEfxSPnXacx9Nk6LjHSkfwiaCBy9UHlW5v7VpZpNXpYdUVut72zHNC
	Uu2qTk0FWlZVNf1KJPxAUlwEYMzajPtHoUDiWnT0yeM87KLLgqrpJdQ0xNGHsh4+dvhhb5D5nX3
	NNLC0ZiYmLY2YoI8XhMntrHmXmO9dRjyQn/kNj+SEiv9rUxQOzd7egUUvU/bmelXiIN4cAPGiQw
	suuh8U8tJCPp+tyhyee0yy2eMYeaOKTOtrcD7jnqTL3jlhE+5N/ak+X0ubvBdQZ4+33cnB1gOFX
	rcUzYPoT9DBMJCDJA06ufZgeJhppylDkil6UfCqSNGdzxeebPZ7jKxHZEJnBocxRMwtpmDrdraV
	8yoqz9Q==
X-Google-Smtp-Source: AGHT+IG7Hqk+59fncwqRhoiQZI0qgVNSHDtmwiVCCcb9ZVYfhmFpPhJTWaXXdGtM/0s4DaDuW44HFQ==
X-Received: by 2002:a05:6000:1789:b0:391:ab2:9e80 with SMTP id ffacd0b85a97d-3910ab2a206mr6605504f8f.24.1741093639862;
        Tue, 04 Mar 2025 05:07:19 -0800 (PST)
Received: from [127.0.1.1] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-390e47b6cd8sm17401715f8f.44.2025.03.04.05.07.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Mar 2025 05:07:19 -0800 (PST)
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Date: Tue, 04 Mar 2025 13:07:14 +0000
Subject: [PATCH 8/8] arm64: dts: qcom: sc8280xp-x13s: Enable Venus
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250304-b4-linux-media-comitters-sc8280xp-venus-v1-8-279c7ea55493@linaro.org>
References: <20250304-b4-linux-media-comitters-sc8280xp-venus-v1-0-279c7ea55493@linaro.org>
In-Reply-To: <20250304-b4-linux-media-comitters-sc8280xp-venus-v1-0-279c7ea55493@linaro.org>
To: Stanimir Varbanov <stanimir.k.varbanov@gmail.com>, 
 Vikash Garodia <quic_vgarodia@quicinc.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
 Bjorn Andersson <andersson@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Johan Hovold <johan+linaro@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
X-Mailer: b4 0.15-dev-33ea6

From: Konrad Dybcio <konradybcio@kernel.org>

Enable Venus and point the driver to the correct firmware file.

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts b/arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts
index f3190f408f4b2..d4c53845eebb7 100644
--- a/arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts
+++ b/arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts
@@ -1477,6 +1477,11 @@ &vamacro {
 	status = "okay";
 };
 
+&venus {
+	firmware-name = "qcom/sc8280xp/LENOVO/21BX/qcvss8280.mbn";
+	status = "okay";
+};
+
 &wsamacro {
 	status = "okay";
 };

-- 
2.47.2


