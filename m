Return-Path: <linux-media+bounces-52944-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iOiMAkK2k2l17wEAu9opvQ
	(envelope-from <linux-media+bounces-52944-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 17 Feb 2026 01:28:50 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EE171484CA
	for <lists+linux-media@lfdr.de>; Tue, 17 Feb 2026 01:28:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E029B3029E4A
	for <lists+linux-media@lfdr.de>; Tue, 17 Feb 2026 00:28:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0060A265623;
	Tue, 17 Feb 2026 00:28:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MwTyHKlI"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qv1-f45.google.com (mail-qv1-f45.google.com [209.85.219.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D2FD23BCED
	for <linux-media@vger.kernel.org>; Tue, 17 Feb 2026 00:28:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771288104; cv=none; b=nRzbBgUlsp3ugPT4RjrKZQseuVkV2V6TqH8b3fiHdFhcbQ3Rxka2tj8KyPkpnxLPD6O3tb0stD3tqN6fXLb//iIGyKW1jRX9Dm5GwSx3yEGLplgyRi5G/v4/Nv+7CxbFmwo0YqJZe0/DKPggUr28y3Jpq9p5xdmeFRVH2Rqx7BA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771288104; c=relaxed/simple;
	bh=BGFbjAQGLZNXddJ7Zbnf+eR42ONlD2v8hRdM+CSNiEE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=TFZsAq1lScUNcwjERpDP4IH8JaqFzx3N5ecqwvl/9rWPBbM+qo+agp/qmTd2wmVjZBaxNuUWADicZT+QXQ7fcKTJPoVvfqcVvrBZQCO0n0bQ2R+0ThZuPToyTFfzqMtT+ROrYKphlQYcorlw2WKP4TMo3kER8QSHP1rn5TePGTM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MwTyHKlI; arc=none smtp.client-ip=209.85.219.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qv1-f45.google.com with SMTP id 6a1803df08f44-896f8feee14so53697836d6.0
        for <linux-media@vger.kernel.org>; Mon, 16 Feb 2026 16:28:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771288102; x=1771892902; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Q42/v/aKtXIsSN3fGfEiA94YbSmv523XY3uYLKo5rl0=;
        b=MwTyHKlIZHZ0Bo53e48FiloGFvENqQP39UE+Ihv6dsOFDaxVKKRj8raRFeHW10y+u/
         ERaxic/7bgaNXKBlOIDBsKPQRp8KWkCkBlDzOhjBPtlHUPBkDgKT8rT4n/Xh9JHh0t6W
         BdXaPGvpJH3mPIqKxftonfMc3cGpCCozYgWBcc5bKX8DiCSWRD7zUu447qARkISZFeb8
         KDoOw6v7CpnwGF/3VDg4nXA1s9+tITHMTo7x6eu0eQsnEpR458FG3hyv5K1rgq4rJV8h
         Msv67MI3dTOweSzkNfAW4d6pmVp4cXek1I+XYBpGBfX3V84Gfid6FK1Vcm40eKerlRh0
         HMxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771288102; x=1771892902;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Q42/v/aKtXIsSN3fGfEiA94YbSmv523XY3uYLKo5rl0=;
        b=F0/G7smvoDVfeBxZxqkHmcVKL/Ib0Qt+DVsnc/7mzbhU9LQRgOoxnwp/69gkSakGdI
         uJGUnZ92oxdy0Sj+hY41kdXP4w9JCkLlHZ+W8iD7n3AGRWuCneR6jwlO5PIYU6daWvmG
         2thCNWRCdu27+XIELIsEagGxDTWpvZ0vXJPs6YlK2+DPRaIhk6xERSj/7RGbnXKlBnzY
         0QdfFNvyMLL9Bi76Tl4ZYnH21GGhJLbPK0AbYGFIa+PFsh6SAKjXW7Oj6vmx2nvhdR4Q
         RZM2uGAufOcpC+GByt3s4drgK/vTjk7fN8VFvsDHMioT4wdXAeqHTuvFQoMSDD31wK8F
         hyvA==
X-Forwarded-Encrypted: i=1; AJvYcCVfq7fmWp8QsO0/Gy7tDETXkfV2vR3F0OrUga5cc+D/rlaLdQTQ1fvpXVF/4PRCJSBpKOTbTlCRO8BkTg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzfKO3GXvQZYr8X3xWJpGF84ZJTcyETjPF1Ym2EjFUop82fyoOs
	HduO65c4e8oDWARMGK5v5bDc/AATMaMw60Hq9iN3gh9rp2rlfoSfezA1
X-Gm-Gg: AZuq6aJ+tLa0OXZILLBwE034dNw+Dn7dsiui7qKQBhs5PHu8bLUXzNq4NYEy/lk0B6x
	U2TeG1EfKFt3TDXGvwyvQtB8K2zJkt4HkhV/WpBxnLQox0nc2RUv3fDXhL7l3t5Z+SKCyRBj1Cz
	+rTon13ph01k7YMxRRMvFleWCVtKYeL85QeOx3N7cZkfoxC5EZe5IyhBpYo2zx7hkNvoXV50p4t
	C62Hy8gHvuHuptBwNrVGGrYWHKJqqHo4htPD9Xepg1lQXsboyHpfmFPOssRXW7dH7SNYNEtKuVz
	bYhrVnJfDNk3/Sk5rudiKK73UfZlLJrhaYpFwaiwEvoekeXg6Oxg5ENAy+OfFnOQGXmcp1Futv1
	ONxHQPmWWSCpAHSLzmBdwPwec9ApIm9CFxRvBRMTXCWJBv4G8ikcDgIBz9sl5BvK4MLFK1TN16e
	3LATP3KDowRKleWzWZrfn0kS0WS4XtMA==
X-Received: by 2002:a05:6214:1c86:b0:894:768a:a8c1 with SMTP id 6a1803df08f44-8973628fdcfmr162944716d6.66.1771288102314;
        Mon, 16 Feb 2026 16:28:22 -0800 (PST)
Received: from localhost ([184.144.58.243])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8971cc7ff1csm150951216d6.3.2026.02.16.16.28.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Feb 2026 16:28:21 -0800 (PST)
From: Richard Acayan <mailingradian@gmail.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Robert Foss <rfoss@kernel.org>,
	Todor Tomov <todor.too@gmail.com>,
	"Bryan O'Donoghue" <bryan.odonoghue@linaro.org>,
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Tianshu Qiu <tian.shu.qiu@intel.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-msm@vger.kernel.org
Cc: Robert Mader <robert.mader@collabora.com>,
	David Heidelberg <david@ixit.cz>,
	phone-devel@vger.kernel.org,
	Richard Acayan <mailingradian@gmail.com>
Subject: [PATCH v9 6/7] arm64: dts: qcom: sdm670: add camera mclk pins
Date: Mon, 16 Feb 2026 19:27:37 -0500
Message-ID: <20260217002738.133534-7-mailingradian@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260217002738.133534-1-mailingradian@gmail.com>
References: <20260217002738.133534-1-mailingradian@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-52944-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[19];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,linaro.org,intel.com,linux.intel.com,vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mailingradian@gmail.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[collabora.com,ixit.cz,vger.kernel.org,gmail.com];
	RCVD_COUNT_FIVE(0.00)[5];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[0.51.225.64:email,linaro.org:email,qualcomm.com:email,ixit.cz:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 5EE171484CA
X-Rspamd-Action: no action

The camera subsystem is added for the SoC common devicetree, but the
mclk pins should also be common across the SoC. Add the mclk pins for
the cameras.

Suggested-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Link: https://lore.kernel.org/r/5135823c-f2e4-4873-9e3a-9d190cac0113@oss.qualcomm.com
Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Reviewed-by: Bryan O'Donoghue <bod@kernel.org>
Reviewed-by: David Heidelberg <david@ixit.cz>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Richard Acayan <mailingradian@gmail.com>
---
 arch/arm64/boot/dts/qcom/sdm670.dtsi | 28 ++++++++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sdm670.dtsi b/arch/arm64/boot/dts/qcom/sdm670.dtsi
index 3eb4eaf7b8d7..f21e60a6a2ef 100644
--- a/arch/arm64/boot/dts/qcom/sdm670.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm670.dtsi
@@ -1196,6 +1196,34 @@ tlmm: pinctrl@3400000 {
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
+			cam_mclk3_default: cam-mclk3-default-state {
+				pins = "gpio16";
+				function = "cam_mclk";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
 			cci0_default: cci0-default-state {
 				pins = "gpio17", "gpio18";
 				function = "cci_i2c";
-- 
2.53.0


