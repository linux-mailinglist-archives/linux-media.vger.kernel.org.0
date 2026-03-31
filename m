Return-Path: <linux-media+bounces-57813-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CHd+JcQlzGnHPgYAu9opvQ
	(envelope-from <linux-media+bounces-57813-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 31 Mar 2026 21:51:32 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 342B1370D9A
	for <lists+linux-media@lfdr.de>; Tue, 31 Mar 2026 21:51:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id F0918303DA95
	for <lists+linux-media@lfdr.de>; Tue, 31 Mar 2026 19:44:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BC9E9408241;
	Tue, 31 Mar 2026 19:44:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MaSqrzFv"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com [209.85.160.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC917413229
	for <linux-media@vger.kernel.org>; Tue, 31 Mar 2026 19:44:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774986244; cv=none; b=gD0iNNQRJzeafMk2K3uMyv6HQOOHlSc3oyC8Y1IoJXgEQ4K7ZcP4mi5NgVoWdAqRphYIibsDSaxwugyBqVWi2TSL6RANMrhZHqObY9Bt12v+02uKRA0K8v960m5XzfQN4dCdwwtA6Ji2DNQs6ks9JiywGrxiHUak06ROVJiB1Rg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774986244; c=relaxed/simple;
	bh=qu8bAAJfjLJVtPJ0M7mvCqS6W5WISRGIXt9zkmXzxvo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=MDh9svuzfqwlHGGZgUxJTPkC6jL0tRCvViuO9jP7hTf1aAWtuzG5tb1DilomwZvdnu6vsl3xCIa+6ePvbojzQgciT/OhQ03a6VhwvYToD/l2iK/9p7uxlDdG6JYLPEqQE7iXpz1fipldbRTLAoL7q9UorEvtUAF3YgNA2JhdNK0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MaSqrzFv; arc=none smtp.client-ip=209.85.160.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qt1-f177.google.com with SMTP id d75a77b69052e-50697d6a69cso32352391cf.2
        for <linux-media@vger.kernel.org>; Tue, 31 Mar 2026 12:44:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774986241; x=1775591041; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qJ6iuzD3e1xlHjcAVLCKvAnVJFh4LA+GcQW5nRxzCOg=;
        b=MaSqrzFvu7/R012pxX4YHaxaJfZnyJusNRa2WCGr4L5mZ0u5S5dBN9RzZ8QV1E/hRF
         gdNP8fkCOB2zKBkhmzUjtfBqv/2MWLYlDAx0mvLW1924Gn7drdoVjNCnqVBJ5PK1ooSL
         dbdyUQUeIdJscj6b2Uw6QN21EsUT59fThvdG+TYJ5ClZbh8hgs0M+CbjiaS03cPWe6NI
         YShPa8GfPrZ37zeNeLF/QxTZG6fhtT86y0Qq1JBm/i8I54qQqqF5IRfuTdynUQklc8Rp
         eR/f+KTW0bxUMXJhz4jEZ2JS4jgea3WsqVLaEm8AnLP2dNL+ryQsXbr1igSP+UmmOrKL
         V4iQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774986241; x=1775591041;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=qJ6iuzD3e1xlHjcAVLCKvAnVJFh4LA+GcQW5nRxzCOg=;
        b=BYm/5NOoB2dGHlZK9C4AFe6Jo1J6dXzYE+kK9K0bJArT5HOHF8ig+iloYHgQFaoYt0
         lMcT9W0xXFvTFgMMwuY1rxUxz+G/QrMFfswXrl26Nn4DWjZOAK/99DKai0sDX9Ntdp7F
         BLarwvZmUzJLfOnHVOFnmtfh3Hf8QyhG5+fOAt0Y2ftRYG1eVG0BG+KaRKo7Sq8UEkjs
         9qgSs7lDidr1RU8fCqeiZ3J4pgwfvOEBXOLEg8Zl5m4vJ5NmbscgAiMtUWmK2wcHn40I
         ba+mendHUj8/94elQdjcUpDN5ifvRc/yySANm+kloMfMykx74iruflagKfCb2Tuqh7k1
         vPWw==
X-Forwarded-Encrypted: i=1; AJvYcCXzmiKjF8jOWABZzZjJVUyHUbw3Kk09d3/DMaSOAUJiCBx6395o6RJFrVnc7qfnqGQE4BaqR3qqEsuOaw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxEhrARX6Ao5sHs5nfa6Jdj7fMWUQS3AFYlM9VIDswyzwfrIxFE
	urr+5bknd+teUtWltQP/7Su+CuEa3c07LnGGynMKg+qJ5JHR2zVKj4Vc
X-Gm-Gg: ATEYQzyeJ0Vj5WKWOpmL4c3e2D/UKPyVi63b/hREKxIMp/sTXUm0fhQf5amhXtdmFWT
	vHpmFfBFRRmT+mX38Q8bL3VXnYdTZQEuJPMo1N/DM8UEznRpORO5PL69D/EfQZRDCljxO9HsW2m
	k0XcEBpjADbH1wtBLIhaDjFB9iiFxcquXIOCwW+YcqydAZ0wWBPOb7je6i9q76ewBSumqiu1TkI
	Y5r2HEZ+HH3VlGWenFVYAgj/46zxp0lyF0xwdW31F2i+i1GuEtIbD9t719cKIP4rmMIs0nB7Jd6
	/dEemsTDnDwOfB5adtApn+SvgdKQWz0nGQtjyJtF/GCNAxKYyncyQdL1uwoROpWP0WT9wCa66ws
	iRnHA+RSSE6J7jHqKTxwcx1P17c0QqCLkOGWWR8UgSnjYdNdZ0hHXm/VKVoWWW8qv1YP/NQvGgw
	Jnu+BIPgrTt3plQW4novgoQHW31y+0m0dBFVM=
X-Received: by 2002:a05:622a:428d:b0:506:217e:b0e5 with SMTP id d75a77b69052e-50d3ba37cdbmr13816891cf.0.1774986241560;
        Tue, 31 Mar 2026 12:44:01 -0700 (PDT)
Received: from localhost ([199.7.157.124])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-50bb2c9c93asm114230041cf.7.2026.03.31.12.44.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Mar 2026 12:44:01 -0700 (PDT)
From: Richard Acayan <mailingradian@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	"Bryan O'Donoghue" <bod@kernel.org>,
	Robert Foss <rfoss@kernel.org>,
	Todor Tomov <todor.too@gmail.com>,
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
	Tianshu Qiu <tian.shu.qiu@intel.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	linux-media@vger.kernel.org,
	Robert Mader <robert.mader@collabora.com>,
	David Heidelberg <david@ixit.cz>,
	phone-devel@vger.kernel.org,
	Richard Acayan <mailingradian@gmail.com>
Subject: [PATCH v12 2/3] arm64: dts: qcom: sdm670: add camera mclk pins
Date: Tue, 31 Mar 2026 15:44:36 -0400
Message-ID: <20260331194437.41041-3-mailingradian@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260331194437.41041-1-mailingradian@gmail.com>
References: <20260331194437.41041-1-mailingradian@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,linaro.org,intel.com,linux.intel.com,vger.kernel.org,collabora.com,ixit.cz];
	FREEMAIL_FROM(0.00)[gmail.com];
	TAGGED_FROM(0.00)[bounces-57813-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[19];
	MIME_TRACE(0.00)[0:+];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mailingradian@gmail.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-media,dt];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:email,qualcomm.com:email,0.51.225.64:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 342B1370D9A
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


