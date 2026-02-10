Return-Path: <linux-media+bounces-52484-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wHjfIwCuimkKNAAAu9opvQ
	(envelope-from <linux-media+bounces-52484-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 10 Feb 2026 05:03:12 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 320CB116D2D
	for <lists+linux-media@lfdr.de>; Tue, 10 Feb 2026 05:03:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id A5EE2300908E
	for <lists+linux-media@lfdr.de>; Tue, 10 Feb 2026 04:03:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 78AC0280329;
	Tue, 10 Feb 2026 04:03:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YblhxgPc"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-dy1-f172.google.com (mail-dy1-f172.google.com [74.125.82.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB8F31624D5
	for <linux-media@vger.kernel.org>; Tue, 10 Feb 2026 04:03:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770696190; cv=none; b=qtG009pG34dfATDn1mcUG54jaqJDqGfTZSuc8W1RbZcbLgAX83nTRbXMPI8Zp8a+gurgjFfr0XlwfnE5vyiUXFW4oj2/ywvjsv0G2GffbwrGxyDMepqIuOH8MSnxZZHLOhNnCFKcuKqJTSin0uyVV6pilyGP7P48crtFxve+/Sg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770696190; c=relaxed/simple;
	bh=BGFbjAQGLZNXddJ7Zbnf+eR42ONlD2v8hRdM+CSNiEE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VBHSkyr5SmU8iVxIv8jP2ZBo1UYBQqo/MnTLX4J+13ZpI+g8SaS2Oj8Y3ofWP6xyLgulZQweV++BJn85uDoKKkq1DkDQcNUgFXqE5H2NWDYoSapJh1/xm+/bLDMUjTy+13uYZd3daFz7QFwbbrd2FYZwcQkVE/VxIHgRZ3qyAH8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YblhxgPc; arc=none smtp.client-ip=74.125.82.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dy1-f172.google.com with SMTP id 5a478bee46e88-2b82c605dbdso989234eec.0
        for <linux-media@vger.kernel.org>; Mon, 09 Feb 2026 20:03:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770696188; x=1771300988; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Q42/v/aKtXIsSN3fGfEiA94YbSmv523XY3uYLKo5rl0=;
        b=YblhxgPc25kWfTzaEBn3xgOHqVpTivGXdYniMgJuXTLbrmOhfhXFdxIDE9MOTV/97h
         j/8WNUGaYCuR1/6NMLSURmLZ5d+msghYI8r1I2mdeMpOOapI925/KErzP1UC8RUHoryo
         0f/yn/EgxPXHmEcri3tkX2LpqpanXIMa7uyZMgd7uf0XbQ4FtQa0aXkLNduoR+wYIlHd
         YomYvmOIcay0V5qLQQAgAMljtRn0zVAUpmkBEEBB8OH5lCCyQjsXsSyR7an7NxL2WtSO
         sWpl6XSE09QXDPoKx2aYFFxWviHL+dQ8rbe27XAYxpcEUlqfQj6TZHUPcEuwRO8ezai1
         z6aA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770696188; x=1771300988;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Q42/v/aKtXIsSN3fGfEiA94YbSmv523XY3uYLKo5rl0=;
        b=H8EYiUIUEQt9qCCy5VqrvZEC5i7VjcAfsaKC1rROgh69lCoNcTh8bN9yaLE84GQk5e
         X5RfmURjb1f+ui5oUhD/WCkfxY6POpShQiYUHeSRRJzROcTbaFKqewIpUH9ZVN8kl5ig
         J1qA6dOXyWpaRqusePIVTukQgXHgz1gAmksN7Bph/N5cHm8J8LW/vQLIPqTToFpbkoEt
         vD+CELmAl11gYAOd9BB+bOxt8gmfde620j5qDThYWTbfjF1ILnuKup34HFQOsCXpQ30K
         qFZpDFQ2JzHIXkRwSGe8AMLxQVlXMlakANz/WAO7C0YSSG98rw2xZnJcUGsHDlpsSeCr
         ah0g==
X-Forwarded-Encrypted: i=1; AJvYcCXNUWELCdH0PNp4zuyMixJx0OFRxIVxn15bpu5G0ka+UIc5f3K0iqbtoLY+FsLVOsVJgz7k2wO+SW5v/Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YwC75mHVdBOqU6P76xabuPptD8MYmJtOiX+14yG4mnQQhx/rE/f
	2cowECWG1ydPZ2bN4a85CGq2TK1H6LW62GjLppGT5fTfjcRMf31Z8z9EQRp8Gg==
X-Gm-Gg: AZuq6aJD7aKodOZbtwRVd6XHKo//OLse+PxiX4e9DWyV5ZysiKZJPoZ22WpklELv1/c
	5ROpnIzU2EGUueMnDekkHRfcFFRGr4+yLNCP66QTN9upxo/xeznoHijSrnGuCOtBtmL1ffcxhrJ
	ABvmEd5XO3O9fU8qBy+8i2+j689I1dFOFJbdDQ0DiJIRVBuWRCIVCaoNW/kDTvSDHxNoi/38Cr+
	NmPxxJX4V89VPW4el2VwmpqFTHxXjpx7/erPnYnp/Ymv6cIwsiAWxnwAX+EJqKAZk11LLZ3Y+89
	LMyyDMQw9O9hXM/U7KSSeSSOWVPPCV1i58ina1NTxB7Bpxv87ApUsKaFwOzuK0ae+ZEj2TFyhPp
	FO9nTS5CrM5iN4cZ4ItzoinU3NSqX4+gr/NFU2PqvEPqb+EDTIgVH0+8yuwBiKqGNwly9LdAyP5
	ANfueBl5SpdJ/cXBxJbD3jgKELxr2yiYoFjLiacWjckZ/F9V7sdIlm5ODv2CGFu5AV6oX1924Nr
	/hwt27FQ3ZZAU8=
X-Received: by 2002:a05:622a:143:b0:506:1f11:f5ef with SMTP id d75a77b69052e-50639a19051mr189985021cf.73.1770688903651;
        Mon, 09 Feb 2026 18:01:43 -0800 (PST)
Received: from localhost (bras-base-toroon21-grc-75-184-144-58-243.dsl.bell.ca. [184.144.58.243])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8953c03fca0sm89313956d6.28.2026.02.09.18.01.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Feb 2026 18:01:43 -0800 (PST)
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
Subject: [PATCH v8 6/7] arm64: dts: qcom: sdm670: add camera mclk pins
Date: Mon,  9 Feb 2026 21:02:05 -0500
Message-ID: <20260210020207.10246-7-mailingradian@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260210020207.10246-1-mailingradian@gmail.com>
References: <20260210020207.10246-1-mailingradian@gmail.com>
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
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,linaro.org,intel.com,linux.intel.com,vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[19];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_FROM(0.00)[gmail.com];
	TAGGED_FROM(0.00)[bounces-52484-lists,linux-media=lfdr.de];
	FREEMAIL_CC(0.00)[collabora.com,ixit.cz,vger.kernel.org,gmail.com];
	PRECEDENCE_BULK(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	FROM_NEQ_ENVFROM(0.00)[mailingradian@gmail.com,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	DKIM_TRACE(0.00)[gmail.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Queue-Id: 320CB116D2D
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


