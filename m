Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9B3D1467BC2
	for <lists+linux-media@lfdr.de>; Fri,  3 Dec 2021 17:48:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1382174AbhLCQvz (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 3 Dec 2021 11:51:55 -0500
Received: from mail-ot1-f50.google.com ([209.85.210.50]:35499 "EHLO
        mail-ot1-f50.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230157AbhLCQvy (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 3 Dec 2021 11:51:54 -0500
Received: by mail-ot1-f50.google.com with SMTP id x43-20020a056830246b00b00570d09d34ebso4078700otr.2;
        Fri, 03 Dec 2021 08:48:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=DucIAiyImd6ScqgVL+tzXcRs+jXZnm74TimktL+13K0=;
        b=NxWVYJ/S3d9zsSBysrzOXbq4bk574im9MNJz7y34RYD8QouLOGAeZd2Vwvn0ruc1ou
         NtgDE11qd6uyRYNotr6yLtR1nG4fhejudw90Yfub4dOQE3Veoo4w2ncpbcV2fJr9nbPr
         bPgFSlW96MzuTER257RBV9kLPnF4rXiU1C8lS235QbPzOg7x4VW15Oj4AdIbs46SnDZ8
         ffafgbphshjHDv0f0CBSa1vVfyrzeOZ/uIAEP8HrYyq+jt6mVbjChGTWrfelYYvIpGjy
         2hHUHYd7Dd/a8wPAszyeP/p7whsY/v0/J/qF3Qdq4PU/R94/eMxY2z+H3JN0uEoc0bnr
         PpaA==
X-Gm-Message-State: AOAM530z9uYGElSjhNdRtZ991klqXmtFWiZGCkOpMcoZpaDL8iRwnr/U
        OYj01yZ924u//8kuorsfVw==
X-Google-Smtp-Source: ABdhPJwj2JQ7XI5sxmTvPRmdYr3Vbm+uClLekZEMV5SiLKpNu4homyPznWgikabFDjhZWM4kVAGxVA==
X-Received: by 2002:a9d:4e93:: with SMTP id v19mr17417398otk.146.1638550110362;
        Fri, 03 Dec 2021 08:48:30 -0800 (PST)
Received: from xps15.herring.priv (66-90-148-213.dyn.grandenetworks.net. [66.90.148.213])
        by smtp.googlemail.com with ESMTPSA id f12sm669328ote.75.2021.12.03.08.48.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Dec 2021 08:48:29 -0800 (PST)
From:   Rob Herring <robh@kernel.org>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     devicetree@vger.kernel.org, Rui Miguel Silva <rmfrfs@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [PATCH v2] dt-bindings: media: nxp,imx7-mipi-csi2: Drop bad if/then schema
Date:   Fri,  3 Dec 2021 10:48:28 -0600
Message-Id: <20211203164828.187642-1-robh@kernel.org>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The if/then schema for 'data-lanes' doesn't work as 'compatible' is at a
different level than 'data-lanes'. To make it work, the if/then schema
would have to be moved to the top level and then whole hierarchy of
nodes down to 'data-lanes' created. I don't think it is worth the
complexity to do that, so let's just drop it.

The error in this schema is masked by a fixup in the tools causing the
'allOf' to get overwritten. Removing the fixup as part of moving to
json-schema draft 2019-09 revealed the issue:

Documentation/devicetree/bindings/media/nxp,imx7-mipi-csi2.example.dt.yaml: mipi-csi@30750000: ports:port@0:endpoint:data-lanes:0: [1] is too short
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/media/nxp,imx7-mipi-csi2.yaml
Documentation/devicetree/bindings/media/nxp,imx7-mipi-csi2.example.dt.yaml: mipi-csi@32e30000: ports:port@0:endpoint:data-lanes:0: [1, 2, 3, 4] is too long
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/media/nxp,imx7-mipi-csi2.yaml

The if condition was always true because 'compatible' did not exist in
'endpoint' node and a non-existent property is true for json-schema.

Fixes: 85b62ff2cb97 ("media: dt-bindings: media: nxp,imx7-mipi-csi2: Add i.MX8MM support")
Cc: Rui Miguel Silva <rmfrfs@gmail.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Shawn Guo <shawnguo@kernel.org>
Cc: Sascha Hauer <s.hauer@pengutronix.de>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>
Cc: Fabio Estevam <festevam@gmail.com>
Cc: NXP Linux Team <linux-imx@nxp.com>
Cc: linux-media@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org
Signed-off-by: Rob Herring <robh@kernel.org>
---
v2:
 - Add note that imx7 only supports 2 lanes
---
 .../bindings/media/nxp,imx7-mipi-csi2.yaml         | 14 ++------------
 1 file changed, 2 insertions(+), 12 deletions(-)

diff --git a/Documentation/devicetree/bindings/media/nxp,imx7-mipi-csi2.yaml b/Documentation/devicetree/bindings/media/nxp,imx7-mipi-csi2.yaml
index 877183cf4278..1ef849dc74d7 100644
--- a/Documentation/devicetree/bindings/media/nxp,imx7-mipi-csi2.yaml
+++ b/Documentation/devicetree/bindings/media/nxp,imx7-mipi-csi2.yaml
@@ -79,6 +79,8 @@ properties:
 
             properties:
               data-lanes:
+                description:
+                  Note that 'fsl,imx7-mipi-csi2' only supports up to 2 data lines.
                 items:
                   minItems: 1
                   maxItems: 4
@@ -91,18 +93,6 @@ properties:
             required:
               - data-lanes
 
-            allOf:
-              - if:
-                  properties:
-                    compatible:
-                      contains:
-                        const: fsl,imx7-mipi-csi2
-                then:
-                  properties:
-                    data-lanes:
-                      items:
-                        maxItems: 2
-
       port@1:
         $ref: /schemas/graph.yaml#/properties/port
         description:
-- 
2.32.0

