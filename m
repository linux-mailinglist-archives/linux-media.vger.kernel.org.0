Return-Path: <linux-media+bounces-1472-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 761E1800B2B
	for <lists+linux-media@lfdr.de>; Fri,  1 Dec 2023 13:39:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2D107281AD5
	for <lists+linux-media@lfdr.de>; Fri,  1 Dec 2023 12:39:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EA6D82554F;
	Fri,  1 Dec 2023 12:39:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aOaDETCq"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pf1-x429.google.com (mail-pf1-x429.google.com [IPv6:2607:f8b0:4864:20::429])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1DD0A10F3;
	Fri,  1 Dec 2023 04:39:50 -0800 (PST)
Received: by mail-pf1-x429.google.com with SMTP id d2e1a72fcca58-6cdf3e99621so247928b3a.1;
        Fri, 01 Dec 2023 04:39:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701434389; x=1702039189; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wVhdtrkUn2AWvsFn46L+3lHiIxpAFrjoE7AYtpk3MlE=;
        b=aOaDETCqDeWTpRSIkS03A7oodhHq5pcVYLECs5YoBGYC2lIH49Z2a0l0LpHTeOnN0N
         MVgt/kO1Wc9XPXtNgv4EdRZwqtMYGO5E1PuOfbyH1Lko7ulRb1cVAAeMkoN37Pc4WkyR
         krl4SoKJfHbzrlOKIrzTMA0CFcQuv+qZrZHeVQ/a3kw+ufaUHKMfGmZMJsonuq9vfoVy
         Ui/3GGnnzXH5Saaa+3zoVLeyIIeIF9wtL5d14MScWc1L9nkXTOI0XEW59522bxGmIw6Y
         8salxMcGASbd5zbitxWMz4wg4+450NSoUab3jtDolMb646dm4aJWIshSo9TOrbCEIIqg
         E0DA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701434389; x=1702039189;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wVhdtrkUn2AWvsFn46L+3lHiIxpAFrjoE7AYtpk3MlE=;
        b=Ju7WSLNNxussHxihMHnExtU6NkhLi19qdvB7Km9ljW9WSE0x5OB2TqtKLT1G/U0vB1
         06gIXvR/TI4xTGcduTgOmAtWnJ7CRslGR2X7Q99y9HFB3qRk5JkbA8ZZJdL0hyMWzzaf
         21sK/7pfQ/2CoIy5vTZiM/I6t49FfRUUtUxoTWiAaz9c4DJJZuBIvXQ2UOK5W9NZMLY7
         A0mf9kPHoXQfL3/S7p0MIXm3fndaVJBXowskqGds3UnsakNcpHv3diD6o1K1JyyvHHL9
         v5rBED/oQ8hqaHTJW+1JtUReM9JsFNLGhxojsQoEfpIbTW3VGzmvxQsSOXIsbgTE+nmV
         zU0A==
X-Gm-Message-State: AOJu0YyC3ZcyrgKU5YYd0o+OWfFjwNbDcX6TcDzB0Ix/PXQ1exXx+hXS
	43AjQyYylCHh29DRr9ymHrY=
X-Google-Smtp-Source: AGHT+IE0RXbrdr6CPHISFNq2fFCJ45gZLWw9n9RllgvUlBIm0O5HaryEB0sRvxn1VvpnIjhk2a2tPg==
X-Received: by 2002:a05:6a20:3d1e:b0:18b:1f5d:b105 with SMTP id y30-20020a056a203d1e00b0018b1f5db105mr30024826pzi.6.1701434389441;
        Fri, 01 Dec 2023 04:39:49 -0800 (PST)
Received: from fabio-Precision-3551.. ([2804:14c:485:4b61:12b3:b1c7:121e:c465])
        by smtp.gmail.com with ESMTPSA id gx21-20020a056a001e1500b006930db1e6cfsm2896155pfb.62.2023.12.01.04.39.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Dec 2023 04:39:48 -0800 (PST)
From: Fabio Estevam <festevam@gmail.com>
To: sakari.ailus@linux.intel.com
Cc: rfoss@kernel.org,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org,
	mchehab@kernel.org,
	laurent.pinchart@ideasonboard.com,
	devicetree@vger.kernel.org,
	linux-media@vger.kernel.org,
	xji@analogixsemi.com,
	Fabio Estevam <festevam@denx.de>,
	Rob Herring <robh@kernel.org>
Subject: [PATCH v2 3/3] media: dt-bindings: Use bus-types definitions from video-interfaces.h
Date: Fri,  1 Dec 2023 09:39:35 -0300
Message-Id: <20231201123935.1057929-3-festevam@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231201123935.1057929-1-festevam@gmail.com>
References: <20231201123935.1057929-1-festevam@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Fabio Estevam <festevam@denx.de>

To improve readability, replace hardcoding numerical constants with the
corresponding definitions from video-interfaces.h.

