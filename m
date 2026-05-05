Return-Path: <linux-media+bounces-60483-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gEgnFUNl+mmnOgMAu9opvQ
	(envelope-from <linux-media+bounces-60483-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 05 May 2026 23:46:43 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id A8E874D4011
	for <lists+linux-media@lfdr.de>; Tue, 05 May 2026 23:46:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 20E66308AA86
	for <lists+linux-media@lfdr.de>; Tue,  5 May 2026 21:45:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AE5CD344DA0;
	Tue,  5 May 2026 21:45:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DVtcG9KA"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com [209.85.128.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF1002066DE
	for <linux-media@vger.kernel.org>; Tue,  5 May 2026 21:45:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778017553; cv=none; b=GbbDtpQy9SfoF+DGYobU4J/557GVJTPBAxEtGCjzCVdJqndccc8JDm/Rs6ZwlLpr8pzqXvjRkX0iAvME4Ml0jpu7fmzUN/D3fxsW097MzwAQC5bIah7CJbX/7NPGvWYQbugjFhdCc0bshoM8dTfcvcxkrOf+Eo/JUjbp+m3ECb8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778017553; c=relaxed/simple;
	bh=mQCFWruCA9liz8Y7GOoawRK/Gn5yRlh1Erqdlb2XZyc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=I5RdX6Wwh+I9TuUV7bBFb35S8v+5DnhRCRc3iULbr3joc5aPRJEYoZ6RAZGS9dxAlXbjbyNZmdJs+kuQLqa3c7GjJ7oJWCtmwNz6lsR/Jk5HdJeCxtEteNuCxgZ9Ajpe2eHs4SMI2kTl3P9Vh/q+1mR9/oBhR55XMsSrOYpmDNQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DVtcG9KA; arc=none smtp.client-ip=209.85.128.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-7b4ee3a88e1so84619767b3.1
        for <linux-media@vger.kernel.org>; Tue, 05 May 2026 14:45:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778017551; x=1778622351; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gbs3u+DXgi4DxtN9oIYsEpuaN0QPP3RX4y66RdmEGMA=;
        b=DVtcG9KAW5kh3X+Fnxpv6eB7vQviNp+fwCrMZceiKFDG8bbgeMX2Iqo/Y6DQjEzfre
         h7lvAY1D3jDVYPJVh+y4t2EO6DJRai0TbE+1c86IaYfY8sVwGQvzZ+TWpcTHlZi4cc5Y
         e3Jk7XFIXBPLStfMgVH2KbKPv8qqlkCC+Y+BMTDXCkKNSi033zabDS0+MvrRx9DAxTDn
         V59AkQovB4dtoHwRJPusqFV+kpdUYur+0ZRJ1BVSkyDT2q4LgyYcYo6UyjOpExA3oKXb
         zv7fmSOhlTayzi5S6PKmrASlCm+q9bTGVaaGGxfUCi1KPybvoJJ6KlvCnqL560RWgd3T
         ZLNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778017551; x=1778622351;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=gbs3u+DXgi4DxtN9oIYsEpuaN0QPP3RX4y66RdmEGMA=;
        b=StwOzGtcp+ykjuPHLbYfeBvTm/4guPYRnSeGTKHVlgUDUC8ErzewxhoCTYn4axmACf
         0skFjbEDx10EDLvrp341+bI4sGxri/KjmaVE/9e26Pj03dW2zH3wKI7+Or2+O9V/JB60
         p3PxwE4RAWjsS670EzrGcFGmQElR9svJyLEYbK3ulUB8SoSAja/iYBDj0QBKuxPyy/At
         f4IAK5PS8EjNbQnnX+xAGxLl8Mz+56jUIIAAxULHX51XfPtoTgnZzYIt69Dj9FHPfPHS
         VlWAVJXqyWlNi7QhBoD/kosenT7BmquOCc6LXriI0O5WJrByAwoiGC7jQue5q1jU1/tk
         NQyg==
X-Gm-Message-State: AOJu0Yyh478IR6ZkHOazadJc5edLnqyhOp6Fqqfv3zDQ0XQdQ3zZBoft
	5O0zSzbRloHfNisMw2Zu40OQiek0MWbp/MK+fsC5T4zsq5bmCGsePEUf
X-Gm-Gg: AeBDiesNp+IeFD7FABiNcynayZCrIaSWOAKPmx7KB5Gq9KpII9ZY3LOMAMsT4LF+Q3z
	J//JwYr6zYdhijwE8d35QxMvIKDgRWS4wJKdKTN3SGZkYTizhFrXMEtRzk4ejf3EpOzrS3Z3ekY
	nbxy9Ni9yaWRF4CNna9YHjuDqsKSVGRqSJYCGJCuZafU68KSPDytoMkiBNPgyeZz+pBZ9IDmasa
	IVf4xbiTjRISSUSY/ihf1V13U1myJfPF1NYLA4SnxmiY+yg4ThZgNelsV9ZhPZavKIYqCbg1zjf
	QNBC7IH4SOCNwYG9/7QG2Lyd9QI/zY1q0uEsou7YB/os0oP6SlPA6jpMra0EODkZ3Eveh3CT4+C
	jly02LoC3S7VI59jrW53aP6hLZooVlobX+0rmx7c/XxA0nhp/txjU7HC15iCnTWFpJ293ieb77h
	NFBP+vAWXVbMGfpbunMb6wKxCiKQvfknGvA/VJwyNDaLiwDD0=
X-Received: by 2002:a05:690c:690a:b0:7ba:ef98:9719 with SMTP id 00721157ae682-7bdf5db9ad1mr12857667b3.10.1778017550719;
        Tue, 05 May 2026 14:45:50 -0700 (PDT)
Received: from [192.168.0.39] ([79.133.247.80])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-7bd6656542bsm70158767b3.20.2026.05.05.14.45.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 May 2026 14:45:50 -0700 (PDT)
From: Erikas Bitovtas <xerikasxx@gmail.com>
Date: Wed, 06 May 2026 00:44:38 +0300
Subject: [PATCH v4 1/9] media: dt-bindings: venus: Add qcom,msm8939 schema
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260506-msm8939-venus-rfc-v4-1-994f5eb22acb@gmail.com>
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
X-Rspamd-Queue-Id: A8E874D4011
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-60483-lists,linux-media=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,devicetree.org:url,apitzsch.eu:email,1d00000:email]

