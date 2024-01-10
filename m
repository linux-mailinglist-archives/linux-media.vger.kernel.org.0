Return-Path: <linux-media+bounces-3446-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DE0F6829687
	for <lists+linux-media@lfdr.de>; Wed, 10 Jan 2024 10:48:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 103441C253BA
	for <lists+linux-media@lfdr.de>; Wed, 10 Jan 2024 09:48:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DCCD83FE27;
	Wed, 10 Jan 2024 09:46:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b="gxDIu/C5"
X-Original-To: linux-media@vger.kernel.org
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B97B841771;
	Wed, 10 Jan 2024 09:46:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1704879971; x=1736415971;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=qARngFl8YFW6cJZEV0gLXRU1x9NlrSoRpYfXuFRLnvE=;
  b=gxDIu/C522zCCCswWKz43sFXgJVYZmcK+AYeEdyrL3Ns1QbYNlwKKiYV
   mSPDBpgx8PeShYbY6Zc4YtcwgbjLF8DqExXiNZD+GxGt4iqzgDpcj2Oxa
   CzRFxoMcQ+q+WkYfWryDk3hAg8S9RzeyPbv/c+iGQGk9BXwXqT/asAcYr
   LwzeVw6Nn8u/PxRIL4t5MdYr8wF0vFJN3GI/a1u5v1pYaqRYDBE0sqt7y
   f1dDIr2w5mOymJlctvpk+qm4GsvAb6TBACDBje2q11gG/mQ/BsrkBdPI2
   kr43OQJt68hBY3EvrnBS/paC9uHKT+DvQg09I4iUK3OK4byhXQK9CUGum
   A==;
X-IronPort-AV: E=Sophos;i="6.04,184,1695679200"; 
   d="scan'208";a="34824529"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
  by mx1.tq-group.com with ESMTP; 10 Jan 2024 10:46:08 +0100
Received: from steina-w.tq-net.de (steina-w.tq-net.de [10.123.53.25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id DE40C280075;
	Wed, 10 Jan 2024 10:46:07 +0100 (CET)
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Mirela Rabulea <mirela.rabulea@nxp.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Cc: Alexander Stein <alexander.stein@ew.tq-group.com>,
	NXP Linux Team <linux-imx@nxp.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH 1/1] dt-bindings: media: imx-jpeg: Document slot property
Date: Wed, 10 Jan 2024 10:46:04 +0100
Message-Id: <20240110094604.472701-1-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

There are 4 slots available in the IP, which the driver may use.
This property lists which slots can be used. In reference to commit
53ebeea50599 ("media: imx-jpeg: Support to assign slot for encoder/decoder")
only slot 0 can be used on imx8qxp.

Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
 .../devicetree/bindings/media/nxp,imx8-jpeg.yaml       | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/nxp,imx8-jpeg.yaml b/Documentation/devicetree/bindings/media/nxp,imx8-jpeg.yaml
index 07fef1e723f20..5122c7cff8e73 100644
--- a/Documentation/devicetree/bindings/media/nxp,imx8-jpeg.yaml
+++ b/Documentation/devicetree/bindings/media/nxp,imx8-jpeg.yaml
@@ -54,6 +54,14 @@ properties:
     minItems: 2               # Wrapper and 1 slot
     maxItems: 5               # Wrapper and 4 slots
 
+  slot:
+    $ref: /schemas/types.yaml#/definitions/uint32-array
+    minItems: 1
+    maxItems: 4
+    items:
+      enum: [ 0, 1, 2, 3 ]
+    description: Available slot index
+
 required:
   - compatible
   - reg
@@ -85,6 +93,7 @@ examples:
                         <&pd IMX_SC_R_MJPEG_DEC_S1>,
                         <&pd IMX_SC_R_MJPEG_DEC_S2>,
                         <&pd IMX_SC_R_MJPEG_DEC_S3>;
+        slot = <0>;
     };
 
     jpegenc: jpegenc@58450000 {
@@ -102,5 +111,6 @@ examples:
                         <&pd IMX_SC_R_MJPEG_ENC_S1>,
                         <&pd IMX_SC_R_MJPEG_ENC_S2>,
                         <&pd IMX_SC_R_MJPEG_ENC_S3>;
+        slot = <0>;
     };
 ...
-- 
2.34.1


