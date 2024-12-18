Return-Path: <linux-media+bounces-23740-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DB85A9F70B4
	for <lists+linux-media@lfdr.de>; Thu, 19 Dec 2024 00:19:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 08A337A1040
	for <lists+linux-media@lfdr.de>; Wed, 18 Dec 2024 23:19:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6A2E41FDE09;
	Wed, 18 Dec 2024 23:19:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="L+9lgSuX"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-io1-f51.google.com (mail-io1-f51.google.com [209.85.166.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61B7C1FCCEE;
	Wed, 18 Dec 2024 23:19:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734563961; cv=none; b=TXODiiQAOM0lU8BreafdKWjRtEfeVzN2Li4g7AttrrLaBg5C6lR+qjQGGjVM7Mvh2r3EA5TcwJXE+VZaCgFTMrzNjyFMjXqO7m3D93tT5mLHIzE4ZMYJQk+kMMv1pmkx9lV4NjBl0Z1uUxUrrbijGg6P4xIDT2DdKwMh5P7eYco=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734563961; c=relaxed/simple;
	bh=cA8ia9gUiiYNXiF6cnwGU5yb3IDiwQmbEW9UlFxwV/c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dA8Ch6QeyZmheaWMFzhvADgrVetZZTSZmKqDKgqNvYbRJ/4yk66uYszx7y9ZEp4RKQZ4ZrzCvJwE14t4FVsHeydhbk08SA2eg/YTlqd3vlP071m6TlCdWOTtsJEttL0WnfqlO8yNhaf0nAm5xbn+fjtOppWNOLRHei2cOHw6pU4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=L+9lgSuX; arc=none smtp.client-ip=209.85.166.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-io1-f51.google.com with SMTP id ca18e2360f4ac-844dfe4b136so7217039f.3;
        Wed, 18 Dec 2024 15:19:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734563959; x=1735168759; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=riRl3ZaZxwmWu/pRGOcAcSHXuWSTMJ3QmPDQGJ4LbYU=;
        b=L+9lgSuX9uL4jR87aruNsdCy+USHf96oNZKG4z5/yEm7HcynQLfgkMNARiUovkA/yJ
         eu2W1cD19wmvnqbacrTUJtG7GYDlZ6Tu9rq2oj5c2Hzz1L03PLQxF3Zjg6JMZJH278s4
         6iYF3YSdKGPjILf2PoJuo9/taRJ1ozWVJ/O5YlW17oDtUfSUaAheST2gFHzTJtljlJVy
         5XYxN57Xcx4yzXlViyFetrW85tdcYdkDtvI9/5NUavwSqvRt5dHFoKDIfcVbTW1ZVxat
         GQasIFx0MlW9AaWYYT+DAvqa3OB3K/D337Ms2rvVuJ5HnaHUZlXyVFKC9avrX0pwQclZ
         jSqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734563959; x=1735168759;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=riRl3ZaZxwmWu/pRGOcAcSHXuWSTMJ3QmPDQGJ4LbYU=;
        b=fXiuZDP3OwyHZQAkpA0F1wbMCF+GtuCFwTwamjOoaUzZ5gdIwRUXUoFigaOXlb+LB5
         SAjz969f04LydHnt0G2AlMzZMX09tpyHvkw/glNCi6icJIJ5USD+rsNP3MBMhjyftZnC
         ldikiQ+NHHd2mBtTS6g9ygkQp6pu3jTv96fs9UBYo+Fjyje6g2EOWHhIOs9NC6MXJCov
         VT6fyitw/hkunXiYl/oprc5rCctAUBCSoT0wwCYvurIxhYHKs6XnGkGihoFb2gN10d4i
         fNblDBM/UizcMZBe3C4RLfrs2PT9rp6pmxTGet6Be443ikugPMuAgDt9HWK8WI9OmEyY
         ST5g==
X-Forwarded-Encrypted: i=1; AJvYcCUCsNW5RAUdyA0N86Jn/XBdVxFMjG5AQOiu5CynEwhJnS3Krj2/0hnNvimutdWHDwdTbSMu7DlqgjZGgSBAZw==@vger.kernel.org, AJvYcCW8WskMpNHKp0dYemYRjkUVrGnLs87A/vkXw9ZRLuVZODg4u7tVQOwWql2LOCL/j9gw2rTLRF5G+Uvc@vger.kernel.org, AJvYcCWDiq1ymmI6rsR4YfcDvFFNpullhbwrQRN53LM+NdSmzfQkcE8MPr63sb+5LLD3c/EINExQhJZv2M+7@vger.kernel.org, AJvYcCXgCyNiLKHcRW9dhBfL5O4rW/Wysl3K8vgGsqZDq8qp+e+OrVT2A/WbVTDtS/hSPH1Net0PMMS1lMtl7hw=@vger.kernel.org
X-Gm-Message-State: AOJu0YyyAYT8LHLqtass3gF8jqMUNS5xKEDZ+SSDHVgrrlPTHsxv2JSY
	fz/iaXfnHCFtJN1pBHURJvcBKejCu34uLAUHzQRheuLlj1W/hlR5CoMgYoNH
X-Gm-Gg: ASbGncvkNQ/BPKzDFAtk/n8xxfxRoFifY0GriDrFfMVhsklA5/eBYVkOJlgna23A4qq
	OKNtZDAnq25JWQuXlVYnESM2GnLpeJpWuVHvOXh8P9I6EccthSuXfCJCJrAvV9Y7t4jhl24m35l
	OtdlBlRSzCAhak3ULD2XloDyg5PgOauf68aQimsdEOmThL/YDcd8ylqUfiqpAmRsN6LIGir3rIU
	qQ1RF/Dx4IJ3EI3TP47l/7a/kPkaWyOjz0CNpD7gRE=
X-Google-Smtp-Source: AGHT+IGNByxvPRTJMN8l6rCvlxitQh8qSqEXxmMaxgrEVpsvPTBwcrRgN5giPiZSOteJz+kkPJuyaQ==
X-Received: by 2002:a05:6602:3f94:b0:844:c6a8:7f8a with SMTP id ca18e2360f4ac-84758582668mr502946339f.9.1734563959461;
        Wed, 18 Dec 2024 15:19:19 -0800 (PST)
Received: from localhost ([2607:fea8:52a3:d200::eca])
        by smtp.gmail.com with ESMTPSA id ca18e2360f4ac-844f6292754sm255182939f.29.2024.12.18.15.19.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Dec 2024 15:19:19 -0800 (PST)
From: Richard Acayan <mailingradian@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Robert Foss <rfoss@kernel.org>,
	Todor Tomov <todor.too@gmail.com>,
	"Bryan O'Donoghue" <bryan.odonoghue@linaro.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-media@vger.kernel.org
Cc: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
	Richard Acayan <mailingradian@gmail.com>
Subject: [PATCH v9 4/5] arm64: dts: qcom: sdm670: add camcc
Date: Wed, 18 Dec 2024 18:17:34 -0500
Message-ID: <20241218231729.270137-11-mailingradian@gmail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20241218231729.270137-7-mailingradian@gmail.com>
References: <20241218231729.270137-7-mailingradian@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The camera clock controller on SDM670 controls the clocks that drive the
camera subsystem. The clocks are the same as on SDM845. Add the camera
clock controller for SDM670.

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Signed-off-by: Richard Acayan <mailingradian@gmail.com>
---
 arch/arm64/boot/dts/qcom/sdm670.dtsi | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sdm670.dtsi b/arch/arm64/boot/dts/qcom/sdm670.dtsi
index c93dd06c0b7d..328096b91126 100644
--- a/arch/arm64/boot/dts/qcom/sdm670.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm670.dtsi
@@ -1400,6 +1400,16 @@ spmi_bus: spmi@c440000 {
 			#interrupt-cells = <4>;
 		};
 
+		camcc: clock-controller@ad00000 {
+			compatible = "qcom,sdm670-camcc", "qcom,sdm845-camcc";
+			reg = <0 0x0ad00000 0 0x10000>;
+			clocks = <&rpmhcc RPMH_CXO_CLK>;
+			clock-names = "bi_tcxo";
+			#clock-cells = <1>;
+			#reset-cells = <1>;
+			#power-domain-cells = <1>;
+		};
+
 		mdss: display-subsystem@ae00000 {
 			compatible = "qcom,sdm670-mdss";
 			reg = <0 0x0ae00000 0 0x1000>;
-- 
2.47.1


