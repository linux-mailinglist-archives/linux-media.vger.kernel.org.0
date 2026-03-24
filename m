Return-Path: <linux-media+bounces-56790-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OJXqC6TwwWkdYQQAu9opvQ
	(envelope-from <linux-media+bounces-56790-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 24 Mar 2026 03:02:12 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id BE72E300DFE
	for <lists+linux-media@lfdr.de>; Tue, 24 Mar 2026 03:02:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id DC749303932B
	for <lists+linux-media@lfdr.de>; Tue, 24 Mar 2026 02:02:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 35CE437B41A;
	Tue, 24 Mar 2026 02:02:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IASRu3g1"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com [209.85.160.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AD3C36605A
	for <linux-media@vger.kernel.org>; Tue, 24 Mar 2026 02:02:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774317723; cv=none; b=sQNfU97kI+CEa9/Jpb8rwnVlq90pcO0xtL3PWslScAufTJGyGlCx3kqQkO9qWf8Yr00ks6L2mT0bkF4+WAHNf35xXbXjkAPx53wLaXCWusLAJeB3m4zjyysRIAhAbiLQJ0UIn2uum52hO5FeWkDbkzChdhpYGx++haxhooJWQQc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774317723; c=relaxed/simple;
	bh=qu8bAAJfjLJVtPJ0M7mvCqS6W5WISRGIXt9zkmXzxvo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=B0o1m8yPSTEPSqwhEspF0mlXjtingX3WMpNHOGS26w90jchnn+tfASrDHDkJTTEr5SGjFRyqZ1sB+lwfvJS/Z+jeth0DqJb5FsY001ikuG8CCYiHhkSu64c7Sm+pR5h8WtFisziqUsMWkvwZrZArXClYV4N/POKrhogxT6Td1do=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IASRu3g1; arc=none smtp.client-ip=209.85.160.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qt1-f175.google.com with SMTP id d75a77b69052e-50904a8f421so33564681cf.2
        for <linux-media@vger.kernel.org>; Mon, 23 Mar 2026 19:02:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774317721; x=1774922521; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qJ6iuzD3e1xlHjcAVLCKvAnVJFh4LA+GcQW5nRxzCOg=;
        b=IASRu3g1z9MjeM9r2pzebIzPqz7ulMp+r8KhkmIMbMji3jmqer7+F5jcuo1VLubN+r
         zeNyPJxWyEc+GZHQrn5ITV9pm5sRNsJzr/UoJAdU1jSyYndEFAzLAI+sJTFJvscBxMJa
         ebyX3daaZsXhLRRALIH9cGEThaF3N/m0CTPbngsFVpwZpPpdXAWURdU4aINa3CNQ5qJf
         FDsEcTnwK1mdPKZWAML/dJfV7gejEQcicZ9s8w5x/k33vuxxAefRkDkr8308bjBNqK6L
         wwuKPJjRk6cos7z9/yNhjfXOZY1X583YHJejP6oGaZaSAWK5DH2dLJagmMOBp3gdI9+l
         p2Mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774317721; x=1774922521;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=qJ6iuzD3e1xlHjcAVLCKvAnVJFh4LA+GcQW5nRxzCOg=;
        b=YPvR55Rx+6ubV5T4TbZ+dN7yHWHSM3UgPEAYf7tVLi7exNttsnjONpS2oLKYCtVXrh
         rsSo2TS7kL8d3iEo8nK/V940wPerLyhGR7/vT9i+0fr1cOnphKDxV8UUcfPo0sH0Q95s
         RMc/PwpeMKjEt0Ub2FIgdZ2yk7h2xCsmepnZjUtfZxKLwwNmhnIPmGkmwtWDedaoPH1V
         +YcaiLnSkVf0KhsYMWXQBxMJgmv8g2uECkaw8hth67G7JXIU9wrXDY1m8gDJ0zx5ljKm
         YmM41zlcqJxwk8otr7RstjWDEw0bFsLeFd2gnyj6DXO2GoZrytKWew3YBfZpZxhsdph4
         zE0A==
X-Forwarded-Encrypted: i=1; AJvYcCWx8NGBYYZcqi12RRY6m47M7nXR2Et1LnZyrSlIXOKNH74brHjic8Qsiy5fHjc2wPiK1KNCD1Wp/MSWwQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwexMdt8zB7sIlFDrUerZzUzQdVFbKuTPcOrM2yMe6Gq/h4ftG/
	hIPuHh7eYsspvlPaZJxfh4ROmsfq2SWwXVVSjaaJji2IBBFCsFe4wvXH
X-Gm-Gg: ATEYQzymw19m4V2sTxmwyUDL2oQMyGw/YQMSify+J1yet4ggDjQad/FrQO+okQyrI+f
	u8MRywDu30sd5I/RSCIrh6yDp29cUKHbgL2DB3z4jMkieWoNVJVNvtP4Cc7DdLF/gwG7hfuPHQR
	Yvaw4FLIOpx006Vf8uyOsOMSiChJzsT5ZjmDvWbOnJajCC884kT6Hy2I5ONEcafeWY8FEWYKfHv
	+tJUW3vbmFHvmTn5KWouYvU0J7blA5o0vts20wk9gZcz9KRAGEwtRNYJmaIw2fPJarauoj+XTo+
	Mo0LlSP6Ap+qoVpXCoTGspfv+kJ/FwcGToXlAa/fRGhTJvwaSVMN9v7MQ6HuVH8defpn3t7BKee
	iJFtlhIc6593T25EqHA4w8+7sn1eKkdlA/WDncK36WI0/PBy7s/rK/3Q+ej33cSOdkGZfrXaFAy
	HBala0hThZySUjQpGeSNAah1Ke6ykdxKp1DYpDmy5tgkNiyymRnXhpP2GVLCEUAnITHDW8dn6Tf
	KEO4wzVbOKuoqE=
X-Received: by 2002:a05:622a:1baa:b0:50b:460b:650e with SMTP id d75a77b69052e-50b460b6d72mr180422571cf.49.1774317721246;
        Mon, 23 Mar 2026 19:02:01 -0700 (PDT)
Received: from localhost (bras-base-toroon21-grc-75-184-144-58-243.dsl.bell.ca. [184.144.58.243])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-50b36e5b98bsm97538511cf.20.2026.03.23.19.01.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Mar 2026 19:01:59 -0700 (PDT)
From: Richard Acayan <mailingradian@gmail.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	"Bryan O'Donoghue" <bod@kernel.org>,
	Robert Foss <rfoss@kernel.org>,
	Todor Tomov <todor.too@gmail.com>,
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
Subject: [PATCH v11 6/7] arm64: dts: qcom: sdm670: add camera mclk pins
Date: Mon, 23 Mar 2026 22:01:31 -0400
Message-ID: <20260324020132.8683-7-mailingradian@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260324020132.8683-1-mailingradian@gmail.com>
References: <20260324020132.8683-1-mailingradian@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-56790-lists,linux-media=lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,linaro.org,intel.com,linux.intel.com,vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[19];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[collabora.com,ixit.cz,vger.kernel.org,gmail.com];
	DKIM_TRACE(0.00)[gmail.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mailingradian@gmail.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-media,dt];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:email,qualcomm.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,0.51.225.64:email,ixit.cz:email]
X-Rspamd-Queue-Id: BE72E300DFE
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

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
index fbd16b1f3455..f115bc6e64f3 100644
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


