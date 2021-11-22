Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AE1B84589D0
	for <lists+linux-media@lfdr.de>; Mon, 22 Nov 2021 08:27:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238799AbhKVHbA (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 22 Nov 2021 02:31:00 -0500
Received: from comms.puri.sm ([159.203.221.185]:59008 "EHLO comms.puri.sm"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S238805AbhKVHbA (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 22 Nov 2021 02:31:00 -0500
Received: from localhost (localhost [127.0.0.1])
        by comms.puri.sm (Postfix) with ESMTP id 62C79E1299;
        Sun, 21 Nov 2021 23:27:24 -0800 (PST)
Received: from comms.puri.sm ([127.0.0.1])
        by localhost (comms.puri.sm [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id 7HWBNtw-jnbd; Sun, 21 Nov 2021 23:27:23 -0800 (PST)
From:   Martin Kepplinger <martin.kepplinger@puri.sm>
To:     martin.kepplinger@puri.sm, laurent.pinchart@ideasonboard.com,
        mchehab@kernel.org, rmfrfs@gmail.com
Cc:     devicetree@vger.kernel.org, kernel@pengutronix.de, kernel@puri.sm,
        linux-arm-kernel@lists.infradead.org, linux-imx@nxp.com,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        robh@kernel.org, shawnguo@kernel.org
Subject: [PATCH v3 2/2] dt-bindings: media: document imx8mq support for imx7-csi
Date:   Mon, 22 Nov 2021 08:27:08 +0100
Message-Id: <20211122072708.95269-2-martin.kepplinger@puri.sm>
In-Reply-To: <20211122072708.95269-1-martin.kepplinger@puri.sm>
References: <20211122072708.95269-1-martin.kepplinger@puri.sm>
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

