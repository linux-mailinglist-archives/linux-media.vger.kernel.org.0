Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1B32E1D42DB
	for <lists+linux-media@lfdr.de>; Fri, 15 May 2020 03:24:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728244AbgEOBYu (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 14 May 2020 21:24:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53084 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728209AbgEOBYu (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 14 May 2020 21:24:50 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B1EF7C05BD43;
        Thu, 14 May 2020 18:24:49 -0700 (PDT)
Received: from pendragon.bb.dnainternet.fi (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id A44FC9CE;
        Fri, 15 May 2020 03:24:45 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1589505885;
        bh=E/UttokHMJtXKmGkzjS1kpEfYwhwJBXkyZMdMyuv+oc=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=YFP6AhJs6hSKhQfic6c2VhiUOyIm68G0xrYxX/djDexs1QI/fHHzVKuIjY2/ZVAu/
         qK6PMTRPpUX9UGnSPiBfRejdCmiE3x6BsrtCTq9BpucYPc6X49HEUFrb6MKK4mRoYK
         71mYxyUAqj8EYHnKEZ5b/0MyTvPd4G1hF1Ktw9t0=
From:   Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To:     dri-devel@lists.freedesktop.org
Cc:     linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Rob Herring <robh+dt@kernel.org>
Subject: [PATCH 2/8] dt-bindings: media: renesas,fcp: Make power-domains mandatory
Date:   Fri, 15 May 2020 04:24:26 +0300
Message-Id: <20200515012432.31326-3-laurent.pinchart+renesas@ideasonboard.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200515012432.31326-1-laurent.pinchart+renesas@ideasonboard.com>
References: <20200515012432.31326-1-laurent.pinchart+renesas@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

All DT source files in the kernel tree specifyc the power-domains
property. Make it mandatory.

Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
 Documentation/devicetree/bindings/media/renesas,fcp.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/media/renesas,fcp.yaml b/Documentation/devicetree/bindings/media/renesas,fcp.yaml
index be085fb398fd..041c05467b46 100644
--- a/Documentation/devicetree/bindings/media/renesas,fcp.yaml
+++ b/Documentation/devicetree/bindings/media/renesas,fcp.yaml
@@ -38,6 +38,7 @@ required:
   - compatible
   - reg
   - clocks
+  - power-domains
 
 additionalProperties: false
 
-- 
Regards,

Laurent Pinchart

