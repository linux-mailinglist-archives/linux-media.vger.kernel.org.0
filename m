Return-Path: <linux-media+bounces-61542-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4HToCM7sBGr7QQIAu9opvQ
	(envelope-from <linux-media+bounces-61542-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 13 May 2026 23:27:42 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 874C853B020
	for <lists+linux-media@lfdr.de>; Wed, 13 May 2026 23:27:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 837FC307DA1E
	for <lists+linux-media@lfdr.de>; Wed, 13 May 2026 21:25:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3F26F3B635B;
	Wed, 13 May 2026 21:25:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="N+ci/loL"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-yx1-f45.google.com (mail-yx1-f45.google.com [74.125.224.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D0FF3B637F
	for <linux-media@vger.kernel.org>; Wed, 13 May 2026 21:25:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778707557; cv=none; b=Sa4Mu14SAPtxMMJLl/B263C5r9p1f4lzYU20liCswDghYRFw9IG4ZKJTS7PSAcgh5QUNZnSpw5MYFXi/29DVxmi2vFHTc9EYaXfrEa+f70i8mkQFa2OnridYHkqcRsvjMdMTceeSVOvQIoRCBuny5JV09k6M+ujoMYzF+oyK2q8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778707557; c=relaxed/simple;
	bh=Wt9SYaYbBekuvxG0W9GzirhObD5B5YMMzByQDBZ74uU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=FFRVSmqbiwp1fxnH11lg2eVK465mRx+I4iAq55Xqqc1hxqakrj73YZmMbyA/Xd/e7FnJYOmSc9dpD7vSCdFoc9QgB773ek/aGpbnoKLLxD8DLdHIYNFZhvEoOb3HbRttSaIbv3fSRXDish0ggvpiJygujIGZjfIfirDjcaGD0jk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=N+ci/loL; arc=none smtp.client-ip=74.125.224.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yx1-f45.google.com with SMTP id 956f58d0204a3-65c5361142fso8358404d50.0
        for <linux-media@vger.kernel.org>; Wed, 13 May 2026 14:25:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778707555; x=1779312355; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=w02Fw3u4OZYjqyD8CNbogogC0D65Ho3wtBiCcEgc55Y=;
        b=N+ci/loLd6dNmYosBRse99wVjwpX5l5f8DBdbKdw4tz/AoB547AfAIFte2hd4enN0i
         8XjhNH7l80MwC9OM8KLhYhBnnjt5kbzE5kGmDoxonFnIDxbt5Xjd5WxkPTKEUkQ8QeYt
         9m7k77JKoqExdJXDBbaxBZDTsWj3/V9ATj6omJ/Uw8nOXcWfy4A+s4WTK9wlPS+xj7yY
         HyrC1Qu7aZLiK7nKIAKAXzrnAAz+7/ICTMNMCOZC0pr1L0/N31Nv4Y43/eHQBhKehyWZ
         JWDaNnszOq7s3m2bBSKwqUleYX3rmwlDLlZ8Vhjd5pU1RiYfc4Pr1pCxt2s6f4Yd7kov
         xUZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778707555; x=1779312355;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=w02Fw3u4OZYjqyD8CNbogogC0D65Ho3wtBiCcEgc55Y=;
        b=qlWM0wQB/2fwEluIZT37RJ7TYPiXmgPIbbyfs9OxnEBBQPFLKsHTAUBqeWNKz5HY/R
         BgCWCBJbUPNfvU/AJzjbhuHm/7+CmMkA5lxeBPzgMvb/wk5UfrLqV5w4or4BKna2zmSL
         VT1FKqrImVcD0iGIBMQmOtoHZfSv43X+0JOXN1CSvQC3juhvSTvraBp0N9cHabUHxYLY
         t3k2B7uzeBJBfT1TazQP3EHchkyU0+uMX+TobVVUdHWJHPJ5iQrJp3vVRrmJRf8xWnU3
         89Rp07VXjfv59JrMnupwMTAZBQUl/GqCt638qm/hK4ZKyuwR3iUjrJFnsGmPROggk5Lk
         qGMw==
X-Gm-Message-State: AOJu0YyjV8x/w8/UMTnG2nHL6emkoRyUrs4UTsvnm/iZQ83sRBDLpQOB
	fFVFImDZ7e5ZOimY/BKQ0nqSDPtBocQKKq3grQP9PPXFk6rkEg+9tNV8
X-Gm-Gg: Acq92OH5KjPzu0z4LRo1FYVuNRyPGAZzuCma2BffL+jnr6t8tMTA5qUrZw76S/vMlwj
	grf4Ic56GW/cy1RxnYHFJYFiiiodypF5Mic7zBhcoPYLchugEbSlA2RQVQ3MkYanA2pqjA5KR6J
	3uKmq9WrWTUmkNmNlSPQWaDFOHh9flxs2frz6TgkTw4HyZ4NWZTFI5uL3yJeXHzNv2pPf+mWjir
	seeDMcha9Us7U5Y1IAD+7qVhJdy5Pf8SiGj69t5nKvmpw3JSELDcP0crNrP9L6tyIHtnAjtCkcz
	KXFUH/+ODuAB6OKhnor0gYJhWKnuUbR8IsKFgUmpSxKaOTNAFXx9nhNGN2VUyqHafe3wBacRiZN
	cYgAcvXabYDg20D1ZFvBy2oojaXFbeTmFSkRYS5A+p4D31hWu5ldnLUIajjsu1D9bx9mP//RkcH
	698DL4Omd26w7KrHV8vYogIITq0w==
X-Received: by 2002:a05:690c:e295:20b0:7bd:5c7d:4b15 with SMTP id 00721157ae682-7c6ab5e9aefmr42888857b3.5.1778707555385;
        Wed, 13 May 2026 14:25:55 -0700 (PDT)
Received: from [192.168.0.39] ([79.133.247.80])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-7c7f28b810csm3715107b3.14.2026.05.13.14.25.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2026 14:25:53 -0700 (PDT)
From: Erikas Bitovtas <xerikasxx@gmail.com>
Date: Thu, 14 May 2026 00:24:31 +0300
Subject: [PATCH v7 2/8] arm64: dts: qcom: msm8939: Add venus node
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260514-msm8939-venus-rfc-v7-2-33c6c6fb9285@gmail.com>
References: <20260514-msm8939-venus-rfc-v7-0-33c6c6fb9285@gmail.com>
In-Reply-To: <20260514-msm8939-venus-rfc-v7-0-33c6c6fb9285@gmail.com>
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
X-Rspamd-Queue-Id: 874C853B020
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-61542-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.sr.ht,gmail.com];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[21];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[xerikasxx@gmail.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[1d00000:email,apitzsch.eu:email,1ef0000:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Action: no action

From: André Apitzsch <git@apitzsch.eu>

Add DT entries for the msm8939 venus encoder/decoder.

Signed-off-by: André Apitzsch <git@apitzsch.eu>
Reviewed-by: Bryan O'Donoghue <bod@kernel.org>
Signed-off-by: Erikas Bitovtas <xerikasxx@gmail.com>
---
 arch/arm64/boot/dts/qcom/msm8939.dtsi | 23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/msm8939.dtsi b/arch/arm64/boot/dts/qcom/msm8939.dtsi
index d4d7b0c9206c..71e22584a46b 100644
--- a/arch/arm64/boot/dts/qcom/msm8939.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8939.dtsi
@@ -1627,6 +1627,29 @@ opp-19200000 {
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
+			clock-names = "core",
+				      "iface",
+				      "bus",
+				      "vcodec0_core",
+				      "vcodec1_core";
+			power-domains = <&gcc VENUS_GDSC>,
+					<&gcc VENUS_CORE0_GDSC>,
+					<&gcc VENUS_CORE1_GDSC>;
+			power-domain-names = "venus", "vcodec0", "vcodec1";
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


