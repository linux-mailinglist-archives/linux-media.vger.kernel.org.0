Return-Path: <linux-media+bounces-8307-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 68F24893D06
	for <lists+linux-media@lfdr.de>; Mon,  1 Apr 2024 17:44:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 17AF31F22AFA
	for <lists+linux-media@lfdr.de>; Mon,  1 Apr 2024 15:44:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DFA9447768;
	Mon,  1 Apr 2024 15:44:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="He9+V9K2"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 012453FBBD;
	Mon,  1 Apr 2024 15:44:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711986256; cv=none; b=NhreeRiKPsMdHNfh1tomwJm9iZJZnjIh8r8QpxfuUUndZ5S8C0i8WvcpAKMwimzVsdrEvHUPUJKQXqFaCb3ySohqb9CWMY6QGOPLbi21WRfj398xSk+8Hd2BwNHwO92VOYaWYzX2cncaiPAvDSL6OMnKpkYpvzjtCuSQ6QK47Uo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711986256; c=relaxed/simple;
	bh=B42QTMoZxD4hJkKRaHX5hqfPha/2Aav3eyvZORC/vio=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=kSBkxm8JDec6cxqgbYrC8I0H5zt1naOQ85CTOoGROFocljC7t8QYtIv0YrkCOtohraAkihmHFb4gqT0XIFBkd7QSV4XKBz8DZ3XZDf92ap3iVpYxB8uOUF635SBhmNV27pyjxT7aYZS7ksrp1CfmWmyB3liS5nn85ScoUmVemPQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=He9+V9K2; arc=none smtp.client-ip=209.85.215.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-5d862e8b163so865792a12.1;
        Mon, 01 Apr 2024 08:44:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1711986254; x=1712591054; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=xwHb/m/hP9fiBWpaFCh5QcRA0pMEoYocev1FpzFn82o=;
        b=He9+V9K2uiVYmD+WUqWGbiIN0le6u3IMWFE8NBztkYfY20KmBukPOig1sn5Ocm+dD/
         IxRAsGsL1bkbSshhYQQy188CKLLxY4q+YmmITy4BmJseqUIaOEcubrdzs5nuqyOeaMHa
         r8ysnf5f4ppt3nTIWIVdAsneg3qxnyx09+4tl/ohA8SHKjO59hQeO3xKLbTbdPdFAyGN
         0b59Oq/Akddj/3rzmbYvGFCjTmhMv/9h4u+z3LRnfeH6Uj6YYItwstfrq2YgAQP/vE1C
         De9Ku33hyov+DtBzDoULo06hrZjjkapJ3IZQ4tvOc5EC2NQFaLlNouNUFnGV5MlSWR0x
         G4dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711986254; x=1712591054;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xwHb/m/hP9fiBWpaFCh5QcRA0pMEoYocev1FpzFn82o=;
        b=bga0SzZeeO3VD1lDo2GE8GxHpeyXspr5meMU0MMAxLvL6nNcDsN3wUDGe3hosK0F1W
         sQxqcyj6NbdM25n2e/hXOENoyIFvUDZ0tyVWuOB/z2kXAT2OmdYNUP7JDyFLcYr1JdcZ
         16RICmQXBSe8FRn1r6UfpSwOX8jUlzgOP/W+KoTWTs0LDiz1VQ8/zrXzmM0a26bC71rv
         64eUHkwAMgToTeT0QNx3PBPrcP3okdleRyALUGDpEqRpMJgmeyThwi1Aned6Se1AOSqU
         OtfyCbCWsQOq63YFI1pi0jFJoKJ5Y70oRMNyUK/CWJeepp9gHqkf5rQ64nfKQ47IohZE
         hjvw==
