Return-Path: <linux-media+bounces-58900-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0OfMOeLo4GlInQAAu9opvQ
	(envelope-from <linux-media+bounces-58900-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 16 Apr 2026 15:49:22 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E3D140F291
	for <lists+linux-media@lfdr.de>; Thu, 16 Apr 2026 15:49:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id E7B073120811
	for <lists+linux-media@lfdr.de>; Thu, 16 Apr 2026 13:44:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 549393CF681;
	Thu, 16 Apr 2026 13:44:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GBLDYpXh"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com [209.85.128.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56E983CD8BB
	for <linux-media@vger.kernel.org>; Thu, 16 Apr 2026 13:44:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776347073; cv=none; b=c6Voc9dJ7HbzSzXUNlVXzrvPwPf0kvvVi4IPJmq8S+vnDNIxp+0GbbFCGgd5baWAH7cJ9bhWnVD+c1BApfg+r9iCAEVXoZQkQLN2Z1xuxguv5SAQnRscuESuaLmz+6CGJ0xFInqLKM6uXGz4j1BTb1gbJAH7GOW6wuH476J5hDM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776347073; c=relaxed/simple;
	bh=m0hAwjUa4hKV/coo6hpUGbx9jDVDQYsKSjHk22/b9Gw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Dk04Oka5qABj/TyF+7neFabH+i3qJKuWQbPomgcK6tHL2gAcLtM3DKzL46ds7AtRXvLxivA+tLnmKRyLvsaT940GWqzLoOWdhNmcc+QNFMK06xydoghUl2DaZ3oXCzOCS21z2vTs+efwpkLb8Ppx93RZpV+gLzkXkd7w5vgOFWU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GBLDYpXh; arc=none smtp.client-ip=209.85.128.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-7b4ee3a88e1so33626797b3.1
        for <linux-media@vger.kernel.org>; Thu, 16 Apr 2026 06:44:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776347064; x=1776951864; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2d2nbf2g+hlQZgCrTOLd5o3o7R6PUXkz/sJenAfYET8=;
        b=GBLDYpXhhJoiGJxK64/GVAB6bg2YQ5czccTCjtFQ+PqiAjsMOTNxfrrBf5vEUFwdqh
         oyk8IyexRFbC1L1wdn8rXdFrKGKGGADcNk4fWyTF8dr4KToC0r5ynQqUIERiRw1qNOxU
         F4DmoeJMAnCqR0xe6oCnNOBD5oIoTSTAtoSUh9yG4XwReuPpG50wD3pTtrdmn3dq5wMo
         jJ6l0fBlfcc+LPmjoW27GXnkMlFPsOAPinwdFgoXbbGvxYDJ2mOl2TsDkS/kA4BfD92C
         tCfJ6IrjB8hdAd74xXMNSxS7NVl5Rc94OQZM7lTazILZGcN67FWuUk4grDmMl3iftqr4
         OVtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776347064; x=1776951864;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=2d2nbf2g+hlQZgCrTOLd5o3o7R6PUXkz/sJenAfYET8=;
        b=cKRPtsVzInLwSE6wzMURWKu4j5/Oo00b8j70WCwGdjX9/oO9u7CR13qMUu2A1A5Y/u
         zLyfDhk68gi0qq3q2eCuuY8K5r4RNUOF8Utlu/UxWfvA/rqgqxVyCBkFczw0WppAGI+t
         mZBgt/UQsQzknVFApZIKwhAZ0OpSJVdYf7E+pQHsDpLxOYW80021RkdNfmKcbl9p2gnO
         Y/3atL+mFsoroYgAuX4cD2lWQaeqbP1K8f4/iOnwxSvRs4wkaCOzOs0MLVRZFm61xesa
         cOsJHe5qu7wWRNPiAzQlu4GsVTyjqIkBefX3hFCOTVD/62IiaVnmF8yje50JMCbhiZjW
         NLrg==
X-Gm-Message-State: AOJu0YyoxvEmzi8AC7i0c7nWcoQg8rV95CR0msz+nf9YAZ3RK0CtjBZn
	W2ahYURghtPXcKxygkthzfecWA3a90jVUlNb1+FltesmF29cNpLUF9IQ
X-Gm-Gg: AeBDieuHDhy7myQf5Ro5gTZ+KwZTJ2PUVrMdS2pb/huYIDGwxg8TdkfmeBj6rPP4etP
	0Bm5ck3dfeW8VXJVAuwnHSiwgVxjSu2928cPTcBIZ3rIaTcBq+6XeytoWhVlcJjf4hdz29kiF8B
	04Kyg5tqwwntnP6xc3B9z/hJZWw7PsETOUF+vQVjzxpzMQ189kpzfvgMK7Y+UapIyshvRz/Lams
	Yi30rTQeqxgwXfqKGfVJQtjy1TuamhGqZ5rC1IBvN8f9n0qcU7agIqhJfSTMGGz/Yi/xzav7j2u
	BkR/RjTXmId6xHsQfd4tak0fydENXlqwahDIvjOOSFLTdtOkhdAfCigDAShNuDgPnUnZnXnTQyj
	1LIIHFnhjatAMuKlAkA+4Zz+Jnk5T2xNYwSTZ0WBXb57AR22fSHX22UIfpfWzvcenqDIoeadJXx
	OuYd2t/oPsggg4EOjArrtk5onLkg==
X-Received: by 2002:a05:690c:10d:b0:7b5:b474:e988 with SMTP id 00721157ae682-7b5b475118dmr110507387b3.50.1776347064060;
        Thu, 16 Apr 2026 06:44:24 -0700 (PDT)
Received: from [192.168.0.39] ([79.133.247.80])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-7b76931854esm23363737b3.37.2026.04.16.06.44.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Apr 2026 06:44:23 -0700 (PDT)
From: Erikas Bitovtas <xerikasxx@gmail.com>
Date: Thu, 16 Apr 2026 16:43:51 +0300
Subject: [PATCH RFC 04/10] arm64: dts: qcom: msm8939: Add venus node
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260416-msm8939-venus-rfc-v1-4-a09fcf2c23df@gmail.com>
References: <20260416-msm8939-venus-rfc-v1-0-a09fcf2c23df@gmail.com>
In-Reply-To: <20260416-msm8939-venus-rfc-v1-0-a09fcf2c23df@gmail.com>
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
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-58900-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.sr.ht,gmail.com];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[20];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[xerikasxx@gmail.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-media,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[apitzsch.eu:email,1ef0000:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,1d00000:email]
X-Rspamd-Queue-Id: 3E3D140F291
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: André Apitzsch <git@apitzsch.eu>

Add DT entries for the msm8939 venus encoder/decoder.

Signed-off-by: André Apitzsch <git@apitzsch.eu>
Signed-off-by: Erikas Bitovtas <xerikasxx@gmail.com>
---
 arch/arm64/boot/dts/qcom/msm8939.dtsi | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/msm8939.dtsi b/arch/arm64/boot/dts/qcom/msm8939.dtsi
index d4d7b0c9206c..b7cfd289d31c 100644
--- a/arch/arm64/boot/dts/qcom/msm8939.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8939.dtsi
@@ -1627,6 +1627,30 @@ opp-19200000 {
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
+		};
+
 		apps_iommu: iommu@1ef0000 {
 			compatible = "qcom,msm8916-iommu", "qcom,msm-iommu-v1";
 			reg = <0x01ef0000 0x3000>;

-- 
2.53.0


