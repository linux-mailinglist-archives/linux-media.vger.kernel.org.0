Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 446013B5E79
	for <lists+linux-media@lfdr.de>; Mon, 28 Jun 2021 14:55:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233043AbhF1M5k (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 28 Jun 2021 08:57:40 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:40986 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232984AbhF1M5a (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 28 Jun 2021 08:57:30 -0400
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: ezequiel)
        with ESMTPSA id A05C41F423EF
From:   Ezequiel Garcia <ezequiel@collabora.com>
To:     linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org
Cc:     Hans Verkuil <hverkuil@xs4all.nl>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Heiko Stuebner <heiko@sntech.de>,
        Alex Bee <knaerzche@gmail.com>, maccraft123mc@gmail.com,
        Chris Healy <cphealy@gmail.com>,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        Jernej Skrabec <jernej.skrabec@siol.net>,
        Jonas Karlman <jonas@kwiboo.se>,
        Nicolas Dufresne <nicolas.dufresne@collabora.com>,
        Kever Yang <kever.yang@rock-chips.com>, kernel@collabora.com,
        Ezequiel Garcia <ezequiel@collabora.com>
Subject: [PATCH v2 09/10] dt-bindings: media: rockchip-vpu: Add PX30 compatible
Date:   Mon, 28 Jun 2021 09:54:09 -0300
Message-Id: <20210628125410.9228-10-ezequiel@collabora.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210628125410.9228-1-ezequiel@collabora.com>
References: <20210628125410.9228-1-ezequiel@collabora.com>
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

