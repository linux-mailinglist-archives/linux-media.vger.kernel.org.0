Return-Path: <linux-media+bounces-7888-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id BA0BC88D2A2
	for <lists+linux-media@lfdr.de>; Wed, 27 Mar 2024 00:11:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E6F7F1C30767
	for <lists+linux-media@lfdr.de>; Tue, 26 Mar 2024 23:11:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6EC1413DDB5;
	Tue, 26 Mar 2024 23:10:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BJVGGHD2"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C14C1E494;
	Tue, 26 Mar 2024 23:10:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711494656; cv=none; b=HgCCPTwYttrHdQxAyCViK7x9gf1bIGNV6RpVGJ3/ljd4hGKCkCLLua4XlP47tP8KjF1y6eZnoj8/qH3apOyuMHA1bzY1QAT31ivtg/6qOaLNtgmxyHjHsYk77UhchDNF9gfQeBzMOc1eIgkzvX3+dFaYyl24XqICDtbvseD+Nhc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711494656; c=relaxed/simple;
	bh=iGllS9oXf0zC61pFQfjW6YSpL+0c9JdC0e9B64ib2yo=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=RmRvnpPJTEHMxBOaN3MyjzV1Col7hkRb/g+/PcmYiEgU3L98HzDm/OXxXfaUWDz6YF918a+LgmawDhwR1Oa8r9taERqUnXK0hQWjn8U6KGCkrslgnd3lmlK0HnZAOst7srQM8It1DI4/Wu4jL9E3V0fRpL/nYPXKa6CKWpksORQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BJVGGHD2; arc=none smtp.client-ip=209.85.215.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-5d862e8b163so1289054a12.1;
        Tue, 26 Mar 2024 16:10:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1711494655; x=1712099455; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=1nq0CgX8O+qGAyxnErUu1MNEqe8TDbvktuop+7fB/lw=;
        b=BJVGGHD2KyMhaxtWWv7/iBuNmrAUaWn0lyL1JIrmIQudYTXoCJntl5d4RVV4mJF5RB
         XCpxiFXIlL9H7TVMOtG5eE7TSwq0FtpJfuNk1dqZQvelUDEWLp3L1Es/hfcNsq8oLLS+
         25MqGSSa+UP7eBzg8hK8uDSZDxudWUI/QZ9XrSvBazEIwfFnoo/n1kicUm2vircE9ie7
         gKzieTjoTKFe5ZYVLZkZT+FdpOJ74RuqR9t4cuXHBAmtAuGpBuv0BK5SuxxYEYxykALi
         LMauKycONd/f0wO3lMy9Tbm7q3W9aKjYGFLkSYHoSFeIb7PEdhdinpqulCVTb7KqlJDN
         UiyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711494655; x=1712099455;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1nq0CgX8O+qGAyxnErUu1MNEqe8TDbvktuop+7fB/lw=;
        b=tWbf3ndWjg/+wReGixUxopIvU0zG4kPrc3rZD8r5y5ClLkwsyWOZ8dTmSPN8B9JzJI
         YdKQ+AdwZfDqHBWoWb72ZXvVEL9ypX143suOniAQKbBaMIAxzyf5i3BKauHAhTOjig2a
         YvdcX1TKjk/ItEAtVWJYSRnPsk8vXEpK7wItf5dWQ/uLElMyjb+W/4XBTR36BSkDMGot
         xCPIEWrJrTcv25rp6xnqX6bpQoUxRHgLr5Hy/0aLf9pzHnUXLeauW8zgNyevbk0HhXfj
         7TbeDLDHUZN+/OE+kGI7BWO+VMjXRnQTxD1NOCiZ+WZ3ay4kMg1Oy8YhXrDrsCHDrZOP
         zUqQ==
X-Forwarded-Encrypted: i=1; AJvYcCVKBhx8q2lGy+QBmfT/2YJYZGxkju3f+a4DQBDU7w91lhm2FO12oOUeu65qGuqCfGZsknPbNo4wr+9ObODN2y3SfnQtYKEJYlvWtkW1PqozwICbBepF07qfpxEUcdc4mx/er6nY3eKI
X-Gm-Message-State: AOJu0Yxk84bPQaUjH+TUdjw2ooSJHsnbD5A407qW0JCYw3F25e5j18l4
	TnEdQv/aV1XjRyoSdx8Mqw8w70ylXeIKVkGXtrFThg8bicyT0G37
X-Google-Smtp-Source: AGHT+IFz1qj2sC1j+AnSlwkNmcvkxUaU/LwyJQFNR/G/5LeLEEvOYaoFBN2Xl0uWB1ia2YNmk741Wg==
X-Received: by 2002:a05:6a20:3d22:b0:1a3:b0a8:fbe9 with SMTP id y34-20020a056a203d2200b001a3b0a8fbe9mr14465817pzi.1.1711494654787;
        Tue, 26 Mar 2024 16:10:54 -0700 (PDT)
Received: from fabio-Precision-3551.. ([2804:14c:485:4b61:ebca:2207:7ede:8032])
        by smtp.gmail.com with ESMTPSA id ks12-20020a170903084c00b001dedfba4c69sm7474505plb.134.2024.03.26.16.10.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Mar 2024 16:10:54 -0700 (PDT)
From: Fabio Estevam <festevam@gmail.com>
To: sakari.ailus@linux.intel.com
Cc: rmfrfs@gmail.com,
	robh@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org,
	linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	Fabio Estevam <festevam@denx.de>
Subject: [PATCH] media: dt-bindings: ovti,ov2680: Document clock/data-lanes
Date: Tue, 26 Mar 2024 20:10:33 -0300
Message-Id: <20240326231033.2048193-1-festevam@gmail.com>
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

Signed-off-by: Fabio Estevam <festevam@denx.de>
---
 .../bindings/media/i2c/ovti,ov2680.yaml       | 19 +++++++++++++++++--
 1 file changed, 17 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/media/i2c/ovti,ov2680.yaml b/Documentation/devicetree/bindings/media/i2c/ovti,ov2680.yaml
index cf456f8d9ddc..ae104da067e9 100644
--- a/Documentation/devicetree/bindings/media/i2c/ovti,ov2680.yaml
+++ b/Documentation/devicetree/bindings/media/i2c/ovti,ov2680.yaml
@@ -50,9 +50,22 @@ properties:
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
 
 required:
   - compatible
@@ -65,7 +78,7 @@ required:
   - reset-gpios
   - port
 
-additionalProperties: false
+unevaluatedProperties: false
 
 examples:
   - |
@@ -89,6 +102,8 @@ examples:
                 port {
                         ov2680_to_mipi: endpoint {
                                 remote-endpoint = <&mipi_from_sensor>;
+                                clock-lanes = <0>;
+                                data-lanes = <1>;
                         };
                 };
         };
-- 
2.34.1


