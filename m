Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 64A40395A17
	for <lists+linux-media@lfdr.de>; Mon, 31 May 2021 14:08:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231527AbhEaMJx (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 31 May 2021 08:09:53 -0400
Received: from comms.puri.sm ([159.203.221.185]:33446 "EHLO comms.puri.sm"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231468AbhEaMJu (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 31 May 2021 08:09:50 -0400
Received: from localhost (localhost [127.0.0.1])
        by comms.puri.sm (Postfix) with ESMTP id D915EE2132;
        Mon, 31 May 2021 05:08:10 -0700 (PDT)
Received: from comms.puri.sm ([127.0.0.1])
        by localhost (comms.puri.sm [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id M-9sntfYRLKR; Mon, 31 May 2021 05:08:10 -0700 (PDT)
From:   Martin Kepplinger <martin.kepplinger@puri.sm>
To:     pavel@ucw.cz, krzysztof.kozlowski@canonical.com,
        laurent.pinchart@ideasonboard.com, mchehab@kernel.org,
        paul.kocialkowski@bootlin.com, robh@kernel.org, shawnx.tu@intel.com
Cc:     devicetree@vger.kernel.org, kernel@puri.sm,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        martin.kepplinger@puri.sm, phone-devel@vger.kernel.org
Subject: [PATCH v3 4/5] arm64: defconfig: enable VIDEO_HI846
Date:   Mon, 31 May 2021 14:07:36 +0200
Message-Id: <20210531120737.168496-5-martin.kepplinger@puri.sm>
In-Reply-To: <20210531120737.168496-1-martin.kepplinger@puri.sm>
References: <20210531120737.168496-1-martin.kepplinger@puri.sm>
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

