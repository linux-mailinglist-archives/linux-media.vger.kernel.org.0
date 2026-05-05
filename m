Return-Path: <linux-media+bounces-60486-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +NSECCpl+mmnOgMAu9opvQ
	(envelope-from <linux-media+bounces-60486-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 05 May 2026 23:46:18 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id B75754D3FDF
	for <lists+linux-media@lfdr.de>; Tue, 05 May 2026 23:46:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 6C01330010C9
	for <lists+linux-media@lfdr.de>; Tue,  5 May 2026 21:46:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9FC373AEF3F;
	Tue,  5 May 2026 21:46:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RHG7zdeg"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com [209.85.128.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C23E4263F34
	for <linux-media@vger.kernel.org>; Tue,  5 May 2026 21:46:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778017569; cv=none; b=F4P3NyNMrre7L1x3atxVVzThGdcvqT6mQpViDSzs3Dg9UDnXH8ddYuYDnWj4iDLmaK89/LOMcd7jPWz6H3wNzS7/ThIM19WN7Ih+QOx//0349GhuQhaizG2F4uXvb3K7ZyaXsVczLU7ZizN91Z64N3zW0FD5rQHkgOCjfvdfxRU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778017569; c=relaxed/simple;
	bh=4m526cz1cKf0Pbx5f0LjtGmUDeZ9tO/nddK2KJIgQXE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=lTLtPWq8tL2X5QpcN9fxqxqG+Hsyec0f2e5er9mVwZAu3lJzm7xNdZqfIbedg2l1+JLyI+OnqF3ajzhImiWNhipBUrgGWx0dob/ucEk4XBnaIsm9v0Do3TgJj98vnBieW7UnBpXypwWH7hFPV8X9/F5zC5mB3am+XtcncvWmYYQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RHG7zdeg; arc=none smtp.client-ip=209.85.128.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-7bd8c55c885so33192017b3.2
        for <linux-media@vger.kernel.org>; Tue, 05 May 2026 14:46:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778017567; x=1778622367; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=B7JxHCZxuN/7G1+ttfM7vLC8lkgSjpR9lBRe8UpK0uU=;
        b=RHG7zdeg1EOb64mBIfegf6W2x5R6UvPoNxiw6JHjqLTzl38JwQ4c8QSJPHOz3Wp1Dh
         CAr4m/szADmnTdXPq55gGDnLrj5DznkLO8ijtyxRpoGBc1p/+qgicfn9uUYFFmxMvo/S
         pmt2EGok6J6acWpzgKmyg6Lxvk+K/eyWY6OWHCMtVblvzUxf0tY2NjP0BmaFGryZr/Jg
         eXWRMZmkfeKwFGxSpo8JIEfxM61qftRY5xRpqUnyYiOe918bRnabVOagSJ0BGEHhCIY6
         JIn8NnYQ74UnVmn8yJpyhkxwpaxQPuptLFZSwqiHnIJKH7OppQlUTOcr5RN3qDVhS5bZ
         F7fA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778017567; x=1778622367;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=B7JxHCZxuN/7G1+ttfM7vLC8lkgSjpR9lBRe8UpK0uU=;
        b=NRnSRdhvbECzaV+Dcoe2llM+Ue+jSqLaf8Q65YPTlAKMcEH+pBjEUFCsRJM0hxYR8+
         BT6UrEyS/fT3sADv+l91au6qwJXQef02m3bjNL/n2NTxVibyD9JWr+lXZGSqlF9c5xMN
         zdOwgWGN45ibAkXyxQv4lyfNENhLND7/CHLBDIOzJ+286nSIy0ACtL4O7AJHhxcpvfBp
         G2AHFx8jXgeWtlnFI6TczMgj3XD5CgDyDUA26UOWp9DH36tnHPFM9sFo91VIyNmOhReM
         ZtmtgjgahkpvIA8wL8d5JT9BaoDxNTSoJYetrskGf0JKDrOthl/dOv/g4wSZCRd2Egrh
         zSHw==
X-Gm-Message-State: AOJu0YwbcO21RpdIVb/4DBrZT1grbNIcfPCifD7UJ7aEv54YRv9p3COq
	7KYk3F2Qgbbg6fuWzh9fPJObInoRlxQmeOkkTJP7OPGS+FubZcQnfEg1
X-Gm-Gg: AeBDieutnNPzbydsqpNUKMOAoEl2Xu3LJjxe0Bu0ncTlu0iUtH/5AV+eQMWVTKWayNP
	ColhK0cBkEhhVPgFCWBcvMPypQ9/DXM2jBY5JfQXeoOUSHaRrCAkhARfeiQFB+PnVBhC1l3nXLk
	7UT+wDgoWHEP5hWawQ5tiKg7gUOOPY9aZLXOlOJwU+cKtRGRlFrLZc2UXDII1HccKRnKEfP91jG
	mihKoJrrak7D9I0Fg6TJ0P9XE+nDelLEwsjUvkYz+JV95gxB7D8ayk6YSS+NAnFb++dwavNXtMO
	5SlO5Mlj4SHB3pn8cJs/JJ24UkzriUz1PwhJZEvcyP9FPwEInLj25bVrJvQNo9V4FBw41kFxm56
	Ees+UTUm2Pv0Yr7NcmekaLWpUyU61Gloo4rPcoMYzZlPOy+1ao0iNsKg2LR5kbM04nToZYfBakU
	0YocLsBrB1DOcLoA+mtu/miEgSpCRkNMdeOg14
X-Received: by 2002:a05:690c:397:b0:7bd:a50c:4554 with SMTP id 00721157ae682-7bdf5de7a8emr12316187b3.17.1778017566991;
        Tue, 05 May 2026 14:46:06 -0700 (PDT)
Received: from [192.168.0.39] ([79.133.247.80])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-7bd6656542bsm70158767b3.20.2026.05.05.14.46.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 May 2026 14:46:06 -0700 (PDT)
From: Erikas Bitovtas <xerikasxx@gmail.com>
Date: Wed, 06 May 2026 00:44:41 +0300
Subject: [PATCH v4 4/9] arm64: dts: qcom: msm8939: Add venus node
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260506-msm8939-venus-rfc-v4-4-994f5eb22acb@gmail.com>
References: <20260506-msm8939-venus-rfc-v4-0-994f5eb22acb@gmail.com>
In-Reply-To: <20260506-msm8939-venus-rfc-v4-0-994f5eb22acb@gmail.com>
To: Bryan O'Donoghue <bod@kernel.org>, 
 Vikash Garodia <vikash.garodia@oss.qualcomm.com>, 
 Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 =?utf-8?q?Andr=C3=A9_Apitzsch?= <git@apitzsch.eu>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-clk@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht, 
 phone-devel@vger.kernel.org, Erikas Bitovtas <xerikasxx@gmail.com>
X-Mailer: b4 0.15.2
X-Rspamd-Queue-Id: B75754D3FDF
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-60486-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.sr.ht,gmail.com];
	RCPT_COUNT_TWELVE(0.00)[21];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[xerikasxx@gmail.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-media,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,apitzsch.eu:email,1ef0000:email]

