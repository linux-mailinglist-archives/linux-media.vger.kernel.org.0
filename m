Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2D3CA3A3FF5
	for <lists+linux-media@lfdr.de>; Fri, 11 Jun 2021 12:15:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231721AbhFKKRP (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 11 Jun 2021 06:17:15 -0400
Received: from comms.puri.sm ([159.203.221.185]:51780 "EHLO comms.puri.sm"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230407AbhFKKRO (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Fri, 11 Jun 2021 06:17:14 -0400
Received: from localhost (localhost [127.0.0.1])
        by comms.puri.sm (Postfix) with ESMTP id A6062E0186;
        Fri, 11 Jun 2021 03:14:46 -0700 (PDT)
Received: from comms.puri.sm ([127.0.0.1])
        by localhost (comms.puri.sm [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id lRNvkGaTfasI; Fri, 11 Jun 2021 03:14:45 -0700 (PDT)
From:   Martin Kepplinger <martin.kepplinger@puri.sm>
To:     martin.kepplinger@puri.sm, krzysztof.kozlowski@canonical.com,
        laurent.pinchart@ideasonboard.com, mchehab@kernel.org,
        paul.kocialkowski@bootlin.com, pavel@ucw.cz
Cc:     devicetree@vger.kernel.org, kernel@puri.sm,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        phone-devel@vger.kernel.org, robh@kernel.org, shawnx.tu@intel.com
Subject: [PATCH v5 4/5] arm64: defconfig: enable VIDEO_HI846
Date:   Fri, 11 Jun 2021 12:14:03 +0200
Message-Id: <20210611101404.2553818-5-martin.kepplinger@puri.sm>
In-Reply-To: <20210611101404.2553818-1-martin.kepplinger@puri.sm>
References: <20210611101404.2553818-1-martin.kepplinger@puri.sm>
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

build the driver for the Hi-846 camera by default on arm64, where it's
going to be used on at least the imx8mq-librem5 board.

Signed-off-by: Martin Kepplinger <martin.kepplinger@puri.sm>
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 1f1cb5b0dfe0..3a838464d3c1 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -665,6 +665,7 @@ CONFIG_VIDEO_RENESAS_FCP=m
 CONFIG_VIDEO_RENESAS_VSP1=m
 CONFIG_SDR_PLATFORM_DRIVERS=y
 CONFIG_VIDEO_RCAR_DRIF=m
+CONFIG_VIDEO_HI846=m
 CONFIG_VIDEO_IMX219=m
 CONFIG_VIDEO_OV5645=m
 CONFIG_VIDEO_QCOM_CAMSS=m
-- 
2.30.2

