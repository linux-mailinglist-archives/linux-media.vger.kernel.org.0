Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 618C7465C29
	for <lists+linux-media@lfdr.de>; Thu,  2 Dec 2021 03:30:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1349125AbhLBCdq (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 1 Dec 2021 21:33:46 -0500
Received: from mail-oi1-f173.google.com ([209.85.167.173]:41867 "EHLO
        mail-oi1-f173.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1348605AbhLBCdp (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 1 Dec 2021 21:33:45 -0500
Received: by mail-oi1-f173.google.com with SMTP id u74so52629997oie.8;
        Wed, 01 Dec 2021 18:30:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=gi030Sz79EGCWfzgxZd89p5s7ym6D5RDx9CccXqOS1k=;
        b=ARXRWmWQeaMCHAb6wcmxdf3FXev+aQfW60eGV9wUjFLJVUHHCp6qPirEiAc1/s3CrF
         2AuF633pQyeTj3AfUfZIXFVHToHyardd8Hc8O9iR9Tn8FU2IB7uPuBrEh0igLJJSe8td
         96FgmvNMtQgeUlv9UJD4W99EIp/TPBIiC9a/Gc4lLd/SlGKMKixsxT+AwcWRr0iAI1j2
         5CATnpI/5UQXf4ugsDcfr0LwVdEUdH4oclrON/CMwAYcGiYHdkgGElMO3nfn9Evmtvbm
         NUaFDxl0WnQ3QRK9ITt2aZxXGCXNiFldNRGA6/oRZ1LmI8mJYf6DS4nN5Y6MfOsmF4jL
         rGwg==
X-Gm-Message-State: AOAM5304Oit1b9yL9nxY/5AI7EMV3bLroWez3C01HZCAyAiCHYgyRRP0
        JEN+AHcNM507PHlouJSWrw==
X-Google-Smtp-Source: ABdhPJxXenqPM9jZB3dQkUM/t/9CdZXodiyKwmXMhSBogi3mdk56qxLWS+QuipYs5HEzrH34AOK/Lg==
X-Received: by 2002:a05:6808:10d0:: with SMTP id s16mr2232422ois.0.1638412223104;
        Wed, 01 Dec 2021 18:30:23 -0800 (PST)
Received: from xps15.herring.priv (66-90-148-213.dyn.grandenetworks.net. [66.90.148.213])
        by smtp.googlemail.com with ESMTPSA id w80sm702862oif.2.2021.12.01.18.30.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Dec 2021 18:30:22 -0800 (PST)
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
Subject: [PATCH] dt-bindings: media: nxp,imx7-mipi-csi2: Drop bad if/then schema
Date:   Wed,  1 Dec 2021 20:30:21 -0600
Message-Id: <20211202023021.3655384-1-robh@kernel.org>
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
 .../bindings/media/nxp,imx7-mipi-csi2.yaml           | 12 ------------
 1 file changed, 12 deletions(-)

diff --git a/Documentation/devicetree/bindings/media/nxp,imx7-mipi-csi2.yaml b/Documentation/devicetree/bindings/media/nxp,imx7-mipi-csi2.yaml
index 877183cf4278..cb8d2afe52f7 100644
--- a/Documentation/devicetree/bindings/media/nxp,imx7-mipi-csi2.yaml
+++ b/Documentation/devicetree/bindings/media/nxp,imx7-mipi-csi2.yaml
@@ -91,18 +91,6 @@ properties:
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

