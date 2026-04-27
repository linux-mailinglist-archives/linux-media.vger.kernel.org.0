Return-Path: <linux-media+bounces-59708-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SNdTGVel72mpDgEAu9opvQ
	(envelope-from <linux-media+bounces-59708-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 27 Apr 2026 20:05:11 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C7336478209
	for <lists+linux-media@lfdr.de>; Mon, 27 Apr 2026 20:05:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8C22A309D42C
	for <lists+linux-media@lfdr.de>; Mon, 27 Apr 2026 17:59:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 80BE73EBF39;
	Mon, 27 Apr 2026 17:59:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CFVDmrB+"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com [209.85.128.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92B763E929E
	for <linux-media@vger.kernel.org>; Mon, 27 Apr 2026 17:58:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777312741; cv=none; b=SJM2nIiDYTOE4vfNpqzmAjQWEIzXukuVSAKBk9hgB+Z96HYbVvy5Z+bkMC4UY3W2g64JhFhquxptUUXXkhWIAs2CYCQX7FzP0TUukUuMqnCbYCigfYaTP368XzG9V6du9WXl9gAPGJJyXMrXpiW5H00B5aD5UTu/omW/elPSQ68=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777312741; c=relaxed/simple;
	bh=ZEu2LQcuP/U1oFZihO1ZCMi51Bv/ruis1G1kHDtRAtk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=L2y724XtBybT77zYuuSSisd7uJhvYb7VzzX0UJmsl2Kq17qJJgmsz5RwAIrwvoQrh86ev2t+6M3GMvPicaJLNT3NDTZB73e1NoJve6cLd/T9CQbOMf/G8WIJij5zREKP8DTDXiLCSP+9KBqqOutTXDhU8sgusgdK4ZodcLk73c4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CFVDmrB+; arc=none smtp.client-ip=209.85.128.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-7982c3b7da9so99748437b3.1
        for <linux-media@vger.kernel.org>; Mon, 27 Apr 2026 10:58:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777312739; x=1777917539; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PbpuikSocIfY8I9ag+pa38zqNQnau5eLp1wx9M3PRIU=;
        b=CFVDmrB+L3PbQB1GOEx1wXL98J+2Pn7fvW6r88+13oVUncAg7LzK4CWDl547PBCGeH
         c+Q2Cs1cle3DIvJ85C1psCmW02xW+9b/cfRvk+saZj3xYBSgjSju4JaTJZ65Dwi+DheJ
         058tf3tF7Phm0ayQhDyixCGJ/e8soVsO1KSTc/KZ5+zEz6X0f18QRlNH9FKTLMwCwXR7
         oPz7yg+g0TlhqDFv97xX0eZBU1w5HRoc8U2R7bAq4TWuihHmtAYZgKZjMGP5T+EcqKRF
         01U+Qd/UcA68oTSaLZjp92nfG1QnJ/Vbcl5esosXm/r9pvHIc512Cvm80rJU9pVjivKo
         Oaxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777312739; x=1777917539;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=PbpuikSocIfY8I9ag+pa38zqNQnau5eLp1wx9M3PRIU=;
        b=YtTk/8ZbSeTFufhdSCZ/yUnikGGoLvuLRWPLDk0zodGIx9Q1/3ncbn7SdMoapI+dLP
         Uo+TGJByvqFCi2IoQJhC7U2JH3rHM9iQZW1sm0SFTEWe/5D6bvr8mZO+UWgmStgbV5Dh
         yJWLjSFzeJZoGuOfdT3pC6ZZPnX748v+bXbhhEhzKUKOXFC4fyNAJv/viJFzHUcIvcnN
         DqqXMs5KdhygR0sd/6YuOZSdazVOLRX0OTgUuybqZEYV2W7tb08DaSTiRHnTCU+Ib8v8
         r9s0NXIJ5D8QvKLqBMCR+SGwdcVXaFPkz05gULx53oqNw6bpu1NO/ePFxmCeBgygJCGQ
         TtXw==
X-Gm-Message-State: AOJu0YzEKD1lh/f9CcQBSD8Z6TUh6PlzfmuspHqLUyChJcmoCianWJAP
	j2boITQK3sGvQ9c2eaR3gOPVVpGr+ll7/FlQM2s9VAXYn/TQp6k7dP4A
X-Gm-Gg: AeBDiesX6mnSWcnDtKYZFob7Hmy2u6Ovuj2SOseL6gRHFRpkGoBKZ2zHvkgM7nBhIe+
	k6aVWiFYDpe30ycKQ8ryuY8ubfV4V5gQXqwI88jxH+0rlmCogWzssUFjl6Jc/sGX+N9MDp9by9M
	y3P9MHHGWSsZJWYnkW+zVDW0Jte9Yz84xEZRJZ+fau3/vMx6pfCOQs8GFrzI002FUtmigG60C66
	90nJDzr1zOE8c4mkRAnx/Jwc9Ua7gsrQM+vn6jQy/Y78TVm9HsjMF9rQgYgNuF5xk69TADhiLfI
	MdpF9a9YrIYf9rjwnUcuFzqbSr+U1NP0VTr3TdMYUK/5Br1hM2Kp+3kxtfjPqEWrviCnc5eok0d
	knnDl7fFyJfMqSDBGFXeKSDcH/8d9d+TVsvtMdTTl98ZJa68rACK0KfRxg2j2AqO7WkgJjwAWNA
	+aoGLbSOUzb68xL1WzgwaypzGH36cexKzkyGxZ
X-Received: by 2002:a05:690c:10d:b0:79f:d961:47bf with SMTP id 00721157ae682-7bced8dc2a2mr3592067b3.8.1777312738423;
        Mon, 27 Apr 2026 10:58:58 -0700 (PDT)
Received: from [192.168.0.39] ([79.133.247.80])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-7bcf05e9cf8sm198467b3.18.2026.04.27.10.58.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Apr 2026 10:58:57 -0700 (PDT)
From: Erikas Bitovtas <xerikasxx@gmail.com>
Date: Mon, 27 Apr 2026 20:58:26 +0300
Subject: [PATCH RFC v3 04/11] arm64: dts: qcom: msm8939: Add venus node
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260427-msm8939-venus-rfc-v3-4-288195bb7917@gmail.com>
References: <20260427-msm8939-venus-rfc-v3-0-288195bb7917@gmail.com>
In-Reply-To: <20260427-msm8939-venus-rfc-v3-0-288195bb7917@gmail.com>
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
 Stephen Boyd <sboyd@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-clk@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht, 
 phone-devel@vger.kernel.org, Erikas Bitovtas <xerikasxx@gmail.com>
X-Mailer: b4 0.15.2
X-Rspamd-Queue-Id: C7336478209
X-Rspamd-Action: no action
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
	TAGGED_FROM(0.00)[bounces-59708-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.sr.ht,gmail.com];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[20];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[apitzsch.eu:email,1d00000:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]

From: André Apitzsch <git@apitzsch.eu>

Add DT entries for the msm8939 venus encoder/decoder.

Signed-off-by: André Apitzsch <git@apitzsch.eu>
Signed-off-by: Erikas Bitovtas <xerikasxx@gmail.com>
---
 arch/arm64/boot/dts/qcom/msm8939.dtsi | 34 ++++++++++++++++++++++++++++++++++
 1 file changed, 34 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/msm8939.dtsi b/arch/arm64/boot/dts/qcom/msm8939.dtsi
index d4d7b0c9206c..6b295d3f8256 100644
--- a/arch/arm64/boot/dts/qcom/msm8939.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8939.dtsi
@@ -1627,6 +1627,40 @@ opp-19200000 {
 			};
 		};
 
