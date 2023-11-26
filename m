Return-Path: <linux-media+bounces-1039-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DDB47F92C1
	for <lists+linux-media@lfdr.de>; Sun, 26 Nov 2023 13:53:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 701E51C20B22
	for <lists+linux-media@lfdr.de>; Sun, 26 Nov 2023 12:53:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 631D9D2E3;
	Sun, 26 Nov 2023 12:53:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jXCt23zb"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-oo1-xc2c.google.com (mail-oo1-xc2c.google.com [IPv6:2607:f8b0:4864:20::c2c])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BEF52E5;
	Sun, 26 Nov 2023 04:53:38 -0800 (PST)
Received: by mail-oo1-xc2c.google.com with SMTP id 006d021491bc7-5841a3ffd50so145449eaf.1;
        Sun, 26 Nov 2023 04:53:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701003218; x=1701608018; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0ZSge5Qd7kK7MaDWVDt2Cxpm+zV58CtlfbMvSupdfs4=;
        b=jXCt23zbN2kSQ/hxf1j/WXWq0NmTMmUTdPTV5wo7nuBWu5jKDN0qG6++MyrbA8AIEW
         pR7JgCzg5rXMCyLtDeW0vzmdOF/uMsqGCY165HWPtV6x++G6rToIBuEuGjXfPE2CyATz
         ADdjPlMC6nedr3K5XhPthcyZOPpND/nbbolIX2d7SLNiJF3TJk0R3CdtPytwehl4U3/b
         7AXwcq6HdNiBmE9zdhLXd0n9GJUncYsShRj3S+A3W9hUkqMZVveWsL+uvmNDPbGHE+JF
         kU7PqQ3c5e4YY3SMcX46A0KreEzYGzOGIaRn1XAnyBDmcS86SmTdfauOkyXhai5Li1f+
         t0Qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701003218; x=1701608018;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0ZSge5Qd7kK7MaDWVDt2Cxpm+zV58CtlfbMvSupdfs4=;
        b=dyfBbad49M3SOxRv8tdxyG4fD6WiyxtxiEVNucKulolNUGzH5FiPiNAiWzNxvmdT3F
         nD/EtUfBBgL9ToMElo4vbYs5UoydhQiKwWOn0i+GIwrjDUdbJRr/l/zHiYd6ERBxogVH
         VKe3Dr9IFP0sPWCG9A4HODbJsWzjeIlRxgfLXhoL1TI+IPKKTorXbV+6pfvfTH0y+q9i
         LAoWU2rY/qAo2Mo3GA3ju7QbqWjXVu6lxem1JEW6NEsckVSgSJluxXnmlzH4GtiCe0/E
         IuruHhfrtx7ZTyz8N257D/XO94n3r1wB2FG9KPse0QtBMSsGjC63wR/NUgiwPoXhVAep
         g0lw==
X-Gm-Message-State: AOJu0YwKEWyBxEBrAlQP8hadyJ9ElyhKF3Mzc8BFcmm5iUYr/aPXxdNr
	D1f1idrO/1bX1G4+KJlLGHPNbtPY7h8=
X-Google-Smtp-Source: AGHT+IFF64jXD3SWra4V390SYEOPWIUY5lSXHadp/5Kyxo17ndaHNNhNWQZ2iIGeHKsbddpRiWQbkQ==
X-Received: by 2002:a05:6830:4909:b0:6d6:49ef:ef6f with SMTP id eq9-20020a056830490900b006d649efef6fmr11335063otb.0.1701003217998;
        Sun, 26 Nov 2023 04:53:37 -0800 (PST)
Received: from fabio-Precision-3551.. ([2804:14c:485:4b61:114f:aa2:522:14a4])
        by smtp.gmail.com with ESMTPSA id bh2-20020a056a02020200b0059d6f5196fasm5239847pgb.78.2023.11.26.04.53.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Nov 2023 04:53:37 -0800 (PST)
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
	Fabio Estevam <festevam@denx.de>
Subject: [PATCH 2/2] media: dt-bindings: Use bus-types definitions from video-interfaces.h
Date: Sun, 26 Nov 2023 09:53:20 -0300
Message-Id: <20231126125320.4024456-2-festevam@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231126125320.4024456-1-festevam@gmail.com>
References: <20231126125320.4024456-1-festevam@gmail.com>
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
---
 .../devicetree/bindings/display/bridge/analogix,anx7625.yaml  | 3 ++-
 .../devicetree/bindings/media/i2c/toshiba,tc358746.yaml       | 3 ++-
 Documentation/devicetree/bindings/media/microchip,csi2dc.yaml | 4 +++-
 .../devicetree/bindings/media/starfive,jh7110-camss.yaml      | 4 +++-
 .../devicetree/bindings/media/ti,j721e-csi2rx-shim.yaml       | 3 ++-
 5 files changed, 12 insertions(+), 5 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/bridge/analogix,anx7625.yaml b/Documentation/devicetree/bindings/display/bridge/analogix,anx7625.yaml
index a1ed1004651b..e18cc0e8a520 100644
--- a/Documentation/devicetree/bindings/display/bridge/analogix,anx7625.yaml
+++ b/Documentation/devicetree/bindings/display/bridge/analogix,anx7625.yaml
@@ -132,6 +132,7 @@ additionalProperties: false
 examples:
   - |
     #include <dt-bindings/gpio/gpio.h>
+    #include <dt-bindings/media/video-interfaces.h>
 
     i2c {
         #address-cells = <1>;
@@ -157,7 +158,7 @@ examples:
                     reg = <0>;
                     anx7625_in: endpoint {
                         remote-endpoint = <&mipi_dsi>;
-                        bus-type = <7>;
+                        bus-type = <MEDIA_BUS_TYPE_DPI>;
                         data-lanes = <0 1 2 3>;
                     };
                 };
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


