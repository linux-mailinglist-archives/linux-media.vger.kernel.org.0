Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D32F62027BC
	for <lists+linux-media@lfdr.de>; Sun, 21 Jun 2020 02:48:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729117AbgFUAsM (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 20 Jun 2020 20:48:12 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:60982 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728901AbgFUAsJ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 20 Jun 2020 20:48:09 -0400
Received: from pendragon.bb.dnainternet.fi (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 9127711C5;
        Sun, 21 Jun 2020 02:48:04 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1592700484;
        bh=yJ+c7T2CuhBRuvZB1ywhcgNTxXFDy151itPJiOeQcxw=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=b8BKcU1amCqzDFt1h5+kGUQCoiEwgBwWHnGfD5qXEVlEJhlJbHoiLA9g4stKvlPlc
         6z7e8dMBLG42ckPg2cHZ/Lrh6tCTebrZu/dCNadcJ9pY4UrfTTtIS9ts9Bbsf2f+MK
         xv1O8CqCBTKRSOj+5u7ZPJ8W2aCbAMaGIWj0lfGY=
From:   Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To:     dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org
Cc:     devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Rob Herring <robh+dt@kernel.org>
Subject: [PATCH v2 5/8] dt-bindings: media: renesas,fdp1: Make power-domains mandatory
Date:   Sun, 21 Jun 2020 03:47:31 +0300
Message-Id: <20200621004734.28602-6-laurent.pinchart+renesas@ideasonboard.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200621004734.28602-1-laurent.pinchart+renesas@ideasonboard.com>
References: <20200621004734.28602-1-laurent.pinchart+renesas@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

All DT source files in the kernel tree specify the power-domains
property. Make it mandatory.

Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
Changes since v1:

- Fix typo in comment message
---
 Documentation/devicetree/bindings/media/renesas,fdp1.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/media/renesas,fdp1.yaml b/Documentation/devicetree/bindings/media/renesas,fdp1.yaml
index f4db96a1f53c..39184bd21a27 100644
--- a/Documentation/devicetree/bindings/media/renesas,fdp1.yaml
+++ b/Documentation/devicetree/bindings/media/renesas,fdp1.yaml
@@ -43,6 +43,7 @@ required:
   - reg
   - interrupts
   - clocks
+  - power-domains
 
 additionalProperties: false
 
-- 
Regards,

Laurent Pinchart

