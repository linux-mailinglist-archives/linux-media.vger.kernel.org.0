Return-Path: <linux-media+bounces-48609-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C8106CB47A5
	for <lists+linux-media@lfdr.de>; Thu, 11 Dec 2025 02:50:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A75FF304DEFE
	for <lists+linux-media@lfdr.de>; Thu, 11 Dec 2025 01:49:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 142FD19E819;
	Thu, 11 Dec 2025 01:49:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eXeu4XAP"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com [209.85.160.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65956256C71
	for <linux-media@vger.kernel.org>; Thu, 11 Dec 2025 01:49:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765417763; cv=none; b=XeOKo4Qdk1wG+BxgTi5avkEI33G58gZMPlLZAbh24bqIF/bfkgGpxMmb7tApLO2pZxycGZvQsLIN8MFxvCGiwyZrKUlHDEB34lIYFrSbuupweoQ0zIya2LCVzTGlObo7ujqrWhxoyJAo35nnE5uxP+HFJMt7v1QVkWm89+WBt94=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765417763; c=relaxed/simple;
	bh=eKctyCCAfDrhBUEBcPwgI9lj1QLDPhGH+AhjDzK1u2Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jMDkRje39RBvL1tLjwBiEUVqRGY8xNI4lsR690NpY9qxfuOwIGPObjD7/iDan/WlHIs5UcBJlRnWYTVF8AdmUXQ0i6G8RT19WtsPpJz6H2vhXd7so7j9QsTTttZWY3Y/i9rByRQ0BaeSf/8YBq94EokVWctiKvwY9ajUJkHC5gk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eXeu4XAP; arc=none smtp.client-ip=209.85.160.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qt1-f175.google.com with SMTP id d75a77b69052e-4ee4c64190cso3521541cf.0
        for <linux-media@vger.kernel.org>; Wed, 10 Dec 2025 17:49:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765417760; x=1766022560; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2KGtV4M5CkIi/MUg0AIlnUx+zFblebrmxOcrF7c98NQ=;
        b=eXeu4XAP9WxJBvvOlo0/B7viuoZNi+mhZfQtBuwFbwvyrTwPJC2SJPg9TI3dSugFQF
         XElOfXJI6tjtx7YvdxZLKcL6EqmadOdukl3H0P0/4gmSFXcVJ2m21NnTGgn9MIYZ+oS+
         2r83ynL+YohSe3eS7b4uP532zJ7aUa1c9t7slD0u5akmXUmOTSIPmxubmNjiDSgvYAi7
         6IvbI/LI3Bd+Z5POv24GzHuR0ioT4avn0aIMO3gAOocxYqYlGgVvIOzQ8V/N4I71d2Ck
         MgNstrHmwlbSIDltWfI5wNzlqlQOzplPMf0HJKX9czMoG2jAmeacLA500ZpJ+TKUAzdF
         kbGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765417760; x=1766022560;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=2KGtV4M5CkIi/MUg0AIlnUx+zFblebrmxOcrF7c98NQ=;
        b=PVTFB0FSVnPCDFnZiUyZJq84EFjnrrGXOPQhVRDAtAHOKsX+ICZGfc6lAFVjgSJiV2
         OdulyZYQpKCQ4txM5z0AcHWM1cmMSjA+pU0DOxDw5NLHnrg8Xh/RxPmtD5LyrmlmkFwL
         FQOl2qXaPVFs/neMYAJCtGmpcasrXbRcFmYx5pLtW2Q1LjPuxc/lShma/mwvlCnWxIt3
         gzV+8IT7J6dxmexNm19sXd61eTJvX/5O0l5WdzpsfDBgYJt6dVgoZaowg9QIz12a6goz
         8yElup2UyDOI1EkF3NpqRWBOPUubg7SIKOUj3W86N8f0FrCoVhKtv9dSiRw7u4+AWvYd
         gyPg==
