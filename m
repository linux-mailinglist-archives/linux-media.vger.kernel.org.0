Return-Path: <linux-media+bounces-41879-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A9A1B4663E
	for <lists+linux-media@lfdr.de>; Fri,  5 Sep 2025 23:56:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 403671669B8
	for <lists+linux-media@lfdr.de>; Fri,  5 Sep 2025 21:56:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D25162F3616;
	Fri,  5 Sep 2025 21:56:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KHmhoK/B"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com [209.85.160.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBAAD2ECD30;
	Fri,  5 Sep 2025 21:56:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757109373; cv=none; b=AUJUu24FzBwqUVtAFmS9hu4aDa1wqeq7Or3gDVtwhMwcwwdole+boWLLZGBxi6BazJNO15Varjko2yb7iFS0jBmCqP+5QiQ3lHsSrAT0U/8+k/EKmr9t7447FCxNAiztERTfdbfUPCpYBI6NnBcbvm2fI6w0c2Jw9O6CsetdCqU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757109373; c=relaxed/simple;
	bh=ddzpM4Bc2uxXy58Lr86RyP3jNAFV6WpXBES7ZZ1NEFk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=onD1vJIBjVrSESAY1qO8OCC/QfHk9pToK+WpHrSIrm1kMRYaoXzwrIvfBcbjbwqJEbLmK1ZLu/rj2lhAyOMPJUJATbD4/8eAeaZcC518IZlbFFZdP81h+xOttu/LSr4X3exE1uDMkMSdmIqyO5ePkUOVpmmc/v5j1RG7snvCByk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KHmhoK/B; arc=none smtp.client-ip=209.85.160.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qt1-f172.google.com with SMTP id d75a77b69052e-4b5f7fe502dso442641cf.0;
        Fri, 05 Sep 2025 14:56:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757109371; x=1757714171; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nK/UxbxUPtWKNibqhtJStOZ5sXU1VCBMVb30TCNL7nQ=;
        b=KHmhoK/BgGeNUNtgpyIb3EzVJ3p/f6UtowWCJnBaz6V18+RXK8icvDQHtD4oSXQhrY
         l/+c/EPNtvVpiGeSRPg/xZ37aorqg62K+MO1yhTRazGvtk3BWALoF+ug2JxoW9d8ukw/
         TFOEsCuAWq2fipvix7UrwxsmIdVzMWbDVvi0CAiO35wsn/AKArZ8Y5rn8lwlb+v68SAy
         jdf2jbWdWYolkX4K7RKtsauxhX8st0ogcev1PAUoDl5Y/VLMn1XYdbP3cwX7QX9QNiyg
         U57SDK5unu/q/dOMBUiDUUhVCPrGrocUmEW8kJ3fIygb772zsNn48gQEtlq6zczii+hr
         p6Zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757109371; x=1757714171;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nK/UxbxUPtWKNibqhtJStOZ5sXU1VCBMVb30TCNL7nQ=;
        b=MGh7SKuPRq0MNLpeSC9q7eI2TXzjCXt1BGheolifB+b+1gQoY6Ys60j8x1Jux5fdXL
         WPzqXOgHLlY3VPsQIw6g4Ebk+2YY6v8/3Iw6vX69itouxJ7Y1bIBCoUMSxP1MEfrGG8E
         vZNJqmL5RE7TwDFI++Trbe3QXDZSu1RI++NTYyV5ENwyzywYp+ukBY/nGEj3s8GdrQEJ
         UUcwGHKAemd7+UT9jE2mBjgs9oHFqrH0NgcEWUJkxM2Pc+t2y3VJYIwy57sXCKRjPNzp
         qraIBvkp4dauL8bsfqKUXhNju/ylIqR55zJXGcyLls38cdnvRnuA88C9IzIiGDXVnBVI
         e1PA==
X-Forwarded-Encrypted: i=1; AJvYcCU8ckrPg2hix7Ja16klx1T71927KRAXd4tKQpJvtNIoLFZZZewgaZ8ikGm8CAKge2e9kb04Melnfbew@vger.kernel.org, AJvYcCUBJ8LgufLNQtHz0BDeUvTrYhPAWsP7tTInW00e8vNbBG9kvRfSBskaNon/ehn0BmxXnLj/oMrEDL9C3CTPHw==@vger.kernel.org, AJvYcCXeWocGKvS5dRiqxKSQLdt7/o4xKMvkTO0CbxJItE2k1CJNVsDzHr4iMi/U9UZTxfLikFqhlvF1+D/4tgg=@vger.kernel.org
X-Gm-Message-State: AOJu0YzicpZvfjBouzRsWGK3WTIJuBqvzeD4IYtsECU5TrNlVkpVSRCL
	ke/kam0bITl1Ku8r5KCMUb8ibcWUYCgKxyFhFAXzYm40kGjtNvzEwAvN2rtPYw==
X-Gm-Gg: ASbGncuDSLQdpcUeMw1d+VLgPNOlPF2p7vkvvObIYIjjjB29HOrMThDaIuWYgMj58GH
	5nLdbG6lpVPL26inzHbdNt/0UkJoUG1R9VgNVf2hi93XrMe0B+YN5MoohK5jZ8XT36JWIyL4pSn
	lqw66MTkcMTucS/rwtDKFkWTIvPYq27TvCiZ7Ad4dqEAAT10lwbWoc4VWMriQhCncGO4GDPfad3
	MjKuGRlvrIN+5PcFbCB5KpikDrDVni6mJdQRN0l3Qw+Y48BcmGLhMbzQsfHOWqwvR2K5sh4h8x5
	oi8k3pJOg9HpXRy4KVhCQn2QkDkLr2tiK05YqOBarkGalaYwHAzVMN+L5aa5RfOimDjSkpO8ZHa
	Mp4PyrBf2cj3ngiVks6cC4Fl889M4DYrMdVfR
X-Google-Smtp-Source: AGHT+IF8g558gXUsPA38VbOTnUrB5dWpIeKYsu+caOTtWkmvTJ8UYPep8MAjo4or9FRa00CpjvCNvw==
X-Received: by 2002:a05:622a:4d45:b0:4b3:214:1eb2 with SMTP id d75a77b69052e-4b5f842606bmr2541541cf.47.1757109370497;
        Fri, 05 Sep 2025 14:56:10 -0700 (PDT)
Received: from localhost ([174.89.105.238])
        by smtp.gmail.com with UTF8SMTPSA id af79cd13be357-80aabb8288dsm547363385a.58.2025.09.05.14.56.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Sep 2025 14:56:09 -0700 (PDT)
From: Richard Acayan <mailingradian@gmail.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Tianshu Qiu <tian.shu.qiu@intel.com>,
	linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-msm@vger.kernel.org
Cc: Robert Mader <robert.mader@collabora.com>,
	Richard Acayan <mailingradian@gmail.com>
Subject: [PATCH v3 3/4] arm64: dts: qcom: sdm670: remove camss endpoint nodes
Date: Fri,  5 Sep 2025 17:55:20 -0400
Message-ID: <20250905215516.289998-9-mailingradian@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250905215516.289998-6-mailingradian@gmail.com>
References: <20250905215516.289998-6-mailingradian@gmail.com>
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
2.51.0