+		venus: video-codec@1d00000 {
+			compatible = "qcom,msm8939-venus";
+			reg = <0x01d00000 0xff000>;
+			interrupts = <GIC_SPI 44 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&gcc GCC_VENUS0_VCODEC0_CLK>,
+				 <&gcc GCC_VENUS0_AHB_CLK>,
+				 <&gcc GCC_VENUS0_AXI_CLK>;
+			clock-names = "core", "iface", "bus";
+			power-domains = <&gcc VENUS_GDSC>;
+			iommus = <&apps_iommu 5>;
+			memory-region = <&venus_mem>;
+			status = "disabled";
+
+			video-decoder {
+				compatible = "venus-decoder";
+				clocks = <&gcc GCC_VENUS0_CORE0_VCODEC0_CLK>,
+					 <&gcc GCC_VENUS0_CORE1_VCODEC0_CLK>;
+				clock-names = "core0", "core1";
+				power-domains = <&gcc VENUS_CORE0_GDSC>,
+						<&gcc VENUS_CORE1_GDSC>;
+				power-domain-names = "core0", "core1";
+			};
+
+			video-encoder {
+				compatible = "venus-encoder";
+				clocks = <&gcc GCC_VENUS0_CORE0_VCODEC0_CLK>,
+					 <&gcc GCC_VENUS0_CORE1_VCODEC0_CLK>;
+				clock-names = "core0", "core1";
+				power-domains = <&gcc VENUS_CORE0_GDSC>,
+						<&gcc VENUS_CORE1_GDSC>;
+				power-domain-names = "core0", "core1";
+			};
+		};
+
 		apps_iommu: iommu@1ef0000 {
 			compatible = "qcom,msm8916-iommu", "qcom,msm-iommu-v1";
 			reg = <0x01ef0000 0x3000>;

-- 
2.54.0