X-Forwarded-Encrypted: i=1; AJvYcCUbYRmuQzZ1bTJVcIo+Lr8YDKA6G0KK2RCZN5w8FUa5+GtH59NOCwj9TiwpOyCND8SDr6iS8DQu3DOkQw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy+1hV+tVfzP2Etmb5juAh5zK+XRjStx+B1VooxL3mGaAdLfMxB
	eCwXPpOHbJjSY4/ijnnNInlpE0k5kGvdBiD7I6Rud0IDsnCUqSRh0UL2
X-Gm-Gg: ASbGnctzZUxbHobB19ksz0pmTIglZdKdXa3ULWluvoUS+2ph3j91zcbiLjkJaD4oVTg
	Ks6GlvHzINZPL5unz3HhQ9v9A+GH5BKHPOyDqcMMNX1PV0MDWr7fLRleKzdM+Zln9khb7yhLqg7
	rfxa18MlA/+aldJf1H72Qy1jt3Z/NSby96KW0lr/iXqM8Q4AkB9rWl2j1vZ8CzOnOQlzcq6ZHOq
	N4ba3ETNhRGemGiXy1+x53VpqeMJiyzNtLFbLjgGO0etZP7dNzjHb4YhgutTFMlkzHknvsKZYEj
	9ez3gC3hR0aUVSe9s2JoAt59ijgPLDxJpSbUodwmLRGs7cGM2DwP/3dWfeuNdiFT2u2+z8ftxhq
	eaqSPfy5T+PQSj8AKTCnQ9cC6jPgJIDzBlS9TgqFyFQHy/AWnCpUDiG/Kv6wMjPU4PqQdbKQ4W/
	O6NXkkhgp6LHoXQw==
X-Google-Smtp-Source: AGHT+IEHGFsZyx/nVfYXZ5QvErj5OZznYgvQNXzSO7zb8bnJmymaeGQswuqQ9EOEvZnOAOHp3amI3g==
X-Received: by 2002:a05:622a:8c3:b0:4ee:56c0:712f with SMTP id d75a77b69052e-4f1b1ae29c4mr60256041cf.76.1765417760232;
        Wed, 10 Dec 2025 17:49:20 -0800 (PST)
Received: from localhost ([184.144.58.243])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4f1bd58d034sm8948021cf.5.2025.12.10.17.49.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Dec 2025 17:49:19 -0800 (PST)
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
Subject: [PATCH v4 4/5] arm64: dts: qcom: sdm670: add camera mclk pins
Date: Wed, 10 Dec 2025 20:48:45 -0500
Message-ID: <20251211014846.16602-5-mailingradian@gmail.com>
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

The camera subsystem is added for the SoC common devicetree, but the
mclk pins should also be common across the SoC. Add the mclk pins for
the cameras.

Suggested-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Link: https://lore.kernel.org/r/5135823c-f2e4-4873-9e3a-9d190cac0113@oss.qualcomm.com
Signed-off-by: Richard Acayan <mailingradian@gmail.com>
---
 arch/arm64/boot/dts/qcom/sdm670.dtsi | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sdm670.dtsi b/arch/arm64/boot/dts/qcom/sdm670.dtsi
index c275089237e4..69e84cd8ed27 100644
--- a/arch/arm64/boot/dts/qcom/sdm670.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm670.dtsi
@@ -1190,6 +1190,27 @@ tlmm: pinctrl@3400000 {
 			gpio-ranges = <&tlmm 0 0 151>;
 			wakeup-parent = <&pdc>;
 
+			cam_mclk0_default: cam-mclk0-default-state {
+				pins = "gpio13";
+				function = "cam_mclk";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
+			cam_mclk1_default: cam-mclk1-default-state {
+				pins = "gpio14";
+				function = "cam_mclk";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
+			cam_mclk2_default: cam-mclk2-default-state {
+				pins = "gpio15";
+				function = "cam_mclk";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
 			cci0_default: cci0-default-state {
 				pins = "gpio17", "gpio18";
 				function = "cci_i2c";
-- 
2.52.0


