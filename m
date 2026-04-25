Return-Path: <linux-media+bounces-59604-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aB8yCkUJ7WkEegAAu9opvQ
	(envelope-from <linux-media+bounces-59604-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sat, 25 Apr 2026 20:34:45 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9262246759E
	for <lists+linux-media@lfdr.de>; Sat, 25 Apr 2026 20:34:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C2DC830469B8
	for <lists+linux-media@lfdr.de>; Sat, 25 Apr 2026 18:31:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 47E2837474F;
	Sat, 25 Apr 2026 18:31:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FzNRVxXB"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E52B8373C1E
	for <linux-media@vger.kernel.org>; Sat, 25 Apr 2026 18:31:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777141891; cv=none; b=mWfNtVhxnD0JNCJQvA0rN1FxOKILa9HHI1AwajftOfcKOImgCZisSQJm8TMz+QdDZvWMPcHiKJNflksP2YUuEcxDiRxbv8jdHJIJjB45rNollsDIorG4b+OO+XigVEIwtp8K0q1Pj7HI8nYLFEnkjMYvrR5GOtqF8WGbHoQX8zQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777141891; c=relaxed/simple;
	bh=ZEu2LQcuP/U1oFZihO1ZCMi51Bv/ruis1G1kHDtRAtk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=lkJwSe1hzjeQ2FJJZWa4dYPtPvwbO6Gl+oHnGChp3cJwVssdhS3Ikpp7RnWdOnI/+AmsePDIfr1y6fAxjVNeOu0wyeFa9mmi5HGhFKmMMa4gnXAsO0DHsyQ1vl0C/wjdLxd7j+2LMStsxAJIKqy9NtNawbTrs51V0k/vN7CPHxw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FzNRVxXB; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4896c22fcbaso60677545e9.0
        for <linux-media@vger.kernel.org>; Sat, 25 Apr 2026 11:31:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777141885; x=1777746685; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PbpuikSocIfY8I9ag+pa38zqNQnau5eLp1wx9M3PRIU=;
        b=FzNRVxXBcDibgsC4YyfmsD+ZpTMQdHhrr+NzaruHYspMk6BtYZzogqRL5cee1XwN5/
         6F0uzub7AVBVIaw/wVNDMXFT8HklQsKT0dfEHO8eO7L4sdpuytYhFUCYHmpT/9z1DadP
         IUck3s4WGXqQqaAd9q/AwSCFS79cl8Scmj86mF5GhZT8Dg7oq/8/lqUzEYWlGb/ulaoL
         rNFZwizEPaeFC/0T+Rys+ekJoZjJBP5+HbM4cwDqiKHK6J7d1yL39P+eLsCA1e2HG6T9
         tuPe3el2ISKiVl7OJuCa/lpYeNnVMczzJq3PwLqozaA3Fuy9kd1Vw69OO5XpUu5i/BSJ
         wnzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777141885; x=1777746685;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=PbpuikSocIfY8I9ag+pa38zqNQnau5eLp1wx9M3PRIU=;
        b=W1pdaUFStC1NbD8P0QFsW7O3GJSHi1O8Gpnrwd04pLYrr7M7fyBnLZDp9fVA/yOTjq
         GnZCy52YWOSDNRWwr9+BMgZ9BjJd/BQE7tMq7AbsfkrWxrHz+z3mX/FUqpr7gW4Z963B
         FMWRJp/QAh9o5KG0BZQLq3vvpppD/xu4EypE1O0tIQMY6KL/FcUXgo97aDL13AnrRUe1
         3OKvhVoSllygPKeWXWBOTtH01ytncZ6j2uR8onn1m6YBfnrhxuC9gbOG2/b5Aixuv4LI
         Ld5Qrx9tJgYz53BCGf0Sz+tO1E8M736EvFh0Gz4a2NsUjiYMscJ831LhvouG9voxuBj2
         DfjQ==
X-Gm-Message-State: AOJu0YxhEGnMTfGAJS+rKP827H7kF4H4CDV0+3oIQr5fAMztmhB5+HJP
	SHKxkMNdCExkHv7k6MxR0WT1oAPl2M8fGZauYT0Z1Su/I/ETLhahrr8U
X-Gm-Gg: AeBDiesOQnyIT+w+dgmoPK789TTq8T8XAQYPcXLu6KnTeFu/ErnnR7xHdzbTKh75saf
	lv3DqFy5plnNZ93NaLrJQubAnQf58LdbfDrBPFHwQVS52E4f6BAq4IH5zRJbYyg09D/ZrksWeZG
	0R0OMPqK6BHn66ZdHi2vCfDdNEIkhuWJVYAUoRjuohG7pizaZCJRH1995M8J4c0v1iMawc0nzBh
	6dpGwMHjO4j4tIVZ0aamaAVdk5B2txTMVg60ec1jdIMN/3W6cUQDUME3rEi0/fJUT4C8ghCb3XN
	MXU9LN4ZL35zEkxvSkmFtoQhgDDfaJp+3trt5Do12HpS7aVji2yfmRBvoda70t+9DGHI/8/GoAA
	aYzCCJFyL7+fIQ5572xU4HcrY8gm2qFjPGk831FnsxVNq1Aqy/iB37RfU0xgPan6T9uRjpnU6a8
	OPUJ8DVYqCet1QaanK22s5r7ximInKKp3SZWk=
X-Received: by 2002:a05:600c:1f94:b0:489:1c2d:211e with SMTP id 5b1f17b1804b1-4891c2d2213mr388573755e9.5.1777141885163;
        Sat, 25 Apr 2026 11:31:25 -0700 (PDT)
Received: from [192.168.8.79] ([2a00:f502:260:fa4:a26c:adcb:8da8:3])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4899dc95920sm133613675e9.6.2026.04.25.11.31.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Apr 2026 11:31:24 -0700 (PDT)
From: Erikas Bitovtas <xerikasxx@gmail.com>
Date: Sat, 25 Apr 2026 21:31:05 +0300
Subject: [PATCH RFC v2 04/11] arm64: dts: qcom: msm8939: Add venus node
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260425-msm8939-venus-rfc-v2-4-f69e52b36207@gmail.com>
References: <20260425-msm8939-venus-rfc-v2-0-f69e52b36207@gmail.com>
In-Reply-To: <20260425-msm8939-venus-rfc-v2-0-f69e52b36207@gmail.com>
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
X-Rspamd-Queue-Id: 9262246759E
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
	TAGGED_FROM(0.00)[bounces-59604-lists,linux-media=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[1d00000:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,apitzsch.eu:email,1ef0000:email]

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


