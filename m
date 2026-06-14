Return-Path: <linux-media+bounces-64797-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id J1kQJCvALmqy2QQAu9opvQ
	(envelope-from <linux-media+bounces-64797-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sun, 14 Jun 2026 16:52:27 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E2A95681530
	for <lists+linux-media@lfdr.de>; Sun, 14 Jun 2026 16:52:26 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=quora.org header.s=google header.b=eXojB0Yp;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-64797-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-64797-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=none;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id EEC0C3015E0F
	for <lists+linux-media@lfdr.de>; Sun, 14 Jun 2026 14:51:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 66E333C8738;
	Sun, 14 Jun 2026 14:51:46 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9778B3C769F
	for <linux-media@vger.kernel.org>; Sun, 14 Jun 2026 14:51:41 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781448705; cv=none; b=BCZTgw8ihjOY4Z9jpJTtmbs5nZhvzwKLynf8bBwQt3uOAwNpP1VgR3w6p/bdmgjPO4Em6W5n79W9JuXprMrpyOZVTZvFgPLtIeE8y8wB9CX5hM+Lt308wLIng0LnhQ6hZujZsKVPOxu1F+PvryUflAMedRcQeOmoloGTg7slg8Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781448705; c=relaxed/simple;
	bh=ogMc+SzI7BygL/QiVUbBYX/vH1UfhMtj0GEZ+Aa4xVg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ScA9hDS2fA3SoUfUVJriOks8BCUFU7m/0i/nELBDS5Cqt2dnTfuJ65E06y5B5PBF58MnMHUY8CZMOQMcvjWDhHNpzMjoPVpPrfc7MrUgCKKjCPwFxzNPGjCy96e57l/rDoUeXrDXJrRoyRRLLc08COLZmOoMl/SBX9GBbBEvqQM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=quora.org; spf=pass smtp.mailfrom=quora.org; dkim=pass (1024-bit key) header.d=quora.org header.i=@quora.org header.b=eXojB0Yp; arc=none smtp.client-ip=209.85.214.180
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2c0b9328c4aso18409145ad.0
        for <linux-media@vger.kernel.org>; Sun, 14 Jun 2026 07:51:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=quora.org; s=google; t=1781448701; x=1782053501; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=c+DoEJx5niGEYDDqKxpP9EhcqDdLdwV3n1HbmZ+qqPE=;
        b=eXojB0YpAazp8Lr3X2NiQWsAHKauMpzM70r8rE9Ltex7+1z7iwd9l1G3oFztfndHno
         pdwLw3j3Thtewk7viM+wtCHSPljLdYsP5q51NoKWileNEn94pX57kezeaAFhC3a5tIvM
         ZFz4u9bdg14UZjpjgdys0gjZnJf3h1pswY/6Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781448701; x=1782053501;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=c+DoEJx5niGEYDDqKxpP9EhcqDdLdwV3n1HbmZ+qqPE=;
        b=qUMjjYgjgXlZqscLHDy6fuVj9yc66kyDIzN3UrqxBMXr1vHe4S54qWs2NskX7/t/gD
         mP3E8lAtaj9nweMpWBccIAxISqETfuBsZnnd7n+lo0y644KyFT0JmENFattXFXevpRyc
         BnGRVPtcwDOvv2NV6en2CC6xZl+2axZlkudCbKHZ7hIN91RFesPega7wj8d45rYre/o4
         GeBDTlL0oI14iUq6qaH2Zclz3YsPX5Tqml2KagDqobAViFpvVTOiPIaAWjF3Ancb0CkL
         vviqQxgA0C+BOkJKUWe+ySI41Nd30ZnAkLXvCMk9HAtoxJkYEIQva957FvTf17Lmw1Fc
         tACw==
X-Forwarded-Encrypted: i=1; AFNElJ+csR+erjtxlpx1sJ6xG8ULcbf1FibzL9TD9MtAcjwy96VW7kLlihmm4Gzzj0aYsUMkTFUrBxuV19fn8g==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzujo+ORnU3lHQcYDaayavU7dsJliixHqOlXGirdFf6HeEMWKbT
	fREjuB//qVoVlcFm9ie+6aj7RkfvbEC0l9BuwOk5LD96x7Yfm9JwtjXbQLz2cdehqWI=
X-Gm-Gg: Acq92OGB4Sy5jveUo45vxkucD4ADR5opSUZ49KqIMwnow5H/ZEkMuhAHzrqEsdSON/+
	b80EqQqmYj8sGyNKR1WM09gE2eo3L4uIHiXuaoAq+zYLKCn1Ll3E+FDjme5YlmVSrAb0x/NkwrQ
	sPrX/KQvh1tFAmQrP/vUzeCVJPn6kGUXpoIEElgoBWqfFzFj7Kc9pB/8S/oyjtCUxaxXx4mOteY
	n7BYd+iCu13hTwlyA40BJlOw6jkqO53QtaQewQGmr0QfSMLwouebmj9mtDIeai1G1xxvostk2GB
	F31lXMINb0WcX+BXXDDsFPtOcR+MBzI1v1GZzfRaussLqIXsZPntKqekWLn9r6RwPKWZdcG5RHs
	YaBp1079PfqQ5MBCdpgdWpoWC66U/qQS+LsUx4m2t9dnHdewaypJ/XgcQv9XMM628KlMU4aMfA0
	MtxYF5DgKz98ozDmlWft94TTCSjijIe1YyLWUAUEKD+KFaF18vRps00hkooFR9Cl0R2vjrAp6On
	x+dh+xDqPpBKe3osHv87uqp5XKH3zLqUTOMbtS0HLFSqMclwjiz94KtCtuhcBUTa4UjjGQmzvXa
	69vm8ss/zdECPXDu0PcL4ar68Hu7vvvQ3sE2EiecCfdpDK+a05T+yYNejfYDgw==
X-Received: by 2002:a17:903:37c7:b0:2c0:f807:9bf3 with SMTP id d9443c01a7336-2c4108f197dmr120914925ad.10.1781448700638;
        Sun, 14 Jun 2026 07:51:40 -0700 (PDT)
Received: from aegis ([2001:fd8:4d03:c800:f499:6f6c:fbd4:8f])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c4327acca5sm66746385ad.51.2026.06.14.07.51.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Jun 2026 07:51:40 -0700 (PDT)
From: Daniel J Blueman <daniel@quora.org>
To: "Bryan O'Donoghue" <bod@kernel.org>,
	Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
	Abhinav Kumar <abhinav.kumar@linux.dev>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>
Cc: Daniel J Blueman <daniel@quora.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Stephan Gerhold <stephan.gerhold@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH v2 2/2] arm64: dts: qcom: hamoa: Reserve low IOVA range for Iris
Date: Sun, 14 Jun 2026 22:51:12 +0800
Message-ID: <20260614145113.84243-2-daniel@quora.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260614145113.84243-1-daniel@quora.org>
References: <20260614145113.84243-1-daniel@quora.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[quora.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	TAGGED_FROM(0.00)[bounces-64797-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:bod@kernel.org,m:vikash.garodia@oss.qualcomm.com,m:abhinav.kumar@linux.dev,m:andersson@kernel.org,m:konradybcio@kernel.org,m:daniel@quora.org,m:mchehab@kernel.org,m:stephan.gerhold@linaro.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-media@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:stable@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[daniel@quora.org,linux-media@vger.kernel.org];
	DMARC_NA(0.00)[quora.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[daniel@quora.org,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[quora.org:+];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp,quora.org:dkim,quora.org:email,quora.org:mid,quora.org:from_mime]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: E2A95681530

On X1-family hamoa platforms, the Iris VPU reserves IOVA addresses
below 0x25800000 (600MB), primarily for non-pixel buffers accessed
via different Stream IDs. DMA into that range triggers unhandled SMMU
page faults that cause spontaneous device reboots. This is readily
reproduced with one or more browser tabs driving multiple concurrent
video decode streams.

Add a reserved-memory IOVA reservation node covering [0, 0x25800000)
and reference it from the Iris node so the IOMMU layer keeps DMA
allocations above that boundary.

This applies to all current hamoa.dtsi consumers (X1E80100/X1P42100/
X1P64100 boards); other Iris-bearing SoCs (sm8550/sm8650/sa8775p/
qcs8300) do not include hamoa.dtsi thus not affected.

Backports also require the preceding binding patch ("dt-bindings:
media: qcom,sm8550-iris: Allow IOVA reservation memory-region");
without it, dtbs_check rejects the second memory-region entry.

Link: https://github.com/qualcomm-linux/kernel-topics/issues/1157#issuecomment-4458933574
Fixes: 9065340ac04d ("arm64: dts: qcom: x1e80100: Add IRIS video codec")
Cc: stable@vger.kernel.org
Signed-off-by: Daniel J Blueman <daniel@quora.org>
---
v2:
- add Fixes tag
- clarify the reservation rationale
v1: https://lore.kernel.org/lkml/20260601041336.9497-2-daniel@quora.org/

 arch/arm64/boot/dts/qcom/hamoa.dtsi | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/hamoa.dtsi b/arch/arm64/boot/dts/qcom/hamoa.dtsi
index 051dee076416..ce96e7f8d8c1 100644
--- a/arch/arm64/boot/dts/qcom/hamoa.dtsi
+++ b/arch/arm64/boot/dts/qcom/hamoa.dtsi
@@ -716,6 +716,17 @@ smem_mem: smem@ffe00000 {
 			hwlocks = <&tcsr_mutex 3>;
 			no-map;
 		};
+
+		/*
+		 * The Iris VPU reserves IOVA below 0x25800000 (600MB),
+		 * primarily for non-pixel buffers using different Stream IDs.
+		 * DMA into that range triggers unhandled SMMU faults and
+		 * spontaneous reboots, so reserve it to keep IOMMU
+		 * allocations above this boundary.
+		 */
+		iris_iova: iris-iova {
+			iommu-addresses = <&iris 0x0 0x0 0x0 0x25800000>;
+		};
 	};
 
 	qup_opp_table_100mhz: opp-table-qup100mhz {
@@ -5479,7 +5490,7 @@ &config_noc SLAVE_VENUS_CFG QCOM_ICC_TAG_ACTIVE_ONLY>,
 			interconnect-names = "cpu-cfg",
 					     "video-mem";
 
-			memory-region = <&video_mem>;
+			memory-region = <&video_mem>, <&iris_iova>;
 
 			resets = <&gcc GCC_VIDEO_AXI0_CLK_ARES>;
 			reset-names = "bus";
-- 
2.53.0


