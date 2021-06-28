Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 102DF3B5C42
	for <lists+linux-media@lfdr.de>; Mon, 28 Jun 2021 12:12:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232855AbhF1KOc (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 28 Jun 2021 06:14:32 -0400
Received: from comms.puri.sm ([159.203.221.185]:37598 "EHLO comms.puri.sm"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232740AbhF1KO2 (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 28 Jun 2021 06:14:28 -0400
Received: from localhost (localhost [127.0.0.1])
        by comms.puri.sm (Postfix) with ESMTP id CFD84E016C;
        Mon, 28 Jun 2021 03:11:32 -0700 (PDT)
Received: from comms.puri.sm ([127.0.0.1])
        by localhost (comms.puri.sm [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id t3cMoY75fokm; Mon, 28 Jun 2021 03:11:31 -0700 (PDT)
From:   Martin Kepplinger <martin.kepplinger@puri.sm>
To:     martin.kepplinger@puri.sm, krzysztof.kozlowski@canonical.com,
        laurent.pinchart@ideasonboard.com
Cc:     devicetree@vger.kernel.org, kernel@puri.sm,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        mchehab@kernel.org, paul.kocialkowski@bootlin.com, pavel@ucw.cz,
        phone-devel@vger.kernel.org, robh@kernel.org, shawnx.tu@intel.com
Subject: [PATCH v6 5/5] arm64: defconfig: enable VIDEO_HI846
Date:   Mon, 28 Jun 2021 12:10:54 +0200
Message-Id: <20210628101054.828579-6-martin.kepplinger@puri.sm>
In-Reply-To: <20210628101054.828579-1-martin.kepplinger@puri.sm>
References: <20210628101054.828579-1-martin.kepplinger@puri.sm>
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Build the driver for the Hi-846 camera by default on arm64 where it's
going to be used on at least the imx8mq-librem5 board.

Signed-off-by: Martin Kepplinger <martin.kepplinger@puri.sm>
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index f423d08b9a71..bf27d9cfbdd5 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -666,6 +666,7 @@ CONFIG_VIDEO_RENESAS_VSP1=m
 CONFIG_VIDEO_QCOM_VENUS=m
 CONFIG_SDR_PLATFORM_DRIVERS=y
 CONFIG_VIDEO_RCAR_DRIF=m
+CONFIG_VIDEO_HI846=m
 CONFIG_VIDEO_IMX219=m
 CONFIG_VIDEO_OV5645=m
 CONFIG_VIDEO_QCOM_CAMSS=m
-- 
2.30.2

