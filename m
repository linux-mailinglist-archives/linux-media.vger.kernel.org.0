Return-Path: <linux-media+bounces-52482-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CCbtNFyqimmbMwAAu9opvQ
	(envelope-from <linux-media+bounces-52482-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 10 Feb 2026 04:47:40 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 54838116CBC
	for <lists+linux-media@lfdr.de>; Tue, 10 Feb 2026 04:47:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 8F121302198E
	for <lists+linux-media@lfdr.de>; Tue, 10 Feb 2026 03:47:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6F3F5283C93;
	Tue, 10 Feb 2026 03:47:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KtCFGzwK"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com [209.85.160.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A47FA2F851
	for <linux-media@vger.kernel.org>; Tue, 10 Feb 2026 03:47:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770695256; cv=none; b=tTD+eeYHjfipMW/D5SEAjCXeZitbXDcqav7bdkljY9zWPfceLkKE264TBNE2cTL+eGiUDgysS52eV2SDqwdxPel5myYxvCngnYd4FWIURYwxXijY5Ii+HVdFU+4XNV56U0DA+O/q95pDRqIPAMjhJ4NlbalIY2WjNigGj+6UoyE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770695256; c=relaxed/simple;
	bh=6mwOA0dPC+Xr0uI2n1ZFZV+bR933rcuFFj/RWST+Emg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=uvRRD554G0XT8i2l2pgyXt/bwrEWWCxR4LGWc6PiE7Fa9/w/h+GgsclS2JOB1FGNRiU5Dn6tMwL9EjV8IBJd8lRoPnWEZNWH4g+6ymgawBKiKweZ/Fmhq6r0GUTysTia3UO9ABam1bi8sYlAJ6Ow4DFqYct+oG04UFw/roq2CsU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KtCFGzwK; arc=none smtp.client-ip=209.85.160.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qt1-f180.google.com with SMTP id d75a77b69052e-505e2e4c35fso3412871cf.3
        for <linux-media@vger.kernel.org>; Mon, 09 Feb 2026 19:47:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770695254; x=1771300054; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5iup6qDNhA3Ov81Mqulz5I0c3UbxOYNMRh+dC/qq+Kk=;
        b=KtCFGzwKAw2Ogxnl6B6wepUfSuWVCxPxb8/qzbb0Z/EnHEuSZfOE0uZNq+5snnUGsp
         4JJDEMs5LXap4r2x2d5jhtxykxxIqB+OvSGwNmLF7XCobcusaTjkXd7wI7lewTpQbUV6
         AVa6GlO90hdJ8A1MEYcsHDWKi4bDGBctxJKvZCudOUzPp0xw7ILsB1XhhRP0md6zXQvm
         u88XFoz54qcEA3XbSynA0RVd+ngvjJdpmdY80PF0PBbb2+3yvtzkoc2zcsWUoaOalMFL
         Gn/+42uFSfGUBcrwxEZblhvnZaJVXV5QoLE5PCtP8xl6EwvE62A35VB0nm2Dqktb1wrA
         7+Sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770695254; x=1771300054;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=5iup6qDNhA3Ov81Mqulz5I0c3UbxOYNMRh+dC/qq+Kk=;
        b=dA0T7LsgNyRY1oDfAl7NV0JUbTd8pIMpSYm6fZ11Uvcm/rDZ6zXvhrt+4gcBrJRGxP
         SVuMXyO6mAA5ISIJOkNCxRPaarigQRUg4SxJqCRDiZwGveTOVqrJQMXMsShYWH8MNCv6
         om8utlrgCMk/tU0ukOFaS6LXt3L/exsNBqltIbcySMGvSRt33jIyPi7hd1lvngwQ2bn+
         FFgj9h0Fsm93R+fHMhL+wVoUvOuohGsvuIWr+NzIlbJjrMIE/yj3k2a69j/bYVZZeNqO
         J2HTA6wwmhmm2C3ht0N8uJOeHn1czE3WQcQPU1w/Ls5eG01W6mIJZDC7cM2zu3zNidpB
         3/jg==
X-Forwarded-Encrypted: i=1; AJvYcCWL/yiVq4dgBrMFZxoGV09m7uR60XNNwbGGOTwdOJmsc1B/qUJ85ok73kkDKiDQZJfwcBO8asTu8ygIfQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxykMJw7n07LxPULpHsMICNf/twGDnXUqYV4oRO4Pw6CAa7Jaxi
	xCELZhruNLDqYcHcwT95trc5uGKyz0z7qoaZPYKPXk0i0b7+6JhtvIDloPtG9Q==
X-Gm-Gg: AZuq6aLyblp6Qi+aTvHwgqE7DidiOx9Ryxu/q3UubKjtRk3zkNnl9BaIY+jzCz5oUdT
	2h6wzQFoVHZ4Dv5o1UYvNuQXyfwoy1Oy3B/sYiv7CSilizSWQj+v3d+281M+JDVIzLm6kvs+hWm
	9zwsjv05t+ZiLZYBoM8xlCbt+2T/T06p5S3y4WmJBp/HVslPcbuhLc2YsVI3B6NsGXLcUI0Lz8s
	vLuBHIu7rvLN2D+Idr+Boj9i+YeEhHuvMeNP8Ybv5Aln2dE5F6s+jPZlU/OWiwS0W+22EsxmiQw
	ZHwxEqT8nDXohZQyEc/cHTXjdsOaFMzOMv3aU4SOtXMZl48Orasblgk8u56XdaWLbs1d4nmGnrQ
	VF3MzjOnfYj2l40rx103pt68ZRtF8IeKvjS+reObK8nTco7YCHjPPpESmofniXmPtpPczP6mXdH
	GwP3zf6HY+PQV82jEyqkk4XxwKwNEdDQHlpBIGS6FDa4cKtI0pXwP846Wfe8b5yPSjwKNyEghDa
	QUWUpQ0kS5i5C0=
X-Received: by 2002:ac8:7f87:0:b0:505:e7b8:5531 with SMTP id d75a77b69052e-506398d24a1mr168396881cf.14.1770688894933;
        Mon, 09 Feb 2026 18:01:34 -0800 (PST)
Received: from localhost (bras-base-toroon21-grc-75-184-144-58-243.dsl.bell.ca. [184.144.58.243])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8953c03fca0sm89311366d6.28.2026.02.09.18.01.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Feb 2026 18:01:34 -0800 (PST)
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
Subject: [PATCH v8 2/7] dt-bindings: media: i2c: Add Sony IMX355
Date: Mon,  9 Feb 2026 21:02:01 -0500
Message-ID: <20260210020207.10246-3-mailingradian@gmail.com>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,linaro.org,intel.com,linux.intel.com,vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[19];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_FROM(0.00)[gmail.com];
	TAGGED_FROM(0.00)[bounces-52482-lists,linux-media=lfdr.de];
	FREEMAIL_CC(0.00)[collabora.com,ixit.cz,vger.kernel.org,gmail.com];
	PRECEDENCE_BULK(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	FROM_NEQ_ENVFROM(0.00)[mailingradian@gmail.com,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DKIM_TRACE(0.00)[gmail.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Queue-Id: 54838116CBC
X-Rspamd-Action: no action

The IMX355 camera sensor is a camera sensor that can be found as the
front camera in some smartphones, such as the Pixel 3, Pixel 3 XL, Pixel
3a, and Pixel 3a XL. It already has a driver, but needs support for
device tree. Document the IMX355 to support defining it in device tree.

Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Richard Acayan <mailingradian@gmail.com>
---
 .../bindings/media/i2c/sony,imx355.yaml       | 111 ++++++++++++++++++
 1 file changed, 111 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/i2c/sony,imx355.yaml

diff --git a/Documentation/devicetree/bindings/media/i2c/sony,imx355.yaml b/Documentation/devicetree/bindings/media/i2c/sony,imx355.yaml
new file mode 100644
index 000000000000..6050d7e7dcfe
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/i2c/sony,imx355.yaml
@@ -0,0 +1,111 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/i2c/sony,imx355.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Sony IMX355 Sensor
+
+maintainers:
+  - Richard Acayan <mailingradian@gmail.com>
+
+description:
+  The IMX355 sensor is a 3280x2464 image sensor, commonly found as the front
+  camera in smartphones.
+
+allOf:
+  - $ref: /schemas/media/video-interface-devices.yaml#
+
+properties:
+  compatible:
+    const: sony,imx355
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+
+  avdd-supply:
+    description: Analog power supply.
+
+  dvdd-supply:
+    description: Digital power supply.
+
+  dovdd-supply:
+    description: Interface power supply.
+
+  reset-gpios:
+    description: Reset GPIO (active low).
+    maxItems: 1
+
+  port:
+    $ref: /schemas/graph.yaml#/$defs/port-base
+    additionalProperties: false
+
+    properties:
+      endpoint:
+        $ref: /schemas/media/video-interfaces.yaml
+        unevaluatedProperties: false
+
+        properties:
+          data-lanes:
+            minItems: 4
+            maxItems: 4
+
+        required:
+          - link-frequencies
+
+    required:
+      - endpoint
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - avdd-supply
+  - dvdd-supply
+  - dovdd-supply
+  - port
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/qcom,camcc-sdm845.h>
+    #include <dt-bindings/gpio/gpio.h>
+
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        camera@1a {
+            compatible = "sony,imx355";
+            reg = <0x1a>;
+
+            clocks = <&camcc CAM_CC_MCLK2_CLK>;
+
+            assigned-clocks = <&camcc CAM_CC_MCLK2_CLK>;
+            assigned-clock-rates = <24000000>;
+
+            reset-gpios = <&tlmm 9 GPIO_ACTIVE_LOW>;
+
+            avdd-supply = <&cam_front_ldo>;
+            dvdd-supply = <&cam_front_ldo>;
+            dovdd-supply = <&cam_vio_ldo>;
+
+            pinctrl-names = "default";
+            pinctrl-0 = <&cam_front_default>;
+
+            rotation = <270>;
+            orientation = <0>;
+
+            port {
+                cam_front_endpoint: endpoint {
+                    data-lanes = <1 2 3 4>;
+                    link-frequencies = /bits/ 64 <360000000>;
+                    remote-endpoint = <&camss_endpoint1>;
+                };
+            };
+        };
+    };
-- 
2.53.0


