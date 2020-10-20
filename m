Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 679A629433C
	for <lists+linux-media@lfdr.de>; Tue, 20 Oct 2020 21:39:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2409061AbgJTTjX (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 20 Oct 2020 15:39:23 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:44886 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2404632AbgJTTjW (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 20 Oct 2020 15:39:22 -0400
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: koike)
        with ESMTPSA id 718431F44DB5
From:   Helen Koike <helen.koike@collabora.com>
To:     linux-media@vger.kernel.org
Cc:     devicetree@vger.kernel.org, linux-rockchip@lists.infradead.org,
        linux-kernel@vger.kernel.org, devel@driverdev.osuosl.org,
        robh+dt@kernel.org, heiko@sntech.de, kernel@collabora.com,
        hverkuil-cisco@xs4all.nl, dafna.hirschfeld@collabora.com,
        mark.rutland@arm.com, karthik.poduval@gmail.com,
        eddie.cai.linux@gmail.com, jbx6244@gmail.com,
        zhengsq@rock-chips.com, robin.murphy@arm.com
Subject: [PATCH v6 4/9] media: staging: dt-bindings: rkisp1: drop parent unit address
Date:   Tue, 20 Oct 2020 16:38:45 -0300
Message-Id: <20201020193850.1460644-5-helen.koike@collabora.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201020193850.1460644-1-helen.koike@collabora.com>
References: <20201020193850.1460644-1-helen.koike@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Fix the following error found with make ARCH=arm64 dt_binding_check:

Documentation/devicetree/bindings/media/rockchip-isp1.example.dts:24.27-101.11:
Warning (unit_address_vs_reg): /example-0/parent@0: node has a unit name, but no reg or ranges property

Reported-by: Johan Jonker <jbx6244@gmail.com>
Signed-off-by: Helen Koike <helen.koike@collabora.com>
Acked-by: Rob Herring <robh@kernel.org>
Reviewed-by: Tomasz Figa <tfiga@chromium.org>
---
 .../Documentation/devicetree/bindings/media/rockchip-isp1.yaml  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/media/rkisp1/Documentation/devicetree/bindings/media/rockchip-isp1.yaml b/drivers/staging/media/rkisp1/Documentation/devicetree/bindings/media/rockchip-isp1.yaml
index 79ebacab83cf3..62a6b9c959498 100644
--- a/drivers/staging/media/rkisp1/Documentation/devicetree/bindings/media/rockchip-isp1.yaml
+++ b/drivers/staging/media/rkisp1/Documentation/devicetree/bindings/media/rockchip-isp1.yaml
@@ -125,7 +125,7 @@ examples:
     #include <dt-bindings/interrupt-controller/arm-gic.h>
     #include <dt-bindings/power/rk3399-power.h>
 
-    parent0: parent@0 {
+    parent0: parent {
         #address-cells = <2>;
         #size-cells = <2>;
 
-- 
2.28.0

