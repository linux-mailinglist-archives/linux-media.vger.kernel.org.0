Return-Path: <linux-media+bounces-61017-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sD/cJIdUAGp5GQEAu9opvQ
	(envelope-from <linux-media+bounces-61017-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sun, 10 May 2026 11:48:55 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id EDD7750369A
	for <lists+linux-media@lfdr.de>; Sun, 10 May 2026 11:48:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id CD8823022F87
	for <lists+linux-media@lfdr.de>; Sun, 10 May 2026 09:47:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DC2B33793C5;
	Sun, 10 May 2026 09:47:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bv2N9VLl"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 902A837C0E7
	for <linux-media@vger.kernel.org>; Sun, 10 May 2026 09:47:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778406475; cv=none; b=qXFQTdzJKE2E2ls3rdXlzKNqIf61Ia3t/p0WJSgLYoAHZXK9LV7BYTmfLrVDQITIPcqQqfHvqZSWMmkyuKA4Xu6fY3+S0DzlUcxYTEVcfZIrwcWbRY9IkuUyRLkKyovRZ+JBlLMZL9TEag3hDe4nGFjPMWCtylp+7t/pq8oDcbI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778406475; c=relaxed/simple;
	bh=0YOIeEfM7VyMCOce1KEss0Hecntxk+HxQDlZl2XCTRY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=rvALn24RjFo9B3OmspOox5Tj1pDrZbpli1IrANrJ1FoUr6uhjRzA2NnspkjUQEr0sLyaoydDYejQi05rh9d5pJ+HUzygRmIfZtYenQZbuBhEilX0mn5mgfVRqc/3/moeWelZiYa2O5N2gjkainebZv6/uLGH4l2qdguB//c6MI0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bv2N9VLl; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-488e1a8ac40so33068295e9.2
        for <linux-media@vger.kernel.org>; Sun, 10 May 2026 02:47:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778406472; x=1779011272; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/cJlB+8b3x/3rtxKDJ9m4uDjdrOStGjNFVxlZruzgDE=;
        b=bv2N9VLllYYGoUjktdwyhydbEnLd002Q2QI0nmjeS4n/pg8U9Fhmza/0QP9gTa52T7
         dsAoy4Vq2o5h7HW83aHNv82kjReEkEv0uWLue1p87JB4CCKRZyPjG1rJ0+yMW/cU+2Mx
         A0ohPovFEwxID323ugcgTQFkoJScL257m2ulxzMJNoqRTOsuiDLO5BQPeE8z7X+A/yeU
         wSzZSGTlILEumjM6LKJD8oL/OZUzcqgkPjrW4c5w4Y9+8sFOouOWCBLxMO/M+RIHT7st
         qr/0Ju4c89O06+RkNBZ8c8EvNEU43j/J+mOM9e98tbdpoks4I3iImJm9r0ciotzefLYS
         Lvqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778406472; x=1779011272;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=/cJlB+8b3x/3rtxKDJ9m4uDjdrOStGjNFVxlZruzgDE=;
        b=fwm5E3Zfsfr2n6amfs16ZO6JOxm6+n4VgqBrU6z8ZmbaiT9BKKyEjIgiTZE5AorHmg
         8ce9giXwOOi5bG/n7HMn1Ovm3otZGt8RHiEoDvW5S+syYcVo9XXCP3oWlPvD2NIE7uoW
         U0EoLg7WIMss1CPOp2dZJcSV0cGKYUzYjc3ozFBpl1xupP/lRVIsVHFHEKRLKrij5gu3
         baTljxifY6Ug/k/2cLwaBry5zOwLpeJkudG97WtCEx5YqidtPElnWbvuMIA+CHn/0nEY
         p+9gLnQCMrFJpSmiSqipfIEJkX9Gm6duuCPW3RdQHoIcXU2Dxy75nzSLTdMU3QgIiJoW
         wSiQ==
X-Gm-Message-State: AOJu0YzdMZMynnS+bcybcreBuX6JRYw2q9WRkdvxjpFoBjKKXYnuD0K0
	IImFl/38Z+TJuAB/DLCUpPmsgKNtFXEwzK/3ybR7rfC2qw7IO/68pm6x
X-Gm-Gg: Acq92OFaXAxbqtjkrhxHcU27sV6f6TM/4PzBXDdhtISR1LhOxoGaZTdhbveL0IDF6Zq
	w6x1mHyGxJeoRBMI6LbLCPOkJ0StZqofw/y+u78SxEABHybY08qq+SX8f9AbwMJeuP6aj3yNk7f
	lJgvbpLcMfedu288EdeuU14c0iQJUDAC+hbYUsh2up1IPh5PmKNMF5+lsDOhqYhizQ0VrP7EpJF
	YjGGUwluvY2o1A6uzFP2n0ChdsCHtSLTXgfUp7GxUmCfZrP07mzGxJ9+k/h5bdAcu+rtpC/obHo
	VJNqmoA7obl4NdcL6pFB1BXmxTv1VhFuyR+pHeQvHAanet1POGo9b6Q02h8JC9c2yka50ZAuqvi
	3YnMBexn8ibEvyd6y2WJXs+ww1Ux/pFILhG+ObYc2SL7tjKVYPDAWq9BB4Rzi+ZoM6tH1sUg1k6
	HnsaQ40Jg9G4WEWaH2xjKAA3jL8Z8wklCj0f/hA8A=
X-Received: by 2002:a05:600c:c494:b0:48a:592c:e632 with SMTP id 5b1f17b1804b1-48e51f42760mr305708305e9.16.1778406472049;
        Sun, 10 May 2026 02:47:52 -0700 (PDT)
Received: from [192.168.8.79] ([2a00:f502:160:4e2:a099:cad9:2ecd:93de])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48e702e0bf2sm182807925e9.4.2026.05.10.02.47.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 May 2026 02:47:51 -0700 (PDT)
From: Erikas Bitovtas <xerikasxx@gmail.com>
Date: Sun, 10 May 2026 12:47:39 +0300
Subject: [PATCH v6 1/8] media: dt-bindings: venus: Add qcom,msm8939 schema
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260510-msm8939-venus-rfc-v6-1-e69465375900@gmail.com>
References: <20260510-msm8939-venus-rfc-v6-0-e69465375900@gmail.com>
In-Reply-To: <20260510-msm8939-venus-rfc-v6-0-e69465375900@gmail.com>
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
X-Rspamd-Queue-Id: EDD7750369A
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
	TAGGED_FROM(0.00)[bounces-61017-lists,linux-media=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[apitzsch.eu:email,devicetree.org:url,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,1d00000:email]
X-Rspamd-Action: no action

From: André Apitzsch <git@apitzsch.eu>

Add a schema description for the Venus video decoder/encoder IP in
MSM8939.

Signed-off-by: André Apitzsch <git@apitzsch.eu>
Reviewed-by: Bryan O'Donoghue <bod@kernel.org>
Signed-off-by: Erikas Bitovtas <xerikasxx@gmail.com>
---
 .../bindings/media/qcom,msm8939-venus.yaml         | 79 ++++++++++++++++++++++
 1 file changed, 79 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/qcom,msm8939-venus.yaml b/Documentation/devicetree/bindings/media/qcom,msm8939-venus.yaml
new file mode 100644
index 000000000000..10a50a410748
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/qcom,msm8939-venus.yaml
@@ -0,0 +1,79 @@
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
+description:
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
+      - const: vcodec0
+      - const: vcodec1
+
+  clocks:
+    maxItems: 5
+
+  clock-names:
+    items:
+      - const: core
+      - const: iface
+      - const: bus
+      - const: vcodec0_core
+      - const: vcodec1_core
+
+  iommus:
+    maxItems: 1
+
+required:
+  - compatible
+  - iommus
+  - power-domain-names
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
+      clock-names = "core",
+                    "iface",
+                    "bus",
+                    "vcodec0_core",
+                    "vcodec1_core";
+      power-domains = <&gcc VENUS_GDSC>,
+                      <&gcc VENUS_CORE0_GDSC>,
+                      <&gcc VENUS_CORE1_GDSC>;
+      power-domain-names = "venus", "vcodec0", "vcodec1";
+      iommus = <&apps_iommu 5>;
+      memory-region = <&venus_mem>;
+    };

-- 
2.54.0