X-Forwarded-Encrypted: i=1; AJvYcCUQtDcwNAORpgmWJkm2RNCB/UqZh63pcWVJBdI6K0WIqJMBxzRryAvwriuIT++2hhz6BHLXfFuuP+aJhNdhRQg++ilx/NU52Vg5wTP8ToEBfOmnD/DTacPsgr2L05LjYVtdctIcal1p
X-Gm-Message-State: AOJu0YwmmLRAIq50p6r1XjD+hV9lQ/rVTpFS8W5wM3GYMH2yFYjSQhNS
	6bdzkp2BGPsAzsQWlSH2Tll29CgeczQXDHMylohc9iQsu01HC3jc
X-Google-Smtp-Source: AGHT+IGUVTuBEuSUn8CA8hrbpvOqWP0fFytA3SYaY3gXA7PJemahFJr/4OMERoBAClT6cXOrdVN5yA==
X-Received: by 2002:a17:902:b092:b0:1e0:c887:f938 with SMTP id p18-20020a170902b09200b001e0c887f938mr10770942plr.3.1711986254171;
        Mon, 01 Apr 2024 08:44:14 -0700 (PDT)
Received: from fabio-Precision-3551.. ([2804:14c:485:4b61:a943:2baf:4369:df34])
        by smtp.gmail.com with ESMTPSA id f7-20020a170902684700b001dedfba4c69sm9202270pln.134.2024.04.01.08.44.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Apr 2024 08:44:13 -0700 (PDT)
From: Fabio Estevam <festevam@gmail.com>
To: sakari.ailus@linux.intel.com
Cc: rmfrfs@gmail.com,
	laurent.pinchart@ideasonboard.com,
	hansg@kernel.org,
	robh@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org,
	linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	Fabio Estevam <festevam@denx.de>
Subject: [PATCH v2] media: dt-bindings: ovti,ov2680: Document more properties
Date: Mon,  1 Apr 2024 12:43:41 -0300
Message-Id: <20240401154341.3173872-1-festevam@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Fabio Estevam <festevam@denx.de>

OV2680 has a single data lane MIPI interface.

Document the clock-lanes and data-lanes properties to avoid
the following dt-schema warning:

imx7s-warp.dtb: camera@36: port:endpoint: Unevaluated properties are not allowed ('clock-lanes', 'data-lanes' were unexpected)
	from schema $id: http://devicetree.org/schemas/media/i2c/ovti,ov2680.yaml#

While at it, also document the link-frequencies property as recommended
by the following document:

https://www.kernel.org/doc/html/v6.9-rc1/driver-api/media/camera-sensor.html#handling-clocks

Signed-off-by: Fabio Estevam <festevam@denx.de>
---
Changes since v1:
- Keep the existing 'additionalProperties: false'. (Krzysztof)
- Also document link-frequencies.

 .../bindings/media/i2c/ovti,ov2680.yaml       | 20 ++++++++++++++++++-
 1 file changed, 19 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/media/i2c/ovti,ov2680.yaml b/Documentation/devicetree/bindings/media/i2c/ovti,ov2680.yaml
index cf456f8d9ddc..a1cb08283818 100644
--- a/Documentation/devicetree/bindings/media/i2c/ovti,ov2680.yaml
+++ b/Documentation/devicetree/bindings/media/i2c/ovti,ov2680.yaml
@@ -50,9 +50,24 @@ properties:
       Definition of the regulator used as digital power supply.
 
   port:
-    $ref: /schemas/graph.yaml#/properties/port
     description:
       A node containing an output port node.
+    $ref: /schemas/graph.yaml#/$defs/port-base
+    additionalProperties: false
+
+    properties:
+      endpoint:
+        $ref: /schemas/media/video-interfaces.yaml#
+        unevaluatedProperties: false
+
+        properties:
+          clock-lanes:
+            const: 0
+
+          data-lanes:
+            const: 1
+
+          link-frequencies: true
 
 required:
   - compatible
@@ -89,6 +104,9 @@ examples:
                 port {
                         ov2680_to_mipi: endpoint {
                                 remote-endpoint = <&mipi_from_sensor>;
+                                clock-lanes = <0>;
+                                data-lanes = <1>;
+                                link-frequencies = /bits/ 64 <330000000>;
                         };
                 };
         };
-- 
2.34.1