From: André Apitzsch <git@apitzsch.eu>

Add a schema description for the Venus video decoder/encoder IP in
MSM8939.

Signed-off-by: André Apitzsch <git@apitzsch.eu>
Signed-off-by: Erikas Bitovtas <xerikasxx@gmail.com>
---
 .../bindings/media/qcom,msm8939-venus.yaml         | 75 ++++++++++++++++++++++
 1 file changed, 75 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/qcom,msm8939-venus.yaml b/Documentation/devicetree/bindings/media/qcom,msm8939-venus.yaml
new file mode 100644
index 000000000000..5bbc7cfb61c0
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/qcom,msm8939-venus.yaml
@@ -0,0 +1,75 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/qcom,msm8939-venus.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm MSM8939 Venus video encode and decode accelerators
+
+maintainers:
+  - André Apitzsch <git@apitzsch.eu>
+  - Erikas Bitovtas <xerikasxx@gmail.com>
+
+description: |
+  The Venus IP is a video encode and decode accelerator present
+  on Qualcomm platforms
+
+allOf:
+  - $ref: qcom,venus-common.yaml#
+
+properties:
+  compatible:
+    const: qcom,msm8939-venus
+
+  power-domains:
+    maxItems: 3
+
+  power-domain-names:
+    items:
+      - const: venus
+      - const: core0
+      - const: core1
+
+  clocks:
+    maxItems: 5
+
+  clock-names:
+    items:
+      - const: core
+      - const: iface
+      - const: bus
+      - const: core0
+      - const: core1
+
+  iommus:
+    maxItems: 1
+
+required:
+  - compatible
+  - iommus
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/clock/qcom,gcc-msm8939.h>
+
+    video-codec@1d00000 {
+      compatible = "qcom,msm8939-venus";
+      reg = <0x01d00000 0xff000>;
+      interrupts = <GIC_SPI 44 IRQ_TYPE_LEVEL_HIGH>;
+      clocks = <&gcc GCC_VENUS0_VCODEC0_CLK>,
+               <&gcc GCC_VENUS0_AHB_CLK>,
+               <&gcc GCC_VENUS0_AXI_CLK>,
+               <&gcc GCC_VENUS0_CORE0_VCODEC0_CLK>,
+               <&gcc GCC_VENUS0_CORE1_VCODEC0_CLK>;
+      clock-names = "core", "iface", "bus", "core0", "core1";
+      power-domains = <&gcc VENUS_GDSC>,
+                      <&gcc VENUS_CORE0_GDSC>,
+                      <&gcc VENUS_CORE1_GDSC>;
+      power-domain-names = "venus", "core0", "core1";
+      iommus = <&apps_iommu 5>;
+      memory-region = <&venus_mem>;
+      status = "disabled";
+    };

-- 
2.54.0


