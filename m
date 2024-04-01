Return-Path: <linux-media+bounces-8310-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C5068894531
	for <lists+linux-media@lfdr.de>; Mon,  1 Apr 2024 21:05:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 026041C21942
	for <lists+linux-media@lfdr.de>; Mon,  1 Apr 2024 19:05:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 05830524B8;
	Mon,  1 Apr 2024 19:05:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ee6yWxd6"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 029A542056;
	Mon,  1 Apr 2024 19:05:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711998317; cv=none; b=XY+VgGfE7pSLUthD7f+rUKX68qo0cmsWOiHm2Hr92NJ8uDLgiyQVJcwSwQBc4hXXZdZFlpbnVitIUrpPa3SgCDJx/vP3JOsahabKSEy7h2eA0xRBastM5jaUkg7R7MuzkGA7/YnEoWOVzcEA7Ktl5T8zPeDHxuub/wpx0kTehsk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711998317; c=relaxed/simple;
	bh=+XWJd1bhwKxzKzaOcGtEQd0pvgQjznCPHF9HOwPXbnE=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=XHLlxjzHSu7wIgTc5iaVZ2hfnZYq4kfU6IS0IoxFyAzkxVU/k5R3zQN2nOvKUD06IPhanS9x0GsfIM5YsMZAdqNVXA6PksfgC/kbiBGRMvXuubj0pgBixPOEn3jSa60GN7Et8FG372pCuDaSygOdsB/WlZZzacTm/ThjctYl7vs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ee6yWxd6; arc=none smtp.client-ip=209.85.216.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-2a1f8308532so1118841a91.1;
        Mon, 01 Apr 2024 12:05:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1711998315; x=1712603115; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=SKNknUsjYFnDupFH8suX/KPJglcBLz4PZF0b49s9YRk=;
        b=ee6yWxd6A/JwbUXFoSDC0nrYgXmQVTzfkCamJCSkVZi98ljLjtA3zs9h+IMBOx23J1
         0DavB2ocKNykHmckrO2s1LZBXxoP0JtLV9XsqYk2RhM9FxWKh70G4NYvxNdJ4nUx3tC8
         MCYt56m5CRuiutJT1UNP1OOImmT5RphukCoS6qSKC+GKq9g43kPV7jNGFEC3D46lc0jv
         7hq+CamPOwoXBci9vZZR/+mWBhPYWKZCIjqT6DEO5Ej4Ve0T9rv3bHgkR9uyn4lkkQF/
         ItBuevRLm8FqsK4HUu4rkcnGwxQVVDYEU3z6RgMIWzBGbAUzr+ukXkZjXMFiI9F+1+Od
         Bzfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711998315; x=1712603115;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SKNknUsjYFnDupFH8suX/KPJglcBLz4PZF0b49s9YRk=;
        b=eZpkpepeh5LvsxPACA1XncPWz9uOJ9dxhjgLcNCsDTIT8ouVXzZ02wIgMI8xaLIMB3
         CbEEoHK40h0y6TC0OS/iYbwZAowu8wZfynQeNPqjPU8i+024Zog5c4r6GjndRkqVJzWD
         enLqSTbueSod8LfcuYTRIDZamkjnKCJIyYLuFjAU3VX459Pm3TfnVkyUnjlyZw8SCaEw
         94mtIA6SyNOFOdmcY/QMsOZ/pRugW+0z56iiNOHtHR5Af7mY2Cb95HTu8MEEBjidFVAq
         U3kr6SQpcfmZNOqshanx5IYAKvMhEM3sG8HHOd+ukQNC7rrRbxaU1VvK3nrtb69Y+7QC
         QaKA==
X-Forwarded-Encrypted: i=1; AJvYcCUL+XVypxKeOojt+uKldZcveEu5c2GPJPFlR84XO4eZDZrK/u3fATFHfuQrtOlWJ0AYw/3cJFQ1iiiZwTl84ucOZ+sWHI9ua4MT8cqOHIzLSRzjcPPWyNLtJ4Abfl+48jJ0VuyMsfHq
X-Gm-Message-State: AOJu0YyAz8uXGC4ON8isw8Ih/jFJKbajL85TrBzzJ6lSaZRhoPHFVPxJ
	aSo3wB5J5kmdbClmBPOOvcNSBVRPQKO3CeWw6TgxQckJcDqKQADb
X-Google-Smtp-Source: AGHT+IGDYwYJAw6UVTWdc+oYoyqEHxhrSD8q1vgSvF1w2Rj4jy9W8rq0Zt+2wVgWNlBR/a+Rt+9Dzw==
X-Received: by 2002:a17:90a:f0ce:b0:2a2:2ee9:beb8 with SMTP id fa14-20020a17090af0ce00b002a22ee9beb8mr6032627pjb.4.1711998315227;
        Mon, 01 Apr 2024 12:05:15 -0700 (PDT)
Received: from fabio-Precision-3551.. ([2804:14c:485:4b61:a943:2baf:4369:df34])
        by smtp.gmail.com with ESMTPSA id u13-20020a17090a890d00b002a056551c1dsm8122836pjn.6.2024.04.01.12.05.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Apr 2024 12:05:14 -0700 (PDT)
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
Subject: [PATCH v3] media: dt-bindings: ovti,ov2680: Document more properties
Date: Mon,  1 Apr 2024 16:05:06 -0300
Message-Id: <20240401190506.3238885-1-festevam@gmail.com>
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
Changes since v2:
- Use additionalProperties: false (Laurent).
- Mark link-frequencies as mandatory. (Laurent).

 .../bindings/media/i2c/ovti,ov2680.yaml       | 25 ++++++++++++++++++-
 1 file changed, 24 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/media/i2c/ovti,ov2680.yaml b/Documentation/devicetree/bindings/media/i2c/ovti,ov2680.yaml
index cf456f8d9ddc..6ae7d4457536 100644
--- a/Documentation/devicetree/bindings/media/i2c/ovti,ov2680.yaml
+++ b/Documentation/devicetree/bindings/media/i2c/ovti,ov2680.yaml
@@ -50,9 +50,29 @@ properties:
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
+        additionalProperties: false
+
+        properties:
+          clock-lanes:
+            const: 0
+
+          data-lanes:
+            const: 1
+
+          link-frequencies: true
+
+          remote-endpoint: true
+
+        required:
+          - link-frequencies
 
 required:
   - compatible
@@ -89,6 +109,9 @@ examples:
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


