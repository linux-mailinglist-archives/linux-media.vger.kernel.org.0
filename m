Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 91F871D42E2
	for <lists+linux-media@lfdr.de>; Fri, 15 May 2020 03:24:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728277AbgEOBYy (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 14 May 2020 21:24:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53098 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728272AbgEOBYw (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 14 May 2020 21:24:52 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8F08DC061A0C;
        Thu, 14 May 2020 18:24:52 -0700 (PDT)
Received: from pendragon.bb.dnainternet.fi (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 9CFCDA4F;
        Fri, 15 May 2020 03:24:47 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1589505887;
        bh=idy06uM6JXug0XSMozTyP8lOuGqiGAQ0bai/3HSKMvQ=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=d7ytcSFwhOGYuypAWviNvgF4QrIB5IMKlnfTElUZs/v6V7+fFOMmHKCvKXJRa26fQ
         Le43Vjzv3VJpEPfg4yp4U8fnrR1ViHLMurwgYimwrm688/+Du39BC9xbr9Dnrwr2dp
         7V4xyhyI+3fhFpOZmP9BvZj7n+HdRMC7bAg7e95s=
From:   Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To:     dri-devel@lists.freedesktop.org
Cc:     linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Rob Herring <robh+dt@kernel.org>
Subject: [PATCH 6/8] dt-bindings: media: renesas,fdp1: Add resets property
Date:   Fri, 15 May 2020 04:24:30 +0300
Message-Id: <20200515012432.31326-7-laurent.pinchart+renesas@ideasonboard.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200515012432.31326-1-laurent.pinchart+renesas@ideasonboard.com>
References: <20200515012432.31326-1-laurent.pinchart+renesas@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The resets property ise used in DT sources in the kernel tree. Document
it and make it mandatory.

Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
 Documentation/devicetree/bindings/media/renesas,fdp1.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/renesas,fdp1.yaml b/Documentation/devicetree/bindings/media/renesas,fdp1.yaml
index 39184bd21a27..2a27a7296fea 100644
--- a/Documentation/devicetree/bindings/media/renesas,fdp1.yaml
+++ b/Documentation/devicetree/bindings/media/renesas,fdp1.yaml
@@ -32,6 +32,9 @@ properties:
   power-domains:
     maxItems: 1
 
+  resets:
+    maxItems: 1
+
   renesas,fcp:
     $ref: /schemas/types.yaml#/definitions/phandle
     description:
@@ -44,6 +47,7 @@ required:
   - interrupts
   - clocks
   - power-domains
+  - resets
 
 additionalProperties: false
 
@@ -59,6 +63,7 @@ examples:
         interrupts = <GIC_SPI 262 IRQ_TYPE_LEVEL_HIGH>;
         clocks = <&cpg CPG_MOD 119>;
         power-domains = <&sysc R8A7795_PD_A3VP>;
+        resets = <&cpg 119>;
         renesas,fcp = <&fcpf0>;
     };
 ...
-- 
Regards,

Laurent Pinchart

