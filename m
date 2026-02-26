Return-Path: <linux-media+bounces-53516-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8G4UN8dZoGlPigQAu9opvQ
	(envelope-from <linux-media+bounces-53516-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 26 Feb 2026 15:33:43 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 59C951A79D2
	for <lists+linux-media@lfdr.de>; Thu, 26 Feb 2026 15:33:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 61A7730A12B5
	for <lists+linux-media@lfdr.de>; Thu, 26 Feb 2026 14:29:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4CBBB3D34A3;
	Thu, 26 Feb 2026 14:28:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="gow6+/c3"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F2E73D1CC5
	for <linux-media@vger.kernel.org>; Thu, 26 Feb 2026 14:28:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772116128; cv=none; b=rE7j+fiXaimXNKlYckogiIW4s822DFVJznFlIpxWNUZCbz6QVf3DPnzmvwBtzGtZs91qBrRPltBj1tAJyKTLBRMb+Hhwtv9kjvsQTipHQSz/pTj4x0E2xQR5dUc8vNDFLWVR4rnu6wss43gvEWTOYh9bpDPhH4WrJbnBbk1+6/o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772116128; c=relaxed/simple;
	bh=oUlDgFPOuTzk+k1ZFHFnc33Wy4fO8ZWAGLIRsB8Y02g=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=WMSh9YmJhM0MBpjqY/3S9tBL2pgJJZMNQ8PNBvYrOKzjJdLA8qIgPml6styLfUmMpsRgJ6klNKsq0pzDesipH1aA8r+pnrXqexB0hjfQx2MVsaXLkIzuIjkWg9c8YfJt9EOMAoJvruGAsg9nA4FSiEoRPeMfWGIGMV7ssLOogoo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=gow6+/c3; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-4399851b14bso538187f8f.1
        for <linux-media@vger.kernel.org>; Thu, 26 Feb 2026 06:28:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1772116124; x=1772720924; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QBlrim4N223oggAozzYLyyaMZ8xxO7R36NeLnPQn72Q=;
        b=gow6+/c3iGApyXcnFSUXPykNDTWujFc35zuuy30tMJ3oo6HufPU+8fJ6cXBswyDmfE
         surFLYnvcCNiMKv6hJjMqYX9R1rCXbqey0mg6EKuSr/UMz0heEzYn08AJGKCvyz4Warv
         7MUOBHQuaZ03CFsD7p5USolUj1K1OCma15QVudm42TH0XynrPn6Sp0sEsSrep+CSVcvL
         5MXlsXFpbFOFuo4Q408ZAeHgeYxSREvmmsHYSrUOS2M3jJwlyUaHwU9/d2L6tTfKvwFk
         2TPF7fjCfP5xaf/wMbp8EopmGbcEiUO+lno0cAEkvIGtligheRz3dzSHUxFsjnyxk8Ad
         +1fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772116124; x=1772720924;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=QBlrim4N223oggAozzYLyyaMZ8xxO7R36NeLnPQn72Q=;
        b=GOWOxPW31LgGT+USoNdXaZh6VfFzuS/w6jOvETfOM3u5QW3pb5Es7vE2Xo6b3485/n
         9W68svaNsa8mNfeizX4TA2SnBVQ7Ne27e8uv1Iwh6A140tYYnkB9kOkJZBkN7iVoqV6O
         kktzid+zFQ12v3gaKnIzI2RGaSwHt/RE7cgjKwv0giIS8ShDP4TWzFl6qb33zGN99k6q
         HebDJ0oLKQeTWgECkXMjA/AsFUcDchoPiTrlI1sIFY4R8+kEQbDQiPUU8GxMQRTbR5Wv
         AdvNuhzhC9zI2V896407IvNAZB6RU8Nm8sOf+PsOpiFm6eECWA2tJQUnxQCrm+mwCdRB
         MGGA==
X-Forwarded-Encrypted: i=1; AJvYcCWKOXh1Su8faCjyY4hrnoKYODqh7rKgnKYnoF+GHpLQcG+jsjSofEbnroJCAMK0DkpRKtMbJS9XIp9SWw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwnteX5eZ5Tq0aleQY9kmm2cHn42hApXf0lh5V0v8Yj1qhkNXbQ
	tfPI23lvc3zFRNa6OMExCRPgd0l0XefXbXw7skVu1REFnu+fAjR9ruSPu03sipE2vyw=
X-Gm-Gg: ATEYQzz+M/0A8e7ESBe2aQzhxmwYyffqLa3ALsoGwxePTiVMyL+5yyXPowCGNcfan0x
	cd+OEerFbsL1Hv8LdmNBODaaW2Ml5V8PghTflYhbwUGIlKUniLNrfSBGZpDQayVvReGQzzT7rDI
	blr8lflmvIeesylFEnG139gOv10jdabuTiR3pr+moMX3TuUqFlr47z6mk+S1XgaU+7lteQtwtAz
	gz2TPOAAg7IH1cChFQTTdGbuKuH1KAtTpLmNVGr5MAf76gnYR5n4r4ZlFlgquOW8CMLHoQiMYT0
	+6uf6u5fOSgeVu7bq/jE+6AHO2Yy/ZG/5r4Gz/eoVojbVfMTT4jtuHenxURey0TQOMB53qT5u/F
	HtfeGB8GDYzwEcTABPNY1Rj8PtIwLseblNm364X2w9Vi4GI8IvOcQVh3TAhQmjmqoxuySQCy9iV
	h4MhQsyIUNocoTjK0MsUHM/R1oChUtZzvMXPbNEtGljVIN2qQOEfOaZkwPwVF4OjYh
X-Received: by 2002:a05:6000:1865:b0:439:8a9d:66fc with SMTP id ffacd0b85a97d-4398a9d684emr16322032f8f.15.1772116124435;
        Thu, 26 Feb 2026 06:28:44 -0800 (PST)
Received: from [192.168.0.35] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43970d4bf89sm39219897f8f.29.2026.02.26.06.28.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Feb 2026 06:28:43 -0800 (PST)
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Date: Thu, 26 Feb 2026 14:28:42 +0000
Subject: [PATCH v9 1/7] dt-bindings: media: qcom,x1e80100-camss: Add
 optional PHY handle definitions
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260226-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v9-1-a59c3f037d0b@linaro.org>
References: <20260226-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v9-0-a59c3f037d0b@linaro.org>
In-Reply-To: <20260226-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v9-0-a59c3f037d0b@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Robert Foss <rfoss@kernel.org>, 
 Todor Tomov <todor.too@gmail.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, 
 Bryan O'Donoghue <bod@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-media@vger.kernel.org, Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Krzysztof Kozlowski <krzk@kernel.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1451;
 i=bryan.odonoghue@linaro.org; h=from:subject:message-id;
 bh=oUlDgFPOuTzk+k1ZFHFnc33Wy4fO8ZWAGLIRsB8Y02g=;
 b=owEBbQKS/ZANAwAKASJxO7Ohjcg6AcsmYgBpoFibxPnmC3u2EverAZkkby/eBo5GIJANa/oCQ
 eM1mxZBwhqJAjMEAAEKAB0WIQTmk/sqq6Nt4Rerb7QicTuzoY3IOgUCaaBYmwAKCRAicTuzoY3I
 OtRQEACLfSoHUc1rg2Jl/sauqI9Mtdw8axf+VLfyialt38ijwTVbFWg48vThermKEBJofT64OEb
 ZfV/Ffe9HuGwiNSrKXZ1sN547+64PJPwCvQASX0Umh3Dopuqt0pafRzLjjOabplu4u1oLeQW0Jn
 s85cGIcLdeuBDSPivy1cVq3fBrmtO5HJOi3kJA2uv2/P71xOpeCL+6eCPG4F2DyxRjFy8ABXfvG
 Wgz01YMVSvzaKcjX3q49X9Y2Bb+gQCm9oRmWskn64HFih57PFk9Xov3SiNh2XOOpOGx02zh7sc3
 GX56hFn0iEX/2XbudY7hLtbPDSh4akpALwY1dLFNU4mrkVXF2zWS/Oc7zJX5etjOgBLm7ylsdbk
 gDCI14tn0NiYq/ZbeNrA5snP0BCsNZQiN2w2CRJs6zyFL5Q5VYRGT+nE7ba/q1ZZ6E/kIpUAcfA
 Q6I32G8xieCSNmiQ6S8kfmSeCpW+p5ZVGBHywDLgWDJrOktttiDA4Lq9uBQmXD2xf68XjQE6Kq4
 aPFxe5B6YR7p+HjIU7sAAGquKK42UjcDsE0d6zGfuKgmN3HSyuRZhfuXUYnXti+U9VQtV2squ6B
 5QPLVLTVooh4nrMU9sLXHCDZ9VfX0/tH9RR7K8THpex/e3ltG4rZdfQYzHNz2Iam/wUa380RpZU
 tsqIq7hU1M3dZ0Q==
X-Developer-Key: i=bryan.odonoghue@linaro.org; a=openpgp;
 fpr=E693FB2AABA36DE117AB6FB422713BB3A18DC83A
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-53516-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,baylibre.com,gmail.com,linaro.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[linaro.org:+];
	RCPT_COUNT_TWELVE(0.00)[19];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bryan.odonoghue@linaro.org,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,linaro.org:mid,linaro.org:dkim,linaro.org:email]
