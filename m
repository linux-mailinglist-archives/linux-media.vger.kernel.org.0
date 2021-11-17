Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 792154543B7
	for <lists+linux-media@lfdr.de>; Wed, 17 Nov 2021 10:28:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235165AbhKQJak (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 17 Nov 2021 04:30:40 -0500
Received: from comms.puri.sm ([159.203.221.185]:51406 "EHLO comms.puri.sm"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235107AbhKQJad (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 17 Nov 2021 04:30:33 -0500
Received: from localhost (localhost [127.0.0.1])
        by comms.puri.sm (Postfix) with ESMTP id 5B7B5DF734;
        Wed, 17 Nov 2021 01:27:35 -0800 (PST)
Received: from comms.puri.sm ([127.0.0.1])
        by localhost (comms.puri.sm [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id Oa6fksCSCQFO; Wed, 17 Nov 2021 01:27:34 -0800 (PST)
From:   Martin Kepplinger <martin.kepplinger@puri.sm>
To:     rmfrfs@gmail.com, laurent.pinchart@ideasonboard.com,
        mchehab@kernel.org, robh@kernel.org, shawnguo@kernel.org
Cc:     kernel@pengutronix.de, kernel@puri.sm, linux-imx@nxp.com,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Martin Kepplinger <martin.kepplinger@puri.sm>
Subject: [PATCH 2/2] dt-bindings: media: document imx8mq support for imx7-csi
Date:   Wed, 17 Nov 2021 10:27:10 +0100
Message-Id: <20211117092710.3084034-2-martin.kepplinger@puri.sm>
In-Reply-To: <20211117092710.3084034-1-martin.kepplinger@puri.sm>
References: <20211117092710.3084034-1-martin.kepplinger@puri.sm>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add the fsl,imx8mq-csi compatible string to the bindings for nxp,imx7-csi
since the driver explicitly handles that now.

Signed-off-by: Martin Kepplinger <martin.kepplinger@puri.sm>
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

