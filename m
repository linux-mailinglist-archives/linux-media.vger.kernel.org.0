Return-Path: <linux-media+bounces-23516-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 4138C9F3D94
	for <lists+linux-media@lfdr.de>; Mon, 16 Dec 2024 23:31:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 762BA169285
	for <lists+linux-media@lfdr.de>; Mon, 16 Dec 2024 22:31:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E20091DA2FD;
	Mon, 16 Dec 2024 22:30:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SHjak/vM"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-il1-f178.google.com (mail-il1-f178.google.com [209.85.166.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA55F1D9595;
	Mon, 16 Dec 2024 22:30:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734388249; cv=none; b=MfXzukLki9tixGtWyhTFQqKzdaFnO6KP6PT9TUFhH3fnscPfH/iS1x3Kz4i1Bc/yp8mD/qof77PLBCfCtIr8MDQECwtpR/y7w4fymqdDdD4HHAH4oP06A2IpHYBnBXUmgCsG9ObaanabbFGq804bwbRGkgcU87yHPmyHit/C4G8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734388249; c=relaxed/simple;
	bh=cA8ia9gUiiYNXiF6cnwGU5yb3IDiwQmbEW9UlFxwV/c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=sN5MkY8gQes5pCkerqdRlHg7Gr5fy/Tuchi7hfTzZJztttUzDxZanMw1b6vbSGaMKQAkimaNgnSivOeHg85Pxyo2MBwGDm0G8n0cda8zF+Llq44e1FhVn9DTNULH43gOj5IiY6OH+qA24VWiOKTLl9FVW90v38baP5jI4eXDDsU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SHjak/vM; arc=none smtp.client-ip=209.85.166.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-il1-f178.google.com with SMTP id e9e14a558f8ab-3a77980fe3aso15333025ab.0;
        Mon, 16 Dec 2024 14:30:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734388247; x=1734993047; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=riRl3ZaZxwmWu/pRGOcAcSHXuWSTMJ3QmPDQGJ4LbYU=;
        b=SHjak/vMi+Y2Gnty9Y1uXduqANlGltQW97LQU8qgpqreUaROoXWzzVE/Mbk8YUIZz3
         Buz0oOtf9+GNWM3EatlaMhypTNrqR2sa0ZHRzzLy+AtQbN2vLWrvTWXa/yBX+L8bYhH1
         VvbYQWUhxwCi81mDi9J4jFfLLOmdQQIJKIn0cK7c92aiwaWAV94QiiLosEeraXzuagg8
         RrPgVqEFXQ2jJXSCHtxMRfiklAzktAEk0jVSzPgGXwdr1hXzPTgfwuTRUylfnhCMJc8M
         tqOdkPZ8c2606d6VrWzVuRQz0eoQtX2q9ylKTpAw2V/yjSrodATqv/Q/TGzayq6bYLpw
         d/FQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734388247; x=1734993047;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=riRl3ZaZxwmWu/pRGOcAcSHXuWSTMJ3QmPDQGJ4LbYU=;
        b=AlzMaDXNMAPwZwLcweJz/0roeTNs1nvusuOVE4jIG7vnaBkZFK/E1mseLGI2Cp0jz3
         wRJ+ZUFPdio0A0MJRT6PFn5iFX+NsVQgb3Dre3OlesG64qpGHmgjD10fTr41oTf0v+tD
         GgNi+JMFhQHz8b0chVeyIZMC7eX7ZyASwlXUVT0COGEIBVDfMlXQET+YxngO5dm6Y7G+
         LYvTdVPyc+xrjgyRvIn7b10Eiry0hBV1Okv4ur+tjFh7DnpcsdXMDdLEDfQ3iecgNsFm
         NGcCseHG21gjkaIz1FrBUgT49xpnMWNusYk9RtsyZYl3joT1lWWa2KsQF6uLc2tcm2YT
         FzHg==
X-Forwarded-Encrypted: i=1; AJvYcCUqN9M4QBiUfiviFINY4b872R+RX70rX0ZfwsUaxRDhgyHLpt4c6aYbw3D7RZztZlWPBq9QAr9MymIMTxI=@vger.kernel.org, AJvYcCV6Xq2u3nBn5JShtX0I7QIc+IGPRNUsX2dQiii3qtOZirv0suXiPf7iQRHk7jOngn+j4RYb+iTG2GBu@vger.kernel.org, AJvYcCWWWXfYPX6yfYkk9IzP4cwudkv8X7Usb6+KfrxsBUwjlLwpRDmoJwjRyliMm80COWyyMKOrEPpRiqLR@vger.kernel.org, AJvYcCWsoBVpxVldIBmkxNLB9mePnBfcRo0wBQ2OUNj3wSdDsgOtrvXLaUh7DgrY+icjdNYau4lUH6JJzanmAqq/2g==@vger.kernel.org
X-Gm-Message-State: AOJu0YwmxAgXoRdH7umgaWJD7KRmdBUBiIRrTfDhIGYxL69XC1f04LLi
	zozZN6JhW/bzz+VVAvyp9Y73cCaq3WY53fFHA1tkKaQdHggNy0y6
X-Gm-Gg: ASbGnctmapYfL5sl13+1MqeObN1/u7a0qgT4MnPIX0mhXKayX8F0HfJs+t7mAlxNH9L
	eEj2IYqShPL7DyOxkOW9RNayFOVJ00+OaExtb70bdSsqKEa9ecOG6WWNJgZmLsGVCgwZu0Ruiap
	jKT0R2DGVSms49hiOL5vVs+ORnI08Chu0zn50Xnkz8bjHO/Tmm0ey6AB7II9ovCWTyrxjxPQ/MG
	JtZ2/u24mzRCzr2g+9Fd2U16blthYlf4bZE4X6kv+iL
X-Google-Smtp-Source: AGHT+IFty8oOihyivle+8peJGnh6EmrnG8Ai/vww0qs6bD9CwGd2q3ARpqE2MtX7XaA9wksjI7r29A==
X-Received: by 2002:a92:c145:0:b0:3a8:13d5:bd2c with SMTP id e9e14a558f8ab-3bb076fd9d6mr11316335ab.2.1734388247037;
        Mon, 16 Dec 2024 14:30:47 -0800 (PST)
Received: from localhost ([2607:fea8:52a3:d200::d916])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4e5e32a336bsm1419661173.100.2024.12.16.14.30.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Dec 2024 14:30:46 -0800 (PST)
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
Subject: [PATCH v8 4/5] arm64: dts: qcom: sdm670: add camcc
Date: Mon, 16 Dec 2024 17:30:25 -0500
Message-ID: <20241216223019.70155-12-mailingradian@gmail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20241216223019.70155-8-mailingradian@gmail.com>
References: <20241216223019.70155-8-mailingradian@gmail.com>
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


