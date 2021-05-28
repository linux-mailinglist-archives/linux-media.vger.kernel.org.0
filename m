Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BFBF3393E8D
	for <lists+linux-media@lfdr.de>; Fri, 28 May 2021 10:14:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236260AbhE1IQL (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 28 May 2021 04:16:11 -0400
Received: from comms.puri.sm ([159.203.221.185]:41296 "EHLO comms.puri.sm"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S236206AbhE1IQI (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Fri, 28 May 2021 04:16:08 -0400
Received: from localhost (localhost [127.0.0.1])
        by comms.puri.sm (Postfix) with ESMTP id 3114CE3C0C;
        Fri, 28 May 2021 01:14:33 -0700 (PDT)
Received: from comms.puri.sm ([127.0.0.1])
        by localhost (comms.puri.sm [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id Rd_lSgGvztdn; Fri, 28 May 2021 01:14:32 -0700 (PDT)
From:   Martin Kepplinger <martin.kepplinger@puri.sm>
To:     laurent.pinchart@ideasonboard.com, mchehab@kernel.org
Cc:     devicetree@vger.kernel.org, kernel@puri.sm,
        krzysztof.kozlowski@canonical.com, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, paul.kocialkowski@bootlin.com,
        robh@kernel.org, shawnx.tu@intel.com,
        Martin Kepplinger <martin.kepplinger@puri.sm>
Subject: [PATCH v2 4/5] arm64: defconfig: enable VIDEO_HI846
Date:   Fri, 28 May 2021 10:13:35 +0200
Message-Id: <20210528081336.3858700-5-martin.kepplinger@puri.sm>
In-Reply-To: <20210528081336.3858700-1-martin.kepplinger@puri.sm>
References: <20210528081336.3858700-1-martin.kepplinger@puri.sm>
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
index 08c6f769df9a..3a5238c1f3b3 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -664,6 +664,7 @@ CONFIG_VIDEO_RENESAS_FCP=m
 CONFIG_VIDEO_RENESAS_VSP1=m
 CONFIG_SDR_PLATFORM_DRIVERS=y
 CONFIG_VIDEO_RCAR_DRIF=m
+CONFIG_VIDEO_HI846=m
 CONFIG_VIDEO_IMX219=m
 CONFIG_VIDEO_OV5645=m
 CONFIG_VIDEO_QCOM_CAMSS=m
-- 
2.30.2