From: André Apitzsch <git@apitzsch.eu>

Add DT entries for the msm8939 venus encoder/decoder.

Signed-off-by: André Apitzsch <git@apitzsch.eu>
Signed-off-by: Erikas Bitovtas <xerikasxx@gmail.com>
---
 arch/arm64/boot/dts/qcom/msm8939.dtsi | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/msm8939.dtsi b/arch/arm64/boot/dts/qcom/msm8939.dtsi
index d4d7b0c9206c..cc6c4353497e 100644
--- a/arch/arm64/boot/dts/qcom/msm8939.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8939.dtsi
@@ -1627,6 +1627,25 @@ opp-19200000 {
 			};
 		};
 
+		venus: video-codec@1d00000 {
+			compatible = "qcom,msm8939-venus";
+			reg = <0x01d00000 0xff000>;
+			interrupts = <GIC_SPI 44 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&gcc GCC_VENUS0_VCODEC0_CLK>,
+				 <&gcc GCC_VENUS0_AHB_CLK>,
+				 <&gcc GCC_VENUS0_AXI_CLK>,
+				 <&gcc GCC_VENUS0_CORE0_VCODEC0_CLK>,
+				 <&gcc GCC_VENUS0_CORE1_VCODEC0_CLK>;
+			clock-names = "core", "iface", "bus", "core0", "core1";
+			power-domains = <&gcc VENUS_GDSC>,
+					<&gcc VENUS_CORE0_GDSC>,
+					<&gcc VENUS_CORE1_GDSC>;
+			power-domain-names = "venus", "core0", "core1";
+			iommus = <&apps_iommu 5>;
+			memory-region = <&venus_mem>;
+			status = "disabled";
+		};
+
 		apps_iommu: iommu@1ef0000 {
 			compatible = "qcom,msm8916-iommu", "qcom,msm-iommu-v1";
 			reg = <0x01ef0000 0x3000>;

-- 
2.54.0


