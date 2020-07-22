Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 942DC229C22
	for <lists+linux-media@lfdr.de>; Wed, 22 Jul 2020 17:56:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1733123AbgGVPzw (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 22 Jul 2020 11:55:52 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:35704 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1733113AbgGVPzw (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 22 Jul 2020 11:55:52 -0400
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: koike)
        with ESMTPSA id 5FABE2976FD
From:   Helen Koike <helen.koike@collabora.com>
To:     devicetree@vger.kernel.org, linux-media@vger.kernel.org,
        linux-rockchip@lists.infradead.org
Cc:     linux-kernel@vger.kernel.org, devel@driverdev.osuosl.org,
        robh+dt@kernel.org, heiko@sntech.de, hverkuil-cisco@xs4all.nl,
        kernel@collabora.com, dafna.hirschfeld@collabora.com,
        ezequiel@collabora.com, mark.rutland@arm.com,
        karthik.poduval@gmail.com, jbx6244@gmail.com, tfiga@chromium.org,
        eddie.cai.linux@gmail.com, zhengsq@rock-chips.com,
        robin.murphy@arm.com
Subject: [PATCH v5 1/9] media: staging: dt-bindings: rkisp1: add missing required nodes
Date:   Wed, 22 Jul 2020 12:55:25 -0300
Message-Id: <20200722155533.252844-2-helen.koike@collabora.com>
X-Mailer: git-send-email 2.28.0.rc1
In-Reply-To: <20200722155533.252844-1-helen.koike@collabora.com>
References: <20200722155533.252844-1-helen.koike@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add missing required nodes in json-schema yaml file for
Rockchip ISP1 dt-bindings.

Signed-off-by: Helen Koike <helen.koike@collabora.com>
Acked-by: Rob Herring <robh@kernel.org>
---

Changes in v2:
- New patch in the series
---
 .../devicetree/bindings/media/rockchip-isp1.yaml          | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/staging/media/rkisp1/Documentation/devicetree/bindings/media/rockchip-isp1.yaml b/drivers/staging/media/rkisp1/Documentation/devicetree/bindings/media/rockchip-isp1.yaml
index af246b71eac6b..a77b6ec500c95 100644
--- a/drivers/staging/media/rkisp1/Documentation/devicetree/bindings/media/rockchip-isp1.yaml
+++ b/drivers/staging/media/rkisp1/Documentation/devicetree/bindings/media/rockchip-isp1.yaml
@@ -94,11 +94,19 @@ properties:
 
               remote-endpoint: true
 
+        required:
+          - reg
+          - "#address-cells"
+          - "#size-cells"
+
     required:
+      - "#address-cells"
+      - "#size-cells"
       - port@0
 
 required:
   - compatible
+  - reg
   - interrupts
   - clocks
   - clock-names
-- 
2.28.0.rc1

