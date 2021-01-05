Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A93532EAED6
	for <lists+linux-media@lfdr.de>; Tue,  5 Jan 2021 16:41:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727987AbhAEPiq (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 5 Jan 2021 10:38:46 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:38190 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726957AbhAEPiq (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 5 Jan 2021 10:38:46 -0500
Received: from pendragon.lan (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 9239F1BEF;
        Tue,  5 Jan 2021 16:30:16 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1609860617;
        bh=QijKmJDIjOo7MKVny8M7NUeZo6zYDFwqShZIVrpphus=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=G3nTtbEb4p+HJQEX16g6HeL+Qv+xBUbsrb/FecMQUZPlAtrNMOp9HPm4/vrviJDoN
         lAR5dUBe+jhxZmURhMHyS4L8e5/MuU9Tdlh3Y91cKWxbMLR0ts3IGwZC0jtgvFeU7f
         xaUEUJ+rp1k6LRthMjNRBQj+JUQETJRJWGO3ycPg=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Rui Miguel Silva <rmfrfs@gmail.com>,
        Steve Longerbeam <slongerbeam@gmail.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org
Subject: [PATCH 59/75] dt-bindings: media: fsl,imx7-mipi-csi2: Drop fsl,csis-hs-settle property
Date:   Tue,  5 Jan 2021 17:28:36 +0200
Message-Id: <20210105152852.5733-60-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210105152852.5733-1-laurent.pinchart@ideasonboard.com>
References: <20210105152852.5733-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The fsl,csis-hs-settle property isn't used by the driver anymore. Drop
it.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 .../devicetree/bindings/media/fsl,imx7-mipi-csi2.yaml         | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/media/fsl,imx7-mipi-csi2.yaml b/Documentation/devicetree/bindings/media/fsl,imx7-mipi-csi2.yaml
index d8918ba3b06c..656aac67470d 100644
--- a/Documentation/devicetree/bindings/media/fsl,imx7-mipi-csi2.yaml
+++ b/Documentation/devicetree/bindings/media/fsl,imx7-mipi-csi2.yaml
@@ -54,10 +54,6 @@ properties:
     description: The desired external clock ("wrap") frequency, in Hz
     default: 166000000
 
-  fsl,csis-hs-settle:
-    $ref: /schemas/types.yaml#/definitions/uint32
-    description: HS-SETTLE time (unit unknown)
-
   ports:
     # See ./video-interfaces.txt for details
     type: object
-- 
Regards,

Laurent Pinchart