Based on commit c4cfd47eb4ac ("media: dt-bindings: Use new video interface
bus type macros in examples").

Signed-off-by: Fabio Estevam <festevam@denx.de>
Reviewed-by: Rob Herring <robh@kernel.org>
---
Changes since v1:
- Removed the analogix,anx7625.yaml change.

 .../devicetree/bindings/display/bridge/analogix,anx7625.yaml  | 1 +
 .../devicetree/bindings/media/i2c/toshiba,tc358746.yaml       | 3 ++-
 Documentation/devicetree/bindings/media/microchip,csi2dc.yaml | 4 +++-
 .../devicetree/bindings/media/starfive,jh7110-camss.yaml      | 4 +++-
 .../devicetree/bindings/media/ti,j721e-csi2rx-shim.yaml       | 3 ++-
 5 files changed, 11 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/bridge/analogix,anx7625.yaml b/Documentation/devicetree/bindings/display/bridge/analogix,anx7625.yaml
index f043d57dd25a..19fbc6f67de8 100644
--- a/Documentation/devicetree/bindings/display/bridge/analogix,anx7625.yaml
+++ b/Documentation/devicetree/bindings/display/bridge/analogix,anx7625.yaml
@@ -132,6 +132,7 @@ additionalProperties: false
 examples:
   - |
     #include <dt-bindings/gpio/gpio.h>
+    #include <dt-bindings/media/video-interfaces.h>
 
     i2c {
         #address-cells = <1>;
diff --git a/Documentation/devicetree/bindings/media/i2c/toshiba,tc358746.yaml b/Documentation/devicetree/bindings/media/i2c/toshiba,tc358746.yaml
index 1c476b635b69..9e1874946017 100644
--- a/Documentation/devicetree/bindings/media/i2c/toshiba,tc358746.yaml
+++ b/Documentation/devicetree/bindings/media/i2c/toshiba,tc358746.yaml
@@ -129,6 +129,7 @@ additionalProperties: false
 examples:
   - |
     #include <dt-bindings/gpio/gpio.h>
+    #include <dt-bindings/media/video-interfaces.h>
 
     i2c {
       #address-cells = <1>;
@@ -161,7 +162,7 @@ examples:
               remote-endpoint = <&sensor_out>;
               hsync-active = <0>;
               vsync-active = <0>;
-              bus-type = <5>;
+              bus-type = <MEDIA_BUS_TYPE_PARALLEL>;
             };
           };
 
diff --git a/Documentation/devicetree/bindings/media/microchip,csi2dc.yaml b/Documentation/devicetree/bindings/media/microchip,csi2dc.yaml
index b3a345fc6464..2e694479d82d 100644
--- a/Documentation/devicetree/bindings/media/microchip,csi2dc.yaml
+++ b/Documentation/devicetree/bindings/media/microchip,csi2dc.yaml
@@ -142,6 +142,8 @@ examples:
   # Example for connecting to a parallel sensor controller block (video pipe)
   # and the input is received from Synopsys IDI interface
   - |
+    #include <dt-bindings/media/video-interfaces.h>
+
     csi2dc@e1404000 {
         compatible = "microchip,sama7g5-csi2dc";
         reg = <0xe1404000 0x500>;
@@ -154,7 +156,7 @@ examples:
                port@0 {
                        reg = <0>; /* must be 0, first child port */
                        csi2dc_in: endpoint { /* input from IDI interface */
-                               bus-type = <4>; /* MIPI CSI2 D-PHY */
+                               bus-type = <MEDIA_BUS_TYPE_CSI2_DPHY>;
                                remote-endpoint = <&csi2host_out>;
                        };
                };
diff --git a/Documentation/devicetree/bindings/media/starfive,jh7110-camss.yaml b/Documentation/devicetree/bindings/media/starfive,jh7110-camss.yaml
index c66586d90fa2..4964e59c3ae3 100644
--- a/Documentation/devicetree/bindings/media/starfive,jh7110-camss.yaml
+++ b/Documentation/devicetree/bindings/media/starfive,jh7110-camss.yaml
@@ -120,6 +120,8 @@ additionalProperties: false
 
 examples:
   - |
+    #include <dt-bindings/media/video-interfaces.h>
+
     isp@19840000 {
         compatible = "starfive,jh7110-camss";
         reg = <0x19840000 0x10000>,
@@ -161,7 +163,7 @@ examples:
                 reg = <0>;
                 vin_from_sc2235: endpoint {
                     remote-endpoint = <&sc2235_to_vin>;
-                    bus-type = <5>;
+                    bus-type = <MEDIA_BUS_TYPE_PARALLEL>;
                     bus-width = <8>;
                     data-shift = <2>;
                     hsync-active = <1>;
diff --git a/Documentation/devicetree/bindings/media/ti,j721e-csi2rx-shim.yaml b/Documentation/devicetree/bindings/media/ti,j721e-csi2rx-shim.yaml
index f762fdc05e4d..5fdb9ae758e3 100644
--- a/Documentation/devicetree/bindings/media/ti,j721e-csi2rx-shim.yaml
+++ b/Documentation/devicetree/bindings/media/ti,j721e-csi2rx-shim.yaml
@@ -58,6 +58,7 @@ additionalProperties: false
 
 examples:
   - |
+    #include <dt-bindings/media/video-interfaces.h>
     #include <dt-bindings/soc/ti,sci_pm_domain.h>
 
     ti_csi2rx0: ticsi2rx@4500000 {
@@ -90,7 +91,7 @@ examples:
 
                     csi2rx0_in_sensor: endpoint {
                         remote-endpoint = <&csi2_cam0>;
-                        bus-type = <4>; /* CSI2 DPHY. */
+                        bus-type = <MEDIA_BUS_TYPE_CSI2_DPHY>;
                         clock-lanes = <0>;
                         data-lanes = <1 2>;
                     };
-- 
2.34.1


