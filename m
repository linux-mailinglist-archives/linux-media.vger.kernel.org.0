Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9889D1D42D9
	for <lists+linux-media@lfdr.de>; Fri, 15 May 2020 03:24:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728230AbgEOBYu (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 14 May 2020 21:24:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53082 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727799AbgEOBYt (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 14 May 2020 21:24:49 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ACC71C061A0C;
        Thu, 14 May 2020 18:24:49 -0700 (PDT)
Received: from pendragon.bb.dnainternet.fi (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 3978C9D3;
        Fri, 15 May 2020 03:24:46 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1589505886;
        bh=68H8688PuZ554YOJAt+oXC0cWRE0EAHzcF1P96dMHlc=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=QfokATFfjsutpu8tNVdg3Cw23EAZHVjnMOzDkoDMsBxXZrja4+mn+7lEQBIutGqJV
         MHkabzfJLGxTAhB+UTmedCj4f8AoSM8cedeDOzj7fDnTHDQmxPjAnFa8SE8XEMKbA5
         XJfV72dHVMq0uZZMRGb6ep8MFmlE/pSooeVmyik8=
From:   Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To:     dri-devel@lists.freedesktop.org
Cc:     linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Rob Herring <robh+dt@kernel.org>
Subject: [PATCH 3/8] dt-bindings: media: renesas,fcp: Add resets and iommus properties
Date:   Fri, 15 May 2020 04:24:27 +0300
Message-Id: <20200515012432.31326-4-laurent.pinchart+renesas@ideasonboard.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200515012432.31326-1-laurent.pinchart+renesas@ideasonboard.com>
References: <20200515012432.31326-1-laurent.pinchart+renesas@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The resets and iommus properties are used in DT sources in the kernel
tree. Document them, and make resets mandatory. The iommus property is
optional as not all platforms wire the FCP to a functional IOMMU.

Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
 Documentation/devicetree/bindings/media/renesas,fcp.yaml | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/renesas,fcp.yaml b/Documentation/devicetree/bindings/media/renesas,fcp.yaml
index 041c05467b46..9f830bd95071 100644
--- a/Documentation/devicetree/bindings/media/renesas,fcp.yaml
+++ b/Documentation/devicetree/bindings/media/renesas,fcp.yaml
@@ -31,14 +31,21 @@ properties:
   clocks:
     maxItems: 1
 
+  iommus:
+    maxItems: 1
+
   power-domains:
     maxItems: 1
 
+  resets:
+    maxItems: 1
+
 required:
   - compatible
   - reg
   - clocks
   - power-domains
+  - resets
 
 additionalProperties: false
 
@@ -53,5 +60,7 @@ examples:
         reg = <0xfea2f000 0x200>;
         clocks = <&cpg CPG_MOD 602>;
         power-domains = <&sysc R8A7795_PD_ALWAYS_ON>;
+        resets = <&cpg 602>;
+        iommus = <&ipmmu_vi0 9>;
     };
 ...
-- 
Regards,

Laurent Pinchart

