Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 888BD4554D8
	for <lists+linux-media@lfdr.de>; Thu, 18 Nov 2021 07:35:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243407AbhKRGh5 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 18 Nov 2021 01:37:57 -0500
Received: from comms.puri.sm ([159.203.221.185]:44238 "EHLO comms.puri.sm"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S242471AbhKRGh4 (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 18 Nov 2021 01:37:56 -0500
Received: from localhost (localhost [127.0.0.1])
        by comms.puri.sm (Postfix) with ESMTP id AE80ADF722;
        Wed, 17 Nov 2021 22:34:26 -0800 (PST)
Received: from comms.puri.sm ([127.0.0.1])
        by localhost (comms.puri.sm [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id lI4L4XnOkeEm; Wed, 17 Nov 2021 22:34:26 -0800 (PST)
From:   Martin Kepplinger <martin.kepplinger@puri.sm>
To:     martin.kepplinger@puri.sm, laurent.pinchart@ideasonboard.com,
        mchehab@kernel.org
Cc:     devicetree@vger.kernel.org, kernel@pengutronix.de, kernel@puri.sm,
        linux-arm-kernel@lists.infradead.org, linux-imx@nxp.com,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        rmfrfs@gmail.com, robh@kernel.org, shawnguo@kernel.org
Subject: [PATCH v2 2/2] dt-bindings: media: document imx8mq support for imx7-csi
Date:   Thu, 18 Nov 2021 07:33:47 +0100
Message-Id: <20211118063347.3370678-2-martin.kepplinger@puri.sm>
In-Reply-To: <20211118063347.3370678-1-martin.kepplinger@puri.sm>
References: <20211118063347.3370678-1-martin.kepplinger@puri.sm>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add the fsl,imx8mq-csi compatible string to the bindings for nxp,imx7-csi.
The i.MX8MQ SoC contains the same CSI bridge controller as the i.MX7.

Signed-off-by: Martin Kepplinger <martin.kepplinger@puri.sm>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 Documentation/devicetree/bindings/media/nxp,imx7-csi.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/media/nxp,imx7-csi.yaml b/Documentation/devicetree/bindings/media/nxp,imx7-csi.yaml
index 5922a2795167..4f7b78265336 100644
--- a/Documentation/devicetree/bindings/media/nxp,imx7-csi.yaml
+++ b/Documentation/devicetree/bindings/media/nxp,imx7-csi.yaml
@@ -17,6 +17,7 @@ properties:
   compatible:
     oneOf:
       - enum:
+          - fsl,imx8mq-csi
           - fsl,imx7-csi
           - fsl,imx6ul-csi
       - items:
-- 
2.30.2

