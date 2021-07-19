Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 542763CD6C4
	for <lists+linux-media@lfdr.de>; Mon, 19 Jul 2021 16:38:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241126AbhGSN5k (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 19 Jul 2021 09:57:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54636 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241099AbhGSN5k (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 19 Jul 2021 09:57:40 -0400
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6B2C7C061574;
        Mon, 19 Jul 2021 07:05:27 -0700 (PDT)
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: ezequiel)
        with ESMTPSA id A4C4E1F42C35
From:   Ezequiel Garcia <ezequiel@collabora.com>
To:     linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org,
        devicetree@vger.kernel.org
Cc:     Hans Verkuil <hverkuil@xs4all.nl>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Heiko Stuebner <heiko@sntech.de>,
        Alex Bee <knaerzche@gmail.com>, maccraft123mc@gmail.com,
        Chris Healy <cphealy@gmail.com>,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Rob Herring <robh+dt@kernel.org>,
        Nicolas Dufresne <nicolas.dufresne@collabora.com>,
        Kever Yang <kever.yang@rock-chips.com>, kernel@collabora.com,
        Ezequiel Garcia <ezequiel@collabora.com>
Subject: [PATCH RESEND v2 09/10] dt-bindings: media: rockchip-vpu: Add PX30 compatible
Date:   Mon, 19 Jul 2021 11:37:10 -0300
Message-Id: <20210719143711.55749-10-ezequiel@collabora.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210719143711.55749-1-ezequiel@collabora.com>
References: <20210719143711.55749-1-ezequiel@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Paul Kocialkowski <paul.kocialkowski@bootlin.com>

The Rockchip PX30 SoC has a Hantro VPU that features a decoder (VDPU2)
and an encoder (VEPU2).

Suggested-by: Alex Bee <knaerzche@gmail.com>
Signed-off-by: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
Signed-off-by: Ezequiel Garcia <ezequiel@collabora.com>
---
 Documentation/devicetree/bindings/media/rockchip-vpu.yaml | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/media/rockchip-vpu.yaml b/Documentation/devicetree/bindings/media/rockchip-vpu.yaml
index b88172a59de7..130d7a0604c5 100644
--- a/Documentation/devicetree/bindings/media/rockchip-vpu.yaml
+++ b/Documentation/devicetree/bindings/media/rockchip-vpu.yaml
@@ -26,7 +26,9 @@ properties:
           - const: rockchip,rk3188-vpu
           - const: rockchip,rk3066-vpu
       - items:
-          - const: rockchip,rk3228-vpu
+          - enum:
+              - rockchip,px30-vpu
+              - rockchip,rk3228-vpu
           - const: rockchip,rk3399-vpu
 
   reg:
-- 
2.32.0

