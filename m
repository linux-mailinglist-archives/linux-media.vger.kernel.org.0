Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A6B032ED0FC
	for <lists+linux-media@lfdr.de>; Thu,  7 Jan 2021 14:43:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728550AbhAGNl6 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 7 Jan 2021 08:41:58 -0500
Received: from relay6-d.mail.gandi.net ([217.70.183.198]:57595 "EHLO
        relay6-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726441AbhAGNl6 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 7 Jan 2021 08:41:58 -0500
X-Originating-IP: 93.29.109.196
Received: from localhost.localdomain (196.109.29.93.rev.sfr.net [93.29.109.196])
        (Authenticated sender: paul.kocialkowski@bootlin.com)
        by relay6-d.mail.gandi.net (Postfix) with ESMTPSA id 54C7BC0011;
        Thu,  7 Jan 2021 13:41:15 +0000 (UTC)
From:   Paul Kocialkowski <paul.kocialkowski@bootlin.com>
To:     linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org
Cc:     Jacob Chen <jacob-chen@iotwrt.com>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Heiko Stuebner <heiko@sntech.de>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>
Subject: [PATCH 1/5] dt-bindings: media: rockchip-rga: Add PX30 compatible
Date:   Thu,  7 Jan 2021 14:40:57 +0100
Message-Id: <20210107134101.195426-2-paul.kocialkowski@bootlin.com>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <20210107134101.195426-1-paul.kocialkowski@bootlin.com>
References: <20210107134101.195426-1-paul.kocialkowski@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add a new compatible for the PX30 Rockchip SoC, which also features
a RGA block. It is compatible with the RK3288 RGA block.

Signed-off-by: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
---
 Documentation/devicetree/bindings/media/rockchip-rga.yaml | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/media/rockchip-rga.yaml b/Documentation/devicetree/bindings/media/rockchip-rga.yaml
index dd645ddccb07..4ffdb317b606 100644
--- a/Documentation/devicetree/bindings/media/rockchip-rga.yaml
+++ b/Documentation/devicetree/bindings/media/rockchip-rga.yaml
@@ -21,7 +21,9 @@ properties:
       - const: rockchip,rk3288-rga
       - const: rockchip,rk3399-rga
       - items:
-          - const: rockchip,rk3228-rga
+          - enum:
+            - rockchip,px30-rga
+            - rockchip,rk3228-rga
           - const: rockchip,rk3288-rga
 
   reg:
-- 
2.30.0