X-Rspamd-Queue-Id: 59C951A79D2
X-Rspamd-Action: no action

Add optional PHY handle definitions. This will allow for supporting both
legacy PHY definitions as well as supporting the optional new handle based
approach.

Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 .../devicetree/bindings/media/qcom,x1e80100-camss.yaml    | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/qcom,x1e80100-camss.yaml b/Documentation/devicetree/bindings/media/qcom,x1e80100-camss.yaml
index 2d1662ef522b7..bb18236b4f344 100644
--- a/Documentation/devicetree/bindings/media/qcom,x1e80100-camss.yaml
+++ b/Documentation/devicetree/bindings/media/qcom,x1e80100-camss.yaml
@@ -126,6 +126,16 @@ properties:
     description:
       1.2V supply to a PHY.
 
+  phys:
+    maxItems: 4
+
+  phy-names:
+    items:
+      - const: csiphy0
+      - const: csiphy1
+      - const: csiphy2
+      - const: csiphy4
+
   ports:
     $ref: /schemas/graph.yaml#/properties/ports
 
@@ -351,6 +361,11 @@ examples:
             vdd-csiphy-0p8-supply = <&csiphy_0p8_supply>;
             vdd-csiphy-1p2-supply = <&csiphy_1p2_supply>;
 
+            phys = <&csiphy0>, <&csiphy1>,
+                   <&csiphy2>, <&csiphy4>;
+            phy-names = "csiphy0", "csiphy1",
+                        "csiphy2", "csiphy4";
+
             ports {
                 #address-cells = <1>;
                 #size-cells = <0>;

-- 
2.52.0


